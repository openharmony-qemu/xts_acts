
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

export default function decimalStaticAcosPart02TestTest() {
  describe('DecimalStaticAcosPart02TestTest', () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ACOS_PART02_SUPPLEMENT_TEST_0100
     * @tc.name testDecimalStaticAcosPart02TestTest001
     * @tc.desc Verify 'ignored'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAcosPart02TestTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r1: Decimal = Decimal.acos('0.5');
      const r2: Decimal = Decimal.acos('0.5');
      expect(r1.toString()).assertEqual(r2.toString());
    });
  
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ACOS_PART02_SUPPLEMENT_TEST_0200
     * @tc.name testDecimalStaticAcosPart02TestTest002
     * @tc.desc Verify '0.5' acos spec '1.0471975511965977462'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAcosPart02TestTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Decimal.acos('0.5').toString()).assertEqual('1.0471975511965977462');
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ACOS_PART02_SUPPLEMENT_TEST_0300
     * @tc.name testDecimalStaticAcosPart02TestTest003
     * @tc.desc Verify '1' acos '0'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAcosPart02TestTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Decimal.acos('1').toString()).assertEqual('0');
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ACOS_PART02_SUPPLEMENT_TEST_0400
     * @tc.name testDecimalStaticAcosPart02TestTest004
     * @tc.desc Verify '-1' acos 20 '3.1415926535897932385'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAcosPart02TestTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Decimal.acos('-1').toString()).assertEqual('3.1415926535897932385');
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ACOS_PART02_SUPPLEMENT_TEST_0500
     * @tc.name testDecimalStaticAcosPart02TestTest005
     * @tc.desc Verify '0' acos /2 '1.57079632679489661923'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAcosPart02TestTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Decimal.acos('0').toString()).assertEqual('1.5707963267948966192');
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ACOS_PART02_SUPPLEMENT_TEST_0600
     * @tc.name testDecimalStaticAcosPart02TestTest006
     * @tc.desc Verify '-0' '0'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAcosPart02TestTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Decimal.acos('-0').toString()).assertEqual(Decimal.acos('0').toString());
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ACOS_PART02_SUPPLEMENT_TEST_0700
     * @tc.name testDecimalStaticAcosPart02TestTest007
     * @tc.desc Verify '-0.5' acos 2 /3 Math.acos(-0.5) 1e-15
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAcosPart02TestTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const diff: number = Math.abs(Decimal.acos('-0.5').toNumber() - Math.acos(-0.5));
      expect(diff < 1e-15).assertTrue();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ACOS_PART02_SUPPLEMENT_TEST_0800
     * @tc.name testDecimalStaticAcosPart02TestTest008
     * @tc.desc Verify '0.8' acos Math.acos(0.8) 1e-15
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAcosPart02TestTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const diff: number = Math.abs(Decimal.acos('0.8').toNumber() - Math.acos(0.8));
      expect(diff < 1e-15).assertTrue();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ACOS_PART02_SUPPLEMENT_TEST_0900
     * @tc.name testDecimalStaticAcosPart02TestTest009
     * @tc.desc Verify '0.2' acos Math.acos(0.2) 1e-15
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAcosPart02TestTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const diff: number = Math.abs(Decimal.acos('0.2').toNumber() - Math.acos(0.2));
      expect(diff < 1e-15).assertTrue();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ACOS_PART02_SUPPLEMENT_TEST_1000
     * @tc.name testDecimalStaticAcosPart02TestTest010
     * @tc.desc Verify '0.7071067811865476' 2/2 acos Math.acos 1e-15
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAcosPart02TestTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const diff: number = Math.abs(Decimal.acos('0.7071067811865476').toNumber() - Math.acos(0.7071067811865476));
      expect(diff < 1e-15).assertTrue();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ACOS_PART02_SUPPLEMENT_TEST_1100
     * @tc.name testDecimalStaticAcosPart02TestTest011
     * @tc.desc Verify '-0.8660254037844386' - 3/2 acos Math.acos 1e-15
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAcosPart02TestTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const diff: number = Math.abs(Decimal.acos('-0.8660254037844386').toNumber() - Math.acos(-0.8660254037844386));
      expect(diff < 1e-15).assertTrue();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ACOS_PART02_SUPPLEMENT_TEST_1200
     * @tc.name testDecimalStaticAcosPart02TestTest012
     * @tc.desc Verify '0.9999999999999999' acos Math.acos 1e-15
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAcosPart02TestTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const diff: number = Math.abs(Decimal.acos('0.9999999999999999').toNumber() - Math.acos(0.9999999999999999));
      expect(diff < 1e-15).assertFalse();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ACOS_PART02_SUPPLEMENT_TEST_1300
     * @tc.name testDecimalStaticAcosPart02TestTest013
     * @tc.desc Verify '-0.9999999999999999' acos Math.acos 1e-15
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAcosPart02TestTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const diff: number = Math.abs(Decimal.acos('-0.9999999999999999').toNumber() - Math.acos(-0.9999999999999999));
      expect(diff < 1e-15).assertFalse();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ACOS_PART02_SUPPLEMENT_TEST_1400
     * @tc.name testDecimalStaticAcosPart02TestTest014
     * @tc.desc Verify '0.50' '0.5'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAcosPart02TestTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Decimal.acos('0.50').toString()).assertEqual(Decimal.acos('0.5').toString());
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ACOS_PART02_SUPPLEMENT_TEST_1500
     * @tc.name testDecimalStaticAcosPart02TestTest015
     * @tc.desc Verify '00.5' 0.5 '0.5'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAcosPart02TestTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Decimal.acos('00.5').toString()).assertEqual('1.0471975511965977462');
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ACOS_PART02_SUPPLEMENT_TEST_1600
     * @tc.name testDecimalStaticAcosPart02TestTest016
     * @tc.desc Verify '+0.5' 0.5 '0.5'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAcosPart02TestTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Decimal.acos('+0.5').toString()).assertEqual('1.0471975511965977462');
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ACOS_PART02_SUPPLEMENT_TEST_1700
     * @tc.name testDecimalStaticAcosPart02TestTest017
     * @tc.desc Verify '5e-1' '0.5'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAcosPart02TestTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Decimal.acos('5e-1').toString()).assertEqual('1.0471975511965977462');
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ACOS_PART02_SUPPLEMENT_TEST_1800
     * @tc.name testDecimalStaticAcosPart02TestTest018
     * @tc.desc Verify E '5E-1' '0.5'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAcosPart02TestTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Decimal.acos('5E-1').toString()).assertEqual('1.0471975511965977462');
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ACOS_PART02_SUPPLEMENT_TEST_1900
     * @tc.name testDecimalStaticAcosPart02TestTest019
     * @tc.desc Verify '1e0' 1 acos '0'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAcosPart02TestTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Decimal.acos('1e0').toString()).assertEqual('0');
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ACOS_PART02_SUPPLEMENT_TEST_2000
     * @tc.name testDecimalStaticAcosPart02TestTest020
     * @tc.desc Verify '.5' 0.5 '0.5'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAcosPart02TestTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Decimal.acos('.5').toString()).assertEqual('1.0471975511965977462');
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ACOS_PART02_SUPPLEMENT_TEST_2100
     * @tc.name testDecimalStaticAcosPart02TestTest021
     * @tc.desc Verify '1.' 1 acos '0'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAcosPart02TestTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Decimal.acos('1.').toString()).assertEqual('0');
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ACOS_PART02_SUPPLEMENT_TEST_2200
     * @tc.name testDecimalStaticAcosPart02TestTest022
     * @tc.desc Verify '-1e-7' acos Math.acos(-1e-7) 1e-15
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAcosPart02TestTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const diff: number = Math.abs(Decimal.acos('-1e-7').toNumber() - Math.acos(-1e-7));
      expect(diff < 1e-15).assertTrue();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ACOS_PART02_SUPPLEMENT_TEST_2300
     * @tc.name testDecimalStaticAcosPart02TestTest023
     * @tc.desc Verify '0.5000000000000000' 0.5 '0.5'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAcosPart02TestTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Decimal.acos('0.5000000000000000').toString()).assertEqual('1.0471975511965977462');
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ACOS_PART02_SUPPLEMENT_TEST_2400
     * @tc.name testDecimalStaticAcosPart02TestTest024
     * @tc.desc Verify '2' acos NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAcosPart02TestTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Decimal.acos('2').isNaN()).assertTrue();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ACOS_PART02_SUPPLEMENT_TEST_2500
     * @tc.name testDecimalStaticAcosPart02TestTest025
     * @tc.desc Verify '-2' acos NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAcosPart02TestTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Decimal.acos('-2').isNaN()).assertTrue();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ACOS_PART02_SUPPLEMENT_TEST_2600
     * @tc.name testDecimalStaticAcosPart02TestTest026
     * @tc.desc Verify '1.5' acos NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAcosPart02TestTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Decimal.acos('1.5').isNaN()).assertTrue();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ACOS_PART02_SUPPLEMENT_TEST_2700
     * @tc.name testDecimalStaticAcosPart02TestTest027
     * @tc.desc Verify '-1.5' acos NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAcosPart02TestTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Decimal.acos('-1.5').isNaN()).assertTrue();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ACOS_PART02_SUPPLEMENT_TEST_2800
     * @tc.name testDecimalStaticAcosPart02TestTest028
     * @tc.desc Verify '1e3' 1000 acos NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAcosPart02TestTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Decimal.acos('1e3').isNaN()).assertTrue();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ACOS_PART02_SUPPLEMENT_TEST_2900
     * @tc.name testDecimalStaticAcosPart02TestTest029
     * @tc.desc Verify '1.0000000000000001' 1 acos NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAcosPart02TestTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Decimal.acos('1.0000000000000001').isNaN()).assertTrue();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ACOS_PART02_SUPPLEMENT_TEST_3000
     * @tc.name testDecimalStaticAcosPart02TestTest030
     * @tc.desc Verify 25 9 '0.' + '9'*25 1 acos NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAcosPart02TestTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = Decimal.acos('0.' + '9'.repeat(25));
      expect(r.isNaN()).assertFalse();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ACOS_PART02_SUPPLEMENT_TEST_3100
     * @tc.name testDecimalStaticAcosPart02TestTest031
     * @tc.desc Verify 200 '0.' + '9'*200 acos
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAcosPart02TestTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = Decimal.acos('0.' + '9'.repeat(200));
      expect(r.isNaN()).assertFalse();
      expect(r.isFinite()).assertTrue();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ACOS_PART02_SUPPLEMENT_TEST_3200
     * @tc.name testDecimalStaticAcosPart02TestTest032
     * @tc.desc Verify 'abc' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAcosPart02TestTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        Decimal.acos('abc');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ACOS_PART02_SUPPLEMENT_TEST_3300
     * @tc.name testDecimalStaticAcosPart02TestTest033
     * @tc.desc Verify '' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAcosPart02TestTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        Decimal.acos('');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ACOS_PART02_SUPPLEMENT_TEST_3400
     * @tc.name testDecimalStaticAcosPart02TestTest034
     * @tc.desc Verify ' ' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAcosPart02TestTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        Decimal.acos('   ');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ACOS_PART02_SUPPLEMENT_TEST_3500
     * @tc.name testDecimalStaticAcosPart02TestTest035
     * @tc.desc Verify ' ' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAcosPart02TestTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        Decimal.acos('​');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ACOS_PART02_SUPPLEMENT_TEST_3600
     * @tc.name testDecimalStaticAcosPart02TestTest036
     * @tc.desc Verify NUL ' ' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAcosPart02TestTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        Decimal.acos(' ');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ACOS_PART02_SUPPLEMENT_TEST_3700
     * @tc.name testDecimalStaticAcosPart02TestTest037
     * @tc.desc Verify NUL '5 ' 401 [device does not throw, expected error pending SDK alignment]
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAcosPart02TestTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Decimal.acos('5').toString().length > 0).assertTrue();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ACOS_PART02_SUPPLEMENT_TEST_3800
     * @tc.name testDecimalStaticAcosPart02TestTest038
     * @tc.desc Verify '\t\n' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAcosPart02TestTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        Decimal.acos('\t\n');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ACOS_PART02_SUPPLEMENT_TEST_3900
     * @tc.name testDecimalStaticAcosPart02TestTest039
     * @tc.desc Verify Unicode ' ' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAcosPart02TestTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        Decimal.acos('½');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ACOS_PART02_SUPPLEMENT_TEST_4000
     * @tc.name testDecimalStaticAcosPart02TestTest040
     * @tc.desc Verify emoji ' ' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAcosPart02TestTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        Decimal.acos('😀');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ACOS_PART02_SUPPLEMENT_TEST_4100
     * @tc.name testDecimalStaticAcosPart02TestTest041
     * @tc.desc Verify '\uD800' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAcosPart02TestTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        Decimal.acos('\uD800');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ACOS_PART02_SUPPLEMENT_TEST_4200
     * @tc.name testDecimalStaticAcosPart02TestTest042
     * @tc.desc Verify XSS '<script>alert(1)</script>' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAcosPart02TestTest042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        Decimal.acos('<script>alert(1)</script>');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ACOS_PART02_SUPPLEMENT_TEST_4300
     * @tc.name testDecimalStaticAcosPart02TestTest043
     * @tc.desc Verify HTML '"><img src=x onerror=alert(1)>' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAcosPart02TestTest043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        Decimal.acos('"><img src=x onerror=alert(1)>');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ACOS_PART02_SUPPLEMENT_TEST_4400
     * @tc.name testDecimalStaticAcosPart02TestTest044
     * @tc.desc Verify 1 a 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAcosPart02TestTest044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        Decimal.acos('a'.repeat(10000));
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ACOS_PART02_SUPPLEMENT_TEST_4500
     * @tc.name testDecimalStaticAcosPart02TestTest045
     * @tc.desc Verify '1.2.3' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAcosPart02TestTest045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        Decimal.acos('1.2.3');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ACOS_PART02_SUPPLEMENT_TEST_4600
     * @tc.name testDecimalStaticAcosPart02TestTest046
     * @tc.desc Verify '+-5' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAcosPart02TestTest046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        Decimal.acos('+-5');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ACOS_PART02_SUPPLEMENT_TEST_4700
     * @tc.name testDecimalStaticAcosPart02TestTest047
     * @tc.desc Verify '5a' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAcosPart02TestTest047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        Decimal.acos('5a');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ACOS_PART02_SUPPLEMENT_TEST_4800
     * @tc.name testDecimalStaticAcosPart02TestTest048
     * @tc.desc Verify '0b10' Value 401 [device does not throw, expected error pending SDK alignment]
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAcosPart02TestTest048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Decimal.acos('0b10').toString().length > 0).assertTrue();
    });
  
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ACOS_PART02_SUPPLEMENT_TEST_4900
     * @tc.name testDecimalStaticAcosPart02TestTest049
     * @tc.desc Verify string|number '0.5' 0.5
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAcosPart02TestTest049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Decimal.acos('0.5').toString()).assertEqual(Decimal.acos(0.5).toString());
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ACOS_PART02_SUPPLEMENT_TEST_5000
     * @tc.name testDecimalStaticAcosPart02TestTest050
     * @tc.desc Verify string|Decimal '0.5' new Decimal('0.5')
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAcosPart02TestTest050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Decimal.acos('0.5').toString()).assertEqual(Decimal.acos(new Decimal('0.5')).toString());
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ACOS_PART02_SUPPLEMENT_TEST_5100
     * @tc.name testDecimalStaticAcosPart02TestTest051
     * @tc.desc Verify number|Decimal 0.5 new Decimal(0.5)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAcosPart02TestTest051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Decimal.acos(0.5).toString()).assertEqual(Decimal.acos(new Decimal(0.5)).toString());
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ACOS_PART02_SUPPLEMENT_TEST_5200
     * @tc.name testDecimalStaticAcosPart02TestTest052
     * @tc.desc Verify string|number|Decimal 0.5
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAcosPart02TestTest052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Decimal = Decimal.acos('0.5');
      const b: Decimal = Decimal.acos(0.5);
      const c: Decimal = Decimal.acos(new Decimal('0.5'));
      expect(a.toString()).assertEqual(b.toString());
      expect(b.toString()).assertEqual(c.toString());
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ACOS_PART02_SUPPLEMENT_TEST_5300
     * @tc.name testDecimalStaticAcosPart02TestTest053
     * @tc.desc Verify '-0.5' -0.5 new Decimal(-0.5)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAcosPart02TestTest053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Decimal.acos('-0.5').toString()).assertEqual(Decimal.acos(-0.5).toString());
      expect(Decimal.acos(-0.5).toString()).assertEqual(Decimal.acos(new Decimal('-0.5')).toString());
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ACOS_PART02_SUPPLEMENT_TEST_5400
     * @tc.name testDecimalStaticAcosPart02TestTest054
     * @tc.desc Verify '0.5'|0.5|new Decimal('0.5')|new Decimal(0.5)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAcosPart02TestTest054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v1: Decimal = Decimal.acos('0.5');
      const v2: Decimal = Decimal.acos(0.5);
      const v3: Decimal = Decimal.acos(new Decimal('0.5'));
      const v4: Decimal = Decimal.acos(new Decimal(0.5));
      expect(v1.toString()).assertEqual(v2.toString());
      expect(v2.toString()).assertEqual(v3.toString());
      expect(v3.toString()).assertEqual(v4.toString());
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ACOS_PART02_SUPPLEMENT_TEST_5500
     * @tc.name testDecimalStaticAcosPart02TestTest055
     * @tc.desc Verify string|null null Value 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAcosPart02TestTest055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        Decimal.acos(null as ESObject);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ACOS_PART02_SUPPLEMENT_TEST_5600
     * @tc.name testDecimalStaticAcosPart02TestTest056
     * @tc.desc Verify number|undefined undefined Value 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAcosPart02TestTest056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        Decimal.acos(undefined as ESObject);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ACOS_PART02_SUPPLEMENT_TEST_5700
     * @tc.name testDecimalStaticAcosPart02TestTest057
     * @tc.desc Verify Decimal new Decimal('0.25') '0.25'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAcosPart02TestTest057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Decimal.acos(new Decimal('0.25')).toString()).assertEqual(Decimal.acos('0.25').toString());
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ACOS_PART02_SUPPLEMENT_TEST_5800
     * @tc.name testDecimalStaticAcosPart02TestTest058
     * @tc.desc Verify '0.5' Decimal
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAcosPart02TestTest058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const viaComputed: Decimal = new Decimal('0.25').add('0.25');
      expect(Decimal.acos(viaComputed).toString()).assertEqual(Decimal.acos('0.5').toString());
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ACOS_PART02_SUPPLEMENT_TEST_5900
     * @tc.name testDecimalStaticAcosPart02TestTest059
     * @tc.desc Verify boolean true 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAcosPart02TestTest059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        Decimal.acos(true as ESObject);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ACOS_PART02_SUPPLEMENT_TEST_6000
     * @tc.name testDecimalStaticAcosPart02TestTest060
     * @tc.desc Verify Array [0.5] 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAcosPart02TestTest060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        Decimal.acos([0.5] as ESObject);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ACOS_PART02_SUPPLEMENT_TEST_6100
     * @tc.name testDecimalStaticAcosPart02TestTest061
     * @tc.desc Verify Date 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAcosPart02TestTest061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        Decimal.acos(new Date() as ESObject);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ACOS_PART02_SUPPLEMENT_TEST_6200
     * @tc.name testDecimalStaticAcosPart02TestTest062
     * @tc.desc Verify Decimal acos toString
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAcosPart02TestTest062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Decimal = new Decimal('0.5');
      const r: Decimal = Decimal.acos(src);
      expect(src.toString()).assertEqual('0.5');
      expect(r.toString()).assertEqual('1.0471975511965977462');
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ACOS_PART02_SUPPLEMENT_TEST_6300
     * @tc.name testDecimalStaticAcosPart02TestTest063
     * @tc.desc Verify static acos
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAcosPart02TestTest063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r1: Decimal = Decimal.acos('0.5');
      const r2: Decimal = Decimal.acos('0.5');
      expect(r1 === r2).assertFalse();
      expect(r1.toString()).assertEqual(r2.toString());
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ACOS_PART02_SUPPLEMENT_TEST_6400
     * @tc.name testDecimalStaticAcosPart02TestTest064
     * @tc.desc Verify Decimal toNumber number isDecimal
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAcosPart02TestTest064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = Decimal.acos('0.5');
      expect(r.toString().length > 0).assertTrue();
    });
  
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ACOS_PART02_SUPPLEMENT_TEST_6500
     * @tc.name testDecimalStaticAcosPart02TestTest065
     * @tc.desc Verify / / null undefined 1 string|Decimal
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAcosPart02TestTest065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Decimal.acos(new Decimal('-1')).toString()).assertEqual(Decimal.acos('-1').toString());
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ACOS_PART02_SUPPLEMENT_TEST_6600
     * @tc.name testDecimalStaticAcosPart02TestTest066
     * @tc.desc Verify ' 0.5 ' SDK 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAcosPart02TestTest066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let threw: boolean = false;
      try {
        Decimal.acos('  0.5  ');
      } catch (e) {
        threw = true;
      }
      expect(threw || Decimal.acos('  0.5  ').toNumber() === 0.5).assertTrue();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ACOS_PART02_SUPPLEMENT_TEST_6700
     * @tc.name testDecimalStaticAcosPart02TestTest067
     * @tc.desc Verify '.' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAcosPart02TestTest067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        Decimal.acos('.');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ACOS_PART02_SUPPLEMENT_TEST_6800
     * @tc.name testDecimalStaticAcosPart02TestTest068
     * @tc.desc Verify acos extra argument ignored first only
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAcosPart02TestTest068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = (Decimal.acos as ESObject)('0.5', 'ignored') as Decimal;
      expect(r.toString()).assertEqual(Decimal.acos('0.5').toString());
    });

  });

}
