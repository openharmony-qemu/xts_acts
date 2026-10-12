
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

export default function decimalPowPart02TestTest() {
  describe('DecimalPowPart02TestTest', () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_POW_PART02_SUPPLEMENT_TEST_0100
     * @tc.name testDecimalPowPart02TestTest001
     * @tc.desc Verify '2' 3^2 = 9
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPowPart02TestTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(3).pow('2');
      expect(d.toString()).assertEqual('9');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_POW_PART02_SUPPLEMENT_TEST_0200
     * @tc.name testDecimalPowPart02TestTest002
     * @tc.desc Verify '-2' 3^-2 20
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPowPart02TestTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(3).pow('-2');
      expect(d.toString()).assertEqual('0.11111111111111111111');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_POW_PART02_SUPPLEMENT_TEST_0300
     * @tc.name testDecimalPowPart02TestTest003
     * @tc.desc Verify '0.5' 4^0.5 2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPowPart02TestTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(4).pow('0.5');
      expect(d.toString()).assertEqual('2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_POW_PART02_SUPPLEMENT_TEST_0400
     * @tc.name testDecimalPowPart02TestTest004
     * @tc.desc Verify '1e1' 2^10 = 1024
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPowPart02TestTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(2).pow('1e1');
      expect(d.toString()).assertEqual('1024');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_POW_PART02_SUPPLEMENT_TEST_0500
     * @tc.name testDecimalPowPart02TestTest005
     * @tc.desc Verify '1e-1' 2^0.1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPowPart02TestTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(2).pow('1e-1');
      expect(d.toString()).assertEqual('1.0717734625362931642');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_POW_PART02_SUPPLEMENT_TEST_0600
     * @tc.name testDecimalPowPart02TestTest006
     * @tc.desc Verify '1.5e1' 2^15 = 32768
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPowPart02TestTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(2).pow('1.5e1');
      expect(d.toString()).assertEqual('32768');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_POW_PART02_SUPPLEMENT_TEST_0700
     * @tc.name testDecimalPowPart02TestTest007
     * @tc.desc Verify '0x10' 2^16 = 65536
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPowPart02TestTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(2).pow('0x10');
      expect(d.toString()).assertEqual('65536');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_POW_PART02_SUPPLEMENT_TEST_0800
     * @tc.name testDecimalPowPart02TestTest008
     * @tc.desc Verify '0b101' 2^5 = 32
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPowPart02TestTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(2).pow('0b101');
      expect(d.toString()).assertEqual('32');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_POW_PART02_SUPPLEMENT_TEST_0900
     * @tc.name testDecimalPowPart02TestTest009
     * @tc.desc Verify '0o7' 2^7 = 128
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPowPart02TestTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(2).pow('0o7');
      expect(d.toString()).assertEqual('128');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_POW_PART02_SUPPLEMENT_TEST_1000
     * @tc.name testDecimalPowPart02TestTest010
     * @tc.desc Verify '-0x2' 2^-2 = 0.25
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPowPart02TestTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(2).pow('-0x2');
      expect(d.toString()).assertEqual('0.25');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_POW_PART02_SUPPLEMENT_TEST_1100
     * @tc.name testDecimalPowPart02TestTest011
     * @tc.desc Verify '1_0' 2^10 = 1024
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPowPart02TestTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(2).pow('1_0');
      expect(d.toString()).assertEqual('1024');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_POW_PART02_SUPPLEMENT_TEST_1200
     * @tc.name testDecimalPowPart02TestTest012
     * @tc.desc Verify '007' 2^7 = 128
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPowPart02TestTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(2).pow('007');
      expect(d.toString()).assertEqual('128');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_POW_PART02_SUPPLEMENT_TEST_1300
     * @tc.name testDecimalPowPart02TestTest013
     * @tc.desc Verify '+3' 2^3 = 8
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPowPart02TestTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(2).pow('+3');
      expect(d.toString()).assertEqual('8');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_POW_PART02_SUPPLEMENT_TEST_1400
     * @tc.name testDecimalPowPart02TestTest014
     * @tc.desc Verify '2.0' 2^2 = 4
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPowPart02TestTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(2).pow('2.0');
      expect(d.toString()).assertEqual('4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_POW_PART02_SUPPLEMENT_TEST_1500
     * @tc.name testDecimalPowPart02TestTest015
     * @tc.desc Verify '.5' 3^0.5
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPowPart02TestTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(3).pow('.5');
      expect(d.toString()).assertEqual('1.7320508075688772935');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_POW_PART02_SUPPLEMENT_TEST_1600
     * @tc.name testDecimalPowPart02TestTest016
     * @tc.desc Verify '123' 2^123
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPowPart02TestTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(2).pow('123');
      expect(d.toString()).assertEqual('1.0633823966279326983e+37');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_POW_PART02_SUPPLEMENT_TEST_1700
     * @tc.name testDecimalPowPart02TestTest017
     * @tc.desc Verify '0.000000001' 2^(1e-9)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPowPart02TestTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(2).pow('0.000000001');
      expect(d.toString()).assertEqual('1.0000000006931471808');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_POW_PART02_SUPPLEMENT_TEST_1800
     * @tc.name testDecimalPowPart02TestTest018
     * @tc.desc Verify '0.333' 2^0.333
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPowPart02TestTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(2).pow('0.333');
      expect(d.toString()).assertEqual('1.2596299799473993503');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_POW_PART02_SUPPLEMENT_TEST_1900
     * @tc.name testDecimalPowPart02TestTest019
     * @tc.desc Verify '0.123456789012345678901'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPowPart02TestTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(2).pow('0.123456789012345678901');
      expect(d.toString()).assertEqual('1.089341870358005049');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_POW_PART02_SUPPLEMENT_TEST_2000
     * @tc.name testDecimalPowPart02TestTest020
     * @tc.desc Verify '0.00' 0 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPowPart02TestTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(2).pow('0.00');
      expect(d.toString()).assertEqual('1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_POW_PART02_SUPPLEMENT_TEST_2100
     * @tc.name testDecimalPowPart02TestTest021
     * @tc.desc Verify '1e9' 2^(1e9)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPowPart02TestTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(2).pow('1e9');
      expect(d.toString()).assertEqual('4.6129760011690693931e+301029995');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_POW_PART02_SUPPLEMENT_TEST_2200
     * @tc.name testDecimalPowPart02TestTest022
     * @tc.desc Verify '-1e9' 2^(-1e9)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPowPart02TestTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(2).pow('-1e9');
      expect(d.toString()).assertEqual('2.1677979676169340022e-301029996');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_POW_PART02_SUPPLEMENT_TEST_2300
     * @tc.name testDecimalPowPart02TestTest023
     * @tc.desc Verify '9007199254740991' 3 MAX_SAFE_INTEGER
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPowPart02TestTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(3).pow('9007199254740991');
      expect(d.toString()).assertEqual('1.0964569241931549428e+4297526209932030');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_POW_PART02_SUPPLEMENT_TEST_2400
     * @tc.name testDecimalPowPart02TestTest024
     * @tc.desc Verify '0'.repeat(3000)+'2' 2 2^2 = 4
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPowPart02TestTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: string = '0'.repeat(3000) + '2';
      let d: Decimal = new Decimal(2).pow(v);
      expect(d.toString()).assertEqual('4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_POW_PART02_SUPPLEMENT_TEST_2500
     * @tc.name testDecimalPowPart02TestTest025
     * @tc.desc Verify '-0' 7^-0 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPowPart02TestTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(7).pow('-0');
      expect(d.toString()).assertEqual('1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_POW_PART02_SUPPLEMENT_TEST_2600
     * @tc.name testDecimalPowPart02TestTest026
     * @tc.desc Verify 'Infinity' 3^Infinity = Infinity
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPowPart02TestTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(3).pow('Infinity');
      expect(d.toString()).assertEqual('Infinity');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_POW_PART02_SUPPLEMENT_TEST_2700
     * @tc.name testDecimalPowPart02TestTest027
     * @tc.desc Verify '-Infinity' 3^(-Infinity) = 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPowPart02TestTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(3).pow('-Infinity');
      expect(d.toString()).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_POW_PART02_SUPPLEMENT_TEST_2800
     * @tc.name testDecimalPowPart02TestTest028
     * @tc.desc Verify 'NaN' 3^NaN = NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPowPart02TestTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(3).pow('NaN');
      expect(d.toString()).assertEqual('NaN');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_POW_PART02_SUPPLEMENT_TEST_2900
     * @tc.name testDecimalPowPart02TestTest029
     * @tc.desc Verify 0^0 = 1 '0'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPowPart02TestTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(0).pow('0');
      expect(d.toString()).assertEqual('1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_POW_PART02_SUPPLEMENT_TEST_3000
     * @tc.name testDecimalPowPart02TestTest030
     * @tc.desc Verify '-3' (-8)^-3 = -0.001953125
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPowPart02TestTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(-8).pow('-3');
      expect(d.toString()).assertEqual('-0.001953125');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_POW_PART02_SUPPLEMENT_TEST_3100
     * @tc.name testDecimalPowPart02TestTest031
     * @tc.desc Verify '2.5' (-8)^2.5 = NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPowPart02TestTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(-8).pow('2.5');
      expect(d.toString()).assertEqual('NaN');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_POW_PART02_SUPPLEMENT_TEST_3200
     * @tc.name testDecimalPowPart02TestTest032
     * @tc.desc Verify '2.5' 4^2.5 = 32
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPowPart02TestTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(4).pow('2.5');
      expect(d.toString()).assertEqual('32');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_POW_PART02_SUPPLEMENT_TEST_3300
     * @tc.name testDecimalPowPart02TestTest033
     * @tc.desc Verify -0 '3' (-0)^3 = 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPowPart02TestTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal('-0').pow('3');
      expect(d.toString()).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_POW_PART02_SUPPLEMENT_TEST_3400
     * @tc.name testDecimalPowPart02TestTest034
     * @tc.desc Verify -0 '-1' (-0)^-1 = -Infinity
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPowPart02TestTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal('-0').pow('-1');
      expect(d.toString()).assertEqual('-Infinity');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_POW_PART02_SUPPLEMENT_TEST_3500
     * @tc.name testDecimalPowPart02TestTest035
     * @tc.desc Verify 1 '1e9' 1^1e9 = 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPowPart02TestTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(1).pow('1e9');
      expect(d.toString()).assertEqual('1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_POW_PART02_SUPPLEMENT_TEST_3600
     * @tc.name testDecimalPowPart02TestTest036
     * @tc.desc Verify number|string string '2' 3^2 = 9
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPowPart02TestTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: string | number = '2';
      let d: Decimal = new Decimal(3).pow(e);
      expect(d.toString()).assertEqual('9');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_POW_PART02_SUPPLEMENT_TEST_3700
     * @tc.name testDecimalPowPart02TestTest037
     * @tc.desc Verify number|string number 2 3^2 = 9
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPowPart02TestTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: string | number = 2;
      let d: Decimal = new Decimal(3).pow(e);
      expect(d.toString()).assertEqual('9');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_POW_PART02_SUPPLEMENT_TEST_3800
     * @tc.name testDecimalPowPart02TestTest038
     * @tc.desc Verify number|Decimal number 3 3^3 = 27
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPowPart02TestTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: number | Decimal = 3;
      let d: Decimal = new Decimal(3).pow(e);
      expect(d.toString()).assertEqual('27');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_POW_PART02_SUPPLEMENT_TEST_3900
     * @tc.name testDecimalPowPart02TestTest039
     * @tc.desc Verify number|Decimal Decimal new Decimal(3) 3^3 = 27
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPowPart02TestTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: number | Decimal = new Decimal(3);
      let d: Decimal = new Decimal(3).pow(e);
      expect(d.toString()).assertEqual('27');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_POW_PART02_SUPPLEMENT_TEST_4000
     * @tc.name testDecimalPowPart02TestTest040
     * @tc.desc Verify string|Decimal string '2' 2^2 = 4
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPowPart02TestTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: string | Decimal = '2';
      let d: Decimal = new Decimal(2).pow(e);
      expect(d.toString()).assertEqual('4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_POW_PART02_SUPPLEMENT_TEST_4100
     * @tc.name testDecimalPowPart02TestTest041
     * @tc.desc Verify string|Decimal Decimal new Decimal(2) 2^2 = 4
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPowPart02TestTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: string | Decimal = new Decimal(2);
      let d: Decimal = new Decimal(2).pow(e);
      expect(d.toString()).assertEqual('4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_POW_PART02_SUPPLEMENT_TEST_4200
     * @tc.name testDecimalPowPart02TestTest042
     * @tc.desc Verify number|string|Decimal 3^3 = 27
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPowPart02TestTest042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e1: number | string | Decimal = 3;
      let e2: number | string | Decimal = '3';
      let e3: number | string | Decimal = new Decimal(3);
      let base: Decimal = new Decimal(3);
      expect(base.pow(e1).toString()).assertEqual('27');
      expect(base.pow(e2).toString()).assertEqual('27');
      expect(base.pow(e3).toString()).assertEqual('27');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_POW_PART02_SUPPLEMENT_TEST_4300
     * @tc.name testDecimalPowPart02TestTest043
     * @tc.desc Verify pow() null/undefined 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPowPart02TestTest043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: ESObject = new Decimal(3);
      try {
        d.pow();
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_POW_PART02_SUPPLEMENT_TEST_4400
     * @tc.name testDecimalPowPart02TestTest044
     * @tc.desc Verify boolean string|boolean true 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPowPart02TestTest044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: ESObject = true;
      try {
        new Decimal(3).pow(e as ESObject);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_POW_PART02_SUPPLEMENT_TEST_4500
     * @tc.name testDecimalPowPart02TestTest045
     * @tc.desc Verify number|number[] [2] 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPowPart02TestTest045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: ESObject = [2];
      try {
        new Decimal(3).pow(e as ESObject);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_POW_PART02_SUPPLEMENT_TEST_4600
     * @tc.name testDecimalPowPart02TestTest046
     * @tc.desc Verify Date number|Date new Date() 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPowPart02TestTest046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: ESObject = new Date();
      try {
        new Decimal(3).pow(e as ESObject);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_POW_PART02_SUPPLEMENT_TEST_4700
     * @tc.name testDecimalPowPart02TestTest047
     * @tc.desc Verify Decimal('2') Decimal(2) 2^2 = 4
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPowPart02TestTest047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r1: Decimal = new Decimal('2');
      let r2: Decimal = new Decimal(2);
      expect(new Decimal(2).pow(r1).toString()).assertEqual('4');
      expect(new Decimal(2).pow(r2).toString()).assertEqual('4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_POW_PART02_SUPPLEMENT_TEST_4800
     * @tc.name testDecimalPowPart02TestTest048
     * @tc.desc Verify 4^0.5 = 2 4^2 = 16
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPowPart02TestTest048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e1: string | number = 0.5;
      let e2: string | number = '2';
      let base: Decimal = new Decimal(4);
      expect(base.pow(e1).toString()).assertEqual('2');
      expect(base.pow(e2).toString()).assertEqual('16');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_POW_PART02_SUPPLEMENT_TEST_4900
     * @tc.name testDecimalPowPart02TestTest049
     * @tc.desc Verify pow Decimal instanceof
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPowPart02TestTest049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = new Decimal(3).pow('2');
      expect(r instanceof Decimal).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_POW_PART02_SUPPLEMENT_TEST_5000
     * @tc.name testDecimalPowPart02TestTest050
     * @tc.desc Verify string values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPowPart02TestTest050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: Decimal = new Decimal(3);
      let r: Decimal = b.pow('2');
      expect(b.toString()).assertEqual('3');
      expect(r.toString()).assertEqual('9');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_POW_PART02_SUPPLEMENT_TEST_5100
     * @tc.name testDecimalPowPart02TestTest051
     * @tc.desc Verify pow (3^2)^2 = 81
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPowPart02TestTest051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = new Decimal(3).pow('2').pow('2');
      expect(r.toString()).assertEqual('81');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_POW_PART02_SUPPLEMENT_TEST_5200
     * @tc.name testDecimalPowPart02TestTest052
     * @tc.desc Verify toString 2^0.5 20
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPowPart02TestTest052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = new Decimal(2).pow('0.5');
      expect(r.toString()).assertEqual('1.4142135623730950488');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_POW_PART02_SUPPLEMENT_TEST_5300
     * @tc.name testDecimalPowPart02TestTest053
     * @tc.desc Verify s = -1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPowPart02TestTest053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = new Decimal(-8).pow('3');
      expect(r.s).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_POW_PART02_SUPPLEMENT_TEST_5400
     * @tc.name testDecimalPowPart02TestTest054
     * @tc.desc Verify s = 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPowPart02TestTest054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = new Decimal(4).pow('0.5');
      expect(r.s).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_POW_PART02_SUPPLEMENT_TEST_5500
     * @tc.name testDecimalPowPart02TestTest055
     * @tc.desc Verify toNumber Infinity
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPowPart02TestTest055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = new Decimal(2).pow('1e9');
      expect(r.toNumber()).assertEqual(Infinity);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_POW_PART02_SUPPLEMENT_TEST_5600
     * @tc.name testDecimalPowPart02TestTest056
     * @tc.desc Verify toNumber 0 toString
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPowPart02TestTest056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = new Decimal(2).pow('-1e9');
      expect(r.toNumber()).assertEqual(0);
      expect(r.toString().startsWith('2.1677979676')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_POW_PART02_SUPPLEMENT_TEST_5700
     * @tc.name testDecimalPowPart02TestTest057
     * @tc.desc Verify 'abc' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPowPart02TestTest057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: ESObject = 'abc';
      try {
        new Decimal(3).pow(v as ESObject);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_POW_PART02_SUPPLEMENT_TEST_5800
     * @tc.name testDecimalPowPart02TestTest058
     * @tc.desc Verify ' ' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPowPart02TestTest058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: ESObject = '   ';
      try {
        new Decimal(3).pow(v as ESObject);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_POW_PART02_SUPPLEMENT_TEST_5900
     * @tc.name testDecimalPowPart02TestTest059
     * @tc.desc Verify ' 2' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPowPart02TestTest059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: ESObject = ' 2';
      try {
        new Decimal(3).pow(v as ESObject);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_POW_PART02_SUPPLEMENT_TEST_6000
     * @tc.name testDecimalPowPart02TestTest060
     * @tc.desc Verify '\t2' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPowPart02TestTest060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: ESObject = '\t2';
      try {
        new Decimal(3).pow(v as ESObject);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_POW_PART02_SUPPLEMENT_TEST_6100
     * @tc.name testDecimalPowPart02TestTest061
     * @tc.desc Verify '\n2' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPowPart02TestTest061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: ESObject = '\n2';
      try {
        new Decimal(3).pow(v as ESObject);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_POW_PART02_SUPPLEMENT_TEST_6200
     * @tc.name testDecimalPowPart02TestTest062
     * @tc.desc Verify ' ' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPowPart02TestTest062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: ESObject = '​';
      try {
        new Decimal(3).pow(v as ESObject);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_POW_PART02_SUPPLEMENT_TEST_6300
     * @tc.name testDecimalPowPart02TestTest063
     * @tc.desc Verify NUL ' ' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPowPart02TestTest063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: ESObject = ' ';
      try {
        new Decimal(3).pow(v as ESObject);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_POW_PART02_SUPPLEMENT_TEST_6400
     * @tc.name testDecimalPowPart02TestTest064
     * @tc.desc Verify '12abc' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPowPart02TestTest064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: ESObject = '12abc';
      try {
        new Decimal(3).pow(v as ESObject);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_POW_PART02_SUPPLEMENT_TEST_6500
     * @tc.name testDecimalPowPart02TestTest065
     * @tc.desc Verify '1.2.3' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPowPart02TestTest065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: ESObject = '1.2.3';
      try {
        new Decimal(3).pow(v as ESObject);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_POW_PART02_SUPPLEMENT_TEST_6600
     * @tc.name testDecimalPowPart02TestTest066
     * @tc.desc Verify '1e' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPowPart02TestTest066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: ESObject = '1e';
      try {
        new Decimal(3).pow(v as ESObject);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_POW_PART02_SUPPLEMENT_TEST_6700
     * @tc.name testDecimalPowPart02TestTest067
     * @tc.desc Verify '--2' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPowPart02TestTest067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: ESObject = '--2';
      try {
        new Decimal(3).pow(v as ESObject);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_POW_PART02_SUPPLEMENT_TEST_6800
     * @tc.name testDecimalPowPart02TestTest068
     * @tc.desc Verify '0xG' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPowPart02TestTest068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: ESObject = '0xG';
      try {
        new Decimal(3).pow(v as ESObject);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_POW_PART02_SUPPLEMENT_TEST_6900
     * @tc.name testDecimalPowPart02TestTest069
     * @tc.desc Verify BOM ' 2' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPowPart02TestTest069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: ESObject = '﻿2';
      try {
        new Decimal(3).pow(v as ESObject);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_POW_PART02_SUPPLEMENT_TEST_7000
     * @tc.name testDecimalPowPart02TestTest070
     * @tc.desc Verify ' ' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPowPart02TestTest070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: ESObject = '２';
      try {
        new Decimal(3).pow(v as ESObject);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_POW_PART02_SUPPLEMENT_TEST_7100
     * @tc.name testDecimalPowPart02TestTest071
     * @tc.desc Verify emoji '2 ' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPowPart02TestTest071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: ESObject = '2️⃣';
      try {
        new Decimal(3).pow(v as ESObject);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_POW_PART02_SUPPLEMENT_TEST_7200
     * @tc.name testDecimalPowPart02TestTest072
     * @tc.desc Verify 'a'.repeat(5000) 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPowPart02TestTest072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: ESObject = 'a'.repeat(5000);
      try {
        new Decimal(3).pow(v as ESObject);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_POW_PART02_SUPPLEMENT_TEST_7300
     * @tc.name testDecimalPowPart02TestTest073
     * @tc.desc Verify XSS '<script>alert(1)</script>' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPowPart02TestTest073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: ESObject = '<script>alert(1)</script>';
      try {
        new Decimal(3).pow(v as ESObject);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_POW_PART02_SUPPLEMENT_TEST_7400
     * @tc.name testDecimalPowPart02TestTest074
     * @tc.desc Verify Unicode ' ' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPowPart02TestTest074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: ESObject = '中文';
      try {
        new Decimal(3).pow(v as ESObject);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_POW_PART02_SUPPLEMENT_TEST_7500
     * @tc.name testDecimalPowPart02TestTest075
     * @tc.desc Verify '\ud800' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPowPart02TestTest075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: ESObject = '\ud800';
      try {
        new Decimal(3).pow(v as ESObject);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });


  });

}
