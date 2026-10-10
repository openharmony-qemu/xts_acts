
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

export default function decimalMulPart02TestTest() {
  describe('DecimalMulPart02TestTest', () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MUL_PART02_SUPPLEMENT_TEST_0100
     * @tc.name testDecimalMulPart02TestTest001
     * @tc.desc Verify arity=1 string
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalMulPart02TestTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = new Decimal('10').mul('4');
      expect(r.toString()).assertEqual('40');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MUL_PART02_SUPPLEMENT_TEST_0200
     * @tc.name testDecimalMulPart02TestTest002
     * @tc.desc Verify string 6 * '7' = 42
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalMulPart02TestTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Decimal(6).mul('7').toString()).assertEqual('42');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MUL_PART02_SUPPLEMENT_TEST_0300
     * @tc.name testDecimalMulPart02TestTest003
     * @tc.desc Verify number string 0.5 * '0.5' = 0.25
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalMulPart02TestTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Decimal(0.5).mul('0.5').toString()).assertEqual('0.25');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MUL_PART02_SUPPLEMENT_TEST_0400
     * @tc.name testDecimalMulPart02TestTest004
     * @tc.desc Verify string '1.5' * '2' = 3
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalMulPart02TestTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Decimal('1.5').mul('2').toString()).assertEqual('3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MUL_PART02_SUPPLEMENT_TEST_0500
     * @tc.name testDecimalMulPart02TestTest005
     * @tc.desc Verify string 5 * '-6' = -30
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalMulPart02TestTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Decimal(5).mul('-6').toString()).assertEqual('-30');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MUL_PART02_SUPPLEMENT_TEST_0600
     * @tc.name testDecimalMulPart02TestTest006
     * @tc.desc Verify string 7 * '+8' = 56
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalMulPart02TestTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Decimal(7).mul('+8').toString()).assertEqual('56');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MUL_PART02_SUPPLEMENT_TEST_0700
     * @tc.name testDecimalMulPart02TestTest007
     * @tc.desc Verify string 3 * '007.5' 22.5
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalMulPart02TestTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Decimal(3).mul('007.5').toString()).assertEqual('22.5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MUL_PART02_SUPPLEMENT_TEST_0800
     * @tc.name testDecimalMulPart02TestTest008
     * @tc.desc Verify string E 3 * '2E3' = 6000
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalMulPart02TestTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Decimal(3).mul('2E3').toString()).assertEqual('6000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MUL_PART02_SUPPLEMENT_TEST_0900
     * @tc.name testDecimalMulPart02TestTest009
     * @tc.desc Verify string 100 * '5e-3' = 0.5
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalMulPart02TestTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Decimal(100).mul('5e-3').toString()).assertEqual('0.5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MUL_PART02_SUPPLEMENT_TEST_1000
     * @tc.name testDecimalMulPart02TestTest010
     * @tc.desc Verify string 1 * '1e-7' toString
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalMulPart02TestTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Decimal(1).mul('1e-7').toString()).assertEqual('1e-7');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MUL_PART02_SUPPLEMENT_TEST_1100
     * @tc.name testDecimalMulPart02TestTest011
     * @tc.desc Verify number string 1e7 * '1e-7' = 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalMulPart02TestTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Decimal(1e7).mul('1e-7').toString()).assertEqual('1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MUL_PART02_SUPPLEMENT_TEST_1200
     * @tc.name testDecimalMulPart02TestTest012
     * @tc.desc Verify string 1 * '123.456e2' = 12345.6
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalMulPart02TestTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Decimal(1).mul('123.456e2').toString()).assertEqual('12345.6');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MUL_PART02_SUPPLEMENT_TEST_1300
     * @tc.name testDecimalMulPart02TestTest013
     * @tc.desc Verify MAX_SAFE_INTEGER string '1'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalMulPart02TestTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Decimal(Number.MAX_SAFE_INTEGER).mul('1').toString()).assertEqual('9007199254740991');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MUL_PART02_SUPPLEMENT_TEST_1400
     * @tc.name testDecimalMulPart02TestTest014
     * @tc.desc Verify string 2 '9007199254740993' * '2'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalMulPart02TestTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Decimal('9007199254740993').mul('2').toString()).assertEqual('18014398509481986');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MUL_PART02_SUPPLEMENT_TEST_1500
     * @tc.name testDecimalMulPart02TestTest015
     * @tc.desc Verify 20 string 2 '12345678901234567890' * '2'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalMulPart02TestTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Decimal('12345678901234567890').mul('2').toString()).assertEqual('24691357802469135780');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MUL_PART02_SUPPLEMENT_TEST_1600
     * @tc.name testDecimalMulPart02TestTest016
     * @tc.desc Verify 30 string 3 precision 40
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalMulPart02TestTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ precision: 40 });
      try {
        let r: Decimal = new Decimal('123456789012345678901234567890').mul('3');
        expect(r.toString()).assertEqual('3.7037036703703703670370370367e+29');
      } finally {
        Decimal.set({ precision: 20, rounding: 4 });
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MUL_PART02_SUPPLEMENT_TEST_1700
     * @tc.name testDecimalMulPart02TestTest017
     * @tc.desc Verify string '0'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalMulPart02TestTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Decimal('9').mul('0').toString()).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MUL_PART02_SUPPLEMENT_TEST_1800
     * @tc.name testDecimalMulPart02TestTest018
     * @tc.desc Verify string '-1' 8 * '-1' = -8
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalMulPart02TestTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Decimal('8').mul('-1').toString()).assertEqual('-8');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MUL_PART02_SUPPLEMENT_TEST_1900
     * @tc.name testDecimalMulPart02TestTest019
     * @tc.desc Verify string 2.5 * '0.000000001' = 2.5e-9
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalMulPart02TestTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Decimal('2.5').mul('0.000000001').toString()).assertEqual('2.5e-9');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MUL_PART02_SUPPLEMENT_TEST_2000
     * @tc.name testDecimalMulPart02TestTest020
     * @tc.desc Verify string 'NaN' NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalMulPart02TestTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Decimal(5).mul('NaN').toString()).assertEqual('NaN');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MUL_PART02_SUPPLEMENT_TEST_2100
     * @tc.name testDecimalMulPart02TestTest021
     * @tc.desc Verify string 'Infinity'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalMulPart02TestTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Decimal(5).mul('Infinity').toString()).assertEqual('Infinity');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MUL_PART02_SUPPLEMENT_TEST_2200
     * @tc.name testDecimalMulPart02TestTest022
     * @tc.desc Verify string '-Infinity'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalMulPart02TestTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Decimal(5).mul('-Infinity').toString()).assertEqual('-Infinity');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MUL_PART02_SUPPLEMENT_TEST_2300
     * @tc.name testDecimalMulPart02TestTest023
     * @tc.desc Verify string '0' string 'Infinity' NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalMulPart02TestTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Decimal('0').mul('Infinity').toString()).assertEqual('NaN');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MUL_PART02_SUPPLEMENT_TEST_2400
     * @tc.name testDecimalMulPart02TestTest024
     * @tc.desc Verify number string '1e+309' * '2' = '2e+309'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalMulPart02TestTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Decimal('1e+309').mul('2').toString()).assertEqual('2e+309');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MUL_PART02_SUPPLEMENT_TEST_2500
     * @tc.name testDecimalMulPart02TestTest025
     * @tc.desc Verify '' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalMulPart02TestTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      try {
        new Decimal(3).mul('');
      } catch (e) {
        thrown = true;
        expect((e as Record<string, number>).code).assertEqual(401);
      }
      expect(thrown).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MUL_PART02_SUPPLEMENT_TEST_2600
     * @tc.name testDecimalMulPart02TestTest026
     * @tc.desc Verify ' ' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalMulPart02TestTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      try {
        new Decimal(4).mul('   ');
      } catch (e) {
        thrown = true;
        expect((e as Record<string, number>).code).assertEqual(401);
      }
      expect(thrown).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MUL_PART02_SUPPLEMENT_TEST_2700
     * @tc.name testDecimalMulPart02TestTest027
     * @tc.desc Verify 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalMulPart02TestTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      try {
        new Decimal(5).mul('​');
      } catch (e) {
        thrown = true;
        expect((e as Record<string, number>).code).assertEqual(401);
      }
      expect(thrown).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MUL_PART02_SUPPLEMENT_TEST_2800
     * @tc.name testDecimalMulPart02TestTest028
     * @tc.desc Verify mul('12') does not throw on device
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalMulPart02TestTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      try {
        new Decimal(7).mul('12');
      } catch (e) {
        thrown = true;
        expect((e as Record<string, number>).code).assertEqual(401);
      }
      expect(thrown).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MUL_PART02_SUPPLEMENT_TEST_2900
     * @tc.name testDecimalMulPart02TestTest029
     * @tc.desc Verify ' 4' 8 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalMulPart02TestTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let observed: string = '';
      try {
        observed = new Decimal(2).mul(' 4').toString();
      } catch (e) {
        expect((e as Record<string, number>).code).assertEqual(401);
        return;
      }
      expect(observed === '8').assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MUL_PART02_SUPPLEMENT_TEST_3000
     * @tc.name testDecimalMulPart02TestTest030
     * @tc.desc Verify '5 ' 10 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalMulPart02TestTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let observed: string = '';
      try {
        observed = new Decimal(2).mul('5 ').toString();
      } catch (e) {
        expect((e as Record<string, number>).code).assertEqual(401);
        return;
      }
      expect(observed === '10').assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MUL_PART02_SUPPLEMENT_TEST_3100
     * @tc.name testDecimalMulPart02TestTest031
     * @tc.desc Verify '3 4' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalMulPart02TestTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      try {
        new Decimal(8).mul('3 4');
      } catch (e) {
        thrown = true;
        expect((e as Record<string, number>).code).assertEqual(401);
      }
      expect(thrown).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MUL_PART02_SUPPLEMENT_TEST_3200
     * @tc.name testDecimalMulPart02TestTest032
     * @tc.desc Verify '\t' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalMulPart02TestTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      try {
        new Decimal(9).mul('\t');
      } catch (e) {
        thrown = true;
        expect((e as Record<string, number>).code).assertEqual(401);
      }
      expect(thrown).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MUL_PART02_SUPPLEMENT_TEST_3300
     * @tc.name testDecimalMulPart02TestTest033
     * @tc.desc Verify '\n' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalMulPart02TestTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      try {
        new Decimal(10).mul('\n');
      } catch (e) {
        thrown = true;
        expect((e as Record<string, number>).code).assertEqual(401);
      }
      expect(thrown).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MUL_PART02_SUPPLEMENT_TEST_3400
     * @tc.name testDecimalMulPart02TestTest034
     * @tc.desc Verify '\r' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalMulPart02TestTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      try {
        new Decimal(11).mul('\r');
      } catch (e) {
        thrown = true;
        expect((e as Record<string, number>).code).assertEqual(401);
      }
      expect(thrown).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MUL_PART02_SUPPLEMENT_TEST_3500
     * @tc.name testDecimalMulPart02TestTest035
     * @tc.desc Verify '\b' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalMulPart02TestTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      try {
        new Decimal(12).mul('\b');
      } catch (e) {
        thrown = true;
        expect((e as Record<string, number>).code).assertEqual(401);
      }
      expect(thrown).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MUL_PART02_SUPPLEMENT_TEST_3600
     * @tc.name testDecimalMulPart02TestTest036
     * @tc.desc Verify '\\x' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalMulPart02TestTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      try {
        new Decimal(13).mul('\\x');
      } catch (e) {
        thrown = true;
        expect((e as Record<string, number>).code).assertEqual(401);
      }
      expect(thrown).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MUL_PART02_SUPPLEMENT_TEST_3700
     * @tc.name testDecimalMulPart02TestTest037
     * @tc.desc Verify ' ' 2 * 123 = 246 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalMulPart02TestTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let observed: string = '';
      try {
        observed = new Decimal(2).mul('１２３').toString();
      } catch (e) {
        expect((e as Record<string, number>).code).assertEqual(401);
        return;
      }
      expect(observed === '246').assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MUL_PART02_SUPPLEMENT_TEST_3800
     * @tc.name testDecimalMulPart02TestTest038
     * @tc.desc Verify ' ' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalMulPart02TestTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      try {
        new Decimal(14).mul('一二三');
      } catch (e) {
        thrown = true;
        expect((e as Record<string, number>).code).assertEqual(401);
      }
      expect(thrown).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MUL_PART02_SUPPLEMENT_TEST_3900
     * @tc.name testDecimalMulPart02TestTest039
     * @tc.desc Verify emoji \u{1F600} 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalMulPart02TestTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      try {
        new Decimal(15).mul('\u{1F600}');
      } catch (e) {
        thrown = true;
        expect((e as Record<string, number>).code).assertEqual(401);
      }
      expect(thrown).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MUL_PART02_SUPPLEMENT_TEST_4000
     * @tc.name testDecimalMulPart02TestTest040
     * @tc.desc Verify '\uD83D' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalMulPart02TestTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      try {
        new Decimal(16).mul('\uD83D');
      } catch (e) {
        thrown = true;
        expect((e as Record<string, number>).code).assertEqual(401);
      }
      expect(thrown).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MUL_PART02_SUPPLEMENT_TEST_4100
     * @tc.name testDecimalMulPart02TestTest041
     * @tc.desc Verify '\uDE00' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalMulPart02TestTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      try {
        new Decimal(17).mul('\uDE00');
      } catch (e) {
        thrown = true;
        expect((e as Record<string, number>).code).assertEqual(401);
      }
      expect(thrown).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MUL_PART02_SUPPLEMENT_TEST_4200
     * @tc.name testDecimalMulPart02TestTest042
     * @tc.desc Verify string | number | Decimal 4 * 4 = 16
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalMulPart02TestTest042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let vs: string | number | Decimal = '4';
      let vn: string | number | Decimal = 4;
      let vd: string | number | Decimal = new Decimal(4);
      expect(new Decimal(4).mul(vs).toString()).assertEqual('16');
      expect(new Decimal(4).mul(vn).toString()).assertEqual('16');
      expect(new Decimal(4).mul(vd).toString()).assertEqual('16');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MUL_PART02_SUPPLEMENT_TEST_4300
     * @tc.name testDecimalMulPart02TestTest043
     * @tc.desc Verify null/undefined number/string nullish 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalMulPart02TestTest043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: number | null = null;
      let b: string | null = null;
      let c: number | undefined = undefined;
      let d: string | undefined = undefined;
      let codes: number[] = [];
      try { new Decimal(3).mul(a as ESObject); } catch (e) { codes.push((e as Record<string, number>).code); }
      try { new Decimal(3).mul(b as ESObject); } catch (e) { codes.push((e as Record<string, number>).code); }
      try { new Decimal(3).mul(c as ESObject); } catch (e) { codes.push((e as Record<string, number>).code); }
      try { new Decimal(3).mul(d as ESObject); } catch (e) { codes.push((e as Record<string, number>).code); }
      expect(codes.length).assertEqual(4);
      expect(codes[0]).assertEqual(401);
      expect(codes[1]).assertEqual(401);
      expect(codes[2]).assertEqual(401);
      expect(codes[3]).assertEqual(401);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MUL_PART02_SUPPLEMENT_TEST_4400
     * @tc.name testDecimalMulPart02TestTest044
     * @tc.desc Verify Date/RegExp/Error 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalMulPart02TestTest044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Date | number = new Date(0);
      let b: RegExp | string = /x/;
      let c: Error | number = new Error('boom');
      try {
        new Decimal(3).mul(a as ESObject);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
      try {
        new Decimal(3).mul(b as ESObject);
        expect().assertFail();
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
      try {
        new Decimal(3).mul(c as ESObject);
        expect().assertFail();
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MUL_PART02_SUPPLEMENT_TEST_4500
     * @tc.name testDecimalMulPart02TestTest045
     * @tc.desc Verify Array/Map/Set 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalMulPart02TestTest045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: ESObject = ['1'];
      let mp: ESObject = new Map<string, number>();
      let st: ESObject = new Set<number>();
      try {
        new Decimal(3).mul(arr as ESObject);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
      try {
        new Decimal(3).mul(mp as ESObject);
        expect().assertFail();
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
      try {
        new Decimal(3).mul(st as ESObject);
        expect().assertFail();
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MUL_PART02_SUPPLEMENT_TEST_4600
     * @tc.name testDecimalMulPart02TestTest046
     * @tc.desc Verify object input 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalMulPart02TestTest046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let hit: boolean = false;
      try {
        new Decimal(5).mul({ v: 2 } as ESObject);
      } catch (e) {
        expect(e.name).assertEqual('BusinessError');
        expect((e as BusinessError).code).assertEqual(401);
        hit = true;
      }
      expect(hit).assertTrue();


    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MUL_PART02_SUPPLEMENT_TEST_4700
     * @tc.name testDecimalMulPart02TestTest047
     * @tc.desc Verify Decimal
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalMulPart02TestTest047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Decimal = new Decimal('2.50');
      let b: Decimal = new Decimal('2.50');
      let r1: Decimal = new Decimal(2).mul(a);
      let r2: Decimal = new Decimal(2).mul(b);
      expect(r1.toString()).assertEqual('5');
      expect(r2.toString()).assertEqual('5');
      expect(r1 === r2).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MUL_PART02_SUPPLEMENT_TEST_4800
     * @tc.name testDecimalMulPart02TestTest048
     * @tc.desc Verify string Decimal 4 * '2.5' 4 * Decimal(2.5)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalMulPart02TestTest048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = '2.5';
      let d: Decimal = new Decimal('2.5');
      expect(new Decimal(4).mul(s).toString()).assertEqual('10');
      expect(new Decimal(4).mul(d).toString()).assertEqual('10');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MUL_PART02_SUPPLEMENT_TEST_4900
     * @tc.name testDecimalMulPart02TestTest049
     * @tc.desc Verify Record 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalMulPart02TestTest049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cross: Record<string, ESObject> = { a: '1', b: 2 } as ESObject;
      try {
        new Decimal(3).mul(cross as ESObject);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MUL_PART02_SUPPLEMENT_TEST_5000
     * @tc.name testDecimalMulPart02TestTest050
     * @tc.desc Verify undefined null 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalMulPart02TestTest050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let holder: Record<string, ESObject> = {};
      let missing: ESObject = holder['absent'];
      let nv: Record<string, ESObject> = { k: null } as ESObject;
      let explicitNull: ESObject = nv['k'];
      let t1: boolean = false;
      let t2: boolean = false;
      try { new Decimal(3).mul(missing as ESObject); } catch (e) { t1 = true; expect((e as Record<string, number>).code).assertEqual(401); }
      try { new Decimal(3).mul(explicitNull as ESObject); } catch (e) { t2 = true; expect((e as Record<string, number>).code).assertEqual(401); }
      expect(t1).assertTrue();
      expect(t2).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MUL_PART02_SUPPLEMENT_TEST_5100
     * @tc.name testDecimalMulPart02TestTest051
     * @tc.desc Verify typeof string number
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalMulPart02TestTest051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: ESObject = '6';
      let n: ESObject = 6;
      let bs: string = '';
      let bn: string = '';
      if (typeof s === 'string') { bs = new Decimal(3).mul(s as ESObject).toString(); }
      if (typeof n === 'number') { bn = new Decimal(3).mul(n as ESObject).toString(); }
      expect(bs).assertEqual('18');
      expect(bn).assertEqual('18');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MUL_PART02_SUPPLEMENT_TEST_5200
     * @tc.name testDecimalMulPart02TestTest052
     * @tc.desc Verify instanceof Decimal mul
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalMulPart02TestTest052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cand: ESObject = new Decimal(4);
      let branch: string = '';
      if (cand instanceof Decimal) { branch = new Decimal(3).mul(cand as ESObject).toString(); }
      expect(branch).assertEqual('12');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MUL_PART02_SUPPLEMENT_TEST_5300
     * @tc.name testDecimalMulPart02TestTest053
     * @tc.desc Verify Decimal string
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalMulPart02TestTest053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = new Decimal('12').mul('2');
      expect(r instanceof Decimal).assertTrue();
      expect(r.toString()).assertEqual('24');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MUL_PART02_SUPPLEMENT_TEST_5400
     * @tc.name testDecimalMulPart02TestTest054
     * @tc.desc Verify mul
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalMulPart02TestTest054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: Decimal = new Decimal('6');
      let r: Decimal = base.mul('3');
      expect(base.toString()).assertEqual('6');
      expect(r.toString()).assertEqual('18');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MUL_PART02_SUPPLEMENT_TEST_5500
     * @tc.name testDecimalMulPart02TestTest055
     * @tc.desc Verify string '1'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalMulPart02TestTest055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: Decimal = new Decimal('5');
      let r: Decimal = base.mul('1');
      expect(r === base).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MUL_PART02_SUPPLEMENT_TEST_5600
     * @tc.name testDecimalMulPart02TestTest056
     * @tc.desc Verify s/e/d
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalMulPart02TestTest056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = new Decimal('7').mul('3');
      expect(Array.isArray(r.d)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MUL_PART02_SUPPLEMENT_TEST_5700
     * @tc.name testDecimalMulPart02TestTest057
     * @tc.desc Verify toNumber '0.25' * '8' = 2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalMulPart02TestTest057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = new Decimal('0.25').mul('8');
      expect(r.toNumber()).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MUL_PART02_SUPPLEMENT_TEST_5800
     * @tc.name testDecimalMulPart02TestTest058
     * @tc.desc Verify mul string
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalMulPart02TestTest058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Decimal(2).mul('3').mul('4').toString()).assertEqual('24');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MUL_PART02_SUPPLEMENT_TEST_5900
     * @tc.name testDecimalMulPart02TestTest059
     * @tc.desc Verify 'abc' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalMulPart02TestTest059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      try {
        new Decimal(18).mul('abc');
      } catch (e) {
        thrown = true;
        expect((e as Record<string, number>).code).assertEqual(401);
      }
      expect(thrown).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MUL_PART02_SUPPLEMENT_TEST_6000
     * @tc.name testDecimalMulPart02TestTest060
     * @tc.desc Verify '123abc' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalMulPart02TestTest060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      try {
        new Decimal(19).mul('123abc');
      } catch (e) {
        thrown = true;
        expect((e as Record<string, number>).code).assertEqual(401);
      }
      expect(thrown).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MUL_PART02_SUPPLEMENT_TEST_6100
     * @tc.name testDecimalMulPart02TestTest061
     * @tc.desc Verify 'abc123' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalMulPart02TestTest061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      try {
        new Decimal(20).mul('abc123');
      } catch (e) {
        thrown = true;
        expect((e as Record<string, number>).code).assertEqual(401);
      }
      expect(thrown).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MUL_PART02_SUPPLEMENT_TEST_6200
     * @tc.name testDecimalMulPart02TestTest062
     * @tc.desc Verify '1,234' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalMulPart02TestTest062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      try {
        new Decimal(21).mul('1,234');
      } catch (e) {
        thrown = true;
        expect((e as Record<string, number>).code).assertEqual(401);
      }
      expect(thrown).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MUL_PART02_SUPPLEMENT_TEST_6300
     * @tc.name testDecimalMulPart02TestTest063
     * @tc.desc Verify mul('0x10') does not throw on device
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalMulPart02TestTest063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      try {
        new Decimal(22).mul('0x10');
      } catch (e) {
        thrown = true;
        expect((e as Record<string, number>).code).assertEqual(401);
      }
      expect(thrown).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MUL_PART02_SUPPLEMENT_TEST_6400
     * @tc.name testDecimalMulPart02TestTest064
     * @tc.desc Verify mul('0b101') does not throw on device
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalMulPart02TestTest064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      try {
        new Decimal(23).mul('0b101');
      } catch (e) {
        thrown = true;
        expect((e as Record<string, number>).code).assertEqual(401);
      }
      expect(thrown).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MUL_PART02_SUPPLEMENT_TEST_6500
     * @tc.name testDecimalMulPart02TestTest065
     * @tc.desc Verify '1e' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalMulPart02TestTest065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      try {
        new Decimal(24).mul('1e');
      } catch (e) {
        thrown = true;
        expect((e as Record<string, number>).code).assertEqual(401);
      }
      expect(thrown).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MUL_PART02_SUPPLEMENT_TEST_6600
     * @tc.name testDecimalMulPart02TestTest066
     * @tc.desc Verify '.' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalMulPart02TestTest066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      try {
        new Decimal(25).mul('.');
      } catch (e) {
        thrown = true;
        expect((e as Record<string, number>).code).assertEqual(401);
      }
      expect(thrown).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MUL_PART02_SUPPLEMENT_TEST_6700
     * @tc.name testDecimalMulPart02TestTest067
     * @tc.desc Verify '1.2.3' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalMulPart02TestTest067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      try {
        new Decimal(26).mul('1.2.3');
      } catch (e) {
        thrown = true;
        expect((e as Record<string, number>).code).assertEqual(401);
      }
      expect(thrown).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MUL_PART02_SUPPLEMENT_TEST_6800
     * @tc.name testDecimalMulPart02TestTest068
     * @tc.desc Verify '-' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalMulPart02TestTest068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      try {
        new Decimal(27).mul('-');
      } catch (e) {
        thrown = true;
        expect((e as Record<string, number>).code).assertEqual(401);
      }
      expect(thrown).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MUL_PART02_SUPPLEMENT_TEST_6900
     * @tc.name testDecimalMulPart02TestTest069
     * @tc.desc Verify '+-5' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalMulPart02TestTest069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      try {
        new Decimal(28).mul('+-5');
      } catch (e) {
        thrown = true;
        expect((e as Record<string, number>).code).assertEqual(401);
      }
      expect(thrown).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MUL_PART02_SUPPLEMENT_TEST_7000
     * @tc.name testDecimalMulPart02TestTest070
     * @tc.desc Verify XSS '<script>alert(1)</script>' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalMulPart02TestTest070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      try {
        new Decimal(29).mul('<script>alert(1)</script>');
      } catch (e) {
        thrown = true;
        expect((e as Record<string, number>).code).assertEqual(401);
      }
      expect(thrown).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MUL_PART02_SUPPLEMENT_TEST_7100
     * @tc.name testDecimalMulPart02TestTest071
     * @tc.desc Verify 300 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalMulPart02TestTest071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let payload: string = 'a'.repeat(300);
      let thrown: boolean = false;
      try {
        new Decimal(30).mul(payload);
      } catch (e) {
        thrown = true;
        expect((e as Record<string, number>).code).assertEqual(401);
      }
      expect(thrown).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MUL_PART02_SUPPLEMENT_TEST_7200
     * @tc.name testDecimalMulPart02TestTest072
     * @tc.desc Verify 200 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalMulPart02TestTest072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let payload: string = '​'.repeat(200);
      let thrown: boolean = false;
      try {
        new Decimal(31).mul(payload);
      } catch (e) {
        thrown = true;
        expect((e as Record<string, number>).code).assertEqual(401);
      }
      expect(thrown).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MUL_PART02_SUPPLEMENT_TEST_7300
     * @tc.name testDecimalMulPart02TestTest073
     * @tc.desc Verify 50 precision 60 '2'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalMulPart02TestTest073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ precision: 60 });
      try {
        let input: string = '0.' + '1234567890'.repeat(5);
        let expectStr: string = '0.' + '2469135780'.repeat(5);
        expectStr = expectStr.slice(0, 51);
        let r: Decimal = new Decimal(input).mul('2');
        expect(r.toString()).assertEqual(expectStr);
      } finally {
        Decimal.set({ precision: 20, rounding: 4 });
      }
    });


  });

}
