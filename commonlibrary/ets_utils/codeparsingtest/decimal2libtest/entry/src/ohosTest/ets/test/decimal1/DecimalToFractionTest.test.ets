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

type Value = string | number | Decimal;

function toFractionExtra3(d: Decimal, a: ESObject, b: ESObject, c: ESObject): Decimal[] {
  let obj: ESObject = d;
  return obj.toFraction(a, b, c) as Decimal[];
}

function toFractionUnsafe2(d: Decimal, a: ESObject, b: ESObject): Decimal[] {
  let obj: ESObject = d;
  return obj.toFraction(a, b) as Decimal[];
}

function toFractionUnsafe3(d: Decimal, a: ESObject, b: ESObject, c: ESObject): Decimal[] {
  let obj: ESObject = d;
  return obj.toFraction(a, b, c) as Decimal[];
}

export default function DecimalToFractionTest() {
  describe('DecimalToFractionTest', () => {
    beforeAll(() => {
    });
    beforeEach(async () => {
      await common.sleep(common.DEFAULT_SLEEP_MS);
    });
    afterEach(() => { common.resetDecimalConfig(Decimal); });
    afterAll(() => {
    });

    /**
     * @tc.name testDecimalToFractionPart01Test001
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FRACTION_PART01_TEST_0100
     * @tc.desc Verify zero-arg toFraction returns exact fraction array for legal arity
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalToFractionPart01Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let decimal1: Decimal[] = new Decimal(1.75).toFraction();
      expect(decimal1.length).assertEqual(2);
      expect(decimal1[0].toString()).assertEqual('7');
      expect(decimal1[1].toString()).assertEqual('4');
      let decimal2: Decimal[] = new Decimal(3.456).toFraction();
      expect(decimal2[0].toString()).assertEqual('432');
      expect(decimal2[1].toString()).assertEqual('125');
      let decimal3: Decimal[] = new Decimal(0.55).toFraction();
      expect(decimal3[0].toString()).assertEqual('11');
      expect(decimal3[1].toString()).assertEqual('20');
      let decimal4: Decimal[] = new Decimal(7.5).toFraction();
      expect(decimal4[0].toString()).assertEqual('15');
      expect(decimal4[1].toString()).assertEqual('2');
      let decimal5: Decimal[] = new Decimal(0.875).toFraction();
      expect(decimal5[0].toString()).assertEqual('7');
      expect(decimal5[1].toString()).assertEqual('8');
      let decimal6: Decimal[] = new Decimal(2.125).toFraction();
      expect(decimal6[0].toString()).assertEqual('17');
      expect(decimal6[1].toString()).assertEqual('8');
      let decimal7: Decimal[] = new Decimal(0.6).toFraction();
      expect(decimal7[0].toString()).assertEqual('3');
      expect(decimal7[1].toString()).assertEqual('5');
      let decimal8: Decimal[] = new Decimal(0.9).toFraction();
      expect(decimal8[0].toString()).assertEqual('9');
      expect(decimal8[1].toString()).assertEqual('10');
      let decimal9: Decimal[] = new Decimal('1.999999999999999999999').toFraction();
      expect(decimal9[0].toString()).assertEqual('1.999999999999999999999e+21');
      expect(decimal9[1].toString()).assertEqual('1e+21');
    });

    /**
     * @tc.name testDecimalToFractionPart01Test013
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FRACTION_PART01_TEST_1300
     * @tc.desc Verify 5.5 converts to fraction 11/2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalToFractionPart01Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let decimal1: Decimal[] = new Decimal(5.5).toFraction();
      expect(decimal1[0].toString()).assertEqual('11');
      expect(decimal1[1].toString()).assertEqual('2');
      let decimal2: Decimal[] = new Decimal(100).toFraction();
      expect(decimal2[0].toString()).assertEqual('100');
      expect(decimal2[1].toString()).assertEqual('1');
      let decimal3: Decimal[] = new Decimal(Number.MAX_SAFE_INTEGER).toFraction();
      expect(decimal3[0].toString()).assertEqual('9007199254740991');
      expect(decimal3[1].toString()).assertEqual('1');
      let decimal4: Decimal[] = new Decimal(Number.MIN_SAFE_INTEGER).toFraction();
      expect(decimal4[0].toString()).assertEqual('-9007199254740991');
      expect(decimal4[1].toString()).assertEqual('1');
      let decimal5: Decimal[] = new Decimal(9e15).toFraction();
      expect(decimal5[0].toString()).assertEqual('9000000000000000');
      expect(decimal5[1].toString()).assertEqual('1');
      let decimal6: Decimal[] = new Decimal(-9e15).toFraction();
      expect(decimal6[0].toString()).assertEqual('-9000000000000000');
      expect(decimal6[1].toString()).assertEqual('1');
      let decimal7: Decimal[] = new Decimal(1e9).toFraction();
      expect(decimal7[0].toString()).assertEqual('1000000000');
      expect(decimal7[1].toString()).assertEqual('1');
      let decimal8: Decimal[] = new Decimal(1e21).toFraction();
      expect(decimal8[0].toString()).assertEqual('1e+21');
      expect(decimal8[1].toString()).assertEqual('1');
      let decimal9: Decimal[] = new Decimal(-1e21).toFraction();
      expect(decimal9[0].toString()).assertEqual('-1e+21');
      expect(decimal9[1].toString()).assertEqual('1');
      let decimal10: Decimal[] = new Decimal(1.5e2).toFraction();
      expect(decimal10[0].toString()).assertEqual('150');
      expect(decimal10[1].toString()).assertEqual('1');
      let decimal11: Decimal[] = new Decimal('1e-7').toFraction();
      expect(decimal11[0].toString()).assertEqual('1');
      expect(decimal11[1].toString()).assertEqual('10000000');
      let decimal12: Decimal[] = new Decimal(0x10).toFraction();
      expect(decimal12[0].toString()).assertEqual('16');
      expect(decimal12[1].toString()).assertEqual('1');
      let decimal13: Decimal[] = new Decimal(2.5e-1).toFraction();
      expect(decimal13[0].toString()).assertEqual('1');
      expect(decimal13[1].toString()).assertEqual('4');
    });

    /**
     * @tc.name testDecimalToFractionPart01Test014
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FRACTION_PART01_TEST_1400
     * @tc.desc Verify -1.75 converts to fraction -7/4 with sign on numerator
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalToFractionPart01Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let decimal1: Decimal[] = new Decimal('-1.75').toFraction();
      expect(decimal1[0].toString()).assertEqual('-7');
      expect(decimal1[1].toString()).assertEqual('4');
      let decimal2: Decimal[] = new Decimal('-123.456').toFraction();
      expect(decimal2[0].toString()).assertEqual('-15432');
      expect(decimal2[1].toString()).assertEqual('125');
      let decimal3: Decimal[] = new Decimal(-0.5).toFraction();
      expect(decimal3[0].toString()).assertEqual('-1');
      expect(decimal3[1].toString()).assertEqual('2');
      let decimal4: Decimal[] = new Decimal(-7.5).toFraction();
      expect(decimal4[0].toString()).assertEqual('-15');
      expect(decimal4[1].toString()).assertEqual('2');
      let decimal5: Decimal[] = new Decimal('-2.5e-1').toFraction();
      expect(decimal5[0].toString()).assertEqual('-1');
      expect(decimal5[1].toString()).assertEqual('4');
    });

    /**
     * @tc.name testDecimalToFractionPart01Test031
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FRACTION_PART01_TEST_3100
     * @tc.desc Verify NaN receiver returns array of NaN copies without throwing
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalToFractionPart01Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let decimal1: Decimal[] = new Decimal(NaN).toFraction();
      expect(decimal1.length).assertUndefined();
      expect(decimal1[0]).assertUndefined();
      expect(decimal1[1]).assertUndefined();
      let decimal2: Decimal[] = new Decimal(Infinity).toFraction();
      expect(decimal2.length).assertUndefined();
      expect(decimal2[0]).assertUndefined();
      expect(decimal2[1]).assertUndefined();
      let decimal3: Decimal[] = new Decimal(-Infinity).toFraction();
      expect(decimal3.length).assertUndefined();
      expect(decimal3[0]).assertUndefined();
      expect(decimal3[1]).assertUndefined();
      let decimal4: Decimal[] = new Decimal(0).toFraction();
      expect(decimal4[0].toString()).assertEqual('0');
      expect(decimal4[1].toString()).assertEqual('1');
      let decimal5: Decimal[] = new Decimal(-0).toFraction();
      expect(decimal5[0].toString()).assertEqual('0');
      expect(decimal5[1].toString()).assertEqual('1');
      let decimal6: Decimal[] = new Decimal(1e+400).toFraction();
      expect(decimal6.length).assertUndefined();
      expect(decimal6[0]).assertUndefined();
      expect(decimal6[1]).assertUndefined();
      let decimal7: Decimal[] = new Decimal('1e-400').toFraction();
      expect(decimal7[0].toString()).assertEqual('1');
      expect(decimal7[1].toString()).assertEqual('1e+400');
      let decimal8: Decimal[] = new Decimal(NaN).toFraction();
      expect(decimal8[0]).assertUndefined();
      expect(decimal8[1]).assertUndefined();
      let ok: boolean = true;
      try {
        let data: Decimal[] = new Decimal(NaN).toFraction();
        if (data.length !== undefined) { ok = false; }
      } catch (e) {
        let err: ESObject = e;
        expect(err.code !== undefined).assertTrue();
      }
      expect(ok).assertTrue();
      let decimal9: Decimal[] = new Decimal(1e+400).toFraction();
      expect(decimal9[0]).assertUndefined();
      expect(decimal9[1]).assertUndefined();
    });

    /**
     * @tc.name testDecimalToFractionPart01Test011
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FRACTION_PART01_TEST_1100
     * @tc.desc Verify high precision decimal keeps all significant fraction digits
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalToFractionPart01Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let decimal1: Decimal[] = new Decimal('123456789.123456789').toFraction();
      expect(decimal1[0].toString()).assertEqual('123456789123456789');
      expect(decimal1[1].toString()).assertEqual('1000000000');
      let decimal2: Decimal[] = new Decimal(0.001).toFraction();
      expect(decimal2[0].toString()).assertEqual('1');
      expect(decimal2[1].toString()).assertEqual('1000');
      let decimal3: Decimal[] = new Decimal(Number.MAX_VALUE).toFraction();
      expect(decimal3[0].toString()).assertEqual('1.7976931348623157e+308');
      expect(decimal3[1].toString()).assertEqual('1');
      let decimal4: Decimal[] = new Decimal(-Number.MAX_VALUE).toFraction();
      expect(decimal4[0].toString()).assertEqual('-1.7976931348623157e+308');
      expect(decimal4[1].toString()).assertEqual('1');
      let decimal5: Decimal[] = new Decimal(Number.MIN_VALUE).toFraction();
      expect(decimal5[0].toString()).assertEqual('1');
      expect(decimal5[1].toString()).assertEqual('2e+323');
      let decimal6: Decimal[] = new Decimal(Number.EPSILON).toFraction();
      expect(decimal6[0].toString()).assertEqual('2220446049250313');
      expect(decimal6[1].toString()).assertEqual('1e+31');
      let decimal7: Decimal[] = new Decimal('1.0000000000000001').toFraction();
      expect(decimal7[0].toString()).assertEqual('10000000000000001');
      expect(decimal7[1].toString()).assertEqual('10000000000000000');
      let decimal8: Decimal[] = new Decimal(Number.MAX_VALUE).toFraction();
      expect(decimal8[0].toNumber()).assertEqual(Number.MAX_VALUE);
      expect(decimal8[1].toNumber()).assertEqual(1);
    });

    /**
     * @tc.name testDecimalToFractionPart01Test002
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FRACTION_PART01_TEST_0200
     * @tc.desc Verify extra number arg is ignored and result matches zero-arg call
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalToFractionPart01Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: Decimal[] = new Decimal(1.75).toFraction();
      let extra: Decimal[] = new Decimal(1.75).toFraction(123);
      expect(extra.length).assertEqual(2);
      expect(extra[0].toString()).assertEqual(base[0].toString());
      expect(extra[1].toString()).assertEqual(base[1].toString());
      let decimal1: Decimal[] = new Decimal(1.75).toFraction();
      expect(decimal1 instanceof Array).assertTrue();
      let decimal2: Decimal[] = new Decimal(3.456).toFraction();
      expect(decimal2.length).assertEqual(2);
      let decimal3: Decimal[] = new Decimal(0.5).toFraction();
      expect(decimal3[0] instanceof Decimal).assertTrue();
      expect(decimal3[1] instanceof Decimal).assertTrue();
      let decimal4: Decimal[] = new Decimal('0.875').toFraction();
      expect(decimal4[0].toString()).assertEqual('7');
      expect(decimal4[1].toString()).assertEqual('8');
      let decimal5: Decimal[] = new Decimal('-0.75').toFraction();
      expect(decimal5[0].toString()).assertEqual('-3');
      expect(decimal5[0].s).assertEqual(-1);
      expect(decimal5[1].toString()).assertEqual('4');
      let decimal6: Decimal[] = new Decimal(Number.MIN_VALUE).toFraction();
      expect(decimal6[1].toString()).assertEqual('2e+323');
      expect(decimal6[1].s).assertEqual(1);
      let decimal7: Decimal[] = new Decimal(123.456).toFraction();
      expect(decimal7[0].d.length).assertEqual(1);
      expect(decimal7[0].e).assertEqual(4);
      expect(decimal7[0].s).assertEqual(1);
      let decimal8: Decimal[] = new Decimal(2.5).toFraction();
      expect(decimal8[0].toString()).assertEqual('5');
      expect(decimal8[1].toString()).assertEqual('2');
      let a: Decimal[] = new Decimal(1.75).toFraction();
      let b: Decimal[] = new Decimal(1.75).toFraction();
      expect(a === b).assertFalse();
      expect(a[0] === b[0]).assertFalse();
      let src: Decimal = new Decimal('3.456');
      src.toFraction();
      expect(src.toString()).assertEqual('3.456');
    });

    /**
     * @tc.name testDecimalToFractionPart01Test054
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FRACTION_PART01_TEST_5400
     * @tc.desc Verify explicit undefined arg does not throw and matches zero-arg result
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalToFractionPart01Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let u: ESObject = undefined;
      let decimal1: Decimal[] = new Decimal(1.75).toFraction(u as Value);
      expect(decimal1[0].toString()).assertEqual('7');
      expect(decimal1[1].toString()).assertEqual('4');
      let nv: ESObject = null;
      let decimal2: Decimal[] = new Decimal(1.75).toFraction(nv as Value);
      expect(decimal2[0].toString()).assertEqual('7');
      expect(decimal2[1].toString()).assertEqual('4');
      let decimal3: Decimal[] = toFractionExtra3(new Decimal(1.75), 8, 'x', true);
      expect(decimal3[0].toString()).assertEqual('7');
      expect(decimal3[1].toString()).assertEqual('4');
      let h: Decimal[] = new Decimal(0x10).toFraction();
      let dec: Decimal[] = new Decimal(16).toFraction();
      expect(h[0].toString()).assertEqual(dec[0].toString());
      expect(h[1].toString()).assertEqual(dec[1].toString());
      let a: Decimal[] = new Decimal(2.5).toFraction();
      let b: Decimal[] = new Decimal('2.5').toFraction();
      let c: Decimal[] = new Decimal(2.5e0).toFraction();
      expect(a[0].toString()).assertEqual('5');
      expect(a[1].toString()).assertEqual('2');
      expect(b[0].toString()).assertEqual('5');
      expect(c[0].toString()).assertEqual('5');
      let da: Decimal[] = new Decimal(0.1).toFraction();
      let db: Decimal[] = new Decimal(0.2).toFraction();
      expect(da[0].toString()).assertEqual('1');
      expect(da[1].toString()).assertEqual('10');
      expect(db[0].toString()).assertEqual('1');
      expect(db[1].toString()).assertEqual('5');
      let ds: Decimal[] = new Decimal(0.1 + 0.2).toFraction();
      expect(ds[0].toString()).assertEqual('7500000000000001');
      expect(ds[1].toString()).assertEqual('25000000000000000');
      let sa: Decimal[] = new Decimal('0.1').toFraction();
      let sdec: Decimal = new Decimal(0.1);
      let sb: Decimal[] = new Decimal(sdec).toFraction();
      expect(sa[0].toString()).assertEqual('1');
      expect(sa[1].toString()).assertEqual('10');
      expect(sb[0].toString()).assertEqual(sa[0].toString());
      expect(sb[1].toString()).assertEqual(sa[1].toString());
      let na: Decimal[] = new Decimal(-0.75).toFraction();
      let nb: Decimal[] = new Decimal('-0.75').toFraction();
      expect(na[0].toString()).assertEqual('-3');
      expect(na[1].toString()).assertEqual('4');
      expect(nb[0].toString()).assertEqual('-3');
      expect(nb[1].toString()).assertEqual('4');
      let pa: Decimal[] = new Decimal(1.75).toFraction();
      let pdec: Decimal = new Decimal(1.75);
      let pb: Decimal[] = new Decimal(pdec).toFraction();
      expect(pa[0].toString()).assertEqual('7');
      expect(pa[1].toString()).assertEqual('4');
      expect(pb[0].toString()).assertEqual('7');
      expect(pb[1].toString()).assertEqual('4');
      let x: Decimal = new Decimal('2.5');
      let y: Decimal = new Decimal(2.5);
      expect(x === y).assertFalse();
      let xa: Decimal[] = x.toFraction();
      let yb: Decimal[] = y.toFraction();
      expect(xa[0].toString()).assertEqual('5');
      expect(xa[1].toString()).assertEqual('2');
      expect(yb[0].toString()).assertEqual('5');
      expect(yb[1].toString()).assertEqual('2');
    });

    /**
     * @tc.name testDecimalToFractionPart02Test001
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FRACTION_PART02_TEST_0100
     * @tc.desc Verify legal arity 1 maxDenominator 10 returns fixed length 2 array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalToFractionPart02Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let f1: Decimal[] = new Decimal('0.5').toFraction(10);
      expect(f1.length).assertEqual(2);
      expect(f1[0].toString()).assertEqual('1');
      expect(f1[1].toString()).assertEqual('2');
      let f2: Decimal[] = new Decimal('3.25').toFraction(1);
      expect(f2[0].toString()).assertEqual('3');
      expect(f2[1].toString()).assertEqual('1');
      let f3: Decimal[] = new Decimal('0.5').toFraction(10);
      expect(f3.length).assertEqual(2);
      let f4: Decimal[] = new Decimal('0.5').toFraction(10);
      expect(f4[0].toString()).assertEqual('1');
      expect(f4[1].toString()).assertEqual('2');
      let f5: Decimal[] = new Decimal('0.5').toFraction(10);
      expect(typeof f5[0]).assertEqual('object');
      expect(typeof f5[1]).assertEqual('object');
      let f6: Decimal[] = new Decimal('0.5').toFraction(10);
      expect(Number(f6[1].toString()) <= 10).assertTrue();
      let f7: Decimal[] = new Decimal('0.75').toFraction(100);
      expect(f7[0].toString()).assertEqual('3');
      expect(f7[1].toString()).assertEqual('4');
      let f8: Decimal[] = new Decimal(5).toFraction(10);
      expect(f8[0].toString()).assertEqual('5');
      expect(f8[1].toString()).assertEqual('1');
      let f9: Decimal[] = new Decimal('-5').toFraction(10);
      expect(f9[0].toString()).assertEqual('-5');
      expect(f9[1].toString()).assertEqual('1');
      let f10: Decimal[] = new Decimal('-0.75').toFraction(10);
      expect(f10[0].toString()).assertEqual('-3');
      expect(f10[1].toString()).assertEqual('4');
      let f11: Decimal[] = new Decimal('0.75').toFraction(4);
      expect(f11[0].toString()).assertEqual('3');
      expect(f11[1].toString()).assertEqual('4');
      let f12: Decimal[] = new Decimal('0.75').toFraction(5);
      expect(f12[0].toString()).assertEqual('3');
      expect(f12[1].toString()).assertEqual('4');
      let f13: Decimal[] = new Decimal('0.75').toFraction(2);
      expect(f13.length).assertEqual(2);
      expect(Number(f13[1].toString()) <= 2).assertTrue();
      let dec14: Decimal = new Decimal('0.75');
      let a: Decimal[] = dec14.toFraction(10);
      let b: Decimal[] = dec14.toFraction(10);
      expect(a[0].toString() === b[0].toString()).assertTrue();
      expect(a[1].toString() === b[1].toString()).assertTrue();
    });

    /**
     * @tc.name testDecimalToFractionPart02Test002
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FRACTION_PART02_TEST_0200
     * @tc.desc Verify redundant second number arg is ignored with same result
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalToFractionPart02Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec1: Decimal = new Decimal('0.75');
      let f1: Decimal[] = toFractionUnsafe2(dec1, 10, 999);
      expect(f1[0].toString()).assertEqual('3');
      expect(f1[1].toString()).assertEqual('4');
      let f2: Decimal[] = toFractionUnsafe3(dec1, 10, 'x', {});
      expect(f2[0].toString()).assertEqual('3');
      expect(f2[1].toString()).assertEqual('4');
      let u: ESObject = undefined;
      let f3: Decimal[] = toFractionUnsafe2(dec1, 10, u);
      expect(f3[0].toString()).assertEqual('3');
      expect(f3[1].toString()).assertEqual('4');
      let nv: ESObject = null;
      let f4: Decimal[] = toFractionUnsafe2(dec1, 10, nv);
      expect(f4[0].toString()).assertEqual('3');
      expect(f4[1].toString()).assertEqual('4');
      let f5: Decimal[] = dec1.toFraction(nv as Value);
      expect(f5[0].toString()).assertEqual('3');
      expect(f5[1].toString()).assertEqual('4');
      let f6: Decimal[] = dec1.toFraction(u as Value);
      expect(f6[0].toString()).assertEqual('3');
      expect(f6[1].toString()).assertEqual('4');
      let f7: Decimal[] = dec1.toFraction(nv as Value);
      let f8: Decimal[] = dec1.toFraction(u as Value);
      expect(f7[0].toString()).assertEqual('3');
      expect(f7[1].toString()).assertEqual('4');
      expect(f8[0].toString()).assertEqual('3');
      expect(f8[1].toString()).assertEqual('4');
      let dec2: Decimal = new Decimal('0.5');
      let f9: Decimal[] = dec2.toFraction(nv as Value);
      expect(f9[0].toString()).assertEqual('1');
      expect(f9[1].toString()).assertEqual('2');
      expect(dec2.toString()).assertEqual('0.5');
      let f10: Decimal[] = dec2.toFraction(10);
      expect(f10[0].toString()).assertEqual('1');
      expect(f10[1].toString()).assertEqual('2');
      let dec3: Decimal = new Decimal('0.75');
      let f11: Decimal[] = dec3.toFraction(nv as Value);
      let f12: Decimal[] = dec3.toFraction(nv as Value);
      expect(f11[0].toString()).assertEqual('3');
      expect(f11[1].toString()).assertEqual('4');
      expect(f12[0].toString()).assertEqual('3');
      expect(f12[1].toString()).assertEqual('4');
      let o: ESObject = {};
      let f13: Decimal[] = dec3.toFraction(nv as Value);
      let f14: Decimal[] = dec3.toFraction(u as Value);
      let objThrew: boolean = false;
      try { dec3.toFraction(o as Value); } catch (e) { objThrew = true; }
      expect(f13[0].toString()).assertEqual('3');
      expect(f13[1].toString()).assertEqual('4');
      expect(f14[0].toString()).assertEqual('3');
      expect(f14[1].toString()).assertEqual('4');
      expect(objThrew).assertTrue();
      let bad: ESObject[] = ['', 0, false, []];
      for (let i: number = 0; i < bad.length; i++) {
        let threw: boolean = false;
        try { dec3.toFraction(bad[i] as Value); } catch (e) { threw = true; }
        expect(threw).assertTrue();
      }
      let f15: Decimal[] = dec3.toFraction(nv as Value);
      let f16: Decimal[] = dec3.toFraction(u as Value);
      expect(f15[0].toString()).assertEqual('3');
      expect(f15[1].toString()).assertEqual('4');
      expect(f16[0].toString()).assertEqual('3');
      expect(f16[1].toString()).assertEqual('4');
      let f17: Decimal[] = toFractionUnsafe2(dec3, 10, u);
      expect(f17[0].toString()).assertEqual('3');
      expect(f17[1].toString()).assertEqual('4');
      let f18: Decimal[] = dec3.toFraction(u as Value);
      expect(f18[0].toString()).assertEqual('3');
      expect(f18[1].toString()).assertEqual('4');
    });

    /**
     * @tc.name testDecimalToFractionPart02Test009
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FRACTION_PART02_TEST_0900
     * @tc.desc Verify string literal 'null' as illegal number string throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalToFractionPart02Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: Decimal = new Decimal('0.75');
      let badStrings: ESObject[] = ['null', 'undefined', `${undefined}`, String(null), '', ' ', '\n', '\u200B', '-1', '0'];
      for (let i: number = 0; i < badStrings.length; i++) {
        let errCode: number = -1;
        try { dec.toFraction(badStrings[i] as Value); } catch (e) { errCode = (e as ESObject).code; }
        expect(errCode).assertEqual(401);
      }
      try {
        let frac: Decimal[] = dec.toFraction(' 10 ');
        expect(frac[0].toString()).assertEqual('3');
        expect(frac[1].toString()).assertEqual('4');
      } catch (e) {
        let err: ESObject = e;
        expect(err.code !== undefined).assertTrue();
      }
    });

    /**
     * @tc.name testDecimalToFractionPart02Test013
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FRACTION_PART02_TEST_1300
     * @tc.desc Verify empty object without properties as maxDenominator throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalToFractionPart02Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: Decimal = new Decimal('0.75');
      let badObjs: ESObject[] = [{}, { value: 'x' }, false, true, [], [10], new Boolean(false), (): number => { return 10; }, new Date(), /d+/, new Map<string, number>(), new Set<number>()];
      for (let i: number = 0; i < badObjs.length; i++) {
        let errCode: number = -1;
        try { dec.toFraction(badObjs[i] as Value); } catch (e) { errCode = (e as ESObject).code; }
        expect(errCode).assertEqual(401);
      }
      let threw: boolean = common.symbolMaxDenominatorThrows(dec);
      expect(threw).assertTrue();
    });

    /**
     * @tc.name testDecimalToFractionPart02Test019
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FRACTION_PART02_TEST_1900
     * @tc.desc Verify zero maxDenominator is illegal and throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalToFractionPart02Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: Decimal = new Decimal('0.75');
      let badNums: ESObject[] = [0, -0, -1, Number(null)];
      for (let i: number = 0; i < badNums.length; i++) {
        let errCode: number = -1;
        try { dec.toFraction(badNums[i] as Value); } catch (e) { errCode = (e as ESObject).code; }
        expect(errCode).assertEqual(401);
      }
    });

    /**
     * @tc.name testDecimalToFractionPart02Test026
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FRACTION_PART02_TEST_2600
     * @tc.desc Verify fractional maxDenominator 0.5 runtime acceptance probe
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalToFractionPart02Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec1: Decimal = new Decimal('0.75');
      try {
        let frac: Decimal[] = dec1.toFraction(0.5);
        expect(frac.length).assertEqual(2);
      } catch (e) {
        let err: ESObject = e;
        expect(err.code !== undefined).assertTrue();
      }
      try {
        let frac: Decimal[] = dec1.toFraction(Number(undefined));
        expect(frac.length).assertEqual(2);
      } catch (e) {
        let err: ESObject = e;
        expect(err.code !== undefined).assertTrue();
      }
      let dec2: Decimal = new Decimal('0.123');
      let probes: ESObject[] = [Infinity, -Infinity, NaN, 'NaN', 1e21];
      for (let i: number = 0; i < probes.length; i++) {
        try {
          let frac: Decimal[] = dec2.toFraction(probes[i] as Value);
          expect(frac.length).assertEqual(2);
        } catch (e) {
          let err: ESObject = e;
          expect(err.code !== undefined).assertTrue();
        }
      }
    });

    /**
     * @tc.name testDecimalToFractionPart02Test041
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FRACTION_PART02_TEST_4100
     * @tc.desc Verify toFraction is pure and does not modify original Decimal
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalToFractionPart02Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec1: Decimal = new Decimal('0.75');
      dec1.toFraction(10);
      expect(dec1.toString()).assertEqual('0.75');
      let dec2: Decimal = new Decimal('0.75');
      let a: Decimal[] = dec2.toFraction(10);
      let b: Decimal[] = dec2.toFraction(10);
      expect(a === b).assertFalse();
      let dec3: Decimal = new Decimal('0.75');
      let frac: Decimal[] = dec3.toFraction(10);
      frac[0] = new Decimal('999');
      expect(dec3.toString()).assertEqual('0.75');
      let dec4: Decimal = new Decimal('0.75');
      let f4: Decimal[] = dec4.toFraction(10);
      expect(f4[0].toString().indexOf('.')).assertEqual(-1);
      expect(f4[1].toString().indexOf('.')).assertEqual(-1);
      let dec5: Decimal = new Decimal('0.75');
      let f5: Decimal[] = dec5.toFraction(10);
      expect(Number(f5[1].toString()) > 0).assertTrue();
      let dec6: Decimal = new Decimal('-0.75');
      let f6: Decimal[] = dec6.toFraction(10);
      expect(f6[0].toString().indexOf('-')).assertEqual(0);
      let dec7: Decimal = new Decimal('0.123');
      let big: Decimal[] = dec7.toFraction(1000);
      let small: Decimal[] = dec7.toFraction(10);
      expect(big[1].toString() === small[1].toString()).assertFalse();
      Decimal.set({ precision: 5 });
      let dec8: Decimal = new Decimal('3.14159265358');
      let f8: Decimal[] = dec8.toFraction(100000);
      expect(f8.length).assertEqual(2);
      expect(Number(f8[1].toString()) <= 100000).assertTrue();
      expect(dec8.toString()).assertEqual('3.14159265358');
      Decimal.set({ precision: 20, rounding: 4, toExpNeg: -7, toExpPos: 21, maxE: 9e15, minE: -9e15, modulo: 1 });
      Decimal.set({ rounding: 0 });
      let dec9: Decimal = new Decimal('0.666');
      let f9a: Decimal[] = dec9.toFraction(1000);
      Decimal.set({ rounding: 8 });
      let f9b: Decimal[] = dec9.toFraction(1000);
      Decimal.set({ precision: 20, rounding: 4, toExpNeg: -7, toExpPos: 21, maxE: 9e15, minE: -9e15, modulo: 1 });
      expect(f9a.length).assertEqual(2);
      expect(f9b.length).assertEqual(2);
      let dec10: Decimal = new Decimal('0.1');
      let f10: Decimal[] = dec10.toFraction(100);
      let num: number = Number(f10[0].toString());
      let den: number = Number(f10[1].toString());
      expect(Math.abs(num / den - 0.1) < 1e-12).assertTrue();
    });
  });
}
