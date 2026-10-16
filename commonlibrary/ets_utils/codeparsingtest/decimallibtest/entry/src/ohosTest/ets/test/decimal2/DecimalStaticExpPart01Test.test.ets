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

function expUnsafe(...args: ESObject[]): Decimal {
  return Decimal.exp(args[0] as Value);
}

class IllegalUnionMember {
  flag: boolean = false;
}

export default function DecimalStaticExpPart01Test() {
  describe('DecimalStaticExpPart01Test', () => {
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
     * @tc.name testDecimalStaticExpPart01Test0100
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_EXP_PART01_TEST_0100
     * @tc.desc Verify exp(1) normal single-arg call returns Decimal instance equal to natural constant e
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticExpPart01Test0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ precision: 20, rounding: 4 });
      let r: Decimal = Decimal.exp(1);
      expect(r instanceof Decimal).assertTrue();
      expect(r.toString()).assertEqual('2.7182818284590452354');
    });

    /**
     * @tc.name testDecimalStaticExpPart01Test0200
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_EXP_PART01_TEST_0200
     * @tc.desc Verify exp() with omitted required argument n throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticExpPart01Test0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        expUnsafe();
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticExpPart01Test0300
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_EXP_PART01_TEST_0300
     * @tc.desc Verify exp(1, 2) extra argument ignored per JS semantics returning exp(1)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticExpPart01Test0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = expUnsafe(1, 2);
      expect(r.toString()).assertEqual('2.7182818284590452354');
    });

    /**
     * @tc.name testDecimalStaticExpPart01Test0400
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_EXP_PART01_TEST_0400
     * @tc.desc Verify exp(0) natural exponent of zero equals 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticExpPart01Test0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ precision: 20, rounding: 4 });
      let r: Decimal = Decimal.exp(0);
      expect(r.toString()).assertEqual('1');
    });

    /**
     * @tc.name testDecimalStaticExpPart01Test0500
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_EXP_PART01_TEST_0500
     * @tc.desc Verify exp(-1) equals reciprocal of e = 0.36787944117144232159
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticExpPart01Test0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ precision: 20, rounding: 4 });
      let r: Decimal = Decimal.exp(-1);
      expect(r.toString()).assertEqual('0.3678794411714423216');
    });

    /**
     * @tc.name testDecimalStaticExpPart01Test0600
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_EXP_PART01_TEST_0600
     * @tc.desc Verify exp(2) equals e squared 7.38905609893065022723
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticExpPart01Test0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ precision: 20, rounding: 4 });
      let r: Decimal = Decimal.exp(2);
      expect(r.toString()).assertEqual('7.3890560989306502272');
    });

    /**
     * @tc.name testDecimalStaticExpPart01Test0700
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_EXP_PART01_TEST_0700
     * @tc.desc Verify exp(-2) equals reciprocal of e squared 0.13533528323661269189
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticExpPart01Test0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ precision: 20, rounding: 4 });
      let r: Decimal = Decimal.exp(-2);
      expect(r.toString()).assertEqual('0.13533528323661269189');
    });

    /**
     * @tc.name testDecimalStaticExpPart01Test0800
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_EXP_PART01_TEST_0800
     * @tc.desc Verify exp(0.5) equals sqrt(e) = 1.64872127070012814685
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticExpPart01Test0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ precision: 20, rounding: 4 });
      let r: Decimal = Decimal.exp(0.5);
      expect(r.toString()).assertEqual('1.6487212707001281468');
    });

    /**
     * @tc.name testDecimalStaticExpPart01Test0900
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_EXP_PART01_TEST_0900
     * @tc.desc Verify exp(-0.5) equals 1/sqrt(e), toNumber within tolerance
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticExpPart01Test0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.exp(-0.5);
      expect(Math.abs(r.toNumber() - 0.6065306597126334) < 1e-15).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticExpPart01Test1000
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_EXP_PART01_TEST_1000
     * @tc.desc Verify exp(0.1) equals 1.1051709180756476248
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticExpPart01Test1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ precision: 20, rounding: 4 });
      let r: Decimal = Decimal.exp(0.1);
      expect(r.toString()).assertEqual('1.1051709180756476248');
    });

    /**
     * @tc.name testDecimalStaticExpPart01Test1100
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_EXP_PART01_TEST_1100
     * @tc.desc Verify exp(-0.1) equals 0.90483741803595957316
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticExpPart01Test1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ precision: 20, rounding: 4 });
      let r: Decimal = Decimal.exp(-0.1);
      expect(r.toString()).assertEqual('0.90483741803595957316');
    });

    /**
     * @tc.name testDecimalStaticExpPart01Test1200
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_EXP_PART01_TEST_1200
     * @tc.desc Verify exp(3) equals 20.08553692318766774093
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticExpPart01Test1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ precision: 20, rounding: 4 });
      let r: Decimal = Decimal.exp(3);
      expect(r.toString()).assertEqual('20.085536923187667741');
    });

    /**
     * @tc.name testDecimalStaticExpPart01Test1300
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_EXP_PART01_TEST_1300
     * @tc.desc Verify exp(0.25) equals 1.2840254166877414841
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticExpPart01Test1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ precision: 20, rounding: 4 });
      let r: Decimal = Decimal.exp(0.25);
      expect(r.toString()).assertEqual('1.2840254166877414841');
    });

    /**
     * @tc.name testDecimalStaticExpPart01Test1400
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_EXP_PART01_TEST_1400
     * @tc.desc Verify exp(4) equals 54.598150033144239078
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticExpPart01Test1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ precision: 20, rounding: 4 });
      let r: Decimal = Decimal.exp(4);
      expect(r.toString()).assertEqual('54.598150033144239078');
    });

    /**
     * @tc.name testDecimalStaticExpPart01Test1500
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_EXP_PART01_TEST_1500
     * @tc.desc Verify exp(-4) equals 0.01831563888873418029
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticExpPart01Test1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ precision: 20, rounding: 4 });
      let r: Decimal = Decimal.exp(-4);
      expect(r.toString()).assertEqual('0.018315638888734180294');
    });

    /**
     * @tc.name testDecimalStaticExpPart01Test1600
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_EXP_PART01_TEST_1600
     * @tc.desc Verify exp(10) equals 22026.46579480671651696
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticExpPart01Test1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ precision: 20, rounding: 4 });
      let r: Decimal = Decimal.exp(10);
      expect(r.toString()).assertEqual('22026.465794806716517');
    });

    /**
     * @tc.name testDecimalStaticExpPart01Test1700
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_EXP_PART01_TEST_1700
     * @tc.desc Verify exp(-10) tiny positive result toNumber within tolerance
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticExpPart01Test1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.exp(-10);
      expect(Math.abs(r.toNumber() - 0.00004539992976248485) < 1e-20).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticExpPart01Test1800
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_EXP_PART01_TEST_1800
     * @tc.desc Verify exp(100) large number shown in scientific notation 2.6881171418161356124e+43
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticExpPart01Test1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ precision: 20, rounding: 4 });
      let r: Decimal = Decimal.exp(100);
      expect(r.toString()).assertEqual('2.6881171418161354484e+43');
    });

    /**
     * @tc.name testDecimalStaticExpPart01Test1900
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_EXP_PART01_TEST_1900
     * @tc.desc Verify exp(-100) tiny value shown in scientific notation 3.720075976020835963e-44
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticExpPart01Test1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ precision: 20, rounding: 4 });
      let r: Decimal = Decimal.exp(-100);
      expect(r.toString()).assertEqual('3.720075976020835963e-44');
    });

    /**
     * @tc.name testDecimalStaticExpPart01Test2000
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_EXP_PART01_TEST_2000
     * @tc.desc Verify exp(1000) super-large exponent precision output 1.9700711140170469938e+434
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticExpPart01Test2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ precision: 20, rounding: 4 });
      let r: Decimal = Decimal.exp(1000);
      expect(r.toString()).assertEqual('1.9700711140170469939e+434');
    });

    /**
     * @tc.name testDecimalStaticExpPart01Test2100
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_EXP_PART01_TEST_2100
     * @tc.desc Verify exp(5) equals 148.4131591025766... prefix assertion
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticExpPart01Test2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ precision: 20, rounding: 4 });
      let r: Decimal = Decimal.exp(5);
      expect(r.toString().startsWith('148.4131591025766')).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticExpPart01Test2200
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_EXP_PART01_TEST_2200
     * @tc.desc Verify exp(1e-7) scientific small input result starts with 1.000000100000005
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticExpPart01Test2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ precision: 20, rounding: 4 });
      let r: Decimal = Decimal.exp(1e-7);
      expect(r.toString().startsWith('1.000000100000005')).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticExpPart01Test2300
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_EXP_PART01_TEST_2300
     * @tc.desc Verify exp(-1e-7) negative small scientific input stays near and below 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticExpPart01Test2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.exp(-1e-7);
      expect(r.toString().startsWith('0.999999900000005')).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticExpPart01Test2400
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_EXP_PART01_TEST_2400
     * @tc.desc Verify exp(Number.EPSILON) tiny increment result starts with 1.000000000000000222
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticExpPart01Test2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ precision: 20, rounding: 4 });
      let r: Decimal = Decimal.exp(Number.EPSILON);
      expect(r.toString().startsWith('1.000000000000000222')).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticExpPart01Test2500
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_EXP_PART01_TEST_2500
     * @tc.desc Verify exp(Number.MIN_VALUE) smallest positive rounds to 1 at precision 20
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticExpPart01Test2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ precision: 20, rounding: 4 });
      let r: Decimal = Decimal.exp(Number.MIN_VALUE);
      expect(r.toString()).assertEqual('1');
    });

    /**
     * @tc.name testDecimalStaticExpPart01Test2600
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_EXP_PART01_TEST_2600
     * @tc.desc Verify exp(1e-10) micro increment result starts with 1.0000000001
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticExpPart01Test2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ precision: 20, rounding: 4 });
      let r: Decimal = Decimal.exp(1e-10);
      expect(r.toString().startsWith('1.0000000001')).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticExpPart01Test2700
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_EXP_PART01_TEST_2700
     * @tc.desc Verify exp(ln2) mathematically equals 2, toNumber tolerance assertion
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticExpPart01Test2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.exp(0.6931471805599453);
      expect(Math.abs(r.toNumber() - 2) < 1e-15).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticExpPart01Test2800
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_EXP_PART01_TEST_2800
     * @tc.desc Verify exp(ln10) mathematically equals 10, toNumber tolerance assertion
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticExpPart01Test2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.exp(2.302585092994046);
      expect(Math.abs(r.toNumber() - 10) < 1e-13).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticExpPart01Test2900
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_EXP_PART01_TEST_2900
     * @tc.desc Verify exp(sqrt2) toNumber tolerance assertion
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticExpPart01Test2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.exp(1.4142135623730951);
      expect(Math.abs(r.toNumber() - Math.exp(1.4142135623730951)) < 1e-6).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticExpPart01Test3000
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_EXP_PART01_TEST_3000
     * @tc.desc Verify exp(9.99) mid-scale decimal starts with 21818.660
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticExpPart01Test3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ precision: 20, rounding: 4 });
      let r: Decimal = Decimal.exp(9.99);
      expect(r.toNumber()).assertClose(Math.exp(9.99), 1e-6);
    });

    /**
     * @tc.name testDecimalStaticExpPart01Test3100
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_EXP_PART01_TEST_3100
     * @tc.desc Verify exp(20) toNumber approximately 485165195.4097903
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticExpPart01Test3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.exp(20);
      expect(Math.abs(r.toNumber() - 485165195.4097903) < 1e-7).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticExpPart01Test3200
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_EXP_PART01_TEST_3200
     * @tc.desc Verify exp(-20) toNumber approximately 2.061153622438558e-9
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticExpPart01Test3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.exp(-20);
      expect(Math.abs(r.toNumber() - 2.061153622438558e-9) < 1e-21).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticExpPart01Test3300
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_EXP_PART01_TEST_3300
     * @tc.desc Verify number member (5) of number|null union walks normal branch, exp(5) prefix
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticExpPart01Test3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ precision: 20, rounding: 4 });
      let v: number | null = 5;
      let r: Decimal = expUnsafe(v);
      expect(r.toString().startsWith('148.4131591025766')).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticExpPart01Test3400
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_EXP_PART01_TEST_3400
     * @tc.desc Verify number member (6) of number|undefined union walks normal branch, exp(6) prefix
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticExpPart01Test3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ precision: 20, rounding: 4 });
      let v: number | undefined = 6;
      let r: Decimal = expUnsafe(v);
      expect(r.toString().startsWith('403.4287934927351')).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticExpPart01Test3500
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_EXP_PART01_TEST_3500
     * @tc.desc Verify number member (7) of Value triple union executes normally
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticExpPart01Test3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ precision: 20, rounding: 4 });
      let v: string | number | Decimal = 7;
      let r: Decimal = expUnsafe(v);
      expect(r.toString().startsWith('1096.6331584284585')).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticExpPart01Test3600
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_EXP_PART01_TEST_3600
     * @tc.desc Verify exp(null) explicit null argument throws 401 parameter error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticExpPart01Test3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        expUnsafe(null);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticExpPart01Test3700
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_EXP_PART01_TEST_3700
     * @tc.desc Verify exp(undefined) explicit undefined argument throws 401, distinct from missing arg
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticExpPart01Test3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        expUnsafe(undefined);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticExpPart01Test3800
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_EXP_PART01_TEST_3800
     * @tc.desc Verify object missing property read as undefined argument throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticExpPart01Test3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let obj: ESObject = { key: 1 };
      let apiThrew1_1: boolean = false;
      try {
        expUnsafe(obj.missing);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticExpPart01Test3900
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_EXP_PART01_TEST_3900
     * @tc.desc Verify null member of number|null union dispatches illegal at runtime and throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticExpPart01Test3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let v: number | null = null;
      let apiThrew1_1: boolean = false;
      try {
        expUnsafe(v);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticExpPart01Test4000
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_EXP_PART01_TEST_4000
     * @tc.desc Verify undefined member of number|undefined union dispatches illegal and throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticExpPart01Test4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let v: number | undefined = undefined;
      let apiThrew1_1: boolean = false;
      try {
        expUnsafe(v);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticExpPart01Test4100
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_EXP_PART01_TEST_4100
     * @tc.desc Verify empty array out-of-bounds index read as undefined argument throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticExpPart01Test4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let arr: number[] = [];
      let apiThrew1_1: boolean = false;
      try {
        expUnsafe(arr[0]);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticExpPart01Test4200
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_EXP_PART01_TEST_4200
     * @tc.desc Verify unassigned variable (value undefined) as argument throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticExpPart01Test4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let u: ESObject;
      let apiThrew1_1: boolean = false;
      try {
        expUnsafe(u);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticExpPart01Test4300
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_EXP_PART01_TEST_4300
     * @tc.desc Verify exp(NaN) propagates NaN with toString 'NaN'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticExpPart01Test4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.exp(NaN);
      expect(r.toString()).assertEqual('NaN');
    });

    /**
     * @tc.name testDecimalStaticExpPart01Test4400
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_EXP_PART01_TEST_4400
     * @tc.desc Verify exp(-NaN) expression also propagates NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticExpPart01Test4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let negNaN: number = -NaN;
      let r: Decimal = Decimal.exp(negNaN);
      expect(r.toString()).assertEqual('NaN');
    });

    /**
     * @tc.name testDecimalStaticExpPart01Test4500
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_EXP_PART01_TEST_4500
     * @tc.desc Verify exp(Infinity) propagates positive infinity with toString 'Infinity'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticExpPart01Test4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.exp(Infinity);
      expect(r.toString()).assertEqual('Infinity');
    });

    /**
     * @tc.name testDecimalStaticExpPart01Test4600
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_EXP_PART01_TEST_4600
     * @tc.desc Verify exp(-Infinity) underflows to 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticExpPart01Test4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.exp(-Infinity);
      expect(r.toString()).assertEqual('0');
    });

    /**
     * @tc.name testDecimalStaticExpPart01Test4700
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_EXP_PART01_TEST_4700
     * @tc.desc Verify exp(-0) equals 1 same as exp(0), sign bit s stays positive
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticExpPart01Test4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let negZero: number = -0;
      let r: Decimal = Decimal.exp(negZero);
      expect(r.toString()).assertEqual('1');
      expect(r.s).assertEqual(1);
    });

    /**
     * @tc.name testDecimalStaticExpPart01Test4800
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_EXP_PART01_TEST_4800
     * @tc.desc Verify exp(Number.MAX_VALUE) exceeds number range, toNumber becomes Infinity
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticExpPart01Test4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.exp(Number.MAX_VALUE);
      expect(r.toNumber()).assertEqual(Infinity);
    });

    /**
     * @tc.name testDecimalStaticExpPart01Test4900
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_EXP_PART01_TEST_4900
     * @tc.desc Verify exp(-Number.MAX_VALUE) underflows toNumber to 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticExpPart01Test4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.exp(-Number.MAX_VALUE);
      expect(r.toNumber()).assertEqual(0);
    });

    /**
     * @tc.name testDecimalStaticExpPart01Test5000
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_EXP_PART01_TEST_5000
     * @tc.desc Verify exp(710) Decimal-representable result overflows toNumber to Infinity
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticExpPart01Test5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.exp(710);
      expect(r.toNumber()).assertEqual(Infinity);
    });

    /**
     * @tc.name testDecimalStaticExpPart01Test5100
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_EXP_PART01_TEST_5100
     * @tc.desc Verify exp(709) result toNumber stays finite (709/710 overflow boundary)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticExpPart01Test5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.exp(709);
      expect(isFinite(r.toNumber())).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticExpPart01Test5200
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_EXP_PART01_TEST_5200
     * @tc.desc Verify exp(1e9) huge positive input result toNumber becomes Infinity
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticExpPart01Test5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.exp(1e9);
      expect(r.toNumber()).assertEqual(Infinity);
    });

    /**
     * @tc.name testDecimalStaticExpPart01Test5300
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_EXP_PART01_TEST_5300
     * @tc.desc Verify exp(-1e9) huge negative input result underflows to 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticExpPart01Test5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.exp(-1e9);
      expect(r.toNumber()).assertEqual(0);
    });

    /**
     * @tc.name testDecimalStaticExpPart01Test5400
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_EXP_PART01_TEST_5400
     * @tc.desc Verify exp(Number.MAX_SAFE_INTEGER) overflows to Infinity
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticExpPart01Test5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.exp(Number.MAX_SAFE_INTEGER);
      expect(r.toNumber()).assertEqual(Infinity);
    });

    /**
     * @tc.name testDecimalStaticExpPart01Test5500
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_EXP_PART01_TEST_5500
     * @tc.desc Verify exp(Number.MIN_SAFE_INTEGER) underflows to 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticExpPart01Test5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.exp(Number.MIN_SAFE_INTEGER);
      expect(r.toNumber()).assertEqual(0);
    });

    /**
     * @tc.name testDecimalStaticExpPart01Test5600
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_EXP_PART01_TEST_5600
     * @tc.desc Verify exp(1e400) literal already overflows to Infinity at runtime, result toNumber Infinity
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticExpPart01Test5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let big: number = 1e400;
      let r: Decimal = Decimal.exp(big);
      expect(r.toNumber()).assertEqual(Infinity);
    });

    /**
     * @tc.name testDecimalStaticExpPart01Test5700
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_EXP_PART01_TEST_5700
     * @tc.desc Verify exp(-1e400) negative literal overflows to -Infinity, result underflows to 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticExpPart01Test5700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let bigNeg: number = -1e400;
      let r: Decimal = Decimal.exp(bigNeg);
      expect(r.toNumber()).assertEqual(0);
    });

    /**
     * @tc.name testDecimalStaticExpPart01Test5800
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_EXP_PART01_TEST_5800
     * @tc.desc Verify low-precision exp(10000) returns 5-digit mantissa with exponent 4342
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticExpPart01Test5800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ precision: 5, rounding: 4 });
      try {
        let r: Decimal = Decimal.exp(10000);
        let s: string = r.toString();
        let parts: string[] = s.split('e+');
        expect(parts[0].charAt(0)).assertEqual('8');
        expect(parts[0].length).assertEqual(6);
        expect(parts[1]).assertEqual('4342');
      } finally {
        Decimal.set({ precision: 20, rounding: 4 });
      }
    });

    /**
     * @tc.name testDecimalStaticExpPart01Test5900
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_EXP_PART01_TEST_5900
     * @tc.desc Verify exp(true) boolean non-Value member throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticExpPart01Test5900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        expUnsafe(true);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticExpPart01Test6000
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_EXP_PART01_TEST_6000
     * @tc.desc Verify exp(false) boolean non-Value member throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticExpPart01Test6000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        expUnsafe(false);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticExpPart01Test6100
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_EXP_PART01_TEST_6100
     * @tc.desc Verify exp({}) plain object non-Value member throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticExpPart01Test6100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        expUnsafe({});
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticExpPart01Test6200
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_EXP_PART01_TEST_6200
     * @tc.desc Verify exp([]) empty array non-Value member throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticExpPart01Test6200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        expUnsafe([]);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticExpPart01Test6300
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_EXP_PART01_TEST_6300
     * @tc.desc Verify exp(function) function reference non-Value member throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticExpPart01Test6300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      try {
        let _r: Decimal = expUnsafe((): number => {
        return 1;
        });
        expect().assertFail();
      } catch (e) {
        thrown = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticExpPart01Test6400
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_EXP_PART01_TEST_6400
     * @tc.desc Verify exp with custom class instance non-Value member throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticExpPart01Test6400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let s: ESObject = new IllegalUnionMember();
      let apiThrew1_1: boolean = false;
      try {
        expUnsafe(s);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticExpPart01Test6500
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_EXP_PART01_TEST_6500
     * @tc.desc Verify exp(Date instance) reference type non-Value member throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticExpPart01Test6500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let d: Date = new Date();
      let apiThrew1_1: boolean = false;
      try {
        expUnsafe(d);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticExpPart01Test6600
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_EXP_PART01_TEST_6600
     * @tc.desc Verify exp(Map instance) reference type non-Value member throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticExpPart01Test6600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let m: Map<string, number> = new Map<string, number>();
      let apiThrew1_1: boolean = false;
      try {
        expUnsafe(m);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticExpPart01Test6700
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_EXP_PART01_TEST_6700
     * @tc.desc Verify exp(Set instance) reference type non-Value member throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticExpPart01Test6700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let st: Set<number> = new Set<number>();
      let apiThrew1_1: boolean = false;
      try {
        expUnsafe(st);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticExpPart01Test6800
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_EXP_PART01_TEST_6800
     * @tc.desc Verify exp(RegExp instance) reference type non-Value member throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticExpPart01Test6800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let re: RegExp = new RegExp('1');
      let apiThrew1_1: boolean = false;
      try {
        expUnsafe(re);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticExpPart01Test6900
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_EXP_PART01_TEST_6900
     * @tc.desc Verify exp(new Number(5)) boxed object not primitive number throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticExpPart01Test6900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let wrapped: Number = new Number(5);
      let apiThrew1_1: boolean = false;
      try {
        expUnsafe(wrapped);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticExpPart01Test7000
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_EXP_PART01_TEST_7000
     * @tc.desc Verify exp(Number('abc')) NaN-typed illegal numeric value propagates NaN result
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticExpPart01Test7000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let badNum: number = Number('abc');
      let r: Decimal = Decimal.exp(badNum);
      expect(r.toString()).assertEqual('NaN');
    });

    /**
     * @tc.name testDecimalStaticExpPart01Test7100
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_EXP_PART01_TEST_7100
     * @tc.desc Verify exp returns new Decimal and original number argument stays unmodified
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticExpPart01Test7100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let n: number = 2;
      let r: Decimal = Decimal.exp(n);
      expect(r.toString()).assertEqual('7.3890560989306502272');
      expect(r === Decimal.exp(2)).assertFalse();
    });

    /**
     * @tc.name testDecimalStaticExpPart01Test7200
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_EXP_PART01_TEST_7200
     * @tc.desc Verify exp result can chain into further operations (chained usage)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticExpPart01Test7200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ precision: 20, rounding: 4 });
      let r: Decimal = Decimal.exp(1).mul(Decimal.exp(1));
      expect(r.toString()).assertEqual('7.3890560989306502274');
    });

    /**
     * @tc.name testDecimalStaticExpPart01Test7300
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_EXP_PART01_TEST_7300
     * @tc.desc Verify exp(1).mul(exp(1)) equals exp(2), power relation e*e = e^2 consistency
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticExpPart01Test7300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ precision: 20, rounding: 4 });
      let r1: Decimal = Decimal.exp(1).mul(Decimal.exp(1));
      let r2: Decimal = Decimal.exp(2);
      expect(Math.abs(r1.toNumber() - r2.toNumber()) < 1e-12).assertTrue();
    });

  });
}
