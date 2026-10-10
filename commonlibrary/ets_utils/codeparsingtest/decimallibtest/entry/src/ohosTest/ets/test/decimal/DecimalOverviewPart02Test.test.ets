
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

export default function decimalOverviewPart02TestTest() {
  describe('DecimalOverviewPart02TestTest', () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART02_SUPPLEMENT_TEST_0010
     * @tc.name testDecimalOverviewPart02TestTest001
     * @tc.desc Verify toString with null (assertEqual,assertFalse)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart02TestTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let d: Decimal = new Decimal('');
        expect(d.toString()).assertEqual('');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART02_SUPPLEMENT_TEST_0020
     * @tc.name testDecimalOverviewPart02TestTest002
     * @tc.desc Verify toString with null (assertEqual,assertFalse)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart02TestTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let d: Decimal = new Decimal('   ');
        expect(d.toString()).assertEqual('   ');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART02_SUPPLEMENT_TEST_0030
     * @tc.name testDecimalOverviewPart02TestTest003
     * @tc.desc Verify toString with null (assertEqual,assertFalse)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart02TestTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let d: Decimal = new Decimal(' ');
        expect(d.toString()).assertEqual(' ');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART02_SUPPLEMENT_TEST_0040
     * @tc.name testDecimalOverviewPart02TestTest004
     * @tc.desc Verify toString with null (assertEqual,assertFalse)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart02TestTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let d: Decimal = new Decimal('\t');
        expect(d.toString()).assertEqual('\t');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART02_SUPPLEMENT_TEST_0050
     * @tc.name testDecimalOverviewPart02TestTest005
     * @tc.desc Verify toString with null (assertEqual,assertFalse)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart02TestTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let d: Decimal = new Decimal('\n');
        expect(d.toString()).assertEqual('\n');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART02_SUPPLEMENT_TEST_0060
     * @tc.name testDecimalOverviewPart02TestTest006
     * @tc.desc Verify toString (assertEqual)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart02TestTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Decimal(' 5');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART02_SUPPLEMENT_TEST_0070
     * @tc.name testDecimalOverviewPart02TestTest007
     * @tc.desc Verify toString (assertEqual)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart02TestTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Decimal('5 ');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART02_SUPPLEMENT_TEST_0080
     * @tc.name testDecimalOverviewPart02TestTest008
     * @tc.desc Verify toString (assertEqual)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart02TestTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Decimal(' 3.5 ');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART02_SUPPLEMENT_TEST_0090
     * @tc.name testDecimalOverviewPart02TestTest009
     * @tc.desc Verify toString with null (assertEqual,assertFalse)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart02TestTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let d: Decimal = new Decimal('​');
        expect(d.toString()).assertEqual('​');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART02_SUPPLEMENT_TEST_0100
     * @tc.name testDecimalOverviewPart02TestTest010
     * @tc.desc Verify toString with null (assertEqual,assertFalse)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart02TestTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let d: Decimal = new Decimal('　');
        expect(d.toString()).assertEqual('　');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART02_SUPPLEMENT_TEST_0110
     * @tc.name testDecimalOverviewPart02TestTest011
     * @tc.desc Verify toString with null (assertEqual,assertFalse)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart02TestTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let d: Decimal = new Decimal(' ');
        expect(d.toString()).assertEqual(' ');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART02_SUPPLEMENT_TEST_0120
     * @tc.name testDecimalOverviewPart02TestTest012
     * @tc.desc Verify toString with null (assertEqual,assertFalse)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart02TestTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let d: Decimal = new Decimal('1​2');
        expect(d.toString()).assertEqual('1​2');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART02_SUPPLEMENT_TEST_0130
     * @tc.name testDecimalOverviewPart02TestTest013
     * @tc.desc Verify toString with null (assertEqual,assertFalse)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart02TestTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Decimal = new Decimal(5);
      try {
        let r: Decimal = a.add('');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART02_SUPPLEMENT_TEST_0140
     * @tc.name testDecimalOverviewPart02TestTest014
     * @tc.desc Verify toString with null (assertEqual,assertFalse)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart02TestTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Decimal = new Decimal(10);
      try {
        let r: Decimal = a.div('   ');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART02_SUPPLEMENT_TEST_0150
     * @tc.name testDecimalOverviewPart02TestTest015
     * @tc.desc Verify with null (assertFalse)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart02TestTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Decimal = new Decimal(1);
      try {
        let c: number = a.comparedTo('');
        expect(Number.isNaN(c)).assertFalse();
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART02_SUPPLEMENT_TEST_0160
     * @tc.name testDecimalOverviewPart02TestTest016
     * @tc.desc Verify (assertFalse)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart02TestTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Decimal = new Decimal(1);
      try {
        a.equals('​');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART02_SUPPLEMENT_TEST_0170
     * @tc.name testDecimalOverviewPart02TestTest017
     * @tc.desc Verify with null (assertEqual,assertFalse)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart02TestTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Decimal = new Decimal('0.5');
      try {
        let f: Decimal[] = a.toFraction('');
        expect(f.length).assertEqual(2);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART02_SUPPLEMENT_TEST_0180
     * @tc.name testDecimalOverviewPart02TestTest018
     * @tc.desc Verify with null (assertFalse)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart02TestTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let s: number = Decimal.sign('');
        expect(Number.isNaN(s)).assertFalse();
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART02_SUPPLEMENT_TEST_0190
     * @tc.name testDecimalOverviewPart02TestTest019
     * @tc.desc Verify toString with null (assertEqual,assertFalse)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart02TestTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let d: Decimal = new Decimal('12');
        expect(d.toString()).assertEqual('12');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART02_SUPPLEMENT_TEST_0200
     * @tc.name testDecimalOverviewPart02TestTest020
     * @tc.desc Verify toString with null (assertEqual,assertFalse)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart02TestTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let d: Decimal = new Decimal('\r');
        expect(d.toString()).assertEqual('\r');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART02_SUPPLEMENT_TEST_0210
     * @tc.name testDecimalOverviewPart02TestTest021
     * @tc.desc Verify toString with null (assertEqual,assertFalse)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart02TestTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let d: Decimal = new Decimal(';');
        expect(d.toString()).assertEqual(';');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART02_SUPPLEMENT_TEST_0220
     * @tc.name testDecimalOverviewPart02TestTest022
     * @tc.desc Verify toString with null (assertEqual,assertFalse)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart02TestTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let d: Decimal = new Decimal('');
        expect(d.toString()).assertEqual('');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART02_SUPPLEMENT_TEST_0230
     * @tc.name testDecimalOverviewPart02TestTest023
     * @tc.desc Verify toString with null (assertEqual,assertFalse)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart02TestTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let d: Decimal = new Decimal('\\d');
        expect(d.toString()).assertEqual('\\d');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART02_SUPPLEMENT_TEST_0240
     * @tc.name testDecimalOverviewPart02TestTest024
     * @tc.desc Verify toString (assertEqual)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart02TestTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal('+5');
      expect(d.toString()).assertEqual('5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART02_SUPPLEMENT_TEST_0250
     * @tc.name testDecimalOverviewPart02TestTest025
     * @tc.desc Verify toString (assertEqual)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart02TestTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal('-5');
      expect(d.toString()).assertEqual('-5');
      expect(d.s).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART02_SUPPLEMENT_TEST_0260
     * @tc.name testDecimalOverviewPart02TestTest026
     * @tc.desc Verify toString (assertEqual)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart02TestTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal('.5');
      expect(d.toString()).assertEqual('0.5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART02_SUPPLEMENT_TEST_0270
     * @tc.name testDecimalOverviewPart02TestTest027
     * @tc.desc Verify toString (assertEqual)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart02TestTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal('5.');
      expect(d.toString()).assertEqual('5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART02_SUPPLEMENT_TEST_0280
     * @tc.name testDecimalOverviewPart02TestTest028
     * @tc.desc Verify toString with null (assertEqual,assertFalse)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart02TestTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let d: Decimal = new Decimal('1.2.3');
        expect(d.toString()).assertEqual('1.2.3');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART02_SUPPLEMENT_TEST_0290
     * @tc.name testDecimalOverviewPart02TestTest029
     * @tc.desc Verify toString with null (assertEqual,assertFalse)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart02TestTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let d: Decimal = new Decimal('1,000');
        expect(d.toString()).assertEqual('1,000');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART02_SUPPLEMENT_TEST_0300
     * @tc.name testDecimalOverviewPart02TestTest030
     * @tc.desc Verify toString with null (assertEqual,assertFalse)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart02TestTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let d: Decimal = new Decimal('1_000');
        expect(d.toString()).assertEqual('1000');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART02_SUPPLEMENT_TEST_0310
     * @tc.name testDecimalOverviewPart02TestTest031
     * @tc.desc Verify toString with null (assertEqual,assertFalse)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart02TestTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let d: Decimal = new Decimal('50%');
        expect(d.toString()).assertEqual('50%');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART02_SUPPLEMENT_TEST_0320
     * @tc.name testDecimalOverviewPart02TestTest032
     * @tc.desc Verify toString with null (assertEqual,assertFalse)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart02TestTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let d: Decimal = new Decimal('$5');
        expect(d.toString()).assertEqual('$5');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART02_SUPPLEMENT_TEST_0330
     * @tc.name testDecimalOverviewPart02TestTest033
     * @tc.desc Verify toString with null (assertEqual,assertFalse)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart02TestTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let d: Decimal = new Decimal('(5)');
        expect(d.toString()).assertEqual('(5)');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART02_SUPPLEMENT_TEST_0340
     * @tc.name testDecimalOverviewPart02TestTest034
     * @tc.desc Verify toString (assertEqual)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart02TestTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal('1e3');
      expect(d.toString()).assertEqual('1000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART02_SUPPLEMENT_TEST_0350
     * @tc.name testDecimalOverviewPart02TestTest035
     * @tc.desc Verify toString (assertEqual)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart02TestTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal('1.5E-2');
      expect(d.toString()).assertEqual('0.015');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART02_SUPPLEMENT_TEST_0360
     * @tc.name testDecimalOverviewPart02TestTest036
     * @tc.desc Verify toString with null (assertEqual,assertFalse)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart02TestTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let d: Decimal = new Decimal('1e');
        expect(d.toString()).assertEqual('1e');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART02_SUPPLEMENT_TEST_0370
     * @tc.name testDecimalOverviewPart02TestTest037
     * @tc.desc Verify toString with null (assertEqual,assertFalse)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart02TestTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let d: Decimal = new Decimal('0b10');
        expect(d.toString()).assertEqual('2');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART02_SUPPLEMENT_TEST_0380
     * @tc.name testDecimalOverviewPart02TestTest038
     * @tc.desc Verify toString with null (assertEqual,assertFalse)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart02TestTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let d: Decimal = new Decimal('一二三');
        expect(d.toString()).assertEqual('一二三');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART02_SUPPLEMENT_TEST_0390
     * @tc.name testDecimalOverviewPart02TestTest039
     * @tc.desc Verify toString with null (assertEqual,assertFalse)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart02TestTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let d: Decimal = new Decimal('😀');
        expect(d.toString()).assertEqual('😀');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART02_SUPPLEMENT_TEST_0400
     * @tc.name testDecimalOverviewPart02TestTest040
     * @tc.desc Verify toString with null (assertEqual,assertFalse)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart02TestTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let d: Decimal = new Decimal('1😀2');
        expect(d.toString()).assertEqual('1😀2');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART02_SUPPLEMENT_TEST_0410
     * @tc.name testDecimalOverviewPart02TestTest041
     * @tc.desc Verify toString with null (assertEqual,assertFalse)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart02TestTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let d: Decimal = new Decimal('٥');
        expect(d.toString()).assertEqual('٥');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART02_SUPPLEMENT_TEST_0420
     * @tc.name testDecimalOverviewPart02TestTest042
     * @tc.desc Verify toString with null (assertEqual,assertFalse)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart02TestTest042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let d: Decimal = new Decimal('５');
        expect(d.toString()).assertEqual('５');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART02_SUPPLEMENT_TEST_0430
     * @tc.name testDecimalOverviewPart02TestTest043
     * @tc.desc Verify toString with null (assertEqual,assertFalse)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart02TestTest043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let d: Decimal = new Decimal('Ⅴ');
        expect(d.toString()).assertEqual('Ⅴ');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART02_SUPPLEMENT_TEST_0440
     * @tc.name testDecimalOverviewPart02TestTest044
     * @tc.desc Verify toString with null (assertEqual,assertFalse)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart02TestTest044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let d: Decimal = new Decimal('¹');
        expect(d.toString()).assertEqual('¹');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART02_SUPPLEMENT_TEST_0450
     * @tc.name testDecimalOverviewPart02TestTest045
     * @tc.desc Verify toString with null (assertEqual,assertFalse)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart02TestTest045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let d: Decimal = new Decimal('﻿5');
        expect(d.toString()).assertEqual('﻿5');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART02_SUPPLEMENT_TEST_0460
     * @tc.name testDecimalOverviewPart02TestTest046
     * @tc.desc Verify toString with null (assertEqual,assertFalse)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart02TestTest046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let d: Decimal = new Decimal('5‎');
        expect(d.toString()).assertEqual('5‎');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART02_SUPPLEMENT_TEST_0470
     * @tc.name testDecimalOverviewPart02TestTest047
     * @tc.desc Verify toString with null (assertEqual,assertFalse)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart02TestTest047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let d: Decimal = new Decimal('два');
        expect(d.toString()).assertEqual('два');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART02_SUPPLEMENT_TEST_0480
     * @tc.name testDecimalOverviewPart02TestTest048
     * @tc.desc Verify toString with null (assertEqual,assertFalse)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart02TestTest048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let d: Decimal = new Decimal('๑');
        expect(d.toString()).assertEqual('๑');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART02_SUPPLEMENT_TEST_0490
     * @tc.name testDecimalOverviewPart02TestTest049
     * @tc.desc Verify toString with null (assertEqual,assertFalse)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart02TestTest049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let d: Decimal = new Decimal('\uD83D');
        expect(d.toString()).assertEqual('\uD83D');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART02_SUPPLEMENT_TEST_0500
     * @tc.name testDecimalOverviewPart02TestTest050
     * @tc.desc Verify toString with null (assertEqual,assertFalse)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart02TestTest050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let d: Decimal = new Decimal('\uDE00');
        expect(d.toString()).assertEqual('\uDE00');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART02_SUPPLEMENT_TEST_0510
     * @tc.name testDecimalOverviewPart02TestTest051
     * @tc.desc Verify '\uDE00\uD83D' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart02TestTest051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let d: Decimal = new Decimal('\uDE00\uD83D');
        expect(d.toString()).assertEqual('\uDE00\uD83D');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART02_SUPPLEMENT_TEST_0520
     * @tc.name testDecimalOverviewPart02TestTest052
     * @tc.desc Verify toString with null (assertEqual,assertFalse)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart02TestTest052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let d: Decimal = new Decimal('1\uD83D2');
        expect(d.toString()).assertEqual('1\uD83D2');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART02_SUPPLEMENT_TEST_0530
     * @tc.name testDecimalOverviewPart02TestTest053
     * @tc.desc Verify toString with null (assertEqual,assertFalse)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart02TestTest053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let d: Decimal = new Decimal('abc');
        expect(d.toString()).assertEqual('abc');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART02_SUPPLEMENT_TEST_0540
     * @tc.name testDecimalOverviewPart02TestTest054
     * @tc.desc Verify toString with null (assertEqual,assertFalse)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart02TestTest054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let d: Decimal = new Decimal('12a34');
        expect(d.toString()).assertEqual('12a34');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART02_SUPPLEMENT_TEST_0550
     * @tc.name testDecimalOverviewPart02TestTest055
     * @tc.desc Verify toString with null (assertEqual,assertFalse)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart02TestTest055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let d: Decimal = new Decimal('1.5x');
        expect(d.toString()).assertEqual('1.5x');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART02_SUPPLEMENT_TEST_0560
     * @tc.name testDecimalOverviewPart02TestTest056
     * @tc.desc Verify toString with null (assertEqual,assertFalse)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart02TestTest056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let d: Decimal = new Decimal('1e2x');
        expect(d.toString()).assertEqual('1e2x');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART02_SUPPLEMENT_TEST_0570
     * @tc.name testDecimalOverviewPart02TestTest057
     * @tc.desc Verify toString with null (assertEqual,assertFalse)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart02TestTest057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let d: Decimal = new Decimal('1e2e3');
        expect(d.toString()).assertEqual('1e2e3');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART02_SUPPLEMENT_TEST_0580
     * @tc.name testDecimalOverviewPart02TestTest058
     * @tc.desc Verify toString with null (assertEqual,assertFalse)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart02TestTest058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let d: Decimal = new Decimal('-');
        expect(d.toString()).assertEqual('-');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART02_SUPPLEMENT_TEST_0590
     * @tc.name testDecimalOverviewPart02TestTest059
     * @tc.desc Verify toString with null (assertEqual,assertFalse)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart02TestTest059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let d: Decimal = new Decimal('1e-');
        expect(d.toString()).assertEqual('1e-');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART02_SUPPLEMENT_TEST_0600
     * @tc.name testDecimalOverviewPart02TestTest060
     * @tc.desc Verify toString with null (assertEqual,assertFalse)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart02TestTest060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let d: Decimal = new Decimal('.');
        expect(d.toString()).assertEqual('.');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART02_SUPPLEMENT_TEST_0610
     * @tc.name testDecimalOverviewPart02TestTest061
     * @tc.desc Verify toString with null (assertEqual,assertFalse)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart02TestTest061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let d: Decimal = new Decimal('e5');
        expect(d.toString()).assertEqual('e5');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART02_SUPPLEMENT_TEST_0620
     * @tc.name testDecimalOverviewPart02TestTest062
     * @tc.desc Verify toString (assertEqual)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart02TestTest062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal('1e00');
      expect(d.toString()).assertEqual('1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART02_SUPPLEMENT_TEST_0630
     * @tc.name testDecimalOverviewPart02TestTest063
     * @tc.desc Verify toString (assertEqual)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart02TestTest063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal('007');
      expect(d.toString()).assertEqual('7');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART02_SUPPLEMENT_TEST_0640
     * @tc.name testDecimalOverviewPart02TestTest064
     * @tc.desc Verify toString (assertEqual)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart02TestTest064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal('1.50');
      expect(d.toString()).assertEqual('1.5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART02_SUPPLEMENT_TEST_0650
     * @tc.name testDecimalOverviewPart02TestTest065
     * @tc.desc Verify (assertEqual)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart02TestTest065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal('0.000000000000000000000000001');
      expect(d.decimalPlaces()).assertEqual(27);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART02_SUPPLEMENT_TEST_0660
     * @tc.name testDecimalOverviewPart02TestTest066
     * @tc.desc Verify toString (assertEqual)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart02TestTest066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal('123456789012345678901234567890');
      expect(d.toString()).assertEqual('1.2345678901234567890123456789e+29');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART02_SUPPLEMENT_TEST_0670
     * @tc.name testDecimalOverviewPart02TestTest067
     * @tc.desc Verify (assertFalse)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart02TestTest067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal('1e-324');
      expect(d.isZero()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART02_SUPPLEMENT_TEST_0680
     * @tc.name testDecimalOverviewPart02TestTest068
     * @tc.desc Verify Infinity Infinity isFinite false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart02TestTest068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal('Infinity');
      expect(d.isFinite()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART02_SUPPLEMENT_TEST_0690
     * @tc.name testDecimalOverviewPart02TestTest069
     * @tc.desc Verify with NaN (assertTrue)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart02TestTest069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal('NaN');
      expect(d.isNaN()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART02_SUPPLEMENT_TEST_0700
     * @tc.name testDecimalOverviewPart02TestTest070
     * @tc.desc Verify '+Infinity' isFinite false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart02TestTest070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal('+Infinity');
      expect(d.isFinite()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART02_SUPPLEMENT_TEST_0710
     * @tc.name testDecimalOverviewPart02TestTest071
     * @tc.desc Verify (assertTrue)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart02TestTest071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal('-0');
      expect(d.isNegative()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART02_SUPPLEMENT_TEST_0720
     * @tc.name testDecimalOverviewPart02TestTest072
     * @tc.desc Verify toString (assertEqual)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart02TestTest072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Decimal = new Decimal('9e15');
      let b: Decimal = a.add(1);
      expect(b.toString()).assertEqual('9000000000000001');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART02_SUPPLEMENT_TEST_0730
     * @tc.name testDecimalOverviewPart02TestTest073
     * @tc.desc Verify script '<script>' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart02TestTest073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let d: Decimal = new Decimal('<script>');
        expect(d.toString()).assertEqual('<script>');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART02_SUPPLEMENT_TEST_0740
     * @tc.name testDecimalOverviewPart02TestTest074
     * @tc.desc Verify '<script>alert(1)</script>' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart02TestTest074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let d: Decimal = new Decimal('<script>alert(1)</script>');
        expect(d.toString()).assertEqual('<script>alert(1)</script>');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART02_SUPPLEMENT_TEST_0750
     * @tc.name testDecimalOverviewPart02TestTest075
     * @tc.desc Verify onerror '<img src=x onerror=alert(1)>' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart02TestTest075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let d: Decimal = new Decimal('<img src=x onerror=alert(1)>');
        expect(d.toString()).assertEqual('<img src=x onerror=alert(1)>');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART02_SUPPLEMENT_TEST_0760
     * @tc.name testDecimalOverviewPart02TestTest076
     * @tc.desc Verify javascript 'javascript:alert(1)' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart02TestTest076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let d: Decimal = new Decimal('javascript:alert(1)');
        expect(d.toString()).assertEqual('javascript:alert(1)');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART02_SUPPLEMENT_TEST_0770
     * @tc.name testDecimalOverviewPart02TestTest077
     * @tc.desc Verify HTML '<!-- -->' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart02TestTest077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let d: Decimal = new Decimal('<!-- -->');
        expect(d.toString()).assertEqual('<!-- -->');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART02_SUPPLEMENT_TEST_0780
     * @tc.name testDecimalOverviewPart02TestTest078
     * @tc.desc Verify '<style>body{}</style>' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart02TestTest078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let d: Decimal = new Decimal('<style>body{}</style>');
        expect(d.toString()).assertEqual('<style>body{}</style>');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART02_SUPPLEMENT_TEST_0790
     * @tc.name testDecimalOverviewPart02TestTest079
     * @tc.desc Verify iframe '<iframe src=x>' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart02TestTest079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let d: Decimal = new Decimal('<iframe src=x>');
        expect(d.toString()).assertEqual('<iframe src=x>');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART02_SUPPLEMENT_TEST_0800
     * @tc.name testDecimalOverviewPart02TestTest080
     * @tc.desc Verify XSS '1<script>' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart02TestTest080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let d: Decimal = new Decimal('1<script>');
        expect(d.toString()).assertEqual('1<script>');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART02_SUPPLEMENT_TEST_0810
     * @tc.name testDecimalOverviewPart02TestTest081
     * @tc.desc Verify iteration (assertEqual)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart02TestTest081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let big: string = '9';
      for (let i: number = 0; i < 999; i++) {
        big = big + '9';
      }
      let d: Decimal = new Decimal(big);
      expect(d.precision()).assertEqual(1000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART02_SUPPLEMENT_TEST_0820
     * @tc.name testDecimalOverviewPart02TestTest082
     * @tc.desc Verify toString/iteration (assertEqual)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart02TestTest082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let big: string = '1';
      for (let i: number = 0; i < 999; i++) {
        big = big + '0';
      }
      let a: Decimal = new Decimal(big);
      let b: Decimal = a.add('1');
      expect(b.toString()).assertEqual('1e+999');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART02_SUPPLEMENT_TEST_0830
     * @tc.name testDecimalOverviewPart02TestTest083
     * @tc.desc Verify iteration (assertEqual)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart02TestTest083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let frac: string = '0.';
      for (let i: number = 0; i < 1000; i++) {
        frac = frac + '1';
      }
      let d: Decimal = new Decimal(frac);
      expect(d.decimalPlaces()).assertEqual(1000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART02_SUPPLEMENT_TEST_0840
     * @tc.name testDecimalOverviewPart02TestTest084
     * @tc.desc Verify iteration (assertTrue)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart02TestTest084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rep: string = '';
      for (let i: number = 0; i < 999; i++) {
        rep = rep + '5';
      }
      let d: Decimal = new Decimal(rep);
      expect(d.isInteger()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART02_SUPPLEMENT_TEST_0850
     * @tc.name testDecimalOverviewPart02TestTest085
     * @tc.desc Verify string valueOf toString
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart02TestTest085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal('123.45');
      expect(d.valueOf()).assertEqual(d.toString());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART02_SUPPLEMENT_TEST_0860
     * @tc.name testDecimalOverviewPart02TestTest086
     * @tc.desc Verify (assertEqual)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart02TestTest086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Decimal = new Decimal('2.5');
      let b: Decimal = a.mul('4');
      expect(b.toNumber()).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART02_SUPPLEMENT_TEST_0870
     * @tc.name testDecimalOverviewPart02TestTest087
     * @tc.desc Verify string Decimal pow
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart02TestTest087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Decimal = new Decimal('3');
      let b: Decimal = a.pow('4');
      expect(b.toString()).assertEqual('81');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART02_SUPPLEMENT_TEST_0880
     * @tc.name testDecimalOverviewPart02TestTest088
     * @tc.desc Verify toString (assertEqual)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart02TestTest088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Decimal = new Decimal('1.1');
      let b: Decimal = new Decimal(2.2);
      let r: Decimal = a.add(b);
      expect(r.toString()).assertEqual('3.3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART02_SUPPLEMENT_TEST_0890
     * @tc.name testDecimalOverviewPart02TestTest089
     * @tc.desc Verify (assertTrue)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart02TestTest089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Decimal = new Decimal('0.1');
      expect(a.equals('1e-1')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART02_SUPPLEMENT_TEST_0900
     * @tc.name testDecimalOverviewPart02TestTest090
     * @tc.desc Verify toString with null (assertEqual,assertFalse)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart02TestTest090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Decimal = new Decimal(1);
      try {
        let r: Decimal = a.add('abc');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART02_SUPPLEMENT_TEST_0910
     * @tc.name testDecimalOverviewPart02TestTest091
     * @tc.desc Verify toString with null (assertEqual,assertFalse)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart02TestTest091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Decimal = new Decimal(2);
      try {
        let r: Decimal = a.mul('12a34');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART02_SUPPLEMENT_TEST_0920
     * @tc.name testDecimalOverviewPart02TestTest092
     * @tc.desc Verify toString with null (assertEqual,assertFalse)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart02TestTest092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Decimal = new Decimal(2);
      try {
        let r: Decimal = a.pow('abc');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART02_SUPPLEMENT_TEST_0930
     * @tc.name testDecimalOverviewPart02TestTest093
     * @tc.desc Verify toString with null (assertEqual,assertFalse)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart02TestTest093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Decimal = new Decimal(2);
      try {
        let r: Decimal = a.sub(' ');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART02_SUPPLEMENT_TEST_0940
     * @tc.name testDecimalOverviewPart02TestTest094
     * @tc.desc Verify toString with null (assertEqual,assertFalse)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart02TestTest094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Decimal = new Decimal(5);
      try {
        let r: Decimal = a.mod('abc');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART02_SUPPLEMENT_TEST_0950
     * @tc.name testDecimalOverviewPart02TestTest095
     * @tc.desc Verify toString with null (assertEqual,assertFalse)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart02TestTest095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Decimal = new Decimal(5);
      try {
        let r: Decimal = a.div('abc');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART02_SUPPLEMENT_TEST_0960
     * @tc.name testDecimalOverviewPart02TestTest096
     * @tc.desc Verify string|number string
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart02TestTest096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: string | number = '42';
      let d: Decimal = new Decimal(v);
      expect(d.toString()).assertEqual('42');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART02_SUPPLEMENT_TEST_0970
     * @tc.name testDecimalOverviewPart02TestTest097
     * @tc.desc Verify string|number|Decimal string equals
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart02TestTest097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: string | number | Decimal = '0.25';
      let a: Decimal = new Decimal('0.25');
      expect(a.equals(v)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART02_SUPPLEMENT_TEST_0980
     * @tc.name testDecimalOverviewPart02TestTest098
     * @tc.desc Verify string|number|boolean|Decimal string comparedTo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart02TestTest098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: string | number | boolean | Decimal = '1.5';
      let a: Decimal = new Decimal(1.5);
      expect(a.comparedTo(v)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART02_SUPPLEMENT_TEST_0990
     * @tc.name testDecimalOverviewPart02TestTest099
     * @tc.desc Verify string add Infinity
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart02TestTest099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Decimal = new Decimal('1e+308');
      let b: Decimal = new Decimal('1e+308');
      let r: Decimal = a.add(b);
      expect(r.isFinite()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART02_SUPPLEMENT_TEST_1000
     * @tc.name testDecimalOverviewPart02TestTest100
     * @tc.desc Verify toString with Infinity (assertEqual)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart02TestTest100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Decimal = new Decimal('1');
      let r: Decimal = a.div('0');
      expect(r.toString()).assertEqual('Infinity');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART02_SUPPLEMENT_TEST_1010
     * @tc.name testDecimalOverviewPart02TestTest101
     * @tc.desc Verify (assertTrue)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart02TestTest101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Decimal = new Decimal('-1');
      let r: Decimal = a.sqrt();
      expect(r.isNaN()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART02_SUPPLEMENT_TEST_1020
     * @tc.name testDecimalOverviewPart02TestTest102
     * @tc.desc Verify (assertEqual)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart02TestTest102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Decimal = new Decimal('1.666666');
      expect(a.toFixed(3)).assertEqual('1.667');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART02_SUPPLEMENT_TEST_1030
     * @tc.name testDecimalOverviewPart02TestTest103
     * @tc.desc Verify toString
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart02TestTest103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Decimal = new Decimal('1');
      let r: Decimal = a.div('3');
      expect(r.toString().length).assertLess(50);
    });


  });

}
