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
import { ENTINFO1, SELFWANT, SELFHAPNAME } from '../commom';

import adminManager from '@ohos.enterprise.adminManager';
import common from '@ohos.enterprise.common';
import { usbManager } from '@kit.MDMKit';
import restrictions from '@ohos.enterprise.restrictions';

const DISALLOWED_USB_DEVICES_MAX_SIZE = 200;
const LABEL_USB = 'usb';

const OPTICAL_DISC_BURN_USB_DEVICES: Array<usbManager.UsbDevice> = [
  { vendorId: 1, productId: 1, serial: 'serial001' }
];

export default function usbManagerTest() {
  describe('usbManager_test', () => {
    testAddAllowedUsbDevices();
    testRemoveAllowedUsbDevices();
    testGetAllowedUsbDevices();
    testSetUsbStorageDeviceAccessPolicy();
    testGetUsbStorageDeviceAccessPolicy();
    testAddDisallowedUsbDevices();
    testRemoveDisallowedUsbDevices();
    testGetDisallowedUsbDevices();
    testAddDisallowedPermissiveUsbDevices();
    testRemoveDisallowedPermissiveUsbDevices();
    testGetDisallowedPermissiveUsbDevices();
    testGetUsbSerialNumber();
    testAddAllowedOpticalDiscDriveBurnUsbDevices();
    testRemoveAllowedOpticalDiscDriveBurnUsbDevices();
    testGetAllowedOpticalDiscDriveBurnUsbDevices();
    testSetExternalStorageInterceptEnable();
    testIsExternalStorageInterceptEnable();
    testSetExternalStorageDeviceMountPolicy();
    testGetExternalStorageDeviceInfos();
  })
}

