## Compiling FFmpeg for Windows using MSYS2 Environment  
This is a general walk-through for compiling a local build of FFmpeg on Microsoft Windows. This guide specifically targets the ARM64 architecture, but can be applied to x64 with slight modifications.

## Prerequisites

* **Hardware:** A device running Windows on ARM.
  * Snapdragon 7c Gen 2
  * Snapdragon 8cx
  * Snapdragon Elite
  * Microsoft SQ series
* **OS:** [Windows 11 ARM](https://www.microsoft.com/en-us/software-download/windows11arm64) (build 24H2 or later recommended]
* **Environment:** [MSYS2](https://www.msys2.org/)
* **Source:** [https://git.ffmpeg.org/ffmpeg.git](https://git.ffmpeg.org/ffmpeg.git)

## General Compilation Steps

### 1. Install Required MSYS2 Environment
Visit the [MSYS2 ARM64 Documentation](https://www.msys2.org/docs/arm64/) for specific installation instructions and download links.

> [!IMPORTANT]
> Unless otherwise noted, all commands must be executed within the **`CLANGARM64`** shell environment.

### 2. Launch and Update Environment Tools
1. Execute `clangarm64.exe` located in your MSYS2 installation directory.
2. Update the package database and core system packages:
   ```bash
   pacman -Suy
   ```

### 3. Install tooling and dependencies  
Several basic development tools, compilers, and libraries are needed to begin. Use `pacman` to install the following items.

Standard packages:
   ```
   pacman -S gcc git make
   ```

Architecture-specific packages:
```
pacman -S mingw-w64-clang-aarch64-{toolchain,gcc-compat,diffutils,libssh2,texinfo}
```
  
### 4. Download the source code
Clone the official repository using Git:  
```
git clone https://git.ffmpeg.org/ffmpeg.git ffmpeg
```

### 5. Create a build directory  
It is recommended to create a separate directory to store the compiled FFmpeg build outside of the source tree.
```
mkdir $HOME/ffmpeg_builds
```

### 6. Configure FFmpeg
Run the `configure` script inside the source directory to prepare the build environment. We use the `--prefix` option to specify the installation path and flags to link libraries statically.

```
cd ffmpeg
./configure --prefix='$HOME/ffmpeg_builds' --extra-libs='-static' --pkg-config-flags='--static'
```

> [!NOTE]
> Be patient. The `configure` process may take several minutes to finish before any status change

### 7. Compile the Source  
Start the compilation by calling `make`. The -`j$(nproc)` argument utilizes all available processing units on your device to speed up the build.
```
make -j$(nproc)
```

### 8. Install  
Run the `install` directive to move the compiled binaries to your specified prefix directory ($HOME/ffmpeg_builds).
```
make install
```

### 9. Verify the Installation
Check the newly created executable to ensure the compilation was successful.
1. Test the version output:
   ```
   cd $HOME/ffmpeg_builds/bin
   ./ffmpeg.exe -version
   ```  
   > :memo: **Expected Result:** Output should indicate `ffmpeg version N-[version_string]`


2. Verify the binary architecture:  
   ```bash
   file ffmpeg.exe
   ```
   > :memo: **Expected Result:** Output should indicate `_PE32+ executable for MS Windows 6.00 (console), ARM64`  
<br>

### 10. Congratulations
If the version information appears and binary architecture is correct, you have successfully created a simplified version of FFmpeg optimized specifically for your Windows ARM device.

## Customization
To see a full list of available options, run `./configure --help`. To enable a specific library, the dependencies must be installed via `pacman` first.

Example: Enabling MP3 support (libmp3lame)  
1. Install the library:
   ```
   pacman -S mingw-w64-clang-aarch64-lame
   ```

2. Add the switch to your configuration:
   ```
   ./configure [...other-options and flags] --enable-libmp3lame
   ```

## Package Mappings
The following table provides a partial mapping of FFmpeg options to their corresponding MSYS2 packages.

Usage:
* FFmpeg Option: `--enable-[Option]`
* MSYS2 Package: `pacman -S mingw-w64-clang-aarch64-[Package]`

<table>
  <thead>
     <tr>
        <th>FFmpeg Option</th>
        <th>Min Version</th>
        <th>Max Version</th>
        <th>MSYS2 Package</th>
        <th>Static</th>
     </tr>
  </thead>
  <tbody>
      <tr>
        <td>amf</td>
        <td>7</td>
        <td> </td>
        <td>amf-headers</td>
        <td>✅</td>
     </tr>
      <tr>
        <td>avisynthplus</td>
        <td>7</td>
        <td> </td>
        <td> </td>
        <td>☑️</td>
     </tr>
     <tr>
        <td>cairo</td>
        <td>8.1</td>
        <td> </td>
        <td>cairo</td>
        <td>✅</td>
     </tr>
     <tr>
        <td>chromaprint</td>
        <td>7</td>
        <td> </td>
        <td>chromaprint</td>
        <td>❎☑️</td>
     </tr>
     <tr>
        <td>cuda-llvm</td>
        <td>9</td>
        <td> </td>
        <td>ffnvcodec-headers</td>
        <td>✅</td>
     </tr>
     <tr>
        <td>cuvid</td>
        <td>9</td>
        <td> </td>
        <td>ffnvcodec-headers</td>
        <td>✅</td>
     </tr>
     <tr>
        <td>fontconfig</td>
        <td>7</td>
        <td> </td>
        <td>fontconfig</td>
        <td>❎☑️</td>
     </tr>
     <tr>
        <td>ffnvcodec</td>
        <td>9</td>
        <td> </td>
        <td>ffnvcodec-headers</td>
        <td>✅</td>
     </tr>
     <tr>
        <td>frei0r</td>
        <td>7</td>
        <td> </td>
        <td>frei0r-plugins</td>
        <td>✅</td>
     </tr>
     <tr>
        <td>gmp</td>
        <td>7</td>
        <td> </td>
        <td>gmp</td>
        <td>✅</td>
     </tr>
     <tr>
        <td>gnutls</td>
        <td>7</td>
        <td> </td>
        <td>gnutls</td>
        <td>✅</td>
     </tr>
     <tr>
        <td>ladspa</td>
        <td>7</td>
        <td> </td>
        <td>ladspa-sdk</td>
        <td>✅</td>
     </tr>
     <tr>
        <td>ladspa</td>
        <td>7</td>
        <td> </td>
        <td>dlfcn</td>
        <td>✅</td>
     </tr>
     <tr>
        <td>lcms2</td>
        <td>7</td>
        <td> </td>
        <td>lcms2</td>
        <td>✅</td>
     </tr>
     <tr>
        <td>libaom</td>
        <td>7</td>
        <td> </td>
        <td>aom</td>
        <td>✅</td>
     </tr>
     <tr>
        <td>libaribb24</td>
        <td>7</td>
        <td> </td>
        <td>aribb24</td>
        <td>❎☑️</td>
     </tr>
     <tr>
        <td>libaribcaption</td>
        <td>7</td>
        <td> </td>
        <td>libaribcaption</td>
        <td>❎☑️</td>
     </tr>
     <tr>
        <td>libass</td>
        <td>7</td>
        <td> </td>
        <td>libass</td>
        <td>✅</td>
     </tr>
     <tr>
        <td>libbluray</td>
        <td>7</td>
        <td> </td>
        <td>libbluray</td>
        <td>❎☑️</td>
     </tr>
     <tr>
        <td>libbs2b</td>
        <td>7</td>
        <td> </td>
        <td>libbs2b</td>
        <td>✅</td>
     </tr>
     <tr>
        <td>libcdio</td>
        <td>7</td>
        <td> </td>
        <td>libcdio</td>
        <td>✅</td>
     </tr>
     <tr>
        <td>libcdio</td>
        <td>7</td>
        <td> </td>
        <td>libcdio-paranoia</td>
        <td>✅</td>
     </tr>
     <tr>
        <td>libcodec2</td>
        <td>7</td>
        <td> </td>
        <td>codec2</td>
        <td>❎☑️</td>
     </tr>
     <tr>
        <td>libdav1d</td>
        <td>7</td>
        <td> </td>
        <td>dav1d</td>
        <td>✅</td>
     </tr>
     <tr>
        <td>libdvdnav</td>
        <td>7</td>
        <td> </td>
        <td>libdvdnav</td>
        <td>✅</td>
     </tr>
     <tr>
        <td>libdvdread</td>
        <td>7</td>
        <td> </td>
        <td>libdvdread</td>
        <td>✅</td>
     </tr>
     <tr>
        <td>libfreetype</td>
        <td>7</td>
        <td> </td>
        <td>freetype</td>
        <td>❎☑️</td>
     </tr>
     <tr>
        <td>libfribidi</td>
        <td>7</td>
        <td> </td>
        <td>fribidi</td>
        <td>✅</td>
     </tr>
     <tr>
        <td>libgme</td>
        <td>7</td>
        <td> </td>
        <td>libgme</td>
        <td>✅</td>
     </tr>
     <tr>
        <td>libgsm</td>
        <td>7</td>
        <td> </td>
        <td>gsm</td>
        <td>✅</td>
     </tr>
     <tr>
        <td>libharfbuzz</td>
        <td>7</td>
        <td> </td>
        <td>harfbuzz</td>
        <td>❎☑️</td>
     </tr>
     <tr>
        <td>libilbc</td>
        <td>7</td>
        <td> </td>
        <td>libilbc</td>
        <td>❎☑️</td>
     </tr>
     <tr>
        <td>libjxl</td>
        <td>7</td>
        <td> </td>
        <td>libjxl</td>
        <td>❎☑️</td>
     </tr>
     <tr>
        <td>libkvazaar</td>
        <td>7</td>
        <td> </td>
        <td>kvazaar</td>
        <td>❎☑️</td>
     </tr>
     <tr>
        <td>liblc3</td>
        <td>7</td>
        <td> </td>
        <td>liblc3</td>
        <td>✅</td>
     </tr>
     <tr>
        <td>libmodplug</td>
        <td>7</td>
        <td> </td>
        <td>libmodplug</td>
        <td>❎☑️</td>
     </tr>
     <tr>
        <td>libmp3lame</td>
        <td>7</td>
        <td> </td>
        <td>lame</td>
        <td>✅</td>
     </tr>
     <tr>
        <td>libmysofa</td>
        <td>7</td>
        <td> </td>
        <td>libmysofa</td>
        <td>✅</td>
     </tr>
     <tr>
        <td>liboapv</td>
        <td>8</td>
        <td> </td>
        <td>openapv</td>
        <td>✅</td>
     </tr>
     <tr>
        <td>libopencore-amrnb</td>
        <td>7</td>
        <td> </td>
        <td>opencore-amr</td>
        <td>✅</td>
     </tr>
     <tr>
        <td>libopencore-amrwb</td>
        <td>7</td>
        <td> </td>
        <td>opencore-amr</td>
        <td>✅</td>
     </tr>
     <tr>
        <td>libopenh264</td>
        <td>7</td>
        <td> </td>
        <td>openh264</td>
        <td>❎☑️</td>
     </tr>
     <tr>
        <td>libopenjpeg</td>
        <td>7</td>
        <td> </td>
        <td>openjpeg2</td>
        <td>✅</td>
     </tr>
     <tr>
        <td>libopenmpt</td>
        <td>7</td>
        <td> </td>
        <td>libopenmpt</td>
        <td>✅</td>
     </tr>
     <tr>
        <td>libopus</td>
        <td>7</td>
        <td> </td>
        <td>opus</td>
        <td>✅</td>
     </tr>
     <tr>
        <td>libplacebo</td>
        <td>7</td>
        <td> </td>
        <td>libplacebo</td>
        <td>❎☑️</td>
     </tr>
     <tr>
        <td>libqrencode</td>
        <td>7</td>
        <td> </td>
        <td>qrencode</td>
        <td>❎☑️</td>
     </tr>
     <tr>
        <td>librav1e</td>
        <td>7</td>
        <td> </td>
        <td>rav1e</td>
        <td>✅</td>
     </tr>
     <tr>
        <td>librist</td>
        <td>7</td>
        <td> </td>
        <td>librist</td>
        <td>✅</td>
     </tr>
     <tr>
        <td>librubberband</td>
        <td>7</td>
        <td> </td>
        <td>rubberband</td>
        <td>❎☑️</td>
     </tr>
     <tr>
        <td>libshaderc</td>
        <td>7</td>
        <td>8.1</td>
        <td>shaderc</td>
        <td>❎☑️</td>
     </tr>
     <tr>
        <td>libshine</td>
        <td>7</td>
        <td> </td>
        <td>shine</td>
        <td>✅</td>
     </tr>
     <tr>
        <td>libsnappy</td>
        <td>7</td>
        <td> </td>
        <td>snappy</td>
        <td>✅</td>
     </tr>
     <tr>
        <td>libsoxr</td>
        <td>7</td>
        <td> </td>
        <td>libsoxr</td>
        <td>❎☑️</td>
     </tr>
     <tr>
        <td>libspeex</td>
        <td>7</td>
        <td> </td>
        <td>speex</td>
        <td>✅</td>
     </tr>
     <tr>
        <td>libsrt</td>
        <td>7</td>
        <td> </td>
        <td>srt</td>
        <td>✅</td>
     </tr>
     <tr>
        <td>libssh</td>
        <td>7</td>
        <td> </td>
        <td>libssh</td>
        <td>❎☑️</td>
     </tr>
     <tr>
        <td>libsvtav1</td>
        <td>7</td>
        <td> </td>
        <td>svt-av1</td>
        <td>✅</td>
     </tr>
     <tr>
        <td>libtheora</td>
        <td>7</td>
        <td> </td>
        <td>libtheora</td>
        <td>✅</td>
     </tr>
     <tr>
        <td>libtwolame</td>
        <td>7</td>
        <td> </td>
        <td>twolame</td>
        <td>✅</td>
     </tr>
     <tr>
        <td>libvidstab</td>
        <td>7</td>
        <td> </td>
        <td>vid.stab</td>
        <td>❎☑️</td>
     </tr>
     <tr>
        <td>libvmaf</td>
        <td>7</td>
        <td> </td>
        <td>vmaf</td>
        <td>❎☑️</td>
     </tr>
     <tr>
        <td>libvo-amrwbenc</td>
        <td>7</td>
        <td> </td>
        <td>vo-amrwbenc</td>
        <td>✅</td>
     </tr>
     <tr>
        <td>libvorbis</td>
        <td>7</td>
        <td> </td>
        <td>libvorbis</td>
        <td>✅</td>
     </tr>
     <tr>
        <td>libvpx</td>
        <td>7</td>
        <td> </td>
        <td>libvpx</td>
        <td>✅</td>
     </tr>
     <tr>
        <td>libvvenc</td>
        <td>7</td>
        <td> </td>
        <td> </td>
        <td>☑️</td>
     </tr>
     <tr>
        <td>libwebp</td>
        <td>7</td>
        <td> </td>
        <td>libwebp</td>
        <td>✅</td>
     </tr>
     <tr>
        <td>libx264</td>
        <td>7</td>
        <td> </td>
        <td>libx264</td>
        <td>✅</td>
     </tr>
     <tr>
        <td>libx265</td>
        <td>7</td>
        <td> </td>
        <td>x265</td>
        <td>✅</td>
     </tr>
     <tr>
        <td>libxevd</td>
        <td>7</td>
        <td> </td>
        <td>xevd</td>
        <td>❎☑️</td>
     </tr>
     <tr>
        <td>libxeve</td>
        <td>7</td>
        <td> </td>
        <td>xeve</td>
        <td>❎☑️</td>
     </tr>
     <tr>
        <td>libxvid</td>
        <td>7</td>
        <td> </td>
        <td>xvidcore</td>
        <td>✅</td>
     </tr>
     <tr>
        <td>libzimg</td>
        <td>7</td>
        <td> </td>
        <td>zimg</td>
        <td>❎☑️</td>
     </tr>
     <tr>
        <td>libzmq</td>
        <td>7</td>
        <td> </td>
        <td>zeromq</td>
        <td>❎☑️</td>
     </tr>
     <tr>
        <td>libzvbi</td>
        <td>7</td>
        <td> </td>
        <td>zvbi</td>
        <td>✅</td>
     </tr>
     <tr>
        <td>mediafoundation</td>
        <td>7</td>
        <td> </td>
        <td>qt6-multimedia-wmf</td>
        <td>✅</td>
     </tr>
     <tr>
        <td>nvdec</td>
        <td>9</td>
        <td> </td>
        <td>ffnvcodec-headers</td>
        <td>✅</td>
     </tr>
     <tr>
        <td>nvenc</td>
        <td>9</td>
        <td> </td>
        <td>ffnvcodec-headers</td>
        <td>✅</td>
     </tr>
     <tr>
        <td>openal</td>
        <td>7</td>
        <td> </td>
        <td>openal</td>
        <td>❎☑️</td>
     </tr>
     <tr>
        <td>opencl</td>
        <td>7</td>
        <td> </td>
        <td>opencl-icd</td>
        <td>❎☑️</td>
     </tr>
     <tr>
        <td>sdl2</td>
        <td>7</td>
        <td> </td>
        <td>SDL2</td>
        <td>✅</td>
     </tr>
      <tr>
        <td>vaapi</td>
        <td>7</td>
         <td> </td>
        <td>libva</td>
        <td>✅</td>
     </tr>
     <tr>
        <td>vapoursynth</td>
        <td>7</td>
        <td> </td>
        <td>vapoursynth</td>
        <td>✅</td>
     </tr>
     <tr>
        <td>vulkan</td>
        <td>7</td>
        <td> </td>
        <td>vulkan-loader</td>
        <td>❎☑️</td>
     </tr>
     <tr>
        <td>whisper</td>
        <td>8</td>
        <td>8.1</td>
        <td>whisper.cpp</td>
        <td>❎☑️</td>
     </tr>
  </tbody>
</table>

<table>
   <thead>
      <tr>
         <th>Status</th>
         <th align="left">Explaination</th>
      </tr>
   </thead>
   <tbody>
      <tr>
         <td>✅</td>
         <td>Package available. No known issues</td>
      </tr>
      <tr>
         <td>❎</td>
         <td>Package available. Static linking may not work correctly</td>
      </tr>
      <tr>
         <td>☑️</td>
         <td>Source code or 3rd-party package</td>
      </tr>
   </tbody>
</table>

## Additional Resources
* [Official FFmpeg Compilation Guide](https://trac.ffmpeg.org/wiki/CompilationGuide)  
* [FFmpeg Subreddit](https://www.reddit.com/r/ffmpeg/)

## Third Party Packages
* [https://github.com/tordona/mingw-packages](https://github.com/tordona/mingw-packages) - Modified package scripts for MinGW-w64
