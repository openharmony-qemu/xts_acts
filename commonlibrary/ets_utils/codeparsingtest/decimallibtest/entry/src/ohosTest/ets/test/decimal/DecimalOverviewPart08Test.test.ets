
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

export default function decimalOverviewPart08TestTest() {
  describe('DecimalOverviewPart08TestTest', () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART08_SUPPLEMENT_TEST_0100
     * @tc.name testDecimalOverviewPart08TestTest001
     * @tc.desc Verify 7 '7'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart08TestTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Decimal(7);
      expect(d.toString()).assertEqual('7');
    });
  
  
  
  
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART08_SUPPLEMENT_TEST_0200
     * @tc.name testDecimalOverviewPart08TestTest002
     * @tc.desc Verify hypot 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart08TestTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const h = Decimal.hypot();
      expect(h.toString()).assertEqual('0');
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART08_SUPPLEMENT_TEST_0300
     * @tc.name testDecimalOverviewPart08TestTest003
     * @tc.desc Verify max 3
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart08TestTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m = Decimal.max(4, 9, 2);
      expect(m.toString()).assertEqual('9');
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART08_SUPPLEMENT_TEST_0400
     * @tc.name testDecimalOverviewPart08TestTest004
     * @tc.desc Verify max string|number|Decimal
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart08TestTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m = Decimal.max('3', 4, new Decimal('5'));
      expect(m.toString()).assertEqual('5');
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART08_SUPPLEMENT_TEST_0500
     * @tc.name testDecimalOverviewPart08TestTest005
     * @tc.desc Verify sum
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart08TestTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s = Decimal.sum(1, 2, 3, 4);
      expect(s.toString()).assertEqual('10');
    });
  
  
  
  
  
  
  
  
  
  
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART08_SUPPLEMENT_TEST_0600
     * @tc.name testDecimalOverviewPart08TestTest006
     * @tc.desc Verify number 1.5e-7
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart08TestTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Decimal(1.5e-7);
      expect(d.toString()).assertEqual('1.5e-7');
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART08_SUPPLEMENT_TEST_0700
     * @tc.name testDecimalOverviewPart08TestTest007
     * @tc.desc Verify '0x10' '16'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart08TestTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Decimal('0x10');
      expect(d.toString()).assertEqual('16');
    });
  
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART08_SUPPLEMENT_TEST_0800
     * @tc.name testDecimalOverviewPart08TestTest008
     * @tc.desc Verify '2e3' '2000'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart08TestTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Decimal('2e3');
      expect(d.toString()).assertEqual('2000');
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART08_SUPPLEMENT_TEST_0900
     * @tc.name testDecimalOverviewPart08TestTest009
     * @tc.desc Verify '+123' '-123'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart08TestTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Decimal('+123').toString()).assertEqual('123');
      expect(new Decimal('-123').toString()).assertEqual('-123');
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART08_SUPPLEMENT_TEST_1000
     * @tc.name testDecimalOverviewPart08TestTest010
     * @tc.desc Verify / ' 123 ' '123'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart08TestTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Decimal('  123  ');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART08_SUPPLEMENT_TEST_1100
     * @tc.name testDecimalOverviewPart08TestTest011
     * @tc.desc Verify '.5' '0.5'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart08TestTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Decimal('.5');
      expect(d.toString()).assertEqual('0.5');
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART08_SUPPLEMENT_TEST_1200
     * @tc.name testDecimalOverviewPart08TestTest012
     * @tc.desc Verify ''
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart08TestTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const d = new Decimal('');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART08_SUPPLEMENT_TEST_1300
     * @tc.name testDecimalOverviewPart08TestTest013
     * @tc.desc Verify ' '
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart08TestTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const d = new Decimal('    ');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART08_SUPPLEMENT_TEST_1400
     * @tc.name testDecimalOverviewPart08TestTest014
     * @tc.desc Verify ' '
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart08TestTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const d = new Decimal('​');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART08_SUPPLEMENT_TEST_1500
     * @tc.name testDecimalOverviewPart08TestTest015
     * @tc.desc Verify '\n123' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart08TestTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Decimal('\n123');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART08_SUPPLEMENT_TEST_1600
     * @tc.name testDecimalOverviewPart08TestTest016
     * @tc.desc Verify '12abc' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart08TestTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Decimal('12abc');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART08_SUPPLEMENT_TEST_1700
     * @tc.name testDecimalOverviewPart08TestTest017
     * @tc.desc Verify emoji ' ' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart08TestTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Decimal('🍕');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART08_SUPPLEMENT_TEST_1800
     * @tc.name testDecimalOverviewPart08TestTest018
     * @tc.desc Verify XSS '<script>alert(1)</script>' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart08TestTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Decimal('<script>alert(1)</script>');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART08_SUPPLEMENT_TEST_1900
     * @tc.name testDecimalOverviewPart08TestTest019
     * @tc.desc Verify '\uD800'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart08TestTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const d = new Decimal('\uD800');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART08_SUPPLEMENT_TEST_2000
     * @tc.name testDecimalOverviewPart08TestTest020
     * @tc.desc Verify 1000
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart08TestTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let big = '9';
      for (let i = 0; i < 999; i++) {
        big = big + '9';
      }
      const d = new Decimal(big);
      expect(d.toString().startsWith('9.9999999999999999999999999999999999999')).assertTrue();
    });
  
  
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART08_SUPPLEMENT_TEST_2100
     * @tc.name testDecimalOverviewPart08TestTest021
     * @tc.desc Verify undefined plus(undefined) 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart08TestTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Decimal(1);
      try {
        d.add(undefined as ESObject);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART08_SUPPLEMENT_TEST_2200
     * @tc.name testDecimalOverviewPart08TestTest022
     * @tc.desc Verify null plus(null) 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart08TestTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Decimal(1);
      try {
        d.add(null as ESObject);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART08_SUPPLEMENT_TEST_2300
     * @tc.name testDecimalOverviewPart08TestTest023
     * @tc.desc Verify set Decimal.set({})
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart08TestTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ precision: 20, rounding: 4, toExpNeg: -7, toExpPos: 21 });
      Decimal.set({});
      const d = new Decimal('1.005');
      expect(d.toFixed(2)).assertEqual('1.01');
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART08_SUPPLEMENT_TEST_2400
     * @tc.name testDecimalOverviewPart08TestTest024
     * @tc.desc Verify string new Decimal('5') '5'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart08TestTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Decimal('5');
      expect(d.toString()).assertEqual('5');
    });
  
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART08_SUPPLEMENT_TEST_2500
     * @tc.name testDecimalOverviewPart08TestTest025
     * @tc.desc Verify Decimal new Decimal(new Decimal('5')) '5'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart08TestTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner = new Decimal('5');
      const outer = new Decimal(inner);
      expect(outer.toString()).assertEqual('5');
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART08_SUPPLEMENT_TEST_2600
     * @tc.name testDecimalOverviewPart08TestTest026
     * @tc.desc Verify plus string|number '5' 5
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart08TestTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Decimal(3).add('5');
      const b = new Decimal(3).add(5);
      expect(a.toString()).assertEqual(b.toString());
      expect(a.toString()).assertEqual('8');
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART08_SUPPLEMENT_TEST_2700
     * @tc.name testDecimalOverviewPart08TestTest027
     * @tc.desc Verify new Decimal(d) new Decimal('1.5')
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart08TestTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Decimal('1.5');
      const viaRef = new Decimal(d);
      const viaStr = new Decimal(d.toString());
      expect(viaRef.toString()).assertEqual(viaStr.toString());
      expect(viaRef.toString()).assertEqual('1.5');
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART08_SUPPLEMENT_TEST_2800
     * @tc.name testDecimalOverviewPart08TestTest028
     * @tc.desc Verify number null null 401 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart08TestTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown = false;
      try {
        new Decimal(null as ESObject);
      } catch (e) {
        thrown = true;
      }
      expect(thrown).assertTrue();
      expect(new Decimal(0).toString()).assertEqual('0');
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART08_SUPPLEMENT_TEST_2900
     * @tc.name testDecimalOverviewPart08TestTest029
     * @tc.desc Verify number undefined undefined 401 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart08TestTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown = false;
      try {
        new Decimal(undefined as ESObject);
      } catch (e) {
        thrown = true;
      }
      expect(thrown).assertTrue();
      expect(new Decimal(0).toString()).assertEqual('0');
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART08_SUPPLEMENT_TEST_3000
     * @tc.name testDecimalOverviewPart08TestTest030
     * @tc.desc Verify Decimal
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart08TestTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Decimal('2.5');
      const r = d.mul(2);
      expect(r.toString()).assertEqual('5');
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART08_SUPPLEMENT_TEST_3100
     * @tc.name testDecimalOverviewPart08TestTest031
     * @tc.desc Verify plus Decimal
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart08TestTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Decimal('1.5');
      const b = a.add('0.5');
      expect(a.toString()).assertEqual('1.5');
      expect(b.toString()).assertEqual('2');
    });
  
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART08_SUPPLEMENT_TEST_3200
     * @tc.name testDecimalOverviewPart08TestTest032
     * @tc.desc Verify toNumber number
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart08TestTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Decimal('5.5');
      expect(d.toNumber()).assertEqual(5.5);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART08_SUPPLEMENT_TEST_3300
     * @tc.name testDecimalOverviewPart08TestTest033
     * @tc.desc Verify valueOf number
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart08TestTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Decimal('5.5');
      expect(d.valueOf()).assertEqual('5.5');
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART08_SUPPLEMENT_TEST_3400
     * @tc.name testDecimalOverviewPart08TestTest034
     * @tc.desc Verify number values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart08TestTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = new Decimal(2).add(3).mul(4);
      expect(r.toString()).assertEqual('20');
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART08_SUPPLEMENT_TEST_3500
     * @tc.name testDecimalOverviewPart08TestTest035
     * @tc.desc Verify compare 1/-1/0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart08TestTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Decimal(3);
      expect(a.comparedTo(1)).assertEqual(1);
      expect(a.comparedTo(5)).assertEqual(-1);
      expect(a.comparedTo(3)).assertEqual(0);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART08_SUPPLEMENT_TEST_3600
     * @tc.name testDecimalOverviewPart08TestTest036
     * @tc.desc Verify max Decimal
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart08TestTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m = Decimal.max(3, 9);
      const r = m.add(1);
      expect(r.toString()).assertEqual('10');
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART08_SUPPLEMENT_TEST_3700
     * @tc.name testDecimalOverviewPart08TestTest037
     * @tc.desc Verify sum Decimal
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart08TestTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s = Decimal.sum(1, 2, 3);
      expect(s.mul(2).toString()).assertEqual('12');
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART08_SUPPLEMENT_TEST_3800
     * @tc.name testDecimalOverviewPart08TestTest038
     * @tc.desc Verify toFixed rounding=9 10200001
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart08TestTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Decimal('1.005');
      try {
        d.toFixed(2, 9 as ESObject);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(10200001);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART08_SUPPLEMENT_TEST_3900
     * @tc.name testDecimalOverviewPart08TestTest039
     * @tc.desc Verify toFixed rounding=-1 10200001
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart08TestTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Decimal('1.005');
      try {
        d.toFixed(2, -1 as ESObject);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(10200001);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART08_SUPPLEMENT_TEST_4000
     * @tc.name testDecimalOverviewPart08TestTest040
     * @tc.desc Verify toSignificantDigits significantDigits 10200001
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart08TestTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Decimal('123.45');
      try {
        d.toSignificantDigits(0);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(10200001);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART08_SUPPLEMENT_TEST_4100
     * @tc.name testDecimalOverviewPart08TestTest041
     * @tc.desc Verify sqrt NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart08TestTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Decimal(-1).sqrt();
      expect(d.isNaN()).assertTrue();
    });
  
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART08_SUPPLEMENT_TEST_4200
     * @tc.name testDecimalOverviewPart08TestTest042
     * @tc.desc Verify div -Infinity
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart08TestTest042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Decimal(1).div(-0);
      expect(d.toString()).assertEqual('-Infinity');
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART08_SUPPLEMENT_TEST_4300
     * @tc.name testDecimalOverviewPart08TestTest043
     * @tc.desc Verify NaN plus(NaN) 'NaN'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart08TestTest043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Decimal(1).add(NaN);
      expect(d.toString()).assertEqual('NaN');
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART08_SUPPLEMENT_TEST_4400
     * @tc.name testDecimalOverviewPart08TestTest044
     * @tc.desc Verify Infinity 0 NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart08TestTest044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Decimal(Infinity).mul(0);
      expect(d.toString()).assertEqual('NaN');
    });
  
  
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART08_SUPPLEMENT_TEST_4500
     * @tc.name testDecimalOverviewPart08TestTest045
     * @tc.desc Verify toFixed 1.005 2 rounding=4 '1.01'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart08TestTest045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Decimal('1.005');
      expect(d.toFixed(2)).assertEqual('1.01');
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART08_SUPPLEMENT_TEST_4600
     * @tc.name testDecimalOverviewPart08TestTest046
     * @tc.desc Verify toFixed rounding 0 vs 4
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart08TestTest046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Decimal('1.005');
      const down = d.toFixed(2, 0);
      const halfUp = d.toFixed(2, 4);
      expect(down).assertEqual('1.01');
      expect(halfUp).assertEqual('1.01');
    });
  
  
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART08_SUPPLEMENT_TEST_4700
     * @tc.name testDecimalOverviewPart08TestTest047
     * @tc.desc Verify toNumber 0 1e-999
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart08TestTest047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Decimal('1e-999');
      expect(d.toNumber()).assertEqual(0);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART08_SUPPLEMENT_TEST_4800
     * @tc.name testDecimalOverviewPart08TestTest048
     * @tc.desc Verify toExponential
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart08TestTest048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Decimal('123.456');
      expect(d.toExponential(2)).assertEqual('1.23e+2');
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART08_SUPPLEMENT_TEST_4900
     * @tc.name testDecimalOverviewPart08TestTest049
     * @tc.desc Verify toPrecision
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart08TestTest049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Decimal('123.456');
      expect(d.toPrecision(4)).assertEqual('123.5');
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART08_SUPPLEMENT_TEST_5000
     * @tc.name testDecimalOverviewPart08TestTest050
     * @tc.desc Verify toFixed(0)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart08TestTest050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Decimal('9.9');
      expect(d.toFixed(0)).assertEqual('10');
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART08_SUPPLEMENT_TEST_5100
     * @tc.name testDecimalOverviewPart08TestTest051
     * @tc.desc Verify toFixed 9e15
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart08TestTest051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Decimal('9000000000000000');
      expect(d.toFixed(0)).assertEqual('9000000000000000');
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART08_SUPPLEMENT_TEST_5200
     * @tc.name testDecimalOverviewPart08TestTest052
     * @tc.desc Verify set rounding toFixed
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart08TestTest052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ rounding: 0 });
      expect(new Decimal('1.005').toFixed(2)).assertEqual('1.01');
      Decimal.set({ rounding: 4 });
      expect(new Decimal('1.005').toFixed(2)).assertEqual('1.01');
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART08_SUPPLEMENT_TEST_5300
     * @tc.name testDecimalOverviewPart08TestTest053
     * @tc.desc Verify set precision 5 vs 20
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart08TestTest053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ precision: 5 });
      expect(new Decimal(1).div(3).toString()).assertEqual('0.33333');
      Decimal.set({ precision: 20 });
      expect(new Decimal(1).div(3).toString()).assertEqual('0.33333333333333333333');
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART08_SUPPLEMENT_TEST_5400
     * @tc.name testDecimalOverviewPart08TestTest054
     * @tc.desc Verify set toExpPos toString
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart08TestTest054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ toExpPos: 30 });
      expect(new Decimal('1e21').toString()).assertEqual('1000000000000000000000');
      Decimal.set({ toExpPos: 21 });
      expect(new Decimal('1e21').toString()).assertEqual('1e+21');
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART08_SUPPLEMENT_TEST_5500
     * @tc.name testDecimalOverviewPart08TestTest055
     * @tc.desc Verify set toExpNeg toString
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart08TestTest055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ toExpNeg: -9 });
      expect(new Decimal('1e-7').toString()).assertEqual('0.0000001');
      Decimal.set({ toExpNeg: -7 });
      expect(new Decimal('1e-7').toString()).assertEqual('1e-7');
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART08_SUPPLEMENT_TEST_5600
     * @tc.name testDecimalOverviewPart08TestTest056
     * @tc.desc Verify set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart08TestTest056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ rounding: 0 });
      const a = new Decimal('1.005').toFixed(2);
      const b = new Decimal('2.005').toFixed(2);
      expect(a).assertEqual('1.01');
      expect(b).assertEqual('2.01');
      Decimal.set({ rounding: 4 });
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART08_SUPPLEMENT_TEST_5700
     * @tc.name testDecimalOverviewPart08TestTest057
     * @tc.desc Verify defaults
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart08TestTest057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ precision: 5, rounding: 0, toExpNeg: -9, toExpPos: 30 });
      Decimal.set({ precision: 20, rounding: 4, toExpNeg: -7, toExpPos: 21 });
      expect(new Decimal('1.005').toFixed(2)).assertEqual('1.01');
      expect(new Decimal(1).div(3).toString()).assertEqual('0.33333333333333333333');
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART08_SUPPLEMENT_TEST_5800
     * @tc.name testDecimalOverviewPart08TestTest058
     * @tc.desc Verify set rounding 10200001
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart08TestTest058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        Decimal.set({ rounding: 9 as ESObject } as ESObject);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(10200001);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART08_SUPPLEMENT_TEST_5900
     * @tc.name testDecimalOverviewPart08TestTest059
     * @tc.desc Verify set maxE/minE
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart08TestTest059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ maxE: 9e15, minE: -9e15 });
      const d = new Decimal('1e9').mul('1e9');
      Decimal.set({ precision: 20, rounding: 4, toExpNeg: -7, toExpPos: 21 });
      expect(d.isNaN()).assertFalse();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART08_SUPPLEMENT_TEST_6000
     * @tc.name testDecimalOverviewPart08TestTest060
     * @tc.desc Verify string|number|Decimal|boolean boolean
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart08TestTest060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Decimal('4').toString()).assertEqual('4');
      expect(new Decimal(4).toString()).assertEqual('4');
      expect(new Decimal(new Decimal('4')).toString()).assertEqual('4');
      let thrown = false;
      try {
        new Decimal(true as ESObject);
      } catch (e) {
        thrown = true;
      }
      expect(thrown).assertTrue();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART08_SUPPLEMENT_TEST_6100
     * @tc.name testDecimalOverviewPart08TestTest061
     * @tc.desc Verify number
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart08TestTest061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Decimal(42).toString()).assertEqual('42');
      expect(new Decimal(3.14).toString()).assertEqual('3.14');
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART08_SUPPLEMENT_TEST_6200
     * @tc.name testDecimalOverviewPart08TestTest062
     * @tc.desc Verify string
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart08TestTest062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Decimal('42').toString()).assertEqual('42');
      expect(new Decimal('3.14').toString()).assertEqual('3.14');
    });
  
  });

}