function testAddAllowedUsbDevices() {
  /**
   * @tc.name   test_add_allowed_usb_devices_0001
   * @tc.number SUB_CUSTOMIZATION_EDM_ADD_USB_DEVICES_JS_0001
   * @tc.desc   test usbManager addAllowedUsbDevices with normal admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_add_allowed_usb_devices_0001", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
    try {
      let devices: Array<usbManager.UsbDeviceId> = [
        {vendorId: 1, productId: 1},
        {vendorId: 22, productId: 33},
      ]
      usbManager.addAllowedUsbDevices(SELFWANT, devices);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 201).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });
}

function testRemoveAllowedUsbDevices() {
  /**
   * @tc.name   test_remove_allowed_usb_devices_0001
   * @tc.number SUB_CUSTOMIZATION_EDM_REMOVE_USB_DEVICES_JS_0001
   * @tc.desc   test usbManager removeAllowedUsbDevices with normal admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_remove_allowed_usb_devices_0001", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
    try {
      let devices: Array<usbManager.UsbDeviceId> = [
        {vendorId: 1, productId: 1},
        {vendorId: 22, productId: 33},
      ]
      usbManager.removeAllowedUsbDevices(SELFWANT, devices);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 201).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });
}

function testGetAllowedUsbDevices() {
  /**
   * @tc.name   test_get_allowed_usb_devices_0001
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_USB_DEVICES_JS_0001
   * @tc.desc   test usbManager getAllowedUsbDevices with normal admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_allowed_usb_devices_0001", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
    try {
      usbManager.getAllowedUsbDevices(SELFWANT);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 201).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });
}

function testSetUsbStorageDeviceAccessPolicy() {
  /**
   * @tc.name   test_set_usb_device_access_policy_0001
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_ALLOWED_USB_DEVICE_ACCESS_POLICY_JS_0001
   * @tc.desc   test usbManager setUsbStorageDeviceAccessPolicy with normal admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_usb_device_access_policy_0001", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
    try {
      usbManager.setUsbStorageDeviceAccessPolicy(SELFWANT, usbManager.UsbPolicy.READ_ONLY);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 201).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });
}

function testGetUsbStorageDeviceAccessPolicy() {
  /**
   * @tc.name   test_get_usb_device_access_policy_0002
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_ALLOWED_USB_DEVICE_ACCESS_POLICY_JS_0002
   * @tc.desc   test usbManager getUsbStorageDeviceAccessPolicy with normal admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_usb_device_access_policy_0002", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
    try {
      usbManager.getUsbStorageDeviceAccessPolicy(SELFWANT);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 201).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });
}

function testAddDisallowedUsbDevices() {
  /**
   * @tc.name   test_add_disallowed_usb_devices_0001
   * @tc.number SUB_CUSTOMIZATION_EDM_ADD_DISALLOWED_USB_DEVICES_JS_0001
   * @tc.desc   test usbManager addDisallowedUsbDevices with normal admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_add_disallowed_usb_devices_0001", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
    try {
      let devices: Array<usbManager.UsbDeviceType> = [
        {baseClass: 3, subClass: 1, protocol: 2, descriptor: usbManager.Descriptor.INTERFACE},
        {baseClass: 9, subClass: 0, protocol: 0, descriptor: usbManager.Descriptor.DEVICE},
      ]
      usbManager.addDisallowedUsbDevices(SELFWANT, devices);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 201).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });
}

function testRemoveDisallowedUsbDevices() {
  /**
   * @tc.name   test_remove_disallowed_usb_devices_0001
   * @tc.number SUB_CUSTOMIZATION_EDM_REMOVE_DISALLOWED_USB_DEVICES_JS_0001
   * @tc.desc   test usbManager removeDisallowedUsbDevices with normal admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_remove_disallowed_usb_devices_0001", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
    try {
      let devices: Array<usbManager.UsbDeviceType> = [
        {baseClass: 3, subClass: 1, protocol: 2, descriptor: usbManager.Descriptor.INTERFACE},
        {baseClass: 9, subClass: 0, protocol: 0, descriptor: usbManager.Descriptor.DEVICE},
      ]
      usbManager.removeDisallowedUsbDevices(SELFWANT, devices);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 201).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });
}

function testGetDisallowedUsbDevices() {
  /**
   * @tc.name   test_get_disallowed_usb_devices_0001
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_DISALLOWED_USB_DEVICES_JS_0001
   * @tc.desc   test usbManager getDisallowedUsbDevices with normal admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_disallowed_usb_devices_0001", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
    try {
      let devices: Array<usbManager.UsbDeviceType> = [
        {baseClass: 3, subClass: 1, protocol: 2, descriptor: usbManager.Descriptor.INTERFACE},
        {baseClass: 9, subClass: 0, protocol: 0, descriptor: usbManager.Descriptor.DEVICE},
      ]
      usbManager.getDisallowedUsbDevices(SELFWANT);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 201).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });
}

function testAddDisallowedPermissiveUsbDevices() {
  /**
   * @tc.name   test_add_disallowed_permissive_usb_devices_0100
   * @tc.number SUB_CUSTOMIZATION_EDM_ADD_DISALLOWED_PERMISSIVE_USB_DEVICES_NO_PERMISSION_JS_0100
   * @tc.desc   test usbManager addDisallowedPermissiveUsbDevices with permission denied 201
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_add_disallowed_permissive_usb_devices_0100", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
    try {
      let devices: Array<usbManager.PermissiveUsbDeviceType> = [
        {baseClass: 3, subClass: 1, protocol: 2, descriptor: usbManager.Descriptor.INTERFACE},
      ]
      usbManager.addDisallowedPermissiveUsbDevices(SELFWANT, devices);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code === 201).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });
}

function testRemoveDisallowedPermissiveUsbDevices() {
  /**
   * @tc.name   test_remove_disallowed_permissive_usb_devices_0100
   * @tc.number SUB_CUSTOMIZATION_EDM_REMOVE_DISALLOWED_PERMISSIVE_USB_DEVICES_NO_PERMISSION_JS_0100
   * @tc.desc   test usbManager removeDisallowedPermissiveUsbDevices with permission denied 201
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_remove_disallowed_permissive_usb_devices_0100", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
    try {
      let devices: Array<usbManager.PermissiveUsbDeviceType> = [
        {baseClass: 3, subClass: 1, protocol: 2, descriptor: usbManager.Descriptor.INTERFACE},
      ]
      usbManager.removeDisallowedPermissiveUsbDevices(SELFWANT, devices);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code === 201).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });
}

function testGetDisallowedPermissiveUsbDevices() {
  /**
   * @tc.name   test_get_disallowed_permissive_usb_devices_0100
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_DISALLOWED_PERMISSIVE_USB_DEVICES_NO_PERMISSION_JS_0100
   * @tc.desc   test usbManager getDisallowedPermissiveUsbDevices with permission denied 201
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_disallowed_permissive_usb_devices_0100", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
    try {
      usbManager.getDisallowedPermissiveUsbDevices(SELFWANT);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code === 201).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });
}

function testGetUsbSerialNumber() {
  /**
   * @tc.name   test_get_usb_serial_number_0100
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_USB_SERIAL_NUMBER_NO_PERMISSION_JS_0100
   * @tc.desc   test usbManager getUsbSerialNumber with permission denied 201
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_usb_serial_number_0100", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
    try {
      usbManager.getUsbSerialNumber(1, 1);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code === 201).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });
}

function testAddAllowedOpticalDiscDriveBurnUsbDevices() {
  /**
   * @tc.name   test_add_allowed_optical_disc_drive_burn_usb_devices_0100
   * @tc.number SUB_CUSTOMIZATION_EDM_ADD_ALLOWED_OPTICAL_DISC_DRIVE_BURN_USB_DEVICES_NO_PERMISSION_JS_0100
   * @tc.desc   test usbManager addAllowedOpticalDiscDriveBurnUsbDevices with permission denied 201
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_add_allowed_optical_disc_drive_burn_usb_devices_0100", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
    try {
      await usbManager.addAllowedOpticalDiscDriveBurnUsbDevices(OPTICAL_DISC_BURN_USB_DEVICES);
      expect().assertFail();
    } catch (error) {
      if (error.code === 801) {
        expect(error.code).assertEqual(801);
      } else {
        expect(error.code).assertEqual(201);
      }
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });
}

function testRemoveAllowedOpticalDiscDriveBurnUsbDevices() {
  /**
   * @tc.name   test_remove_allowed_optical_disc_drive_burn_usb_devices_0100
   * @tc.number SUB_CUSTOMIZATION_EDM_REMOVE_ALLOWED_OPTICAL_DISC_DRIVE_BURN_USB_DEVICES_NO_PERMISSION_JS_0100
   * @tc.desc   test usbManager removeAllowedOpticalDiscDriveBurnUsbDevices with permission denied 201
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_remove_allowed_optical_disc_drive_burn_usb_devices_0100", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
    try {
      await usbManager.removeAllowedOpticalDiscDriveBurnUsbDevices(OPTICAL_DISC_BURN_USB_DEVICES);
      expect().assertFail();
    } catch (error) {
      if (error.code === 801) {
        expect(error.code).assertEqual(801);
      } else {
        expect(error.code).assertEqual(201);
      }
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });
}

function testGetAllowedOpticalDiscDriveBurnUsbDevices() {
  /**
   * @tc.name   test_get_allowed_optical_disc_drive_burn_usb_devices_0100
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_ALLOWED_OPTICAL_DISC_DRIVE_BURN_USB_DEVICES_NO_PERMISSION_JS_0100
   * @tc.desc   test usbManager getAllowedOpticalDiscDriveBurnUsbDevices with permission denied 201
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_allowed_optical_disc_drive_burn_usb_devices_0100", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
    try {
      let result = await usbManager.getAllowedOpticalDiscDriveBurnUsbDevices();
      expect(result.length >= 0).assertEqual(true);
    } catch (error) {
      expect(error.code).assertEqual(201);
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });
}

function testSetExternalStorageInterceptEnable() {
  /**
   * @tc.name   test_set_external_storage_intercept_enable_0100
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_EXTERNAL_STORAGE_INTERCEPT_ENABLE_NO_PERMISSION_JS_0100
   * @tc.desc   test usbManager setExternalStorageInterceptEnable with permission denied 201
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_external_storage_intercept_enable_0100", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
    try {
      usbManager.setExternalStorageInterceptEnable(true);
      expect().assertFail();
    } catch (error) {
      expect(error.code).assertEqual(201);
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });
}

function testIsExternalStorageInterceptEnable() {
  /**
   * @tc.name   test_is_external_storage_intercept_enable_0100
   * @tc.number SUB_CUSTOMIZATION_EDM_IS_EXTERNAL_STORAGE_INTERCEPT_ENABLE_NO_PERMISSION_JS_0100
   * @tc.desc   test usbManager isExternalStorageInterceptEnable with permission denied 201
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_is_external_storage_intercept_enable_0100", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
    try {
      usbManager.isExternalStorageInterceptEnable(common.QueryPolicy.SELF);
      expect().assertFail();
    } catch (error) {
      expect(error.code).assertEqual(201);
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });
}

function testSetExternalStorageDeviceMountPolicy() {
  /**
   * @tc.name   test_set_external_storage_device_mount_policy_0100
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_EXTERNAL_STORAGE_DEVICE_MOUNT_POLICY_NO_PERMISSION_JS_0100
   * @tc.desc   test usbManager setExternalStorageDeviceMountPolicy with permission denied 201
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_external_storage_device_mount_policy_0100", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
    try {
      usbManager.setExternalStorageDeviceMountPolicy('testVolumeId', usbManager.MountPolicy.MOUNT_READ_WRITE);
      expect().assertFail();
    } catch (error) {
      expect(error.code).assertEqual(201);
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });
}

function testGetExternalStorageDeviceInfos() {
  /**
   * @tc.name   test_get_external_storage_device_infos_0100
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_EXTERNAL_STORAGE_DEVICE_INFOS_NO_PERMISSION_JS_0100
   * @tc.desc   test usbManager getExternalStorageDeviceInfos with permission denied 201
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_external_storage_device_infos_0100", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
    try {
      usbManager.getExternalStorageDeviceInfos();
      expect().assertFail();
    } catch (error) {
      expect(error.code).assertEqual(201);
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });
}