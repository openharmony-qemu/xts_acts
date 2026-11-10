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
import * as test_bundle from '../ets/moduleInfo'

let domain: int = 0x0000;
let tag: string = 'testTag';

export default function moduleInfoTest(): void {
  describe("ActsModuleInfoTest", (): void => {
    try {
      loadLibrary("entry")
    } catch (e) {
      console.log('loadFailed', e.message);
    }

    /**
     * @tc.number    SUB_Taihe_ModuleInfo_Static_0100
     * @tc.name      test_moduleInfo_moduleName_0001
     * @tc.desc      Test ModuleInfo moduleName getter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_moduleInfo_moduleName_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_moduleInfo_moduleName_0001 start');
      let moInfo = test_bundle.getModuleInfo();
      expect(moInfo.moduleName).assertEqual("this is moduleinfo with name");
      console.log('test_moduleInfo_moduleName_0001 done');
      done();
      console.log('test_moduleInfo_moduleName_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_ModuleInfo_Static_0200
     * @tc.name      test_moduleInfo_moduleSourceDir_0001
     * @tc.desc      Test ModuleInfo moduleSourceDir getter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_moduleInfo_moduleSourceDir_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_moduleInfo_moduleSourceDir_0001 start');
      let moInfo = test_bundle.getModuleInfo();
      expect(moInfo.moduleSourceDir).assertEqual("this is moduleinfo with moduleSourceDir");
      console.log('test_moduleInfo_moduleSourceDir_0001 done');
      done();
      console.log('test_moduleInfo_moduleSourceDir_0001 end');
    });
  })
}