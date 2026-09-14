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
import * as test_bundle from '../ets/abilityInfo'

let domain: int = 0x0000;
let tag: string = 'testTag';

export default function abilityInfoTest(): void {
  describe("ActsAbilityInfoTest", (): void => {
    try {
      loadLibrary("entry")
    } catch (e) {
      console.log('loadFailed', e.message);
    }

    /**
     * @tc.number    SUB_Taihe_AbilityInfo_Static_0100
     * @tc.name      test_abilityInfo_bundleName_0001
     * @tc.desc      Test AbilityInfo bundleName getter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_abilityInfo_bundleName_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_abilityInfo_bundleName_0001 start');
      let abInfo = test_bundle.getAbilityInfo();
      expect(abInfo.bundleName).assertEqual("AbilityInfo::getBundleName");
      console.log('test_abilityInfo_bundleName_0001 done');
      done();
      console.log('test_abilityInfo_bundleName_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_AbilityInfo_Static_0200
     * @tc.name      test_abilityInfo_name_0001
     * @tc.desc      Test AbilityInfo name getter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_abilityInfo_name_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_abilityInfo_name_0001 start');
      let abInfo = test_bundle.getAbilityInfo();
      expect(abInfo.name).assertEqual("AbilityInfo::getName");
      console.log('test_abilityInfo_name_0001 done');
      done();
      console.log('test_abilityInfo_name_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_AbilityInfo_Static_0300
     * @tc.name      test_abilityInfo_label_0001
     * @tc.desc      Test AbilityInfo label getter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_abilityInfo_label_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_abilityInfo_label_0001 start');
      let abInfo = test_bundle.getAbilityInfo();
      expect(abInfo.label).assertEqual("AbilityInfo::getLabel");
      console.log('test_abilityInfo_label_0001 done');
      done();
      console.log('test_abilityInfo_label_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_AbilityInfo_Static_0400
     * @tc.name      test_abilityInfo_description_0001
     * @tc.desc      Test AbilityInfo description getter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_abilityInfo_description_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_abilityInfo_description_0001 start');
      let abInfo = test_bundle.getAbilityInfo();
      expect(abInfo.description).assertEqual("AbilityInfo::getDescription");
      console.log('test_abilityInfo_description_0001 done');
      done();
      console.log('test_abilityInfo_description_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_AbilityInfo_Static_0500
     * @tc.name      test_abilityInfo_icon_0001
     * @tc.desc      Test AbilityInfo icon getter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_abilityInfo_icon_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_abilityInfo_icon_0001 start');
      let abInfo = test_bundle.getAbilityInfo();
      expect(abInfo.icon).assertEqual("AbilityInfo::getIcon");
      console.log('test_abilityInfo_icon_0001 done');
      done();
      console.log('test_abilityInfo_icon_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_AbilityInfo_Static_0600
     * @tc.name      test_abilityInfo_labelId_0001
     * @tc.desc      Test AbilityInfo labelId getter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_abilityInfo_labelId_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_abilityInfo_labelId_0001 start');
      let abInfo = test_bundle.getAbilityInfo();
      expect(abInfo.labelId).assertEqual(100);
      console.log('test_abilityInfo_labelId_0001 done');
      done();
      console.log('test_abilityInfo_labelId_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_AbilityInfo_Static_0700
     * @tc.name      test_abilityInfo_descriptionId_0001
     * @tc.desc      Test AbilityInfo descriptionId getter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_abilityInfo_descriptionId_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_abilityInfo_descriptionId_0001 start');
      let abInfo = test_bundle.getAbilityInfo();
      expect(abInfo.descriptionId).assertEqual(100);
      console.log('test_abilityInfo_descriptionId_0001 done');
      done();
      console.log('test_abilityInfo_descriptionId_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_AbilityInfo_Static_0800
     * @tc.name      test_abilityInfo_iconId_0001
     * @tc.desc      Test AbilityInfo iconId getter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_abilityInfo_iconId_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_abilityInfo_iconId_0001 start');
      let abInfo = test_bundle.getAbilityInfo();
      expect(abInfo.iconId).assertEqual(100);
      console.log('test_abilityInfo_iconId_0001 done');
      done();
      console.log('test_abilityInfo_iconId_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_AbilityInfo_Static_0900
     * @tc.name      test_abilityInfo_moduleName_0001
     * @tc.desc      Test AbilityInfo moduleName getter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_abilityInfo_moduleName_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_abilityInfo_moduleName_0001 start');
      let abInfo = test_bundle.getAbilityInfo();
      expect(abInfo.moduleName).assertEqual("AbilityInfo::getModuleName");
      console.log('test_abilityInfo_moduleName_0001 done');
      done();
      console.log('test_abilityInfo_moduleName_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_AbilityInfo_Static_1000
     * @tc.name      test_abilityInfo_process_0001
     * @tc.desc      Test AbilityInfo process getter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_abilityInfo_process_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_abilityInfo_process_0001 start');
      let abInfo = test_bundle.getAbilityInfo();
      expect(abInfo.process).assertEqual("AbilityInfo::getProcess");
      console.log('test_abilityInfo_process_0001 done');
      done();
      console.log('test_abilityInfo_process_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_AbilityInfo_Static_1100
     * @tc.name      test_abilityInfo_targetAbility_0001
     * @tc.desc      Test AbilityInfo targetAbility getter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_abilityInfo_targetAbility_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_abilityInfo_targetAbility_0001 start');
      let abInfo = test_bundle.getAbilityInfo();
      expect(abInfo.targetAbility).assertEqual("AbilityInfo::getTargetAbility");
      console.log('test_abilityInfo_targetAbility_0001 done');
      done();
      console.log('test_abilityInfo_targetAbility_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_AbilityInfo_Static_1200
     * @tc.name      test_abilityInfo_backgroundModes_0001
     * @tc.desc      Test AbilityInfo backgroundModes getter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_abilityInfo_backgroundModes_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_abilityInfo_backgroundModes_0001 start');
      let abInfo = test_bundle.getAbilityInfo();
      expect(abInfo.backgroundModes).assertEqual(100);
      console.log('test_abilityInfo_backgroundModes_0001 done');
      done();
      console.log('test_abilityInfo_backgroundModes_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_AbilityInfo_Static_1300
     * @tc.name      test_abilityInfo_isVisible_0001
     * @tc.desc      Test AbilityInfo isVisible getter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_abilityInfo_isVisible_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_abilityInfo_isVisible_0001 start');
      let abInfo = test_bundle.getAbilityInfo();
      expect(abInfo.isVisible).assertTrue();
      console.log('test_abilityInfo_isVisible_0001 done');
      done();
      console.log('test_abilityInfo_isVisible_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_AbilityInfo_Static_1400
     * @tc.name      test_abilityInfo_formEnabled_0001
     * @tc.desc      Test AbilityInfo formEnabled getter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_abilityInfo_formEnabled_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_abilityInfo_formEnabled_0001 start');
      let abInfo = test_bundle.getAbilityInfo();
      expect(abInfo.formEnabled).assertTrue();
      console.log('test_abilityInfo_formEnabled_0001 done');
      done();
      console.log('test_abilityInfo_formEnabled_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_AbilityInfo_Static_1500
     * @tc.name      test_abilityInfo_permissions_0001
     * @tc.desc      Test AbilityInfo permissions getter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_abilityInfo_permissions_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_abilityInfo_permissions_0001 start');
      let abInfo = test_bundle.getAbilityInfo();
      expect(abInfo.permissions[0]).assertEqual("AbilityInfo::getTargetAbility");
      console.log('test_abilityInfo_permissions_0001 done');
      done();
      console.log('test_abilityInfo_permissions_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_AbilityInfo_Static_1600
     * @tc.name      test_abilityInfo_deviceTypes_0001
     * @tc.desc      Test AbilityInfo deviceTypes getter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_abilityInfo_deviceTypes_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_abilityInfo_deviceTypes_0001 start');
      let abInfo = test_bundle.getAbilityInfo();
      expect(abInfo.deviceTypes[0]).assertEqual("AbilityInfo::getDeviceTypes");
      console.log('test_abilityInfo_deviceTypes_0001 done');
      done();
      console.log('test_abilityInfo_deviceTypes_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_AbilityInfo_Static_1700
     * @tc.name      test_abilityInfo_deviceCapabilities_0001
     * @tc.desc      Test AbilityInfo deviceCapabilities getter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_abilityInfo_deviceCapabilities_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_abilityInfo_deviceCapabilities_0001 start');
      let abInfo = test_bundle.getAbilityInfo();
      expect(abInfo.deviceCapabilities[0]).assertEqual("AbilityInfo::getDeviceCapabilities");
      console.log('test_abilityInfo_deviceCapabilities_0001 done');
      done();
      console.log('test_abilityInfo_deviceCapabilities_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_AbilityInfo_Static_1800
     * @tc.name      test_abilityInfo_readPermission_0001
     * @tc.desc      Test AbilityInfo readPermission getter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_abilityInfo_readPermission_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_abilityInfo_readPermission_0001 start');
      let abInfo = test_bundle.getAbilityInfo();
      expect(abInfo.readPermission).assertEqual("AbilityInfo::getReadPermission");
      console.log('test_abilityInfo_readPermission_0001 done');
      done();
      console.log('test_abilityInfo_readPermission_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_AbilityInfo_Static_1900
     * @tc.name      test_abilityInfo_writePermission_0001
     * @tc.desc      Test AbilityInfo writePermission getter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_abilityInfo_writePermission_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_abilityInfo_writePermission_0001 start');
      let abInfo = test_bundle.getAbilityInfo();
      expect(abInfo.writePermission).assertEqual("AbilityInfo::getWritePermission");
      console.log('test_abilityInfo_writePermission_0001 done');
      done();
      console.log('test_abilityInfo_writePermission_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_AbilityInfo_Static_2000
     * @tc.name      test_abilityInfo_uri_0001
     * @tc.desc      Test AbilityInfo uri getter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_abilityInfo_uri_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_abilityInfo_uri_0001 start');
      let abInfo = test_bundle.getAbilityInfo();
      expect(abInfo.uri).assertEqual("AbilityInfo::getUri");
      console.log('test_abilityInfo_uri_0001 done');
      done();
      console.log('test_abilityInfo_uri_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_AbilityInfo_Static_2100
     * @tc.name      test_abilityInfo_enabled_0001
     * @tc.desc      Test AbilityInfo enabled getter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_abilityInfo_enabled_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_abilityInfo_enabled_0001 start');
      let abInfo = test_bundle.getAbilityInfo();
      expect(abInfo.enabled).assertTrue();
      console.log('test_abilityInfo_enabled_0001 done');
      done();
      console.log('test_abilityInfo_enabled_0001 end');
    });
  })
}