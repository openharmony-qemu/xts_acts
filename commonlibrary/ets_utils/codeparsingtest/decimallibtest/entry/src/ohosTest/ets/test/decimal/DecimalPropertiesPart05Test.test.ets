
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

export default function decimalPropertiesPart05TestTest() {
  describe('DecimalPropertiesPart05TestTest', () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART05_SUPPLEMENT_TEST_0100
     * @tc.name testDecimalPropertiesPart05TestTest001
     * @tc.desc Verify 0/0 NaN d
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart05TestTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: Decimal = new Decimal(0).div(0);
      expect(dec.d === null).assertTrue()
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART05_SUPPLEMENT_TEST_0200
     * @tc.name testDecimalPropertiesPart05TestTest002
     * @tc.desc Verify NaN NaN d
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart05TestTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: Decimal = new Decimal(NaN).mul(5);
      expect(dec.d === null).assertTrue()
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART05_SUPPLEMENT_TEST_0300
     * @tc.name testDecimalPropertiesPart05TestTest003
     * @tc.desc Verify Infinity Infinity NaN d
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart05TestTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: Decimal = new Decimal(Infinity).sub(Infinity);
      expect(dec.d === null).assertTrue()
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART05_SUPPLEMENT_TEST_0400
     * @tc.name testDecimalPropertiesPart05TestTest004
     * @tc.desc Verify NaN d
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart05TestTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: Decimal = new Decimal(-4).sqrt();
      expect(dec.d === null).assertTrue()
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART05_SUPPLEMENT_TEST_0500
     * @tc.name testDecimalPropertiesPart05TestTest005
     * @tc.desc Verify asin(2) NaN d
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart05TestTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: Decimal = new Decimal(2).asin();
      expect(dec.d === null).assertTrue()
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART05_SUPPLEMENT_TEST_0600
     * @tc.name testDecimalPropertiesPart05TestTest006
     * @tc.desc Verify acos(-2) NaN d
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart05TestTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: Decimal = new Decimal(-2).acos();
      expect(dec.d === null).assertTrue()
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART05_SUPPLEMENT_TEST_0700
     * @tc.name testDecimalPropertiesPart05TestTest007
     * @tc.desc Verify NaN d
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart05TestTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: Decimal = new Decimal(-1).ln();
      expect(dec.d === null).assertTrue()
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART05_SUPPLEMENT_TEST_0800
     * @tc.name testDecimalPropertiesPart05TestTest008
     * @tc.desc Verify NaN negate NaN d
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart05TestTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: Decimal = new Decimal(NaN).negate();
      expect(dec.d === null).assertTrue()
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART05_SUPPLEMENT_TEST_0900
     * @tc.name testDecimalPropertiesPart05TestTest009
     * @tc.desc Verify 0 NaN NaN d
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart05TestTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: Decimal = new Decimal(0).add(NaN);
      expect(dec.d === null).assertTrue()
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART05_SUPPLEMENT_TEST_1000
     * @tc.name testDecimalPropertiesPart05TestTest010
     * @tc.desc Verify NaN d Array.isArray
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart05TestTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: Decimal = new Decimal(NaN);
      expect(Array.isArray(dec.d)).assertFalse();
      expect(dec.d === null).assertTrue();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART05_SUPPLEMENT_TEST_1100
     * @tc.name testDecimalPropertiesPart05TestTest011
     * @tc.desc Verify 1/0 d
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart05TestTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: Decimal = new Decimal(1).div(0);
      expect(dec.d === null).assertTrue()
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART05_SUPPLEMENT_TEST_1200
     * @tc.name testDecimalPropertiesPart05TestTest012
     * @tc.desc Verify -1/0 d
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart05TestTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: Decimal = new Decimal(-1).div(0);
      expect(dec.d === null).assertTrue()
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART05_SUPPLEMENT_TEST_1300
     * @tc.name testDecimalPropertiesPart05TestTest013
     * @tc.desc Verify Infinity 0 NaN d
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart05TestTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: Decimal = new Decimal(Infinity).mul(0);
      expect(dec.d === null).assertTrue()
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART05_SUPPLEMENT_TEST_1400
     * @tc.name testDecimalPropertiesPart05TestTest014
     * @tc.desc Verify 7 0 Infinity d
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart05TestTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: Decimal = new Decimal(7).div(0);
      expect(dec.d === null).assertTrue()
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART05_SUPPLEMENT_TEST_1500
     * @tc.name testDecimalPropertiesPart05TestTest015
     * @tc.desc Verify -7 0 -Infinity d
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart05TestTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: Decimal = new Decimal(-7).div(0);
      expect(dec.d === null).assertTrue()
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART05_SUPPLEMENT_TEST_1600
     * @tc.name testDecimalPropertiesPart05TestTest016
     * @tc.desc Verify 5 -0 d
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart05TestTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: Decimal = new Decimal(5).div(-0);
      expect(dec.d === null).assertTrue()
    });
  
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART05_SUPPLEMENT_TEST_1700
     * @tc.name testDecimalPropertiesPart05TestTest017
     * @tc.desc Verify NaN d
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart05TestTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: Decimal = new Decimal(-0).div(0);
      expect(dec.d === null).assertTrue()
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART05_SUPPLEMENT_TEST_1800
     * @tc.name testDecimalPropertiesPart05TestTest018
     * @tc.desc Verify 0 d
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart05TestTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: Decimal = new Decimal(0).ln();
      expect(dec.d === null).assertTrue()
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART05_SUPPLEMENT_TEST_1900
     * @tc.name testDecimalPropertiesPart05TestTest019
     * @tc.desc Verify d
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart05TestTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: Decimal = new Decimal(Infinity).add(5);
      expect(dec.d === null).assertTrue()
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART05_SUPPLEMENT_TEST_2000
     * @tc.name testDecimalPropertiesPart05TestTest020
     * @tc.desc Verify maxE Infinity d
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart05TestTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ maxE: 5 });
      let dec: Decimal = new Decimal('1e10');
      expect(dec.d === null).assertTrue()
      Decimal.set({ defaults: true });
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART05_SUPPLEMENT_TEST_2100
     * @tc.name testDecimalPropertiesPart05TestTest021
     * @tc.desc Verify -1e10 maxE=5 d
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart05TestTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ maxE: 5 });
      let dec: Decimal = new Decimal('-1e10');
      expect(dec.d === null).assertTrue()
      Decimal.set({ defaults: true });
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART05_SUPPLEMENT_TEST_2200
     * @tc.name testDecimalPropertiesPart05TestTest022
     * @tc.desc Verify d toString 'Infinity'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart05TestTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ maxE: 5 });
      let dec: Decimal = new Decimal('2e10');
      expect(dec.d === null).assertTrue()
      expect(dec.toString()).assertEqual('Infinity');
      Decimal.set({ defaults: true });
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART05_SUPPLEMENT_TEST_2300
     * @tc.name testDecimalPropertiesPart05TestTest023
     * @tc.desc Verify Infinity e 10 decimal.js
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart05TestTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ maxE: 5 });
      let dec: Decimal = new Decimal('1e10');
      expect(Number.isNaN(dec.e)).assertTrue();
      expect(dec.d === null).assertTrue();
      Decimal.set({ defaults: true });
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART05_SUPPLEMENT_TEST_2400
     * @tc.name testDecimalPropertiesPart05TestTest024
     * @tc.desc Verify maxE d
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart05TestTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ maxE: 10 });
      let dec: Decimal = new Decimal('1e10');
      expect(dec.d.length).assertEqual(1);
      expect(dec.d[0]).assertEqual(1000);
      Decimal.set({ defaults: true });
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART05_SUPPLEMENT_TEST_2500
     * @tc.name testDecimalPropertiesPart05TestTest025
     * @tc.desc Verify minE 0 d [0]
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart05TestTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ minE: -5 });
      let dec: Decimal = new Decimal('1e-10');
      expect(dec.d.length).assertEqual(1);
      expect(dec.d[0]).assertEqual(0);
      Decimal.set({ defaults: true });
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART05_SUPPLEMENT_TEST_2600
     * @tc.name testDecimalPropertiesPart05TestTest026
     * @tc.desc Verify 0 e
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart05TestTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ minE: -5 });
      let dec: Decimal = new Decimal('1e-10');
      expect(dec.e).assertEqual(0);
      Decimal.set({ defaults: true });
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART05_SUPPLEMENT_TEST_2700
     * @tc.name testDecimalPropertiesPart05TestTest027
     * @tc.desc Verify -1e-10 minE=-5 d [0]
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart05TestTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ minE: -5 });
      let dec: Decimal = new Decimal('-1e-10');
      expect(dec.d.length).assertEqual(1);
      expect(dec.d[0]).assertEqual(0);
      Decimal.set({ defaults: true });
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART05_SUPPLEMENT_TEST_2800
     * @tc.name testDecimalPropertiesPart05TestTest028
     * @tc.desc Verify minE d
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart05TestTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ minE: -10 });
      let dec: Decimal = new Decimal('1e-10');
      expect(dec.d.length).assertEqual(1);
      expect(dec.d[0]).assertEqual(10000);
      Decimal.set({ defaults: true });
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART05_SUPPLEMENT_TEST_2900
     * @tc.name testDecimalPropertiesPart05TestTest029
     * @tc.desc Verify MAX_VALUE d toNumber
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart05TestTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: Decimal = new Decimal(Number.MAX_VALUE);
      expect(dec.d.length).assertLarger(0);
      expect(dec.toNumber()).assertEqual(Number.MAX_VALUE);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART05_SUPPLEMENT_TEST_3000
     * @tc.name testDecimalPropertiesPart05TestTest030
     * @tc.desc Verify MIN_VALUE d 5
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart05TestTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: Decimal = new Decimal(Number.MIN_VALUE);
      expect(dec.d[0]).assertEqual(500000);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART05_SUPPLEMENT_TEST_3100
     * @tc.name testDecimalPropertiesPart05TestTest031
     * @tc.desc Verify -MIN_VALUE d 5 s=1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart05TestTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: Decimal = new Decimal(-Number.MIN_VALUE);
      expect(dec.d[0]).assertEqual(500000);
      expect(dec.s).assertEqual(-1);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART05_SUPPLEMENT_TEST_3200
     * @tc.name testDecimalPropertiesPart05TestTest032
     * @tc.desc Verify EPSILON d
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart05TestTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: Decimal = new Decimal(Number.EPSILON);
      expect(dec.d.length).assertLarger(0);
      expect(dec.s).assertEqual(1);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART05_SUPPLEMENT_TEST_3300
     * @tc.name testDecimalPropertiesPart05TestTest033
     * @tc.desc Verify '1e400' e maxE toNumber Infinity
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart05TestTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: Decimal = new Decimal('1e400');
      expect(dec.d[0]).assertEqual(10);
      expect(dec.toNumber()).assertEqual(Infinity);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART05_SUPPLEMENT_TEST_3400
     * @tc.name testDecimalPropertiesPart05TestTest034
     * @tc.desc Verify '-1e400' toNumber -Infinity
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart05TestTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: Decimal = new Decimal('-1e400');
      expect(dec.s).assertEqual(-1);
      expect(dec.toNumber()).assertEqual(-Infinity);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART05_SUPPLEMENT_TEST_3500
     * @tc.name testDecimalPropertiesPart05TestTest035
     * @tc.desc Verify '1e-400' toNumber 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart05TestTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: Decimal = new Decimal('1e-400');
      expect(dec.toNumber()).assertEqual(0);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART05_SUPPLEMENT_TEST_3600
     * @tc.name testDecimalPropertiesPart05TestTest036
     * @tc.desc Verify '9e15' d 9000000000000000
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart05TestTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: Decimal = new Decimal('9e15');
      expect(dec.d[0]).assertEqual(90);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART05_SUPPLEMENT_TEST_3700
     * @tc.name testDecimalPropertiesPart05TestTest037
     * @tc.desc Verify '1e400000000' e 400000000
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart05TestTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: Decimal = new Decimal('1e400000000');
      expect(dec.e).assertEqual(400000000);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART05_SUPPLEMENT_TEST_3800
     * @tc.name testDecimalPropertiesPart05TestTest038
     * @tc.desc Verify '1e-400000000' e -400000000
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart05TestTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: Decimal = new Decimal('1e-400000000');
      expect(dec.e).assertEqual(-400000000);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART05_SUPPLEMENT_TEST_3900
     * @tc.name testDecimalPropertiesPart05TestTest039
     * @tc.desc Verify 9e15 e 9000000000000000
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart05TestTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: Decimal = new Decimal('1e9000000000000000');
      expect(dec.e).assertEqual(9000000000000000);
      expect(dec.d[0]).assertEqual(100000);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART05_SUPPLEMENT_TEST_4000
     * @tc.name testDecimalPropertiesPart05TestTest040
     * @tc.desc Verify maxE '1e9000000000000001' Infinity
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart05TestTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: Decimal = new Decimal('1e9000000000000001');
      expect(dec.d === null).assertTrue()
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART05_SUPPLEMENT_TEST_4100
     * @tc.name testDecimalPropertiesPart05TestTest041
     * @tc.desc Verify -9e15 e -9000000000000000
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart05TestTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: Decimal = new Decimal('1e-9000000000000000');
      expect(dec.e).assertEqual(-9000000000000000);
      expect(dec.d[0]).assertEqual(100);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART05_SUPPLEMENT_TEST_4200
     * @tc.name testDecimalPropertiesPart05TestTest042
     * @tc.desc Verify minE '1e-9000000000000001' 0 e 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart05TestTest042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: Decimal = new Decimal('1e-9000000000000001');
      expect(dec.e).assertEqual(0);
      expect(dec.d[0]).assertEqual(0);
    });
  
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART05_SUPPLEMENT_TEST_4300
     * @tc.name testDecimalPropertiesPart05TestTest043
     * @tc.desc Verify -0 e 0 d [0]
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart05TestTest043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: Decimal = new Decimal(-0);
      expect(dec.e).assertEqual(0);
      expect(dec.d[0]).assertEqual(0);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART05_SUPPLEMENT_TEST_4400
     * @tc.name testDecimalPropertiesPart05TestTest044
     * @tc.desc Verify 0.00001 e -5
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart05TestTest044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: Decimal = new Decimal(0.00001);
      expect(dec.e).assertEqual(-5);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART05_SUPPLEMENT_TEST_4500
     * @tc.name testDecimalPropertiesPart05TestTest045
     * @tc.desc Verify 100000 e 5
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart05TestTest045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: Decimal = new Decimal(100000);
      expect(dec.e).assertEqual(5);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART05_SUPPLEMENT_TEST_4600
     * @tc.name testDecimalPropertiesPart05TestTest046
     * @tc.desc Verify maxE e 4 decimal.js
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart05TestTest046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ maxE: 3 });
      let dec: Decimal = new Decimal('12345');
      expect(Number.isNaN(dec.e)).assertTrue();
      expect(dec.d === null).assertTrue();
      Decimal.set({ defaults: true });
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART05_SUPPLEMENT_TEST_4700
     * @tc.name testDecimalPropertiesPart05TestTest047
     * @tc.desc Verify minE e d [0]
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart05TestTest047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ minE: -3 });
      let dec: Decimal = new Decimal('0.000123');
      expect(dec.e).assertEqual(0);
      expect(dec.d[0]).assertEqual(0);
      Decimal.set({ defaults: true });
    });
  
  
  
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART05_SUPPLEMENT_TEST_4800
     * @tc.name testDecimalPropertiesPart05TestTest048
     * @tc.desc Verify '0e+10' s 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart05TestTest048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: Decimal = new Decimal('0e+10');
      expect(dec.s).assertEqual(1);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART05_SUPPLEMENT_TEST_4900
     * @tc.name testDecimalPropertiesPart05TestTest049
     * @tc.desc Verify '-0e+10' s 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart05TestTest049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: Decimal = new Decimal('-0e+10');
      expect(dec.s).assertEqual(-1);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART05_SUPPLEMENT_TEST_5000
     * @tc.name testDecimalPropertiesPart05TestTest050
     * @tc.desc Verify '-5e-300' s 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart05TestTest050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: Decimal = new Decimal('-5e-300');
      expect(dec.s).assertEqual(-1);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART05_SUPPLEMENT_TEST_5100
     * @tc.name testDecimalPropertiesPart05TestTest051
     * @tc.desc Verify '5e-300' s 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart05TestTest051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: Decimal = new Decimal('5e-300');
      expect(dec.s).assertEqual(1);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART05_SUPPLEMENT_TEST_5200
     * @tc.name testDecimalPropertiesPart05TestTest052
     * @tc.desc Verify '-9e15' s 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart05TestTest052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: Decimal = new Decimal('-9e15');
      expect(dec.s).assertEqual(-1);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART05_SUPPLEMENT_TEST_5300
     * @tc.name testDecimalPropertiesPart05TestTest053
     * @tc.desc Verify s 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart05TestTest053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ maxE: 3 });
      let dec: Decimal = new Decimal('1e9');
      expect(dec.s).assertEqual(1);
      Decimal.set({ defaults: true });
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART05_SUPPLEMENT_TEST_5400
     * @tc.name testDecimalPropertiesPart05TestTest054
     * @tc.desc Verify s 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart05TestTest054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ maxE: 3 });
      let dec: Decimal = new Decimal('-1e9');
      expect(dec.s).assertEqual(-1);
      Decimal.set({ defaults: true });
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART05_SUPPLEMENT_TEST_5500
     * @tc.name testDecimalPropertiesPart05TestTest055
     * @tc.desc Verify 0 s 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart05TestTest055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ minE: -3 });
      let dec: Decimal = new Decimal('1e-9');
      expect(dec.s).assertEqual(1);
      Decimal.set({ defaults: true });
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART05_SUPPLEMENT_TEST_5600
     * @tc.name testDecimalPropertiesPart05TestTest056
     * @tc.desc Verify 0 s 1 -0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart05TestTest056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ minE: -3 });
      let dec: Decimal = new Decimal('-1e-9');
      expect(dec.s).assertEqual(-1);
      Decimal.set({ defaults: true });
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART05_SUPPLEMENT_TEST_5700
     * @tc.name testDecimalPropertiesPart05TestTest057
     * @tc.desc Verify (-3) (-4) s 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart05TestTest057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: Decimal = new Decimal(-3).mul(-4);
      expect(dec.s).assertEqual(1);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART05_SUPPLEMENT_TEST_5800
     * @tc.name testDecimalPropertiesPart05TestTest058
     * @tc.desc Verify (-3) 4 s 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart05TestTest058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: Decimal = new Decimal(-3).mul(4);
      expect(dec.s).assertEqual(-1);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART05_SUPPLEMENT_TEST_5900
     * @tc.name testDecimalPropertiesPart05TestTest059
     * @tc.desc Verify s 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart05TestTest059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: Decimal = new Decimal(-2).pow(3);
      expect(dec.s).assertEqual(-1);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART05_SUPPLEMENT_TEST_6000
     * @tc.name testDecimalPropertiesPart05TestTest060
     * @tc.desc Verify s 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart05TestTest060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: Decimal = new Decimal(-2).pow(2);
      expect(dec.s).assertEqual(1);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART05_SUPPLEMENT_TEST_6100
     * @tc.name testDecimalPropertiesPart05TestTest061
     * @tc.desc Verify s 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart05TestTest061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: Decimal = new Decimal(2).pow(-3);
      expect(dec.s).assertEqual(1);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART05_SUPPLEMENT_TEST_6200
     * @tc.name testDecimalPropertiesPart05TestTest062
     * @tc.desc Verify 0 -0 s 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart05TestTest062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: Decimal = new Decimal(0).div(-5);
      expect(dec.s).assertEqual(-1);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART05_SUPPLEMENT_TEST_6300
     * @tc.name testDecimalPropertiesPart05TestTest063
     * @tc.desc Verify 0 0 s 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart05TestTest063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: Decimal = new Decimal(0).div(5);
      expect(dec.s).assertEqual(1);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART05_SUPPLEMENT_TEST_6400
     * @tc.name testDecimalPropertiesPart05TestTest064
     * @tc.desc Verify negate s 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart05TestTest064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: Decimal = new Decimal(-0).negate();
      expect(dec.s).assertEqual(1);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART05_SUPPLEMENT_TEST_6500
     * @tc.name testDecimalPropertiesPart05TestTest065
     * @tc.desc Verify negate s 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart05TestTest065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: Decimal = new Decimal(5).negate();
      expect(dec.s).assertEqual(-1);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART05_SUPPLEMENT_TEST_6600
     * @tc.name testDecimalPropertiesPart05TestTest066
     * @tc.desc Verify negate s 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart05TestTest066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: Decimal = new Decimal(-5).negate();
      expect(dec.s).assertEqual(1);
    });
  
  
  
  
  
  
  
  
  
  
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART05_SUPPLEMENT_TEST_6700
     * @tc.name testDecimalPropertiesPart05TestTest067
     * @tc.desc Verify 0~9
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart05TestTest067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let setVal: Set<number> = new Set<number>();
      setVal.add(Decimal.ROUND_UP);
      setVal.add(Decimal.ROUND_DOWN);
      setVal.add(Decimal.ROUND_CEILING);
      setVal.add(Decimal.ROUND_FLOOR);
      setVal.add(Decimal.ROUND_HALF_UP);
      setVal.add(Decimal.ROUND_HALF_DOWN);
      setVal.add(Decimal.ROUND_HALF_EVEN);
      setVal.add(Decimal.ROUND_HALF_CEILING);
      setVal.add(Decimal.ROUND_HALF_FLOOR);
      setVal.add(Decimal.EUCLIDEAN);
      expect(setVal.size).assertEqual(10);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART05_SUPPLEMENT_TEST_6800
     * @tc.name testDecimalPropertiesPart05TestTest068
     * @tc.desc Verify Math.floor
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart05TestTest068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ok: boolean = Math.floor(Decimal.ROUND_HALF_EVEN) === Decimal.ROUND_HALF_EVEN;
      expect(ok).assertTrue();
      let ok2: boolean = Math.floor(Decimal.EUCLIDEAN) === Decimal.EUCLIDEAN;
      expect(ok2).assertTrue();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART05_SUPPLEMENT_TEST_6900
     * @tc.name testDecimalPropertiesPart05TestTest069
     * @tc.desc Verify 0~9
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart05TestTest069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Decimal.ROUND_DOWN - Decimal.ROUND_UP).assertEqual(1);
      expect(Decimal.ROUND_HALF_EVEN - Decimal.ROUND_FLOOR).assertEqual(3);
      expect(Decimal.EUCLIDEAN - Decimal.ROUND_HALF_FLOOR).assertEqual(1);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART05_SUPPLEMENT_TEST_7000
     * @tc.name testDecimalPropertiesPart05TestTest070
     * @tc.desc Verify set rounding ROUND_*
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart05TestTest070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ rounding: Decimal.ROUND_DOWN });
      expect(Decimal.ROUND_UP).assertEqual(0);
      expect(Decimal.ROUND_HALF_UP).assertEqual(4);
      Decimal.set({ defaults: true });
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART05_SUPPLEMENT_TEST_7100
     * @tc.name testDecimalPropertiesPart05TestTest071
     * @tc.desc Verify rounding 10
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart05TestTest071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Decimal('1.55').toFixed(1, 10 as ESObject);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(10200001);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART05_SUPPLEMENT_TEST_7200
     * @tc.name testDecimalPropertiesPart05TestTest072
     * @tc.desc Verify rounding -1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart05TestTest072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Decimal('1.55').toFixed(1, -1 as ESObject);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(10200001);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART05_SUPPLEMENT_TEST_7300
     * @tc.name testDecimalPropertiesPart05TestTest073
     * @tc.desc Verify rounding 4.5
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart05TestTest073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Decimal('1.55').toFixed(1, 4.5 as ESObject);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(10200001);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART05_SUPPLEMENT_TEST_7400
     * @tc.name testDecimalPropertiesPart05TestTest074
     * @tc.desc Verify rounding 10 toPrecision
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart05TestTest074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Decimal('1.55').toPrecision(2, 10 as ESObject);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(10200001);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART05_SUPPLEMENT_TEST_7500
     * @tc.name testDecimalPropertiesPart05TestTest075
     * @tc.desc Verify EUCLIDEAN -10 mod 6 2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart05TestTest075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ modulo: Decimal.EUCLIDEAN });
      let dec: Decimal = new Decimal(-10).mod(6);
      expect(dec.toString()).assertEqual('2');
      Decimal.set({ defaults: true });
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART05_SUPPLEMENT_TEST_7600
     * @tc.name testDecimalPropertiesPart05TestTest076
     * @tc.desc Verify ROUND_DOWN 1.5 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart05TestTest076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: string = new Decimal('1.5').toFixed(0, Decimal.ROUND_DOWN);
      expect(dec).assertEqual('1');
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART05_SUPPLEMENT_TEST_7700
     * @tc.name testDecimalPropertiesPart05TestTest077
     * @tc.desc Verify ROUND_HALF_FLOOR -1.5 -2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart05TestTest077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: string = new Decimal('-1.5').toFixed(0, Decimal.ROUND_HALF_FLOOR);
      expect(dec).assertEqual('-2');
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART05_SUPPLEMENT_TEST_7800
     * @tc.name testDecimalPropertiesPart05TestTest078
     * @tc.desc Verify ROUND_HALF_CEILING 1.5 2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart05TestTest078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: string = new Decimal('1.5').toFixed(0, Decimal.ROUND_HALF_CEILING);
      expect(dec).assertEqual('2');
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART05_SUPPLEMENT_TEST_7900
     * @tc.name testDecimalPropertiesPart05TestTest079
     * @tc.desc Verify '-123456789012345678901234567890' d/e/s
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart05TestTest079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: Decimal = new Decimal('-123456789012345678901234567890');
      expect(dec.s).assertEqual(-1);
      expect(dec.e).assertEqual(29);
      expect(dec.d.length).assertLarger(1);
      expect(dec.d[0]).assertLarger(0);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART05_SUPPLEMENT_TEST_8000
     * @tc.name testDecimalPropertiesPart05TestTest080
     * @tc.desc Verify '1e-400' d/e/s
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart05TestTest080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: Decimal = new Decimal('1e-400');
      expect(dec.d[0]).assertEqual(1000000);
      expect(dec.e).assertEqual(-400);
      expect(dec.s).assertEqual(1);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART05_SUPPLEMENT_TEST_8100
     * @tc.name testDecimalPropertiesPart05TestTest081
     * @tc.desc Verify '1e400' d/e/s
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart05TestTest081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: Decimal = new Decimal('1e400');
      expect(dec.d[0]).assertEqual(10);
      expect(dec.e).assertEqual(400);
      expect(dec.s).assertEqual(1);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART05_SUPPLEMENT_TEST_8200
     * @tc.name testDecimalPropertiesPart05TestTest082
     * @tc.desc Verify '-0.5' d/e/s
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart05TestTest082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: Decimal = new Decimal('-0.5');
      expect(dec.d[0]).assertEqual(5000000);
      expect(dec.e).assertEqual(-1);
      expect(dec.s).assertEqual(-1);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART05_SUPPLEMENT_TEST_8300
     * @tc.name testDecimalPropertiesPart05TestTest083
     * @tc.desc Verify s/e/d set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
        it('testDecimalPropertiesPart05TestTest083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ maxE: 4, minE: -4 });
      let over: Decimal = new Decimal('1e9');
      let under: Decimal = new Decimal('1e-9');
      expect(over.toString()).assertEqual('Infinity');
      expect(under.toString()).assertEqual('0');
      Decimal.set({ defaults: true });
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART05_SUPPLEMENT_TEST_8400
     * @tc.name testDecimalPropertiesPart05TestTest084
     * @tc.desc Verify 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart05TestTest084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ maxE: 4, minE: -4 });
      let over: Decimal = new Decimal('-1e9');
      let under: Decimal = new Decimal('-1e-9');
      expect(over.s).assertEqual(-1);
      expect(under.s).assertEqual(-1);
      Decimal.set({ defaults: true });
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART05_SUPPLEMENT_TEST_8500
     * @tc.name testDecimalPropertiesPart05TestTest085
     * @tc.desc Verify d/e/s NaN Infinity -0 maxE/minE Number MAX/MIN/EPSILON
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart05TestTest085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nanDec: Decimal = new Decimal(0).div(0);
      expect(nanDec.d === null).assertTrue()
      let zero: Decimal = new Decimal(-0);
      expect(zero.s).assertEqual(-1);
      expect(Decimal.EUCLIDEAN).assertEqual(9);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART05_SUPPLEMENT_TEST_8600
     * @tc.name testDecimalPropertiesPart05TestTest086
     * @tc.desc Verify DP-ERROR-NUMBER DP-BASIC-NUMBER part01 DP-BASIC-STRI
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart05TestTest086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let signCheck: Decimal = new Decimal('-123.45');
      expect(signCheck.s).assertEqual(-1);
      expect(signCheck.e).assertEqual(2);
    });
  
  });

}
