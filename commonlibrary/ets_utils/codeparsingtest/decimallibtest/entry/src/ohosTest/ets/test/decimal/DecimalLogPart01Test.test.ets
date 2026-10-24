
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

export default function decimalLogPart01TestTest() {
  describe('DecimalLogPart01TestTest', () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LOG_PART01_SUPPLEMENT_TEST_0100
     * @tc.name testDecimalLogPart01TestTest001
     * @tc.desc Verify arity=1 number
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLogPart01TestTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d: Decimal = new Decimal(100);
      const r: Decimal = d.log(10);
      expect(r.toString()).assertEqual('2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LOG_PART01_SUPPLEMENT_TEST_0200
     * @tc.name testDecimalLogPart01TestTest002
     * @tc.desc Verify undefined undefined Value 401 [device does not throw, expected error pending SDK alignment]
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLogPart01TestTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const r: Decimal = new Decimal(2).log(undefined as ESObject);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LOG_PART01_SUPPLEMENT_TEST_0300
     * @tc.name testDecimalLogPart01TestTest003
     * @tc.desc Verify null null Value 401 undefined [device does not throw, expected error pending SDK alignment]
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLogPart01TestTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const r: Decimal = new Decimal(2).log(null as ESObject);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LOG_PART01_SUPPLEMENT_TEST_0400
     * @tc.name testDecimalLogPart01TestTest004
     * @tc.desc Verify 2 arity=2 JS
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLogPart01TestTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const extra: ESObject[] = [999];
        const r: Decimal = new Decimal(2).log('10');
      expect(r.toString()).assertEqual('0.30102999566398119521');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LOG_PART01_SUPPLEMENT_TEST_0500
     * @tc.name testDecimalLogPart01TestTest005
     * @tc.desc Verify number 2 8 3
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLogPart01TestTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = new Decimal(8).log(2);
      expect(r.toString()).assertEqual('3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LOG_PART01_SUPPLEMENT_TEST_0600
     * @tc.name testDecimalLogPart01TestTest006
     * @tc.desc Verify 256 2 '0.125'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLogPart01TestTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = new Decimal(2).log(256);
      expect(r.toString()).assertEqual('0.125');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LOG_PART01_SUPPLEMENT_TEST_0700
     * @tc.name testDecimalLogPart01TestTest007
     * @tc.desc Verify 3 81 4
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLogPart01TestTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = new Decimal(81).log(3);
      expect(r.toString()).assertEqual('4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LOG_PART01_SUPPLEMENT_TEST_0800
     * @tc.name testDecimalLogPart01TestTest008
     * @tc.desc Verify 4 16 2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLogPart01TestTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = new Decimal(16).log(4);
      expect(r.toString()).assertEqual('2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LOG_PART01_SUPPLEMENT_TEST_0900
     * @tc.name testDecimalLogPart01TestTest009
     * @tc.desc Verify 6 36 2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLogPart01TestTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = new Decimal(36).log(6);
      expect(r.toString()).assertEqual('2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LOG_PART01_SUPPLEMENT_TEST_1000
     * @tc.name testDecimalLogPart01TestTest010
     * @tc.desc Verify 10 1e10 number 10
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLogPart01TestTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = new Decimal(1e10).log(10);
      expect(r.toString()).assertEqual('10');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LOG_PART01_SUPPLEMENT_TEST_1100
     * @tc.name testDecimalLogPart01TestTest011
     * @tc.desc Verify 1e5 1e10 10/5 2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLogPart01TestTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = new Decimal(1e10).log(1e5);
      expect(r.toString()).assertEqual('2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LOG_PART01_SUPPLEMENT_TEST_1200
     * @tc.name testDecimalLogPart01TestTest012
     * @tc.desc Verify 1e2 10000 2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLogPart01TestTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = new Decimal(10000).log(1e2);
      expect(r.toString()).assertEqual('2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LOG_PART01_SUPPLEMENT_TEST_1300
     * @tc.name testDecimalLogPart01TestTest013
     * @tc.desc Verify 1e-9 1e-9 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLogPart01TestTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = new Decimal(1e-9).log(1e-9);
      expect(r.toString()).assertEqual('1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LOG_PART01_SUPPLEMENT_TEST_1400
     * @tc.name testDecimalLogPart01TestTest014
     * @tc.desc Verify 0.5 2 ln2/(-ln2) -1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLogPart01TestTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = new Decimal(2).log(0.5);
      expect(r.toString()).assertEqual('-1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LOG_PART01_SUPPLEMENT_TEST_1500
     * @tc.name testDecimalLogPart01TestTest015
     * @tc.desc Verify 0.5 0.25 2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLogPart01TestTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = new Decimal(0.25).log(0.5);
      expect(r.toString()).assertEqual('2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LOG_PART01_SUPPLEMENT_TEST_1600
     * @tc.name testDecimalLogPart01TestTest016
     * @tc.desc Verify 2.5 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLogPart01TestTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = new Decimal(2.5).log(2.5);
      expect(r.toString()).assertEqual('1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LOG_PART01_SUPPLEMENT_TEST_1700
     * @tc.name testDecimalLogPart01TestTest017
     * @tc.desc Verify 0x10(=16) 4 0.5
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLogPart01TestTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = new Decimal(4).log(0x10);
      expect(r.toString()).assertEqual('0.5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LOG_PART01_SUPPLEMENT_TEST_1800
     * @tc.name testDecimalLogPart01TestTest018
     * @tc.desc Verify 0o10(=8) 2 1/3
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLogPart01TestTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = new Decimal(2).log(0o10);
      expect(r.toFixed(4)).assertEqual('0.3333');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LOG_PART01_SUPPLEMENT_TEST_1900
     * @tc.name testDecimalLogPart01TestTest019
     * @tc.desc Verify 0b100(=4) 16 2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLogPart01TestTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = new Decimal(16).log(0b100);
      expect(r.toString()).assertEqual('2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LOG_PART01_SUPPLEMENT_TEST_2000
     * @tc.name testDecimalLogPart01TestTest020
     * @tc.desc Verify 42 log_x(x)=1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLogPart01TestTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = new Decimal(42).log(42);
      expect(r.toString()).assertEqual('1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LOG_PART01_SUPPLEMENT_TEST_2100
     * @tc.name testDecimalLogPart01TestTest021
     * @tc.desc Verify = Number.MAX_VALUE 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLogPart01TestTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = new Decimal(Number.MAX_VALUE).log(Number.MAX_VALUE);
      expect(r.toString()).assertEqual('1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LOG_PART01_SUPPLEMENT_TEST_2200
     * @tc.name testDecimalLogPart01TestTest022
     * @tc.desc Verify = Number.MAX_VALUE = 1 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLogPart01TestTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = new Decimal(1).log(Number.MAX_VALUE);
      expect(r.toString()).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LOG_PART01_SUPPLEMENT_TEST_2300
     * @tc.name testDecimalLogPart01TestTest023
     * @tc.desc Verify = Number.MIN_VALUE = 1 0 isZero -0/0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLogPart01TestTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = new Decimal(1).log(Number.MIN_VALUE);
      expect(r.isZero()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LOG_PART01_SUPPLEMENT_TEST_2400
     * @tc.name testDecimalLogPart01TestTest024
     * @tc.desc Verify 1e308 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLogPart01TestTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = new Decimal(1e308).log(1e308);
      expect(r.toString()).assertEqual('1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LOG_PART01_SUPPLEMENT_TEST_2500
     * @tc.name testDecimalLogPart01TestTest025
     * @tc.desc Verify 1e9 1 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLogPart01TestTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = new Decimal(1).log(1e9);
      expect(r.toString()).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LOG_PART01_SUPPLEMENT_TEST_2600
     * @tc.name testDecimalLogPart01TestTest026
     * @tc.desc Verify 1.1 2 7.273
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLogPart01TestTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = new Decimal(2).log(1.1);
      expect(r.toFixed(3)).assertEqual('7.273');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LOG_PART01_SUPPLEMENT_TEST_2700
     * @tc.name testDecimalLogPart01TestTest027
     * @tc.desc Verify NaN NaN isNaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLogPart01TestTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = new Decimal(2).log(NaN);
      expect(r.isNaN()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LOG_PART01_SUPPLEMENT_TEST_2800
     * @tc.name testDecimalLogPart01TestTest028
     * @tc.desc Verify Infinity Inf/Inf NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLogPart01TestTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = new Decimal(Infinity).log(Infinity);
      expect(r.isNaN()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LOG_PART01_SUPPLEMENT_TEST_2900
     * @tc.name testDecimalLogPart01TestTest029
     * @tc.desc Verify -Infinity ln(-Inf) NaN NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLogPart01TestTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = new Decimal(2).log(-Infinity);
      expect(r.isNaN()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LOG_PART01_SUPPLEMENT_TEST_3000
     * @tc.name testDecimalLogPart01TestTest030
     * @tc.desc Verify -5 ln(-5) NaN NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLogPart01TestTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = new Decimal(8).log(-5);
      expect(r.isNaN()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LOG_PART01_SUPPLEMENT_TEST_3100
     * @tc.name testDecimalLogPart01TestTest031
     * @tc.desc Verify -0 0 NaN -0 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLogPart01TestTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r1: Decimal = new Decimal(2).log(-0);
      const r2: Decimal = new Decimal(2).log(0);
      expect(r1.isNaN()).assertEqual(r2.isNaN());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LOG_PART01_SUPPLEMENT_TEST_3200
     * @tc.name testDecimalLogPart01TestTest032
     * @tc.desc Verify 1 2 Infinity NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLogPart01TestTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = new Decimal(2).log(1);
      expect(r.isNaN()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LOG_PART01_SUPPLEMENT_TEST_3300
     * @tc.name testDecimalLogPart01TestTest033
     * @tc.desc Verify 1 1 0/0 NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLogPart01TestTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = new Decimal(1).log(1);
      expect(r.isNaN()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LOG_PART01_SUPPLEMENT_TEST_3400
     * @tc.name testDecimalLogPart01TestTest034
     * @tc.desc Verify 1 0.5 0<x<1 -Infinity NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLogPart01TestTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = new Decimal(0.5).log(1);
      expect(r.isNaN()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LOG_PART01_SUPPLEMENT_TEST_3500
     * @tc.name testDecimalLogPart01TestTest035
     * @tc.desc Verify 1 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLogPart01TestTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = new Decimal(1).log(10);
      expect(r.toString()).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LOG_PART01_SUPPLEMENT_TEST_3600
     * @tc.name testDecimalLogPart01TestTest036
     * @tc.desc Verify 4 2 2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLogPart01TestTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = new Decimal(4).log(2);
      expect(r.toString()).assertEqual('2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LOG_PART01_SUPPLEMENT_TEST_3700
     * @tc.name testDecimalLogPart01TestTest037
     * @tc.desc Verify 16 2 4
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLogPart01TestTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = new Decimal(16).log(2);
      expect(r.toString()).assertEqual('4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LOG_PART01_SUPPLEMENT_TEST_3800
     * @tc.name testDecimalLogPart01TestTest038
     * @tc.desc Verify 32 2 5
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLogPart01TestTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = new Decimal(32).log(2);
      expect(r.toString()).assertEqual('5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LOG_PART01_SUPPLEMENT_TEST_3900
     * @tc.name testDecimalLogPart01TestTest039
     * @tc.desc Verify 0.5 2 -1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLogPart01TestTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = new Decimal(0.5).log(2);
      expect(r.toString()).assertEqual('-1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LOG_PART01_SUPPLEMENT_TEST_4000
     * @tc.name testDecimalLogPart01TestTest040
     * @tc.desc Verify 0.25 2 -2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLogPart01TestTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = new Decimal(0.25).log(2);
      expect(r.toString()).assertEqual('-2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LOG_PART01_SUPPLEMENT_TEST_4100
     * @tc.name testDecimalLogPart01TestTest041
     * @tc.desc Verify 0.001 10 -3
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLogPart01TestTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = new Decimal(0.001).log(10);
      expect(r.toString()).assertEqual('-3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LOG_PART01_SUPPLEMENT_TEST_4200
     * @tc.name testDecimalLogPart01TestTest042
     * @tc.desc Verify 1e-7 10 -7
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLogPart01TestTest042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = new Decimal(1e-7).log(10);
      expect(r.toString()).assertEqual('-7');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LOG_PART01_SUPPLEMENT_TEST_4300
     * @tc.name testDecimalLogPart01TestTest043
     * @tc.desc Verify 1e8 10 8
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLogPart01TestTest043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = new Decimal(1e8).log(10);
      expect(r.toString()).assertEqual('8');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LOG_PART01_SUPPLEMENT_TEST_4400
     * @tc.name testDecimalLogPart01TestTest044
     * @tc.desc Verify = Number.MAX_SAFE_INTEGER 10
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLogPart01TestTest044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = new Decimal(Number.MAX_SAFE_INTEGER).log(10);
      expect(r.toFixed(8)).assertEqual('15.95458977');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LOG_PART01_SUPPLEMENT_TEST_4500
     * @tc.name testDecimalLogPart01TestTest045
     * @tc.desc Verify 1e21 10 21
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLogPart01TestTest045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = new Decimal(1e21).log(10);
      expect(r.toString()).assertEqual('21');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LOG_PART01_SUPPLEMENT_TEST_4600
     * @tc.name testDecimalLogPart01TestTest046
     * @tc.desc Verify = Number.MAX_VALUE 10 308.25471556
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLogPart01TestTest046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = new Decimal(Number.MAX_VALUE).log(10);
      expect(r.toFixed(8)).assertEqual('308.25471556');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LOG_PART01_SUPPLEMENT_TEST_4700
     * @tc.name testDecimalLogPart01TestTest047
     * @tc.desc Verify = Number.MIN_VALUE 10 -323.301030
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLogPart01TestTest047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = new Decimal(Number.MIN_VALUE).log(10);
      expect(r.toFixed(6)).assertEqual('-323.301030');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LOG_PART01_SUPPLEMENT_TEST_4800
     * @tc.name testDecimalLogPart01TestTest048
     * @tc.desc Verify = Number.EPSILON 10 -15.653560
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLogPart01TestTest048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = new Decimal(Number.EPSILON).log(10);
      expect(r.toFixed(6)).assertEqual('-15.653560');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LOG_PART01_SUPPLEMENT_TEST_4900
     * @tc.name testDecimalLogPart01TestTest049
     * @tc.desc Verify 9e15 10 15.954243
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLogPart01TestTest049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = new Decimal(9e15).log(10);
      expect(r.toFixed(6)).assertEqual('15.954243');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LOG_PART01_SUPPLEMENT_TEST_5000
     * @tc.name testDecimalLogPart01TestTest050
     * @tc.desc Verify 123.456 10 2.091512
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLogPart01TestTest050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = new Decimal(123.456).log(10);
      expect(r.toFixed(6)).assertEqual('2.091512');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LOG_PART01_SUPPLEMENT_TEST_5100
     * @tc.name testDecimalLogPart01TestTest051
     * @tc.desc Verify 7 2 2.807
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLogPart01TestTest051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = new Decimal(7).log(2);
      expect(r.toFixed(3)).assertEqual('2.807');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LOG_PART01_SUPPLEMENT_TEST_5200
     * @tc.name testDecimalLogPart01TestTest052
     * @tc.desc Verify NaN NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLogPart01TestTest052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = new Decimal(NaN).log(10);
      expect(r.isNaN()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LOG_PART01_SUPPLEMENT_TEST_5300
     * @tc.name testDecimalLogPart01TestTest053
     * @tc.desc Verify +Infinity 10 +Infinity NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLogPart01TestTest053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = new Decimal(Infinity).log(10);
      expect(r.isFinite()).assertFalse();
      expect(r.isNaN()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LOG_PART01_SUPPLEMENT_TEST_5400
     * @tc.name testDecimalLogPart01TestTest054
     * @tc.desc Verify -Infinity 10 NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLogPart01TestTest054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = new Decimal(-Infinity).log(10);
      expect(r.isNaN()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LOG_PART01_SUPPLEMENT_TEST_5500
     * @tc.name testDecimalLogPart01TestTest055
     * @tc.desc Verify -5 ln(-5) NaN NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLogPart01TestTest055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = new Decimal(-5).log(10);
      expect(r.isNaN()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LOG_PART01_SUPPLEMENT_TEST_5600
     * @tc.name testDecimalLogPart01TestTest056
     * @tc.desc Verify -0 0 -0 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLogPart01TestTest056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r1: Decimal = new Decimal(-0).log(10);
      const r2: Decimal = new Decimal(0).log(10);
      expect(r1.isFinite()).assertEqual(r2.isFinite());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LOG_PART01_SUPPLEMENT_TEST_5700
     * @tc.name testDecimalLogPart01TestTest057
     * @tc.desc Verify 0 10 ln(0)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLogPart01TestTest057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = new Decimal(0).log(10);
      expect(r.isFinite()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LOG_PART01_SUPPLEMENT_TEST_5800
     * @tc.name testDecimalLogPart01TestTest058
     * @tc.desc Verify Decimal number
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLogPart01TestTest058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = new Decimal(8).log(2);
      expect(r instanceof Decimal).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LOG_PART01_SUPPLEMENT_TEST_5900
     * @tc.name testDecimalLogPart01TestTest059
     * @tc.desc Verify log
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLogPart01TestTest059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d: Decimal = new Decimal(2);
      d.log(10);
      expect(d.toString()).assertEqual('2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LOG_PART01_SUPPLEMENT_TEST_6000
     * @tc.name testDecimalLogPart01TestTest060
     * @tc.desc Verify 0.30103000
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLogPart01TestTest060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = new Decimal(2).log(10);
      expect(r.toFixed(8)).assertEqual('0.30103000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LOG_PART01_SUPPLEMENT_TEST_6100
     * @tc.name testDecimalLogPart01TestTest061
     * @tc.desc Verify 1 toNumber -1 isNegative true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLogPart01TestTest061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = new Decimal(0.1).log(10);
      expect(r.toNumber()).assertEqual(-1);
      expect(r.isNegative()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LOG_PART01_SUPPLEMENT_TEST_6200
     * @tc.name testDecimalLogPart01TestTest062
     * @tc.desc Verify 1 toNumber 2 isPositive true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLogPart01TestTest062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = new Decimal(100).log(10);
      expect(r.toNumber()).assertEqual(2);
      expect(r.isPositive()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LOG_PART01_SUPPLEMENT_TEST_6300
     * @tc.name testDecimalLogPart01TestTest063
     * @tc.desc Verify 1 0 isZero true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLogPart01TestTest063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = new Decimal(1).log(10);
      expect(r.isZero()).assertTrue();
      expect(r.isNegative()).assertFalse();
      expect(r.isPositive()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LOG_PART01_SUPPLEMENT_TEST_6400
     * @tc.name testDecimalLogPart01TestTest064
     * @tc.desc Verify boolean true Value 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLogPart01TestTest064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const r: Decimal = new Decimal(2).log(true as ESObject);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LOG_PART01_SUPPLEMENT_TEST_6500
     * @tc.name testDecimalLogPart01TestTest065
     * @tc.desc Verify {} Value / 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLogPart01TestTest065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const r: Decimal = new Decimal(2).log({} as ESObject);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LOG_PART01_SUPPLEMENT_TEST_6600
     * @tc.name testDecimalLogPart01TestTest066
     * @tc.desc Verify [] Value 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLogPart01TestTest066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const r: Decimal = new Decimal(2).log([] as ESObject);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LOG_PART01_SUPPLEMENT_TEST_6700
     * @tc.name testDecimalLogPart01TestTest067
     * @tc.desc Verify '1e+9000000000000000' log(2) 10200060 [pending SDK perf fix]
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLogPart01TestTest067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const r: Decimal = new Decimal('1e+9000000000000000').log(2);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(10200060);
      }
    });


  });

}
