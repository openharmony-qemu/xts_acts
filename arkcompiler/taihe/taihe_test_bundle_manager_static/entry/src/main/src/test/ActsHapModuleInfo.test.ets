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
import * as test_bundle from '../ets/hapModuleInfo'

let domain: int = 0x0000;
let tag: string = 'testTag';

export default function hapModuleInfoTest(): void {
  describe("ActsHapModuleInfoTest", (): void => {
    try {
      loadLibrary("entry")
    } catch (e) {
      console.log('loadFailed', e.message);
    }

    /**
     * @tc.number    SUB_Taihe_HapModuleInfo_Static_0100
     * @tc.name      test_hapModuleInfo_name_0001
     * @tc.desc      Test HapModuleInfo name getter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_hapModuleInfo_name_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_hapModuleInfo_name_0001 start');
      let hapInfo = test_bundle.getHapModuleInfo();
      expect(hapInfo.name).assertEqual("HapModuleInfoImpl::getName");
      console.log('test_hapModuleInfo_name_0001 done');
      done();
      console.log('test_hapModuleInfo_name_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_HapModuleInfo_Static_0200
     * @tc.name      test_hapModuleInfo_icon_0001
     * @tc.desc      Test HapModuleInfo icon getter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_hapModuleInfo_icon_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_hapModuleInfo_icon_0001 start');
      let hapInfo = test_bundle.getHapModuleInfo();
      expect(hapInfo.icon).assertEqual("HapModuleInfoImpl::getIcon");
      console.log('test_hapModuleInfo_icon_0001 done');
      done();
      console.log('test_hapModuleInfo_icon_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_HapModuleInfo_Static_0300
     * @tc.name      test_hapModuleInfo_iconId_0001
     * @tc.desc      Test HapModuleInfo iconId getter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_hapModuleInfo_iconId_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_hapModuleInfo_iconId_0001 start');
      let hapInfo = test_bundle.getHapModuleInfo();
      expect(hapInfo.iconId).assertEqual(21474);
      console.log('test_hapModuleInfo_iconId_0001 done');
      done();
      console.log('test_hapModuleInfo_iconId_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_HapModuleInfo_Static_0400
     * @tc.name      test_hapModuleInfo_label_0001
     * @tc.desc      Test HapModuleInfo label getter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_hapModuleInfo_label_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_hapModuleInfo_label_0001 start');
      let hapInfo = test_bundle.getHapModuleInfo();
      expect(hapInfo.label).assertEqual("HapModuleInfoImpl::getLabel");
      console.log('test_hapModuleInfo_label_0001 done');
      done();
      console.log('test_hapModuleInfo_label_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_HapModuleInfo_Static_0500
     * @tc.name      test_hapModuleInfo_labelId_0001
     * @tc.desc      Test HapModuleInfo labelId getter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_hapModuleInfo_labelId_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_hapModuleInfo_labelId_0001 start');
      let hapInfo = test_bundle.getHapModuleInfo();
      expect(hapInfo.labelId).assertEqual(21474);
      console.log('test_hapModuleInfo_labelId_0001 done');
      done();
      console.log('test_hapModuleInfo_labelId_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_HapModuleInfo_Static_0600
     * @tc.name      test_hapModuleInfo_description_0001
     * @tc.desc      Test HapModuleInfo description getter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_hapModuleInfo_description_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_hapModuleInfo_description_0001 start');
      let hapInfo = test_bundle.getHapModuleInfo();
      expect(hapInfo.description).assertEqual("HapModuleInfoImpl::getDescription");
      console.log('test_hapModuleInfo_description_0001 done');
      done();
      console.log('test_hapModuleInfo_description_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_HapModuleInfo_Static_0700
     * @tc.name      test_hapModuleInfo_descriptionId_0001
     * @tc.desc      Test HapModuleInfo descriptionId getter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_hapModuleInfo_descriptionId_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_hapModuleInfo_descriptionId_0001 start');
      let hapInfo = test_bundle.getHapModuleInfo();
      expect(hapInfo.descriptionId).assertEqual(21474);
      console.log('test_hapModuleInfo_descriptionId_0001 done');
      done();
      console.log('test_hapModuleInfo_descriptionId_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_HapModuleInfo_Static_0800
     * @tc.name      test_hapModuleInfo_mainElementName_0001
     * @tc.desc      Test HapModuleInfo mainElementName getter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_hapModuleInfo_mainElementName_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_hapModuleInfo_mainElementName_0001 start');
      let hapInfo = test_bundle.getHapModuleInfo();
      expect(hapInfo.mainElementName).assertEqual("HapModuleInfoImpl::getMainElementName");
      console.log('test_hapModuleInfo_mainElementName_0001 done');
      done();
      console.log('test_hapModuleInfo_mainElementName_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_HapModuleInfo_Static_0900
     * @tc.name      test_hapModuleInfo_deviceTypes_0001
     * @tc.desc      Test HapModuleInfo deviceTypes getter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_hapModuleInfo_deviceTypes_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_hapModuleInfo_deviceTypes_0001 start');
      let hapInfo = test_bundle.getHapModuleInfo();
      expect(hapInfo.deviceTypes[0]).assertEqual("HapModuleInfoImpl::getDeviceTypes");
      console.log('test_hapModuleInfo_deviceTypes_0001 done');
      done();
      console.log('test_hapModuleInfo_deviceTypes_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_HapModuleInfo_Static_1000
     * @tc.name      test_hapModuleInfo_installationFree_0001
     * @tc.desc      Test HapModuleInfo installationFree getter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_hapModuleInfo_installationFree_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_hapModuleInfo_installationFree_0001 start');
      let hapInfo = test_bundle.getHapModuleInfo();
      expect(hapInfo.installationFree).assertTrue();
      console.log('test_hapModuleInfo_installationFree_0001 done');
      done();
      console.log('test_hapModuleInfo_installationFree_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_HapModuleInfo_Static_1100
     * @tc.name      test_hapModuleInfo_hashValue_0001
     * @tc.desc      Test HapModuleInfo hashValue getter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_hapModuleInfo_hashValue_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_hapModuleInfo_hashValue_0001 start');
      let hapInfo = test_bundle.getHapModuleInfo();
      expect(hapInfo.hashValue).assertEqual("HapModuleInfoImpl::getHashValue");
      console.log('test_hapModuleInfo_hashValue_0001 done');
      done();
      console.log('test_hapModuleInfo_hashValue_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_HapModuleInfo_Static_1200
     * @tc.name      test_hapModuleInfo_fileContextMenuConfig_0001
     * @tc.desc      Test HapModuleInfo fileContextMenuConfig getter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_hapModuleInfo_fileContextMenuConfig_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_hapModuleInfo_fileContextMenuConfig_0001 start');
      let hapInfo = test_bundle.getHapModuleInfo();
      expect(hapInfo.fileContextMenuConfig).assertEqual("HapModuleInfoImpl::getFileContextMenuConfig");
      console.log('test_hapModuleInfo_fileContextMenuConfig_0001 done');
      done();
      console.log('test_hapModuleInfo_fileContextMenuConfig_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_HapModuleInfo_Static_1300
     * @tc.name      test_hapModuleInfo_nativeLibraryPath_0001
     * @tc.desc      Test HapModuleInfo nativeLibraryPath getter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_hapModuleInfo_nativeLibraryPath_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_hapModuleInfo_nativeLibraryPath_0001 start');
      let hapInfo = test_bundle.getHapModuleInfo();
      expect(hapInfo.nativeLibraryPath).assertEqual("HapModuleInfoImpl::getNativeLibraryPath");
      console.log('test_hapModuleInfo_nativeLibraryPath_0001 done');
      done();
      console.log('test_hapModuleInfo_nativeLibraryPath_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_HapModuleInfo_Static_1400
     * @tc.name      test_hapModuleInfo_codePath_0001
     * @tc.desc      Test HapModuleInfo codePath getter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_hapModuleInfo_codePath_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_hapModuleInfo_codePath_0001 start');
      let hapInfo = test_bundle.getHapModuleInfo();
      expect(hapInfo.codePath).assertEqual("HapModuleInfoImpl::getCodePath");
      console.log('test_hapModuleInfo_codePath_0001 done');
      done();
      console.log('test_hapModuleInfo_codePath_0001 end');
    });
  })
}