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
import * as on_off from '../ets/on_off'

export default function asyncInterfaceTest(): void {
  describe("ActsOnOffInterfaceTest", (): void => {
    try {
      loadLibrary("entry")
    } catch (e) {
      console.log('loadFailed', e.message);
    }

    let ibase: on_off.IBase = on_off.getIBase("hello", "world");

    /**
     * @tc.number    SUB_Taihe_OnOff_IBaseOn_STATIC_0100
     * @tc.name      test_OnOff_IBaseOn_Static_0001
     * @tc.desc      IBase.on("set") should invoke callback without error
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_OnOff_IBaseOn_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_OnOff_IBaseOn_Static_0001 start');
      let pass: boolean = true;
      try {
        ibase.on("set", (): void => {
          console.log("void input void output callback!");
        });
      } catch (e) {
        pass = false;
        console.log('IBase.on("set") failed', e.message);
      }
      expect(pass).assertTrue();
      console.log('test_OnOff_IBaseOn_Static_0001 done');
      done();
      console.log('test_OnOff_IBaseOn_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_OnOff_IBaseOff_STATIC_0100
     * @tc.name      test_OnOff_IBaseOff_Static_0001
     * @tc.desc      IBase.off("set") should invoke callback without error
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_OnOff_IBaseOff_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_OnOff_IBaseOff_Static_0001 start');
      let pass: boolean = true;
      try {
        ibase.off("set", (): void => {
          console.log("void input void output callback!");
        });
      } catch (e) {
        pass = false;
        console.log('IBase.off("set") failed', e.message);
      }
      expect(pass).assertTrue();
      console.log('test_OnOff_IBaseOff_Static_0001 done');
      done();
      console.log('test_OnOff_IBaseOff_Static_0001 end');
    });
  })
}