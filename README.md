# ffmpeg-win-arm64
FFmpeg builds for Windows ARM64

## Releases
https://github.com/tordona/ffmpeg-win-arm64/releases/tag/8.0

https://github.com/tordona/ffmpeg-win-arm64/releases/tag/7.1.2

See [releases](https://github.com/tordona/ffmpeg-win-arm64/releases) section for older or pre-releases

## Builds
There are a few variants offered. The essentials build variant contains commonly used libraries, whereas the full build variant also contains most of the remainder. See the libraries section for a list. All variants contain all internal components available for Windows. If you're downloading a package to support features in a program like Shotcut or Adacity, the essentials shared build is sufficient.

## Libraries

libraries in essentials build  
`
avisynth  vapoursynth  libaom  libass  libfreetype  libfribidi  libharfbuzz  libgme  libgsm  libmp3lame  libopencore-amrnb  libopencore-amrwb  libopenjpeg  libopenmpt  libopus  librubberband  libspeex  libsrt  libssh  libtheora  libvidstab  libvmaf  libvo-amrwbenc  libvorbis  libvpx  libwebp  libx264  libx265  libxvid  libzimg  libzmq  mediafoundation  openal  sdl2
`

additional libraries in full build  
`
chromaprint  frei0r  ladspa  lcms2  libaribb24  libaribcaption  libbluray  libbs2b  libcaca  libcdio  libcodec2  libdav1d  libdvdnav  libdvdread  libilbc  libjxl  liblc3  libmodplug  libmysofa  libplacebo  libqrencode  librav1e  librist  libshaderc  libshine  libsnappy  libsoxr  libsvtav1  libtwolame  libxevd  libxeve  libzvbi  opencl  vulkan  whisper liboapv
`

libraries not yet supported  
`
libdavs2
libflite
liblensfun
libquirc
libuavs3d
libxavs2
`

hardware-support libraries in all builds  
`
amf d3d11va d3d12va dxva2 vaapi
`

## Compilation 

* Windows 11 24H2 LTSC
* Lenovo IdeaPad 5x
* ThinkPad X13s Gen 1
* [MSYS 2](https://www.msys2.org)
* [Additional MSYS PKGBUILDs](https://github.com/tordona/MINGW-packages)

---
### Links
Essential and Full builds are inspired by [https://www.gyan.dev/ffmpeg/builds/](https://www.gyan.dev/ffmpeg/builds/)  
Visit for all other Windows x64 FFmpeg variants
