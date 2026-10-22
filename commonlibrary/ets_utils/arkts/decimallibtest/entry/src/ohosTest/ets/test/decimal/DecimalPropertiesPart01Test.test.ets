
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

function sleep(time: number): Promise<void> {
  return new Promise<void>((resolve) => setTimeout(resolve, time));
}

export default function decimalPropertiesPart01TestTest() {
  describe('DecimalPropertiesPart01TestTest', () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART01_SUPPLEMENT_TEST_0100
     * @tc.name testDecimalPropertiesPart01TestTest001
     * @tc.desc Verify 123 d
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart01TestTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: Decimal = new Decimal(123);
      expect(dec.d.length).assertEqual(1);
      expect(dec.d[0]).assertEqual(123);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART01_SUPPLEMENT_TEST_0200
     * @tc.name testDecimalPropertiesPart01TestTest002
     * @tc.desc Verify -123 d 123 s
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart01TestTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: Decimal = new Decimal(-123);
      expect(dec.d[0]).assertEqual(123);
      expect(dec.s).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART01_SUPPLEMENT_TEST_0300
     * @tc.name testDecimalPropertiesPart01TestTest003
     * @tc.desc Verify 123.45 d
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart01TestTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: Decimal = new Decimal(123.45);
      expect(dec.d.length).assertEqual(2);
      expect(dec.d[0]).assertEqual(123);
      expect(dec.d[1]).assertEqual(4500000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART01_SUPPLEMENT_TEST_0400
     * @tc.name testDecimalPropertiesPart01TestTest004
     * @tc.desc Verify -123.45 d
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart01TestTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: Decimal = new Decimal(-123.45);
      expect(dec.d[0]).assertEqual(123);
      expect(dec.d[1]).assertEqual(4500000);
      expect(dec.s).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART01_SUPPLEMENT_TEST_0500
     * @tc.name testDecimalPropertiesPart01TestTest005
     * @tc.desc Verify 0 d
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart01TestTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: Decimal = new Decimal(0);
      expect(dec.d.length).assertEqual(1);
      expect(dec.d[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART01_SUPPLEMENT_TEST_0600
     * @tc.name testDecimalPropertiesPart01TestTest006
     * @tc.desc Verify -0 d 0 s=1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart01TestTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
  let zero: Decimal = new Decimal(0);
  let nz: Decimal = new Decimal(-0);
  expect(zero.toString()).assertEqual('0');
  expect(nz.toString()).assertEqual('0');
  expect(nz.isZero()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART01_SUPPLEMENT_TEST_0700
     * @tc.name testDecimalPropertiesPart01TestTest007
     * @tc.desc Verify d number[] typeof object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart01TestTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: Decimal = new Decimal(5);
      expect(Array.isArray(dec.d)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART01_SUPPLEMENT_TEST_0800
     * @tc.name testDecimalPropertiesPart01TestTest008
     * @tc.desc Verify d number
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart01TestTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: Decimal = new Decimal(123.45);
      expect(dec.toString()).assertEqual('123.45');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART01_SUPPLEMENT_TEST_0900
     * @tc.name testDecimalPropertiesPart01TestTest009
     * @tc.desc Verify MAX_SAFE_INTEGER d 9007199254740991
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart01TestTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: Decimal = new Decimal(Number.MAX_SAFE_INTEGER);
      expect(dec.d.length).assertEqual(3);
      expect(dec.d[0]).assertEqual(90);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART01_SUPPLEMENT_TEST_1000
     * @tc.name testDecimalPropertiesPart01TestTest010
     * @tc.desc Verify MIN_SAFE_INTEGER d 9007199254740991 s=1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart01TestTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: Decimal = new Decimal(Number.MIN_SAFE_INTEGER);
      expect(dec.d[0]).assertEqual(90);
      expect(dec.s).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART01_SUPPLEMENT_TEST_1100
     * @tc.name testDecimalPropertiesPart01TestTest011
     * @tc.desc Verify 9e15 d e 1e9
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart01TestTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: Decimal = new Decimal(9e15);
      expect(dec.d[0]).assertEqual(90);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART01_SUPPLEMENT_TEST_1200
     * @tc.name testDecimalPropertiesPart01TestTest012
     * @tc.desc Verify Number.MAX_SAFE_INTEGER 1e16 d
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart01TestTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: Decimal = new Decimal(1e16);
      expect(dec.d.length).assertLarger(0);
      expect(dec.d[0]).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART01_SUPPLEMENT_TEST_1300
     * @tc.name testDecimalPropertiesPart01TestTest013
     * @tc.desc Verify 1/3 d precision(20)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart01TestTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: Decimal = new Decimal('0.3333333333333333333333');
      let total: number = 0;
      for (let i: number = 0; i < dec.d.length; i++) {
        total += dec.d[i];
      }
      expect(total > 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART01_SUPPLEMENT_TEST_1400
     * @tc.name testDecimalPropertiesPart01TestTest014
     * @tc.desc Verify 5.50 5.5 d
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart01TestTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Decimal = new Decimal('5.50');
      let b: Decimal = new Decimal('5.5');
      expect(a.d.length).assertEqual(2);
      expect(b.d.length).assertEqual(2);
      expect(a.d[1]).assertEqual(5000000);
      expect(b.d[1]).assertEqual(5000000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART01_SUPPLEMENT_TEST_1500
     * @tc.name testDecimalPropertiesPart01TestTest015
     * @tc.desc Verify 0.000123 d 123 e -4 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart01TestTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: Decimal = new Decimal('0.000123');
      expect(dec.d[0]).assertEqual(1230);
      expect(dec.e).assertEqual(-4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART01_SUPPLEMENT_TEST_1600
     * @tc.name testDecimalPropertiesPart01TestTest016
     * @tc.desc Verify 1e21 d e
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart01TestTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: Decimal = new Decimal('1e21');
      expect(dec.d[0]).assertEqual(1);
      expect(dec.e).assertEqual(21);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART01_SUPPLEMENT_TEST_1700
     * @tc.name testDecimalPropertiesPart01TestTest017
     * @tc.desc Verify '123456789012345678901' d 2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart01TestTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: Decimal = new Decimal('123456789012345678901');
      expect(dec.d.length).assertLarger(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART01_SUPPLEMENT_TEST_1800
     * @tc.name testDecimalPropertiesPart01TestTest018
     * @tc.desc Verify d NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart01TestTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: Decimal = new Decimal('3.14');
      let hasNaN: boolean = false;
      for (let i: number = 0; i < dec.d.length; i++) {
        if (isNaN(dec.d[i])) { hasNaN = true; }
      }
      expect(hasNaN).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART01_SUPPLEMENT_TEST_1900
     * @tc.name testDecimalPropertiesPart01TestTest019
     * @tc.desc Verify d d
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart01TestTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: Decimal = new Decimal('123.45');
      let arr: number[] = dec.d;
      arr[0] = 999;
      expect(dec.toString()).assertEqual('999.45');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART01_SUPPLEMENT_TEST_2000
     * @tc.name testDecimalPropertiesPart01TestTest020
     * @tc.desc Verify d s
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart01TestTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let pos: Decimal = new Decimal('7');
      let neg: Decimal = new Decimal('-7');
      expect(pos.d[0]).assertEqual(neg.d[0]);
      expect(pos.s).assertEqual(1);
      expect(neg.s).assertEqual(-1);
      expect(pos.negate().toString()).assertEqual('-7');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART01_SUPPLEMENT_TEST_2100
     * @tc.name testDecimalPropertiesPart01TestTest021
     * @tc.desc Verify 123 e=2 3
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart01TestTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: Decimal = new Decimal(123);
      expect(dec.e).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART01_SUPPLEMENT_TEST_2200
     * @tc.name testDecimalPropertiesPart01TestTest022
     * @tc.desc Verify -123 e=2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart01TestTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: Decimal = new Decimal(-123);
      expect(dec.e).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART01_SUPPLEMENT_TEST_2300
     * @tc.name testDecimalPropertiesPart01TestTest023
     * @tc.desc Verify 5 e=0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart01TestTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: Decimal = new Decimal(5);
      expect(dec.e).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART01_SUPPLEMENT_TEST_2400
     * @tc.name testDecimalPropertiesPart01TestTest024
     * @tc.desc Verify 0.5 e=-1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart01TestTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: Decimal = new Decimal(0.5);
      expect(dec.e).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART01_SUPPLEMENT_TEST_2500
     * @tc.name testDecimalPropertiesPart01TestTest025
     * @tc.desc Verify 0.05 e=-2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart01TestTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: Decimal = new Decimal(0.05);
      expect(dec.e).assertEqual(-2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART01_SUPPLEMENT_TEST_2600
     * @tc.name testDecimalPropertiesPart01TestTest026
     * @tc.desc Verify 123.45 e=2 3
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart01TestTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: Decimal = new Decimal(123.45);
      expect(dec.e).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART01_SUPPLEMENT_TEST_2700
     * @tc.name testDecimalPropertiesPart01TestTest027
     * @tc.desc Verify -0.25 e=-1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart01TestTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: Decimal = new Decimal(-0.25);
      expect(dec.e).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART01_SUPPLEMENT_TEST_2800
     * @tc.name testDecimalPropertiesPart01TestTest028
     * @tc.desc Verify -Infinity e Infinity
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart01TestTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: Decimal = new Decimal(-Infinity);
      expect(Number.isNaN(dec.e)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART01_SUPPLEMENT_TEST_2900
     * @tc.name testDecimalPropertiesPart01TestTest029
     * @tc.desc Verify e number
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart01TestTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: Decimal = new Decimal(3.14);
      expect(dec.toString()).assertEqual('3.14');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART01_SUPPLEMENT_TEST_3000
     * @tc.name testDecimalPropertiesPart01TestTest030
     * @tc.desc Verify MAX_VALUE e=308
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart01TestTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: Decimal = new Decimal(Number.MAX_VALUE);
      expect(dec.e).assertEqual(308);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART01_SUPPLEMENT_TEST_3100
     * @tc.name testDecimalPropertiesPart01TestTest031
     * @tc.desc Verify MIN_VALUE e=-324
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart01TestTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: Decimal = new Decimal(Number.MIN_VALUE);
      expect(dec.e).assertEqual(-324);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART01_SUPPLEMENT_TEST_3200
     * @tc.name testDecimalPropertiesPart01TestTest032
     * @tc.desc Verify -MIN_VALUE e=-324
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart01TestTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: Decimal = new Decimal(-Number.MIN_VALUE);
      expect(dec.e).assertEqual(-324);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART01_SUPPLEMENT_TEST_3300
     * @tc.name testDecimalPropertiesPart01TestTest033
     * @tc.desc Verify EPSILON e=-16
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart01TestTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: Decimal = new Decimal(Number.EPSILON);
      expect(dec.e).assertEqual(-16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART01_SUPPLEMENT_TEST_3400
     * @tc.name testDecimalPropertiesPart01TestTest034
     * @tc.desc Verify 9e15 e=15
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart01TestTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: Decimal = new Decimal(9e15);
      expect(dec.e).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART01_SUPPLEMENT_TEST_3500
     * @tc.name testDecimalPropertiesPart01TestTest035
     * @tc.desc Verify '1e9999' e=9999 number
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart01TestTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: Decimal = new Decimal('1e9999');
      expect(dec.e).assertEqual(9999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART01_SUPPLEMENT_TEST_3600
     * @tc.name testDecimalPropertiesPart01TestTest036
     * @tc.desc Verify '1e-9999' e=-9999 minE
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart01TestTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: Decimal = new Decimal('1e-9999');
      expect(dec.e).assertEqual(-9999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART01_SUPPLEMENT_TEST_3700
     * @tc.name testDecimalPropertiesPart01TestTest037
     * @tc.desc Verify 123450 e=5 '12345e1' e=5
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart01TestTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Decimal = new Decimal(123450);
      let b: Decimal = new Decimal('12345e1');
      expect(a.e).assertEqual(5);
      expect(b.e).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART01_SUPPLEMENT_TEST_3800
     * @tc.name testDecimalPropertiesPart01TestTest038
     * @tc.desc Verify 1 s=0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart01TestTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: Decimal = new Decimal(1);
      expect(dec.s).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART01_SUPPLEMENT_TEST_3900
     * @tc.name testDecimalPropertiesPart01TestTest039
     * @tc.desc Verify -1 s=1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart01TestTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: Decimal = new Decimal(-1);
      expect(dec.s).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART01_SUPPLEMENT_TEST_4000
     * @tc.name testDecimalPropertiesPart01TestTest040
     * @tc.desc Verify 0 s=0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart01TestTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: Decimal = new Decimal(0);
      expect(dec.s).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART01_SUPPLEMENT_TEST_4100
     * @tc.name testDecimalPropertiesPart01TestTest041
     * @tc.desc Verify -0 s=1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart01TestTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: Decimal = new Decimal(-0);
      expect(dec.s).assertEqual(-1);
      expect(dec.valueOf()).assertEqual('-0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART01_SUPPLEMENT_TEST_4200
     * @tc.name testDecimalPropertiesPart01TestTest042
     * @tc.desc Verify -Infinity s=1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart01TestTest042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: Decimal = new Decimal(-Infinity);
      expect(dec.s).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART01_SUPPLEMENT_TEST_4300
     * @tc.name testDecimalPropertiesPart01TestTest043
     * @tc.desc Verify 0.5 s=0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart01TestTest043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: Decimal = new Decimal(0.5);
      expect(dec.s).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART01_SUPPLEMENT_TEST_4400
     * @tc.name testDecimalPropertiesPart01TestTest044
     * @tc.desc Verify -0.5 s=1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart01TestTest044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: Decimal = new Decimal(-0.5);
      expect(dec.s).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART01_SUPPLEMENT_TEST_4500
     * @tc.name testDecimalPropertiesPart01TestTest045
     * @tc.desc Verify s number
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart01TestTest045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: Decimal = new Decimal(2.5);
      expect(dec.toString()).assertEqual('2.5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART01_SUPPLEMENT_TEST_4600
     * @tc.name testDecimalPropertiesPart01TestTest046
     * @tc.desc Verify s
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart01TestTest046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: Decimal = new Decimal(5);
      let s: number = dec.s;
      s = 1;
      expect(dec.toString()).assertEqual('5');
      expect(dec.s).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART01_SUPPLEMENT_TEST_4700
     * @tc.name testDecimalPropertiesPart01TestTest047
     * @tc.desc Verify s isNegative/isPositive
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart01TestTest047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: Decimal = new Decimal(8);
      expect(dec.s).assertEqual(1);
      expect(dec.isPositive()).assertTrue();
      expect(dec.isNegative()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART01_SUPPLEMENT_TEST_4800
     * @tc.name testDecimalPropertiesPart01TestTest048
     * @tc.desc Verify s isNegative/isPositive
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart01TestTest048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: Decimal = new Decimal(-8);
      expect(dec.s).assertEqual(-1);
      expect(dec.isNegative()).assertTrue();
      expect(dec.isPositive()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART01_SUPPLEMENT_TEST_4900
     * @tc.name testDecimalPropertiesPart01TestTest049
     * @tc.desc Verify ROUND_UP 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart01TestTest049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Decimal.ROUND_UP).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART01_SUPPLEMENT_TEST_5000
     * @tc.name testDecimalPropertiesPart01TestTest050
     * @tc.desc Verify ROUND_DOWN 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart01TestTest050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Decimal.ROUND_DOWN).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART01_SUPPLEMENT_TEST_5100
     * @tc.name testDecimalPropertiesPart01TestTest051
     * @tc.desc Verify ROUND_UP 2.5 3
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart01TestTest051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: Decimal = new Decimal(2.5).toDecimalPlaces(0, Decimal.ROUND_UP);
      expect(dec.toString()).assertEqual('3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART01_SUPPLEMENT_TEST_5200
     * @tc.name testDecimalPropertiesPart01TestTest052
     * @tc.desc Verify ROUND_UP -2.5 -3
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart01TestTest052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: Decimal = new Decimal(-2.5).toDecimalPlaces(0, Decimal.ROUND_UP);
      expect(dec.toString()).assertEqual('-3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART01_SUPPLEMENT_TEST_5300
     * @tc.name testDecimalPropertiesPart01TestTest053
     * @tc.desc Verify ROUND_DOWN 2.5 2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart01TestTest053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: Decimal = new Decimal(2.5).toDecimalPlaces(0, Decimal.ROUND_DOWN);
      expect(dec.toString()).assertEqual('2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART01_SUPPLEMENT_TEST_5400
     * @tc.name testDecimalPropertiesPart01TestTest054
     * @tc.desc Verify ROUND_DOWN -2.5 -2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart01TestTest054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: Decimal = new Decimal(-2.5).toDecimalPlaces(0, Decimal.ROUND_DOWN);
      expect(dec.toString()).assertEqual('-2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART01_SUPPLEMENT_TEST_5500
     * @tc.name testDecimalPropertiesPart01TestTest055
     * @tc.desc Verify ROUND_UP rounding 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart01TestTest055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ rounding: 0 });
      let dec: Decimal = new Decimal(2.5).toDecimalPlaces(0);
      expect(dec.toString()).assertEqual('3');
      Decimal.set({ rounding: 4 });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART01_SUPPLEMENT_TEST_5600
     * @tc.name testDecimalPropertiesPart01TestTest056
     * @tc.desc Verify ROUND_DOWN rounding 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart01TestTest056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ rounding: 1 });
      let dec: Decimal = new Decimal(2.5).toDecimalPlaces(0);
      expect(dec.toString()).assertEqual('2');
      Decimal.set({ rounding: 4 });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART01_SUPPLEMENT_TEST_5700
     * @tc.name testDecimalPropertiesPart01TestTest057
     * @tc.desc Verify ROUND_CEILING 2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart01TestTest057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Decimal.ROUND_CEILING).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART01_SUPPLEMENT_TEST_5800
     * @tc.name testDecimalPropertiesPart01TestTest058
     * @tc.desc Verify ROUND_FLOOR 3
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart01TestTest058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Decimal.ROUND_FLOOR).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART01_SUPPLEMENT_TEST_5900
     * @tc.name testDecimalPropertiesPart01TestTest059
     * @tc.desc Verify ROUND_CEILING 2.1 3
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart01TestTest059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: Decimal = new Decimal(2.1).toDecimalPlaces(0, Decimal.ROUND_CEILING);
      expect(dec.toString()).assertEqual('3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART01_SUPPLEMENT_TEST_6000
     * @tc.name testDecimalPropertiesPart01TestTest060
     * @tc.desc Verify ROUND_CEILING -2.1 -2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart01TestTest060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: Decimal = new Decimal(-2.1).toDecimalPlaces(0, Decimal.ROUND_CEILING);
      expect(dec.toString()).assertEqual('-2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART01_SUPPLEMENT_TEST_6100
     * @tc.name testDecimalPropertiesPart01TestTest061
     * @tc.desc Verify ROUND_FLOOR 2.9 2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart01TestTest061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: Decimal = new Decimal(2.9).toDecimalPlaces(0, Decimal.ROUND_FLOOR);
      expect(dec.toString()).assertEqual('2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART01_SUPPLEMENT_TEST_6200
     * @tc.name testDecimalPropertiesPart01TestTest062
     * @tc.desc Verify ROUND_FLOOR -2.9 -3
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart01TestTest062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: Decimal = new Decimal(-2.9).toDecimalPlaces(0, Decimal.ROUND_FLOOR);
      expect(dec.toString()).assertEqual('-3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART01_SUPPLEMENT_TEST_6300
     * @tc.name testDecimalPropertiesPart01TestTest063
     * @tc.desc Verify ROUND_HALF_UP 4
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart01TestTest063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Decimal.ROUND_HALF_UP).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART01_SUPPLEMENT_TEST_6400
     * @tc.name testDecimalPropertiesPart01TestTest064
     * @tc.desc Verify ROUND_HALF_DOWN 5
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart01TestTest064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Decimal.ROUND_HALF_DOWN).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART01_SUPPLEMENT_TEST_6500
     * @tc.name testDecimalPropertiesPart01TestTest065
     * @tc.desc Verify ROUND_HALF_UP 2.5 3
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart01TestTest065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: Decimal = new Decimal(2.5).toDecimalPlaces(0, Decimal.ROUND_HALF_UP);
      expect(dec.toString()).assertEqual('3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART01_SUPPLEMENT_TEST_6600
     * @tc.name testDecimalPropertiesPart01TestTest066
     * @tc.desc Verify ROUND_HALF_UP -2.5 -3
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart01TestTest066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: Decimal = new Decimal(-2.5).toDecimalPlaces(0, Decimal.ROUND_HALF_UP);
      expect(dec.toString()).assertEqual('-3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART01_SUPPLEMENT_TEST_6700
     * @tc.name testDecimalPropertiesPart01TestTest067
     * @tc.desc Verify ROUND_HALF_DOWN 2.5 2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart01TestTest067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: Decimal = new Decimal(2.5).toDecimalPlaces(0, Decimal.ROUND_HALF_DOWN);
      expect(dec.toString()).assertEqual('2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART01_SUPPLEMENT_TEST_6800
     * @tc.name testDecimalPropertiesPart01TestTest068
     * @tc.desc Verify ROUND_HALF_DOWN -2.5 -2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart01TestTest068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: Decimal = new Decimal(-2.5).toDecimalPlaces(0, Decimal.ROUND_HALF_DOWN);
      expect(dec.toString()).assertEqual('-2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART01_SUPPLEMENT_TEST_6900
     * @tc.name testDecimalPropertiesPart01TestTest069
     * @tc.desc Verify ROUND_HALF_EVEN 6
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart01TestTest069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Decimal.ROUND_HALF_EVEN).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART01_SUPPLEMENT_TEST_7000
     * @tc.name testDecimalPropertiesPart01TestTest070
     * @tc.desc Verify ROUND_HALF_EVEN 2.5 2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart01TestTest070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: Decimal = new Decimal(2.5).toDecimalPlaces(0, Decimal.ROUND_HALF_EVEN);
      expect(dec.toString()).assertEqual('2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART01_SUPPLEMENT_TEST_7100
     * @tc.name testDecimalPropertiesPart01TestTest071
     * @tc.desc Verify ROUND_HALF_EVEN 3.5 4
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart01TestTest071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: Decimal = new Decimal(3.5).toDecimalPlaces(0, Decimal.ROUND_HALF_EVEN);
      expect(dec.toString()).assertEqual('4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART01_SUPPLEMENT_TEST_7200
     * @tc.name testDecimalPropertiesPart01TestTest072
     * @tc.desc Verify ROUND_HALF_EVEN -2.5 -2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart01TestTest072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: Decimal = new Decimal(-2.5).toDecimalPlaces(0, Decimal.ROUND_HALF_EVEN);
      expect(dec.toString()).assertEqual('-2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART01_SUPPLEMENT_TEST_7300
     * @tc.name testDecimalPropertiesPart01TestTest073
     * @tc.desc Verify ROUND_HALF_CEILING 7
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart01TestTest073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Decimal.ROUND_HALF_CEILING).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART01_SUPPLEMENT_TEST_7400
     * @tc.name testDecimalPropertiesPart01TestTest074
     * @tc.desc Verify ROUND_HALF_FLOOR 8
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart01TestTest074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Decimal.ROUND_HALF_FLOOR).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART01_SUPPLEMENT_TEST_7500
     * @tc.name testDecimalPropertiesPart01TestTest075
     * @tc.desc Verify ROUND_HALF_CEILING 2.5 3
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart01TestTest075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: Decimal = new Decimal(2.5).toDecimalPlaces(0, Decimal.ROUND_HALF_CEILING);
      expect(dec.toString()).assertEqual('3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART01_SUPPLEMENT_TEST_7600
     * @tc.name testDecimalPropertiesPart01TestTest076
     * @tc.desc Verify ROUND_HALF_CEILING -2.5 -2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart01TestTest076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: Decimal = new Decimal(-2.5).toDecimalPlaces(0, Decimal.ROUND_HALF_CEILING);
      expect(dec.toString()).assertEqual('-2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART01_SUPPLEMENT_TEST_7700
     * @tc.name testDecimalPropertiesPart01TestTest077
     * @tc.desc Verify ROUND_HALF_FLOOR 2.5 2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart01TestTest077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: Decimal = new Decimal(2.5).toDecimalPlaces(0, Decimal.ROUND_HALF_FLOOR);
      expect(dec.toString()).assertEqual('2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART01_SUPPLEMENT_TEST_7800
     * @tc.name testDecimalPropertiesPart01TestTest078
     * @tc.desc Verify ROUND_HALF_FLOOR -2.5 -3
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart01TestTest078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: Decimal = new Decimal(-2.5).toDecimalPlaces(0, Decimal.ROUND_HALF_FLOOR);
      expect(dec.toString()).assertEqual('-3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART01_SUPPLEMENT_TEST_7900
     * @tc.name testDecimalPropertiesPart01TestTest079
     * @tc.desc Verify EUCLIDEAN 9
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart01TestTest079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Decimal.EUCLIDEAN).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART01_SUPPLEMENT_TEST_8000
     * @tc.name testDecimalPropertiesPart01TestTest080
     * @tc.desc Verify EUCLIDEAN modulo -7 mod 3 2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart01TestTest080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ modulo: 9 });
      let dec: Decimal = new Decimal(-7).mod(3);
      expect(dec.toString()).assertEqual('2');
      Decimal.set({ modulo: 1 });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART01_SUPPLEMENT_TEST_8100
     * @tc.name testDecimalPropertiesPart01TestTest081
     * @tc.desc Verify EUCLIDEAN 7 mod -3 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart01TestTest081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ modulo: 9 });
      let dec: Decimal = new Decimal(7).mod(-3);
      expect(dec.toString()).assertEqual('1');
      Decimal.set({ modulo: 1 });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART01_SUPPLEMENT_TEST_8200
     * @tc.name testDecimalPropertiesPart01TestTest082
     * @tc.desc Verify EUCLIDEAN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart01TestTest082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ modulo: 9 });
      let dec: Decimal = new Decimal(7).mod(3);
      expect(dec.toString()).assertEqual('1');
      Decimal.set({ modulo: 1 });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART01_SUPPLEMENT_TEST_8300
     * @tc.name testDecimalPropertiesPart01TestTest083
     * @tc.desc Verify EUCLIDEAN 0 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart01TestTest083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ modulo: 9 });
      let dec: Decimal = new Decimal(0).mod(3);
      expect(dec.toString()).assertEqual('0');
      Decimal.set({ modulo: 1 });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART01_SUPPLEMENT_TEST_8400
     * @tc.name testDecimalPropertiesPart01TestTest084
     * @tc.desc Verify EUCLIDEAN ROUND_FLOOR 9 3
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart01TestTest084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Decimal.EUCLIDEAN).assertEqual(9);
      expect(Decimal.ROUND_FLOOR).assertEqual(3);
      const euclidean: number = Decimal.EUCLIDEAN;
      const roundFloor: number = Decimal.ROUND_FLOOR;
      expect(euclidean !== roundFloor).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART01_SUPPLEMENT_TEST_8500
     * @tc.name testDecimalPropertiesPart01TestTest085
     * @tc.desc Verify 0~9
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart01TestTest085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let vals: number[] = [Decimal.ROUND_UP, Decimal.ROUND_DOWN, Decimal.ROUND_CEILING,
        Decimal.ROUND_FLOOR, Decimal.ROUND_HALF_UP, Decimal.ROUND_HALF_DOWN,
        Decimal.ROUND_HALF_EVEN, Decimal.ROUND_HALF_CEILING, Decimal.ROUND_HALF_FLOOR,
        Decimal.EUCLIDEAN];
      let unique: boolean = true;
      for (let i: number = 0; i < vals.length; i++) {
        for (let j: number = i + 1; j < vals.length; j++) {
          if (vals[i] === vals[j]) { unique = false; }
        }
      }
      expect(unique).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART01_SUPPLEMENT_TEST_8600
     * @tc.name testDecimalPropertiesPart01TestTest086
     * @tc.desc Verify 0~9
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart01TestTest086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inRange: boolean = true;
      let vals: number[] = [Decimal.ROUND_UP, Decimal.ROUND_DOWN, Decimal.ROUND_CEILING,
        Decimal.ROUND_FLOOR, Decimal.ROUND_HALF_UP, Decimal.ROUND_HALF_DOWN,
        Decimal.ROUND_HALF_EVEN, Decimal.ROUND_HALF_CEILING, Decimal.ROUND_HALF_FLOOR,
        Decimal.EUCLIDEAN];
      for (let i: number = 0; i < vals.length; i++) {
        if (vals[i] < 0 || vals[i] > 9) { inRange = false; }
      }
      expect(inRange).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART01_SUPPLEMENT_TEST_8700
     * @tc.name testDecimalPropertiesPart01TestTest087
     * @tc.desc Verify ROUND_HALF_UP rounding=4 2.5 3
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart01TestTest087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ defaults: true });
      let dec: Decimal = new Decimal(2.5).toDecimalPlaces(0);
      expect(dec.toString()).assertEqual('3');
      Decimal.set({ defaults: false });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART01_SUPPLEMENT_TEST_8800
     * @tc.name testDecimalPropertiesPart01TestTest088
     * @tc.desc Verify number values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart01TestTest088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: Decimal = new Decimal(1);
      expect(Decimal.ROUND_HALF_UP).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART01_SUPPLEMENT_TEST_8900
     * @tc.name testDecimalPropertiesPart01TestTest089
     * @tc.desc Verify d/e/s -0 0 s NaN/ Infinity MAX/MIN/EPSILON/
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart01TestTest089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: Decimal = new Decimal('1.5');
      expect(dec.d[0]).assertEqual(1);
      expect(dec.e).assertEqual(0);
      expect(dec.s).assertEqual(1);
      expect(Decimal.ROUND_HALF_UP).assertEqual(4);
    });


  });

}
