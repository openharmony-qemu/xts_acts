
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

export default function decimalPropertiesPart06TestTest() {
  describe('DecimalPropertiesPart06TestTest', () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART06_SUPPLEMENT_TEST_0100
     * @tc.name testDecimalPropertiesPart06TestTest001
     * @tc.desc Verify (U+200B) '\u200B5' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart06TestTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
      let d: Decimal = new Decimal('\u200B5');
      expect(d.toString()).assertEqual('NaN');
      expect(d.d.length).assertEqual(0);
      expect(Number.isNaN(d.e)).assertTrue();
      expect(Number.isNaN(d.s)).assertTrue();
      expect(d.isNaN()).assertTrue();
      expect(d.d === d.d).assertTrue();
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART06_SUPPLEMENT_TEST_0200
     * @tc.name testDecimalPropertiesPart06TestTest002
     * @tc.desc Verify '5\u200B' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart06TestTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
      let d: Decimal = new Decimal('5\u200B');
      expect(d.toString()).assertEqual('NaN');
      expect(d.d.length).assertEqual(0);
      expect(Number.isNaN(d.e)).assertTrue();
      expect(Number.isNaN(d.s)).assertTrue();
      expect(d.isNaN()).assertTrue();
      expect(d.d === d.d).assertTrue();
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART06_SUPPLEMENT_TEST_0300
     * @tc.name testDecimalPropertiesPart06TestTest003
     * @tc.desc Verify '\u200B' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart06TestTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
      let d: Decimal = new Decimal('\u200B');
      expect(d.toString()).assertEqual('NaN');
      expect(d.d.length).assertEqual(0);
      expect(Number.isNaN(d.e)).assertTrue();
      expect(Number.isNaN(d.s)).assertTrue();
      expect(d.isNaN()).assertTrue();
      expect(d.d === d.d).assertTrue();
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART06_SUPPLEMENT_TEST_0400
     * @tc.name testDecimalPropertiesPart06TestTest004
     * @tc.desc Verify BOM '\uFEFF5' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart06TestTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
      let d: Decimal = new Decimal('\uFEFF5');
      expect(d.toString()).assertEqual('NaN');
      expect(d.d.length).assertEqual(0);
      expect(Number.isNaN(d.e)).assertTrue();
      expect(Number.isNaN(d.s)).assertTrue();
      expect(d.isNaN()).assertTrue();
      expect(d.d === d.d).assertTrue();
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART06_SUPPLEMENT_TEST_0500
     * @tc.name testDecimalPropertiesPart06TestTest005
     * @tc.desc Verify BOM '5\uFEFF6' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart06TestTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
      let d: Decimal = new Decimal('5\uFEFF6');
      expect(d.toString()).assertEqual('NaN');
      expect(d.d.length).assertEqual(0);
      expect(Number.isNaN(d.e)).assertTrue();
      expect(Number.isNaN(d.s)).assertTrue();
      expect(d.isNaN()).assertTrue();
      expect(d.d === d.d).assertTrue();
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART06_SUPPLEMENT_TEST_0600
     * @tc.name testDecimalPropertiesPart06TestTest006
     * @tc.desc Verify BOM '\uFEFF' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart06TestTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
      let d: Decimal = new Decimal('\uFEFF');
      expect(d.toString()).assertEqual('NaN');
      expect(d.d.length).assertEqual(0);
      expect(Number.isNaN(d.e)).assertTrue();
      expect(Number.isNaN(d.s)).assertTrue();
      expect(d.isNaN()).assertTrue();
      expect(d.d === d.d).assertTrue();
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART06_SUPPLEMENT_TEST_0700
     * @tc.name testDecimalPropertiesPart06TestTest007
     * @tc.desc Verify (U+200D) '5\u200D6' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart06TestTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
      let d: Decimal = new Decimal('5\u200D6');
      expect(d.toString()).assertEqual('NaN');
      expect(d.d.length).assertEqual(0);
      expect(Number.isNaN(d.e)).assertTrue();
      expect(Number.isNaN(d.s)).assertTrue();
      expect(d.isNaN()).assertTrue();
      expect(d.d === d.d).assertTrue();
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART06_SUPPLEMENT_TEST_0800
     * @tc.name testDecimalPropertiesPart06TestTest008
     * @tc.desc Verify (U+200C) '\u200C5' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart06TestTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
      let d: Decimal = new Decimal('\u200C5');
      expect(d.toString()).assertEqual('NaN');
      expect(d.d.length).assertEqual(0);
      expect(Number.isNaN(d.e)).assertTrue();
      expect(Number.isNaN(d.s)).assertTrue();
      expect(d.isNaN()).assertTrue();
      expect(d.d === d.d).assertTrue();
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART06_SUPPLEMENT_TEST_0900
     * @tc.name testDecimalPropertiesPart06TestTest009
     * @tc.desc Verify (U+2060) '5\u2060' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart06TestTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
      let d: Decimal = new Decimal('5\u2060');
      expect(d.toString()).assertEqual('NaN');
      expect(d.d.length).assertEqual(0);
      expect(Number.isNaN(d.e)).assertTrue();
      expect(Number.isNaN(d.s)).assertTrue();
      expect(d.isNaN()).assertTrue();
      expect(d.d === d.d).assertTrue();
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART06_SUPPLEMENT_TEST_1000
     * @tc.name testDecimalPropertiesPart06TestTest010
     * @tc.desc Verify (U+00AD) '\u00AD5' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart06TestTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
      let d: Decimal = new Decimal('\u00AD5');
      expect(d.toString()).assertEqual('NaN');
      expect(d.d.length).assertEqual(0);
      expect(Number.isNaN(d.e)).assertTrue();
      expect(Number.isNaN(d.s)).assertTrue();
      expect(d.isNaN()).assertTrue();
      expect(d.d === d.d).assertTrue();
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART06_SUPPLEMENT_TEST_1100
     * @tc.name testDecimalPropertiesPart06TestTest011
     * @tc.desc Verify (U+3000) '\u30005' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart06TestTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
      let d: Decimal = new Decimal('\u30005');
      expect(d.toString()).assertEqual('NaN');
      expect(d.d.length).assertEqual(0);
      expect(Number.isNaN(d.e)).assertTrue();
      expect(Number.isNaN(d.s)).assertTrue();
      expect(d.isNaN()).assertTrue();
      expect(d.d === d.d).assertTrue();
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART06_SUPPLEMENT_TEST_1200
     * @tc.name testDecimalPropertiesPart06TestTest012
     * @tc.desc Verify '5\u3000' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart06TestTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
      let d: Decimal = new Decimal('5\u3000');
      expect(d.toString()).assertEqual('NaN');
      expect(d.d.length).assertEqual(0);
      expect(Number.isNaN(d.e)).assertTrue();
      expect(Number.isNaN(d.s)).assertTrue();
      expect(d.isNaN()).assertTrue();
      expect(d.d === d.d).assertTrue();
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART06_SUPPLEMENT_TEST_1300
     * @tc.name testDecimalPropertiesPart06TestTest013
     * @tc.desc Verify (U+202F) '\u202F5' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart06TestTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
      let d: Decimal = new Decimal('\u202F5');
      expect(d.toString()).assertEqual('NaN');
      expect(d.d.length).assertEqual(0);
      expect(Number.isNaN(d.e)).assertTrue();
      expect(Number.isNaN(d.s)).assertTrue();
      expect(d.isNaN()).assertTrue();
      expect(d.d === d.d).assertTrue();
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART06_SUPPLEMENT_TEST_1400
     * @tc.name testDecimalPropertiesPart06TestTest014
     * @tc.desc Verify (U+205F) '1\u205F2' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart06TestTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
      let d: Decimal = new Decimal('1\u205F2');
      expect(d.toString()).assertEqual('NaN');
      expect(d.d.length).assertEqual(0);
      expect(Number.isNaN(d.e)).assertTrue();
      expect(Number.isNaN(d.s)).assertTrue();
      expect(d.isNaN()).assertTrue();
      expect(d.d === d.d).assertTrue();
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART06_SUPPLEMENT_TEST_1500
     * @tc.name testDecimalPropertiesPart06TestTest015
     * @tc.desc Verify (U+200E) '\u200E5' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart06TestTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
      let d: Decimal = new Decimal('\u200E5');
      expect(d.toString()).assertEqual('NaN');
      expect(d.d.length).assertEqual(0);
      expect(Number.isNaN(d.e)).assertTrue();
      expect(Number.isNaN(d.s)).assertTrue();
      expect(d.isNaN()).assertTrue();
      expect(d.d === d.d).assertTrue();
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART06_SUPPLEMENT_TEST_1600
     * @tc.name testDecimalPropertiesPart06TestTest016
     * @tc.desc Verify (U+200F) '5\u200F6' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart06TestTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
      let d: Decimal = new Decimal('5\u200F6');
      expect(d.toString()).assertEqual('NaN');
      expect(d.d.length).assertEqual(0);
      expect(Number.isNaN(d.e)).assertTrue();
      expect(Number.isNaN(d.s)).assertTrue();
      expect(d.isNaN()).assertTrue();
      expect(d.d === d.d).assertTrue();
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART06_SUPPLEMENT_TEST_1700
     * @tc.name testDecimalPropertiesPart06TestTest017
     * @tc.desc Verify (U+202E) '\u202E5' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart06TestTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
      let d: Decimal = new Decimal('\u202E5');
      expect(d.toString()).assertEqual('NaN');
      expect(d.d.length).assertEqual(0);
      expect(Number.isNaN(d.e)).assertTrue();
      expect(Number.isNaN(d.s)).assertTrue();
      expect(d.isNaN()).assertTrue();
      expect(d.d === d.d).assertTrue();
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART06_SUPPLEMENT_TEST_1800
     * @tc.name testDecimalPropertiesPart06TestTest018
     * @tc.desc Verify (U+FE0F) '5\uFE0F' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart06TestTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
      let d: Decimal = new Decimal('5\uFE0F');
      expect(d.toString()).assertEqual('NaN');
      expect(d.d.length).assertEqual(0);
      expect(Number.isNaN(d.e)).assertTrue();
      expect(Number.isNaN(d.s)).assertTrue();
      expect(d.isNaN()).assertTrue();
      expect(d.d === d.d).assertTrue();
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART06_SUPPLEMENT_TEST_1900
     * @tc.name testDecimalPropertiesPart06TestTest019
     * @tc.desc Verify '1\u200B\u200B5' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart06TestTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
      let d: Decimal = new Decimal('1\u200B\u200B5');
      expect(d.toString()).assertEqual('NaN');
      expect(d.d.length).assertEqual(0);
      expect(Number.isNaN(d.e)).assertTrue();
      expect(Number.isNaN(d.s)).assertTrue();
      expect(d.isNaN()).assertTrue();
      expect(d.d === d.d).assertTrue();
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART06_SUPPLEMENT_TEST_2000
     * @tc.name testDecimalPropertiesPart06TestTest020
     * @tc.desc Verify (U+2800) '5\u2800' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart06TestTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
      let d: Decimal = new Decimal('5\u2800');
      expect(d.toString()).assertEqual('NaN');
      expect(d.d.length).assertEqual(0);
      expect(Number.isNaN(d.e)).assertTrue();
      expect(Number.isNaN(d.s)).assertTrue();
      expect(d.isNaN()).assertTrue();
      expect(d.d === d.d).assertTrue();
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART06_SUPPLEMENT_TEST_2100
     * @tc.name testDecimalPropertiesPart06TestTest021
     * @tc.desc Verify (U+180E) '\u180E5' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart06TestTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
      let d: Decimal = new Decimal('\u180E5');
      expect(d.toString()).assertEqual('NaN');
      expect(d.d.length).assertEqual(0);
      expect(Number.isNaN(d.e)).assertTrue();
      expect(Number.isNaN(d.s)).assertTrue();
      expect(d.isNaN()).assertTrue();
      expect(d.d === d.d).assertTrue();
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART06_SUPPLEMENT_TEST_2200
     * @tc.name testDecimalPropertiesPart06TestTest022
     * @tc.desc Verify NUL '\u00005' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart06TestTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
      let d: Decimal = new Decimal('\u00005');
      expect(d.toString()).assertEqual('NaN');
      expect(d.d.length).assertEqual(0);
      expect(Number.isNaN(d.e)).assertTrue();
      expect(Number.isNaN(d.s)).assertTrue();
      expect(d.isNaN()).assertTrue();
      expect(d.d === d.d).assertTrue();
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART06_SUPPLEMENT_TEST_2300
     * @tc.name testDecimalPropertiesPart06TestTest023
     * @tc.desc Verify NUL '5\u0000' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart06TestTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
      let d: Decimal = new Decimal('5\u0000');
      expect(d.toString()).assertEqual('NaN');
      expect(d.d.length).assertEqual(0);
      expect(Number.isNaN(d.e)).assertTrue();
      expect(Number.isNaN(d.s)).assertTrue();
      expect(d.isNaN()).assertTrue();
      expect(d.d === d.d).assertTrue();
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART06_SUPPLEMENT_TEST_2400
     * @tc.name testDecimalPropertiesPart06TestTest024
     * @tc.desc Verify NUL '\u0000' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart06TestTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
      let d: Decimal = new Decimal('\u0000');
      expect(d.toString()).assertEqual('NaN');
      expect(d.d.length).assertEqual(0);
      expect(Number.isNaN(d.e)).assertTrue();
      expect(Number.isNaN(d.s)).assertTrue();
      expect(d.isNaN()).assertTrue();
      expect(d.d === d.d).assertTrue();
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART06_SUPPLEMENT_TEST_2500
     * @tc.name testDecimalPropertiesPart06TestTest025
     * @tc.desc Verify NUL '5\u00006' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart06TestTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
      let d: Decimal = new Decimal('5\u00006');
      expect(d.toString()).assertEqual('NaN');
      expect(d.d.length).assertEqual(0);
      expect(Number.isNaN(d.e)).assertTrue();
      expect(Number.isNaN(d.s)).assertTrue();
      expect(d.isNaN()).assertTrue();
      expect(d.d === d.d).assertTrue();
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART06_SUPPLEMENT_TEST_2600
     * @tc.name testDecimalPropertiesPart06TestTest026
     * @tc.desc Verify SOH(U+0001) '\u00015' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart06TestTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
      let d: Decimal = new Decimal('\u00015');
      expect(d.toString()).assertEqual('NaN');
      expect(d.d.length).assertEqual(0);
      expect(Number.isNaN(d.e)).assertTrue();
      expect(Number.isNaN(d.s)).assertTrue();
      expect(d.isNaN()).assertTrue();
      expect(d.d === d.d).assertTrue();
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART06_SUPPLEMENT_TEST_2700
     * @tc.name testDecimalPropertiesPart06TestTest027
     * @tc.desc Verify (U+000B) '\u000B5' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart06TestTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
      let d: Decimal = new Decimal('\u000B5');
      expect(d.toString()).assertEqual('NaN');
      expect(d.d.length).assertEqual(0);
      expect(Number.isNaN(d.e)).assertTrue();
      expect(Number.isNaN(d.s)).assertTrue();
      expect(d.isNaN()).assertTrue();
      expect(d.d === d.d).assertTrue();
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART06_SUPPLEMENT_TEST_2800
     * @tc.name testDecimalPropertiesPart06TestTest028
     * @tc.desc Verify (U+000C) '\u000C5' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart06TestTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
      let d: Decimal = new Decimal('\u000C5');
      expect(d.toString()).assertEqual('NaN');
      expect(d.d.length).assertEqual(0);
      expect(Number.isNaN(d.e)).assertTrue();
      expect(Number.isNaN(d.s)).assertTrue();
      expect(d.isNaN()).assertTrue();
      expect(d.d === d.d).assertTrue();
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART06_SUPPLEMENT_TEST_2900
     * @tc.name testDecimalPropertiesPart06TestTest029
     * @tc.desc Verify '5\u000D' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart06TestTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
      let d: Decimal = new Decimal('5\u000D');
      expect(d.toString()).assertEqual('NaN');
      expect(d.d.length).assertEqual(0);
      expect(Number.isNaN(d.e)).assertTrue();
      expect(Number.isNaN(d.s)).assertTrue();
      expect(d.isNaN()).assertTrue();
      expect(d.d === d.d).assertTrue();
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART06_SUPPLEMENT_TEST_3000
     * @tc.name testDecimalPropertiesPart06TestTest030
     * @tc.desc Verify '\n5' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart06TestTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
      let d: Decimal = new Decimal('\n5');
      expect(d.toString()).assertEqual('NaN');
      expect(d.d.length).assertEqual(0);
      expect(Number.isNaN(d.e)).assertTrue();
      expect(Number.isNaN(d.s)).assertTrue();
      expect(d.isNaN()).assertTrue();
      expect(d.d === d.d).assertTrue();
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART06_SUPPLEMENT_TEST_3100
     * @tc.name testDecimalPropertiesPart06TestTest031
     * @tc.desc Verify CRLF '5\r\n6' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart06TestTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
      let d: Decimal = new Decimal('5\r\n6');
      expect(d.toString()).assertEqual('NaN');
      expect(d.d.length).assertEqual(0);
      expect(Number.isNaN(d.e)).assertTrue();
      expect(Number.isNaN(d.s)).assertTrue();
      expect(d.isNaN()).assertTrue();
      expect(d.d === d.d).assertTrue();
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART06_SUPPLEMENT_TEST_3200
     * @tc.name testDecimalPropertiesPart06TestTest032
     * @tc.desc Verify ESC(U+001B) '\u001B5' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart06TestTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
      let d: Decimal = new Decimal('\u001B5');
      expect(d.toString()).assertEqual('NaN');
      expect(d.d.length).assertEqual(0);
      expect(Number.isNaN(d.e)).assertTrue();
      expect(Number.isNaN(d.s)).assertTrue();
      expect(d.isNaN()).assertTrue();
      expect(d.d === d.d).assertTrue();
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART06_SUPPLEMENT_TEST_3300
     * @tc.name testDecimalPropertiesPart06TestTest033
     * @tc.desc Verify (U+001F) '\u001F5' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart06TestTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
      let d: Decimal = new Decimal('\u001F5');
      expect(d.toString()).assertEqual('NaN');
      expect(d.d.length).assertEqual(0);
      expect(Number.isNaN(d.e)).assertTrue();
      expect(Number.isNaN(d.s)).assertTrue();
      expect(d.isNaN()).assertTrue();
      expect(d.d === d.d).assertTrue();
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART06_SUPPLEMENT_TEST_3400
     * @tc.name testDecimalPropertiesPart06TestTest034
     * @tc.desc Verify STX(U+0002) '5\u00026' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart06TestTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
      let d: Decimal = new Decimal('5\u00026');
      expect(d.toString()).assertEqual('NaN');
      expect(d.d.length).assertEqual(0);
      expect(Number.isNaN(d.e)).assertTrue();
      expect(Number.isNaN(d.s)).assertTrue();
      expect(d.isNaN()).assertTrue();
      expect(d.d === d.d).assertTrue();
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART06_SUPPLEMENT_TEST_3500
     * @tc.name testDecimalPropertiesPart06TestTest035
     * @tc.desc Verify DEL(U+007F) '5\u007F' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart06TestTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
      let d: Decimal = new Decimal('5\u007F');
      expect(d.toString()).assertEqual('NaN');
      expect(d.d.length).assertEqual(0);
      expect(Number.isNaN(d.e)).assertTrue();
      expect(Number.isNaN(d.s)).assertTrue();
      expect(d.isNaN()).assertTrue();
      expect(d.d === d.d).assertTrue();
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART06_SUPPLEMENT_TEST_3600
     * @tc.name testDecimalPropertiesPart06TestTest036
     * @tc.desc Verify NEL(U+0085) '\u00855' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart06TestTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
      let d: Decimal = new Decimal('\u00855');
      expect(d.toString()).assertEqual('NaN');
      expect(d.d.length).assertEqual(0);
      expect(Number.isNaN(d.e)).assertTrue();
      expect(Number.isNaN(d.s)).assertTrue();
      expect(d.isNaN()).assertTrue();
      expect(d.d === d.d).assertTrue();
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART06_SUPPLEMENT_TEST_3700
     * @tc.name testDecimalPropertiesPart06TestTest037
     * @tc.desc Verify (700 ) '1'.repeat(700)+'x' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart06TestTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
      let d: Decimal = new Decimal('1'.repeat(700) + 'x');
      expect(d.toString()).assertEqual('NaN');
      expect(d.d.length).assertEqual(0);
      expect(Number.isNaN(d.e)).assertTrue();
      expect(Number.isNaN(d.s)).assertTrue();
      expect(d.isNaN()).assertTrue();
      expect(d.d === d.d).assertTrue();
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART06_SUPPLEMENT_TEST_3800
     * @tc.name testDecimalPropertiesPart06TestTest038
     * @tc.desc Verify 'x'+'1'.repeat(700) 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart06TestTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
      let d: Decimal = new Decimal('x' + '1'.repeat(700));
      expect(d.toString()).assertEqual('NaN');
      expect(d.d.length).assertEqual(0);
      expect(Number.isNaN(d.e)).assertTrue();
      expect(Number.isNaN(d.s)).assertTrue();
      expect(d.isNaN()).assertTrue();
      expect(d.d === d.d).assertTrue();
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART06_SUPPLEMENT_TEST_3900
     * @tc.name testDecimalPropertiesPart06TestTest039
     * @tc.desc Verify '1'.repeat(600)+' 2' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart06TestTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
      let d: Decimal = new Decimal('1'.repeat(600) + ' 2');
      expect(d.toString()).assertEqual('NaN');
      expect(d.d.length).assertEqual(0);
      expect(Number.isNaN(d.e)).assertTrue();
      expect(Number.isNaN(d.s)).assertTrue();
      expect(d.isNaN()).assertTrue();
      expect(d.d === d.d).assertTrue();
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART06_SUPPLEMENT_TEST_4000
     * @tc.name testDecimalPropertiesPart06TestTest040
     * @tc.desc Verify '1'.repeat(300)+'.'+'2'.repeat(300)+'.3' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart06TestTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
      let d: Decimal = new Decimal('1'.repeat(300) + '.' + '2'.repeat(300) + '.3');
      expect(d.toString()).assertEqual('NaN');
      expect(d.d.length).assertEqual(0);
      expect(Number.isNaN(d.e)).assertTrue();
      expect(Number.isNaN(d.s)).assertTrue();
      expect(d.isNaN()).assertTrue();
      expect(d.d === d.d).assertTrue();
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART06_SUPPLEMENT_TEST_4100
     * @tc.name testDecimalPropertiesPart06TestTest041
     * @tc.desc Verify '-'+'1'.repeat(600)+'-' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart06TestTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
      let d: Decimal = new Decimal('-' + '1'.repeat(600) + '-');
      expect(d.toString()).assertEqual('NaN');
      expect(d.d.length).assertEqual(0);
      expect(Number.isNaN(d.e)).assertTrue();
      expect(Number.isNaN(d.s)).assertTrue();
      expect(d.isNaN()).assertTrue();
      expect(d.d === d.d).assertTrue();
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART06_SUPPLEMENT_TEST_4200
     * @tc.name testDecimalPropertiesPart06TestTest042
     * @tc.desc Verify NUL '1'.repeat(500)+'\u0000' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart06TestTest042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
      let d: Decimal = new Decimal('1'.repeat(500) + '\u0000');
      expect(d.toString()).assertEqual('NaN');
      expect(d.d.length).assertEqual(0);
      expect(Number.isNaN(d.e)).assertTrue();
      expect(Number.isNaN(d.s)).assertTrue();
      expect(d.isNaN()).assertTrue();
      expect(d.d === d.d).assertTrue();
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART06_SUPPLEMENT_TEST_4300
     * @tc.name testDecimalPropertiesPart06TestTest043
     * @tc.desc Verify '1'.repeat(400)+'\u200B' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart06TestTest043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
      let d: Decimal = new Decimal('1'.repeat(400) + '\u200B');
      expect(d.toString()).assertEqual('NaN');
      expect(d.d.length).assertEqual(0);
      expect(Number.isNaN(d.e)).assertTrue();
      expect(Number.isNaN(d.s)).assertTrue();
      expect(d.isNaN()).assertTrue();
      expect(d.d === d.d).assertTrue();
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART06_SUPPLEMENT_TEST_4400
     * @tc.name testDecimalPropertiesPart06TestTest044
     * @tc.desc Verify @ '1'.repeat(500)+'@' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart06TestTest044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
      let d: Decimal = new Decimal('1'.repeat(500) + '@');
      expect(d.toString()).assertEqual('NaN');
      expect(d.d.length).assertEqual(0);
      expect(Number.isNaN(d.e)).assertTrue();
      expect(Number.isNaN(d.s)).assertTrue();
      expect(d.isNaN()).assertTrue();
      expect(d.d === d.d).assertTrue();
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART06_SUPPLEMENT_TEST_4500
     * @tc.name testDecimalPropertiesPart06TestTest045
     * @tc.desc Verify ; '1'.repeat(500)+';' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart06TestTest045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
      let d: Decimal = new Decimal('1'.repeat(500) + ';');
      expect(d.toString()).assertEqual('NaN');
      expect(d.d.length).assertEqual(0);
      expect(Number.isNaN(d.e)).assertTrue();
      expect(Number.isNaN(d.s)).assertTrue();
      expect(d.isNaN()).assertTrue();
      expect(d.d === d.d).assertTrue();
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART06_SUPPLEMENT_TEST_4600
     * @tc.name testDecimalPropertiesPart06TestTest046
     * @tc.desc Verify '<script>'+'1'.repeat(400) 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart06TestTest046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
      let d: Decimal = new Decimal('<script>' + '1'.repeat(400));
      expect(d.toString()).assertEqual('NaN');
      expect(d.d.length).assertEqual(0);
      expect(Number.isNaN(d.e)).assertTrue();
      expect(Number.isNaN(d.s)).assertTrue();
      expect(d.isNaN()).assertTrue();
      expect(d.d === d.d).assertTrue();
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART06_SUPPLEMENT_TEST_4700
     * @tc.name testDecimalPropertiesPart06TestTest047
     * @tc.desc Verify x '5'.repeat(512)+'e'+'x' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart06TestTest047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
      let d: Decimal = new Decimal('5'.repeat(512) + 'e' + 'x');
      expect(d.toString()).assertEqual('NaN');
      expect(d.d.length).assertEqual(0);
      expect(Number.isNaN(d.e)).assertTrue();
      expect(Number.isNaN(d.s)).assertTrue();
      expect(d.isNaN()).assertTrue();
      expect(d.d === d.d).assertTrue();
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART06_SUPPLEMENT_TEST_4800
     * @tc.name testDecimalPropertiesPart06TestTest048
     * @tc.desc Verify SVG onload '<svg/onload=alert(1)>' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart06TestTest048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
      let d: Decimal = new Decimal('<svg/onload=alert(1)>');
      expect(d.toString()).assertEqual('NaN');
      expect(d.d.length).assertEqual(0);
      expect(Number.isNaN(d.e)).assertTrue();
      expect(Number.isNaN(d.s)).assertTrue();
      expect(d.isNaN()).assertTrue();
      expect(d.d === d.d).assertTrue();
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART06_SUPPLEMENT_TEST_4900
     * @tc.name testDecimalPropertiesPart06TestTest049
     * @tc.desc Verify javascript 'javascript:alert(1)' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart06TestTest049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
      let d: Decimal = new Decimal('javascript:alert(1)');
      expect(d.toString()).assertEqual('NaN');
      expect(d.d.length).assertEqual(0);
      expect(Number.isNaN(d.e)).assertTrue();
      expect(Number.isNaN(d.s)).assertTrue();
      expect(d.isNaN()).assertTrue();
      expect(d.d === d.d).assertTrue();
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART06_SUPPLEMENT_TEST_5000
     * @tc.name testDecimalPropertiesPart06TestTest050
     * @tc.desc Verify '\u003cscript\u003e' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart06TestTest050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
      let d: Decimal = new Decimal('\u003cscript\u003e');
      expect(d.toString()).assertEqual('NaN');
      expect(d.d.length).assertEqual(0);
      expect(Number.isNaN(d.e)).assertTrue();
      expect(Number.isNaN(d.s)).assertTrue();
      expect(d.isNaN()).assertTrue();
      expect(d.d === d.d).assertTrue();
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART06_SUPPLEMENT_TEST_5100
     * @tc.name testDecimalPropertiesPart06TestTest051
     * @tc.desc Verify '1"><script>alert(1)</script>' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart06TestTest051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
      let d: Decimal = new Decimal('1"><script>alert(1)</script>');
      expect(d.toString()).assertEqual('NaN');
      expect(d.d.length).assertEqual(0);
      expect(Number.isNaN(d.e)).assertTrue();
      expect(Number.isNaN(d.s)).assertTrue();
      expect(d.isNaN()).assertTrue();
      expect(d.d === d.d).assertTrue();
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART06_SUPPLEMENT_TEST_5200
     * @tc.name testDecimalPropertiesPart06TestTest052
     * @tc.desc Verify SQL "' OR '1'='1" 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart06TestTest052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
      let d: Decimal = new Decimal("' OR '1'='1");
      expect(d.toString()).assertEqual('NaN');
      expect(d.d.length).assertEqual(0);
      expect(Number.isNaN(d.e)).assertTrue();
      expect(Number.isNaN(d.s)).assertTrue();
      expect(d.isNaN()).assertTrue();
      expect(d.d === d.d).assertTrue();
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART06_SUPPLEMENT_TEST_5300
     * @tc.name testDecimalPropertiesPart06TestTest053
     * @tc.desc Verify ';DROP TABLE users;' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart06TestTest053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
      let d: Decimal = new Decimal(';DROP TABLE users;');
      expect(d.toString()).assertEqual('NaN');
      expect(d.d.length).assertEqual(0);
      expect(Number.isNaN(d.e)).assertTrue();
      expect(Number.isNaN(d.s)).assertTrue();
      expect(d.isNaN()).assertTrue();
      expect(d.d === d.d).assertTrue();
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART06_SUPPLEMENT_TEST_5400
     * @tc.name testDecimalPropertiesPart06TestTest054
     * @tc.desc Verify iframe '<iframe src=x>' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart06TestTest054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
      let d: Decimal = new Decimal('<iframe src=x>');
      expect(d.toString()).assertEqual('NaN');
      expect(d.d.length).assertEqual(0);
      expect(Number.isNaN(d.e)).assertTrue();
      expect(Number.isNaN(d.s)).assertTrue();
      expect(d.isNaN()).assertTrue();
      expect(d.d === d.d).assertTrue();
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART06_SUPPLEMENT_TEST_5500
     * @tc.name testDecimalPropertiesPart06TestTest055
     * @tc.desc Verify '${1+1}' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart06TestTest055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
      let d: Decimal = new Decimal('${1+1}');
      expect(d.toString()).assertEqual('NaN');
      expect(d.d.length).assertEqual(0);
      expect(Number.isNaN(d.e)).assertTrue();
      expect(Number.isNaN(d.s)).assertTrue();
      expect(d.isNaN()).assertTrue();
      expect(d.d === d.d).assertTrue();
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART06_SUPPLEMENT_TEST_5600
     * @tc.name testDecimalPropertiesPart06TestTest056
     * @tc.desc Verify '`5`' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart06TestTest056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
      let d: Decimal = new Decimal('`5`');
      expect(d.toString()).assertEqual('NaN');
      expect(d.d.length).assertEqual(0);
      expect(Number.isNaN(d.e)).assertTrue();
      expect(Number.isNaN(d.s)).assertTrue();
      expect(d.isNaN()).assertTrue();
      expect(d.d === d.d).assertTrue();
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART06_SUPPLEMENT_TEST_5700
     * @tc.name testDecimalPropertiesPart06TestTest057
     * @tc.desc Verify '{{7*7}}' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart06TestTest057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
      let d: Decimal = new Decimal('{{7*7}}');
      expect(d.toString()).assertEqual('NaN');
      expect(d.d.length).assertEqual(0);
      expect(Number.isNaN(d.e)).assertTrue();
      expect(Number.isNaN(d.s)).assertTrue();
      expect(d.isNaN()).assertTrue();
      expect(d.d === d.d).assertTrue();
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART06_SUPPLEMENT_TEST_5800
     * @tc.name testDecimalPropertiesPart06TestTest058
     * @tc.desc Verify HTML '&lt;' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart06TestTest058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
      let d: Decimal = new Decimal('&lt;');
      expect(d.toString()).assertEqual('NaN');
      expect(d.d.length).assertEqual(0);
      expect(Number.isNaN(d.e)).assertTrue();
      expect(Number.isNaN(d.s)).assertTrue();
      expect(d.isNaN()).assertTrue();
      expect(d.d === d.d).assertTrue();
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART06_SUPPLEMENT_TEST_5900
     * @tc.name testDecimalPropertiesPart06TestTest059
     * @tc.desc Verify HTML '&amp;' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart06TestTest059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
      let d: Decimal = new Decimal('&amp;');
      expect(d.toString()).assertEqual('NaN');
      expect(d.d.length).assertEqual(0);
      expect(Number.isNaN(d.e)).assertTrue();
      expect(Number.isNaN(d.s)).assertTrue();
      expect(d.isNaN()).assertTrue();
      expect(d.d === d.d).assertTrue();
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART06_SUPPLEMENT_TEST_6000
     * @tc.name testDecimalPropertiesPart06TestTest060
     * @tc.desc Verify block-comment-like string rejected with 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart06TestTest060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
      let d: Decimal = new Decimal('/*5*/');
      expect(d.toString()).assertEqual('NaN');
      expect(d.d.length).assertEqual(0);
      expect(Number.isNaN(d.e)).assertTrue();
      expect(Number.isNaN(d.s)).assertTrue();
      expect(d.isNaN()).assertTrue();
      expect(d.d === d.d).assertTrue();
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART06_SUPPLEMENT_TEST_6100
     * @tc.name testDecimalPropertiesPart06TestTest061
     * @tc.desc Verify '//5' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart06TestTest061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
      let d: Decimal = new Decimal('//5');
      expect(d.toString()).assertEqual('NaN');
      expect(d.d.length).assertEqual(0);
      expect(Number.isNaN(d.e)).assertTrue();
      expect(Number.isNaN(d.s)).assertTrue();
      expect(d.isNaN()).assertTrue();
      expect(d.d === d.d).assertTrue();
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART06_SUPPLEMENT_TEST_6200
     * @tc.name testDecimalPropertiesPart06TestTest062
     * @tc.desc Verify '5#' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart06TestTest062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
      let d: Decimal = new Decimal('5#');
      expect(d.toString()).assertEqual('NaN');
      expect(d.d.length).assertEqual(0);
      expect(Number.isNaN(d.e)).assertTrue();
      expect(Number.isNaN(d.s)).assertTrue();
      expect(d.isNaN()).assertTrue();
      expect(d.d === d.d).assertTrue();
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART06_SUPPLEMENT_TEST_6300
     * @tc.name testDecimalPropertiesPart06TestTest063
     * @tc.desc Verify '>5' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart06TestTest063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
      let d: Decimal = new Decimal('>5');
      expect(d.toString()).assertEqual('NaN');
      expect(d.d.length).assertEqual(0);
      expect(Number.isNaN(d.e)).assertTrue();
      expect(Number.isNaN(d.s)).assertTrue();
      expect(d.isNaN()).assertTrue();
      expect(d.d === d.d).assertTrue();
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART06_SUPPLEMENT_TEST_6400
     * @tc.name testDecimalPropertiesPart06TestTest064
     * @tc.desc Verify '--5' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart06TestTest064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
      let d: Decimal = new Decimal('--5');
      expect(d.toString()).assertEqual('NaN');
      expect(d.d.length).assertEqual(0);
      expect(Number.isNaN(d.e)).assertTrue();
      expect(Number.isNaN(d.s)).assertTrue();
      expect(d.isNaN()).assertTrue();
      expect(d.d === d.d).assertTrue();
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART06_SUPPLEMENT_TEST_6500
     * @tc.name testDecimalPropertiesPart06TestTest065
     * @tc.desc Verify '+-5' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart06TestTest065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
      let d: Decimal = new Decimal('+-5');
      expect(d.toString()).assertEqual('NaN');
      expect(d.d.length).assertEqual(0);
      expect(Number.isNaN(d.e)).assertTrue();
      expect(Number.isNaN(d.s)).assertTrue();
      expect(d.isNaN()).assertTrue();
      expect(d.d === d.d).assertTrue();
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART06_SUPPLEMENT_TEST_6600
     * @tc.name testDecimalPropertiesPart06TestTest066
     * @tc.desc Verify '5--' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart06TestTest066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
      let d: Decimal = new Decimal('5--');
      expect(d.toString()).assertEqual('NaN');
      expect(d.d.length).assertEqual(0);
      expect(Number.isNaN(d.e)).assertTrue();
      expect(Number.isNaN(d.s)).assertTrue();
      expect(d.isNaN()).assertTrue();
      expect(d.d === d.d).assertTrue();
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART06_SUPPLEMENT_TEST_6700
     * @tc.name testDecimalPropertiesPart06TestTest067
     * @tc.desc Verify '1..2' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart06TestTest067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
      let d: Decimal = new Decimal('1..2');
      expect(d.toString()).assertEqual('NaN');
      expect(d.d.length).assertEqual(0);
      expect(Number.isNaN(d.e)).assertTrue();
      expect(Number.isNaN(d.s)).assertTrue();
      expect(d.isNaN()).assertTrue();
      expect(d.d === d.d).assertTrue();
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART06_SUPPLEMENT_TEST_6800
     * @tc.name testDecimalPropertiesPart06TestTest068
     * @tc.desc Verify '..5' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart06TestTest068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
      let d: Decimal = new Decimal('..5');
      expect(d.toString()).assertEqual('NaN');
      expect(d.d.length).assertEqual(0);
      expect(Number.isNaN(d.e)).assertTrue();
      expect(Number.isNaN(d.s)).assertTrue();
      expect(d.isNaN()).assertTrue();
      expect(d.d === d.d).assertTrue();
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART06_SUPPLEMENT_TEST_6900
     * @tc.name testDecimalPropertiesPart06TestTest069
     * @tc.desc Verify '1e' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart06TestTest069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
      let d: Decimal = new Decimal('1e');
      expect(d.toString()).assertEqual('NaN');
      expect(d.d.length).assertEqual(0);
      expect(Number.isNaN(d.e)).assertTrue();
      expect(Number.isNaN(d.s)).assertTrue();
      expect(d.isNaN()).assertTrue();
      expect(d.d === d.d).assertTrue();
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART06_SUPPLEMENT_TEST_7000
     * @tc.name testDecimalPropertiesPart06TestTest070
     * @tc.desc Verify '1E' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart06TestTest070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
      let d: Decimal = new Decimal('1E');
      expect(d.toString()).assertEqual('NaN');
      expect(d.d.length).assertEqual(0);
      expect(Number.isNaN(d.e)).assertTrue();
      expect(Number.isNaN(d.s)).assertTrue();
      expect(d.isNaN()).assertTrue();
      expect(d.d === d.d).assertTrue();
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART06_SUPPLEMENT_TEST_7100
     * @tc.name testDecimalPropertiesPart06TestTest071
     * @tc.desc Verify '1e-' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart06TestTest071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
      let d: Decimal = new Decimal('1e-');
      expect(d.toString()).assertEqual('NaN');
      expect(d.d.length).assertEqual(0);
      expect(Number.isNaN(d.e)).assertTrue();
      expect(Number.isNaN(d.s)).assertTrue();
      expect(d.isNaN()).assertTrue();
      expect(d.d === d.d).assertTrue();
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART06_SUPPLEMENT_TEST_7200
     * @tc.name testDecimalPropertiesPart06TestTest072
     * @tc.desc Verify '1e++5' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart06TestTest072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
      let d: Decimal = new Decimal('1e++5');
      expect(d.toString()).assertEqual('NaN');
      expect(d.d.length).assertEqual(0);
      expect(Number.isNaN(d.e)).assertTrue();
      expect(Number.isNaN(d.s)).assertTrue();
      expect(d.isNaN()).assertTrue();
      expect(d.d === d.d).assertTrue();
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART06_SUPPLEMENT_TEST_7300
     * @tc.name testDecimalPropertiesPart06TestTest073
     * @tc.desc Verify '1e5e6' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart06TestTest073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
      let d: Decimal = new Decimal('1e5e6');
      expect(d.toString()).assertEqual('NaN');
      expect(d.d.length).assertEqual(0);
      expect(Number.isNaN(d.e)).assertTrue();
      expect(Number.isNaN(d.s)).assertTrue();
      expect(d.isNaN()).assertTrue();
      expect(d.d === d.d).assertTrue();
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART06_SUPPLEMENT_TEST_7400
     * @tc.name testDecimalPropertiesPart06TestTest074
     * @tc.desc Verify '1e5.5' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart06TestTest074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
      let d: Decimal = new Decimal('1e5.5');
      expect(d.toString()).assertEqual('NaN');
      expect(d.d.length).assertEqual(0);
      expect(Number.isNaN(d.e)).assertTrue();
      expect(Number.isNaN(d.s)).assertTrue();
      expect(d.isNaN()).assertTrue();
      expect(d.d === d.d).assertTrue();
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART06_SUPPLEMENT_TEST_7500
     * @tc.name testDecimalPropertiesPart06TestTest075
     * @tc.desc Verify '1 5' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart06TestTest075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
      let d: Decimal = new Decimal('1 5');
      expect(d.toString()).assertEqual('NaN');
      expect(d.d.length).assertEqual(0);
      expect(Number.isNaN(d.e)).assertTrue();
      expect(Number.isNaN(d.s)).assertTrue();
      expect(d.isNaN()).assertTrue();
      expect(d.d === d.d).assertTrue();
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART06_SUPPLEMENT_TEST_7600
     * @tc.name testDecimalPropertiesPart06TestTest076
     * @tc.desc Verify '1,000' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart06TestTest076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
      let d: Decimal = new Decimal('1,000');
      expect(d.toString()).assertEqual('NaN');
      expect(d.d.length).assertEqual(0);
      expect(Number.isNaN(d.e)).assertTrue();
      expect(Number.isNaN(d.s)).assertTrue();
      expect(d.isNaN()).assertTrue();
      expect(d.d === d.d).assertTrue();
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART06_SUPPLEMENT_TEST_7700
     * @tc.name testDecimalPropertiesPart06TestTest077
     * @tc.desc Verify '1/5' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart06TestTest077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
      let d: Decimal = new Decimal('1/5');
      expect(d.toString()).assertEqual('NaN');
      expect(d.d.length).assertEqual(0);
      expect(Number.isNaN(d.e)).assertTrue();
      expect(Number.isNaN(d.s)).assertTrue();
      expect(d.isNaN()).assertTrue();
      expect(d.d === d.d).assertTrue();
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART06_SUPPLEMENT_TEST_7800
     * @tc.name testDecimalPropertiesPart06TestTest078
     * @tc.desc Verify '1-5' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart06TestTest078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
      let d: Decimal = new Decimal('1-5');
      expect(d.toString()).assertEqual('NaN');
      expect(d.d.length).assertEqual(0);
      expect(Number.isNaN(d.e)).assertTrue();
      expect(Number.isNaN(d.s)).assertTrue();
      expect(d.isNaN()).assertTrue();
      expect(d.d === d.d).assertTrue();
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART06_SUPPLEMENT_TEST_7900
     * @tc.name testDecimalPropertiesPart06TestTest079
     * @tc.desc Verify '5.5.5' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart06TestTest079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
      let d: Decimal = new Decimal('5.5.5');
      expect(d.toString()).assertEqual('NaN');
      expect(d.d.length).assertEqual(0);
      expect(Number.isNaN(d.e)).assertTrue();
      expect(Number.isNaN(d.s)).assertTrue();
      expect(d.isNaN()).assertTrue();
      expect(d.d === d.d).assertTrue();
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART06_SUPPLEMENT_TEST_8000
     * @tc.name testDecimalPropertiesPart06TestTest080
     * @tc.desc Verify '0x' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart06TestTest080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
      let d: Decimal = new Decimal('0x');
      expect(d.toString()).assertEqual('NaN');
      expect(d.d.length).assertEqual(0);
      expect(Number.isNaN(d.e)).assertTrue();
      expect(Number.isNaN(d.s)).assertTrue();
      expect(d.isNaN()).assertTrue();
      expect(d.d === d.d).assertTrue();
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART06_SUPPLEMENT_TEST_8100
     * @tc.name testDecimalPropertiesPart06TestTest081
     * @tc.desc Verify '0b' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart06TestTest081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
      let d: Decimal = new Decimal('0b');
      expect(d.toString()).assertEqual('NaN');
      expect(d.d.length).assertEqual(0);
      expect(Number.isNaN(d.e)).assertTrue();
      expect(Number.isNaN(d.s)).assertTrue();
      expect(d.isNaN()).assertTrue();
      expect(d.d === d.d).assertTrue();
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART06_SUPPLEMENT_TEST_8200
     * @tc.name testDecimalPropertiesPart06TestTest082
     * @tc.desc Verify '0o' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart06TestTest082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
      let d: Decimal = new Decimal('0o');
      expect(d.toString()).assertEqual('NaN');
      expect(d.d.length).assertEqual(0);
      expect(Number.isNaN(d.e)).assertTrue();
      expect(Number.isNaN(d.s)).assertTrue();
      expect(d.isNaN()).assertTrue();
      expect(d.d === d.d).assertTrue();
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART06_SUPPLEMENT_TEST_8300
     * @tc.name testDecimalPropertiesPart06TestTest083
     * @tc.desc Verify hex '0x1p2' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart06TestTest083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let d: Decimal = new Decimal('0x1p2');
        expect(d.toString()).assertLarger(0);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART06_SUPPLEMENT_TEST_8400
     * @tc.name testDecimalPropertiesPart06TestTest084
     * @tc.desc Verify '1a' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart06TestTest084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
      let d: Decimal = new Decimal('1a');
      expect(d.toString()).assertEqual('NaN');
      expect(d.d.length).assertEqual(0);
      expect(Number.isNaN(d.e)).assertTrue();
      expect(Number.isNaN(d.s)).assertTrue();
      expect(d.isNaN()).assertTrue();
      expect(d.d === d.d).assertTrue();
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART06_SUPPLEMENT_TEST_8500
     * @tc.name testDecimalPropertiesPart06TestTest085
     * @tc.desc Verify '5L' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart06TestTest085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
      let d: Decimal = new Decimal('5L');
      expect(d.toString()).assertEqual('NaN');
      expect(d.d.length).assertEqual(0);
      expect(Number.isNaN(d.e)).assertTrue();
      expect(Number.isNaN(d.s)).assertTrue();
      expect(d.isNaN()).assertTrue();
      expect(d.d === d.d).assertTrue();
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART06_SUPPLEMENT_TEST_8600
     * @tc.name testDecimalPropertiesPart06TestTest086
     * @tc.desc Verify bigint '5n' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart06TestTest086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
      let d: Decimal = new Decimal('5n');
      expect(d.toString()).assertEqual('NaN');
      expect(d.d.length).assertEqual(0);
      expect(Number.isNaN(d.e)).assertTrue();
      expect(Number.isNaN(d.s)).assertTrue();
      expect(d.isNaN()).assertTrue();
      expect(d.d === d.d).assertTrue();
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART06_SUPPLEMENT_TEST_8700
     * @tc.name testDecimalPropertiesPart06TestTest087
     * @tc.desc Verify d '1d5' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart06TestTest087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
      let d: Decimal = new Decimal('1d5');
      expect(d.toString()).assertEqual('NaN');
      expect(d.d.length).assertEqual(0);
      expect(Number.isNaN(d.e)).assertTrue();
      expect(Number.isNaN(d.s)).assertTrue();
      expect(d.isNaN()).assertTrue();
      expect(d.d === d.d).assertTrue();
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART06_SUPPLEMENT_TEST_8800
     * @tc.name testDecimalPropertiesPart06TestTest088
     * @tc.desc Verify ' ' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart06TestTest088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
      let d: Decimal = new Decimal('１２３');
      expect(d.toString()).assertEqual('NaN');
      expect(d.d.length).assertEqual(0);
      expect(Number.isNaN(d.e)).assertTrue();
      expect(Number.isNaN(d.s)).assertTrue();
      expect(d.isNaN()).assertTrue();
      expect(d.d === d.d).assertTrue();
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART06_SUPPLEMENT_TEST_8900
     * @tc.name testDecimalPropertiesPart06TestTest089
     * @tc.desc Verify ' ' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart06TestTest089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
      let d: Decimal = new Decimal('⁵');
      expect(d.toString()).assertEqual('NaN');
      expect(d.d.length).assertEqual(0);
      expect(Number.isNaN(d.e)).assertTrue();
      expect(Number.isNaN(d.s)).assertTrue();
      expect(d.isNaN()).assertTrue();
      expect(d.d === d.d).assertTrue();
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART06_SUPPLEMENT_TEST_9000
     * @tc.name testDecimalPropertiesPart06TestTest090
     * @tc.desc Verify ' ' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart06TestTest090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
      let d: Decimal = new Decimal('₅');
      expect(d.toString()).assertEqual('NaN');
      expect(d.d.length).assertEqual(0);
      expect(Number.isNaN(d.e)).assertTrue();
      expect(Number.isNaN(d.s)).assertTrue();
      expect(d.isNaN()).assertTrue();
      expect(d.d === d.d).assertTrue();
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART06_SUPPLEMENT_TEST_9100
     * @tc.name testDecimalPropertiesPart06TestTest091
     * @tc.desc Verify ' ' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart06TestTest091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
      let d: Decimal = new Decimal('①②');
      expect(d.toString()).assertEqual('NaN');
      expect(d.d.length).assertEqual(0);
      expect(Number.isNaN(d.e)).assertTrue();
      expect(Number.isNaN(d.s)).assertTrue();
      expect(d.isNaN()).assertTrue();
      expect(d.d === d.d).assertTrue();
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART06_SUPPLEMENT_TEST_9200
     * @tc.name testDecimalPropertiesPart06TestTest092
     * @tc.desc Verify ' ' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart06TestTest092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
      let d: Decimal = new Decimal('Ⅻ');
      expect(d.toString()).assertEqual('NaN');
      expect(d.d.length).assertEqual(0);
      expect(Number.isNaN(d.e)).assertTrue();
      expect(Number.isNaN(d.s)).assertTrue();
      expect(d.isNaN()).assertTrue();
      expect(d.d === d.d).assertTrue();
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART06_SUPPLEMENT_TEST_9300
     * @tc.name testDecimalPropertiesPart06TestTest093
     * @tc.desc Verify ' ' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart06TestTest093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
      let d: Decimal = new Decimal('½');
      expect(d.toString()).assertEqual('NaN');
      expect(d.d.length).assertEqual(0);
      expect(Number.isNaN(d.e)).assertTrue();
      expect(Number.isNaN(d.s)).assertTrue();
      expect(d.isNaN()).assertTrue();
      expect(d.d === d.d).assertTrue();
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART06_SUPPLEMENT_TEST_9400
     * @tc.name testDecimalPropertiesPart06TestTest094
     * @tc.desc Verify - ' ' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart06TestTest094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
      let d: Decimal = new Decimal('١٢٣');
      expect(d.toString()).assertEqual('NaN');
      expect(d.d.length).assertEqual(0);
      expect(Number.isNaN(d.e)).assertTrue();
      expect(Number.isNaN(d.s)).assertTrue();
      expect(d.isNaN()).assertTrue();
      expect(d.d === d.d).assertTrue();
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART06_SUPPLEMENT_TEST_9500
     * @tc.name testDecimalPropertiesPart06TestTest095
     * @tc.desc Verify ' ' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart06TestTest095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
      let d: Decimal = new Decimal('१२३');
      expect(d.toString()).assertEqual('NaN');
      expect(d.d.length).assertEqual(0);
      expect(Number.isNaN(d.e)).assertTrue();
      expect(Number.isNaN(d.s)).assertTrue();
      expect(d.isNaN()).assertTrue();
      expect(d.d === d.d).assertTrue();
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART06_SUPPLEMENT_TEST_9600
     * @tc.name testDecimalPropertiesPart06TestTest096
     * @tc.desc Verify U+2212 ' 5' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart06TestTest096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
      let d: Decimal = new Decimal('−5');
      expect(d.toString()).assertEqual('NaN');
      expect(d.d.length).assertEqual(0);
      expect(Number.isNaN(d.e)).assertTrue();
      expect(Number.isNaN(d.s)).assertTrue();
      expect(d.isNaN()).assertTrue();
      expect(d.d === d.d).assertTrue();
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART06_SUPPLEMENT_TEST_9700
     * @tc.name testDecimalPropertiesPart06TestTest097
     * @tc.desc Verify U+2012 ' 5' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart06TestTest097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
      let d: Decimal = new Decimal('‒5');
      expect(d.toString()).assertEqual('NaN');
      expect(d.d.length).assertEqual(0);
      expect(Number.isNaN(d.e)).assertTrue();
      expect(Number.isNaN(d.s)).assertTrue();
      expect(d.isNaN()).assertTrue();
      expect(d.d === d.d).assertTrue();
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART06_SUPPLEMENT_TEST_9800
     * @tc.name testDecimalPropertiesPart06TestTest098
     * @tc.desc Verify ' 5' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart06TestTest098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
      let d: Decimal = new Decimal('¯5');
      expect(d.toString()).assertEqual('NaN');
      expect(d.d.length).assertEqual(0);
      expect(Number.isNaN(d.e)).assertTrue();
      expect(Number.isNaN(d.s)).assertTrue();
      expect(d.isNaN()).assertTrue();
      expect(d.d === d.d).assertTrue();
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART06_SUPPLEMENT_TEST_9900
     * @tc.name testDecimalPropertiesPart06TestTest099
     * @tc.desc Verify '%5' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart06TestTest099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
      let d: Decimal = new Decimal('%5');
      expect(d.toString()).assertEqual('NaN');
      expect(d.d.length).assertEqual(0);
      expect(Number.isNaN(d.e)).assertTrue();
      expect(Number.isNaN(d.s)).assertTrue();
      expect(d.isNaN()).assertTrue();
      expect(d.d === d.d).assertTrue();
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
  });

}
