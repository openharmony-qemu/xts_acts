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

interface Opt {
  dp?: number;
}

function wrapDp(dp?: number): string {
  let dec: Decimal = new Decimal(45.6);
  return dec.toExponential(dp as number);
}

export default function DecimalToExponentialTest() {
  describe('DecimalToExponentialTest', () => {
    beforeAll(() => {
    });
    beforeEach(async () => {
      await common.sleep(common.DEFAULT_SLEEP_MS);
    });
    afterEach(() => { common.resetDecimalConfig(Decimal); });
    afterAll(() => {
    });


    /**
     * @tc.name testDecimalToExponentialPart01Test001
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_EXPONENTIAL_PART01_TEST_0100
     * @tc.desc Verify zero-arg output for basic, sign, zero and special values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalToExponentialPart01Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Decimal(8.88).toExponential()).assertEqual('8.88e+0');
      expect(new Decimal(8.88).toExponential(1, Decimal.ROUND_HALF_UP)).assertEqual('8.9e+0');
      expect(new Decimal(45.6).toExponential()).assertEqual('4.56e+1');
      expect(new Decimal(123456789).toExponential()).assertEqual('1.23456789e+8');
      expect(new Decimal(0.00000123).toExponential()).assertEqual('1.23e-6');
      expect(new Decimal(-45.6).toExponential()).assertEqual('-4.56e+1');
      expect(new Decimal(-0.00000123).toExponential()).assertEqual('-1.23e-6');
      expect(new Decimal(0).toExponential()).assertEqual('0e+0');
      expect(new Decimal(-0).toExponential()).assertEqual('0e+0');
      expect(new Decimal(Number.MAX_VALUE).toExponential()).assertEqual('1.7976931348623157e+308');
      expect(new Decimal(Number.MIN_VALUE).toExponential()).assertEqual('5e-324');
      expect(new Decimal(Number.EPSILON).toExponential()).assertEqual('2.220446049250313e-16');
      expect(new Decimal(Number.MAX_SAFE_INTEGER).toExponential()).assertEqual('9.007199254740991e+15');
      expect(new Decimal(Number.MIN_SAFE_INTEGER).toExponential()).assertEqual('-9.007199254740991e+15');
    });

    /**
     * @tc.name testDecimalToExponentialPart01Test015
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_EXPONENTIAL_PART01_TEST_1500
     * @tc.desc Verify zero-arg output for NaN, Infinity, scientific and string constructed values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalToExponentialPart01Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Decimal(NaN).toExponential()).assertEqual('NaN');
      expect(new Decimal(Infinity).toExponential()).assertEqual('Infinity');
      expect(new Decimal(-Infinity).toExponential()).assertEqual('-Infinity');
      expect(new Decimal(1e21).toExponential()).assertEqual('1e+21');
      expect(new Decimal(0.5).toExponential()).assertEqual('5e-1');
      expect(new Decimal('123456789012345678901234567890').toExponential()).assertEqual(
        '1.2345678901234567890123456789e+29',
      );
      expect(new Decimal('123.4500').toExponential()).assertEqual('1.2345e+2');
      expect(new Decimal('100').toExponential()).assertEqual('1e+2');
      expect(new Decimal('1.5e-7').toExponential()).assertEqual('1.5e-7');
      expect(new Decimal('-1.5e7').toExponential()).assertEqual('-1.5e+7');
      expect(new Decimal(4.75).toExponential()).assertEqual('4.75e+0');
      expect(new Decimal('1e1000000').toExponential()).assertEqual('1e+1000000');
      expect(new Decimal('1e-1000000').toExponential()).assertEqual('1e-1000000');
    });

    /**
     * @tc.name testDecimalToExponentialPart01Test028
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_EXPONENTIAL_PART01_TEST_2800
     * @tc.desc Verify two-arg dp variations on 45.6 and rounding modes on 45.6/-45.6 dp=1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalToExponentialPart01Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: Decimal = new Decimal(45.6);
      expect(dec.toExponential(0, Decimal.ROUND_HALF_UP)).assertEqual('5e+1');
      expect(dec.toExponential(1, Decimal.ROUND_HALF_UP)).assertEqual('4.6e+1');
      expect(dec.toExponential(2, Decimal.ROUND_HALF_UP)).assertEqual('4.56e+1');
      expect(dec.toExponential(3, Decimal.ROUND_HALF_UP)).assertEqual('4.560e+1');
      expect(dec.toExponential(5, Decimal.ROUND_HALF_UP)).assertEqual('4.56000e+1');
      expect(dec.toExponential(20, Decimal.ROUND_HALF_UP)).assertEqual('4.56000000000000000000e+1');
      expect(new Decimal(45.6).toExponential(1, Decimal.ROUND_UP)).assertEqual('4.6e+1');
      expect(new Decimal(45.6).toExponential(1, Decimal.ROUND_DOWN)).assertEqual('4.5e+1');
      expect(new Decimal(45.6).toExponential(1, Decimal.ROUND_CEILING)).assertEqual('4.6e+1');
      expect(new Decimal(-45.6).toExponential(1, Decimal.ROUND_CEILING)).assertEqual('-4.5e+1');
      expect(new Decimal(45.6).toExponential(1, Decimal.ROUND_FLOOR)).assertEqual('4.5e+1');
      expect(new Decimal(-45.6).toExponential(1, Decimal.ROUND_FLOOR)).assertEqual('-4.6e+1');
    });

    /**
     * @tc.name testDecimalToExponentialPart01Test034
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_EXPONENTIAL_PART01_TEST_3400
     * @tc.desc Verify two-arg dp variations across values including carries, padding and -0 boundary
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalToExponentialPart01Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Decimal(123.456).toExponential(0, Decimal.ROUND_HALF_UP)).assertEqual('1e+2');
      expect(new Decimal(123.456).toExponential(2, Decimal.ROUND_HALF_UP)).assertEqual('1.23e+2');
      expect(new Decimal('123.456').toExponential(5, Decimal.ROUND_HALF_UP)).assertEqual('1.23456e+2');
      expect(new Decimal(5).toExponential(2, Decimal.ROUND_HALF_UP)).assertEqual('5.00e+0');
      expect(new Decimal(100).toExponential(0, Decimal.ROUND_HALF_UP)).assertEqual('1e+2');
      expect(new Decimal(9.9).toExponential(0, Decimal.ROUND_HALF_UP)).assertEqual('1e+1');
      expect(new Decimal(9.999).toExponential(2, Decimal.ROUND_HALF_UP)).assertEqual('1.00e+1');
      expect(new Decimal('999.99').toExponential(1, Decimal.ROUND_HALF_UP)).assertEqual('1.0e+3');
      expect(new Decimal(1234567).toExponential(3, Decimal.ROUND_HALF_UP)).assertEqual('1.235e+6');
      expect(new Decimal('123456789.987').toExponential(6, Decimal.ROUND_HALF_UP)).assertEqual('1.234568e+8');
      expect(new Decimal('0.0004567').toExponential(3, Decimal.ROUND_HALF_UP)).assertEqual('4.567e-4');
      expect(new Decimal(-0.00000123).toExponential(1, Decimal.ROUND_UP)).assertEqual('-1.3e-6');
      expect(new Decimal(45.6).toExponential(-0, Decimal.ROUND_HALF_UP)).assertEqual('5e+1');
    });

    /**
     * @tc.name testDecimalToExponentialPart01Test053
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_EXPONENTIAL_PART01_TEST_5300
     * @tc.desc Verify rounding modes direction behavior on tie values 2.5/-2.5 and 0.5
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalToExponentialPart01Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Decimal(2.5).toExponential(0, Decimal.ROUND_HALF_UP)).assertEqual('3e+0');
      expect(new Decimal(2.5).toExponential(0, Decimal.ROUND_HALF_DOWN)).assertEqual('2e+0');
      expect(new Decimal(2.5).toExponential(0, Decimal.ROUND_HALF_EVEN)).assertEqual('2e+0');
      expect(new Decimal(3.5).toExponential(0, Decimal.ROUND_HALF_EVEN)).assertEqual('4e+0');
      expect(new Decimal(2.5).toExponential(0, Decimal.ROUND_HALF_CEILING)).assertEqual('3e+0');
      expect(new Decimal(-2.5).toExponential(0, Decimal.ROUND_HALF_CEILING)).assertEqual('-2e+0');
      expect(new Decimal(2.5).toExponential(0, Decimal.ROUND_HALF_FLOOR)).assertEqual('2e+0');
      expect(new Decimal(-2.5).toExponential(0, Decimal.ROUND_HALF_FLOOR)).assertEqual('-3e+0');
      expect(new Decimal(-45.6).toExponential(1, Decimal.ROUND_UP)).assertEqual('-4.6e+1');
      expect(new Decimal(-45.6).toExponential(1, Decimal.ROUND_DOWN)).assertEqual('-4.5e+1');
      expect(new Decimal(0.5).toExponential(0, Decimal.ROUND_HALF_UP)).assertEqual('5e-1');
      expect(new Decimal(0.5).toExponential(0, Decimal.ROUND_HALF_DOWN)).assertEqual('5e-1');
    });

    /**
     * @tc.name testDecimalToExponentialPart01Test065
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_EXPONENTIAL_PART01_TEST_6500
     * @tc.desc Verify overload consistency, return type, idempotency, format and round trip
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalToExponentialPart01Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: string = new Decimal(12.34).toExponential();
      let b: string = new Decimal(12.34).toExponential(4, Decimal.ROUND_HALF_UP);
      expect(a === '1.234e+1').assertTrue();
      expect(b === '1.2340e+1').assertTrue();
      let dec: Decimal = new Decimal(123.456);
      expect(dec.toExponential(2, Decimal.ROUND_HALF_UP)).assertEqual('1.23e+2');
      expect(dec.toExponential()).assertEqual('1.23456e+2');
      let s: string = new Decimal(45.6).toExponential();
      expect(typeof s).assertEqual('string');
      let decB: Decimal = new Decimal(45.6);
      decB.toExponential(2, Decimal.ROUND_HALF_UP);
      expect(decB.toString()).assertEqual('45.6');
      let decC: Decimal = new Decimal(45.6);
      expect(
        decC.toExponential(0, Decimal.ROUND_HALF_UP).length < decC.toExponential(5, Decimal.ROUND_HALF_UP).length,
      ).assertTrue();
      expect(new Decimal(45.6).toExponential().indexOf('e+1') !== -1).assertTrue();
      expect(new Decimal(0.00000123).toExponential().indexOf('e-6') !== -1).assertTrue();
      expect(Number(new Decimal(45.6).toExponential())).assertEqual(45.6);
      let decD: Decimal = new Decimal(45.6);
      decD.toExponential();
      expect(decD.add(1).toString()).assertEqual('46.6');
    });

    /**
     * @tc.name testDecimalToExponentialPart01Test074
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_EXPONENTIAL_PART01_TEST_7400
     * @tc.desc Verify out-of-range decimalPlaces values throw 10200001
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalToExponentialPart01Test074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let probeThrows = (dp: ESObject): void => {
        let dec: Decimal = new Decimal(45.6);
        let errCode: number = -1;
        try {
          dec.toExponential(dp as number, Decimal.ROUND_HALF_UP);
        } catch (e) {
          errCode = (e as ESObject).code;
        }
        expect(errCode).assertEqual(10200001);
      };
      probeThrows(-1);
      probeThrows(-Infinity);
      probeThrows(NaN);
      probeThrows(Infinity);
      probeThrows(1000000001);
      probeThrows(1.5);
      probeThrows(Number.MAX_SAFE_INTEGER);
      let strDpDec: Decimal = new Decimal(45.6);
      let badDp: ESObject = '1';
      let strDpErr: number = -1;
      try {
        strDpDec.toExponential(badDp as number, Decimal.ROUND_HALF_UP);
      } catch (e) {
        strDpErr = (e as ESObject).code;
      }
      expect(strDpErr).assertEqual(10200001);
    });

    /**
     * @tc.name testDecimalToExponentialPart01Test082
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_EXPONENTIAL_PART01_TEST_8200
     * @tc.desc Verify out-of-range rounding values and both-invalid params throw 10200001
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalToExponentialPart01Test082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let probeRoundingThrows = (rm: ESObject): void => {
        let dec: Decimal = new Decimal(45.6);
        let errCode: number = -1;
        try {
          dec.toExponential(1, rm as Rounding);
        } catch (e) {
          errCode = (e as ESObject).code;
        }
        expect(errCode).assertEqual(10200001);
      };
      let rmNeg1: ESObject = -1;
      probeRoundingThrows(rmNeg1);
      probeRoundingThrows(9);
      probeRoundingThrows(NaN);
      probeRoundingThrows(Infinity);
      probeRoundingThrows(1.5);
      let strRmDec: Decimal = new Decimal(45.6);
      let strRm: ESObject = '4';
      let strRmErr: number = -1;
      try {
        strRmDec.toExponential(1, strRm as Rounding);
      } catch (e) {
        strRmErr = (e as ESObject).code;
      }
      expect(strRmErr).assertEqual(10200001);
      let bothInvalidDec: Decimal = new Decimal(45.6);
      let bothInvalidRm: ESObject = 9;
      let bothInvalidErr: number = -1;
      try {
        bothInvalidDec.toExponential(-1, bothInvalidRm as Rounding);
      } catch (e) {
        bothInvalidErr = (e as ESObject).code;
      }
      expect(bothInvalidErr).assertEqual(10200001);
      let decKeep: Decimal = new Decimal('123.4567');
      expect(decKeep.toExponential()).assertEqual('1.234567e+2');
      expect(decKeep.toExponential(2, Decimal.ROUND_HALF_UP)).assertEqual('1.23e+2');
      let decCarry: Decimal = new Decimal('9.999');
      expect(decCarry.toExponential(2, Decimal.ROUND_HALF_UP)).assertEqual('1.00e+1');
    });


    /**
     * @tc.name testDecimalToExponentialPart02Test001
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_EXPONENTIAL_PART02_TEST_0100
     * @tc.desc Verify single-arg dp basic values and -0 boundary pass through integer check
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalToExponentialPart02Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: Decimal = new Decimal(45.6);
      let s2: string = dec.toExponential(2);
      expect(s2).assertEqual('4.56e+1');
      let dec0: Decimal = new Decimal(45.6);
      let s0: string = dec0.toExponential(0);
      expect(s0).assertEqual('5e+1');
      let dec5: Decimal = new Decimal(45.6);
      let s5: string = dec5.toExponential(5);
      expect(s5).assertEqual('4.56000e+1');
      let decN0: Decimal = new Decimal(45.6);
      let nzero: number = -0;
      expect(decN0.toExponential(nzero)).assertEqual('5e+1');
    });

    /**
     * @tc.name testDecimalToExponentialPart02Test004
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_EXPONENTIAL_PART02_TEST_0400
     * @tc.desc Verify explicit undefined and conditional dispatch fall into default full exponent branch
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalToExponentialPart02Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: Decimal = new Decimal(45.6);
      let u: ESObject = undefined;
      let s: string = dec.toExponential(u as number);
      expect(s).assertEqual('4.56e+1');
      let decB: Decimal = new Decimal(123);
      let v: ESObject = undefined;
      expect(decB.toExponential(v as number)).assertEqual('1.23e+2');
      let decC: Decimal = new Decimal(45.6);
      let vC: ESObject = undefined;
      let flag: boolean = false;
      if (flag) {
        vC = 2;
      } else {
        vC = undefined;
      }
      expect(decC.toExponential(vC as number)).assertEqual('4.56e+1');
      let decD: Decimal = new Decimal(45.6);
      let flagD: boolean = false;
      let vD: ESObject = flagD ? 2 : undefined;
      let sD: string = decD.toExponential(vD as number);
      expect(sD).assertEqual('4.56e+1');
      let decE: Decimal = new Decimal(123456789);
      let uE: ESObject = undefined;
      expect(decE.toExponential(uE as number)).assertEqual('1.23456789e+8');
      let decF: Decimal = new Decimal(0.00123);
      let uF: ESObject = undefined;
      expect(decF.toExponential(uF as number)).assertEqual('1.23e-3');
      let decG: Decimal = new Decimal(-45.6);
      let uG: ESObject = undefined;
      expect(decG.toExponential(uG as number)).assertEqual('-4.56e+1');
      let decH: Decimal = new Decimal(0);
      let uH: ESObject = undefined;
      expect(decH.toExponential(uH as number)).assertEqual('0e+0');
      let decI: Decimal = new Decimal(Number.MAX_SAFE_INTEGER);
      let uI: ESObject = undefined;
      expect(decI.toExponential(uI as number)).assertEqual('9.007199254740991e+15');
      let decJ: Decimal = new Decimal(1e21);
      let uJ: ESObject = undefined;
      expect(decJ.toExponential(uJ as number)).assertEqual('1e+21');
      Decimal.set({ rounding: Decimal.ROUND_DOWN });
      let decK: Decimal = new Decimal(45.6);
      let uK: ESObject = undefined;
      let sK: string = decK.toExponential(uK as number);
      expect(sK).assertEqual('4.56e+1');
      Decimal.set({ defaults: true });
      Decimal.set({ rounding: Decimal.ROUND_DOWN });
      let decL: Decimal = new Decimal(45.6);
      let uL: ESObject = undefined;
      let full: string = decL.toExponential(uL as number);
      let fixed: string = decL.toExponential(1);
      expect(full).assertEqual('4.56e+1');
      expect(fixed).assertEqual('4.5e+1');
      Decimal.set({ defaults: true });
    });

    /**
     * @tc.name testDecimalToExponentialPart02Test016
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_EXPONENTIAL_PART02_TEST_1600
     * @tc.desc Verify null, missing object/array property and optional property dispatch behavior
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalToExponentialPart02Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: Decimal = new Decimal(45.6);
      try {
        let n: ESObject = null;
        dec.toExponential(n as number);
        expect().assertFail();
      } catch (e) {
        let err: ESObject = e;
        expect(err.code !== undefined).assertTrue();
      }
      let decB: Decimal = new Decimal(45.6);
      let nB: ESObject = null;
      let uB: ESObject = undefined;
      let thrown: boolean = false;
      try {
        decB.toExponential(nB as number);
      } catch (e) {
        thrown = true;
      }
      expect(thrown).assertTrue();
      expect(decB.toExponential(uB as number)).assertEqual('4.56e+1');
      let decC: Decimal = new Decimal(45.6);
      let nC: ESObject = null;
      let thrownC: boolean = false;
      try {
        decC.toExponential(nC as number);
      } catch (e) {
        thrownC = true;
      }
      expect(thrownC).assertTrue();
      expect(decC.toExponential(0)).assertEqual('5e+1');
      let decD: Decimal = new Decimal(45.6);
      let vD: ESObject = null;
      let thrownD: boolean = false;
      try {
        decD.toExponential(vD as number);
      } catch (e) {
        thrownD = true;
      }
      expect(thrownD).assertTrue();
      let decE: Decimal = new Decimal(1e21);
      let nE: ESObject = null;
      let thrownE: boolean = false;
      try {
        decE.toExponential(nE as number);
      } catch (e) {
        thrownE = true;
      }
      expect(thrownE).assertTrue();
      let obj: Record<string, number> = {};
      let v: ESObject = obj['dp'];
      let decF: Decimal = new Decimal(45.6);
      expect(decF.toExponential(v as number)).assertEqual('4.56e+1');
      let arr: number[] = [1];
      let vA: ESObject = arr[5];
      let decG: Decimal = new Decimal(45.6);
      expect(decG.toExponential(vA as number)).assertEqual('4.56e+1');
      let objO: Opt = {};
      let decH: Decimal = new Decimal(45.6);
      expect(decH.toExponential(objO.dp as number)).assertEqual('4.56e+1');
      let omitted: Opt = {};
      let u: ESObject = undefined;
      let explicit: Opt = { dp: u as number };
      let decI: Decimal = new Decimal(45.6);
      expect(decI.toExponential(omitted.dp as number)).assertEqual('4.56e+1');
      expect(decI.toExponential(explicit.dp as number)).assertEqual('4.56e+1');
      expect(wrapDp()).assertEqual('4.56e+1');
      let src: Record<string, number> = {};
      let dp: number = 2;
      if (src['dp'] !== undefined) {
        dp = src['dp'];
      }
      let decJ: Decimal = new Decimal(45.6);
      expect(decJ.toExponential(dp)).assertEqual('4.56e+1');
      let uL: ESObject = undefined;
      let dpL: ESObject = uL || 3;
      let decL: Decimal = new Decimal(45.6);
      expect(decL.toExponential(dpL as number)).assertEqual('4.560e+1');
    });

    /**
     * @tc.name testDecimalToExponentialPart02Test028
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_EXPONENTIAL_PART02_TEST_2800
     * @tc.desc Verify type-error dp arguments throw weak assertion probe
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalToExponentialPart02Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let probeThrows = (val: ESObject): void => {
        let dec: Decimal = new Decimal(45.6);
        try {
          dec.toExponential(val as number);
          expect().assertFail();
        } catch (e) {
          let err: ESObject = e;
          expect(err.code !== undefined).assertTrue();
        }
      };
      probeThrows('');
      probeThrows('5');
      probeThrows(true);
      probeThrows(false);
      probeThrows([]);
      probeThrows({});
    });

    /**
     * @tc.name testDecimalToExponentialPart02Test035
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_EXPONENTIAL_PART02_TEST_3500
     * @tc.desc Verify configured DecimalConfig rounding modes apply to single-arg dp call
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalToExponentialPart02Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec45: Decimal = new Decimal(45.6);
      expect(dec45.toExponential(1)).assertEqual('4.6e+1');
      Decimal.set({ rounding: Decimal.ROUND_DOWN });
      let decD: Decimal = new Decimal(45.6);
      expect(decD.toExponential(1)).assertEqual('4.5e+1');
      Decimal.set({ defaults: true });
      Decimal.set({ rounding: Decimal.ROUND_UP });
      let decU: Decimal = new Decimal(2.5);
      expect(decU.toExponential(0)).assertEqual('3e+0');
      Decimal.set({ defaults: true });
      Decimal.set({ rounding: Decimal.ROUND_CEILING });
      let decC: Decimal = new Decimal(2.5);
      expect(decC.toExponential(0)).assertEqual('3e+0');
      Decimal.set({ defaults: true });
      Decimal.set({ rounding: Decimal.ROUND_FLOOR });
      let decF: Decimal = new Decimal(2.5);
      expect(decF.toExponential(0)).assertEqual('2e+0');
      Decimal.set({ defaults: true });
      Decimal.set({ rounding: Decimal.ROUND_HALF_DOWN });
      let decHd: Decimal = new Decimal(1.5);
      expect(decHd.toExponential(0)).assertEqual('1e+0');
      Decimal.set({ defaults: true });
      Decimal.set({ rounding: Decimal.ROUND_HALF_EVEN });
      let decHe: Decimal = new Decimal(2.5);
      expect(decHe.toExponential(0)).assertEqual('2e+0');
      Decimal.set({ defaults: true });
      Decimal.set({ rounding: Decimal.ROUND_HALF_CEILING });
      let decHc: Decimal = new Decimal(1.5);
      expect(decHc.toExponential(0)).assertEqual('2e+0');
      Decimal.set({ defaults: true });
      Decimal.set({ rounding: Decimal.ROUND_HALF_FLOOR });
      let decHf: Decimal = new Decimal(1.5);
      expect(decHf.toExponential(0)).assertEqual('1e+0');
      Decimal.set({ defaults: true });
      Decimal.set({ rounding: Decimal.ROUND_CEILING });
      let decNeg: Decimal = new Decimal(-1.5);
      expect(decNeg.toExponential(0)).assertEqual('-1e+0');
      Decimal.set({ defaults: true });
      Decimal.set({ rounding: Decimal.ROUND_FLOOR });
      let decNegB: Decimal = new Decimal(-1.5);
      expect(decNegB.toExponential(0)).assertEqual('-2e+0');
      Decimal.set({ defaults: true });
    });

    /**
     * @tc.name testDecimalToExponentialPart02Test046
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_EXPONENTIAL_PART02_TEST_4600
     * @tc.desc Verify config out-of-range rounding throws, defaults restore and return type is string
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalToExponentialPart02Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cfg1: ESObject = { rounding: 9 };
      try {
        Decimal.set(cfg1);
        expect().assertFail();
      } catch (e) {
        let err: ESObject = e;
        expect(err.code).assertEqual(10200001);
      }
      Decimal.set({ defaults: true });
      let cfg2: ESObject = { rounding: -1 };
      try {
        Decimal.set(cfg2);
        expect().assertFail();
      } catch (e) {
        let err: ESObject = e;
        expect(err.code).assertEqual(10200001);
      }
      Decimal.set({ defaults: true });
      let cfg3: ESObject = { rounding: 1.5 };
      try {
        Decimal.set(cfg3);
        expect().assertFail();
      } catch (e) {
        let err: ESObject = e;
        expect(err.code).assertEqual(10200001);
      }
      Decimal.set({ defaults: true });
      Decimal.set({ rounding: Decimal.ROUND_DOWN });
      Decimal.set({ defaults: true });
      let dec: Decimal = new Decimal(45.6);
      expect(dec.toExponential(1)).assertEqual('4.6e+1');
      let decB: Decimal = new Decimal(45.6);
      let s: string = decB.toExponential(2);
      expect(typeof s).assertEqual('string');
    });

    /**
     * @tc.name testDecimalToExponentialPart02Test051
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_EXPONENTIAL_PART02_TEST_5100
     * @tc.desc Verify dp on various values, instance integrity preserved and idempotency
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalToExponentialPart02Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Decimal(999999).toExponential(0)).assertEqual('1e+6');
      expect(new Decimal(45.6).toExponential(3)).assertEqual('4.560e+1');
      expect(new Decimal(45.6).toExponential(20)).assertEqual('4.56000000000000000000e+1');
      expect(new Decimal(123456789).toExponential(2)).assertEqual('1.23e+8');
      expect(new Decimal(0.00123).toExponential(2)).assertEqual('1.23e-3');
      expect(new Decimal(-45.6).toExponential(1)).assertEqual('-4.6e+1');
      expect(new Decimal(1e21).toExponential(0)).assertEqual('1e+21');
      expect(new Decimal(Number.MAX_VALUE).toExponential(5)).assertEqual('1.79769e+308');
      expect(new Decimal(5e-324).toExponential(3)).assertEqual('5.000e-324');
      expect(new Decimal(0).toExponential(0)).assertEqual('0e+0');
      expect(new Decimal(-0).toExponential(0)).assertEqual('0e+0');
      expect(new Decimal(1e-9).toExponential(0)).assertEqual('1e-9');
      let dec: Decimal = new Decimal(45.6);
      let before: string = dec.toString();
      dec.toExponential(2);
      expect(dec.toString()).assertEqual(before);
      let decB: Decimal = new Decimal(45.6);
      let a: string = decB.toExponential(3);
      let b: string = decB.toExponential(3);
      expect(a).assertEqual(b);
    });

    /**
     * @tc.name testDecimalToExponentialPart02Test065
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_EXPONENTIAL_PART02_TEST_6500
     * @tc.desc Verify negative, fraction, above-upper-bound, non-finite and MAX dp values throw 10200001
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalToExponentialPart02Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let probeThrows = (dp: ESObject): void => {
        let dec: Decimal = new Decimal(45.6);
        try {
          dec.toExponential(dp as number);
          expect().assertFail();
        } catch (e) {
          let err: ESObject = e;
          expect(err.code).assertEqual(10200001);
        }
      };
      probeThrows(-1);
      probeThrows(-0.5);
      probeThrows(1e9 + 1);
      probeThrows(1e15);
      probeThrows(Number.MAX_SAFE_INTEGER);
      probeThrows(9007199254740992);
      probeThrows(NaN);
      probeThrows(Infinity);
      probeThrows(-Infinity);
      probeThrows(1.5);
      probeThrows(Number.MAX_VALUE);
    });


    /**
     * @tc.name testDecimalToExponentialPart03Test001
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_EXPONENTIAL_PART03_TEST_0100
     * @tc.desc Verify cross-overload dispatch comparisons and undefined/string/number construction equivalence
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalToExponentialPart03Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal('123.456');
      let undef: ESObject = undefined;
      expect(d.toExponential()).assertEqual(d.toExponential(undef as number));
      expect(d.toExponential(3)).assertEqual(d.toExponential(3, Decimal.ROUND_HALF_UP));
      let decimal996: Decimal = new Decimal('9.996');
      expect(decimal996.toExponential(2)).assertEqual(decimal996.toExponential(2, Decimal.ROUND_HALF_UP));
      let decimal1235: Decimal = new Decimal('1.235');
      expect(decimal1235.toExponential(2, Decimal.ROUND_DOWN)).assertEqual('1.23e+0');
      expect(decimal1235.toExponential(2)).assertEqual('1.24e+0');
      expect(d.toExponential(0)).assertEqual('1e+2');
      expect(d.toExponential()).assertEqual('1.23456e+2');
      let decimal7: Decimal = new Decimal('7');
      expect(decimal7.toExponential()).assertEqual('7e+0');
      expect(decimal7.toExponential(1)).assertEqual('7.0e+0');
      expect(decimal7.toExponential(1, Decimal.ROUND_HALF_UP)).assertEqual('7.0e+0');
      let d1e21: Decimal = new Decimal(1e21);
      expect(d1e21.toExponential()).assertEqual('1e+21');
      expect(d1e21.toExponential(2)).assertEqual('1.00e+21');
      let d1eN21: Decimal = new Decimal('1e-21');
      expect(d1eN21.toExponential()).assertEqual('1e-21');
      expect(d1eN21.toExponential(2)).assertEqual('1.00e-21');
      let decimal0: Decimal = new Decimal(0);
      expect(decimal0.toExponential()).assertEqual('0e+0');
      expect(decimal0.toExponential(2)).assertEqual('0.00e+0');
      expect(decimal0.toExponential(2, Decimal.ROUND_HALF_UP)).assertEqual('0.00e+0');
      let dNeg: Decimal = new Decimal('-123.456');
      expect(dNeg.toExponential().charAt(0)).assertEqual('-');
      expect(dNeg.toExponential(2).charAt(0)).assertEqual('-');
      expect(dNeg.toExponential(2, Decimal.ROUND_HALF_UP).charAt(0)).assertEqual('-');
      expect(d.toExponential(5)).assertEqual(d.toExponential());
      expect(d.toExponential(10, Decimal.ROUND_DOWN)).assertEqual('1.2345600000e+2');
      let a: Decimal = new Decimal('123.456');
      let b: Decimal = new Decimal(123.456);
      expect(a.toExponential(3)).assertEqual(b.toExponential(3));
      expect(a.toExponential(3, Decimal.ROUND_DOWN)).assertEqual(b.toExponential(3, Decimal.ROUND_DOWN));
    });

    /**
     * @tc.name testDecimalToExponentialPart03Test014
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_EXPONENTIAL_PART03_TEST_1400
     * @tc.desc Verify dp boundary, precision, default rounding direction and global config effects
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalToExponentialPart03Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal('123.45');
      expect(d.toExponential(-0)).assertEqual('1e+2');
      let dNp: Decimal = new Decimal('123.45');
      try {
        dNp.toExponential(2.5);
        expect().assertFail();
      } catch (e) {
        let err: ESObject = e;
        expect(err.code).assertEqual(10200001);
      }
      expect(new Decimal('123456789012345678901234567890').toExponential()).assertEqual(
        '1.2345678901234567890123456789e+29',
      );
      let dB: Decimal = new Decimal('123.456');
      expect(dB.toExponential()).assertEqual('1.23456e+2');
      expect(dB.toExponential(2)).assertEqual('1.23e+2');
      let dC: Decimal = new Decimal('1.235');
      expect(dC.toExponential(2)).assertEqual(dC.toExponential(2, Decimal.ROUND_HALF_UP));
      let dU: Decimal = new Decimal('1.235');
      let undef: ESObject = undefined;
      expect(dU.toExponential(2, undef as Rounding)).assertEqual(dU.toExponential(2));
      let dNeg: Decimal = new Decimal('-1.235');
      expect(dNeg.toExponential(2)).assertEqual('-1.24e+0');
      expect(new Decimal('-1.235').toExponential(2, Decimal.ROUND_DOWN)).assertEqual('-1.23e+0');
      expect(new Decimal('-1.235').toExponential(2, Decimal.ROUND_CEILING)).assertEqual('-1.23e+0');
      expect(new Decimal('-1.235').toExponential(2, Decimal.ROUND_FLOOR)).assertEqual('-1.24e+0');
      Decimal.set({ precision: 4 });
      let dCfg: Decimal = new Decimal('123.456');
      expect(dCfg.toExponential()).assertEqual('1.23456e+2');
      expect(dCfg.toExponential(2)).assertEqual('1.23e+2');
      Decimal.set({ defaults: true });
      Decimal.set({ rounding: Decimal.ROUND_DOWN });
      let dRd: Decimal = new Decimal('1.235');
      expect(dRd.toExponential(2)).assertEqual('1.23e+0');
      expect(dRd.toExponential(2, Decimal.ROUND_HALF_UP)).assertEqual('1.24e+0');
      Decimal.set({ defaults: true });
      let dRest: Decimal = new Decimal('1.235');
      Decimal.set({ rounding: Decimal.ROUND_DOWN });
      expect(dRest.toExponential(2)).assertEqual('1.23e+0');
      Decimal.set({ defaults: true });
      expect(dRest.toExponential(2)).assertEqual('1.24e+0');
    });

    /**
     * @tc.name testDecimalToExponentialPart03Test027
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_EXPONENTIAL_PART03_TEST_2700
     * @tc.desc Verify instance integrity preserved after dp out-of-range throw and isolation across instances
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalToExponentialPart03Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal('123.45');
      try {
        d.toExponential(2000000000);
        expect().assertFail();
      } catch (e) {
        let err: ESObject = e;
        expect(err.code).assertEqual(10200001);
      }
      expect(d.toString()).assertEqual('123.45');
      let dS: Decimal = new Decimal('-123.45');
      let s0: number = dS.s;
      try {
        dS.toExponential(-5);
        expect().assertFail();
      } catch (e) {
        let err: ESObject = e;
        expect(err.code).assertEqual(10200001);
      }
      expect(dS.s).assertEqual(s0);
      let dE: Decimal = new Decimal('123.45');
      let e0: number = dE.e;
      try {
        dE.toExponential(-1);
        expect().assertFail();
      } catch (e) {
        let err: ESObject = e;
        expect(err.code).assertEqual(10200001);
      }
      expect(dE.e).assertEqual(e0);
      let dD: Decimal = new Decimal('123.45');
      let ref: number[] = dD.d;
      try {
        dD.toExponential(2000000000);
        expect().assertFail();
      } catch (e) {
        let err: ESObject = e;
        expect(err.code).assertEqual(10200001);
      }
      expect(dD.d === ref).assertTrue();
      let dNoArg: Decimal = new Decimal('123.45');
      try {
        dNoArg.toExponential(-1);
        expect().assertFail();
      } catch (e) {
        let err: ESObject = e;
        expect(err.code).assertEqual(10200001);
      }
      expect(dNoArg.toExponential()).assertEqual('1.2345e+2');
      let dOne: Decimal = new Decimal('123.45');
      try {
        dOne.toExponential(-1);
        expect().assertFail();
      } catch (e) {
        let err: ESObject = e;
        expect(err.code).assertEqual(10200001);
      }
      expect(dOne.toExponential(2)).assertEqual('1.23e+2');
      let dArith: Decimal = new Decimal('10');
      let rm: ESObject = Decimal.ROUND_HALF_FLOOR + 1;
      try {
        dArith.toExponential(2, rm as Rounding);
        expect().assertFail();
      } catch (e) {
        let err: ESObject = e;
        expect(err.code).assertEqual(10200001);
      }
      expect(dArith.add(5).toString()).assertEqual('15');
      let a: Decimal = new Decimal('10');
      let b: Decimal = new Decimal('20');
      let rmB: ESObject = Decimal.ROUND_HALF_FLOOR + 1;
      try {
        a.toExponential(2, rmB as Rounding);
        expect().assertFail();
      } catch (e) {
        let err: ESObject = e;
        expect(err.code).assertEqual(10200001);
      }
      expect(b.toExponential(2)).assertEqual('2.00e+1');
      let dMix: Decimal = new Decimal('9.996');
      expect(dMix.toExponential(2)).assertEqual('1.00e+1');
      try {
        dMix.toExponential(-1);
        expect().assertFail();
      } catch (e) {
        let err: ESObject = e;
        expect(err.code).assertEqual(10200001);
      }
      expect(dMix.toString()).assertEqual('9.996');
      let dCatch: Decimal = new Decimal('123.45');
      let caught: boolean = false;
      try {
        dCatch.toExponential(1000000001);
        expect().assertFail();
      } catch (e) {
        let err: ESObject = e;
        expect(err.code).assertEqual(10200001);
        caught = true;
      }
      expect(caught).assertTrue();
      expect(dCatch.toExponential(1)).assertEqual('1.2e+2');
    });

    /**
     * @tc.name testDecimalToExponentialPart03Test037
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_EXPONENTIAL_PART03_TEST_3700
     * @tc.desc Verify out-of-range dp and rounding values throw 10200001
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalToExponentialPart03Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal('123.45');
      try {
        d.toExponential(-1);
        expect().assertFail();
      } catch (e) {
        let err: ESObject = e;
        expect(err.code).assertEqual(10200001);
      }
      let dB: Decimal = new Decimal('123.45');
      try {
        dB.toExponential(1000000001);
        expect().assertFail();
      } catch (e) {
        let err: ESObject = e;
        expect(err.code).assertEqual(10200001);
      }
      let dC: Decimal = new Decimal('123.45');
      let rm: ESObject = Decimal.ROUND_HALF_FLOOR + 1;
      try {
        dC.toExponential(2, rm as Rounding);
        expect().assertFail();
      } catch (e) {
        let err: ESObject = e;
        expect(err.code).assertEqual(10200001);
      }
      let dD: Decimal = new Decimal('123.45');
      let rmD: ESObject = Decimal.ROUND_UP - 1;
      try {
        dD.toExponential(2, rmD as Rounding);
        expect().assertFail();
      } catch (e) {
        let err: ESObject = e;
        expect(err.code).assertEqual(10200001);
      }
    });

    /**
     * @tc.name testDecimalToExponentialPart03Test041
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_EXPONENTIAL_PART03_TEST_4100
     * @tc.desc Verify return type, separator position, fraction digit count, roundtrip and instance state
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalToExponentialPart03Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal('123.45');
      expect(typeof d.toExponential()).assertEqual('string');
      expect(typeof d.toExponential(2)).assertEqual('string');
      expect(typeof d.toExponential(2, Decimal.ROUND_HALF_UP)).assertEqual('string');
      expect(d.toExponential(2).indexOf('e')).assertEqual(4);
      expect(d.toExponential().charAt(0)).assertEqual('1');
      let dFrac: Decimal = new Decimal('123.456');
      let s: string = dFrac.toExponential(3);
      let dot: number = s.indexOf('.');
      let ePos: number = s.indexOf('e');
      expect(ePos - dot - 1).assertEqual(3);
      let sDown: string = dFrac.toExponential(3, Decimal.ROUND_DOWN);
      expect(sDown).assertEqual('1.234e+2');
      let dotD: number = sDown.indexOf('.');
      let ePosD: number = sDown.indexOf('e');
      expect(ePosD - dotD - 1).assertEqual(3);
      let sNoArg: string = dFrac.toExponential();
      let digits: string = sNoArg.substring(sNoArg.indexOf('.') + 1, sNoArg.indexOf('e'));
      expect(digits.length + 1).assertEqual(6);
      expect(dFrac.d.length).assertEqual(2);
      let dRt: Decimal = new Decimal('123.456');
      let back: Decimal = new Decimal(dRt.toExponential(6));
      expect(back.equals(dRt)).assertTrue();
      let dArr: Decimal = new Decimal('123.456');
      let ref: number[] = dArr.d.slice();
      dArr.toExponential();
      dArr.toExponential(2);
      dArr.toExponential(2, Decimal.ROUND_DOWN);
      let same: boolean = true;
      for (let i: number = 0; i < ref.length; i++) {
        if (dArr.d[i] !== ref[i]) {
          same = false;
        }
      }
      expect(same).assertTrue();
      let dE: Decimal = new Decimal('123.456');
      let e0: number = dE.e;
      dE.toExponential(1);
      dE.toExponential(3, Decimal.ROUND_DOWN);
      expect(dE.e).assertEqual(e0);
      let dS: Decimal = new Decimal('-123.456');
      let s0: number = dS.s;
      dS.toExponential(1);
      dS.toExponential(3, Decimal.ROUND_DOWN);
      expect(dS.s).assertEqual(s0);
      let dExp: Decimal = new Decimal('123.456');
      let sExp: string = dExp.toExponential();
      let ePosExp: number = sExp.indexOf('e');
      expect(parseInt(sExp.substring(ePosExp + 1), 10)).assertEqual(dExp.e);
    });

    /**
     * @tc.name testDecimalToExponentialPart03Test052
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_EXPONENTIAL_PART03_TEST_5200
     * @tc.desc Verify -0 sign, distinct instances, sources, config shared, idempotency and precision snapshot
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalToExponentialPart03Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Decimal(-0).toExponential()).assertEqual('0e+0');
      let pos: Decimal = new Decimal('123.45');
      let neg: Decimal = new Decimal('-123.45');
      expect(pos.toExponential(2).charAt(0)).assertEqual('1');
      expect(neg.toExponential(2).charAt(0)).assertEqual('-');
      let dLen: Decimal = new Decimal('123.45');
      let l0: number = dLen.toExponential(0).length;
      let l1: number = dLen.toExponential(1).length;
      let l2: number = dLen.toExponential(2).length;
      expect(l1 > l0).assertTrue();
      expect(l2 > l1).assertTrue();
      let a: Decimal = new Decimal('9.996');
      let b: Decimal = new Decimal('9.996');
      expect(a.toExponential()).assertEqual(b.toExponential());
      expect(a.toExponential(2)).assertEqual(b.toExponential(2));
      expect(a.toExponential(2, Decimal.ROUND_DOWN)).assertEqual(b.toExponential(2, Decimal.ROUND_DOWN));
      let strDec: Decimal = new Decimal('123.456');
      let numDec: Decimal = new Decimal(123.456);
      expect(strDec.toExponential()).assertEqual(numDec.toExponential());
      let dRt: Decimal = new Decimal('123.456');
      expect(new Decimal(dRt.toExponential()).equals(dRt)).assertTrue();
      Decimal.set({ precision: 4 });
      let aP: Decimal = new Decimal('123.456');
      Decimal.set({ precision: 9 });
      let bP: Decimal = new Decimal('123.456');
      expect(aP.toExponential()).assertEqual('1.23456e+2');
      expect(bP.toExponential()).assertEqual('1.23456e+2');
      Decimal.set({ defaults: true });
      Decimal.set({ rounding: Decimal.ROUND_DOWN });
      let aR: Decimal = new Decimal('1.235');
      let bR: Decimal = new Decimal('1.235');
      expect(aR.toExponential(2)).assertEqual('1.23e+0');
      expect(bR.toExponential(2)).assertEqual('1.23e+0');
      Decimal.set({ defaults: true });
      let dRest: Decimal = new Decimal('1.235');
      expect(dRest.toExponential(2)).assertEqual('1.24e+0');
      Decimal.set({ rounding: Decimal.ROUND_DOWN });
      expect(dRest.toExponential(2)).assertEqual('1.23e+0');
      Decimal.set({ defaults: true });
      expect(dRest.toExponential(2)).assertEqual('1.24e+0');
      let aD: Decimal = new Decimal('123.456');
      let bD: Decimal = new Decimal('123.456');
      expect(aD.d !== bD.d).assertTrue();
      expect(aD.toExponential(3)).assertEqual(bD.toExponential(3));
      let aSum: Decimal = new Decimal('1.235');
      let bSum: Decimal = new Decimal('1.235');
      let sum: Decimal = aSum.add(1);
      expect(bSum.toExponential(2)).assertEqual('1.24e+0');
      expect(sum.toExponential(2)).assertEqual('2.24e+0');
      let dStable: Decimal = new Decimal('9.996');
      let r1: string = dStable.toExponential(2);
      let r2: string = dStable.toExponential(2);
      let r3: string = dStable.toExponential(2, Decimal.ROUND_HALF_UP);
      expect(r1).assertEqual(r2);
      expect(r2).assertEqual(r3);
      Decimal.set({ precision: 4 });
      let aSnap: Decimal = new Decimal('123.456');
      expect(aSnap.toExponential()).assertEqual('1.23456e+2');
      Decimal.set({ precision: 9 });
      expect(aSnap.toExponential()).assertEqual('1.23456e+2');
      Decimal.set({ defaults: true });
    });

    /**
     * @tc.name testDecimalToExponentialPart03Test065
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_EXPONENTIAL_PART03_TEST_6500
     * @tc.desc Verify rounding constants values, literal equivalence, enum value 9 throws, reverse mapping and type
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalToExponentialPart03Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Decimal.ROUND_UP).assertEqual(0);
      expect(Decimal.ROUND_HALF_UP).assertEqual(4);
      expect(Decimal.ROUND_HALF_FLOOR).assertEqual(8);
      let d: Decimal = new Decimal('1.235');
      expect(d.toExponential(2, Decimal.ROUND_UP)).assertEqual(d.toExponential(2, 0));
      expect(d.toExponential(2, Decimal.ROUND_DOWN)).assertEqual(d.toExponential(2, 1));
      let dInv: Decimal = new Decimal('1.235');
      let rm: ESObject = Decimal.ROUND_HALF_FLOOR + 1;
      try {
        dInv.toExponential(2, rm as Rounding);
        expect().assertFail();
      } catch (e) {
        let err: ESObject = e;
        expect(err.code).assertEqual(10200001);
      }
      let obj: ESObject = Decimal;
      expect(obj[obj.ROUND_UP]).assertUndefined();
      expect(typeof Decimal.ROUND_UP).assertEqual('number');
    });

    /**
     * @tc.name testDecimalToExponentialPart03Test073
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_EXPONENTIAL_PART03_TEST_7300
     * @tc.desc Verify rounding mode differences, dp variation, boundary combinations and double-invalid throws
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalToExponentialPart03Test073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal('1.235');
      expect(d.toExponential(2, Decimal.ROUND_HALF_CEILING)).assertEqual('1.24e+0');
      expect(d.toExponential(2, Decimal.ROUND_HALF_FLOOR)).assertEqual('1.23e+0');
      expect(d.toExponential(2, Decimal.ROUND_HALF_UP)).assertEqual('1.24e+0');
      expect(d.toExponential(2, Decimal.ROUND_DOWN)).assertEqual('1.23e+0');
      expect(d.toExponential(2, Decimal.ROUND_DOWN)).assertEqual('1.23e+0');
      expect(d.toExponential(3, Decimal.ROUND_DOWN)).assertEqual('1.235e+0');
      expect(new Decimal('123.45').toExponential(0, Decimal.ROUND_HALF_UP)).assertEqual('1e+2');
      let decimal15: Decimal = new Decimal('1.5');
      expect(decimal15.toExponential(0, Decimal.ROUND_HALF_FLOOR)).assertEqual('1e+0');
      expect(decimal15.toExponential(0, Decimal.ROUND_HALF_UP)).assertEqual('2e+0');
      let dLarge: Decimal = new Decimal('123.456');
      expect(dLarge.toExponential(10, Decimal.ROUND_UP)).assertEqual('1.2345600000e+2');
      let dBad: Decimal = new Decimal('1.235');
      let badRm: ESObject = 9;
      try {
        dBad.toExponential(-1, badRm as Rounding);
        expect().assertFail();
      } catch (e) {
        let err: ESObject = e;
        expect(err.code).assertEqual(10200001);
      }
      let dMulti: Decimal = new Decimal('123.456');
      let s: string = dMulti.toExponential(6, Decimal.ROUND_HALF_UP);
      expect(typeof s).assertEqual('string');
      expect(new Decimal(s).equals(dMulti)).assertTrue();
    });
  });
}
