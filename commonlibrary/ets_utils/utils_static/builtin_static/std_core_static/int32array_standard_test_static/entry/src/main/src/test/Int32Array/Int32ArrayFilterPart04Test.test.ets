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
export default function int32ArrayFilterPart04Test(): void {
  describe('Int32ArrayFilterPart04Test', (): void => {
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
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART04_TEST_0100
         * @tc.name int32ArrayFilterPart04Test001
         * @tc.desc Verify source Int32Array length preserved after filter call
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFilterPart04Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let src: Int32Array = Int32Array.of(1, -2, 3, -4, 5);
          let lenBefore: int = src.length;
          let res: Int32Array = src.filter((v: number, i: int, a: Int32Array): boolean => v > 0);
          expect(src.length).assertEqual(lenBefore);
          expect(res.length).assertEqual(3);
          expect(res.$_get(0)).assertEqual(1);
          expect(res.$_get(1)).assertEqual(3);
          expect(res.$_get(2)).assertEqual(5);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART04_TEST_0200
         * @tc.name int32ArrayFilterPart04Test002
         * @tc.desc Verify source elements unchanged after filter call (pure read callback)
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFilterPart04Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let src: Int32Array = Int32Array.of(10, 20, 30, 40);
          let res: Int32Array = src.filter((v: number, i: int, a: Int32Array): boolean => v > 25);
          expect(res.length).assertEqual(2);
          expect(src.$_get(0)).assertEqual(10);
          expect(src.$_get(1)).assertEqual(20);
          expect(src.$_get(2)).assertEqual(30);
          expect(src.$_get(3)).assertEqual(40);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART04_TEST_0300
         * @tc.name int32ArrayFilterPart04Test003
         * @tc.desc Verify source Int32Array byteLength preserved after filter call
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFilterPart04Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let src: Int32Array = new Int32Array(new ArrayBuffer(16));
          src.$_set(0, 1);
          src.$_set(1, 2);
          src.$_set(2, 3);
          src.$_set(3, 4);
          let blBefore: int = src.byteLength;
          let res: Int32Array = src.filter((v: number, i: int, a: Int32Array): boolean => v % 2 === 0);
          expect(src.byteLength).assertEqual(blBefore);
          expect(res.length).assertEqual(2);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART04_TEST_0400
         * @tc.name int32ArrayFilterPart04Test004
         * @tc.desc Verify source Int32Array byteOffset preserved after filter call
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFilterPart04Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let buf: ArrayBuffer = new ArrayBuffer(24);
          let src: Int32Array = new Int32Array(buf, 8, 3);
          src.$_set(0, 5);
          src.$_set(1, -5);
          src.$_set(2, 7);
          let boBefore: int = src.byteOffset;
          let res: Int32Array = src.filter((v: number, i: int, a: Int32Array): boolean => v > 0);
          expect(src.byteOffset).assertEqual(boBefore);
          expect(res.length).assertEqual(2);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART04_TEST_0500
         * @tc.name int32ArrayFilterPart04Test005
         * @tc.desc Verify source Int32Array buffer reference unchanged after filter call
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFilterPart04Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let buf: ArrayBuffer = new ArrayBuffer(16);
          let src: Int32Array = new Int32Array(buf);
          src.$_set(0, 1);
          src.$_set(1, -1);
          src.$_set(2, 2);
          src.$_set(3, -2);
          let res: Int32Array = src.filter((v: number, i: int, a: Int32Array): boolean => v > 0);
          expect(src.buffer).assertEqual(buf);
          expect(res.length).assertEqual(2);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART04_TEST_0600
         * @tc.name int32ArrayFilterPart04Test006
         * @tc.desc Verify filter result has a different buffer from source (newly allocated)
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFilterPart04Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let src: Int32Array = Int32Array.of(1, 2, 3, 4);
          let res: Int32Array = src.filter((v: number, i: int, a: Int32Array): boolean => v > 2);
          expect(res.buffer === src.buffer).assertEqual(false);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART04_TEST_0700
         * @tc.name int32ArrayFilterPart04Test007
         * @tc.desc Verify mutating filter result elements does not affect source array
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFilterPart04Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let src: Int32Array = Int32Array.of(1, 2, 3, 4);
          let res: Int32Array = src.filter((v: number, i: int, a: Int32Array): boolean => v > 0);
          res.$_set(0, 999);
          expect(src.$_get(0)).assertEqual(1);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART04_TEST_0800
         * @tc.name int32ArrayFilterPart04Test008
         * @tc.desc Verify result length equals number of positive hits (3 hits)
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFilterPart04Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let src: Int32Array = Int32Array.of(1, -1, 2, -2, 3, -3);
          let res: Int32Array = src.filter((v: number, i: int, a: Int32Array): boolean => v > 0);
          expect(res.length).assertEqual(3);
          expect(res.$_get(0)).assertEqual(1);
          expect(res.$_get(1)).assertEqual(2);
          expect(res.$_get(2)).assertEqual(3);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART04_TEST_0900
         * @tc.name int32ArrayFilterPart04Test009
         * @tc.desc Verify result length equals 0 when no element matches predicate
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFilterPart04Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let src: Int32Array = Int32Array.of(-1, -2, -3);
          let res: Int32Array = src.filter((v: number, i: int, a: Int32Array): boolean => v > 0);
          expect(res.length).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART04_TEST_1000
         * @tc.name int32ArrayFilterPart04Test010
         * @tc.desc Verify result length equals source length when all elements match
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFilterPart04Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let src: Int32Array = Int32Array.of(1, 2, 3);
          let res: Int32Array = src.filter((v: number, i: int, a: Int32Array): boolean => true);
          expect(res.length).assertEqual(src.length);
          expect(res.$_get(0)).assertEqual(1);
          expect(res.$_get(1)).assertEqual(2);
          expect(res.$_get(2)).assertEqual(3);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART04_TEST_1100
         * @tc.name int32ArrayFilterPart04Test011
         * @tc.desc Verify filter result is an instance of Int32Array
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFilterPart04Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let src: Int32Array = Int32Array.of(1, 2, 3);
          let res: Int32Array = src.filter((v: number, i: int, a: Int32Array): boolean => true);
          expect(res.length).assertEqual(3);
          expect(res[0]).assertEqual(1);
          expect(res[1]).assertEqual(2);
          expect(res[2]).assertEqual(3);
          expect(res.buffer === src.buffer).assertEqual(false);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART04_TEST_1200
         * @tc.name int32ArrayFilterPart04Test012
         * @tc.desc Verify empty filter result is Int32Array instance with byteLength 0
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFilterPart04Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let src: Int32Array = Int32Array.of(1, 2, 3);
          let res: Int32Array = src.filter((v: number, i: int, a: Int32Array): boolean => false);
          expect(res.length).assertEqual(0);
          expect(res.byteLength).assertEqual(0);
          expect(res.buffer === src.buffer).assertEqual(false);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART04_TEST_1300
         * @tc.name int32ArrayFilterPart04Test013
         * @tc.desc Verify callback invoked exactly length times via external counter
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFilterPart04Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let src: Int32Array = Int32Array.of(10, 20, 30, 40, 50);
          let count: int = 0;
          src.filter((v: number, i: int, a: Int32Array): boolean => {
          count = count + 1;
          return v > 100;
        });
          expect(count).assertEqual(src.length);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART04_TEST_1400
         * @tc.name int32ArrayFilterPart04Test014
         * @tc.desc Verify callback receives index sequence 0,1,2,3 in ascending order
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFilterPart04Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let src: Int32Array = Int32Array.of(10, 20, 30, 40);
          let idxs: int[] = [];
          src.filter((v: number, i: int, a: Int32Array): boolean => {
          idxs.push(i);
          return v > 25;
        });
          expect(idxs.length).assertEqual(4);
          expect(idxs[0]).assertEqual(0);
          expect(idxs[1]).assertEqual(1);
          expect(idxs[2]).assertEqual(2);
          expect(idxs[3]).assertEqual(3);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART04_TEST_1500
         * @tc.name int32ArrayFilterPart04Test015
         * @tc.desc Verify callback receives values in ascending index order 7,-3,0,42
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFilterPart04Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let src: Int32Array = Int32Array.of(7, -3, 0, 42);
          let vals: number[] = [];
          src.filter((v: number, i: int, a: Int32Array): boolean => {
          vals.push(v);
          return true;
        });
          expect(vals[0]).assertEqual(7);
          expect(vals[1]).assertEqual(-3);
          expect(vals[2]).assertEqual(0);
          expect(vals[3]).assertEqual(42);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART04_TEST_1600
         * @tc.name int32ArrayFilterPart04Test016
         * @tc.desc Verify third callback parameter array === source Int32Array
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFilterPart04Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let src: Int32Array = Int32Array.of(1, 2, 3);
          let observedLen: int = -1;
          let sameRef: boolean = false;
          src.filter((v: number, i: int, a: Int32Array): boolean => {
          observedLen = a.length;
          sameRef = a === src;
          return true;
        });
          expect(observedLen).assertEqual(3);
          expect(sameRef).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART04_TEST_1700
         * @tc.name int32ArrayFilterPart04Test017
         * @tc.desc Verify closure capturing threshold variable affects predicate result
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFilterPart04Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let src: Int32Array = Int32Array.of(1, 2, 3, 4, 5);
          let threshold: int = 3;
          let res: Int32Array = src.filter((v: number, i: int, a: Int32Array): boolean => v > threshold);
          expect(res.length).assertEqual(2);
          expect(res.$_get(0)).assertEqual(4);
          expect(res.$_get(1)).assertEqual(5);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART04_TEST_1800
         * @tc.name int32ArrayFilterPart04Test018
         * @tc.desc Verify callback accumulates sum of values via outer variable
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFilterPart04Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let src: Int32Array = Int32Array.of(1, 2, 3, 4);
          let sum: number = 0;
          src.filter((v: number, i: int, a: Int32Array): boolean => {
          sum = sum + v;
          return false;
        });
          expect(sum).assertEqual(10);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART04_TEST_1900
         * @tc.name int32ArrayFilterPart04Test019
         * @tc.desc Verify mutating a future element in callback is observed in later iteration
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFilterPart04Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let src: Int32Array = Int32Array.of(1, 2, 3, 4);
          let seen: number[] = [];
          src.filter((v: number, i: int, a: Int32Array): boolean => {
          seen.push(v);
          if (i === 0) {
          a.$_set(2, 99);
          }
          return false;
        });
          expect(seen[2]).assertEqual(99);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART04_TEST_2000
         * @tc.name int32ArrayFilterPart04Test020
         * @tc.desc Verify mutating visited element does not trigger revisit (callCount = length)
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFilterPart04Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let src: Int32Array = Int32Array.of(1, 2, 3);
          let callCount: int = 0;
          src.filter((v: number, i: int, a: Int32Array): boolean => {
          callCount = callCount + 1;
          a.$_set(0, 999);
          return false;
        });
          expect(callCount).assertEqual(3);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART04_TEST_2100
         * @tc.name int32ArrayFilterPart04Test021
         * @tc.desc Verify setting later element to INT_MAX is observed when index reaches it
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFilterPart04Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let src: Int32Array = Int32Array.of(0, 0, 0, 0);
          let lastVal: number = 0;
          src.filter((v: number, i: int, a: Int32Array): boolean => {
          if (i === 0) {
          a.$_set(3, 2147483647);
          }
          if (i === 3) {
          lastVal = v;
          }
          return false;
        });
          expect(lastVal).assertEqual(2147483647);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART04_TEST_2200
         * @tc.name int32ArrayFilterPart04Test022
         * @tc.desc Verify setting later element to INT_MIN is observed when index reaches it
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFilterPart04Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let src: Int32Array = Int32Array.of(0, 0, 0);
          let midVal: number = 0;
          src.filter((v: number, i: int, a: Int32Array): boolean => {
          if (i === 0) {
          a.$_set(1, -2147483648);
          }
          if (i === 1) {
          midVal = v;
          }
          return false;
        });
          expect(midVal).assertEqual(-2147483648);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART04_TEST_2300
         * @tc.name int32ArrayFilterPart04Test023
         * @tc.desc Verify result uses snapshotted v not the modified current element
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFilterPart04Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let src: Int32Array = Int32Array.of(1, 2, 3);
          let res: Int32Array = src.filter((v: number, i: int, a: Int32Array): boolean => {
          a.$_set(i, 0);
          return v > 0;
        });
          expect(res.length).assertEqual(3);
          expect(res.$_get(0)).assertEqual(0);
          expect(res.$_get(1)).assertEqual(0);
          expect(res.$_get(2)).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART04_TEST_2400
         * @tc.name int32ArrayFilterPart04Test024
         * @tc.desc Verify setting a later element to negative causes it to be excluded
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFilterPart04Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let src: Int32Array = Int32Array.of(1, 2, 3, 4);
          let res: Int32Array = src.filter((v: number, i: int, a: Int32Array): boolean => {
          if (i === 0) {
          a.$_set(2, -99);
          }
          return v > 0;
        });
          expect(res.length).assertEqual(3);
          expect(res.$_get(0)).assertEqual(1);
          expect(res.$_get(1)).assertEqual(2);
          expect(res.$_get(2)).assertEqual(4);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART04_TEST_2500
         * @tc.name int32ArrayFilterPart04Test025
         * @tc.desc Verify $_set with negative index throws RangeError inside filter callback
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFilterPart04Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let src: Int32Array = Int32Array.of(1, 2, 3);
          let reached: boolean = false;
          let res: Int32Array = src.filter((v: number, i: int, a: Int32Array): boolean => {
          try {
            a.$_set(-1, 99);
            expect().assertFail();
          } catch (e) {
            expect(e.name).assertEqual('RangeError');
          }
          reached = true;
          return true;
        });
          expect(reached).assertTrue();
          expect(res.length).assertEqual(3);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART04_TEST_2600
         * @tc.name int32ArrayFilterPart04Test026
         * @tc.desc Verify $_set with index equal to length throws RangeError inside filter callback
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFilterPart04Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let src: Int32Array = Int32Array.of(1, 2, 3);
          let res: Int32Array = src.filter((v: number, i: int, a: Int32Array): boolean => {
          try {
            a.$_set(a.length, 77);
            expect().assertFail();
          } catch (e) {
            expect(e.name).assertEqual('RangeError');
          }
          return true;
        });
          expect(src.length).assertEqual(3);
          expect(res.length).assertEqual(3);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART04_TEST_2700
         * @tc.name int32ArrayFilterPart04Test027
         * @tc.desc Verify nested filter even then greaterThan4 yields intersection
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFilterPart04Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let src: Int32Array = Int32Array.of(1, 2, 3, 4, 5, 6, 7, 8);
          let evens: Int32Array = src.filter((v: number, i: int, a: Int32Array): boolean => v % 2 === 0);
          let res: Int32Array = evens.filter((v: number, i: int, a: Int32Array): boolean => v > 4);
          expect(res.length).assertEqual(2);
          expect(res.$_get(0)).assertEqual(6);
          expect(res.$_get(1)).assertEqual(8);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART04_TEST_2800
         * @tc.name int32ArrayFilterPart04Test028
         * @tc.desc Verify two-layer nested filter does not mutate source array
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFilterPart04Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let src: Int32Array = Int32Array.of(-5, 0, 5, -10, 10);
          let positives: Int32Array = src.filter((v: number, i: int, a: Int32Array): boolean => v > 0);
          let big: Int32Array = positives.filter((v: number, i: int, a: Int32Array): boolean => v > 7);
          expect(src.$_get(0)).assertEqual(-5);
          expect(src.$_get(1)).assertEqual(0);
          expect(src.$_get(2)).assertEqual(5);
          expect(big.$_get(0)).assertEqual(10);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART04_TEST_2900
         * @tc.name int32ArrayFilterPart04Test029
         * @tc.desc Verify nested filter inside callback returns correct odd count
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFilterPart04Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let src: Int32Array = Int32Array.of(1, 2, 3, 4);
          let res: Int32Array = src.filter((v: number, i: int, a: Int32Array): boolean => {
          let inner: Int32Array = a.filter((x: number, j: int, b: Int32Array): boolean => x % 2 === 0);
          return inner.length === 2 && v % 2 === 1;
        });
          expect(res.length).assertEqual(2);
          expect(res.$_get(0)).assertEqual(1);
          expect(res.$_get(1)).assertEqual(3);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART04_TEST_3000
         * @tc.name int32ArrayFilterPart04Test030
         * @tc.desc Verify three-layer nested filter (positive, even, >=10) yields correct chain
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFilterPart04Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let src: Int32Array = Int32Array.of(-20, -4, 0, 2, 6, 11, 12, 30);
          let pos: Int32Array = src.filter((v: number, i: int, a: Int32Array): boolean => v > 0);
          let even: Int32Array = pos.filter((v: number, i: int, a: Int32Array): boolean => v % 2 === 0);
          let big: Int32Array = even.filter((v: number, i: int, a: Int32Array): boolean => v >= 10);
          expect(big.length).assertEqual(2);
          expect(big.$_get(0)).assertEqual(12);
          expect(big.$_get(1)).assertEqual(30);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART04_TEST_3100
         * @tc.name int32ArrayFilterPart04Test031
         * @tc.desc Verify filtering an already empty filter result returns empty
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFilterPart04Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let src: Int32Array = Int32Array.of(-1, -2, -3);
          let empty1: Int32Array = src.filter((v: number, i: int, a: Int32Array): boolean => v > 0);
          let empty2: Int32Array = empty1.filter((v: number, i: int, a: Int32Array): boolean => true);
          expect(empty1.length).assertEqual(0);
          expect(empty2.length).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART04_TEST_3200
         * @tc.name int32ArrayFilterPart04Test032
         * @tc.desc Verify single-element array survives chained identity filter and eq-filter
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFilterPart04Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let src: Int32Array = Int32Array.of(42);
          let r1: Int32Array = src.filter((v: number, i: int, a: Int32Array): boolean => true);
          let r2: Int32Array = r1.filter((v: number, i: int, a: Int32Array): boolean => v === 42);
          expect(r2.length).assertEqual(1);
          expect(r2.$_get(0)).assertEqual(42);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART04_TEST_3300
         * @tc.name int32ArrayFilterPart04Test033
         * @tc.desc Verify negatives-only filter returns -2,-4,-6 independently of other filters
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFilterPart04Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let src: Int32Array = Int32Array.of(1, -2, 3, -4, 5, -6);
          let negs: Int32Array = src.filter((v: number, i: int, a: Int32Array): boolean => v < 0);
          expect(negs.length).assertEqual(3);
          expect(negs.$_get(0)).assertEqual(-2);
          expect(negs.$_get(1)).assertEqual(-4);
          expect(negs.$_get(2)).assertEqual(-6);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART04_TEST_3400
         * @tc.name int32ArrayFilterPart04Test034
         * @tc.desc Verify $_set -0.9 truncates toward zero to 0 (not -1)
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFilterPart04Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let src: Int32Array = Int32Array.of(1, 2);
          let seen: number = 100;
          src.filter((v: number, i: int, a: Int32Array): boolean => {
          if (i === 0) {
          a.$_set(1, -0.9);
          }
          if (i === 1) {
          seen = v;
          }
          return false;
        });
          expect(seen).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART04_TEST_3500
         * @tc.name int32ArrayFilterPart04Test035
         * @tc.desc Verify $_set 2147483648 (INT_MAX+1) ToInt32 wraps to -2147483648
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFilterPart04Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let src: Int32Array = Int32Array.of(0, 0);
          let seen: number = 0;
          src.filter((v: number, i: int, a: Int32Array): boolean => {
          if (i === 0) {
          a.$_set(1, 2147483648 as number);
          }
          if (i === 1) {
          seen = v;
          }
          return false;
        });
          expect(seen).assertEqual(-2147483648);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART04_TEST_3600
         * @tc.name int32ArrayFilterPart04Test036
         * @tc.desc Verify $_set -2147483649 (INT_MIN-1) ToInt32 wraps to 2147483647
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFilterPart04Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let src: Int32Array = Int32Array.of(0, 0);
          let seen: number = 0;
          src.filter((v: number, i: int, a: Int32Array): boolean => {
          if (i === 0) {
          a.$_set(1, -2147483649 as number);
          }
          if (i === 1) {
          seen = v;
          }
          return false;
        });
          expect(seen).assertEqual(2147483647);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART04_TEST_3700
         * @tc.name int32ArrayFilterPart04Test037
         * @tc.desc Verify $_set 4294967296 (2^32) ToInt32 wraps to 0
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFilterPart04Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let src: Int32Array = Int32Array.of(0, 0);
          let seen: number = -1;
          src.filter((v: number, i: int, a: Int32Array): boolean => {
          if (i === 0) {
          a.$_set(1, 4294967296 as number);
          }
          if (i === 1) {
          seen = v;
          }
          return false;
        });
          expect(seen).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART04_TEST_3800
         * @tc.name int32ArrayFilterPart04Test038
         * @tc.desc Verify $_set 2147483647.9 truncates to INT_MAX 2147483647 (no overflow)
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFilterPart04Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let src: Int32Array = Int32Array.of(0, 0);
          let seen: number = 0;
          src.filter((v: number, i: int, a: Int32Array): boolean => {
          if (i === 0) {
          a.$_set(1, 2147483647.9);
          }
          if (i === 1) {
          seen = v;
          }
          return false;
        });
          expect(seen).assertEqual(2147483647);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART04_TEST_3900
         * @tc.name int32ArrayFilterPart04Test039
         * @tc.desc Verify $_set -2147483648.1 truncates to INT_MIN (does not wrap to INT_MAX)
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFilterPart04Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let src: Int32Array = Int32Array.of(0, 0);
          let seen: number = 0;
          src.filter((v: number, i: int, a: Int32Array): boolean => {
          if (i === 0) {
          a.$_set(1, -2147483648.1);
          }
          if (i === 1) {
          seen = v;
          }
          return false;
        });
          expect(seen).assertEqual(-2147483648);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART04_TEST_4000
         * @tc.name int32ArrayFilterPart04Test040
         * @tc.desc Verify result contains snapshotted values; later mutation affects later slots
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFilterPart04Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let src: Int32Array = Int32Array.of(1, 2, 3);
          let res: Int32Array = src.filter((v: number, i: int, a: Int32Array): boolean => {
          if (i === 0) {
          a.$_set(1, 999);
          }
          return true;
        });
          expect(res.$_get(0)).assertEqual(1);
          expect(res.$_get(1)).assertEqual(999);
          expect(res.$_get(2)).assertEqual(3);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART04_TEST_4100
         * @tc.name int32ArrayFilterPart04Test041
         * @tc.desc Verify sibling Int32Array view on same ArrayBuffer sees callback $_set writes
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFilterPart04Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let buf: ArrayBuffer = new ArrayBuffer(16);
          let a: Int32Array = new Int32Array(buf);
          let b: Int32Array = new Int32Array(buf);
          a.$_set(0, 1);
          a.$_set(1, 2);
          a.$_set(2, 3);
          a.$_set(3, 4);
          a.filter((v: number, i: int, arr: Int32Array): boolean => {
          if (i === 0) {
          arr.$_set(3, 77);
          }
          return true;
        });
          expect(b.$_get(3)).assertEqual(77);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART04_TEST_4200
         * @tc.name int32ArrayFilterPart04Test042
         * @tc.desc Verify sibling view with byteOffset=4 observes callback writes at aliased slot
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFilterPart04Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let buf: ArrayBuffer = new ArrayBuffer(20);
          let a: Int32Array = new Int32Array(buf, 0, 5);
          let c: Int32Array = new Int32Array(buf, 4, 4);
          a.$_set(0, 0);
          a.$_set(1, 0);
          a.$_set(2, 0);
          a.$_set(3, 0);
          a.$_set(4, 0);
          a.filter((v: number, i: int, arr: Int32Array): boolean => {
          if (i === 0) {
          arr.$_set(2, 111);
          }
          return true;
        });
          expect(c.$_get(1)).assertEqual(111);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART04_TEST_4300
         * @tc.name int32ArrayFilterPart04Test043
         * @tc.desc Verify sibling alias writes in callback are observed by source on later iteration
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFilterPart04Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let buf: ArrayBuffer = new ArrayBuffer(16);
          let a: Int32Array = new Int32Array(buf);
          let b: Int32Array = new Int32Array(buf);
          a.$_set(0, 0);
          a.$_set(1, 0);
          a.$_set(2, 0);
          a.$_set(3, 0);
          let seen: number = 0;
          a.filter((v: number, i: int, arr: Int32Array): boolean => {
          if (i === 0) {
          b.$_set(3, 222);
          }
          if (i === 3) {
          seen = v;
          }
          return false;
        });
          expect(seen).assertEqual(222);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART04_TEST_4400
         * @tc.name int32ArrayFilterPart04Test044
         * @tc.desc Verify result buffer is independent; mutating result does not touch source buffer
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFilterPart04Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let buf: ArrayBuffer = new ArrayBuffer(16);
          let a: Int32Array = new Int32Array(buf);
          a.$_set(0, 1);
          a.$_set(1, 2);
          a.$_set(2, 3);
          a.$_set(3, 4);
          let b: Int32Array = new Int32Array(buf);
          let res: Int32Array = a.filter((v: number, i: int, arr: Int32Array): boolean => v > 2);
          res.$_set(0, -999);
          expect(b.$_get(2)).assertEqual(3);
          expect(a.$_get(2)).assertEqual(3);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART04_TEST_4500
         * @tc.name int32ArrayFilterPart04Test045
         * @tc.desc Verify filter on Int32Array over zero-byte ArrayBuffer returns empty
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFilterPart04Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let buf: ArrayBuffer = new ArrayBuffer(0);
          let a: Int32Array = new Int32Array(buf);
          let res: Int32Array = a.filter((v: number, i: int, arr: Int32Array): boolean => true);
          expect(res.length).assertEqual(0);
          expect(a.length).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART04_TEST_4600
         * @tc.name int32ArrayFilterPart04Test046
         * @tc.desc Verify filter on view with byteOffset=4 correctly reads and filters elements
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFilterPart04Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let buf: ArrayBuffer = new ArrayBuffer(24);
          let a: Int32Array = new Int32Array(buf, 4, 4);
          a.$_set(0, 10);
          a.$_set(1, -10);
          a.$_set(2, 20);
          a.$_set(3, -20);
          let res: Int32Array = a.filter((v: number, i: int, arr: Int32Array): boolean => v > 0);
          expect(res.length).assertEqual(2);
          expect(res.$_get(0)).assertEqual(10);
          expect(res.$_get(1)).assertEqual(20);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART04_TEST_4700
         * @tc.name int32ArrayFilterPart04Test047
         * @tc.desc Verify result byteOffset is 0 (new array default alignment)
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFilterPart04Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let buf: ArrayBuffer = new ArrayBuffer(24);
          let a: Int32Array = new Int32Array(buf, 8, 3);
          a.$_set(0, 1);
          a.$_set(1, 2);
          a.$_set(2, 3);
          let res: Int32Array = a.filter((v: number, i: int, arr: Int32Array): boolean => true);
          expect(res.byteOffset).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART04_TEST_4800
         * @tc.name int32ArrayFilterPart04Test048
         * @tc.desc Verify subarray source: callback $_set writes are visible to parent array
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFilterPart04Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let parent: Int32Array = Int32Array.of(1, 2, 3, 4, 5, 6);
          let sub: Int32Array = parent.subarray(1, 5);
          sub.filter((v: number, i: int, a: Int32Array): boolean => {
          if (i === 0) {
          a.$_set(2, 888);
          }
          return true;
        });
          expect(parent.$_get(3)).assertEqual(888);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART04_TEST_4900
         * @tc.name int32ArrayFilterPart04Test049
         * @tc.desc Verify result byteLength equals 4 * hitCount (3 hits -> 12 bytes)
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFilterPart04Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let src: Int32Array = Int32Array.of(1, -2, 3, -4, 5);
          let res: Int32Array = src.filter((v: number, i: int, a: Int32Array): boolean => v > 0);
          expect(res.byteLength).assertEqual(12);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART04_TEST_5000
         * @tc.name int32ArrayFilterPart04Test050
         * @tc.desc Verify filter on offset+length partial-buffer view returns independent sized buffer
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFilterPart04Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let buf: ArrayBuffer = new ArrayBuffer(32);
          let a: Int32Array = new Int32Array(buf, 4, 3);
          a.$_set(0, 7);
          a.$_set(1, -7);
          a.$_set(2, 77);
          let res: Int32Array = a.filter((v: number, i: int, arr: Int32Array): boolean => v > 0);
          expect(res.byteLength).assertEqual(8);
          expect(res.length).assertEqual(2);
          expect(res.buffer.byteLength).assertEqual(8);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART04_TEST_5100
         * @tc.name int32ArrayFilterPart04Test051
         * @tc.desc Verify callback throws Error on first call propagates and source remains unchanged
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFilterPart04Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let src: Int32Array = Int32Array.of(1, 2, 3, 4);
          try {
            src.filter((v: number, i: int, a: Int32Array): boolean => {
            throw new Error('boom');
          });
            expect().assertFail();
          } catch (e) {
            expect(e.name).assertEqual('Error');
            expect(e.message).assertEqual('boom');
          }
          expect(src.$_get(0)).assertEqual(1);
          expect(src.length).assertEqual(4);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART04_TEST_5200
         * @tc.name int32ArrayFilterPart04Test052
         * @tc.desc Verify mid-iteration throw preserves earlier writes and later elements untouched
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFilterPart04Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let src: Int32Array = Int32Array.of(0, 0, 0, 0, 0);
          let callCount: int = 0;
          try {
            src.filter((v: number, i: int, a: Int32Array): boolean => {
            callCount = callCount + 1;
            a.$_set(i, i + 1);
            if (i === 2) {
            throw new Error('mid');
            }
            return true;
          });
            expect().assertFail();
          } catch (e) {
            expect(e.name).assertEqual('Error');
            expect(e.message).assertEqual('mid');
          }
          expect(callCount).assertEqual(3);
          expect(src.$_get(0)).assertEqual(1);
          expect(src.$_get(2)).assertEqual(3);
          expect(src.$_get(3)).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART04_TEST_5300
         * @tc.name int32ArrayFilterPart04Test053
         * @tc.desc Verify RangeError thrown in callback propagates with correct name
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFilterPart04Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let src: Int32Array = Int32Array.of(1);
                    try {
            src.filter((v: number, i: int, a: Int32Array): boolean => {
            throw new RangeError('range');
          });
            expect().assertFail();
          } catch (e) {
            expect(e.name).assertEqual('RangeError');
          }
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART04_TEST_5400
         * @tc.name int32ArrayFilterPart04Test054
         * @tc.desc Verify TypeError thrown in callback propagates with correct name
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFilterPart04Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let src: Int32Array = Int32Array.of(1);
                    try {
            src.filter((v: number, i: int, a: Int32Array): boolean => {
            throw new TypeError('type');
          });
            expect().assertFail();
          } catch (e) {
            expect(e.name).assertEqual('TypeError');
          }
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART04_TEST_5500
         * @tc.name int32ArrayFilterPart04Test055
         * @tc.desc Verify INT_MAX/INT_MIN round trip and result buffer independence
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFilterPart04Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let buf: ArrayBuffer = new ArrayBuffer(8);
          let a: Int32Array = new Int32Array(buf);
          a.$_set(0, 2147483647);
          a.$_set(1, -2147483648);
          let b: Int32Array = new Int32Array(buf);
          let res: Int32Array = a.filter((v: number, i: int, arr: Int32Array): boolean => true);
          expect(res.$_get(0)).assertEqual(2147483647);
          expect(res.$_get(1)).assertEqual(-2147483648);
          expect(res.buffer === buf).assertEqual(false);
          expect(b.$_get(0)).assertEqual(2147483647);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART04_TEST_5600
         * @tc.name int32ArrayFilterPart04Test056
         * @tc.desc Verify Number.NaN-stored element (converted to 0) matches ===0 predicate
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFilterPart04Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let src: Int32Array = new Int32Array(3);
          src.$_set(0, Double.NaN);
          src.$_set(1, 1);
          src.$_set(2, 2);
          let res: Int32Array = src.filter((v: number, i: int, a: Int32Array): boolean => v === 0);
          expect(res.length).assertEqual(1);
          expect(res.$_get(0)).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART04_TEST_5700
         * @tc.name int32ArrayFilterPart04Test057
         * @tc.desc Verify callback records index:value pairs in ascending order
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFilterPart04Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let src: Int32Array = Int32Array.of(10, 20, 30);
          let pairs: string[] = [];
          src.filter((v: number, i: int, a: Int32Array): boolean => {
          pairs.push(i.toString() + ':' + v.toString());
          return true;
        });
          expect(pairs[0]).assertEqual('0:10');
          expect(pairs[1]).assertEqual('1:20');
          expect(pairs[2]).assertEqual('2:30');
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART04_TEST_5800
         * @tc.name int32ArrayFilterPart04Test058
         * @tc.desc Verify two consecutive filter calls with opposite predicates do not interfere
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFilterPart04Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let src: Int32Array = Int32Array.of(1, -2, 3, -4, 5);
          let r1: Int32Array = src.filter((v: number, i: int, a: Int32Array): boolean => v > 0);
          let r2: Int32Array = src.filter((v: number, i: int, a: Int32Array): boolean => v < 0);
          expect(r1.length).assertEqual(3);
          expect(r2.length).assertEqual(2);
          expect(src.$_get(0)).assertEqual(1);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART04_TEST_5900
         * @tc.name int32ArrayFilterPart04Test059
         * @tc.desc Verify array.length reported identically on every iteration
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFilterPart04Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let src: Int32Array = Int32Array.of(1, 2, 3, 4);
          let allSame: boolean = true;
          let firstLen: int = -1;
          src.filter((v: number, i: int, a: Int32Array): boolean => {
          if (i === 0) {
          firstLen = a.length;
          } else {
          if (a.length !== firstLen) {
          allSame = false;
          }
          }
          return true;
        });
          expect(allSame).assertTrue();
          expect(firstLen).assertEqual(4);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART04_TEST_6000
         * @tc.name int32ArrayFilterPart04Test060
         * @tc.desc Verify single-element INT_MIN filter hit returns INT_MIN in new independent buffer
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFilterPart04Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let src: Int32Array = Int32Array.of(-2147483648);
          let res: Int32Array = src.filter((v: number, i: int, a: Int32Array): boolean => v < 0);
          expect(res.length).assertEqual(1);
          expect(res.$_get(0)).assertEqual(-2147483648);
          expect(res.buffer === src.buffer).assertEqual(false);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART04_TEST_6100
         * @tc.name int32ArrayFilterPart04Test061
         * @tc.desc Verify single-element INT_MAX filter miss returns empty; source unchanged
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFilterPart04Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let src: Int32Array = Int32Array.of(2147483647);
          let res: Int32Array = src.filter((v: number, i: int, a: Int32Array): boolean => v < 0);
          expect(res.length).assertEqual(0);
          expect(src.$_get(0)).assertEqual(2147483647);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART04_TEST_6200
         * @tc.name int32ArrayFilterPart04Test062
         * @tc.desc Verify empty (length 0) Int32Array filter invokes callback 0 times
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFilterPart04Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let src: Int32Array = new Int32Array(0);
          let callCount: int = 0;
          let res: Int32Array = src.filter((v: number, i: int, a: Int32Array): boolean => {
          callCount = callCount + 1;
          return true;
        });
          expect(callCount).assertEqual(0);
          expect(res.length).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART04_TEST_6300
         * @tc.name int32ArrayFilterPart04Test063
         * @tc.desc Verify partition: neg.length + nonneg.length equals source length
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFilterPart04Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let src: Int32Array = Int32Array.of(-3, -1, 0, 2, 4);
          let neg: Int32Array = src.filter((v: number, i: int, a: Int32Array): boolean => v < 0);
          let nonneg: Int32Array = src.filter((v: number, i: int, a: Int32Array): boolean => v >= 0);
          expect(neg.length + nonneg.length).assertEqual(src.length);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART04_TEST_6400
         * @tc.name int32ArrayFilterPart04Test064
         * @tc.desc Verify strict-equality predicate matches INT_MIN exactly
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFilterPart04Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let src: Int32Array = Int32Array.of(0, -2147483648, 2147483647, 1);
          let res: Int32Array = src.filter((v: number, i: int, a: Int32Array): boolean => v === -2147483648);
          expect(res.length).assertEqual(1);
          expect(res.$_get(0)).assertEqual(-2147483648);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART04_TEST_6500
         * @tc.name int32ArrayFilterPart04Test065
         * @tc.desc Verify strict-equality predicate matches INT_MAX exactly
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFilterPart04Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let src: Int32Array = Int32Array.of(0, -2147483648, 2147483647, 1);
          let res: Int32Array = src.filter((v: number, i: int, a: Int32Array): boolean => v === 2147483647);
          expect(res.length).assertEqual(1);
          expect(res.$_get(0)).assertEqual(2147483647);
        });
  });
}
