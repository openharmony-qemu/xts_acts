/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '../../../../hypium/index';
import Utils from '../Util.test';



export default function builtinsStringBuilderTestAppend() {
  describe('BuiltinsStringBuilderTestAppend', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      await Utils.msSleep(30);
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
     * @tc.name    BuiltinsStringBuilderTestAppend0100
     * @tc.number  BUILTINS_STRING_BUILDER_APPEND_FLOAT_NORMAL_TEST0100
     * @tc.desc    Test StringBuilder append(float) with normal float values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsStringBuilderTestAppend0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();
      const resultBuilder: StringBuilder = builder.append(0.0);
      const result: string = resultBuilder.toString();
      expect(result).assertEqual('0');
    });

    /**
     * @tc.name    BuiltinsStringBuilderTestAppend0200
     * @tc.number  BUILTINS_STRING_BUILDER_APPEND_FLOAT_NEGATIVE_TEST0200
     * @tc.desc    Test StringBuilder append(float) with negative zero
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsStringBuilderTestAppend0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();
      const resultBuilder: StringBuilder = builder.append(-0.0);
      const result: string = resultBuilder.toString();
      expect(result).assertEqual('0');
    });

    /**
     * @tc.name    BuiltinsStringBuilderTestAppend0300
     * @tc.number  BUILTINS_STRING_BUILDER_APPEND_FLOAT_NAN_TEST0300
     * @tc.desc    Test StringBuilder append(float) with NaN
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsStringBuilderTestAppend0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();
      const resultBuilder: StringBuilder = builder.append(NaN);
      const result: string = resultBuilder.toString();
      expect(result).assertEqual('NaN');
    });

    /**
     * @tc.name    BuiltinsStringBuilderTestAppend0400
     * @tc.number  BUILTINS_STRING_BUILDER_APPEND_FLOAT_INFINITY_TEST0400
     * @tc.desc    Test StringBuilder append(float) with Infinity
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsStringBuilderTestAppend0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();
      const resultBuilder: StringBuilder = builder.append(Infinity);
      const result: string = resultBuilder.toString();
      expect(result).assertEqual('Infinity');
    });

    /**
     * @tc.name    BuiltinsStringBuilderTestAppend0500
     * @tc.number  BUILTINS_STRING_BUILDER_APPEND_FLOAT_NEG_INFINITY_TEST0500
     * @tc.desc    Test StringBuilder append(float) with -Infinity
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsStringBuilderTestAppend0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();
      const resultBuilder: StringBuilder = builder.append(-Infinity);
      const result: string = resultBuilder.toString();
      expect(result).assertEqual('-Infinity');
    });

    /**
     * @tc.name    BuiltinsStringBuilderTestAppend0600
     * @tc.number  BUILTINS_STRING_BUILDER_APPEND_FLOAT_MAX_TEST0600
     * @tc.desc    Test StringBuilder append(float) with Number.MAX_VALUE
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsStringBuilderTestAppend0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();
      const resultBuilder: StringBuilder = builder.append(Number.MAX_VALUE);
      const result: string = resultBuilder.toString();
      expect(result).assertEqual(Number.MAX_VALUE.toString());
    });

    /**
     * @tc.name    BuiltinsStringBuilderTestAppend0700
     * @tc.number  BUILTINS_STRING_BUILDER_APPEND_FLOAT_MIN_TEST0700
     * @tc.desc    Test StringBuilder append(float) with Number.MIN_VALUE
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsStringBuilderTestAppend0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();
      const resultBuilder: StringBuilder = builder.append(Number.MIN_VALUE);
      const result: string = resultBuilder.toString();
      expect(result).assertEqual(Number.MIN_VALUE.toString());
    });

    /**
     * @tc.name    BuiltinsStringBuilderTestAppend0800
     * @tc.number  BUILTINS_STRING_BUILDER_APPEND_FLOAT_EPSILON_TEST0800
     * @tc.desc    Test StringBuilder append(float) with Number.EPSILON
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsStringBuilderTestAppend0800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();
      const resultBuilder: StringBuilder = builder.append(Number.EPSILON);
      const result: string = resultBuilder.toString();
      expect(result).assertEqual(Number.EPSILON.toString());
    });

    /**
     * @tc.name    BuiltinsStringBuilderTestAppend0900
     * @tc.number  BUILTINS_STRING_BUILDER_APPEND_FLOAT_INT_BOUNDARY_TEST0900
     * @tc.desc    Test StringBuilder append(float) with integer boundary values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsStringBuilderTestAppend0900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();
      const resultBuilder: StringBuilder = builder.append(-2147483648.0)
        .append(2147483647.0)
        .append(-32768.0)
        .append(32767.0)
        .append(-128.0)
        .append(127.0);
      const result: string = resultBuilder.toString();
      expect(result).assertEqual('-21474836482147483647-3276832767-128127');
    });

    /**
     * @tc.name    BuiltinsStringBuilderTestAppend1000
     * @tc.number  BUILTINS_STRING_BUILDER_APPEND_FLOAT_PRECISION_TEST1000
     * @tc.desc    Test StringBuilder append(float) with precision handling
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsStringBuilderTestAppend1000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();
      const resultBuilder: StringBuilder = builder.append(3.141592653589793)
        .append(2.718281828459045)
        .append(1.4142135623730951);
      const result: string = resultBuilder.toString();
      expect(result).assertEqual('3.1415926535897932.7182818284590451.4142135623730951');
    });

    /**
     * @tc.name    BuiltinsStringBuilderTestAppend1100
     * @tc.number  BUILTINS_STRING_BUILDER_APPEND_FLOAT_CHAIN_TEST1100
     * @tc.desc    Test StringBuilder append(float) with chaining calls
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsStringBuilderTestAppend1100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();
      const resultBuilder: StringBuilder = builder.append(1.0)
        .append(2.0)
        .append(3.0)
        .append(4.0)
        .append(5.0);
      const result: string = resultBuilder.toString();
      expect(result).assertEqual('12345');
      expect(resultBuilder === builder).assertTrue();
    });

    /**
     * @tc.name    BuiltinsStringBuilderTestAppend1200
     * @tc.number  BUILTINS_STRING_BUILDER_APPEND_FLOAT_SPECIAL_CHARS_TEST1200
     * @tc.desc    Test StringBuilder append(float) mixed with string appends
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsStringBuilderTestAppend1200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();
      builder.append("Value: ");
      const resultBuilder: StringBuilder = builder.append(123.456);
      builder.append(" units");
      const result: string = builder.toString();
      expect(result).assertEqual('Value: 123.456 units');
    });

    /**
     * @tc.name    BuiltinsStringBuilderTestAppend1300
     * @tc.number  BUILTINS_STRING_BUILDER_APPEND_FLOAT_EMPTY_TEST1300
     * @tc.desc    Test StringBuilder append(float) on empty builder
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsStringBuilderTestAppend1300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();
      const resultBuilder: StringBuilder = builder.append(999.999);
      const result: string = resultBuilder.toString();
      expect(result).assertEqual('999.999');
      expect(builder.toString()).assertEqual('999.999');
    });

    /**
     * @tc.name    BuiltinsStringBuilderTestAppend1400
     * @tc.number  BUILTINS_STRING_BUILDER_APPEND_INT_ZERO_TEST1400
     * @tc.desc    Test StringBuilder append(int) with zero value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsStringBuilderTestAppend1400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();
      const resultBuilder: StringBuilder = builder.append(0);
      const result: string = resultBuilder.toString();
      expect(result).assertEqual('0');
    });

    /**
     * @tc.name    BuiltinsStringBuilderTestAppend1500
     * @tc.number  BUILTINS_STRING_BUILDER_APPEND_INT_POSITIVE_TEST1500
     * @tc.desc    Test StringBuilder append(int) with positive value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsStringBuilderTestAppend1500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();
      const resultBuilder: StringBuilder = builder.append(123456);
      const result: string = resultBuilder.toString();
      expect(result).assertEqual('123456');
    });

    /**
     * @tc.name    BuiltinsStringBuilderTestAppend1600
     * @tc.number  BUILTINS_STRING_BUILDER_APPEND_INT_NEGATIVE_TEST1600
     * @tc.desc    Test StringBuilder append(int) with negative value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsStringBuilderTestAppend1600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();
      const resultBuilder: StringBuilder = builder.append(-987654);
      const result: string = resultBuilder.toString();
      expect(result).assertEqual('-987654');
    });

    /**
     * @tc.name    BuiltinsStringBuilderTestAppend1700
     * @tc.number  BUILTINS_STRING_BUILDER_APPEND_INT_MAX_TEST1700
     * @tc.desc    Test StringBuilder append(int) with int max value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsStringBuilderTestAppend1700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();
      const resultBuilder: StringBuilder = builder.append(2147483647);
      const result: string = resultBuilder.toString();
      expect(result).assertEqual('2147483647');
    });

    /**
     * @tc.name    BuiltinsStringBuilderTestAppend1800
     * @tc.number  BUILTINS_STRING_BUILDER_APPEND_INT_MIN_TEST1800
     * @tc.desc    Test StringBuilder append(int) with int min value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsStringBuilderTestAppend1800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();
      const resultBuilder: StringBuilder = builder.append(-2147483648);
      const result: string = resultBuilder.toString();
      expect(result).assertEqual('-2147483648');
    });

    /**
     * @tc.name    BuiltinsStringBuilderTestAppend1900
     * @tc.number  BUILTINS_STRING_BUILDER_APPEND_INT_SHORT_MAX_TEST1900
     * @tc.desc    Test StringBuilder append(int) with short max value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsStringBuilderTestAppend1900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();
      const resultBuilder: StringBuilder = builder.append(32767);
      const result: string = resultBuilder.toString();
      expect(result).assertEqual('32767');
    });

    /**
     * @tc.name    BuiltinsStringBuilderTestAppend2000
     * @tc.number  BUILTINS_STRING_BUILDER_APPEND_INT_SHORT_MIN_TEST2000
     * @tc.desc    Test StringBuilder append(int) with short min value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsStringBuilderTestAppend2000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();
      const resultBuilder: StringBuilder = builder.append(-32768);
      const result: string = resultBuilder.toString();
      expect(result).assertEqual('-32768');
    });

    /**
     * @tc.name    BuiltinsStringBuilderTestAppend2100
     * @tc.number  BUILTINS_STRING_BUILDER_APPEND_INT_BYTE_MAX_TEST2100
     * @tc.desc    Test StringBuilder append(int) with byte max value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsStringBuilderTestAppend2100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();
      const resultBuilder: StringBuilder = builder.append(127);
      const result: string = resultBuilder.toString();
      expect(result).assertEqual('127');
    });

    /**
     * @tc.name    BuiltinsStringBuilderTestAppend2200
     * @tc.number  BUILTINS_STRING_BUILDER_APPEND_INT_BYTE_MIN_TEST2200
     * @tc.desc    Test StringBuilder append(int) with byte min value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsStringBuilderTestAppend2200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();
      const resultBuilder: StringBuilder = builder.append(-128);
      const result: string = resultBuilder.toString();
      expect(result).assertEqual('-128');
    });

    /**
     * @tc.name    BuiltinsStringBuilderTestAppend2300
     * @tc.number  BUILTINS_STRING_BUILDER_APPEND_INT_BOUNDARY_TEST2300
     * @tc.desc    Test StringBuilder append(int) with boundary values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsStringBuilderTestAppend2300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();
      const resultBuilder: StringBuilder = builder.append(-1)
        .append(0)
        .append(1)
        .append(2147483647)
        .append(-2147483648);
      const result: string = resultBuilder.toString();
      expect(result).assertEqual('-1012147483647-2147483648');
    });

    /**
     * @tc.name    BuiltinsStringBuilderTestAppend2400
     * @tc.number  BUILTINS_STRING_BUILDER_APPEND_INT_HEX_TEST2400
     * @tc.desc    Test StringBuilder append(int) with hex value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsStringBuilderTestAppend2400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();
      const resultBuilder: StringBuilder = builder.append(0xCAFEBABE);
      const result: string = resultBuilder.toString();
      expect(result).assertEqual('3405691582');
    });

    /**
     * @tc.name    BuiltinsStringBuilderTestAppend2500
     * @tc.number  BUILTINS_STRING_BUILDER_APPEND_INT_OCTAL_TEST2500
     * @tc.desc    Test StringBuilder append(int) with octal value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsStringBuilderTestAppend2500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();
      const resultBuilder: StringBuilder = builder.append(0o377);
      const result: string = resultBuilder.toString();
      expect(result).assertEqual('255');
    });

    /**
     * @tc.name    BuiltinsStringBuilderTestAppend2600
     * @tc.number  BUILTINS_STRING_BUILDER_APPEND_INT_BINARY_TEST2600
     * @tc.desc    Test StringBuilder append(int) with binary value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsStringBuilderTestAppend2600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();
      const resultBuilder: StringBuilder = builder.append(0b11111111);
      const result: string = resultBuilder.toString();
      expect(result).assertEqual('255');
    });

    /**
     * @tc.name    BuiltinsStringBuilderTestAppend2700
     * @tc.number  BUILTINS_STRING_BUILDER_APPEND_INT_CHAIN_TEST2700
     * @tc.desc    Test StringBuilder append(int) with chaining calls
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsStringBuilderTestAppend2700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();
      const resultBuilder: StringBuilder = builder.append(1)
        .append(2)
        .append(3)
        .append(4)
        .append(5);
      const result: string = resultBuilder.toString();
      expect(result).assertEqual('12345');
      expect(resultBuilder === builder).assertTrue();
    });

    /**
     * @tc.name    BuiltinsStringBuilderTestAppend2800
     * @tc.number  BUILTINS_STRING_BUILDER_APPEND_INT_MIXED_TEST2800
     * @tc.desc    Test StringBuilder append(int) mixed with other types
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsStringBuilderTestAppend2800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();
      builder.append("Value: ");
      const resultBuilder: StringBuilder = builder.append(100);
      builder.append(" points");
      const result: string = builder.toString();
      expect(result).assertEqual('Value: 100 points');
    });

    /**
     * @tc.name    BuiltinsStringBuilderTestAppend2900
     * @tc.number  BUILTINS_STRING_BUILDER_APPEND_INT_LARGE_TEST2900
     * @tc.desc    Test StringBuilder append(int) with large values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsStringBuilderTestAppend2900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();
      const resultBuilder: StringBuilder = builder.append(990000000)
        .append(2000000000)
        .append(-990000000)
        .append(-2000000000);
      const result: string = resultBuilder.toString();
      expect(result).assertEqual('9900000002000000000-990000000-2000000000');
    });

    /**
     * @tc.name    BuiltinsStringBuilderTestAppend3000
     * @tc.number  BUILTINS_STRING_BUILDER_APPEND_INT_MID_VALUES_TEST3000
     * @tc.desc    Test StringBuilder append(int) with middle range values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsStringBuilderTestAppend3000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();
      const resultBuilder: StringBuilder = builder.append(50000)
        .append(-50000)
        .append(99000)
        .append(-99000)
        .append(999999)
        .append(-999999);
      const result: string = resultBuilder.toString();
      expect(result).assertEqual('50000-5000099000-99000999999-999999');
    });

    /**
     * @tc.name    BuiltinsStringBuilderTestAppend3100
     * @tc.number  BUILTINS_STRING_BUILDER_APPEND_INT_NEGATIVE_CHAIN_TEST3100
     * @tc.desc    Test StringBuilder append(int) with negative chaining calls
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsStringBuilderTestAppend3100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();
      const resultBuilder: StringBuilder = builder.append(-10)
        .append(-20)
        .append(-30)
        .append(-40)
        .append(-50);
      const result: string = resultBuilder.toString();
      expect(result).assertEqual('-10-20-30-40-50');
      expect(resultBuilder === builder).assertTrue();
    });

    /**
     * @tc.name    BuiltinsStringBuilderTestAppend3200
     * @tc.number  BUILTINS_STRING_BUILDER_APPEND_INT_EMPTY_BUILDER_TEST3200
     * @tc.desc    Test StringBuilder append(int) on empty builder
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsStringBuilderTestAppend3200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();
      const resultBuilder: StringBuilder = builder.append(999999);
      const result: string = resultBuilder.toString();
      expect(result).assertEqual('999999');
      expect(builder.toString()).assertEqual('999999');
    });

    /**
     * @tc.name    BuiltinsStringBuilderTestAppend3300
     * @tc.number  BUILTINS_STRING_BUILDER_APPEND_INT_UNIT_TEST3300
     * @tc.desc    Test StringBuilder append(int) with unit test values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsStringBuilderTestAppend3300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();
      const resultBuilder: StringBuilder = builder.append(42)
        .append(0)
        .append(-42)
        .append(255)
        .append(-255);
      const result: string = resultBuilder.toString();
      expect(result).assertEqual('420-42255-255');
    });

    /**
     * @tc.name    BuiltinsStringBuilderTestAppend3400
     * @tc.number  BUILTINS_STRING_BUILDER_APPEND_SHORT_ZERO_TEST3400
     * @tc.desc    Test StringBuilder append(short) with zero value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsStringBuilderTestAppend3400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();
      const resultBuilder: StringBuilder = builder.append(0 as short);
      const result: string = resultBuilder.toString();
      expect(result).assertEqual('0');
    });

    /**
     * @tc.name    BuiltinsStringBuilderTestAppend3500
     * @tc.number  BUILTINS_STRING_BUILDER_APPEND_SHORT_POSITIVE_TEST3500
     * @tc.desc    Test StringBuilder append(short) with positive value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsStringBuilderTestAppend3500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();
      const resultBuilder: StringBuilder = builder.append(12345 as short);
      const result: string = resultBuilder.toString();
      expect(result).assertEqual('12345');
    });

    /**
     * @tc.name    BuiltinsStringBuilderTestAppend3600
     * @tc.number  BUILTINS_STRING_BUILDER_APPEND_SHORT_NEGATIVE_TEST3600
     * @tc.desc    Test StringBuilder append(short) with negative value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsStringBuilderTestAppend3600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();
      const resultBuilder: StringBuilder = builder.append(-9876 as short);
      const result: string = resultBuilder.toString();
      expect(result).assertEqual('-9876');
    });

    /**
     * @tc.name    BuiltinsStringBuilderTestAppend3700
     * @tc.number  BUILTINS_STRING_BUILDER_APPEND_SHORT_MAX_TEST3700
     * @tc.desc    Test StringBuilder append(short) with short max value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsStringBuilderTestAppend3700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();
      const resultBuilder: StringBuilder = builder.append(32767 as short);
      const result: string = resultBuilder.toString();
      expect(result).assertEqual('32767');
    });

    /**
     * @tc.name    BuiltinsStringBuilderTestAppend3800
     * @tc.number  BUILTINS_STRING_BUILDER_APPEND_SHORT_MIN_TEST3800
     * @tc.desc    Test StringBuilder append(short) with short min value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsStringBuilderTestAppend3800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();
      const resultBuilder: StringBuilder = builder.append(-32768 as short);
      const result: string = resultBuilder.toString();
      expect(result).assertEqual('-32768');
    });

    /**
     * @tc.name    BuiltinsStringBuilderTestAppend3900
     * @tc.number  BUILTINS_STRING_BUILDER_APPEND_SHORT_BYTE_MAX_TEST3900
     * @tc.desc    Test StringBuilder append(short) with byte max value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsStringBuilderTestAppend3900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();
      const resultBuilder: StringBuilder = builder.append(127 as short);
      const result: string = resultBuilder.toString();
      expect(result).assertEqual('127');
    });

    /**
     * @tc.name    BuiltinsStringBuilderTestAppend4000
     * @tc.number  BUILTINS_STRING_BUILDER_APPEND_SHORT_BYTE_MIN_TEST4000
     * @tc.desc    Test StringBuilder append(short) with byte min value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsStringBuilderTestAppend4000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();
      const resultBuilder: StringBuilder = builder.append(-128 as short);
      const result: string = resultBuilder.toString();
      expect(result).assertEqual('-128');
    });

    /**
     * @tc.name    BuiltinsStringBuilderTestAppend4100
     * @tc.number  BUILTINS_STRING_BUILDER_APPEND_SHORT_BOUNDARY_TEST4100
     * @tc.desc    Test StringBuilder append(short) with boundary values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsStringBuilderTestAppend4100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();
      const resultBuilder: StringBuilder = builder.append(-1 as short)
        .append(0 as short)
        .append(1 as short)
        .append(32767 as short)
        .append(-32768 as short);
      const result: string = resultBuilder.toString();
      expect(result).assertEqual('-10132767-32768');
    });

    /**
     * @tc.name    BuiltinsStringBuilderTestAppend4200
     * @tc.number  BUILTINS_STRING_BUILDER_APPEND_SHORT_CHAIN_TEST4200
     * @tc.desc    Test StringBuilder append(short) with chaining calls
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsStringBuilderTestAppend4200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();
      const resultBuilder: StringBuilder = builder.append(1 as short)
        .append(2 as short)
        .append(3 as short)
        .append(4 as short)
        .append(5 as short);
      const result: string = resultBuilder.toString();
      expect(result).assertEqual('12345');
      expect(resultBuilder === builder).assertTrue();
    });

    /**
     * @tc.name    BuiltinsStringBuilderTestAppend4300
     * @tc.number  BUILTINS_STRING_BUILDER_APPEND_SHORT_MIXED_TEST4300
     * @tc.desc    Test StringBuilder append(short) mixed with other types
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsStringBuilderTestAppend4300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();
      builder.append("Score: ");
      const resultBuilder: StringBuilder = builder.append(100 as short);
      builder.append(" points");
      const result: string = builder.toString();
      expect(result).assertEqual('Score: 100 points');
    });

    /**
     * @tc.name    BuiltinsStringBuilderTestAppend4400
     * @tc.number  BUILTINS_STRING_BUILDER_APPEND_SHORT_MID_VALUES_TEST4400
     * @tc.desc    Test StringBuilder append(short) with middle range values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsStringBuilderTestAppend4400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();
      const resultBuilder: StringBuilder = builder.append(500 as short)
        .append(-500 as short)
        .append(1000 as short)
        .append(-1000 as short)
        .append(9999 as short)
        .append(-9999 as short);
      const result: string = resultBuilder.toString();
      expect(result).assertEqual('500-5001000-10009999-9999');
    });

    /**
     * @tc.name    BuiltinsStringBuilderTestAppend4500
     * @tc.number  BUILTINS_STRING_BUILDER_APPEND_SHORT_NEGATIVE_CHAIN_TEST4500
     * @tc.desc    Test StringBuilder append(short) with negative chaining calls
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsStringBuilderTestAppend4500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();
      const resultBuilder: StringBuilder = builder.append(-10 as short)
        .append(-20 as short)
        .append(-30 as short)
        .append(-40 as short)
        .append(-50 as short);
      const result: string = resultBuilder.toString();
      expect(result).assertEqual('-10-20-30-40-50');
      expect(resultBuilder === builder).assertTrue();
    });

    /**
     * @tc.name    BuiltinsStringBuilderTestAppend4600
     * @tc.number  BUILTINS_STRING_BUILDER_APPEND_SHORT_UNIT_TEST4600
     * @tc.desc    Test StringBuilder append(short) with unit test values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsStringBuilderTestAppend4600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();
      const resultBuilder: StringBuilder = builder.append(42 as short)
        .append(0 as short)
        .append(-42 as short)
        .append(255 as short)
        .append(-255 as short);
      const result: string = resultBuilder.toString();
      expect(result).assertEqual('420-42255-255');
    });

    /**
     * @tc.name    BuiltinsStringBuilderTestAppend4700
     * @tc.number  BUILTINS_STRING_BUILDER_APPEND_SHORT_HEX_TEST4700
     * @tc.desc    Test StringBuilder append(short) with hex value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsStringBuilderTestAppend4700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();
      const resultBuilder: StringBuilder = builder.append(0x7FFF as short);
      const result: string = resultBuilder.toString();
      expect(result).assertEqual('32767');
    });

    /**
     * @tc.name    BuiltinsStringBuilderTestAppend4800
     * @tc.number  BUILTINS_STRING_BUILDER_APPEND_SHORT_OCTAL_TEST4800
     * @tc.desc    Test StringBuilder append(short) with octal value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsStringBuilderTestAppend4800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();
      const resultBuilder: StringBuilder = builder.append(0o377 as short);
      const result: string = resultBuilder.toString();
      expect(result).assertEqual('255');
    });

    /**
     * @tc.name    BuiltinsStringBuilderTestAppend4900
     * @tc.number  BUILTINS_STRING_BUILDER_APPEND_SHORT_BINARY_TEST4900
     * @tc.desc    Test StringBuilder append(short) with binary value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsStringBuilderTestAppend4900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();
      const resultBuilder: StringBuilder = builder.append(0b11111111 as short);
      const result: string = resultBuilder.toString();
      expect(result).assertEqual('255');
    });

    /**
     * @tc.name    BuiltinsStringBuilderTestAppend5000
     * @tc.number  BUILTINS_STRING_BUILDER_APPEND_SHORT_EMPTY_BUILDER_TEST5000
     * @tc.desc    Test StringBuilder append(short) on empty builder
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsStringBuilderTestAppend5000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();
      const resultBuilder: StringBuilder = builder.append(9999 as short);
      const result: string = resultBuilder.toString();
      expect(result).assertEqual('9999');
      expect(builder.toString()).assertEqual('9999');
    });

    /**
     * @tc.name    BuiltinsStringBuilderTestAppend5100
     * @tc.number  BUILTINS_STRING_BUILDER_APPEND_SHORT_POSITIVE_RANGE_TEST5100
     * @tc.desc    Test StringBuilder append(short) with positive range values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsStringBuilderTestAppend5100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();
      const resultBuilder: StringBuilder = builder.append(1000 as short)
        .append(2000 as short)
        .append(3000 as short)
        .append(4000 as short)
        .append(5000 as short);
      const result: string = resultBuilder.toString();
      expect(result).assertEqual('10002000300040005000');
    });

    /**
     * @tc.name    BuiltinsStringBuilderTestAppend5200
     * @tc.number  BUILTINS_STRING_BUILDER_APPEND_SHORT_NEGATIVE_RANGE_TEST5200
     * @tc.desc    Test StringBuilder append(short) with negative range values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsStringBuilderTestAppend5200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();
      const resultBuilder: StringBuilder = builder.append(-1000 as short)
        .append(-2000 as short)
        .append(-3000 as short)
        .append(-4000 as short)
        .append(-5000 as short);
      const result: string = resultBuilder.toString();
      expect(result).assertEqual('-1000-2000-3000-4000-5000');
    });

    /**
     * @tc.name    BuiltinsStringBuilderTestAppend5300
     * @tc.number  BUILTINS_STRING_BUILDER_APPEND_SHORT_MIXED_SIGN_TEST5300
     * @tc.desc    Test StringBuilder append(short) with mixed positive and negative values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsStringBuilderTestAppend5300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();
      const resultBuilder: StringBuilder = builder.append(10 as short)
        .append(-20 as short)
        .append(30 as short)
        .append(-40 as short)
        .append(50 as short);
      const result: string = resultBuilder.toString();
      expect(result).assertEqual('10-2030-4050');
    });
    /**
     * @tc.name    BuiltinsStringBuilderTestAppend5400
     * @tc.number  BUILTINS_STRING_BUILDER_APPEND_CHAR_ZERO_TEST5400
     * @tc.desc    Test StringBuilder append(char) with zero char
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsStringBuilderTestAppend5400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();
      const resultBuilder: StringBuilder = builder.append('\u0000');
      const result: string = resultBuilder.toString();
      expect(result).assertEqual('\u0000');
    });

    /**
     * @tc.name    BuiltinsStringBuilderTestAppend5500
     * @tc.number  BUILTINS_STRING_BUILDER_APPEND_CHAR_ASCII_TEST5500
     * @tc.desc    Test StringBuilder append(char) with ASCII characters
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsStringBuilderTestAppend5500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();
      const resultBuilder: StringBuilder = builder.append('A')
        .append('B')
        .append('C')
        .append('1')
        .append('2')
        .append('3');
      const result: string = resultBuilder.toString();
      expect(result).assertEqual('ABC123');
    });

    /**
     * @tc.name    BuiltinsStringBuilderTestAppend5600
     * @tc.number  BUILTINS_STRING_BUILDER_APPEND_CHAR_SPECIAL_TEST5600
     * @tc.desc    Test StringBuilder append(char) with special characters
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsStringBuilderTestAppend5600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();
      const resultBuilder: StringBuilder = builder.append('!')
        .append('@')
        .append('#')
        .append('$')
        .append('%');
      const result: string = resultBuilder.toString();
      expect(result).assertEqual('!@#$%');
    });

    /**
     * @tc.name    BuiltinsStringBuilderTestAppend5700
     * @tc.number  BUILTINS_STRING_BUILDER_APPEND_CHAR_ESCAPE_TEST5700
     * @tc.desc    Test StringBuilder append(char) with escape characters
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsStringBuilderTestAppend5700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();
      const resultBuilder: StringBuilder = builder.append('\n')
        .append('\t')
        .append('\r')
        .append('\\')
        .append('\'')
        .append('\"');
      const result: string = resultBuilder.toString();
      expect(result).assertEqual('\n\t\r\\\'\"');
    });

    /**
     * @tc.name    BuiltinsStringBuilderTestAppend5800
     * @tc.number  BUILTINS_STRING_BUILDER_APPEND_CHAR_MAX_TEST5800
     * @tc.desc    Test StringBuilder append(char) with char max value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsStringBuilderTestAppend5800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();
      const resultBuilder: StringBuilder = builder.append('\uFFFF');
      const result: string = resultBuilder.toString();
      expect(result).assertEqual('\uFFFF');
    });

    /**
     * @tc.name    BuiltinsStringBuilderTestAppend5900
     * @tc.number  BUILTINS_STRING_BUILDER_APPEND_CHAR_MID_RANGE_TEST5900
     * @tc.desc    Test StringBuilder append(char) with middle range characters
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsStringBuilderTestAppend5900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();
      const resultBuilder: StringBuilder = builder.append('\u0080')
        .append('\u00FF')
        .append('\u0100')
        .append('\u07FF')
        .append('\u0800')
        .append('\u0FFF');
      const result: string = resultBuilder.toString();
      expect(result).assertEqual('\u0080\u00FF\u0100\u07FF\u0800\u0FFF');
    });

    /**
     * @tc.name    BuiltinsStringBuilderTestAppend6000
     * @tc.number  BUILTINS_STRING_BUILDER_APPEND_CHAR_CHAIN_TEST6000
     * @tc.desc    Test StringBuilder append(char) with chaining calls
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsStringBuilderTestAppend6000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();
      const resultBuilder: StringBuilder = builder.append('H')
        .append('e')
        .append('l')
        .append('l')
        .append('o');
      const result: string = resultBuilder.toString();
      expect(result).assertEqual('Hello');
      expect(resultBuilder === builder).assertTrue();
    });

    /**
     * @tc.name    BuiltinsStringBuilderTestAppend6100
     * @tc.number  BUILTINS_STRING_BUILDER_APPEND_CHAR_MIXED_TEST6100
     * @tc.desc    Test StringBuilder append(char) mixed with other types
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsStringBuilderTestAppend6100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();
      builder.append("Prefix: ");
      const resultBuilder: StringBuilder = builder.append('X');
      builder.append(" Suffix");
      const result: string = builder.toString();
      expect(result).assertEqual('Prefix: X Suffix');
    });

    /**
     * @tc.name    BuiltinsStringBuilderTestAppend6200
     * @tc.number  BUILTINS_STRING_BUILDER_APPEND_CHAR_EMOJI_TEST6200
     * @tc.desc    Test StringBuilder append(char) with emoji characters
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsStringBuilderTestAppend6200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();
      const resultBuilder: StringBuilder = builder.append('😊')
        .append('🌟')
        .append('🎉')
        .append('🚀')
        .append('💡');
      const result: string = resultBuilder.toString();
      expect(result).assertEqual('😊🌟🎉🚀💡');
    });

    /**
     * @tc.name    BuiltinsStringBuilderTestAppend6300
     * @tc.number  BUILTINS_STRING_BUILDER_APPEND_CHAR_SPACE_TEST6300
     * @tc.desc    Test StringBuilder append(char) with space characters
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsStringBuilderTestAppend6300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();
      const resultBuilder: StringBuilder = builder.append(' ')
        .append('\t')
        .append('\n')
        .append('\r')
        .append('\f');
      const result: string = resultBuilder.toString();
      expect(result).assertEqual(' \t\n\r\f');
    });

    /**
     * @tc.name    BuiltinsStringBuilderTestAppend6400
     * @tc.number  BUILTINS_STRING_BUILDER_APPEND_CHAR_DIGITS_TEST6400
     * @tc.desc    Test StringBuilder append(char) with digit characters
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsStringBuilderTestAppend6400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();
      const resultBuilder: StringBuilder = builder.append('0')
        .append('1')
        .append('2')
        .append('3')
        .append('4')
        .append('5')
        .append('6')
        .append('7')
        .append('8')
        .append('9');
      const result: string = resultBuilder.toString();
      expect(result).assertEqual('0123456789');
    });

    /**
     * @tc.name    BuiltinsStringBuilderTestAppend6500
     * @tc.number  BUILTINS_STRING_BUILDER_APPEND_CHAR_LETTERS_TEST6500
     * @tc.desc    Test StringBuilder append(char) with letter characters
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsStringBuilderTestAppend6500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();
      const resultBuilder: StringBuilder = builder.append('a')
        .append('b')
        .append('c')
        .append('d')
        .append('e')
        .append('f')
        .append('g')
        .append('h')
        .append('i')
        .append('j');
      const result: string = resultBuilder.toString();
      expect(result).assertEqual('abcdefghij');
    });

    /**
     * @tc.name    BuiltinsStringBuilderTestAppend6600
     * @tc.number  BUILTINS_STRING_BUILDER_APPEND_CHAR_UNICODE_TEST6600
     * @tc.desc    Test StringBuilder append(char) with Unicode escape sequences
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsStringBuilderTestAppend6600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();
      const resultBuilder: StringBuilder = builder.append('\u0041')
        .append('\u0042')
        .append('\u0043')
        .append('\u0394')
        .append('\u03A9');
      const result: string = resultBuilder.toString();
      expect(result).assertEqual('ABCΔΩ');
    });

    /**
     * @tc.name    BuiltinsStringBuilderTestAppend6700
     * @tc.number  BUILTINS_STRING_BUILDER_APPEND_CHAR_HEX_TEST6700
     * @tc.desc    Test StringBuilder append(char) with hex escape characters
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsStringBuilderTestAppend6700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();
      const resultBuilder: StringBuilder = builder.append('\x41')
        .append('\x42')
        .append('\x43')
        .append('\x61')
        .append('\x62')
        .append('\x63');
      const result: string = resultBuilder.toString();
      expect(result).assertEqual('ABCabc');
    });



    /**
     * @tc.name    BuiltinsStringBuilderTestAppend6800
     * @tc.number  BUILTINS_STRING_BUILDER_APPEND_CHAR_BOUNDARY_TEST6800
     * @tc.desc    Test StringBuilder append(char) with boundary characters
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsStringBuilderTestAppend6800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();
      const resultBuilder: StringBuilder = builder.append('\u0000')
        .append('\u0020')
        .append('\u007F')
        .append('\u0080')
        .append('\u00FF')
        .append('\u0100')
        .append('\uFFFF');
      const result: string = resultBuilder.toString();
      expect(result).assertEqual('\u0000\u0020\u007F\u0080\u00FF\u0100\uFFFF');
    });

    /**
     * @tc.name    BuiltinsStringBuilderTestAppend6900
     * @tc.number  BUILTINS_STRING_BUILDER_APPEND_CHAR_SYMBOLS_TEST6900
     * @tc.desc    Test StringBuilder append(char) with symbol characters
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsStringBuilderTestAppend6900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();
      const resultBuilder: StringBuilder = builder.append('+')
        .append('-')
        .append('*')
        .append('/')
        .append('=')
        .append('<')
        .append('>')
        .append('[')
        .append(']')
        .append('{')
        .append('}');
      const result: string = resultBuilder.toString();
      expect(result).assertEqual('+-*/=<>[]{}');
    });

    /**
     * @tc.name    BuiltinsStringBuilderTestAppend7000
     * @tc.number  BUILTINS_STRING_BUILDER_APPEND_CHAR_CONTROL_TEST7000
     * @tc.desc    Test StringBuilder append(char) with control characters
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsStringBuilderTestAppend7000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();
      const resultBuilder: StringBuilder = builder.append('\u0001')
        .append('\u0002')
        .append('\u0003')
        .append('\u0004')
        .append('\u0005');
      const result: string = resultBuilder.toString();
      expect(result).assertEqual('\u0001\u0002\u0003\u0004\u0005');
    });

    /**
     * @tc.name    BuiltinsStringBuilderTestAppend7100
     * @tc.number  BUILTINS_STRING_BUILDER_APPEND_CHAR_ARABIC_TEST7100
     * @tc.desc    Test StringBuilder append(char) with Arabic characters
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsStringBuilderTestAppend7100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();
      const resultBuilder: StringBuilder = builder.append('ا')
        .append('ب')
        .append('ت')
        .append('ث')
        .append('ج');
      const result: string = resultBuilder.toString();
      expect(result).assertEqual('ابتثج');
    });

    /**
     * @tc.name    BuiltinsStringBuilderTestAppend7200
     * @tc.number  BUILTINS_STRING_BUILDER_APPEND_CHAR_EMPTY_BUILDER_TEST7200
     * @tc.desc    Test StringBuilder append(char) on empty builder
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsStringBuilderTestAppend7200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();
      const resultBuilder: StringBuilder = builder.append('Z');
      const result: string = resultBuilder.toString();
      expect(result).assertEqual('Z');
      expect(builder.toString()).assertEqual('Z');
    });
    /**
     * @tc.name    BuiltinsStringBuilderTestAppend7300
     * @tc.number  BUILTINS_STRING_BUILDER_APPEND_BYTE_ZERO_TEST7300
     * @tc.desc    Test StringBuilder append(byte) with zero value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsStringBuilderTestAppend7300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();
      const resultBuilder: StringBuilder = builder.append(0 as byte);
      const result: string = resultBuilder.toString();
      expect(result).assertEqual('0');
    });

    /**
     * @tc.name    BuiltinsStringBuilderTestAppend7400
     * @tc.number  BUILTINS_STRING_BUILDER_APPEND_BYTE_POSITIVE_TEST7400
     * @tc.desc    Test StringBuilder append(byte) with positive value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsStringBuilderTestAppend7400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();
      const resultBuilder: StringBuilder = builder.append(100 as byte);
      const result: string = resultBuilder.toString();
      expect(result).assertEqual('100');
    });

    /**
     * @tc.name    BuiltinsStringBuilderTestAppend7500
     * @tc.number  BUILTINS_STRING_BUILDER_APPEND_BYTE_NEGATIVE_TEST7500
     * @tc.desc    Test StringBuilder append(byte) with negative value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsStringBuilderTestAppend7500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();
      const resultBuilder: StringBuilder = builder.append(-50 as byte);
      const result: string = resultBuilder.toString();
      expect(result).assertEqual('-50');
    });

    /**
     * @tc.name    BuiltinsStringBuilderTestAppend7600
     * @tc.number  BUILTINS_STRING_BUILDER_APPEND_BYTE_MAX_TEST7600
     * @tc.desc    Test StringBuilder append(byte) with byte max value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsStringBuilderTestAppend7600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();
      const resultBuilder: StringBuilder = builder.append(127 as byte);
      const result: string = resultBuilder.toString();
      expect(result).assertEqual('127');
    });

    /**
     * @tc.name    BuiltinsStringBuilderTestAppend7700
     * @tc.number  BUILTINS_STRING_BUILDER_APPEND_BYTE_MIN_TEST7700
     * @tc.desc    Test StringBuilder append(byte) with byte min value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsStringBuilderTestAppend7700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();
      const resultBuilder: StringBuilder = builder.append(-128 as byte);
      const result: string = resultBuilder.toString();
      expect(result).assertEqual('-128');
    });

    /**
     * @tc.name    BuiltinsStringBuilderTestAppend7800
     * @tc.number  BUILTINS_STRING_BUILDER_APPEND_BYTE_BOUNDARY_TEST7800
     * @tc.desc    Test StringBuilder append(byte) with boundary values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsStringBuilderTestAppend7800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();
      const resultBuilder: StringBuilder = builder.append(-1 as byte)
        .append(0 as byte)
        .append(1 as byte)
        .append(127 as byte)
        .append(-128 as byte);
      const result: string = resultBuilder.toString();
      expect(result).assertEqual('-101127-128');
    });

    /**
     * @tc.name    BuiltinsStringBuilderTestAppend7900
     * @tc.number  BUILTINS_STRING_BUILDER_APPEND_BYTE_CHAIN_TEST7900
     * @tc.desc    Test StringBuilder append(byte) with chaining calls
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsStringBuilderTestAppend7900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();
      const resultBuilder: StringBuilder = builder.append(1 as byte)
        .append(2 as byte)
        .append(3 as byte)
        .append(4 as byte)
        .append(5 as byte);
      const result: string = resultBuilder.toString();
      expect(result).assertEqual('12345');
      expect(resultBuilder === builder).assertTrue();
    });

    /**
     * @tc.name    BuiltinsStringBuilderTestAppend8000
     * @tc.number  BUILTINS_STRING_BUILDER_APPEND_BYTE_MIXED_TEST8000
     * @tc.desc    Test StringBuilder append(byte) mixed with other types
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsStringBuilderTestAppend8000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();
      builder.append("Value: ");
      const resultBuilder: StringBuilder = builder.append(99 as byte);
      builder.append(" units");
      const result: string = builder.toString();
      expect(result).assertEqual('Value: 99 units');
    });

    /**
     * @tc.name    BuiltinsStringBuilderTestAppend8100
     * @tc.number  BUILTINS_STRING_BUILDER_APPEND_BYTE_MID_VALUES_TEST8100
     * @tc.desc    Test StringBuilder append(byte) with middle range values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsStringBuilderTestAppend8100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();
      const resultBuilder: StringBuilder = builder.append(50 as byte)
        .append(-50 as byte)
        .append(100 as byte)
        .append(-100 as byte)
        .append(64 as byte)
        .append(-64 as byte);
      const result: string = resultBuilder.toString();
      expect(result).assertEqual('50-50100-10064-64');
    });

    /**
     * @tc.name    BuiltinsStringBuilderTestAppend8200
     * @tc.number  BUILTINS_STRING_BUILDER_APPEND_BYTE_NEGATIVE_CHAIN_TEST8200
     * @tc.desc    Test StringBuilder append(byte) with negative chaining calls
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsStringBuilderTestAppend8200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();
      const resultBuilder: StringBuilder = builder.append(-10 as byte)
        .append(-20 as byte)
        .append(-30 as byte)
        .append(-40 as byte)
        .append(-50 as byte);
      const result: string = resultBuilder.toString();
      expect(result).assertEqual('-10-20-30-40-50');
      expect(resultBuilder === builder).assertTrue();
    });

    /**
     * @tc.name    BuiltinsStringBuilderTestAppend8300
     * @tc.number  BUILTINS_STRING_BUILDER_APPEND_BYTE_UNIT_TEST8300
     * @tc.desc    Test StringBuilder append(byte) with unit test values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsStringBuilderTestAppend8300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();
      const resultBuilder: StringBuilder = builder.append(42 as byte)
        .append(0 as byte)
        .append(-42 as byte)
        .append(127 as byte)
        .append(-128 as byte);
      const result: string = resultBuilder.toString();
      expect(result).assertEqual('420-42127-128');
    });

    /**
     * @tc.name    BuiltinsStringBuilderTestAppend8400
     * @tc.number  BUILTINS_STRING_BUILDER_APPEND_BYTE_HEX_TEST8400
     * @tc.desc    Test StringBuilder append(byte) with hex value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsStringBuilderTestAppend8400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();
      const resultBuilder: StringBuilder = builder.append(0x7F as byte);
      const result: string = resultBuilder.toString();
      expect(result).assertEqual('127');
    });

    /**
     * @tc.name    BuiltinsStringBuilderTestAppend8500
     * @tc.number  BUILTINS_STRING_BUILDER_APPEND_BYTE_OCTAL_TEST8500
     * @tc.desc    Test StringBuilder append(byte) with octal value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsStringBuilderTestAppend8500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();
      const resultBuilder: StringBuilder = builder.append(0o177 as byte);
      const result: string = resultBuilder.toString();
      expect(result).assertEqual('127');
    });

    /**
     * @tc.name    BuiltinsStringBuilderTestAppend8600
     * @tc.number  BUILTINS_STRING_BUILDER_APPEND_BYTE_BINARY_TEST8600
     * @tc.desc    Test StringBuilder append(byte) with binary value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsStringBuilderTestAppend8600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();
      const resultBuilder: StringBuilder = builder.append(0b01111111 as byte);
      const result: string = resultBuilder.toString();
      expect(result).assertEqual('127');
    });

    /**
     * @tc.name    BuiltinsStringBuilderTestAppend8700
     * @tc.number  BUILTINS_STRING_BUILDER_APPEND_BYTE_EMPTY_BUILDER_TEST8700
     * @tc.desc    Test StringBuilder append(byte) on empty builder
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsStringBuilderTestAppend8700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();
      const resultBuilder: StringBuilder = builder.append(99 as byte);
      const result: string = resultBuilder.toString();
      expect(result).assertEqual('99');
      expect(builder.toString()).assertEqual('99');
    });

    /**
     * @tc.name    BuiltinsStringBuilderTestAppend8800
     * @tc.number  BUILTINS_STRING_BUILDER_APPEND_BYTE_POSITIVE_RANGE_TEST8800
     * @tc.desc    Test StringBuilder append(byte) with positive range values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsStringBuilderTestAppend8800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();
      const resultBuilder: StringBuilder = builder.append(10 as byte)
        .append(20 as byte)
        .append(30 as byte)
        .append(40 as byte)
        .append(50 as byte)
        .append(60 as byte)
        .append(70 as byte)
        .append(80 as byte)
        .append(90 as byte)
        .append(100 as byte);
      const result: string = resultBuilder.toString();
      expect(result).assertEqual('102030405060708090100');
    });

    /**
     * @tc.name    BuiltinsStringBuilderTestAppend8900
     * @tc.number  BUILTINS_STRING_BUILDER_APPEND_BYTE_NEGATIVE_RANGE_TEST8900
     * @tc.desc    Test StringBuilder append(byte) with negative range values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsStringBuilderTestAppend8900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();
      const resultBuilder: StringBuilder = builder.append(-10 as byte)
        .append(-20 as byte)
        .append(-30 as byte)
        .append(-40 as byte)
        .append(-50 as byte)
        .append(-60 as byte)
        .append(-70 as byte)
        .append(-80 as byte)
        .append(-90 as byte)
        .append(-100 as byte);
      const result: string = resultBuilder.toString();
      expect(result).assertEqual('-10-20-30-40-50-60-70-80-90-100');
    });

    /**
     * @tc.name    BuiltinsStringBuilderTestAppend9000
     * @tc.number  BUILTINS_STRING_BUILDER_APPEND_BYTE_MIXED_SIGN_TEST9000
     * @tc.desc    Test StringBuilder append(byte) with mixed positive and negative values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsStringBuilderTestAppend9000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();
      const resultBuilder: StringBuilder = builder.append(10 as byte)
        .append(-20 as byte)
        .append(30 as byte)
        .append(-40 as byte)
        .append(50 as byte)
        .append(-60 as byte)
        .append(70 as byte)
        .append(-80 as byte)
        .append(90 as byte)
        .append(-100 as byte);
      const result: string = resultBuilder.toString();
      expect(result).assertEqual('10-2030-4050-6070-8090-100');
    });

    /**
     * @tc.name    BuiltinsStringBuilderTestAppend9100
     * @tc.number  BUILTINS_STRING_BUILDER_APPEND_BYTE_ASCII_VALUES_TEST9100
     * @tc.desc    Test StringBuilder append(byte) with ASCII character values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsStringBuilderTestAppend9100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();
      const resultBuilder: StringBuilder = builder.append(65 as byte)   // 'A'
        .append(66 as byte)
        .append(67 as byte)
        .append(97 as byte)
        .append(98 as byte)
        .append(99 as byte);
      const result: string = resultBuilder.toString();
      expect(result).assertEqual('656667979899');
    });

    /**
     * @tc.name    BuiltinsStringBuilderTestAppend9200
     * @tc.number  BUILTINS_STRING_BUILDER_APPEND_BYTE_EDGE_CASES_TEST9200
     * @tc.desc    Test StringBuilder append(byte) with edge case values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsStringBuilderTestAppend9200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();
      const resultBuilder: StringBuilder = builder.append(0 as byte)
        .append(1 as byte)
        .append(-1 as byte)
        .append(126 as byte)
        .append(127 as byte)
        .append(-127 as byte)
        .append(-128 as byte);
      const result: string = resultBuilder.toString();
      expect(result).assertEqual('01-1126127-127-128');
    });

    /**
     * @tc.name    BuiltinsStringBuilderTestAppend9300
     * @tc.number  BUILTINS_STRING_BUILDER_APPEND_BYTE_SMALL_VALUES_TEST9300
     * @tc.desc    Test StringBuilder append(byte) with small values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsStringBuilderTestAppend9300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();
      const resultBuilder: StringBuilder = builder.append(-5 as byte)
        .append(-4 as byte)
        .append(-3 as byte)
        .append(-2 as byte)
        .append(-1 as byte)
        .append(0 as byte)
        .append(1 as byte)
        .append(2 as byte)
        .append(3 as byte)
        .append(4 as byte)
        .append(5 as byte);
      const result: string = resultBuilder.toString();
      expect(result).assertEqual('-5-4-3-2-1012345');
    });

    /**
     * @tc.name    BuiltinsStringBuilderTestAppend9400
     * @tc.number  BUILTINS_STRING_BUILDER_APPEND_BOOLEAN_TRUE_TEST9400
     * @tc.desc    Test StringBuilder append(boolean) with true
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsStringBuilderTestAppend9400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();
      const resultBuilder: StringBuilder = builder.append(true);
      const result: string = resultBuilder.toString();
      expect(result).assertEqual('true');
    });

    /**
     * @tc.name    BuiltinsStringBuilderTestAppend9500
     * @tc.number  BUILTINS_STRING_BUILDER_APPEND_BOOLEAN_FALSE_TEST9500
     * @tc.desc    Test StringBuilder append(boolean) with false
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsStringBuilderTestAppend9500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();
      const resultBuilder: StringBuilder = builder.append(false);
      const result: string = resultBuilder.toString();
      expect(result).assertEqual('false');
    });

    /**
     * @tc.name    BuiltinsStringBuilderTestAppend9600
     * @tc.number  BUILTINS_STRING_BUILDER_APPEND_BOOLEAN_MIXED_TEST9600
     * @tc.desc    Test StringBuilder append(boolean) with mixed true/false values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsStringBuilderTestAppend9600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();
      const resultBuilder: StringBuilder = builder.append(true)
        .append(false)
        .append(true)
        .append(true)
        .append(false);
      const result: string = resultBuilder.toString();
      expect(result).assertEqual('truefalsetruetruefalse');
    });

    /**
     * @tc.name    BuiltinsStringBuilderTestAppend9700
     * @tc.number  BUILTINS_STRING_BUILDER_APPEND_BOOLEAN_CHAIN_TEST9700
     * @tc.desc    Test StringBuilder append(boolean) with multiple chained calls
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsStringBuilderTestAppend9700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();
      const resultBuilder: StringBuilder = builder.append(true)
        .append(false)
        .append(true);
      const result: string = resultBuilder.toString();
      expect(result).assertEqual('truefalsetrue');
    });

    /**
     * @tc.name    BuiltinsStringBuilderTestAppend9800
     * @tc.number  BUILTINS_STRING_BUILDER_APPEND_BOOLEAN_WITH_PREFIX_TEST9800
     * @tc.desc    Test StringBuilder append(boolean) after appending other types
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsStringBuilderTestAppend9800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();
      const resultBuilder: StringBuilder = builder.append("Result: ")
        .append(true)
        .append(", Status: ")
        .append(false);
      const result: string = resultBuilder.toString();
      expect(result).assertEqual('Result: true, Status: false');
    });

    /**
     * @tc.name    BuiltinsStringBuilderTestAppend9900
     * @tc.number  BUILTINS_STRING_BUILDER_APPEND_BOOLEAN_EMPTY_BUILDER_TEST9900
     * @tc.desc    Test StringBuilder append(boolean) on empty builder
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsStringBuilderTestAppend9900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();
      const resultBuilder: StringBuilder = builder.append(false);
      const result: string = resultBuilder.toString();
      expect(result).assertEqual('false');
    });

    /**
     * @tc.name    BuiltinsStringBuilderTestAppend10000
     * @tc.number  BUILTINS_STRING_BUILDER_APPEND_BOOLEAN_REPEATED_TRUE_TEST10000
     * @tc.desc    Test StringBuilder append(boolean) with repeated true values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsStringBuilderTestAppend10000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();
      const resultBuilder: StringBuilder = builder.append(true)
        .append(true)
        .append(true)
        .append(true)
        .append(true);
      const result: string = resultBuilder.toString();
      expect(result).assertEqual('truetruetruetruetrue');
    });

    /**
     * @tc.name    BuiltinsStringBuilderTestAppend10100
     * @tc.number  BUILTINS_STRING_BUILDER_APPEND_BOOLEAN_REPEATED_FALSE_TEST10100
     * @tc.desc    Test StringBuilder append(boolean) with repeated false values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsStringBuilderTestAppend10100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();
      const resultBuilder: StringBuilder = builder.append(false)
        .append(false)
        .append(false)
        .append(false)
        .append(false);
      const result: string = resultBuilder.toString();
      expect(result).assertEqual('falsefalsefalsefalsefalse');
    });

    /**
     * @tc.name    BuiltinsStringBuilderTestAppend10200
     * @tc.number  BUILTINS_STRING_BUILDER_APPEND_BOOLEAN_ALTERNATING_TEST10200
     * @tc.desc    Test StringBuilder append(boolean) with alternating true/false pattern
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsStringBuilderTestAppend10200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();
      const resultBuilder: StringBuilder = builder.append(true)
        .append(false)
        .append(true)
        .append(false)
        .append(true)
        .append(false);
      const result: string = resultBuilder.toString();
      expect(result).assertEqual('truefalsetruefalsetruefalse');
    });

    /**
     * @tc.name    BuiltinsStringBuilderTestAppend10300
     * @tc.number  BUILTINS_STRING_BUILDER_APPEND_BOOLEAN_WITH_NUMBERS_TEST10300
     * @tc.desc    Test StringBuilder append(boolean) mixed with number values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsStringBuilderTestAppend10300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();
      const resultBuilder: StringBuilder = builder.append("Flag1: ")
        .append(true)
        .append(", Count: ")
        .append(42 as byte)
        .append(", Flag2: ")
        .append(false);
      const result: string = resultBuilder.toString();
      expect(result).assertEqual('Flag1: true, Count: 42, Flag2: false');
    });

    /**
     * @tc.name    BuiltinsStringBuilderTestAppend10400
     * @tc.number  BUILTINS_STRING_BUILDER_APPEND_BOOLEAN_COMPLEX_PATTERN_TEST10400
     * @tc.desc    Test StringBuilder append(boolean) with complex pattern
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsStringBuilderTestAppend10400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();
      const resultBuilder: StringBuilder = builder.append("Start-")
        .append(true)
        .append("-Middle-")
        .append(false)
        .append("-End-")
        .append(true)
        .append("-Finish");
      const result: string = resultBuilder.toString();
      expect(result).assertEqual('Start-true-Middle-false-End-true-Finish');
    });

    /**
     * @tc.name    BuiltinsStringBuilderTestAppend10500
     * @tc.number  BUILTINS_STRING_BUILDER_APPEND_BOOLEAN_SINGLE_CHAR_TEST10500
     * @tc.desc    Test StringBuilder append(boolean) with single character before/after
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsStringBuilderTestAppend10500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();
      const resultBuilder: StringBuilder = builder.append('T')
        .append(true)
        .append('F')
        .append(false)
        .append('X');
      const result: string = resultBuilder.toString();
      expect(result).assertEqual('TtrueFfalseX');
    });

    /**
     * @tc.name    BuiltinsStringBuilderTestAppend10600
     * @tc.number  BUILTINS_STRING_BUILDER_APPEND_BOOLEAN_ONLY_TEST10600
     * @tc.desc    Test StringBuilder append(boolean) only (no other content)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsStringBuilderTestAppend10600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();
      const resultBuilder: StringBuilder = builder.append(true);
      const result: string = resultBuilder.toString();
      expect(result).assertEqual('true');

      const builder2: StringBuilder = new StringBuilder();
      const resultBuilder2: StringBuilder = builder2.append(false);
      const result2: string = resultBuilder2.toString();
      expect(result2).assertEqual('false');
    });


  })
}