/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, expect, it, Level } from '@ohos/hypium';
import { ENTINFO1, SELFWANT, SELFHAPNAME, INVALID_WANT, DEFAULT_USER_ID, APP_IDS_1 } from '../commom.test.ets';

import { usbManager } from '@kit.MDMKit';
import adminManager from '@ohos.enterprise.adminManager';
import restrictions from '@ohos.enterprise.restrictions';
import sysDeviceInfo from '@ohos.deviceInfo';

const LABEL_BLUETOOTH = "bluetooth";
const LABEL_MODIFY_DATETIME = "modifyDateTime";
const LABEL_PRINTER = "printer";
const LABEL_HDC = "hdc";
const LABEL_MIC = "microphone";
const LABEL_FINGER_PRINT = "fingerprint";
const LABEL_USB = "usb";
const LABEL_WIFI = "wifi";
const LABEL_CAMERA = "camera";
const LABEL_SNAPSHOT_SKIP_FOR_ACCOUNT = "snapshotSkip";
const LABEL_RESET_FACTORY = "resetFactory";
const LABEL_TETHERING = "tethering";
const LABEL_NEAR_LINK = "nearLink";
const LABEL_DISTRIBUTED_TRANSMISSION = "distributedTransmissionOutgoing";
const LABEL_PRINT = "print";
const LABEL_MTP_CLIENT = "mtpClient";
const LABEL_MTP_SERVER = "mtpServer";
const LABEL_RECOVERY_KEY = "diskRecoveryKey";
const LABEL_OPEN_FILE_BOOST = "openFileBoost";
const LABEL_SAMBA_CLIENT = "sambaClient";
const LABEL_SAMBA_SERVER = "sambaServer";
const LABEL_REMOTE_DESK = "remoteDesk";
const LABEL_REMOTE_DIAGNOSIS = "remoteDiagnosis";
const LABEL_SET_APN = "setApn";
const LABEL_SET_ETHERNET_IP = "setEthernetIp";
const LABEL_USB_STORAGE_DEVICE_WRITE = "usbStorageDeviceWrite";
const LABEL_POWER_LONG_PRESS = "powerLongPress";
const LABEL_VPN = "vpn";
const LABEL_MOBILE_DATA = "mobileData";
const LABEL_SMS = "sms";
const LABEL_MMS = "mms";
const LABEL_AIRPLANE_MODE = "airplaneMode";
const LABEL_NOTIFICATION = "notification";
const LABEL_NFC = "nfc";
const LABEL_SET_BIOMETRICS_AND_SCREENLOCK = "setBiometricsAndScreenLock";
const LABEL_SET_DEVICE_NAME = "setDeviceName";
const LABEL_SUDO = "sudo";
const LABEL_TELEPHONY_CALL = "telephoneCall";
const LABEL_BACKUP_AND_RESTORE = "backupAndRestore";
const LABEL_PRIVATE_SPACE = "privateSpace";
const LABLE_EXTERNAL_STORAGE_CARD = "externalStorageCard";
const LABLE_RANDOM_MAC = "randomMac";
const LABEL_APP_CLONE = "appClone";
const LABEL_UNMUTE_DEVICE = "unmuteDevice";
const LABEL_HDC_REMOTE = "hdcRemote";
const LABEL_VIRTUAL_SERVICE = "virtualService";
const LABEL_MODIFY_WALLPAPER = "modifyWallpaper";
const LABEL_USB_SERIAL = "usbSerial";

export default function restrictionsTest() {
  describe('restrictions_test', () => {
    testSetDisallowedPolicy();
    testGetDisallowedPolicy();
  })
}

