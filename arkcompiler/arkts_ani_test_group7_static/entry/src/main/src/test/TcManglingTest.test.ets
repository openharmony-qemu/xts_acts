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
import {
  Foo,
  Person,
  Runner,
  A,
  I1Impl,
  MyClass,
  User
} from '../ets/Index';

export default function TcManglingTest(): void {
  describe("TcManglingTest", (): void => {
    try {
      loadLibrary("entry");
    } catch (e) {
      console.log('loadFailed', e.message);
      expect(false).assertTrue();
    }

    /**
     * @tc.number SUB_TC_MANGLING_TEST_0100
     * @tc.name testTcMangling0001
     * @tc.desc Verify ANI mangling signatures for double, string, and boolean types.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcMangling0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      expect(cls.test_SumDouble(1.5, 2.5)).assertEqual(4.0);
      expect(cls.test_ManglingConcat("ab", "cd")).assertEqual("abcd");
      expect(cls.test_IsEqual(true, true)).assertTrue();
    });

    /**
     * @tc.number SUB_TC_MANGLING_TEST_0200
     * @tc.name testTcMangling0002
     * @tc.desc Verify primitive type mangling for boolean, byte, char, short, int, long, float, and double.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcMangling0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      let result = cls.test_FuncPrimitive(true, 7, c'A', 1024, 2048, 4096, 3.5, 8.25);
      expect(result).assertEqual(8.25);
    });

    /**
     * @tc.number SUB_TC_MANGLING_TEST_0300
     * @tc.name testTcMangling0003
     * @tc.desc Verify that number is encoded as double and is equivalent to double in native binding.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcMangling0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      expect(cls.test_UseNumber(3.14)).assertEqual(3.14);
      expect(cls.test_UseDouble(3.14)).assertEqual(3.14);
    });

    /**
     * @tc.number SUB_TC_MANGLING_TEST_0400
     * @tc.name testTcMangling0004
     * @tc.desc Verify required primitive mangling and boxed optional primitive mangling.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcMangling0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      cls.test_RequiredInt(42);
      cls.test_OptionalInt(100);
      cls.test_OptionalInt();
      expect(cls.test_CheckOptionalInt()).assertTrue();
    });

    /**
     * @tc.number SUB_TC_MANGLING_TEST_0500
     * @tc.name testTcMangling0005
     * @tc.desc Verify reference type mangling for a class and an interface.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcMangling0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      expect(cls.test_ProcessPerson(new Person("Alice", 20))).assertEqual("Alice");
      expect(cls.test_CheckRun(new Runner())).assertTrue();
    });

    /**
     * @tc.number SUB_TC_MANGLING_TEST_0600
     * @tc.name testTcMangling0006
     * @tc.desc Verify standard library mangling for string and bigint.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcMangling0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      expect(cls.test_ManglingConcatString("hello", "world")).assertEqual("helloworld");
      expect(cls.test_AddBigInt(100n, 23n)).assertEqual(123n);
    });

    /**
     * @tc.number SUB_TC_MANGLING_TEST_0700
     * @tc.name testTcMangling0007
     * @tc.desc Verify that T[] and Array<T> are both encoded as std.core.Array.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcMangling0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      expect(cls.test_SumArray([1, 2, 3])).assertEqual(6);
      expect(cls.test_SumArray2(new Array<number>(1, 2, 3))).assertEqual(6);
    });

    /**
     * @tc.number SUB_TC_MANGLING_TEST_0900
     * @tc.name testTcMangling0009
     * @tc.desc Verify union type mangling for string, number, and undefined.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcMangling0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      expect(cls.test_ProcessUnion("hello")).assertEqual("string");
      expect(cls.test_ProcessUnion(123)).assertEqual("number");
      expect(cls.test_ProcessUnion(undefined)).assertEqual("undefined");
    });

    /**
     * @tc.number SUB_TC_MANGLING_TEST_1000
     * @tc.name testTcMangling0010
     * @tc.desc Verify complex optional parameter mangling with omitted and provided arguments.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcMangling0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      cls.test_ComplexOptional(1);
      cls.test_ComplexOptional(1, 2);
      cls.test_ComplexOptional(1, 2, "hi");
      cls.test_ComplexOptional(1, 2, "hi", new A(10));

      let result = cls.test_CheckComplexOptional();
      expect(result ? 1 : 0).assertEqual(1);
    });

    /**
     * @tc.number SUB_TC_MANGLING_TEST_1100
     * @tc.name testTcMangling0011
     * @tc.desc Verify optional primitive and optional reference parameter mangling.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcMangling0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      cls.test_OptionalBasicAndRef();
      cls.test_OptionalBasicAndRef(10);
      cls.test_OptionalBasicAndRef(10, "text", new A(11));
      expect(cls.test_CheckOptionalBasicAndRef()).assertTrue();
    });

    /**
     * @tc.number SUB_TC_MANGLING_TEST_1300
     * @tc.name testTcMangling0013
     * @tc.desc Verify function type mangling for Function0 and FunctionR1 parameters.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcMangling0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();

      let f = (): void => {
        console.log("Function0 callback called");
      };
      let g = (): string => {
        return "ok";
      };
      let h = (x: int, ...y: int[]): string => {
        return "rest";
      };

      cls.test_ExecFunction(f, g, h);
      expect(cls.test_CheckExecFunction()).assertTrue();
    });

    /**
     * @tc.number SUB_TC_MANGLING_TEST_1400
     * @tc.name testTcMangling0014
     * @tc.desc Verify generic type mangling based on its union constraint.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcMangling0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      let impl = new I1Impl();
      let result = cls.test_GenericFunc<I1Impl>(impl);
      expect(result.tag1()).assertEqual("I1");
    });

    /**
     * @tc.number SUB_TC_MANGLING_TEST_1500
     * @tc.name testTcMangling0015
     * @tc.desc Verify no-argument void-return mangling.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcMangling0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      cls.test_DoNothing();
      expect(cls.test_CheckDoNothing()).assertTrue();
    });

    /**
     * @tc.number SUB_TC_MANGLING_TEST_1600
     * @tc.name testTcMangling0016
     * @tc.desc Verify another void-return native function with no parameter.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcMangling0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      cls.test_DoNothingAgain();
      expect(cls.test_CheckDoNothingAgain()).assertTrue();
    });

    /**
     * @tc.number SUB_TC_MANGLING_TEST_1700
     * @tc.name testTcMangling0017
     * @tc.desc Verify that the default module name is used as the class prefix in mangling.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcMangling0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      cls.test_UseMyClass(new MyClass(17));
      expect(cls.test_CheckUseMyClass()).assertTrue();
    });

  });
}
