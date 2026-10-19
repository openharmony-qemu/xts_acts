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
} from '../../../../hypium/index';
import Utils from '../Util.test';
import { Decimal } from '@kit.ArkTS';
import { DecimalConfig } from '@arkts.math.Decimal';
type InvalidDecimalInput = string
  | double
  | boolean
  | BigInt
  | Object
  | Array<int>
  | Array<double>
  | (() => undefined)
  | undefined
  | null;
type DecimalValue = string | double | Decimal;

export default function decimalSignTest(): void {
  describe('DecimalSignTest', (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      Decimal.set({ defaults: true });
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll((): void => {});


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SIGN_0100
     * @tc.name decimalSignTest001
     * @tc.desc Positive values and numeric string syntax sign (10 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('decimalSignTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. Decimal(5) sign 1
      let d1: Decimal = new Decimal(5);
      let s1: double = Decimal.sign(d1);
      expect(s1).assertEqual(1);

      // 2. number 5 sign 1
      let s2: double = Decimal.sign(5);
      expect(s2).assertEqual(1);

      // 3. string '0.5' sign 1
      let s3: double = Decimal.sign('0.5');
      expect(s3).assertEqual(1);

      // 4. Number.MAX_SAFE_INTEGER sign 1
      let s4: double = Decimal.sign(Number.MAX_SAFE_INTEGER);
      expect(s4).assertEqual(1);

      // 5. 0.1 + 0.2 sign 1
      let s5: double = Decimal.sign(0.1 + 0.2);
      expect(s5).assertEqual(1);

      // 6. big 10000 nines sign 1
      let big6: string = '';
      for (let i6: int = 0; i6 < 10000; i6++) {
        big6 = big6 + '9';
      }
      let s6: double = Decimal.sign(big6);
      expect(s6).assertEqual(1);

      // 7. string '99' sign 1
      let s7: double = Decimal.sign('99');
      expect(s7).assertEqual(1);

      // 8. string/double/Decimal equivalence for 13
      let a8: double = Decimal.sign('13');
      let b8: double = Decimal.sign(13);
      let c8: Decimal = new Decimal(13);
      let d8: double = Decimal.sign(c8);
      expect(a8).assertEqual(b8);
      expect(b8).assertEqual(d8);

      // 9. hex string '0x10' sign 1
      let s9: double = Decimal.sign('0x10');
      expect(s9).assertEqual(1);

      // 10. binary string '0b101' sign 1
      let s10: double = Decimal.sign('0b101');
      expect(s10).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SIGN_0200
     * @tc.name decimalSignTest002
     * @tc.desc Negative values sign (10 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('decimalSignTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. string '-5' sign -1
      let n1: double = Decimal.sign('-5');
      expect(n1).assertEqual(-1);

      // 2. number -5 sign -1
      let n2: double = Decimal.sign(-5);
      expect(n2).assertEqual(-1);

      // 3. Decimal(-5) sign -1
      let d3: Decimal = new Decimal(-5);
      let n3: double = Decimal.sign(d3);
      expect(n3).assertEqual(-1);

      // 4. Decimal('-0.0000000001') sign -1
      let d4: Decimal = new Decimal('-0.0000000001');
      let n4: double = Decimal.sign(d4);
      expect(n4).assertEqual(-1);

      // 5. Number.MIN_SAFE_INTEGER sign -1
      let n5: double = Decimal.sign(Number.MIN_SAFE_INTEGER);
      expect(n5).assertEqual(-1);

      // 6. -Number.EPSILON sign -1
      let n6: double = Decimal.sign(-Number.EPSILON);
      expect(n6).assertEqual(-1);

      // 7. -Number.POSITIVE_INFINITY sign -1
      let n7: double = Decimal.sign(-Number.POSITIVE_INFINITY);
      expect(n7).assertEqual(-1);

      // 8. string '-Infinity' sign -1
      let n8: double = Decimal.sign('-Infinity');
      expect(n8).assertEqual(-1);

      // 9. Decimal(-Infinity) sign -1
      let d9: Decimal = new Decimal(-Number.POSITIVE_INFINITY);
      let n9: double = Decimal.sign(d9);
      expect(n9).assertEqual(-1);

      // 10. big -10000 nines sign -1
      let big10: string = '-';
      for (let i10: int = 0; i10 < 10000; i10++) {
        big10 = big10 + '9';
      }
      let n10: double = Decimal.sign(big10);
      expect(n10).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SIGN_0300
     * @tc.name decimalSignTest003
     * @tc.desc Zero signed-zero EPSILON and extreme magnitudes sign (10 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('decimalSignTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. string '-0' sign 0 (SameValueZero)
      let z1: double = Decimal.sign('-0');
      expect(z1).assertEqual(0);

      // 2. number -0 sign 0 (SameValueZero)
      let z2: double = Decimal.sign(-0);
      expect(z2).assertEqual(0);

      // 3. Decimal('0') sign 0
      let d3: Decimal = new Decimal('0');
      let z3: double = Decimal.sign(d3);
      expect(z3).assertEqual(0);

      // 4. Decimal('-0') sign 0
      let d4: Decimal = new Decimal('-0');
      let z4: double = Decimal.sign(d4);
      expect(z4).assertEqual(0);

      // 5. sign(0) equals sign(-0) (SameValueZero)
      let pz5: double = Decimal.sign(0);
      let nz5: double = Decimal.sign(-0);
      expect(pz5).assertEqual(nz5);

      // 6. Number.EPSILON sign 1
      let e6: double = Decimal.sign(Number.EPSILON);
      expect(e6).assertEqual(1);

      // 7. Number.POSITIVE_INFINITY sign 1
      let e7: double = Decimal.sign(Number.POSITIVE_INFINITY);
      expect(e7).assertEqual(1);

      // 8. string 'Infinity' sign 1
      let e8: double = Decimal.sign('Infinity');
      expect(e8).assertEqual(1);

      // 9. Decimal(Infinity) sign 1
      let d9: Decimal = new Decimal(Number.POSITIVE_INFINITY);
      let e9: double = Decimal.sign(d9);
      expect(e9).assertEqual(1);

      // 10. '5e500' sign 1 and finite
      let e10: double = Decimal.sign('5e500');
      expect(e10).assertEqual(1);
      let f10: boolean = isFinite(e10);
      expect(f10).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SIGN_0400
     * @tc.name decimalSignTest004
     * @tc.desc NaN handling (8 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('decimalSignTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. string 'NaN' sign is NaN
      let na1: double = Decimal.sign('NaN');
      let b1: boolean = isNaN(na1);
      expect(b1).assertTrue();

      // 2. Number.NaN sign is NaN
      let na2: double = Decimal.sign(Number.NaN);
      let b2: boolean = isNaN(na2);
      expect(b2).assertTrue();

      // 3. Decimal(NaN) sign is NaN and source unchanged toString 'NaN'
      let d3: Decimal = new Decimal(Number.NaN);
      let na3: double = Decimal.sign(d3);
      let after3: string = d3.toString();
      expect(after3).assertEqual('NaN');
      let b3: boolean = isNaN(na3);
      expect(b3).assertTrue();

      // 4. sign(NaN) not equal to itself
      let na4: double = Decimal.sign(Number.NaN);
      expect(na4).not().assertEqual(na4);

      // 5. sign(NaN) + 1 is NaN
      let na5: double = Decimal.sign(Number.NaN);
      let r5: double = na5 + 1;
      let b5: boolean = isNaN(r5);
      expect(b5).assertTrue();

      // 6. sign(NaN) * 2 is NaN
      let na6: double = Decimal.sign(Number.NaN);
      let r6: double = na6 * 2;
      let b6: boolean = isNaN(r6);
      expect(b6).assertTrue();

      // 7. sign(NaN) isFinite false
      let na7: double = Decimal.sign(Number.NaN);
      let b7: boolean = isFinite(na7);
      expect(b7).assertFalse();

      // 8. sign(-3) isFinite true (contrast with NaN)
      let na8: double = Decimal.sign(-3);
      let b8: boolean = isFinite(na8);
      expect(b8).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SIGN_0500
     * @tc.name decimalSignTest005
     * @tc.desc Invalid string inputs error 401 (7 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('decimalSignTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. spaces string throws 401
      let sp1: string = '   ';
      try {
        Decimal.sign(sp1);
        expect().assertFail();
      } catch (e) {
        expect(e.code).assertEqual(401);
      }

      // 2. zero-width char string throws 401
      try {
        Decimal.sign('​123');
        expect().assertFail();
      } catch (e) {
        expect(e.code).assertEqual(401);
      }

      // 3. Chinese characters string throws 401
      try {
        Decimal.sign('中文');
        expect().assertFail();
      } catch (e) {
        expect(e.code).assertEqual(401);
      }

      // 4. emoji string throws 401
      try {
        Decimal.sign('😀');
        expect().assertFail();
      } catch (e) {
        expect(e.code).assertEqual(401);
      }

      // 5. script tag string throws 401
      try {
        Decimal.sign('<script>alert(1)</script>');
        expect().assertFail();
      } catch (e) {
        expect(e.code).assertEqual(401);
      }

      // 6. trailing space number string throws 401
      let tr6: string = '5 ';
      try {
        Decimal.sign(tr6);
        expect().assertFail();
      } catch (e) {
        expect(e.code).assertEqual(401);
      }

      // 7. non-numeric string 'abc' throws 401
      try {
        Decimal.sign('abc');
        expect().assertFail();
      } catch (e) {
        expect(e.code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SIGN_0600
     * @tc.name decimalSignTest006
     * @tc.desc Arithmetic and string ops on sign results (9 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('decimalSignTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. sign(11) + sign(-11) equals 0
      let p1: double = Decimal.sign(11);
      let q1: double = Decimal.sign(-11);
      let r1: number = p1 + q1;
      expect(r1).assertEqual(0);

      // 2. -sign(-23) equals 1
      let s2: double = -Decimal.sign(-23);
      expect(s2).assertEqual(1);

      // 3. Math.abs(sign(-23)) equals 1
      let s3: double = Math.abs(Decimal.sign(-23));
      expect(s3).assertEqual(1);

      // 4. sign(6) + 1 equals 2
      let s4: double = Decimal.sign(6) + 1;
      expect(s4).assertEqual(2);

      // 5. sign(6) - 1 equals 0
      let s5: double = Decimal.sign(6) - 1;
      expect(s5).assertEqual(0);

      // 6. sign(6) * 4 equals 4
      let s6: double = Decimal.sign(6) * 4;
      expect(s6).assertEqual(4);

      // 7. sign(6) / 2 equals 0.5
      let s7: double = Decimal.sign(6) / 2;
      expect(s7).assertEqual(0.5);

      // 8. ternary on sign(4) result yields 'pos'
      let s8: double = Decimal.sign(4);
      let tag8: string = s8 > 0 ? 'pos' : 'neg';
      expect(tag8).assertEqual('pos');

      // 9. sign('0.333') is an integer
      let s9: double = Decimal.sign('0.333');
      let b9: boolean = Number.isInteger(s9);
      expect(b9).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SIGN_0700
     * @tc.name decimalSignTest007
     * @tc.desc Decimal operations integration (9 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('decimalSignTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. sign(-8) added to Decimal(5) yields '4'
      let s1: double = Decimal.sign(-8);
      let d1: Decimal = new Decimal(5);
      let r1: Decimal = d1.add(s1);
      expect(r1.toString()).assertEqual('4');

      // 2. Decimal.add(2, sign(8)) yields '3'
      let s2: double = Decimal.sign(8);
      let r2: Decimal = Decimal.add(2, s2);
      expect(r2.toString()).assertEqual('3');

      // 3. Decimal(2).comparedTo(sign(4)) yields 1
      let s3: double = Decimal.sign(4);
      let d3: Decimal = new Decimal(2);
      let cmp3: double = d3.comparedTo(s3);
      expect(cmp3).assertEqual(1);

      // 4. Decimal(7).mul(sign(-4)) yields '-7'
      let s4: double = Decimal.sign(-4);
      let d4: Decimal = new Decimal(7);
      let r4: Decimal = d4.mul(s4);
      expect(r4.toString()).assertEqual('-7');

      // 5. Decimal.div(9, sign(-5)) yields '-9'
      let s5: double = Decimal.sign(-5);
      let r5: Decimal = Decimal.div(9, s5);
      expect(r5.toString()).assertEqual('-9');

      // 6. sign of Decimal('123.45') is 1 and source unchanged
      let src6: Decimal = new Decimal('123.45');
      let s6: double = Decimal.sign(src6);
      let after6: string = src6.toString();
      expect(after6).assertEqual('123.45');
      expect(s6).assertEqual(1);

      // 7. sign of Decimal('-123.45') is -1 and source unchanged
      let src7: Decimal = new Decimal('-123.45');
      let s7: double = Decimal.sign(src7);
      let after7: string = src7.toString();
      expect(after7).assertEqual('-123.45');
      expect(s7).assertEqual(-1);

      // 8. sign of Decimal(6) is 1 and source add(4) yields '10'
      let src8: Decimal = new Decimal(6);
      let s8: double = Decimal.sign(src8);
      let r8: Decimal = src8.add(4);
      expect(s8).assertEqual(1);
      expect(r8.toString()).assertEqual('10');

      // 9. sign(sign(42)) equals sign(42) (idempotent)
      let once9: double = Decimal.sign(42);
      let twice9: double = Decimal.sign(once9);
      expect(twice9).assertEqual(once9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SIGN_0800
     * @tc.name decimalSignTest008
     * @tc.desc Decimal formatting config and idempotency integration (9 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('decimalSignTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. sign(5) wrapped in Decimal toString '1'
      let s1: double = Decimal.sign(5);
      let d1: Decimal = new Decimal(s1);
      expect(d1.toString()).assertEqual('1');

      // 2. sign(-6) wrapped in Decimal toString '-1'
      let s2: double = Decimal.sign(-6);
      let d2: Decimal = new Decimal(s2);
      expect(d2.toString()).assertEqual('-1');

      // 3. sign(4).toFixed(0) yields '1'
      let t3: string = Decimal.sign(4).toFixed(0);
      expect(t3).assertEqual('1');

      // 4. sign('-2.5').toFixed(1) yields '-1.0'
      let s4: double = Decimal.sign('-2.5');
      let t4: string = s4.toFixed(1);
      expect(t4).assertEqual('-1.0');

      // 5. with precision 5, sign('123456789') yields 1
      Decimal.set({ precision: 5 });
      let s5: double = Decimal.sign('123456789');
      expect(s5).assertEqual(1);
      Decimal.set({ defaults: true });

      // 6. with precision 3, sign('-2.5') yields -1 and Decimal('1.234') stays '1.234'
      Decimal.set({ precision: 3 });
      let s6: double = Decimal.sign('-2.5');
      let d6: Decimal = new Decimal('1.234');
      expect(s6).assertEqual(-1);
      expect(d6.toString()).assertEqual('1.234');
      Decimal.set({ defaults: true });

      // 7. string concat with sign(-4) yields 'sign=-1'
      let s7: double = Decimal.sign(-4);
      let txt7: string = 'sign=' + s7;
      expect(txt7).assertEqual('sign=-1');

      // 8. nested sign(sign(-5)) yields -1
      let s8: double = Decimal.sign(Decimal.sign(-5));
      expect(s8).assertEqual(-1);

      // 9. triple nested sign(sign(sign(-9))) yields -1
      let s9: double = Decimal.sign(Decimal.sign(Decimal.sign(-9)));
      expect(s9).assertEqual(-1);
    });
  });
}
