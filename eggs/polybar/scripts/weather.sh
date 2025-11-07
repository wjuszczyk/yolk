#!/bin/sh

# To change city change the LOCATION_CODE.
LOCATION_CODE='f891a1b0151b87cddefd09e676517591820541741ba9ed94b4d438aa4254af98'
# ==============================================================================

info_to_icon() {
  case $1 in
  #        'Sunny')
  #            echo '☀ ';;
  #        'Night Clear' | 'Clear Night')
  #            echo ' ';;
  #        'Mostly Sunny')
  #            echo ' ';;
  #        'Partly Cloudy' | 'Partly Cloudy Day' | 'Mostly Clear Day')
  #            echo ' ';;
  #        'Partly Cloudy Night')
  #            echo ' ';;
  #        'Mostly Cloudy' | 'Mostly Cloudy Day')
  #            echo ' ';;
  #        'Mostly Cloudy Night')
  #            echo ' ';;
  #        'Cloudy')
  #            echo ' ';;
  #        'Scattered Showers' | 'Showers')
  #            echo ' ';;
  #        'Rain' | 'Isolated Thunderstorms' | 'Scattered Thunderstorms')
  #            echo ' ';;
  #        'Foggy')
  #            echo ' ';;
  #        'Rain and Snow')
  #            echo '  ';;
  #        'Snow')
  #            echo ' ';;
  #        'Wind')
  #            echo ' ';;
  'Sunny')
    echo ' '
    ;;
  'Night Clear' | 'Clear Night' | 'Mostly Clear Night')
    echo ' '
    ;;
  'Mostly Sunny')
    echo ' '
    ;;
  'Partly Cloudy' | 'Partly Cloudy Day' | 'Mostly Clear Day')
    echo ' '
    ;;
  'Partly Cloudy Night')
    echo ' '
    ;;
  'Mostly Cloudy' | 'Mostly Cloudy Day')
    echo ' '
    ;;
  'Mostly Cloudy Night')
    echo ' '
    ;;
  'Cloudy')
    echo ' '
    ;;
  'Scattered Showers' | 'Showers' | 'Heavy Rain' | 'Drizzle')
    echo ' '
    ;;
  'Rain')
    echo ' '
    ;;
  'Isolated Thunderstorms' | 'Scattered Thunderstorms' | 'Thunderstorms')
    echo ' '
    ;;
  'Strong Storms')
    echo ' '
    ;;
  'Foggy')
    echo ' '
    ;;
  'Rain and Snow')
    echo ' '
    ;;
  'Snow')
    echo ' '
    ;;
  'Wind' | 'Windy')
    echo ' '
    ;;
  *)
    echo "$1"
    ;;
  esac
}

# weather_scraper.py needs to be in same dir as this script.
json=$(python weather_scraper.py "$LOCATION_CODE")
if [ "$json" == "Error" ]; then
  echo "%{T1}Error gathering temp data%{T-}"
  exit
fi
weather=$(echo "$json" | jq '.location.forecasts' | jq '.[0].weather')

# forecast 1
tmp1=$(echo "$weather" | jq -r '.[0].temperature')
tmp1_num=$(echo "$tmp1" | tr -d '°')

info1=$(echo "$weather" | jq -r '.[0].info')
icon1=$(info_to_icon "$info1")

# forecast 2
tmp2=$(echo "$weather" | jq -r '.[1].temperature')
if [ "$tmp2" = "null" ]; then
  # its 23:00 and the second weather is on the next day
  weather=$(echo "$json" | jq '.location.forecasts' | jq '.[1].weather')
  tmp2=$(echo "$weather" | jq -r '.[0].temperature')
  info2=$(echo "$weather" | jq -r '.[0].info')

else
  info2=$(echo "$weather" | jq -r '.[1].info')
fi

tmp2_num=$(echo "$tmp2" | tr -d '°')
icon2=$(info_to_icon "$info2")

# Set the arrow for the corresponding diff temps
if [ "$tmp1_num" -lt "$tmp2_num" ]; then
  tmp_diff='↗'
elif [ "$tmp1_num" -eq "$tmp2_num" ]; then
  tmp_diff='→'
else
  tmp_diff='↘'
fi

# output for polybar
echo "%{T8}$icon1 %{T-}%{T1}$tmp1 $tmp_diff %{T-}%{T8}$icon2 %{T-}$tmp2"