function testSetDisallowedPolicy() {
   /**
    * @tc.name   test_set_disallowed_policy_traffic_redirection_0100
    * @tc.number SUB_CUSTOMIZATION_EDM_SETDISALLOWEDPOLICYTRAFFIC_REDIRECTION_0100
    * @tc.desc   test restrictions setDisallowedPolicy with trafficredirection feature using byod admin (disallow true)
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it("test_set_disallowed_policy_traffic_redirection_0100", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
      try {
        restrictions.setDisallowedPolicy(SELFWANT, restrictions.FeatureForDevice.TRAFFIC_REDIRECTION, true);
        expect(false).assertTrue();
      } catch (error) {
        if (Number(error.code) === 801) {
          expect(Number(error.code) === 801).assertTrue();
        } else {
          expect(error.code === 9200002).assertTrue();
        }
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
    });

   /**
    * @tc.name   test_set_disallowed_policy_traffic_redirection_0200
    * @tc.number SUB_CUSTOMIZATION_EDM_SETDISALLOWEDPOLICYTRAFFIC_REDIRECTION_0200
    * @tc.desc   test restrictions setDisallowedPolicy with trafficredirection undefined disallow
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it("test_set_disallowed_policy_traffic_redirection_0200", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
      try {
        restrictions.setDisallowedPolicy(SELFWANT, restrictions.FeatureForDevice.TRAFFIC_REDIRECTION, undefined);
        expect(false).assertTrue();
      } catch (error) {
        expect(Number(error.code) === 401).assertTrue();
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
    });

   /**
    * @tc.name   test_set_disallowed_policy_traffic_redirection_0300
    * @tc.number SUB_CUSTOMIZATION_EDM_SETDISALLOWEDPOLICYTRAFFIC_REDIRECTION_0300
    * @tc.desc   test restrictions setDisallowedPolicy with trafficredirection feature normal admin
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it("test_set_disallowed_policy_traffic_redirection_0300", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
      try {
        restrictions.setDisallowedPolicy(SELFWANT, restrictions.FeatureForDevice.TRAFFIC_REDIRECTION, false);
        let ret = restrictions.getDisallowedPolicy(SELFWANT, restrictions.FeatureForDevice.TRAFFIC_REDIRECTION);
        expect(ret).assertFalse();
      } catch (error) {
        expect(Number(error.code) === 801).assertTrue();
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
    });

   /**
    * @tc.name   test_set_disallowed_policy_traffic_redirection_0400
    * @tc.number SUB_CUSTOMIZATION_EDM_SETDISALLOWEDPOLICYTRAFFIC_REDIRECTION_0400
    * @tc.desc   test restrictions setDisallowedPolicy with trafficredirection feature super admin
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it("test_set_disallowed_policy_traffic_redirection_0400", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        restrictions.setDisallowedPolicy(SELFWANT, restrictions.FeatureForDevice.TRAFFIC_REDIRECTION, true);
        let ret = restrictions.getDisallowedPolicy(SELFWANT, restrictions.FeatureForDevice.TRAFFIC_REDIRECTION);
        expect(ret).assertTrue();
      } catch (error) {
        expect(Number(error.code) === 801).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    });

   /**
    * @tc.name   test_set_disallowed_policy_traffic_redirection_0500
    * @tc.number SUB_CUSTOMIZATION_EDM_SETDISALLOWEDPOLICYTRAFFIC_REDIRECTION_0500
    * @tc.desc   test restrictions setDisallowedPolicy with trafficredirection without admin
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it("test_set_disallowed_policy_traffic_redirection_0500", Level.LEVEL2, async (done: Function) => {
      try {
        restrictions.setDisallowedPolicy(SELFWANT, restrictions.FeatureForDevice.TRAFFIC_REDIRECTION, false);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code === 9200001).assertTrue();
      }
      done();
    });

   /**
    * @tc.name   test_set_disallowed_policy_traffic_redirection_0600
    * @tc.number SUB_CUSTOMIZATION_EDM_SETDISALLOWEDPOLICYTRAFFIC_REDIRECTION_0600
    * @tc.desc   test restrictions setDisallowedPolicy with trafficredirection with null admin
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it("test_set_disallowed_policy_traffic_redirection_0600", Level.LEVEL2, async (done: Function) => {
      try {
        restrictions.setDisallowedPolicy(null, restrictions.FeatureForDevice.TRAFFIC_REDIRECTION, false);
        expect(false).assertTrue();
      } catch (error) {
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
    });

   /**
    * @tc.name   test_set_disallowed_policy_traffic_redirection_0700
    * @tc.number SUB_CUSTOMIZATION_EDM_SETDISALLOWEDPOLICYTRAFFIC_REDIRECTION_0700
    * @tc.desc   test restrictions setDisallowedPolicy with trafficredirection with undefined admin
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it("test_set_disallowed_policy_traffic_redirection_0700", Level.LEVEL2, async (done: Function) => {
      try {
        restrictions.setDisallowedPolicy(undefined, restrictions.FeatureForDevice.TRAFFIC_REDIRECTION, false);
        expect(false).assertTrue();
      } catch (error) {
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
    });

   /**
    * @tc.name   test_set_disallowed_policy_traffic_redirection_0800
    * @tc.number SUB_CUSTOMIZATION_EDM_SETDISALLOWEDPOLICYTRAFFIC_REDIRECTION_0800
    * @tc.desc   test restrictions setDisallowedPolicy with trafficredirection with null disallow
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it("test_set_disallowed_policy_traffic_redirection_0800", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
      try {
        restrictions.setDisallowedPolicy(undefined, restrictions.FeatureForDevice.TRAFFIC_REDIRECTION, null);
        expect(false).assertTrue();
      } catch (error) {
        expect(Number(error.code) === 401).assertTrue();
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
    });
}

function testGetDisallowedPolicy() {
   /**
    * @tc.name   test_get_disallowed_policy_traffic_redirection_0100
    * @tc.number SUB_CUSTOMIZATION_EDM_GETDISALLOWEDPOLICYTRAFFIC_REDIRECTION_0100
    * @tc.desc   test restrictions getDisallowedPolicy with trafficredirection feature byod admin
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
   it("test_get_disallowed_policy_traffic_redirection_0100", Level.LEVEL2, async (done: Function) => {
     await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
     try {
       let ret = restrictions.getDisallowedPolicy(SELFWANT, restrictions.FeatureForDevice.TRAFFIC_REDIRECTION);
       expect(ret).assertFalse();
     } catch (error) {
       expect(error.code === 9200002).assertTrue();
     } finally {
       await adminManager.disableAdmin(SELFWANT);
     }
     done();
   });

   /**
    * @tc.name   test_get_disallowed_policy_traffic_redirection_0200
    * @tc.number SUB_CUSTOMIZATION_EDM_GETDISALLOWEDPOLICYTRAFFIC_REDIRECTION_0200
    * @tc.desc   test restrictions getDisallowedPolicy with trafficredirection feature null admin
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
   it("test_get_disallowed_policy_traffic_redirection_0200", Level.LEVEL2, async (done: Function) => {
     await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
     try {
       let ret = restrictions.getDisallowedPolicy(null, restrictions.FeatureForDevice.TRAFFIC_REDIRECTION);
       expect(ret).assertFalse();
     } catch (error) {
       expect(false).assertTrue();
     } finally {
       await adminManager.disableAdmin(SELFWANT);
     }
     done();
   });

   /**
    * @tc.name   test_get_disallowed_policy_traffic_redirection_0300
    * @tc.number SUB_CUSTOMIZATION_EDM_GETDISALLOWEDPOLICYTRAFFIC_REDIRECTION_0300
    * @tc.desc   test restrictions getDisallowedPolicy with trafficredirection feature super admin
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
   it("test_get_disallowed_policy_traffic_redirection_0300", Level.LEVEL2, async (done: Function) => {
     await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
     try {
       let ret = restrictions.getDisallowedPolicy(SELFWANT, restrictions.FeatureForDevice.TRAFFIC_REDIRECTION);
       expect(ret).assertFalse();
     } catch (error) {
       expect(false).assertTrue();
     } finally {
       await adminManager.disableSuperAdmin(SELFHAPNAME);
     }
     done();
   });

   /**
    * @tc.name   test_get_disallowed_policy_traffic_redirection_0400
    * @tc.number SUB_CUSTOMIZATION_EDM_GETDISALLOWEDPOLICYTRAFFIC_REDIRECTION_0400
    * @tc.desc   test restrictions getDisallowedPolicy with trafficredirection feature normal admin
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
   it("test_get_disallowed_policy_traffic_redirection_0400", Level.LEVEL2, async (done: Function) => {
     await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
     try {
       let ret = restrictions.getDisallowedPolicy(SELFWANT, restrictions.FeatureForDevice.TRAFFIC_REDIRECTION);
       expect(ret).assertFalse();
     } catch (error) {
       expect(error.code === 9200002).assertTrue();
     } finally {
       await adminManager.disableAdmin(SELFWANT);
     }
     done();
   });

   /**
    * @tc.name   test_get_disallowed_policy_traffic_redirection_0500
    * @tc.number SUB_CUSTOMIZATION_EDM_GETDISALLOWEDPOLICYTRAFFIC_REDIRECTION_0500
    * @tc.desc   test restrictions getDisallowedPolicy with trafficredirection feature without admin
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
   it("test_get_disallowed_policy_traffic_redirection_0500", Level.LEVEL2, async (done: Function) => {
     try {
       restrictions.getDisallowedPolicy(SELFWANT, restrictions.FeatureForDevice.TRAFFIC_REDIRECTION);
       expect(false).assertTrue();
     } catch (error) {
       expect(error.code === 9200001).assertTrue();
     }
     done();
   });

   /**
    * @tc.name   test_get_disallowed_policy_traffic_redirection_0600
    * @tc.number SUB_CUSTOMIZATION_EDM_GETDISALLOWEDPOLICYTRAFFIC_REDIRECTION_0600
    * @tc.desc   test restrictions getDisallowedPolicy with trafficredirection feature undefined admin
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
   it("test_get_disallowed_policy_traffic_redirection_0600", Level.LEVEL2, async (done: Function) => {
     try {
       let ret = restrictions.getDisallowedPolicy(undefined, restrictions.FeatureForDevice.TRAFFIC_REDIRECTION);
       expect(ret).assertFalse();
     } catch (error) {
       expect(Number(error.code) === 401).assertTrue();
     }
     done();
  });
}
