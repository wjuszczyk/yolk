#!/bin/sh
function setup_files() {
    awk -v computer="$COMP" '
    /^# *\{Laptop\}/   {in_laptop=1; print; next}
    /^# *\{\/Laptop\}/ {in_laptop=0; print; next}
    /^# *\{Komp\}/     {in_komp=1; print; next}
    /^# *\{\/Komp\}/   {in_komp=0; print; next}

    # --- Zachowanie zależne od zmiennej COMPUTER ---
    # Sekcja Laptop
    in_laptop {
      if (computer == "komp") {
        if ($0 !~ /^#/) $0 = "# " $0     # komputer: zakomentuj
      } else if (computer == "laptop") {
          sub(/^# /, "")                   # laptop: odkomentuj
      }
    }

    # Sekcja Komp
    in_komp {
      if (computer == "komp") {
        sub(/^# /, "")                   # komputer: odkomentuj
      } else if (computer == "laptop") {
        if ($0 !~ /^#/) $0 = "# " $0     # laptop: zakomentuj
      }
    }
    { print }' $1
}

if [[ -z $1 ]]; then
  echo "Podaj środowisko: $0 laptop / komp"
  exit 1
else
  #if [[ -z $1 ]] || [[ ! -a $1 ]]; then
  #  echo "Brak pliku wejścia!"
  #  exit 1
  #else
  for i in $(grep '{Laptop}' * -R -l | grep -v $(basename $0))
    do
      mv ${i} ${i}_
      COMP=$1 setup_files ${i}_ >> ${i}
      rm -f ${i}_
    done
  #fi
fi
chmod +x bspwmrc
