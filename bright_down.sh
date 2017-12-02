brightness=$(cat /sys/class/backlight/intel_backlight/brightness)

if (($brightness > 500 )); then
  let brightness=$brightness-500
  echo "echo $brightness > /sys/class/backlight/intel_backlight/brightness" | sudo bash
fi
