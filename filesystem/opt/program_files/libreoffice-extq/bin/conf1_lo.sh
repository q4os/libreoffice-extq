#this code is sourced from /usr/lib/libreoffice/program/ooenv script anytime libreoffice starts
LOGFL1="/tmp/.conf1losh.log"
echo "[DBG:] Starting conf1_lo.sh snippet ..." > $LOGFL1
if [ "$QDSK_SESSION" = "trinity" ] ; then
  F_USR_XDG_CFG_TDE="$( dash /usr/share/apps/q4os_system/bin/print_xdgcfghome_tde.sh )"
  if [ -z "$F_USR_XDG_CFG_TDE" ] && [ -d "$HOME/.configtde/" ] ; then
    F_USR_XDG_CFG_TDE="$HOME/.configtde"
  fi
  if [ -z "$F_USR_XDG_CFG_TDE" ] ; then
    F_USR_XDG_CFG_TDE="/tmp/.xdgcfg_fake"
  fi
  echo "[DBG:] XDG config home: >$F_USR_XDG_CFG_TDE<" >> $LOGFL1
  CFG_FILE1="$F_USR_XDG_CFG_TDE/libreoffice/4/user/registrymodifications.xcu"
  if [ ! -f "$CFG_FILE1" ] ; then
    echo "[DBG:] Libreoffice configfile: >$CFG_FILE1<" >> $LOGFL1
    mkdir -p "$( dirname $CFG_FILE1 )"
    if [ "$( dash /usr/share/apps/q4os_system/bin/print_package_version.sh "libreoffice-style-colibre" )" != "0" ] ; then
      echo "[DBG:] Writing modifications registrymodifications.xcu.colibre ..." >> $LOGFL1
      cp /opt/program_files/libreoffice-extq/share/registrymodifications.xcu.colibre $CFG_FILE1
    elif [ "$( dash /usr/share/apps/q4os_system/bin/print_package_version.sh "libreoffice-style-breeze" )" != "0" ] ; then
      echo "[DBG:] Writing modifications registrymodifications.xcu.breeze ..." >> $LOGFL1
      cp /opt/program_files/libreoffice-extq/share/registrymodifications.xcu.breeze $CFG_FILE1
    elif [ "$( dash /usr/share/apps/q4os_system/bin/print_package_version.sh "libreoffice-style-galaxy" )" != "0" ] ; then
      echo "[DBG:] Writing modifications registrymodifications.xcu.galaxy ..." >> $LOGFL1
      cp /opt/program_files/libreoffice-extq/share/registrymodifications.xcu.galaxy $CFG_FILE1
    else
      echo "[DBG:] Modifications has not been written." >> $LOGFL1
    fi
  fi
fi
