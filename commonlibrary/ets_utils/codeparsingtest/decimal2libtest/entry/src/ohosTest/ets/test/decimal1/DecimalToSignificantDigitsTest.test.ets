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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium-dynamic';
import { Decimal } from '@kit.ArkTS';
import * as common from '../common/DecimalTestCommon';

type Rounding = 0 | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8;

export default function DecimalToSignificantDigitsTest() {
  describe('DecimalToSignificantDigitsTest', () => {
    beforeAll(() => {
    });
    beforeEach(async () => {
      await common.sleep(common.DEFAULT_SLEEP_MS);
    });
    afterEach(() => { common.resetDecimalConfig(Decimal); });
    afterAll(() => {
    });


    /**
     * @tc.name testDecimalToSignificantDigitsPart01Test001
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_SIGNIFICANT_DIGITS_PART01_TEST_0100
     * @tc.desc Verify zero-arg and two-arg toSignificantDigits behavior with various sd
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalToSignificantDigitsPart01Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Decimal('987.654321').toSignificantDigits().toString()).assertEqual('987.654321');
      expect(new Decimal(0).toSignificantDigits().toString()).assertEqual('0');
      expect(new Decimal('1.23456789012345678901').toSignificantDigits().toString()).assertEqual('1.234567890123456789');
      let d4: Decimal = new Decimal('123.456');
      let r4: Decimal = d4.toSignificantDigits();
      expect(d4.toString()).assertEqual('123.456');
      expect(r4 === d4).assertFalse();
      expect(new Decimal('987.654321').toSignificantDigits(6, 4).toString()).assertEqual('987.654');
      expect(new Decimal(0).toSignificantDigits(3, 4).toString()).assertEqual('0');
      expect(new Decimal('987.654321').toSignificantDigits(1, 4).toString()).assertEqual('1000');
      expect(new Decimal('987.654321').toSignificantDigits(2, 4).toString()).assertEqual('990');
      expect(new Decimal('987.654321').toSignificantDigits(5, 4).toString()).assertEqual('987.65');
      expect(new Decimal('987.654321').toSignificantDigits(9, 4).toString()).assertEqual('987.654321');
      expect(new Decimal('987.654321').toSignificantDigits(20, 4).toString()).assertEqual('987.654321');
      expect(new Decimal('987.654321').toSignificantDigits(1e9, 4).toString()).assertEqual('987.654321');
      expect(new Decimal('123.45').toSignificantDigits(100, 4).toString()).assertEqual('123.45');
    });

    /**
     * @tc.name testDecimalToSignificantDigitsPart01Test014
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_SIGNIFICANT_DIGITS_PART01_TEST_1400
     * @tc.desc Verify sd on decimal, scientific and extreme number values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalToSignificantDigitsPart01Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Decimal('0.0012345').toSignificantDigits(2, 4).toString()).assertEqual('0.0012');
      expect(new Decimal('0.049').toSignificantDigits(5, 4).toString()).assertEqual('0.049');
      expect(new Decimal('123456789').toSignificantDigits(3, 4).toString()).assertEqual('123000000');
      expect(new Decimal('1.2345e-7').toSignificantDigits(3, 4).toString()).assertEqual('1.23e-7');
      expect(new Decimal(Number.MAX_VALUE).toSignificantDigits(5, 4).toString()).assertEqual('1.7977e+308');
      expect(new Decimal(Number.MAX_SAFE_INTEGER).toSignificantDigits(16, 4).toString()).assertEqual('9007199254740991');
      expect(new Decimal(Number.MIN_SAFE_INTEGER).toSignificantDigits(16, 4).toString()).assertEqual('-9007199254740991');
      expect(new Decimal(Number.MIN_VALUE).toSignificantDigits(1, 4).toString()).assertEqual('5e-324');
      expect(new Decimal(Number.EPSILON).toSignificantDigits(1, 4).toString()).assertEqual('2e-16');
      let r23: Decimal = new Decimal(-0).toSignificantDigits(3, 4);
      expect(r23.s).assertEqual(-1);
      expect(r23.toString()).assertEqual('0');
      expect(new Decimal(NaN).toSignificantDigits(3, 4).toString()).assertEqual('NaN');
      expect(new Decimal(Infinity).toSignificantDigits(3, 4).toString()).assertEqual('Infinity');
      expect(new Decimal(-Infinity).toSignificantDigits(3, 4).toString()).assertEqual('-Infinity');
    });

    /**
     * @tc.name testDecimalToSignificantDigitsPart01Test027
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_SIGNIFICANT_DIGITS_PART01_TEST_2700
     * @tc.desc Verify rounding modes 0 to 8 on positive 0.5 tie
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalToSignificantDigitsPart01Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Decimal('0.5').toSignificantDigits(1, 0).toString()).assertEqual('0.5');
      expect(new Decimal('0.5').toSignificantDigits(1, 1).toString()).assertEqual('0.5');
      expect(new Decimal('0.5').toSignificantDigits(1, 2).toString()).assertEqual('0.5');
      expect(new Decimal('0.5').toSignificantDigits(1, 3).toString()).assertEqual('0.5');
      expect(new Decimal('0.5').toSignificantDigits(1, 4).toString()).assertEqual('0.5');
      expect(new Decimal('0.5').toSignificantDigits(1, 5).toString()).assertEqual('0.5');
      expect(new Decimal('0.5').toSignificantDigits(1, 6).toString()).assertEqual('0.5');
      expect(new Decimal('0.5').toSignificantDigits(1, 7).toString()).assertEqual('0.5');
      expect(new Decimal('0.5').toSignificantDigits(1, 8).toString()).assertEqual('0.5');
    });

    /**
     * @tc.name testDecimalToSignificantDigitsPart01Test036
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_SIGNIFICANT_DIGITS_PART01_TEST_3600
     * @tc.desc Verify rounding modes on -0.5 and -1.5 tie values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalToSignificantDigitsPart01Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Decimal('-0.5').toSignificantDigits(1, 0).toString()).assertEqual('-0.5');
      expect(new Decimal('-0.5').toSignificantDigits(1, 1).toString()).assertEqual('-0.5');
      expect(new Decimal('-0.5').toSignificantDigits(1, 2).toString()).assertEqual('-0.5');
      expect(new Decimal('-0.5').toSignificantDigits(1, 3).toString()).assertEqual('-0.5');
      expect(new Decimal('2.5').toSignificantDigits(1, 6).toString()).assertEqual('2');
      expect(new Decimal('1.5').toSignificantDigits(1, 6).toString()).assertEqual('2');
      expect(new Decimal('-1.5').toSignificantDigits(1, 7).toString()).assertEqual('-1');
      expect(new Decimal('-1.5').toSignificantDigits(1, 8).toString()).assertEqual('-2');
    });

    /**
     * @tc.name testDecimalToSignificantDigitsPart01Test044
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_SIGNIFICANT_DIGITS_PART01_TEST_4400
     * @tc.desc Verify tie behaviors and rounding constants equivalence
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalToSignificantDigitsPart01Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Decimal('1.5').toSignificantDigits(1, 8).toString()).assertEqual('1');
      expect(new Decimal('2.5').toSignificantDigits(1, 0).toString()).assertEqual('3');
      expect(new Decimal('2.5').toSignificantDigits(1, 4).toString()).assertEqual('3');
      expect(new Decimal('2.5').toSignificantDigits(1, 5).toString()).assertEqual('2');
      expect(new Decimal('1.001').toSignificantDigits(2, 0).toString()).assertEqual('1.1');
      expect(new Decimal('1.999').toSignificantDigits(2, 1).toString()).assertEqual('1.9');
      expect(new Decimal('0.5').toSignificantDigits(1, Decimal.ROUND_UP).toString()).assertEqual('0.5');
      let rm: number = -0;
      expect(new Decimal('0.5').toSignificantDigits(1, rm as Rounding).toString()).assertEqual('0.5');
      expect(new Decimal('987.654321').toSignificantDigits(1e9, 0).toString()).assertEqual('987.654321');
    });

    /**
     * @tc.name testDecimalToSignificantDigitsPart01Test053
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_SIGNIFICANT_DIGITS_PART01_TEST_5300
     * @tc.desc Verify out-of-range combinations, propagation and return value behaviors
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalToSignificantDigitsPart01Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d53: Decimal = new Decimal('987.654321');
      let errCode53: number = -1;
      try {
        let rm: ESObject = 9;
        d53.toSignificantDigits(6, rm as Rounding);
      } catch (e) {
        errCode53 = (e as ESObject).code;
      }
      expect(errCode53).assertEqual(10200001);
      let d54: Decimal = new Decimal('987.654321');
      let errCode54: number = -1;
      try {
        d54.toSignificantDigits(0, 8);
      } catch (e) {
        errCode54 = (e as ESObject).code;
      }
      expect(errCode54).assertEqual(10200001);
      expect(new Decimal(NaN).toSignificantDigits(1, 4).toString()).assertEqual('NaN');
      expect(new Decimal(-0).toSignificantDigits(1, 8).s).assertEqual(-1);
      expect(new Decimal(Infinity).toSignificantDigits(1, 0).toString()).assertEqual('Infinity');
      let r58: Decimal = new Decimal('123.45').toSignificantDigits(4, 4);
      expect(r58.d.length).assertEqual(2);
      expect(r58.e).assertEqual(2);
      expect(r58.s).assertEqual(1);
      expect(r58.toString()).assertEqual('123.5');
      let d59: Decimal = new Decimal('987.654321');
      expect(d59.toSignificantDigits().comparedTo(d59)).assertEqual(0);
      expect(new Decimal('12.3456').toSignificantDigits(3, 4).toString()).assertEqual('12.3');
      expect(new Decimal('123.456').toSignificantDigits(3, 4).add(1).toString()).assertEqual('124');
      let r62: Decimal = new Decimal('-987.654321').toSignificantDigits(3, 4);
      expect(r62.s).assertEqual(-1);
      expect(r62.toString()).assertEqual('-988');
    });

    /**
     * @tc.name testDecimalToSignificantDigitsPart01Test063
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_SIGNIFICANT_DIGITS_PART01_TEST_6300
     * @tc.desc Verify out-of-range sd values throw 10200001
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalToSignificantDigitsPart01Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let badSds: Array<number> = [0, -1, -1e9, 1e9 + 1, 1e15, NaN, Infinity, -Infinity, -0, 1.5, 0.5, -0.5];
      for (let i: number = 0; i < badSds.length; i++) {
        let d: Decimal = new Decimal('987.654321');
        let errCode: number = -1;
        try {
          d.toSignificantDigits(badSds[i], 4);
        } catch (e) {
          errCode = (e as ESObject).code;
        }
        expect(errCode).assertEqual(10200001);
      }
    });

    /**
     * @tc.name testDecimalToSignificantDigitsPart01Test075
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_SIGNIFICANT_DIGITS_PART01_TEST_7500
     * @tc.desc Verify out-of-range rounding values throw 10200001
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalToSignificantDigitsPart01Test075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let badRms: Array<number> = [9, -1, 10, 1e9, NaN, Infinity, -Infinity, 0.5, -0.5];
      for (let i: number = 0; i < badRms.length; i++) {
        let d: Decimal = new Decimal('987.654321');
        let errCode: number = -1;
        try {
          let rm: ESObject = badRms[i];
          d.toSignificantDigits(3, rm as Rounding);
        } catch (e) {
          errCode = (e as ESObject).code;
        }
        expect(errCode).assertEqual(10200001);
      }
    });


    /**
     * @tc.name testDecimalToSignificantDigitsPart02Test001
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_SIGNIFICANT_DIGITS_PART02_TEST_0100
     * @tc.desc Verify one-arg and two-arg toSignificantDigits with various sd
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalToSignificantDigitsPart02Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Decimal(45.6).toSignificantDigits(2).toString()).assertEqual('46');
      expect(new Decimal(987.654321).toSignificantDigits(6).toString()).assertEqual('987.654');
      let d3: Decimal = new Decimal(45.6);
      let sd: number = 3;
      expect(d3.toSignificantDigits(sd).toString()).assertEqual('45.6');
      expect(new Decimal(123.456).toSignificantDigits().toString()).assertEqual('123.456');
      expect(new Decimal(1.25).toSignificantDigits(2, Decimal.ROUND_DOWN).toString()).assertEqual('1.2');
      expect(new Decimal(45.6).toSignificantDigits(1e6).toString()).assertEqual('45.6');
      expect(new Decimal(45.6).toSignificantDigits(1).toString()).assertEqual('50');
      expect(new Decimal(45.6).toSignificantDigits(3).toString()).assertEqual('45.6');
      expect(new Decimal(45.6).toSignificantDigits(5).toString()).assertEqual('45.6');
      expect(new Decimal(123.456).toSignificantDigits(2).toString()).assertEqual('120');
      expect(new Decimal(123.456).toSignificantDigits(3).toString()).assertEqual('123');
      expect(new Decimal(123.456).toSignificantDigits(4).toString()).assertEqual('123.5');
      expect(new Decimal(123.456).toSignificantDigits(5).toString()).assertEqual('123.46');
    });

    /**
     * @tc.name testDecimalToSignificantDigitsPart02Test014
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_SIGNIFICANT_DIGITS_PART02_TEST_1400
     * @tc.desc Verify sd 1 and 2 carry behaviors on various inputs
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalToSignificantDigitsPart02Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Decimal(9.9).toSignificantDigits(1).toString()).assertEqual('10');
      expect(new Decimal(999.9).toSignificantDigits(1).toString()).assertEqual('1000');
      expect(new Decimal(0.0004567).toSignificantDigits(2).toString()).assertEqual('0.00046');
      expect(new Decimal(0.5).toSignificantDigits(1).toString()).assertEqual('0.5');
      expect(new Decimal(1.5).toSignificantDigits(1).toString()).assertEqual('2');
      expect(new Decimal(1.25).toSignificantDigits(2).toString()).assertEqual('1.3');
      expect(new Decimal(1.24).toSignificantDigits(2).toString()).assertEqual('1.2');
      expect(new Decimal(9.999).toSignificantDigits(3).toString()).assertEqual('10');
      expect(new Decimal('999.99').toSignificantDigits(1).toString()).assertEqual('1000');
      expect(new Decimal(100).toSignificantDigits(1).toString()).assertEqual('100');
      expect(new Decimal(-45.6).toSignificantDigits(1).toString()).assertEqual('-50');
    });

    /**
     * @tc.name testDecimalToSignificantDigitsPart02Test025
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_SIGNIFICANT_DIGITS_PART02_TEST_2500
     * @tc.desc Verify negative values and tie scenarios
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalToSignificantDigitsPart02Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Decimal(-45.6).toSignificantDigits(2).toString()).assertEqual('-46');
      expect(new Decimal(-123.456).toSignificantDigits(2).toString()).assertEqual('-120');
      expect(new Decimal(0.000999).toSignificantDigits(1).toString()).assertEqual('0.001');
      expect(new Decimal(1.05).toSignificantDigits(2).toString()).assertEqual('1.1');
      expect(new Decimal(1.05).toSignificantDigits(3).toString()).assertEqual('1.05');
      expect(new Decimal(999.95).toSignificantDigits(4).toString()).assertEqual('1000');
      expect(new Decimal(-0.0004567).toSignificantDigits(2).toString()).assertEqual('-0.00046');
      expect(new Decimal(0.0045).toSignificantDigits(1).toString()).assertEqual('0.005');
    });

    /**
     * @tc.name testDecimalToSignificantDigitsPart02Test033
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_SIGNIFICANT_DIGITS_PART02_TEST_3300
     * @tc.desc Verify type-coerced sd values dispatch behavior
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalToSignificantDigitsPart02Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d33: Decimal = new Decimal(45.6);
      let thrown33: boolean = false;
      try {
        let sdU: ESObject = undefined;
        d33.toSignificantDigits(sdU as number);
      } catch (e) {
        thrown33 = true;
        let err: ESObject = e;
        expect(err.code !== undefined).assertTrue();
      }
      expect(thrown33).assertFalse();
      let d34: Decimal = new Decimal(45.6);
      let thrown34: boolean = false;
      try {
        let sdN: ESObject = null;
        d34.toSignificantDigits(sdN as number);
      } catch (e) {
        thrown34 = true;
        let err: ESObject = e;
        expect(err.code !== undefined).assertTrue();
      }
      expect(thrown34).assertTrue();
      let d35: Decimal = new Decimal(45.6);
      expect(d35.toSignificantDigits().toString()).assertEqual('45.6');
      let thrown35: boolean = false;
      try {
        let sdU: ESObject = undefined;
        d35.toSignificantDigits(sdU as number);
      } catch (e) {
        thrown35 = true;
      }
      expect(thrown35).assertFalse();
      let d36: Decimal = new Decimal(45.6);
      let sdB: ESObject = true;
      let thrown36: boolean = false;
      try {
        d36.toSignificantDigits(sdB as number);
      } catch (e) {
        thrown36 = true;
        expect((e as ESObject).code).assertEqual(10200001);
      }
      expect(thrown36).assertTrue();
      let d37: Decimal = new Decimal(45.6);
      let thrown37: boolean = false;
      try {
        let sdB2: ESObject = false;
        d37.toSignificantDigits(sdB2 as number);
      } catch (e) {
        thrown37 = true;
        let err: ESObject = e;
        expect(err.code !== undefined).assertTrue();
      }
      expect(thrown37).assertTrue();
      let d38: Decimal = new Decimal(45.6);
      let thrown38: boolean = false;
      try {
        let sdE: ESObject = '';
        d38.toSignificantDigits(sdE as number);
      } catch (e) {
        thrown38 = true;
        let err: ESObject = e;
        expect(err.code !== undefined).assertTrue();
      }
      expect(thrown38).assertTrue();
      let d39: Decimal = new Decimal(45.6);
      let sdS: ESObject = '2';
      let thrown39: boolean = false;
      try {
        d39.toSignificantDigits(sdS as number);
      } catch (e) {
        thrown39 = true;
        expect((e as ESObject).code).assertEqual(10200001);
      }
      expect(thrown39).assertTrue();
      let d40: Decimal = new Decimal(987.654321);
      let sdS2: ESObject = '6';
      let thrown40: boolean = false;
      try {
        d40.toSignificantDigits(sdS2 as number);
      } catch (e) {
        thrown40 = true;
        expect((e as ESObject).code).assertEqual(10200001);
      }
      expect(thrown40).assertTrue();
      let d41: Decimal = new Decimal(45.6);
      let arr: ESObject = [2];
      let thrown41: boolean = false;
      try {
        d41.toSignificantDigits(arr as number);
      } catch (e) {
        thrown41 = true;
        expect((e as ESObject).code).assertEqual(10200001);
      }
      expect(thrown41).assertTrue();
      let d42: Decimal = new Decimal(45.6);
      let thrown42: boolean = false;
      try {
        let arr2: ESObject = [3, 4];
        d42.toSignificantDigits(arr2 as number);
      } catch (e) {
        thrown42 = true;
        let err: ESObject = e;
        expect(err.code !== undefined).assertTrue();
      }
      expect(thrown42).assertTrue();
      let d43: Decimal = new Decimal(45.6);
      let thrown43: boolean = false;
      try {
        let obj: ESObject = {};
        d43.toSignificantDigits(obj as number);
      } catch (e) {
        thrown43 = true;
        let err: ESObject = e;
        expect(err.code !== undefined).assertTrue();
      }
      expect(thrown43).assertTrue();
    });

    /**
     * @tc.name testDecimalToSignificantDigitsPart02Test044
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_SIGNIFICANT_DIGITS_PART02_TEST_4400
     * @tc.desc Verify global rounding config and union type sd dispatch
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalToSignificantDigitsPart02Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ rounding: 1 });
      try {
        expect(new Decimal(1.25).toSignificantDigits(2).toString()).assertEqual('1.2');
      } finally { Decimal.set({ defaults: true }); }
      Decimal.set({ rounding: 0 });
      try {
        expect(new Decimal(1.24).toSignificantDigits(2).toString()).assertEqual('1.3');
      } finally { Decimal.set({ defaults: true }); }
      Decimal.set({ rounding: 2 });
      try {
        expect(new Decimal(-1.25).toSignificantDigits(2).toString()).assertEqual('-1.2');
      } finally { Decimal.set({ defaults: true }); }
      Decimal.set({ rounding: 3 });
      try {
        expect(new Decimal(-1.25).toSignificantDigits(2).toString()).assertEqual('-1.3');
      } finally { Decimal.set({ defaults: true }); }
      Decimal.set({ rounding: 1 });
      Decimal.set({ defaults: true });
      expect(new Decimal(1.25).toSignificantDigits(2).toString()).assertEqual('1.3');
      expect(new Decimal(45.6).toSignificantDigits().toString()).assertEqual('45.6');
      let v50: ESObject = 2;
      expect(new Decimal(45.6).toSignificantDigits(v50 as number).toString()).assertEqual('46');
      let n50: ESObject = null;
      let thrown50: boolean = false;
      try {
        new Decimal(45.6).toSignificantDigits(n50 as number);
      } catch (e) { thrown50 = true; }
      expect(thrown50).assertTrue();
      let v51: ESObject = 2;
      expect(new Decimal(45.6).toSignificantDigits(v51 as number).toString()).assertEqual('46');
      let u51: ESObject = undefined;
      let thrown51: boolean = false;
      try {
        new Decimal(45.6).toSignificantDigits(u51 as number);
      } catch (e) { thrown51 = true; }
      expect(thrown51).assertFalse();
      let n52: ESObject = null;
      let u52: ESObject = undefined;
      let t1: boolean = false;
      let t2: boolean = false;
      try { new Decimal(1).toSignificantDigits(n52 as number); } catch (e) { t1 = true; }
      try { new Decimal(1).toSignificantDigits(u52 as number); } catch (e) { t2 = true; }
      expect(t1).assertTrue();
      expect(t2).assertFalse();
      let v53: ESObject = 3;
      expect(new Decimal(45.6).toSignificantDigits(v53 as number).toString()).assertEqual('45.6');
      let n53: ESObject = null;
      let u53: ESObject = undefined;
      let t1_53: boolean = false;
      let t2_53: boolean = false;
      try { new Decimal(45.6).toSignificantDigits(n53 as number); } catch (e) { t1_53 = true; }
      try { new Decimal(45.6).toSignificantDigits(u53 as number); } catch (e) { t2_53 = true; }
      expect(t1_53).assertTrue();
      expect(t2_53).assertFalse();
    });

    /**
     * @tc.name testDecimalToSignificantDigitsPart02Test054
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_SIGNIFICANT_DIGITS_PART02_TEST_5400
     * @tc.desc Verify dynamic variable dispatch and return value properties
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalToSignificantDigitsPart02Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sdAny: ESObject = 2;
      expect(new Decimal(45.6).toSignificantDigits(sdAny as number).toString()).assertEqual('46');
      let sdAny2: ESObject = null;
      let thrown55: boolean = false;
      try {
        new Decimal(45.6).toSignificantDigits(sdAny2 as number);
      } catch (e) {
        thrown55 = true;
        let err: ESObject = e;
        expect(err.code !== undefined).assertTrue();
      }
      expect(thrown55).assertTrue();
      let sdAny3: ESObject = undefined;
      let thrown56: boolean = false;
      try {
        new Decimal(45.6).toSignificantDigits(sdAny3 as number);
      } catch (e) {
        thrown56 = true;
        let err: ESObject = e;
        expect(err.code !== undefined).assertTrue();
      }
      expect(thrown56).assertFalse();
      let d57: Decimal = new Decimal(45.6);
      let sdAny4: ESObject = 2;
      expect(d57.toSignificantDigits(sdAny4 as number).toString()).assertEqual('46');
      sdAny4 = null;
      let thrown57: boolean = false;
      try { d57.toSignificantDigits(sdAny4 as number); } catch (e) { thrown57 = true; }
      expect(thrown57).assertTrue();
      let d58: Decimal = new Decimal(45.6);
      let r58: Decimal = d58.toSignificantDigits(2);
      expect(typeof r58).assertEqual('object');
      let d59: Decimal = new Decimal(45.6);
      let r59: Decimal = d59.toSignificantDigits(2);
      expect(r59 === d59).assertFalse();
      expect(d59.toString()).assertEqual('45.6');
      let d60: Decimal = new Decimal(45.6);
      let r60: Decimal = d60.toSignificantDigits(2);
      expect(r60.toNumber()).assertEqual(46);
      let d61: Decimal = new Decimal(123.456);
      expect(d61.toSignificantDigits(4).toSignificantDigits(3).toString()).assertEqual('124');
      let d62: Decimal = new Decimal(987.654321);
      let a62: Decimal = d62.toSignificantDigits(6);
      let b62: Decimal = d62.toSignificantDigits(6);
      expect(a62.toString()).assertEqual('987.654');
      expect(b62.toString()).assertEqual('987.654');
      let d63: Decimal = new Decimal(123.456);
      let r3: Decimal = d63.toSignificantDigits(3);
      let r5: Decimal = d63.toSignificantDigits(5);
      expect(r3.toString()).assertEqual('123');
      expect(r5.toString()).assertEqual('123.46');
    });

    /**
     * @tc.name testDecimalToSignificantDigitsPart02Test064
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_SIGNIFICANT_DIGITS_PART02_TEST_6400
     * @tc.desc Verify sufficient sd, zero and out-of-range sd errors part 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalToSignificantDigitsPart02Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Decimal(45.6).toSignificantDigits(10).toString()).assertEqual('45.6');
      let d65: Decimal = new Decimal(45.6);
      let r65: Decimal = d65.toSignificantDigits(2);
      expect(r65.s).assertEqual(1);
      expect(r65.e).assertEqual(1);
      let d66: Decimal = new Decimal(45.6);
      let r66: Decimal = d66.toSignificantDigits(2);
      let sum: Decimal = r66.add(new Decimal(4));
      expect(sum.toString()).assertEqual('50');
      expect(new Decimal(0).toSignificantDigits(3).toString()).assertEqual('0');
      let badSds: Array<number> = [0, -1, -1e9, 0.5, 2.5];
      for (let i: number = 0; i < badSds.length; i++) {
        let d: Decimal = new Decimal(45.6);
        let errCode: number = -1;
        try {
          d.toSignificantDigits(badSds[i]);
        } catch (e) {
          errCode = (e as ESObject).code;
        }
        expect(errCode).assertEqual(10200001);
      }
    });

    /**
     * @tc.name testDecimalToSignificantDigitsPart02Test073
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_SIGNIFICANT_DIGITS_PART02_TEST_7300
     * @tc.desc Verify out-of-range special sd values and instance state recovery
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalToSignificantDigitsPart02Test073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let badSds: Array<number> = [NaN, Infinity, -Infinity, 1e10, 1000000001, Number.MAX_SAFE_INTEGER, Number.MAX_VALUE, Number.MIN_VALUE];
      for (let i: number = 0; i < badSds.length; i++) {
        let d: Decimal = new Decimal(45.6);
        let errCode: number = -1;
        try {
          d.toSignificantDigits(badSds[i]);
        } catch (e) {
          errCode = (e as ESObject).code;
        }
        expect(errCode).assertEqual(10200001);
      }
      let d81: Decimal = new Decimal(45.6);
      let thrown81: boolean = false;
      try {
        d81.toSignificantDigits(0);
      } catch (e) { thrown81 = true; }
      expect(thrown81).assertTrue();
      expect(d81.toSignificantDigits(2).toString()).assertEqual('46');
      let d82: Decimal = new Decimal(45.6);
      let errCode82: number = -1;
      try {
        d82.toSignificantDigits(0);
      } catch (e) {
        errCode82 = (e as ESObject).code;
      }
      expect(errCode82).assertEqual(10200001);
      let errCode82b: number = -1;
      try {
        d82.toSignificantDigits(-5);
      } catch (e) {
        errCode82b = (e as ESObject).code;
      }
      expect(errCode82b).assertEqual(10200001);
    });


    /**
     * @tc.name testDecimalToSignificantDigitsPart03Test001
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_SIGNIFICANT_DIGITS_PART03_TEST_0100
     * @tc.desc Verify three-overload comparisons and out-of-range sd dispatch
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalToSignificantDigitsPart03Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a1: Decimal = new Decimal('987.654321');
      let r0: Decimal = a1.toSignificantDigits();
      let r20: Decimal = a1.toSignificantDigits(20);
      expect(r0.toString()).assertEqual('987.654321');
      expect(r20.toString()).assertEqual('987.654321');
      expect(r0.toString()).assertEqual(r20.toString());
      let a2: Decimal = new Decimal('987.654321');
      expect(a2.toSignificantDigits().toString()).assertEqual('987.654321');
      expect(a2.toSignificantDigits(1).toString()).assertEqual('1000');
      let a3: Decimal = new Decimal('987.654321');
      let r1_3: Decimal = a3.toSignificantDigits(6);
      let r2_3: Decimal = a3.toSignificantDigits(6, Decimal.ROUND_HALF_UP);
      expect(r1_3.toString()).assertEqual(r2_3.toString());
      expect(r1_3.toString()).assertEqual('987.654');
      let a4: Decimal = new Decimal('987.654321');
      try {
        let sdU: ESObject = undefined;
        let r: Decimal = a4.toSignificantDigits(sdU as number);
        expect(r.toString()).assertEqual('987.654321');
      } catch (e) {
        let err: ESObject = e;
        expect(err.code !== undefined).assertTrue();
      }
      let a5: Decimal = new Decimal('123.456');
      try {
        let sdN: ESObject = null;
        let r: Decimal = a5.toSignificantDigits(sdN as number);
        expect(r.toString()).assertEqual('123.456');
      } catch (e) {
        let err: ESObject = e;
        expect(err.code !== undefined).assertTrue();
      }
      let a6: Decimal = new Decimal('123.456');
      let thrown6: boolean = false;
      try {
        a6.toSignificantDigits(0);
        expect().assertFail();
      } catch (e) {
        thrown6 = true;
        expect((e as ESObject).code).assertEqual(10200001);
      }
      expect(thrown6).assertTrue();
      expect(new Decimal('123.456').toSignificantDigits(1e9).toString()).assertEqual('123.456');
      let a8: Decimal = new Decimal('123.456');
      let thrown8: boolean = false;
      try {
        a8.toSignificantDigits(1e9 + 1);
        expect().assertFail();
      } catch (e) {
        thrown8 = true;
        expect((e as ESObject).code).assertEqual(10200001);
      }
      expect(thrown8).assertTrue();
      let badSds: Array<number> = [NaN, Infinity, -Infinity, 2.5, Number.MAX_SAFE_INTEGER, -0];
      for (let i: number = 0; i < badSds.length; i++) {
        let a: Decimal = new Decimal('123.456');
        let thrown: boolean = false;
        try {
          a.toSignificantDigits(badSds[i]);
          expect().assertFail();
        } catch (e) {
          thrown = true;
          expect((e as ESObject).code).assertEqual(10200001);
        }
        expect(thrown).assertTrue();
      }
      let a15: Decimal = new Decimal('0.000123456789');
      let r0_15: Decimal = a15.toSignificantDigits();
      let r9: Decimal = a15.toSignificantDigits(9);
      expect(r0_15.toString()).assertEqual(r9.toString());
      expect(r0_15.toString()).assertEqual('0.000123456789');
    });

    /**
     * @tc.name testDecimalToSignificantDigitsPart03Test016
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_SIGNIFICANT_DIGITS_PART03_TEST_1600
     * @tc.desc Verify global precision and rounding config effects on overloads
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalToSignificantDigitsPart03Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ precision: 5 });
      let a16: Decimal = new Decimal('987.654321');
      let r16: Decimal = a16.toSignificantDigits();
      Decimal.set({ defaults: true });
      expect(r16.toString()).assertEqual('987.65');
      Decimal.set({ precision: 5 });
      let a17: Decimal = new Decimal('987.654321');
      let r0_17: Decimal = a17.toSignificantDigits();
      let r5_17: Decimal = a17.toSignificantDigits(5);
      Decimal.set({ defaults: true });
      expect(r0_17.toString()).assertEqual(r5_17.toString());
      expect(r0_17.toString()).assertEqual('987.65');
      Decimal.set({ precision: 5 });
      let a18: Decimal = new Decimal('987.654321');
      let r10: Decimal = a18.toSignificantDigits(10);
      Decimal.set({ defaults: true });
      expect(r10.toString()).assertEqual('987.654321');
      Decimal.set({ precision: 3, rounding: Decimal.ROUND_DOWN });
      let a19: Decimal = new Decimal('99.995');
      let r19: Decimal = a19.toSignificantDigits();
      Decimal.set({ defaults: true });
      expect(r19.toString()).assertEqual('99.9');
      Decimal.set({ precision: 3, rounding: Decimal.ROUND_DOWN });
      let a20: Decimal = new Decimal('99.995');
      let r20_20: Decimal = a20.toSignificantDigits(3);
      Decimal.set({ defaults: true });
      expect(r20_20.toString()).assertEqual('99.9');
      Decimal.set({ precision: 3, rounding: Decimal.ROUND_DOWN });
      let a21: Decimal = new Decimal('99.995');
      let r0_21: Decimal = a21.toSignificantDigits();
      let r2_21: Decimal = a21.toSignificantDigits(3, Decimal.ROUND_HALF_UP);
      Decimal.set({ defaults: true });
      expect(r0_21.toString()).assertEqual('99.9');
      expect(r2_21.toString()).assertEqual('100');
      Decimal.set({ precision: 1 });
      let a22: Decimal = new Decimal('987.654321');
      let r0_22: Decimal = a22.toSignificantDigits();
      let r1_22: Decimal = a22.toSignificantDigits(1);
      Decimal.set({ defaults: true });
      expect(r0_22.toString()).assertEqual(r1_22.toString());
      expect(r0_22.toString()).assertEqual('1000');
      let a23: Decimal = new Decimal('0.00000123456789');
      let r0_23: Decimal = a23.toSignificantDigits();
      let r11: Decimal = a23.toSignificantDigits(11);
      expect(r0_23.toString()).assertEqual(r11.toString());
      expect(r0_23.toString()).assertEqual('0.00000123456789');
    });

    /**
     * @tc.name testDecimalToSignificantDigitsPart03Test024
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_SIGNIFICANT_DIGITS_PART03_TEST_2400
     * @tc.desc Verify instance state preservation after throws and return value behaviors
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalToSignificantDigitsPart03Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a24: Decimal = new Decimal('987.654321');
      try {
        a24.toSignificantDigits(-3);
        expect().assertFail();
      } catch (e) {
        expect((e as ESObject).code).assertEqual(10200001);
      }
      expect(a24.toString()).assertEqual('987.654321');
      let a25: Decimal = new Decimal('987.654321');
      let dBefore: string = a25.d.join('');
      let eBefore: number = a25.e;
      let sBefore: number = a25.s;
      try {
        a25.toSignificantDigits(0);
        expect().assertFail();
      } catch (e) {
        expect((e as ESObject).code).assertEqual(10200001);
      }
      expect(a25.d.join('')).assertEqual(dBefore);
      expect(a25.e).assertEqual(eBefore);
      expect(a25.s).assertEqual(sBefore);
      let a26: Decimal = new Decimal('987.654321');
      try {
        let rm: ESObject = 9;
        a26.toSignificantDigits(5, rm as Rounding);
        expect().assertFail();
      } catch (e) {
        expect((e as ESObject).code).assertEqual(10200001);
      }
      expect(a26.toString()).assertEqual('987.654321');
      let a27: Decimal = new Decimal('987.654321');
      try {
        a27.toSignificantDigits(0);
        expect().assertFail();
      } catch (e) {
        expect((e as ESObject).code).assertEqual(10200001);
      }
      expect(a27.add(1).toString()).assertEqual('988.654321');
      let a28: Decimal = new Decimal('987.654321');
      try {
        a28.toSignificantDigits(0);
        expect().assertFail();
      } catch (e) {
        expect((e as ESObject).code).assertEqual(10200001);
      }
      expect(a28.toSignificantDigits(4).toString()).assertEqual('987.7');
      let a29: Decimal = new Decimal('987.654321');
      try {
        a29.toSignificantDigits(0);
        expect().assertFail();
      } catch (e) {
        expect((e as ESObject).code).assertEqual(10200001);
      }
      try {
        let rm: ESObject = -1;
        a29.toSignificantDigits(1, rm as Rounding);
        expect().assertFail();
      } catch (e) {
        expect((e as ESObject).code).assertEqual(10200001);
      }
      let a30_a: Decimal = new Decimal('987.654321');
      let a30_b: Decimal = new Decimal('123.456');
      try {
        a30_b.toSignificantDigits(0);
        expect().assertFail();
      } catch (e) {
        expect((e as ESObject).code).assertEqual(10200001);
      }
      expect(a30_a.toString()).assertEqual('987.654321');
      let a31: Decimal = new Decimal('987.654321');
      let dRef: number[] = a31.d;
      let r31: Decimal = a31.toSignificantDigits(3);
      expect(a31.d === dRef).assertTrue();
      expect(r31.toString()).assertEqual('988');
      let a32: Decimal = new Decimal('987.654321');
      let r0_32: Decimal = a32.toSignificantDigits();
      let r1_32: Decimal = a32.toSignificantDigits(5);
      let r2_32: Decimal = a32.toSignificantDigits(5, Decimal.ROUND_DOWN);
      expect(typeof r0_32.toString).assertEqual('function');
      expect(typeof r1_32.toString).assertEqual('function');
      expect(typeof r2_32.toString).assertEqual('function');
      let a33: Decimal = new Decimal('987.654321');
      let r0_33: Decimal = a33.toSignificantDigits();
      let r1_33: Decimal = a33.toSignificantDigits(5);
      let r2_33: Decimal = a33.toSignificantDigits(5, Decimal.ROUND_UP);
      expect(a33 === r0_33).assertFalse();
      expect(a33 === r1_33).assertFalse();
      expect(a33 === r2_33).assertFalse();
      expect(new Decimal('123.45').toSignificantDigits().toString()).assertEqual('123.45');
      expect(new Decimal('987.654321').toSignificantDigits(7).toString()).assertEqual('987.6543');
    });

    /**
     * @tc.name testDecimalToSignificantDigitsPart03Test036
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_SIGNIFICANT_DIGITS_PART03_TEST_3600
     * @tc.desc Verify return object fields and rounding mode variations
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalToSignificantDigitsPart03Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a36: Decimal = new Decimal('987.654321');
      expect(a36.toSignificantDigits(6, Decimal.ROUND_UP).toString()).assertEqual('987.655');
      let a37: Decimal = new Decimal('987.654321');
      expect(a37.toSignificantDigits(6, Decimal.ROUND_DOWN).toString()).assertEqual('987.654');
      let r38: Decimal = new Decimal('-987.654321').toSignificantDigits(4);
      expect(r38.s).assertEqual(-1);
      expect(r38.toString()).assertEqual('-987.7');
      let r39: Decimal = new Decimal('987.654321').toSignificantDigits(4);
      expect(r39.s).assertEqual(1);
      expect(r39.toString()).assertEqual('987.7');
      let a40: Decimal = new Decimal('987.654321');
      let r40: Decimal = a40.toSignificantDigits(6);
      expect(r40.e).assertEqual(2);
      expect(a40.e).assertEqual(2);
      let a41: Decimal = new Decimal('987.654321');
      let r41: Decimal = a41.toSignificantDigits(6);
      expect(r41.d.length).assertEqual(2);
      let a42: Decimal = new Decimal('987.654321');
      let r42: Decimal = a42.toSignificantDigits(6, Decimal.ROUND_UP);
      expect(r42.d.join('')).assertEqual('9876550000');
      let a43: Decimal = new Decimal('987.654321');
      expect(a43.toSignificantDigits(4).add(1).toString()).assertEqual('988.7');
      let z: Decimal = new Decimal(0);
      let r44: Decimal = z.toSignificantDigits(5);
      expect(r44.toString()).assertEqual('0');
      expect(r44.d.length).assertEqual(1);
    });

    /**
     * @tc.name testDecimalToSignificantDigitsPart03Test045
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_SIGNIFICANT_DIGITS_PART03_TEST_4500
     * @tc.desc Verify return object operations and shared global state
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalToSignificantDigitsPart03Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a45: Decimal = new Decimal('987.654321');
      let r45: Decimal = a45.toSignificantDigits(1);
      expect(r45.toString()).assertEqual('1000');
      expect(r45.e).assertEqual(3);
      expect(a45.e).assertEqual(2);
      let a46: Decimal = new Decimal('987.654321');
      expect(a46.toSignificantDigits(6).toSignificantDigits(3).toString()).assertEqual('988');
      let a47: Decimal = new Decimal('987.654321');
      let r47: Decimal = a47.toSignificantDigits(4);
      expect(r47.toNumber()).assertEqual(987.7);
      expect(r47.toString()).assertEqual('987.7');
      let a48: Decimal = new Decimal('987.654321');
      expect(a48.toSignificantDigits(2).toString()).assertEqual('990');
      expect(a48.toSignificantDigits(3).toString()).assertEqual('988');
      expect(a48.toSignificantDigits(4).toString()).assertEqual('987.7');
      let a49: Decimal = new Decimal('987.654321');
      let r1_49: Decimal = a49.toSignificantDigits();
      let r2_49: Decimal = a49.toSignificantDigits();
      expect(r1_49 === r2_49).assertFalse();
      expect(r1_49.toString()).assertEqual(r2_49.toString());
      let a50: Decimal = new Decimal('987.654321');
      let r50: Decimal = a50.toSignificantDigits(5);
      expect(r50.d === a50.d).assertFalse();
      let a51: Decimal = new Decimal('987.654321');
      let r51: Decimal = a51.toSignificantDigits(5);
      let a2_51: Decimal = a51.add(1);
      expect(r51.toString()).assertEqual('987.65');
      expect(a2_51.toString()).assertEqual('988.654321');
      let a52: Decimal = new Decimal('987.654321');
      expect(a52.toSignificantDigits(3).toString()).assertEqual('988');
      expect(a52.toSignificantDigits(5).toString()).assertEqual('987.65');
      let a53: Decimal = new Decimal('987.654321');
      let before: Decimal = a53.toSignificantDigits();
      Decimal.set({ precision: 3 });
      let after: Decimal = a53.toSignificantDigits();
      Decimal.set({ defaults: true });
      expect(before.toString()).assertEqual('987.654321');
      expect(after.toString()).assertEqual('988');
    });

    /**
     * @tc.name testDecimalToSignificantDigitsPart03Test054
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_SIGNIFICANT_DIGITS_PART03_TEST_5400
     * @tc.desc Verify defaults restore, instance independence and enum/rounding mode behaviors
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalToSignificantDigitsPart03Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a54: Decimal = new Decimal('987.654321');
      Decimal.set({ precision: 3 });
      Decimal.set({ defaults: true });
      expect(a54.toSignificantDigits().toString()).assertEqual('987.654321');
      let a55: Decimal = new Decimal('987.654321');
      let r55: Decimal = a55.toSignificantDigits(3);
      expect(r55.toString() === a55.toString()).assertFalse();
      expect(r55.toString()).assertEqual('988');
      expect(a55.toString()).assertEqual('987.654321');
      let a56: Decimal = new Decimal('99.995');
      Decimal.set({ rounding: Decimal.ROUND_DOWN });
      let r56: Decimal = a56.toSignificantDigits(3);
      Decimal.set({ defaults: true });
      expect(r56.toString()).assertEqual('99.9');
      let a57: Decimal = new Decimal('987.654321');
      let r1_57: Decimal = a57.toSignificantDigits(4);
      let r2_57: Decimal = a57.toSignificantDigits(5);
      expect(r1_57.d === r2_57.d).assertFalse();
      let a58: Decimal = new Decimal('987.654321');
      let r1_58: Decimal = a58.toSignificantDigits(6, 0);
      let r2_58: Decimal = a58.toSignificantDigits(6, Decimal.ROUND_UP);
      expect(r1_58.toString()).assertEqual(r2_58.toString());
      expect(r1_58.toString()).assertEqual('987.655');
      let a59: Decimal = new Decimal('987.654321');
      let r1_59: Decimal = a59.toSignificantDigits(6, 4);
      let r2_59: Decimal = a59.toSignificantDigits(6, Decimal.ROUND_HALF_UP);
      expect(r1_59.toString()).assertEqual(r2_59.toString());
      expect(r1_59.toString()).assertEqual('987.654');
      let a60: Decimal = new Decimal('5.55');
      expect(a60.toSignificantDigits(2, 0).toString()).assertEqual('5.6');
      expect(a60.toSignificantDigits(2, 1).toString()).assertEqual('5.5');
      expect(a60.toSignificantDigits(2, 2).toString()).assertEqual('5.6');
      expect(a60.toSignificantDigits(2, 3).toString()).assertEqual('5.5');
      expect(a60.toSignificantDigits(2, 4).toString()).assertEqual('5.6');
      expect(a60.toSignificantDigits(2, 5).toString()).assertEqual('5.5');
      expect(a60.toSignificantDigits(2, 6).toString()).assertEqual('5.6');
      expect(a60.toSignificantDigits(2, 7).toString()).assertEqual('5.6');
      expect(a60.toSignificantDigits(2, 8).toString()).assertEqual('5.5');
      let a61: Decimal = new Decimal('-5.55');
      expect(a61.toSignificantDigits(2, Decimal.ROUND_UP).toString()).assertEqual('-5.6');
      expect(a61.toSignificantDigits(2, Decimal.ROUND_DOWN).toString()).assertEqual('-5.5');
      expect(a61.toSignificantDigits(2, Decimal.ROUND_CEILING).toString()).assertEqual('-5.5');
      expect(a61.toSignificantDigits(2, Decimal.ROUND_FLOOR).toString()).assertEqual('-5.6');
      let a62: Decimal = new Decimal('5.65');
      expect(a62.toSignificantDigits(2, Decimal.ROUND_HALF_UP).toString()).assertEqual('5.7');
      expect(a62.toSignificantDigits(2, Decimal.ROUND_HALF_EVEN).toString()).assertEqual('5.6');
      let a63: Decimal = new Decimal('-5.55');
      expect(a63.toSignificantDigits(2, Decimal.ROUND_HALF_CEILING).toString()).assertEqual('-5.5');
      expect(a63.toSignificantDigits(2, Decimal.ROUND_HALF_FLOOR).toString()).assertEqual('-5.6');
    });

    /**
     * @tc.name testDecimalToSignificantDigitsPart03Test064
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_SIGNIFICANT_DIGITS_PART03_TEST_6400
     * @tc.desc Verify out-of-range rounding values and constant arithmetic
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalToSignificantDigitsPart03Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let badRms: Array<number> = [-1, 2.5, NaN];
      for (let i: number = 0; i < badRms.length; i++) {
        let a: Decimal = new Decimal('987.654321');
        let thrown: boolean = false;
        try {
          let rm: ESObject = badRms[i];
          a.toSignificantDigits(5, rm as Rounding);
          expect().assertFail();
        } catch (e) {
          thrown = true;
          expect((e as ESObject).code).assertEqual(10200001);
        }
        expect(thrown).assertTrue();
      }
      let a67: Decimal = new Decimal('987.654321');
      try {
        let rm: ESObject = '4';
        let r: Decimal = a67.toSignificantDigits(5, rm as Rounding);
        expect(r.toString()).assertEqual('987.65');
      } catch (e) {
        let err: ESObject = e;
        expect(err.code !== undefined).assertTrue();
      }
      let a68: Decimal = new Decimal('987.654321');
      let rm: number = Decimal.ROUND_UP + 4;
      let r1_68: Decimal = a68.toSignificantDigits(6, rm as Rounding);
      let r2_68: Decimal = a68.toSignificantDigits(6, Decimal.ROUND_HALF_UP);
      expect(r1_68.toString()).assertEqual(r2_68.toString());
      expect(r1_68.toString()).assertEqual('987.654');
      expect(new Decimal('987.654321').toSignificantDigits(5, Decimal.ROUND_HALF_EVEN).toString()).assertEqual('987.65');
      expect(new Decimal('987.654321').toSignificantDigits(1, Decimal.ROUND_UP).toString()).assertEqual('1000');
      expect(new Decimal('987.654321').toSignificantDigits(1e9, Decimal.ROUND_DOWN).toString()).assertEqual('987.654321');
      let a72: Decimal = new Decimal('987.654321');
      let thrown72: boolean = false;
      try {
        a72.toSignificantDigits(0, Decimal.ROUND_UP);
        expect().assertFail();
      } catch (e) {
        thrown72 = true;
        expect((e as ESObject).code).assertEqual(10200001);
      }
      expect(thrown72).assertTrue();
    });

    /**
     * @tc.name testDecimalToSignificantDigitsPart03Test073
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_SIGNIFICANT_DIGITS_PART03_TEST_7300
     * @tc.desc Verify out-of-range sd with legal rounding, heterogeneous and extreme combinations
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalToSignificantDigitsPart03Test073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a73: Decimal = new Decimal('987.654321');
      let thrown73: boolean = false;
      try {
        a73.toSignificantDigits(-5, Decimal.ROUND_DOWN);
        expect().assertFail();
      } catch (e) {
        thrown73 = true;
        expect((e as ESObject).code).assertEqual(10200001);
      }
      expect(thrown73).assertTrue();
      let a74: Decimal = new Decimal('987.654321');
      let thrown74: boolean = false;
      try {
        let rm: ESObject = Infinity;
        a74.toSignificantDigits(5, rm as Rounding);
        expect().assertFail();
      } catch (e) {
        thrown74 = true;
        expect((e as ESObject).code).assertEqual(10200001);
      }
      expect(thrown74).assertTrue();
      let a75: Decimal = new Decimal('987.654321');
      let thrown75: boolean = false;
      try {
        a75.toSignificantDigits(3.5, Decimal.ROUND_UP);
        expect().assertFail();
      } catch (e) {
        thrown75 = true;
        expect((e as ESObject).code).assertEqual(10200001);
      }
      expect(thrown75).assertTrue();
      let a76: Decimal = new Decimal('987.654321');
      try {
        let rmU: ESObject = undefined;
        let r2: Decimal = a76.toSignificantDigits(6, rmU as Rounding);
        let r1: Decimal = a76.toSignificantDigits(6);
        expect(r2.toString()).assertEqual(r1.toString());
      } catch (e) {
        let err: ESObject = e;
        expect(err.code !== undefined).assertTrue();
      }
      let a77: Decimal = new Decimal('987.654321');
      let r1_77: Decimal = a77.toSignificantDigits(10, Decimal.ROUND_UP);
      let r2_77: Decimal = a77.toSignificantDigits(10, Decimal.ROUND_DOWN);
      expect(r1_77.toString()).assertEqual(r2_77.toString());
      expect(r1_77.toString()).assertEqual('987.654321');
      let a78: Decimal = new Decimal('99.995');
      expect(a78.toSignificantDigits(4, Decimal.ROUND_HALF_UP).toString()).assertEqual('100');
      expect(a78.toSignificantDigits(4, Decimal.ROUND_HALF_DOWN).toString()).assertEqual('99.99');
      let a79: Decimal = new Decimal('987.654321');
      try {
        let sdT: ESObject = true;
        let r: Decimal = a79.toSignificantDigits(sdT as number);
        expect(r.toString()).assertEqual('1000');
      } catch (e) {
        let err: ESObject = e;
        expect(err.code !== undefined).assertTrue();
      }
      expect(new Decimal('123.456').toSignificantDigits(1e9, 0).toString()).assertEqual('123.456');
    });
  });
}
