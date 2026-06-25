[![ffmpeg-win-arm64-auto-builds](https://github.com/tordona/ffmpeg-win-arm64/actions/workflows/main.yml/badge.svg)](https://github.com/tordona/ffmpeg-win-arm64/actions/workflows/main.yml)

# ffmpeg-win-arm64
FFmpeg builds for Windows on ARM (Qualcomm Snapdragon / ARM64)

* Qualcomm Snapdragon 850
* Qualcomm Snapdragon 7c
* Qualcomm Snapdragon 8cx
* Qualcomm Snapdragon X
* Microsoft SQ Series

## Stable Releases
Stable releases are based on the last two major releases, including current minor and patch versions.

* [FFmpeg v8.1.2](https://github.com/tordona/ffmpeg-win-arm64/releases/tag/8.1.2)
* [FFmpeg v7.1.5](https://github.com/tordona/ffmpeg-win-arm64/releases/tag/7.1.5)

## Latest Release
The latest release provides consistent URLs that always point to the most recent successful daily build.

* [Download Latest Build](https://github.com/tordona/ffmpeg-win-arm64/releases/latest)

## Daily Releases
Daily releases are automatically built based on the latest GitHub commits. These are available for up to 14 days.

## Builds
There are a few variants offered:
* **Essentials:** Contains commonly used libraries. This is usually sufficient for features in programs like Shotcut or Audacity.
* **Full:** Contains the essentials plus most remaining libraries.

Both variants include all internal components available for Windows. See the [Libraries](#libraries) section for a full list.

## Libraries

### Libraries in Essentials Build
`avisynth  vapoursynth  libaom  libass  libfreetype  libfribidi  libharfbuzz  libgme  libgsm  libmp3lame  libopencore-amrnb  libopencore-amrwb  libopenjpeg  libopenmpt  libopus  librubberband  libspeex  libsrt  libssh  libtheora  libvidstab  libvmaf  libvo-amrwbenc  libvorbis  libvpx  libwebp  libx264  libx265  libxvid  libzimg  libzmq  mediafoundation  openal  sdl2`. 

### Additional Libraries in Full Build  
`
cairo chromaprint  frei0r  ladspa  lcms2  libaribb24  libaribcaption  libbluray  libbs2b  libcaca  libcdio  libcodec2  libdav1d  libdvdnav  libdvdread  libilbc  libjxl  liblc3  libmodplug  libmysofa liboapv libplacebo  libqrencode  librav1e  librist  libshaderc  libshine  libsnappy  libsoxr  libsvtav1  libtwolame  libxevd  libxeve  libzvbi  opencl  vulkan  whisper
`
### Libraries Not Yet Supported 
`
libdavs2 libflite liblensfun libquirc libuavs3d libxavs2
`
### Hardware-Support Libraries (All Builds)
`
amf cuda cuvid d3d11va d3d12va dxva2 nvdec nvenc vaapi
`

## Library Versions
Library version details are documented in the readme.txt file within each respective archive.

## Building from source
See [BUILDING.md](BUILDING.md)

## Additional Resources 

* [FFmpeg](https://www.ffmpeg.org) - Official Website
* [MSYS2](https://www.msys2.org) - Software Distribution and Building Platform for Windows
* [Additional MSYS PKGBUILDs](https://github.com/tordona/mingw-packages) - Modified Packages for FFmpeg building on Windows
* [CODEX FFMPEG](https://www.gyan.dev/ffmpeg/builds/) - Visit for all other Windows x64 FFmpeg variants
* [FFmpeg-Builds](https://github.com/BtbN/FFmpeg-Builds) - Builds of FFmpeg for Windows and Linux
* [https://osxexperts.net](https://osxexperts.net) - FFmpeg static build for macOS 


