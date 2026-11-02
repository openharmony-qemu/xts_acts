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

function toBinaryExtra(d: Decimal, sd: number, rm: Rounding, extra: ESObject): string {
  let obj: ESObject = d;
  return obj.toBinary(sd, rm, extra) as string;
}

function toBinaryExtra2(d: Decimal, sd: number, extra1: ESObject): string {
  let obj: ESObject = d;
  return obj.toBinary(sd, extra1) as string;
}

function toBinaryExtra3(d: Decimal, sd: number, extra1: ESObject, extra2: ESObject): string {
  let obj: ESObject = d;
  return obj.toBinary(sd, extra1, extra2) as string;
}

export default function DecimalToBinaryTest(): void {
  describe('DecimalToBinaryTest', () => {
    beforeAll(() => {});
    beforeEach(async () => {
      await common.sleep(common.DEFAULT_SLEEP_MS);
    });
    afterEach(() => { common.resetDecimalConfig(Decimal); });
    afterAll(() => {});


    /**
     * @tc.name testDecimalToBinaryPart01Test001
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_BINARY_PART01_TEST_0100
     * @tc.desc Verify zero-arg toBinary output format, prefix, p-exponent form and basic integer values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalToBinaryPart01Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec256: Decimal = new Decimal(256);
      expect(dec256.toBinary()).assertEqual('0b100000000');
      expect(dec256.toBinary(1, Decimal.ROUND_HALF_UP)).assertEqual('0b1p+8');
      let dec255: Decimal = new Decimal(255);
      expect(typeof dec255.toBinary()).assertEqual('string');
      expect(dec255.toBinary().indexOf('0b') === 0).assertTrue();
      let decNeg255: Decimal = new Decimal(-255);
      expect(decNeg255.toBinary().indexOf('-0b') === 0).assertTrue();
      expect(dec255.toBinary().indexOf('p+') < 0).assertTrue();
      expect(dec255.toBinary(1, Decimal.ROUND_DOWN).indexOf('p+') > 0).assertTrue();
      expect(new Decimal(256).toBinary()).assertEqual('0b100000000');
      expect(new Decimal(256).toBinary(1, Decimal.ROUND_DOWN)).assertEqual('0b1p+8');
      expect(new Decimal(1).toBinary()).assertEqual('0b1');
      expect(new Decimal(2).toBinary()).assertEqual('0b10');
      expect(new Decimal(-2).toBinary()).assertEqual('-0b10');
      expect(new Decimal(10).toBinary()).assertEqual('0b1010');
      expect(new Decimal(64).toBinary()).assertEqual('0b1000000');
      let pure: boolean = true;
      let out: string = new Decimal(255).toBinary();
      for (let i: number = 0; i < out.length; i++) {
        let c: string = out.charAt(i);
        if (c !== '0' && c !== '1' && c !== 'b' && c !== '.' && c !== '-') {
          pure = false;
        }
      }
      expect(pure).assertTrue();
    });

    /**
     * @tc.name testDecimalToBinaryPart01Test004
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_BINARY_PART01_TEST_0400
     * @tc.desc Verify significantDigits variation normalizes to p-exponent form across bounds
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalToBinaryPart01Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Decimal(256).toBinary(1, Decimal.ROUND_DOWN)).assertEqual('0b1p+8');
      expect(new Decimal(3).toBinary(2, Decimal.ROUND_DOWN)).assertEqual('0b1.1p+1');
      expect(new Decimal(5).toBinary(3, Decimal.ROUND_DOWN)).assertEqual('0b1.01p+2');
      let dec: Decimal = new Decimal(Number.MAX_SAFE_INTEGER);
      let exp: string = '0b1.' + '1'.repeat(52) + 'p+52';
      expect(dec.toBinary(53, Decimal.ROUND_DOWN)).assertEqual(exp);
      let out: string = new Decimal(256).toBinary(1000, Decimal.ROUND_DOWN);
      expect(out).assertEqual('0b1p+8');
      expect(new Decimal(0).toBinary(100000, Decimal.ROUND_DOWN)).assertEqual('0b0p+0');
      expect(new Decimal(1).toBinary(1, Decimal.ROUND_DOWN)).assertEqual('0b1p+0');
      expect(new Decimal(1).toBinary(10, Decimal.ROUND_DOWN)).assertEqual('0b1p+0');
      expect(new Decimal(0.75).toBinary(1, Decimal.ROUND_DOWN)).assertEqual('0b1p-1');
    });

    /**
     * @tc.name testDecimalToBinaryPart01Test011
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_BINARY_PART01_TEST_1100
     * @tc.desc Verify all rounding modes direction behavior on positive and negative tie values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalToBinaryPart01Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec3: Decimal = new Decimal(3);
      let base: string = dec3.toBinary(1, Decimal.ROUND_DOWN);
      expect(toBinaryExtra(dec3, 1, Decimal.ROUND_DOWN, 999)).assertEqual(base);
      expect(new Decimal(3).toBinary(1, Decimal.ROUND_HALF_UP)).assertEqual('0b1p+2');
      expect(new Decimal(3).toBinary(1, Decimal.ROUND_HALF_DOWN)).assertEqual('0b1p+1');
      expect(new Decimal(3).toBinary(1, Decimal.ROUND_UP)).assertEqual('0b1p+2');
      expect(new Decimal(3).toBinary(1, Decimal.ROUND_DOWN)).assertEqual('0b1p+1');
      expect(new Decimal(3).toBinary(1, Decimal.ROUND_CEILING)).assertEqual('0b1p+2');
      expect(new Decimal(3).toBinary(1, Decimal.ROUND_FLOOR)).assertEqual('0b1p+1');
      expect(new Decimal(3).toBinary(1, 4)).assertEqual('0b1p+2');
      expect(new Decimal(3).toBinary(1, Decimal.ROUND_HALF_UP)).assertEqual('0b1p+2');
      expect(new Decimal(2).toBinary(1, Decimal.ROUND_HALF_EVEN)).assertEqual('0b1p+1');
      expect(new Decimal(-3).toBinary(1, Decimal.ROUND_UP)).assertEqual('-0b1p+2');
      expect(new Decimal(-3).toBinary(1, Decimal.ROUND_DOWN)).assertEqual('-0b1p+1');
      expect(new Decimal(-3).toBinary(1, Decimal.ROUND_CEILING)).assertEqual('-0b1p+1');
      expect(new Decimal(-3).toBinary(1, Decimal.ROUND_FLOOR)).assertEqual('-0b1p+2');
      expect(new Decimal(-3).toBinary(1, Decimal.ROUND_HALF_CEILING)).assertEqual('-0b1p+1');
      expect(new Decimal(-3).toBinary(1, Decimal.ROUND_HALF_FLOOR)).assertEqual('-0b1p+2');
    });

    /**
     * @tc.name testDecimalToBinaryPart01Test044
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_BINARY_PART01_TEST_4400
     * @tc.desc Verify NaN, Infinity, zero, and negative zero values across zero-arg and parameterized overloads
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalToBinaryPart01Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Decimal(NaN).toBinary()).assertEqual('NaN');
      expect(new Decimal(Infinity).toBinary()).assertEqual('Infinity');
      expect(new Decimal(-Infinity).toBinary()).assertEqual('-Infinity');
      expect(new Decimal(NaN).toBinary(1, Decimal.ROUND_UP)).assertEqual('NaN');
      expect(new Decimal(Infinity).toBinary(1, Decimal.ROUND_UP)).assertEqual('Infinity');
      expect(new Decimal(-Infinity).toBinary(1, Decimal.ROUND_UP)).assertEqual('-Infinity');
      expect(new Decimal(0).toBinary()).assertEqual('0b0');
      expect(new Decimal(-0).toBinary()).assertEqual('-0b0');
      expect(new Decimal(-0).toBinary(1, Decimal.ROUND_DOWN)).assertEqual('-0b0p+0');
    });

    /**
     * @tc.name testDecimalToBinaryPart01Test030
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_BINARY_PART01_TEST_3000
     * @tc.desc Verify binary fraction outputs and parameterized normalization for fractional values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalToBinaryPart01Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Decimal(0.5).toBinary()).assertEqual('0b0.1');
      expect(new Decimal(1.5).toBinary()).assertEqual('0b1.1');
      expect(new Decimal(0.75).toBinary()).assertEqual('0b0.11');
      expect(new Decimal(-0.5).toBinary()).assertEqual('-0b0.1');
      expect(new Decimal(2.5).toBinary()).assertEqual('0b10.1');
      expect(new Decimal(0.25).toBinary(1, Decimal.ROUND_DOWN)).assertEqual('0b1p-2');
      expect(new Decimal(0.5).toBinary(1, Decimal.ROUND_DOWN)).assertEqual('0b1p-1');
      expect(new Decimal(2.5).toBinary(1, Decimal.ROUND_DOWN)).assertEqual('0b1p+1');
      expect(new Decimal(Number.EPSILON).toBinary(1, Decimal.ROUND_DOWN)).assertEqual('0b1p-53');
      expect(new Decimal(Number.MIN_VALUE).toBinary(1, Decimal.ROUND_DOWN)).assertEqual('0b1p-1074');
      expect(new Decimal(Number.MAX_SAFE_INTEGER).toBinary(1, Decimal.ROUND_HALF_UP)).assertEqual('0b1p+53');
      expect(new Decimal(0.1).toBinary(1, Decimal.ROUND_HALF_UP)).assertEqual('0b1p-3');
      expect(new Decimal(0.1).toBinary(1, Decimal.ROUND_HALF_DOWN)).assertEqual('0b1p-3');
    });

    /**
     * @tc.name testDecimalToBinaryPart01Test036
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_BINARY_PART01_TEST_3600
     * @tc.desc Verify out-of-range significantDigits and rounding throw 10200001
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalToBinaryPart01Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Decimal(3).toBinary(1.9, Decimal.ROUND_DOWN);
        expect().assertFail();
      } catch (e) {
        let err: ESObject = e;
        expect(err.code).assertEqual(10200001);
      }
      try {
        new Decimal(1).toBinary(0, Decimal.ROUND_HALF_UP);
        expect().assertFail();
      } catch (e) {
        let err: ESObject = e;
        expect(err.code).assertEqual(10200001);
      }
      try {
        new Decimal(1).toBinary(-1, Decimal.ROUND_HALF_UP);
        expect().assertFail();
      } catch (e) {
        let err: ESObject = e;
        expect(err.code).assertEqual(10200001);
      }
      try {
        new Decimal(1).toBinary(1e9 + 1, Decimal.ROUND_HALF_UP);
        expect().assertFail();
      } catch (e) {
        let err: ESObject = e;
        expect(err.code).assertEqual(10200001);
      }
      try {
        new Decimal(1).toBinary(Infinity, Decimal.ROUND_HALF_UP);
        expect().assertFail();
      } catch (e) {
        let err: ESObject = e;
        expect(err.code).assertEqual(10200001);
      }
      try {
        let rm: ESObject = 9;
        new Decimal(1).toBinary(1, rm as Rounding);
        expect().assertFail();
      } catch (e) {
        let err: ESObject = e;
        expect(err.code).assertEqual(10200001);
      }
      try {
        let rm: ESObject = -1;
        new Decimal(1).toBinary(1, rm as Rounding);
        expect().assertFail();
      } catch (e) {
        let err: ESObject = e;
        expect(err.code).assertEqual(10200001);
      }
      try {
        let rm: ESObject = 8.5;
        new Decimal(1).toBinary(1, rm as Rounding);
        expect().assertFail();
      } catch (e) {
        let err: ESObject = e;
        expect(err.code).assertEqual(10200001);
      }
      try {
        let rm: ESObject = 100;
        new Decimal(1).toBinary(1, rm as Rounding);
        expect().assertFail();
      } catch (e) {
        let err: ESObject = e;
        expect(err.code).assertEqual(10200001);
      }
    });

    /**
     * @tc.name testDecimalToBinaryPart01Test057
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_BINARY_PART01_TEST_5700
     * @tc.desc Verify large, boundary, and scientific notation values match exact JS binary representation
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalToBinaryPart01Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let maxValOut: string = new Decimal(Number.MAX_VALUE).toBinary();
      expect(maxValOut.indexOf('0b1') === 0).assertTrue();
      expect(maxValOut.length).assertEqual(1027);
      let minValOut: string = new Decimal(Number.MIN_VALUE).toBinary();
      expect(minValOut.indexOf('0b0.') === 0).assertTrue();
      expect(minValOut.length).assertEqual(1097);
      expect(minValOut.endsWith('1')).assertTrue();
      let epsOut: string = new Decimal(Number.EPSILON).toBinary();
      expect(epsOut.indexOf('0b0.') === 0).assertTrue();
      expect(epsOut.endsWith('1')).assertTrue();
      let msiExp: string = '0b100000000000000000000000000000000000000000000000000000';
      expect(new Decimal(Number.MAX_SAFE_INTEGER).toBinary()).assertEqual(msiExp);
      let minSiExp: string = '-0b100000000000000000000000000000000000000000000000000000';
      expect(new Decimal(Number.MIN_SAFE_INTEGER).toBinary()).assertEqual(minSiExp);
      let v: number = Number.MAX_SAFE_INTEGER + 1;
      let pow53Exp: string = '0b1' + '0'.repeat(53);
      expect(new Decimal(v).toBinary()).assertEqual(pow53Exp);
      let out01: string = new Decimal(0.1).toBinary();
      expect(out01.indexOf('0b') === 0).assertTrue();
      expect(out01.length).assertEqual(27);
    });


    /**
     * @tc.name testDecimalToBinaryPart02Test001
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_BINARY_PART02_TEST_0100
     * @tc.desc Verify dynamic dispatch across declared arity, extra args, undefined/null/string/bool/object sd
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalToBinaryPart02Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Decimal(256).toBinary(1)).assertEqual('0b1p+8');
      let a: ESObject = new Decimal(256);
      expect(a.toBinary()).assertEqual('0b100000000');
      let dec: Decimal = new Decimal(256);
      let threw3: boolean = false;
      try {
        toBinaryExtra2(dec, 1, 9);
      } catch (e) {
        threw3 = true;
      }
      expect(threw3).assertTrue();
      let threw4: boolean = false;
      try {
        toBinaryExtra3(dec, 1, 'x', 9);
      } catch (e) {
        threw4 = true;
      }
      expect(threw4).assertTrue();
      let d1: Decimal = new Decimal(256);
      let u: ESObject = undefined;
      let s1: string = d1.toBinary(u as number);
      let s2: string = d1.toBinary();
      expect(s1).assertEqual('0b100000000');
      expect(s1).assertEqual(s2);
      let u2: ESObject = undefined;
      let sFr: string = new Decimal('0.1').toBinary(u2 as number);
      expect(sFr.startsWith('0b0.')).assertTrue();
      expect(sFr.includes('p')).assertFalse();
      let probeThrows = (val: ESObject): void => {
        try {
          new Decimal(256).toBinary(val as number);
          expect().assertFail();
        } catch (e) {
          let err: ESObject = e;
          expect(typeof err.code).assertEqual('number');
        }
      };
      probeThrows(null);
      let n: ESObject = null;
      try {
        new Decimal(256).toBinary(n as number);
        expect().assertFail();
      } catch (e) {
        let err: ESObject = e;
        expect(typeof err.code).assertEqual('number');
      }
      let v: ESObject = undefined;
      expect(new Decimal(256).toBinary(v as number)).assertEqual('0b100000000');
      probeThrows('');
      probeThrows(' ');
      probeThrows('5');
      probeThrows(false);
      probeThrows(true);
      probeThrows({});
      probeThrows([]);
    });

    /**
     * @tc.name testDecimalToBinaryPart02Test016
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_BINARY_PART02_TEST_1600
     * @tc.desc Verify one-arg sd with various small values returns expected exponent form
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalToBinaryPart02Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Decimal(0.5).toBinary(1)).assertEqual('0b1p-1');
      expect(new Decimal(0.75).toBinary(2)).assertEqual('0b1.1p-1');
      expect(new Decimal(3).toBinary(2.0)).assertEqual('0b1.1p+1');
      expect(new Decimal(256).toBinary(100000)).assertEqual('0b1p+8');
      let sd: number = 2;
      expect(new Decimal(3).toBinary(sd)).assertEqual('0b1.1p+1');
      expect(new Decimal(3).toBinary(1 + 1)).assertEqual('0b1.1p+1');
      expect(new Decimal(255).toBinary(8)).assertEqual('0b1.1111111p+7');
      expect(new Decimal(5).toBinary(3)).assertEqual('0b1.01p+2');
      expect(new Decimal(6).toBinary(3)).assertEqual('0b1.1p+2');
    });

    /**
     * @tc.name testDecimalToBinaryPart02Test025
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_BINARY_PART02_TEST_2500
     * @tc.desc Verify one-arg sd with specific values including signed and zero exponent forms
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalToBinaryPart02Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Decimal(31).toBinary(5)).assertEqual('0b1.1111p+4');
      expect(new Decimal(100).toBinary(5)).assertEqual('0b1.1001p+6');
      expect(new Decimal(427.9375).toBinary(13)).assertEqual('0b1.101010111111p+8');
      expect(new Decimal(1.5).toBinary(2)).assertEqual('0b1.1p+0');
      expect(new Decimal(-5).toBinary(3)).assertEqual('-0b1.01p+2');
      expect(new Decimal(-0.5).toBinary(1)).assertEqual('-0b1p-1');
      expect(new Decimal(-256).toBinary(1)).assertEqual('-0b1p+8');
      expect(new Decimal(0.875).toBinary(3)).assertEqual('0b1.11p-1');
    });

    /**
     * @tc.name testDecimalToBinaryPart02Test033
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_BINARY_PART02_TEST_3300
     * @tc.desc Verify return type, prefix, idempotency, instance integrity, and construction sources
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalToBinaryPart02Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r1: string = new Decimal(256).toBinary(1);
      expect(typeof r1).assertEqual('string');
      let r2: string = new Decimal(255).toBinary(8);
      expect(r2.startsWith('0b')).assertTrue();
      let r3: string = new Decimal(5).toBinary(3);
      expect(r3.includes('p+')).assertTrue();
      expect(new Decimal(0.25).toBinary(1)).assertEqual('0b1p-2');
      expect(new Decimal(10).toBinary(4)).assertEqual('0b1.01p+3');
      let d: Decimal = new Decimal(256);
      d.toBinary(1);
      expect(d.toString()).assertEqual('256');
      let d5: Decimal = new Decimal(5);
      let first: string = d5.toBinary(3);
      let second: string = d5.toBinary(3);
      expect(first).assertEqual('0b1.01p+2');
      expect(second).assertEqual('0b1.01p+2');
      let d3: Decimal = new Decimal(3);
      expect(d3.toBinary(1)).assertEqual('0b1p+2');
      expect(d3.toBinary(2)).assertEqual('0b1.1p+1');
      expect(new Decimal(256).toBinary(1)).assertEqual(new Decimal('256').toBinary(1));
      expect(new Decimal(128).add(128).toBinary(1)).assertEqual('0b1p+8');
      expect(new Decimal('0b1p+8').toString()).assertEqual('256');
    });

    /**
     * @tc.name testDecimalToBinaryPart02Test044
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_BINARY_PART02_TEST_4400
     * @tc.desc Verify result growth with sd, power-of-two boundaries, zero and negative zero with sd
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalToBinaryPart02Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: string = new Decimal(5).toBinary(1);
      let s2: string = new Decimal(5).toBinary(5);
      expect(s2.length > s1.length).assertTrue();
      expect(new Decimal('4294967296').toBinary(1)).assertEqual('0b1p+32');
      expect(new Decimal('9007199254740992').toBinary(1)).assertEqual('0b1p+53');
      expect(new Decimal('9007199254740991').toBinary(1)).assertEqual('0b1p+53');
      expect(new Decimal(0).toBinary(1)).assertEqual('0b0p+0');
      expect(new Decimal(-0).toBinary(1)).assertEqual('-0b0p+0');
    });

    /**
     * @tc.name testDecimalToBinaryPart02Test050
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_BINARY_PART02_TEST_5000
     * @tc.desc Verify out-of-range significantDigits values throw 10200001
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalToBinaryPart02Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let probeThrows = (sd: ESObject): void => {
        try {
          new Decimal(256).toBinary(sd as number);
          expect().assertFail();
        } catch (e) {
          expect((e as ESObject).code).assertEqual(10200001);
        }
      };
      probeThrows(0);
      probeThrows(-1);
      probeThrows(-1e9);
      probeThrows(1e9 + 1);
      probeThrows(9007199254740991);
      probeThrows(9007199254740992);
      probeThrows(Number.MAX_VALUE);
      probeThrows(1.5);
      probeThrows(1e-7);
      probeThrows(Number.MIN_VALUE);
      probeThrows(-0);
      probeThrows(NaN);
      probeThrows(Infinity);
      probeThrows(-Infinity);
    });

    /**
     * @tc.name testDecimalToBinaryPart02Test064
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_BINARY_PART02_TEST_6400
     * @tc.desc Verify global DecimalConfig rounding mode and precision effects on toBinary output
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalToBinaryPart02Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ defaults: true });
      expect(new Decimal(2.75).toBinary(3)).assertEqual('0b1.1p+1');
      Decimal.set({ defaults: true });
      Decimal.set({ rounding: Decimal.ROUND_DOWN });
      expect(new Decimal(2.75).toBinary(3)).assertEqual('0b1.01p+1');
      Decimal.set({ defaults: true });
      Decimal.set({ rounding: Decimal.ROUND_UP });
      expect(new Decimal(2.75).toBinary(3)).assertEqual('0b1.1p+1');
      Decimal.set({ defaults: true });
      Decimal.set({ rounding: Decimal.ROUND_CEILING });
      expect(new Decimal(2.75).toBinary(3)).assertEqual('0b1.1p+1');
      Decimal.set({ defaults: true });
      Decimal.set({ rounding: Decimal.ROUND_FLOOR });
      expect(new Decimal(2.75).toBinary(3)).assertEqual('0b1.01p+1');
      Decimal.set({ defaults: true });
      Decimal.set({ rounding: Decimal.ROUND_HALF_DOWN });
      expect(new Decimal(2.75).toBinary(3)).assertEqual('0b1.01p+1');
      Decimal.set({ defaults: true });
      Decimal.set({ rounding: Decimal.ROUND_HALF_EVEN });
      expect(new Decimal(2.75).toBinary(3)).assertEqual('0b1.1p+1');
      Decimal.set({ defaults: true });
      Decimal.set({ rounding: Decimal.ROUND_HALF_CEILING });
      expect(new Decimal(2.75).toBinary(3)).assertEqual('0b1.1p+1');
      Decimal.set({ defaults: true });
      Decimal.set({ rounding: Decimal.ROUND_HALF_FLOOR });
      expect(new Decimal(2.75).toBinary(3)).assertEqual('0b1.01p+1');
      Decimal.set({ defaults: true });
      Decimal.set({ rounding: Decimal.ROUND_DOWN });
      expect(new Decimal(2.25).toBinary(3)).assertEqual('0b1p+1');
      Decimal.set({ defaults: true });
      Decimal.set({ rounding: Decimal.ROUND_HALF_UP });
      expect(new Decimal(2.25).toBinary(3)).assertEqual('0b1.01p+1');
      Decimal.set({ defaults: true });
      Decimal.set({ rounding: Decimal.ROUND_DOWN });
      Decimal.set({ defaults: true });
      expect(new Decimal(2.75).toBinary(3)).assertEqual('0b1.1p+1');
      Decimal.set({ defaults: true });
      Decimal.set({ precision: 2 });
      expect(new Decimal(256).toBinary(10)).assertEqual('0b1p+8');
      Decimal.set({ defaults: true });
      Decimal.set({ precision: 3 });
      let u: ESObject = undefined;
      let s: string = new Decimal('0.1').toBinary(u as number);
      expect(s.startsWith('0b0.00011')).assertTrue();
      Decimal.set({ defaults: true });
    });


    /**
     * @tc.name testDecimalToBinaryPart03Test001
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_BINARY_PART03_TEST_0100
     * @tc.desc Verify overload dispatch comparisons and undefined/null first arg fallback
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalToBinaryPart03Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec256: Decimal = new Decimal(256);
      expect(dec256.toBinary()).assertEqual('0b100000000');
      expect(dec256.toBinary(1)).assertEqual('0b1p+8');
      let dec3: Decimal = new Decimal(3);
      expect(dec3.toBinary()).assertEqual('0b11');
      expect(dec3.toBinary(2, Decimal.ROUND_HALF_UP)).assertEqual('0b1.1p+1');
      expect(dec256.toBinary(1)).assertEqual('0b1p+8');
      expect(dec256.toBinary(1, Decimal.ROUND_HALF_UP)).assertEqual('0b1p+8');
      let dec15: Decimal = new Decimal(1.5);
      expect(dec15.toBinary(1)).assertEqual('0b1p+1');
      expect(dec15.toBinary(1, Decimal.ROUND_HALF_UP)).assertEqual('0b1p+1');
      expect(dec15.toBinary(1, Decimal.ROUND_HALF_DOWN)).assertEqual('0b1p+0');
      let dec5: Decimal = new Decimal(5);
      let r0: string = dec5.toBinary();
      let u: ESObject = undefined;
      let rU: string = dec5.toBinary(u as number);
      expect(r0).assertEqual('0b101');
      expect(rU).assertEqual('0b101');
      let dec5b: Decimal = new Decimal(5);
      try {
        let n: ESObject = null;
        let s: string = dec5b.toBinary(n as number);
        expect(typeof s).assertEqual('string');
      } catch (e) {
        let err: ESObject = e;
        expect(err.code !== undefined).assertTrue();
      }
      expect(dec5b.toString()).assertEqual('5');
      let dec256c: Decimal = new Decimal(256);
      let ub: ESObject = undefined;
      let sc: string = dec256c.toBinary(1, ub as Rounding);
      expect(sc).assertEqual('0b1p+8');
      let dec3c: Decimal = new Decimal(3);
      expect(dec3c.toBinary(1)).assertEqual('0b1p+2');
      expect(dec3c.toBinary(1, Decimal.ROUND_HALF_UP)).assertEqual('0b1p+2');
    });

    /**
     * @tc.name testDecimalToBinaryPart03Test009
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_BINARY_PART03_TEST_0900
     * @tc.desc Verify zero-arg ignores global rounding while one-arg reads global DecimalConfig rounding
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalToBinaryPart03Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec3: Decimal = new Decimal(3);
      Decimal.set({ rounding: Decimal.ROUND_DOWN });
      try {
        expect(dec3.toBinary()).assertEqual('0b11');
      } finally {
        Decimal.set({ rounding: Decimal.ROUND_HALF_UP });
      }
      let dec3b: Decimal = new Decimal(3);
      Decimal.set({ rounding: Decimal.ROUND_DOWN });
      try {
        expect(dec3b.toBinary(1)).assertEqual('0b1p+1');
      } finally {
        Decimal.set({ rounding: Decimal.ROUND_HALF_UP });
      }
      let dec3c: Decimal = new Decimal(3);
      Decimal.set({ rounding: Decimal.ROUND_DOWN });
      try {
        expect(dec3c.toBinary(1, Decimal.ROUND_UP)).assertEqual('0b1p+2');
      } finally {
        Decimal.set({ rounding: Decimal.ROUND_HALF_UP });
      }
      let dec15: Decimal = new Decimal(1.5);
      expect(dec15.toBinary(1)).assertEqual('0b1p+1');
      expect(dec15.toBinary(2)).assertEqual('0b1.1p+0');
      let dec123: Decimal = new Decimal(123);
      expect(dec123.toBinary(100000)).assertEqual('0b1.111011p+6');
      let dec3d: Decimal = new Decimal(3);
      Decimal.set({ rounding: Decimal.ROUND_DOWN });
      let during: string = dec3d.toBinary(1);
      Decimal.set({ rounding: Decimal.ROUND_HALF_UP });
      expect(during).assertEqual('0b1p+1');
      expect(dec3d.toBinary(1)).assertEqual('0b1p+2');
    });

    /**
     * @tc.name testDecimalToBinaryPart03Test015
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_BINARY_PART03_TEST_1500
     * @tc.desc Verify tiny scientific value format and rounding mode behavior including constants and type errors
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalToBinaryPart03Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: Decimal = new Decimal('1e-7');
      let full: string = dec.toBinary();
      let sig: string = dec.toBinary(3);
      expect(full.startsWith('0b0.')).assertTrue();
      expect(full.indexOf('p') >= 0).assertFalse();
      expect(sig.startsWith('0b')).assertTrue();
      expect(sig.indexOf('p') >= 0).assertTrue();
      let dec3: Decimal = new Decimal(3);
      let s16: string = dec3.toBinary(1, Decimal.ROUND_HALF_EVEN);
      expect(s16 === '0b1p+2' || s16 === '0b1p+1').assertTrue();
      expect(new Decimal(3).toBinary(1, Decimal.ROUND_HALF_CEILING)).assertEqual('0b1p+2');
      expect(new Decimal(3).toBinary(1, Decimal.ROUND_HALF_FLOOR)).assertEqual('0b1p+1');
      expect(Decimal.ROUND_HALF_UP).assertEqual(4);
      let dec3c: Decimal = new Decimal(3);
      expect(dec3c.toBinary(1, 4)).assertEqual(dec3c.toBinary(1, Decimal.ROUND_HALF_UP));
      expect(Decimal.ROUND_DOWN).assertEqual(1);
      let dec3d: Decimal = new Decimal(3);
      let rm4: ESObject = 4.0;
      expect(dec3d.toBinary(1, rm4 as Rounding)).assertEqual('0b1p+2');
      let dec3e: Decimal = new Decimal(3);
      try {
        let rmS: ESObject = '4';
        let s: string = dec3e.toBinary(1, rmS as Rounding);
        expect(s === '0b1p+2' || s === '0b1p+1').assertTrue();
      } catch (e) {
        let err: ESObject = e;
        expect(err.code !== undefined).assertTrue();
      }
      let dec3f: Decimal = new Decimal(3);
      let rmU: ESObject = undefined;
      let sU: string = dec3f.toBinary(1, rmU as Rounding);
      expect(sU).assertEqual('0b1p+2');
      let probeRoundingThrows = (rm: ESObject): void => {
        let dec: Decimal = new Decimal(3);
        let errCode: number = -1;
        try {
          dec.toBinary(1, rm as Rounding);
        } catch (e) {
          errCode = (e as ESObject).code;
        }
        expect(errCode).assertEqual(10200001);
      };
      probeRoundingThrows(-1);
      probeRoundingThrows(NaN);
      probeRoundingThrows(4.5);
      probeRoundingThrows(1000000000);
    });

    /**
     * @tc.name testDecimalToBinaryPart03Test028
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_BINARY_PART03_TEST_2800
     * @tc.desc Verify return type, instance state preservation, and special values across overloads
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalToBinaryPart03Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec255: Decimal = new Decimal(255);
      let s1: string = dec255.toBinary(4);
      expect(typeof s1).assertEqual('string');
      let s2: string = dec255.toBinary(4, Decimal.ROUND_HALF_UP);
      expect(typeof s2).assertEqual('string');
      let dec3: Decimal = new Decimal(3);
      dec3.toBinary();
      dec3.toBinary(1);
      dec3.toBinary(1, Decimal.ROUND_DOWN);
      expect(dec3.toString()).assertEqual('3');
      let dec3b: Decimal = new Decimal(3);
      let e0: number = dec3b.e;
      let s0: number = dec3b.s;
      dec3b.toBinary();
      dec3b.toBinary(1);
      dec3b.toBinary(1, Decimal.ROUND_HALF_UP);
      expect(dec3b.e).assertEqual(e0);
      expect(dec3b.s).assertEqual(s0);
      expect(dec3b.d.length).assertEqual(1);
      let decMsi: Decimal = new Decimal('9007199254740991');
      let sMsi: string = decMsi.toBinary();
      expect(sMsi.startsWith('0b')).assertTrue();
      expect(sMsi.length).assertEqual(56);
      expect(sMsi.indexOf('0', 2)).assertEqual(3);
      let decNeg: Decimal = new Decimal(-3);
      expect(decNeg.toBinary()).assertEqual('-0b11');
      expect(decNeg.toBinary(4)).assertEqual('-0b1.1p+1');
      let pz: Decimal = new Decimal('0');
      let nz: Decimal = new Decimal('-0');
      expect(pz.toBinary()).assertEqual('0b0');
      expect(nz.toBinary()).assertEqual('-0b0');
      let decHalf: Decimal = new Decimal('0.5');
      expect(decHalf.toBinary()).assertEqual('0b0.1');
      expect(decHalf.toBinary(1)).assertEqual('0b1p-1');
      let dec1e3: Decimal = new Decimal('1e3');
      expect(dec1e3.toBinary()).assertEqual('0b1111101000');
      expect(dec1e3.toBinary(1)).assertEqual('0b1p+10');
      let dec2p52: Decimal = new Decimal('4503599627370496');
      expect(dec2p52.toBinary(1)).assertEqual('0b1p+52');
      let decNan: Decimal = new Decimal('NaN');
      expect(decNan.toBinary()).assertEqual('NaN');
      expect(decNan.toBinary(1)).assertEqual('NaN');
      let pos: Decimal = new Decimal('Infinity');
      let neg: Decimal = new Decimal('-Infinity');
      expect(pos.toBinary()).assertEqual('Infinity');
      expect(neg.toBinary(2, Decimal.ROUND_UP)).assertEqual('-Infinity');
      let a: Decimal = new Decimal('255');
      let b: Decimal = new Decimal(255);
      expect(a.toBinary()).assertEqual('0b11111111');
      expect(b.toBinary()).assertEqual(a.toBinary());
    });

    /**
     * @tc.name testDecimalToBinaryPart03Test041
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_BINARY_PART03_TEST_4100
     * @tc.desc Verify instance integrity preserved after throws and global config shared across instances
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalToBinaryPart03Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec3: Decimal = new Decimal(3);
      let errCode: number = -1;
      try {
        dec3.toBinary(0);
      } catch (e) {
        errCode = (e as ESObject).code;
      }
      expect(errCode).assertEqual(10200001);
      expect(dec3.toString()).assertEqual('3');
      let dec3b: Decimal = new Decimal(3);
      let arr: number[] = dec3b.d;
      let e0: number = dec3b.e;
      let s0: number = dec3b.s;
      let errCodeB: number = -1;
      try {
        dec3b.toBinary(0);
      } catch (e) {
        errCodeB = (e as ESObject).code;
      }
      expect(errCodeB).assertEqual(10200001);
      expect(dec3b.d === arr).assertTrue();
      expect(dec3b.e).assertEqual(e0);
      expect(dec3b.s).assertEqual(s0);
      let dec3c: Decimal = new Decimal(3);
      let errCodeC: number = -1;
      try {
        dec3c.toBinary(0);
      } catch (e) {
        errCodeC = (e as ESObject).code;
      }
      expect(errCodeC).assertEqual(10200001);
      expect(dec3c.add(1).toString()).assertEqual('4');
      let dec3d: Decimal = new Decimal(3);
      let errCodeD: number = -1;
      try {
        dec3d.toBinary(0);
      } catch (e) {
        errCodeD = (e as ESObject).code;
      }
      expect(errCodeD).assertEqual(10200001);
      expect(dec3d.toBinary()).assertEqual('0b11');
      let dec3e: Decimal = new Decimal(3);
      let errCodeE: number = -1;
      try {
        let rm: ESObject = 9;
        dec3e.toBinary(1, rm as Rounding);
      } catch (e) {
        errCodeE = (e as ESObject).code;
      }
      expect(errCodeE).assertEqual(10200001);
      expect(dec3e.toString()).assertEqual('3');
      let dec7: Decimal = new Decimal(7);
      let arr7: number[] = dec7.d;
      let errCode7: number = -1;
      try {
        let rm: ESObject = 9;
        dec7.toBinary(0, rm as Rounding);
      } catch (e) {
        errCode7 = (e as ESObject).code;
      }
      expect(errCode7).assertEqual(10200001);
      expect(dec7.d === arr7).assertTrue();
      let dec3f: Decimal = new Decimal(3);
      let errCodeF: number = -1;
      try {
        dec3f.toBinary(-1);
      } catch (e) {
        errCodeF = (e as ESObject).code;
      }
      expect(errCodeF).assertEqual(10200001);
      let errCodeF2: number = -1;
      try {
        let rm: ESObject = -1;
        dec3f.toBinary(1, rm as Rounding);
      } catch (e) {
        errCodeF2 = (e as ESObject).code;
      }
      expect(errCodeF2).assertEqual(10200001);
      expect(dec3f.add(2).toString()).assertEqual('5');
      let dec3g: Decimal = new Decimal(3);
      let errCodeG: number = -1;
      try {
        dec3g.toBinary(0);
      } catch (e) {
        errCodeG = (e as ESObject).code;
      }
      expect(errCodeG).assertEqual(10200001);
      expect(dec3g.toBinary(1, Decimal.ROUND_DOWN)).assertEqual('0b1p+1');
      let a: Decimal = new Decimal(3);
      let b: Decimal = new Decimal(3);
      Decimal.set({ rounding: Decimal.ROUND_DOWN });
      try {
        expect(a.toBinary(1)).assertEqual('0b1p+1');
        expect(b.toBinary(1)).assertEqual('0b1p+1');
      } finally {
        Decimal.set({ rounding: Decimal.ROUND_HALF_UP });
      }
      let a2: Decimal = new Decimal(3);
      let b2: Decimal = new Decimal(3);
      Decimal.set({ rounding: Decimal.ROUND_DOWN });
      let during: string = a2.toBinary(1);
      Decimal.set({ rounding: Decimal.ROUND_HALF_UP });
      expect(during).assertEqual('0b1p+1');
      expect(a2.toBinary(1)).assertEqual('0b1p+2');
      expect(b2.toBinary(1)).assertEqual('0b1p+2');
      let a7: Decimal = new Decimal('7');
      let b7: Decimal = new Decimal(7);
      expect(a7.toBinary(3)).assertEqual('0b1.11p+2');
      expect(b7.toBinary(3)).assertEqual('0b1.11p+2');
      expect(a7.toBinary() === b7.toBinary()).assertTrue();
      let dec3h: Decimal = new Decimal(3);
      let arrH: number[] = dec3h.d;
      dec3h.toBinary();
      dec3h.toBinary(1);
      dec3h.toBinary(1, Decimal.ROUND_HALF_UP);
      expect(dec3h.d === arrH).assertTrue();
      let dec3i: Decimal = new Decimal(3);
      Decimal.set({ rounding: Decimal.ROUND_DOWN });
      try {
        expect(dec3i.toBinary()).assertEqual('0b11');
        expect(dec3i.toBinary(1)).assertEqual('0b1p+1');
      } finally {
        Decimal.set({ rounding: Decimal.ROUND_HALF_UP });
      }
    });

    /**
     * @tc.name testDecimalToBinaryPart03Test054
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_BINARY_PART03_TEST_5400
     * @tc.desc Verify rounding direction group equivalence, constants, and boundary rounding behavior
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalToBinaryPart03Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec3: Decimal = new Decimal(3);
      dec3.toBinary(1, Decimal.ROUND_DOWN);
      expect(dec3.toBinary(1)).assertEqual('0b1p+2');
      let up: string = dec3.toBinary(1, Decimal.ROUND_UP);
      let ceiling: string = dec3.toBinary(1, Decimal.ROUND_CEILING);
      let halfUp: string = dec3.toBinary(1, Decimal.ROUND_HALF_UP);
      let halfCeiling: string = dec3.toBinary(1, Decimal.ROUND_HALF_CEILING);
      expect(up).assertEqual('0b1p+2');
      expect(ceiling).assertEqual(up);
      expect(halfUp).assertEqual(up);
      expect(halfCeiling).assertEqual(up);
      let down: string = dec3.toBinary(1, Decimal.ROUND_DOWN);
      let floor: string = dec3.toBinary(1, Decimal.ROUND_FLOOR);
      let halfDown: string = dec3.toBinary(1, Decimal.ROUND_HALF_DOWN);
      let halfFloor: string = dec3.toBinary(1, Decimal.ROUND_HALF_FLOOR);
      expect(down).assertEqual('0b1p+1');
      expect(floor).assertEqual(down);
      expect(halfDown).assertEqual(down);
      expect(halfFloor).assertEqual(down);
      expect(Decimal.ROUND_HALF_EVEN).assertEqual(6);
      let dec10: Decimal = new Decimal(10);
      let s1: string = dec10.toBinary(2, Decimal.ROUND_HALF_EVEN);
      let s2: string = dec10.toBinary(2, 6);
      expect(s1 === s2).assertTrue();
      expect(Decimal.ROUND_FLOOR).assertEqual(3);
      let dec06: Decimal = new Decimal('0.6');
      expect(dec06.toBinary(1, Decimal.ROUND_UP)).assertEqual('0b1p+0');
      expect(dec06.toBinary(1, Decimal.ROUND_DOWN)).assertEqual('0b1p-1');
      let dec7: Decimal = new Decimal(7);
      expect(dec7.toBinary(100000, Decimal.ROUND_HALF_FLOOR)).assertEqual('0b1.11p+2');
      let dec15: Decimal = new Decimal(15);
      expect(dec15.toBinary(3, Decimal.ROUND_HALF_UP)).assertEqual('0b1p+4');
      expect(dec15.toBinary(3, Decimal.ROUND_HALF_DOWN)).assertEqual('0b1.11p+3');
      let dec5: Decimal = new Decimal(5);
      expect(dec5.toBinary(1, Decimal.ROUND_HALF_EVEN)).assertEqual('0b1p+2');
      expect(dec5.toBinary(1, Decimal.ROUND_HALF_UP)).assertEqual('0b1p+2');
      expect(dec5.toBinary(2, Decimal.ROUND_HALF_UP)).assertEqual('0b1.1p+2');
      expect(dec5.toBinary(2, Decimal.ROUND_HALF_DOWN)).assertEqual('0b1p+2');
    });

    /**
     * @tc.name testDecimalToBinaryPart03Test064
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_BINARY_PART03_TEST_6400
     * @tc.desc Verify invalid sd or rounding each throw 10200001 and value/rounding combination outputs
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalToBinaryPart03Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec3: Decimal = new Decimal(3);
      let errCode: number = -1;
      try {
        dec3.toBinary(0, Decimal.ROUND_HALF_UP);
      } catch (e) {
        errCode = (e as ESObject).code;
      }
      expect(errCode).assertEqual(10200001);
      let errCode2: number = -1;
      try {
        let rm: ESObject = 9;
        dec3.toBinary(1, rm as Rounding);
      } catch (e) {
        errCode2 = (e as ESObject).code;
      }
      expect(errCode2).assertEqual(10200001);
      let dec5: Decimal = new Decimal(5);
      expect(dec5.toBinary(2, Decimal.ROUND_HALF_FLOOR)).assertEqual('0b1p+2');
      let probeSdThrows = (sd: ESObject): void => {
        let dec: Decimal = new Decimal(3);
        let errCode: number = -1;
        try {
          dec.toBinary(sd as number);
        } catch (e) {
          errCode = (e as ESObject).code;
        }
        expect(errCode).assertEqual(10200001);
      };
      probeSdThrows(-1);
      probeSdThrows(2.5);
      probeSdThrows(1000000001);
      probeSdThrows(NaN);
      probeSdThrows(Infinity);
      let dec3c: Decimal = new Decimal(3);
      expect(dec3c.toBinary(1, Decimal.ROUND_HALF_CEILING)).assertEqual('0b1p+2');
      expect(dec3c.toBinary(1, Decimal.ROUND_HALF_FLOOR)).assertEqual('0b1p+1');
      let dec15: Decimal = new Decimal(1.5);
      expect(dec15.toBinary(1)).assertEqual('0b1p+1');
      let dec8: Decimal = new Decimal(8);
      expect(dec8.toBinary()).assertEqual('0b1000');
      expect(dec8.toBinary(1)).assertEqual('0b1p+3');
      expect(dec8.toBinary(2)).assertEqual('0b1p+3');
      let dec04: Decimal = new Decimal('0.4');
      expect(dec04.toBinary(1)).assertEqual('0b1p-1');
      expect(dec04.toBinary(2)).assertEqual('0b1.1p-2');
      let decNeg3: Decimal = new Decimal(-3);
      expect(decNeg3.toBinary(1, Decimal.ROUND_UP)).assertEqual('-0b1p+2');
      expect(decNeg3.toBinary(1, Decimal.ROUND_DOWN)).assertEqual('-0b1p+1');
    });
  });
}
