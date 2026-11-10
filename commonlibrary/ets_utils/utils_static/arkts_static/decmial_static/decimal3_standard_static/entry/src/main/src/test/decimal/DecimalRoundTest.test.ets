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
import { DecimalConfig } from '@arkts.math.Decimal';

export default function decimalRoundTest(): void {
  describe('DecimalRoundTest', (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      Decimal.set({ defaults: true });
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_ROUND_0100
     * @tc.name decimalRoundTest001
     * @tc.desc Basic HALF_UP rounding (9 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('decimalRoundTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. round(2.5) HALF_UP -> 3
      const r1: Decimal = Decimal.round(new Decimal(2.5));
      const a1: string = r1.toString();
      const e1: string = '3';
      expect(a1).assertEqual(e1);

      // 2. round(new Decimal(new Decimal('0.5'))) HALF_UP -> 1
      const r2: Decimal = Decimal.round(new Decimal(new Decimal('0.5')));
      const a2: string = r2.toString();
      const e2: string = '1';
      expect(a2).assertEqual(e2);

      // 3. round('7') -> 7
      const r3: Decimal = Decimal.round(new Decimal('7'));
      const a3: string = r3.toString();
      const e3: string = '7';
      expect(a3).assertEqual(e3);

      // 4. round(0.1 + 0.2) -> 0
      const r4: Decimal = Decimal.round(new Decimal(0.1 + 0.2));
      const a4: string = r4.toString();
      const e4: string = '0';
      expect(a4).assertEqual(e4);

      // 5. round(new Decimal(new Decimal('-2.5'))) HALF_UP -> -3
      const src5: Decimal = new Decimal('-2.5');
      const r5: Decimal = Decimal.round(new Decimal(src5));
      const a5: string = r5.toString();
      const e5: string = '-3';
      expect(a5).assertEqual(e5);

      // 6. round(1.5 + 1) -> 3
      const r6: Decimal = Decimal.round(new Decimal('1.5').add('1'));
      const a6: string = r6.toString();
      const e6: string = '3';
      expect(a6).assertEqual(e6);

      // 7. round('-1.5') HALF_UP -> -2
      const r7: Decimal = Decimal.round(new Decimal('-1.5'));
      const a7: string = r7.toString();
      const e7: string = '-2';
      expect(a7).assertEqual(e7);

      // 8. round(-0.5) HALF_UP -> -1
      const r8: Decimal = Decimal.round(-0.5);
      const a8: string = r8.toString();
      const e8: string = '-1';
      expect(a8).assertEqual(e8);

      // 9. round(new Decimal('9.9')) -> 10
      const src9: Decimal = new Decimal('9.9');
      const r9: Decimal = Decimal.round(src9);
      const a9: string = r9.toString();
      const e9: string = '10';
      expect(a9).assertEqual(e9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_ROUND_0200
     * @tc.name decimalRoundTest002
     * @tc.desc Directional rounding modes (8 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('decimalRoundTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. ROUND_HALF_DOWN '-1.5' -> -1
      Decimal.set({ rounding: Decimal.ROUND_HALF_DOWN });
      const r1: Decimal = Decimal.round(new Decimal('-1.5'));
      const a1: string = r1.toString();
      const e1: string = '-1';
      expect(a1).assertEqual(e1);
      Decimal.set({ defaults: true });

      // 2. ROUND_DOWN '2.7' -> 2
      Decimal.set({ rounding: Decimal.ROUND_DOWN });
      const r2: Decimal = Decimal.round(new Decimal('2.7'));
      const a2: string = r2.toString();
      const e2: string = '2';
      expect(a2).assertEqual(e2);
      Decimal.set({ defaults: true });

      // 3. ROUND_DOWN '-2.7' -> -2
      Decimal.set({ rounding: Decimal.ROUND_DOWN });
      const r3: Decimal = Decimal.round(new Decimal('-2.7'));
      const a3: string = r3.toString();
      const e3: string = '-2';
      expect(a3).assertEqual(e3);
      Decimal.set({ defaults: true });

      // 4. ROUND_UP '2.3' -> 3
      Decimal.set({ rounding: Decimal.ROUND_UP });
      const r4: Decimal = Decimal.round(new Decimal('2.3'));
      const a4: string = r4.toString();
      const e4: string = '3';
      expect(a4).assertEqual(e4);
      Decimal.set({ defaults: true });

      // 5. ROUND_UP '-2.3' -> -3
      Decimal.set({ rounding: Decimal.ROUND_UP });
      const r5: Decimal = Decimal.round(new Decimal('-2.3'));
      const a5: string = r5.toString();
      const e5: string = '-3';
      expect(a5).assertEqual(e5);
      Decimal.set({ defaults: true });

      // 6. ROUND_CEILING '2.3' -> 3
      Decimal.set({ rounding: Decimal.ROUND_CEILING });
      const r6: Decimal = Decimal.round(new Decimal('2.3'));
      const a6: string = r6.toString();
      const e6: string = '3';
      expect(a6).assertEqual(e6);
      Decimal.set({ defaults: true });

      // 7. ROUND_FLOOR '2.7' -> 2
      Decimal.set({ rounding: Decimal.ROUND_FLOOR });
      const r7: Decimal = Decimal.round(new Decimal('2.7'));
      const a7: string = r7.toString();
      const e7: string = '2';
      expect(a7).assertEqual(e7);
      Decimal.set({ defaults: true });

      // 8. ROUND_FLOOR '-2.7' -> -3
      Decimal.set({ rounding: Decimal.ROUND_FLOOR });
      const r8: Decimal = Decimal.round(new Decimal('-2.7'));
      const a8: string = r8.toString();
      const e8: string = '-3';
      expect(a8).assertEqual(e8);
      Decimal.set({ defaults: true });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_ROUND_0300
     * @tc.name decimalRoundTest003
     * @tc.desc HALF-family modes and rounding config (10 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('decimalRoundTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. ROUND_HALF_EVEN '2.5' -> 2
      Decimal.set({ rounding: Decimal.ROUND_HALF_EVEN });
      const r1: Decimal = Decimal.round(new Decimal('2.5'));
      const a1: string = r1.toString();
      const e1: string = '2';
      expect(a1).assertEqual(e1);
      Decimal.set({ defaults: true });

      // 2. ROUND_HALF_EVEN '-2.5' -> -2
      Decimal.set({ rounding: Decimal.ROUND_HALF_EVEN });
      const r2: Decimal = Decimal.round(new Decimal('-2.5'));
      const a2: string = r2.toString();
      const e2: string = '-2';
      expect(a2).assertEqual(e2);
      Decimal.set({ defaults: true });

      // 3. ROUND_HALF_CEILING '1.5' -> 2
      Decimal.set({ rounding: Decimal.ROUND_HALF_CEILING });
      const r3: Decimal = Decimal.round(new Decimal('1.5'));
      const a3: string = r3.toString();
      const e3: string = '2';
      expect(a3).assertEqual(e3);
      Decimal.set({ defaults: true });

      // 4. ROUND_HALF_CEILING '-1.5' -> -1
      Decimal.set({ rounding: Decimal.ROUND_HALF_CEILING });
      const r4: Decimal = Decimal.round(new Decimal('-1.5'));
      const a4: string = r4.toString();
      const e4: string = '-1';
      expect(a4).assertEqual(e4);
      Decimal.set({ defaults: true });

      // 5. ROUND_HALF_FLOOR '1.5' -> 1
      Decimal.set({ rounding: Decimal.ROUND_HALF_FLOOR });
      const r5: Decimal = Decimal.round(new Decimal('1.5'));
      const a5: string = r5.toString();
      const e5: string = '1';
      expect(a5).assertEqual(e5);
      Decimal.set({ defaults: true });

      // 6. ROUND_HALF_FLOOR '-1.5' -> -2
      Decimal.set({ rounding: Decimal.ROUND_HALF_FLOOR });
      const r6: Decimal = Decimal.round(new Decimal('-1.5'));
      const a6: string = r6.toString();
      const e6: string = '-2';
      expect(a6).assertEqual(e6);
      Decimal.set({ defaults: true });

      // 7. precision=1 round '0.5' -> 1
      Decimal.set({ precision: 1 });
      const r7: Decimal = Decimal.round(new Decimal('0.5'));
      const a7: string = r7.toString();
      const e7: string = '1';
      expect(a7).assertEqual(e7);
      Decimal.set({ defaults: true });

      // 8. set HALF_FLOOR then defaults -> HALF_UP '1.5' -> 2
      Decimal.set({ rounding: Decimal.ROUND_HALF_FLOOR });
      Decimal.set({ defaults: true });
      const r8: Decimal = Decimal.round(new Decimal('1.5'));
      const a8: string = r8.toString();
      const e8: string = '2';
      expect(a8).assertEqual(e8);

      // 9. ROUND_HALF_DOWN '1.5' -> 1, ROUND_CEILING '-2.3' -> -2
      Decimal.set({ rounding: Decimal.ROUND_HALF_DOWN });
      const r9a: Decimal = Decimal.round(new Decimal('1.5'));
      Decimal.set({ rounding: Decimal.ROUND_CEILING });
      const r9b: Decimal = Decimal.round(new Decimal('-2.3'));
      const a9a: string = r9a.toString();
      const e9a: string = '1';
      expect(a9a).assertEqual(e9a);
      const a9b: string = r9b.toString();
      const e9b: string = '-2';
      expect(a9b).assertEqual(e9b);
      Decimal.set({ defaults: true });

      // 10. precision=5 round '-123.456', probe 1/3 -> 0.33333
      Decimal.set({ precision: 5 });
      Decimal.round('-123.456');
      const probe10: Decimal = new Decimal('1').div(3);
      const a10: string = probe10.toString();
      const e10: string = '0.33333';
      expect(a10).assertEqual(e10);
      Decimal.set({ defaults: true });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_ROUND_0400
     * @tc.name decimalRoundTest004
     * @tc.desc Special values and config limits (9 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('decimalRoundTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. round(-0) isZero and isNegative
      const r1: Decimal = Decimal.round(new Decimal(-0));
      const a1z: boolean = r1.isZero();
      expect(a1z).assertTrue();
      const a1n: boolean = r1.isNegative();
      expect(a1n).assertTrue();

      // 2. round(NaN) isNaN true
      const r2: Decimal = Decimal.round(new Decimal(Double.NaN));
      const a2: boolean = r2.isNaN();
      expect(a2).assertTrue();

      // 3. round(Infinity) -> 'Infinity'
      const r3: Decimal = Decimal.round(new Decimal(Double.POSITIVE_INFINITY));
      const a3: string = r3.toString();
      const e3: string = 'Infinity';
      expect(a3).assertEqual(e3);

      // 4. round(-Infinity) -> '-Infinity'
      const r4: Decimal = Decimal.round(new Decimal(Double.NEGATIVE_INFINITY));
      const a4: string = r4.toString();
      const e4: string = '-Infinity';
      expect(a4).assertEqual(e4);

      // 5. round(NaN) toString -> 'NaN'
      const r5: Decimal = Decimal.round(new Decimal(Double.NaN));
      const a5: string = r5.toString();
      const e5: string = 'NaN';
      expect(a5).assertEqual(e5);

      // 6. round(Infinity) isFinite false
      const r6: Decimal = Decimal.round(new Decimal(Double.POSITIVE_INFINITY));
      const a6: boolean = r6.isFinite();
      expect(a6).assertFalse();

      // 7. set rounding=10 throws 10200001
      try {
        Decimal.set({ rounding: 10 });
        expect().assertFail();
      } catch (e) {
        expect(e.code).assertEqual(10200001);
      }
      Decimal.set({ defaults: true });

      // 8. maxE=2 round '123456' -> Infinity
      Decimal.set({ maxE: 2 });
      const r8: Decimal = Decimal.round(new Decimal('123456'));
      const a8: string = r8.toString();
      const e8: string = 'Infinity';
      expect(a8).assertEqual(e8);
      Decimal.set({ defaults: true });

      // 9. minE=-5 round '0.00000001' -> 0
      Decimal.set({ minE: -5 });
      const r9: Decimal = Decimal.round(new Decimal('0.00000001'));
      const a9: string = r9.toString();
      const e9: string = '0';
      expect(a9).assertEqual(e9);
      Decimal.set({ defaults: true });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_ROUND_0500
     * @tc.name decimalRoundTest005
     * @tc.desc Immutability idempotency equality (10 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('decimalRoundTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. d=1.6 unchanged, r=2
      const d1: Decimal = new Decimal('1.6');
      const r1: Decimal = Decimal.round(d1);
      const a1d: string = d1.toString();
      const e1d: string = '1.6';
      expect(a1d).assertEqual(e1d);
      const a1r: string = r1.toString();
      const e1r: string = '2';
      expect(a1r).assertEqual(e1r);

      // 2. round twice idempotent -> 2
      const r2a: Decimal = Decimal.round(new Decimal('1.5'));
      const r2: Decimal = Decimal.round(r2a);
      const a2: string = r2.toString();
      const e2: string = '2';
      expect(a2).assertEqual(e2);

      // 3. round(10 / 3) -> 3
      const r3: Decimal = Decimal.round(new Decimal('10').div('3'));
      const a3: string = r3.toString();
      const e3: string = '3';
      expect(a3).assertEqual(e3);

      // 4. round(toDecimalPlaces(0) of 2.7) -> 3
      const r4: Decimal = Decimal.round(new Decimal('2.7').toDecimalPlaces(0));
      const a4: string = r4.toString();
      const e4: string = '3';
      expect(a4).assertEqual(e4);

      // 5. round('6.5') not equal src
      const src5: Decimal = new Decimal('6.5');
      const r5: Decimal = Decimal.round(src5);
      expect(r5).not().assertEqual(src5);

      // 6. round('4.5') twice not equal (different instances)
      const r6a: Decimal = Decimal.round('4.5');
      const r6b: Decimal = Decimal.round('4.5');
      expect(r6a).not().assertEqual(r6b);

      // 7. round('7.7') equals round(new Decimal('7.7'))
      const r7a: Decimal = Decimal.round('7.7');
      const r7b: Decimal = Decimal.round(new Decimal('7.7'));
      const a7: boolean = r7a.equals(r7b);
      expect(a7).assertTrue();

      // 8. round('-2.5') equals round(new Decimal('-2.5'))
      const r8a: Decimal = Decimal.round('-2.5');
      const r8b: Decimal = Decimal.round(new Decimal('-2.5'));
      const a8: string = r8a.toString();
      const e8: string = r8b.toString();
      expect(a8).assertEqual(e8);

      // 9. round(src) src.toString unchanged
      const src9: Decimal = new Decimal('8.9');
      const before9: string = src9.toString();
      Decimal.round(src9);
      const a9: string = src9.toString();
      const e9: string = before9;
      expect(a9).assertEqual(e9);

      // 10. round('3.3') twice equals true
      const r10a: Decimal = Decimal.round('3.3');
      const r10b: Decimal = Decimal.round('3.3');
      const a10: boolean = r10a.equals(r10b);
      expect(a10).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_ROUND_0600
     * @tc.name decimalRoundTest006
     * @tc.desc Internal state s/e/d preservation (9 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('decimalRoundTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. round('6.5').s = 1
      const r1: Decimal = Decimal.round('6.5');
      const a1: number = r1.s;
      const e1: int = 1;
      expect(a1).assertEqual(e1);

      // 2. round('-6.5').s = -1
      const r2: Decimal = Decimal.round('-6.5');
      const a2: number = r2.s;
      const e2: int = -1;
      expect(a2).assertEqual(e2);

      // 3. round('123.456').e = 2
      const r3: Decimal = Decimal.round('123.456');
      const a3: number = r3.e;
      const e3: int = 2;
      expect(a3).assertEqual(e3);

      // 4. round('123.456').d.length = 1
      const r4: Decimal = Decimal.round('123.456');
      const a4: int = r4.d!.length;
      const e4: int = 1;
      expect(a4).assertEqual(e4);

      // 5. round(0).d.length = 1
      const r5: Decimal = Decimal.round(0);
      const a5: int = r5.d!.length;
      const e5: int = 1;
      expect(a5).assertEqual(e5);

      // 6. round('2.2').d[0] = 2
      const r6: Decimal = Decimal.round('2.2');
      const a6: number = r6.d![0];
      const e6: int = 2;
      expect(a6).assertEqual(e6);

      // 7. round(src) src.s unchanged
      const src7: Decimal = new Decimal('-8.8');
      const beforeS7: number = src7.s;
      Decimal.round(src7);
      const a7: number = src7.s;
      const e7: number = beforeS7;
      expect(a7).assertEqual(e7);

      // 8. round(src) src.e unchanged
      const src8: Decimal = new Decimal('5.5');
      const beforeE8: number = src8.e;
      Decimal.round(src8);
      const a8: number = src8.e;
      const e8: number = beforeE8;
      expect(a8).assertEqual(e8);

      // 9. round(src) src.d.length unchanged
      const src9: Decimal = new Decimal('6.6');
      const beforeD9: number = src9.d!.length;
      Decimal.round(src9);
      const a9: int = src9.d!.length;
      const e9: number = beforeD9;
      expect(a9).assertEqual(e9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_ROUND_0700
     * @tc.name decimalRoundTest007
     * @tc.desc Classification and comparison (8 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('decimalRoundTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. round('3.4').toNumber = 3
      const r1: Decimal = Decimal.round('3.4');
      const a1: number = r1.toNumber();
      const e1: int = 3;
      expect(a1).assertEqual(e1);

      // 2. round('-3.5').comparedTo(-4) = 0
      const r2: Decimal = Decimal.round('-3.5');
      const a2: number = r2.comparedTo(-4);
      const e2: int = 0;
      expect(a2).assertEqual(e2);

      // 3. round('7.7').isInteger true
      const r3: Decimal = Decimal.round('7.7');
      const a3: boolean = r3.isInteger();
      expect(a3).assertTrue();

      // 4. round('-7.7').isFinite true
      const r4: Decimal = Decimal.round('-7.7');
      const a4: boolean = r4.isFinite();
      expect(a4).assertTrue();

      // 5. round('7.7').isNaN false
      const r5: Decimal = Decimal.round('7.7');
      const a5: boolean = r5.isNaN();
      expect(a5).assertFalse();

      // 6. round('7.7') Decimal.sign = 1.0
      const r6: Decimal = Decimal.round('7.7');
      const a6: number = Decimal.sign(r6);
      const e6: number = 1.0;
      expect(a6).assertEqual(e6);

      // 7. round('-7.7') Decimal.sign = -1.0
      const r7: Decimal = Decimal.round('-7.7');
      const a7: number = Decimal.sign(r7);
      const e7: number = -1.0;
      expect(a7).assertEqual(e7);

      // 8. round('3.9').comparedTo(5) = -1.0
      const r8: Decimal = Decimal.round('3.9');
      const a8: double = r8.comparedTo(5);
      const e8: double = -1.0;
      expect(a8).assertEqual(e8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_ROUND_0800
     * @tc.name decimalRoundTest008
     * @tc.desc Chained operations (10 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('decimalRoundTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. round('6.9').add(1) -> 8
      const r1: Decimal = Decimal.round('6.9').add(1);
      const a1: string = r1.toString();
      const e1: string = '8';
      expect(a1).assertEqual(e1);

      // 2. round('5.6').mul(3) -> 18
      const r2: Decimal = Decimal.round('5.6').mul(3);
      const a2: string = r2.toString();
      const e2: string = '18';
      expect(a2).assertEqual(e2);

      // 3. round('8.9').sub(4) -> 5
      const r3: Decimal = Decimal.round('8.9').sub(4);
      const a3: string = r3.toString();
      const e3: string = '5';
      expect(a3).assertEqual(e3);

      // 4. round('5.9').div(2) -> 3
      const r4: Decimal = Decimal.round('5.9').div(2);
      const a4: string = r4.toString();
      const e4: string = '3';
      expect(a4).assertEqual(e4);

      // 5. round('7.9').mod(3) -> 2
      const r5: Decimal = Decimal.round('7.9').mod(3);
      const a5: string = r5.toString();
      const e5: string = '2';
      expect(a5).assertEqual(e5);

      // 6. round('2.9').toFixed(2) -> '3.00'
      const s6: string = Decimal.round('2.9').toFixed(2);
      expect(s6).assertEqual('3.00');

      // 7. round('-2.1').abs() -> 2
      const r7: Decimal = Decimal.round('-2.1').abs();
      const a7: string = r7.toString();
      const e7: string = '2';
      expect(a7).assertEqual(e7);

      // 8. round('2.9').negate() -> -3
      const r8: Decimal = Decimal.round('2.9').negate();
      const a8: string = r8.toString();
      const e8: string = '-3';
      expect(a8).assertEqual(e8);

      // 9. round(round('4.9')) -> 5
      const r9: Decimal = Decimal.round(Decimal.round('4.9'));
      const a9: string = r9.toString();
      const e9: string = '5';
      expect(a9).assertEqual(e9);

      // 10. round('12.9').toSignificantDigits(2) -> '13'
      const s10: string = Decimal.round('12.9').toSignificantDigits(2).toString();
      expect(s10).assertEqual('13');
    });
  });
}
