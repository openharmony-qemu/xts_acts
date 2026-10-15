
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

export default function decimalLessThanPart01TestTest() {
  describe('DecimalLessThanPart01TestTest', () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_PART01_SUPPLEMENT_TEST_0100
     * @tc.name testDecimalLessThanPart01TestTest001
     * @tc.desc Verify 0 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanPart01TestTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        (new Decimal(6) as ESObject).lessThan();
      } catch (e) {
        expect((e as ESObject).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_PART01_SUPPLEMENT_TEST_0200
     * @tc.name testDecimalLessThanPart01TestTest002
     * @tc.desc Verify null 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanPart01TestTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        (new Decimal(6) as ESObject).lessThan(null as ESObject);
      } catch (e) {
        expect((e as ESObject).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_PART01_SUPPLEMENT_TEST_0300
     * @tc.name testDecimalLessThanPart01TestTest003
     * @tc.desc Verify undefined 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanPart01TestTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        (new Decimal(6) as ESObject).lessThan(undefined as ESObject);
      } catch (e) {
        expect((e as ESObject).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_PART01_SUPPLEMENT_TEST_0400
     * @tc.name testDecimalLessThanPart01TestTest004
     * @tc.desc Verify number JS
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanPart01TestTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d: ESObject = new Decimal(4);
      expect(d.lessThan(5, 100)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_PART01_SUPPLEMENT_TEST_0500
     * @tc.name testDecimalLessThanPart01TestTest005
     * @tc.desc Verify undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanPart01TestTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d: ESObject = new Decimal(4);
      expect(d.lessThan(5, undefined)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_PART01_SUPPLEMENT_TEST_0600
     * @tc.name testDecimalLessThanPart01TestTest006
     * @tc.desc Verify null
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanPart01TestTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d: ESObject = new Decimal(4);
      expect(d.lessThan(5, null)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_PART01_SUPPLEMENT_TEST_0700
     * @tc.name testDecimalLessThanPart01TestTest007
     * @tc.desc Verify 1 number false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanPart01TestTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Decimal(6);
      expect(d.lessThan(6)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_PART01_SUPPLEMENT_TEST_0800
     * @tc.name testDecimalLessThanPart01TestTest008
     * @tc.desc Verify true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanPart01TestTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Decimal(4);
      expect(d.lessThan(5)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_PART01_SUPPLEMENT_TEST_0900
     * @tc.name testDecimalLessThanPart01TestTest009
     * @tc.desc Verify false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanPart01TestTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Decimal(4);
      expect(d.lessThan(4)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_PART01_SUPPLEMENT_TEST_1000
     * @tc.name testDecimalLessThanPart01TestTest010
     * @tc.desc Verify true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanPart01TestTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Decimal(-6);
      expect(d.lessThan(-5)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_PART01_SUPPLEMENT_TEST_1100
     * @tc.name testDecimalLessThanPart01TestTest011
     * @tc.desc Verify false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanPart01TestTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Decimal(-6);
      expect(d.lessThan(-6)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_PART01_SUPPLEMENT_TEST_1200
     * @tc.name testDecimalLessThanPart01TestTest012
     * @tc.desc Verify true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanPart01TestTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Decimal(0.4);
      expect(d.lessThan(0.5)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_PART01_SUPPLEMENT_TEST_1300
     * @tc.name testDecimalLessThanPart01TestTest013
     * @tc.desc Verify false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanPart01TestTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Decimal(0.4);
      expect(d.lessThan(0.4)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_PART01_SUPPLEMENT_TEST_1400
     * @tc.name testDecimalLessThanPart01TestTest014
     * @tc.desc Verify true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanPart01TestTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Decimal(-0.6);
      expect(d.lessThan(-0.5)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_PART01_SUPPLEMENT_TEST_1500
     * @tc.name testDecimalLessThanPart01TestTest015
     * @tc.desc Verify 0 1 true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanPart01TestTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Decimal(0);
      expect(d.lessThan(1)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_PART01_SUPPLEMENT_TEST_1600
     * @tc.name testDecimalLessThanPart01TestTest016
     * @tc.desc Verify true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanPart01TestTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Decimal(-1);
      expect(d.lessThan(0)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_PART01_SUPPLEMENT_TEST_1700
     * @tc.name testDecimalLessThanPart01TestTest017
     * @tc.desc Verify -0 0 false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanPart01TestTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Decimal(-0);
      expect(d.lessThan(0)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_PART01_SUPPLEMENT_TEST_1800
     * @tc.name testDecimalLessThanPart01TestTest018
     * @tc.desc Verify 0 -0 false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanPart01TestTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Decimal(0);
      expect(d.lessThan(-0)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_PART01_SUPPLEMENT_TEST_1900
     * @tc.name testDecimalLessThanPart01TestTest019
     * @tc.desc Verify -0 1 true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanPart01TestTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Decimal(-0);
      expect(d.lessThan(1)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_PART01_SUPPLEMENT_TEST_2000
     * @tc.name testDecimalLessThanPart01TestTest020
     * @tc.desc Verify -1 -0 true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanPart01TestTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Decimal(-1);
      expect(d.lessThan(-0)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_PART01_SUPPLEMENT_TEST_2100
     * @tc.name testDecimalLessThanPart01TestTest021
     * @tc.desc Verify 1 1.0 1 1.0 false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanPart01TestTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Decimal(1);
      expect(d.lessThan(1.0)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_PART01_SUPPLEMENT_TEST_2200
     * @tc.name testDecimalLessThanPart01TestTest022
     * @tc.desc Verify 1.0 1 false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanPart01TestTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Decimal(1.0);
      expect(d.lessThan(1)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_PART01_SUPPLEMENT_TEST_2300
     * @tc.name testDecimalLessThanPart01TestTest023
     * @tc.desc Verify 1 1.5 true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanPart01TestTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Decimal(1);
      expect(d.lessThan(1.5)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_PART01_SUPPLEMENT_TEST_2400
     * @tc.name testDecimalLessThanPart01TestTest024
     * @tc.desc Verify 1e3 1e4 true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanPart01TestTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Decimal(1e3);
      expect(d.lessThan(1e4)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_PART01_SUPPLEMENT_TEST_2500
     * @tc.name testDecimalLessThanPart01TestTest025
     * @tc.desc Verify 1e-7 1e-6 true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanPart01TestTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Decimal(1e-7);
      expect(d.lessThan(1e-6)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_PART01_SUPPLEMENT_TEST_2600
     * @tc.name testDecimalLessThanPart01TestTest026
     * @tc.desc Verify 1e-8 0 false 1e-8
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanPart01TestTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Decimal(1e-8);
      expect(d.lessThan(0)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_PART01_SUPPLEMENT_TEST_2700
     * @tc.name testDecimalLessThanPart01TestTest027
     * @tc.desc Verify 1e21 1e22 true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanPart01TestTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Decimal(1e21);
      expect(d.lessThan(1e22)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_PART01_SUPPLEMENT_TEST_2800
     * @tc.name testDecimalLessThanPart01TestTest028
     * @tc.desc Verify 12345 1.2345e4 false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanPart01TestTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Decimal(12345);
      expect(d.lessThan(1.2345e4)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_PART01_SUPPLEMENT_TEST_2900
     * @tc.name testDecimalLessThanPart01TestTest029
     * @tc.desc Verify 0x10 17 true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanPart01TestTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Decimal(0x10);
      expect(d.lessThan(17)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_PART01_SUPPLEMENT_TEST_3000
     * @tc.name testDecimalLessThanPart01TestTest030
     * @tc.desc Verify 0b11 4 true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanPart01TestTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Decimal(0b11);
      expect(d.lessThan(4)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_PART01_SUPPLEMENT_TEST_3100
     * @tc.name testDecimalLessThanPart01TestTest031
     * @tc.desc Verify 0o10 9 true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanPart01TestTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Decimal(0o10);
      expect(d.lessThan(9)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_PART01_SUPPLEMENT_TEST_3200
     * @tc.name testDecimalLessThanPart01TestTest032
     * @tc.desc Verify MAX_SAFE_INTEGER false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanPart01TestTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Decimal(Number.MAX_SAFE_INTEGER);
      expect(d.lessThan(Number.MAX_SAFE_INTEGER)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_PART01_SUPPLEMENT_TEST_3300
     * @tc.name testDecimalLessThanPart01TestTest033
     * @tc.desc Verify MAX_SAFE_INTEGER 2^53 MAX_SAFE+1 true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanPart01TestTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Decimal(Number.MAX_SAFE_INTEGER);
      expect(d.lessThan(Number.MAX_SAFE_INTEGER + 1)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_PART01_SUPPLEMENT_TEST_3400
     * @tc.name testDecimalLessThanPart01TestTest034
     * @tc.desc Verify MAX_SAFE_INTEGER false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanPart01TestTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Decimal(Number.MAX_SAFE_INTEGER);
      expect(d.lessThan(Number.MAX_SAFE_INTEGER - 1)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_PART01_SUPPLEMENT_TEST_3500
     * @tc.name testDecimalLessThanPart01TestTest035
     * @tc.desc Verify MIN_SAFE_INTEGER false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanPart01TestTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Decimal(Number.MIN_SAFE_INTEGER);
      expect(d.lessThan(Number.MIN_SAFE_INTEGER)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_PART01_SUPPLEMENT_TEST_3600
     * @tc.name testDecimalLessThanPart01TestTest036
     * @tc.desc Verify MIN_SAFE_INTEGER true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanPart01TestTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Decimal(Number.MIN_SAFE_INTEGER);
      expect(d.lessThan(Number.MIN_SAFE_INTEGER + 1)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_PART01_SUPPLEMENT_TEST_3700
     * @tc.name testDecimalLessThanPart01TestTest037
     * @tc.desc Verify MAX_SAFE_INTEGER MIN_SAFE_INTEGER false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanPart01TestTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Decimal(Number.MAX_SAFE_INTEGER);
      expect(d.lessThan(Number.MIN_SAFE_INTEGER)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_PART01_SUPPLEMENT_TEST_3800
     * @tc.name testDecimalLessThanPart01TestTest038
     * @tc.desc Verify 9e15 false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanPart01TestTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Decimal(9e15);
      expect(d.lessThan(9e15)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_PART01_SUPPLEMENT_TEST_3900
     * @tc.name testDecimalLessThanPart01TestTest039
     * @tc.desc Verify 9e15 9e15+1 true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanPart01TestTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Decimal(9e15);
      expect(d.lessThan(9e15 + 1)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_PART01_SUPPLEMENT_TEST_4000
     * @tc.name testDecimalLessThanPart01TestTest040
     * @tc.desc Verify -9e15 false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanPart01TestTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Decimal(-9e15);
      expect(d.lessThan(-9e15)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_PART01_SUPPLEMENT_TEST_4100
     * @tc.name testDecimalLessThanPart01TestTest041
     * @tc.desc Verify -9e15 -9e15+1 true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanPart01TestTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Decimal(-9e15);
      expect(d.lessThan(-9e15 + 1)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_PART01_SUPPLEMENT_TEST_4200
     * @tc.name testDecimalLessThanPart01TestTest042
     * @tc.desc Verify Number.MAX_VALUE false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanPart01TestTest042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Decimal(Number.MAX_VALUE);
      expect(d.lessThan(Number.MAX_VALUE)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_PART01_SUPPLEMENT_TEST_4300
     * @tc.name testDecimalLessThanPart01TestTest043
     * @tc.desc Verify Number.MAX_VALUE false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanPart01TestTest043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Decimal(Number.MAX_VALUE);
      expect(d.lessThan(Number.MAX_VALUE / 2)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_PART01_SUPPLEMENT_TEST_4400
     * @tc.name testDecimalLessThanPart01TestTest044
     * @tc.desc Verify Number.MIN_VALUE 0 false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanPart01TestTest044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Decimal(Number.MIN_VALUE);
      expect(d.lessThan(0)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_PART01_SUPPLEMENT_TEST_4500
     * @tc.name testDecimalLessThanPart01TestTest045
     * @tc.desc Verify 0 Number.MIN_VALUE true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanPart01TestTest045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Decimal(0);
      expect(d.lessThan(Number.MIN_VALUE)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_PART01_SUPPLEMENT_TEST_4600
     * @tc.name testDecimalLessThanPart01TestTest046
     * @tc.desc Verify Number.EPSILON 1 true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanPart01TestTest046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Decimal(Number.EPSILON);
      expect(d.lessThan(1)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_PART01_SUPPLEMENT_TEST_4700
     * @tc.name testDecimalLessThanPart01TestTest047
     * @tc.desc Verify 1 1+EPSILON true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanPart01TestTest047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Decimal(1);
      expect(d.lessThan(1 + Number.EPSILON)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_PART01_SUPPLEMENT_TEST_4800
     * @tc.name testDecimalLessThanPart01TestTest048
     * @tc.desc Verify 1-EPSILON 1 true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanPart01TestTest048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Decimal(1 - Number.EPSILON);
      expect(d.lessThan(1)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_PART01_SUPPLEMENT_TEST_4900
     * @tc.name testDecimalLessThanPart01TestTest049
     * @tc.desc Verify 0.1+0.2 0.3 0.30000000000000004 true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanPart01TestTest049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Decimal(0.1).add(0.2);
      expect(d.lessThan(0.30000000000000004)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_PART01_SUPPLEMENT_TEST_5000
     * @tc.name testDecimalLessThanPart01TestTest050
     * @tc.desc Verify 0.3 0.3 false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanPart01TestTest050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Decimal(0.1).add(0.2);
      expect(d.lessThan(0.3)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_PART01_SUPPLEMENT_TEST_5100
     * @tc.name testDecimalLessThanPart01TestTest051
     * @tc.desc Verify number 9007199254740993 2^53 9007199254740992 false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanPart01TestTest051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Decimal(9007199254740993);
      expect(d.lessThan(9007199254740992)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_PART01_SUPPLEMENT_TEST_5200
     * @tc.name testDecimalLessThanPart01TestTest052
     * @tc.desc Verify number 9007199254740993 2^53 9007199254740991 false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanPart01TestTest052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Decimal(9007199254740993);
      expect(d.lessThan(9007199254740991)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_PART01_SUPPLEMENT_TEST_5300
     * @tc.name testDecimalLessThanPart01TestTest053
     * @tc.desc Verify boolean
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanPart01TestTest053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Decimal(4);
      const r = d.lessThan(5);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_PART01_SUPPLEMENT_TEST_5400
     * @tc.name testDecimalLessThanPart01TestTest054
     * @tc.desc Verify boolean
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanPart01TestTest054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Decimal(6);
      const r = d.lessThan(5);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_PART01_SUPPLEMENT_TEST_5500
     * @tc.name testDecimalLessThanPart01TestTest055
     * @tc.desc Verify number values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanPart01TestTest055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Decimal(4);
      expect(d.lessThan(5)).assertTrue();
      expect(d.lessThan(5)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_PART01_SUPPLEMENT_TEST_5600
     * @tc.name testDecimalLessThanPart01TestTest056
     * @tc.desc Verify lessThan
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanPart01TestTest056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Decimal(4);
      expect(d.lessThan(5)).assertTrue();
      expect(d.toString()).assertEqual('4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_PART01_SUPPLEMENT_TEST_5700
     * @tc.name testDecimalLessThanPart01TestTest057
     * @tc.desc Verify lessThan true comparedTo -1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanPart01TestTest057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Decimal(4);
      expect(d.lessThan(5)).assertTrue();
      expect(d.comparedTo(5)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_PART01_SUPPLEMENT_TEST_5800
     * @tc.name testDecimalLessThanPart01TestTest058
     * @tc.desc Verify lessThan false equals true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanPart01TestTest058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Decimal(4);
      expect(d.lessThan(4)).assertFalse();
      expect(d.equals(4)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_PART01_SUPPLEMENT_TEST_5900
     * @tc.name testDecimalLessThanPart01TestTest059
     * @tc.desc Verify number NaN false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanPart01TestTest059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Decimal(4);
      expect(d.lessThan(NaN)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_PART01_SUPPLEMENT_TEST_6000
     * @tc.name testDecimalLessThanPart01TestTest060
     * @tc.desc Verify NaN number false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanPart01TestTest060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Decimal(NaN);
      expect(d.lessThan(4)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_PART01_SUPPLEMENT_TEST_6100
     * @tc.name testDecimalLessThanPart01TestTest061
     * @tc.desc Verify NaN NaN false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanPart01TestTest061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Decimal(NaN);
      expect(d.lessThan(NaN)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_PART01_SUPPLEMENT_TEST_6200
     * @tc.name testDecimalLessThanPart01TestTest062
     * @tc.desc Verify NaN +Infinity false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanPart01TestTest062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Decimal(NaN);
      expect(d.lessThan(Infinity)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_PART01_SUPPLEMENT_TEST_6300
     * @tc.name testDecimalLessThanPart01TestTest063
     * @tc.desc Verify +Infinity NaN false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanPart01TestTest063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Decimal(Infinity);
      expect(d.lessThan(NaN)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_PART01_SUPPLEMENT_TEST_6400
     * @tc.name testDecimalLessThanPart01TestTest064
     * @tc.desc Verify NaN -0 false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanPart01TestTest064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Decimal(NaN);
      expect(d.lessThan(-0)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_PART01_SUPPLEMENT_TEST_6500
     * @tc.name testDecimalLessThanPart01TestTest065
     * @tc.desc Verify -0 NaN false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanPart01TestTest065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Decimal(-0);
      expect(d.lessThan(NaN)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_PART01_SUPPLEMENT_TEST_6600
     * @tc.name testDecimalLessThanPart01TestTest066
     * @tc.desc Verify -Infinity NaN false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanPart01TestTest066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Decimal(-Infinity);
      expect(d.lessThan(NaN)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_PART01_SUPPLEMENT_TEST_6700
     * @tc.name testDecimalLessThanPart01TestTest067
     * @tc.desc Verify 4 +Infinity true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanPart01TestTest067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Decimal(4);
      expect(d.lessThan(Infinity)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_PART01_SUPPLEMENT_TEST_6800
     * @tc.name testDecimalLessThanPart01TestTest068
     * @tc.desc Verify +Infinity 4 false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanPart01TestTest068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Decimal(Infinity);
      expect(d.lessThan(4)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_PART01_SUPPLEMENT_TEST_6900
     * @tc.name testDecimalLessThanPart01TestTest069
     * @tc.desc Verify -4 -Infinity false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanPart01TestTest069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Decimal(-4);
      expect(d.lessThan(-Infinity)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_PART01_SUPPLEMENT_TEST_7000
     * @tc.name testDecimalLessThanPart01TestTest070
     * @tc.desc Verify -Infinity -4 true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanPart01TestTest070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Decimal(-Infinity);
      expect(d.lessThan(-4)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_PART01_SUPPLEMENT_TEST_7100
     * @tc.name testDecimalLessThanPart01TestTest071
     * @tc.desc Verify +Infinity false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanPart01TestTest071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Decimal(Infinity);
      expect(d.lessThan(Infinity)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_PART01_SUPPLEMENT_TEST_7200
     * @tc.name testDecimalLessThanPart01TestTest072
     * @tc.desc Verify -Infinity +Infinity true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanPart01TestTest072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Decimal(-Infinity);
      expect(d.lessThan(Infinity)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_PART01_SUPPLEMENT_TEST_7300
     * @tc.name testDecimalLessThanPart01TestTest073
     * @tc.desc Verify -Infinity false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanPart01TestTest073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Decimal(-Infinity);
      expect(d.lessThan(-Infinity)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_PART01_SUPPLEMENT_TEST_7400
     * @tc.name testDecimalLessThanPart01TestTest074
     * @tc.desc Verify 0 +Infinity true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanPart01TestTest074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Decimal(0);
      expect(d.lessThan(Infinity)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_PART01_SUPPLEMENT_TEST_7500
     * @tc.name testDecimalLessThanPart01TestTest075
     * @tc.desc Verify 1e308 Number.MAX_VALUE true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanPart01TestTest075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Decimal(1e308);
      expect(d.lessThan(Number.MAX_VALUE)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_PART01_SUPPLEMENT_TEST_7600
     * @tc.name testDecimalLessThanPart01TestTest076
     * @tc.desc Verify boolean true 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanPart01TestTest076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        (new Decimal(6) as ESObject).lessThan(true);
      } catch (e) {
        expect((e as ESObject).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_PART01_SUPPLEMENT_TEST_7700
     * @tc.name testDecimalLessThanPart01TestTest077
     * @tc.desc Verify 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanPart01TestTest077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        (new Decimal(6) as ESObject).lessThan({ a: 1 });
      } catch (e) {
        expect((e as ESObject).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_PART01_SUPPLEMENT_TEST_7800
     * @tc.name testDecimalLessThanPart01TestTest078
     * @tc.desc Verify 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanPart01TestTest078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        (new Decimal(6) as ESObject).lessThan([5]);
      } catch (e) {
        expect((e as ESObject).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_PART01_SUPPLEMENT_TEST_7900
     * @tc.name testDecimalLessThanPart01TestTest079
     * @tc.desc Verify 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanPart01TestTest079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        (new Decimal(6) as ESObject).lessThan(() => { return 5; });
      } catch (e) {
        expect((e as ESObject).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_PART01_SUPPLEMENT_TEST_8000
     * @tc.name testDecimalLessThanPart01TestTest080
     * @tc.desc Verify Date 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanPart01TestTest080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        (new Decimal(6) as ESObject).lessThan(new Date());
      } catch (e) {
        expect((e as ESObject).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_PART01_SUPPLEMENT_TEST_8100
     * @tc.name testDecimalLessThanPart01TestTest081
     * @tc.desc Verify RegExp 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanPart01TestTest081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        (new Decimal(6) as ESObject).lessThan(/y/);
      } catch (e) {
        expect((e as ESObject).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_PART01_SUPPLEMENT_TEST_8200
     * @tc.name testDecimalLessThanPart01TestTest082
     * @tc.desc Verify Map 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanPart01TestTest082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        (new Decimal(6) as ESObject).lessThan(new Map());
      } catch (e) {
        expect((e as ESObject).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_PART01_SUPPLEMENT_TEST_8300
     * @tc.name testDecimalLessThanPart01TestTest083
     * @tc.desc Verify Set 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanPart01TestTest083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        (new Decimal(6) as ESObject).lessThan(new Set<string>() as ESObject);
      } catch (e) {
        expect((e as ESObject).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_PART01_SUPPLEMENT_TEST_8400
     * @tc.name testDecimalLessThanPart01TestTest084
     * @tc.desc Verify TypedArray Int32Array 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanPart01TestTest084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        (new Decimal(6) as ESObject).lessThan(new Int32Array([5]));
      } catch (e) {
        expect((e as ESObject).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_PART01_SUPPLEMENT_TEST_8500
     * @tc.name testDecimalLessThanPart01TestTest085
     * @tc.desc Verify object input 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanPart01TestTest085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let hit: boolean = false;
      try {
        new Decimal(6).lessThan({ v: 1 } as ESObject);
      } catch (e) {
        expect(e.name).assertEqual('BusinessError');
        expect((e as BusinessError).code).assertEqual(401);
        hit = true;
      }
      expect(hit).assertTrue();


    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_PART01_SUPPLEMENT_TEST_8600
     * @tc.name testDecimalLessThanPart01TestTest086
     * @tc.desc Verify null lessThan TypeError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanPart01TestTest086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: ESObject = null;
      try {
        d.lessThan(5);
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_PART01_SUPPLEMENT_TEST_8700
     * @tc.name testDecimalLessThanPart01TestTest087
     * @tc.desc Verify undefined lessThan TypeError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanPart01TestTest087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: ESObject = undefined;
      try {
        d.lessThan(5);
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_PART01_SUPPLEMENT_TEST_8800
     * @tc.name testDecimalLessThanPart01TestTest088
     * @tc.desc Verify valueOf/toString Value 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanPart01TestTest088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        (new Decimal(6) as ESObject).lessThan({ valueOf: () => { return 2; }, toString: () => { return '2'; } });
      } catch (e) {
        expect((e as ESObject).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_PART01_SUPPLEMENT_TEST_8900
     * @tc.name testDecimalLessThanPart01TestTest089
     * @tc.desc Verify 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanPart01TestTest089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        (new Decimal(6) as ESObject).lessThan({});
      } catch (e) {
        expect((e as ESObject).code).assertEqual(401);
      }
    });


  });

}
