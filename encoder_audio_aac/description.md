
For information on the AAC encoder settings:
[FFmpeg - AAC Encoder](https://trac.ffmpeg.org/wiki/Encode/AAC)

--- 

This Plugin will automatically manage bitrate for you. 

As a rule of thumb, for audible transparency, use 64 kBit/s for each channel (so 128 kBit/s for stereo, 384 kBit/s for 5.1 surround sound). 

This Plugin will detect the number of channels in each stream and apply a bitrate in accordance with this rule.

---

### Config description:

#### <span style="color:blue">Write your own FFmpeg params</span>
This free text input allows you to write any FFmpeg params that you want. 
This is for more advanced use cases where you need finer control over the file transcode.

###### Note:
These params are added in three different places:
1. After the default main options.
   ([Main Options Docs](https://ffmpeg.org/ffmpeg.html#Main-options))
1. After the input file has been specified.
   ([Advanced Options Docs](https://ffmpeg.org/ffmpeg.html#Advanced-options))
1. After the audio is mapped and the encoder is selected.
   ([Audio Options Docs](https://ffmpeg.org/ffmpeg.html#Audio-Options))
   ([Advanced Audio Options Docs](https://ffmpeg.org/ffmpeg.html#Advanced-Audio-options))

```
ffmpeg \
    -hide_banner \
    -loglevel info \
    -strict -2 \
    <CUSTOM MAIN OPTIONS HERE> \
    -i /path/to/input/video.mkv \
    <CUSTOM ADVANCED OPTIONS HERE> \
    -map 0:0 -map 0:1 \
    -c:v:0 copy \
    -c:a:0 aac \
    <CUSTOM AUDIO OPTIONS HERE> \
    -y /path/to/output/video.mkv 
```

