ff_libs=(
  "libavcodec"
  "libavdevice"
  "libavfilter"
  "libavformat"
  "libavutil"
  "libswresample"
  "libswscale"
)
declare -a ff_lib_versions
ff_lib_versions+=("**Library Versions**")
ff_lib_versions+=("")
ff_lib_versions+=("| library | version | | |")
ff_lib_versions+=("| -- | -- | -- | -- |")
for lib in "${ff_libs[@]}"; do
  file="${lib}.version"
  path=$(find . -type f -name "$file" -printf "%P\n")
  if [[ -n $path ]]; then
    version_string="$(head -1 ${path})"
    version_string="${version_string//lib/| lib}"
    version_string="${version_string//_VERSION=/ | }"
    version_string="${version_string//./ | } |"
    echo "📢 ${version_string}"
    ff_lib_versions+=("${version_string}")
  fi
done
printf "%s\n" "${ff_lib_versions[@]}" > "$output_path/library_versions.md"