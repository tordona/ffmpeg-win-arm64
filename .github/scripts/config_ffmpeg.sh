generic_options=$(jq -r '.options.generic | map("--\(.status)-\(.option)") | join(" ")' ../config/options.json)
ffmpeg_lib_options=$(jq -r --arg version "$target_version" '[.options.standard[], .options.essentials[] | .[] | select(.version <= $version) | "--enable-" + .option] | join(" ")' ../config/options.json)
if [[ "${build_type}" == "full" ]]; then
  ffmpeg_lib_options+=" "
  ffmpeg_lib_options+=$(jq -r --arg version "$target_version" '[.options.full[] | .[] | select(.version <= $version) | "--enable-" + .option] | join(" ")' ../config/options.json)
fi
echo "${build_config} ${generic_options} ${ffmpeg_lib_options}" | xargs ./configure