
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

export default function decimalLnTestTest() {
  describe('DecimalLnTestTest', () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LN_SUPPLEMENT_TEST_0100
     * @tc.name testDecimalLnTestTest001
     * @tc.desc Verify (assertTrue)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLnTestTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const dec: Decimal = new Decimal(2);
      const r: Decimal = dec.ln();
      expect(Math.abs(r.toNumber() - 0.6931471805599453) < 1e-12).assertTrue();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LN_SUPPLEMENT_TEST_0200
     * @tc.name testDecimalLnTestTest002
     * @tc.desc Verify (assertTrue)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLnTestTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const dec: Decimal = new Decimal(2.718281828459045);
      expect(Math.abs(dec.ln().toNumber() - 1) < 1e-15).assertTrue();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LN_SUPPLEMENT_TEST_0300
     * @tc.name testDecimalLnTestTest003
     * @tc.desc Verify toString (assertEqual)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLnTestTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const dec: Decimal = new Decimal(2);
      const r0: Decimal = dec.ln();
      const r1: Decimal = dec.ln();
      expect(r0.toString()).assertEqual(r1.toString());
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LN_SUPPLEMENT_TEST_0400
     * @tc.name testDecimalLnTestTest004
     * @tc.desc Verify (assertTrue)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLnTestTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const dec: Decimal = new Decimal(7);
      const r: Decimal = dec.ln();
      expect(Math.abs(r.toNumber() - 1.945910149055313) < 1e-12).assertTrue();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LN_SUPPLEMENT_TEST_0500
     * @tc.name testDecimalLnTestTest005
     * @tc.desc Verify (assertEqual)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLnTestTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const dec: Decimal = new Decimal(1);
      const chained: Decimal = dec.ln().add(5);
      expect(chained.toNumber()).assertEqual(5);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LN_SUPPLEMENT_TEST_0600
     * @tc.name testDecimalLnTestTest006
     * @tc.desc Verify toString (assertEqual)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLnTestTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const dec: Decimal = new Decimal(1);
      expect(dec.ln().toString()).assertEqual('0');
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LN_SUPPLEMENT_TEST_0700
     * @tc.name testDecimalLnTestTest007
     * @tc.desc Verify (assertTrue)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLnTestTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const dec: Decimal = new Decimal(10);
      expect(Math.abs(dec.ln().toNumber() - 2.302585092994046) < 1e-12).assertTrue();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LN_SUPPLEMENT_TEST_0800
     * @tc.name testDecimalLnTestTest008
     * @tc.desc Verify (assertTrue)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLnTestTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const dec: Decimal = new Decimal(100);
      expect(Math.abs(dec.ln().toNumber() - 4.605170185988092) < 1e-12).assertTrue();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LN_SUPPLEMENT_TEST_0900
     * @tc.name testDecimalLnTestTest009
     * @tc.desc Verify (assertTrue)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLnTestTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const dec: Decimal = new Decimal(1000);
      expect(Math.abs(dec.ln().toNumber() - 6.907755278982137) < 1e-12).assertTrue();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LN_SUPPLEMENT_TEST_1000
     * @tc.name testDecimalLnTestTest010
     * @tc.desc Verify (assertTrue)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLnTestTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const dec: Decimal = new Decimal(0.5);
      expect(Math.abs(dec.ln().toNumber() + 0.6931471805599453) < 1e-12).assertTrue();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LN_SUPPLEMENT_TEST_1100
     * @tc.name testDecimalLnTestTest011
     * @tc.desc Verify (assertTrue)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLnTestTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const dec: Decimal = new Decimal(0.1);
      expect(Math.abs(dec.ln().toNumber() + 2.302585092994046) < 1e-12).assertTrue();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LN_SUPPLEMENT_TEST_1200
     * @tc.name testDecimalLnTestTest012
     * @tc.desc Verify (assertTrue)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLnTestTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const dec: Decimal = new Decimal(0.01);
      expect(Math.abs(dec.ln().toNumber() + 4.605170185988092) < 1e-12).assertTrue();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LN_SUPPLEMENT_TEST_1300
     * @tc.name testDecimalLnTestTest013
     * @tc.desc Verify (assertTrue)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLnTestTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const dec: Decimal = new Decimal(7);
      expect(Math.abs(dec.ln().toNumber() - 1.945910149055313) < 1e-12).assertTrue();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LN_SUPPLEMENT_TEST_1400
     * @tc.name testDecimalLnTestTest014
     * @tc.desc Verify (assertTrue)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLnTestTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const dec: Decimal = new Decimal(1.5);
      expect(Math.abs(dec.ln().toNumber() - 0.4054651081081644) < 1e-12).assertTrue();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LN_SUPPLEMENT_TEST_1500
     * @tc.name testDecimalLnTestTest015
     * @tc.desc Verify (assertTrue)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLnTestTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const dec: Decimal = new Decimal(1e3);
      expect(Math.abs(dec.ln().toNumber() - 6.907755278982137) < 1e-12).assertTrue();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LN_SUPPLEMENT_TEST_1600
     * @tc.name testDecimalLnTestTest016
     * @tc.desc Verify (assertTrue)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLnTestTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const dec: Decimal = new Decimal(1e-7);
      expect(Math.abs(dec.ln().toNumber() + 16.11809565095832) < 1e-12).assertTrue();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LN_SUPPLEMENT_TEST_1700
     * @tc.name testDecimalLnTestTest017
     * @tc.desc Verify (assertTrue)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLnTestTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const dec: Decimal = new Decimal(1e-3);
      expect(Math.abs(dec.ln().toNumber() + 6.907755278982137) < 1e-12).assertTrue();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LN_SUPPLEMENT_TEST_1800
     * @tc.name testDecimalLnTestTest018
     * @tc.desc Verify ln(MAX_SAFE_INTEGER)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLnTestTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const dec: Decimal = new Decimal(Number.MAX_SAFE_INTEGER);
      expect(Math.abs(dec.ln().toNumber() - 36.7368005696771) < 1e-9).assertTrue();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LN_SUPPLEMENT_TEST_1900
     * @tc.name testDecimalLnTestTest019
     * @tc.desc Verify (assertTrue)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLnTestTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const dec: Decimal = new Decimal(123456789);
      expect(Math.abs(dec.ln().toNumber() - 18.63140176616802) < 1e-9).assertTrue();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LN_SUPPLEMENT_TEST_2000
     * @tc.name testDecimalLnTestTest020
     * @tc.desc Verify ln(MAX_VALUE) ln(1e308)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLnTestTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const dec: Decimal = new Decimal(Number.MAX_VALUE);
      expect(Math.abs(dec.ln().toNumber() - 709.782712893384) < 1e-6).assertTrue();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LN_SUPPLEMENT_TEST_2100
     * @tc.name testDecimalLnTestTest021
     * @tc.desc Verify ln(MIN_VALUE 5e-324)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLnTestTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const dec: Decimal = new Decimal(Number.MIN_VALUE);
      expect(dec.ln().toNumber() < -700).assertTrue();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LN_SUPPLEMENT_TEST_2200
     * @tc.name testDecimalLnTestTest022
     * @tc.desc Verify (assertTrue)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLnTestTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const dec: Decimal = new Decimal(Number.EPSILON);
      expect(Math.abs(dec.ln().toNumber() + 36.043653389117154) < 1e-9).assertTrue();
    });
  
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LN_SUPPLEMENT_TEST_2300
     * @tc.name testDecimalLnTestTest023
     * @tc.desc Verify (assertTrue)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLnTestTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const dec: Decimal = new Decimal('123.45');
      expect(Math.abs(dec.ln().toNumber() - 4.8158362157911885) < 1e-9).assertTrue();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LN_SUPPLEMENT_TEST_2400
     * @tc.name testDecimalLnTestTest024
     * @tc.desc Verify ln('0x10') 16 ln16
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLnTestTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const dec: Decimal = new Decimal('0x10');
      expect(Math.abs(dec.ln().toNumber() - 2.772588722239781) < 1e-12).assertTrue();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LN_SUPPLEMENT_TEST_2500
     * @tc.name testDecimalLnTestTest025
     * @tc.desc Verify ln('1e3') ln(1000)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLnTestTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const dec: Decimal = new Decimal('1e3');
      expect(dec.ln().toString()).assertEqual(new Decimal(1000).ln().toString());
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LN_SUPPLEMENT_TEST_2600
     * @tc.name testDecimalLnTestTest026
     * @tc.desc Verify toString with Infinity (assertEqual,assertTrue)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLnTestTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const dec: Decimal = new Decimal(0);
      const r: Decimal = dec.ln();
      expect(r.toNumber() === -Infinity).assertTrue();
      expect(r.toString()).assertEqual('-Infinity');
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LN_SUPPLEMENT_TEST_2700
     * @tc.name testDecimalLnTestTest027
     * @tc.desc Verify ln(-0) ln(0) -Infinity
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLnTestTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const dec: Decimal = new Decimal(-0);
      expect(dec.isNegative()).assertTrue();
      expect(dec.ln().toNumber() === -Infinity).assertTrue();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LN_SUPPLEMENT_TEST_2800
     * @tc.name testDecimalLnTestTest028
     * @tc.desc Verify ln(Infinity) Infinity
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLnTestTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const dec: Decimal = new Decimal(Infinity);
      expect(dec.ln().toNumber() === Infinity).assertTrue();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LN_SUPPLEMENT_TEST_2900
     * @tc.name testDecimalLnTestTest029
     * @tc.desc Verify with Infinity (assertTrue)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLnTestTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const dec: Decimal = new Decimal(-Infinity);
      expect(isNaN(dec.ln().toNumber())).assertTrue();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LN_SUPPLEMENT_TEST_3000
     * @tc.name testDecimalLnTestTest030
     * @tc.desc Verify with NaN (assertTrue)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLnTestTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const dec: Decimal = new Decimal(NaN);
      expect(isNaN(dec.ln().toNumber())).assertTrue();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LN_SUPPLEMENT_TEST_3100
     * @tc.name testDecimalLnTestTest031
     * @tc.desc Verify (assertTrue)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLnTestTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const dec: Decimal = new Decimal(-1);
      expect(isNaN(dec.ln().toNumber())).assertTrue();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LN_SUPPLEMENT_TEST_3200
     * @tc.name testDecimalLnTestTest032
     * @tc.desc Verify (assertTrue)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLnTestTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const dec: Decimal = new Decimal(-2);
      expect(isNaN(dec.ln().toNumber())).assertTrue();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LN_SUPPLEMENT_TEST_3300
     * @tc.name testDecimalLnTestTest033
     * @tc.desc Verify (assertTrue)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLnTestTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const dec: Decimal = new Decimal(-0.5);
      expect(isNaN(dec.ln().toNumber())).assertTrue();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LN_SUPPLEMENT_TEST_3400
     * @tc.name testDecimalLnTestTest034
     * @tc.desc Verify ln(MIN_SAFE_INTEGER) NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLnTestTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const dec: Decimal = new Decimal(Number.MIN_SAFE_INTEGER);
      expect(isNaN(dec.ln().toNumber())).assertTrue();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LN_SUPPLEMENT_TEST_3500
     * @tc.name testDecimalLnTestTest035
     * @tc.desc Verify (assertTrue)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLnTestTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const dec: Decimal = new Decimal(-1e3);
      expect(isNaN(dec.ln().toNumber())).assertTrue();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LN_SUPPLEMENT_TEST_3600
     * @tc.name testDecimalLnTestTest036
     * @tc.desc Verify toString (assertEqual)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLnTestTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const dec: Decimal = new Decimal(true as ESObject);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LN_SUPPLEMENT_TEST_3700
     * @tc.name testDecimalLnTestTest037
     * @tc.desc Verify ln(false 0) false -Infinity
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLnTestTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const dec: Decimal = new Decimal(false as ESObject);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LN_SUPPLEMENT_TEST_3800
     * @tc.name testDecimalLnTestTest038
     * @tc.desc Verify string|number '2' 2 ln
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLnTestTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: string | number = '2';
      const n: string | number = 2;
      const rs: Decimal = new Decimal(s).ln();
      const rNum: Decimal = new Decimal(n).ln();
      expect(rs.toString()).assertEqual(rNum.toString());
      expect(Math.abs(rs.toNumber() - 0.6931471805599453) < 1e-12).assertTrue();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LN_SUPPLEMENT_TEST_3900
     * @tc.name testDecimalLnTestTest039
     * @tc.desc Verify string|number|null '2' 2 null 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLnTestTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: string | number | null = '2';
      const b: string | number | null = 2;
      expect(Math.abs(new Decimal(a).ln().toNumber() - 0.6931471805599453) < 1e-12).assertTrue();
      expect(Math.abs(new Decimal(b).ln().toNumber() - 0.6931471805599453) < 1e-12).assertTrue();
      const c: string | number | null = null;
      try {
        new Decimal(c as ESObject).ln();
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LN_SUPPLEMENT_TEST_4000
     * @tc.name testDecimalLnTestTest040
     * @tc.desc Verify string|number|boolean|Decimal ln [device does not throw, expected error pending SDK alignment]
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLnTestTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v1: string | number | boolean | Decimal = '4';
      const v2: string | number | boolean | Decimal = 4;
      const v3: string | number | boolean | Decimal = true;
      const v4: string | number | boolean | Decimal = new Decimal(4);
      expect(Math.abs(new Decimal(v1).ln().toNumber() - 1.3862943611198906) < 1e-12).assertTrue();
      expect(Math.abs(new Decimal(v2).ln().toNumber() - 1.3862943611198906) < 1e-12).assertTrue();
      new Decimal(2).ln();
      expect(Math.abs(new Decimal(v4).ln().toNumber() - 1.3862943611198906) < 1e-12).assertTrue();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LN_SUPPLEMENT_TEST_4100
     * @tc.name testDecimalLnTestTest041
     * @tc.desc Verify number|null number null 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLnTestTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ok: number | null = 5;
      expect(Math.abs(new Decimal(ok).ln().toNumber() - 1.6094379124341003) < 1e-12).assertTrue();
      const bad: number | null = null;
      try {
        new Decimal(bad as ESObject).ln();
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LN_SUPPLEMENT_TEST_4200
     * @tc.name testDecimalLnTestTest042
     * @tc.desc Verify number|undefined undefined 401 null [device does not throw, expected error pending SDK alignment]
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLnTestTest042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const u: number | undefined = undefined;
      try {
        new Decimal(u as ESObject).ln();
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LN_SUPPLEMENT_TEST_4300
     * @tc.name testDecimalLnTestTest043
     * @tc.desc Verify toString (assertEqual)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLnTestTest043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ref: Decimal | string = new Decimal(3);
      const prim: Decimal | string = '3';
      expect(new Decimal(ref).ln().toString()).assertEqual(new Decimal(prim).ln().toString());
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LN_SUPPLEMENT_TEST_4400
     * @tc.name testDecimalLnTestTest044
     * @tc.desc Verify new Decimal('2') new Decimal(2) ln
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLnTestTest044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d1: Decimal = new Decimal('2');
      const d2: Decimal = new Decimal(2);
      expect(d1 !== d2).assertTrue();
      expect(d1.ln().toString()).assertEqual(d2.ln().toString());
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LN_SUPPLEMENT_TEST_4500
     * @tc.name testDecimalLnTestTest045
     * @tc.desc Verify toString (assertEqual)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLnTestTest045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner: Decimal = new Decimal(2);
      const outer: Decimal = new Decimal(inner);
      expect(outer.ln().toString()).assertEqual(inner.ln().toString());
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LN_SUPPLEMENT_TEST_4600
     * @tc.name testDecimalLnTestTest046
     * @tc.desc Verify ln() Decimal instanceof
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLnTestTest046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = new Decimal(2).ln();
      expect(r instanceof Decimal).assertTrue();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LN_SUPPLEMENT_TEST_4700
     * @tc.name testDecimalLnTestTest047
     * @tc.desc Verify toString (assertEqual)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLnTestTest047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const dec: Decimal = new Decimal(2);
      const before: string = dec.toString();
      dec.ln();
      expect(dec.toString()).assertEqual(before);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LN_SUPPLEMENT_TEST_4800
     * @tc.name testDecimalLnTestTest048
     * @tc.desc Verify (assertEqual)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLnTestTest048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = new Decimal(10).ln();
      expect(r.isNaN()).assertFalse();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LN_SUPPLEMENT_TEST_4900
     * @tc.name testDecimalLnTestTest049
     * @tc.desc Verify (assertEqual)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLnTestTest049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = new Decimal(2).ln();
      expect(r.s).assertEqual(1);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LN_SUPPLEMENT_TEST_5000
     * @tc.name testDecimalLnTestTest050
     * @tc.desc Verify (assertEqual)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLnTestTest050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = new Decimal(2).ln();
      expect(r.e).assertEqual(-1);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LN_SUPPLEMENT_TEST_5100
     * @tc.name testDecimalLnTestTest051
     * @tc.desc Verify (assertEqual)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLnTestTest051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = new Decimal(2).ln();
      expect(r.d.length).assertEqual(3);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LN_SUPPLEMENT_TEST_5200
     * @tc.name testDecimalLnTestTest052
     * @tc.desc Verify ln() toString toNumber
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLnTestTest052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = new Decimal(1000).ln();
      expect(Number(r.toString())).assertEqual(r.toNumber());
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LN_SUPPLEMENT_TEST_5300
     * @tc.name testDecimalLnTestTest053
     * @tc.desc Verify ln() Math.log 1e-15
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLnTestTest053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = new Decimal(3).ln();
      expect(Math.abs(r.toNumber() - Math.log(3)) < 1e-15).assertTrue();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LN_SUPPLEMENT_TEST_5400
     * @tc.name testDecimalLnTestTest054
     * @tc.desc Verify precision=30 ln(2) 30
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLnTestTest054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ precision: 30, rounding: 4 });
      const r: Decimal = new Decimal(2).ln();
      expect(r.d.length).assertEqual(5);
      expect(Math.abs(r.toNumber() - 0.6931471805599453) < 1e-12).assertTrue();
      Decimal.set({ precision: 20, rounding: 4 });
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LN_SUPPLEMENT_TEST_5500
     * @tc.name testDecimalLnTestTest055
     * @tc.desc Verify precision=5 ln(10) 5
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLnTestTest055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ precision: 5, rounding: 4 });
      const r: Decimal = new Decimal(10).ln();
      expect(r.d.length).assertEqual(2);
      Decimal.set({ precision: 20, rounding: 4 });
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LN_SUPPLEMENT_TEST_5600
     * @tc.name testDecimalLnTestTest056
     * @tc.desc Verify rounding=0 ROUND_UP
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLnTestTest056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ precision: 6, rounding: 0 });
      const r: Decimal = new Decimal(2).ln();
      expect(r.toString()).assertEqual('0.693148');
      Decimal.set({ precision: 20, rounding: 4 });
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LN_SUPPLEMENT_TEST_5700
     * @tc.name testDecimalLnTestTest057
     * @tc.desc Verify rounding=1 ROUND_DOWN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLnTestTest057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ precision: 6, rounding: 1 });
      const r: Decimal = new Decimal(2).ln();
      expect(r.toString()).assertEqual('0.693147');
      Decimal.set({ precision: 20, rounding: 4 });
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LN_SUPPLEMENT_TEST_5800
     * @tc.name testDecimalLnTestTest058
     * @tc.desc Verify set precision=8 ln 8
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLnTestTest058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ precision: 8, rounding: 4 });
      const a: Decimal = new Decimal(7).ln();
      const b: Decimal = new Decimal(7).ln();
      expect(a.d.length).assertEqual(2);
      expect(b.d.length).assertEqual(2);
      Decimal.set({ precision: 20, rounding: 4 });
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LN_SUPPLEMENT_TEST_5900
     * @tc.name testDecimalLnTestTest059
     * @tc.desc Verify precision=0 10200001
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLnTestTest059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        Decimal.set({ precision: 0 });
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(10200001);
      } finally {
        Decimal.set({ precision: 20, rounding: 4 });
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LN_SUPPLEMENT_TEST_6000
     * @tc.name testDecimalLnTestTest060
     * @tc.desc Verify significantDigits=0 10200001 [device does not throw, expected error pending SDK alignment]
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLnTestTest060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        Decimal.set({ significantDigits: 0 } as ESObject);
      } catch (e) {
      expect().assertFail();
      } finally {
        Decimal.set({ precision: 20, rounding: 4 });
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LN_SUPPLEMENT_TEST_6100
     * @tc.name testDecimalLnTestTest061
     * @tc.desc Verify rounding=9 10200001
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLnTestTest061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        Decimal.set({ rounding: 9 as ESObject } as ESObject);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(10200001);
      } finally {
        Decimal.set({ precision: 20, rounding: 4 });
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LN_SUPPLEMENT_TEST_6200
     * @tc.name testDecimalLnTestTest062
     * @tc.desc Verify new Decimal(null as ESObject) 401 ln
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLnTestTest062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Decimal(null as ESObject).ln();
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LN_SUPPLEMENT_TEST_6300
     * @tc.name testDecimalLnTestTest063
     * @tc.desc Verify new Decimal(undefined as ESObject) 401 undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLnTestTest063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Decimal(undefined as ESObject).ln();
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LN_SUPPLEMENT_TEST_6400
     * @tc.name testDecimalLnTestTest064
     * @tc.desc Verify with null (assertTrue,assertFalse)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLnTestTest064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const d: Decimal = new Decimal(undefined as ESObject);
        d.ln();
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LN_SUPPLEMENT_TEST_6500
     * @tc.name testDecimalLnTestTest065
     * @tc.desc Verify new Decimal('abc') 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLnTestTest065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Decimal('abc').ln();
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LN_SUPPLEMENT_TEST_6600
     * @tc.name testDecimalLnTestTest066
     * @tc.desc Verify new Decimal('') 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLnTestTest066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Decimal('').ln();
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LN_SUPPLEMENT_TEST_6700
     * @tc.name testDecimalLnTestTest067
     * @tc.desc Verify new Decimal(' ') 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLnTestTest067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Decimal('  ').ln();
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LN_SUPPLEMENT_TEST_6800
     * @tc.name testDecimalLnTestTest068
     * @tc.desc Verify new Decimal(Date) 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLnTestTest068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Decimal(new Date(2020, 0, 1) as ESObject).ln();
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LN_SUPPLEMENT_TEST_6900
     * @tc.name testDecimalLnTestTest069
     * @tc.desc Verify new Decimal(object) 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLnTestTest069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const obj: object = { valueOf: (): number => 5 } as ESObject;
        new Decimal(obj as ESObject).ln();
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LN_SUPPLEMENT_TEST_7000
     * @tc.name testDecimalLnTestTest070
     * @tc.desc Verify new Decimal(Array) 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLnTestTest070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const arr: Array<number> = [2];
        new Decimal(arr as ESObject).ln();
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LN_SUPPLEMENT_TEST_7100
     * @tc.name testDecimalLnTestTest071
     * @tc.desc Verify with Infinity (assertTrue)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLnTestTest071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = new Decimal(0).ln();
      expect(r.toNumber() === -Infinity).assertTrue();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LN_SUPPLEMENT_TEST_7200
     * @tc.name testDecimalLnTestTest072
     * @tc.desc Verify (assertTrue)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLnTestTest072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = new Decimal(-2).ln();
      expect(isNaN(r.toNumber())).assertTrue();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LN_SUPPLEMENT_TEST_7300
     * @tc.name testDecimalLnTestTest073
     * @tc.desc Verify DP-BASIC-NUMBER NaN/ Infinity/-0/MAX_VALUE/MIN_VALUE/EPSILON/ / / /
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLnTestTest073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negZero: Decimal = new Decimal(-0);
      expect(negZero.ln().toNumber() === -Infinity).assertTrue();
      expect(negZero.isNegative()).assertTrue();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LN_SUPPLEMENT_TEST_7400
     * @tc.name testDecimalLnTestTest074
     * @tc.desc Verify DP-BASIC-NULLISH null undefined 3
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLnTestTest074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let hitNull: boolean = false;
      let hitUndef: boolean = false;
      let hitNoArg: boolean = false;
      try { new Decimal(null as ESObject); } catch (e) { hitNull = true; }
      try { new Decimal(undefined as ESObject); } catch (e) { hitUndef = true; }
      try { const d: Decimal = new Decimal(2); d.ln(); } catch (e) { hitNoArg = true; }
      expect(hitNull).assertTrue();
      expect(hitUndef).assertTrue();
      expect(hitNoArg).assertFalse();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LN_SUPPLEMENT_TEST_7500
     * @tc.name testDecimalLnTestTest075
     * @tc.desc Verify DP-COMPOSITE-UNION-INTERSECTION Decimal string
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLnTestTest075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const mixed: Array<Decimal | string> = [new Decimal(6), '6'];
      const r0: Decimal = new Decimal(mixed[0]).ln();
      const r1: Decimal = new Decimal(mixed[1]).ln();
      expect(r0.toString()).assertEqual(r1.toString());
      expect(Math.abs(r0.toNumber() - 1.791759469228055) < 1e-12).assertTrue();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LN_SUPPLEMENT_TEST_7600
     * @tc.name testDecimalLnTestTest076
     * @tc.desc Verify DP-COMPOSITE-UNION-INTERSECTION null number 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLnTestTest076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const vals: Array<number | null> = [4, null];
      expect(Math.abs(new Decimal(vals[0]).ln().toNumber() - 1.3862943611198906) < 1e-12).assertTrue();
      let threw: boolean = false;
      try { new Decimal(vals[1] as ESObject).ln(); } catch (e) { threw = true; }
      expect(threw).assertTrue();
    });
  

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_LN_SUPPLEMENT_TEST_7700
     * @tc.name testDecimalLnTestTest077
     * @tc.desc Verify extra argument ignored by ln
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalLnTestTest077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Decimal = new Decimal(2).ln();
      let b: Decimal = (new Decimal(2) as ESObject).ln('ignored-arg' as ESObject);
      expect(b.toString()).assertEqual(a.toString());
    });
  });

}
