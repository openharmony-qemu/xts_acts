
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

export default function decimalPrecisionPart02TestTest() {
  describe('DecimalPrecisionPart02TestTest', () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PRECISION_PART02_SUPPLEMENT_TEST_0100
     * @tc.name testDecimalPrecisionPart02TestTest001
     * @tc.desc Verify (assertEqual)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPrecisionPart02TestTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal('987000');
      let r: number = d.precision(true);
      expect(r).assertEqual(6);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PRECISION_PART02_SUPPLEMENT_TEST_0200
     * @tc.name testDecimalPrecisionPart02TestTest002
     * @tc.desc Verify (assertEqual)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPrecisionPart02TestTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal('987000');
      let r: number = d.precision(1);
      expect(r).assertEqual(6);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PRECISION_PART02_SUPPLEMENT_TEST_0300
     * @tc.name testDecimalPrecisionPart02TestTest003
     * @tc.desc Verify includeZeros=true 987000 6
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPrecisionPart02TestTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal('987000');
      expect(d.precision(true)).assertEqual(6);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PRECISION_PART02_SUPPLEMENT_TEST_0400
     * @tc.name testDecimalPrecisionPart02TestTest004
     * @tc.desc Verify includeZeros=false 987000 3
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPrecisionPart02TestTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal('987000');
      expect(d.precision(false)).assertEqual(3);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PRECISION_PART02_SUPPLEMENT_TEST_0500
     * @tc.name testDecimalPrecisionPart02TestTest005
     * @tc.desc Verify includeZeros=true 1.234 4
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPrecisionPart02TestTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(1.234);
      expect(d.precision(true)).assertEqual(4);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PRECISION_PART02_SUPPLEMENT_TEST_0600
     * @tc.name testDecimalPrecisionPart02TestTest006
     * @tc.desc Verify includeZeros=false 1.234 4
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPrecisionPart02TestTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(1.234);
      expect(d.precision(false)).assertEqual(4);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PRECISION_PART02_SUPPLEMENT_TEST_0700
     * @tc.name testDecimalPrecisionPart02TestTest007
     * @tc.desc Verify includeZeros=true 100 3
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPrecisionPart02TestTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(100);
      expect(d.precision(true)).assertEqual(3);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PRECISION_PART02_SUPPLEMENT_TEST_0800
     * @tc.name testDecimalPrecisionPart02TestTest008
     * @tc.desc Verify includeZeros=false 100 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPrecisionPart02TestTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(100);
      expect(d.precision(false)).assertEqual(1);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PRECISION_PART02_SUPPLEMENT_TEST_0900
     * @tc.name testDecimalPrecisionPart02TestTest009
     * @tc.desc Verify includeZeros=true 120 3
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPrecisionPart02TestTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(120);
      expect(d.precision(true)).assertEqual(3);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PRECISION_PART02_SUPPLEMENT_TEST_1000
     * @tc.name testDecimalPrecisionPart02TestTest010
     * @tc.desc Verify includeZeros=false 120 2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPrecisionPart02TestTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(120);
      expect(d.precision(false)).assertEqual(2);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PRECISION_PART02_SUPPLEMENT_TEST_1100
     * @tc.name testDecimalPrecisionPart02TestTest011
     * @tc.desc Verify includeZeros=true 12300 5
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPrecisionPart02TestTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(12300);
      expect(d.precision(true)).assertEqual(5);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PRECISION_PART02_SUPPLEMENT_TEST_1200
     * @tc.name testDecimalPrecisionPart02TestTest012
     * @tc.desc Verify includeZeros=false 12300 3
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPrecisionPart02TestTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(12300);
      expect(d.precision(false)).assertEqual(3);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PRECISION_PART02_SUPPLEMENT_TEST_1300
     * @tc.name testDecimalPrecisionPart02TestTest013
     * @tc.desc Verify includeZeros=true 1000000 7
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPrecisionPart02TestTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(1000000);
      expect(d.precision(true)).assertEqual(7);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PRECISION_PART02_SUPPLEMENT_TEST_1400
     * @tc.name testDecimalPrecisionPart02TestTest014
     * @tc.desc Verify includeZeros=false 1000000 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPrecisionPart02TestTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(1000000);
      expect(d.precision(false)).assertEqual(1);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PRECISION_PART02_SUPPLEMENT_TEST_1500
     * @tc.name testDecimalPrecisionPart02TestTest015
     * @tc.desc Verify includeZeros=true -5000 4
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPrecisionPart02TestTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(-5000);
      expect(d.precision(true)).assertEqual(4);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PRECISION_PART02_SUPPLEMENT_TEST_1600
     * @tc.name testDecimalPrecisionPart02TestTest016
     * @tc.desc Verify includeZeros=false -5000 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPrecisionPart02TestTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(-5000);
      expect(d.precision(false)).assertEqual(1);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PRECISION_PART02_SUPPLEMENT_TEST_1700
     * @tc.name testDecimalPrecisionPart02TestTest017
     * @tc.desc Verify includeZeros=true 0 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPrecisionPart02TestTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(0);
      expect(d.precision(true)).assertEqual(1);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PRECISION_PART02_SUPPLEMENT_TEST_1800
     * @tc.name testDecimalPrecisionPart02TestTest018
     * @tc.desc Verify includeZeros=false 0 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPrecisionPart02TestTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(0);
      expect(d.precision(false)).assertEqual(1);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PRECISION_PART02_SUPPLEMENT_TEST_1900
     * @tc.name testDecimalPrecisionPart02TestTest019
     * @tc.desc Verify includeZeros=true -0 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPrecisionPart02TestTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(-0);
      expect(d.precision(true)).assertEqual(1);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PRECISION_PART02_SUPPLEMENT_TEST_2000
     * @tc.name testDecimalPrecisionPart02TestTest020
     * @tc.desc Verify includeZeros=false -0 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPrecisionPart02TestTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(-0);
      expect(d.precision(false)).assertEqual(1);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PRECISION_PART02_SUPPLEMENT_TEST_2100
     * @tc.name testDecimalPrecisionPart02TestTest021
     * @tc.desc Verify includeZeros=true '0.00123' 3
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPrecisionPart02TestTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal('0.00123');
      expect(d.precision(true)).assertEqual(3);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PRECISION_PART02_SUPPLEMENT_TEST_2200
     * @tc.name testDecimalPrecisionPart02TestTest022
     * @tc.desc Verify includeZeros=false '0.00123' 3
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPrecisionPart02TestTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal('0.00123');
      expect(d.precision(false)).assertEqual(3);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PRECISION_PART02_SUPPLEMENT_TEST_2300
     * @tc.name testDecimalPrecisionPart02TestTest023
     * @tc.desc Verify includeZeros=true '1e-7' 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPrecisionPart02TestTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal('1e-7');
      expect(d.precision(true)).assertEqual(1);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PRECISION_PART02_SUPPLEMENT_TEST_2400
     * @tc.name testDecimalPrecisionPart02TestTest024
     * @tc.desc Verify includeZeros=false '1e-7' 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPrecisionPart02TestTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal('1e-7');
      expect(d.precision(false)).assertEqual(1);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PRECISION_PART02_SUPPLEMENT_TEST_2500
     * @tc.name testDecimalPrecisionPart02TestTest025
     * @tc.desc Verify includeZeros=true '123.456' 6
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPrecisionPart02TestTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal('123.456');
      expect(d.precision(true)).assertEqual(6);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PRECISION_PART02_SUPPLEMENT_TEST_2600
     * @tc.name testDecimalPrecisionPart02TestTest026
     * @tc.desc Verify includeZeros=false '123.456' 6 true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPrecisionPart02TestTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal('123.456');
      expect(d.precision(false)).assertEqual(6);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PRECISION_PART02_SUPPLEMENT_TEST_2700
     * @tc.name testDecimalPrecisionPart02TestTest027
     * @tc.desc Verify includeZeros=true '5e3' 4
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPrecisionPart02TestTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal('5e3');
      expect(d.precision(true)).assertEqual(4);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PRECISION_PART02_SUPPLEMENT_TEST_2800
     * @tc.name testDecimalPrecisionPart02TestTest028
     * @tc.desc Verify includeZeros=false '5e3' 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPrecisionPart02TestTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal('5e3');
      expect(d.precision(false)).assertEqual(1);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PRECISION_PART02_SUPPLEMENT_TEST_2900
     * @tc.name testDecimalPrecisionPart02TestTest029
     * @tc.desc Verify includeZeros=true '1.2300' '1.23'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPrecisionPart02TestTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d1: Decimal = new Decimal('1.2300');
      let d2: Decimal = new Decimal('1.23');
      expect(d1.precision(true)).assertEqual(d2.precision(true));
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PRECISION_PART02_SUPPLEMENT_TEST_3000
     * @tc.name testDecimalPrecisionPart02TestTest030
     * @tc.desc Verify includeZeros=1 true 987000 6
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPrecisionPart02TestTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal('987000');
      expect(d.precision(1)).assertEqual(d.precision(true));
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PRECISION_PART02_SUPPLEMENT_TEST_3100
     * @tc.name testDecimalPrecisionPart02TestTest031
     * @tc.desc Verify includeZeros=0 false 987000 3
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPrecisionPart02TestTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal('987000');
      expect(d.precision(0)).assertEqual(d.precision(false));
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PRECISION_PART02_SUPPLEMENT_TEST_3200
     * @tc.name testDecimalPrecisionPart02TestTest032
     * @tc.desc Verify includeZeros=1 true 100 3
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPrecisionPart02TestTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(100);
      expect(d.precision(1)).assertEqual(d.precision(true));
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PRECISION_PART02_SUPPLEMENT_TEST_3300
     * @tc.name testDecimalPrecisionPart02TestTest033
     * @tc.desc Verify includeZeros=0 false 100 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPrecisionPart02TestTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(100);
      expect(d.precision(0)).assertEqual(d.precision(false));
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PRECISION_PART02_SUPPLEMENT_TEST_3400
     * @tc.name testDecimalPrecisionPart02TestTest034
     * @tc.desc Verify includeZeros=1 true 12300 5
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPrecisionPart02TestTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(12300);
      expect(d.precision(1)).assertEqual(d.precision(true));
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PRECISION_PART02_SUPPLEMENT_TEST_3500
     * @tc.name testDecimalPrecisionPart02TestTest035
     * @tc.desc Verify includeZeros=0 false 12300 3
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPrecisionPart02TestTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(12300);
      expect(d.precision(0)).assertEqual(d.precision(false));
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PRECISION_PART02_SUPPLEMENT_TEST_3600
     * @tc.name testDecimalPrecisionPart02TestTest036
     * @tc.desc Verify includeZeros=1 true 0 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPrecisionPart02TestTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(0);
      expect(d.precision(1)).assertEqual(d.precision(true));
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PRECISION_PART02_SUPPLEMENT_TEST_3700
     * @tc.name testDecimalPrecisionPart02TestTest037
     * @tc.desc Verify includeZeros=0 false 0 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPrecisionPart02TestTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(0);
      expect(d.precision(0)).assertEqual(d.precision(false));
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PRECISION_PART02_SUPPLEMENT_TEST_3800
     * @tc.name testDecimalPrecisionPart02TestTest038
     * @tc.desc Verify includeZeros=1 true -5000 4
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPrecisionPart02TestTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(-5000);
      expect(d.precision(1)).assertEqual(d.precision(true));
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PRECISION_PART02_SUPPLEMENT_TEST_3900
     * @tc.name testDecimalPrecisionPart02TestTest039
     * @tc.desc Verify includeZeros=0 false -5000 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPrecisionPart02TestTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(-5000);
      expect(d.precision(0)).assertEqual(d.precision(false));
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PRECISION_PART02_SUPPLEMENT_TEST_4000
     * @tc.name testDecimalPrecisionPart02TestTest040
     * @tc.desc Verify includeZeros=1 true '1.234' 4
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPrecisionPart02TestTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal('1.234');
      expect(d.precision(1)).assertEqual(d.precision(true));
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PRECISION_PART02_SUPPLEMENT_TEST_4100
     * @tc.name testDecimalPrecisionPart02TestTest041
     * @tc.desc Verify includeZeros=0 false '1.234' 4
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPrecisionPart02TestTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal('1.234');
      expect(d.precision(0)).assertEqual(d.precision(false));
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PRECISION_PART02_SUPPLEMENT_TEST_4200
     * @tc.name testDecimalPrecisionPart02TestTest042
     * @tc.desc Verify includeZeros=1 true '0.00123' 3
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPrecisionPart02TestTest042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal('0.00123');
      expect(d.precision(1)).assertEqual(d.precision(true));
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PRECISION_PART02_SUPPLEMENT_TEST_4300
     * @tc.name testDecimalPrecisionPart02TestTest043
     * @tc.desc Verify includeZeros=-0 0 -0===0 987000 3
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPrecisionPart02TestTest043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal('987000');
      expect(d.precision(-0)).assertEqual(d.precision(0));
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PRECISION_PART02_SUPPLEMENT_TEST_4400
     * @tc.name testDecimalPrecisionPart02TestTest044
     * @tc.desc Verify includeZeros=1 1000000 7
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPrecisionPart02TestTest044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(1000000);
      expect(d.precision(1)).assertEqual(7);
    });
  
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PRECISION_PART02_SUPPLEMENT_TEST_4500
     * @tc.name testDecimalPrecisionPart02TestTest045
     * @tc.desc Verify precision(0) number
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPrecisionPart02TestTest045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal('987000');
      let r: number = d.precision(0);
      expect(r).assertEqual(3);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PRECISION_PART02_SUPPLEMENT_TEST_4600
     * @tc.name testDecimalPrecisionPart02TestTest046
     * @tc.desc Verify (assertEqual)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPrecisionPart02TestTest046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal('987000');
      let r: number = d.precision(true);
      expect(Math.floor(r)).assertEqual(r);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PRECISION_PART02_SUPPLEMENT_TEST_4700
     * @tc.name testDecimalPrecisionPart02TestTest047
     * @tc.desc Verify toString (assertEqual)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPrecisionPart02TestTest047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal('987000');
      let before: string = d.toString();
      d.precision(true);
      expect(d.toString()).assertEqual(before);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PRECISION_PART02_SUPPLEMENT_TEST_4800
     * @tc.name testDecimalPrecisionPart02TestTest048
     * @tc.desc Verify (assertEqual)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPrecisionPart02TestTest048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal('987000');
      let r: number = d.precision(true);
      expect(r + 1).assertEqual(7);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PRECISION_PART02_SUPPLEMENT_TEST_4900
     * @tc.name testDecimalPrecisionPart02TestTest049
     * @tc.desc Verify toString (assertEqual)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPrecisionPart02TestTest049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal('12300');
      let r1: number = d.precision(true);
      let r2: number = new Decimal(d.toString()).precision(true);
      expect(r1).assertEqual(r2);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PRECISION_PART02_SUPPLEMENT_TEST_5000
     * @tc.name testDecimalPrecisionPart02TestTest050
     * @tc.desc Verify precision(true) precision(false)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPrecisionPart02TestTest050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal('987000');
      expect(d.precision(true) >= d.precision(false)).assertTrue();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PRECISION_PART02_SUPPLEMENT_TEST_5100
     * @tc.name testDecimalPrecisionPart02TestTest051
     * @tc.desc Verify '12345678901234567890' precision(true) 20
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPrecisionPart02TestTest051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal('12345678901234567890');
      expect(d.precision(true)).assertEqual(20);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PRECISION_PART02_SUPPLEMENT_TEST_5200
     * @tc.name testDecimalPrecisionPart02TestTest052
     * @tc.desc Verify '12345678901234567890' precision(false) 20
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPrecisionPart02TestTest052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal('12345678901234567890');
      expect(d.precision(false)).assertEqual(19);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PRECISION_PART02_SUPPLEMENT_TEST_5300
     * @tc.name testDecimalPrecisionPart02TestTest053
     * @tc.desc Verify includeZeros=NaN 10200001
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPrecisionPart02TestTest053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal('987000');
      try {
        d.precision(NaN);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(10200001);
      };
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PRECISION_PART02_SUPPLEMENT_TEST_5400
     * @tc.name testDecimalPrecisionPart02TestTest054
     * @tc.desc Verify includeZeros=Infinity 10200001
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPrecisionPart02TestTest054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal('987000');
      try {
        d.precision(Infinity);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(10200001);
      };
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PRECISION_PART02_SUPPLEMENT_TEST_5500
     * @tc.name testDecimalPrecisionPart02TestTest055
     * @tc.desc Verify includeZeros=-Infinity 10200001
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPrecisionPart02TestTest055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal('987000');
      try {
        d.precision(-Infinity);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(10200001);
      };
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PRECISION_PART02_SUPPLEMENT_TEST_5600
     * @tc.name testDecimalPrecisionPart02TestTest056
     * @tc.desc Verify includeZeros=2 0/1 10200001
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPrecisionPart02TestTest056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal('987000');
      try {
        d.precision(2);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(10200001);
      };
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PRECISION_PART02_SUPPLEMENT_TEST_5700
     * @tc.name testDecimalPrecisionPart02TestTest057
     * @tc.desc Verify includeZeros=-1 10200001
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPrecisionPart02TestTest057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal('987000');
      try {
        d.precision(-1);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(10200001);
      };
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PRECISION_PART02_SUPPLEMENT_TEST_5800
     * @tc.name testDecimalPrecisionPart02TestTest058
     * @tc.desc Verify includeZeros=0.5 10200001
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPrecisionPart02TestTest058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal('987000');
      try {
        d.precision(0.5);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(10200001);
      };
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PRECISION_PART02_SUPPLEMENT_TEST_5900
     * @tc.name testDecimalPrecisionPart02TestTest059
     * @tc.desc Verify includeZeros=1.5 10200001
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPrecisionPart02TestTest059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal('987000');
      try {
        d.precision(1.5);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(10200001);
      };
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PRECISION_PART02_SUPPLEMENT_TEST_6000
     * @tc.name testDecimalPrecisionPart02TestTest060
     * @tc.desc Verify includeZeros=-0.5 10200001
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPrecisionPart02TestTest060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal('987000');
      try {
        d.precision(-0.5);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(10200001);
      };
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PRECISION_PART02_SUPPLEMENT_TEST_6100
     * @tc.name testDecimalPrecisionPart02TestTest061
     * @tc.desc Verify includeZeros=1e9 0/1 10200001
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPrecisionPart02TestTest061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal('987000');
      try {
        d.precision(1e9);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(10200001);
      };
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PRECISION_PART02_SUPPLEMENT_TEST_6200
     * @tc.name testDecimalPrecisionPart02TestTest062
     * @tc.desc Verify includeZeros=1e9+1 10200001
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPrecisionPart02TestTest062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal('987000');
      try {
        d.precision(1e9 + 1);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(10200001);
      };
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PRECISION_PART02_SUPPLEMENT_TEST_6300
     * @tc.name testDecimalPrecisionPart02TestTest063
     * @tc.desc Verify includeZeros=-1e9 10200001
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPrecisionPart02TestTest063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal('987000');
      try {
        d.precision(-1e9);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(10200001);
      };
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PRECISION_PART02_SUPPLEMENT_TEST_6400
     * @tc.name testDecimalPrecisionPart02TestTest064
     * @tc.desc Verify includeZeros=Number.MAX_VALUE 10200001
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPrecisionPart02TestTest064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal('987000');
      try {
        d.precision(Number.MAX_VALUE);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(10200001);
      };
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PRECISION_PART02_SUPPLEMENT_TEST_6500
     * @tc.name testDecimalPrecisionPart02TestTest065
     * @tc.desc Verify includeZeros=Number.MIN_VALUE 10200001
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPrecisionPart02TestTest065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal('987000');
      try {
        d.precision(Number.MIN_VALUE);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(10200001);
      };
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PRECISION_PART02_SUPPLEMENT_TEST_6600
     * @tc.name testDecimalPrecisionPart02TestTest066
     * @tc.desc Verify includeZeros=Number.MAX_SAFE_INTEGER 10200001
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPrecisionPart02TestTest066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal('987000');
      try {
        d.precision(Number.MAX_SAFE_INTEGER);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(10200001);
      };
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PRECISION_PART02_SUPPLEMENT_TEST_6700
     * @tc.name testDecimalPrecisionPart02TestTest067
     * @tc.desc Verify includeZeros=Number.MIN_SAFE_INTEGER 10200001
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPrecisionPart02TestTest067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal('987000');
      try {
        d.precision(Number.MIN_SAFE_INTEGER);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(10200001);
      };
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PRECISION_PART02_SUPPLEMENT_TEST_6800
     * @tc.name testDecimalPrecisionPart02TestTest068
     * @tc.desc Verify includeZeros=Number.EPSILON 10200001
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPrecisionPart02TestTest068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal('987000');
      try {
        d.precision(Number.EPSILON);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(10200001);
      };
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PRECISION_PART02_SUPPLEMENT_TEST_6900
     * @tc.name testDecimalPrecisionPart02TestTest069
     * @tc.desc Verify includeZeros=0.1 0/1 10200001
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPrecisionPart02TestTest069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal('987000');
      try {
        d.precision(0.1);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(10200001);
      };
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PRECISION_PART02_SUPPLEMENT_TEST_7000
     * @tc.name testDecimalPrecisionPart02TestTest070
     * @tc.desc Verify includeZeros=2.5 0/1 10200001
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPrecisionPart02TestTest070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal('987000');
      try {
        d.precision(2.5);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(10200001);
      };
    });
  
  });

}
