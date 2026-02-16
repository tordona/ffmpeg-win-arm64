echo "📢 Resource Edit FFmpeg FFplay FFprobe"
rcedit=$(find . -name "rcedit.exe" -exec realpath {} \;)
if [[ -z "$rcedit" ]]; then
  echo "📢 rcedit not found"
  exit 1
fi

version="$github_tag"
build_date=$(date '+%Y.%m.%d.0')
file_version="$build_date"
copyright="Copyright © 2000-$(date '+%Y') the FFmpeg developers"
ffmpeg_desc="A command line tool to convert multimedia files between formats"
ffplay_desc="A simple media player based on SDL and the FFmpeg libraries"
ffprobe_desc="A simple multimedia stream analyzer"

ff_progs=(
  "ffmpeg"
  "ffplay"
  "ffprobe"
)

for ff in "${ff_progs[@]}"; do
  desc=$ff
  desc+="_desc"
  file=$(find . -name "${ff}.exe" ! -path '*/source/*' -exec realpath {} \;)
  icon=$(find . -name "${ff}.ico" ! -path '*/assets/*' -exec realpath {} \;)
  if [[ -n "$file" ]]; then
    product_prefix=${ff:0:2}
    product_suffix=${ff:2}
    $rcedit $file --set-version-string "FileDescription" "${!desc}"
    $rcedit $file --set-file-version "${file_version}"
    $rcedit $file --set-version-string "ProductName" "${product_prefix^^}${product_suffix}"
    $rcedit $file --set-version-string "ProductVersion" "${version}"
    $rcedit $file --set-version-string "LegalCopyright" "${copyright}"
    if [[ -n "$icon" ]]; then
      $rcedit $file --set-icon $icon
      rm $icon
    fi
  fi
done