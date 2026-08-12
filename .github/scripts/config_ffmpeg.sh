is_daily_build=$([[ "$release_tag" == *"daily-autobuild"* ]] && echo "true" || echo "false")

generic_options=$(jq -r '.options.generic | map("--\(.status)-\(.option)") | join(" ")' ../config/options.json)
ffmpeg_lib_options="$(jq -r \
  --arg version "$target_version" \
  --argjson is_daily_build "$is_daily_build" '
  [
    .options.standard[], .options.essentials[] 
    | .[] 
    | select(
        .version.min <= $version and 
        (if (.version | has("max")) then $version <= .version.max else true end) and
        (if $is_daily_build and has("daily") then (.daily | ascii_downcase) == "true" else true end)
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
          .version.min <= $version and 
          (if (.version | has("max")) then $version <= .version.max else true end) and
          (if $is_daily_build and has("daily") then (.daily | ascii_downcase) == "true" else true end)
        ) 
      | "--enable-" + .option
    ] 
    | join(" ")
  ' ../config/options.json)"
fi
echo "📢 ${build_config} ${generic_options} ${ffmpeg_lib_options}"
echo "${build_config} ${generic_options} ${ffmpeg_lib_options}" | xargs ./configure | tee ${build_file_ref}
# declare -a verified_lib_options=()
# for option in $generic_options $full_lib_options; do
#   flag="${option#--*able}"
#   if grep -Eq -- "  --(enable|disable)$flag" "configure"; then
#       verified_lib_options+=("$option")
#   fi
# done
# echo "${build_config} ${verified_lib_options[@]}" | xargs ./configure