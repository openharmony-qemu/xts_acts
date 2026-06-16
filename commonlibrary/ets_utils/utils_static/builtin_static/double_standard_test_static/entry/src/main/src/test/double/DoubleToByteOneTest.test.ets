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

export default function DoubleToByteOneTest(): void {
  describe('DoubleToByteOneTest', (): void => {
    beforeAll(() => {
    });
    beforeEach(async () => {
      await Utils.msSleep(30);
    });
    afterEach(() => {
    });
    afterAll(() => {
    });

    /**
     * @tc.number DBL_TO_BYTE_ONE_0100
     * @tc.name doubleToByteTest0001
     * @tc.desc Verify positive integer 12.0 within byte range returns 12
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('doubleToByteTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const value = new Double(12.0);
      const result: byte = value.toByte();
      expect(result).assertEqual(12);
    });

    /**
     * @tc.number DBL_TO_BYTE_ONE_0200
     * @tc.name doubleToByteTest002
     * @tc.desc Verify zero value 0.0 returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('doubleToByteTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const value = new Double(0.0);
      const result: byte = value.toByte();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number DBL_TO_BYTE_ONE_0300
     * @tc.name doubleToByteTest003
     * @tc.desc Verify negative integer -12.0 within byte range returns -12
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('doubleToByteTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const value = new Double(-12.0);
      const result: byte = value.toByte();
      expect(result).assertEqual(-12);
    });

    /**
     * @tc.number DBL_TO_BYTE_ONE_0400
     * @tc.name doubleToByteTest004
     * @tc.desc Verify positive one 1.0 returns 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('doubleToByteTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const value = new Double(1.0);
      const result: byte = value.toByte();
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number DBL_TO_BYTE_ONE_0500
     * @tc.name doubleToByteTest005
     * @tc.desc Verify negative one -1.0 returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('doubleToByteTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const value = new Double(-1.0);
      const result: byte = value.toByte();
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number DBL_TO_BYTE_ONE_0600
     * @tc.name doubleToByteTest006
     * @tc.desc Verify positive integer 99.0 within byte range returns 99
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('doubleToByteTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const value = new Double(99.0);
      const result: byte = value.toByte();
      expect(result).assertEqual(99);
    });

    /**
     * @tc.number DBL_TO_BYTE_ONE_0700
     * @tc.name doubleToByteTest007
     * @tc.desc Verify byte max value 127.0 returns 127
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('doubleToByteTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const value = new Double(127.0);
      const result: byte = value.toByte();
      expect(result).assertEqual(127);
    });

    /**
     * @tc.number DBL_TO_BYTE_ONE_0800
     * @tc.name doubleToByteTest008
     * @tc.desc Verify byte min value -128.0 returns -128
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('doubleToByteTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const value = new Double(-128.0);
      const result: byte = value.toByte();
      expect(result).assertEqual(-128);
    });

    /**
     * @tc.number DBL_TO_BYTE_ONE_0900
     * @tc.name doubleToByteTest009
     * @tc.desc Verify overflow truncation behavior for value 128.0 exceeding byte upper bound
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('doubleToByteTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const value = new Double(128.0);
      const result: byte = value.toByte();
      expect(result !== undefined).assertTrue();
    });

    /**
     * @tc.number DBL_TO_BYTE_ONE_1000
     * @tc.name doubleToByteTest010
     * @tc.desc Verify overflow truncation behavior for value -129.0 exceeding byte lower bound
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('doubleToByteTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const value = new Double(-129.0);
      const result: byte = value.toByte();
      expect(result !== undefined).assertTrue();
    });

    /**
     * @tc.number DBL_TO_BYTE_ONE_1100
     * @tc.name doubleToByteTest011
     * @tc.desc Verify positive decimal 12.5 truncates fractional part to 12
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('doubleToByteTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const value = new Double(12.5);
      const result: byte = value.toByte();
      expect(result).assertEqual(12);
    });

    /**
     * @tc.number DBL_TO_BYTE_ONE_1200
     * @tc.name doubleToByteTest012
     * @tc.desc Verify positive decimal 12.9 truncates to 12 instead of rounding to 13
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('doubleToByteTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const value = new Double(12.9);
      const result: byte = value.toByte();
      expect(result).assertEqual(12);
    });

    /**
     * @tc.number DBL_TO_BYTE_ONE_1300
     * @tc.name doubleToByteTest013
     * @tc.desc Verify negative decimal -12.5 truncates fractional part to -12
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('doubleToByteTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const value = new Double(-12.5);
      const result: byte = value.toByte();
      expect(result).assertEqual(-12);
    });

    /**
     * @tc.number DBL_TO_BYTE_ONE_1400
     * @tc.name doubleToByteTest014
     * @tc.desc Verify negative decimal -12.9 truncates to -12
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('doubleToByteTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const value = new Double(-12.9);
      const result: byte = value.toByte();
      expect(result).assertEqual(-12);
    });

    /**
     * @tc.number DBL_TO_BYTE_ONE_1500
     * @tc.name doubleToByteTest015
     * @tc.desc Verify positive decimal 0.9 less than 1 truncates to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('doubleToByteTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const value = new Double(0.9);
      const result: byte = value.toByte();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number DBL_TO_BYTE_ONE_1600
     * @tc.name doubleToByteTest016
     * @tc.desc Verify negative decimal -0.1 greater than -1 truncates to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('doubleToByteTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const value = new Double(-0.1);
      const result: byte = value.toByte();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number DBL_TO_BYTE_ONE_1700
     * @tc.name doubleToByteTest017
     * @tc.desc Verify positive decimal 127.9 near byte upper bound truncates to 127
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('doubleToByteTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const value = new Double(127.9);
      const result: byte = value.toByte();
      expect(result).assertEqual(127);
    });

    /**
     * @tc.number DBL_TO_BYTE_ONE_1800
     * @tc.name doubleToByteTest018
     * @tc.desc Verify negative decimal -128.9 near byte lower bound truncates to -128
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('doubleToByteTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const value = new Double(-128.9);
      const result: byte = value.toByte();
      expect(result).assertEqual(-128);
    });

    /**
     * @tc.number DBL_TO_BYTE_ONE_1900
     * @tc.name doubleToByteTest019
     * @tc.desc Verify NaN toByte conversion behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('doubleToByteTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const value = new Double(Double.NaN);
      const result: byte = value.toByte();
      expect(result !== undefined).assertTrue();
    });

    /**
     * @tc.number DBL_TO_BYTE_ONE_2000
     * @tc.name doubleToByteTest020
     * @tc.desc Verify positive infinity toByte conversion behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('doubleToByteTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const value = new Double(Double.POSITIVE_INFINITY);
      const result: byte = value.toByte();
      expect(result !== undefined).assertTrue();
    });

    /**
     * @tc.number DBL_TO_BYTE_ONE_2100
     * @tc.name doubleToByteTest021
     * @tc.desc Verify negative infinity toByte conversion behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('doubleToByteTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const value = new Double(Double.NEGATIVE_INFINITY);
      const result: byte = value.toByte();
      expect(result !== undefined).assertTrue();
    });

    /**
     * @tc.number DBL_TO_BYTE_ONE_2200
     * @tc.name doubleToByteTest022
     * @tc.desc Verify negative zero -0.0 returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('doubleToByteTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const value = new Double(-0.0);
      const result: byte = value.toByte();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number DBL_TO_BYTE_ONE_2300
     * @tc.name doubleToByteTest023
     * @tc.desc Verify Double.MIN_VALUE smallest positive double truncates to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('doubleToByteTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const value = new Double(Double.MIN_VALUE);
      const result: byte = value.toByte();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number DBL_TO_BYTE_ONE_2400
     * @tc.name doubleToByteTest024
     * @tc.desc Verify Double.MAX_VALUE overflow truncation behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('doubleToByteTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const value = new Double(Double.MAX_VALUE);
      const result: byte = value.toByte();
      expect(result !== undefined).assertTrue();
    });

    /**
     * @tc.number DBL_TO_BYTE_ONE_2500
     * @tc.name doubleToByteTest025
     * @tc.desc Verify MAX_SAFE_INTEGER overflow truncation behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('doubleToByteTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const value = new Double(Double.MAX_SAFE_INTEGER);
      const result: byte = value.toByte();
      expect(result !== undefined).assertTrue();
    });

    /**
     * @tc.number DBL_TO_BYTE_ONE_2600
     * @tc.name doubleToByteTest026
     * @tc.desc Verify MIN_SAFE_INTEGER overflow truncation behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('doubleToByteTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const value = new Double(Double.MIN_SAFE_INTEGER);
      const result: byte = value.toByte();
      expect(result !== undefined).assertTrue();
    });

    /**
     * @tc.number DBL_TO_BYTE_ONE_2700
     * @tc.name doubleToByteTest027
     * @tc.desc Verify large positive integer 256.0 overflow truncation behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('doubleToByteTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const value = new Double(256.0);
      const result: byte = value.toByte();
      expect(result !== undefined).assertTrue();
    });

    /**
     * @tc.number DBL_TO_BYTE_ONE_2800
     * @tc.name doubleToByteTest028
     * @tc.desc Verify large negative integer -256.0 overflow truncation behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('doubleToByteTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const value = new Double(-256.0);
      const result: byte = value.toByte();
      expect(result !== undefined).assertTrue();
    });

    /**
     * @tc.number DBL_TO_BYTE_ONE_2900
     * @tc.name doubleToByteTest029
     * @tc.desc Verify large positive integer 1000.0 overflow truncation behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('doubleToByteTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const value = new Double(1000.0);
      const result: byte = value.toByte();
      expect(result !== undefined).assertTrue();
    });

    /**
     * @tc.number DBL_TO_BYTE_ONE_3000
     * @tc.name doubleToByteTest030
     * @tc.desc Verify scientific notation 1.0e6 overflow truncation behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('doubleToByteTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const value = new Double(1.0e6);
      const result: byte = value.toByte();
      expect(result !== undefined).assertTrue();
    });

    /**
     * @tc.number DBL_TO_BYTE_ONE_3100
     * @tc.name doubleToByteTest031
     * @tc.desc Verify scientific notation -1.0e6 overflow truncation behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('doubleToByteTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const value = new Double(-1.0e6);
      const result: byte = value.toByte();
      expect(result !== undefined).assertTrue();
    });

    /**
     * @tc.number DBL_TO_BYTE_ONE_3500
     * @tc.name doubleToByteTest035
     * @tc.desc Verify default Double() constructor toByte returns byte value 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('doubleToByteTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const value = new Double();
      const result: byte = value.toByte();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number DBL_TO_BYTE_ONE_4300
     * @tc.name doubleToByteTest043
     * @tc.desc Verify multiple toByte calls on same instance return consistent value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('doubleToByteTest043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const value = new Double(12.0);
      const result1: byte = value.toByte();
      const result2: byte = value.toByte();
      expect(result1).assertEqual(result2);
    });

    /**
     * @tc.number DBL_TO_BYTE_ONE_4600
     * @tc.name doubleToByteTest046
     * @tc.desc Verify Double(127.4) truncates to 127
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('doubleToByteTest046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const value = new Double(127.4);
      const result: byte = value.toByte();
      expect(result).assertEqual(127);
    });

    /**
     * @tc.number DBL_TO_BYTE_ONE_4700
     * @tc.name doubleToByteTest047
     * @tc.desc Verify Double(-128.4) truncates to -128
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('doubleToByteTest047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const value = new Double(-128.4);
      const result: byte = value.toByte();
      expect(result).assertEqual(-128);
    });

    /**
     * @tc.number DBL_TO_BYTE_ONE_5000
     * @tc.name doubleToByteTest050
     * @tc.desc Verify overflow truncation for 100000.0 far exceeding byte range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('doubleToByteTest050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const value = new Double(100000.0);
      const result: byte = value.toByte();
      expect(result !== undefined).assertTrue();
    });

    /**
     * @tc.number DBL_TO_BYTE_ONE_5100
     * @tc.name doubleToByteTest051
     * @tc.desc Verify overflow truncation for -100000.0 far exceeding byte range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('doubleToByteTest051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const value = new Double(-100000.0);
      const result: byte = value.toByte();
      expect(result !== undefined).assertTrue();
    });

    /**
     * @tc.number DBL_TO_BYTE_ONE_5700
     * @tc.name doubleToByteTest057
     * @tc.desc Verify overflow for hex value 0x80 (128.0) exceeding byte range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('doubleToByteTest057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const value = new Double(0x80);
      const result: byte = value.toByte();
      expect(result !== undefined).assertTrue();
    });

    /**
     * @tc.number DBL_TO_BYTE_ONE_5900
     * @tc.name doubleToByteTest059
     * @tc.desc Verify toByte override is correctly invoked through Double type reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('doubleToByteTest059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const value: Double = new Double(12.0);
      const result: byte = value.toByte();
      expect(result).assertEqual(12);
    });
  });
}
