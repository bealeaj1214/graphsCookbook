#/bin/bash
TARGET=$1
REPAIR_SED=$(echo /tmp/repair.$$.sed)
awk -f fixup.awk >${REPAIR_SED}
sed -f extraTikzPictureStrip.sed -istrip $TARGET
sed -f ${REPAIR_SED} -ifixup $TARGET
