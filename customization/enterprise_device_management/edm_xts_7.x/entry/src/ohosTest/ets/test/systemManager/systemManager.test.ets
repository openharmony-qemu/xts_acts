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
import { ENTINFO1, SELFWANT, SELFHAPNAME, INVALID_WANT, UPDATE_VERSION, INVALID_UPDATE_VERSION, DEFAULT_USER_ID, INVALID_USER_ID } from '../commom.test.ets';
import { BusinessError } from '@ohos.base';

import adminManager from '@ohos.enterprise.adminManager';
import systemManager from '@ohos.enterprise.systemManager';
import systemParameterEnhance from "@ohos.systemParameterEnhance";

export default function systemManagerTest() {
  describe('systemManager_test', () => {
    testSetOtaUpdateNonceEnable();
    testIsOtaUpdateNonceEnable();
  })
}

function testSetOtaUpdateNonceEnable() {
  /**
  * @tc.name   test_set_ota_update_nonce_enable_0100
  * @tc.number SUB_CUSTOMIZATION_EDM_SET_OTA_UPDATE_NONCE_ENABLE_JS_0100
  * @tc.desc   test systemManager SetOtaUpdateNonceEnable without admin
  * @tc.type   FUNCTION
  * @tc.size   MEDIUMTEST
  * @tc.level  LEVEL2
  */
  it("test_set_ota_update_nonce_enable_0100", Level.LEVEL2, async (done: Function) => {
    try {
      systemManager.setOtaUpdateNonceEnable(SELFWANT, true);
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
  * @tc.name   test_set_ota_update_nonce_enable_0200
  * @tc.number SUB_CUSTOMIZATION_EDM_SET_OTA_UPDATE_NONCE_ENABLE_JS_0200
  * @tc.desc   test systemManager SetOtaUpdateNonceEnable with byod admin
  * @tc.type   FUNCTION
  * @tc.size   MEDIUMTEST
  * @tc.level  LEVEL2
  */
  it("test_set_ota_update_nonce_enable_0200", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
    try {
      systemManager.setOtaUpdateNonceEnable(SELFWANT, true);
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
  * @tc.name   test_set_ota_update_nonce_enable_0300
  * @tc.number SUB_CUSTOMIZATION_EDM_SET_OTA_UPDATE_NONCE_ENABLE_JS_0300
  * @tc.desc   test systemManager SetOtaUpdateNonceEnable with invalid admin
  * @tc.type   FUNCTION
  * @tc.size   MEDIUMTEST
  * @tc.level  LEVEL2
  */
  it("test_set_ota_update_nonce_enable_0300", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      systemManager.setOtaUpdateNonceEnable(INVALID_WANT, true);
      expect(false).assertTrue();
    } catch (error) {
      if (error.code === 801) {
        expect(error.code === 801).assertTrue();
      } else {
        expect(error.code === 401).assertTrue();
      }
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
  * @tc.name   test_set_ota_update_nonce_enable_0400
  * @tc.number SUB_CUSTOMIZATION_EDM_SET_OTA_UPDATE_NONCE_ENABLE_JS_0400
  * @tc.desc   test systemManager SetOtaUpdateNonceEnable with null admin
  * @tc.type   FUNCTION
  * @tc.size   MEDIUMTEST
  * @tc.level  LEVEL2
  */
  it("test_set_ota_update_nonce_enable_0400", Level.LEVEL2, async (done: Function) => {
    try {
      systemManager.setOtaUpdateNonceEnable(null, true);
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
  * @tc.name   test_set_ota_update_nonce_enable_0500
  * @tc.number SUB_CUSTOMIZATION_EDM_SET_OTA_UPDATE_NONCE_ENABLE_JS_0500
  * @tc.desc   test systemManager setOtaUpdateNonceEnable with undefined admin
  * @tc.type   FUNCTION
  * @tc.size   MEDIUMTEST
  * @tc.level  LEVEL2
  */
  it("test_set_ota_update_nonce_enable_0500", Level.LEVEL2, async (done: Function) => {
    try {
      systemManager.setOtaUpdateNonceEnable(undefined, true);
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
  * @tc.name   test_set_ota_update_nonce_enable_0600
  * @tc.number SUB_CUSTOMIZATION_EDM_SET_OTA_UPDATE_NONCE_ENABLE_JS_0600
  * @tc.desc   test systemManager setOtaUpdateNonceEnable with null isEnable
  * @tc.type   FUNCTION
  * @tc.size   MEDIUMTEST
  * @tc.level  LEVEL2
  */
  it("test_set_ota_update_nonce_enable_0600", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      systemManager.setOtaUpdateNonceEnable(SELFWANT, null);
      expect(false).assertTrue();
    } catch (error) {
      if (error.code === 801) {
        expect(error.code === 801).assertTrue();
      } else {
        expect(error.code === 401).assertTrue();
      }
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
  * @tc.name   test_set_ota_update_nonce_enable_0700
  * @tc.number SUB_CUSTOMIZATION_EDM_SET_OTA_UPDATE_NONCE_ENABLE_JS_0700
  * @tc.desc   test systemManager setOtaUpdateNonceEnable with undefined isEnable
  * @tc.type   FUNCTION
  * @tc.size   MEDIUMTEST
  * @tc.level  LEVEL2
  */
  it("test_set_ota_update_nonce_enable_0700", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      systemManager.setOtaUpdateNonceEnable(SELFWANT, undefined);
      expect(false).assertTrue();
    } catch (error) {
      if (error.code === 801) {
        expect(error.code === 801).assertTrue();
      } else {
        expect(error.code === 401).assertTrue();
      }
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
  * @tc.name   test_set_ota_update_nonce_enable_0800
  * @tc.number SUB_CUSTOMIZATION_EDM_SET_OTA_UPDATE_NONCE_ENABLE_JS_0800
  * @tc.desc   test systemManager setOtaUpdateNonceEnable success with super admin
  * @tc.type   FUNCTION
  * @tc.size   MEDIUMTEST
  * @tc.level  LEVEL2
  */
  it("test_set_ota_update_nonce_enable_0800", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      systemManager.setOtaUpdateNonceEnable(SELFWANT, true);
      let result: boolean = systemManager.isOtaUpdateNonceEnable(SELFWANT);
      expect(result).assertTrue();

      systemManager.setOtaUpdateNonceEnable(SELFWANT, false);
      result = systemManager.isOtaUpdateNonceEnable(SELFWANT);
      expect(result).assertFalse();
    } catch (error) {
      expect(error.code === 801).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
  * @tc.name   test_set_ota_update_nonce_enable_0900
  * @tc.number SUB_CUSTOMIZATION_EDM_SET_OTA_UPDATE_NONCE_ENABLE_JS_0900
  * @tc.desc   test systemManager setOtaUpdateNonceEnable success with normal admin
  * @tc.type   FUNCTION
  * @tc.size   MEDIUMTEST
  * @tc.level  LEVEL2
  */
  it("test_set_ota_update_nonce_enable_0900", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
    try {
      systemManager.setOtaUpdateNonceEnable(SELFWANT, true);
      let result: boolean = systemManager.isOtaUpdateNonceEnable(SELFWANT);
      expect(result).assertTrue();

      systemManager.setOtaUpdateNonceEnable(SELFWANT, false);
      result = systemManager.isOtaUpdateNonceEnable(SELFWANT);
      expect(result).assertFalse();
    } catch (error) {
      expect(error.code === 801).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });
  }

function testIsOtaUpdateNonceEnable() {
  /**
  * @tc.name   test_is_ota_update_nonce_enable_0100
  * @tc.number SUB_CUSTOMIZATION_EDM_IS_OTA_UPDATE_NONCE_ENABLE_JS_0100
  * @tc.desc   test systemManager isOtaUpdateNonceEnable without admin
  * @tc.type   FUNCTION
  * @tc.size   MEDIUMTEST
  * @tc.level  LEVEL2
  */
  it("test_is_ota_update_nonce_enable_0100", Level.LEVEL2, async (done: Function) => {
    try {
      let result: boolean = systemManager.isOtaUpdateNonceEnable(SELFWANT);
      expect(result).assertFalse();
    } catch (error) {
      expect(error.code === 9200001).assertTrue();
    }
    done();
  });

  /**
  * @tc.name   test_is_ota_update_nonce_enable_0200
  * @tc.number SUB_CUSTOMIZATION_EDM_IS_OTA_UPDATE_NONCE_ENABLE_JS_0200
  * @tc.desc   test systemManager isOtaUpdateNonceEnable with byod admin
  * @tc.type   FUNCTION
  * @tc.size   MEDIUMTEST
  * @tc.level  LEVEL2
  */
  it("test_is_ota_update_nonce_enable_0200", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
    try {
      let result: boolean = systemManager.isOtaUpdateNonceEnable(SELFWANT);
      expect(result).assertFalse();
    } catch (error) {
      expect(error.code === 9200002).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
  * @tc.name   test_is_ota_update_nonce_enable_0300
  * @tc.number SUB_CUSTOMIZATION_EDM_IS_OTA_UPDATE_NONCE_ENABLE_JS_0300
  * @tc.desc   test systemManager isOtaUpdateNonceEnable with invalid admin
  * @tc.type   FUNCTION
  * @tc.size   MEDIUMTEST
  * @tc.level  LEVEL2
  */
  it("test_is_ota_update_nonce_enable_0300", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      let result: boolean = systemManager.isOtaUpdateNonceEnable(INVALID_WANT);
      expect(result).assertFalse();
    } catch (error) {
      expect(error.code === 401).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
  * @tc.name   test_is_ota_update_nonce_enable_0400
  * @tc.number SUB_CUSTOMIZATION_EDM_IS_OTA_UPDATE_NONCE_ENABLE_JS_0400
  * @tc.desc   test systemManager isOtaUpdateNonceEnable with null admin
  * @tc.type   FUNCTION
  * @tc.size   MEDIUMTEST
  * @tc.level  LEVEL2
  */
  it("test_is_ota_update_nonce_enable_0400", Level.LEVEL2, async (done: Function) => {
    try {
      let result: boolean = systemManager.isOtaUpdateNonceEnable(null);
      expect(result).assertFalse();
    } catch (error) {
      expect(error.code === 401).assertTrue();
    }
    done();
  });

  /**
  * @tc.name   test_is_ota_update_nonce_enable_0500
  * @tc.number SUB_CUSTOMIZATION_EDM_IS_OTA_UPDATE_NONCE_ENABLE_JS_0500
  * @tc.desc   test systemManager isOtaUpdateNonceEnable with undefined admin
  * @tc.type   FUNCTION
  * @tc.size   MEDIUMTEST
  * @tc.level  LEVEL2
  */
  it("test_is_ota_update_nonce_enable_0500", Level.LEVEL2, async (done: Function) => {
    try {
      let result: boolean = systemManager.isOtaUpdateNonceEnable(undefined);
      expect(result).assertFalse();
    } catch (error) {
      expect(error.code === 401).assertTrue();
    }
    done();
  });

  /**
  * @tc.name   test_is_ota_update_nonce_enable_0600
  * @tc.number SUB_CUSTOMIZATION_EDM_IS_OTA_UPDATE_NONCE_ENABLE_JS_0600
  * @tc.desc   test systemManager isOtaUpdateNonceEnable success with super admin
  * @tc.type   FUNCTION
  * @tc.size   MEDIUMTEST
  * @tc.level  LEVEL2
  */
  it("test_is_ota_update_nonce_enable_0600", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      let result: boolean = systemManager.isOtaUpdateNonceEnable(SELFWANT);
      expect(result).assertFalse();
    } catch (error) {
      expect(false).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
  * @tc.name   test_is_ota_update_nonce_enable_0700
  * @tc.number SUB_CUSTOMIZATION_EDM_IS_OTA_UPDATE_NONCE_ENABLE_JS_0700
  * @tc.desc   test systemManager isOtaUpdateNonceEnable success with normal admin
  * @tc.type   FUNCTION
  * @tc.size   MEDIUMTEST
  * @tc.level  LEVEL2
  */
  it("test_is_ota_update_nonce_enable_0700", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
    try {
      let result: boolean = systemManager.isOtaUpdateNonceEnable(SELFWANT);
      expect(result).assertFalse();
    } catch (error) {
      expect(false).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });
}