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

export default function DecimalValueOfTest() {
  describe('DecimalValueOfTest', () => {
    beforeAll(() => {});
    beforeEach(async () => {
      await common.sleep(common.DEFAULT_SLEEP_MS);
    });
    afterEach(() => { common.resetDecimalConfig(Decimal); });
    afterAll(() => {});

    /**
     * @tc.name testDecimalValueOfTest001
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_VALUE_OF_TEST_0100
     * @tc.desc Consolidated: Verify basic valueOf behavior and simple numeric values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalValueOfTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let dec: Decimal = new Decimal(123.45);
        expect(typeof dec.valueOf()).assertEqual('string');
      }
      {
        let dec: Decimal = new Decimal(123.45);
        let first: string = dec.valueOf();
        let second: string = dec.valueOf();
        expect(first).assertEqual(second);
      }
      {
        let dec: Decimal = new Decimal(123);
        expect(dec.valueOf()).assertEqual('123');
      }
      {
        let dec: Decimal = new Decimal(-123);
        expect(dec.valueOf()).assertEqual('-123');
      }
      {
        let dec: Decimal = new Decimal(123.456);
        expect(dec.valueOf()).assertEqual('123.456');
      }
      {
        let dec: Decimal = new Decimal(-123.456);
        expect(dec.valueOf()).assertEqual('-123.456');
      }
      {
        let dec: Decimal = new Decimal(0);
        expect(dec.valueOf()).assertEqual('0');
      }
      {
        let dec: Decimal = new Decimal('0');
        expect(dec.valueOf()).assertEqual('0');
      }
      {
        let dec: Decimal = new Decimal(1000000);
        expect(dec.valueOf()).assertEqual('1000000');
      }
    });

    /**
     * @tc.name testDecimalValueOfTest010
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_VALUE_OF_TEST_1000
     * @tc.desc Consolidated: Verify string normalization, double precision and zero sign semantics
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalValueOfTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let dec: Decimal = new Decimal('9876.54321');
        expect(dec.valueOf()).assertEqual('9876.54321');
      }
      {
        let dec: Decimal = new Decimal('007.5');
        expect(dec.valueOf()).assertEqual('7.5');
      }
      {
        let dec: Decimal = new Decimal('1.2300');
        expect(dec.valueOf()).assertEqual('1.23');
      }
      {
        let dec: Decimal = new Decimal(0.1);
        expect(dec.valueOf()).assertEqual('0.1');
      }
      {
        let dec: Decimal = new Decimal(0.30000000000000004);
        expect(dec.valueOf()).assertEqual('0.30000000000000004');
      }
      {
        let dec: Decimal = new Decimal(-0);
        expect(dec.valueOf()).assertEqual('-0');
      }
      {
        let dec: Decimal = new Decimal('-0');
        expect(dec.valueOf()).assertEqual('-0');
      }
      {
        let pos: Decimal = new Decimal(0);
        let neg: Decimal = new Decimal(-0);
        expect(pos.valueOf()).assertEqual('0');
        expect(neg.valueOf()).assertEqual('-0');
      }
      {
        let dec: Decimal = new Decimal(0).negate();
        expect(dec.valueOf()).assertEqual('-0');
      }
      {
        let dec: Decimal = new Decimal(-0).abs();
        expect(dec.valueOf()).assertEqual('0');
      }
      {
        let dec: Decimal = new Decimal(-0);
        let back: Decimal = new Decimal(dec.valueOf());
        expect(back.isNegative()).assertTrue();
      }
    });

    /**
     * @tc.name testDecimalValueOfTest021
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_VALUE_OF_TEST_2100
     * @tc.desc Consolidated: Verify valueOf of NaN, Infinity and division-by-zero edge cases
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalValueOfTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let dec: Decimal = new Decimal(NaN);
        expect(dec.valueOf()).assertEqual('NaN');
      }
      {
        let dec: Decimal = new Decimal('NaN');
        expect(dec.valueOf()).assertEqual('NaN');
      }
      {
        let dec: Decimal = new Decimal(Infinity);
        expect(dec.valueOf()).assertEqual('Infinity');
      }
      {
        let dec: Decimal = new Decimal(-Infinity);
        expect(dec.valueOf()).assertEqual('-Infinity');
      }
      {
        let dec: Decimal = new Decimal('Infinity');
        expect(dec.valueOf()).assertEqual('Infinity');
      }
      {
        let dec: Decimal = new Decimal(1).div(0);
        expect(dec.valueOf()).assertEqual('Infinity');
      }
      {
        let dec: Decimal = new Decimal(-1).div(0);
        expect(dec.valueOf()).assertEqual('-Infinity');
      }
      {
        let dec: Decimal = new Decimal(0).div(0);
        expect(dec.valueOf()).assertEqual('NaN');
      }
      {
        let dec: Decimal = new Decimal(-1).sqrt();
        expect(dec.valueOf()).assertEqual('NaN');
      }
    });

    /**
     * @tc.name testDecimalValueOfTest030
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_VALUE_OF_TEST_3000
     * @tc.desc Consolidated: Verify valueOf of Number constants and safe-integer boundaries
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalValueOfTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let dec: Decimal = new Decimal(Number.MAX_SAFE_INTEGER);
        expect(dec.valueOf()).assertEqual('9007199254740991');
      }
      {
        let dec: Decimal = new Decimal(Number.MIN_SAFE_INTEGER);
        expect(dec.valueOf()).assertEqual('-9007199254740991');
      }
      {
        let dec: Decimal = new Decimal(Number.MAX_SAFE_INTEGER + 1);
        expect(dec.valueOf()).assertEqual('9007199254740992');
      }
      {
        let dec: Decimal = new Decimal(-9007199254740993);
        expect(dec.valueOf()).assertEqual('-9007199254740992');
      }
      {
        let dec: Decimal = new Decimal(Number.MAX_VALUE);
        expect(dec.valueOf()).assertEqual(dec.toString());
      }
      {
        let dec: Decimal = new Decimal(Number.MIN_VALUE);
        expect(dec.valueOf()).assertEqual(dec.toString());
      }
      {
        let dec: Decimal = new Decimal(Number.EPSILON);
        expect(dec.valueOf()).assertEqual(dec.toString());
      }
      {
        let dec: Decimal = new Decimal('99999999999999999999999999');
        expect(dec.valueOf()).assertEqual('9.9999999999999999999999999e+25');
      }
      {
        let dec: Decimal = new Decimal('-99999999999999999999999999');
        expect(dec.valueOf()).assertEqual('-9.9999999999999999999999999e+25');
      }
    });

    /**
     * @tc.name testDecimalValueOfTest039
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_VALUE_OF_TEST_3900
     * @tc.desc Consolidated: Verify valueOf of radix-prefixed strings and scientific notation boundaries
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalValueOfTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let dec: Decimal = new Decimal('0x10');
        expect(dec.valueOf()).assertEqual('16');
      }
      {
        let dec: Decimal = new Decimal('0x1F');
        expect(dec.valueOf()).assertEqual('31');
      }
      {
        let dec: Decimal = new Decimal('0b101');
        expect(dec.valueOf()).assertEqual('5');
      }
      {
        let dec: Decimal = new Decimal('0o17');
        expect(dec.valueOf()).assertEqual('15');
      }
      {
        let dec: Decimal = new Decimal('2.5e+3');
        expect(dec.valueOf()).assertEqual('2500');
      }
      {
        let dec: Decimal = new Decimal('2.5e-3');
        expect(dec.valueOf()).assertEqual('0.0025');
      }
      {
        let dec: Decimal = new Decimal('1e-7');
        expect(dec.valueOf()).assertEqual(dec.toString());
      }
      {
        let dec: Decimal = new Decimal('0.000000123');
        expect(dec.valueOf()).assertEqual(dec.toString());
      }
      {
        let dec: Decimal = new Decimal('1e21');
        expect(dec.valueOf()).assertEqual(dec.toString());
      }
      {
        let dec: Decimal = new Decimal('2.5e22');
        expect(dec.valueOf()).assertEqual(dec.toString());
      }
      {
        let dec: Decimal = new Decimal('1.2345678901234567890123456789012345678901');
        expect(dec.valueOf()).assertEqual(dec.toString());
      }
    });

    /**
     * @tc.name testDecimalValueOfTest050
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_VALUE_OF_TEST_5000
     * @tc.desc Consolidated: Verify valueOf of arithmetic operation results
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalValueOfTest050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let dec: Decimal = new Decimal(1).add(2);
        expect(dec.valueOf()).assertEqual('3');
      }
      {
        let dec: Decimal = new Decimal('0.1').add('0.2');
        expect(dec.valueOf()).assertEqual('0.3');
      }
      {
        let dec: Decimal = new Decimal(10).div(4);
        expect(dec.valueOf()).assertEqual('2.5');
      }
      {
        let dec: Decimal = new Decimal(7).mod(3);
        expect(dec.valueOf()).assertEqual('1');
      }
      {
        let dec: Decimal = new Decimal(2).pow(10);
        expect(dec.valueOf()).assertEqual('1024');
      }
      {
        let dec: Decimal = new Decimal(9).sqrt();
        expect(dec.valueOf()).assertEqual('3');
      }
      {
        let dec: Decimal = new Decimal(1).sub(3);
        expect(dec.valueOf()).assertEqual('-2');
      }
      {
        let dec: Decimal = Decimal.round(new Decimal('1.5'));
        expect(dec.valueOf()).assertEqual('2');
      }
      {
        let dec: Decimal = new Decimal(123.456).toDecimalPlaces(1);
        expect(dec.valueOf()).assertEqual('123.5');
      }
      {
        let dec: Decimal = new Decimal('1.5').add('2.5').mul('4');
        expect(dec.valueOf()).assertEqual('16');
      }
      {
        let dec: Decimal = new Decimal(2).pow(3).negate();
        expect(dec.valueOf()).assertEqual('-8');
      }
      {
        let dec: Decimal = new Decimal('9007199254740991').add(1);
        expect(dec.valueOf()).assertEqual('9007199254740992');
      }
      {
        let dec: Decimal = new Decimal('1e400');
        expect(dec.valueOf()).assertEqual(dec.toString());
      }
    });

    /**
     * @tc.name testDecimalValueOfTest063
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_VALUE_OF_TEST_6300
     * @tc.desc Consolidated: Verify valueOf reflects config changes for toExpPos, toExpNeg, precision and rounding
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalValueOfTest063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        Decimal.set({ toExpPos: 5 });
        let dec: Decimal = new Decimal(750000);
        expect(dec.valueOf()).assertEqual(dec.toString());
        Decimal.set({ defaults: true });
      }
      {
        Decimal.set({ toExpNeg: -7 });
        let dec: Decimal = new Decimal(0.000000123);
        expect(dec.valueOf()).assertEqual(dec.toString());
        Decimal.set({ defaults: true });
      }
      {
        Decimal.set({ toExpPos: 0 });
        let dec: Decimal = new Decimal(123);
        expect(dec.valueOf()).assertEqual(dec.toString());
        Decimal.set({ defaults: true });
      }
      {
        Decimal.set({ precision: 10, rounding: 4 });
        let dec: Decimal = new Decimal(1.2345678901234567).add(0.5);
        expect(dec.valueOf()).assertEqual('1.73456789');
        Decimal.set({ defaults: true });
      }
      {
        Decimal.set({ precision: 5, rounding: 4 });
        let dec: Decimal = new Decimal(1.23456789).add(0.5);
        expect(dec.valueOf()).assertEqual('1.7346');
        Decimal.set({ defaults: true });
      }
      {
        Decimal.set({ toExpPos: 5 });
        Decimal.set({ defaults: true });
        let dec: Decimal = new Decimal(750000);
        expect(dec.valueOf()).assertEqual('750000');
      }
      {
        Decimal.set({ toExpPos: 5 });
        let dec: Decimal = new Decimal(-0);
        expect(dec.valueOf()).assertEqual('-0');
        Decimal.set({ defaults: true });
      }
    });

    /**
     * @tc.name testDecimalValueOfTest070
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_VALUE_OF_TEST_7000
     * @tc.desc Consolidated: Verify valueOf immutability, no-throw, union consistency and edge cases
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalValueOfTest070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let dec: Decimal = new Decimal(3.14);
        let s: string = dec.valueOf();
        expect(s).assertEqual('3.14');
        expect(dec.toString()).assertEqual('3.14');
      }
      {
        let dec: Decimal = new Decimal(2);
        dec.valueOf();
        expect(dec.add(3).valueOf()).assertEqual('5');
      }
      {
        let a: Decimal = new Decimal(1);
        let b: Decimal = new Decimal(2);
        expect(a.valueOf()).assertEqual('1');
        expect(b.valueOf()).assertEqual('2');
        expect(a.valueOf()).assertEqual('1');
      }
      {
        let fromNum: Decimal = new Decimal(42);
        let fromStr: Decimal = new Decimal('42');
        expect(fromNum.valueOf()).assertEqual('42');
        expect(fromStr.valueOf()).assertEqual('42');
      }
      {
        let inner: Decimal = new Decimal(3.14);
        let fromRef: Decimal = new Decimal(inner);
        let fromNum: Decimal = new Decimal(3.14);
        expect(fromRef.valueOf()).assertEqual('3.14');
        expect(fromNum.valueOf()).assertEqual('3.14');
      }
      {
        let a: Decimal = new Decimal(1);
        let b: Decimal = new Decimal('1');
        let c: Decimal = new Decimal(a);
        expect(a.valueOf()).assertEqual('1');
        expect(b.valueOf()).assertEqual('1');
        expect(c.valueOf()).assertEqual('1');
      }
      {
        let x: Decimal = new Decimal('3.14');
        let y: Decimal = new Decimal('3.14');
        expect(x.valueOf()).assertEqual(y.valueOf());
      }
      {
        let dec: Decimal = new Decimal(123);
        let ok: boolean = false;
        try {
          ok = dec.valueOf().length > 0;
        } catch (e) {
          ok = false;
        }
        expect(ok).assertTrue();
      }
      {
        let nan: Decimal = new Decimal(NaN);
        let inf: Decimal = new Decimal(Infinity);
        let nz: Decimal = new Decimal(-0);
        let ok: boolean = true;
        try {
          nan.valueOf();
          inf.valueOf();
          nz.valueOf();
        } catch (e) {
          ok = false;
        }
        expect(ok).assertTrue();
      }
      {
        let dec: Decimal = new Decimal('1e-9000000');
        expect(dec.valueOf()).assertEqual(dec.toString());
      }
      {
        let fromStr: Decimal = new Decimal(String(Number.MAX_SAFE_INTEGER));
        let fromNum: Decimal = new Decimal(Number.MAX_SAFE_INTEGER);
        expect(fromStr.valueOf()).assertEqual('9007199254740991');
        expect(fromNum.valueOf()).assertEqual(fromStr.valueOf());
      }
    });
  });
}
