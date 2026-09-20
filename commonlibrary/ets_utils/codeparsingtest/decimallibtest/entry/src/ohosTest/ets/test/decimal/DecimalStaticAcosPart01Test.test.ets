
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

export default function decimalStaticAcosPart01TestTest() {
  describe('DecimalStaticAcosPart01TestTest', () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ACOS_PART01_SUPPLEMENT_TEST_0100
     * @tc.name testDecimalStaticAcosPart01TestTest001
     * @tc.desc Verify number DP-BASIC-NUMBER
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAcosPart01TestTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = Decimal.acos(0.3);
      const diff: number = Math.abs(r.toNumber() - Math.acos(0.3));
      expect(diff < 1e-12).assertTrue();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ACOS_PART01_SUPPLEMENT_TEST_0200
     * @tc.name testDecimalStaticAcosPart01TestTest002
     * @tc.desc Verify DP-BASIC-NUMBER
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAcosPart01TestTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = Decimal.acos(1);
      expect(r.toString()).assertEqual('0');
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ACOS_PART01_SUPPLEMENT_TEST_0300
     * @tc.name testDecimalStaticAcosPart01TestTest003
     * @tc.desc Verify 0.5 1.0471975511965977462 DP-BASIC-NUMBER
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAcosPart01TestTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = Decimal.acos(0.5);
      expect(r.toString()).assertEqual('1.0471975511965977462');
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ACOS_PART01_SUPPLEMENT_TEST_0400
     * @tc.name testDecimalStaticAcosPart01TestTest004
     * @tc.desc Verify 0.25 Math.acos DP-BASIC-NUMBER
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAcosPart01TestTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = Decimal.acos(0.25);
      const diff: number = Math.abs(r.toNumber() - Math.acos(0.25));
      expect(diff < 1e-12).assertTrue();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ACOS_PART01_SUPPLEMENT_TEST_0500
     * @tc.name testDecimalStaticAcosPart01TestTest005
     * @tc.desc Verify 0 /2 DP-BASIC-NUMBER
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAcosPart01TestTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = Decimal.acos(0);
      expect(r.toString()).assertEqual('1.5707963267948966192');
    });
  
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ACOS_PART01_SUPPLEMENT_TEST_0600
     * @tc.name testDecimalStaticAcosPart01TestTest006
     * @tc.desc Verify -1 DP-BASIC-NUMBER
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAcosPart01TestTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = Decimal.acos(-1);
      const diff: number = Math.abs(r.toNumber() - Math.PI);
      expect(diff < 1e-12).assertTrue();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ACOS_PART01_SUPPLEMENT_TEST_0700
     * @tc.name testDecimalStaticAcosPart01TestTest007
     * @tc.desc Verify -0 /2 DP-BASIC-NUMBER
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAcosPart01TestTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = Decimal.acos(-0);
      expect(r.toString()).assertEqual('1.5707963267948966192');
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ACOS_PART01_SUPPLEMENT_TEST_0800
     * @tc.name testDecimalStaticAcosPart01TestTest008
     * @tc.desc Verify -0.5 2 /3 DP-BASIC-NUMBER
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAcosPart01TestTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = Decimal.acos(-0.5);
      const diff: number = Math.abs(r.toNumber() - Math.acos(-0.5));
      expect(diff < 1e-12).assertTrue();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ACOS_PART01_SUPPLEMENT_TEST_0900
     * @tc.name testDecimalStaticAcosPart01TestTest009
     * @tc.desc Verify 0.9999999999999999 NaN 0 DP-BASIC-NUMBER
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAcosPart01TestTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = Decimal.acos(0.9999999999999999);
      expect(Number.isNaN(r.toNumber())).assertFalse();
      expect(r.toNumber() < 0.5).assertTrue();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ACOS_PART01_SUPPLEMENT_TEST_1000
     * @tc.name testDecimalStaticAcosPart01TestTest010
     * @tc.desc Verify -0.9999999999999999 DP-BASIC-NUMBER
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAcosPart01TestTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = Decimal.acos(-0.9999999999999999);
      const diff: number = Math.abs(r.toNumber() - Math.PI);
      expect(diff < 1e-8).assertFalse();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ACOS_PART01_SUPPLEMENT_TEST_1100
     * @tc.name testDecimalStaticAcosPart01TestTest011
     * @tc.desc Verify 1.0000000001 NaN DP-BASIC-NUMBER
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAcosPart01TestTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = Decimal.acos(1.0000000001);
      expect(Number.isNaN(r.toNumber())).assertTrue();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ACOS_PART01_SUPPLEMENT_TEST_1200
     * @tc.name testDecimalStaticAcosPart01TestTest012
     * @tc.desc Verify -1.0000000001 NaN DP-BASIC-NUMBER
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAcosPart01TestTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = Decimal.acos(-1.0000000001);
      expect(Number.isNaN(r.toNumber())).assertTrue();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ACOS_PART01_SUPPLEMENT_TEST_1300
     * @tc.name testDecimalStaticAcosPart01TestTest013
     * @tc.desc Verify 2 NaN Decimal d DP-BASIC-NUMBER
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAcosPart01TestTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = Decimal.acos(2);
      expect(Number.isNaN(r.toNumber())).assertTrue();
      expect(r.d === null).assertTrue();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ACOS_PART01_SUPPLEMENT_TEST_1400
     * @tc.name testDecimalStaticAcosPart01TestTest014
     * @tc.desc Verify -2 NaN DP-BASIC-NUMBER
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAcosPart01TestTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = Decimal.acos(-2);
      expect(Number.isNaN(r.toNumber())).assertTrue();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ACOS_PART01_SUPPLEMENT_TEST_1500
     * @tc.name testDecimalStaticAcosPart01TestTest015
     * @tc.desc Verify Number.MAX_SAFE_INTEGER NaN DP-BASIC-NUMBER
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAcosPart01TestTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = Decimal.acos(Number.MAX_SAFE_INTEGER);
      expect(Number.isNaN(r.toNumber())).assertTrue();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ACOS_PART01_SUPPLEMENT_TEST_1600
     * @tc.name testDecimalStaticAcosPart01TestTest016
     * @tc.desc Verify Number.MIN_SAFE_INTEGER NaN DP-BASIC-NUMBER
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAcosPart01TestTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = Decimal.acos(Number.MIN_SAFE_INTEGER);
      expect(Number.isNaN(r.toNumber())).assertTrue();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ACOS_PART01_SUPPLEMENT_TEST_1700
     * @tc.name testDecimalStaticAcosPart01TestTest017
     * @tc.desc Verify 1e-7 /2 DP-BASIC-NUMBER
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAcosPart01TestTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = Decimal.acos(1e-7);
      const diff: number = Math.abs(r.toNumber() - Math.acos(1e-7));
      expect(diff < 1e-12).assertTrue();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ACOS_PART01_SUPPLEMENT_TEST_1800
     * @tc.name testDecimalStaticAcosPart01TestTest018
     * @tc.desc Verify 0x1 1 DP-BASIC-NUMBER
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAcosPart01TestTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const rHex: Decimal = Decimal.acos(0x1);
      expect(rHex.toString()).assertEqual('0');
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ACOS_PART01_SUPPLEMENT_TEST_1900
     * @tc.name testDecimalStaticAcosPart01TestTest019
     * @tc.desc Verify -1e0 -1 DP-BASIC-NUMBER
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAcosPart01TestTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = Decimal.acos(-1e0);
      const diff: number = Math.abs(r.toNumber() - Math.PI);
      expect(diff < 1e-12).assertTrue();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ACOS_PART01_SUPPLEMENT_TEST_2000
     * @tc.name testDecimalStaticAcosPart01TestTest020
     * @tc.desc Verify Number.MAX_VALUE NaN DP-BASIC-NUMBER
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAcosPart01TestTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = Decimal.acos(Number.MAX_VALUE);
      expect(Number.isNaN(r.toNumber())).assertTrue();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ACOS_PART01_SUPPLEMENT_TEST_2100
     * @tc.name testDecimalStaticAcosPart01TestTest021
     * @tc.desc Verify Number.MIN_VALUE /2 DP-BASIC-NUMBER
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAcosPart01TestTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = Decimal.acos(Number.MIN_VALUE);
      const diff: number = Math.abs(r.toNumber() - Math.acos(Number.MIN_VALUE));
      expect(diff < 1e-12).assertTrue();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ACOS_PART01_SUPPLEMENT_TEST_2200
     * @tc.name testDecimalStaticAcosPart01TestTest022
     * @tc.desc Verify Number.EPSILON /2 DP-BASIC-NUMBER
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAcosPart01TestTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = Decimal.acos(Number.EPSILON);
      const diff: number = Math.abs(r.toNumber() - Math.acos(Number.EPSILON));
      expect(diff < 1e-12).assertTrue();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ACOS_PART01_SUPPLEMENT_TEST_2300
     * @tc.name testDecimalStaticAcosPart01TestTest023
     * @tc.desc Verify 9e15 NaN DP-BASIC-NUMBER
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAcosPart01TestTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = Decimal.acos(9e15);
      expect(Number.isNaN(r.toNumber())).assertTrue();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ACOS_PART01_SUPPLEMENT_TEST_2400
     * @tc.name testDecimalStaticAcosPart01TestTest024
     * @tc.desc Verify 0.5e0 0.5 DP-BASIC-NUMBER
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAcosPart01TestTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = Decimal.acos(0.5e0);
      expect(r.toString()).assertEqual('1.0471975511965977462');
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ACOS_PART01_SUPPLEMENT_TEST_2500
     * @tc.name testDecimalStaticAcosPart01TestTest025
     * @tc.desc Verify precision=1 rounding=4 0.5 1 DP-BASIC-NUMBER
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAcosPart01TestTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ precision: 1, rounding: 4 });
      const r: Decimal = Decimal.acos(0.5);
      expect(r.toString()).assertEqual('1');
      Decimal.set({ defaults: true });
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ACOS_PART01_SUPPLEMENT_TEST_2600
     * @tc.name testDecimalStaticAcosPart01TestTest026
     * @tc.desc Verify precision=1 rounding=0 0.5 1 DP-BASIC-NUMBER
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAcosPart01TestTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ precision: 1, rounding: 0 });
      const r: Decimal = Decimal.acos(0.5);
      expect(r.toString()).assertEqual('2');
      Decimal.set({ defaults: true });
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ACOS_PART01_SUPPLEMENT_TEST_2700
     * @tc.name testDecimalStaticAcosPart01TestTest027
     * @tc.desc Verify precision=1 rounding=1 0.5 2 DP-BASIC-NUMBER
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAcosPart01TestTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ precision: 1, rounding: 1 });
      const r: Decimal = Decimal.acos(0.5);
      expect(r.toString()).assertEqual('1');
      Decimal.set({ defaults: true });
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ACOS_PART01_SUPPLEMENT_TEST_2800
     * @tc.name testDecimalStaticAcosPart01TestTest028
     * @tc.desc Verify precision=1 rounding=2 0.5 1 DP-BASIC-NUMBER
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAcosPart01TestTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ precision: 1, rounding: 2 });
      const r: Decimal = Decimal.acos(0.5);
      expect(r.toString()).assertEqual('2');
      Decimal.set({ defaults: true });
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ACOS_PART01_SUPPLEMENT_TEST_2900
     * @tc.name testDecimalStaticAcosPart01TestTest029
     * @tc.desc Verify precision=1 rounding=3 0.5 2 DP-BASIC-NUMBER
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAcosPart01TestTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ precision: 1, rounding: 3 });
      const r: Decimal = Decimal.acos(0.5);
      expect(r.toString()).assertEqual('1');
      Decimal.set({ defaults: true });
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ACOS_PART01_SUPPLEMENT_TEST_3000
     * @tc.name testDecimalStaticAcosPart01TestTest030
     * @tc.desc Verify precision=1 rounding=5 0.5 1 DP-BASIC-NUMBER
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAcosPart01TestTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ precision: 1, rounding: 5 });
      const r: Decimal = Decimal.acos(0.5);
      expect(r.toString()).assertEqual('1');
      Decimal.set({ defaults: true });
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ACOS_PART01_SUPPLEMENT_TEST_3100
     * @tc.name testDecimalStaticAcosPart01TestTest031
     * @tc.desc Verify precision=1 rounding=6/7/8 0.5 1 DP-BASIC-NUMBER
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAcosPart01TestTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ precision: 1, rounding: 6 });
      const r: Decimal = Decimal.acos(0.5);
      expect(r.toString()).assertEqual('1');
      Decimal.set({ defaults: true });
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ACOS_PART01_SUPPLEMENT_TEST_3200
     * @tc.name testDecimalStaticAcosPart01TestTest032
     * @tc.desc Verify precision=1e9 0.5 DP-BASIC-NUMBER
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAcosPart01TestTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ precision: 50 });
      const r: Decimal = Decimal.acos(0.5);
      const digits: number = r.toString().length;
      expect(digits > 20).assertTrue();
      Decimal.set({ defaults: true });
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ACOS_PART01_SUPPLEMENT_TEST_3300
     * @tc.name testDecimalStaticAcosPart01TestTest033
     * @tc.desc Verify toExpPos=0 acos(0) DP-BASIC-NUMBER
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAcosPart01TestTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ toExpPos: 0 });
      const r: Decimal = Decimal.acos(0);
      expect(r.toString().indexOf('e') >= 0).assertTrue();
      Decimal.set({ defaults: true });
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ACOS_PART01_SUPPLEMENT_TEST_3400
     * @tc.name testDecimalStaticAcosPart01TestTest034
     * @tc.desc Verify toExpNeg=-1 0 acos(1) DP-BASIC-NUMBER
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAcosPart01TestTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ toExpNeg: -1 });
      const r: Decimal = Decimal.acos(1);
      expect(r.toString()).assertEqual('0');
      Decimal.set({ defaults: true });
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ACOS_PART01_SUPPLEMENT_TEST_3500
     * @tc.name testDecimalStaticAcosPart01TestTest035
     * @tc.desc Verify NaN NaN DP-ERROR-NUMBER
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAcosPart01TestTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = Decimal.acos(NaN);
      expect(Number.isNaN(r.toNumber())).assertTrue();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ACOS_PART01_SUPPLEMENT_TEST_3600
     * @tc.name testDecimalStaticAcosPart01TestTest036
     * @tc.desc Verify +Infinity NaN DP-ERROR-NUMBER
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAcosPart01TestTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = Decimal.acos(Infinity);
      expect(Number.isNaN(r.toNumber())).assertTrue();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ACOS_PART01_SUPPLEMENT_TEST_3700
     * @tc.name testDecimalStaticAcosPart01TestTest037
     * @tc.desc Verify -Infinity NaN DP-ERROR-NUMBER
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAcosPart01TestTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = Decimal.acos(-Infinity);
      expect(Number.isNaN(r.toNumber())).assertTrue();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ACOS_PART01_SUPPLEMENT_TEST_3800
     * @tc.name testDecimalStaticAcosPart01TestTest038
     * @tc.desc Verify NaN NaN Decimal 0 DP-ERROR-NUMBER
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAcosPart01TestTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = Decimal.acos(NaN);
      expect(Number.isFinite(r.toNumber())).assertFalse();
      expect(r.toString()).assertEqual('NaN');
    });
  
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ACOS_PART01_SUPPLEMENT_TEST_3900
     * @tc.name testDecimalStaticAcosPart01TestTest039
     * @tc.desc Verify number Decimal 0.5 Decimal DP-BASIC-NUMBER
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAcosPart01TestTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = Decimal.acos(new Decimal(0.5));
      expect(r.toString()).assertEqual('1.0471975511965977462');
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ACOS_PART01_SUPPLEMENT_TEST_4000
     * @tc.name testDecimalStaticAcosPart01TestTest040
     * @tc.desc Verify string Decimal '0.5' number DP-BASIC-NUMBER
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAcosPart01TestTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = Decimal.acos(new Decimal('0.5'));
      expect(r.toString()).assertEqual('1.0471975511965977462');
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ACOS_PART01_SUPPLEMENT_TEST_4100
     * @tc.name testDecimalStaticAcosPart01TestTest041
     * @tc.desc Verify Decimal 2 NaN DP-BASIC-NUMBER
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAcosPart01TestTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = Decimal.acos(new Decimal(2));
      expect(Number.isNaN(r.toNumber())).assertTrue();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ACOS_PART01_SUPPLEMENT_TEST_4200
     * @tc.name testDecimalStaticAcosPart01TestTest042
     * @tc.desc Verify Decimal DP-BASIC-NUMBER
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAcosPart01TestTest042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r1: Decimal = Decimal.acos(new Decimal('0.25'));
      const r2: Decimal = Decimal.acos(new Decimal(0.25));
      expect(r1.toString()).assertEqual(r2.toString());
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ACOS_PART01_SUPPLEMENT_TEST_4300
     * @tc.name testDecimalStaticAcosPart01TestTest043
     * @tc.desc Verify Decimal 0.9999999999999999999 20 9 NaN DP-BASIC-NUMBER
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAcosPart01TestTest043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = Decimal.acos(new Decimal('0.9999999999999999999'));
      expect(Number.isNaN(r.toNumber())).assertFalse();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ACOS_PART01_SUPPLEMENT_TEST_4400
     * @tc.name testDecimalStaticAcosPart01TestTest044
     * @tc.desc Verify Decimal -0.5 -0.5 DP-BASIC-NUMBER
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAcosPart01TestTest044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = Decimal.acos(new Decimal(-0.5));
      const diff: number = Math.abs(r.toNumber() - Math.acos(-0.5));
      expect(diff < 1e-12).assertTrue();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ACOS_PART01_SUPPLEMENT_TEST_4500
     * @tc.name testDecimalStaticAcosPart01TestTest045
     * @tc.desc Verify null 401 DP-BASIC-NULLISH
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAcosPart01TestTest045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        Decimal.acos(null as ESObject);
        let unreached: number = 1;
        expect(unreached === 2).assertTrue();
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ACOS_PART01_SUPPLEMENT_TEST_4600
     * @tc.name testDecimalStaticAcosPart01TestTest046
     * @tc.desc Verify undefined 401 DP-BASIC-NULLISH
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAcosPart01TestTest046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        Decimal.acos(undefined as ESObject);
        let unreached: number = 1;
        expect(unreached === 2).assertTrue();
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ACOS_PART01_SUPPLEMENT_TEST_4700
     * @tc.name testDecimalStaticAcosPart01TestTest047
     * @tc.desc Verify 401 DP-BASIC-NULLISH
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAcosPart01TestTest047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj: object = {} as ESObject;
      try {
        Decimal.acos(obj as ESObject);
        let unreached: number = 1;
        expect(unreached === 2).assertTrue();
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ACOS_PART01_SUPPLEMENT_TEST_4800
     * @tc.name testDecimalStaticAcosPart01TestTest048
     * @tc.desc Verify null undefined 401 DP-BASIC-NULLISH
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAcosPart01TestTest048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nullThrows: boolean = false;
      try {
        Decimal.acos(null as ESObject);
      } catch (e) {
        nullThrows = true;
      }
      expect(nullThrows).assertTrue();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ACOS_PART01_SUPPLEMENT_TEST_4900
     * @tc.name testDecimalStaticAcosPart01TestTest049
     * @tc.desc Verify Decimal DP-BASIC-NUMBER
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAcosPart01TestTest049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = Decimal.acos(0.5);
      expect(r instanceof Decimal).assertTrue();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ACOS_PART01_SUPPLEMENT_TEST_5000
     * @tc.name testDecimalStaticAcosPart01TestTest050
     * @tc.desc Verify Decimal Decimal DP-BASIC-NUMBER
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAcosPart01TestTest050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Decimal = new Decimal(0.5);
      const r: Decimal = Decimal.acos(src);
      expect(src.toString()).assertEqual('0.5');
      expect(r === src).assertFalse();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ACOS_PART01_SUPPLEMENT_TEST_5100
     * @tc.name testDecimalStaticAcosPart01TestTest051
     * @tc.desc Verify s 1 DP-BASIC-NUMBER
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAcosPart01TestTest051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = Decimal.acos(0.5);
      expect(r.s === 1).assertTrue();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ACOS_PART01_SUPPLEMENT_TEST_5200
     * @tc.name testDecimalStaticAcosPart01TestTest052
     * @tc.desc Verify e DP-BASIC-NUMBER
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAcosPart01TestTest052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = Decimal.acos(0.5);
      expect(r.isNaN()).assertFalse();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ACOS_PART01_SUPPLEMENT_TEST_5300
     * @tc.name testDecimalStaticAcosPart01TestTest053
     * @tc.desc Verify acos(0.5) toNumber JS DP-BASIC-NUMBER
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAcosPart01TestTest053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = Decimal.acos(0.5);
      const diff: number = Math.abs(r.toNumber() - Math.acos(0.5));
      expect(diff < 1e-12).assertTrue();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ACOS_PART01_SUPPLEMENT_TEST_5400
     * @tc.name testDecimalStaticAcosPart01TestTest054
     * @tc.desc Verify Value boolean true 401 DP-ERROR-NUMBER
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAcosPart01TestTest054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        Decimal.acos(true as ESObject);
        let unreached: number = 1;
        expect(unreached === 2).assertTrue();
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ACOS_PART01_SUPPLEMENT_TEST_5500
     * @tc.name testDecimalStaticAcosPart01TestTest055
     * @tc.desc Verify [0.5] Value 401 DP-ERROR-NUMBER
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAcosPart01TestTest055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        Decimal.acos([0.5] as ESObject);
        let unreached: number = 1;
        expect(unreached === 2).assertTrue();
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ACOS_PART01_SUPPLEMENT_TEST_5600
     * @tc.name testDecimalStaticAcosPart01TestTest056
     * @tc.desc Verify precision 1e9+1 acos 10200060 DP-ERROR-NUMBER
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAcosPart01TestTest056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let threw: boolean = false;
      try {
        Decimal.set({ precision: 1e9 + 1 });
      } catch (e) {
        threw = true;
        expect((e as BusinessError).code).assertEqual(10200001);
      }
      Decimal.set({ defaults: true });
      expect(threw).assertTrue();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ACOS_PART01_SUPPLEMENT_TEST_5700
     * @tc.name testDecimalStaticAcosPart01TestTest057
     * @tc.desc Verify precision 0 acos 10200060 DP-ERROR-NUMBER
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
        it('testDecimalStaticAcosPart01TestTest057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let threw: boolean = false;
      try {
        Decimal.set({ precision: 0 });
        Decimal.acos(0.5);
      } catch (e) {
        threw = true;
        expect((e as BusinessError).code).assertEqual(10200001);
      }
      Decimal.set({ defaults: true });
      expect(threw).assertTrue();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ACOS_PART01_SUPPLEMENT_TEST_5800
     * @tc.name testDecimalStaticAcosPart01TestTest058
     * @tc.desc Verify number|Decimal number Decimal DP-BASIC-NUMBER
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAcosPart01TestTest058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const rNum: Decimal = Decimal.acos(0.5);
      const rd: Decimal = Decimal.acos(new Decimal(0.5));
      expect(rNum.toString()).assertEqual(rd.toString());
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ACOS_PART01_SUPPLEMENT_TEST_5900
     * @tc.name testDecimalStaticAcosPart01TestTest059
     * @tc.desc Verify number|string|Decimal DP-BASIC-NUMBER
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAcosPart01TestTest059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const rNum: Decimal = Decimal.acos(0.5);
      const rs: Decimal = Decimal.acos('0.5');
      const rd: Decimal = Decimal.acos(new Decimal('0.5'));
      expect(rNum.toString()).assertEqual('1.0471975511965977462');
      expect(rs.toString()).assertEqual('1.0471975511965977462');
      expect(rd.toString()).assertEqual('1.0471975511965977462');
    });
  
  
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ACOS_PART01_SUPPLEMENT_TEST_6000
     * @tc.name testDecimalStaticAcosPart01TestTest060
     * @tc.desc Verify number|string|Decimal|null null 401 DP-BASIC-NULLISH
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAcosPart01TestTest060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let reached: boolean = false;
      try {
        Decimal.acos(null as ESObject);
      } catch (e) {
        reached = true;
      }
      expect(reached).assertTrue();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ACOS_PART01_SUPPLEMENT_TEST_6100
     * @tc.name testDecimalStaticAcosPart01TestTest061
     * @tc.desc Verify number|string|Decimal|undefined|null undefined 401 DP-BASIC-NULLIS
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAcosPart01TestTest061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let reached: boolean = false;
      try {
        Decimal.acos(undefined as ESObject);
      } catch (e) {
        reached = true;
      }
      expect(reached).assertTrue();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ACOS_PART01_SUPPLEMENT_TEST_6200
     * @tc.name testDecimalStaticAcosPart01TestTest062
     * @tc.desc Verify Date number Date Value 401 DP-BASIC-NUMBER
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAcosPart01TestTest062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        Decimal.acos(new Date(0) as ESObject);
        let unreached: number = 1;
        expect(unreached === 2).assertTrue();
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ACOS_PART01_SUPPLEMENT_TEST_6300
     * @tc.name testDecimalStaticAcosPart01TestTest063
     * @tc.desc Verify 1e-9 /2 DP-ERROR-NUMBER
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAcosPart01TestTest063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = Decimal.acos(1e-9);
      expect(Number.isFinite(r.toNumber())).assertTrue();
      expect(Math.abs(r.toNumber() - Math.acos(1e-9)) < 1e-12).assertTrue();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ACOS_PART01_SUPPLEMENT_TEST_6400
     * @tc.name testDecimalStaticAcosPart01TestTest064
     * @tc.desc Verify 1 0.999999999999 NaN DP-ERROR-NUMBER
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAcosPart01TestTest064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = Decimal.acos(0.999999999999);
      expect(Number.isNaN(r.toNumber())).assertFalse();
      expect(r.toString().length > 5).assertTrue();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ACOS_PART01_SUPPLEMENT_TEST_6500
     * @tc.name testDecimalStaticAcosPart01TestTest065
     * @tc.desc Verify toNumber NaN Infinity DP-ERROR-NUMBER
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAcosPart01TestTest065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = Decimal.acos(2);
      expect(Number.isNaN(r.toNumber())).assertTrue();
      expect(r.toNumber() === Infinity).assertFalse();
    });
  
  });

}
