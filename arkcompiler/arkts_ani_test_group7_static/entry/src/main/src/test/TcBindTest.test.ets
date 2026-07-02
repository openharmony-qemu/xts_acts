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
import { Foo, COLOR } from '../ets/Index';

export default function TcBindTest(): void {
  describe("TcBindTest", (): void => {
    try {
      loadLibrary("entry");
    } catch (e) {
      console.log('loadFailed', e.message);
      expect(false).assertTrue();
    }

    /**
     * @tc.number SUB_TC_BIND_TEST_0100
     * @tc.name testTcBind0001
     * @tc.desc Verify that a class instance native method can be bound and access instance data correctly.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcBind0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      cls.factor = 2;
      let result = cls.test_Multiply(5);
      expect(result).assertEqual(10);
    });

    /**
     * @tc.number SUB_TC_BIND_TEST_0200
     * @tc.name testTcBind0002
     * @tc.desc Verify that a static native method can be bound and called without an instance.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcBind0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let result = Foo.test_Square(7);
      expect(result).assertEqual(49);
    });

    /**
     * @tc.number SUB_TC_BIND_TEST_0300
     * @tc.name testTcBind0003
     * @tc.desc Verify that a namespace native function can be bound without an instance object parameter.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcBind0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      let result = cls.test_ToUpper("hello");
      expect(result).assertEqual("HELLO");
    });

    /**
     * @tc.number SUB_TC_BIND_TEST_0400
     * @tc.name testTcBind0004
     * @tc.desc Verify that a module-level native function can be bound by FindModule and Module_BindNativeFunctions.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcBind0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      let result = cls.test_ProcessColor(COLOR.GREEN);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_TC_BIND_TEST_0500
     * @tc.name testTcBind0005
     * @tc.desc Verify that overloaded native functions with different signatures are bound to different C++ functions.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcBind0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      cls.test_FooOverload();
      cls.test_FooOverload("test");
      let result = cls.test_CheckFooOverload();
      expect(result).assertTrue();
    });

  });
}
