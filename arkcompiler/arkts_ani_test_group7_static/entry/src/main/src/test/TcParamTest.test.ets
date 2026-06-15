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
import { Foo, ParamC, ParamOtherI } from '../ets/Index';

export default function TcParamTest(): void {
  describe("TcParamTest", (): void => {
    try {
      loadLibrary("entry");
    } catch (e) {
      console.log('loadFailed', e.message);
      expect(false).assertTrue();
    }

    /**
     * @tc.number SUB_TC_PARAM_TEST_0100
     * @tc.name testTcParam0001
     * @tc.desc Verify that primitive values can be boxed by fast Primitive_Box APIs.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcParam0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      expect((cls.test_ParamBoxInt(42) as Int).toInt()).assertEqual(42);
      expect((cls.test_ParamBoxDouble(3.14) as Double).toDouble()).assertEqual(3.14);
      expect((cls.test_ParamBoxBoolean(true) as Boolean).toString()).assertEqual("true");
    });

    /**
     * @tc.number SUB_TC_PARAM_TEST_0200
     * @tc.name testTcParam0002
     * @tc.desc Verify that a Double boxed object can be created through Object_New and constructor.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcParam0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      expect((cls.test_ParamCreateDoubleBoxed(2.718) as Double).toDouble()).assertEqual(2.718);
    });

    /**
     * @tc.number SUB_TC_PARAM_TEST_0300
     * @tc.name testTcParam0003
     * @tc.desc Verify that a boxed Double object can be unboxed through Primitive_Unbox_Double.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcParam0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      expect(cls.test_ParamUnboxDouble(new Double(3.14))).assertEqual(3.14);
    });

    /**
     * @tc.number SUB_TC_PARAM_TEST_0400
     * @tc.name testTcParam0004
     * @tc.desc Verify that a boxed Double object can be unboxed through its toDouble method.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcParam0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      expect(cls.test_ParamUnboxWithMethod(new Double(2.718))).assertEqual(2.718);
    });

    /**
     * @tc.number SUB_TC_PARAM_TEST_0500
     * @tc.name testTcParam0005
     * @tc.desc Verify wrong unboxing behavior when a String object is treated as an Int object in native code.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcParam0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      let result = cls.test_ParamWrongUnbox(new String("hello"));
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_TC_PARAM_TEST_0800
     * @tc.name testTcParam0008
     * @tc.desc Verify union parameter identification for number and string.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcParam0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      expect(cls.test_ParamIdentify(42)).assertEqual("number");
      expect(cls.test_ParamIdentify("hello")).assertEqual("string");
    });

    /**
     * @tc.number SUB_TC_PARAM_TEST_0900
     * @tc.name testTcParam0009
     * @tc.desc Verify union parameter with class and interface upper bound can be identified in native code.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcParam0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      expect(cls.test_ParamHandleCI(new ParamC())).assertEqual("ParamC");
      expect(cls.test_ParamHandleCI(new ParamOtherI())).assertEqual("ParamI");
    });

    /**
     * @tc.number SUB_TC_PARAM_TEST_1000
     * @tc.name testTcParam0010
     * @tc.desc Verify optional parameters where string is kept as reference and int is boxed.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcParam0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      expect(cls.test_ParamGreet("Alice", 25)).assertEqual("Alice,25");
      expect(cls.test_ParamGreet("Bob")).assertEqual("Bob");
      expect(cls.test_ParamGreet()).assertEqual("anonymous");
    });

    /**
     * @tc.number SUB_TC_PARAM_TEST_1100
     * @tc.name testTcParam0011
     * @tc.desc Verify that an omitted optional parameter is passed as undefined to native code.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcParam0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      expect(cls.test_ParamCheckOptional()).assertTrue();
      expect(cls.test_ParamCheckOptional(100)).assertFalse();
    });

    /**
     * @tc.number SUB_TC_PARAM_TEST_1500
     * @tc.name testTcParam0015
     * @tc.desc Verify optional parameter combined with union type can distinguish undefined and concrete values.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcParam0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      expect(cls.test_ParamProcessOrUndefined()).assertEqual("undefined");
      expect(cls.test_ParamProcessComplexUnion()).assertEqual("undefined");
      expect(cls.test_ParamProcessComplexUnion("hello")).assertEqual("string");
      expect(cls.test_ParamProcessComplexUnion(123)).assertEqual("number");
    });

    /**
     * @tc.number SUB_TC_PARAM_TEST_1700
     * @tc.name testTcParam0017
     * @tc.desc Verify performance comparison path between fast boxing and traditional boxing.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcParam0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      let fastCost = cls.test_ParamFastBoxPerf(1000);
      let traditionalCost = cls.test_ParamTraditionalBoxPerf(1000);
      console.log("fastBoxCost", fastCost, "traditionalBoxCost", traditionalCost);
      expect(fastCost >= 0).assertTrue();
      expect(traditionalCost >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_TC_PARAM_TEST_1800
     * @tc.name testTcParam0018
     * @tc.desc Verify performance comparison path between fast unboxing and toDouble method unboxing.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcParam0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      let fastCost = cls.test_ParamFastUnboxPerf(1000);
      let methodCost = cls.test_ParamMethodUnboxPerf(1000);
      console.log("fastUnboxCost", fastCost, "methodUnboxCost", methodCost);
      expect(fastCost >= 0).assertTrue();
      expect(methodCost >= 0).assertTrue();
    });
  });
}
