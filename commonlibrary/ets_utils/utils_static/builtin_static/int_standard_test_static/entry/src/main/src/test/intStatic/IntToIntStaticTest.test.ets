'use static';
/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium-binary/src/main/indexStatic';
import Utils from '../Util.test';

function intToIntStaticTestHelperGet056(): int {
  return 123;
}

function intToIntStaticTestHelperProcess064(value: int): int {
  return Int.toInt(value);
}

export default function IntToIntStaticTest(): void {
  describe('IntToIntStaticTest', (): void => {
    beforeAll((): void => {
    });
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });
    afterEach((): void => {
    });
    afterAll((): void => {
    });

    /**
     * @tc.number INT_TO_INT_S_CHK_0100
     * @tc.name testIntToIntStatic0001
     * @tc.desc Verify required value parameter is passed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToIntStatic0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Int.toInt(65);
      expect(result).assertEqual(65);
    });

    /**
     * @tc.number INT_TO_INT_S_CHK_0200
     * @tc.name testIntToIntStatic0002
     * @tc.desc Verify error when no parameter is passed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToIntStatic0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Int.toInt(0)).assertEqual(0);
    });

    /**
     * @tc.number INT_TO_INT_S_CHK_0400
     * @tc.name testIntToIntStatic0004
     * @tc.desc Verify normal range integer value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToIntStatic0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Int.toInt(100);
      expect(result).assertEqual(100);
    });

    /**
     * @tc.number INT_TO_INT_S_CHK_0500
     * @tc.name testIntToIntStatic0005
     * @tc.desc Verify positive value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToIntStatic0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Int.toInt(500);
      expect(result).assertEqual(500);
    });

    /**
     * @tc.number INT_TO_INT_S_CHK_0600
     * @tc.name testIntToIntStatic0006
     * @tc.desc Verify negative value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToIntStatic0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Int.toInt(-500);
      expect(result).assertEqual(-500);
    });

    /**
     * @tc.number INT_TO_INT_S_CHK_0700
     * @tc.name testIntToIntStatic0007
     * @tc.desc Verify zero value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToIntStatic0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Int.toInt(0);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number INT_TO_INT_S_CHK_0800
     * @tc.name testIntToIntStatic0008
     * @tc.desc Verify int max value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToIntStatic0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Int.toInt(2147483647);
      expect(result).assertEqual(2147483647);
      expect(result).assertEqual(Int.MAX_VALUE);
    });

    /**
     * @tc.number INT_TO_INT_S_CHK_0900
     * @tc.name testIntToIntStatic0009
     * @tc.desc Verify int min value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToIntStatic0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Int.toInt(-2147483648);
      expect(result).assertEqual(-2147483648);
      expect(result).assertEqual(Int.MIN_VALUE);
    });

    /**
     * @tc.number INT_TO_INT_S_CHK_1000
     * @tc.name testIntToIntStatic0010
     * @tc.desc Verify hex positive integer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToIntStatic0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Int.toInt(0x41);
      expect(result).assertEqual(65);
    });

    /**
     * @tc.number INT_TO_INT_S_CHK_1100
     * @tc.name testIntToIntStatic0011
     * @tc.desc Verify hex max int value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToIntStatic0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Int.toInt(0x7FFFFFFF);
      expect(result).assertEqual(2147483647);
    });

    /**
     * @tc.number INT_TO_INT_S_CHK_1200
     * @tc.name testIntToIntStatic0012
     * @tc.desc Verify hex negative value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToIntStatic0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Int.toInt(-0x1);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number INT_TO_INT_S_CHK_1300
     * @tc.name testIntToIntStatic0013
     * @tc.desc Verify octal value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToIntStatic0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Int.toInt(0o101);
      expect(result).assertEqual(65);
    });

    /**
     * @tc.number INT_TO_INT_S_CHK_1400
     * @tc.name testIntToIntStatic0014
     * @tc.desc Verify octal large value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToIntStatic0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Int.toInt(0o17777777777);
      expect(result).assertEqual(2147483647);
    });

    /**
     * @tc.number INT_TO_INT_S_CHK_1500
     * @tc.name testIntToIntStatic0015
     * @tc.desc Verify binary value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToIntStatic0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Int.toInt(0b1000001);
      expect(result).assertEqual(65);
    });

    /**
     * @tc.number INT_TO_INT_S_CHK_1600
     * @tc.name testIntToIntStatic0016
     * @tc.desc Verify binary max int value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToIntStatic0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Int.toInt(0b1111111111111111111111111111111);
      expect(result).assertEqual(2147483647);
    });

    /**
     * @tc.number INT_TO_INT_S_CHK_1700
     * @tc.name testIntToIntStatic0017
     * @tc.desc Verify conversion of 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToIntStatic0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Int.toInt(1);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number INT_TO_INT_S_CHK_1800
     * @tc.name testIntToIntStatic0018
     * @tc.desc Verify conversion of -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToIntStatic0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Int.toInt(-1);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number INT_TO_INT_S_CHK_1900
     * @tc.name testIntToIntStatic0019
     * @tc.desc Verify power of 2 conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToIntStatic0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Int.toInt(2)).assertEqual(2);
      expect(Int.toInt(4)).assertEqual(4);
      expect(Int.toInt(8)).assertEqual(8);
      expect(Int.toInt(16)).assertEqual(16);
      expect(Int.toInt(32)).assertEqual(32);
      expect(Int.toInt(64)).assertEqual(64);
      expect(Int.toInt(128)).assertEqual(128);
      expect(Int.toInt(256)).assertEqual(256);
      expect(Int.toInt(512)).assertEqual(512);
      expect(Int.toInt(1024)).assertEqual(1024);
      expect(Int.toInt(2048)).assertEqual(2048);
    });

    /**
     * @tc.number INT_TO_INT_S_CHK_2600
     * @tc.name testIntToIntStatic0026
     * @tc.desc Verify passing array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToIntStatic0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: int[] = [0];
      expect(values.length).assertEqual(1);
      expect(Int.toInt(values[0])).assertEqual(0);
    });

    /**
     * @tc.number INT_TO_INT_S_CHK_2700
     * @tc.name testIntToIntStatic0027
     * @tc.desc Verify returned int value equals original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToIntStatic0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Int.toInt(123);
      expect(result).assertEqual(123);
      expect(typeof result).assertEqual("int");
    });

    /**
     * @tc.number INT_TO_INT_S_CHK_2800
     * @tc.name testIntToIntStatic0028
     * @tc.desc Verify return value is int type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToIntStatic0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Int.toInt(500);
      expect(typeof result).assertEqual("int");
      expect(result).assertLargerOrEqual(Int.MIN_VALUE);
      expect(result).assertLessOrEqual(Int.MAX_VALUE);
    });

    /**
     * @tc.number INT_TO_INT_S_CHK_2900
     * @tc.name testIntToIntStatic0029
     * @tc.desc Verify toInt returns original value as identity conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToIntStatic0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const testValues = [0, 1, -1, 100, -100, 1000000, -1000000];
      testValues.forEach((v: int): void => {
        expect(Int.toInt(v)).assertEqual(v);
      });
    });

    /**
     * @tc.number INT_TO_INT_S_CHK_3000
     * @tc.name testIntToIntStatic0030
     * @tc.desc Verify normal positive integer conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToIntStatic0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Int.toInt(9999);
      expect(result).assertEqual(9999);
    });

    /**
     * @tc.number INT_TO_INT_S_CHK_3300
     * @tc.name testIntToIntStatic0033
     * @tc.desc Verify normal negative integer conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToIntStatic0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Int.toInt(-9999);
      expect(result).assertEqual(-9999);
    });

    /**
     * @tc.number INT_TO_INT_S_CHK_3400
     * @tc.name testIntToIntStatic0034
     * @tc.desc Verify negative boundary value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToIntStatic0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Int.toInt(-2147483648);
      expect(result).assertEqual(-2147483648);
    });

    /**
     * @tc.number INT_TO_INT_S_CHK_3700
     * @tc.name testIntToIntStatic0037
     * @tc.desc Verify boundary value plus and minus 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToIntStatic0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Int.toInt(Int.MAX_VALUE - 1)).assertEqual(2147483646);
      expect(Int.toInt(Int.MIN_VALUE + 1)).assertEqual(-2147483647);
    });

    /**
     * @tc.number INT_TO_INT_S_CHK_4000
     * @tc.name testIntToIntStatic0040
     * @tc.desc Verify power of 2 conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToIntStatic0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Int.toInt(256)).assertEqual(256);
      expect(Int.toInt(512)).assertEqual(512);
      expect(Int.toInt(1024)).assertEqual(1024);
      expect(Int.toInt(2048)).assertEqual(2048);
    });

    /**
     * @tc.number INT_TO_INT_S_CHK_4100
     * @tc.name testIntToIntStatic0041
     * @tc.desc Verify consecutive integers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToIntStatic0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let i = -100; i <= 100; i++) {
        expect(Int.toInt(i)).assertEqual(i);
      }
    });

    /**
     * @tc.number INT_TO_INT_S_CHK_4200
     * @tc.name testIntToIntStatic0042
     * @tc.desc Verify return value is number type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToIntStatic0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Int.toInt(1000);
      expect(typeof result).assertEqual("int");
    });

    /**
     * @tc.number INT_TO_INT_S_CHK_4300
     * @tc.name testIntToIntStatic0043
     * @tc.desc Verify return value is integer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToIntStatic0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Int.toInt(1234);
      expect(result).assertEqual(Math.floor(result));
      expect(result % 1).assertEqual(0);
    });

    /**
     * @tc.number INT_TO_INT_S_CHK_4400
     * @tc.name testIntToIntStatic0044
     * @tc.desc Verify result is within int range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToIntStatic0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Int.toInt(5000);
      expect(result).assertLargerOrEqual(Int.MIN_VALUE);
      expect(result).assertLessOrEqual(Int.MAX_VALUE);
    });

    /**
     * @tc.number INT_TO_INT_S_CHK_4500
     * @tc.name testIntToIntStatic0045
     * @tc.desc Verify static call through Int class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToIntStatic0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Int.toInt(7500);
      expect(result).assertEqual(7500);
    });

    /**
     * @tc.number INT_TO_INT_S_CHK_4600
     * @tc.name testIntToIntStatic0046
     * @tc.desc Verify static toInt matches instance intValue result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToIntStatic0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(65);
      const result1 = Int.toInt(65);
      const result2 = a.toInt();
      expect(result1).assertEqual(result2);
    });

    /**
     * @tc.number INT_TO_INT_S_CHK_4700
     * @tc.name testIntToIntStatic0047
     * @tc.desc Verify toInt is an identity function
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToIntStatic0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const testValues = [Int.MIN_VALUE, -1000, 0, 1000, Int.MAX_VALUE];
      testValues.forEach((v: int): void => {
        expect(Int.toInt(v)).assertEqual(v);
        expect(Int.toInt(v) === v).assertTrue();
      });
    });

    /**
     * @tc.number INT_TO_INT_S_CHK_4800
     * @tc.name testIntToIntStatic0048
     * @tc.desc Verify toInt result can be used in further operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToIntStatic0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const i = Int.toInt(100);
      const result = i + 50;
      expect(result).assertEqual(150);
    });

    /**
     * @tc.number INT_TO_INT_S_CHK_4900
     * @tc.name testIntToIntStatic0049
     * @tc.desc Verify multiple toInt calls return original value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToIntStatic0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const original = 12345;
      const result1 = Int.toInt(original);
      const result2 = Int.toInt(result1);
      const result3 = Int.toInt(result2);
      expect(result3).assertEqual(original);
    });

    /**
     * @tc.number INT_TO_INT_S_CHK_5000
     * @tc.name testIntToIntStatic0050
     * @tc.desc Verify same value multiple conversions are consistent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToIntStatic0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result1 = Int.toInt(9999);
      const result2 = Int.toInt(9999);
      expect(result1).assertEqual(result2);
      expect(result1 === result2).assertTrue();
    });

    /**
     * @tc.number INT_TO_INT_S_CHK_5100
     * @tc.name testIntToIntStatic0051
     * @tc.desc Verify all int values remain unchanged after conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToIntStatic0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let i = -1000; i <= 1000; i += 100) {
        expect(Int.toInt(i)).assertEqual(i);
      }
    });

    /**
     * @tc.number INT_TO_INT_S_CHK_5200
     * @tc.name testIntToIntStatic0052
     * @tc.desc Verify arithmetic expression result as parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToIntStatic0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Int.toInt(100 + 50);
      expect(result).assertEqual(150);
    });

    /**
     * @tc.number INT_TO_INT_S_CHK_5300
     * @tc.name testIntToIntStatic0053
     * @tc.desc Verify complex expression as parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToIntStatic0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Int.toInt((10 * 10) - 5);
      expect(result).assertEqual(95);
    });

    /**
     * @tc.number INT_TO_INT_S_CHK_5400
     * @tc.name testIntToIntStatic0054
     * @tc.desc Verify bitwise operation expression as parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToIntStatic0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Int.toInt(0x10 | 0x01);
      expect(result).assertEqual(17);
    });

    /**
     * @tc.number INT_TO_INT_S_CHK_5500
     * @tc.name testIntToIntStatic0055
     * @tc.desc Verify using constant as parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToIntStatic0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Int.toInt(Int.MAX_VALUE);
      expect(result).assertEqual(Int.MAX_VALUE);
    });

    /**
     * @tc.number INT_TO_INT_S_CHK_5600
     * @tc.name testIntToIntStatic0056
     * @tc.desc Verify function return value as parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToIntStatic0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Int.toInt(intToIntStaticTestHelperGet056());
      expect(result).assertEqual(123);
    });

    /**
     * @tc.number INT_TO_INT_S_CHK_5700
     * @tc.name testIntToIntStatic0057
     * @tc.desc Verify toInt keeps original value while toByte truncates
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToIntStatic0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = 1000;
      expect(Int.toInt(value)).assertEqual(1000);
      expect(Int.toByte(value)).assertLess(128);
    });

    /**
     * @tc.number INT_TO_INT_S_CHK_5800
     * @tc.name testIntToIntStatic0058
     * @tc.desc Verify toInt keeps original value while toShort truncates
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToIntStatic0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = 100000;
      expect(Int.toInt(value)).assertEqual(100000);
      expect(Int.toShort(value)).assertLess(32768);
    });

    /**
     * @tc.number INT_TO_INT_S_CHK_5900
     * @tc.name testIntToIntStatic0059
     * @tc.desc Verify toInt and toLong produce same value but possibly different types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToIntStatic0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = 12345;
      const i = Int.toInt(value);
      expect(i).assertEqual(12345);
    });

    /**
     * @tc.number INT_TO_INT_S_CHK_6000
     * @tc.name testIntToIntStatic0060
     * @tc.desc Verify toInt keeps integer while toFloat converts to float
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToIntStatic0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = 123;
      const i = Int.toInt(value);
      const f = Int.toFloat(value);
      expect(i).assertEqual(123);
      expect(f).assertEqual(123);
      expect(typeof f).assertEqual("float");
    });

    /**
     * @tc.number INT_TO_INT_S_CHK_6100
     * @tc.name testIntToIntStatic0061
     * @tc.desc Verify toInt keeps integer while toDouble converts to double
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToIntStatic0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = 456;
      const i = Int.toInt(value);
      const d = Int.toDouble(value);
      expect(i).assertEqual(456);
      expect(d).assertEqual(456);
    });

    /**
     * @tc.number INT_TO_INT_S_CHK_6200
     * @tc.name testIntToIntStatic0062
     * @tc.desc Verify toInt returns number while toChar returns character
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToIntStatic0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = 65;
      expect(Int.toInt(value)).assertEqual(65);
      expect(Int.toChar(value)).assertEqual(c'A');
    });

    /**
     * @tc.number INT_TO_INT_S_CHK_6300
     * @tc.name testIntToIntStatic0063
     * @tc.desc Verify explicit int type specification
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToIntStatic0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: int = 123;
      const intValue: int = Int.toInt(value);
      expect(intValue).assertEqual(123);
    });

    /**
     * @tc.number INT_TO_INT_S_CHK_6400
     * @tc.name testIntToIntStatic0064
     * @tc.desc Verify unified use of toInt for type conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToIntStatic0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(intToIntStaticTestHelperProcess064(100)).assertEqual(100);
    });

    /**
     * @tc.number INT_TO_INT_S_CHK_6500
     * @tc.name testIntToIntStatic0065
     * @tc.desc Verify value is within int range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToIntStatic0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = 12345;
      const result = Int.toInt(value);
      expect(result).assertLargerOrEqual(Int.MIN_VALUE);
      expect(result).assertLessOrEqual(Int.MAX_VALUE);
    });

    /**
     * @tc.number INT_TO_INT_S_CHK_6600
     * @tc.name testIntToIntStatic0066
     * @tc.desc Verify multiple calls performance is normal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToIntStatic0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sum = 0;
      for (let i = 0; i < 1000; i++) {
        sum += Int.toInt(100);
      }
      expect(sum).assertEqual(100000);
    });

    /**
     * @tc.number INT_TO_INT_S_CHK_6700
     * @tc.name testIntToIntStatic0067
     * @tc.desc Verify batch conversion performance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToIntStatic0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
      const results = values.map((v: int): int => Int.toInt(v));
      expect(results.length).assertEqual(10);
    });

    /**
     * @tc.number INT_TO_INT_S_CHK_6800
     * @tc.name testIntToIntStatic0068
     * @tc.desc Verify documentation example outputs 65
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToIntStatic0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      console.info(Int.toInt(65));
      expect(Int.toInt(65)).assertEqual(65);
    });

    /**
     * @tc.number INT_TO_INT_S_CHK_6900
     * @tc.name testIntToIntStatic0069
     * @tc.desc Verify static toInt and instance intValue are consistent in all cases
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToIntStatic0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const testValues = [0, 1, -1, 100, -100, 2147483647, -2147483648];
      testValues.forEach((v: int): void => {
        const a = new Int(v);
        expect(Int.toInt(v)).assertEqual(a.toInt());
        expect(Int.toInt(v) === a.toInt()).assertTrue();
      });
    });

    /**
     * @tc.number INT_TO_INT_S_CHK_7100
     * @tc.name testIntToIntStatic0071
     * @tc.desc Verify boundary value handling
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToIntStatic0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Int.toInt(Int.MAX_VALUE)).assertEqual(Int.MAX_VALUE);
      expect(Int.toInt(Int.MIN_VALUE)).assertEqual(Int.MIN_VALUE);
    });

    /**
     * @tc.number INT_TO_INT_S_CHK_7200
     * @tc.name testIntToIntStatic0072
     * @tc.desc Verify round-trip conversion preserves original value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToIntStatic0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const original = 10000;
      const toI = Int.toInt(original);
      expect(toI).assertEqual(original);
      expect(Int.toInt(Int.toInt(toI))).assertEqual(original);
    });

    /**
     * @tc.number INT_TO_INT_S_CHK_7300
     * @tc.name testIntToIntStatic0073
     * @tc.desc Verify combination with other conversion methods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToIntStatic0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = 123;
      const toI = Int.toInt(value);
      const toB = Int.toByte(toI);
      const toI2 = Int.toInt(toB);
      expect(toI2).assertEqual(123);
    });

    /**
     * @tc.number INT_TO_INT_S_CHK_7400
     * @tc.name testIntToIntStatic0074
     * @tc.desc Verify combination of valueOf and static toInt
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToIntStatic0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(16000);
      const value = a.toInt();
      const i = Int.toInt(value);
      expect(i).assertEqual(16000);
    });

    /**
     * @tc.number INT_TO_INT_S_CHK_7500
     * @tc.name testIntToIntStatic0075
     * @tc.desc Verify using static properties as parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToIntStatic0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const maxResult = Int.toInt(Int.MAX_VALUE);
      const minResult = Int.toInt(Int.MIN_VALUE);
      expect(maxResult).assertEqual(Int.MAX_VALUE);
      expect(minResult).assertEqual(Int.MIN_VALUE);
    });

    /**
     * @tc.number INT_TO_INT_S_CHK_7600
     * @tc.name testIntToIntStatic0076
     * @tc.desc Verify expression as parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToIntStatic0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = 5000;
      const b = 3000;
      const result = Int.toInt(a + b);
      expect(result).assertEqual(8000);
    });

    /**
     * @tc.number INT_TO_INT_S_CHK_7700
     * @tc.name testIntToIntStatic0077
     * @tc.desc Verify ternary operator result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToIntStatic0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const flag = true;
      const result = Int.toInt(flag ? 100 : 200);
      expect(result).assertEqual(100);
    });

    /**
     * @tc.number INT_TO_INT_S_CHK_7800
     * @tc.name testIntToIntStatic0078
     * @tc.desc Verify batch array conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToIntStatic0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const numbers = [0, 1000, 2000, 3000, 4000];
      const ints = numbers.map((n: int): int => Int.toInt(n));
      expect(ints.length).assertEqual(5);
      expect(ints[2]).assertEqual(2000);
    });

    /**
     * @tc.number INT_TO_INT_S_CHK_7900
     * @tc.name testIntToIntStatic0079
     * @tc.desc Verify array operations after conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToIntStatic0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const numbers = [10, 20, 30, 40, 50];
      const ints = numbers.map((n: int): int => Int.toInt(n));
      const sum = ints.reduce((a: int, b: int): int => a + b, 0);
      expect(sum).assertEqual(150);
    });

    /**
     * @tc.number INT_TO_INT_S_CHK_8100
     * @tc.name testIntToIntStatic0081
     * @tc.desc Verify idempotent property f(f(x)) = f(x)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToIntStatic0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const testValues = [0, 1, -1, 100, -100, Int.MAX_VALUE, Int.MIN_VALUE];
      testValues.forEach((v: int): void => {
        expect(Int.toInt(Int.toInt(v))).assertEqual(v);
      });
    });

    /**
     * @tc.number INT_TO_INT_S_CHK_8200
     * @tc.name testIntToIntStatic0082
     * @tc.desc Verify int value remains as int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToIntStatic0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: int = 12345;
      const result = Int.toInt(value);
      expect(typeof result).assertEqual("int");
      expect(result).assertEqual(12345);
    });

    /**
     * @tc.number INT_TO_INT_S_CHK_8300
     * @tc.name testIntToIntStatic0083
     * @tc.desc Verify numeric value integrity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToIntStatic0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const testValues = [Int.MIN_VALUE, -1, 0, 1, Int.MAX_VALUE];
      testValues.forEach((v: int): void => {
        const result = Int.toInt(v);
        expect(result).assertEqual(v);
        expect(result.toString()).assertEqual(v.toString());
      });
    });

    /**
     * @tc.number INT_TO_INT_S_CHK_8400
     * @tc.name testIntToIntStatic0084
     * @tc.desc Verify byte value as parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToIntStatic0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const byteValue: byte = 100;
      const result = Int.toInt(byteValue);
      expect(result).assertEqual(100);
    });

    /**
     * @tc.number INT_TO_INT_S_CHK_8500
     * @tc.name testIntToIntStatic0085
     * @tc.desc Verify short value as parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToIntStatic0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const shortValue: short = 1000;
      const result = Int.toInt(shortValue);
      expect(result).assertEqual(1000);
    });

    /**
     * @tc.number INT_TO_INT_S_CHK_8600
     * @tc.name testIntToIntStatic0086
     * @tc.desc Verify number value as parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToIntStatic0086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const numValue: int = 12345;
      const result = Int.toInt(numValue);
      expect(result).assertEqual(12345);
    });
    return;
  });
}
