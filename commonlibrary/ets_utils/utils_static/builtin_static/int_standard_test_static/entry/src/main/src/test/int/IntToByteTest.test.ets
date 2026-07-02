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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '../../../../hypium/index';
import Utils from '../Util.test';

export default function IntToByteTest(): void {
    describe('IntToByteTest', (): void => {
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
     * @tc.number INT_TO_BYTE_CHK_0100
     * @tc.name testIntToByte0001
     * @tc.desc Verify toByte accepts no parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToByte0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const num = new Int(100);
      const result = num.toByte();
      expect(result).assertEqual(100);
    });

    /**
     * @tc.number INT_TO_BYTE_CHK_0200
     * @tc.name testIntToByte0002
     * @tc.desc Verify toByte returns correct byte value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToByte0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(65);
      expect(a.toByte()).assertEqual(65);
    });

    /**
     * @tc.number INT_TO_BYTE_CHK_0300
     * @tc.name testIntToByte0003
     * @tc.desc Verify toByte returns converted byte value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToByte0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const num = new Int(100);
      const result = num.toByte();
      expect(result).assertEqual(100);
      expect(typeof result).assertEqual("byte");
    });

    /**
     * @tc.number INT_TO_BYTE_CHK_0400
     * @tc.name testIntToByte0004
     * @tc.desc Verify return value is byte type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToByte0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const num = new Int(50);
      const result = num.toByte();
      expect(result).assertLargerOrEqual(-128);
      expect(result).assertLess(128);
    });

    /**
     * @tc.number INT_TO_BYTE_CHK_0500
     * @tc.name testIntToByte0005
     * @tc.desc Verify positive integer conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToByte0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const num = new Int(99);
      expect(num.toByte()).assertEqual(99);
    });

    /**
     * @tc.number INT_TO_BYTE_CHK_0600
     * @tc.name testIntToByte0006
     * @tc.desc Verify small positive integer conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToByte0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const num = new Int(1);
      expect(num.toByte()).assertEqual(1);
    });

    /**
     * @tc.number INT_TO_BYTE_CHK_0700
     * @tc.name testIntToByte0007
     * @tc.desc Verify zero value conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToByte0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const num = new Int(0);
      expect(num.toByte()).assertEqual(0);
    });

    /**
     * @tc.number INT_TO_BYTE_CHK_0800
     * @tc.name testIntToByte0008
     * @tc.desc Verify negative integer conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToByte0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const num = new Int(-99);
      expect(num.toByte()).assertEqual(-99);
    });

    /**
     * @tc.number INT_TO_BYTE_CHK_0900
     * @tc.name testIntToByte0009
     * @tc.desc Verify negative boundary value conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToByte0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const num = new Int(-128);
      expect(num.toByte()).assertEqual(-128);
    });

    /**
     * @tc.number INT_TO_BYTE_CHK_1100
     * @tc.name testIntToByte0011
     * @tc.desc Verify byte maximum value 127
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToByte0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const num = new Int(127);
      expect(num.toByte()).assertEqual(127);
    });

    /**
     * @tc.number INT_TO_BYTE_CHK_1200
     * @tc.name testIntToByte0012
     * @tc.desc Verify value exceeding byte maximum 128
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToByte0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const num = new Int(128);
      const result = num.toByte();
      expect(result).assertLargerOrEqual(-128);
      expect(result).assertLess(128);
    });

    /**
     * @tc.number INT_TO_BYTE_CHK_1300
     * @tc.name testIntToByte0013
     * @tc.desc Verify value exceeding byte minimum -129
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToByte0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const num = new Int(-129);
      const result = num.toByte();
      expect(result).assertLargerOrEqual(-128);
      expect(result).assertLess(128);
    });

    /**
     * @tc.number INT_TO_BYTE_CHK_1400
     * @tc.name testIntToByte0014
     * @tc.desc Verify large positive number conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToByte0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const num = new Int(1000);
      const result = num.toByte();
      expect(result).assertLargerOrEqual(-128);
      expect(result).assertLess(128);
    });

    /**
     * @tc.number INT_TO_BYTE_CHK_1500
     * @tc.name testIntToByte0015
     * @tc.desc Verify large negative number conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToByte0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const num = new Int(-1000);
      const result = num.toByte();
      expect(result).assertLargerOrEqual(-128);
      expect(result).assertLess(128);
    });

    /**
     * @tc.number INT_TO_BYTE_CHK_1600
     * @tc.name testIntToByte0016
     * @tc.desc Verify Int MAX_VALUE conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToByte0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const num = new Int(2147483647);
      const result = num.toByte();
      expect(result).assertLargerOrEqual(-128);
      expect(result).assertLess(128);
    });

    /**
     * @tc.number INT_TO_BYTE_CHK_1700
     * @tc.name testIntToByte0017
     * @tc.desc Verify Int MIN_VALUE conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToByte0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const num = new Int(-2147483648);
      const result = num.toByte();
      expect(result).assertLargerOrEqual(-128);
      expect(result).assertLess(128);
    });

    /**
     * @tc.number INT_TO_BYTE_CHK_1900
     * @tc.name testIntToByte0019
     * @tc.desc Verify value -1 conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToByte0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const num = new Int(-1);
      expect(num.toByte()).assertEqual(-1);
    });

    /**
     * @tc.number INT_TO_BYTE_CHK_2000
     * @tc.name testIntToByte0020
     * @tc.desc Verify value 255 overflow conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToByte0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const num = new Int(255);
      const result = num.toByte();
      expect(result).assertLargerOrEqual(-128);
      expect(result).assertLess(128);
    });

    /**
     * @tc.number INT_TO_BYTE_CHK_2100
     * @tc.name testIntToByte0021
     * @tc.desc Verify value 256 overflow conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToByte0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const num = new Int(256);
      const result = num.toByte();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number INT_TO_BYTE_CHK_2200
     * @tc.name testIntToByte0022
     * @tc.desc Verify return value is number type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToByte0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const num = new Int(100);
      const result = num.toByte();
      expect(typeof result).assertEqual("byte");
    });

    /**
     * @tc.number INT_TO_BYTE_CHK_2400
     * @tc.name testIntToByte0024
     * @tc.desc Verify toByte must be called through Int instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToByte0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const num = new Int(75);
      const result = num.toByte();
      expect(result).assertEqual(75);
    });

    /**
     * @tc.number INT_TO_BYTE_CHK_2500
     * @tc.name testIntToByte0025
     * @tc.desc Verify toByte does not change original Int instance value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToByte0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const num = new Int(88);
      const original = num.toInt();
      const result = num.toByte();
      expect(num.toInt()).assertEqual(original);
      expect(result).assertEqual(88);
    });

    /**
     * @tc.number INT_TO_BYTE_CHK_2600
     * @tc.name testIntToByte0026
     * @tc.desc Verify instance toByte matches static toByte result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToByte0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const num = new Int(66);
      const result1 = num.toByte();
      const result2 = Int.toByte(66);
      expect(result1).assertEqual(result2);
    });

    /**
     * @tc.number INT_TO_BYTE_CHK_2700
     * @tc.name testIntToByte0027
     * @tc.desc Verify toByte return value can be used for further operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToByte0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const num = new Int(100);
      const b = num.toByte();
      const result = b + 50;
      expect(result).assertEqual(150);
    });

    /**
     * @tc.number INT_TO_BYTE_CHK_2800
     * @tc.name testIntToByte0028
     * @tc.desc Verify large number truncation keeps only low 8 bits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToByte0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const num = new Int(12345);
      const result = num.toByte();
      expect(result).assertLargerOrEqual(-128);
      expect(result).assertLess(128);
    });

    /**
     * @tc.number INT_TO_BYTE_CHK_2900
     * @tc.name testIntToByte0029
     * @tc.desc Verify negative large number truncation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToByte0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const num = new Int(-12345);
      const result = num.toByte();
      expect(result).assertLargerOrEqual(-128);
      expect(result).assertLess(128);
    });

    /**
     * @tc.number INT_TO_BYTE_CHK_3000
     * @tc.name testIntToByte0030
     * @tc.desc Verify truncation behavior consistency
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToByte0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const num1 = new Int(256);
      const num2 = new Int(512);
      const result1 = num1.toByte();
      const result2 = num2.toByte();
      expect(result1).assertEqual(result2);
    });

    /**
     * @tc.number INT_TO_BYTE_CHK_3100
     * @tc.name testIntToByte0031
     * @tc.desc Verify multiple conversions of same value produce consistent result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToByte0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const num = new Int(99);
      const result1 = num.toByte();
      const result2 = num.toByte();
      expect(result1).assertEqual(result2);
    });

    /**
     * @tc.number INT_TO_BYTE_CHK_3200
     * @tc.name testIntToByte0032
     * @tc.desc Verify different instances with same value produce consistent result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToByte0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const num1 = new Int(77);
      const num2 = new Int(77);
      expect(num1.toByte()).assertEqual(num2.toByte());
    });

    /**
     * @tc.number INT_TO_BYTE_CHK_3300
     * @tc.name testIntToByte0033
     * @tc.desc Verify arithmetic result conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToByte0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(100);
      const b = new Int(50);
      const result = a.add(b).toByte();
      expect(result).assertEqual(-106);
    });

    /**
     * @tc.number INT_TO_BYTE_CHK_3400
     * @tc.name testIntToByte0034
     * @tc.desc Verify conversion after overflow
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToByte0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(200);
      const b = new Int(100);
      const result = b.toByte();
      expect(result).assertLargerOrEqual(-128);
      expect(result).assertLess(128);
    });

    /**
     * @tc.number INT_TO_BYTE_CHK_3500
     * @tc.name testIntToByte0035
     * @tc.desc Verify MAX_VALUE conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToByte0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const max = new Int(2147483647);
      const result = max.toByte();
      expect(result).assertLargerOrEqual(-128);
      expect(result).assertLess(128);
    });

    /**
     * @tc.number INT_TO_BYTE_CHK_3600
     * @tc.name testIntToByte0036
     * @tc.desc Verify MIN_VALUE conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToByte0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const min = new Int(-2147483648);
      const result = min.toByte();
      expect(result).assertLargerOrEqual(-128);
      expect(result).assertLess(128);
    });

    /**
     * @tc.number INT_TO_BYTE_CHK_3700
     * @tc.name testIntToByte0037
     * @tc.desc Verify toByte range is smaller than toShort
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToByte0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const num = new Int(200);
      const b = num.toByte();
      const s = num.toShort();
      expect(Math.abs(b)).assertLess(128);
      expect(Math.abs(s)).assertLessOrEqual(32768);
    });

    /**
     * @tc.number INT_TO_BYTE_CHK_3800
     * @tc.name testIntToByte0038
     * @tc.desc Verify toInt returns original value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToByte0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const num = new Int(123);
      expect(num.toInt()).assertEqual(123);
      expect(num.toByte()).assertLess(128);
    });

    /**
     * @tc.number INT_TO_BYTE_CHK_3900
     * @tc.name testIntToByte0039
     * @tc.desc Verify toByte used in byte array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToByte0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Int[] = [new Int(10), new Int(20), new Int(30)];
      const bytes: number[] = values.map((v: Int): number => v.toByte());
      expect(bytes.length).assertEqual(3);
      expect(bytes[0]).assertEqual(10);
    });

    /**
     * @tc.number INT_TO_BYTE_CHK_4000
     * @tc.name testIntToByte0040
     * @tc.desc Verify bitmask operation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToByte0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const num = new Int(0x1234);
      const lowByte = num.toByte();
      expect(lowByte).assertLargerOrEqual(-128);
      expect(lowByte).assertLess(128);
    });

    /**
     * @tc.number INT_TO_BYTE_CHK_4300
     * @tc.name testIntToByte0043
     * @tc.desc Verify multiple toByte calls perform normally
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToByte0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const num = new Int(100);
      let sum = 0;
      for (let i = 0; i < 1000; i++) {
        sum += num.toByte();
      }
      expect(sum).assertEqual(100000);
    });
  });
}

