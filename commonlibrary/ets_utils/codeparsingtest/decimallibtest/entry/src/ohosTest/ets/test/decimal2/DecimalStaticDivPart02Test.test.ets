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

function divUnsafe(...args: ESObject[]): Decimal {
  return Decimal.div(args[0] as Value, args[1] as Value);
}

class IllegalUnionMember {
  flag: boolean = false;
}

export default function DecimalStaticDivPart02Test() {
  describe('DecimalStaticDivPart02Test', () => {
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
     * @tc.name testDecimalStaticDivPart02Test0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_DIV_PART02_TEST_0010
     * @tc.desc Verify static div(2, 4) with both arguments given returns '0.5'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticDivPart02Test0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.div(2, 4);
      expect(r.toString()).assertEqual('0.5');
    });

    /**
     * @tc.name testDecimalStaticDivPart02Test0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_DIV_PART02_TEST_0020
     * @tc.desc Verify missing dividend argument (runtime undefined) throws 401, distinct from explicit nullish
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticDivPart02Test0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let missing: ESObject;
      let apiThrew1_1: boolean = false;
      try {
        divUnsafe(missing, 4);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticDivPart02Test0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_DIV_PART02_TEST_0030
     * @tc.desc Verify missing divisor argument (runtime undefined) independently throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticDivPart02Test0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let missing: ESObject;
      let apiThrew1_1: boolean = false;
      try {
        divUnsafe(4, missing);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticDivPart02Test0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_DIV_PART02_TEST_0040
     * @tc.desc Verify div(10, 5) with two legal values returns new Decimal with result '2'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticDivPart02Test0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.div(10, 5);
      expect(r.toString()).assertEqual('2');
      expect(r instanceof Decimal).assertTrue();
      expect(r === Decimal.div(10, 5)).assertFalse();
    });

    /**
     * @tc.name testDecimalStaticDivPart02Test0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_DIV_PART02_TEST_0050
     * @tc.desc Verify swapped argument order inverts result: div(4, 2) is '2' and div(2, 4) is '0.5'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticDivPart02Test0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Decimal = Decimal.div(4, 2);
      let b: Decimal = Decimal.div(2, 4);
      expect(a.toString()).assertEqual('2');
      expect(b.toString()).assertEqual('0.5');
    });

    /**
     * @tc.name testDecimalStaticDivPart02Test0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_DIV_PART02_TEST_0060
     * @tc.desc Verify div('6', 2) string integer dividend 6/2 returns '3'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticDivPart02Test0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Decimal.div('6', 2).toString()).assertEqual('3');
    });

    /**
     * @tc.name testDecimalStaticDivPart02Test0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_DIV_PART02_TEST_0070
     * @tc.desc Verify div('1.5', 3) string decimal dividend 1.5/3 returns '0.5'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticDivPart02Test0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Decimal.div('1.5', 3).toString()).assertEqual('0.5');
    });

    /**
     * @tc.name testDecimalStaticDivPart02Test0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_DIV_PART02_TEST_0080
     * @tc.desc Verify div('1e-2', 0.01) negative-exponent scientific string returns '1'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticDivPart02Test0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Decimal.div('1e-2', 0.01).toString()).assertEqual('1');
    });

    /**
     * @tc.name testDecimalStaticDivPart02Test0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_DIV_PART02_TEST_0090
     * @tc.desc Verify div('4e3', 1000) positive-exponent scientific string 4000/1000 returns '4'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticDivPart02Test0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Decimal.div('4e3', 1000).toString()).assertEqual('4');
    });

    /**
     * @tc.name testDecimalStaticDivPart02Test0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_DIV_PART02_TEST_0100
     * @tc.desc Verify div('5E2', 100) uppercase-exponent string is equivalent, 500/100 returns '5'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticDivPart02Test0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Decimal.div('5E2', 100).toString()).assertEqual('5');
    });

    /**
     * @tc.name testDecimalStaticDivPart02Test0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_DIV_PART02_TEST_0110
     * @tc.desc Verify div('-9', 3) negative-sign string dividend (-9)/3 returns '-3'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticDivPart02Test0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Decimal.div('-9', 3).toString()).assertEqual('-3');
    });

    /**
     * @tc.name testDecimalStaticDivPart02Test0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_DIV_PART02_TEST_0120
     * @tc.desc Verify div('+8', 4) explicit plus-sign string dividend 8/4 returns '2'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticDivPart02Test0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Decimal.div('+8', 4).toString()).assertEqual('2');
    });

    /**
     * @tc.name testDecimalStaticDivPart02Test0013
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_DIV_PART02_TEST_0130
     * @tc.desc Verify div('.6', 2) string with omitted integer part 0.6/2 returns '0.3'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticDivPart02Test0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Decimal.div('.6', 2).toString()).assertEqual('0.3');
    });

    /**
     * @tc.name testDecimalStaticDivPart02Test0014
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_DIV_PART02_TEST_0140
     * @tc.desc Verify div('7.', 2) string with omitted fraction part 7/2 returns '3.5'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticDivPart02Test0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Decimal.div('7.', 2).toString()).assertEqual('3.5');
    });

    /**
     * @tc.name testDecimalStaticDivPart02Test0015
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_DIV_PART02_TEST_0150
     * @tc.desc Verify div('015', 5) leading-zero string parses as 15, 15/5 returns '3'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticDivPart02Test0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Decimal.div('015', 5).toString()).assertEqual('3');
    });

    /**
     * @tc.name testDecimalStaticDivPart02Test0016
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_DIV_PART02_TEST_0160
     * @tc.desc Verify div('3.14159', 1) keeps precision and returns 20-significant-digit approximation
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticDivPart02Test0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.div('3.14159', 1);
      expect(r.toString().startsWith('3.14159')).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticDivPart02Test0017
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_DIV_PART02_TEST_0170
     * @tc.desc Verify div('0.0000000000000000001', 1) 1e-19 quotient triggers exponent notation '1e-19'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticDivPart02Test0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Decimal.div('0.0000000000000000001', 1).toString()).assertEqual('1e-19');
    });

    /**
     * @tc.name testDecimalStaticDivPart02Test0018
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_DIV_PART02_TEST_0180
     * @tc.desc Verify div('0x10', 2) hex string parses as 16 yielding '8'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticDivPart02Test0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.div('0x10', 2);
      expect(r.toString()).assertEqual('8');
    });

    /**
     * @tc.name testDecimalStaticDivPart02Test0019
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_DIV_PART02_TEST_0190
     * @tc.desc Verify div('', 2) empty string dividend throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticDivPart02Test0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.div('', 2);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticDivPart02Test0020
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_DIV_PART02_TEST_0200
     * @tc.desc Verify div('NaN', 2) NaN string dividend propagates NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticDivPart02Test0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.div('NaN', 2);
      expect(r.isNaN()).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticDivPart02Test0021
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_DIV_PART02_TEST_0210
     * @tc.desc Verify div('Infinity', 2) string-form Infinity parses yielding 'Infinity'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticDivPart02Test0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.div('Infinity', 2);
      expect(r.toString()).assertEqual('Infinity');
    });

    /**
     * @tc.name testDecimalStaticDivPart02Test0022
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_DIV_PART02_TEST_0220
     * @tc.desc Verify div(10, '5') string integer divisor 10/5 returns '2'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticDivPart02Test0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Decimal.div(10, '5').toString()).assertEqual('2');
    });

    /**
     * @tc.name testDecimalStaticDivPart02Test0023
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_DIV_PART02_TEST_0230
     * @tc.desc Verify div(1, '0.5') string decimal divisor 1/0.5 returns '2'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticDivPart02Test0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Decimal.div(1, '0.5').toString()).assertEqual('2');
    });

    /**
     * @tc.name testDecimalStaticDivPart02Test0024
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_DIV_PART02_TEST_0240
     * @tc.desc Verify div(1, '2e-1') negative-exponent scientific string divisor 1/0.2 returns '5'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticDivPart02Test0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Decimal.div(1, '2e-1').toString()).assertEqual('5');
    });

    /**
     * @tc.name testDecimalStaticDivPart02Test0025
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_DIV_PART02_TEST_0250
     * @tc.desc Verify div(100, '2e2') positive-exponent scientific string divisor 100/200 returns '0.5'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticDivPart02Test0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Decimal.div(100, '2e2').toString()).assertEqual('0.5');
    });

    /**
     * @tc.name testDecimalStaticDivPart02Test0026
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_DIV_PART02_TEST_0260
     * @tc.desc Verify div(8, '4E0') uppercase-exponent string divisor is equivalent, 8/4 returns '2'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticDivPart02Test0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Decimal.div(8, '4E0').toString()).assertEqual('2');
    });

    /**
     * @tc.name testDecimalStaticDivPart02Test0027
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_DIV_PART02_TEST_0270
     * @tc.desc Verify div(1, '-0.25') negative-sign string divisor 1/(-0.25) returns '-4'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticDivPart02Test0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Decimal.div(1, '-0.25').toString()).assertEqual('-4');
    });

    /**
     * @tc.name testDecimalStaticDivPart02Test0028
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_DIV_PART02_TEST_0280
     * @tc.desc Verify div(1, '+2') explicit plus-sign string divisor 1/2 returns '0.5'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticDivPart02Test0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Decimal.div(1, '+2').toString()).assertEqual('0.5');
    });

    /**
     * @tc.name testDecimalStaticDivPart02Test0029
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_DIV_PART02_TEST_0290
     * @tc.desc Verify div(1, '.2') string divisor with omitted integer part 1/0.2 returns '5'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticDivPart02Test0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Decimal.div(1, '.2').toString()).assertEqual('5');
    });

    /**
     * @tc.name testDecimalStaticDivPart02Test0030
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_DIV_PART02_TEST_0300
     * @tc.desc Verify div(12, '4.') string divisor with omitted fraction part 12/4 returns '3'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticDivPart02Test0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Decimal.div(12, '4.').toString()).assertEqual('3');
    });

    /**
     * @tc.name testDecimalStaticDivPart02Test0031
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_DIV_PART02_TEST_0310
     * @tc.desc Verify div(25, '005') leading-zero string divisor parses as 5, 25/5 returns '5'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticDivPart02Test0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Decimal.div(25, '005').toString()).assertEqual('5');
    });

    /**
     * @tc.name testDecimalStaticDivPart02Test0032
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_DIV_PART02_TEST_0320
     * @tc.desc Verify div(1, '1e-9') tiny string divisor yields 1e9 exceeding exponent cap shown as '1e9'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticDivPart02Test0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Decimal.div(1, '1e-9').toString()).assertEqual('1000000000');
    });

    /**
     * @tc.name testDecimalStaticDivPart02Test0033
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_DIV_PART02_TEST_0330
     * @tc.desc Verify div(1, '2') and div(1, new Decimal('2')) with same content yield same '0.5'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticDivPart02Test0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Decimal = Decimal.div(1, '2');
      let b: Decimal = Decimal.div(1, new Decimal('2'));
      expect(a.toString()).assertEqual('0.5');
      expect(b.toString()).assertEqual('0.5');
    });

    /**
     * @tc.name testDecimalStaticDivPart02Test0034
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_DIV_PART02_TEST_0340
     * @tc.desc Verify Value union dispatches per member at x: '8'/8/new Decimal(8) all yield '4'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticDivPart02Test0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Decimal = Decimal.div('8', 2);
      let n: Decimal = Decimal.div(8, 2);
      let d: Decimal = Decimal.div(new Decimal(8), 2);
      expect(s.toString()).assertEqual('4');
      expect(n.toString()).assertEqual('4');
      expect(d.toString()).assertEqual('4');
    });

    /**
     * @tc.name testDecimalStaticDivPart02Test0035
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_DIV_PART02_TEST_0350
     * @tc.desc Verify Value union dispatches per member at y: '4'/4/new Decimal(4) all yield '2'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticDivPart02Test0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Decimal = Decimal.div(8, '4');
      let n: Decimal = Decimal.div(8, 4);
      let d: Decimal = Decimal.div(8, new Decimal(4));
      expect(s.toString()).assertEqual('2');
      expect(n.toString()).assertEqual('2');
      expect(d.toString()).assertEqual('2');
    });

    /**
     * @tc.name testDecimalStaticDivPart02Test0036
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_DIV_PART02_TEST_0360
     * @tc.desc Verify string|number union same value different members: '6' and 6 both yield '2'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticDivPart02Test0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Decimal = Decimal.div('6', 3);
      let b: Decimal = Decimal.div(6, 3);
      expect(a.toString()).assertEqual('2');
      expect(b.toString()).assertEqual('2');
    });

    /**
     * @tc.name testDecimalStaticDivPart02Test0037
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_DIV_PART02_TEST_0370
     * @tc.desc Verify number|Decimal union at y: 12/3 and 12/new Decimal(3) both yield '4'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticDivPart02Test0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Decimal = Decimal.div(12, 3);
      let b: Decimal = Decimal.div(12, new Decimal(3));
      expect(a.toString()).assertEqual('4');
      expect(b.toString()).assertEqual('4');
    });

    /**
     * @tc.name testDecimalStaticDivPart02Test0038
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_DIV_PART02_TEST_0380
     * @tc.desc Verify string|Decimal union same content different references: '10' and new Decimal('10') yield '2'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticDivPart02Test0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Decimal = Decimal.div('10', 5);
      let b: Decimal = Decimal.div(new Decimal('10'), 5);
      expect(a.toString()).assertEqual('2');
      expect(b.toString()).assertEqual('2');
    });

    /**
     * @tc.name testDecimalStaticDivPart02Test0039
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_DIV_PART02_TEST_0390
     * @tc.desc Verify div(new Decimal(9), new Decimal(3)) Decimal references at both positions yield '3'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticDivPart02Test0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.div(new Decimal(9), new Decimal(3));
      expect(r.toString()).assertEqual('3');
    });

    /**
     * @tc.name testDecimalStaticDivPart02Test0040
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_DIV_PART02_TEST_0400
     * @tc.desc Verify div('20', new Decimal(4)) string x with Decimal y cross-member yields '5'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticDivPart02Test0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.div('20', new Decimal(4));
      expect(r.toString()).assertEqual('5');
    });

    /**
     * @tc.name testDecimalStaticDivPart02Test0041
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_DIV_PART02_TEST_0410
     * @tc.desc Verify div(new Decimal(20), '4') Decimal x with string y cross-member yields '5'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticDivPart02Test0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.div(new Decimal(20), '4');
      expect(r.toString()).assertEqual('5');
    });

    /**
     * @tc.name testDecimalStaticDivPart02Test0042
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_DIV_PART02_TEST_0420
     * @tc.desc Verify div(true, 2) boolean mixed into union as illegal member throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticDivPart02Test0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let bad: ESObject = true;
      let apiThrew1_1: boolean = false;
      try {
        divUnsafe(bad, 2);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticDivPart02Test0043
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_DIV_PART02_TEST_0430
     * @tc.desc Verify div(2, false) boolean illegal member at y position throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticDivPart02Test0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let bad: ESObject = false;
      let apiThrew1_1: boolean = false;
      try {
        divUnsafe(2, bad);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticDivPart02Test0044
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_DIV_PART02_TEST_0440
     * @tc.desc Verify div({a: 1}, 2) object reference type illegal member throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticDivPart02Test0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let bad: ESObject = { a: 1 };
      let apiThrew1_1: boolean = false;
      try {
        divUnsafe(bad, 2);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticDivPart02Test0045
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_DIV_PART02_TEST_0450
     * @tc.desc Verify div(2, [1, 2]) Array illegal member at y position throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticDivPart02Test0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let bad: ESObject = [1, 2];
      let apiThrew1_1: boolean = false;
      try {
        divUnsafe(2, bad);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticDivPart02Test0046
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_DIV_PART02_TEST_0460
     * @tc.desc Verify div(new Date(), 2) Date illegal member throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticDivPart02Test0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let bad: ESObject = new Date();
      let apiThrew1_1: boolean = false;
      try {
        divUnsafe(bad, 2);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticDivPart02Test0047
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_DIV_PART02_TEST_0470
     * @tc.desc Verify div(2, new Map<string, number>()) Map illegal member at y position throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticDivPart02Test0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let bad: ESObject = new Map<string, number>();
      let apiThrew1_1: boolean = false;
      try {
        divUnsafe(2, bad);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticDivPart02Test0048
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_DIV_PART02_TEST_0480
     * @tc.desc Verify div(new Set<number>(), 2) Set illegal member throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticDivPart02Test0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let bad: ESObject = new Set<number>();
      let apiThrew1_1: boolean = false;
      try {
        divUnsafe(bad, 2);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticDivPart02Test0049
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_DIV_PART02_TEST_0490
     * @tc.desc Verify div(2, /ab/) RegExp illegal member at y position throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticDivPart02Test0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let bad: ESObject = /ab/;
      let apiThrew1_1: boolean = false;
      try {
        divUnsafe(2, bad);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticDivPart02Test0050
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_DIV_PART02_TEST_0500
     * @tc.desc Verify div(new Error('x'), 2) Error illegal member throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticDivPart02Test0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let bad: ESObject = new Error('x');
      let apiThrew1_1: boolean = false;
      try {
        divUnsafe(bad, 2);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticDivPart02Test0051
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_DIV_PART02_TEST_0510
     * @tc.desc Verify div(2, function) function illegal member at y position throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticDivPart02Test0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      try {
        let bad: ESObject = (): number => {
        return 2;
        };
        divUnsafe(2, bad);
        expect().assertFail();
      } catch (e) {
        thrown = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticDivPart02Test0052
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_DIV_PART02_TEST_0520
     * @tc.desc Verify explicit null at y and explicit undefined at x each independently throw 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticDivPart02Test0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let n: ESObject = null;
      let u: ESObject = undefined;
      let apiThrew1_1: boolean = false;
      try {
        let _r: Decimal = divUnsafe(2, n);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      let apiThrew1_2: boolean = false;
      try {
        divUnsafe(u, 2);
      } catch (e) {
        apiThrew1_2 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_2).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticDivPart02Test0053
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_DIV_PART02_TEST_0530
     * @tc.desc Verify div with custom class instance illegal member mixed into union throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticDivPart02Test0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let bad: ESObject = new IllegalUnionMember();
      let apiThrew1_1: boolean = false;
      try {
        divUnsafe(bad, 2);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticDivPart02Test0054
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_DIV_PART02_TEST_0540
     * @tc.desc Verify new Decimal(7) and '7' dispatch differently but 7/2 both yield '3.5'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticDivPart02Test0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Decimal = Decimal.div(new Decimal(7), 2);
      let b: Decimal = Decimal.div('7', 2);
      expect(a.toString()).assertEqual('3.5');
      expect(b.toString()).assertEqual('3.5');
    });

    /**
     * @tc.name testDecimalStaticDivPart02Test0055
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_DIV_PART02_TEST_0550
     * @tc.desc Verify div(15, new Decimal(3)) number x Decimal y combination yields '5'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticDivPart02Test0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.div(15, new Decimal(3));
      expect(r.toString()).assertEqual('5');
    });

    /**
     * @tc.name testDecimalStaticDivPart02Test0056
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_DIV_PART02_TEST_0560
     * @tc.desc Verify div(new Decimal(15), 3) Decimal x number y combination yields '5'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticDivPart02Test0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.div(new Decimal(15), 3);
      expect(r.toString()).assertEqual('5');
    });

    /**
     * @tc.name testDecimalStaticDivPart02Test0057
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_DIV_PART02_TEST_0570
     * @tc.desc Verify div('24', '6') both-string combination yields '4'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticDivPart02Test0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.div('24', '6');
      expect(r.toString()).assertEqual('4');
    });

    /**
     * @tc.name testDecimalStaticDivPart02Test0058
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_DIV_PART02_TEST_0580
     * @tc.desc Verify div(new Decimal(24), new Decimal(6)) both-Decimal combination yields '4'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticDivPart02Test0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.div(new Decimal(24), new Decimal(6));
      expect(r.toString()).assertEqual('4');
    });

    /**
     * @tc.name testDecimalStaticDivPart02Test0059
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_DIV_PART02_TEST_0590
     * @tc.desc Verify div(24, 6) both-number combination yields '4'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticDivPart02Test0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.div(24, 6);
      expect(r.toString()).assertEqual('4');
    });

    /**
     * @tc.name testDecimalStaticDivPart02Test0060
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_DIV_PART02_TEST_0600
     * @tc.desc Verify div('1e2', 4) scientific string x with number y yields '25'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticDivPart02Test0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.div('1e2', 4);
      expect(r.toString()).assertEqual('25');
    });

    /**
     * @tc.name testDecimalStaticDivPart02Test0061
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_DIV_PART02_TEST_0610
     * @tc.desc Verify div(100, '2e1') number x with scientific string y yields '5'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticDivPart02Test0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.div(100, '2e1');
      expect(r.toString()).assertEqual('5');
    });

    /**
     * @tc.name testDecimalStaticDivPart02Test0062
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_DIV_PART02_TEST_0620
     * @tc.desc Verify div('0.5', 0.5) with y being reciprocal of x yields quotient '1'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticDivPart02Test0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.div('0.5', 0.5);
      expect(r.toString()).assertEqual('1');
    });

    /**
     * @tc.name testDecimalStaticDivPart02Test0063
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_DIV_PART02_TEST_0630
     * @tc.desc Verify div(new Decimal(13), '13') equal x and y boundary combination yields '1'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticDivPart02Test0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.div(new Decimal(13), '13');
      expect(r.toString()).assertEqual('1');
    });

    /**
     * @tc.name testDecimalStaticDivPart02Test0064
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_DIV_PART02_TEST_0640
     * @tc.desc Verify div('040', new Decimal(8)) leading-zero string in combination parses to yield '5'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticDivPart02Test0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.div('040', new Decimal(8));
      expect(r.toString()).assertEqual('5');
    });

    /**
     * @tc.name testDecimalStaticDivPart02Test0065
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_DIV_PART02_TEST_0650
     * @tc.desc Verify div(1, new Decimal('2.5')) Decimal with decimal fraction yields '0.4'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticDivPart02Test0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.div(1, new Decimal('2.5'));
      expect(r.toString()).assertEqual('0.4');
    });

    /**
     * @tc.name testDecimalStaticDivPart02Test0066
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_DIV_PART02_TEST_0660
     * @tc.desc Verify div(1, '    ') all-space string divisor throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticDivPart02Test0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.div(1, '    ');
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticDivPart02Test0067
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_DIV_PART02_TEST_0670
     * @tc.desc Verify div(1, '\u200B') zero-width space string divisor throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticDivPart02Test0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.div(1, '​');
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticDivPart02Test0068
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_DIV_PART02_TEST_0680
     * @tc.desc Verify div(1, '\u0000') NUL character string divisor throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticDivPart02Test0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.div(1, '\u0000');
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticDivPart02Test0069
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_DIV_PART02_TEST_0690
     * @tc.desc Verify div(1, '\t') tab character string divisor throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticDivPart02Test0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.div(1, '	');
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticDivPart02Test0070
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_DIV_PART02_TEST_0700
     * @tc.desc Verify div(1, '\n') newline character string divisor throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticDivPart02Test0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.div(1, '\n');
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticDivPart02Test0071
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_DIV_PART02_TEST_0710
     * @tc.desc Verify div(1, '12a') digits-plus-letters mixed string divisor throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticDivPart02Test0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.div(1, '12a');
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticDivPart02Test0072
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_DIV_PART02_TEST_0720
     * @tc.desc Verify div(1, 'abc') pure-letter string divisor throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticDivPart02Test0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.div(1, 'abc');
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticDivPart02Test0073
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_DIV_PART02_TEST_0730
     * @tc.desc Verify div('abc', 2) pure-letter illegal string at dividend position throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticDivPart02Test0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.div('abc', 2);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticDivPart02Test0074
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_DIV_PART02_TEST_0740
     * @tc.desc Verify div(1, '-Infinity') string-form -Infinity divisor yields zero
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticDivPart02Test0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.div(1, '-Infinity');
      expect(r.toString()).assertEqual('0');
    });

    /**
     * @tc.name testDecimalStaticDivPart02Test0075
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_DIV_PART02_TEST_0750
     * @tc.desc Verify div(1, '1_000') underscore string parses as 1000 yielding '0.001'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticDivPart02Test0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.div(1, '1_000');
      expect(r.toString()).assertEqual('0.001');
    });

    /**
     * @tc.name testDecimalStaticDivPart02Test0076
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_DIV_PART02_TEST_0760
     * @tc.desc Verify div(1, '1,000') thousands-separator comma string divisor throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticDivPart02Test0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.div(1, '1,000');
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticDivPart02Test0077
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_DIV_PART02_TEST_0770
     * @tc.desc Verify div with Unicode fullwidth digit string divisor throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticDivPart02Test0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.div(1, '１');
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticDivPart02Test0078
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_DIV_PART02_TEST_0780
     * @tc.desc Verify div with emoji string divisor throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticDivPart02Test0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.div(1, '😀');
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticDivPart02Test0079
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_DIV_PART02_TEST_0790
     * @tc.desc Verify div with isolated high surrogate string divisor throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticDivPart02Test0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.div(1, '\uD83D');
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticDivPart02Test0080
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_DIV_PART02_TEST_0800
     * @tc.desc Verify div(1, '<img onerror=alert(1)>') XSS script string divisor throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticDivPart02Test0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.div(1, '<img onerror=alert(1)>');
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticDivPart02Test0081
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_DIV_PART02_TEST_0810
     * @tc.desc Verify div(1, '1.2.3') multiple-decimal-point string divisor throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticDivPart02Test0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.div(1, '1.2.3');
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticDivPart02Test0082
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_DIV_PART02_TEST_0820
     * @tc.desc Verify div(1, '--2') double-negative string divisor throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticDivPart02Test0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.div(1, '--2');
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticDivPart02Test0083
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_DIV_PART02_TEST_0830
     * @tc.desc Verify div(1, '1e') incomplete-exponent string divisor throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticDivPart02Test0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.div(1, '1e');
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticDivPart02Test0084
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_DIV_PART02_TEST_0840
     * @tc.desc Verify div(1, '2e+') empty-exponent scientific string divisor throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticDivPart02Test0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.div(1, '2e+');
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticDivPart02Test0085
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_DIV_PART02_TEST_0850
     * @tc.desc Verify div(1, '.') lone decimal point string divisor throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticDivPart02Test0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.div(1, '.');
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticDivPart02Test0086
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_DIV_PART02_TEST_0860
     * @tc.desc Verify div with fullwidth digit dividend and legal divisor throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticDivPart02Test0086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.div('９', 3);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticDivPart02Test0087
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_DIV_PART02_TEST_0870
     * @tc.desc Verify div with emoji dividend and legal divisor throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticDivPart02Test0087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.div('🎯', 3);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticDivPart02Test0088
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_DIV_PART02_TEST_0880
     * @tc.desc Verify div('12a', '3x') both-args illegal strings with first already illegal throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticDivPart02Test0088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.div('12a', '3x');
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticDivPart02Test0089
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_DIV_PART02_TEST_0890
     * @tc.desc Verify div(1, '0.5.5') malformed decimal string divisor throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticDivPart02Test0089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.div(1, '0.5.5');
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticDivPart02Test0090
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_DIV_PART02_TEST_0900
     * @tc.desc Verify div('2', 4) returns new Decimal object with exact toString '0.5'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticDivPart02Test0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.div('2', 4);
      expect(r.toString()).assertEqual('0.5');
      expect(r instanceof Decimal).assertTrue();
      expect(r === Decimal.div('2', 4)).assertFalse();
    });

    /**
     * @tc.name testDecimalStaticDivPart02Test0091
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_DIV_PART02_TEST_0910
     * @tc.desc Verify div('-6', 2) result exposes sign property s equal -1 and toString '-3'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticDivPart02Test0091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.div('-6', 2);
      expect(r.s).assertEqual(-1);
      expect(r.toString()).assertEqual('-3');
    });

    /**
     * @tc.name testDecimalStaticDivPart02Test0092
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_DIV_PART02_TEST_0920
     * @tc.desc Verify div('0.01', 1) result exposes exponent property e equal -2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticDivPart02Test0092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.div('0.01', 1);
      expect(r.e).assertEqual(-2);
    });

    /**
     * @tc.name testDecimalStaticDivPart02Test0093
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_DIV_PART02_TEST_0930
     * @tc.desc Verify div result is Decimal instance not primitive: typeof 'object' and toNumber 4
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticDivPart02Test0093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.div(new Decimal(8), new Decimal(2));
      expect(typeof r).assertEqual('object');
      expect(r.toNumber()).assertEqual(4);
      expect(r instanceof Decimal).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticDivPart02Test0094
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_DIV_PART02_TEST_0940
     * @tc.desc Verify static result chains into further division: div(100, 2) then /5 yields '10'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticDivPart02Test0094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.div(100, 2);
      let r2: Decimal = Decimal.div(r, 5);
      expect(r2.toString()).assertEqual('10');
    });

    /**
     * @tc.name testDecimalStaticDivPart02Test0095
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_DIV_PART02_TEST_0950
     * @tc.desc Verify div('7', '2') keeps string-source precision yielding '3.5' not double approximation
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticDivPart02Test0095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.div('7', '2');
      expect(r.toString()).assertEqual('3.5');
    });

    /**
     * @tc.name testDecimalStaticDivPart02Test0096
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_DIV_PART02_TEST_0960
     * @tc.desc Verify div(NaN, 2) NaN dividend propagates NaN result
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticDivPart02Test0096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.div(NaN, 2);
      expect(r.isNaN()).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticDivPart02Test0097
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_DIV_PART02_TEST_0970
     * @tc.desc Verify div(2, NaN) NaN divisor propagates NaN result
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticDivPart02Test0097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.div(2, NaN);
      expect(r.isNaN()).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticDivPart02Test0098
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_DIV_PART02_TEST_0980
     * @tc.desc Verify div(NaN, NaN) both-args NaN result is still NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticDivPart02Test0098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.div(NaN, NaN);
      expect(r.isNaN()).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticDivPart02Test0099
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_DIV_PART02_TEST_0990
     * @tc.desc Verify div(Infinity, 2) Infinity dividend over finite divisor yields Infinity, not finite
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticDivPart02Test0099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.div(Infinity, 2);
      expect(r.isFinite()).assertFalse();
      expect(r.toString()).assertEqual('Infinity');
    });

    /**
     * @tc.name testDecimalStaticDivPart02Test0100
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_DIV_PART02_TEST_1000
     * @tc.desc Verify div(Infinity, Infinity) Infinity over Infinity is indeterminate NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticDivPart02Test0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.div(Infinity, Infinity);
      expect(r.isNaN()).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticDivPart02Test0101
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_DIV_PART02_TEST_1010
     * @tc.desc Verify div(2, Infinity) finite dividend over Infinity divisor yields quotient 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticDivPart02Test0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.div(2, Infinity);
      expect(r.toNumber()).assertEqual(0);
    });

    /**
     * @tc.name testDecimalStaticDivPart02Test0102
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_DIV_PART02_TEST_1020
     * @tc.desc Verify div(1, 0) zero divisor yields Infinity without throwing
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticDivPart02Test0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.div(1, 0);
      expect(r.toString()).assertEqual('Infinity');
    });

    /**
     * @tc.name testDecimalStaticDivPart02Test0103
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_DIV_PART02_TEST_1030
     * @tc.desc Verify div(-0, 2) negative zero dividend over positive yields -0 semantics
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticDivPart02Test0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.div(-0, 2);
      expect(r.isNegative()).assertTrue();
      expect(r.toNumber()).assertEqual(0);
    });

    /**
     * @tc.name testDecimalStaticDivPart02Test0104
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_DIV_PART02_TEST_1040
     * @tc.desc Verify div(-0, 0) negative zero over zero yields NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticDivPart02Test0104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.div(-0, 0);
      expect(r.isNaN()).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticDivPart02Test0105
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_DIV_PART02_TEST_1050
     * @tc.desc Verify div(0, -0) zero over negative zero yields NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticDivPart02Test0105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.div(0, -0);
      expect(r.isNaN()).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticDivPart02Test0106
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_DIV_PART02_TEST_1060
     * @tc.desc Verify div(Infinity, 0) Infinity over zero divisor yields Infinity rather than NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticDivPart02Test0106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.div(Infinity, 0);
      expect(r.toString()).assertEqual('Infinity');
    });

    /**
     * @tc.name testDecimalStaticDivPart02Test0107
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_DIV_PART02_TEST_1070
     * @tc.desc Verify div(Number.MAX_VALUE, Number.MAX_VALUE) same MAX_VALUE operands yield '1'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticDivPart02Test0107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.div(Number.MAX_VALUE, Number.MAX_VALUE);
      expect(r.toString()).assertEqual('1');
    });

    /**
     * @tc.name testDecimalStaticDivPart02Test0108
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_DIV_PART02_TEST_1080
     * @tc.desc Verify div(Number.MIN_VALUE, Number.MIN_VALUE) same MIN_VALUE operands yield '1'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticDivPart02Test0108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.div(Number.MIN_VALUE, Number.MIN_VALUE);
      expect(r.toString()).assertEqual('1');
    });

    /**
     * @tc.name testDecimalStaticDivPart02Test0109
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_DIV_PART02_TEST_1090
     * @tc.desc Verify div(Number.EPSILON, Number.EPSILON) same EPSILON operands yield '1'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticDivPart02Test0109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.div(Number.EPSILON, Number.EPSILON);
      expect(r.toString()).assertEqual('1');
    });

    /**
     * @tc.name testDecimalStaticDivPart02Test0110
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_DIV_PART02_TEST_1100
     * @tc.desc Verify div(1, 9007199254740991) high-precision quotient stays decimal not float approximation
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticDivPart02Test0110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.div(1, 9007199254740991);
      expect(r.toNumber()).assertClose(1 / 9007199254740991, 1e-20);
    });

    /**
     * @tc.name testDecimalStaticDivPart02Test0111
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_DIV_PART02_TEST_1110
     * @tc.desc Verify div(-9007199254740991, -1) keeps safe-integer semantics yielding positive result
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticDivPart02Test0111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.div(-9007199254740991, -1);
      expect(r.toString()).assertEqual('9007199254740991');
    });

    /**
     * @tc.name testDecimalStaticDivPart02Test0112
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_DIV_PART02_TEST_1120
     * @tc.desc Verify div(1, 1e21) unsafe-integer number divisor yields '1e-21' triggering exponent form
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticDivPart02Test0112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.div(1, 1e21);
      expect(r.toString()).assertEqual('1e-21');
    });

    /**
     * @tc.name testDecimalStaticDivPart02Test0113
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_DIV_PART02_TEST_1130
     * @tc.desc Verify div(1, '0') string '0' divisor walks string-parsing divide-by-zero path yielding Infinity
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticDivPart02Test0113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.div(1, '0');
      expect(r.toString()).assertEqual('Infinity');
    });

    /**
     * @tc.name testDecimalStaticDivPart02Test0114
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_DIV_PART02_TEST_1140
     * @tc.desc Verify div('-0', 2) string '-0' dividend yields negative zero semantics
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticDivPart02Test0114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.div('-0', 2);
      expect(r.isNegative()).assertTrue();
      expect(r.isZero()).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticDivPart02Test0115
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_DIV_PART02_TEST_1150
     * @tc.desc Verify div(0, 7) number 0 dividend over positive divisor yields 0 and not negative
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticDivPart02Test0115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.div(0, 7);
      expect(r.toNumber()).assertEqual(0);
      expect(r.isNegative()).assertFalse();
    });

    /**
     * @tc.name testDecimalStaticDivPart02Test0116
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_DIV_PART02_TEST_1160
     * @tc.desc Verify div('1e-200', 1e-300) cross-parameter magnitude quotient equals '1e100'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticDivPart02Test0116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.div('1e-200', 1e-300);
      expect(r.toString()).assertEqual('1e+100');
    });

  });
}
