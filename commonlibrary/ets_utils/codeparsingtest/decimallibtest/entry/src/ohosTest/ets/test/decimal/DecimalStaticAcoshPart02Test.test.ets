
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

export default function decimalStaticAcoshPart02TestTest() {
  describe('DecimalStaticAcoshPart02TestTest', () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ACOSH_PART02_SUPPLEMENT_TEST_0100
     * @tc.name testDecimalStaticAcoshPart02TestTest001
     * @tc.desc Verify 1 string|number|Decimal JS
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAcoshPart02TestTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = Decimal.acosh('2');
      expect(r.toString()).assertEqual('1.3169578969248167086');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ACOSH_PART02_SUPPLEMENT_TEST_0200
     * @tc.name testDecimalStaticAcoshPart02TestTest002
     * @tc.desc Verify '1' 0 toString '0'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAcoshPart02TestTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = Decimal.acosh('1');
      expect(r.toString()).assertEqual('0');
      expect(r.isZero()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ACOSH_PART02_SUPPLEMENT_TEST_0300
     * @tc.name testDecimalStaticAcoshPart02TestTest003
     * @tc.desc Verify '1.25' ln(2) 20
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAcoshPart02TestTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = Decimal.acosh('1.25');
      expect(r.toString()).assertEqual('0.69314718055994530942');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ACOSH_PART02_SUPPLEMENT_TEST_0400
     * @tc.name testDecimalStaticAcoshPart02TestTest004
     * @tc.desc Verify '1.01' 1 20
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAcoshPart02TestTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = Decimal.acosh('1.01');
      expect(r.toString()).assertEqual('0.14130376948564857735');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ACOSH_PART02_SUPPLEMENT_TEST_0500
     * @tc.name testDecimalStaticAcoshPart02TestTest005
     * @tc.desc Verify '1.1' 1 20
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAcoshPart02TestTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = Decimal.acosh('1.1');
      expect(r.toString()).assertEqual('0.44356825438511518913');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ACOSH_PART02_SUPPLEMENT_TEST_0600
     * @tc.name testDecimalStaticAcoshPart02TestTest006
     * @tc.desc Verify '1.2' 1 20
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAcoshPart02TestTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = Decimal.acosh('1.2');
      expect(r.toString()).assertEqual('0.62236250371477866781');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ACOSH_PART02_SUPPLEMENT_TEST_0700
     * @tc.name testDecimalStaticAcoshPart02TestTest007
     * @tc.desc Verify '1.5' 20
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAcoshPart02TestTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = Decimal.acosh('1.5');
      expect(r.toString()).assertEqual('0.962423650119206895');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ACOSH_PART02_SUPPLEMENT_TEST_0800
     * @tc.name testDecimalStaticAcoshPart02TestTest008
     * @tc.desc Verify '2.5' 1 1.5667992369724109 isFinite true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAcoshPart02TestTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = Decimal.acosh('2.5');
      expect(r.isFinite()).assertTrue();
      expect(Math.abs(r.toNumber() / 1.5667992369724109 - 1) < 1e-12).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ACOSH_PART02_SUPPLEMENT_TEST_0900
     * @tc.name testDecimalStaticAcoshPart02TestTest009
     * @tc.desc Verify '3' 20
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAcoshPart02TestTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = Decimal.acosh('3');
      expect(r.toString()).assertEqual('1.7627471740390860505');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ACOSH_PART02_SUPPLEMENT_TEST_1000
     * @tc.name testDecimalStaticAcoshPart02TestTest010
     * @tc.desc Verify '4' 20
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAcoshPart02TestTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = Decimal.acosh('4');
      expect(r.toString()).assertEqual('2.0634370688955605467');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ACOSH_PART02_SUPPLEMENT_TEST_1100
     * @tc.name testDecimalStaticAcoshPart02TestTest011
     * @tc.desc Verify '5' 20
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAcoshPart02TestTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = Decimal.acosh('5');
      expect(r.toString()).assertEqual('2.2924316695611776878');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ACOSH_PART02_SUPPLEMENT_TEST_1200
     * @tc.name testDecimalStaticAcoshPart02TestTest012
     * @tc.desc Verify '7' 20
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAcoshPart02TestTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = Decimal.acosh('7');
      expect(r.toString()).assertEqual('2.6339157938496334173');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ACOSH_PART02_SUPPLEMENT_TEST_1300
     * @tc.name testDecimalStaticAcoshPart02TestTest013
     * @tc.desc Verify '10' 20
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAcoshPart02TestTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = Decimal.acosh('10');
      expect(r.toString()).assertEqual('2.9932228461263808979');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ACOSH_PART02_SUPPLEMENT_TEST_1400
     * @tc.name testDecimalStaticAcoshPart02TestTest014
     * @tc.desc Verify '20' 20
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAcoshPart02TestTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = Decimal.acosh('20');
      expect(r.toString()).assertEqual('3.6882538673612966676');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ACOSH_PART02_SUPPLEMENT_TEST_1500
     * @tc.name testDecimalStaticAcoshPart02TestTest015
     * @tc.desc Verify '50' 20
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAcoshPart02TestTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = Decimal.acosh('50');
      expect(r.toString()).assertEqual('4.6050701709847571595');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ACOSH_PART02_SUPPLEMENT_TEST_1600
     * @tc.name testDecimalStaticAcoshPart02TestTest016
     * @tc.desc Verify '100' 20
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAcoshPart02TestTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = Decimal.acosh('100');
      expect(r.toString()).assertEqual('5.2982923656104845907');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ACOSH_PART02_SUPPLEMENT_TEST_1700
     * @tc.name testDecimalStaticAcoshPart02TestTest017
     * @tc.desc Verify '100000' 12.206072645530174 isFinite true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAcoshPart02TestTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = Decimal.acosh('100000');
      expect(r.isFinite()).assertTrue();
      expect(Math.abs(r.toNumber() / 12.206072645530174 - 1) < 1e-6).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ACOSH_PART02_SUPPLEMENT_TEST_1800
     * @tc.name testDecimalStaticAcoshPart02TestTest018
     * @tc.desc Verify '+2' '2'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAcoshPart02TestTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = Decimal.acosh('+2');
      expect(r.toString()).assertEqual('1.3169578969248167086');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ACOSH_PART02_SUPPLEMENT_TEST_1900
     * @tc.name testDecimalStaticAcoshPart02TestTest019
     * @tc.desc Verify ' 2 ' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAcoshPart02TestTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown = false;
      try {
        Decimal.acosh(' 2 ');
      } catch (e) {
        thrown = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(thrown).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ACOSH_PART02_SUPPLEMENT_TEST_2000
     * @tc.name testDecimalStaticAcoshPart02TestTest020
     * @tc.desc Verify '1e-7' 1 NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAcoshPart02TestTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = Decimal.acosh('1e-7');
      expect(r.isNaN()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ACOSH_PART02_SUPPLEMENT_TEST_2100
     * @tc.name testDecimalStaticAcoshPart02TestTest021
     * @tc.desc Verify '1e2' 100 '100'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAcoshPart02TestTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = Decimal.acosh('1e2');
      expect(r.toString()).assertEqual('5.2982923656104845907');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ACOSH_PART02_SUPPLEMENT_TEST_2200
     * @tc.name testDecimalStaticAcoshPart02TestTest022
     * @tc.desc Verify '1e5' 12.206072645530174 isFinite true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAcoshPart02TestTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = Decimal.acosh('1e5');
      expect(r.isFinite()).assertTrue();
      expect(Math.abs(r.toNumber() / 12.206072645530174 - 1) < 1e-6).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ACOSH_PART02_SUPPLEMENT_TEST_2300
     * @tc.name testDecimalStaticAcoshPart02TestTest023
     * @tc.desc Verify '123.456789012345678901234567890' 28 Decimal
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAcoshPart02TestTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = Decimal.acosh('123.456789012345678901234567890');
      expect(r instanceof Decimal).assertTrue();
      expect(r.isFinite()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ACOSH_PART02_SUPPLEMENT_TEST_2400
     * @tc.name testDecimalStaticAcoshPart02TestTest024
     * @tc.desc Verify '12345678901234567890123456789012345678901234567890' 50 isFinite true [DP-BASIC-ST
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAcoshPart02TestTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = Decimal.acosh('12345678901234567890123456789012345678901234567890');
      expect(r.isFinite()).assertTrue();
      expect(r instanceof Decimal).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ACOSH_PART02_SUPPLEMENT_TEST_2500
     * @tc.name testDecimalStaticAcoshPart02TestTest025
     * @tc.desc Verify 'Infinity' +Infinity isFinite false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAcoshPart02TestTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = Decimal.acosh('Infinity');
      expect(r.isFinite()).assertFalse();
      expect(r.isNaN()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ACOSH_PART02_SUPPLEMENT_TEST_2600
     * @tc.name testDecimalStaticAcoshPart02TestTest026
     * @tc.desc Verify '-Infinity' NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAcoshPart02TestTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = Decimal.acosh('-Infinity');
      expect(r.isNaN()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ACOSH_PART02_SUPPLEMENT_TEST_2700
     * @tc.name testDecimalStaticAcoshPart02TestTest027
     * @tc.desc Verify 'NaN' NaN isNaN true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAcoshPart02TestTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = Decimal.acosh('NaN');
      expect(r.isNaN()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ACOSH_PART02_SUPPLEMENT_TEST_2800
     * @tc.name testDecimalStaticAcoshPart02TestTest028
     * @tc.desc Verify '0' x < 1 NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAcoshPart02TestTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = Decimal.acosh('0');
      expect(r.isNaN()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ACOSH_PART02_SUPPLEMENT_TEST_2900
     * @tc.name testDecimalStaticAcoshPart02TestTest029
     * @tc.desc Verify '-1' x < 1 NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAcoshPart02TestTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = Decimal.acosh('-1');
      expect(r.isNaN()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ACOSH_PART02_SUPPLEMENT_TEST_3000
     * @tc.name testDecimalStaticAcoshPart02TestTest030
     * @tc.desc Verify '-2' NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAcoshPart02TestTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = Decimal.acosh('-2');
      expect(r.isNaN()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ACOSH_PART02_SUPPLEMENT_TEST_3100
     * @tc.name testDecimalStaticAcoshPart02TestTest031
     * @tc.desc Verify '0.5' 0~1 NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAcoshPart02TestTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = Decimal.acosh('0.5');
      expect(r.isNaN()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ACOSH_PART02_SUPPLEMENT_TEST_3200
     * @tc.name testDecimalStaticAcoshPart02TestTest032
     * @tc.desc Verify '0.999999999999' 1 NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAcoshPart02TestTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = Decimal.acosh('0.999999999999');
      expect(r.isNaN()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ACOSH_PART02_SUPPLEMENT_TEST_3300
     * @tc.name testDecimalStaticAcoshPart02TestTest033
     * @tc.desc Verify '1.0000000000000001' 1 sqrt(2)*1e-8 Decimal
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAcoshPart02TestTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = Decimal.acosh('1.0000000000000001');
      expect(r.isNaN()).assertFalse();
      expect(Math.abs(r.toNumber() / 1.414213562373095037e-8 - 1) < 1e-6).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ACOSH_PART02_SUPPLEMENT_TEST_3400
     * @tc.name testDecimalStaticAcoshPart02TestTest034
     * @tc.desc Verify '1.4142135623730951' sqrt2 20
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAcoshPart02TestTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = Decimal.acosh('1.4142135623730951');
      expect(r.toString()).assertEqual('0.88137358701954307643');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ACOSH_PART02_SUPPLEMENT_TEST_3500
     * @tc.name testDecimalStaticAcoshPart02TestTest035
     * @tc.desc Verify '2 ' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAcoshPart02TestTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown = false;
      try {
        Decimal.acosh('2​');
      } catch (e) {
        thrown = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(thrown).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ACOSH_PART02_SUPPLEMENT_TEST_3600
     * @tc.name testDecimalStaticAcoshPart02TestTest036
     * @tc.desc Verify '\t\n2\r' / 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAcoshPart02TestTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown = false;
      try {
        Decimal.acosh('\t\n2\r');
      } catch (e) {
        thrown = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(thrown).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ACOSH_PART02_SUPPLEMENT_TEST_3700
     * @tc.name testDecimalStaticAcoshPart02TestTest037
     * @tc.desc Verify Unicode ' ' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAcoshPart02TestTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown = false;
      try {
        Decimal.acosh('二');
      } catch (e) {
        thrown = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(thrown).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ACOSH_PART02_SUPPLEMENT_TEST_3800
     * @tc.name testDecimalStaticAcoshPart02TestTest038
     * @tc.desc Verify emoji ' ' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAcoshPart02TestTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown = false;
      try {
        Decimal.acosh('😀');
      } catch (e) {
        thrown = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(thrown).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ACOSH_PART02_SUPPLEMENT_TEST_3900
     * @tc.name testDecimalStaticAcoshPart02TestTest039
     * @tc.desc Verify Unicode '\uD800' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAcoshPart02TestTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown = false;
      try {
        Decimal.acosh('\uD800');
      } catch (e) {
        thrown = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(thrown).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ACOSH_PART02_SUPPLEMENT_TEST_4000
     * @tc.name testDecimalStaticAcoshPart02TestTest040
     * @tc.desc Verify '0b10' Decimal 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAcoshPart02TestTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown = false;
      try {
        Decimal.acosh('0b10');
      } catch (e) {
        thrown = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(thrown).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ACOSH_PART02_SUPPLEMENT_TEST_4100
     * @tc.name testDecimalStaticAcoshPart02TestTest041
     * @tc.desc Verify XSS '<script>alert(1)</script>' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAcoshPart02TestTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown = false;
      try {
        Decimal.acosh('<script>alert(1)</script>');
      } catch (e) {
        thrown = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(thrown).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ACOSH_PART02_SUPPLEMENT_TEST_4200
     * @tc.name testDecimalStaticAcoshPart02TestTest042
     * @tc.desc Verify 1e5 'a' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAcoshPart02TestTest042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let longBad = 'a'.repeat(100000);
      let thrown = false;
      try {
        Decimal.acosh(longBad);
      } catch (e) {
        thrown = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(thrown).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ACOSH_PART02_SUPPLEMENT_TEST_4300
     * @tc.name testDecimalStaticAcoshPart02TestTest043
     * @tc.desc Verify '1..5' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAcoshPart02TestTest043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown = false;
      try {
        Decimal.acosh('1..5');
      } catch (e) {
        thrown = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(thrown).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ACOSH_PART02_SUPPLEMENT_TEST_4400
     * @tc.name testDecimalStaticAcoshPart02TestTest044
     * @tc.desc Verify '2abc' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAcoshPart02TestTest044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown = false;
      try {
        Decimal.acosh('2abc');
