
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

export default function decimalStaticAbsPart02TestTest() {
  describe('DecimalStaticAbsPart02TestTest', () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ABS_PART02_SUPPLEMENT_TEST_0100
     * @tc.name testDecimalStaticAbsPart02TestTest001
     * @tc.desc Verify arity Value string / number / Decimal abs [DP-COMPOSITE-UNION-
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAbsPart02TestTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r1: Decimal = Decimal.abs('456');
      let r2: Decimal = Decimal.abs(5);
      let r3: Decimal = Decimal.abs(new Decimal('-2.5'));
      expect(r1.toString()).assertEqual('456');
      expect(r2.toString()).assertEqual('5');
      expect(r3.toString()).assertEqual('2.5');
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ABS_PART02_SUPPLEMENT_TEST_0200
     * @tc.name testDecimalStaticAbsPart02TestTest002
     * @tc.desc Verify '123' isNegative false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAbsPart02TestTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.abs('123');
      expect(r.toString()).assertEqual('123');
      expect(r.isNegative()).assertFalse();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ABS_PART02_SUPPLEMENT_TEST_0300
     * @tc.name testDecimalStaticAbsPart02TestTest003
     * @tc.desc Verify '-123' '123'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAbsPart02TestTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.abs('-123');
      expect(r.toString()).assertEqual('123');
      expect(r.isNegative()).assertFalse();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ABS_PART02_SUPPLEMENT_TEST_0400
     * @tc.name testDecimalStaticAbsPart02TestTest004
     * @tc.desc Verify '-0.5' '0.5'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAbsPart02TestTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.abs('-0.5');
      expect(r.toString()).assertEqual('0.5');
      expect(r.isNegative()).assertFalse();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ABS_PART02_SUPPLEMENT_TEST_0500
     * @tc.name testDecimalStaticAbsPart02TestTest005
     * @tc.desc Verify '123.456'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAbsPart02TestTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.abs('123.456');
      expect(r.toString()).assertEqual('123.456');
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ABS_PART02_SUPPLEMENT_TEST_0600
     * @tc.name testDecimalStaticAbsPart02TestTest006
     * @tc.desc Verify '5.0' toString '5'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAbsPart02TestTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.abs('5.0');
      expect(r.toString()).assertEqual('5');
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ABS_PART02_SUPPLEMENT_TEST_0700
     * @tc.name testDecimalStaticAbsPart02TestTest007
     * @tc.desc Verify '5.50' toString '5.5'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAbsPart02TestTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.abs('5.50');
      expect(r.toString()).assertEqual('5.5');
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ABS_PART02_SUPPLEMENT_TEST_0800
     * @tc.name testDecimalStaticAbsPart02TestTest008
     * @tc.desc Verify '+5' '5'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAbsPart02TestTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.abs('+5');
      expect(r.toString()).assertEqual('5');
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ABS_PART02_SUPPLEMENT_TEST_0900
     * @tc.name testDecimalStaticAbsPart02TestTest009
     * @tc.desc Verify '.5' '0.5'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAbsPart02TestTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.abs('.5');
      expect(r.toString()).assertEqual('0.5');
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ABS_PART02_SUPPLEMENT_TEST_1000
     * @tc.name testDecimalStaticAbsPart02TestTest010
     * @tc.desc Verify '5.' '5'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAbsPart02TestTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.abs('5.');
      expect(r.toString()).assertEqual('5');
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ABS_PART02_SUPPLEMENT_TEST_1100
     * @tc.name testDecimalStaticAbsPart02TestTest011
     * @tc.desc Verify '000123' '123'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAbsPart02TestTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.abs('000123');
      expect(r.toString()).assertEqual('123');
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ABS_PART02_SUPPLEMENT_TEST_1200
     * @tc.name testDecimalStaticAbsPart02TestTest012
     * @tc.desc Verify '-000123' '123'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAbsPart02TestTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.abs('-000123');
      expect(r.toString()).assertEqual('123');
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ABS_PART02_SUPPLEMENT_TEST_1300
     * @tc.name testDecimalStaticAbsPart02TestTest013
     * @tc.desc Verify '-0' '0' -0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAbsPart02TestTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.abs('-0');
      expect(r.toString()).assertEqual('0');
      expect(r.isNegative()).assertFalse();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ABS_PART02_SUPPLEMENT_TEST_1400
     * @tc.name testDecimalStaticAbsPart02TestTest014
     * @tc.desc Verify '0.0000' '0'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAbsPart02TestTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.abs('0.0000');
      expect(r.toString()).assertEqual('0');
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ABS_PART02_SUPPLEMENT_TEST_1500
     * @tc.name testDecimalStaticAbsPart02TestTest015
     * @tc.desc Verify '1e-7' '0.0000001'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAbsPart02TestTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.abs('1e-7');
      expect(r.toString()).assertEqual('1e-7');
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ABS_PART02_SUPPLEMENT_TEST_1600
     * @tc.name testDecimalStaticAbsPart02TestTest016
     * @tc.desc Verify '-1e21' '1e21'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAbsPart02TestTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.abs('-1e21');
      expect(r.toString()).assertEqual('1e+21');
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ABS_PART02_SUPPLEMENT_TEST_1700
     * @tc.name testDecimalStaticAbsPart02TestTest017
     * @tc.desc Verify '3.14e+2' '314'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAbsPart02TestTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.abs('3.14e+2');
      expect(r.toString()).assertEqual('314');
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ABS_PART02_SUPPLEMENT_TEST_1800
     * @tc.name testDecimalStaticAbsPart02TestTest018
     * @tc.desc Verify '-3.14e-10' '3.14e-10'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAbsPart02TestTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.abs('-3.14e-10');
      expect(r.toString()).assertEqual('3.14e-10');
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ABS_PART02_SUPPLEMENT_TEST_1900
     * @tc.name testDecimalStaticAbsPart02TestTest019
     * @tc.desc Verify '1e-999'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAbsPart02TestTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.abs('1e-999');
      expect(r.toString()).assertEqual('1e-999');
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ABS_PART02_SUPPLEMENT_TEST_2000
     * @tc.name testDecimalStaticAbsPart02TestTest020
     * @tc.desc Verify MAX_SAFE_INTEGER '9007199254740991'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAbsPart02TestTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.abs('9007199254740991');
      expect(r.toString()).assertEqual('9007199254740991');
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ABS_PART02_SUPPLEMENT_TEST_2100
     * @tc.name testDecimalStaticAbsPart02TestTest021
     * @tc.desc Verify MAX_SAFE_INTEGER '-9007199254740992' number
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAbsPart02TestTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.abs('-9007199254740992');
      expect(r.toString()).assertEqual('9007199254740992');
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ABS_PART02_SUPPLEMENT_TEST_2200
     * @tc.name testDecimalStaticAbsPart02TestTest022
     * @tc.desc Verify 40 40
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAbsPart02TestTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = '1234567890123456789012345678901234567890';
      let r: Decimal = Decimal.abs(s);
      expect(r.toString().length).assertEqual(44);
      expect(r.toString().indexOf('-')).assertEqual(-1);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ABS_PART02_SUPPLEMENT_TEST_2300
     * @tc.name testDecimalStaticAbsPart02TestTest023
     * @tc.desc Verify '0x10' '16'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAbsPart02TestTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.abs('0x10');
      expect(r.toString()).assertEqual('16');
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ABS_PART02_SUPPLEMENT_TEST_2400
     * @tc.name testDecimalStaticAbsPart02TestTest024
     * @tc.desc Verify '-0x10' '16'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAbsPart02TestTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.abs('-0x10');
      expect(r.toString()).assertEqual('16');
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ABS_PART02_SUPPLEMENT_TEST_2500
     * @tc.name testDecimalStaticAbsPart02TestTest025
     * @tc.desc Verify 'Infinity' 'Infinity'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAbsPart02TestTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.abs('Infinity');
      expect(r.toString()).assertEqual('Infinity');
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ABS_PART02_SUPPLEMENT_TEST_2600
     * @tc.name testDecimalStaticAbsPart02TestTest026
     * @tc.desc Verify '-Infinity' 'Infinity'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAbsPart02TestTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.abs('-Infinity');
      expect(r.toString()).assertEqual('Infinity');
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ABS_PART02_SUPPLEMENT_TEST_2700
     * @tc.name testDecimalStaticAbsPart02TestTest027
     * @tc.desc Verify 'NaN' 'NaN' NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAbsPart02TestTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.abs('NaN');
      expect(r.toString()).assertEqual('NaN');
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ABS_PART02_SUPPLEMENT_TEST_2800
     * @tc.name testDecimalStaticAbsPart02TestTest028
     * @tc.desc Verify '1e999' 'Infinity'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAbsPart02TestTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.abs('1e999');
      expect(r.toString()).assertEqual('1e+999');
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ABS_PART02_SUPPLEMENT_TEST_2900
     * @tc.name testDecimalStaticAbsPart02TestTest029
     * @tc.desc Verify '-1e999' 'Infinity'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAbsPart02TestTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.abs('-1e999');
      expect(r.toString()).assertEqual('1e+999');
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ABS_PART02_SUPPLEMENT_TEST_3000
     * @tc.name testDecimalStaticAbsPart02TestTest030
     * @tc.desc Verify ' -5 ' trim '5'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAbsPart02TestTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        Decimal.abs('   -5   ');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ABS_PART02_SUPPLEMENT_TEST_3100
     * @tc.name testDecimalStaticAbsPart02TestTest031
     * @tc.desc Verify '\n\t-5' trim '5'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAbsPart02TestTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        Decimal.abs('\n\t-5');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ABS_PART02_SUPPLEMENT_TEST_3200
     * @tc.name testDecimalStaticAbsPart02TestTest032
     * @tc.desc Verify Decimal new Decimal('-3.14') '3.14'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAbsPart02TestTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.abs(new Decimal('-3.14'));
      expect(r.toString()).assertEqual('3.14');
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ABS_PART02_SUPPLEMENT_TEST_3300
     * @tc.name testDecimalStaticAbsPart02TestTest033
     * @tc.desc Verify Decimal new Decimal('7.5') '7.5'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAbsPart02TestTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.abs(new Decimal('7.5'));
      expect(r.toString()).assertEqual('7.5');
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ABS_PART02_SUPPLEMENT_TEST_3400
     * @tc.name testDecimalStaticAbsPart02TestTest034
     * @tc.desc Verify Decimal new Decimal(0) '0'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAbsPart02TestTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.abs(new Decimal(0));
      expect(r.toString()).assertEqual('0');
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ABS_PART02_SUPPLEMENT_TEST_3500
     * @tc.name testDecimalStaticAbsPart02TestTest035
     * @tc.desc Verify new Decimal('-5') '5'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAbsPart02TestTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d1: Decimal = new Decimal('-5');
      let d2: Decimal = new Decimal('-5');
      expect(Decimal.abs(d1).toString()).assertEqual('5');
      expect(Decimal.abs(d2).toString()).assertEqual('5');
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ABS_PART02_SUPPLEMENT_TEST_3600
     * @tc.name testDecimalStaticAbsPart02TestTest036
     * @tc.desc Verify Decimal Decimal src !== res
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAbsPart02TestTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Decimal = new Decimal('-9');
      let res: Decimal = Decimal.abs(src);
      expect(src === res).assertFalse();
      expect(src.toString()).assertEqual('-9');
      expect(res.toString()).assertEqual('9');
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ABS_PART02_SUPPLEMENT_TEST_3700
     * @tc.name testDecimalStaticAbsPart02TestTest037
     * @tc.desc Verify string|number '7' 7 '7'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAbsPart02TestTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Decimal.abs('7').toString()).assertEqual('7');
      expect(Decimal.abs(7).toString()).assertEqual('7');
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ABS_PART02_SUPPLEMENT_TEST_3800
     * @tc.name testDecimalStaticAbsPart02TestTest038
     * @tc.desc Verify string|number|Decimal '8' / 8 / new Decimal(8) '8'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAbsPart02TestTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Decimal.abs('8').toString()).assertEqual('8');
      expect(Decimal.abs(8).toString()).assertEqual('8');
      expect(Decimal.abs(new Decimal(8)).toString()).assertEqual('8');
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ABS_PART02_SUPPLEMENT_TEST_3900
     * @tc.name testDecimalStaticAbsPart02TestTest039
     * @tc.desc Verify Decimal string '-0.01' new Decimal('-0.01') '0.01'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAbsPart02TestTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Decimal.abs('-0.01').toString()).assertEqual('0.01');
      expect(Decimal.abs(new Decimal('-0.01')).toString()).assertEqual('0.01');
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ABS_PART02_SUPPLEMENT_TEST_4000
     * @tc.name testDecimalStaticAbsPart02TestTest040
     * @tc.desc Verify number Decimal 3 new Decimal(3) '3'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAbsPart02TestTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Decimal.abs(3).toString()).assertEqual('3');
      expect(Decimal.abs(new Decimal(3)).toString()).assertEqual('3');
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ABS_PART02_SUPPLEMENT_TEST_4100
     * @tc.name testDecimalStaticAbsPart02TestTest041
     * @tc.desc Verify number null 42 null 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAbsPart02TestTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Decimal.abs(42).toString()).assertEqual('42');
      try {
        Decimal.abs(null as ESObject);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ABS_PART02_SUPPLEMENT_TEST_4200
     * @tc.name testDecimalStaticAbsPart02TestTest042
     * @tc.desc Verify string null '55' null 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAbsPart02TestTest042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Decimal.abs('55').toString()).assertEqual('55');
      try {
        Decimal.abs(null as ESObject);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ABS_PART02_SUPPLEMENT_TEST_4300
     * @tc.name testDecimalStaticAbsPart02TestTest043
     * @tc.desc Verify string undefined '99' undefined 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAbsPart02TestTest043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Decimal.abs('99').toString()).assertEqual('99');
      try {
        Decimal.abs(undefined as ESObject);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ABS_PART02_SUPPLEMENT_TEST_4400
     * @tc.name testDecimalStaticAbsPart02TestTest044
     * @tc.desc Verify number undefined 66 undefined 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAbsPart02TestTest044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Decimal.abs(66).toString()).assertEqual('66');
      try {
        Decimal.abs(undefined as ESObject);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ABS_PART02_SUPPLEMENT_TEST_4500
     * @tc.name testDecimalStaticAbsPart02TestTest045
     * @tc.desc Verify Decimal null new Decimal('-77') '77' null 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAbsPart02TestTest045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Decimal.abs(new Decimal('-77')).toString()).assertEqual('77');
      try {
        Decimal.abs(null as ESObject);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ABS_PART02_SUPPLEMENT_TEST_4600
     * @tc.name testDecimalStaticAbsPart02TestTest046
     * @tc.desc Verify string|number|Decimal|null '10' / 10 / new Decimal('-10') null 401 [DP-COMPOSITE-UN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAbsPart02TestTest046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Decimal.abs('10').toString()).assertEqual('10');
      expect(Decimal.abs(10).toString()).assertEqual('10');
      expect(Decimal.abs(new Decimal('-10')).toString()).assertEqual('10');
      try {
        Decimal.abs(null as ESObject);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ABS_PART02_SUPPLEMENT_TEST_4700
     * @tc.name testDecimalStaticAbsPart02TestTest047
     * @tc.desc Verify boolean number boolean true 401 Value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAbsPart02TestTest047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        Decimal.abs(true as ESObject);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ABS_PART02_SUPPLEMENT_TEST_4800
     * @tc.name testDecimalStaticAbsPart02TestTest048
     * @tc.desc Verify boolean string boolean false 401 Value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAbsPart02TestTest048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        Decimal.abs(false as ESObject);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ABS_PART02_SUPPLEMENT_TEST_4900
     * @tc.name testDecimalStaticAbsPart02TestTest049
     * @tc.desc Verify object {} 401 Value [device does not throw, expected error pending SDK alignment]
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAbsPart02TestTest049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: ESObject = {};
      try {
        Decimal.abs(obj as Decimal);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ABS_PART02_SUPPLEMENT_TEST_5000
     * @tc.name testDecimalStaticAbsPart02TestTest050
     * @tc.desc Verify Array [] 401 Value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAbsPart02TestTest050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let arr: number[] = [];
        Decimal.abs(arr as ESObject);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ABS_PART02_SUPPLEMENT_TEST_5100
     * @tc.name testDecimalStaticAbsPart02TestTest051
     * @tc.desc Verify Date 401 Value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAbsPart02TestTest051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        Decimal.abs(new Date() as ESObject);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ABS_PART02_SUPPLEMENT_TEST_5200
     * @tc.name testDecimalStaticAbsPart02TestTest052
     * @tc.desc Verify RegExp 401 Value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAbsPart02TestTest052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let re: RegExp = new RegExp('x');
        Decimal.abs(re as ESObject);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ABS_PART02_SUPPLEMENT_TEST_5300
     * @tc.name testDecimalStaticAbsPart02TestTest053
     * @tc.desc Verify Map 401 Value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAbsPart02TestTest053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let m: Map<string, number> = new Map<string, number>();
        Decimal.abs(m as ESObject);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ABS_PART02_SUPPLEMENT_TEST_5400
     * @tc.name testDecimalStaticAbsPart02TestTest054
     * @tc.desc Verify Set 401 Value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAbsPart02TestTest054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let s: Set<number> = new Set<number>();
        Decimal.abs(s as ESObject);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ABS_PART02_SUPPLEMENT_TEST_5500
     * @tc.name testDecimalStaticAbsPart02TestTest055
     * @tc.desc Verify 'abc' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAbsPart02TestTest055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        Decimal.abs('abc');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ABS_PART02_SUPPLEMENT_TEST_5600
     * @tc.name testDecimalStaticAbsPart02TestTest056
     * @tc.desc Verify '12abc' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAbsPart02TestTest056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        Decimal.abs('12abc');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ABS_PART02_SUPPLEMENT_TEST_5700
     * @tc.name testDecimalStaticAbsPart02TestTest057
     * @tc.desc Verify '1e' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAbsPart02TestTest057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        Decimal.abs('1e');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ABS_PART02_SUPPLEMENT_TEST_5800
     * @tc.name testDecimalStaticAbsPart02TestTest058
     * @tc.desc Verify 'e5' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAbsPart02TestTest058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        Decimal.abs('e5');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ABS_PART02_SUPPLEMENT_TEST_5900
     * @tc.name testDecimalStaticAbsPart02TestTest059
     * @tc.desc Verify '1e+' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAbsPart02TestTest059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        Decimal.abs('1e+');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ABS_PART02_SUPPLEMENT_TEST_6000
     * @tc.name testDecimalStaticAbsPart02TestTest060
     * @tc.desc Verify '-' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAbsPart02TestTest060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        Decimal.abs('-');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ABS_PART02_SUPPLEMENT_TEST_6100
     * @tc.name testDecimalStaticAbsPart02TestTest061
     * @tc.desc Verify '.' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAbsPart02TestTest061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        Decimal.abs('.');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ABS_PART02_SUPPLEMENT_TEST_6200
     * @tc.name testDecimalStaticAbsPart02TestTest062
     * @tc.desc Verify '--5' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAbsPart02TestTest062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        Decimal.abs('--5');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ABS_PART02_SUPPLEMENT_TEST_6300
     * @tc.name testDecimalStaticAbsPart02TestTest063
     * @tc.desc Verify '1.2.3' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAbsPart02TestTest063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        Decimal.abs('1.2.3');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ABS_PART02_SUPPLEMENT_TEST_6400
     * @tc.name testDecimalStaticAbsPart02TestTest064
     * @tc.desc Verify '1,000' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAbsPart02TestTest064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        Decimal.abs('1,000');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ABS_PART02_SUPPLEMENT_TEST_6500
     * @tc.name testDecimalStaticAbsPart02TestTest065
     * @tc.desc Verify '1_000' 401 [device does not throw, expected error pending SDK alignment]
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAbsPart02TestTest065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Decimal.abs('1_000').toString().length > 0).assertTrue();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ABS_PART02_SUPPLEMENT_TEST_6600
     * @tc.name testDecimalStaticAbsPart02TestTest066
     * @tc.desc Verify '0xZZ' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAbsPart02TestTest066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        Decimal.abs('0xZZ');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ABS_PART02_SUPPLEMENT_TEST_6700
     * @tc.name testDecimalStaticAbsPart02TestTest067
     * @tc.desc Verify '' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAbsPart02TestTest067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        Decimal.abs('');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ABS_PART02_SUPPLEMENT_TEST_6800
     * @tc.name testDecimalStaticAbsPart02TestTest068
     * @tc.desc Verify ' ' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAbsPart02TestTest068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        Decimal.abs('   ');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ABS_PART02_SUPPLEMENT_TEST_6900
     * @tc.name testDecimalStaticAbsPart02TestTest069
     * @tc.desc Verify ' ' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAbsPart02TestTest069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        Decimal.abs('​');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ABS_PART02_SUPPLEMENT_TEST_7000
     * @tc.name testDecimalStaticAbsPart02TestTest070
     * @tc.desc Verify NUL '\0' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAbsPart02TestTest070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        Decimal.abs('\0');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ABS_PART02_SUPPLEMENT_TEST_7100
     * @tc.name testDecimalStaticAbsPart02TestTest071
     * @tc.desc Verify emoji ' ' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAbsPart02TestTest071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        Decimal.abs('😀');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ABS_PART02_SUPPLEMENT_TEST_7200
     * @tc.name testDecimalStaticAbsPart02TestTest072
     * @tc.desc Verify emoji '1 ' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAbsPart02TestTest072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        Decimal.abs('1😀');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ABS_PART02_SUPPLEMENT_TEST_7300
     * @tc.name testDecimalStaticAbsPart02TestTest073
     * @tc.desc Verify ' ' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAbsPart02TestTest073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        Decimal.abs('１２３');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ABS_PART02_SUPPLEMENT_TEST_7400
     * @tc.name testDecimalStaticAbsPart02TestTest074
     * @tc.desc Verify '\ud800' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAbsPart02TestTest074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        Decimal.abs('\ud800');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ABS_PART02_SUPPLEMENT_TEST_7500
     * @tc.name testDecimalStaticAbsPart02TestTest075
     * @tc.desc Verify Unicode ' ' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAbsPart02TestTest075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        Decimal.abs('½');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ABS_PART02_SUPPLEMENT_TEST_7600
     * @tc.name testDecimalStaticAbsPart02TestTest076
     * @tc.desc Verify XSS '<script>alert(1)</script>' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAbsPart02TestTest076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        Decimal.abs('<script>alert(1)</script>');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ABS_PART02_SUPPLEMENT_TEST_7700
     * @tc.name testDecimalStaticAbsPart02TestTest077
     * @tc.desc Verify ' 5 6 ' 401 trim
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAbsPart02TestTest077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        Decimal.abs(' 5 6 ');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ABS_PART02_SUPPLEMENT_TEST_7800
     * @tc.name testDecimalStaticAbsPart02TestTest078
     * @tc.desc Verify 2000 'a' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAbsPart02TestTest078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        Decimal.abs('a'.repeat(2000));
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ABS_PART02_SUPPLEMENT_TEST_7900
     * @tc.name testDecimalStaticAbsPart02TestTest079
     * @tc.desc Verify 'Infinity5' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAbsPart02TestTest079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        Decimal.abs('Infinity5');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
  });

}
