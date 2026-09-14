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
import * as test_bundle from '../ets/extensionAbilityInfo'

let domain: int = 0x0000;
let tag: string = 'testTag';

export default function extensionAbilityInfoTest(): void {
  describe("ActsExtensionAbilityInfoTest", (): void => {
    try {
      loadLibrary("entry")
    } catch (e) {
      console.log('loadFailed', e.message);
    }

    /**
     * @tc.number    SUB_Taihe_ExtensionAbilityInfo_Static_0100
     * @tc.name      test_extensionAbilityInfo_bundleName_0001
     * @tc.desc      Test ExtensionAbilityInfo bundleName getter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_extensionAbilityInfo_bundleName_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_extensionAbilityInfo_bundleName_0001 start');
      let exAbiInfo = test_bundle.getExtensionAbilityInfo();
      expect(exAbiInfo.bundleName).assertEqual("ExtensionAbilityInfoImpl::getBundleName");
      console.log('test_extensionAbilityInfo_bundleName_0001 done');
      done();
      console.log('test_extensionAbilityInfo_bundleName_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_ExtensionAbilityInfo_Static_0200
     * @tc.name      test_extensionAbilityInfo_moduleName_0001
     * @tc.desc      Test ExtensionAbilityInfo moduleName getter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_extensionAbilityInfo_moduleName_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_extensionAbilityInfo_moduleName_0001 start');
      let exAbiInfo = test_bundle.getExtensionAbilityInfo();
      expect(exAbiInfo.moduleName).assertEqual("ExtensionAbilityInfoImpl::getModuleName");
      console.log('test_extensionAbilityInfo_moduleName_0001 done');
      done();
      console.log('test_extensionAbilityInfo_moduleName_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_ExtensionAbilityInfo_Static_0300
     * @tc.name      test_extensionAbilityInfo_name_0001
     * @tc.desc      Test ExtensionAbilityInfo name getter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_extensionAbilityInfo_name_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_extensionAbilityInfo_name_0001 start');
      let exAbiInfo = test_bundle.getExtensionAbilityInfo();
      expect(exAbiInfo.name).assertEqual("ExtensionAbilityInfoImpl::getName");
      console.log('test_extensionAbilityInfo_name_0001 done');
      done();
      console.log('test_extensionAbilityInfo_name_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_ExtensionAbilityInfo_Static_0400
     * @tc.name      test_extensionAbilityInfo_labelId_0001
     * @tc.desc      Test ExtensionAbilityInfo labelId getter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_extensionAbilityInfo_labelId_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_extensionAbilityInfo_labelId_0001 start');
      let exAbiInfo = test_bundle.getExtensionAbilityInfo();
      expect(exAbiInfo.labelId).assertEqual(21474);
      console.log('test_extensionAbilityInfo_labelId_0001 done');
      done();
      console.log('test_extensionAbilityInfo_labelId_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_ExtensionAbilityInfo_Static_0500
     * @tc.name      test_extensionAbilityInfo_descriptionId_0001
     * @tc.desc      Test ExtensionAbilityInfo descriptionId getter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_extensionAbilityInfo_descriptionId_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_extensionAbilityInfo_descriptionId_0001 start');
      let exAbiInfo = test_bundle.getExtensionAbilityInfo();
      expect(exAbiInfo.descriptionId).assertEqual(21474);
      console.log('test_extensionAbilityInfo_descriptionId_0001 done');
      done();
      console.log('test_extensionAbilityInfo_descriptionId_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_ExtensionAbilityInfo_Static_0600
     * @tc.name      test_extensionAbilityInfo_iconId_0001
     * @tc.desc      Test ExtensionAbilityInfo iconId getter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_extensionAbilityInfo_iconId_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_extensionAbilityInfo_iconId_0001 start');
      let exAbiInfo = test_bundle.getExtensionAbilityInfo();
      expect(exAbiInfo.iconId).assertEqual(21474);
      console.log('test_extensionAbilityInfo_iconId_0001 done');
      done();
      console.log('test_extensionAbilityInfo_iconId_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_ExtensionAbilityInfo_Static_0700
     * @tc.name      test_extensionAbilityInfo_exported_0001
     * @tc.desc      Test ExtensionAbilityInfo exported getter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_extensionAbilityInfo_exported_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_extensionAbilityInfo_exported_0001 start');
      let exAbiInfo = test_bundle.getExtensionAbilityInfo();
      expect(exAbiInfo.exported).assertTrue();
      console.log('test_extensionAbilityInfo_exported_0001 done');
      done();
      console.log('test_extensionAbilityInfo_exported_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_ExtensionAbilityInfo_Static_0800
     * @tc.name      test_extensionAbilityInfo_permissions_0001
     * @tc.desc      Test ExtensionAbilityInfo permissions getter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_extensionAbilityInfo_permissions_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_extensionAbilityInfo_permissions_0001 start');
      let exAbiInfo = test_bundle.getExtensionAbilityInfo();
      expect(exAbiInfo.permissions[0]).assertEqual("ExtensionAbilityInfoImpl::getPermissions");
      console.log('test_extensionAbilityInfo_permissions_0001 done');
      done();
      console.log('test_extensionAbilityInfo_permissions_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_ExtensionAbilityInfo_Static_0900
     * @tc.name      test_extensionAbilityInfo_enabled_0001
     * @tc.desc      Test ExtensionAbilityInfo enabled getter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_extensionAbilityInfo_enabled_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_extensionAbilityInfo_enabled_0001 start');
      let exAbiInfo = test_bundle.getExtensionAbilityInfo();
      expect(exAbiInfo.enabled).assertTrue();
      console.log('test_extensionAbilityInfo_enabled_0001 done');
      done();
      console.log('test_extensionAbilityInfo_enabled_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_ExtensionAbilityInfo_Static_1000
     * @tc.name      test_extensionAbilityInfo_readPermission_0001
     * @tc.desc      Test ExtensionAbilityInfo readPermission getter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_extensionAbilityInfo_readPermission_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_extensionAbilityInfo_readPermission_0001 start');
      let exAbiInfo = test_bundle.getExtensionAbilityInfo();
      expect(exAbiInfo.readPermission).assertEqual("ExtensionAbilityInfoImpl::getReadPermission");
      console.log('test_extensionAbilityInfo_readPermission_0001 done');
      done();
      console.log('test_extensionAbilityInfo_readPermission_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_ExtensionAbilityInfo_Static_1100
     * @tc.name      test_extensionAbilityInfo_writePermission_0001
     * @tc.desc      Test ExtensionAbilityInfo writePermission getter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_extensionAbilityInfo_writePermission_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_extensionAbilityInfo_writePermission_0001 start');
      let exAbiInfo = test_bundle.getExtensionAbilityInfo();
      expect(exAbiInfo.writePermission).assertEqual("ExtensionAbilityInfoImpl::getWritePermission");
      console.log('test_extensionAbilityInfo_writePermission_0001 done');
      done();
      console.log('test_extensionAbilityInfo_writePermission_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_ExtensionAbilityInfo_Static_1200
     * @tc.name      test_extensionAbilityInfo_appIndex_0001
     * @tc.desc      Test ExtensionAbilityInfo appIndex getter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_extensionAbilityInfo_appIndex_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_extensionAbilityInfo_appIndex_0001 start');
      let exAbiInfo = test_bundle.getExtensionAbilityInfo();
      expect(exAbiInfo.appIndex).assertEqual(21474);
      console.log('test_extensionAbilityInfo_appIndex_0001 done');
      done();
      console.log('test_extensionAbilityInfo_appIndex_0001 end');
    });
  })
}