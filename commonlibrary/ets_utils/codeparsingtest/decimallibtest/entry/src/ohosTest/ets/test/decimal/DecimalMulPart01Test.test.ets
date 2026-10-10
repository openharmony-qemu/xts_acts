
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

export default function decimalMulPart01TestTest() {
  describe('DecimalMulPart01TestTest', () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MUL_PART01_SUPPLEMENT_TEST_0100
     * @tc.name testDecimalMulPart01TestTest001
     * @tc.desc Verify number Decimal
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalMulPart01TestTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal('10');
      expect(d.mul(5).toString()).assertEqual('50');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MUL_PART01_SUPPLEMENT_TEST_0200
     * @tc.name testDecimalMulPart01TestTest002
     * @tc.desc Verify 5 * 3 = 15
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalMulPart01TestTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Decimal(5).mul(3).toString()).assertEqual('15');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MUL_PART01_SUPPLEMENT_TEST_0300
     * @tc.name testDecimalMulPart01TestTest003
     * @tc.desc Verify number JS 0.1 * 0.2 = 0.02
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalMulPart01TestTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Decimal(0.1).mul(0.2).toString()).assertEqual('0.02');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MUL_PART01_SUPPLEMENT_TEST_0400
     * @tc.name testDecimalMulPart01TestTest004
     * @tc.desc Verify number values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalMulPart01TestTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Decimal(-4).mul(3).toString()).assertEqual('-12');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MUL_PART01_SUPPLEMENT_TEST_0500
     * @tc.name testDecimalMulPart01TestTest005
     * @tc.desc Verify number values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalMulPart01TestTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Decimal(-4).mul(-3).toString()).assertEqual('12');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MUL_PART01_SUPPLEMENT_TEST_0600
     * @tc.name testDecimalMulPart01TestTest006
     * @tc.desc Verify 2.5 * 2 = 5
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalMulPart01TestTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Decimal(2.5).mul(2).toString()).assertEqual('5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MUL_PART01_SUPPLEMENT_TEST_0700
     * @tc.name testDecimalMulPart01TestTest007
     * @tc.desc Verify 0.5 * 0.25 = 0.125
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalMulPart01TestTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Decimal(0.5).mul(0.25).toString()).assertEqual('0.125');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MUL_PART01_SUPPLEMENT_TEST_0800
     * @tc.name testDecimalMulPart01TestTest008
     * @tc.desc Verify number values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalMulPart01TestTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = new Decimal(0).mul(5);
      expect(r.toString()).assertEqual('0');
      expect(r.isNegative()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MUL_PART01_SUPPLEMENT_TEST_0900
     * @tc.name testDecimalMulPart01TestTest009
     * @tc.desc Verify 1.25 * 8 = 10
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalMulPart01TestTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Decimal(1.25).mul(8).toString()).assertEqual('10');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MUL_PART01_SUPPLEMENT_TEST_1000
     * @tc.name testDecimalMulPart01TestTest010
     * @tc.desc Verify 999.999 * 1000 = 999999
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalMulPart01TestTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Decimal(999.999).mul(1000).toString()).assertEqual('999999');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MUL_PART01_SUPPLEMENT_TEST_1100
     * @tc.name testDecimalMulPart01TestTest011
     * @tc.desc Verify 1e5 * 1e-5 = 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalMulPart01TestTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Decimal(1e5).mul(1e-5).toString()).assertEqual('1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MUL_PART01_SUPPLEMENT_TEST_1200
     * @tc.name testDecimalMulPart01TestTest012
     * @tc.desc Verify 2e3 * 1.5 = 3000
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalMulPart01TestTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Decimal(2e3).mul(1.5).toString()).assertEqual('3000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MUL_PART01_SUPPLEMENT_TEST_1300
     * @tc.name testDecimalMulPart01TestTest013
     * @tc.desc Verify 1e-7 * 1e-7 = 1e-14
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalMulPart01TestTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Decimal(1e-7).mul(1e-7).toString()).assertEqual('1e-14');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MUL_PART01_SUPPLEMENT_TEST_1400
     * @tc.name testDecimalMulPart01TestTest014
     * @tc.desc Verify 0.001 * 0.001 = 0.000001
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalMulPart01TestTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Decimal(0.001).mul(0.001).toString()).assertEqual('0.000001');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MUL_PART01_SUPPLEMENT_TEST_1500
     * @tc.name testDecimalMulPart01TestTest015
     * @tc.desc Verify 1e8 * 1e-9 = 0.1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalMulPart01TestTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Decimal(1e8).mul(1e-9).toString()).assertEqual('0.1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MUL_PART01_SUPPLEMENT_TEST_1600
     * @tc.name testDecimalMulPart01TestTest016
     * @tc.desc Verify 0x10 16
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalMulPart01TestTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Decimal(0x10).mul(3).toString()).assertEqual('48');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MUL_PART01_SUPPLEMENT_TEST_1700
     * @tc.name testDecimalMulPart01TestTest017
     * @tc.desc Verify 0b101 5
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalMulPart01TestTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Decimal(0b101).mul(2).toString()).assertEqual('10');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MUL_PART01_SUPPLEMENT_TEST_1800
     * @tc.name testDecimalMulPart01TestTest018
     * @tc.desc Verify 0o10 8
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalMulPart01TestTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Decimal(0o10).mul(4).toString()).assertEqual('32');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MUL_PART01_SUPPLEMENT_TEST_1900
     * @tc.name testDecimalMulPart01TestTest019
     * @tc.desc Verify MAX_SAFE_INTEGER 2 JS number
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalMulPart01TestTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Decimal(Number.MAX_SAFE_INTEGER).mul(2).toString()).assertEqual('18014398509481982');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MUL_PART01_SUPPLEMENT_TEST_2000
     * @tc.name testDecimalMulPart01TestTest020
     * @tc.desc Verify MIN_SAFE_INTEGER 2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalMulPart01TestTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Decimal(Number.MIN_SAFE_INTEGER).mul(2).toString()).assertEqual('-18014398509481982');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MUL_PART01_SUPPLEMENT_TEST_2100
     * @tc.name testDecimalMulPart01TestTest021
     * @tc.desc Verify 9e15 10
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalMulPart01TestTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Decimal(9e15).mul(10).toString()).assertEqual('90000000000000000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MUL_PART01_SUPPLEMENT_TEST_2200
     * @tc.name testDecimalMulPart01TestTest022
     * @tc.desc Verify -9e15 10
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalMulPart01TestTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Decimal(-9e15).mul(10).toString()).assertEqual('-90000000000000000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MUL_PART01_SUPPLEMENT_TEST_2300
     * @tc.name testDecimalMulPart01TestTest023
     * @tc.desc Verify MAX_VALUE 1 toNumber MAX_VALUE
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalMulPart01TestTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m: Decimal = new Decimal(Number.MAX_VALUE).mul(1);
      expect(m.toNumber()).assertEqual(Number.MAX_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MUL_PART01_SUPPLEMENT_TEST_2400
     * @tc.name testDecimalMulPart01TestTest024
     * @tc.desc Verify MIN_VALUE 1 5e-324
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalMulPart01TestTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Decimal(Number.MIN_VALUE).mul(1).toString()).assertEqual('5e-324');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MUL_PART01_SUPPLEMENT_TEST_2500
     * @tc.name testDecimalMulPart01TestTest025
     * @tc.desc Verify 1 EPSILON
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalMulPart01TestTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let eps: Decimal = new Decimal(1).mul(Number.EPSILON);
      expect(eps.toNumber() > 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MUL_PART01_SUPPLEMENT_TEST_2600
     * @tc.name testDecimalMulPart01TestTest026
     * @tc.desc Verify 1e100 1e100 1e+200 JS
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalMulPart01TestTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Decimal(1e100).mul(1e100).toString()).assertEqual('1e+200');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MUL_PART01_SUPPLEMENT_TEST_2700
     * @tc.name testDecimalMulPart01TestTest027
     * @tc.desc Verify string 2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalMulPart01TestTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let bigMul: Decimal = new Decimal('12345678901234567890').mul(2);
      expect(bigMul.toString()).assertEqual('24691357802469135780');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MUL_PART01_SUPPLEMENT_TEST_2800
     * @tc.name testDecimalMulPart01TestTest028
     * @tc.desc Verify 123456.789 * 2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalMulPart01TestTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Decimal('123456.789').mul(2).toString()).assertEqual('246913.578');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MUL_PART01_SUPPLEMENT_TEST_2900
     * @tc.name testDecimalMulPart01TestTest029
     * @tc.desc Verify 1 * 2 * 3 * 4 = 24
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalMulPart01TestTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Decimal(1).mul(2).mul(3).mul(4).toString()).assertEqual('24');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MUL_PART01_SUPPLEMENT_TEST_3000
     * @tc.name testDecimalMulPart01TestTest030
     * @tc.desc Verify 2 * 3 3 * 2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalMulPart01TestTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: string = new Decimal(2).mul(3).toString();
      let b: string = new Decimal(3).mul(2).toString();
      expect(a).assertEqual('6');
      expect(b).assertEqual('6');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MUL_PART01_SUPPLEMENT_TEST_3100
     * @tc.name testDecimalMulPart01TestTest031
     * @tc.desc Verify 0.111111 * 0.111111
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalMulPart01TestTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Decimal(0.111111).mul(0.111111).toString()).assertEqual('0.012345654321');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MUL_PART01_SUPPLEMENT_TEST_3200
     * @tc.name testDecimalMulPart01TestTest032
     * @tc.desc Verify 100 0.01 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalMulPart01TestTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Decimal(100).mul(0.01).toString()).assertEqual('1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MUL_PART01_SUPPLEMENT_TEST_3300
     * @tc.name testDecimalMulPart01TestTest033
     * @tc.desc Verify 1e21 1 1e+21 toExpPos
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalMulPart01TestTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Decimal(1e21).mul(1).toString()).assertEqual('1e+21');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MUL_PART01_SUPPLEMENT_TEST_3400
     * @tc.name testDecimalMulPart01TestTest034
     * @tc.desc Verify 1e-6 1 0.000001 toExpNeg
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalMulPart01TestTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Decimal(1e-6).mul(1).toString()).assertEqual('0.000001');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MUL_PART01_SUPPLEMENT_TEST_3500
     * @tc.name testDecimalMulPart01TestTest035
     * @tc.desc Verify precision 4 123 * 456 = 56090
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalMulPart01TestTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ precision: 4, rounding: 4 });
      try {
        expect(new Decimal(123).mul(456).toString()).assertEqual('56090');
      } finally {
        Decimal.set({ precision: 20, rounding: 4 });
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MUL_PART01_SUPPLEMENT_TEST_3600
     * @tc.name testDecimalMulPart01TestTest036
     * @tc.desc Verify precision 2 rounding 0 ROUND_UP 1.234 * 1.234 = 1.522756 1.6
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalMulPart01TestTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ precision: 2, rounding: 0 });
      try {
        expect(new Decimal(1.234).mul(1.234).toString()).assertEqual('1.6');
      } finally {
        Decimal.set({ precision: 20, rounding: 4 });
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MUL_PART01_SUPPLEMENT_TEST_3700
     * @tc.name testDecimalMulPart01TestTest037
     * @tc.desc Verify precision 3 rounding 0 ROUND_UP 1.234 * 1.234 = 1.522756 1.53
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalMulPart01TestTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ precision: 3, rounding: 0 });
      try {
        expect(new Decimal(1.234).mul(1.234).toString()).assertEqual('1.53');
      } finally {
        Decimal.set({ precision: 20, rounding: 4 });
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MUL_PART01_SUPPLEMENT_TEST_3800
     * @tc.name testDecimalMulPart01TestTest038
     * @tc.desc Verify precision 2 rounding 0 1.25 1.3
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalMulPart01TestTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ precision: 2, rounding: 0 });
      try {
        expect(new Decimal(1.25).mul(1).toString()).assertEqual('1.3');
      } finally {
        Decimal.set({ precision: 20, rounding: 4 });
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MUL_PART01_SUPPLEMENT_TEST_3900
     * @tc.name testDecimalMulPart01TestTest039
     * @tc.desc Verify precision 2 rounding 8 1.25 1.2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalMulPart01TestTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ precision: 2, rounding: 8 });
      try {
        expect(new Decimal(1.25).mul(1).toString()).assertEqual('1.2');
      } finally {
        Decimal.set({ precision: 20, rounding: 4 });
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MUL_PART01_SUPPLEMENT_TEST_4000
     * @tc.name testDecimalMulPart01TestTest040
     * @tc.desc Verify precision 5 123.456 * 123.456 = 15241
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalMulPart01TestTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ precision: 5, rounding: 4 });
      try {
        expect(new Decimal(123.456).mul(123.456).toString()).assertEqual('15241');
      } finally {
        Decimal.set({ precision: 20, rounding: 4 });
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MUL_PART01_SUPPLEMENT_TEST_4100
     * @tc.name testDecimalMulPart01TestTest041
     * @tc.desc Verify null 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalMulPart01TestTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let n: ESObject = null;
      try {
        new Decimal(5).mul(n as ESObject);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MUL_PART01_SUPPLEMENT_TEST_4200
     * @tc.name testDecimalMulPart01TestTest042
     * @tc.desc Verify undefined 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalMulPart01TestTest042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let holder: Record<string, ESObject> = {};
      let v: ESObject = holder['absent'];
      try {
        new Decimal(5).mul(v as ESObject);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MUL_PART01_SUPPLEMENT_TEST_4300
     * @tc.name testDecimalMulPart01TestTest043
     * @tc.desc Verify null 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalMulPart01TestTest043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: Record<string, ESObject> = { k: null } as ESObject;
      let v: ESObject = obj['k'];
      try {
        new Decimal(5).mul(v as ESObject);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MUL_PART01_SUPPLEMENT_TEST_4400
     * @tc.name testDecimalMulPart01TestTest044
     * @tc.desc Verify undefined 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalMulPart01TestTest044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: number[] = [1, 2];
      let v: ESObject = arr[10];
      try {
        new Decimal(5).mul(v as ESObject);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MUL_PART01_SUPPLEMENT_TEST_4500
     * @tc.name testDecimalMulPart01TestTest045
     * @tc.desc Verify undefined 0 undefined 401 0 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalMulPart01TestTest045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let u: ESObject = undefined;
      let thrown: boolean = false;
      try {
        new Decimal(5).mul(u as ESObject);
      } catch (e) {
        thrown = true;
        expect((e as Record<string, number>).code).assertEqual(401);
      }
      expect(thrown).assertTrue();
      expect(new Decimal(5).mul(0).toString()).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MUL_PART01_SUPPLEMENT_TEST_4600
     * @tc.name testDecimalMulPart01TestTest046
     * @tc.desc Verify undefined 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalMulPart01TestTest046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal('10');
      let c1: number = -1;
      let c2: number = -1;
      try { (d.mul as Function)(); } catch (e) { c1 = (e as Record<string, number>).code; }
      let u: ESObject = undefined;
      try { new Decimal('10').mul(u as ESObject); } catch (e) { c2 = (e as Record<string, number>).code; }
      expect(c1).assertEqual(401);
      expect(c2).assertEqual(401);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MUL_PART01_SUPPLEMENT_TEST_4700
     * @tc.name testDecimalMulPart01TestTest047
     * @tc.desc Verify NaN NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalMulPart01TestTest047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Decimal(5).mul(NaN).toString()).assertEqual('NaN');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MUL_PART01_SUPPLEMENT_TEST_4800
     * @tc.name testDecimalMulPart01TestTest048
     * @tc.desc Verify this NaN NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalMulPart01TestTest048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Decimal(NaN).mul(5).toString()).assertEqual('NaN');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MUL_PART01_SUPPLEMENT_TEST_4900
     * @tc.name testDecimalMulPart01TestTest049
     * @tc.desc Verify +Infinity Infinity
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalMulPart01TestTest049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Decimal(5).mul(Infinity).toString()).assertEqual('Infinity');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MUL_PART01_SUPPLEMENT_TEST_5000
     * @tc.name testDecimalMulPart01TestTest050
     * @tc.desc Verify -Infinity -Infinity
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalMulPart01TestTest050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Decimal(5).mul(-Infinity).toString()).assertEqual('-Infinity');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MUL_PART01_SUPPLEMENT_TEST_5100
     * @tc.name testDecimalMulPart01TestTest051
     * @tc.desc Verify -Infinity Infinity
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalMulPart01TestTest051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Decimal(-3).mul(-Infinity).toString()).assertEqual('Infinity');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MUL_PART01_SUPPLEMENT_TEST_5200
     * @tc.name testDecimalMulPart01TestTest052
     * @tc.desc Verify Infinity 0 NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalMulPart01TestTest052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Decimal(Infinity).mul(0).toString()).assertEqual('NaN');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MUL_PART01_SUPPLEMENT_TEST_5300
     * @tc.name testDecimalMulPart01TestTest053
     * @tc.desc Verify -Infinity 0 NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalMulPart01TestTest053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Decimal(-Infinity).mul(0).toString()).assertEqual('NaN');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MUL_PART01_SUPPLEMENT_TEST_5400
     * @tc.name testDecimalMulPart01TestTest054
     * @tc.desc Verify 0 Infinity NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalMulPart01TestTest054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Decimal(0).mul(Infinity).toString()).assertEqual('NaN');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MUL_PART01_SUPPLEMENT_TEST_5500
     * @tc.name testDecimalMulPart01TestTest055
     * @tc.desc Verify Infinity Infinity Infinity
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalMulPart01TestTest055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Decimal(Infinity).mul(Infinity).toString()).assertEqual('Infinity');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MUL_PART01_SUPPLEMENT_TEST_5600
     * @tc.name testDecimalMulPart01TestTest056
     * @tc.desc Verify Infinity -Infinity -Infinity
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalMulPart01TestTest056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Decimal(Infinity).mul(-Infinity).toString()).assertEqual('-Infinity');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MUL_PART01_SUPPLEMENT_TEST_5700
     * @tc.name testDecimalMulPart01TestTest057
     * @tc.desc Verify NaN Infinity NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalMulPart01TestTest057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Decimal(NaN).mul(Infinity).toString()).assertEqual('NaN');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MUL_PART01_SUPPLEMENT_TEST_5800
     * @tc.name testDecimalMulPart01TestTest058
     * @tc.desc Verify -0 isNegative true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalMulPart01TestTest058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = new Decimal(-0).mul(3);
      expect(r.isNegative()).assertTrue();
      expect(1 / r.toNumber()).assertEqual(-Infinity);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MUL_PART01_SUPPLEMENT_TEST_5900
     * @tc.name testDecimalMulPart01TestTest059
     * @tc.desc Verify 0 isNegative true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalMulPart01TestTest059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = new Decimal(-5).mul(0);
      expect(r.toString()).assertEqual('0');
      expect(r.isNegative()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MUL_PART01_SUPPLEMENT_TEST_6000
     * @tc.name testDecimalMulPart01TestTest060
     * @tc.desc Verify 0 0 isNegative false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalMulPart01TestTest060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = new Decimal(0).mul(0);
      expect(r.toString()).assertEqual('0');
      expect(r.isNegative()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MUL_PART01_SUPPLEMENT_TEST_6100
     * @tc.name testDecimalMulPart01TestTest061
     * @tc.desc Verify MAX_VALUE Decimal toNumber Infinity
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalMulPart01TestTest061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m: Decimal = new Decimal(Number.MAX_VALUE).mul(Number.MAX_VALUE);
      expect(m.isFinite()).assertTrue();
      expect(m.greaterThan(new Decimal(Number.MAX_VALUE))).assertTrue();
      expect(m.toNumber()).assertEqual(Infinity);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MUL_PART01_SUPPLEMENT_TEST_6200
     * @tc.name testDecimalMulPart01TestTest062
     * @tc.desc Verify 1e200 1e200 JS number Decimal 1e+400
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalMulPart01TestTest062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m: Decimal = new Decimal(1e200).mul(1e200);
      expect(m.toString()).assertEqual('1e+400');
      expect(m.isFinite()).assertTrue();
      expect(m.toNumber()).assertEqual(Infinity);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MUL_PART01_SUPPLEMENT_TEST_6300
     * @tc.name testDecimalMulPart01TestTest063
     * @tc.desc Verify true 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalMulPart01TestTest063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let t: ESObject = true;
      try {
        new Decimal(5).mul(t as ESObject);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MUL_PART01_SUPPLEMENT_TEST_6400
     * @tc.name testDecimalMulPart01TestTest064
     * @tc.desc Verify {} 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalMulPart01TestTest064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let o: ESObject = {};
      try {
        new Decimal(5).mul(o as ESObject);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MUL_PART01_SUPPLEMENT_TEST_6500
     * @tc.name testDecimalMulPart01TestTest065
     * @tc.desc Verify [] 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalMulPart01TestTest065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: ESObject = [];
      try {
        new Decimal(5).mul(a as ESObject);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MUL_PART01_SUPPLEMENT_TEST_6600
     * @tc.name testDecimalMulPart01TestTest066
     * @tc.desc Verify mul Decimal
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalMulPart01TestTest066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Decimal = new Decimal('5');
      let b: Decimal = a.mul(3);
      expect(a.toString()).assertEqual('5');
      expect(b.toString()).assertEqual('15');
      expect(b instanceof Decimal).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MUL_PART01_SUPPLEMENT_TEST_6700
     * @tc.name testDecimalMulPart01TestTest067
     * @tc.desc Verify Decimal toNumber 0.5 * 0.4 = 0.2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalMulPart01TestTest067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = new Decimal('0.5').mul(0.4);
      expect(r instanceof Decimal).assertTrue();
      expect(r.toNumber()).assertEqual(0.2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MUL_PART01_SUPPLEMENT_TEST_6800
     * @tc.name testDecimalMulPart01TestTest068
     * @tc.desc Verify d 6 2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalMulPart01TestTest068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Decimal = new Decimal('2');
      let b: Decimal = a.mul(3);
      expect(b.d[0]).assertEqual(6);
      expect(a.d[0]).assertEqual(2);
    });


  });

}
