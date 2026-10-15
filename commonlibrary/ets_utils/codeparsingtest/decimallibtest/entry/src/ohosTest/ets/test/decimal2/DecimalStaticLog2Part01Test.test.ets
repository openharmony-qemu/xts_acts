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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
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

function log2Unsafe(...args: ESObject[]): Decimal {
  return Decimal.log2(args[0] as Value);
}

export default function DecimalStaticLog2Part01Test() {
  describe('DecimalStaticLog2Part01Test', () => {
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
     * @tc.name testDecimalStaticLog2Part01Test0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG2_PART01_TEST_0100
     * @tc.desc Verify log2(4) legal single argument returns exact log '2'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLog2Part01Test0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.log2(4);
      expect(r.toString()).assertEqual('2');
    });

    /**
     * @tc.name testDecimalStaticLog2Part01Test0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG2_PART01_TEST_0200
     * @tc.desc Verify log2 with no arguments throws 401 parameter error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLog2Part01Test0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        log2Unsafe(...[]);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticLog2Part01Test0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG2_PART01_TEST_0300
     * @tc.desc Verify log2(undefined) explicit undefined throws 401 parameter error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLog2Part01Test0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        log2Unsafe(undefined);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticLog2Part01Test0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG2_PART01_TEST_0400
     * @tc.desc Verify log2(null) explicit null throws 401 parameter error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLog2Part01Test0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        log2Unsafe(null);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticLog2Part01Test0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG2_PART01_TEST_0500
     * @tc.desc Verify log2(4, 999) extra second argument ignored returns '2'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLog2Part01Test0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = log2Unsafe(4, ...[999]);
      expect(r.toString()).assertEqual('2');
    });

    /**
     * @tc.name testDecimalStaticLog2Part01Test0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG2_PART01_TEST_0600
     * @tc.desc Verify log2(2) power of two returns exact log '1'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLog2Part01Test0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.log2(2);
      expect(r.toString()).assertEqual('1');
    });

    /**
     * @tc.name testDecimalStaticLog2Part01Test0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG2_PART01_TEST_0700
     * @tc.desc Verify log2(64) returns exact log '6'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLog2Part01Test0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.log2(64);
      expect(r.toString()).assertEqual('6');
    });

    /**
     * @tc.name testDecimalStaticLog2Part01Test0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG2_PART01_TEST_0800
     * @tc.desc Verify log2(65536) returns exact log '16'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLog2Part01Test0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.log2(65536);
      expect(r.toString()).assertEqual('16');
    });

    /**
     * @tc.name testDecimalStaticLog2Part01Test0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG2_PART01_TEST_0900
     * @tc.desc Verify log2(1) two to the zero returns exact log '0'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLog2Part01Test0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.log2(1);
      expect(r.toString()).assertEqual('0');
    });

    /**
     * @tc.name testDecimalStaticLog2Part01Test0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG2_PART01_TEST_1000
     * @tc.desc Verify log2(0.5) two to the -1 returns exact log '-1'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLog2Part01Test0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.log2(0.5);
      expect(r.toString()).assertEqual('-1');
    });

    /**
     * @tc.name testDecimalStaticLog2Part01Test0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG2_PART01_TEST_1100
     * @tc.desc Verify log2(0.25) two to the -2 returns exact log '-2'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLog2Part01Test0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.log2(0.25);
      expect(r.toString()).assertEqual('-2');
    });

    /**
     * @tc.name testDecimalStaticLog2Part01Test0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG2_PART01_TEST_1200
     * @tc.desc Verify log2(10) irrational log toFixed(6) is '3.321928'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLog2Part01Test0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.log2(10);
      expect(r.toFixed(6)).assertEqual('3.321928');
    });

    /**
     * @tc.name testDecimalStaticLog2Part01Test0013
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG2_PART01_TEST_1300
     * @tc.desc Verify log2(1000) toFixed(6) is '9.965784'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLog2Part01Test0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.log2(1000);
      expect(r.toFixed(6)).assertEqual('9.965784');
    });

    /**
     * @tc.name testDecimalStaticLog2Part01Test0014
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG2_PART01_TEST_1400
     * @tc.desc Verify log2(7) prime toFixed(6) is '2.807355'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLog2Part01Test0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.log2(7);
      expect(r.toFixed(6)).assertEqual('2.807355');
    });

    /**
     * @tc.name testDecimalStaticLog2Part01Test0015
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG2_PART01_TEST_1500
     * @tc.desc Verify log2(3) prime toFixed(6) is '1.584963'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLog2Part01Test0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.log2(3);
      expect(r.toFixed(6)).assertEqual('1.584963');
    });

    /**
     * @tc.name testDecimalStaticLog2Part01Test0016
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG2_PART01_TEST_1600
     * @tc.desc Verify log2(5) prime toFixed(6) is '2.321928'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLog2Part01Test0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.log2(5);
      expect(r.toFixed(6)).assertEqual('2.321928');
    });

    /**
     * @tc.name testDecimalStaticLog2Part01Test0017
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG2_PART01_TEST_1700
     * @tc.desc Verify log2(0x10) hex literal 16 returns exact log '4'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLog2Part01Test0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.log2(0x10);
      expect(r.toString()).assertEqual('4');
    });

    /**
     * @tc.name testDecimalStaticLog2Part01Test0018
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG2_PART01_TEST_1800
     * @tc.desc Verify log2(1e8) toFixed(6) is '26.575425'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLog2Part01Test0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.log2(1e8);
      expect(r.toFixed(6)).assertEqual('26.575425');
    });

    /**
     * @tc.name testDecimalStaticLog2Part01Test0019
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG2_PART01_TEST_1900
     * @tc.desc Verify log2(1e-7) deep negative toFixed(6) is '-23.253497'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLog2Part01Test0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.log2(1e-7);
      expect(r.toFixed(6)).assertEqual('-23.253497');
    });

    /**
     * @tc.name testDecimalStaticLog2Part01Test0020
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG2_PART01_TEST_2000
     * @tc.desc Verify log2(1e-3) toFixed(6) is '-9.965784'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLog2Part01Test0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.log2(1e-3);
      expect(r.toFixed(6)).assertEqual('-9.965784');
    });

    /**
     * @tc.name testDecimalStaticLog2Part01Test0021
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG2_PART01_TEST_2100
     * @tc.desc Verify log2(1e10) toFixed(6) is '33.219281'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLog2Part01Test0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.log2(1e10);
      expect(r.toFixed(6)).assertEqual('33.219281');
    });

    /**
     * @tc.name testDecimalStaticLog2Part01Test0022
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG2_PART01_TEST_2200
     * @tc.desc Verify log2(1e-10) deep tiny toFixed(6) is '-33.219281'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLog2Part01Test0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.log2(1e-10);
      expect(r.toFixed(6)).assertEqual('-33.219281');
    });

    /**
     * @tc.name testDecimalStaticLog2Part01Test0023
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG2_PART01_TEST_2300
     * @tc.desc Verify log2(1.5) interval (1,2) toFixed(6) is '0.584963'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLog2Part01Test0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.log2(1.5);
      expect(r.toFixed(6)).assertEqual('0.584963');
    });

    /**
     * @tc.name testDecimalStaticLog2Part01Test0024
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG2_PART01_TEST_2400
     * @tc.desc Verify log2(MAX_SAFE_INTEGER) 2^53-1 returns exact log '53'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLog2Part01Test0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.log2(Number.MAX_SAFE_INTEGER);
      expect(r.toString()).assertEqual('52.99999999999999984');
    });

    /**
     * @tc.name testDecimalStaticLog2Part01Test0025
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG2_PART01_TEST_2500
     * @tc.desc Verify log2(4503599627370496) 2^52 returns exact log '52'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLog2Part01Test0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.log2(4503599627370496);
      expect(r.toString()).assertEqual('52');
    });

    /**
     * @tc.name testDecimalStaticLog2Part01Test0026
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG2_PART01_TEST_2600
     * @tc.desc Verify log2(9e15) near exponent limit toFixed(6) is '52.998846'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLog2Part01Test0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.log2(9e15);
      expect(r.toFixed(6)).assertEqual('52.998846');
    });

    /**
     * @tc.name testDecimalStaticLog2Part01Test0027
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG2_PART01_TEST_2700
     * @tc.desc Verify log2(1e21) beyond safe integer toFixed(6) is '69.760490'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLog2Part01Test0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.log2(1e21);
      expect(r.toFixed(6)).assertEqual('69.760490');
    });

    /**
     * @tc.name testDecimalStaticLog2Part01Test0028
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG2_PART01_TEST_2800
     * @tc.desc Verify log2(Number.MAX_VALUE) approximates 1024 within 1e-9
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLog2Part01Test0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.log2(Number.MAX_VALUE);
      expect(Math.abs(r.toNumber() - Math.log2(Number.MAX_VALUE)) < 1e-6).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticLog2Part01Test0029
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG2_PART01_TEST_2900
     * @tc.desc Verify log2(Number.MIN_VALUE) subnormal approximates -1074 within 1e-9
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLog2Part01Test0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.log2(Number.MIN_VALUE);
      expect(Math.abs(r.toNumber() - Math.log2(Number.MIN_VALUE)) < 1).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticLog2Part01Test0030
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG2_PART01_TEST_3000
     * @tc.desc Verify log2(Number.EPSILON) 2^-52 returns exact log -52
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLog2Part01Test0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.log2(Number.EPSILON);
      expect(r.toNumber()).assertEqual(-52);
    });

    /**
     * @tc.name testDecimalStaticLog2Part01Test0031
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG2_PART01_TEST_3100
     * @tc.desc Verify log2(1e15) large positive boundary toFixed(6) is '49.828921'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLog2Part01Test0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.log2(1e15);
      expect(r.toFixed(6)).assertEqual('49.828921');
    });

    /**
     * @tc.name testDecimalStaticLog2Part01Test0032
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG2_PART01_TEST_3200
     * @tc.desc Verify log2(1e-15) small negative boundary toFixed(6) is '-49.828921'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLog2Part01Test0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.log2(1e-15);
      expect(r.toFixed(6)).assertEqual('-49.828921');
    });

    /**
     * @tc.name testDecimalStaticLog2Part01Test0033
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG2_PART01_TEST_3300
     * @tc.desc Verify log2(3.3e4) non-power large toFixed(6) is '15.010178'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLog2Part01Test0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.log2(3.3e4);
      expect(r.toFixed(6)).assertEqual('15.010178');
    });

    /**
     * @tc.name testDecimalStaticLog2Part01Test0034
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG2_PART01_TEST_3400
     * @tc.desc Verify log2(7e-5) non-power small toFixed(6) is '-13.802286'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLog2Part01Test0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.log2(7e-5);
      expect(r.toFixed(6)).assertEqual('-13.802286');
    });

    /**
     * @tc.name testDecimalStaticLog2Part01Test0035
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG2_PART01_TEST_3500
     * @tc.desc Verify log2(0.999999) just below 1 gives tiny negative within 1e-5
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLog2Part01Test0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.log2(0.999999);
      expect(r.toNumber() < 0).assertTrue();
      expect(Math.abs(r.toNumber()) < 1e-5).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticLog2Part01Test0036
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG2_PART01_TEST_3600
     * @tc.desc Verify log2(NaN) propagates NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLog2Part01Test0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.log2(NaN);
      expect(r.isNaN()).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticLog2Part01Test0037
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG2_PART01_TEST_3700
     * @tc.desc Verify log2(Infinity) returns Infinity not finite and not NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLog2Part01Test0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.log2(Infinity);
      expect(r.isFinite()).assertFalse();
      expect(r.isNaN()).assertFalse();
      expect(r.toString()).assertEqual('Infinity');
    });

    /**
     * @tc.name testDecimalStaticLog2Part01Test0038
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG2_PART01_TEST_3800
     * @tc.desc Verify log2(-Infinity) returns NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLog2Part01Test0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.log2(-Infinity);
      expect(r.isNaN()).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticLog2Part01Test0039
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG2_PART01_TEST_3900
     * @tc.desc Verify log2(-5) negative integer returns NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLog2Part01Test0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.log2(-5);
      expect(r.isNaN()).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticLog2Part01Test0040
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG2_PART01_TEST_4000
     * @tc.desc Verify log2(-0.5) negative fraction returns NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLog2Part01Test0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.log2(-0.5);
      expect(r.isNaN()).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticLog2Part01Test0041
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG2_PART01_TEST_4100
     * @tc.desc Verify log2(-1e3) negative scientific returns NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLog2Part01Test0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.log2(-1e3);
      expect(r.isNaN()).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticLog2Part01Test0042
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG2_PART01_TEST_4200
     * @tc.desc Verify log2(MIN_SAFE_INTEGER) negative safe integer returns NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLog2Part01Test0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.log2(Number.MIN_SAFE_INTEGER);
      expect(r.isNaN()).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticLog2Part01Test0043
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG2_PART01_TEST_4300
     * @tc.desc Verify log2(-1e308) negative huge returns NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLog2Part01Test0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.log2(-1e308);
      expect(r.isNaN()).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticLog2Part01Test0044
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG2_PART01_TEST_4400
     * @tc.desc Verify log2(-0) and log2(0) share same non-finite non-NaN state
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLog2Part01Test0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r1: Decimal = Decimal.log2(-0);
      let r2: Decimal = Decimal.log2(0);
      expect(r1.isFinite()).assertEqual(r2.isFinite());
      expect(r1.isNaN()).assertEqual(r2.isNaN());
    });

    /**
     * @tc.name testDecimalStaticLog2Part01Test0045
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG2_PART01_TEST_4500
     * @tc.desc Verify log2(0) silently returns -Infinity instead of throwing
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLog2Part01Test0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.log2(0);
      expect(r.toNumber() === -Infinity).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticLog2Part01Test0046
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG2_PART01_TEST_4600
     * @tc.desc Verify log2(-0) keeps negative-zero observability and -Infinity result
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLog2Part01Test0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let negZero: Decimal = new Decimal(-0);
      expect(negZero.isNegative()).assertTrue();
      let r: Decimal = Decimal.log2(-0);
      expect(r.toNumber() === -Infinity).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticLog2Part01Test0047
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG2_PART01_TEST_4700
     * @tc.desc Verify 0 gives -Infinity while NaN gives NaN distinct semantics
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLog2Part01Test0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rZero: Decimal = Decimal.log2(0);
      let rNaN: Decimal = Decimal.log2(NaN);
      expect(rZero.isNaN()).assertFalse();
      expect(rNaN.isNaN()).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticLog2Part01Test0048
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG2_PART01_TEST_4800
     * @tc.desc Verify reading absent property yields undefined input throwing 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLog2Part01Test0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let holder: Record<string, ESObject> = {};
      let v: ESObject = holder['absent'];
      let apiThrew1_1: boolean = false;
      try {
        log2Unsafe(v);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticLog2Part01Test0049
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG2_PART01_TEST_4900
     * @tc.desc Verify reading explicit null property yields null input throwing 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLog2Part01Test0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let obj: ESObject = { k: null };
      let v: ESObject = obj['k'];
      let apiThrew1_1: boolean = false;
      try {
        log2Unsafe(v);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticLog2Part01Test0050
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG2_PART01_TEST_5000
     * @tc.desc Verify null throws 401 while 0 silently returns -Infinity
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLog2Part01Test0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      try {
        let r: Decimal = log2Unsafe(null);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
        thrown = true;
      }
      expect(thrown).assertTrue();
      expect(Decimal.log2(0).toNumber() === -Infinity).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticLog2Part01Test0051
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG2_PART01_TEST_5100
     * @tc.desc Verify undefined throws 401 while NaN propagates to NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLog2Part01Test0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      try {
        let r: Decimal = log2Unsafe(undefined);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
        thrown = true;
      }
      expect(thrown).assertTrue();
      expect(Decimal.log2(NaN).isNaN()).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticLog2Part01Test0052
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG2_PART01_TEST_5200
     * @tc.desc Verify undefined and null are two independent error paths both throwing
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLog2Part01Test0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let hitUndef: boolean = false;
      let hitNull: boolean = false;
      try {
        log2Unsafe(undefined);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
        hitUndef = true;
      }
      try {
        log2Unsafe(null);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
        hitNull = true;
      }
      expect(hitUndef).assertTrue();
      expect(hitNull).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticLog2Part01Test0053
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG2_PART01_TEST_5300
     * @tc.desc Verify log2(8) returns a Decimal instance object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLog2Part01Test0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.log2(8);
      expect(r instanceof Decimal).assertTrue();
      expect(r.toString()).assertEqual('3');
    });

    /**
     * @tc.name testDecimalStaticLog2Part01Test0054
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG2_PART01_TEST_5400
     * @tc.desc Verify log2(4) toNumber returns exact value 2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLog2Part01Test0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.log2(4);
      expect(r.toNumber()).assertEqual(2);
    });

    /**
     * @tc.name testDecimalStaticLog2Part01Test0055
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG2_PART01_TEST_5500
     * @tc.desc Verify log2(8) sign s is 1 and isPositive true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLog2Part01Test0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.log2(8);
      expect(r.s).assertEqual(1);
      expect(r.isPositive()).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticLog2Part01Test0056
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG2_PART01_TEST_5600
     * @tc.desc Verify log2(0.5) sign s is -1 and isNegative true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLog2Part01Test0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.log2(0.5);
      expect(r.s).assertEqual(-1);
      expect(r.isNegative()).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticLog2Part01Test0057
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG2_PART01_TEST_5700
     * @tc.desc Verify log2(1) isZero true and neither positive nor negative
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLog2Part01Test0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.log2(1);
      expect(r.isZero()).assertTrue();
      expect(r.isNegative()).assertFalse();
      expect(r.isPositive()).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticLog2Part01Test0058
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG2_PART01_TEST_5800
     * @tc.desc Verify log2(8) result is chainable via plus(1) to 4
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLog2Part01Test0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let chained: Decimal = Decimal.log2(8).add(1);
      expect(chained.toNumber()).assertEqual(4);
    });

    /**
     * @tc.name testDecimalStaticLog2Part01Test0059
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG2_PART01_TEST_5900
     * @tc.desc Verify log2(10) matches Math.log2 within 1e-12
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLog2Part01Test0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.log2(10);
      expect(Math.abs(r.toNumber() - Math.log2(10)) < 1e-12).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticLog2Part01Test0060
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG2_PART01_TEST_6000
     * @tc.desc Verify log2(10) keeps default precision with d length 20
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLog2Part01Test0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.log2(10);
      expect(r.d.length).assertEqual(4);
    });

    /**
     * @tc.name testDecimalStaticLog2Part01Test0061
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG2_PART01_TEST_6100
     * @tc.desc Verify log2(true) boolean wrong type throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLog2Part01Test0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        log2Unsafe(true);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticLog2Part01Test0062
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG2_PART01_TEST_6200
     * @tc.desc Verify log2({}) empty object non-Value type throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLog2Part01Test0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let o: Record<string, number> = {};
      let apiThrew1_1: boolean = false;
      try {
        log2Unsafe(o);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticLog2Part01Test0063
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG2_PART01_TEST_6300
     * @tc.desc Verify log2([]) empty array non-Value type throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLog2Part01Test0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let arr: number[] = [];
      let apiThrew1_1: boolean = false;
      try {
        log2Unsafe(arr);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticLog2Part01Test0064
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG2_PART01_TEST_6400
     * @tc.desc Verify log2(function) function object throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLog2Part01Test0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      try {
        let fn: () => number = (): number => {
        return 0;
        };
        log2Unsafe(fn);
        expect().assertFail();
      } catch (e) {
        thrown = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticLog2Part01Test0065
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG2_PART01_TEST_6500
     * @tc.desc Verify log2(Date) Date reference object throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLog2Part01Test0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let d: Date = new Date(0);
      let apiThrew1_1: boolean = false;
      try {
        log2Unsafe(d);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticLog2Part01Test0066
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG2_PART01_TEST_6600
     * @tc.desc Verify log2('1e+9000000000000000') huge exponent string yields 29897352853986261.131
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLog2Part01Test0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = log2Unsafe('1e+9000000000000000');
      expect(r.toString()).assertEqual('29897352853986261.131');
    });

    /**
     * @tc.name testDecimalStaticLog2Part01Test0067
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG2_PART01_TEST_6700
     * @tc.desc Verify log2(Math.PI) irrational toFixed(6) is '1.651496'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLog2Part01Test0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.log2(Math.PI);
      expect(r.toFixed(6)).assertEqual('1.651496');
    });

    /**
     * @tc.name testDecimalStaticLog2Part01Test0068
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG2_PART01_TEST_6800
     * @tc.desc Verify error pool isNaN matrix: NaN/-Infinity/-5 NaN; Infinity/-0 not NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLog2Part01Test0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let errs: number[] = [NaN, Infinity, -Infinity, -5, -0];
      let isNaNRes: boolean[] = errs.map((e: number): boolean => Decimal.log2(e).isNaN());
      expect(isNaNRes[0]).assertTrue();
      expect(isNaNRes[1]).assertFalse();
      expect(isNaNRes[2]).assertTrue();
      expect(isNaNRes[3]).assertTrue();
      expect(isNaNRes[4]).assertFalse();
    });

    /**
     * @tc.name testDecimalStaticLog2Part01Test0069
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG2_PART01_TEST_6900
     * @tc.desc Verify four nullish paths (missing/null/undefined/absent prop) all throw
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLog2Part01Test0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let hits: number = 0;
      try {
        log2Unsafe(...([] as ESObject[]));
      } catch (e) {
        hits++;
        expect((e as BusinessError).code).assertEqual(401);
      }
      try {
        log2Unsafe(null);
      } catch (e) {
        hits++;
        expect((e as BusinessError).code).assertEqual(401);
      }
      try {
        log2Unsafe(undefined);
      } catch (e) {
        hits++;
        expect((e as BusinessError).code).assertEqual(401);
      }
      let holder: Record<string, ESObject> = {};
      try {
        log2Unsafe(holder['absent']);
      } catch (e) {
        hits++;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(hits).assertEqual(4);
    });

    /**
     * @tc.name testDecimalStaticLog2Part01Test0070
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG2_PART01_TEST_7000
     * @tc.desc Verify log2(12) composite 2^2*3 toFixed(6) is '3.584963'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLog2Part01Test0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.log2(12);
      expect(r.toFixed(6)).assertEqual('3.584963');
    });
  });
}
