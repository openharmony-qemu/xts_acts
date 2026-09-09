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
import * as test_bundle from '../ets/overlayModuleInfo'

let domain: int = 0x0000;
let tag: string = 'testTag';

export default function overlayModuleInfoTest(): void {
  describe("ActsOverlayModuleInfoTest", (): void => {
    try {
      loadLibrary("entry")
    } catch (e) {
      console.log('loadFailed', e.message);
    }

    /**
     * @tc.number    SUB_Taihe_OverlayModuleInfo_Static_0100
     * @tc.name      test_overlayModuleInfo_bundleName_0001
     * @tc.desc      Test OverlayModuleInfo bundleName getter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_overlayModuleInfo_bundleName_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_overlayModuleInfo_bundleName_0001 start');
      let overInfo = test_bundle.getOverlayModuleInfo();
      expect(overInfo.bundleName).assertEqual("OverlayModuleInfoImpl::getBundleName");
      console.log('test_overlayModuleInfo_bundleName_0001 done');
      done();
      console.log('test_overlayModuleInfo_bundleName_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_OverlayModuleInfo_Static_0200
     * @tc.name      test_overlayModuleInfo_moduleName_0001
     * @tc.desc      Test OverlayModuleInfo moduleName getter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_overlayModuleInfo_moduleName_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_overlayModuleInfo_moduleName_0001 start');
      let overInfo = test_bundle.getOverlayModuleInfo();
      expect(overInfo.moduleName).assertEqual("OverlayModuleInfoImpl::getModuleName");
      console.log('test_overlayModuleInfo_moduleName_0001 done');
      done();
      console.log('test_overlayModuleInfo_moduleName_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_OverlayModuleInfo_Static_0300
     * @tc.name      test_overlayModuleInfo_targetModuleName_0001
     * @tc.desc      Test OverlayModuleInfo targetModuleName getter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_overlayModuleInfo_targetModuleName_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_overlayModuleInfo_targetModuleName_0001 start');
      let overInfo = test_bundle.getOverlayModuleInfo();
      expect(overInfo.targetModuleName).assertEqual("OverlayModuleInfoImpl::getTargetModuleName");
      console.log('test_overlayModuleInfo_targetModuleName_0001 done');
      done();
      console.log('test_overlayModuleInfo_targetModuleName_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_OverlayModuleInfo_Static_0400
     * @tc.name      test_overlayModuleInfo_priority_0001
     * @tc.desc      Test OverlayModuleInfo priority getter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_overlayModuleInfo_priority_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_overlayModuleInfo_priority_0001 start');
      let overInfo = test_bundle.getOverlayModuleInfo();
      expect(overInfo.priority).assertEqual(21474);
      console.log('test_overlayModuleInfo_priority_0001 done');
      done();
      console.log('test_overlayModuleInfo_priority_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_OverlayModuleInfo_Static_0500
     * @tc.name      test_overlayModuleInfo_state_0001
     * @tc.desc      Test OverlayModuleInfo state getter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_overlayModuleInfo_state_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_overlayModuleInfo_state_0001 start');
      let overInfo = test_bundle.getOverlayModuleInfo();
      expect(overInfo.state).assertEqual(21474);
      console.log('test_overlayModuleInfo_state_0001 done');
      done();
      console.log('test_overlayModuleInfo_state_0001 end');
    });
  })
}