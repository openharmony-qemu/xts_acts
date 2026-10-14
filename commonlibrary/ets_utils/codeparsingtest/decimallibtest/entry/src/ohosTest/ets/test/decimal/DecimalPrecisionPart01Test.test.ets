
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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium-dynamic';
import { Decimal } from '@kit.ArkTS';

function sleep(time: number): Promise<void> {
  return new Promise<void>((resolve) => setTimeout(resolve, time));
}

export default function decimalPrecisionPart01TestTest() {
  describe('DecimalPrecisionPart01TestTest', () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PRECISION_PART01_SUPPLEMENT_TEST_0100
     * @tc.name testDecimalPrecisionPart01TestTest001
     * @tc.desc Verify (assertEqual)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPrecisionPart01TestTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let dec: Decimal = new Decimal('1.234');
      let r: number = dec.precision();
      expect(r).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PRECISION_PART01_SUPPLEMENT_TEST_0200
     * @tc.name testDecimalPrecisionPart01TestTest002
     * @tc.desc Verify (assertEqual)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPrecisionPart01TestTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let dec: Decimal = new Decimal(1.234);
      expect(dec.precision()).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PRECISION_PART01_SUPPLEMENT_TEST_0300
     * @tc.name testDecimalPrecisionPart01TestTest003
     * @tc.desc Verify (assertEqual)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPrecisionPart01TestTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let dec: Decimal = new Decimal('987000');
      expect(dec.precision()).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PRECISION_PART01_SUPPLEMENT_TEST_0400
     * @tc.name testDecimalPrecisionPart01TestTest004
     * @tc.desc Verify (assertEqual)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPrecisionPart01TestTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let dec: Decimal = new Decimal('123.456');
      let a: number = dec.precision();
      let b: number = dec.precision();
      expect(a).assertEqual(6);
      expect(b).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PRECISION_PART01_SUPPLEMENT_TEST_0500
     * @tc.name testDecimalPrecisionPart01TestTest005
     * @tc.desc Verify precision toString
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPrecisionPart01TestTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let dec: Decimal = new Decimal('123.4500');
      let before: string = dec.toString();
      dec.precision();
      expect(dec.toString()).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PRECISION_PART01_SUPPLEMENT_TEST_0600
     * @tc.name testDecimalPrecisionPart01TestTest006
     * @tc.desc Verify (assertEqual)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPrecisionPart01TestTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let dec: Decimal = new Decimal(5);
      expect(dec.precision()).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PRECISION_PART01_SUPPLEMENT_TEST_0700
     * @tc.name testDecimalPrecisionPart01TestTest007
     * @tc.desc Verify (assertEqual)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPrecisionPart01TestTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let dec: Decimal = new Decimal(1000000);
      expect(dec.precision()).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PRECISION_PART01_SUPPLEMENT_TEST_0800
     * @tc.name testDecimalPrecisionPart01TestTest008
     * @tc.desc Verify (assertEqual)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPrecisionPart01TestTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let dec: Decimal = new Decimal(1005);
      expect(dec.precision()).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PRECISION_PART01_SUPPLEMENT_TEST_0900
     * @tc.name testDecimalPrecisionPart01TestTest009
     * @tc.desc Verify (assertEqual)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPrecisionPart01TestTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let dec: Decimal = new Decimal(10500);
      expect(dec.precision()).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PRECISION_PART01_SUPPLEMENT_TEST_1000
     * @tc.name testDecimalPrecisionPart01TestTest010
     * @tc.desc Verify (assertEqual)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPrecisionPart01TestTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let dec: Decimal = new Decimal(-1500);
      expect(dec.precision()).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PRECISION_PART01_SUPPLEMENT_TEST_1100
     * @tc.name testDecimalPrecisionPart01TestTest011
     * @tc.desc Verify (assertEqual)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPrecisionPart01TestTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let dec: Decimal = new Decimal(0.5);
      expect(dec.precision()).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PRECISION_PART01_SUPPLEMENT_TEST_1200
     * @tc.name testDecimalPrecisionPart01TestTest012
     * @tc.desc Verify (assertEqual)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPrecisionPart01TestTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let dec: Decimal = new Decimal(1.5);
      expect(dec.precision()).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PRECISION_PART01_SUPPLEMENT_TEST_1300
     * @tc.name testDecimalPrecisionPart01TestTest013
     * @tc.desc Verify (assertEqual)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPrecisionPart01TestTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let dec: Decimal = new Decimal(0.1 + 0.2);
      expect(dec.precision()).assertEqual(17);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PRECISION_PART01_SUPPLEMENT_TEST_1400
     * @tc.name testDecimalPrecisionPart01TestTest014
     * @tc.desc Verify (assertEqual)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPrecisionPart01TestTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let dec: Decimal = new Decimal(0);
      expect(dec.precision()).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PRECISION_PART01_SUPPLEMENT_TEST_1500
     * @tc.name testDecimalPrecisionPart01TestTest015
     * @tc.desc Verify (assertEqual)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPrecisionPart01TestTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let dec: Decimal = new Decimal(-0);
      expect(dec.precision()).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PRECISION_PART01_SUPPLEMENT_TEST_1600
     * @tc.name testDecimalPrecisionPart01TestTest016
     * @tc.desc Verify MAX_SAFE_INTEGER 16
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPrecisionPart01TestTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let dec: Decimal = new Decimal(Number.MAX_SAFE_INTEGER);
      expect(dec.precision()).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PRECISION_PART01_SUPPLEMENT_TEST_1700
     * @tc.name testDecimalPrecisionPart01TestTest017
     * @tc.desc Verify MIN_SAFE_INTEGER 16
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPrecisionPart01TestTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let dec: Decimal = new Decimal(Number.MIN_SAFE_INTEGER);
      expect(dec.precision()).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PRECISION_PART01_SUPPLEMENT_TEST_1800
     * @tc.name testDecimalPrecisionPart01TestTest018
     * @tc.desc Verify (assertEqual)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPrecisionPart01TestTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let dec: Decimal = new Decimal(9007199254740992);
      expect(dec.precision()).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PRECISION_PART01_SUPPLEMENT_TEST_1900
     * @tc.name testDecimalPrecisionPart01TestTest019
     * @tc.desc Verify 9007199254740993 number 16
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPrecisionPart01TestTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let dec: Decimal = new Decimal(9007199254740993);
      expect(dec.precision()).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PRECISION_PART01_SUPPLEMENT_TEST_2000
     * @tc.name testDecimalPrecisionPart01TestTest020
     * @tc.desc Verify (assertEqual)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPrecisionPart01TestTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let dec: Decimal = new Decimal(Number.MAX_VALUE);
      expect(dec.precision()).assertEqual(17);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PRECISION_PART01_SUPPLEMENT_TEST_2100
     * @tc.name testDecimalPrecisionPart01TestTest021
     * @tc.desc Verify (assertEqual)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPrecisionPart01TestTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let dec: Decimal = new Decimal(Number.MIN_VALUE);
      expect(dec.precision()).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PRECISION_PART01_SUPPLEMENT_TEST_2200
     * @tc.name testDecimalPrecisionPart01TestTest022
     * @tc.desc Verify (assertEqual)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPrecisionPart01TestTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let dec: Decimal = new Decimal(Number.EPSILON);
      expect(dec.precision()).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PRECISION_PART01_SUPPLEMENT_TEST_2300
     * @tc.name testDecimalPrecisionPart01TestTest023
     * @tc.desc Verify (assertEqual)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPrecisionPart01TestTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let dec: Decimal = new Decimal(1e21);
      expect(dec.precision()).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PRECISION_PART01_SUPPLEMENT_TEST_2400
     * @tc.name testDecimalPrecisionPart01TestTest024
     * @tc.desc Verify (assertEqual)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPrecisionPart01TestTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let dec: Decimal = new Decimal(123456789123456789123456789);
      expect(dec.precision()).assertEqual(17);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PRECISION_PART01_SUPPLEMENT_TEST_2500
     * @tc.name testDecimalPrecisionPart01TestTest025
     * @tc.desc Verify (assertEqual)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPrecisionPart01TestTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let dec: Decimal = new Decimal('0.000');
      expect(dec.precision()).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PRECISION_PART01_SUPPLEMENT_TEST_2600
     * @tc.name testDecimalPrecisionPart01TestTest026
     * @tc.desc Verify (assertEqual)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPrecisionPart01TestTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let dec: Decimal = new Decimal('0.0001');
      expect(dec.precision()).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PRECISION_PART01_SUPPLEMENT_TEST_2700
     * @tc.name testDecimalPrecisionPart01TestTest027
     * @tc.desc Verify (assertEqual)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPrecisionPart01TestTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let dec: Decimal = new Decimal('000123.45');
      expect(dec.precision()).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PRECISION_PART01_SUPPLEMENT_TEST_2800
     * @tc.name testDecimalPrecisionPart01TestTest028
     * @tc.desc Verify (assertEqual)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPrecisionPart01TestTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let dec: Decimal = new Decimal('100.50');
      expect(dec.precision()).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PRECISION_PART01_SUPPLEMENT_TEST_2900
     * @tc.name testDecimalPrecisionPart01TestTest029
     * @tc.desc Verify (assertEqual)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPrecisionPart01TestTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let dec: Decimal = new Decimal('1000001');
      expect(dec.precision()).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PRECISION_PART01_SUPPLEMENT_TEST_3000
     * @tc.name testDecimalPrecisionPart01TestTest030
     * @tc.desc Verify (assertEqual)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPrecisionPart01TestTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let dec: Decimal = new Decimal('1.5000');
      expect(dec.precision()).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PRECISION_PART01_SUPPLEMENT_TEST_3100
     * @tc.name testDecimalPrecisionPart01TestTest031
     * @tc.desc Verify (assertEqual)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPrecisionPart01TestTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let dec: Decimal = new Decimal('123456789.123456789');
      expect(dec.precision()).assertEqual(18);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PRECISION_PART01_SUPPLEMENT_TEST_3200
     * @tc.name testDecimalPrecisionPart01TestTest032
     * @tc.desc Verify (assertEqual)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPrecisionPart01TestTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let dec: Decimal = new Decimal('123456789012345678901234567890');
      expect(dec.precision()).assertEqual(29);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PRECISION_PART01_SUPPLEMENT_TEST_3300
     * @tc.name testDecimalPrecisionPart01TestTest033
     * @tc.desc Verify (assertEqual)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPrecisionPart01TestTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let dec: Decimal = new Decimal('3.14159265358979323846');
      expect(dec.precision()).assertEqual(21);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PRECISION_PART01_SUPPLEMENT_TEST_3400
     * @tc.name testDecimalPrecisionPart01TestTest034
     * @tc.desc Verify (assertEqual)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPrecisionPart01TestTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let dec: Decimal = new Decimal('1e-7');
      expect(dec.precision()).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PRECISION_PART01_SUPPLEMENT_TEST_3500
     * @tc.name testDecimalPrecisionPart01TestTest035
     * @tc.desc Verify (assertEqual)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPrecisionPart01TestTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let dec: Decimal = new Decimal('2.5e2');
      expect(dec.precision()).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PRECISION_PART01_SUPPLEMENT_TEST_3600
     * @tc.name testDecimalPrecisionPart01TestTest036
     * @tc.desc Verify (assertEqual)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPrecisionPart01TestTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let dec: Decimal = new Decimal('1.500e3');
      expect(dec.precision()).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PRECISION_PART01_SUPPLEMENT_TEST_3700
     * @tc.name testDecimalPrecisionPart01TestTest037
     * @tc.desc Verify (assertEqual)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPrecisionPart01TestTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let dec: Decimal = new Decimal('1.25e-3');
      expect(dec.precision()).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PRECISION_PART01_SUPPLEMENT_TEST_3800
     * @tc.name testDecimalPrecisionPart01TestTest038
     * @tc.desc Verify (assertEqual)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPrecisionPart01TestTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let dec: Decimal = new Decimal('-1.23e-5');
      expect(dec.precision()).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PRECISION_PART01_SUPPLEMENT_TEST_3900
     * @tc.name testDecimalPrecisionPart01TestTest039
     * @tc.desc Verify (assertEqual)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPrecisionPart01TestTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let dec: Decimal = new Decimal('9999999999999999999');
      expect(dec.precision()).assertEqual(19);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PRECISION_PART01_SUPPLEMENT_TEST_4000
     * @tc.name testDecimalPrecisionPart01TestTest040
     * @tc.desc Verify (assertEqual)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPrecisionPart01TestTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let dec: Decimal = new Decimal('0x10');
      expect(dec.precision()).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PRECISION_PART01_SUPPLEMENT_TEST_4100
     * @tc.name testDecimalPrecisionPart01TestTest041
     * @tc.desc Verify (assertEqual)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPrecisionPart01TestTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let dec: Decimal = new Decimal('0xff');
      expect(dec.precision()).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PRECISION_PART01_SUPPLEMENT_TEST_4200
     * @tc.name testDecimalPrecisionPart01TestTest042
     * @tc.desc Verify (assertEqual)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPrecisionPart01TestTest042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let dec: Decimal = new Decimal('0b101');
      expect(dec.precision()).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PRECISION_PART01_SUPPLEMENT_TEST_4300
     * @tc.name testDecimalPrecisionPart01TestTest043
     * @tc.desc Verify (assertEqual)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPrecisionPart01TestTest043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let dec: Decimal = new Decimal('0b111111');
      expect(dec.precision()).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PRECISION_PART01_SUPPLEMENT_TEST_4400
     * @tc.name testDecimalPrecisionPart01TestTest044
     * @tc.desc Verify (assertEqual)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPrecisionPart01TestTest044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let dec: Decimal = new Decimal('0o17');
      expect(dec.precision()).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PRECISION_PART01_SUPPLEMENT_TEST_4500
     * @tc.name testDecimalPrecisionPart01TestTest045
     * @tc.desc Verify minE '1e-9000000000' 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPrecisionPart01TestTest045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let dec: Decimal = new Decimal('1e-9000000000');
      expect(dec.precision()).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PRECISION_PART01_SUPPLEMENT_TEST_4600
     * @tc.name testDecimalPrecisionPart01TestTest046
     * @tc.desc Verify maxE '1e+9000000000' 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPrecisionPart01TestTest046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let dec: Decimal = new Decimal('1e+9000000000');
      expect(dec.precision()).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PRECISION_PART01_SUPPLEMENT_TEST_4700
     * @tc.name testDecimalPrecisionPart01TestTest047
     * @tc.desc Verify (assertEqual)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPrecisionPart01TestTest047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let dec: Decimal = new Decimal('1e+9000000000000000');
      expect(dec.precision()).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PRECISION_PART01_SUPPLEMENT_TEST_4800
     * @tc.name testDecimalPrecisionPart01TestTest048
     * @tc.desc Verify (assertEqual)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPrecisionPart01TestTest048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let dec: Decimal = new Decimal('-1e-9000000000000000');
      expect(dec.precision()).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PRECISION_PART01_SUPPLEMENT_TEST_4900
     * @tc.name testDecimalPrecisionPart01TestTest049
     * @tc.desc Verify (assertEqual)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPrecisionPart01TestTest049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let dec: Decimal = new Decimal('1e-10000000000000000');
      expect(dec.precision()).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PRECISION_PART01_SUPPLEMENT_TEST_5000
     * @tc.name testDecimalPrecisionPart01TestTest050
     * @tc.desc Verify maxE Infinity '1e+10000000000000000' NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPrecisionPart01TestTest050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let dec: Decimal = new Decimal('1e+10000000000000000');
      expect(Number.isNaN(dec.precision())).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PRECISION_PART01_SUPPLEMENT_TEST_5100
     * @tc.name testDecimalPrecisionPart01TestTest051
     * @tc.desc Verify Number.isInteger true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPrecisionPart01TestTest051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let dec: Decimal = new Decimal('1234.56789');
      let r: number = dec.precision();
      expect(Number.isInteger(r)).assertTrue();
      expect(r).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PRECISION_PART01_SUPPLEMENT_TEST_5200
     * @tc.name testDecimalPrecisionPart01TestTest052
     * @tc.desc Verify (assertEqual)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPrecisionPart01TestTest052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let dec: Decimal = new Decimal(1).div(3);
      expect(dec.precision()).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PRECISION_PART01_SUPPLEMENT_TEST_5300
     * @tc.name testDecimalPrecisionPart01TestTest053
     * @tc.desc Verify precision=5 precision 5 defaults
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPrecisionPart01TestTest053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      Decimal.set({ precision: 5 });
      let r: number = new Decimal(1).div(3).precision();
      Decimal.set({ defaults: true });
      expect(r).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PRECISION_PART01_SUPPLEMENT_TEST_5400
     * @tc.name testDecimalPrecisionPart01TestTest054
     * @tc.desc Verify NaN Decimal precision NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPrecisionPart01TestTest054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let dec: Decimal = new Decimal(NaN);
      expect(Number.isNaN(dec.precision())).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PRECISION_PART01_SUPPLEMENT_TEST_5500
     * @tc.name testDecimalPrecisionPart01TestTest055
     * @tc.desc Verify Infinity Decimal precision NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPrecisionPart01TestTest055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let dec: Decimal = new Decimal(Infinity);
      expect(Number.isNaN(dec.precision())).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PRECISION_PART01_SUPPLEMENT_TEST_5600
     * @tc.name testDecimalPrecisionPart01TestTest056
     * @tc.desc Verify -Infinity Decimal precision NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPrecisionPart01TestTest056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let dec: Decimal = new Decimal(-Infinity);
      expect(Number.isNaN(dec.precision())).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PRECISION_PART01_SUPPLEMENT_TEST_5700
     * @tc.name testDecimalPrecisionPart01TestTest057
     * @tc.desc Verify '-1e+10000000000000000' -Infinity precision NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPrecisionPart01TestTest057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let dec: Decimal = new Decimal('-1e+10000000000000000');
      expect(Number.isNaN(dec.precision())).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PRECISION_PART01_SUPPLEMENT_TEST_5800
     * @tc.name testDecimalPrecisionPart01TestTest058
     * @tc.desc Verify DP-COMPOSITE-UNION-INTERSECTION - string|number '123.45' 123.45 5
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPrecisionPart01TestTest058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let r1: number = new Decimal('123.45').precision();
      let r2: number = new Decimal(123.45).precision();
      expect(r1).assertEqual(5);
      expect(r2).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PRECISION_PART01_SUPPLEMENT_TEST_5900
     * @tc.name testDecimalPrecisionPart01TestTest059
     * @tc.desc Verify DP-COMPOSITE-UNION-INTERSECTION - string|number|Decimal '1500'/1500/Decimal 2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPrecisionPart01TestTest059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let r1: number = new Decimal('1500').precision();
      let r2: number = new Decimal(1500).precision();
      let r3: number = new Decimal(new Decimal('1500')).precision();
      expect(r1).assertEqual(2);
      expect(r2).assertEqual(2);
      expect(r3).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PRECISION_PART01_SUPPLEMENT_TEST_6000
     * @tc.name testDecimalPrecisionPart01TestTest060
     * @tc.desc Verify DP-COMPOSITE-UNION-INTERSECTION - Decimal '100.50' 4
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPrecisionPart01TestTest060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let a: Decimal = new Decimal('100.50');
      let b: Decimal = new Decimal('100.50');
      let ra: number = new Decimal(a).precision();
      let rb: number = new Decimal(b).precision();
      expect(ra).assertEqual(4);
      expect(rb).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PRECISION_PART01_SUPPLEMENT_TEST_6100
     * @tc.name testDecimalPrecisionPart01TestTest061
     * @tc.desc Verify DP-COMPOSITE-UNION-INTERSECTION - '100' 100 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPrecisionPart01TestTest061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let r1: number = new Decimal('100').precision();
      let r2: number = new Decimal(100).precision();
      expect(r1).assertEqual(1);
      expect(r2).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PRECISION_PART01_SUPPLEMENT_TEST_6200
     * @tc.name testDecimalPrecisionPart01TestTest062
     * @tc.desc Verify DP-COMPOSITE-UNION-INTERSECTION - -123.45 '-123.45' 5
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPrecisionPart01TestTest062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let r1: number = new Decimal(-123.45).precision();
      let r2: number = new Decimal('-123.45').precision();
      expect(r1).assertEqual(5);
      expect(r2).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PRECISION_PART01_SUPPLEMENT_TEST_6300
     * @tc.name testDecimalPrecisionPart01TestTest063
     * @tc.desc Verify DP-COMPOSITE-UNION-INTERSECTION - number 99999999999999999999 1e20 1 20
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPrecisionPart01TestTest063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let rNum: number = new Decimal(99999999999999999999).precision();
      let rStr: number = new Decimal('99999999999999999999').precision();
      expect(rNum).assertEqual(1);
      expect(rStr).assertEqual(20);
    });


  });

}
