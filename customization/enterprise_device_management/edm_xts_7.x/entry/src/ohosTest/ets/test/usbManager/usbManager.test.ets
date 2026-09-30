/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may not obtain a copy of the License at
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
import { ENTINFO1, SELFWANT, SELFHAPNAME, INVALID_WANT, DEFAULT_USER_ID } from '../commom.test.ets';

import adminManager from '@ohos.enterprise.adminManager';
import common from '@ohos.enterprise.common';
import { usbManager } from '@kit.MDMKit';
import restrictions from '@ohos.enterprise.restrictions';

const PERMISSIVE_USB_DEVICES: Array<usbManager.PermissiveUsbDeviceType> = [
  { baseClass: 3, subClass: 1, protocol: 2, descriptor: usbManager.Descriptor.INTERFACE }
];

let PERMISSIVE_USB_DEVICES_1001: Array<usbManager.PermissiveUsbDeviceType> = new Array(1001);
function permissiveUsbDevicesInit() {
  for (let i = 0; i < PERMISSIVE_USB_DEVICES_1001.length; i++) {
    PERMISSIVE_USB_DEVICES_1001[i] = { baseClass: i / 256, subClass: i % 256 };
  }
}

const USB_ALLOWED_DEVICES: Array<usbManager.UsbDeviceId> = [
  { vendorId: 1, productId: 1 }
];

const USB_DISALLOWED_DEVICES: Array<usbManager.UsbDeviceType> = [
  { baseClass: 3, subClass: 1, protocol: 2, descriptor: usbManager.Descriptor.INTERFACE }
];

const LABEL_USB = 'usb';
const LABEL_USB_STORAGE_WRITE = 'usbStorageDeviceWrite';

export default function usbManagerTest() {
  describe('usbManager_test', () => {
    permissiveUsbDevicesInit();
    testAddDisallowedPermissiveUsbDevices();
    testRemoveDisallowedPermissiveUsbDevices();
    testGetDisallowedPermissiveUsbDevices();
    testGetUsbSerialNumber();
    testSetExternalStorageInterceptEnable();
    testIsExternalStorageInterceptEnable();
    testSetExternalStorageDeviceMountPolicy();
    testGetExternalStorageDeviceInfos();
  })
}

