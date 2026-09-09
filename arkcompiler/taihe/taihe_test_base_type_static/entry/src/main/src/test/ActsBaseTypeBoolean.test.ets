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
import * as test_base from '../ets/base_test'

export default function baseTypeBooleanTest(): void {
  describe("ActsBaseTypeBooleanTest", (): void => {
    try {
      loadLibrary("entry")
    } catch (e) {
      console.log('loadFailed', e.message);
    }

    /**
     * @tc.number    SUB_Taihe_Boolean_Check_STATIC_0100
     * @tc.name      test_Boolean_Check_Static_0001
     * @tc.desc      Check should be true only when both arguments are true
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Boolean_Check_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Boolean_Check_Static_0001 start');
      expect(test_base.check(true, true)).assertTrue();
      expect(test_base.check(true, false)).assertFalse();
      expect(test_base.check(false, true)).assertFalse();
      expect(test_base.check(false, false)).assertFalse();
      console.log('test_Boolean_Check_Static_0001 done');
      done();
      console.log('test_Boolean_Check_Static_0001 end');
    });
  })
}
