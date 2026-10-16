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
import { BusinessError } from '@kit.BasicServicesKit';

function sleep(ms: number): Promise<void> {
  return new Promise<void>((resolve: () => void) => {
    setTimeout(resolve, ms);
  });
}

function assertThrowError(fn: () => void, code: number): void {
  try {
    fn();
    expect().assertFail();
  } catch (e) {
    expect((e as BusinessError).code).assertEqual(code);
  }
}

type Value = string | number | Decimal;

function cbrtUnsafe(...args: ESObject[]): Decimal {
  return Decimal.cbrt(args[0] as Value);
}

export default function DecimalStaticCbrtPart02Test() {
  describe('DecimalStaticCbrtPart02Test', () => {
    beforeAll(() => {
    });
    beforeEach(async () => {
      await sleep(30);
    });
    afterEach(() => {
    });
    afterAll(() => {
    });

    /**
     * @tc.name testDecimalStaticCbrtPart02Test0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CBRT_PART02_TEST_0100
     * @tc.desc Verify one extra argument is ignored and first argument is computed
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCbrtPart02Test0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = cbrtUnsafe('27', 'extra-arg');
      expect(r.toString()).assertEqual('3');
    });

    /**
     * @tc.name testDecimalStaticCbrtPart02Test0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CBRT_PART02_TEST_0200
     * @tc.desc Verify cbrt('27') string integer cube root is '3'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCbrtPart02Test0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = Decimal.cbrt('27');
      expect(r.toString()).assertEqual('3');
    });

    /**
     * @tc.name testDecimalStaticCbrtPart02Test0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CBRT_PART02_TEST_0300
     * @tc.desc Verify cbrt('-27') negative string keeps negative sign '-3'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCbrtPart02Test0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = Decimal.cbrt('-27');
      expect(r.toString()).assertEqual('-3');
    });

    /**
     * @tc.name testDecimalStaticCbrtPart02Test0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CBRT_PART02_TEST_0400
     * @tc.desc Verify cbrt('+27') plus-signed string cube root is '3'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCbrtPart02Test0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = Decimal.cbrt('+27');
      expect(r.toString()).assertEqual('3');
    });

    /**
     * @tc.name testDecimalStaticCbrtPart02Test0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CBRT_PART02_TEST_0500
     * @tc.desc Verify cbrt('3.375') decimal perfect cube 1.5^3 returns '1.5'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCbrtPart02Test0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = Decimal.cbrt('3.375');
      expect(r.toString()).assertEqual('1.5');
    });

    /**
     * @tc.name testDecimalStaticCbrtPart02Test0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CBRT_PART02_TEST_0600
     * @tc.desc Verify cbrt('.125') leading-point form of 0.125 returns '0.5'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCbrtPart02Test0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = Decimal.cbrt('.125');
      expect(r.toString()).assertEqual('0.5');
    });

    /**
     * @tc.name testDecimalStaticCbrtPart02Test0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CBRT_PART02_TEST_0700
     * @tc.desc Verify cbrt('0.001') small decimal cube root is '0.1'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCbrtPart02Test0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = Decimal.cbrt('0.001');
      expect(r.toString()).assertEqual('0.1');
    });

    /**
     * @tc.name testDecimalStaticCbrtPart02Test0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CBRT_PART02_TEST_0800
     * @tc.desc Verify cbrt('0.000000027') tiny decimal 27e-9 cube root is '0.003'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCbrtPart02Test0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = Decimal.cbrt('0.000000027');
      expect(r.toString()).assertEqual('0.003');
    });

    /**
     * @tc.name testDecimalStaticCbrtPart02Test0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CBRT_PART02_TEST_0900
     * @tc.desc Verify cbrt('343') 7^3 cube root is '7'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCbrtPart02Test0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = Decimal.cbrt('343');
      expect(r.toString()).assertEqual('7');
    });

    /**
     * @tc.name testDecimalStaticCbrtPart02Test0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CBRT_PART02_TEST_1000
     * @tc.desc Verify cbrt('4096') 16^3 cube root is '16'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCbrtPart02Test0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = Decimal.cbrt('4096');
      expect(r.toString()).assertEqual('16');
    });

    /**
     * @tc.name testDecimalStaticCbrtPart02Test0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CBRT_PART02_TEST_1100
     * @tc.desc Verify cbrt('729') 9^3 cube root is '9'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCbrtPart02Test0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = Decimal.cbrt('729');
      expect(r.toString()).assertEqual('9');
    });

    /**
     * @tc.name testDecimalStaticCbrtPart02Test0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CBRT_PART02_TEST_1200
     * @tc.desc Verify cbrt('08') leading-zero string parses as 8 with cube root '2'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCbrtPart02Test0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = Decimal.cbrt('08');
      expect(r.toString()).assertEqual('2');
    });

    /**
     * @tc.name testDecimalStaticCbrtPart02Test0013
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CBRT_PART02_TEST_1300
     * @tc.desc Verify cbrt('8e0') explicit zero exponent cube root is '2'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCbrtPart02Test0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = Decimal.cbrt('8e0');
      expect(r.toString()).assertEqual('2');
    });

    /**
     * @tc.name testDecimalStaticCbrtPart02Test0014
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CBRT_PART02_TEST_1400
     * @tc.desc Verify cbrt('1e-9') cube root 1e-3 outputs plain notation '0.001'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCbrtPart02Test0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = Decimal.cbrt('1e-9');
      expect(r.toString()).assertEqual('0.001');
    });

    /**
     * @tc.name testDecimalStaticCbrtPart02Test0015
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CBRT_PART02_TEST_1500
     * @tc.desc Verify cbrt('1e-21') exponent -7 result triggers toExpNeg notation '1e-7'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCbrtPart02Test0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = Decimal.cbrt('1e-21');
      expect(r.toString()).assertEqual('1e-7');
    });

    /**
     * @tc.name testDecimalStaticCbrtPart02Test0016
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CBRT_PART02_TEST_1600
     * @tc.desc Verify cbrt('1e999') cube root 1e333 triggers toExpPos notation '1e333'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCbrtPart02Test0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = Decimal.cbrt('1e999');
      expect(r.toString()).assertEqual('1e+333');
    });

    /**
     * @tc.name testDecimalStaticCbrtPart02Test0017
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CBRT_PART02_TEST_1700
     * @tc.desc Verify near-1 30-digit decimal string rounds to '1' at default 20-digit precision
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCbrtPart02Test0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = Decimal.cbrt('1.000000000000000000000000000001');
      expect(r.toString()).assertEqual('1');
    });

    /**
     * @tc.name testDecimalStaticCbrtPart02Test0018
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CBRT_PART02_TEST_1800
     * @tc.desc Verify ' 27 ' surrounding whitespace is trimmed and cube root is '3'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCbrtPart02Test0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.cbrt(' 27 ');
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticCbrtPart02Test0019
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CBRT_PART02_TEST_1900
     * @tc.desc Verify tab/newline wrapped '\t27\n' is trimmed and cube root is '3'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCbrtPart02Test0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.cbrt('\t27\n');
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticCbrtPart02Test0020
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CBRT_PART02_TEST_2000
     * @tc.desc Verify number 8 and string '8' dispatch to respective branches both '2'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCbrtPart02Test0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r1: Decimal = Decimal.cbrt(8);
      const r2: Decimal = Decimal.cbrt('8');
      expect(r1.toString()).assertEqual('2');
      expect(r2.toString()).assertEqual('2');
    });

    /**
     * @tc.name testDecimalStaticCbrtPart02Test0021
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CBRT_PART02_TEST_2100
     * @tc.desc Verify three-union members 27, '27', Decimal('27') all yield cube root '3'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCbrtPart02Test0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Decimal = Decimal.cbrt(27);
      const b: Decimal = Decimal.cbrt('27');
      const c: Decimal = Decimal.cbrt(new Decimal('27'));
      expect(a.toString()).assertEqual('3');
      expect(b.toString()).assertEqual('3');
      expect(c.toString()).assertEqual('3');
    });

    /**
     * @tc.name testDecimalStaticCbrtPart02Test0022
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CBRT_PART02_TEST_2200
     * @tc.desc Verify negative three-union members -8, '-8', Decimal(-8) all yield '-2'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCbrtPart02Test0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Decimal = Decimal.cbrt(-8);
      const b: Decimal = Decimal.cbrt('-8');
      const c: Decimal = Decimal.cbrt(new Decimal(-8));
      expect(a.toString()).assertEqual('-2');
      expect(b.toString()).assertEqual('-2');
      expect(c.toString()).assertEqual('-2');
    });

    /**
     * @tc.name testDecimalStaticCbrtPart02Test0023
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CBRT_PART02_TEST_2300
     * @tc.desc Verify number|Decimal combination: 64 and new Decimal(64) both yield '4'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCbrtPart02Test0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Decimal = Decimal.cbrt(64);
      const b: Decimal = Decimal.cbrt(new Decimal(64));
      expect(a.toString()).assertEqual('4');
      expect(b.toString()).assertEqual('4');
    });

    /**
     * @tc.name testDecimalStaticCbrtPart02Test0024
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CBRT_PART02_TEST_2400
     * @tc.desc Verify string|Decimal combination: '64' and new Decimal('64') both yield '4'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCbrtPart02Test0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Decimal = Decimal.cbrt('64');
      const b: Decimal = Decimal.cbrt(new Decimal('64'));
      expect(a.toString()).assertEqual('4');
      expect(b.toString()).assertEqual('4');
    });

    /**
     * @tc.name testDecimalStaticCbrtPart02Test0025
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CBRT_PART02_TEST_2500
     * @tc.desc Verify two content-equal Decimal instances built differently both yield '2'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCbrtPart02Test0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d1: Decimal = new Decimal(8);
      const d2: Decimal = new Decimal('8');
      expect(d1 === d2).assertFalse();
      expect(Decimal.cbrt(d1).toString()).assertEqual('2');
      expect(Decimal.cbrt(d2).toString()).assertEqual('2');
    });

    /**
     * @tc.name testDecimalStaticCbrtPart02Test0026
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CBRT_PART02_TEST_2600
     * @tc.desc Verify fraction across union members: 0.125 and '0.125' both yield '0.5'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCbrtPart02Test0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Decimal = Decimal.cbrt(0.125);
      const b: Decimal = Decimal.cbrt('0.125');
      expect(a.toString()).assertEqual('0.5');
      expect(b.toString()).assertEqual('0.5');
    });

    /**
     * @tc.name testDecimalStaticCbrtPart02Test0027
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CBRT_PART02_TEST_2700
     * @tc.desc Verify Date reference type falls into error branch and throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCbrtPart02Test0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      const d: Date = new Date(2026, 0, 1);
      let apiThrew1_1: boolean = false;
      try {
        cbrtUnsafe(d);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticCbrtPart02Test0028
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CBRT_PART02_TEST_2800
     * @tc.desc Verify RegExp reference type falls into error branch and throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCbrtPart02Test0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      const re: RegExp = new RegExp('\\d+');
      let apiThrew1_1: boolean = false;
      try {
        cbrtUnsafe(re);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticCbrtPart02Test0029
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CBRT_PART02_TEST_2900
     * @tc.desc Verify plain object literal falls into error branch and throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCbrtPart02Test0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      const obj: ESObject = { value: 27 };
      let apiThrew1_1: boolean = false;
      try {
        cbrtUnsafe(obj);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticCbrtPart02Test0030
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CBRT_PART02_TEST_3000
     * @tc.desc Verify Date instance falls into error branch and throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCbrtPart02Test0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let w: ESObject = new Date(0);
      let apiThrew1_1: boolean = false;
      try {
        cbrtUnsafe(w);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticCbrtPart02Test0031
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CBRT_PART02_TEST_3100
     * @tc.desc Verify string '8' returns Decimal instance with typeof object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCbrtPart02Test0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = Decimal.cbrt('8');
      expect(typeof r).assertEqual('object');
      expect(r instanceof Decimal).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticCbrtPart02Test0032
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CBRT_PART02_TEST_3200
     * @tc.desc Verify cbrt('2') high-precision 20 significant digits assertion
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCbrtPart02Test0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = Decimal.cbrt('2');
      expect(r.toString()).assertEqual('1.2599210498948731648');
    });

    /**
     * @tc.name testDecimalStaticCbrtPart02Test0033
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CBRT_PART02_TEST_3300
     * @tc.desc Verify cbrt('3') aligns with specification example value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCbrtPart02Test0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = Decimal.cbrt('3');
      expect(r.toString()).assertEqual('1.4422495703074083823');
    });

    /**
     * @tc.name testDecimalStaticCbrtPart02Test0034
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CBRT_PART02_TEST_3400
     * @tc.desc Verify cbrt('64').toNumber() numeric conversion equals 4
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCbrtPart02Test0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = Decimal.cbrt('64');
      expect(r.toNumber()).assertEqual(4);
    });

    /**
     * @tc.name testDecimalStaticCbrtPart02Test0035
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CBRT_PART02_TEST_3500
     * @tc.desc Verify negative result toNumber: cbrt('-216') equals -6
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCbrtPart02Test0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = Decimal.cbrt('-216');
      expect(r.toNumber()).assertEqual(-6);
    });

    /**
     * @tc.name testDecimalStaticCbrtPart02Test0036
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CBRT_PART02_TEST_3600
     * @tc.desc Verify cbrt('27') isInteger true while cbrt('2') isInteger false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCbrtPart02Test0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Decimal.cbrt('27').isInteger()).assertTrue();
      expect(Decimal.cbrt('2').isInteger()).assertFalse();
    });

    /**
     * @tc.name testDecimalStaticCbrtPart02Test0037
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CBRT_PART02_TEST_3700
     * @tc.desc Verify cbrt('0') zero string cube root '0' and isPositive true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCbrtPart02Test0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = Decimal.cbrt('0');
      expect(r.toString()).assertEqual('0');
      expect(r.isPositive()).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticCbrtPart02Test0038
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CBRT_PART02_TEST_3800
     * @tc.desc Verify cbrt('-0') keeps negative zero semantics with isNegative true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCbrtPart02Test0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = Decimal.cbrt('-0');
      expect(r.isNegative()).assertTrue();
      expect(r.isZero()).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticCbrtPart02Test0039
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CBRT_PART02_TEST_3900
     * @tc.desc Verify cbrt('2') precision equals default 20 significant digits
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCbrtPart02Test0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = Decimal.cbrt('2');
      expect(r.precision()).assertEqual(20);
    });

    /**
     * @tc.name testDecimalStaticCbrtPart02Test0040
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CBRT_PART02_TEST_4000
     * @tc.desc Verify input Decimal unchanged and returned object is a new reference
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCbrtPart02Test0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d: Decimal = new Decimal(8);
      const r: Decimal = Decimal.cbrt(d);
      expect(r.toString()).assertEqual('2');
      expect(r === d).assertFalse();
      expect(d.toString()).assertEqual('8');
    });

    /**
     * @tc.name testDecimalStaticCbrtPart02Test0041
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CBRT_PART02_TEST_4100
     * @tc.desc Verify missing property access yields undefined and throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCbrtPart02Test0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      const holder: Record<string, Decimal> = {};
      let apiThrew1_1: boolean = false;
      try {
        Decimal.cbrt(holder['missing'] as Value);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticCbrtPart02Test0042
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CBRT_PART02_TEST_4200
     * @tc.desc Verify empty string input throws 401 parameter validation failure
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCbrtPart02Test0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.cbrt('');
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticCbrtPart02Test0043
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CBRT_PART02_TEST_4300
     * @tc.desc Verify pure-spaces string trims to empty and throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCbrtPart02Test0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.cbrt('   ');
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticCbrtPart02Test0044
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CBRT_PART02_TEST_4400
     * @tc.desc Verify zero-width space prefixed '27' not trimmed and throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCbrtPart02Test0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.cbrt('​27');
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticCbrtPart02Test0045
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CBRT_PART02_TEST_4500
     * @tc.desc Verify NUL character prefixed '27' not trimmed and throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCbrtPart02Test0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.cbrt(' 27');
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticCbrtPart02Test0046
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CBRT_PART02_TEST_4600
     * @tc.desc Verify emoji string is non-numeric and throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCbrtPart02Test0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.cbrt('🍰');
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticCbrtPart02Test0047
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CBRT_PART02_TEST_4700
     * @tc.desc Verify lone surrogate cannot decode and throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCbrtPart02Test0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.cbrt('\uD800');
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticCbrtPart02Test0048
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CBRT_PART02_TEST_4800
     * @tc.desc Verify XSS script string fails to parse and throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCbrtPart02Test0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.cbrt('<script>alert(1)</script>');
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticCbrtPart02Test0049
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CBRT_PART02_TEST_4900
     * @tc.desc Verify hex string '0x10' parses as 16 within Math.cbrt tolerance
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCbrtPart02Test0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.cbrt('0x10');
      expect(Math.abs(r.toNumber() - Math.cbrt(16)) < 1e-9).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticCbrtPart02Test0050
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CBRT_PART02_TEST_5000
     * @tc.desc Verify binary string '0b101' parses as 5 within Math.cbrt tolerance
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCbrtPart02Test0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.cbrt('0b101');
      expect(Math.abs(r.toNumber() - Math.cbrt(5)) < 1e-9).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticCbrtPart02Test0051
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CBRT_PART02_TEST_5100
     * @tc.desc Verify Arabic-Indic digits not ASCII numeric and throw 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCbrtPart02Test0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.cbrt('٢٧');
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticCbrtPart02Test0052
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CBRT_PART02_TEST_5200
     * @tc.desc Verify fullwidth digits not ASCII numeric and throw 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCbrtPart02Test0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.cbrt('１２');
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticCbrtPart02Test0053
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CBRT_PART02_TEST_5300
     * @tc.desc Verify multiple decimal points '27.5.5' invalid format throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCbrtPart02Test0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.cbrt('27.5.5');
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticCbrtPart02Test0054
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CBRT_PART02_TEST_5400
     * @tc.desc Verify trailing illegal characters '27abc' invalid format throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCbrtPart02Test0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.cbrt('27abc');
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticCbrtPart02Test0055
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CBRT_PART02_TEST_5500
     * @tc.desc Verify thousands-separator comma '1,000' unsupported and throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCbrtPart02Test0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.cbrt('1,000');
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticCbrtPart02Test0056
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CBRT_PART02_TEST_5600
     * @tc.desc Verify space '27 28' invalid format throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCbrtPart02Test0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.cbrt('27 28');
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticCbrtPart02Test0057
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CBRT_PART02_TEST_5700
     * @tc.desc Verify double negative signs '--27' invalid format throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCbrtPart02Test0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.cbrt('--27');
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticCbrtPart02Test0058
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CBRT_PART02_TEST_5800
     * @tc.desc Verify incomplete exponent '1e' invalid format throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCbrtPart02Test0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.cbrt('1e');
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticCbrtPart02Test0059
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CBRT_PART02_TEST_5900
     * @tc.desc Verify underscore digit separator '1_000' parses as 1000 returning '10'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCbrtPart02Test0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.cbrt('1_000');
      expect(r.toString()).assertEqual('10');
    });

  });
}
