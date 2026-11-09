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

import { describe, expect, it, Level } from '@ohos/hypium-dynamic';
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
  let sleep = (timeout: number): Promise<ESObject> => {
    return new Promise(resolve => {
      const st = setTimeout(() => {
        resolve(null);
        clearTimeout(st);
      }, timeout);
    });
  };

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
      if (error.code === 801) {
        expect(error.code === 801).assertTrue();
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
   * @tc.desc   test restrictions setDisallowedPolicy with trafficredirection feature normal admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_disallowed_policy_traffic_redirection_0200", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
    try {
      restrictions.setDisallowedPolicy(SELFWANT, restrictions.FeatureForDevice.TRAFFIC_REDIRECTION, false);
      let ret = restrictions.getDisallowedPolicy(SELFWANT, restrictions.FeatureForDevice.TRAFFIC_REDIRECTION);
      expect(ret).assertFalse();
    } catch (error) {
      expect(error.code === 801).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.name   test_set_disallowed_policy_traffic_redirection_0300
   * @tc.number SUB_CUSTOMIZATION_EDM_SETDISALLOWEDPOLICYTRAFFIC_REDIRECTION_0300
   * @tc.desc   test restrictions setDisallowedPolicy with trafficredirection feature super admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_disallowed_policy_traffic_redirection_0300", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      restrictions.setDisallowedPolicy(SELFWANT, restrictions.FeatureForDevice.TRAFFIC_REDIRECTION, true);
      let ret = restrictions.getDisallowedPolicy(SELFWANT, restrictions.FeatureForDevice.TRAFFIC_REDIRECTION);
      expect(ret).assertTrue();
    } catch (error) {
      expect(error.code === 801).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_set_disallowed_policy_traffic_redirection_0400
   * @tc.number SUB_CUSTOMIZATION_EDM_SETDISALLOWEDPOLICYTRAFFIC_REDIRECTION_0400
   * @tc.desc   test restrictions setDisallowedPolicy with trafficredirection without admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_disallowed_policy_traffic_redirection_0400", Level.LEVEL2, async (done: Function) => {
    try {
      restrictions.setDisallowedPolicy(SELFWANT, restrictions.FeatureForDevice.TRAFFIC_REDIRECTION, false);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code === 9200001).assertTrue();
    }
    done();
  });

  /**
   * @tc.name   test_set_disallowed_policy_RS232_0100
   * @tc.number SUB_CUSTOMIZATION_EDM_SETDISALLOWEDPOLICYRS232_0100
   * @tc.desc   test restrictions setDisallowedPolicy with coredump feature using byod admin (disallow true)
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_disallowed_policy_RS232_0100", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
    try {
      restrictions.setDisallowedPolicy(SELFWANT, restrictions.FeatureForDevice.RS232, true);
      expect(false).assertTrue();
    } catch (error) {
      if (error.code === 801) {
        expect(error.code === 801).assertTrue();
      } else {
        expect(error.code === 9200002).assertTrue();
      }
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.name   test_set_disallowed_policy_RS232_0200
   * @tc.number SUB_CUSTOMIZATION_EDM_SETDISALLOWEDPOLICYRS232_0200
   * @tc.desc   test restrictions setDisallowedPolicy with coredump feature normal admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_disallowed_policy_RS232_0200", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
    try {
      restrictions.setDisallowedPolicy(SELFWANT, restrictions.FeatureForDevice.RS232, false);
      let ret = restrictions.getDisallowedPolicy(SELFWANT, restrictions.FeatureForDevice.RS232);
      expect(ret).assertFalse();
    } catch (error) {
      expect(error.code === 801).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.name   test_set_disallowed_policy_RS232_0300
   * @tc.number SUB_CUSTOMIZATION_EDM_SETDISALLOWEDPOLICYRS232_0300
   * @tc.desc   test restrictions setDisallowedPolicy with coredump feature super admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_disallowed_policy_RS232_0300", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      restrictions.setDisallowedPolicy(SELFWANT, restrictions.FeatureForDevice.RS232, true);
      let ret = restrictions.getDisallowedPolicy(SELFWANT, restrictions.FeatureForDevice.RS232);
      expect(ret).assertTrue();
    } catch (error) {
      expect(error.code === 801).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_set_disallowed_policy_RS232_0400
   * @tc.number SUB_CUSTOMIZATION_EDM_SETDISALLOWEDPOLICYRS232_0400
   * @tc.desc   test restrictions setDisallowedPolicy with coredump without admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_disallowed_policy_RS232_0400", Level.LEVEL2, async (done: Function) => {
    try {
      restrictions.setDisallowedPolicy(SELFWANT, restrictions.FeatureForDevice.RS232, false);
      expect(false).assertTrue();
    } catch (error) {
      if (error.code === 801) {
        expect(error.code === 801).assertTrue();
      } else {
        expect(error.code === 9200001).assertTrue();
      }
    }
    done();
  });

  /**
   * @tc.name   test_set_disallowed_policy_X_KEY_0100
   * @tc.number SUB_CUSTOMIZATION_EDM_SETDISALLOWEDPOLICYX_KEY_0100
   * @tc.desc   test restrictions setDisallowedPolicy with X_KEY feature using byod admin (disallow true)
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_disallowed_policy_X_KEY_0100", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
    try {
      restrictions.setDisallowedPolicy(SELFWANT, restrictions.FeatureForDevice.X_KEY, true);
      expect(false).assertTrue();
    } catch (error) {
      if (error.code === 801) {
        expect(error.code === 801).assertTrue();
      } else {
        expect(error.code === 9200002).assertTrue();
      }
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.name   test_set_disallowed_policy_X_KEY_0200
   * @tc.number SUB_CUSTOMIZATION_EDM_SETDISALLOWEDPOLICYX_KEY_0200
   * @tc.desc   test restrictions setDisallowedPolicy with X_KEY feature normal admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_disallowed_policy_X_KEY_0200", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
    try {
      restrictions.setDisallowedPolicy(SELFWANT, restrictions.FeatureForDevice.X_KEY, true);
      expect(false).assertTrue();
    } catch (error) {
      if (error.code === 801) {
        expect(error.code === 801).assertTrue();
      } else {
        expect(error.code === 9200002).assertTrue();
      }
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.name   test_set_disallowed_policy_X_KEY_0300
   * @tc.number SUB_CUSTOMIZATION_EDM_SETDISALLOWEDPOLICYX_KEY_0300
   * @tc.desc   test restrictions setDisallowedPolicy with X_KEY feature super admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_disallowed_policy_X_KEY_0300", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      restrictions.setDisallowedPolicy(SELFWANT, restrictions.FeatureForDevice.X_KEY, true);
      let ret = restrictions.getDisallowedPolicy(SELFWANT, restrictions.FeatureForDevice.X_KEY);
      expect(ret).assertTrue();
    } catch (error) {
      expect(error.code === 801).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_set_disallowed_policy_X_KEY_0400
   * @tc.number SUB_CUSTOMIZATION_EDM_SETDISALLOWEDPOLICYX_KEY_0400
   * @tc.desc   test restrictions setDisallowedPolicy with X_KEY without admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_disallowed_policy_X_KEY_0400", Level.LEVEL2, async (done: Function) => {
    try {
      restrictions.setDisallowedPolicy(SELFWANT, restrictions.FeatureForDevice.X_KEY, false);
      expect(false).assertTrue();
    } catch (error) {
      if (error.code === 801) {
        expect(error.code === 801).assertTrue();
      } else {
        expect(error.code === 9200001).assertTrue();
      }
    }
    done();
  });

  /**
   * @tc.name   test_set_disallowed_policy_X_KEY_0500
   * @tc.number SUB_CUSTOMIZATION_EDM_SETDISALLOWEDPOLICYX_KEY_0500
   * @tc.desc   test restrictions setDisallowedPolicy with X_KEY feature undefined admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_disallowed_policy_X_KEY_0500", Level.LEVEL2, async (done: Function) => {
    try {
      restrictions.setDisallowedPolicy(undefined, restrictions.FeatureForDevice.X_KEY, false);
      expect(false).assertTrue();
    } catch (error) {
      if (error.code === 801) {
        expect(error.code === 801).assertTrue();
      } else {
        expect(error.code === 401).assertTrue();
      }
    }
    done();
  });

  /**
   * @tc.name   test_set_disallowed_policy_CONTROL_CENTER_0100
   * @tc.number SUB_CUSTOMIZATION_EDM_SETDISALLOWEDPOLICYCONTROL_CENTER_0100
   * @tc.desc   test restrictions setDisallowedPolicy with CONTROL_CENTER feature super admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_disallowed_policy_CONTROL_CENTER_0100", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      restrictions.setDisallowedPolicy(SELFWANT, restrictions.FeatureForDevice.CONTROL_CENTER, true);
      let ret = restrictions.getDisallowedPolicy(SELFWANT, restrictions.FeatureForDevice.CONTROL_CENTER);
      expect(ret).assertTrue();
    } catch (error) {
      expect(error.code === 801).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_set_disallowed_policy_NOTIFICATION_CENTER_0100
   * @tc.number SUB_CUSTOMIZATION_EDM_SETDISALLOWEDPOLICYNOTIFICATION_CENTER_0100
   * @tc.desc   test restrictions setDisallowedPolicy with NOTIFICATION_CENTER feature super admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_disallowed_policy_NOTIFICATION_CENTER_0100", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      restrictions.setDisallowedPolicy(SELFWANT, restrictions.FeatureForDevice.NOTIFICATION_CENTER, true);
      let ret = restrictions.getDisallowedPolicy(SELFWANT, restrictions.FeatureForDevice.NOTIFICATION_CENTER);
      expect(ret).assertTrue();
    } catch (error) {
      expect(error.code === 801).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_set_disallowed_policy_system_rollback_0100
   * @tc.number SUB_CUSTOMIZATION_EDM_SETDISALLOWEDPOLICYSYSTEM_ROLLBACK_0100
   * @tc.desc   test restrictions setDisallowedPolicy with system_rollback feature byod admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_disallowed_policy_system_rollback_0100", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
    try {
      restrictions.setDisallowedPolicy(SELFWANT, restrictions.FeatureForDevice.SYSTEM_ROLLBACK, true);
      expect(false).assertTrue();
    } catch (error) {
      if (error.code === 801) {
        expect(error.code === 801).assertTrue();
      } else {
        expect(error.code === 9200002).assertTrue();
      }
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.name   test_set_disallowed_policy_system_rollback_0200
   * @tc.number SUB_CUSTOMIZATION_EDM_SETDISALLOWEDPOLICYSYSTEM_ROLLBACK_0200
   * @tc.desc   test restrictions setDisallowedPolicy with system_rollback feature normal admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_disallowed_policy_system_rollback_0200", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
    try {
      restrictions.setDisallowedPolicy(SELFWANT, restrictions.FeatureForDevice.SYSTEM_ROLLBACK, true);
      let ret = restrictions.getDisallowedPolicy(SELFWANT, restrictions.FeatureForDevice.SYSTEM_ROLLBACK);
      expect(ret).assertTrue();
    } catch (error) {
      if (error.code === 801) {
        expect(error.code === 801).assertTrue();
      } else {
        expect(error.code === 9200002).assertTrue();
      }
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.name   test_set_disallowed_policy_system_rollback_0300
   * @tc.number SUB_CUSTOMIZATION_EDM_SETDISALLOWEDPOLICYSYSTEM_ROLLBACK_0300
   * @tc.desc   test restrictions setDisallowedPolicy with system_rollback feature super admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_disallowed_policy_system_rollback_0300", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      restrictions.setDisallowedPolicy(SELFWANT, restrictions.FeatureForDevice.SYSTEM_ROLLBACK, true);
      let ret = restrictions.getDisallowedPolicy(SELFWANT, restrictions.FeatureForDevice.SYSTEM_ROLLBACK);
      expect(ret).assertTrue();
    } catch (error) {
      expect(error.code === 801).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_set_disallowed_policy_system_rollback_0400
   * @tc.number SUB_CUSTOMIZATION_EDM_SETDISALLOWEDPOLICYSYSTEM_ROLLBACK_0400
   * @tc.desc   test restrictions setDisallowedPolicy with system_rollback without admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_disallowed_policy_system_rollback_0400", Level.LEVEL2, async (done: Function) => {
    try {
      restrictions.setDisallowedPolicy(SELFWANT, restrictions.FeatureForDevice.SYSTEM_ROLLBACK, true);
      expect(false).assertTrue();
    } catch (error) {
      if (error.code === 801) {
        expect(error.code === 801).assertTrue();
      } else {
        expect(error.code === 9200001).assertTrue();
      }
    }
    done();
  });

  /**
   * @tc.name   test_set_disallowed_policy_packet_filtering_0100
   * @tc.number SUB_CUSTOMIZATION_EDM_SETDISALLOWEDPOLICYPACKET_FILTERING_0100
   * @tc.desc   test restrictions setDisallowedPolicy with packet_filtering feature super admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it("test_set_disallowed_policy_packet_filtering_0100", Level.LEVEL0, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      restrictions.setDisallowedPolicy(SELFWANT, restrictions.FeatureForDevice.PACKET_FILTERING, true);
      let ret = restrictions.getDisallowedPolicy(SELFWANT, restrictions.FeatureForDevice.PACKET_FILTERING);
      expect(ret).assertTrue();
      restrictions.setDisallowedPolicy(SELFWANT, restrictions.FeatureForDevice.PACKET_FILTERING, false);
      ret = restrictions.getDisallowedPolicy(SELFWANT, restrictions.FeatureForDevice.PACKET_FILTERING);
      expect(ret).assertFalse();
    } catch (error) {
      console.info('test_set_disallowed_policy_packet_filtering_0100 error.code = ' + error.code);
      expect(error.code).assertEqual(801);
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_set_disallowed_policy_sata_odd_burn_0100
   * @tc.number SUB_CUSTOMIZATION_EDM_SETDISALLOWEDPOLICYSATA_ODD_BURN_0100
   * @tc.desc   test restrictions setDisallowedPolicy with sata_odd_burn feature super admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it("test_set_disallowed_policy_sata_odd_burn_0100", Level.LEVEL0, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      restrictions.setDisallowedPolicy(SELFWANT, restrictions.FeatureForDevice.SATA_ODD_BURN, true);
      let ret = restrictions.getDisallowedPolicy(SELFWANT, restrictions.FeatureForDevice.SATA_ODD_BURN);
      expect(ret).assertTrue();
      restrictions.setDisallowedPolicy(SELFWANT, restrictions.FeatureForDevice.SATA_ODD_BURN, false);
      ret = restrictions.getDisallowedPolicy(SELFWANT, restrictions.FeatureForDevice.SATA_ODD_BURN);
      expect(ret).assertFalse();
    } catch (error) {
      console.info('test_set_disallowed_policy_sata_odd_burn_0100 error.code = ' + error.code);
      expect(error.code).assertEqual(801);
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_set_disallowed_policy_super_privacy_mode_0100
   * @tc.number SUB_CUSTOMIZATION_EDM_SETDISALLOWEDPOLICYSUPERPRIVACYMODE_0100
   * @tc.desc   test restrictions setDisallowedPolicy with byod admin (should fail with 9200002)
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_disallowed_policy_super_privacy_mode_0100", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
    try {
      restrictions.setDisallowedPolicy(SELFWANT, restrictions.FeatureForDevice.SUPER_PRIVACY, true);
      expect().assertFail();
    } catch (error) {
      if (error.code === 801) {
        expect(error.code).assertEqual(801);
      } else {
        expect(error.code).assertEqual(9200002);
      }
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.name   test_set_disallowed_policy_super_privacy_mode_0200
   * @tc.number SUB_CUSTOMIZATION_EDM_SETDISALLOWEDPOLICYSUPERPRIVACYMODE_0200
   * @tc.desc   test restrictions setDisallowedPolicy with normal admin (should fail with 9200002)
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_disallowed_policy_super_privacy_mode_0200", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
    try {
      restrictions.setDisallowedPolicy(SELFWANT, restrictions.FeatureForDevice.SUPER_PRIVACY, false);
      expect().assertFail();
    } catch (error) {
      if (error.code === 801) {
        expect(error.code).assertEqual(801);
      } else {
        expect(error.code).assertEqual(9200002);
      }
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.name   test_set_disallowed_policy_super_privacy_mode_0300
   * @tc.number SUB_CUSTOMIZATION_EDM_SETDISALLOWEDPOLICYSUPERPRIVACYMODE_0300
   * @tc.desc   test restrictions setDisallowedPolicy with super admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_disallowed_policy_super_privacy_mode_0300", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      restrictions.setDisallowedPolicy(SELFWANT, restrictions.FeatureForDevice.SUPER_PRIVACY, true);
      let ret = restrictions.getDisallowedPolicy(SELFWANT, restrictions.FeatureForDevice.SUPER_PRIVACY);
      expect(ret).assertEqual(true);
      restrictions.setDisallowedPolicy(SELFWANT, restrictions.FeatureForDevice.SUPER_PRIVACY, false);
    } catch (error) {
      expect(error.code).assertEqual(801);
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_set_disallowed_policy_super_privacy_mode_0400
   * @tc.number SUB_CUSTOMIZATION_EDM_SETDISALLOWEDPOLICYSUPERPRIVACYMODE_0400
   * @tc.desc   test restrictions setDisallowedPolicy without admin (should fail with 9200001)
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_disallowed_policy_super_privacy_mode_0400", Level.LEVEL2, async (done: Function) => {
    try {
      restrictions.setDisallowedPolicy(SELFWANT, restrictions.FeatureForDevice.SUPER_PRIVACY, false);
      expect().assertFail();
    } catch (error) {
      if (error.code === 801) {
        expect(error.code).assertEqual(801);
      } else {
        expect(error.code).assertEqual(9200001);
      }
    }
    done();
  });

  /**
   * @tc.name   test_set_disallowed_policy_super_privacy_mode_0500
   * @tc.number SUB_CUSTOMIZATION_EDM_SETDISALLOWEDPOLICYSUPERPRIVACYMODE_0500
   * @tc.desc   test restrictions setDisallowedPolicy with undefined admin (should fail with 401)
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_disallowed_policy_super_privacy_mode_0500", Level.LEVEL2, async (done: Function) => {
    try {
      restrictions.setDisallowedPolicy(undefined, restrictions.FeatureForDevice.SUPER_PRIVACY, false);
      expect().assertFail();
    } catch (error) {
      if (error.code === 801) {
        expect(error.code).assertEqual(801);
      } else {
        expect(error.code).assertEqual(401);
      }
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
   * @tc.name   test_get_disallowed_policy_RS232_0100
   * @tc.number SUB_CUSTOMIZATION_EDM_GETDISALLOWEDPOLICYCOREDUMP_0100
   * @tc.desc   test restrictions getDisallowedPolicy with coredump feature byod admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_disallowed_policy_RS232_0100", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
    try {
      let ret = restrictions.getDisallowedPolicy(SELFWANT, restrictions.FeatureForDevice.RS232);
      expect(ret).assertFalse();
    } catch (error) {
      expect(error.code === 9200002).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.name   test_get_disallowed_policy_RS232_0200
   * @tc.number SUB_CUSTOMIZATION_EDM_GETDISALLOWEDPOLICYCOREDUMP_0200
   * @tc.desc   test restrictions getDisallowedPolicy with coredump feature null admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_disallowed_policy_RS232_0200", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
    try {
      let ret = restrictions.getDisallowedPolicy(null, restrictions.FeatureForDevice.RS232);
      expect(ret).assertFalse();
    } catch (error) {
      expect(false).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.name   test_get_disallowed_policy_RS232_0300
   * @tc.number SUB_CUSTOMIZATION_EDM_GETDISALLOWEDPOLICYCOREDUMP_0300
   * @tc.desc   test restrictions getDisallowedPolicy with coredump feature super admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_disallowed_policy_RS232_0300", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      let ret = restrictions.getDisallowedPolicy(SELFWANT, restrictions.FeatureForDevice.RS232);
      expect(ret).assertFalse();
    } catch (error) {
      expect(false).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_get_disallowed_policy_RS232_0400
   * @tc.number SUB_CUSTOMIZATION_EDM_GETDISALLOWEDPOLICYCOREDUMP_0400
   * @tc.desc   test restrictions getDisallowedPolicy with coredump feature normal admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_disallowed_policy_RS232_0400", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
    try {
      let ret = restrictions.getDisallowedPolicy(SELFWANT, restrictions.FeatureForDevice.RS232);
      expect(ret).assertFalse();
    } catch (error) {
      expect(error.code === 9200002).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.name   test_get_disallowed_policy_RS232_0500
   * @tc.number SUB_CUSTOMIZATION_EDM_GETDISALLOWEDPOLICYCOREDUMP_0500
   * @tc.desc   test restrictions getDisallowedPolicy with coredump feature without admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_disallowed_policy_RS232_0500", Level.LEVEL2, async (done: Function) => {
    try {
      restrictions.getDisallowedPolicy(SELFWANT, restrictions.FeatureForDevice.RS232);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code === 9200001).assertTrue();
    }
    done();
  });

  /**
   * @tc.name   test_get_disallowed_policy_RS232_0600
   * @tc.number SUB_CUSTOMIZATION_EDM_GETDISALLOWEDPOLICYCOREDUMP_0600
   * @tc.desc   test restrictions getDisallowedPolicy with unknow feature
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_disallowed_policy_RS232_0600", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      restrictions.getDisallowedPolicy(SELFWANT, -1);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code === 801).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_get_disallowed_policy_X_KEY_0100
   * @tc.number SUB_CUSTOMIZATION_EDM_GETDISALLOWEDPOLICYX_KEY_0100
   * @tc.desc   test restrictions getDisallowedPolicy with X_KEY feature byod admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_disallowed_policy_X_KEY_0100", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
    try {
      let ret = restrictions.getDisallowedPolicy(SELFWANT, restrictions.FeatureForDevice.X_KEY);
      expect(ret).assertFalse();
    } catch (error) {
      expect(error.code === 9200002).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.name   test_get_disallowed_policy_X_KEY_0200
   * @tc.number SUB_CUSTOMIZATION_EDM_GETDISALLOWEDPOLICYX_KEY_0200
   * @tc.desc   test restrictions getDisallowedPolicy with X_KEY feature null admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_disallowed_policy_X_KEY_0200", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
    try {
      let ret = restrictions.getDisallowedPolicy(null, restrictions.FeatureForDevice.X_KEY);
      expect(ret).assertFalse();
    } catch (error) {
      expect(false).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.name   test_get_disallowed_policy_X_KEY_0300
   * @tc.number SUB_CUSTOMIZATION_EDM_GETDISALLOWEDPOLICYX_KEY_0300
   * @tc.desc   test restrictions getDisallowedPolicy with X_KEY feature super admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_disallowed_policy_X_KEY_0300", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      let ret = restrictions.getDisallowedPolicy(SELFWANT, restrictions.FeatureForDevice.X_KEY);
      expect(ret).assertFalse();
    } catch (error) {
      expect(false).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_get_disallowed_policy_X_KEY_0400
   * @tc.number SUB_CUSTOMIZATION_EDM_GETDISALLOWEDPOLICYX_KEY_0400
   * @tc.desc   test restrictions getDisallowedPolicy with X_KEY feature normal admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_disallowed_policy_X_KEY_0400", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
    try {
      let ret = restrictions.getDisallowedPolicy(SELFWANT, restrictions.FeatureForDevice.X_KEY);
      expect(ret).assertFalse();
    } catch (error) {
      expect(error.code === 9200002).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.name   test_get_disallowed_policy_X_KEY_0500
   * @tc.number SUB_CUSTOMIZATION_EDM_GETDISALLOWEDPOLICYX_KEY_0500
   * @tc.desc   test restrictions getDisallowedPolicy with X_KEY feature without admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_disallowed_policy_X_KEY_0500", Level.LEVEL2, async (done: Function) => {
    try {
      restrictions.getDisallowedPolicy(SELFWANT, restrictions.FeatureForDevice.X_KEY);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code === 9200001).assertTrue();
    }
    done();
  });

  /**
   * @tc.name   test_get_disallowed_policy_X_KEY_0600
   * @tc.number SUB_CUSTOMIZATION_EDM_GETDISALLOWEDPOLICYX_KEY_0600
   * @tc.desc   test restrictions getDisallowedPolicy with X_KEY feature undefined admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_disallowed_policy_X_KEY_0600", Level.LEVEL2, async (done: Function) => {
    try {
      restrictions.getDisallowedPolicy(undefined, restrictions.FeatureForDevice.X_KEY);
      expect(false).assertTrue();
    } catch (error) {
      if (error.code === 801) {
        expect(error.code === 801).assertTrue();
      } else {
        expect(error.code === 401).assertTrue();
      }
    }
    done();
  });

  /**
   * @tc.name   test_get_disallowed_policy_CONTROL_CENTER_0100
   * @tc.number SUB_CUSTOMIZATION_EDM_GETDISALLOWEDPOLICYCONTROL_CENTER_0100
   * @tc.desc   test restrictions getDisallowedPolicy with CONTROL_CENTER feature super admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_disallowed_policy_CONTROL_CENTER_0100", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      let ret = restrictions.getDisallowedPolicy(SELFWANT, restrictions.FeatureForDevice.CONTROL_CENTER);
      expect(ret).assertFalse();
    } catch (error) {
      expect(false).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_get_disallowed_policy_NOTIFICATION_CENTER_0100
   * @tc.number SUB_CUSTOMIZATION_EDM_GETDISALLOWEDPOLICYNOTIFICATION_CENTER_0100
   * @tc.desc   test restrictions getDisallowedPolicy with NOTIFICATION_CENTER feature super admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_disallowed_policy_NOTIFICATION_CENTER_0100", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      let ret = restrictions.getDisallowedPolicy(SELFWANT, restrictions.FeatureForDevice.NOTIFICATION_CENTER);
      expect(ret).assertFalse();
    } catch (error) {
      expect(false).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_get_disallowed_policy_system_rollback_0100
   * @tc.number SUB_CUSTOMIZATION_EDM_GETDISALLOWEDPOLICYSYSTEM_ROLLBACK_0100
   * @tc.desc   test restrictions getDisallowedPolicy with system_rollback feature byod admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_disallowed_policy_system_rollback_0100", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
    try {
      let ret = restrictions.getDisallowedPolicy(SELFWANT, restrictions.FeatureForDevice.SYSTEM_ROLLBACK);
      expect(false).assertTrue();
    } catch (error) {
      if (error.code === 801) {
        expect(error.code === 801).assertTrue();
      } else {
        expect(error.code === 9200002).assertTrue();
      }
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.name   test_get_disallowed_policy_system_rollback_0200
   * @tc.number SUB_CUSTOMIZATION_EDM_GETDISALLOWEDPOLICYSYSTEM_ROLLBACK_0200
   * @tc.desc   test restrictions getDisallowedPolicy with system_rollback feature super admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_disallowed_policy_system_rollback_0200", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      let ret = restrictions.getDisallowedPolicy(SELFWANT, restrictions.FeatureForDevice.SYSTEM_ROLLBACK);
      expect(ret).assertFalse();
    } catch (error) {
      expect(error.code === 801).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_get_disallowed_policy_system_rollback_0300
   * @tc.number SUB_CUSTOMIZATION_EDM_GETDISALLOWEDPOLICYSYSTEM_ROLLBACK_0300
   * @tc.desc   test restrictions getDisallowedPolicy with system_rollback feature normal admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_disallowed_policy_system_rollback_0300", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
    try {
      let ret = restrictions.getDisallowedPolicy(SELFWANT, restrictions.FeatureForDevice.SYSTEM_ROLLBACK);
      expect(ret).assertFalse();
    } catch (error) {
      if (error.code === 801) {
        expect(error.code === 801).assertTrue();
      } else {
        expect(error.code === 9200002).assertTrue();
      }
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.name   test_get_disallowed_policy_system_rollback_0400
   * @tc.number SUB_CUSTOMIZATION_EDM_GETDISALLOWEDPOLICYSYSTEM_ROLLBACK_0400
   * @tc.desc   test restrictions getDisallowedPolicy with system_rollback feature without admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_disallowed_policy_system_rollback_0400", Level.LEVEL2, async (done: Function) => {
    try {
      restrictions.getDisallowedPolicy(SELFWANT, restrictions.FeatureForDevice.SYSTEM_ROLLBACK);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code === 9200001).assertTrue();
    }
    done();
  });

  /**
   * @tc.name   test_get_disallowed_policy_super_privacy_mode_0100
   * @tc.number SUB_CUSTOMIZATION_EDM_GETDISALLOWEDPOLICYSUPERPRIVACYMODE_0100
   * @tc.desc   test restrictions getDisallowedPolicy with byod admin (should fail with 9200002)
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_disallowed_policy_super_privacy_mode_0100", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
    try {
      let ret = restrictions.getDisallowedPolicy(SELFWANT, restrictions.FeatureForDevice.SUPER_PRIVACY);
      expect(ret).assertEqual(false);
    } catch (error) {
      if (error.code === 801) {
        expect(error.code).assertEqual(801);
      } else {
        expect(error.code).assertEqual(9200002);
      }
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.name   test_get_disallowed_policy_super_privacy_mode_0200
   * @tc.number SUB_CUSTOMIZATION_EDM_GETDISALLOWEDPOLICYSUPERPRIVACYMODE_0200
   * @tc.desc   test restrictions getDisallowedPolicy with super admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_disallowed_policy_super_privacy_mode_0200", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      let ret = restrictions.getDisallowedPolicy(SELFWANT, restrictions.FeatureForDevice.SUPER_PRIVACY);
      expect(ret).assertEqual(false);
    } catch (error) {
      expect(error.code).assertEqual(801);
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_get_disallowed_policy_super_privacy_mode_0300
   * @tc.number SUB_CUSTOMIZATION_EDM_GETDISALLOWEDPOLICYSUPERPRIVACYMODE_0300
   * @tc.desc   test restrictions getDisallowedPolicy with normal admin (should fail with 9200002)
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_disallowed_policy_super_privacy_mode_0300", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
    try {
      let ret = restrictions.getDisallowedPolicy(SELFWANT, restrictions.FeatureForDevice.SUPER_PRIVACY);
      expect(ret).assertEqual(false);
    } catch (error) {
      if (error.code === 801) {
        expect(error.code).assertEqual(801);
      } else {
        expect(error.code).assertEqual(9200002);
      }
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.name   test_get_disallowed_policy_super_privacy_mode_0400
   * @tc.number SUB_CUSTOMIZATION_EDM_GETDISALLOWEDPOLICYSUPERPRIVACYMODE_0400
   * @tc.desc   test restrictions getDisallowedPolicy without admin (should fail with 9200001)
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_disallowed_policy_super_privacy_mode_0400", Level.LEVEL2, async (done: Function) => {
    try {
      restrictions.getDisallowedPolicy(SELFWANT, restrictions.FeatureForDevice.SUPER_PRIVACY);
      expect().assertFail();
    } catch (error) {
      if (error.code === 801) {
        expect(error.code).assertEqual(801);
      } else {
        expect(error.code).assertEqual(9200001);
      }
    }
    done();
  });
}