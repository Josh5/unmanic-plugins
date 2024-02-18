

For information on the VP9 encoder settings:
- [https://trac.ffmpeg.org/wiki/Encode/VP9/](https://trac.ffmpeg.org/wiki/Encode/VP9/)

---

### Config description:


#### <span style="color:blue">Encoding Mode:</span>
There are x5 available encoding modes in this plugin.

Constrained Quality (CQ) mode is recommended for file-based video (as opposed to live streaming).

Changing the *Encoding Mode* will draw upon the other settings to determine the size and quality that you get out.

Not all the follow settings are used by all *Encoding Modes*. Read the FFmpeg docs for more information.

###### Options:
- **Variable Bitrate (VBR)**
    Balances quality and bitrate over time within constraints on bitrate
    The encoder will simply try to reach the specified bit rate on average.
    This mode is recommended for streaming video-on-demand files of high-motion content (for example sports). It is well suited to HTTP-based delivery.
    The *Bitrate* option will be used as a target of video quality.
    Settings used:
    - Bitrate.
    - Deadline / Quality.
    - CPU Utilization / Speed.

- **Constant Quantizer (Q)**
        Allows you to specify a fixed quantizer value; bitrate will vary.
        Constant Quantizer mode is a good choice for scenarios where concerns about file-size and bitrate are completely subordinate to the final quality.
        Settings used:
    - Constant Rate Factor (CRF).
    - Deadline / Quality.
    - CPU Utilization / Speed.

- **Constrained Quality (CQ)**
        Allows you to set a maximum quality level. Quality may vary within bitrate parameters.
        For most content types, it is recommend to use this mode.
        Settings used:
    - Constant Rate Factor (CRF).
    - Bitrate.
    - Deadline / Quality.
    - CPU Utilization / Speed.

- **Constant Bitrate (CBR)**
        Attempts to keep the bitrate fairly constant while quality varies
        Constant Bitrate mode (CBR) is recommended for live streaming with VP9.
        The settings used are the same as VBR, however the selected bitrate will be locked.
        Settings used:
    - Bitrate.
    - Deadline / Quality.
    - CPU Utilization / Speed.


#### <span style="color:blue">Constant Rate Factor (CRF):</span>
Use this rate control mode if you want to keep the best quality and care less about the file size.

This method allows the encoder to attempt to achieve a certain output quality for the whole file when output file size is of less importance. 
This provides maximum compression efficiency with a single pass. By adjusting the so-called quantizer for each frame, it gets the bitrate it 
needs to keep the requested quality level. The downside is that you can't tell it to get a specific filesize or not go over a specific size or
bitrate, which means that this method is not recommended for encoding videos for streaming.


#### <span style="color:blue">Bitrate:</span>
The target (average) bit rate for the encoder to use.


#### <span style="color:blue">Deadline / Quality:</span>

###### Options:
- **good**
    The default and recommended for most applications.
- **best**
    Recommended if you have lots of time and want the best compression efficiency.
- **realtime**
    Recommended for live / fast encoding.


#### <span style="color:blue">CPU Utilization / Speed:</span>
Sets how efficient the compression will be.

When the deadline/quality parameter is **good** or **best**, values for -cpu-used can be set between 0 and 5. The default is 0. Using 1 or 2 will 
increase encoding speed at the expense of having some impact on quality and rate control accuracy. 4 or 5 will turn off rate distortion 
optimization, having even more of an impact on quality.

When the deadline/quality is set to realtime, the encoder will try to hit a particular CPU utilization target, and encoding quality will 
depend on CPU speed and the complexity of the clip that you are encoding.

In order to keep the plugin simple, options higher than 5 have been disabled. Let me know if you really need this and I will make it happen...
