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

function toFixedExtra(d: Decimal, dp: ESObject, rm: ESObject, extra: ESObject): string {
  let obj: ESObject = d;
  return obj.toFixed(dp, rm, extra) as string;
}

export default function DecimalToFixedTest() {
  describe('DecimalToFixedTest', () => {
    beforeAll(() => {
    });
    beforeEach(async () => {
      await common.sleep(common.DEFAULT_SLEEP_MS);
    });
    afterEach(() => { common.resetDecimalConfig(Decimal); });
    afterAll(() => {
    });


    /**
     * @tc.name testDecimalToFixedPart01Test001
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FIXED_PART01_TEST_0100
     * @tc.desc Verify zero-arg toFixed outputs normal decimal without rounding
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalToFixedPart01Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Decimal(3.456).toFixed()).assertEqual('3.456');
      expect(new Decimal(123).toFixed()).assertEqual('123');
      expect(new Decimal(-0.5).toFixed()).assertEqual('-0.5');
      expect(new Decimal('0.1').toFixed()).assertEqual('0.1');
      expect(new Decimal(0.1).toFixed()).assertEqual('0.1');
      expect(new Decimal('1e21').toFixed()).assertEqual('1000000000000000000000');
      expect(new Decimal('1e-7').toFixed()).assertEqual('0.0000001');
      expect(new Decimal('9007199254740991').toFixed()).assertEqual('9007199254740991');
      expect(new Decimal('9000000000000000').toFixed()).assertEqual('9000000000000000');
      expect(new Decimal('123.4500').toFixed()).assertEqual('123.45');
      expect(new Decimal(-0).toFixed()).assertEqual('0');
      expect(new Decimal('5e-324').toFixed().indexOf('e')).assertEqual(-1);
    });

    /**
     * @tc.name testDecimalToFixedPart01Test079
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FIXED_PART01_TEST_7900
     * @tc.desc Verify special values (NaN/Infinity), return type and purity behavior
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalToFixedPart01Test079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Decimal(NaN).toFixed()).assertEqual('NaN');
      expect(new Decimal(-Infinity).toFixed()).assertEqual('-Infinity');
      expect(new Decimal(Infinity).toFixed(2, Decimal.ROUND_DOWN)).assertEqual('Infinity');
      expect(new Decimal(NaN).toFixed(2, Decimal.ROUND_DOWN)).assertEqual('NaN');
      let d: Decimal = new Decimal(3.456);
      expect(d.toFixed(0b1000, Decimal.ROUND_DOWN) === d.toFixed(8, Decimal.ROUND_DOWN)).assertTrue();
      expect(d.toFixed(1, Decimal.ROUND_CEILING)).assertEqual('3.5');
      expect(d.toFixed(2, Decimal.ROUND_UP) === d.toFixed(2, Decimal.ROUND_DOWN)).assertFalse();
      expect(typeof d.toFixed(2, Decimal.ROUND_DOWN)).assertEqual('string');
      d.toFixed(2, Decimal.ROUND_DOWN);
      expect(d.toString()).assertEqual('3.456');
      expect(d.toFixed(2, Decimal.ROUND_DOWN).length).assertEqual(4);
      expect(d.toFixed(5, Decimal.ROUND_DOWN).length).assertEqual(7);
    });

    /**
     * @tc.name testDecimalToFixedPart01Test004
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FIXED_PART01_TEST_0400
     * @tc.desc Verify decimalPlaces and rounding take effect together in two-arg call
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalToFixedPart01Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(3.456);
      expect(d.toFixed(2, Decimal.ROUND_DOWN)).assertEqual('3.45');
      expect(d.toFixed(0, Decimal.ROUND_HALF_UP)).assertEqual('3');
      expect(d.toFixed(1, Decimal.ROUND_HALF_UP)).assertEqual('3.5');
      expect(d.toFixed(2, Decimal.ROUND_HALF_UP)).assertEqual('3.46');
      expect(d.toFixed(5, Decimal.ROUND_HALF_UP)).assertEqual('3.45600');
      expect(d.toFixed(20, Decimal.ROUND_DOWN)).assertEqual('3.45600000000000000000');
      expect(d.toFixed(100000, Decimal.ROUND_DOWN).length).assertEqual(100002);
      expect(new Decimal(123).toFixed(2, Decimal.ROUND_DOWN)).assertEqual('123.00');
      expect(new Decimal(-3.456).toFixed(2, Decimal.ROUND_HALF_UP)).assertEqual('-3.46');
      expect(d.toFixed(-0, Decimal.ROUND_HALF_UP)).assertEqual('3');
      expect(d.toFixed(0b1000, Decimal.ROUND_DOWN)).assertEqual('3.45600000');
      expect(d.toFixed(1e2, Decimal.ROUND_DOWN) === d.toFixed(100, Decimal.ROUND_DOWN)).assertTrue();
      expect(d.toFixed(1, Decimal.ROUND_DOWN)).assertEqual('3.4');
      expect(d.toFixed(5, Decimal.ROUND_DOWN)).assertEqual('3.45600');
    });

    /**
     * @tc.name testDecimalToFixedPart01Test026
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FIXED_PART01_TEST_2600
     * @tc.desc Verify ROUND_UP rounds positive away from zero
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalToFixedPart01Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(3.456);
      expect(d.toFixed(2, Decimal.ROUND_UP)).assertEqual('3.46');
      expect(d.toFixed(2, Decimal.ROUND_DOWN)).assertEqual('3.45');
      expect(d.toFixed(2, Decimal.ROUND_CEILING)).assertEqual('3.46');
      expect(d.toFixed(2, Decimal.ROUND_FLOOR)).assertEqual('3.45');
      expect(d.toFixed(2, Decimal.ROUND_HALF_UP)).assertEqual('3.46');
      expect(d.toFixed(2, Decimal.ROUND_HALF_DOWN)).assertEqual('3.46');
      expect(d.toFixed(2, Decimal.ROUND_HALF_EVEN)).assertEqual('3.46');
      expect(d.toFixed(2, Decimal.ROUND_HALF_CEILING)).assertEqual('3.46');
      expect(d.toFixed(2, Decimal.ROUND_HALF_FLOOR)).assertEqual('3.46');
      let dn: Decimal = new Decimal(-1.234);
      expect(dn.toFixed(2, Decimal.ROUND_UP)).assertEqual('-1.24');
      expect(dn.toFixed(2, Decimal.ROUND_DOWN)).assertEqual('-1.23');
      expect(dn.toFixed(2, Decimal.ROUND_CEILING)).assertEqual('-1.23');
      expect(dn.toFixed(2, Decimal.ROUND_FLOOR)).assertEqual('-1.24');
    });

    /**
     * @tc.name testDecimalToFixedPart01Test039
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FIXED_PART01_TEST_3900
     * @tc.desc Verify ROUND_HALF_UP tie positive 1.005 carries up
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalToFixedPart01Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let p1: Decimal = new Decimal('1.005');
      expect(p1.toFixed(2, Decimal.ROUND_HALF_UP)).assertEqual('1.01');
      expect(p1.toFixed(2, Decimal.ROUND_HALF_DOWN)).assertEqual('1.00');
      let p2: Decimal = new Decimal('1.015');
      expect(p2.toFixed(2, Decimal.ROUND_HALF_EVEN)).assertEqual('1.02');
      expect(p1.toFixed(2, Decimal.ROUND_HALF_EVEN)).assertEqual('1.00');
      expect(p1.toFixed(2, Decimal.ROUND_HALF_CEILING)).assertEqual('1.01');
      expect(p1.toFixed(2, Decimal.ROUND_HALF_FLOOR)).assertEqual('1.00');
      let n1: Decimal = new Decimal('-1.005');
      expect(n1.toFixed(2, Decimal.ROUND_HALF_UP)).assertEqual('-1.01');
      expect(n1.toFixed(2, Decimal.ROUND_HALF_DOWN)).assertEqual('-1.00');
      expect(n1.toFixed(2, Decimal.ROUND_CEILING)).assertEqual('-1.00');
      expect(n1.toFixed(2, Decimal.ROUND_FLOOR)).assertEqual('-1.01');
      let d: Decimal = new Decimal(3.456);
      expect(d.toFixed(0, Decimal.ROUND_UP)).assertEqual('4');
      expect(d.toFixed(0, Decimal.ROUND_DOWN)).assertEqual('3');
      let dn: Decimal = new Decimal(-3.456);
      expect(dn.toFixed(0, Decimal.ROUND_CEILING)).assertEqual('-3');
      expect(dn.toFixed(0, Decimal.ROUND_FLOOR)).assertEqual('-4');
      let h1: Decimal = new Decimal('3.5');
      expect(h1.toFixed(0, Decimal.ROUND_HALF_UP)).assertEqual('4');
      expect(h1.toFixed(0, Decimal.ROUND_HALF_DOWN)).assertEqual('3');
      expect(h1.toFixed(0, Decimal.ROUND_HALF_EVEN)).assertEqual('4');
      let h2: Decimal = new Decimal('2.5');
      expect(h2.toFixed(0, Decimal.ROUND_HALF_EVEN)).assertEqual('2');
    });

    /**
     * @tc.name testDecimalToFixedPart01Test016
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FIXED_PART01_TEST_1600
     * @tc.desc Verify dp MAX_SAFE_INTEGER out of range throws 10200001
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalToFixedPart01Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(3.456);
      let badDps: ESObject[] = [Number.MAX_SAFE_INTEGER, 9e15, 1e9 + 1, -1, NaN, Infinity, -Infinity, Number.MAX_VALUE, Number.EPSILON, 1.5];
      for (let i: number = 0; i < badDps.length; i++) {
        let errCode: number = -1;
        try {
          d.toFixed(badDps[i] as number, Decimal.ROUND_DOWN);
        } catch (e) {
          errCode = (e as ESObject).code;
        }
        expect(errCode).assertEqual(10200001);
      }
    });

    /**
     * @tc.name testDecimalToFixedPart01Test049
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FIXED_PART01_TEST_4900
     * @tc.desc Verify rounding NaN throws 10200001
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalToFixedPart01Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(3.456);
      let badRms: ESObject[] = [NaN, Infinity, -Infinity, 9, -1, Number.MAX_VALUE, 2.5];
      for (let i: number = 0; i < badRms.length; i++) {
        let errCode: number = -1;
        try {
          d.toFixed(2, badRms[i] as Rounding);
        } catch (e) {
          errCode = (e as ESObject).code;
        }
        expect(errCode).assertEqual(10200001);
      }
    });


    /**
     * @tc.name testDecimalToFixedPart02Test001
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FIXED_PART02_TEST_0100
     * @tc.desc Verify zero-arg overload baseline returns fixed string 3.456 without rounding
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalToFixedPart02Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Decimal(3.456).toFixed()).assertEqual('3.456');
      expect(new Decimal(3.456).toFixed(2)).assertEqual('3.46');
      expect(new Decimal(3.456).toFixed(0)).assertEqual('3');
      expect(new Decimal(3.456).toFixed(1)).assertEqual('3.5');
      expect(new Decimal(3.456).toFixed(5)).assertEqual('3.45600');
      expect(new Decimal(7).toFixed(2)).assertEqual('7.00');
      expect(new Decimal(100).toFixed(0)).assertEqual('100');
      expect(new Decimal(-3.456).toFixed(2)).assertEqual('-3.46');
      expect(new Decimal(0.12345).toFixed(3)).assertEqual('0.123');
      expect(new Decimal(0.99999).toFixed(2)).assertEqual('1.00');
    });

    /**
     * @tc.name testDecimalToFixedPart02Test012
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FIXED_PART02_TEST_1200
     * @tc.desc Verify 1e-7 magnitude with dp=9 pads zeros to 0.000000100
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalToFixedPart02Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Decimal('0.0000001').toFixed(9)).assertEqual('0.000000100');
      expect(new Decimal(3.5).toFixed(20)).assertEqual('3.50000000000000000000');
      let s: string = '123' + '9'.repeat(297);
      expect(new Decimal(s).toFixed(0).substring(0, 3)).assertEqual('123');
      expect(new Decimal(1).toFixed(1000000).length).assertEqual(1000002);
      expect(new Decimal(1).toFixed(100000).substring(0, 4)).assertEqual('1.00');
      expect(new Decimal(9e15).toFixed(2)).assertEqual('9000000000000000.00');
      expect(new Decimal(-3.5).toFixed(20)).assertEqual('-3.50000000000000000000');
      expect(new Decimal('1.25').toFixed(1)).assertEqual('1.3');
      expect(new Decimal('0.5').toFixed(0)).assertEqual('1');
      expect(new Decimal('2.675').toFixed(2)).assertEqual('2.68');
      expect(new Decimal('-0.5').toFixed(0)).assertEqual('-1');
      expect(new Decimal('0.99999').toFixed(1)).assertEqual('1.0');
      let r3: string = new Decimal(3.5).toFixed(4);
      expect(r3).assertEqual('3.5000');
      expect(r3.length).assertEqual(6);
      expect(new Decimal(-3.456).toFixed(1)).assertEqual('-3.5');
      expect(new Decimal('0.0000001').toFixed(1000000).substring(0, 9)).assertEqual('0.0000001');
      expect(new Decimal(9e15).toFixed(0)).assertEqual('9000000000000000');
    });

    /**
     * @tc.name testDecimalToFixedPart02Test023
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FIXED_PART02_TEST_2300
     * @tc.desc Verify dp=-1 negative out-of-range throws 10200001
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalToFixedPart02Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(3.456);
      let badDps: ESObject[] = [-1, -5, -1000000000, 1000000001, NaN, Infinity, -Infinity, 2.5, Number.MAX_SAFE_INTEGER, Number.MAX_VALUE, 0.1, -0.1, 0.000000001];
      for (let i: number = 0; i < badDps.length; i++) {
        try {
          d.toFixed(badDps[i] as number);
          expect().assertFail();
        } catch (e) {
          let err: ESObject = e;
          expect(err.code).assertEqual(10200001);
        }
      }
    });

    /**
     * @tc.name testDecimalToFixedPart02Test003
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FIXED_PART02_TEST_0300
     * @tc.desc Verify one extra arg ignored toFixed(2, 999) still returns 3.46
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalToFixedPart02Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(3.456);
      try {
        let rm: ESObject = 999;
        d.toFixed(2, rm as Rounding);
        expect().assertFail();
      } catch (e) {
        let err: ESObject = e;
        expect(err.code).assertEqual(10200001);
      }
      let badArgs: ESObject[] = [null, true, '', 'abc', {}, '3', '\u200B', ' 2 '];
      for (let i: number = 0; i < badArgs.length; i++) {
        try {
          d.toFixed(badArgs[i] as number);
          expect().assertFail();
        } catch (e) {
          let err: ESObject = e;
          expect(err.code).assertEqual(10200001);
        }
      }
      let cfg: ESObject = { dp: null };
      try {
        d.toFixed(cfg.dp as number);
        expect().assertFail();
      } catch (e) {
        let err: ESObject = e;
        expect(err.code).assertEqual(10200001);
      }
    });

    /**
     * @tc.name testDecimalToFixedPart02Test034
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FIXED_PART02_TEST_3400
     * @tc.desc Verify toFixed with explicit undefined returns the exact unrounded value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalToFixedPart02Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let u: ESObject = undefined;
      expect(new Decimal(3.456).toFixed(u as number)).assertEqual('3.456');
      let wrapper: ESObject = {};
      let missing: ESObject = wrapper.dp;
      expect(new Decimal(3.456).toFixed(missing as number).startsWith('3.456')).assertTrue();
      let d: Decimal = new Decimal(3.456);
      expect(d.toFixed()).assertEqual('3.456');
      let nullThrown: boolean = false;
      let undefThrown: boolean = false;
      try {
        let v: ESObject = null;
        d.toFixed(v as number);
      } catch (e) {
        nullThrown = true;
      }
      try {
        let v: ESObject = undefined;
        d.toFixed(v as number);
      } catch (e) {
        undefThrown = true;
      }
      expect(nullThrown).assertTrue();
      expect(undefThrown).assertFalse();
      let nullThrown2: boolean = false;
      let undefThrown2: boolean = false;
      try {
        let v: ESObject = null;
        new Decimal(1).toFixed(v as number);
      } catch (e) {
        nullThrown2 = true;
      }
      try {
        let v: ESObject = undefined;
        new Decimal(1).toFixed(v as number);
      } catch (e) {
        undefThrown2 = true;
      }
      expect(nullThrown2).assertTrue();
      expect(undefThrown2).assertFalse();
      let d2: Decimal = new Decimal(3.456);
      expect(d2.toFixed()).assertEqual('3.456');
      let thrown1: boolean = false;
      try {
        let v: ESObject = undefined;
        d2.toFixed(v as number);
      } catch (e) {
        thrown1 = true;
      }
      expect(thrown1).assertFalse();
      expect(new Decimal(3.456).toFixed(2)).assertEqual('3.46');
      let thrown2: boolean = false;
      try {
        let v: ESObject = '2';
        new Decimal(3.456).toFixed(v as number);
      } catch (e) {
        thrown2 = true;
      }
      expect(thrown2).assertTrue();
      let r: string = new Decimal(1).toFixed(1);
      expect(typeof r).assertEqual('string');
      let thrown3: boolean = false;
      try {
        let v: ESObject = true;
        new Decimal(1).toFixed(v as number);
      } catch (e) {
        thrown3 = true;
      }
      expect(thrown3).assertTrue();
      let cond: boolean = true;
      let dp1: ESObject = cond ? 2 : undefined;
      expect(new Decimal(3.456).toFixed(dp1 as number)).assertEqual('3.46');
      let dp2: ESObject = cond ? undefined : 2;
      let thrown4: boolean = false;
      try {
        new Decimal(3.456).toFixed(dp2 as number);
      } catch (e) {
        thrown4 = true;
      }
      expect(thrown4).assertFalse();
    });

    /**
     * @tc.name testDecimalToFixedPart02Test055
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FIXED_PART02_TEST_5500
     * @tc.desc Verify DP-COMPOSITE-ENUM dp value range endpoint and NaN behavior
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalToFixedPart02Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Decimal(1.5).toFixed(1)).assertEqual('1.5');
      try {
        new Decimal(1.5).toFixed(NaN);
        expect().assertFail();
      } catch (e) {
        let err: ESObject = e;
        expect(err.code).assertEqual(10200001);
      }
      expect(new Decimal(3.456).toFixed(-0)).assertEqual('3');
      expect(new Decimal(3.456).toFixed(2.0)).assertEqual('3.46');
      expect(new Decimal(3.456).toFixed(3)).assertEqual('3.456');
      let arr: number[] = [0, 2];
      expect(new Decimal(3.456).toFixed(arr[1])).assertEqual('3.46');
      let cfg: Map<string, number> = new Map<string, number>();
      cfg.set('dp', 2);
      expect(new Decimal(3.456).toFixed(cfg.get('dp') as number)).assertEqual('3.46');
    });

    /**
     * @tc.name testDecimalToFixedPart02Test042
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FIXED_PART02_TEST_4200
     * @tc.desc Verify omitted dp does not round while dp=1 rounds 3.44 to 3.4
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalToFixedPart02Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(3.44);
      expect(d.toFixed()).assertEqual('3.44');
      expect(d.toFixed(1)).assertEqual('3.4');
      let r: string = new Decimal(3.456).toFixed(2);
      expect(typeof r).assertEqual('string');
      let d2: Decimal = new Decimal(3.456);
      d2.toFixed(2);
      expect(d2.toString()).assertEqual('3.456');
      let d3: Decimal = new Decimal(3.456);
      let a: string = d3.toFixed(2);
      let b: string = d3.toFixed(2);
      expect(a).assertEqual(b);
      expect(a).assertEqual('3.46');
      let d4: Decimal = new Decimal(3.456);
      expect(d4.toFixed(0)).assertEqual('3');
      expect(d4.toFixed(1)).assertEqual('3.5');
      expect(d4.toFixed(2)).assertEqual('3.46');
    });


    /**
     * @tc.name testDecimalToFixedPart03Test001
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FIXED_PART03_TEST_0100
     * @tc.desc Verify one instance dispatches three overloads with distinct outputs
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalToFixedPart03Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal('3.456');
      expect(d.toFixed()).assertEqual('3.456');
      expect(d.toFixed(2)).assertEqual('3.46');
      expect(d.toFixed(2, Decimal.ROUND_DOWN)).assertEqual('3.45');
      let d2: Decimal = new Decimal('3.5');
      expect(d2.toFixed()).assertEqual('3.5');
      expect(d2.toFixed(0)).assertEqual('4');
      expect(d2.toFixed()).assertEqual('3.5');
      expect(d2.toFixed(0, Decimal.ROUND_DOWN)).assertEqual('3');
      let d3: Decimal = new Decimal('3.456');
      expect(d3.toFixed(2)).assertEqual('3.46');
      expect(d3.toFixed(2, Decimal.ROUND_HALF_UP)).assertEqual('3.46');
      let d4: Decimal = new Decimal('3.456');
      expect(d4.toFixed(2, Decimal.ROUND_DOWN)).assertEqual('3.45');
      expect(toFixedExtra(d4, 2, Decimal.ROUND_DOWN, 99)).assertEqual('3.45');
      let dn: Decimal = new Decimal('-3.456');
      expect(dn.toFixed()).assertEqual('-3.456');
      expect(dn.toFixed(2)).assertEqual('-3.46');
      expect(dn.toFixed(2, Decimal.ROUND_DOWN)).assertEqual('-3.45');
      let ds: Decimal = new Decimal('1e-7');
      let r0: string = ds.toFixed();
      let r1: string = ds.toFixed(0);
      expect(typeof r0).assertEqual('string');
      expect(r1).assertEqual('0');
      expect(r0 !== r1).assertTrue();
      let dl: Decimal = new Decimal('12345.6789');
      expect(dl.toFixed()).assertEqual('12345.6789');
      expect(dl.toFixed(2)).assertEqual('12345.68');
      expect(dl.toFixed(2, Decimal.ROUND_DOWN)).assertEqual('12345.67');
      let dp: Decimal = new Decimal('12345678901234567890123.45');
      expect(dp.toFixed()).assertEqual('12345678901234567890123.45');
      expect(dp.toFixed(2)).assertEqual('12345678901234567890123.45');
      expect(dp.toFixed(4)).assertEqual('12345678901234567890123.4500');
      let di: Decimal = new Decimal('7');
      expect(di.toFixed()).assertEqual('7');
      expect(di.toFixed(2)).assertEqual('7.00');
      expect(di.toFixed(2, Decimal.ROUND_DOWN)).assertEqual('7.00');
    });

    /**
     * @tc.name testDecimalToFixedPart03Test013
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FIXED_PART03_TEST_1300
     * @tc.desc Verify global rounding switch UP to DOWN changes one-arg toFixed(2) output
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalToFixedPart03Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ rounding: Decimal.ROUND_UP });
      let d1: Decimal = new Decimal('2.225');
      let r1: string = d1.toFixed(2);
      Decimal.set({ rounding: Decimal.ROUND_DOWN });
      let r2: string = d1.toFixed(2);
      Decimal.set({ defaults: true });
      expect(r1).assertEqual('2.23');
      expect(r2).assertEqual('2.22');
      Decimal.set({ rounding: Decimal.ROUND_UP });
      let d2: Decimal = new Decimal('3.456');
      let r0: string = d2.toFixed();
      Decimal.set({ defaults: true });
      expect(r0).assertEqual('3.456');
      Decimal.set({ rounding: Decimal.ROUND_UP });
      let d3: Decimal = new Decimal('3.4');
      let r: string = d3.toFixed(0);
      Decimal.set({ defaults: true });
      expect(r).assertEqual('4');
      Decimal.set({ rounding: Decimal.ROUND_UP });
      let d4: Decimal = new Decimal('3.44');
      let r1a: string = d4.toFixed(1);
      Decimal.set({ defaults: true });
      let r2a: string = d4.toFixed(1);
      expect(r1a).assertEqual('3.5');
      expect(r2a).assertEqual('3.4');
      Decimal.set({ rounding: Decimal.ROUND_UP });
      let d5: Decimal = new Decimal('3.44');
      let r1b: string = d5.toFixed(1, Decimal.ROUND_DOWN);
      Decimal.set({ defaults: true });
      expect(r1b).assertEqual('3.4');
      let d6: Decimal = new Decimal('3.44');
      let before: string = d6.toFixed(1);
      Decimal.set({ rounding: Decimal.ROUND_UP });
      let after: string = d6.toFixed(1);
      Decimal.set({ defaults: true });
      expect(before).assertEqual('3.4');
      expect(after).assertEqual('3.5');
      Decimal.set({ rounding: Decimal.ROUND_CEILING });
      let p: Decimal = new Decimal('1.44');
      let n: Decimal = new Decimal('-1.44');
      let rp: string = p.toFixed(1);
      let rn: string = n.toFixed(1);
      Decimal.set({ defaults: true });
      expect(rp).assertEqual('1.5');
      expect(rn).assertEqual('-1.4');
      Decimal.set({ rounding: Decimal.ROUND_DOWN });
      let d7: Decimal = new Decimal('3.5');
      let r0b: string = d7.toFixed();
      let r1c: string = d7.toFixed(0);
      Decimal.set({ defaults: true });
      expect(r0b).assertEqual('3.5');
      expect(r1c).assertEqual('3');
      let a: Decimal = new Decimal('3.456');
      let b: Decimal = new Decimal('3.456');
      Decimal.set({ rounding: Decimal.ROUND_DOWN });
      let ra: string = a.toFixed(2);
      let rb: string = b.toFixed(2);
      Decimal.set({ defaults: true });
      expect(ra).assertEqual('3.45');
      expect(rb).assertEqual('3.45');
    });

    /**
     * @tc.name testDecimalToFixedPart03Test021
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FIXED_PART03_TEST_2100
     * @tc.desc Verify dp=-1 out-of-range throw keeps readonly fields and value intact
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalToFixedPart03Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d1: Decimal = new Decimal('3.456');
      let threw1: boolean = false;
      try { d1.toFixed(-1); } catch (e) { threw1 = true; let err: ESObject = e; expect(err.code).assertEqual(10200001); }
      expect(threw1).assertTrue();
      expect(d1.toString()).assertEqual('3.456');
      expect(d1.s).assertEqual(1);
      expect(d1.e).assertEqual(0);
      let d2: Decimal = new Decimal('3.456');
      let threw2: boolean = false;
      try { d2.toFixed(1e9 + 1); } catch (e) { threw2 = true; let err: ESObject = e; expect(err.code).assertEqual(10200001); }
      expect(threw2).assertTrue();
      expect(d2.toFixed(2)).assertEqual('3.46');
      let d3: Decimal = new Decimal('3.456');
      let threw3: boolean = false;
      try { let rm: ESObject = 9; d3.toFixed(2, rm as Rounding); } catch (e) { threw3 = true; let err: ESObject = e; expect(err.code).assertEqual(10200001); }
      expect(threw3).assertTrue();
      expect(d3.toString()).assertEqual('3.456');
      let d4: Decimal = new Decimal('3.456');
      let threw4: boolean = false;
      try { let rm: ESObject = -1; d4.toFixed(2, rm as Rounding); } catch (e) { threw4 = true; let err: ESObject = e; expect(err.code).assertEqual(10200001); }
      expect(threw4).assertTrue();
      expect(d4.toFixed()).assertEqual('3.456');
      let d5: Decimal = new Decimal('3.456');
      let threw5: boolean = false;
      try { let rm: ESObject = NaN; d5.toFixed(2, rm as Rounding); } catch (e) { threw5 = true; expect(e === null).assertFalse(); }
      expect(threw5).assertTrue();
      expect(d5.toString()).assertEqual('3.456');
      let d6: Decimal = new Decimal('3.456');
      let threw6: boolean = false;
      try { d6.toFixed(2.5); } catch (e) { threw6 = true; expect(e === null).assertFalse(); }
      expect(threw6).assertTrue();
      expect(d6.toString()).assertEqual('3.456');
      let d7: Decimal = new Decimal('3.456');
      try { d7.toFixed(-1); } catch (e) { let err: ESObject = e; expect(err.code).assertEqual(10200001); }
      expect(d7.toFixed()).assertEqual('3.456');
      let d8: Decimal = new Decimal('3.456');
      let ts0: string = d8.toString();
      try { d8.toFixed(-1); } catch (e) { let err: ESObject = e; expect(err.code).assertEqual(10200001); }
      expect(d8.toString()).assertEqual(ts0);
      let d9: Decimal = new Decimal('3.456');
      let beforeD: number[] = d9.d.slice();
      let beforeE: number = d9.e;
      let beforeS: number = d9.s;
      let errorCode: number = -1;
      try { d9.toFixed(-1); } catch (e) { let err: ESObject = e; errorCode = err.code; expect(err.code).assertEqual(10200001); }
      expect(errorCode).assertEqual(10200001);
      let afterD: number[] = d9.d;
      expect(afterD.length).assertEqual(beforeD.length);
      for (let i: number = 0; i < beforeD.length; i++) { expect(afterD[i]).assertEqual(beforeD[i]); }
      expect(d9.e).assertEqual(beforeE);
      expect(d9.s).assertEqual(beforeS);
      let d10: Decimal = new Decimal('3.456');
      try { d10.toFixed(-1); } catch (e) { let err: ESObject = e; expect(err.code).assertEqual(10200001); }
      let sum: Decimal = d10.add(1);
      expect(sum.toString()).assertEqual('4.456');
      let d11: Decimal = new Decimal('3.456');
      for (let i: number = 0; i < 3; i++) {
        let threw: boolean = false;
        try { d11.toFixed(-1); } catch (e) { threw = true; let err: ESObject = e; expect(err.code).assertEqual(10200001); }
        expect(threw).assertTrue();
      }
      expect(d11.toString()).assertEqual('3.456');
      let d12: Decimal = new Decimal('3.456');
      let normal: Decimal = new Decimal('3.456');
      try { let rm: ESObject = 9; d12.toFixed(2, rm as Rounding); } catch (e) { let err: ESObject = e; expect(err.code).assertEqual(10200001); }
      expect(d12.toFixed()).assertEqual(normal.toFixed());
    });

    /**
     * @tc.name testDecimalToFixedPart03Test033
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FIXED_PART03_TEST_3300
     * @tc.desc Verify all three overloads return string type via typeof
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalToFixedPart03Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal('3.456');
      expect(typeof d.toFixed()).assertEqual('string');
      expect(typeof d.toFixed(2)).assertEqual('string');
      expect(typeof d.toFixed(2, Decimal.ROUND_DOWN)).assertEqual('string');
      let r0: string = d.toFixed();
      let r5: string = d.toFixed(5);
      expect(r0.length).assertEqual(5);
      expect(r5.length).assertEqual(7);
      expect(r5).assertEqual('3.45600');
      let r0b: string = d.toFixed(0);
      let r1: string = d.toFixed(1);
      expect(r0b).assertEqual('3');
      expect(r1).assertEqual('3.5');
      expect(r0b.indexOf('.')).assertEqual(-1);
      expect(r1.indexOf('.')).assertEqual(1);
      let r: string = new Decimal('3.456').toFixed(2);
      expect(r.length).assertEqual(4);
      let dn: Decimal = new Decimal('-3.456');
      let rn0: string = dn.toFixed();
      let rn1: string = dn.toFixed(2);
      expect(rn0.charAt(0)).assertEqual('-');
      expect(rn1.charAt(0)).assertEqual('-');
      expect(rn1).assertEqual('-3.46');
      let ri: string = new Decimal('3.456').toFixed(2);
      expect(ri.charAt(0)).assertEqual('3');
      expect(ri.charAt(1)).assertEqual('.');
      expect(ri.charAt(3)).assertEqual('6');
      let dp: Decimal = new Decimal('1.005');
      let n: number = 1.005;
      expect(dp.toFixed(2)).assertEqual('1.01');
      expect(n.toFixed(2)).assertEqual('1.00');
      let dl: Decimal = new Decimal('12345678901234567890123.45');
      expect(dl.toFixed(2)).assertEqual('12345678901234567890123.45');
      expect(new Decimal('1.2').toFixed(8)).assertEqual('1.20000000');
      let dz: Decimal = new Decimal('-0');
      let rz0: string = dz.toFixed();
      let rz1: string = dz.toFixed(0, Decimal.ROUND_UP);
      expect(typeof rz0).assertEqual('string');
      expect(typeof rz1).assertEqual('string');
      expect(rz0 === '0' || rz0 === '-0').assertTrue();
      let rsep: string = new Decimal('1234567.891').toFixed(3);
      expect(rsep.indexOf(',') === -1).assertTrue();
      expect(rsep).assertEqual('1234567.891');
      let di: Decimal = new Decimal('3.456');
      let a: string = di.toFixed(2);
      let b: string = di.toFixed(2);
      expect(a).assertEqual(b);
      let di2: Decimal = new Decimal('3.456');
      let a2: string = di2.toFixed(2, Decimal.ROUND_DOWN);
      let b2: string = di2.toFixed(2, Decimal.ROUND_DOWN);
      expect(a2 === b2).assertTrue();
      expect(a2).assertEqual('3.45');
      let dt: Decimal = new Decimal('3.456');
      let before: string = dt.toString();
      let rt: string = dt.toFixed(2);
      expect(dt.toString()).assertEqual(before);
      expect(rt).assertEqual('3.46');
      let da: Decimal = new Decimal('3.456');
      let db: Decimal = new Decimal('3.456');
      da.toFixed(2);
      expect(db.toString()).assertEqual('3.456');
      let dlen: Decimal = new Decimal('3.456');
      let rf: string = dlen.toFixed(2);
      let ts: string = dlen.toString();
      expect(rf).assertEqual('3.46');
      expect(ts).assertEqual('3.456');
      expect(rf.length !== ts.length).assertTrue();
      let deq: Decimal = new Decimal('3.456');
      let req: string = deq.toFixed(2);
      expect(req === '3.46').assertTrue();
      let ia: Decimal = new Decimal('1.25');
      let ib: Decimal = new Decimal('2.35');
      let ra1: string = ia.toFixed(1);
      let rb1: string = ib.toFixed(1);
      let ra2: string = ia.toFixed(1);
      expect(ra1).assertEqual('1.3');
      expect(rb1).assertEqual('2.4');
      expect(ra2).assertEqual('1.3');
    });

    /**
     * @tc.name testDecimalToFixedPart03Test052
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FIXED_PART03_TEST_5200
     * @tc.desc Verify rounding 0 ROUND_UP rounds away from zero 2.25 to 2.3
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalToFixedPart03Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Decimal('2.25').toFixed(1, Decimal.ROUND_UP)).assertEqual('2.3');
      expect(new Decimal('2.25').toFixed(1, Decimal.ROUND_DOWN)).assertEqual('2.2');
      expect(new Decimal('-2.25').toFixed(1, Decimal.ROUND_CEILING)).assertEqual('-2.2');
      expect(new Decimal('-2.25').toFixed(1, Decimal.ROUND_FLOOR)).assertEqual('-2.3');
      expect(new Decimal('2.25').toFixed(1, Decimal.ROUND_HALF_UP)).assertEqual('2.3');
      expect(new Decimal('2.25').toFixed(1, Decimal.ROUND_HALF_DOWN)).assertEqual('2.2');
      expect(new Decimal('2.25').toFixed(1, Decimal.ROUND_HALF_EVEN)).assertEqual('2.2');
      expect(new Decimal('2.25').toFixed(1, Decimal.ROUND_HALF_CEILING)).assertEqual('2.3');
      expect(new Decimal('2.25').toFixed(1, Decimal.ROUND_HALF_FLOOR)).assertEqual('2.2');
      expect(Decimal.ROUND_HALF_UP).assertEqual(4);
      expect(Decimal.ROUND_DOWN).assertEqual(1);
      expect(Decimal.ROUND_UP).assertEqual(0);
      expect(Decimal.ROUND_CEILING).assertEqual(2);
      expect(Decimal.ROUND_FLOOR).assertEqual(3);
      expect(Decimal.ROUND_HALF_EVEN).assertEqual(6);
      expect(Decimal.ROUND_HALF_CEILING).assertEqual(7);
      expect(Decimal.ROUND_HALF_FLOOR).assertEqual(8);
      let d: Decimal = new Decimal('2.25');
      expect(d.toFixed(1, Decimal.ROUND_UP)).assertEqual('2.3');
      expect(d.toFixed(1, Decimal.ROUND_DOWN)).assertEqual('2.2');
    });

    /**
     * @tc.name testDecimalToFixedPart03Test064
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FIXED_PART03_TEST_6400
     * @tc.desc Verify rounding undefined value 9 beyond enum throws 10200001
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalToFixedPart03Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal('2.25');
      let threw1: boolean = false;
      try { let rm: ESObject = 9; d.toFixed(1, rm as Rounding); } catch (e) { threw1 = true; let err: ESObject = e; expect(err.code).assertEqual(10200001); }
      expect(threw1).assertTrue();
      expect(d.toFixed(1, 0)).assertEqual('2.3');
      expect(d.toFixed(1, 8)).assertEqual('2.2');
      let threw2: boolean = false;
      try { let rm: ESObject = 2.5; d.toFixed(1, rm as Rounding); } catch (e) { threw2 = true; expect(e === null).assertFalse(); }
      expect(threw2).assertTrue();
      let threw3: boolean = false;
      try { let rm: ESObject = NaN; d.toFixed(1, rm as Rounding); } catch (e) { threw3 = true; expect(e === null).assertFalse(); }
      expect(threw3).assertTrue();
      expect(new Decimal('9.9').toFixed(0, Decimal.ROUND_UP)).assertEqual('10');
      expect(new Decimal('-1.26').toFixed(1, Decimal.ROUND_DOWN)).assertEqual('-1.2');
      expect(new Decimal('0.225').toFixed(2, Decimal.ROUND_CEILING)).assertEqual('0.23');
      expect(new Decimal('-2.34567').toFixed(5, Decimal.ROUND_FLOOR)).assertEqual('-2.34567');
      expect(new Decimal('0.5').toFixed(0, Decimal.ROUND_HALF_EVEN)).assertEqual('0');
      expect(new Decimal('0.25').toFixed(1, Decimal.ROUND_HALF_UP)).assertEqual('0.3');
      expect(new Decimal('9.999').toFixed(3, Decimal.ROUND_UP)).assertEqual('9.999');
      let r: string = new Decimal('1.23').toFixed(100, Decimal.ROUND_DOWN);
      expect(r.length).assertEqual(102);
      expect(r.charAt(2)).assertEqual('2');
      expect(r.charAt(101)).assertEqual('0');
    });

    /**
     * @tc.name testDecimalToFixedPart03Test009
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FIXED_PART03_TEST_0900
     * @tc.desc Verify string 2 at dp position probes dynamic dispatch without failing
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalToFixedPart03Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal('3.456');
      let threw1: boolean = false;
      let r1: string = '';
      try { let bad: ESObject = '2'; r1 = d.toFixed(bad as number); } catch (e) { threw1 = true; expect(e === null).assertFalse(); }
      if (!threw1) { expect(typeof r1).assertEqual('string'); }
      let threw2: boolean = false;
      try { let bad: ESObject = true; let r: string = d.toFixed(bad as number); } catch (e) { threw2 = true; expect(e === null).assertFalse(); }
      if (!threw2) { let bad2: ESObject = true; expect(typeof d.toFixed(bad2 as number)).assertEqual('string'); }
      let threw3: boolean = false;
      let r3: string = '';
      try { let und: ESObject = undefined; r3 = d.toFixed(und as number, Decimal.ROUND_DOWN); } catch (e) { threw3 = true; expect(e === null).assertFalse(); }
      if (!threw3) { expect(typeof r3).assertEqual('string'); }
      let d2: Decimal = new Decimal('3.456');
      expect(d2.toFixed(0)).assertEqual('3');
      expect(d2.toFixed(0, Decimal.ROUND_HALF_UP)).assertEqual('3');
      let d3: Decimal = new Decimal('3.456');
      let dpObj: Decimal = new Decimal('2');
      let dpAny: ESObject = dpObj;
      let threw4: boolean = false;
      try { let r: string = d3.toFixed(dpAny as number); } catch (e) { threw4 = true; expect(e === null).assertFalse(); }
      if (!threw4) { expect(typeof d3.toFixed(dpAny as number)).assertEqual('string'); }
      let d4: Decimal = new Decimal('3.456');
      expect(d4.toFixed(0, Decimal.ROUND_UP)).assertEqual('4');
      expect(d4.toFixed(0, Decimal.ROUND_DOWN)).assertEqual('3');
      expect(d4.toFixed(0, Decimal.ROUND_HALF_EVEN)).assertEqual('3');
      let d5: Decimal = new Decimal('3.456');
      let swapped: string = d5.toFixed(Decimal.ROUND_DOWN, 2);
      expect(swapped).assertEqual('3.5');
    });
  });
}
