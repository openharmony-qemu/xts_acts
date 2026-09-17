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
import { ENTINFO1, SELFWANT, SELFHAPNAME, INVALID_WANT, UPDATE_VERSION, INVALID_UPDATE_VERSION, DEFAULT_USER_ID, INVALID_USER_ID,
  IP_LIST_1, IP_LIST_2, IP_LIST_SINGLE, IP_LIST_OVER_MAX, ipListOverMaxInit, INVALID_IP_LIST,
  IPV6_LIST_1, IPV6_LIST_SINGLE, INVALID_IPV6_LIST, IP_LIST_MAX_100, IP_LIST_ONE_EXTRA } from '../commom.test.ets';
import { BusinessError } from '@ohos.base';

import adminManager from '@ohos.enterprise.adminManager';
import systemManager from '@ohos.enterprise.systemManager';
import systemParameterEnhance from "@ohos.systemParameterEnhance";

export default function systemManagerTest() {
  describe('systemManager_test', () => {
    testSetOtaUpdateNonceEnable();
    testIsOtaUpdateNonceEnable();
    testSetLocalHotaDomain();
    testGetLocalHotaDomain();
    ipListOverMaxInit();
    testAddAllowedPrinterIPAddressesForDevice();
    testRemoveAllowedPrinterIPAddressesForDevice();
    testGetAllowedPrinterIPAddressesForDevice();
    testAddAllowedPrinterIPAddressesForAccount();
    testRemoveAllowedPrinterIPAddressesForAccount();
    testGetAllowedPrinterIPAddressesForAccount();
    testPrinterIpConflict();
    testCreateExactTimer();
    testStartExactTimer();
    testStopExactTimer();
    testDestroyExactTimer();
  })
}

const TEST_HOTA_DOMAIN: string = "https://www.hota.com";
const TEST_HOTA_DOMAIN_EMPTY: string = "";