function testAddDisallowedPermissiveUsbDevices() {
  /**
   * @tc.name   test_addDisallowedPermissiveUsbDevices_0100
   * @tc.number SUB_CUSTOMIZATION_EDM_ADD_DISALLOWED_PERMISSIVE_USB_DEVICES_JS_0100
   * @tc.desc   test addDisallowedPermissiveUsbDevices without admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_addDisallowedPermissiveUsbDevices_0100", Level.LEVEL2, async (done: Function) => {
    try {
      usbManager.addDisallowedPermissiveUsbDevices(SELFWANT, PERMISSIVE_USB_DEVICES);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code === 9200001).assertTrue();
    }
    done();
  });

  /**
   * @tc.name   test_addDisallowedPermissiveUsbDevices_0200
   * @tc.number SUB_CUSTOMIZATION_EDM_ADD_DISALLOWED_PERMISSIVE_USB_DEVICES_JS_0200
   * @tc.desc   test addDisallowedPermissiveUsbDevices with normal admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_addDisallowedPermissiveUsbDevices_0200", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
    try {
      usbManager.addDisallowedPermissiveUsbDevices(SELFWANT, PERMISSIVE_USB_DEVICES);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code === 9200002).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.name   test_addDisallowedPermissiveUsbDevices_0300
   * @tc.number SUB_CUSTOMIZATION_EDM_ADD_DISALLOWED_PERMISSIVE_USB_DEVICES_JS_0300
   * @tc.desc   test addDisallowedPermissiveUsbDevices with null admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_addDisallowedPermissiveUsbDevices_0300", Level.LEVEL2, async (done: Function) => {
    try {
      usbManager.addDisallowedPermissiveUsbDevices(null, PERMISSIVE_USB_DEVICES);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code === 401).assertTrue();
    }
    done();
  });

  /**
   * @tc.name   test_addDisallowedPermissiveUsbDevices_0400
   * @tc.number SUB_CUSTOMIZATION_EDM_ADD_DISALLOWED_PERMISSIVE_USB_DEVICES_JS_0400
   * @tc.desc   test addDisallowedPermissiveUsbDevices with undefined admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_addDisallowedPermissiveUsbDevices_0400", Level.LEVEL2, async (done: Function) => {
    try {
      usbManager.addDisallowedPermissiveUsbDevices(undefined, PERMISSIVE_USB_DEVICES);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code === 401).assertTrue();
    }
    done();
  });

  /**
   * @tc.name   test_addDisallowedPermissiveUsbDevices_0500
   * @tc.number SUB_CUSTOMIZATION_EDM_ADD_DISALLOWED_PERMISSIVE_USB_DEVICES_JS_0500
   * @tc.desc   test addDisallowedPermissiveUsbDevices with invalid admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_addDisallowedPermissiveUsbDevices_0500", Level.LEVEL2, async (done: Function) => {
    try {
      usbManager.addDisallowedPermissiveUsbDevices(INVALID_WANT, PERMISSIVE_USB_DEVICES);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code === 401).assertTrue();
    }
    done();
  });

  /**
   * @tc.name   test_addDisallowedPermissiveUsbDevices_0600
   * @tc.number SUB_CUSTOMIZATION_EDM_ADD_DISALLOWED_PERMISSIVE_USB_DEVICES_JS_0600
   * @tc.desc   test addDisallowedPermissiveUsbDevices with null usbDevices
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_addDisallowedPermissiveUsbDevices_0600", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      usbManager.addDisallowedPermissiveUsbDevices(SELFWANT, null);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code === 401).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_addDisallowedPermissiveUsbDevices_0700
   * @tc.number SUB_CUSTOMIZATION_EDM_ADD_DISALLOWED_PERMISSIVE_USB_DEVICES_JS_0700
   * @tc.desc   test addDisallowedPermissiveUsbDevices with undefined usbDevices
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_addDisallowedPermissiveUsbDevices_0700", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      usbManager.addDisallowedPermissiveUsbDevices(SELFWANT, undefined);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code === 401).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_addDisallowedPermissiveUsbDevices_0800
   * @tc.number SUB_CUSTOMIZATION_EDM_ADD_DISALLOWED_PERMISSIVE_USB_DEVICES_JS_0800
   * @tc.desc   test addDisallowedPermissiveUsbDevices with empty usbDevices
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_addDisallowedPermissiveUsbDevices_0800", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      usbManager.addDisallowedPermissiveUsbDevices(SELFWANT, []);
      let result = usbManager.getDisallowedPermissiveUsbDevices(SELFWANT);
      expect(result.length === 0).assertTrue();
    } catch (error) {
      expect(false).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_addDisallowedPermissiveUsbDevices_0900
   * @tc.number SUB_CUSTOMIZATION_EDM_ADD_DISALLOWED_PERMISSIVE_USB_DEVICES_JS_0900
   * @tc.desc   test addDisallowedPermissiveUsbDevices with usbDevices exceeding limit
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_addDisallowedPermissiveUsbDevices_0900", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      usbManager.addDisallowedPermissiveUsbDevices(SELFWANT, PERMISSIVE_USB_DEVICES_1001);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code === 9200012).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_addDisallowedPermissiveUsbDevices_1000
   * @tc.number SUB_CUSTOMIZATION_EDM_ADD_DISALLOWED_PERMISSIVE_USB_DEVICES_JS_1000
   * @tc.desc   test addDisallowedPermissiveUsbDevices with addDisallowedUsbDevices conflict
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_addDisallowedPermissiveUsbDevices_1000", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      usbManager.addDisallowedUsbDevices(SELFWANT, USB_DISALLOWED_DEVICES);
      usbManager.addDisallowedPermissiveUsbDevices(SELFWANT, PERMISSIVE_USB_DEVICES);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code === 9200010).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_addDisallowedPermissiveUsbDevices_1100
   * @tc.number SUB_CUSTOMIZATION_EDM_ADD_DISALLOWED_PERMISSIVE_USB_DEVICES_JS_1100
   * @tc.desc   test addDisallowedPermissiveUsbDevices with addAllowedUsbDevices conflict
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_addDisallowedPermissiveUsbDevices_1100", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      usbManager.addAllowedUsbDevices(SELFWANT, USB_ALLOWED_DEVICES);
      usbManager.addDisallowedPermissiveUsbDevices(SELFWANT, PERMISSIVE_USB_DEVICES);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code === 9200010).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_addDisallowedPermissiveUsbDevices_1200
   * @tc.number SUB_CUSTOMIZATION_EDM_ADD_DISALLOWED_PERMISSIVE_USB_DEVICES_JS_1200
   * @tc.desc   test addDisallowedPermissiveUsbDevices with setDisallowedPolicy usb conflict
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_addDisallowedPermissiveUsbDevices_1200", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      restrictions.setDisallowedPolicy(SELFWANT, LABEL_USB, true);
      usbManager.addDisallowedPermissiveUsbDevices(SELFWANT, PERMISSIVE_USB_DEVICES);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code === 9200010).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_addDisallowedPermissiveUsbDevices_1300
   * @tc.number SUB_CUSTOMIZATION_EDM_ADD_DISALLOWED_PERMISSIVE_USB_DEVICES_JS_1300
   * @tc.desc   test addDisallowedPermissiveUsbDevices with setDisallowedPolicyForAccount usbStorageDeviceWrite conflict
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_addDisallowedPermissiveUsbDevices_1300", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      restrictions.setDisallowedPolicyForAccount(SELFWANT, LABEL_USB_STORAGE_WRITE, true, DEFAULT_USER_ID);
      let res = restrictions.getDisallowedPolicyForAccount(SELFWANT, LABEL_USB_STORAGE_WRITE, DEFAULT_USER_ID);
      expect(res).assertTrue();
      let usbDevices: Array<usbManager.UsbDeviceType> = [
        {baseClass: 8, subClass: 2, protocol: 2, descriptor: usbManager.Descriptor.INTERFACE}
      ]
      usbManager.addDisallowedPermissiveUsbDevices(SELFWANT, usbDevices);
      expect(false).assertTrue();
    } catch (error) {
      if (Number(error.code) === 801) {
        expect(Number(error.code) === 801).assertTrue();
      } else {
        expect(error.code === 9200010).assertTrue();
      }
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_addDisallowedPermissiveUsbDevices_1400
   * @tc.number SUB_CUSTOMIZATION_EDM_ADD_DISALLOWED_PERMISSIVE_USB_DEVICES_JS_1400
   * @tc.desc   test addDisallowedUsbDevices with addDisallowedPermissiveUsbDevices conflict (reverse)
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_addDisallowedPermissiveUsbDevices_1400", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      usbManager.addDisallowedPermissiveUsbDevices(SELFWANT, PERMISSIVE_USB_DEVICES);
      usbManager.addDisallowedUsbDevices(SELFWANT, USB_DISALLOWED_DEVICES);
      expect(false).assertTrue();
    } catch (error) {
      expect(Number(error.code) === 9200010).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_addDisallowedPermissiveUsbDevices_1500
   * @tc.number SUB_CUSTOMIZATION_EDM_ADD_DISALLOWED_PERMISSIVE_USB_DEVICES_JS_1500
   * @tc.desc   test addAllowedUsbDevices with addDisallowedPermissiveUsbDevices conflict (reverse)
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_addDisallowedPermissiveUsbDevices_1500", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      usbManager.addDisallowedPermissiveUsbDevices(SELFWANT, PERMISSIVE_USB_DEVICES);
      usbManager.addAllowedUsbDevices(SELFWANT, USB_ALLOWED_DEVICES);
      expect(false).assertTrue();
    } catch (error) {
      expect(Number(error.code) === 9200010).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_addDisallowedPermissiveUsbDevices_1600
   * @tc.number SUB_CUSTOMIZATION_EDM_ADD_DISALLOWED_PERMISSIVE_USB_DEVICES_JS_1600
   * @tc.desc   test setDisallowedPolicy usb with addDisallowedPermissiveUsbDevices conflict (reverse)
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_addDisallowedPermissiveUsbDevices_1600", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      usbManager.addDisallowedPermissiveUsbDevices(SELFWANT, PERMISSIVE_USB_DEVICES);
      restrictions.setDisallowedPolicy(SELFWANT, LABEL_USB, true);
      expect(false).assertTrue();
    } catch (error) {
      expect(Number(error.code) === 9200010).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_addDisallowedPermissiveUsbDevices_1700
   * @tc.number SUB_CUSTOMIZATION_EDM_ADD_DISALLOWED_PERMISSIVE_USB_DEVICES_JS_1700
   * @tc.desc   test setDisallowedPolicyForAccount usbStorageDeviceWrite with addDisallowedPermissiveUsbDevices conflict (reverse)
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_addDisallowedPermissiveUsbDevices_1700", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      let usbDevices: Array<usbManager.UsbDeviceType> = [
        {baseClass: 8, subClass: 2, protocol: 2, descriptor: usbManager.Descriptor.INTERFACE}
      ]
      usbManager.addDisallowedPermissiveUsbDevices(SELFWANT, usbDevices);
      let result = usbManager.getDisallowedPermissiveUsbDevices(SELFWANT);
      expect(result.length === 1).assertTrue();
      restrictions.setDisallowedPolicyForAccount(SELFWANT, LABEL_USB_STORAGE_WRITE, true, DEFAULT_USER_ID);
      expect(false).assertTrue();
    } catch (error) {
      if (Number(error.code) === 801) {
        expect(Number(error.code) === 801).assertTrue();
      } else {
        expect(Number(error.code) === 9200010).assertTrue();
      }
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_addDisallowedPermissiveUsbDevices_1800
   * @tc.number SUB_CUSTOMIZATION_EDM_ADD_DISALLOWED_PERMISSIVE_USB_DEVICES_JS_1800
   * @tc.desc   test addDisallowedPermissiveUsbDevices success
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_addDisallowedPermissiveUsbDevices_1800", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      usbManager.addDisallowedPermissiveUsbDevices(SELFWANT, PERMISSIVE_USB_DEVICES);
      let result = usbManager.getDisallowedPermissiveUsbDevices(SELFWANT);
      expect(result.length > 0).assertTrue();
      usbManager.removeDisallowedPermissiveUsbDevices(SELFWANT, PERMISSIVE_USB_DEVICES);
    } catch (error) {
      expect(false).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });
}

function testRemoveDisallowedPermissiveUsbDevices() {
  /**
   * @tc.name   test_removeDisallowedPermissiveUsbDevices_0100
   * @tc.number SUB_CUSTOMIZATION_EDM_REMOVE_DISALLOWED_PERMISSIVE_USB_DEVICES_JS_0100
   * @tc.desc   test removeDisallowedPermissiveUsbDevices without admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_removeDisallowedPermissiveUsbDevices_0100", Level.LEVEL2, async (done: Function) => {
    try {
      usbManager.removeDisallowedPermissiveUsbDevices(SELFWANT, PERMISSIVE_USB_DEVICES);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code === 9200001).assertTrue();
    }
    done();
  });

  /**
   * @tc.name   test_removeDisallowedPermissiveUsbDevices_0200
   * @tc.number SUB_CUSTOMIZATION_EDM_REMOVE_DISALLOWED_PERMISSIVE_USB_DEVICES_JS_0200
   * @tc.desc   test removeDisallowedPermissiveUsbDevices with normal admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_removeDisallowedPermissiveUsbDevices_0200", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
    try {
      usbManager.removeDisallowedPermissiveUsbDevices(SELFWANT, PERMISSIVE_USB_DEVICES);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code === 9200002).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.name   test_removeDisallowedPermissiveUsbDevices_0300
   * @tc.number SUB_CUSTOMIZATION_EDM_REMOVE_DISALLOWED_PERMISSIVE_USB_DEVICES_JS_0300
   * @tc.desc   test removeDisallowedPermissiveUsbDevices with null admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_removeDisallowedPermissiveUsbDevices_0300", Level.LEVEL2, async (done: Function) => {
    try {
      usbManager.removeDisallowedPermissiveUsbDevices(null, PERMISSIVE_USB_DEVICES);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code === 401).assertTrue();
    }
    done();
  });

  /**
   * @tc.name   test_removeDisallowedPermissiveUsbDevices_0400
   * @tc.number SUB_CUSTOMIZATION_EDM_REMOVE_DISALLOWED_PERMISSIVE_USB_DEVICES_JS_0400
   * @tc.desc   test removeDisallowedPermissiveUsbDevices with undefined admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_removeDisallowedPermissiveUsbDevices_0400", Level.LEVEL2, async (done: Function) => {
    try {
      usbManager.removeDisallowedPermissiveUsbDevices(undefined, PERMISSIVE_USB_DEVICES);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code === 401).assertTrue();
    }
    done();
  });

  /**
   * @tc.name   test_removeDisallowedPermissiveUsbDevices_0500
   * @tc.number SUB_CUSTOMIZATION_EDM_REMOVE_DISALLOWED_PERMISSIVE_USB_DEVICES_JS_0500
   * @tc.desc   test removeDisallowedPermissiveUsbDevices with invalid admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_removeDisallowedPermissiveUsbDevices_0500", Level.LEVEL2, async (done: Function) => {
    try {
      usbManager.removeDisallowedPermissiveUsbDevices(INVALID_WANT, PERMISSIVE_USB_DEVICES);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code === 401).assertTrue();
    }
    done();
  });

  /**
   * @tc.name   test_removeDisallowedPermissiveUsbDevices_0600
   * @tc.number SUB_CUSTOMIZATION_EDM_REMOVE_DISALLOWED_PERMISSIVE_USB_DEVICES_JS_0600
   * @tc.desc   test removeDisallowedPermissiveUsbDevices with null usbDevices
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_removeDisallowedPermissiveUsbDevices_0600", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      usbManager.removeDisallowedPermissiveUsbDevices(SELFWANT, null);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code === 401).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_removeDisallowedPermissiveUsbDevices_0700
   * @tc.number SUB_CUSTOMIZATION_EDM_REMOVE_DISALLOWED_PERMISSIVE_USB_DEVICES_JS_0700
   * @tc.desc   test removeDisallowedPermissiveUsbDevices with undefined usbDevices
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_removeDisallowedPermissiveUsbDevices_0700", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      usbManager.removeDisallowedPermissiveUsbDevices(SELFWANT, undefined);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code === 401).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_removeDisallowedPermissiveUsbDevices_0800
   * @tc.number SUB_CUSTOMIZATION_EDM_REMOVE_DISALLOWED_PERMISSIVE_USB_DEVICES_JS_0800
   * @tc.desc   test removeDisallowedPermissiveUsbDevices with empty usbDevices
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_removeDisallowedPermissiveUsbDevices_0800", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      usbManager.addDisallowedPermissiveUsbDevices(SELFWANT, PERMISSIVE_USB_DEVICES);
      usbManager.removeDisallowedPermissiveUsbDevices(SELFWANT, []);
      let result = usbManager.getDisallowedPermissiveUsbDevices(SELFWANT);
      expect(result.length === 1).assertTrue();
    } catch (error) {
      expect(false).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_removeDisallowedPermissiveUsbDevices_0900
   * @tc.number SUB_CUSTOMIZATION_EDM_REMOVE_DISALLOWED_PERMISSIVE_USB_DEVICES_JS_0900
   * @tc.desc   test removeDisallowedPermissiveUsbDevices with usbDevices exceeding limit
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_removeDisallowedPermissiveUsbDevices_0900", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      usbManager.removeDisallowedPermissiveUsbDevices(SELFWANT, PERMISSIVE_USB_DEVICES_1001);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code === 9200012).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_removeDisallowedPermissiveUsbDevices_1000
   * @tc.number SUB_CUSTOMIZATION_EDM_REMOVE_DISALLOWED_PERMISSIVE_USB_DEVICES_JS_1000
   * @tc.desc   test removeDisallowedPermissiveUsbDevices success
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_removeDisallowedPermissiveUsbDevices_1000", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      usbManager.addDisallowedPermissiveUsbDevices(SELFWANT, PERMISSIVE_USB_DEVICES);
      usbManager.removeDisallowedPermissiveUsbDevices(SELFWANT, PERMISSIVE_USB_DEVICES);
    } catch (error) {
      expect(false).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });
}

function testGetDisallowedPermissiveUsbDevices() {
  /**
   * @tc.name   test_getDisallowedPermissiveUsbDevices_0100
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_DISALLOWED_PERMISSIVE_USB_DEVICES_JS_0100
   * @tc.desc   test getDisallowedPermissiveUsbDevices without admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_getDisallowedPermissiveUsbDevices_0100", Level.LEVEL2, async (done: Function) => {
    try {
      usbManager.getDisallowedPermissiveUsbDevices(SELFWANT);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code === 9200001).assertTrue();
    }
    done();
  });

  /**
   * @tc.name   test_getDisallowedPermissiveUsbDevices_0200
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_DISALLOWED_PERMISSIVE_USB_DEVICES_JS_0200
   * @tc.desc   test getDisallowedPermissiveUsbDevices with normal admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_getDisallowedPermissiveUsbDevices_0200", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
    try {
      usbManager.getDisallowedPermissiveUsbDevices(SELFWANT);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code === 9200002).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.name   test_getDisallowedPermissiveUsbDevices_0300
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_DISALLOWED_PERMISSIVE_USB_DEVICES_JS_0300
   * @tc.desc   test getDisallowedPermissiveUsbDevices with undefined admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_getDisallowedPermissiveUsbDevices_0300", Level.LEVEL2, async (done: Function) => {
    try {
      usbManager.getDisallowedPermissiveUsbDevices(undefined);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code === 401).assertTrue();
    }
    done();
  });

  /**
   * @tc.name   test_getDisallowedPermissiveUsbDevices_0400
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_DISALLOWED_PERMISSIVE_USB_DEVICES_JS_0400
   * @tc.desc   test getDisallowedPermissiveUsbDevices success with SELFWANT
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_getDisallowedPermissiveUsbDevices_0400", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      usbManager.addDisallowedPermissiveUsbDevices(SELFWANT, PERMISSIVE_USB_DEVICES);
      let result = usbManager.getDisallowedPermissiveUsbDevices(SELFWANT);
      expect(result.length > 0).assertTrue();
      usbManager.removeDisallowedPermissiveUsbDevices(SELFWANT, PERMISSIVE_USB_DEVICES);
    } catch (error) {
      expect(false).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_getDisallowedPermissiveUsbDevices_0500
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_DISALLOWED_PERMISSIVE_USB_DEVICES_JS_0500
   * @tc.desc   test getDisallowedPermissiveUsbDevices success with null admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_getDisallowedPermissiveUsbDevices_0500", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      usbManager.addDisallowedPermissiveUsbDevices(SELFWANT, PERMISSIVE_USB_DEVICES);
      let result = usbManager.getDisallowedPermissiveUsbDevices(null);
      expect(result.length > 0).assertTrue();
      usbManager.removeDisallowedPermissiveUsbDevices(SELFWANT, PERMISSIVE_USB_DEVICES);
    } catch (error) {
      expect(false).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });
}

function testGetUsbSerialNumber() {
  /**
   * @tc.name   test_getUsbSerialNumber_0100
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_USB_SERIAL_NUMBER_JS_0100
   * @tc.desc   test getUsbSerialNumber without admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_getUsbSerialNumber_0100", Level.LEVEL2, async (done: Function) => {
    try {
      usbManager.getUsbSerialNumber(1, 1);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code === 9200001).assertTrue();
    }
    done();
  });

  /**
   * @tc.name   test_getUsbSerialNumber_0200
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_USB_SERIAL_NUMBER_JS_0200
   * @tc.desc   test getUsbSerialNumber with normal admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_getUsbSerialNumber_0200", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
    try {
      usbManager.getUsbSerialNumber(1, 1);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code === 9200002).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.name   test_getUsbSerialNumber_0300
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_USB_SERIAL_NUMBER_JS_0300
   * @tc.desc   test getUsbSerialNumber with null busNum
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_getUsbSerialNumber_0300", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      usbManager.getUsbSerialNumber(null, 1);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code === 401).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_getUsbSerialNumber_0400
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_USB_SERIAL_NUMBER_JS_0400
   * @tc.desc   test getUsbSerialNumber with undefined busNum
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_getUsbSerialNumber_0400", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      usbManager.getUsbSerialNumber(undefined, 1);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code === 401).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_getUsbSerialNumber_0500
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_USB_SERIAL_NUMBER_JS_0500
   * @tc.desc   test getUsbSerialNumber with null devAddress
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_getUsbSerialNumber_0500", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      usbManager.getUsbSerialNumber(1, null);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code === 401).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_getUsbSerialNumber_0600
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_USB_SERIAL_NUMBER_JS_0600
   * @tc.desc   test getUsbSerialNumber with undefined devAddress
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_getUsbSerialNumber_0600", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      usbManager.getUsbSerialNumber(1, undefined);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code === 401).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_getUsbSerialNumber_0700
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_USB_SERIAL_NUMBER_JS_0700
   * @tc.desc   test getUsbSerialNumber with invalid busNum
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_getUsbSerialNumber_0700", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      usbManager.getUsbSerialNumber(-1, 1);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code === 9200012).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_getUsbSerialNumber_0800
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_USB_SERIAL_NUMBER_JS_0800
   * @tc.desc   test getUsbSerialNumber with invalid devAddress
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_getUsbSerialNumber_0800", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      usbManager.getUsbSerialNumber(1, -1);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code === 9200012).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });
}

function testSetExternalStorageInterceptEnable() {
  /**
   * @tc.name   test_setExternalStorageInterceptEnable_0100
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_EXTERNAL_STORAGE_INTERCEPT_ENABLE_JS_0100
   * @tc.desc   test setExternalStorageInterceptEnable without admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_setExternalStorageInterceptEnable_0100", Level.LEVEL2, async (done: Function) => {
    try {
      usbManager.setExternalStorageInterceptEnable(true);
      expect().assertFail();
    } catch (error) {
      expect(error.code).assertEqual(9200001);
    }
    done();
  });

  /**
   * @tc.name   test_setExternalStorageInterceptEnable_0200
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_EXTERNAL_STORAGE_INTERCEPT_ENABLE_JS_0200
   * @tc.desc   test setExternalStorageInterceptEnable with normal admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_setExternalStorageInterceptEnable_0200", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
    try {
      usbManager.setExternalStorageInterceptEnable(true);
      expect().assertFail();
    } catch (error) {
      expect(error.code).assertEqual(9200002);
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.name   test_setExternalStorageInterceptEnable_0300
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_EXTERNAL_STORAGE_INTERCEPT_ENABLE_JS_0300
   * @tc.desc   test setExternalStorageInterceptEnable with null enable
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_setExternalStorageInterceptEnable_0300", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      usbManager.setExternalStorageInterceptEnable(null);
      expect().assertFail();
    } catch (error) {
      expect(error.code).assertEqual(401);
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_setExternalStorageInterceptEnable_0400
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_EXTERNAL_STORAGE_INTERCEPT_ENABLE_JS_0400
   * @tc.desc   test setExternalStorageInterceptEnable with undefined enable
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_setExternalStorageInterceptEnable_0400", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      usbManager.setExternalStorageInterceptEnable(undefined);
      expect().assertFail();
    } catch (error) {
      expect(error.code).assertEqual(401);
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_setExternalStorageInterceptEnable_0500
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_EXTERNAL_STORAGE_INTERCEPT_ENABLE_JS_0500
   * @tc.desc   test setExternalStorageInterceptEnable with setDisallowedPolicy usb conflict
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_setExternalStorageInterceptEnable_0500", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      restrictions.setDisallowedPolicy(SELFWANT, LABEL_USB, true);
      usbManager.setExternalStorageInterceptEnable(true);
      expect().assertFail();
    } catch (error) {
      expect(error.code).assertEqual(9200010);
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_setExternalStorageInterceptEnable_0600
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_EXTERNAL_STORAGE_INTERCEPT_ENABLE_JS_0600
   * @tc.desc   test setExternalStorageInterceptEnable with addAllowedUsbDevices conflict
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_setExternalStorageInterceptEnable_0600", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      usbManager.addAllowedUsbDevices(SELFWANT, USB_ALLOWED_DEVICES);
      usbManager.setExternalStorageInterceptEnable(true);
      expect().assertFail();
    } catch (error) {
      expect(error.code).assertEqual(9200010);
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_setExternalStorageInterceptEnable_0700
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_EXTERNAL_STORAGE_INTERCEPT_ENABLE_JS_0700
   * @tc.desc   test setExternalStorageInterceptEnable with addDisallowedUsbDevices conflict
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_setExternalStorageInterceptEnable_0700", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      usbManager.addDisallowedUsbDevices(SELFWANT, USB_DISALLOWED_DEVICES);
      usbManager.setExternalStorageInterceptEnable(true);
      expect().assertFail();
    } catch (error) {
      expect(error.code).assertEqual(9200010);
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_setExternalStorageInterceptEnable_0800
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_EXTERNAL_STORAGE_INTERCEPT_ENABLE_JS_0800
   * @tc.desc   test setExternalStorageInterceptEnable with addDisallowedPermissiveUsbDevices conflict
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_setExternalStorageInterceptEnable_0800", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      usbManager.addDisallowedPermissiveUsbDevices(SELFWANT, PERMISSIVE_USB_DEVICES);
      usbManager.setExternalStorageInterceptEnable(true);
      expect().assertFail();
    } catch (error) {
      expect(error.code).assertEqual(9200010);
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_setExternalStorageInterceptEnable_0900
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_EXTERNAL_STORAGE_INTERCEPT_ENABLE_JS_0900
   * @tc.desc   test setExternalStorageInterceptEnable with setUsbStorageDeviceAccessPolicy DISABLED conflict
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_setExternalStorageInterceptEnable_0900", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      usbManager.setUsbStorageDeviceAccessPolicy(SELFWANT, usbManager.UsbPolicy.DISABLED);
      usbManager.setExternalStorageInterceptEnable(true);
      expect().assertFail();
    } catch (error) {
      expect(error.code).assertEqual(9200010);
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_setExternalStorageInterceptEnable_1000
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_EXTERNAL_STORAGE_INTERCEPT_ENABLE_JS_1000
   * @tc.desc   test setExternalStorageInterceptEnable with setDisallowedPolicyForAccount usbStorageDeviceWrite conflict
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_setExternalStorageInterceptEnable_1000", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      restrictions.setDisallowedPolicyForAccount(SELFWANT, LABEL_USB_STORAGE_WRITE, true, DEFAULT_USER_ID);
      usbManager.setExternalStorageInterceptEnable(true);
      expect().assertFail();
    } catch (error) {
      if (error.code === '801') {
        expect(error.code).assertEqual('801');
      } else {
        expect(error.code).assertEqual(9200010);
      }
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_setExternalStorageInterceptEnable_1100
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_EXTERNAL_STORAGE_INTERCEPT_ENABLE_JS_1100
   * @tc.desc   test setExternalStorageInterceptEnable success with enable true
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_setExternalStorageInterceptEnable_1100", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      usbManager.setExternalStorageInterceptEnable(true);
      let result = usbManager.isExternalStorageInterceptEnable();
      expect(result).assertEqual(true);
      usbManager.setExternalStorageInterceptEnable(false);
      result = usbManager.isExternalStorageInterceptEnable();
      expect(result).assertEqual(false);
    } catch (error) {
      expect().assertFail();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_setExternalStorageInterceptEnable_1200
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_EXTERNAL_STORAGE_INTERCEPT_ENABLE_JS_1200
   * @tc.desc   test setExternalStorageInterceptEnable success with enable false
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_setExternalStorageInterceptEnable_1200", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      usbManager.setExternalStorageInterceptEnable(false);
      let result = usbManager.isExternalStorageInterceptEnable();
      expect(result).assertEqual(false);
      usbManager.setExternalStorageInterceptEnable(true);
      result = usbManager.isExternalStorageInterceptEnable();
      expect(result).assertEqual(true);
    } catch (error) {
      expect().assertFail();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });
}

function testIsExternalStorageInterceptEnable() {
  /**
   * @tc.name   test_isExternalStorageInterceptEnable_0100
   * @tc.number SUB_CUSTOMIZATION_EDM_IS_EXTERNAL_STORAGE_INTERCEPT_ENABLE_JS_0100
   * @tc.desc   test isExternalStorageInterceptEnable without admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_isExternalStorageInterceptEnable_0100", Level.LEVEL2, async (done: Function) => {
    try {
      usbManager.isExternalStorageInterceptEnable(common.QueryPolicy.SELF);
      expect().assertFail();
    } catch (error) {
      expect(error.code).assertEqual(9200001);
    }
    done();
  });

  /**
   * @tc.name   test_isExternalStorageInterceptEnable_0200
   * @tc.number SUB_CUSTOMIZATION_EDM_IS_EXTERNAL_STORAGE_INTERCEPT_ENABLE_JS_0200
   * @tc.desc   test isExternalStorageInterceptEnable with normal admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_isExternalStorageInterceptEnable_0200", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
    try {
      usbManager.isExternalStorageInterceptEnable(common.QueryPolicy.SELF);
      expect().assertFail();
    } catch (error) {
      expect(error.code).assertEqual(9200002);
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.name   test_isExternalStorageInterceptEnable_0300
   * @tc.number SUB_CUSTOMIZATION_EDM_IS_EXTERNAL_STORAGE_INTERCEPT_ENABLE_JS_0300
   * @tc.desc   test isExternalStorageInterceptEnable success with null queryPolicy
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_isExternalStorageInterceptEnable_0300", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      let result = usbManager.isExternalStorageInterceptEnable(null);
      expect(typeof result === 'boolean').assertEqual(true);
    } catch (error) {
      expect().assertFail();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_isExternalStorageInterceptEnable_0400
   * @tc.number SUB_CUSTOMIZATION_EDM_IS_EXTERNAL_STORAGE_INTERCEPT_ENABLE_JS_0400
   * @tc.desc   test isExternalStorageInterceptEnable success with undefined queryPolicy
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_isExternalStorageInterceptEnable_0400", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      let result = usbManager.isExternalStorageInterceptEnable(undefined);
      expect(typeof result === 'boolean').assertEqual(true);
    } catch (error) {
      expect().assertFail();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_isExternalStorageInterceptEnable_0500
   * @tc.number SUB_CUSTOMIZATION_EDM_IS_EXTERNAL_STORAGE_INTERCEPT_ENABLE_JS_0500
   * @tc.desc   test isExternalStorageInterceptEnable success with invalid queryPolicy
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_isExternalStorageInterceptEnable_0500", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      let result = usbManager.isExternalStorageInterceptEnable(2);
      expect(typeof result === 'boolean').assertEqual(true);
    } catch (error) {
      expect().assertFail();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_isExternalStorageInterceptEnable_0600
   * @tc.number SUB_CUSTOMIZATION_EDM_IS_EXTERNAL_STORAGE_INTERCEPT_ENABLE_JS_0600
   * @tc.desc   test isExternalStorageInterceptEnable success with QueryPolicy.SELF
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_isExternalStorageInterceptEnable_0600", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      let result = usbManager.isExternalStorageInterceptEnable(common.QueryPolicy.SELF);
      expect(typeof result === 'boolean').assertEqual(true);
    } catch (error) {
      expect().assertFail();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_isExternalStorageInterceptEnable_0700
   * @tc.number SUB_CUSTOMIZATION_EDM_IS_EXTERNAL_STORAGE_INTERCEPT_ENABLE_JS_0700
   * @tc.desc   test isExternalStorageInterceptEnable success with QueryPolicy.ALL
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_isExternalStorageInterceptEnable_0700", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      let result = usbManager.isExternalStorageInterceptEnable(common.QueryPolicy.ALL);
      expect(typeof result === 'boolean').assertEqual(true);
    } catch (error) {
      expect().assertFail();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_isExternalStorageInterceptEnable_0800
   * @tc.number SUB_CUSTOMIZATION_EDM_IS_EXTERNAL_STORAGE_INTERCEPT_ENABLE_JS_0800
   * @tc.desc   test isExternalStorageInterceptEnable without queryPolicy and without admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_isExternalStorageInterceptEnable_0800", Level.LEVEL2, async (done: Function) => {
    try {
      usbManager.isExternalStorageInterceptEnable();
      expect().assertFail();
    } catch (error) {
      expect(error.code).assertEqual(9200001);
    }
    done();
  });

  /**
   * @tc.name   test_isExternalStorageInterceptEnable_0900
   * @tc.number SUB_CUSTOMIZATION_EDM_IS_EXTERNAL_STORAGE_INTERCEPT_ENABLE_JS_0900
   * @tc.desc   test isExternalStorageInterceptEnable without queryPolicy and with normal admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_isExternalStorageInterceptEnable_0900", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
    try {
      usbManager.isExternalStorageInterceptEnable();
      expect().assertFail();
    } catch (error) {
      expect(error.code).assertEqual(9200002);
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.name   test_isExternalStorageInterceptEnable_1000
   * @tc.number SUB_CUSTOMIZATION_EDM_IS_EXTERNAL_STORAGE_INTERCEPT_ENABLE_JS_1000
   * @tc.desc   test isExternalStorageInterceptEnable success without queryPolicy
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_isExternalStorageInterceptEnable_1000", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      let result = usbManager.isExternalStorageInterceptEnable();
      expect(typeof result === 'boolean').assertEqual(true);
    } catch (error) {
      expect().assertFail();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });
}

function testSetExternalStorageDeviceMountPolicy() {
  /**
   * @tc.name   test_setExternalStorageDeviceMountPolicy_0100
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_EXTERNAL_STORAGE_DEVICE_MOUNT_POLICY_JS_0100
   * @tc.desc   test setExternalStorageDeviceMountPolicy without admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_setExternalStorageDeviceMountPolicy_0100", Level.LEVEL2, async (done: Function) => {
    try {
      usbManager.setExternalStorageDeviceMountPolicy('testVolumeId', usbManager.MountPolicy.MOUNT_READ_WRITE);
      expect().assertFail();
    } catch (error) {
      expect(error.code).assertEqual(9200001);
    }
    done();
  });

  /**
   * @tc.name   test_setExternalStorageDeviceMountPolicy_0200
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_EXTERNAL_STORAGE_DEVICE_MOUNT_POLICY_JS_0200
   * @tc.desc   test setExternalStorageDeviceMountPolicy with normal admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_setExternalStorageDeviceMountPolicy_0200", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
    try {
      usbManager.setExternalStorageDeviceMountPolicy('testVolumeId', usbManager.MountPolicy.MOUNT_READ_WRITE);
      expect().assertFail();
    } catch (error) {
      expect(error.code).assertEqual(9200002);
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.name   test_setExternalStorageDeviceMountPolicy_0300
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_EXTERNAL_STORAGE_DEVICE_MOUNT_POLICY_JS_0300
   * @tc.desc   test setExternalStorageDeviceMountPolicy with null volumeId
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_setExternalStorageDeviceMountPolicy_0300", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      usbManager.setExternalStorageDeviceMountPolicy(null, usbManager.MountPolicy.MOUNT_READ_WRITE);
      expect().assertFail();
    } catch (error) {
      expect(error.code).assertEqual(401);
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_setExternalStorageDeviceMountPolicy_0400
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_EXTERNAL_STORAGE_DEVICE_MOUNT_POLICY_JS_0400
   * @tc.desc   test setExternalStorageDeviceMountPolicy with undefined volumeId
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_setExternalStorageDeviceMountPolicy_0400", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      usbManager.setExternalStorageDeviceMountPolicy(undefined, usbManager.MountPolicy.MOUNT_READ_WRITE);
      expect().assertFail();
    } catch (error) {
      expect(error.code).assertEqual(401);
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_setExternalStorageDeviceMountPolicy_0500
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_EXTERNAL_STORAGE_DEVICE_MOUNT_POLICY_JS_0500
   * @tc.desc   test setExternalStorageDeviceMountPolicy with empty volumeId
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_setExternalStorageDeviceMountPolicy_0500", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      usbManager.setExternalStorageDeviceMountPolicy('', usbManager.MountPolicy.MOUNT_READ_WRITE);
      expect().assertFail();
    } catch (error) {
      expect(error.code).assertEqual(9200012);
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_setExternalStorageDeviceMountPolicy_0600
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_EXTERNAL_STORAGE_DEVICE_MOUNT_POLICY_JS_0600
   * @tc.desc   test setExternalStorageDeviceMountPolicy with null policy
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_setExternalStorageDeviceMountPolicy_0600", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      usbManager.setExternalStorageDeviceMountPolicy('testVolumeId', null);
      expect().assertFail();
    } catch (error) {
      expect(error.code).assertEqual(401);
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_setExternalStorageDeviceMountPolicy_0700
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_EXTERNAL_STORAGE_DEVICE_MOUNT_POLICY_JS_0700
   * @tc.desc   test setExternalStorageDeviceMountPolicy with undefined policy
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_setExternalStorageDeviceMountPolicy_0700", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      usbManager.setExternalStorageDeviceMountPolicy('testVolumeId', undefined);
      expect().assertFail();
    } catch (error) {
      expect(error.code).assertEqual(401);
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_setExternalStorageDeviceMountPolicy_0800
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_EXTERNAL_STORAGE_DEVICE_MOUNT_POLICY_JS_0800
   * @tc.desc   test setExternalStorageDeviceMountPolicy with invalid policy
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_setExternalStorageDeviceMountPolicy_0800", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      usbManager.setExternalStorageDeviceMountPolicy('testVolumeId', 999);
      expect().assertFail();
    } catch (error) {
      expect(error.code).assertEqual(9200012);
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });
}

function testGetExternalStorageDeviceInfos() {
  /**
   * @tc.name   test_getExternalStorageDeviceInfos_0100
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_EXTERNAL_STORAGE_DEVICE_INFOS_JS_0100
   * @tc.desc   test getExternalStorageDeviceInfos without admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_getExternalStorageDeviceInfos_0100", Level.LEVEL2, async (done: Function) => {
    try {
      usbManager.getExternalStorageDeviceInfos();
      expect().assertFail();
    } catch (error) {
      expect(error.code).assertEqual(9200001);
    }
    done();
  });

  /**
   * @tc.name   test_getExternalStorageDeviceInfos_0200
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_EXTERNAL_STORAGE_DEVICE_INFOS_JS_0200
   * @tc.desc   test getExternalStorageDeviceInfos with normal admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_getExternalStorageDeviceInfos_0200", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
    try {
      usbManager.getExternalStorageDeviceInfos();
      expect().assertFail();
    } catch (error) {
      expect(error.code).assertEqual(9200002);
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.name   test_getExternalStorageDeviceInfos_0300
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_EXTERNAL_STORAGE_DEVICE_INFOS_JS_0300
   * @tc.desc   test getExternalStorageDeviceInfos success
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_getExternalStorageDeviceInfos_0300", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      let result = usbManager.getExternalStorageDeviceInfos();
      expect(Array.isArray(result)).assertEqual(true);
    } catch (error) {
      expect().assertFail();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });
}