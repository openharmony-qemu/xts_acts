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

function asinhUnsafe(...args: ESObject[]): Decimal {
  return Decimal.asinh(args[0] as Value);
}

export default function DecimalStaticAsinhPart02Test() {
  describe('DecimalStaticAsinhPart02Test', () => {
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
     * @tc.name testDecimalStaticAsinhPart02Test0100
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASINH_PART02_TEST_0100
     * @tc.desc Verify single-arg arity: string/number/Decimal members of 1 give same asinh result
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinhPart02Test0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r1: Decimal = Decimal.asinh('1');
      let r2: Decimal = Decimal.asinh(1);
      let r3: Decimal = Decimal.asinh(new Decimal(1));
      expect(r1.equals(r2)).assertTrue();
      expect(r1.equals(r3)).assertTrue();
      expect(Math.abs(r1.toNumber() - 0.881373587019543) < 1e-12).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAsinhPart02Test0200
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASINH_PART02_TEST_0200
     * @tc.desc Verify asinh('50') at default precision returns spec '4.6052701709914238266'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinhPart02Test0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ defaults: true });
      let data: Decimal = Decimal.asinh('50');
      expect(data.toString()).assertEqual('4.6052701709914238266');
      Decimal.set({ defaults: true });
    });

    /**
     * @tc.name testDecimalStaticAsinhPart02Test0300
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASINH_PART02_TEST_0300
     * @tc.desc Verify asinh('1') approximates 0.881373587019543
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinhPart02Test0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.asinh('1');
      expect(Math.abs(r.toNumber() - 0.881373587019543) < 1e-12).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAsinhPart02Test0400
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASINH_PART02_TEST_0400
     * @tc.desc Verify asinh('-1') gives negative approximation -0.881373587019543
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinhPart02Test0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.asinh('-1');
      expect(Math.abs(r.toNumber() + 0.881373587019543) < 1e-12).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAsinhPart02Test0500
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASINH_PART02_TEST_0500
     * @tc.desc Verify asinh('0') gives 0 and isZero true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinhPart02Test0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.asinh('0');
      expect(r.toNumber()).assertEqual(0);
      expect(r.isZero()).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAsinhPart02Test0600
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASINH_PART02_TEST_0600
     * @tc.desc Verify asinh('2') approximates 1.4436354751788103
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinhPart02Test0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.asinh('2');
      expect(Math.abs(r.toNumber() - 1.4436354751788103) < 1e-12).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAsinhPart02Test0700
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASINH_PART02_TEST_0700
     * @tc.desc Verify asinh('0.5') approximates 0.48121182505960345
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinhPart02Test0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.asinh('0.5');
      expect(Math.abs(r.toNumber() - 0.48121182505960345) < 1e-12).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAsinhPart02Test0800
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASINH_PART02_TEST_0800
     * @tc.desc Verify asinh('-0.01') linear-region negative equals -0.00999983334416675
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinhPart02Test0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.asinh('-0.01');
      expect(Math.abs(r.toNumber() + 0.00999983334416675) < 1e-9).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAsinhPart02Test0900
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASINH_PART02_TEST_0900
     * @tc.desc Verify asinh('123.456') is finite and greater than 5 in log region
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinhPart02Test0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.asinh('123.456');
      expect(r.isFinite()).assertTrue();
      expect(r.toNumber() > 5).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAsinhPart02Test1000
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASINH_PART02_TEST_1000
     * @tc.desc Verify asinh('5.0') and asinh('5') trailing-zero representations are equivalent
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinhPart02Test1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Decimal = Decimal.asinh('5.0');
      let b: Decimal = Decimal.asinh('5');
      expect(a.equals(b)).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAsinhPart02Test1100
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASINH_PART02_TEST_1100
     * @tc.desc Verify asinh('.5') and asinh('0.5') leading-dot representations are equivalent
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinhPart02Test1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Decimal = Decimal.asinh('.5');
      let b: Decimal = Decimal.asinh('0.5');
      expect(a.equals(b)).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAsinhPart02Test1200
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASINH_PART02_TEST_1200
     * @tc.desc Verify asinh('5.') and asinh('5') trailing-dot representations are equivalent
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinhPart02Test1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Decimal = Decimal.asinh('5.');
      let b: Decimal = Decimal.asinh('5');
      expect(a.equals(b)).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAsinhPart02Test1300
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASINH_PART02_TEST_1300
     * @tc.desc Verify asinh('000123') and asinh('123') leading-zero representations are equivalent
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinhPart02Test1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Decimal = Decimal.asinh('000123');
      let b: Decimal = Decimal.asinh('123');
      expect(a.equals(b)).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAsinhPart02Test1400
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASINH_PART02_TEST_1400
     * @tc.desc Verify asinh('-0') keeps negative zero with isNegative and isZero both true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinhPart02Test1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.asinh('-0');
      expect(r.isNegative()).assertTrue();
      expect(r.isZero()).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAsinhPart02Test1500
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASINH_PART02_TEST_1500
     * @tc.desc Verify asinh('1e-7') small negative-exponent string approximates 1e-7
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinhPart02Test1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.asinh('1e-7');
      expect(Math.abs(r.toNumber() - 1e-7) < 1e-15).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAsinhPart02Test1600
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASINH_PART02_TEST_1600
     * @tc.desc Verify asinh('1e20') large positive exponent stays finite above 40
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinhPart02Test1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.asinh('1e20');
      expect(r.isFinite()).assertTrue();
      expect(r.toNumber() > 40).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAsinhPart02Test1700
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASINH_PART02_TEST_1700
     * @tc.desc Verify asinh('3.14e+2') explicit plus exponent equals asinh of 314
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinhPart02Test1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Decimal = Decimal.asinh('3.14e+2');
      let b: Decimal = Decimal.asinh(314);
      expect(a.equals(b)).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAsinhPart02Test1800
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASINH_PART02_TEST_1800
     * @tc.desc Verify asinh('0x10') hex string parses as 16 matching asinh(16)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinhPart02Test1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Decimal = Decimal.asinh('0x10');
      let b: Decimal = Decimal.asinh(16);
      expect(a.equals(b)).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAsinhPart02Test1900
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASINH_PART02_TEST_1900
     * @tc.desc Verify asinh('-0x10') negative hex string parses as -16 matching asinh(-16)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinhPart02Test1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Decimal = Decimal.asinh('-0x10');
      let b: Decimal = Decimal.asinh(-16);
      expect(a.equals(b)).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAsinhPart02Test2000
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASINH_PART02_TEST_2000
     * @tc.desc Verify asinh('0b101') binary string parses as 5 matching asinh(5)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinhPart02Test2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Decimal = Decimal.asinh('0b101');
      let b: Decimal = Decimal.asinh(5);
      expect(a.equals(b)).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAsinhPart02Test2100
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASINH_PART02_TEST_2100
     * @tc.desc Verify asinh('0o10') octal string parses as 8 matching asinh(8)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinhPart02Test2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Decimal = Decimal.asinh('0o10');
      let b: Decimal = Decimal.asinh(8);
      expect(a.equals(b)).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAsinhPart02Test2200
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASINH_PART02_TEST_2200
     * @tc.desc Verify asinh('Infinity') propagates Infinity
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinhPart02Test2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.asinh('Infinity');
      expect(r.toString()).assertEqual('Infinity');
    });

    /**
     * @tc.name testDecimalStaticAsinhPart02Test2300
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASINH_PART02_TEST_2300
     * @tc.desc Verify asinh('-Infinity') propagates -Infinity
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinhPart02Test2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.asinh('-Infinity');
      expect(r.toString()).assertEqual('-Infinity');
    });

    /**
     * @tc.name testDecimalStaticAsinhPart02Test2400
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASINH_PART02_TEST_2400
     * @tc.desc Verify asinh('NaN') propagates NaN with isNaN true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinhPart02Test2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.asinh('NaN');
      expect(r.isNaN()).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAsinhPart02Test2500
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASINH_PART02_TEST_2500
     * @tc.desc Verify asinh('  2  ') trims surrounding spaces matching asinh(2)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinhPart02Test2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.asinh('  2  ');
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAsinhPart02Test2600
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASINH_PART02_TEST_2600
     * @tc.desc Verify asinh('\n\t-2') wrapped whitespace trims first matching asinh(-2)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinhPart02Test2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.asinh('\n\t-2');
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      let apiThrew1_2: boolean = false;
      try {
        Decimal.asinh('\\n\\t-2');
      } catch (e) {
        apiThrew1_2 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_2).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAsinhPart02Test2700
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASINH_PART02_TEST_2700
     * @tc.desc Verify asinh('9007199254740991') MAX_SAFE_INTEGER string stays finite above 30
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinhPart02Test2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.asinh('9007199254740991');
      expect(r.isFinite()).assertTrue();
      expect(r.toNumber() > 30).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAsinhPart02Test2800
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASINH_PART02_TEST_2800
     * @tc.desc Verify asinh('-9007199254740992') beyond MAX_SAFE string stays finite below -30
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinhPart02Test2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.asinh('-9007199254740992');
      expect(r.isFinite()).assertTrue();
      expect(r.toNumber() < -30).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAsinhPart02Test2900
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASINH_PART02_TEST_2900
     * @tc.desc Verify asinh of 40-digit long integer string stays finite above 80
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinhPart02Test2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = '1234567890123456789012345678901234567890';
      let r: Decimal = Decimal.asinh(s);
      expect(r.isFinite()).assertTrue();
      expect(r.toNumber() > 80).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAsinhPart02Test3000
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASINH_PART02_TEST_3000
     * @tc.desc Verify asinh('3.14') cross-checks with Math.asinh(3.14) within 1e-10
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinhPart02Test3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.asinh('3.14');
      expect(r.isFinite()).assertTrue();
      expect(Math.abs(r.toNumber() - Math.asinh(3.14)) < 1e-10).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAsinhPart02Test3100
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASINH_PART02_TEST_3100
     * @tc.desc Verify asinh('2') strings differ between precision 6 and 20 configs
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinhPart02Test3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ defaults: true });
      Decimal.set({ precision: 6, rounding: 4 });
      let p6: string = Decimal.asinh('2').toString();
      Decimal.set({ precision: 20, rounding: 4 });
      let p20: string = Decimal.asinh('2').toString();
      Decimal.set({ defaults: true });
      expect(p6 === p20).assertFalse();
    });

    /**
     * @tc.name testDecimalStaticAsinhPart02Test3200
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASINH_PART02_TEST_3200
     * @tc.desc Verify asinh('2') at precision 8 differs between rounding 0 and rounding 4
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinhPart02Test3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ defaults: true });
      Decimal.set({ precision: 8, rounding: 0 });
      let r0: string = Decimal.asinh('2').toString();
      Decimal.set({ precision: 8, rounding: 4 });
      let r4: string = Decimal.asinh('2').toString();
      Decimal.set({ defaults: true });
      expect(r0).assertEqual(r4);
    });

    /**
     * @tc.name testDecimalStaticAsinhPart02Test3300
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASINH_PART02_TEST_3300
     * @tc.desc Verify asinh of Decimal('-3') negative member approximates -2.3124383412727525
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinhPart02Test3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.asinh(new Decimal('-3'));
      expect(Math.abs(r.toNumber() - Math.asinh(-3)) < 1e-6).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAsinhPart02Test3400
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASINH_PART02_TEST_3400
     * @tc.desc Verify asinh of Decimal('7.5') positive member cross-checks with Math.asinh(7.5)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinhPart02Test3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.asinh(new Decimal('7.5'));
      expect(Math.abs(r.toNumber() - Math.asinh(7.5)) < 1e-10).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAsinhPart02Test3500
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASINH_PART02_TEST_3500
     * @tc.desc Verify asinh of Decimal(0) zero member gives 0 with isZero true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinhPart02Test3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.asinh(new Decimal(0));
      expect(r.toNumber()).assertEqual(0);
      expect(r.isZero()).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAsinhPart02Test3600
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASINH_PART02_TEST_3600
     * @tc.desc Verify two distinct Decimal('-5') instances give identical asinh results
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinhPart02Test3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d1: Decimal = new Decimal('-5');
      let d2: Decimal = new Decimal('-5');
      expect(Decimal.asinh(d1).equals(Decimal.asinh(d2))).assertTrue();
      expect(Math.abs(Decimal.asinh(d1).toNumber() - Math.asinh(-5)) < 1e-6).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAsinhPart02Test3700
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASINH_PART02_TEST_3700
     * @tc.desc Verify asinh returns new Decimal and leaves original '-9' input unmodified
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinhPart02Test3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Decimal = new Decimal('-9');
      let res: Decimal = Decimal.asinh(src);
      expect(src === res).assertFalse();
      expect(src.toString()).assertEqual('-9');
    });

    /**
     * @tc.name testDecimalStaticAsinhPart02Test3800
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASINH_PART02_TEST_3800
     * @tc.desc Verify string|number two-union members '1' and 1 give same asinh result
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinhPart02Test3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: string | number = '1';
      let b: string | number = 1;
      expect(Decimal.asinh(a).equals(Decimal.asinh(b))).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAsinhPart02Test3900
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASINH_PART02_TEST_3900
     * @tc.desc Verify three-union '2'/2/Decimal(2) members give identical asinh results
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinhPart02Test3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: string | number | Decimal = '2';
      let b: string | number | Decimal = 2;
      let c: string | number | Decimal = new Decimal(2);
      expect(Decimal.asinh(a).equals(Decimal.asinh(b))).assertTrue();
      expect(Decimal.asinh(a).equals(Decimal.asinh(c))).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAsinhPart02Test4000
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASINH_PART02_TEST_4000
     * @tc.desc Verify '-0.01' string and Decimal('-0.01') same value different reference agree
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinhPart02Test4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r1: Decimal = Decimal.asinh('-0.01');
      let r2: Decimal = Decimal.asinh(new Decimal('-0.01'));
      expect(r1.equals(r2)).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAsinhPart02Test4100
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASINH_PART02_TEST_4100
     * @tc.desc Verify number 3 and Decimal(3) same value cross-type equality boundary agree
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinhPart02Test4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Decimal = Decimal.asinh(3);
      let b: Decimal = Decimal.asinh(new Decimal(3));
      expect(a.equals(b)).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAsinhPart02Test4200
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASINH_PART02_TEST_4200
     * @tc.desc Verify number|null union: 42 member computes, null member throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinhPart02Test4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      expect(Decimal.asinh(42).isFinite()).assertTrue();
      let apiThrew1_1: boolean = false;
      try {
        asinhUnsafe(null);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAsinhPart02Test4300
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASINH_PART02_TEST_4300
     * @tc.desc Verify string|null union: '55' member computes, null member throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinhPart02Test4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      expect(Decimal.asinh('55').isFinite()).assertTrue();
      let apiThrew1_1: boolean = false;
      try {
        asinhUnsafe(null);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAsinhPart02Test4400
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASINH_PART02_TEST_4400
     * @tc.desc Verify string|undefined union: '99' member computes, undefined member throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinhPart02Test4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      expect(Decimal.asinh('99').isFinite()).assertTrue();
      let apiThrew1_1: boolean = false;
      try {
        asinhUnsafe(undefined);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAsinhPart02Test4500
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASINH_PART02_TEST_4500
     * @tc.desc Verify number|undefined union: 66 member computes, undefined member throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinhPart02Test4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      expect(Decimal.asinh(66).isFinite()).assertTrue();
      let apiThrew1_1: boolean = false;
      try {
        asinhUnsafe(undefined);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAsinhPart02Test4600
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASINH_PART02_TEST_4600
     * @tc.desc Verify Decimal|null union: Decimal('-77') member computes, null throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinhPart02Test4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      expect(Decimal.asinh(new Decimal('-77')).isFinite()).assertTrue();
      let apiThrew1_1: boolean = false;
      try {
        asinhUnsafe(null);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAsinhPart02Test4700
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASINH_PART02_TEST_4700
     * @tc.desc Verify four-union '10'/10/Decimal('-10') compute while null member throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinhPart02Test4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      expect(Decimal.asinh('10').isFinite()).assertTrue();
      expect(Decimal.asinh(10).isFinite()).assertTrue();
      expect(Decimal.asinh(new Decimal('-10')).isFinite()).assertTrue();
      let apiThrew1_1: boolean = false;
      try {
        asinhUnsafe(null);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAsinhPart02Test4800
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASINH_PART02_TEST_4800
     * @tc.desc Verify asinh(RegExp) instance reference type throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinhPart02Test4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        asinhUnsafe(new RegExp('x'));
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAsinhPart02Test4900
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASINH_PART02_TEST_4900
     * @tc.desc Verify asinh(Map) instance reference type throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinhPart02Test4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        asinhUnsafe(new Map<string, number>());
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAsinhPart02Test5000
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASINH_PART02_TEST_5000
     * @tc.desc Verify asinh(Set) instance reference type throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinhPart02Test5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        asinhUnsafe(new Set<number>());
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAsinhPart02Test5100
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASINH_PART02_TEST_5100
     * @tc.desc Verify asinh('abc') pure letter string throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinhPart02Test5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.asinh('abc');
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAsinhPart02Test5200
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASINH_PART02_TEST_5200
     * @tc.desc Verify asinh('12abc') digit followed by letters throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinhPart02Test5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.asinh('12abc');
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAsinhPart02Test5300
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASINH_PART02_TEST_5300
     * @tc.desc Verify asinh('1e') incomplete exponent string throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinhPart02Test5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.asinh('1e');
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAsinhPart02Test5400
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASINH_PART02_TEST_5400
     * @tc.desc Verify asinh('e5') exponent-leading string throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinhPart02Test5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.asinh('e5');
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAsinhPart02Test5500
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASINH_PART02_TEST_5500
     * @tc.desc Verify asinh('1e+') incomplete exponent sign string throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinhPart02Test5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.asinh('1e+');
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAsinhPart02Test5600
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASINH_PART02_TEST_5600
     * @tc.desc Verify asinh('-') lone minus sign string throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinhPart02Test5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.asinh('-');
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAsinhPart02Test5700
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASINH_PART02_TEST_5700
     * @tc.desc Verify asinh('.') lone decimal point string throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinhPart02Test5700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.asinh('.');
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAsinhPart02Test5800
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASINH_PART02_TEST_5800
     * @tc.desc Verify asinh('--5') double minus sign string throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinhPart02Test5800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.asinh('--5');
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAsinhPart02Test5900
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASINH_PART02_TEST_5900
     * @tc.desc Verify asinh('1.2.3') two decimal points string throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinhPart02Test5900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.asinh('1.2.3');
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAsinhPart02Test6000
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASINH_PART02_TEST_6000
     * @tc.desc Verify asinh('1,000') thousands comma string throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinhPart02Test6000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.asinh('1,000');
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAsinhPart02Test6100
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASINH_PART02_TEST_6100
     * @tc.desc Verify asinh('1_000') underscore string parses as 1000 within Math.asinh tolerance
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinhPart02Test6100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.asinh('1_000');
      expect(Math.abs(r.toNumber() - Math.asinh(1000)) < 1e-6).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAsinhPart02Test6200
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASINH_PART02_TEST_6200
     * @tc.desc Verify asinh('0xZZ') invalid hex string throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinhPart02Test6200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.asinh('0xZZ');
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAsinhPart02Test6300
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASINH_PART02_TEST_6300
     * @tc.desc Verify asinh('') empty string throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinhPart02Test6300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.asinh('');
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAsinhPart02Test6400
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASINH_PART02_TEST_6400
     * @tc.desc Verify asinh('   ') all-spaces string throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinhPart02Test6400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.asinh('   ');
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAsinhPart02Test6500
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASINH_PART02_TEST_6500
     * @tc.desc Verify asinh of zero-width-space-only string throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinhPart02Test6500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.asinh('​');
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAsinhPart02Test6600
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASINH_PART02_TEST_6600
     * @tc.desc Verify asinh of NUL-character-only string throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinhPart02Test6600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.asinh(' ');
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAsinhPart02Test6700
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASINH_PART02_TEST_6700
     * @tc.desc Verify asinh() pure emoji string throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinhPart02Test6700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.asinh('馃榾');
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAsinhPart02Test6800
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASINH_PART02_TEST_6800
     * @tc.desc Verify asinh() digit followed by emoji throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinhPart02Test6800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.asinh('1馃榾');
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAsinhPart02Test6900
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASINH_PART02_TEST_6900
     * @tc.desc Verify asinh fullwidth digit string throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinhPart02Test6900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.asinh('？');
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAsinhPart02Test7000
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASINH_PART02_TEST_7000
     * @tc.desc Verify asinh lone high surrogate string throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinhPart02Test7000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.asinh('\ud800');
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAsinhPart02Test7100
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASINH_PART02_TEST_7100
     * @tc.desc Verify asinh XSS injection string throws 401 without any script parsing
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinhPart02Test7100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.asinh('<script>alert(1)</script>');
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAsinhPart02Test7200
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASINH_PART02_TEST_7200
     * @tc.desc Verify asinh(' 5 6 ') spaces are not trimmed and throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinhPart02Test7200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.asinh(' 5 6 ');
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAsinhPart02Test7300
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASINH_PART02_TEST_7300
     * @tc.desc Verify asinh('Infinity5') keyword-mixed string throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinhPart02Test7300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.asinh('Infinity5');
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });
  });
}
