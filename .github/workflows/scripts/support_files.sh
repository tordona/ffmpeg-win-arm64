pwd
ls -la
if [[ ! -d "$output_path/$version_name/bin" ]] then
  mkdir -p "$output_path/$version_name/bin"
fi
if [[ -f "./source/$build_file_ref" ]]; then
  cp "./source/$build_file_ref" "$output_path/$version_name/readme.txt"
  echo "📢 copied $build_file_ref out to readme.txt"
fi
if [[ -f "./source/COPYING.GPLv3" ]]; then
  cp ./source/COPYING.GPLv3 "$output_path/$version_name/license"
  echo "📢 copied COPYING.GPLv3 out to license"
fi
if [[ -d "./assets/icons" ]]; then
  cp ./assets/icons/*.ico "$output_path/$version_name/bin"
  echo "📢 copied icons out to bin directory"
fi
