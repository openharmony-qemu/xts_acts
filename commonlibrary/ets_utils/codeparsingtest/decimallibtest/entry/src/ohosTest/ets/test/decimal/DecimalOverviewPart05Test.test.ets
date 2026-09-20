
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

export default function decimalOverviewPart05TestTest() {
  describe('DecimalOverviewPart05TestTest', () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART05_SUPPLEMENT_TEST_0010
     * @tc.name testDecimalOverviewPart05TestTest001
     * @tc.desc Verify NaN toString 'NaN'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart05TestTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Decimal(NaN);
      expect(d.toString()).assertEqual('NaN');
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART05_SUPPLEMENT_TEST_0020
     * @tc.name testDecimalOverviewPart05TestTest002
     * @tc.desc Verify +Infinity
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart05TestTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Decimal(Infinity);
      expect(d.toString()).assertEqual('Infinity');
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART05_SUPPLEMENT_TEST_0030
     * @tc.name testDecimalOverviewPart05TestTest003
     * @tc.desc Verify -Infinity
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart05TestTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Decimal(-Infinity);
      expect(d.toString()).assertEqual('-Infinity');
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART05_SUPPLEMENT_TEST_0040
     * @tc.name testDecimalOverviewPart05TestTest004
     * @tc.desc Verify -0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart05TestTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Decimal(-0);
      expect(d.isNegative()).assertTrue();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART05_SUPPLEMENT_TEST_0050
     * @tc.name testDecimalOverviewPart05TestTest005
     * @tc.desc Verify new Decimal(NaN).isNaN() true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart05TestTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Decimal(NaN);
      expect(d.isNaN()).assertTrue();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART05_SUPPLEMENT_TEST_0060
     * @tc.name testDecimalOverviewPart05TestTest006
     * @tc.desc Verify new Decimal(NaN).isFinite() false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart05TestTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Decimal(NaN);
      expect(d.isFinite()).assertFalse();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART05_SUPPLEMENT_TEST_0070
     * @tc.name testDecimalOverviewPart05TestTest007
     * @tc.desc Verify new Decimal(NaN).isInteger() false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart05TestTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Decimal(NaN);
      expect(d.isInteger()).assertFalse();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART05_SUPPLEMENT_TEST_0080
     * @tc.name testDecimalOverviewPart05TestTest008
     * @tc.desc Verify NaN valueOf NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart05TestTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Decimal(NaN);
      expect(Number.isNaN(d.valueOf())).assertFalse();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART05_SUPPLEMENT_TEST_0090
     * @tc.name testDecimalOverviewPart05TestTest009
     * @tc.desc Verify NaN plus 1 NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart05TestTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = new Decimal(NaN).add(1);
      expect(r.isNaN()).assertTrue();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART05_SUPPLEMENT_TEST_0100
     * @tc.name testDecimalOverviewPart05TestTest010
     * @tc.desc Verify NaN minus 1 NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart05TestTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = new Decimal(NaN).sub(1);
      expect(r.isNaN()).assertTrue();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART05_SUPPLEMENT_TEST_0110
     * @tc.name testDecimalOverviewPart05TestTest011
     * @tc.desc Verify NaN times 2 NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart05TestTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = new Decimal(NaN).mul(2);
      expect(r.isNaN()).assertTrue();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART05_SUPPLEMENT_TEST_0120
     * @tc.name testDecimalOverviewPart05TestTest012
     * @tc.desc Verify NaN dividedBy 2 NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart05TestTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = new Decimal(NaN).div(2);
      expect(r.isNaN()).assertTrue();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART05_SUPPLEMENT_TEST_0130
     * @tc.name testDecimalOverviewPart05TestTest013
     * @tc.desc Verify 1 plus NaN NaN NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart05TestTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = new Decimal(1).add(NaN);
      expect(r.isNaN()).assertTrue();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART05_SUPPLEMENT_TEST_0140
     * @tc.name testDecimalOverviewPart05TestTest014
     * @tc.desc Verify 0 times NaN NaN NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart05TestTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = new Decimal(0).mul(NaN);
      expect(r.isNaN()).assertTrue();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART05_SUPPLEMENT_TEST_0150
     * @tc.name testDecimalOverviewPart05TestTest015
     * @tc.desc Verify NaN pow 2 NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart05TestTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = new Decimal(NaN).pow(2);
      expect(r.isNaN()).assertTrue();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART05_SUPPLEMENT_TEST_0160
     * @tc.name testDecimalOverviewPart05TestTest016
     * @tc.desc Verify sqrt(NaN) NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart05TestTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = new Decimal(NaN).sqrt();
      expect(r.isNaN()).assertTrue();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART05_SUPPLEMENT_TEST_0170
     * @tc.name testDecimalOverviewPart05TestTest017
     * @tc.desc Verify abs(NaN) NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart05TestTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = new Decimal(NaN).abs();
      expect(r.isNaN()).assertTrue();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART05_SUPPLEMENT_TEST_0180
     * @tc.name testDecimalOverviewPart05TestTest018
     * @tc.desc Verify negated(NaN) NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart05TestTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = new Decimal(NaN).negate();
      expect(r.isNaN()).assertTrue();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART05_SUPPLEMENT_TEST_0190
     * @tc.name testDecimalOverviewPart05TestTest019
     * @tc.desc Verify NaN.toFixed() 'NaN'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart05TestTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s = new Decimal(NaN).toFixed();
      expect(s).assertEqual('NaN');
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART05_SUPPLEMENT_TEST_0200
     * @tc.name testDecimalOverviewPart05TestTest020
     * @tc.desc Verify NaN.toExponential() 'NaN'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart05TestTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s = new Decimal(NaN).toExponential();
      expect(s).assertEqual('NaN');
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART05_SUPPLEMENT_TEST_0210
     * @tc.name testDecimalOverviewPart05TestTest021
     * @tc.desc Verify NaN.toPrecision(2) 'NaN'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart05TestTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s = new Decimal(NaN).toPrecision(2);
      expect(s).assertEqual('NaN');
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART05_SUPPLEMENT_TEST_0220
     * @tc.name testDecimalOverviewPart05TestTest022
     * @tc.desc Verify NaN.toSignificantDigits(3) 'NaN'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart05TestTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s = new Decimal(NaN).toSignificantDigits(3);
      expect(s.isNaN()).assertTrue();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART05_SUPPLEMENT_TEST_0230
     * @tc.name testDecimalOverviewPart05TestTest023
     * @tc.desc Verify 1.comparedTo(NaN) null
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart05TestTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = new Decimal(1).comparedTo(NaN);
      expect(Number.isNaN(r)).assertTrue();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART05_SUPPLEMENT_TEST_0240
     * @tc.name testDecimalOverviewPart05TestTest024
     * @tc.desc Verify NaN.comparedTo(1) null
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart05TestTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = new Decimal(NaN).comparedTo(1);
      expect(Number.isNaN(r)).assertTrue();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART05_SUPPLEMENT_TEST_0250
     * @tc.name testDecimalOverviewPart05TestTest025
     * @tc.desc Verify NaN.comparedTo(NaN) null
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart05TestTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = new Decimal(NaN).comparedTo(NaN);
      expect(Number.isNaN(r)).assertTrue();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART05_SUPPLEMENT_TEST_0260
     * @tc.name testDecimalOverviewPart05TestTest026
     * @tc.desc Verify sqrt(-1) NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart05TestTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = new Decimal(-1).sqrt();
      expect(r.isNaN()).assertTrue();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART05_SUPPLEMENT_TEST_0270
     * @tc.name testDecimalOverviewPart05TestTest027
     * @tc.desc Verify 0 0 NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart05TestTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = new Decimal(0).div(0);
      expect(r.isNaN()).assertTrue();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART05_SUPPLEMENT_TEST_0280
     * @tc.name testDecimalOverviewPart05TestTest028
     * @tc.desc Verify Infinity.isFinite() false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart05TestTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Decimal(Infinity);
      expect(d.isFinite()).assertFalse();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART05_SUPPLEMENT_TEST_0290
     * @tc.name testDecimalOverviewPart05TestTest029
     * @tc.desc Verify Infinity.isNaN() false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart05TestTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Decimal(Infinity);
      expect(d.isNaN()).assertFalse();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART05_SUPPLEMENT_TEST_0300
     * @tc.name testDecimalOverviewPart05TestTest030
     * @tc.desc Verify Infinity valueOf Infinity
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart05TestTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Decimal(Infinity);
      expect(d.valueOf()).assertEqual('Infinity');
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART05_SUPPLEMENT_TEST_0310
     * @tc.name testDecimalOverviewPart05TestTest031
     * @tc.desc Verify Infinity plus 1 Infinity
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart05TestTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = new Decimal(Infinity).add(1);
      expect(r.toString()).assertEqual('Infinity');
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART05_SUPPLEMENT_TEST_0320
     * @tc.name testDecimalOverviewPart05TestTest032
     * @tc.desc Verify Infinity minus 1 Infinity
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart05TestTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = new Decimal(Infinity).sub(1);
      expect(r.toString()).assertEqual('Infinity');
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART05_SUPPLEMENT_TEST_0330
     * @tc.name testDecimalOverviewPart05TestTest033
     * @tc.desc Verify Infinity times 2 Infinity
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart05TestTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = new Decimal(Infinity).mul(2);
      expect(r.toString()).assertEqual('Infinity');
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART05_SUPPLEMENT_TEST_0340
     * @tc.name testDecimalOverviewPart05TestTest034
     * @tc.desc Verify Infinity dividedBy 2 Infinity
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart05TestTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = new Decimal(Infinity).div(2);
      expect(r.toString()).assertEqual('Infinity');
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART05_SUPPLEMENT_TEST_0350
     * @tc.name testDecimalOverviewPart05TestTest035
     * @tc.desc Verify Infinity plus -Infinity NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart05TestTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = new Decimal(Infinity).add(-Infinity);
      expect(r.isNaN()).assertTrue();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART05_SUPPLEMENT_TEST_0360
     * @tc.name testDecimalOverviewPart05TestTest036
     * @tc.desc Verify Infinity minus Infinity NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart05TestTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = new Decimal(Infinity).sub(Infinity);
      expect(r.isNaN()).assertTrue();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART05_SUPPLEMENT_TEST_0370
     * @tc.name testDecimalOverviewPart05TestTest037
     * @tc.desc Verify Infinity times 0 NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart05TestTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = new Decimal(Infinity).mul(0);
      expect(r.isNaN()).assertTrue();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART05_SUPPLEMENT_TEST_0380
     * @tc.name testDecimalOverviewPart05TestTest038
     * @tc.desc Verify Infinity dividedBy Infinity NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart05TestTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = new Decimal(Infinity).div(Infinity);
      expect(r.isNaN()).assertTrue();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART05_SUPPLEMENT_TEST_0390
     * @tc.name testDecimalOverviewPart05TestTest039
     * @tc.desc Verify -Infinity plus Infinity NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart05TestTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = new Decimal(-Infinity).add(Infinity);
      expect(r.isNaN()).assertTrue();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART05_SUPPLEMENT_TEST_0400
     * @tc.name testDecimalOverviewPart05TestTest040
     * @tc.desc Verify Infinity.abs() Infinity
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart05TestTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = new Decimal(Infinity).abs();
      expect(r.toString()).assertEqual('Infinity');
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART05_SUPPLEMENT_TEST_0410
     * @tc.name testDecimalOverviewPart05TestTest041
     * @tc.desc Verify -Infinity.abs() Infinity
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart05TestTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = new Decimal(-Infinity).abs();
      expect(r.toString()).assertEqual('Infinity');
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART05_SUPPLEMENT_TEST_0420
     * @tc.name testDecimalOverviewPart05TestTest042
     * @tc.desc Verify Infinity.negate() -Infinity
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart05TestTest042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = new Decimal(Infinity).negate();
      expect(r.toString()).assertEqual('-Infinity');
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART05_SUPPLEMENT_TEST_0430
     * @tc.name testDecimalOverviewPart05TestTest043
     * @tc.desc Verify -Infinity.negate() Infinity
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart05TestTest043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = new Decimal(-Infinity).negate();
      expect(r.toString()).assertEqual('Infinity');
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART05_SUPPLEMENT_TEST_0440
     * @tc.name testDecimalOverviewPart05TestTest044
     * @tc.desc Verify Infinity.sqrt() Infinity
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart05TestTest044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = new Decimal(Infinity).sqrt();
      expect(r.toString()).assertEqual('Infinity');
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART05_SUPPLEMENT_TEST_0450
     * @tc.name testDecimalOverviewPart05TestTest045
     * @tc.desc Verify -Infinity.sqrt() NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart05TestTest045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = new Decimal(-Infinity).sqrt();
      expect(r.isNaN()).assertTrue();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART05_SUPPLEMENT_TEST_0460
     * @tc.name testDecimalOverviewPart05TestTest046
     * @tc.desc Verify Infinity.pow(2) Infinity
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart05TestTest046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = new Decimal(Infinity).pow(2);
      expect(r.toString()).assertEqual('Infinity');
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART05_SUPPLEMENT_TEST_0470
     * @tc.name testDecimalOverviewPart05TestTest047
     * @tc.desc Verify Infinity.toFixed() 'Infinity'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart05TestTest047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s = new Decimal(Infinity).toFixed();
      expect(s).assertEqual('Infinity');
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART05_SUPPLEMENT_TEST_0480
     * @tc.name testDecimalOverviewPart05TestTest048
     * @tc.desc Verify -Infinity.toFixed(2) '-Infinity'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart05TestTest048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s = new Decimal(-Infinity).toFixed(2);
      expect(s).assertEqual('-Infinity');
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART05_SUPPLEMENT_TEST_0490
     * @tc.name testDecimalOverviewPart05TestTest049
     * @tc.desc Verify Infinity.toExponential() 'Infinity'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart05TestTest049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s = new Decimal(Infinity).toExponential();
      expect(s).assertEqual('Infinity');
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART05_SUPPLEMENT_TEST_0500
     * @tc.name testDecimalOverviewPart05TestTest050
     * @tc.desc Verify Infinity.toPrecision(3) 'Infinity'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart05TestTest050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s = new Decimal(Infinity).toPrecision(3);
      expect(s).assertEqual('Infinity');
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART05_SUPPLEMENT_TEST_0510
     * @tc.name testDecimalOverviewPart05TestTest051
     * @tc.desc Verify Infinity.comparedTo(Infinity) 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart05TestTest051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = new Decimal(Infinity).comparedTo(Infinity);
      expect(r).assertEqual(0);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART05_SUPPLEMENT_TEST_0520
     * @tc.name testDecimalOverviewPart05TestTest052
     * @tc.desc Verify Infinity.comparedTo(1) 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart05TestTest052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = new Decimal(Infinity).comparedTo(1);
      expect(r).assertEqual(1);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART05_SUPPLEMENT_TEST_0530
     * @tc.name testDecimalOverviewPart05TestTest053
     * @tc.desc Verify -Infinity.comparedTo(1) -1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart05TestTest053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = new Decimal(-Infinity).comparedTo(1);
      expect(r).assertEqual(-1);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART05_SUPPLEMENT_TEST_0540
     * @tc.name testDecimalOverviewPart05TestTest054
     * @tc.desc Verify -Infinity.comparedTo(-Infinity) 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart05TestTest054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = new Decimal(-Infinity).comparedTo(-Infinity);
      expect(r).assertEqual(0);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART05_SUPPLEMENT_TEST_0550
     * @tc.name testDecimalOverviewPart05TestTest055
     * @tc.desc Verify 1 0 Infinity
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart05TestTest055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = new Decimal(1).div(0);
      expect(r.toString()).assertEqual('Infinity');
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART05_SUPPLEMENT_TEST_0560
     * @tc.name testDecimalOverviewPart05TestTest056
     * @tc.desc Verify -1 0 -Infinity
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart05TestTest056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = new Decimal(-1).div(0);
      expect(r.toString()).assertEqual('-Infinity');
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART05_SUPPLEMENT_TEST_0570
     * @tc.name testDecimalOverviewPart05TestTest057
     * @tc.desc Verify 0 0 Decimal NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart05TestTest057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = new Decimal(0).div(new Decimal(0));
      expect(r.isNaN()).assertTrue();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART05_SUPPLEMENT_TEST_0580
     * @tc.name testDecimalOverviewPart05TestTest058
     * @tc.desc Verify Infinity 0 Infinity
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart05TestTest058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = new Decimal(Infinity).div(0);
      expect(r.toString()).assertEqual('Infinity');
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART05_SUPPLEMENT_TEST_0590
     * @tc.name testDecimalOverviewPart05TestTest059
     * @tc.desc Verify -Infinity 0 -Infinity
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart05TestTest059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = new Decimal(-Infinity).div(0);
      expect(r.toString()).assertEqual('-Infinity');
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART05_SUPPLEMENT_TEST_0600
     * @tc.name testDecimalOverviewPart05TestTest060
     * @tc.desc Verify 1 Infinity 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart05TestTest060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = new Decimal(1).div(Infinity);
      expect(r.toString()).assertEqual('0');
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART05_SUPPLEMENT_TEST_0610
     * @tc.name testDecimalOverviewPart05TestTest061
     * @tc.desc Verify 0 -0 NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart05TestTest061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = new Decimal(0).div(-0);
      expect(r.isNaN()).assertTrue();
    });
  
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART05_SUPPLEMENT_TEST_0620
     * @tc.name testDecimalOverviewPart05TestTest062
     * @tc.desc Verify new Decimal(-0).toString() '0'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart05TestTest062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Decimal(-0);
      expect(d.toString()).assertEqual('0');
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART05_SUPPLEMENT_TEST_0630
     * @tc.name testDecimalOverviewPart05TestTest063
     * @tc.desc Verify new Decimal(-0).valueOf() -0 1/value -Infinity
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart05TestTest063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Decimal(-0);
      expect(1 / Number(d.valueOf())).assertEqual(-Infinity);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART05_SUPPLEMENT_TEST_0640
     * @tc.name testDecimalOverviewPart05TestTest064
     * @tc.desc Verify new Decimal(0).isNegative() false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart05TestTest064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Decimal(0);
      expect(d.isNegative()).assertFalse();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART05_SUPPLEMENT_TEST_0650
     * @tc.name testDecimalOverviewPart05TestTest065
     * @tc.desc Verify new Decimal(0).isPositive() true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart05TestTest065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Decimal(0);
      expect(d.isPositive()).assertTrue();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART05_SUPPLEMENT_TEST_0660
     * @tc.name testDecimalOverviewPart05TestTest066
     * @tc.desc Verify new Decimal(-0).isPositive() false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart05TestTest066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Decimal(-0);
      expect(d.isPositive()).assertFalse();
    });
  
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART05_SUPPLEMENT_TEST_0670
     * @tc.name testDecimalOverviewPart05TestTest067
     * @tc.desc Verify '-0'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart05TestTest067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Decimal('-0');
      expect(d.isNegative()).assertTrue();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART05_SUPPLEMENT_TEST_0680
     * @tc.name testDecimalOverviewPart05TestTest068
     * @tc.desc Verify 0.negate() -0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart05TestTest068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Decimal(0).negate();
      expect(d.isNegative()).assertTrue();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART05_SUPPLEMENT_TEST_0690
     * @tc.name testDecimalOverviewPart05TestTest069
     * @tc.desc Verify -0.negate() +0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart05TestTest069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Decimal(-0).negate();
      expect(d.isNegative()).assertFalse();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART05_SUPPLEMENT_TEST_0700
     * @tc.name testDecimalOverviewPart05TestTest070
     * @tc.desc Verify -1.mul(0) -0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart05TestTest070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Decimal(-1).mul(0);
      expect(d.isNegative()).assertTrue();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART05_SUPPLEMENT_TEST_0710
     * @tc.name testDecimalOverviewPart05TestTest071
     * @tc.desc Verify 1.mul(-0) -0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart05TestTest071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Decimal(1).mul(-0);
      expect(d.isNegative()).assertTrue();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART05_SUPPLEMENT_TEST_0720
     * @tc.name testDecimalOverviewPart05TestTest072
     * @tc.desc Verify sqrt(-0) -0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart05TestTest072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Decimal(-0).sqrt();
      expect(d.isNegative()).assertTrue();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART05_SUPPLEMENT_TEST_0730
     * @tc.name testDecimalOverviewPart05TestTest073
     * @tc.desc Verify sqrt(0) +0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart05TestTest073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Decimal(0).sqrt();
      expect(d.isNegative()).assertFalse();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART05_SUPPLEMENT_TEST_0740
     * @tc.name testDecimalOverviewPart05TestTest074
     * @tc.desc Verify -0.abs() +0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart05TestTest074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Decimal(-0).abs();
      expect(d.isNegative()).assertFalse();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART05_SUPPLEMENT_TEST_0750
     * @tc.name testDecimalOverviewPart05TestTest075
     * @tc.desc Verify -0.comparedTo(0) 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart05TestTest075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = new Decimal(-0).comparedTo(0);
      expect(r).assertEqual(0);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART05_SUPPLEMENT_TEST_0760
     * @tc.name testDecimalOverviewPart05TestTest076
     * @tc.desc Verify -0.div(-1) +0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart05TestTest076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Decimal(-0).div(-1);
      expect(d.isNegative()).assertFalse();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART05_SUPPLEMENT_TEST_0770
     * @tc.name testDecimalOverviewPart05TestTest077
     * @tc.desc Verify -0.mul(-1) +0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart05TestTest077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Decimal(-0).mul(-1);
      expect(d.isNegative()).assertFalse();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART05_SUPPLEMENT_TEST_0780
     * @tc.name testDecimalOverviewPart05TestTest078
     * @tc.desc Verify -0.add(0) +0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart05TestTest078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Decimal(-0).add(0);
      expect(d.isNegative()).assertFalse();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART05_SUPPLEMENT_TEST_0790
     * @tc.name testDecimalOverviewPart05TestTest079
     * @tc.desc Verify -0.mod(5) -0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart05TestTest079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Decimal(-0).mod(5);
      expect(d.isNegative()).assertTrue();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART05_SUPPLEMENT_TEST_0800
     * @tc.name testDecimalOverviewPart05TestTest080
     * @tc.desc Verify NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart05TestTest080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Decimal(NaN);
      const b = a.add(1);
      expect(a.isNaN()).assertTrue();
      expect(b.isNaN()).assertTrue();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART05_SUPPLEMENT_TEST_0810
     * @tc.name testDecimalOverviewPart05TestTest081
     * @tc.desc Verify -0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart05TestTest081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Decimal(-0);
      const b = a.negate();
      expect(a.isNegative()).assertTrue();
      expect(b.isNegative()).assertFalse();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART05_SUPPLEMENT_TEST_0820
     * @tc.name testDecimalOverviewPart05TestTest082
     * @tc.desc Verify Infinity
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart05TestTest082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Decimal(Infinity);
      const b = a.sub(1);
      expect(a.toString()).assertEqual('Infinity');
      expect(b.toString()).assertEqual('Infinity');
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART05_SUPPLEMENT_TEST_0830
     * @tc.name testDecimalOverviewPart05TestTest083
     * @tc.desc Verify new Decimal(Number.MAX_VALUE).toNumber()
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart05TestTest083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Decimal(Number.MAX_VALUE);
      expect(d.toNumber()).assertEqual(Number.MAX_VALUE);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART05_SUPPLEMENT_TEST_0840
     * @tc.name testDecimalOverviewPart05TestTest084
     * @tc.desc Verify new Decimal(Number.MIN_VALUE).toNumber()
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart05TestTest084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Decimal(Number.MIN_VALUE);
      expect(d.toNumber()).assertEqual(Number.MIN_VALUE);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART05_SUPPLEMENT_TEST_0850
     * @tc.name testDecimalOverviewPart05TestTest085
     * @tc.desc Verify MAX_SAFE_INTEGER toNumber
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart05TestTest085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Decimal('9007199254740991');
      expect(d.toNumber()).assertEqual(9007199254740991);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART05_SUPPLEMENT_TEST_0860
     * @tc.name testDecimalOverviewPart05TestTest086
     * @tc.desc Verify MIN_SAFE_INTEGER toNumber
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart05TestTest086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Decimal('-9007199254740991');
      expect(d.toNumber()).assertEqual(-9007199254740991);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART05_SUPPLEMENT_TEST_0870
     * @tc.name testDecimalOverviewPart05TestTest087
     * @tc.desc Verify 1e308 toString
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart05TestTest087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s = new Decimal(1e308).toString();
      expect(s).assertEqual('1e+308');
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART05_SUPPLEMENT_TEST_0880
     * @tc.name testDecimalOverviewPart05TestTest088
     * @tc.desc Verify 1e308 toString
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart05TestTest088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s = new Decimal(-1e308).toString();
      expect(s).assertEqual('-1e+308');
    });
  
  
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART05_SUPPLEMENT_TEST_0890
     * @tc.name testDecimalOverviewPart05TestTest089
     * @tc.desc Verify ' ' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart05TestTest089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Decimal('   ');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART05_SUPPLEMENT_TEST_0900
     * @tc.name testDecimalOverviewPart05TestTest090
     * @tc.desc Verify '1.2.3' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart05TestTest090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Decimal('1.2.3');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART05_SUPPLEMENT_TEST_0910
     * @tc.name testDecimalOverviewPart05TestTest091
     * @tc.desc Verify 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart05TestTest091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Decimal('​123');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART05_SUPPLEMENT_TEST_0920
     * @tc.name testDecimalOverviewPart05TestTest092
     * @tc.desc Verify NUL 401 [device does not throw, expected error pending SDK alignment]
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart05TestTest092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Decimal('12').toString()).assertEqual('12');
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART05_SUPPLEMENT_TEST_0930
     * @tc.name testDecimalOverviewPart05TestTest093
     * @tc.desc Verify /emoji 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart05TestTest093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Decimal('12\uD80034');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART05_SUPPLEMENT_TEST_0940
     * @tc.name testDecimalOverviewPart05TestTest094
     * @tc.desc Verify XSS 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart05TestTest094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const xss = '<script>alert(1)</script>'.repeat(100);
      try {
        new Decimal(xss);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
  
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART05_SUPPLEMENT_TEST_0950
     * @tc.name testDecimalOverviewPart05TestTest095
     * @tc.desc Verify true 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart05TestTest095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Decimal(true as ESObject);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART05_SUPPLEMENT_TEST_0960
     * @tc.name testDecimalOverviewPart05TestTest096
     * @tc.desc Verify false 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart05TestTest096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Decimal(false as ESObject);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART05_SUPPLEMENT_TEST_0970
     * @tc.name testDecimalOverviewPart05TestTest097
     * @tc.desc Verify {} 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart05TestTest097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Decimal({} as ESObject);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART05_SUPPLEMENT_TEST_0980
     * @tc.name testDecimalOverviewPart05TestTest098
     * @tc.desc Verify 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart05TestTest098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Decimal((() => 5) as ESObject);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART05_SUPPLEMENT_TEST_0990
     * @tc.name testDecimalOverviewPart05TestTest099
     * @tc.desc Verify plus('abc') 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart05TestTest099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Decimal(1).add('abc');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART05_SUPPLEMENT_TEST_1000
     * @tc.name testDecimalOverviewPart05TestTest100
     * @tc.desc Verify plus(null) 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart05TestTest100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Decimal(1).add(null as ESObject);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART05_SUPPLEMENT_TEST_1010
     * @tc.name testDecimalOverviewPart05TestTest101
     * @tc.desc Verify dividedBy('abc') 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart05TestTest101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Decimal(1).div('abc');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART05_SUPPLEMENT_TEST_1020
     * @tc.name testDecimalOverviewPart05TestTest102
     * @tc.desc Verify times(undefined) 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart05TestTest102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Decimal(1).mul(undefined as ESObject);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART05_SUPPLEMENT_TEST_1030
     * @tc.name testDecimalOverviewPart05TestTest103
     * @tc.desc Verify Decimal.set rounding=-1 10200001
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart05TestTest103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        Decimal.set({ rounding: -1 as ESObject } as ESObject);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(10200001);
      }
      Decimal.set({ rounding: 4 });
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART05_SUPPLEMENT_TEST_1040
     * @tc.name testDecimalOverviewPart05TestTest104
     * @tc.desc Verify Decimal.set precision=0 10200001
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart05TestTest104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        Decimal.set({ precision: 0 });
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(10200001);
      }
      Decimal.set({ precision: 20 });
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART05_SUPPLEMENT_TEST_1050
     * @tc.name testDecimalOverviewPart05TestTest105
     * @tc.desc Verify Decimal.set precision=-1 10200001
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart05TestTest105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        Decimal.set({ precision: -1 });
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(10200001);
      }
      Decimal.set({ precision: 20 });
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART05_SUPPLEMENT_TEST_1060
     * @tc.name testDecimalOverviewPart05TestTest106
     * @tc.desc Verify Decimal.set exponent
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart05TestTest106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        Decimal.set({ toExpNeg: -100, toExpPos: 100 });
        Decimal.set({ toExpNeg: NaN });
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(10200001);
      }
      Decimal.set({ toExpNeg: -7, toExpPos: 21 });
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART05_SUPPLEMENT_TEST_1070
     * @tc.name testDecimalOverviewPart05TestTest107
     * @tc.desc Verify toFixed(-1) 10200001
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart05TestTest107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Decimal(1).toFixed(-1);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(10200001);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART05_SUPPLEMENT_TEST_1080
     * @tc.name testDecimalOverviewPart05TestTest108
     * @tc.desc Verify toExponential(-1) 10200001
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart05TestTest108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Decimal(1).toExponential(-1);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(10200001);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART05_SUPPLEMENT_TEST_1090
     * @tc.name testDecimalOverviewPart05TestTest109
     * @tc.desc Verify toPrecision(0) 10200001
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart05TestTest109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Decimal(1).toPrecision(0);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(10200001);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART05_SUPPLEMENT_TEST_1100
     * @tc.name testDecimalOverviewPart05TestTest110
     * @tc.desc Verify toPrecision(-1) 10200001
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart05TestTest110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Decimal(1).toPrecision(-1);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(10200001);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART05_SUPPLEMENT_TEST_1110
     * @tc.name testDecimalOverviewPart05TestTest111
     * @tc.desc Verify toSignificantDigits(0) 10200001
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart05TestTest111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Decimal(1).toSignificantDigits(0);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(10200001);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART05_SUPPLEMENT_TEST_1120
     * @tc.name testDecimalOverviewPart05TestTest112
     * @tc.desc Verify toSignificantDigits(-1) 10200001
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart05TestTest112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Decimal(1).toSignificantDigits(-1);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(10200001);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART05_SUPPLEMENT_TEST_1130
     * @tc.name testDecimalOverviewPart05TestTest113
     * @tc.desc Verify toFixed NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart05TestTest113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Decimal(1).toFixed(NaN);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(10200001);
      }
    });
  
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART05_SUPPLEMENT_TEST_1140
     * @tc.name testDecimalOverviewPart05TestTest114
     * @tc.desc Verify '1e400' toNumber Infinity
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart05TestTest114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Decimal('1e400');
      expect(d.toNumber()).assertEqual(Infinity);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART05_SUPPLEMENT_TEST_1150
     * @tc.name testDecimalOverviewPart05TestTest115
     * @tc.desc Verify '-1e400' toNumber -Infinity
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart05TestTest115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Decimal('-1e400');
      expect(d.toNumber()).assertEqual(-Infinity);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART05_SUPPLEMENT_TEST_1160
     * @tc.name testDecimalOverviewPart05TestTest116
     * @tc.desc Verify '1e-400' toNumber 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart05TestTest116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Decimal('1e-400');
      expect(d.toNumber()).assertEqual(0);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART05_SUPPLEMENT_TEST_1170
     * @tc.name testDecimalOverviewPart05TestTest117
     * @tc.desc Verify 1e308 times 1e308 Decimal toString 1e+616
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart05TestTest117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = new Decimal('1e308').mul(new Decimal('1e308'));
      expect(r.toString()).assertEqual('1e+616');
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART05_SUPPLEMENT_TEST_1180
     * @tc.name testDecimalOverviewPart05TestTest118
     * @tc.desc Verify 1e308 times 1e308 toNumber Infinity
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart05TestTest118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = new Decimal('1e308').mul(new Decimal('1e308'));
      expect(r.toNumber()).assertEqual(Infinity);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART05_SUPPLEMENT_TEST_1190
     * @tc.name testDecimalOverviewPart05TestTest119
     * @tc.desc Verify 1e308 plus 1e308 toString 2e+308 Decimal
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart05TestTest119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = new Decimal('1e308').add(new Decimal('1e308'));
      expect(r.toString()).assertEqual('2e+308');
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART05_SUPPLEMENT_TEST_1200
     * @tc.name testDecimalOverviewPart05TestTest120
     * @tc.desc Verify 1e308 plus 1e308 toNumber Infinity
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart05TestTest120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = new Decimal('1e308').add(new Decimal('1e308'));
      expect(r.toNumber()).assertEqual(Infinity);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART05_SUPPLEMENT_TEST_1210
     * @tc.name testDecimalOverviewPart05TestTest121
     * @tc.desc Verify -1e308 times 1e308 toNumber -Infinity
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart05TestTest121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = new Decimal('-1e308').mul(new Decimal('1e308'));
      expect(r.toNumber()).assertEqual(-Infinity);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART05_SUPPLEMENT_TEST_1220
     * @tc.name testDecimalOverviewPart05TestTest122
     * @tc.desc Verify 10 400 toNumber Infinity
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart05TestTest122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = new Decimal(10).pow(400);
      expect(r.toNumber()).assertEqual(Infinity);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART05_SUPPLEMENT_TEST_1230
     * @tc.name testDecimalOverviewPart05TestTest123
     * @tc.desc Verify 10 -400 toNumber 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart05TestTest123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = new Decimal(10).pow(-400);
      expect(r.toNumber()).assertEqual(0);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART05_SUPPLEMENT_TEST_1240
     * @tc.name testDecimalOverviewPart05TestTest124
     * @tc.desc Verify 1e9 times 1e9 toNumber 1e18
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart05TestTest124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = new Decimal('1e9').mul(new Decimal('1e9'));
      expect(r.toNumber()).assertEqual(1e18);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART05_SUPPLEMENT_TEST_1250
     * @tc.name testDecimalOverviewPart05TestTest125
     * @tc.desc Verify toFixed
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart05TestTest125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s = new Decimal('1e400').toFixed();
      expect(s.indexOf('Infinity')).assertEqual(-1);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART05_SUPPLEMENT_TEST_1260
     * @tc.name testDecimalOverviewPart05TestTest126
     * @tc.desc Verify 9.999e306 times 10 Infinity
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart05TestTest126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = new Decimal('9.999e306').mul(new Decimal('10'));
      expect(r.isFinite()).assertTrue();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART05_SUPPLEMENT_TEST_1270
     * @tc.name testDecimalOverviewPart05TestTest127
     * @tc.desc Verify number error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart05TestTest127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = new Decimal('1e400').sub(new Decimal('1e400'));
      expect(r.toString()).assertEqual('0');
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART05_SUPPLEMENT_TEST_1280
     * @tc.name testDecimalOverviewPart05TestTest128
     * @tc.desc Verify toNumber 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart05TestTest128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = new Decimal('1e-200').mul(new Decimal('1e-200'));
      expect(r.toNumber()).assertEqual(0);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART05_SUPPLEMENT_TEST_1290
     * @tc.name testDecimalOverviewPart05TestTest129
     * @tc.desc Verify toString Decimal
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart05TestTest129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = new Decimal('1e-200').mul(new Decimal('1e-200'));
      expect(r.toString()).assertEqual('1e-400');
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART05_SUPPLEMENT_TEST_1300
     * @tc.name testDecimalOverviewPart05TestTest130
     * @tc.desc Verify NaN 'NaN' NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart05TestTest130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Decimal('NaN');
      expect(d.isNaN()).assertTrue();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART05_SUPPLEMENT_TEST_1310
     * @tc.name testDecimalOverviewPart05TestTest131
     * @tc.desc Verify 'Infinity' Infinity
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart05TestTest131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Decimal('Infinity');
      expect(d.toString()).assertEqual('Infinity');
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART05_SUPPLEMENT_TEST_1320
     * @tc.name testDecimalOverviewPart05TestTest132
     * @tc.desc Verify '-Infinity' -Infinity
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart05TestTest132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Decimal('-Infinity');
      expect(d.toString()).assertEqual('-Infinity');
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART05_SUPPLEMENT_TEST_1330
     * @tc.name testDecimalOverviewPart05TestTest133
     * @tc.desc Verify NaN abs
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart05TestTest133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let threw = false;
      try {
        const r = new Decimal(NaN).abs();
        threw = r.isNaN() === false;
      } catch (e) {
      expect().assertFail();
      }
      expect(threw).assertFalse();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART05_SUPPLEMENT_TEST_1340
     * @tc.name testDecimalOverviewPart05TestTest134
     * @tc.desc Verify +'1e999999999' isFinite false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart05TestTest134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Decimal('1e999999999');
      expect(d.isFinite()).assertTrue();
    });
  
  });

}
