'use static';
/*
* Copyright (c) 2026 RKH Corp.
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

export default function BuiltinsBigIntStringAndComparisonTest(): void {
  describe('BuiltinsBigIntStringAndComparisonTest', () => {
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
     * @tc.name  bigIntFromULongTest0100
     * @tc.number  SUB_BUILTINS_BIGINT_FROMULONG_TEST_0100
     * @tc.desc  Test fromULong(val: long) with positive value 100 - verify unsigned interpretation
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntFromULongTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const val: long = 100 as long;
      const bigIntValue: BigInt = BigInt.fromULong(val);

      expect(bigIntValue.equals(new BigInt(100))).assertTrue();
      expect(bigIntValue.positive()).assertTrue();
      expect(bigIntValue.toString()).assertEqual("100");
    });

    /**
     * @tc.name  bigIntFromULongTest0200
     * @tc.number  SUB_BUILTINS_BIGINT_FROMULONG_TEST_0200
     * @tc.desc  Test fromULong(val: long) with zero - verify sign=0 and value 0n
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntFromULongTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const val: long = 0 as long;
      const bigIntValue: BigInt = BigInt.fromULong(val);

      expect(bigIntValue.equals(new BigInt(0))).assertTrue();
      expect(bigIntValue.positive()).assertTrue();
      expect(bigIntValue.getLong()).assertEqual(0 as long);
    });

    /**
     * @tc.name  bigIntFromULongTest0300
     * @tc.number  SUB_BUILTINS_BIGINT_FROMULONG_TEST_0300
     * @tc.desc  Test fromULong(val: long) with -1 - verify unsigned interpretation (0xFFFFFFFFFFFFFFFF = 18446744073709551615)
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntFromULongTest0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const val: long = -1 as long;
      const bigIntValue: BigInt = BigInt.fromULong(val);

      const expected: BigInt = new BigInt("18446744073709551615");
      expect(bigIntValue.equals(expected)).assertTrue();
      expect(bigIntValue.positive()).assertTrue();
      expect(bigIntValue.toString()).assertEqual("18446744073709551615");
    });

    /**
     * @tc.name  bigIntFromULongTest0400
     * @tc.number  SUB_BUILTINS_BIGINT_FROMULONG_TEST_0400
     * @tc.desc  Test fromULong(val: long) with Long.MIN_VALUE (-9223372036854775808) - verify unsigned (0x8000000000000000 = 9223372036854775808)
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntFromULongTest0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const val: long = -9223372036854775808 as long;
      const bigIntValue: BigInt = BigInt.fromULong(val);

      const expected: BigInt = new BigInt("9223372036854775808");
      expect(bigIntValue.equals(expected)).assertTrue();
      expect(bigIntValue.toString(16).toLowerCase()).assertEqual("8000000000000000");
    });

    /**
     * @tc.name  bigIntFromULongTest0500
     * @tc.number  SUB_BUILTINS_BIGINT_FROMULONG_TEST_0500
     * @tc.desc  Test fromULong(val: long) differs from regular constructor for negative values
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntFromULongTest0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const negVal: long = -5 as long;

      const fromULong: BigInt = BigInt.fromULong(negVal);
      const fromConstructor: BigInt = new BigInt(negVal);

      expect(fromULong.equals(new BigInt("18446744073709551611"))).assertTrue();
      expect(fromConstructor.equals(new BigInt(-5))).assertTrue();
      expect(fromULong.equals(fromConstructor)).assertFalse();
    });

    /**
     * @tc.name  bigIntFromULongTest0600
     * @tc.number  SUB_BUILTINS_BIGINT_FROMULONG_TEST_0600
     * @tc.desc  Test fromULong(val: long) with large positive long value (Long.MAX_VALUE)
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntFromULongTest0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const val: long = 9223372036854775807 as long;
      const bigIntValue: BigInt = BigInt.fromULong(val);

      expect(bigIntValue.equals(new BigInt("9223372036854775807"))).assertTrue();
      expect(bigIntValue.positive()).assertTrue();
      expect(bigIntValue.getLong()).assertEqual(9223372036854775807 as long);
    });

    /**
     * @tc.name  bigIntFromULongTest0700
     * @tc.number  SUB_BUILTINS_BIGINT_FROMULONG_TEST_0700
     * @tc.desc  Test fromULong and getULong roundtrip - bit pattern preservation for unsigned values
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntFromULongTest0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const originalLong: long = -1 as long;
      const fromULong: BigInt = BigInt.fromULong(originalLong);

      expect(fromULong.getULong()).assertEqual(originalLong);

      const minLong: long = -9223372036854775808 as long;
      const fromMin: BigInt = BigInt.fromULong(minLong);
      expect(fromMin.getULong()).assertEqual(minLong);

      expect(fromMin.equals(new BigInt("9223372036854775808"))).assertTrue();
    });

    /**
     * @tc.name  bigIntEqualsTest0800
     * @tc.number  SUB_BUILTINS_BIGINT_EQUALS_TEST_0800
     * @tc.desc  Test equals(to: BigInt) with equal positive values - same instance and different instances
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntEqualsTest0800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const a: BigInt = new BigInt(12345);
      const b: BigInt = new BigInt(12345);
      const c: BigInt = a;

      expect(a.equals(b)).assertTrue();
      expect(a.equals(c)).assertTrue();
      expect(b.equals(a)).assertTrue();
    });

    /**
     * @tc.name  bigIntEqualsTest0900
     * @tc.number  SUB_BUILTINS_BIGINT_EQUALS_TEST_0900
     * @tc.desc  Test equals(to: BigInt) with equal negative values
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntEqualsTest0900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const a: BigInt = new BigInt(-99999);
      const b: BigInt = new BigInt(-99999);
      const c: BigInt = new BigInt("-99999");

      expect(a.equals(b)).assertTrue();
      expect(a.equals(c)).assertTrue();
      expect(b.equals(c)).assertTrue();
    });

    /**
     * @tc.name  bigIntEqualsTest1000
     * @tc.number  SUB_BUILTINS_BIGINT_EQUALS_TEST_1000
     * @tc.desc  Test equals(to: BigInt) with zero values - different representations result in equal
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntEqualsTest1000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const fromInt: BigInt = new BigInt(0);
      const fromString: BigInt = new BigInt("0");
      const fromBool: BigInt = new BigInt(false);
      const defaultCtor: BigInt = new BigInt();

      expect(fromInt.equals(fromString)).assertTrue();
      expect(fromInt.equals(fromBool)).assertTrue();
      expect(fromInt.equals(defaultCtor)).assertTrue();
      expect(fromString.equals(fromBool)).assertTrue();
    });

    /**
     * @tc.name  bigIntEqualsTest1100
     * @tc.number  SUB_BUILTINS_BIGINT_EQUALS_TEST_1100
     * @tc.desc  Test equals(to: BigInt) returns false for different signs (positive vs negative)
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntEqualsTest1100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const positive: BigInt = new BigInt(42);
      const negative: BigInt = new BigInt(-42);

      expect(positive.equals(negative)).assertFalse();
      expect(negative.equals(positive)).assertFalse();

      expect(positive.negate().equals(negative)).assertTrue();
    });

    /**
     * @tc.name  bigIntEqualsTest1200
     * @tc.number  SUB_BUILTINS_BIGINT_EQUALS_TEST_1200
     * @tc.desc  Test equals(to: BigInt) returns false for different magnitudes (different byte lengths)
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntEqualsTest1200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const small: BigInt = new BigInt(255);
      const medium: BigInt = new BigInt(256);
      const large: BigInt = new BigInt("18446744073709551616");

      expect(small.equals(medium)).assertFalse();
      expect(medium.equals(small)).assertFalse();
      expect(small.equals(large)).assertFalse();
      expect(large.equals(medium)).assertFalse();
    });

    /**
     * @tc.name  bigIntEqualsTest1300
     * @tc.number  SUB_BUILTINS_BIGINT_EQUALS_TEST_1300
     * @tc.desc  Test equals(to: BigInt) with large equal values constructed differently
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntEqualsTest1300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const fromString: BigInt = new BigInt("123456789012345678901234567890");
      const fromCopy: BigInt = new BigInt(fromString);
      const fromString2: BigInt = new BigInt("123456789012345678901234567890");

      expect(fromString.equals(fromCopy)).assertTrue();
      expect(fromString.equals(fromString2)).assertTrue();

      const different: BigInt = new BigInt("123456789012345678901234567891");
      expect(fromString.equals(different)).assertFalse();
    });

    /**
     * @tc.name  bigIntEqualsTest1400
     * @tc.number  SUB_BUILTINS_BIGINT_EQUALS_TEST_1400
     * @tc.desc  Test equals(to: BigInt) reflexivity and consistency with arithmetic results
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntEqualsTest1400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const a: BigInt = new BigInt(100);
      const b: BigInt = new BigInt(50);

      expect(a.equals(a)).assertTrue();

      const sum: BigInt = a.operatorAdd(b);
      expect(sum.equals(new BigInt(150))).assertTrue();
      expect(sum.equals(new BigInt(149))).assertFalse();

      const diff1: BigInt = a.operatorSubtract(b);
      const diff2: BigInt = a.operatorAdd(b.negate());
      expect(diff1.equals(diff2)).assertTrue();
      expect(diff1.equals(new BigInt(50))).assertTrue();
    });

    /**
     * @tc.name  bigIntEqualsAnyTest1500
     * @tc.number  SUB_BUILTINS_BIGINT_EQUALS_ANY_TEST_1500
     * @tc.desc  Test equals(other: Any) with equal BigInt - verifies type check and delegation
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntEqualsAnyTest1500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const a: BigInt = new BigInt(12345);
      const b: BigInt = new BigInt(12345);

      expect(a.equals(b as Any)).assertTrue();
      expect(a.equals(a as Any)).assertTrue();
    });

    /**
     * @tc.name  bigIntEqualsAnyTest1600
     * @tc.number  SUB_BUILTINS_BIGINT_EQUALS_ANY_TEST_1600
     * @tc.desc  Test equals(other: Any) returns false for non-BigInt types (number, string, boolean, null, undefined)
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntEqualsAnyTest1600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const bigIntValue: BigInt = new BigInt(42);

      expect(bigIntValue.equals(42 as Any)).assertFalse();
      expect(bigIntValue.equals("42" as Any)).assertFalse();
      expect(bigIntValue.equals(true as Any)).assertFalse();
      expect(bigIntValue.equals(null as Any)).assertFalse();
      expect(bigIntValue.equals(undefined as Any)).assertFalse();
    });

    /**
     * @tc.name  bigIntEqualsAnyTest1700
     * @tc.number  SUB_BUILTINS_BIGINT_EQUALS_ANY_TEST_1700
     * @tc.desc  Test equals(other: Any) returns false for BigInt with different value
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntEqualsAnyTest1700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const a: BigInt = new BigInt(100);
      const b: BigInt = new BigInt(200);

      expect(a.equals(b as Any)).assertFalse();
      expect(b.equals(a as Any)).assertFalse();
    });

    /**
     * @tc.name  bigIntEqualsAnyTest1800
     * @tc.number  SUB_BUILTINS_BIGINT_EQUALS_ANY_TEST_1800
     * @tc.desc  Test equals(other: Any) reflexivity with Any type
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntEqualsAnyTest1800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const bigIntValue: BigInt = new BigInt(-999);

      expect(bigIntValue.equals(bigIntValue as Any)).assertTrue();

      const copy: BigInt = new BigInt(bigIntValue);
      expect(bigIntValue.equals(copy as Any)).assertTrue();
    });

    /**
     * @tc.name  bigIntEqualsAnyTest1900
     * @tc.number  SUB_BUILTINS_BIGINT_EQUALS_ANY_TEST_1900
     * @tc.desc  Test equals(other: Any) with zero, negative, and positive through Any interface
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntEqualsAnyTest1900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const zero: BigInt = new BigInt(0);
      const neg: BigInt = new BigInt(-5);
      const pos: BigInt = new BigInt(5);

      expect(zero.equals(pos as Any)).assertFalse();
      expect(zero.equals(neg as Any)).assertFalse();

      expect(neg.equals(pos as Any)).assertFalse();
      expect(neg.equals(pos.negate() as Any)).assertTrue();
    });

    /**
     * @tc.name  bigIntToLocaleStringTest2000
     * @tc.number  SUB_BUILTINS_BIGINT_TOLOCALESTRING_TEST_2000
     * @tc.desc  Test toLocaleString() with positive value - returns string representation
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntToLocaleStringTest2000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const bigIntValue: BigInt = new BigInt(1234567);
      const result: string = bigIntValue.toLocaleString();

      expect(result).assertInstanceOf('string');
      expect(result.length).assertLarger(0);
      expect(result.length).assertLargerOrEqual(7);
    });

    /**
     * @tc.name  bigIntToLocaleStringTest2100
     * @tc.number  SUB_BUILTINS_BIGINT_TOLOCALESTRING_TEST_2100
     * @tc.desc  Test toLocaleString() with negative value
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntToLocaleStringTest2100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const bigIntValue: BigInt = new BigInt(-987654);
      const result: string = bigIntValue.toLocaleString();

      expect(result).assertInstanceOf('string');
      expect(result).assertContain('-');
      expect(result).assertContain('987');
    });

    /**
     * @tc.name  bigIntToLocaleStringTest2200
     * @tc.number  SUB_BUILTINS_BIGINT_TOLOCALESTRING_TEST_2200
     * @tc.desc  Test toLocaleString() with zero - returns "0" or localized equivalent
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntToLocaleStringTest2200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const bigIntValue: BigInt = new BigInt(0);
      const result: string = bigIntValue.toLocaleString();

      expect(result).assertInstanceOf('string');
      expect(result).assertEqual('0');
    });

    /**
     * @tc.name  bigIntToLocaleStringTest2300
     * @tc.number  SUB_BUILTINS_BIGINT_TOLOCALESTRING_TEST_2300
     * @tc.desc  Test toLocaleString() with huge number beyond Number range
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntToLocaleStringTest2300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const hugeStr: string = "123456789012345678901234567890";
      const bigIntValue: BigInt = new BigInt(hugeStr);
      const result: string = bigIntValue.toLocaleString();

      expect(result).assertInstanceOf('string');
      expect(result).assertContain('123');
      expect(result.length).assertLarger(hugeStr.length - 5);
    });

    /**
     * @tc.name  bigIntToLocaleStringTest2400
     * @tc.number  SUB_BUILTINS_BIGINT_TOLOCALESTRING_TEST_2400
     * @tc.desc  Test toLocaleString() consistency - calling multiple times returns same format
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntToLocaleStringTest2400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const bigIntValue: BigInt = new BigInt(12345);
      const result1: string = bigIntValue.toLocaleString();
      const result2: string = bigIntValue.toLocaleString();

      expect(result1).assertEqual(result2);
    });

    /**
     * @tc.name  bigIntToLocaleStringWithParamsTest2500
     * @tc.number  SUB_BUILTINS_BIGINT_TOLOCALESTRING_PARAMS_TEST_2500
     * @tc.desc  Test toLocaleString(locales) with "en-US" - thousands separator
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntToLocaleStringWithParamsTest2500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const bigIntValue: BigInt = new BigInt(1234567);
      const result: string = bigIntValue.toLocaleString("en-US");

      expect(result).assertInstanceOf('string');
      expect(result.length).assertLarger(0);
      expect(result.length).assertLargerOrEqual(7);
    });

    /**
     * @tc.name  bigIntToLocaleStringWithParamsTest2600
     * @tc.number  SUB_BUILTINS_BIGINT_TOLOCALESTRING_PARAMS_TEST_2600
     * @tc.desc  Test toLocaleString(locales) with "zh-CN" - Chinese locale formatting
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntToLocaleStringWithParamsTest2600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const bigIntValue: BigInt = new BigInt(1234567);
      const result: string = bigIntValue.toLocaleString("zh-CN");

      expect(result).assertInstanceOf('string');
      expect(result.length).assertLarger(0);
    });

    /**
     * @tc.name  bigIntToLocaleStringWithParamsTest2700
     * @tc.number  SUB_BUILTINS_BIGINT_TOLOCALESTRING_PARAMS_TEST_2700
     * @tc.desc  Test toLocaleString with notation: "compact" option
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntToLocaleStringWithParamsTest2700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const bigIntValue: BigInt = new BigInt(1234567890);
      const options: BigIntToLocaleStringOptions = {
        notation: "compact",
        compactDisplay: "short"
      };
      const result: string = bigIntValue.toLocaleString("en-US", options);

      expect(result).assertInstanceOf('string');
      expect(result.length).assertLarger(0);
      expect(result.length).assertLess(bigIntValue.toString().length);
    });

    /**
     * @tc.name  bigIntToLocaleStringWithParamsTest2800
     * @tc.number  SUB_BUILTINS_BIGINT_TOLOCALESTRING_PARAMS_TEST_2800
     * @tc.desc  Test toLocaleString with style: "currency" and currency: "USD"
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntToLocaleStringWithParamsTest2800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const bigIntValue: BigInt = new BigInt(1234);
      const options: BigIntToLocaleStringOptions = {
        style: "currency",
        currency: "USD"
      };
      const result: string = bigIntValue.toLocaleString("en-US", options);

      expect(result).assertInstanceOf('string');
      expect(result).assertContain('$');
      expect(result.length).assertLarger(0);
    });

    /**
     * @tc.name  bigIntToLocaleStringWithParamsTest2900
     * @tc.number  SUB_BUILTINS_BIGINT_TOLOCALESTRING_PARAMS_TEST_2900
     * @tc.desc  Test toLocaleString with useGrouping: false option
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntToLocaleStringWithParamsTest2900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const bigIntValue: BigInt = new BigInt(1234567);
      const options: BigIntToLocaleStringOptions = { useGrouping: false };
      const result: string = bigIntValue.toLocaleString("en-US", options);

      expect(result).assertInstanceOf('string');
      expect(result).assertEqual("1234567");
    });

    /**
     * @tc.name  bigIntToLocaleStringWithParamsTest3000
     * @tc.number  SUB_BUILTINS_BIGINT_TOLOCALESTRING_PARAMS_TEST_3000
     * @tc.desc  Test toLocaleString with locales as array ["en-US", "zh-CN"]
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntToLocaleStringWithParamsTest3000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const bigIntValue: BigInt = new BigInt(1234567);
      const result: string = bigIntValue.toLocaleString(["en-US", "zh-CN"]);

      expect(result).assertInstanceOf('string');
      expect(result.length).assertLarger(0);
    });

    /**
     * @tc.name  bigIntToLocaleStringWithParamsTest3100
     * @tc.number  SUB_BUILTINS_BIGINT_TOLOCALESTRING_PARAMS_TEST_3100
     * @tc.desc  Test toLocaleString with undefined options but defined locale
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntToLocaleStringWithParamsTest3100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const bigIntValue: BigInt = new BigInt(1234567);
      const result: string = bigIntValue.toLocaleString("de-DE", undefined);

      expect(result).assertInstanceOf('string');
      expect(result.length).assertLarger(0);
    });

    /**
     * @tc.name  bigIntToLocaleStringWithParamsTest3200
     * @tc.number  SUB_BUILTINS_BIGINT_TOLOCALESTRING_PARAMS_TEST_3200
     * @tc.desc  Test toLocaleString with negative value and currency style - verify negative sign is preserved
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntToLocaleStringWithParamsTest3200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const val: BigInt = new BigInt(-1234567);
      const options: BigIntToLocaleStringOptions = { style: "currency", currency: "USD" };
      const result: string = val.toLocaleString("en-US", options);

      expect(result).assertInstanceOf('string');
      expect(result).assertContain('-');
      expect(result).assertContain('$');
    });

    /**
     * @tc.name  bigIntToLocaleStringWithParamsTest3300
     * @tc.number  SUB_BUILTINS_BIGINT_TOLOCALESTRING_PARAMS_TEST_3300
     * @tc.desc  Test toLocaleString with valid style options (decimal, currency, unit) - verify no error for valid inputs
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntToLocaleStringWithParamsTest3300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const bigIntValue: BigInt = new BigInt(100);
      const optionsDecimal: BigIntToLocaleStringOptions = { style: "decimal" };
      const optionsCurrency: BigIntToLocaleStringOptions = { style: "currency", currency: "USD" };
      const optionsUnit: BigIntToLocaleStringOptions = { style: "unit", unit: "meter" };

      const resultDecimal: string = bigIntValue.toLocaleString("en-US", optionsDecimal);
      const resultCurrency: string = bigIntValue.toLocaleString("en-US", optionsCurrency);
      const resultUnit: string = bigIntValue.toLocaleString("en-US", optionsUnit);

      expect(resultDecimal).assertInstanceOf('string');
      expect(resultCurrency).assertInstanceOf('string');
      expect(resultUnit).assertInstanceOf('string');
      expect(resultDecimal.length).assertLarger(0);
      expect(resultCurrency.length).assertLarger(0);
      expect(resultUnit.length).assertLarger(0);
    });

    /**
     * @tc.name  bigIntToStringTest3400
     * @tc.number  SUB_BUILTINS_BIGINT_TOSTRING_TEST_3400
     * @tc.desc  Test toString() consistency across different construction paths - same value from int/string/bool
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntToStringTest3400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const fromInt: BigInt = new BigInt(42);
      const fromString: BigInt = new BigInt("42");
      const fromBool: BigInt = new BigInt(true);
      const fromLong: BigInt = new BigInt(42 as long);

      expect(fromInt.toString()).assertEqual("42");
      expect(fromString.toString()).assertEqual("42");
      expect(fromBool.toString()).assertEqual("1");
      expect(fromLong.toString()).assertEqual("42");

      expect(fromInt.toString()).assertEqual(fromString.toString());
      expect(fromInt.toString()).assertEqual(fromLong.toString());
    });

    /**
     * @tc.name  bigIntToStringTest3500
     * @tc.number  SUB_BUILTINS_BIGINT_TOSTRING_TEST_3500
     * @tc.desc  Test toString() with boundary values 1 and -1 (smallest non-zero integers)
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntToStringTest3500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const one: BigInt = new BigInt(1);
      const minusOne: BigInt = new BigInt(-1);

      expect(one.toString()).assertEqual("1");
      expect(minusOne.toString()).assertEqual("-1");

      expect(one.toString().length).assertEqual(1);
      expect(minusOne.toString().length).assertEqual(2);
    });

    /**
     * @tc.name  bigIntToStringTest3600
     * @tc.number  SUB_BUILTINS_BIGINT_TOSTRING_TEST_3600
     * @tc.desc  Test toString() roundtrip consistency - parse back to BigInt equals original
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntToStringTest3600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const original: BigInt = new BigInt(9876543210);
      const str: string = original.toString();
      const parsed: BigInt = new BigInt(str);

      expect(parsed.equals(original)).assertTrue();
      expect(str).assertEqual("9876543210");

      const negOriginal: BigInt = new BigInt(-123456789);
      const negStr: string = negOriginal.toString();
      const negParsed: BigInt = new BigInt(negStr);

      expect(negParsed.equals(negOriginal)).assertTrue();
      expect(negStr).assertEqual("-123456789");
    });

    /**
     * @tc.name  bigIntToStringTest3700
     * @tc.number  SUB_BUILTINS_BIGINT_TOSTRING_TEST_3700
     * @tc.desc  Test toString() with positive value - returns decimal string
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntToStringTest3700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const bigIntValue: BigInt = new BigInt(12345);
      const result: string = bigIntValue.toString();

      expect(result).assertEqual("12345");
      expect(result).assertEqual(bigIntValue.toString(10));
    });

    /**
     * @tc.name  bigIntToStringTest3800
     * @tc.number  SUB_BUILTINS_BIGINT_TOSTRING_TEST_3800
     * @tc.desc  Test toString() with negative value - returns decimal string with minus sign
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntToStringTest3800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const bigIntValue: BigInt = new BigInt(-9876);
      const result: string = bigIntValue.toString();

      expect(result).assertEqual("-9876");
      expect(result).assertEqual(bigIntValue.toString(10));
    });

    /**
     * @tc.name  bigIntToStringTest3900
     * @tc.number  SUB_BUILTINS_BIGINT_TOSTRING_TEST_3900
     * @tc.desc  Test toString() with zero - returns "0"
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntToStringTest3900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const bigIntValue: BigInt = new BigInt(0);
      const result: string = bigIntValue.toString();

      expect(result).assertEqual("0");
      expect(result).assertEqual(bigIntValue.toString(10));
    });

    /**
     * @tc.name  bigIntToStringTest4000
     * @tc.number  SUB_BUILTINS_BIGINT_TOSTRING_TEST_4000
     * @tc.desc  Test toString() with huge number - precise decimal representation
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntToStringTest4000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const hugeStr: string = "123456789012345678901234567890";
      const bigIntValue: BigInt = new BigInt(hugeStr);
      const result: string = bigIntValue.toString();

      expect(result).assertEqual(hugeStr);
      expect(result.length).assertEqual(30);
    });

    /**
     * @tc.name  bigIntToStringTest4100
     * @tc.number  SUB_BUILTINS_BIGINT_TOSTRING_TEST_4100
     * @tc.desc  Test toString() consistency - multiple calls return same result
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntToStringTest4100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const bigIntValue: BigInt = new BigInt(99999);
      const result1: string = bigIntValue.toString();
      const result2: string = bigIntValue.toString();

      expect(result1).assertEqual(result2);
      expect(result1).assertEqual("99999");
    });

    /**
     * @tc.name  bigIntToStringRadixTest4200
     * @tc.number  SUB_BUILTINS_BIGINT_TOSTRING_RADIX_TEST_4200
     * @tc.desc  Test toString(radix: int) with binary (radix=2) - positive value
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntToStringRadixTest4200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const bigIntValue: BigInt = new BigInt(255);
      const result: string = bigIntValue.toString(2);

      expect(result).assertEqual("11111111");
    });

    /**
     * @tc.name  bigIntToStringRadixTest4300
     * @tc.number  SUB_BUILTINS_BIGINT_TOSTRING_RADIX_TEST_4300
     * @tc.desc  Test toString(radix: int) with octal (radix=8) - positive and negative
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntToStringRadixTest4300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const positive: BigInt = new BigInt(64);
      const negative: BigInt = new BigInt(-64);

      expect(positive.toString(8)).assertEqual("100");
      expect(negative.toString(8)).assertEqual("-100");
    });

    /**
     * @tc.name  bigIntToStringRadixTest4400
     * @tc.number  SUB_BUILTINS_BIGINT_TOSTRING_RADIX_TEST_4400
     * @tc.desc  Test toString(radix: int) with hexadecimal (radix=16) - positive and negative
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntToStringRadixTest4400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const positive: BigInt = new BigInt(255);
      const negative: BigInt = new BigInt(-255);
      const medium: BigInt = new BigInt(4096);

      expect(positive.toString(16)).assertEqual("ff");
      expect(negative.toString(16)).assertEqual("-ff");
      expect(medium.toString(16)).assertEqual("1000");

      const large: BigInt = new BigInt("18446744073709551615");
      const largeHex: string = large.toString(16);
      expect(largeHex).assertInstanceOf('string');
      expect(largeHex.toLowerCase()).assertEqual("ffffffffffffffff");
    });

    /**
     * @tc.name  bigIntToStringRadixTest4500
     * @tc.number  SUB_BUILTINS_BIGINT_TOSTRING_RADIX_TEST_4500
     * @tc.desc  Test toString(radix: int) with base 36 (maximum valid radix)
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntToStringRadixTest4500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const bigIntValue: BigInt = new BigInt(35);
      const maxRadix: int = 36 as int;

      expect(bigIntValue.toString(maxRadix)).assertEqual("z");
      expect(new BigInt(36).toString(maxRadix)).assertEqual("10");

      const largeValue: BigInt = new BigInt(123456789);
      expect(largeValue.toString(maxRadix)).assertInstanceOf('string');
      expect(largeValue.toString(maxRadix).length).assertLarger(0);
    });

    /**
     * @tc.name  bigIntToStringRadixTest4600
     * @tc.number  SUB_BUILTINS_BIGINT_TOSTRING_RADIX_TEST_4600
     * @tc.desc  Test toString(radix: int) with boundary valid radix values (2 and 36)
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntToStringRadixTest4600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const bigIntValue: BigInt = new BigInt(100);

      const resultRadix2: string = bigIntValue.toString(2 as int);
      const resultRadix36: string = bigIntValue.toString(36 as int);

      expect(resultRadix2).assertEqual("1100100");
      expect(resultRadix36).assertEqual("2s");
      expect(resultRadix2).assertEqual(bigIntValue.toString(2));
      expect(resultRadix36).assertEqual(bigIntValue.toString(36));
    });

    /**
     * @tc.name  bigIntToStringRadixTest4700
     * @tc.number  SUB_BUILTINS_BIGINT_TOSTRING_RADIX_TEST_4700
     * @tc.desc  Test toString(radix: int) with zero value - returns "0" regardless of radix
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntToStringRadixTest4700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const zero: BigInt = new BigInt(0);

      expect(zero.toString(2)).assertEqual("0");
      expect(zero.toString(8)).assertEqual("0");
      expect(zero.toString(10)).assertEqual("0");
      expect(zero.toString(16)).assertEqual("0");
      expect(zero.toString(36)).assertEqual("0");
    });

    /**
     * @tc.name  bigIntToStringRadixTest4800
     * @tc.number  SUB_BUILTINS_BIGINT_TOSTRING_RADIX_TEST_4800
     * @tc.desc  Test toString(radix: int) with huge number in different bases
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntToStringRadixTest4800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const huge: BigInt = new BigInt("18446744073709551616");

      expect(huge.toString(2)).assertEqual("10000000000000000000000000000000000000000000000000000000000000000");
      expect(huge.toString(16)).assertEqual("10000000000000000");
      expect(huge.toString(10)).assertEqual("18446744073709551616");

      expect(huge.toString(10)).assertEqual(huge.toString());
    });

    /**
     * @tc.name  bigIntToStringRadixDoubleTest5000
     * @tc.number  SUB_BUILTINS_BIGINT_TOSTRING_RADIX_DOUBLE_TEST_5000
     * @tc.desc  Test toString(radix?: double) with valid double values 2.0 and 16.0
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntToStringRadixDoubleTest5000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const bigIntValue: BigInt = new BigInt(255);

      expect(bigIntValue.toString(2)).assertEqual("11111111");
      expect(bigIntValue.toString(8)).assertEqual("377");
      expect(bigIntValue.toString(16)).assertEqual("ff");
      expect(bigIntValue.toString(10)).assertEqual("255");
    });



    /**
     * @tc.name  bigIntToStringRadixDoubleTest5500
     * @tc.number  SUB_BUILTINS_BIGINT_TOSTRING_RADIX_DOUBLE_TEST_5500
     * @tc.desc  Test toString(radix?: double) with boundary values 2.0 and 36.0 (valid range)
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntToStringRadixDoubleTest5500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const bigIntValue: BigInt = new BigInt(35);

      expect(bigIntValue.toString(2)).assertInstanceOf('string');
      expect(bigIntValue.toString(36)).assertInstanceOf('string');
      expect(bigIntValue.toString(36)).assertEqual("z");
    });

    /**
     * @tc.name  bigIntToStringRadixDoubleTest5700
     * @tc.number  SUB_BUILTINS_BIGINT_TOSTRING_RADIX_DOUBLE_TEST_5700
     * @tc.desc  Test toString(radix?: double) with negative double values that truncate to valid radix (if implementation supports) or skip invalid cases
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntToStringRadixDoubleTest5700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const bigIntValue: BigInt = new BigInt(100);

      const result16: string = bigIntValue.toString(16);
      const result8: string = bigIntValue.toString(8);

      expect(result16).assertEqual("64");
      expect(result8).assertEqual("144");
    });

    /**
     * @tc.name  bigIntToStringRadixDoubleTest5800
     * @tc.number  SUB_BUILTINS_BIGINT_TOSTRING_RADIX_DOUBLE_TEST_5800
     * @tc.desc  Test toString(radix?: double) with double values near 2 (2.0, 2.1) - valid range boundary
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntToStringRadixDoubleTest5800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const bigIntValue: BigInt = new BigInt(100);

      const result2: string = bigIntValue.toString(2);
      const result3: string = bigIntValue.toString(3);

      expect(result2).assertEqual("1100100");
      expect(result3).assertEqual("10201");
    });

    /**
     * @tc.name  bigIntToStringRadixBinaryTest6000
     * @tc.number  SUB_BUILTINS_BIGINT_TOSTRING_RADIX_BINARY_TEST_6000
     * @tc.desc  Test toString(2) with positive value - returns binary string without leading zeros
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntToStringRadixBinaryTest6000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const bigIntValue: BigInt = new BigInt(10);
      const result: string = bigIntValue.toString(2);

      expect(result).assertEqual("1010");
      expect(result).assertEqual(bigIntValue.toString(2));
    });

    /**
     * @tc.name  bigIntToStringRadixBinaryTest6100
     * @tc.number  SUB_BUILTINS_BIGINT_TOSTRING_RADIX_BINARY_TEST_6100
     * @tc.desc  Test toString(2) with negative value - returns two's complement representation
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntToStringRadixBinaryTest6100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const bigIntValue: BigInt = new BigInt(-1);
      const result: string = bigIntValue.toString(2);

      expect(result).assertInstanceOf('string');
      expect(result.length).assertLarger(0);
      expect(result).assertContain('1');
    });

    /**
     * @tc.name  bigIntToStringRadixBinaryTest6200
     * @tc.number  SUB_BUILTINS_BIGINT_TOSTRING_RADIX_BINARY_TEST_6200
     * @tc.desc  Test toString(2) with small positive value
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntToStringRadixBinaryTest6200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const bigIntValue: BigInt = new BigInt(1);
      const result: string = bigIntValue.toString(2);

      expect(result).assertEqual("1");
      expect(result).assertEqual(bigIntValue.toString(2));
    });

    /**
     * @tc.name  bigIntToStringRadixBinaryTest6300
     * @tc.number  SUB_BUILTINS_BIGINT_TOSTRING_RADIX_BINARY_TEST_6300
     * @tc.desc  Test toString(2) with large value spanning multiple 32-bit words
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntToStringRadixBinaryTest6300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const bigIntValue: BigInt = new BigInt("1099511627776");
      const result: string = bigIntValue.toString(2);

      expect(result).assertInstanceOf('string');
      expect(result).assertEqual("10000000000000000000000000000000000000000");
      expect(result.length).assertEqual(41);
    });

    /**
     * @tc.name  bigIntToStringRadixBinaryTest6400
     * @tc.number  SUB_BUILTINS_BIGINT_TOSTRING_RADIX_BINARY_TEST_6400
     * @tc.desc  Test toString(2) consistency - matches toString(2) for positive values
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntToStringRadixBinaryTest6400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const values: BigInt[] = [
        new BigInt(1),
        new BigInt(255),
        new BigInt(256),
        new BigInt(65535),
        new BigInt("4294967295"),
        new BigInt("4294967296")
      ];

      for (let i = 0; i < values.length; i++) {
        const val = values[i];
        const binaryResult: string = val.toString(2);
        const toStringResult: string = val.toString(2);

        expect(binaryResult).assertEqual(toStringResult);
      }
    });

    /**
     * @tc.name  bigIntToStringRadixBinaryTest6500
     * @tc.number  SUB_BUILTINS_BIGINT_TOSTRING_RADIX_BINARY_TEST_6500
     * @tc.desc  Test toString(2) with power of two values (single bit set)
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntToStringRadixBinaryTest6500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const one: BigInt = new BigInt(1);
      const two: BigInt = new BigInt(2);
      const one28: BigInt = new BigInt(128);
      const two56: BigInt = new BigInt(256);
      const two31: BigInt = new BigInt(2147483648);

      expect(one.toString(2)).assertEqual("1");
      expect(two.toString(2)).assertEqual("10");
      expect(one28.toString(2)).assertEqual("10000000");
      expect(two56.toString(2)).assertEqual("100000000");
      expect(two31.toString(2)).assertEqual("10000000000000000000000000000000");
    });

    /**
     * @tc.name  bigIntToStringRadixBinaryTest6600
     * @tc.number  SUB_BUILTINS_BIGINT_TOSTRING_RADIX_BINARY_TEST_6600
     * @tc.desc  Test toString(2) with 32-bit all ones (0xFFFFFFFF = 4294967295)
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntToStringRadixBinaryTest6600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const maxUint32: BigInt = new BigInt(4294967295);
      const result: string = maxUint32.toString(2);

      expect(result).assertEqual("11111111111111111111111111111111");
      expect(result.length).assertEqual(32);
      expect(result).assertEqual(maxUint32.toString(2));
    });

    /**
     * @tc.name  bigIntToStringRadixBinaryTest6700
     * @tc.number  SUB_BUILTINS_BIGINT_TOSTRING_RADIX_BINARY_TEST_6700
     * @tc.desc  Test toString(2) with value 2^64 (crossing 64-bit boundary)
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntToStringRadixBinaryTest6700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const twoTo64: BigInt = new BigInt("18446744073709551616");
      const result: string = twoTo64.toString(2);

      expect(result).assertEqual("1" + "0".repeat(64));
      expect(result.length).assertEqual(65);
      expect(result).assertEqual(twoTo64.toString(2));
    });

    /**
     * @tc.name  bigIntToStringRadixBinaryTest6800
     * @tc.number  SUB_BUILTINS_BIGINT_TOSTRING_RADIX_BINARY_TEST_6800
     * @tc.desc  Test toString(2) consistency with parse - verify binary string can be reconstructed
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntToStringRadixBinaryTest6800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const original: BigInt = new BigInt(123456789);
      const binaryStr: string = original.toString(2);

      const reconstructed: BigInt = new BigInt(parseInt(binaryStr, 2).toInt());
      expect(reconstructed.equals(original)).assertTrue();
      expect(binaryStr).assertEqual("111010110111100110100010101");
    });

    /**
     * @tc.name  bigIntToStringDecimalTest6900
     * @tc.number  SUB_BUILTINS_BIGINT_TOSTRING_DECIMAL_TEST_6900
     * @tc.desc  Test toString() with positive value - returns decimal string representation
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntToStringDecimalTest6900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const bigIntValue: BigInt = new BigInt(12345);
      const result: string = bigIntValue.toString();

      expect(result).assertInstanceOf('string');
      expect(result).assertEqual("12345");
      expect(result.length).assertEqual(5);
    });

    /**
     * @tc.name  bigIntToStringDecimalTest7000
     * @tc.number  SUB_BUILTINS_BIGINT_TOSTRING_DECIMAL_TEST_7000
     * @tc.desc  Test toString() with negative value - preserves negative sign
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntToStringDecimalTest7000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const bigIntValue: BigInt = new BigInt(-9876);
      const result: string = bigIntValue.toString();

      expect(result).assertInstanceOf('string');
      expect(result).assertEqual("-9876");

      const positiveValue: BigInt = new BigInt(9876);
      expect(result).assertEqual(positiveValue.negate().toString());
    });

    /**
     * @tc.name  bigIntToStringDecimalTest7100
     * @tc.number  SUB_BUILTINS_BIGINT_TOSTRING_DECIMAL_TEST_7100
     * @tc.desc  Test toString() with zero - returns "0"
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntToStringDecimalTest7100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const fromInt: BigInt = new BigInt(0);
      const fromString: BigInt = new BigInt("0");
      const fromBool: BigInt = new BigInt(false);
      const defaultCtor: BigInt = new BigInt();

      expect(fromInt.toString()).assertEqual("0");
      expect(fromString.toString()).assertEqual("0");
      expect(fromBool.toString()).assertEqual("0");
      expect(defaultCtor.toString()).assertEqual("0");
    });

    /**
     * @tc.name  bigIntToStringDecimalTest7200
     * @tc.number  SUB_BUILTINS_BIGINT_TOSTRING_DECIMAL_TEST_7200
     * @tc.desc  Test toString() with boundary values (1 and -1)
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntToStringDecimalTest7200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const one: BigInt = new BigInt(1);
      const minusOne: BigInt = new BigInt(-1);

      expect(one.toString()).assertEqual("1");
      expect(minusOne.toString()).assertEqual("-1");
    });

    /**
     * @tc.name  bigIntToStringDecimalTest7300
     * @tc.number  SUB_BUILTINS_BIGINT_TOSTRING_DECIMAL_TEST_7300
     * @tc.desc  Test toString() with huge number beyond Number.MAX_SAFE_INTEGER - precise decimal representation
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntToStringDecimalTest7300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const hugeStr: string = "123456789012345678901234567890";
      const bigIntValue: BigInt = new BigInt(hugeStr);
      const result: string = bigIntValue.toString();

      expect(result).assertInstanceOf('string');
      expect(result).assertEqual(hugeStr);
      expect(result.length).assertEqual(30);
    });

    /**
     * @tc.name  bigIntToStringDecimalTest7400
     * @tc.number  SUB_BUILTINS_BIGINT_TOSTRING_DECIMAL_TEST_7400
     * @tc.desc  Test toString() with Long boundary values
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntToStringDecimalTest7400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const maxLong: BigInt = new BigInt(9223372036854775807 as long);
      const minLong: BigInt = new BigInt(-9223372036854775808 as long);

      expect(maxLong.toString()).assertEqual("9223372036854775807");
      expect(minLong.toString()).assertEqual("-9223372036854775808");
    });

    /**
     * @tc.name  bigIntToStringDecimalTest7500
     * @tc.number  SUB_BUILTINS_BIGINT_TOSTRING_DECIMAL_TEST_7500
     * @tc.desc  Test toString() consistency with different construction paths
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntToStringDecimalTest7500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const fromInt: BigInt = new BigInt(65535);
      const fromString: BigInt = new BigInt("65535");
      const fromLong: BigInt = new BigInt(65535 as long);
      const fromDouble: BigInt = new BigInt(65535.0);

      expect(fromInt.toString()).assertEqual("65535");
      expect(fromString.toString()).assertEqual("65535");
      expect(fromLong.toString()).assertEqual("65535");
      expect(fromDouble.toString()).assertEqual("65535");
    });

    /**
     * @tc.name  bigIntToStringDecimalTest7600
     * @tc.number  SUB_BUILTINS_BIGINT_TOSTRING_DECIMAL_TEST_7600
     * @tc.desc  Test toString() with powers of 10 - verify digit length correctness
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntToStringDecimalTest7600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const ten: BigInt = new BigInt(10);
      const hundred: BigInt = new BigInt(100);
      const thousand: BigInt = new BigInt(1000);
      const million: BigInt = new BigInt(1000000);
      const billion: BigInt = new BigInt(1000000000);

      expect(ten.toString()).assertEqual("10");
      expect(hundred.toString()).assertEqual("100");
      expect(thousand.toString()).assertEqual("1000");
      expect(million.toString()).assertEqual("1000000");
      expect(billion.toString()).assertEqual("1000000000");
      expect(ten.toString().length).assertEqual(2);
      expect(hundred.toString().length).assertEqual(3);
      expect(billion.toString().length).assertEqual(10);
    });

    /**
     * @tc.name  bigIntToStringDecimalTest7700
     * @tc.number  SUB_BUILTINS_BIGINT_TOSTRING_DECIMAL_TEST_7700
     * @tc.desc  Test toString() roundtrip - preserves sign
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntToStringDecimalTest7700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const original: BigInt = new BigInt(9876543210);
      const decimalStr: string = original.toString();
      const parsed: BigInt = new BigInt(decimalStr);

      expect(decimalStr).assertEqual("9876543210");
      expect(parsed.equals(original)).assertTrue();

      const negOriginal: BigInt = new BigInt(-123456789);
      const negDecimalStr: string = negOriginal.toString();
      const negParsed: BigInt = new BigInt(negDecimalStr);

      expect(negDecimalStr).assertEqual("-123456789");
      expect(negParsed.equals(negOriginal)).assertTrue();
    });

    /**
     * @tc.name  bigIntToStringDecimalTest7800
     * @tc.number  SUB_BUILTINS_BIGINT_TOSTRING_DECIMAL_TEST_7800
     * @tc.desc  Test toString() with extremely large number (2^128) - verify no precision loss
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntToStringDecimalTest7800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const twoTo128: BigInt = new BigInt("340282366920938463463374607431768211456");
      const result: string = twoTo128.toString();

      expect(result).assertEqual("340282366920938463463374607431768211456");
      expect(result.length).assertEqual(39);
    });

    /**
     * @tc.name  bigIntToStringDecimalTest7900
     * @tc.number  SUB_BUILTINS_BIGINT_TOSTRING_DECIMAL_TEST_7900
     * @tc.desc  Test toString() comparison across zero, positive, and negative values
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntToStringDecimalTest7900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const zero: BigInt = new BigInt(0);
      const one: BigInt = new BigInt(1);
      const minusOne: BigInt = new BigInt(-1);
      const posLarge: BigInt = new BigInt(255);
      const negLarge: BigInt = new BigInt(-255);
      const negHuge: BigInt = new BigInt(-99999);
      const posHuge: BigInt = new BigInt("999999999999999999999999999999");

      expect(zero.toString()).assertEqual("0");

      expect(minusOne.toString()).assertEqual("-1");
      expect(negLarge.toString()).assertEqual("-255");
      expect(negHuge.toString()).assertEqual("-99999");

      expect(one.toString()).assertEqual("1");
      expect(posLarge.toString()).assertEqual("255");
      expect(posHuge.toString()).assertEqual("999999999999999999999999999999");
    });

    /**
     * @tc.name  bigIntToStringDecimalTest8000
     * @tc.number  SUB_BUILTINS_BIGINT_TOSTRING_DECIMAL_TEST_8000
     * @tc.desc  Test toString() with byte boundary values
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntToStringDecimalTest8000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const minByte: BigInt = new BigInt(-128);
      const maxByte: BigInt = new BigInt(127);
      const overflowNeg: BigInt = new BigInt(-129);
      const overflowPos: BigInt = new BigInt(128);

      expect(minByte.toString()).assertEqual("-128");
      expect(maxByte.toString()).assertEqual("127");
      expect(overflowNeg.toString()).assertEqual("-129");
      expect(overflowPos.toString()).assertEqual("128");
    });

    /**
     * @tc.name  bigIntToStringDecimalTest8100
     * @tc.number  SUB_BUILTINS_BIGINT_TOSTRING_DECIMAL_TEST_8100
     * @tc.desc  Test toString() with short boundary values (-32768, 32767)
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntToStringDecimalTest8100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const minShort: BigInt = new BigInt(-32768);
      const maxShort: BigInt = new BigInt(32767);

      expect(minShort.toString()).assertEqual("-32768");
      expect(maxShort.toString()).assertEqual("32767");
    });

    /**
     * @tc.name  bigIntToStringDecimalTest8200
     * @tc.number  SUB_BUILTINS_BIGINT_TOSTRING_DECIMAL_TEST_8200
     * @tc.desc  Test toString() with int boundary values (-2147483648, 2147483647)
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntToStringDecimalTest8200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const minInt: BigInt = new BigInt(-2147483648);
      const maxInt: BigInt = new BigInt(2147483647);

      expect(minInt.toString()).assertEqual("-2147483648");
      expect(maxInt.toString()).assertEqual("2147483647");
    });

    /**
     * @tc.name  bigIntToStringDecimalTest8300
     * @tc.number  SUB_BUILTINS_BIGINT_TOSTRING_DECIMAL_TEST_8300
     * @tc.desc  Test toString() with large finite values - verify precision handling
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntToStringDecimalTest8300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const largeFinite: BigInt = new BigInt("179769313486231570000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000");

      expect(largeFinite.toString()).assertInstanceOf('string');
      expect(largeFinite.toString().length).assertLarger(0);
      expect(largeFinite.toString()).assertEqual("179769313486231570000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000");
    });

    /**
     * @tc.name  bigIntToStringPowerOfTwoRadixTest8400
     * @tc.number  SUB_BUILTINS_BIGINT_TOSTRING_POWER_OF_TWO_RADIX_TEST_8400
     * @tc.desc  Test toString(radix: int) with binary (radix=2) - returns same as toString(2)
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntToStringPowerOfTwoRadixTest8400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const bigIntValue: BigInt = new BigInt(255);
      const result: string = bigIntValue.toString(2);
      const expected: string = bigIntValue.toString(2);

      expect(result).assertInstanceOf('string');
      expect(result).assertEqual("11111111");
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.name  bigIntToStringPowerOfTwoRadixTest8500
     * @tc.number  SUB_BUILTINS_BIGINT_TOSTRING_POWER_OF_TWO_RADIX_TEST_8500
     * @tc.desc  Test toString(radix: int) with octal (radix=8) - positive value
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntToStringPowerOfTwoRadixTest8500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const bigIntValue: BigInt = new BigInt(64);
      const result: string = bigIntValue.toString(8);
      const expected: string = bigIntValue.toString(8);

      expect(result).assertEqual("100");
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.name  bigIntToStringPowerOfTwoRadixTest8600
     * @tc.number  SUB_BUILTINS_BIGINT_TOSTRING_POWER_OF_TWO_RADIX_TEST_8600
     * @tc.desc  Test toString(radix: int) with hexadecimal (radix=16) - preserves negative sign
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntToStringPowerOfTwoRadixTest8600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const positive: BigInt = new BigInt(255);
      const negative: BigInt = new BigInt(-255);
      const medium: BigInt = new BigInt(4096);

      expect(positive.toString(16)).assertEqual("ff");

      expect(negative.toString(16)).assertEqual("-ff");

      expect(medium.toString(16)).assertEqual("1000");
    });

    /**
     * @tc.name  bigIntToStringPowerOfTwoRadixTest8700
     * @tc.number  SUB_BUILTINS_BIGINT_TOSTRING_POWER_OF_TWO_RADIX_TEST_8700
     * @tc.desc  Test toString(radix: int) with radix=4 (2^2) - valid power of two
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntToStringPowerOfTwoRadixTest8700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const bigIntValue: BigInt = new BigInt(255);
      const result: string = bigIntValue.toString(4);
      const expected: string = bigIntValue.toString(4);

      expect(result).assertEqual("3333");
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.name  bigIntToStringPowerOfTwoRadixTest8800
     * @tc.number  SUB_BUILTINS_BIGINT_TOSTRING_POWER_OF_TWO_RADIX_TEST_8800
     * @tc.desc  Test toString(radix: int) with radix=32 (2^5) - valid power of two
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntToStringPowerOfTwoRadixTest8800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const bigIntValue: BigInt = new BigInt(1023);
      const result: string = bigIntValue.toString(32);
      const expected: string = bigIntValue.toString(32);

      expect(result).assertEqual("vv");
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.name  bigIntToStringPowerOfTwoRadixTest8900
     * @tc.number  SUB_BUILTINS_BIGINT_TOSTRING_POWER_OF_TWO_RADIX_TEST_8900
     * @tc.desc  Test toString(radix: int) with value 1
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntToStringPowerOfTwoRadixTest8900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const one: BigInt = new BigInt(1);

      const result2: string = one.toString(2);
      const result4: string = one.toString(4);
      const result8: string = one.toString(8);
      const result16: string = one.toString(16);
      const result32: string = one.toString(32);

      expect(result2).assertEqual("1");
      expect(result4).assertEqual("1");
      expect(result8).assertEqual("1");
      expect(result16).assertEqual("1");
      expect(result32).assertEqual("1");
    });

    /**
     * @tc.name  bigIntToStringPowerOfTwoRadixTest9000
     * @tc.number  SUB_BUILTINS_BIGINT_TOSTRING_POWER_OF_TWO_RADIX_TEST_9000
     * @tc.desc  Test toString(radix: int) with value 1 - returns "1" for valid radix
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntToStringPowerOfTwoRadixTest9000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const one: BigInt = new BigInt(1);

      expect(one.toString(2)).assertEqual("1");
      expect(one.toString(4)).assertEqual("1");
      expect(one.toString(8)).assertEqual("1");
      expect(one.toString(16)).assertEqual("1");
    });

    /**
     * @tc.name  bigIntToStringPowerOfTwoRadixTest9100
     * @tc.number  SUB_BUILTINS_BIGINT_TOSTRING_POWER_OF_TWO_RADIX_TEST_9100
     * @tc.desc  Test toString(radix: int) with huge number spanning multiple chunks
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntToStringPowerOfTwoRadixTest9100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const huge: BigInt = new BigInt("18446744073709551616");
      const resultHex: string = huge.toString(16);
      const resultOct: string = huge.toString(8);
      const resultBin: string = huge.toString(2);
      const expectedHex: string = huge.toString(16);
      const expectedOct: string = huge.toString(8);
      const expectedBin: string = huge.toString(2);

      expect(resultHex).assertEqual("10000000000000000");
      expect(resultHex).assertEqual(expectedHex);
      expect(resultOct).assertEqual("2000000000000000000000");
      expect(resultOct).assertEqual(expectedOct);
      expect(resultBin).assertEqual("1" + "0".repeat(64));
      expect(resultBin).assertEqual(expectedBin);
    });

    /**
     * @tc.name  bigIntToStringPowerOfTwoRadixTest9200
     * @tc.number  SUB_BUILTINS_BIGINT_TOSTRING_POWER_OF_TWO_RADIX_TEST_9200
     * @tc.desc  Test toString(radix: int) consistency with toString() for all valid power-of-two radixes
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntToStringPowerOfTwoRadixTest9200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const testValue: BigInt = new BigInt("123456789012345");
      const radix2: string = testValue.toString(2);
      const radix4: string = testValue.toString(4);
      const radix8: string = testValue.toString(8);
      const radix16: string = testValue.toString(16);
      const radix32: string = testValue.toString(32);

      expect(radix2).assertEqual(testValue.toString(2));
      expect(radix4).assertEqual(testValue.toString(4));
      expect(radix8).assertEqual(testValue.toString(8));
      expect(radix16).assertEqual(testValue.toString(16));
      expect(radix32).assertEqual(testValue.toString(32));
    });

    /**
     * @tc.name  bigIntToStringPowerOfTwoRadixTest9300
     * @tc.number  SUB_BUILTINS_BIGINT_TOSTRING_POWER_OF_TWO_RADIX_TEST_9300
     * @tc.desc  Test toString(radix: int) with power-of-two values (single bit set) in hex
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntToStringPowerOfTwoRadixTest9300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const two: BigInt = new BigInt(2);
      const one28: BigInt = new BigInt(128);
      const two56: BigInt = new BigInt(256);
      const two31: BigInt = new BigInt(2147483648);

      expect(two.toString(16)).assertEqual("2");
      expect(one28.toString(16)).assertEqual("80");
      expect(two56.toString(16)).assertEqual("100");
      expect(two31.toString(16)).assertEqual("80000000");
    });

    /**
     * @tc.name  bigIntToStringPowerOfTwoRadixTest9400
     * @tc.number  SUB_BUILTINS_BIGINT_TOSTRING_POWER_OF_TWO_RADIX_TEST_9400
     * @tc.desc  Test toString(radix: int) with negative value - preserves negative sign
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntToStringPowerOfTwoRadixTest9400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const negValue: BigInt = new BigInt(-255);
      const result16: string = negValue.toString(16);
      const result2: string = negValue.toString(2);
      const result8: string = negValue.toString(8);

      expect(result16).assertEqual("-ff");
      expect(result2).assertEqual("-11111111");
      expect(result8).assertEqual("-377");

      expect(negValue.toString(16)).assertEqual("-ff");
      expect(negValue.toString(2)).assertEqual("-11111111");
      expect(negValue.toString(8)).assertEqual("-377");
    });

    /**
     * @tc.name  bigIntToStringPowerOfTwoRadixTest9500
     * @tc.number  SUB_BUILTINS_BIGINT_TOSTRING_POWER_OF_TWO_RADIX_TEST_9500
     * @tc.desc  Test toString(radix: int) with radix=32 - valid max power-of-two within 2-36 range
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntToStringPowerOfTwoRadixTest9500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const bigIntValue: BigInt = new BigInt(4095);
      const result: string = bigIntValue.toString(32);
      const expected: string = bigIntValue.toString(32);

      expect(result).assertEqual("3vv");
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.name  bigIntToStringPowerOfTwoRadixTest9600
     * @tc.number  SUB_BUILTINS_BIGINT_TOSTRING_POWER_OF_TWO_RADIX_TEST_9600
     * @tc.desc  Test toString(radix: int) with value requiring chunk padding (not aligned to chunk boundary)
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntToStringPowerOfTwoRadixTest9600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const value: BigInt = new BigInt(5);
      const resultBin: string = value.toString(2);
      const resultHex: string = value.toString(16);

      expect(resultBin).assertEqual("101");
      expect(resultHex).assertEqual("5");
    });

    /**
     * @tc.name  bigIntToStringPowerOfTwoRadixTest9700
     * @tc.number  SUB_BUILTINS_BIGINT_TOSTRING_POWER_OF_TWO_RADIX_TEST_9700
     * @tc.desc  Test toString(radix: int) with 2^128 in hex - very large power of two
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntToStringPowerOfTwoRadixTest9700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const twoTo128: BigInt = new BigInt("340282366920938463463374607431768211456");
      const result: string = twoTo128.toString(16);
      const expected: string = twoTo128.toString(16);

      expect(result).assertEqual("100000000000000000000000000000000");
      expect(result.length).assertEqual(33);
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.name  bigIntToStringPowerOfTwoRadixTest9800
     * @tc.number  SUB_BUILTINS_BIGINT_TOSTRING_POWER_OF_TWO_RADIX_TEST_9800
     * @tc.desc  Test toString(radix: int) returns string type for all valid inputs
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntToStringPowerOfTwoRadixTest9800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const testValue: BigInt = new BigInt(12345);
      const result2: string = testValue.toString(2);
      const result16: string = testValue.toString(16);
      const result32: string = testValue.toString(32);

      expect(result2).assertInstanceOf('string');
      expect(result16).assertInstanceOf('string');
      expect(result32).assertInstanceOf('string');
      expect(result2.length).assertEqual(14);
      expect(result16.length).assertEqual(4);
      expect(result32.length).assertEqual(3);
    });

  });
};
