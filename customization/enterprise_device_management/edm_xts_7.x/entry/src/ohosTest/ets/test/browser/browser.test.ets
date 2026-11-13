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
import { ENTINFO1, SELFWANT, SELFHAPNAME, TEST_APP_ID_1, TEST_POLICY_NAME, TEST_POLICY_VALUE,
  INVALID_WANT} from '../commom.test.ets';
import { util } from '@kit.ArkTS';


import adminManager from '@ohos.enterprise.adminManager';
import browser from '@ohos.enterprise.browser';

const TEST_POLICY_VALUE_OVERRIDE: string = '"test_policy_value_override"';

export default function browserManagerTest() {
  describe('browserManager_test', () => {
    testSetManagedBrowserPolicy();
  })
}

function testSetManagedBrowserPolicy() {
  /**
   * @tc.name   test_setManagedBrowserPolicy_0100
   * @tc.number SUB_CUSTOMIZATION_EDM_SETMANAGEDBROWSERPOLICY_0100
   * @tc.desc   test setManagedBrowserPolicy method without active administration
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_setManagedBrowserPolicy_0100", Level.LEVEL2, async (done: Function) => {
    try {
      browser.setManagedBrowserPolicy(SELFHAPNAME, TEST_POLICY_NAME, TEST_POLICY_VALUE);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code).assertEqual(9200001);
    }
    done();
  })

  /**
   * @tc.name   test_setManagedBrowserPolicy_0200
   * @tc.number SUB_CUSTOMIZATION_EDM_SETMANAGEDBROWSERPOLICY_0200
   * @tc.desc   test setManagedBrowserPolicy method with normal admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_setManagedBrowserPolicy_0200", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
    try {
      browser.setManagedBrowserPolicy(SELFHAPNAME, TEST_POLICY_NAME, TEST_POLICY_VALUE);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code).assertEqual(9200002);
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  })

  /**
   * @tc.name   test_setManagedBrowserPolicy_0300
   * @tc.number SUB_CUSTOMIZATION_EDM_SETMANAGEDBROWSERPOLICY_0300
   * @tc.desc   test setManagedBrowserPolicy method with null bundleName
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_setManagedBrowserPolicy_0300", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      browser.setManagedBrowserPolicy(null, TEST_POLICY_NAME, TEST_POLICY_VALUE);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code).assertEqual(401);
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  })

  /**
   * @tc.name   test_setManagedBrowserPolicy_0400
   * @tc.number SUB_CUSTOMIZATION_EDM_SETMANAGEDBROWSERPOLICY_0400
   * @tc.desc   test setManagedBrowserPolicy method with undefined bundleName
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_setManagedBrowserPolicy_0400", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      browser.setManagedBrowserPolicy(undefined, TEST_POLICY_NAME, TEST_POLICY_VALUE);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code).assertEqual(401);
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  })

  /**
   * @tc.name   test_setManagedBrowserPolicy_0500
   * @tc.number SUB_CUSTOMIZATION_EDM_SETMANAGEDBROWSERPOLICY_0500
   * @tc.desc   test setManagedBrowserPolicy method with null policyName
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_setManagedBrowserPolicy_0500", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      browser.setManagedBrowserPolicy(SELFHAPNAME, null, TEST_POLICY_VALUE);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code).assertEqual(401);
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  })

  /**
   * @tc.name   test_setManagedBrowserPolicy_0600
   * @tc.number SUB_CUSTOMIZATION_EDM_SETMANAGEDBROWSERPOLICY_0600
   * @tc.desc   test setManagedBrowserPolicy method with undefined policyName
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_setManagedBrowserPolicy_0600", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      browser.setManagedBrowserPolicy(SELFHAPNAME, undefined, TEST_POLICY_VALUE);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code).assertEqual(401);
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  })

  /**
   * @tc.name   test_setManagedBrowserPolicy_0700
   * @tc.number SUB_CUSTOMIZATION_EDM_SETMANAGEDBROWSERPOLICY_0700
   * @tc.desc   test setManagedBrowserPolicy method with null policyValue
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_setManagedBrowserPolicy_0700", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      browser.setManagedBrowserPolicy(SELFHAPNAME, TEST_POLICY_NAME, null);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code).assertEqual(401);
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  })

  /**
   * @tc.name   test_setManagedBrowserPolicy_0800
   * @tc.number SUB_CUSTOMIZATION_EDM_SETMANAGEDBROWSERPOLICY_0800
   * @tc.desc   test setManagedBrowserPolicy method with undefined policyValue
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_setManagedBrowserPolicy_0800", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      browser.setManagedBrowserPolicy(SELFHAPNAME, TEST_POLICY_NAME, undefined);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code).assertEqual(401);
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  })

  /**
   * @tc.name   test_setManagedBrowserPolicy_0900
   * @tc.number SUB_CUSTOMIZATION_EDM_SETMANAGEDBROWSERPOLICY_0900
   * @tc.desc   test setManagedBrowserPolicy method with empty bundleName
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_setManagedBrowserPolicy_0900", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      browser.setManagedBrowserPolicy("", TEST_POLICY_NAME, TEST_POLICY_VALUE);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code).assertEqual(9200012);
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  })

  /**
   * @tc.name   test_setManagedBrowserPolicy_1000
   * @tc.number SUB_CUSTOMIZATION_EDM_SETMANAGEDBROWSERPOLICY_1000
   * @tc.desc   test setManagedBrowserPolicy method with empty policyName
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_setManagedBrowserPolicy_1000", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      browser.setManagedBrowserPolicy(SELFHAPNAME, "", TEST_POLICY_VALUE);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code).assertEqual(9200012);
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  })

  /**
   * @tc.name   test_setManagedBrowserPolicy_1100
   * @tc.number SUB_CUSTOMIZATION_EDM_SETMANAGEDBROWSERPOLICY_1100
   * @tc.desc   test setManagedBrowserPolicy method
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_setManagedBrowserPolicy_1100", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      browser.setManagedBrowserPolicy(SELFHAPNAME, TEST_POLICY_NAME, TEST_POLICY_VALUE);
      let buffer: ArrayBuffer = browser.getManagedBrowserPolicy(SELFWANT, SELFHAPNAME);
      let intBuffer = new Uint8Array(buffer);
      let decoder = util.TextDecoder.create('utf-8');
      let stringData = decoder.decodeWithStream(intBuffer);
      expect(JSON.parse(stringData)[TEST_POLICY_NAME]).assertEqual(JSON.parse(TEST_POLICY_VALUE));
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  })

  /**
   * @tc.name   test_setManagedBrowserPolicy_1200
   * @tc.number SUB_CUSTOMIZATION_EDM_SETMANAGEDBROWSERPOLICY_1200
   * @tc.desc   test setManagedBrowserPolicy method with forceOverride true
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_setManagedBrowserPolicy_1200", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      browser.setManagedBrowserPolicy(SELFHAPNAME, TEST_POLICY_NAME, TEST_POLICY_VALUE);
      browser.setManagedBrowserPolicy(SELFHAPNAME, TEST_POLICY_NAME, TEST_POLICY_VALUE_OVERRIDE, true);
      let buffer: ArrayBuffer = browser.getManagedBrowserPolicy(SELFWANT, SELFHAPNAME);
      let intBuffer = new Uint8Array(buffer);
      let decoder = util.TextDecoder.create('utf-8');
      let stringData = decoder.decodeWithStream(intBuffer);
      expect(JSON.parse(stringData)[TEST_POLICY_NAME]).assertEqual(JSON.parse(TEST_POLICY_VALUE_OVERRIDE));
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  })

  /**
   * @tc.name   test_setManagedBrowserPolicy_1300
   * @tc.number SUB_CUSTOMIZATION_EDM_SETMANAGEDBROWSERPOLICY_1300
   * @tc.desc   test setManagedBrowserPolicy method with empty policyValue to cancel policy
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_setManagedBrowserPolicy_1300", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      browser.setManagedBrowserPolicy(SELFHAPNAME, TEST_POLICY_NAME, TEST_POLICY_VALUE);
      browser.setManagedBrowserPolicy(SELFHAPNAME, TEST_POLICY_NAME, "");
      let buffer: ArrayBuffer = browser.getManagedBrowserPolicy(SELFWANT, SELFHAPNAME);
      let intBuffer = new Uint8Array(buffer);
      let decoder = util.TextDecoder.create('utf-8');
      let stringData = decoder.decodeWithStream(intBuffer);
      expect(JSON.parse(stringData)[TEST_POLICY_NAME]).assertEqual(undefined);
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  })
}
