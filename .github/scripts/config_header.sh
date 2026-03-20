config_file="config.h"
if [[ -f "$config_file" ]]; then
  sed -i "s|\s--extra-cflags='-march=native'||gI" $config_file
  sed -i "s|\s--extra-cflags=-DLIBTWOLAME_STATIC||gI" $config_file
  sed -i "s|\s--extra-cflags=-DCAIRO_WIN32_STATIC_BUILD||gI" $config_file
  sed -i "s|\s--extra-cflags=-DMODPLUG_STATIC||gI" $config_file
  sed -i "s|\s--extra-ldflags='-Wl,--allow-multiple-definition'||gI" $config_file
  sed -i "s|\s--disable-manpages||gI" $config_file
  sed -i "s|\s--disable-podpages||gI" $config_file
  sed -i "s|\s--disable-txtpages||gI" $config_file
  sed -i "s|\s--datadir=$output_path\/$version_name\/presets||gI" $config_file
  sed -i "s|\s--prefix=$output_path\/$version_name||gI" $config_file
  sed -i "s|\s--docdir=$output_path\/$version_name\/docs||gI" $config_file
  sed -i "s|\s--libdir=$output_path\/dump\/libs||gI" $config_file
  sed -i "s|\s--incdir=$output_path\/dump\/include||gI" $config_file
  echo "📢"
  echo "$(head -n 25 $config_file)"
  echo ""
fi
if [[ -f "$build_file_ref" ]]; then
  sed -i -r "/((\w+\/)?(\w+\.\w{1,}){1,} is unchanged)/d" $build_file_ref
  sed -i -r "/^install prefix/d" $build_file_ref
  sed -i "1s|^|release-$build_type-$link_type build configuration\n\n|" $build_file_ref
  sed -i "1s|^|Source Code: $source_repo/commit/$commit\n\n|" $build_file_ref
  sed -i "1s|^|License: GPL v3\n\n|" $build_file_ref
  sed -i "1s|^|Version: $version_name\n\n|" $build_file_ref
  sed -i "1s|^|FFmpeg ARM64 ${build_type^} ${link_type^} Windows Build from $git_dist_repo\n\n|" $build_file_ref
  echo "📢"
  echo "$(head -n 25 $build_file_ref)"
fi