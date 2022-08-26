#!/bin/bash
# -
# File: pull_in_my_plugins.sh
# Project: unmanic-plugins
# File Created: Sunday, 22nd August 2021 11:38:59 pm
# Author: Josh.5 (jsunnex@gmail.com)
# -----
# Last Modified: Monday, 25th October 2021 7:31:03 pm
# Modified By: Josh.5 (jsunnex@gmail.com)
# -

repo_root_path=$(readlink -e $(dirname "${BASH_SOURCE[0]}")/)

plugin_ids=(
    "create_stereo_audio_clone"
    "dts_to_dd"
    "ffmpeg_file_error_checker"
    "ignore_video_file_over_resolution"
    "ignore_video_file_under_resolution"
    "replicate_source_file_stats"
    "tdarr_plugin_runner"
    "video_library_stats"
    "video_remuxer_aio_webm"
)

pushd "${repo_root_path}" &> /dev/null


for plugin_id in "${plugin_ids[@]}"; do

    echo "Processing plugin ${plugin_id}"
    tmp_dir=$(mktemp -d --suffix='-unmanic-plugin')

    # Clone plugin to temp directory
    echo -e "\n*** Cloning plugin git repo to '${tmp_dir}/${plugin_id}'"
    git clone --depth=1 --branch master --single-branch "git@github.com:Josh5/unmanic.plugin.${plugin_id}" "${tmp_dir}/${plugin_id}"
    pushd "${tmp_dir}/${plugin_id}" &> /dev/null

    # Pull files from plugin to this source directory
    echo -e "\n*** Pulling plugin submodules"
    git submodule update --init --recursive

    # Apply all patches
    if [[ -d ./patches ]]; then
        echo -e "\n*** Patching project"
        find ./patches -type f -name "*.patch" -exec patch -p1 --input="{}" --forward --verbose \;
    fi

    # Install/update plugin files
    echo -e "\n*** Installing files from plugin git repo to this repository's source directory"
    rsync -avh --delete \
        --exclude='.git/' \
        --exclude='.gitmodules' \
        --exclude='.idea/' \
        "${tmp_dir}/${plugin_id}/" "${repo_root_path}/source/${plugin_id}"

    popd &> /dev/null

done

popd &> /dev/null
