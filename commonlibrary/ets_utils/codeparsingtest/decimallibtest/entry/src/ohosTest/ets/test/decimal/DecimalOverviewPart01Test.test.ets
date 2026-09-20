
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

function sleep(time: number): Promise<void> {
  return new Promise<void>((resolve) => setTimeout(resolve, time));
}

export default function decimalOverviewPart01TestTest() {
  describe('DecimalOverviewPart01TestTest', () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART01_SUPPLEMENT_TEST_0010
     * @tc.name testDecimalOverviewPart01TestTest001
     * @tc.desc Verify number 5 toString '5'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart01TestTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new Decimal(5);
      expect(d.toString()).assertEqual('5');
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART01_SUPPLEMENT_TEST_0020
     * @tc.name testDecimalOverviewPart01TestTest002
     * @tc.desc Verify number 0 toString '0'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart01TestTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new Decimal(0);
      expect(d.toString()).assertEqual('0');
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART01_SUPPLEMENT_TEST_0030
     * @tc.name testDecimalOverviewPart01TestTest003
     * @tc.desc Verify number -0 toString
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart01TestTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new Decimal(-0);
      expect(d.toString()).assertEqual('0');
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART01_SUPPLEMENT_TEST_0040
     * @tc.name testDecimalOverviewPart01TestTest004
     * @tc.desc Verify number NaN toString 'NaN'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart01TestTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new Decimal(NaN);
      expect(d.toString()).assertEqual('NaN');
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART01_SUPPLEMENT_TEST_0050
     * @tc.name testDecimalOverviewPart01TestTest005
     * @tc.desc Verify number Infinity toString 'Infinity'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart01TestTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new Decimal(Infinity);
      expect(d.toString()).assertEqual('Infinity');
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART01_SUPPLEMENT_TEST_0060
     * @tc.name testDecimalOverviewPart01TestTest006
     * @tc.desc Verify number -Infinity toString '-Infinity'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart01TestTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new Decimal(-Infinity);
      expect(d.toString()).assertEqual('-Infinity');
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART01_SUPPLEMENT_TEST_0070
     * @tc.name testDecimalOverviewPart01TestTest007
     * @tc.desc Verify number Number.MAX_SAFE_INTEGER
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart01TestTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new Decimal(Number.MAX_SAFE_INTEGER);
      expect(d.toString()).assertEqual('9007199254740991');
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART01_SUPPLEMENT_TEST_0080
     * @tc.name testDecimalOverviewPart01TestTest008
     * @tc.desc Verify number Number.MIN_SAFE_INTEGER
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart01TestTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new Decimal(Number.MIN_SAFE_INTEGER);
      expect(d.toString()).assertEqual('-9007199254740991');
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART01_SUPPLEMENT_TEST_0090
     * @tc.name testDecimalOverviewPart01TestTest009
     * @tc.desc Verify number Number.MAX_VALUE
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart01TestTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new Decimal(Number.MAX_VALUE);
      expect(d.toString()).assertEqual('1.7976931348623157e+308');
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART01_SUPPLEMENT_TEST_0100
     * @tc.name testDecimalOverviewPart01TestTest010
     * @tc.desc Verify number Number.MIN_VALUE
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart01TestTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new Decimal(Number.MIN_VALUE);
      expect(d.toString()).assertEqual('5e-324');
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART01_SUPPLEMENT_TEST_0110
     * @tc.name testDecimalOverviewPart01TestTest011
     * @tc.desc Verify number Number.EPSILON
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart01TestTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new Decimal(Number.EPSILON);
      expect(d.toString()).assertEqual('2.220446049250313e-16');
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART01_SUPPLEMENT_TEST_0120
     * @tc.name testDecimalOverviewPart01TestTest012
     * @tc.desc Verify number 1e-7
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart01TestTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new Decimal(1e-7);
      expect(d.toString()).assertEqual('1e-7');
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART01_SUPPLEMENT_TEST_0130
     * @tc.name testDecimalOverviewPart01TestTest013
     * @tc.desc Verify number 1e21
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart01TestTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new Decimal(1e21);
      expect(d.toString()).assertEqual('1e+21');
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART01_SUPPLEMENT_TEST_0140
     * @tc.name testDecimalOverviewPart01TestTest014
     * @tc.desc Verify number 1e-6
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart01TestTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new Decimal(1e-6);
      expect(d.toString()).assertEqual('0.000001');
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART01_SUPPLEMENT_TEST_0150
     * @tc.name testDecimalOverviewPart01TestTest015
     * @tc.desc Verify number 456.789
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart01TestTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new Decimal(456.789);
      expect(d.toString()).assertEqual('456.789');
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART01_SUPPLEMENT_TEST_0160
     * @tc.name testDecimalOverviewPart01TestTest016
     * @tc.desc Verify number 0.1 '0.1'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart01TestTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new Decimal(0.1);
      expect(d.toString()).assertEqual('0.1');
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART01_SUPPLEMENT_TEST_0170
     * @tc.name testDecimalOverviewPart01TestTest017
     * @tc.desc Verify number 0.1 + 0.2 '0.30000000000000004'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart01TestTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new Decimal(0.1 + 0.2);
      expect(d.toString()).assertEqual('0.30000000000000004');
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART01_SUPPLEMENT_TEST_0180
     * @tc.name testDecimalOverviewPart01TestTest018
     * @tc.desc Verify number 750000
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart01TestTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new Decimal(750000);
      expect(d.toString()).assertEqual('750000');
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART01_SUPPLEMENT_TEST_0190
     * @tc.name testDecimalOverviewPart01TestTest019
     * @tc.desc Verify number 123.45 d digits
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart01TestTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new Decimal(123.45);
      expect(JSON.stringify(d.d)).assertEqual('[123,4500000]');
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART01_SUPPLEMENT_TEST_0200
     * @tc.name testDecimalOverviewPart01TestTest020
     * @tc.desc Verify number 123.45 e 2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart01TestTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new Decimal(123.45);
      expect(d.e).assertEqual(2);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART01_SUPPLEMENT_TEST_0210
     * @tc.name testDecimalOverviewPart01TestTest021
     * @tc.desc Verify number 123.45 s 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart01TestTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new Decimal(123.45);
      expect(d.s).assertEqual(1);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART01_SUPPLEMENT_TEST_0220
     * @tc.name testDecimalOverviewPart01TestTest022
     * @tc.desc Verify number -123.45 s 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart01TestTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new Decimal(-123.45);
      expect(d.s).assertEqual(-1);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART01_SUPPLEMENT_TEST_0230
     * @tc.name testDecimalOverviewPart01TestTest023
     * @tc.desc Verify number 0.00123 e -3
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart01TestTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new Decimal(0.00123);
      expect(d.e).assertEqual(-3);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART01_SUPPLEMENT_TEST_0240
     * @tc.name testDecimalOverviewPart01TestTest024
     * @tc.desc Verify number 0 d [0]
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart01TestTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new Decimal(0);
      expect(JSON.stringify(d.d)).assertEqual('[0]');
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART01_SUPPLEMENT_TEST_0250
     * @tc.name testDecimalOverviewPart01TestTest025
     * @tc.desc Verify number 0 e 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart01TestTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new Decimal(0);
      expect(d.e).assertEqual(0);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART01_SUPPLEMENT_TEST_0260
     * @tc.name testDecimalOverviewPart01TestTest026
     * @tc.desc Verify number -0 s 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart01TestTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new Decimal(-0);
      expect(d.s).assertEqual(-1);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART01_SUPPLEMENT_TEST_0270
     * @tc.name testDecimalOverviewPart01TestTest027
     * @tc.desc Verify number NaN e NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart01TestTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new Decimal(NaN);
      expect(Number.isNaN(d.e)).assertTrue();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART01_SUPPLEMENT_TEST_0280
     * @tc.name testDecimalOverviewPart01TestTest028
     * @tc.desc Verify add Infinity Infinity
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart01TestTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new Decimal(1).add(Infinity);
      expect(d.toString()).assertEqual('Infinity');
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART01_SUPPLEMENT_TEST_0290
     * @tc.name testDecimalOverviewPart01TestTest029
     * @tc.desc Verify add -Infinity -Infinity
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart01TestTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new Decimal(1).add(-Infinity);
      expect(d.toString()).assertEqual('-Infinity');
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART01_SUPPLEMENT_TEST_0300
     * @tc.name testDecimalOverviewPart01TestTest030
     * @tc.desc Verify sub Infinity -Infinity
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart01TestTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new Decimal(1).sub(Infinity);
      expect(d.toString()).assertEqual('-Infinity');
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART01_SUPPLEMENT_TEST_0310
     * @tc.name testDecimalOverviewPart01TestTest031
     * @tc.desc Verify div 0 Infinity
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart01TestTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new Decimal(1).div(0);
      expect(d.toString()).assertEqual('Infinity');
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART01_SUPPLEMENT_TEST_0320
     * @tc.name testDecimalOverviewPart01TestTest032
     * @tc.desc Verify div -0 -Infinity
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart01TestTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new Decimal(1).div(-0);
      expect(d.toString()).assertEqual('-Infinity');
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART01_SUPPLEMENT_TEST_0330
     * @tc.name testDecimalOverviewPart01TestTest033
     * @tc.desc Verify div 0/0 NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart01TestTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new Decimal(0).div(0);
      expect(d.toString()).assertEqual('NaN');
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART01_SUPPLEMENT_TEST_0340
     * @tc.name testDecimalOverviewPart01TestTest034
     * @tc.desc Verify mul Infinity 0 NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart01TestTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new Decimal(Infinity).mul(0);
      expect(d.toString()).assertEqual('NaN');
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART01_SUPPLEMENT_TEST_0350
     * @tc.name testDecimalOverviewPart01TestTest035
     * @tc.desc Verify sqrt NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart01TestTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new Decimal(-1).sqrt();
      expect(d.toString()).assertEqual('NaN');
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART01_SUPPLEMENT_TEST_0360
     * @tc.name testDecimalOverviewPart01TestTest036
     * @tc.desc Verify abs Infinity
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart01TestTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new Decimal(-Infinity).abs();
      expect(d.toString()).assertEqual('Infinity');
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART01_SUPPLEMENT_TEST_0370
     * @tc.name testDecimalOverviewPart01TestTest037
     * @tc.desc Verify add NaN NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart01TestTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new Decimal(NaN).add(1);
      expect(d.toString()).assertEqual('NaN');
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART01_SUPPLEMENT_TEST_0380
     * @tc.name testDecimalOverviewPart01TestTest038
     * @tc.desc Verify negate Infinity -Infinity
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart01TestTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new Decimal(Infinity).negate();
      expect(d.toString()).assertEqual('-Infinity');
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART01_SUPPLEMENT_TEST_0390
     * @tc.name testDecimalOverviewPart01TestTest039
     * @tc.desc Verify pow 0 -1 Infinity
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart01TestTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new Decimal(0).pow(-1);
      expect(d.toString()).assertEqual('Infinity');
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART01_SUPPLEMENT_TEST_0400
     * @tc.name testDecimalOverviewPart01TestTest040
     * @tc.desc Verify isFinite 5 true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart01TestTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new Decimal(5);
      expect(d.isFinite()).assertTrue();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART01_SUPPLEMENT_TEST_0410
     * @tc.name testDecimalOverviewPart01TestTest041
     * @tc.desc Verify isFinite Infinity false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart01TestTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new Decimal(Infinity);
      expect(d.isFinite()).assertFalse();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART01_SUPPLEMENT_TEST_0420
     * @tc.name testDecimalOverviewPart01TestTest042
     * @tc.desc Verify isFinite NaN false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart01TestTest042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new Decimal(NaN);
      expect(d.isFinite()).assertFalse();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART01_SUPPLEMENT_TEST_0430
     * @tc.name testDecimalOverviewPart01TestTest043
     * @tc.desc Verify isInteger 5.0 true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart01TestTest043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new Decimal(5.0);
      expect(d.isInteger()).assertTrue();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART01_SUPPLEMENT_TEST_0440
     * @tc.name testDecimalOverviewPart01TestTest044
     * @tc.desc Verify isInteger 5.5 false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart01TestTest044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new Decimal(5.5);
      expect(d.isInteger()).assertFalse();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART01_SUPPLEMENT_TEST_0450
     * @tc.name testDecimalOverviewPart01TestTest045
     * @tc.desc Verify isInteger 0 true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart01TestTest045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new Decimal(0);
      expect(d.isInteger()).assertTrue();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART01_SUPPLEMENT_TEST_0460
     * @tc.name testDecimalOverviewPart01TestTest046
     * @tc.desc Verify isNaN NaN true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart01TestTest046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new Decimal(NaN);
      expect(d.isNaN()).assertTrue();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART01_SUPPLEMENT_TEST_0470
     * @tc.name testDecimalOverviewPart01TestTest047
     * @tc.desc Verify isNaN 5 false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart01TestTest047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new Decimal(5);
      expect(d.isNaN()).assertFalse();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART01_SUPPLEMENT_TEST_0480
     * @tc.name testDecimalOverviewPart01TestTest048
     * @tc.desc Verify isNegative -0 true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart01TestTest048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new Decimal(-0);
      expect(d.isNegative()).assertTrue();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART01_SUPPLEMENT_TEST_0490
     * @tc.name testDecimalOverviewPart01TestTest049
     * @tc.desc Verify isNegative 0 false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart01TestTest049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new Decimal(0);
      expect(d.isNegative()).assertFalse();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART01_SUPPLEMENT_TEST_0500
     * @tc.name testDecimalOverviewPart01TestTest050
     * @tc.desc Verify isPositive 0 true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart01TestTest050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new Decimal(0);
      expect(d.isPositive()).assertTrue();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART01_SUPPLEMENT_TEST_0510
     * @tc.name testDecimalOverviewPart01TestTest051
     * @tc.desc Verify isPositive -0 false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart01TestTest051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new Decimal(-0);
      expect(d.isPositive()).assertFalse();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART01_SUPPLEMENT_TEST_0520
     * @tc.name testDecimalOverviewPart01TestTest052
     * @tc.desc Verify isZero 0 true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart01TestTest052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new Decimal(0);
      expect(d.isZero()).assertTrue();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART01_SUPPLEMENT_TEST_0530
     * @tc.name testDecimalOverviewPart01TestTest053
     * @tc.desc Verify isZero -0 true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart01TestTest053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new Decimal(-0);
      expect(d.isZero()).assertTrue();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART01_SUPPLEMENT_TEST_0540
     * @tc.name testDecimalOverviewPart01TestTest054
     * @tc.desc Verify isZero 0.1 false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart01TestTest054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new Decimal(0.1);
      expect(d.isZero()).assertFalse();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART01_SUPPLEMENT_TEST_0550
     * @tc.name testDecimalOverviewPart01TestTest055
     * @tc.desc Verify comparedTo 6 -1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart01TestTest055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new Decimal(5);
      expect(d.comparedTo(6)).assertEqual(-1);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART01_SUPPLEMENT_TEST_0560
     * @tc.name testDecimalOverviewPart01TestTest056
     * @tc.desc Verify comparedTo 4 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart01TestTest056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new Decimal(5);
      expect(d.comparedTo(4)).assertEqual(1);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART01_SUPPLEMENT_TEST_0570
     * @tc.name testDecimalOverviewPart01TestTest057
     * @tc.desc Verify comparedTo 5 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart01TestTest057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new Decimal(5);
      expect(d.comparedTo(5)).assertEqual(0);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART01_SUPPLEMENT_TEST_0580
     * @tc.name testDecimalOverviewPart01TestTest058
     * @tc.desc Verify comparedTo NaN NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart01TestTest058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new Decimal(5);
      expect(Number.isNaN(d.comparedTo(NaN))).assertTrue();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART01_SUPPLEMENT_TEST_0590
     * @tc.name testDecimalOverviewPart01TestTest059
     * @tc.desc Verify equals -0 0 true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart01TestTest059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new Decimal(-0);
      expect(d.equals(0)).assertTrue();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART01_SUPPLEMENT_TEST_0600
     * @tc.name testDecimalOverviewPart01TestTest060
     * @tc.desc Verify equals NaN false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart01TestTest060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new Decimal(NaN);
      expect(d.equals(NaN)).assertFalse();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART01_SUPPLEMENT_TEST_0610
     * @tc.name testDecimalOverviewPart01TestTest061
     * @tc.desc Verify greaterThan 4 true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart01TestTest061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new Decimal(5);
      expect(d.greaterThan(4)).assertTrue();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART01_SUPPLEMENT_TEST_0620
     * @tc.name testDecimalOverviewPart01TestTest062
     * @tc.desc Verify greaterThan 5 false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart01TestTest062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new Decimal(5);
      expect(d.greaterThan(5)).assertFalse();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART01_SUPPLEMENT_TEST_0630
     * @tc.name testDecimalOverviewPart01TestTest063
     * @tc.desc Verify lessThan 6 true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart01TestTest063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new Decimal(5);
      expect(d.lessThan(6)).assertTrue();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART01_SUPPLEMENT_TEST_0640
     * @tc.name testDecimalOverviewPart01TestTest064
     * @tc.desc Verify greaterThanOrEqualTo 5 true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart01TestTest064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new Decimal(5);
      expect(d.greaterThanOrEqualTo(5)).assertTrue();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART01_SUPPLEMENT_TEST_0650
     * @tc.name testDecimalOverviewPart01TestTest065
     * @tc.desc Verify lessThanOrEqualTo 5 true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart01TestTest065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new Decimal(5);
      expect(d.lessThanOrEqualTo(5)).assertTrue();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART01_SUPPLEMENT_TEST_0660
     * @tc.name testDecimalOverviewPart01TestTest066
     * @tc.desc Verify sign 5 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart01TestTest066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Decimal.sign(5)).assertEqual(1);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART01_SUPPLEMENT_TEST_0670
     * @tc.name testDecimalOverviewPart01TestTest067
     * @tc.desc Verify sign -5 -1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart01TestTest067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Decimal.sign(-5)).assertEqual(-1);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART01_SUPPLEMENT_TEST_0680
     * @tc.name testDecimalOverviewPart01TestTest068
     * @tc.desc Verify sign 0 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart01TestTest068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Decimal.sign(0)).assertEqual(0);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART01_SUPPLEMENT_TEST_0690
     * @tc.name testDecimalOverviewPart01TestTest069
     * @tc.desc Verify sign NaN NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart01TestTest069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Number.isNaN(Decimal.sign(NaN))).assertTrue();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART01_SUPPLEMENT_TEST_0700
     * @tc.name testDecimalOverviewPart01TestTest070
     * @tc.desc Verify valueOf -0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart01TestTest070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new Decimal(-0);
      expect(d.valueOf()).assertEqual('-0');
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART01_SUPPLEMENT_TEST_0710
     * @tc.name testDecimalOverviewPart01TestTest071
     * @tc.desc Verify valueOf 0 '0'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart01TestTest071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new Decimal(0);
      expect(d.valueOf()).assertEqual('0');
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART01_SUPPLEMENT_TEST_0720
     * @tc.name testDecimalOverviewPart01TestTest072
     * @tc.desc Verify valueOf Infinity 'Infinity'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart01TestTest072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new Decimal(Infinity);
      expect(d.valueOf()).assertEqual('Infinity');
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART01_SUPPLEMENT_TEST_0730
     * @tc.name testDecimalOverviewPart01TestTest073
     * @tc.desc Verify valueOf NaN 'NaN'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart01TestTest073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new Decimal(NaN);
      expect(d.valueOf()).assertEqual('NaN');
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART01_SUPPLEMENT_TEST_0740
     * @tc.name testDecimalOverviewPart01TestTest074
     * @tc.desc Verify toNumber 456.789 number
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart01TestTest074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new Decimal(456.789);
      expect(d.toNumber()).assertEqual(456.789);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART01_SUPPLEMENT_TEST_0750
     * @tc.name testDecimalOverviewPart01TestTest075
     * @tc.desc Verify toNumber 5 5
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart01TestTest075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new Decimal(5);
      expect(d.toNumber()).assertEqual(5);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART01_SUPPLEMENT_TEST_0760
     * @tc.name testDecimalOverviewPart01TestTest076
     * @tc.desc Verify toNumber MAX_SAFE_INTEGER 9007199254740991
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart01TestTest076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new Decimal(Number.MAX_SAFE_INTEGER);
      expect(d.toNumber()).assertEqual(9007199254740991);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART01_SUPPLEMENT_TEST_0770
     * @tc.name testDecimalOverviewPart01TestTest077
     * @tc.desc Verify toNumber 1e-7 1e-7
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart01TestTest077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new Decimal(1e-7);
      expect(d.toNumber()).assertEqual(1e-7);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART01_SUPPLEMENT_TEST_0780
     * @tc.name testDecimalOverviewPart01TestTest078
     * @tc.desc Verify toNumber -0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart01TestTest078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new Decimal(-0);
      expect(1 / d.toNumber()).assertEqual(-Infinity);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART01_SUPPLEMENT_TEST_0790
     * @tc.name testDecimalOverviewPart01TestTest079
     * @tc.desc Verify toString toExpPos 5 750000
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart01TestTest079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ toExpPos: 5 });
      let d = new Decimal(750000);
      expect(d.toString()).assertEqual('7.5e+5');
      Decimal.set({ defaults: true });
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART01_SUPPLEMENT_TEST_0800
     * @tc.name testDecimalOverviewPart01TestTest080
     * @tc.desc Verify toString 0.000000123
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart01TestTest080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new Decimal(0.000000123);
      expect(d.toString()).assertEqual('1.23e-7');
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART01_SUPPLEMENT_TEST_0810
     * @tc.name testDecimalOverviewPart01TestTest081
     * @tc.desc Verify toString toExpPos 123456789
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart01TestTest081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new Decimal(123456789);
      expect(d.toString()).assertEqual('123456789');
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART01_SUPPLEMENT_TEST_0820
     * @tc.name testDecimalOverviewPart01TestTest082
     * @tc.desc Verify toBinary 256
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart01TestTest082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new Decimal(256);
      expect(d.toBinary()).assertEqual('0b100000000');
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART01_SUPPLEMENT_TEST_0830
     * @tc.name testDecimalOverviewPart01TestTest083
     * @tc.desc Verify toBinary 5
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart01TestTest083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new Decimal(5);
      expect(d.toBinary()).assertEqual('0b101');
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART01_SUPPLEMENT_TEST_0840
     * @tc.name testDecimalOverviewPart01TestTest084
     * @tc.desc Verify toBinary 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart01TestTest084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new Decimal(0);
      expect(d.toBinary()).assertEqual('0b0');
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART01_SUPPLEMENT_TEST_0850
     * @tc.name testDecimalOverviewPart01TestTest085
     * @tc.desc Verify toOctal 255
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart01TestTest085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new Decimal(255);
      expect(d.toOctal()).assertEqual('0o377');
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART01_SUPPLEMENT_TEST_0860
     * @tc.name testDecimalOverviewPart01TestTest086
     * @tc.desc Verify toOctal 9
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart01TestTest086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new Decimal(9);
      expect(d.toOctal()).assertEqual('0o11');
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART01_SUPPLEMENT_TEST_0870
     * @tc.name testDecimalOverviewPart01TestTest087
     * @tc.desc Verify toHexadecimal 255
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart01TestTest087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new Decimal(255);
      expect(d.toHexadecimal()).assertEqual('0xff');
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART01_SUPPLEMENT_TEST_0880
     * @tc.name testDecimalOverviewPart01TestTest088
     * @tc.desc Verify toHexadecimal -255
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart01TestTest088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new Decimal(-255);
      expect(d.toHexadecimal()).assertEqual('-0xff');
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART01_SUPPLEMENT_TEST_0890
     * @tc.name testDecimalOverviewPart01TestTest089
     * @tc.desc Verify precision 20 div(3) 20
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart01TestTest089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new Decimal(1).div(3);
      expect(d.toString()).assertEqual('0.33333333333333333333');
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART01_SUPPLEMENT_TEST_0900
     * @tc.name testDecimalOverviewPart01TestTest090
     * @tc.desc Verify set precision 4 div(3) 4
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart01TestTest090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ precision: 4 });
      let d = new Decimal(1).div(3);
      expect(d.toString()).assertEqual('0.3333');
      Decimal.set({ defaults: true });
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART01_SUPPLEMENT_TEST_0910
     * @tc.name testDecimalOverviewPart01TestTest091
     * @tc.desc Verify set precision 5 add(0.5)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart01TestTest091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ precision: 5 });
      let d = new Decimal(1.2345678901234567).add(0.5);
      expect(d.toString()).assertEqual('1.7346');
      Decimal.set({ defaults: true });
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART01_SUPPLEMENT_TEST_0920
     * @tc.name testDecimalOverviewPart01TestTest092
     * @tc.desc Verify set defaults true precision add
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart01TestTest092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ precision: 5 });
      Decimal.set({ defaults: true });
      let d = new Decimal(1.2345678901234567).add(0.5);
      expect(d.toString()).assertEqual('1.7345678901234567');
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART01_SUPPLEMENT_TEST_0930
     * @tc.name testDecimalOverviewPart01TestTest093
     * @tc.desc Verify rounding 4 precision 1 1.5 2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart01TestTest093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ precision: 1, rounding: 4 });
      let d = new Decimal(1.5).add(0);
      expect(d.toString()).assertEqual('2');
      Decimal.set({ defaults: true });
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART01_SUPPLEMENT_TEST_0940
     * @tc.name testDecimalOverviewPart01TestTest094
     * @tc.desc Verify rounding 1 precision 1 1.5 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart01TestTest094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ precision: 1, rounding: 1 });
      let d = new Decimal(1.5).add(0);
      expect(d.toString()).assertEqual('1');
      Decimal.set({ defaults: true });
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART01_SUPPLEMENT_TEST_0950
     * @tc.name testDecimalOverviewPart01TestTest095
     * @tc.desc Verify rounding 0 precision 4 div(3) 0.3334
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart01TestTest095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ precision: 4, rounding: 0 });
      let d = new Decimal(1).div(3);
      expect(d.toString()).assertEqual('0.3334');
      Decimal.set({ defaults: true });
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART01_SUPPLEMENT_TEST_0960
     * @tc.name testDecimalOverviewPart01TestTest096
     * @tc.desc Verify rounding 1 precision 4 div(3) 0.3333
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart01TestTest096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ precision: 4, rounding: 1 });
      let d = new Decimal(1).div(3);
      expect(d.toString()).assertEqual('0.3333');
      Decimal.set({ defaults: true });
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART01_SUPPLEMENT_TEST_0970
     * @tc.name testDecimalOverviewPart01TestTest097
     * @tc.desc Verify set maxE 4 number 100000 Infinity
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart01TestTest097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ maxE: 4 });
      let d = new Decimal(100000);
      expect(d.toString()).assertEqual('Infinity');
      Decimal.set({ defaults: true });
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART01_SUPPLEMENT_TEST_0980
     * @tc.name testDecimalOverviewPart01TestTest098
     * @tc.desc Verify set maxE 6 number 999999
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart01TestTest098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ maxE: 6 });
      let d = new Decimal(999999);
      expect(d.toString()).assertEqual('999999');
      Decimal.set({ defaults: true });
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART01_SUPPLEMENT_TEST_0990
     * @tc.name testDecimalOverviewPart01TestTest099
     * @tc.desc Verify set minE -6 number 0.0000001
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart01TestTest099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ minE: -6 });
      let d = new Decimal(0.0000001);
      expect(d.toString()).assertEqual('0');
      Decimal.set({ defaults: true });
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART01_SUPPLEMENT_TEST_1000
     * @tc.name testDecimalOverviewPart01TestTest100
     * @tc.desc Verify set minE -5 number 0.00001
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart01TestTest100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ minE: -5 });
      let d = new Decimal(0.00001);
      expect(d.toString()).assertEqual('0.00001');
      Decimal.set({ defaults: true });
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART01_SUPPLEMENT_TEST_1010
     * @tc.name testDecimalOverviewPart01TestTest101
     * @tc.desc Verify maxE Infinity toNumber Infinity
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart01TestTest101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ maxE: 4 });
      let d = new Decimal(100000);
      expect(d.toNumber()).assertEqual(Infinity);
      Decimal.set({ defaults: true });
    });
  
  });

}
