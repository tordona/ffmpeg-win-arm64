# ffmpeg-win-arm64
FFmpeg builds for Windows ARM64

### Releases
See [releases](https://github.com/tordona/ffmpeg-win-arm64/releases) section

### Builds
There are a few variants offered. The essentials build variant contains commonly used libraries, whereas the full build variant also contains most of the remainder. See the libraries section for a list. All variants contain all internal components available for Windows. If you're downloading a package to support features in a program like Shotcut, the release essentials static build is sufficient.

---

### Libraries

libraries in essentials build  
```avisynthplus libaom libass libfreetype libfribidi libharfbuzz libgme libgsm libmp3lame libopencore-amrnb libopencore-amrwb libopenmpt libopus librubberband libspeex libsrt libssh libtheora libvidstab libvmaf libvo-amrwbenc libvorbis libvpx libwebp libx264 libx265 libxvid libzimg libzmq mediafoundation sdl2```

additional libraries in full build  
```chromaprint frei0r ladspa libaribb24 libaribcaption libbluray libbs2b libcaca libcdio libcodec2 libdav1d libdavs2 libflite libilbc libjxl liblensfun libmodplug libmysofa libplacebo librav1e librist libshaderc libshine libsnappy libsoxr libsvtav1 libtwolame libuavs3d libxavs2 libxevd libxeve libzvbi opencl vulkan```

libraries not yet supported  
```libcodec2 libdavs2 libflite liblensfun librist libuavs3d libxavs2 libxevd libxeve```

hardware-support libraries in all builds  
```amf d3d11va d3d12va dxva2 libvpl vaapi```

---

##### Links
Essential and Full builds are inspired by [https://www.gyan.dev/ffmpeg/builds/](https://www.gyan.dev/ffmpeg/builds/).  
Visit for all other Windows x64 FFmpeg variants.
