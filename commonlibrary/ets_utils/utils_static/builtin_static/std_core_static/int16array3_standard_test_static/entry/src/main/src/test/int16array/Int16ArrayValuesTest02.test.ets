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

export default function Int16ArrayValuesTest02(): void {
  describe('Int16ArrayValuesTest02', (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_VALUES_TWO_0100
     * @tc.name testInt16ArrayValuesTestTwo001
     * @tc.desc Verify values() next().value is undefined when done
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayValuesTestTwo001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array(0);
      let iter: IterableIterator<Number> = arr.values();
      let result: IteratorResult<Number> = iter.next();
      let r1: boolean = result.value === undefined;
      expect(r1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_VALUES_TWO_0200
     * @tc.name testInt16ArrayValuesTestTwo002
     * @tc.desc Verify values() next() done/value sequence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayValuesTestTwo002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array(0);
      let iter: IterableIterator<Number> = arr.values();
      iter.next();
      let result: IteratorResult<Number> = iter.next();
      let r1: boolean = result.done;
      expect(r1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_VALUES_TWO_0300
     * @tc.name testInt16ArrayValuesTestTwo003
     * @tc.desc Verify values() next().value is undefined when done
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayValuesTestTwo003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array(0);
      let iter: IterableIterator<Number> = arr.values();
      iter.next();
      let result: IteratorResult<Number> = iter.next();
      let r1: boolean = result.value === undefined;
      expect(r1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_VALUES_TWO_0400
     * @tc.name testInt16ArrayValuesTestTwo004
     * @tc.desc Verify values() next() done/value sequence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayValuesTestTwo004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([88]);
      let iter: IterableIterator<Number> = arr.values();
      iter.next();
      let result: IteratorResult<Number> = iter.next();
      let r1: boolean = result.done;
      expect(r1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_VALUES_TWO_0500
     * @tc.name testInt16ArrayValuesTestTwo005
     * @tc.desc Verify values() next().value is undefined when done
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayValuesTestTwo005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([88]);
      let iter: IterableIterator<Number> = arr.values();
      iter.next();
      let result: IteratorResult<Number> = iter.next();
      let r1: boolean = result.value === undefined;
      expect(r1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_VALUES_TWO_0600
     * @tc.name testInt16ArrayValuesTestTwo006
     * @tc.desc Verify values() next().done is false before end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayValuesTestTwo006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([10, 20, 30]);
      let iter: IterableIterator<Number> = arr.values();
      let result: IteratorResult<Number> = iter.next();
      let r1: boolean = result.done;
      expect(r1).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_VALUES_TWO_0700
     * @tc.name testInt16ArrayValuesTestTwo007
     * @tc.desc Verify values() next().done is false before end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayValuesTestTwo007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([10, 20, 30]);
      let iter: IterableIterator<Number> = arr.values();
      iter.next();
      let result: IteratorResult<Number> = iter.next();
      let r1: boolean = result.done;
      expect(r1).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_VALUES_TWO_0800
     * @tc.name testInt16ArrayValuesTestTwo008
     * @tc.desc Verify values() next().value sequence equals source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayValuesTestTwo008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([10, 20, 30]);
      let iter: IterableIterator<Number> = arr.values();
      iter.next();
      let result: IteratorResult<Number> = iter.next();
      let r1: Number | undefined = result.value;
      let e1: int = 20;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_VALUES_TWO_0900
     * @tc.name testInt16ArrayValuesTestTwo009
     * @tc.desc Verify values() next().done is false before end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayValuesTestTwo009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([10, 20, 30]);
      let iter: IterableIterator<Number> = arr.values();
      iter.next();
      iter.next();
      let result: IteratorResult<Number> = iter.next();
      let r1: boolean = result.done;
      expect(r1).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_VALUES_TWO_1000
     * @tc.name testInt16ArrayValuesTestTwo010
     * @tc.desc Verify values() next().value sequence equals source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayValuesTestTwo010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([10, 20, 30]);
      let iter: IterableIterator<Number> = arr.values();
      iter.next();
      iter.next();
      let result: IteratorResult<Number> = iter.next();
      let r1: Number | undefined = result.value;
      let e1: int = 30;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_VALUES_TWO_1100
     * @tc.name testInt16ArrayValuesTestTwo011
     * @tc.desc Verify values() next() done/value sequence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayValuesTestTwo011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([10, 20, 30]);
      let iter: IterableIterator<Number> = arr.values();
      iter.next();
      iter.next();
      iter.next();
      let result: IteratorResult<Number> = iter.next();
      let r1: boolean = result.done;
      expect(r1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_VALUES_TWO_1200
     * @tc.name testInt16ArrayValuesTestTwo012
     * @tc.desc Verify values() next().value is undefined when done
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayValuesTestTwo012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([10, 20, 30]);
      let iter: IterableIterator<Number> = arr.values();
      iter.next();
      iter.next();
      iter.next();
      let result: IteratorResult<Number> = iter.next();
      let r1: boolean = result.value === undefined;
      expect(r1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_VALUES_TWO_1300
     * @tc.name testInt16ArrayValuesTestTwo013
     * @tc.desc Verify values() next().value sequence equals source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayValuesTestTwo013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([-5, -10, -15]);
      let iter: IterableIterator<Number> = arr.values();
      let r1: IteratorResult<Number> = iter.next();
      let r2: IteratorResult<Number> = iter.next();
      let r3: IteratorResult<Number> = iter.next();
      let v1: Number | undefined = r1.value;
      let e1: int = -5;
      expect(v1).assertEqual(e1);
      let v2: Number | undefined = r2.value;
      let e2: int = -10;
      expect(v2).assertEqual(e2);
      let v3: Number | undefined = r3.value;
      let e3: int = -15;
      expect(v3).assertEqual(e3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_VALUES_TWO_1400
     * @tc.name testInt16ArrayValuesTestTwo014
     * @tc.desc Verify values() next().value sequence equals source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayValuesTestTwo014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([1000, 2000]);
      let iter: IterableIterator<Number> = arr.values();
      let r1: IteratorResult<Number> = iter.next();
      let r2: IteratorResult<Number> = iter.next();
      let v1: Number | undefined = r1.value;
      let e1: int = 1000;
      expect(v1).assertEqual(e1);
      let v2: Number | undefined = r2.value;
      let e2: int = 2000;
      expect(v2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_VALUES_TWO_1500
     * @tc.name testInt16ArrayValuesTestTwo015
     * @tc.desc Verify values() next().value not null when done false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayValuesTestTwo015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([77]);
      let iter: IterableIterator<Number> = arr.values();
      let result: IteratorResult<Number> = iter.next();
      let r1: boolean = result.value !== null;
      expect(r1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_VALUES_TWO_1600
     * @tc.name testInt16ArrayValuesTestTwo016
     * @tc.desc Verify values() preserves original array properties
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayValuesTestTwo016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([1, 2, 3, 4, 5]);
      let beforeLen: int = arr.length;
      let iter: IterableIterator<Number> = arr.values();
      let r1: int = arr.length;
      let e1: number = beforeLen;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_VALUES_TWO_1700
     * @tc.name testInt16ArrayValuesTestTwo017
     * @tc.desc Verify values() next().value sequence equals source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayValuesTestTwo017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([11, 22, 33, 44]);
      let beforeLen: int = arr.length;
      let iter: IterableIterator<Number> = arr.values();
      iter.next();
      iter.next();
      let r1: int = arr.length;
      let e1: number = beforeLen;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_VALUES_TWO_1800
     * @tc.name testInt16ArrayValuesTestTwo018
     * @tc.desc Verify values() keeps original byteLength unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayValuesTestTwo018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([1, 2, 3]);
      let beforeByteLen: int = arr.byteLength;
      let iter: IterableIterator<Number> = arr.values();
      let r1: int = arr.byteLength;
      let e1: number = beforeByteLen;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_VALUES_TWO_1900
     * @tc.name testInt16ArrayValuesTestTwo019
     * @tc.desc Verify values() keeps original byteOffset unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayValuesTestTwo019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let arr: Int16Array = new Int16Array(buf, 0 as int, 4 as int);
      let beforeOffset: int = arr.byteOffset;
      let iter: IterableIterator<Number> = arr.values();
      let r1: int = arr.byteOffset;
      let e1: number = beforeOffset;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_VALUES_TWO_2000
     * @tc.name testInt16ArrayValuesTestTwo020
     * @tc.desc Verify values() keeps BYTES_PER_ELEMENT unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayValuesTestTwo020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([1, 2]);
      let beforeBpe: int = arr.BYTES_PER_ELEMENT;
      let iter: IterableIterator<Number> = arr.values();
      let r1: int = arr.BYTES_PER_ELEMENT;
      let e1: number = beforeBpe;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_VALUES_TWO_2100
     * @tc.name testInt16ArrayValuesTestTwo021
     * @tc.desc Verify values() full iteration keeps BYTES_PER_ELEMENT unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayValuesTestTwo021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([1, 2, 3]);
      let beforeBpe: int = arr.BYTES_PER_ELEMENT;
      let iter: IterableIterator<Number> = arr.values();
      let _r: IteratorResult<Number> = iter.next();
      while (!_r.done) {
        _r = iter.next();
      }
      let r1: int = arr.BYTES_PER_ELEMENT;
      let e1: number = beforeBpe;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_VALUES_TWO_2200
     * @tc.name testInt16ArrayValuesTestTwo022
     * @tc.desc Verify values() preserves original array properties
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayValuesTestTwo022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([5, 6]);
      let beforeLen: int = arr.length;
      let iter: IterableIterator<Number> = arr.values();
      let r1: int = arr.length;
      let e1: int = beforeLen;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_VALUES_TWO_2300
     * @tc.name testInt16ArrayValuesTestTwo023
     * @tc.desc Verify values() next().value sequence equals source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayValuesTestTwo023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([5, 6, 7]);
      let beforeLen: int = arr.length;
      let iter: IterableIterator<Number> = arr.values();
      let _r: IteratorResult<Number> = iter.next();
      while (!_r.done) {
        _r = iter.next();
      }
      let r1: int = arr.length;
      let e1: int = beforeLen;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_VALUES_TWO_2400
     * @tc.name testInt16ArrayValuesTestTwo024
     * @tc.desc Verify values() keeps original buffer reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayValuesTestTwo024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(6);
      let arr: Int16Array = new Int16Array(buf, 0 as int, 3 as int);
      let beforeBuf: ArrayBuffer = arr.buffer;
      let iter: IterableIterator<Number> = arr.values();
      let r1: boolean = arr.buffer === beforeBuf;
      expect(r1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_VALUES_TWO_2500
     * @tc.name testInt16ArrayValuesTestTwo025
     * @tc.desc Verify values() leaves original array content unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayValuesTestTwo025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([99, 100, 101]);
      let firstBefore: Number = arr.$_get(0 as int);
      let iter: IterableIterator<Number> = arr.values();
      let r1: number = arr.$_get(0 as int);
      let e1: number = firstBefore;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_VALUES_TWO_2600
     * @tc.name testInt16ArrayValuesTestTwo026
     * @tc.desc Verify values() leaves original array content unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayValuesTestTwo026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([11, 22, 33, 44]);
      let midBefore: Number = arr.$_get(2 as int);
      let iter: IterableIterator<Number> = arr.values();
      iter.next();
      iter.next();
      let r1: number = arr.$_get(2 as int);
      let e1: number = midBefore;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_VALUES_TWO_2700
     * @tc.name testInt16ArrayValuesTestTwo027
     * @tc.desc Verify values() next().value sequence equals source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayValuesTestTwo027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([1, 2, 3]);
      let iter1: IterableIterator<Number> = arr.values();
      let iter2: IterableIterator<Number> = arr.values();
      iter1.next();
      let r2: IteratorResult<Number> = iter2.next();
      let r1: Number | undefined = r2.value;
      let e1: int = 1;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_VALUES_TWO_2800
     * @tc.name testInt16ArrayValuesTestTwo028
     * @tc.desc Verify values() independent iterators after consume
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayValuesTestTwo028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([7, 8, 9]);
      let iter1: IterableIterator<Number> = arr.values();
      let iter2: IterableIterator<Number> = arr.values();
      let _r: IteratorResult<Number> = iter1.next();
      while (!_r.done) {
        _r = iter1.next();
      }
      let r = iter2.next();
      let r1: boolean = r.done;
      expect(r1).assertFalse();
      let r2: Number | undefined = r.value;
      let e2: int = 7;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_VALUES_TWO_2900
     * @tc.name testInt16ArrayValuesTestTwo029
     * @tc.desc Verify values() next().value sequence equals source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayValuesTestTwo029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arrA: Int16Array = new Int16Array([100, 200]);
      let arrB: Int16Array = new Int16Array([300, 400]);
      let iterA: IterableIterator<Number> = arrA.values();
      let iterB: IterableIterator<Number> = arrB.values();
      let rA: IteratorResult<Number> = iterA.next();
      let rB: IteratorResult<Number> = iterB.next();
      let r1: Number | undefined = rA.value;
      let e1: int = 100;
      expect(r1).assertEqual(e1);
      let r2: Number | undefined = rB.value;
      let e2: int = 300;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_VALUES_TWO_3000
     * @tc.name testInt16ArrayValuesTestTwo030
     * @tc.desc Verify values() next().value sequence equals source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayValuesTestTwo030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([5, 10]);
      let i1: IterableIterator<Number> = arr.values();
      let i2: IterableIterator<Number> = arr.values();
      let i3: IterableIterator<Number> = arr.values();
      i1.next();
      i1.next();
      let r2: IteratorResult<Number> = i2.next();
      let r3: IteratorResult<Number> = i3.next();
      let r1: Number | undefined = r2.value;
      let e1: int = 5;
      expect(r1).assertEqual(e1);
      let v2: Number | undefined = r3.value;
      let e2: int = 5;
      expect(v2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_VALUES_TWO_3100
     * @tc.name testInt16ArrayValuesTestTwo031
     * @tc.desc Verify values() next().value sequence equals source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayValuesTestTwo031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([1, 2]);
      let iter1: IterableIterator<Number> = arr.values();
      let iter2: IterableIterator<Number> = arr.values();
      let r1: IteratorResult<Number> = iter1.next();
      let r2: IteratorResult<Number> = iter2.next();
      let v1: Number | undefined = r1.value;
      let e1: int = 1;
      expect(v1).assertEqual(e1);
      let v2: Number | undefined = r2.value;
      let e2: int = 1;
      expect(v2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_VALUES_TWO_3200
     * @tc.name testInt16ArrayValuesTestTwo032
     * @tc.desc Verify values() next() done/value sequence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayValuesTestTwo032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([42]);
      let iter: IterableIterator<Number> = arr.values();
      iter.next();
      let r1: IteratorResult<Number> = iter.next();
      let r2: IteratorResult<Number> = iter.next();
      let v1: boolean = r1.done;
      expect(v1).assertTrue();
      let v2: boolean = r2.done;
      expect(v2).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_VALUES_TWO_3300
     * @tc.name testInt16ArrayValuesTestTwo033
     * @tc.desc Verify values() exhausted next().value is undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayValuesTestTwo033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([42]);
      let iter: IterableIterator<Number> = arr.values();
      iter.next();
      iter.next();
      let r: IteratorResult<Number> = iter.next();
      let r1: boolean = r.value === undefined;
      expect(r1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_VALUES_TWO_3400
     * @tc.name testInt16ArrayValuesTestTwo034
     * @tc.desc Verify values() on new Int16Array(length) after $_set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayValuesTestTwo034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array(3);
      arr.$_set(0 as int, 7);
      arr.$_set(1 as int, 8);
      arr.$_set(2 as int, 9);
      let iter: IterableIterator<Number> = arr.values();
      let r: IteratorResult<Number> = iter.next();
      let r1: Number | undefined = r.value;
      let e1: int = 7;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_VALUES_TWO_3500
     * @tc.name testInt16ArrayValuesTestTwo035
     * @tc.desc Verify values() on Int16Array view over ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayValuesTestTwo035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(6);
      let view: Int16Array = new Int16Array(buf, 0 as int, 3 as int);
      view.$_set(0 as int, 1);
      view.$_set(1 as int, 2);
      view.$_set(2 as int, 3);
      let iter: IterableIterator<Number> = view.values();
      let r: IteratorResult<Number> = iter.next();
      let r1: Number | undefined = r.value;
      let e1: int = 1;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_VALUES_TWO_3600
     * @tc.name testInt16ArrayValuesTestTwo036
     * @tc.desc Verify values() next() count equals length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayValuesTestTwo036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([4, 5, 6, 7]);
      let iter: IterableIterator<Number> = arr.values();
      let count: int = 0;
      let r: IteratorResult<Number> = iter.next();
      while (!r.done) {
        count = count + 1;
        r = iter.next();
      }
      let r1: int = count;
      let e1: int = arr.length;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_VALUES_TWO_3700
     * @tc.name testInt16ArrayValuesTestTwo037
     * @tc.desc Verify values() empty array yields no elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayValuesTestTwo037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array(0);
      let iter: IterableIterator<Number> = arr.values();
      let entered: boolean = false;
      let r: IteratorResult<Number> = iter.next();
      while (!r.done) {
        entered = true;
        r = iter.next();
      }
      expect(entered).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_VALUES_TWO_3800
     * @tc.name testInt16ArrayValuesTestTwo038
     * @tc.desc Verify values() sequence matches $_get indices
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayValuesTestTwo038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([30, 60, 90]);
      let iter: IterableIterator<Number> = arr.values();
      let idx: int = 0;
      let allMatch: boolean = true;
      let r: IteratorResult<Number> = iter.next();
      while (!r.done) {
        if (r.value !== arr.$_get(idx as int)) {
          allMatch = false;
        }
        idx = idx + 1;
        r = iter.next();
      }
      expect(allMatch).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_VALUES_TWO_3900
     * @tc.name testInt16ArrayValuesTestTwo039
     * @tc.desc Verify values() next() count equals length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayValuesTestTwo039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([2, 4, 6]);
      let firstSum: number = 0;
      let secondSum: number = 0;
      let iter1: IterableIterator<number> = arr.values();
      let r1: IteratorResult<number> = iter1.next();
      while (!r1.done) {
        firstSum = firstSum + (r1.value as number);
        r1 = iter1.next();
      }
      let iter2: IterableIterator<number> = arr.values();
      let r2: IteratorResult<number> = iter2.next();
      while (!r2.done) {
        secondSum = secondSum + (r2.value as number);
        r2 = iter2.next();
      }
      let v1: number = firstSum;
      let e1: number = secondSum;
      expect(v1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_VALUES_TWO_4000
     * @tc.name testInt16ArrayValuesTestTwo040
     * @tc.desc Verify values() on subarray() yields sub-range first value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayValuesTestTwo040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([10, 20, 30, 40, 50]);
      let sub: Int16Array = arr.subarray(1 as int, 4 as int);
      let iter: IterableIterator<Number> = sub.values();
      let r: IteratorResult<Number> = iter.next();
      let r1: Number | undefined = r.value;
      let e1: int = 20;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_VALUES_TWO_4100
     * @tc.name testInt16ArrayValuesTestTwo041
     * @tc.desc Verify values() on subarray keeps sub length unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayValuesTestTwo041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([10, 20, 30, 40, 50]);
      let sub: Int16Array = arr.subarray(1 as int, 4 as int);
      let beforeLen: int = sub.length;
      let iter: IterableIterator<Number> = sub.values();
      let _r: IteratorResult<Number> = iter.next();
      while (!_r.done) {
        _r = iter.next();
      }
      let r1: int = sub.length;
      let e1: number = beforeLen;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_VALUES_TWO_4200
     * @tc.name testInt16ArrayValuesTestTwo042
     * @tc.desc Verify values() leaves original array content unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayValuesTestTwo042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([10, 20, 30, 40, 50]);
      let sub: Int16Array = arr.subarray(1 as int, 4 as int);
      let beforeFirst: Number = sub.$_get(0 as int);
      let iter: IterableIterator<Number> = sub.values();
      let _r: IteratorResult<Number> = iter.next();
      while (!_r.done) {
        _r = iter.next();
      }
      let r1: number = sub.$_get(0 as int);
      let e1: number = beforeFirst;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_VALUES_TWO_4300
     * @tc.name testInt16ArrayValuesTestTwo043
     * @tc.desc Verify values() next() done/value sequence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayValuesTestTwo043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([5]);
      let iter: IterableIterator<Number> = arr.values();
      let r1: IteratorResult<Number> = iter.next();
      let r2: IteratorResult<Number> = iter.next();
      let r3: IteratorResult<Number> = iter.next();
      let transOk: boolean = !r1.done && r2.done && r3.done;
      expect(transOk).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_VALUES_TWO_4400
     * @tc.name testInt16ArrayValuesTestTwo044
     * @tc.desc Verify values() next().value sequence equals source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayValuesTestTwo044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([1, 2, 3, 4, 5]);
      let iter: IterableIterator<Number> = arr.values();
      let count: int = 0;
      let r: IteratorResult<Number> = iter.next();
      while (!r.done) {
        count = count + 1;
        r = iter.next();
      }
      expect(count).assertEqual(arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_VALUES_TWO_4500
     * @tc.name testInt16ArrayValuesTestTwo045
     * @tc.desc Verify values() single-element requires two next calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayValuesTestTwo045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([99]);
      let iter: IterableIterator<Number> = arr.values();
      let callCount: int = 0;
      let r: IteratorResult<Number> = iter.next();
      callCount = callCount + 1;
      if (!r.done) {
        r = iter.next();
        callCount = callCount + 1;
      }
      expect(callCount).assertEqual(2);
    });
  });
}
