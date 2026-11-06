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

function toNumberWith1(d: Decimal, a: ESObject): number {
  let obj: ESObject = d;
  return obj.toNumber(a) as number;
}

function toNumberWith4(d: Decimal, a: ESObject, b: ESObject, c: ESObject, e: ESObject): number {
  let obj: ESObject = d;
  return obj.toNumber(a, b, c, e) as number;
}

type Value = string | number | Decimal;

export default function DecimalToNumberTest() {
  describe('DecimalToNumberTest', () => {
    beforeAll(() => {});
    beforeEach(async () => {
      await common.sleep(common.DEFAULT_SLEEP_MS);
    });
    afterEach(() => { common.resetDecimalConfig(Decimal); });
    afterAll(() => {});

    /**
     * @tc.name testDecimalToNumberPart01Test001
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_NUMBER_PART01_TEST_0100
     * @tc.desc Verify zero-arg extra args and Decimal member conversions through toNumber
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalToNumberPart01Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: Decimal = new Decimal('456.789');
      let r: number = dec.toNumber();
      expect(r).assertEqual(456.789);
      let dec2: Decimal = new Decimal(123.456);
      let r2: number = toNumberWith1(dec2, null);
      expect(r2).assertEqual(123.456);
      let dec3: Decimal = new Decimal('-0.25');
      let other3: Decimal = new Decimal(999);
      let r3: number = toNumberWith1(dec3, other3);
      expect(r3).assertEqual(-0.25);
      let dec4: Decimal = new Decimal(3);
      let r4: number = toNumberWith4(dec4, 1, 'x', null, undefined);
      expect(r4).assertEqual(3);
      let dec5: Decimal = new Decimal('42');
      let a5: number = dec5.toNumber();
      let b5: number = toNumberWith1(dec5, undefined);
      expect(a5).assertEqual(42);
      expect(b5).assertEqual(42);
      let inner35: Decimal = new Decimal('0.1');
      let outer35: Decimal = new Decimal(inner35);
      expect(outer35.toNumber()).assertEqual(0.1);
      let inner36: Decimal = new Decimal(NaN);
      let outer36: Decimal = new Decimal(inner36);
      expect(Number.isNaN(outer36.toNumber())).assertTrue();
      let inner37: Decimal = new Decimal('1e300');
      let outer37: Decimal = new Decimal(inner37);
      expect(outer37.toNumber()).assertEqual(1e300);
      let d1_38: Decimal = new Decimal('2.5');
      let d2_38: Decimal = new Decimal('2.5');
      let r1_38: number = new Decimal(d1_38).toNumber();
      let r2_38: number = new Decimal(d2_38).toNumber();
      expect(r1_38).assertEqual(r2_38);
      let inner39: Decimal = new Decimal('-0.75');
      let outer39: Decimal = new Decimal(inner39);
      expect(outer39.toNumber()).assertEqual(-0.75);
    });

    /**
     * @tc.name testDecimalToNumberPart01Test006
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_NUMBER_PART01_TEST_0600
     * @tc.desc Verify number member round-trips through toNumber including boundary values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalToNumberPart01Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec6: Decimal = new Decimal(1234.5678);
      expect(dec6.toNumber()).assertEqual(1234.5678);
      let dec7: Decimal = new Decimal(0.1);
      expect(dec7.toNumber()).assertEqual(0.1);
      let dec8: Decimal = new Decimal(Number.MAX_VALUE);
      expect(dec8.toNumber()).assertEqual(1.7976931348623157e308);
      let dec9: Decimal = new Decimal(Number.MIN_VALUE);
      expect(dec9.toNumber()).assertEqual(5e-324);
      let dec10: Decimal = new Decimal(Number.EPSILON);
      expect(dec10.toNumber()).assertEqual(2.220446049250313e-16);
      let dec11: Decimal = new Decimal(Number.MAX_SAFE_INTEGER);
      expect(dec11.toNumber()).assertEqual(9007199254740991);
      let dec12: Decimal = new Decimal(Number.MIN_SAFE_INTEGER);
      expect(dec12.toNumber()).assertEqual(-9007199254740991);
      let dec13: Decimal = new Decimal(NaN);
      expect(Number.isNaN(dec13.toNumber())).assertTrue();
      let dec14: Decimal = new Decimal(Infinity);
      expect(dec14.toNumber()).assertEqual(Infinity);
      let dec15: Decimal = new Decimal(-Infinity);
      expect(dec15.toNumber()).assertEqual(-Infinity);
      let dec16: Decimal = new Decimal(-0);
      expect(1 / dec16.toNumber()).assertEqual(-Infinity);
      let dec17: Decimal = new Decimal(0);
      expect(dec17.toNumber()).assertEqual(0);
      expect(1 / dec17.toNumber()).assertEqual(Infinity);
      let dec18: Decimal = new Decimal(Number.MIN_SAFE_INTEGER - 1);
      expect(dec18.toNumber()).assertEqual(-9007199254740992);
    });

    /**
     * @tc.name testDecimalToNumberPart01Test019
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_NUMBER_PART01_TEST_1900
     * @tc.desc Verify string member conversions through toNumber including scientific hex binary octal
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalToNumberPart01Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec19: Decimal = new Decimal('987654321');
      expect(dec19.toNumber()).assertEqual(987654321);
      let dec20: Decimal = new Decimal('0.125');
      expect(dec20.toNumber()).assertEqual(0.125);
      let dec21: Decimal = new Decimal('1e300');
      expect(dec21.toNumber()).assertEqual(1e300);
      let dec22: Decimal = new Decimal('1e-7');
      expect(dec22.toNumber()).assertEqual(1e-7);
      let dec23: Decimal = new Decimal('0x10');
      expect(dec23.toNumber()).assertEqual(16);
      let dec24: Decimal = new Decimal('0b101');
      expect(dec24.toNumber()).assertEqual(5);
      let dec25: Decimal = new Decimal('0o17');
      expect(dec25.toNumber()).assertEqual(15);
      let dec26: Decimal = new Decimal('9007199254740992');
      expect(dec26.toNumber()).assertEqual(9007199254740992);
      let dec27: Decimal = new Decimal('9007199254740993');
      expect(dec27.toNumber()).assertEqual(9007199254740992);
      let dec28: Decimal = new Decimal('9007199254740991');
      expect(dec28.toNumber()).assertEqual(9007199254740991);
      let dec29: Decimal = new Decimal('123456789012345678901234567890');
      expect(dec29.toNumber()).assertEqual(1.2345678901234568e29);
      let dec30: Decimal = new Decimal('0.123456789012345678901234567890');
      expect(dec30.toNumber()).assertEqual(0.12345678901234568);
      let dec31: Decimal = new Decimal('-1e-7');
      expect(dec31.toNumber()).assertEqual(-1e-7);
      let dec32: Decimal = new Decimal('-0');
      expect(1 / dec32.toNumber()).assertEqual(-Infinity);
      let dec33: Decimal = new Decimal('5e-324');
      expect(dec33.toNumber()).assertEqual(5e-324);
      let dec34: Decimal = new Decimal('1e9');
      expect(dec34.toNumber()).assertEqual(1e9);
    });

    /**
     * @tc.name testDecimalToNumberPart01Test040
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_NUMBER_PART01_TEST_4000
     * @tc.desc Verify union member dispatch string number Decimal null undefined across constructions
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalToNumberPart01Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let vals40: Array<string | number> = ['7', 7];
      for (let i: number = 0; i < vals40.length; i++) {
        let dec: Decimal = new Decimal(vals40[i]);
        expect(dec.toNumber()).assertEqual(7);
      }
      let vals41: Array<string | number | Decimal> = ['8', 8, new Decimal('8')];
      for (let i: number = 0; i < vals41.length; i++) {
        let dec: Decimal = new Decimal(vals41[i]);
        expect(dec.toNumber()).assertEqual(8);
      }
      let threw42: boolean = false;
      try {
        let v: ESObject = null;
        new Decimal(v as Value);
        expect().assertFail();
      } catch (e) {
        threw42 = true;
        let err: ESObject = e;
        expect(err.code).assertEqual(401);
      }
      let v43: ESObject = '3';
      expect(new Decimal(v43 as Value).toNumber()).assertEqual(3);
      let v44: ESObject = 1.5;
      expect(new Decimal(v44 as Value).toNumber()).assertEqual(1.5);
      let threw45: boolean = false;
      try {
        let v: ESObject = undefined;
        new Decimal(v as Value);
        expect().assertFail();
      } catch (e) {
        threw45 = true;
        let err: ESObject = e;
        expect(err.code).assertEqual(401);
      }
      let v46: ESObject = 2.25;
      expect(new Decimal(v46 as Value).toNumber()).assertEqual(2.25);
      let threw47: boolean = false;
      let holder: ESObject = { name: 'x' };
      let v47: ESObject = holder.missing;
      try {
        new Decimal(v47 as Value);
        expect().assertFail();
      } catch (e) {
        threw47 = true;
        let err: ESObject = e;
        expect(err.code).assertEqual(401);
      }
      let v48: string | Decimal = new Decimal('-2.25');
      expect(new Decimal(v48).toNumber()).assertEqual(-2.25);
      let v49: string | number | Decimal = new Decimal('0.5');
      let r49: number = new Decimal(v49).toNumber();
      expect(r49).assertEqual(0.5);
      let cfg50: ESObject = { kind: 'str', payload: '12.5' };
      let val50: ESObject = cfg50.kind === 'str' ? cfg50.payload : new Decimal(0);
      expect(new Decimal(val50 as Value).toNumber()).assertEqual(12.5);
      let cfg51: ESObject = { kind: 'dec', payload: new Decimal('-4.5') };
      let val51: ESObject = cfg51.kind === 'dec' ? cfg51.payload : cfg51.payload.toString();
      expect(new Decimal(val51 as Value).toNumber()).assertEqual(-4.5);
      let arr52: Array<number | string> = [10, '10'];
      let sum52: number = 0;
      for (let i: number = 0; i < arr52.length; i++) {
        sum52 += new Decimal(arr52[i]).toNumber();
      }
      expect(sum52).assertEqual(20);
      let v53: ESObject = 3.5;
      let r53: number = 0;
      if (typeof v53 === 'number') {
        r53 = new Decimal(v53 as Value).toNumber();
      }
      expect(r53).assertEqual(3.5);
    });

    /**
     * @tc.name testDecimalToNumberPart01Test054
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_NUMBER_PART01_TEST_5400
     * @tc.desc Verify toNumber result properties and invalid string construction throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalToNumberPart01Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec54: Decimal = new Decimal('5');
      let r54: number = dec54.toNumber();
      expect(typeof r54).assertEqual('number');
      let dec55: Decimal = new Decimal('10').div(4).mul(2);
      expect(dec55.toNumber()).assertEqual(5);
      let dec56: Decimal = new Decimal('2.5');
      let r56: number = dec56.toNumber() + 0.5;
      expect(r56).assertEqual(3);
      let dec57: Decimal = new Decimal('2.75');
      expect(dec57.toNumber()).assertEqual(Number(dec57.toString()));
      let dec58: Decimal = new Decimal('1e15');
      expect(Number.isInteger(dec58.toNumber())).assertTrue();
      let dec59: Decimal = new Decimal('0.1');
      let r59: number = dec59.toNumber();
      expect(r59).assertEqual(0.1);
      expect(dec59.toString()).assertEqual('0.1');
      let dec60: Decimal = new Decimal('0.75');
      expect(Number.isFinite(dec60.toNumber())).assertTrue();
      let invalidStrings: string[] = ['abc', '0x', '1e', ''];
      for (let i: number = 0; i < invalidStrings.length; i++) {
        let threw: boolean = false;
        try {
          new Decimal(invalidStrings[i]);
          expect().assertFail();
        } catch (e) {
          threw = true;
          let err: ESObject = e;
          expect(err.code).assertEqual(401);
        }
        expect(threw).assertTrue();
      }
    });

    /**
     * @tc.name testDecimalToNumberPart01Test065
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_NUMBER_PART01_TEST_6500
     * @tc.desc Verify overflow underflow and subnormal boundary values through toNumber
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalToNumberPart01Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec65: Decimal = new Decimal('1e309');
      expect(dec65.toNumber()).assertEqual(Infinity);
      let dec66: Decimal = new Decimal('4.56e400');
      expect(dec66.toNumber()).assertEqual(Infinity);
      let dec67: Decimal = new Decimal('1e-600');
      expect(dec67.toNumber()).assertEqual(0);
      let dec68: Decimal = new Decimal('-1e-600');
      expect(1 / dec68.toNumber()).assertEqual(-Infinity);
      let dec69: Decimal = new Decimal('1e-323');
      expect(dec69.toNumber()).assertEqual(1e-323);
      let dec70: Decimal = new Decimal('1e-324');
      expect(dec70.toNumber()).assertEqual(0);
    });

    /**
     * @tc.name testDecimalToNumberPart01Test071
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_NUMBER_PART01_TEST_7100
     * @tc.desc Verify precision rounding edge cases and arbitrary precision arithmetic through toNumber
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalToNumberPart01Test071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec71: Decimal = new Decimal('0.999999999999999999999');
      expect(dec71.toNumber()).assertEqual(1);
      let dec72: Decimal = new Decimal('1.00000000000000000001');
      expect(dec72.toNumber()).assertEqual(1);
      let dec73: Decimal = new Decimal('0.1').add('0.2');
      expect(dec73.toNumber()).assertEqual(0.3);
      let dec74: Decimal = new Decimal(1).div(3);
      expect(dec74.toNumber()).assertEqual(0.33333333333333337);
      let dec75: Decimal = new Decimal('123456789').mul('987654321');
      expect(dec75.toNumber()).assertEqual(121932631112635260);
      let dec76: Decimal = new Decimal(2).sqrt();
      expect(dec76.toNumber()).assertEqual(1.414213562373095);
      let dec77: Decimal = new Decimal('2.5').toSignificantDigits(1);
      expect(dec77.toNumber()).assertEqual(3);
      Decimal.set({ rounding: Decimal.ROUND_DOWN, defaults: true });
      let dec78: Decimal = new Decimal('2.5').toSignificantDigits(1);
      expect(dec78.toNumber()).assertEqual(2);
      Decimal.set({ rounding: Decimal.ROUND_HALF_UP, defaults: true });
    });

    /**
     * @tc.name testDecimalToNumberPart02Test001
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_NUMBER_PART02_TEST_0100
     * @tc.desc Verify invalid construction null undefined empty string object throws 401 with error properties
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalToNumberPart02Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let invalidValues: ESObject[] = [undefined, null, {}, 'null', 'undefined', '', undefined];
      for (let i: number = 0; i < invalidValues.length; i++) {
        let threw: boolean = false;
        try {
          let v: ESObject = invalidValues[i];
          new Decimal(v as Value);
          expect().assertFail();
        } catch (e) {
          threw = true;
          let err: ESObject = e;
          expect(err.code).assertEqual(401);
        }
        expect(threw).assertTrue();
      }
      let ok: Decimal = new Decimal(0);
      expect(ok.toNumber()).assertEqual(0);
      let threw27: boolean = false;
      try {
        let nl: ESObject = null;
        new Decimal(nl as Value);
        expect().assertFail();
      } catch (e) {
        threw27 = true;
        let err: ESObject = e;
        expect(typeof err.code).assertEqual('number');
      }
      expect(threw27).assertTrue();
      let threw28: boolean = false;
      try {
        let missing: ESObject = undefined;
        new Decimal(missing as Value);
        expect().assertFail();
      } catch (e) {
        threw28 = true;
        let err: ESObject = e;
        expect(err.message.length > 0).assertTrue();
      }
      expect(threw28).assertTrue();
      let t1: boolean = false;
      try {
        let missing: ESObject = undefined;
        new Decimal(missing as Value);
        expect().assertFail();
      } catch (e) {
        t1 = true;
        let err: ESObject = e;
        expect(err.code).assertEqual(401);
      }
      let t2: boolean = false;
      try {
        let missing: ESObject = undefined;
        new Decimal(missing as Value);
        expect().assertFail();
      } catch (e) {
        t2 = true;
        let err: ESObject = e;
        expect(err.code).assertEqual(401);
      }
      expect(t1).assertTrue();
      expect(t2).assertTrue();
    });

    /**
     * @tc.name testDecimalToNumberPart02Test002
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_NUMBER_PART02_TEST_0200
     * @tc.desc Verify toNumber extra args ignored nullish checks and config effects
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalToNumberPart02Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let decimal2: Decimal = new Decimal(5);
      let r1_2: number = toNumberWith1(decimal2, 123);
      let r2_2: number = decimal2.toNumber();
      expect(r1_2).assertEqual(r2_2);
      expect(r1_2).assertEqual(5);
      let decimal3: Decimal = new Decimal(7);
      let r1_3: number = toNumberWith1(decimal3, undefined);
      expect(r1_3).assertEqual(decimal3.toNumber());
      let decimal4: Decimal = new Decimal(9);
      let r1_4: number = toNumberWith1(decimal4, null);
      expect(r1_4).assertEqual(9);
      let decimal19: Decimal = new Decimal('42');
      expect(decimal19.toNumber() === null).assertFalse();
      let decimal20: Decimal = new Decimal('42');
      expect(decimal20.toNumber() === undefined).assertFalse();
      let decimal21: Decimal = new Decimal('42');
      expect(typeof decimal21.toNumber()).assertEqual('number');
      let decimal22: Decimal = new Decimal(0);
      expect(decimal22.toNumber()).assertEqual(0);
      expect(decimal22.toNumber() === null).assertFalse();
      expect(decimal22.toNumber() === undefined).assertFalse();
      let decimal23: Decimal = new Decimal(Infinity);
      expect(decimal23.toNumber() === Infinity).assertTrue();
      expect(decimal23.toNumber() === null).assertFalse();
      let decimal24: Decimal = new Decimal(NaN);
      expect(Number.isNaN(decimal24.toNumber())).assertTrue();
      expect(decimal24.toNumber() === null).assertFalse();
      let decimal34: Decimal = new Decimal('123.456');
      expect(decimal34.toNumber()).assertEqual(123.456);
      Decimal.set({ precision: 1 });
      try {
        let decimal35: Decimal = new Decimal('123.456');
        expect(decimal35.toNumber()).assertEqual(123.456);
      } finally {
        Decimal.set({ precision: 20, rounding: 4, toExpNeg: -7, toExpPos: 21, maxE: 9e15, minE: -9e15, modulo: 1, crypto: false });
      }
      Decimal.set({ precision: 1 });
      let d1_36: Decimal = new Decimal('1.23456');
      Decimal.set({ precision: 20, rounding: 4, toExpNeg: -7, toExpPos: 21, maxE: 9e15, minE: -9e15, modulo: 1, crypto: false });
      let d2_36: Decimal = new Decimal('1.23456');
      expect(d1_36.toNumber()).assertEqual(1.23456);
      expect(d2_36.toNumber()).assertEqual(1.23456);
    });

    /**
     * @tc.name testDecimalToNumberPart02Test011
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_NUMBER_PART02_TEST_1100
     * @tc.desc Verify union member dispatch and copy construction across string number Decimal null
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalToNumberPart02Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1_11: ESObject = '5';
      let decimal11: Decimal = new Decimal(v1_11 as Value);
      expect(decimal11.toNumber()).assertEqual(5);
      let v2_11: ESObject = null;
      let threw11: boolean = false;
      try {
        new Decimal(v2_11 as Value);
        expect().assertFail();
      } catch (e) {
        threw11 = true;
        let err: ESObject = e;
        expect(err.code).assertEqual(401);
      }
      expect(threw11).assertTrue();
      let v1_12: ESObject = 5;
      let decimal12: Decimal = new Decimal(v1_12 as Value);
      expect(decimal12.toNumber()).assertEqual(5);
      let v2_12: ESObject = undefined;
      let threw12: boolean = false;
      try {
        new Decimal(v2_12 as Value);
        expect().assertFail();
      } catch (e) {
        threw12 = true;
        let err: ESObject = e;
        expect(err.code).assertEqual(401);
      }
      expect(threw12).assertTrue();
      let v1_13: ESObject = new Decimal('5');
      let decimal13: Decimal = new Decimal(v1_13 as Value);
      expect(decimal13.toNumber()).assertEqual(5);
      let v2_13: ESObject = null;
      let threw13: boolean = false;
      try {
        new Decimal(v2_13 as Value);
        expect().assertFail();
      } catch (e) {
        threw13 = true;
        let err: ESObject = e;
        expect(err.code).assertEqual(401);
      }
      expect(threw13).assertTrue();
      let s14: string | number | Decimal = '12';
      expect(new Decimal(s14).toNumber()).assertEqual(12);
      let n14: string | number | Decimal = 34;
      expect(new Decimal(n14).toNumber()).assertEqual(34);
      let dec14: string | number | Decimal = new Decimal(56);
      expect(new Decimal(dec14).toNumber()).assertEqual(56);
      let a15: ESObject = '10';
      expect(new Decimal(a15 as Value).toNumber()).assertEqual(10);
      let b15: ESObject = 20;
      expect(new Decimal(b15 as Value).toNumber()).assertEqual(20);
      let c15: ESObject = new Decimal(30);
      expect(new Decimal(c15 as Value).toNumber()).assertEqual(30);
      let n15: ESObject = null;
      let threw15: boolean = false;
      try {
        new Decimal(n15 as Value);
        expect().assertFail();
      } catch (e) {
        threw15 = true;
        let err: ESObject = e;
        expect(err.code).assertEqual(401);
      }
      expect(threw15).assertTrue();
      let d1_16: Decimal = new Decimal('5');
      let d2_16: Decimal = new Decimal(5);
      expect(d1_16.toNumber()).assertEqual(5);
      expect(d2_16.toNumber()).assertEqual(5);
      expect(d1_16.toNumber()).assertEqual(d2_16.toNumber());
      let src17: Decimal = new Decimal('123.45');
      let copy17: Decimal = new Decimal(src17);
      expect(copy17.toNumber()).assertEqual(src17.toNumber());
      expect(copy17.toNumber()).assertEqual(123.45);
      let v18: Decimal | string = '7.5';
      let decimal18: Decimal = new Decimal(v18);
      expect(decimal18.toNumber()).assertEqual(7.5);
    });

    /**
     * @tc.name testDecimalToNumberPart02Test025
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_NUMBER_PART02_TEST_2500
     * @tc.desc Verify null undefined receiver calling toNumber guard branches and error isolation
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalToNumberPart02Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let threw25: boolean = false;
      let target25: ESObject = null;
      try {
        target25.toNumber();
      } catch (e) {
        threw25 = true;
        expect(e === null).assertFalse();
      }
      expect(threw25).assertTrue();
      let threw26: boolean = false;
      let target26: ESObject = undefined;
      try {
        target26.toNumber();
      } catch (e) {
        threw26 = true;
        expect(e === null).assertFalse();
      }
      expect(threw26).assertTrue();
      let threw30: boolean = false;
      try {
        let nl: ESObject = null;
        new Decimal(nl as Value);
        expect().assertFail();
      } catch (e) {
        threw30 = true;
        let err: ESObject = e;
        expect(err.code).assertEqual(401);
      }
      let decimal30: Decimal = new Decimal('5');
      expect(decimal30.toNumber()).assertEqual(5);
      expect(threw30).assertTrue();
      let v31: ESObject = null;
      let usedGuard31: boolean = false;
      if (v31 !== null) {
        usedGuard31 = true;
        let d: Decimal = new Decimal(v31 as Value);
        expect(d.toNumber()).assertEqual(5);
      } else {
        usedGuard31 = false;
      }
      expect(usedGuard31).assertFalse();
      let v32: ESObject = undefined;
      let usedGuard32: boolean = false;
      if (v32 !== undefined) {
        usedGuard32 = true;
        let d: Decimal = new Decimal(v32 as Value);
        expect(d.toNumber()).assertEqual(5);
      } else {
        usedGuard32 = false;
      }
      expect(usedGuard32).assertFalse();
      let a33: ESObject = null;
      let b33: ESObject = undefined;
      expect(a33 === b33).assertFalse();
      let t1_33: boolean = false;
      try {
        let nl: ESObject = null;
        new Decimal(nl as Value);
        expect().assertFail();
      } catch (e) {
        t1_33 = true;
        let err: ESObject = e;
        expect(err.code).assertEqual(401);
      }
      let t2_33: boolean = false;
      try {
        let missing: ESObject = undefined;
        new Decimal(missing as Value);
        expect().assertFail();
      } catch (e) {
        t2_33 = true;
        let err: ESObject = e;
        expect(err.code).assertEqual(401);
      }
      expect(t1_33).assertTrue();
      expect(t2_33).assertTrue();
    });
  });
}
