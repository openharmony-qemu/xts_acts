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



export default function builtinsStringBuilderTestToString() {
  describe('builtinsStringBuilderTestToString', () => {
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
     * @tc.name: builtinsStringBuilderTestToString0100
     * @tc.number: BUILTINS_STRING_BUILDER_TEST_TO_STRING_0100
     * @tc.desc: Test toString with integer 0
     * @tc.type: FUNCTION
     * @tc.size: SMALLTEST
     * @tc.level: LEVEL0
     */
    it('builtinsStringBuilderTestToString0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const result = StringBuilder.toString(0);
      expect(result).assertEqual('0');

      const result2 = StringBuilder.toString(-0);
      expect(result2).assertEqual('0');
    });

    /**
     * @tc.name: builtinsStringBuilderTestToString0200
     * @tc.number: BUILTINS_STRING_BUILDER_TEST_TO_STRING_0200
     * @tc.desc: Test toString with undefined (should convert to NaN)
     * @tc.type: FUNCTION
     * @tc.size: SMALLTEST
     * @tc.level: LEVEL0
     */
    it('builtinsStringBuilderTestToString0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const undefinedValue: string | number = NaN as number;
      const result = StringBuilder.toString(undefinedValue);
      expect(result).assertEqual('NaN');
    });

    /**
     * @tc.name: builtinsStringBuilderTestToString0300
     * @tc.number: BUILTINS_STRING_BUILDER_TEST_TO_STRING_0300
     * @tc.desc: Test toString with NaN
     * @tc.type: FUNCTION
     * @tc.size: SMALLTEST
     * @tc.level: LEVEL0
     */
    it('builtinsStringBuilderTestToString0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const result = StringBuilder.toString(NaN);
      expect(result).assertEqual('NaN');
    });

    /**
     * @tc.name: builtinsStringBuilderTestToString0400
     * @tc.number: BUILTINS_STRING_BUILDER_TEST_TO_STRING_0400
     * @tc.desc: Test toString with positive infinity
     * @tc.type: FUNCTION
     * @tc.size: SMALLTEST
     * @tc.level: LEVEL0
     */
    it('builtinsStringBuilderTestToString0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const result = StringBuilder.toString(Infinity);
      expect(result).assertEqual('Infinity');
    });

    /**
     * @tc.name: builtinsStringBuilderTestToString0500
     * @tc.number: BUILTINS_STRING_BUILDER_TEST_TO_STRING_0500
     * @tc.desc: Test toString with negative infinity
     * @tc.type: FUNCTION
     * @tc.size: SMALLTEST
     * @tc.level: LEVEL0
     */
    it('builtinsStringBuilderTestToString0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const result = StringBuilder.toString(-Infinity);
      expect(result).assertEqual('-Infinity');
    });

    /**
     * @tc.name: builtinsStringBuilderTestToString0600
     * @tc.number: BUILTINS_STRING_BUILDER_TEST_TO_STRING_0600
     * @tc.desc: Test toString with double type values
     * @tc.type: FUNCTION
     * @tc.size: SMALLTEST
     * @tc.level: LEVEL0
     */
    it('builtinsStringBuilderTestToString0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const result1 = StringBuilder.toString(1.5);
      expect(result1).assertEqual('1.5');

      const result2 = StringBuilder.toString(Math.floor(1.5));
      expect(result2).assertEqual('1');
    });

    /**
     * @tc.name: builtinsStringBuilderTestToString0700
     * @tc.number: BUILTINS_STRING_BUILDER_TEST_TO_STRING_0700
     * @tc.desc: Test toString with Number.MAX_VALUE
     * @tc.type: FUNCTION
     * @tc.size: SMALLTEST
     * @tc.level: LEVEL1
     */
    it('builtinsStringBuilderTestToString0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const result = StringBuilder.toString(Number.MAX_VALUE);
      expect(result).assertEqual('1.7976931348623157e+308');
    });

    /**
     * @tc.name: builtinsStringBuilderTestToString0800
     * @tc.number: BUILTINS_STRING_BUILDER_TEST_TO_STRING_0800
     * @tc.desc: Test toString with Number.MIN_VALUE
     * @tc.type: FUNCTION
     * @tc.size: SMALLTEST
     * @tc.level: LEVEL1
     */
    it('builtinsStringBuilderTestToString0800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const result = StringBuilder.toString(Number.MIN_VALUE);
      expect(result).assertEqual('5e-324');
    });

    /**
     * @tc.name: builtinsStringBuilderTestToString0900
     * @tc.number: BUILTINS_STRING_BUILDER_TEST_TO_STRING_0900
     * @tc.desc: Test toString with Number.EPSILON
     * @tc.type: FUNCTION
     * @tc.size: SMALLTEST
     * @tc.level: LEVEL1
     */
    it('builtinsStringBuilderTestToString0900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const result = StringBuilder.toString(Number.EPSILON);
      expect(result).assertEqual('2.220446049250313e-16');
    });

    /**
     * @tc.name: builtinsStringBuilderTestToString1000
     * @tc.number: BUILTINS_STRING_BUILDER_TEST_TO_STRING_1000
     * @tc.desc: Test toString with Number.MAX_SAFE_INTEGER
     * @tc.type: FUNCTION
     * @tc.size: SMALLTEST
     * @tc.level: LEVEL1
     */
    it('builtinsStringBuilderTestToString1000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const result = StringBuilder.toString(Number.MAX_SAFE_INTEGER);
      expect(result).assertEqual('9007199254740991');
    });

    /**
     * @tc.name: builtinsStringBuilderTestToString1100
     * @tc.number: BUILTINS_STRING_BUILDER_TEST_TO_STRING_1100
     * @tc.desc: Test toString with byte range values
     * @tc.type: FUNCTION
     * @tc.size: SMALLTEST
     * @tc.level: LEVEL1
     */
    it('builtinsStringBuilderTestToString1100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const result1 = StringBuilder.toString(-128);
      expect(result1).assertEqual('-128');

      const result2 = StringBuilder.toString(127);
      expect(result2).assertEqual('127');

      const result3 = StringBuilder.toString(-129);
      expect(result3).assertEqual('-129');

      const result4 = StringBuilder.toString(128);
      expect(result4).assertEqual('128');
    });

    /**
     * @tc.name: builtinsStringBuilderTestToString1200
     * @tc.number: BUILTINS_STRING_BUILDER_TEST_TO_STRING_1200
     * @tc.desc: Test toString with short range values
     * @tc.type: FUNCTION
     * @tc.size: SMALLTEST
     * @tc.level: LEVEL1
     */
    it('builtinsStringBuilderTestToString1200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const result1 = StringBuilder.toString(-32768);
      expect(result1).assertEqual('-32768');

      const result2 = StringBuilder.toString(32767);
      expect(result2).assertEqual('32767');

      const result3 = StringBuilder.toString(-32769);
      expect(result3).assertEqual('-32769');

      const result4 = StringBuilder.toString(32768);
      expect(result4).assertEqual('32768');
    });

    /**
     * @tc.name: builtinsStringBuilderTestToString1300
     * @tc.number: BUILTINS_STRING_BUILDER_TEST_TO_STRING_1300
     * @tc.desc: Test toString with int range values
     * @tc.type: FUNCTION
     * @tc.size: SMALLTEST
     * @tc.level: LEVEL1
     */
    it('builtinsStringBuilderTestToString1300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const result1 = StringBuilder.toString(-2147483648);
      expect(result1).assertEqual('-2147483648');

      const result2 = StringBuilder.toString(2147483647);
      expect(result2).assertEqual('2147483647');

      const result3 = StringBuilder.toString(-2147483649);
      expect(result3).assertEqual('-2147483649');

      const result4 = StringBuilder.toString(2147483648);
      expect(result4).assertEqual('2147483648');
    });

    /**
     * @tc.name: builtinsStringBuilderTestToString1400
     * @tc.number: BUILTINS_STRING_BUILDER_TEST_TO_STRING_1400
     * @tc.desc: Test toString with long range values
     * @tc.type: FUNCTION
     * @tc.size: SMALLTEST
     * @tc.level: LEVEL1
     */
    it('builtinsStringBuilderTestToString1400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const result1 = StringBuilder.toString(-9.223372036854775e+17);
      expect(result1).assertEqual('-922337203685477500');

      const result2 = StringBuilder.toString(9.223372036854775e+17);
      expect(result2).assertEqual('922337203685477500');


    });

    /**
     * @tc.name: builtinsStringBuilderTestToString1500
     * @tc.number: BUILTINS_STRING_BUILDER_TEST_TO_STRING_1500
     * @tc.desc: Test toString with float range values
     * @tc.type: FUNCTION
     * @tc.size: SMALLTEST
     * @tc.level: LEVEL1
     */
    it('builtinsStringBuilderTestToString1500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const minFloat = 1.40129846432481707e-45;
      const result1 = StringBuilder.toString(minFloat);
      expect(result1).assertEqual('1.401298464324817e-45');

      const maxFloat = 3.40282346638528860e+38;
      const result2 = StringBuilder.toString(maxFloat);
      expect(result2).assertEqual('3.4028234663852886e+38');

      const result3 = StringBuilder.toString(-minFloat);
      expect(result3).assertEqual('-1.401298464324817e-45');

      const result4 = StringBuilder.toString(-maxFloat);
      expect(result4).assertEqual('-3.4028234663852886e+38');
    });

    /**
     * @tc.name: builtinsStringBuilderTestToString1600
     * @tc.number: BUILTINS_STRING_BUILDER_TEST_TO_STRING_1600
     * @tc.desc: Test toString with double range values
     * @tc.type: FUNCTION
     * @tc.size: SMALLTEST
     * @tc.level: LEVEL1
     */
    it('builtinsStringBuilderTestToString1600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const minDouble = 4.94065645841246544e-324;
      const result1 = StringBuilder.toString(minDouble);
      expect(result1).assertEqual('5e-324');

      const maxDouble = 1.79769313486231570e+308;
      const result2 = StringBuilder.toString(maxDouble);
      expect(result2).assertEqual('1.7976931348623157e+308');

      const result3 = StringBuilder.toString(-minDouble);
      expect(result3).assertEqual('-5e-324');

      const result4 = StringBuilder.toString(-maxDouble);
      expect(result4).assertEqual('-1.7976931348623157e+308');
    });

    /**
     * @tc.name: builtinsStringBuilderTestToString1700
     * @tc.number: BUILTINS_STRING_BUILDER_TEST_TO_STRING_1700
     * @tc.desc: Test toString with char range values
     * @tc.type: FUNCTION
     * @tc.size: SMALLTEST
     * @tc.level: LEVEL1
     */
    it('builtinsStringBuilderTestToString1700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const result1 = StringBuilder.toString(0);
      expect(result1).assertEqual('0');

      const result2 = StringBuilder.toString(65535);
      expect(result2).assertEqual('65535');

      const result3 = StringBuilder.toString(-1);
      expect(result3).assertEqual('-1');

      const result4 = StringBuilder.toString(65536);
      expect(result4).assertEqual('65536');
    });

    /**
     * @tc.name: builtinsStringBuilderTestToString1800
     * @tc.number: BUILTINS_STRING_BUILDER_TEST_TO_STRING_1800
     * @tc.desc: Test toString with hex values
     * @tc.type: FUNCTION
     * @tc.size: SMALLTEST
     * @tc.level: LEVEL1
     */
    it('builtinsStringBuilderTestToString1800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const hexValue1 = 0x0102;
      const result1 = StringBuilder.toString(hexValue1);
      expect(result1).assertEqual('258');

      const hexValue2 = 0x01020304;
      const result2 = StringBuilder.toString(hexValue2);
      expect(result2).assertEqual('16909060');

      const hexValue3 = 0xCAFEBABE;
      const result3 = StringBuilder.toString(hexValue3);
      expect(result3).assertEqual('3405691582');

    });

    /**
     * @tc.name: builtinsStringBuilderTestToString1900
     * @tc.number: BUILTINS_STRING_BUILDER_TEST_TO_STRING_1900
     * @tc.desc: Test toString with octal values
     * @tc.type: FUNCTION
     * @tc.size: SMALLTEST
     * @tc.level: LEVEL1
     */
    it('builtinsStringBuilderTestToString1900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const octalValue = 0o3;
      const result = StringBuilder.toString(octalValue);
      expect(result).assertEqual('3');

      const octalValue2 = 0o777;
      const result2 = StringBuilder.toString(octalValue2);
      expect(result2).assertEqual('511');
    });

    /**
     * @tc.name: builtinsStringBuilderTestToString2000
     * @tc.number: BUILTINS_STRING_BUILDER_TEST_TO_STRING_2000
     * @tc.desc: Test toString with exponentiation
     * @tc.type: FUNCTION
     * @tc.size: SMALLTEST
     * @tc.level: LEVEL1
     */
    it('builtinsStringBuilderTestToString2000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const powResult = 2 ** 3;
      const result = StringBuilder.toString(powResult);
      expect(result).assertEqual('8');

      const powResult2 = 10 ** 6;
      const result2 = StringBuilder.toString(powResult2);
      expect(result2).assertEqual('1000000');
    });

    /**
     * @tc.name: builtinsStringBuilderTestToString2100
     * @tc.number: BUILTINS_STRING_BUILDER_TEST_TO_STRING_2100
     * @tc.desc: Test toString with scientific notation
     * @tc.type: FUNCTION
     * @tc.size: SMALLTEST
     * @tc.level: LEVEL1
     */
    it('builtinsStringBuilderTestToString2100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const sciValue1 = 1e3;
      const result1 = StringBuilder.toString(sciValue1);
      expect(result1).assertEqual('1000');

      const sciValue2 = 2.5e-2;
      const result2 = StringBuilder.toString(sciValue2);
      expect(result2).assertEqual('0.025');

      const sciValue3 = 1.23e6;
      const result3 = StringBuilder.toString(sciValue3);
      expect(result3).assertEqual('1230000');

      const sciValue4 = 9.87654321e-10;
      const result4 = StringBuilder.toString(sciValue4);
      expect(result4).assertEqual('9.87654321e-10');
    });

    /**
     * @tc.name: builtinsStringBuilderTestToString2200
     * @tc.number: BUILTINS_STRING_BUILDER_TEST_TO_STRING_2200
     * @tc.desc: Test toString with bigint values
     * @tc.type: FUNCTION
     * @tc.size: SMALLTEST
     * @tc.level: LEVEL1
     */
    it('builtinsStringBuilderTestToString2200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const bigIntValue1 = 9007199254740991;
      const result1 = StringBuilder.toString(bigIntValue1);
      expect(result1).assertEqual('9007199254740991');

      const bigIntValue2 = 9007199254740992;
      const result2 = StringBuilder.toString(bigIntValue2);
      expect(result2).assertEqual('9007199254740992');

      const bigIntValue3 = Number(BigInt('9007199254740991'));
      const result3 = StringBuilder.toString(bigIntValue3);
      expect(result3).assertEqual('9007199254740991');
    });
    /**
     * @tc.name: builtinsStringBuilderTestToString2300
     * @tc.number: BUILTINS_FLOAT_TOSTRING_TEST1300
     * @tc.desc: Test toString for float with typical float range values
     * @tc.type: FUNCTION
     * @tc.size: SMALLTEST
     * @tc.level: LEVEL0
     */
    it('builtinsStringBuilderTestToString2300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const floatMax: number = 3.4028234663852886e38;
      const floatMin: number = 1.401298464324817e-45;
      const floatSmall: number = 1.1754943508222875e-38;

      const result1: string = floatMax.toString();
      const result2: string = floatMin.toString();
      const result3: string = floatSmall.toString();

      expect(result1).assertEqual('3.4028234663852886e+38');
      expect(result2).assertEqual('1.401298464324817e-45');
      expect(result3).assertEqual('1.1754943508222875e-38');
    });

    /**
     * @tc.name: builtinsStringBuilderTestToString2400
     * @tc.number: BUILTINS_FLOAT_TOSTRING_TEST1400
     * @tc.desc: Test toString for float with hex representation values
     * @tc.type: FUNCTION
     * @tc.size: SMALLTEST
     * @tc.level: LEVEL0
     */
    it('builtinsStringBuilderTestToString2400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const hexFloat: number = 0xcafebabe;
      const result: string = hexFloat.toString();

      expect(result).assertEqual('3405691582');
    });

    /**
     * @tc.name: builtinsStringBuilderTestToString2500
     * @tc.number: BUILTINS_FLOAT_TOSTRING_TEST1500
     * @tc.desc: Test toString for float with scientific notation
     * @tc.type: FUNCTION
     * @tc.size: SMALLTEST
     * @tc.level: LEVEL0
     */
    it('builtinsStringBuilderTestToString2500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const sci1: number = 1.23e-4;
      const sci2: number = -5.67e+8;
      const sci3: number = 9.87654321e12;

      const result1: string = sci1.toString();
      const result2: string = sci2.toString();
      const result3: string = sci3.toString();

      expect(result1).assertEqual('0.000123');
      expect(result2).assertEqual('-567000000');
      expect(result3).assertEqual('9876543210000');
    });

    /**
     * @tc.name: builtinsStringBuilderTestToString2600
     * @tc.number: BUILTINS_FLOAT_TOSTRING_TEST1600
     * @tc.desc: Test toString for float with precision edge cases
     * @tc.type: FUNCTION
     * @tc.size: SMALLTEST
     * @tc.level: LEVEL0
     */
    it('builtinsStringBuilderTestToString2600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const pi: number = 3.141592653589793;
      const e: number = 2.718281828459045;
      const precise: number = 0.1 + 0.2;

      const result1: string = pi.toString();
      const result2: string = e.toString();
      const result3: string = precise.toString();

      expect(result1).assertEqual('3.141592653589793');
      expect(result2).assertEqual('2.718281828459045');
      expect(result3).assertEqual('0.30000000000000004');
    });

    /**
     * @tc.name: builtinsStringBuilderTestToString2700
     * @tc.number: BUILTINS_FLOAT_TOSTRING_TEST1700
     * @tc.desc: Test toString for float with negative float range values
     * @tc.type: FUNCTION
     * @tc.size: SMALLTEST
     * @tc.level: LEVEL0
     */
    it('builtinsStringBuilderTestToString2700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const negFloatMax: number = -3.4028234663852886e38;
      const negFloatMin: number = -1.401298464324817e-45;

      const result1: string = negFloatMax.toString();
      const result2: string = negFloatMin.toString();

      expect(result1).assertEqual('-3.4028234663852886e+38');
      expect(result2).assertEqual('-1.401298464324817e-45');
    });

    /**
     * @tc.name: builtinsStringBuilderTestToString2800
     * @tc.number: BUILTINS_FLOAT_TOSTRING_TEST1800
     * @tc.desc: Test toString for float with overflow simulation (Value outside float range)
     * @tc.type: FUNCTION
     * @tc.size: SMALLTEST
     * @tc.level: LEVEL0
     */
    it('builtinsStringBuilderTestToString2800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const overflowFloat: number = 3.5e38;
      const underflowFloat: number = 1e-50;

      const result1: string = overflowFloat.toString();
      const result2: string = underflowFloat.toString();

      expect(result1).assertEqual('3.5e+38');
      expect(result2).assertEqual('1e-50');
    });

    /**
     * @tc.name: builtinsStringBuilderTestToString2900
     * @tc.number: BUILTINS_FLOAT_TOSTRING_TEST1900
     * @tc.desc: Test toString for float with integer types that fit in float
     * @tc.type: FUNCTION
     * @tc.size: SMALLTEST
     * @tc.level: LEVEL0
     */
    it('builtinsStringBuilderTestToString2900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const byteMax: number = 127;
      const shortMax: number = 32767;
      const intValue: number = 2147483647;
      const longValue: number = 9223372036854775807;

      const result1: string = byteMax.toString();
      const result2: string = shortMax.toString();
      const result3: string = intValue.toString();
      const result4: string = longValue.toString();

      expect(result1).assertEqual('127');
      expect(result2).assertEqual('32767');
      expect(result3).assertEqual('2147483647');
      expect(result4).assertEqual('9223372036854776000');
    });

    /**
     * @tc.name: builtinsStringBuilderTestToString3000
     * @tc.number: BUILTINS_FLOAT_TOSTRING_TEST2000
     * @tc.desc: Test toString for float with different radix/format values
     * @tc.type: FUNCTION
     * @tc.size: SMALLTEST
     * @tc.level: LEVEL0
     */
    it('builtinsStringBuilderTestToString3000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const hex: number = 0x0102;
      const octal: number = 0o777;
      const binary: number = 0b1101;
      const decimal: number = 1234.5678;

      const result1: string = hex.toString();
      const result2: string = octal.toString();
      const result3: string = binary.toString();
      const result4: string = decimal.toString();

      expect(result1).assertEqual('258');
      expect(result2).assertEqual('511');
      expect(result3).assertEqual('13');
      expect(result4).assertEqual('1234.5678');
    });
    /**
     * @tc.name: builtinsStringBuilderTestToString3100
     * @tc.number: BUILTINS_LONG_TOSTRING_TEST2100
     * @tc.desc: Test toString for long with basic integer values
     * @tc.type: FUNCTION
     * @tc.size: SMALLTEST
     * @tc.level: LEVEL0
     */
    it('builtinsStringBuilderTestToString3100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const result1: string = (0n).toString();
      const result2: string = (42n).toString();
      const result3: string = (-123n).toString();
      const result4: string = (9999999999n).toString();

      expect(result1).assertEqual('0');
      expect(result2).assertEqual('42');
      expect(result3).assertEqual('-123');
      expect(result4).assertEqual('9999999999');
    });

    /**
     * @tc.name: builtinsStringBuilderTestToString3200
     * @tc.number: BUILTINS_LONG_TOSTRING_TEST2200
     * @tc.desc: Test toString for long with long range boundary values
     * @tc.type: FUNCTION
     * @tc.size: SMALLTEST
     * @tc.level: LEVEL0
     */
    it('builtinsStringBuilderTestToString3200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const longMax: bigint = 9223372036854775807n;
      const longMin: bigint = -9223372036854775808n;

      const result1: string = longMax.toString();
      const result2: string = longMin.toString();

      expect(result1).assertEqual('9223372036854775807');
      expect(result2).assertEqual('-9223372036854775808');
    });

    /**
     * @tc.name: builtinsStringBuilderTestToString3300
     * @tc.number: BUILTINS_LONG_TOSTRING_TEST2300
     * @tc.desc: Test toString for long with overflow values (beyond long range)
     * @tc.type: FUNCTION
     * @tc.size: SMALLTEST
     * @tc.level: LEVEL0
     */
    it('builtinsStringBuilderTestToString3300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const overflowMax: bigint = 9223372036854775808n;
      const overflowMin: bigint = -9223372036854775809n;

      const result1: string = overflowMax.toString();
      const result2: string = overflowMin.toString();

      expect(result1).assertEqual('9223372036854775808');
      expect(result2).assertEqual('-9223372036854775809');
    });

    /**
     * @tc.name: builtinsStringBuilderTestToString3400
     * @tc.number: BUILTINS_LONG_TOSTRING_TEST2400
     * @tc.desc: Test toString for long with different radix representations
     * @tc.type: FUNCTION
     * @tc.size: SMALLTEST
     * @tc.level: LEVEL0
     */
    it('builtinsStringBuilderTestToString3400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const hexDecimal: bigint = 16069380444329996000n;
      const octalDecimal: bigint = 9223372036854775807n;
      const binaryDecimal: bigint = 9223372036854775807n;

      const result1: string = hexDecimal.toString();
      const result2: string = octalDecimal.toString();
      const result3: string = binaryDecimal.toString();

      expect(result1).assertEqual('16069380444329996000');
      expect(result2).assertEqual('9223372036854775807');
      expect(result3).assertEqual('9223372036854775807');
    });

    /**
     * @tc.name: builtinsStringBuilderTestToString3500
     * @tc.number: BUILTINS_LONG_TOSTRING_TEST2500
     * @tc.desc: Test toString for long with large bigint values
     * @tc.type: FUNCTION
     * @tc.size: SMALLTEST
     * @tc.level: LEVEL0
     */
    it('builtinsStringBuilderTestToString3500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const bigInt1: bigint = BigInt(0xDEADBEEF);
      const bigInt2: bigint = 9007199254740991n;
      const bigInt3: bigint = 10000000000000000000n;

      const result1: string = bigInt1.toString();
      const result2: string = bigInt2.toString();
      const result3: string = bigInt3.toString();

      expect(result1).assertEqual('3735928559');
      expect(result2).assertEqual('9007199254740991');
      expect(result3).assertEqual('10000000000000000000');
    });

    /**
     * @tc.name: builtinsStringBuilderTestToString3600
     * @tc.number: BUILTINS_LONG_TOSTRING_TEST2600
     * @tc.desc: Test toString for long with integer types that fit in long
     * @tc.type: FUNCTION
     * @tc.size: SMALLTEST
     * @tc.level: LEVEL0
     */
    it('builtinsStringBuilderTestToString3600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const byteMax: bigint = 127n;
      const shortMax: bigint = 32767n;
      const intMax: bigint = 2147483647n;
      const uintMax: bigint = 4294967295n;

      const result1: string = byteMax.toString();
      const result2: string = shortMax.toString();
      const result3: string = intMax.toString();
      const result4: string = uintMax.toString();

      expect(result1).assertEqual('127');
      expect(result2).assertEqual('32767');
      expect(result3).assertEqual('2147483647');
      expect(result4).assertEqual('4294967295');
    });

    /**
     * @tc.name: builtinsStringBuilderTestToString3700
     * @tc.number: BUILTINS_LONG_TOSTRING_TEST2700
     * @tc.desc: Test toString for long with scientific notation like values (as number)
     * @tc.type: FUNCTION
     * @tc.size: SMALLTEST
     * @tc.level: LEVEL0
     */
    it('builtinsStringBuilderTestToString3700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const sciLong1: bigint = BigInt(1e18);
      const sciLong2: bigint = BigInt(2.5e12);

      const result1: string = sciLong1.toString();
      const result2: string = sciLong2.toString();

      expect(result1).assertEqual('1000000000000000000');
      expect(result2).assertEqual('2500000000000');
    });

    /**
     * @tc.name: builtinsStringBuilderTestToString3800
     * @tc.number: BUILTINS_LONG_TOSTRING_TEST2800
     * @tc.desc: Test toString for long with zero and negative zero edge cases
     * @tc.type: FUNCTION
     * @tc.size: SMALLTEST
     * @tc.level: LEVEL0
     */
    it('builtinsStringBuilderTestToString3800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const zero: bigint = 0n;
      const negativeZero: bigint = -0n;

      const result1: string = zero.toString();
      const result2: string = negativeZero.toString();

      expect(result1).assertEqual('0');
      expect(result2).assertEqual('0');
    });

    /**
     * @tc.name: builtinsStringBuilderTestToString3900
     * @tc.number: BUILTINS_LONG_TOSTRING_TEST2900
     * @tc.desc: Test toString for long with very large numbers (beyond 64-bit)
     * @tc.type: FUNCTION
     * @tc.size: SMALLTEST
     * @tc.level: LEVEL0
     */
    it('builtinsStringBuilderTestToString3900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const huge1: bigint = 1234567890123456789012345678901234567890n;
      const huge2: bigint = -999999999999999999999999999999999999999n;

      const result1: string = huge1.toString();
      const result2: string = huge2.toString();

      expect(result1).assertEqual('1234567890123456789012345678901234567890');
      expect(result2).assertEqual('-999999999999999999999999999999999999999');
    });

    /**
     * @tc.name: builtinsStringBuilderTestToString4000
     * @tc.number: BUILTINS_LONG_TOSTRING_TEST3000
     * @tc.desc: Test toString for long with mixed operations
     * @tc.type: FUNCTION
     * @tc.size: SMALLTEST
     * @tc.level: LEVEL0
     */
    it('builtinsStringBuilderTestToString4000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const addResult: bigint = 1000n + 2000n;
      const subResult: bigint = 5000n - 3000n;
      const mulResult: bigint = 100n * 50n;
      const powResult: bigint = 2n ** 10n;

      const result1: string = addResult.toString();
      const result2: string = subResult.toString();
      const result3: string = mulResult.toString();
      const result4: string = powResult.toString();

      expect(result1).assertEqual('3000');
      expect(result2).assertEqual('2000');
      expect(result3).assertEqual('5000');
      expect(result4).assertEqual('1024');
    });

    /**
     * @tc.name: builtinsStringBuilderTestToString4100
     * @tc.number: BUILTINS_INT_TOSTRING_TEST3100
     * @tc.desc: Test toString for int with basic integer values
     * @tc.type: FUNCTION
     * @tc.size: SMALLTEST
     * @tc.level: LEVEL0
     */
    it('builtinsStringBuilderTestToString4100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const result1: string = (0).toString();
      const result2: string = (42).toString();
      const result3: string = (-123).toString();
      const result4: string = (1000).toString();

      expect(result1).assertEqual('0');
      expect(result2).assertEqual('42');
      expect(result3).assertEqual('-123');
      expect(result4).assertEqual('1000');
    });

    /**
     * @tc.name: builtinsStringBuilderTestToString4200
     * @tc.number: BUILTINS_INT_TOSTRING_TEST3200
     * @tc.desc: Test toString for int with int range boundary values
     * @tc.type: FUNCTION
     * @tc.size: SMALLTEST
     * @tc.level: LEVEL0
     */
    it('builtinsStringBuilderTestToString4200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const intMax: number = 2147483647;
      const intMin: number = -2147483648;

      const result1: string = intMax.toString();
      const result2: string = intMin.toString();

      expect(result1).assertEqual('2147483647');
      expect(result2).assertEqual('-2147483648');
    });

    /**
     * @tc.name: builtinsStringBuilderTestToString4300
     * @tc.number: BUILTINS_INT_TOSTRING_TEST3300
     * @tc.desc: Test toString for int with overflow values (beyond int range)
     * @tc.type: FUNCTION
     * @tc.size: SMALLTEST
     * @tc.level: LEVEL0
     */
    it('builtinsStringBuilderTestToString4300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const overflowMax: number = 2147483648;
      const overflowMin: number = -2147483649;

      const result1: string = overflowMax.toString();
      const result2: string = overflowMin.toString();

      expect(result1).assertEqual('2147483648');
      expect(result2).assertEqual('-2147483649');
    });

    /**
     * @tc.name: builtinsStringBuilderTestToString4400
     * @tc.number: BUILTINS_INT_TOSTRING_TEST3400
     * @tc.desc: Test toString for int with different radix representations
     * @tc.type: FUNCTION
     * @tc.size: SMALLTEST
     * @tc.level: LEVEL0
     */
    it('builtinsStringBuilderTestToString4400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const hexInt: number = 0x0102;
      const hexInt2: number = 0x01020304;
      const octalInt: number = 0o777;
      const binaryInt: number = 0b11111111;

      const result1: string = hexInt.toString();
      const result2: string = hexInt2.toString();
      const result3: string = octalInt.toString();
      const result4: string = binaryInt.toString();

      expect(result1).assertEqual('258');
      expect(result2).assertEqual('16909060');
      expect(result3).assertEqual('511');
      expect(result4).assertEqual('255');
    });

    /**
     * @tc.name: builtinsStringBuilderTestToString4500
     * @tc.number: BUILTINS_INT_TOSTRING_TEST3500
     * @tc.desc: Test toString for int with byte and short range values
     * @tc.type: FUNCTION
     * @tc.size: SMALLTEST
     * @tc.level: LEVEL0
     */
    it('builtinsStringBuilderTestToString4500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const byteMax: number = 127;
      const byteMin: number = -128;
      const shortMax: number = 32767;
      const shortMin: number = -32768;

      const result1: string = byteMax.toString();
      const result2: string = byteMin.toString();
      const result3: string = shortMax.toString();
      const result4: string = shortMin.toString();

      expect(result1).assertEqual('127');
      expect(result2).assertEqual('-128');
      expect(result3).assertEqual('32767');
      expect(result4).assertEqual('-32768');
    });

    /**
     * @tc.name: builtinsStringBuilderTestToString4600
     * @tc.number: BUILTINS_INT_TOSTRING_TEST3600
     * @tc.desc: Test toString for int with zero and negative zero
     * @tc.type: FUNCTION
     * @tc.size: SMALLTEST
     * @tc.level: LEVEL0
     */
    it('builtinsStringBuilderTestToString4600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const zero: number = 0;
      const negativeZero: number = -0;

      const result1: string = zero.toString();
      const result2: string = negativeZero.toString();

      expect(result1).assertEqual('0');
      expect(result2).assertEqual('0');
    });

    /**
     * @tc.name: builtinsStringBuilderTestToString4700
     * @tc.number: BUILTINS_INT_TOSTRING_TEST3700
     * @tc.desc: Test toString for int with scientific notation input
     * @tc.type: FUNCTION
     * @tc.size: SMALLTEST
     * @tc.level: LEVEL0
     */
    it('builtinsStringBuilderTestToString4700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const sci1: number = 1e3;
      const sci2: number = 2.5e4;
      const sci3: number = -3.7e2;

      const result1: string = sci1.toString();
      const result2: string = sci2.toString();
      const result3: string = sci3.toString();

      expect(result1).assertEqual('1000');
      expect(result2).assertEqual('25000');
      expect(result3).assertEqual('-370');
    });

    /**
     * @tc.name: builtinsStringBuilderTestToString4800
     * @tc.number: BUILTINS_INT_TOSTRING_TEST3800
     * @tc.desc: Test toString for int with exponent operator
     * @tc.type: FUNCTION
     * @tc.size: SMALLTEST
     * @tc.level: LEVEL0
     */
    it('builtinsStringBuilderTestToString4800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const exp1: number = 2 ** 3;
      const exp2: number = 10 ** 6;
      const exp3: number = (-5) ** 2;

      const result1: string = exp1.toString();
      const result2: string = exp2.toString();
      const result3: string = exp3.toString();

      expect(result1).assertEqual('8');
      expect(result2).assertEqual('1000000');
      expect(result3).assertEqual('25');
    });

    /**
     * @tc.name: builtinsStringBuilderTestToString4900
     * @tc.number: BUILTINS_INT_TOSTRING_TEST3900
     * @tc.desc: Test toString for int with char range values
     * @tc.type: FUNCTION
     * @tc.size: SMALLTEST
     * @tc.level: LEVEL0
     */
    it('builtinsStringBuilderTestToString4900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const charMin: number = 0;
      const charMax: number = 65535;
      const asciiA: number = 65;
      const asciiZ: number = 90;
      const ascii_a: number = 97;
      const ascii_z: number = 122;

      const result1: string = charMin.toString();
      const result2: string = charMax.toString();
      const result3: string = asciiA.toString();
      const result4: string = asciiZ.toString();
      const result5: string = ascii_a.toString();
      const result6: string = ascii_z.toString();

      expect(result1).assertEqual('0');
      expect(result2).assertEqual('65535');
      expect(result3).assertEqual('65');
      expect(result4).assertEqual('90');
      expect(result5).assertEqual('97');
      expect(result6).assertEqual('122');
    });

    /**
     * @tc.name: builtinsStringBuilderTestToString5000
     * @tc.number: BUILTINS_INT_TOSTRING_TEST4000
     * @tc.desc: Test toString for int with large number that fits in int
     * @tc.type: FUNCTION
     * @tc.size: SMALLTEST
     * @tc.level: LEVEL0
     */
    it('builtinsStringBuilderTestToString5000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const large1: number = 1000000000;
      const large2: number = -999999999;
      const large3: number = 1234567890;

      const result1: string = large1.toString();
      const result2: string = large2.toString();
      const result3: string = large3.toString();

      expect(result1).assertEqual('1000000000');
      expect(result2).assertEqual('-999999999');
      expect(result3).assertEqual('1234567890');
    });

    /**
     * @tc.name: builtinsStringBuilderTestToString5100
     * @tc.number: BUILTINS_INT_TOSTRING_TEST4100
     * @tc.desc: Test toString for int with mixed arithmetic operations
     * @tc.type: FUNCTION
     * @tc.size: SMALLTEST
     * @tc.level: LEVEL0
     */
    it('builtinsStringBuilderTestToString5100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const addResult: number = 100 + 200;
      const subResult: number = 500 - 300;
      const mulResult: number = 50 * 30;
      const divResult: number = 1000 / 10;
      const modResult: number = 27 % 5;

      const result1: string = addResult.toString();
      const result2: string = subResult.toString();
      const result3: string = mulResult.toString();
      const result4: string = divResult.toString();
      const result5: string = modResult.toString();

      expect(result1).assertEqual('300');
      expect(result2).assertEqual('200');
      expect(result3).assertEqual('1500');
      expect(result4).assertEqual('100');
      expect(result5).assertEqual('2');
    });

    /**
     * @tc.name: builtinsStringBuilderTestToString5200
     * @tc.number: BUILTINS_INT_TOSTRING_TEST4200
     * @tc.desc: Test toString for int with Math function results
     * @tc.type: FUNCTION
     * @tc.size: SMALLTEST
     * @tc.level: LEVEL0
     */
    it('builtinsStringBuilderTestToString5200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const floorResult: number = Math.floor(10.9);
      const ceilResult: number = Math.ceil(10.1);
      const roundResult: number = Math.round(10.5);
      const absResult: number = Math.abs(-123);
      const maxResult: number = Math.max(10, 20, 30);
      const minResult: number = Math.min(10, 20, 30);

      const result1: string = floorResult.toString();
      const result2: string = ceilResult.toString();
      const result3: string = roundResult.toString();
      const result4: string = absResult.toString();
      const result5: string = maxResult.toString();
      const result6: string = minResult.toString();

      expect(result1).assertEqual('10');
      expect(result2).assertEqual('11');
      expect(result3).assertEqual('11');
      expect(result4).assertEqual('123');
      expect(result5).assertEqual('30');
      expect(result6).assertEqual('10');
    });

    /**
     * @tc.name: builtinsStringBuilderTestToString5300
     * @tc.number: BUILTINS_INT_TOSTRING_TEST4300
     * @tc.desc: Test toString for int with special numeric values (should handle gracefully)
     * @tc.type: FUNCTION
     * @tc.size: SMALLTEST
     * @tc.level: LEVEL0
     */
    it('builtinsStringBuilderTestToString5300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const nanValue: number = NaN;
      const infinityValue: number = Infinity;
      const negInfinityValue: number = -Infinity;

      const result1: string = nanValue.toString();
      const result2: string = infinityValue.toString();
      const result3: string = negInfinityValue.toString();

      expect(result1).assertEqual('NaN');
      expect(result2).assertEqual('Infinity');
      expect(result3).assertEqual('-Infinity');
    });

    /**
     * @tc.name: builtinsStringBuilderTestToString5400
     * @tc.number: BUILTINS_SHORT_TOSTRING_TEST4400
     * @tc.desc: Test toString for short with basic short range values
     * @tc.type: FUNCTION
     * @tc.size: SMALLTEST
     * @tc.level: LEVEL0
     */
    it('builtinsStringBuilderTestToString5400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const result1: string = (0).toString();
      const result2: string = (42).toString();
      const result3: string = (-123).toString();
      const result4: string = (1000).toString();

      expect(result1).assertEqual('0');
      expect(result2).assertEqual('42');
      expect(result3).assertEqual('-123');
      expect(result4).assertEqual('1000');
    });

    /**
     * @tc.name: builtinsStringBuilderTestToString5500
     * @tc.number: BUILTINS_SHORT_TOSTRING_TEST4500
     * @tc.desc: Test toString for short with short range boundary values
     * @tc.type: FUNCTION
     * @tc.size: SMALLTEST
     * @tc.level: LEVEL0
     */
    it('builtinsStringBuilderTestToString5500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const shortMax: number = 32767;
      const shortMin: number = -32768;

      const result1: string = shortMax.toString();
      const result2: string = shortMin.toString();

      expect(result1).assertEqual('32767');
      expect(result2).assertEqual('-32768');
    });

    /**
     * @tc.name: builtinsStringBuilderTestToString5600
     * @tc.number: BUILTINS_SHORT_TOSTRING_TEST4600
     * @tc.desc: Test toString for short with overflow values (beyond short range)
     * @tc.type: FUNCTION
     * @tc.size: SMALLTEST
     * @tc.level: LEVEL0
     */
    it('builtinsStringBuilderTestToString5600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const overflowMax: number = 32768;
      const overflowMin: number = -32769;

      const result1: string = overflowMax.toString();
      const result2: string = overflowMin.toString();

      expect(result1).assertEqual('32768');
      expect(result2).assertEqual('-32769');
    });

    /**
     * @tc.name: builtinsStringBuilderTestToString5700
     * @tc.number: BUILTINS_SHORT_TOSTRING_TEST4700
     * @tc.desc: Test toString for short with byte range values
     * @tc.type: FUNCTION
     * @tc.size: SMALLTEST
     * @tc.level: LEVEL0
     */
    it('builtinsStringBuilderTestToString5700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const byteMax: number = 127;
      const byteMin: number = -128;
      const byteZero: number = 0;

      const result1: string = byteMax.toString();
      const result2: string = byteMin.toString();
      const result3: string = byteZero.toString();

      expect(result1).assertEqual('127');
      expect(result2).assertEqual('-128');
      expect(result3).assertEqual('0');
    });

    /**
     * @tc.name: builtinsStringBuilderTestToString5800
     * @tc.number: BUILTINS_SHORT_TOSTRING_TEST4800
     * @tc.desc: Test toString for short with different radix representations
     * @tc.type: FUNCTION
     * @tc.size: SMALLTEST
     * @tc.level: LEVEL0
     */
    it('builtinsStringBuilderTestToString5800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const hexShort: number = 0x00FF;
      const hexShort2: number = 0x7FFF;
      const octalShort: number = 0o777;
      const binaryShort: number = 0b111111111111111;

      const result1: string = hexShort.toString();
      const result2: string = hexShort2.toString();
      const result3: string = octalShort.toString();
      const result4: string = binaryShort.toString();

      expect(result1).assertEqual('255');
      expect(result2).assertEqual('32767');
      expect(result3).assertEqual('511');
      expect(result4).assertEqual('32767');
    });

    /**
     * @tc.name: builtinsStringBuilderTestToString5900
     * @tc.number: BUILTINS_SHORT_TOSTRING_TEST4900
     * @tc.desc: Test toString for short with positive and negative edge values
     * @tc.type: FUNCTION
     * @tc.size: SMALLTEST
     * @tc.level: LEVEL0
     */
    it('builtinsStringBuilderTestToString5900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const pos1: number = 1;
      const pos2: number = 100;
      const pos3: number = 10000;
      const neg1: number = -1;
      const neg2: number = -100;
      const neg3: number = -10000;

      const result1: string = pos1.toString();
      const result2: string = pos2.toString();
      const result3: string = pos3.toString();
      const result4: string = neg1.toString();
      const result5: string = neg2.toString();
      const result6: string = neg3.toString();

      expect(result1).assertEqual('1');
      expect(result2).assertEqual('100');
      expect(result3).assertEqual('10000');
      expect(result4).assertEqual('-1');
      expect(result5).assertEqual('-100');
      expect(result6).assertEqual('-10000');
    });

    /**
     * @tc.name: builtinsStringBuilderTestToString6000
     * @tc.number: BUILTINS_SHORT_TOSTRING_TEST5000
     * @tc.desc: Test toString for short with arithmetic operations
     * @tc.type: FUNCTION
     * @tc.size: SMALLTEST
     * @tc.level: LEVEL0
     */
    it('builtinsStringBuilderTestToString6000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const addResult: number = 100 + 200;
      const subResult: number = 1000 - 500;
      const mulResult: number = 50 * 60;
      const divResult: number = 1000 / 10;
      const modResult: number = 32767 % 1000;

      const result1: string = addResult.toString();
      const result2: string = subResult.toString();
      const result3: string = mulResult.toString();
      const result4: string = divResult.toString();
      const result5: string = modResult.toString();

      expect(result1).assertEqual('300');
      expect(result2).assertEqual('500');
      expect(result3).assertEqual('3000');
      expect(result4).assertEqual('100');
      expect(result5).assertEqual('767');
    });

    /**
     * @tc.name: builtinsStringBuilderTestToString6100
     * @tc.number: BUILTINS_SHORT_TOSTRING_TEST5100
     * @tc.desc: Test toString for short with Math function results
     * @tc.type: FUNCTION
     * @tc.size: SMALLTEST
     * @tc.level: LEVEL0
     */
    it('builtinsStringBuilderTestToString6100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const absResult: number = Math.abs(-12345);
      const maxResult: number = Math.max(10, 100, 1000);
      const minResult: number = Math.min(-100, -500, -1000);
      const floorResult: number = Math.floor(32767.9);
      const ceilResult: number = Math.ceil(-32768.1);

      const result1: string = absResult.toString();
      const result2: string = maxResult.toString();
      const result3: string = minResult.toString();
      const result4: string = floorResult.toString();
      const result5: string = ceilResult.toString();

      expect(result1).assertEqual('12345');
      expect(result2).assertEqual('1000');
      expect(result3).assertEqual('-1000');
      expect(result4).assertEqual('32767');
      expect(result5).assertEqual('-32768');
    });

    /**
     * @tc.name: builtinsStringBuilderTestToString6200
     * @tc.number: BUILTINS_SHORT_TOSTRING_TEST5200
     * @tc.desc: Test toString for short with char range values that fit in short
     * @tc.type: FUNCTION
     * @tc.size: SMALLTEST
     * @tc.level: LEVEL0
     */
    it('builtinsStringBuilderTestToString6200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const charMin: number = 0;
      const charMax: number = 65535;
      const asciiValues: number[] = [65, 66, 67, 97, 98, 99];

      const result1: string = charMin.toString();
      const result2: string = charMax.toString();
      const result3: string = asciiValues[0].toString();
      const result4: string = asciiValues[3].toString();

      expect(result1).assertEqual('0');
      expect(result2).assertEqual('65535');
      expect(result3).assertEqual('65');
      expect(result4).assertEqual('97');
    });

    /**
     * @tc.name: builtinsStringBuilderTestToString6300
     * @tc.number: BUILTINS_SHORT_TOSTRING_TEST5300
     * @tc.desc: Test toString for short with typical usage values
     * @tc.type: FUNCTION
     * @tc.size: SMALLTEST
     * @tc.level: LEVEL0
     */
    it('builtinsStringBuilderTestToString6300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const portNumber: number = 8080;
      const year: number = 2023;
      const temperature: number = -20;
      const score: number = 100;
      const index: number = -1;

      const result1: string = portNumber.toString();
      const result2: string = year.toString();
      const result3: string = temperature.toString();
      const result4: string = score.toString();
      const result5: string = index.toString();

      expect(result1).assertEqual('8080');
      expect(result2).assertEqual('2023');
      expect(result3).assertEqual('-20');
      expect(result4).assertEqual('100');
      expect(result5).assertEqual('-1');
    });

    /**
     * @tc.name: builtinsStringBuilderTestToString6400
     * @tc.number: BUILTINS_SHORT_TOSTRING_TEST5400
     * @tc.desc: Test toString for short with boundary adjacent values
     * @tc.type: FUNCTION
     * @tc.size: SMALLTEST
     * @tc.level: LEVEL0
     */
    it('builtinsStringBuilderTestToString6400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const justBelowMax: number = 32766;
      const justAboveMin: number = -32767;
      const zero: number = 0;
      const negativeOne: number = -1;
      const positiveOne: number = 1;

      const result1: string = justBelowMax.toString();
      const result2: string = justAboveMin.toString();
      const result3: string = zero.toString();
      const result4: string = negativeOne.toString();
      const result5: string = positiveOne.toString();

      expect(result1).assertEqual('32766');
      expect(result2).assertEqual('-32767');
      expect(result3).assertEqual('0');
      expect(result4).assertEqual('-1');
      expect(result5).assertEqual('1');
    });

    /**
     * @tc.name: builtinsStringBuilderTestToString6500
     * @tc.number: BUILTINS_SHORT_TOSTRING_TEST5500
     * @tc.desc: Test toString for short with scientific notation (should convert to integer)
     * @tc.type: FUNCTION
     * @tc.size: SMALLTEST
     * @tc.level: LEVEL0
     */
    it('builtinsStringBuilderTestToString6500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const sci1: number = 1e3;
      const sci2: number = 2.5e3;
      const sci3: number = -3.7e2;
      const sci4: number = 1.23e4;

      const result1: string = sci1.toString();
      const result2: string = sci2.toString();
      const result3: string = sci3.toString();
      const result4: string = sci4.toString();

      expect(result1).assertEqual('1000');
      expect(result2).assertEqual('2500');
      expect(result3).assertEqual('-370');
      expect(result4).assertEqual('12300');
    });

    /**
     * @tc.name: builtinsStringBuilderTestToString6600
     * @tc.number: BUILTINS_CHAR_TOSTRING_TEST5600
     * @tc.desc: Test toString for char with basic ASCII characters
     * @tc.type: FUNCTION
     * @tc.size: SMALLTEST
     * @tc.level: LEVEL0
     */
    it('builtinsStringBuilderTestToString6600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const char1: string = 'A';
      const char2: string = 'a';
      const char3: string = '0';
      const char4: string = ' ';

      const result1: string = char1.toString();
      const result2: string = char2.toString();
      const result3: string = char3.toString();
      const result4: string = char4.toString();

      expect(result1).assertEqual('A');
      expect(result2).assertEqual('a');
      expect(result3).assertEqual('0');
      expect(result4).assertEqual(' ');
    });

    /**
     * @tc.name: builtinsStringBuilderTestToString6700
     * @tc.number: BUILTINS_CHAR_TOSTRING_TEST5700
     * @tc.desc: Test toString for char with char range boundary values
     * @tc.type: FUNCTION
     * @tc.size: SMALLTEST
     * @tc.level: LEVEL0
     */
    it('builtinsStringBuilderTestToString6700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const charMin: string = '\u0000';
      const charMax: string = '\uFFFF';
      const charMid: string = '\u8000';

      const result1: string = charMin.toString();
      const result2: string = charMax.toString();
      const result3: string = charMid.toString();

      expect(result1).assertEqual('\u0000');
      expect(result2).assertEqual('\uFFFF');
      expect(result3).assertEqual('\u8000');
    });

    /**
     * @tc.name: builtinsStringBuilderTestToString6800
     * @tc.number: BUILTINS_CHAR_TOSTRING_TEST5800
     * @tc.desc: Test toString for char with special control characters
     * @tc.type: FUNCTION
     * @tc.size: SMALLTEST
     * @tc.level: LEVEL0
     */
    it('builtinsStringBuilderTestToString6800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const bell: string = '\u0007';
      const backspace: string = '\b';
      const tab: string = '\t';
      const newline: string = '\n';
      const carriage: string = '\r';
      const formfeed: string = '\f';
      const vertical: string = '\v';

      const result1: string = bell.toString();
      const result2: string = backspace.toString();
      const result3: string = tab.toString();
      const result4: string = newline.toString();
      const result5: string = carriage.toString();
      const result6: string = formfeed.toString();
      const result7: string = vertical.toString();

      expect(result1).assertEqual('\u0007');
      expect(result2).assertEqual('\b');
      expect(result3).assertEqual('\t');
      expect(result4).assertEqual('\n');
      expect(result5).assertEqual('\r');
      expect(result6).assertEqual('\f');
      expect(result7).assertEqual('\v');
    });

    /**
     * @tc.name: builtinsStringBuilderTestToString6900
     * @tc.number: BUILTINS_CHAR_TOSTRING_TEST5900
     * @tc.desc: Test toString for char with escape sequence characters
     * @tc.type: FUNCTION
     * @tc.size: SMALLTEST
     * @tc.level: LEVEL0
     */
    it('builtinsStringBuilderTestToString6900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const backslash: string = '\\';
      const singleQuote: string = '\'';
      const doubleQuote: string = '\"';
      const question: string = '\?';
      const nullChar: string = '\0';

      const result1: string = backslash.toString();
      const result2: string = singleQuote.toString();
      const result3: string = doubleQuote.toString();
      const result4: string = question.toString();
      const result5: string = nullChar.toString();

      expect(result1).assertEqual('\\');
      expect(result2).assertEqual('\'');
      expect(result3).assertEqual('\"');
      expect(result4).assertEqual('?');
      expect(result5).assertEqual('\u0000');
    });

    /**
     * @tc.name: builtinsStringBuilderTestToString7000
     * @tc.number: BUILTINS_CHAR_TOSTRING_TEST6000
     * @tc.desc: Test toString for char with full special characters
     * @tc.type: FUNCTION
     * @tc.size: SMALLTEST
     * @tc.level: LEVEL0
     */
    it('builtinsStringBuilderTestToString7000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const specialChars: string = '!"#$%&\'()*+,-./:;<=>?@[\\]^_`{|}~';

      const result1: string = '!'.toString();
      const result2: string = '@'.toString();
      const result3: string = '['.toString();
      const result4: string = '\\'.toString();
      const result5: string = ']'.toString();
      const result6: string = '^'.toString();
      const result7: string = '_'.toString();
      const result8: string = '`'.toString();
      const result9: string = '{'.toString();
      const result10: string = '|'.toString();
      const result11: string = '}'.toString();
      const result12: string = '~'.toString();

      expect(result1).assertEqual('!');
      expect(result2).assertEqual('@');
      expect(result3).assertEqual('[');
      expect(result4).assertEqual('\\');
      expect(result5).assertEqual(']');
      expect(result6).assertEqual('^');
      expect(result7).assertEqual('_');
      expect(result8).assertEqual('`');
      expect(result9).assertEqual('{');
      expect(result10).assertEqual('|');
      expect(result11).assertEqual('}');
      expect(result12).assertEqual('~');
    });

    /**
     * @tc.name: builtinsStringBuilderTestToString7100
     * @tc.number: BUILTINS_CHAR_TOSTRING_TEST6100
     * @tc.desc: Test toString for char with number characters
     * @tc.type: FUNCTION
     * @tc.size: SMALLTEST
     * @tc.level: LEVEL0
     */
    it('builtinsStringBuilderTestToString7100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const digits: string = '0123456789';

      const result1: string = '0'.toString();
      const result2: string = '5'.toString();
      const result3: string = '9'.toString();

      expect(result1).assertEqual('0');
      expect(result2).assertEqual('5');
      expect(result3).assertEqual('9');
    });

    /**
     * @tc.name: builtinsStringBuilderTestToString7200
     * @tc.number: BUILTINS_CHAR_TOSTRING_TEST6200
     * @tc.desc: Test toString for char with uppercase letters
     * @tc.type: FUNCTION
     * @tc.size: SMALLTEST
     * @tc.level: LEVEL0
     */
    it('builtinsStringBuilderTestToString7200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const uppercase: string = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';

      const result1: string = 'A'.toString();
      const result2: string = 'M'.toString();
      const result3: string = 'Z'.toString();

      expect(result1).assertEqual('A');
      expect(result2).assertEqual('M');
      expect(result3).assertEqual('Z');
    });

    /**
     * @tc.name: builtinsStringBuilderTestToString7300
     * @tc.number: BUILTINS_CHAR_TOSTRING_TEST6300
     * @tc.desc: Test toString for char with lowercase letters
     * @tc.type: FUNCTION
     * @tc.size: SMALLTEST
     * @tc.level: LEVEL0
     */
    it('builtinsStringBuilderTestToString7300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const lowercase: string = 'abcdefghijklmnopqrstuvwxyz';

      const result1: string = 'a'.toString();
      const result2: string = 'm'.toString();
      const result3: string = 'z'.toString();

      expect(result1).assertEqual('a');
      expect(result2).assertEqual('m');
      expect(result3).assertEqual('z');
    });

    /**
     * @tc.name: builtinsStringBuilderTestToString7400
     * @tc.number: BUILTINS_CHAR_TOSTRING_TEST6400
     * @tc.desc: Test toString for char with Unicode characters
     * @tc.type: FUNCTION
     * @tc.size: SMALLTEST
     * @tc.level: LEVEL0
     */
    it('builtinsStringBuilderTestToString7400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const euro: string = '€';
      const yen: string = '¥';
      const copyright: string = '©';
      const registered: string = '®';
      const alpha: string = 'α';
      const beta: string = 'β';

      const result1: string = euro.toString();
      const result2: string = yen.toString();
      const result3: string = copyright.toString();
      const result4: string = registered.toString();
      const result5: string = alpha.toString();
      const result6: string = beta.toString();

      expect(result1).assertEqual('€');
      expect(result2).assertEqual('¥');
      expect(result3).assertEqual('©');
      expect(result4).assertEqual('®');
      expect(result5).assertEqual('α');
      expect(result6).assertEqual('β');
    });


    /**
     * @tc.name: builtinsStringBuilderTestToString7500
     * @tc.number: BUILTINS_CHAR_TOSTRING_TEST6500
     * @tc.desc: Test toString for char with Unicode escape sequences
     * @tc.type: FUNCTION
     * @tc.size: SMALLTEST
     * @tc.level: LEVEL0
     */
    it('builtinsStringBuilderTestToString7500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const unicode1: string = '\u0041';
      const unicode2: string = '\u0061';
      const unicode3: string = '\u0030';
      const unicode4: string = '\u03B1';
      const unicode5: string = '\u20AC';

      const result1: string = unicode1.toString();
      const result2: string = unicode2.toString();
      const result3: string = unicode3.toString();
      const result4: string = unicode4.toString();
      const result5: string = unicode5.toString();

      expect(result1).assertEqual('A');
      expect(result2).assertEqual('a');
      expect(result3).assertEqual('0');
      expect(result4).assertEqual('α');
      expect(result5).assertEqual('€');
    });

    /**
     * @tc.name: builtinsStringBuilderTestToString7600
     * @tc.number: BUILTINS_CHAR_TOSTRING_TEST6600
     * @tc.desc: Test toString for char with mixed character types
     * @tc.type: FUNCTION
     * @tc.size: SMALLTEST
     * @tc.level: LEVEL0
     */
    it('builtinsStringBuilderTestToString7600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const testCases: string[] = ['A', 'a', '0', ' ', '!', '\t', '€', 'α', '☺',];

      const results: string[] = [];
      for (let i = 0; i < testCases.length; i++) {
        results.push(testCases[i].toString());
      }

      expect(results[0]).assertEqual('A');
      expect(results[1]).assertEqual('a');
      expect(results[2]).assertEqual('0');
      expect(results[3]).assertEqual(' ');
      expect(results[4]).assertEqual('!');
      expect(results[5]).assertEqual('\t');
      expect(results[6]).assertEqual('€');
      expect(results[7]).assertEqual('α');
      expect(results[8]).assertEqual('☺');
    });

    /**
     * @tc.name: builtinsStringBuilderTestToString7700
     * @tc.number: BUILTINS_CHAR_TOSTRING_TEST6700
     * @tc.desc: Test toString for char with repeated special characters
     * @tc.type: FUNCTION
     * @tc.size: SMALLTEST
     * @tc.level: LEVEL0
     */
    it('builtinsStringBuilderTestToString7700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const repeatedChars: string = '!!""##$$%%&&\'\'(())**++,,--..//::;;<<==>>??@@[[\\\\]]^^__``{{||}}~~';


      const result1: string = '!!'.charAt(0).toString();
      const result2: string = '""'.charAt(0).toString();
      const result3: string = '##'.charAt(0).toString();
      const result4: string = '$$'.charAt(0).toString();
      const result5: string = '&&'.charAt(0).toString();

      expect(result1).assertEqual('!');
      expect(result2).assertEqual('"');
      expect(result3).assertEqual('#');
      expect(result4).assertEqual('$');
      expect(result5).assertEqual('&');
    });

    /**
     * @tc.name: builtinsStringBuilderTestToString7800
     * @tc.number: BUILTINS_BYTE_TOSTRING_TEST6800
     * @tc.desc: Test toString for byte with basic values within range
     * @tc.type: FUNCTION
     * @tc.size: SMALLTEST
     * @tc.level: LEVEL0
     */
    it('builtinsStringBuilderTestToString7800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const result1: string = (0).toString();
      const result2: string = (1).toString();
      const result3: string = (-1).toString();
      const result4: string = (100).toString();
      const result5: string = (-100).toString();

      expect(result1).assertEqual('0');
      expect(result2).assertEqual('1');
      expect(result3).assertEqual('-1');
      expect(result4).assertEqual('100');
      expect(result5).assertEqual('-100');
    });

    /**
     * @tc.name: builtinsStringBuilderTestToString7900
     * @tc.number: BUILTINS_BYTE_TOSTRING_TEST6900
     * @tc.desc: Test toString for byte with boundary values
     * @tc.type: FUNCTION
     * @tc.size: SMALLTEST
     * @tc.level: LEVEL0
     */
    it('builtinsStringBuilderTestToString7900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const result1: string = (127).toString();
      const result2: string = (-128).toString();
      const result3: string = (0).toString();

      expect(result1).assertEqual('127');
      expect(result2).assertEqual('-128');
      expect(result3).assertEqual('0');
    });

    /**
     * @tc.name: builtinsStringBuilderTestToString8000
     * @tc.number: BUILTINS_BYTE_TOSTRING_TEST7000
     * @tc.desc: Test toString for byte with overflow values
     * @tc.type: FUNCTION
     * @tc.size: SMALLTEST
     * @tc.level: LEVEL0
     */
    it('builtinsStringBuilderTestToString8000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const result1: string = (128).toString();
      const result2: string = (-129).toString();
      const result3: string = (255).toString();
      const result4: string = (256).toString();

      expect(result1).assertEqual('128');
      expect(result2).assertEqual('-129');
      expect(result3).assertEqual('255');
      expect(result4).assertEqual('256');
    });

    /**
     * @tc.name: builtinsStringBuilderTestToString8100
     * @tc.number: BUILTINS_BYTE_TOSTRING_TEST7100
     * @tc.desc: Test toString for special number values
     * @tc.type: FUNCTION
     * @tc.size: SMALLTEST
     * @tc.level: LEVEL0
     */
    it('builtinsStringBuilderTestToString8100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const num1: number = 0;
      const num2: number = -0;
      const num3: number = NaN;
      const num4: number = Infinity;
      const num5: number = -Infinity;

      const result1: string = num1.toString();
      const result2: string = num2.toString();
      const result3: string = num3.toString();
      const result4: string = num4.toString();
      const result5: string = num5.toString();

      expect(result1).assertEqual('0');
      expect(result2).assertEqual('0');
      expect(result3).assertEqual('NaN');
      expect(result4).assertEqual('Infinity');
      expect(result5).assertEqual('-Infinity');
    });


  })
}