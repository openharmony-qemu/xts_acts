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

function toOctalUnsafe(d: Decimal, a: ESObject, b: ESObject): string {
  let obj: ESObject = d;
  return obj.toOctal(a, b) as string;
}

type Rounding = 0 | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8;

export default function DecimalToOctalTest(): void {
  describe('DecimalToOctalTest', () => {
    beforeAll(() => {
    });
    beforeEach(async () => {
      await common.sleep(common.DEFAULT_SLEEP_MS);
    });
    afterEach(() => { common.resetDecimalConfig(Decimal); });
    afterAll(() => {
    });


    /**
     * @tc.name testDecimalToOctalPart01Test001
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART01_TEST_0100
     * @tc.desc Verify basic zero-arg toOctal conversions for integers fractions and mixed values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalToOctalPart01Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec1: Decimal = new Decimal(256);
      let out1: string = dec1.toOctal();
      expect(typeof out1).assertEqual('string');
      let dec2: Decimal = new Decimal(256);
      expect(toOctalUnsafe(dec2, 3, Decimal.ROUND_HALF_UP)).assertEqual('0o1p+8');
      let out3: string = new Decimal(256).toOctal();
      expect(out3).assertEqual('0o400');
      expect(new Decimal(0).toOctal()).assertEqual('0o0');
      expect(new Decimal(1).toOctal()).assertEqual('0o1');
      expect(new Decimal(7).toOctal()).assertEqual('0o7');
      expect(new Decimal(8).toOctal()).assertEqual('0o10');
      expect(new Decimal(255).toOctal()).assertEqual('0o377');
      expect(new Decimal(-256).toOctal()).assertEqual('-0o400');
      expect(new Decimal(-8).toOctal()).assertEqual('-0o10');
      expect(new Decimal(0.5).toOctal()).assertEqual('0o0.4');
      expect(new Decimal(0.125).toOctal()).assertEqual('0o0.1');
      expect(new Decimal(255.5).toOctal()).assertEqual('0o377.4');
    });

    /**
     * @tc.name testDecimalToOctalPart01Test011
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART01_TEST_1100
     * @tc.desc Verify binary finite fractions repeating expansion scientific and large integer conversions
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalToOctalPart01Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Decimal(0.0078125).toOctal()).assertEqual('0o0.004');
      expect(new Decimal(0.00390625).toOctal()).assertEqual('0o0.002');
      expect(new Decimal(0.1).toOctal()).assertEqual('0o0.063146314631463146315');
      expect(new Decimal(1e-7).toOctal()).assertEqual('0o0.000000015327745152745364413');
      expect(new Decimal(123.456).toOctal()).assertEqual('0o173.35136152375747331');
      expect(new Decimal(1e9).toOctal()).assertEqual('0o7346545000');
      expect(new Decimal(1e18).toOctal()).assertEqual('0o67405553164731000000');
      let big18: string = new Decimal('123456789012345678901234567890').toOctal();
      expect(big18.startsWith('0o1')).assertTrue();
      expect(big18.length).assertEqual(35);
      expect(new Decimal(Number.MAX_SAFE_INTEGER).toOctal()).assertEqual('0o377777777777777777');
      expect(new Decimal(Number.MIN_SAFE_INTEGER).toOctal()).assertEqual('-0o377777777777777777');
    });

    /**
     * @tc.name testDecimalToOctalPart01Test021
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART01_TEST_2100
     * @tc.desc Verify boundary values MAX_VALUE MIN_VALUE EPSILON NaN Infinity negative zero and string input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalToOctalPart01Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let out21: string = new Decimal(Number.MAX_VALUE).toOctal();
      expect(out21.startsWith('0o177777777777777777')).assertTrue();
      expect(out21.length).assertEqual(344);
      let out22: string = new Decimal(Number.MIN_VALUE).toOctal();
      expect(out22.startsWith('0o0.000000000000')).assertTrue();
      expect(out22.length).assertEqual(381);
      expect(new Decimal(Number.EPSILON).toOctal()).assertEqual('0o0.0000000000000000037777777777777777753');
      expect(new Decimal(NaN).toOctal()).assertEqual('NaN');
      expect(new Decimal(Infinity).toOctal()).assertEqual('Infinity');
      expect(new Decimal(-Infinity).toOctal()).assertEqual('-Infinity');
      let dec27: Decimal = new Decimal(-0);
      expect(dec27.isNegative()).assertTrue();
      expect(dec27.toOctal()).assertEqual('-0o0');
      let dec28: Decimal = new Decimal(0);
      expect(dec28.isNegative()).assertFalse();
      expect(dec28.toOctal()).assertEqual('0o0');
      expect(new Decimal('100').toOctal()).assertEqual('0o144');
      let computed30: Decimal = new Decimal(8).mul(8);
      expect(computed30.toOctal()).assertEqual('0o100');
      let dec31: Decimal = new Decimal(255.5);
      expect(dec31.toOctal()).assertEqual('0o377.4');
      expect(dec31.toOctal()).assertEqual('0o377.4');
      expect(dec31.toFixed()).assertEqual('255.5');
    });

    /**
     * @tc.name testDecimalToOctalPart01Test032
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART01_TEST_3200
     * @tc.desc Verify global config effects on zero-arg and two-arg toOctal calls
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalToOctalPart01Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ rounding: Decimal.ROUND_DOWN });
      try {
        expect(new Decimal(255.5).toOctal()).assertEqual('0o377.4');
      } finally {
        Decimal.set({ rounding: Decimal.ROUND_HALF_UP });
      }
      Decimal.set({ precision: 6 });
      try {
        expect(new Decimal(0.1).toOctal()).assertEqual('0o0.0631463');
      } finally {
        Decimal.set({ precision: 20 });
      }
      Decimal.set({ precision: 2 });
      try {
        expect(new Decimal(0.1).toOctal()).assertEqual('0o0.063');
      } finally {
        Decimal.set({ precision: 20 });
      }
      expect(new Decimal(0.1).toOctal()).assertEqual('0o0.063146314631463146315');
      let out35: string = new Decimal(255.5).toOctal(2, Decimal.ROUND_HALF_UP);
      expect(out35).assertEqual('0o1p+8');
      let rm36: ESObject = undefined;
      let out36: string = new Decimal(255.5).toOctal(2, rm36 as Rounding);
      expect(out36).assertEqual('0o1p+8');
    });

    /**
     * @tc.name testDecimalToOctalPart01Test037
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART01_TEST_3700
     * @tc.desc Verify sd variations on integers and fractions producing positive exponent form
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalToOctalPart01Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let out37: string = new Decimal(256).toOctal(1, Decimal.ROUND_HALF_UP);
      expect(out37).assertEqual('0o1p+8');
      let out38: string = new Decimal(256).toOctal(2, Decimal.ROUND_HALF_UP);
      expect(out38).assertEqual('0o1p+8');
      expect(new Decimal(10).toOctal(1, Decimal.ROUND_HALF_UP)).assertEqual('0o1p+3');
      expect(new Decimal(10).toOctal(2, Decimal.ROUND_HALF_UP)).assertEqual('0o1.2p+3');
      expect(new Decimal(1e9).toOctal(1, Decimal.ROUND_HALF_UP)).assertEqual('0o1p+30');
      expect(new Decimal(123.456).toOctal(3, Decimal.ROUND_HALF_UP)).assertEqual('0o1.73p+6');
      expect(new Decimal(123.456).toOctal(20, Decimal.ROUND_HALF_UP)).assertEqual('0o1.7335136152375747331p+6');
      expect(new Decimal(0.5).toOctal(1, Decimal.ROUND_HALF_UP)).assertEqual('0o1p-1');
      expect(new Decimal(0.5).toOctal(2, Decimal.ROUND_HALF_UP)).assertEqual('0o1p-1');
      expect(new Decimal(0.25).toOctal(2, Decimal.ROUND_HALF_UP)).assertEqual('0o1p-2');
    });

    /**
     * @tc.name testDecimalToOctalPart01Test047
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART01_TEST_4700
     * @tc.desc Verify sd on binary finite fractions large values negative zero and bounds
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalToOctalPart01Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Decimal(0.0078125).toOctal(2, Decimal.ROUND_HALF_UP)).assertEqual('0o1p-7');
      expect(new Decimal(0.125).toOctal(3, Decimal.ROUND_HALF_UP)).assertEqual('0o1p-3');
      expect(new Decimal(0.0000152587890625).toOctal(4, Decimal.ROUND_HALF_UP)).assertEqual('0o1p-16');
      expect(new Decimal(4294967296).toOctal(3, Decimal.ROUND_HALF_UP)).assertEqual('0o1p+32');
      expect(new Decimal(Number.MAX_SAFE_INTEGER).toOctal(1, Decimal.ROUND_HALF_UP)).assertEqual('0o1p+53');
      expect(new Decimal(Number.MAX_SAFE_INTEGER).toOctal(20, Decimal.ROUND_HALF_UP)).assertEqual('0o1.777777777777777774p+52');
      expect(new Decimal(-12).toOctal(1, Decimal.ROUND_HALF_UP)).assertEqual('-0o1p+4');
      expect(new Decimal(-0.00390625).toOctal(2, Decimal.ROUND_HALF_UP)).assertEqual('-0o1p-8');
      expect(new Decimal(0).toOctal(3, Decimal.ROUND_HALF_UP)).assertEqual('0o0p+0');
      let dec56: Decimal = new Decimal(-0);
      expect(dec56.toOctal(3, Decimal.ROUND_HALF_UP)).assertEqual('-0o0p+0');
      expect(new Decimal(5).toOctal(100000, Decimal.ROUND_HALF_UP)).assertEqual('0o1.2p+2');
      expect(new Decimal(1).toOctal(1, Decimal.ROUND_HALF_UP)).assertEqual('0o1p+0');
    });

    /**
     * @tc.name testDecimalToOctalPart01Test059
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART01_TEST_5900
     * @tc.desc Verify sd and rounding out of range and invalid types throw 10200001
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalToOctalPart01Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sdInvalid: ESObject[] = [0, -1, 1e9 + 1, 1.5, NaN, Infinity, null];
      for (let i: number = 0; i < sdInvalid.length; i++) {
        try {
          let sd: ESObject = sdInvalid[i];
          new Decimal(5).toOctal(sd as number, Decimal.ROUND_HALF_UP);
          expect().assertFail();
        } catch (e) {
          let err: ESObject = e;
          expect(err.code).assertEqual(10200001);
        }
      }
      let rmInvalid: ESObject[] = [9, -1, NaN, 2.5, null];
      for (let i: number = 0; i < rmInvalid.length; i++) {
        try {
          let rm: ESObject = rmInvalid[i];
          new Decimal(5).toOctal(3, rm as Rounding);
          expect().assertFail();
        } catch (e) {
          let err: ESObject = e;
          expect(err.code).assertEqual(10200001);
        }
      }
    });

    /**
     * @tc.name testDecimalToOctalPart01Test066
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART01_TEST_6600
     * @tc.desc Verify all 9 rounding modes and negative ties with explicit rounding
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalToOctalPart01Test066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Decimal(255.5).toOctal(1, 0)).assertEqual('0o1p+8');
      expect(new Decimal(255.5).toOctal(1, 1)).assertEqual('0o1p+7');
      expect(new Decimal(255.5).toOctal(1, 2)).assertEqual('0o1p+8');
      expect(new Decimal(255.5).toOctal(1, 3)).assertEqual('0o1p+7');
      expect(new Decimal(1.5).toOctal(1, 4)).assertEqual('0o1p+1');
      expect(new Decimal(1.5).toOctal(1, 5)).assertEqual('0o1p+0');
      expect(new Decimal(1.5).toOctal(1, 6)).assertEqual('0o1p+1');
      expect(new Decimal(1.5).toOctal(1, 7)).assertEqual('0o1p+1');
      expect(new Decimal(1.5).toOctal(1, 8)).assertEqual('0o1p+0');
      expect(new Decimal(-1.5).toOctal(1, 4)).assertEqual('-0o1p+1');
      expect(new Decimal(-1.5).toOctal(1, 6)).assertEqual('-0o1p+1');
      expect(new Decimal(-1.5).toOctal(1, 3)).assertEqual('-0o1p+1');
    });

    /**
     * @tc.name testDecimalToOctalPart01Test078
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART01_TEST_7800
     * @tc.desc Verify truncation explicit rounding override and two-arg result properties format and receiver
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalToOctalPart01Test078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Decimal(255.5).toOctal(2, 1)).assertEqual('0o1.7p+7');
      Decimal.set({ rounding: Decimal.ROUND_DOWN });
      try {
        expect(new Decimal(255.5).toOctal(2, 4)).assertEqual('0o1p+8');
      } finally {
        Decimal.set({ rounding: Decimal.ROUND_HALF_UP });
      }
      expect(new Decimal(1e-7).toOctal(3, 0)).assertEqual('0o1.54p-24');
      let out86: string = new Decimal(100).toOctal(2, Decimal.ROUND_HALF_UP);
      expect(typeof out86).assertEqual('string');
      expect(out86.startsWith('0o')).assertTrue();
      let out87: string = new Decimal(1e9).toOctal(2, Decimal.ROUND_HALF_UP);
      expect(out87).assertEqual('0o1.7p+29');
      expect(new Decimal(100).toOctal(1, Decimal.ROUND_HALF_UP)).assertEqual('0o1p+7');
      expect(new Decimal(256).toOctal(1, Decimal.ROUND_HALF_UP)).assertEqual('0o1p+8');
      expect(new Decimal(0.5).toOctal(1, Decimal.ROUND_HALF_UP)).assertEqual('0o1p-1');
      let out90: string = new Decimal(1e-7).toOctal(3, Decimal.ROUND_HALF_UP);
      expect(out90).assertEqual('0o1.53p-24');
      let out91: string = new Decimal(255.5).toOctal(20, Decimal.ROUND_DOWN);
      expect(out91).assertEqual('0o1.776p+7');
      let frac91: string = out91.substring(2, out91.indexOf('p'));
      let valid91: boolean = /^[0-7.]+$/.test(frac91);
      expect(valid91).assertTrue();
      expect(new Decimal(255.5).toOctal(20, Decimal.ROUND_HALF_UP)).assertEqual('0o1.776p+7');
      expect(new Decimal(0.1).toOctal(5, Decimal.ROUND_HALF_UP)).assertEqual('0o1.4632p-4');
      let dec94: Decimal = new Decimal(255.5);
      dec94.toOctal(2, Decimal.ROUND_DOWN);
      expect(dec94.toOctal()).assertEqual('0o377.4');
      expect(new Decimal(255).toOctal()).assertEqual('0o377');
      expect(new Decimal(255.5).toOctal(2, 4)).assertEqual('0o1p+8');
    });


    /**
     * @tc.name testDecimalToOctalPart02Test001
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART02_TEST_0100
     * @tc.desc Verify single sd argument conversions for integers and fractions
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalToOctalPart02Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d1: Decimal = new Decimal(256);
      let r1: string = d1.toOctal(1);
      expect(r1.startsWith('0o')).assertTrue();
      expect(r1.length > 2).assertTrue();
      let d2: Decimal = new Decimal(256);
      let r2: string = d2.toOctal(3);
      expect(r2).assertEqual('0o1p+8');
      let d3: Decimal = new Decimal(0.5);
      let r3: string = d3.toOctal(1);
      expect(r3.startsWith('0o1p-')).assertTrue();
      let d4: Decimal = new Decimal(256);
      let errCode4: number = -1;
      try {
        d4.toOctal(0);
      } catch (e) {
        errCode4 = (e as ESObject).code;
      }
      expect(errCode4).assertEqual(10200001);
      let d5: Decimal = new Decimal(255);
      let r5: string = d5.toOctal(3);
      expect(r5).assertEqual('0o1p+8');
      let d6: Decimal = new Decimal(7);
      let r6: string = d6.toOctal(2);
      expect(r6).assertEqual('0o1.6p+2');
      let d7: Decimal = new Decimal(-0.5);
      let r7: string = d7.toOctal(1);
      expect(r7.startsWith('-0o')).assertTrue();
      let d8: Decimal = new Decimal(16);
      let r8: string = d8.toOctal(3);
      expect(r8).assertEqual('0o1p+4');
      let d9: Decimal = new Decimal(65535);
      let r9: string = d9.toOctal(6);
      expect(r9).assertEqual('0o1.77777p+15');
    });

    /**
     * @tc.name testDecimalToOctalPart02Test010
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART02_TEST_1000
     * @tc.desc Verify explicit undefined and null significantDigits handling and error paths
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalToOctalPart02Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d10: Decimal = new Decimal(256);
      let u10: ESObject = undefined;
      let r10: string = d10.toOctal(u10 as number);
      expect(r10).assertEqual('0o400');
      let d11: Decimal = new Decimal(256);
      try {
        let nl: ESObject = null;
        d11.toOctal(nl as number);
        expect().assertFail();
      } catch (e) {
        expect(e === null).assertFalse();
      }
      let d12: Decimal = new Decimal(256);
      let noArg12: string = d12.toOctal();
      expect(noArg12).assertEqual('0o400');
      let u12: ESObject = undefined;
      let rUndef12: string = d12.toOctal(u12 as number);
      expect(rUndef12).assertEqual(noArg12);
      let d13: Decimal = new Decimal(256);
      let errNull13: boolean = false;
      let errUndef13: boolean = false;
      try {
        let nl: ESObject = null;
        d13.toOctal(nl as number);
      } catch (e) {
        errNull13 = true;
      }
      try {
        let u: ESObject = undefined;
        d13.toOctal(u as number);
      } catch (e) {
        errUndef13 = true;
      }
      expect(errNull13).assertTrue();
      expect(errUndef13).assertFalse();
      let d14: Decimal = new Decimal(0.5);
      let defaultStr14: string = d14.toOctal();
      try {
        let nl: ESObject = null;
        d14.toOctal(nl as number);
        expect().assertFail();
      } catch (e) {
        expect(e === null).assertFalse();
      }
      expect(defaultStr14.startsWith('0o')).assertTrue();
      let d15: Decimal = new Decimal(255);
      let before15: string = d15.toString();
      try {
        let nl: ESObject = null;
        d15.toOctal(nl as number);
      } catch (e) {
        let err: ESObject = e;
        expect(err.code !== undefined).assertTrue();
      }
      try {
        let u: ESObject = undefined;
        d15.toOctal(u as number);
      } catch (e) {
        let err: ESObject = e;
        expect(err.code !== undefined).assertTrue();
      }
      expect(d15.toString()).assertEqual(before15);
      let d16: Decimal = new Decimal(255);
      let codeNull16: number = -1;
      let codeUndef16: number = -1;
      try {
        let nl: ESObject = null;
        d16.toOctal(nl as number);
      } catch (e) {
        let err: ESObject = e;
        codeNull16 = err.code;
      }
      try {
        let u: ESObject = undefined;
        d16.toOctal(u as number);
      } catch (e) {
        let err: ESObject = e;
        codeUndef16 = err.code;
      }
      expect(codeNull16).assertEqual(10200001);
      expect(codeNull16 === -1).assertFalse();
    });

    /**
     * @tc.name testDecimalToOctalPart02Test017
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART02_TEST_1700
     * @tc.desc Verify sd bounds specific values non-integer sd and format comparison
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalToOctalPart02Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d17: Decimal = new Decimal(12345.678);
      let r17: string = d17.toOctal(1);
      expect(r17.startsWith('0o')).assertTrue();
      let d18: Decimal = new Decimal(15);
      let r18: string = d18.toOctal(100000);
      expect(r18).assertEqual('0o1.7p+3');
      let d19: Decimal = new Decimal(255);
      let a19: string = d19.toOctal(99999);
      let b19: string = d19.toOctal(100000);
      expect(a19).assertEqual(b19);
      let d28: Decimal = new Decimal(1.5);
      let r28: string = d28.toOctal(2);
      expect(r28.startsWith('0o')).assertTrue();
      let d29: Decimal = new Decimal(15);
      try {
        let r: string = d29.toOctal(1.5);
        expect(r.startsWith('0o')).assertTrue();
      } catch (e) {
        expect(e === null).assertFalse();
      }
      let d30: Decimal = new Decimal(15);
      try {
        let r: string = d30.toOctal(1000000000.5);
        expect(r.startsWith('0o')).assertTrue();
      } catch (e) {
        expect(e === null).assertFalse();
      }
      let d31: Decimal = new Decimal(271);
      let r31: string = d31.toOctal(1);
      expect(r31.startsWith('0o')).assertTrue();
      let d70: Decimal = new Decimal(255);
      let low70: string = d70.toOctal(1);
      let high70: string = d70.toOctal(100000);
      expect(low70.startsWith('0o')).assertTrue();
      expect(high70.startsWith('0o')).assertTrue();
      let d71: Decimal = new Decimal(256);
      let r71: string = d71.toOctal(2);
      expect(r71.startsWith('0o')).assertTrue();
      let d72: Decimal = new Decimal(65535);
      let full72: string = d72.toOctal();
      let sig72: string = d72.toOctal(6);
      expect(full72.startsWith('0o')).assertTrue();
      expect(sig72.startsWith('0o')).assertTrue();
    });

    /**
     * @tc.name testDecimalToOctalPart02Test020
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART02_TEST_2000
     * @tc.desc Verify sd out of range values throw 10200001
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalToOctalPart02Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let outOfRangeSds: ESObject[] = [1000000001, -1, NaN, Infinity, -Infinity, Number.MAX_SAFE_INTEGER];
      for (let i: number = 0; i < outOfRangeSds.length; i++) {
        let d: Decimal = new Decimal(15);
        let errCode: number = -1;
        try {
          d.toOctal(outOfRangeSds[i] as number);
        } catch (e) {
          errCode = (e as ESObject).code;
        }
        expect(errCode).assertEqual(10200001);
      }
      let d25: Decimal = new Decimal(15);
      try {
        let r: string = d25.toOctal(2.5);
        expect(r).assertFail();
      } catch (e) {
        let err: ESObject = e;
        expect(err.code).assertEqual(10200001);
      }
      let d26: Decimal = new Decimal(15);
      try {
        let r: string = d26.toOctal(0.1);
        expect(r.startsWith('0o')).assertTrue();
      } catch (e) {
        expect(e === null).assertFalse();
      }
    });

    /**
     * @tc.name testDecimalToOctalPart02Test053
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART02_TEST_5300
     * @tc.desc Verify sd special negative and boundary values throw 10200001 or are observable
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalToOctalPart02Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let outOfRangeSds: ESObject[] = [-100000, 1e15, -1e9, -0, -0.5, 0.0, NaN, -0];
      for (let i: number = 0; i < outOfRangeSds.length; i++) {
        let d: Decimal = new Decimal(255);
        let errCode: number = -1;
        try {
          d.toOctal(outOfRangeSds[i] as number);
        } catch (e) {
          errCode = (e as ESObject).code;
        }
        expect(errCode).assertEqual(10200001);
      }
      let d56: Decimal = new Decimal(255);
      try {
        let r: string = d56.toOctal(Number.MIN_VALUE);
        expect(r.startsWith('0o')).assertTrue();
      } catch (e) {
        expect(e === null).assertFalse();
      }
      let d68: Decimal = new Decimal(255);
      let pos: boolean = false;
      let neg: boolean = false;
      try {
        d68.toOctal(Infinity);
      } catch (e) {
        pos = true;
      }
      try {
        d68.toOctal(-Infinity);
      } catch (e) {
        neg = true;
      }
      expect(pos).assertTrue();
      expect(neg).assertTrue();
    });

    /**
     * @tc.name testDecimalToOctalPart02Test032
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART02_TEST_3200
     * @tc.desc Verify sd non-numeric types string boolean object array throw 10200001
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalToOctalPart02Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nonNumericSds: ESObject[] = ['5', true, '', {}, [5], [], new Decimal(5), new Date(0), 'abc', (): void => { }];
      for (let i: number = 0; i < nonNumericSds.length; i++) {
        let d: Decimal = new Decimal(255);
        let errCode: number = -1;
        try {
          let v: ESObject = nonNumericSds[i];
          d.toOctal(v as number);
        } catch (e) {
          errCode = (e as ESObject).code;
        }
        expect(errCode).assertEqual(10200001);
      }
    });

    /**
     * @tc.name testDecimalToOctalPart02Test040
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART02_TEST_4000
     * @tc.desc Verify return type format prefix specific value conversions and instance unchanged
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalToOctalPart02Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d40: Decimal = new Decimal(15);
      let r40: string = d40.toOctal(2);
      expect(typeof r40).assertEqual('string');
      let d41: Decimal = new Decimal(255);
      let r41: string = d41.toOctal(3);
      expect(r41.startsWith('0o')).assertTrue();
      let d42: Decimal = new Decimal(100);
      let r42: string = d42.toOctal(3);
      expect(r42).assertEqual('0o1.44p+6');
      let d43: Decimal = new Decimal(-255);
      let r43: string = d43.toOctal(4);
      expect(r43.startsWith('-0o')).assertTrue();
      let d44: Decimal = new Decimal(0.5);
      let r44: string = d44.toOctal(1);
      expect(r44).assertEqual('0o1p-1');
      let d45: Decimal = new Decimal(256);
      let r45: string = d45.toOctal(1);
      expect(r45).assertEqual('0o1p+8');
      let d46: Decimal = new Decimal(255);
      let r46: string = d46.toOctal(3);
      expect(r46.indexOf(' ')).assertEqual(-1);
      let d47: Decimal = new Decimal(187);
      let r47: string = d47.toOctal(3);
      expect(r47).assertEqual('0o1.36p+7');
      let d48: Decimal = new Decimal(255);
      let before48: string = d48.toString();
      d48.toOctal(2);
      expect(d48.toString()).assertEqual(before48);
      let d49: Decimal = new Decimal(255);
      let a49: string = d49.toOctal(3);
      let b49: string = d49.toOctal(3);
      expect(a49).assertEqual(b49);
      let d50: Decimal = new Decimal(16);
      let sd1_50: string = d50.toOctal(1);
      let sd3_50: string = d50.toOctal(3);
      expect(sd1_50 === sd3_50).assertTrue();
      expect(sd1_50).assertEqual('0o1p+4');
      let d51: Decimal = new Decimal(1024);
      let r51: string = d51.toOctal(1);
      expect(r51).assertEqual('0o1p+10');
      let d52: Decimal = new Decimal(4);
      let r52: string = d52.toOctal(1);
      expect(r52).assertEqual('0o1p+2');
    });

    /**
     * @tc.name testDecimalToOctalPart02Test062
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART02_TEST_6200
     * @tc.desc Verify undefined null handling comparison default fallback and runtime path
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalToOctalPart02Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d62: Decimal = new Decimal(255);
      let ok62: boolean = true;
      try {
        let r: string = d62.toOctal();
        ok62 = r.startsWith('0o');
      } catch (e) {
        ok62 = false;
      }
      expect(ok62).assertTrue();
      let threw62: boolean = false;
      try {
        let u: ESObject = undefined;
        d62.toOctal(u as number);
      } catch (e) {
        threw62 = true;
      }
      expect(threw62).assertFalse();
      let d63: Decimal = new Decimal(255);
      let nullThrew63: boolean = false;
      let undefThrew63: boolean = false;
      try {
        let nl: ESObject = null;
        d63.toOctal(nl as number);
      } catch (e) {
        nullThrew63 = true;
      }
      try {
        let u: ESObject = undefined;
        d63.toOctal(u as number);
      } catch (e) {
        undefThrew63 = true;
      }
      expect(nullThrew63).assertTrue();
      expect(undefThrew63).assertFalse();
      let d64: Decimal = new Decimal(64);
      let r64: string = d64.toOctal(3);
      expect(r64).assertEqual('0o1p+6');
      let d65: Decimal = new Decimal(255);
      let u65: ESObject = undefined;
      let r65: string = d65.toOctal(u65 as number);
      expect(r65).assertEqual('0o377');
      let d66: Decimal = new Decimal(255);
      try {
        let nl: ESObject = null;
        d66.toOctal(nl as number);
        expect().assertFail();
      } catch (e) {
        expect(e === null).assertFalse();
      }
      let d73: Decimal = new Decimal(1.5);
      let r73: string = d73.toOctal(1);
      expect(r73.startsWith('0o')).assertTrue();
      let d74: Decimal = new Decimal(255);
      let okCount74: number = 0;
      try {
        let nl: ESObject = null;
        d74.toOctal(nl as number);
      } catch (e) {
        okCount74++;
      }
      try {
        let u: ESObject = undefined;
        d74.toOctal(u as number);
      } catch (e) {
        okCount74++;
      }
      expect(okCount74).assertEqual(1);
      let d75: Decimal = new Decimal(255);
      let a75: string = d75.toOctal(1);
      expect(a75).assertEqual('0o1p+8');
    });


    /**
     * @tc.name testDecimalToOctalPart03Test001
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART03_TEST_0100
     * @tc.desc Verify overload dispatch and invalid x handling undefined null max 0 negative non-integer Infinity NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalToOctalPart03Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec1: Decimal = new Decimal(10);
      let s0: string = dec1.toOctal();
      let s1: string = dec1.toOctal(2);
      let s2: string = dec1.toOctal(2, 4);
      expect(typeof s0).assertEqual('string');
      expect(s0).assertEqual('0o12');
      expect(s1).assertEqual('0o1.2p+3');
      expect(s2).assertEqual('0o1.2p+3');
      let dec2: Decimal = new Decimal(64);
      expect(dec2.toOctal()).assertEqual('0o100');
      let u2: ESObject = undefined;
      let r2: string = dec2.toOctal(u2 as number);
      expect(r2).assertEqual('0o100');
      let dec3: Decimal = new Decimal(8);
      expect(dec3.toOctal()).assertEqual('0o10');
      try {
        let nl: ESObject = null;
        dec3.toOctal(nl as number);
        expect().assertFail();
      } catch (e) {
        expect((e as ESObject).code).assertEqual(10200001);
      }
      let dec4: Decimal = new Decimal(12);
      expect(dec4.toOctal(2)).assertEqual('0o1.4p+3');
      let rm4: ESObject = undefined;
      let r4: string = dec4.toOctal(2, rm4 as Rounding);
      expect(r4).assertEqual('0o1.4p+3');
      let dec5: Decimal = new Decimal(12.5);
      let s1_5: string = dec5.toOctal(1, 4);
      let s2_5: string = dec5.toOctal(2, 4);
      expect(s1_5).assertEqual('0o1p+4');
      expect(s2_5).assertEqual('0o1.5p+3');
      let dec6: Decimal = new Decimal(255);
      let max6: number = 9007199254740991;
      try {
        dec6.toOctal(max6);
        expect().assertFail();
      } catch (e) {
        let err: ESObject = e;
        expect(err.code).assertEqual(10200001);
      }
      let dec7: Decimal = new Decimal(7);
      try {
        dec7.toOctal(0, 4);
        expect().assertFail();
      } catch (e) {
        let err: ESObject = e;
        expect(err.code).assertEqual(10200001);
      }
      let s1_7: string = dec7.toOctal(1, 4);
      expect(s1_7).assertEqual('0o1p+3');
      let dec8: Decimal = new Decimal(9);
      expect(dec8.toOctal(1, 4)).assertEqual('0o1p+3');
      try {
        dec8.toOctal(-3, 4);
        expect().assertFail();
      } catch (e) {
        expect((e as ESObject).code).assertEqual(10200001);
      }
      let dec9: Decimal = new Decimal(12);
      let si9: string = dec9.toOctal(2, 4);
      try {
        let sf: string = dec9.toOctal(2.7, 4);
        expect(typeof sf).assertEqual('string');
        expect(si9).assertEqual('14');
      } catch (e) {
        expect(e === null).assertFalse();
      }
      let dec10: Decimal = new Decimal(3);
      expect(dec10.toOctal(1, 4)).assertEqual('0o1p+2');
      try {
        dec10.toOctal(Infinity, 4);
        expect().assertFail();
      } catch (e) {
        expect(e === null).assertFalse();
      }
      let dec11: Decimal = new Decimal(6);
      expect(dec11.toOctal(1, 4)).assertEqual('0o1p+3');
      try {
        dec11.toOctal(NaN, 4);
        expect().assertFail();
      } catch (e) {
        expect(e === null).assertFalse();
      }
    });

    /**
     * @tc.name testDecimalToOctalPart03Test012
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART03_TEST_1200
     * @tc.desc Verify sd variations on specific values and digit count behavior
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalToOctalPart03Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec12: Decimal = new Decimal(3);
      let s12: string = dec12.toOctal(1, 4);
      expect(s12).assertEqual('0o1p+2');
      let dec13: Decimal = new Decimal(12);
      let s13: string = dec13.toOctal(2, 4);
      expect(s13).assertEqual('0o1.4p+3');
      let dec14: Decimal = new Decimal(10);
      let a14: string = dec14.toOctal();
      let b14: string = dec14.toOctal(20, 4);
      expect(a14).assertEqual('0o12');
      expect(b14).assertEqual('0o1.2p+3');
      let dec15: Decimal = new Decimal(255);
      let s15: string = dec15.toOctal(100000, 4);
      expect(s15).assertEqual('0o1.774p+7');
      let dec16: Decimal = new Decimal(4.5);
      let a16: string = dec16.toOctal(50, 0);
      let b16: string = dec16.toOctal(50, 8);
      expect(a16).assertEqual('0o1.1p+2');
      expect(b16).assertEqual('0o1.1p+2');
    });

    /**
     * @tc.name testDecimalToOctalPart03Test017
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART03_TEST_1700
     * @tc.desc Verify all 9 rounding modes 0 through 8 on midpoint 4.5
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalToOctalPart03Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: Decimal = new Decimal(4.5);
      expect(dec.toOctal(1, 0)).assertEqual('0o1p+3');
      expect(dec.toOctal(1, 1)).assertEqual('0o1p+2');
      expect(dec.toOctal(1, 2)).assertEqual('0o1p+3');
      expect(dec.toOctal(1, 3)).assertEqual('0o1p+2');
      expect(dec.toOctal(1, 4)).assertEqual('0o1p+2');
      expect(dec.toOctal(1, 5)).assertEqual('0o1p+2');
      expect(dec.toOctal(1, 6)).assertEqual('0o1p+2');
      expect(dec.toOctal(1, 7)).assertEqual('0o1p+2');
      expect(dec.toOctal(1, 8)).assertEqual('0o1p+2');
    });

    /**
     * @tc.name testDecimalToOctalPart03Test026
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART03_TEST_2600
     * @tc.desc Verify out-of-range rounding and constants comparison throw 10200001
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalToOctalPart03Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec26: Decimal = new Decimal(4.5);
      expect(dec26.toOctal(1, 0)).assertEqual('0o1p+3');
      try {
        let rm: ESObject = 9;
        dec26.toOctal(1, rm as Rounding);
        expect().assertFail();
      } catch (e) {
        expect((e as ESObject).code).assertEqual(10200001);
      }
      let dec27: Decimal = new Decimal(4.5);
      try {
        let rm: ESObject = -1;
        dec27.toOctal(1, rm as Rounding);
        expect().assertFail();
      } catch (e) {
        expect((e as ESObject).code).assertEqual(10200001);
      }
      let dec28: Decimal = new Decimal(4.5);
      try {
        let rm: ESObject = NaN;
        dec28.toOctal(1, rm as Rounding);
        expect().assertFail();
      } catch (e) {
        expect(e === null).assertFalse();
      }
      let dec29: Decimal = new Decimal(4.5);
      try {
        let rm: ESObject = 2.5;
        dec29.toOctal(1, rm as Rounding);
        expect().assertFail();
      } catch (e) {
        expect(e === null).assertFalse();
      }
      let dec30: Decimal = new Decimal(4.5);
      expect(dec30.toOctal(1, 4)).assertEqual('0o1p+2');
      try {
        let v: ESObject = '4';
        dec30.toOctal(1, v as Rounding);
        expect().assertFail();
      } catch (e) {
        expect((e as ESObject).code).assertEqual(10200001);
      }
      let dec31: Decimal = new Decimal(4.5);
      let a31: string = dec31.toOctal(1, 4);
      let b31: string = dec31.toOctal(1, Decimal.ROUND_HALF_UP);
      expect(a31).assertEqual('0o1p+2');
      expect(b31).assertEqual('0o1p+2');
      let dec32: Decimal = new Decimal(3.5);
      let ev32: string = dec32.toOctal(1, 6);
      expect(ev32).assertEqual('0o1p+2');
      let dec33: Decimal = new Decimal(4.5);
      let r33: string[] = [];
      for (let i: number = 0; i <= 8; i++) {
        r33.push(dec33.toOctal(1, i as Rounding));
      }
      expect(r33.join(',')).assertEqual('0o1p+3,0o1p+2,0o1p+3,0o1p+2,0o1p+2,0o1p+2,0o1p+2,0o1p+2,0o1p+2');
    });

    /**
     * @tc.name testDecimalToOctalPart03Test034
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART03_TEST_3400
     * @tc.desc Verify overload agreement config effects instance fields and character set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalToOctalPart03Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec34: Decimal = new Decimal(10);
      let a34: string = dec34.toOctal();
      let b34: string = dec34.toOctal(20);
      expect(a34).assertEqual('0o12');
      expect(b34).assertEqual('0o1.2p+3');
      let dec35: Decimal = new Decimal(12);
      let a35: string = dec35.toOctal(2);
      let b35: string = dec35.toOctal(2, 4);
      expect(a35).assertEqual('0o1.4p+3');
      expect(b35).assertEqual('0o1.4p+3');
      let dec36: Decimal = new Decimal(4.5);
      let a36: string = dec36.toOctal();
      let b36: string = dec36.toOctal(1, 4);
      expect(typeof a36).assertEqual('string');
      expect(b36).assertEqual('0o1p+2');
      Decimal.set({ rounding: 8 });
      let dec37: Decimal = new Decimal(4.5);
      let a37: string = dec37.toOctal(1, 0);
      let b37: string = dec37.toOctal(1, 8);
      expect(a37).assertEqual('0o1p+3');
      expect(b37).assertEqual('0o1p+2');
      Decimal.set({ rounding: 4, precision: 20 });
      Decimal.set({ precision: 5 });
      let dec38: Decimal = new Decimal(12.3456789);
      let a38: string = dec38.toOctal();
      let b38: string = dec38.toOctal(5);
      expect(a38).assertEqual('0o14.261');
      Decimal.set({ precision: 20 });
      let dec39: Decimal = new Decimal(12);
      let beforeD39: number[] = dec39.d.slice();
      let beforeE39: number = dec39.e;
      dec39.toOctal(2, 4);
      let afterD39: number[] = dec39.d;
      expect(afterD39.length).assertEqual(beforeD39.length);
      for (let i: number = 0; i < beforeD39.length; i++) {
        expect(afterD39[i]).assertEqual(beforeD39[i]);
      }
      expect(dec39.e).assertEqual(beforeE39);
      let dec40: Decimal = new Decimal(10);
      expect(typeof dec40.toOctal()).assertEqual('string');
      expect(typeof dec40.toOctal(2)).assertEqual('string');
      expect(typeof dec40.toOctal(2, 4)).assertEqual('string');
      let dec41: Decimal = new Decimal(255);
      let beforeD41: number[] = dec41.d.slice();
      for (let i: number = 0; i < 2; i++) {
        if (i === 0) {
          dec41.toOctal();
        } else {
          dec41.toOctal(3, 4);
        }
        let afterD41: number[] = dec41.d;
        expect(afterD41.length).assertEqual(beforeD41.length);
        for (let j: number = 0; j < beforeD41.length; j++) {
          expect(afterD41[j]).assertEqual(beforeD41[j]);
        }
      }
      let dec42: Decimal = new Decimal(255);
      let e42: number = dec42.e;
      dec42.toOctal();
      dec42.toOctal(3, 4);
      expect(dec42.e).assertEqual(e42);
      let dec43: Decimal = new Decimal(255);
      let s43: number = dec43.s;
      dec43.toOctal();
      dec43.toOctal(3, 4);
      expect(dec43.s).assertEqual(s43);
      let dec44: Decimal = new Decimal(12.5);
      let s44: string = dec44.toOctal(4, 4);
      let ok44: boolean = true;
      for (let i: number = 0; i < s44.length; i++) {
        let c: string = s44.charAt(i);
        if (c === '.' || c === '-' || c === 'o' || c === 'p' || c === '+' || (c >= '0' && c <= '7')) {
          continue;
        }
        ok44 = false;
      }
      expect(ok44).assertTrue();
    });

    /**
     * @tc.name testDecimalToOctalPart03Test045
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART03_TEST_4500
     * @tc.desc Verify value conversions undefined sd error recovery and global config effects
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalToOctalPart03Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec45: Decimal = new Decimal(255);
      expect(dec45.toOctal()).assertEqual('0o377');
      expect(dec45.toOctal(3)).assertEqual('0o1p+8');
      expect(dec45.toOctal(3, 4)).assertEqual('0o1p+8');
      let dec46: Decimal = new Decimal(256);
      let s46: string = dec46.toOctal(3, 4);
      expect(s46).assertEqual('0o1p+8');
      let dec47: Decimal = new Decimal(8);
      let s47: string = dec47.toOctal(2, 4);
      expect(s47).assertEqual('0o1p+3');
      let dec48: Decimal = new Decimal(10);
      let d48: number[] = dec48.d;
      let e48: number = dec48.e;
      let s48: number = dec48.s;
      try {
        let u: ESObject = undefined;
        let result: string = dec48.toOctal(u as number);
        expect(result).assertEqual('0o12');
      } catch (err) {
        expect().assertFail();
      }
      expect(dec48.d).assertEqual(d48);
      expect(dec48.e).assertEqual(e48);
      expect(dec48.s).assertEqual(s48);
      expect(dec48.toOctal()).assertEqual('0o12');
      let dec49: Decimal = new Decimal(5);
      for (let i: number = 0; i < 3; i++) {
        try {
          let u: ESObject = undefined;
          let result: string = dec49.toOctal(u as number);
          expect(result).assertEqual('0o5');
        } catch (err) {
          expect().assertFail();
        }
      }
      let sum49: Decimal = dec49.add(3);
      expect(sum49.toString()).assertEqual('8');
      let dec50: Decimal = new Decimal(4.5);
      try {
        let rm: ESObject = 9;
        dec50.toOctal(1, rm as Rounding);
        expect().assertFail();
      } catch (err) {
        expect((err as ESObject).code).assertEqual(10200001);
      }
      expect(dec50.toOctal(1, 4)).assertEqual('0o1p+2');
      let dec51: Decimal = new Decimal(12);
      try {
        let nl: ESObject = null;
        dec51.toOctal(nl as number);
        expect().assertFail();
      } catch (err) {
        expect((err as ESObject).code).assertEqual(10200001);
      }
      expect(dec51.toString()).assertEqual('12');
      Decimal.set({ rounding: 3 });
      let dec52: Decimal = new Decimal(4.5);
      let s52: string = dec52.toOctal(1);
      expect(s52).assertEqual('0o1p+2');
      Decimal.set({ rounding: 4, precision: 20 });
      Decimal.set({ precision: 5 });
      let dec53: Decimal = new Decimal(12.3456789);
      let s53: string = dec53.toOctal();
      expect(s53.length).assertEqual(8);
      Decimal.set({ precision: 20 });
      Decimal.set({ rounding: 8, precision: 3 });
      let dec54: Decimal = new Decimal(4.5);
      let a54: string = dec54.toOctal(1);
      expect(a54).assertEqual('0o1p+2');
      Decimal.set({ rounding: 4, precision: 20 });
      let b54: string = dec54.toOctal(1);
      expect(b54).assertEqual('0o1p+2');
    });

    /**
     * @tc.name testDecimalToOctalPart03Test055
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART03_TEST_5500
     * @tc.desc Verify instance consistency global config effects and chained overload calls
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalToOctalPart03Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec55: Decimal = new Decimal(64);
      let a55: string = dec55.toOctal();
      let b55: string = dec55.toOctal();
      expect(a55).assertEqual(b55);
      expect(a55).assertEqual('0o100');
      let d1_56: Decimal = new Decimal(255);
      let d2_56: Decimal = new Decimal(255);
      expect(d1_56.toOctal(3, 4)).assertEqual(d2_56.toOctal(3, 4));
      let d1_57: Decimal = new Decimal(7);
      let d2_57: Decimal = new Decimal(8);
      let a57: string = d1_57.toOctal(2, 4);
      let b57: string = d2_57.toOctal(2, 4);
      expect(a57).assertEqual('0o1.6p+2');
      expect(b57).assertEqual('0o1p+3');
      Decimal.set({ rounding: 1 });
      let d1_58: Decimal = new Decimal(4.5);
      let a58: string = d1_58.toOctal(1);
      Decimal.set({ rounding: 4 });
      let d2_58: Decimal = new Decimal(4.5);
      let b58: string = d2_58.toOctal(1);
      expect(a58).assertEqual('0o1p+2');
      expect(b58).assertEqual('0o1p+2');
      Decimal.set({ rounding: 4, precision: 20 });
      let dec59: Decimal = new Decimal(-4.5);
      let up59: string = dec59.toOctal(1, 0);
      let down59: string = dec59.toOctal(1, 1);
      expect(up59).assertEqual('-0o1p+3');
      expect(down59).assertEqual('-0o1p+2');
      let dec60: Decimal = new Decimal(3.4);
      let s0_60: string = dec60.toOctal(1, 0);
      let s4_60: string = dec60.toOctal(1, 4);
      expect(s0_60).assertEqual('0o1p+2');
      expect(s4_60).assertEqual('0o1p+2');
      let dec61: Decimal = new Decimal(7.5);
      let s61: string = dec61.toOctal(1, 4);
      expect(s61).assertEqual('0o1p+3');
      let dec62: Decimal = new Decimal(10);
      let a62: string = dec62.toOctal();
      let b62: string = dec62.toOctal(2);
      let c62: string = dec62.toOctal(2, 2);
      expect(a62).assertEqual('0o12');
      expect(b62).assertEqual('0o1.2p+3');
      expect(c62).assertEqual('0o1.2p+3');
    });

    /**
     * @tc.name testDecimalToOctalPart03Test063
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART03_TEST_6300
     * @tc.desc Verify special values 1e21 1e-21 -0 NaN Infinity across overloads and precision
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalToOctalPart03Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec63: Decimal = new Decimal(1e21);
      let a63: string = dec63.toOctal();
      let b63: string = dec63.toOctal(2);
      let c63: string = dec63.toOctal(2, 4);
      expect(a63).assertEqual('0o154327115334273650000000');
      expect(b63).assertEqual(c63);
      let dec64: Decimal = new Decimal(1e-21);
      let a64: string = dec64.toOctal();
      let b64: string = dec64.toOctal(2);
      let c64: string = dec64.toOctal(2, 4);
      expect(a64).assertEqual('0o0.0000000000000000000000045616640240723323677');
      expect(b64).assertEqual(c64);
      let dec65: Decimal = new Decimal(-0);
      let a65: string = dec65.toOctal();
      let b65: string = dec65.toOctal(1);
      let c65: string = dec65.toOctal(1, 4);
      expect(a65 === '-0o0' || a65 === '-0o0p+0').assertTrue();
      expect(b65 === '-0o0' || b65 === '-0o0p+0').assertTrue();
      expect(c65 === '-0o0' || c65 === '-0o0p+0').assertTrue();
      let dec66: Decimal = new Decimal(NaN);
      let a66: string = dec66.toOctal();
      let b66: string = dec66.toOctal(1);
      let c66: string = dec66.toOctal(1, 4);
      expect(a66).assertEqual(b66);
      expect(b66).assertEqual(c66);
      let dec67: Decimal = new Decimal(Infinity);
      let a67: string = dec67.toOctal();
      let b67: string = dec67.toOctal(1);
      let c67: string = dec67.toOctal(1, 4);
      expect(a67).assertEqual(b67);
      expect(b67).assertEqual(c67);
      Decimal.set({ precision: 1 });
      let dec68: Decimal = new Decimal(4.5);
      let s68: string = dec68.toOctal();
      expect(s68).assertEqual('0o5');
      Decimal.set({ precision: 20 });
      Decimal.set({ precision: 3 });
      let dec69: Decimal = new Decimal(12.3456789);
      let a69: string = dec69.toOctal();
      let b69: string = dec69.toOctal(2);
      expect(a69 !== b69).assertTrue();
      Decimal.set({ precision: 20 });
      let d1_70: Decimal = new Decimal(4.5);
      let d2_70: Decimal = new Decimal(4.5);
      let a70: string = d1_70.toOctal(1, 4);
      let b70: string = d2_70.toOctal(1, 5);
      expect(a70).assertEqual('0o1p+2');
      expect(b70).assertEqual('0o1p+2');
      let dec71: Decimal = new Decimal(10);
      dec71.toOctal(2, 3);
      dec71.toOctal();
      dec71.toOctal(1);
      dec71.toOctal(3, 8);
      expect(dec71.toString()).assertEqual('10');
    });

    /**
     * @tc.name testDecimalToOctalPart03Test072
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART03_TEST_7200
     * @tc.desc Verify error recovery rounding constants matrices length and DP-COMPOSITE-MULTI-PARAM
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalToOctalPart03Test072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec72: Decimal = new Decimal(4.5);
      try {
        let rm: ESObject = 9;
        dec72.toOctal(1, rm as Rounding);
        expect().assertFail();
      } catch (err) {
        expect((err as ESObject).code).assertEqual(10200001);
      }
      expect(dec72.toOctal(2)).assertEqual('0o1.1p+2');
      let dec73: Decimal = new Decimal(4.5);
      let a73: string = dec73.toOctal(60, 0);
      let b73: string = dec73.toOctal(60, 8);
      expect(a73).assertEqual('0o1.1p+2');
      expect(b73).assertEqual('0o1.1p+2');
      let dec74: Decimal = new Decimal(4.5);
      let a74: string = dec74.toOctal(1, 1);
      let b74: string = dec74.toOctal(1, Decimal.ROUND_DOWN);
      expect(a74).assertEqual('0o1p+2');
      expect(b74).assertEqual('0o1p+2');
      let dec75: Decimal = new Decimal(4.5);
      let a75: string = dec75.toOctal(1);
      let b75: string = dec75.toOctal(1, 4);
      expect(a75).assertEqual('0o1p+2');
      expect(b75).assertEqual('0o1p+2');
      let dec76: Decimal = new Decimal(-4.5);
      let r76: string[] = [];
      for (let i: number = 0; i <= 8; i++) {
        r76.push(dec76.toOctal(1, i as Rounding));
      }
      expect(r76.join(',')).assertEqual('-0o1p+3,-0o1p+2,-0o1p+2,-0o1p+3,-0o1p+2,-0o1p+2,-0o1p+2,-0o1p+2,-0o1p+2');
      let dec77: Decimal = new Decimal(255);
      let a77: string = dec77.toOctal();
      let b77: string = dec77.toOctal(3, 4);
      expect(a77).assertEqual('0o377');
      expect(b77.length).assertEqual(6);
      let d1_78: Decimal = new Decimal(7);
      let d2_78: Decimal = new Decimal(64);
      let a78: string = d1_78.toOctal(2, 4);
      let b78: string = d2_78.toOctal(2, 4);
      expect(a78).assertEqual('0o1.6p+2');
      expect(b78).assertEqual('0o1p+6');
      let dec79: Decimal = new Decimal(4.5);
      expect(dec79.toOctal(1, 0)).assertEqual('0o1p+3');
      expect(dec79.toOctal(60, 8)).assertEqual('0o1.1p+2');
      expect(dec79.toOctal(100000, 4)).assertEqual('0o1.1p+2');
      let u79: ESObject = undefined;
      let result79: string = dec79.toOctal(u79 as number);
      expect(result79).assertEqual('0o4.4');
    });
  });
}
