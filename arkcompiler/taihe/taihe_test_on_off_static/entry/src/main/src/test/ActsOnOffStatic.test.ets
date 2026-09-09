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
import * as on_off from '../ets/on_off'

export default function asyncStaticTest(): void {
  describe("ActsOnOffStaticTest", (): void => {
    try {
      loadLibrary("entry")
    } catch (e) {
      console.log('loadFailed', e.message);
    }

    /**
     * @tc.number    SUB_Taihe_OnOff_BaseClsOn_STATIC_0100
     * @tc.name      test_OnOff_BaseClsOn_Static_0001
     * @tc.desc      BaseCls.on("foostatic") should invoke callback without error
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_OnOff_BaseClsOn_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_OnOff_BaseClsOn_Static_0001 start');
      let pass: boolean = true;
      try {
        on_off.BaseCls.on("foostatic", (): void => {
          console.log("void input void output callback!");
        });
      } catch (e) {
        pass = false;
        console.log('BaseCls.on("foostatic") failed', e.message);
      }
      expect(pass).assertTrue();
      console.log('test_OnOff_BaseClsOn_Static_0001 done');
      done();
      console.log('test_OnOff_BaseClsOn_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_OnOff_BaseClsOff_STATIC_0100
     * @tc.name      test_OnOff_BaseClsOff_Static_0001
     * @tc.desc      BaseCls.off("foostatic") should invoke callback without error
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_OnOff_BaseClsOff_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_OnOff_BaseClsOff_Static_0001 start');
      let pass: boolean = true;
      try {
        on_off.BaseCls.off("foostatic", (): void => {
          console.log("void input void output callback!");
        });
      } catch (e) {
        pass = false;
        console.log('BaseCls.off("foostatic") failed', e.message);
      }
      expect(pass).assertTrue();
      console.log('test_OnOff_BaseClsOff_Static_0001 done');
      done();
      console.log('test_OnOff_BaseClsOff_Static_0001 end');
    });
  })
}