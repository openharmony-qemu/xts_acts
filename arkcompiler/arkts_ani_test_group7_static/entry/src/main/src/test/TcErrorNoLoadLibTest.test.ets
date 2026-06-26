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
import { ErrorNoLoadLib } from '../ets/TcErrorNoLoadLib';

export default function TcErrorNoLoadLibTest(): void {
  describe("TcErrorNoLoadLibTest", (): void => {
    /**
     * @tc.number SUB_TC_ERROR_TEST_0100
     * @tc.name testTcError0001
     * @tc.desc Verify that calling a native function before loadLibrary throws a runtime error.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcError0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let errorNoLoadLib = new ErrorNoLoadLib();
      let hasError = false;

      try {
        errorNoLoadLib.test_CallMissing();
      } catch (e) {
        hasError = true;
        console.log("TC_ERROR_001 caught expected error: " + e.message);
      }

      expect(hasError).assertTrue();
    });
  });
}
