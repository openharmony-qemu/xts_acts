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
export default function int32ArrayEntriesPart02Test(): void {
  describe('Int32ArrayEntriesPart02Test', (): void => {
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
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ENTRIES_PART02_TEST_MINDMAP_0100
         * @tc.name int32ArrayEntriesPart02TestMindmapTest001
         * @tc.desc Verify entries() first next() returns index 0 and first element value
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEntriesPart02TestMindmapTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let a: Int32Array = Int32Array.of(1, 2, 3);
          let iter = a.entries();
          let r = iter.next();
          expect(r.done).assertFalse();
          expect(r.value![0]).assertEqual(0);
          expect(r.value![1]).assertEqual(1);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ENTRIES_PART02_TEST_MINDMAP_0200
         * @tc.name int32ArrayEntriesPart02TestMindmapTest002
         * @tc.desc Verify entries() on single-element Int32Array returns value 5
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEntriesPart02TestMindmapTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let a: Int32Array = new Int32Array([5]);
          let iter = a.entries();
          let r = iter.next();
          expect(r.done).assertFalse();
          expect(r.value![0]).assertEqual(0);
          expect(r.value![1]).assertEqual(5);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ENTRIES_PART02_TEST_MINDMAP_0300
         * @tc.name int32ArrayEntriesPart02TestMindmapTest003
         * @tc.desc Verify entries() next() returns the first index-value pair
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEntriesPart02TestMindmapTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let a: Int32Array = Int32Array.of(10);
          let iter = a.entries();
          let r = iter.next();
          expect(r.done).assertFalse();
          expect(r.value![0]).assertEqual(0);
          expect(r.value![1]).assertEqual(10);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ENTRIES_PART02_TEST_MINDMAP_0400
         * @tc.name int32ArrayEntriesPart02TestMindmapTest004
         * @tc.desc Verify next() return has done boolean property
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEntriesPart02TestMindmapTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let a: Int32Array = Int32Array.of(1, 2);
          let r = a.entries().next();
          expect(r.done).assertFalse();
          expect(r.value![0]).assertEqual(0);
          expect(r.value![1]).assertEqual(1);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ENTRIES_PART02_TEST_MINDMAP_0500
         * @tc.name int32ArrayEntriesPart02TestMindmapTest005
         * @tc.desc Verify next() value equals source element 42 when not exhausted
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEntriesPart02TestMindmapTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let a: Int32Array = Int32Array.of(42);
          let r = a.entries().next();
          expect(r.done).assertFalse();
          expect(r.value![0]).assertEqual(0);
          expect(r.value![1]).assertEqual(42);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ENTRIES_PART02_TEST_MINDMAP_0600
         * @tc.name int32ArrayEntriesPart02TestMindmapTest006
         * @tc.desc Verify entries() iterable consumed by manual while/next loop
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEntriesPart02TestMindmapTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let a: Int32Array = Int32Array.of(1, 2);
          let count: int = 0;
          let iter = a.entries(); let result = iter.next();
          while (!result.done) {
          count = count + 1;
          result = iter.next(); }
          expect(count).assertEqual(2);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ENTRIES_PART02_TEST_MINDMAP_0700
         * @tc.name int32ArrayEntriesPart02TestMindmapTest007
         * @tc.desc Verify next() done strictly false when not exhausted
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEntriesPart02TestMindmapTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let r = Int32Array.of(99).entries().next();
          expect(r.done).assertFalse();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ENTRIES_PART02_TEST_MINDMAP_0800
         * @tc.name int32ArrayEntriesPart02TestMindmapTest008
         * @tc.desc Verify first next() value index is 0
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEntriesPart02TestMindmapTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let r = Int32Array.of(5, 6).entries().next();
          let idx = r.value![0];
          expect(idx).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ENTRIES_PART02_TEST_MINDMAP_0900
         * @tc.name int32ArrayEntriesPart02TestMindmapTest009
         * @tc.desc Verify first next() value equals first element
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEntriesPart02TestMindmapTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let r = Int32Array.of(5, 6).entries().next();
          let v = r.value![1];
          expect(v).assertEqual(5);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ENTRIES_PART02_TEST_MINDMAP_1000
         * @tc.name int32ArrayEntriesPart02TestMindmapTest010
         * @tc.desc Verify pair index equals 0
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEntriesPart02TestMindmapTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let r = Int32Array.of(1).entries().next();
          expect(r.value![0]).assertEqual(0);
          expect(r.value![1]).assertEqual(1);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ENTRIES_PART02_TEST_MINDMAP_1100
         * @tc.name int32ArrayEntriesPart02TestMindmapTest011
         * @tc.desc Verify pair value equals 1
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEntriesPart02TestMindmapTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let r = Int32Array.of(1).entries().next();
          expect(r.value![1]).assertEqual(1);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ENTRIES_PART02_TEST_MINDMAP_1200
         * @tc.name int32ArrayEntriesPart02TestMindmapTest012
         * @tc.desc Verify entries on multi-element Int32Array yields correct index-value pairs
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEntriesPart02TestMindmapTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let it = Int32Array.of(10, 20, 30).entries();
          let r1 = it.next();
          let r2 = it.next();
          let r3 = it.next();
          expect(r1.value![0]).assertEqual(0);
          expect(r1.value![1]).assertEqual(10);
          expect(r2.value![0]).assertEqual(1);
          expect(r2.value![1]).assertEqual(20);
          expect(r3.value![0]).assertEqual(2);
          expect(r3.value![1]).assertEqual(30);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ENTRIES_PART02_TEST_MINDMAP_1300
         * @tc.name int32ArrayEntriesPart02TestMindmapTest013
         * @tc.desc Verify consecutive next() return distinct index/value pairs
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEntriesPart02TestMindmapTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let iter = Int32Array.of(10, 20).entries();
          let p1 = iter.next().value;
          let p2 = iter.next().value;
          expect(p1![0]).assertEqual(0);
          expect(p1![1] as number).assertEqual(10);
          expect(p2![0]).assertEqual(1);
          expect(p2![1] as number).assertEqual(20);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ENTRIES_PART02_TEST_MINDMAP_1400
         * @tc.name int32ArrayEntriesPart02TestMindmapTest014
         * @tc.desc Verify 1st next() index is 0
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEntriesPart02TestMindmapTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let iter = Int32Array.of(100, 200, 300).entries();
          expect(iter.next().value![0]).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ENTRIES_PART02_TEST_MINDMAP_1500
         * @tc.name int32ArrayEntriesPart02TestMindmapTest015
         * @tc.desc Verify 2nd next() index is 1
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEntriesPart02TestMindmapTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let iter = Int32Array.of(100, 200, 300).entries();
          iter.next();
          expect(iter.next().value![0]).assertEqual(1);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ENTRIES_PART02_TEST_MINDMAP_1600
         * @tc.name int32ArrayEntriesPart02TestMindmapTest016
         * @tc.desc Verify 3rd next() index is 2
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEntriesPart02TestMindmapTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let iter = Int32Array.of(100, 200, 300).entries();
          iter.next();
          iter.next();
          expect(iter.next().value![0]).assertEqual(2);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ENTRIES_PART02_TEST_MINDMAP_1700
         * @tc.name int32ArrayEntriesPart02TestMindmapTest017
         * @tc.desc Verify index sequence 0,1,2,3 via for-of
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEntriesPart02TestMindmapTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let a: Int32Array = Int32Array.of(10, 20, 30, 40);
          let expected: int = 0;
          for (const pair of a.entries()) {
            expect(pair[0]).assertEqual(expected);
            expected = expected + 1;
          }
          expect(expected).assertEqual(4);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ENTRIES_PART02_TEST_MINDMAP_1800
         * @tc.name int32ArrayEntriesPart02TestMindmapTest018
         * @tc.desc Verify single element entries index is 0
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEntriesPart02TestMindmapTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let iter = Int32Array.of(77).entries();
          expect(iter.next().value![0]).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ENTRIES_PART02_TEST_MINDMAP_1900
         * @tc.name int32ArrayEntriesPart02TestMindmapTest019
         * @tc.desc Verify single element next after consume done true
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEntriesPart02TestMindmapTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let iter = Int32Array.of(77).entries();
          iter.next();
          expect(iter.next().done).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ENTRIES_PART02_TEST_MINDMAP_2000
         * @tc.name int32ArrayEntriesPart02TestMindmapTest020
         * @tc.desc Verify single element pair value equals source
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEntriesPart02TestMindmapTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let iter = Int32Array.of(77).entries();
          expect(iter.next().value![1] as number).assertEqual(77);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ENTRIES_PART02_TEST_MINDMAP_2100
         * @tc.name int32ArrayEntriesPart02TestMindmapTest021
         * @tc.desc Verify element 0 pair value is 0
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEntriesPart02TestMindmapTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let a: Int32Array = Int32Array.of(0);
          let r = a.entries().next();
          expect(r.value![1]).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ENTRIES_PART02_TEST_MINDMAP_2200
         * @tc.name int32ArrayEntriesPart02TestMindmapTest022
         * @tc.desc Verify element -1 pair value is -1
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEntriesPart02TestMindmapTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let a: Int32Array = Int32Array.of(-1);
          let r = a.entries().next();
          expect(r.value![1]).assertEqual(-1);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ENTRIES_PART02_TEST_MINDMAP_2300
         * @tc.name int32ArrayEntriesPart02TestMindmapTest023
         * @tc.desc Verify INT_MAX 2147483647 pair value
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEntriesPart02TestMindmapTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let a: Int32Array = Int32Array.of(2147483647);
          let r = a.entries().next();
          expect(r.value![1]).assertEqual(2147483647);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ENTRIES_PART02_TEST_MINDMAP_2400
         * @tc.name int32ArrayEntriesPart02TestMindmapTest024
         * @tc.desc Verify INT_MIN -2147483648 pair value
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEntriesPart02TestMindmapTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let a: Int32Array = new Int32Array(1);
          a.$_set(0, -2147483648 as number);
          let r = a.entries().next();
          expect(r.value![1]).assertEqual(-2147483648);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ENTRIES_PART02_TEST_MINDMAP_2500
         * @tc.name int32ArrayEntriesPart02TestMindmapTest025
         * @tc.desc Verify [10,-20,30] value sequence correct
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEntriesPart02TestMindmapTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let a: Int32Array = Int32Array.of(10, -20, 30);
          let iter = a.entries();
          expect(iter.next().value![1] as number).assertEqual(10);
          expect(iter.next().value![1] as number).assertEqual(-20);
          expect(iter.next().value![1] as number).assertEqual(30);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ENTRIES_PART02_TEST_MINDMAP_2600
         * @tc.name int32ArrayEntriesPart02TestMindmapTest026
         * @tc.desc Verify float 2.9 from() truncated ToInt32=2
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEntriesPart02TestMindmapTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let src: number[] = [2.9];
          let a: Int32Array = Int32Array.from(src);
          let r = a.entries().next();
          expect(r.value![1]).assertEqual(2);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ENTRIES_PART02_TEST_MINDMAP_2700
         * @tc.name int32ArrayEntriesPart02TestMindmapTest027
         * @tc.desc Verify float -0 from() truncated ToInt32=0
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEntriesPart02TestMindmapTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let src: number[] = [-0];
          let a: Int32Array = Int32Array.from(src);
          let r = a.entries().next();
          expect(r.value![1]).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ENTRIES_PART02_TEST_MINDMAP_2800
         * @tc.name int32ArrayEntriesPart02TestMindmapTest028
         * @tc.desc Verify hex literal 0xFF value 255
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEntriesPart02TestMindmapTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let a: Int32Array = Int32Array.of(0xFF);
          let r = a.entries().next();
          expect(r.value![1]).assertEqual(255);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ENTRIES_PART02_TEST_MINDMAP_2900
         * @tc.name int32ArrayEntriesPart02TestMindmapTest029
         * @tc.desc Verify length=1 for-of iterates 1 time
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEntriesPart02TestMindmapTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let a: Int32Array = Int32Array.of(9);
          let count: int = 0;
          for (const pair of a.entries()) {
            count = count + 1;
          }
          expect(count).assertEqual(1);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ENTRIES_PART02_TEST_MINDMAP_3000
         * @tc.name int32ArrayEntriesPart02TestMindmapTest030
         * @tc.desc Verify length=4 for-of iterates 4 times
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEntriesPart02TestMindmapTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let a: Int32Array = Int32Array.of(1, 2, 3, 4);
          let count: int = 0;
          for (const pair of a.entries()) {
            count = count + 1;
          }
          expect(count).assertEqual(4);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ENTRIES_PART02_TEST_MINDMAP_3100
         * @tc.name int32ArrayEntriesPart02TestMindmapTest031
         * @tc.desc Verify next after exhaustion returns done=true
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEntriesPart02TestMindmapTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let iter = Int32Array.of(1, 2).entries();
          iter.next();
          iter.next();
          expect(iter.next().done).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ENTRIES_PART02_TEST_MINDMAP_3200
         * @tc.name int32ArrayEntriesPart02TestMindmapTest032
         * @tc.desc Verify multiple next after exhaustion idempotent done=true
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEntriesPart02TestMindmapTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let iter = Int32Array.of(1).entries();
          iter.next();
          iter.next();
          let r = iter.next();
          expect(r.done).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ENTRIES_PART02_TEST_MINDMAP_3300
         * @tc.name int32ArrayEntriesPart02TestMindmapTest033
         * @tc.desc Verify exhausted next().value is undefined
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEntriesPart02TestMindmapTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let iter = Int32Array.of(1).entries();
          iter.next();
          let r = iter.next();
          expect(r.value).assertEqual(undefined);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ENTRIES_PART02_TEST_MINDMAP_3400
         * @tc.name int32ArrayEntriesPart02TestMindmapTest034
         * @tc.desc Verify independent iterators separate cursors
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEntriesPart02TestMindmapTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let a: Int32Array = Int32Array.of(5, 6);
          let it1 = a.entries();
          it1.next();
          it1.next();
          it1.next();
          let it2 = a.entries();
          expect(it2.next().done).assertFalse();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ENTRIES_PART02_TEST_MINDMAP_3500
         * @tc.name int32ArrayEntriesPart02TestMindmapTest035
         * @tc.desc Verify two independent iterators advance separately
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEntriesPart02TestMindmapTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let a: Int32Array = Int32Array.of(10, 20, 30);
          let itA = a.entries();
          let itB = a.entries();
          itA.next();
          expect(itB.next().value![0]).assertEqual(0);
          expect(itA.next().value![0]).assertEqual(1);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ENTRIES_PART02_TEST_MINDMAP_3600
         * @tc.name int32ArrayEntriesPart02TestMindmapTest036
         * @tc.desc Verify entries() call does not change length
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEntriesPart02TestMindmapTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let a: Int32Array = Int32Array.of(1, 2, 3);
          a.entries();
          expect(a.length).assertEqual(3);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ENTRIES_PART02_TEST_MINDMAP_3700
         * @tc.name int32ArrayEntriesPart02TestMindmapTest037
         * @tc.desc Verify entries() call does not change elements
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEntriesPart02TestMindmapTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let a: Int32Array = Int32Array.of(1, 2, 3);
          a.entries();
          expect(a.$_get(0)).assertEqual(1);
          expect(a.$_get(1)).assertEqual(2);
          expect(a.$_get(2)).assertEqual(3);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ENTRIES_PART02_TEST_MINDMAP_3800
         * @tc.name int32ArrayEntriesPart02TestMindmapTest038
         * @tc.desc Verify for-of traversal leaves length unchanged
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEntriesPart02TestMindmapTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let a: Int32Array = Int32Array.of(10, 20);
          for (const pair of a.entries()) {
          }
          expect(a.length).assertEqual(2);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ENTRIES_PART02_TEST_MINDMAP_3900
         * @tc.name int32ArrayEntriesPart02TestMindmapTest039
         * @tc.desc Verify for-of traversal elements unchanged
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEntriesPart02TestMindmapTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let a: Int32Array = Int32Array.of(10, 20);
          for (const pair of a.entries()) {
          }
          expect(a.$_get(0)).assertEqual(10);
          expect(a.$_get(1)).assertEqual(20);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ENTRIES_PART02_TEST_MINDMAP_4000
         * @tc.name int32ArrayEntriesPart02TestMindmapTest040
         * @tc.desc Verify break early terminate array unchanged
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEntriesPart02TestMindmapTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let a: Int32Array = Int32Array.of(7, 8, 9);
          let iter8 = a.entries(); let result8 = iter8.next();
          while (!result8.done) {
          break;
          }
          expect(a.$_get(0)).assertEqual(7);
          expect(a.length).assertEqual(3);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ENTRIES_PART02_TEST_MINDMAP_4100
         * @tc.name int32ArrayEntriesPart02TestMindmapTest041
         * @tc.desc Verify reading pair value during iteration not modify source
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEntriesPart02TestMindmapTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let a: Int32Array = Int32Array.of(11, 22);
          let iter9 = a.entries(); let result9 = iter9.next();
          while (!result9.done) {
          result9 = iter9.next(); }
          expect(a.$_get(0)).assertEqual(11);
          expect(a.$_get(1)).assertEqual(22);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ENTRIES_PART02_TEST_MINDMAP_4200
         * @tc.name int32ArrayEntriesPart02TestMindmapTest042
         * @tc.desc Verify entries() does not change byteLength
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEntriesPart02TestMindmapTest042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let a: Int32Array = Int32Array.of(1, 2);
          let before: int = a.byteLength;
          a.entries();
          expect(a.byteLength).assertEqual(before);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ENTRIES_PART02_TEST_MINDMAP_4300
         * @tc.name int32ArrayEntriesPart02TestMindmapTest043
         * @tc.desc Verify entries() does not change byteOffset
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEntriesPart02TestMindmapTest043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let buf = new ArrayBuffer(16);
          let a: Int32Array = new Int32Array(buf, 4, 2);
          let before: int = a.byteOffset;
          a.entries();
          expect(a.byteOffset).assertEqual(before);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ENTRIES_PART02_TEST_MINDMAP_4400
         * @tc.name int32ArrayEntriesPart02TestMindmapTest044
         * @tc.desc Verify partial for-of break length unchanged
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEntriesPart02TestMindmapTest044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let a: Int32Array = Int32Array.of(1, 2, 3, 4, 5);
          let seen: int = 0;
          for (const pair of a.entries()) {
            seen = seen + 1;
            if (seen === 1) {
              break;
            }
          }
          expect(a.length).assertEqual(5);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ENTRIES_PART02_TEST_MINDMAP_4500
         * @tc.name int32ArrayEntriesPart02TestMindmapTest045
         * @tc.desc Verify entries() does not change buffer reference
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEntriesPart02TestMindmapTest045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let buf = new ArrayBuffer(12);
          let a: Int32Array = new Int32Array(buf);
          let before = a.buffer;
          a.entries();
          expect(a.buffer).assertEqual(before);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ENTRIES_PART02_TEST_MINDMAP_4600
         * @tc.name int32ArrayEntriesPart02TestMindmapTest046
         * @tc.desc Verify entries() over ArrayBuffer view pair values from buffer
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEntriesPart02TestMindmapTest046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let buf = new ArrayBuffer(8);
          let a: Int32Array = new Int32Array(buf);
          a.$_set(0, 123);
          a.$_set(1, 456);
          let iter = a.entries();
          expect(iter.next().value![1] as number).assertEqual(123);
          expect(iter.next().value![1] as number).assertEqual(456);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ENTRIES_PART02_TEST_MINDMAP_4700
         * @tc.name int32ArrayEntriesPart02TestMindmapTest047
         * @tc.desc Verify byteOffset=4 view entries first pair is view first element
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEntriesPart02TestMindmapTest047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let buf = new ArrayBuffer(16);
          let full = new Int32Array(buf);
          full.$_set(0, 11);
          full.$_set(1, 22);
          full.$_set(2, 33);
          full.$_set(3, 44);
          let a: Int32Array = new Int32Array(buf, 4, 2);
          let iter = a.entries();
          expect(iter.next().value![1] as number).assertEqual(22);
          expect(iter.next().value![1] as number).assertEqual(33);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ENTRIES_PART02_TEST_MINDMAP_4800
         * @tc.name int32ArrayEntriesPart02TestMindmapTest048
         * @tc.desc Verify two views same buffer entries() return own elements
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEntriesPart02TestMindmapTest048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let buf = new ArrayBuffer(16);
          let a1: Int32Array = new Int32Array(buf, 0, 2);
          let a2: Int32Array = new Int32Array(buf, 8, 2);
          a1.$_set(0, 1);
          a1.$_set(1, 2);
          a2.$_set(0, 100);
          a2.$_set(1, 200);
          let a: Int32Array = new Int32Array(buf);
          a.$_set(0, 1);
          a.$_set(1, 2);
          a.$_set(2, 3);
          let other: Int32Array = new Int32Array(buf);
          let iter = a.entries();
          iter.next();
          other.$_set(1, 99);
          let r2 = iter.next();
          expect(r2.value![1] as number).assertEqual(99);
        });
        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ENTRIES_PART02_TEST_MINDMAP_5200
         * @tc.name int32ArrayEntriesPart02TestMindmapTest052
         * @tc.desc Verify mid-iteration source $_set modification reflected (live view)
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEntriesPart02TestMindmapTest052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let a: Int32Array = Int32Array.of(1, 2, 3);
          let iter = a.entries();
          let r1 = iter.next();
          expect(r1.value![1] as number).assertEqual(1);
          a.$_set(1, 88);
          let r2 = iter.next();
          expect(r2.value![1] as number).assertEqual(88);
        });
        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ENTRIES_PART02_TEST_MINDMAP_5300
         * @tc.name int32ArrayEntriesPart02TestMindmapTest053
         * @tc.desc Verify length=0 byteOffset=4 view entries first next done=true
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEntriesPart02TestMindmapTest053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let buf = new ArrayBuffer(16);
          let a: Int32Array = new Int32Array(buf, 4, 0);
          expect(a.entries().next().done).assertTrue();
        });
        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ENTRIES_PART02_TEST_MINDMAP_5400
         * @tc.name int32ArrayEntriesPart02TestMindmapTest054
         * @tc.desc Verify subarray entries returns subview range elements
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEntriesPart02TestMindmapTest054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let a: Int32Array = Int32Array.of(10, 20, 30, 40, 50);
          let sub = a.subarray(1, 4);
          let iter = sub.entries();
          expect(iter.next().value![1] as number).assertEqual(20);
          expect(iter.next().value![1] as number).assertEqual(30);
          expect(iter.next().value![1] as number).assertEqual(40);
          expect(iter.next().done).assertTrue();
        });
        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ENTRIES_PART02_TEST_MINDMAP_5500
         * @tc.name int32ArrayEntriesPart02TestMindmapTest055
         * @tc.desc Verify subarray entries index starts from 0 relative
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEntriesPart02TestMindmapTest055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let a: Int32Array = Int32Array.of(10, 20, 30);
          let sub = a.subarray(1, 3);
          let iter = sub.entries();
          expect(iter.next().value![0]).assertEqual(0);
          expect(iter.next().value![0]).assertEqual(1);
        });
        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ENTRIES_PART02_TEST_MINDMAP_5600
         * @tc.name int32ArrayEntriesPart02TestMindmapTest056
         * @tc.desc Verify subarray shared buffer write visible to source entries
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEntriesPart02TestMindmapTest056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let a: Int32Array = Int32Array.of(1, 2, 3);
          let sub = a.subarray(1, 2);
          sub.$_set(0, 999);
          let iter = a.entries();
          iter.next();
          expect(iter.next().value![1] as number).assertEqual(999);
        });
        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ENTRIES_PART02_TEST_MINDMAP_5700
         * @tc.name int32ArrayEntriesPart02TestMindmapTest057
         * @tc.desc Verify subarray(0,0) empty view entries first next done=true
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEntriesPart02TestMindmapTest057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let a: Int32Array = Int32Array.of(1, 2, 3);
          let sub = a.subarray(0, 0);
          expect(sub.entries().next().done).assertTrue();
        });
        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ENTRIES_PART02_TEST_MINDMAP_5800
         * @tc.name int32ArrayEntriesPart02TestMindmapTest058
         * @tc.desc Verify for-of break at first consumes 1 pair
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEntriesPart02TestMindmapTest058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let a: Int32Array = Int32Array.of(1, 2, 3);
          let seen: int = 0;
          let iter11 = a.entries(); let result11 = iter11.next();
          while (!result11.done) {
          seen = seen + 1;
          break;
          result11 = iter11.next(); }
          expect(seen).assertEqual(1);
        });
        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ENTRIES_PART02_TEST_MINDMAP_5900
         * @tc.name int32ArrayEntriesPart02TestMindmapTest059
         * @tc.desc Verify for-of break at index=1 consumes 2 pairs
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEntriesPart02TestMindmapTest059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let a: Int32Array = Int32Array.of(10, 20, 30, 40);
          let seen: int = 0;
          let iter12 = a.entries(); let result12 = iter12.next();
          while (!result12.done) { let pair = result12.value!;
          seen = seen + 1;
          if (pair[0] === 1) {
          break;
          }
          result12 = iter12.next(); }
          expect(seen).assertEqual(2);
        });
        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ENTRIES_PART02_TEST_MINDMAP_6000
         * @tc.name int32ArrayEntriesPart02TestMindmapTest060
         * @tc.desc Verify for-of first element break captured pair values
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEntriesPart02TestMindmapTest060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let a: Int32Array = Int32Array.of(5, 6, 7, 8);
          let capturedIdx: int = -1;
          let capturedVal: int = -1;
          let iter13 = a.entries(); let result13 = iter13.next();
          while (!result13.done) { let pair = result13.value!;
          capturedIdx = pair[0];
          capturedVal = pair[1].toInt();
          break;
          result13 = iter13.next(); }
          expect(capturedIdx).assertEqual(0);
          expect(capturedVal).assertEqual(5);
        });
        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ENTRIES_PART02_TEST_MINDMAP_6100
         * @tc.name int32ArrayEntriesPart02TestMindmapTest061
         * @tc.desc Verify for-of sum all elements completeness
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEntriesPart02TestMindmapTest061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let a: Int32Array = Int32Array.of(1, 2, 3);
          let sum: int = 0;
          let iter14 = a.entries(); let result14 = iter14.next();
          while (!result14.done) { let pair = result14.value!;
          sum = sum + (pair[1].toInt());
          result14 = iter14.next(); }
          expect(sum).assertEqual(6);
        });
        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ENTRIES_PART02_TEST_MINDMAP_6200
         * @tc.name int32ArrayEntriesPart02TestMindmapTest062
         * @tc.desc Verify throw in for-of caught array length unchanged
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEntriesPart02TestMindmapTest062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let a: Int32Array = Int32Array.of(1, 2, 3);
          let reached: int = 0;
          let caughtMsg: string = '';
          try {
            let iter15 = a.entries(); let result15 = iter15.next();
            while (!result15.done) {
            reached = reached + 1;
            throw new Error('stop');
            result15 = iter15.next(); }
            expect().assertFail();
          } catch (e) {
            caughtMsg = (e as Error).message;
            expect(e.name).assertEqual('Error');
          }
          expect(caughtMsg).assertEqual('stop');
          expect(reached).assertEqual(1);
          expect(a.length).assertEqual(3);
        });
        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ENTRIES_PART02_TEST_MINDMAP_6300
         * @tc.name int32ArrayEntriesPart02TestMindmapTest063
         * @tc.desc Verify break then re-for-of continues from remaining
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEntriesPart02TestMindmapTest063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let a: Int32Array = Int32Array.of(10, 20, 30, 40);
          let iter = a.entries();
          let count1: int = 0;
          let r = iter.next();
          while (!r.done) {
          count1 = count1 + 1;
          if (count1 === 2) {
          break;
          }
          r = iter.next();
          }
          let count2: int = 0;
          r = iter.next();
          while (!r.done) {
          count2 = count2 + 1;
          r = iter.next();
          }
          expect(count1).assertEqual(2);
          expect(count2).assertEqual(2);
        });
        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ENTRIES_PART02_TEST_MINDMAP_6400
         * @tc.name int32ArrayEntriesPart02TestMindmapTest064
         * @tc.desc Verify entries() iterator directly for-of self-return
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEntriesPart02TestMindmapTest064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let iter = Int32Array.of(1, 2, 3).entries();
          let count: int = 0;
          let r = iter.next();
          while (!r.done) {
          count = count + 1;
          r = iter.next();
          }
          expect(count).assertEqual(3);
        });
        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ENTRIES_PART02_TEST_MINDMAP_6500
         * @tc.name int32ArrayEntriesPart02TestMindmapTest065
         * @tc.desc Verify exhausted iterator for-of iterates 0 times
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEntriesPart02TestMindmapTest065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let iter = Int32Array.of(1, 2).entries();
          let r = iter.next();
          while (!r.done) {
          r = iter.next();
          }
          let count: int = 0;
          r = iter.next();
          while (!r.done) {
          count = count + 1;
          r = iter.next();
          }
          expect(count).assertEqual(0);
        });
        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ENTRIES_PART02_TEST_MINDMAP_6600
         * @tc.name int32ArrayEntriesPart02TestMindmapTest066
         * @tc.desc Verify chained of().entries().next() single expression
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEntriesPart02TestMindmapTest066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let r = Int32Array.of(42).entries().next();
          expect(r.done).assertFalse();
          expect(r.value![1]).assertEqual(42);
        });
        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ENTRIES_PART02_TEST_MINDMAP_6700
         * @tc.name int32ArrayEntriesPart02TestMindmapTest067
         * @tc.desc Verify chained new Int32Array(0).entries().next() done=true
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEntriesPart02TestMindmapTest067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let r = new Int32Array(0).entries().next();
          expect(r.done).assertTrue();
        });
        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ENTRIES_PART02_TEST_MINDMAP_6800
         * @tc.name int32ArrayEntriesPart02TestMindmapTest068
         * @tc.desc Verify manual next then for-of share same cursor
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEntriesPart02TestMindmapTest068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let a: Int32Array = Int32Array.of(10, 20, 30);
          let iter = a.entries();
          iter.next();
          let count: int = 0;
          let firstIdxInFor: int = -1;
          let r = iter.next();
          while (!r.done) {
          if (count === 0) {
          firstIdxInFor = r.value![0];
          }
          count = count + 1;
          r = iter.next();
          }
          expect(firstIdxInFor).assertEqual(1);
          expect(count).assertEqual(2);
        });
        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ENTRIES_PART02_TEST_MINDMAP_6900
         * @tc.name int32ArrayEntriesPart02TestMindmapTest069
         * @tc.desc Verify entries value cast to number equals source element 5
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEntriesPart02TestMindmapTest069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let r = Int32Array.of(5).entries().next();
          let v: number = r.value![1];
          expect(v).assertEqual(5);
        });
        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ENTRIES_PART02_TEST_MINDMAP_7000
         * @tc.name int32ArrayEntriesPart02TestMindmapTest070
         * @tc.desc Verify negative element -100 Number wrapper value
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEntriesPart02TestMindmapTest070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let r = Int32Array.of(-100).entries().next();
          expect(r.value![1]).assertEqual(-100);
        });
        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ENTRIES_PART02_TEST_MINDMAP_7100
         * @tc.name int32ArrayEntriesPart02TestMindmapTest071
         * @tc.desc Verify element 1 Number wrapper unbox equals 1
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEntriesPart02TestMindmapTest071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let r = Int32Array.of(1).entries().next();
          let eq: boolean = r.value![1] === 1;
          expect(eq).assertTrue();
        });
        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ENTRIES_PART02_TEST_MINDMAP_7200
         * @tc.name int32ArrayEntriesPart02TestMindmapTest072
         * @tc.desc Verify entries() iteration yields correct count for 3-element Int32Array
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEntriesPart02TestMindmapTest072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let a: Int32Array = Int32Array.of(10, 20, 30);
          let count: int = 0;
          let iter16 = a.entries(); let result16 = iter16.next();
          while (!result16.done) { count = count + 1; result16 = iter16.next(); }
          expect(count).assertEqual(3);
        });
        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ENTRIES_PART02_TEST_MINDMAP_7300
         * @tc.name int32ArrayEntriesPart02TestMindmapTest073
         * @tc.desc Verify entries() iteration accumulates correct sum of all values
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEntriesPart02TestMindmapTest073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let a: Int32Array = Int32Array.of(10, 20, 30);
          let count2: number = 0;
          let iter17 = a.entries(); let result17 = iter17.next();
          while (!result17.done) { let pair = result17.value!;
          count2 = count2 + (pair[1] as number);
          result17 = iter17.next(); }
          expect(count2).assertEqual(60);
        });
        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ENTRIES_PART02_TEST_MINDMAP_7400
         * @tc.name int32ArrayEntriesPart02TestMindmapTest074
         * @tc.desc Verify iteration all indices non-negative integers
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEntriesPart02TestMindmapTest074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let a: Int32Array = Int32Array.of(0, 0, 0, 0);
          let iter18 = a.entries(); let result18 = iter18.next();
          let expectedIdx: int = 0;
          while (!result18.done) { let pair = result18.value!;
          expect(pair[0]).assertEqual(expectedIdx);
          expectedIdx = expectedIdx + 1;
          result18 = iter18.next(); }
          expect(expectedIdx).assertEqual(4);
        });
        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ENTRIES_PART02_TEST_MINDMAP_7500
         * @tc.name int32ArrayEntriesPart02TestMindmapTest075
         * @tc.desc Verify new Int32Array(2) all zeros entries values
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEntriesPart02TestMindmapTest075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let a: Int32Array = new Int32Array(2);
          let iter = a.entries();
          expect(iter.next().value![1] as number).assertEqual(0);
          expect(iter.next().value![1] as number).assertEqual(0);
          expect(iter.next().done).assertTrue();
        });
        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ENTRIES_PART02_TEST_MINDMAP_7600
         * @tc.name int32ArrayEntriesPart02TestMindmapTest076
         * @tc.desc Verify from(int[]) entries order matches source
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEntriesPart02TestMindmapTest076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let src: int[] = [3, 6, 9];
          let a: Int32Array = Int32Array.from(src);
          let iter = a.entries();
          expect(iter.next().value![1] as number).assertEqual(3);
          expect(iter.next().value![1] as number).assertEqual(6);
          expect(iter.next().value![1] as number).assertEqual(9);
        });
        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ENTRIES_PART02_TEST_MINDMAP_7700
         * @tc.name int32ArrayEntriesPart02TestMindmapTest077
         * @tc.desc Verify of() variadic entries order matches argument order
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEntriesPart02TestMindmapTest077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let a: Int32Array = Int32Array.of(111, 222, 333, 444);
          let idx: int = 0;
          let expected: int[] = [111, 222, 333, 444];
          let iter19 = a.entries(); let result19 = iter19.next();
          while (!result19.done) { let pair = result19.value!;
          expect(pair[1] as number).assertEqual(expected[idx]);
          idx = idx + 1;
          result19 = iter19.next(); }
        });
        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_ENTRIES_PART02_TEST_MINDMAP_7800
         * @tc.name int32ArrayEntriesPart02TestMindmapTest078
         * @tc.desc Verify from empty array entries first next done=true
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEntriesPart02TestMindmapTest078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let empty: int[] = [];
          let a: Int32Array = Int32Array.from(empty);
          expect(a.entries().next().done).assertTrue();
        });
  });
}