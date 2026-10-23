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

export default function DecimalStaticLogPart02Test() {
  describe('DecimalStaticLogPart02Test', () => {
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
     * @tc.name testDecimalStaticLogPart02Test0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG_PART02_TEST_0010
     * @tc.desc Verify log('1e-7', 10) lowercase sci negative exponent returns '-7'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLogPart02Test0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: Decimal = Decimal.log('1e-7', 10);
      expect(dec.toString()).assertEqual('-7');
    });

    /**
     * @tc.name testDecimalStaticLogPart02Test0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG_PART02_TEST_0020
     * @tc.desc Verify log('1E7', 10) uppercase E exponent returns '7'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLogPart02Test0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: Decimal = Decimal.log('1E7', 10);
      expect(dec.toString()).assertEqual('7');
    });

    /**
     * @tc.name testDecimalStaticLogPart02Test0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG_PART02_TEST_0030
     * @tc.desc Verify log('+123', 10) explicit plus sign approximates 2.0899051114393979
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLogPart02Test0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: Decimal = Decimal.log('+123', 10);
      expect(Math.abs(dec.toNumber() - 2.0899051114393979) < 1e-10).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticLogPart02Test0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG_PART02_TEST_0040
     * @tc.desc Verify log('00.5', 10) leading zero string approximates -0.3010299956639812
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLogPart02Test0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: Decimal = Decimal.log('00.5', 10);
      expect(Math.abs(dec.toNumber() - (-0.3010299956639812)) < 1e-10).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticLogPart02Test0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG_PART02_TEST_0050
     * @tc.desc Verify log('25.', 10) trailing dot string approximates 1.3979400086720376
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLogPart02Test0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: Decimal = Decimal.log('25.', 10);
      expect(Math.abs(dec.toNumber() - 1.3979400086720376) < 1e-10).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticLogPart02Test0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG_PART02_TEST_0060
     * @tc.desc Verify log('1234.567', 10) multi-digit decimal approximates 3.0915146640862627
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLogPart02Test0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: Decimal = Decimal.log('1234.567', 10);
      expect(Math.abs(dec.toNumber() - 3.0915146640862627) < 1e-10).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticLogPart02Test0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG_PART02_TEST_0070
     * @tc.desc Verify log('1e-100', 10) negative exponent power string returns '-100'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLogPart02Test0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: Decimal = Decimal.log('1e-100', 10);
      expect(dec.toString()).assertEqual('-100');
    });

    /**
     * @tc.name testDecimalStaticLogPart02Test0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG_PART02_TEST_0080
     * @tc.desc Verify log('abc', 10) pure letter string throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLogPart02Test0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let apiThrew1_1: boolean = false;
      try {
        logUnsafe('abc', 10);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticLogPart02Test0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG_PART02_TEST_0090
     * @tc.desc Verify log('', 10) empty string throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLogPart02Test0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let apiThrew1_1: boolean = false;
      try {
        logUnsafe('', 10);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticLogPart02Test0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG_PART02_TEST_0100
     * @tc.desc Verify log('   ', 10) all-space string throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLogPart02Test0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let apiThrew1_1: boolean = false;
      try {
        logUnsafe('   ', 10);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticLogPart02Test0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG_PART02_TEST_0110
     * @tc.desc Verify log('\t', 10) tab character string throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLogPart02Test0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let apiThrew1_1: boolean = false;
      try {
        logUnsafe('\t', 10);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticLogPart02Test0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG_PART02_TEST_0120
     * @tc.desc Verify log zero-width space string throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLogPart02Test0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let apiThrew1_1: boolean = false;
      try {
        logUnsafe('\u200B', 10);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticLogPart02Test0013
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG_PART02_TEST_0130
     * @tc.desc Verify log NUL character string throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLogPart02Test0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let apiThrew1_1: boolean = false;
      try {
        logUnsafe('\u0000', 10);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticLogPart02Test0014
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG_PART02_TEST_0140
     * @tc.desc Verify log BOM zero-width no-break space string throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLogPart02Test0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let apiThrew1_1: boolean = false;
      try {
        logUnsafe('\uFEFF', 10);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticLogPart02Test0015
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG_PART02_TEST_0150
     * @tc.desc Verify log emoji string throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLogPart02Test0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let apiThrew1_1: boolean = false;
      try {
        logUnsafe('\uD83D\uDE00', 10);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticLogPart02Test0016
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG_PART02_TEST_0160
     * @tc.desc Verify log lone surrogate string throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLogPart02Test0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let apiThrew1_1: boolean = false;
      try {
        logUnsafe('\uD800', 10);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticLogPart02Test0017
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG_PART02_TEST_0170
     * @tc.desc Verify log XSS payload string throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLogPart02Test0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let apiThrew1_1: boolean = false;
      try {
        logUnsafe('<script>alert(1)</script>', 10);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticLogPart02Test0018
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG_PART02_TEST_0180
     * @tc.desc Verify log('1,000', 10) thousands separator string throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLogPart02Test0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let apiThrew1_1: boolean = false;
      try {
        logUnsafe('1,000', 10);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticLogPart02Test0019
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG_PART02_TEST_0190
     * @tc.desc Verify log('1.2.3', 10) double dot string throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLogPart02Test0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let apiThrew1_1: boolean = false;
      try {
        logUnsafe('1.2.3', 10);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticLogPart02Test0020
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG_PART02_TEST_0200
     * @tc.desc Verify log('0x', 10) incomplete hex prefix string throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLogPart02Test0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let apiThrew1_1: boolean = false;
      try {
        logUnsafe('0x', 10);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticLogPart02Test0021
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG_PART02_TEST_0210
     * @tc.desc Verify log('12a', 10) trailing letter string throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLogPart02Test0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let apiThrew1_1: boolean = false;
      try {
        logUnsafe('12a', 10);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticLogPart02Test0022
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG_PART02_TEST_0220
     * @tc.desc Verify log('1_000', 10) underscore string parses as 1000 returning '3'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLogPart02Test0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = logUnsafe('1_000', 10);
      expect(r.toString()).assertEqual('3');
    });

    /**
     * @tc.name testDecimalStaticLogPart02Test0023
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG_PART02_TEST_0230
     * @tc.desc Verify log('1 0', 10) mid-number space string throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLogPart02Test0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let apiThrew1_1: boolean = false;
      try {
        logUnsafe('1 0', 10);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticLogPart02Test0024
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG_PART02_TEST_0240
     * @tc.desc Verify log('--5', 10) double minus string throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLogPart02Test0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let apiThrew1_1: boolean = false;
      try {
        logUnsafe('--5', 10);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticLogPart02Test0025
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG_PART02_TEST_0250
     * @tc.desc Verify log('1e-', 10) exponent missing digits throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLogPart02Test0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let apiThrew1_1: boolean = false;
      try {
        logUnsafe('1e-', 10);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticLogPart02Test0026
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG_PART02_TEST_0260
     * @tc.desc Verify log('+', 10) plus sign only string throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLogPart02Test0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let apiThrew1_1: boolean = false;
      try {
        logUnsafe('+', 10);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticLogPart02Test0027
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG_PART02_TEST_0270
     * @tc.desc Verify log(1000, '10') string base returns '3'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLogPart02Test0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: Decimal = Decimal.log(1000, '10');
      expect(dec.toString()).assertEqual('3');
    });

    /**
     * @tc.name testDecimalStaticLogPart02Test0028
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG_PART02_TEST_0280
     * @tc.desc Verify log(10, '1e1') scientific string base returns '1'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLogPart02Test0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: Decimal = Decimal.log(10, '1e1');
      expect(dec.toString()).assertEqual('1');
    });

    /**
     * @tc.name testDecimalStaticLogPart02Test0029
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG_PART02_TEST_0290
     * @tc.desc Verify log(10, '2.5') fractional string base approximates 2.5129415947320601
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLogPart02Test0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: Decimal = Decimal.log(10, '2.5');
      expect(Math.abs(dec.toNumber() - 2.5129415947320601) < 1e-10).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticLogPart02Test0030
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG_PART02_TEST_0300
     * @tc.desc Verify log(10, '0.5') below-one string base approximates -3.3219280948873623
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLogPart02Test0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: Decimal = Decimal.log(10, '0.5');
      expect(Math.abs(dec.toNumber() - (-3.3219280948873623)) < 1e-10).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticLogPart02Test0031
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG_PART02_TEST_0310
     * @tc.desc Verify log(2, '256') string base 256 returns '0.125'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLogPart02Test0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: Decimal = Decimal.log(2, '256');
      expect(dec.toString()).assertEqual('0.125');
    });

    /**
     * @tc.name testDecimalStaticLogPart02Test0032
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG_PART02_TEST_0320
     * @tc.desc Verify log(10, '1e-999999') tiny string base approximates -0.000001000001
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLogPart02Test0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: Decimal = Decimal.log(10, '1e-999999');
      expect(Math.abs(dec.toNumber() - (-0.000001000001000001000001)) < 1e-12).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticLogPart02Test0033
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG_PART02_TEST_0330
     * @tc.desc Verify log(10, 'abc') invalid string base throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLogPart02Test0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let apiThrew1_1: boolean = false;
      try {
        logUnsafe(10, 'abc');
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticLogPart02Test0034
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG_PART02_TEST_0340
     * @tc.desc Verify log(10, '') empty string base throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLogPart02Test0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let apiThrew1_1: boolean = false;
      try {
        logUnsafe(10, '');
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticLogPart02Test0035
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG_PART02_TEST_0350
     * @tc.desc Verify log(10, '   ') all-space string base throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLogPart02Test0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let apiThrew1_1: boolean = false;
      try {
        logUnsafe(10, '   ');
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticLogPart02Test0036
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG_PART02_TEST_0360
     * @tc.desc Verify log(10, zero-width space) zero-width string base throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLogPart02Test0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let apiThrew1_1: boolean = false;
      try {
        logUnsafe(10, '\u200B');
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticLogPart02Test0037
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG_PART02_TEST_0370
     * @tc.desc Verify log(10, '1e-') incomplete exponent string base throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLogPart02Test0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let apiThrew1_1: boolean = false;
      try {
        logUnsafe(10, '1e-');
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticLogPart02Test0038
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG_PART02_TEST_0380
     * @tc.desc Verify log(100, ' 10 ') padded string base throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLogPart02Test0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let apiThrew1_1: boolean = false;
      try {
        logUnsafe(100, ' 10 ');
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticLogPart02Test0039
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG_PART02_TEST_0390
     * @tc.desc Verify log(0, 10) zero x returns negative infinity not finite
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLogPart02Test0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: Decimal = Decimal.log(0, 10);
      expect(dec.isNegative()).assertTrue();
      expect(dec.isFinite()).assertFalse();
    });

    /**
     * @tc.name testDecimalStaticLogPart02Test0040
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG_PART02_TEST_0400
     * @tc.desc Verify log(-0, 10) same path as 0 returns negative infinity
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLogPart02Test0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: Decimal = Decimal.log(-0, 10);
      expect(dec.isNegative()).assertTrue();
      expect(dec.isFinite()).assertFalse();
    });

    /**
     * @tc.name testDecimalStaticLogPart02Test0041
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG_PART02_TEST_0410
     * @tc.desc Verify log(NaN, 10) NaN x propagates to NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLogPart02Test0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: Decimal = Decimal.log(NaN, 10);
      expect(dec.isNaN()).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticLogPart02Test0042
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG_PART02_TEST_0420
     * @tc.desc Verify log(Infinity, 10) positive infinity x returns positive infinity
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLogPart02Test0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: Decimal = Decimal.log(Infinity, 10);
      expect(dec.isNegative()).assertFalse();
      expect(dec.isFinite()).assertFalse();
    });

    /**
     * @tc.name testDecimalStaticLogPart02Test0043
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG_PART02_TEST_0430
     * @tc.desc Verify log(-1, 10) negative integer x returns NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLogPart02Test0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: Decimal = Decimal.log(-1, 10);
      expect(dec.isNaN()).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticLogPart02Test0044
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG_PART02_TEST_0440
     * @tc.desc Verify log(-0.5, 10) negative fraction x returns NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLogPart02Test0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: Decimal = Decimal.log(-0.5, 10);
      expect(dec.isNaN()).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticLogPart02Test0045
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG_PART02_TEST_0450
     * @tc.desc Verify log(-Number.MIN_VALUE, 10) negative tiny x returns NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLogPart02Test0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: Decimal = Decimal.log(-Number.MIN_VALUE, 10);
      expect(dec.isNaN()).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticLogPart02Test0046
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG_PART02_TEST_0460
     * @tc.desc Verify log(-Number.MAX_VALUE, 10) negative huge x returns NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLogPart02Test0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: Decimal = Decimal.log(-Number.MAX_VALUE, 10);
      expect(dec.isNaN()).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticLogPart02Test0047
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG_PART02_TEST_0470
     * @tc.desc Verify log(-Number.MAX_SAFE_INTEGER, 10) negative safe integer returns NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLogPart02Test0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: Decimal = Decimal.log(-Number.MAX_SAFE_INTEGER, 10);
      expect(dec.isNaN()).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticLogPart02Test0048
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG_PART02_TEST_0480
     * @tc.desc Verify log(Number.MAX_VALUE, 2) finite about 1023.9999999999999998
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLogPart02Test0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: Decimal = Decimal.log(Number.MAX_VALUE, 2);
      expect(dec.isFinite()).assertTrue();
      expect(Math.abs(dec.toNumber() - 1023.9999999999999998) < 1e-10).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticLogPart02Test0049
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG_PART02_TEST_0490
     * @tc.desc Verify log(Number.MIN_VALUE, 2) subnormal boundary about -1073.9827746486180384
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLogPart02Test0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: Decimal = Decimal.log(Number.MIN_VALUE, 2);
      expect(dec.isFinite()).assertTrue();
      expect(Math.abs(dec.toNumber() - (-1073.9827746486180384)) < 1e-6).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticLogPart02Test0050
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG_PART02_TEST_0500
     * @tc.desc Verify log(Number.EPSILON, 2) about -52.000000000000000053
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLogPart02Test0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: Decimal = Decimal.log(Number.EPSILON, 2);
      expect(Math.abs(dec.toNumber() - (-52.000000000000000053)) < 1e-6).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticLogPart02Test0051
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG_PART02_TEST_0510
     * @tc.desc Verify log(Number.MAX_SAFE_INTEGER, 2) about 52.99999999999999984
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLogPart02Test0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: Decimal = Decimal.log(Number.MAX_SAFE_INTEGER, 2);
      expect(Math.abs(dec.toNumber() - 52.99999999999999984) < 1e-6).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticLogPart02Test0052
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG_PART02_TEST_0520
     * @tc.desc Verify log('9007199254740993', 2) over-safe string greater than 53
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLogPart02Test0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: Decimal = Decimal.log('9007199254740993', 2);
      expect(dec.comparedTo(53)).assertEqual(1);
    });

    /**
     * @tc.name testDecimalStaticLogPart02Test0053
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG_PART02_TEST_0530
     * @tc.desc Verify log(5e-324, 10) smallest subnormal about -323.3010299956639812
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLogPart02Test0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: Decimal = Decimal.log(5e-324, 10);
      expect(dec.isFinite()).assertTrue();
      expect(Math.abs(dec.toNumber() - (-323.3010299956639812)) < 1e-6).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticLogPart02Test0054
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG_PART02_TEST_0540
     * @tc.desc Verify log(10, 1) base 1 returns NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLogPart02Test0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: Decimal = Decimal.log(10, 1);
      expect(dec.isNaN()).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticLogPart02Test0055
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG_PART02_TEST_0550
     * @tc.desc Verify log(10, -2) negative base returns NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLogPart02Test0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: Decimal = Decimal.log(10, -2);
      expect(dec.isNaN()).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticLogPart02Test0056
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG_PART02_TEST_0560
     * @tc.desc Verify log(10, 0) zero base returns NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLogPart02Test0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: Decimal = Decimal.log(10, 0);
      expect(dec.isNaN()).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticLogPart02Test0057
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG_PART02_TEST_0570
     * @tc.desc Verify log(10, -0) negative zero base returns NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLogPart02Test0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: Decimal = Decimal.log(10, -0);
      expect(dec.isNaN()).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticLogPart02Test0058
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG_PART02_TEST_0580
     * @tc.desc Verify log(10, NaN) NaN base propagates to NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLogPart02Test0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: Decimal = Decimal.log(10, NaN);
      expect(dec.isNaN()).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticLogPart02Test0059
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG_PART02_TEST_0590
     * @tc.desc Verify log(10, Infinity) positive infinity base returns NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLogPart02Test0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: Decimal = Decimal.log(10, Infinity);
      expect(dec.isNaN()).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticLogPart02Test0060
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG_PART02_TEST_0600
     * @tc.desc Verify log(10, -Infinity) negative infinity base returns NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLogPart02Test0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: Decimal = Decimal.log(10, -Infinity);
      expect(dec.isNaN()).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticLogPart02Test0061
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG_PART02_TEST_0610
     * @tc.desc Verify log(1, 1) both one boundary returns NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLogPart02Test0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: Decimal = Decimal.log(1, 1);
      expect(dec.isNaN()).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticLogPart02Test0062
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG_PART02_TEST_0620
     * @tc.desc Verify log(10, 1e9) huge base finite about 0.11111111111111111111
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLogPart02Test0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: Decimal = Decimal.log(10, 1e9);
      expect(dec.isFinite()).assertTrue();
      expect(Math.abs(dec.toNumber() - 0.11111111111111111111) < 1e-6).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticLogPart02Test0063
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG_PART02_TEST_0630
     * @tc.desc Verify log(10, 1e-9) tiny base finite about -0.11111111111111111111
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLogPart02Test0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: Decimal = Decimal.log(10, 1e-9);
      expect(dec.isFinite()).assertTrue();
      expect(Math.abs(dec.toNumber() - (-0.11111111111111111111)) < 1e-6).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticLogPart02Test0064
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG_PART02_TEST_0640
     * @tc.desc Verify log(2, MAX_SAFE_INTEGER) base boundary finite about 0.018867924528301886849
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLogPart02Test0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: Decimal = Decimal.log(2, Number.MAX_SAFE_INTEGER);
      expect(dec.isFinite()).assertTrue();
      expect(Math.abs(dec.toNumber() - 0.018867924528301886849) < 1e-6).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticLogPart02Test0065
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG_PART02_TEST_0650
     * @tc.desc Verify log(10, 5e-324) subnormal base finite about -0.003093092527460898307
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLogPart02Test0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: Decimal = Decimal.log(10, 5e-324);
      expect(dec.isFinite()).assertTrue();
      expect(Math.abs(dec.toNumber() - (-0.003093092527460898307)) < 1e-6).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticLogPart02Test0066
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG_PART02_TEST_0660
     * @tc.desc Verify log(true, 10) boolean x throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLogPart02Test0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let apiThrew1_1: boolean = false;
      try {
        logUnsafe(true, 10);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticLogPart02Test0067
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG_PART02_TEST_0670
     * @tc.desc Verify log(false, 10) boolean x throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLogPart02Test0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let apiThrew1_1: boolean = false;
      try {
        logUnsafe(false, 10);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticLogPart02Test0068
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG_PART02_TEST_0680
     * @tc.desc Verify log(10, true) boolean base throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLogPart02Test0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let apiThrew1_1: boolean = false;
      try {
        logUnsafe(10, true);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticLogPart02Test0069
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG_PART02_TEST_0690
     * @tc.desc Verify log({}, 10) plain object x throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLogPart02Test0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        logUnsafe({}, 10);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticLogPart02Test0070
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG_PART02_TEST_0700
     * @tc.desc Verify log([8], 10) array x throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLogPart02Test0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let apiThrew1_1: boolean = false;
      try {
        logUnsafe([8], 10);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticLogPart02Test0071
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG_PART02_TEST_0710
     * @tc.desc Verify log(10, arrow function) function base throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLogPart02Test0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        logUnsafe(10, (): number => {
          return 1;
        });
        expect().assertFail();
      } catch (e) {
        let err: BusinessError = e as BusinessError;
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name testDecimalStaticLogPart02Test0072
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG_PART02_TEST_0720
     * @tc.desc Verify log(new Date(), 10) Date reference x throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLogPart02Test0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let apiThrew1_1: boolean = false;
      try {
        logUnsafe(new Date(), 10);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticLogPart02Test0073
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG_PART02_TEST_0730
     * @tc.desc Verify log(/x/, 10) regex x throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLogPart02Test0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let apiThrew1_1: boolean = false;
      try {
        logUnsafe(/x/, 10);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticLogPart02Test0074
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG_PART02_TEST_0740
     * @tc.desc Verify log(new Map<string, number>(), 10) Map x throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLogPart02Test0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let apiThrew1_1: boolean = false;
      try {
        logUnsafe(new Map<string, number>(), 10);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticLogPart02Test0075
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG_PART02_TEST_0750
     * @tc.desc Verify string|number union members '1000' and 1000 with base 10 both return '3'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLogPart02Test0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: string | number = '1000';
      expect(Decimal.log(a, 10).toString()).assertEqual('3');
      let b: string | number = 1000;
      expect(Decimal.log(b, 10).toString()).assertEqual('3');
    });

    /**
     * @tc.name testDecimalStaticLogPart02Test0076
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG_PART02_TEST_0760
     * @tc.desc Verify number|Decimal union members 16 and Decimal('16') with base 2 both return '4'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLogPart02Test0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: number | Decimal = 16;
      expect(Decimal.log(a, 2).toString()).assertEqual('4');
      let b: number | Decimal = new Decimal('16');
      expect(Decimal.log(b, 2).toString()).assertEqual('4');
    });

    /**
     * @tc.name testDecimalStaticLogPart02Test0077
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG_PART02_TEST_0770
     * @tc.desc Verify string|Decimal union members '16' and Decimal('16') with base 2 both return '4'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLogPart02Test0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: string | Decimal = '16';
      expect(Decimal.log(a, 2).toString()).assertEqual('4');
      let b: string | Decimal = new Decimal('16');
      expect(Decimal.log(b, 2).toString()).assertEqual('4');
    });

    /**
     * @tc.name testDecimalStaticLogPart02Test0078
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG_PART02_TEST_0780
     * @tc.desc Verify triple union string|number|Decimal members with base 10 all return '3'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLogPart02Test0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: string | number | Decimal = '1000';
      expect(Decimal.log(a, 10).toString()).assertEqual('3');
      let b: string | number | Decimal = 1000;
      expect(Decimal.log(b, 10).toString()).assertEqual('3');
      let c: string | number | Decimal = new Decimal('1000');
      expect(Decimal.log(c, 10).toString()).assertEqual('3');
    });

    /**
     * @tc.name testDecimalStaticLogPart02Test0079
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG_PART02_TEST_0790
     * @tc.desc Verify four-member union: '100' works, null and undefined each throw 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLogPart02Test0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ok: string | number | null | undefined = '100';
      expect(Decimal.log(ok, 10).toString()).assertEqual('2');
      let nv: string | number | null | undefined = null;
      let apiThrew1_1: boolean = false;
      try {
        logUnsafe(nv, 10);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      let uv: string | number | null | undefined = undefined;
      let apiThrew2_1: boolean = false;
      try {
        logUnsafe(uv, 10);
      } catch (e) {
        apiThrew2_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew2_1).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticLogPart02Test0080
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG_PART02_TEST_0800
     * @tc.desc Verify string|null union with explicit null x throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLogPart02Test0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: string | null = null;
      let apiThrew1_1: boolean = false;
      try {
        logUnsafe(v, 10);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticLogPart02Test0081
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG_PART02_TEST_0810
     * @tc.desc Verify string|undefined union with explicit undefined x throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLogPart02Test0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: string | undefined = undefined;
      let apiThrew1_1: boolean = false;
      try {
        logUnsafe(v, 10);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticLogPart02Test0082
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG_PART02_TEST_0820
     * @tc.desc Verify number|null union with explicit null x throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLogPart02Test0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: number | null = null;
      let apiThrew1_1: boolean = false;
      try {
        logUnsafe(v, 10);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticLogPart02Test0083
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG_PART02_TEST_0830
     * @tc.desc Verify number|undefined union with explicit undefined x throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLogPart02Test0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: number | undefined = undefined;
      let apiThrew1_1: boolean = false;
      try {
        logUnsafe(v, 10);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticLogPart02Test0084
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG_PART02_TEST_0840
     * @tc.desc Verify Decimal|null union with explicit null x throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLogPart02Test0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: Decimal | null = null;
      let apiThrew1_1: boolean = false;
      try {
        logUnsafe(v, 10);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticLogPart02Test0085
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG_PART02_TEST_0850
     * @tc.desc Verify Decimal('16') and Decimal('16.0') same-value refs give equal log results
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLogPart02Test0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Decimal = new Decimal('16');
      let b: Decimal = new Decimal('16.0');
      expect(Decimal.log(a, 2).toString()).assertEqual('4');
    });

    /**
     * @tc.name testDecimalStaticLogPart02Test0086
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG_PART02_TEST_0860
     * @tc.desc Verify union base variable string|number dispatch: '10' and 10 give same result
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLogPart02Test0086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b1: string | number = '10';
      expect(Decimal.log(1000, b1).toString()).assertEqual('3');
      let b2: string | number = 10;
      expect(Decimal.log(1000, b2).toString()).assertEqual('3');
    });

    /**
     * @tc.name testDecimalStaticLogPart02Test0087
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG_PART02_TEST_0870
     * @tc.desc Verify union n variable reassigned from string to number gives same result
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLogPart02Test0087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: string | number = '1000';
      expect(Decimal.log(v, 10).toString()).assertEqual('3');
      v = 1000;
      expect(Decimal.log(v, 10).toString()).assertEqual('3');
    });

    /**
     * @tc.name testDecimalStaticLogPart02Test0088
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG_PART02_TEST_0880
     * @tc.desc Verify mixed Decimal|number union n taking number member 1000 returns '3'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLogPart02Test0088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: Decimal | number = 1000;
      expect(Decimal.log(v, 10).toString()).assertEqual('3');
    });

    /**
     * @tc.name testDecimalStaticLogPart02Test0089
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG_PART02_TEST_0890
     * @tc.desc Verify mixed Decimal|number union base taking Decimal(2) returns '4' for 16
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLogPart02Test0089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: Decimal | number = new Decimal(2);
      expect(Decimal.log(16, b).toString()).assertEqual('4');
    });

    /**
     * @tc.name testDecimalStaticLogPart02Test0090
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG_PART02_TEST_0900
     * @tc.desc Verify union Decimal input unchanged after log operation stays '16'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLogPart02Test0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Decimal = new Decimal('16');
      Decimal.log(src, 2);
      expect(src.toString()).assertEqual('16');
    });

    /**
     * @tc.name testDecimalStaticLogPart02Test0091
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG_PART02_TEST_0910
     * @tc.desc Verify log('1000', '10') return instance is a Decimal
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLogPart02Test0091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: Decimal = Decimal.log('1000', '10');
      expect(dec instanceof Decimal).assertTrue();
      expect(dec.toString()).assertEqual('3');
    });

    /**
     * @tc.name testDecimalStaticLogPart02Test0092
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG_PART02_TEST_0920
     * @tc.desc Verify log('1000', '10') toNumber exactly 3
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLogPart02Test0092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: Decimal = Decimal.log('1000', '10');
      expect(dec.toNumber()).assertEqual(3);
    });

    /**
     * @tc.name testDecimalStaticLogPart02Test0093
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG_PART02_TEST_0930
     * @tc.desc Verify two identical log calls return fresh objects with different references
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLogPart02Test0093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r1: Decimal = Decimal.log('1000', '10');
      let r2: Decimal = Decimal.log('1000', '10');
      expect(r1 === r2).assertFalse();
    });

    /**
     * @tc.name testDecimalStaticLogPart02Test0094
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG_PART02_TEST_0940
     * @tc.desc Verify state recovery after log('abc') 401: subsequent log(1000, 10) returns '3'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLogPart02Test0094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let apiThrew1_1: boolean = false;
      try {
        logUnsafe('abc', 10);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      let after: Decimal = Decimal.log(1000, 10);
      expect(after.toString()).assertEqual('3');
    });

    /**
     * @tc.name testDecimalStaticLogPart02Test0095
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG_PART02_TEST_0950
     * @tc.desc Verify invalid n and invalid base each independently throw 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLogPart02Test0095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let apiThrew1_1: boolean = false;
      try {
        logUnsafe('abc', 10);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      let apiThrew2_1: boolean = false;
      try {
        logUnsafe(10, 'abc');
      } catch (e) {
        apiThrew2_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew2_1).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticLogPart02Test0096
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG_PART02_TEST_0960
     * @tc.desc Verify log(16, '4') heterogeneous number x string base returns '2'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLogPart02Test0096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: Decimal = Decimal.log(16, '4');
      expect(dec.toString()).assertEqual('2');
    });

    /**
     * @tc.name testDecimalStaticLogPart02Test0097
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG_PART02_TEST_0970
     * @tc.desc Verify log('16', 4) heterogeneous string x number base returns '2'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLogPart02Test0097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: Decimal = Decimal.log('16', 4);
      expect(dec.toString()).assertEqual('2');
    });

    /**
     * @tc.name testDecimalStaticLogPart02Test0098
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG_PART02_TEST_0980
     * @tc.desc Verify log(new Decimal(16), 2) Decimal x number base returns '4'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLogPart02Test0098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: Decimal = Decimal.log(new Decimal(16), 2);
      expect(dec.toString()).assertEqual('4');
    });

    /**
     * @tc.name testDecimalStaticLogPart02Test0099
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG_PART02_TEST_0990
     * @tc.desc Verify log(16, new Decimal(2)) number x Decimal base returns '4'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLogPart02Test0099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: Decimal = Decimal.log(16, new Decimal(2));
      expect(dec.toString()).assertEqual('4');
    });

    /**
     * @tc.name testDecimalStaticLogPart02Test0100
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG_PART02_TEST_1000
     * @tc.desc Verify log(Decimal(2), Decimal(256)) both Decimal returns '0.125'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLogPart02Test0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: Decimal = Decimal.log(new Decimal(2), new Decimal(256));
      expect(dec.toString()).assertEqual('0.125');
    });

    /**
     * @tc.name testDecimalStaticLogPart02Test0101
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG_PART02_TEST_1010
     * @tc.desc Verify log(100, 100) with n equal to base returns '1'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLogPart02Test0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: Decimal = Decimal.log(100, 100);
      expect(dec.toString()).assertEqual('1');
    });

    /**
     * @tc.name testDecimalStaticLogPart02Test0102
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG_PART02_TEST_1020
     * @tc.desc Verify static log(8, 2) and instance new Decimal(8).log(2) both return '3'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLogPart02Test0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let staticRes: Decimal = Decimal.log(8, 2);
      let instRes: Decimal = new Decimal(8).log(2);
      expect(staticRes.toString()).assertEqual('3');
      expect(instRes.toString()).assertEqual('3');
    });

    /**
     * @tc.name testDecimalStaticLogPart02Test0103
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG_PART02_TEST_1030
     * @tc.desc Verify log('1e-7', '10') double string scientific returns '-7'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLogPart02Test0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: Decimal = Decimal.log('1e-7', '10');
      expect(dec.toString()).assertEqual('-7');
    });

    /**
     * @tc.name testDecimalStaticLogPart02Test0104
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG_PART02_TEST_1040
     * @tc.desc Verify log('0.01', '0.1') mutual fractional base returns '2'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLogPart02Test0104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: Decimal = Decimal.log('0.01', '0.1');
      expect(dec.toString()).assertEqual('2');
    });
  });
}
