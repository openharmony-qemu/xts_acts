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
import hilog from '@ohos.hilog';
import Utils from '../Util.test';

export default function IntToByteStaticTest(): void {
    describe('IntToByteStaticTest', (): void => {
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
     * @tc.number INT_TO_BYTE_S_CHK_0100
     * @tc.name testIntToByteStatic0001
     * @tc.desc Verify that value parameter must be provided
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToByteStatic0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Int.toByte(65);
      expect(result).assertEqual(65);
    });

    /**
     * @tc.number INT_TO_BYTE_S_CHK_0200
     * @tc.name testIntToByteStatic0002
     * @tc.desc Verify error when no parameter is passxd
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToByteStatic0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Int.toByte(2);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number INT_TO_BYTE_S_CHK_0400
     * @tc.name testIntToByteStatic0004
     * @tc.desc Verify conversion with normal range integer value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToByteStatic0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Int.toByte(100);
      expect(result).assertEqual(100);
    });

    /**
     * @tc.number INT_TO_BYTE_S_CHK_0500
     * @tc.name testIntToByteStatic0005
     * @tc.desc Verify conversion with positive value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToByteStatic0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Int.toByte(50);
      expect(result).assertEqual(50);
    });

    /**
     * @tc.number INT_TO_BYTE_S_CHK_0600
     * @tc.name testIntToByteStatic0006
     * @tc.desc Verify conversion with negative value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToByteStatic0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Int.toByte(-50);
      expect(result).assertEqual(-50);
    });

    /**
     * @tc.number INT_TO_BYTE_S_CHK_0700
     * @tc.name testIntToByteStatic0007
     * @tc.desc Verify conversion with zero value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToByteStatic0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Int.toByte(0);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number INT_TO_BYTE_S_CHK_0800
     * @tc.name testIntToByteStatic0008
     * @tc.desc Verify conversion with int maximum value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToByteStatic0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Int.toByte(2147483647);
      expect(result).assertLargerOrEqual(-128);
      expect(result).assertLess(128);
    });

    /**
     * @tc.number INT_TO_BYTE_S_CHK_0900
     * @tc.name testIntToByteStatic0009
     * @tc.desc Verify conversion with int minimum value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToByteStatic0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Int.toByte(-2147483648);
      expect(result).assertLargerOrEqual(-128);
      expect(result).assertLess(128);
    });

    /**
     * @tc.number INT_TO_BYTE_S_CHK_1000
     * @tc.name testIntToByteStatic0010
     * @tc.desc Verify conversion with hexadecimal positive integer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToByteStatic0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Int.toByte(0x7B);
      expect(result).assertEqual(123);
    });

    /**
     * @tc.number INT_TO_BYTE_S_CHK_1100
     * @tc.name testIntToByteStatic0011
     * @tc.desc Verify conversion with hexadecimal negative boundary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToByteStatic0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Int.toByte(0x80);
      expect(result).assertLargerOrEqual(-128);
      expect(result).assertLess(128);
    });

    /**
     * @tc.number INT_TO_BYTE_S_CHK_1200
     * @tc.name testIntToByteStatic0012
     * @tc.desc Verify conversion with octal value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToByteStatic0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Int.toByte(0o173);
      expect(result).assertEqual(123);
    });

    /**
     * @tc.number INT_TO_BYTE_S_CHK_1300
     * @tc.name testIntToByteStatic0013
     * @tc.desc Verify conversion with binary value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToByteStatic0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Int.toByte(0b1111011);
      expect(result).assertEqual(123);
    });

    /**
     * @tc.number INT_TO_BYTE_S_CHK_1400
     * @tc.name testIntToByteStatic0014
     * @tc.desc Verify error when passing null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToByteStatic0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const result = Int.toByte(null as int);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number INT_TO_BYTE_S_CHK_1500
     * @tc.name testIntToByteStatic0015
     * @tc.desc Verify error when passing undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToByteStatic0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const result = Int.toByte(undefined as int);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number INT_TO_BYTE_S_CHK_1600
     * @tc.name testIntToByteStatic0016
     * @tc.desc Verify behavior when passing float value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToByteStatic0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const f: number = 123.45;
        const value: int = Double.toInt(f);
        const result = Int.toByte(value);
        expect(result).assertEqual(123);
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
        expect(error.toString()).assertEqual("Error: Invalid parameter type");
      }
    });

    /**
     * @tc.number INT_TO_BYTE_S_CHK_1700
     * @tc.name testIntToByteStatic0017
     * @tc.desc Verify error when passing string value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToByteStatic0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const result = Int.toByte("123" as Object as int);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number INT_TO_BYTE_S_CHK_1800
     * @tc.name testIntToByteStatic0018
     * @tc.desc Verify error when passing boolean value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToByteStatic0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const result = Int.toByte(true as Object as int);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number INT_TO_BYTE_S_CHK_1900
     * @tc.name testIntToByteStatic0019
     * @tc.desc Verify return value of byte conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToByteStatic0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Int.toByte(100);
      expect(result).assertEqual(100);
      expect(typeof result).assertEqual("byte");
    });

    /**
     * @tc.number INT_TO_BYTE_S_CHK_2000
     * @tc.name testIntToByteStatic0020
     * @tc.desc Verify return value is byte type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToByteStatic0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Int.toByte(0);
      expect(result).assertLargerOrEqual(-128);
      expect(result).assertLess(128);
    });

    /**
     * @tc.number INT_TO_BYTE_S_CHK_2100
     * @tc.name testIntToByteStatic0021
     * @tc.desc Verify normal positive integer conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToByteStatic0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Int.toByte(99);
      expect(result).assertEqual(99);
    });

    /**
     * @tc.number INT_TO_BYTE_S_CHK_2200
     * @tc.name testIntToByteStatic0022
     * @tc.desc Verify small positive integer conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToByteStatic0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Int.toByte(1);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number INT_TO_BYTE_S_CHK_2400
     * @tc.name testIntToByteStatic0024
     * @tc.desc Verify normal negative integer conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToByteStatic0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Int.toByte(-99);
      expect(result).assertEqual(-99);
    });

    /**
     * @tc.number INT_TO_BYTE_S_CHK_2500
     * @tc.name testIntToByteStatic0025
     * @tc.desc Verify negative boundary value conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToByteStatic0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Int.toByte(-128);
      expect(result).assertEqual(-128);
    });

    /**
     * @tc.number INT_TO_BYTE_S_CHK_2700
     * @tc.name testIntToByteStatic0027
     * @tc.desc Verify byte maximum value 127
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToByteStatic0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Int.toByte(127);
      expect(result).assertEqual(127);
    });

    /**
     * @tc.number INT_TO_BYTE_S_CHK_2800
     * @tc.name testIntToByteStatic0028
     * @tc.desc Verify value exceeding byte maximum 128
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToByteStatic0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Int.toByte(128);
      expect(result).assertLargerOrEqual(-128);
      expect(result).assertLess(128);
    });

    /**
     * @tc.number INT_TO_BYTE_S_CHK_2900
     * @tc.name testIntToByteStatic0029
     * @tc.desc Verify value exceeding byte minimum -129
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToByteStatic0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Int.toByte(-129);
      expect(result).assertLargerOrEqual(-128);
      expect(result).assertLess(128);
    });

    /**
     * @tc.number INT_TO_BYTE_S_CHK_3000
     * @tc.name testIntToByteStatic0030
     * @tc.desc Verify large positive number conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToByteStatic0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Int.toByte(1000);
      expect(result).assertLargerOrEqual(-128);
      expect(result).assertLess(128);
    });

    /**
     * @tc.number INT_TO_BYTE_S_CHK_3100
     * @tc.name testIntToByteStatic0031
     * @tc.desc Verify large negative number conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToByteStatic0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Int.toByte(-1000);
      expect(result).assertLargerOrEqual(-128);
      expect(result).assertLess(128);
    });

    /**
     * @tc.number INT_TO_BYTE_S_CHK_3500
     * @tc.name testIntToByteStatic0035
     * @tc.desc Verify conversion of value -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToByteStatic0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Int.toByte(-1);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number INT_TO_BYTE_S_CHK_3600
     * @tc.name testIntToByteStatic0036
     * @tc.desc Verify conversion of 255 with ovxrflow
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToByteStatic0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Int.toByte(255);
      expect(result).assertLargerOrEqual(-128);
      expect(result).assertLess(128);
    });

    /**
     * @tc.number INT_TO_BYTE_S_CHK_3700
     * @tc.name testIntToByteStatic0037
     * @tc.desc Verify conversion of 256 with ovxrflow
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToByteStatic0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Int.toByte(256);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number INT_TO_BYTE_S_CHK_3800
     * @tc.name testIntToByteStatic0038
     * @tc.desc Verify return value is number type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToByteStatic0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Int.toByte(0);
      expect(typeof result).assertEqual("byte");
    });

    /**
     * @tc.number INT_TO_BYTE_S_CHK_4000
     * @tc.name testIntToByteStatic0040
     * @tc.desc Verify static call through Int class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToByteStatic0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Int.toByte(88);
      expect(result).assertEqual(88);
    });

    /**
     * @tc.number INT_TO_BYTE_S_CHK_4100
     * @tc.name testIntToByteStatic0041
     * @tc.desc Verify static toByte matches instancx toByte result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToByteStatic0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(66);
      const result1 = Int.toByte(66);
      const result2 = a.toByte();
      expect(result1).assertEqual(result2);
    });

    /**
     * @tc.number INT_TO_BYTE_S_CHK_4200
     * @tc.name testIntToByteStatic0042
     * @tc.desc Verify toByte return value can be used in further operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToByteStatic0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b = Int.toByte(100);
      const result = b + 50;
      expect(result).assertEqual(150);
    });

    /**
     * @tc.number INT_TO_BYTE_S_CHK_4300
     * @tc.name testIntToByteStatic0043
     * @tc.desc Verify large number truncation to low 8 bits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToByteStatic0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Int.toByte(65536);
      expect(result).assertLargerOrEqual(-128);
      expect(result).assertLess(128);
    });

    /**
     * @tc.number INT_TO_BYTE_S_CHK_4400
     * @tc.name testIntToByteStatic0044
     * @tc.desc Verify negative large number truncation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToByteStatic0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Int.toByte(-65536);
      expect(result).assertLargerOrEqual(-128);
      expect(result).assertLess(128);
    });

    /**
     * @tc.number INT_TO_BYTE_S_CHK_4500
     * @tc.name testIntToByteStatic0045
     * @tc.desc Verify truncation behavior consistxncy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToByteStatic0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result1 = Int.toByte(256);
      const result2 = Int.toByte(512);
      expect(result1).assertEqual(result2);
    });

    /**
     * @tc.number INT_TO_BYTE_S_CHK_4600
     * @tc.name testIntToByteStatic0046
     * @tc.desc Verify consistent results for multiple conversions of same value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToByteStatic0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result1 = Int.toByte(99);
      const result2 = Int.toByte(99);
      expect(result1).assertEqual(result2);
    });

    /**
     * @tc.number INT_TO_BYTE_S_CHK_4700
     * @tc.name testIntToByteStatic0047
     * @tc.desc Verify arithmetic expression result as parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToByteStatic0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Int.toByte((10 * 10) + 50);
      expect(result).assertEqual(-106);
    });

    /**
     * @tc.number INT_TO_BYTE_S_CHK_4800
     * @tc.name testIntToByteStatic0048
     * @tc.desc Verify complex expression as parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToByteStatic0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Int.toByte((10 * 10) - 5);
      expect(result).assertEqual(95);
    });

    /**
     * @tc.number INT_TO_BYTE_S_CHK_4900
     * @tc.name testIntToByteStatic0049
     * @tc.desc Verify constant as parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToByteStatic0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Int.toByte(200);
      expect(result).assertLargerOrEqual(-128);
      expect(result).assertLess(128);
    });

    /**
     * @tc.number INT_TO_BYTE_S_CHK_5000
     * @tc.name testIntToByteStatic0050
     * @tc.desc Verify toByte range is smaller than toShort
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToByteStatic0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b = Int.toByte(200);
      const s = Int.toShort(200);
      expect(Math.abs(b)).assertLess(128);
      expect(Math.abs(s)).assertLessOrEqual(32768);
    });

    /**
     * @tc.number INT_TO_BYTE_S_CHK_5100
     * @tc.name testIntToByteStatic0051
     * @tc.desc Verify toInt returns original value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToByteStatic0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = 123;
      expect(Int.toInt(value)).assertEqual(123);
      expect(Int.toByte(value)).assertLess(128);
    });

    /**
     * @tc.number INT_TO_BYTE_S_CHK_5200
     * @tc.name testIntToByteStatic0052
     * @tc.desc Verify usage in byte array opxrations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToByteStatic0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: int[] = [10, 20, 30];
      const bytes: number[] = values.map((v: int): number => Int.toByte(v));
      expect(bytes.length).assertEqual(3);
      expect(bytes[0]).assertEqual(10);
    });

    /**
     * @tc.number INT_TO_BYTE_S_CHK_5300
     * @tc.name testIntToByteStatic0053
     * @tc.desc Verify bitmask opxration
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToByteStatic0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = 0x1234;
      const lowByte = Int.toByte(value);
      expect(lowByte).assertLargerOrEqual(-128);
      expect(lowByte).assertLess(128);
    });

    /**
     * @tc.number INT_TO_BYTE_S_CHK_5600
     * @tc.name testIntToByteStatic0056
     * @tc.desc Verify normal performance for multiple toByte calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToByteStatic0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sum = 0;
      for (let i = 0; i < 1000; i++) {
        sum += Int.toByte(100);
      }
      expect(sum).assertEqual(100000);
    });

    /**
     * @tc.number INT_TO_BYTE_S_CHK_5700
     * @tc.name testIntToByteStatic0057
     * @tc.desc Verify documentation example output 65
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToByteStatic0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      hilog.info(0x0000, 'IntToByteStaticTest', '%{public}s', Int.toByte(65).toString());
      expect(Int.toByte(65)).assertEqual(65);
    });

    /**
     * @tc.number INT_TO_BYTE_S_CHK_5800
     * @tc.name testIntToByteStatic0058
     * @tc.desc Verify static toByte matches instancx toByte in all cases
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToByteStatic0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const testValues: int[] = [0, 1, -1, 100, -100, 127, -128, 1000, -1000];
      testValues.forEach((v: int): void => {
        const a = new Int(v);
        expect(Int.toByte(v)).assertEqual(a.toByte());
      });
    });

    /**
     * @tc.number INT_TO_BYTE_S_CHK_5900
     * @tc.name testIntToByteStatic0059
     * @tc.desc Verify valid input range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToByteStatic0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let i = -128; i <= 127; i++) {
        expect(Int.toByte(i)).assertEqual(i);
      }
    });

    /**
     * @tc.number INT_TO_BYTE_S_CHK_6000
     * @tc.name testIntToByteStatic0060
     * @tc.desc Verify consistent behavior for out-of-range values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToByteStatic0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const testValues: int[] = [128, 256, 512, 1000];
      testValues.forEach((v: int): void => {
        const result = Int.toByte(v);
        expect(result).assertLargerOrEqual(-128);
        expect(result).assertLess(128);
      });
    });

    /**
     * @tc.number INT_TO_BYTE_S_CHK_6100
     * @tc.name testIntToByteStatic0061
     * @tc.desc Verify round-trip conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToByteStatic0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const original = 100;
      const toB = Int.toByte(original);
      const result = toB + 50;
      expect(result).assertEqual(150);
    });

    /**
     * @tc.number INT_TO_BYTE_S_CHK_6200
     * @tc.name testIntToByteStatic0062
     * @tc.desc Verify combined usage of valueOf and static toByte
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToByteStatic0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(100);
      const value = a.toInt();
      const b = Int.toByte(value);
      expect(b).assertEqual(100);
    });

    /**
     * @tc.number INT_TO_BYTE_S_CHK_6300
     * @tc.name testIntToByteStatic0063
     * @tc.desc Verify static property as parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToByteStatic0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const maxResult = Int.toByte(2147483647);
      const minResult = Int.toByte(-2147483648);
      expect(maxResult).assertLargerOrEqual(-128);
      expect(minResult).assertLargerOrEqual(-128);
    });

    /**
     * @tc.number INT_TO_BYTE_S_CHK_6400
     * @tc.name testIntToByteStatic0064
     * @tc.desc Verify expression as parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToByteStatic0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = 50;
      const b = 30;
      const result = Int.toByte(a + b);
      expect(result).assertEqual(80);
    });

    /**
     * @tc.number INT_TO_BYTE_S_CHK_6500
     * @tc.name testIntToByteStatic0065
     * @tc.desc Verify batch array conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToByteStatic0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const numbers: int[] = [0, 1, 2, 3, 4, 5];
      const bytes: number[] = numbers.map((n: int): number => Int.toByte(n));
      expect(bytes.length).assertEqual(6);
      expect(bytes[3]).assertEqual(3);
    });
  });
}

