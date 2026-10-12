
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

      function needArg(v: string | number | Decimal): Decimal {
        return new Decimal(v as ESObject).sqrt();
      }

      function withDefault(v: string | number | Decimal = 9): Decimal {
        return new Decimal(v as ESObject).sqrt();
      }

      function withDefault2(v: string | number | Decimal = 9): Decimal {
        return new Decimal(v as ESObject).sqrt();
      }

      function withDefault3(v: string | number | Decimal = 9): Decimal {
        return new Decimal(v as ESObject).sqrt();
      }

      function optionalArg(v?: string | number | Decimal): Decimal {
        return new Decimal(v as ESObject).sqrt();
      }

      function optionalArg2(v?: string | number | Decimal): Decimal {
        return new Decimal(v as ESObject).sqrt();
      }

      function withDecDefault(v: string | number | Decimal = new Decimal(49)): Decimal {
        return new Decimal(v as ESObject).sqrt();
      }


export default function decimalSqrtPart02TestTest() {
  describe('DecimalSqrtPart02TestTest', () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SQRT_PART02_SUPPLEMENT_TEST_0100
     * @tc.name testDecimalSqrtPart02TestTest001
     * @tc.desc Verify '4' sqrt '2'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalSqrtPart02TestTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: Decimal = new Decimal('4');
      let root: Decimal = dec.sqrt();
      expect(root.toString()).assertEqual('2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SQRT_PART02_SUPPLEMENT_TEST_0200
     * @tc.name testDecimalSqrtPart02TestTest002
     * @tc.desc Verify 9 sqrt '3'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalSqrtPart02TestTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: Decimal = new Decimal(9);
      let root: Decimal = dec.sqrt() as Decimal;
      expect(root.toString()).assertEqual('3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SQRT_PART02_SUPPLEMENT_TEST_0300
     * @tc.name testDecimalSqrtPart02TestTest003
     * @tc.desc Verify '25' sqrt '5'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalSqrtPart02TestTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: Decimal = new Decimal('25');
      let root: Decimal = dec.sqrt() as Decimal;
      expect(root.toString()).assertEqual('5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SQRT_PART02_SUPPLEMENT_TEST_0400
     * @tc.name testDecimalSqrtPart02TestTest004
     * @tc.desc Verify null Decimal 401 sqrt
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalSqrtPart02TestTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Decimal(null as ESObject);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SQRT_PART02_SUPPLEMENT_TEST_0500
     * @tc.name testDecimalSqrtPart02TestTest005
     * @tc.desc Verify null 401 null
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalSqrtPart02TestTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let n: string | null = null;
      try {
        new Decimal(n as ESObject);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SQRT_PART02_SUPPLEMENT_TEST_0600
     * @tc.name testDecimalSqrtPart02TestTest006
     * @tc.desc Verify undefined 401 undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalSqrtPart02TestTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let u: string | undefined = undefined;
      try {
        new Decimal(u as ESObject);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SQRT_PART02_SUPPLEMENT_TEST_0700
     * @tc.name testDecimalSqrtPart02TestTest007
     * @tc.desc Verify undefined 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalSqrtPart02TestTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        needArg(undefined as ESObject);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SQRT_PART02_SUPPLEMENT_TEST_0800
     * @tc.name testDecimalSqrtPart02TestTest008
     * @tc.desc Verify undefined 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalSqrtPart02TestTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let holder: Record<string, number> = {};
      try {
        new Decimal(holder['missing'] as ESObject);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SQRT_PART02_SUPPLEMENT_TEST_0900
     * @tc.name testDecimalSqrtPart02TestTest009
     * @tc.desc Verify undefined 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalSqrtPart02TestTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: number[] = [];
      try {
        new Decimal(arr[3] as ESObject);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SQRT_PART02_SUPPLEMENT_TEST_1000
     * @tc.name testDecimalSqrtPart02TestTest010
     * @tc.desc Verify Map get undefined 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalSqrtPart02TestTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m: Map<string, number> = new Map<string, number>();
      try {
        new Decimal(m.get('absent') as ESObject);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SQRT_PART02_SUPPLEMENT_TEST_1100
     * @tc.name testDecimalSqrtPart02TestTest011
     * @tc.desc Verify a.b.c undefined 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalSqrtPart02TestTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let deep: Record<string, Record<string, number>> = {};
      try {
        new Decimal(deep['a']['b'] as ESObject);
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SQRT_PART02_SUPPLEMENT_TEST_1200
     * @tc.name testDecimalSqrtPart02TestTest012
     * @tc.desc Verify 9 sqrt = 3
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalSqrtPart02TestTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let root: Decimal = withDefault();
      expect(root.toString()).assertEqual('3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SQRT_PART02_SUPPLEMENT_TEST_1300
     * @tc.name testDecimalSqrtPart02TestTest013
     * @tc.desc Verify null null undefined 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalSqrtPart02TestTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        withDefault3(null as ESObject);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SQRT_PART02_SUPPLEMENT_TEST_1400
     * @tc.name testDecimalSqrtPart02TestTest014
     * @tc.desc Verify undefined 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalSqrtPart02TestTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        optionalArg();
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SQRT_PART02_SUPPLEMENT_TEST_1500
     * @tc.name testDecimalSqrtPart02TestTest015
     * @tc.desc Verify Decimal sqrt = 7
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalSqrtPart02TestTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let root: Decimal = withDecDefault();
      expect(root.toString()).assertEqual('7');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SQRT_PART02_SUPPLEMENT_TEST_1600
     * @tc.name testDecimalSqrtPart02TestTest016
     * @tc.desc Verify number|null null 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalSqrtPart02TestTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: number | null = null;
      try {
        new Decimal(v as ESObject);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SQRT_PART02_SUPPLEMENT_TEST_1700
     * @tc.name testDecimalSqrtPart02TestTest017
     * @tc.desc Verify number|undefined undefined 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalSqrtPart02TestTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: number | undefined = undefined;
      try {
        new Decimal(v as ESObject);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SQRT_PART02_SUPPLEMENT_TEST_1800
     * @tc.name testDecimalSqrtPart02TestTest018
     * @tc.desc Verify boolean|null null 401 boolean Value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalSqrtPart02TestTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: boolean | null = null;
      try {
        new Decimal(v as ESObject);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SQRT_PART02_SUPPLEMENT_TEST_1900
     * @tc.name testDecimalSqrtPart02TestTest019
     * @tc.desc Verify boolean|undefined undefined 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalSqrtPart02TestTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: boolean | undefined = undefined;
      try {
        new Decimal(v as ESObject);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SQRT_PART02_SUPPLEMENT_TEST_2000
     * @tc.name testDecimalSqrtPart02TestTest020
     * @tc.desc Verify number|string|null null 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalSqrtPart02TestTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: number | string | null = null;
      try {
        new Decimal(v as ESObject);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SQRT_PART02_SUPPLEMENT_TEST_2100
     * @tc.name testDecimalSqrtPart02TestTest021
     * @tc.desc Verify number|string|undefined undefined 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalSqrtPart02TestTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: number | string | undefined = undefined;
      try {
        new Decimal(v as ESObject);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SQRT_PART02_SUPPLEMENT_TEST_2200
     * @tc.name testDecimalSqrtPart02TestTest022
     * @tc.desc Verify number|boolean|null null 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalSqrtPart02TestTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: number | boolean | null = null;
      try {
        new Decimal(v as ESObject);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SQRT_PART02_SUPPLEMENT_TEST_2300
     * @tc.name testDecimalSqrtPart02TestTest023
     * @tc.desc Verify string|boolean|undefined undefined 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalSqrtPart02TestTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: string | boolean | undefined = undefined;
      try {
        new Decimal(v as ESObject);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SQRT_PART02_SUPPLEMENT_TEST_2400
     * @tc.name testDecimalSqrtPart02TestTest024
     * @tc.desc Verify number|string|boolean|null null 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalSqrtPart02TestTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: number | string | boolean | null = null;
      try {
        new Decimal(v as ESObject);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SQRT_PART02_SUPPLEMENT_TEST_2500
     * @tc.name testDecimalSqrtPart02TestTest025
     * @tc.desc Verify number|string|boolean|undefined undefined 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalSqrtPart02TestTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: number | string | boolean | undefined = undefined;
      try {
        new Decimal(v as ESObject);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SQRT_PART02_SUPPLEMENT_TEST_2600
     * @tc.name testDecimalSqrtPart02TestTest026
     * @tc.desc Verify null|undefined null 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalSqrtPart02TestTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: null | undefined = null;
      try {
        new Decimal(v as ESObject);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SQRT_PART02_SUPPLEMENT_TEST_2700
     * @tc.name testDecimalSqrtPart02TestTest027
     * @tc.desc Verify null|undefined undefined 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalSqrtPart02TestTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: null | undefined = undefined;
      try {
        new Decimal(v as ESObject);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SQRT_PART02_SUPPLEMENT_TEST_2800
     * @tc.name testDecimalSqrtPart02TestTest028
     * @tc.desc Verify string|number|null|undefined string null 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalSqrtPart02TestTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: string | number | null | undefined = '64';
      let root: Decimal = new Decimal(v as ESObject).sqrt();
      expect(root.toString()).assertEqual('8');
      v = null;
      try {
        new Decimal(v as ESObject);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SQRT_PART02_SUPPLEMENT_TEST_2900
     * @tc.name testDecimalSqrtPart02TestTest029
     * @tc.desc Verify number|string|boolean|null|undefined undefined boolean 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalSqrtPart02TestTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: number | string | boolean | null | undefined = undefined;
      try {
        new Decimal(v as ESObject);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
      v = false;
      try {
        new Decimal(v as ESObject);
        expect().assertFail();
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SQRT_PART02_SUPPLEMENT_TEST_3000
     * @tc.name testDecimalSqrtPart02TestTest030
     * @tc.desc Verify number|null number
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalSqrtPart02TestTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: number | null = 81;
      let root: Decimal = new Decimal(v as ESObject).sqrt();
      expect(root.toString()).assertEqual('9');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SQRT_PART02_SUPPLEMENT_TEST_3100
     * @tc.name testDecimalSqrtPart02TestTest031
     * @tc.desc Verify Decimal|null Decimal sqrt
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalSqrtPart02TestTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: Decimal | null = new Decimal(100);
      let root: Decimal = new Decimal(v as ESObject).sqrt();
      expect(root.toString()).assertEqual('10');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SQRT_PART02_SUPPLEMENT_TEST_3200
     * @tc.name testDecimalSqrtPart02TestTest032
     * @tc.desc Verify Decimal|null null 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalSqrtPart02TestTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: Decimal | null = null;
      try {
        new Decimal(v as ESObject);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SQRT_PART02_SUPPLEMENT_TEST_3300
     * @tc.name testDecimalSqrtPart02TestTest033
     * @tc.desc Verify Decimal|undefined undefined 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalSqrtPart02TestTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: Decimal | undefined = undefined;
      try {
        new Decimal(v as ESObject);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SQRT_PART02_SUPPLEMENT_TEST_3400
     * @tc.name testDecimalSqrtPart02TestTest034
     * @tc.desc Verify Date|null null 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalSqrtPart02TestTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: Date | null = null;
      try {
        new Decimal(v as ESObject);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SQRT_PART02_SUPPLEMENT_TEST_3500
     * @tc.name testDecimalSqrtPart02TestTest035
     * @tc.desc Verify RegExp|undefined undefined 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalSqrtPart02TestTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: RegExp | undefined = undefined;
      try {
        new Decimal(v as ESObject);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SQRT_PART02_SUPPLEMENT_TEST_3600
     * @tc.name testDecimalSqrtPart02TestTest036
     * @tc.desc Verify Error|null null 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalSqrtPart02TestTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: Error | null = null;
      try {
        new Decimal(v as ESObject);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SQRT_PART02_SUPPLEMENT_TEST_3700
     * @tc.name testDecimalSqrtPart02TestTest037
     * @tc.desc Verify Array|undefined undefined 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalSqrtPart02TestTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: number[] | undefined = undefined;
      try {
        new Decimal(v as ESObject);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SQRT_PART02_SUPPLEMENT_TEST_3800
     * @tc.name testDecimalSqrtPart02TestTest038
     * @tc.desc Verify Map|null null 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalSqrtPart02TestTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: Map<string, number> | null = null;
      try {
        new Decimal(v as ESObject);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SQRT_PART02_SUPPLEMENT_TEST_3900
     * @tc.name testDecimalSqrtPart02TestTest039
     * @tc.desc Verify Set|undefined undefined 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalSqrtPart02TestTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: Set<number> | undefined = undefined;
      try {
        new Decimal(v as ESObject);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SQRT_PART02_SUPPLEMENT_TEST_4000
     * @tc.name testDecimalSqrtPart02TestTest040
     * @tc.desc Verify object|null null 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalSqrtPart02TestTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: object | null = null;
      try {
        new Decimal(v as ESObject);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SQRT_PART02_SUPPLEMENT_TEST_4100
     * @tc.name testDecimalSqrtPart02TestTest041
     * @tc.desc Verify object|null object 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalSqrtPart02TestTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: object | null = {} as ESObject;
      try {
        new Decimal(v as ESObject);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SQRT_PART02_SUPPLEMENT_TEST_4200
     * @tc.name testDecimalSqrtPart02TestTest042
     * @tc.desc Verify String(null) 'null' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalSqrtPart02TestTest042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Decimal(String(null) as ESObject);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SQRT_PART02_SUPPLEMENT_TEST_4300
     * @tc.name testDecimalSqrtPart02TestTest043
     * @tc.desc Verify String(undefined) 'undefined' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalSqrtPart02TestTest043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Decimal(String(undefined) as ESObject);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SQRT_PART02_SUPPLEMENT_TEST_4400
     * @tc.name testDecimalSqrtPart02TestTest044
     * @tc.desc Verify null 'null' '' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalSqrtPart02TestTest044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = '' + (null as ESObject);
      try {
        new Decimal(s as ESObject);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
      try {
        new Decimal('' as ESObject);
        expect().assertFail();
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SQRT_PART02_SUPPLEMENT_TEST_4500
     * @tc.name testDecimalSqrtPart02TestTest045
     * @tc.desc Verify void 0 undefined 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalSqrtPart02TestTest045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Decimal(void 0 as ESObject);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SQRT_PART02_SUPPLEMENT_TEST_4600
     * @tc.name testDecimalSqrtPart02TestTest046
     * @tc.desc Verify null sqrt TypeError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalSqrtPart02TestTest046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal | null = null;
      try {
        (d as ESObject).sqrt();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SQRT_PART02_SUPPLEMENT_TEST_4700
     * @tc.name testDecimalSqrtPart02TestTest047
     * @tc.desc Verify undefined sqrt TypeError undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalSqrtPart02TestTest047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal | undefined = undefined;
      try {
        (d as ESObject).sqrt();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SQRT_PART02_SUPPLEMENT_TEST_4800
     * @tc.name testDecimalSqrtPart02TestTest048
     * @tc.desc Verify sqrt TypeError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalSqrtPart02TestTest048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let holder: Record<string, number> = {};
      try {
        (holder as ESObject).sqrt();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SQRT_PART02_SUPPLEMENT_TEST_4900
     * @tc.name testDecimalSqrtPart02TestTest049
     * @tc.desc Verify typeof null typeof undefined 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalSqrtPart02TestTest049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let n: null = null;
      let u: undefined = undefined;
      try {
        new Decimal(n as ESObject);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
      try {
        new Decimal(u as ESObject);
        expect().assertFail();
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SQRT_PART02_SUPPLEMENT_TEST_5000
     * @tc.name testDecimalSqrtPart02TestTest050
     * @tc.desc Verify string undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalSqrtPart02TestTest050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: string | number | Decimal | undefined = '36';
      let root: Decimal = new Decimal(v as ESObject).sqrt();
      expect(root.toString()).assertEqual('6');
      v = undefined;
      try {
        new Decimal(v as ESObject);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });


  });

}
