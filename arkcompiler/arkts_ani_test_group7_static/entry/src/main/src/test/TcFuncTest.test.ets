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

import { describe, it, expect, TestType, Size, Level } from "@ohos/hypium-binary/src/main/indexStatic";
import { Foo, FuncPerson } from '../ets/Index';
let loadOk = true;
let loadMessage = '';
export default function TcFuncTest(): void {
  describe("TcFuncTest", (): void => {
    try {
      loadLibrary("entry");
    } catch (e) {
      loadOk = false;
      loadMessage = e.message;
      console.log('loadFailed', e.message);
    }

    /**
     * @tc.number SUB_TC_FUNC_TEST_0100
     * @tc.name testTcFunc0001
     * @tc.desc Verify that FunctionalObject_Call can invoke a lambda without parameters or return value.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcFunc0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      let called = false;
      cls.test_FuncCallCallback((): void => {
        called = true;
        console.log("callback called");
      });
      expect(called).assertTrue();
    });

    /**
     * @tc.number SUB_TC_FUNC_TEST_0200
     * @tc.name testTcFunc0002
     * @tc.desc Verify that FunctionalObject_Call can invoke a lambda with two int parameters and an int return value.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcFunc0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      expect(cls.test_FuncCallAdd((a: int, b: int): int => a + b, 3, 5)).assertEqual(8);
    });

    /**
     * @tc.number SUB_TC_FUNC_TEST_0300
     * @tc.name testTcFunc0003
     * @tc.desc Verify that double parameters are boxed and passed to a lambda correctly.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcFunc0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      let result = cls.test_FuncCallMultiplyDouble((x: double, y: double): double => x * y);
      expect(Math.abs(result - 6.28) < 0.000001).assertTrue();
    });

    /**
     * @tc.number SUB_TC_FUNC_TEST_0400
     * @tc.name testTcFunc0004
     * @tc.desc Verify that a lambda returning string can be invoked from native code.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcFunc0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      expect(cls.test_FuncCallGreeting((name: string): string => "Hello, " + name)).assertEqual("Hello, World");
    });

    /**
     * @tc.number SUB_TC_FUNC_TEST_0500
     * @tc.name testTcFunc0005
     * @tc.desc Verify that a reference type parameter can be passed directly to a lambda.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcFunc0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      let person = new FuncPerson("Alice");
      expect(cls.test_FuncCallPersonName((p: FuncPerson): string => p.name, person)).assertEqual("Alice");
    });

    /**
     * @tc.number SUB_TC_FUNC_TEST_0600
     * @tc.name testTcFunc0006
     * @tc.desc Verify that parameter count mismatch in FunctionalObject_Call reports an error.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcFunc0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      expect(cls.test_FuncCallArgMismatch((a: int, b: int): int => a + b)).assertTrue();
    });

    /**
     * @tc.number SUB_TC_FUNC_TEST_0800
     * @tc.name testTcFunc0008
     * @tc.desc Verify that a lambda capturing an external variable can be invoked from native code.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcFunc0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      let multiplier = 3;
      expect(cls.test_FuncCallClosure((x: int): int => x * multiplier)).assertEqual(15);
    });

    //   expect(value).assertEqual(9);
    // });

    /**
     * @tc.number SUB_TC_FUNC_TEST_1000
     * @tc.name testTcFunc0010
     * @tc.desc Verify that the same function object can be invoked multiple times.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcFunc0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      expect(cls.test_FuncReuseCallback((v: int): int => v * 2)).assertEqual(12);
    });

    /**
     * @tc.number SUB_TC_FUNC_TEST_1100
     * @tc.name testTcFunc0011
     * @tc.desc Verify that an exception thrown by a lambda can be detected and cleared in native code.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcFunc0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      expect(cls.test_FuncCatchThrown((): void => {
        throw new Error("test error");
      })).assertTrue();
    });

    /**
     * @tc.number SUB_TC_FUNC_TEST_1200
     * @tc.name testTcFunc0012
     * @tc.desc Verify that a persistent reference keeps a function object valid across local scope boundaries.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcFunc0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      expect(cls.test_FuncPersistentCallback((): string => "persistent result")).assertEqual("persistent result");
    });

    /**
     * @tc.number SUB_TC_FUNC_TEST_1300
     * @tc.name testTcFunc0013
     * @tc.desc Verify that a rest-parameter lambda can receive multiple native arguments.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcFunc0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      expect(cls.test_FuncRestCallback((...args: int[]): int => {
        let total = 0;
        for (let i = 0; i < args.length; i++) {
          total += args[i];
        }
        return total;
      })).assertEqual(6);
    });

  });
}
