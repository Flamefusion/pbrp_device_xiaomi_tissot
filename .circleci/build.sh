#!/bin/bash
repo init -u git://github.com/PitchBlackRecoveryProject/manifest_pb.git -b android-9.0
repo sync --force-sync
git clone https://github.com/Takeshiro04/pbrp_device_xiaomi_tissot device/xiaomi/tissot/
rm -rf hardware/qcom/bootctrl
. build/envsetup.sh
ALLOW_MISSING_DEPENDENCIES=true
lunch omni_tissot-eng
mka recoveryimage
  ZIP=$(ls out/target/product/tissot/PBRP*.zip)
curl https://bashupload.com/$ZIP --data-binary @$ZIP
