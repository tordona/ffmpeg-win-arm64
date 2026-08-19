echo "📢 Resource Edit FFmpeg FFplay FFprobe"

product_version="$github_tag"
file_version="$product_version"
copyright="Copyright © 2000-$(date '+%Y') the FFmpeg developers"
ffmpeg_desc="Tool to convert multimedia files between formats"
ffplay_desc="Simple media player based on SDL and the FFmpeg libraries"
ffprobe_desc="Simple multimedia stream analyzer"

ff_progs=(
  "ffmpeg"
  "ffplay"
  "ffprobe"
)

for str in "${product_version[@]}"; do
  if [[ $str =~ ([0-9]+\.[0-9]+(\.[0-9]+)?) ]]; then
    file_version="${BASH_REMATCH[1]}"
  fi
done

for ff in "${ff_progs[@]}"; do
  desc=$ff
  desc+="_desc"
  file=$(find . -name "${ff}.exe" ! -path '*/source/*' -exec realpath {} \;)
  icon=$(find . -name "${ff}.ico" ! -path '*/assets/*' -exec realpath {} \;)
  if [[ -n "$file" ]]; then
    product_prefix=${ff:0:2}
    product_suffix=${ff:2}
    rcedit $file --set-version-string "FileDescription" "${product_prefix^^}${product_suffix}"
    rcedit $file --set-file-version "${file_version}"
    rcedit $file --set-version-string "ProductName" "${product_prefix^^}${product_suffix}"
    rcedit $file --set-version-string "ProductVersion" "${product_version}"
    rcedit $file --set-version-string "LegalCopyright" "${copyright}"
    if [[ -n "$icon" ]]; then
      rcedit $file --set-icon $icon
      rm $icon
    fi
  fi
done