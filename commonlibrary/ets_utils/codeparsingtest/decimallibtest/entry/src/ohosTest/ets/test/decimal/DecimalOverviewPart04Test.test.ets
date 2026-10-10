
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

export default function decimalOverviewPart04TestTest() {
  describe('DecimalOverviewPart04TestTest', () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART04_SUPPLEMENT_TEST_0100
     * @tc.name testDecimalOverviewPart04TestTest001
     * @tc.desc Verify string|number number 3.25
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart04TestTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: string | number = 3.25;
      let d: Decimal = new Decimal(v);
      expect(d.toString()).assertEqual('3.25');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART04_SUPPLEMENT_TEST_0200
     * @tc.name testDecimalOverviewPart04TestTest002
     * @tc.desc Verify string|number number add
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart04TestTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: string | number = 7;
      let r: Decimal = new Decimal(2).add(v);
      expect(r.toString()).assertEqual('9');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART04_SUPPLEMENT_TEST_0300
     * @tc.name testDecimalOverviewPart04TestTest003
     * @tc.desc Verify string|number string '1.5' mul
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart04TestTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: string | number = '1.5';
      let r: Decimal = new Decimal(4).mul(v);
      expect(r.toString()).assertEqual('6');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART04_SUPPLEMENT_TEST_0400
     * @tc.name testDecimalOverviewPart04TestTest004
     * @tc.desc Verify string|number number sub
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart04TestTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: string | number = 2;
      let r: Decimal = new Decimal(10).sub(v);
      expect(r.toString()).assertEqual('8');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART04_SUPPLEMENT_TEST_0500
     * @tc.name testDecimalOverviewPart04TestTest005
     * @tc.desc Verify string|number string '2' div
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart04TestTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: string | number = '2';
      let r: Decimal = new Decimal(8).div(v);
      expect(r.toString()).assertEqual('4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART04_SUPPLEMENT_TEST_0600
     * @tc.name testDecimalOverviewPart04TestTest006
     * @tc.desc Verify string|number string '5' comparedTo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart04TestTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: string | number = '5';
      let c: number = new Decimal(5).comparedTo(v);
      expect(c).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART04_SUPPLEMENT_TEST_0700
     * @tc.name testDecimalOverviewPart04TestTest007
     * @tc.desc Verify string|number number 0.5 equals
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart04TestTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: string | number = 0.5;
      let eq: boolean = new Decimal('0.5').equals(v);
      expect(eq).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART04_SUPPLEMENT_TEST_0800
     * @tc.name testDecimalOverviewPart04TestTest008
     * @tc.desc Verify number|Decimal Decimal '2.5'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart04TestTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: number | Decimal = new Decimal('2.5');
      let d: Decimal = new Decimal(v);
      expect(d.toString()).assertEqual('2.5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART04_SUPPLEMENT_TEST_0900
     * @tc.name testDecimalOverviewPart04TestTest009
     * @tc.desc Verify number|Decimal number 6
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart04TestTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: number | Decimal = 6;
      let d: Decimal = new Decimal(v);
      expect(d.toString()).assertEqual('6');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART04_SUPPLEMENT_TEST_1000
     * @tc.name testDecimalOverviewPart04TestTest010
     * @tc.desc Verify number|Decimal Decimal add
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart04TestTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: number | Decimal = new Decimal(3);
      let r: Decimal = new Decimal(4).add(v);
      expect(r.toString()).assertEqual('7');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART04_SUPPLEMENT_TEST_1100
     * @tc.name testDecimalOverviewPart04TestTest011
     * @tc.desc Verify number|Decimal number mul
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart04TestTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: number | Decimal = 2;
      let r: Decimal = new Decimal(3).mul(v);
      expect(r.toString()).assertEqual('6');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART04_SUPPLEMENT_TEST_1200
     * @tc.name testDecimalOverviewPart04TestTest012
     * @tc.desc Verify number|Decimal Decimal pow
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart04TestTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: number | Decimal = new Decimal(2);
      let r: Decimal = new Decimal(3).pow(v);
      expect(r.toString()).assertEqual('9');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART04_SUPPLEMENT_TEST_1300
     * @tc.name testDecimalOverviewPart04TestTest013
     * @tc.desc Verify number|Decimal number mod
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart04TestTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: number | Decimal = 4;
      let r: Decimal = new Decimal(10).mod(v);
      expect(r.toString()).assertEqual('2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART04_SUPPLEMENT_TEST_1400
     * @tc.name testDecimalOverviewPart04TestTest014
     * @tc.desc Verify number|Decimal Decimal comparedTo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart04TestTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: number | Decimal = new Decimal('1.25');
      let c: number = new Decimal('1.25').comparedTo(v);
      expect(c).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART04_SUPPLEMENT_TEST_1500
     * @tc.name testDecimalOverviewPart04TestTest015
     * @tc.desc Verify string|Decimal string '7.5'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart04TestTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: string | Decimal = '7.5';
      let d: Decimal = new Decimal(v);
      expect(d.toString()).assertEqual('7.5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART04_SUPPLEMENT_TEST_1600
     * @tc.name testDecimalOverviewPart04TestTest016
     * @tc.desc Verify string|Decimal Decimal '-3'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart04TestTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: string | Decimal = new Decimal('-3');
      let d: Decimal = new Decimal(v);
      expect(d.toString()).assertEqual('-3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART04_SUPPLEMENT_TEST_1700
     * @tc.name testDecimalOverviewPart04TestTest017
     * @tc.desc Verify string|Decimal string '0.5' sub
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart04TestTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: string | Decimal = '0.5';
      let r: Decimal = new Decimal(2).sub(v);
      expect(r.toString()).assertEqual('1.5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART04_SUPPLEMENT_TEST_1800
     * @tc.name testDecimalOverviewPart04TestTest018
     * @tc.desc Verify string|Decimal Decimal div
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart04TestTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: string | Decimal = new Decimal(4);
      let r: Decimal = new Decimal(16).div(v);
      expect(r.toString()).assertEqual('4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART04_SUPPLEMENT_TEST_1900
     * @tc.name testDecimalOverviewPart04TestTest019
     * @tc.desc Verify string|Decimal string '3' mod
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart04TestTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: string | Decimal = '3';
      let r: Decimal = new Decimal(11).mod(v);
      expect(r.toString()).assertEqual('2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART04_SUPPLEMENT_TEST_2000
     * @tc.name testDecimalOverviewPart04TestTest020
     * @tc.desc Verify string|Decimal Decimal equals
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart04TestTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: string | Decimal = new Decimal(9);
      let eq: boolean = new Decimal(9).equals(v);
      expect(eq).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART04_SUPPLEMENT_TEST_2100
     * @tc.name testDecimalOverviewPart04TestTest021
     * @tc.desc Verify string|Decimal string '2' dividedToIntegerBy
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart04TestTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: string | Decimal = '2';
      let r: Decimal = new Decimal(7).dividedToIntegerBy(v);
      expect(r.toString()).assertEqual('3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART04_SUPPLEMENT_TEST_2200
     * @tc.name testDecimalOverviewPart04TestTest022
     * @tc.desc Verify string|number|Decimal string '123.45'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart04TestTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: string | number | Decimal = '123.45';
      let d: Decimal = new Decimal(v);
      expect(d.toString()).assertEqual('123.45');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART04_SUPPLEMENT_TEST_2300
     * @tc.name testDecimalOverviewPart04TestTest023
     * @tc.desc Verify string|number|Decimal number 0.75
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart04TestTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: string | number | Decimal = 0.75;
      let d: Decimal = new Decimal(v);
      expect(d.toString()).assertEqual('0.75');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART04_SUPPLEMENT_TEST_2400
     * @tc.name testDecimalOverviewPart04TestTest024
     * @tc.desc Verify string|number|Decimal Decimal '1e2' 100
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart04TestTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: string | number | Decimal = new Decimal('1e2');
      let d: Decimal = new Decimal(v);
      expect(d.toString()).assertEqual('100');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART04_SUPPLEMENT_TEST_2500
     * @tc.name testDecimalOverviewPart04TestTest025
     * @tc.desc Verify string|number|Decimal string '0.25' toNearest
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart04TestTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: string | number | Decimal = '0.25';
      let r: Decimal = new Decimal(1.39).toNearest(v);
      expect(r.toString()).assertEqual('1.5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART04_SUPPLEMENT_TEST_2600
     * @tc.name testDecimalOverviewPart04TestTest026
     * @tc.desc Verify string|number|Decimal number log
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart04TestTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: string | number | Decimal = 2;
      let r: Decimal = new Decimal(8).log(v);
      expect(r.toString()).assertEqual('3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART04_SUPPLEMENT_TEST_2700
     * @tc.name testDecimalOverviewPart04TestTest027
     * @tc.desc Verify string|number|Decimal string '0' clamp
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart04TestTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: string | number | Decimal = '0';
      let r: Decimal = new Decimal(10.1).clamp(v, 10);
      expect(r.toString()).assertEqual('10');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART04_SUPPLEMENT_TEST_2800
     * @tc.name testDecimalOverviewPart04TestTest028
     * @tc.desc Verify pow string number
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart04TestTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.pow('2', 3);
      expect(r.toString()).assertEqual('8');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART04_SUPPLEMENT_TEST_2900
     * @tc.name testDecimalOverviewPart04TestTest029
     * @tc.desc Verify atan2 string number /4
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart04TestTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: string | number | Decimal = '1';
      let r: Decimal = Decimal.atan2(v, 1);
      expect(Math.abs(r.toNumber() - Math.PI / 4)).assertLess(1e-14);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART04_SUPPLEMENT_TEST_3000
     * @tc.name testDecimalOverviewPart04TestTest030
     * @tc.desc Verify string/number/Decimal sum 14
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart04TestTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.sum('2', 3, new Decimal(4), 5);
      expect(r.toString()).assertEqual('14');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART04_SUPPLEMENT_TEST_3100
     * @tc.name testDecimalOverviewPart04TestTest031
     * @tc.desc Verify max 4
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart04TestTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.max('1', new Decimal(2), 3, '4');
      expect(r.toString()).assertEqual('4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART04_SUPPLEMENT_TEST_3200
     * @tc.name testDecimalOverviewPart04TestTest032
     * @tc.desc Verify min 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart04TestTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.min('4', new Decimal(3), 2, '1');
      expect(r.toString()).assertEqual('1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART04_SUPPLEMENT_TEST_3300
     * @tc.name testDecimalOverviewPart04TestTest033
     * @tc.desc Verify hypot 3-4-5
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart04TestTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.hypot('3', new Decimal(4));
      expect(r.toString()).assertEqual('5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART04_SUPPLEMENT_TEST_3400
     * @tc.name testDecimalOverviewPart04TestTest034
     * @tc.desc Verify string|number|Decimal|boolean|null boolean 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart04TestTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: string | number | Decimal | boolean | null = true;
      try {
        let d: Decimal = new Decimal(v as ESObject);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART04_SUPPLEMENT_TEST_3500
     * @tc.name testDecimalOverviewPart04TestTest035
     * @tc.desc Verify string|number|Decimal|boolean|null|undefined undefined 401 [DP-COMPOSITE-UNION-INTERSE
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart04TestTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: string | number | Decimal | boolean | null | undefined = undefined;
      try {
        let d: Decimal = new Decimal(v as ESObject);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART04_SUPPLEMENT_TEST_3600
     * @tc.name testDecimalOverviewPart04TestTest036
     * @tc.desc Verify string|null null 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart04TestTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: string | null = null;
      try {
        let d: Decimal = new Decimal(v as ESObject);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART04_SUPPLEMENT_TEST_3700
     * @tc.name testDecimalOverviewPart04TestTest037
     * @tc.desc Verify number|null null add 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart04TestTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: number | null = null;
      try {
        let d: Decimal = new Decimal(5).add(v as ESObject);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART04_SUPPLEMENT_TEST_3800
     * @tc.name testDecimalOverviewPart04TestTest038
     * @tc.desc Verify Decimal|null null mul 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart04TestTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: Decimal | null = null;
      try {
        let d: Decimal = new Decimal(5).mul(v as ESObject);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART04_SUPPLEMENT_TEST_3900
     * @tc.name testDecimalOverviewPart04TestTest039
     * @tc.desc Verify string|undefined undefined 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart04TestTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: string | undefined = undefined;
      try {
        let d: Decimal = new Decimal(v as ESObject);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART04_SUPPLEMENT_TEST_4000
     * @tc.name testDecimalOverviewPart04TestTest040
     * @tc.desc Verify number|undefined undefined sub 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart04TestTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: number | undefined = undefined;
      try {
        let d: Decimal = new Decimal(5).sub(v as ESObject);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART04_SUPPLEMENT_TEST_4100
     * @tc.name testDecimalOverviewPart04TestTest041
     * @tc.desc Verify Decimal|undefined undefined div 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart04TestTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: Decimal | undefined = undefined;
      try {
        let d: Decimal = new Decimal(5).div(v as ESObject);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART04_SUPPLEMENT_TEST_4200
     * @tc.name testDecimalOverviewPart04TestTest042
     * @tc.desc Verify string|number|null null sum 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart04TestTest042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: string | number | null = null;
      try {
        let d: Decimal = Decimal.sum('1', v as ESObject);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART04_SUPPLEMENT_TEST_4300
     * @tc.name testDecimalOverviewPart04TestTest043
     * @tc.desc Verify string|number|Decimal|undefined undefined mod 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart04TestTest043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: string | number | Decimal | undefined = undefined;
      try {
        let d: Decimal = new Decimal(5).mod(v as ESObject);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART04_SUPPLEMENT_TEST_4400
     * @tc.name testDecimalOverviewPart04TestTest044
     * @tc.desc Verify number|null null comparedTo 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart04TestTest044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: number | null = null;
      try {
        let c: number = new Decimal(5).comparedTo(v as ESObject);
        expect(Number.isNaN(c)).assertFalse();
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART04_SUPPLEMENT_TEST_4500
     * @tc.name testDecimalOverviewPart04TestTest045
     * @tc.desc Verify Decimal|undefined undefined greaterThanOrEqualTo 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart04TestTest045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: Decimal | undefined = undefined;
      try {
        let b: boolean = new Decimal(5).greaterThanOrEqualTo(v as ESObject);
        expect(b).assertFalse();
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART04_SUPPLEMENT_TEST_4600
     * @tc.name testDecimalOverviewPart04TestTest046
     * @tc.desc Verify string|null null max 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart04TestTest046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: string | null = null;
      try {
        let d: Decimal = Decimal.max(v as ESObject);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART04_SUPPLEMENT_TEST_4700
     * @tc.name testDecimalOverviewPart04TestTest047
     * @tc.desc Verify number|undefined undefined pow 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart04TestTest047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: number | undefined = undefined;
      try {
        let d: Decimal = new Decimal(5).pow(v as ESObject);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART04_SUPPLEMENT_TEST_4800
     * @tc.name testDecimalOverviewPart04TestTest048
     * @tc.desc Verify Decimal|Date Date 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart04TestTest048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: Decimal | Date = new Date(0);
      try {
        let d: Decimal = new Decimal(v as ESObject);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART04_SUPPLEMENT_TEST_4900
     * @tc.name testDecimalOverviewPart04TestTest049
     * @tc.desc Verify Decimal|RegExp RegExp 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart04TestTest049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: Decimal | RegExp = new RegExp('x');
      try {
        let d: Decimal = new Decimal(v as ESObject);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART04_SUPPLEMENT_TEST_5000
     * @tc.name testDecimalOverviewPart04TestTest050
     * @tc.desc Verify Decimal|Error Error 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart04TestTest050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: Decimal | Error = new Error('boom');
      try {
        let d: Decimal = new Decimal(v as ESObject);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART04_SUPPLEMENT_TEST_5100
     * @tc.name testDecimalOverviewPart04TestTest051
     * @tc.desc Verify Decimal|Array 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart04TestTest051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: Decimal | number[] = [1, 2];
      try {
        let d: Decimal = new Decimal(v as ESObject);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART04_SUPPLEMENT_TEST_5200
     * @tc.name testDecimalOverviewPart04TestTest052
     * @tc.desc Verify Decimal|Map Map 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart04TestTest052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: Decimal | Map<string, number> = new Map<string, number>();
      try {
        let d: Decimal = new Decimal(v as ESObject);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART04_SUPPLEMENT_TEST_5300
     * @tc.name testDecimalOverviewPart04TestTest053
     * @tc.desc Verify Decimal|Set Set 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart04TestTest053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: Decimal | Set<number> = new Set<number>();
      try {
        let d: Decimal = new Decimal(v as ESObject);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART04_SUPPLEMENT_TEST_5400
     * @tc.name testDecimalOverviewPart04TestTest054
     * @tc.desc Verify object input 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart04TestTest054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let hit: boolean = false;
      try {
        new Decimal({ v: 3 } as ESObject).toString();
      } catch (e) {
        expect(e.name).assertEqual('BusinessError');
        expect((e as BusinessError).code).assertEqual(401);
        hit = true;
      }
      expect(hit).assertTrue();


    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART04_SUPPLEMENT_TEST_5500
     * @tc.name testDecimalOverviewPart04TestTest055
     * @tc.desc Verify string|number|Decimal|Date|null Date 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart04TestTest055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: string | number | Decimal | Date | null = new Date(1);
      try {
        let d: Decimal = new Decimal(v as ESObject);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART04_SUPPLEMENT_TEST_5600
     * @tc.name testDecimalOverviewPart04TestTest056
     * @tc.desc Verify string|Decimal|RegExp RegExp 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart04TestTest056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: string | Decimal | RegExp = new RegExp('5');
      try {
        let d: Decimal = new Decimal(v as ESObject);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART04_SUPPLEMENT_TEST_5700
     * @tc.name testDecimalOverviewPart04TestTest057
     * @tc.desc Verify number
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart04TestTest057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: number | Date = 3;
      let r: Decimal = new Decimal(4).add(v);
      expect(r.toString()).assertEqual('7');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART04_SUPPLEMENT_TEST_5800
     * @tc.name testDecimalOverviewPart04TestTest058
     * @tc.desc Verify Decimal
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart04TestTest058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Decimal = new Decimal('0.1');
      let b: Decimal = new Decimal('0.10');
      expect(a.comparedTo(b)).assertEqual(0);
      expect(a === b).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART04_SUPPLEMENT_TEST_5900
     * @tc.name testDecimalOverviewPart04TestTest059
     * @tc.desc Verify typeof string
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart04TestTest059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: string | number = '8';
      let r: Decimal = new Decimal(0);
      if (typeof v === 'string') {
        r = new Decimal(v).mul(2);
      }
      expect(r.toString()).assertEqual('16');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART04_SUPPLEMENT_TEST_6000
     * @tc.name testDecimalOverviewPart04TestTest060
     * @tc.desc Verify typeof number else
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart04TestTest060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: string | number = 8;
      let r: Decimal = new Decimal(0);
      if (typeof v === 'number') {
        r = new Decimal(v).add(2);
      } else {
        r = new Decimal(v).sub(2);
      }
      expect(r.toString()).assertEqual('10');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART04_SUPPLEMENT_TEST_6100
     * @tc.name testDecimalOverviewPart04TestTest061
     * @tc.desc Verify instanceof Decimal
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart04TestTest061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: Decimal | number = new Decimal(6);
      let r: Decimal = new Decimal(0);
      if (v instanceof Decimal) {
        r = v.mul(2);
      }
      expect(r.toString()).assertEqual('12');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART04_SUPPLEMENT_TEST_6200
     * @tc.name testDecimalOverviewPart04TestTest062
     * @tc.desc Verify Number.isNaN NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart04TestTest062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: number | Decimal = NaN;
      let r: Decimal = new Decimal(0);
      if (Number.isNaN(v)) {
        r = new Decimal(1);
      } else {
        r = new Decimal(v);
      }
      expect(r.toString()).assertEqual('1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART04_SUPPLEMENT_TEST_6300
     * @tc.name testDecimalOverviewPart04TestTest063
     * @tc.desc Verify 401 [device does not throw, expected error pending SDK alignment]
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart04TestTest063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: ESObject = {};
      try {
        new Decimal(obj as Decimal);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART04_SUPPLEMENT_TEST_6400
     * @tc.name testDecimalOverviewPart04TestTest064
     * @tc.desc Verify sum
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart04TestTest064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.sum(new Decimal(1), '2', 3);
      expect(r.toString()).assertEqual('6');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART04_SUPPLEMENT_TEST_6500
     * @tc.name testDecimalOverviewPart04TestTest065
     * @tc.desc Verify toNearest number string
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart04TestTest065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Decimal = new Decimal(9.499).toNearest(0.5);
      let b: Decimal = new Decimal(9.499).toNearest('0.5');
      expect(a.toString()).assertEqual(b.toString());
      expect(a.toString()).assertEqual('9.5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART04_SUPPLEMENT_TEST_6600
     * @tc.name testDecimalOverviewPart04TestTest066
     * @tc.desc Verify type guard
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart04TestTest066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: string | Decimal = '10';
      let r: Decimal = new Decimal(0);
      if (typeof v === 'string') {
        r = new Decimal(v).div(2);
      } else {
        let v2: Decimal = v as Decimal;
        r = v2.div(2);
      }
      expect(r.toString()).assertEqual('5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART04_SUPPLEMENT_TEST_6700
     * @tc.name testDecimalOverviewPart04TestTest067
     * @tc.desc Verify clamp number Decimal
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart04TestTest067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = new Decimal(10.1).clamp(0, new Decimal(10));
      expect(r.toString()).assertEqual('10');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART04_SUPPLEMENT_TEST_6800
     * @tc.name testDecimalOverviewPart04TestTest068
     * @tc.desc Verify clamp Decimal string
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart04TestTest068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = new Decimal(-5).clamp(new Decimal(-1), '10');
      expect(r.toString()).assertEqual('-1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART04_SUPPLEMENT_TEST_6900
     * @tc.name testDecimalOverviewPart04TestTest069
     * @tc.desc Verify atan2 y string x Decimal 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart04TestTest069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.atan2('0', new Decimal(1));
      expect(r.toString()).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART04_SUPPLEMENT_TEST_7000
     * @tc.name testDecimalOverviewPart04TestTest070
     * @tc.desc Verify log Decimal string
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart04TestTest070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.log(new Decimal(8), '2');
      expect(r.toString()).assertEqual('3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART04_SUPPLEMENT_TEST_7100
     * @tc.name testDecimalOverviewPart04TestTest071
     * @tc.desc Verify toNearest n string rounding ROUND_UP
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart04TestTest071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = new Decimal(9.499).toNearest('0.5', 0);
      expect(r.toString()).assertEqual('9.5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART04_SUPPLEMENT_TEST_7200
     * @tc.name testDecimalOverviewPart04TestTest072
     * @tc.desc Verify toFraction maxDenominator string [311, 99]
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart04TestTest072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let f: Decimal[] = new Decimal('3.14159265358').toFraction('100');
      expect(f.length).assertEqual(2);
      expect(f[0].toString()).assertEqual('311');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART04_SUPPLEMENT_TEST_7300
     * @tc.name testDecimalOverviewPart04TestTest073
     * @tc.desc Verify add x string y Decimal
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart04TestTest073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.add('1.5', new Decimal(2.5));
      expect(r.toString()).assertEqual('4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART04_SUPPLEMENT_TEST_7400
     * @tc.name testDecimalOverviewPart04TestTest074
     * @tc.desc Verify mul x number y string
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart04TestTest074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.mul(3, '4');
      expect(r.toString()).assertEqual('12');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART04_SUPPLEMENT_TEST_7500
     * @tc.name testDecimalOverviewPart04TestTest075
     * @tc.desc Verify Decimal valueOf
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart04TestTest075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: string | number = 2.5;
      let d: Decimal = new Decimal(v);
      expect(d instanceof Decimal).assertTrue();
      expect(d.valueOf()).assertEqual('2.5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART04_SUPPLEMENT_TEST_7600
     * @tc.name testDecimalOverviewPart04TestTest076
     * @tc.desc Verify Decimal toNumber
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart04TestTest076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: string | number | Decimal = new Decimal('1e1');
      let d: Decimal = new Decimal(v);
      expect(d.toNumber()).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART04_SUPPLEMENT_TEST_7700
     * @tc.name testDecimalOverviewPart04TestTest077
     * @tc.desc Verify string|number string '9e15' Decimal
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart04TestTest077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: string | number = '9e15';
      let r: Decimal = new Decimal('9e15').add(v);
      expect(r.toString()).assertEqual('18000000000000000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART04_SUPPLEMENT_TEST_7800
     * @tc.name testDecimalOverviewPart04TestTest078
     * @tc.desc Verify number|Decimal Decimal Decimal Infinity
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart04TestTest078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: Decimal | number = new Decimal('1e+308');
      let r: Decimal = new Decimal('1e+308').add(v);
      expect(r.isFinite()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART04_SUPPLEMENT_TEST_7900
     * @tc.name testDecimalOverviewPart04TestTest079
     * @tc.desc Verify string|number string number
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart04TestTest079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: string | number = '2';
      let b: string | number = 2;
      expect(new Decimal(a).comparedTo(new Decimal(b))).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART04_SUPPLEMENT_TEST_8000
     * @tc.name testDecimalOverviewPart04TestTest080
     * @tc.desc Verify string|number|Decimal|boolean boolean 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart04TestTest080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string | number | Decimal | boolean = '1';
      let n: string | number | Decimal | boolean = 2;
      let dec: string | number | Decimal | boolean = new Decimal(3);
      expect(new Decimal(s).add(new Decimal(n)).add(new Decimal(dec)).toString()).assertEqual('6');
      let bad: string | number | Decimal | boolean = true;
      try {
        let d: Decimal = new Decimal(bad as ESObject);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART04_SUPPLEMENT_TEST_8100
     * @tc.name testDecimalOverviewPart04TestTest081
     * @tc.desc Verify set precision rest sum
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart04TestTest081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ precision: 3, rounding: 4 });
      let r: Decimal = Decimal.sum('1.111', new Decimal('2.222'));
      Decimal.set({ precision: 20, rounding: 4 });
      expect(r.toString()).assertEqual('3.33');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART04_SUPPLEMENT_TEST_8200
     * @tc.name testDecimalOverviewPart04TestTest082
     * @tc.desc Verify set rounding toNearest
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart04TestTest082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ rounding: 0 });
      let up: Decimal = new Decimal(1.25).toNearest('0.5');
      Decimal.set({ rounding: 1 });
      let down: Decimal = new Decimal(1.25).toNearest('0.5');
      Decimal.set({ rounding: 4 });
      expect(up.toString()).assertEqual('1.5');
      expect(down.toString()).assertEqual('1');
    });


  });

}
