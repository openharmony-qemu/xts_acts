'use static';

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

import {
  beforeAll,
  beforeEach,
  afterEach,
  afterAll,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType,
} from '@ohos/hypium-static/src/main/indexStatic';
import Utils from '../Util.test';
import { Decimal } from '@kit.ArkTS';

export default function decimalToBinaryTest(): void {
  describe('DecimalToBinaryTest', (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      Decimal.set({ defaults: true });
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_BINARY_0100
     * @tc.name decimalToBinaryTest001
     * @tc.desc Basic positive/zero value conversion (10 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('decimalToBinaryTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. 1 toBinary with sd 1 and 20 yields '0b1p+0'
      let sigDigits1: int[] = [1, 20];
      let expVals1: string[] = ['0b1p+0', '0b1p+0'];
      for (let idx1: int = 0; idx1 < sigDigits1.length; idx1++) {
        let s1: string = new Decimal(1).toBinary(sigDigits1[idx1]);
        expect(s1).assertEqual(expVals1[idx1]);
      }

      // 2. '0' toBinary sd 20 yields '0b0p+0'
      let s2: string = new Decimal('0').toBinary(20);
      expect(s2).assertEqual('0b0p+0');

      // 3. 0.5 toBinary sd 20 yields '0b1p-1'
      let s3: string = new Decimal(0.5).toBinary(20);
      expect(s3).assertEqual('0b1p-1');

      // 4. 5 toBinary(3) equals toBinary(3, ROUND_HALF_UP) and yields '0b1.01p+2'
      let d4: Decimal = new Decimal(5);
      let s4a: string = d4.toBinary(3);
      let s4b: string = d4.toBinary(3, Decimal.ROUND_HALF_UP);
      expect(s4a).assertEqual(s4b);
      expect(s4a).assertEqual('0b1.01p+2');

      // 5. 2.75 toBinary(2) equals toBinary(2, ROUND_HALF_UP) and yields '0b1.1p+1'
      let d5: Decimal = new Decimal(2.75);
      let s5a: string = d5.toBinary(2);
      let s5b: string = d5.toBinary(2, Decimal.ROUND_HALF_UP);
      expect(s5a).assertEqual(s5b);
      expect(s5a).assertEqual('0b1.1p+1');

      // 6. 0 toBinary(1) and toBinary(1, 4) both yield '0b0p+0'
      let d6: Decimal = new Decimal(0);
      let s6a: string = d6.toBinary(1);
      expect(s6a).assertEqual('0b0p+0');
      let s6b: string = d6.toBinary(1, 4);
      expect(s6b).assertEqual('0b0p+0');

      // 7. 15 toBinary(4) and toBinary(4, ROUND_DOWN) both yield '0b1.111p+3'
      let d7: Decimal = new Decimal(15);
      let s7a: string = d7.toBinary(4);
      expect(s7a).assertEqual('0b1.111p+3');
      let s7b: string = d7.toBinary(4, Decimal.ROUND_DOWN);
      expect(s7b).assertEqual('0b1.111p+3');

      // 8. 0.25 toBinary(1) and toBinary(1, ROUND_UP) both yield '0b1p-2'
      let quarterValue: Decimal = new Decimal(0.25);
      let s8a: string = quarterValue.toBinary(1);
      expect(s8a).assertEqual('0b1p-2');
      let s8b: string = quarterValue.toBinary(1, Decimal.ROUND_UP);
      expect(s8b).assertEqual('0b1p-2');

      // 9. 1.5 toBinary(2) and toBinary(2, ROUND_HALF_UP) both yield '0b1.1p+0'
      let d9: Decimal = new Decimal(1.5);
      let s9a: string = d9.toBinary(2);
      expect(s9a).assertEqual('0b1.1p+0');
      let s9b: string = d9.toBinary(2, Decimal.ROUND_HALF_UP);
      expect(s9b).assertEqual('0b1.1p+0');

      // 10. 5 toBinary(2, 9) throws 10200001 then toBinary(3) yields '0b1.01p+2'
      let d10: Decimal = new Decimal(5);
      try {
        d10.toBinary(2, 9);
        expect().assertFail();
      } catch (e10) {
        expect(e10.code).assertEqual(10200001);
      }
      let s10: string = d10.toBinary(3);
      expect(s10).assertEqual('0b1.01p+2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_BINARY_0200
     * @tc.name decimalToBinaryTest002
     * @tc.desc Negative value & negative-sign rounding (10 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('decimalToBinaryTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 11. -1 toBinary sd 20 yields '-0b1p+0'
      let s11: string = new Decimal(-1).toBinary(20);
      expect(s11).assertEqual('-0b1p+0');

      // 12. -1000000 toBinary sd 40 starts with '-0b' and its slice equals abs
      let d12: Decimal = new Decimal(-1000000);
      let s12: string = d12.toBinary(40);
      let actual12a: boolean = s12.startsWith('-0b');
      expect(actual12a).assertTrue();
      let actual12b: boolean = new Decimal(s12.slice(1)).equals(d12.abs());
      expect(actual12b).assertTrue();

      // 13. '-2.5e2' toBinary sd 20 yields '-0b1.111101p+7'
      let s13: string = new Decimal('-2.5e2').toBinary(20);
      expect(s13).assertEqual('-0b1.111101p+7');

      // 14. -5 toBinary(3) and toBinary(3, ROUND_HALF_UP) both yield '-0b1.01p+2'
      let d14: Decimal = new Decimal(-5);
      let s14a: string = d14.toBinary(3);
      expect(s14a).assertEqual('-0b1.01p+2');
      let s14b: string = d14.toBinary(3, Decimal.ROUND_HALF_UP);
      expect(s14b).assertEqual('-0b1.01p+2');

      // 15. -0 toBinary(1) and toBinary(1, 4) both yield '-0b0p+0'
      let d15: Decimal = new Decimal(-0);
      let s15a: string = d15.toBinary(1);
      expect(s15a).assertEqual('-0b0p+0');
      let s15b: string = d15.toBinary(1, 4);
      expect(s15b).assertEqual('-0b0p+0');

      // 16. -6 toBinary(1, ROUND_DOWN) yields '-0b1p+2'
      let s16: string = new Decimal(-6).toBinary(1, Decimal.ROUND_DOWN);
      expect(s16).assertEqual('-0b1p+2');

      // 17. -6 toBinary(1, ROUND_CEILING) yields '-0b1p+2'
      let s17: string = new Decimal(-6).toBinary(1, Decimal.ROUND_CEILING);
      expect(s17).assertEqual('-0b1p+2');

      // 18. -6 toBinary(1, ROUND_HALF_EVEN) yields '-0b1p+3'
      let s18: string = new Decimal(-6).toBinary(1, Decimal.ROUND_HALF_EVEN);
      expect(s18).assertEqual('-0b1p+3');

      // 19. -6 toBinary(1, ROUND_HALF_CEILING) yields '-0b1p+2'
      let s19: string = new Decimal(-6).toBinary(1, Decimal.ROUND_HALF_CEILING);
      expect(s19).assertEqual('-0b1p+2');

      // 20. -6 toBinary(1, ROUND_HALF_FLOOR) yields '-0b1p+3'
      let s20: string = new Decimal(-6).toBinary(1, Decimal.ROUND_HALF_FLOOR);
      expect(s20).assertEqual('-0b1p+3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_BINARY_0300
     * @tc.name decimalToBinaryTest003
     * @tc.desc Significant-digit precision & length growth (9 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('decimalToBinaryTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 21. 1/3 toBinary sd 20 is longer than sd 10 and matches expected strings
      let a21: string = new Decimal(1).div(3).toBinary(20);
      let b21: string = new Decimal(1).div(3).toBinary(10);
      let actual21: boolean = a21.length > b21.length;
      expect(actual21).assertTrue();
      const expFirst21: string = '0b1.0101010101010101011p-2';
      const expSecond21: string = '0b1.010101011p-2';
      expect(a21).assertEqual(expFirst21);
      expect(b21).assertEqual(expSecond21);

      // 22. 0.1 toBinary sd 40 is longer than sd 20 and matches expected strings
      let a22: string = new Decimal('0.1').toBinary(40);
      let b22: string = new Decimal('0.1').toBinary(20);
      let actual22: boolean = a22.length > b22.length;
      expect(actual22).assertTrue();
      const expFirst22: string = '0b1.100110011001100110011001100110011001101p-4';
      const expSecond22: string = '0b1.1001100110011001101p-4';
      expect(a22).assertEqual(expFirst22);
      expect(b22).assertEqual(expSecond22);

      // 23. 0.1 toBinary sd 20 vs 10 with ROUND_HALF_UP is longer and matches expected strings
      let a23: string = new Decimal('0.1').toBinary(20, Decimal.ROUND_HALF_UP);
      let b23: string = new Decimal('0.1').toBinary(10, Decimal.ROUND_HALF_UP);
      let actual23: boolean = a23.length > b23.length;
      expect(actual23).assertTrue();
      const expFirst23: string = '0b1.1001100110011001101p-4';
      const expSecond23: string = '0b1.100110011p-4';
      expect(a23).assertEqual(expFirst23);
      expect(b23).assertEqual(expSecond23);

      // 24. 1.7976931348623157e308 toBinary sd 20 is longer than 1 and matches expected strings
      let a24: string = new Decimal(1.7976931348623157e308).toBinary(20);
      let b24: string = new Decimal(1).toBinary(20);
      let actual24: boolean = a24.length > b24.length;
      expect(actual24).assertTrue();
      const expFirst24: string = '0b1p+1024';
      const expSecond24: string = '0b1p+0';
      expect(a24).assertEqual(expFirst24);
      expect(b24).assertEqual(expSecond24);

      // 25. 42 toBinary sd 1 and 2 with ROUND_DOWN yields '0b1p+5'
      let sigDigits25: int[] = [1, 2];
      let expVals25: string[] = ['0b1p+5', '0b1p+5'];
      for (let idx25: int = 0; idx25 < sigDigits25.length; idx25++) {
        let s25: string = new Decimal(42).toBinary(sigDigits25[idx25], Decimal.ROUND_DOWN);
        expect(s25).assertEqual(expVals25[idx25]);
      }

      // 26. 42 toBinary sd 1 and 2 with ROUND_UP yields '0b1p+6' and '0b1.1p+5'
      let sigDigits26: int[] = [1, 2];
      let expVals26: string[] = ['0b1p+6', '0b1.1p+5'];
      for (let idx26: int = 0; idx26 < sigDigits26.length; idx26++) {
        let s26: string = new Decimal(42).toBinary(sigDigits26[idx26], Decimal.ROUND_UP);
        expect(s26).assertEqual(expVals26[idx26]);
      }

      // 27. 42 toBinary sd 1..4,10 with ROUND_HALF_UP matches expected strings
      let sigDigits27: int[] = [1, 2, 3, 4, 10];
      let expVals27: string[] = ['0b1p+5', '0b1.1p+5', '0b1.01p+5', '0b1.011p+5', '0b1.0101p+5'];
      for (let idx27: int = 0; idx27 < sigDigits27.length; idx27++) {
        let s27: string = new Decimal(42).toBinary(sigDigits27[idx27], Decimal.ROUND_HALF_UP);
        expect(s27).assertEqual(expVals27[idx27]);
      }

      // 28. 6 toBinary(1, ROUND_DOWN) yields '0b1p+2'
      let s28: string = new Decimal(6).toBinary(1, Decimal.ROUND_DOWN);
      expect(s28).assertEqual('0b1p+2');

      // 29. 6 toBinary(1, ROUND_FLOOR) yields '0b1p+2'
      let s29: string = new Decimal(6).toBinary(1, Decimal.ROUND_FLOOR);
      expect(s29).assertEqual('0b1p+2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_BINARY_0400
     * @tc.name decimalToBinaryTest004
     * @tc.desc Rounding-mode sweep on positive values (10 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('decimalToBinaryTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 30. 6 toBinary(1, ROUND_HALF_DOWN) yields '0b1p+2'
      let s30: string = new Decimal(6).toBinary(1, Decimal.ROUND_HALF_DOWN);
      expect(s30).assertEqual('0b1p+2');

      // 31. 6 toBinary(1, ROUND_HALF_EVEN) yields '0b1p+3'
      let s31: string = new Decimal(6).toBinary(1, Decimal.ROUND_HALF_EVEN);
      expect(s31).assertEqual('0b1p+3');

      // 32. 6 toBinary(1, ROUND_HALF_CEILING) yields '0b1p+3'
      let s32: string = new Decimal(6).toBinary(1, Decimal.ROUND_HALF_CEILING);
      expect(s32).assertEqual('0b1p+3');

      // 33. 6 toBinary(1, ROUND_HALF_FLOOR) yields '0b1p+2'
      let s33: string = new Decimal(6).toBinary(1, Decimal.ROUND_HALF_FLOOR);
      expect(s33).assertEqual('0b1p+2');

      // 34. 42 toBinary(1, ROUND_CEILING) yields '0b1p+6'
      let s34: string = new Decimal(42).toBinary(1, Decimal.ROUND_CEILING);
      expect(s34).assertEqual('0b1p+6');

      // 35. 5.5 toBinary(2, ROUND_UP) yields '0b1.1p+2'
      let s35: string = new Decimal(5.5).toBinary(2, Decimal.ROUND_UP);
      expect(s35).assertEqual('0b1.1p+2');

      // 36. 2.75 toBinary(2, ROUND_DOWN) yields '0b1p+1' and ROUND_UP yields '0b1.1p+1'
      let d36: Decimal = new Decimal(2.75);
      let s36a: string = d36.toBinary(2, Decimal.ROUND_DOWN);
      expect(s36a).assertEqual('0b1p+1');
      let s36b: string = d36.toBinary(2, Decimal.ROUND_UP);
      expect(s36b).assertEqual('0b1.1p+1');

      // 37. 2.75 toBinary(2, ROUND_HALF_FLOOR) and ROUND_UP both yield '0b1.1p+1'
      let d37: Decimal = new Decimal(2.75);
      let s37a: string = d37.toBinary(2, Decimal.ROUND_HALF_FLOOR);
      expect(s37a).assertEqual('0b1.1p+1');
      let s37b: string = d37.toBinary(2, Decimal.ROUND_UP);
      expect(s37b).assertEqual('0b1.1p+1');

      // 38. 2.75 toBinary(2, ROUND_CEILING) yields '0b1.1p+1'
      let s38: string = new Decimal(2.75).toBinary(2, Decimal.ROUND_CEILING);
      expect(s38).assertEqual('0b1.1p+1');

      // 39. 42 toBinary(1) reconstructs to 32 under default rounding
      let s39: string = new Decimal(42).toBinary(1);
      let actual39: boolean = new Decimal(s39).equals(new Decimal(32));
      expect(actual39).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_BINARY_0500
     * @tc.name decimalToBinaryTest005
     * @tc.desc Number-base literals & format assertions (10 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('decimalToBinaryTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 40. '0x10' toBinary sd 20 yields '0b1p+4'
      let s40: string = new Decimal('0x10').toBinary(20);
      expect(s40).assertEqual('0b1p+4');

      // 41. '0b101' toBinary sd 20 yields '0b1.01p+2'
      let s41: string = new Decimal('0b101').toBinary(20);
      expect(s41).assertEqual('0b1.01p+2');

      // 42. '0o7' toBinary sd 20 yields '0b1.11p+2'
      let s42: string = new Decimal('0o7').toBinary(20);
      expect(s42).assertEqual('0b1.11p+2');

      // 43. 0.1+0.2 as double is greater than 0.3 and toBinary sd 30 matches expected
      let da43: Decimal = new Decimal(0.1 + 0.2);
      let db43: Decimal = new Decimal('0.3');
      let actual43: boolean = da43.greaterThan(db43);
      expect(actual43).assertTrue();
      let sa43: string = da43.toBinary(30);
      expect(sa43).assertEqual('0b1.0011001100110011001100110011p-2');

      // 44. '0b101' toBinary(3) and toBinary(3, 4) both yield '0b1.01p+2'
      let d44: Decimal = new Decimal('0b101');
      let s44a: string = d44.toBinary(3);
      expect(s44a).assertEqual('0b1.01p+2');
      let s44b: string = d44.toBinary(3, 4);
      expect(s44b).assertEqual('0b1.01p+2');

      // 45. 5 toBinary sd 20 starts with '0b'
      let s45: string = new Decimal(5).toBinary(20);
      let actual45: boolean = s45.startsWith('0b');
      expect(actual45).assertTrue();

      // 46. -5 toBinary sd 20 starts with '-0b'
      let s46: string = new Decimal(-5).toBinary(20);
      let actual46: boolean = s46.startsWith('-0b');
      expect(actual46).assertTrue();

      // 47. 42 toBinary sd 20 does not include 'e'
      let s47: string = new Decimal(42).toBinary(20);
      let actual47: boolean = s47.includes('e');
      expect(actual47).assertFalse();

      // 48. 10 toBinary sd 20 is deterministic across calls
      let a48: string = new Decimal(10).toBinary(20);
      let b48: string = new Decimal(10).toBinary(20);
      expect(a48).assertEqual(b48);

      // 49. 0 toBinary sd 20 does not include '-'
      let s49: string = new Decimal(0).toBinary(20);
      let actual49: boolean = s49.includes('-');
      expect(actual49).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_BINARY_0600
     * @tc.name decimalToBinaryTest006
     * @tc.desc NaN, Infinity & -Infinity conversion (9 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('decimalToBinaryTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 50. NaN toBinary sd 20 yields 'NaN'
      let s50: string = new Decimal(Number.NaN).toBinary(20);
      expect(s50).assertEqual('NaN');

      // 51. 'NaN' toBinary sd 20 yields 'NaN'
      let s51: string = new Decimal('NaN').toBinary(20);
      expect(s51).assertEqual('NaN');

      // 52. +Infinity toBinary sd 20 yields 'Infinity'
      let s52: string = new Decimal(Number.POSITIVE_INFINITY).toBinary(20);
      expect(s52).assertEqual('Infinity');

      // 53. 'Infinity' toBinary sd 20 yields 'Infinity'
      let s53: string = new Decimal('Infinity').toBinary(20);
      expect(s53).assertEqual('Infinity');

      // 54. -Infinity toBinary sd 20 yields '-Infinity'
      let s54: string = new Decimal(-Number.POSITIVE_INFINITY).toBinary(20);
      expect(s54).assertEqual('-Infinity');

      // 55. '-Infinity' toBinary sd 20 yields '-Infinity'
      let s55: string = new Decimal('-Infinity').toBinary(20);
      expect(s55).assertEqual('-Infinity');

      // 56. NaN toBinary(3) and toBinary(3, ROUND_DOWN) both yield 'NaN'
      let d56: Decimal = new Decimal(Number.NaN);
      let s56a: string = d56.toBinary(3);
      expect(s56a).assertEqual('NaN');
      let s56b: string = d56.toBinary(3, Decimal.ROUND_DOWN);
      expect(s56b).assertEqual('NaN');

      // 57. +Infinity toBinary(3) and toBinary(3, ROUND_DOWN) both yield 'Infinity'
      let d57: Decimal = new Decimal(Number.POSITIVE_INFINITY);
      let s57a: string = d57.toBinary(3);
      expect(s57a).assertEqual('Infinity');
      let s57b: string = d57.toBinary(3, Decimal.ROUND_DOWN);
      expect(s57b).assertEqual('Infinity');

      // 58. -Infinity toBinary(3) and toBinary(3, 4) both yield '-Infinity'
      let d58: Decimal = new Decimal(-Number.POSITIVE_INFINITY);
      let s58a: string = d58.toBinary(3);
      expect(s58a).assertEqual('-Infinity');
      let s58b: string = d58.toBinary(3, 4);
      expect(s58b).assertEqual('-Infinity');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_BINARY_0700
     * @tc.name decimalToBinaryTest007
     * @tc.desc Invalid significant-digit argument: zero/negative/large (10 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('decimalToBinaryTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 59. 42 toBinary(-1) throws 10200001
      try {
        new Decimal(42).toBinary(-1);
        expect().assertFail();
      } catch (e59) {
        expect(e59.code).assertEqual(10200001);
      }

      // 60. 42 toBinary(0) throws 10200001 and toString stays '42'
      let d60: Decimal = new Decimal(42);
      try {
        d60.toBinary(0);
        expect().assertFail();
      } catch (e60) {
        expect(e60.code).assertEqual(10200001);
      }
      let actual60: string = d60.toString();
      expect(actual60).assertEqual('42');

      // 61. 255 toBinary(-1) throws 10200001 then toBinary(20) yields '0b1.1111111p+7'
      let d61: Decimal = new Decimal(255);
      try {
        d61.toBinary(-1);
        expect().assertFail();
      } catch (e61) {
        expect(e61.code).assertEqual(10200001);
      }
      let s61: string = d61.toBinary(20);
      expect(s61).assertEqual('0b1.1111111p+7');

      // 62. 42 toBinary(0, 4) throws 10200001 and toString stays '42'
      let d62: Decimal = new Decimal(42);
      try {
        d62.toBinary(0, 4);
        expect().assertFail();
      } catch (e62) {
        expect(e62.code).assertEqual(10200001);
      }
      let actual62: string = d62.toString();
      expect(actual62).assertEqual('42');

      // 63. 42 toBinary(0, 4) throws 10200001 and 0.5 toBinary(20, 4) yields '0b1p-1'
      let d1_63: Decimal = new Decimal(42);
      let d2_63: Decimal = new Decimal(0.5);
      try {
        d1_63.toBinary(0, 4);
        expect().assertFail();
      } catch (e63) {
        expect(e63.code).assertEqual(10200001);
      }
      let s63: string = d2_63.toBinary(20, 4);
      expect(s63).assertEqual('0b1p-1');

      // 64. 5 toBinary(0) throws 10200001 then toBinary(3) yields '0b1.01p+2'
      let d64: Decimal = new Decimal(5);
      try {
        d64.toBinary(0);
        expect().assertFail();
      } catch (e64) {
        expect(e64.code).assertEqual(10200001);
      }
      let s64: string = d64.toBinary(3);
      expect(s64).assertEqual('0b1.01p+2');

      // 65. 5 toBinary(-1) throws 10200001 and sign s is unchanged
      let d65: Decimal = new Decimal(5);
      let s0_65 = d65.s;
      try {
        d65.toBinary(-1);
        expect().assertFail();
      } catch (e65) {
        expect(e65.code).assertEqual(10200001);
      }
      let actual65: number = d65.s;
      expect(actual65).assertEqual(s0_65);

      // 66. 10 toBinary(0) throws 10200001 then toBinary(4) and toBinary(4, ROUND_DOWN) yield '0b1.01p+3'
      let d66: Decimal = new Decimal(10);
      try {
        d66.toBinary(0);
        expect().assertFail();
      } catch (e66) {
        expect(e66.code).assertEqual(10200001);
      }
      let s66a: string = d66.toBinary(4);
      expect(s66a).assertEqual('0b1.01p+3');
      let s66b: string = d66.toBinary(4, Decimal.ROUND_DOWN);
      expect(s66b).assertEqual('0b1.01p+3');

      // 67. 2.75 toBinary(-2) throws 10200001 then with config ROUND_DOWN toBinary(2) yields '0b1p+1'
      let d67: Decimal = new Decimal(2.75);
      try {
        d67.toBinary(-2);
        expect().assertFail();
      } catch (e67) {
        expect(e67.code).assertEqual(10200001);
      }
      Decimal.set({ rounding: Decimal.ROUND_DOWN });
      let s67: string = d67.toBinary(2);
      expect(s67).assertEqual('0b1p+1');
      Decimal.set({ defaults: true });

      // 68. 5 toBinary(1e9+1) throws 10200001 and the Decimal still equals itself
      let d68: Decimal = new Decimal(5);
      try {
        d68.toBinary(1e9 + 1);
        expect().assertFail();
      } catch (e68) {
        expect(e68.code).assertEqual(10200001);
      }
      let actual68: boolean = d68.equals(d68);
      expect(actual68).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_BINARY_0800
     * @tc.name decimalToBinaryTest008
     * @tc.desc Invalid significant-digit argument: fractional/NaN/Infinity (9 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('decimalToBinaryTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 69. 42 toBinary(5.5) throws 10200001
      try {
        new Decimal(42).toBinary(5.5);
        expect().assertFail();
      } catch (e69) {
        expect(e69.code).assertEqual(10200001);
      }

      // 70. 42 toBinary(Number.NaN) throws 10200001
      try {
        new Decimal(42).toBinary(Number.NaN);
        expect().assertFail();
      } catch (e70) {
        expect(e70.code).assertEqual(10200001);
      }

      // 71. 42 toBinary(Number.POSITIVE_INFINITY) throws 10200001
      try {
        new Decimal(42).toBinary(Number.POSITIVE_INFINITY);
        expect().assertFail();
      } catch (e71) {
        expect(e71.code).assertEqual(10200001);
      }

      // 72. 42 toBinary(-Number.POSITIVE_INFINITY) throws 10200001
      try {
        new Decimal(42).toBinary(-Number.POSITIVE_INFINITY);
        expect().assertFail();
      } catch (e72) {
        expect(e72.code).assertEqual(10200001);
      }

      // 73. 42 toBinary(2e9, 4) throws 10200001
      try {
        new Decimal(42).toBinary(2e9, 4);
        expect().assertFail();
      } catch (e73) {
        expect(e73.code).assertEqual(10200001);
      }

      // 74. 42 toBinary(1.7976931348623157e308, 4) throws 10200001
      try {
        new Decimal(42).toBinary(1.7976931348623157e308, 4);
        expect().assertFail();
      } catch (e74) {
        expect(e74.code).assertEqual(10200001);
      }

      // 75. 6.25 toBinary(1.5) throws 10200001 and exponent e is unchanged
      let d75: Decimal = new Decimal(6.25);
      let e0_75 = d75.e;
      try {
        d75.toBinary(1.5);
        expect().assertFail();
      } catch (e75) {
        expect(e75.code).assertEqual(10200001);
      }
      let actual75: number = d75.e;
      expect(actual75).assertEqual(e0_75);

      // 76. 5 toBinary(1000000001) throws 10200001 and value, digits, sign and exponent are preserved
      let d76: Decimal = new Decimal(5);
      const arr76: Array<double> = d76.d!.slice(0);
      const originalValue76: string = d76.toString();
      const expectedOriginal76: string = '5';
      expect(originalValue76).assertEqual(expectedOriginal76);
      const originalDigits76: Array<double> = d76.d!.slice(0);
      const originalLength76: int = originalDigits76.length;
      const originalSign76: double = d76.s;
      const originalExponent76: double = d76.e;
      try {
        d76.toBinary(1000000001);
        expect().assertFail();
      } catch (e76) {
        expect(e76.code).assertEqual(10200001);
      }
      let actualLen76: int = d76.d!.length;
      expect(actualLen76).assertEqual(arr76.length);
      const actualOriginal76: string = d76.toString();
      expect(actualOriginal76).assertEqual(expectedOriginal76);
      const actualDigits76: Array<double> = d76.d!;
      const actualDigitsLen76: int = actualDigits76.length;
      expect(actualDigitsLen76).assertEqual(originalLength76);
      for (let coeffIdx76: int = 0; coeffIdx76 < originalLength76; coeffIdx76++) {
        const actualCoeff76: double = actualDigits76[coeffIdx76];
        const expectedCoeff76: double = originalDigits76[coeffIdx76];
        expect(actualCoeff76).assertEqual(expectedCoeff76);
      }
      const actualSign76: double = d76.s;
      expect(actualSign76).assertEqual(originalSign76);
      const actualExponent76: double = d76.e;
      expect(actualExponent76).assertEqual(originalExponent76);

      // 77. 5 toBinary(Number.NaN) throws 10200001 then toBinary(3, ROUND_HALF_UP) yields '0b1.01p+2'
      let d77: Decimal = new Decimal(5);
      try {
        d77.toBinary(Number.NaN);
        expect().assertFail();
      } catch (e77) {
        expect(e77.code).assertEqual(10200001);
      }
      let s77: string = d77.toBinary(3, Decimal.ROUND_HALF_UP);
      expect(s77).assertEqual('0b1.01p+2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_BINARY_0900
     * @tc.name decimalToBinaryTest009
     * @tc.desc Invalid rounding-mode argument (10 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('decimalToBinaryTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 78. 42 toBinary(20, -1) throws 10200001
      try {
        new Decimal(42).toBinary(20, -1);
        expect().assertFail();
      } catch (e78) {
        expect(e78.code).assertEqual(10200001);
      }

      // 79. 42 toBinary(20, 9) throws 10200001
      try {
        new Decimal(42).toBinary(20, 9);
        expect().assertFail();
      } catch (e79) {
        expect(e79.code).assertEqual(10200001);
      }

      // 80. 42 toBinary(20, -9) throws 10200001
      try {
        new Decimal(42).toBinary(20, -9);
        expect().assertFail();
      } catch (e80) {
        expect(e80.code).assertEqual(10200001);
      }

      // 81. 42 toBinary(20, 100) throws 10200001
      try {
        new Decimal(42).toBinary(20, 100);
        expect().assertFail();
      } catch (e81) {
        expect(e81.code).assertEqual(10200001);
      }

      // 82. 42 toBinary(20, 2000000000) throws 10200001
      try {
        new Decimal(42).toBinary(20, 2000000000);
        expect().assertFail();
      } catch (e82) {
        expect(e82.code).assertEqual(10200001);
      }

      // 83. 42 toBinary(20, 2147483647) throws 10200001
      try {
        new Decimal(42).toBinary(20, 2147483647);
        expect().assertFail();
      } catch (e83) {
        expect(e83.code).assertEqual(10200001);
      }

      // 84. 42 toBinary(20, 9) throws 10200001 then toBinary(20, 4) yields '0b1.0101p+5'
      let integerRoundingSource: Decimal = new Decimal(42);
      try {
        integerRoundingSource.toBinary(20, 9);
        expect().assertFail();
      } catch (e84) {
        expect(e84.code).assertEqual(10200001);
      }
      let s84: string = integerRoundingSource.toBinary(20, 4);
      expect(s84).assertEqual('0b1.0101p+5');

      // 85. 42 toBinary(20, -1) throws 10200001 then comparedTo(42) is 0
      let unchangedIntegerSource: Decimal = new Decimal(42);
      try {
        unchangedIntegerSource.toBinary(20, -1);
        expect().assertFail();
      } catch (e85) {
        expect(e85.code).assertEqual(10200001);
      }
      let actual85: number = unchangedIntegerSource.comparedTo(new Decimal(42));
      let expectedComparisonResult: int = 0;
      expect(actual85).assertEqual(expectedComparisonResult);

      // 86. 6.25 toBinary(2, -9) throws 10200001 and toString stays '6.25'
      let unchangedFractionSource: Decimal = new Decimal(6.25);
      try {
        unchangedFractionSource.toBinary(2, -9);
        expect().assertFail();
      } catch (e86) {
        expect(e86.code).assertEqual(10200001);
      }
      let actual86: string = unchangedFractionSource.toString();
      expect(actual86).assertEqual('6.25');

      // 87. 6.25 toBinary(2, 9) throws 10200001 then toBinary(5, ROUND_UP) yields '0b1.1001p+2'
      let fractionRoundingSource: Decimal = new Decimal(6.25);
      try {
        fractionRoundingSource.toBinary(2, 9);
        expect().assertFail();
      } catch (e87) {
        expect(e87.code).assertEqual(10200001);
      }
      let s87: string = fractionRoundingSource.toBinary(5, Decimal.ROUND_UP);
      expect(s87).assertEqual('0b1.1001p+2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_BINARY_1000
     * @tc.name decimalToBinaryTest010
     * @tc.desc Config interaction: rounding-mode settings (10 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('decimalToBinaryTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 88. config rounding ROUND_DOWN makes 42 toBinary(4) reconstruct to 40
      Decimal.set({ rounding: 1 });
      let s88: string = new Decimal(42).toBinary(4);
      Decimal.set({ defaults: true });
      let actual88: boolean = new Decimal(s88).equals(new Decimal(40));
      expect(actual88).assertTrue();

      // 89. config rounding ROUND_HALF_EVEN makes 42 toBinary(4) reconstruct to 40
      Decimal.set({ rounding: 6 });
      let s89: string = new Decimal(42).toBinary(4);
      Decimal.set({ defaults: true });
      let actual89: boolean = new Decimal(s89).equals(new Decimal(40));
      expect(actual89).assertTrue();

      // 90. config rounding ROUND_CEIL makes -42 toBinary(4) reconstruct to -40
      Decimal.set({ rounding: 2 });
      let s90: string = new Decimal(-42).toBinary(4);
      Decimal.set({ defaults: true });
      let actual90: boolean = new Decimal(s90).equals(new Decimal(-40));
      expect(actual90).assertTrue();

      // 91. config rounding ROUND_FLOOR makes -42 toBinary(3) reconstruct to -48
      Decimal.set({ rounding: 3 });
      let s91: string = new Decimal(-42).toBinary(3);
      Decimal.set({ defaults: true });
      let actual91: boolean = new Decimal(s91).equals(new Decimal(-48));
      expect(actual91).assertTrue();

      // 92. config ROUND_DOWN with rm ROUND_UP makes 42 toBinary(1) yield '0b1p+6'
      Decimal.set({ rounding: Decimal.ROUND_DOWN });
      let s92: string = new Decimal(42).toBinary(1, Decimal.ROUND_UP);
      Decimal.set({ defaults: true });
      expect(s92).assertEqual('0b1p+6');

      // 93. config ROUND_UP with rm ROUND_DOWN makes 42 toBinary(1) yield '0b1p+5'
      Decimal.set({ rounding: Decimal.ROUND_UP });
      let s93: string = new Decimal(42).toBinary(1, Decimal.ROUND_DOWN);
      Decimal.set({ defaults: true });
      expect(s93).assertEqual('0b1p+5');

      // 94. config ROUND_DOWN with rm ROUND_UP makes 2.75 toBinary(2) yield '0b1.1p+1'
      Decimal.set({ rounding: Decimal.ROUND_DOWN });
      let d94: Decimal = new Decimal(2.75);
      let s94: string = d94.toBinary(2, Decimal.ROUND_UP);
      expect(s94).assertEqual('0b1.1p+1');
      Decimal.set({ defaults: true });

      // 95. config ROUND_DOWN makes 2.75 toBinary(2) yield '0b1p+1' then defaults yield '0b1.1p+1'
      Decimal.set({ rounding: Decimal.ROUND_DOWN });
      let d95: Decimal = new Decimal(2.75);
      let s95a: string = d95.toBinary(2);
      expect(s95a).assertEqual('0b1p+1');
      Decimal.set({ defaults: true });
      let s95b: string = d95.toBinary(2);
      expect(s95b).assertEqual('0b1.1p+1');

      // 96. config ROUND_HALF_EVEN makes 2.75 toBinary(2) equal toBinary(2, ROUND_HALF_EVEN) and yield '0b1.1p+1'
      Decimal.set({ rounding: Decimal.ROUND_HALF_EVEN });
      let d96: Decimal = new Decimal(2.75);
      let s96a: string = d96.toBinary(2);
      let s96b: string = d96.toBinary(2, Decimal.ROUND_HALF_EVEN);
      expect(s96a).assertEqual(s96b);
      expect(s96a).assertEqual('0b1.1p+1');
      Decimal.set({ defaults: true });

      // 97. config ROUND_DOWN makes 5.5 toBinary(2) equal toBinary(2, ROUND_DOWN) and yield '0b1p+2'
      Decimal.set({ rounding: Decimal.ROUND_DOWN });
      let d97: Decimal = new Decimal(5.5);
      let s97a: string = d97.toBinary(2);
      let s97b: string = d97.toBinary(2, Decimal.ROUND_DOWN);
      expect(s97a).assertEqual(s97b);
      expect(s97a).assertEqual('0b1p+2');
      Decimal.set({ defaults: true });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_BINARY_1100
     * @tc.name decimalToBinaryTest011
     * @tc.desc Config interaction: precision/limits/defaults (10 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('decimalToBinaryTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 98. config precision 5 makes 10 toBinary(20) yield '0b1.01p+3'
      Decimal.set({ precision: 5 });
      let s98: string = new Decimal(10).toBinary(20);
      Decimal.set({ defaults: true });
      expect(s98).assertEqual('0b1.01p+3');

      // 99. config ROUND_DOWN reset to defaults makes 5.5 toBinary(1, ROUND_HALF_UP) yield '0b1p+2'
      Decimal.set({ rounding: Decimal.ROUND_DOWN });
      Decimal.set({ defaults: true });
      let s99: string = new Decimal(5.5).toBinary(1, Decimal.ROUND_HALF_UP);
      expect(s99).assertEqual('0b1p+2');

      // 100. config maxE 10 makes 5 toBinary(3) and toBinary(3, 4) both yield '0b1.01p+2'
      Decimal.set({ maxE: 10 });
      let d100: Decimal = new Decimal(5);
      let s100a: string = d100.toBinary(3);
      expect(s100a).assertEqual('0b1.01p+2');
      let s100b: string = d100.toBinary(3, 4);
      expect(s100b).assertEqual('0b1.01p+2');
      Decimal.set({ defaults: true });

      // 101. config minE -100 makes 0.5 toBinary(1) and toBinary(1, 4) both yield '0b1p-1'
      Decimal.set({ minE: -100 });
      let d101: Decimal = new Decimal(0.5);
      let s101a: string = d101.toBinary(1);
      expect(s101a).assertEqual('0b1p-1');
      let s101b: string = d101.toBinary(1, 4);
      expect(s101b).assertEqual('0b1p-1');
      Decimal.set({ defaults: true });

      // 102. config precision 5 makes 6.25 toBinary(5) and toBinary(5, 4) both yield '0b1.1001p+2'
      Decimal.set({ precision: 5 });
      let d102: Decimal = new Decimal(6.25);
      let s102a: string = d102.toBinary(5);
      expect(s102a).assertEqual('0b1.1001p+2');
      let s102b: string = d102.toBinary(5, 4);
      expect(s102b).assertEqual('0b1.1001p+2');
      Decimal.set({ defaults: true });

      // 103. config ROUND_DOWN makes 0.25 toBinary(1) and toBinary(1, 4) both yield '0b1p-2'
      Decimal.set({ rounding: Decimal.ROUND_DOWN });
      let d103: Decimal = new Decimal(0.25);
      let s103a: string = d103.toBinary(1);
      expect(s103a).assertEqual('0b1p-2');
      let s103b: string = d103.toBinary(1, 4);
      expect(s103b).assertEqual('0b1p-2');
      Decimal.set({ defaults: true });

      // 104. config ROUND_DOWN makes two 2.75 toBinary(2) calls both yield '0b1p+1'
      let d1_104: Decimal = new Decimal(2.75);
      Decimal.set({ rounding: Decimal.ROUND_DOWN });
      let d2_104: Decimal = new Decimal(2.75);
      let s104a: string = d1_104.toBinary(2);
      expect(s104a).assertEqual('0b1p+1');
      let s104b: string = d2_104.toBinary(2);
      expect(s104b).assertEqual('0b1p+1');
      Decimal.set({ defaults: true });

      // 105. precomputed 2.75 toBinary(2) stays '0b1.1p+1' after config ROUND_DOWN
      let d105: Decimal = new Decimal(2.75);
      let r105: string = d105.toBinary(2);
      Decimal.set({ rounding: Decimal.ROUND_DOWN });
      expect(r105).assertEqual('0b1.1p+1');
      Decimal.set({ defaults: true });

      // 106. config ROUND_DOWN makes a copied 2.75 toBinary(2) yield '0b1p+1'
      let d106: Decimal = new Decimal(2.75);
      Decimal.set({ rounding: Decimal.ROUND_DOWN });
      let cd106: Decimal = new Decimal(d106);
      let s106: string = cd106.toBinary(2);
      expect(s106).assertEqual('0b1p+1');
      Decimal.set({ defaults: true });

      // 107. config ROUND_DOWN reset to defaults keeps 10 sign 1 and toBinary(4) yields '0b1.01p+3'
      let d107: Decimal = new Decimal(10);
      Decimal.set({ rounding: Decimal.ROUND_DOWN });
      Decimal.set({ defaults: true });
      let actual107: number = d107.s;
      let expected107: int = 1;
      expect(actual107).assertEqual(expected107);
      let s107: string = d107.toBinary(4);
      expect(s107).assertEqual('0b1.01p+3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_BINARY_1200
     * @tc.name decimalToBinaryTest012
     * @tc.desc State preservation & round-trip reconstruction (10 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('decimalToBinaryTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 108. 42 toBinary(20) keeps toString '42' and yields '0b1.0101p+5'
      let d108: Decimal = new Decimal(42);
      let s108: string = d108.toBinary(20);
      let actual108: string = d108.toString();
      expect(actual108).assertEqual('42');
      expect(s108).assertEqual('0b1.0101p+5');

      // 109. 123456789 toBinary(40, ROUND_HALF_UP) reconstructs to 123456789
      let s109: string = new Decimal(123456789).toBinary(40, Decimal.ROUND_HALF_UP);
      let actual109: boolean = new Decimal(s109).equals(new Decimal(123456789));
      expect(actual109).assertTrue();

      // 110. -42 toBinary(30, ROUND_HALF_UP) reconstructs to -42
      let s110: string = new Decimal(-42).toBinary(30, Decimal.ROUND_HALF_UP);
      let actual110: boolean = new Decimal(s110).equals(new Decimal(-42));
      expect(actual110).assertTrue();

      // 111. 6.25 toBinary(5) and toBinary(5, ROUND_DOWN) keep toString '6.25'
      let d111: Decimal = new Decimal(6.25);
      d111.toBinary(5);
      d111.toBinary(5, Decimal.ROUND_DOWN);
      let actual111: string = d111.toString();
      expect(actual111).assertEqual('6.25');

      // 112. 6.25 toBinary(5) and toBinary(5, ROUND_UP) keep sign s unchanged
      let d112: Decimal = new Decimal(6.25);
      let s0_112 = d112.s;
      d112.toBinary(5);
      d112.toBinary(5, Decimal.ROUND_UP);
      let actual112: number = d112.s;
      expect(actual112).assertEqual(s0_112);

      // 113. 6.25 toBinary(5) and toBinary(5, ROUND_HALF_UP) keep exponent e unchanged
      let d113: Decimal = new Decimal(6.25);
      let e0_113 = d113.e;
      d113.toBinary(5);
      d113.toBinary(5, Decimal.ROUND_HALF_UP);
      let actual113: number = d113.e;
      expect(actual113).assertEqual(e0_113);

      // 114. 5 reconstructed from toBinary(3) comparedTo original is 0
      let d114: Decimal = new Decimal(5);
      let back114: Decimal = new Decimal(d114.toBinary(3));
      let actual114: number = back114.comparedTo(d114);
      let expected114: int = 0;
      expect(actual114).assertEqual(expected114);

      // 115. 2.75 toBinary(2, ROUND_DOWN) reconstructs comparedTo 2 as 0 and yields '0b1p+1'
      let d115: Decimal = new Decimal(2.75);
      let s115: string = d115.toBinary(2, Decimal.ROUND_DOWN);
      let back115: Decimal = new Decimal(s115);
      let actual115: number = back115.comparedTo(new Decimal(2));
      let expected115: int = 0;
      expect(actual115).assertEqual(expected115);
      expect(s115).assertEqual('0b1p+1');

      // 116. -6.25 reconstructed from toBinary(5) comparedTo original is 0
      let d116: Decimal = new Decimal(-6.25);
      let back116: Decimal = new Decimal(d116.toBinary(5));
      let actual116: number = back116.comparedTo(d116);
      let expected116: int = 0;
      expect(actual116).assertEqual(expected116);

      // 117. 21 after toBinary(5) and toBinary(5, 4) comparedTo equal Decimal is 0
      let d117: Decimal = new Decimal(21);
      let d2_117: Decimal = new Decimal(21);
      d117.toBinary(5);
      d117.toBinary(5, 4);
      let actual117: number = d117.comparedTo(d2_117);
      let expected117: int = 0;
      expect(actual117).assertEqual(expected117);
    });
  });
}
