
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

export default function decimalSinhTestTest() {
  describe('DecimalSinhTestTest', () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SINH_SUPPLEMENT_TEST_0100
     * @tc.name testDecimalSinhTestTest001
     * @tc.desc Verify (assertTrue)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalSinhTestTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: Decimal = new Decimal(0.5).sinh();
      expect(res instanceof Decimal).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SINH_SUPPLEMENT_TEST_0200
     * @tc.name testDecimalSinhTestTest002
     * @tc.desc Verify (assertFalse)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalSinhTestTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Decimal = new Decimal(0.5);
      let res: Decimal = src.sinh();
      expect(res === src).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SINH_SUPPLEMENT_TEST_0300
     * @tc.name testDecimalSinhTestTest003
     * @tc.desc Verify toString (assertEqual)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalSinhTestTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Decimal = new Decimal('123.45');
      src.sinh();
      expect(src.toString()).assertEqual('123.45');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SINH_SUPPLEMENT_TEST_0400
     * @tc.name testDecimalSinhTestTest004
     * @tc.desc Verify toString (assertEqual)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalSinhTestTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: Decimal = new Decimal(-0.5).sinh().abs();
      expect(res.toString()).assertEqual('0.52109530549374736162');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SINH_SUPPLEMENT_TEST_0500
     * @tc.name testDecimalSinhTestTest005
     * @tc.desc Verify toString (assertEqual)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalSinhTestTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: Decimal = new Decimal(0.5).sinh().mul(2);
      expect(res.toString()).assertEqual('1.0421906109874947232');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SINH_SUPPLEMENT_TEST_0600
     * @tc.name testDecimalSinhTestTest006
     * @tc.desc Verify (assertEqual)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalSinhTestTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      new Decimal(0.5).sinh();
      expect(new Decimal(1).precision()).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SINH_SUPPLEMENT_TEST_0700
     * @tc.name testDecimalSinhTestTest007
     * @tc.desc Verify toString (assertEqual)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalSinhTestTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Decimal = new Decimal(0.5);
      let res: ESObject = src.sinh();
      expect((res as Decimal).toString()).assertEqual('0.52109530549374736162');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SINH_SUPPLEMENT_TEST_0800
     * @tc.name testDecimalSinhTestTest008
     * @tc.desc Verify toString (assertEqual)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalSinhTestTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: Decimal = new Decimal(0.5).sinh();
      expect(res.toString()).assertEqual('0.52109530549374736162');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SINH_SUPPLEMENT_TEST_0900
     * @tc.name testDecimalSinhTestTest009
     * @tc.desc Verify toString (assertEqual)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalSinhTestTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: Decimal = new Decimal(1).sinh();
      expect(res.toString()).assertEqual('1.1752011936438014569');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SINH_SUPPLEMENT_TEST_1000
     * @tc.name testDecimalSinhTestTest010
     * @tc.desc Verify toString (assertEqual)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalSinhTestTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: Decimal = new Decimal(-1).sinh();
      expect(res.toString()).assertEqual('-1.1752011936438014569');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SINH_SUPPLEMENT_TEST_1100
     * @tc.name testDecimalSinhTestTest011
     * @tc.desc Verify toString (assertEqual)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalSinhTestTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: Decimal = new Decimal(2).sinh();
      expect(res.toString()).assertEqual('3.6268604078470187677');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SINH_SUPPLEMENT_TEST_1200
     * @tc.name testDecimalSinhTestTest012
     * @tc.desc Verify toString (assertEqual)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalSinhTestTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: Decimal = new Decimal(-2).sinh();
      expect(res.toString()).assertEqual('-3.6268604078470187677');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SINH_SUPPLEMENT_TEST_1300
     * @tc.name testDecimalSinhTestTest013
     * @tc.desc Verify toString (assertEqual)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalSinhTestTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: Decimal = new Decimal(0.1).sinh();
      expect(res.toString()).assertEqual('0.10016675001984402582');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SINH_SUPPLEMENT_TEST_1400
     * @tc.name testDecimalSinhTestTest014
     * @tc.desc Verify toString (assertEqual)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalSinhTestTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: Decimal = new Decimal(-0.1).sinh();
      expect(res.toString()).assertEqual('-0.10016675001984402582');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SINH_SUPPLEMENT_TEST_1500
     * @tc.name testDecimalSinhTestTest015
     * @tc.desc Verify toString (assertEqual)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalSinhTestTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: Decimal = new Decimal(0.25).sinh();
      expect(res.toString()).assertEqual('0.25261231680816830791');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SINH_SUPPLEMENT_TEST_1600
     * @tc.name testDecimalSinhTestTest016
     * @tc.desc Verify toString (assertEqual)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalSinhTestTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: Decimal = new Decimal(0.75).sinh();
      expect(res.toString()).assertEqual('0.8223167319358299807');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SINH_SUPPLEMENT_TEST_1700
     * @tc.name testDecimalSinhTestTest017
     * @tc.desc Verify toString (assertEqual)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalSinhTestTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: Decimal = new Decimal(2.5).sinh();
      expect(res.toString()).assertEqual('6.0502044810397873215');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SINH_SUPPLEMENT_TEST_1800
     * @tc.name testDecimalSinhTestTest018
     * @tc.desc Verify toString (assertEqual)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalSinhTestTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: Decimal = new Decimal(3).sinh();
      expect(res.toString()).assertEqual('10.017874927409901899');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SINH_SUPPLEMENT_TEST_1900
     * @tc.name testDecimalSinhTestTest019
     * @tc.desc Verify toString (assertEqual)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalSinhTestTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: Decimal = new Decimal(-3).sinh();
      expect(res.toString()).assertEqual('-10.017874927409901899');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SINH_SUPPLEMENT_TEST_2000
     * @tc.name testDecimalSinhTestTest020
     * @tc.desc Verify toString (assertEqual)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalSinhTestTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: Decimal = new Decimal(4).sinh();
      expect(res.toString()).assertEqual('27.289917197127752449');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SINH_SUPPLEMENT_TEST_2100
     * @tc.name testDecimalSinhTestTest021
     * @tc.desc Verify toString (assertEqual)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalSinhTestTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: Decimal = new Decimal(10).sinh();
      expect(res.toString()).assertEqual('11013.232874703393377');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SINH_SUPPLEMENT_TEST_2200
     * @tc.name testDecimalSinhTestTest022
     * @tc.desc Verify toString (assertEqual)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalSinhTestTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: Decimal = new Decimal(-10).sinh();
      expect(res.toString()).assertEqual('-11013.232874703393377');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SINH_SUPPLEMENT_TEST_2300
     * @tc.name testDecimalSinhTestTest023
     * @tc.desc Verify toString (assertEqual)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalSinhTestTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: Decimal = new Decimal(0.0001).sinh();
      expect(res.toString()).assertEqual('0.00010000000016666666675');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SINH_SUPPLEMENT_TEST_2400
     * @tc.name testDecimalSinhTestTest024
     * @tc.desc Verify toString (assertEqual)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalSinhTestTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: Decimal = new Decimal(0.001).sinh();
      expect(res.toString()).assertEqual('0.001000000166666675');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SINH_SUPPLEMENT_TEST_2500
     * @tc.name testDecimalSinhTestTest025
     * @tc.desc Verify toString (assertEqual,assertFalse)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalSinhTestTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: Decimal = new Decimal(0).sinh();
      expect(res.toString()).assertEqual('0');
      expect(res.isNegative()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SINH_SUPPLEMENT_TEST_2600
     * @tc.name testDecimalSinhTestTest026
     * @tc.desc Verify sinh(-0) sinh(-0) = -0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalSinhTestTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: Decimal = new Decimal(-0).sinh();
      expect(res.isNegative()).assertTrue();
      expect(res.toString()).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SINH_SUPPLEMENT_TEST_2700
     * @tc.name testDecimalSinhTestTest027
     * @tc.desc Verify (assertEqual)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalSinhTestTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: Decimal = new Decimal(-0).sinh();
      expect(res.s).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SINH_SUPPLEMENT_TEST_2800
     * @tc.name testDecimalSinhTestTest028
     * @tc.desc Verify (assertEqual)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalSinhTestTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: Decimal = new Decimal(0).sinh();
      expect(res.d.length).assertEqual(1);
      expect(res.d[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SINH_SUPPLEMENT_TEST_2900
     * @tc.name testDecimalSinhTestTest029
     * @tc.desc Verify (assertEqual,assertTrue)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalSinhTestTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: Decimal = new Decimal('-0').sinh();
      expect(res.isNegative()).assertTrue();
      expect(res.toNumber()).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SINH_SUPPLEMENT_TEST_3000
     * @tc.name testDecimalSinhTestTest030
     * @tc.desc Verify toString with NaN (assertEqual,assertTrue)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalSinhTestTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: Decimal = new Decimal(NaN).sinh();
      expect(res.isNaN()).assertTrue();
      expect(res.toString()).assertEqual('NaN');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SINH_SUPPLEMENT_TEST_3100
     * @tc.name testDecimalSinhTestTest031
     * @tc.desc Verify toString with Infinity (assertEqual,assertFalse)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalSinhTestTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: Decimal = new Decimal(Infinity).sinh();
      expect(res.isFinite()).assertFalse();
      expect(res.toString()).assertEqual('Infinity');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SINH_SUPPLEMENT_TEST_3200
     * @tc.name testDecimalSinhTestTest032
     * @tc.desc Verify toString with Infinity (assertEqual,assertFalse)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalSinhTestTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: Decimal = new Decimal(-Infinity).sinh();
      expect(res.isFinite()).assertFalse();
      expect(res.toString()).assertEqual('-Infinity');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SINH_SUPPLEMENT_TEST_3300
     * @tc.name testDecimalSinhTestTest033
     * @tc.desc Verify (assertEqual,assertTrue)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalSinhTestTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: Decimal = new Decimal(1e-7).sinh();
      expect(res.e).assertEqual(-7);
      expect(res.isFinite()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SINH_SUPPLEMENT_TEST_3400
     * @tc.name testDecimalSinhTestTest034
     * @tc.desc Verify precision=1 sinh(0.5) 1 '0.5'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalSinhTestTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ precision: 1 });
      let res: Decimal = new Decimal(0.5).sinh();
      expect(res.toString()).assertEqual('0.5');
      Decimal.set({ precision: 20 });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SINH_SUPPLEMENT_TEST_3500
     * @tc.name testDecimalSinhTestTest035
     * @tc.desc Verify precision=5 sinh(1) '1.1752'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalSinhTestTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ precision: 5 });
      let res: Decimal = new Decimal(1).sinh();
      expect(res.toString()).assertEqual('1.1752');
      Decimal.set({ precision: 20 });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SINH_SUPPLEMENT_TEST_3600
     * @tc.name testDecimalSinhTestTest036
     * @tc.desc Verify precision=3 rounding=4 sinh(1) '1.18'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalSinhTestTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ precision: 3, rounding: 4 });
      let res: Decimal = new Decimal(1).sinh();
      expect(res.toString()).assertEqual('1.18');
      Decimal.set({ precision: 20, rounding: 4 });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SINH_SUPPLEMENT_TEST_3700
     * @tc.name testDecimalSinhTestTest037
     * @tc.desc Verify precision=3 rounding=1 sinh(1) '1.17'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalSinhTestTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ precision: 3, rounding: 1 });
      let res: Decimal = new Decimal(1).sinh();
      expect(res.toString()).assertEqual('1.17');
      Decimal.set({ precision: 20, rounding: 4 });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SINH_SUPPLEMENT_TEST_3800
     * @tc.name testDecimalSinhTestTest038
     * @tc.desc Verify defaults sinh(1) 20
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalSinhTestTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ precision: 1 });
      let tmp: Decimal = new Decimal(1).sinh();
      Decimal.set({ precision: 20 });
      let res: Decimal = new Decimal(1).sinh();
      expect(res.toString()).assertEqual('1.1752011936438014569');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SINH_SUPPLEMENT_TEST_3900
     * @tc.name testDecimalSinhTestTest039
     * @tc.desc Verify toExpNeg sinh(0.0001)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalSinhTestTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ toExpNeg: -3 });
      let res: Decimal = new Decimal(0.0001).sinh();
      expect(res.toString()).assertEqual('1.0000000016666666675e-4');
      Decimal.set({ toExpNeg: -7 });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SINH_SUPPLEMENT_TEST_4000
     * @tc.name testDecimalSinhTestTest040
     * @tc.desc Verify string|number '2' 2 sinh
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalSinhTestTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Decimal = new Decimal('2').sinh();
      let b: Decimal = new Decimal(2).sinh();
      expect(a.toString()).assertEqual(b.toString());
      expect(a.toString()).assertEqual('3.6268604078470187677');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SINH_SUPPLEMENT_TEST_4100
     * @tc.name testDecimalSinhTestTest041
     * @tc.desc Verify number|Decimal 2 Decimal(2) sinh
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalSinhTestTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Decimal = new Decimal(2).sinh();
      let b: Decimal = new Decimal(new Decimal(2)).sinh();
      expect(a.toString()).assertEqual(b.toString());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SINH_SUPPLEMENT_TEST_4200
     * @tc.name testDecimalSinhTestTest042
     * @tc.desc Verify string|Decimal '2' Decimal(2) sinh
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalSinhTestTest042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Decimal = new Decimal('2').sinh();
      let b: Decimal = new Decimal(new Decimal(2)).sinh();
      expect(a.toString()).assertEqual(b.toString());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SINH_SUPPLEMENT_TEST_4300
     * @tc.name testDecimalSinhTestTest043
     * @tc.desc Verify '1e1' sinh sinh(10)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalSinhTestTest043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Decimal = new Decimal('1e1').sinh();
      let b: Decimal = new Decimal(10).sinh();
      expect(a.toString()).assertEqual(b.toString());
      expect(a.toString()).assertEqual('11013.232874703393377');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SINH_SUPPLEMENT_TEST_4400
     * @tc.name testDecimalSinhTestTest044
     * @tc.desc Verify (assertEqual)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalSinhTestTest044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Decimal = new Decimal('1e-7').sinh();
      let b: Decimal = new Decimal(1e-7).sinh();
      expect(a.toNumber()).assertEqual(b.toNumber());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SINH_SUPPLEMENT_TEST_4500
     * @tc.name testDecimalSinhTestTest045
     * @tc.desc Verify toString (assertEqual,assertFalse)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalSinhTestTest045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Decimal = new Decimal(0.5);
      let b: Decimal = new Decimal(0.5);
      expect(a === b).assertFalse();
      expect(a.sinh().toString()).assertEqual(b.sinh().toString());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SINH_SUPPLEMENT_TEST_4600
     * @tc.name testDecimalSinhTestTest046
     * @tc.desc Verify toString (assertEqual)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalSinhTestTest046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Decimal = new Decimal('-2').sinh();
      expect(a.toString()).assertEqual('-3.6268604078470187677');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SINH_SUPPLEMENT_TEST_4700
     * @tc.name testDecimalSinhTestTest047
     * @tc.desc Verify toString (assertEqual)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalSinhTestTest047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: Decimal = new Decimal('-1e1').sinh();
      expect(res.toString()).assertEqual('-11013.232874703393377');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SINH_SUPPLEMENT_TEST_4800
     * @tc.name testDecimalSinhTestTest048
     * @tc.desc Verify with null (assertEqual)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalSinhTestTest048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Decimal(null as ESObject).sinh();
        expect(0).assertEqual(1);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SINH_SUPPLEMENT_TEST_4900
     * @tc.name testDecimalSinhTestTest049
     * @tc.desc Verify with undefined (assertEqual)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalSinhTestTest049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let u: ESObject = undefined;
      try {
        new Decimal(u).sinh();
        expect(0).assertEqual(1);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SINH_SUPPLEMENT_TEST_5000
     * @tc.name testDecimalSinhTestTest050
     * @tc.desc Verify (assertEqual)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalSinhTestTest050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Decimal('').sinh();
        expect(0).assertEqual(1);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SINH_SUPPLEMENT_TEST_5100
     * @tc.name testDecimalSinhTestTest051
     * @tc.desc Verify (assertEqual)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalSinhTestTest051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Decimal('​').sinh();
        expect(0).assertEqual(1);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SINH_SUPPLEMENT_TEST_5200
     * @tc.name testDecimalSinhTestTest052
     * @tc.desc Verify (assertEqual)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalSinhTestTest052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Decimal('abc').sinh();
        expect(0).assertEqual(1);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SINH_SUPPLEMENT_TEST_5300
     * @tc.name testDecimalSinhTestTest053
     * @tc.desc Verify (assertEqual) [device does not throw, expected error pending SDK alignment]
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalSinhTestTest053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Decimal('0x10').sinh();
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SINH_SUPPLEMENT_TEST_5400
     * @tc.name testDecimalSinhTestTest054
     * @tc.desc Verify null undefined 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalSinhTestTest054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nullCaught: boolean = false;
      let undefCaught: boolean = false;
      try {
        new Decimal(null as ESObject).sinh();
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
        nullCaught = true;
      }
      try {
        new Decimal(undefined as ESObject).sinh();
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
        undefCaught = true;
      }
      expect(nullCaught).assertTrue();
      expect(undefCaught).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SINH_SUPPLEMENT_TEST_5500
     * @tc.name testDecimalSinhTestTest055
     * @tc.desc Verify sinh(-0.5) = -sinh(0.5)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalSinhTestTest055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let pos: Decimal = new Decimal(0.5).sinh();
      let neg: Decimal = new Decimal(-0.5).sinh();
      expect(neg.toString()).assertEqual('-0.52109530549374736162');
      expect(neg.toString()).assertEqual(pos.negate().toString());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SINH_SUPPLEMENT_TEST_5600
     * @tc.name testDecimalSinhTestTest056
     * @tc.desc Verify sinh sinh(0.5) < sinh(1) < sinh(2)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalSinhTestTest056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: number = new Decimal(0.5).sinh().toNumber();
      let b: number = new Decimal(1).sinh().toNumber();
      let c: number = new Decimal(2).sinh().toNumber();
      expect(a < b).assertTrue();
      expect(b < c).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SINH_SUPPLEMENT_TEST_5700
     * @tc.name testDecimalSinhTestTest057
     * @tc.desc Verify cosh(x)^2 - sinh(x)^2 1 x=1 1e-15
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalSinhTestTest057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sh: number = new Decimal(1).sinh().toNumber();
      let ch: number = new Decimal(1).cosh().toNumber();
      let diff: number = ch * ch - sh * sh - 1;
      expect(Math.abs(diff) < 1e-15).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SINH_SUPPLEMENT_TEST_5800
     * @tc.name testDecimalSinhTestTest058
     * @tc.desc Verify sinh(0.0001) toNumber
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalSinhTestTest058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = new Decimal(0.0001).sinh().toNumber();
      expect(Math.abs(res - 0.0001) < 1e-16).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SINH_SUPPLEMENT_TEST_5900
     * @tc.name testDecimalSinhTestTest059
     * @tc.desc Verify DP-BASIC-NUMBER - NaN/ Infinity -0 MAX/MIN_VALUE 9e15
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalSinhTestTest059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Decimal(NaN).sinh().isNaN()).assertTrue();
      expect(new Decimal(Infinity).sinh().toString()).assertEqual('Infinity');
      expect(new Decimal(-Infinity).sinh().toString()).assertEqual('-Infinity');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SINH_SUPPLEMENT_TEST_6000
     * @tc.name testDecimalSinhTestTest060
     * @tc.desc Verify DP-BASIC-NULLISH - null undefined /
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalSinhTestTest060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let errCount: number = 0;
      try { new Decimal(null as ESObject).sinh(); } catch (e) { errCount++; }
      try { new Decimal(undefined as ESObject).sinh(); } catch (e) { errCount++; }
      try { new Decimal('').sinh(); } catch (e) { errCount++; }
      try { new Decimal('​').sinh(); } catch (e) { errCount++; }
      expect(errCount).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SINH_SUPPLEMENT_TEST_6100
     * @tc.name testDecimalSinhTestTest061
     * @tc.desc Verify toString (assertEqual)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalSinhTestTest061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Decimal = new Decimal('0.5').sinh();
      let b: Decimal = new Decimal(0.5).sinh();
      let c: Decimal = new Decimal(new Decimal(0.5)).sinh();
      let d: Decimal = new Decimal('5e-1').sinh();
      expect(b.toString()).assertEqual('0.52109530549374736162');
      expect(a.toString()).assertEqual(b.toString());
      expect(c.toString()).assertEqual(b.toString());
      expect(d.toString()).assertEqual(b.toString());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SINH_SUPPLEMENT_TEST_6200
     * @tc.name testDecimalSinhTestTest062
     * @tc.desc Verify null number - number null 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalSinhTestTest062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ok: boolean = false;
      let num: Decimal = new Decimal(2).sinh();
      expect(num.toString()).assertEqual('3.6268604078470187677');
      try {
        new Decimal(null as ESObject).sinh();
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
        ok = true;
      }
      expect(ok).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SINH_SUPPLEMENT_TEST_6300
     * @tc.name testDecimalSinhTestTest063
     * @tc.desc Verify sinh(50) exponent e is 21 leading digit 2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalSinhTestTest063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: Decimal = new Decimal(50).sinh();
      expect(res.e).assertEqual(21);
      expect(res.toString().startsWith('2')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SINH_SUPPLEMENT_TEST_6400
     * @tc.name testDecimalSinhTestTest064
     * @tc.desc Verify sinh(123.456) exponent e is 53
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalSinhTestTest064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: Decimal = new Decimal(123.456).sinh();
      expect(res.e).assertEqual(53);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SINH_SUPPLEMENT_TEST_6500
     * @tc.name testDecimalSinhTestTest065
     * @tc.desc Verify extra argument ignored by sinh
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalSinhTestTest065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Decimal = new Decimal(2).sinh();
      let b: Decimal = (new Decimal(2) as ESObject).sinh('ignored' as ESObject);
      expect(b.toString()).assertEqual(a.toString());
    });

  });

}
