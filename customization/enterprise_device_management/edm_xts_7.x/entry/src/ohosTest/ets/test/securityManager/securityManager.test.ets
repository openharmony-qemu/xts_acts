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

import { describe, expect, it, beforeAll, Level } from '@ohos/hypium-dynamic';
import { ENTINFO1, INVALID_WANT, SELFHAPNAME, SELFWANT, PIXEL_MAP, getPixelMap, getInvalidPixelMap, INVALID_PIXEL_MAP, WATERMARK_BUNDLE_NAME, DEFAULT_USER_ID,
  TEST_APP_INSTANCE, TEST_PERMISSION_1, CURRENT_USER_ID, DEFAULT_APP_INDEX, TEST_REAL_APP_ID_1, INVALID_USER_ID,
  INVALID_APP_INDEX, SYSTEM_CORE_PERMISSION_DOWNLOAD,
  TEST_PERMISSION_MANAGED_STATE_GRANTED,
  TEST_MANUAL_SETTINGS_PERMISSIONS } from '../commom.test.ets';

import adminManager from '@ohos.enterprise.adminManager';
import securityManager from '@ohos.enterprise.securityManager';
import common from '@ohos.enterprise.common';
import systemParameterEnhance from '@ohos.systemParameterEnhance';
import fs from '@ohos.file.fs';

const VALID_PROPERTIES: securityManager.WatermarkProperties = {
  intervalsRow: 10,
  intervalsCol: 10
};

const WEAK_PIN_DATA: Uint8Array = new Uint8Array([
  0x31, 0x32, 0x33, 0x34, 0x35, 0x36, 0x37, 0x38, 0x39, 0x30,
  0x71, 0x77, 0x65, 0x72, 0x74, 0x79, 0x75, 0x69, 0x6f, 0x70
]);
const WEAK_PIN_MAX_SIZE: number = 16 * 1024 * 1024;
 
