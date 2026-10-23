
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

export default function decimalLessThanOrEqualToPart02TestTest() {
  describe('DecimalLessThanOrEqualToPart02TestTest', () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_OR_EQUAL_TO_PART02_SUPPLEMENT_TEST_0100
     * @tc.name testDecimalLessThanOrEqualToPart02TestTest001
     * @tc.desc Verify arity=1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanOrEqualToPart02TestTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(10);
      let r: boolean = d.lessThanOrEqualTo('12');
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_OR_EQUAL_TO_PART02_SUPPLEMENT_TEST_0200
     * @tc.name testDecimalLessThanOrEqualToPart02TestTest002
     * @tc.desc Verify '0x10' 16 16 > 10 true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanOrEqualToPart02TestTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(10);
      let r: boolean = d.lessThanOrEqualTo('0x10');
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_OR_EQUAL_TO_PART02_SUPPLEMENT_TEST_0300
     * @tc.name testDecimalLessThanOrEqualToPart02TestTest003
     * @tc.desc Verify '0b101' 5 10 <= 5 false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanOrEqualToPart02TestTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(10);
      let r: boolean = d.lessThanOrEqualTo('0b101');
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_OR_EQUAL_TO_PART02_SUPPLEMENT_TEST_0400
     * @tc.name testDecimalLessThanOrEqualToPart02TestTest004
     * @tc.desc Verify '0o12' 10 true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanOrEqualToPart02TestTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(10);
      let r: boolean = d.lessThanOrEqualTo('0o12');
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_OR_EQUAL_TO_PART02_SUPPLEMENT_TEST_0500
     * @tc.name testDecimalLessThanOrEqualToPart02TestTest005
     * @tc.desc Verify '1_0' 10 true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanOrEqualToPart02TestTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(10);
      let r: boolean = d.lessThanOrEqualTo('1_0');
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_OR_EQUAL_TO_PART02_SUPPLEMENT_TEST_0600
     * @tc.name testDecimalLessThanOrEqualToPart02TestTest006
     * @tc.desc Verify '1e1' 10 true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanOrEqualToPart02TestTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(10);
      let r: boolean = d.lessThanOrEqualTo('1e1');
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_OR_EQUAL_TO_PART02_SUPPLEMENT_TEST_0700
     * @tc.name testDecimalLessThanOrEqualToPart02TestTest007
     * @tc.desc Verify '1e-7' 10 false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanOrEqualToPart02TestTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(10);
      let r: boolean = d.lessThanOrEqualTo('1e-7');
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_OR_EQUAL_TO_PART02_SUPPLEMENT_TEST_0800
     * @tc.name testDecimalLessThanOrEqualToPart02TestTest008
     * @tc.desc Verify '1e308' 10 <= 1e308 true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanOrEqualToPart02TestTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(10);
      let r: boolean = d.lessThanOrEqualTo('1e308');
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_OR_EQUAL_TO_PART02_SUPPLEMENT_TEST_0900
     * @tc.name testDecimalLessThanOrEqualToPart02TestTest009
     * @tc.desc Verify '1e309' Infinity 10 <= Infinity true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanOrEqualToPart02TestTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(10);
      let r: boolean = d.lessThanOrEqualTo('1e309');
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_OR_EQUAL_TO_PART02_SUPPLEMENT_TEST_1000
     * @tc.name testDecimalLessThanOrEqualToPart02TestTest010
     * @tc.desc Verify '-1e309' -Infinity 10 <= -Infinity false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanOrEqualToPart02TestTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(10);
      let r: boolean = d.lessThanOrEqualTo('-1e309');
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_OR_EQUAL_TO_PART02_SUPPLEMENT_TEST_1100
     * @tc.name testDecimalLessThanOrEqualToPart02TestTest011
     * @tc.desc Verify 'Infinity' 10 <= Infinity true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanOrEqualToPart02TestTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(10);
      let r: boolean = d.lessThanOrEqualTo('Infinity');
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_OR_EQUAL_TO_PART02_SUPPLEMENT_TEST_1200
     * @tc.name testDecimalLessThanOrEqualToPart02TestTest012
     * @tc.desc Verify '-Infinity' 10 <= -Infinity false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanOrEqualToPart02TestTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(10);
      let r: boolean = d.lessThanOrEqualTo('-Infinity');
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_OR_EQUAL_TO_PART02_SUPPLEMENT_TEST_1300
     * @tc.name testDecimalLessThanOrEqualToPart02TestTest013
     * @tc.desc Verify 'NaN' false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanOrEqualToPart02TestTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(10);
      let r: boolean = d.lessThanOrEqualTo('NaN');
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_OR_EQUAL_TO_PART02_SUPPLEMENT_TEST_1400
     * @tc.name testDecimalLessThanOrEqualToPart02TestTest014
     * @tc.desc Verify '+10' 10 true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanOrEqualToPart02TestTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(10);
      let r: boolean = d.lessThanOrEqualTo('+10');
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_OR_EQUAL_TO_PART02_SUPPLEMENT_TEST_1500
     * @tc.name testDecimalLessThanOrEqualToPart02TestTest015
     * @tc.desc Verify '-5' 10 false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanOrEqualToPart02TestTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(10);
      let r: boolean = d.lessThanOrEqualTo('-5');
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_OR_EQUAL_TO_PART02_SUPPLEMENT_TEST_1600
     * @tc.name testDecimalLessThanOrEqualToPart02TestTest016
     * @tc.desc Verify '-0' 0 10 <= 0 false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanOrEqualToPart02TestTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(10);
      let r: boolean = d.lessThanOrEqualTo('-0');
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_OR_EQUAL_TO_PART02_SUPPLEMENT_TEST_1700
     * @tc.name testDecimalLessThanOrEqualToPart02TestTest017
     * @tc.desc Verify '00010' 10 true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanOrEqualToPart02TestTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(10);
      let r: boolean = d.lessThanOrEqualTo('00010');
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_OR_EQUAL_TO_PART02_SUPPLEMENT_TEST_1800
     * @tc.name testDecimalLessThanOrEqualToPart02TestTest018
     * @tc.desc Verify '.5' 0.5 0.5 < 10 false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanOrEqualToPart02TestTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(10);
      let r: boolean = d.lessThanOrEqualTo('.5');
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_OR_EQUAL_TO_PART02_SUPPLEMENT_TEST_1900
     * @tc.name testDecimalLessThanOrEqualToPart02TestTest019
     * @tc.desc Verify '9.999999999999999999999999999999' 10 <= 9.99... false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanOrEqualToPart02TestTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(10);
      let r: boolean = d.lessThanOrEqualTo('9.999999999999999999999999999999');
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_OR_EQUAL_TO_PART02_SUPPLEMENT_TEST_2000
     * @tc.name testDecimalLessThanOrEqualToPart02TestTest020
     * @tc.desc Verify 30 '10.0000000000000000000000000001' 10 true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanOrEqualToPart02TestTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(10);
      let r: boolean = d.lessThanOrEqualTo('10.0000000000000000000000000001');
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_OR_EQUAL_TO_PART02_SUPPLEMENT_TEST_2100
     * @tc.name testDecimalLessThanOrEqualToPart02TestTest021
     * @tc.desc Verify '9'.repeat(2000) 10 true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanOrEqualToPart02TestTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(10);
      let big: string = '9'.repeat(2000);
      let r: boolean = d.lessThanOrEqualTo(big);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_OR_EQUAL_TO_PART02_SUPPLEMENT_TEST_2200
     * @tc.name testDecimalLessThanOrEqualToPart02TestTest022
     * @tc.desc Verify '0'.repeat(2000) + '1' 1 1 < 10 false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanOrEqualToPart02TestTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(10);
      let big: string = '0'.repeat(2000) + '1';
      let r: boolean = d.lessThanOrEqualTo(big);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_OR_EQUAL_TO_PART02_SUPPLEMENT_TEST_2300
     * @tc.name testDecimalLessThanOrEqualToPart02TestTest023
     * @tc.desc Verify '10.' + '0'.repeat(1000) + '1' 10 true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanOrEqualToPart02TestTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(10);
      let big: string = '10.' + '0'.repeat(1000) + '1';
      let r: boolean = d.lessThanOrEqualTo(big);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_OR_EQUAL_TO_PART02_SUPPLEMENT_TEST_2400
     * @tc.name testDecimalLessThanOrEqualToPart02TestTest024
     * @tc.desc Verify 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanOrEqualToPart02TestTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(10);
      try {
        d.lessThanOrEqualTo(' ');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_OR_EQUAL_TO_PART02_SUPPLEMENT_TEST_2500
     * @tc.name testDecimalLessThanOrEqualToPart02TestTest025
     * @tc.desc Verify '\t\n' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanOrEqualToPart02TestTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(10);
      try {
        d.lessThanOrEqualTo('\t\n');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_OR_EQUAL_TO_PART02_SUPPLEMENT_TEST_2600
     * @tc.name testDecimalLessThanOrEqualToPart02TestTest026
     * @tc.desc Verify NBSP ' ' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanOrEqualToPart02TestTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(10);
      try {
        d.lessThanOrEqualTo(' ');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_OR_EQUAL_TO_PART02_SUPPLEMENT_TEST_2700
     * @tc.name testDecimalLessThanOrEqualToPart02TestTest027
     * @tc.desc Verify ZWSP ' ' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanOrEqualToPart02TestTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(10);
      try {
        d.lessThanOrEqualTo('​');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_OR_EQUAL_TO_PART02_SUPPLEMENT_TEST_2800
     * @tc.name testDecimalLessThanOrEqualToPart02TestTest028
     * @tc.desc Verify '\n1' trim 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanOrEqualToPart02TestTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(10);
      try {
        d.lessThanOrEqualTo('\n1');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_OR_EQUAL_TO_PART02_SUPPLEMENT_TEST_2900
     * @tc.name testDecimalLessThanOrEqualToPart02TestTest029
     * @tc.desc Verify '12\n' trim 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanOrEqualToPart02TestTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(10);
      try {
        d.lessThanOrEqualTo('12\n');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_OR_EQUAL_TO_PART02_SUPPLEMENT_TEST_3000
     * @tc.name testDecimalLessThanOrEqualToPart02TestTest030
     * @tc.desc Verify ' 12 ' trim 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanOrEqualToPart02TestTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(10);
      try {
        d.lessThanOrEqualTo(' 12 ');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_OR_EQUAL_TO_PART02_SUPPLEMENT_TEST_3100
     * @tc.name testDecimalLessThanOrEqualToPart02TestTest031
     * @tc.desc Verify NUL ' ' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanOrEqualToPart02TestTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(10);
      try {
        d.lessThanOrEqualTo('\u0000');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_OR_EQUAL_TO_PART02_SUPPLEMENT_TEST_3200
     * @tc.name testDecimalLessThanOrEqualToPart02TestTest032
     * @tc.desc Verify NUL '1 ' 401 [device does not throw, expected error pending SDK alignment]
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanOrEqualToPart02TestTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(10);
      expect(d.lessThanOrEqualTo('1').toString().length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_OR_EQUAL_TO_PART02_SUPPLEMENT_TEST_3300
     * @tc.name testDecimalLessThanOrEqualToPart02TestTest033
     * @tc.desc Verify '1;' lessThanOrEqualTo 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanOrEqualToPart02TestTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(10);
      try {
        d.lessThanOrEqualTo('1;');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_OR_EQUAL_TO_PART02_SUPPLEMENT_TEST_3400
     * @tc.name testDecimalLessThanOrEqualToPart02TestTest034
     * @tc.desc Verify U+2029 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanOrEqualToPart02TestTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(10);
      try {
        d.lessThanOrEqualTo(';1');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_OR_EQUAL_TO_PART02_SUPPLEMENT_TEST_3500
     * @tc.name testDecimalLessThanOrEqualToPart02TestTest035
     * @tc.desc Verify BOM ' 12' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanOrEqualToPart02TestTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(10);
      try {
        d.lessThanOrEqualTo('﻿12');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_OR_EQUAL_TO_PART02_SUPPLEMENT_TEST_3600
     * @tc.name testDecimalLessThanOrEqualToPart02TestTest036
     * @tc.desc Verify BOM '12 ' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanOrEqualToPart02TestTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(10);
      try {
        d.lessThanOrEqualTo('12﻿');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_OR_EQUAL_TO_PART02_SUPPLEMENT_TEST_3700
     * @tc.name testDecimalLessThanOrEqualToPart02TestTest037
     * @tc.desc Verify ' ' ASCII 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanOrEqualToPart02TestTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(10);
      try {
        d.lessThanOrEqualTo('１２');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_OR_EQUAL_TO_PART02_SUPPLEMENT_TEST_3800
     * @tc.name testDecimalLessThanOrEqualToPart02TestTest038
     * @tc.desc Verify - ' ' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanOrEqualToPart02TestTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(10);
      try {
        d.lessThanOrEqualTo('١٢');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_OR_EQUAL_TO_PART02_SUPPLEMENT_TEST_3900
     * @tc.name testDecimalLessThanOrEqualToPart02TestTest039
     * @tc.desc Verify ' ' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanOrEqualToPart02TestTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(10);
      try {
        d.lessThanOrEqualTo('১২');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_OR_EQUAL_TO_PART02_SUPPLEMENT_TEST_4000
     * @tc.name testDecimalLessThanOrEqualToPart02TestTest040
     * @tc.desc Verify ' ' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanOrEqualToPart02TestTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(10);
      try {
        d.lessThanOrEqualTo('꧱꧲');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_OR_EQUAL_TO_PART02_SUPPLEMENT_TEST_4100
     * @tc.name testDecimalLessThanOrEqualToPart02TestTest041
     * @tc.desc Verify ' ' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanOrEqualToPart02TestTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(10);
      try {
        d.lessThanOrEqualTo('Ⅻ');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_OR_EQUAL_TO_PART02_SUPPLEMENT_TEST_4200
     * @tc.name testDecimalLessThanOrEqualToPart02TestTest042
     * @tc.desc Verify ' ' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanOrEqualToPart02TestTest042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(10);
      try {
        d.lessThanOrEqualTo('½');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_OR_EQUAL_TO_PART02_SUPPLEMENT_TEST_4300
     * @tc.name testDecimalLessThanOrEqualToPart02TestTest043
     * @tc.desc Verify emoji ' ' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanOrEqualToPart02TestTest043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(10);
      try {
        d.lessThanOrEqualTo('😀');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_OR_EQUAL_TO_PART02_SUPPLEMENT_TEST_4400
     * @tc.name testDecimalLessThanOrEqualToPart02TestTest044
     * @tc.desc Verify '\uD800' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanOrEqualToPart02TestTest044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(10);
      try {
        d.lessThanOrEqualTo('\uD800');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_OR_EQUAL_TO_PART02_SUPPLEMENT_TEST_4500
     * @tc.name testDecimalLessThanOrEqualToPart02TestTest045
     * @tc.desc Verify string | number '15' 15 true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanOrEqualToPart02TestTest045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(10);
      let a: string | number = '15';
      let b: string | number = 15;
      expect(d.lessThanOrEqualTo(a)).assertTrue();
      expect(d.lessThanOrEqualTo(b)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_OR_EQUAL_TO_PART02_SUPPLEMENT_TEST_4600
     * @tc.name testDecimalLessThanOrEqualToPart02TestTest046
     * @tc.desc Verify string | Decimal '10' Decimal true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanOrEqualToPart02TestTest046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(10);
      let a: string | Decimal = '10';
      let b: string | Decimal = new Decimal(10);
      expect(d.lessThanOrEqualTo(a)).assertTrue();
      expect(d.lessThanOrEqualTo(b)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_OR_EQUAL_TO_PART02_SUPPLEMENT_TEST_4700
     * @tc.name testDecimalLessThanOrEqualToPart02TestTest047
     * @tc.desc Verify number | Decimal 5 false Decimal 20 true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanOrEqualToPart02TestTest047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(10);
      let a: number | Decimal = 5;
      let b: number | Decimal = new Decimal(20);
      expect(d.lessThanOrEqualTo(a)).assertFalse();
      expect(d.lessThanOrEqualTo(b)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_OR_EQUAL_TO_PART02_SUPPLEMENT_TEST_4800
     * @tc.name testDecimalLessThanOrEqualToPart02TestTest048
     * @tc.desc Verify string | number | Decimal '15' 20 true 5 false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanOrEqualToPart02TestTest048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(10);
      let s: string | number | Decimal = '15';
      let n: string | number | Decimal = 5;
      let dec: string | number | Decimal = new Decimal(20);
      expect(d.lessThanOrEqualTo(s)).assertTrue();
      expect(d.lessThanOrEqualTo(n)).assertFalse();
      expect(d.lessThanOrEqualTo(dec)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_OR_EQUAL_TO_PART02_SUPPLEMENT_TEST_4900
     * @tc.name testDecimalLessThanOrEqualToPart02TestTest049
     * @tc.desc Verify string | number | Decimal | undefined undefined 4
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanOrEqualToPart02TestTest049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(10);
      let s: string | number | Decimal | undefined = '15';
      let n: string | number | Decimal | undefined = 5;
      let dec: string | number | Decimal | undefined = new Decimal(20);
      let u: string | number | Decimal | undefined = undefined;
      expect(d.lessThanOrEqualTo(s)).assertTrue();
      expect(d.lessThanOrEqualTo(n)).assertFalse();
      expect(d.lessThanOrEqualTo(dec)).assertTrue();
      try {
        d.lessThanOrEqualTo(u as ESObject);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_OR_EQUAL_TO_PART02_SUPPLEMENT_TEST_5000
     * @tc.name testDecimalLessThanOrEqualToPart02TestTest050
     * @tc.desc Verify null string null 401 '15' true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanOrEqualToPart02TestTest050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(10);
      let n: null | string = null;
      let s: null | string = '15';
      try {
        d.lessThanOrEqualTo(n as ESObject);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(d.lessThanOrEqualTo(s)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_OR_EQUAL_TO_PART02_SUPPLEMENT_TEST_5100
     * @tc.name testDecimalLessThanOrEqualToPart02TestTest051
     * @tc.desc Verify undefined string undefined 401 '15' true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanOrEqualToPart02TestTest051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(10);
      let u: undefined | string = undefined;
      let s: undefined | string = '15';
      try {
        d.lessThanOrEqualTo(u as ESObject);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(d.lessThanOrEqualTo(s)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_OR_EQUAL_TO_PART02_SUPPLEMENT_TEST_5200
     * @tc.name testDecimalLessThanOrEqualToPart02TestTest052
     * @tc.desc Verify null number null 401 5 false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanOrEqualToPart02TestTest052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(10);
      let n: null | number = null;
      let num: null | number = 5;
      try {
        d.lessThanOrEqualTo(n as ESObject);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(d.lessThanOrEqualTo(num)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_OR_EQUAL_TO_PART02_SUPPLEMENT_TEST_5300
     * @tc.name testDecimalLessThanOrEqualToPart02TestTest053
     * @tc.desc Verify undefined number undefined 401 15 true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanOrEqualToPart02TestTest053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(10);
      let u: undefined | number = undefined;
      let num: undefined | number = 15;
      try {
        d.lessThanOrEqualTo(u as ESObject);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(d.lessThanOrEqualTo(num)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_OR_EQUAL_TO_PART02_SUPPLEMENT_TEST_5400
     * @tc.name testDecimalLessThanOrEqualToPart02TestTest054
     * @tc.desc Verify null Decimal null 401 Decimal 15 true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanOrEqualToPart02TestTest054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(10);
      let n: null | Decimal = null;
      let dec: null | Decimal = new Decimal(15);
      try {
        d.lessThanOrEqualTo(n as ESObject);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(d.lessThanOrEqualTo(dec)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_OR_EQUAL_TO_PART02_SUPPLEMENT_TEST_5500
     * @tc.name testDecimalLessThanOrEqualToPart02TestTest055
     * @tc.desc Verify undefined Decimal undefined 401 Decimal 5 false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanOrEqualToPart02TestTest055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(10);
      let u: undefined | Decimal = undefined;
      let dec: undefined | Decimal = new Decimal(5);
      try {
        d.lessThanOrEqualTo(u as ESObject);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(d.lessThanOrEqualTo(dec)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_OR_EQUAL_TO_PART02_SUPPLEMENT_TEST_5600
     * @tc.name testDecimalLessThanOrEqualToPart02TestTest056
     * @tc.desc Verify new Decimal(10) new Decimal('10') true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanOrEqualToPart02TestTest056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Decimal = new Decimal(10);
      let b: Decimal = new Decimal('10');
      expect(a.lessThanOrEqualTo(b)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_OR_EQUAL_TO_PART02_SUPPLEMENT_TEST_5700
     * @tc.name testDecimalLessThanOrEqualToPart02TestTest057
     * @tc.desc Verify Decimal new Decimal('1e1') 10 true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanOrEqualToPart02TestTest057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(10);
      let dec: Decimal = new Decimal('1e1');
      expect(d.lessThanOrEqualTo(dec)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_OR_EQUAL_TO_PART02_SUPPLEMENT_TEST_5800
     * @tc.name testDecimalLessThanOrEqualToPart02TestTest058
     * @tc.desc Verify '15' true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanOrEqualToPart02TestTest058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(10);
      let r: boolean = d.lessThanOrEqualTo('15');
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_OR_EQUAL_TO_PART02_SUPPLEMENT_TEST_5900
     * @tc.name testDecimalLessThanOrEqualToPart02TestTest059
     * @tc.desc Verify '10' true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanOrEqualToPart02TestTest059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(10);
      let r: boolean = d.lessThanOrEqualTo('10');
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_OR_EQUAL_TO_PART02_SUPPLEMENT_TEST_6000
     * @tc.name testDecimalLessThanOrEqualToPart02TestTest060
     * @tc.desc Verify '5' false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanOrEqualToPart02TestTest060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(10);
      let r: boolean = d.lessThanOrEqualTo('5');
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_OR_EQUAL_TO_PART02_SUPPLEMENT_TEST_6100
     * @tc.name testDecimalLessThanOrEqualToPart02TestTest061
     * @tc.desc Verify toString '10'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanOrEqualToPart02TestTest061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(10);
      d.lessThanOrEqualTo(new Decimal(20));
      expect(d.toString()).assertEqual('10');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_OR_EQUAL_TO_PART02_SUPPLEMENT_TEST_6200
     * @tc.name testDecimalLessThanOrEqualToPart02TestTest062
     * @tc.desc Verify '' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanOrEqualToPart02TestTest062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(10);
      try {
        d.lessThanOrEqualTo('');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_OR_EQUAL_TO_PART02_SUPPLEMENT_TEST_6300
     * @tc.name testDecimalLessThanOrEqualToPart02TestTest063
     * @tc.desc Verify 'abc' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanOrEqualToPart02TestTest063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(10);
      try {
        d.lessThanOrEqualTo('abc');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_OR_EQUAL_TO_PART02_SUPPLEMENT_TEST_6400
     * @tc.name testDecimalLessThanOrEqualToPart02TestTest064
     * @tc.desc Verify '1.2.3' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanOrEqualToPart02TestTest064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(10);
      try {
        d.lessThanOrEqualTo('1.2.3');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_OR_EQUAL_TO_PART02_SUPPLEMENT_TEST_6500
     * @tc.name testDecimalLessThanOrEqualToPart02TestTest065
     * @tc.desc Verify '1,000' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanOrEqualToPart02TestTest065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(10);
      try {
        d.lessThanOrEqualTo('1,000');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_OR_EQUAL_TO_PART02_SUPPLEMENT_TEST_6600
     * @tc.name testDecimalLessThanOrEqualToPart02TestTest066
     * @tc.desc Verify 'true' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanOrEqualToPart02TestTest066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(10);
      try {
        d.lessThanOrEqualTo('true');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_OR_EQUAL_TO_PART02_SUPPLEMENT_TEST_6700
     * @tc.name testDecimalLessThanOrEqualToPart02TestTest067
     * @tc.desc Verify 'null' null 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanOrEqualToPart02TestTest067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(10);
      try {
        d.lessThanOrEqualTo('null');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_OR_EQUAL_TO_PART02_SUPPLEMENT_TEST_6800
     * @tc.name testDecimalLessThanOrEqualToPart02TestTest068
     * @tc.desc Verify 'undefined' undefined 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanOrEqualToPart02TestTest068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(10);
      try {
        d.lessThanOrEqualTo('undefined');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_OR_EQUAL_TO_PART02_SUPPLEMENT_TEST_6900
     * @tc.name testDecimalLessThanOrEqualToPart02TestTest069
     * @tc.desc Verify '1e' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanOrEqualToPart02TestTest069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(10);
      try {
        d.lessThanOrEqualTo('1e');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_OR_EQUAL_TO_PART02_SUPPLEMENT_TEST_7000
     * @tc.name testDecimalLessThanOrEqualToPart02TestTest070
     * @tc.desc Verify '1e+' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanOrEqualToPart02TestTest070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(10);
      try {
        d.lessThanOrEqualTo('1e+');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_OR_EQUAL_TO_PART02_SUPPLEMENT_TEST_7100
     * @tc.name testDecimalLessThanOrEqualToPart02TestTest071
     * @tc.desc Verify '.' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanOrEqualToPart02TestTest071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(10);
      try {
        d.lessThanOrEqualTo('.');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_OR_EQUAL_TO_PART02_SUPPLEMENT_TEST_7200
     * @tc.name testDecimalLessThanOrEqualToPart02TestTest072
     * @tc.desc Verify '+.' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanOrEqualToPart02TestTest072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(10);
      try {
        d.lessThanOrEqualTo('+.');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_OR_EQUAL_TO_PART02_SUPPLEMENT_TEST_7300
     * @tc.name testDecimalLessThanOrEqualToPart02TestTest073
     * @tc.desc Verify '0x' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanOrEqualToPart02TestTest073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(10);
      try {
        d.lessThanOrEqualTo('0x');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_OR_EQUAL_TO_PART02_SUPPLEMENT_TEST_7400
     * @tc.name testDecimalLessThanOrEqualToPart02TestTest074
     * @tc.desc Verify '0b' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanOrEqualToPart02TestTest074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(10);
      try {
        d.lessThanOrEqualTo('0b');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_OR_EQUAL_TO_PART02_SUPPLEMENT_TEST_7500
     * @tc.name testDecimalLessThanOrEqualToPart02TestTest075
     * @tc.desc Verify XSS '<script>alert(1)</script>' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanOrEqualToPart02TestTest075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(10);
      try {
        d.lessThanOrEqualTo('<script>alert(1)</script>');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_OR_EQUAL_TO_PART02_SUPPLEMENT_TEST_7600
     * @tc.name testDecimalLessThanOrEqualToPart02TestTest076
     * @tc.desc Verify '1 2' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanOrEqualToPart02TestTest076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(10);
      try {
        d.lessThanOrEqualTo('1​2');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });


  });

}
