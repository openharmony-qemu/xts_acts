/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
import common from '@ohos.enterprise.common';

export default function commonTest() {
  describe('common_test', () => {
    testIsFeatureSupported();
  })
}

function testIsFeatureSupported() {
  /**
   * @tc.name   test_isFeatureSupported_0100
   * @tc.number SUB_CUSTOMIZATION_EDM_IS_FEATURE_SUPPORTED_JS_0100
   * @tc.desc   test isFeatureSupported with null feature
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_isFeatureSupported_0100", Level.LEVEL2, async (done: Function) => {
    try {
      common.isFeatureSupported(null);
      expect(false).assertTrue();
    } catch (error) {
      console.info('test_isFeatureSupported_0100 error.code = ' + error.code);
      expect(error.code).assertEqual(401);
    }
    done();
  });

  /**
   * @tc.name   test_isFeatureSupported_0200
   * @tc.number SUB_CUSTOMIZATION_EDM_IS_FEATURE_SUPPORTED_JS_0200
   * @tc.desc   test isFeatureSupported with undefined feature
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_isFeatureSupported_0200", Level.LEVEL2, async (done: Function) => {
    try {
      common.isFeatureSupported(undefined);
      expect(false).assertTrue();
    } catch (error) {
      console.info('test_isFeatureSupported_0200 error.code = ' + error.code);
      expect(error.code).assertEqual(401);
    }
    done();
  });

  /**
   * @tc.name   test_isFeatureSupported_0300
   * @tc.number SUB_CUSTOMIZATION_EDM_IS_FEATURE_SUPPORTED_JS_0300
   * @tc.desc   test isFeatureSupported with LOCAL_HOTA_DOMAIN
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it("test_isFeatureSupported_0300", Level.LEVEL0, async (done: Function) => {
    try {
      let ret: boolean = common.isFeatureSupported(common.ManagedFeature.LOCAL_HOTA_DOMAIN);
      console.info('test_isFeatureSupported_0300 ret = ' + ret);
      if (ret) {
        expect(ret).assertTrue();
      } else {
        expect(ret).assertFalse();
      }
    } catch (error) {
      console.info('test_isFeatureSupported_0300 error.code = ' + error.code);
      expect(false).assertTrue();
    }
    done();
  });

  /**
   * @tc.name   test_isFeatureSupported_0400
   * @tc.number SUB_CUSTOMIZATION_EDM_IS_FEATURE_SUPPORTED_JS_0400
   * @tc.desc   test isFeatureSupported with USER_EXTEND_CREDENTIAL
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it("test_isFeatureSupported_0400", Level.LEVEL0, async (done: Function) => {
    try {
      let ret: boolean = common.isFeatureSupported(common.ManagedFeature.USER_EXTEND_CREDENTIAL);
      console.info('test_isFeatureSupported_0400 ret = ' + ret);
      if (ret) {
        expect(ret).assertTrue();
      } else {
        expect(ret).assertFalse();
      }
    } catch (error) {
      console.info('test_isFeatureSupported_0400 error.code = ' + error.code);
      expect(false).assertTrue();
    }
    done();
  });

  /**
   * @tc.name   test_isFeatureSupported_0500
   * @tc.number SUB_CUSTOMIZATION_EDM_IS_FEATURE_SUPPORTED_JS_0500
   * @tc.desc   test isFeatureSupported with DEVICE_SECURITY_LEVEL
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it("test_isFeatureSupported_0500", Level.LEVEL0, async (done: Function) => {
    try {
      let ret: boolean = common.isFeatureSupported(common.ManagedFeature.DEVICE_SECURITY_LEVEL);
      console.info('test_isFeatureSupported_0500 ret = ' + ret);
      if (ret) {
        expect(ret).assertTrue();
      } else {
        expect(ret).assertFalse();
      }
    } catch (error) {
      console.info('test_isFeatureSupported_0500 error.code = ' + error.code);
      expect(false).assertTrue();
    }
    done();
  });

  /**
   * @tc.name   test_isFeatureSupported_0600
   * @tc.number SUB_CUSTOMIZATION_EDM_IS_FEATURE_SUPPORTED_JS_0600
   * @tc.desc   test isFeatureSupported with PRINTER_IP_ADDRESS_POLICY
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it("test_isFeatureSupported_0600", Level.LEVEL0, async (done: Function) => {
    try {
      let ret: boolean = common.isFeatureSupported(common.ManagedFeature.PRINTER_IP_ADDRESS_POLICY);
      console.info('test_isFeatureSupported_0600 ret = ' + ret);
      if (ret) {
        expect(ret).assertTrue();
      } else {
        expect(ret).assertFalse();
      }
    } catch (error) {
      console.info('test_isFeatureSupported_0600 error.code = ' + error.code);
      expect(false).assertTrue();
    }
    done();
  });

  /**
   * @tc.name   test_isFeatureSupported_0700
   * @tc.number SUB_CUSTOMIZATION_EDM_IS_FEATURE_SUPPORTED_JS_0700
   * @tc.desc   test isFeatureSupported with feature out of range
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it("test_isFeatureSupported_0700", Level.LEVEL0, async (done: Function) => {
    try {
      let ret: boolean = common.isFeatureSupported(999);
      console.info('test_isFeatureSupported_0700 ret = ' + ret);
      expect(ret).assertFalse();
    } catch (error) {
      console.info('test_isFeatureSupported_0700 error.code = ' + error.code);
      expect(false).assertTrue();
    }
    done();
  });

  /**
   * @tc.name   test_isFeatureSupported_0800
   * @tc.number SUB_CUSTOMIZATION_EDM_IS_FEATURE_SUPPORTED_JS_0800
   * @tc.desc   test isFeatureSupported with negative feature
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it("test_isFeatureSupported_0800", Level.LEVEL0, async (done: Function) => {
    try {
      let ret: boolean = common.isFeatureSupported(-1);
      console.info('test_isFeatureSupported_0800 ret = ' + ret);
      expect(ret).assertFalse();
    } catch (error) {
      console.info('test_isFeatureSupported_0800 error.code = ' + error.code);
      expect(false).assertTrue();
    }
    done();
  });
}
