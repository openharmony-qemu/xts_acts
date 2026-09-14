'use static';
/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, it, expect, TestType, Size, Level } from "../../../hypium/index";
import hilog from '@ohos.hilog'
import Utils from './Util.test';
import * as test_bundle from '../ets/elementName'

let domain: int = 0x0000;
let tag: string = 'testTag';

export default function elementNameTest(): void {
  describe("ActsElementNameTest", (): void => {
    try {
      loadLibrary("entry")
    } catch (e) {
      console.log('loadFailed', e.message);
    }

    /**
     * @tc.number    SUB_Taihe_ElementName_Static_0100
     * @tc.name      test_elementName_deviceId_0001
     * @tc.desc      Test ElementName deviceId setter and getter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_elementName_deviceId_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_elementName_deviceId_0001 start');
      let eleName = test_bundle.getElementName();
      eleName.deviceId = "DI0428";
      expect(eleName.deviceId).assertEqual("DI0428");
      console.log('test_elementName_deviceId_0001 done');
      done();
      console.log('test_elementName_deviceId_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_ElementName_Static_0200
     * @tc.name      test_elementName_bundleName_0001
     * @tc.desc      Test ElementName bundleName setter and getter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_elementName_bundleName_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_elementName_bundleName_0001 start');
      let eleName = test_bundle.getElementName();
      eleName.bundleName = "BN0428";
      expect(eleName.bundleName).assertEqual("BN0428");
      console.log('test_elementName_bundleName_0001 done');
      done();
      console.log('test_elementName_bundleName_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_ElementName_Static_0300
     * @tc.name      test_elementName_moduleName_0001
     * @tc.desc      Test ElementName moduleName setter and getter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_elementName_moduleName_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_elementName_moduleName_0001 start');
      let eleName = test_bundle.getElementName();
      eleName.moduleName = "MN0428";
      expect(eleName.moduleName).assertEqual("MN0428");
      console.log('test_elementName_moduleName_0001 done');
      done();
      console.log('test_elementName_moduleName_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_ElementName_Static_0400
     * @tc.name      test_elementName_abilityName_0001
     * @tc.desc      Test ElementName abilityName setter and getter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_elementName_abilityName_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_elementName_abilityName_0001 start');
      let eleName = test_bundle.getElementName();
      eleName.abilityName = "AN0428";
      expect(eleName.abilityName).assertEqual("AN0428");
      console.log('test_elementName_abilityName_0001 done');
      done();
      console.log('test_elementName_abilityName_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_ElementName_Static_0500
     * @tc.name      test_elementName_uri_0001
     * @tc.desc      Test ElementName uri setter and getter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_elementName_uri_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_elementName_uri_0001 start');
      let eleName = test_bundle.getElementName();
      eleName.uri = "Uri0428";
      expect(eleName.uri).assertEqual("Uri0428");
      console.log('test_elementName_uri_0001 done');
      done();
      console.log('test_elementName_uri_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_ElementName_Static_0600
     * @tc.name      test_elementName_shortName_0001
     * @tc.desc      Test ElementName shortName setter and getter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_elementName_shortName_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_elementName_shortName_0001 start');
      let eleName = test_bundle.getElementName();
      eleName.shortName = "SN0428";
      expect(eleName.shortName).assertEqual("SN0428");
      console.log('test_elementName_shortName_0001 done');
      done();
      console.log('test_elementName_shortName_0001 end');
    });
  })
}