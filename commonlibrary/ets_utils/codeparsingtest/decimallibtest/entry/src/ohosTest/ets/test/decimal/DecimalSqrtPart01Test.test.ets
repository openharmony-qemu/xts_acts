
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

export default function decimalSqrtPart01TestTest() {
  describe('DecimalSqrtPart01TestTest', () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SQRT_PART01_SUPPLEMENT_TEST_0100
     * @tc.name testDecimalSqrtPart01TestTest001
     * @tc.desc Verify sqrt 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalSqrtPart01TestTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal('6.25').sqrt();
      expect(d.toString()).assertEqual('2.5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SQRT_PART01_SUPPLEMENT_TEST_0200
     * @tc.name testDecimalSqrtPart01TestTest002
     * @tc.desc Verify 16 sqrt 4
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalSqrtPart01TestTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(16).sqrt();
      expect(d.toString()).assertEqual('4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SQRT_PART01_SUPPLEMENT_TEST_0300
     * @tc.name testDecimalSqrtPart01TestTest003
     * @tc.desc Verify 144 sqrt 12
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalSqrtPart01TestTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(144).sqrt();
      expect(d.toString()).assertEqual('12');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SQRT_PART01_SUPPLEMENT_TEST_0400
     * @tc.name testDecimalSqrtPart01TestTest004
     * @tc.desc Verify '0.0001' sqrt 0.01
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalSqrtPart01TestTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal('0.0001').sqrt();
      expect(d.toString()).assertEqual('0.01');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SQRT_PART01_SUPPLEMENT_TEST_0500
     * @tc.name testDecimalSqrtPart01TestTest005
     * @tc.desc Verify '1.21' sqrt 1.1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalSqrtPart01TestTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal('1.21').sqrt();
      expect(d.toString()).assertEqual('1.1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SQRT_PART01_SUPPLEMENT_TEST_0600
     * @tc.name testDecimalSqrtPart01TestTest006
     * @tc.desc Verify sqrt(2) 20
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalSqrtPart01TestTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(2).sqrt();
      expect(d.toString()).assertEqual('1.4142135623730950488');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SQRT_PART01_SUPPLEMENT_TEST_0700
     * @tc.name testDecimalSqrtPart01TestTest007
     * @tc.desc Verify sqrt(3) spec 1.7320508075688772935
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalSqrtPart01TestTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(3).sqrt();
      expect(d.toString()).assertEqual('1.7320508075688772935');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SQRT_PART01_SUPPLEMENT_TEST_0800
     * @tc.name testDecimalSqrtPart01TestTest008
     * @tc.desc Verify sqrt(0.5) 0.7071067811865475244
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalSqrtPart01TestTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(0.5).sqrt();
      expect(d.toString()).assertEqual('0.7071067811865475244');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SQRT_PART01_SUPPLEMENT_TEST_0900
     * @tc.name testDecimalSqrtPart01TestTest009
     * @tc.desc Verify sqrt('1e-7') 0.0003162277660168379332
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalSqrtPart01TestTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal('1e-7').sqrt();
      expect(d.toString()).assertEqual('0.0003162277660168379332');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SQRT_PART01_SUPPLEMENT_TEST_1000
     * @tc.name testDecimalSqrtPart01TestTest010
     * @tc.desc Verify sqrt('1e-14') 10 1e-7
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalSqrtPart01TestTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal('1e-14').sqrt();
      expect(d.toString()).assertEqual('1e-7');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SQRT_PART01_SUPPLEMENT_TEST_1100
     * @tc.name testDecimalSqrtPart01TestTest011
     * @tc.desc Verify sqrt(NaN) NaN isNaN true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalSqrtPart01TestTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(NaN).sqrt();
      expect(d.toString()).assertEqual('NaN');
      expect(d.isNaN()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SQRT_PART01_SUPPLEMENT_TEST_1200
     * @tc.name testDecimalSqrtPart01TestTest012
     * @tc.desc Verify sqrt(+Infinity) Infinity
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalSqrtPart01TestTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(Infinity).sqrt();
      expect(d.toString()).assertEqual('Infinity');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SQRT_PART01_SUPPLEMENT_TEST_1300
     * @tc.name testDecimalSqrtPart01TestTest013
     * @tc.desc Verify sqrt(-Infinity) NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalSqrtPart01TestTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(-Infinity).sqrt();
      expect(d.toString()).assertEqual('NaN');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SQRT_PART01_SUPPLEMENT_TEST_1400
     * @tc.name testDecimalSqrtPart01TestTest014
     * @tc.desc Verify -1 sqrt NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalSqrtPart01TestTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(-1).sqrt();
      expect(d.toString()).assertEqual('NaN');
      expect(d.isNaN()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SQRT_PART01_SUPPLEMENT_TEST_1500
     * @tc.name testDecimalSqrtPart01TestTest015
     * @tc.desc Verify -0 sqrt valueOf '-0' isNegative true s -1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalSqrtPart01TestTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(-0).sqrt();
      expect(d.valueOf()).assertEqual('-0');
      expect(d.isNegative()).assertTrue();
      expect(d.isZero()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SQRT_PART01_SUPPLEMENT_TEST_1600
     * @tc.name testDecimalSqrtPart01TestTest016
     * @tc.desc Verify 0 sqrt valueOf '0' isNegative false s 1 -0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalSqrtPart01TestTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(0).sqrt();
      expect(d.valueOf()).assertEqual('0');
      expect(d.isNegative()).assertFalse();
      expect(d.s).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SQRT_PART01_SUPPLEMENT_TEST_1700
     * @tc.name testDecimalSqrtPart01TestTest017
     * @tc.desc Verify -0.0001 sqrt NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalSqrtPart01TestTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(-0.0001).sqrt();
      expect(d.toString()).assertEqual('NaN');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SQRT_PART01_SUPPLEMENT_TEST_1800
     * @tc.name testDecimalSqrtPart01TestTest018
     * @tc.desc Verify -Number.MAX_VALUE sqrt NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalSqrtPart01TestTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(-Number.MAX_VALUE).sqrt();
      expect(d.toString()).assertEqual('NaN');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SQRT_PART01_SUPPLEMENT_TEST_1900
     * @tc.name testDecimalSqrtPart01TestTest019
     * @tc.desc Verify -Number.MIN_VALUE -5e-324 sqrt NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalSqrtPart01TestTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(-Number.MIN_VALUE).sqrt();
      expect(d.toString()).assertEqual('NaN');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SQRT_PART01_SUPPLEMENT_TEST_2000
     * @tc.name testDecimalSqrtPart01TestTest020
     * @tc.desc Verify sqrt(Number.MAX_SAFE_INTEGER) 20 94906265.624251547621
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalSqrtPart01TestTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(Number.MAX_SAFE_INTEGER).sqrt();
      expect(d.toString()).assertEqual('94906265.624251547621');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SQRT_PART01_SUPPLEMENT_TEST_2100
     * @tc.name testDecimalSqrtPart01TestTest021
     * @tc.desc Verify sqrt(Number.MAX_VALUE) 1.3407807929942596325e+154
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalSqrtPart01TestTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(Number.MAX_VALUE).sqrt();
      expect(d.toString()).assertEqual('1.3407807929942596325e+154');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SQRT_PART01_SUPPLEMENT_TEST_2200
     * @tc.name testDecimalSqrtPart01TestTest022
     * @tc.desc Verify sqrt(Number.MIN_VALUE) 2.2360679774997896964e-162
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalSqrtPart01TestTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(Number.MIN_VALUE).sqrt();
      expect(d.toString()).assertEqual('2.2360679774997896964e-162');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SQRT_PART01_SUPPLEMENT_TEST_2300
     * @tc.name testDecimalSqrtPart01TestTest023
     * @tc.desc Verify sqrt(Number.EPSILON) 1.4901161193847655979e-8 2^-52
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalSqrtPart01TestTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(Number.EPSILON).sqrt();
      expect(d.toString()).assertEqual('1.4901161193847655979e-8');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SQRT_PART01_SUPPLEMENT_TEST_2400
     * @tc.name testDecimalSqrtPart01TestTest024
     * @tc.desc Verify sqrt(9e15) 94868329.80505137996
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalSqrtPart01TestTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(9e15).sqrt();
      expect(d.toString()).assertEqual('94868329.80505137996');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SQRT_PART01_SUPPLEMENT_TEST_2500
     * @tc.name testDecimalSqrtPart01TestTest025
     * @tc.desc Verify sqrt(-9e15) NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalSqrtPart01TestTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(-9e15).sqrt();
      expect(d.toString()).assertEqual('NaN');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SQRT_PART01_SUPPLEMENT_TEST_2600
     * @tc.name testDecimalSqrtPart01TestTest026
     * @tc.desc Verify sqrt(1e9) 31622.77660168379332
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalSqrtPart01TestTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(1e9).sqrt();
      expect(d.toString()).assertEqual('31622.77660168379332');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SQRT_PART01_SUPPLEMENT_TEST_2700
     * @tc.name testDecimalSqrtPart01TestTest027
     * @tc.desc Verify 0b101 5 sqrt 2.2360679774997896964
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalSqrtPart01TestTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(0b101).sqrt();
      expect(d.toString()).assertEqual('2.2360679774997896964');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SQRT_PART01_SUPPLEMENT_TEST_2800
     * @tc.name testDecimalSqrtPart01TestTest028
     * @tc.desc Verify 0o10 8 sqrt 2.8284271247461900976
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalSqrtPart01TestTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(0o10).sqrt();
      expect(d.toString()).assertEqual('2.8284271247461900976');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SQRT_PART01_SUPPLEMENT_TEST_2900
     * @tc.name testDecimalSqrtPart01TestTest029
     * @tc.desc Verify '0x10' 16 sqrt 4
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalSqrtPart01TestTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal('0x10').sqrt();
      expect(d.toString()).assertEqual('4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SQRT_PART01_SUPPLEMENT_TEST_3000
     * @tc.name testDecimalSqrtPart01TestTest030
     * @tc.desc Verify precision=1 sqrt(2) 1 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalSqrtPart01TestTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ precision: 1 });
      let d: Decimal = new Decimal(2).sqrt();
      expect(d.toString()).assertEqual('1');
      Decimal.set({ defaults: true });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SQRT_PART01_SUPPLEMENT_TEST_3100
     * @tc.name testDecimalSqrtPart01TestTest031
     * @tc.desc Verify precision=10 sqrt(2) 1.414213562 10
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalSqrtPart01TestTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ precision: 10 });
      let d: Decimal = new Decimal(2).sqrt();
      expect(d.toString()).assertEqual('1.414213562');
      Decimal.set({ defaults: true });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SQRT_PART01_SUPPLEMENT_TEST_3200
     * @tc.name testDecimalSqrtPart01TestTest032
     * @tc.desc Verify precision=100 sqrt(2) 100
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalSqrtPart01TestTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ precision: 100 });
      let d: Decimal = new Decimal(2).sqrt();
      expect(d.toString()).assertEqual('1.414213562373095048801688724209698078569671875376948073176679737990732478462107038850387534327641573');
      expect(d.d.length).assertEqual(16);
      Decimal.set({ defaults: true });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SQRT_PART01_SUPPLEMENT_TEST_3300
     * @tc.name testDecimalSqrtPart01TestTest033
     * @tc.desc Verify precision=1 sqrt('0.04') 0.2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalSqrtPart01TestTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ precision: 1 });
      let d: Decimal = new Decimal('0.04').sqrt();
      expect(d.toString()).assertEqual('0.2');
      Decimal.set({ defaults: true });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SQRT_PART01_SUPPLEMENT_TEST_3400
     * @tc.name testDecimalSqrtPart01TestTest034
     * @tc.desc Verify rounding=0 sqrt(2)@p5 1.4143
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalSqrtPart01TestTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ precision: 5, rounding: 0 });
      expect(new Decimal(2).sqrt().toString()).assertEqual('1.4143');
      Decimal.set({ defaults: true });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SQRT_PART01_SUPPLEMENT_TEST_3500
     * @tc.name testDecimalSqrtPart01TestTest035
     * @tc.desc Verify rounding=1 sqrt(2)@p5 1.4142
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalSqrtPart01TestTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ precision: 5, rounding: 1 });
      expect(new Decimal(2).sqrt().toString()).assertEqual('1.4142');
      Decimal.set({ defaults: true });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SQRT_PART01_SUPPLEMENT_TEST_3600
     * @tc.name testDecimalSqrtPart01TestTest036
     * @tc.desc Verify rounding=2 sqrt(2)@p5 1.4143
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalSqrtPart01TestTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ precision: 5, rounding: 2 });
      expect(new Decimal(2).sqrt().toString()).assertEqual('1.4143');
      Decimal.set({ defaults: true });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SQRT_PART01_SUPPLEMENT_TEST_3700
     * @tc.name testDecimalSqrtPart01TestTest037
     * @tc.desc Verify rounding=3 sqrt(2)@p5 1.4142
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalSqrtPart01TestTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ precision: 5, rounding: 3 });
      expect(new Decimal(2).sqrt().toString()).assertEqual('1.4142');
      Decimal.set({ defaults: true });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SQRT_PART01_SUPPLEMENT_TEST_3800
     * @tc.name testDecimalSqrtPart01TestTest038
     * @tc.desc Verify rounding=4 sqrt(2)@p5 1.4142
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalSqrtPart01TestTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ precision: 5, rounding: 4 });
      expect(new Decimal(2).sqrt().toString()).assertEqual('1.4142');
      Decimal.set({ defaults: true });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SQRT_PART01_SUPPLEMENT_TEST_3900
     * @tc.name testDecimalSqrtPart01TestTest039
     * @tc.desc Verify sqrt('1e21') 31622776601.68379332
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalSqrtPart01TestTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal('1e21').sqrt();
      expect(d.toString()).assertEqual('31622776601.68379332');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SQRT_PART01_SUPPLEMENT_TEST_4000
     * @tc.name testDecimalSqrtPart01TestTest040
     * @tc.desc Verify sqrt('-1e21') NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalSqrtPart01TestTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal('-1e21').sqrt();
      expect(d.toString()).assertEqual('NaN');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SQRT_PART01_SUPPLEMENT_TEST_4100
     * @tc.name testDecimalSqrtPart01TestTest041
     * @tc.desc Verify sqrt('1e+400') 1e+200 toNumber 1e200
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalSqrtPart01TestTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal('1e+400').sqrt();
      expect(d.toString()).assertEqual('1e+200');
      expect(d.toNumber()).assertEqual(1e200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SQRT_PART01_SUPPLEMENT_TEST_4200
     * @tc.name testDecimalSqrtPart01TestTest042
     * @tc.desc Verify sqrt('1e-400') 1e-200 toNumber 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalSqrtPart01TestTest042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal('1e-400').sqrt();
      expect(d.toString()).assertEqual('1e-200');
      expect(d.toNumber() > 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SQRT_PART01_SUPPLEMENT_TEST_4300
     * @tc.name testDecimalSqrtPart01TestTest043
     * @tc.desc Verify toExpPos=0 sqrt('1e21') toString 3.162277660168379332e+10
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalSqrtPart01TestTest043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ toExpPos: 0 });
      let d: Decimal = new Decimal('1e21').sqrt();
      expect(d.toString()).assertEqual('3.162277660168379332e+10');
      Decimal.set({ defaults: true });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SQRT_PART01_SUPPLEMENT_TEST_4400
     * @tc.name testDecimalSqrtPart01TestTest044
     * @tc.desc Verify number|string sqrt(-2.25) sqrt('-2.25') NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalSqrtPart01TestTest044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Decimal(-2.25).sqrt().toString()).assertEqual('NaN');
      expect(new Decimal('-2.25').sqrt().toString()).assertEqual('NaN');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SQRT_PART01_SUPPLEMENT_TEST_4500
     * @tc.name testDecimalSqrtPart01TestTest045
     * @tc.desc Verify number|Decimal sqrt(2.25) sqrt(new Decimal('2.25')) 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalSqrtPart01TestTest045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Decimal(2.25).sqrt().toString()).assertEqual('1.5');
      let dec: Decimal = new Decimal('2.25');
      expect(new Decimal(dec).sqrt().toString()).assertEqual('1.5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SQRT_PART01_SUPPLEMENT_TEST_4600
     * @tc.name testDecimalSqrtPart01TestTest046
     * @tc.desc Verify string|Decimal sqrt('2.25') sqrt(new Decimal(2.25)) 1.5
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalSqrtPart01TestTest046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Decimal('2.25').sqrt().toString()).assertEqual('1.5');
      let dec: Decimal = new Decimal(2.25);
      expect(new Decimal(dec).sqrt().toString()).assertEqual('1.5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SQRT_PART01_SUPPLEMENT_TEST_4700
     * @tc.name testDecimalSqrtPart01TestTest047
     * @tc.desc Verify number|null number sqrt 1.5 null 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalSqrtPart01TestTest047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: ESObject = 2.25;
      expect(new Decimal(v).sqrt().toString()).assertEqual('1.5');
      let n: ESObject = null;
      try {
        new Decimal(n);
        expect().assertFail();
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SQRT_PART01_SUPPLEMENT_TEST_4800
     * @tc.name testDecimalSqrtPart01TestTest048
     * @tc.desc Verify string|undefined string sqrt 1.5 undefined 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalSqrtPart01TestTest048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: ESObject = '2.25';
      expect(new Decimal(v).sqrt().toString()).assertEqual('1.5');
      let u: ESObject = undefined;
      try {
        new Decimal(u);
        expect().assertFail();
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SQRT_PART01_SUPPLEMENT_TEST_4900
     * @tc.name testDecimalSqrtPart01TestTest049
     * @tc.desc Verify number|undefined number sqrt 1.5 undefined 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalSqrtPart01TestTest049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: ESObject = 2.25;
      expect(new Decimal(v).sqrt().toString()).assertEqual('1.5');
      let u: ESObject = undefined;
      try {
        new Decimal(u);
        expect().assertFail();
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SQRT_PART01_SUPPLEMENT_TEST_5000
     * @tc.name testDecimalSqrtPart01TestTest050
     * @tc.desc Verify number|string|Decimal sqrt 1.5
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalSqrtPart01TestTest050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Decimal(2.25).sqrt().toString()).assertEqual('1.5');
      expect(new Decimal('2.25').sqrt().toString()).assertEqual('1.5');
      let dec: Decimal = new Decimal(2.25);
      expect(new Decimal(dec).sqrt().toString()).assertEqual('1.5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SQRT_PART01_SUPPLEMENT_TEST_5100
     * @tc.name testDecimalSqrtPart01TestTest051
     * @tc.desc Verify number|string|null sqrt 1.5 null 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalSqrtPart01TestTest051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Decimal(2.25).sqrt().toString()).assertEqual('1.5');
      expect(new Decimal('2.25').sqrt().toString()).assertEqual('1.5');
      let n: ESObject = null;
      try {
        new Decimal(n);
        expect().assertFail();
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SQRT_PART01_SUPPLEMENT_TEST_5200
     * @tc.name testDecimalSqrtPart01TestTest052
     * @tc.desc Verify number|string|undefined sqrt 1.5 undefined 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalSqrtPart01TestTest052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Decimal(2.25).sqrt().toString()).assertEqual('1.5');
      expect(new Decimal('2.25').sqrt().toString()).assertEqual('1.5');
      let u: ESObject = undefined;
      try {
        new Decimal(u);
        expect().assertFail();
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SQRT_PART01_SUPPLEMENT_TEST_5300
     * @tc.name testDecimalSqrtPart01TestTest053
     * @tc.desc Verify number|string|Decimal|null sqrt 1.5 null 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalSqrtPart01TestTest053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Decimal(2.25).sqrt().toString()).assertEqual('1.5');
      expect(new Decimal('2.25').sqrt().toString()).assertEqual('1.5');
      let dec: Decimal = new Decimal(2.25);
      expect(new Decimal(dec).sqrt().toString()).assertEqual('1.5');
      let n: ESObject = null;
      try {
        new Decimal(n);
        expect().assertFail();
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SQRT_PART01_SUPPLEMENT_TEST_5400
     * @tc.name testDecimalSqrtPart01TestTest054
     * @tc.desc Verify number|string|Decimal|undefined sqrt 1.5 undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalSqrtPart01TestTest054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Decimal(2.25).sqrt().toString()).assertEqual('1.5');
      expect(new Decimal('2.25').sqrt().toString()).assertEqual('1.5');
      let dec: Decimal = new Decimal(2.25);
      expect(new Decimal(dec).sqrt().toString()).assertEqual('1.5');
      let u: ESObject = undefined;
      try {
        new Decimal(u);
        expect().assertFail();
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SQRT_PART01_SUPPLEMENT_TEST_5500
     * @tc.name testDecimalSqrtPart01TestTest055
     * @tc.desc Verify number|string|Decimal|null|undefined sqrt 1.5 null u
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalSqrtPart01TestTest055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Decimal(2.25).sqrt().toString()).assertEqual('1.5');
      expect(new Decimal('2.25').sqrt().toString()).assertEqual('1.5');
      let dec: Decimal = new Decimal(2.25);
      expect(new Decimal(dec).sqrt().toString()).assertEqual('1.5');
      let n: ESObject = null;
      try {
        new Decimal(n);
        expect().assertFail();
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
      let u: ESObject = undefined;
      try {
        new Decimal(u);
        expect().assertFail();
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SQRT_PART01_SUPPLEMENT_TEST_5600
     * @tc.name testDecimalSqrtPart01TestTest056
     * @tc.desc Verify Decimal 2.25 sqrt
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalSqrtPart01TestTest056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Decimal = new Decimal('2.25');
      let b: Decimal = new Decimal(2.25);
      expect(a === b).assertFalse();
      expect(a.sqrt().toString()).assertEqual('1.5');
      expect(b.sqrt().toString()).assertEqual('1.5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SQRT_PART01_SUPPLEMENT_TEST_5700
     * @tc.name testDecimalSqrtPart01TestTest057
     * @tc.desc Verify Decimal sqrt 1.5 Date 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalSqrtPart01TestTest057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: ESObject = 2.25;
      expect(new Decimal(v).sqrt().toString()).assertEqual('1.5');
      let dt: ESObject = new Date();
      try {
        new Decimal(dt);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SQRT_PART01_SUPPLEMENT_TEST_5800
     * @tc.name testDecimalSqrtPart01TestTest058
     * @tc.desc Verify Array 401 number
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalSqrtPart01TestTest058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: ESObject = 2.25;
      expect(new Decimal(v).sqrt().toString()).assertEqual('1.5');
      let arr: ESObject = [1, 2];
      try {
        new Decimal(arr);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SQRT_PART01_SUPPLEMENT_TEST_5900
     * @tc.name testDecimalSqrtPart01TestTest059
     * @tc.desc Verify sqrt Decimal instanceof
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalSqrtPart01TestTest059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(16).sqrt();
      expect(d instanceof Decimal).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SQRT_PART01_SUPPLEMENT_TEST_6000
     * @tc.name testDecimalSqrtPart01TestTest060
     * @tc.desc Verify sqrt
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalSqrtPart01TestTest060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Decimal = new Decimal(16);
      let res: Decimal = src.sqrt();
      expect(res === src).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SQRT_PART01_SUPPLEMENT_TEST_6100
     * @tc.name testDecimalSqrtPart01TestTest061
     * @tc.desc Verify sqrt
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalSqrtPart01TestTest061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Decimal = new Decimal(16);
      src.sqrt();
      expect(src.toString()).assertEqual('16');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SQRT_PART01_SUPPLEMENT_TEST_6200
     * @tc.name testDecimalSqrtPart01TestTest062
     * @tc.desc Verify sqrt('0.25') d/e/s d 1 e -1 s 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalSqrtPart01TestTest062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal('0.25').sqrt();
      expect(d.d.length).assertEqual(1);
      expect(d.e).assertEqual(-1);
      expect(d.s).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SQRT_PART01_SUPPLEMENT_TEST_6300
     * @tc.name testDecimalSqrtPart01TestTest063
     * @tc.desc Verify sqrt(2) d precision 20 e 0 s 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalSqrtPart01TestTest063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(2).sqrt();
      expect(d.d.length).assertEqual(4);
      expect(d.e).assertEqual(0);
      expect(d.s).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SQRT_PART01_SUPPLEMENT_TEST_6400
     * @tc.name testDecimalSqrtPart01TestTest064
     * @tc.desc Verify sqrt(-0) s -1 d [0]
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalSqrtPart01TestTest064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(-0).sqrt();
      expect(d.s).assertEqual(-1);
      expect(d.d.length).assertEqual(1);
      expect(d.d[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SQRT_PART01_SUPPLEMENT_TEST_6500
     * @tc.name testDecimalSqrtPart01TestTest065
     * @tc.desc Verify sqrt toString toNumber sqrt('0.25') '0.5' / 0.5
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalSqrtPart01TestTest065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal('0.25').sqrt();
      expect(d.toString()).assertEqual('0.5');
      expect(d.toNumber()).assertEqual(0.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SQRT_PART01_SUPPLEMENT_TEST_6600
     * @tc.name testDecimalSqrtPart01TestTest066
     * @tc.desc Verify sqrt sqrt('1.21') 1.21
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalSqrtPart01TestTest066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = new Decimal('1.21').sqrt();
      let back: Decimal = r.mul(r);
      expect(back.toString()).assertEqual('1.21');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SQRT_PART01_SUPPLEMENT_TEST_6700
     * @tc.name testDecimalSqrtPart01TestTest067
     * @tc.desc Verify sqrt sqrt('2.25').add(1) 2.5
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalSqrtPart01TestTest067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal('2.25').sqrt().add(1);
      expect(d.toString()).assertEqual('2.5');
    });


  });

}
