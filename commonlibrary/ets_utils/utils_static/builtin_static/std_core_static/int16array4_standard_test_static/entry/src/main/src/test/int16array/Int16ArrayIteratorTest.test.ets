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
  TestType
} from '../../../../hypium/index';

import Utils from './../Util.test';

export default function Int16ArrayIteratorTest(): void {
  describe('Int16ArrayIteratorTest', (): void => {
    beforeAll((): void => {
    });
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });
    afterEach((): void => {
    });
    afterAll((): void => {
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_ITERATOR_0100
     * @tc.name testIteratorGeneral001
     * @tc.desc Verify $_iterator basic iteration behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testIteratorGeneral001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let arr: Int16Array = new Int16Array(0);
        let iter: IterableIterator<Number> = arr.$_iterator();
        let resultValue2: boolean = iter !== null;
        expect(resultValue2).assertTrue();
        let resultValue1: boolean = iter.next().done;
        expect(resultValue1).assertTrue();

      }
      {
        let arr: Int16Array = new Int16Array([1]);
        let iter: IterableIterator<Number> = arr.$_iterator();
        let resultValue3: boolean = iter !== null;
        expect(resultValue3).assertTrue();
        let result: IteratorResult<Number> = iter.next();
        let resultValue1: boolean = result.done;
        expect(resultValue1).assertFalse();
        let resultValue2: Number | undefined = result.value;
        let expectedValue2: int = 1;
        expect(resultValue2).assertEqual(expectedValue2);

      }
      {
        let arr: Int16Array = new Int16Array([1, 2, 3]);
        let iter: IterableIterator<Number> = arr.$_iterator();
        let resultValue2: boolean = iter !== null;
        expect(resultValue2).assertTrue();
        let resultValue1: Number | undefined = iter.next().value;
        let expectedValue1: int = 1;
        expect(resultValue1).assertEqual(expectedValue1);

      }
      {
        let arr: Int16Array = new Int16Array([-1, -100]);
        let iter: IterableIterator<Number> = arr.$_iterator();
        let resultValue2: boolean = iter !== null;
        expect(resultValue2).assertTrue();
        let resultValue1: Number | undefined = iter.next().value;
        let expectedValue1: int = -1;
        expect(resultValue1).assertEqual(expectedValue1);

      }
      {
        let arr: Int16Array = new Int16Array([0, 0, 0]);
        let iter: IterableIterator<Number> = arr.$_iterator();
        let resultValue2: boolean = iter !== null;
        expect(resultValue2).assertTrue();
        let resultValue1: Number | undefined = iter.next().value;
        let expectedValue1: int = 0;
        expect(resultValue1).assertEqual(expectedValue1);

      }
      {
        let arr: Int16Array = new Int16Array([-32768, 0, 32767]);
        let iter: IterableIterator<Number> = arr.$_iterator();
        let resultValue2: boolean = iter !== null;
        expect(resultValue2).assertTrue();
        let resultValue1: Number | undefined = iter.next().value;
        let expectedValue1: int = -32768;
        expect(resultValue1).assertEqual(expectedValue1);

      }
      {
        let arr: Int16Array = new Int16Array([7, 7, 7, 7]);
        let iter: IterableIterator<Number> = arr.$_iterator();
        let resultValue2: boolean = iter !== null;
        expect(resultValue2).assertTrue();
        let resultValue1: Number | undefined = iter.next().value;
        let expectedValue1: int = 7;
        expect(resultValue1).assertEqual(expectedValue1);

      }
      {
        let arr: Int16Array = new Int16Array(1);
        let iter: IterableIterator<Number> = arr.$_iterator();
        let resultValue2: boolean = iter !== null;
        expect(resultValue2).assertTrue();
        let r: IteratorResult<Number> = iter.next();
        let resultValue1: Number | undefined = r.value;
        let expectedValue1: int = 0;
        expect(resultValue1).assertEqual(expectedValue1);

      }
      {
        let arr: Int16Array = new Int16Array(1);
        arr.$_set(0, 99);
        let iter: IterableIterator<Number> = arr.$_iterator();
        let resultValue2: boolean = iter !== null;
        expect(resultValue2).assertTrue();
        let resultValue1: Number | undefined = iter.next().value;
        let expectedValue1: int = 99;
        expect(resultValue1).assertEqual(expectedValue1);

      }
      {
        let arr: Int16Array = new Int16Array([-1, 1]);
        let iter: IterableIterator<Number> = arr.$_iterator();
        let resultValue2: boolean = iter !== null;
        expect(resultValue2).assertTrue();
        let resultValue1: Number | undefined = iter.next().value;
        let expectedValue1: int = -1;
        expect(resultValue1).assertEqual(expectedValue1);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_ITERATOR_0200
     * @tc.name testIteratorGeneral002
     * @tc.desc Verify $_iterator basic iteration behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testIteratorGeneral002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let arr: Int16Array = new Int16Array([100, 200, 300]);
        let iter: IterableIterator<Number> = arr.$_iterator();
        let resultValue2: boolean = iter !== null;
        expect(resultValue2).assertTrue();
        let resultValue1: Number | undefined = iter.next().value;
        let expectedValue1: int = 100;
        expect(resultValue1).assertEqual(expectedValue1);

      }
      {
        let src: int[] = [];
        for (let i = 0; i < 100; i++) { src.push(i); }
        let arr: Int16Array = new Int16Array(src);
        let iter: IterableIterator<Number> = arr.$_iterator();
        let resultValue2: boolean = iter !== null;
        expect(resultValue2).assertTrue();
        let resultValue1: Number | undefined = iter.next().value;
        let expectedValue1: int = 0;
        expect(resultValue1).assertEqual(expectedValue1);

      }
      {
        let src = new Int16Array([5, 10, 15]);
        let arr: Int16Array = new Int16Array(src);
        let iter: IterableIterator<Number> = arr.$_iterator();
        let resultValue2: boolean = iter !== null;
        expect(resultValue2).assertTrue();
        let resultValue1: Number | undefined = iter.next().value;
        let expectedValue1: int = 5;
        expect(resultValue1).assertEqual(expectedValue1);

      }
      {
        let arr: Int16Array = new Int16Array([1]);
        let iter: IterableIterator<Number> = arr.$_iterator();
        let resultValue1: boolean = iter !== null;
        expect(resultValue1).assertTrue();
        let hasNext = iter.next;
        let resultValue2: boolean = hasNext !== null;
        expect(resultValue2).assertTrue();

      }
      {
        let arr: Int16Array = Int16Array.of(1, 2, 3);
        let iter = arr.$_iterator();
        let result: IteratorResult<Number> = iter.next();
        expect(result.done).assertFalse();
        expect(result.value).assertEqual(1);

      }
      {
        let arr: Int16Array = Int16Array.of(15, 25, 35);
        let firstBefore: number = arr.$_get(0);
        arr.$_iterator();
        let resultValue1: number = arr.$_get(0);
        let expectedValue1: number = firstBefore;
        expect(resultValue1).assertEqual(expectedValue1);

      }
      {
        let arr: Int16Array = Int16Array.of(15, 25, 35);
        let firstBefore: number = arr.$_get(0);
        let iter = arr.$_iterator();
        iter.next();
        iter.next();
        iter.next();
        let resultValue1: number = arr.$_get(0);
        let expectedValue1: number = firstBefore;
        expect(resultValue1).assertEqual(expectedValue1);

      }
      {
        let arr: Int16Array = Int16Array.of(-5, 0, 5);
        let midBefore: number = arr.$_get(1);
        arr.$_iterator();
        arr.$_iterator();
        let resultValue1: number = arr.$_get(1);
        let expectedValue1: number = midBefore;
        expect(resultValue1).assertEqual(expectedValue1);

      }
      {
        let arr: Int16Array = Int16Array.of(10, 20, 30);
        let iterA = arr.$_iterator();
        let iterB = arr.$_iterator();
        iterA.next();
        let resultB = iterB.next();
        let resultValue1: Number | undefined = resultB.value;
        let expectedValue1: number = arr.$_get(0);
        expect(resultValue1).assertEqual(expectedValue1);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_ITERATOR_0300
     * @tc.name testIteratorNext001
     * @tc.desc Verify $_iterator next() value sequence and done state
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testIteratorNext001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let arr: Int16Array = new Int16Array([0, 0, 0]);
        let iter: IterableIterator<Number> = arr.$_iterator();
        let resultValue3: boolean = iter !== null;
        expect(resultValue3).assertTrue();
        let r1 = iter.next();
        let resultValue1: Number | undefined = r1.value;
        let expectedValue1: int = 0;
        expect(resultValue1).assertEqual(expectedValue1);
        let r2 = iter.next();
        let resultValue2: Number | undefined = r2.value;
        let expectedValue2: int = 0;
        expect(resultValue2).assertEqual(expectedValue2);

      }
      {
        let arr: Int16Array = new Int16Array([10, 20, 30]);
        let iter: IterableIterator<Number> = arr.$_iterator();
        let resultValue2: boolean = iter !== null;
        expect(resultValue2).assertTrue();
        let resultValue1: Number | undefined = iter.next().value;
        let expectedValue1: int = 10;
        expect(resultValue1).assertEqual(expectedValue1);

      }
      {
        let arr: Int16Array = new Int16Array([-5, -15, -25]);
        let iter: IterableIterator<Number> = arr.$_iterator();
        let resultValue2: boolean = iter !== null;
        expect(resultValue2).assertTrue();
        let resultValue1: Number | undefined = iter.next().value;
        let expectedValue1: int = -5;
        expect(resultValue1).assertEqual(expectedValue1);

      }
      {
        let arr: Int16Array = new Int16Array([-32768, -1, 0, 1, 32767]);
        let iter: IterableIterator<Number> = arr.$_iterator();
        let resultValue2: boolean = iter !== null;
        expect(resultValue2).assertTrue();
        let resultValue1: Number | undefined = iter.next().value;
        let expectedValue1: int = -32768;
        expect(resultValue1).assertEqual(expectedValue1);

      }
      {
        let arr: Int16Array = new Int16Array([42, 42, 42]);
        let iter: IterableIterator<Number> = arr.$_iterator();
        let resultValue2: boolean = iter !== null;
        expect(resultValue2).assertTrue();
        let resultValue1: Number | undefined = iter.next().value;
        let expectedValue1: int = 42;
        expect(resultValue1).assertEqual(expectedValue1);

      }
      {
        let arr: Int16Array = new Int16Array(3);
        let iter: IterableIterator<Number> = arr.$_iterator();
        let resultValue2: boolean = iter !== null;
        expect(resultValue2).assertTrue();
        let resultValue1: Number | undefined = iter.next().value;
        let expectedValue1: int = 0;
        expect(resultValue1).assertEqual(expectedValue1);

      }
      {
        let arr: Int16Array = new Int16Array([3.7, -3.7]);
        let iter: IterableIterator<Number> = arr.$_iterator();
        let resultValue2: boolean = iter !== null;
        expect(resultValue2).assertTrue();
        let resultValue1: Number | undefined = iter.next().value;
        let expectedValue1: int = 3;
        expect(resultValue1).assertEqual(expectedValue1);

      }
      {
        let arr: Int16Array = new Int16Array([32768]);
        let iter: IterableIterator<Number> = arr.$_iterator();
        let resultValue2: boolean = iter !== null;
        expect(resultValue2).assertTrue();
        let resultValue1: Number | undefined = iter.next().value;
        let expectedValue1: int = -32768;
        expect(resultValue1).assertEqual(expectedValue1);

      }
      {
        let arr: Int16Array = new Int16Array([-32769]);
        let iter: IterableIterator<Number> = arr.$_iterator();
        let resultValue2: boolean = iter !== null;
        expect(resultValue2).assertTrue();
        let resultValue1: Number | undefined = iter.next().value;
        let expectedValue1: int = 32767;
        expect(resultValue1).assertEqual(expectedValue1);

      }
      {
        let arr: Int16Array = new Int16Array([42]);
        let iter: IterableIterator<Number> = arr.$_iterator();
        let result: IteratorResult<Number> = iter.next();
        let resultValue1: boolean = result.done;
        expect(resultValue1).assertFalse();
        let resultValue2: Number | undefined = result.value;
        let expectedValue2: int = 42;
        expect(resultValue2).assertEqual(expectedValue2);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_ITERATOR_0400
     * @tc.name testIteratorNext002
     * @tc.desc Verify $_iterator next() value sequence and done state
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testIteratorNext002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let arr: Int16Array = Int16Array.of(99);
        let iter = arr.$_iterator();
        let result: IteratorResult<Number> = iter.next();
        expect(result.done).assertFalse();
        expect(result.value).assertEqual(99);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_ITERATOR_0500
     * @tc.name testIteratorSource001
     * @tc.desc Verify $_iterator on Int16Array built from various constructors and mutations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testIteratorSource001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let arr: Int16Array = new Int16Array([10, 20]);
        let iter: IterableIterator<Number> = arr.$_iterator();
        let resultValue2: boolean = iter !== null;
        expect(resultValue2).assertTrue();
        let resultValue1: Number | undefined = iter.next().value;
        let expectedValue1: int = 10;
        expect(resultValue1).assertEqual(expectedValue1);

      }
      {
        let buf: ArrayBuffer = new ArrayBuffer(4);
        let arr: Int16Array = new Int16Array(buf);
        let iter: IterableIterator<Number> = arr.$_iterator();
        let resultValue1: boolean = iter !== null;
        expect(resultValue1).assertTrue();

      }
      {
        let buf: ArrayBuffer = new ArrayBuffer(6);
        let arr: Int16Array = new Int16Array(buf, 2, 2);
        arr.$_set(0, 99);
        let iter: IterableIterator<Number> = arr.$_iterator();
        let resultValue2: boolean = iter !== null;
        expect(resultValue2).assertTrue();
        let resultValue1: Number | undefined = iter.next().value;
        let expectedValue1: int = 99;
        expect(resultValue1).assertEqual(expectedValue1);

      }
      {
        let arr: Int16Array = new Int16Array([50, 60, 70]);
        let iter: IterableIterator<Number> = arr.$_iterator();
        let resultValue2: boolean = iter !== null;
        expect(resultValue2).assertTrue();
        let resultValue1: Number | undefined = iter.next().value;
        let expectedValue1: int = 50;
        expect(resultValue1).assertEqual(expectedValue1);

      }
      {
        let arr: Int16Array = new Int16Array([80, 90]);
        let iter: IterableIterator<Number> = arr.$_iterator();
        let resultValue2: boolean = iter !== null;
        expect(resultValue2).assertTrue();
        let resultValue1: Number | undefined = iter.next().value;
        let expectedValue1: int = 80;
        expect(resultValue1).assertEqual(expectedValue1);

      }
      {
        let buf: ArrayBuffer = new ArrayBuffer(4);
        let view = new Int16Array(buf);
        view.$_set(0, 123);
        let iter = view.$_iterator();
        let resultValue2: boolean = iter !== null;
        expect(resultValue2).assertTrue();
        let resultValue1: Number | undefined = iter.next().value;
        let expectedValue1: int = 123;
        expect(resultValue1).assertEqual(expectedValue1);

      }
      {
        let buf: ArrayBuffer = new ArrayBuffer(8);
        let view = new Int16Array(buf, 2, 2);
        view.$_set(0, 456);
        let iter = view.$_iterator();
        let resultValue2: boolean = iter !== null;
        expect(resultValue2).assertTrue();
        let resultValue1: Number | undefined = iter.next().value;
        let expectedValue1: int = 456;
        expect(resultValue1).assertEqual(expectedValue1);

      }
      {
        let src = new Int16Array([10, 20, 30, 40]);
        let sub = src.subarray(1, 3);
        let iter = sub.$_iterator();
        let resultValue2: boolean = iter !== null;
        expect(resultValue2).assertTrue();
        let resultValue1: Number | undefined = iter.next().value;
        let expectedValue1: int = 20;
        expect(resultValue1).assertEqual(expectedValue1);

      }
      {
        let arr: Int16Array = new Int16Array(3);
        arr.fill(99);
        let iter: IterableIterator<Number> = arr.$_iterator();
        let resultValue2: boolean = iter !== null;
        expect(resultValue2).assertTrue();
        let resultValue1: Number | undefined = iter.next().value;
        let expectedValue1: int = 99;
        expect(resultValue1).assertEqual(expectedValue1);

      }
      {
        let arr: Int16Array = new Int16Array([1, 2, 3]);
        arr.reverse();
        let iter: IterableIterator<Number> = arr.$_iterator();
        let resultValue2: boolean = iter !== null;
        expect(resultValue2).assertTrue();
        let resultValue1: Number | undefined = iter.next().value;
        let expectedValue1: int = 3;
        expect(resultValue1).assertEqual(expectedValue1);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_ITERATOR_0600
     * @tc.name testIteratorSource002
     * @tc.desc Verify $_iterator on Int16Array built from various constructors and mutations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testIteratorSource002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let arr: Int16Array = new Int16Array([0, 0, 0]);
        arr.set(new Int16Array([7, 8, 9]));
        let iter: IterableIterator<Number> = arr.$_iterator();
        let resultValue2: boolean = iter !== null;
        expect(resultValue2).assertTrue();
        let resultValue1: Number | undefined = iter.next().value;
        let expectedValue1: int = 7;
        expect(resultValue1).assertEqual(expectedValue1);

      }
      {
        let arr: Int16Array = new Int16Array([1, 2, 3, 4]);
        arr.copyWithin(0, 2);
        let iter: IterableIterator<Number> = arr.$_iterator();
        let resultValue2: boolean = iter !== null;
        expect(resultValue2).assertTrue();
        let resultValue1: Number | undefined = iter.next().value;
        let expectedValue1: int = 3;
        expect(resultValue1).assertEqual(expectedValue1);

      }
      {
        let buf: ArrayBuffer = new ArrayBuffer(6);
        let view: Int16Array = new Int16Array(buf);
        view.$_set(0, 88);
        view.$_set(1, 99);
        let iter = view.$_iterator();
        let result = iter.next();
        let resultValue1: Number | undefined = result.value;
        let expectedValue1: number = 88;
        expect(resultValue1).assertEqual(expectedValue1);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_ITERATOR_0700
     * @tc.name testIteratorBoundary001
     * @tc.desc Verify $_iterator with NaN Infinity and Int16 boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testIteratorBoundary001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let arr: Int16Array = new Int16Array([-32768]);
        let iter: IterableIterator<Number> = arr.$_iterator();
        let resultValue2: boolean = iter !== null;
        expect(resultValue2).assertTrue();
        let r: IteratorResult<Number> = iter.next();
        let resultValue1: Number | undefined = r.value;
        let expectedValue1: int = -32768;
        expect(resultValue1).assertEqual(expectedValue1);

      }
      {
        let arr: Int16Array = new Int16Array([32767]);
        let iter: IterableIterator<Number> = arr.$_iterator();
        let resultValue2: boolean = iter !== null;
        expect(resultValue2).assertTrue();
        let r: IteratorResult<Number> = iter.next();
        let resultValue1: Number | undefined = r.value;
        let expectedValue1: int = 32767;
        expect(resultValue1).assertEqual(expectedValue1);

      }
      {
        let arr: Int16Array = new Int16Array([-32768]);
        let iter: IterableIterator<Number> = arr.$_iterator();
        let resultValue2: boolean = iter !== null;
        expect(resultValue2).assertTrue();
        let resultValue1: Number | undefined = iter.next().value;
        let expectedValue1: int = -32768;
        expect(resultValue1).assertEqual(expectedValue1);

      }
      {
        let arr: Int16Array = new Int16Array([32767]);
        let iter: IterableIterator<Number> = arr.$_iterator();
        let resultValue2: boolean = iter !== null;
        expect(resultValue2).assertTrue();
        let resultValue1: Number | undefined = iter.next().value;
        let expectedValue1: int = 32767;
        expect(resultValue1).assertEqual(expectedValue1);

      }
      {
        let arr: Int16Array = new Int16Array([Number.NaN]);
        let iter: IterableIterator<Number> = arr.$_iterator();
        let resultValue2: boolean = iter !== null;
        expect(resultValue2).assertTrue();
        let resultValue1: Number | undefined = iter.next().value;
        let expectedValue1: int = 0;
        expect(resultValue1).assertEqual(expectedValue1);

      }
      {
        let arr: Int16Array = new Int16Array([Number.POSITIVE_INFINITY]);
        let iter: IterableIterator<Number> = arr.$_iterator();
        let resultValue2: boolean = iter !== null;
        expect(resultValue2).assertTrue();
        let resultValue1: Number | undefined = iter.next().value;
        let expectedValue1: int = 0;
        expect(resultValue1).assertEqual(expectedValue1);

      }
      {
        let arr: Int16Array = new Int16Array([-Number.POSITIVE_INFINITY]);
        let iter: IterableIterator<Number> = arr.$_iterator();
        let resultValue2: boolean = iter !== null;
        expect(resultValue2).assertTrue();
        let resultValue1: Number | undefined = iter.next().value;
        let expectedValue1: int = 0;
        expect(resultValue1).assertEqual(expectedValue1);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_ITERATOR_0800
     * @tc.name testIteratorForOf001
     * @tc.desc Verify for-of iteration over $_iterator results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testIteratorForOf001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let arr: Int16Array = Int16Array.of(77);
        let count: number = 0;
        for (let v of arr) {
          count = count + 1;
        }
        let resultValue1: number = count;
        let expectedValue1: number = 1;
        expect(resultValue1).assertEqual(expectedValue1);

      }
      {
        let arr: Int16Array = Int16Array.of(-50, -30, -10);
        let sum: number = 0;
        for (let v of arr) {
          sum = sum + (v as number);
        }
        let resultValue1: number = sum;
        let expectedValue1: number = -90;
        expect(resultValue1).assertEqual(expectedValue1);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_ITERATOR_0900
     * @tc.name testIteratorEmpty001
     * @tc.desc Verify $_iterator on empty Int16Array is immediately done
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testIteratorEmpty001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let empty: Int16Array = new Int16Array(0);
        let iter = empty.$_iterator();
        let result: IteratorResult<Number> = iter.next();
        expect(result.done).assertTrue();

      }
      {
        let arr: Int16Array = Int16Array.of(10, 20, 30);
        let iter = arr.$_iterator();
        let result = iter.next();
        let resultValue1: Number | undefined = result.value;
        let expectedValue1: number = arr.$_get(0);
        expect(resultValue1).assertEqual(expectedValue1);

      }
      {
        let empty: Int16Array = new Int16Array(0);
        let iter = empty.$_iterator();
        let result = iter.next();
        let resultValue1: boolean = result.done;
        expect(resultValue1).assertTrue();

      }
      {
        let empty: Int16Array = new Int16Array(0);
        let iter = empty.$_iterator();
        let result = iter.next();
        expect(result.value).assertUndefined();

      }
      {
        let empty: Int16Array = new Int16Array(0);
        empty.$_iterator();
        let resultValue1: number = empty.length;
        let expectedValue1: int = 0;
        expect(resultValue1).assertEqual(expectedValue1);

      }
      {
        let empty: Int16Array = new Int16Array(0);
        let count: number = 0;
        for (let v of empty) {
          count = count + 1;
        }
        let resultValue1: number = count;
        let expectedValue1: number = 0;
        expect(resultValue1).assertEqual(expectedValue1);

      }
      {
        let empty: Int16Array = new Int16Array(0);
        let iterA = empty.$_iterator();
        let iterB = empty.$_iterator();
        iterA.next();
        let resultB = iterB.next();
        let resultValue1: boolean = resultB.done;
        expect(resultValue1).assertTrue();

      }
    });

  });
}