function withWeakPinFile(callback: (fd: number) => void, fileSetup?: (fd: number) => void): void {
  let file: fs.File | undefined = undefined;
  let path = getContext().filesDir + '/weak_pin.txt';
  try {
    file = fs.openSync(path, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
    if (fileSetup) {
      fileSetup(file.fd);
    } else {
      fs.writeSync(file.fd, WEAK_PIN_DATA.buffer);
    }
    callback(file.fd);
  } finally {
    if (file) {
      try {
        fs.closeSync(file);
      } catch (closeErr) {
        console.error('EDM_TEST_LOG: Failed to close weak pin file.');
      }
    }
  }
}

export default function securityManagerTest() {
  describe('securityManager_test', () => {
    testSetScreenWatermarkImage();
    testCancelScreenWatermarkImage();
    testSetWatermarkImageWithProperties();
    testSetDisallowedPermission();
    testGetDisallowedPermissions();
    testAddAllowedPermissionBundle();
    testRemoveAllowedPermissionBundle();
    testGetAllowedPermissionBundles();
    testGetWatermarkImageApps();
    testSetPasswordPolicy();
    testSetDeviceSecurityLevelPolicy();
    testGetDeviceSecurityLevelPolicy();
    testUKeyOpenSession();
    testUKeyCloseSession();
    testUKeyAddUserExtCredential();
    testUKeyRemoveUserExtCredential();
    testUKeyGetUserExtCredential();
    testUKeySetUnlockPolicy();
    testUKeyGetUnlockPolicy();
    testUKeySessionLifecycle();
    testUKeyFullLifecycle();
    testSetWeakPinEnable();
    testIsWeakPinEnabled();
    testGetPasswordLastChangedTime();
    testSetPermissionManagedState();
  })
}

  function testSetScreenWatermarkImage() {
    beforeAll((done: Function) => {
      getPixelMap();
      getInvalidPixelMap();
      done();
    })

  /**
   * @tc.name   test_setScreenWatermarkImage_0200
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_SCREEN_WATERMARK_IMAGE_JS_0200
   * @tc.desc   test setScreenWatermarkImage with normal admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_setScreenWatermarkImage_0200", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
    try {
      securityManager.setScreenWatermarkImage(SELFWANT, PIXEL_MAP);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code).assertEqual(9200002);
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.name   test_setScreenWatermarkImage_0300
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_SCREEN_WATERMARK_IMAGE_JS_0300
   * @tc.desc   test setScreenWatermarkImage with null admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_setScreenWatermarkImage_0300", Level.LEVEL2, async (done: Function) => {
    try {
      securityManager.setScreenWatermarkImage(null, PIXEL_MAP);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code).assertEqual(401);
    }
    done();
  });

  /**
   * @tc.name   test_setScreenWatermarkImage_0400
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_SCREEN_WATERMARK_IMAGE_JS_0400
   * @tc.desc   test setScreenWatermarkImage with undefined admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_setScreenWatermarkImage_0400", Level.LEVEL2, async (done: Function) => {
    try {
      securityManager.setScreenWatermarkImage(undefined, PIXEL_MAP);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code).assertEqual(401);
    }
    done();
  });

  /**
   * @tc.name   test_setScreenWatermarkImage_0500
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_SCREEN_WATERMARK_IMAGE_JS_0500
   * @tc.desc   test setScreenWatermarkImage with invalid admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_setScreenWatermarkImage_0500", Level.LEVEL2, async (done: Function) => {
    try {
      securityManager.setScreenWatermarkImage(INVALID_WANT, PIXEL_MAP);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code).assertEqual(401);
    }
    done();
  });

  /**
   * @tc.name   test_setScreenWatermarkImage_0600
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_SCREEN_WATERMARK_IMAGE_JS_0600
   * @tc.desc   test setScreenWatermarkImage with null source
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_setScreenWatermarkImage_0600", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      securityManager.setScreenWatermarkImage(SELFWANT, null);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code).assertEqual(401);
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_setScreenWatermarkImage_0700
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_SCREEN_WATERMARK_IMAGE_JS_0700
   * @tc.desc   test setScreenWatermarkImage with undefined source
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_setScreenWatermarkImage_0700", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      securityManager.setScreenWatermarkImage(SELFWANT, undefined);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code).assertEqual(401);
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_setScreenWatermarkImage_0800
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_SCREEN_WATERMARK_IMAGE_JS_0800
   * @tc.desc   test setScreenWatermarkImage success
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it("test_setScreenWatermarkImage_0800", Level.LEVEL0, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      let ret = securityManager.setScreenWatermarkImage(SELFWANT, PIXEL_MAP);
      let edmEnable: string = systemParameterEnhance.getSync("persist.edm.edm_enable", "");
      expect(edmEnable == "true").assertTrue();
      securityManager.cancelScreenWatermarkImage(SELFWANT);
    } catch (error) {
      expect(false).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_setScreenWatermarkImage_0100
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_SCREEN_WATERMARK_IMAGE_JS_0100
   * @tc.desc   test setScreenWatermarkImage without admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_setScreenWatermarkImage_0100", Level.LEVEL2, async (done: Function) => {
    try {
      securityManager.setScreenWatermarkImage(SELFWANT, PIXEL_MAP);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code).assertEqual(9200001);
    }
    done();
  });

  /**
   * @tc.name   test_setScreenWatermarkImage_0900
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_SCREEN_WATERMARK_IMAGE_JS_0900
   * @tc.desc   test setScreenWatermarkImage with invalid pixelmap size
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_setScreenWatermarkImage_0900", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      securityManager.setScreenWatermarkImage(SELFWANT, INVALID_PIXEL_MAP);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code).assertEqual(9200012);
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });
}

function testCancelScreenWatermarkImage() {
  /**
   * @tc.name   test_cancelScreenWatermarkImage_0100
   * @tc.number SUB_CUSTOMIZATION_EDM_CANCEL_SCREEN_WATERMARK_IMAGE_JS_0100
   * @tc.desc   test cancelScreenWatermarkImage without admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_cancelScreenWatermarkImage_0100", Level.LEVEL2, async (done: Function) => {
    try {
      securityManager.cancelScreenWatermarkImage(SELFWANT);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code).assertEqual(9200001);
    }
    done();
  });

  /**
   * @tc.name   test_cancelScreenWatermarkImage_0200
   * @tc.number SUB_CUSTOMIZATION_EDM_CANCEL_SCREEN_WATERMARK_IMAGE_JS_0200
   * @tc.desc   test cancelScreenWatermarkImage with normal admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_cancelScreenWatermarkImage_0200", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
    try {
      securityManager.cancelScreenWatermarkImage(SELFWANT);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code).assertEqual(9200002);
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.name   test_cancelScreenWatermarkImage_0300
   * @tc.number SUB_CUSTOMIZATION_EDM_CANCEL_SCREEN_WATERMARK_IMAGE_JS_0300
   * @tc.desc   test cancelScreenWatermarkImage with null admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_cancelScreenWatermarkImage_0300", Level.LEVEL2, async (done: Function) => {
    try {
      securityManager.cancelScreenWatermarkImage(null);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code).assertEqual(401);
    }
    done();
  });

  /**
   * @tc.name   test_cancelScreenWatermarkImage_0400
   * @tc.number SUB_CUSTOMIZATION_EDM_CANCEL_SCREEN_WATERMARK_IMAGE_JS_0400
   * @tc.desc   test cancelScreenWatermarkImage with undefined admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_cancelScreenWatermarkImage_0400", Level.LEVEL2, async (done: Function) => {
    try {
      securityManager.cancelScreenWatermarkImage(undefined);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code).assertEqual(401);
    }
    done();
  });

  /**
   * @tc.name   test_cancelScreenWatermarkImage_0500
   * @tc.number SUB_CUSTOMIZATION_EDM_CANCEL_SCREEN_WATERMARK_IMAGE_JS_0500
   * @tc.desc   test cancelScreenWatermarkImage with invalid admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_cancelScreenWatermarkImage_0500", Level.LEVEL2, async (done: Function) => {
    try {
      securityManager.cancelScreenWatermarkImage(INVALID_WANT);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code).assertEqual(401);
    }
    done();
  });

  /**
   * @tc.name   test_cancelScreenWatermarkImage_0600
   * @tc.number SUB_CUSTOMIZATION_EDM_CANCEL_SCREEN_WATERMARK_IMAGE_JS_0600
   * @tc.desc   test cancelScreenWatermarkImage success
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it("test_cancelScreenWatermarkImage_0600", Level.LEVEL0, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      let ret = securityManager.cancelScreenWatermarkImage(SELFWANT);
      let edmEnable: string = systemParameterEnhance.getSync("persist.edm.edm_enable", "");
      expect(edmEnable == "true").assertTrue();
    } catch (error) {
      expect(false).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });
}

function testSetWatermarkImageWithProperties() {
  beforeAll((done: Function) => {
    getPixelMap();
    done();
  })
  
  // 权限验证场景
  /**
   * @tc.name   test_setWatermarkImage_pixelmap_0100
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_WATERMARK_IMAGE_PIXELMAP_JS_0100
   * @tc.desc   test securityManager setWatermarkImage with PixelMap source without admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_setWatermarkImage_pixelmap_0100", Level.LEVEL2, async (done: Function) => {
    try {
      securityManager.setWatermarkImage(SELFWANT, WATERMARK_BUNDLE_NAME, PIXEL_MAP, DEFAULT_USER_ID, VALID_PROPERTIES);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code).assertEqual(9200001);
    }
    done();
  });

  /**
   * @tc.name   test_setWatermarkImage_pixelmap_0200
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_WATERMARK_IMAGE_PIXELMAP_JS_0200
   * @tc.desc   test securityManager setWatermarkImage with PixelMap source and normal admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_setWatermarkImage_pixelmap_0200", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
    try {
      securityManager.setWatermarkImage(SELFWANT, WATERMARK_BUNDLE_NAME, PIXEL_MAP, DEFAULT_USER_ID, VALID_PROPERTIES);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code).assertEqual(9200002);
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.name   test_setWatermarkImage_pixelmap_0300
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_WATERMARK_IMAGE_PIXELMAP_JS_0300
   * @tc.desc   test securityManager setWatermarkImage with PixelMap source and null admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_setWatermarkImage_pixelmap_0300", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      securityManager.setWatermarkImage(null, WATERMARK_BUNDLE_NAME, PIXEL_MAP, DEFAULT_USER_ID, VALID_PROPERTIES);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code).assertEqual(401);
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_setWatermarkImage_pixelmap_0400
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_WATERMARK_IMAGE_PIXELMAP_JS_0400
   * @tc.desc   test securityManager setWatermarkImage with PixelMap source and undefined admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_setWatermarkImage_pixelmap_0400", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      securityManager.setWatermarkImage(undefined, WATERMARK_BUNDLE_NAME, PIXEL_MAP, DEFAULT_USER_ID, VALID_PROPERTIES);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code).assertEqual(401);
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_setWatermarkImage_pixelmap_0500
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_WATERMARK_IMAGE_PIXELMAP_JS_0500
   * @tc.desc   test securityManager setWatermarkImage with PixelMap source and invalid admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_setWatermarkImage_pixelmap_0500", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      securityManager.setWatermarkImage(INVALID_WANT, WATERMARK_BUNDLE_NAME, PIXEL_MAP, DEFAULT_USER_ID, VALID_PROPERTIES);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code).assertEqual(401);
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_setWatermarkImage_pixelmap_0600
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_WATERMARK_IMAGE_PIXELMAP_JS_0600
   * @tc.desc   test securityManager setWatermarkImage with PixelMap source and null bundleName
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_setWatermarkImage_pixelmap_0600", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      securityManager.setWatermarkImage(SELFWANT, null, PIXEL_MAP, DEFAULT_USER_ID, VALID_PROPERTIES);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code).assertEqual(401);
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_setWatermarkImage_pixelmap_0700
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_WATERMARK_IMAGE_PIXELMAP_JS_0700
   * @tc.desc   test securityManager setWatermarkImage with PixelMap source and undefined bundleName
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_setWatermarkImage_pixelmap_0700", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      securityManager.setWatermarkImage(SELFWANT, undefined, PIXEL_MAP, DEFAULT_USER_ID, VALID_PROPERTIES);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code).assertEqual(401);
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_setWatermarkImage_pixelmap_0800
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_WATERMARK_IMAGE_PIXELMAP_JS_0800
   * @tc.desc   test securityManager setWatermarkImage with PixelMap source and empty bundleName
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_setWatermarkImage_pixelmap_0800", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      securityManager.setWatermarkImage(SELFWANT, '', PIXEL_MAP, DEFAULT_USER_ID, VALID_PROPERTIES);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code).assertEqual(9200012);
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_setWatermarkImage_pixelmap_0900
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_WATERMARK_IMAGE_PIXELMAP_JS_0900
   * @tc.desc   test securityManager setWatermarkImage with null source (PixelMap type)
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_setWatermarkImage_pixelmap_0900", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      securityManager.setWatermarkImage(SELFWANT, WATERMARK_BUNDLE_NAME, null, DEFAULT_USER_ID, VALID_PROPERTIES);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code).assertEqual(401);
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_setWatermarkImage_pixelmap_1000
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_WATERMARK_IMAGE_PIXELMAP_JS_1000
   * @tc.desc   test securityManager setWatermarkImage with undefined source (PixelMap type)
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_setWatermarkImage_pixelmap_1000", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      securityManager.setWatermarkImage(SELFWANT, WATERMARK_BUNDLE_NAME, undefined, DEFAULT_USER_ID, VALID_PROPERTIES);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code).assertEqual(401);
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_setWatermarkImage_string_1100
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_WATERMARK_IMAGE_STRING_JS_1100
   * @tc.desc   test securityManager setWatermarkImage with empty source (string type)
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_setWatermarkImage_string_1100", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      securityManager.setWatermarkImage(SELFWANT, WATERMARK_BUNDLE_NAME, '', DEFAULT_USER_ID, VALID_PROPERTIES);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code).assertEqual(401);
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_setWatermarkImage_pixelmap_1200
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_WATERMARK_IMAGE_PIXELMAP_JS_1200
   * @tc.desc   test securityManager setWatermarkImage with PixelMap source and null accountId
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_setWatermarkImage_pixelmap_1200", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      securityManager.setWatermarkImage(SELFWANT, WATERMARK_BUNDLE_NAME, PIXEL_MAP, null, VALID_PROPERTIES);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code).assertEqual(401);
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_setWatermarkImage_pixelmap_1300
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_WATERMARK_IMAGE_PIXELMAP_JS_1300
   * @tc.desc   test securityManager setWatermarkImage with PixelMap source and undefined accountId
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_setWatermarkImage_pixelmap_1300", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      securityManager.setWatermarkImage(SELFWANT, WATERMARK_BUNDLE_NAME, PIXEL_MAP, undefined, VALID_PROPERTIES);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code).assertEqual(401);
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_setWatermarkImage_pixelmap_1400
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_WATERMARK_IMAGE_PIXELMAP_JS_1400
   * @tc.desc   test securityManager setWatermarkImage with PixelMap source and invalid accountId -1
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_setWatermarkImage_pixelmap_1400", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      securityManager.setWatermarkImage(SELFWANT, WATERMARK_BUNDLE_NAME, PIXEL_MAP, -1, VALID_PROPERTIES);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code).assertEqual(9200012);
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_setWatermarkImage_pixelmap_1500
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_WATERMARK_IMAGE_PIXELMAP_JS_1500
   * @tc.desc   test securityManager setWatermarkImage with PixelMap source and null properties
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_setWatermarkImage_pixelmap_1500", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      securityManager.setWatermarkImage(SELFWANT, WATERMARK_BUNDLE_NAME, PIXEL_MAP, DEFAULT_USER_ID, null);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code).assertEqual(401);
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_setWatermarkImage_pixelmap_1600
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_WATERMARK_IMAGE_PIXELMAP_JS_1600
   * @tc.desc   test securityManager setWatermarkImage with PixelMap source and undefined properties
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_setWatermarkImage_pixelmap_1600", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      securityManager.setWatermarkImage(SELFWANT, WATERMARK_BUNDLE_NAME, PIXEL_MAP, DEFAULT_USER_ID, undefined);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code).assertEqual(401);
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_setWatermarkImage_pixelmap_1700
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_WATERMARK_IMAGE_PIXELMAP_JS_1700
   * @tc.desc   test securityManager setWatermarkImage with PixelMap source and intervalsRow 0
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_setWatermarkImage_pixelmap_1700", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      securityManager.setWatermarkImage(SELFWANT, WATERMARK_BUNDLE_NAME, PIXEL_MAP, DEFAULT_USER_ID, { intervalsRow: 0, intervalsCol: 10 });
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code).assertEqual(9200012);
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_setWatermarkImage_pixelmap_1800
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_WATERMARK_IMAGE_PIXELMAP_JS_1800
   * @tc.desc   test securityManager setWatermarkImage with PixelMap source and intervalsRow 256
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_setWatermarkImage_pixelmap_1800", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      securityManager.setWatermarkImage(SELFWANT, WATERMARK_BUNDLE_NAME, PIXEL_MAP, DEFAULT_USER_ID, { intervalsRow: 256, intervalsCol: 10 });
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code).assertEqual(9200012);
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_setWatermarkImage_pixelmap_1900
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_WATERMARK_IMAGE_PIXELMAP_JS_1900
   * @tc.desc   test securityManager setWatermarkImage with PixelMap source and intervalsCol 0
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_setWatermarkImage_pixelmap_1900", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      securityManager.setWatermarkImage(SELFWANT, WATERMARK_BUNDLE_NAME, PIXEL_MAP, DEFAULT_USER_ID, { intervalsRow: 10, intervalsCol: 0 });
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code).assertEqual(9200012);
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_setWatermarkImage_pixelmap_2000
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_WATERMARK_IMAGE_PIXELMAP_JS_2000
   * @tc.desc   test securityManager setWatermarkImage with PixelMap source and intervalsCol 256
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_setWatermarkImage_pixelmap_2000", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      securityManager.setWatermarkImage(SELFWANT, WATERMARK_BUNDLE_NAME, PIXEL_MAP, DEFAULT_USER_ID, { intervalsRow: 10, intervalsCol: 256 });
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code).assertEqual(9200012);
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_setWatermarkImage_pixelmap_2100
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_WATERMARK_IMAGE_PIXELMAP_JS_2100
   * @tc.desc   test securityManager setWatermarkImage with PixelMap source success
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it("test_setWatermarkImage_pixelmap_2100", Level.LEVEL0, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      securityManager.setWatermarkImage(SELFWANT, WATERMARK_BUNDLE_NAME, PIXEL_MAP, DEFAULT_USER_ID, VALID_PROPERTIES);
      let result: Array<string> = securityManager.getWatermarkImageApps(SELFWANT, DEFAULT_USER_ID);
      expect(result.length === 1).assertTrue();
      expect(result[0] === WATERMARK_BUNDLE_NAME).assertTrue();
    } catch (error) {
      expect(false).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_setWatermarkImage_pixelmap_2200
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_WATERMARK_IMAGE_PIXELMAP_JS_2200
   * @tc.desc   test securityManager setWatermarkImage with PixelMap source and invalid accountId 0
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_setWatermarkImage_pixelmap_2200", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      securityManager.setWatermarkImage(SELFWANT, WATERMARK_BUNDLE_NAME, PIXEL_MAP, 0, VALID_PROPERTIES);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code).assertEqual(9200012);
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_setWatermarkImage_pixelmap_2300
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_WATERMARK_IMAGE_PIXELMAP_JS_2300
   * @tc.desc   test securityManager setWatermarkImage with PixelMap source and accountId minValue
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it("test_setWatermarkImage_pixelmap_2300", Level.LEVEL0, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      let ret = securityManager.setWatermarkImage(SELFWANT, WATERMARK_BUNDLE_NAME, PIXEL_MAP, 1, VALID_PROPERTIES);
      let edmEnable: string = systemParameterEnhance.getSync("persist.edm.edm_enable", "");
      expect(edmEnable == "true").assertTrue();
    } catch (error) {
      expect(false).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });
}

function testSetDisallowedPermission() {
  /**
   * @tc.name   test_setDisallowedPermission_0100
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_DISALLOWED_PERMISSION_JS_0100
   * @tc.desc   test setDisallowedPermission without admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_setDisallowedPermission_0100", Level.LEVEL2, async (done: Function) => {
    try {
      securityManager.setDisallowedPermission(SELFWANT, TEST_PERMISSION_1, true, CURRENT_USER_ID);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code).assertEqual(9200001);
    }
    done();
  });

  /**
   * @tc.name   test_setDisallowedPermission_0200
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_DISALLOWED_PERMISSION_JS_0200
   * @tc.desc   test setDisallowedPermission with normal admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_setDisallowedPermission_0200", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
    try {
      securityManager.setDisallowedPermission(SELFWANT, TEST_PERMISSION_1, true, CURRENT_USER_ID);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code).assertEqual(9200002);
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.name   test_setDisallowedPermission_0300
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_DISALLOWED_PERMISSION_JS_0300
   * @tc.desc   test setDisallowedPermission with null admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_setDisallowedPermission_0300", Level.LEVEL2, async (done: Function) => {
    try {
      securityManager.setDisallowedPermission(null, TEST_PERMISSION_1, true, CURRENT_USER_ID);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code).assertEqual(401);
    }
    done();
  });

  /**
   * @tc.name   test_setDisallowedPermission_0400
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_DISALLOWED_PERMISSION_JS_0400
   * @tc.desc   test setDisallowedPermission with undefined admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_setDisallowedPermission_0400", Level.LEVEL2, async (done: Function) => {
    try {
      securityManager.setDisallowedPermission(undefined, TEST_PERMISSION_1, true, CURRENT_USER_ID);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code).assertEqual(401);
    }
    done();
  });

  /**
   * @tc.name   test_setDisallowedPermission_0500
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_DISALLOWED_PERMISSION_JS_0500
   * @tc.desc   test setDisallowedPermission with invalid admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_setDisallowedPermission_0500", Level.LEVEL2, async (done: Function) => {
    try {
      securityManager.setDisallowedPermission(INVALID_WANT, TEST_PERMISSION_1, true, CURRENT_USER_ID);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code).assertEqual(401);
    }
    done();
  });

  /**
   * @tc.name   test_setDisallowedPermission_0600
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_DISALLOWED_PERMISSION_JS_0600
   * @tc.desc   test setDisallowedPermission with null permission
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_setDisallowedPermission_0600", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      securityManager.setDisallowedPermission(SELFWANT, null, true, CURRENT_USER_ID);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code).assertEqual(401);
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_setDisallowedPermission_0700
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_DISALLOWED_PERMISSION_JS_0700
   * @tc.desc   test setDisallowedPermission with undefined permission
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_setDisallowedPermission_0700", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      securityManager.setDisallowedPermission(SELFWANT, undefined, true, CURRENT_USER_ID);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code).assertEqual(401);
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_setDisallowedPermission_0800
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_DISALLOWED_PERMISSION_JS_0800
   * @tc.desc   test setDisallowedPermission with empty permission
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_setDisallowedPermission_0800", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      securityManager.setDisallowedPermission(SELFWANT, '', true, CURRENT_USER_ID);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code).assertEqual(9200012);
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_setDisallowedPermission_0900
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_DISALLOWED_PERMISSION_JS_0900
   * @tc.desc   test setDisallowedPermission with null disallow
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_setDisallowedPermission_0900", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      securityManager.setDisallowedPermission(SELFWANT, TEST_PERMISSION_1, null, CURRENT_USER_ID);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code).assertEqual(401);
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_setDisallowedPermission_1000
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_DISALLOWED_PERMISSION_JS_1000
   * @tc.desc   test setDisallowedPermission with undefined disallow
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_setDisallowedPermission_1000", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      securityManager.setDisallowedPermission(SELFWANT, TEST_PERMISSION_1, undefined, CURRENT_USER_ID);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code).assertEqual(401);
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_setDisallowedPermission_1100
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_DISALLOWED_PERMISSION_JS_1100
   * @tc.desc   test setDisallowedPermission with null accountId
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_setDisallowedPermission_1100", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      securityManager.setDisallowedPermission(SELFWANT, TEST_PERMISSION_1, true, null);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code).assertEqual(401);
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_setDisallowedPermission_1200
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_DISALLOWED_PERMISSION_JS_1200
   * @tc.desc   test setDisallowedPermission with undefined accountId
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_setDisallowedPermission_1200", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      securityManager.setDisallowedPermission(SELFWANT, TEST_PERMISSION_1, true, undefined);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code).assertEqual(401);
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_setDisallowedPermission_1300
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_DISALLOWED_PERMISSION_JS_1300
   * @tc.desc   test setDisallowedPermission success
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it("test_setDisallowedPermission_1300", Level.LEVEL0, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      securityManager.setDisallowedPermission(SELFWANT, TEST_PERMISSION_1, true, CURRENT_USER_ID);
      securityManager.setDisallowedPermission(SELFWANT, TEST_PERMISSION_1, false, CURRENT_USER_ID);
    } catch (error) {
      expect(false).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_setDisallowedPermission_1400
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_DISALLOWED_PERMISSION_JS_1400
   * @tc.desc   test setDisallowedPermission with system core permission
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_setDisallowedPermission_1400", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      securityManager.setDisallowedPermission(SELFWANT, SYSTEM_CORE_PERMISSION_DOWNLOAD, true, CURRENT_USER_ID);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code === 9201045).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_setDisallowedPermission_1500
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_DISALLOWED_PERMISSION_JS_1500
   * @tc.desc   test setDisallowedPermission with system core permission
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_setDisallowedPermission_1500", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      securityManager.setDisallowedPermission(SELFWANT, SYSTEM_CORE_PERMISSION_DOWNLOAD, false, CURRENT_USER_ID);
    } catch (error) {
      expect(false).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_setDisallowedPermission_1600
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_DISALLOWED_PERMISSION_JS_1600
   * @tc.desc   test setDisallowedPermission with system core permission
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_setDisallowedPermission_1600", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      securityManager.setDisallowedPermission(SELFWANT, 'invalid_permission', true, CURRENT_USER_ID);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code).assertEqual(9200012);
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_setDisallowedPermission_1700
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_DISALLOWED_PERMISSION_JS_1700
   * @tc.desc   test setDisallowedPermission with invalid user id
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_setDisallowedPermission_1700", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      securityManager.setDisallowedPermission(SELFWANT, TEST_PERMISSION_1, true, INVALID_USER_ID);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code).assertEqual(9200012);
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_setDisallowedPermission_1800
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_DISALLOWED_PERMISSION_JS_1800
   * @tc.desc   test setDisallowedPermission with not exist user id
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_setDisallowedPermission_1800", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      securityManager.setDisallowedPermission(SELFWANT, TEST_PERMISSION_1, true, 10000);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code).assertEqual(9200012);
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });
}

function testGetDisallowedPermissions() {
  /**
   * @tc.name   test_getDisallowedPermissions_0100
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_DISALLOWED_PERMISSIONS_JS_0100
   * @tc.desc   test getDisallowedPermissions without admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_getDisallowedPermissions_0100", Level.LEVEL2, async (done: Function) => {
    try {
      securityManager.getDisallowedPermissions(SELFWANT, CURRENT_USER_ID);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code).assertEqual(9200001);
    }
    done();
  });

  /**
   * @tc.name   test_getDisallowedPermissions_0200
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_DISALLOWED_PERMISSIONS_JS_0200
   * @tc.desc   test getDisallowedPermissions with normal admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_getDisallowedPermissions_0200", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
    try {
      securityManager.getDisallowedPermissions(SELFWANT, CURRENT_USER_ID);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code).assertEqual(9200002);
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.name   test_getDisallowedPermissions_0300
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_DISALLOWED_PERMISSIONS_JS_0300
   * @tc.desc   test getDisallowedPermissions with undefined admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_getDisallowedPermissions_0300", Level.LEVEL2, async (done: Function) => {
    try {
      securityManager.getDisallowedPermissions(undefined, CURRENT_USER_ID);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code).assertEqual(401);
    }
    done();
  });

  /**
   * @tc.name   test_getDisallowedPermissions_0400
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_DISALLOWED_PERMISSIONS_JS_0400
   * @tc.desc   test getDisallowedPermissions with invalid admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_getDisallowedPermissions_0400", Level.LEVEL2, async (done: Function) => {
    try {
      securityManager.getDisallowedPermissions(INVALID_WANT, CURRENT_USER_ID);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code).assertEqual(401);
    }
    done();
  });

  /**
   * @tc.name   test_getDisallowedPermissions_0500
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_DISALLOWED_PERMISSIONS_JS_0500
   * @tc.desc   test getDisallowedPermissions with null accountId
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_getDisallowedPermissions_0500", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      securityManager.getDisallowedPermissions(SELFWANT, null);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code).assertEqual(401);
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_getDisallowedPermissions_0600
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_DISALLOWED_PERMISSIONS_JS_0600
   * @tc.desc   test getDisallowedPermissions with undefined accountId
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_getDisallowedPermissions_0600", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      securityManager.getDisallowedPermissions(SELFWANT, undefined);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code).assertEqual(401);
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_getDisallowedPermissions_0700
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_DISALLOWED_PERMISSIONS_JS_0700
   * @tc.desc   test getDisallowedPermissions success with admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_getDisallowedPermissions_0700", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      let result = securityManager.getDisallowedPermissions(SELFWANT, CURRENT_USER_ID);
      expect(Array.isArray(result)).assertTrue();
    } catch (error) {
      expect(false).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_getDisallowedPermissions_0800
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_DISALLOWED_PERMISSIONS_JS_0800
   * @tc.desc   test getDisallowedPermissions success with null admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_getDisallowedPermissions_0800", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      let result = securityManager.getDisallowedPermissions(null, CURRENT_USER_ID);
      expect(Array.isArray(result)).assertTrue();
    } catch (error) {
      expect(false).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_getDisallowedPermissions_0900
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_DISALLOWED_PERMISSIONS_JS_0900
   * @tc.desc   test getDisallowedPermissions success with real query
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_getDisallowedPermissions_0900", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      securityManager.setDisallowedPermission(SELFWANT, TEST_PERMISSION_1, true, CURRENT_USER_ID);
      let result = securityManager.getDisallowedPermissions(SELFWANT, CURRENT_USER_ID);
      expect(Array.isArray(result)).assertTrue();
      expect(result.length === 1).assertTrue();
      expect(result[0] == TEST_PERMISSION_1).assertTrue();

      let resultNull = securityManager.getDisallowedPermissions(null, CURRENT_USER_ID);
      expect(Array.isArray(resultNull)).assertTrue();
      expect(resultNull.length === 1).assertTrue();
      expect(resultNull[0] == TEST_PERMISSION_1).assertTrue();

      securityManager.setDisallowedPermission(SELFWANT, TEST_PERMISSION_1, false, CURRENT_USER_ID);
      let resultAfter = securityManager.getDisallowedPermissions(SELFWANT, CURRENT_USER_ID);
      expect(Array.isArray(resultAfter)).assertTrue();
      expect(resultAfter.length === 0).assertTrue();
    } catch (error) {
      console.info(' --- test_getDisallowedPermissions_0900 is expected no error, actually catch: '
          + error.code);
      expect(false).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_getDisallowedPermissions_1000
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_DISALLOWED_PERMISSIONS_JS_1000
   * @tc.desc   test getDisallowedPermissions success with null admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_getDisallowedPermissions_1000", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      let result = securityManager.getDisallowedPermissions(SELFWANT, INVALID_USER_ID);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code).assertEqual(9200012);
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_getDisallowedPermissions_1100
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_DISALLOWED_PERMISSIONS_JS_1100
   * @tc.desc   test getDisallowedPermissions with not exist user id
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_getDisallowedPermissions_1100", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      securityManager.getDisallowedPermissions(SELFWANT, 10000);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code).assertEqual(9200012);
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });
}

function testAddAllowedPermissionBundle() {
  /**
   * @tc.name   test_addAllowedPermissionBundle_0100
   * @tc.number SUB_CUSTOMIZATION_EDM_ADD_ALLOWED_PERMISSION_BUNDLE_JS_0100
   * @tc.desc   test addAllowedPermissionBundle without admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_addAllowedPermissionBundle_0100", Level.LEVEL2, async (done: Function) => {
    try {
      securityManager.addAllowedPermissionBundle(SELFWANT, TEST_PERMISSION_1, TEST_APP_INSTANCE);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code).assertEqual(9200001);
    }
    done();
  });

  /**
   * @tc.name   test_addAllowedPermissionBundle_0200
   * @tc.number SUB_CUSTOMIZATION_EDM_ADD_ALLOWED_PERMISSION_BUNDLE_JS_0200
   * @tc.desc   test addAllowedPermissionBundle with normal admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_addAllowedPermissionBundle_0200", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
    try {
      securityManager.addAllowedPermissionBundle(SELFWANT, TEST_PERMISSION_1, TEST_APP_INSTANCE);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code).assertEqual(9200002);
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.name   test_addAllowedPermissionBundle_0300
   * @tc.number SUB_CUSTOMIZATION_EDM_ADD_ALLOWED_PERMISSION_BUNDLE_JS_0300
   * @tc.desc   test addAllowedPermissionBundle with null admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_addAllowedPermissionBundle_0300", Level.LEVEL2, async (done: Function) => {
    try {
      securityManager.addAllowedPermissionBundle(null, TEST_PERMISSION_1, TEST_APP_INSTANCE);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code).assertEqual(401);
    }
    done();
  });

  /**
   * @tc.name   test_addAllowedPermissionBundle_0400
   * @tc.number SUB_CUSTOMIZATION_EDM_ADD_ALLOWED_PERMISSION_BUNDLE_JS_0400
   * @tc.desc   test addAllowedPermissionBundle with undefined admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_addAllowedPermissionBundle_0400", Level.LEVEL2, async (done: Function) => {
    try {
      securityManager.addAllowedPermissionBundle(undefined, TEST_PERMISSION_1, TEST_APP_INSTANCE);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code).assertEqual(401);
    }
    done();
  });

  /**
   * @tc.name   test_addAllowedPermissionBundle_0500
   * @tc.number SUB_CUSTOMIZATION_EDM_ADD_ALLOWED_PERMISSION_BUNDLE_JS_0500
   * @tc.desc   test addAllowedPermissionBundle with invalid admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_addAllowedPermissionBundle_0500", Level.LEVEL2, async (done: Function) => {
    try {
      securityManager.addAllowedPermissionBundle(INVALID_WANT, TEST_PERMISSION_1, TEST_APP_INSTANCE);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code).assertEqual(401);
    }
    done();
  });

  /**
   * @tc.name   test_addAllowedPermissionBundle_0600
   * @tc.number SUB_CUSTOMIZATION_EDM_ADD_ALLOWED_PERMISSION_BUNDLE_JS_0600
   * @tc.desc   test addAllowedPermissionBundle with null permission
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_addAllowedPermissionBundle_0600", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      securityManager.addAllowedPermissionBundle(SELFWANT, null, TEST_APP_INSTANCE);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code).assertEqual(401);
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_addAllowedPermissionBundle_0700
   * @tc.number SUB_CUSTOMIZATION_EDM_ADD_ALLOWED_PERMISSION_BUNDLE_JS_0700
   * @tc.desc   test addAllowedPermissionBundle with undefined permission
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_addAllowedPermissionBundle_0700", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      securityManager.addAllowedPermissionBundle(SELFWANT, undefined, TEST_APP_INSTANCE);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code).assertEqual(401);
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_addAllowedPermissionBundle_0800
   * @tc.number SUB_CUSTOMIZATION_EDM_ADD_ALLOWED_PERMISSION_BUNDLE_JS_0800
   * @tc.desc   test addAllowedPermissionBundle with empty permission
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_addAllowedPermissionBundle_0800", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      securityManager.addAllowedPermissionBundle(SELFWANT, '', TEST_APP_INSTANCE);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code).assertEqual(9200012);
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_addAllowedPermissionBundle_0900
   * @tc.number SUB_CUSTOMIZATION_EDM_ADD_ALLOWED_PERMISSION_BUNDLE_JS_0900
   * @tc.desc   test addAllowedPermissionBundle with null applicationInstance
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_addAllowedPermissionBundle_0900", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      securityManager.addAllowedPermissionBundle(SELFWANT, TEST_PERMISSION_1, null);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code).assertEqual(401);
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_addAllowedPermissionBundle_1000
   * @tc.number SUB_CUSTOMIZATION_EDM_ADD_ALLOWED_PERMISSION_BUNDLE_JS_1000
   * @tc.desc   test addAllowedPermissionBundle with undefined applicationInstance
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_addAllowedPermissionBundle_1000", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      securityManager.addAllowedPermissionBundle(SELFWANT, TEST_PERMISSION_1, undefined);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code).assertEqual(401);
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_addAllowedPermissionBundle_1200
   * @tc.number SUB_CUSTOMIZATION_EDM_ADD_ALLOWED_PERMISSION_BUNDLE_JS_1200
   * @tc.desc   test addAllowedPermissionBundle with empty appIdentifier
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_addAllowedPermissionBundle_1200", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      securityManager.addAllowedPermissionBundle(SELFWANT, TEST_PERMISSION_1, {
        appIdentifier: '',
        appIndex: DEFAULT_APP_INDEX,
        accountId: CURRENT_USER_ID
      });
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code).assertEqual(401);
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_addAllowedPermissionBundle_1300
   * @tc.number SUB_CUSTOMIZATION_EDM_ADD_ALLOWED_PERMISSION_BUNDLE_JS_1300
   * @tc.desc   test addAllowedPermissionBundle success
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_addAllowedPermissionBundle_1300", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      securityManager.setDisallowedPermission(SELFWANT, TEST_PERMISSION_1, true, CURRENT_USER_ID);
      securityManager.addAllowedPermissionBundle(SELFWANT, TEST_PERMISSION_1, TEST_APP_INSTANCE);
      securityManager.removeAllowedPermissionBundle(SELFWANT, TEST_PERMISSION_1, TEST_APP_INSTANCE);
      securityManager.setDisallowedPermission(SELFWANT, TEST_PERMISSION_1, false, CURRENT_USER_ID);
    } catch (error) {
      expect(false).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_addAllowedPermissionBundle_1400
   * @tc.number SUB_CUSTOMIZATION_EDM_ADD_ALLOWED_PERMISSION_BUNDLE_JS_1400
   * @tc.desc   test addAllowedPermissionBundle without disalbe permission
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_addAllowedPermissionBundle_1400", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      securityManager.addAllowedPermissionBundle(SELFWANT, TEST_PERMISSION_1, {
        appIdentifier: TEST_REAL_APP_ID_1,
        appIndex: DEFAULT_APP_INDEX,
        accountId: CURRENT_USER_ID
      });
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code === 9201044).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_addAllowedPermissionBundle_1500
   * @tc.number SUB_CUSTOMIZATION_EDM_ADD_ALLOWED_PERMISSION_BUNDLE_JS_1500
   * @tc.desc   test addAllowedPermissionBundle with system core permission
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_addAllowedPermissionBundle_1500", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      securityManager.addAllowedPermissionBundle(SELFWANT, SYSTEM_CORE_PERMISSION_DOWNLOAD, {
        appIdentifier: TEST_REAL_APP_ID_1,
        appIndex: DEFAULT_APP_INDEX,
        accountId: CURRENT_USER_ID
      });
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code === 9201044).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_addAllowedPermissionBundle_1600
   * @tc.number SUB_CUSTOMIZATION_EDM_ADD_ALLOWED_PERMISSION_BUNDLE_JS_1600
   * @tc.desc   test addAllowedPermissionBundle with system invalid appIndex
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_addAllowedPermissionBundle_1600", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      securityManager.setDisallowedPermission(SELFWANT, TEST_PERMISSION_1, true, CURRENT_USER_ID);
      securityManager.addAllowedPermissionBundle(SELFWANT, TEST_PERMISSION_1, {
        appIdentifier: TEST_REAL_APP_ID_1,
        appIndex: INVALID_APP_INDEX,
        accountId: CURRENT_USER_ID
      });
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code).assertEqual(401);
    } finally {
      securityManager.setDisallowedPermission(SELFWANT, TEST_PERMISSION_1, false, CURRENT_USER_ID);
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_addAllowedPermissionBundle_1700
   * @tc.number SUB_CUSTOMIZATION_EDM_ADD_ALLOWED_PERMISSION_BUNDLE_JS_1700
   * @tc.desc   test addAllowedPermissionBundle with system invalid accountId
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_addAllowedPermissionBundle_1700", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      securityManager.setDisallowedPermission(SELFWANT, TEST_PERMISSION_1, true, CURRENT_USER_ID);
      securityManager.addAllowedPermissionBundle(SELFWANT, TEST_PERMISSION_1, {
        appIdentifier: TEST_REAL_APP_ID_1,
        appIndex: 0,
        accountId: INVALID_USER_ID
      });
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code).assertEqual(401);
    } finally {
      securityManager.setDisallowedPermission(SELFWANT, TEST_PERMISSION_1, false, CURRENT_USER_ID);
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_addAllowedPermissionBundle_1800
   * @tc.number SUB_CUSTOMIZATION_EDM_ADD_ALLOWED_PERMISSION_BUNDLE_JS_1800
   * @tc.desc   test addAllowedPermissionBundle with system invalid accountId
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_addAllowedPermissionBundle_1800", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      securityManager.addAllowedPermissionBundle(SELFWANT, TEST_PERMISSION_1, {
        appIdentifier: TEST_REAL_APP_ID_1,
        appIndex: 0,
        accountId: 10000
      });
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code).assertEqual(9200012);
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_addAllowedPermissionBundle_1900
   * @tc.number SUB_CUSTOMIZATION_EDM_ADD_ALLOWED_PERMISSION_BUNDLE_JS_1900
   * @tc.desc   test addAllowedPermissionBundle with system invalid accountId
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_addAllowedPermissionBundle_1900", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      securityManager.setDisallowedPermission(SELFWANT, TEST_PERMISSION_1, true, CURRENT_USER_ID);
      securityManager.addAllowedPermissionBundle(SELFWANT, TEST_PERMISSION_1, {
        appIdentifier: TEST_REAL_APP_ID_1,
        appIndex: 10000,
        accountId: CURRENT_USER_ID
      });
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code).assertEqual(9200012);
    } finally {
      securityManager.setDisallowedPermission(SELFWANT, TEST_PERMISSION_1, false, CURRENT_USER_ID);
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_addAllowedPermissionBundle_2000
   * @tc.number SUB_CUSTOMIZATION_EDM_ADD_ALLOWED_PERMISSION_BUNDLE_JS_2000
   * @tc.desc   test addAllowedPermissionBundle with application not installed
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_addAllowedPermissionBundle_2000", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      securityManager.setDisallowedPermission(SELFWANT, TEST_PERMISSION_1, true, CURRENT_USER_ID);
      securityManager.addAllowedPermissionBundle(SELFWANT, TEST_PERMISSION_1, {
        appIdentifier: 'invalid_appIdentifier',
        appIndex: 0,
        accountId: CURRENT_USER_ID
      });
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code === 9201015).assertTrue();
    } finally {
      securityManager.setDisallowedPermission(SELFWANT, TEST_PERMISSION_1, false, CURRENT_USER_ID);
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });
}

function testRemoveAllowedPermissionBundle() {
  /**
   * @tc.name   test_removeAllowedPermissionBundle_0100
   * @tc.number SUB_CUSTOMIZATION_EDM_REMOVE_ALLOWED_PERMISSION_BUNDLE_JS_0100
   * @tc.desc   test removeAllowedPermissionBundle without admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_removeAllowedPermissionBundle_0100", Level.LEVEL2, async (done: Function) => {
    try {
      securityManager.removeAllowedPermissionBundle(SELFWANT, TEST_PERMISSION_1, TEST_APP_INSTANCE);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code).assertEqual(9200001);
    }
    done();
  });

  /**
   * @tc.name   test_removeAllowedPermissionBundle_0200
   * @tc.number SUB_CUSTOMIZATION_EDM_REMOVE_ALLOWED_PERMISSION_BUNDLE_JS_0200
   * @tc.desc   test removeAllowedPermissionBundle with normal admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_removeAllowedPermissionBundle_0200", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
    try {
      securityManager.removeAllowedPermissionBundle(SELFWANT, TEST_PERMISSION_1, TEST_APP_INSTANCE);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code).assertEqual(9200002);
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.name   test_removeAllowedPermissionBundle_0300
   * @tc.number SUB_CUSTOMIZATION_EDM_REMOVE_ALLOWED_PERMISSION_BUNDLE_JS_0300
   * @tc.desc   test removeAllowedPermissionBundle with null admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_removeAllowedPermissionBundle_0300", Level.LEVEL2, async (done: Function) => {
    try {
      securityManager.removeAllowedPermissionBundle(null, TEST_PERMISSION_1, TEST_APP_INSTANCE);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code).assertEqual(401);
    }
    done();
  });

  /**
   * @tc.name   test_removeAllowedPermissionBundle_0400
   * @tc.number SUB_CUSTOMIZATION_EDM_REMOVE_ALLOWED_PERMISSION_BUNDLE_JS_0400
   * @tc.desc   test removeAllowedPermissionBundle with undefined admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_removeAllowedPermissionBundle_0400", Level.LEVEL2, async (done: Function) => {
    try {
      securityManager.removeAllowedPermissionBundle(undefined, TEST_PERMISSION_1, TEST_APP_INSTANCE);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code).assertEqual(401);
    }
    done();
  });

  /**
   * @tc.name   test_removeAllowedPermissionBundle_0500
   * @tc.number SUB_CUSTOMIZATION_EDM_REMOVE_ALLOWED_PERMISSION_BUNDLE_JS_0500
   * @tc.desc   test removeAllowedPermissionBundle with invalid admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_removeAllowedPermissionBundle_0500", Level.LEVEL2, async (done: Function) => {
    try {
      securityManager.removeAllowedPermissionBundle(INVALID_WANT, TEST_PERMISSION_1, TEST_APP_INSTANCE);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code).assertEqual(401);
    }
    done();
  });

  /**
   * @tc.name   test_removeAllowedPermissionBundle_0600
   * @tc.number SUB_CUSTOMIZATION_EDM_REMOVE_ALLOWED_PERMISSION_BUNDLE_JS_0600
   * @tc.desc   test removeAllowedPermissionBundle with null permission
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_removeAllowedPermissionBundle_0600", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      securityManager.removeAllowedPermissionBundle(SELFWANT, null, TEST_APP_INSTANCE);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code).assertEqual(401);
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_removeAllowedPermissionBundle_0700
   * @tc.number SUB_CUSTOMIZATION_EDM_REMOVE_ALLOWED_PERMISSION_BUNDLE_JS_0700
   * @tc.desc   test removeAllowedPermissionBundle with undefined permission
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_removeAllowedPermissionBundle_0700", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      securityManager.removeAllowedPermissionBundle(SELFWANT, undefined, TEST_APP_INSTANCE);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code).assertEqual(401);
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_removeAllowedPermissionBundle_0800
   * @tc.number SUB_CUSTOMIZATION_EDM_REMOVE_ALLOWED_PERMISSION_BUNDLE_JS_0800
   * @tc.desc   test removeAllowedPermissionBundle with empty permission
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_removeAllowedPermissionBundle_0800", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      securityManager.removeAllowedPermissionBundle(SELFWANT, '', TEST_APP_INSTANCE);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code).assertEqual(9200012);
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_removeAllowedPermissionBundle_0900
   * @tc.number SUB_CUSTOMIZATION_EDM_REMOVE_ALLOWED_PERMISSION_BUNDLE_JS_0900
   * @tc.desc   test removeAllowedPermissionBundle with null applicationInstance
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_removeAllowedPermissionBundle_0900", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      securityManager.removeAllowedPermissionBundle(SELFWANT, TEST_PERMISSION_1, null);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code).assertEqual(401);
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_removeAllowedPermissionBundle_1000
   * @tc.number SUB_CUSTOMIZATION_EDM_REMOVE_ALLOWED_PERMISSION_BUNDLE_JS_1000
   * @tc.desc   test removeAllowedPermissionBundle with undefined applicationInstance
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_removeAllowedPermissionBundle_1000", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      securityManager.removeAllowedPermissionBundle(SELFWANT, TEST_PERMISSION_1, undefined);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code).assertEqual(401);
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_removeAllowedPermissionBundle_1200
   * @tc.number SUB_CUSTOMIZATION_EDM_REMOVE_ALLOWED_PERMISSION_BUNDLE_JS_1200
   * @tc.desc   test removeAllowedPermissionBundle with empty appIdentifier
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_removeAllowedPermissionBundle_1200", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      securityManager.removeAllowedPermissionBundle(SELFWANT, TEST_PERMISSION_1, {
        appIdentifier: '',
        appIndex: DEFAULT_APP_INDEX,
        accountId: CURRENT_USER_ID
      });
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code).assertEqual(401);
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_removeAllowedPermissionBundle_1300
   * @tc.number SUB_CUSTOMIZATION_EDM_REMOVE_ALLOWED_PERMISSION_BUNDLE_JS_1300
   * @tc.desc   test removeAllowedPermissionBundle success
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_removeAllowedPermissionBundle_1300", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      securityManager.setDisallowedPermission(SELFWANT, TEST_PERMISSION_1, true, CURRENT_USER_ID);
      securityManager.addAllowedPermissionBundle(SELFWANT, TEST_PERMISSION_1, TEST_APP_INSTANCE);
      securityManager.removeAllowedPermissionBundle(SELFWANT, TEST_PERMISSION_1, TEST_APP_INSTANCE);
      securityManager.setDisallowedPermission(SELFWANT, TEST_PERMISSION_1, false, CURRENT_USER_ID);
    } catch (error) {
      expect(false).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_removeAllowedPermissionBundle_1400
   * @tc.number SUB_CUSTOMIZATION_EDM_REMOVE_ALLOWED_PERMISSION_BUNDLE_JS_1400
   * @tc.desc   test removeAllowedPermissionBundle without disable permission
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_removeAllowedPermissionBundle_1400", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      securityManager.removeAllowedPermissionBundle(SELFWANT, TEST_PERMISSION_1, {
        appIdentifier: TEST_REAL_APP_ID_1,
        appIndex: DEFAULT_APP_INDEX,
        accountId: CURRENT_USER_ID
      });
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code === 9201044).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_removeAllowedPermissionBundle_1500
   * @tc.number SUB_CUSTOMIZATION_EDM_REMOVE_ALLOWED_PERMISSION_BUNDLE_JS_1500
   * @tc.desc   test removeAllowedPermissionBundle with system core permission
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_removeAllowedPermissionBundle_1500", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      securityManager.removeAllowedPermissionBundle(SELFWANT, SYSTEM_CORE_PERMISSION_DOWNLOAD, {
        appIdentifier: TEST_REAL_APP_ID_1,
        appIndex: DEFAULT_APP_INDEX,
        accountId: CURRENT_USER_ID
      });
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code === 9201044).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });
}

function testGetAllowedPermissionBundles() {
  /**
   * @tc.name   test_getAllowedPermissionBundles_0100
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_ALLOWED_PERMISSION_BUNDLES_JS_0100
   * @tc.desc   test getAllowedPermissionBundles without admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_getAllowedPermissionBundles_0100", Level.LEVEL2, async (done: Function) => {
    try {
      securityManager.getAllowedPermissionBundles(SELFWANT, TEST_PERMISSION_1, CURRENT_USER_ID);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code).assertEqual(9200001);
    }
    done();
  });

  /**
   * @tc.name   test_getAllowedPermissionBundles_0200
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_ALLOWED_PERMISSION_BUNDLES_JS_0200
   * @tc.desc   test getAllowedPermissionBundles with normal admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_getAllowedPermissionBundles_0200", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
    try {
      securityManager.getAllowedPermissionBundles(SELFWANT, TEST_PERMISSION_1, CURRENT_USER_ID);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code).assertEqual(9200002);
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.name   test_getAllowedPermissionBundles_0300
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_ALLOWED_PERMISSION_BUNDLES_JS_0300
   * @tc.desc   test getAllowedPermissionBundles with null admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_getAllowedPermissionBundles_0300", Level.LEVEL2, async (done: Function) => {
    try {
      let ret: common.ApplicationInstance[] = 
        securityManager.getAllowedPermissionBundles(null, TEST_PERMISSION_1, CURRENT_USER_ID);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code).assertEqual(9200001);
    }
    done();
  });

  /**
   * @tc.name   test_getAllowedPermissionBundles_0400
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_ALLOWED_PERMISSION_BUNDLES_JS_0400
   * @tc.desc   test getAllowedPermissionBundles with undefined admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_getAllowedPermissionBundles_0400", Level.LEVEL2, async (done: Function) => {
    try {
      securityManager.getAllowedPermissionBundles(undefined, TEST_PERMISSION_1, CURRENT_USER_ID);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code).assertEqual(401);
    }
    done();
  });

  /**
   * @tc.name   test_getAllowedPermissionBundles_0500
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_ALLOWED_PERMISSION_BUNDLES_JS_0500
   * @tc.desc   test getAllowedPermissionBundles with invalid admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_getAllowedPermissionBundles_0500", Level.LEVEL2, async (done: Function) => {
    try {
      securityManager.getAllowedPermissionBundles(INVALID_WANT, TEST_PERMISSION_1, CURRENT_USER_ID);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code).assertEqual(401);
    }
    done();
  });

  /**
   * @tc.name   test_getAllowedPermissionBundles_0600
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_ALLOWED_PERMISSION_BUNDLES_JS_0600
   * @tc.desc   test getAllowedPermissionBundles with null permission
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_getAllowedPermissionBundles_0600", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      securityManager.getAllowedPermissionBundles(SELFWANT, null, CURRENT_USER_ID);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code).assertEqual(401);
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_getAllowedPermissionBundles_0700
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_ALLOWED_PERMISSION_BUNDLES_JS_0700
   * @tc.desc   test getAllowedPermissionBundles with undefined permission
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_getAllowedPermissionBundles_0700", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      securityManager.getAllowedPermissionBundles(SELFWANT, undefined, CURRENT_USER_ID);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code).assertEqual(401);
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_getAllowedPermissionBundles_0800
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_ALLOWED_PERMISSION_BUNDLES_JS_0800
   * @tc.desc   test getAllowedPermissionBundles with empty permission
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_getAllowedPermissionBundles_0800", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      securityManager.getAllowedPermissionBundles(SELFWANT, '', CURRENT_USER_ID);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code).assertEqual(9200012);
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_getAllowedPermissionBundles_0900
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_ALLOWED_PERMISSION_BUNDLES_JS_0900
   * @tc.desc   test getAllowedPermissionBundles with null accountId
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_getAllowedPermissionBundles_0900", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      securityManager.getAllowedPermissionBundles(SELFWANT, TEST_PERMISSION_1, null);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code).assertEqual(401);
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_getAllowedPermissionBundles_1000
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_ALLOWED_PERMISSION_BUNDLES_JS_1000
   * @tc.desc   test getAllowedPermissionBundles with undefined accountId
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_getAllowedPermissionBundles_1000", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      securityManager.getAllowedPermissionBundles(SELFWANT, TEST_PERMISSION_1, undefined);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code).assertEqual(401);
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_getAllowedPermissionBundles_1100
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_ALLOWED_PERMISSION_BUNDLES_JS_1100
   * @tc.desc   test getAllowedPermissionBundles success
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_getAllowedPermissionBundles_1100", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      securityManager.setDisallowedPermission(SELFWANT, TEST_PERMISSION_1, true, CURRENT_USER_ID);
      securityManager.addAllowedPermissionBundle(SELFWANT, TEST_PERMISSION_1, TEST_APP_INSTANCE);
      let result = securityManager.getAllowedPermissionBundles(SELFWANT, TEST_PERMISSION_1, CURRENT_USER_ID);
      expect(Array.isArray(result)).assertTrue();
      expect(result[0].appIdentifier === TEST_REAL_APP_ID_1).assertTrue();
      expect(result[0].appIndex === DEFAULT_APP_INDEX).assertTrue();
      expect(result[0].accountId === CURRENT_USER_ID).assertTrue();
      securityManager.removeAllowedPermissionBundle(SELFWANT, TEST_PERMISSION_1, TEST_APP_INSTANCE);
      securityManager.setDisallowedPermission(SELFWANT, TEST_PERMISSION_1, false, CURRENT_USER_ID);
      let resultAfterRemove = securityManager.getAllowedPermissionBundles(SELFWANT, TEST_PERMISSION_1, CURRENT_USER_ID);
      expect(Array.isArray(resultAfterRemove)).assertTrue();
      expect(resultAfterRemove.length === 0).assertTrue();
    } catch (error) {
      expect(false).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });
}

function testGetWatermarkImageApps() {
  /**
   * @tc.name   test_get_watermark_image_apps_0100
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_WATERMARK_IMAGE_APPS_JS_0100
   * @tc.desc   test securityManager getWatermarkImageApps without admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_watermark_image_apps_0100", Level.LEVEL2, async (done: Function) => {
    try {
      securityManager.getWatermarkImageApps(SELFWANT, DEFAULT_USER_ID);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code).assertEqual(9200001);
    }
    done();
  });

  /**
   * @tc.name   test_get_watermark_image_apps_0200
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_WATERMARK_IMAGE_APPS_JS_0200
   * @tc.desc   test securityManager getWatermarkImageApps with normal admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_watermark_image_apps_0200", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
    try {
      securityManager.getWatermarkImageApps(SELFWANT, DEFAULT_USER_ID);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code).assertEqual(9200002);
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.name   test_get_watermark_image_apps_0300
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_WATERMARK_IMAGE_APPS_JS_0300
   * @tc.desc   test securityManager getWatermarkImageApps with null admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_watermark_image_apps_0300", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      securityManager.getWatermarkImageApps(null, DEFAULT_USER_ID);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code).assertEqual(401);
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_get_watermark_image_apps_0400
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_WATERMARK_IMAGE_APPS_JS_0400
   * @tc.desc   test securityManager getWatermarkImageApps with undefined admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_watermark_image_apps_0400", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      securityManager.getWatermarkImageApps(undefined, DEFAULT_USER_ID);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code).assertEqual(401);
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_get_watermark_image_apps_0500
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_WATERMARK_IMAGE_APPS_JS_0500
   * @tc.desc   test securityManager getWatermarkImageApps with invalid admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_watermark_image_apps_0500", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      securityManager.getWatermarkImageApps(INVALID_WANT, DEFAULT_USER_ID);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code).assertEqual(401);
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_get_watermark_image_apps_0600
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_WATERMARK_IMAGE_APPS_JS_0600
   * @tc.desc   test securityManager getWatermarkImageApps with null accountId
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_watermark_image_apps_0600", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      securityManager.getWatermarkImageApps(SELFWANT, null);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code).assertEqual(401);
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_get_watermark_image_apps_0700
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_WATERMARK_IMAGE_APPS_JS_0700
   * @tc.desc   test securityManager getWatermarkImageApps with undefined accountId
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_watermark_image_apps_0700", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      securityManager.getWatermarkImageApps(SELFWANT, undefined);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code).assertEqual(401);
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_get_watermark_image_apps_0800
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_WATERMARK_IMAGE_APPS_JS_0800
   * @tc.desc   test securityManager getWatermarkImageApps with invalid accountId -1
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_watermark_image_apps_0800", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      securityManager.getWatermarkImageApps(SELFWANT, -1);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code).assertEqual(9200012);
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_get_watermark_image_apps_0900
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_WATERMARK_IMAGE_APPS_JS_0900
   * @tc.desc   test securityManager getWatermarkImageApps success
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it("test_get_watermark_image_apps_0900", Level.LEVEL0, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      let result = securityManager.getWatermarkImageApps(SELFWANT, DEFAULT_USER_ID);
      expect(Array.isArray(result)).assertTrue();
      expect(result.length === 0).assertTrue();
    } catch (error) {
      expect(false).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_get_watermark_image_apps_1000
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_WATERMARK_IMAGE_APPS_JS_1000
   * @tc.desc   test securityManager getWatermarkImageApps with invalid accountId 0
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_watermark_image_apps_1000", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      securityManager.getWatermarkImageApps(SELFWANT, 0);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code).assertEqual(9200012);
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_get_watermark_image_apps_1100
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_WATERMARK_IMAGE_APPS_JS_1100
   * @tc.desc   test securityManager getWatermarkImageApps success with accountId minValue
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it("test_get_watermark_image_apps_1100", Level.LEVEL0, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      let result = securityManager.getWatermarkImageApps(SELFWANT, 1);
      expect(Array.isArray(result)).assertTrue();
    } catch (error) {
      expect(false).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });
}


function testSetPasswordPolicy() {

  /**
   * @tc.name   test_setPasswordPolicy_0900
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_PASSWORD_POLICY_JS_0900
   * @tc.desc   test setPasswordPolicy with passwordAlgs SCRYPT_HKDF_AES success
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it("test_setPasswordPolicy_0900", Level.LEVEL0, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      let policy: securityManager.PasswordPolicy = {
        complexityRegex: '^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[!@#$%^&*])[a-zA-Z\\d!@#$%^&*]{8,}$',
        passwordAlgs: securityManager.PasswordAlgs.SCRYPT_HKDF_AES
      };
      securityManager.setPasswordPolicy(SELFWANT, policy);
      let result = securityManager.getPasswordPolicy(SELFWANT);
      expect(result.passwordAlgs).assertEqual(securityManager.PasswordAlgs.SCRYPT_HKDF_AES);
    } catch (error) {
      expect(false).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_setPasswordPolicy_1000
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_PASSWORD_POLICY_JS_1000
   * @tc.desc   test setPasswordPolicy with passwordAlgs SCRYPT_HKDF_SM4 success
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it("test_setPasswordPolicy_1000", Level.LEVEL0, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      let policy: securityManager.PasswordPolicy = {
        complexityRegex: '^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[!@#$%^&*])[a-zA-Z\\d!@#$%^&*]{8,}$',
        passwordAlgs: securityManager.PasswordAlgs.SCRYPT_HKDF_SM4
      };
      securityManager.setPasswordPolicy(SELFWANT, policy);
      let result = securityManager.getPasswordPolicy(SELFWANT);
      expect(result.passwordAlgs).assertEqual(securityManager.PasswordAlgs.SCRYPT_HKDF_SM4);
    } catch (error) {
      expect(false).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_setPasswordPolicy_1100
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_PASSWORD_POLICY_JS_1100
   * @tc.desc   test setPasswordPolicy without passwordAlgs success
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it("test_setPasswordPolicy_1100", Level.LEVEL0, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      let policy: securityManager.PasswordPolicy = {
        complexityRegex: '^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[!@#$%^&*])[a-zA-Z\\d!@#$%^&*]{8,}$'
      };
      securityManager.setPasswordPolicy(SELFWANT, policy);
      let result = securityManager.getPasswordPolicy(SELFWANT);
      expect(result.complexityRegex).assertEqual('^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[!@#$%^&*])[a-zA-Z\\d!@#$%^&*]{8,}$');
    } catch (error) {
      expect(false).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });
}

function testSetDeviceSecurityLevelPolicy() {
  /**
   * @tc.name   test_set_device_security_level_policy_0100
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_DEVICE_SECURITY_LEVEL_POLICY_JS_0100
   * @tc.desc   test securityManager setDeviceSecurityLevelPolicy without activated admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_device_security_level_policy_0100", Level.LEVEL2, async (done: Function) => {
    try {
      securityManager.setDeviceSecurityLevelPolicy(securityManager.DeviceSecurityLevelPolicy.DEFAULT_ENFORCED);
      expect(false).assertTrue();
    } catch (error) {
      console.info('test_set_device_security_level_policy_0100 error.code = ' + error.code);
      if (error.code === 801) {
        expect(error.code).assertEqual(801);
      } else {
        expect(error.code).assertEqual(9200001);
      }
    }
    done();
  });

  /**
   * @tc.name   test_set_device_security_level_policy_0200
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_DEVICE_SECURITY_LEVEL_POLICY_JS_0200
   * @tc.desc   test securityManager setDeviceSecurityLevelPolicy with not super admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_device_security_level_policy_0200", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
    try {
      securityManager.setDeviceSecurityLevelPolicy(securityManager.DeviceSecurityLevelPolicy.DEFAULT_ENFORCED);
      expect(false).assertTrue();
    } catch (error) {
      console.info('test_set_device_security_level_policy_0200 error.code = ' + error.code);
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
   * @tc.name   test_set_device_security_level_policy_0300
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_DEVICE_SECURITY_LEVEL_POLICY_JS_0300
   * @tc.desc   test securityManager setDeviceSecurityLevelPolicy with parameter verification failed
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_device_security_level_policy_0300", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      securityManager.setDeviceSecurityLevelPolicy(99);
      expect(false).assertTrue();
    } catch (error) {
      console.info('test_set_device_security_level_policy_0300 error.code = ' + error.code);
      if (error.code === 801) {
        expect(error.code).assertEqual(801);
      } else {
        expect(error.code).assertEqual(9200012);
      }
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.name   test_set_device_security_level_policy_0400
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_DEVICE_SECURITY_LEVEL_POLICY_JS_0400
   * @tc.desc   test securityManager setDeviceSecurityLevelPolicy with DEFAULT_ENFORCED
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_device_security_level_policy_0400", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      securityManager.setDeviceSecurityLevelPolicy(securityManager.DeviceSecurityLevelPolicy.DEFAULT_ENFORCED);
      let level: securityManager.DeviceSecurityLevelPolicy = securityManager.getDeviceSecurityLevelPolicy();
      expect(level).assertEqual(securityManager.DeviceSecurityLevelPolicy.DEFAULT_ENFORCED);
    } catch (error) {
      console.info('test_set_device_security_level_policy_0400 error.code = ' + error.code);
      expect(error.code).assertEqual(801);
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.name   test_set_device_security_level_policy_0500
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_DEVICE_SECURITY_LEVEL_POLICY_JS_0500
   * @tc.desc   test securityManager setDeviceSecurityLevelPolicy with ALLOW_BALANCED
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_device_security_level_policy_0500", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      securityManager.setDeviceSecurityLevelPolicy(securityManager.DeviceSecurityLevelPolicy.ALLOW_BALANCED);
      let level: securityManager.DeviceSecurityLevelPolicy = securityManager.getDeviceSecurityLevelPolicy();
      expect(level).assertEqual(securityManager.DeviceSecurityLevelPolicy.ALLOW_BALANCED);
    } catch (error) {
      console.info('test_set_device_security_level_policy_0500 error.code = ' + error.code);
      expect(error.code).assertEqual(801);
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.name   test_set_device_security_level_policy_0600
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_DEVICE_SECURITY_LEVEL_POLICY_JS_0600
   * @tc.desc   test securityManager setDeviceSecurityLevelPolicy with ALLOW_FLEXIBLE
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_device_security_level_policy_0600", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      securityManager.setDeviceSecurityLevelPolicy(securityManager.DeviceSecurityLevelPolicy.ALLOW_FLEXIBLE);
      let level: securityManager.DeviceSecurityLevelPolicy = securityManager.getDeviceSecurityLevelPolicy();
      expect(level).assertEqual(securityManager.DeviceSecurityLevelPolicy.ALLOW_FLEXIBLE);
    } catch (error) {
      console.info('test_set_device_security_level_policy_0600 error.code = ' + error.code);
      expect(error.code).assertEqual(801);
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

}

function testGetDeviceSecurityLevelPolicy() {
  /**
   * @tc.name   test_get_device_security_level_policy_0100
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_DEVICE_SECURITY_LEVEL_POLICY_JS_0100
   * @tc.desc   test securityManager getDeviceSecurityLevelPolicy without activated admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_device_security_level_policy_0100", Level.LEVEL2, async (done: Function) => {
    try {
      securityManager.getDeviceSecurityLevelPolicy();
      expect(false).assertTrue();
    } catch (error) {
      console.info('test_get_device_security_level_policy_0100 error.code = ' + error.code);
      expect(error.code).assertEqual(9200001);
    }
    done();
  });

  /**
   * @tc.name   test_get_device_security_level_policy_0200
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_DEVICE_SECURITY_LEVEL_POLICY_JS_0200
   * @tc.desc   test securityManager getDeviceSecurityLevelPolicy with not super admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_device_security_level_policy_0200", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
    try {
      securityManager.getDeviceSecurityLevelPolicy();
      expect(false).assertTrue();
    } catch (error) {
      console.info('test_get_device_security_level_policy_0200 error.code = ' + error.code);
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
   * @tc.name   test_get_device_security_level_policy_0300
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_DEVICE_SECURITY_LEVEL_POLICY_JS_0300
   * @tc.desc   test securityManager getDeviceSecurityLevelPolicy with super admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_device_security_level_policy_0300", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      securityManager.setDeviceSecurityLevelPolicy(securityManager.DeviceSecurityLevelPolicy.DEFAULT_ENFORCED);
      let level: securityManager.DeviceSecurityLevelPolicy = securityManager.getDeviceSecurityLevelPolicy();
      expect(level).assertEqual(securityManager.DeviceSecurityLevelPolicy.DEFAULT_ENFORCED);

      securityManager.setDeviceSecurityLevelPolicy(securityManager.DeviceSecurityLevelPolicy.ALLOW_BALANCED);
      level = securityManager.getDeviceSecurityLevelPolicy();
      expect(level).assertEqual(securityManager.DeviceSecurityLevelPolicy.ALLOW_BALANCED);

      securityManager.setDeviceSecurityLevelPolicy(securityManager.DeviceSecurityLevelPolicy.ALLOW_FLEXIBLE);
      level = securityManager.getDeviceSecurityLevelPolicy();
      expect(level).assertEqual(securityManager.DeviceSecurityLevelPolicy.ALLOW_FLEXIBLE);
    } catch (error) {
      console.info('test_get_device_security_level_policy_0300 error.code = ' + error.code);
      expect(error.code).assertEqual(801);
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });
}

// ==================== UKey Session & Credential Management Tests ====================

const UKEY_ACCOUNT_ID: number = 100;
const UKEY_ACCOUNT_ID_ZERO: number = 0;
const UKEY_PLUGIN_INFO: string = 'com.example.ukey_plugin';
const UKEY_PLUGIN_INFO_LONG: string = 'a'.repeat(1001);
const UKEY_CREDENTIAL_ID: Uint8Array = new Uint8Array([1, 2, 3, 4, 5]);
const UKEY_AUTH_TOKEN: Uint8Array = new Uint8Array([10, 20, 30, 40]);

function testUKeyOpenSession() {
  // === 类别B: 权限验证场景 ===

  /**
   * @tc.name   test_open_session_0100
   * @tc.number SUB_CUSTOMIZATION_EDM_OPEN_SESSION_JS_0100
   * @tc.desc   test openSession without admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_open_session_0100", Level.LEVEL2, async (done: Function) => {
    try {
      await securityManager.openSession(UKEY_ACCOUNT_ID);
      expect(false).assertTrue();
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
   * @tc.name   test_open_session_0200
   * @tc.number SUB_CUSTOMIZATION_EDM_OPEN_SESSION_JS_0200
   * @tc.desc   test openSession with normal admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_open_session_0200", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
    try {
      await securityManager.openSession(UKEY_ACCOUNT_ID);
      expect(false).assertTrue();
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

  // === 类别C: 参数异常场景 ===

  

  

  

  /**
   * @tc.name   test_open_session_0300
   * @tc.number SUB_CUSTOMIZATION_EDM_OPEN_SESSION_JS_0300
   * @tc.desc   test openSession with accountId -1 success
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it("test_open_session_0300", Level.LEVEL0, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      let challenge: Uint8Array = await securityManager.openSession(INVALID_USER_ID);
      expect(challenge instanceof Uint8Array).assertTrue();
      await securityManager.closeSession(INVALID_USER_ID);
    } catch (error) {
      expect(error.code).assertEqual(801);
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_open_session_0400
   * @tc.number SUB_CUSTOMIZATION_EDM_OPEN_SESSION_JS_0400
   * @tc.desc   test openSession with accountId 0
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_open_session_0400", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      await securityManager.openSession(UKEY_ACCOUNT_ID_ZERO);
      expect(false).assertTrue();
    } catch (error) {
      if (error.code === 801) {
        expect(error.code).assertEqual(801);
      } else {
        expect(error.code).assertEqual(9200012);
      }
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  // === 类别E: 成功场景 ===

  /**
   * @tc.name   test_open_session_0500
   * @tc.number SUB_CUSTOMIZATION_EDM_OPEN_SESSION_JS_0500
   * @tc.desc   test openSession success
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it("test_open_session_0500", Level.LEVEL0, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      let challenge: Uint8Array = await securityManager.openSession(UKEY_ACCOUNT_ID);
      expect(challenge instanceof Uint8Array).assertTrue();
      await securityManager.closeSession(UKEY_ACCOUNT_ID);
    } catch (error) {
      expect(error.code).assertEqual(801);
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_open_session_0600
   * @tc.number SUB_CUSTOMIZATION_EDM_OPEN_SESSION_JS_0600
   * @tc.desc   test openSession with null accountId
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_open_session_0600", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      await securityManager.openSession(null);
      expect().assertFail();
    } catch (error) {
      if (error.code === 801) {
        expect(error.code).assertEqual(801);
      } else {
        expect(error.code).assertEqual(401);
      }
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_open_session_0700
   * @tc.number SUB_CUSTOMIZATION_EDM_OPEN_SESSION_JS_0700
   * @tc.desc   test openSession with undefined accountId
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_open_session_0700", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      await securityManager.openSession(undefined);
      expect().assertFail();
    } catch (error) {
      if (error.code === 801) {
        expect(error.code).assertEqual(801);
      } else {
        expect(error.code).assertEqual(401);
      }
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });
}

function testUKeyCloseSession() {
  // === 类别B: 权限验证场景 ===

  /**
   * @tc.name   test_close_session_0100
   * @tc.number SUB_CUSTOMIZATION_EDM_CLOSE_SESSION_JS_0100
   * @tc.desc   test closeSession without admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_close_session_0100", Level.LEVEL2, async (done: Function) => {
    try {
      securityManager.closeSession(UKEY_ACCOUNT_ID);
      expect(false).assertTrue();
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
   * @tc.name   test_close_session_0200
   * @tc.number SUB_CUSTOMIZATION_EDM_CLOSE_SESSION_JS_0200
   * @tc.desc   test closeSession with normal admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_close_session_0200", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
    try {
      securityManager.closeSession(UKEY_ACCOUNT_ID);
      expect(false).assertTrue();
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

  // === 类别C: 参数异常场景 ===

  

  

  

  /**
   * @tc.name   test_close_session_0300
   * @tc.number SUB_CUSTOMIZATION_EDM_CLOSE_SESSION_JS_0300
   * @tc.desc   test closeSession with accountId -1 success
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it("test_close_session_0300", Level.LEVEL0, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      await securityManager.openSession(INVALID_USER_ID);
      securityManager.closeSession(INVALID_USER_ID);
    } catch (error) {
      expect(error.code).assertEqual(801);
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_close_session_0400
   * @tc.number SUB_CUSTOMIZATION_EDM_CLOSE_SESSION_JS_0400
   * @tc.desc   test closeSession with accountId 0
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_close_session_0400", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      securityManager.closeSession(UKEY_ACCOUNT_ID_ZERO);
      expect(false).assertTrue();
    } catch (error) {
      if (error.code === 801) {
        expect(error.code).assertEqual(801);
      } else {
        expect(error.code).assertEqual(9200012);
      }
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  // === 类别E: 成功场景 ===

  /**
   * @tc.name   test_close_session_0500
   * @tc.number SUB_CUSTOMIZATION_EDM_CLOSE_SESSION_JS_0500
   * @tc.desc   test closeSession success
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it("test_close_session_0500", Level.LEVEL0, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      await securityManager.openSession(UKEY_ACCOUNT_ID);
      securityManager.closeSession(UKEY_ACCOUNT_ID);
    } catch (error) {
      expect(error.code).assertEqual(801);
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_close_session_0600
   * @tc.number SUB_CUSTOMIZATION_EDM_CLOSE_SESSION_JS_0600
   * @tc.desc   test closeSession with null accountId
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_close_session_0600", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      securityManager.closeSession(null);
      expect().assertFail();
    } catch (error) {
      if (error.code === 801) {
        expect(error.code).assertEqual(801);
      } else {
        expect(error.code).assertEqual(401);
      }
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_close_session_0700
   * @tc.number SUB_CUSTOMIZATION_EDM_CLOSE_SESSION_JS_0700
   * @tc.desc   test closeSession with undefined accountId
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_close_session_0700", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      securityManager.closeSession(undefined);
      expect().assertFail();
    } catch (error) {
      if (error.code === 801) {
        expect(error.code).assertEqual(801);
      } else {
        expect(error.code).assertEqual(401);
      }
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });
}

function testUKeyAddUserExtCredential() {
  // === 类别B: 权限验证场景 ===

  /**
   * @tc.name   test_add_user_ext_credential_0100
   * @tc.number SUB_CUSTOMIZATION_EDM_ADD_USER_EXT_CREDENTIAL_JS_0100
   * @tc.desc   test addUserExtendCredential without admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_add_user_ext_credential_0100", Level.LEVEL2, async (done: Function) => {
    let info: securityManager.AddCredentialInfo = { pluginInfo: UKEY_PLUGIN_INFO };
    try {
      await securityManager.addUserExtendCredential(info, UKEY_ACCOUNT_ID);
      expect(false).assertTrue();
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
   * @tc.name   test_add_user_ext_credential_0200
   * @tc.number SUB_CUSTOMIZATION_EDM_ADD_USER_EXT_CREDENTIAL_JS_0200
   * @tc.desc   test addUserExtendCredential with normal admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_add_user_ext_credential_0200", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
    let info: securityManager.AddCredentialInfo = { pluginInfo: UKEY_PLUGIN_INFO };
    try {
      await securityManager.addUserExtendCredential(info, UKEY_ACCOUNT_ID);
      expect(false).assertTrue();
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

  // === 类别C: 参数异常场景 ===

  

  

  

  /**
   * @tc.name   test_add_user_ext_credential_0300
   * @tc.number SUB_CUSTOMIZATION_EDM_ADD_USER_EXT_CREDENTIAL_JS_0300
   * @tc.desc   test addUserExtendCredential with null info
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_add_user_ext_credential_0300", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      await securityManager.addUserExtendCredential(null, UKEY_ACCOUNT_ID);
      expect(false).assertTrue();
    } catch (error) {
      if (error.code === 801) {
        expect(error.code).assertEqual(801);
      } else {
        expect(error.code).assertEqual(401);
      }
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_add_user_ext_credential_0400
   * @tc.number SUB_CUSTOMIZATION_EDM_ADD_USER_EXT_CREDENTIAL_JS_0400
   * @tc.desc   test addUserExtendCredential with undefined info
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_add_user_ext_credential_0400", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      await securityManager.addUserExtendCredential(undefined, UKEY_ACCOUNT_ID);
      expect(false).assertTrue();
    } catch (error) {
      if (error.code === 801) {
        expect(error.code).assertEqual(801);
      } else {
        expect(error.code).assertEqual(401);
      }
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_add_user_ext_credential_0500
   * @tc.number SUB_CUSTOMIZATION_EDM_ADD_USER_EXT_CREDENTIAL_JS_0500
   * @tc.desc   test addUserExtendCredential with empty pluginInfo
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_add_user_ext_credential_0500", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    let info: securityManager.AddCredentialInfo = { pluginInfo: '' };
    try {
      await securityManager.addUserExtendCredential(info, UKEY_ACCOUNT_ID);
      expect(false).assertTrue();
    } catch (error) {
      if (error.code === 801) {
        expect(error.code).assertEqual(801);
      } else {
        expect(error.code).assertEqual(9200012);
      }
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_add_user_ext_credential_0600
   * @tc.number SUB_CUSTOMIZATION_EDM_ADD_USER_EXT_CREDENTIAL_JS_0600
   * @tc.desc   test addUserExtendCredential with long pluginInfo (1001 chars)
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_add_user_ext_credential_0600", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    let info: securityManager.AddCredentialInfo = { pluginInfo: UKEY_PLUGIN_INFO_LONG };
    try {
      await securityManager.addUserExtendCredential(info, UKEY_ACCOUNT_ID);
      expect(false).assertTrue();
    } catch (error) {
      if (error.code === 801) {
        expect(error.code).assertEqual(801);
      } else {
        expect(error.code).assertEqual(9200012);
      }
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_add_user_ext_credential_0700
   * @tc.number SUB_CUSTOMIZATION_EDM_ADD_USER_EXT_CREDENTIAL_JS_0700
   * @tc.desc   test addUserExtendCredential with accountId -1 throws 9200012
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_add_user_ext_credential_0700", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    let info: securityManager.AddCredentialInfo = { pluginInfo: UKEY_PLUGIN_INFO };
    try {
      await securityManager.openSession(INVALID_USER_ID);
      await securityManager.addUserExtendCredential(info, INVALID_USER_ID);
      expect(false).assertTrue();
      await securityManager.closeSession(INVALID_USER_ID);
    } catch (error) {
      if (error.code === 801) {
        expect(error.code).assertEqual(801);
      } else {
        expect(error.code).assertEqual(9200012);
      }
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_add_user_ext_credential_0800
   * @tc.number SUB_CUSTOMIZATION_EDM_ADD_USER_EXT_CREDENTIAL_JS_0800
   * @tc.desc   test addUserExtendCredential with accountId 0
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_add_user_ext_credential_0800", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    let info: securityManager.AddCredentialInfo = { pluginInfo: UKEY_PLUGIN_INFO };
    try {
      await securityManager.addUserExtendCredential(info, UKEY_ACCOUNT_ID_ZERO);
      expect(false).assertTrue();
    } catch (error) {
      if (error.code === 801) {
        expect(error.code).assertEqual(801);
      } else {
        expect(error.code).assertEqual(9200012);
      }
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  // === 类别E: 成功场景 ===

  /**
   * @tc.name   test_add_user_ext_credential_0900
   * @tc.number SUB_CUSTOMIZATION_EDM_ADD_USER_EXT_CREDENTIAL_JS_0900
   * @tc.desc   test addUserExtendCredential throws 9200012 in XTS
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it("test_add_user_ext_credential_0900", Level.LEVEL0, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    let info: securityManager.AddCredentialInfo = { pluginInfo: UKEY_PLUGIN_INFO };
    try {
      await securityManager.openSession(UKEY_ACCOUNT_ID);
      await securityManager.addUserExtendCredential(info, UKEY_ACCOUNT_ID);
      expect(false).assertTrue();
      await securityManager.closeSession(UKEY_ACCOUNT_ID);
    } catch (error) {
      if (error.code === 801) {
        expect(error.code).assertEqual(801);
      } else {
        expect(error.code).assertEqual(9200012);
      }
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_add_user_ext_credential_1000
   * @tc.number SUB_CUSTOMIZATION_EDM_ADD_USER_EXT_CREDENTIAL_JS_1000
   * @tc.desc   test addUserExtendCredential with authToken
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it("test_add_user_ext_credential_1000", Level.LEVEL0, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    let info: securityManager.AddCredentialInfo = { pluginInfo: UKEY_PLUGIN_INFO, authToken: UKEY_AUTH_TOKEN };
    try {
      await securityManager.openSession(UKEY_ACCOUNT_ID);
      await securityManager.addUserExtendCredential(info, UKEY_ACCOUNT_ID);
      expect(false).assertTrue();
    } catch (error) {
      if (error.code === 801) {
        expect(error.code).assertEqual(801);
      } else {
        expect(error.code).assertEqual(9200012);
      }
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_add_user_ext_credential_1100
   * @tc.number SUB_CUSTOMIZATION_EDM_ADD_USER_EXT_CREDENTIAL_JS_1100
   * @tc.desc   test addUserExtendCredential with null accountId
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_add_user_ext_credential_1100", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    let info: securityManager.AddCredentialInfo = { pluginInfo: UKEY_PLUGIN_INFO };
    try {
      await securityManager.addUserExtendCredential(info, null);
      expect().assertFail();
    } catch (error) {
      if (error.code === 801) {
        expect(error.code).assertEqual(801);
      } else {
        expect(error.code).assertEqual(401);
      }
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_add_user_ext_credential_1200
   * @tc.number SUB_CUSTOMIZATION_EDM_ADD_USER_EXT_CREDENTIAL_JS_1200
   * @tc.desc   test addUserExtendCredential with undefined accountId
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_add_user_ext_credential_1200", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    let info: securityManager.AddCredentialInfo = { pluginInfo: UKEY_PLUGIN_INFO };
    try {
      await securityManager.addUserExtendCredential(info, undefined);
      expect().assertFail();
    } catch (error) {
      if (error.code === 801) {
        expect(error.code).assertEqual(801);
      } else {
        expect(error.code).assertEqual(401);
      }
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });
}

function testUKeyRemoveUserExtCredential() {
  // === 类别B: 权限验证场景 ===

  /**
   * @tc.name   test_remove_user_ext_credential_0100
   * @tc.number SUB_CUSTOMIZATION_EDM_REMOVE_USER_EXT_CREDENTIAL_JS_0100
   * @tc.desc   test removeUserExtendCredential without admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_remove_user_ext_credential_0100", Level.LEVEL2, async (done: Function) => {
    let info: securityManager.RemoveCredentialInfo = { credentialId: UKEY_CREDENTIAL_ID };
    try {
      securityManager.removeUserExtendCredential(info, UKEY_ACCOUNT_ID);
      expect(false).assertTrue();
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
   * @tc.name   test_remove_user_ext_credential_0200
   * @tc.number SUB_CUSTOMIZATION_EDM_REMOVE_USER_EXT_CREDENTIAL_JS_0200
   * @tc.desc   test removeUserExtendCredential with normal admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_remove_user_ext_credential_0200", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
    let info: securityManager.RemoveCredentialInfo = { credentialId: UKEY_CREDENTIAL_ID };
    try {
      securityManager.removeUserExtendCredential(info, UKEY_ACCOUNT_ID);
      expect(false).assertTrue();
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

  // === 类别C: 参数异常场景 ===

  

  

  

  /**
   * @tc.name   test_remove_user_ext_credential_0300
   * @tc.number SUB_CUSTOMIZATION_EDM_REMOVE_USER_EXT_CREDENTIAL_JS_0300
   * @tc.desc   test removeUserExtendCredential with null info
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_remove_user_ext_credential_0300", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      securityManager.removeUserExtendCredential(null, UKEY_ACCOUNT_ID);
      expect(false).assertTrue();
    } catch (error) {
      if (error.code === 801) {
        expect(error.code).assertEqual(801);
      } else {
        expect(error.code).assertEqual(401);
      }
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_remove_user_ext_credential_0400
   * @tc.number SUB_CUSTOMIZATION_EDM_REMOVE_USER_EXT_CREDENTIAL_JS_0400
   * @tc.desc   test removeUserExtendCredential with undefined info
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_remove_user_ext_credential_0400", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      securityManager.removeUserExtendCredential(undefined, UKEY_ACCOUNT_ID);
      expect(false).assertTrue();
    } catch (error) {
      if (error.code === 801) {
        expect(error.code).assertEqual(801);
      } else {
        expect(error.code).assertEqual(401);
      }
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_remove_user_ext_credential_0500
   * @tc.number SUB_CUSTOMIZATION_EDM_REMOVE_USER_EXT_CREDENTIAL_JS_0500
   * @tc.desc   test removeUserExtendCredential with authToken
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_remove_user_ext_credential_0500", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    let info: securityManager.RemoveCredentialInfo = { credentialId: UKEY_CREDENTIAL_ID, authToken: UKEY_AUTH_TOKEN };
    try {
      await securityManager.openSession(UKEY_ACCOUNT_ID);
      securityManager.removeUserExtendCredential(info, UKEY_ACCOUNT_ID);
      expect(false).assertTrue();
    } catch (error) {
      if (error.code === 801) {
        expect(error.code).assertEqual(801);
      } else {
        expect(error.code).assertEqual(9200012);
      }
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_remove_user_ext_credential_0600
   * @tc.number SUB_CUSTOMIZATION_EDM_REMOVE_USER_EXT_CREDENTIAL_JS_0600
   * @tc.desc   test removeUserExtendCredential with null accountId
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_remove_user_ext_credential_0600", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    let info: securityManager.RemoveCredentialInfo = { credentialId: UKEY_CREDENTIAL_ID };
    try {
      securityManager.removeUserExtendCredential(info, null);
      expect().assertFail();
    } catch (error) {
      if (error.code === 801) {
        expect(error.code).assertEqual(801);
      } else {
        expect(error.code).assertEqual(401);
      }
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_remove_user_ext_credential_0700
   * @tc.number SUB_CUSTOMIZATION_EDM_REMOVE_USER_EXT_CREDENTIAL_JS_0700
   * @tc.desc   test removeUserExtendCredential with undefined accountId
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_remove_user_ext_credential_0700", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    let info: securityManager.RemoveCredentialInfo = { credentialId: UKEY_CREDENTIAL_ID };
    try {
      securityManager.removeUserExtendCredential(info, undefined);
      expect().assertFail();
    } catch (error) {
      if (error.code === 801) {
        expect(error.code).assertEqual(801);
      } else {
        expect(error.code).assertEqual(401);
      }
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

}

function testUKeyGetUserExtCredential() {
  // === 类别B: 权限验证场景 ===

  /**
   * @tc.name   test_get_user_ext_credential_0100
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_USER_EXT_CREDENTIAL_JS_0100
   * @tc.desc   test getUserExtendCredential without admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_user_ext_credential_0100", Level.LEVEL2, async (done: Function) => {
    try {
      await securityManager.getUserExtendCredential(UKEY_ACCOUNT_ID);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code).assertEqual(9200001);
    }
    done();
  });

  /**
   * @tc.name   test_get_user_ext_credential_0200
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_USER_EXT_CREDENTIAL_JS_0200
   * @tc.desc   test getUserExtendCredential with normal admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_user_ext_credential_0200", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
    try {
      let ret = await securityManager.getUserExtendCredential(UKEY_ACCOUNT_ID);
      expect(ret.length === 0).assertTrue();
    } catch (error) {
      expect(error.code).assertEqual(9200002);
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  // === 类别C: 参数异常场景 ===

  

  

  

  /**
   * @tc.name   test_get_user_ext_credential_0300
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_USER_EXT_CREDENTIAL_JS_0300
   * @tc.desc   test getUserExtendCredential with accountId -1 success
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it("test_get_user_ext_credential_0300", Level.LEVEL0, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      let credentials: Array<securityManager.UserExtCredentialInfo> = await securityManager.getUserExtendCredential(INVALID_USER_ID);
      expect(Array.isArray(credentials)).assertTrue();
    } catch (error) {
      expect(false).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });


  // === 类别E: 成功场景 ===

  /**
   * @tc.name   test_get_user_ext_credential_0400
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_USER_EXT_CREDENTIAL_JS_0400
   * @tc.desc   test getUserExtendCredential success
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it("test_get_user_ext_credential_0400", Level.LEVEL0, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      let credentials: Array<securityManager.UserExtCredentialInfo> = await securityManager.getUserExtendCredential(UKEY_ACCOUNT_ID);
      expect(Array.isArray(credentials)).assertTrue();
    } catch (error) {
      expect(false).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_get_user_ext_credential_0500
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_USER_EXT_CREDENTIAL_JS_0500
   * @tc.desc   test getUserExtendCredential with credentialId and pluginInfo
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it("test_get_user_ext_credential_0500", Level.LEVEL0, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    let localCredential: securityManager.UserExtCredentialInfo = { credentialId: UKEY_CREDENTIAL_ID, pluginInfo: UKEY_PLUGIN_INFO };
    let addInfo: securityManager.AddCredentialInfo = { pluginInfo: localCredential.pluginInfo, authToken: UKEY_AUTH_TOKEN };
    let removeInfo: securityManager.RemoveCredentialInfo = { credentialId: localCredential.credentialId, authToken: UKEY_AUTH_TOKEN };
    try {
      let credentials: Array<securityManager.UserExtCredentialInfo> = await securityManager.getUserExtendCredential(UKEY_ACCOUNT_ID);
      expect(Array.isArray(credentials)).assertTrue();
      for (let i = 0; i < credentials.length; i++) {
        expect(credentials[i].credentialId instanceof Uint8Array).assertTrue();
        expect(credentials[i].pluginInfo.length > 0).assertTrue();
      }
      await securityManager.openSession(UKEY_ACCOUNT_ID);
      try {
        await securityManager.addUserExtendCredential(addInfo, UKEY_ACCOUNT_ID);
      } catch (e) {
        // XTS 环境无 ukey 认证插件，add 失败不影响继续消费 credentialId 属性
      }
      securityManager.removeUserExtendCredential(removeInfo, UKEY_ACCOUNT_ID);
      expect(false).assertTrue();
    } catch (error) {
      if (error.code === 801) {
        expect(error.code).assertEqual(801);
      } else {
        expect(error.code).assertEqual(9200012);
      }
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_get_user_ext_credential_0600
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_USER_EXT_CREDENTIAL_JS_0600
   * @tc.desc   test getUserExtendCredential with null accountId
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_user_ext_credential_0600", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      await securityManager.getUserExtendCredential(null);
      expect().assertFail();
    } catch (error) {
      if (error.code === 801) {
        expect(error.code).assertEqual(801);
      } else {
        expect(error.code).assertEqual(401);
      }
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_get_user_ext_credential_0700
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_USER_EXT_CREDENTIAL_JS_0700
   * @tc.desc   test getUserExtendCredential with undefined accountId
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_user_ext_credential_0700", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      await securityManager.getUserExtendCredential(undefined);
      expect().assertFail();
    } catch (error) {
      if (error.code === 801) {
        expect(error.code).assertEqual(801);
      } else {
        expect(error.code).assertEqual(401);
      }
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });
}

function testUKeySetUnlockPolicy() {
  // === 类别B: 权限验证场景 ===

  /**
   * @tc.name   test_set_unlock_policy_0100
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_UNLOCK_POLICY_JS_0100
   * @tc.desc   test setUnlockPolicy without admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_unlock_policy_0100", Level.LEVEL2, async (done: Function) => {
    try {
      securityManager.setUnlockPolicy(securityManager.UnlockPolicy.DEFAULT, UKEY_ACCOUNT_ID);
      expect(false).assertTrue();
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
   * @tc.name   test_set_unlock_policy_0200
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_UNLOCK_POLICY_JS_0200
   * @tc.desc   test setUnlockPolicy with normal admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_unlock_policy_0200", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
    try {
      securityManager.setUnlockPolicy(securityManager.UnlockPolicy.DEFAULT, UKEY_ACCOUNT_ID);
      expect(false).assertTrue();
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

  // === 类别C: 参数异常场景 ===

  

  

  

  /**
   * @tc.name   test_set_unlock_policy_0300
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_UNLOCK_POLICY_JS_0300
   * @tc.desc   test setUnlockPolicy with null policy
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_unlock_policy_0300", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      securityManager.setUnlockPolicy(null, UKEY_ACCOUNT_ID);
      expect(false).assertTrue();
    } catch (error) {
      if (error.code === 801) {
        expect(error.code).assertEqual(801);
      } else {
        expect(error.code).assertEqual(401);
      }
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_set_unlock_policy_0400
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_UNLOCK_POLICY_JS_0400
   * @tc.desc   test setUnlockPolicy with undefined policy
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_unlock_policy_0400", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      securityManager.setUnlockPolicy(undefined, UKEY_ACCOUNT_ID);
      expect(false).assertTrue();
    } catch (error) {
      if (error.code === 801) {
        expect(error.code).assertEqual(801);
      } else {
        expect(error.code).assertEqual(401);
      }
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_set_unlock_policy_0500
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_UNLOCK_POLICY_JS_0500
   * @tc.desc   test setUnlockPolicy with invalid policy enum value
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_unlock_policy_0500", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      securityManager.setUnlockPolicy(3 as securityManager.UnlockPolicy, UKEY_ACCOUNT_ID);
      expect(false).assertTrue();
    } catch (error) {
      if (error.code === 801) {
        expect(error.code).assertEqual(801);
      } else {
        expect(error.code).assertEqual(9200012);
      }
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_set_unlock_policy_0600
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_UNLOCK_POLICY_JS_0600
   * @tc.desc   test setUnlockPolicy with accountId -1
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_unlock_policy_0600", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      securityManager.setUnlockPolicy(securityManager.UnlockPolicy.DEFAULT, INVALID_USER_ID);
      expect(false).assertTrue();
    } catch (error) {
      if (error.code === 801) {
        expect(error.code).assertEqual(801);
      } else {
        expect(error.code).assertEqual(9200012);
      }
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_set_unlock_policy_0700
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_UNLOCK_POLICY_JS_0700
   * @tc.desc   test setUnlockPolicy with accountId 0
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_unlock_policy_0700", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      securityManager.setUnlockPolicy(securityManager.UnlockPolicy.DEFAULT, UKEY_ACCOUNT_ID_ZERO);
      expect(false).assertTrue();
    } catch (error) {
      if (error.code === 801) {
        expect(error.code).assertEqual(801);
      } else {
        expect(error.code).assertEqual(9200012);
      }
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  // === 类别C: unlockPolicy枚举全覆盖 ===

  /**
   * @tc.name   test_set_unlock_policy_0800
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_UNLOCK_POLICY_JS_0800
   * @tc.desc   test setUnlockPolicy with DEFAULT policy success
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it("test_set_unlock_policy_0800", Level.LEVEL0, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      securityManager.setUnlockPolicy(securityManager.UnlockPolicy.DEFAULT, UKEY_ACCOUNT_ID);
      let result = securityManager.getUnlockPolicy(UKEY_ACCOUNT_ID);
      expect(result === securityManager.UnlockPolicy.DEFAULT).assertTrue();
    } catch (error) {
      expect(error.code).assertEqual(801);
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_set_unlock_policy_0900
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_UNLOCK_POLICY_JS_0900
   * @tc.desc   test setUnlockPolicy with EXTENDED_AUTH_ONLY policy success
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it("test_set_unlock_policy_0900", Level.LEVEL0, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      securityManager.setUnlockPolicy(securityManager.UnlockPolicy.EXTENDED_AUTH_ONLY, UKEY_ACCOUNT_ID);
      let result = securityManager.getUnlockPolicy(UKEY_ACCOUNT_ID);
      expect(result === securityManager.UnlockPolicy.EXTENDED_AUTH_ONLY).assertTrue();
    } catch (error) {
      expect(error.code).assertEqual(801);
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_set_unlock_policy_1000
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_UNLOCK_POLICY_JS_1000
   * @tc.desc   test setUnlockPolicy with EXTENDED_AUTH_REQUIRED policy success
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it("test_set_unlock_policy_1000", Level.LEVEL0, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      securityManager.setUnlockPolicy(securityManager.UnlockPolicy.EXTENDED_AUTH_REQUIRED, UKEY_ACCOUNT_ID);
      let result = securityManager.getUnlockPolicy(UKEY_ACCOUNT_ID);
      expect(result === securityManager.UnlockPolicy.EXTENDED_AUTH_REQUIRED).assertTrue();
    } catch (error) {
      expect(error.code).assertEqual(801);
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_set_unlock_policy_1100
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_UNLOCK_POLICY_JS_1100
   * @tc.desc   test setUnlockPolicy with null accountId
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_unlock_policy_1100", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      securityManager.setUnlockPolicy(securityManager.UnlockPolicy.DEFAULT, null);
      expect().assertFail();
    } catch (error) {
      if (error.code === 801) {
        expect(error.code).assertEqual(801);
      } else {
        expect(error.code).assertEqual(401);
      }
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_set_unlock_policy_1200
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_UNLOCK_POLICY_JS_1200
   * @tc.desc   test setUnlockPolicy with undefined accountId
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_unlock_policy_1200", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      securityManager.setUnlockPolicy(securityManager.UnlockPolicy.DEFAULT, undefined);
      expect().assertFail();
    } catch (error) {
      if (error.code === 801) {
        expect(error.code).assertEqual(801);
      } else {
        expect(error.code).assertEqual(401);
      }
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });
}

function testUKeyGetUnlockPolicy() {
  // === 类别B: 权限验证场景 ===

  /**
   * @tc.name   test_get_unlock_policy_0100
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_UNLOCK_POLICY_JS_0100
   * @tc.desc   test getUnlockPolicy without admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_unlock_policy_0100", Level.LEVEL2, async (done: Function) => {
    try {
      securityManager.getUnlockPolicy(UKEY_ACCOUNT_ID);
      expect(false).assertTrue();
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
   * @tc.name   test_get_unlock_policy_0200
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_UNLOCK_POLICY_JS_0200
   * @tc.desc   test getUnlockPolicy with normal admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_unlock_policy_0200", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
    try {
      securityManager.getUnlockPolicy(UKEY_ACCOUNT_ID);
      expect(false).assertTrue();
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

  // === 类别C: 参数异常场景 ===

  

  

  

  /**
   * @tc.name   test_get_unlock_policy_0300
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_UNLOCK_POLICY_JS_0300
   * @tc.desc   test getUnlockPolicy with accountId -1
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_unlock_policy_0300", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      securityManager.getUnlockPolicy(INVALID_USER_ID);
      expect(false).assertTrue();
    } catch (error) {
      if (error.code === 801) {
        expect(error.code).assertEqual(801);
      } else {
        expect(error.code).assertEqual(9200012);
      }
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_get_unlock_policy_0400
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_UNLOCK_POLICY_JS_0400
   * @tc.desc   test getUnlockPolicy with accountId 0
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_unlock_policy_0400", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      securityManager.getUnlockPolicy(UKEY_ACCOUNT_ID_ZERO);
      expect(false).assertTrue();
    } catch (error) {
      if (error.code === 801) {
        expect(error.code).assertEqual(801);
      } else {
        expect(error.code).assertEqual(9200012);
      }
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  // === 类别E: 成功场景 ===

  /**
   * @tc.name   test_get_unlock_policy_0500
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_UNLOCK_POLICY_JS_0500
   * @tc.desc   test getUnlockPolicy success
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it("test_get_unlock_policy_0500", Level.LEVEL0, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      let policy: securityManager.UnlockPolicy = securityManager.getUnlockPolicy(UKEY_ACCOUNT_ID);
      expect(policy >= 0 && policy <= 2).assertTrue();
    } catch (error) {
      expect(error.code).assertEqual(801);
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_get_unlock_policy_0600
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_UNLOCK_POLICY_JS_0600
   * @tc.desc   test getUnlockPolicy with null accountId
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_unlock_policy_0600", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      securityManager.getUnlockPolicy(null);
      expect().assertFail();
    } catch (error) {
      if (error.code === 801) {
        expect(error.code).assertEqual(801);
      } else {
        expect(error.code).assertEqual(401);
      }
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_get_unlock_policy_0700
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_UNLOCK_POLICY_JS_0700
   * @tc.desc   test getUnlockPolicy with undefined accountId
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_unlock_policy_0700", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      securityManager.getUnlockPolicy(undefined);
      expect().assertFail();
    } catch (error) {
      if (error.code === 801) {
        expect(error.code).assertEqual(801);
      } else {
        expect(error.code).assertEqual(401);
      }
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });
}

// ==================== UKey Session Lifecycle Exception Tests ====================

function testUKeySessionLifecycle() {
  /**
   * @tc.name   test_ukey_session_lifecycle_0100
   * @tc.number SUB_CUSTOMIZATION_EDM_UKEY_SESSION_LIFECYCLE_JS_0100
   * @tc.desc   test addUserExtendCredential without openSession
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_ukey_session_lifecycle_0100", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    let info: securityManager.AddCredentialInfo = { pluginInfo: UKEY_PLUGIN_INFO };
    try {
      await securityManager.addUserExtendCredential(info, UKEY_ACCOUNT_ID);
      expect(false).assertTrue();
    } catch (error) {
      if (error.code === 801) {
        expect(error.code).assertEqual(801);
      } else {
        expect(error.code).assertEqual(9200012);
      }
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_ukey_session_lifecycle_0200
   * @tc.number SUB_CUSTOMIZATION_EDM_UKEY_SESSION_LIFECYCLE_JS_0200
   * @tc.desc   test removeUserExtendCredential without openSession
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_ukey_session_lifecycle_0200", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    let info: securityManager.RemoveCredentialInfo = { credentialId: UKEY_CREDENTIAL_ID };
    try {
      securityManager.removeUserExtendCredential(info, UKEY_ACCOUNT_ID);
      expect(false).assertTrue();
    } catch (error) {
      if (error.code === 801) {
        expect(error.code).assertEqual(801);
      } else {
        expect(error.code).assertEqual(9200012);
      }
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_ukey_session_lifecycle_0300
   * @tc.number SUB_CUSTOMIZATION_EDM_UKEY_SESSION_LIFECYCLE_JS_0300
   * @tc.desc   test getUserExtendCredential without openSession (no session required)
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it("test_ukey_session_lifecycle_0300", Level.LEVEL0, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      // getUserExtendCredential不需要openSession前置，可直接调用
      let credentials: Array<securityManager.UserExtCredentialInfo> = await securityManager.getUserExtendCredential(UKEY_ACCOUNT_ID);
      expect(Array.isArray(credentials)).assertTrue();
    } catch (error) {
      expect(false).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_ukey_session_lifecycle_0400
   * @tc.number SUB_CUSTOMIZATION_EDM_UKEY_SESSION_LIFECYCLE_JS_0400
   * @tc.desc   test openSession twice without closeSession, last session wins
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_ukey_session_lifecycle_0400", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      let challenge1: Uint8Array = await securityManager.openSession(UKEY_ACCOUNT_ID);
      expect(challenge1 instanceof Uint8Array).assertTrue();
      // 第二次openSession应成功，新session覆盖旧session（全局唯一）
      let challenge2: Uint8Array = await securityManager.openSession(UKEY_ACCOUNT_ID);
      expect(challenge2 instanceof Uint8Array).assertTrue();
      await securityManager.closeSession(UKEY_ACCOUNT_ID);
    } catch (error) {
      expect(error.code).assertEqual(801);
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_ukey_session_lifecycle_0500
   * @tc.number SUB_CUSTOMIZATION_EDM_UKEY_SESSION_LIFECYCLE_JS_0500
   * @tc.desc   test addUserExtendCredential after closeSession
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_ukey_session_lifecycle_0500", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    let info: securityManager.AddCredentialInfo = { pluginInfo: UKEY_PLUGIN_INFO };
    try {
      await securityManager.openSession(UKEY_ACCOUNT_ID);
      await securityManager.closeSession(UKEY_ACCOUNT_ID);
      await securityManager.addUserExtendCredential(info, UKEY_ACCOUNT_ID);
      expect(false).assertTrue();
    } catch (error) {
      if (error.code === 801) {
        expect(error.code).assertEqual(801);
      } else {
        expect(error.code).assertEqual(9200012);
      }
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_ukey_session_lifecycle_0600
   * @tc.number SUB_CUSTOMIZATION_EDM_UKEY_SESSION_LIFECYCLE_JS_0600
   * @tc.desc   test closeSession twice
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_ukey_session_lifecycle_0600", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      await securityManager.openSession(UKEY_ACCOUNT_ID);
      securityManager.closeSession(UKEY_ACCOUNT_ID);
      securityManager.closeSession(UKEY_ACCOUNT_ID);
    } catch (error) {
      if (error.code === 801) {
        expect(error.code).assertEqual(801);
      } else {
        expect(error.code).assertEqual(9200012);
      }
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_ukey_session_lifecycle_0700
   * @tc.number SUB_CUSTOMIZATION_EDM_UKEY_SESSION_LIFECYCLE_JS_0700
   * @tc.desc   test closeSession after addCredential fails
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_ukey_session_lifecycle_0700", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    let info: securityManager.AddCredentialInfo = { pluginInfo: '' };
    try {
      await securityManager.openSession(UKEY_ACCOUNT_ID);
      try {
        await securityManager.addUserExtendCredential(info, UKEY_ACCOUNT_ID);
      } catch (e) {}
      await securityManager.closeSession(UKEY_ACCOUNT_ID);
    } catch (error) {
      expect(error.code).assertEqual(801);
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_ukey_session_lifecycle_0800
   * @tc.number SUB_CUSTOMIZATION_EDM_UKEY_SESSION_LIFECYCLE_JS_0800
   * @tc.desc   test openSession, setUnlockPolicy, closeSession flow
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it("test_ukey_session_lifecycle_0800", Level.LEVEL0, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      await securityManager.openSession(UKEY_ACCOUNT_ID);
      securityManager.setUnlockPolicy(securityManager.UnlockPolicy.DEFAULT, UKEY_ACCOUNT_ID);
      await securityManager.closeSession(UKEY_ACCOUNT_ID);
    } catch (error) {
      expect(error.code).assertEqual(801);
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_ukey_session_lifecycle_0900
   * @tc.number SUB_CUSTOMIZATION_EDM_UKEY_SESSION_LIFECYCLE_JS_0900
   * @tc.desc   test openSession without closeSession, session auto timeout after 10 min
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_ukey_session_lifecycle_0900", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      // openSession后不closeSession，session会在10分钟后自动超时
      // 接口层面无感，此处验证openSession成功后不closeSession不会导致当前用例异常
      let challenge: Uint8Array = await securityManager.openSession(UKEY_ACCOUNT_ID);
      expect(challenge instanceof Uint8Array).assertTrue();
      // 注意：实际超时测试(10分钟)不适合在自动化测试中执行
      // 此处仅验证openSession成功后不closeSession的接口层面无感特性
    } catch (error) {
      expect(error.code).assertEqual(801);
    } finally {
      // 测试结束前closeSession，清理资源
      try {
        await securityManager.closeSession(UKEY_ACCOUNT_ID);
      } catch (e) {}
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });
}

// ==================== UKey Full Lifecycle Integration Tests ====================

function testUKeyFullLifecycle() {
  /**
   * @tc.name   test_ukey_full_lifecycle_0100
   * @tc.number SUB_CUSTOMIZATION_EDM_UKEY_FULL_LIFECYCLE_JS_0100
   * @tc.desc   test addCredential throws 9200012 in XTS: openSession -> addCredential(9200012) -> closeSession
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it("test_ukey_full_lifecycle_0100", Level.LEVEL0, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    let info: securityManager.AddCredentialInfo = { pluginInfo: UKEY_PLUGIN_INFO };
    try {
      let challenge: Uint8Array = await securityManager.openSession(UKEY_ACCOUNT_ID);
      expect(challenge instanceof Uint8Array).assertTrue();
      await securityManager.addUserExtendCredential(info, UKEY_ACCOUNT_ID);
      expect(false).assertTrue();
      await securityManager.closeSession(UKEY_ACCOUNT_ID);
    } catch (error) {
      if (error.code === 801) {
        expect(error.code).assertEqual(801);
      } else {
        expect(error.code).assertEqual(9200012);
      }
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });


  /**
   * @tc.name   test_ukey_full_lifecycle_0200
   * @tc.number SUB_CUSTOMIZATION_EDM_UKEY_FULL_LIFECYCLE_JS_0200
   * @tc.desc   test set and get unlock policy flow
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it("test_ukey_full_lifecycle_0200", Level.LEVEL0, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      securityManager.setUnlockPolicy(securityManager.UnlockPolicy.EXTENDED_AUTH_REQUIRED, UKEY_ACCOUNT_ID);
      let policy: securityManager.UnlockPolicy = securityManager.getUnlockPolicy(UKEY_ACCOUNT_ID);
      expect(policy === securityManager.UnlockPolicy.EXTENDED_AUTH_REQUIRED).assertTrue();
    } catch (error) {
      expect(error.code).assertEqual(801);
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });
  /**
   * @tc.name   test_ukey_full_lifecycle_0300
   * @tc.number SUB_CUSTOMIZATION_EDM_UKEY_FULL_LIFECYCLE_JS_0300
   * @tc.desc   test addCredential throws 9200012 in XTS: openSession -> addCredential(9200012) -> closeSession
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it("test_ukey_full_lifecycle_0300", Level.LEVEL0, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    let addInfo: securityManager.AddCredentialInfo = { pluginInfo: UKEY_PLUGIN_INFO };
    try {
      await securityManager.openSession(UKEY_ACCOUNT_ID);
      await securityManager.addUserExtendCredential(addInfo, UKEY_ACCOUNT_ID);
      expect(false).assertTrue();
    } catch (error) {
      if (error.code === 801) {
        expect(error.code).assertEqual(801);
      } else {
        expect(error.code).assertEqual(9200012);
      }
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });
}

function testSetWeakPinEnable() {
  /**
   * @tc.name   test_setWeakPinEnable_0100
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_WEAK_PIN_ENABLE_JS_0100
   * @tc.desc   test setWeakPinEnable without admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_setWeakPinEnable_0100", Level.LEVEL2, async (done: Function) => {
    try {
      withWeakPinFile((fd: number) => {
        securityManager.setWeakPinEnable(true, fd);
        expect(false).assertTrue();
      });
    } catch (error) {
      expect(error.code === 9200001).assertTrue();
    }
    done();
  });
 
  /**
   * @tc.name   test_setWeakPinEnable_0200
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_WEAK_PIN_ENABLE_JS_0200
   * @tc.desc   test setWeakPinEnable with normal admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_setWeakPinEnable_0200", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
    try {
      withWeakPinFile((fd: number) => {
        securityManager.setWeakPinEnable(true, fd);
        expect(false).assertTrue();
      });
    } catch (error) {
      expect(error.code === 9200002).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });
 
  /**
   * @tc.name   test_setWeakPinEnable_0300
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_WEAK_PIN_ENABLE_JS_0300
   * @tc.desc   test setWeakPinEnable with null isEnable
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_setWeakPinEnable_0300", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      withWeakPinFile((fd: number) => {
        securityManager.setWeakPinEnable(null, fd);
        expect(false).assertTrue();
      });
    } catch (error) {
      expect(error.code === 401).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });
 
  /**
   * @tc.name   test_setWeakPinEnable_0400
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_WEAK_PIN_ENABLE_JS_0400
   * @tc.desc   test setWeakPinEnable with undefined isEnable
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_setWeakPinEnable_0400", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      withWeakPinFile((fd: number) => {
        securityManager.setWeakPinEnable(undefined, fd);
        expect(false).assertTrue();
      });
    } catch (error) {
      expect(error.code === 401).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });
 
  /**
   * @tc.name   test_setWeakPinEnable_0500
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_WEAK_PIN_ENABLE_JS_0500
   * @tc.desc   test setWeakPinEnable with null fd
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_setWeakPinEnable_0500", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      securityManager.setWeakPinEnable(true, null);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code === 401).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });
 
  /**
   * @tc.name   test_setWeakPinEnable_0600
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_WEAK_PIN_ENABLE_JS_0600
   * @tc.desc   test setWeakPinEnable with undefined fd
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_setWeakPinEnable_0600", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      securityManager.setWeakPinEnable(true, undefined);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code === 401).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });
 
  /**
   * @tc.name   test_setWeakPinEnable_0700
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_WEAK_PIN_ENABLE_JS_0700
   * @tc.desc   test setWeakPinEnable with invalid fd
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_setWeakPinEnable_0700", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      securityManager.setWeakPinEnable(true, -1);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code === 9200012).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });
 
  /**
   * @tc.name   test_setWeakPinEnable_0800
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_WEAK_PIN_ENABLE_JS_0800
   * @tc.desc   test setWeakPinEnable enable success
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it("test_setWeakPinEnable_0800", Level.LEVEL0, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      withWeakPinFile((fd: number) => {
        securityManager.setWeakPinEnable(true, fd);
      });
      let result: boolean = securityManager.isWeakPinEnabled();
      expect(result).assertEqual(true);
    } catch (error) {
      expect(error.code === 9200016).assertTrue();
    } finally {
      try {
        securityManager.setWeakPinEnable(false);
      } catch (err) {
        console.error('EDM_TEST_LOG: Failed to clean up weak pin policy.');
      }
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });
 
  /**
   * @tc.name   test_setWeakPinEnable_0900
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_WEAK_PIN_ENABLE_JS_0900
   * @tc.desc   test setWeakPinEnable with oversized file
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it("test_setWeakPinEnable_0900", Level.LEVEL0, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      withWeakPinFile((fd: number) => {
        securityManager.setWeakPinEnable(true, fd);
        expect(false).assertTrue();
      }, (fd: number) => {
        fs.truncateSync(fd, WEAK_PIN_MAX_SIZE + 1);
      });
    } catch (error) {
      expect(error.code === 9200012).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });
 
  /**
   * @tc.name   test_setWeakPinEnable_1000
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_WEAK_PIN_ENABLE_JS_1000
   * @tc.desc   test setWeakPinEnable disable success
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_setWeakPinEnable_1000", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      withWeakPinFile((fd: number) => {
        securityManager.setWeakPinEnable(true, fd);
      });
      let resultBefore: boolean = securityManager.isWeakPinEnabled();
      expect(resultBefore).assertEqual(true);
      securityManager.setWeakPinEnable(false);
      let resultAfter: boolean = securityManager.isWeakPinEnabled();
      expect(resultAfter).assertEqual(false);
    } catch (error) {
      expect(error.code === 9200016).assertTrue();
    } finally {
      try {
        securityManager.setWeakPinEnable(false);
      } catch (err) {
        console.error('EDM_TEST_LOG: Failed to clean up weak pin policy.');
      }
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });
 
  /**
   * @tc.name   test_setWeakPinEnable_1100
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_WEAK_PIN_ENABLE_JS_1100
   * @tc.desc   test setWeakPinEnable disable without fd
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_setWeakPinEnable_1100", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      securityManager.setWeakPinEnable(false);
      let result: boolean = securityManager.isWeakPinEnabled();
      expect(result).assertEqual(false);
    } catch (error) {
      expect(false).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });
}
 
function testIsWeakPinEnabled() {
  /**
   * @tc.name   test_isWeakPinEnabled_0100
   * @tc.number SUB_CUSTOMIZATION_EDM_IS_WEAK_PIN_ENABLED_JS_0100
   * @tc.desc   test isWeakPinEnabled without admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_isWeakPinEnabled_0100", Level.LEVEL2, async (done: Function) => {
    try {
      securityManager.isWeakPinEnabled();
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code === 9200001).assertTrue();
    }
    done();
  });
 
  /**
   * @tc.name   test_isWeakPinEnabled_0200
   * @tc.number SUB_CUSTOMIZATION_EDM_IS_WEAK_PIN_ENABLED_JS_0200
   * @tc.desc   test isWeakPinEnabled with normal admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_isWeakPinEnabled_0200", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
    try {
      securityManager.isWeakPinEnabled();
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code === 9200002).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });
 
  /**
   * @tc.name   test_isWeakPinEnabled_0300
   * @tc.number SUB_CUSTOMIZATION_EDM_IS_WEAK_PIN_ENABLED_JS_0300
   * @tc.desc   test isWeakPinEnabled returns false when not set
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it("test_isWeakPinEnabled_0300", Level.LEVEL0, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      securityManager.setWeakPinEnable(false);
      let result: boolean = securityManager.isWeakPinEnabled();
      expect(result).assertEqual(false);
    } catch (error) {
      expect(false).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });
 
  /**
   * @tc.name   test_isWeakPinEnabled_0400
   * @tc.number SUB_CUSTOMIZATION_EDM_IS_WEAK_PIN_ENABLED_JS_0400
   * @tc.desc   test isWeakPinEnabled returns true when set
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it("test_isWeakPinEnabled_0400", Level.LEVEL0, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      withWeakPinFile((fd: number) => {
        securityManager.setWeakPinEnable(true, fd);
      });
      let result: boolean = securityManager.isWeakPinEnabled();
      expect(result).assertEqual(true);
    } catch (error) {
      expect(error.code === 9200016).assertTrue();
    } finally {
      try {
        securityManager.setWeakPinEnable(false);
      } catch (err) {
        console.error('EDM_TEST_LOG: Failed to clean up weak pin policy.');
      }
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });
 
  /**
   * @tc.name   test_isWeakPinEnabled_0500
   * @tc.number SUB_CUSTOMIZATION_EDM_IS_WEAK_PIN_ENABLED_JS_0500
   * @tc.desc   test isWeakPinEnabled returns false after cancelled
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_isWeakPinEnabled_0500", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      withWeakPinFile((fd: number) => {
        securityManager.setWeakPinEnable(true, fd);
      });
      securityManager.setWeakPinEnable(false);
      let result: boolean = securityManager.isWeakPinEnabled();
      expect(result).assertEqual(false);
    } catch (error) {
      expect(error.code === 9200016).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });
}

function testGetPasswordLastChangedTime() {
  const ACCOUNT_ID_ZERO: number = 0;

  /**
   * @tc.name   test_get_password_last_changed_time_0100
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_PASSWORD_LAST_CHANGED_TIME_JS_0100
   * @tc.desc   test getPasswordLastChangedTime without admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_password_last_changed_time_0100", Level.LEVEL2, async (done: Function) => {
    try {
      securityManager.getPasswordLastChangedTime(CURRENT_USER_ID);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code).assertEqual(9200001);
    }
    done();
  });

  /**
   * @tc.name   test_get_password_last_changed_time_0200
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_PASSWORD_LAST_CHANGED_TIME_JS_0200
   * @tc.desc   test getPasswordLastChangedTime with normal admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_password_last_changed_time_0200", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
    try {
      securityManager.getPasswordLastChangedTime(CURRENT_USER_ID);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code).assertEqual(9200002);
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.name   test_get_password_last_changed_time_0300
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_PASSWORD_LAST_CHANGED_TIME_JS_0300
   * @tc.desc   test getPasswordLastChangedTime success
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it("test_get_password_last_changed_time_0300", Level.LEVEL0, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      let result: number = securityManager.getPasswordLastChangedTime(CURRENT_USER_ID);
      expect(result >= 0).assertTrue();
    } catch (error) {
      if (error.code === 9200016) {
        expect(error.code).assertEqual(9200016);
      } else if (error.code === 9200006) {
        expect(error.code).assertEqual(9200006);
      } else {
        expect(false).assertTrue();
      }
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_get_password_last_changed_time_0400
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_PASSWORD_LAST_CHANGED_TIME_JS_0400
   * @tc.desc   test getPasswordLastChangedTime with invalid accountId
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_password_last_changed_time_0400", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      securityManager.getPasswordLastChangedTime(INVALID_USER_ID);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code).assertEqual(9200006);
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_get_password_last_changed_time_0500
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_PASSWORD_LAST_CHANGED_TIME_JS_0500
   * @tc.desc   test getPasswordLastChangedTime with null accountId
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_password_last_changed_time_0500", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      securityManager.getPasswordLastChangedTime(null);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code).assertEqual(401);
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_get_password_last_changed_time_0600
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_PASSWORD_LAST_CHANGED_TIME_JS_0600
   * @tc.desc   test getPasswordLastChangedTime with undefined accountId
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_password_last_changed_time_0600", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      securityManager.getPasswordLastChangedTime(undefined);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code).assertEqual(401);
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_get_password_last_changed_time_0700
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_PASSWORD_LAST_CHANGED_TIME_JS_0700
   * @tc.desc   test getPasswordLastChangedTime with accountId 0
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_password_last_changed_time_0700", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      let result: number = securityManager.getPasswordLastChangedTime(ACCOUNT_ID_ZERO);
      expect(result >= 0).assertTrue();
    } catch (error) {
      if (error.code === 9200016) {
        expect(error.code).assertEqual(9200016);
      } else if (error.code === 9200006) {
        expect(error.code).assertEqual(9200006);
      } else {
        expect(false).assertTrue();
      }
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });
}

function testSetPermissionManagedState() {
  /**
   * @tc.name   test_setPermissionManagedState_0100
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_PERMISSION_MANAGED_STATE_JS_0100
   * @tc.desc   test setPermissionManagedState set manual_settings permission granted state
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it("test_setPermissionManagedState_0100", Level.LEVEL0, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      securityManager.setPermissionManagedState(SELFWANT, TEST_APP_INSTANCE, TEST_MANUAL_SETTINGS_PERMISSIONS, securityManager.PermissionManagedState.GRANTED);
      let managedState: securityManager.PermissionManagedState = securityManager.getPermissionManagedState(SELFWANT, TEST_APP_INSTANCE, TEST_MANUAL_SETTINGS_PERMISSIONS[0]);
      expect(false).assertTrue();
    } catch (error) {
      if (error.code === '9200012') {
        expect(error.code).assertEqual('9200012');
      } else if (error.code === '9200007') {
        expect(error.code).assertEqual('9200007');
      }
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });
}
