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

export default function BuiltinsBigIntBitwiseAndValueTest(): void {
  describe('BuiltinsBigIntBitwiseAndValueTest', () => {
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
     * @tc.name  bigIntValueOfTest0100
     * @tc.number  SUB_BUILTINS_BIGINT_VALUEOF_TEST_0100
     * @tc.desc  Test valueOf() returns same instance for positive number constructed BigInt - verify reference equality
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntValueOfTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const original: BigInt = new BigInt(100);
      const result: BigInt = original.valueOf();

      expect(result === original).assertTrue();
      expect(result.equals(new BigInt(100))).assertTrue();
      expect(result.positive()).assertTrue();
    });

    /**
     * @tc.name  bigIntValueOfTest0200
     * @tc.number  SUB_BUILTINS_BIGINT_VALUEOF_TEST_0200
     * @tc.desc  Test valueOf() with zero value (boundary) - verify reference equality and zero state
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntValueOfTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const original: BigInt = new BigInt(0);
      const result: BigInt = original.valueOf();

      expect(result === original).assertTrue();
      expect(result.equals(new BigInt(0))).assertTrue();
      expect(result.getLong()).assertEqual(0 as long);
      expect(result.positive()).assertTrue();
    });

    /**
     * @tc.name  bigIntValueOfTest0300
     * @tc.number  SUB_BUILTINS_BIGINT_VALUEOF_TEST_0300
     * @tc.desc  Test valueOf() with negative value - verify sign preservation and reference equality
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntValueOfTest0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const original: BigInt = new BigInt(-999);
      const result: BigInt = original.valueOf();

      expect(result === original).assertTrue();
      expect(result.negative()).assertTrue();
      expect(result.equals(new BigInt(-999))).assertTrue();
    });

    /**
     * @tc.name  bigIntValueOfTest0400
     * @tc.number  SUB_BUILTINS_BIGINT_VALUEOF_TEST_0400
     * @tc.desc  Test valueOf() with large number from string (exceeds Number.MAX_SAFE_INTEGER boundary)
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntValueOfTest0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const largeStr: string = "18446744073709551616";
      const original: BigInt = new BigInt(largeStr);
      const result: BigInt = original.valueOf();

      expect(result === original).assertTrue();
      expect(result.equals(new BigInt(largeStr))).assertTrue();
      expect(result.toString()).assertEqual(largeStr);
    });

    /**
     * @tc.name  bigIntValueOfTest0500
     * @tc.number  SUB_BUILTINS_BIGINT_VALUEOF_TEST_0500
     * @tc.desc  Test valueOf() with boolean true constructed BigInt - verify value preservation
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntValueOfTest0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const original: BigInt = new BigInt(true);
      const result: BigInt = original.valueOf();

      expect(result === original).assertTrue();
      expect(result.equals(new BigInt(1))).assertTrue();
      expect(result.getLong()).assertEqual(1 as long);
    });

    /**
     * @tc.name  bigIntValueOfTest0600
     * @tc.number  SUB_BUILTINS_BIGINT_VALUEOF_TEST_0600
     * @tc.desc  Test valueOf() with boolean false constructed BigInt - verify zero equivalence
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntValueOfTest0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const original: BigInt = new BigInt(false);
      const result: BigInt = original.valueOf();

      expect(result === original).assertTrue();
      expect(result.equals(new BigInt(0))).assertTrue();
      expect(result.equals(new BigInt(false))).assertTrue();
    });

    /**
     * @tc.name  bigIntValueOfTest0700
     * @tc.number  SUB_BUILTINS_BIGINT_VALUEOF_TEST_0700
     * @tc.desc  Test valueOf() with Long.MAX_VALUE (9223372036854775807) - verify upper boundary preservation
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntValueOfTest0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const maxLong: long = 9223372036854775807 as long;
      const original: BigInt = new BigInt(maxLong);
      const result: BigInt = original.valueOf();

      expect(result === original).assertTrue();
      expect(result.getLong()).assertEqual(maxLong);
      expect(result.equals(new BigInt("9223372036854775807"))).assertTrue();
      expect(result.positive()).assertTrue();
    });

    /**
     * @tc.name  bigIntValueOfTest0800
     * @tc.number  SUB_BUILTINS_BIGINT_VALUEOF_TEST_0800
     * @tc.desc  Test valueOf() with Long.MIN_VALUE (-9223372036854775808) - verify lower boundary and negative sign
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntValueOfTest0800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const minLong: long = -9223372036854775808 as long;
      const original: BigInt = new BigInt(minLong);
      const result: BigInt = original.valueOf();

      expect(result === original).assertTrue();
      expect(result.negative()).assertTrue();
      expect(result.equals(new BigInt("-9223372036854775808"))).assertTrue();
      expect(result.getLong()).assertEqual(minLong);
    });

    /**
     * @tc.name  bigIntValueOfTest0900
     * @tc.number  SUB_BUILTINS_BIGINT_VALUEOF_TEST_0900
     * @tc.desc  Test valueOf() with double constructor (integer value 123.0) - verify type conversion stability
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntValueOfTest0900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const doubleVal: double = 123.0;
      const original: BigInt = new BigInt(doubleVal);
      const result: BigInt = original.valueOf();

      expect(result === original).assertTrue();
      expect(result.equals(new BigInt(123))).assertTrue();
      expect(result.getLong()).assertEqual(123 as long);
    });

    /**
     * @tc.name  bigIntValueOfTest1000
     * @tc.number  SUB_BUILTINS_BIGINT_VALUEOF_TEST_1000
     * @tc.desc  Test valueOf() with hexadecimal string constructor (0xFF) - verify radix parsing preservation
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntValueOfTest1000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const hexStr: string = "0xFF";
      const original: BigInt = new BigInt(hexStr);
      const result: BigInt = original.valueOf();

      expect(result === original).assertTrue();
      expect(result.equals(new BigInt(255))).assertTrue();
      expect(result.toString(16).toLowerCase()).assertEqual("ff");
    });

    /**
     * @tc.name  bigIntValueOfTest1100
     * @tc.number  SUB_BUILTINS_BIGINT_VALUEOF_TEST_1100
     * @tc.desc  Test valueOf() with negative zero (-0) - verify sign normalization to positive zero
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntValueOfTest1100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const negZero: double = -0.0;
      const original: BigInt = new BigInt(negZero);
      const result: BigInt = original.valueOf();

      expect(result === original).assertTrue();
      expect(result.equals(new BigInt(0))).assertTrue();
      expect(result.positive()).assertTrue();
      expect(result.negative()).assertFalse();
    });

    /**
     * @tc.name  bigIntValueOfTest1200
     * @tc.number  SUB_BUILTINS_BIGINT_VALUEOF_TEST_1200
     * @tc.desc  Test valueOf() with BigInt copy constructor - verify reference equality on copied instance
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntValueOfTest1200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const source: BigInt = new BigInt("999999999999999999999");
      const original: BigInt = new BigInt(source);
      const result: BigInt = original.valueOf();

      expect(result === original).assertTrue();
      expect(result.equals(source)).assertTrue();
      expect(result.toString()).assertEqual("999999999999999999999");
    });

    /**
     * @tc.name  bigIntAsIntNTest1300
     * @tc.number  SUB_BUILTINS_BIGINT_ASINTN_TEST_1300
     * @tc.desc  Test asIntN(bits: long, num: BigInt) with bits=0 - returns 0n regardless of num
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntAsIntNTest1300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const num: BigInt = new BigInt(999);
      const result: BigInt = BigInt.asIntN(0 as long, num);

      expect(result.equals(new BigInt(0))).assertTrue();
    });

    /**
     * @tc.name  bigIntAsIntNTest1400
     * @tc.number  SUB_BUILTINS_BIGINT_ASINTN_TEST_1400
     * @tc.desc  Test asIntN(bits: long, num: BigInt) with num=0 - returns 0n regardless of bits
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntAsIntNTest1400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const zero: BigInt = new BigInt(0);
      const result: BigInt = BigInt.asIntN(64 as long, zero);

      expect(result.equals(zero)).assertTrue();
    });

    /**
     * @tc.name  bigIntAsIntNTest1500
     * @tc.number  SUB_BUILTINS_BIGINT_ASINTN_TEST_1500
     * @tc.desc  Test asIntN(bits: long, num: BigInt) with bits<0 - throws RangeError
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntAsIntNTest1500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const num: BigInt = new BigInt(100);
      try {
        BigInt.asIntN(-1 as long, num);
        expect(false).assertTrue();
      } catch (e) {
        expect(e instanceof RangeError).assertTrue();
      }
    });

    /**
     * @tc.name  bigIntAsIntNTest1600
     * @tc.number  SUB_BUILTINS_BIGINT_ASINTN_TEST_1600
     * @tc.desc  Test asIntN(bits: long, num: BigInt) with bits exceeding Double.MAX_SAFE_INTEGER - throws RangeError
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntAsIntNTest1600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const num: BigInt = new BigInt(100);
      const tooLargeBits: long = 9007199254740992 as long;
      try {
        BigInt.asIntN(tooLargeBits, num);
        expect(false).assertTrue();
      } catch (e) {
        expect(e instanceof RangeError).assertTrue();
      }
    });

    /**
     * @tc.name  bigIntAsIntNTest1700
     * @tc.number  SUB_BUILTINS_BIGINT_ASINTN_TEST_1700
     * @tc.desc  Test asIntN(bits: long, num: BigInt) when bits > num.bitLength - returns num unchanged
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntAsIntNTest1700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const num: BigInt = new BigInt(255);
      const result: BigInt = BigInt.asIntN(16 as long, num);

      expect(result.equals(num)).assertTrue();
    });

    /**
     * @tc.name  bigIntAsIntNTest1800
     * @tc.number  SUB_BUILTINS_BIGINT_ASINTN_TEST_1800
     * @tc.desc  Test asIntN(8, num) with byte boundary values - 127 (max) and -128 (min)
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntAsIntNTest1800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const maxByte: BigInt = new BigInt(127);
      const minByte: BigInt = new BigInt(-128);

      const resultMax: BigInt = BigInt.asIntN(8 as long, maxByte);
      const resultMin: BigInt = BigInt.asIntN(8 as long, minByte);

      expect(resultMax.equals(maxByte)).assertTrue();
      expect(resultMin.equals(minByte)).assertTrue();
      expect(resultMax.getLong()).assertEqual(127 as long);
      expect(resultMin.getLong()).assertEqual(-128 as long);
    });

    /**
     * @tc.name  bigIntAsIntNTest1900
     * @tc.number  SUB_BUILTINS_BIGINT_ASINTN_TEST_1900
     * @tc.desc  Test asIntN(8, num) with overflow truncation - 255 becomes -1 (signed interpretation)
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntAsIntNTest1900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const overflowVal: BigInt = new BigInt(255);
      const result: BigInt = BigInt.asIntN(8 as long, overflowVal);

      expect(result.equals(new BigInt(-1))).assertTrue();
      expect(result.getLong()).assertEqual(-1 as long);
      expect(result.negative()).assertTrue();
    });

    /**
     * @tc.name  bigIntAsIntNTest2000
     * @tc.number  SUB_BUILTINS_BIGINT_ASINTN_TEST_2000
     * @tc.desc  Test asIntN(16, num) with short boundary values - 32767 and -32768
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntAsIntNTest2000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const maxShort: BigInt = new BigInt(32767);
      const minShort: BigInt = new BigInt(-32768);
      const overflowShort: BigInt = new BigInt(65535);

      expect(BigInt.asIntN(16 as long, maxShort).equals(maxShort)).assertTrue();
      expect(BigInt.asIntN(16 as long, minShort).equals(minShort)).assertTrue();
      expect(BigInt.asIntN(16 as long, overflowShort).equals(new BigInt(-1))).assertTrue();
    });

    /**
     * @tc.name  bigIntAsIntNTest2100
     * @tc.number  SUB_BUILTINS_BIGINT_ASINTN_TEST_2100
     * @tc.desc  Test asIntN(32, num) with int boundary values - 2147483647 and -2147483648
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntAsIntNTest2100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const maxInt: BigInt = new BigInt(2147483647);
      const minInt: BigInt = new BigInt(-2147483648);
      const largeNum: BigInt = new BigInt("2147483648");

      expect(BigInt.asIntN(32 as long, maxInt).equals(maxInt)).assertTrue();
      expect(BigInt.asIntN(32 as long, minInt).equals(minInt)).assertTrue();
      expect(BigInt.asIntN(32 as long, largeNum).equals(minInt)).assertTrue();
    });

    /**
     * @tc.name  bigIntAsIntNTest2200
     * @tc.number  SUB_BUILTINS_BIGINT_ASINTN_TEST_2200
     * @tc.desc  Test asIntN(64, num) with long boundary values and wrap-around
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntAsIntNTest2200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const maxLong: BigInt = new BigInt("9223372036854775807");
      const minLong: BigInt = new BigInt("-9223372036854775808");
      const overflowLong: BigInt = new BigInt("9223372036854775808");

      expect(BigInt.asIntN(64 as long, maxLong).equals(maxLong)).assertTrue();
      expect(BigInt.asIntN(64 as long, minLong).equals(minLong)).assertTrue();
      expect(BigInt.asIntN(64 as long, overflowLong).equals(minLong)).assertTrue();
    });

    /**
     * @tc.name  bigIntAsIntNTest2300
     * @tc.number  SUB_BUILTINS_BIGINT_ASINTN_TEST_2300
     * @tc.desc  Test asIntN with large num exceeding bits - verify modulo 2^bits behavior for positive
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntAsIntNTest2300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const num: BigInt = new BigInt("12345678901234567890");
      const result: BigInt = BigInt.asIntN(8 as long, num);

      expect(result.equals(new BigInt(-46))).assertTrue();
      expect(result.getLong()).assertEqual(-46 as long);
    });

    /**
     * @tc.name  bigIntAsIntNTest2400
     * @tc.number  SUB_BUILTINS_BIGINT_ASINTN_TEST_2400
     * @tc.desc  Test asIntN(bits: Number, num: BigInt) with integral Number - verify consistency with long version
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntAsIntNTest2400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const num: BigInt = new BigInt(255);
      const bitsNum: Number = 8.0;

      const resultNum: BigInt = BigInt.asIntN(bitsNum, num);
      const resultLong: BigInt = BigInt.asIntN(8 as long, num);

      expect(resultNum.equals(resultLong)).assertTrue();
      expect(resultNum.equals(new BigInt(-1))).assertTrue();
    });

    /**
     * @tc.name  bigIntAsIntNTest2500
     * @tc.number  SUB_BUILTINS_BIGINT_ASINTN_TEST_2500
     * @tc.desc  Test asIntN(bits: Number, num: BigInt) with positive fractional Number (8.9) - verify truncation toward zero
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntAsIntNTest2500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const num: BigInt = new BigInt(255);
      const bitsNum: Number = 8.9;

      const result: BigInt = BigInt.asIntN(bitsNum, num);
      expect(result.equals(new BigInt(-1))).assertTrue();
      expect(result.equals(BigInt.asIntN(8 as long, num))).assertTrue();
    });

    /**
     * @tc.name  bigIntAsIntNTest2600
     * @tc.number  SUB_BUILTINS_BIGINT_ASINTN_TEST_2600
     * @tc.desc  Test asIntN(bits: Number, num: BigInt) with negative fractional Number (-8.9) - truncates to -8 and throws RangeError
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntAsIntNTest2600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const num: BigInt = new BigInt(255);
      const bitsNum: Number = -8.9;
      let thrown: boolean = false;

      try {
        BigInt.asIntN(bitsNum, num);
      } catch (e) {
        thrown = true;
        expect(e instanceof RangeError).assertTrue();
      }
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name  bigIntAsIntNTest2700
     * @tc.number  SUB_BUILTINS_BIGINT_ASINTN_TEST_2700
     * @tc.desc  Test asIntN(bits: Number, num: BigInt) with Number.MAX_SAFE_INTEGER boundary
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntAsIntNTest2700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const num: BigInt = new BigInt(100);
      const maxSafe: Number = 9007199254740991;

      const result: BigInt = BigInt.asIntN(maxSafe, num);
      expect(result.equals(num)).assertTrue();
    });

    /**
     * @tc.name  bigIntAsIntNTest2800
     * @tc.number  SUB_BUILTINS_BIGINT_ASINTN_TEST_2800
     * @tc.desc  Test asIntN(bits: Number, num: BigInt) with NaN - verify toLong() conversion results in bits=0
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntAsIntNTest2800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const num: BigInt = new BigInt(999);
      const nanBits: Number = NaN;

      const result: BigInt = BigInt.asIntN(nanBits, num);
      expect(result.equals(new BigInt(0))).assertTrue();
    });

    /**
     * @tc.name  bigIntAsIntNTest2900
     * @tc.number  SUB_BUILTINS_BIGINT_ASINTN_TEST_2900
     * @tc.desc  Test asIntN(bits: Number, num: BigInt) with Infinity - throws RangeError (exceeds MAX_SAFE_INTEGER)
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntAsIntNTest2900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const num: BigInt = new BigInt(100);
      const infBits: Number = Infinity;
      let thrown: boolean = false;

      try {
        BigInt.asIntN(infBits, num);
      } catch (e) {
        thrown = true;
        expect(e instanceof RangeError).assertTrue();
      }
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name  bigIntAsIntNTest3000
     * @tc.number  SUB_BUILTINS_BIGINT_ASINTN_TEST_3000
     * @tc.desc  Test asIntN(bits: Number, num: BigInt) with -Infinity - throws RangeError (exceeds limit or bits<0)
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntAsIntNTest3000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const num: BigInt = new BigInt(100);
      const negInfBits: Number = -Infinity;
      let thrown: boolean = false;

      try {
        BigInt.asIntN(negInfBits, num);
      } catch (e) {
        thrown = true;
        expect(e instanceof RangeError).assertTrue();
      }
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name  bigIntAsIntNTest3100
     * @tc.number  SUB_BUILTINS_BIGINT_ASINTN_TEST_3100
     * @tc.desc  Test asIntN(bits: Number, num: BigInt) with -0 - treated as bits=0, returns 0n
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntAsIntNTest3100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const num: BigInt = new BigInt(999);
      const negZeroBits: Number = -0.0;

      const result: BigInt = BigInt.asIntN(negZeroBits, num);
      expect(result.equals(new BigInt(0))).assertTrue();
    });

    /**
     * @tc.name  bigIntAsUintNTest3200
     * @tc.number  SUB_BUILTINS_BIGINT_ASUINTN_TEST_3200
     * @tc.desc  Test asUintN(bits: long, num: BigInt) with bits=0 - returns 0n regardless of num
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntAsUintNTest3200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const num: BigInt = new BigInt(999);
      const result: BigInt = BigInt.asUintN(0 as long, num);

      expect(result.equals(new BigInt(0))).assertTrue();
    });

    /**
     * @tc.name  bigIntAsUintNTest3300
     * @tc.number  SUB_BUILTINS_BIGINT_ASUINTN_TEST_3300
     * @tc.desc  Test asUintN(bits: long, num: BigInt) with num=0 - returns 0n regardless of bits
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntAsUintNTest3300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const zero: BigInt = new BigInt(0);
      const result: BigInt = BigInt.asUintN(64 as long, zero);

      expect(result.equals(zero)).assertTrue();
    });

    /**
     * @tc.name  bigIntAsUintNTest3400
     * @tc.number  SUB_BUILTINS_BIGINT_ASUINTN_TEST_3400
     * @tc.desc  Test asUintN(bits: long, num: BigInt) with bits<0 - throws RangeError
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntAsUintNTest3400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const num: BigInt = new BigInt(100);
      let thrown: boolean = false;

      try {
        BigInt.asUintN(-1 as long, num);
      } catch (e) {
        thrown = true;
        expect(e instanceof RangeError).assertTrue();
      }
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name  bigIntAsUintNTest3500
     * @tc.number  SUB_BUILTINS_BIGINT_ASUINTN_TEST_3500
     * @tc.desc  Test asUintN(bits: long, num: BigInt) with bits exceeding Double.MAX_SAFE_INTEGER - throws RangeError
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntAsUintNTest3500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const num: BigInt = new BigInt(100);
      const tooLargeBits: long = 9007199254740992 as long;
      let thrown: boolean = false;

      try {
        BigInt.asUintN(tooLargeBits, num);
      } catch (e) {
        thrown = true;
        expect(e instanceof RangeError).assertTrue();
      }
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name  bigIntAsUintNTest3600
     * @tc.number  SUB_BUILTINS_BIGINT_ASUINTN_TEST_3600
     * @tc.desc  Test asUintN(bits: long, num: BigInt) when bits sufficient and num positive - returns num unchanged
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntAsUintNTest3600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const num: BigInt = new BigInt(255);
      const result: BigInt = BigInt.asUintN(16 as long, num);

      expect(result.equals(num)).assertTrue();
      expect(result.positive()).assertTrue();
    });

    /**
     * @tc.name  bigIntAsUintNTest3700
     * @tc.number  SUB_BUILTINS_BIGINT_ASUINTN_TEST_3700
     * @tc.desc  Test asUintN(8, num) with Uint8 boundary - 0, 255 (max), 256 wraps to 0
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntAsUintNTest3700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const min: BigInt = new BigInt(0);
      const max: BigInt = new BigInt(255);
      const overflow: BigInt = new BigInt(256);

      expect(BigInt.asUintN(8 as long, min).equals(min)).assertTrue();
      expect(BigInt.asUintN(8 as long, max).equals(max)).assertTrue();
      expect(BigInt.asUintN(8 as long, overflow).equals(min)).assertTrue();
    });

    /**
     * @tc.name  bigIntAsUintNTest3800
     * @tc.number  SUB_BUILTINS_BIGINT_ASUINTN_TEST_3800
     * @tc.desc  Test asUintN(16, num) with Uint16 boundary - 65535 (max), 65536 wraps to 0
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntAsUintNTest3800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const max: BigInt = new BigInt(65535);
      const overflow: BigInt = new BigInt(65536);

      expect(BigInt.asUintN(16 as long, max).equals(max)).assertTrue();
      expect(BigInt.asUintN(16 as long, overflow).equals(new BigInt(0))).assertTrue();
      expect(BigInt.asUintN(16 as long, new BigInt(65537)).equals(new BigInt(1))).assertTrue();
    });

    /**
     * @tc.name  bigIntAsUintNTest3900
     * @tc.number  SUB_BUILTINS_BIGINT_ASUINTN_TEST_3900
     * @tc.desc  Test asUintN(32, num) with Uint32 boundary - 4294967295 (max), 4294967296 wraps to 0
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntAsUintNTest3900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const max: BigInt = new BigInt("4294967295");
      const overflow: BigInt = new BigInt("4294967296");

      expect(BigInt.asUintN(32 as long, max).equals(max)).assertTrue();
      expect(BigInt.asUintN(32 as long, overflow).equals(new BigInt(0))).assertTrue();
    });

    /**
     * @tc.name  bigIntAsUintNTest4000
     * @tc.number  SUB_BUILTINS_BIGINT_ASUINTN_TEST_4000
     * @tc.desc  Test asUintN(64, num) with negative number - verify two's complement wrap to large positive (ulong behavior)
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntAsUintNTest4000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const negOne: BigInt = new BigInt(-1);
      const negLong: BigInt = new BigInt("-9223372036854775808");

      expect(BigInt.asUintN(64 as long, negOne).equals(new BigInt("18446744073709551615"))).assertTrue();
      expect(BigInt.asUintN(64 as long, negLong).equals(new BigInt("9223372036854775808"))).assertTrue();
    });

    /**
     * @tc.name  bigIntAsUintNTest4100
     * @tc.number  SUB_BUILTINS_BIGINT_ASUINTN_TEST_4100
     * @tc.desc  Test asUintN with large num exceeding bits - verify modulo 2^bits behavior (mask operation)
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntAsUintNTest4100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const largeNum: BigInt = new BigInt("12345678901234567890");
      const result: BigInt = BigInt.asUintN(8 as long, largeNum);

      expect(result.equals(new BigInt(210))).assertTrue();
      expect(result.positive()).assertTrue();
      expect(result.getLong()).assertEqual(210 as long);
    });

    /**
     * @tc.name  bigIntAsUintNTest4200
     * @tc.number  SUB_BUILTINS_BIGINT_ASUINTN_TEST_4200
     * @tc.desc  Test asUintN(bits: Number, num: BigInt) with integral Number - verify consistency with long version
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntAsUintNTest4200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const num: BigInt = new BigInt(255);
      const bitsNum: Number = 8.0;

      const resultNum: BigInt = BigInt.asUintN(bitsNum, num);
      const resultLong: BigInt = BigInt.asUintN(8 as long, num);

      expect(resultNum.equals(resultLong)).assertTrue();
      expect(resultNum.equals(new BigInt(255))).assertTrue();
    });

    /**
     * @tc.name  bigIntAsUintNTest4300
     * @tc.number  SUB_BUILTINS_BIGINT_ASUINTN_TEST_4300
     * @tc.desc  Test asUintN(bits: Number, num: BigInt) with positive fractional Number (8.9) - verify truncation toward zero
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntAsUintNTest4300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const num: BigInt = new BigInt(300);
      const bitsNum: Number = 8.9;

      const result: BigInt = BigInt.asUintN(bitsNum, num);
      expect(result.equals(new BigInt(44))).assertTrue();
      expect(result.equals(BigInt.asUintN(8 as long, num))).assertTrue();
    });

    /**
     * @tc.name  bigIntAsUintNTest4400
     * @tc.number  SUB_BUILTINS_BIGINT_ASUINTN_TEST_4400
     * @tc.desc  Test asUintN(bits: Number, num: BigInt) with negative fractional Number (-8.9) - truncates to -8 and throws RangeError
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntAsUintNTest4400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const num: BigInt = new BigInt(100);
      const bitsNum: Number = -8.9;
      let thrown: boolean = false;

      try {
        BigInt.asUintN(bitsNum, num);
      } catch (e) {
        thrown = true;
        expect(e instanceof RangeError).assertTrue();
      }
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name  bigIntAsUintNTest4500
     * @tc.number  SUB_BUILTINS_BIGINT_ASUINTN_TEST_4500
     * @tc.desc  Test asUintN(bits: Number, num: BigInt) with Number.MAX_SAFE_INTEGER boundary
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntAsUintNTest4500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const num: BigInt = new BigInt(100);
      const maxSafe: Number = 9007199254740991;

      const result: BigInt = BigInt.asUintN(maxSafe, num);
      expect(result.equals(num)).assertTrue();
    });

    /**
     * @tc.name  bigIntAsUintNTest4600
     * @tc.number  SUB_BUILTINS_BIGINT_ASUINTN_TEST_4600
     * @tc.desc  Test asUintN(bits: Number, num: BigInt) with NaN - verify toLong() conversion results in bits=0
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntAsUintNTest4600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const num: BigInt = new BigInt(999);
      const nanBits: Number = NaN;

      const result: BigInt = BigInt.asUintN(nanBits, num);
      expect(result.equals(new BigInt(0))).assertTrue();
    });

    /**
     * @tc.name  bigIntAsUintNTest4700
     * @tc.number  SUB_BUILTINS_BIGINT_ASUINTN_TEST_4700
     * @tc.desc  Test asUintN(bits: Number, num: BigInt) with Infinity - throws RangeError (exceeds MAX_SAFE_INTEGER)
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntAsUintNTest4700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const num: BigInt = new BigInt(100);
      const infBits: Number = Infinity;
      let thrown: boolean = false;

      try {
        BigInt.asUintN(infBits, num);
      } catch (e) {
        thrown = true;
        expect(e instanceof RangeError).assertTrue();
      }
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name  bigIntAsUintNTest4800
     * @tc.number  SUB_BUILTINS_BIGINT_ASUINTN_TEST_4800
     * @tc.desc  Test asUintN(bits: Number, num: BigInt) with -Infinity - throws RangeError (exceeds limit or bits<0)
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntAsUintNTest4800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const num: BigInt = new BigInt(100);
      const negInfBits: Number = -Infinity;
      let thrown: boolean = false;

      try {
        BigInt.asUintN(negInfBits, num);
      } catch (e) {
        thrown = true;
        expect(e instanceof RangeError).assertTrue();
      }
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name  bigIntAsUintNTest4900
     * @tc.number  SUB_BUILTINS_BIGINT_ASUINTN_TEST_4900
     * @tc.desc  Test asUintN(bits: Number, num: BigInt) with -0 - treated as bits=0, returns 0n
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntAsUintNTest4900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const num: BigInt = new BigInt(999);
      const negZeroBits: Number = -0.0;

      const result: BigInt = BigInt.asUintN(negZeroBits, num);
      expect(result.equals(new BigInt(0))).assertTrue();
    });

  });
};