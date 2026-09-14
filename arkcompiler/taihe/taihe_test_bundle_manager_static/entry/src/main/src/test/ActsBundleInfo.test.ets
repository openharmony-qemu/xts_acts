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
      expect(bunInfo.name).assertEqual("BundleInfoImpl::getName");
      console.log('test_bundleInfo_name_0001 done');
      done();
      console.log('test_bundleInfo_name_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_BundleInfo_Static_0200
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
      expect(bunInfo.vendor).assertEqual("BundleInfoImpl::getVendor");
      console.log('test_bundleInfo_vendor_0001 done');
      done();
      console.log('test_bundleInfo_vendor_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_BundleInfo_Static_0300
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
      expect(bunInfo.versionCode).assertEqual(21474);
      console.log('test_bundleInfo_versionCode_0001 done');
      done();
      console.log('test_bundleInfo_versionCode_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_BundleInfo_Static_0400
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
      expect(bunInfo.versionName).assertEqual("BundleInfoImpl::getVersionName");
      console.log('test_bundleInfo_versionName_0001 done');
      done();
      console.log('test_bundleInfo_versionName_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_BundleInfo_Static_0500
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
      expect(bunInfo.minCompatibleVersionCode).assertEqual("BundleInfoImpl::getMinCompatibleVersionCode");
      console.log('test_bundleInfo_minCompatibleVersionCode_0001 done');
      done();
      console.log('test_bundleInfo_minCompatibleVersionCode_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_BundleInfo_Static_0600
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
      expect(bunInfo.targetVersion).assertEqual(21474);
      console.log('test_bundleInfo_targetVersion_0001 done');
      done();
      console.log('test_bundleInfo_targetVersion_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_BundleInfo_Static_0700
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
      expect(bunInfo.installTime).assertEqual(21474);
      console.log('test_bundleInfo_installTime_0001 done');
      done();
      console.log('test_bundleInfo_installTime_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_BundleInfo_Static_0800
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
      expect(bunInfo.updateTime).assertEqual(21474);
      console.log('test_bundleInfo_updateTime_0001 done');
      done();
      console.log('test_bundleInfo_updateTime_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_BundleInfo_Static_0900
     * @tc.name      test_bundleInfo_appIndex_0001
     * @tc.desc      Test BundleInfo appIndex getter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_bundleInfo_appIndex_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_bundleInfo_appIndex_0001 start');
      let bunInfo = test_bundle.getBundleInfo();
      expect(bunInfo.appIndex).assertEqual(21474);
      console.log('test_bundleInfo_appIndex_0001 done');
      done();
      console.log('test_bundleInfo_appIndex_0001 end');
    });
  })
}