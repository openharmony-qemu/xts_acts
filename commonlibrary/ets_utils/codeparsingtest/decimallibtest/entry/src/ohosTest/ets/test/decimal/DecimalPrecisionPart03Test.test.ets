
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

export default function decimalPrecisionPart03TestTest() {
  describe('DecimalPrecisionPart03TestTest', () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PRECISION_PART03_SUPPLEMENT_TEST_0100
     * @tc.name testDecimalPrecisionPart03TestTest001
     * @tc.desc Verify (assertEqual)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPrecisionPart03TestTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
  
      let x: Decimal = new Decimal('987000');
      let r0: number = x.precision();
      let r1: number = x.precision(true);
      expect(r0).assertEqual(3);
      expect(r1).assertEqual(6);
    });
  
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PRECISION_PART03_SUPPLEMENT_TEST_0200
     * @tc.name testDecimalPrecisionPart03TestTest002
     * @tc.desc Verify 1 2 includeZeros=true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPrecisionPart03TestTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
  
      let x: Decimal = new Decimal('987000');
      let r: number = x.precision(true);
      expect(r).assertEqual(6);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PRECISION_PART03_SUPPLEMENT_TEST_0300
     * @tc.name testDecimalPrecisionPart03TestTest003
     * @tc.desc Verify false '987000' false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPrecisionPart03TestTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
  
      let x: Decimal = new Decimal('987000');
      expect(x.precision()).assertEqual(x.precision(false));
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PRECISION_PART03_SUPPLEMENT_TEST_0400
     * @tc.name testDecimalPrecisionPart03TestTest004
     * @tc.desc Verify (assertEqual)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPrecisionPart03TestTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
  
      let x: Decimal = new Decimal('987000');
      expect(x.precision(true)).assertEqual(x.precision(1));
      expect(x.precision(true)).assertEqual(6);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PRECISION_PART03_SUPPLEMENT_TEST_0500
     * @tc.name testDecimalPrecisionPart03TestTest005
     * @tc.desc Verify (assertEqual)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPrecisionPart03TestTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
  
      let x: Decimal = new Decimal('987000');
      expect(x.precision(1.0)).assertEqual(x.precision(1));
      expect(x.precision(1.0)).assertEqual(6);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PRECISION_PART03_SUPPLEMENT_TEST_0600
     * @tc.name testDecimalPrecisionPart03TestTest006
     * @tc.desc Verify (assertEqual)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPrecisionPart03TestTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
  
      let x: Decimal = new Decimal('120');
      expect(x.precision()).assertEqual(x.precision(0));
      expect(x.precision()).assertEqual(2);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PRECISION_PART03_SUPPLEMENT_TEST_0700
     * @tc.name testDecimalPrecisionPart03TestTest007
     * @tc.desc Verify true '12300' 3 true 5
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPrecisionPart03TestTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
  
      let x: Decimal = new Decimal('12300');
      let r0: number = x.precision();
      let r1: number = x.precision(true);
      expect(r0).assertEqual(3);
      expect(r1).assertEqual(5);
    });
  
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PRECISION_PART03_SUPPLEMENT_TEST_0800
     * @tc.name testDecimalPrecisionPart03TestTest008
     * @tc.desc Verify (assertEqual)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPrecisionPart03TestTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
  
      let a: Decimal = new Decimal(123.45);
      let b: Decimal = new Decimal('123.45');
      expect(a.precision()).assertEqual(b.precision());
      expect(a.precision(true)).assertEqual(b.precision(true));
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PRECISION_PART03_SUPPLEMENT_TEST_0900
     * @tc.name testDecimalPrecisionPart03TestTest009
     * @tc.desc Verify (assertEqual)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPrecisionPart03TestTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
  
      let x: Decimal = new Decimal('12300');
      let s1: number = x.precision(true);
      let s2: number = x.precision(false);
      let s3: number = x.precision(true);
      expect(s1).assertEqual(5);
      expect(s2).assertEqual(3);
      expect(s3).assertEqual(s1);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PRECISION_PART03_SUPPLEMENT_TEST_1000
     * @tc.name testDecimalPrecisionPart03TestTest010
     * @tc.desc Verify false false '0.00123' 3
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPrecisionPart03TestTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
  
      let x: Decimal = new Decimal('0.00123');
      expect(x.precision()).assertEqual(x.precision(false));
      expect(x.precision()).assertEqual(3);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PRECISION_PART03_SUPPLEMENT_TEST_1100
     * @tc.name testDecimalPrecisionPart03TestTest011
     * @tc.desc Verify (assertEqual)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPrecisionPart03TestTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
  
      let x: Decimal = new Decimal(-1500);
      expect(x.precision()).assertEqual(x.precision(0));
      expect(x.precision()).assertEqual(2);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PRECISION_PART03_SUPPLEMENT_TEST_1200
     * @tc.name testDecimalPrecisionPart03TestTest012
     * @tc.desc Verify with undefined (assertEqual)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPrecisionPart03TestTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
  
      let x: Decimal = new Decimal('987000');
      expect(x.precision(undefined as ESObject)).assertEqual(x.precision());
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PRECISION_PART03_SUPPLEMENT_TEST_1300
     * @tc.name testDecimalPrecisionPart03TestTest013
     * @tc.desc Verify with undefined (assertEqual)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPrecisionPart03TestTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
  
      let x: Decimal = new Decimal('987000');
      expect(x.precision(undefined as ESObject)).assertEqual(x.precision(false));
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PRECISION_PART03_SUPPLEMENT_TEST_1400
     * @tc.name testDecimalPrecisionPart03TestTest014
     * @tc.desc Verify (assertEqual)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPrecisionPart03TestTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
  
      let x: Decimal = new Decimal('1.5');
      let r0: number = x.precision();
      let rf: number = x.precision(false);
      let r0n: number = x.precision(0);
      expect(r0).assertEqual(rf);
      expect(r0).assertEqual(r0n);
      expect(r0).assertEqual(2);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PRECISION_PART03_SUPPLEMENT_TEST_1500
     * @tc.name testDecimalPrecisionPart03TestTest015
     * @tc.desc Verify (assertEqual)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPrecisionPart03TestTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
  
      let x: Decimal = new Decimal('5e3');
      let r0: number = x.precision();
      let rf: number = x.precision(false);
      let r0n: number = x.precision(0);
      expect(r0).assertEqual(1);
      expect(rf).assertEqual(1);
      expect(r0n).assertEqual(1);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PRECISION_PART03_SUPPLEMENT_TEST_1600
     * @tc.name testDecimalPrecisionPart03TestTest016
     * @tc.desc Verify (assertEqual)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPrecisionPart03TestTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
  
      let x: Decimal = new Decimal('0');
      let r0: number = x.precision();
      let rf: number = x.precision(false);
      let r0n: number = x.precision(0);
      expect(r0).assertEqual(1);
      expect(rf).assertEqual(1);
      expect(r0n).assertEqual(1);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PRECISION_PART03_SUPPLEMENT_TEST_1700
     * @tc.name testDecimalPrecisionPart03TestTest017
     * @tc.desc Verify (assertEqual)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPrecisionPart03TestTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
  
      let a: Decimal = new Decimal('5e3');
      let b: Decimal = new Decimal('5e3');
      let ra: number = a.precision();
      let rb: number = b.precision();
      let raf: number = a.precision(false);
      let rbf: number = b.precision(false);
      expect(ra).assertEqual(rb);
      expect(raf).assertEqual(rbf);
      expect(ra).assertEqual(1);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PRECISION_PART03_SUPPLEMENT_TEST_1800
     * @tc.name testDecimalPrecisionPart03TestTest018
     * @tc.desc Verify (assertEqual)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPrecisionPart03TestTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
  
      let x: Decimal = new Decimal(0);
      expect(x.precision()).assertEqual(1);
      expect(x.precision(true)).assertEqual(1);
      expect(x.precision(false)).assertEqual(1);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PRECISION_PART03_SUPPLEMENT_TEST_1900
     * @tc.name testDecimalPrecisionPart03TestTest019
     * @tc.desc Verify precision(null) 10200001 null boolean/0/1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPrecisionPart03TestTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
  
      let x: Decimal = new Decimal('987000');
      try {
        x.precision(null as ESObject);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(10200001);
      };
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PRECISION_PART03_SUPPLEMENT_TEST_2000
     * @tc.name testDecimalPrecisionPart03TestTest020
     * @tc.desc Verify precision(undefined) false 3
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPrecisionPart03TestTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
  
      let x: Decimal = new Decimal('987000');
      let r: number = x.precision(undefined as ESObject);
      expect(r).assertEqual(3);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PRECISION_PART03_SUPPLEMENT_TEST_2100
     * @tc.name testDecimalPrecisionPart03TestTest021
     * @tc.desc Verify with undefined (assertEqual)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPrecisionPart03TestTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
  
      let x: Decimal = new Decimal('987000');
      let rNoArg: number = x.precision();
      let rUndefined: number = x.precision(undefined as ESObject);
      expect(rNoArg).assertEqual(rUndefined);
      expect(rNoArg).assertEqual(3);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PRECISION_PART03_SUPPLEMENT_TEST_2200
     * @tc.name testDecimalPrecisionPart03TestTest022
     * @tc.desc Verify null undefined nullish
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPrecisionPart03TestTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
  
      let x: Decimal = new Decimal('987000');
      let undefinedResult: number = x.precision(undefined as ESObject);
      let nullThrew: boolean = false;
      try {
        x.precision(null as ESObject);
      } catch (e) {
        nullThrew = true;
        expect((e as BusinessError).code).assertEqual(10200001);
      }
      expect(undefinedResult).assertEqual(3);
      expect(nullThrew).assertTrue();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PRECISION_PART03_SUPPLEMENT_TEST_2300
     * @tc.name testDecimalPrecisionPart03TestTest023
     * @tc.desc Verify with null (assertEqual,assertFalse)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPrecisionPart03TestTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
  
      let x: Decimal = new Decimal('987000');
      try {
        x.precision(null as ESObject);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(10200001);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PRECISION_PART03_SUPPLEMENT_TEST_2400
     * @tc.name testDecimalPrecisionPart03TestTest024
     * @tc.desc Verify false null boolean nullish
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPrecisionPart03TestTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
  
      let x: Decimal = new Decimal('987000');
      let rf: number = x.precision(false);
      let nullThrew: boolean = false;
      try {
        x.precision(null as ESObject);
      } catch (e) {
        nullThrew = true;
        expect((e as BusinessError).code).assertEqual(10200001);
      }
      expect(rf).assertEqual(3);
      expect(nullThrew).assertTrue();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PRECISION_PART03_SUPPLEMENT_TEST_2500
     * @tc.name testDecimalPrecisionPart03TestTest025
     * @tc.desc Verify with null (assertEqual,assertFalse)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPrecisionPart03TestTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
  
      let x: Decimal = new Decimal('987000');
      try {
        x.precision(null as ESObject);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(10200001);
      }
      expect(x.precision()).assertEqual(3);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PRECISION_PART03_SUPPLEMENT_TEST_2600
     * @tc.name testDecimalPrecisionPart03TestTest026
     * @tc.desc Verify precision(undefined) '987000' 3
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPrecisionPart03TestTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
  
      let x: Decimal = new Decimal('987000');
      let rU: number = x.precision(undefined as ESObject);
      let rD: number = x.precision();
      expect(rU).assertEqual(rD);
      expect(rU).assertEqual(3);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PRECISION_PART03_SUPPLEMENT_TEST_2700
     * @tc.name testDecimalPrecisionPart03TestTest027
     * @tc.desc Verify precision(null) toString
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPrecisionPart03TestTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
  
      let x: Decimal = new Decimal('987000');
      let before: string = x.toString();
      try {
        x.precision(null as ESObject);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(10200001);
      }
      expect(x.toString()).assertEqual(before);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PRECISION_PART03_SUPPLEMENT_TEST_2800
     * @tc.name testDecimalPrecisionPart03TestTest028
     * @tc.desc Verify with null (assertEqual,assertFalse)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPrecisionPart03TestTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
  
      let x: Decimal = new Decimal(-1500);
      let signBefore: number = x.s;
      try {
        x.precision(null as ESObject);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(10200001);
      }
      expect(x.s).assertEqual(signBefore);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PRECISION_PART03_SUPPLEMENT_TEST_2900
     * @tc.name testDecimalPrecisionPart03TestTest029
     * @tc.desc Verify with null (assertEqual,assertFalse)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPrecisionPart03TestTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
  
      let x: Decimal = new Decimal('12300');
      let expBefore: number = x.e;
      try {
        x.precision(null as ESObject);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(10200001);
      }
      expect(x.e).assertEqual(expBefore);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PRECISION_PART03_SUPPLEMENT_TEST_3000
     * @tc.name testDecimalPrecisionPart03TestTest030
     * @tc.desc Verify digits d '0.00123' 3
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPrecisionPart03TestTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
  
      let x: Decimal = new Decimal('0.00123');
      let lenBefore: number = x.d.length;
      try {
        x.precision(null as ESObject);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(10200001);
      }
      expect(x.d.length).assertEqual(lenBefore);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PRECISION_PART03_SUPPLEMENT_TEST_3100
     * @tc.name testDecimalPrecisionPart03TestTest031
     * @tc.desc Verify with null (assertEqual,assertTrue)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPrecisionPart03TestTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
  
      let x: Decimal = new Decimal('987000');
      try {
        x.precision(null as ESObject);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(10200001);
      }
      expect(x === x).assertTrue();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PRECISION_PART03_SUPPLEMENT_TEST_3200
     * @tc.name testDecimalPrecisionPart03TestTest032
     * @tc.desc Verify with null (assertEqual,assertFalse)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPrecisionPart03TestTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
  
      let x: Decimal = new Decimal('987000');
      try {
        x.precision(null as ESObject);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(10200001);
      }
      expect(x.precision(true)).assertEqual(6);
    });
  
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PRECISION_PART03_SUPPLEMENT_TEST_3300
     * @tc.name testDecimalPrecisionPart03TestTest033
     * @tc.desc Verify with null (assertEqual)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPrecisionPart03TestTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
  
      let x: Decimal = new Decimal('987000');
      let firstCode: number = 0;
      try {
        x.precision(null as ESObject);
      } catch (e) {
        firstCode = (e as BusinessError).code;
      }
      let secondCode: number = 0;
      try {
        x.precision(null as ESObject);
      } catch (e) {
        secondCode = (e as BusinessError).code;
      }
      expect(firstCode).assertEqual(10200001);
      expect(secondCode).assertEqual(10200001);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PRECISION_PART03_SUPPLEMENT_TEST_3400
     * @tc.name testDecimalPrecisionPart03TestTest034
     * @tc.desc Verify with null (assertEqual,assertFalse)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPrecisionPart03TestTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
  
      let a: Decimal = new Decimal('987000');
      let b: Decimal = new Decimal('123.456');
      try {
        a.precision(null as ESObject);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(10200001);
      }
      expect(b.precision()).assertEqual(6);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PRECISION_PART03_SUPPLEMENT_TEST_3500
     * @tc.name testDecimalPrecisionPart03TestTest035
     * @tc.desc Verify toString with null (assertEqual,assertFalse)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPrecisionPart03TestTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
  
      let x: Decimal = new Decimal('987000');
      try {
        x.precision(null as ESObject);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(10200001);
      }
      let sum: Decimal = x.add(1000);
      expect(sum.toString()).assertEqual('988000');
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PRECISION_PART03_SUPPLEMENT_TEST_3600
     * @tc.name testDecimalPrecisionPart03TestTest036
     * @tc.desc Verify d '987000' digits 9,8,7
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPrecisionPart03TestTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
  
      let x: Decimal = new Decimal('987000');
      try {
        x.precision(null as ESObject);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(10200001);
      }
      expect(x.d[0]).assertEqual(987000);
      expect(x.d[2]).assertEqual(undefined);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PRECISION_PART03_SUPPLEMENT_TEST_3700
     * @tc.name testDecimalPrecisionPart03TestTest037
     * @tc.desc Verify precision() digits '123.456' 6
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPrecisionPart03TestTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
  
      let x: Decimal = new Decimal('123.456');
      let sd: number = x.precision();
            expect(sd).assertEqual(6);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PRECISION_PART03_SUPPLEMENT_TEST_3800
     * @tc.name testDecimalPrecisionPart03TestTest038
     * @tc.desc Verify precision() d '0.00123' 3
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPrecisionPart03TestTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
  
      let x: Decimal = new Decimal('0.00123');
      expect(x.precision()).assertEqual(3);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PRECISION_PART03_SUPPLEMENT_TEST_3900
     * @tc.name testDecimalPrecisionPart03TestTest039
     * @tc.desc Verify (assertEqual)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPrecisionPart03TestTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
  
      let x: Decimal = new Decimal('10500');
      expect(x.precision(false)).assertEqual(3);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PRECISION_PART03_SUPPLEMENT_TEST_4000
     * @tc.name testDecimalPrecisionPart03TestTest040
     * @tc.desc Verify precision() '987000' d 3
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPrecisionPart03TestTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
  
      let x: Decimal = new Decimal('987000');
      let sd: number = x.precision();
            expect(x.d.length).assertEqual(1);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PRECISION_PART03_SUPPLEMENT_TEST_4100
     * @tc.name testDecimalPrecisionPart03TestTest041
     * @tc.desc Verify precision(true) d '987000' 3+3=6
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPrecisionPart03TestTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
  
      let x: Decimal = new Decimal('987000');
      let trailingZeros: number = 3;
      expect(x.precision(true)).assertEqual(6);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PRECISION_PART03_SUPPLEMENT_TEST_4200
     * @tc.name testDecimalPrecisionPart03TestTest042
     * @tc.desc Verify e '123.456' e 2 e+1=3 precision 6
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPrecisionPart03TestTest042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
  
      let x: Decimal = new Decimal('123.456');
      let intDigits: number = x.e + 1;
      let sd: number = x.precision();
      expect(intDigits).assertEqual(3);
      expect(sd).assertEqual(6);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PRECISION_PART03_SUPPLEMENT_TEST_4300
     * @tc.name testDecimalPrecisionPart03TestTest043
     * @tc.desc Verify (assertEqual)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPrecisionPart03TestTest043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
  
      let x: Decimal = new Decimal('987000');
      let t0: string = typeof x.precision();
      let t1: string = typeof x.precision(true);
      expect(t0).assertEqual('number');
      expect(t1).assertEqual('number');
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PRECISION_PART03_SUPPLEMENT_TEST_4400
     * @tc.name testDecimalPrecisionPart03TestTest044
     * @tc.desc Verify (assertTrue)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPrecisionPart03TestTest044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
  
      let x: Decimal = new Decimal('123.456');
      let r0: number = x.precision();
      let r1: number = x.precision(true);
      expect(Number.isInteger(r0)).assertTrue();
      expect(Number.isInteger(r1)).assertTrue();
      expect(r0 >= 0).assertTrue();
      expect(r1 >= 0).assertTrue();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PRECISION_PART03_SUPPLEMENT_TEST_4500
     * @tc.name testDecimalPrecisionPart03TestTest045
     * @tc.desc Verify precision(true) precision() '1.5' 2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPrecisionPart03TestTest045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
  
      let x: Decimal = new Decimal('1.5');
      expect(x.precision(true)).assertEqual(x.precision());
      expect(x.precision(true)).assertEqual(2);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PRECISION_PART03_SUPPLEMENT_TEST_4600
     * @tc.name testDecimalPrecisionPart03TestTest046
     * @tc.desc Verify precision(true) precision() '1200' 4 2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPrecisionPart03TestTest046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
  
      let x: Decimal = new Decimal('1200');
      let r0: number = x.precision();
      let r1: number = x.precision(true);
      expect(r1).assertEqual(4);
      expect(r0).assertEqual(2);
      expect(r1 > r0).assertTrue();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PRECISION_PART03_SUPPLEMENT_TEST_4700
     * @tc.name testDecimalPrecisionPart03TestTest047
     * @tc.desc Verify (assertEqual)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPrecisionPart03TestTest047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
  
      let pos: Decimal = new Decimal(1500);
      let neg: Decimal = new Decimal(-1500);
      expect(pos.s).assertEqual(1);
      expect(neg.s).assertEqual(-1);
      expect(pos.precision()).assertEqual(neg.precision());
      expect(pos.precision(true)).assertEqual(neg.precision(true));
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PRECISION_PART03_SUPPLEMENT_TEST_4800
     * @tc.name testDecimalPrecisionPart03TestTest048
     * @tc.desc Verify (assertEqual)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPrecisionPart03TestTest048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
  
      let x: Decimal = new Decimal(-0);
      expect(x.precision()).assertEqual(1);
      expect(x.precision(true)).assertEqual(1);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PRECISION_PART03_SUPPLEMENT_TEST_4900
     * @tc.name testDecimalPrecisionPart03TestTest049
     * @tc.desc Verify with NaN (assertTrue)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPrecisionPart03TestTest049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
  
      let x: Decimal = new Decimal(NaN);
      expect(Number.isNaN(x.precision())).assertTrue();
      expect(Number.isNaN(x.precision(true))).assertTrue();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PRECISION_PART03_SUPPLEMENT_TEST_5000
     * @tc.name testDecimalPrecisionPart03TestTest050
     * @tc.desc Verify (assertEqual)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPrecisionPart03TestTest050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
  
      let x: Decimal = new Decimal('1e-7');
      expect(x.precision()).assertEqual(1);
      expect(x.precision(true)).assertEqual(1);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PRECISION_PART03_SUPPLEMENT_TEST_5100
     * @tc.name testDecimalPrecisionPart03TestTest051
     * @tc.desc Verify '1.5e3' 1500 2 true 4
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPrecisionPart03TestTest051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
  
      let x: Decimal = new Decimal('1.5e3');
      expect(x.precision()).assertEqual(2);
      expect(x.precision(true)).assertEqual(4);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PRECISION_PART03_SUPPLEMENT_TEST_5200
     * @tc.name testDecimalPrecisionPart03TestTest052
     * @tc.desc Verify (assertEqual,assertFalse)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPrecisionPart03TestTest052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
  
      let a: Decimal = new Decimal('987000');
      let b: Decimal = new Decimal('987000');
      expect(a === b).assertFalse();
      expect(a.precision(true)).assertEqual(b.precision(true));
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PRECISION_PART03_SUPPLEMENT_TEST_5300
     * @tc.name testDecimalPrecisionPart03TestTest053
     * @tc.desc Verify (assertEqual)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPrecisionPart03TestTest053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
  
      let x: Decimal = new Decimal('987000');
      let r1: number = x.precision(true);
      let r2: number = x.precision(true);
      let r3: number = x.precision(true);
      expect(r1).assertEqual(6);
      expect(r2).assertEqual(r1);
      expect(r3).assertEqual(r1);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PRECISION_PART03_SUPPLEMENT_TEST_5400
     * @tc.name testDecimalPrecisionPart03TestTest054
     * @tc.desc Verify (assertTrue)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPrecisionPart03TestTest054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
  
      let x: Decimal = new Decimal('987000');
      let before: Decimal = x;
      x.precision();
      x.precision(true);
      expect(x === before).assertTrue();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PRECISION_PART03_SUPPLEMENT_TEST_5500
     * @tc.name testDecimalPrecisionPart03TestTest055
     * @tc.desc Verify (assertEqual,assertFalse)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPrecisionPart03TestTest055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
  
      let x: Decimal = new Decimal('1.23');
      let y: Decimal = x.add(1000);
      expect(y === x).assertFalse();
      expect(y.precision()).assertEqual(6);
      expect(x.precision()).assertEqual(3);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PRECISION_PART03_SUPPLEMENT_TEST_5600
     * @tc.name testDecimalPrecisionPart03TestTest056
     * @tc.desc Verify (assertEqual,assertFalse)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPrecisionPart03TestTest056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
  
      let a: Decimal = new Decimal('10500');
      let b: Decimal = new Decimal(a);
      expect(a === b).assertFalse();
      expect(b.precision()).assertEqual(a.precision());
      expect(b.precision(true)).assertEqual(a.precision(true));
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PRECISION_PART03_SUPPLEMENT_TEST_5700
     * @tc.name testDecimalPrecisionPart03TestTest057
     * @tc.desc Verify (assertEqual)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPrecisionPart03TestTest057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
  
      let x: Decimal = new Decimal('10500');
      let lenBefore: number = x.d.length;
      x.precision();
      x.precision(true);
      expect(x.d.length).assertEqual(lenBefore);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PRECISION_PART03_SUPPLEMENT_TEST_5800
     * @tc.name testDecimalPrecisionPart03TestTest058
     * @tc.desc Verify DecimalConfig.precision=5 precision()
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPrecisionPart03TestTest058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
  
      Decimal.set({ precision: 5 });
      let x: Decimal = new Decimal('123.456');
      let r: number = x.precision();
      Decimal.set({ defaults: true });
      expect(r).assertEqual(6);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PRECISION_PART03_SUPPLEMENT_TEST_5900
     * @tc.name testDecimalPrecisionPart03TestTest059
     * @tc.desc Verify set (assertEqual)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPrecisionPart03TestTest059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
  
      Decimal.set({ precision: 5 });
      let x: Decimal = new Decimal('12345.6789');
      let r0: number = x.precision();
      let r1: number = x.precision(true);
      Decimal.set({ defaults: true });
      expect(r0).assertEqual(9);
      expect(r1).assertEqual(9);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PRECISION_PART03_SUPPLEMENT_TEST_6000
     * @tc.name testDecimalPrecisionPart03TestTest060
     * @tc.desc Verify DP-BASIC-NULLISH - null 10200001 undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPrecisionPart03TestTest060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
  
      let x: Decimal = new Decimal('987000');
      let undefinedOk: boolean = true;
      try {
        x.precision(undefined as ESObject);
      } catch (e) {
        undefinedOk = false;
      }
      let nullThrows: boolean = false;
      try {
        x.precision(null as ESObject);
      } catch (e) {
        nullThrows = true;
        expect((e as BusinessError).code).assertEqual(10200001);
      }
      expect(undefinedOk).assertTrue();
      expect(nullThrows).assertTrue();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PRECISION_PART03_SUPPLEMENT_TEST_6100
     * @tc.name testDecimalPrecisionPart03TestTest061
     * @tc.desc Verify DP-RUNTIME-OPTIONAL-DEFAULT - /undefined/false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPrecisionPart03TestTest061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
  
      let x: Decimal = new Decimal('987000');
      let rDefault: number = x.precision();
      let rUndefined: number = x.precision(undefined as ESObject);
      let rFalse: number = x.precision(false);
      expect(rDefault).assertEqual(rUndefined);
      expect(rDefault).assertEqual(rFalse);
      expect(rDefault).assertEqual(3);
    });
  
  });

}
