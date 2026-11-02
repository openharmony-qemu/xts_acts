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

function nearestUnsafe(d: Decimal, n: ESObject, rm: ESObject, extra: ESObject): Decimal {
  let obj: ESObject = d;
  return obj.toNearest(n, rm, extra) as Decimal;
}

type Value = string | number | Decimal;

type Rounding = 0 | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8;

export default function DecimalToNearestTest() {
  describe('DecimalToNearestTest', () => {
    beforeAll(() => {});
    beforeEach(async () => {
      await common.sleep(common.DEFAULT_SLEEP_MS);
    });
    afterEach(() => { common.resetDecimalConfig(Decimal); });
    afterAll(() => {});

    /**
     * @tc.name testDecimalToNearestPart01Test001
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_NEAREST_PART01_TEST_0100
     * @tc.desc Verify basic positive and negative value rounding to nearest multiple with various n
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalToNearestPart01Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let data: Decimal = new Decimal(1.39);
      let data1: Decimal = data.toNearest(0.25);
      expect(data1.toString()).assertEqual('1.5');
      expect(new Decimal(123).toNearest(10).toString()).assertEqual('120');
      expect(new Decimal(126).toNearest(10).toString()).assertEqual('130');
      expect(new Decimal(9.499).toNearest(0.5).toString()).assertEqual('9.5');
      expect(new Decimal(9.1).toNearest(0.5).toString()).assertEqual('9');
      expect(new Decimal(1.37).toNearest(0.25).toString()).assertEqual('1.25');
      expect(new Decimal(15.5).toNearest(1).toString()).assertEqual('16');
      expect(new Decimal(-15.5).toNearest(1).toString()).assertEqual('-16');
      expect(new Decimal(5).toNearest(2).toString()).assertEqual('6');
      expect(new Decimal(3).toNearest(2).toString()).assertEqual('4');
    });

    /**
     * @tc.name testDecimalToNearestPart01Test012
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_NEAREST_PART01_TEST_1200
     * @tc.desc Verify exact multiple unchanged zero and negative zero behavior
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalToNearestPart01Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Decimal(123.45).toNearest(0.05).toString()).assertEqual('123.45');
      expect(new Decimal(0).toNearest(0.25).toString()).assertEqual('0');
      expect(new Decimal(-1.39).toNearest(0.25).toString()).assertEqual('-1.5');
      let r15: Decimal = new Decimal(-0.3).toNearest(1);
      expect(r15.valueOf()).assertEqual('-0');
      let r16: Decimal = new Decimal(-0).toNearest(0.5);
      expect(r16.s).assertEqual(-1);
      expect(r16.valueOf()).assertEqual('-0');
      expect(new Decimal(123456.789).toNearest(0.001).toString()).assertEqual('123456.789');
      expect(new Decimal(123456.789).toNearest(0.0001).toString()).assertEqual('123456.789');
      expect(new Decimal(0.35).toNearest(0.1).toString()).assertEqual('0.4');
      let sum: Decimal = new Decimal(0.1).add(0.3);
      expect(sum.toNearest(0.1).toString()).assertEqual('0.4');
    });

    /**
     * @tc.name testDecimalToNearestPart01Test021
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_NEAREST_PART01_TEST_2100
     * @tc.desc Verify boundary values MAX_SAFE_INTEGER MIN_SAFE_INTEGER MAX_VALUE MIN_VALUE EPSILON scientific
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalToNearestPart01Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Decimal(Number.MAX_SAFE_INTEGER).toNearest(1).toString()).assertEqual('9007199254740991');
      expect(new Decimal(Number.MIN_SAFE_INTEGER).toNearest(1).toString()).assertEqual('-9007199254740991');
      let r23: Decimal = new Decimal(Number.MAX_VALUE).toNearest(1);
      expect(r23.toString()).assertEqual('1.7976931348623157e+308');
      expect(new Decimal(Number.MIN_VALUE).toNearest(1).toString()).assertEqual('0');
      expect(new Decimal(0.1).toNearest(Number.EPSILON).toString()).assertEqual('0.100000000000000085176804919665');
      expect(new Decimal(1e-7).toNearest(1).toString()).assertEqual('0');
      expect(new Decimal(2.5e-7).toNearest(1e-7).toString()).assertEqual('3e-7');
      expect(new Decimal(1e21).toNearest(1).toString()).assertEqual('1e+21');
      expect(new Decimal(1e400).toNearest(1).toString()).assertEqual('Infinity');
      expect(new Decimal(9e15).toNearest(1).toString()).assertEqual('9000000000000000');
      expect(new Decimal(1e-9).toNearest(1).toString()).assertEqual('0');
    });

    /**
     * @tc.name testDecimalToNearestPart01Test032
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_NEAREST_PART01_TEST_3200
     * @tc.desc Verify different n forms negative string Decimal and numeric constants
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalToNearestPart01Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Decimal(-123).toNearest(10).toString()).assertEqual('-120');
      expect(new Decimal(-123.45).toNearest(-0.25).toString()).assertEqual('-123.5');
      expect(new Decimal(1.39).toNearest('0.25').toString()).assertEqual('1.5');
      expect(new Decimal(123).toNearest('10').toString()).assertEqual('120');
      expect(new Decimal(15.5).toNearest(Decimal.ROUND_HALF_UP).toString()).assertEqual('16');
      expect(new Decimal(7.8).toNearest(Decimal.ROUND_DOWN).toString()).assertEqual('8');
      let a38: Decimal = new Decimal(15).toNearest(5);
      let b38: Decimal = new Decimal(15).toNearest('5');
      expect(a38.toString()).assertEqual('15');
      expect(b38.toString()).assertEqual('15');
      let r39: Decimal = new Decimal(1.39).toNearest(new Decimal(0.25));
      expect(r39.toString()).assertEqual('1.5');
      expect(new Decimal(2.5e-7).toNearest('1e-7').toString()).assertEqual('3e-7');
      expect(new Decimal(-1.39).toNearest('-0.25').toString()).assertEqual('-1.5');
    });

    /**
     * @tc.name testDecimalToNearestPart01Test042
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_NEAREST_PART01_TEST_4200
     * @tc.desc Verify return type instance fields and chaining behavior
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalToNearestPart01Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r42: Decimal = new Decimal(1.39).toNearest(0.25);
      expect(typeof r42).assertEqual('object');
      let rec43: Decimal = new Decimal(1.39);
      let r43: Decimal = rec43.toNearest(0.25);
      expect(r43 === rec43).assertFalse();
      let rec44: Decimal = new Decimal(1.39);
      rec44.toNearest(0.25);
      expect(rec44.toString()).assertEqual('1.39');
      let r45: Decimal = new Decimal(1.39).toNearest(0.25);
      expect(r45.s).assertEqual(1);
      expect(r45.d[0]).assertEqual(1);
      expect(r45.d[1]).assertEqual(5000000);
      expect(r45.e).assertEqual(0);
      let r46: Decimal = new Decimal(-1.39).toNearest(0.25);
      expect(r46.s).assertEqual(-1);
      expect(r46.toString()).assertEqual('-1.5');
      let r47: Decimal = new Decimal(1.39).toNearest(0.25);
      expect(r47.toNumber()).assertEqual(1.5);
      let r48: Decimal = new Decimal(1.39).toNearest(0.25).add(1);
      expect(r48.toString()).assertEqual('2.5');
      expect(new Decimal(Infinity).toNearest(0.5).toString()).assertEqual('Infinity');
    });

    /**
     * @tc.name testDecimalToNearestPart01Test002
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_NEAREST_PART01_TEST_0200
     * @tc.desc Verify error path with invalid n values null undefined NaN Infinity empty string
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalToNearestPart01Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let threw: boolean = false;
      try {
        let arg: ESObject = undefined;
        new Decimal(1.39).toNearest(arg as Value);
      } catch (e) {
        threw = true;
        let err: ESObject = e;
        expect(err.code).assertEqual(401);
      }
      expect(threw).assertFalse();

      threw = false;
      try {
        new Decimal(1.39).toNearest(0);
      } catch (e) {
        threw = true;
        let err: ESObject = e;
        expect(err.code).assertEqual(10200001);
      }
      expect(threw).assertFalse();

      threw = false;
      try {
        new Decimal(1.39).toNearest(-5);
      } catch (e) {
        threw = true;
        let err: ESObject = e;
        expect(err.code).assertEqual(10200001);
      }
      expect(threw).assertFalse();

      threw = false;
      try {
        new Decimal(1.39).toNearest(NaN);
      } catch (e) {
        threw = true;
        let err: ESObject = e;
        expect(err.code).assertEqual(10200001);
      }
      expect(threw).assertFalse();

      threw = false;
      try {
        new Decimal(1.39).toNearest(Infinity);
      } catch (e) {
        threw = true;
        let err: ESObject = e;
        expect(err.code).assertEqual(10200001);
      }
      expect(threw).assertFalse();

      threw = false;
      try {
        new Decimal(1.39).toNearest('abc');
      } catch (e) {
        threw = true;
        let err: ESObject = e;
        expect(err.code).assertEqual(401);
      }
      expect(threw).assertTrue();

      threw = false;
      try {
        new Decimal(1.39).toNearest('');
      } catch (e) {
        threw = true;
        let err: ESObject = e;
        expect(err.code).assertEqual(401);
      }
      expect(threw).assertTrue();

      threw = false;
      try {
        let arg: ESObject = null;
        new Decimal(1.39).toNearest(arg as Value);
      } catch (e) {
        threw = true;
        let err: ESObject = e;
        expect(err.code).assertEqual(401);
      }
      expect(threw).assertFalse();

      threw = false;
      try {
        let arg: ESObject = undefined;
        new Decimal(1.39).toNearest(arg as Value);
      } catch (e) {
        threw = true;
        let err: ESObject = e;
        expect(err.code).assertEqual(401);
      }
      expect(threw).assertFalse();

      threw = false;
      try {
        let obj: ESObject = new Decimal(1.39);
        obj.toNearest();
      } catch (e) {
        threw = true;
        let err: ESObject = e;
        expect(err.code).assertEqual(401);
      }
      expect(threw).assertFalse();
    });

    /**
     * @tc.name testDecimalToNearestPart02Test001
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_NEAREST_PART02_TEST_0100
     * @tc.desc Verify missing null undefined no args and nullish handling accepted by runtime
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalToNearestPart02Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: Decimal = new Decimal(3.5);
      let threw: boolean = false;
      try {
        let rm: ESObject = undefined;
        dec.toNearest(1, rm as Rounding);
      } catch (e) {
        threw = true;
        let err: ESObject = e;
        expect(err.code).assertEqual(401);
      }
      expect(threw).assertFalse();
      expect(dec.toString()).assertEqual('3.5');

      threw = false;
      try {
        dec.toNearest(1);
      } catch (e) {
        threw = true;
        let err: ESObject = e;
        expect(err.code).assertEqual(401);
      }
      expect(threw).assertFalse();

      threw = false;
      try {
        let arg: ESObject = undefined;
        dec.toNearest(arg as Value, Decimal.ROUND_UP);
      } catch (e) {
        threw = true;
        let err: ESObject = e;
        expect(err.code).assertEqual(401);
      }
      expect(threw).assertFalse();

      threw = false;
      try {
        let obj: ESObject = dec;
        obj.toNearest();
      } catch (e) {
        threw = true;
        let err: ESObject = e;
        expect(err.code).assertEqual(401);
      }
      expect(threw).assertFalse();

      let dec5: Decimal = new Decimal(9.5);
      let out5: Decimal = nearestUnsafe(dec5, 2, Decimal.ROUND_DOWN, '5');
      expect(out5.toString()).assertEqual('8');

      let dec51: Decimal = new Decimal(3.5);
      threw = false;
      try {
        let rm: ESObject = null;
        dec51.toNearest(1, rm as Rounding);
      } catch (e) {
        threw = true;
        let err: ESObject = e;
        expect(err.code).assertEqual(10200001);
      }
      expect(threw).assertTrue();
      expect(dec51.toString()).assertEqual('3.5');

      let dec52: Decimal = new Decimal(3.5);
      threw = false;
      try {
        let arg: ESObject = null;
        dec52.toNearest(arg as Value, Decimal.ROUND_UP);
      } catch (e) {
        threw = true;
        let err: ESObject = e;
        expect(err.code).assertEqual(401);
      }
      expect(threw).assertFalse();
      expect(dec52.toString()).assertEqual('3.5');

      let dec53: Decimal = new Decimal(3.5);
      threw = false;
      try {
        let arg: ESObject = undefined;
        dec53.toNearest(arg as Value, Decimal.ROUND_DOWN);
      } catch (e) {
        threw = true;
        let err: ESObject = e;
        expect(err.code).assertEqual(401);
      }
      expect(threw).assertFalse();
      expect(dec53.toString()).assertEqual('3.5');

      let dec54: Decimal = new Decimal(3.5);
      threw = false;
      try {
        let arg: ESObject = null;
        dec54.toNearest(arg as Value, Decimal.ROUND_UP);
      } catch (e) {
        threw = true;
        let err: ESObject = e;
        expect(err.code).assertEqual(401);
      }
      expect(threw).assertFalse();
      expect(dec54.add(1).toString()).assertEqual('4.5');

      let dec55: Decimal = new Decimal(3.5);
      threw = false;
      try {
        let arg: ESObject = undefined;
        dec55.toNearest(arg as Value, Decimal.ROUND_UP);
      } catch (e) {
        threw = true;
        let err: ESObject = e;
        expect(err.code).assertEqual(401);
      }
      expect(threw).assertFalse();
      expect(dec55.toString()).assertEqual('3.5');
    });

    /**
     * @tc.name testDecimalToNearestPart02Test006
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_NEAREST_PART02_TEST_0600
     * @tc.desc Verify n form variations and special values with rounding
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalToNearestPart02Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec6: Decimal = new Decimal(3.6);
      let out6: Decimal = dec6.toNearest('-0.5', Decimal.ROUND_UP);
      expect(out6.toString()).assertEqual('4');
      let dec7: Decimal = new Decimal(3.6);
      let out7: Decimal = dec7.toNearest(-0.5, Decimal.ROUND_DOWN);
      expect(out7.toString()).assertEqual('3.5');
      let dec8: Decimal = new Decimal(4.6);
      let ref8: Decimal = new Decimal(0.75);
      let out8: Decimal = dec8.toNearest(ref8, Decimal.ROUND_UP);
      expect(out8.toString()).assertEqual('5.25');
      let dec9: Decimal = new Decimal(6.3);
      let a9: Decimal = dec9.toNearest('2.5', Decimal.ROUND_HALF_UP);
      let b9: Decimal = dec9.toNearest(2.5, Decimal.ROUND_HALF_UP);
      expect(a9.toString()).assertEqual(b9.toString());
      expect(a9.toString()).assertEqual('7.5');
      let dec10: Decimal = new Decimal(6.3);
      let ref10: Decimal = new Decimal(2.5);
      let a10: Decimal = dec10.toNearest(ref10, Decimal.ROUND_HALF_UP);
      let b10: Decimal = dec10.toNearest(2.5, Decimal.ROUND_HALF_UP);
      expect(a10.toString()).assertEqual(b10.toString());
      expect(a10.toString()).assertEqual('7.5');
      let dec11: Decimal = new Decimal(4.4);
      let out11: Decimal = dec11.toNearest(-Infinity, Decimal.ROUND_HALF_DOWN);
      expect(out11.toString()).assertEqual('Infinity');
      let dec12: Decimal = new Decimal(4.4);
      let out12: Decimal = dec12.toNearest(NaN, Decimal.ROUND_CEILING);
      expect(out12.toString()).assertEqual('NaN');
      let dec13: Decimal = new Decimal(-4.4);
      let out13: Decimal = dec13.toNearest(-0, Decimal.ROUND_DOWN);
      expect(out13.toString()).assertEqual('0');
    });

    /**
     * @tc.name testDecimalToNearestPart02Test014
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_NEAREST_PART02_TEST_1400
     * @tc.desc Verify all 9 rounding modes 0 through 8 on tie values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalToNearestPart02Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec14: Decimal = new Decimal(2.5);
      let out14: Decimal = dec14.toNearest(1, 0);
      expect(out14.toString()).assertEqual('3');
      let dec15: Decimal = new Decimal(2.5);
      let out15: Decimal = dec15.toNearest(1, 1);
      expect(out15.toString()).assertEqual('2');
      let dec16: Decimal = new Decimal(-2.5);
      let out16: Decimal = dec16.toNearest(1, 2);
      expect(out16.toString()).assertEqual('-2');
      let dec17: Decimal = new Decimal(-2.5);
      let out17: Decimal = dec17.toNearest(1, 3);
      expect(out17.toString()).assertEqual('-3');
      let dec18: Decimal = new Decimal(2.5);
      let out18: Decimal = dec18.toNearest(1, 4);
      expect(out18.toString()).assertEqual('3');
      let dec19: Decimal = new Decimal(2.5);
      let out19: Decimal = dec19.toNearest(1, 5);
      expect(out19.toString()).assertEqual('2');
      let dec20: Decimal = new Decimal(2.5);
      let out20: Decimal = dec20.toNearest(1, 6);
      expect(out20.toString()).assertEqual('2');
      let dec21: Decimal = new Decimal(-2.5);
      let out21: Decimal = dec21.toNearest(1, 7);
      expect(out21.toString()).assertEqual('-2');
      let dec22: Decimal = new Decimal(-2.5);
      let out22: Decimal = dec22.toNearest(1, 8);
      expect(out22.toString()).assertEqual('-3');
    });

    /**
     * @tc.name testDecimalToNearestPart02Test023
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_NEAREST_PART02_TEST_2300
     * @tc.desc Verify result type fields references and chaining behavior
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalToNearestPart02Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec23: Decimal = new Decimal(6.5);
      let out23: Decimal = dec23.toNearest(2, Decimal.ROUND_UP);
      expect(out23 instanceof Decimal).assertTrue();
      let dec24: Decimal = new Decimal(-8.4);
      let out24: Decimal = dec24.toNearest(2, Decimal.ROUND_UP);
      expect(out24.s).assertEqual(-1);
      expect(out24.toString()).assertEqual('-10');
      let dec25: Decimal = new Decimal(123);
      let out25: Decimal = dec25.toNearest(10, Decimal.ROUND_HALF_UP);
      expect(out25.e).assertEqual(2);
      expect(out25.toString()).assertEqual('120');
      let dec26: Decimal = new Decimal(7.7);
      let out26: Decimal = dec26.toNearest(1, Decimal.ROUND_DOWN);
      expect(out26.d === dec26.d).assertFalse();
      expect(out26.toString()).assertEqual('7');
      let dec27: Decimal = new Decimal(1.25);
      let a27: Decimal = dec27.toNearest(0.5, Decimal.ROUND_HALF_UP);
      let b27: Decimal = dec27.toNearest(0.5, Decimal.ROUND_HALF_UP);
      expect(a27.toString()).assertEqual(b27.toString());
      expect(a27 === b27).assertFalse();
      let dec28: Decimal = new Decimal(0.44);
      let out28: Decimal = dec28.toNearest(0.25, Decimal.ROUND_UP);
      expect(dec28.toString()).assertEqual('0.44');
      expect(out28.toString()).assertEqual('0.5');
      let dec40: Decimal = new Decimal(1.1);
      let out40: Decimal = dec40.toNearest(0.25, Decimal.ROUND_UP);
      expect(out40.toNumber()).assertEqual(1.25);
      let dec41: Decimal = new Decimal(3.7);
      let sum41: Decimal = dec41.toNearest(0.5, Decimal.ROUND_DOWN).add(2);
      expect(sum41.toString()).assertEqual('5.5');
    });

    /**
     * @tc.name testDecimalToNearestPart02Test029
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_NEAREST_PART02_TEST_2900
     * @tc.desc Verify out-of-range rounding and invalid n types throw errors
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalToNearestPart02Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let values: ESObject[] = [9, -1, 100, 0.5, NaN, Infinity];
      for (let i: number = 0; i < values.length; i++) {
        let dec: Decimal = new Decimal(4.6);
        let threw: boolean = false;
        try {
          let rm: ESObject = values[i];
          dec.toNearest(1, rm as Rounding);
        } catch (e) {
          threw = true;
          let err: ESObject = e;
          expect(err.code).assertEqual(10200001);
        }
        expect(threw).assertTrue();
        expect(dec.toString()).assertEqual('4.6');
      }
      let dec36: Decimal = new Decimal(4.6);
      let threw36: boolean = false;
      try {
        let rm: ESObject = '4';
        dec36.toNearest(1, rm as Rounding);
      } catch (e) {
        threw36 = true;
        let err: ESObject = e;
        expect(err.code).assertEqual(10200001);
      }
      expect(threw36).assertTrue();
      expect(dec36.toString()).assertEqual('4.6');
      let invalidN: ESObject[] = [{}, true, '', ' '];
      for (let i: number = 0; i < invalidN.length; i++) {
        let dec: Decimal = new Decimal(4.6);
        let threw: boolean = false;
        try {
          let arg: ESObject = invalidN[i];
          dec.toNearest(arg as Value, Decimal.ROUND_UP);
        } catch (e) {
          threw = true;
          let err: ESObject = e;
          expect(err.code).assertEqual(401);
        }
        expect(threw).assertTrue();
        expect(dec.toString()).assertEqual('4.6');
      }
    });

    /**
     * @tc.name testDecimalToNearestPart02Test042
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_NEAREST_PART02_TEST_4200
     * @tc.desc Verify specific n values and tie values with various roundings
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalToNearestPart02Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec42: Decimal = new Decimal(4.4);
      let a42: Decimal = dec42.toNearest(-0, Decimal.ROUND_DOWN);
      let b42: Decimal = dec42.toNearest(0, Decimal.ROUND_DOWN);
      expect(a42.toString()).assertEqual(b42.toString());
      expect(a42.toString()).assertEqual('0');
      let dec43: Decimal = new Decimal(3.7);
      let out43: Decimal = dec43.toNearest(0, Decimal.ROUND_UP);
      expect(out43.toString()).assertEqual('0');
      let dec44: Decimal = new Decimal(1e21);
      let out44: Decimal = dec44.toNearest(1e21, Decimal.ROUND_DOWN);
      expect(out44.toString()).assertEqual('1e+21');
      let dec45: Decimal = new Decimal(9007199254740991);
      let out45: Decimal = dec45.toNearest(9007199254740991, Decimal.ROUND_UP);
      expect(out45.toString()).assertEqual('9007199254740991');
      let dec46: Decimal = new Decimal(1e-7);
      let out46: Decimal = dec46.toNearest(1e-7, Decimal.ROUND_UP);
      expect(out46.toString()).assertEqual('1e-7');
      let dec47: Decimal = new Decimal(2);
      let out47: Decimal = dec47.toNearest(0.5, Decimal.ROUND_DOWN);
      expect(out47.toString()).assertEqual('2');
      let dec48: Decimal = new Decimal(3.5);
      let out48: Decimal = dec48.toNearest(1, Decimal.ROUND_HALF_UP);
      expect(out48.toString()).assertEqual('4');
      let dec49: Decimal = new Decimal(3.5);
      let out49: Decimal = dec49.toNearest(1, Decimal.ROUND_HALF_EVEN);
      expect(out49.toString()).assertEqual('4');
      let dec50: Decimal = new Decimal(4.5);
      let out50: Decimal = dec50.toNearest(1, Decimal.ROUND_HALF_EVEN);
      expect(out50.toString()).assertEqual('4');
    });

    /**
     * @tc.name testDecimalToNearestPart02Test056
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_NEAREST_PART02_TEST_5600
     * @tc.desc Verify DP-COMPOSITE-MULTI-PARAM coverage across n type and rounding combinations
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalToNearestPart02Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec56: Decimal = new Decimal(7.5);
      let out56: Decimal = dec56.toNearest('2', Decimal.ROUND_HALF_CEILING);
      expect(out56.toString()).assertEqual('8');
      let dec57: Decimal = new Decimal(7.5);
      let out57: Decimal = dec57.toNearest('2', Decimal.ROUND_HALF_FLOOR);
      expect(out57.toString()).assertEqual('8');
      let dec58: Decimal = new Decimal(7.5);
      let ref58: Decimal = new Decimal(2);
      let out58: Decimal = dec58.toNearest(ref58, Decimal.ROUND_HALF_UP);
      expect(out58.toString()).assertEqual('8');
      let dec59: Decimal = new Decimal(8.4);
      let out59: Decimal = dec59.toNearest(3, Decimal.ROUND_FLOOR);
      expect(out59.toString()).assertEqual('6');
      let dec60: Decimal = new Decimal(8.4);
      let ref60: Decimal = new Decimal(3);
      let out60: Decimal = dec60.toNearest(ref60, Decimal.ROUND_CEILING);
      expect(out60.toString()).assertEqual('9');
    });

    /**
     * @tc.name testDecimalToNearestPart03Test001
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_NEAREST_PART03_TEST_0100
     * @tc.desc Verify single-arg default vs explicit rounding on tie and non-tie values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalToNearestPart03Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec1: Decimal = new Decimal(2.5);
      Decimal.set({ defaults: true });
      let out1: Decimal = dec1.toNearest(1);
      expect(out1.toString()).assertEqual('3');
      let dec2: Decimal = new Decimal(2.5);
      let out2: Decimal = dec2.toNearest(1, Decimal.ROUND_HALF_DOWN);
      expect(out2.toString()).assertEqual('2');
      let dec3: Decimal = new Decimal(2.7);
      let out3: Decimal = dec3.toNearest(1);
      expect(out3.toString()).assertEqual('3');
      let dec4: Decimal = new Decimal(2.7);
      let out4: Decimal = dec4.toNearest(1, Decimal.ROUND_UP);
      expect(out4.toString()).assertEqual('3');
      let dec5: Decimal = new Decimal(-2.5);
      Decimal.set({ defaults: true });
      let out5: Decimal = dec5.toNearest(1);
      expect(out5.toString()).assertEqual('-3');
      let dec6: Decimal = new Decimal(-2.5);
      let out6: Decimal = dec6.toNearest(1, Decimal.ROUND_DOWN);
      expect(out6.toString()).assertEqual('-2');
      let dec7: Decimal = new Decimal(1.25);
      Decimal.set({ defaults: true });
      let a7: Decimal = dec7.toNearest(0.5);
      let b7: Decimal = dec7.toNearest(0.5, Decimal.ROUND_HALF_UP);
      expect(a7.toString()).assertEqual('1.5');
      expect(b7.toString()).assertEqual('1.5');
      let dec8: Decimal = new Decimal(1.25);
      let out8: Decimal = dec8.toNearest(0.5, Decimal.ROUND_HALF_DOWN);
      expect(out8.toString()).assertEqual('1');
    });

    /**
     * @tc.name testDecimalToNearestPart03Test009
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_NEAREST_PART03_TEST_0900
     * @tc.desc Verify n=0 non-tie negative small multiple HALF_CEILING HALF_FLOOR diverge from default
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalToNearestPart03Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec9: Decimal = new Decimal(3.7);
      let out9: Decimal = dec9.toNearest(0);
      expect(out9.toString()).assertEqual('0');
      let dec10: Decimal = new Decimal(3.7);
      let out10: Decimal = dec10.toNearest(0, Decimal.ROUND_UP);
      expect(out10.toString()).assertEqual('0');
      let dec11: Decimal = new Decimal(9.499);
      let single11: Decimal = dec11.toNearest(0.5);
      let up11: Decimal = dec11.toNearest(0.5, Decimal.ROUND_UP);
      expect(up11.toString()).assertEqual('9.5');
      expect(single11.toString()).assertEqual('9.5');
      let dec12: Decimal = new Decimal(9.499);
      let single12: Decimal = dec12.toNearest(0.5);
      let down12: Decimal = dec12.toNearest(0.5, Decimal.ROUND_DOWN);
      expect(down12.toString()).assertEqual('9');
      expect(single12.toString() === down12.toString()).assertFalse();
      let dec13: Decimal = new Decimal(-2.2);
      let single13: Decimal = dec13.toNearest(1);
      let ceil13: Decimal = dec13.toNearest(1, Decimal.ROUND_CEILING);
      expect(ceil13.toString()).assertEqual('-2');
      expect(single13.toString()).assertEqual('-2');
      let dec14: Decimal = new Decimal(-2.2);
      let single14: Decimal = dec14.toNearest(1);
      let floor14: Decimal = dec14.toNearest(1, Decimal.ROUND_FLOOR);
      expect(floor14.toString()).assertEqual('-3');
      expect(single14.toString() === floor14.toString()).assertFalse();
      let dec15: Decimal = new Decimal(2.5);
      Decimal.set({ defaults: true });
      let single15: Decimal = dec15.toNearest(1);
      let even15: Decimal = dec15.toNearest(1, Decimal.ROUND_HALF_EVEN);
      expect(even15.toString()).assertEqual('2');
      expect(single15.toString()).assertEqual('3');
      let dec16: Decimal = new Decimal(-1.5);
      let out16: Decimal = dec16.toNearest(1, Decimal.ROUND_HALF_CEILING);
      expect(out16.toString()).assertEqual('-1');
      let dec17: Decimal = new Decimal(-1.5);
      let out17: Decimal = dec17.toNearest(1, Decimal.ROUND_HALF_FLOOR);
      expect(out17.toString()).assertEqual('-2');
      let dec18: Decimal = new Decimal(1.39);
      let single18: Decimal = dec18.toNearest(0.25);
      let up18: Decimal = dec18.toNearest(0.25, Decimal.ROUND_UP);
      expect(up18.toString()).assertEqual('1.5');
      expect(single18.toString()).assertEqual('1.5');
      let dec19: Decimal = new Decimal(1.39);
      let single19: Decimal = dec19.toNearest(0.25);
      let down19: Decimal = dec19.toNearest(0.25, Decimal.ROUND_DOWN);
      expect(down19.toString()).assertEqual('1.25');
      expect(single19.toString() === down19.toString()).assertFalse();
    });

    /**
     * @tc.name testDecimalToNearestPart03Test020
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_NEAREST_PART03_TEST_2000
     * @tc.desc Verify missing null undefined and invalid string n handling
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalToNearestPart03Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec20: Decimal = new Decimal(4.6);
      let threw20: boolean = false;
      try {
        let missing: ESObject = undefined;
        dec20.toNearest(missing as Value);
      } catch (e) {
        threw20 = true;
        let err: ESObject = e;
        expect(err.code).assertEqual(401);
      }
      expect(threw20).assertFalse();
      expect(dec20.toString()).assertEqual('4.6');
      let dec21: Decimal = new Decimal(4.6);
      let threw21: boolean = false;
      try {
        let nl: ESObject = null;
        dec21.toNearest(nl as Value);
      } catch (e) {
        threw21 = true;
        let err: ESObject = e;
        expect(err.code).assertEqual(401);
      }
      expect(threw21).assertFalse();
      expect(dec21.toString()).assertEqual('4.6');
      let dec22: Decimal = new Decimal(4.6);
      let threw22: boolean = false;
      try {
        dec22.toNearest('abc');
      } catch (e) {
        threw22 = true;
        let err: ESObject = e;
        expect(err.code).assertEqual(401);
      }
      expect(threw22).assertTrue();
      expect(dec22.toString()).assertEqual('4.6');
      let dec23: Decimal = new Decimal(4.6);
      let threw23: boolean = false;
      try {
        dec23.toNearest('abc', Decimal.ROUND_UP);
      } catch (e) {
        threw23 = true;
        let err: ESObject = e;
        expect(err.code).assertEqual(401);
      }
      expect(threw23).assertTrue();
      expect(dec23.toString()).assertEqual('4.6');
    });

    /**
     * @tc.name testDecimalToNearestPart03Test024
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_NEAREST_PART03_TEST_2400
     * @tc.desc Verify result type fields references receiver unchanged and arithmetic chaining
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalToNearestPart03Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec24: Decimal = new Decimal(6.5);
      Decimal.set({ defaults: true });
      let single24: Decimal = dec24.toNearest(1);
      let up24: Decimal = dec24.toNearest(1, Decimal.ROUND_HALF_UP);
      expect(single24 instanceof Decimal).assertTrue();
      expect(single24.toNumber()).assertEqual(7);
      expect(single24.toNumber()).assertEqual(7);
      let dec25: Decimal = new Decimal(-6.5);
      let down25: Decimal = dec25.toNearest(1, Decimal.ROUND_HALF_DOWN);
      expect(down25 instanceof Decimal).assertTrue();
      expect(down25.toNumber()).assertEqual(-6);
      let dec26: Decimal = new Decimal(-8.4);
      let out26: Decimal = dec26.toNearest(2);
      expect(out26.s).assertEqual(-1);
      expect(out26.toString()).assertEqual('-8');
      let dec27: Decimal = new Decimal(-8.4);
      let out27: Decimal = dec27.toNearest(2, Decimal.ROUND_UP);
      expect(out27.s).assertEqual(-1);
      expect(out27.toString()).assertEqual('-10');
      let dec28: Decimal = new Decimal(12.3);
      let single28: Decimal = dec28.toNearest(5);
      let ceil28: Decimal = dec28.toNearest(5, Decimal.ROUND_CEILING);
      expect(single28.e).assertEqual(ceil28.e);
      expect(single28.toString()).assertEqual('10');
      let dec29: Decimal = new Decimal(12.3);
      let single29: Decimal = dec29.toNearest(5);
      let floor29: Decimal = dec29.toNearest(5, Decimal.ROUND_FLOOR);
      expect(floor29.toString()).assertEqual('10');
      expect(single29.toString() === floor29.toString()).assertTrue();
      let dec30: Decimal = new Decimal(7.7);
      let out30: Decimal = dec30.toNearest(1);
      expect(out30.d === dec30.d).assertFalse();
      expect(out30.toString()).assertEqual('8');
      let dec31: Decimal = new Decimal(7.7);
      let out31: Decimal = dec31.toNearest(1, Decimal.ROUND_DOWN);
      expect(out31.d === dec31.d).assertFalse();
      expect(out31.toString()).assertEqual('7');
      let dec32: Decimal = new Decimal(3.5);
      let a32: Decimal = dec32.toNearest(1);
      let b32: Decimal = dec32.toNearest(1);
      expect(a32.toString()).assertEqual(b32.toString());
      expect(a32 === b32).assertFalse();
      let dec33: Decimal = new Decimal(3.5);
      let a33: Decimal = dec33.toNearest(1, Decimal.ROUND_HALF_UP);
      let b33: Decimal = dec33.toNearest(1, Decimal.ROUND_HALF_UP);
      expect(a33.toString()).assertEqual(b33.toString());
      expect(a33 === b33).assertFalse();
      let dec34: Decimal = new Decimal(0.44);
      let a34: Decimal = dec34.toNearest(0.25);
      let b34: Decimal = dec34.toNearest(0.25, Decimal.ROUND_HALF_UP);
      expect(a34.equals(b34)).assertTrue();
      expect(a34 === b34).assertFalse();
      let dec35: Decimal = new Decimal(0.44);
      let out35: Decimal = dec35.toNearest(0.25);
      expect(dec35.toString()).assertEqual('0.44');
      expect(out35.toString()).assertEqual('0.5');
      let dec36: Decimal = new Decimal(0.44);
      let out36: Decimal = dec36.toNearest(0.25, Decimal.ROUND_HALF_UP);
      expect(dec36.toString()).assertEqual('0.44');
      expect(out36.toString()).assertEqual('0.5');
      let dec37: Decimal = new Decimal(11.4);
      let a37: Decimal = dec37.toNearest(3);
      let b37: Decimal = dec37.toNearest(3, Decimal.ROUND_HALF_UP);
      let sum37: Decimal = a37.add(b37);
      expect(sum37.toString()).assertEqual('24');
    });

    /**
     * @tc.name testDecimalToNearestPart03Test038
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_NEAREST_PART03_TEST_3800
     * @tc.desc Verify union member dispatch string number Decimal across overloads
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalToNearestPart03Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec38: Decimal = new Decimal(2.3);
      let s38: Decimal = dec38.toNearest('1');
      let num38: Decimal = dec38.toNearest(1);
      expect(s38.toString()).assertEqual(num38.toString());
      expect(s38.toString()).assertEqual('2');
      let dec39: Decimal = new Decimal(2.3);
      let ref39: Decimal = new Decimal(0.5);
      let s39: Decimal = dec39.toNearest('0.5', Decimal.ROUND_UP);
      let d39: Decimal = dec39.toNearest(ref39, Decimal.ROUND_UP);
      expect(s39.toString()).assertEqual(d39.toString());
      expect(s39.toString()).assertEqual('2.5');
      let dec40: Decimal = new Decimal(5.2);
      let ref40: Decimal = new Decimal(1);
      let a40: Decimal = dec40.toNearest(1);
      let b40: Decimal = dec40.toNearest('1');
      let c40: Decimal = dec40.toNearest(ref40);
      expect(a40.toString()).assertEqual('5');
      expect(b40.toString()).assertEqual('5');
      expect(c40.toString()).assertEqual('5');
      let dec41: Decimal = new Decimal(5.2);
      let ref41: Decimal = new Decimal(1);
      let a41: Decimal = dec41.toNearest(1, Decimal.ROUND_UP);
      let b41: Decimal = dec41.toNearest('1', Decimal.ROUND_UP);
      let c41: Decimal = dec41.toNearest(ref41, Decimal.ROUND_UP);
      expect(a41.toString()).assertEqual('6');
      expect(b41.toString()).assertEqual('6');
      expect(c41.toString()).assertEqual('6');
      let dec42: Decimal = new Decimal(2.8);
      let ref42: Decimal = new Decimal(0.5);
      expect(dec42.toNearest(0.5).toString()).assertEqual('3');
      expect(dec42.toNearest('0.5').toString()).assertEqual('3');
      expect(dec42.toNearest(ref42).toString()).assertEqual('3');
      expect(dec42.toNearest(0).toString()).assertEqual('0');
      let dec43: Decimal = new Decimal(2.8);
      let normal43: Decimal = dec43.toNearest(0.5);
      let threw43: boolean = false;
      try {
        let nl: ESObject = null;
        dec43.toNearest(nl as Value);
      } catch (e) {
        threw43 = true;
        let err: ESObject = e;
        expect(err.code).assertEqual(401);
      }
      expect(normal43.toString()).assertEqual('3');
      expect(threw43).assertFalse();
      let dec44: Decimal = new Decimal(2.8);
      let normal44: Decimal = dec44.toNearest('0.5');
      let threw44: boolean = false;
      try {
        let missing: ESObject = undefined;
        dec44.toNearest(missing as Value);
      } catch (e) {
        threw44 = true;
        let err: ESObject = e;
        expect(err.code).assertEqual(401);
      }
      expect(normal44.toString()).assertEqual('3');
      expect(threw44).assertFalse();
      let dec45: Decimal = new Decimal(9.4);
      let ref45: Decimal = new Decimal(1);
      let a45: Decimal = dec45.toNearest(ref45, Decimal.ROUND_HALF_UP);
      let b45: Decimal = dec45.toNearest('1', Decimal.ROUND_HALF_UP);
      expect(a45.toString()).assertEqual(b45.toString());
      expect(a45.toString()).assertEqual('9');
      let dec46: Decimal = new Decimal(9.4);
      let ref46: Decimal = new Decimal(1);
      let a46: Decimal = dec46.toNearest(1, Decimal.ROUND_UP);
      let b46: Decimal = dec46.toNearest(ref46, Decimal.ROUND_UP);
      expect(a46.toString()).assertEqual('10');
      expect(b46.toString()).assertEqual('10');
    });

    /**
     * @tc.name testDecimalToNearestPart03Test047
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_NEAREST_PART03_TEST_4700
     * @tc.desc Verify special n values NaN Infinity -0 1e21 5e-324 string Decimal with various roundings
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalToNearestPart03Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec47: Decimal = new Decimal(4.4);
      let out47: Decimal = dec47.toNearest(NaN);
      expect(out47.toString()).assertEqual('NaN');
      let dec48: Decimal = new Decimal(4.4);
      let out48: Decimal = dec48.toNearest(Infinity);
      expect(out48.toString()).assertEqual('Infinity');
      let dec49: Decimal = new Decimal(4.4);
      let out49: Decimal = dec49.toNearest(-Infinity, Decimal.ROUND_HALF_UP);
      expect(out49.toString()).assertEqual('Infinity');
      let dec50: Decimal = new Decimal(-4.4);
      let out50: Decimal = dec50.toNearest(-0);
      expect(out50.toString()).assertEqual('0');
      let dec51: Decimal = new Decimal(1e21);
      let out51: Decimal = dec51.toNearest(1e21);
      expect(out51.toString()).assertEqual('1e+21');
      let dec52: Decimal = new Decimal(0.37);
      let out52: Decimal = dec52.toNearest(5e-324);
      expect(out52.toString()).assertEqual('0.37');
      let dec53: Decimal = new Decimal(7.5);
      let up53: Decimal = dec53.toNearest('2', Decimal.ROUND_HALF_UP);
      let down53: Decimal = dec53.toNearest('2', Decimal.ROUND_HALF_DOWN);
      expect(up53.toString()).assertEqual('8');
      expect(down53.toString()).assertEqual('8');
      let dec54: Decimal = new Decimal(7.5);
      let ref54: Decimal = new Decimal(2);
      let out54: Decimal = dec54.toNearest(ref54, Decimal.ROUND_UP);
      expect(out54.toString()).assertEqual('8');
      let dec55: Decimal = new Decimal(-7.5);
      let out55: Decimal = dec55.toNearest(2, Decimal.ROUND_CEILING);
      expect(out55.toString()).assertEqual('-6');
      let dec56: Decimal = new Decimal(-7.5);
      let out56: Decimal = dec56.toNearest('2', Decimal.ROUND_FLOOR);
      expect(out56.toString()).assertEqual('-8');
      let dec57: Decimal = new Decimal(-7.5);
      let ref57: Decimal = new Decimal(2);
      let out57: Decimal = dec57.toNearest(ref57, Decimal.ROUND_HALF_EVEN);
      expect(out57.toString()).assertEqual('-8');
    });
  });
}
