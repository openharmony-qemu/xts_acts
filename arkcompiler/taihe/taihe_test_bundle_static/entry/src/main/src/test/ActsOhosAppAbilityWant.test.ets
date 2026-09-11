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
import * as test_bundle from '../ets/ohos_app_ability_want'

let domain: int = 0x0000;
let tag: string = 'testTag';
let bundleName: string = "ohos.bundle";
let arrString: string[] = ["this", "is", "bundle"];

class A {
  constructor() {}
}

export default function ohosAppAbilityWantTest(): void {
  describe("ActsOhosAppAbilityWantTest", (): void => {
    try {
      loadLibrary("entry")
    } catch (e) {
      console.log('loadFailed', e.message);
    }

    /**
     * @tc.number    SUB_Taihe_Want_Static_0100
     * @tc.name      test_want_bundleName_noSet_0001
     * @tc.desc      Test Want bundleName getter when not set
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_want_bundleName_noSet_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_want_bundleName_noSet_0001 start');
      let wantTest = new test_bundle.Want();
      expect(wantTest.bundleName).assertUndefined();
      console.log('test_want_bundleName_noSet_0001 done');
      done();
      console.log('test_want_bundleName_noSet_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Want_Static_0200
     * @tc.name      test_want_bundleName_0001
     * @tc.desc      Test Want bundleName setter and getter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_want_bundleName_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_want_bundleName_0001 start');
      let wantTest = new test_bundle.Want();
      wantTest.bundleName = bundleName;
      expect(wantTest.bundleName).assertEqual(bundleName);
      console.log('test_want_bundleName_0001 done');
      done();
      console.log('test_want_bundleName_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Want_Static_0300
     * @tc.name      test_want_abilityName_noSet_0001
     * @tc.desc      Test Want abilityName getter when not set
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_want_abilityName_noSet_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_want_abilityName_noSet_0001 start');
      let wantTest = new test_bundle.Want();
      expect(wantTest.abilityName).assertUndefined();
      console.log('test_want_abilityName_noSet_0001 done');
      done();
      console.log('test_want_abilityName_noSet_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Want_Static_0400
     * @tc.name      test_want_abilityName_0001
     * @tc.desc      Test Want abilityName setter and getter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_want_abilityName_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_want_abilityName_0001 start');
      let wantTest = new test_bundle.Want();
      wantTest.abilityName = bundleName;
      expect(wantTest.abilityName).assertEqual(bundleName);
      console.log('test_want_abilityName_0001 done');
      done();
      console.log('test_want_abilityName_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Want_Static_0500
     * @tc.name      test_want_deviceId_noSet_0001
     * @tc.desc      Test Want deviceId getter when not set
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_want_deviceId_noSet_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_want_deviceId_noSet_0001 start');
      let wantTest = new test_bundle.Want();
      expect(wantTest.deviceId).assertUndefined();
      console.log('test_want_deviceId_noSet_0001 done');
      done();
      console.log('test_want_deviceId_noSet_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Want_Static_0600
     * @tc.name      test_want_deviceId_0001
     * @tc.desc      Test Want deviceId setter and getter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_want_deviceId_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_want_deviceId_0001 start');
      let wantTest = new test_bundle.Want();
      wantTest.deviceId = bundleName;
      expect(wantTest.deviceId).assertEqual(bundleName);
      console.log('test_want_deviceId_0001 done');
      done();
      console.log('test_want_deviceId_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Want_Static_0700
     * @tc.name      test_want_uri_noSet_0001
     * @tc.desc      Test Want uri getter when not set
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_want_uri_noSet_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_want_uri_noSet_0001 start');
      let wantTest = new test_bundle.Want();
      expect(wantTest.uri).assertUndefined();
      console.log('test_want_uri_noSet_0001 done');
      done();
      console.log('test_want_uri_noSet_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Want_Static_0800
     * @tc.name      test_want_uri_0001
     * @tc.desc      Test Want uri setter and getter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_want_uri_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_want_uri_0001 start');
      let wantTest = new test_bundle.Want();
      wantTest.uri = bundleName;
      expect(wantTest.uri).assertEqual(bundleName);
      console.log('test_want_uri_0001 done');
      done();
      console.log('test_want_uri_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Want_Static_0900
     * @tc.name      test_want_type_noSet_0001
     * @tc.desc      Test Want type getter when not set
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_want_type_noSet_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_want_type_noSet_0001 start');
      let wantTest = new test_bundle.Want();
      expect(wantTest.type).assertUndefined();
      console.log('test_want_type_noSet_0001 done');
      done();
      console.log('test_want_type_noSet_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Want_Static_1000
     * @tc.name      test_want_type_0001
     * @tc.desc      Test Want type setter and getter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_want_type_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_want_type_0001 start');
      let wantTest = new test_bundle.Want();
      wantTest.type = bundleName;
      expect(wantTest.type).assertEqual(bundleName);
      console.log('test_want_type_0001 done');
      done();
      console.log('test_want_type_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Want_Static_1100
     * @tc.name      test_want_action_noSet_0001
     * @tc.desc      Test Want action getter when not set
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_want_action_noSet_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_want_action_noSet_0001 start');
      let wantTest = new test_bundle.Want();
      expect(wantTest.action).assertUndefined();
      console.log('test_want_action_noSet_0001 done');
      done();
      console.log('test_want_action_noSet_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Want_Static_1200
     * @tc.name      test_want_action_0001
     * @tc.desc      Test Want action setter and getter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_want_action_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_want_action_0001 start');
      let wantTest = new test_bundle.Want();
      wantTest.action = bundleName;
      expect(wantTest.action).assertEqual(bundleName);
      console.log('test_want_action_0001 done');
      done();
      console.log('test_want_action_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Want_Static_1300
     * @tc.name      test_want_entities_noSet_0001
     * @tc.desc      Test Want entities getter when not set
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_want_entities_noSet_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_want_entities_noSet_0001 start');
      let wantTest = new test_bundle.Want();
      expect(wantTest.entities).assertUndefined();
      console.log('test_want_entities_noSet_0001 done');
      done();
      console.log('test_want_entities_noSet_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Want_Static_1400
     * @tc.name      test_want_entities_0001
     * @tc.desc      Test Want entities setter and getter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_want_entities_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_want_entities_0001 start');
      let wantTest = new test_bundle.Want();
      wantTest.entities = arrString;
      expect(wantTest.entities?.[0]).assertEqual(arrString[0]);
      console.log('test_want_entities_0001 done');
      done();
      console.log('test_want_entities_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Want_Static_1500
     * @tc.name      test_want_moduleName_noSet_0001
     * @tc.desc      Test Want moduleName getter when not set
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_want_moduleName_noSet_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_want_moduleName_noSet_0001 start');
      let wantTest = new test_bundle.Want();
      expect(wantTest.moduleName).assertUndefined();
      console.log('test_want_moduleName_noSet_0001 done');
      done();
      console.log('test_want_moduleName_noSet_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Want_Static_1600
     * @tc.name      test_want_moduleName_0001
     * @tc.desc      Test Want moduleName setter and getter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_want_moduleName_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_want_moduleName_0001 start');
      let wantTest = new test_bundle.Want();
      wantTest.moduleName = bundleName;
      expect(wantTest.moduleName).assertEqual(bundleName);
      console.log('test_want_moduleName_0001 done');
      done();
      console.log('test_want_moduleName_0001 end');
    });
  })
}