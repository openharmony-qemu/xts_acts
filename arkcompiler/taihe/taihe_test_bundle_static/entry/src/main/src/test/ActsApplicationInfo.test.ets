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

import { describe, it, expect, TestType, Size, Level } from "@ohos/hypium-static/src/main/indexStatic";
import hilog from '@ohos.hilog'
import Utils from './Util.test';
import * as test_bundle from '../ets/applicationInfo'

let domain: int = 0x0000;
let tag: string = 'testTag';

export default function applicationInfoTest(): void {
  describe("ActsApplicationInfoTest", (): void => {
    try {
      loadLibrary("entry")
    } catch (e) {
      console.log('loadFailed', e.message);
    }

    /**
     * @tc.number    SUB_Taihe_ApplicationInfo_Static_0100
     * @tc.name      test_applicationInfo_name_0001
     * @tc.desc      Test ApplicationInfo name getter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_applicationInfo_name_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_applicationInfo_name_0001 start');
      let appInfo = test_bundle.getApplicationInfo();
      expect(appInfo.name).assertEqual("ApplicationInfo::getName");
      console.log('test_applicationInfo_name_0001 done');
      done();
      console.log('test_applicationInfo_name_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_ApplicationInfo_Static_0200
     * @tc.name      test_applicationInfo_description_0001
     * @tc.desc      Test ApplicationInfo description getter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_applicationInfo_description_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_applicationInfo_description_0001 start');
      let appInfo = test_bundle.getApplicationInfo();
      expect(appInfo.description).assertEqual("ApplicationInfo::getDescription");
      console.log('test_applicationInfo_description_0001 done');
      done();
      console.log('test_applicationInfo_description_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_ApplicationInfo_Static_0300
     * @tc.name      test_applicationInfo_descriptionId_0001
     * @tc.desc      Test ApplicationInfo descriptionId getter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_applicationInfo_descriptionId_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_applicationInfo_descriptionId_0001 start');
      let appInfo = test_bundle.getApplicationInfo();
      expect(appInfo.descriptionId).assertEqual(102);
      console.log('test_applicationInfo_descriptionId_0001 done');
      done();
      console.log('test_applicationInfo_descriptionId_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_ApplicationInfo_Static_0400
     * @tc.name      test_applicationInfo_systemApp_0001
     * @tc.desc      Test ApplicationInfo systemApp getter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_applicationInfo_systemApp_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_applicationInfo_systemApp_0001 start');
      let appInfo = test_bundle.getApplicationInfo();
      expect(appInfo.systemApp).assertTrue();
      console.log('test_applicationInfo_systemApp_0001 done');
      done();
      console.log('test_applicationInfo_systemApp_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_ApplicationInfo_Static_0500
     * @tc.name      test_applicationInfo_enabled_0001
     * @tc.desc      Test ApplicationInfo enabled getter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_applicationInfo_enabled_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_applicationInfo_enabled_0001 start');
      let appInfo = test_bundle.getApplicationInfo();
      expect(appInfo.enabled).assertTrue();
      console.log('test_applicationInfo_enabled_0001 done');
      done();
      console.log('test_applicationInfo_enabled_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_ApplicationInfo_Static_0600
     * @tc.name      test_applicationInfo_label_0001
     * @tc.desc      Test ApplicationInfo label getter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_applicationInfo_label_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_applicationInfo_label_0001 start');
      let appInfo = test_bundle.getApplicationInfo();
      expect(appInfo.label).assertEqual("ApplicationInfo::getLabel");
      console.log('test_applicationInfo_label_0001 done');
      done();
      console.log('test_applicationInfo_label_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_ApplicationInfo_Static_0700
     * @tc.name      test_applicationInfo_labelId_0001
     * @tc.desc      Test ApplicationInfo labelId getter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_applicationInfo_labelId_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_applicationInfo_labelId_0001 start');
      let appInfo = test_bundle.getApplicationInfo();
      expect(appInfo.labelId).assertEqual("ApplicationInfo::getLabelId");
      console.log('test_applicationInfo_labelId_0001 done');
      done();
      console.log('test_applicationInfo_labelId_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_ApplicationInfo_Static_0800
     * @tc.name      test_applicationInfo_icon_0001
     * @tc.desc      Test ApplicationInfo icon getter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_applicationInfo_icon_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_applicationInfo_icon_0001 start');
      let appInfo = test_bundle.getApplicationInfo();
      expect(appInfo.icon).assertEqual("ApplicationInfo::getIcon");
      console.log('test_applicationInfo_icon_0001 done');
      done();
      console.log('test_applicationInfo_icon_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_ApplicationInfo_Static_0900
     * @tc.name      test_applicationInfo_iconId_0001
     * @tc.desc      Test ApplicationInfo iconId getter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_applicationInfo_iconId_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_applicationInfo_iconId_0001 start');
      let appInfo = test_bundle.getApplicationInfo();
      expect(appInfo.iconId).assertEqual(102);
      console.log('test_applicationInfo_iconId_0001 done');
      done();
      console.log('test_applicationInfo_iconId_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_ApplicationInfo_Static_1000
     * @tc.name      test_applicationInfo_process_0001
     * @tc.desc      Test ApplicationInfo process getter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_applicationInfo_process_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_applicationInfo_process_0001 start');
      let appInfo = test_bundle.getApplicationInfo();
      expect(appInfo.process).assertEqual("ApplicationInfo::getProcess");
      console.log('test_applicationInfo_process_0001 done');
      done();
      console.log('test_applicationInfo_process_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_ApplicationInfo_Static_1100
     * @tc.name      test_applicationInfo_supportedModes_0001
     * @tc.desc      Test ApplicationInfo supportedModes getter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_applicationInfo_supportedModes_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_applicationInfo_supportedModes_0001 start');
      let appInfo = test_bundle.getApplicationInfo();
      expect(appInfo.supportedModes).assertEqual(102);
      console.log('test_applicationInfo_supportedModes_0001 done');
      done();
      console.log('test_applicationInfo_supportedModes_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_ApplicationInfo_Static_1200
     * @tc.name      test_applicationInfo_moduleSourceDirs_0001
     * @tc.desc      Test ApplicationInfo moduleSourceDirs getter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_applicationInfo_moduleSourceDirs_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_applicationInfo_moduleSourceDirs_0001 start');
      let appInfo = test_bundle.getApplicationInfo();
      expect(appInfo.moduleSourceDirs[0]).assertEqual("ApplicationInfo::getProcess");
      console.log('test_applicationInfo_moduleSourceDirs_0001 done');
      done();
      console.log('test_applicationInfo_moduleSourceDirs_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_ApplicationInfo_Static_1300
     * @tc.name      test_applicationInfo_permissions_0001
     * @tc.desc      Test ApplicationInfo permissions getter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_applicationInfo_permissions_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_applicationInfo_permissions_0001 start');
      let appInfo = test_bundle.getApplicationInfo();
      expect(appInfo.permissions[0]).assertEqual("ApplicationInfo::getPermissions");
      console.log('test_applicationInfo_permissions_0001 done');
      done();
      console.log('test_applicationInfo_permissions_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_ApplicationInfo_Static_1400
     * @tc.name      test_applicationInfo_entryDir_0001
     * @tc.desc      Test ApplicationInfo entryDir getter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_applicationInfo_entryDir_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_applicationInfo_entryDir_0001 start');
      let appInfo = test_bundle.getApplicationInfo();
      expect(appInfo.entryDir).assertEqual("ApplicationInfo::getEntryDir");
      console.log('test_applicationInfo_entryDir_0001 done');
      done();
      console.log('test_applicationInfo_entryDir_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_ApplicationInfo_Static_1500
     * @tc.name      test_applicationInfo_codePath_0001
     * @tc.desc      Test ApplicationInfo codePath getter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_applicationInfo_codePath_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_applicationInfo_codePath_0001 start');
      let appInfo = test_bundle.getApplicationInfo();
      expect(appInfo.codePath).assertEqual("ApplicationInfo::getCodePath");
      console.log('test_applicationInfo_codePath_0001 done');
      done();
      console.log('test_applicationInfo_codePath_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_ApplicationInfo_Static_1600
     * @tc.name      test_applicationInfo_removable_0001
     * @tc.desc      Test ApplicationInfo removable getter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_applicationInfo_removable_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_applicationInfo_removable_0001 start');
      let appInfo = test_bundle.getApplicationInfo();
      expect(appInfo.removable).assertTrue();
      console.log('test_applicationInfo_removable_0001 done');
      done();
      console.log('test_applicationInfo_removable_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_ApplicationInfo_Static_1700
     * @tc.name      test_applicationInfo_accessTokenId_0001
     * @tc.desc      Test ApplicationInfo accessTokenId getter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_applicationInfo_accessTokenId_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_applicationInfo_accessTokenId_0001 start');
      let appInfo = test_bundle.getApplicationInfo();
      expect(appInfo.accessTokenId).assertEqual(102);
      console.log('test_applicationInfo_accessTokenId_0001 done');
      done();
      console.log('test_applicationInfo_accessTokenId_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_ApplicationInfo_Static_1800
     * @tc.name      test_applicationInfo_uid_0001
     * @tc.desc      Test ApplicationInfo uid getter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_applicationInfo_uid_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_applicationInfo_uid_0001 start');
      let appInfo = test_bundle.getApplicationInfo();
      expect(appInfo.uid).assertEqual(102);
      console.log('test_applicationInfo_uid_0001 done');
      done();
      console.log('test_applicationInfo_uid_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_ApplicationInfo_Static_1900
     * @tc.name      test_applicationInfo_entityType_0001
     * @tc.desc      Test ApplicationInfo entityType getter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_applicationInfo_entityType_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_applicationInfo_entityType_0001 start');
      let appInfo = test_bundle.getApplicationInfo();
      expect(appInfo.entityType).assertEqual("ApplicationInfo::getEntityType");
      console.log('test_applicationInfo_entityType_0001 done');
      done();
      console.log('test_applicationInfo_entityType_0001 end');
    });
  })
}