#/bin/bash
TARGET=$1
REPAIR_SED=$(echo /tmp/repair.$$.sed)
awk -f fixup.awk $TARGET >${REPAIR_SED}
sed -f extraTikzPictureStrip.sed -i.strip $TARGET
sed -f ${REPAIR_SED} -i.fixup $TARGET
