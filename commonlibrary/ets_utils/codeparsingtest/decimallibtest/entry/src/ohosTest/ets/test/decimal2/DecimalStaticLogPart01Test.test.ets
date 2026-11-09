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

function logUnsafe(...args: ESObject[]): Decimal {
  return Decimal.log(args[0] as Value, args[1] as Value);
}

export default function DecimalStaticLogPart01Test() {
  describe('DecimalStaticLogPart01Test', () => {
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
     * @tc.name testDecimalStaticLogPart01Test0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG_PART01_TEST_0010
     * @tc.desc Verify log with no argument throws 401 parameter error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLogPart01Test0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        logUnsafe();
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticLogPart01Test0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG_PART01_TEST_0020
     * @tc.desc Verify log(8) single number argument defaults to base 10 yielding '0.90308998699194358564'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLogPart01Test0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = logUnsafe(8);
      expect(r.toString()).assertEqual('0.90308998699194358564');
    });

    /**
     * @tc.name testDecimalStaticLogPart01Test0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG_PART01_TEST_0030
     * @tc.desc Verify log('8') single string argument defaults to base 10 yielding '0.90308998699194358564'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLogPart01Test0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = logUnsafe('8');
      expect(r.toString()).assertEqual('0.90308998699194358564');
    });

    /**
     * @tc.name testDecimalStaticLogPart01Test0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG_PART01_TEST_0040
     * @tc.desc Verify log(8, 2, 5) ignores extra third argument and returns '3'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLogPart01Test0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = logUnsafe(8, 2, 5);
      expect(r.toString()).assertEqual('3');
    });

    /**
     * @tc.name testDecimalStaticLogPart01Test0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG_PART01_TEST_0050
     * @tc.desc Verify log(100, 10) returns '2'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLogPart01Test0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.log(100, 10);
      expect(r.toString()).assertEqual('2');
    });

    /**
     * @tc.name testDecimalStaticLogPart01Test0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG_PART01_TEST_0060
     * @tc.desc Verify log(1, 10) with any positive base returns '0'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLogPart01Test0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.log(1, 10);
      expect(r.toString()).assertEqual('0');
    });

    /**
     * @tc.name testDecimalStaticLogPart01Test0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG_PART01_TEST_0070
     * @tc.desc Verify log(0.5, 2) with x less than 1 returns '-1'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLogPart01Test0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.log(0.5, 2);
      expect(r.toString()).assertEqual('-1');
    });

    /**
     * @tc.name testDecimalStaticLogPart01Test0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG_PART01_TEST_0080
     * @tc.desc Verify log(0.25, 2) returns '-2'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLogPart01Test0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.log(0.25, 2);
      expect(r.toString()).assertEqual('-2');
    });

    /**
     * @tc.name testDecimalStaticLogPart01Test0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG_PART01_TEST_0090
     * @tc.desc Verify log(0, 2) returns '-Infinity' instead of throwing
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLogPart01Test0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.log(0, 2);
      expect(r.toString()).assertEqual('-Infinity');
    });

    /**
     * @tc.name testDecimalStaticLogPart01Test0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG_PART01_TEST_0100
     * @tc.desc Verify log(-0, 2) treats -0 as zero and returns '-Infinity'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLogPart01Test0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.log(-0, 2);
      expect(r.toString()).assertEqual('-Infinity');
    });

    /**
     * @tc.name testDecimalStaticLogPart01Test0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG_PART01_TEST_0110
     * @tc.desc Verify log(-8, 2) with negative x returns 'NaN' instead of throwing
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLogPart01Test0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.log(-8, 2);
      expect(r.toString()).assertEqual('NaN');
    });

    /**
     * @tc.name testDecimalStaticLogPart01Test0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG_PART01_TEST_0120
     * @tc.desc Verify log(-0.001, 10) with tiny negative x returns 'NaN'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLogPart01Test0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.log(-0.001, 10);
      expect(r.toString()).assertEqual('NaN');
    });

    /**
     * @tc.name testDecimalStaticLogPart01Test0013
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG_PART01_TEST_0130
     * @tc.desc Verify log(NaN, 2) propagates NaN to 'NaN'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLogPart01Test0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.log(NaN, 2);
      expect(r.toString()).assertEqual('NaN');
    });

    /**
     * @tc.name testDecimalStaticLogPart01Test0014
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG_PART01_TEST_0140
     * @tc.desc Verify log(Infinity, 2) returns 'Infinity'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLogPart01Test0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.log(Infinity, 2);
      expect(r.toString()).assertEqual('Infinity');
    });

    /**
     * @tc.name testDecimalStaticLogPart01Test0015
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG_PART01_TEST_0150
     * @tc.desc Verify log(-Infinity, 2) returns 'NaN'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLogPart01Test0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.log(-Infinity, 2);
      expect(r.toString()).assertEqual('NaN');
    });

    /**
     * @tc.name testDecimalStaticLogPart01Test0016
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG_PART01_TEST_0160
     * @tc.desc Verify log(1e7, 10) with scientific notation x returns '7'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLogPart01Test0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.log(1e7, 10);
      expect(r.toString()).assertEqual('7');
    });

    /**
     * @tc.name testDecimalStaticLogPart01Test0017
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG_PART01_TEST_0170
     * @tc.desc Verify log(1e-7, 10) with negative exponent scientific x returns '-7'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLogPart01Test0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.log(1e-7, 10);
      expect(r.toString()).assertEqual('-7');
    });

    /**
     * @tc.name testDecimalStaticLogPart01Test0018
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG_PART01_TEST_0180
     * @tc.desc Verify log(1e100, 10) huge exponent returns '100' without precision overflow
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLogPart01Test0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.log(1e100, 10);
      expect(r.toString()).assertEqual('100');
    });

    /**
     * @tc.name testDecimalStaticLogPart01Test0019
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG_PART01_TEST_0190
     * @tc.desc Verify log(1e-20, 10) tiny exponent returns '-20'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLogPart01Test0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.log(1e-20, 10);
      expect(r.toString()).assertEqual('-20');
    });

    /**
     * @tc.name testDecimalStaticLogPart01Test0020
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG_PART01_TEST_0200
     * @tc.desc Verify log(1e-9, 10) config boundary magnitude returns '-9'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLogPart01Test0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.log(1e-9, 10);
      expect(r.toString()).assertEqual('-9');
    });

    /**
     * @tc.name testDecimalStaticLogPart01Test0021
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG_PART01_TEST_0210
     * @tc.desc Verify log(0x10, 2) hexadecimal literal 16 returns '4'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLogPart01Test0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.log(0x10, 2);
      expect(r.toString()).assertEqual('4');
    });

    /**
     * @tc.name testDecimalStaticLogPart01Test0022
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG_PART01_TEST_0220
     * @tc.desc Verify log(1024, 2) returns '10'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLogPart01Test0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.log(1024, 2);
      expect(r.toString()).assertEqual('10');
    });

    /**
     * @tc.name testDecimalStaticLogPart01Test0023
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG_PART01_TEST_0230
     * @tc.desc Verify log(16, 4) returns '2'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLogPart01Test0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.log(16, 4);
      expect(r.toString()).assertEqual('2');
    });

    /**
     * @tc.name testDecimalStaticLogPart01Test0024
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG_PART01_TEST_0240
     * @tc.desc Verify log(MAX_SAFE_INTEGER, 10) approximates JS Math result within 1e-9
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLogPart01Test0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.log(Number.MAX_SAFE_INTEGER, 10);
      let expected: number = Math.log(Number.MAX_SAFE_INTEGER) / Math.LN10;
      expect(Math.abs(r.toNumber() - expected) < 1e-9).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticLogPart01Test0025
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG_PART01_TEST_0250
     * @tc.desc Verify log(MIN_SAFE_INTEGER, 10) negative value returns 'NaN'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLogPart01Test0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.log(Number.MIN_SAFE_INTEGER, 10);
      expect(r.toString()).assertEqual('NaN');
    });

    /**
     * @tc.name testDecimalStaticLogPart01Test0026
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG_PART01_TEST_0260
     * @tc.desc Verify log(Number.MAX_VALUE, 10) huge finite value approximates within 1e-6
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLogPart01Test0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.log(Number.MAX_VALUE, 10);
      let expected: number = Math.log(Number.MAX_VALUE) / Math.LN10;
      expect(Math.abs(r.toNumber() - expected) < 1).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticLogPart01Test0027
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG_PART01_TEST_0270
     * @tc.desc Verify log(Number.MIN_VALUE, 10) tiny finite value approximates within 1e-6
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLogPart01Test0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.log(Number.MIN_VALUE, 10);
      let expected: number = Math.log(Number.MIN_VALUE) / Math.LN10;
      expect(Math.abs(r.toNumber() - expected) < 1).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticLogPart01Test0028
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG_PART01_TEST_0280
     * @tc.desc Verify log(Number.EPSILON, 10) machine epsilon approximates within 1e-6
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLogPart01Test0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.log(Number.EPSILON, 10);
      let expected: number = Math.log(Number.EPSILON) / Math.LN10;
      expect(Math.abs(r.toNumber() - expected) < 1).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticLogPart01Test0029
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG_PART01_TEST_0290
     * @tc.desc Verify log(9e15, 10) near double precision safe upper bound approximates within 1e-9
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLogPart01Test0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.log(9e15, 10);
      let expected: number = Math.log(9e15) / Math.LN10;
      expect(Math.abs(r.toNumber() - expected) < 1e-9).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticLogPart01Test0030
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG_PART01_TEST_0300
     * @tc.desc Verify log(3, 2) non-integer exact log approximates within 1e-9
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLogPart01Test0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.log(3, 2);
      let expected: number = Math.log(3) / Math.LN2;
      expect(Math.abs(r.toNumber() - expected) < 1e-9).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticLogPart01Test0031
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG_PART01_TEST_0310
     * @tc.desc Verify log(7, 10) non-power log approximates within 1e-9
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLogPart01Test0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.log(7, 10);
      let expected: number = Math.log(7) / Math.LN10;
      expect(Math.abs(r.toNumber() - expected) < 1e-9).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticLogPart01Test0032
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG_PART01_TEST_0320
     * @tc.desc Verify log(8, 1) base 1 divides by zero and returns 'NaN'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLogPart01Test0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.log(8, 1);
      expect(r.toString()).assertEqual('NaN');
    });

    /**
     * @tc.name testDecimalStaticLogPart01Test0033
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG_PART01_TEST_0330
     * @tc.desc Verify log(1, 1) 0/0 boundary returns 'NaN'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLogPart01Test0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.log(1, 1);
      expect(r.toString()).assertEqual('NaN');
    });

    /**
     * @tc.name testDecimalStaticLogPart01Test0034
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG_PART01_TEST_0340
     * @tc.desc Verify log(8, 0) zero base does not throw and returns Decimal object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLogPart01Test0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.log(8, 0);
      expect(r instanceof Decimal).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticLogPart01Test0035
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG_PART01_TEST_0350
     * @tc.desc Verify log(8, -2) negative base returns 'NaN'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLogPart01Test0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.log(8, -2);
      expect(r.toString()).assertEqual('NaN');
    });

    /**
     * @tc.name testDecimalStaticLogPart01Test0036
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG_PART01_TEST_0360
     * @tc.desc Verify log(8, NaN) NaN base propagates to 'NaN'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLogPart01Test0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.log(8, NaN);
      expect(r.toString()).assertEqual('NaN');
    });

    /**
     * @tc.name testDecimalStaticLogPart01Test0037
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG_PART01_TEST_0370
     * @tc.desc Verify log(8, 0.5) base less than 1 flips sign and returns '-3'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLogPart01Test0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.log(8, 0.5);
      expect(r.toString()).assertEqual('-3');
    });

    /**
     * @tc.name testDecimalStaticLogPart01Test0038
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG_PART01_TEST_0380
     * @tc.desc Verify log(0.5, 0.5) base equal to x both below 1 returns '1'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLogPart01Test0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.log(0.5, 0.5);
      expect(r.toString()).assertEqual('1');
    });

    /**
     * @tc.name testDecimalStaticLogPart01Test0039
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG_PART01_TEST_0390
     * @tc.desc Verify log(8, -Infinity) negative infinity base returns 'NaN'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLogPart01Test0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.log(8, -Infinity);
      expect(r.toString()).assertEqual('NaN');
    });

    /**
     * @tc.name testDecimalStaticLogPart01Test0040
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG_PART01_TEST_0400
     * @tc.desc Verify log(2, 4) inverse base relation returns '0.5'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLogPart01Test0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.log(2, 4);
      expect(r.toString()).assertEqual('0.5');
    });

    /**
     * @tc.name testDecimalStaticLogPart01Test0041
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG_PART01_TEST_0410
     * @tc.desc Verify log(10, 100) inverse base relation returns '0.5'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLogPart01Test0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.log(10, 100);
      expect(r.toString()).assertEqual('0.5');
    });

    /**
     * @tc.name testDecimalStaticLogPart01Test0042
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG_PART01_TEST_0420
     * @tc.desc Verify log(8, 0.25) fractional base below 1 returns '-1.5'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLogPart01Test0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.log(8, 0.25);
      expect(r.toString()).assertEqual('-1.5');
    });

    /**
     * @tc.name testDecimalStaticLogPart01Test0043
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG_PART01_TEST_0430
     * @tc.desc Verify log(16, 0.5) decimal base negative log returns '-4'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLogPart01Test0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.log(16, 0.5);
      expect(r.toString()).assertEqual('-4');
    });

    /**
     * @tc.name testDecimalStaticLogPart01Test0044
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG_PART01_TEST_0440
     * @tc.desc Verify log(81, 3) integer base with integer x returns '4'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLogPart01Test0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.log(81, 3);
      expect(r.toString()).assertEqual('4');
    });

    /**
     * @tc.name testDecimalStaticLogPart01Test0045
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG_PART01_TEST_0450
     * @tc.desc Verify log(6.25, 2.5) non-integer base returns '2'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLogPart01Test0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.log(6.25, 2.5);
      expect(r.toString()).assertEqual('2');
    });

    /**
     * @tc.name testDecimalStaticLogPart01Test0046
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG_PART01_TEST_0460
     * @tc.desc Verify log(0.1, 0.1) base equal to x returns '1'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLogPart01Test0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.log(0.1, 0.1);
      expect(r.toString()).assertEqual('1');
    });

    /**
     * @tc.name testDecimalStaticLogPart01Test0047
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG_PART01_TEST_0470
     * @tc.desc Verify log(1, 0.5) ln(1) over negative gives -0 strictly equal to 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLogPart01Test0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.log(1, 0.5);
      expect(r.toNumber() === 0).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticLogPart01Test0048
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG_PART01_TEST_0480
     * @tc.desc Verify log('8', 2) string x with number base returns '3'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLogPart01Test0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.log('8', 2);
      expect(r.toString()).assertEqual('3');
    });

    /**
     * @tc.name testDecimalStaticLogPart01Test0049
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG_PART01_TEST_0490
     * @tc.desc Verify log(8, '2') number x with string base returns '3'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLogPart01Test0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.log(8, '2');
      expect(r.toString()).assertEqual('3');
    });

    /**
     * @tc.name testDecimalStaticLogPart01Test0050
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG_PART01_TEST_0500
     * @tc.desc Verify log('8', '2') both string arguments returns '3'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLogPart01Test0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.log('8', '2');
      expect(r.toString()).assertEqual('3');
    });

    /**
     * @tc.name testDecimalStaticLogPart01Test0051
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG_PART01_TEST_0510
     * @tc.desc Verify log(new Decimal(8), 2) Decimal x with number base returns '3'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLogPart01Test0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.log(new Decimal(8), 2);
      expect(r.toString()).assertEqual('3');
    });

    /**
     * @tc.name testDecimalStaticLogPart01Test0052
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG_PART01_TEST_0520
     * @tc.desc Verify log(8, new Decimal(2)) number x with Decimal base returns '3'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLogPart01Test0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.log(8, new Decimal(2));
      expect(r.toString()).assertEqual('3');
    });

    /**
     * @tc.name testDecimalStaticLogPart01Test0053
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG_PART01_TEST_0530
     * @tc.desc Verify log(new Decimal(8), new Decimal(2)) both Decimal arguments returns '3'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLogPart01Test0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.log(new Decimal(8), new Decimal(2));
      expect(r.toString()).assertEqual('3');
    });

    /**
     * @tc.name testDecimalStaticLogPart01Test0054
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG_PART01_TEST_0540
     * @tc.desc Verify log(new Decimal('8'), '2') Decimal x with string base returns '3'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLogPart01Test0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.log(new Decimal('8'), '2');
      expect(r.toString()).assertEqual('3');
    });

    /**
     * @tc.name testDecimalStaticLogPart01Test0055
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG_PART01_TEST_0550
     * @tc.desc Verify log('8', new Decimal(2)) string x with Decimal base returns '3'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLogPart01Test0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.log('8', new Decimal(2));
      expect(r.toString()).assertEqual('3');
    });

    /**
     * @tc.name testDecimalStaticLogPart01Test0056
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG_PART01_TEST_0560
     * @tc.desc Verify log(new Decimal(1), 5) Decimal x of 1 returns '0'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLogPart01Test0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.log(new Decimal(1), 5);
      expect(r.toString()).assertEqual('0');
    });

    /**
     * @tc.name testDecimalStaticLogPart01Test0057
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG_PART01_TEST_0570
     * @tc.desc Verify log(new Decimal(0.5), new Decimal(2)) double Decimal fractional x returns '-1'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLogPart01Test0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.log(new Decimal(0.5), new Decimal(2));
      expect(r.toString()).assertEqual('-1');
    });

    /**
     * @tc.name testDecimalStaticLogPart01Test0058
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG_PART01_TEST_0580
     * @tc.desc Verify log(new Decimal(100), 10) Decimal x returns '2'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLogPart01Test0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.log(new Decimal(100), 10);
      expect(r.toString()).assertEqual('2');
    });

    /**
     * @tc.name testDecimalStaticLogPart01Test0059
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG_PART01_TEST_0590
     * @tc.desc Verify log(new Decimal(-8), 2) Decimal negative x returns 'NaN'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLogPart01Test0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.log(new Decimal(-8), 2);
      expect(r.toString()).assertEqual('NaN');
    });

    /**
     * @tc.name testDecimalStaticLogPart01Test0060
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG_PART01_TEST_0600
     * @tc.desc Verify log(new Decimal(0), 2) Decimal zero x returns '-Infinity'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLogPart01Test0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.log(new Decimal(0), 2);
      expect(r.toString()).assertEqual('-Infinity');
    });

    /**
     * @tc.name testDecimalStaticLogPart01Test0061
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG_PART01_TEST_0610
     * @tc.desc Verify log(new Decimal('1e2'), 10) Decimal scientific x returns '2'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLogPart01Test0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.log(new Decimal('1e2'), 10);
      expect(r.toString()).assertEqual('2');
    });

    /**
     * @tc.name testDecimalStaticLogPart01Test0062
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG_PART01_TEST_0620
     * @tc.desc Verify log(5, new Decimal(5)) x equal to base returns '1'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLogPart01Test0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.log(5, new Decimal(5));
      expect(r.toString()).assertEqual('1');
    });

    /**
     * @tc.name testDecimalStaticLogPart01Test0063
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG_PART01_TEST_0630
     * @tc.desc Verify log('1e2', 10) string scientific x returns '2'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLogPart01Test0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.log('1e2', 10);
      expect(r.toString()).assertEqual('2');
    });

    /**
     * @tc.name testDecimalStaticLogPart01Test0064
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG_PART01_TEST_0640
     * @tc.desc Verify log(2, '1e1') scientific string base approximates within 1e-9
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLogPart01Test0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.log(2, '1e1');
      let expected: number = Math.log(2) / Math.LN10;
      expect(Math.abs(r.toNumber() - expected) < 1e-9).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticLogPart01Test0065
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG_PART01_TEST_0650
     * @tc.desc Verify log('0x10', 2) hex string 16 returns '4'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLogPart01Test0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.log('0x10', 2);
      expect(r.toString()).assertEqual('4');
    });

    /**
     * @tc.name testDecimalStaticLogPart01Test0066
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG_PART01_TEST_0660
     * @tc.desc Verify log(16, '0x10') hex string base 16 returns '1'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLogPart01Test0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.log(16, '0x10');
      expect(r.toString()).assertEqual('1');
    });

    /**
     * @tc.name testDecimalStaticLogPart01Test0067
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG_PART01_TEST_0670
     * @tc.desc Verify log('1', 100) string x of 1 returns '0'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLogPart01Test0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.log('1', 100);
      expect(r.toString()).assertEqual('0');
    });

    /**
     * @tc.name testDecimalStaticLogPart01Test0068
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG_PART01_TEST_0680
     * @tc.desc Verify log(1, '100') string base with x of 1 returns '0'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLogPart01Test0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.log(1, '100');
      expect(r.toString()).assertEqual('0');
    });

    /**
     * @tc.name testDecimalStaticLogPart01Test0069
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG_PART01_TEST_0690
     * @tc.desc Verify log('0008', 2) leading zero string x returns '3'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLogPart01Test0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.log('0008', 2);
      expect(r.toString()).assertEqual('3');
    });

    /**
     * @tc.name testDecimalStaticLogPart01Test0070
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG_PART01_TEST_0700
     * @tc.desc Verify log(8, '0002') leading zero string base returns '3'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLogPart01Test0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.log(8, '0002');
      expect(r.toString()).assertEqual('3');
    });

    /**
     * @tc.name testDecimalStaticLogPart01Test0071
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG_PART01_TEST_0710
     * @tc.desc Verify log('+8', 2) plus-signed string x returns '3'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLogPart01Test0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.log('+8', 2);
      expect(r.toString()).assertEqual('3');
    });

    /**
     * @tc.name testDecimalStaticLogPart01Test0072
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG_PART01_TEST_0720
     * @tc.desc Verify argument order sensitivity log(256, 2) returns '8'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLogPart01Test0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.log(256, 2);
      expect(r.toString()).assertEqual('8');
    });

    /**
     * @tc.name testDecimalStaticLogPart01Test0073
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG_PART01_TEST_0730
     * @tc.desc Verify log(0, '2') zero x with string base returns '-Infinity'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLogPart01Test0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.log(0, '2');
      expect(r.toString()).assertEqual('-Infinity');
    });

    /**
     * @tc.name testDecimalStaticLogPart01Test0074
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG_PART01_TEST_0740
     * @tc.desc Verify log('0', 2) string zero x returns '-Infinity'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLogPart01Test0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.log('0', 2);
      expect(r.toString()).assertEqual('-Infinity');
    });

    /**
     * @tc.name testDecimalStaticLogPart01Test0075
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG_PART01_TEST_0750
     * @tc.desc Verify log(0, 0.5) x=0 with base<1 returns 'Infinity'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLogPart01Test0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.log(0, 0.5);
      expect(r.toString()).assertEqual('-Infinity');
    });

    /**
     * @tc.name testDecimalStaticLogPart01Test0076
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG_PART01_TEST_0760
     * @tc.desc Verify log(-1, 10) negative x with integer base returns 'NaN'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLogPart01Test0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.log(-1, 10);
      expect(r.toString()).assertEqual('NaN');
    });

    /**
     * @tc.name testDecimalStaticLogPart01Test0077
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG_PART01_TEST_0770
     * @tc.desc Verify log(100, 0.1) base<1 sign flip returns '-2'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLogPart01Test0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.log(100, 0.1);
      expect(r.toString()).assertEqual('-2');
    });

    /**
     * @tc.name testDecimalStaticLogPart01Test0078
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG_PART01_TEST_0780
     * @tc.desc Verify log(0.01, 0.1) both below 1 returns '2'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLogPart01Test0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.log(0.01, 0.1);
      expect(r.toString()).assertEqual('2');
    });

    /**
     * @tc.name testDecimalStaticLogPart01Test0079
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG_PART01_TEST_0790
     * @tc.desc Verify log(0.01, 10) fractional x with integer base returns '-2'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLogPart01Test0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.log(0.01, 10);
      expect(r.toString()).assertEqual('-2');
    });

    /**
     * @tc.name testDecimalStaticLogPart01Test0080
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG_PART01_TEST_0800
     * @tc.desc Verify log(10, 0.01) inverse fractional base returns '-0.5'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLogPart01Test0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.log(10, 0.01);
      expect(r.toString()).assertEqual('-0.5');
    });

    /**
     * @tc.name testDecimalStaticLogPart01Test0081
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG_PART01_TEST_0810
     * @tc.desc Verify log(2, 1e1) scientific number base approximates within 1e-9
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLogPart01Test0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.log(2, 1e1);
      let expected: number = Math.log(2) / Math.LN10;
      expect(Math.abs(r.toNumber() - expected) < 1e-9).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticLogPart01Test0082
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG_PART01_TEST_0820
     * @tc.desc Verify log(100, 1e1) scientific number base returns '2'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLogPart01Test0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.log(100, 1e1);
      expect(r.toString()).assertEqual('2');
    });

    /**
     * @tc.name testDecimalStaticLogPart01Test0083
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG_PART01_TEST_0830
     * @tc.desc Verify log(0.3, 0.9) double decimal non-exact approximates within 1e-9
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLogPart01Test0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.log(0.3, 0.9);
      let expected: number = Math.log(0.3) / Math.log(0.9);
      expect(Math.abs(r.toNumber() - expected) < 1e-9).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticLogPart01Test0084
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG_PART01_TEST_0840
     * @tc.desc Verify log(8, 2) return value is a Decimal instance
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLogPart01Test0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.log(8, 2);
      expect(r instanceof Decimal).assertTrue();
      expect(r.toString()).assertEqual('3');
    });

    /**
     * @tc.name testDecimalStaticLogPart01Test0085
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG_PART01_TEST_0850
     * @tc.desc Verify log(x, 2) returns new object not sharing reference with input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLogPart01Test0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: Decimal = new Decimal(8);
      let r: Decimal = Decimal.log(x, 2);
      expect(r !== x).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticLogPart01Test0086
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG_PART01_TEST_0860
     * @tc.desc Verify log(x, 2) does not modify input Decimal which stays '8'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLogPart01Test0086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: Decimal = new Decimal(8);
      Decimal.log(x, 2);
      expect(x.toString()).assertEqual('8');
    });

    /**
     * @tc.name testDecimalStaticLogPart01Test0087
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG_PART01_TEST_0870
     * @tc.desc Verify log(8, 2) normal result isFinite returns true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLogPart01Test0087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.log(8, 2);
      expect(r.isFinite()).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticLogPart01Test0088
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG_PART01_TEST_0880
     * @tc.desc Verify log(-8, 2) NaN result isNaN returns true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLogPart01Test0088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.log(-8, 2);
      expect(r.isNaN()).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticLogPart01Test0089
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG_PART01_TEST_0890
     * @tc.desc Verify log(2, 256) toString '0.125' and toNumber 0.125 are consistent
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLogPart01Test0089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.log(2, 256);
      expect(r.toString()).assertEqual('0.125');
      expect(r.toNumber()).assertEqual(0.125);
    });

    /**
     * @tc.name testDecimalStaticLogPart01Test0090
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG_PART01_TEST_0900
     * @tc.desc Verify log(null, 2) null x throws 401 parameter error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLogPart01Test0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        logUnsafe(null, 2);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticLogPart01Test0091
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG_PART01_TEST_0910
     * @tc.desc Verify log(null, null) both null arguments throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLogPart01Test0091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        logUnsafe(null, null);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticLogPart01Test0092
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG_PART01_TEST_0920
     * @tc.desc Verify log(undefined, 2) undefined x throws 401 parameter error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLogPart01Test0092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        logUnsafe(undefined, 2);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticLogPart01Test0093
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG_PART01_TEST_0930
     * @tc.desc Verify log(undefined, undefined) both undefined throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLogPart01Test0093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        logUnsafe(undefined, undefined);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticLogPart01Test0094
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG_PART01_TEST_0940
     * @tc.desc Verify log(null, '2') null x with valid string base throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLogPart01Test0094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        logUnsafe(null, '2');
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticLogPart01Test0095
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG_PART01_TEST_0950
     * @tc.desc Verify log('8', null) null base with string x defaults to base 10 yielding '0.90308998699194358564'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLogPart01Test0095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = logUnsafe('8', null);
      expect(r.toString()).assertEqual('0.90308998699194358564');
    });

    /**
     * @tc.name testDecimalStaticLogPart01Test0096
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG_PART01_TEST_0960
     * @tc.desc Verify log({}, 2) plain object x without properties throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLogPart01Test0096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let obj: Record<string, number> = {};
      let apiThrew1_1: boolean = false;
      try {
        logUnsafe(obj, 2);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticLogPart01Test0097
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG_PART01_TEST_0970
     * @tc.desc Verify log(8, {}) plain object base without properties throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLogPart01Test0097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let obj: Record<string, number> = {};
      let apiThrew1_1: boolean = false;
      try {
        logUnsafe(8, obj);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticLogPart01Test0098
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG_PART01_TEST_0980
     * @tc.desc Verify log('', 2) empty string x throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLogPart01Test0098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        logUnsafe('', 2);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticLogPart01Test0099
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG_PART01_TEST_0990
     * @tc.desc Verify log('   ', 2) all-space string x throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLogPart01Test0099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        logUnsafe('   ', 2);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticLogPart01Test0100
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG_PART01_TEST_1000
     * @tc.desc Verify log with zero-width space string x throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLogPart01Test0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        logUnsafe('\u200B', 2);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticLogPart01Test0101
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG_PART01_TEST_1010
     * @tc.desc Verify log with NUL character string x throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLogPart01Test0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        logUnsafe('\u0000', 2);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticLogPart01Test0102
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG_PART01_TEST_1020
     * @tc.desc Verify log('abc', 2) plain invalid string x throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLogPart01Test0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        logUnsafe('abc', 2);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticLogPart01Test0103
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG_PART01_TEST_1030
     * @tc.desc Verify log XSS injection string x throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLogPart01Test0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        logUnsafe('<script>alert(1)</script>', 2);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticLogPart01Test0104
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG_PART01_TEST_1040
     * @tc.desc Verify log emoji string x throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLogPart01Test0104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        logUnsafe('\uD83D\uDE00', 2);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticLogPart01Test0105
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG_PART01_TEST_1050
     * @tc.desc Verify log lone surrogate string x throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLogPart01Test0105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        logUnsafe('\uD800', 2);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticLogPart01Test0106
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG_PART01_TEST_1060
     * @tc.desc Verify log('1e', 2) incomplete exponent string x throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLogPart01Test0106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        logUnsafe('1e', 2);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticLogPart01Test0107
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG_PART01_TEST_1070
     * @tc.desc Verify log('0x', 2) incomplete hex string x throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLogPart01Test0107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        logUnsafe('0x', 2);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticLogPart01Test0108
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG_PART01_TEST_1080
     * @tc.desc Verify log('1.2.3', 2) multiple dots string x throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLogPart01Test0108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        logUnsafe('1.2.3', 2);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticLogPart01Test0109
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG_PART01_TEST_1090
     * @tc.desc Verify log('NaN', 2) string NaN parses and propagates to 'NaN' not 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLogPart01Test0109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.log('NaN', 2);
      expect(r.toString()).assertEqual('NaN');
    });

    /**
     * @tc.name testDecimalStaticLogPart01Test0110
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG_PART01_TEST_1100
     * @tc.desc Verify log('Infinity', 2) parses and propagates to 'Infinity'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLogPart01Test0110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.log('Infinity', 2);
      expect(r.toString()).assertEqual('Infinity');
    });

    /**
     * @tc.name testDecimalStaticLogPart01Test0111
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG_PART01_TEST_1110
     * @tc.desc Verify log('-Infinity', 2) parses negative infinity and returns 'NaN'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLogPart01Test0111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.log('-Infinity', 2);
      expect(r.toString()).assertEqual('NaN');
    });

    /**
     * @tc.name testDecimalStaticLogPart01Test0112
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG_PART01_TEST_1120
     * @tc.desc Verify log('1e309', 10) beyond double exponent parses to log 309
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLogPart01Test0112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.log('1e309', 10);
      expect(r.toNumber()).assertEqual(309);
    });

    /**
     * @tc.name testDecimalStaticLogPart01Test0113
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG_PART01_TEST_1130
     * @tc.desc Verify log('0xG', 2) invalid hex letters string throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLogPart01Test0113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        logUnsafe('0xG', 2);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticLogPart01Test0114
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG_PART01_TEST_1140
     * @tc.desc Verify log non-ASCII digit string x throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLogPart01Test0114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        logUnsafe('\u0661\u0662\u0663', 2);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticLogPart01Test0115
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG_PART01_TEST_1150
     * @tc.desc Verify log(new Decimal(0.25), new Decimal(0.5)) double Decimal below 1 returns '2'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLogPart01Test0115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.log(new Decimal(0.25), new Decimal(0.5));
      expect(r.toString()).assertEqual('2');
    });

    /**
     * @tc.name testDecimalStaticLogPart01Test0116
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG_PART01_TEST_1160
     * @tc.desc Verify log(2, 8) equals 1/3 approximated within 1e-12
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLogPart01Test0116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.log(2, 8);
      let expected: number = 1 / 3;
      expect(Math.abs(r.toNumber() - expected) < 1e-12).assertTrue();
    });
  });
}
