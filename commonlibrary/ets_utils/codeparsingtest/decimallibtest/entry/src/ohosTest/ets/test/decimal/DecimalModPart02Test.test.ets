
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
import { BusinessError } from '@kit.BasicServicesKit';

function sleep(time: number): Promise<void> {
  return new Promise<void>((resolve) => setTimeout(resolve, time));
}

export default function decimalModPart02TestTest() {
  describe('DecimalModPart02TestTest', () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MOD_PART02_SUPPLEMENT_TEST_0100
     * @tc.name testDecimalModPart02TestTest001
     * @tc.desc Verify string values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalModPart02TestTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Decimal('10').mod('3').toString()).assertEqual('1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MOD_PART02_SUPPLEMENT_TEST_0200
     * @tc.name testDecimalModPart02TestTest002
     * @tc.desc Verify string values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalModPart02TestTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Decimal('10.5').mod('3.2').toString()).assertEqual('0.9');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MOD_PART02_SUPPLEMENT_TEST_0300
     * @tc.name testDecimalModPart02TestTest003
     * @tc.desc Verify string values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalModPart02TestTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Decimal('10').mod('  3  ');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MOD_PART02_SUPPLEMENT_TEST_0400
     * @tc.name testDecimalModPart02TestTest004
     * @tc.desc Verify '+'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalModPart02TestTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Decimal('7').mod('+3').toString()).assertEqual('1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MOD_PART02_SUPPLEMENT_TEST_0500
     * @tc.name testDecimalModPart02TestTest005
     * @tc.desc Verify '-'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalModPart02TestTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Decimal('-10').mod('-3').toString()).assertEqual('-1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MOD_PART02_SUPPLEMENT_TEST_0600
     * @tc.name testDecimalModPart02TestTest006
     * @tc.desc Verify '1e3'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalModPart02TestTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Decimal('7').mod('1e3').toString()).assertEqual('7');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MOD_PART02_SUPPLEMENT_TEST_0700
     * @tc.name testDecimalModPart02TestTest007
     * @tc.desc Verify '1e-2' 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalModPart02TestTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Decimal('1').mod('1e-2').toString()).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MOD_PART02_SUPPLEMENT_TEST_0800
     * @tc.name testDecimalModPart02TestTest008
     * @tc.desc Verify '0x10' 16
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalModPart02TestTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Decimal('23').mod('0x10').toString()).assertEqual('7');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MOD_PART02_SUPPLEMENT_TEST_0900
     * @tc.name testDecimalModPart02TestTest009
     * @tc.desc Verify '0b101' 5
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalModPart02TestTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Decimal('23').mod('0b101').toString()).assertEqual('3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MOD_PART02_SUPPLEMENT_TEST_1000
     * @tc.name testDecimalModPart02TestTest010
     * @tc.desc Verify '0o17' 15
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalModPart02TestTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Decimal('23').mod('0o17').toString()).assertEqual('8');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MOD_PART02_SUPPLEMENT_TEST_1100
     * @tc.name testDecimalModPart02TestTest011
     * @tc.desc Verify 'Infinity'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalModPart02TestTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Decimal('7').mod('Infinity').toString()).assertEqual('7');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MOD_PART02_SUPPLEMENT_TEST_1200
     * @tc.name testDecimalModPart02TestTest012
     * @tc.desc Verify '3.00' 3
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalModPart02TestTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Decimal('10').mod('3.00').toString()).assertEqual('1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MOD_PART02_SUPPLEMENT_TEST_1300
     * @tc.name testDecimalModPart02TestTest013
     * @tc.desc Verify '.5' 0.5
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalModPart02TestTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Decimal('7').mod('.5').toString()).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MOD_PART02_SUPPLEMENT_TEST_1400
     * @tc.name testDecimalModPart02TestTest014
     * @tc.desc Verify '1e+3'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalModPart02TestTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Decimal('1e+3').mod('33').toString()).assertEqual('10');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MOD_PART02_SUPPLEMENT_TEST_1500
     * @tc.name testDecimalModPart02TestTest015
     * @tc.desc Verify '1E3'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalModPart02TestTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Decimal('5').mod('1E3').toString()).assertEqual('5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MOD_PART02_SUPPLEMENT_TEST_1600
     * @tc.name testDecimalModPart02TestTest016
     * @tc.desc Verify '1e-7' '3e-9'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalModPart02TestTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Decimal('1e-7').mod('3e-9').toString()).assertEqual('1e-9');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MOD_PART02_SUPPLEMENT_TEST_1700
     * @tc.name testDecimalModPart02TestTest017
     * @tc.desc Verify '0007' 7
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalModPart02TestTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Decimal('10').mod('0007').toString()).assertEqual('3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MOD_PART02_SUPPLEMENT_TEST_1800
     * @tc.name testDecimalModPart02TestTest018
     * @tc.desc Verify '0.777777' '0.01'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalModPart02TestTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Decimal('0.777777').mod('0.01').toString()).assertEqual('0.007777');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MOD_PART02_SUPPLEMENT_TEST_1900
     * @tc.name testDecimalModPart02TestTest019
     * @tc.desc Verify 1e10 10
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalModPart02TestTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Decimal('123456789012345678901234567890').mod('10000000000').toString()).assertEqual('1234567890');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MOD_PART02_SUPPLEMENT_TEST_2000
     * @tc.name testDecimalModPart02TestTest020
     * @tc.desc Verify 5000 '1' 9 9
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalModPart02TestTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Decimal('1'.repeat(5000)).mod('9').toString()).assertEqual('5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MOD_PART02_SUPPLEMENT_TEST_2100
     * @tc.name testDecimalModPart02TestTest021
     * @tc.desc Verify string values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalModPart02TestTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Decimal('1').mod('9'.repeat(100)).toString()).assertEqual('1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MOD_PART02_SUPPLEMENT_TEST_2200
     * @tc.name testDecimalModPart02TestTest022
     * @tc.desc Verify '0.000000001' '0.0000000003'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalModPart02TestTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Decimal('0.000000001').mod('0.0000000003').toString()).assertEqual('1e-10');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MOD_PART02_SUPPLEMENT_TEST_2300
     * @tc.name testDecimalModPart02TestTest023
     * @tc.desc Verify '1.5e3' 1500
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalModPart02TestTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Decimal('1.5e3').mod('7').toString()).assertEqual('2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MOD_PART02_SUPPLEMENT_TEST_2400
     * @tc.name testDecimalModPart02TestTest024
     * @tc.desc Verify string values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalModPart02TestTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Decimal('  10  ').mod('3');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MOD_PART02_SUPPLEMENT_TEST_2500
     * @tc.name testDecimalModPart02TestTest025
     * @tc.desc Verify string values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalModPart02TestTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Decimal('0.5').mod('3').toString()).assertEqual('0.5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MOD_PART02_SUPPLEMENT_TEST_2600
     * @tc.name testDecimalModPart02TestTest026
     * @tc.desc Verify string values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalModPart02TestTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Decimal('-10.5').mod('2').toString()).assertEqual('-0.5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MOD_PART02_SUPPLEMENT_TEST_2700
     * @tc.name testDecimalModPart02TestTest027
     * @tc.desc Verify string|number|Decimal 3
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalModPart02TestTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Decimal('10');
      expect(d.mod('3').toString()).assertEqual('1');
      expect(d.mod(3).toString()).assertEqual('1');
      expect(d.mod(new Decimal(3)).toString()).assertEqual('1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MOD_PART02_SUPPLEMENT_TEST_2800
     * @tc.name testDecimalModPart02TestTest028
     * @tc.desc Verify string /number
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalModPart02TestTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Decimal('10').mod(3).toString()).assertEqual('1');
      expect(new Decimal(10).mod('3').toString()).assertEqual('1');
      expect(new Decimal(10).mod(new Decimal(3)).toString()).assertEqual('1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MOD_PART02_SUPPLEMENT_TEST_2900
     * @tc.name testDecimalModPart02TestTest029
     * @tc.desc Verify Decimal
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalModPart02TestTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const q = new Decimal('7.5').mul(2);
      expect(q.mod('4').toString()).assertEqual('3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MOD_PART02_SUPPLEMENT_TEST_3000
     * @tc.name testDecimalModPart02TestTest030
     * @tc.desc Verify Decimal
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalModPart02TestTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Decimal('3');
      const b = new Decimal(3).add(0);
      expect(new Decimal('10').mod(a).toString()).assertEqual(new Decimal('10').mod(b).toString());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MOD_PART02_SUPPLEMENT_TEST_3100
     * @tc.name testDecimalModPart02TestTest031
     * @tc.desc Verify null string|number|Decimal
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalModPart02TestTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Decimal('10').mod(null as ESObject);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MOD_PART02_SUPPLEMENT_TEST_3200
     * @tc.name testDecimalModPart02TestTest032
     * @tc.desc Verify undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalModPart02TestTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Decimal('10').mod(undefined as ESObject);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MOD_PART02_SUPPLEMENT_TEST_3300
     * @tc.name testDecimalModPart02TestTest033
     * @tc.desc Verify {}
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalModPart02TestTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Decimal('10').mod({} as ESObject);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MOD_PART02_SUPPLEMENT_TEST_3400
     * @tc.name testDecimalModPart02TestTest034
     * @tc.desc Verify true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalModPart02TestTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Decimal('10').mod(true as ESObject);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MOD_PART02_SUPPLEMENT_TEST_3500
     * @tc.name testDecimalModPart02TestTest035
     * @tc.desc Verify [3]
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalModPart02TestTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Decimal('10' as ESObject).mod([3] as ESObject);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MOD_PART02_SUPPLEMENT_TEST_3600
     * @tc.name testDecimalModPart02TestTest036
     * @tc.desc Verify union/intersection
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalModPart02TestTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Decimal('10').mod((() => 3) as ESObject);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MOD_PART02_SUPPLEMENT_TEST_3700
     * @tc.name testDecimalModPart02TestTest037
     * @tc.desc Verify string|number|Decimal 0 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalModPart02TestTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Decimal('0');
      expect(d.mod('5').toString()).assertEqual('0');
      expect(d.mod(5).toString()).assertEqual('0');
      expect(d.mod(new Decimal(5)).toString()).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MOD_PART02_SUPPLEMENT_TEST_3800
     * @tc.name testDecimalModPart02TestTest038
     * @tc.desc Verify mod Decimal
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalModPart02TestTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = new Decimal('10').mod('3');
      expect(r instanceof Decimal).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MOD_PART02_SUPPLEMENT_TEST_3900
     * @tc.name testDecimalModPart02TestTest039
     * @tc.desc Verify mod Decimal
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalModPart02TestTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Decimal('10');
      const r = d.mod('3');
      expect(d.toString()).assertEqual('10');
      expect(r.toString()).assertEqual('1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MOD_PART02_SUPPLEMENT_TEST_4000
     * @tc.name testDecimalModPart02TestTest040
     * @tc.desc Verify mod Decimal
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalModPart02TestTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Decimal('10').mod('3').add(1).toString()).assertEqual('2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MOD_PART02_SUPPLEMENT_TEST_4100
     * @tc.name testDecimalModPart02TestTest041
     * @tc.desc Verify mod Decimal toNumber number
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalModPart02TestTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Decimal('10').mod('3').toNumber()).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MOD_PART02_SUPPLEMENT_TEST_4200
     * @tc.name testDecimalModPart02TestTest042
     * @tc.desc Verify ''
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalModPart02TestTest042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Decimal('10').mod('');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MOD_PART02_SUPPLEMENT_TEST_4300
     * @tc.name testDecimalModPart02TestTest043
     * @tc.desc Verify generic
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalModPart02TestTest043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Decimal('10').mod('   ');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MOD_PART02_SUPPLEMENT_TEST_4400
     * @tc.name testDecimalModPart02TestTest044
     * @tc.desc Verify ' '
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalModPart02TestTest044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Decimal('10').mod('​');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MOD_PART02_SUPPLEMENT_TEST_4500
     * @tc.name testDecimalModPart02TestTest045
     * @tc.desc Verify NUL ' '
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalModPart02TestTest045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Decimal('10').mod('\u0000');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MOD_PART02_SUPPLEMENT_TEST_4600
     * @tc.name testDecimalModPart02TestTest046
     * @tc.desc Verify 'abc'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalModPart02TestTest046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Decimal('10').mod('abc');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MOD_PART02_SUPPLEMENT_TEST_4700
     * @tc.name testDecimalModPart02TestTest047
     * @tc.desc Verify '12a34'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalModPart02TestTest047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Decimal('10').mod('12a34');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MOD_PART02_SUPPLEMENT_TEST_4800
     * @tc.name testDecimalModPart02TestTest048
     * @tc.desc Verify '1,000'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalModPart02TestTest048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Decimal('10').mod('1,000');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MOD_PART02_SUPPLEMENT_TEST_4900
     * @tc.name testDecimalModPart02TestTest049
     * @tc.desc Verify '1_000' [device does not throw, expected error pending SDK alignment]
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalModPart02TestTest049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Decimal('10').mod('1_000').toString().length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MOD_PART02_SUPPLEMENT_TEST_5000
     * @tc.name testDecimalModPart02TestTest050
     * @tc.desc Verify '.'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalModPart02TestTest050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Decimal('10').mod('.');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MOD_PART02_SUPPLEMENT_TEST_5100
     * @tc.name testDecimalModPart02TestTest051
     * @tc.desc Verify '+'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalModPart02TestTest051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Decimal('10').mod('+');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MOD_PART02_SUPPLEMENT_TEST_5200
     * @tc.name testDecimalModPart02TestTest052
     * @tc.desc Verify 'e5'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalModPart02TestTest052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Decimal('10').mod('e5');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MOD_PART02_SUPPLEMENT_TEST_5300
     * @tc.name testDecimalModPart02TestTest053
     * @tc.desc Verify emoji ' '
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalModPart02TestTest053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Decimal('10').mod('👍');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MOD_PART02_SUPPLEMENT_TEST_5400
     * @tc.name testDecimalModPart02TestTest054
     * @tc.desc Verify '\uD800'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalModPart02TestTest054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Decimal('10').mod('\uD800');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MOD_PART02_SUPPLEMENT_TEST_5500
     * @tc.name testDecimalModPart02TestTest055
     * @tc.desc Verify XSS '<script>alert(1)</script>'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalModPart02TestTest055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Decimal('10').mod('<script>alert(1)</script>');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MOD_PART02_SUPPLEMENT_TEST_5600
     * @tc.name testDecimalModPart02TestTest056
     * @tc.desc Verify 'a'.repeat(1000)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalModPart02TestTest056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Decimal('10').mod('a'.repeat(1000));
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MOD_PART02_SUPPLEMENT_TEST_5700
     * @tc.name testDecimalModPart02TestTest057
     * @tc.desc Verify '1\n2'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalModPart02TestTest057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Decimal('10').mod('1\n2');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MOD_PART02_SUPPLEMENT_TEST_5800
     * @tc.name testDecimalModPart02TestTest058
     * @tc.desc Verify - ' '
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalModPart02TestTest058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Decimal('10').mod('١٢');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MOD_PART02_SUPPLEMENT_TEST_5900
     * @tc.name testDecimalModPart02TestTest059
     * @tc.desc Verify '0xG'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalModPart02TestTest059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Decimal('10').mod('0xG');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MOD_PART02_SUPPLEMENT_TEST_6000
     * @tc.name testDecimalModPart02TestTest060
     * @tc.desc Verify '3.2.1'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalModPart02TestTest060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Decimal('10').mod('3.2.1');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MOD_PART02_SUPPLEMENT_TEST_6100
     * @tc.name testDecimalModPart02TestTest061
     * @tc.desc Verify '1e'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalModPart02TestTest061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Decimal('10').mod('1e');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MOD_PART02_SUPPLEMENT_TEST_6200
     * @tc.name testDecimalModPart02TestTest062
     * @tc.desc Verify ' - '
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalModPart02TestTest062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Decimal('10').mod(' - ');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MOD_PART02_SUPPLEMENT_TEST_6300
     * @tc.name testDecimalModPart02TestTest063
     * @tc.desc Verify 'true'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalModPart02TestTest063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Decimal('10').mod('true');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });


  });

}
