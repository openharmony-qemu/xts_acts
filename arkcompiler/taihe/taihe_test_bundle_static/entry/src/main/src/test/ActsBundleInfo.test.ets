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
import * as test_bundle from '../ets/bundleInfo'

let domain: int = 0x0000;
let tag: string = 'testTag';

export default function bundleInfoTest(): void {
  describe("ActsBundleInfoTest", (): void => {
    try {
      loadLibrary("entry")
    } catch (e) {
      console.log('loadFailed', e.message);
    }

    /**
     * @tc.number    SUB_Taihe_BundleInfo_Static_0100
     * @tc.name      test_bundleInfo_name_0001
     * @tc.desc      Test BundleInfo name getter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_bundleInfo_name_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_bundleInfo_name_0001 start');
      let bunInfo = test_bundle.getBundleInfo();
      expect(bunInfo.name).assertEqual("bundleInfo::getName");
      console.log('test_bundleInfo_name_0001 done');
      done();
      console.log('test_bundleInfo_name_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_BundleInfo_Static_0200
     * @tc.name      test_bundleInfo_type_0001
     * @tc.desc      Test BundleInfo type getter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_bundleInfo_type_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_bundleInfo_type_0001 start');
      let bunInfo = test_bundle.getBundleInfo();
      expect(bunInfo.type).assertEqual("bundleInfo::getType");
      console.log('test_bundleInfo_type_0001 done');
      done();
      console.log('test_bundleInfo_type_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_BundleInfo_Static_0300
     * @tc.name      test_bundleInfo_appId_0001
     * @tc.desc      Test BundleInfo appId getter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_bundleInfo_appId_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_bundleInfo_appId_0001 start');
      let bunInfo = test_bundle.getBundleInfo();
      expect(bunInfo.appId).assertEqual("bundleInfo::getAppId");
      console.log('test_bundleInfo_appId_0001 done');
      done();
      console.log('test_bundleInfo_appId_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_BundleInfo_Static_0400
     * @tc.name      test_bundleInfo_uid_0001
     * @tc.desc      Test BundleInfo uid getter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_bundleInfo_uid_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_bundleInfo_uid_0001 start');
      let bunInfo = test_bundle.getBundleInfo();
      expect(bunInfo.uid).assertEqual(127);
      console.log('test_bundleInfo_uid_0001 done');
      done();
      console.log('test_bundleInfo_uid_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_BundleInfo_Static_0500
     * @tc.name      test_bundleInfo_installTime_0001
     * @tc.desc      Test BundleInfo installTime getter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_bundleInfo_installTime_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_bundleInfo_installTime_0001 start');
      let bunInfo = test_bundle.getBundleInfo();
      expect(bunInfo.installTime).assertEqual(127);
      console.log('test_bundleInfo_installTime_0001 done');
      done();
      console.log('test_bundleInfo_installTime_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_BundleInfo_Static_0600
     * @tc.name      test_bundleInfo_updateTime_0001
     * @tc.desc      Test BundleInfo updateTime getter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_bundleInfo_updateTime_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_bundleInfo_updateTime_0001 start');
      let bunInfo = test_bundle.getBundleInfo();
      expect(bunInfo.updateTime).assertEqual(127);
      console.log('test_bundleInfo_updateTime_0001 done');
      done();
      console.log('test_bundleInfo_updateTime_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_BundleInfo_Static_0700
     * @tc.name      test_bundleInfo_reqPermissions_0001
     * @tc.desc      Test BundleInfo reqPermissions getter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_bundleInfo_reqPermissions_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_bundleInfo_reqPermissions_0001 start');
      let bunInfo = test_bundle.getBundleInfo();
      expect(bunInfo.reqPermissions[0]).assertEqual("bundleInfo::getReqPermissions");
      console.log('test_bundleInfo_reqPermissions_0001 done');
      done();
      console.log('test_bundleInfo_reqPermissions_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_BundleInfo_Static_0800
     * @tc.name      test_bundleInfo_vendor_0001
     * @tc.desc      Test BundleInfo vendor getter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_bundleInfo_vendor_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_bundleInfo_vendor_0001 start');
      let bunInfo = test_bundle.getBundleInfo();
      expect(bunInfo.vendor).assertEqual("bundleInfo::getVendor");
      console.log('test_bundleInfo_vendor_0001 done');
      done();
      console.log('test_bundleInfo_vendor_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_BundleInfo_Static_0900
     * @tc.name      test_bundleInfo_versionCode_0001
     * @tc.desc      Test BundleInfo versionCode getter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_bundleInfo_versionCode_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_bundleInfo_versionCode_0001 start');
      let bunInfo = test_bundle.getBundleInfo();
      expect(bunInfo.versionCode).assertEqual(127);
      console.log('test_bundleInfo_versionCode_0001 done');
      done();
      console.log('test_bundleInfo_versionCode_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_BundleInfo_Static_1000
     * @tc.name      test_bundleInfo_versionName_0001
     * @tc.desc      Test BundleInfo versionName getter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_bundleInfo_versionName_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_bundleInfo_versionName_0001 start');
      let bunInfo = test_bundle.getBundleInfo();
      expect(bunInfo.versionName).assertEqual("bundleInfo::getVersionName");
      console.log('test_bundleInfo_versionName_0001 done');
      done();
      console.log('test_bundleInfo_versionName_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_BundleInfo_Static_1100
     * @tc.name      test_bundleInfo_compatibleVersion_0001
     * @tc.desc      Test BundleInfo compatibleVersion getter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_bundleInfo_compatibleVersion_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_bundleInfo_compatibleVersion_0001 start');
      let bunInfo = test_bundle.getBundleInfo();
      expect(bunInfo.compatibleVersion).assertEqual(127);
      console.log('test_bundleInfo_compatibleVersion_0001 done');
      done();
      console.log('test_bundleInfo_compatibleVersion_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_BundleInfo_Static_1200
     * @tc.name      test_bundleInfo_targetVersion_0001
     * @tc.desc      Test BundleInfo targetVersion getter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_bundleInfo_targetVersion_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_bundleInfo_targetVersion_0001 start');
      let bunInfo = test_bundle.getBundleInfo();
      expect(bunInfo.targetVersion).assertEqual(127);
      console.log('test_bundleInfo_targetVersion_0001 done');
      done();
      console.log('test_bundleInfo_targetVersion_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_BundleInfo_Static_1300
     * @tc.name      test_bundleInfo_isCompressNativeLibs_0001
     * @tc.desc      Test BundleInfo isCompressNativeLibs getter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_bundleInfo_isCompressNativeLibs_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_bundleInfo_isCompressNativeLibs_0001 start');
      let bunInfo = test_bundle.getBundleInfo();
      expect(bunInfo.isCompressNativeLibs).assertTrue();
      console.log('test_bundleInfo_isCompressNativeLibs_0001 done');
      done();
      console.log('test_bundleInfo_isCompressNativeLibs_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_BundleInfo_Static_1400
     * @tc.name      test_bundleInfo_entryModuleName_0001
     * @tc.desc      Test BundleInfo entryModuleName getter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_bundleInfo_entryModuleName_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_bundleInfo_entryModuleName_0001 start');
      let bunInfo = test_bundle.getBundleInfo();
      expect(bunInfo.entryModuleName).assertEqual("bundleInfo::getEntryModuleName");
      console.log('test_bundleInfo_entryModuleName_0001 done');
      done();
      console.log('test_bundleInfo_entryModuleName_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_BundleInfo_Static_1500
     * @tc.name      test_bundleInfo_cpuAbi_0001
     * @tc.desc      Test BundleInfo cpuAbi getter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_bundleInfo_cpuAbi_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_bundleInfo_cpuAbi_0001 start');
      let bunInfo = test_bundle.getBundleInfo();
      expect(bunInfo.cpuAbi).assertEqual("bundleInfo::getCpuAbi");
      console.log('test_bundleInfo_cpuAbi_0001 done');
      done();
      console.log('test_bundleInfo_cpuAbi_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_BundleInfo_Static_1600
     * @tc.name      test_bundleInfo_isSilentInstallation_0001
     * @tc.desc      Test BundleInfo isSilentInstallation getter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_bundleInfo_isSilentInstallation_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_bundleInfo_isSilentInstallation_0001 start');
      let bunInfo = test_bundle.getBundleInfo();
      expect(bunInfo.isSilentInstallation).assertEqual("bundleInfo::getIsSilentInstallation");
      console.log('test_bundleInfo_isSilentInstallation_0001 done');
      done();
      console.log('test_bundleInfo_isSilentInstallation_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_BundleInfo_Static_1700
     * @tc.name      test_bundleInfo_minCompatibleVersionCode_0001
     * @tc.desc      Test BundleInfo minCompatibleVersionCode getter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_bundleInfo_minCompatibleVersionCode_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_bundleInfo_minCompatibleVersionCode_0001 start');
      let bunInfo = test_bundle.getBundleInfo();
      expect(bunInfo.minCompatibleVersionCode).assertEqual(127);
      console.log('test_bundleInfo_minCompatibleVersionCode_0001 done');
      done();
      console.log('test_bundleInfo_minCompatibleVersionCode_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_BundleInfo_Static_1800
     * @tc.name      test_bundleInfo_entryInstallationFree_0001
     * @tc.desc      Test BundleInfo entryInstallationFree getter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_bundleInfo_entryInstallationFree_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_bundleInfo_entryInstallationFree_0001 start');
      let bunInfo = test_bundle.getBundleInfo();
      expect(bunInfo.entryInstallationFree).assertTrue();
      console.log('test_bundleInfo_entryInstallationFree_0001 done');
      done();
      console.log('test_bundleInfo_entryInstallationFree_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_BundleInfo_Static_1900
     * @tc.name      test_bundleInfo_reqPermissionStates_0001
     * @tc.desc      Test BundleInfo reqPermissionStates getter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_bundleInfo_reqPermissionStates_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_bundleInfo_reqPermissionStates_0001 start');
      let bunInfo = test_bundle.getBundleInfo();
      expect(bunInfo.reqPermissionStates[0]).assertEqual(127);
      console.log('test_bundleInfo_reqPermissionStates_0001 done');
      done();
      console.log('test_bundleInfo_reqPermissionStates_0001 end');
    });

    // UsedScene tests
    /**
     * @tc.number    SUB_Taihe_UsedScene_Static_0100
     * @tc.name      test_usedScene_abilities_0001
     * @tc.desc      Test UsedScene abilities setter and getter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_usedScene_abilities_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_usedScene_abilities_0001 start');
      let usedScene = test_bundle.getUsedScene();
      usedScene.abilities = ["this ", "is ", "abilities"];
      expect(usedScene.abilities[2]).assertEqual("abilities");
      console.log('test_usedScene_abilities_0001 done');
      done();
      console.log('test_usedScene_abilities_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_UsedScene_Static_0200
     * @tc.name      test_usedScene_when_0001
     * @tc.desc      Test UsedScene when setter and getter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_usedScene_when_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_usedScene_when_0001 start');
      let usedScene = test_bundle.getUsedScene();
      usedScene.when = "this is when";
      expect(usedScene.when).assertEqual("this is when");
      console.log('test_usedScene_when_0001 done');
      done();
      console.log('test_usedScene_when_0001 end');
    });

    // ReqPermissionDetail tests
    /**
     * @tc.number    SUB_Taihe_ReqPermissionDetail_Static_0100
     * @tc.name      test_reqPermissionDetail_name_0001
     * @tc.desc      Test ReqPermissionDetail name setter and getter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_reqPermissionDetail_name_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_reqPermissionDetail_name_0001 start');
      let reqPerDetail = test_bundle.getReqPermissionDetail();
      reqPerDetail.name = "this is name";
      expect(reqPerDetail.name).assertEqual("this is name");
      console.log('test_reqPermissionDetail_name_0001 done');
      done();
      console.log('test_reqPermissionDetail_name_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_ReqPermissionDetail_Static_0200
     * @tc.name      test_reqPermissionDetail_reason_0001
     * @tc.desc      Test ReqPermissionDetail reason setter and getter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_reqPermissionDetail_reason_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_reqPermissionDetail_reason_0001 start');
      let reqPerDetail = test_bundle.getReqPermissionDetail();
      reqPerDetail.reason = "this is reason";
      expect(reqPerDetail.reason).assertEqual("this is reason");
      console.log('test_reqPermissionDetail_reason_0001 done');
      done();
      console.log('test_reqPermissionDetail_reason_0001 end');
    });
  })
}