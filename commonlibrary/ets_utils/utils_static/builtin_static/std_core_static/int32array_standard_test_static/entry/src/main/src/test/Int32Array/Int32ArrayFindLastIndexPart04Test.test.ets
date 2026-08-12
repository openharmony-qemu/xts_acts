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
export default function int32ArrayFindLastIndexPart04TestMindmapTestTest(): void {
  describe('Int32ArrayFindLastIndexPart04TestMindmapTestTest', (): void => {
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
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART04_TEST_MINDMAP_0100
         * @tc.name int32ArrayFindLastIndexPart04TestMindmapTest001
         * @tc.desc Verify length index=length-1
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart04TestMindmapTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr = new Int32Array([10, 20, 30, 40, 50]);
          let idx: int = arr.findLastIndex((v: number, i: int, a: Int32Array): boolean => { return v > 45; });
          expect(arr.length).assertEqual(5);
          expect(idx).assertEqual(4);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART04_TEST_MINDMAP_0200
         * @tc.name int32ArrayFindLastIndexPart04TestMindmapTest002
         * @tc.desc Verify buffer
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart04TestMindmapTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr = new Int32Array([1, 2, 3, 4]);
          let bufBefore = arr.buffer;
          let idx: int = arr.findLastIndex((v: number, i: int, a: Int32Array): boolean => { return v === 3; });
          expect(arr.buffer).assertEqual(bufBefore);
          expect(idx).assertEqual(2);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART04_TEST_MINDMAP_0300
         * @tc.name int32ArrayFindLastIndexPart04TestMindmapTest003
         * @tc.desc Verify byteOffset findLastIndex byteOffset
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart04TestMindmapTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let buf = new ArrayBuffer(20);
          let view = new Int32Array(buf, 8, 3);
          view.$_set(0, 11);
          view.$_set(1, 22);
          view.$_set(2, 33);
          let idx: int = view.findLastIndex((v: number, i: int, a: Int32Array): boolean => { return v > 20; });
          expect(view.byteOffset).assertEqual(8);
          expect(idx).assertEqual(2);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART04_TEST_MINDMAP_0400
         * @tc.name int32ArrayFindLastIndexPart04TestMindmapTest004
         * @tc.desc Verify byteLength
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart04TestMindmapTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr = new Int32Array([11, 22, 33, 44]);
          let idx: int = arr.findLastIndex((v: number, i: int, a: Int32Array): boolean => { return v < 30; });
          expect(arr.byteLength).assertEqual(16);
          expect(idx).assertEqual(1);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART04_TEST_MINDMAP_0500
         * @tc.name int32ArrayFindLastIndexPart04TestMindmapTest005
         * @tc.desc Verify findLastIndex
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart04TestMindmapTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr = new Int32Array([10, 20, 30, 40, 50]);
          let idx: int = arr.findLastIndex((v: number, i: int, a: Int32Array): boolean => { return v === 30; });
          expect(arr.$_get(3)).assertEqual(40);
          expect(arr.$_get(4)).assertEqual(50);
          expect(idx).assertEqual(2);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART04_TEST_MINDMAP_0600
         * @tc.name int32ArrayFindLastIndexPart04TestMindmapTest006
         * @tc.desc Verify findLastIndex
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart04TestMindmapTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr = new Int32Array([10, 20, 30, 40, 50]);
          arr.findLastIndex((v: number, i: int, a: Int32Array): boolean => { return v === 30; });
          expect(arr.$_get(0)).assertEqual(10);
          expect(arr.$_get(1)).assertEqual(20);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART04_TEST_MINDMAP_0700
         * @tc.name int32ArrayFindLastIndexPart04TestMindmapTest007
         * @tc.desc Verify -1
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart04TestMindmapTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr = new Int32Array([1, 2, 3, 4, 5]);
          let idx: int = arr.findLastIndex((v: number, i: int, a: Int32Array): boolean => { return v > 999; });
          expect(arr.$_get(0)).assertEqual(1);
          expect(arr.$_get(4)).assertEqual(5);
          expect(idx).assertEqual(-1);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART04_TEST_MINDMAP_0800
         * @tc.name int32ArrayFindLastIndexPart04TestMindmapTest008
         * @tc.desc Verify predicate findLastIndex index
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart04TestMindmapTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr = new Int32Array([5, 3, 8, 1, 9, 4]);
          let i1: int = arr.findLastIndex((v: number, i: int, a: Int32Array): boolean => { return v > 6; });
          let i2: int = arr.findLastIndex((v: number, i: int, a: Int32Array): boolean => { return v > 6; });
          expect(i1).assertEqual(i2);
          expect(i1).assertEqual(4);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART04_TEST_MINDMAP_0900
         * @tc.name int32ArrayFindLastIndexPart04TestMindmapTest009
         * @tc.desc Verify findLastIndex $_get
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart04TestMindmapTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr = new Int32Array([7, 14, 21, 28]);
          arr.findLastIndex((v: number, i: int, a: Int32Array): boolean => { return v === 14; });
          expect(arr.$_get(0)).assertEqual(7);
          expect(arr.$_get(1)).assertEqual(14);
          expect(arr.$_get(2)).assertEqual(21);
          expect(arr.$_get(3)).assertEqual(28);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART04_TEST_MINDMAP_1000
         * @tc.name int32ArrayFindLastIndexPart04TestMindmapTest010
         * @tc.desc Verify findLastIndex length 0 -1
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart04TestMindmapTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr = new Int32Array();
          let calls: int = 0;
          let idx: int = arr.findLastIndex((v: number, i: int, a: Int32Array): boolean => { calls++; return true; });
          expect(arr.length).assertEqual(0);
          expect(calls).assertEqual(0);
          expect(idx).assertEqual(-1);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART04_TEST_MINDMAP_1100
         * @tc.name int32ArrayFindLastIndexPart04TestMindmapTest011
         * @tc.desc Verify subarray findLastIndex length
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart04TestMindmapTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let parent = new Int32Array([10, 20, 30, 40]);
          let child = parent.subarray(1, 4);
          let idx: int = child.findLastIndex((v: number, i: int, a: Int32Array): boolean => { return v > 25; });
          expect(parent.length).assertEqual(4);
          expect(child.length).assertEqual(3);
          expect(idx).assertEqual(2);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART04_TEST_MINDMAP_1200
         * @tc.name int32ArrayFindLastIndexPart04TestMindmapTest012
         * @tc.desc Verify findLastIndex number int -1
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart04TestMindmapTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr = new Int32Array([1, 2, 3]);
          let idx: int = arr.findLastIndex((v: number, i: int, a: Int32Array): boolean => { return v > 99; });
          expect(idx).assertEqual(-1);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART04_TEST_MINDMAP_1300
         * @tc.name int32ArrayFindLastIndexPart04TestMindmapTest013
         * @tc.desc Verify 1 index=length-1
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart04TestMindmapTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr = new Int32Array([10, 20, 30]);
          let calls: int = 0;
          let idx: int = arr.findLastIndex((v: number, i: int, a: Int32Array): boolean => { calls++; return v === 30; });
          expect(calls).assertEqual(1);
          expect(idx).assertEqual(2);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART04_TEST_MINDMAP_1400
         * @tc.name int32ArrayFindLastIndexPart04TestMindmapTest014
         * @tc.desc Verify length-index
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart04TestMindmapTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr = new Int32Array([1, 2, 3, 4, 5]);
          let calls: int = 0;
          let idx: int = arr.findLastIndex((v: number, i: int, a: Int32Array): boolean => { calls++; return v === 3; });
          expect(calls).assertEqual(3);
          expect(idx).assertEqual(2);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART04_TEST_MINDMAP_1500
         * @tc.name int32ArrayFindLastIndexPart04TestMindmapTest015
         * @tc.desc Verify index=0 length
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart04TestMindmapTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr = new Int32Array([1, 2, 3, 4, 5]);
          let calls: int = 0;
          let idx: int = arr.findLastIndex((v: number, i: int, a: Int32Array): boolean => { calls++; return v === 1; });
          expect(calls).assertEqual(5);
          expect(idx).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART04_TEST_MINDMAP_1600
         * @tc.name int32ArrayFindLastIndexPart04TestMindmapTest016
         * @tc.desc Verify length -1
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart04TestMindmapTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr = new Int32Array([1, 2, 3, 4]);
          let calls: int = 0;
          let idx: int = arr.findLastIndex((v: number, i: int, a: Int32Array): boolean => { calls++; return false; });
          expect(calls).assertEqual(4);
          expect(idx).assertEqual(-1);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART04_TEST_MINDMAP_1700
         * @tc.name int32ArrayFindLastIndexPart04TestMindmapTest017
         * @tc.desc Verify length-1,length-2,..., index
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart04TestMindmapTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr = new Int32Array([10, 20, 30, 40]);
          let indices: number[] = [];
          let idx: int = arr.findLastIndex((v: number, i: int, a: Int32Array): boolean => { indices.push(i); return v === 20; });
          expect(indices.length).assertEqual(3);
          expect(indices[0]).assertEqual(3);
          expect(indices[1]).assertEqual(2);
          expect(indices[2]).assertEqual(1);
          expect(idx).assertEqual(1);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART04_TEST_MINDMAP_1800
         * @tc.name int32ArrayFindLastIndexPart04TestMindmapTest018
         * @tc.desc Verify value
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart04TestMindmapTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr = new Int32Array([7, 14, 21, 28]);
          let values: number[] = [];
          let idx: int = arr.findLastIndex((v: number, i: int, a: Int32Array): boolean => { values.push(v); return v === 14; });
          expect(values[0]).assertEqual(28);
          expect(values[1]).assertEqual(21);
          expect(values[2]).assertEqual(14);
          expect(idx).assertEqual(1);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART04_TEST_MINDMAP_1900
         * @tc.name int32ArrayFindLastIndexPart04TestMindmapTest019
         * @tc.desc Verify 1 index=0
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart04TestMindmapTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr = new Int32Array([42]);
          let calls: int = 0;
          let idx: int = arr.findLastIndex((v: number, i: int, a: Int32Array): boolean => { calls++; return v === 42; });
          expect(calls).assertEqual(1);
          expect(idx).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART04_TEST_MINDMAP_2000
         * @tc.name int32ArrayFindLastIndexPart04TestMindmapTest020
         * @tc.desc Verify findLastIndex 0
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart04TestMindmapTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr = new Int32Array();
          let calls: int = 0;
          let idx: int = arr.findLastIndex((v: number, i: int, a: Int32Array): boolean => { calls++; return true; });
          expect(calls).assertEqual(0);
          expect(idx).assertEqual(-1);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART04_TEST_MINDMAP_2100
         * @tc.name int32ArrayFindLastIndexPart04TestMindmapTest021
         * @tc.desc Verify value sum- sum
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart04TestMindmapTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr = new Int32Array([10, 20, 30, 40]);
          let sum: number = 0;
          let idx: int = arr.findLastIndex((v: number, i: int, a: Int32Array): boolean => { sum = sum + v; return v === 40; });
          expect(sum).assertEqual(40);
          expect(idx).assertEqual(3);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART04_TEST_MINDMAP_2200
         * @tc.name int32ArrayFindLastIndexPart04TestMindmapTest022
         * @tc.desc Verify value sum- sum
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart04TestMindmapTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr = new Int32Array([10, 20, 30, 40]);
          let sum: number = 0;
          let idx: int = arr.findLastIndex((v: number, i: int, a: Int32Array): boolean => { sum = sum + v; return v === 20; });
          expect(sum).assertEqual(90);
          expect(idx).assertEqual(1);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART04_TEST_MINDMAP_2300
         * @tc.name int32ArrayFindLastIndexPart04TestMindmapTest023
         * @tc.desc Verify -
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart04TestMindmapTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr = new Int32Array([1, 2, 3, 4, 5]);
          let seen: int = -1;
          let idx: int = arr.findLastIndex((v: number, i: int, a: Int32Array): boolean => {
          let prev: int = seen;
          seen = i;
          return prev === 3 && v === 2;
        });
          expect(idx).assertEqual(-1);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART04_TEST_MINDMAP_2400
         * @tc.name int32ArrayFindLastIndexPart04TestMindmapTest024
         * @tc.desc Verify index- findLastIndex
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart04TestMindmapTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr = new Int32Array([8, 16, 24, 32]);
          let hitIndex: int = -1;
          let idx: int = arr.findLastIndex((v: number, i: int, a: Int32Array): boolean => {
          if (v === 16) {
          hitIndex = i;
          return true;
          }
          return false;
        });
          expect(hitIndex).assertEqual(1);
          expect(idx).assertEqual(hitIndex);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART04_TEST_MINDMAP_2500
         * @tc.name int32ArrayFindLastIndexPart04TestMindmapTest025
         * @tc.desc Verify 100 findLastIndex index=50- length-50
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart04TestMindmapTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr = new Int32Array(100);
          for (let k: int = 0; k < 100; k++) {
          arr.$_set(k, k);
          }
          let calls: int = 0;
          let idx: int = arr.findLastIndex((v: number, i: int, a: Int32Array): boolean => { calls++; return v === 50; });
          expect(calls).assertEqual(50);
          expect(idx).assertEqual(50);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART04_TEST_MINDMAP_2600
         * @tc.name int32ArrayFindLastIndexPart04TestMindmapTest026
         * @tc.desc Verify array findLastIndex
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart04TestMindmapTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr = new Int32Array([1, 2, 3]);
          let sameRef: boolean = false;
          arr.findLastIndex((v: number, i: int, a: Int32Array): boolean => {
          sameRef = (a === arr);
          return true;
        });
          expect(sameRef).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART04_TEST_MINDMAP_2700
         * @tc.name int32ArrayFindLastIndexPart04TestMindmapTest027
         * @tc.desc Verify array.length arr.length
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart04TestMindmapTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr = new Int32Array([10, 20, 30, 40, 50]);
          let capturedLen: int = -1;
          let idx: int = arr.findLastIndex((v: number, i: int, a: Int32Array): boolean => {
          capturedLen = a.length;
          return v === 30;
        });
          expect(capturedLen).assertEqual(5);
          expect(idx).assertEqual(2);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART04_TEST_MINDMAP_2800
         * @tc.name int32ArrayFindLastIndexPart04TestMindmapTest028
         * @tc.desc Verify index=0 i 0
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart04TestMindmapTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr = new Int32Array([77, 88, 99]);
          let lastSeenIndex: int = -1;
          let idx: int = arr.findLastIndex((v: number, i: int, a: Int32Array): boolean => {
          lastSeenIndex = i;
          return false;
        });
          expect(lastSeenIndex).assertEqual(0);
          expect(idx).assertEqual(-1);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART04_TEST_MINDMAP_2900
         * @tc.name int32ArrayFindLastIndexPart04TestMindmapTest029
         * @tc.desc Verify index subarray i 0
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart04TestMindmapTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let parent = new Int32Array([100, 200, 300, 400, 500]);
          let child = parent.subarray(2, 5);
          let seenIdx: int = -1;
          let idx: int = child.findLastIndex((v: number, i: int, a: Int32Array): boolean => {
          seenIdx = i;
          return v === 400;
        });
          expect(seenIdx).assertEqual(1);
          expect(idx).assertEqual(1);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART04_TEST_MINDMAP_3000
         * @tc.name int32ArrayFindLastIndexPart04TestMindmapTest030
         * @tc.desc Verify findLastIndex findLastIndex- index
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart04TestMindmapTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr = new Int32Array([10, 20, 30, 40, 50]);
          let outerCalls: int = 0;
          let idx: int = arr.findLastIndex((v: number, i: int, a: Int32Array): boolean => {
          outerCalls++;
          let innerIdx: int = a.findLastIndex((vv: number, ii: int, aa: Int32Array): boolean => { return vv === 20; });
          return v === 50 && innerIdx === 1;
        });
          expect(idx).assertEqual(4);
          expect(outerCalls).assertEqual(1);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART04_TEST_MINDMAP_3100
         * @tc.name int32ArrayFindLastIndexPart04TestMindmapTest031
         * @tc.desc Verify findLastIndex -
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart04TestMindmapTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr = new Int32Array([1, 2, 3]);
          let innerTotal: int = 0;
          let idx: int = arr.findLastIndex((v: number, i: int, a: Int32Array): boolean => {
          a.findLastIndex((vv: number, ii: int, aa: Int32Array): boolean => { innerTotal++; return false; });
          a.findLastIndex((vv: number, ii: int, aa: Int32Array): boolean => { innerTotal++; return false; });
          return v === 1;
        });
          expect(innerTotal).assertEqual(18);
          expect(idx).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART04_TEST_MINDMAP_3200
         * @tc.name int32ArrayFindLastIndexPart04TestMindmapTest032
         * @tc.desc Verify - findLastIndex index
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart04TestMindmapTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr = new Int32Array([5, 6, 7, 8]);
          let innerIdx: int = -1;
          let idx: int = arr.findLastIndex((v: number, i: int, a: Int32Array): boolean => {
          innerIdx = a.findLastIndex((vv: number, ii: int, aa: Int32Array): boolean => { return vv < 7; });
          return v === 8;
        });
          expect(innerIdx).assertEqual(1);
          expect(idx).assertEqual(3);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART04_TEST_MINDMAP_3300
         * @tc.name int32ArrayFindLastIndexPart04TestMindmapTest033
         * @tc.desc Verify findLastIndex -
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart04TestMindmapTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr = new Int32Array([10, 20, 30, 40]);
          let innerResults: number[] = [];
          arr.findLastIndex((v: number, i: int, a: Int32Array): boolean => {
          let r: int = a.findLastIndex((vv: number, ii: int, aa: Int32Array): boolean => { return vv === 10; });
          innerResults.push(r);
          return false;
        });
          expect(innerResults.length).assertEqual(4);
          expect(innerResults[0]).assertEqual(0);
          expect(innerResults[3]).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART04_TEST_MINDMAP_3400
         * @tc.name int32ArrayFindLastIndexPart04TestMindmapTest034
         * @tc.desc Verify findLastIndex-
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart04TestMindmapTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let parent = new Int32Array([0, 0, 10, 20, 30, 0]);
          let child = parent.subarray(2, 5);
          let idx: int = child.findLastIndex((v: number, i: int, a: Int32Array): boolean => {
          let innerIdx: int = a.findLastIndex((vv: number, ii: int, aa: Int32Array): boolean => { return vv === 10; });
          return v === 30 && innerIdx === 0;
        });
          expect(idx).assertEqual(2);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART04_TEST_MINDMAP_3500
         * @tc.name int32ArrayFindLastIndexPart04TestMindmapTest035
         * @tc.desc Verify - findLastIndex
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart04TestMindmapTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr = new Int32Array([1, 2, 3, 4, 5]);
          let innerRan: boolean = false;
          try {
            arr.findLastIndex((v: number, i: int, a: Int32Array): boolean => {
            a.findLastIndex((vv: number, ii: int, aa: Int32Array): boolean => { innerRan = true; return vv === 5; });
            throw new Error('outer boom');
          });
            expect().assertFail();
          } catch (e) {
            expect(e.name).assertEqual('Error');
          }
          expect(innerRan).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART04_TEST_MINDMAP_3600
         * @tc.name int32ArrayFindLastIndexPart04TestMindmapTest036
         * @tc.desc Verify findLastIndex findLast - index
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart04TestMindmapTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr = new Int32Array([10, 20, 30, 40, 50]);
          let idx: int = arr.findLastIndex((v: number, i: int, a: Int32Array): boolean => {
          let innerVal: number = a.findLast((vv: number, ii: int, aa: Int32Array): boolean => { return vv < 25; });
          return v === 50 && innerVal === 20;
        });
          expect(idx).assertEqual(4);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART04_TEST_MINDMAP_3700
         * @tc.name int32ArrayFindLastIndexPart04TestMindmapTest037
         * @tc.desc Verify Int32Array findLastIndex- index
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart04TestMindmapTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr1 = new Int32Array([1, 2, 3, 4]);
          let arr2 = new Int32Array([10, 20, 30]);
          let crossIdx: int = -1;
          let idx: int = arr1.findLastIndex((v: number, i: int, a: Int32Array): boolean => {
          crossIdx = arr2.findLastIndex((vv: number, ii: int, aa: Int32Array): boolean => { return vv === 20; });
          return v === 4;
        });
          expect(crossIdx).assertEqual(1);
          expect(idx).assertEqual(3);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART04_TEST_MINDMAP_3800
         * @tc.name int32ArrayFindLastIndexPart04TestMindmapTest038
         * @tc.desc Verify index - index
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart04TestMindmapTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr = new Int32Array([1, 2, 3, 4, 5]);
          let idx: int = arr.findLastIndex((v: number, i: int, a: Int32Array): boolean => {
          if (i === 2) {
          a.$_set(i + 1, 99);
          a.$_set(i + 2, 88);
          }
          return v === 2;
        });
          expect(idx).assertEqual(1);
          expect(arr.$_get(3)).assertEqual(99);
          expect(arr.$_get(4)).assertEqual(88);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART04_TEST_MINDMAP_3900
         * @tc.name int32ArrayFindLastIndexPart04TestMindmapTest039
         * @tc.desc Verify index - v index i
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart04TestMindmapTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr = new Int32Array([10, 20, 30, 40]);
          let capturedV: number = -1;
          let idx: int = arr.findLastIndex((v: number, i: int, a: Int32Array): boolean => {
          if (i === 2) {
          capturedV = v;
          a.$_set(i, 999);
          return true;
          }
          return false;
        });
          expect(capturedV).assertEqual(30);
          expect(idx).assertEqual(2);
          expect(arr.$_get(2)).assertEqual(999);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART04_TEST_MINDMAP_4000
         * @tc.name int32ArrayFindLastIndexPart04TestMindmapTest040
         * @tc.desc Verify index -
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart04TestMindmapTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr = new Int32Array([0, 0, 0, 0]);
          let idx: int = arr.findLastIndex((v: number, i: int, a: Int32Array): boolean => {
          if (i === 3) {
          a.$_set(i - 1, 77);
          return false;
          }
          return v === 77;
        });
          expect(idx).assertEqual(2);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART04_TEST_MINDMAP_4100
         * @tc.name int32ArrayFindLastIndexPart04TestMindmapTest041
         * @tc.desc Verify - / index
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart04TestMindmapTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr = new Int32Array([1, 2, 3, 4]);
          let calls: int = 0;
          let idx: int = arr.findLastIndex((v: number, i: int, a: Int32Array): boolean => {
          calls++;
          a.$_set(0, 111);
          a.$_set(2, 222);
          return true;
        });
          expect(calls).assertEqual(1);
          expect(idx).assertEqual(3);
          expect(arr.$_get(0)).assertEqual(111);
          expect(arr.$_get(2)).assertEqual(222);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART04_TEST_MINDMAP_4200
         * @tc.name int32ArrayFindLastIndexPart04TestMindmapTest042
         * @tc.desc Verify - index
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart04TestMindmapTest042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr = new Int32Array([1, 2, 3, 4, 5]);
          let calls: int = 0;
          let idx: int = arr.findLastIndex((v: number, i: int, a: Int32Array): boolean => {
          calls++;
          if (i === a.length - 1) {
          for (let j: int = 0; j < i; j++) {
          a.$_set(j, 100);
          }
          return false;
          }
          return v === 100;
        });
          expect(calls).assertEqual(2);
          expect(idx).assertEqual(3);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART04_TEST_MINDMAP_4300
         * @tc.name int32ArrayFindLastIndexPart04TestMindmapTest043
         * @tc.desc Verify index - 0 index
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart04TestMindmapTest043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr = new Int32Array([1, 2, 3, 4, 5]);
          let sawZeroIdx: int = -1;
          let idx: int = arr.findLastIndex((v: number, i: int, a: Int32Array): boolean => {
          if (i === 3) {
          for (let j: int = 0; j < i; j++) {
          a.$_set(j, 0);
          }
          }
          if (i < 3 && v === 0) {
          sawZeroIdx = i;
          return true;
          }
          return false;
        });
          expect(sawZeroIdx).assertEqual(2);
          expect(idx).assertEqual(2);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART04_TEST_MINDMAP_4400
         * @tc.name int32ArrayFindLastIndexPart04TestMindmapTest044
         * @tc.desc Verify $_set(length, val) throws RangeError during findLastIndex callback
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart04TestMindmapTest044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr = new Int32Array([1, 2, 3]);
          let threwRangeError: boolean = false;
          let idx: int = arr.findLastIndex((v: number, i: int, a: Int32Array): boolean => {
          try {
            a.$_set(a.length, 0);
            expect().assertFail();
          } catch (e) {
            threwRangeError = true;
            expect(e.name).assertEqual('RangeError');
          }
          return v === 1;
        });
          expect(idx).assertEqual(0);
          expect(threwRangeError).assertTrue();
          expect(arr.length).assertEqual(3);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART04_TEST_MINDMAP_4500
         * @tc.name int32ArrayFindLastIndexPart04TestMindmapTest045
         * @tc.desc Verify $_set(-1, val) throws RangeError during findLastIndex callback
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart04TestMindmapTest045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr = new Int32Array([1, 2, 3]);
          let threwRangeError: boolean = false;
          let idx: int = arr.findLastIndex((v: number, i: int, a: Int32Array): boolean => {
          try {
            a.$_set(-1, 0);
            expect().assertFail();
          } catch (e) {
            threwRangeError = true;
            expect(e.name).assertEqual('RangeError');
          }
          return v === 3;
        });
          expect(idx).assertEqual(2);
          expect(threwRangeError).assertTrue();
          expect(arr.$_get(0)).assertEqual(1);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART04_TEST_MINDMAP_4600
         * @tc.name int32ArrayFindLastIndexPart04TestMindmapTest046
         * @tc.desc Verify i=0 -
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart04TestMindmapTest046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr = new Int32Array([1, 2, 3, 4, 5]);
          let calls: int = 0;
          let idx: int = arr.findLastIndex((v: number, i: int, a: Int32Array): boolean => {
          calls++;
          if (i === 0) {
          for (let j: int = 1; j < a.length; j++) {
          a.$_set(j, 777);
          }
          }
          return false;
        });
          expect(calls).assertEqual(5);
          expect(idx).assertEqual(-1);
          expect(arr.$_get(4)).assertEqual(777);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART04_TEST_MINDMAP_4700
         * @tc.name int32ArrayFindLastIndexPart04TestMindmapTest047
         * @tc.desc Verify array.$_get index -
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart04TestMindmapTest047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr = new Int32Array([10, 20, 30, 40]);
          let futureVal: number = 0;
          let idx: int = arr.findLastIndex((v: number, i: int, a: Int32Array): boolean => {
          if (i === 3) {
          futureVal = a.$_get(i - 2);
          }
          return v === 10;
        });
          expect(futureVal).assertEqual(20);
          expect(idx).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART04_TEST_MINDMAP_4800
         * @tc.name int32ArrayFindLastIndexPart04TestMindmapTest048
         * @tc.desc Verify $_get -
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart04TestMindmapTest048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr = new Int32Array([1, 2, 3, 4]);
          let readBack: number = 0;
          let idx: int = arr.findLastIndex((v: number, i: int, a: Int32Array): boolean => {
          if (i === 3) {
          a.$_set(1, 555);
          readBack = a.$_get(1);
          return false;
          }
          return v === 555;
        });
          expect(readBack).assertEqual(555);
          expect(idx).assertEqual(1);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART04_TEST_MINDMAP_4900
         * @tc.name int32ArrayFindLastIndexPart04TestMindmapTest049
         * @tc.desc Verify a fill - fill
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart04TestMindmapTest049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr = new Int32Array([1, 2, 3, 4, 5]);
          let idx: int = arr.findLastIndex((v: number, i: int, a: Int32Array): boolean => {
          if (i === 4) {
          a.fill(88, 0, i);
          return false;
          }
          return v === 88;
        });
          expect(idx).assertEqual(3);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART04_TEST_MINDMAP_5000
         * @tc.name int32ArrayFindLastIndexPart04TestMindmapTest050
         * @tc.desc Verify a reverse -
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart04TestMindmapTest050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr = new Int32Array([1, 2, 3, 4, 5]);
          let sawValues: number[] = [];
          let idx: int = arr.findLastIndex((v: number, i: int, a: Int32Array): boolean => {
          sawValues.push(v);
          if (i === 4) {
          a.reverse();
          return false;
          }
          return false;
        });
          expect(sawValues[0]).assertEqual(5);
          expect(idx).assertEqual(-1);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART04_TEST_MINDMAP_5100
         * @tc.name int32ArrayFindLastIndexPart04TestMindmapTest051
         * @tc.desc Verify Int32Array findLastIndex- subarray buffer
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart04TestMindmapTest051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let parent = new Int32Array([10, 20, 30, 40, 50]);
          let child = parent.subarray(1, 4);
          let idx: int = parent.findLastIndex((v: number, i: int, a: Int32Array): boolean => { return v === 30; });
          expect(child.$_get(0)).assertEqual(20);
          expect(child.$_get(1)).assertEqual(30);
          expect(child.$_get(2)).assertEqual(40);
          expect(idx).assertEqual(2);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART04_TEST_MINDMAP_5200
         * @tc.name int32ArrayFindLastIndexPart04TestMindmapTest052
         * @tc.desc Verify findLastIndex -
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart04TestMindmapTest052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let parent = new Int32Array([10, 20, 30, 40, 50]);
          let child = parent.subarray(2, 5);
          let idx: int = child.findLastIndex((v: number, i: int, a: Int32Array): boolean => { return v > 35; });
          expect(idx).assertEqual(2);
          expect(parent.$_get(4)).assertEqual(50);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART04_TEST_MINDMAP_5300
         * @tc.name int32ArrayFindLastIndexPart04TestMindmapTest053
         * @tc.desc Verify findLastIndex a.$_set - buffer
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart04TestMindmapTest053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let parent = new Int32Array([1, 2, 3, 4]);
          let child = parent.subarray(1, 4);
          let idx: int = child.findLastIndex((v: number, i: int, a: Int32Array): boolean => {
          if (i === 0) {
          a.$_set(0, 999);
          }
          return v === 2;
        });
          expect(parent.$_get(1)).assertEqual(999);
          expect(idx).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART04_TEST_MINDMAP_5400
         * @tc.name int32ArrayFindLastIndexPart04TestMindmapTest054
         * @tc.desc Verify findLastIndex -
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart04TestMindmapTest054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let parent = new Int32Array([10, 20, 30, 40]);
          let child = parent.subarray(0, 4);
          let seen: number[] = [];
          let idx: int = child.findLastIndex((v: number, i: int, a: Int32Array): boolean => {
          seen.push(v);
          if (i === 3) {
          parent.$_set(0, 777);
          }
          return false;
        });
          expect(seen[0]).assertEqual(40);
          expect(seen[3]).assertEqual(777);
          expect(idx).assertEqual(-1);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART04_TEST_MINDMAP_5500
         * @tc.name int32ArrayFindLastIndexPart04TestMindmapTest055
         * @tc.desc Verify byteOffset Int32Array ArrayBuffer- findLastIndex
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart04TestMindmapTest055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let buf = new ArrayBuffer(16);
          let view1 = new Int32Array(buf, 0, 2);
          let view2 = new Int32Array(buf, 8, 2);
          view1.$_set(0, 11);
          view1.$_set(1, 22);
          view2.$_set(0, 33);
          view2.$_set(1, 44);
          let i1: int = view1.findLastIndex((v: number, i: int, a: Int32Array): boolean => { return v > 15; });
          let i2: int = view2.findLastIndex((v: number, i: int, a: Int32Array): boolean => { return v > 35; });
          expect(i1).assertEqual(1);
          expect(i2).assertEqual(1);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART04_TEST_MINDMAP_5600
         * @tc.name int32ArrayFindLastIndexPart04TestMindmapTest056
         * @tc.desc Verify slice findLastIndex-
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart04TestMindmapTest056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let orig = new Int32Array([1, 2, 3, 4, 5]);
          let cp = orig.slice();
          let idx: int = cp.findLastIndex((v: number, i: int, a: Int32Array): boolean => {
          a.$_set(i, 99);
          return v === 3;
        });
          expect(orig.$_get(2)).assertEqual(3);
          expect(cp.$_get(2)).assertEqual(99);
          expect(idx).assertEqual(2);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART04_TEST_MINDMAP_5700
         * @tc.name int32ArrayFindLastIndexPart04TestMindmapTest057
         * @tc.desc Verify ArrayBuffer Uint8Array -Int32Array findLastIndex Int32
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart04TestMindmapTest057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let buf = new ArrayBuffer(8);
          let i32 = new Int32Array(buf);
          let u8 = new Uint8Array(buf);
          i32.$_set(0, 0);
          i32.$_set(1, 0);
          u8.$_set(4, 0x78);
          u8.$_set(5, 0x56);
          u8.$_set(6, 0x34);
          u8.$_set(7, 0x12);
          let idx: int = i32.findLastIndex((v: number, i: int, a: Int32Array): boolean => { return v !== 0; });
          expect(idx).assertEqual(1);
          expect(i32.$_get(1)).assertEqual(0x12345678);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART04_TEST_MINDMAP_5800
         * @tc.name int32ArrayFindLastIndexPart04TestMindmapTest058
         * @tc.desc Verify fill findLastIndex- fill index
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart04TestMindmapTest058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let parent = new Int32Array(8);
          let child = parent.subarray(2, 6);
          parent.fill(7, 2, 6);
          let idx: int = child.findLastIndex((v: number, i: int, a: Int32Array): boolean => { return v === 7; });
          expect(idx).assertEqual(3);
          expect(child.$_get(0)).assertEqual(7);
          expect(child.$_get(3)).assertEqual(7);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART04_TEST_MINDMAP_5900
         * @tc.name int32ArrayFindLastIndexPart04TestMindmapTest059
         * @tc.desc Verify findLastIndex- buffer
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart04TestMindmapTest059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let parent = new Int32Array([1, 2, 3, 4, 5, 6]);
          let child = parent.subarray(1, 5);
          let pi: int = parent.findLastIndex((v: number, i: int, a: Int32Array): boolean => { return v === 4; });
          let ci: int = child.findLastIndex((v: number, i: int, a: Int32Array): boolean => { return v === 4; });
          expect(pi).assertEqual(3);
          expect(ci).assertEqual(2);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART04_TEST_MINDMAP_6000
         * @tc.name int32ArrayFindLastIndexPart04TestMindmapTest060
         * @tc.desc Verify array.$_set int32 - index
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart04TestMindmapTest060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr = new Int32Array([0, 0, 0, 0]);
          let idx: int = arr.findLastIndex((v: number, i: int, a: Int32Array): boolean => {
          if (i === a.length - 1) {
          a.$_set(0, 2147483647);
          return false;
          }
          return v === 2147483647;
        });
          expect(idx).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART04_TEST_MINDMAP_6100
         * @tc.name int32ArrayFindLastIndexPart04TestMindmapTest061
         * @tc.desc Verify array.$_set int32 - index
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart04TestMindmapTest061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr = new Int32Array([0, 0, 0, 0]);
          let idx: int = arr.findLastIndex((v: number, i: int, a: Int32Array): boolean => {
          if (i === a.length - 1) {
          a.$_set(0, -2147483648);
          return false;
          }
          return v === -2147483648;
        });
          expect(idx).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART04_TEST_MINDMAP_6200
         * @tc.name int32ArrayFindLastIndexPart04TestMindmapTest062
         * @tc.desc Verify array.$_set 2147483648 ToInt32 -2147483648 -
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart04TestMindmapTest062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr = new Int32Array([0, 0, 0]);
          let readBack: number = 0;
          let idx: int = arr.findLastIndex((v: number, i: int, a: Int32Array): boolean => {
          if (i === a.length - 1) {
          a.$_set(0, 2147483648);
          return false;
          }
          if (i === 0) {
          readBack = v;
          return true;
          }
          return false;
        });
          expect(readBack).assertEqual(-2147483648);
          expect(idx).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART04_TEST_MINDMAP_6300
         * @tc.name int32ArrayFindLastIndexPart04TestMindmapTest063
         * @tc.desc Verify array.$_set 4294967295 0xFFFFFFFF -1 - -1
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart04TestMindmapTest063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr = new Int32Array([0, 0, 0]);
          let readBack: number = 0;
          let idx: int = arr.findLastIndex((v: number, i: int, a: Int32Array): boolean => {
          if (i === 2) {
          a.$_set(1, 4294967295);
          return false;
          }
          if (i === 1) {
          readBack = v;
          return true;
          }
          return false;
        });
          expect(readBack).assertEqual(-1);
          expect(idx).assertEqual(1);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART04_TEST_MINDMAP_6400
         * @tc.name int32ArrayFindLastIndexPart04TestMindmapTest064
         * @tc.desc Verify array.$_set Number.NaN ToInt32 0 - 0
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart04TestMindmapTest064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr = new Int32Array([5, 5, 5]);
          let readBack: number = -1;
          let idx: int = arr.findLastIndex((v: number, i: int, a: Int32Array): boolean => {
          if (i === 2) {
          a.$_set(1, Number.NaN);
          return false;
          }
          if (i === 1) {
          readBack = v;
          return true;
          }
          return false;
        });
          expect(readBack).assertEqual(0);
          expect(idx).assertEqual(1);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART04_TEST_MINDMAP_6500
         * @tc.name int32ArrayFindLastIndexPart04TestMindmapTest065
         * @tc.desc Verify array.$_set 3.9 3 - 3
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart04TestMindmapTest065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr = new Int32Array([0, 0, 0]);
          let readBack: number = 0;
          let idx: int = arr.findLastIndex((v: number, i: int, a: Int32Array): boolean => {
          if (i === 2) {
          a.$_set(1, 3.9);
          return false;
          }
          if (i === 1) {
          readBack = v;
          return true;
          }
          return false;
        });
          expect(readBack).assertEqual(3);
          expect(idx).assertEqual(1);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART04_TEST_MINDMAP_6600
         * @tc.name int32ArrayFindLastIndexPart04TestMindmapTest066
         * @tc.desc Verify array.$_set -3.5 -3 - -3
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart04TestMindmapTest066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr = new Int32Array([0, 0, 0]);
          let readBack: number = 0;
          let idx: int = arr.findLastIndex((v: number, i: int, a: Int32Array): boolean => {
          if (i === 2) {
          a.$_set(1, -3.5);
          return false;
          }
          if (i === 1) {
          readBack = v;
          return true;
          }
          return false;
        });
          expect(readBack).assertEqual(-3);
          expect(idx).assertEqual(1);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART04_TEST_MINDMAP_6700
         * @tc.name int32ArrayFindLastIndexPart04TestMindmapTest067
         * @tc.desc Verify array.$_set +Number.POSITIVE_INFINITY ToInt32 0 - 0
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart04TestMindmapTest067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr = new Int32Array([7, 7, 7]);
          let readBack: number = -1;
          let idx: int = arr.findLastIndex((v: number, i: int, a: Int32Array): boolean => {
          if (i === 2) {
          a.$_set(0, Number.POSITIVE_INFINITY);
          return false;
          }
          if (i === 0) {
          readBack = v;
          return true;
          }
          return false;
        });
          expect(readBack).assertEqual(0);
          expect(idx).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART04_TEST_MINDMAP_6800
         * @tc.name int32ArrayFindLastIndexPart04TestMindmapTest068
         * @tc.desc Verify value int32 - index
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart04TestMindmapTest068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr = new Int32Array([0, 2147483647, 0]);
          let target: int = 2147483647;
          let idx: int = arr.findLastIndex((v: number, i: int, a: Int32Array): boolean => { return v === target; });
          expect(idx).assertEqual(1);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART04_TEST_MINDMAP_6900
         * @tc.name int32ArrayFindLastIndexPart04TestMindmapTest069
         * @tc.desc Verify value int32 - index
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart04TestMindmapTest069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr = new Int32Array([-2147483648, 0, 0]);
          let target: int = -2147483648;
          let idx: int = arr.findLastIndex((v: number, i: int, a: Int32Array): boolean => { return v === target; });
          expect(idx).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART04_TEST_MINDMAP_7000
         * @tc.name int32ArrayFindLastIndexPart04TestMindmapTest070
         * @tc.desc Verify -1 0xFFFFFFFF -findLastIndex index
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart04TestMindmapTest070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr = new Int32Array([0, -1, 0]);
          let idx: int = arr.findLastIndex((v: number, i: int, a: Int32Array): boolean => { return v === -1; });
          expect(idx).assertEqual(1);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART04_TEST_MINDMAP_7100
         * @tc.name int32ArrayFindLastIndexPart04TestMindmapTest071
         * @tc.desc Verify -0 ToInt32 0 -findLastIndex 0
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart04TestMindmapTest071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr = new Int32Array([1, 0, 2]);
          let idx: int = arr.findLastIndex((v: number, i: int, a: Int32Array): boolean => { return v === 0; });
          expect(idx).assertEqual(1);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART04_TEST_MINDMAP_7200
         * @tc.name int32ArrayFindLastIndexPart04TestMindmapTest072
         * @tc.desc Verify - findLastIndex index
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart04TestMindmapTest072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr = new Int32Array([1, 2, 3, 4, 5]);
          let calls: int = 0;
          try {
            arr.findLastIndex((v: number, i: int, a: Int32Array): boolean => {
            calls++;
            throw new Error('first call boom');
          });
            expect().assertFail();
          } catch (e) {
            expect(e.name).assertEqual('Error');
          }
          expect(calls).assertEqual(1);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART04_TEST_MINDMAP_7300
         * @tc.name int32ArrayFindLastIndexPart04TestMindmapTest073
         * @tc.desc Verify -
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart04TestMindmapTest073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr = new Int32Array([10, 20, 30, 40, 50]);
          let calls: int = 0;
          try {
            arr.findLastIndex((v: number, i: int, a: Int32Array): boolean => {
            calls++;
            if (v === 30) {
            throw new Error('mid boom');
            }
            return false;
          });
            expect().assertFail();
          } catch (e) {
            expect(e.name).assertEqual('Error');
          }
          expect(calls).assertEqual(3);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART04_TEST_MINDMAP_7400
         * @tc.name int32ArrayFindLastIndexPart04TestMindmapTest074
         * @tc.desc Verify RangeError - name RangeError
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart04TestMindmapTest074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr = new Int32Array([1, 2, 3]);
          try {
            arr.findLastIndex((v: number, i: int, a: Int32Array): boolean => {
            throw new RangeError('range test');
          });
            expect().assertFail();
          } catch (e) {
            expect(e.name).assertEqual('RangeError');
          }
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART04_TEST_MINDMAP_7500
         * @tc.name int32ArrayFindLastIndexPart04TestMindmapTest075
         * @tc.desc Verify TypeError - name TypeError
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart04TestMindmapTest075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr = new Int32Array([1, 2, 3]);
          try {
            arr.findLastIndex((v: number, i: int, a: Int32Array): boolean => {
            throw new TypeError('type test');
          });
            expect().assertFail();
          } catch (e) {
            expect(e.name).assertEqual('TypeError');
          }
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART04_TEST_MINDMAP_7600
         * @tc.name int32ArrayFindLastIndexPart04TestMindmapTest076
         * @tc.desc Verify array.$_set -
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart04TestMindmapTest076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr = new Int32Array([1, 2, 3, 4]);
          try {
            arr.findLastIndex((v: number, i: int, a: Int32Array): boolean => {
            if (i === 3) {
            a.$_set(1, 888);
            throw new Error('boom after write');
            }
            return false;
          });
            expect().assertFail();
          } catch (e) {
            expect(e.name).assertEqual('Error');
          }
          expect(arr.$_get(1)).assertEqual(888);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART04_TEST_MINDMAP_7700
         * @tc.name int32ArrayFindLastIndexPart04TestMindmapTest077
         * @tc.desc Verify - buffer
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart04TestMindmapTest077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let parent = new Int32Array([10, 20, 30, 40]);
          let child = parent.subarray(1, 4);
          try {
            child.findLastIndex((v: number, i: int, a: Int32Array): boolean => {
            a.$_set(0, 999);
            throw new Error('child boom');
          });
            expect().assertFail();
          } catch (e) {
            expect(e.name).assertEqual('Error');
          }
          expect(parent.$_get(1)).assertEqual(999);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART04_TEST_MINDMAP_7800
         * @tc.name int32ArrayFindLastIndexPart04TestMindmapTest078
         * @tc.desc Verify -
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart04TestMindmapTest078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr = new Int32Array([1, 2, 3, 4]);
          let outerIdx: int = -1;
          outerIdx = arr.findLastIndex((v: number, i: int, a: Int32Array): boolean => {
          try {
            a.findLastIndex((vv: number, ii: int, aa: Int32Array): boolean => { throw new Error('inner'); });
            expect().assertFail();
          } catch (e) {
            expect(e.name).assertEqual('Error');
          }
          return v === 4;
        });
          expect(outerIdx).assertEqual(3);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART04_TEST_MINDMAP_7900
         * @tc.name int32ArrayFindLastIndexPart04TestMindmapTest079
         * @tc.desc Verify predicate -1
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart04TestMindmapTest079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr = new Int32Array();
          let threw: boolean = false;
          let idx: int = arr.findLastIndex((v: number, i: int, a: Int32Array): boolean => {
            threw = true;
            return false;
          });
          expect(threw).assertFalse();
          expect(idx).assertEqual(-1);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART04_TEST_MINDMAP_8000
         * @tc.name int32ArrayFindLastIndexPart04TestMindmapTest080
         * @tc.desc Verify false-findLastIndex -1 length 1
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart04TestMindmapTest080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr = new Int32Array([42]);
          let idx: int = arr.findLastIndex((v: number, i: int, a: Int32Array): boolean => { return v !== 42; });
          expect(idx).assertEqual(-1);
          expect(arr.length).assertEqual(1);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART04_TEST_MINDMAP_8100
         * @tc.name int32ArrayFindLastIndexPart04TestMindmapTest081
         * @tc.desc Verify findLastIndex length-1
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart04TestMindmapTest081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr = new Int32Array([7, 7, 7, 7, 7]);
          let idx: int = arr.findLastIndex((v: number, i: int, a: Int32Array): boolean => { return v === 7; });
          expect(idx).assertEqual(4);
        });
  });
}
