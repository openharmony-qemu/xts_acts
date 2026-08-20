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
  beforeAll,
  beforeEach,
  afterEach,
  afterAll,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType,
} from '../../../../hypium/index';
import Utils from '../Util.test';

export default function int16ArrayKeysTestOneTest(): void {
  describe('Int16ArrayKeysTestOneTest', (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_KEYS_ONE_0100
     * @tc.name testInt16ArrayKeysTestOne001
     * @tc.desc Verify keys() iterator yields key 0 first
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayKeysTestOne001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([10, 20, 30]);
      let iter: IterableIterator<int> = arr.keys();
      expect(iter.next().value!).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_KEYS_ONE_0200
     * @tc.name testInt16ArrayKeysTestOne002
     * @tc.desc Verify new Int16Array() keys() next done true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayKeysTestOne002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array();
      let iter: IterableIterator<int> = arr.keys();
      let result: IteratorResult<int> = iter.next();
      let actual1: boolean = result.done;
      expect(actual1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_KEYS_ONE_0300
     * @tc.name testInt16ArrayKeysTestOne003
     * @tc.desc Verify new Int16Array keys() next done true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayKeysTestOne003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: int[] = [];
      let arr: Int16Array = new Int16Array(src);
      let iter: IterableIterator<int> = arr.keys();
      let result: IteratorResult<int> = iter.next();
      let actual1: boolean = result.done;
      expect(actual1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_KEYS_ONE_0400
     * @tc.name testInt16ArrayKeysTestOne004
     * @tc.desc Verify keys() first value is 0 for length 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayKeysTestOne004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array(1);
      let iter: IterableIterator<int> = arr.keys();
      let result: IteratorResult<int> = iter.next();
      let actual1: int | undefined = result.value;
      expect(actual1).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_KEYS_ONE_0500
     * @tc.name testInt16ArrayKeysTestOne005
     * @tc.desc Verify keys() first done is false for length 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayKeysTestOne005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([0]);
      let iter: IterableIterator<int> = arr.keys();
      let result: IteratorResult<int> = iter.next();
      let actual1: boolean = result.done;
      expect(actual1).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_KEYS_ONE_0600
     * @tc.name testInt16ArrayKeysTestOne006
     * @tc.desc Verify keys() second next done true for length 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayKeysTestOne006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([5]);
      let iter: IterableIterator<int> = arr.keys();
      iter.next();
      let result: IteratorResult<int> = iter.next();
      let actual1: boolean = result.done;
      expect(actual1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_KEYS_ONE_0700
     * @tc.name testInt16ArrayKeysTestOne007
     * @tc.desc Verify keys() first value is 0 for length 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayKeysTestOne007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array(2);
      let iter: IterableIterator<int> = arr.keys();
      let result: IteratorResult<int> = iter.next();
      let actual1: int | undefined = result.value;
      expect(actual1).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_KEYS_ONE_0800
     * @tc.name testInt16ArrayKeysTestOne008
     * @tc.desc Verify keys() second value is 1 for length 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayKeysTestOne008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([1, 2]);
      let iter: IterableIterator<int> = arr.keys();
      iter.next();
      let result: IteratorResult<int> = iter.next();
      let actual1: int | undefined = result.value;
      expect(actual1).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_KEYS_ONE_0900
     * @tc.name testInt16ArrayKeysTestOne009
     * @tc.desc Verify keys() third next done true for length 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayKeysTestOne009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([0, 0]);
      let iter: IterableIterator<int> = arr.keys();
      iter.next();
      iter.next();
      let result: IteratorResult<int> = iter.next();
      let actual1: boolean = result.done;
      expect(actual1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_KEYS_ONE_1000
     * @tc.name testInt16ArrayKeysTestOne010
     * @tc.desc Verify keys() first done is false for length 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayKeysTestOne010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array(3);
      let iter: IterableIterator<int> = arr.keys();
      let result: IteratorResult<int> = iter.next();
      let actual1: boolean = result.done;
      expect(actual1).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_KEYS_ONE_1100
     * @tc.name testInt16ArrayKeysTestOne011
     * @tc.desc Verify keys() next values are 0 1 2 for length 3 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayKeysTestOne011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([10, 20, 30]);
      let iter: IterableIterator<int> = arr.keys();
      let result: IteratorResult<int> = iter.next();
      let actual1: int | undefined = result.value;
      expect(actual1).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_KEYS_ONE_1200
     * @tc.name testInt16ArrayKeysTestOne012
     * @tc.desc Verify keys() next values are 0 1 2 for length 3 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayKeysTestOne012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([7, 8, 9]);
      let iter: IterableIterator<int> = arr.keys();
      iter.next();
      let result: IteratorResult<int> = iter.next();
      let actual1: int | undefined = result.value;
      expect(actual1).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_KEYS_ONE_1300
     * @tc.name testInt16ArrayKeysTestOne013
     * @tc.desc Verify keys() next values are 0 1 2 for length 3 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayKeysTestOne013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([-1, 0, 1]);
      let iter: IterableIterator<int> = arr.keys();
      iter.next();
      iter.next();
      let result: IteratorResult<int> = iter.next();
      let actual1: int | undefined = result.value;
      expect(actual1).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_KEYS_ONE_1400
     * @tc.name testInt16ArrayKeysTestOne014
     * @tc.desc Verify keys() fourth next done true for length 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayKeysTestOne014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array(3);
      let iter: IterableIterator<int> = arr.keys();
      iter.next();
      iter.next();
      iter.next();
      let result: IteratorResult<int> = iter.next();
      let actual1: boolean = result.done;
      expect(actual1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_KEYS_ONE_1500
     * @tc.name testInt16ArrayKeysTestOne015
     * @tc.desc Verify keys() next returns expected index sequence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayKeysTestOne015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([100, 200, 300]);
      let iter: IterableIterator<int> = arr.keys();
      let r0: IteratorResult<int> = iter.next();
      let r1: IteratorResult<int> = iter.next();
      let r2: IteratorResult<int> = iter.next();
      let actual1: int | undefined = r0.value;
      expect(actual1).assertEqual(0);
      let actual2: int | undefined = r1.value;
      expect(actual2).assertEqual(1);
      let actual3: int | undefined = r2.value;
      expect(actual3).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_KEYS_ONE_1600
     * @tc.name testInt16ArrayKeysTestOne016
     * @tc.desc Verify keys() next value 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayKeysTestOne016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array(100);
      let iter: IterableIterator<int> = arr.keys();
      let result: IteratorResult<int> = iter.next();
      let actual1: int | undefined = result.value;
      expect(actual1).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_KEYS_ONE_1700
     * @tc.name testInt16ArrayKeysTestOne017
     * @tc.desc Verify keys() next value 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayKeysTestOne017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array(100);
      let iter: IterableIterator<int> = arr.keys();
      for (let i = 0; i < 99; i++) {
        iter.next();
      }
      let result: IteratorResult<int> = iter.next();
      let actual1: int | undefined = result.value;
      expect(actual1).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_KEYS_ONE_1800
     * @tc.name testInt16ArrayKeysTestOne018
     * @tc.desc Verify keys() next done true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayKeysTestOne018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array(100);
      let iter: IterableIterator<int> = arr.keys();
      for (let i = 0; i < 100; i++) {
        iter.next();
      }
      let result: IteratorResult<int> = iter.next();
      let actual1: boolean = result.done;
      expect(actual1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_KEYS_ONE_1900
     * @tc.name testInt16ArrayKeysTestOne019
     * @tc.desc Verify new Int16Array keys() next value 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayKeysTestOne019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([5, 6, 7, 8]);
      let iter: IterableIterator<int> = arr.keys();
      let result: IteratorResult<int> = iter.next();
      let actual1: int | undefined = result.value;
      expect(actual1).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_KEYS_ONE_2000
     * @tc.name testInt16ArrayKeysTestOne020
     * @tc.desc Verify new Int16Array keys() next value 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayKeysTestOne020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([5, 6, 7, 8]);
      let iter: IterableIterator<int> = arr.keys();
      iter.next();
      iter.next();
      iter.next();
      let result: IteratorResult<int> = iter.next();
      let actual1: int | undefined = result.value;
      expect(actual1).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_KEYS_ONE_2100
     * @tc.name testInt16ArrayKeysTestOne021
     * @tc.desc Verify new Int16Array(other) keys() next value 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayKeysTestOne021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let original: Int16Array = new Int16Array([4, 5, 6]);
      let arr: Int16Array = new Int16Array(original);
      let iter: IterableIterator<int> = arr.keys();
      let result: IteratorResult<int> = iter.next();
      let actual1: int | undefined = result.value;
      expect(actual1).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_KEYS_ONE_2200
     * @tc.name testInt16ArrayKeysTestOne022
     * @tc.desc Verify new Int16Array(other) keys() next value 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayKeysTestOne022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let original: Int16Array = new Int16Array([4, 5, 6]);
      let arr: Int16Array = new Int16Array(original);
      let iter: IterableIterator<int> = arr.keys();
      iter.next();
      iter.next();
      let result: IteratorResult<int> = iter.next();
      let actual1: int | undefined = result.value;
      expect(actual1).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_KEYS_ONE_2300
     * @tc.name testInt16ArrayKeysTestOne023
     * @tc.desc Verify Buffer keys() next value 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayKeysTestOne023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(6);
      let arr: Int16Array = new Int16Array(buf, 0, 3);
      let iter: IterableIterator<int> = arr.keys();
      let result: IteratorResult<int> = iter.next();
      let actual1: int | undefined = result.value;
      expect(actual1).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_KEYS_ONE_2400
     * @tc.name testInt16ArrayKeysTestOne024
     * @tc.desc Verify Buffer keys() next value 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayKeysTestOne024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(6);
      let arr: Int16Array = new Int16Array(buf, 0, 3);
      let iter: IterableIterator<int> = arr.keys();
      iter.next();
      iter.next();
      let result: IteratorResult<int> = iter.next();
      let actual1: int | undefined = result.value;
      expect(actual1).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_KEYS_ONE_2500
     * @tc.name testInt16ArrayKeysTestOne025
     * @tc.desc Verify keys() next returns expected index sequence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayKeysTestOne025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let arr: Int16Array = new Int16Array(buf, 2, 2);
      let iter: IterableIterator<int> = arr.keys();
      let r0: IteratorResult<int> = iter.next();
      let r1: IteratorResult<int> = iter.next();
      let actual1: int | undefined = r0.value;
      expect(actual1).assertEqual(0);
      let actual2: int | undefined = r1.value;
      expect(actual2).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_KEYS_ONE_2600
     * @tc.name testInt16ArrayKeysTestOne026
     * @tc.desc Verify Buffer keys() next done true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayKeysTestOne026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(0);
      let arr: Int16Array = new Int16Array(buf, 0, 0);
      let iter: IterableIterator<int> = arr.keys();
      let result: IteratorResult<int> = iter.next();
      let actual1: boolean = result.done;
      expect(actual1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_KEYS_ONE_2700
     * @tc.name testInt16ArrayKeysTestOne027
     * @tc.desc Verify keys() for-of iteration count equals length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayKeysTestOne027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([1, 2, 3]);
      let count: int = 0;
      for (let key of arr.keys()) {
        count = count + 1;
      }
      expect(count).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_KEYS_ONE_2800
     * @tc.name testInt16ArrayKeysTestOne028
     * @tc.desc Verify keys() for-of iteration count equals length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayKeysTestOne028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array(0);
      let entered: boolean = false;
      for (let key of arr.keys()) {
        entered = true;
      }
      expect(entered).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_KEYS_ONE_2900
     * @tc.name testInt16ArrayKeysTestOne029
     * @tc.desc Verify keys() next done true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayKeysTestOne029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array(0);
      let iter: IterableIterator<int> = arr.keys();
      let r1: IteratorResult<int> = iter.next();
      let r2: IteratorResult<int> = iter.next();
      let r3: IteratorResult<int> = iter.next();
      let actual1: boolean = r1.done;
      expect(actual1).assertTrue();
      let actual2: boolean = r2.done;
      expect(actual2).assertTrue();
      let actual3: boolean = r3.done;
      expect(actual3).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_KEYS_ONE_3000
     * @tc.name testInt16ArrayKeysTestOne030
     * @tc.desc Verify keys() next returns expected index sequence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayKeysTestOne030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([1, 2]);
      let iterA: IterableIterator<int> = arr.keys();
      let iterB: IterableIterator<int> = arr.keys();
      let a1: IteratorResult<int> = iterA.next();
      let b1: IteratorResult<int> = iterB.next();
      let actual1: int | undefined = a1.value;
      expect(actual1).assertEqual(0);
      let actual2: int | undefined = b1.value;
      expect(actual2).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_KEYS_ONE_3100
     * @tc.name testInt16ArrayKeysTestOne031
     * @tc.desc Verify keys() next returns expected index sequence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayKeysTestOne031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([10, 20, 30]);
      let iterA: IterableIterator<int> = arr.keys();
      let iterB: IterableIterator<int> = arr.keys();
      iterA.next();
      let a2: IteratorResult<int> = iterA.next();
      let b1: IteratorResult<int> = iterB.next();
      let actual1: int | undefined = a2.value;
      expect(actual1).assertEqual(1);
      let actual2: int | undefined = b1.value;
      expect(actual2).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_KEYS_ONE_3200
     * @tc.name testInt16ArrayKeysTestOne032
     * @tc.desc Verify keys() next returns expected index sequence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayKeysTestOne032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([1, 2]);
      let iter1: IterableIterator<int> = arr.keys();
      iter1.next();
      iter1.next();
      iter1.next();
      let iter2: IterableIterator<int> = arr.keys();
      let r: IteratorResult<int> = iter2.next();
      let actual1: int | undefined = r.value;
      expect(actual1).assertEqual(0);
      let actual2: boolean = r.done;
      expect(actual2).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_KEYS_ONE_3300
     * @tc.name testInt16ArrayKeysTestOne033
     * @tc.desc Verify keys() next value 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayKeysTestOne033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([-32768, -1, 0]);
      let iter: IterableIterator<int> = arr.keys();
      let result: IteratorResult<int> = iter.next();
      let actual1: int | undefined = result.value;
      expect(actual1).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_KEYS_ONE_3400
     * @tc.name testInt16ArrayKeysTestOne034
     * @tc.desc Verify keys() next returns expected index sequence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayKeysTestOne034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([-32768, 32767, 0]);
      let iter: IterableIterator<int> = arr.keys();
      let r0: IteratorResult<int> = iter.next();
      let r1: IteratorResult<int> = iter.next();
      let r2: IteratorResult<int> = iter.next();
      let actual1: int | undefined = r0.value;
      expect(actual1).assertEqual(0);
      let actual2: int | undefined = r1.value;
      expect(actual2).assertEqual(1);
      let actual3: int | undefined = r2.value;
      expect(actual3).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_KEYS_ONE_3500
     * @tc.name testInt16ArrayKeysTestOne035
     * @tc.desc Verify keys() next returns expected index sequence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayKeysTestOne035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([0]);
      let iter: IterableIterator<int> = arr.keys();
      let r: IteratorResult<int> = iter.next();
      let actual1: int | undefined = r.value;
      expect(actual1).assertEqual(0);
      let actual2: boolean = r.done;
      expect(actual2).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_KEYS_ONE_3600
     * @tc.name testInt16ArrayKeysTestOne036
     * @tc.desc Verify keys() next returns expected index sequence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayKeysTestOne036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([32767]);
      let iter: IterableIterator<int> = arr.keys();
      let r: IteratorResult<int> = iter.next();
      let actual1: int | undefined = r.value;
      expect(actual1).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_KEYS_ONE_3700
     * @tc.name testInt16ArrayKeysTestOne037
     * @tc.desc Verify keys() next returns expected index sequence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayKeysTestOne037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([-32768]);
      let iter: IterableIterator<int> = arr.keys();
      let r: IteratorResult<int> = iter.next();
      let actual1: int | undefined = r.value;
      expect(actual1).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_KEYS_ONE_3800
     * @tc.name testInt16ArrayKeysTestOne038
     * @tc.desc Verify FixedArray keys() next value 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayKeysTestOne038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: int[] = [12, 34, 56];
      let arr: Int16Array = new Int16Array(src);
      let iter: IterableIterator<int> = arr.keys();
      let result: IteratorResult<int> = iter.next();
      let actual1: int | undefined = result.value;
      expect(actual1).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_KEYS_ONE_3900
     * @tc.name testInt16ArrayKeysTestOne039
     * @tc.desc Verify FixedArray keys() next value 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayKeysTestOne039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: int[] = [12, 34, 56];
      let arr: Int16Array = new Int16Array(src);
      let iter: IterableIterator<int> = arr.keys();
      iter.next();
      let result: IteratorResult<int> = iter.next();
      let actual1: int | undefined = result.value;
      expect(actual1).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_KEYS_ONE_4000
     * @tc.name testInt16ArrayKeysTestOne040
     * @tc.desc Verify 1 new Int16Array keys() next value 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayKeysTestOne040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([-1]);
      let iter: IterableIterator<int> = arr.keys();
      let result: IteratorResult<int> = iter.next();
      let actual1: int | undefined = result.value;
      expect(actual1).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_KEYS_ONE_4100
     * @tc.name testInt16ArrayKeysTestOne041
     * @tc.desc Verify keys() next returns expected index sequence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayKeysTestOne041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array(5);
      let iter: IterableIterator<int> = arr.keys();
      let indices: int[] = [];
      let r: IteratorResult<int> = iter.next();
      while (!r.done) {
        indices.push(r.value!);
        r = iter.next();
      }
      let actual1: int = indices[0];
      expect(actual1).assertEqual(0);
      let actual2: int = indices[4];
      expect(actual2).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_KEYS_ONE_4200
     * @tc.name testInt16ArrayKeysTestOne042
     * @tc.desc Verify keys() returns 0..n-1 for buffer view length 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayKeysTestOne042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(10);
      let arr: Int16Array = new Int16Array(buf, 2, 4);
      let iter: IterableIterator<int> = arr.keys();
      let r0: IteratorResult<int> = iter.next();
      let r1: IteratorResult<int> = iter.next();
      let r2: IteratorResult<int> = iter.next();
      let r3: IteratorResult<int> = iter.next();
      let actual1: int | undefined = r0.value;
      expect(actual1).assertEqual(0);
      let actual2: int | undefined = r1.value;
      expect(actual2).assertEqual(1);
      let actual3: int | undefined = r2.value;
      expect(actual3).assertEqual(2);
      let actual4: int | undefined = r3.value;
      expect(actual4).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_KEYS_ONE_4300
     * @tc.name testInt16ArrayKeysTestOne043
     * @tc.desc Verify keys() next returns expected index sequence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayKeysTestOne043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(6);
      let arr: Int16Array = new Int16Array(buf, 4, 1);
      let iter: IterableIterator<int> = arr.keys();
      let r: IteratorResult<int> = iter.next();
      let actual1: int | undefined = r.value;
      expect(actual1).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_KEYS_ONE_4400
     * @tc.name testInt16ArrayKeysTestOne044
     * @tc.desc Verify keys() done differs for length 0 and length 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayKeysTestOne044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arrEmpty: Int16Array = new Int16Array(0);
      let arrOne: Int16Array = new Int16Array(1);
      let iterEmpty: IterableIterator<int> = arrEmpty.keys();
      let iterOne: IterableIterator<int> = arrOne.keys();
      let rEmpty: IteratorResult<int> = iterEmpty.next();
      let rOne: IteratorResult<int> = iterOne.next();
      let actual1: boolean = rEmpty.done;
      expect(actual1).assertTrue();
      let actual2: boolean = rOne.done;
      expect(actual2).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_KEYS_ONE_4500
     * @tc.name testInt16ArrayKeysTestOne045
     * @tc.desc Verify keys() next values are 0 1 2 for length 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayKeysTestOne045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([100, 200, 300]);
      let iter: IterableIterator<int> = arr.keys();
      let firstValue: int | undefined = iter.next().value;
      let secondValue: int | undefined = iter.next().value;
      let thirdValue: int | undefined = iter.next().value;
      expect(firstValue).assertEqual(0);
      expect(secondValue).assertEqual(1);
      expect(thirdValue).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_KEYS_ONE_4600
     * @tc.name testInt16ArrayKeysTestOne046
     * @tc.desc Verify keys() for-of iteration count equals length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayKeysTestOne046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([99]);
      let count: int = 0;
      for (let k of arr.keys()) {
        count = count + 1;
      }
      expect(count).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_KEYS_ONE_4700
     * @tc.name testInt16ArrayKeysTestOne047
     * @tc.desc Verify keys() next() value is 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayKeysTestOne047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([1, 2]);
      let iter: IterableIterator<int> = arr.keys();
      let result: IteratorResult<int> = iter.next();
      expect(result.value!).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_KEYS_ONE_4800
     * @tc.name testInt16ArrayKeysTestOne048
     * @tc.desc Verify keys() next done boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayKeysTestOne048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([0]);
      let iter: IterableIterator<int> = arr.keys();
      let result: IteratorResult<int> = iter.next();
      expect(result.done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_KEYS_ONE_4900
     * @tc.name testInt16ArrayKeysTestOne049
     * @tc.desc Verify keys() Iterable for-of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayKeysTestOne049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([1, 2, 3]);
      let collected: int[] = [];
      for (let k of arr.keys()) {
        collected.push(k);
      }
      let actual1: int = collected[0];
      expect(actual1).assertEqual(0);
      let actual2: int = collected[1];
      expect(actual2).assertEqual(1);
      let actual3: int = collected[2];
      expect(actual3).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_KEYS_ONE_5000
     * @tc.name testInt16ArrayKeysTestOne050
     * @tc.desc Verify keys() for-of iteration count equals length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayKeysTestOne050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([10, 20]);
      let iter: IterableIterator<int> = arr.keys();
      let count1: int = 0;
      let count2: int = 0;
      for (let k of iter) {
        count1 = count1 + 1;
      }
      for (let k of iter) {
        count2 = count2 + 1;
      }
      expect(count1).assertEqual(2);
      expect(count2).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_KEYS_ONE_5100
     * @tc.name testInt16ArrayKeysTestOne051
     * @tc.desc Verify keys/$_set/next (assertEqual)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayKeysTestOne051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([5, 5, 5]);
      arr.$_set(1, 99);
      let iter: IterableIterator<int> = arr.keys();
      let r0: IteratorResult<int> = iter.next();
      let r1: IteratorResult<int> = iter.next();
      let r2: IteratorResult<int> = iter.next();
      let actual1: int | undefined = r0.value;
      expect(actual1).assertEqual(0);
      let actual2: int | undefined = r1.value;
      expect(actual2).assertEqual(1);
      let actual3: int | undefined = r2.value;
      expect(actual3).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_KEYS_ONE_5200
     * @tc.name testInt16ArrayKeysTestOne052
     * @tc.desc Verify keys() next returns expected index sequence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayKeysTestOne052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array(3);
      arr.$_set(0, 42);
      arr.$_set(1, 42);
      arr.$_set(2, 42);
      let iter: IterableIterator<int> = arr.keys();
      let r0: IteratorResult<int> = iter.next();
      let r1: IteratorResult<int> = iter.next();
      let r2: IteratorResult<int> = iter.next();
      let actual1: int | undefined = r0.value;
      expect(actual1).assertEqual(0);
      let actual2: int | undefined = r1.value;
      expect(actual2).assertEqual(1);
      let actual3: int | undefined = r2.value;
      expect(actual3).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_KEYS_ONE_5300
     * @tc.name testInt16ArrayKeysTestOne053
     * @tc.desc Verify keys() index sequence after element mutation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayKeysTestOne053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([0, 0, 0]);
      arr.$_set(0, 7);
      arr.$_set(1, 8);
      let iter: IterableIterator<int> = arr.keys();
      let r: IteratorResult<int> = iter.next();
      let actual1: int | undefined = r.value;
      expect(actual1).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_KEYS_ONE_5400
     * @tc.name testInt16ArrayKeysTestOne054
     * @tc.desc Verify keys() next returns expected index sequence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayKeysTestOne054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([1, 2, 3]);
      arr.$_set(0, 3);
      arr.$_set(1, 2);
      arr.$_set(2, 1);
      let iter: IterableIterator<int> = arr.keys();
      let r0: IteratorResult<int> = iter.next();
      let r1: IteratorResult<int> = iter.next();
      let r2: IteratorResult<int> = iter.next();
      let actual1: int | undefined = r0.value;
      expect(actual1).assertEqual(0);
      let actual2: int | undefined = r1.value;
      expect(actual2).assertEqual(1);
      let actual3: int | undefined = r2.value;
      expect(actual3).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_KEYS_ONE_5500
     * @tc.name testInt16ArrayKeysTestOne055
     * @tc.desc Verify keys() next returns expected index sequence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayKeysTestOne055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([1, 2, 3, 4]);
      arr.$_set(0, 3);
      arr.$_set(1, 4);
      let iter: IterableIterator<int> = arr.keys();
      let r0: IteratorResult<int> = iter.next();
      let r1: IteratorResult<int> = iter.next();
      let r2: IteratorResult<int> = iter.next();
      let r3: IteratorResult<int> = iter.next();
      let actual1: int | undefined = r0.value;
      expect(actual1).assertEqual(0);
      let actual2: int | undefined = r1.value;
      expect(actual2).assertEqual(1);
      let actual3: int | undefined = r2.value;
      expect(actual3).assertEqual(2);
      let actual4: int | undefined = r3.value;
      expect(actual4).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_KEYS_ONE_5600
     * @tc.name testInt16ArrayKeysTestOne056
     * @tc.desc Verify keys/$_set/next (assertEqual)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayKeysTestOne056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([0, 0]);
      arr.$_set(0, Number.POSITIVE_INFINITY as number);
      let iter: IterableIterator<int> = arr.keys();
      let r0: IteratorResult<int> = iter.next();
      let r1: IteratorResult<int> = iter.next();
      let actual1: int | undefined = r0.value;
      expect(actual1).assertEqual(0);
      let actual2: int | undefined = r1.value;
      expect(actual2).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_KEYS_ONE_5700
     * @tc.name testInt16ArrayKeysTestOne057
     * @tc.desc Verify keys() next returns expected index sequence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayKeysTestOne057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arrA: Int16Array = new Int16Array([1, 2, 3]);
      let arrB: Int16Array = new Int16Array([9, 8, 7]);
      let iterA: IterableIterator<int> = arrA.keys();
      let iterB: IterableIterator<int> = arrB.keys();
      let a1: IteratorResult<int> = iterA.next();
      let b1: IteratorResult<int> = iterB.next();
      let actual1: int | undefined = a1.value;
      expect(actual1).assertEqual(0);
      let actual2: int | undefined = b1.value;
      expect(actual2).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_KEYS_ONE_5800
     * @tc.name testInt16ArrayKeysTestOne058
     * @tc.desc Verify keys() next returns expected index sequence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayKeysTestOne058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(6);
      let arrBuf: Int16Array = new Int16Array(buf, 0, 3);
      let arrInd: Int16Array = new Int16Array(3);
      let iterBuf: IterableIterator<int> = arrBuf.keys();
      let iterInd: IterableIterator<int> = arrInd.keys();
      let rBuf: IteratorResult<int> = iterBuf.next();
      let rInd: IteratorResult<int> = iterInd.next();
      let actual1: int | undefined = rBuf.value;
      expect(actual1).assertEqual(0);
      let actual2: int | undefined = rInd.value;
      expect(actual2).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_KEYS_ONE_5900
     * @tc.name testInt16ArrayKeysTestOne059
     * @tc.desc Verify keys() next value done
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayKeysTestOne059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([5]);
      let iter: IterableIterator<int> = arr.keys();
      let result: IteratorResult<int> = iter.next();
      let actual1: int | undefined = result.value;
      expect(actual1).assertEqual(0);
      let actual2: boolean = result.done;
      expect(actual2).assertFalse();
    });
  });
}
