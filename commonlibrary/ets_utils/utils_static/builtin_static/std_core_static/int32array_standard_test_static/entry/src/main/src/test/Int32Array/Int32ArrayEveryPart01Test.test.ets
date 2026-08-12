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
export default function int32ArrayEveryPart01Test(): void {
  describe('Int32ArrayEveryPart01Test', (): void => {
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
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_EVERY_PART01_TEST_MINDMAP_0100
         * @tc.name int32ArrayEveryPart01TestMindmapTest001
         * @tc.desc Verify every returns true when all elements satisfy predicate
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEveryPart01TestMindmapTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([2, 4, 6]);
          let callCount: int = 0;
          let r: boolean = arr.every((e: number, i: int, a: Int32Array): boolean => { callCount++; return e > 0; });
          expect(r).assertTrue();
          expect(callCount).assertEqual(3);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_EVERY_PART01_TEST_MINDMAP_0200
         * @tc.name int32ArrayEveryPart01TestMindmapTest002
         * @tc.desc Verify every returns false when first element does not satisfy predicate
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEveryPart01TestMindmapTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([-1, 2, 3]);
          let callCount: int = 0;
          let r: boolean = arr.every((e: number, i: int, a: Int32Array): boolean => { callCount++; return e > 0; });
          expect(r).assertFalse();
          expect(callCount).assertEqual(1);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_EVERY_PART01_TEST_MINDMAP_0300
         * @tc.name int32ArrayEveryPart01TestMindmapTest003
         * @tc.desc Verify every returns true when all elements satisfy predicate (values > 5)
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEveryPart01TestMindmapTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([11, 22, 33]);
          let callCount: int = 0;
          let r: boolean = arr.every((e: number, _i: int, _a: Int32Array): boolean => { callCount++; return e > 5; });
          expect(r).assertTrue();
          expect(callCount).assertEqual(3);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_EVERY_PART01_TEST_MINDMAP_0400
         * @tc.name int32ArrayEveryPart01TestMindmapTest004
         * @tc.desc Verify every returns false when element fails predicate (e > 10)
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEveryPart01TestMindmapTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3]);
          let callCount: int = 0;
          let r: boolean = arr.every((e: number, _i: int, _a: Int32Array): boolean => { callCount++; return e > 10; });
          expect(r).assertFalse();
          expect(callCount).assertEqual(1);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_EVERY_PART01_TEST_MINDMAP_0500
         * @tc.name int32ArrayEveryPart01TestMindmapTest005
         * @tc.desc Verify every returns true when all elements less than 10
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEveryPart01TestMindmapTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([4, 5, 6]);
          let callCount: int = 0;
          let r: boolean = arr.every((e: number, _i: int, _a: Int32Array): boolean => { callCount++; return e < 10; });
          expect(r).assertTrue();
          expect(callCount).assertEqual(3);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_EVERY_PART01_TEST_MINDMAP_0600
         * @tc.name int32ArrayEveryPart01TestMindmapTest006
         * @tc.desc Verify every returns true when all elements positive
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEveryPart01TestMindmapTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([7, 8, 9]);
          let callCount: int = 0;
          let r: boolean = arr.every((e: number, _i: int, _a: Int32Array): boolean => { callCount++; return e > 0; });
          expect(r).assertTrue();
          expect(callCount).assertEqual(3);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_EVERY_PART01_TEST_MINDMAP_0700
         * @tc.name int32ArrayEveryPart01TestMindmapTest007
         * @tc.desc Verify predicate receives element value 63 correctly
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEveryPart01TestMindmapTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([63]);
          let received: number = 0;
          let r: boolean = arr.every((e: number, i: int, a: Int32Array): boolean => { received = e; return true; });
          expect(r).assertTrue();
          expect(received).assertEqual(63);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_EVERY_PART01_TEST_MINDMAP_0800
         * @tc.name int32ArrayEveryPart01TestMindmapTest008
         * @tc.desc Verify predicate receives element value 0 correctly
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEveryPart01TestMindmapTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([0]);
          let received: number = 777;
          let r: boolean = arr.every((e: number, i: int, a: Int32Array): boolean => { received = e; return true; });
          expect(r).assertTrue();
          expect(received).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_EVERY_PART01_TEST_MINDMAP_0900
         * @tc.name int32ArrayEveryPart01TestMindmapTest009
         * @tc.desc Verify predicate receives element value 1 (minimum positive) correctly
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEveryPart01TestMindmapTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1]);
          let received: number = 0;
          let r: boolean = arr.every((e: number, i: int, a: Int32Array): boolean => { received = e; return true; });
          expect(r).assertTrue();
          expect(received).assertEqual(1);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_EVERY_PART01_TEST_MINDMAP_1000
         * @tc.name int32ArrayEveryPart01TestMindmapTest010
         * @tc.desc Verify predicate receives INT_MAX 2147483647 exactly
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEveryPart01TestMindmapTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([2147483647]);
          let received: number = 0;
          let r: boolean = arr.every((e: number, i: int, a: Int32Array): boolean => { received = e; return true; });
          expect(r).assertTrue();
          expect(received).assertEqual(2147483647);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_EVERY_PART01_TEST_MINDMAP_1100
         * @tc.name int32ArrayEveryPart01TestMindmapTest011
         * @tc.desc Verify predicate receives hex 0x7FFFFFFF as INT_MAX 2147483647
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEveryPart01TestMindmapTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([0x7FFFFFFF]);
          let received: number = 0;
          arr.every((e: number, i: int, a: Int32Array): boolean => { received = e; return true; });
          expect(received).assertEqual(2147483647);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_EVERY_PART01_TEST_MINDMAP_1200
         * @tc.name int32ArrayEveryPart01TestMindmapTest012
         * @tc.desc Verify predicate receives element value 512 (power of two) correctly
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEveryPart01TestMindmapTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([512]);
          let received: number = 0;
          arr.every((e: number, i: int, a: Int32Array): boolean => { received = e; return true; });
          expect(received).assertEqual(512);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_EVERY_PART01_TEST_MINDMAP_1300
         * @tc.name int32ArrayEveryPart01TestMindmapTest013
         * @tc.desc Verify every element in all-zero array is 0
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEveryPart01TestMindmapTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([0, 0, 0, 0]);
          let allZero: boolean = true;
          let r: boolean = arr.every((e: number, i: int, a: Int32Array): boolean => { if (e !== 0) { allZero = false; } return true; });
          expect(r).assertTrue();
          expect(allZero).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_EVERY_PART01_TEST_MINDMAP_1400
         * @tc.name int32ArrayEveryPart01TestMindmapTest014
         * @tc.desc Verify every element in uniform array [9,9,9,9,9] is 9
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEveryPart01TestMindmapTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([9, 9, 9, 9, 9]);
          let expected: number = 9;
          let mismatch: boolean = false;
          arr.every((e: number, i: int, a: Int32Array): boolean => { if (e !== expected) { mismatch = true; } return true; });
          expect(mismatch).assertFalse();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_EVERY_PART01_TEST_MINDMAP_1500
         * @tc.name int32ArrayEveryPart01TestMindmapTest015
         * @tc.desc Verify first element passed to predicate is 17 in multi-element array
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEveryPart01TestMindmapTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([17, 18, 19]);
          let first: number = 0;
          arr.every((e: number, i: int, a: Int32Array): boolean => { first = e; return i < 0; });
          expect(first).assertEqual(17);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_EVERY_PART01_TEST_MINDMAP_1600
         * @tc.name int32ArrayEveryPart01TestMindmapTest016
         * @tc.desc Verify predicate receives element value -1 correctly
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEveryPart01TestMindmapTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([-1]);
          let received: number = 0;
          arr.every((e: number, i: int, a: Int32Array): boolean => { received = e; return true; });
          expect(received).assertEqual(-1);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_EVERY_PART01_TEST_MINDMAP_1700
         * @tc.name int32ArrayEveryPart01TestMindmapTest017
         * @tc.desc Verify predicate receives INT_MIN -2147483648 exactly
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEveryPart01TestMindmapTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([-2147483648]);
          let received: number = 0;
          arr.every((e: number, i: int, a: Int32Array): boolean => { received = e; return true; });
          expect(received).assertEqual(-2147483648);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_EVERY_PART01_TEST_MINDMAP_1800
         * @tc.name int32ArrayEveryPart01TestMindmapTest018
         * @tc.desc Verify predicate receives -0x80000000 as INT_MIN -2147483648
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEveryPart01TestMindmapTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([-0x80000000]);
          let received: number = 0;
          arr.every((e: number, i: int, a: Int32Array): boolean => { received = e; return true; });
          expect(received).assertEqual(-2147483648);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_EVERY_PART01_TEST_MINDMAP_1900
         * @tc.name int32ArrayEveryPart01TestMindmapTest019
         * @tc.desc Verify predicate receives first element -53 in negative array
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEveryPart01TestMindmapTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([-53, -54]);
          let first: number = 0;
          arr.every((e: number, i: int, a: Int32Array): boolean => { first = e; return i < 0; });
          expect(first).assertEqual(-53);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_EVERY_PART01_TEST_MINDMAP_2000
         * @tc.name int32ArrayEveryPart01TestMindmapTest020
         * @tc.desc Verify predicate receives element value -7 correctly
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEveryPart01TestMindmapTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([-7]);
          let received: number = 0;
          arr.every((e: number, i: int, a: Int32Array): boolean => { received = e; return true; });
          expect(received).assertEqual(-7);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_EVERY_PART01_TEST_MINDMAP_2100
         * @tc.name int32ArrayEveryPart01TestMindmapTest021
         * @tc.desc Verify predicate receives elements in order for mixed positive/negative array
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEveryPart01TestMindmapTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([3, -3, 4, -4]);
          let seq: string = '';
          arr.every((e: number, i: int, a: Int32Array): boolean => { seq = seq + e.toString() + ','; return i < 3; });
          expect(seq).assertEqual('3,-3,4,-4,');
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_EVERY_PART01_TEST_MINDMAP_2200
         * @tc.name int32ArrayEveryPart01TestMindmapTest022
         * @tc.desc Verify predicate receives first element -11 in all-negative array
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEveryPart01TestMindmapTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([-11, -22, -33]);
          let first: number = 0;
          arr.every((e: number, i: int, a: Int32Array): boolean => { first = e; return i < 0; });
          expect(first).assertEqual(-11);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_EVERY_PART01_TEST_MINDMAP_2300
         * @tc.name int32ArrayEveryPart01TestMindmapTest023
         * @tc.desc Verify predicate receives hex literal 0xAB as decimal 171
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEveryPart01TestMindmapTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([0xAB]);
          let received: number = 0;
          arr.every((e: number, i: int, a: Int32Array): boolean => { received = e; return true; });
          expect(received).assertEqual(171);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_EVERY_PART01_TEST_MINDMAP_2400
         * @tc.name int32ArrayEveryPart01TestMindmapTest024
         * @tc.desc Verify predicate receives octal literal 0o755 as decimal 493
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEveryPart01TestMindmapTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([0o755]);
          let received: number = 0;
          arr.every((e: number, i: int, a: Int32Array): boolean => { received = e; return true; });
          expect(received).assertEqual(493);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_EVERY_PART01_TEST_MINDMAP_2500
         * @tc.name int32ArrayEveryPart01TestMindmapTest025
         * @tc.desc Verify predicate receives binary literal 0b1100 as decimal 12
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEveryPart01TestMindmapTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([0b1100]);
          let received: number = 0;
          arr.every((e: number, i: int, a: Int32Array): boolean => { received = e; return true; });
          expect(received).assertEqual(12);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_EVERY_PART01_TEST_MINDMAP_2600
         * @tc.name int32ArrayEveryPart01TestMindmapTest026
         * @tc.desc Verify predicate receives negative hex -0xFF as decimal -255
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEveryPart01TestMindmapTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([-0xFF]);
          let received: number = 0;
          arr.every((e: number, i: int, a: Int32Array): boolean => { received = e; return true; });
          expect(received).assertEqual(-255);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_EVERY_PART01_TEST_MINDMAP_2700
         * @tc.name int32ArrayEveryPart01TestMindmapTest027
         * @tc.desc Verify -0.7 is truncated to 0 by ToInt32 (toward zero) via $_set
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEveryPart01TestMindmapTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array(1);
          arr.$_set(0, -0.7);
          let received: number = 777;
          arr.every((e: number, i: int, a: Int32Array): boolean => { received = e; return true; });
          expect(received).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_EVERY_PART01_TEST_MINDMAP_2800
         * @tc.name int32ArrayEveryPart01TestMindmapTest028
         * @tc.desc Verify 2147483647.4 is truncated to INT_MAX 2147483647 by ToInt32 via $_set
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEveryPart01TestMindmapTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array(1);
          arr.$_set(0, 2147483647.4);
          let received: number = 0;
          arr.every((e: number, i: int, a: Int32Array): boolean => { received = e; return true; });
          expect(received).assertEqual(2147483647);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_EVERY_PART01_TEST_MINDMAP_2900
         * @tc.name int32ArrayEveryPart01TestMindmapTest029
         * @tc.desc Verify 7.9 is truncated to 7 by ToInt32 (toward zero) via $_set
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEveryPart01TestMindmapTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array(1);
          arr.$_set(0, 7.9);
          let received: number = -999;
          arr.every((e: number, i: int, a: Int32Array): boolean => { received = e; return true; });
          expect(received).assertEqual(7);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_EVERY_PART01_TEST_MINDMAP_3000
         * @tc.name int32ArrayEveryPart01TestMindmapTest030
         * @tc.desc Verify -7.9 is truncated to -7 by ToInt32 (toward zero) via $_set
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEveryPart01TestMindmapTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array(1);
          arr.$_set(0, -7.9);
          let received: number = 999;
          arr.every((e: number, i: int, a: Int32Array): boolean => { received = e; return true; });
          expect(received).assertEqual(-7);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_EVERY_PART01_TEST_MINDMAP_3100
         * @tc.name int32ArrayEveryPart01TestMindmapTest031
         * @tc.desc Verify 2147483648 (MAX+1) wraps to INT_MIN -2147483648 via ToInt32 overflow via $_set
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEveryPart01TestMindmapTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array(1);
          arr.$_set(0, 2147483648);
          let received: number = 0;
          arr.every((e: number, i: int, a: Int32Array): boolean => { received = e; return true; });
          expect(received).assertEqual(-2147483648);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_EVERY_PART01_TEST_MINDMAP_3200
         * @tc.name int32ArrayEveryPart01TestMindmapTest032
         * @tc.desc Verify 2147483649 (MAX+2) wraps to -2147483647 via ToInt32 overflow via $_set
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEveryPart01TestMindmapTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array(1);
          arr.$_set(0, 2147483649);
          let received: number = 0;
          arr.every((e: number, i: int, a: Int32Array): boolean => { received = e; return true; });
          expect(received).assertEqual(-2147483647);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_EVERY_PART01_TEST_MINDMAP_3300
         * @tc.name int32ArrayEveryPart01TestMindmapTest033
         * @tc.desc Verify -2147483649 (MIN-1) wraps to INT_MAX 2147483647 via ToInt32 overflow via $_set
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEveryPart01TestMindmapTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array(1);
          arr.$_set(0, -2147483649);
          let received: number = 0;
          arr.every((e: number, i: int, a: Int32Array): boolean => { received = e; return true; });
          expect(received).assertEqual(2147483647);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_EVERY_PART01_TEST_MINDMAP_3400
         * @tc.name int32ArrayEveryPart01TestMindmapTest034
         * @tc.desc Verify 4294967296 (2^32) wraps to 0 via ToInt32 overflow via $_set
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEveryPart01TestMindmapTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array(1);
          arr.$_set(0, 4294967296);
          let received: number = 555;
          arr.every((e: number, i: int, a: Int32Array): boolean => { received = e; return true; });
          expect(received).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_EVERY_PART01_TEST_MINDMAP_3500
         * @tc.name int32ArrayEveryPart01TestMindmapTest035
         * @tc.desc Verify 4294967297 (2^32+1) wraps to 1 via ToInt32 overflow via $_set
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEveryPart01TestMindmapTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array(1);
          arr.$_set(0, 4294967297);
          let received: number = 0;
          arr.every((e: number, i: int, a: Int32Array): boolean => { received = e; return true; });
          expect(received).assertEqual(1);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_EVERY_PART01_TEST_MINDMAP_3600
         * @tc.name int32ArrayEveryPart01TestMindmapTest036
         * @tc.desc Verify predicate receives index 0 for single-element array
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEveryPart01TestMindmapTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([63]);
          let receivedIdx: int = -1;
          arr.every((e: number, i: int, a: Int32Array): boolean => { receivedIdx = i; return true; });
          expect(receivedIdx).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_EVERY_PART01_TEST_MINDMAP_3700
         * @tc.name int32ArrayEveryPart01TestMindmapTest037
         * @tc.desc Verify first callback invocation receives index 0
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEveryPart01TestMindmapTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([11, 22]);
          let firstIdx: int = -1;
          arr.every((e: number, i: int, a: Int32Array): boolean => { if (firstIdx === -1) { firstIdx = i; } return i < 1; });
          expect(firstIdx).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_EVERY_PART01_TEST_MINDMAP_3800
         * @tc.name int32ArrayEveryPart01TestMindmapTest038
         * @tc.desc Verify second callback invocation (callCnt===2) receives index 1
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEveryPart01TestMindmapTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([11, 22, 33]);
          let secondIdx: int = -1;
          let callCnt: int = 0;
          arr.every((e: number, i: int, a: Int32Array): boolean => {
          callCnt++;
          if (callCnt === 2) { secondIdx = i; }
          return e !== 999;
        });
          expect(secondIdx).assertEqual(1);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_EVERY_PART01_TEST_MINDMAP_3900
         * @tc.name int32ArrayEveryPart01TestMindmapTest039
         * @tc.desc Verify last callback receives index length-1 when all elements satisfy predicate
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEveryPart01TestMindmapTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3, 4, 5]);
          let lastIdx: int = -1;
          arr.every((e: number, i: int, a: Int32Array): boolean => { lastIdx = i; return true; });
          expect(lastIdx).assertEqual(arr.length - 1);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_EVERY_PART01_TEST_MINDMAP_4000
         * @tc.name int32ArrayEveryPart01TestMindmapTest040
         * @tc.desc Verify predicate receives indices in strictly increasing order 0,1,2,3
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEveryPart01TestMindmapTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([11, 22, 33, 44]);
          let expected: int = 0;
          let ordered: boolean = true;
          arr.every((e: number, i: int, a: Int32Array): boolean => {
          if (i !== expected) { ordered = false; }
          expected++;
          return true;
        });
          expect(ordered).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_EVERY_PART01_TEST_MINDMAP_4100
         * @tc.name int32ArrayEveryPart01TestMindmapTest041
         * @tc.desc Verify a[i] in predicate matches element parameter e (position consistency)
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEveryPart01TestMindmapTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([7, 14, 21, 28]);
          let consistent: boolean = true;
          arr.every((e: number, i: int, a: Int32Array): boolean => {
          if (a[i] !== e) { consistent = false; }
          return true;
        });
          expect(consistent).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_EVERY_PART01_TEST_MINDMAP_4200
         * @tc.name int32ArrayEveryPart01TestMindmapTest042
         * @tc.desc Verify predicate stops at first non-matching element and reports correct index
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEveryPart01TestMindmapTest042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([11, 22, -33, 44]);
          let hitIdx: int = -1;
          arr.every((e: number, i: int, a: Int32Array): boolean => {
          if (e < 0) { hitIdx = i; return false; }
          return true;
        });
          expect(hitIdx).assertEqual(2);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_EVERY_PART01_TEST_MINDMAP_4300
         * @tc.name int32ArrayEveryPart01TestMindmapTest043
         * @tc.desc Verify third parameter array is the same Int32Array reference as caller
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEveryPart01TestMindmapTest043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3]);
          let sameRef: boolean = false;
          arr.every((e: number, i: int, a: Int32Array): boolean => { if (a === arr) { sameRef = true; } return i < 0; });
          expect(sameRef).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_EVERY_PART01_TEST_MINDMAP_4400
         * @tc.name int32ArrayEveryPart01TestMindmapTest044
         * @tc.desc Verify array.length reported in predicate matches original array length
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEveryPart01TestMindmapTest044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3, 4, 5, 6]);
          let reportedLen: int = 0;
          arr.every((e: number, i: int, a: Int32Array): boolean => { reportedLen = a.length; return i < 0; });
          expect(reportedLen).assertEqual(arr.length);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_EVERY_PART01_TEST_MINDMAP_4500
         * @tc.name int32ArrayEveryPart01TestMindmapTest045
         * @tc.desc Verify $_get(i) via array parameter matches $_get(i) on original array
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEveryPart01TestMindmapTest045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([13, 26, 39]);
          let match: boolean = true;
          arr.every((e: number, i: int, a: Int32Array): boolean => {
          if (a.$_get(i) !== arr.$_get(i)) { match = false; }
          return true;
        });
          expect(match).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_EVERY_PART01_TEST_MINDMAP_4600
         * @tc.name int32ArrayEveryPart01TestMindmapTest046
         * @tc.desc Verify array parameter identity is the original Int32Array
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEveryPart01TestMindmapTest046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2]);
          let sameRef: boolean = false;
          arr.every((e: number, i: int, a: Int32Array): boolean => { sameRef = a === arr; return i < 0; });
          expect(sameRef).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_EVERY_PART01_TEST_MINDMAP_4700
         * @tc.name int32ArrayEveryPart01TestMindmapTest047
         * @tc.desc Verify $_set via array parameter in predicate is visible to subsequent callbacks
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEveryPart01TestMindmapTest047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([0, 0, 0]);
          let observed: number = -1;
          arr.every((e: number, i: int, a: Int32Array): boolean => {
          if (i === 0) { a.$_set(1, 77); return true; }
          if (i === 1) { observed = e; return true; }
          return false;
        });
          expect(observed).assertEqual(77);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_EVERY_PART01_TEST_MINDMAP_4800
         * @tc.name int32ArrayEveryPart01TestMindmapTest048
         * @tc.desc Verify array.BYTES_PER_ELEMENT reports 4 for Int32Array
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEveryPart01TestMindmapTest048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1]);
          let bpe: int = 0;
          arr.every((e: number, i: int, a: Int32Array): boolean => { bpe = a.BYTES_PER_ELEMENT; return true; });
          expect(bpe).assertEqual(4);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_EVERY_PART01_TEST_MINDMAP_4900
         * @tc.name int32ArrayEveryPart01TestMindmapTest049
         * @tc.desc Verify every returns true when all elements are even (arrow function predicate)
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEveryPart01TestMindmapTest049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([2, 4, 6, 8]);
          let callCount: int = 0;
          let r: boolean = arr.every((e: number, i: int, a: Int32Array): boolean => { callCount++; return e % 2 === 0; });
          expect(r).assertTrue();
          expect(callCount).assertEqual(4);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_EVERY_PART01_TEST_MINDMAP_5000
         * @tc.name int32ArrayEveryPart01TestMindmapTest050
         * @tc.desc Verify predicate works when only using element parameter (ignoring index and array)
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEveryPart01TestMindmapTest050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([3, 6, 9]);
          let callCount: int = 0;
          let r: boolean = arr.every((e: number): boolean => { callCount++; return e % 3 === 0; });
          expect(r).assertTrue();
          expect(callCount).assertEqual(3);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_EVERY_PART01_TEST_MINDMAP_5100
         * @tc.name int32ArrayEveryPart01TestMindmapTest051
         * @tc.desc Verify predicate works when using element and index parameters only
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEveryPart01TestMindmapTest051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([10, 20, 30, 40]);
          let callCount: int = 0;
          let r: boolean = arr.every((e: number, i: int): boolean => { callCount++; return i < 4; });
          expect(r).assertTrue();
          expect(callCount).assertEqual(4);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_EVERY_PART01_TEST_MINDMAP_5200
         * @tc.name int32ArrayEveryPart01TestMindmapTest052
         * @tc.desc Verify predicate reads external closure variable target for equality check
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEveryPart01TestMindmapTest052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([25, 25, 25]);
          let target: number = 25;
          let callCount: int = 0;
          let r: boolean = arr.every((e: number, i: int, a: Int32Array): boolean => { callCount++; return e === target; });
          expect(r).assertTrue();
          expect(callCount).assertEqual(3);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_EVERY_PART01_TEST_MINDMAP_5300
         * @tc.name int32ArrayEveryPart01TestMindmapTest053
         * @tc.desc Verify predicate checks non-decreasing order via array parameter a[i-1]
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEveryPart01TestMindmapTest053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3, 4]);
          let callCount: int = 0;
          let r: boolean = arr.every((e: number, i: int, a: Int32Array): boolean => {
          callCount++;
          if (i === 0) { return true; }
          return a[i - 1] <= e;
        });
          expect(r).assertTrue();
          expect(callCount).assertEqual(4);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_EVERY_PART01_TEST_MINDMAP_5400
         * @tc.name int32ArrayEveryPart01TestMindmapTest054
         * @tc.desc Verify first element received from Int32Array.of-constructed array is 13
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEveryPart01TestMindmapTest054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = Int32Array.of(13, 26, 39);
          let first: number = 0;
          arr.every((e: number, i: int, a: Int32Array): boolean => { first = e; return i < 0; });
          expect(first).assertEqual(13);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_EVERY_PART01_TEST_MINDMAP_5500
         * @tc.name int32ArrayEveryPart01TestMindmapTest055
         * @tc.desc Verify first element received from Int32Array.from-constructed array is 7
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEveryPart01TestMindmapTest055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = Int32Array.from([7, 14, 21]);
          let first: number = 0;
          arr.every((e: number, i: int, a: Int32Array): boolean => { first = e; return i < 0; });
          expect(first).assertEqual(7);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_EVERY_PART01_TEST_MINDMAP_5600
         * @tc.name int32ArrayEveryPart01TestMindmapTest056
         * @tc.desc Verify predicate receives element 0 for zero-initialized ArrayBuffer-backed Int32Array
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEveryPart01TestMindmapTest056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let buf: ArrayBuffer = new ArrayBuffer(16);
          let arr: Int32Array = new Int32Array(buf, 0, 4);
          let received: number = -1;
          arr.every((e: number, i: int, a: Int32Array): boolean => { received = e; return i < 0; });
          expect(received).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_EVERY_PART01_TEST_MINDMAP_5700
         * @tc.name int32ArrayEveryPart01TestMindmapTest057
         * @tc.desc Verify length-constructed Int32Array initializes elements to 0
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEveryPart01TestMindmapTest057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array(3);
          let first: number = -1;
          arr.every((e: number, i: int, a: Int32Array): boolean => { first = e; return i < 0; });
          expect(first).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_EVERY_PART01_TEST_MINDMAP_5800
         * @tc.name int32ArrayEveryPart01TestMindmapTest058
         * @tc.desc Verify $_set writes before every are visible to predicate via ArrayBuffer-backed view
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEveryPart01TestMindmapTest058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let buf: ArrayBuffer = new ArrayBuffer(12);
          let view: Int32Array = new Int32Array(buf, 0, 3);
          view.$_set(0, 4);
          view.$_set(1, 5);
          view.$_set(2, 6);
          let first: number = 0;
          view.every((e: number, i: int, a: Int32Array): boolean => { first = e; return i < 0; });
          expect(first).assertEqual(4);
        });
  });
}
