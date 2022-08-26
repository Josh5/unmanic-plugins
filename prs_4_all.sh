#!/bin/bash
# -
# File: prs_4_all.sh
# Project: unmanic-plugins
# File Created: Saturday, 11th September 2021 6:01:53 pm
# Author: Josh.5 (jsunnex@gmail.com)
# -----
# Last Modified: Tuesday, 28th September 2021 8:55:36 pm
# Modified By: Josh.5 (jsunnex@gmail.com)
# -

repo_root_path=$(readlink -e $(dirname "${BASH_SOURCE[0]}")/)


plugin_ids=(
    "auto_rotate_images"
    "comskip"
    "convert_subtitle_streams_ass_to_srt"
    "encoder_audio_aac"
    "encoder_audio_ac3"
    "encoder_video_h264_libx264"
    "encoder_video_h264_nvenc"
    "encoder_video_hevc_libx265"
    "encoder_video_hevc_nvenc"
    "encoder_video_hevc_qsv"
    "encoder_video_hevc_vaapi"
    "extract_srt_subtitles_to_files"
    "file_size_metrics"
    "ignore_completed_tasks"
    "ignore_files_recently_modified"
    "ignore_over_size"
    "ignore_under_size"
    "limit_library_search_by_file_extension"
    "mover2"
    "normalise_aac"
    "notify_plex"
    "notify_radarr"
    "notify_sonarr"
    "path_ignore"
    "postprocessor_script"
    "reject_files_larger_than_original"
    "remove_all_subtitles"
    "remove_audio_stream_by_language"
    "remove_image_subtitles"
    "reorder_audio_streams_by_language"
    "reorder_subtitle_streams_by_language"
    "sma"
    "strip_image_streams"
    "video_remuxer"
    "video_trim"
)


for plugin_id in "${plugin_ids[@]}"; do
    ${repo_root_path}/create_plugin_pr.sh "${plugin_id}"
done
