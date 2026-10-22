
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

export default function decimalStaticAbsPart01TestTest() {
  describe('DecimalStaticAbsPart01TestTest', () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ABS_PART01_SUPPLEMENT_TEST_0100
     * @tc.name testDecimalStaticAbsPart01TestTest001
     * @tc.desc Verify : 5.5 static abs
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAbsPart01TestTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = Decimal.abs(5.5);
      expect(d.toString()).assertEqual('5.5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ABS_PART01_SUPPLEMENT_TEST_0200
     * @tc.name testDecimalStaticAbsPart01TestTest002
     * @tc.desc Verify : -5.5 static abs 5.5
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAbsPart01TestTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = Decimal.abs(-5.5);
      expect(d.toString()).assertEqual('5.5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ABS_PART01_SUPPLEMENT_TEST_0300
     * @tc.name testDecimalStaticAbsPart01TestTest003
     * @tc.desc Verify : spec -0.5 static abs 0.5
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAbsPart01TestTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = Decimal.abs(-0.5);
      expect(d.toString()).assertEqual('0.5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ABS_PART01_SUPPLEMENT_TEST_0400
     * @tc.name testDecimalStaticAbsPart01TestTest004
     * @tc.desc Verify : 123 static abs 123
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAbsPart01TestTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = Decimal.abs(123);
      expect(d.toString()).assertEqual('123');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ABS_PART01_SUPPLEMENT_TEST_0500
     * @tc.name testDecimalStaticAbsPart01TestTest005
     * @tc.desc Verify : -123 static abs 123
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAbsPart01TestTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = Decimal.abs(-123);
      expect(d.toString()).assertEqual('123');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ABS_PART01_SUPPLEMENT_TEST_0600
     * @tc.name testDecimalStaticAbsPart01TestTest006
     * @tc.desc Verify : 0.001 static abs 0.001
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAbsPart01TestTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = Decimal.abs(0.001);
      expect(d.toString()).assertEqual('0.001');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ABS_PART01_SUPPLEMENT_TEST_0700
     * @tc.name testDecimalStaticAbsPart01TestTest007
     * @tc.desc Verify : -0.001 static abs 0.001
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAbsPart01TestTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = Decimal.abs(-0.001);
      expect(d.toString()).assertEqual('0.001');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ABS_PART01_SUPPLEMENT_TEST_0800
     * @tc.name testDecimalStaticAbsPart01TestTest008
     * @tc.desc Verify : 0.1 static abs 0.1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAbsPart01TestTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = Decimal.abs(0.1);
      expect(d.toString()).assertEqual('0.1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ABS_PART01_SUPPLEMENT_TEST_0900
     * @tc.name testDecimalStaticAbsPart01TestTest009
     * @tc.desc Verify : -0.1 static abs 0.1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAbsPart01TestTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = Decimal.abs(-0.1);
      expect(d.toString()).assertEqual('0.1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ABS_PART01_SUPPLEMENT_TEST_1000
     * @tc.name testDecimalStaticAbsPart01TestTest010
     * @tc.desc Verify : 123.456 static abs
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAbsPart01TestTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = Decimal.abs(123.456);
      expect(d.toString()).assertEqual('123.456');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ABS_PART01_SUPPLEMENT_TEST_1100
     * @tc.name testDecimalStaticAbsPart01TestTest011
     * @tc.desc Verify : -123.456 static abs 123.456
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAbsPart01TestTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = Decimal.abs(-123.456);
      expect(d.toString()).assertEqual('123.456');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ABS_PART01_SUPPLEMENT_TEST_1200
     * @tc.name testDecimalStaticAbsPart01TestTest012
     * @tc.desc Verify : 9e15 static abs 9000000000000000
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAbsPart01TestTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = Decimal.abs(9e15);
      expect(d.toString()).assertEqual('9000000000000000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ABS_PART01_SUPPLEMENT_TEST_1300
     * @tc.name testDecimalStaticAbsPart01TestTest013
     * @tc.desc Verify : -9e15 static abs 9000000000000000
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAbsPart01TestTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = Decimal.abs(-9e15);
      expect(d.toString()).assertEqual('9000000000000000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ABS_PART01_SUPPLEMENT_TEST_1400
     * @tc.name testDecimalStaticAbsPart01TestTest014
     * @tc.desc Verify : 1e9 static abs 1000000000
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAbsPart01TestTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = Decimal.abs(1e9);
      expect(d.toString()).assertEqual('1000000000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ABS_PART01_SUPPLEMENT_TEST_1500
     * @tc.name testDecimalStaticAbsPart01TestTest015
     * @tc.desc Verify : -1e9 static abs 1000000000
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAbsPart01TestTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = Decimal.abs(-1e9);
      expect(d.toString()).assertEqual('1000000000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ABS_PART01_SUPPLEMENT_TEST_1600
     * @tc.name testDecimalStaticAbsPart01TestTest016
     * @tc.desc Verify : 1e8 static abs 100000000
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAbsPart01TestTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = Decimal.abs(1e8);
      expect(d.toString()).assertEqual('100000000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ABS_PART01_SUPPLEMENT_TEST_1700
     * @tc.name testDecimalStaticAbsPart01TestTest017
     * @tc.desc Verify : -1e8 static abs 100000000
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAbsPart01TestTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = Decimal.abs(-1e8);
      expect(d.toString()).assertEqual('100000000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ABS_PART01_SUPPLEMENT_TEST_1800
     * @tc.name testDecimalStaticAbsPart01TestTest018
     * @tc.desc Verify : 16 0x10 static abs 16
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAbsPart01TestTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = Decimal.abs(0x10);
      expect(d.toString()).assertEqual('16');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ABS_PART01_SUPPLEMENT_TEST_1900
     * @tc.name testDecimalStaticAbsPart01TestTest019
     * @tc.desc Verify : 16 0x1A static abs 26
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAbsPart01TestTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = Decimal.abs(0x1A);
      expect(d.toString()).assertEqual('26');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ABS_PART01_SUPPLEMENT_TEST_2000
     * @tc.name testDecimalStaticAbsPart01TestTest020
     * @tc.desc Verify : 2 0b101 static abs 5
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAbsPart01TestTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = Decimal.abs(0b101);
      expect(d.toString()).assertEqual('5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ABS_PART01_SUPPLEMENT_TEST_2100
     * @tc.name testDecimalStaticAbsPart01TestTest021
     * @tc.desc Verify : 8 0o10 static abs 8
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAbsPart01TestTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = Decimal.abs(0o10);
      expect(d.toString()).assertEqual('8');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ABS_PART01_SUPPLEMENT_TEST_2200
     * @tc.name testDecimalStaticAbsPart01TestTest022
     * @tc.desc Verify 1e-7 static abs '1e-7'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAbsPart01TestTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = Decimal.abs(1e-7);
      expect(d.toString()).assertEqual('1e-7');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ABS_PART01_SUPPLEMENT_TEST_2300
     * @tc.name testDecimalStaticAbsPart01TestTest023
     * @tc.desc Verify : -1e-7 static abs 0.0000001
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAbsPart01TestTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = Decimal.abs(-1e-7);
      expect(d.toString()).assertEqual('1e-7');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ABS_PART01_SUPPLEMENT_TEST_2400
     * @tc.name testDecimalStaticAbsPart01TestTest024
     * @tc.desc Verify : 1e21 static abs
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAbsPart01TestTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = Decimal.abs(1e21);
      expect(d.toString()).assertEqual('1e+21');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ABS_PART01_SUPPLEMENT_TEST_2500
     * @tc.name testDecimalStaticAbsPart01TestTest025
     * @tc.desc Verify : -1e21 static abs
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAbsPart01TestTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = Decimal.abs(-1e21);
      expect(d.toString()).assertEqual('1e+21');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ABS_PART01_SUPPLEMENT_TEST_2600
     * @tc.name testDecimalStaticAbsPart01TestTest026
     * @tc.desc Verify : MAX_SAFE_INTEGER static abs
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAbsPart01TestTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = Decimal.abs(Number.MAX_SAFE_INTEGER);
      expect(d.toString()).assertEqual('9007199254740991');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ABS_PART01_SUPPLEMENT_TEST_2700
     * @tc.name testDecimalStaticAbsPart01TestTest027
     * @tc.desc Verify : MIN_SAFE_INTEGER static abs 9007199254740991
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAbsPart01TestTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = Decimal.abs(Number.MIN_SAFE_INTEGER);
      expect(d.toString()).assertEqual('9007199254740991');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ABS_PART01_SUPPLEMENT_TEST_2800
     * @tc.name testDecimalStaticAbsPart01TestTest028
     * @tc.desc Verify : 1 static abs 9007199254740992
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAbsPart01TestTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = Decimal.abs(9007199254740992);
      expect(d.toString()).assertEqual('9007199254740992');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ABS_PART01_SUPPLEMENT_TEST_2900
     * @tc.name testDecimalStaticAbsPart01TestTest029
     * @tc.desc Verify : 1 static abs 9007199254740992
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAbsPart01TestTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = Decimal.abs(-9007199254740992);
      expect(d.toString()).assertEqual('9007199254740992');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ABS_PART01_SUPPLEMENT_TEST_3000
     * @tc.name testDecimalStaticAbsPart01TestTest030
     * @tc.desc Verify : Number.MAX_VALUE static abs toNumber
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAbsPart01TestTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = Decimal.abs(Number.MAX_VALUE);
      expect(d.toNumber()).assertEqual(Number.MAX_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ABS_PART01_SUPPLEMENT_TEST_3100
     * @tc.name testDecimalStaticAbsPart01TestTest031
     * @tc.desc Verify : -Number.MAX_VALUE static abs toNumber
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAbsPart01TestTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = Decimal.abs(-Number.MAX_VALUE);
      expect(d.toNumber()).assertEqual(Number.MAX_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ABS_PART01_SUPPLEMENT_TEST_3200
     * @tc.name testDecimalStaticAbsPart01TestTest032
     * @tc.desc Verify : 1e308 static abs toString
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAbsPart01TestTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = Decimal.abs(1e308);
      expect(d.toString()).assertEqual('1e+308');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ABS_PART01_SUPPLEMENT_TEST_3300
     * @tc.name testDecimalStaticAbsPart01TestTest033
     * @tc.desc Verify : -1e308 static abs 1e+308
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAbsPart01TestTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = Decimal.abs(-1e308);
      expect(d.toString()).assertEqual('1e+308');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ABS_PART01_SUPPLEMENT_TEST_3400
     * @tc.name testDecimalStaticAbsPart01TestTest034
     * @tc.desc Verify : Number.MIN_VALUE 5e-324 static abs
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAbsPart01TestTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = Decimal.abs(Number.MIN_VALUE);
      expect(d.toString()).assertEqual('5e-324');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ABS_PART01_SUPPLEMENT_TEST_3500
     * @tc.name testDecimalStaticAbsPart01TestTest035
     * @tc.desc Verify : -Number.MIN_VALUE static abs 5e-324
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAbsPart01TestTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = Decimal.abs(-Number.MIN_VALUE);
      expect(d.toString()).assertEqual('5e-324');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ABS_PART01_SUPPLEMENT_TEST_3600
     * @tc.name testDecimalStaticAbsPart01TestTest036
     * @tc.desc Verify 1e-324 MIN_VALUE static abs underflows to '0'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAbsPart01TestTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = Decimal.abs(1e-324);
      expect(d.toString()).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ABS_PART01_SUPPLEMENT_TEST_3700
     * @tc.name testDecimalStaticAbsPart01TestTest037
     * @tc.desc Verify : -1e-324 static abs 5e-324
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAbsPart01TestTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = Decimal.abs(-1e-324);
      expect(d.toString()).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ABS_PART01_SUPPLEMENT_TEST_3800
     * @tc.name testDecimalStaticAbsPart01TestTest038
     * @tc.desc Verify : Number.EPSILON static abs
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAbsPart01TestTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = Decimal.abs(Number.EPSILON);
      expect(d.toString()).assertEqual('2.220446049250313e-16');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ABS_PART01_SUPPLEMENT_TEST_3900
     * @tc.name testDecimalStaticAbsPart01TestTest039
     * @tc.desc Verify : -Number.EPSILON static abs EPSILON
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAbsPart01TestTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = Decimal.abs(-Number.EPSILON);
      expect(d.toString()).assertEqual('2.220446049250313e-16');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ABS_PART01_SUPPLEMENT_TEST_4000
     * @tc.name testDecimalStaticAbsPart01TestTest040
     * @tc.desc Verify : 1e-300 static abs
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAbsPart01TestTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = Decimal.abs(1e-300);
      expect(d.toString()).assertEqual('1e-300');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ABS_PART01_SUPPLEMENT_TEST_4100
     * @tc.name testDecimalStaticAbsPart01TestTest041
     * @tc.desc Verify : -1e-300 static abs 1e-300
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAbsPart01TestTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = Decimal.abs(-1e-300);
      expect(d.toString()).assertEqual('1e-300');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ABS_PART01_SUPPLEMENT_TEST_4200
     * @tc.name testDecimalStaticAbsPart01TestTest042
     * @tc.desc Verify : NaN static abs NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAbsPart01TestTest042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = Decimal.abs(NaN);
      expect(d.isNaN()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ABS_PART01_SUPPLEMENT_TEST_4300
     * @tc.name testDecimalStaticAbsPart01TestTest043
     * @tc.desc Verify : static abs Infinity
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAbsPart01TestTest043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = Decimal.abs(Number.POSITIVE_INFINITY);
      expect(d.toString()).assertEqual('Infinity');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ABS_PART01_SUPPLEMENT_TEST_4400
     * @tc.name testDecimalStaticAbsPart01TestTest044
     * @tc.desc Verify : -Infinity static abs isFinite false toString Infinity
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAbsPart01TestTest044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = Decimal.abs(-Infinity);
      expect(d.isFinite()).assertFalse();
      expect(d.toString()).assertEqual('Infinity');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ABS_PART01_SUPPLEMENT_TEST_4500
     * @tc.name testDecimalStaticAbsPart01TestTest045
     * @tc.desc Verify : 0 static abs 0 isZero true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAbsPart01TestTest045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = Decimal.abs(0);
      expect(d.toString()).assertEqual('0');
      expect(d.isZero()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ABS_PART01_SUPPLEMENT_TEST_4600
     * @tc.name testDecimalStaticAbsPart01TestTest046
     * @tc.desc Verify : -0 static abs isNegative false valueOf 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAbsPart01TestTest046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = Decimal.abs(-0);
      expect(d.isNegative()).assertFalse();
      expect(d.valueOf()).assertEqual('0');
      expect(d.toString()).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ABS_PART01_SUPPLEMENT_TEST_4700
     * @tc.name testDecimalStaticAbsPart01TestTest047
     * @tc.desc Verify : -0.0 static abs isZero true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAbsPart01TestTest047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = Decimal.abs(-0.0);
      expect(d.isZero()).assertTrue();
      expect(d.isNegative()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ABS_PART01_SUPPLEMENT_TEST_4800
     * @tc.name testDecimalStaticAbsPart01TestTest048
     * @tc.desc Verify : 0.0 static abs 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAbsPart01TestTest048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = Decimal.abs(0.0);
      expect(d.toString()).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ABS_PART01_SUPPLEMENT_TEST_4900
     * @tc.name testDecimalStaticAbsPart01TestTest049
     * @tc.desc Verify : 1e400 static abs toNumber Infinity
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAbsPart01TestTest049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = Decimal.abs(1e400);
      expect(d.toNumber()).assertEqual(Infinity);
      expect(d.isNegative()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ABS_PART01_SUPPLEMENT_TEST_5000
     * @tc.name testDecimalStaticAbsPart01TestTest050
     * @tc.desc Verify : -1e400 static abs toNumber Infinity
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAbsPart01TestTest050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = Decimal.abs(-1e400);
      expect(d.toNumber()).assertEqual(Infinity);
      expect(d.isNegative()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ABS_PART01_SUPPLEMENT_TEST_5100
     * @tc.name testDecimalStaticAbsPart01TestTest051
     * @tc.desc Verify : 1e309 static abs toNumber Infinity
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAbsPart01TestTest051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = Decimal.abs(1e309);
      expect(d.toNumber()).assertEqual(Infinity);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ABS_PART01_SUPPLEMENT_TEST_5200
     * @tc.name testDecimalStaticAbsPart01TestTest052
     * @tc.desc Verify : -1e309 static abs toNumber Infinity
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAbsPart01TestTest052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = Decimal.abs(-1e309);
      expect(d.toNumber()).assertEqual(Infinity);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ABS_PART01_SUPPLEMENT_TEST_5300
     * @tc.name testDecimalStaticAbsPart01TestTest053
     * @tc.desc Verify : 1e-400 static abs toString toNumber 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAbsPart01TestTest053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = Decimal.abs(1e-400);
      expect(d.toString()).assertEqual('0');
      expect(d.toNumber()).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ABS_PART01_SUPPLEMENT_TEST_5400
     * @tc.name testDecimalStaticAbsPart01TestTest054
     * @tc.desc Verify : -1e-400 static abs toString 1e-400 toNumber 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAbsPart01TestTest054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = Decimal.abs(-1e-400);
      expect(d.toString()).assertEqual('0');
      expect(d.toNumber()).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ABS_PART01_SUPPLEMENT_TEST_5500
     * @tc.name testDecimalStaticAbsPart01TestTest055
     * @tc.desc Verify : boolean n 401 Value boolean
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAbsPart01TestTest055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: ESObject = true;
      try {
        Decimal.abs(v);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ABS_PART01_SUPPLEMENT_TEST_5600
     * @tc.name testDecimalStaticAbsPart01TestTest056
     * @tc.desc Verify : boolean false n 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAbsPart01TestTest056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: ESObject = false;
      try {
        Decimal.abs(v);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ABS_PART01_SUPPLEMENT_TEST_5700
     * @tc.name testDecimalStaticAbsPart01TestTest057
     * @tc.desc Verify : n 401 Value string|number|Decimal
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAbsPart01TestTest057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: ESObject = [1, 2];
      try {
        Decimal.abs(v);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ABS_PART01_SUPPLEMENT_TEST_5800
     * @tc.name testDecimalStaticAbsPart01TestTest058
     * @tc.desc Verify : n 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAbsPart01TestTest058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: ESObject = { a: 1 };
      try {
        Decimal.abs(v);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ABS_PART01_SUPPLEMENT_TEST_5900
     * @tc.name testDecimalStaticAbsPart01TestTest059
     * @tc.desc Verify : n 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAbsPart01TestTest059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: ESObject = () => { return 1; };
      try {
        Decimal.abs(v);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ABS_PART01_SUPPLEMENT_TEST_6000
     * @tc.name testDecimalStaticAbsPart01TestTest060
     * @tc.desc Verify : undefined n 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAbsPart01TestTest060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: ESObject = undefined;
      try {
        Decimal.abs(v);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ABS_PART01_SUPPLEMENT_TEST_6100
     * @tc.name testDecimalStaticAbsPart01TestTest061
     * @tc.desc Verify : null undefined 401 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAbsPart01TestTest061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
  let nulThrows: boolean = false;
  let undThrows: boolean = false;
  try {
    Decimal.abs(null as ESObject);
  } catch (e) {
    nulThrows = true;
    expect((e as BusinessError).code).assertEqual(401);
  }
  try {
    Decimal.abs(undefined as ESObject);
  } catch (e) {
    undThrows = true;
    expect((e as BusinessError).code).assertEqual(401);
  }
  expect(nulThrows).assertTrue();
  expect(undThrows).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ABS_PART01_SUPPLEMENT_TEST_6200
     * @tc.name testDecimalStaticAbsPart01TestTest062
     * @tc.desc Verify : static abs Decimal instanceof
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAbsPart01TestTest062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = Decimal.abs(-5.5);
      expect(d instanceof Decimal).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ABS_PART01_SUPPLEMENT_TEST_6300
     * @tc.name testDecimalStaticAbsPart01TestTest063
     * @tc.desc Verify : static abs abs(-3.7).add(1) 4.7
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAbsPart01TestTest063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = Decimal.abs(-3.7).add(1);
      expect(d.toString()).assertEqual('4.7');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ABS_PART01_SUPPLEMENT_TEST_6400
     * @tc.name testDecimalStaticAbsPart01TestTest064
     * @tc.desc Verify : static abs toString toNumber -1.5 '1.5' / 1.5
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAbsPart01TestTest064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = Decimal.abs(-1.5);
      expect(d.toString()).assertEqual('1.5');
      expect(d.toNumber()).assertEqual(1.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ABS_PART01_SUPPLEMENT_TEST_6500
     * @tc.name testDecimalStaticAbsPart01TestTest065
     * @tc.desc Verify : static abs isNegative false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAbsPart01TestTest065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = Decimal.abs(-8.88);
      expect(d.isNegative()).assertFalse();
      expect(d.toString()).assertEqual('8.88');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ABS_PART01_SUPPLEMENT_TEST_6600
     * @tc.name testDecimalStaticAbsPart01TestTest066
     * @tc.desc Verify : static abs abs
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAbsPart01TestTest066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Decimal = Decimal.abs(-12.34);
      let b: Decimal = a.abs();
      expect(a.toString()).assertEqual('12.34');
      expect(b.toString()).assertEqual('12.34');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ABS_PART01_SUPPLEMENT_TEST_6700
     * @tc.name testDecimalStaticAbsPart01TestTest067
     * @tc.desc Verify : static abs d/e/s -123.456 d 3 e 2 s 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAbsPart01TestTest067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = Decimal.abs(-123.456);
      expect(d.d.length).assertEqual(2);
      expect(d.e).assertEqual(2);
      expect(d.s).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ABS_PART01_SUPPLEMENT_TEST_6800
     * @tc.name testDecimalStaticAbsPart01TestTest068
     * @tc.desc Verify : static abs d e 123 d 3 e 2 s 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAbsPart01TestTest068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = Decimal.abs(123);
      expect(d.d.length).assertEqual(1);
      expect(d.e).assertEqual(2);
      expect(d.s).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ABS_PART01_SUPPLEMENT_TEST_6900
     * @tc.name testDecimalStaticAbsPart01TestTest069
     * @tc.desc Verify : static abs 0 e 0 s 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAbsPart01TestTest069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
  let d: Decimal = Decimal.abs(0);
  expect(d.isZero()).assertTrue();
  expect(d.isNegative()).assertFalse();
    });


  });

}
