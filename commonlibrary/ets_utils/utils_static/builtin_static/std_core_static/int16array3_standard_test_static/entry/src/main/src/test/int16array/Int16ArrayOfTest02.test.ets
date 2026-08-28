'use static';


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

import {
  afterAll,
  afterEach,
  beforeAll,
  beforeEach,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType,
} from '../../../../hypium/index';
import Utils from '../Util.test';

export default function Int16ArrayOfTest02(): void {
  describe('Int16ArrayOfTest02', (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OF_TWO_0100
     * @tc.name testInt16ArrayOfTestTwo001
     * @tc.desc Verify Int16Array.of boundary elements via $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayOfTestTwo001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: Int16Array = Int16Array.of(32767.0, 32767.0);
      let r1: number = result.$_get(0);
      let e1: int = 32767;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(1);
      let e2: int = 32767;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OF_TWO_0200
     * @tc.name testInt16ArrayOfTestTwo002
     * @tc.desc Verify Int16Array.of boundary elements via $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayOfTestTwo002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: Int16Array = Int16Array.of(-32768.0, -32768.0);
      let r1: number = result.$_get(0);
      let e1: int = -32768;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(1);
      let e2: int = -32768;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OF_TWO_0300
     * @tc.name testInt16ArrayOfTestTwo003
     * @tc.desc Verify Int16Array.of() returns Int16Array instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayOfTestTwo003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: Int16Array = Int16Array.of();
      let r1: boolean = result instanceof Int16Array;
      expect(r1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OF_TWO_0400
     * @tc.name testInt16ArrayOfTestTwo004
     * @tc.desc Verify Int16Array.of(1.0, 2.0, 3.0) byteOffset equals 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayOfTestTwo004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: Int16Array = Int16Array.of(1.0, 2.0, 3.0);
      let r1: int = result.byteOffset;
      let e1: int = 0;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OF_TWO_0500
     * @tc.name testInt16ArrayOfTestTwo005
     * @tc.desc Verify Int16Array.of(1.0) byteLength equals length times 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayOfTestTwo005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: Int16Array = Int16Array.of(1.0);
      let r1: int = result.byteLength;
      let e1: number = result.length * 2;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OF_TWO_0600
     * @tc.name testInt16ArrayOfTestTwo006
     * @tc.desc Verify Int16Array.of(-0.0) converts negative zero to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayOfTestTwo006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: Int16Array = Int16Array.of(-0.0);
      let r1: number = result.$_get(0);
      let e1: int = 0;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OF_TWO_0700
     * @tc.name testInt16ArrayOfTestTwo007
     * @tc.desc Verify Int16Array.of(32767.9) truncates near MAX to 32767
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayOfTestTwo007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: Int16Array = Int16Array.of(32767.9);
      let r1: number = result.$_get(0);
      let e1: int = 32767;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OF_TWO_0800
     * @tc.name testInt16ArrayOfTestTwo008
     * @tc.desc Verify Int16Array.of(-32768.9) truncates near MIN to -32768
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayOfTestTwo008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: Int16Array = Int16Array.of(-32768.9);
      let r1: number = result.$_get(0);
      let e1: int = -32768;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OF_TWO_0900
     * @tc.name testInt16ArrayOfTestTwo009
     * @tc.desc Verify Int16Array.of(-100000.0) wraps into int16 range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayOfTestTwo009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: Int16Array = Int16Array.of(-100000.0);
      let rNeq: boolean = result.$_get(0) !== -100000;
      expect(rNeq).assertTrue();
      let r1: boolean = result.$_get(0) >= -32768;
      expect(r1).assertTrue();
      let r2: boolean = result.$_get(0) <= 32767;
      expect(r2).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OF_TWO_1000
     * @tc.name testInt16ArrayOfTestTwo010
     * @tc.desc Verify Int16Array.of overflow triple wraps each element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayOfTestTwo010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: Int16Array = Int16Array.of(32768.0, 65536.0, 100000.0);
      let r1: number = result.$_get(0);
      let e1: int = -32768;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(1);
      let e2: int = 0;
      expect(r2).assertEqual(e2);
      let rNeq: boolean = result.$_get(2) !== 100000;
      expect(rNeq).assertTrue();
      let r3: boolean = result.$_get(2) >= -32768;
      expect(r3).assertTrue();
      let r4: boolean = result.$_get(2) <= 32767;
      expect(r4).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OF_TWO_1100
     * @tc.name testInt16ArrayOfTestTwo011
     * @tc.desc Verify Int16Array.of overflow float wraps via $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayOfTestTwo011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: Int16Array = Int16Array.of(32768.5);
      let r1: number = result.$_get(0);
      let e1: int = -32768;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OF_TWO_1200
     * @tc.name testInt16ArrayOfTestTwo012
     * @tc.desc Verify Int16Array.of overflow float wraps via $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayOfTestTwo012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: Int16Array = Int16Array.of(-32769.5);
      let r1: number = result.$_get(0);
      let e1: int = 32767;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OF_TWO_1300
     * @tc.name testInt16ArrayOfTestTwo013
     * @tc.desc Verify Int16Array.of chained result elements via $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayOfTestTwo013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: Int16Array = Int16Array.of(0.0, 0.5, 0.9, 1.0);
      let r1: number = result.$_get(0);
      let e1: int = 0;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(1);
      let e2: int = 0;
      expect(r2).assertEqual(e2);
      let r3: number = result.$_get(2);
      let e3: int = 0;
      expect(r3).assertEqual(e3);
      let r4: number = result.$_get(3);
      let e4: int = 1;
      expect(r4).assertEqual(e4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OF_TWO_1400
     * @tc.name testInt16ArrayOfTestTwo014
     * @tc.desc Verify Int16Array.of chained result elements via $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayOfTestTwo014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: Int16Array = Int16Array.of(32768.0, 32769.0, 65535.0, 65536.0);
      let r1: number = result.$_get(0);
      let e1: int = -32768;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(1);
      let e2: int = -32767;
      expect(r2).assertEqual(e2);
      let r3: number = result.$_get(2);
      let e3: int = -1;
      expect(r3).assertEqual(e3);
      let r4: number = result.$_get(3);
      let e4: int = 0;
      expect(r4).assertEqual(e4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OF_TWO_1500
     * @tc.name testInt16ArrayOfTestTwo015
     * @tc.desc Verify Int16Array.of chained result elements via $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayOfTestTwo015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: Int16Array = Int16Array.of(3.0, 1.0, 2.0).sort();
      let r1: number = result.$_get(0);
      let e1: int = 1;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(1);
      let e2: int = 2;
      expect(r2).assertEqual(e2);
      let r3: number = result.$_get(2);
      let e3: int = 3;
      expect(r3).assertEqual(e3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OF_TWO_1600
     * @tc.name testInt16ArrayOfTestTwo016
     * @tc.desc Verify Int16Array.of chained result elements via $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayOfTestTwo016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: Int16Array = Int16Array.of(1.0, 2.0, 3.0).fill(0.0);
      let r1: number = result.$_get(0);
      let e1: int = 0;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(1);
      let e2: int = 0;
      expect(r2).assertEqual(e2);
      let r3: number = result.$_get(2);
      let e3: int = 0;
      expect(r3).assertEqual(e3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OF_TWO_1700
     * @tc.name testInt16ArrayOfTestTwo017
     * @tc.desc Verify Int16Array.of chained result elements via $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayOfTestTwo017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: Int16Array = Int16Array.of(1.0, 2.0, 3.0).reverse();
      let r1: number = result.$_get(0);
      let e1: int = 3;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(1);
      let e2: int = 2;
      expect(r2).assertEqual(e2);
      let r3: number = result.$_get(2);
      let e3: int = 1;
      expect(r3).assertEqual(e3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OF_TWO_1800
     * @tc.name testInt16ArrayOfTestTwo018
     * @tc.desc Verify Int16Array.of chained result elements via $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayOfTestTwo018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: Int16Array = Int16Array.of(1.0, 2.0, 3.0).map(
        (value: number, index: int, array: Int16Array): number => {
          return value + 1.0;
        },
      );
      let r1: number = result.$_get(0);
      let e1: int = 2;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(1);
      let e2: int = 3;
      expect(r2).assertEqual(e2);
      let r3: number = result.$_get(2);
      let e3: int = 4;
      expect(r3).assertEqual(e3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OF_TWO_1900
     * @tc.name testInt16ArrayOfTestTwo019
     * @tc.desc Verify Int16Array.of(1,2,3).filter keeps values greater than 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayOfTestTwo019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: Int16Array = Int16Array.of(1.0, 2.0, 3.0).filter(
        (value: number, index: int, array: Int16Array): boolean => {
          return value > 1.0;
        },
      );
      let r1: int = result.length;
      let e1: int = 2;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(0);
      let e2: int = 2;
      expect(r2).assertEqual(e2);
      let r3: number = result.$_get(1);
      let e3: int = 3;
      expect(r3).assertEqual(e3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OF_TWO_2000
     * @tc.name testInt16ArrayOfTestTwo020
     * @tc.desc Verify Int16Array.of length matches new Int16Array ctor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayOfTestTwo020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: number[] = [1.0, 2.0, 3.0];
      let fromOf: Int16Array = Int16Array.of(1.0, 2.0, 3.0);
      let fromCtor: Int16Array = new Int16Array(source);
      let r1: int = fromOf.length;
      let e1: number = fromCtor.length;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OF_TWO_2100
     * @tc.name testInt16ArrayOfTestTwo021
     * @tc.desc Verify Int16Array.of elements match new Int16Array ctor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayOfTestTwo021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: number[] = [1.0, 2.0, 3.0];
      let fromOf: Int16Array = Int16Array.of(1.0, 2.0, 3.0);
      let fromCtor: Int16Array = new Int16Array(source);
      let r1: number = fromOf.$_get(0);
      let e1: number = fromCtor.$_get(0);
      expect(r1).assertEqual(e1);
      let r2: number = fromOf.$_get(1);
      let e2: number = fromCtor.$_get(1);
      expect(r2).assertEqual(e2);
      let r3: number = fromOf.$_get(2);
      let e3: number = fromCtor.$_get(2);
      expect(r3).assertEqual(e3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OF_TWO_2200
     * @tc.name testInt16ArrayOfTestTwo022
     * @tc.desc Verify Int16Array.of chained result elements via $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayOfTestTwo022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: number[] = [-32768.0, 32767.0];
      let fromOf: Int16Array = Int16Array.of(-32768.0, 32767.0);
      let fromCtor: Int16Array = new Int16Array(source);
      let r1: number = fromOf.$_get(0);
      let e1: number = fromCtor.$_get(0);
      expect(r1).assertEqual(e1);
      let r2: number = fromOf.$_get(1);
      let e2: number = fromCtor.$_get(1);
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OF_TWO_2300
     * @tc.name testInt16ArrayOfTestTwo023
     * @tc.desc Verify Int16Array.of chained result elements via $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayOfTestTwo023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: number[] = [Number.NaN];
      let fromOf: Int16Array = Int16Array.of(Number.NaN);
      let fromCtor: Int16Array = new Int16Array(source);
      let r1: number = fromOf.$_get(0);
      let e1: number = fromCtor.$_get(0);
      expect(r1).assertEqual(e1);
      let r2: number = fromCtor.$_get(0);
      let e2: int = 0;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OF_TWO_2400
     * @tc.name testInt16ArrayOfTestTwo024
     * @tc.desc Verify Int16Array.of for-of iteration accumulates sum
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayOfTestTwo024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10.0, 20.0, 30.0);
      let sum: number = 0.0;
      for (let item of arr) {
        sum = sum + item;
      }
      expect(sum).assertEqual(60.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OF_TWO_2500
     * @tc.name testInt16ArrayOfTestTwo025
     * @tc.desc Verify Int16Array.of entries iterator yields index value pairs
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayOfTestTwo025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1.0, 2.0, 3.0);
      let keys: number[] = [];
      let vals: number[] = [];
      for (let entry of arr.entries()) {
        keys.push(entry[0]);
        vals.push(entry[1]);
      }
      let r1: number = keys[0];
      let e1: int = 0;
      expect(r1).assertEqual(e1);
      let r2: number = keys[1];
      let e2: int = 1;
      expect(r2).assertEqual(e2);
      let r3: number = keys[2];
      let e3: int = 2;
      expect(r3).assertEqual(e3);
      let r4: number = vals[0];
      let e4: number = 1.0;
      expect(r4).assertEqual(e4);
      let r5: number = vals[1];
      let e5: number = 2.0;
      expect(r5).assertEqual(e5);
      let r6: number = vals[2];
      let e6: number = 3.0;
      expect(r6).assertEqual(e6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OF_TWO_2600
     * @tc.name testInt16ArrayOfTestTwo026
     * @tc.desc Verify Int16Array.of keys iterator yields 0 1 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayOfTestTwo026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1.0, 2.0, 3.0);
      let indices: number[] = [];
      for (let key of arr.keys()) {
        indices.push(key);
      }
      let r1: number = indices[0];
      let e1: int = 0;
      expect(r1).assertEqual(e1);
      let r2: number = indices[1];
      let e2: int = 1;
      expect(r2).assertEqual(e2);
      let r3: number = indices[2];
      let e3: int = 2;
      expect(r3).assertEqual(e3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OF_TWO_2700
     * @tc.name testInt16ArrayOfTestTwo027
     * @tc.desc Verify Int16Array.of values iterator matches $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayOfTestTwo027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1.0, 2.0, 3.0);
      let idx: int = 0;
      for (let val of arr.values()) {
        expect(val).assertEqual(arr.$_get(idx));
        idx = idx + 1;
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OF_TWO_2800
     * @tc.name testInt16ArrayOfTestTwo028
     * @tc.desc Verify Int16Array.of() creates empty array with byteLength 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayOfTestTwo028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of();
      let r1: int = arr.byteLength;
      let e1: int = 0;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OF_TWO_2900
     * @tc.name testInt16ArrayOfTestTwo029
     * @tc.desc Verify Int16Array.of(a) single arg creates length 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayOfTestTwo029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: short = 42;
      let arr = Int16Array.of(a);
      let r1: int = arr.length;
      let e1: int = 1;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OF_TWO_3000
     * @tc.name testInt16ArrayOfTestTwo030
     * @tc.desc Verify Int16Array.of(a,b) two args create length 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayOfTestTwo030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: short = 10;
      let b: short = 20;
      let arr = Int16Array.of(a, b);
      let r1: int = arr.length;
      let e1: int = 2;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OF_TWO_3100
     * @tc.name testInt16ArrayOfTestTwo031
     * @tc.desc Verify Int16Array.of(a,b,c) three args create length 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayOfTestTwo031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: short = 1;
      let b: short = 2;
      let c: short = 3;
      let arr = Int16Array.of(a, b, c);
      let r1: int = arr.length;
      let e1: int = 3;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OF_TWO_3200
     * @tc.name testInt16ArrayOfTestTwo032
     * @tc.desc Verify Int16Array.of(a,b,c,d) four args create length 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayOfTestTwo032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: short = 1;
      let b: short = 2;
      let c: short = 3;
      let d: short = 4;
      let arr = Int16Array.of(a, b, c, d);
      let r1: int = arr.length;
      let e1: int = 4;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OF_TWO_3300
     * @tc.name testInt16ArrayOfTestTwo033
     * @tc.desc Verify Int16Array.of five args create length 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayOfTestTwo033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: short = 0;
      let b: short = 0;
      let c: short = 0;
      let d: short = 0;
      let e: short = 0;
      let arr = Int16Array.of(a, b, c, d, e);
      let r1: int = arr.length;
      let e1: int = 5;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OF_TWO_3400
     * @tc.name testInt16ArrayOfTestTwo034
     * @tc.desc Verify Int16Array.of ten args create length 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayOfTestTwo034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: short = 7;
      let arr = Int16Array.of(v, v, v, v, v, v, v, v, v, v);
      let r1: int = arr.length;
      let e1: int = 10;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OF_TWO_3500
     * @tc.name testInt16ArrayOfTestTwo035
     * @tc.desc Verify Int16Array.of(...FixedArray) spread creates length 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayOfTestTwo035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: FixedArray<short> = [10 as short, 20 as short, 30 as short];
      let arr = Int16Array.of(...source);
      let r1: int = arr.length;
      let e1: int = 3;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OF_TWO_3600
     * @tc.name testInt16ArrayOfTestTwo036
     * @tc.desc Verify Int16Array.of(0) stores short zero element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayOfTestTwo036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: short = 0;
      let arr = Int16Array.of(a);
      let r1: number = arr.$_get(0);
      let e1: int = 0;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OF_TWO_3700
     * @tc.name testInt16ArrayOfTestTwo037
     * @tc.desc Verify Int16Array.of(1) stores short positive one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayOfTestTwo037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: short = 1;
      let arr = Int16Array.of(a);
      let r1: number = arr.$_get(0);
      let e1: int = 1;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OF_TWO_3800
     * @tc.name testInt16ArrayOfTestTwo038
     * @tc.desc Verify Int16Array.of(-1) stores short negative one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayOfTestTwo038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: short = -1;
      let arr = Int16Array.of(a);
      let r1: number = arr.$_get(0);
      let e1: int = -1;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OF_TWO_3900
     * @tc.name testInt16ArrayOfTestTwo039
     * @tc.desc Verify Int16Array.of(32767) stores MAX short without loss
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayOfTestTwo039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: short = 32767;
      let arr = Int16Array.of(a);
      let r1: number = arr.$_get(0);
      let e1: int = 32767;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OF_TWO_4000
     * @tc.name testInt16ArrayOfTestTwo040
     * @tc.desc Verify Int16Array.of(-32768) stores MIN short without loss
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayOfTestTwo040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: short = -32768;
      let arr = Int16Array.of(a);
      let r1: number = arr.$_get(0);
      let e1: int = -32768;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OF_TWO_4100
     * @tc.name testInt16ArrayOfTestTwo041
     * @tc.desc Verify Int16Array.of(32766) stores MAX-1 short element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayOfTestTwo041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: short = 32766;
      let arr = Int16Array.of(a);
      let r1: number = arr.$_get(0);
      let e1: int = 32766;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OF_TWO_4200
     * @tc.name testInt16ArrayOfTestTwo042
     * @tc.desc Verify Int16Array.of(-32767) stores MIN+1 short element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayOfTestTwo042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: short = -32767;
      let arr = Int16Array.of(a);
      let r1: number = arr.$_get(0);
      let e1: int = -32767;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OF_TWO_4300
     * @tc.name testInt16ArrayOfTestTwo043
     * @tc.desc Verify Int16Array.of(0,0) keeps dual zero short values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayOfTestTwo043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: short = 0;
      let b: short = 0;
      let arr = Int16Array.of(a, b);
      let r1: number = arr.$_get(0);
      let e1: int = 0;
      expect(r1).assertEqual(e1);
      let r2: number = arr.$_get(1);
      let e2: int = 0;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OF_TWO_4400
     * @tc.name testInt16ArrayOfTestTwo044
     * @tc.desc Verify Int16Array.of(-1,-1) keeps dual negative one values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayOfTestTwo044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: short = -1;
      let b: short = -1;
      let arr = Int16Array.of(a, b);
      let r1: number = arr.$_get(0);
      let e1: int = -1;
      expect(r1).assertEqual(e1);
      let r2: number = arr.$_get(1);
      let e2: int = -1;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OF_TWO_4500
     * @tc.name testInt16ArrayOfTestTwo045
     * @tc.desc Verify Int16Array.of(32767,32767) keeps dual MAX values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayOfTestTwo045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: short = 32767;
      let b: short = 32767;
      let arr = Int16Array.of(a, b);
      let r1: number = arr.$_get(0);
      let e1: int = 32767;
      expect(r1).assertEqual(e1);
      let r2: number = arr.$_get(1);
      let e2: int = 32767;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OF_TWO_4600
     * @tc.name testInt16ArrayOfTestTwo046
     * @tc.desc Verify Int16Array.of(-32768,-32768) keeps dual MIN values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayOfTestTwo046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: short = -32768;
      let b: short = -32768;
      let arr = Int16Array.of(a, b);
      let r1: number = arr.$_get(0);
      let e1: int = -32768;
      expect(r1).assertEqual(e1);
      let r2: number = arr.$_get(1);
      let e2: int = -32768;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OF_TWO_4700
     * @tc.name testInt16ArrayOfTestTwo047
     * @tc.desc Verify Int16Array.of(-32768,32767) keeps MIN and MAX mixed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayOfTestTwo047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: short = -32768;
      let b: short = 32767;
      let arr = Int16Array.of(a, b);
      let r1: number = arr.$_get(0);
      let e1: int = -32768;
      expect(r1).assertEqual(e1);
      let r2: number = arr.$_get(1);
      let e2: int = 32767;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OF_TWO_4800
     * @tc.name testInt16ArrayOfTestTwo048
     * @tc.desc Verify Int16Array.of(32767,-32768) keeps MAX and MIN reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayOfTestTwo048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: short = 32767;
      let b: short = -32768;
      let arr = Int16Array.of(a, b);
      let r1: number = arr.$_get(0);
      let e1: int = 32767;
      expect(r1).assertEqual(e1);
      let r2: number = arr.$_get(1);
      let e2: int = -32768;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OF_TWO_4900
     * @tc.name testInt16ArrayOfTestTwo049
     * @tc.desc Verify Int16Array.of(0,32767) keeps zero and MAX adjacent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayOfTestTwo049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: short = 0;
      let b: short = 32767;
      let arr = Int16Array.of(a, b);
      let r1: number = arr.$_get(0);
      let e1: int = 0;
      expect(r1).assertEqual(e1);
      let r2: number = arr.$_get(1);
      let e2: int = 32767;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OF_TWO_5000
     * @tc.name testInt16ArrayOfTestTwo050
     * @tc.desc Verify Int16Array.of(32767,0) keeps MAX and zero reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayOfTestTwo050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: short = 32767;
      let b: short = 0;
      let arr = Int16Array.of(a, b);
      let r1: number = arr.$_get(0);
      let e1: int = 32767;
      expect(r1).assertEqual(e1);
      let r2: number = arr.$_get(1);
      let e2: int = 0;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OF_TWO_5100
     * @tc.name testInt16ArrayOfTestTwo051
     * @tc.desc Verify Int16Array.of(-1,1) keeps negative and positive one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayOfTestTwo051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: short = -1;
      let b: short = 1;
      let arr = Int16Array.of(a, b);
      let r1: number = arr.$_get(0);
      let e1: int = -1;
      expect(r1).assertEqual(e1);
      let r2: number = arr.$_get(1);
      let e2: int = 1;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OF_TWO_5200
     * @tc.name testInt16ArrayOfTestTwo052
     * @tc.desc Verify Int16Array.of(-32768,0,32767) covers three boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayOfTestTwo052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: short = -32768;
      let b: short = 0;
      let c: short = 32767;
      let arr = Int16Array.of(a, b, c);
      let r1: number = arr.$_get(0);
      let e1: int = -32768;
      expect(r1).assertEqual(e1);
      let r2: number = arr.$_get(1);
      let e2: int = 0;
      expect(r2).assertEqual(e2);
      let r3: number = arr.$_get(2);
      let e3: int = 32767;
      expect(r3).assertEqual(e3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OF_TWO_5300
     * @tc.name testInt16ArrayOfTestTwo053
     * @tc.desc Verify Int16Array.of(0,0,0) keeps three zero short values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayOfTestTwo053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: short = 0;
      let b: short = 0;
      let c: short = 0;
      let arr = Int16Array.of(a, b, c);
      let r1: number = arr.$_get(0);
      let e1: int = 0;
      expect(r1).assertEqual(e1);
      let r2: number = arr.$_get(1);
      let e2: int = 0;
      expect(r2).assertEqual(e2);
      let r3: number = arr.$_get(2);
      let e3: int = 0;
      expect(r3).assertEqual(e3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OF_TWO_5400
     * @tc.name testInt16ArrayOfTestTwo054
     * @tc.desc Verify Int16Array.of(1,2,3) keeps ascending three-value order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayOfTestTwo054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: short = 1;
      let b: short = 2;
      let c: short = 3;
      let arr = Int16Array.of(a, b, c);
      let r1: number = arr.$_get(0);
      let e1: int = 1;
      expect(r1).assertEqual(e1);
      let r2: number = arr.$_get(1);
      let e2: int = 2;
      expect(r2).assertEqual(e2);
      let r3: number = arr.$_get(2);
      let e3: int = 3;
      expect(r3).assertEqual(e3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OF_TWO_5500
     * @tc.name testInt16ArrayOfTestTwo055
     * @tc.desc Verify Int16Array.of(3,2,1) keeps descending three-value order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayOfTestTwo055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: short = 3;
      let b: short = 2;
      let c: short = 1;
      let arr = Int16Array.of(a, b, c);
      let r1: number = arr.$_get(0);
      let e1: int = 3;
      expect(r1).assertEqual(e1);
      let r2: number = arr.$_get(1);
      let e2: int = 2;
      expect(r2).assertEqual(e2);
      let r3: number = arr.$_get(2);
      let e3: int = 1;
      expect(r3).assertEqual(e3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OF_TWO_5600
     * @tc.name testInt16ArrayOfTestTwo056
     * @tc.desc Verify Int16Array.of(1,-1,1) keeps alternating sign sequence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayOfTestTwo056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: short = 1;
      let b: short = -1;
      let c: short = 1;
      let arr = Int16Array.of(a, b, c);
      let r1: number = arr.$_get(0);
      let e1: int = 1;
      expect(r1).assertEqual(e1);
      let r2: number = arr.$_get(1);
      let e2: int = -1;
      expect(r2).assertEqual(e2);
      let r3: number = arr.$_get(2);
      let e3: int = 1;
      expect(r3).assertEqual(e3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OF_TWO_5700
     * @tc.name testInt16ArrayOfTestTwo057
     * @tc.desc Verify Int16Array.of four boundary ladder values keep order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayOfTestTwo057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: short = -32768;
      let b: short = -32767;
      let c: short = 32766;
      let d: short = 32767;
      let arr = Int16Array.of(a, b, c, d);
      let r1: number = arr.$_get(0);
      let e1: int = -32768;
      expect(r1).assertEqual(e1);
      let r2: number = arr.$_get(1);
      let e2: int = -32767;
      expect(r2).assertEqual(e2);
      let r3: number = arr.$_get(2);
      let e3: int = 32766;
      expect(r3).assertEqual(e3);
      let r4: number = arr.$_get(3);
      let e4: int = 32767;
      expect(r4).assertEqual(e4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OF_TWO_5800
     * @tc.name testInt16ArrayOfTestTwo058
     * @tc.desc Verify Int16Array.of fifty short args keep order and values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayOfTestTwo058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let vals: FixedArray<short> = new FixedArray<short>(50);
      for (let i = 0; i < 50; i++) {
        vals[i] = (i % 2 === 0 ? 1 as short : -1 as short);
      }
      let arr = Int16Array.of(
        vals[0], vals[1], vals[2], vals[3], vals[4],
        vals[5], vals[6], vals[7], vals[8], vals[9],
        vals[10], vals[11], vals[12], vals[13], vals[14],
        vals[15], vals[16], vals[17], vals[18], vals[19],
        vals[20], vals[21], vals[22], vals[23], vals[24],
        vals[25], vals[26], vals[27], vals[28], vals[29],
        vals[30], vals[31], vals[32], vals[33], vals[34],
        vals[35], vals[36], vals[37], vals[38], vals[39],
        vals[40], vals[41], vals[42], vals[43], vals[44],
        vals[45], vals[46], vals[47], vals[48], vals[49]
      );
      let r1: int = arr.length;
      let e1: int = 50;
      expect(r1).assertEqual(e1);
      let r2: number = arr.$_get(0);
      let e2: int = 1;
      expect(r2).assertEqual(e2);
      let r3: number = arr.$_get(1);
      let e3: int = -1;
      expect(r3).assertEqual(e3);
      let r4: number = arr.$_get(49);
      let e4: int = -1;
      expect(r4).assertEqual(e4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OF_TWO_5900
     * @tc.name testInt16ArrayOfTestTwo059
     * @tc.desc Verify Int16Array.of(0) as int stores zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayOfTestTwo059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: int = 0;
      let arr = Int16Array.of(a);
      let r1: number = arr.$_get(0);
      let e1: int = 0;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OF_TWO_6000
     * @tc.name testInt16ArrayOfTestTwo060
     * @tc.desc Verify Int16Array.of(1) as int stores positive one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayOfTestTwo060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: int = 1;
      let arr = Int16Array.of(a);
      let r1: number = arr.$_get(0);
      let e1: int = 1;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OF_TWO_6100
     * @tc.name testInt16ArrayOfTestTwo061
     * @tc.desc Verify Int16Array.of(-1) as int stores negative one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayOfTestTwo061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: int = -1;
      let arr = Int16Array.of(a);
      let r1: number = arr.$_get(0);
      let e1: int = -1;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OF_TWO_6200
     * @tc.name testInt16ArrayOfTestTwo062
     * @tc.desc Verify Int16Array.of(32767) as int keeps in-range value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayOfTestTwo062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: int = 32767;
      let arr = Int16Array.of(a);
      let r1: number = arr.$_get(0);
      let e1: int = 32767;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OF_TWO_6300
     * @tc.name testInt16ArrayOfTestTwo063
     * @tc.desc Verify Int16Array.of(-32768) as int keeps in-range value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayOfTestTwo063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: int = -32768;
      let arr = Int16Array.of(a);
      let r1: number = arr.$_get(0);
      let e1: int = -32768;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OF_TWO_6400
     * @tc.name testInt16ArrayOfTestTwo064
     * @tc.desc Verify Int16Array.of(32768) as int wraps to -32768
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayOfTestTwo064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: int = 32768;
      let arr = Int16Array.of(a);
      let r1: number = arr.$_get(0);
      let e1: int = -32768;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OF_TWO_6500
     * @tc.name testInt16ArrayOfTestTwo065
     * @tc.desc Verify Int16Array.of(-32769) as int wraps to 32767
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayOfTestTwo065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: int = -32769;
      let arr = Int16Array.of(a);
      let r1: number = arr.$_get(0);
      let e1: int = 32767;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OF_TWO_6600
     * @tc.name testInt16ArrayOfTestTwo066
     * @tc.desc Verify Int16Array.of(65536) as int wraps to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayOfTestTwo066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: int = 65536;
      let arr = Int16Array.of(a);
      let r1: number = arr.$_get(0);
      let e1: int = 0;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OF_TWO_6700
     * @tc.name testInt16ArrayOfTestTwo067
     * @tc.desc Verify Int16Array.of(65535) as int wraps to -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayOfTestTwo067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: int = 65535;
      let arr = Int16Array.of(a);
      let r1: number = arr.$_get(0);
      let e1: int = -1;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OF_TWO_6800
     * @tc.name testInt16ArrayOfTestTwo068
     * @tc.desc Verify Int16Array.of(32767,32768) as int mixes normal and overflow
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayOfTestTwo068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: int = 32767;
      let b: int = 32768;
      let arr = Int16Array.of(a, b);
      let r1: number = arr.$_get(0);
      let e1: int = 32767;
      expect(r1).assertEqual(e1);
      let r2: number = arr.$_get(1);
      let e2: int = -32768;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OF_TWO_6900
     * @tc.name testInt16ArrayOfTestTwo069
     * @tc.desc Verify Int16Array.of(-32769,-32768) as int mixes underflow boundary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayOfTestTwo069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: int = -32769;
      let b: int = -32768;
      let arr = Int16Array.of(a, b);
      let r1: number = arr.$_get(0);
      let e1: int = 32767;
      expect(r1).assertEqual(e1);
      let r2: number = arr.$_get(1);
      let e2: int = -32768;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OF_TWO_7000
     * @tc.name testInt16ArrayOfTestTwo070
     * @tc.desc Verify Int16Array.of(0,32768,-32769) as int three overflow values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayOfTestTwo070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: int = 0;
      let b: int = 32768;
      let c: int = -32769;
      let arr = Int16Array.of(a, b, c);
      let r1: number = arr.$_get(0);
      let e1: int = 0;
      expect(r1).assertEqual(e1);
      let r2: number = arr.$_get(1);
      let e2: int = -32768;
      expect(r2).assertEqual(e2);
      let r3: number = arr.$_get(2);
      let e3: int = 32767;
      expect(r3).assertEqual(e3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OF_TWO_7100
     * @tc.name testInt16ArrayOfTestTwo071
     * @tc.desc Verify Int16Array.of(127) as byte stores MAX
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayOfTestTwo071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: byte = 127;
      let arr = Int16Array.of(a);
      let r1: number = arr.$_get(0);
      let e1: int = 127;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OF_TWO_7200
     * @tc.name testInt16ArrayOfTestTwo072
     * @tc.desc Verify Int16Array.of(-128) as byte stores MIN -128
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayOfTestTwo072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: byte = -128;
      let arr = Int16Array.of(a);
      let r1: number = arr.$_get(0);
      let e1: int = -128;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OF_TWO_7300
     * @tc.name testInt16ArrayOfTestTwo073
     * @tc.desc Verify Int16Array.of(32768) as long wraps to -32768
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayOfTestTwo073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: long = 32768;
      let arr = Int16Array.of(a);
      let r1: number = arr.$_get(0);
      let e1: int = -32768;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OF_TWO_7400
     * @tc.name testInt16ArrayOfTestTwo074
     * @tc.desc Verify Int16Array.of(-32769) as long wraps to 32767
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayOfTestTwo074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: long = -32769;
      let arr = Int16Array.of(a);
      let r1: number = arr.$_get(0);
      let e1: int = 32767;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OF_TWO_7500
     * @tc.name testInt16ArrayOfTestTwo075
     * @tc.desc Verify Int16Array.of(4294967296) as long wraps to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayOfTestTwo075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: long = 4294967296;
      let arr = Int16Array.of(a);
      let r1: number = arr.$_get(0);
      let e1: int = 0;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OF_TWO_7600
     * @tc.name testInt16ArrayOfTestTwo076
     * @tc.desc Verify Int16Array.of(char) stores char value into array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayOfTestTwo076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: char = c'A';
      let arr = Int16Array.of(a.toInt());
      let r1: number = arr.$_get(0);
      let e1: int = 65;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OF_TWO_7700
     * @tc.name testInt16ArrayOfTestTwo077
     * @tc.desc Verify Int16Array.of(float) truncates fraction like toFixed(0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayOfTestTwo077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: float = 3.7 as float;
      let arr = Int16Array.of(a);
      let r1: number = arr.$_get(0);
      let e1: int = 3;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OF_TWO_7800
     * @tc.name testInt16ArrayOfTestTwo078
     * @tc.desc Verify Int16Array.of(double) truncates fraction part
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayOfTestTwo078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: double = -3.7;
      let arr = Int16Array.of(a);
      let r1: number = arr.$_get(0);
      let e1: int = -3;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OF_TWO_7900
     * @tc.name testInt16ArrayOfTestTwo079
     * @tc.desc Verify Int16Array.of() result BYTES_PER_ELEMENT equals 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayOfTestTwo079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: short = 1;
      let arr = Int16Array.of(a);
      let r1: int = arr.BYTES_PER_ELEMENT;
      let e1: int = 2;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OF_TWO_8000
     * @tc.name testInt16ArrayOfTestTwo080
     * @tc.desc Verify Int16Array.of(a) single element byteLength equals 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayOfTestTwo080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: short = 1;
      let arr = Int16Array.of(a);
      let r1: int = arr.byteLength;
      let e1: int = 2;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OF_TWO_8100
     * @tc.name testInt16ArrayOfTestTwo081
     * @tc.desc Verify Int16Array.of(a,b) two elements byteLength equals 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayOfTestTwo081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: short = 1;
      let b: short = 2;
      let arr = Int16Array.of(a, b);
      let r1: int = arr.byteLength;
      let e1: int = 4;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OF_TWO_8200
     * @tc.name testInt16ArrayOfTestTwo082
     * @tc.desc Verify Int16Array.of() result byteOffset equals 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayOfTestTwo082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: short = 42;
      let arr = Int16Array.of(a);
      let r1: int = arr.byteOffset;
      let e1: int = 0;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OF_TWO_8300
     * @tc.name testInt16ArrayOfTestTwo083
     * @tc.desc Verify Int16Array.of() result buffer is not null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayOfTestTwo083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: short = 1;
      let arr = Int16Array.of(a);
      let rBuf: boolean = arr.buffer !== null;
      expect(rBuf).assertTrue();
    });

  });
}
