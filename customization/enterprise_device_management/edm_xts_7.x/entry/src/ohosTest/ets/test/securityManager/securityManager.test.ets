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
import { ENTINFO1, INVALID_WANT, SELFHAPNAME, SELFWANT, PIXEL_MAP, getPixelMap, getInvalidPixelMap, INVALID_PIXEL_MAP, WATERMARK_BUNDLE_NAME, DEFAULT_USER_ID } from '../commom.test.ets';

import adminManager from '@ohos.enterprise.adminManager';
import securityManager from '@ohos.enterprise.securityManager';

const VALID_PROPERTIES: securityManager.WatermarkProperties = {
  intervalsRow: 10,
  intervalsCol: 10
};

export default function securityManagerTest() {
  describe('securityManager_test', () => {
    testSetScreenWatermarkImage();
    testCancelScreenWatermarkImage();
    testSetWatermarkImageWithProperties();
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
      expect(Number(error.code) === 9200002).assertTrue();
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
      expect(Number(error.code) === 401).assertTrue();
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
      expect(Number(error.code) === 401).assertTrue();
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
      expect(Number(error.code) === 401).assertTrue();
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
      expect(Number(error.code) === 401).assertTrue();
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
      expect(Number(error.code) === 401).assertTrue();
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
      expect(Number(error.code) === 9200001).assertTrue();
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
      expect(Number(error.code) === 9200012).assertTrue();
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
      expect(Number(error.code) === 9200001).assertTrue();
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
      expect(Number(error.code) === 9200002).assertTrue();
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
      expect(Number(error.code) === 401).assertTrue();
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
      expect(Number(error.code) === 401).assertTrue();
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
      expect(Number(error.code) === 401).assertTrue();
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
    } catch (error) {
      expect(false).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });
}