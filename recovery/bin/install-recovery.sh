#!/system/bin/sh
if [ -f /system/etc/recovery-transform.sh ]; then
  exec sh /system/etc/recovery-transform.sh 8292352 5ab6539df1192262e00932707b2b585630dfb186 5773312 c9fa9d6ec64b897ae2af7287ac1a3f5af3209d55
fi

if ! applypatch -c EMMC:/dev/block/mmcblk0p21:8292352:5ab6539df1192262e00932707b2b585630dfb186; then
  applypatch -b /system/etc/recovery-resource.dat EMMC:/dev/block/mmcblk0p20:5773312:c9fa9d6ec64b897ae2af7287ac1a3f5af3209d55 EMMC:/dev/block/mmcblk0p21 5ab6539df1192262e00932707b2b585630dfb186 8292352 c9fa9d6ec64b897ae2af7287ac1a3f5af3209d55:/system/recovery-from-boot.p && log -t recovery "Installing new recovery image: succeeded" || log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
