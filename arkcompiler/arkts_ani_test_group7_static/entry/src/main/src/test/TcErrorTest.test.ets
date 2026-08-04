'use static';
/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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
import { Foo } from '../ets/Index';
let loadOk = true;
let loadMessage = '';
export default function TcErrorTest(): void {
  describe("TcErrorTest", (): void => {
    try {
      loadLibrary("entry");
    } catch (e) {
      loadOk = false;
      loadMessage = e.message;
      console.log('loadFailed', e.message);
    }

    /**
     * @tc.number SUB_TC_ERROR_TEST_0200
     * @tc.name testTcError0002
     * @tc.desc Verify that a mismatched native binding signature causes a failure or observable abnormal behavior.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcError0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let foo = new Foo();
      let hasError = false;
      let result: int = 0;

      try {
        result = foo.test_ErrorAdd(3, 5);
        console.log("TC_ERROR_002 returned value: " + result);
      } catch (e) {
        hasError = true;
        console.log("TC_ERROR_002 caught expected error: " + e.message);
      }

      expect(hasError || result !== 8).assertTrue();
    });

    /**
     * @tc.number SUB_TC_ERROR_TEST_0300
     * @tc.name testTcError0003
     * @tc.desc Verify the simulated FindClass failure path for an unresolved class scenario.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcError0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let foo = new Foo();
      let result = foo.test_SimulateFindClassFailure();
      console.log("TC_ERROR_003 result: " + result);
      expect(result.indexOf("FindClass failed") >= 0).assertTrue();
    });
  });
}
