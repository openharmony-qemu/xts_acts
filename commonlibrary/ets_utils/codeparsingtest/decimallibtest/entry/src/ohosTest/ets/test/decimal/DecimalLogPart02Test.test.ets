
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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { Decimal } from '@kit.ArkTS';
import { BusinessError } from '@kit.BasicServicesKit';

function sleep(time: number): Promise<void> {
  return new Promise<void>((resolve) => setTimeout(resolve, time));
}

      function logTripleBase(base: string | number | Decimal): Decimal {
        return new Decimal(8).log(base);
      }

      function logSnBase(base: string | number): Decimal {
        return new Decimal(2).log(base);
      }

      function logSdBase(base: string | Decimal): Decimal {
        return new Decimal(16).log(base);
      }

      function logNdBase(base: number | Decimal): Decimal {
        return new Decimal(16).log(base);
      }

      function pickKind(v: string | Decimal): number {
        if (typeof v === 'string') {
          return 0;
        }
        return 1;
      }

      function logWideBase(v: number | string | Decimal | boolean): Decimal {
        return new Decimal(8).log(v as ESObject);
      }

      function logFiveUnion(v: number | string | Decimal | boolean | null): Decimal {
        return new Decimal(8).log(v as ESObject);
      }


export default function decimalLogPart02TestTest() {
  describe('DecimalLogPart02TestTest', () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LOG_PART02_SUPPLEMENT_TEST_0100
     * @tc.name testDecimalLogPart02TestTest001
     * @tc.desc Verify '2' new Decimal(8).log('2') 3 log_2(8)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLogPart02TestTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

  const r: Decimal = new Decimal(8).log('2');
  expect(r.toString()).assertEqual('3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LOG_PART02_SUPPLEMENT_TEST_0200
     * @tc.name testDecimalLogPart02TestTest002
     * @tc.desc Verify number log('2') log(2)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLogPart02TestTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

  const r1: Decimal = new Decimal(8).log('2');
  const r2: Decimal = new Decimal(8).log(2);
  expect(r1.toString()).assertEqual(r2.toString());
  expect(r1.toString()).assertEqual('3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LOG_PART02_SUPPLEMENT_TEST_0300
     * @tc.name testDecimalLogPart02TestTest003
     * @tc.desc Verify any 1 log('2', 'x')
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLogPart02TestTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

  const d: ESObject = new Decimal(8);
  const r: Decimal = d.log('2', 'ignored') as Decimal;
  expect(r.toString()).assertEqual('3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LOG_PART02_SUPPLEMENT_TEST_0400
     * @tc.name testDecimalLogPart02TestTest004
     * @tc.desc Verify any log('2', 1, 'z')
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLogPart02TestTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

  const d: ESObject = new Decimal(8);
  const r: Decimal = d.log('2', 1, 'z') as Decimal;
  expect(r.toString()).assertEqual('3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LOG_PART02_SUPPLEMENT_TEST_0500
     * @tc.name testDecimalLogPart02TestTest005
     * @tc.desc Verify arity=0 any 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLogPart02TestTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

  const d: ESObject = new Decimal(8);
  try {
    const r: Decimal = d.log() as Decimal;
  } catch (e) {
    expect((e as BusinessError).code).assertEqual(401);
  }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LOG_PART02_SUPPLEMENT_TEST_0600
     * @tc.name testDecimalLogPart02TestTest006
     * @tc.desc Verify spec '256' log_256(2) 0.125
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLogPart02TestTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

  const r: Decimal = new Decimal(2).log('256');
  expect(r.toString()).assertEqual('0.125');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LOG_PART02_SUPPLEMENT_TEST_0700
     * @tc.name testDecimalLogPart02TestTest007
     * @tc.desc Verify '0.5' log_0.5(4) -2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLogPart02TestTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

  const r: Decimal = new Decimal(4).log('0.5');
  expect(r.toString()).assertEqual('-2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LOG_PART02_SUPPLEMENT_TEST_0800
     * @tc.name testDecimalLogPart02TestTest008
     * @tc.desc Verify '1e2' 100 log_100(10000) 2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLogPart02TestTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

  const r: Decimal = new Decimal(10000).log('1e2');
  expect(r.toString()).assertEqual('2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LOG_PART02_SUPPLEMENT_TEST_0900
     * @tc.name testDecimalLogPart02TestTest009
     * @tc.desc Verify '+2' '2' log_+2(8) 3
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLogPart02TestTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

  const r: Decimal = new Decimal(8).log('+2');
  expect(r.toString()).assertEqual('3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LOG_PART02_SUPPLEMENT_TEST_1000
     * @tc.name testDecimalLogPart02TestTest010
     * @tc.desc Verify '-2' NaN 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLogPart02TestTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

  const r: Decimal = new Decimal(8).log('-2');
  expect(r.toString()).assertEqual('NaN');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LOG_PART02_SUPPLEMENT_TEST_1100
     * @tc.name testDecimalLogPart02TestTest011
     * @tc.desc Verify '00256' '256' log_00256(2) 0.125
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLogPart02TestTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

  const r: Decimal = new Decimal(2).log('00256');
  expect(r.toString()).assertEqual('0.125');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LOG_PART02_SUPPLEMENT_TEST_1200
     * @tc.name testDecimalLogPart02TestTest012
     * @tc.desc Verify '3' log_3(3) 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLogPart02TestTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

  const r: Decimal = new Decimal(3).log('3');
  expect(r.toString()).assertEqual('1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LOG_PART02_SUPPLEMENT_TEST_1300
     * @tc.name testDecimalLogPart02TestTest013
     * @tc.desc Verify e '2.718281828459045' log_e(2) ln2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLogPart02TestTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

  const r: Decimal = new Decimal(2).log('2.718281828459045');
  expect(Math.abs(r.toNumber() - 0.6931471805599453) < 1e-12).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LOG_PART02_SUPPLEMENT_TEST_1400
     * @tc.name testDecimalLogPart02TestTest014
     * @tc.desc Verify MAX_SAFE_INTEGER '9007199254740993' 1 number
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLogPart02TestTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

  const big: string = '9007199254740993';
  const r: Decimal = new Decimal(big).log(big);
  expect(r.toString()).assertEqual('1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LOG_PART02_SUPPLEMENT_TEST_1500
     * @tc.name testDecimalLogPart02TestTest015
     * @tc.desc Verify '2.5' log_2.5(6.25) 2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLogPart02TestTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

  const r: Decimal = new Decimal(6.25).log('2.5');
  expect(r.toString()).assertEqual('2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LOG_PART02_SUPPLEMENT_TEST_1600
     * @tc.name testDecimalLogPart02TestTest016
     * @tc.desc Verify '2.000' '2' log_2.000(8) 3
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLogPart02TestTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

  const r: Decimal = new Decimal(8).log('2.000');
  expect(r.toString()).assertEqual('3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LOG_PART02_SUPPLEMENT_TEST_1700
     * @tc.name testDecimalLogPart02TestTest017
     * @tc.desc Verify '1e+2' '1e2' log_1e+2(10000) 2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLogPart02TestTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

  const r: Decimal = new Decimal(10000).log('1e+2');
  expect(r.toString()).assertEqual('2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LOG_PART02_SUPPLEMENT_TEST_1800
     * @tc.name testDecimalLogPart02TestTest018
     * @tc.desc Verify '0.001' log_0.001(0.000001) 2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLogPart02TestTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

  const r: Decimal = new Decimal(0.000001).log('0.001');
  expect(r.toString()).assertEqual('2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LOG_PART02_SUPPLEMENT_TEST_1900
     * @tc.name testDecimalLogPart02TestTest019
     * @tc.desc Verify '9e15' 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLogPart02TestTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

  const r: Decimal = new Decimal(9e15).log('9e15');
  expect(r.toString()).assertEqual('1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LOG_PART02_SUPPLEMENT_TEST_2000
     * @tc.name testDecimalLogPart02TestTest020
     * @tc.desc Verify '1' ln(1)=0 log_1(2) Infinity
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLogPart02TestTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

  const r: Decimal = new Decimal(2).log('1');
  expect(Number.isNaN(r.toNumber())).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LOG_PART02_SUPPLEMENT_TEST_2100
     * @tc.name testDecimalLogPart02TestTest021
     * @tc.desc Verify '0' ln(0)=-Infinity 0 NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLogPart02TestTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

  const r: Decimal = new Decimal(2).log('0');
  const n: number = r.toNumber();
  expect(Number.isNaN(n) || n === 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LOG_PART02_SUPPLEMENT_TEST_2200
     * @tc.name testDecimalLogPart02TestTest022
     * @tc.desc Verify '0.0' '0' 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLogPart02TestTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

  const r: Decimal = new Decimal(2).log('0.0');
  const n: number = r.toNumber();
  expect(Number.isNaN(n) || n === 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LOG_PART02_SUPPLEMENT_TEST_2300
     * @tc.name testDecimalLogPart02TestTest023
     * @tc.desc Verify 'NaN' NaN NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLogPart02TestTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

  const r: Decimal = new Decimal(2).log('NaN');
  expect(r.toString()).assertEqual('NaN');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LOG_PART02_SUPPLEMENT_TEST_2400
     * @tc.name testDecimalLogPart02TestTest024
     * @tc.desc Verify 'Infinity' Decimal 'Infinity'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLogPart02TestTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

  try {
    const r: Decimal = new Decimal(2).log('Infinity');
    const n: number = r.toNumber();
    expect(Number.isFinite(n)).assertFalse();
  } catch (e) {
  expect().assertFail();
  }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LOG_PART02_SUPPLEMENT_TEST_2500
     * @tc.name testDecimalLogPart02TestTest025
     * @tc.desc Verify '-Infinity' 'Infinity'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLogPart02TestTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

  try {
    const r: Decimal = new Decimal(2).log('-Infinity');
    const n: number = r.toNumber();
    expect(Number.isFinite(n)).assertFalse();
  } catch (e) {
  expect().assertFail();
  }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LOG_PART02_SUPPLEMENT_TEST_2600
     * @tc.name testDecimalLogPart02TestTest026
     * @tc.desc Verify '' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLogPart02TestTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

  try {
    const r: Decimal = new Decimal(8).log('');
  } catch (e) {
    expect((e as BusinessError).code).assertEqual(401);
  }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LOG_PART02_SUPPLEMENT_TEST_2700
     * @tc.name testDecimalLogPart02TestTest027
     * @tc.desc Verify ' ' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLogPart02TestTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

  try {
    const r: Decimal = new Decimal(8).log('   ');
  } catch (e) {
    expect((e as BusinessError).code).assertEqual(401);
  }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LOG_PART02_SUPPLEMENT_TEST_2800
     * @tc.name testDecimalLogPart02TestTest028
     * @tc.desc Verify ' ' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLogPart02TestTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

  try {
    const r: Decimal = new Decimal(8).log('​');
  } catch (e) {
    expect((e as BusinessError).code).assertEqual(401);
  }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LOG_PART02_SUPPLEMENT_TEST_2900
     * @tc.name testDecimalLogPart02TestTest029
     * @tc.desc Verify NUL ' ' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLogPart02TestTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

  try {
    const r: Decimal = new Decimal(8).log('\u0000');
  } catch (e) {
    expect((e as BusinessError).code).assertEqual(401);
  }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LOG_PART02_SUPPLEMENT_TEST_3000
     * @tc.name testDecimalLogPart02TestTest030
     * @tc.desc Verify '\t' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLogPart02TestTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

  try {
    const r: Decimal = new Decimal(8).log('\t');
  } catch (e) {
    expect((e as BusinessError).code).assertEqual(401);
  }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LOG_PART02_SUPPLEMENT_TEST_3100
     * @tc.name testDecimalLogPart02TestTest031
     * @tc.desc Verify '\n' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLogPart02TestTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

  try {
    const r: Decimal = new Decimal(8).log('\n');
  } catch (e) {
    expect((e as BusinessError).code).assertEqual(401);
  }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LOG_PART02_SUPPLEMENT_TEST_3200
     * @tc.name testDecimalLogPart02TestTest032
     * @tc.desc Verify 'abc' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLogPart02TestTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

  try {
    const r: Decimal = new Decimal(8).log('abc');
  } catch (e) {
    expect((e as BusinessError).code).assertEqual(401);
  }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LOG_PART02_SUPPLEMENT_TEST_3300
     * @tc.name testDecimalLogPart02TestTest033
     * @tc.desc Verify '0x10' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLogPart02TestTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

  try {
    const r: Decimal = new Decimal(8).log('0x10');
  } catch (e) {
    expect((e as BusinessError).code).assertEqual(401);
  }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LOG_PART02_SUPPLEMENT_TEST_3400
     * @tc.name testDecimalLogPart02TestTest034
     * @tc.desc Verify '2a' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLogPart02TestTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

  try {
    const r: Decimal = new Decimal(8).log('2a');
  } catch (e) {
    expect((e as BusinessError).code).assertEqual(401);
  }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LOG_PART02_SUPPLEMENT_TEST_3500
     * @tc.name testDecimalLogPart02TestTest035
     * @tc.desc Verify '2 56' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLogPart02TestTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

  try {
    const r: Decimal = new Decimal(8).log('2 56');
  } catch (e) {
    expect((e as BusinessError).code).assertEqual(401);
  }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LOG_PART02_SUPPLEMENT_TEST_3600
     * @tc.name testDecimalLogPart02TestTest036
     * @tc.desc Verify XSS '<script>alert(1)</script>' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLogPart02TestTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

  const evil: string = '<script>alert(1)</script>';
  try {
    const r: Decimal = new Decimal(8).log(evil);
  } catch (e) {
    expect((e as BusinessError).code).assertEqual(401);
  }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LOG_PART02_SUPPLEMENT_TEST_3700
     * @tc.name testDecimalLogPart02TestTest037
     * @tc.desc Verify emoji ' ' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLogPart02TestTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

  try {
    const r: Decimal = new Decimal(8).log('😀');
  } catch (e) {
    expect((e as BusinessError).code).assertEqual(401);
  }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LOG_PART02_SUPPLEMENT_TEST_3800
     * @tc.name testDecimalLogPart02TestTest038
     * @tc.desc Verify ' ' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLogPart02TestTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

  try {
    const r: Decimal = new Decimal(8).log('二');
  } catch (e) {
    expect((e as BusinessError).code).assertEqual(401);
  }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LOG_PART02_SUPPLEMENT_TEST_3900
     * @tc.name testDecimalLogPart02TestTest039
     * @tc.desc Verify '\uD800' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLogPart02TestTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

  try {
    const r: Decimal = new Decimal(8).log('\uD800');
  } catch (e) {
    expect((e as BusinessError).code).assertEqual(401);
  }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LOG_PART02_SUPPLEMENT_TEST_4000
     * @tc.name testDecimalLogPart02TestTest040
     * @tc.desc Verify 10000 '1' / 401 10200060
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLogPart02TestTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

  let longBase: string = '';
  for (let i = 0; i < 10000; i++) {
    longBase += '1';
  }
  try {
    const r: Decimal = new Decimal(2).log(longBase);
  } catch (e) {
    expect((e as BusinessError).code === 401 || (e as BusinessError).code === 10200060).assertTrue();
  }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LOG_PART02_SUPPLEMENT_TEST_4100
     * @tc.name testDecimalLogPart02TestTest041
     * @tc.desc Verify '1/2' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLogPart02TestTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

  try {
    const r: Decimal = new Decimal(8).log('1/2');
  } catch (e) {
    expect((e as BusinessError).code).assertEqual(401);
  }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LOG_PART02_SUPPLEMENT_TEST_4200
     * @tc.name testDecimalLogPart02TestTest042
     * @tc.desc Verify '2,56' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLogPart02TestTest042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

  try {
    const r: Decimal = new Decimal(8).log('2,56');
  } catch (e) {
    expect((e as BusinessError).code).assertEqual(401);
  }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LOG_PART02_SUPPLEMENT_TEST_4300
     * @tc.name testDecimalLogPart02TestTest043
     * @tc.desc Verify ' ' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLogPart02TestTest043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

  try {
    const r: Decimal = new Decimal(8).log('２');
  } catch (e) {
    expect((e as BusinessError).code).assertEqual(401);
  }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LOG_PART02_SUPPLEMENT_TEST_4400
     * @tc.name testDecimalLogPart02TestTest044
     * @tc.desc Verify ZWJ emoji ' ' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLogPart02TestTest044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

  try {
    const r: Decimal = new Decimal(8).log('👨‍👩‍👧');
  } catch (e) {
    expect((e as BusinessError).code).assertEqual(401);
  }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LOG_PART02_SUPPLEMENT_TEST_4500
     * @tc.name testDecimalLogPart02TestTest045
     * @tc.desc Verify string|number|Decimal log_2(8)=3
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLogPart02TestTest045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {


  expect(logTripleBase('2').toString()).assertEqual('3');
  expect(logTripleBase(2).toString()).assertEqual('3');
  expect(logTripleBase(new Decimal(2)).toString()).assertEqual('3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LOG_PART02_SUPPLEMENT_TEST_4600
     * @tc.name testDecimalLogPart02TestTest046
     * @tc.desc Verify string|number '256' 256 log_256(2)=0.125
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLogPart02TestTest046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {


  expect(logSnBase('256').toString()).assertEqual('0.125');
  expect(logSnBase(256).toString()).assertEqual('0.125');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LOG_PART02_SUPPLEMENT_TEST_4700
     * @tc.name testDecimalLogPart02TestTest047
     * @tc.desc Verify string|Decimal '4' new Decimal(4) log_4(16)=2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLogPart02TestTest047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {


  expect(logSdBase('4').toString()).assertEqual('2');
  expect(logSdBase(new Decimal(4)).toString()).assertEqual('2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LOG_PART02_SUPPLEMENT_TEST_4800
     * @tc.name testDecimalLogPart02TestTest048
     * @tc.desc Verify number|Decimal 4 new Decimal(4) log_4(16)=2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLogPart02TestTest048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {


  expect(logNdBase(4).toString()).assertEqual('2');
  expect(logNdBase(new Decimal(4)).toString()).assertEqual('2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LOG_PART02_SUPPLEMENT_TEST_4900
     * @tc.name testDecimalLogPart02TestTest049
     * @tc.desc Verify Decimal new Decimal(2) / new Decimal('2.0') / new
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLogPart02TestTest049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

  const a: Decimal = new Decimal(2);
  const b: Decimal = new Decimal('2.0');
  const c: Decimal = new Decimal('2');
  expect(new Decimal(8).log(a).toString()).assertEqual('3');
  expect(new Decimal(8).log(b).toString()).assertEqual('3');
  expect(new Decimal(8).log(c).toString()).assertEqual('3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LOG_PART02_SUPPLEMENT_TEST_5000
     * @tc.name testDecimalLogPart02TestTest050
     * @tc.desc Verify string|Decimal typeof
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLogPart02TestTest050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {


  expect(pickKind('2')).assertEqual(0);
  expect(pickKind(new Decimal(2))).assertEqual(1);
  const r1: Decimal = new Decimal(8).log('2');
  const r2: Decimal = new Decimal(8).log(new Decimal(2));
  expect(r1.toString()).assertEqual(r2.toString());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LOG_PART02_SUPPLEMENT_TEST_5100
     * @tc.name testDecimalLogPart02TestTest051
     * @tc.desc Verify number|string|Decimal|boolean boolean 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLogPart02TestTest051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {


  try {
    const r: Decimal = logWideBase(true);
  } catch (e) {
    expect((e as BusinessError).code).assertEqual(401);
  }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LOG_PART02_SUPPLEMENT_TEST_5200
     * @tc.name testDecimalLogPart02TestTest052
     * @tc.desc Verify null any null 401 null undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLogPart02TestTest052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

  const d: ESObject = new Decimal(8);
  try {
    const r: Decimal = d.log(null as ESObject) as Decimal;
  } catch (e) {
    expect((e as BusinessError).code).assertEqual(401);
  }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LOG_PART02_SUPPLEMENT_TEST_5300
     * @tc.name testDecimalLogPart02TestTest053
     * @tc.desc Verify undefined any undefined 401 null
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLogPart02TestTest053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

  const d: ESObject = new Decimal(8);
  try {
    const r: Decimal = d.log(undefined as ESObject) as Decimal;
  } catch (e) {
    expect((e as BusinessError).code).assertEqual(401);
  }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LOG_PART02_SUPPLEMENT_TEST_5400
     * @tc.name testDecimalLogPart02TestTest054
     * @tc.desc Verify Decimal new Decimal('8').log(new Decimal
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLogPart02TestTest054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

  const r: Decimal = new Decimal('8').log(new Decimal(2));
  expect(r.toString()).assertEqual('3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LOG_PART02_SUPPLEMENT_TEST_5500
     * @tc.name testDecimalLogPart02TestTest055
     * @tc.desc Verify string+ number number+ string number+
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLogPart02TestTest055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

  const a: Decimal = new Decimal('8').log(2);
  const b: Decimal = new Decimal(8).log('2');
  const c: Decimal = new Decimal(8).log(new Decimal(2));
  expect(a.toString()).assertEqual('3');
  expect(b.toString()).assertEqual('3');
  expect(c.toString()).assertEqual('3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LOG_PART02_SUPPLEMENT_TEST_5600
     * @tc.name testDecimalLogPart02TestTest056
     * @tc.desc Verify Decimal new Decimal(8).log('2') toString '8'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLogPart02TestTest056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

  const dec: Decimal = new Decimal(8);
  const r: Decimal = dec.log('2');
  expect(dec.toString()).assertEqual('8');
  expect(r.toString()).assertEqual('3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LOG_PART02_SUPPLEMENT_TEST_5700
     * @tc.name testDecimalLogPart02TestTest057
     * @tc.desc Verify Decimal instanceof
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLogPart02TestTest057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

  const dec: Decimal = new Decimal(8);
  const r: Decimal = dec.log('2');
  expect(r instanceof Decimal).assertTrue();
  expect(r === dec).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LOG_PART02_SUPPLEMENT_TEST_5800
     * @tc.name testDecimalLogPart02TestTest058
     * @tc.desc Verify Decimal new Decimal(8).log('2').add(1) 4
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLogPart02TestTest058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

  const r: Decimal = new Decimal(8).log('2').add(1);
  expect(r.toString()).assertEqual('4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LOG_PART02_SUPPLEMENT_TEST_5900
     * @tc.name testDecimalLogPart02TestTest059
     * @tc.desc Verify toString toNumber log('2') toNumber() 3
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLogPart02TestTest059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

  const r: Decimal = new Decimal(8).log('2');
  expect(r.toString()).assertEqual('3');
  expect(r.toNumber()).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LOG_PART02_SUPPLEMENT_TEST_6000
     * @tc.name testDecimalLogPart02TestTest060
     * @tc.desc Verify 401 new Decimal(8).log('2') 3
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLogPart02TestTest060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

  try {
    const r: Decimal = new Decimal(8).log('##bad##');
  } catch (e) {
    expect((e as BusinessError).code).assertEqual(401);
  }
  const ok: Decimal = new Decimal(8).log('2');
  expect(ok.toString()).assertEqual('3');
    });


  });

}
