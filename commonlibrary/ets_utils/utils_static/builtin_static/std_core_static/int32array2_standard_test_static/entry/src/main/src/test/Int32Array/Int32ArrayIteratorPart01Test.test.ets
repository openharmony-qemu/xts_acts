'use static';


/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import {
  beforeAll,
  afterEach,
  beforeEach,
  afterAll,
  describe,
  it,
  expect,
  TestType,
  Size,
  Level
} from '../../../../hypium/index';
import Utils from '../Util.test';

export default function int32ArrayIteratorPart01Test(): void {
  describe('Int32ArrayIteratorPart01Test', () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ITERATOR_PART01_TEST_MINDMAP_0100
     * @tc.name int32ArrayIteratorPart01TestMindmapTest001
     * @tc.desc Verify Int32Array.of(10,20,30).$_iterator() returns the first value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIteratorPart01TestMindmapTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(10, 20, 30);
      let it = a.$_iterator();
      expect(it.next().value).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ITERATOR_PART01_TEST_MINDMAP_0200
     * @tc.name int32ArrayIteratorPart01TestMindmapTest002
     * @tc.desc Verify new Int32Array() $_iterator() is immediately done
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIteratorPart01TestMindmapTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array();
      let it = a.$_iterator();
      expect(it.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ITERATOR_PART01_TEST_MINDMAP_0300
     * @tc.name int32ArrayIteratorPart01TestMindmapTest003
     * @tc.desc Verify new Int32Array(5) $_iterator() returns the default zero value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIteratorPart01TestMindmapTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(5);
      let it = a.$_iterator();
      expect(it.next().value).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ITERATOR_PART01_TEST_MINDMAP_0400
     * @tc.name int32ArrayIteratorPart01TestMindmapTest004
     * @tc.desc Verify new Int32Array([1,2]) $_iterator() returns the first value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIteratorPart01TestMindmapTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: int[] = [1, 2];
      let a: Int32Array = new Int32Array(src);
      let it = a.$_iterator();
      expect(it.next().value).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ITERATOR_PART01_TEST_MINDMAP_0500
     * @tc.name int32ArrayIteratorPart01TestMindmapTest005
     * @tc.desc Verify Int32Array.from([3,4]) $_iterator() returns the first value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIteratorPart01TestMindmapTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: int[] = [3, 4];
      let a: Int32Array = Int32Array.from(src);
      let it = a.$_iterator();
      expect(it.next().value).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ITERATOR_PART01_TEST_MINDMAP_0600
     * @tc.name int32ArrayIteratorPart01TestMindmapTest006
     * @tc.desc Verify Int32Array.of(1).$_iterator().next() done=false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIteratorPart01TestMindmapTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = Int32Array.of(1).$_iterator().next();
      expect(r.done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ITERATOR_PART01_TEST_MINDMAP_0700
     * @tc.name int32ArrayIteratorPart01TestMindmapTest007
     * @tc.desc Verify independent iterators both start from the first value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIteratorPart01TestMindmapTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(7, 8);
      let it1 = a.$_iterator();
      let it2 = a.$_iterator();
      expect(it1.next().value).assertEqual(7);
      expect(it2.next().value).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ITERATOR_PART01_TEST_MINDMAP_0800
     * @tc.name int32ArrayIteratorPart01TestMindmapTest008
     * @tc.desc Verify const Int32Array iterator returns the first value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIteratorPart01TestMindmapTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Int32Array = Int32Array.of(1, 2);
      let it = a.$_iterator();
      expect(it.next().value).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ITERATOR_PART01_TEST_MINDMAP_0900
     * @tc.name int32ArrayIteratorPart01TestMindmapTest009
     * @tc.desc Verify $_iterator() observes a value written by $_set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIteratorPart01TestMindmapTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(2);
      a.$_set(0, 55);
      let it = a.$_iterator();
      expect(it.next().value).assertEqual(55);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ITERATOR_PART01_TEST_MINDMAP_1000
     * @tc.name int32ArrayIteratorPart01TestMindmapTest010
     * @tc.desc Verify iterator returns the value written by fill(9)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIteratorPart01TestMindmapTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(3);
      a.fill(9);
      let it = a.$_iterator();
      expect(it.next().value).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ITERATOR_PART01_TEST_MINDMAP_1100
     * @tc.name int32ArrayIteratorPart01TestMindmapTest011
     * @tc.desc Verify iterator returns the first value after reverse()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIteratorPart01TestMindmapTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(3, 2, 1);
      a.reverse();
      let it = a.$_iterator();
      expect(it.next().value).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ITERATOR_PART01_TEST_MINDMAP_1200
     * @tc.name int32ArrayIteratorPart01TestMindmapTest012
     * @tc.desc Verify iterator returns the first value after sort()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIteratorPart01TestMindmapTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(2, 3, 1);
      a.sort();
      let it = a.$_iterator();
      expect(it.next().value).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ITERATOR_PART01_TEST_MINDMAP_1300
     * @tc.name int32ArrayIteratorPart01TestMindmapTest013
     * @tc.desc Verify an ArrayBuffer-backed iterator returns the default zero value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIteratorPart01TestMindmapTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(12);
      let a: Int32Array = new Int32Array(buf);
      let it = a.$_iterator();
      expect(it.next().value).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ITERATOR_PART01_TEST_MINDMAP_1400
     * @tc.name int32ArrayIteratorPart01TestMindmapTest014
     * @tc.desc Verify a subarray iterator starts from the subarray first value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIteratorPart01TestMindmapTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1, 2, 3, 4);
      let sub = a.subarray(1, 3);
      let it = sub.$_iterator();
      expect(it.next().value).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ITERATOR_PART01_TEST_MINDMAP_1500
     * @tc.name int32ArrayIteratorPart01TestMindmapTest015
     * @tc.desc Verify a sliced array iterator returns the copied first value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIteratorPart01TestMindmapTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(5, 6);
      let cp = a.slice(0);
      let it = cp.$_iterator();
      expect(it.next().value).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ITERATOR_PART01_TEST_MINDMAP_1600
     * @tc.name int32ArrayIteratorPart01TestMindmapTest016
     * @tc.desc Verify length=0 new Int32Array(0) $_iterator() next done=true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIteratorPart01TestMindmapTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = new Int32Array(0).$_iterator().next();
      expect(r.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ITERATOR_PART01_TEST_MINDMAP_1700
     * @tc.name int32ArrayIteratorPart01TestMindmapTest017
     * @tc.desc Verify length=1 $_iterator() next value=0 done=false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIteratorPart01TestMindmapTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = new Int32Array(1).$_iterator().next();
      expect(r.done).assertFalse();
      expect(r.value).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ITERATOR_PART01_TEST_MINDMAP_1800
     * @tc.name int32ArrayIteratorPart01TestMindmapTest018
     * @tc.desc Verify length=2 $_iterator() value=
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIteratorPart01TestMindmapTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([11, 22]);
      let v = a.$_iterator().next().value;
      expect(v).assertEqual(11);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ITERATOR_PART01_TEST_MINDMAP_1900
     * @tc.name int32ArrayIteratorPart01TestMindmapTest019
     * @tc.desc Verify length=3 $_iterator() 4 next done=true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIteratorPart01TestMindmapTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let it = Int32Array.of(1, 2, 3).$_iterator();
      it.next();
      it.next();
      it.next();
      expect(it.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ITERATOR_PART01_TEST_MINDMAP_2000
     * @tc.name int32ArrayIteratorPart01TestMindmapTest020
     * @tc.desc Verify iterator() length=1 next done=true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIteratorPart01TestMindmapTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let it = Int32Array.of(9).$_iterator();
      it.next();
      expect(it.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ITERATOR_PART01_TEST_MINDMAP_2100
     * @tc.name int32ArrayIteratorPart01TestMindmapTest021
     * @tc.desc Verify iterator() length=0 next done=true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIteratorPart01TestMindmapTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let it = new Int32Array(0).$_iterator();
      it.next();
      expect(it.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ITERATOR_PART01_TEST_MINDMAP_2200
     * @tc.name int32ArrayIteratorPart01TestMindmapTest022
     * @tc.desc Verify length=16 2 $_iterator() value=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIteratorPart01TestMindmapTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(16);
      a.$_set(0, 77);
      let v = a.$_iterator().next().value;
      expect(v).assertEqual(77);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ITERATOR_PART01_TEST_MINDMAP_2300
     * @tc.name int32ArrayIteratorPart01TestMindmapTest023
     * @tc.desc Verify length=5 $_iterator() value=
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIteratorPart01TestMindmapTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([10, 20, 30, 40, 50]);
      let v = a.$_iterator().next().value;
      expect(v).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ITERATOR_PART01_TEST_MINDMAP_2400
     * @tc.name int32ArrayIteratorPart01TestMindmapTest024
     * @tc.desc Verify new Int32Array([]) JS $_iterator() next done=true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIteratorPart01TestMindmapTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let empty: int[] = [];
      let a: Int32Array = new Int32Array(empty);
      expect(a.$_iterator().next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ITERATOR_PART01_TEST_MINDMAP_2500
     * @tc.name int32ArrayIteratorPart01TestMindmapTest025
     * @tc.desc Verify new Int32Array([42]) $_iterator() value=42
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIteratorPart01TestMindmapTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: int[] = [42];
      let a: Int32Array = new Int32Array(src);
      let v = a.$_iterator().next().value;
      expect(v).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ITERATOR_PART01_TEST_MINDMAP_2600
     * @tc.name int32ArrayIteratorPart01TestMindmapTest026
     * @tc.desc Verify Int32Array.of() $_iterator() next done=true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIteratorPart01TestMindmapTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Int32Array.of().$_iterator().next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ITERATOR_PART01_TEST_MINDMAP_2700
     * @tc.name int32ArrayIteratorPart01TestMindmapTest027
     * @tc.desc Verify Int32Array.of(99) $_iterator() value=99
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIteratorPart01TestMindmapTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v = Int32Array.of(99).$_iterator().next().value;
      expect(v).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ITERATOR_PART01_TEST_MINDMAP_2800
     * @tc.name int32ArrayIteratorPart01TestMindmapTest028
     * @tc.desc Verify Int32Array.from $_iterator() next done=true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIteratorPart01TestMindmapTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let empty: int[] = [];
      expect(Int32Array.from(empty).$_iterator().next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ITERATOR_PART01_TEST_MINDMAP_2900
     * @tc.name int32ArrayIteratorPart01TestMindmapTest029
     * @tc.desc Verify Int32Array.from([5,6,7]) $_iterator() value=5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIteratorPart01TestMindmapTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: int[] = [5, 6, 7];
      let v = Int32Array.from(src).$_iterator().next().value;
      expect(v).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ITERATOR_PART01_TEST_MINDMAP_3000
     * @tc.name int32ArrayIteratorPart01TestMindmapTest030
     * @tc.desc Verify ArrayBuffer new Int32Array(buf, 0, 0) length=0 $_iterator() next done=true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIteratorPart01TestMindmapTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(16);
      let a: Int32Array = new Int32Array(buf, 0, 0);
      expect(a.$_iterator().next().done).assertTrue();
      expect(a.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ITERATOR_PART01_TEST_MINDMAP_3100
     * @tc.name int32ArrayIteratorPart01TestMindmapTest031
     * @tc.desc Verify ArrayBuffer new Int32Array(buf, 4, 2) $_iterator() value=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIteratorPart01TestMindmapTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(16);
      let a: Int32Array = new Int32Array(buf, 4, 2);
      let v = a.$_iterator().next().value;
      expect(v).assertEqual(0);
      expect(a.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ITERATOR_PART01_TEST_MINDMAP_3200
     * @tc.name int32ArrayIteratorPart01TestMindmapTest032
     * @tc.desc Verify ArrayBuffer new Int32Array(buf, 8, 1) $_iterator() value=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIteratorPart01TestMindmapTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(12);
      let a: Int32Array = new Int32Array(buf, 8, 1);
      let v = a.$_iterator().next().value;
      expect(v).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ITERATOR_PART01_TEST_MINDMAP_3300
     * @tc.name int32ArrayIteratorPart01TestMindmapTest033
     * @tc.desc Verify TypedArray new Int32Array(other) $_iterator() value=
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIteratorPart01TestMindmapTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int32Array = Int32Array.of(11, 22, 33);
      let a: Int32Array = new Int32Array(src);
      let v = a.$_iterator().next().value;
      expect(v).assertEqual(11);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ITERATOR_PART01_TEST_MINDMAP_3400
     * @tc.name int32ArrayIteratorPart01TestMindmapTest034
     * @tc.desc Verify TypedArray new Int32Array(empty) $_iterator() next done=true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIteratorPart01TestMindmapTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int32Array = new Int32Array();
      let a: Int32Array = new Int32Array(src);
      expect(a.$_iterator().next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ITERATOR_PART01_TEST_MINDMAP_3500
     * @tc.name int32ArrayIteratorPart01TestMindmapTest035
     * @tc.desc Verify new ArrayBuffer(0) buffer $_iterator() next done=true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIteratorPart01TestMindmapTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(0);
      let a: Int32Array = new Int32Array(buf);
      expect(a.$_iterator().next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ITERATOR_PART01_TEST_MINDMAP_3600
     * @tc.name int32ArrayIteratorPart01TestMindmapTest036
     * @tc.desc Verify Int32Array.from mapFn (x => x*2) $_iterator() value= *2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIteratorPart01TestMindmapTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: number[] = [3];
      let a: Int32Array = Int32Array.from(src as number[], (x: number, k: number): number => x * 2);
      let v = a.$_iterator().next().value;
      expect(v).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ITERATOR_PART01_TEST_MINDMAP_3700
     * @tc.name int32ArrayIteratorPart01TestMindmapTest037
     * @tc.desc Verify 0 $_iterator() 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIteratorPart01TestMindmapTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v = new Int32Array([0]).$_iterator().next().value;
      expect(v).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ITERATOR_PART01_TEST_MINDMAP_3800
     * @tc.name int32ArrayIteratorPart01TestMindmapTest038
     * @tc.desc Verify 1 $_iterator() 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIteratorPart01TestMindmapTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v = new Int32Array([1]).$_iterator().next().value;
      expect(v).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ITERATOR_PART01_TEST_MINDMAP_3900
     * @tc.name int32ArrayIteratorPart01TestMindmapTest039
     * @tc.desc Verify -1 $_iterator() -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIteratorPart01TestMindmapTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v = new Int32Array([-1]).$_iterator().next().value;
      expect(v).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ITERATOR_PART01_TEST_MINDMAP_4000
     * @tc.name int32ArrayIteratorPart01TestMindmapTest040
     * @tc.desc Verify int32 MAX 2147483647 $_iterator() MAX
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIteratorPart01TestMindmapTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v = Int32Array.of(2147483647).$_iterator().next().value;
      expect(v).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ITERATOR_PART01_TEST_MINDMAP_4100
     * @tc.name int32ArrayIteratorPart01TestMindmapTest041
     * @tc.desc Verify int32 MIN -2147483648 $_iterator() MIN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIteratorPart01TestMindmapTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v = Int32Array.of(-2147483648).$_iterator().next().value;
      expect(v).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ITERATOR_PART01_TEST_MINDMAP_4200
     * @tc.name int32ArrayIteratorPart01TestMindmapTest042
     * @tc.desc Verify $_set(0, -0) ToInt32 0 $_iterator() 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIteratorPart01TestMindmapTest042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(1);
      a.$_set(0, -0);
      let v = a.$_iterator().next().value;
      expect(v).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ITERATOR_PART01_TEST_MINDMAP_4300
     * @tc.name int32ArrayIteratorPart01TestMindmapTest043
     * @tc.desc Verify $_set(0, 2147483648) MAX+1 ToInt32 MIN $_iterator() -2147483648
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIteratorPart01TestMindmapTest043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(1);
      a.$_set(0, 2147483648);
      let v = a.$_iterator().next().value;
      expect(v).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ITERATOR_PART01_TEST_MINDMAP_4400
     * @tc.name int32ArrayIteratorPart01TestMindmapTest044
     * @tc.desc Verify $_set(0, 2147483649) MAX+2 ToInt32 -2147483647 $_iterator()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIteratorPart01TestMindmapTest044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(1);
      a.$_set(0, 2147483649);
      let v = a.$_iterator().next().value;
      expect(v).assertEqual(-2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ITERATOR_PART01_TEST_MINDMAP_4500
     * @tc.name int32ArrayIteratorPart01TestMindmapTest045
     * @tc.desc Verify $_set(0, -2147483649) MIN-1 ToInt32 MAX $_iterator() 2147483647
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIteratorPart01TestMindmapTest045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(1);
      a.$_set(0, -2147483649);
      let v = a.$_iterator().next().value;
      expect(v).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ITERATOR_PART01_TEST_MINDMAP_4600
     * @tc.name int32ArrayIteratorPart01TestMindmapTest046
     * @tc.desc Verify $_set(0, 4294967295) 0xFFFFFFFF ToInt32 -1 $_iterator() -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIteratorPart01TestMindmapTest046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(1);
      a.$_set(0, 4294967295);
      let v = a.$_iterator().next().value;
      expect(v).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ITERATOR_PART01_TEST_MINDMAP_4700
     * @tc.name int32ArrayIteratorPart01TestMindmapTest047
     * @tc.desc Verify $_set(0, 4294967296) 2^32 ToInt32 0 $_iterator() 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIteratorPart01TestMindmapTest047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(1);
      a.$_set(0, 4294967296);
      let v = a.$_iterator().next().value;
      expect(v).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ITERATOR_PART01_TEST_MINDMAP_4800
     * @tc.name int32ArrayIteratorPart01TestMindmapTest048
     * @tc.desc Verify $_set(0, 3.7) 3 $_iterator() 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIteratorPart01TestMindmapTest048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(1);
      a.$_set(0, 3.7);
      let v = a.$_iterator().next().value;
      expect(v).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ITERATOR_PART01_TEST_MINDMAP_4900
     * @tc.name int32ArrayIteratorPart01TestMindmapTest049
     * @tc.desc Verify $_set(0, -3.7) -3 $_iterator() -3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIteratorPart01TestMindmapTest049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(1);
      a.$_set(0, -3.7);
      let v = a.$_iterator().next().value;
      expect(v).assertEqual(-3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ITERATOR_PART01_TEST_MINDMAP_5000
     * @tc.name int32ArrayIteratorPart01TestMindmapTest050
     * @tc.desc Verify $_set(0, 0.5) 1 0 $_iterator() 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIteratorPart01TestMindmapTest050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(1);
      a.$_set(0, 0.5);
      let v = a.$_iterator().next().value;
      expect(v).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ITERATOR_PART01_TEST_MINDMAP_5100
     * @tc.name int32ArrayIteratorPart01TestMindmapTest051
     * @tc.desc Verify $_set(0, Number.NaN) ToInt32 0 $_iterator() 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIteratorPart01TestMindmapTest051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(1);
      a.$_set(0, Number.NaN);
      let v = a.$_iterator().next().value;
      expect(v).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ITERATOR_PART01_TEST_MINDMAP_5200
     * @tc.name int32ArrayIteratorPart01TestMindmapTest052
     * @tc.desc Verify $_set(0, Number.POSITIVE_INFINITY) ToInt32 0 $_iterator() 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIteratorPart01TestMindmapTest052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(1);
      a.$_set(0, Number.POSITIVE_INFINITY);
      let v = a.$_iterator().next().value;
      expect(v).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ITERATOR_PART01_TEST_MINDMAP_5300
     * @tc.name int32ArrayIteratorPart01TestMindmapTest053
     * @tc.desc Verify $_set(0, -Number.POSITIVE_INFINITY) ToInt32 0 $_iterator() 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIteratorPart01TestMindmapTest053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(1);
      a.$_set(0, -Number.POSITIVE_INFINITY);
      let v = a.$_iterator().next().value;
      expect(v).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ITERATOR_PART01_TEST_MINDMAP_5400
     * @tc.name int32ArrayIteratorPart01TestMindmapTest054
     * @tc.desc Verify 0xFF(255) of $_iterator() 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIteratorPart01TestMindmapTest054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v = Int32Array.of(0xFF).$_iterator().next().value;
      expect(v).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ITERATOR_PART01_TEST_MINDMAP_5500
     * @tc.name int32ArrayIteratorPart01TestMindmapTest055
     * @tc.desc Verify 0o77(63) of $_iterator() 63
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIteratorPart01TestMindmapTest055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v = Int32Array.of(0o77).$_iterator().next().value;
      expect(v).assertEqual(63);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ITERATOR_PART01_TEST_MINDMAP_5600
     * @tc.name int32ArrayIteratorPart01TestMindmapTest056
     * @tc.desc Verify 0b1010(10) of $_iterator() 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIteratorPart01TestMindmapTest056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v = Int32Array.of(0b1010).$_iterator().next().value;
      expect(v).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ITERATOR_PART01_TEST_MINDMAP_5700
     * @tc.name int32ArrayIteratorPart01TestMindmapTest057
     * @tc.desc Verify -0xFF(-255) of $_iterator() -255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIteratorPart01TestMindmapTest057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v = Int32Array.of(-0xFF).$_iterator().next().value;
      expect(v).assertEqual(-255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ITERATOR_PART01_TEST_MINDMAP_5800
     * @tc.name int32ArrayIteratorPart01TestMindmapTest058
     * @tc.desc Verify -42 $_iterator() -42
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIteratorPart01TestMindmapTest058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v = Int32Array.of(-42).$_iterator().next().value;
      expect(v).assertEqual(-42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ITERATOR_PART01_TEST_MINDMAP_5900
     * @tc.name int32ArrayIteratorPart01TestMindmapTest059
     * @tc.desc Verify [MAX,MIN] $_iterator() value=MAX
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIteratorPart01TestMindmapTest059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(2147483647, -2147483648);
      let v = a.$_iterator().next().value;
      expect(v).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ITERATOR_PART01_TEST_MINDMAP_6000
     * @tc.name int32ArrayIteratorPart01TestMindmapTest060
     * @tc.desc Verify [MIN,MAX] $_iterator() value=MIN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIteratorPart01TestMindmapTest060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(-2147483648, 2147483647);
      let v = a.$_iterator().next().value;
      expect(v).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ITERATOR_PART01_TEST_MINDMAP_6100
     * @tc.name int32ArrayIteratorPart01TestMindmapTest061
     * @tc.desc Verify [-5,0,5] $_iterator() value=-5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIteratorPart01TestMindmapTest061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: int[] = [-5, 0, 5];
      let a: Int32Array = new Int32Array(src);
      let v = a.$_iterator().next().value;
      expect(v).assertEqual(-5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ITERATOR_PART01_TEST_MINDMAP_6200
     * @tc.name int32ArrayIteratorPart01TestMindmapTest062
     * @tc.desc Verify [7,7,7] $_iterator() value=7
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIteratorPart01TestMindmapTest062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: int[] = [7, 7, 7];
      let a: Int32Array = new Int32Array(src);
      let v = a.$_iterator().next().value;
      expect(v).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ITERATOR_PART01_TEST_MINDMAP_6300
     * @tc.name int32ArrayIteratorPart01TestMindmapTest063
     * @tc.desc Verify $_set(0, 5) $_iterator() value=5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIteratorPart01TestMindmapTest063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(1);
      a.$_set(0, 5);
      let v = a.$_iterator().next().value;
      expect(v).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ITERATOR_PART01_TEST_MINDMAP_6400
     * @tc.name int32ArrayIteratorPart01TestMindmapTest064
     * @tc.desc Verify $_set $_iterator() value=
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIteratorPart01TestMindmapTest064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(3);
      a.$_set(0, 11);
      a.$_set(1, 22);
      a.$_set(2, 33);
      let v = a.$_iterator().next().value;
      expect(v).assertEqual(11);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ITERATOR_PART01_TEST_MINDMAP_6500
     * @tc.name int32ArrayIteratorPart01TestMindmapTest065
     * @tc.desc Verify $_set(0,1) $_set(0,9) $_iterator() 9
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIteratorPart01TestMindmapTest065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(1);
      a.$_set(0, 1);
      a.$_set(0, 9);
      let v = a.$_iterator().next().value;
      expect(v).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ITERATOR_PART01_TEST_MINDMAP_6600
     * @tc.name int32ArrayIteratorPart01TestMindmapTest066
     * @tc.desc Verify fill(-1) $_iterator() value=-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIteratorPart01TestMindmapTest066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(2);
      a.fill(-1);
      let v = a.$_iterator().next().value;
      expect(v).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ITERATOR_PART01_TEST_MINDMAP_6700
     * @tc.name int32ArrayIteratorPart01TestMindmapTest067
     * @tc.desc Verify fill(MAX) $_iterator() value=MAX
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIteratorPart01TestMindmapTest067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(2);
      a.fill(2147483647);
      let v = a.$_iterator().next().value;
      expect(v).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ITERATOR_PART01_TEST_MINDMAP_6800
     * @tc.name int32ArrayIteratorPart01TestMindmapTest068
     * @tc.desc Verify [1,2,3,4].copyWithin(0,2) $_iterator() value=3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIteratorPart01TestMindmapTest068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1, 2, 3, 4);
      a.copyWithin(0, 2);
      let v = a.$_iterator().next().value;
      expect(v).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ITERATOR_PART01_TEST_MINDMAP_6900
     * @tc.name int32ArrayIteratorPart01TestMindmapTest069
     * @tc.desc Verify new Int32Array(3).set([7,8,9] as number[]) $_iterator() value=7
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIteratorPart01TestMindmapTest069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(3);
      let src: number[] = [7, 8, 9];
      a.set(src as number[]);
      let v = a.$_iterator().next().value;
      expect(v).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ITERATOR_PART01_TEST_MINDMAP_7000
     * @tc.name int32ArrayIteratorPart01TestMindmapTest070
     * @tc.desc Verify iterator() new Int32Array(4).set([11,22] as number[], 2) 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIteratorPart01TestMindmapTest070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(4);
      let src: number[] = [11, 22];
      a.set(src as number[], 2);
      let v = a.$_iterator().next().value;
      expect(v).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ITERATOR_PART01_TEST_MINDMAP_7100
     * @tc.name int32ArrayIteratorPart01TestMindmapTest071
     * @tc.desc Verify subarray(0) $_iterator() value= 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIteratorPart01TestMindmapTest071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(10, 20, 30);
      let sub = a.subarray(0);
      let v = sub.$_iterator().next().value;
      expect(v).assertEqual(10);
      expect(sub.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ITERATOR_PART01_TEST_MINDMAP_7200
     * @tc.name int32ArrayIteratorPart01TestMindmapTest072
     * @tc.desc Verify subarray(1) 2 $_iterator() value= 1 20
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIteratorPart01TestMindmapTest072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(10, 20, 30);
      let sub = a.subarray(1);
      let v = sub.$_iterator().next().value;
      expect(v).assertEqual(20);
      expect(sub.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ITERATOR_PART01_TEST_MINDMAP_7300
     * @tc.name int32ArrayIteratorPart01TestMindmapTest073
     * @tc.desc Verify subarray(1,2) 1 $_iterator() value=20 done=false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIteratorPart01TestMindmapTest073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(10, 20, 30);
      let sub = a.subarray(1, 2);
      let r = sub.$_iterator().next();
      expect(r.value).assertEqual(20);
      expect(r.done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ITERATOR_PART01_TEST_MINDMAP_7400
     * @tc.name int32ArrayIteratorPart01TestMindmapTest074
     * @tc.desc Verify subarray(0,0) $_iterator() next done=true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIteratorPart01TestMindmapTest074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1, 2, 3);
      let sub = a.subarray(0, 0);
      expect(sub.$_iterator().next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ITERATOR_PART01_TEST_MINDMAP_7500
     * @tc.name int32ArrayIteratorPart01TestMindmapTest075
     * @tc.desc Verify subarray(3,3) $_iterator() next done=true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIteratorPart01TestMindmapTest075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1, 2, 3);
      let sub = a.subarray(3, 3);
      expect(sub.$_iterator().next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ITERATOR_PART01_TEST_MINDMAP_7600
     * @tc.name int32ArrayIteratorPart01TestMindmapTest076
     * @tc.desc Verify slice(0) $_iterator() value= 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIteratorPart01TestMindmapTest076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(10, 20, 30);
      let cp = a.slice(0);
      let v = cp.$_iterator().next().value;
      expect(v).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ITERATOR_PART01_TEST_MINDMAP_7700
     * @tc.name int32ArrayIteratorPart01TestMindmapTest077
     * @tc.desc Verify slice(1) 2 $_iterator() value=20
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIteratorPart01TestMindmapTest077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(10, 20, 30);
      let cp = a.slice(1);
      let v = cp.$_iterator().next().value;
      expect(v).assertEqual(20);
      expect(cp.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ITERATOR_PART01_TEST_MINDMAP_7800
     * @tc.name int32ArrayIteratorPart01TestMindmapTest078
     * @tc.desc Verify slice(3) $_iterator() next done=true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIteratorPart01TestMindmapTest078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(10, 20, 30);
      let cp = a.slice(3);
      expect(cp.$_iterator().next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ITERATOR_PART01_TEST_MINDMAP_7900
     * @tc.name int32ArrayIteratorPart01TestMindmapTest079
     * @tc.desc Verify buffer $_set subarray $_iterator()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIteratorPart01TestMindmapTest079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(3);
      let sub = a.subarray(1);
      a.$_set(1, 88);
      let v = sub.$_iterator().next().value;
      expect(v).assertEqual(88);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ITERATOR_PART01_TEST_MINDMAP_8000
     * @tc.name int32ArrayIteratorPart01TestMindmapTest080
     * @tc.desc Verify iterator() ArrayBuffer a1 a2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIteratorPart01TestMindmapTest080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(8);
      let a1: Int32Array = new Int32Array(buf, 0, 1);
      let a2: Int32Array = new Int32Array(buf, 4, 1);
      a1.$_set(0, 123);
      let v = a2.$_iterator().next().value;
      expect(v).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ITERATOR_PART01_TEST_MINDMAP_8100
     * @tc.name int32ArrayIteratorPart01TestMindmapTest081
     * @tc.desc Verify iterator() for-of 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIteratorPart01TestMindmapTest081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(10, 20, 30);
      let count: number = 0;
      for (let _v of a) {
        count++;
      }
      expect(count).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ITERATOR_PART01_TEST_MINDMAP_8200
     * @tc.name int32ArrayIteratorPart01TestMindmapTest082
     * @tc.desc Verify iterator() for-of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIteratorPart01TestMindmapTest082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(0);
      let entered: boolean = false;
      for (let _v of a) {
        entered = true;
      }
      expect(entered).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ITERATOR_PART01_TEST_MINDMAP_8300
     * @tc.name int32ArrayIteratorPart01TestMindmapTest083
     * @tc.desc Verify iterator() for-of 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIteratorPart01TestMindmapTest083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(42);
      let seen: number = 0;
      let cnt: number = 0;
      for (let v of a) {
        seen = v;
        cnt++;
      }
      expect(cnt).assertEqual(1);
      expect(seen).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ITERATOR_PART01_TEST_MINDMAP_8400
     * @tc.name int32ArrayIteratorPart01TestMindmapTest084
     * @tc.desc Verify for-of $_iterator next
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIteratorPart01TestMindmapTest084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(5, 10, 15);
      let it = a.$_iterator();
      for (let v of a) {
        expect(v).assertEqual(it.next().value);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ITERATOR_PART01_TEST_MINDMAP_8500
     * @tc.name int32ArrayIteratorPart01TestMindmapTest085
     * @tc.desc Verify iterator() for-of break
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIteratorPart01TestMindmapTest085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1, 2, 3, 4, 5);
      let last: number = 0;
      for (let v of a) {
        last = v;
        if (v === 3) {
          break;
        }
      }
      expect(last).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ITERATOR_PART01_TEST_MINDMAP_8600
     * @tc.name int32ArrayIteratorPart01TestMindmapTest086
     * @tc.desc Verify iterator() it1 next it2 next
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIteratorPart01TestMindmapTest086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(10, 20, 30);
      let it1 = a.$_iterator();
      it1.next();
      let it2 = a.$_iterator();
      let r = it2.next();
      expect(r.value).assertEqual(10);
      expect(r.done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ITERATOR_PART01_TEST_MINDMAP_8700
     * @tc.name int32ArrayIteratorPart01TestMindmapTest087
     * @tc.desc Verify $_iterator() length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIteratorPart01TestMindmapTest087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1, 2, 3);
      a.$_iterator();
      expect(a.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ITERATOR_PART01_TEST_MINDMAP_8800
     * @tc.name int32ArrayIteratorPart01TestMindmapTest088
     * @tc.desc Verify iterator() length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIteratorPart01TestMindmapTest088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1, 2);
      let it = a.$_iterator();
      it.next();
      it.next();
      it.next();
      expect(a.length).assertEqual(2);
    });
  });
}
