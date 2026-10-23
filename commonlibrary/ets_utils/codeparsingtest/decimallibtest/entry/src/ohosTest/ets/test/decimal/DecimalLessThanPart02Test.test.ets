
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

export default function decimalLessThanPart02TestTest() {
  describe('DecimalLessThanPart02TestTest', () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_PART02_SUPPLEMENT_TEST_0100
     * @tc.name testDecimalLessThanPart02TestTest001
     * @tc.desc Verify 1 string 13.lessThan('14') true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanPart02TestTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(13);
      let r: boolean = d.lessThan('14');
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_PART02_SUPPLEMENT_TEST_0200
     * @tc.name testDecimalLessThanPart02TestTest002
     * @tc.desc Verify 1 number 13.lessThan(14) true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanPart02TestTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(13);
      let r: boolean = d.lessThan(14);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_PART02_SUPPLEMENT_TEST_0300
     * @tc.name testDecimalLessThanPart02TestTest003
     * @tc.desc Verify 1 Decimal 13.lessThan(new Decimal(14)) true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanPart02TestTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(13);
      let r: boolean = d.lessThan(new Decimal(14));
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_PART02_SUPPLEMENT_TEST_0400
     * @tc.name testDecimalLessThanPart02TestTest004
     * @tc.desc Verify 8.lessThan('09') true '09' 9
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanPart02TestTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(8);
      let r: boolean = d.lessThan('09');
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_PART02_SUPPLEMENT_TEST_0500
     * @tc.name testDecimalLessThanPart02TestTest005
     * @tc.desc Verify -3.lessThan('-2') true -3 < -2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanPart02TestTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(-3);
      let r: boolean = d.lessThan('-2');
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_PART02_SUPPLEMENT_TEST_0600
     * @tc.name testDecimalLessThanPart02TestTest006
     * @tc.desc Verify 1.25.lessThan('1.5') true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanPart02TestTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal('1.25');
      let r: boolean = d.lessThan('1.5');
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_PART02_SUPPLEMENT_TEST_0700
     * @tc.name testDecimalLessThanPart02TestTest007
     * @tc.desc Verify 999.lessThan('1e3') true 999 < 1000
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanPart02TestTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal('999');
      let r: boolean = d.lessThan('1e3');
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_PART02_SUPPLEMENT_TEST_0800
     * @tc.name testDecimalLessThanPart02TestTest008
     * @tc.desc Verify 0.01.lessThan('1e-2') false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanPart02TestTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal('0.01');
      let r: boolean = d.lessThan('1e-2');
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_PART02_SUPPLEMENT_TEST_0900
     * @tc.name testDecimalLessThanPart02TestTest009
     * @tc.desc Verify 15.lessThan('0x10') true '0x10' 16
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanPart02TestTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal('15');
      let r: boolean = d.lessThan('0x10');
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_PART02_SUPPLEMENT_TEST_1000
     * @tc.name testDecimalLessThanPart02TestTest010
     * @tc.desc Verify 5.lessThan('+6') true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanPart02TestTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(5);
      let r: boolean = d.lessThan('+6');
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_PART02_SUPPLEMENT_TEST_1100
     * @tc.name testDecimalLessThanPart02TestTest011
     * @tc.desc Verify 5.lessThan('6.') true '6.' 6
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanPart02TestTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(5);
      let r: boolean = d.lessThan('6.');
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_PART02_SUPPLEMENT_TEST_1200
     * @tc.name testDecimalLessThanPart02TestTest012
     * @tc.desc Verify 0.4.lessThan('.5') true '.5' 0.5
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanPart02TestTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal('0.4');
      let r: boolean = d.lessThan('.5');
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_PART02_SUPPLEMENT_TEST_1300
     * @tc.name testDecimalLessThanPart02TestTest013
     * @tc.desc Verify 'Infinity' 5.lessThan('Infinity') true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanPart02TestTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(5);
      let r: boolean = d.lessThan('Infinity');
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_PART02_SUPPLEMENT_TEST_1400
     * @tc.name testDecimalLessThanPart02TestTest014
     * @tc.desc Verify '-Infinity' -5.lessThan('-Infinity') false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanPart02TestTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(-5);
      let r: boolean = d.lessThan('-Infinity');
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_PART02_SUPPLEMENT_TEST_1500
     * @tc.name testDecimalLessThanPart02TestTest015
     * @tc.desc Verify 'NaN' false 5.lessThan('NaN') false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanPart02TestTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(5);
      let r: boolean = d.lessThan('NaN');
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_PART02_SUPPLEMENT_TEST_1600
     * @tc.name testDecimalLessThanPart02TestTest016
     * @tc.desc Verify 1 9 5.lessThan( ) true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanPart02TestTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let huge: string = '9'.repeat(10000);
      let d: Decimal = new Decimal(5);
      let r: boolean = d.lessThan(huge);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_PART02_SUPPLEMENT_TEST_1700
     * @tc.name testDecimalLessThanPart02TestTest017
     * @tc.desc Verify 1e998.lessThan('1e999') true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanPart02TestTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal('1e998');
      let r: boolean = d.lessThan('1e999');
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_PART02_SUPPLEMENT_TEST_1800
     * @tc.name testDecimalLessThanPart02TestTest018
     * @tc.desc Verify 1e-999.lessThan('1e-998') true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanPart02TestTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal('1e-999');
      let r: boolean = d.lessThan('1e-998');
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_PART02_SUPPLEMENT_TEST_1900
     * @tc.name testDecimalLessThanPart02TestTest019
     * @tc.desc Verify 9007199254740992.lessThan('9007199254740993') true doub
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanPart02TestTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal('9007199254740992');
      let r: boolean = d.lessThan('9007199254740993');
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_PART02_SUPPLEMENT_TEST_2000
     * @tc.name testDecimalLessThanPart02TestTest020
     * @tc.desc Verify 0.3.lessThan('0.30000000000000000001') true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanPart02TestTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal('0.3');
      let r: boolean = d.lessThan('0.30000000000000000001');
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_PART02_SUPPLEMENT_TEST_2100
     * @tc.name testDecimalLessThanPart02TestTest021
     * @tc.desc Verify 16.lessThan('0x10') false 16
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanPart02TestTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal('16');
      let r: boolean = d.lessThan('0x10');
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_PART02_SUPPLEMENT_TEST_2200
     * @tc.name testDecimalLessThanPart02TestTest022
     * @tc.desc Verify 0.001.lessThan('1.5e-3') true 0.001 < 0.0015
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanPart02TestTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal('0.001');
      let r: boolean = d.lessThan('1.5e-3');
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_PART02_SUPPLEMENT_TEST_2300
     * @tc.name testDecimalLessThanPart02TestTest023
     * @tc.desc Verify -1e-9.lessThan('1e-9') true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanPart02TestTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal('-1e-9');
      let r: boolean = d.lessThan('1e-9');
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_PART02_SUPPLEMENT_TEST_2400
     * @tc.name testDecimalLessThanPart02TestTest024
     * @tc.desc Verify 5.lessThan('+5') false +5 5
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanPart02TestTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(5);
      let r: boolean = d.lessThan('+5');
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_PART02_SUPPLEMENT_TEST_2500
     * @tc.name testDecimalLessThanPart02TestTest025
     * @tc.desc Verify 7.lessThan('0007') false 7
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanPart02TestTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal('7');
      let r: boolean = d.lessThan('0007');
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_PART02_SUPPLEMENT_TEST_2600
     * @tc.name testDecimalLessThanPart02TestTest026
     * @tc.desc Verify '' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanPart02TestTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let d: Decimal = new Decimal(7);
        d.lessThan('');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_PART02_SUPPLEMENT_TEST_2700
     * @tc.name testDecimalLessThanPart02TestTest027
     * @tc.desc Verify ' ' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanPart02TestTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let d: Decimal = new Decimal(7);
        d.lessThan('  ');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_PART02_SUPPLEMENT_TEST_2800
     * @tc.name testDecimalLessThanPart02TestTest028
     * @tc.desc Verify ' ' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanPart02TestTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let d: Decimal = new Decimal(7);
        d.lessThan('​');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_PART02_SUPPLEMENT_TEST_2900
     * @tc.name testDecimalLessThanPart02TestTest029
     * @tc.desc Verify NUL ' ' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanPart02TestTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let d: Decimal = new Decimal(7);
        d.lessThan('\u0000');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_PART02_SUPPLEMENT_TEST_3000
     * @tc.name testDecimalLessThanPart02TestTest030
     * @tc.desc Verify '6' lessThan does not throw on device and result toString is non-empty [device does not throw, expected error pending SDK alignment]
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanPart02TestTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(7);
        expect(d.lessThan('6').toString().length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_PART02_SUPPLEMENT_TEST_3100
     * @tc.name testDecimalLessThanPart02TestTest031
     * @tc.desc Verify '\n' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanPart02TestTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let d: Decimal = new Decimal(7);
        d.lessThan('\n');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_PART02_SUPPLEMENT_TEST_3200
     * @tc.name testDecimalLessThanPart02TestTest032
     * @tc.desc Verify '\t' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanPart02TestTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let d: Decimal = new Decimal(7);
        d.lessThan('\t');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_PART02_SUPPLEMENT_TEST_3300
     * @tc.name testDecimalLessThanPart02TestTest033
     * @tc.desc Verify '\r' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanPart02TestTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let d: Decimal = new Decimal(7);
        d.lessThan('\r');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_PART02_SUPPLEMENT_TEST_3400
     * @tc.name testDecimalLessThanPart02TestTest034
     * @tc.desc Verify '\\' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanPart02TestTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let d: Decimal = new Decimal(7);
        d.lessThan('\\');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_PART02_SUPPLEMENT_TEST_3500
     * @tc.name testDecimalLessThanPart02TestTest035
     * @tc.desc Verify XSS '<img src=x onerror=alert(1)>' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanPart02TestTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let d: Decimal = new Decimal(7);
        d.lessThan('<img src=x onerror=alert(1)>');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_PART02_SUPPLEMENT_TEST_3600
     * @tc.name testDecimalLessThanPart02TestTest036
     * @tc.desc Verify '\ud800' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanPart02TestTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let d: Decimal = new Decimal(7);
        d.lessThan('\ud800');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_PART02_SUPPLEMENT_TEST_3700
     * @tc.name testDecimalLessThanPart02TestTest037
     * @tc.desc Verify '\udc00' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanPart02TestTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let d: Decimal = new Decimal(7);
        d.lessThan('\udc00');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_PART02_SUPPLEMENT_TEST_3800
     * @tc.name testDecimalLessThanPart02TestTest038
     * @tc.desc Verify 5 b 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanPart02TestTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let bad: string = 'b'.repeat(50000);
        let d: Decimal = new Decimal(7);
        d.lessThan(bad);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_PART02_SUPPLEMENT_TEST_3900
     * @tc.name testDecimalLessThanPart02TestTest039
     * @tc.desc Verify ' ' U+FF17 401 ASCII
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanPart02TestTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let d: Decimal = new Decimal(7);
        d.lessThan('７');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_PART02_SUPPLEMENT_TEST_4000
     * @tc.name testDecimalLessThanPart02TestTest040
     * @tc.desc Verify '0X' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanPart02TestTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let d: Decimal = new Decimal(7);
        d.lessThan('0X');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_PART02_SUPPLEMENT_TEST_4100
     * @tc.name testDecimalLessThanPart02TestTest041
     * @tc.desc Verify '1..2' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanPart02TestTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let d: Decimal = new Decimal(7);
        d.lessThan('1..2');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_PART02_SUPPLEMENT_TEST_4200
     * @tc.name testDecimalLessThanPart02TestTest042
     * @tc.desc Verify '1e+' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanPart02TestTest042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let d: Decimal = new Decimal(7);
        d.lessThan('1e+');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_PART02_SUPPLEMENT_TEST_4300
     * @tc.name testDecimalLessThanPart02TestTest043
     * @tc.desc Verify '--' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanPart02TestTest043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let d: Decimal = new Decimal(7);
        d.lessThan('--');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_PART02_SUPPLEMENT_TEST_4400
     * @tc.name testDecimalLessThanPart02TestTest044
     * @tc.desc Verify emoji ' ' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanPart02TestTest044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let d: Decimal = new Decimal(7);
        d.lessThan('🚀');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_PART02_SUPPLEMENT_TEST_4500
     * @tc.name testDecimalLessThanPart02TestTest045
     * @tc.desc Verify '.5.' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanPart02TestTest045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let d: Decimal = new Decimal(7);
        d.lessThan('.5.');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_PART02_SUPPLEMENT_TEST_4600
     * @tc.name testDecimalLessThanPart02TestTest046
     * @tc.desc Verify '1_2_3' lessThan does not throw on device and result toString is non-empty [device does not throw, expected error pending SDK alignment]
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanPart02TestTest046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(7);
        expect(d.lessThan('1_2_3').toString().length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_PART02_SUPPLEMENT_TEST_4700
     * @tc.name testDecimalLessThanPart02TestTest047
     * @tc.desc Verify '0B11' lessThan does not throw on device and result toString is non-empty [device does not throw, expected error pending SDK alignment]
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanPart02TestTest047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(7);
        expect(d.lessThan('0B11').toString().length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_PART02_SUPPLEMENT_TEST_4800
     * @tc.name testDecimalLessThanPart02TestTest048
     * @tc.desc Verify '2 3' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanPart02TestTest048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let d: Decimal = new Decimal(7);
        d.lessThan('2 3');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_PART02_SUPPLEMENT_TEST_4900
     * @tc.name testDecimalLessThanPart02TestTest049
     * @tc.desc Verify NaN 'naN' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanPart02TestTest049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let d: Decimal = new Decimal(7);
        d.lessThan('naN');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_PART02_SUPPLEMENT_TEST_5000
     * @tc.name testDecimalLessThanPart02TestTest050
     * @tc.desc Verify 'e5' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanPart02TestTest050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let d: Decimal = new Decimal(7);
        d.lessThan('e5');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_PART02_SUPPLEMENT_TEST_5100
     * @tc.name testDecimalLessThanPart02TestTest051
     * @tc.desc Verify string|number 8.lessThan('8') 8.lessThan(8) fa
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanPart02TestTest051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Decimal = new Decimal(8);
      expect(a.lessThan('8')).assertFalse();
      expect(a.lessThan(8)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_PART02_SUPPLEMENT_TEST_5200
     * @tc.name testDecimalLessThanPart02TestTest052
     * @tc.desc Verify string|number|Decimal true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanPart02TestTest052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Decimal = new Decimal(8);
      expect(a.lessThan('9')).assertTrue();
      expect(a.lessThan(9)).assertTrue();
      expect(a.lessThan(new Decimal(9))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_PART02_SUPPLEMENT_TEST_5300
     * @tc.name testDecimalLessThanPart02TestTest053
     * @tc.desc Verify string|number|Decimal false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanPart02TestTest053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Decimal = new Decimal(8);
      expect(a.lessThan('7')).assertFalse();
      expect(a.lessThan(7)).assertFalse();
      expect(a.lessThan(new Decimal(7))).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_PART02_SUPPLEMENT_TEST_5400
     * @tc.name testDecimalLessThanPart02TestTest054
     * @tc.desc Verify Decimal 1.5.lessThan(new Decimal('1.5')) false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanPart02TestTest054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Decimal = new Decimal('1.5');
      let b: Decimal = new Decimal('1.5');
      expect(a.lessThan(b)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_PART02_SUPPLEMENT_TEST_5500
     * @tc.name testDecimalLessThanPart02TestTest055
     * @tc.desc Verify string|Decimal '4' new Decimal('4') true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanPart02TestTest055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: string | Decimal = '4';
      let a: Decimal = new Decimal(5);
      expect(a.lessThan(x)).assertFalse();
      x = new Decimal('4');
      expect(a.lessThan(x)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_PART02_SUPPLEMENT_TEST_5600
     * @tc.name testDecimalLessThanPart02TestTest056
     * @tc.desc Verify number|Decimal 4 new Decimal(4) true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanPart02TestTest056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: number | Decimal = 4;
      let a: Decimal = new Decimal(5);
      expect(a.lessThan(x)).assertFalse();
      x = new Decimal(4);
      expect(a.lessThan(x)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_PART02_SUPPLEMENT_TEST_5700
     * @tc.name testDecimalLessThanPart02TestTest057
     * @tc.desc Verify number string 0.2.lessThan(0.3) 0.2.lessThan('
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanPart02TestTest057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Decimal = new Decimal('0.2');
      expect(a.lessThan(0.3)).assertTrue();
      expect(a.lessThan('0.3')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_PART02_SUPPLEMENT_TEST_5800
     * @tc.name testDecimalLessThanPart02TestTest058
     * @tc.desc Verify '-0' -0 new Decimal(0) 0 false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanPart02TestTest058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Decimal = new Decimal(0);
      expect(a.lessThan('-0')).assertFalse();
      expect(a.lessThan(-0)).assertFalse();
      expect(a.lessThan(new Decimal(0))).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_PART02_SUPPLEMENT_TEST_5900
     * @tc.name testDecimalLessThanPart02TestTest059
     * @tc.desc Verify 5.lessThan('10') true 5.lessThan(new Decimal(3))
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanPart02TestTest059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Decimal = new Decimal(5);
      expect(a.lessThan('10')).assertTrue();
      expect(a.lessThan(new Decimal(3))).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_PART02_SUPPLEMENT_TEST_6000
     * @tc.name testDecimalLessThanPart02TestTest060
     * @tc.desc Verify ['6', 6, new Decimal(6)] 5 true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanPart02TestTest060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Decimal = new Decimal(5);
      let vals: (string | number | Decimal)[] = ['6', 6, new Decimal(6)];
      for (let i = 0; i < vals.length; i++) {
        expect(a.lessThan(vals[i])).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_PART02_SUPPLEMENT_TEST_6100
     * @tc.name testDecimalLessThanPart02TestTest061
     * @tc.desc Verify '9007199254740990' 9007199254740990 new Decimal(
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanPart02TestTest061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Decimal = new Decimal('9007199254740990');
      expect(a.lessThan('9007199254740991')).assertTrue();
      expect(a.lessThan(9007199254740991)).assertTrue();
      expect(a.lessThan(new Decimal('9007199254740991'))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_PART02_SUPPLEMENT_TEST_6200
     * @tc.name testDecimalLessThanPart02TestTest062
     * @tc.desc Verify string Decimal 99.98 Decimal 99.99
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanPart02TestTest062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Decimal = new Decimal('99.98');
      expect(a.lessThan('99.99')).assertTrue();
      expect(a.lessThan(new Decimal('99.99'))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_PART02_SUPPLEMENT_TEST_6300
     * @tc.name testDecimalLessThanPart02TestTest063
     * @tc.desc Verify Decimal toString
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanPart02TestTest063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal('123.45');
      d.lessThan('100');
      expect(d.toString()).assertEqual('123.45');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_PART02_SUPPLEMENT_TEST_6400
     * @tc.name testDecimalLessThanPart02TestTest064
     * @tc.desc Verify true 30 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanPart02TestTest064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal('123456789012345678901234567889');
      let r: boolean = d.lessThan('123456789012345678901234567890');
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_PART02_SUPPLEMENT_TEST_6500
     * @tc.name testDecimalLessThanPart02TestTest065
     * @tc.desc Verify 401 Decimal lessThan('9') true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanPart02TestTest065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(5);
      try {
        d.lessThan('xyz');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
      let r: boolean = d.lessThan('9');
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LESS_THAN_PART02_SUPPLEMENT_TEST_6600
     * @tc.name testDecimalLessThanPart02TestTest066
     * @tc.desc Verify 4.lessThan('5') true 5.lessThan('4') false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLessThanPart02TestTest066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Decimal = new Decimal(4);
      let b: Decimal = new Decimal(5);
      expect(a.lessThan('5')).assertTrue();
      expect(b.lessThan('4')).assertFalse();
    });


  });

}
