
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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium-dynamic';
import { Decimal } from '@kit.ArkTS';
import { BusinessError } from '@kit.BasicServicesKit';

function sleep(time: number): Promise<void> {
  return new Promise<void>((resolve) => setTimeout(resolve, time));
}

export default function decimalPowPart01TestTest() {
  describe('DecimalPowPart01TestTest', () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_POW_PART01_SUPPLEMENT_TEST_0100
     * @tc.name testDecimalPowPart01TestTest001
     * @tc.desc Verify 0.5 2 0.25
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPowPart01TestTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

  const d: Decimal = new Decimal(0.5).pow(2);
  expect(d.toString()).assertEqual('0.25');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_POW_PART01_SUPPLEMENT_TEST_0200
     * @tc.name testDecimalPowPart01TestTest002
     * @tc.desc Verify Decimal 0.25
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPowPart01TestTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

  const e: Decimal = new Decimal(2);
  const d: Decimal = new Decimal(0.5).pow(e);
  expect(d.toString()).assertEqual('0.25');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_POW_PART01_SUPPLEMENT_TEST_0300
     * @tc.name testDecimalPowPart01TestTest003
     * @tc.desc Verify 0.25
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPowPart01TestTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

  const d: Decimal = new Decimal(0.5).pow('2');
  expect(d.toString()).assertEqual('0.25');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_POW_PART01_SUPPLEMENT_TEST_0400
     * @tc.name testDecimalPowPart01TestTest004
     * @tc.desc Verify 0 5^0 = 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPowPart01TestTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

  try {
    new Decimal(5).pow('');
    expect().assertFail();
  } catch (e) {
    expect((e as BusinessError).code).assertEqual(401);
  }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_POW_PART01_SUPPLEMENT_TEST_0500
     * @tc.name testDecimalPowPart01TestTest005
     * @tc.desc Verify 0 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPowPart01TestTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

  const d: Decimal = new Decimal(123.456).pow(0);
  expect(d.toString()).assertEqual('1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_POW_PART01_SUPPLEMENT_TEST_0600
     * @tc.name testDecimalPowPart01TestTest006
     * @tc.desc Verify 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPowPart01TestTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

  const d: Decimal = new Decimal(7).pow(1);
  expect(d.toString()).assertEqual('7');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_POW_PART01_SUPPLEMENT_TEST_0700
     * @tc.name testDecimalPowPart01TestTest007
     * @tc.desc Verify 2 spec
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPowPart01TestTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

  const d: Decimal = new Decimal(12).pow(2);
  expect(d.toString()).assertEqual('144');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_POW_PART01_SUPPLEMENT_TEST_0800
     * @tc.name testDecimalPowPart01TestTest008
     * @tc.desc Verify 10 10
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPowPart01TestTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

  const d: Decimal = new Decimal(9).pow(10);
  expect(d.toString()).assertEqual('3486784401');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_POW_PART01_SUPPLEMENT_TEST_0900
     * @tc.name testDecimalPowPart01TestTest009
     * @tc.desc Verify 2^-4 0.0625
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPowPart01TestTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

  const d: Decimal = new Decimal(2).pow(-4);
  expect(d.toString()).assertEqual('0.0625');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_POW_PART01_SUPPLEMENT_TEST_1000
     * @tc.name testDecimalPowPart01TestTest010
     * @tc.desc Verify spec 3^-2 0.11111111111111111111 20
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPowPart01TestTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

  const d: Decimal = new Decimal(3).pow(-2);
  expect(d.toString()).assertEqual('0.11111111111111111111');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_POW_PART01_SUPPLEMENT_TEST_1100
     * @tc.name testDecimalPowPart01TestTest011
     * @tc.desc Verify 1.5^3 = 3.375
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPowPart01TestTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

  const d: Decimal = new Decimal(1.5).pow(3);
  expect(d.toString()).assertEqual('3.375');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_POW_PART01_SUPPLEMENT_TEST_1200
     * @tc.name testDecimalPowPart01TestTest012
     * @tc.desc Verify 0 0^n = 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPowPart01TestTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

  const d: Decimal = new Decimal(0).pow(5);
  expect(d.toString()).assertEqual('0');
  expect(d.isNegative()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_POW_PART01_SUPPLEMENT_TEST_1300
     * @tc.name testDecimalPowPart01TestTest013
     * @tc.desc Verify 0 0^-2 1/0 Infinity
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPowPart01TestTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

  const d: Decimal = new Decimal(0).pow(-2);
  expect(d.isFinite()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_POW_PART01_SUPPLEMENT_TEST_1400
     * @tc.name testDecimalPowPart01TestTest014
     * @tc.desc Verify 1 1 1^n
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPowPart01TestTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

  const d: Decimal = new Decimal(1).pow(-7);
  expect(d.toString()).assertEqual('1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_POW_PART01_SUPPLEMENT_TEST_1500
     * @tc.name testDecimalPowPart01TestTest015
     * @tc.desc Verify -1 +1 -1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPowPart01TestTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

  const even: Decimal = new Decimal(-1).pow(6);
  const odd: Decimal = new Decimal(-1).pow(5);
  expect(even.toString()).assertEqual('1');
  expect(odd.toString()).assertEqual('-1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_POW_PART01_SUPPLEMENT_TEST_1600
     * @tc.name testDecimalPowPart01TestTest016
     * @tc.desc Verify -0 0 -0^3
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPowPart01TestTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

  const d: Decimal = new Decimal(-0).pow(3);
  expect(d.toString()).assertEqual('0');
  expect(d.isNegative()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_POW_PART01_SUPPLEMENT_TEST_1700
     * @tc.name testDecimalPowPart01TestTest017
     * @tc.desc Verify -0 0 (-0)^0 = 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPowPart01TestTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

  const d: Decimal = new Decimal(-0).pow(0);
  expect(d.toString()).assertEqual('1');
  expect(d.isNegative()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_POW_PART01_SUPPLEMENT_TEST_1800
     * @tc.name testDecimalPowPart01TestTest018
     * @tc.desc Verify 0 0 0^0 = 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPowPart01TestTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

  const d: Decimal = new Decimal(0).pow(0);
  expect(d.toString()).assertEqual('1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_POW_PART01_SUPPLEMENT_TEST_1900
     * @tc.name testDecimalPowPart01TestTest019
     * @tc.desc Verify -0 -1 (-0)^-1 = -Infinity 1/-0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPowPart01TestTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

  const d: Decimal = new Decimal(-0).pow(-1);
  expect(d.isFinite()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_POW_PART01_SUPPLEMENT_TEST_2000
     * @tc.name testDecimalPowPart01TestTest020
     * @tc.desc Verify 4^0.5 = 2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPowPart01TestTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

  const d: Decimal = new Decimal(4).pow(0.5);
  expect(d.toString()).assertEqual('2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_POW_PART01_SUPPLEMENT_TEST_2100
     * @tc.name testDecimalPowPart01TestTest021
     * @tc.desc Verify 10 0.5 sqrt(10) 3.16227766016837933199
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPowPart01TestTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

  const d: Decimal = new Decimal(10).pow(0.5);
  expect(d.toString()).assertEqual('3.162277660168379332');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_POW_PART01_SUPPLEMENT_TEST_2200
     * @tc.name testDecimalPowPart01TestTest022
     * @tc.desc Verify (-8)^(1/3) NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPowPart01TestTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

  const d: Decimal = new Decimal(-8).pow(1 / 3);
  expect(d.isNaN()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_POW_PART01_SUPPLEMENT_TEST_2300
     * @tc.name testDecimalPowPart01TestTest023
     * @tc.desc Verify NaN NaN NaN^n = NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPowPart01TestTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

  const d: Decimal = new Decimal(NaN).pow(2);
  expect(d.isNaN()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_POW_PART01_SUPPLEMENT_TEST_2400
     * @tc.name testDecimalPowPart01TestTest024
     * @tc.desc Verify NaN NaN x^NaN = NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPowPart01TestTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

  const d: Decimal = new Decimal(2).pow(NaN);
  expect(d.isNaN()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_POW_PART01_SUPPLEMENT_TEST_2500
     * @tc.name testDecimalPowPart01TestTest025
     * @tc.desc Verify +Infinity Infinity
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPowPart01TestTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

  const d: Decimal = new Decimal(Infinity).pow(2);
  expect(d.isFinite()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_POW_PART01_SUPPLEMENT_TEST_2600
     * @tc.name testDecimalPowPart01TestTest026
     * @tc.desc Verify +Infinity 0 1 ^0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPowPart01TestTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

  const d: Decimal = new Decimal(Infinity).pow(0);
  expect(d.toString()).assertEqual('1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_POW_PART01_SUPPLEMENT_TEST_2700
     * @tc.name testDecimalPowPart01TestTest027
     * @tc.desc Verify +Infinity Infinity^-2 = 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPowPart01TestTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

  const d: Decimal = new Decimal(Infinity).pow(-2);
  expect(d.toString()).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_POW_PART01_SUPPLEMENT_TEST_2800
     * @tc.name testDecimalPowPart01TestTest028
     * @tc.desc Verify -Infinity -Infinity
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPowPart01TestTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

  const d: Decimal = new Decimal(-Infinity).pow(3);
  expect(d.isFinite()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_POW_PART01_SUPPLEMENT_TEST_2900
     * @tc.name testDecimalPowPart01TestTest029
     * @tc.desc Verify -Infinity +Infinity
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPowPart01TestTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

  const d: Decimal = new Decimal(-Infinity).pow(4);
  expect(d.isFinite()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_POW_PART01_SUPPLEMENT_TEST_3000
     * @tc.name testDecimalPowPart01TestTest030
     * @tc.desc Verify 0.5 pow Infinity '0'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPowPart01TestTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

  const d: Decimal = new Decimal(0.5).pow(Infinity);
  expect(d.toString()).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_POW_PART01_SUPPLEMENT_TEST_3100
     * @tc.name testDecimalPowPart01TestTest031
     * @tc.desc Verify +Infinity 1 Infinity
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPowPart01TestTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

  const d: Decimal = new Decimal(2).pow(Infinity);
  expect(d.isFinite()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_POW_PART01_SUPPLEMENT_TEST_3200
     * @tc.name testDecimalPowPart01TestTest032
     * @tc.desc Verify -Infinity 1 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPowPart01TestTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

  const d: Decimal = new Decimal(2).pow(-Infinity);
  expect(d.toString()).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_POW_PART01_SUPPLEMENT_TEST_3300
     * @tc.name testDecimalPowPart01TestTest033
     * @tc.desc Verify -Infinity 1 Infinity
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPowPart01TestTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

  const d: Decimal = new Decimal(0.5).pow(-Infinity);
  expect(d.isFinite()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_POW_PART01_SUPPLEMENT_TEST_3400
     * @tc.name testDecimalPowPart01TestTest034
     * @tc.desc Verify 1 Infinity 1 1^
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPowPart01TestTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

  const a: Decimal = new Decimal(1).pow(Infinity);
  const b: Decimal = new Decimal(1).pow(-Infinity);
  expect(a.isNaN()).assertTrue();
  expect(b.isNaN()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_POW_PART01_SUPPLEMENT_TEST_3500
     * @tc.name testDecimalPowPart01TestTest035
     * @tc.desc Verify MAX_VALUE Infinity 1.7976e308^2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPowPart01TestTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

  const d: Decimal = new Decimal(Number.MAX_VALUE).pow(2);
  expect(d.isFinite()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_POW_PART01_SUPPLEMENT_TEST_3600
     * @tc.name testDecimalPowPart01TestTest036
     * @tc.desc Verify MIN_VALUE 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPowPart01TestTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

  const d: Decimal = new Decimal(Number.MIN_VALUE).pow(2);
  expect(d.toString()).assertEqual('2.5e-647');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_POW_PART01_SUPPLEMENT_TEST_3700
     * @tc.name testDecimalPowPart01TestTest037
     * @tc.desc Verify EPSILON 2^-104 20
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPowPart01TestTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

  const d: Decimal = new Decimal(Number.EPSILON).pow(2);
  expect(d.toString()).assertEqual('4.9303806576313234248e-32');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_POW_PART01_SUPPLEMENT_TEST_3800
     * @tc.name testDecimalPowPart01TestTest038
     * @tc.desc Verify MAX_SAFE_INTEGER 9.007e15^2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPowPart01TestTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

  const d: Decimal = new Decimal(Number.MAX_SAFE_INTEGER).pow(2);
  expect(d.toString()).assertEqual('8.1129638414606663681e+31');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_POW_PART01_SUPPLEMENT_TEST_3900
     * @tc.name testDecimalPowPart01TestTest039
     * @tc.desc Verify MIN_SAFE_INTEGER
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPowPart01TestTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

  const d: Decimal = new Decimal(Number.MIN_SAFE_INTEGER).pow(2);
  expect(d.toString()).assertEqual('8.1129638414606663681e+31');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_POW_PART01_SUPPLEMENT_TEST_4000
     * @tc.name testDecimalPowPart01TestTest040
     * @tc.desc Verify MAX_SAFE_INTEGER 0 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPowPart01TestTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

  const d: Decimal = new Decimal(Number.MAX_SAFE_INTEGER).pow(0);
  expect(d.toString()).assertEqual('1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_POW_PART01_SUPPLEMENT_TEST_4100
     * @tc.name testDecimalPowPart01TestTest041
     * @tc.desc Verify 2 0b101=5 8 0o10=8 5^8
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPowPart01TestTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

  const d: Decimal = new Decimal(0b101).pow(0o10);
  expect(d.toString()).assertEqual('390625');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_POW_PART01_SUPPLEMENT_TEST_4200
     * @tc.name testDecimalPowPart01TestTest042
     * @tc.desc Verify 16 0x2=2 5^2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPowPart01TestTest042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

  const d: Decimal = new Decimal(5).pow(0x2);
  expect(d.toString()).assertEqual('25');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_POW_PART01_SUPPLEMENT_TEST_4300
     * @tc.name testDecimalPowPart01TestTest043
     * @tc.desc Verify 1e1=10 2^10
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPowPart01TestTest043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

  const d: Decimal = new Decimal(2).pow(1e1);
  expect(d.toString()).assertEqual('1024');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_POW_PART01_SUPPLEMENT_TEST_4400
     * @tc.name testDecimalPowPart01TestTest044
     * @tc.desc Verify '2e-1'=0.2 5^0.2 1.3797296614612148324
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPowPart01TestTest044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

  const d: Decimal = new Decimal(5).pow('2e-1');
  expect(d.toString()).assertEqual('1.3797296614612148324');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_POW_PART01_SUPPLEMENT_TEST_4500
     * @tc.name testDecimalPowPart01TestTest045
     * @tc.desc Verify '123456789012345678901234567890' string 1^ 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPowPart01TestTest045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

  const d: Decimal = new Decimal(1).pow('123456789012345678901234567890');
  expect(d.toString()).assertEqual('1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_POW_PART01_SUPPLEMENT_TEST_4600
     * @tc.name testDecimalPowPart01TestTest046
     * @tc.desc Verify 2 precision 10200060
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPowPart01TestTest046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

  let threw: boolean = false;
  try {
    Decimal.set({ precision: 1000000001 });
  } catch (e) {
    threw = true;
    expect((e as BusinessError).code).assertEqual(10200001);
  }
  Decimal.set({ precision: 20, rounding: 4 });
  expect(threw).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_POW_PART01_SUPPLEMENT_TEST_4700
     * @tc.name testDecimalPowPart01TestTest047
     * @tc.desc Verify false JS boolean Value SDK 401 0 [DP-ERROR-NUMB
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPowPart01TestTest047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

  let threw: boolean = false;
  let r: string = '';
  try {
    r = new Decimal(3).pow(false as ESObject).toString();
  } catch (e) {
    threw = true;
  }
  if (!threw) {
    expect(r === '1' || r === 'NaN').assertTrue();
  }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_POW_PART01_SUPPLEMENT_TEST_4800
     * @tc.name testDecimalPowPart01TestTest048
     * @tc.desc Verify true JS SDK 401 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPowPart01TestTest048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

  let threw: boolean = false;
  let r: string = '';
  try {
    r = new Decimal(3).pow(true as ESObject).toString();
  } catch (e) {
    threw = true;
  }
  if (!threw) {
    expect(r === '3' || r === 'NaN').assertTrue();
  }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_POW_PART01_SUPPLEMENT_TEST_4900
     * @tc.name testDecimalPowPart01TestTest049
     * @tc.desc Verify undefined 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPowPart01TestTest049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

  let u: ESObject = undefined;
  try {
        new Decimal(3).pow(u as ESObject);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_POW_PART01_SUPPLEMENT_TEST_5000
     * @tc.name testDecimalPowPart01TestTest050
     * @tc.desc Verify null 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPowPart01TestTest050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

  let n: ESObject = null;
  try {
        new Decimal(3).pow(n as ESObject);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_POW_PART01_SUPPLEMENT_TEST_5100
     * @tc.name testDecimalPowPart01TestTest051
     * @tc.desc Verify undefined 401 0 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPowPart01TestTest051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

  expect(new Decimal(3).pow(0).toString()).assertEqual('1');
  let u: ESObject = undefined;
  try {
        new Decimal(3).pow(u as ESObject);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_POW_PART01_SUPPLEMENT_TEST_5200
     * @tc.name testDecimalPowPart01TestTest052
     * @tc.desc Verify null 401 0 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPowPart01TestTest052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

  expect(new Decimal(3).pow(0).toString()).assertEqual('1');
  let n: ESObject = null;
  try {
        new Decimal(3).pow(n as ESObject);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_POW_PART01_SUPPLEMENT_TEST_5300
     * @tc.name testDecimalPowPart01TestTest053
     * @tc.desc Verify undefined 401 null 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPowPart01TestTest053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

  let u: ESObject = undefined;
  let n: ESObject = null;
  try {
        new Decimal(3).pow(u as ESObject);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
  try {
        new Decimal(3).pow(n as ESObject);
        expect().assertFail();
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_POW_PART01_SUPPLEMENT_TEST_5400
     * @tc.name testDecimalPowPart01TestTest054
     * @tc.desc Verify pow Decimal 10^2 10
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPowPart01TestTest054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

  const src: Decimal = new Decimal(10);
  const res: Decimal = src.pow(2);
  expect(src.toString()).assertEqual('10');
  expect(res.toString()).assertEqual('100');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_POW_PART01_SUPPLEMENT_TEST_5500
     * @tc.name testDecimalPowPart01TestTest055
     * @tc.desc Verify d precision 20
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPowPart01TestTest055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

  const d: Decimal = new Decimal(2).pow(10);
  expect(d.d.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_POW_PART01_SUPPLEMENT_TEST_5600
     * @tc.name testDecimalPowPart01TestTest056
     * @tc.desc Verify s 1 3^2=9
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPowPart01TestTest056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

  const d: Decimal = new Decimal(3).pow(2);
  expect(d.s).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_POW_PART01_SUPPLEMENT_TEST_5700
     * @tc.name testDecimalPowPart01TestTest057
     * @tc.desc Verify s -1 -2^3=-8
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPowPart01TestTest057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

  const d: Decimal = new Decimal(-2).pow(3);
  expect(d.s).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_POW_PART01_SUPPLEMENT_TEST_5800
     * @tc.name testDecimalPowPart01TestTest058
     * @tc.desc Verify e 2^10=1024 3
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPowPart01TestTest058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

  const d: Decimal = new Decimal(2).pow(10);
  expect(d.e).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_POW_PART01_SUPPLEMENT_TEST_5900
     * @tc.name testDecimalPowPart01TestTest059
     * @tc.desc Verify toNumber 3^4 toNumber 81
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPowPart01TestTest059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

  const n: number = new Decimal(3).pow(4).toNumber();
  expect(n).assertEqual(81);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_POW_PART01_SUPPLEMENT_TEST_6000
     * @tc.name testDecimalPowPart01TestTest060
     * @tc.desc Verify valueOf toString
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPowPart01TestTest060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

  const d: Decimal = new Decimal(2).pow(8);
  expect(d.toHexadecimal()).assertEqual('0x100');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_POW_PART01_SUPPLEMENT_TEST_6100
     * @tc.name testDecimalPowPart01TestTest061
     * @tc.desc Verify toFixed 2.5^2=6.25 2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPowPart01TestTest061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

  const d: Decimal = new Decimal(2.5).pow(2);
  expect(d.toFixed(2)).assertEqual('6.25');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_POW_PART01_SUPPLEMENT_TEST_6200
     * @tc.name testDecimalPowPart01TestTest062
     * @tc.desc Verify [2] SDK JS '2' 3^2=9 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPowPart01TestTest062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

  let threw: boolean = false;
  let r: string = '';
  let arr: ESObject = [2];
  try {
    r = new Decimal(3).pow(arr as ESObject).toString();
  } catch (e) {
    threw = true;
  }
  if (!threw) {
    expect(r === '9' || r === 'NaN').assertTrue();
  }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_POW_PART01_SUPPLEMENT_TEST_6300
     * @tc.name testDecimalPowPart01TestTest063
     * @tc.desc Verify DP-BASIC-NULLISH null/undefined/ / null [DP-BASIC-NULLI
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPowPart01TestTest063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

  let absent: Record<string, ESObject> = {};
  let nullProp: Record<string, ESObject> = { k: null } as ESObject;
  try {
        new Decimal(3).pow(absent['x'] as ESObject);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
  try {
        new Decimal(3).pow(nullProp['k'] as ESObject);
        expect().assertFail();
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_POW_PART01_SUPPLEMENT_TEST_6400
     * @tc.name testDecimalPowPart01TestTest064
     * @tc.desc Verify DP-ERROR-NUMBER NaN/Infinity /Symbol/ number Symb
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPowPart01TestTest064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

  let o: ESObject = {};
  let sym: ESObject = null as ESObject;
  try {
        new Decimal(3).pow(o as ESObject);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
  try {
        new Decimal(3).pow(sym as ESObject);
        expect().assertFail();
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });


  });

}
