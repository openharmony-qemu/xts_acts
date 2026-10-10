
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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { Decimal } from '@kit.ArkTS';
import { BusinessError } from '@kit.BasicServicesKit';

function sleep(time: number): Promise<void> {
  return new Promise<void>((resolve) => setTimeout(resolve, time));
}

export default function decimalIsZeroTestTest() {
  describe('DecimalIsZeroTestTest', () => {
    beforeAll(() => {
    });

    beforeEach(async () => {
      await sleep(30);
    });

    afterEach(() => {
    });

    afterAll(() => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_IS_ZERO_SUPPLEMENT_TEST_0010
     * @tc.name testDecimalIsZeroTestTest001
     * @tc.desc Verify (assertEqual,assertTrue)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalIsZeroTestTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Decimal(0);
      expect(d.isZero()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_IS_ZERO_SUPPLEMENT_TEST_0020
     * @tc.name testDecimalIsZeroTestTest002
     * @tc.desc Verify (assertFalse)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalIsZeroTestTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Decimal(1);
      expect(d.isZero()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_IS_ZERO_SUPPLEMENT_TEST_0030
     * @tc.name testDecimalIsZeroTestTest003
     * @tc.desc Verify (assertTrue)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalIsZeroTestTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d: ESObject = new Decimal(0);
      expect(d.isZero(1)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_IS_ZERO_SUPPLEMENT_TEST_0040
     * @tc.name testDecimalIsZeroTestTest004
     * @tc.desc Verify with undefined (assertTrue,assertFalse)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalIsZeroTestTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d: ESObject = new Decimal(1);
      expect(d.isZero('x')).assertFalse();
      const e: ESObject = new Decimal(0);
      expect(e.isZero(undefined as ESObject)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_IS_ZERO_SUPPLEMENT_TEST_0050
     * @tc.name testDecimalIsZeroTestTest005
     * @tc.desc Verify (assertFalse)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalIsZeroTestTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Decimal(0.5);
      expect(d.isZero()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_IS_ZERO_SUPPLEMENT_TEST_0060
     * @tc.name testDecimalIsZeroTestTest006
     * @tc.desc Verify (assertFalse)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalIsZeroTestTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Decimal(-0.5);
      expect(d.isZero()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_IS_ZERO_SUPPLEMENT_TEST_0070
     * @tc.name testDecimalIsZeroTestTest007
     * @tc.desc Verify (assertFalse)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalIsZeroTestTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Decimal(-1);
      expect(d.isZero()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_IS_ZERO_SUPPLEMENT_TEST_0080
     * @tc.name testDecimalIsZeroTestTest008
     * @tc.desc Verify number 9007199254740991
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalIsZeroTestTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Decimal(Number.MAX_SAFE_INTEGER);
      expect(d.isZero()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_IS_ZERO_SUPPLEMENT_TEST_0090
     * @tc.name testDecimalIsZeroTestTest009
     * @tc.desc Verify number -9007199254740991
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalIsZeroTestTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Decimal(Number.MIN_SAFE_INTEGER);
      expect(d.isZero()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_IS_ZERO_SUPPLEMENT_TEST_0100
     * @tc.name testDecimalIsZeroTestTest010
     * @tc.desc Verify number Number.MAX_VALUE
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalIsZeroTestTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Decimal(Number.MAX_VALUE);
      expect(d.isZero()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_IS_ZERO_SUPPLEMENT_TEST_0110
     * @tc.name testDecimalIsZeroTestTest011
     * @tc.desc Verify number Number.MIN_VALUE
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalIsZeroTestTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Decimal(Number.MIN_VALUE);
      expect(d.isZero()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_IS_ZERO_SUPPLEMENT_TEST_0120
     * @tc.name testDecimalIsZeroTestTest012
     * @tc.desc Verify number Number.EPSILON
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalIsZeroTestTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Decimal(Number.EPSILON);
      expect(d.isZero()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_IS_ZERO_SUPPLEMENT_TEST_0130
     * @tc.name testDecimalIsZeroTestTest013
     * @tc.desc Verify (assertFalse)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalIsZeroTestTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Decimal(1e-7);
      expect(d.isZero()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_IS_ZERO_SUPPLEMENT_TEST_0140
     * @tc.name testDecimalIsZeroTestTest014
     * @tc.desc Verify (assertFalse)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalIsZeroTestTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Decimal(-1e-7);
      expect(d.isZero()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_IS_ZERO_SUPPLEMENT_TEST_0150
     * @tc.name testDecimalIsZeroTestTest015
     * @tc.desc Verify (assertFalse)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalIsZeroTestTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Decimal(1e-1000);
      expect(d.isZero()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_IS_ZERO_SUPPLEMENT_TEST_0160
     * @tc.name testDecimalIsZeroTestTest016
     * @tc.desc Verify (assertFalse)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalIsZeroTestTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Decimal(-1e-1000);
      expect(d.isZero()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_IS_ZERO_SUPPLEMENT_TEST_0170
     * @tc.name testDecimalIsZeroTestTest017
     * @tc.desc Verify (assertFalse)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalIsZeroTestTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Decimal(9e15);
      expect(d.isZero()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_IS_ZERO_SUPPLEMENT_TEST_0180
     * @tc.name testDecimalIsZeroTestTest018
     * @tc.desc Verify (assertFalse)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalIsZeroTestTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Decimal(-9e15);
      expect(d.isZero()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_IS_ZERO_SUPPLEMENT_TEST_0190
     * @tc.name testDecimalIsZeroTestTest019
     * @tc.desc Verify (assertFalse)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalIsZeroTestTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Decimal(1e9);
      expect(d.isZero()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_IS_ZERO_SUPPLEMENT_TEST_0200
     * @tc.name testDecimalIsZeroTestTest020
     * @tc.desc Verify number NaN isZero false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalIsZeroTestTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Decimal(NaN);
      expect(d.isZero()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_IS_ZERO_SUPPLEMENT_TEST_0210
     * @tc.name testDecimalIsZeroTestTest021
     * @tc.desc Verify number +Infinity isZero false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalIsZeroTestTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Decimal(Infinity);
      expect(d.isZero()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_IS_ZERO_SUPPLEMENT_TEST_0220
     * @tc.name testDecimalIsZeroTestTest022
     * @tc.desc Verify number -Infinity isZero false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalIsZeroTestTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Decimal(-Infinity);
      expect(d.isZero()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_IS_ZERO_SUPPLEMENT_TEST_0230
     * @tc.name testDecimalIsZeroTestTest023
     * @tc.desc Verify (assertFalse)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalIsZeroTestTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Decimal('1');
      expect(d.isZero()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_IS_ZERO_SUPPLEMENT_TEST_0240
     * @tc.name testDecimalIsZeroTestTest024
     * @tc.desc Verify (assertFalse)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalIsZeroTestTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Decimal('-1');
      expect(d.isZero()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_IS_ZERO_SUPPLEMENT_TEST_0250
     * @tc.name testDecimalIsZeroTestTest025
     * @tc.desc Verify (assertFalse)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalIsZeroTestTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Decimal('0.5');
      expect(d.isZero()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_IS_ZERO_SUPPLEMENT_TEST_0260
     * @tc.name testDecimalIsZeroTestTest026
     * @tc.desc Verify (assertFalse)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalIsZeroTestTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Decimal('-0.5');
      expect(d.isZero()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_IS_ZERO_SUPPLEMENT_TEST_0270
     * @tc.name testDecimalIsZeroTestTest027
     * @tc.desc Verify (assertFalse)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalIsZeroTestTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Decimal('123.45');
      expect(d.isZero()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_IS_ZERO_SUPPLEMENT_TEST_0280
     * @tc.name testDecimalIsZeroTestTest028
     * @tc.desc Verify (assertFalse)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalIsZeroTestTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Decimal('1e-7');
      expect(d.isZero()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_IS_ZERO_SUPPLEMENT_TEST_0290
     * @tc.name testDecimalIsZeroTestTest029
     * @tc.desc Verify (assertFalse)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalIsZeroTestTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Decimal('1e-1000');
      expect(d.isZero()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_IS_ZERO_SUPPLEMENT_TEST_0300
     * @tc.name testDecimalIsZeroTestTest030
     * @tc.desc Verify (assertFalse)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalIsZeroTestTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Decimal('9007199254740991');
      expect(d.isZero()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_IS_ZERO_SUPPLEMENT_TEST_0310
     * @tc.name testDecimalIsZeroTestTest031
     * @tc.desc Verify (assertFalse)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalIsZeroTestTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Decimal('-9007199254740991');
      expect(d.isZero()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_IS_ZERO_SUPPLEMENT_TEST_0320
     * @tc.name testDecimalIsZeroTestTest032
     * @tc.desc Verify (assertFalse)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalIsZeroTestTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Decimal('123456789012345678901234567890');
      expect(d.isZero()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_IS_ZERO_SUPPLEMENT_TEST_0330
     * @tc.name testDecimalIsZeroTestTest033
     * @tc.desc Verify (assertFalse)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalIsZeroTestTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Decimal('-123456789012345678901234567890');
      expect(d.isZero()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_IS_ZERO_SUPPLEMENT_TEST_0340
     * @tc.name testDecimalIsZeroTestTest034
     * @tc.desc Verify (assertFalse)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalIsZeroTestTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Decimal('0.0000000000000000000000001');
      expect(d.isZero()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_IS_ZERO_SUPPLEMENT_TEST_0350
     * @tc.name testDecimalIsZeroTestTest035
     * @tc.desc Verify (assertFalse)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalIsZeroTestTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Decimal('0x10');
      expect(d.isZero()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_IS_ZERO_SUPPLEMENT_TEST_0360
     * @tc.name testDecimalIsZeroTestTest036
     * @tc.desc Verify (assertTrue)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalIsZeroTestTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Decimal('0x0');
      expect(d.isZero()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_IS_ZERO_SUPPLEMENT_TEST_0370
     * @tc.name testDecimalIsZeroTestTest037
     * @tc.desc Verify (assertFalse)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalIsZeroTestTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Decimal('0b1');
      expect(d.isZero()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_IS_ZERO_SUPPLEMENT_TEST_0380
     * @tc.name testDecimalIsZeroTestTest038
     * @tc.desc Verify (assertTrue)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalIsZeroTestTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Decimal('0b0');
      expect(d.isZero()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_IS_ZERO_SUPPLEMENT_TEST_0390
     * @tc.name testDecimalIsZeroTestTest039
     * @tc.desc Verify (assertFalse)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalIsZeroTestTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Decimal('0o10');
      expect(d.isZero()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_IS_ZERO_SUPPLEMENT_TEST_0400
     * @tc.name testDecimalIsZeroTestTest040
     * @tc.desc Verify (assertTrue)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalIsZeroTestTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Decimal('0o0');
      expect(d.isZero()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_IS_ZERO_SUPPLEMENT_TEST_0410
     * @tc.name testDecimalIsZeroTestTest041
     * @tc.desc Verify Decimal(0) Decimal
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalIsZeroTestTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Decimal(new Decimal(0));
      expect(d.isZero()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_IS_ZERO_SUPPLEMENT_TEST_0420
     * @tc.name testDecimalIsZeroTestTest042
     * @tc.desc Verify Decimal('-0') Decimal
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalIsZeroTestTest042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Decimal(new Decimal('-0'));
      expect(d.isZero()).assertTrue();
      expect(d.isNegative()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_IS_ZERO_SUPPLEMENT_TEST_0430
     * @tc.name testDecimalIsZeroTestTest043
     * @tc.desc Verify Decimal(1) Decimal
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalIsZeroTestTest043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Decimal(new Decimal(1));
      expect(d.isZero()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_IS_ZERO_SUPPLEMENT_TEST_0440
     * @tc.name testDecimalIsZeroTestTest044
     * @tc.desc Verify Decimal(NaN) Decimal
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalIsZeroTestTest044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Decimal(new Decimal(NaN));
      expect(d.isZero()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_IS_ZERO_SUPPLEMENT_TEST_0450
     * @tc.name testDecimalIsZeroTestTest045
     * @tc.desc Verify Decimal(-1) Decimal
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalIsZeroTestTest045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Decimal(new Decimal(-1));
      expect(d.isZero()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_IS_ZERO_SUPPLEMENT_TEST_0460
     * @tc.name testDecimalIsZeroTestTest046
     * @tc.desc Verify (assertTrue)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalIsZeroTestTest046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Decimal(-0);
      expect(d.isZero()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_IS_ZERO_SUPPLEMENT_TEST_0470
     * @tc.name testDecimalIsZeroTestTest047
     * @tc.desc Verify (assertTrue)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalIsZeroTestTest047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Decimal('-0');
      expect(d.isZero()).assertTrue();
      expect(d.isNegative()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_IS_ZERO_SUPPLEMENT_TEST_0480
     * @tc.name testDecimalIsZeroTestTest048
     * @tc.desc Verify (assertTrue)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalIsZeroTestTest048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Decimal('0e0');
      expect(d.isZero()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_IS_ZERO_SUPPLEMENT_TEST_0490
     * @tc.name testDecimalIsZeroTestTest049
     * @tc.desc Verify (assertTrue)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalIsZeroTestTest049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Decimal(5).mul(0);
      expect(d.isZero()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_IS_ZERO_SUPPLEMENT_TEST_0500
     * @tc.name testDecimalIsZeroTestTest050
     * @tc.desc Verify string|number '0' 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalIsZeroTestTest050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: string | number = '0';
      expect(new Decimal(v).isZero()).assertTrue();
      const w: string | number = 0;
      expect(new Decimal(w).isZero()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_IS_ZERO_SUPPLEMENT_TEST_0510
     * @tc.name testDecimalIsZeroTestTest051
     * @tc.desc Verify string|number '1' 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalIsZeroTestTest051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: string | number = '1';
      expect(new Decimal(v).isZero()).assertFalse();
      const w: string | number = 1;
      expect(new Decimal(w).isZero()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_IS_ZERO_SUPPLEMENT_TEST_0520
     * @tc.name testDecimalIsZeroTestTest052
     * @tc.desc Verify string|number|Decimal
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalIsZeroTestTest052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const toDec = (v: string | number | Decimal): Decimal => new Decimal(v);
      expect(toDec('0').isZero()).assertTrue();
      expect(toDec(0).isZero()).assertTrue();
      expect(toDec(new Decimal(0)).isZero()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_IS_ZERO_SUPPLEMENT_TEST_0530
     * @tc.name testDecimalIsZeroTestTest053
     * @tc.desc Verify string|number|Decimal
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalIsZeroTestTest053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const toDec = (v: string | number | Decimal): Decimal => new Decimal(v);
      expect(toDec('0.1').isZero()).assertFalse();
      expect(toDec(0.1).isZero()).assertFalse();
      expect(toDec(new Decimal('0.1')).isZero()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_IS_ZERO_SUPPLEMENT_TEST_0540
     * @tc.name testDecimalIsZeroTestTest054
     * @tc.desc Verify string|number|Decimal|object object 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalIsZeroTestTest054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const toDec = (v: string | number | Decimal | object): Decimal => new Decimal(v as ESObject);
      expect(toDec('0').isZero()).assertTrue();
      expect(toDec(0).isZero()).assertTrue();
      expect(toDec(new Decimal(0)).isZero()).assertTrue();
      try {
        toDec({} as ESObject);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_IS_ZERO_SUPPLEMENT_TEST_0550
     * @tc.name testDecimalIsZeroTestTest055
     * @tc.desc Verify (assertTrue)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalIsZeroTestTest055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const toDec = (v: Decimal | number): Decimal => new Decimal(v as ESObject);
      expect(toDec(new Decimal(0)).isZero()).assertTrue();
      expect(toDec(0).isZero()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_IS_ZERO_SUPPLEMENT_TEST_0560
     * @tc.name testDecimalIsZeroTestTest056
     * @tc.desc Verify null number null 401 number
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalIsZeroTestTest056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const toDec = (v: number | null): Decimal => new Decimal(v as ESObject);
      expect(toDec(0).isZero()).assertTrue();
      try {
        toDec(null);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_IS_ZERO_SUPPLEMENT_TEST_0570
     * @tc.name testDecimalIsZeroTestTest057
     * @tc.desc Verify undefined number undefined 401 number
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalIsZeroTestTest057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const toDec = (v: number | undefined): Decimal => new Decimal(v as ESObject);
      expect(toDec(0).isZero()).assertTrue();
      try {
        toDec(undefined);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_IS_ZERO_SUPPLEMENT_TEST_0580
     * @tc.name testDecimalIsZeroTestTest058
     * @tc.desc Verify null string null 401 string
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalIsZeroTestTest058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const toDec = (v: string | null): Decimal => new Decimal(v as ESObject);
      expect(toDec('0').isZero()).assertTrue();
      try {
        toDec(null);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_IS_ZERO_SUPPLEMENT_TEST_0590
     * @tc.name testDecimalIsZeroTestTest059
     * @tc.desc Verify undefined string undefined 401 string
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalIsZeroTestTest059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const toDec = (v: string | undefined): Decimal => new Decimal(v as ESObject);
      expect(toDec('0').isZero()).assertTrue();
      try {
        toDec(undefined);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_IS_ZERO_SUPPLEMENT_TEST_0600
     * @tc.name testDecimalIsZeroTestTest060
     * @tc.desc Verify with null
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalIsZeroTestTest060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const n: ESObject = null;
      try {
        new Decimal(n);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_IS_ZERO_SUPPLEMENT_TEST_0610
     * @tc.name testDecimalIsZeroTestTest061
     * @tc.desc Verify with undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalIsZeroTestTest061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const u: ESObject = undefined;
      try {
        new Decimal(u);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_IS_ZERO_SUPPLEMENT_TEST_0620
     * @tc.name testDecimalIsZeroTestTest062
     * @tc.desc Verify 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalIsZeroTestTest062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const o: ESObject = {};
      try {
        new Decimal(o);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_IS_ZERO_SUPPLEMENT_TEST_0630
     * @tc.name testDecimalIsZeroTestTest063
     * @tc.desc Verify null isZero TypeError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalIsZeroTestTest063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: ESObject = null;
      try {
        d.isZero();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_IS_ZERO_SUPPLEMENT_TEST_0640
     * @tc.name testDecimalIsZeroTestTest064
     * @tc.desc Verify undefined isZero TypeError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalIsZeroTestTest064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: ESObject = undefined;
      try {
        d.isZero();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_IS_ZERO_SUPPLEMENT_TEST_0650
     * @tc.name testDecimalIsZeroTestTest065
     * @tc.desc Verify true 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalIsZeroTestTest065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b: ESObject = true;
      try {
        new Decimal(b);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_IS_ZERO_SUPPLEMENT_TEST_0660
     * @tc.name testDecimalIsZeroTestTest066
     * @tc.desc Verify with Date
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalIsZeroTestTest066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Decimal(new Date() as ESObject);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_IS_ZERO_SUPPLEMENT_TEST_0670
     * @tc.name testDecimalIsZeroTestTest067
     * @tc.desc Verify RegExp 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalIsZeroTestTest067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
         new Decimal(/x/ as ESObject);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_IS_ZERO_SUPPLEMENT_TEST_0680
     * @tc.name testDecimalIsZeroTestTest068
     * @tc.desc Verify with Error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalIsZeroTestTest068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
         new Decimal(new Error('e') as ESObject);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_IS_ZERO_SUPPLEMENT_TEST_0690
     * @tc.name testDecimalIsZeroTestTest069
     * @tc.desc Verify Array 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalIsZeroTestTest069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
         new Decimal([1, 2] as ESObject);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_IS_ZERO_SUPPLEMENT_TEST_0700
     * @tc.name testDecimalIsZeroTestTest070
     * @tc.desc Verify Map 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalIsZeroTestTest070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
         new Decimal(new Map() as ESObject);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_IS_ZERO_SUPPLEMENT_TEST_0710
     * @tc.name testDecimalIsZeroTestTest071
     * @tc.desc Verify Set 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalIsZeroTestTest071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Decimal(new Set<string>() as ESObject);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_IS_ZERO_SUPPLEMENT_TEST_0720
     * @tc.name testDecimalIsZeroTestTest072
     * @tc.desc Verify object input 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalIsZeroTestTest072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let hit: boolean = false;
      try {
        let witness: Decimal = new Decimal({ v: 1 } as ESObject);
      } catch (e) {
        expect(e.name).assertEqual('BusinessError');
        expect((e as BusinessError).code).assertEqual(401);
        hit = true;
      }
      expect(hit).assertTrue();


    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_IS_ZERO_SUPPLEMENT_TEST_0730
     * @tc.name testDecimalIsZeroTestTest073
     * @tc.desc Verify TypedArray Int32Array 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalIsZeroTestTest073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Decimal(new Int32Array([0]) as ESObject);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_IS_ZERO_SUPPLEMENT_TEST_0740
     * @tc.name testDecimalIsZeroTestTest074
     * @tc.desc Verify 'abc' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalIsZeroTestTest074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Decimal('abc');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_IS_ZERO_SUPPLEMENT_TEST_0750
     * @tc.name testDecimalIsZeroTestTest075
     * @tc.desc Verify '' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalIsZeroTestTest075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Decimal('');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_IS_ZERO_SUPPLEMENT_TEST_0760
     * @tc.name testDecimalIsZeroTestTest076
     * @tc.desc Verify ' ' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalIsZeroTestTest076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Decimal('​');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_IS_ZERO_SUPPLEMENT_TEST_0770
     * @tc.name testDecimalIsZeroTestTest077
     * @tc.desc Verify '12.3.4' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalIsZeroTestTest077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Decimal('12.3.4');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_IS_ZERO_SUPPLEMENT_TEST_0780
     * @tc.name testDecimalIsZeroTestTest078
     * @tc.desc Verify '--0' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalIsZeroTestTest078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Decimal('--0');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_IS_ZERO_SUPPLEMENT_TEST_0790
     * @tc.name testDecimalIsZeroTestTest079
     * @tc.desc Verify '0x' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalIsZeroTestTest079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Decimal('0x');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_IS_ZERO_SUPPLEMENT_TEST_0800
     * @tc.name testDecimalIsZeroTestTest080
     * @tc.desc Verify (assertTrue)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalIsZeroTestTest080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Decimal(1).sub(1);
      expect(d.isZero()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_IS_ZERO_SUPPLEMENT_TEST_0810
     * @tc.name testDecimalIsZeroTestTest081
     * @tc.desc Verify (assertFalse)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalIsZeroTestTest081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Decimal('0.1').add('0.2');
      expect(d.isZero()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_IS_ZERO_SUPPLEMENT_TEST_0820
     * @tc.name testDecimalIsZeroTestTest082
     * @tc.desc Verify 2 0 Infinity false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalIsZeroTestTest082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Decimal(2).div(0);
      expect(d.isZero()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_IS_ZERO_SUPPLEMENT_TEST_0830
     * @tc.name testDecimalIsZeroTestTest083
     * @tc.desc Verify (assertTrue)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalIsZeroTestTest083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Decimal(0).div(2);
      expect(d.isZero()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_IS_ZERO_SUPPLEMENT_TEST_0840
     * @tc.name testDecimalIsZeroTestTest084
     * @tc.desc Verify (assertTrue)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalIsZeroTestTest084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Decimal(5).mod(5);
      expect(d.isZero()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_IS_ZERO_SUPPLEMENT_TEST_0850
     * @tc.name testDecimalIsZeroTestTest085
     * @tc.desc Verify (assertFalse)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalIsZeroTestTest085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Decimal(1).div(3);
      expect(d.isZero()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_IS_ZERO_SUPPLEMENT_TEST_0860
     * @tc.name testDecimalIsZeroTestTest086
     * @tc.desc Verify (1/3)*3 0.9999 false 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalIsZeroTestTest086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Decimal(1).div(3).mul(3);
      expect(d.isZero()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_IS_ZERO_SUPPLEMENT_TEST_0870
     * @tc.name testDecimalIsZeroTestTest087
     * @tc.desc Verify (assertTrue)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalIsZeroTestTest087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Decimal(0).sqrt();
      expect(d.isZero()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_IS_ZERO_SUPPLEMENT_TEST_0880
     * @tc.name testDecimalIsZeroTestTest088
     * @tc.desc Verify sqrt(-1) NaN false NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalIsZeroTestTest088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Decimal(-1).sqrt();
      expect(d.isZero()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_IS_ZERO_SUPPLEMENT_TEST_0890
     * @tc.name testDecimalIsZeroTestTest089
     * @tc.desc Verify (assertFalse)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalIsZeroTestTest089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Decimal(10).pow(0);
      expect(d.isZero()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_IS_ZERO_SUPPLEMENT_TEST_0900
     * @tc.name testDecimalIsZeroTestTest090
     * @tc.desc Verify (assertFalse)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalIsZeroTestTest090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Decimal(0).pow(0);
      expect(d.isZero()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_IS_ZERO_SUPPLEMENT_TEST_0910
     * @tc.name testDecimalIsZeroTestTest091
     * @tc.desc Verify (assertTrue)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalIsZeroTestTest091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Decimal(0).negate();
      expect(d.isZero()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_IS_ZERO_SUPPLEMENT_TEST_0920
     * @tc.name testDecimalIsZeroTestTest092
     * @tc.desc Verify (assertFalse)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalIsZeroTestTest092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Decimal(1).negate();
      expect(d.isZero()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_IS_ZERO_SUPPLEMENT_TEST_0930
     * @tc.name testDecimalIsZeroTestTest093
     * @tc.desc Verify (assertTrue)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalIsZeroTestTest093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Decimal(0.9).trunc();
      expect(d.isZero()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_IS_ZERO_SUPPLEMENT_TEST_0940
     * @tc.name testDecimalIsZeroTestTest094
     * @tc.desc Verify (assertTrue)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalIsZeroTestTest094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Decimal(0.5).floor();
      expect(d.isZero()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_IS_ZERO_SUPPLEMENT_TEST_0950
     * @tc.name testDecimalIsZeroTestTest095
     * @tc.desc Verify (assertFalse)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalIsZeroTestTest095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Decimal(0.5).ceil();
      expect(d.isZero()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_IS_ZERO_SUPPLEMENT_TEST_0960
     * @tc.name testDecimalIsZeroTestTest096
     * @tc.desc Verify (assertTrue)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalIsZeroTestTest096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Decimal(-0.5).trunc();
      expect(d.isZero()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_IS_ZERO_SUPPLEMENT_TEST_0970
     * @tc.name testDecimalIsZeroTestTest097
     * @tc.desc Verify (assertFalse)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalIsZeroTestTest097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Decimal(-5).abs();
      expect(d.isZero()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_IS_ZERO_SUPPLEMENT_TEST_0980
     * @tc.name testDecimalIsZeroTestTest098
     * @tc.desc Verify '0.1' '0.1' 0 true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalIsZeroTestTest098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Decimal('0.1').sub('0.1');
      expect(d.isZero()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_IS_ZERO_SUPPLEMENT_TEST_0990
     * @tc.name testDecimalIsZeroTestTest099
     * @tc.desc Verify '0.001' 10 0.0001 false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalIsZeroTestTest099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Decimal('0.001').div(10);
      expect(d.isZero()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_IS_ZERO_SUPPLEMENT_TEST_1000
     * @tc.name testDecimalIsZeroTestTest100
     * @tc.desc Verify rounding=ROUND_DOWN 0.4 0 0 true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalIsZeroTestTest100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ rounding: 1 });
      expect(new Decimal('0.4').toDecimalPlaces(0).isZero()).assertTrue();
      Decimal.set({ defaults: true });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_IS_ZERO_SUPPLEMENT_TEST_1010
     * @tc.name testDecimalIsZeroTestTest101
     * @tc.desc Verify rounding=ROUND_UP 0.1 0 1 false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalIsZeroTestTest101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ rounding: 0 });
      expect(new Decimal('0.1').toDecimalPlaces(0).isZero()).assertFalse();
      Decimal.set({ defaults: true });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_IS_ZERO_SUPPLEMENT_TEST_1020
     * @tc.name testDecimalIsZeroTestTest102
     * @tc.desc Verify set (assertTrue)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalIsZeroTestTest102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ modulo: 9 });
      expect(new Decimal('0.000').isZero()).assertTrue();
      Decimal.set({ defaults: true });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_IS_ZERO_SUPPLEMENT_TEST_1030
     * @tc.name testDecimalIsZeroTestTest103
     * @tc.desc Verify set (assertTrue)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalIsZeroTestTest103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ toExpNeg: -7, toExpPos: 21 });
      expect(new Decimal('0e0').isZero()).assertTrue();
      Decimal.set({ defaults: true });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_IS_ZERO_SUPPLEMENT_TEST_1040
     * @tc.name testDecimalIsZeroTestTest104
     * @tc.desc Verify toString (assertEqual,assertTrue)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalIsZeroTestTest104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Decimal('0.000');
      expect(d.isZero()).assertTrue();
      expect(d.toString()).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_IS_ZERO_SUPPLEMENT_TEST_1050
     * @tc.name testDecimalIsZeroTestTest105
     * @tc.desc Verify -0 isZero true isNegative true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalIsZeroTestTest105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Decimal(-0);
      expect(d.isZero()).assertTrue();
      expect(d.isNegative()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_IS_ZERO_SUPPLEMENT_TEST_1060
     * @tc.name testDecimalIsZeroTestTest106
     * @tc.desc Verify 0 isZero true isPositive false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalIsZeroTestTest106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Decimal(0);
      expect(d.isZero()).assertTrue();
      expect(d.isPositive()).assertTrue();
    });


  });

}
