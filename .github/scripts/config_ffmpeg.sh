is_daily_build=$([[ "$release_tag" == *"daily-autobuild"* ]] && echo "true" || echo "false")

generic_options=$(jq -r '.options.generic | map("--\(.status)-\(.option)") | join(" ")' ../config/options.json)
ffmpeg_lib_options="$(jq -r \
  --arg version "$target_version" \
  --argjson is_daily_build "$is_daily_build" '
  [
    .options.standard[], .options.essentials[] 
    | .[] 
    | select(
        .version <= $version and 
        (if has("max") then $version <= .max else true end) and
        (if $is_daily_build and has("daily") then false else true end)
      ) 
    | "--enable-" + .option
  ] 
  | join(" ")
' ../config/options.json)"
if [[ "${build_type}" == "full" ]]; then
  ffmpeg_lib_options+=" "
  ffmpeg_lib_options+="$(jq -r \
    --arg version "$target_version" \
    --argjson is_daily_build "$is_daily_build" '
    [
      .options.full[] 
      | .[] 
      | select(
          .version <= $version and 
          (if has("max") then $version <= .max else true end) and
          (if $is_daily_build and has("daily") then false else true end)
        ) 
      | "--enable-" + .option
    ] 
    | join(" ")
  ' ../config/options.json)"
fi
echo "${build_config} ${generic_options} ${ffmpeg_lib_options}" | xargs ./configure