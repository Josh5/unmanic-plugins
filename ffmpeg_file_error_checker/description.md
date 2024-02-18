
### Config description:

#### <span style="color:blue">Enable HW Accelerated Decoding?</span>
Decode the video stream using hardware accelerated decoding. 

:::note
This plugin will test all video files. If you configure HW Accelerated decoding, then ensure you video files are compatible.
:::

Check your GPU compatibility for decoding:
 - [NVIDIA GPU compatibility table](https://developer.nvidia.com/video-encode-and-decode-gpu-support-matrix-new).
 - [INTEL CPU compatibility chart](https://en.wikipedia.org/wiki/Intel_Quick_Sync_Video#Hardware_decoding_and_encoding).


#### <span style="color:blue">Max input stream packet buffer</span>
When transcoding audio and/or video streams, ffmpeg will not begin writing into the output until it has one packet for each such stream. 
While waiting for that to happen, packets for other streams are buffered. 
This option sets the size of this buffer, in packets, for the matching output stream.

FFmpeg docs refer to this value as '-max_muxing_queue_size'


#### <span style="color:blue">Enable retesting of files?</span>
Files can be scheduled for retesting periodically. 
If this option is enabled, you will have the option to configure time frequency


#### <span style="color:blue">Frequency</span>

Times can be written as:

- **Milliseconds:** ms, millisecond, milliseconds
- **Seconds:** s, sec, secs, second, seconds
- **Minutes:** m, min, mins, minute, minutes
- **Hours:** h, hour, hours
- **Days:** d, day, days
- **Weeks:** w, week, weeks
- **Years:** y, year, years

##### Examples:

###### <span style="color:magenta">30 days</span>
'<span style="color:blue">30d</span>'
or 
'<span style="color:blue">30 days</span>'


#### <span style="color:blue">Always run this plugin against video files, even if that file was added to the task list by another plugin?</span>
When retesting is disabled, the plugin will run for every video file.

If retesting is enabled, then you have the option to only run this plugin against files that are scheduled to be retested
in accordance with the frequency specified.

---
