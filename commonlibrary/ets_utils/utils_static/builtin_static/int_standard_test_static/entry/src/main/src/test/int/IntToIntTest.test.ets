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

export default function IntToIntTest(): void {
  describe('IntToIntTest', (): void => {
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
     * @tc.number INT_TO_ITEM_CHK_0100
     * @tc.name testIntToInt0001
     * @tc.desc Verify toInt with no arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToInt0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(65);
      const result = a.toInt();
      expect(result).assertEqual(65);
    });

    /**
     * @tc.number INT_TO_ITEM_CHK_0300
     * @tc.name testIntToInt0003
     * @tc.desc Verify toInt returns original int value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToInt0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(123);
      const result = a.toInt();
      expect(result).assertEqual(123);
      expect(typeof result).assertEqual("int");
    });

    /**
     * @tc.number INT_TO_ITEM_CHK_0400
     * @tc.name testIntToInt0004
     * @tc.desc Verify return value is int primitive type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToInt0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(456);
      const result = a.toInt();
      expect(typeof result).assertEqual("int");
      expect(result >= Int.MIN_VALUE).assertTrue();
      expect(result <= Int.MAX_VALUE).assertTrue();
    });

    /**
     * @tc.number INT_TO_ITEM_CHK_0500
     * @tc.name testIntToInt0005
     * @tc.desc Verify normal positive integer conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToInt0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(99999);
      expect(a.toInt()).assertEqual(99999);
    });

    /**
     * @tc.number INT_TO_ITEM_CHK_0600
     * @tc.name testIntToInt0006
     * @tc.desc Verify small positive integer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToInt0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(1);
      expect(a.toInt()).assertEqual(1);
    });

    /**
     * @tc.number INT_TO_ITEM_CHK_0700
     * @tc.name testIntToInt0007
     * @tc.desc Verify zero value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToInt0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(0);
      expect(a.toInt()).assertEqual(0);
    });

    /**
     * @tc.number INT_TO_ITEM_CHK_0800
     * @tc.name testIntToInt0008
     * @tc.desc Verify normal negative integer conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToInt0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(-99999);
      expect(a.toInt()).assertEqual(-99999);
    });

    /**
     * @tc.number INT_TO_ITEM_CHK_0900
     * @tc.name testIntToInt0009
     * @tc.desc Verify negative boundary value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToInt0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(-12345);
      expect(a.toInt()).assertEqual(-12345);
    });

    /**
     * @tc.number INT_TO_ITEM_CHK_1000
     * @tc.name testIntToInt0010
     * @tc.desc Verify int minimum value -2147483648
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToInt0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(Int.MIN_VALUE);
      expect(a.toInt()).assertEqual(-2147483648);
    });

    /**
     * @tc.number INT_TO_ITEM_CHK_1100
     * @tc.name testIntToInt0011
     * @tc.desc Verify int maximum value 2147483647
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToInt0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(Int.MAX_VALUE);
      expect(a.toInt()).assertEqual(2147483647);
    });

    /**
     * @tc.number INT_TO_ITEM_CHK_1200
     * @tc.name testIntToInt0012
     * @tc.desc Verify large positive number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToInt0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(1000000);
      expect(a.toInt()).assertEqual(1000000);
    });

    /**
     * @tc.number INT_TO_ITEM_CHK_1300
     * @tc.name testIntToInt0013
     * @tc.desc Verify large negative number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToInt0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(-1000000);
      expect(a.toInt()).assertEqual(-1000000);
    });

    /**
     * @tc.number INT_TO_ITEM_CHK_1400
     * @tc.name testIntToInt0014
     * @tc.desc Verify conversion of -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToInt0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(-1);
      expect(a.toInt()).assertEqual(-1);
    });

    /**
     * @tc.number INT_TO_ITEM_CHK_1600
     * @tc.name testIntToInt0016
     * @tc.desc Verify maximum positive number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToInt0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(2147483647);
      expect(a.toInt()).assertEqual(2147483647);
    });

    /**
     * @tc.number INT_TO_ITEM_CHK_1700
     * @tc.name testIntToInt0017
     * @tc.desc Verify minimum negative number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToInt0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(-2147483648);
      expect(a.toInt()).assertEqual(-2147483648);
    });

    /**
     * @tc.number INT_TO_ITEM_CHK_1800
     * @tc.name testIntToInt0018
     * @tc.desc Verify conversion without precision loss
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToInt0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(123456789);
      expect(a.toInt()).assertEqual(123456789);
    });

    /**
     * @tc.number INT_TO_ITEM_CHK_1900
     * @tc.name testIntToInt0019
     * @tc.desc Verify negative number precision preservation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToInt0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(-987654321);
      expect(a.toInt()).assertEqual(-987654321);
    });

    /**
     * @tc.number INT_TO_ITEM_CHK_2000
     * @tc.name testIntToInt0020
     * @tc.desc Verify toInt and intValue have same functionality
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToInt0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(654);
      expect(a.toInt()).assertEqual(654);
    });

    /**
     * @tc.number INT_TO_ITEM_CHK_2100
     * @tc.name testIntToInt0021
     * @tc.desc Verify boundary value consistency between toInt and intValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToInt0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(Int.MAX_VALUE);
      expect(a.toInt()).assertEqual(Int.MAX_VALUE);
    });

    /**
     * @tc.number INT_TO_ITEM_CHK_2200
     * @tc.name testIntToInt0022
     * @tc.desc Verify negative value consistency between toInt and intValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToInt0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(-654);
      expect(a.toInt()).assertEqual(-654);
    });

    /**
     * @tc.number INT_TO_ITEM_CHK_2300
     * @tc.name testIntToInt0023
     * @tc.desc Verify intValue follows Java naming convention
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToInt0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(789);
      expect(a.toInt()).assertEqual(789);
    });

    /**
     * @tc.number INT_TO_ITEM_CHK_2400
     * @tc.name testIntToInt0024
     * @tc.desc Verify toInt must be called through Int instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToInt0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(7500);
      const result = a.toInt();
      expect(result).assertEqual(7500);
    });

    /**
     * @tc.number INT_TO_ITEM_CHK_2500
     * @tc.name testIntToInt0025
     * @tc.desc Verify toInt does not change original Int instance value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToInt0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(8888);
      const original = a.toInt();
      const result = a.toInt();
      expect(a.toInt()).assertEqual(original);
      expect(result).assertEqual(8888);
    });

    /**
     * @tc.number INT_TO_ITEM_CHK_2600
     * @tc.name testIntToInt0026
     * @tc.desc Verify toInt return value can be used further
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToInt0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(10000);
      const i = a.toInt();
      const result = i + 5000;
      expect(result).assertEqual(15000);
    });

    /**
     * @tc.number INT_TO_ITEM_CHK_2700
     * @tc.name testIntToInt0027
     * @tc.desc Verify math operation after toInt
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToInt0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(100);
      const result = a.toInt() * 2 + 50;
      expect(result).assertEqual(250);
    });

    /**
     * @tc.number INT_TO_ITEM_CHK_2800
     * @tc.name testIntToInt0028
     * @tc.desc Verify multiple conversions of same value yield consistent result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToInt0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(99999);
      const result1 = a.toInt();
      const result2 = a.toInt();
      expect(result1).assertEqual(result2);
    });

    /**
     * @tc.number INT_TO_ITEM_CHK_2900
     * @tc.name testIntToInt0029
     * @tc.desc Verify different instances with same value yield consistent result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToInt0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a1 = new Int(77777);
      const a2 = new Int(77777);
      expect(a1.toInt()).assertEqual(a2.toInt());
    });

    /**
     * @tc.number INT_TO_ITEM_CHK_3000
     * @tc.name testIntToInt0030
     * @tc.desc Verify conversion after arithmetic operation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToInt0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(20000);
      const b = new Int(10000);
      const result = a.add(b).toInt();
      expect(result).assertEqual(30000);
    });

    /**
     * @tc.number INT_TO_ITEM_CHK_3100
     * @tc.name testIntToInt0031
     * @tc.desc Verify conversion after subtraction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToInt0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(30000);
      const b = new Int(10000);
      const result = a.sub(b).toInt();
      expect(result).assertEqual(20000);
    });

    /**
     * @tc.number INT_TO_ITEM_CHK_3200
     * @tc.name testIntToInt0032
     * @tc.desc Verify MAX_VALUE usage
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToInt0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const max = new Int(Int.MAX_VALUE);
      const result = max.toInt();
      expect(result).assertEqual(2147483647);
    });

    /**
     * @tc.number INT_TO_ITEM_CHK_3300
     * @tc.name testIntToInt0033
     * @tc.desc Verify MIN_VALUE usage
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToInt0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const min = new Int(Int.MIN_VALUE);
      const result = min.toInt();
      expect(result).assertEqual(-2147483648);
    });

    /**
     * @tc.number INT_TO_ITEM_CHK_3400
     * @tc.name testIntToInt0034
     * @tc.desc Verify toInt preserves precision while toByte may lose it
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToInt0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(1000);
      expect(a.toInt()).assertEqual(1000);
      expect(a.toByte() < 128).assertTrue();
    });

    /**
     * @tc.number INT_TO_ITEM_CHK_3500
     * @tc.name testIntToInt0035
     * @tc.desc Verify toInt range is larger than toShort
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToInt0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(100000);
      expect(a.toInt()).assertEqual(100000);
      expect(a.toShort() < 32768).assertTrue();
    });

    /**
     * @tc.number INT_TO_ITEM_CHK_3600
     * @tc.name testIntToInt0036
     * @tc.desc Verify toLong has larger range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToInt0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(100000);
      expect(a.toInt()).assertEqual(100000);
      expect(a.toLong() >= 100000).assertTrue();
    });

    /**
     * @tc.number INT_TO_ITEM_CHK_3700
     * @tc.name testIntToInt0037
     * @tc.desc Verify toFloat converts to floating point number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToInt0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(123);
      expect(a.toInt()).assertEqual(123);
      expect(a.toFloat()).assertEqual(123.0);
    });

    /**
     * @tc.number INT_TO_ITEM_CHK_3800
     * @tc.name testIntToInt0038
     * @tc.desc Verify toDouble converts to double precision floating point
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToInt0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(456);
      expect(a.toInt()).assertEqual(456);
      expect(a.toDouble()).assertEqual(456.0);
    });

    /**
     * @tc.number INT_TO_ITEM_CHK_3900
     * @tc.name testIntToInt0039
     * @tc.desc Verify usage with int array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToInt0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Int[] = [new Int(10), new Int(20), new Int(30)];
      const ints = values.map((v: Int): int => v.toInt());
      expect(ints.length).assertEqual(3);
      expect(ints[0]).assertEqual(10);
    });

    /**
     * @tc.number INT_TO_ITEM_CHK_4000
     * @tc.name testIntToInt0040
     * @tc.desc Verify math operation after conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToInt0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(100);
      const b = new Int(200);
      const result = a.toInt() + b.toInt();
      expect(result).assertEqual(300);
    });

    /**
     * @tc.number INT_TO_ITEM_CHK_4100
     * @tc.name testIntToInt0041
     * @tc.desc Verify conversion to local int variable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToInt0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(500);
      const localInt: int = a.toInt();
      expect(localInt).assertEqual(500);
    });

    /**
     * @tc.number INT_TO_ITEM_CHK_4200
     * @tc.name testIntToInt0042
     * @tc.desc Verify valueOf created instance can call toInt
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToInt0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(654321);
      const result = a.toInt();
      expect(result).assertEqual(654321);
    });

    /**
     * @tc.number INT_TO_ITEM_CHK_4300
     * @tc.name testIntToInt0043
     * @tc.desc Verify instance toInt and static toInt have consistent results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToInt0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(654321);
      const result1 = a.toInt();
      const result2 = Int.toInt(654321);
      expect(result1).assertEqual(result2);
    });

    /**
     * @tc.number INT_TO_ITEM_CHK_4400
     * @tc.name testIntToInt0044
     * @tc.desc Verify conversion to int then to other types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToInt0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(100);
      const i = a.toInt();
      const result = i * 2.5;
      expect(result).assertEqual(250.0);
    });

    /**
     * @tc.number INT_TO_ITEM_CHK_4500
     * @tc.name testIntToInt0045
     * @tc.desc Verify precision unchanged after round trip conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToInt0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const original = 123456789;
      const a = new Int(original);
      const converted = a.toInt();
      expect(converted).assertEqual(original);
    });

    /**
     * @tc.number INT_TO_ITEM_CHK_4600
     * @tc.name testIntToInt0046
     * @tc.desc Verify performance of multiple toInt calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToInt0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(1000);
      let sum = 0;
      for (let i = 0; i < 1000; i++) {
        sum += a.toInt();
      }
      expect(sum).assertEqual(1000000);
    });

    /**
     * @tc.number INT_TO_ITEM_CHK_4700
     * @tc.name testIntToInt0047
     * @tc.desc Verify large array conversion performance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToInt0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Int[] = [];
      for (let i = 0; i < 10000; i++) {
        values.push(new Int(i));
      }
      const ints = values.map((v: Int): int => v.toInt());
      expect(ints.length).assertEqual(10000);
    });

    /**
     * @tc.number INT_TO_ITEM_CHK_4800
     * @tc.name testIntToInt0048
     * @tc.desc Verify toInt method exists
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToInt0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(500);
      expect(typeof a.toInt).assertEqual("function");
    });

    /**
     * @tc.number INT_TO_ITEM_CHK_4900
     * @tc.name testIntToInt0049
     * @tc.desc Verify method does not accept parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToInt0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(500);
      expect(a.toInt()).assertEqual(500);
    });

    /**
     * @tc.number INT_TO_ITEM_CHK_5000
     * @tc.name testIntToInt0050
     * @tc.desc Verify return value is not an object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToInt0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(500);
      const result = a.toInt();
      expect(typeof result).assertEqual("int");
      expect(result).assertEqual(500);
    });

    /**
     * @tc.number INT_TO_ITEM_CHK_5100
     * @tc.name testIntToInt0051
     * @tc.desc Verify return value can be used directly in math operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToInt0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(100);
      const result = a.toInt() + 50;
      expect(result).assertEqual(150);
    });

    /**
     * @tc.number INT_TO_ITEM_CHK_5200
     * @tc.name testIntToInt0052
     * @tc.desc Verify non-Int instance cannot call toInt
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToInt0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(100);
      const result = a.toInt();
      expect(result).assertEqual(100);
    });

    /**
     * @tc.number INT_TO_ITEM_CHK_5300
     * @tc.name testIntToInt0053
     * @tc.desc Verify equal values after toInt
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToInt0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(100);
      const b = new Int(100);
      expect(a.toInt()).assertEqual(b.toInt());
    });

    /**
     * @tc.number INT_TO_ITEM_CHK_5400
     * @tc.name testIntToInt0054
     * @tc.desc Verify converted value can compare with primitive int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToInt0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(200);
      const originalInt: int = 200;
      expect(a.toInt()).assertEqual(originalInt);
    });

    /**
     * @tc.number INT_TO_ITEM_CHK_5500
     * @tc.name testIntToInt0055
     * @tc.desc Verify toInt immediately after construction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToInt0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Int(500).toInt();
      expect(result).assertEqual(500);
    });

    /**
     * @tc.number INT_TO_ITEM_CHK_5600
     * @tc.name testIntToInt0056
     * @tc.desc Verify toInt immediately after valueOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToInt0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Int(600).toInt();
      expect(result).assertEqual(600);
    });

    /**
     * @tc.number INT_TO_ITEM_CHK_5700
     * @tc.name testIntToInt0057
     * @tc.desc Verify conversion result is within int range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToInt0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(1000000);
      const result = a.toInt();
      expect(result >= Int.MIN_VALUE).assertTrue();
      expect(result <= Int.MAX_VALUE).assertTrue();
    });

    /**
     * @tc.number INT_TO_ITEM_CHK_5800
     * @tc.name testIntToInt0058
     * @tc.desc Verify extreme value conversion is correct
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToInt0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const max = new Int(Int.MAX_VALUE);
      const min = new Int(Int.MIN_VALUE);
      expect(max.toInt()).assertEqual(Int.MAX_VALUE);
      expect(min.toInt()).assertEqual(Int.MIN_VALUE);
    });
  });
}
