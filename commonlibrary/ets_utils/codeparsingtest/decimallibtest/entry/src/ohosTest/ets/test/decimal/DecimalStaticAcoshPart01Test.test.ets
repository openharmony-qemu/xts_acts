
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

export default function decimalStaticAcoshPart01TestTest() {
  describe('DecimalStaticAcoshPart01TestTest', () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ACOSH_PART01_SUPPLEMENT_TEST_0100
     * @tc.name testDecimalStaticAcoshPart01TestTest001
     * @tc.desc Verify 401 n
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAcoshPart01TestTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let hit: boolean = false;
      try {
        Decimal.acosh(undefined as ESObject);
      } catch (e) {
        expect(e.name).assertEqual('BusinessError');
        expect((e as BusinessError).code).assertEqual(401);
        hit = true;
      }
      expect(hit).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ACOSH_PART01_SUPPLEMENT_TEST_0200
     * @tc.name testDecimalStaticAcoshPart01TestTest002
     * @tc.desc Verify n
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAcoshPart01TestTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.acosh(2);
      expect(r.toString()).assertEqual('1.3169578969248167086');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ACOSH_PART01_SUPPLEMENT_TEST_0300
     * @tc.name testDecimalStaticAcoshPart01TestTest003
     * @tc.desc Verify NaN NaN NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAcoshPart01TestTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.acosh(NaN);
      expect(r.isNaN()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ACOSH_PART01_SUPPLEMENT_TEST_0400
     * @tc.name testDecimalStaticAcoshPart01TestTest004
     * @tc.desc Verify +Infinity +Infinity acosh
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAcoshPart01TestTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.acosh(Infinity);
      expect(r.isFinite()).assertFalse();
      expect(r.isNaN()).assertFalse();
      expect(r.toString()).assertEqual('Infinity');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ACOSH_PART01_SUPPLEMENT_TEST_0500
     * @tc.name testDecimalStaticAcoshPart01TestTest005
     * @tc.desc Verify -Infinity x>=1 NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAcoshPart01TestTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.acosh(-Infinity);
      expect(r.isNaN()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ACOSH_PART01_SUPPLEMENT_TEST_0600
     * @tc.name testDecimalStaticAcoshPart01TestTest006
     * @tc.desc Verify -0 NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAcoshPart01TestTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.acosh(-0);
      expect(r.isNaN()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ACOSH_PART01_SUPPLEMENT_TEST_0700
     * @tc.name testDecimalStaticAcoshPart01TestTest007
     * @tc.desc Verify 0 NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAcoshPart01TestTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.acosh(0);
      expect(r.isNaN()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ACOSH_PART01_SUPPLEMENT_TEST_0800
     * @tc.name testDecimalStaticAcoshPart01TestTest008
     * @tc.desc Verify -1 NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAcoshPart01TestTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.acosh(-1);
      expect(r.isNaN()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ACOSH_PART01_SUPPLEMENT_TEST_0900
     * @tc.name testDecimalStaticAcoshPart01TestTest009
     * @tc.desc Verify -5 NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAcoshPart01TestTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.acosh(-5);
      expect(r.isNaN()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ACOSH_PART01_SUPPLEMENT_TEST_1000
     * @tc.name testDecimalStaticAcoshPart01TestTest010
     * @tc.desc Verify -MAX_VALUE NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAcoshPart01TestTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.acosh(-Number.MAX_VALUE);
      expect(r.isNaN()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ACOSH_PART01_SUPPLEMENT_TEST_1100
     * @tc.name testDecimalStaticAcoshPart01TestTest011
     * @tc.desc Verify 0.5 <1 NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAcoshPart01TestTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.acosh(0.5);
      expect(r.isNaN()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ACOSH_PART01_SUPPLEMENT_TEST_1200
     * @tc.name testDecimalStaticAcoshPart01TestTest012
     * @tc.desc Verify 0.9999999999999999 1 NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAcoshPart01TestTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.acosh(0.9999999999999999);
      expect(r.isNaN()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ACOSH_PART01_SUPPLEMENT_TEST_1300
     * @tc.name testDecimalStaticAcoshPart01TestTest013
     * @tc.desc Verify 1 + EPSILON 1+2^-52 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAcoshPart01TestTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.acosh(1 + Number.EPSILON);
      expect(r.isNaN()).assertFalse();
      expect(Math.abs(r.toNumber() - 2e-8) < 1e-9).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ACOSH_PART01_SUPPLEMENT_TEST_1400
     * @tc.name testDecimalStaticAcoshPart01TestTest014
     * @tc.desc Verify 1 - EPSILON 1 NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAcoshPart01TestTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.acosh(1 - Number.EPSILON);
      expect(r.isNaN()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ACOSH_PART01_SUPPLEMENT_TEST_1500
     * @tc.name testDecimalStaticAcoshPart01TestTest015
     * @tc.desc Verify Number.MIN_VALUE double NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAcoshPart01TestTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.acosh(Number.MIN_VALUE);
      expect(r.isNaN()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ACOSH_PART01_SUPPLEMENT_TEST_1600
     * @tc.name testDecimalStaticAcoshPart01TestTest016
     * @tc.desc Verify 1 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAcoshPart01TestTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.acosh(1);
      expect(r.toNumber()).assertEqual(0);
      expect(r.toString()).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ACOSH_PART01_SUPPLEMENT_TEST_1700
     * @tc.name testDecimalStaticAcoshPart01TestTest017
     * @tc.desc Verify 1.5 0.962423650119206895 20
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAcoshPart01TestTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.acosh(1.5);
      expect(r.toString()).assertEqual('0.962423650119206895');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ACOSH_PART01_SUPPLEMENT_TEST_1800
     * @tc.name testDecimalStaticAcoshPart01TestTest018
     * @tc.desc Verify 5 2.2924316695611776878 20
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAcoshPart01TestTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.acosh(5);
      expect(r.toString()).assertEqual('2.2924316695611776878');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ACOSH_PART01_SUPPLEMENT_TEST_1900
     * @tc.name testDecimalStaticAcoshPart01TestTest019
     * @tc.desc Verify 10 2.9932228461263808979 20
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAcoshPart01TestTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.acosh(10);
      expect(r.toString()).assertEqual('2.9932228461263808979');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ACOSH_PART01_SUPPLEMENT_TEST_2000
     * @tc.name testDecimalStaticAcoshPart01TestTest020
     * @tc.desc Verify 50 4.6050701709847571595
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAcoshPart01TestTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.acosh(50);
      expect(r.toString()).assertEqual('4.6050701709847571595');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ACOSH_PART01_SUPPLEMENT_TEST_2100
     * @tc.name testDecimalStaticAcoshPart01TestTest021
     * @tc.desc Verify 100 5.2982923656104845907 20
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAcoshPart01TestTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.acosh(100);
      expect(r.toString()).assertEqual('5.2982923656104845907');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ACOSH_PART01_SUPPLEMENT_TEST_2200
     * @tc.name testDecimalStaticAcoshPart01TestTest022
     * @tc.desc Verify 1e8 number 19.113827924512310757
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAcoshPart01TestTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.acosh(1e8);
      expect(r.toString()).assertEqual('19.113827924512310757');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ACOSH_PART01_SUPPLEMENT_TEST_2300
     * @tc.name testDecimalStaticAcoshPart01TestTest023
     * @tc.desc Verify 1e20 number 46.74484904044085899
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAcoshPart01TestTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.acosh(1e20);
      expect(r.toString()).assertEqual('46.74484904044085899');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ACOSH_PART01_SUPPLEMENT_TEST_2400
     * @tc.name testDecimalStaticAcoshPart01TestTest024
     * @tc.desc Verify 1e100 number 230.95165647996451372
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAcoshPart01TestTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.acosh(1e100);
      expect(r.toString()).assertEqual('230.95165647996451371');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ACOSH_PART01_SUPPLEMENT_TEST_2500
     * @tc.name testDecimalStaticAcoshPart01TestTest025
     * @tc.desc Verify 1e300 number 691.46867507877365057
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAcoshPart01TestTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.acosh(1e300);
      expect(r.toString()).assertEqual('691.46867507877365051');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ACOSH_PART01_SUPPLEMENT_TEST_2600
     * @tc.name testDecimalStaticAcoshPart01TestTest026
     * @tc.desc Verify Number.MAX_VALUE double 710.47586007394394204
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAcoshPart01TestTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.acosh(Number.MAX_VALUE);
      expect(r.toString()).assertEqual('710.47586007394394204');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ACOSH_PART01_SUPPLEMENT_TEST_2700
     * @tc.name testDecimalStaticAcoshPart01TestTest027
     * @tc.desc Verify 9e15 MAX_SAFE_INTEGER number 37.429148152806849952
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAcoshPart01TestTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.acosh(9e15);
      expect(r.toString()).assertEqual('37.429148152806849952');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ACOSH_PART01_SUPPLEMENT_TEST_2800
     * @tc.name testDecimalStaticAcoshPart01TestTest028
     * @tc.desc Verify '2' number 2 1.3169578969248167086
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAcoshPart01TestTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.acosh('2');
      expect(r.toString()).assertEqual('1.3169578969248167086');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ACOSH_PART01_SUPPLEMENT_TEST_2900
     * @tc.name testDecimalStaticAcoshPart01TestTest029
     * @tc.desc Verify '9007199254740991' MAX_SAFE_INTEGER acosh 37.429947750237046598
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAcoshPart01TestTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.acosh('9007199254740991');
      expect(r.toString()).assertEqual('37.429947750237046598');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ACOSH_PART01_SUPPLEMENT_TEST_3000
     * @tc.name testDecimalStaticAcoshPart01TestTest030
     * @tc.desc Verify '1e100' 230.95165647996451372
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAcoshPart01TestTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.acosh('1e100');
      expect(r.toString()).assertEqual('230.95165647996451371');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ACOSH_PART01_SUPPLEMENT_TEST_3100
     * @tc.name testDecimalStaticAcoshPart01TestTest031
     * @tc.desc Verify '0x10' 16 3.4647579066758628279
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAcoshPart01TestTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.acosh('0x10');
      expect(r.toString()).assertEqual('3.4647579066758628279');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ACOSH_PART01_SUPPLEMENT_TEST_3200
     * @tc.name testDecimalStaticAcoshPart01TestTest032
     * @tc.desc Verify Decimal number compare
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAcoshPart01TestTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.acosh(50);
      let d: Decimal = new Decimal('4.6050701709847571595');
      expect(r instanceof Decimal).assertTrue();
      expect(r.comparedTo(d)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ACOSH_PART01_SUPPLEMENT_TEST_3300
     * @tc.name testDecimalStaticAcoshPart01TestTest033
     * @tc.desc Verify number values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAcoshPart01TestTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r1: Decimal = Decimal.acosh(50);
      let r2: Decimal = Decimal.acosh(50);
      expect(r1.comparedTo(r2)).assertEqual(0);
      expect(r1 === r2).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ACOSH_PART01_SUPPLEMENT_TEST_3400
     * @tc.name testDecimalStaticAcoshPart01TestTest034
     * @tc.desc Verify Decimal Decimal
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAcoshPart01TestTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.acosh(50).toSignificantDigits(4);
      expect(r.toString()).assertEqual('4.605');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ACOSH_PART01_SUPPLEMENT_TEST_3500
     * @tc.name testDecimalStaticAcoshPart01TestTest035
     * @tc.desc Verify Decimal
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAcoshPart01TestTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(5);
      let r: Decimal = Decimal.acosh(d);
      expect(r.toString()).assertEqual('2.2924316695611776878');
      expect(d.toString()).assertEqual('5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ACOSH_PART01_SUPPLEMENT_TEST_3600
     * @tc.name testDecimalStaticAcoshPart01TestTest036
     * @tc.desc Verify toNumber toString 20
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAcoshPart01TestTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.acosh(50);
      expect(r.toNumber()).assertEqual(4.6050701709847575);
      expect(r.toString()).assertEqual('4.6050701709847571595');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ACOSH_PART01_SUPPLEMENT_TEST_3700
     * @tc.name testDecimalStaticAcoshPart01TestTest037
     * @tc.desc Verify 'abc' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAcoshPart01TestTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let hit: boolean = false;
      try {
        Decimal.acosh('abc');
      } catch (e) {
        expect(e.name).assertEqual('BusinessError');
        expect((e as BusinessError).code).assertEqual(401);
        hit = true;
      }
      expect(hit).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ACOSH_PART01_SUPPLEMENT_TEST_3800
     * @tc.name testDecimalStaticAcoshPart01TestTest038
     * @tc.desc Verify '' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAcoshPart01TestTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let hit: boolean = false;
      try {
        Decimal.acosh('');
      } catch (e) {
        expect(e.name).assertEqual('BusinessError');
        expect((e as BusinessError).code).assertEqual(401);
        hit = true;
      }
      expect(hit).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ACOSH_PART01_SUPPLEMENT_TEST_3900
     * @tc.name testDecimalStaticAcoshPart01TestTest039
     * @tc.desc Verify ' ' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAcoshPart01TestTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let hit: boolean = false;
      try {
        Decimal.acosh('   ');
      } catch (e) {
        expect(e.name).assertEqual('BusinessError');
        expect((e as BusinessError).code).assertEqual(401);
        hit = true;
      }
      expect(hit).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ACOSH_PART01_SUPPLEMENT_TEST_4000
     * @tc.name testDecimalStaticAcoshPart01TestTest040
     * @tc.desc Verify ' 2' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAcoshPart01TestTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let hit: boolean = false;
      try {
        Decimal.acosh('​2');
      } catch (e) {
        expect(e.name).assertEqual('BusinessError');
        expect((e as BusinessError).code).assertEqual(401);
        hit = true;
      }
      expect(hit).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ACOSH_PART01_SUPPLEMENT_TEST_4100
     * @tc.name testDecimalStaticAcoshPart01TestTest041
     * @tc.desc Verify NUL '2 ' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAcoshPart01TestTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let hit: boolean = false;
      try {
        Decimal.acosh('2');
      } catch (e) {
        expect(e.name).assertEqual('BusinessError');
        expect((e as BusinessError).code).assertEqual(401);
        hit = true;
      }
      expect(hit).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ACOSH_PART01_SUPPLEMENT_TEST_4200
     * @tc.name testDecimalStaticAcoshPart01TestTest042
     * @tc.desc Verify Unicode/emoji '2 ' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAcoshPart01TestTest042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let hit: boolean = false;
      try {
        Decimal.acosh('2😀');
      } catch (e) {
        expect(e.name).assertEqual('BusinessError');
        expect((e as BusinessError).code).assertEqual(401);
        hit = true;
      }
      expect(hit).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ACOSH_PART01_SUPPLEMENT_TEST_4300
     * @tc.name testDecimalStaticAcoshPart01TestTest043
     * @tc.desc Verify string acosh('2')
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAcoshPart01TestTest043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.acosh('2');
      expect(r.toNumber()).assertEqual(1.3169578969248168);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ACOSH_PART01_SUPPLEMENT_TEST_4400
     * @tc.name testDecimalStaticAcoshPart01TestTest044
     * @tc.desc Verify Decimal Decimal acosh(Decimal)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAcoshPart01TestTest044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(2);
      let r: Decimal = Decimal.acosh(d);
      expect(r.toString()).assertEqual('1.3169578969248167086');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ACOSH_PART01_SUPPLEMENT_TEST_4500
     * @tc.name testDecimalStaticAcoshPart01TestTest045
     * @tc.desc Verify number null null 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAcoshPart01TestTest045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let hit: boolean = false;
      try {
        Decimal.acosh(null as ESObject);
      } catch (e) {
        expect(e.name).assertEqual('BusinessError');
        expect((e as BusinessError).code).assertEqual(401);
        hit = true;
      }
      expect(hit).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ACOSH_PART01_SUPPLEMENT_TEST_4600
     * @tc.name testDecimalStaticAcoshPart01TestTest046
     * @tc.desc Verify undefined undefined 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAcoshPart01TestTest046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let hit1: boolean = false;
      try {
        Decimal.acosh(undefined as ESObject);
      } catch (e) {
        hit1 = true;
      }
      let hit2: boolean = false;
      try {
        Decimal.acosh(undefined as ESObject);
      } catch (e) {
        hit2 = true;
      }
      expect(hit1).assertTrue();
      expect(hit2).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ACOSH_PART01_SUPPLEMENT_TEST_4700
     * @tc.name testDecimalStaticAcoshPart01TestTest047
     * @tc.desc Verify Date 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAcoshPart01TestTest047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Date = new Date(0);
      let hit: boolean = false;
      try {
        Decimal.acosh(d as ESObject);
      } catch (e) {
        expect(e.name).assertEqual('BusinessError');
        expect((e as BusinessError).code).assertEqual(401);
        hit = true;
      }
      expect(hit).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ACOSH_PART01_SUPPLEMENT_TEST_4800
     * @tc.name testDecimalStaticAcoshPart01TestTest048
     * @tc.desc Verify RegExp 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAcoshPart01TestTest048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let re: RegExp = new RegExp('2');
      let hit: boolean = false;
      try {
        Decimal.acosh(re as ESObject);
      } catch (e) {
        expect(e.name).assertEqual('BusinessError');
        expect((e as BusinessError).code).assertEqual(401);
        hit = true;
      }
      expect(hit).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ACOSH_PART01_SUPPLEMENT_TEST_4900
     * @tc.name testDecimalStaticAcoshPart01TestTest049
     * @tc.desc Verify Error 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAcoshPart01TestTest049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e0: Error = new Error('boom');
      let hit: boolean = false;
      try {
        Decimal.acosh(e0 as ESObject);
      } catch (e) {
        expect(e.name).assertEqual('BusinessError');
        expect((e as BusinessError).code).assertEqual(401);
        hit = true;
      }
      expect(hit).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ACOSH_PART01_SUPPLEMENT_TEST_5000
     * @tc.name testDecimalStaticAcoshPart01TestTest050
     * @tc.desc Verify Map 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAcoshPart01TestTest050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m: Map<string, number> = new Map<string, number>();
      m.set('2', 2);
      let hit: boolean = false;
      try {
        Decimal.acosh(m as ESObject);
      } catch (e) {
        expect(e.name).assertEqual('BusinessError');
        expect((e as BusinessError).code).assertEqual(401);
        hit = true;
      }
      expect(hit).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ACOSH_PART01_SUPPLEMENT_TEST_5100
     * @tc.name testDecimalStaticAcoshPart01TestTest051
     * @tc.desc Verify Set 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAcoshPart01TestTest051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<string> = new Set<string>();
      s.add('2');
      let hit: boolean = false;
      try {
        Decimal.acosh(s as ESObject);
      } catch (e) {
        expect(e.name).assertEqual('BusinessError');
        expect((e as BusinessError).code).assertEqual(401);
        hit = true;
      }
      expect(hit).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ACOSH_PART01_SUPPLEMENT_TEST_5200
     * @tc.name testDecimalStaticAcoshPart01TestTest052
     * @tc.desc Verify 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAcoshPart01TestTest052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let o: object = { a: 2 } as ESObject;
      let hit: boolean = false;
      try {
        Decimal.acosh(o as ESObject);
      } catch (e) {
        expect(e.name).assertEqual('BusinessError');
        expect((e as BusinessError).code).assertEqual(401);
        hit = true;
      }
      expect(hit).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ACOSH_PART01_SUPPLEMENT_TEST_5300
     * @tc.name testDecimalStaticAcoshPart01TestTest053
     * @tc.desc Verify [2] 401 Value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAcoshPart01TestTest053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Array<number> = new Array<number>();
      arr.push(2);
      let hit: boolean = false;
      try {
        Decimal.acosh(arr as ESObject);
      } catch (e) {
        expect(e.name).assertEqual('BusinessError');
        expect((e as BusinessError).code).assertEqual(401);
        hit = true;
      }
      expect(hit).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ACOSH_PART01_SUPPLEMENT_TEST_5400
     * @tc.name testDecimalStaticAcoshPart01TestTest054
     * @tc.desc Verify 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAcoshPart01TestTest054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let f: () => number = () => 2;
      let hit: boolean = false;
      try {
        Decimal.acosh(f as ESObject);
      } catch (e) {
        expect(e.name).assertEqual('BusinessError');
        expect((e as BusinessError).code).assertEqual(401);
        hit = true;
      }
      expect(hit).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ACOSH_PART01_SUPPLEMENT_TEST_5500
     * @tc.name testDecimalStaticAcoshPart01TestTest055
     * @tc.desc Verify acosh extra argument ignored first only
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAcoshPart01TestTest055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = (Decimal.acosh as ESObject)('2', 'ignored') as Decimal;
      expect(r.toString()).assertEqual(Decimal.acosh('2').toString());
    });


  });

}
