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
export default function TcDisasmTest(): void {
  describe("TcDisasmTest", (): void => {
    try {
      loadLibrary("entry");
    } catch (e) {
      loadOk = false;
      loadMessage = e.message;
      console.log('loadFailed', e.message);
    }

    /**
     * @tc.number SUB_TC_DISASM_TEST_0100
     * @tc.name testTcDisasm0001
     * @tc.desc Verify that an instance native method signature obtained from disassembly can be used for binding.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcDisasm0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let foo = new Foo();
      let result = foo.test_CallInstanceAdd(7);
      expect(result).assertEqual(8);
    });

    /**
     * @tc.number SUB_TC_DISASM_TEST_0200
     * @tc.name testTcDisasm0002
     * @tc.desc Verify that a static native method signature obtained from disassembly can be used for binding.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcDisasm0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let foo = new Foo();
      let result = foo.test_CallStaticSquare(6);
      expect(result).assertEqual(36);
    });

    /**
     * @tc.number SUB_TC_DISASM_TEST_0300
     * @tc.name testTcDisasm0003
     * @tc.desc Verify that the no-argument overload signature obtained from disassembly can be used for binding.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcDisasm0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let foo = new Foo();
      let result = foo.test_CallOverloadVoid();
      expect(result).assertEqual(100);
    });

    /**
     * @tc.number SUB_TC_DISASM_TEST_0400
     * @tc.name testTcDisasm0004
     * @tc.desc Verify that the string overload signature obtained from disassembly can be used for binding.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcDisasm0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let foo = new Foo();
      let result = foo.test_CallOverloadString("hello");
      expect(result).assertEqual(5);
    });
  });
}
