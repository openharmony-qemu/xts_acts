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

export default function TcLoadLibTest(): void {
  describe("TcLoadLibTest", (): void => {
    try {
      loadLibrary("entry");
    } catch (e) {
      console.log('loadFailed', e.message);
      expect(false).assertTrue();
    }

    /**
     * @tc.number SUB_TC_LOADLIB_TEST_0100
     * @tc.name testTcLoadLib0001
     * @tc.desc Verify that a module-level native function can be bound after loadLibrary and return the expected result.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcLoadLib0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let foo = new Foo();
      let result = foo.test_Add(3, 5);
      expect(result).assertEqual(8);
    });

    /**
     * @tc.number SUB_TC_LOADLIB_TEST_0200
     * @tc.name testTcLoadLib0002
     * @tc.desc Verify that the native function is invoked when the exported module function is called for the first time.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcLoadLib0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let foo = new Foo();
      let beforeCount = foo.test_GetLoadLibNativeCallCount();
      let result = foo.test_Add(3, 5);
      let afterCount = foo.test_GetLoadLibNativeCallCount();

      expect(result).assertEqual(8);
      expect(afterCount).assertEqual(beforeCount + 1);
    });
  });
}
