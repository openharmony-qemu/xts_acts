
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

export default function decimalPropertiesPart02TestTest() {
  describe('DecimalPropertiesPart02TestTest', () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART02_SUPPLEMENT_TEST_0100
     * @tc.name testDecimalPropertiesPart02TestTest001
     * @tc.desc Verify '123.45' d [1,2,3,4,5]
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart02TestTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: Decimal = new Decimal('123.45');
      let dd: number[] = dec.d;
      expect(dd.length).assertEqual(2);
      expect(dd[0]).assertEqual(123);
      expect(dd[1]).assertEqual(4500000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART02_SUPPLEMENT_TEST_0200
     * @tc.name testDecimalPropertiesPart02TestTest002
     * @tc.desc Verify '0.00123' d [1,2,3]
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart02TestTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: Decimal = new Decimal('0.00123');
      let dd: number[] = dec.d;
      expect(dd.length).assertEqual(1);
      expect(dd[0]).assertEqual(12300);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART02_SUPPLEMENT_TEST_0300
     * @tc.name testDecimalPropertiesPart02TestTest003
     * @tc.desc Verify '0' d [0] 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart02TestTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: Decimal = new Decimal('0');
      let dd: number[] = dec.d;
      expect(dd.length).assertEqual(1);
      expect(dd[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART02_SUPPLEMENT_TEST_0400
     * @tc.name testDecimalPropertiesPart02TestTest004
     * @tc.desc Verify '-987.65' d [9,8,7,6,5]
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart02TestTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: Decimal = new Decimal('-987.65');
      let dd: number[] = dec.d;
      expect(dd.length).assertEqual(2);
      expect(dd[0]).assertEqual(987);
      expect(dd[1]).assertEqual(6500000);
            expect(dd[3]).assertEqual(undefined);
      expect(dd[4]).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART02_SUPPLEMENT_TEST_0500
     * @tc.name testDecimalPropertiesPart02TestTest005
     * @tc.desc Verify '1.2300' d length 2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart02TestTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: Decimal = new Decimal('1.2300');
      let dd: number[] = dec.d;
      expect(dd.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART02_SUPPLEMENT_TEST_0600
     * @tc.name testDecimalPropertiesPart02TestTest006
     * @tc.desc Verify '000123' d [1,2,3]
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart02TestTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: Decimal = new Decimal('000123');
      let dd: number[] = dec.d;
      expect(dd.length).assertEqual(1);
      expect(dd[0]).assertEqual(123);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART02_SUPPLEMENT_TEST_0700
     * @tc.name testDecimalPropertiesPart02TestTest007
     * @tc.desc Verify '1e-7' d [1]
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart02TestTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: Decimal = new Decimal('1e-7');
      let dd: number[] = dec.d;
      expect(dd.length).assertEqual(1);
      expect(dd[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART02_SUPPLEMENT_TEST_0800
     * @tc.name testDecimalPropertiesPart02TestTest008
     * @tc.desc Verify '0.000' d [0]
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart02TestTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: Decimal = new Decimal('0.000');
      let dd: number[] = dec.d;
      expect(dd.length).assertEqual(1);
      expect(dd[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART02_SUPPLEMENT_TEST_0900
     * @tc.name testDecimalPropertiesPart02TestTest009
     * @tc.desc Verify '100' d [1]
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart02TestTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: Decimal = new Decimal('100');
      let dd: number[] = dec.d;
      expect(dd.length).assertEqual(1);
      expect(dd[0]).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART02_SUPPLEMENT_TEST_1000
     * @tc.name testDecimalPropertiesPart02TestTest010
     * @tc.desc Verify '9e15' d [9]
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart02TestTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: Decimal = new Decimal('9e15');
      let dd: number[] = dec.d;
      expect(dd.length).assertEqual(1);
      expect(dd[0]).assertEqual(90);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART02_SUPPLEMENT_TEST_1100
     * @tc.name testDecimalPropertiesPart02TestTest011
     * @tc.desc Verify '5.' d [5]
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart02TestTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: Decimal = new Decimal('5.');
      let dd: number[] = dec.d;
      expect(dd.length).assertEqual(1);
      expect(dd[0]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART02_SUPPLEMENT_TEST_1200
     * @tc.name testDecimalPropertiesPart02TestTest012
     * @tc.desc Verify '.5' d [5]
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart02TestTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: Decimal = new Decimal('.5');
      let dd: number[] = dec.d;
      expect(dd.length).assertEqual(1);
      expect(dd[0]).assertEqual(5000000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART02_SUPPLEMENT_TEST_1300
     * @tc.name testDecimalPropertiesPart02TestTest013
     * @tc.desc Verify '1.5e3' d [1,5]
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart02TestTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: Decimal = new Decimal('1.5e3');
      let dd: number[] = dec.d;
      expect(dd.length).assertEqual(1);
      expect(dd[0]).assertEqual(1500);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART02_SUPPLEMENT_TEST_1400
     * @tc.name testDecimalPropertiesPart02TestTest014
     * @tc.desc Verify 100 '1'.repeat(100) d 100
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart02TestTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let longNum: string = '1'.repeat(100);
      let dec: Decimal = new Decimal(longNum);
      expect(dec.d.length).assertEqual(15);
      expect(dec.d[0]).assertEqual(11);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART02_SUPPLEMENT_TEST_1500
     * @tc.name testDecimalPropertiesPart02TestTest015
     * @tc.desc Verify 50 9 '9'.repeat(50) d 50 9
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart02TestTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: Decimal = new Decimal('9'.repeat(50));
      expect(dec.d.length).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART02_SUPPLEMENT_TEST_1600
     * @tc.name testDecimalPropertiesPart02TestTest016
     * @tc.desc Verify 30 '0.' + '9'.repeat(30) d 30
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart02TestTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let frac: string = '0.' + '9'.repeat(30);
      let dec: Decimal = new Decimal(frac);
      expect(dec.d.length).assertEqual(5);
      expect(dec.d[0]).assertEqual(9999999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART02_SUPPLEMENT_TEST_1700
     * @tc.name testDecimalPropertiesPart02TestTest017
     * @tc.desc Verify d Array.isArray
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart02TestTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: Decimal = new Decimal('123.45');
      expect(Array.isArray(dec.d)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART02_SUPPLEMENT_TEST_1800
     * @tc.name testDecimalPropertiesPart02TestTest018
     * @tc.desc Verify d stores base-1e7 chunks, elements not limited to single digits 0~9
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart02TestTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: Decimal = new Decimal('123456789.987654321');
      let dd: number[] = dec.d;
      let allValid: boolean = true;
      for (let i = 0; i < dd.length; i++) {
        if (typeof dd[i] !== 'number' || dd[i] < 0 || dd[i] > 9) {
          allValid = false;
        }
      }
      expect(allValid).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART02_SUPPLEMENT_TEST_1900
     * @tc.name testDecimalPropertiesPart02TestTest019
     * @tc.desc Verify '1' e 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart02TestTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: Decimal = new Decimal('1');
      expect(dec.e).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART02_SUPPLEMENT_TEST_2000
     * @tc.name testDecimalPropertiesPart02TestTest020
     * @tc.desc Verify '0.1' e -1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart02TestTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: Decimal = new Decimal('0.1');
      expect(dec.e).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART02_SUPPLEMENT_TEST_2100
     * @tc.name testDecimalPropertiesPart02TestTest021
     * @tc.desc Verify '9e15' e 15
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart02TestTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: Decimal = new Decimal('9e15');
      expect(dec.e).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART02_SUPPLEMENT_TEST_2200
     * @tc.name testDecimalPropertiesPart02TestTest022
     * @tc.desc Verify '5E+2' E e 2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart02TestTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: Decimal = new Decimal('5E+2');
      expect(dec.e).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART02_SUPPLEMENT_TEST_2300
     * @tc.name testDecimalPropertiesPart02TestTest023
     * @tc.desc Verify '0.0000001' e -7
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart02TestTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: Decimal = new Decimal('0.0000001');
      expect(dec.e).assertEqual(-7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART02_SUPPLEMENT_TEST_2400
     * @tc.name testDecimalPropertiesPart02TestTest024
     * @tc.desc Verify '123456789.123' e 8 9 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart02TestTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: Decimal = new Decimal('123456789.123');
      expect(dec.e).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART02_SUPPLEMENT_TEST_2500
     * @tc.name testDecimalPropertiesPart02TestTest025
     * @tc.desc Verify '0' e 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart02TestTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: Decimal = new Decimal('0');
      expect(dec.e).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART02_SUPPLEMENT_TEST_2600
     * @tc.name testDecimalPropertiesPart02TestTest026
     * @tc.desc Verify '1e-100' e -100
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart02TestTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: Decimal = new Decimal('1e-100');
      expect(dec.e).assertEqual(-100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART02_SUPPLEMENT_TEST_2700
     * @tc.name testDecimalPropertiesPart02TestTest027
     * @tc.desc Verify '1e100' e 100
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart02TestTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: Decimal = new Decimal('1e100');
      expect(dec.e).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART02_SUPPLEMENT_TEST_2800
     * @tc.name testDecimalPropertiesPart02TestTest028
     * @tc.desc Verify '0e0' e 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart02TestTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: Decimal = new Decimal('0e0');
      expect(dec.e).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART02_SUPPLEMENT_TEST_2900
     * @tc.name testDecimalPropertiesPart02TestTest029
     * @tc.desc Verify '5' s 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart02TestTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: Decimal = new Decimal('5');
      expect(dec.s).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART02_SUPPLEMENT_TEST_3000
     * @tc.name testDecimalPropertiesPart02TestTest030
     * @tc.desc Verify '-5' s 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart02TestTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: Decimal = new Decimal('-5');
      expect(dec.s).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART02_SUPPLEMENT_TEST_3100
     * @tc.name testDecimalPropertiesPart02TestTest031
     * @tc.desc Verify '0' s 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart02TestTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: Decimal = new Decimal('0');
      expect(dec.s).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART02_SUPPLEMENT_TEST_3200
     * @tc.name testDecimalPropertiesPart02TestTest032
     * @tc.desc Verify '-0' s 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart02TestTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: Decimal = new Decimal('-0');
      expect(dec.s).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART02_SUPPLEMENT_TEST_3300
     * @tc.name testDecimalPropertiesPart02TestTest033
     * @tc.desc Verify '0.000' s 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart02TestTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: Decimal = new Decimal('0.000');
      expect(dec.s).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART02_SUPPLEMENT_TEST_3400
     * @tc.name testDecimalPropertiesPart02TestTest034
     * @tc.desc Verify '-0.000' s 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart02TestTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: Decimal = new Decimal('-0.000');
      expect(dec.s).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART02_SUPPLEMENT_TEST_3500
     * @tc.name testDecimalPropertiesPart02TestTest035
     * @tc.desc Verify '1e3' s 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart02TestTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: Decimal = new Decimal('1e3');
      expect(dec.s).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART02_SUPPLEMENT_TEST_3600
     * @tc.name testDecimalPropertiesPart02TestTest036
     * @tc.desc Verify '-1e3' s 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart02TestTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: Decimal = new Decimal('-1e3');
      expect(dec.s).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART02_SUPPLEMENT_TEST_3700
     * @tc.name testDecimalPropertiesPart02TestTest037
     * @tc.desc Verify '+5' s 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart02TestTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: Decimal = new Decimal('+5');
      expect(dec.s).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART02_SUPPLEMENT_TEST_3800
     * @tc.name testDecimalPropertiesPart02TestTest038
     * @tc.desc Verify '.5' s 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart02TestTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: Decimal = new Decimal('.5');
      expect(dec.s).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART02_SUPPLEMENT_TEST_3900
     * @tc.name testDecimalPropertiesPart02TestTest039
     * @tc.desc Verify '-.5' s 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart02TestTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: Decimal = new Decimal('-.5');
      expect(dec.s).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART02_SUPPLEMENT_TEST_4000
     * @tc.name testDecimalPropertiesPart02TestTest040
     * @tc.desc Verify '9e15' s 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart02TestTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: Decimal = new Decimal('9e15');
      expect(dec.s).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART02_SUPPLEMENT_TEST_4100
     * @tc.name testDecimalPropertiesPart02TestTest041
     * @tc.desc Verify '-1e-7' s 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart02TestTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: Decimal = new Decimal('-1e-7');
      expect(dec.s).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART02_SUPPLEMENT_TEST_4200
     * @tc.name testDecimalPropertiesPart02TestTest042
     * @tc.desc Verify '5.' s 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart02TestTest042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: Decimal = new Decimal('5.');
      expect(dec.s).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART02_SUPPLEMENT_TEST_4300
     * @tc.name testDecimalPropertiesPart02TestTest043
     * @tc.desc Verify d
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart02TestTest043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: Decimal = new Decimal('123.45');
      let first: number[] = dec.d;
      let second: number[] = dec.d;
      expect(first.length).assertEqual(second.length);
      expect(first[0]).assertEqual(second[0]);
      expect(first[4]).assertEqual(second[4]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART02_SUPPLEMENT_TEST_4400
     * @tc.name testDecimalPropertiesPart02TestTest044
     * @tc.desc Verify e s
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart02TestTest044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: Decimal = new Decimal('-123.45');
      expect(dec.e).assertEqual(2);
      expect(dec.s).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART02_SUPPLEMENT_TEST_4500
     * @tc.name testDecimalPropertiesPart02TestTest045
     * @tc.desc Verify d/e/s toString digits 10^(e-len+1)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart02TestTest045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: Decimal = new Decimal('123.45');
      let dd: number[] = dec.d;
      let acc: number = 0;
      for (let i = 0; i < dd.length; i++) {
        acc = acc * 10 + dd[i];
      }
      let recon: number = acc * Math.pow(10, dec.e - dd.length + 1);
      expect(Math.abs(recon - dec.toNumber()) < 1e-9).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART02_SUPPLEMENT_TEST_4600
     * @tc.name testDecimalPropertiesPart02TestTest046
     * @tc.desc Verify d
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart02TestTest046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Decimal = new Decimal('123');
      let b: Decimal = new Decimal('456');
      expect(a.d[0]).assertEqual(123);
      expect(b.d[0]).assertEqual(456);
      expect(a.d.length).assertEqual(1);
      expect(b.d.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART02_SUPPLEMENT_TEST_4700
     * @tc.name testDecimalPropertiesPart02TestTest047
     * @tc.desc Verify s=1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart02TestTest047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: Decimal = new Decimal('-42');
      expect(dec.s).assertEqual(-1);
      expect(dec.toNumber() < 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART02_SUPPLEMENT_TEST_4800
     * @tc.name testDecimalPropertiesPart02TestTest048
     * @tc.desc Verify Infinity s 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart02TestTest048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: Decimal = new Decimal('Infinity');
      expect(dec.toString()).assertEqual('Infinity');
      expect(dec.s).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART02_SUPPLEMENT_TEST_4900
     * @tc.name testDecimalPropertiesPart02TestTest049
     * @tc.desc Verify '-Infinity' s 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart02TestTest049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: Decimal = new Decimal('-Infinity');
      expect(dec.toString()).assertEqual('-Infinity');
      expect(dec.s).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART02_SUPPLEMENT_TEST_5000
     * @tc.name testDecimalPropertiesPart02TestTest050
     * @tc.desc Verify 'NaN' toString 'NaN'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart02TestTest050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: Decimal = new Decimal('NaN');
      expect(dec.toString()).assertEqual('NaN');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART02_SUPPLEMENT_TEST_5100
     * @tc.name testDecimalPropertiesPart02TestTest051
     * @tc.desc Verify ROUND_UP 2.5 0 3
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart02TestTest051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: Decimal = new Decimal('2.5');
      expect(dec.toDecimalPlaces(0, Decimal.ROUND_UP).toString()).assertEqual('3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART02_SUPPLEMENT_TEST_5200
     * @tc.name testDecimalPropertiesPart02TestTest052
     * @tc.desc Verify ROUND_DOWN 2.5 0 2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart02TestTest052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: Decimal = new Decimal('2.5');
      expect(dec.toDecimalPlaces(0, Decimal.ROUND_DOWN).toString()).assertEqual('2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART02_SUPPLEMENT_TEST_5300
     * @tc.name testDecimalPropertiesPart02TestTest053
     * @tc.desc Verify ROUND_HALF_UP 2.5 3
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart02TestTest053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: Decimal = new Decimal('2.5');
      expect(dec.toDecimalPlaces(0, Decimal.ROUND_HALF_UP).toString()).assertEqual('3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART02_SUPPLEMENT_TEST_5400
     * @tc.name testDecimalPropertiesPart02TestTest054
     * @tc.desc Verify EUCLIDEAN -3 mod 2 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart02TestTest054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ modulo: Decimal.EUCLIDEAN });
      let r: Decimal = new Decimal('-3').mod(new Decimal('2'));
      expect(r.toString()).assertEqual('1');
      Decimal.set({ defaults: true });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART02_SUPPLEMENT_TEST_5500
     * @tc.name testDecimalPropertiesPart02TestTest055
     * @tc.desc Verify ROUND_FLOOR 2.5 0 2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart02TestTest055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: Decimal = new Decimal('2.5');
      expect(dec.toDecimalPlaces(0, Decimal.ROUND_FLOOR).toString()).assertEqual('2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART02_SUPPLEMENT_TEST_5600
     * @tc.name testDecimalPropertiesPart02TestTest056
     * @tc.desc Verify ROUND_CEILING 2.5 0 3
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart02TestTest056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: Decimal = new Decimal('2.5');
      expect(dec.toDecimalPlaces(0, Decimal.ROUND_CEILING).toString()).assertEqual('3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART02_SUPPLEMENT_TEST_5700
     * @tc.name testDecimalPropertiesPart02TestTest057
     * @tc.desc Verify '0x10' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart02TestTest057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let d: Decimal = new Decimal('0x10');
      } catch (e) {
      expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART02_SUPPLEMENT_TEST_5800
     * @tc.name testDecimalPropertiesPart02TestTest058
     * @tc.desc Verify '0b101' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart02TestTest058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let d: Decimal = new Decimal('0b101');
      } catch (e) {
      expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART02_SUPPLEMENT_TEST_5900
     * @tc.name testDecimalPropertiesPart02TestTest059
     * @tc.desc Verify '0o17' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart02TestTest059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let d: Decimal = new Decimal('0o17');
      } catch (e) {
      expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART02_SUPPLEMENT_TEST_6000
     * @tc.name testDecimalPropertiesPart02TestTest060
     * @tc.desc Verify '1_000' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart02TestTest060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let d: Decimal = new Decimal('1_000');
      } catch (e) {
      expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART02_SUPPLEMENT_TEST_6100
     * @tc.name testDecimalPropertiesPart02TestTest061
     * @tc.desc Verify '1.2.3' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart02TestTest061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let d: Decimal = new Decimal('1.2.3');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART02_SUPPLEMENT_TEST_6200
     * @tc.name testDecimalPropertiesPart02TestTest062
     * @tc.desc Verify '--5' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart02TestTest062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let d: Decimal = new Decimal('--5');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART02_SUPPLEMENT_TEST_6300
     * @tc.name testDecimalPropertiesPart02TestTest063
     * @tc.desc Verify '5e' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart02TestTest063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let d: Decimal = new Decimal('5e');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART02_SUPPLEMENT_TEST_6400
     * @tc.name testDecimalPropertiesPart02TestTest064
     * @tc.desc Verify 'e5' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart02TestTest064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let d: Decimal = new Decimal('e5');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART02_SUPPLEMENT_TEST_6500
     * @tc.name testDecimalPropertiesPart02TestTest065
     * @tc.desc Verify - ' ' 401 ASCII
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart02TestTest065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let d: Decimal = new Decimal('١٢٣');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART02_SUPPLEMENT_TEST_6600
     * @tc.name testDecimalPropertiesPart02TestTest066
     * @tc.desc Verify ' ' 401 Unicode
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart02TestTest066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let d: Decimal = new Decimal('¹');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART02_SUPPLEMENT_TEST_6700
     * @tc.name testDecimalPropertiesPart02TestTest067
     * @tc.desc Verify ' ' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart02TestTest067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let d: Decimal = new Decimal('Ⅻ');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART02_SUPPLEMENT_TEST_6800
     * @tc.name testDecimalPropertiesPart02TestTest068
     * @tc.desc Verify ' ' 401 Unicode
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart02TestTest068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let d: Decimal = new Decimal('∞');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART02_SUPPLEMENT_TEST_6900
     * @tc.name testDecimalPropertiesPart02TestTest069
     * @tc.desc Verify ' ' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart02TestTest069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let d: Decimal = new Decimal('五');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART02_SUPPLEMENT_TEST_7000
     * @tc.name testDecimalPropertiesPart02TestTest070
     * @tc.desc Verify '1 5' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart02TestTest070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let d: Decimal = new Decimal('1。5');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART02_SUPPLEMENT_TEST_7100
     * @tc.name testDecimalPropertiesPart02TestTest071
     * @tc.desc Verify '1 5' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart02TestTest071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let d: Decimal = new Decimal('1٫5');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART02_SUPPLEMENT_TEST_7200
     * @tc.name testDecimalPropertiesPart02TestTest072
     * @tc.desc Verify ' 5' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart02TestTest072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let d: Decimal = new Decimal('－5');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART02_SUPPLEMENT_TEST_7300
     * @tc.name testDecimalPropertiesPart02TestTest073
     * @tc.desc Verify emoji '5 ' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart02TestTest073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let d: Decimal = new Decimal('5👾');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART02_SUPPLEMENT_TEST_7400
     * @tc.name testDecimalPropertiesPart02TestTest074
     * @tc.desc Verify emoji ' ' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart02TestTest074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let d: Decimal = new Decimal('👾');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART02_SUPPLEMENT_TEST_7500
     * @tc.name testDecimalPropertiesPart02TestTest075
     * @tc.desc Verify '\uD800' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart02TestTest075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let d: Decimal = new Decimal('\uD800');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART02_SUPPLEMENT_TEST_7600
     * @tc.name testDecimalPropertiesPart02TestTest076
     * @tc.desc Verify '5\uDC00' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart02TestTest076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let d: Decimal = new Decimal('5\uDC00');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART02_SUPPLEMENT_TEST_7700
     * @tc.name testDecimalPropertiesPart02TestTest077
     * @tc.desc Verify '\uD8005' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart02TestTest077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let d: Decimal = new Decimal('\uD8005');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART02_SUPPLEMENT_TEST_7800
     * @tc.name testDecimalPropertiesPart02TestTest078
     * @tc.desc Verify XSS '<script>alert(1)</script>' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart02TestTest078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let d: Decimal = new Decimal('<script>alert(1)</script>');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART02_SUPPLEMENT_TEST_7900
     * @tc.name testDecimalPropertiesPart02TestTest079
     * @tc.desc Verify HTML '"><img src=x onerror=alert(1)>' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart02TestTest079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let d: Decimal = new Decimal('"><img src=x onerror=alert(1)>');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART02_SUPPLEMENT_TEST_8000
     * @tc.name testDecimalPropertiesPart02TestTest080
     * @tc.desc Verify '1;<script>' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart02TestTest080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let d: Decimal = new Decimal('1;<script>');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART02_SUPPLEMENT_TEST_8100
     * @tc.name testDecimalPropertiesPart02TestTest081
     * @tc.desc Verify '1'.repeat(300)+'x' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart02TestTest081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let d: Decimal = new Decimal('1'.repeat(300) + 'x');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART02_SUPPLEMENT_TEST_8200
     * @tc.name testDecimalPropertiesPart02TestTest082
     * @tc.desc Verify '5\t' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart02TestTest082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let d: Decimal = new Decimal('5\t');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART02_SUPPLEMENT_TEST_8300
     * @tc.name testDecimalPropertiesPart02TestTest083
     * @tc.desc Verify '\\5' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart02TestTest083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let d: Decimal = new Decimal('\\5');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART02_SUPPLEMENT_TEST_8400
     * @tc.name testDecimalPropertiesPart02TestTest084
     * @tc.desc Verify Unicode '1e ' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart02TestTest084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let d: Decimal = new Decimal('1e²');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART02_SUPPLEMENT_TEST_8500
     * @tc.name testDecimalPropertiesPart02TestTest085
     * @tc.desc Verify ' ' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart02TestTest085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let d: Decimal = new Decimal('𝟙𝟚𝟛');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART02_SUPPLEMENT_TEST_8600
     * @tc.name testDecimalPropertiesPart02TestTest086
     * @tc.desc Verify 'e' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart02TestTest086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let d: Decimal = new Decimal('e');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART02_SUPPLEMENT_TEST_8700
     * @tc.name testDecimalPropertiesPart02TestTest087
     * @tc.desc Verify '\t5' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart02TestTest087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let d: Decimal = new Decimal('\t5');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART02_SUPPLEMENT_TEST_8800
     * @tc.name testDecimalPropertiesPart02TestTest088
     * @tc.desc Verify '50%' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart02TestTest088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let d: Decimal = new Decimal('50%');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART02_SUPPLEMENT_TEST_8900
     * @tc.name testDecimalPropertiesPart02TestTest089
     * @tc.desc Verify '$12' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart02TestTest089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let d: Decimal = new Decimal('$12');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART02_SUPPLEMENT_TEST_9000
     * @tc.name testDecimalPropertiesPart02TestTest090
     * @tc.desc Verify string '42' d=[4,2] e=1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart02TestTest090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: Decimal = new Decimal('42');
      expect(dec.d.length).assertEqual(1);
      expect(dec.d[0]).assertEqual(42);
      expect(dec.e).assertEqual(1);
      expect(dec.s).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART02_SUPPLEMENT_TEST_9100
     * @tc.name testDecimalPropertiesPart02TestTest091
     * @tc.desc Verify number 42 d=[4,2] e=1 string
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart02TestTest091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: Decimal = new Decimal(42);
      expect(dec.d.length).assertEqual(1);
      expect(dec.d[0]).assertEqual(42);
      expect(dec.e).assertEqual(1);
      expect(dec.s).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART02_SUPPLEMENT_TEST_9200
     * @tc.name testDecimalPropertiesPart02TestTest092
     * @tc.desc Verify Decimal d/e/s
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart02TestTest092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inner: Decimal = new Decimal('42');
      let dec: Decimal = new Decimal(inner);
      expect(dec.d[0]).assertEqual(42);
      expect(dec.e).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART02_SUPPLEMENT_TEST_9300
     * @tc.name testDecimalPropertiesPart02TestTest093
     * @tc.desc Verify '-42'/-42/Decimal('-42') s=1 d
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart02TestTest093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Decimal = new Decimal('-42');
      let b: Decimal = new Decimal(-42);
      let c: Decimal = new Decimal(new Decimal('-42'));
      expect(a.s).assertEqual(-1);
      expect(b.s).assertEqual(-1);
      expect(c.s).assertEqual(-1);
      expect(a.d[0]).assertEqual(42);
      expect(b.d[0]).assertEqual(42);
      expect(c.d[0]).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART02_SUPPLEMENT_TEST_9400
     * @tc.name testDecimalPropertiesPart02TestTest094
     * @tc.desc Verify '1e3' number 1000 Decimal(1000) d/e
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart02TestTest094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let viaString: Decimal = new Decimal('1e3');
      let viaNumber: Decimal = new Decimal(1000);
      let viaDecimal: Decimal = new Decimal(new Decimal('1000'));
      expect(viaString.e).assertEqual(3);
      expect(viaNumber.e).assertEqual(3);
      expect(viaDecimal.e).assertEqual(3);
      expect(viaString.d[0]).assertEqual(1000);
      expect(viaNumber.d[0]).assertEqual(1000);
      expect(viaDecimal.d[0]).assertEqual(1000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART02_SUPPLEMENT_TEST_9500
     * @tc.name testDecimalPropertiesPart02TestTest095
     * @tc.desc Verify number -0 s=1 number
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart02TestTest095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: Decimal = new Decimal(-0);
      expect(dec.s).assertEqual(-1);
      expect(dec.d[0]).assertEqual(0);
      expect(dec.e).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART02_SUPPLEMENT_TEST_9600
     * @tc.name testDecimalPropertiesPart02TestTest096
     * @tc.desc Verify number 0.5 d=[5] e=-1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart02TestTest096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: Decimal = new Decimal(0.5);
      expect(dec.d.length).assertEqual(1);
      expect(dec.d[0]).assertEqual(5000000);
      expect(dec.e).assertEqual(-1);
      expect(dec.s).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART02_SUPPLEMENT_TEST_9700
     * @tc.name testDecimalPropertiesPart02TestTest097
     * @tc.desc Verify string '7.500' number 7.5 d
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart02TestTest097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let viaString: Decimal = new Decimal('7.500');
      let viaNumber: Decimal = new Decimal(7.5);
      expect(viaString.d.length).assertEqual(2);
      expect(viaNumber.d.length).assertEqual(2);
      expect(viaString.d[0]).assertEqual(7);
      expect(viaNumber.d[1]).assertEqual(5000000);
    });


  });

}
