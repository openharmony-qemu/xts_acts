
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

export default function decimalLessThanOrEqualToPart01TestTest() {
  describe('DecimalLessThanOrEqualToPart01TestTest', () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_OR_EQUAL_TO_PART01_SUPPLEMENT_TEST_0100
     * @tc.name testDecimalLessThanOrEqualToPart01TestTest001
     * @tc.desc Verify number boolean
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanOrEqualToPart01TestTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(5);
      let r: boolean = d.lessThanOrEqualTo(6);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_OR_EQUAL_TO_PART01_SUPPLEMENT_TEST_0200
     * @tc.name testDecimalLessThanOrEqualToPart01TestTest002
     * @tc.desc Verify 0 401 n
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanOrEqualToPart01TestTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(5);
      try {
        d.lessThanOrEqualTo(undefined as ESObject);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_OR_EQUAL_TO_PART01_SUPPLEMENT_TEST_0300
     * @tc.name testDecimalLessThanOrEqualToPart01TestTest003
     * @tc.desc Verify 0 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanOrEqualToPart01TestTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(5);
      expect(d.lessThanOrEqualTo(0)).assertFalse();
      try {
        d.lessThanOrEqualTo(undefined as ESObject);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_OR_EQUAL_TO_PART01_SUPPLEMENT_TEST_0400
     * @tc.name testDecimalLessThanOrEqualToPart01TestTest004
     * @tc.desc Verify true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanOrEqualToPart01TestTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(5);
      expect(d.lessThanOrEqualTo(5)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_OR_EQUAL_TO_PART01_SUPPLEMENT_TEST_0500
     * @tc.name testDecimalLessThanOrEqualToPart01TestTest005
     * @tc.desc Verify false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanOrEqualToPart01TestTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(5);
      expect(d.lessThanOrEqualTo(4)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_OR_EQUAL_TO_PART01_SUPPLEMENT_TEST_0600
     * @tc.name testDecimalLessThanOrEqualToPart01TestTest006
     * @tc.desc Verify -3 <= -2 true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanOrEqualToPart01TestTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(-3);
      expect(d.lessThanOrEqualTo(-2)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_OR_EQUAL_TO_PART01_SUPPLEMENT_TEST_0700
     * @tc.name testDecimalLessThanOrEqualToPart01TestTest007
     * @tc.desc Verify -3 <= -4 false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanOrEqualToPart01TestTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(-3);
      expect(d.lessThanOrEqualTo(-4)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_OR_EQUAL_TO_PART01_SUPPLEMENT_TEST_0800
     * @tc.name testDecimalLessThanOrEqualToPart01TestTest008
     * @tc.desc Verify 0 -1 <= 0 true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanOrEqualToPart01TestTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(-1);
      expect(d.lessThanOrEqualTo(0)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_OR_EQUAL_TO_PART01_SUPPLEMENT_TEST_0900
     * @tc.name testDecimalLessThanOrEqualToPart01TestTest009
     * @tc.desc Verify 0 1 <= 0 false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanOrEqualToPart01TestTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(1);
      expect(d.lessThanOrEqualTo(0)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_OR_EQUAL_TO_PART01_SUPPLEMENT_TEST_1000
     * @tc.name testDecimalLessThanOrEqualToPart01TestTest010
     * @tc.desc Verify -0 +0 -0 <= 0 true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanOrEqualToPart01TestTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(-0);
      expect(d.lessThanOrEqualTo(0)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_OR_EQUAL_TO_PART01_SUPPLEMENT_TEST_1100
     * @tc.name testDecimalLessThanOrEqualToPart01TestTest011
     * @tc.desc Verify +0 -0 0 <= -0 true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanOrEqualToPart01TestTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(0);
      expect(d.lessThanOrEqualTo(-0)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_OR_EQUAL_TO_PART01_SUPPLEMENT_TEST_1200
     * @tc.name testDecimalLessThanOrEqualToPart01TestTest012
     * @tc.desc Verify 2.5 <= 3 true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanOrEqualToPart01TestTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(2.5);
      expect(d.lessThanOrEqualTo(3)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_OR_EQUAL_TO_PART01_SUPPLEMENT_TEST_1300
     * @tc.name testDecimalLessThanOrEqualToPart01TestTest013
     * @tc.desc Verify MAX_VALUE MAX_VALUE <= MAX_VALUE true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanOrEqualToPart01TestTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(Number.MAX_VALUE);
      expect(d.lessThanOrEqualTo(Number.MAX_VALUE)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_OR_EQUAL_TO_PART01_SUPPLEMENT_TEST_1400
     * @tc.name testDecimalLessThanOrEqualToPart01TestTest014
     * @tc.desc Verify 1e308 MAX_VALUE 1e308 <= MAX_VALUE true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanOrEqualToPart01TestTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(1e308);
      expect(d.lessThanOrEqualTo(Number.MAX_VALUE)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_OR_EQUAL_TO_PART01_SUPPLEMENT_TEST_1500
     * @tc.name testDecimalLessThanOrEqualToPart01TestTest015
     * @tc.desc Verify MAX_VALUE 1e308 MAX_VALUE <= 1e308 false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanOrEqualToPart01TestTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(Number.MAX_VALUE);
      expect(d.lessThanOrEqualTo(1e308)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_OR_EQUAL_TO_PART01_SUPPLEMENT_TEST_1600
     * @tc.name testDecimalLessThanOrEqualToPart01TestTest016
     * @tc.desc Verify MIN_VALUE MIN_VALUE <= MIN_VALUE true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanOrEqualToPart01TestTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(Number.MIN_VALUE);
      expect(d.lessThanOrEqualTo(Number.MIN_VALUE)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_OR_EQUAL_TO_PART01_SUPPLEMENT_TEST_1700
     * @tc.name testDecimalLessThanOrEqualToPart01TestTest017
     * @tc.desc Verify 0 0 <= MIN_VALUE true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanOrEqualToPart01TestTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(0);
      expect(d.lessThanOrEqualTo(Number.MIN_VALUE)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_OR_EQUAL_TO_PART01_SUPPLEMENT_TEST_1800
     * @tc.name testDecimalLessThanOrEqualToPart01TestTest018
     * @tc.desc Verify 0 MIN_VALUE <= 0 false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanOrEqualToPart01TestTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(Number.MIN_VALUE);
      expect(d.lessThanOrEqualTo(0)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_OR_EQUAL_TO_PART01_SUPPLEMENT_TEST_1900
     * @tc.name testDecimalLessThanOrEqualToPart01TestTest019
     * @tc.desc Verify 1 1+EPSILON 1 <= 1+EPSILON true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanOrEqualToPart01TestTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(1);
      expect(d.lessThanOrEqualTo(1 + Number.EPSILON)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_OR_EQUAL_TO_PART01_SUPPLEMENT_TEST_2000
     * @tc.name testDecimalLessThanOrEqualToPart01TestTest020
     * @tc.desc Verify 1+EPSILON 1 1+EPSILON <= 1 false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanOrEqualToPart01TestTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(1 + Number.EPSILON);
      expect(d.lessThanOrEqualTo(1)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_OR_EQUAL_TO_PART01_SUPPLEMENT_TEST_2100
     * @tc.name testDecimalLessThanOrEqualToPart01TestTest021
     * @tc.desc Verify MAX_SAFE_INTEGER true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanOrEqualToPart01TestTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(Number.MAX_SAFE_INTEGER);
      expect(d.lessThanOrEqualTo(Number.MAX_SAFE_INTEGER)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_OR_EQUAL_TO_PART01_SUPPLEMENT_TEST_2200
     * @tc.name testDecimalLessThanOrEqualToPart01TestTest022
     * @tc.desc Verify MIN_SAFE_INTEGER true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanOrEqualToPart01TestTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(Number.MIN_SAFE_INTEGER);
      expect(d.lessThanOrEqualTo(Number.MIN_SAFE_INTEGER)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_OR_EQUAL_TO_PART01_SUPPLEMENT_TEST_2300
     * @tc.name testDecimalLessThanOrEqualToPart01TestTest023
     * @tc.desc Verify MAX_SAFE_INTEGER <= MAX_SAFE_INTEGER+1 true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanOrEqualToPart01TestTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(Number.MAX_SAFE_INTEGER);
      expect(d.lessThanOrEqualTo(Number.MAX_SAFE_INTEGER + 1)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_OR_EQUAL_TO_PART01_SUPPLEMENT_TEST_2400
     * @tc.name testDecimalLessThanOrEqualToPart01TestTest024
     * @tc.desc Verify MIN_SAFE_INTEGER <= MIN_SAFE_INTEGER-1 false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanOrEqualToPart01TestTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(Number.MIN_SAFE_INTEGER);
      expect(d.lessThanOrEqualTo(Number.MIN_SAFE_INTEGER - 1)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_OR_EQUAL_TO_PART01_SUPPLEMENT_TEST_2500
     * @tc.name testDecimalLessThanOrEqualToPart01TestTest025
     * @tc.desc Verify 9007199254740993 9007199254740992 9007199254740992 true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanOrEqualToPart01TestTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(9007199254740993);
      expect(d.lessThanOrEqualTo(9007199254740992)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_OR_EQUAL_TO_PART01_SUPPLEMENT_TEST_2600
     * @tc.name testDecimalLessThanOrEqualToPart01TestTest026
     * @tc.desc Verify 1e21 <= 1e21 true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanOrEqualToPart01TestTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(1e21);
      expect(d.lessThanOrEqualTo(1e21)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_OR_EQUAL_TO_PART01_SUPPLEMENT_TEST_2700
     * @tc.name testDecimalLessThanOrEqualToPart01TestTest027
     * @tc.desc Verify 1e21 <= 2e21 true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanOrEqualToPart01TestTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(1e21);
      expect(d.lessThanOrEqualTo(2e21)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_OR_EQUAL_TO_PART01_SUPPLEMENT_TEST_2800
     * @tc.name testDecimalLessThanOrEqualToPart01TestTest028
     * @tc.desc Verify 2e21 <= 1e21 false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanOrEqualToPart01TestTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(2e21);
      expect(d.lessThanOrEqualTo(1e21)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_OR_EQUAL_TO_PART01_SUPPLEMENT_TEST_2900
     * @tc.name testDecimalLessThanOrEqualToPart01TestTest029
     * @tc.desc Verify 1e-7 <= 2e-7 true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanOrEqualToPart01TestTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(1e-7);
      expect(d.lessThanOrEqualTo(2e-7)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_OR_EQUAL_TO_PART01_SUPPLEMENT_TEST_3000
     * @tc.name testDecimalLessThanOrEqualToPart01TestTest030
     * @tc.desc Verify -1e-7 <= 1e-7 true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanOrEqualToPart01TestTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(-1e-7);
      expect(d.lessThanOrEqualTo(1e-7)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_OR_EQUAL_TO_PART01_SUPPLEMENT_TEST_3100
     * @tc.name testDecimalLessThanOrEqualToPart01TestTest031
     * @tc.desc Verify 0.9999999999999999 1 <= 1 true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanOrEqualToPart01TestTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(0.9999999999999999);
      expect(d.lessThanOrEqualTo(1)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_OR_EQUAL_TO_PART01_SUPPLEMENT_TEST_3200
     * @tc.name testDecimalLessThanOrEqualToPart01TestTest032
     * @tc.desc Verify 1 0.9999999999999999 1 <= 0.9999999999999999 false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanOrEqualToPart01TestTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(1);
      expect(d.lessThanOrEqualTo(0.9999999999999999)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_OR_EQUAL_TO_PART01_SUPPLEMENT_TEST_3300
     * @tc.name testDecimalLessThanOrEqualToPart01TestTest033
     * @tc.desc Verify 0.3 0.1+0.2 0.3 <= 0.30000000000000004 true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanOrEqualToPart01TestTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(0.3);
      expect(d.lessThanOrEqualTo(0.30000000000000004)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_OR_EQUAL_TO_PART01_SUPPLEMENT_TEST_3400
     * @tc.name testDecimalLessThanOrEqualToPart01TestTest034
     * @tc.desc Verify 0.30000000000000004 0.3 <= 0.3 false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanOrEqualToPart01TestTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(0.30000000000000004);
      expect(d.lessThanOrEqualTo(0.3)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_OR_EQUAL_TO_PART01_SUPPLEMENT_TEST_3500
     * @tc.name testDecimalLessThanOrEqualToPart01TestTest035
     * @tc.desc Verify 0 -0.0000000000000001 <= 0 true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanOrEqualToPart01TestTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(-0.0000000000000001);
      expect(d.lessThanOrEqualTo(0)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_OR_EQUAL_TO_PART01_SUPPLEMENT_TEST_3600
     * @tc.name testDecimalLessThanOrEqualToPart01TestTest036
     * @tc.desc Verify 0 0.0000000000000001 <= 0 false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanOrEqualToPart01TestTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(0.0000000000000001);
      expect(d.lessThanOrEqualTo(0)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_OR_EQUAL_TO_PART01_SUPPLEMENT_TEST_3700
     * @tc.name testDecimalLessThanOrEqualToPart01TestTest037
     * @tc.desc Verify -0 -0 -0 <= -0 true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanOrEqualToPart01TestTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(-0);
      expect(d.lessThanOrEqualTo(-0)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_OR_EQUAL_TO_PART01_SUPPLEMENT_TEST_3800
     * @tc.name testDecimalLessThanOrEqualToPart01TestTest038
     * @tc.desc Verify null Value 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanOrEqualToPart01TestTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(5);
      try {
        d.lessThanOrEqualTo(null as ESObject);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_OR_EQUAL_TO_PART01_SUPPLEMENT_TEST_3900
     * @tc.name testDecimalLessThanOrEqualToPart01TestTest039
     * @tc.desc Verify null null
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanOrEqualToPart01TestTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal | null = null;
      try {
        let r: boolean = d!.lessThanOrEqualTo('5');
      } catch (e) {
        expect((e as Error).name.length > 0).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_OR_EQUAL_TO_PART01_SUPPLEMENT_TEST_4000
     * @tc.name testDecimalLessThanOrEqualToPart01TestTest040
     * @tc.desc Verify false 3 <= 2.999
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanOrEqualToPart01TestTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(3);
      expect(d.lessThanOrEqualTo(2.999)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_OR_EQUAL_TO_PART01_SUPPLEMENT_TEST_4100
     * @tc.name testDecimalLessThanOrEqualToPart01TestTest041
     * @tc.desc Verify true 2.999 <= 3
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanOrEqualToPart01TestTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(2.999);
      expect(d.lessThanOrEqualTo(3)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_OR_EQUAL_TO_PART01_SUPPLEMENT_TEST_4200
     * @tc.name testDecimalLessThanOrEqualToPart01TestTest042
     * @tc.desc Verify toString
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanOrEqualToPart01TestTest042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(5);
      d.lessThanOrEqualTo(6);
      d.lessThanOrEqualTo(4);
      expect(d.toString()).assertEqual('5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_OR_EQUAL_TO_PART01_SUPPLEMENT_TEST_4300
     * @tc.name testDecimalLessThanOrEqualToPart01TestTest043
     * @tc.desc Verify NaN false NaN false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanOrEqualToPart01TestTest043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(5);
      expect(d.lessThanOrEqualTo(NaN)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_OR_EQUAL_TO_PART01_SUPPLEMENT_TEST_4400
     * @tc.name testDecimalLessThanOrEqualToPart01TestTest044
     * @tc.desc Verify Infinity 5 <= Infinity true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanOrEqualToPart01TestTest044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(5);
      expect(d.lessThanOrEqualTo(Infinity)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_OR_EQUAL_TO_PART01_SUPPLEMENT_TEST_4500
     * @tc.name testDecimalLessThanOrEqualToPart01TestTest045
     * @tc.desc Verify -Infinity 5 <= -Infinity false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanOrEqualToPart01TestTest045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(5);
      expect(d.lessThanOrEqualTo(-Infinity)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_OR_EQUAL_TO_PART01_SUPPLEMENT_TEST_4600
     * @tc.name testDecimalLessThanOrEqualToPart01TestTest046
     * @tc.desc Verify NaN Decimal NaN <= 5 false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanOrEqualToPart01TestTest046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(NaN);
      expect(d.lessThanOrEqualTo(5)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_OR_EQUAL_TO_PART01_SUPPLEMENT_TEST_4700
     * @tc.name testDecimalLessThanOrEqualToPart01TestTest047
     * @tc.desc Verify NaN NaN NaN <= NaN false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanOrEqualToPart01TestTest047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(NaN);
      expect(d.lessThanOrEqualTo(NaN)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_OR_EQUAL_TO_PART01_SUPPLEMENT_TEST_4800
     * @tc.name testDecimalLessThanOrEqualToPart01TestTest048
     * @tc.desc Verify Infinity Infinity <= true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanOrEqualToPart01TestTest048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(Infinity);
      expect(d.lessThanOrEqualTo(Infinity)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_OR_EQUAL_TO_PART01_SUPPLEMENT_TEST_4900
     * @tc.name testDecimalLessThanOrEqualToPart01TestTest049
     * @tc.desc Verify -Infinity -Infinity <= true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanOrEqualToPart01TestTest049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(-Infinity);
      expect(d.lessThanOrEqualTo(-Infinity)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_OR_EQUAL_TO_PART01_SUPPLEMENT_TEST_5000
     * @tc.name testDecimalLessThanOrEqualToPart01TestTest050
     * @tc.desc Verify Infinity -Infinity Infinity <= -Infinity false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanOrEqualToPart01TestTest050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(Infinity);
      expect(d.lessThanOrEqualTo(-Infinity)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_OR_EQUAL_TO_PART01_SUPPLEMENT_TEST_5100
     * @tc.name testDecimalLessThanOrEqualToPart01TestTest051
     * @tc.desc Verify -Infinity Infinity -Infinity <= Infinity true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanOrEqualToPart01TestTest051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(-Infinity);
      expect(d.lessThanOrEqualTo(Infinity)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_OR_EQUAL_TO_PART01_SUPPLEMENT_TEST_5200
     * @tc.name testDecimalLessThanOrEqualToPart01TestTest052
     * @tc.desc Verify Infinity NaN Infinity <= NaN false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanOrEqualToPart01TestTest052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(Infinity);
      expect(d.lessThanOrEqualTo(NaN)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_OR_EQUAL_TO_PART01_SUPPLEMENT_TEST_5300
     * @tc.name testDecimalLessThanOrEqualToPart01TestTest053
     * @tc.desc Verify 1e308 <= Infinity true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanOrEqualToPart01TestTest053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(1e308);
      expect(d.lessThanOrEqualTo(Infinity)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_OR_EQUAL_TO_PART01_SUPPLEMENT_TEST_5400
     * @tc.name testDecimalLessThanOrEqualToPart01TestTest054
     * @tc.desc Verify -1e308 <= -Infinity false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanOrEqualToPart01TestTest054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(-1e308);
      expect(d.lessThanOrEqualTo(-Infinity)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_OR_EQUAL_TO_PART01_SUPPLEMENT_TEST_5500
     * @tc.name testDecimalLessThanOrEqualToPart01TestTest055
     * @tc.desc Verify 1e309 JS Infinity 5 <= 1e309 true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanOrEqualToPart01TestTest055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(5);
      expect(d.lessThanOrEqualTo(1e309)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_OR_EQUAL_TO_PART01_SUPPLEMENT_TEST_5600
     * @tc.name testDecimalLessThanOrEqualToPart01TestTest056
     * @tc.desc Verify Value boolean true 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanOrEqualToPart01TestTest056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(5);
      try {
        d.lessThanOrEqualTo(true as ESObject);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_OR_EQUAL_TO_PART01_SUPPLEMENT_TEST_5700
     * @tc.name testDecimalLessThanOrEqualToPart01TestTest057
     * @tc.desc Verify {} 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanOrEqualToPart01TestTest057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(5);
      try {
        d.lessThanOrEqualTo({} as ESObject);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });


  });

}
