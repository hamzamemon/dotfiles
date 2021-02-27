#!/usr/bin/env bash
COLOR_TEXT="#dfdfdf"
COLOR_NORMAL="#50fa7b"
COLOR_WARNING="#f1fa8c"
COLOR_ALERT="#ff5555"
COLOR_END="%{F-}"

UNDERLINE_START="%{+u}"
UNDERLINE_END="%{-u}"

THRESHOLD_WARNING="50"
THRESHOLD_ALERT="75"

MSG_ID="9910494"

function showNotification() {
  if command -v dunstify &>/dev/null; then
      notify="dunstify --replace ${MSG_ID}"
  else
      notify="notify-send"
  fi
  $notify --appname "Memory Usage" \
          --urgency normal \
          --icon indicator-sensors-memory \
          "Memory Usage" \
          "$(free | grep Mem | awk '{printf("%.2fGi / %.2fGi", ($2-$7)/1024^2, $2/1024^2)}')\n\n$(ps axch -o cmd:30,pmem k -pmem | head | awk '$0=$0"%"')" &
}

function printUsage() {
  curUsage=$(free | grep Mem | awk '{printf("%.0f", ($2-$7)/$2 * 100.0)}')
  if [ "${curUsage}" -gt "${THRESHOLD_ALERT}" ]; then
    formatText="%{F${COLOR_ALERT}}"
    formatUnderline="${UNDERLINE_START}%{u${COLOR_ALERT}}"
  elif [ "${curUsage}" -gt "${THRESHOLD_WARNING}" ]; then
    formatText="%{F${COLOR_WARNING}}"
    formatUnderline="${UNDERLINE_START}%{u${COLOR_WARNING}}"
  else
    formatText="%{F${COLOR_NORMAL}}"
    formatUnderline=""
  fi
  echo "${formatUnderline}🧠 ${formatText}${curUsage}%${COLOR_END}${UNDERLINE_END}"
}

case "$1" in
    --show)
        showNotification
        ;;
    *)
        printUsage
        ;;
esac
