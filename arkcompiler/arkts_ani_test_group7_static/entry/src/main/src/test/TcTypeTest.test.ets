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
import { Foo, TypeColor, TypeIntObject } from '../ets/Index';

export default function TcTypeTest(): void {
  describe("TcTypeTest", (): void => {
    try {
      loadLibrary("entry");
    } catch (e) {
      console.log('loadFailed', e.message);
      expect(false).assertTrue();
    }

    /**
     * @tc.number SUB_TC_TYPE_TEST_0100
     * @tc.name testTcType0001
     * @tc.desc Verify that ani_boolean can be returned correctly and printed after conversion to int.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcType0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      expect(cls.test_IsPositive(5)).assertTrue();
      expect(cls.test_IsPositive(-3)).assertFalse();
    });

    /**
     * @tc.number SUB_TC_TYPE_TEST_0200
     * @tc.name testTcType0002
     * @tc.desc Verify that ani_char can handle a UTF-16 character and return its Unicode code point.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcType0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      let result = cls.test_GetCharCode(c'中');
      expect(result).assertEqual(20013);
    });

    /**
     * @tc.number SUB_TC_TYPE_TEST_0300
     * @tc.name testTcType0003
     * @tc.desc Verify byte, short, int and long boundary values are passed without overflow or truncation.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcType0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();

      expect(cls.test_EchoByte(127)).assertEqual(127);
      expect(cls.test_EchoByte(-128)).assertEqual(-128);
      expect(cls.test_EchoByte(0)).assertEqual(0);

      expect(cls.test_EchoShort(32767)).assertEqual(32767);
      expect(cls.test_EchoShort(-32768)).assertEqual(-32768);
      expect(cls.test_EchoShort(0)).assertEqual(0);

      expect(cls.test_EchoInt(2147483647)).assertEqual(2147483647);
      expect(cls.test_EchoInt(-2147483648)).assertEqual(-2147483648);
      expect(cls.test_EchoInt(0)).assertEqual(0);

      expect(cls.test_EchoLong(9223372036854775807)).assertEqual(9223372036854775807);
      expect(cls.test_EchoLong(-9223372036854775808)).assertEqual(-9223372036854775808);
      expect(cls.test_EchoLong(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_TC_TYPE_TEST_0400
     * @tc.name testTcType0004
     * @tc.desc Verify that ani_float and ani_double preserve expected floating point precision.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcType0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();

      let floatResult = cls.test_EchoFloat(3.1415927.toFloat());
      let doubleResult = cls.test_EchoDouble(3.1415926535);

      expect(Math.abs(floatResult - 3.1415927) < 0.00001).assertTrue();
      expect(Math.abs(doubleResult - 3.1415926535) < 0.0000000001).assertTrue();
    });

    /**
     * @tc.number SUB_TC_TYPE_TEST_0500
     * @tc.name testTcType0005
     * @tc.desc Verify that number is mapped to ani_double and can pass integer and floating point values.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcType0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();

      expect(cls.test_ProcessNumber(42)).assertEqual(42);
      expect(Math.abs(cls.test_ProcessNumber(3.14) - 3.14) < 0.0000001).assertTrue();
    });

    /**
     * @tc.number SUB_TC_TYPE_TEST_0600
     * @tc.name testTcType0006
     * @tc.desc Verify that ani_string can be read and a new ani_string can be created in native code.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcType0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      let result = cls.test_CreateGreeting("World");
      expect(result).assertEqual("Hello, World");
    });

    /**
     * @tc.number SUB_TC_TYPE_TEST_0700
     * @tc.name testTcType0007
     * @tc.desc Verify that native code can get ArrayBuffer data pointer and write to a specified offset.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcType0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();

      let buffer = new ArrayBuffer(4);
      let view = new Uint8Array(buffer);
      cls.test_WriteToBuffer(buffer, 2, 255);

      expect(view[2]).assertEqual(255);
    });

    /**
     * @tc.number SUB_TC_TYPE_TEST_0800
     * @tc.name testTcType0008
     * @tc.desc Verify that native code can traverse a number array and return its sum.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcType0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      let result = cls.test_TypeSumArray([1, 2, 3, 4, 5]);
      expect(result).assertEqual(15);
    });

    /**
     * @tc.number SUB_TC_TYPE_TEST_1300
     * @tc.name testTcType0013
     * @tc.desc Verify that Object_InstanceOf can identify string in a union parameter.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcType0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();

      let result = cls.test_IdentifyString("hello");
      expect(result).assertEqual("string");
    });

    /**
     * @tc.number SUB_TC_TYPE_TEST_1400
     * @tc.name testTcType0014
     * @tc.desc Verify that Object_InstanceOf can identify ArrayBuffer in a union parameter.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcType0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();

      let result = cls.test_IdentifyArrayBuffer(new ArrayBuffer(1024));
      expect(result).assertEqual("ArrayBuffer");
    });

    /**
     * @tc.number SUB_TC_TYPE_TEST_1900
     * @tc.name testTcType0019
     * @tc.desc Verify that native code can call a function object and return its string result.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcType0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();

      let result = cls.test_CallWithCallback((): string => {
        return "callback result";
      });

      expect(result).assertEqual("callback result");
    });

    /**
     * @tc.number SUB_TC_TYPE_TEST_2000
     * @tc.name testTcType0020
     * @tc.desc Verify that native code can receive ani_enum_item and return its integer value.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcType0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();

      let result = cls.test_GetEnumValue(TypeColor.GREEN);
      expect(result).assertEqual(1);
    });
  });
}