function testSetLocalHotaDomain() {
  /**
  * @tc.name   test_set_local_hota_domain_0100
  * @tc.number SUB_CUSTOMIZATION_EDM_SET_LOCAL_HOTA_DOMAIN_JS_0100
  * @tc.desc   test systemManager setLocalHotaDomain without admin
  * @tc.type   FUNCTION
  * @tc.size   MEDIUMTEST
  * @tc.level  LEVEL2
  */
  it("test_set_local_hota_domain_0100", Level.LEVEL2, async (done: Function) => {
    try {
      systemManager.setLocalHotaDomain(SELFWANT, TEST_HOTA_DOMAIN);
      expect(false).assertTrue();
    } catch (error) {
      if (error.code === 801) {
        expect(error.code === 801).assertTrue();
      } else if (error.code === 9200018) {
        expect(error.code === 9200018).assertTrue();
      } else {
        expect(error.code === 9200001).assertTrue();
      }
    }
    done();
  });

  /**
  * @tc.name   test_set_local_hota_domain_0200
  * @tc.number SUB_CUSTOMIZATION_EDM_SET_LOCAL_HOTA_DOMAIN_JS_0200
  * @tc.desc   test systemManager setLocalHotaDomain with byod admin
  * @tc.type   FUNCTION
  * @tc.size   MEDIUMTEST
  * @tc.level  LEVEL2
  */
  it("test_set_local_hota_domain_0200", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
    try {
      systemManager.setLocalHotaDomain(SELFWANT, TEST_HOTA_DOMAIN);
      expect(false).assertTrue();
    } catch (error) {
      if (error.code === 801) {
        expect(error.code === 801).assertTrue();
      } else if (error.code === 9200018) {
        expect(error.code === 9200018).assertTrue();
      } else {
        expect(error.code === 9200002).assertTrue();
      }
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
  * @tc.name   test_set_local_hota_domain_0300
  * @tc.number SUB_CUSTOMIZATION_EDM_SET_LOCAL_HOTA_DOMAIN_JS_0300
  * @tc.desc   test systemManager setLocalHotaDomain with invalid admin
  * @tc.type   FUNCTION
  * @tc.size   MEDIUMTEST
  * @tc.level  LEVEL2
  */
  it("test_set_local_hota_domain_0300", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      systemManager.setLocalHotaDomain(INVALID_WANT, TEST_HOTA_DOMAIN);
      expect(false).assertTrue();
    } catch (error) {
      if (error.code === 801) {
        expect(error.code === 801).assertTrue();
      } else if (error.code === 9200018) {
        expect(error.code === 9200018).assertTrue();
      } else {
        expect(error.code === 401).assertTrue();
      }
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
  * @tc.name   test_set_local_hota_domain_0400
  * @tc.number SUB_CUSTOMIZATION_EDM_SET_LOCAL_HOTA_DOMAIN_JS_0400
  * @tc.desc   test systemManager setLocalHotaDomain with null admin
  * @tc.type   FUNCTION
  * @tc.size   MEDIUMTEST
  * @tc.level  LEVEL2
  */
  it("test_set_local_hota_domain_0400", Level.LEVEL2, async (done: Function) => {
    try {
      systemManager.setLocalHotaDomain(null, TEST_HOTA_DOMAIN);
      expect(false).assertTrue();
    } catch (error) {
      if (error.code === 801) {
        expect(error.code === 801).assertTrue();
      } else if (error.code === 9200018) {
        expect(error.code === 9200018).assertTrue();
      } else {
        expect(error.code === 401).assertTrue();
      }
    }
    done();
  });

  /**
  * @tc.name   test_set_local_hota_domain_0500
  * @tc.number SUB_CUSTOMIZATION_EDM_SET_LOCAL_HOTA_DOMAIN_JS_0500
  * @tc.desc   test systemManager setLocalHotaDomain with undefined admin
  * @tc.type   FUNCTION
  * @tc.size   MEDIUMTEST
  * @tc.level  LEVEL2
  */
  it("test_set_local_hota_domain_0500", Level.LEVEL2, async (done: Function) => {
    try {
      systemManager.setLocalHotaDomain(undefined, TEST_HOTA_DOMAIN);
      expect(false).assertTrue();
    } catch (error) {
      if (error.code === 801) {
        expect(error.code === 801).assertTrue();
      } else if (error.code === 9200018) {
        expect(error.code === 9200018).assertTrue();
      } else {
        expect(error.code === 401).assertTrue();
      }
    }
    done();
  });

  /**
  * @tc.name   test_set_local_hota_domain_0600
  * @tc.number SUB_CUSTOMIZATION_EDM_SET_LOCAL_HOTA_DOMAIN_JS_0600
  * @tc.desc   test systemManager setLocalHotaDomain with null domain
  * @tc.type   FUNCTION
  * @tc.size   MEDIUMTEST
  * @tc.level  LEVEL2
  */
  it("test_set_local_hota_domain_0600", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      systemManager.setLocalHotaDomain(SELFWANT, null);
      expect(false).assertTrue();
    } catch (error) {
      if (error.code === 801) {
        expect(error.code === 801).assertTrue();
      } else if (error.code === 9200018) {
        expect(error.code === 9200018).assertTrue();
      } else {
        expect(error.code === 401).assertTrue();
      }
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
  * @tc.name   test_set_local_hota_domain_0700
  * @tc.number SUB_CUSTOMIZATION_EDM_SET_LOCAL_HOTA_DOMAIN_JS_0700
  * @tc.desc   test systemManager setLocalHotaDomain with undefined domain
  * @tc.type   FUNCTION
  * @tc.size   MEDIUMTEST
  * @tc.level  LEVEL2
  */
  it("test_set_local_hota_domain_0700", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      systemManager.setLocalHotaDomain(SELFWANT, undefined);
      expect(false).assertTrue();
    } catch (error) {
      if (error.code === 801) {
        expect(error.code === 801).assertTrue();
      } else if (error.code === 9200018) {
        expect(error.code === 9200018).assertTrue();
      } else {
        expect(error.code === 401).assertTrue();
      }
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
  * @tc.name   test_set_local_hota_domain_0800
  * @tc.number SUB_CUSTOMIZATION_EDM_SET_LOCAL_HOTA_DOMAIN_JS_0800
  * @tc.desc   test systemManager setLocalHotaDomain success with super admin
  * @tc.type   FUNCTION
  * @tc.size   MEDIUMTEST
  * @tc.level  LEVEL2
  */
  it("test_set_local_hota_domain_0800", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      systemManager.setLocalHotaDomain(SELFWANT, TEST_HOTA_DOMAIN);
    } catch (error) {
      if (error.code === 801) {
        expect(error.code === 801).assertTrue();
      } else if (error.code === 9200018) {
        expect(error.code === 9200018).assertTrue();
      } else {
        expect(false).assertTrue();
      }
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
  * @tc.name   test_set_local_hota_domain_900
  * @tc.number SUB_CUSTOMIZATION_EDM_SET_LOCAL_HOTA_DOMAIN_JS_900
  * @tc.desc   test systemManager setLocalHotaDomain with ip
  * @tc.type   FUNCTION
  * @tc.size   MEDIUMTEST
  * @tc.level  LEVEL2
  */
  it("test_set_local_hota_domain_900", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
    try {
      const hotaDomain: string = "123.456.789";
      systemManager.setLocalHotaDomain(SELFWANT, hotaDomain);
      expect(false).assertTrue();
    } catch (error) {
      if (error.code === 801) {
        expect(error.code === 801).assertTrue();
      } else if (error.code === 9200018) {
        expect(error.code === 9200018).assertTrue();
      } else {
        expect(error.code === 9200012).assertTrue();
      }
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
  * @tc.name   test_set_local_hota_domain_1000
  * @tc.number SUB_CUSTOMIZATION_EDM_SET_LOCAL_HOTA_DOMAIN_JS_1000
  * @tc.desc   test systemManager setLocalHotaDomain with localhost
  * @tc.type   FUNCTION
  * @tc.size   MEDIUMTEST
  * @tc.level  LEVEL2
  */
  it("test_set_local_hota_domain_1000", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
    try {
      const hotaDomain: string = "https://localhost:8080";
      systemManager.setLocalHotaDomain(SELFWANT, hotaDomain);
      expect(false).assertTrue();
    } catch (error) {
      if (error.code === 801) {
        expect(error.code === 801).assertTrue();
      } else if (error.code === 9200018) {
        expect(error.code === 9200018).assertTrue();
      } else {
        expect(error.code === 9200012).assertTrue();
      }
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
  * @tc.name   test_set_local_hota_domain_1100
  * @tc.number SUB_CUSTOMIZATION_EDM_SET_LOCAL_HOTA_DOMAIN_JS_1100
  * @tc.desc   test systemManager setLocalHotaDomain with too long domain
  * @tc.type   FUNCTION
  * @tc.size   MEDIUMTEST
  * @tc.level  LEVEL2
  */
  it("test_set_local_hota_domain_1100", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
    try {
      const hotaDomain: string = "https://www.abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyz.com";
      systemManager.setLocalHotaDomain(SELFWANT, hotaDomain);
      expect(false).assertTrue();
    } catch (error) {
      if (error.code === 801) {
        expect(error.code === 801).assertTrue();
      } else if (error.code === 9200018) {
        expect(error.code === 9200018).assertTrue();
      } else {
        expect(error.code === 9200012).assertTrue();
      }
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
  * @tc.name   test_set_local_hota_domain_1200
  * @tc.number SUB_CUSTOMIZATION_EDM_SET_LOCAL_HOTA_DOMAIN_JS_1200
  * @tc.desc   test systemManager setLocalHotaDomain with wrong domain
  * @tc.type   FUNCTION
  * @tc.size   MEDIUMTEST
  * @tc.level  LEVEL2
  */
  it("test_set_local_hota_domain_1200", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
    try {
      const hotaDomain: string = "https://www.-example-.com";
      systemManager.setLocalHotaDomain(SELFWANT, hotaDomain);
      expect(false).assertTrue();
    } catch (error) {
      if (error.code === 801) {
        expect(error.code === 801).assertTrue();
      } else if (error.code === 9200018) {
        expect(error.code === 9200018).assertTrue();
      } else {
        expect(error.code === 9200012).assertTrue();
      }
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
  * @tc.name   test_set_local_hota_domain_1300
  * @tc.number SUB_CUSTOMIZATION_EDM_SET_LOCAL_HOTA_DOMAIN_JS_1300
  * @tc.desc   test systemManager setLocalHotaDomain with wrong domain
  * @tc.type   FUNCTION
  * @tc.size   MEDIUMTEST
  * @tc.level  LEVEL2
  */
  it("test_set_local_hota_domain_1300", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
    try {
      const hotaDomain: string = "https://127.0.0.1:8080";
      systemManager.setLocalHotaDomain(SELFWANT, hotaDomain);
      expect(false).assertTrue();
    } catch (error) {
      if (error.code === 801) {
        expect(error.code === 801).assertTrue();
      } else if (error.code === 9200018) {
        expect(error.code === 9200018).assertTrue();
      } else {
        expect(error.code === 9200012).assertTrue();
      }
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
  * @tc.name   test_set_local_hota_domain_1400
  * @tc.number SUB_CUSTOMIZATION_EDM_SET_LOCAL_HOTA_DOMAIN_JS_1400
  * @tc.desc   test systemManager setLocalHotaDomain with wrong domain
  * @tc.type   FUNCTION
  * @tc.size   MEDIUMTEST
  * @tc.level  LEVEL2
  */
  it("test_set_local_hota_domain_1400", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
    try {
      const hotaDomain: string = "www.hotatest.com";
      systemManager.setLocalHotaDomain(SELFWANT, hotaDomain);
      expect(false).assertTrue();
    } catch (error) {
      if (error.code === 801) {
        expect(error.code === 801).assertTrue();
      } else if (error.code === 9200018) {
        expect(error.code === 9200018).assertTrue();
      } else {
        expect(error.code === 9200012).assertTrue();
      }
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
  * @tc.name   test_set_local_hota_domain_1500
  * @tc.number SUB_CUSTOMIZATION_EDM_SET_LOCAL_HOTA_DOMAIN_JS_1500
  * @tc.desc   test systemManager setLocalHotaDomain with empty domain
  * @tc.type   FUNCTION
  * @tc.size   MEDIUMTEST
  * @tc.level  LEVEL2
  */
  it("test_set_local_hota_domain_1500", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
    try {
      systemManager.setLocalHotaDomain(SELFWANT, TEST_HOTA_DOMAIN);
      let result: string = systemManager.getLocalHotaDomain(SELFWANT);
      expect(result === TEST_HOTA_DOMAIN).assertTrue();
      systemManager.setLocalHotaDomain(SELFWANT, TEST_HOTA_DOMAIN_EMPTY);
      result = systemManager.getLocalHotaDomain(SELFWANT);
      expect(result.length === 0).assertTrue();
    } catch (error) {
      if (error.code === 801) {
        expect(error.code === 801).assertTrue();
      } else if (error.code === 9200018) {
        expect(error.code === 9200018).assertTrue();
      } else {
        expect(error.code === 9200012).assertTrue();
      }
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });
}

function testGetLocalHotaDomain() {
  /**
  * @tc.name   test_get_local_hota_domain_0100
  * @tc.number SUB_CUSTOMIZATION_EDM_GET_LOCAL_HOTA_DOMAIN_JS_0100
  * @tc.desc   test systemManager getLocalHotaDomain without admin
  * @tc.type   FUNCTION
  * @tc.size   MEDIUMTEST
  * @tc.level  LEVEL2
  */
  it("test_get_local_hota_domain_0100", Level.LEVEL2, async (done: Function) => {
    try {
      let result: string = systemManager.getLocalHotaDomain(SELFWANT);
      expect(result.length === 0).assertTrue();
    } catch (error) {
      if (error.code === 9200018) {
        expect(error.code === 9200018).assertTrue();
      } else {
        expect(error.code === 9200001).assertTrue();
      }
    }
    done();
  });

  /**
  * @tc.name   test_get_local_hota_domain_0200
  * @tc.number SUB_CUSTOMIZATION_EDM_GET_LOCAL_HOTA_DOMAIN_JS_0200
  * @tc.desc   test systemManager getLocalHotaDomain with byod admin
  * @tc.type   FUNCTION
  * @tc.size   MEDIUMTEST
  * @tc.level  LEVEL2
  */
  it("test_get_local_hota_domain_0200", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
    try {
      let result: string = systemManager.getLocalHotaDomain(SELFWANT);
      expect(result.length === 0).assertTrue();
    } catch (error) {
      if (error.code === 9200018) {
        expect(error.code === 9200018).assertTrue();
      } else {
        expect(error.code === 9200002).assertTrue();
      }
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
  * @tc.name   test_get_local_hota_domain_0300
  * @tc.number SUB_CUSTOMIZATION_EDM_GET_LOCAL_HOTA_DOMAIN_JS_0300
  * @tc.desc   test systemManager getLocalHotaDomain with invalid admin
  * @tc.type   FUNCTION
  * @tc.size   MEDIUMTEST
  * @tc.level  LEVEL2
  */
  it("test_get_local_hota_domain_0300", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      let result: string = systemManager.getLocalHotaDomain(INVALID_WANT);
      expect(result.length === 0).assertTrue();
    } catch (error) {
      if (error.code === 9200018) {
        expect(error.code === 9200018).assertTrue();
      } else {
        expect(error.code === 401).assertTrue();
      }
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
  * @tc.name   test_get_local_hota_domain_0400
  * @tc.number SUB_CUSTOMIZATION_EDM_GET_LOCAL_HOTA_DOMAIN_JS_0400
  * @tc.desc   test systemManager getLocalHotaDomain with null admin
  * @tc.type   FUNCTION
  * @tc.size   MEDIUMTEST
  * @tc.level  LEVEL2
  */
  it("test_get_local_hota_domain_0400", Level.LEVEL2, async (done: Function) => {
    try {
      let result: string = systemManager.getLocalHotaDomain(null);
      expect(result.length === 0).assertTrue();
    } catch (error) {
      if (error.code === 9200018) {
        expect(error.code === 9200018).assertTrue();
      } else {
        expect(error.code === 401).assertTrue();
      }
    }
    done();
  });

  /**
  * @tc.name   test_get_local_hota_domain_0500
  * @tc.number SUB_CUSTOMIZATION_EDM_GET_LOCAL_HOTA_DOMAIN_JS_0500
  * @tc.desc   test systemManager getLocalHotaDomain with undefined admin
  * @tc.type   FUNCTION
  * @tc.size   MEDIUMTEST
  * @tc.level  LEVEL2
  */
  it("test_get_local_hota_domain_0500", Level.LEVEL2, async (done: Function) => {
    try {
      let result: string = systemManager.getLocalHotaDomain(undefined);
      expect(result.length === 0).assertTrue();
    } catch (error) {
      if (error.code === 9200018) {
        expect(error.code === 9200018).assertTrue();
      } else {
        expect(error.code === 401).assertTrue();
      }
    }
    done();
  });

  /**
  * @tc.name   test_get_local_hota_domain_0600
  * @tc.number SUB_CUSTOMIZATION_EDM_GET_LOCAL_HOTA_DOMAIN_JS_0600
  * @tc.desc   test systemManager getLocalHotaDomain success with super admin
  * @tc.type   FUNCTION
  * @tc.size   MEDIUMTEST
  * @tc.level  LEVEL2
  */
  it("test_get_local_hota_domain_0600", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      systemManager.setLocalHotaDomain(SELFWANT, TEST_HOTA_DOMAIN);
      let result: string = systemManager.getLocalHotaDomain(SELFWANT);
      if (result.length === 0) {
        expect(result.length === 0).assertTrue();
      } else {
        expect(result === TEST_HOTA_DOMAIN).assertTrue();
      }
      expect(result == TEST_HOTA_DOMAIN).assertTrue();
    } catch (error) {
      if (error.code === 801) {
        expect(error.code === 801).assertTrue();
      } else if (error.code === 9200018) {
        expect(error.code === 9200018).assertTrue();
      } else {
        expect(false).assertTrue();
      }
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });
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

function testAddAllowedPrinterIPAddressesForDevice() {
  /**
  * @tc.name   test_add_allowed_printer_ip_for_device_0100
  * @tc.number SUB_CUSTOMIZATION_EDM_ADD_ALLOWED_PRINTER_IP_ADDRESSES_FOR_DEVICE_JS_0100
  * @tc.desc   test addAllowedPrinterIPAddressesForDevice with null ipList
  * @tc.type   FUNCTION
  * @tc.size   MEDIUMTEST
  * @tc.level  LEVEL2
  */
  it("test_add_allowed_printer_ip_for_device_0100", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      systemManager.addAllowedPrinterIPAddressesForDevice(null);
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
  * @tc.name   test_add_allowed_printer_ip_for_device_0101
  * @tc.number SUB_CUSTOMIZATION_EDM_ADD_ALLOWED_PRINTER_IP_ADDRESSES_FOR_DEVICE_JS_0101
  * @tc.desc   test addAllowedPrinterIPAddressesForDevice without admin
  * @tc.type   FUNCTION
  * @tc.size   MEDIUMTEST
  * @tc.level  LEVEL2
  */
  it("test_add_allowed_printer_ip_for_device_0101", Level.LEVEL2, async (done: Function) => {
    try {
      systemManager.addAllowedPrinterIPAddressesForDevice(IP_LIST_1);
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
  * @tc.name   test_add_allowed_printer_ip_for_device_0102
  * @tc.number SUB_CUSTOMIZATION_EDM_ADD_ALLOWED_PRINTER_IP_ADDRESSES_FOR_DEVICE_JS_0102
  * @tc.desc   test addAllowedPrinterIPAddressesForDevice with byod admin
  * @tc.type   FUNCTION
  * @tc.size   MEDIUMTEST
  * @tc.level  LEVEL2
  */
  it("test_add_allowed_printer_ip_for_device_0102", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
    try {
      systemManager.addAllowedPrinterIPAddressesForDevice(IP_LIST_1);
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
  * @tc.name   test_add_allowed_printer_ip_for_device_0103
  * @tc.number SUB_CUSTOMIZATION_EDM_ADD_ALLOWED_PRINTER_IP_ADDRESSES_FOR_DEVICE_JS_0103
  * @tc.desc   test addAllowedPrinterIPAddressesForDevice with invalid IP format
  * @tc.type   FUNCTION
  * @tc.size   MEDIUMTEST
  * @tc.level  LEVEL2
  */
  it("test_add_allowed_printer_ip_for_device_0103", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      systemManager.addAllowedPrinterIPAddressesForDevice(["999.999.999.999"]);
      expect(false).assertTrue();
    } catch (error) {
      if (error.code === 801) {
        expect(error.code === 801).assertTrue();
      } else {
        expect(error.code === 9200012).assertTrue();
      }
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
  * @tc.name   test_add_allowed_printer_ip_for_device_0104
  * @tc.number SUB_CUSTOMIZATION_EDM_ADD_ALLOWED_PRINTER_IP_ADDRESSES_FOR_DEVICE_JS_0104
  * @tc.desc   test addAllowedPrinterIPAddressesForDevice with various invalid IP formats
  * @tc.type   FUNCTION
  * @tc.size   MEDIUMTEST
  * @tc.level  LEVEL2
  */
  it("test_add_allowed_printer_ip_for_device_0104", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      for (const invalidIp of INVALID_IP_LIST) {
        try {
          systemManager.addAllowedPrinterIPAddressesForDevice([invalidIp]);
          expect(false).assertTrue();
        } catch (error) {
          if (error.code === 801) {
            expect(error.code === 801).assertTrue();
          } else {
            expect(error.code === 9200012).assertTrue();
          }
        }
      }
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
  * @tc.name   test_add_allowed_printer_ip_for_device_0200
  * @tc.number SUB_CUSTOMIZATION_EDM_ADD_ALLOWED_PRINTER_IP_ADDRESSES_FOR_DEVICE_JS_0200
  * @tc.desc   test addAllowedPrinterIPAddressesForDevice success
  * @tc.type   FUNCTION
  * @tc.size   MEDIUMTEST
  * @tc.level  LEVEL2
  */
  it("test_add_allowed_printer_ip_for_device_0200", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      systemManager.addAllowedPrinterIPAddressesForDevice(IP_LIST_1);
      let result: Array<string> = systemManager.getAllowedPrinterIPAddressesForDevice();
      expect(result.length).assertEqual(2);
    } catch (error) {
      expect(error.code === 801).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
  * @tc.name   test_add_allowed_printer_ip_for_device_0300
  * @tc.number SUB_CUSTOMIZATION_EDM_ADD_ALLOWED_PRINTER_IP_ADDRESSES_FOR_DEVICE_JS_0300
  * @tc.desc   test addAllowedPrinterIPAddressesForDevice merge policy
  * @tc.type   FUNCTION
  * @tc.size   MEDIUMTEST
  * @tc.level  LEVEL2
  */
  it("test_add_allowed_printer_ip_for_device_0300", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      systemManager.addAllowedPrinterIPAddressesForDevice(IP_LIST_1);
      systemManager.addAllowedPrinterIPAddressesForDevice(IP_LIST_2);
      let result: Array<string> = systemManager.getAllowedPrinterIPAddressesForDevice();
      expect(result.length).assertEqual(3);
    } catch (error) {
      expect(error.code === 801).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
  * @tc.name   test_add_allowed_printer_ip_for_device_0400
  * @tc.number SUB_CUSTOMIZATION_EDM_ADD_ALLOWED_PRINTER_IP_ADDRESSES_FOR_DEVICE_JS_0400
  * @tc.desc   test addAllowedPrinterIPAddressesForDevice exceed max size
  * @tc.type   FUNCTION
  * @tc.size   MEDIUMTEST
  * @tc.level  LEVEL2
  */
  it("test_add_allowed_printer_ip_for_device_0400", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      systemManager.addAllowedPrinterIPAddressesForDevice(IP_LIST_OVER_MAX);
      expect(false).assertTrue();
    } catch (error) {
      if (error.code === 801) {
        expect(error.code === 801).assertTrue();
      } else {
        expect(error.code === 9200019).assertTrue();
      }
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
  * @tc.name   test_add_allowed_printer_ip_for_device_0500
  * @tc.number SUB_CUSTOMIZATION_EDM_ADD_ALLOWED_PRINTER_IP_ADDRESSES_FOR_DEVICE_JS_0500
  * @tc.desc   test addAllowedPrinterIPAddressesForDevice with valid full IPv6 addresses
  * @tc.type   FUNCTION
  * @tc.size   MEDIUMTEST
  * @tc.level  LEVEL2
  */
  it("test_add_allowed_printer_ip_for_device_0500", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      systemManager.addAllowedPrinterIPAddressesForDevice(IPV6_LIST_1);
      let result: Array<string> = systemManager.getAllowedPrinterIPAddressesForDevice();
      expect(result.length).assertEqual(2);
    } catch (error) {
      expect(error.code === 801).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
  * @tc.name   test_add_allowed_printer_ip_for_device_0501
  * @tc.number SUB_CUSTOMIZATION_EDM_ADD_ALLOWED_PRINTER_IP_ADDRESSES_FOR_DEVICE_JS_0501
  * @tc.desc   test addAllowedPrinterIPAddressesForDevice with abbreviated IPv6 addresses (should fail)
  * @tc.type   FUNCTION
  * @tc.size   MEDIUMTEST
  * @tc.level  LEVEL2
  */
  it("test_add_allowed_printer_ip_for_device_0501", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      for (const invalidIpv6 of INVALID_IPV6_LIST) {
        try {
          systemManager.addAllowedPrinterIPAddressesForDevice([invalidIpv6]);
          expect(false).assertTrue();
        } catch (error) {
          if (error.code === 801) {
            expect(error.code === 801).assertTrue();
          } else {
            expect(error.code === 9200012).assertTrue();
          }
        }
      }
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**                                                                                                                                                                                                                              
  * @tc.name   test_add_allowed_printer_ip_for_device_0502                                                                                                                                                                         
  * @tc.number SUB_CUSTOMIZATION_EDM_ADD_ALLOWED_PRINTER_IP_ADDRESSES_FOR_DEVICE_JS_0502                                                                                                                                           
  * @tc.desc   test add 100 valid IPs then add one more should fail with 9200019                                                                                                                                                   
  * @tc.type   FUNCTION                                                                                                                                                                                                            
  * @tc.size   MEDIUMTEST                                                                                                                                                                                                          
  * @tc.level  LEVEL2                                                                                                                                                                                                              
  */                                                                                                                                                                                                                               
  it("test_add_allowed_printer_ip_for_device_0502", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      systemManager.addAllowedPrinterIPAddressesForDevice(IP_LIST_MAX_100);
      let result: Array<string> = systemManager.getAllowedPrinterIPAddressesForDevice();
      console.info('test_add_for_account_0502: after add 100, result.length=' + result.length); 
      expect(result.length).assertEqual(100);
      try {
        systemManager.addAllowedPrinterIPAddressesForDevice(IP_LIST_ONE_EXTRA);
        console.info('test_add_for_account_0502: second add did not throw, unexpected'); 
        expect(false).assertTrue();
      } catch (error) {
        if (error.code === 801) {
          expect(error.code === 801).assertTrue();
        } else {
          expect(error.code === 9200019).assertTrue();
        }
      }
    } catch (error) {
    console.info('test_add_for_account_0502: outer catch error code=' + error.code);  
      expect(error.code === 801).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  }); 
}

function testRemoveAllowedPrinterIPAddressesForDevice() {
  /**
  * @tc.name   test_remove_allowed_printer_ip_for_device_0100
  * @tc.number SUB_CUSTOMIZATION_EDM_REMOVE_ALLOWED_PRINTER_IP_ADDRESSES_FOR_DEVICE_JS_0100
  * @tc.desc   test removeAllowedPrinterIPAddressesForDevice with null ipList
  * @tc.type   FUNCTION
  * @tc.size   MEDIUMTEST
  * @tc.level  LEVEL2
  */
  it("test_remove_allowed_printer_ip_for_device_0100", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      systemManager.removeAllowedPrinterIPAddressesForDevice(null);
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
  * @tc.name   test_remove_allowed_printer_ip_for_device_0101
  * @tc.number SUB_CUSTOMIZATION_EDM_REMOVE_ALLOWED_PRINTER_IP_ADDRESSES_FOR_DEVICE_JS_0101
  * @tc.desc   test removeAllowedPrinterIPAddressesForDevice without admin
  * @tc.type   FUNCTION
  * @tc.size   MEDIUMTEST
  * @tc.level  LEVEL2
  */
  it("test_remove_allowed_printer_ip_for_device_0101", Level.LEVEL2, async (done: Function) => {
    try {
      systemManager.removeAllowedPrinterIPAddressesForDevice(IP_LIST_1);
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
  * @tc.name   test_remove_allowed_printer_ip_for_device_0102
  * @tc.number SUB_CUSTOMIZATION_EDM_REMOVE_ALLOWED_PRINTER_IP_ADDRESSES_FOR_DEVICE_JS_0102
  * @tc.desc   test removeAllowedPrinterIPAddressesForDevice with byod admin
  * @tc.type   FUNCTION
  * @tc.size   MEDIUMTEST
  * @tc.level  LEVEL2
  */
  it("test_remove_allowed_printer_ip_for_device_0102", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
    try {
      systemManager.removeAllowedPrinterIPAddressesForDevice(IP_LIST_1);
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
  * @tc.name   test_remove_allowed_printer_ip_for_device_0103
  * @tc.number SUB_CUSTOMIZATION_EDM_REMOVE_ALLOWED_PRINTER_IP_ADDRESSES_FOR_DEVICE_JS_0103
  * @tc.desc   test removeAllowedPrinterIPAddressesForDevice with invalid IP format
  * @tc.type   FUNCTION
  * @tc.size   MEDIUMTEST
  * @tc.level  LEVEL2
  */
  it("test_remove_allowed_printer_ip_for_device_0103", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      systemManager.removeAllowedPrinterIPAddressesForDevice(["999.999.999.999"]);
      expect(false).assertTrue();
    } catch (error) {
      if (error.code === 801) {
        expect(error.code === 801).assertTrue();
      } else {
        expect(error.code === 9200012).assertTrue();
      }
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
  * @tc.name   test_remove_allowed_printer_ip_for_device_0104
  * @tc.number SUB_CUSTOMIZATION_EDM_REMOVE_ALLOWED_PRINTER_IP_ADDRESSES_FOR_DEVICE_JS_0104
  * @tc.desc   test removeAllowedPrinterIPAddressesForDevice with various invalid IP formats
  * @tc.type   FUNCTION
  * @tc.size   MEDIUMTEST
  * @tc.level  LEVEL2
  */
  it("test_remove_allowed_printer_ip_for_device_0104", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      for (const invalidIp of INVALID_IP_LIST) {
        try {
          systemManager.removeAllowedPrinterIPAddressesForDevice([invalidIp]);
          expect(false).assertTrue();
        } catch (error) {
          if (error.code === 801) {
            expect(error.code === 801).assertTrue();
          } else {
            expect(error.code === 9200012).assertTrue();
          }
        }
      }
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
  * @tc.name   test_remove_allowed_printer_ip_for_device_0200
  * @tc.number SUB_CUSTOMIZATION_EDM_REMOVE_ALLOWED_PRINTER_IP_ADDRESSES_FOR_DEVICE_JS_0200
  * @tc.desc   test removeAllowedPrinterIPAddressesForDevice success
  * @tc.type   FUNCTION
  * @tc.size   MEDIUMTEST
  * @tc.level  LEVEL2
  */
  it("test_remove_allowed_printer_ip_for_device_0200", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      systemManager.addAllowedPrinterIPAddressesForDevice(IP_LIST_1);
      systemManager.removeAllowedPrinterIPAddressesForDevice(IP_LIST_SINGLE);
      let result: Array<string> = systemManager.getAllowedPrinterIPAddressesForDevice();
      expect(result.length).assertEqual(1);
      expect(result[0]).assertEqual("10.0.0.1");
    } catch (error) {
      expect(error.code === 801).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
  * @tc.name   test_remove_allowed_printer_ip_for_device_0300
  * @tc.number SUB_CUSTOMIZATION_EDM_REMOVE_ALLOWED_PRINTER_IP_ADDRESSES_FOR_DEVICE_JS_0300
  * @tc.desc   test removeAllowedPrinterIPAddressesForDevice with non-existent IP
  * @tc.type   FUNCTION
  * @tc.size   MEDIUMTEST
  * @tc.level  LEVEL2
  */
  it("test_remove_allowed_printer_ip_for_device_0300", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      systemManager.addAllowedPrinterIPAddressesForDevice(IP_LIST_1);
      systemManager.removeAllowedPrinterIPAddressesForDevice(IP_LIST_2);
      let result: Array<string> = systemManager.getAllowedPrinterIPAddressesForDevice();
      expect(result.length).assertEqual(2);
    } catch (error) {
      expect(error.code === 801).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
  * @tc.name   test_remove_allowed_printer_ip_for_device_0400
  * @tc.number SUB_CUSTOMIZATION_EDM_REMOVE_ALLOWED_PRINTER_IP_ADDRESSES_FOR_DEVICE_JS_0400
  * @tc.desc   test removeAllowedPrinterIPAddressesForDevice remove all
  * @tc.type   FUNCTION
  * @tc.size   MEDIUMTEST
  * @tc.level  LEVEL2
  */
  it("test_remove_allowed_printer_ip_for_device_0400", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      systemManager.addAllowedPrinterIPAddressesForDevice(IP_LIST_1);
      systemManager.removeAllowedPrinterIPAddressesForDevice(IP_LIST_1);
      let result: Array<string> = systemManager.getAllowedPrinterIPAddressesForDevice();
      expect(result.length).assertEqual(0);
    } catch (error) {
      expect(error.code === 801).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
  * @tc.name   test_remove_allowed_printer_ip_for_device_0500
  * @tc.number SUB_CUSTOMIZATION_EDM_REMOVE_ALLOWED_PRINTER_IP_ADDRESSES_FOR_DEVICE_JS_0500
  * @tc.desc   test removeAllowedPrinterIPAddressesForDevice with valid full IPv6 addresses
  * @tc.type   FUNCTION
  * @tc.size   MEDIUMTEST
  * @tc.level  LEVEL2
  */
  it("test_remove_allowed_printer_ip_for_device_0500", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      systemManager.addAllowedPrinterIPAddressesForDevice(IPV6_LIST_1);
      systemManager.removeAllowedPrinterIPAddressesForDevice(IPV6_LIST_SINGLE);
      let result: Array<string> = systemManager.getAllowedPrinterIPAddressesForDevice();
      expect(result.length).assertEqual(1);
    } catch (error) {
      expect(error.code === 801).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });
}

function testGetAllowedPrinterIPAddressesForDevice() {
  /**
  * @tc.name   test_get_allowed_printer_ip_for_device_0100
  * @tc.number SUB_CUSTOMIZATION_EDM_GET_ALLOWED_PRINTER_IP_ADDRESSES_FOR_DEVICE_JS_0100
  * @tc.desc   test getAllowedPrinterIPAddressesForDevice with no policy set
  * @tc.type   FUNCTION
  * @tc.size   MEDIUMTEST
  * @tc.level  LEVEL2
  */
  it("test_get_allowed_printer_ip_for_device_0100", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      let result: Array<string> = systemManager.getAllowedPrinterIPAddressesForDevice();
      expect(result.length).assertEqual(0);
    } catch (error) {
      expect(false).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
  * @tc.name   test_get_allowed_printer_ip_for_device_0101
  * @tc.number SUB_CUSTOMIZATION_EDM_GET_ALLOWED_PRINTER_IP_ADDRESSES_FOR_DEVICE_JS_0101
  * @tc.desc   test getAllowedPrinterIPAddressesForDevice without admin
  * @tc.type   FUNCTION
  * @tc.size   MEDIUMTEST
  * @tc.level  LEVEL2
  */
  it("test_get_allowed_printer_ip_for_device_0101", Level.LEVEL2, async (done: Function) => {
    try {
      let result: Array<string> = systemManager.getAllowedPrinterIPAddressesForDevice();
      expect(result.length).assertEqual(0);
    } catch (error) {
      expect(error.code === 9200001).assertTrue();
    }
    done();
  });

  /**
  * @tc.name   test_get_allowed_printer_ip_for_device_0102
  * @tc.number SUB_CUSTOMIZATION_EDM_GET_ALLOWED_PRINTER_IP_ADDRESSES_FOR_DEVICE_JS_0102
  * @tc.desc   test getAllowedPrinterIPAddressesForDevice with byod admin
  * @tc.type   FUNCTION
  * @tc.size   MEDIUMTEST
  * @tc.level  LEVEL2
  */
  it("test_get_allowed_printer_ip_for_device_0102", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
    try {
      let result: Array<string> = systemManager.getAllowedPrinterIPAddressesForDevice();
      expect(result.length).assertEqual(0);
    } catch (error) {
      expect(error.code === 9200002).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
  * @tc.name   test_get_allowed_printer_ip_for_device_0200
  * @tc.number SUB_CUSTOMIZATION_EDM_GET_ALLOWED_PRINTER_IP_ADDRESSES_FOR_DEVICE_JS_0200
  * @tc.desc   test getAllowedPrinterIPAddressesForDevice with default SELF after set
  * @tc.type   FUNCTION
  * @tc.size   MEDIUMTEST
  * @tc.level  LEVEL2
  */
  it("test_get_allowed_printer_ip_for_device_0200", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      systemManager.addAllowedPrinterIPAddressesForDevice(IP_LIST_1);
      let result: Array<string> = systemManager.getAllowedPrinterIPAddressesForDevice();
      expect(result.length).assertEqual(2);
    } catch (error) {
      expect(error.code === 801).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
  * @tc.name   test_get_allowed_printer_ip_for_device_0300
  * @tc.number SUB_CUSTOMIZATION_EDM_GET_ALLOWED_PRINTER_IP_ADDRESSES_FOR_DEVICE_JS_0300
  * @tc.desc   test getAllowedPrinterIPAddressesForDevice with QueryPolicy.SELF
  * @tc.type   FUNCTION
  * @tc.size   MEDIUMTEST
  * @tc.level  LEVEL2
  */
  it("test_get_allowed_printer_ip_for_device_0300", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      systemManager.addAllowedPrinterIPAddressesForDevice(IP_LIST_1);
      let result: Array<string> = systemManager.getAllowedPrinterIPAddressesForDevice(0); // QueryPolicy.SELF
      expect(result.length).assertEqual(2);
    } catch (error) {
      expect(error.code === 801).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
  * @tc.name   test_get_allowed_printer_ip_for_device_0400
  * @tc.number SUB_CUSTOMIZATION_EDM_GET_ALLOWED_PRINTER_IP_ADDRESSES_FOR_DEVICE_JS_0400
  * @tc.desc   test getAllowedPrinterIPAddressesForDevice with QueryPolicy.ALL
  * @tc.type   FUNCTION
  * @tc.size   MEDIUMTEST
  * @tc.level  LEVEL2
  */
  it("test_get_allowed_printer_ip_for_device_0400", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      systemManager.addAllowedPrinterIPAddressesForDevice(IP_LIST_1);
      let result: Array<string> = systemManager.getAllowedPrinterIPAddressesForDevice(1); // QueryPolicy.ALL
      expect(result.length).assertEqual(2);
    } catch (error) {
      expect(error.code === 801).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
  * @tc.name   test_get_allowed_printer_ip_for_device_0500
  * @tc.number SUB_CUSTOMIZATION_EDM_GET_ALLOWED_PRINTER_IP_ADDRESSES_FOR_DEVICE_JS_0500
  * @tc.desc   test getAllowedPrinterIPAddressesForDevice returns IPv6 addresses
  * @tc.type   FUNCTION
  * @tc.size   MEDIUMTEST
  * @tc.level  LEVEL2
  */
  it("test_get_allowed_printer_ip_for_device_0500", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      systemManager.addAllowedPrinterIPAddressesForDevice(IPV6_LIST_1);
      let result: Array<string> = systemManager.getAllowedPrinterIPAddressesForDevice();
      expect(result.length).assertEqual(2);
      expect(result.indexOf(IPV6_LIST_1[0]) !== -1).assertTrue();
      expect(result.indexOf(IPV6_LIST_1[1]) !== -1).assertTrue();
    } catch (error) {
      expect(error.code === 801).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });
}

function testAddAllowedPrinterIPAddressesForAccount() {
  /**
  * @tc.name   test_add_allowed_printer_ip_for_device_for_account_0100
  * @tc.number SUB_CUSTOMIZATION_EDM_ADD_ALLOWED_PRINTER_IP_ADDRESSES_FOR_ACCOUNT_JS_0100
  * @tc.desc   test addAllowedPrinterIPAddressesForAccount with null ipList
  * @tc.type   FUNCTION
  * @tc.size   MEDIUMTEST
  * @tc.level  LEVEL2
  */
  it("test_add_allowed_printer_ip_for_device_for_account_0100", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      systemManager.addAllowedPrinterIPAddressesForAccount(null);
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
  * @tc.name   test_add_allowed_printer_ip_for_device_for_account_0101
  * @tc.number SUB_CUSTOMIZATION_EDM_ADD_ALLOWED_PRINTER_IP_ADDRESSES_FOR_ACCOUNT_JS_0101
  * @tc.desc   test addAllowedPrinterIPAddressesForAccount without admin
  * @tc.type   FUNCTION
  * @tc.size   MEDIUMTEST
  * @tc.level  LEVEL2
  */
  it("test_add_allowed_printer_ip_for_device_for_account_0101", Level.LEVEL2, async (done: Function) => {
    try {
      systemManager.addAllowedPrinterIPAddressesForAccount(IP_LIST_1);
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
  * @tc.name   test_add_allowed_printer_ip_for_device_for_account_0102
  * @tc.number SUB_CUSTOMIZATION_EDM_ADD_ALLOWED_PRINTER_IP_ADDRESSES_FOR_ACCOUNT_JS_0102
  * @tc.desc   test addAllowedPrinterIPAddressesForAccount with byod admin
  * @tc.type   FUNCTION
  * @tc.size   MEDIUMTEST
  * @tc.level  LEVEL2
  */
  it("test_add_allowed_printer_ip_for_device_for_account_0102", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
    try {
      systemManager.addAllowedPrinterIPAddressesForAccount(IP_LIST_1);
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
  * @tc.name   test_add_allowed_printer_ip_for_device_for_account_0103
  * @tc.number SUB_CUSTOMIZATION_EDM_ADD_ALLOWED_PRINTER_IP_ADDRESSES_FOR_ACCOUNT_JS_0103
  * @tc.desc   test addAllowedPrinterIPAddressesForAccount with invalid IP format
  * @tc.type   FUNCTION
  * @tc.size   MEDIUMTEST
  * @tc.level  LEVEL2
  */
  it("test_add_allowed_printer_ip_for_device_for_account_0103", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      systemManager.addAllowedPrinterIPAddressesForAccount(["999.999.999.999"]);
      expect(false).assertTrue();
    } catch (error) {
      if (error.code === 801) {
        expect(error.code === 801).assertTrue();
      } else {
        expect(error.code === 9200012).assertTrue();
      }
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
  * @tc.name   test_add_allowed_printer_ip_for_device_for_account_0104
  * @tc.number SUB_CUSTOMIZATION_EDM_ADD_ALLOWED_PRINTER_IP_ADDRESSES_FOR_ACCOUNT_JS_0104
  * @tc.desc   test addAllowedPrinterIPAddressesForAccount with various invalid IP formats
  * @tc.type   FUNCTION
  * @tc.size   MEDIUMTEST
  * @tc.level  LEVEL2
  */
  it("test_add_allowed_printer_ip_for_device_for_account_0104", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      for (const invalidIp of INVALID_IP_LIST) {
        try {
          systemManager.addAllowedPrinterIPAddressesForAccount([invalidIp]);
          expect(false).assertTrue();
        } catch (error) {
          if (error.code === 801) {
            expect(error.code === 801).assertTrue();
          } else {
            expect(error.code === 9200012).assertTrue();
          }
        }
      }
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
  * @tc.name   test_add_allowed_printer_ip_for_device_for_account_0200
  * @tc.number SUB_CUSTOMIZATION_EDM_ADD_ALLOWED_PRINTER_IP_ADDRESSES_FOR_ACCOUNT_JS_0200
  * @tc.desc   test addAllowedPrinterIPAddressesForAccount success
  * @tc.type   FUNCTION
  * @tc.size   MEDIUMTEST
  * @tc.level  LEVEL2
  */
  it("test_add_allowed_printer_ip_for_device_for_account_0200", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      systemManager.addAllowedPrinterIPAddressesForAccount(IP_LIST_1);
      let result: Array<string> = systemManager.getAllowedPrinterIPAddressesForAccount();
      expect(result.length).assertEqual(2);
    } catch (error) {
      expect(error.code === 801).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
  * @tc.name   test_add_allowed_printer_ip_for_device_for_account_0300
  * @tc.number SUB_CUSTOMIZATION_EDM_ADD_ALLOWED_PRINTER_IP_ADDRESSES_FOR_ACCOUNT_JS_0300
  * @tc.desc   test addAllowedPrinterIPAddressesForAccount merge policy
  * @tc.type   FUNCTION
  * @tc.size   MEDIUMTEST
  * @tc.level  LEVEL2
  */
  it("test_add_allowed_printer_ip_for_device_for_account_0300", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      systemManager.addAllowedPrinterIPAddressesForAccount(IP_LIST_1);
      systemManager.addAllowedPrinterIPAddressesForAccount(IP_LIST_2);
      let result: Array<string> = systemManager.getAllowedPrinterIPAddressesForAccount();
      expect(result.length).assertEqual(3);
    } catch (error) {
      expect(error.code === 801).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
  * @tc.name   test_add_allowed_printer_ip_for_device_for_account_0400
  * @tc.number SUB_CUSTOMIZATION_EDM_ADD_ALLOWED_PRINTER_IP_ADDRESSES_FOR_ACCOUNT_JS_0400
  * @tc.desc   test addAllowedPrinterIPAddressesForAccount exceed max size
  * @tc.type   FUNCTION
  * @tc.size   MEDIUMTEST
  * @tc.level  LEVEL2
  */
  it("test_add_allowed_printer_ip_for_device_for_account_0400", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      systemManager.addAllowedPrinterIPAddressesForAccount(IP_LIST_OVER_MAX);
      expect(false).assertTrue();
    } catch (error) {
      if (error.code === 801) {
        expect(error.code === 801).assertTrue();
      } else {
        expect(error.code === 9200019).assertTrue();
      }
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
  * @tc.name   test_add_allowed_printer_ip_for_device_for_account_0500
  * @tc.number SUB_CUSTOMIZATION_EDM_ADD_ALLOWED_PRINTER_IP_ADDRESSES_FOR_ACCOUNT_JS_0500
  * @tc.desc   test addAllowedPrinterIPAddressesForAccount with valid full IPv6 addresses
  * @tc.type   FUNCTION
  * @tc.size   MEDIUMTEST
  * @tc.level  LEVEL2
  */
  it("test_add_allowed_printer_ip_for_device_for_account_0500", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      systemManager.addAllowedPrinterIPAddressesForAccount(IPV6_LIST_1);
      let result: Array<string> = systemManager.getAllowedPrinterIPAddressesForAccount();
      expect(result.length).assertEqual(2);
    } catch (error) {
      expect(error.code === 801).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
  * @tc.name   test_add_allowed_printer_ip_for_device_for_account_0501
  * @tc.number SUB_CUSTOMIZATION_EDM_ADD_ALLOWED_PRINTER_IP_ADDRESSES_FOR_ACCOUNT_JS_0501
  * @tc.desc   test addAllowedPrinterIPAddressesForAccount with abbreviated IPv6 addresses (should fail)
  * @tc.type   FUNCTION
  * @tc.size   MEDIUMTEST
  * @tc.level  LEVEL2
  */
  it("test_add_allowed_printer_ip_for_device_for_account_0501", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      for (const invalidIpv6 of INVALID_IPV6_LIST) {
        try {
          systemManager.addAllowedPrinterIPAddressesForAccount([invalidIpv6]);
          expect(false).assertTrue();
        } catch (error) {
          if (error.code === 801) {
            expect(error.code === 801).assertTrue();
          } else {
            expect(error.code === 9200012).assertTrue();
          }
        }
      }
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

/**                                                                                                                                                                                                                              
  * @tc.name   test_add_allowed_printer_ip_for_account_0502                                                                                                                                                                         
  * @tc.number SUB_CUSTOMIZATION_EDM_ADD_ALLOWED_PRINTER_IP_ADDRESSES_FOR_ACCOUNT_JS_0502                                                                                                                                           
  * @tc.desc   test add 100 valid IPs then add one more should fail with 9200019                                                                                                                                                   
  * @tc.type   FUNCTION                                                                                                                                                                                                            
  * @tc.size   MEDIUMTEST                                                                                                                                                                                                          
  * @tc.level  LEVEL2                                                                                                                                                                                                              
  */                                                                                                                                                                                                                               
  it("test_add_allowed_printer_ip_for_account_0502", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      systemManager.addAllowedPrinterIPAddressesForAccount(IP_LIST_MAX_100);
      let result: Array<string> = systemManager.getAllowedPrinterIPAddressesForAccount();
      expect(result.length).assertEqual(100);
      try {
        systemManager.addAllowedPrinterIPAddressesForAccount(IP_LIST_ONE_EXTRA);
        expect(false).assertTrue();
      } catch (error) {
        if (error.code === 801) {
          expect(error.code === 801).assertTrue();
        } else {
          expect(error.code === 9200019).assertTrue();
        }
      }
    } catch (error) {
      expect(error.code === 801).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  }); 
}

function testRemoveAllowedPrinterIPAddressesForAccount() {
  /**
  * @tc.name   test_remove_allowed_printer_ip_for_device_for_account_0100
  * @tc.number SUB_CUSTOMIZATION_EDM_REMOVE_ALLOWED_PRINTER_IP_ADDRESSES_FOR_ACCOUNT_JS_0100
  * @tc.desc   test removeAllowedPrinterIPAddressesForAccount with null ipList
  * @tc.type   FUNCTION
  * @tc.size   MEDIUMTEST
  * @tc.level  LEVEL2
  */
  it("test_remove_allowed_printer_ip_for_device_for_account_0100", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      systemManager.removeAllowedPrinterIPAddressesForAccount(null);
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
  * @tc.name   test_remove_allowed_printer_ip_for_device_for_account_0101
  * @tc.number SUB_CUSTOMIZATION_EDM_REMOVE_ALLOWED_PRINTER_IP_ADDRESSES_FOR_ACCOUNT_JS_0101
  * @tc.desc   test removeAllowedPrinterIPAddressesForAccount without admin
  * @tc.type   FUNCTION
  * @tc.size   MEDIUMTEST
  * @tc.level  LEVEL2
  */
  it("test_remove_allowed_printer_ip_for_device_for_account_0101", Level.LEVEL2, async (done: Function) => {
    try {
      systemManager.removeAllowedPrinterIPAddressesForAccount(IP_LIST_1);
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
  * @tc.name   test_remove_allowed_printer_ip_for_device_for_account_0102
  * @tc.number SUB_CUSTOMIZATION_EDM_REMOVE_ALLOWED_PRINTER_IP_ADDRESSES_FOR_ACCOUNT_JS_0102
  * @tc.desc   test removeAllowedPrinterIPAddressesForAccount with byod admin
  * @tc.type   FUNCTION
  * @tc.size   MEDIUMTEST
  * @tc.level  LEVEL2
  */
  it("test_remove_allowed_printer_ip_for_device_for_account_0102", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
    try {
      systemManager.removeAllowedPrinterIPAddressesForAccount(IP_LIST_1);
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
  * @tc.name   test_remove_allowed_printer_ip_for_device_for_account_0103
  * @tc.number SUB_CUSTOMIZATION_EDM_REMOVE_ALLOWED_PRINTER_IP_ADDRESSES_FOR_ACCOUNT_JS_0103
  * @tc.desc   test removeAllowedPrinterIPAddressesForAccount with invalid IP format
  * @tc.type   FUNCTION
  * @tc.size   MEDIUMTEST
  * @tc.level  LEVEL2
  */
  it("test_remove_allowed_printer_ip_for_device_for_account_0103", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      systemManager.removeAllowedPrinterIPAddressesForAccount(["999.999.999.999"]);
      expect(false).assertTrue();
    } catch (error) {
      if (error.code === 801) {
        expect(error.code === 801).assertTrue();
      } else {
        expect(error.code === 9200012).assertTrue();
      }
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
  * @tc.name   test_remove_allowed_printer_ip_for_device_for_account_0104
  * @tc.number SUB_CUSTOMIZATION_EDM_REMOVE_ALLOWED_PRINTER_IP_ADDRESSES_FOR_ACCOUNT_JS_0104
  * @tc.desc   test removeAllowedPrinterIPAddressesForAccount with various invalid IP formats
  * @tc.type   FUNCTION
  * @tc.size   MEDIUMTEST
  * @tc.level  LEVEL2
  */
  it("test_remove_allowed_printer_ip_for_device_for_account_0104", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      for (const invalidIp of INVALID_IP_LIST) {
        try {
          systemManager.removeAllowedPrinterIPAddressesForAccount([invalidIp]);
          expect(false).assertTrue();
        } catch (error) {
          if (error.code === 801) {
            expect(error.code === 801).assertTrue();
          } else {
            expect(error.code === 9200012).assertTrue();
          }
        }
      }
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
  * @tc.name   test_remove_allowed_printer_ip_for_device_for_account_0200
  * @tc.number SUB_CUSTOMIZATION_EDM_REMOVE_ALLOWED_PRINTER_IP_ADDRESSES_FOR_ACCOUNT_JS_0200
  * @tc.desc   test removeAllowedPrinterIPAddressesForAccount success
  * @tc.type   FUNCTION
  * @tc.size   MEDIUMTEST
  * @tc.level  LEVEL2
  */
  it("test_remove_allowed_printer_ip_for_device_for_account_0200", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      systemManager.addAllowedPrinterIPAddressesForAccount(IP_LIST_1);
      systemManager.removeAllowedPrinterIPAddressesForAccount(IP_LIST_SINGLE);
      let result: Array<string> = systemManager.getAllowedPrinterIPAddressesForAccount();
      expect(result.length).assertEqual(1);
      expect(result[0]).assertEqual("10.0.0.1");
    } catch (error) {
      expect(error.code === 801).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
  * @tc.name   test_remove_allowed_printer_ip_for_device_for_account_0300
  * @tc.number SUB_CUSTOMIZATION_EDM_REMOVE_ALLOWED_PRINTER_IP_ADDRESSES_FOR_ACCOUNT_JS_0300
  * @tc.desc   test removeAllowedPrinterIPAddressesForAccount with non-existent IP
  * @tc.type   FUNCTION
  * @tc.size   MEDIUMTEST
  * @tc.level  LEVEL2
  */
  it("test_remove_allowed_printer_ip_for_device_for_account_0300", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      systemManager.addAllowedPrinterIPAddressesForAccount(IP_LIST_1);
      systemManager.removeAllowedPrinterIPAddressesForAccount(IP_LIST_2);
      let result: Array<string> = systemManager.getAllowedPrinterIPAddressesForAccount();
      expect(result.length).assertEqual(2);
    } catch (error) {
      expect(error.code === 801).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
  * @tc.name   test_remove_allowed_printer_ip_for_device_for_account_0400
  * @tc.number SUB_CUSTOMIZATION_EDM_REMOVE_ALLOWED_PRINTER_IP_ADDRESSES_FOR_ACCOUNT_JS_0400
  * @tc.desc   test removeAllowedPrinterIPAddressesForAccount remove all
  * @tc.type   FUNCTION
  * @tc.size   MEDIUMTEST
  * @tc.level  LEVEL2
  */
  it("test_remove_allowed_printer_ip_for_device_for_account_0400", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      systemManager.addAllowedPrinterIPAddressesForAccount(IP_LIST_1);
      systemManager.removeAllowedPrinterIPAddressesForAccount(IP_LIST_1);
      let result: Array<string> = systemManager.getAllowedPrinterIPAddressesForAccount();
      expect(result.length).assertEqual(0);
    } catch (error) {
      expect(error.code === 801).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
  * @tc.name   test_remove_allowed_printer_ip_for_device_for_account_0500
  * @tc.number SUB_CUSTOMIZATION_EDM_REMOVE_ALLOWED_PRINTER_IP_ADDRESSES_FOR_ACCOUNT_JS_0500
  * @tc.desc   test removeAllowedPrinterIPAddressesForAccount with valid full IPv6 addresses
  * @tc.type   FUNCTION
  * @tc.size   MEDIUMTEST
  * @tc.level  LEVEL2
  */
  it("test_remove_allowed_printer_ip_for_device_for_account_0500", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      systemManager.addAllowedPrinterIPAddressesForAccount(IPV6_LIST_1);
      systemManager.removeAllowedPrinterIPAddressesForAccount(IPV6_LIST_SINGLE);
      let result: Array<string> = systemManager.getAllowedPrinterIPAddressesForAccount();
      expect(result.length).assertEqual(1);
    } catch (error) {
      expect(error.code === 801).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });
}

function testGetAllowedPrinterIPAddressesForAccount() {
  /**
  * @tc.name   test_get_allowed_printer_ip_for_device_for_account_0100
  * @tc.number SUB_CUSTOMIZATION_EDM_GET_ALLOWED_PRINTER_IP_ADDRESSES_FOR_ACCOUNT_JS_0100
  * @tc.desc   test getAllowedPrinterIPAddressesForAccount with no policy set
  * @tc.type   FUNCTION
  * @tc.size   MEDIUMTEST
  * @tc.level  LEVEL2
  */
  it("test_get_allowed_printer_ip_for_device_for_account_0100", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      let result: Array<string> = systemManager.getAllowedPrinterIPAddressesForAccount();
      expect(result.length).assertEqual(0);
    } catch (error) {
      expect(false).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
  * @tc.name   test_get_allowed_printer_ip_for_device_for_account_0101
  * @tc.number SUB_CUSTOMIZATION_EDM_GET_ALLOWED_PRINTER_IP_ADDRESSES_FOR_ACCOUNT_JS_0101
  * @tc.desc   test getAllowedPrinterIPAddressesForAccount without admin
  * @tc.type   FUNCTION
  * @tc.size   MEDIUMTEST
  * @tc.level  LEVEL2
  */
  it("test_get_allowed_printer_ip_for_device_for_account_0101", Level.LEVEL2, async (done: Function) => {
    try {
      let result: Array<string> = systemManager.getAllowedPrinterIPAddressesForAccount();
      expect(result.length).assertEqual(0);
    } catch (error) {
      expect(error.code === 9200001).assertTrue();
    }
    done();
  });

  /**
  * @tc.name   test_get_allowed_printer_ip_for_device_for_account_0102
  * @tc.number SUB_CUSTOMIZATION_EDM_GET_ALLOWED_PRINTER_IP_ADDRESSES_FOR_ACCOUNT_JS_0102
  * @tc.desc   test getAllowedPrinterIPAddressesForAccount with byod admin
  * @tc.type   FUNCTION
  * @tc.size   MEDIUMTEST
  * @tc.level  LEVEL2
  */
  it("test_get_allowed_printer_ip_for_device_for_account_0102", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
    try {
      let result: Array<string> = systemManager.getAllowedPrinterIPAddressesForAccount();
      expect(result.length).assertEqual(0);
    } catch (error) {
      expect(error.code === 9200002).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
  * @tc.name   test_get_allowed_printer_ip_for_device_for_account_0200
  * @tc.number SUB_CUSTOMIZATION_EDM_GET_ALLOWED_PRINTER_IP_ADDRESSES_FOR_ACCOUNT_JS_0200
  * @tc.desc   test getAllowedPrinterIPAddressesForAccount with default SELF after set
  * @tc.type   FUNCTION
  * @tc.size   MEDIUMTEST
  * @tc.level  LEVEL2
  */
  it("test_get_allowed_printer_ip_for_device_for_account_0200", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      systemManager.addAllowedPrinterIPAddressesForAccount(IP_LIST_1);
      let result: Array<string> = systemManager.getAllowedPrinterIPAddressesForAccount();
      expect(result.length).assertEqual(2);
    } catch (error) {
      expect(error.code === 801).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
  * @tc.name   test_get_allowed_printer_ip_for_device_for_account_0300
  * @tc.number SUB_CUSTOMIZATION_EDM_GET_ALLOWED_PRINTER_IP_ADDRESSES_FOR_ACCOUNT_JS_0300
  * @tc.desc   test getAllowedPrinterIPAddressesForAccount with QueryPolicy.SELF
  * @tc.type   FUNCTION
  * @tc.size   MEDIUMTEST
  * @tc.level  LEVEL2
  */
  it("test_get_allowed_printer_ip_for_device_for_account_0300", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      systemManager.addAllowedPrinterIPAddressesForAccount(IP_LIST_1);
      let result: Array<string> = systemManager.getAllowedPrinterIPAddressesForAccount(0); // QueryPolicy.SELF
      expect(result.length).assertEqual(2);
    } catch (error) {
      expect(error.code === 801).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
  * @tc.name   test_get_allowed_printer_ip_for_device_for_account_0400
  * @tc.number SUB_CUSTOMIZATION_EDM_GET_ALLOWED_PRINTER_IP_ADDRESSES_FOR_ACCOUNT_JS_0400
  * @tc.desc   test getAllowedPrinterIPAddressesForAccount with QueryPolicy.ALL
  * @tc.type   FUNCTION
  * @tc.size   MEDIUMTEST
  * @tc.level  LEVEL2
  */
  it("test_get_allowed_printer_ip_for_device_for_account_0400", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      systemManager.addAllowedPrinterIPAddressesForAccount(IP_LIST_1);
      let result: Array<string> = systemManager.getAllowedPrinterIPAddressesForAccount(1); // QueryPolicy.ALL
      expect(result.length).assertEqual(2);
    } catch (error) {
      expect(error.code === 801).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
  * @tc.name   test_get_allowed_printer_ip_for_device_for_account_0500
  * @tc.number SUB_CUSTOMIZATION_EDM_GET_ALLOWED_PRINTER_IP_ADDRESSES_FOR_ACCOUNT_JS_0500
  * @tc.desc   test getAllowedPrinterIPAddressesForAccount returns IPv6 addresses
  * @tc.type   FUNCTION
  * @tc.size   MEDIUMTEST
  * @tc.level  LEVEL2
  */
  it("test_get_allowed_printer_ip_for_device_for_account_0500", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      systemManager.addAllowedPrinterIPAddressesForAccount(IPV6_LIST_1);
      let result: Array<string> = systemManager.getAllowedPrinterIPAddressesForAccount();
      expect(result.length).assertEqual(2);
      expect(result.indexOf(IPV6_LIST_1[0]) !== -1).assertTrue();
      expect(result.indexOf(IPV6_LIST_1[1]) !== -1).assertTrue();
    } catch (error) {
      expect(error.code === 801).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });
}

function testPrinterIpConflict() {
  /**
  * @tc.name   test_printer_ip_conflict_0100
  * @tc.number SUB_CUSTOMIZATION_EDM_PRINTER_IP_CONFLICT_JS_0100
  * @tc.desc   test user-level set then device-level add should conflict
  * @tc.type   FUNCTION
  * @tc.size   MEDIUMTEST
  * @tc.level  LEVEL2
  */
  it("test_printer_ip_conflict_0100", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      systemManager.addAllowedPrinterIPAddressesForAccount(IP_LIST_1);
      systemManager.addAllowedPrinterIPAddressesForDevice(IP_LIST_2);
      expect(false).assertTrue();
    } catch (error) {
      if (error.code === 801) {
        expect(error.code === 801).assertTrue();
      } else {
        expect(error.code === 9200010).assertTrue();
      }
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
  * @tc.name   test_printer_ip_conflict_0200
  * @tc.number SUB_CUSTOMIZATION_EDM_PRINTER_IP_CONFLICT_JS_0200
  * @tc.desc   test device-level set then user-level add should conflict
  * @tc.type   FUNCTION
  * @tc.size   MEDIUMTEST
  * @tc.level  LEVEL2
  */
  it("test_printer_ip_conflict_0200", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      systemManager.addAllowedPrinterIPAddressesForDevice(IP_LIST_1);
      systemManager.addAllowedPrinterIPAddressesForAccount(IP_LIST_2);
      expect(false).assertTrue();
    } catch (error) {
      if (error.code === 801) {
        expect(error.code === 801).assertTrue();
      } else {
        expect(error.code === 9200010).assertTrue();
      }
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
  * @tc.name   test_printer_ip_conflict_0300
  * @tc.number SUB_CUSTOMIZATION_EDM_PRINTER_IP_CONFLICT_JS_0300
  * @tc.desc   test device-level removed then user-level can set
  * @tc.type   FUNCTION
  * @tc.size   MEDIUMTEST
  * @tc.level  LEVEL2
  */
  it("test_printer_ip_conflict_0300", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      systemManager.addAllowedPrinterIPAddressesForDevice(IP_LIST_1);
      systemManager.removeAllowedPrinterIPAddressesForDevice(IP_LIST_1);
      systemManager.addAllowedPrinterIPAddressesForAccount(IP_LIST_2);
      let result: Array<string> = systemManager.getAllowedPrinterIPAddressesForAccount();
      expect(result.length).assertEqual(1);
    } catch (error) {
      expect(error.code === 801).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });
}

const TEST_TIMER_NAME: string = 'test_exact_timer';
const TEST_TIMER_INTERVAL: number = 1000;
const INVALID_TIMER_ID: number = 999999;
const NEGATIVE_TIMER_ID: number = -1;
const TEST_TRIGGER_TIME: number = 5000;

function getValidTimerConfig(): systemManager.ExactTimerConfig {
  return {
    name: TEST_TIMER_NAME,
    repeat: true,
    interval: TEST_TIMER_INTERVAL,
    callback: () => {}
  };
}

function testCreateExactTimer() {
  /**
   * @tc.name   test_create_exact_timer_0100
   * @tc.number SUB_CUSTOMIZATION_EDM_CREATE_EXACT_TIMER_JS_0100
   * @tc.desc   test systemManager createExactTimer without admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_create_exact_timer_0100", Level.LEVEL2, async (done: Function) => {
    try {
      await systemManager.createExactTimer(getValidTimerConfig());
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
   * @tc.name   test_create_exact_timer_0200
   * @tc.number SUB_CUSTOMIZATION_EDM_CREATE_EXACT_TIMER_JS_0200
   * @tc.desc   test systemManager createExactTimer with byod admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_create_exact_timer_0200", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
    try {
      await systemManager.createExactTimer(getValidTimerConfig());
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
   * @tc.name   test_create_exact_timer_0300
   * @tc.number SUB_CUSTOMIZATION_EDM_CREATE_EXACT_TIMER_JS_0300
   * @tc.desc   test systemManager createExactTimer with null config
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_create_exact_timer_0300", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      await systemManager.createExactTimer(null);
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
   * @tc.name   test_create_exact_timer_0400
   * @tc.number SUB_CUSTOMIZATION_EDM_CREATE_EXACT_TIMER_JS_0400
   * @tc.desc   test systemManager createExactTimer with undefined config
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_create_exact_timer_0400", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      await systemManager.createExactTimer(undefined);
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
   * @tc.name   test_create_exact_timer_0500
   * @tc.number SUB_CUSTOMIZATION_EDM_CREATE_EXACT_TIMER_JS_0500
   * @tc.desc   test systemManager createExactTimer with empty name
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_create_exact_timer_0500", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      let config: systemManager.ExactTimerConfig = {
        name: '',
        repeat: true,
        interval: TEST_TIMER_INTERVAL,
        callback: () => {}
      };
      await systemManager.createExactTimer(config);
      expect(false).assertTrue();
    } catch (error) {
      if (error.code === 801) {
        expect(error.code === 801).assertTrue();
      } else {
        expect(error.code === 9200012).assertTrue();
      }
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_create_exact_timer_0700
   * @tc.number SUB_CUSTOMIZATION_EDM_CREATE_EXACT_TIMER_JS_0700
   * @tc.desc   test systemManager createExactTimer with name exceeding max length
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_create_exact_timer_0700", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      let longName: string = 'a'.repeat(65);
      let config: systemManager.ExactTimerConfig = {
        name: longName,
        repeat: true,
        interval: TEST_TIMER_INTERVAL,
        callback: () => {}
      };
      await systemManager.createExactTimer(config);
      expect(false).assertTrue();
    } catch (error) {
      if (error.code === 801) {
        expect(error.code === 801).assertTrue();
      } else {
        expect(error.code === 9200012).assertTrue();
      }
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_create_exact_timer_0800
   * @tc.number SUB_CUSTOMIZATION_EDM_CREATE_EXACT_TIMER_JS_0800
   * @tc.desc   test systemManager createExactTimer with interval below minimum
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_create_exact_timer_0800", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      let config: systemManager.ExactTimerConfig = {
        name: TEST_TIMER_NAME,
        repeat: true,
        interval: 999,
        callback: () => {}
      };
      await systemManager.createExactTimer(config);
      expect(false).assertTrue();
    } catch (error) {
      if (error.code === 801) {
        expect(error.code === 801).assertTrue();
      } else {
        expect(error.code === 9200012).assertTrue();
      }
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_create_exact_timer_0900
   * @tc.number SUB_CUSTOMIZATION_EDM_CREATE_EXACT_TIMER_JS_0900
   * @tc.desc   test systemManager createExactTimer with interval above maximum
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_create_exact_timer_0900", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      let config: systemManager.ExactTimerConfig = {
        name: TEST_TIMER_NAME,
        repeat: true,
        interval: 86400001,
        callback: () => {}
      };
      await systemManager.createExactTimer(config);
      expect(false).assertTrue();
    } catch (error) {
      if (error.code === 801) {
        expect(error.code === 801).assertTrue();
      } else {
        expect(error.code === 9200012).assertTrue();
      }
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_create_exact_timer_1000
   * @tc.number SUB_CUSTOMIZATION_EDM_CREATE_EXACT_TIMER_JS_1000
   * @tc.desc   test systemManager createExactTimer with name at max length boundary
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it("test_create_exact_timer_1000", Level.LEVEL0, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    let timerId: number = -1;
    try {
      let config: systemManager.ExactTimerConfig = {
        name: 'a'.repeat(64),
        repeat: true,
        interval: TEST_TIMER_INTERVAL,
        callback: () => {}
      };
      timerId = await systemManager.createExactTimer(config);
      expect(timerId >= 0).assertTrue();
    } catch (error) {
      expect(error.code === 801).assertTrue();
    } finally {
      if (timerId >= 0) {
        try {
          await systemManager.destroyExactTimer(timerId);
        } catch (e) {
          console.info('destroyExactTimer failed: ' + JSON.stringify(e));
        }
      }
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_create_exact_timer_1100
   * @tc.number SUB_CUSTOMIZATION_EDM_CREATE_EXACT_TIMER_JS_1100
   * @tc.desc   test systemManager createExactTimer with interval at max boundary
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it("test_create_exact_timer_1100", Level.LEVEL0, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    let timerId: number = -1;
    try {
      let config: systemManager.ExactTimerConfig = {
        name: TEST_TIMER_NAME,
        repeat: true,
        interval: 86400000,
        callback: () => {}
      };
      timerId = await systemManager.createExactTimer(config);
      expect(timerId >= 0).assertTrue();
    } catch (error) {
      expect(error.code === 801).assertTrue();
    } finally {
      if (timerId >= 0) {
        try {
          await systemManager.destroyExactTimer(timerId);
        } catch (e) {
          console.info('destroyExactTimer failed: ' + JSON.stringify(e));
        }
      }
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_create_exact_timer_1200
   * @tc.number SUB_CUSTOMIZATION_EDM_CREATE_EXACT_TIMER_JS_1200
   * @tc.desc   test systemManager createExactTimer with one-shot timer but non-zero interval
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_create_exact_timer_1200", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      let config: systemManager.ExactTimerConfig = {
        name: TEST_TIMER_NAME,
        repeat: false,
        interval: TEST_TIMER_INTERVAL,
        callback: () => {}
      };
      let timerId: number = await systemManager.createExactTimer(config);
      expect(timerId >= 0).assertTrue();
    } catch (error) {
      expect(error.code === 801).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_create_exact_timer_1300
   * @tc.number SUB_CUSTOMIZATION_EDM_CREATE_EXACT_TIMER_JS_1300
   * @tc.desc   test systemManager createExactTimer with timer limit reached
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_create_exact_timer_1300", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    let timerIds: Array<number> = [];
    try {
      for (let i = 0; i < 5; i++) {
        let config: systemManager.ExactTimerConfig = {
          name: TEST_TIMER_NAME + '_' + i,
          repeat: true,
          interval: TEST_TIMER_INTERVAL,
          callback: () => {}
        };
        let id: number = await systemManager.createExactTimer(config);
        timerIds.push(id);
      }
      let config: systemManager.ExactTimerConfig = {
        name: TEST_TIMER_NAME + '_5',
        repeat: true,
        interval: TEST_TIMER_INTERVAL,
        callback: () => {}
      };
      await systemManager.createExactTimer(config);
      expect(false).assertTrue();
    } catch (error) {
      if (error.code === 801) {
        expect(error.code === 801).assertTrue();
      } else {
        expect(error.code === 9201053).assertTrue();
      }
    } finally {
      for (let id of timerIds) {
        try {
          await systemManager.destroyExactTimer(id);
        } catch (e) {
          console.info('destroyExactTimer failed: ' + JSON.stringify(e));
        }
      }
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_create_exact_timer_1400
   * @tc.number SUB_CUSTOMIZATION_EDM_CREATE_EXACT_TIMER_JS_1400
   * @tc.desc   test systemManager createExactTimer success with repeating timer
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it("test_create_exact_timer_1400", Level.LEVEL0, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    let timerId: number = -1;
    try {
      timerId = await systemManager.createExactTimer(getValidTimerConfig());
      expect(timerId >= 0).assertTrue();
    } catch (error) {
      expect(error.code === 801).assertTrue();
    } finally {
      if (timerId >= 0) {
        try {
          await systemManager.destroyExactTimer(timerId);
        } catch (e) {
          console.info('destroyExactTimer failed: ' + JSON.stringify(e));
        }
      }
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_create_exact_timer_1500
   * @tc.number SUB_CUSTOMIZATION_EDM_CREATE_EXACT_TIMER_JS_1500
   * @tc.desc   test systemManager createExactTimer success with one-shot timer
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it("test_create_exact_timer_1500", Level.LEVEL0, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    let timerId: number = -1;
    try {
      let config: systemManager.ExactTimerConfig = {
        name: TEST_TIMER_NAME + '_oneshot',
        repeat: false,
        interval: 0,
        callback: () => {}
      };
      timerId = await systemManager.createExactTimer(config);
      expect(timerId >= 0).assertTrue();
    } catch (error) {
      expect(error.code === 801).assertTrue();
    } finally {
      if (timerId >= 0) {
        try {
          await systemManager.destroyExactTimer(timerId);
        } catch (e) {
          console.info('destroyExactTimer failed: ' + JSON.stringify(e));
        }
      }
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });
}

function testStartExactTimer() {
  /**
   * @tc.name   test_start_exact_timer_0100
   * @tc.number SUB_CUSTOMIZATION_EDM_START_EXACT_TIMER_JS_0100
   * @tc.desc   test systemManager startExactTimer without admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_start_exact_timer_0100", Level.LEVEL2, async (done: Function) => {
    try {
      await systemManager.startExactTimer(1, TEST_TRIGGER_TIME);
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
   * @tc.name   test_start_exact_timer_0200
   * @tc.number SUB_CUSTOMIZATION_EDM_START_EXACT_TIMER_JS_0200
   * @tc.desc   test systemManager startExactTimer with byod admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_start_exact_timer_0200", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
    try {
      await systemManager.startExactTimer(1, TEST_TRIGGER_TIME);
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
   * @tc.name   test_start_exact_timer_0300
   * @tc.number SUB_CUSTOMIZATION_EDM_START_EXACT_TIMER_JS_0300
   * @tc.desc   test systemManager startExactTimer with null timer
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_start_exact_timer_0300", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      await systemManager.startExactTimer(null, TEST_TRIGGER_TIME);
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
   * @tc.name   test_start_exact_timer_0400
   * @tc.number SUB_CUSTOMIZATION_EDM_START_EXACT_TIMER_JS_0400
   * @tc.desc   test systemManager startExactTimer with undefined timer
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_start_exact_timer_0400", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      await systemManager.startExactTimer(undefined, TEST_TRIGGER_TIME);
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
   * @tc.name   test_start_exact_timer_0500
   * @tc.number SUB_CUSTOMIZATION_EDM_START_EXACT_TIMER_JS_0500
   * @tc.desc   test systemManager startExactTimer with non-existent timer
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_start_exact_timer_0500", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      await systemManager.startExactTimer(INVALID_TIMER_ID, TEST_TRIGGER_TIME);
      expect(false).assertTrue();
    } catch (error) {
      if (error.code === 801) {
        expect(error.code === 801).assertTrue();
      } else {
        expect(error.code === 9201054).assertTrue();
      }
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_start_exact_timer_0600
   * @tc.number SUB_CUSTOMIZATION_EDM_START_EXACT_TIMER_JS_0600
   * @tc.desc   test systemManager startExactTimer with negative timer
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_start_exact_timer_0600", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      await systemManager.startExactTimer(NEGATIVE_TIMER_ID, TEST_TRIGGER_TIME);
      expect(false).assertTrue();
    } catch (error) {
      if (error.code === 801) {
        expect(error.code === 801).assertTrue();
      } else {
        expect(error.code === 9201054).assertTrue();
      }
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_start_exact_timer_0700
   * @tc.number SUB_CUSTOMIZATION_EDM_START_EXACT_TIMER_JS_0700
   * @tc.desc   test systemManager startExactTimer with null triggerTime
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_start_exact_timer_0700", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    let timerId: number = -1;
    try {
      timerId = await systemManager.createExactTimer(getValidTimerConfig());
    } catch (error) {
      expect(error.code === 801).assertTrue();
      await adminManager.disableSuperAdmin(SELFHAPNAME);
      done();
      return;
    }
    try {
      await systemManager.startExactTimer(timerId, null);
      expect(false).assertTrue();
    } catch (error) {
      if (error.code === 801) {
        expect(error.code === 801).assertTrue();
      } else {
        expect(error.code === 401).assertTrue();
      }
    } finally {
      if (timerId >= 0) {
        try {
          await systemManager.destroyExactTimer(timerId);
        } catch (e) {
          console.info('destroyExactTimer failed: ' + JSON.stringify(e));
        }
      }
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_start_exact_timer_0800
   * @tc.number SUB_CUSTOMIZATION_EDM_START_EXACT_TIMER_JS_0800
   * @tc.desc   test systemManager startExactTimer with undefined triggerTime
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_start_exact_timer_0800", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    let timerId: number = -1;
    try {
      timerId = await systemManager.createExactTimer(getValidTimerConfig());
    } catch (error) {
      expect(error.code === 801).assertTrue();
      await adminManager.disableSuperAdmin(SELFHAPNAME);
      done();
      return;
    }
    try {
      await systemManager.startExactTimer(timerId, undefined);
      expect(false).assertTrue();
    } catch (error) {
      if (error.code === 801) {
        expect(error.code === 801).assertTrue();
      } else {
        expect(error.code === 401).assertTrue();
      }
    } finally {
      if (timerId >= 0) {
        try {
          await systemManager.destroyExactTimer(timerId);
        } catch (e) {
          console.info('destroyExactTimer failed: ' + JSON.stringify(e));
        }
      }
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_start_exact_timer_0900
   * @tc.number SUB_CUSTOMIZATION_EDM_START_EXACT_TIMER_JS_0900
   * @tc.desc   test systemManager startExactTimer success
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it("test_start_exact_timer_0900", Level.LEVEL0, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    let timerId: number = -1;
    try {
      timerId = await systemManager.createExactTimer(getValidTimerConfig());
      await systemManager.startExactTimer(timerId, TEST_TRIGGER_TIME);
      await systemManager.stopExactTimer(timerId);
    } catch (error) {
      expect(error.code === 801).assertTrue();
    } finally {
      if (timerId >= 0) {
        try {
          await systemManager.destroyExactTimer(timerId);
        } catch (e) {
          console.info('destroyExactTimer failed: ' + JSON.stringify(e));
        }
      }
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_start_exact_timer_1000
   * @tc.number SUB_CUSTOMIZATION_EDM_START_EXACT_TIMER_JS_1000
   * @tc.desc   test systemManager startExactTimer with triggerTime zero
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_start_exact_timer_1000", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    let timerId: number = -1;
    try {
      timerId = await systemManager.createExactTimer(getValidTimerConfig());
    } catch (error) {
      expect(error.code === 801).assertTrue();
      await adminManager.disableSuperAdmin(SELFHAPNAME);
      done();
      return;
    }
    try {
      await systemManager.startExactTimer(timerId, 0);
      expect(false).assertTrue();
    } catch (error) {
      if (error.code === 801) {
        expect(error.code === 801).assertTrue();
      } else {
        expect(error.code === 9200012).assertTrue();
      }
    } finally {
      if (timerId >= 0) {
        try {
          await systemManager.destroyExactTimer(timerId);
        } catch (e) {
          console.info('destroyExactTimer failed: ' + JSON.stringify(e));
        }
      }
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });
}

function testStopExactTimer() {
  /**
   * @tc.name   test_stop_exact_timer_0100
   * @tc.number SUB_CUSTOMIZATION_EDM_STOP_EXACT_TIMER_JS_0100
   * @tc.desc   test systemManager stopExactTimer without admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_stop_exact_timer_0100", Level.LEVEL2, async (done: Function) => {
    try {
      await systemManager.stopExactTimer(1);
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
   * @tc.name   test_stop_exact_timer_0200
   * @tc.number SUB_CUSTOMIZATION_EDM_STOP_EXACT_TIMER_JS_0200
   * @tc.desc   test systemManager stopExactTimer with byod admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_stop_exact_timer_0200", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
    try {
      await systemManager.stopExactTimer(1);
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
   * @tc.name   test_stop_exact_timer_0300
   * @tc.number SUB_CUSTOMIZATION_EDM_STOP_EXACT_TIMER_JS_0300
   * @tc.desc   test systemManager stopExactTimer with null timer
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_stop_exact_timer_0300", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      await systemManager.stopExactTimer(null);
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
   * @tc.name   test_stop_exact_timer_0400
   * @tc.number SUB_CUSTOMIZATION_EDM_STOP_EXACT_TIMER_JS_0400
   * @tc.desc   test systemManager stopExactTimer with undefined timer
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_stop_exact_timer_0400", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      await systemManager.stopExactTimer(undefined);
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
   * @tc.name   test_stop_exact_timer_0500
   * @tc.number SUB_CUSTOMIZATION_EDM_STOP_EXACT_TIMER_JS_0500
   * @tc.desc   test systemManager stopExactTimer with non-existent timer
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_stop_exact_timer_0500", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      await systemManager.stopExactTimer(INVALID_TIMER_ID);
      expect(false).assertTrue();
    } catch (error) {
      if (error.code === 801) {
        expect(error.code === 801).assertTrue();
      } else {
        expect(error.code === 9201054).assertTrue();
      }
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_stop_exact_timer_0600
   * @tc.number SUB_CUSTOMIZATION_EDM_STOP_EXACT_TIMER_JS_0600
   * @tc.desc   test systemManager stopExactTimer with negative timer
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_stop_exact_timer_0600", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      await systemManager.stopExactTimer(NEGATIVE_TIMER_ID);
      expect(false).assertTrue();
    } catch (error) {
      if (error.code === 801) {
        expect(error.code === 801).assertTrue();
      } else {
        expect(error.code === 9201054).assertTrue();
      }
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_stop_exact_timer_0700
   * @tc.number SUB_CUSTOMIZATION_EDM_STOP_EXACT_TIMER_JS_0700
   * @tc.desc   test systemManager stopExactTimer success
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it("test_stop_exact_timer_0700", Level.LEVEL0, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    let timerId: number = -1;
    try {
      timerId = await systemManager.createExactTimer(getValidTimerConfig());
      await systemManager.startExactTimer(timerId, TEST_TRIGGER_TIME);
      await systemManager.stopExactTimer(timerId);
    } catch (error) {
      expect(error.code === 801).assertTrue();
    } finally {
      if (timerId >= 0) {
        try {
          await systemManager.destroyExactTimer(timerId);
        } catch (e) {
          console.info('destroyExactTimer failed: ' + JSON.stringify(e));
        }
      }
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_stop_exact_timer_0800
   * @tc.number SUB_CUSTOMIZATION_EDM_STOP_EXACT_TIMER_JS_0800
   * @tc.desc   test systemManager stopExactTimer with unstarted timer
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_stop_exact_timer_0800", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    let timerId: number = -1;
    try {
      timerId = await systemManager.createExactTimer(getValidTimerConfig());
    } catch (error) {
      expect(error.code === 801).assertTrue();
      await adminManager.disableSuperAdmin(SELFHAPNAME);
      done();
      return;
    }
    try {
      await systemManager.stopExactTimer(timerId);
    } catch (error) {
      expect(error.code === 801).assertTrue();
    } finally {
      if (timerId >= 0) {
        try {
          await systemManager.destroyExactTimer(timerId);
        } catch (e) {
          console.info('destroyExactTimer failed: ' + JSON.stringify(e));
        }
      }
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });
}

function testDestroyExactTimer() {
  /**
   * @tc.name   test_destroy_exact_timer_0100
   * @tc.number SUB_CUSTOMIZATION_EDM_DESTROY_EXACT_TIMER_JS_0100
   * @tc.desc   test systemManager destroyExactTimer without admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_destroy_exact_timer_0100", Level.LEVEL2, async (done: Function) => {
    try {
      await systemManager.destroyExactTimer(1);
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
   * @tc.name   test_destroy_exact_timer_0200
   * @tc.number SUB_CUSTOMIZATION_EDM_DESTROY_EXACT_TIMER_JS_0200
   * @tc.desc   test systemManager destroyExactTimer with byod admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_destroy_exact_timer_0200", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
    try {
      await systemManager.destroyExactTimer(1);
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
   * @tc.name   test_destroy_exact_timer_0300
   * @tc.number SUB_CUSTOMIZATION_EDM_DESTROY_EXACT_TIMER_JS_0300
   * @tc.desc   test systemManager destroyExactTimer with null timer
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_destroy_exact_timer_0300", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      await systemManager.destroyExactTimer(null);
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
   * @tc.name   test_destroy_exact_timer_0400
   * @tc.number SUB_CUSTOMIZATION_EDM_DESTROY_EXACT_TIMER_JS_0400
   * @tc.desc   test systemManager destroyExactTimer with undefined timer
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_destroy_exact_timer_0400", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      await systemManager.destroyExactTimer(undefined);
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
   * @tc.name   test_destroy_exact_timer_0500
   * @tc.number SUB_CUSTOMIZATION_EDM_DESTROY_EXACT_TIMER_JS_0500
   * @tc.desc   test systemManager destroyExactTimer with non-existent timer
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_destroy_exact_timer_0500", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      await systemManager.destroyExactTimer(INVALID_TIMER_ID);
      expect(false).assertTrue();
    } catch (error) {
      if (error.code === 801) {
        expect(error.code === 801).assertTrue();
      } else {
        expect(error.code === 9201054).assertTrue();
      }
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_destroy_exact_timer_0600
   * @tc.number SUB_CUSTOMIZATION_EDM_DESTROY_EXACT_TIMER_JS_0600
   * @tc.desc   test systemManager destroyExactTimer with negative timer
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_destroy_exact_timer_0600", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      await systemManager.destroyExactTimer(NEGATIVE_TIMER_ID);
      expect(false).assertTrue();
    } catch (error) {
      if (error.code === 801) {
        expect(error.code === 801).assertTrue();
      } else if (error.code === 9200012) {
        expect(error.code === 9200012).assertTrue();
      } else {
        expect(error.code === 9201054).assertTrue();
      }
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_destroy_exact_timer_0700
   * @tc.number SUB_CUSTOMIZATION_EDM_DESTROY_EXACT_TIMER_JS_0700
   * @tc.desc   test systemManager destroyExactTimer success
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it("test_destroy_exact_timer_0700", Level.LEVEL0, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    let timerId: number = -1;
    try {
      timerId = await systemManager.createExactTimer(getValidTimerConfig());
      await systemManager.destroyExactTimer(timerId);
      timerId = -1;
    } catch (error) {
      expect(error.code === 801).assertTrue();
    } finally {
      if (timerId >= 0) {
        try {
          await systemManager.destroyExactTimer(timerId);
        } catch (e) {
          console.info('destroyExactTimer failed: ' + JSON.stringify(e));
        }
      }
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });
}
