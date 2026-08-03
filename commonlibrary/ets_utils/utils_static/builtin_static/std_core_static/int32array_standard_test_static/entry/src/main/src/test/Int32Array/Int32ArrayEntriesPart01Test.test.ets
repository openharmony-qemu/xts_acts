'use static'


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
export default function int32ArrayEntriesPart01Test(): void {
  describe('Int32ArrayEntriesPart01Test', (): void => {
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
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ENTRIES_PART01_TEST_MINDMAP_0100
         * @tc.name int32ArrayEntriesPart01TestMindmapTest001
         * @tc.desc Verify empty Int32Array entries() returns done=true
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEntriesPart01TestMindmapTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let a: Int32Array = new Int32Array();
          let r = a.entries().next();
          expect(r.done).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ENTRIES_PART01_TEST_MINDMAP_0200
         * @tc.name int32ArrayEntriesPart01TestMindmapTest002
         * @tc.desc Verify length=3 Int32Array entries() starts at index 0 with value 0
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEntriesPart01TestMindmapTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let a: Int32Array = new Int32Array(3);
          let r = a.entries().next();
          let pair: [int, number] = r.value as [int, number];
          expect(r.done).assertFalse();
          expect(pair[0]).assertEqual(0);
          expect(pair[1]).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ENTRIES_PART01_TEST_MINDMAP_0300
         * @tc.name int32ArrayEntriesPart01TestMindmapTest003
         * @tc.desc Verify array literal entries() starts at index 0 with value 1
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEntriesPart01TestMindmapTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let a: Int32Array = new Int32Array([1, 2, 3]);
          let r = a.entries().next();
          expect(r.done).assertFalse();
          expect(r.value![0]).assertEqual(0);
          expect(r.value![1]).assertEqual(1);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ENTRIES_PART01_TEST_MINDMAP_0400
         * @tc.name int32ArrayEntriesPart01TestMindmapTest004
         * @tc.desc Verify Int32Array.of entries() starts at index 0 with value 10
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEntriesPart01TestMindmapTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let a: Int32Array = Int32Array.of(10, 20, 30);
          let r = a.entries().next();
          expect(r.done).assertFalse();
          expect(r.value![0]).assertEqual(0);
          expect(r.value![1]).assertEqual(10);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ENTRIES_PART01_TEST_MINDMAP_0500
         * @tc.name int32ArrayEntriesPart01TestMindmapTest005
         * @tc.desc Verify Int32Array.from entries() starts at index 0 with value 4
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEntriesPart01TestMindmapTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let src: int[] = [4, 5];
          let a: Int32Array = Int32Array.from(src);
          let r = a.entries().next();
          expect(r.done).assertFalse();
          expect(r.value![0]).assertEqual(0);
          expect(r.value![1]).assertEqual(4);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ENTRIES_PART01_TEST_MINDMAP_0600
         * @tc.name int32ArrayEntriesPart01TestMindmapTest006
         * @tc.desc Verify Int32Array.of(1).entries() next
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEntriesPart01TestMindmapTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let iter = Int32Array.of(1).entries();
          let r = iter.next();
          expect(r.done).assertFalse();
          expect(r.value![0]).assertEqual(0);
          expect(r.value![1]).assertEqual(1);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ENTRIES_PART01_TEST_MINDMAP_0700
         * @tc.name int32ArrayEntriesPart01TestMindmapTest007
         * @tc.desc Verify ArrayBuffer-backed entries() returns the first pair
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEntriesPart01TestMindmapTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let buf = new ArrayBuffer(16);
          let a: Int32Array = new Int32Array(buf);
          let r = a.entries().next();
          expect(r.done).assertFalse();
          expect(r.value![0]).assertEqual(0);
          expect(r.value![1]).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ENTRIES_PART01_TEST_MINDMAP_0800
         * @tc.name int32ArrayEntriesPart01TestMindmapTest008
         * @tc.desc Verify subarray entries() returns the first pair
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEntriesPart01TestMindmapTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let a: Int32Array = new Int32Array([1, 2, 3]);
          let sub = a.subarray(1);
          let r = sub.entries().next();
          expect(r.done).assertFalse();
          expect(r.value![0]).assertEqual(0);
          expect(r.value![1]).assertEqual(2);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ENTRIES_PART01_TEST_MINDMAP_0900
         * @tc.name int32ArrayEntriesPart01TestMindmapTest009
         * @tc.desc Verify 0 new Int32Array(0) entries() next().done true
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEntriesPart01TestMindmapTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let a: Int32Array = new Int32Array(0);
          let r = a.entries().next();
          expect(r.done).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ENTRIES_PART01_TEST_MINDMAP_1000
         * @tc.name int32ArrayEntriesPart01TestMindmapTest010
         * @tc.desc Verify 1 new Int32Array(1) entries() next
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEntriesPart01TestMindmapTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let a: Int32Array = new Int32Array(1);
          let r = a.entries().next();
          expect(r.done).assertFalse();
          expect(r.value![0]).assertEqual(0);
          expect(r.value![1]).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ENTRIES_PART01_TEST_MINDMAP_1100
         * @tc.name int32ArrayEntriesPart01TestMindmapTest011
         * @tc.desc Verify new Int32Array([]) entries() next().done true
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEntriesPart01TestMindmapTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let src: int[] = [];
          let a: Int32Array = new Int32Array(src);
          let r = a.entries().next();
          expect(r.done).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ENTRIES_PART01_TEST_MINDMAP_1200
         * @tc.name int32ArrayEntriesPart01TestMindmapTest012
         * @tc.desc Verify new Int32Array([42]) entries() value 42
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEntriesPart01TestMindmapTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let a: Int32Array = new Int32Array([42]);
          let r = a.entries().next();
          expect(r.done).assertFalse();
          expect(r.value![0]).assertEqual(0);
          expect(r.value![1]).assertEqual(42);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ENTRIES_PART01_TEST_MINDMAP_1300
         * @tc.name int32ArrayEntriesPart01TestMindmapTest013
         * @tc.desc Verify Int32Array.of() length=0 entries() next().done true
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEntriesPart01TestMindmapTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let a: Int32Array = Int32Array.of();
          let r = a.entries().next();
          expect(r.done).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ENTRIES_PART01_TEST_MINDMAP_1400
         * @tc.name int32ArrayEntriesPart01TestMindmapTest014
         * @tc.desc Verify Int32Array.of entries() index 0
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEntriesPart01TestMindmapTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let a: Int32Array = Int32Array.of(99);
          let r = a.entries().next();
          expect(r.done).assertFalse();
          expect(r.value![0]).assertEqual(0);
          expect(r.value![1]).assertEqual(99);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ENTRIES_PART01_TEST_MINDMAP_1500
         * @tc.name int32ArrayEntriesPart01TestMindmapTest015
         * @tc.desc Verify Int32Array.from length=0 entries() next().done true
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEntriesPart01TestMindmapTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let src: int[] = [];
          let a: Int32Array = Int32Array.from(src);
          let r = a.entries().next();
          expect(r.done).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ENTRIES_PART01_TEST_MINDMAP_1600
         * @tc.name int32ArrayEntriesPart01TestMindmapTest016
         * @tc.desc Verify ArrayBuffer new Int32Array(buf, 4, 2) entries()
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEntriesPart01TestMindmapTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let buf = new ArrayBuffer(16);
          let a: Int32Array = new Int32Array(buf, 4, 2);
          let r = a.entries().next();
          expect(r.done).assertFalse();
          expect(r.value![0]).assertEqual(0);
          expect(r.value![1]).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ENTRIES_PART01_TEST_MINDMAP_1700
         * @tc.name int32ArrayEntriesPart01TestMindmapTest017
         * @tc.desc Verify subarray(1,2) entries() index 0
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEntriesPart01TestMindmapTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let a: Int32Array = new Int32Array([10, 20, 30]);
          let sub = a.subarray(1, 2);
          let r = sub.entries().next();
          expect(r.done).assertFalse();
          expect(r.value![0]).assertEqual(0);
          expect(r.value![1]).assertEqual(20);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ENTRIES_PART01_TEST_MINDMAP_1800
         * @tc.name int32ArrayEntriesPart01TestMindmapTest018
         * @tc.desc Verify new Int32Array(other) entries()
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEntriesPart01TestMindmapTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let src: Int32Array = new Int32Array([7]);
          let a: Int32Array = new Int32Array(src);
          let r = a.entries().next();
          expect(r.done).assertFalse();
          expect(r.value![0]).assertEqual(0);
          expect(r.value![1]).assertEqual(7);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ENTRIES_PART01_TEST_MINDMAP_1900
         * @tc.name int32ArrayEntriesPart01TestMindmapTest019
         * @tc.desc Verify number new Int32Array(2) entries()
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEntriesPart01TestMindmapTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let a: Int32Array = new Int32Array(2);
          let r = a.entries().next();
          expect(r.done).assertFalse();
          expect(r.value![0]).assertEqual(0);
          expect(r.value![1]).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ENTRIES_PART01_TEST_MINDMAP_2000
         * @tc.name int32ArrayEntriesPart01TestMindmapTest020
         * @tc.desc Verify length=0 entries() next done true
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEntriesPart01TestMindmapTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let a: Int32Array = new Int32Array();
          let iter = a.entries();
          expect(iter.next().done).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ENTRIES_PART01_TEST_MINDMAP_2100
         * @tc.name int32ArrayEntriesPart01TestMindmapTest021
         * @tc.desc Verify length=1 entries() 1 next done false
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEntriesPart01TestMindmapTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let a: Int32Array = new Int32Array(1);
          let iter = a.entries();
          expect(iter.next().done).assertFalse();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ENTRIES_PART01_TEST_MINDMAP_2200
         * @tc.name int32ArrayEntriesPart01TestMindmapTest022
         * @tc.desc Verify length=1 entries() 2 next done true
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEntriesPart01TestMindmapTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let a: Int32Array = new Int32Array(1);
          let iter = a.entries();
          iter.next();
          let r = iter.next();
          expect(r.done).assertTrue();
          expect(r.value).assertEqual(undefined);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ENTRIES_PART01_TEST_MINDMAP_2300
         * @tc.name int32ArrayEntriesPart01TestMindmapTest023
         * @tc.desc Verify length=2 entries() 2 next
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEntriesPart01TestMindmapTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let a: Int32Array = new Int32Array([1, 2]);
          let iter = a.entries();
          iter.next();
          expect(iter.next().done).assertFalse();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ENTRIES_PART01_TEST_MINDMAP_2400
         * @tc.name int32ArrayEntriesPart01TestMindmapTest024
         * @tc.desc Verify length=2 entries() 3 next
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEntriesPart01TestMindmapTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let a: Int32Array = new Int32Array([1, 2]);
          let iter = a.entries();
          iter.next();
          iter.next();
          let r = iter.next();
          expect(r.done).assertTrue();
          expect(r.value).assertEqual(undefined);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ENTRIES_PART01_TEST_MINDMAP_2500
         * @tc.name int32ArrayEntriesPart01TestMindmapTest025
         * @tc.desc Verify length=32 entries() 32 done=false
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEntriesPart01TestMindmapTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let a: Int32Array = new Int32Array(32);
          let iter = a.entries();
          for (let i = 0; i < 31; i++) {
          iter.next();
          }
          expect(iter.next().done).assertFalse();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ENTRIES_PART01_TEST_MINDMAP_2600
         * @tc.name int32ArrayEntriesPart01TestMindmapTest026
         * @tc.desc Verify length=32 entries() 33 next done=true
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEntriesPart01TestMindmapTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let a: Int32Array = new Int32Array(32);
          let iter = a.entries();
          for (let i = 0; i < 32; i++) {
          iter.next();
          }
          let r = iter.next();
          expect(r.done).assertTrue();
          expect(r.value).assertEqual(undefined);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ENTRIES_PART01_TEST_MINDMAP_2700
         * @tc.name int32ArrayEntriesPart01TestMindmapTest027
         * @tc.desc Verify 0 entries() value 0
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEntriesPart01TestMindmapTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let a: Int32Array = new Int32Array([0]);
          let r = a.entries().next();
          expect(r.done).assertFalse();
          expect(r.value![0]).assertEqual(0);
          expect(r.value![1]).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ENTRIES_PART01_TEST_MINDMAP_2800
         * @tc.name int32ArrayEntriesPart01TestMindmapTest028
         * @tc.desc Verify $_set -0 ToInt32 0 entries() 0
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEntriesPart01TestMindmapTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let a: Int32Array = new Int32Array(1);
          a.$_set(0, -0);
          let r = a.entries().next();
          expect(r.done).assertFalse();
          expect(r.value![0]).assertEqual(0);
          expect(r.value![1]).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ENTRIES_PART01_TEST_MINDMAP_2900
         * @tc.name int32ArrayEntriesPart01TestMindmapTest029
         * @tc.desc Verify 1 entries() value 1
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEntriesPart01TestMindmapTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let a: Int32Array = new Int32Array([1]);
          let r = a.entries().next();
          expect(r.done).assertFalse();
          expect(r.value![0]).assertEqual(0);
          expect(r.value![1]).assertEqual(1);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ENTRIES_PART01_TEST_MINDMAP_3000
         * @tc.name int32ArrayEntriesPart01TestMindmapTest030
         * @tc.desc Verify -1 entries() value -1
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEntriesPart01TestMindmapTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let a: Int32Array = new Int32Array([-1]);
          let r = a.entries().next();
          expect(r.done).assertFalse();
          expect(r.value![0]).assertEqual(0);
          expect(r.value![1]).assertEqual(-1);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ENTRIES_PART01_TEST_MINDMAP_3100
         * @tc.name int32ArrayEntriesPart01TestMindmapTest031
         * @tc.desc Verify INT32_MAX entries() returns 2147483647
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEntriesPart01TestMindmapTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let a: Int32Array = new Int32Array([2147483647]);
          let r = a.entries().next();
          expect(r.done).assertFalse();
          expect(r.value![0]).assertEqual(0);
          expect(r.value![1]).assertEqual(2147483647);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ENTRIES_PART01_TEST_MINDMAP_3200
         * @tc.name int32ArrayEntriesPart01TestMindmapTest032
         * @tc.desc Verify int32 -2147483648 entries()
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEntriesPart01TestMindmapTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let a: Int32Array = new Int32Array([-2147483648]);
          let r = a.entries().next();
          expect(r.done).assertFalse();
          expect(r.value![0]).assertEqual(0);
          expect(r.value![1]).assertEqual(-2147483648);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ENTRIES_PART01_TEST_MINDMAP_3300
         * @tc.name int32ArrayEntriesPart01TestMindmapTest033
         * @tc.desc Verify number 3.7 ToIndex 3 entries() 3
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEntriesPart01TestMindmapTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let a: Int32Array = new Int32Array(3.7);
          let iter = a.entries();
          iter.next();
          iter.next();
          let r = iter.next();
          expect(r.done).assertFalse();
          expect(r.value![0]).assertEqual(2);
          expect(r.value![1]).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ENTRIES_PART01_TEST_MINDMAP_3400
         * @tc.name int32ArrayEntriesPart01TestMindmapTest034
         * @tc.desc Verify decimal value 100 entries() returns 100
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEntriesPart01TestMindmapTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let a: Int32Array = new Int32Array([100]);
          let r = a.entries().next();
          expect(r.done).assertFalse();
          expect(r.value![0]).assertEqual(0);
          expect(r.value![1]).assertEqual(100);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ENTRIES_PART01_TEST_MINDMAP_3500
         * @tc.name int32ArrayEntriesPart01TestMindmapTest035
         * @tc.desc Verify MAX+1=2147483648 ToInt32 -2147483648 entries()
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEntriesPart01TestMindmapTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let a: Int32Array = new Int32Array(1);
          a.$_set(0, 2147483648 as number);
          let r = a.entries().next();
          expect(r.done).assertFalse();
          expect(r.value![0]).assertEqual(0);
          expect(r.value![1]).assertEqual(-2147483648);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ENTRIES_PART01_TEST_MINDMAP_3600
         * @tc.name int32ArrayEntriesPart01TestMindmapTest036
         * @tc.desc Verify MAX+2=2147483649 ToInt32 -2147483647 entries()
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEntriesPart01TestMindmapTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let a: Int32Array = new Int32Array(1);
          a.$_set(0, 2147483649 as number);
          let r = a.entries().next();
          expect(r.done).assertFalse();
          expect(r.value![0]).assertEqual(0);
          expect(r.value![1]).assertEqual(-2147483647);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ENTRIES_PART01_TEST_MINDMAP_3700
         * @tc.name int32ArrayEntriesPart01TestMindmapTest037
         * @tc.desc Verify MIN-1=-2147483649 ToInt32 2147483647 entries()
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEntriesPart01TestMindmapTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let a: Int32Array = new Int32Array(1);
          a.$_set(0, -2147483649 as number);
          let r = a.entries().next();
          expect(r.done).assertFalse();
          expect(r.value![0]).assertEqual(0);
          expect(r.value![1]).assertEqual(2147483647);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ENTRIES_PART01_TEST_MINDMAP_3800
         * @tc.name int32ArrayEntriesPart01TestMindmapTest038
         * @tc.desc Verify 4294967295 0xFFFFFFFF ToInt32 -1 entries() -1
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEntriesPart01TestMindmapTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let a: Int32Array = new Int32Array(1);
          a.$_set(0, 4294967295 as number);
          let r = a.entries().next();
          expect(r.done).assertFalse();
          expect(r.value![0]).assertEqual(0);
          expect(r.value![1]).assertEqual(-1);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ENTRIES_PART01_TEST_MINDMAP_3900
         * @tc.name int32ArrayEntriesPart01TestMindmapTest039
         * @tc.desc Verify 4294967296 0x100000000 ToInt32 0 entries() 0
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEntriesPart01TestMindmapTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let a: Int32Array = new Int32Array(1);
          a.$_set(0, 4294967296 as number);
          let r = a.entries().next();
          expect(r.done).assertFalse();
          expect(r.value![0]).assertEqual(0);
          expect(r.value![1]).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ENTRIES_PART01_TEST_MINDMAP_4000
         * @tc.name int32ArrayEntriesPart01TestMindmapTest040
         * @tc.desc Verify 4294967297 0x100000001 ToInt32 1 entries() 1
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEntriesPart01TestMindmapTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let a: Int32Array = new Int32Array(1);
          a.$_set(0, 4294967297 as number);
          let r = a.entries().next();
          expect(r.done).assertFalse();
          expect(r.value![0]).assertEqual(0);
          expect(r.value![1]).assertEqual(1);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ENTRIES_PART01_TEST_MINDMAP_4100
         * @tc.name int32ArrayEntriesPart01TestMindmapTest041
         * @tc.desc Verify 3 ToInt32 3 entries() 3
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEntriesPart01TestMindmapTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let a: Int32Array = new Int32Array(1);
          a.$_set(0, 3);
          let r = a.entries().next();
          expect(r.done).assertFalse();
          expect(r.value![0]).assertEqual(0);
          expect(r.value![1]).assertEqual(3);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ENTRIES_PART01_TEST_MINDMAP_4200
         * @tc.name int32ArrayEntriesPart01TestMindmapTest042
         * @tc.desc Verify -3 ToInt32 -3 entries() -3
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEntriesPart01TestMindmapTest042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let a: Int32Array = new Int32Array(1);
          a.$_set(0, -3);
          let r = a.entries().next();
          expect(r.done).assertFalse();
          expect(r.value![0]).assertEqual(0);
          expect(r.value![1]).assertEqual(-3);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ENTRIES_PART01_TEST_MINDMAP_4300
         * @tc.name int32ArrayEntriesPart01TestMindmapTest043
         * @tc.desc Verify 3.999 ToInt32 3 entries() 3
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEntriesPart01TestMindmapTest043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let a: Int32Array = new Int32Array(1);
          a.$_set(0, 3.999);
          let r = a.entries().next();
          expect(r.done).assertFalse();
          expect(r.value![0]).assertEqual(0);
          expect(r.value![1]).assertEqual(3);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ENTRIES_PART01_TEST_MINDMAP_4400
         * @tc.name int32ArrayEntriesPart01TestMindmapTest044
         * @tc.desc Verify 2147483647.9 ToInt32 2147483647 entries() MAX
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEntriesPart01TestMindmapTest044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let a: Int32Array = new Int32Array(1);
          a.$_set(0, 2147483647.9);
          let r = a.entries().next();
          expect(r.done).assertFalse();
          expect(r.value![0]).assertEqual(0);
          expect(r.value![1]).assertEqual(2147483647);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ENTRIES_PART01_TEST_MINDMAP_4500
         * @tc.name int32ArrayEntriesPart01TestMindmapTest045
         * @tc.desc Verify entries() returns 0 for element set to 0
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEntriesPart01TestMindmapTest045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let a: Int32Array = new Int32Array(1);
          a.$_set(0, 0);
          let r = a.entries().next();
          expect(r.done).assertFalse();
          expect(r.value![0]).assertEqual(0);
          expect(r.value![1]).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ENTRIES_PART01_TEST_MINDMAP_4600
         * @tc.name int32ArrayEntriesPart01TestMindmapTest046
         * @tc.desc Verify [10,20,30] entries() value 10
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEntriesPart01TestMindmapTest046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let a: Int32Array = new Int32Array([10, 20, 30]);
          let r = a.entries().next();
          expect(r.done).assertFalse();
          expect(r.value![0]).assertEqual(0);
          expect(r.value![1]).assertEqual(10);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ENTRIES_PART01_TEST_MINDMAP_4700
         * @tc.name int32ArrayEntriesPart01TestMindmapTest047
         * @tc.desc Verify [-5,0,5] entries() value -5
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEntriesPart01TestMindmapTest047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let a: Int32Array = new Int32Array([-5, 0, 5]);
          let r = a.entries().next();
          expect(r.done).assertFalse();
          expect(r.value![0]).assertEqual(0);
          expect(r.value![1]).assertEqual(-5);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ENTRIES_PART01_TEST_MINDMAP_4800
         * @tc.name int32ArrayEntriesPart01TestMindmapTest048
         * @tc.desc Verify [7,7,7] entries() value 7
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEntriesPart01TestMindmapTest048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let a: Int32Array = new Int32Array([7, 7, 7]);
          let r = a.entries().next();
          expect(r.done).assertFalse();
          expect(r.value![0]).assertEqual(0);
          expect(r.value![1]).assertEqual(7);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ENTRIES_PART01_TEST_MINDMAP_4900
         * @tc.name int32ArrayEntriesPart01TestMindmapTest049
         * @tc.desc Verify 0 [0,0,0] entries() value 0
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEntriesPart01TestMindmapTest049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let a: Int32Array = new Int32Array([0, 0, 0]);
          let r = a.entries().next();
          expect(r.done).assertFalse();
          expect(r.value![0]).assertEqual(0);
          expect(r.value![1]).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ENTRIES_PART01_TEST_MINDMAP_5000
         * @tc.name int32ArrayEntriesPart01TestMindmapTest050
         * @tc.desc Verify -1 [-1,2,3] entries() value -1
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEntriesPart01TestMindmapTest050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let a: Int32Array = new Int32Array([-1, 2, 3]);
          let r = a.entries().next();
          expect(r.done).assertFalse();
          expect(r.value![0]).assertEqual(0);
          expect(r.value![1]).assertEqual(-1);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ENTRIES_PART01_TEST_MINDMAP_5100
         * @tc.name int32ArrayEntriesPart01TestMindmapTest051
         * @tc.desc Verify [MAX, MIN] entries() value MIN
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEntriesPart01TestMindmapTest051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let a: Int32Array = new Int32Array(2);
          a.$_set(0, 2147483647);
          a.$_set(1, -2147483648 as number);
          let iter = a.entries();
          iter.next();
          let r = iter.next();
          expect(r.done).assertFalse();
          expect(r.value![0]).assertEqual(1);
          expect(r.value![1]).assertEqual(-2147483648);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ENTRIES_PART01_TEST_MINDMAP_5200
         * @tc.name int32ArrayEntriesPart01TestMindmapTest052
         * @tc.desc Verify ArrayBuffer(byteLength=4) entries() buffer 0
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEntriesPart01TestMindmapTest052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let buf = new ArrayBuffer(4);
          let a: Int32Array = new Int32Array(buf, 0, 1);
          let r = a.entries().next();
          expect(r.done).assertFalse();
          expect(r.value![0]).assertEqual(0);
          expect(r.value![1]).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ENTRIES_PART01_TEST_MINDMAP_5300
         * @tc.name int32ArrayEntriesPart01TestMindmapTest053
         * @tc.desc Verify ArrayBuffer(byteOffset=4, length=1) entries()
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEntriesPart01TestMindmapTest053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let buf = new ArrayBuffer(8);
          let a: Int32Array = new Int32Array(buf, 4, 1);
          let r = a.entries().next();
          expect(r.done).assertFalse();
          expect(r.value![0]).assertEqual(0);
          expect(r.value![1]).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ENTRIES_PART01_TEST_MINDMAP_5400
         * @tc.name int32ArrayEntriesPart01TestMindmapTest054
         * @tc.desc Verify ArrayBuffer(byteOffset=8, length=2) entries() index=0
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEntriesPart01TestMindmapTest054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let buf = new ArrayBuffer(16);
          let a: Int32Array = new Int32Array(buf, 8, 2);
          let r = a.entries().next();
          expect(r.done).assertFalse();
          expect(r.value![0]).assertEqual(0);
          expect(r.value![1]).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ENTRIES_PART01_TEST_MINDMAP_5500
         * @tc.name int32ArrayEntriesPart01TestMindmapTest055
         * @tc.desc Verify Int32Array ArrayBuffer $_set entries()
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEntriesPart01TestMindmapTest055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let buf = new ArrayBuffer(8);
          let a1: Int32Array = new Int32Array(buf, 0, 2);
          a1.$_set(0, 77);
          let a2: Int32Array = new Int32Array(buf, 0, 2);
          let r = a2.entries().next();
          expect(r.done).assertFalse();
          expect(r.value![0]).assertEqual(0);
          expect(r.value![1]).assertEqual(77);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ENTRIES_PART01_TEST_MINDMAP_5600
         * @tc.name int32ArrayEntriesPart01TestMindmapTest056
         * @tc.desc Verify ArrayBuffer a1 0 a2(byteOffset=4) entries() 0
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEntriesPart01TestMindmapTest056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let buf = new ArrayBuffer(8);
          let a1: Int32Array = new Int32Array(buf, 0, 1);
          let a2: Int32Array = new Int32Array(buf, 4, 1);
          a1.$_set(0, 99);
          let r = a2.entries().next();
          expect(r.done).assertFalse();
          expect(r.value![0]).assertEqual(0);
          expect(r.value![1]).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ENTRIES_PART01_TEST_MINDMAP_5700
         * @tc.name int32ArrayEntriesPart01TestMindmapTest057
         * @tc.desc Verify ArrayBuffer byteLength=4096 Int32Array entries()
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEntriesPart01TestMindmapTest057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let buf = new ArrayBuffer(4096);
          let a: Int32Array = new Int32Array(buf);
          let r = a.entries().next();
          expect(r.done).assertFalse();
          expect(r.value![0]).assertEqual(0);
          expect(r.value![1]).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ENTRIES_PART01_TEST_MINDMAP_5800
         * @tc.name int32ArrayEntriesPart01TestMindmapTest058
         * @tc.desc Verify ArrayBuffer byteOffset=12 3 int32 length=1 entries()
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEntriesPart01TestMindmapTest058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let buf = new ArrayBuffer(16);
          let a: Int32Array = new Int32Array(buf, 12, 1);
          let r = a.entries().next();
          expect(r.done).assertFalse();
          expect(r.value![0]).assertEqual(0);
          expect(r.value![1]).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ENTRIES_PART01_TEST_MINDMAP_5900
         * @tc.name int32ArrayEntriesPart01TestMindmapTest059
         * @tc.desc Verify subarray(1) entries() value 1 20
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEntriesPart01TestMindmapTest059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let a: Int32Array = new Int32Array([10, 20, 30]);
          let sub = a.subarray(1);
          let r = sub.entries().next();
          expect(r.done).assertFalse();
          expect(r.value![0]).assertEqual(0);
          expect(r.value![1]).assertEqual(20);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ENTRIES_PART01_TEST_MINDMAP_6000
         * @tc.name int32ArrayEntriesPart01TestMindmapTest060
         * @tc.desc Verify subarray(0,0) entries() next().done true
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEntriesPart01TestMindmapTest060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let a: Int32Array = new Int32Array([1, 2, 3]);
          let sub = a.subarray(0, 0);
          let r = sub.entries().next();
          expect(r.done).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ENTRIES_PART01_TEST_MINDMAP_6100
         * @tc.name int32ArrayEntriesPart01TestMindmapTest061
         * @tc.desc Verify subarray(2,3) entries() value 2 30
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEntriesPart01TestMindmapTest061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let a: Int32Array = new Int32Array([10, 20, 30]);
          let sub = a.subarray(2, 3);
          let r = sub.entries().next();
          expect(r.done).assertFalse();
          expect(r.value![0]).assertEqual(0);
          expect(r.value![1]).assertEqual(30);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ENTRIES_PART01_TEST_MINDMAP_6200
         * @tc.name int32ArrayEntriesPart01TestMindmapTest062
         * @tc.desc Verify subarray entries() buffer
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEntriesPart01TestMindmapTest062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let a: Int32Array = new Int32Array([1, 2, 3]);
          let sub = a.subarray(0, 2);
          a.$_set(1, 999);
          let iter = sub.entries();
          iter.next();
          let r = iter.next();
          expect(r.done).assertFalse();
          expect(r.value![0]).assertEqual(1);
          expect(r.value![1]).assertEqual(999);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ENTRIES_PART01_TEST_MINDMAP_6300
         * @tc.name int32ArrayEntriesPart01TestMindmapTest063
         * @tc.desc Verify subarray subarray(3,3) length=0 entries() done true
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEntriesPart01TestMindmapTest063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let a: Int32Array = new Int32Array([1, 2, 3]);
          let sub = a.subarray(3, 3);
          let r = sub.entries().next();
          expect(r.done).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ENTRIES_PART01_TEST_MINDMAP_6400
         * @tc.name int32ArrayEntriesPart01TestMindmapTest064
         * @tc.desc Verify subarray subarray(-1) entries() value
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEntriesPart01TestMindmapTest064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let a: Int32Array = new Int32Array([10, 20, 30]);
          let sub = a.subarray(-1);
          let r = sub.entries().next();
          expect(r.done).assertFalse();
          expect(r.value![0]).assertEqual(0);
          expect(r.value![1]).assertEqual(30);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ENTRIES_PART01_TEST_MINDMAP_6500
         * @tc.name int32ArrayEntriesPart01TestMindmapTest065
         * @tc.desc Verify length=1 $_set(0, 5) entries() value 5
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEntriesPart01TestMindmapTest065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let a: Int32Array = new Int32Array(1);
          a.$_set(0, 5);
          let r = a.entries().next();
          expect(r.done).assertFalse();
          expect(r.value![0]).assertEqual(0);
          expect(r.value![1]).assertEqual(5);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ENTRIES_PART01_TEST_MINDMAP_6600
         * @tc.name int32ArrayEntriesPart01TestMindmapTest066
         * @tc.desc Verify $_set entries()
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEntriesPart01TestMindmapTest066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let a: Int32Array = new Int32Array(3);
          a.$_set(0, 11);
          a.$_set(1, 22);
          a.$_set(2, 33);
          let r = a.entries().next();
          expect(r.done).assertFalse();
          expect(r.value![0]).assertEqual(0);
          expect(r.value![1]).assertEqual(11);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ENTRIES_PART01_TEST_MINDMAP_6700
         * @tc.name int32ArrayEntriesPart01TestMindmapTest067
         * @tc.desc Verify $_set(0, 7) entries() 7
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEntriesPart01TestMindmapTest067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let a: Int32Array = new Int32Array(1);
          a.$_set(0, 1);
          a.$_set(0, 7);
          let r = a.entries().next();
          expect(r.done).assertFalse();
          expect(r.value![0]).assertEqual(0);
          expect(r.value![1]).assertEqual(7);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ENTRIES_PART01_TEST_MINDMAP_6800
         * @tc.name int32ArrayEntriesPart01TestMindmapTest068
         * @tc.desc Verify length=3 $_set(1, 50) entries() value 0
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEntriesPart01TestMindmapTest068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let a: Int32Array = new Int32Array(3);
          a.$_set(1, 50);
          let r = a.entries().next();
          expect(r.done).assertFalse();
          expect(r.value![0]).assertEqual(0);
          expect(r.value![1]).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ENTRIES_PART01_TEST_MINDMAP_6900
         * @tc.name int32ArrayEntriesPart01TestMindmapTest069
         * @tc.desc Verify length=3 MAX entries() value MAX
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEntriesPart01TestMindmapTest069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let a: Int32Array = new Int32Array(3);
          a.$_set(2, 2147483647);
          let iter = a.entries();
          iter.next();
          iter.next();
          let r = iter.next();
          expect(r.done).assertFalse();
          expect(r.value![0]).assertEqual(2);
          expect(r.value![1]).assertEqual(2147483647);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ENTRIES_PART01_TEST_MINDMAP_7000
         * @tc.name int32ArrayEntriesPart01TestMindmapTest070
         * @tc.desc Verify new Int32Array(3).fill(8) entries() value 8
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEntriesPart01TestMindmapTest070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let a: Int32Array = new Int32Array(3);
          a.fill(8);
          let r = a.entries().next();
          expect(r.done).assertFalse();
          expect(r.value![0]).assertEqual(0);
          expect(r.value![1]).assertEqual(8);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ENTRIES_PART01_TEST_MINDMAP_7100
         * @tc.name int32ArrayEntriesPart01TestMindmapTest071
         * @tc.desc Verify new Int32Array(3).fill(-1) entries() value -1
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEntriesPart01TestMindmapTest071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let a: Int32Array = new Int32Array(3);
          a.fill(-1);
          let r = a.entries().next();
          expect(r.done).assertFalse();
          expect(r.value![0]).assertEqual(0);
          expect(r.value![1]).assertEqual(-1);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ENTRIES_PART01_TEST_MINDMAP_7200
         * @tc.name int32ArrayEntriesPart01TestMindmapTest072
         * @tc.desc Verify new Int32Array(2).fill(MAX) entries() value 2147483647
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEntriesPart01TestMindmapTest072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let a: Int32Array = new Int32Array(2);
          a.fill(2147483647);
          let r = a.entries().next();
          expect(r.done).assertFalse();
          expect(r.value![0]).assertEqual(0);
          expect(r.value![1]).assertEqual(2147483647);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ENTRIES_PART01_TEST_MINDMAP_7300
         * @tc.name int32ArrayEntriesPart01TestMindmapTest073
         * @tc.desc Verify [1,2,3].reverse() entries() value 3
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEntriesPart01TestMindmapTest073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let a: Int32Array = new Int32Array([1, 2, 3]);
          a.reverse();
          let r = a.entries().next();
          expect(r.done).assertFalse();
          expect(r.value![0]).assertEqual(0);
          expect(r.value![1]).assertEqual(3);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ENTRIES_PART01_TEST_MINDMAP_7400
         * @tc.name int32ArrayEntriesPart01TestMindmapTest074
         * @tc.desc Verify [-1,0,1].sort() entries() value -1
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEntriesPart01TestMindmapTest074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let a: Int32Array = new Int32Array([-1, 0, 1]);
          a.sort();
          let r = a.entries().next();
          expect(r.done).assertFalse();
          expect(r.value![0]).assertEqual(0);
          expect(r.value![1]).assertEqual(-1);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ENTRIES_PART01_TEST_MINDMAP_7500
         * @tc.name int32ArrayEntriesPart01TestMindmapTest075
         * @tc.desc Verify [MAX, 0, MIN].sort() entries() value MIN
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEntriesPart01TestMindmapTest075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let a: Int32Array = new Int32Array(3);
          a.$_set(0, 2147483647);
          a.$_set(1, 0);
          a.$_set(2, -2147483648 as number);
          a.sort();
          let r = a.entries().next();
          expect(r.done).assertFalse();
          expect(r.value![0]).assertEqual(0);
          expect(r.value![1]).assertEqual(-2147483648);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ENTRIES_PART01_TEST_MINDMAP_7600
         * @tc.name int32ArrayEntriesPart01TestMindmapTest076
         * @tc.desc Verify [1,2,3,4].copyWithin(2,0) entries() 3 index=2 value 1
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEntriesPart01TestMindmapTest076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let a: Int32Array = new Int32Array([1, 2, 3, 4]);
          a.copyWithin(2, 0);
          let iter = a.entries();
          iter.next();
          iter.next();
          let r = iter.next();
          expect(r.done).assertFalse();
          expect(r.value![0]).assertEqual(2);
          expect(r.value![1]).assertEqual(1);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ENTRIES_PART01_TEST_MINDMAP_7700
         * @tc.name int32ArrayEntriesPart01TestMindmapTest077
         * @tc.desc Verify Int32Array(3).set([7,8,9]) entries() value 7
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEntriesPart01TestMindmapTest077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let a: Int32Array = new Int32Array(3);
          let src: number[] = [7, 8, 9];
          a.set(src);
          let r = a.entries().next();
          expect(r.done).assertFalse();
          expect(r.value![0]).assertEqual(0);
          expect(r.value![1]).assertEqual(7);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ENTRIES_PART01_TEST_MINDMAP_7800
         * @tc.name int32ArrayEntriesPart01TestMindmapTest078
         * @tc.desc Verify Int32Array(4).set([11,22], 2) offset=2 entries() 0
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEntriesPart01TestMindmapTest078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let a: Int32Array = new Int32Array(4);
          let src: number[] = [11, 22];
          a.set(src, 2);
          let r = a.entries().next();
          expect(r.done).assertFalse();
          expect(r.value![0]).assertEqual(0);
          expect(r.value![1]).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ENTRIES_PART01_TEST_MINDMAP_7900
         * @tc.name int32ArrayEntriesPart01TestMindmapTest079
         * @tc.desc Verify Int32Array(4).set([11,22], 2) entries() 3 value 11
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEntriesPart01TestMindmapTest079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let a: Int32Array = new Int32Array(4);
          let src: number[] = [11, 22];
          a.set(src, 2);
          let iter = a.entries();
          iter.next();
          iter.next();
          let r = iter.next();
          expect(r.done).assertFalse();
          expect(r.value![0]).assertEqual(2);
          expect(r.value![1]).assertEqual(11);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ENTRIES_PART01_TEST_MINDMAP_8000
         * @tc.name int32ArrayEntriesPart01TestMindmapTest080
         * @tc.desc Verify [1,2,3].slice() entries() value 1
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEntriesPart01TestMindmapTest080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let a: Int32Array = new Int32Array([1, 2, 3]);
          let s = a.slice();
          let r = s.entries().next();
          expect(r.done).assertFalse();
          expect(r.value![0]).assertEqual(0);
          expect(r.value![1]).assertEqual(1);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ENTRIES_PART01_TEST_MINDMAP_8100
         * @tc.name int32ArrayEntriesPart01TestMindmapTest081
         * @tc.desc Verify slice entries()
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEntriesPart01TestMindmapTest081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let a: Int32Array = new Int32Array([1, 2, 3]);
          let s = a.slice();
          s.$_set(0, 999);
          let r = a.entries().next();
          expect(r.done).assertFalse();
          expect(r.value![0]).assertEqual(0);
          expect(r.value![1]).assertEqual(1);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ENTRIES_PART01_TEST_MINDMAP_8200
         * @tc.name int32ArrayEntriesPart01TestMindmapTest082
         * @tc.desc Verify [1,2,3,4].slice(1,3) entries() value 2
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEntriesPart01TestMindmapTest082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let a: Int32Array = new Int32Array([1, 2, 3, 4]);
          let s = a.slice(1, 3);
          let r = s.entries().next();
          expect(r.done).assertFalse();
          expect(r.value![0]).assertEqual(0);
          expect(r.value![1]).assertEqual(2);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ENTRIES_PART01_TEST_MINDMAP_8300
         * @tc.name int32ArrayEntriesPart01TestMindmapTest083
         * @tc.desc Verify length=0 entries() next().value is undefined
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEntriesPart01TestMindmapTest083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let a: Int32Array = new Int32Array();
          let r = a.entries().next();
          expect(r.done).assertTrue();
          expect(r.value).assertEqual(undefined);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ENTRIES_PART01_TEST_MINDMAP_8400
         * @tc.name int32ArrayEntriesPart01TestMindmapTest084
         * @tc.desc Verify non-empty entries() next().value is an index-value pair
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEntriesPart01TestMindmapTest084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let a: Int32Array = new Int32Array([42]);
          let r = a.entries().next();
          expect(r.value === null).assertEqual(false);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ENTRIES_PART01_TEST_MINDMAP_8500
         * @tc.name int32ArrayEntriesPart01TestMindmapTest085
         * @tc.desc Verify entries() next() index 0
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEntriesPart01TestMindmapTest085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let a: Int32Array = new Int32Array([42]);
          let r = a.entries().next();
          expect(r.value![0]).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ENTRIES_PART01_TEST_MINDMAP_8600
         * @tc.name int32ArrayEntriesPart01TestMindmapTest086
         * @tc.desc Verify entries() next() done false
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEntriesPart01TestMindmapTest086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let a: Int32Array = new Int32Array([1]);
          let r = a.entries().next();
          expect(r.done).assertEqual(false);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ENTRIES_PART01_TEST_MINDMAP_8700
         * @tc.name int32ArrayEntriesPart01TestMindmapTest087
         * @tc.desc Verify entries() length length=3 3
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEntriesPart01TestMindmapTest087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let a: Int32Array = new Int32Array([1, 2, 3]);
          a.entries();
          expect(a.length).assertEqual(3);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ENTRIES_PART01_TEST_MINDMAP_8800
         * @tc.name int32ArrayEntriesPart01TestMindmapTest088
         * @tc.desc Verify entries() length
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEntriesPart01TestMindmapTest088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let a: Int32Array = new Int32Array([1, 2]);
          let iter = a.entries();
          iter.next();
          iter.next();
          iter.next();
          expect(a.length).assertEqual(2);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ENTRIES_PART01_TEST_MINDMAP_8900
         * @tc.name int32ArrayEntriesPart01TestMindmapTest089
         * @tc.desc Verify entries()
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEntriesPart01TestMindmapTest089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let a: Int32Array = new Int32Array([5, 6]);
          let iter = a.entries();
          iter.next();
          iter.next();
          expect(a.$_get(0)).assertEqual(5);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ENTRIES_PART01_TEST_MINDMAP_9000
         * @tc.name int32ArrayEntriesPart01TestMindmapTest090
         * @tc.desc Verify entries()
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEntriesPart01TestMindmapTest090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let a: Int32Array = new Int32Array([100]);
          let iter = a.entries();
          iter.next();
          iter.next();
          expect(a.$_get(0)).assertEqual(100);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ENTRIES_PART01_TEST_MINDMAP_9100
         * @tc.name int32ArrayEntriesPart01TestMindmapTest091
         * @tc.desc Verify Int32Array.from([1,2,3], x => x*2) entries() value 2
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEntriesPart01TestMindmapTest091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let src: number[] = [1, 2, 3];
          let a: Int32Array = Int32Array.from(src, (x: number) => x * 2);
          let r = a.entries().next();
          expect(r.done).assertFalse();
          expect(r.value![0]).assertEqual(0);
          expect(r.value![1]).assertEqual(2);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ENTRIES_PART01_TEST_MINDMAP_9200
         * @tc.name int32ArrayEntriesPart01TestMindmapTest092
         * @tc.desc Verify Int32Array.from([1], x => -x) entries() value -1
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEntriesPart01TestMindmapTest092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let src: number[] = [1];
          let a: Int32Array = Int32Array.from(src, (x: number) => -x);
          let r = a.entries().next();
          expect(r.done).assertFalse();
          expect(r.value![0]).assertEqual(0);
          expect(r.value![1]).assertEqual(-1);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ENTRIES_PART01_TEST_MINDMAP_9300
         * @tc.name int32ArrayEntriesPart01TestMindmapTest093
         * @tc.desc Verify Int32Array.from([7], x => 0) 0 entries() value 0
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEntriesPart01TestMindmapTest093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let src: number[] = [7];
          let a: Int32Array = Int32Array.from(src, (x: number) => 0);
          let r = a.entries().next();
          expect(r.done).assertFalse();
          expect(r.value![0]).assertEqual(0);
          expect(r.value![1]).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ENTRIES_PART01_TEST_MINDMAP_9400
         * @tc.name int32ArrayEntriesPart01TestMindmapTest094
         * @tc.desc Verify 2 entries() value 2
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEntriesPart01TestMindmapTest094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let a: Int32Array = new Int32Array([2]);
          let r = a.entries().next();
          expect(r.done).assertFalse();
          expect(r.value![0]).assertEqual(0);
          expect(r.value![1]).assertEqual(2);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ENTRIES_PART01_TEST_MINDMAP_9500
         * @tc.name int32ArrayEntriesPart01TestMindmapTest095
         * @tc.desc Verify -2 entries() value -2
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEntriesPart01TestMindmapTest095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let a: Int32Array = new Int32Array([-2]);
          let r = a.entries().next();
          expect(r.done).assertFalse();
          expect(r.value![0]).assertEqual(0);
          expect(r.value![1]).assertEqual(-2);
        });
  });
}
