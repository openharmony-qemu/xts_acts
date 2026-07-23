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

import { describe, expect, it, beforeAll, Level } from '@ohos/hypium';
import { ENTINFO1, INVALID_WANT, SELFHAPNAME, SELFWANT, PIXEL_MAP, getPixelMap, getInvalidPixelMap, INVALID_PIXEL_MAP, WATERMARK_BUNDLE_NAME, DEFAULT_USER_ID,
  TEST_APP_INSTANCE, TEST_PERMISSION_1, CURRENT_USER_ID, DEFAULT_APP_INDEX, TEST_REAL_APP_ID_1, INVALID_USER_ID,
  INVALID_APP_INDEX, SYSTEM_CORE_PERMISSION_DOWNLOAD } from '../commom.test.ets';

import adminManager from '@ohos.enterprise.adminManager';
import securityManager from '@ohos.enterprise.securityManager';
import common from '@ohos.enterprise.common';

const VALID_PROPERTIES: securityManager.WatermarkProperties = {
  intervalsRow: 10,
  intervalsCol: 10
};

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
      expect(error.code === 9200002).assertTrue();
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
      expect(error.code === 401).assertTrue();
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
      expect(error.code === 401).assertTrue();
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
      expect(error.code === 401).assertTrue();
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
      expect(error.code === 401).assertTrue();
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
      expect(error.code === 401).assertTrue();
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
      expect(ret == null).assertTrue();
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
      expect(error.code === 9200001).assertTrue();
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
      expect(error.code === 9200012).assertTrue();
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
      expect(error.code === 9200001).assertTrue();
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
      expect(error.code === 9200002).assertTrue();
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
      expect(error.code === 401).assertTrue();
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
      expect(error.code === 401).assertTrue();
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
      expect(error.code === 401).assertTrue();
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
      expect(ret == null).assertTrue();
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
      expect(error.code === 9200001).assertTrue();
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
      expect(error.code === 9200002).assertTrue();
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
      expect(error.code === 401).assertTrue();
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
      expect(error.code === 401).assertTrue();
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
      expect(error.code === 401).assertTrue();
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
      expect(error.code === 401).assertTrue();
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
      expect(error.code === 401).assertTrue();
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
      expect(error.code === 9200012).assertTrue();
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
      expect(error.code === 401).assertTrue();
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
      expect(error.code === 401).assertTrue();
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
      expect(error.code === 401).assertTrue();
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
      expect(error.code === 401).assertTrue();
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
      expect(error.code === 401).assertTrue();
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
      expect(error.code === 9200012).assertTrue();
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
      expect(error.code === 401).assertTrue();
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
      expect(error.code === 401).assertTrue();
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
      expect(error.code === 9200012).assertTrue();
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
      expect(error.code === 9200012).assertTrue();
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
      expect(error.code === 9200012).assertTrue();
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
      expect(error.code === 9200012).assertTrue();
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
      let ret = securityManager.setWatermarkImage(SELFWANT, WATERMARK_BUNDLE_NAME, PIXEL_MAP, DEFAULT_USER_ID, VALID_PROPERTIES);
      expect(ret == null).assertTrue();
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
      expect(error.code === 9200012).assertTrue();
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
      expect(ret == null).assertTrue();
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
      expect(error.code === 9200001).assertTrue();
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
      expect(error.code === 9200002).assertTrue();
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
      expect(error.code === 401).assertTrue();
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
      expect(error.code === 401).assertTrue();
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
      expect(error.code === 401).assertTrue();
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
      expect(error.code === 401).assertTrue();
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
      expect(error.code === 401).assertTrue();
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
      expect(error.code === 9200012).assertTrue();
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
      expect(error.code === 401).assertTrue();
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
      expect(error.code === 401).assertTrue();
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
      expect(error.code === 401).assertTrue();
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
      expect(error.code === 401).assertTrue();
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
      expect(error.code === 9200012).assertTrue();
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
      expect(error.code === 9200012).assertTrue();
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
      expect(error.code === 9200012).assertTrue();
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
      expect(error.code === 9200001).assertTrue();
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
      expect(error.code === 9200002).assertTrue();
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
      expect(error.code === 401).assertTrue();
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
      expect(error.code === 401).assertTrue();
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
      expect(error.code === 401).assertTrue();
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
      expect(error.code === 401).assertTrue();
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
      expect(error.code === 9200012).assertTrue();
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
      expect(error.code === 9200012).assertTrue();
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
      expect(error.code === 9200001).assertTrue();
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
      expect(error.code === 9200002).assertTrue();
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
      expect(error.code === 401).assertTrue();
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
      expect(error.code === 401).assertTrue();
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
      expect(error.code === 401).assertTrue();
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
      expect(error.code === 401).assertTrue();
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
      expect(error.code === 401).assertTrue();
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
      expect(error.code === 9200012).assertTrue();
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
      expect(error.code === 401).assertTrue();
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
      expect(error.code === 401).assertTrue();
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
      expect(error.code === 401).assertTrue();
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
      expect(error.code === 401).assertTrue();
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
      expect(error.code === 401).assertTrue();
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
      expect(error.code === 9200012).assertTrue();
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
      expect(error.code === 9200012).assertTrue();
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
      expect(error.code === 9200001).assertTrue();
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
      expect(error.code === 9200002).assertTrue();
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
      expect(error.code === 401).assertTrue();
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
      expect(error.code === 401).assertTrue();
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
      expect(error.code === 401).assertTrue();
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
      expect(error.code === 401).assertTrue();
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
      expect(error.code === 401).assertTrue();
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
      expect(error.code === 9200012).assertTrue();
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
      expect(error.code === 401).assertTrue();
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
      expect(error.code === 401).assertTrue();
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
      expect(error.code === 401).assertTrue();
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
      expect(error.code === 9200001).assertTrue();
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
      expect(error.code === 9200002).assertTrue();
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
      expect(error.code === 9200001).assertTrue();
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
      expect(error.code === 401).assertTrue();
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
      expect(error.code === 401).assertTrue();
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
      expect(error.code === 401).assertTrue();
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
      expect(error.code === 401).assertTrue();
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
      expect(error.code === 9200012).assertTrue();
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
      expect(error.code === 401).assertTrue();
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
      expect(error.code === 401).assertTrue();
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
      expect(error.code === 9200001).assertTrue();
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
      expect(error.code === 9200002).assertTrue();
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
      expect(error.code === 401).assertTrue();
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
      expect(error.code === 401).assertTrue();
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
      expect(error.code === 401).assertTrue();
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
      expect(error.code === 401).assertTrue();
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
      expect(error.code === 401).assertTrue();
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
      expect(error.code === 9200012).assertTrue();
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
      expect(error.code === 9200012).assertTrue();
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