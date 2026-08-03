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
class MyFindIndexErr029 extends Error {
  constructor(message: string) {
    super(message);
    this.name = 'MyCustomError';
  }
}
export default function int32ArrayFindIndexPart04Test(): void {
  describe('Int32ArrayFindIndexPart04Test', (): void => {
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
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FINDINDEX_PART04_0100
         * @tc.name int32ArrayFindIndexPart04Test001
         * @tc.desc Verify findIndex does not change source array length on multi-element array
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart04Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = Int32Array.of(10, 20, 30, 40);
          let before: int = arr.length;
          arr.findIndex((v: number, i: int, a: Int32Array): boolean => v === 30);
          let after: int = arr.length;
          expect(after).assertEqual(before);
          expect(before).assertEqual(4);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FINDINDEX_PART04_0200
         * @tc.name int32ArrayFindIndexPart04Test002
         * @tc.desc Verify findIndex does not mutate element values after call
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart04Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = Int32Array.of(7, 8, 9);
          arr.findIndex((v: number, i: int, a: Int32Array): boolean => v === 8);
          expect(arr.$_get(0)).assertEqual(7);
          expect(arr.$_get(1)).assertEqual(8);
          expect(arr.$_get(2)).assertEqual(9);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FINDINDEX_PART04_0300
         * @tc.name int32ArrayFindIndexPart04Test003
         * @tc.desc Verify findIndex keeps byteLength unchanged after predicate returns false
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart04Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array(4);
          let before: number = arr.byteLength;
          arr.findIndex((v: number, i: int, a: Int32Array): boolean => false);
          expect(arr.byteLength).assertEqual(before);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FINDINDEX_PART04_0400
         * @tc.name int32ArrayFindIndexPart04Test004
         * @tc.desc Verify findIndex does not mutate underlying ArrayBuffer bytes via second probe view
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart04Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let buf: ArrayBuffer = new ArrayBuffer(12);
          let view: Int32Array = new Int32Array(buf);
          view.$_set(0, 111);
          view.$_set(1, 222);
          view.$_set(2, 333);
          let probe: Int32Array = new Int32Array(buf);
          view.findIndex((v: number, i: int, a: Int32Array): boolean => v === 222);
          expect(probe.$_get(0)).assertEqual(111);
          expect(probe.$_get(1)).assertEqual(222);
          expect(probe.$_get(2)).assertEqual(333);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FINDINDEX_PART04_0500
         * @tc.name int32ArrayFindIndexPart04Test005
         * @tc.desc Verify findIndex on empty array keeps length 0 and does not invoke predicate
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart04Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array(0);
          arr.findIndex((v: number, i: int, a: Int32Array): boolean => true);
          expect(arr.length).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FINDINDEX_PART04_0600
         * @tc.name int32ArrayFindIndexPart04Test006
         * @tc.desc Verify findIndex returns 0 when first element matches
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart04Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = Int32Array.of(5);
          let r: int = arr.findIndex((v: number, i: int, a: Int32Array): boolean => true);
          expect(r).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FINDINDEX_PART04_0700
         * @tc.name int32ArrayFindIndexPart04Test007
         * @tc.desc Verify findIndex does not change byteOffset of non-zero offset view
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart04Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let buf: ArrayBuffer = new ArrayBuffer(16);
          let view: Int32Array = new Int32Array(buf, 4, 2);
          let before: number = view.byteOffset;
          view.findIndex((v: number, i: int, a: Int32Array): boolean => false);
          expect(view.byteOffset).assertEqual(before);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FINDINDEX_PART04_0800
         * @tc.name int32ArrayFindIndexPart04Test008
         * @tc.desc Verify callback invocation count equals found index+1 when match found at position 2
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart04Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = Int32Array.of(10, 20, 30, 40, 50);
          let count: int = 0;
          arr.findIndex((v: number, i: int, a: Int32Array): boolean => {
          count = count + 1;
          return v === 30;
        });
          expect(count).assertEqual(3);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FINDINDEX_PART04_0900
         * @tc.name int32ArrayFindIndexPart04Test009
         * @tc.desc Verify callback visits all elements when predicate always returns false
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart04Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = Int32Array.of(1, 2, 3, 4);
          let count: int = 0;
          arr.findIndex((v: number, i: int, a: Int32Array): boolean => {
          count = count + 1;
          return false;
        });
          expect(count).assertEqual(4);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FINDINDEX_PART04_1000
         * @tc.name int32ArrayFindIndexPart04Test010
         * @tc.desc Verify callback visits every index recorded via external seen array
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart04Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = Int32Array.of(11, 22, 33);
          let seen: number[] = [0, 0, 0];
          arr.findIndex((v: number, i: int, a: Int32Array): boolean => {
          seen[i] = 1;
          return false;
        });
          expect(seen[0]).assertEqual(1);
          expect(seen[1]).assertEqual(1);
          expect(seen[2]).assertEqual(1);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FINDINDEX_PART04_1100
         * @tc.name int32ArrayFindIndexPart04Test011
         * @tc.desc Verify callback receives correct values by summing across full iteration
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart04Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = Int32Array.of(1, 2, 3, 4);
          let sum: number = 0;
          arr.findIndex((v: number, i: int, a: Int32Array): boolean => {
          sum = sum + v;
          return false;
        });
          expect(sum).assertEqual(10);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FINDINDEX_PART04_1200
         * @tc.name int32ArrayFindIndexPart04Test012
         * @tc.desc Verify callback index argument starts at 0 and increments sequentially
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart04Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = Int32Array.of(10, 20, 30);
          let indices: int[] = [];
          arr.findIndex((v: number, i: int, a: Int32Array): boolean => {
          indices.push(i);
          return false;
        });
          expect(indices.length).assertEqual(3);
          expect(indices[0]).assertEqual(0);
          expect(indices[1]).assertEqual(1);
          expect(indices[2]).assertEqual(2);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FINDINDEX_PART04_1300
         * @tc.name int32ArrayFindIndexPart04Test013
         * @tc.desc Verify findIndex returns index of first element greater than external threshold
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart04Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = Int32Array.of(5, 10, 15, 20);
          let threshold: number = 12;
          let idx: int = arr.findIndex((v: number, i: int, a: Int32Array): boolean => v > threshold);
          expect(idx).assertEqual(2);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FINDINDEX_PART04_1400
         * @tc.name int32ArrayFindIndexPart04Test014
         * @tc.desc Verify callback can match against external target array and return matching index
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart04Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = Int32Array.of(1, 2, 3, 4, 5);
          let targets: number[] = [6, 7, 4];
          let idx: int = arr.findIndex((v: number, i: int, a: Int32Array): boolean => {
          for (let k: int = 0; k < targets.length; k++) {
          if (v === targets[k]) {
          return true;
          }
          }
          return false;
        });
          expect(idx).assertEqual(3);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FINDINDEX_PART04_1500
         * @tc.name int32ArrayFindIndexPart04Test015
         * @tc.desc Verify short-circuit: callback called exactly foundIndex+1 times when match at index 3
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart04Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = Int32Array.of(0, 0, 0, 1, 0, 0);
          let calls: int = 0;
          let pos: int = arr.findIndex((v: number, i: int, a: Int32Array): boolean => {
          calls = calls + 1;
          return v === 1;
        });
          expect(pos).assertEqual(3);
          expect(calls).assertEqual(4);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FINDINDEX_PART04_1600
         * @tc.name int32ArrayFindIndexPart04Test016
         * @tc.desc Verify shared closure predicate accumulates total calls across two findIndex invocations
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart04Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr1: Int32Array = Int32Array.of(1, 2, 3);
          let arr2: Int32Array = Int32Array.of(4, 5, 6);
          let totalCalls: int = 0;
          let pred: (v: number, i: int, a: Int32Array) => boolean = (v: number, i: int, a: Int32Array): boolean => {
          totalCalls = totalCalls + 1;
          return false;
          };
          arr1.findIndex(pred);
          arr2.findIndex(pred);
          expect(totalCalls).assertEqual(6);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FINDINDEX_PART04_1700
         * @tc.name int32ArrayFindIndexPart04Test017
         * @tc.desc Verify nested findIndex on same array returns correct outer index via inner match
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart04Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = Int32Array.of(0, 10, 20, 30, 40);
          let outerIdx: int = arr.findIndex((v: number, i: int, a: Int32Array): boolean => {
          let inner: int = a.findIndex((vv: number, ii: int, aa: Int32Array): boolean => vv === 30);
          return i === inner;
        });
          expect(outerIdx).assertEqual(3);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FINDINDEX_PART04_1800
         * @tc.name int32ArrayFindIndexPart04Test018
         * @tc.desc Verify cross-array findIndex inside predicate locates first value present in reference array
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart04Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = Int32Array.of(1, 2, 3, 4, 5);
          let ref: Int32Array = Int32Array.of(100, 200, 3);
          let idx: int = arr.findIndex((v: number, i: int, a: Int32Array): boolean => {
          return ref.findIndex((rv: number, ri: int, ra: Int32Array): boolean => rv === (v as number)) !== -1;
        });
          expect(idx).assertEqual(2);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FINDINDEX_PART04_1900
         * @tc.name int32ArrayFindIndexPart04Test019
         * @tc.desc Verify nested findIndex on another array does not corrupt the inner array elements
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart04Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let outer: Int32Array = Int32Array.of(11, 22);
          let inner: Int32Array = Int32Array.of(33, 44, 55);
          outer.findIndex((v: number, i: int, a: Int32Array): boolean => {
          inner.findIndex((vv: number, ii: int, aa: Int32Array): boolean => vv === 44);
          return false;
        });
          expect(inner.$_get(0)).assertEqual(33);
          expect(inner.$_get(1)).assertEqual(44);
          expect(inner.$_get(2)).assertEqual(55);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FINDINDEX_PART04_2000
         * @tc.name int32ArrayFindIndexPart04Test020
         * @tc.desc Verify three-level nested findIndex returns index of value 3
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart04Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let a: Int32Array = Int32Array.of(1, 2, 3);
          let res: int = a.findIndex((v1: number, i1: int, ar1: Int32Array): boolean => {
          return a.findIndex((v2: number, i2: int, ar2: Int32Array): boolean => {
          return a.findIndex((v3: number, i3: int, ar3: Int32Array): boolean => v3 === (3 as number)) === i2;
          }) === i1;
        });
          expect(res).assertEqual(2);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FINDINDEX_PART04_2100
         * @tc.name int32ArrayFindIndexPart04Test021
         * @tc.desc Verify findIndex in another evens array with pos%2==0 returns index 0
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart04Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = Int32Array.of(4, 8, 12, 16);
          let evens: Int32Array = Int32Array.of(2, 4, 6, 8, 10, 12, 14, 16);
          let idx: int = arr.findIndex((v: number, i: int, a: Int32Array): boolean => {
          let pos: int = evens.findIndex((ev: number, ei: int, ea: Int32Array): boolean => ev === (v as number));
          return pos !== -1 && pos % 2 === 0;
        });
          expect(idx).assertEqual(-1);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FINDINDEX_PART04_2200
         * @tc.name int32ArrayFindIndexPart04Test022
         * @tc.desc Verify $_set of later elements to sentinel during iteration makes target 4 unreachable (returns -1)
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart04Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = Int32Array.of(1, 2, 3, 4, 5);
          let idx: int = arr.findIndex((v: number, i: int, a: Int32Array): boolean => {
          if (i + 1 < a.length) {
          a.$_set(i + 1, 999);
          }
          return v === 4;
        });
          expect(idx).assertEqual(-1);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FINDINDEX_PART04_2300
         * @tc.name int32ArrayFindIndexPart04Test023
         * @tc.desc Verify $_set on current index after reading v does not affect already-observed v
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart04Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = Int32Array.of(1, 2, 3);
          let seen: number[] = [];
          arr.findIndex((v: number, i: int, a: Int32Array): boolean => {
          seen.push(v);
          a.$_set(i, 100);
          return false;
        });
          expect(seen[0]).assertEqual(1);
          expect(seen[1]).assertEqual(2);
          expect(seen[2]).assertEqual(3);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FINDINDEX_PART04_2400
         * @tc.name int32ArrayFindIndexPart04Test024
         * @tc.desc Verify $_set on already-visited prior indices does not stop iteration early
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart04Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = Int32Array.of(10, 20, 30, 40);
          let calls: int = 0;
          arr.findIndex((v: number, i: int, a: Int32Array): boolean => {
          calls = calls + 1;
          if (i > 0) {
          a.$_set(i - 1, 0);
          }
          return false;
        });
          expect(calls).assertEqual(4);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FINDINDEX_PART04_2500
         * @tc.name int32ArrayFindIndexPart04Test025
         * @tc.desc Verify fill(0) during first iteration changes subsequent observed values per TC39 snapshot semantics
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart04Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = Int32Array.of(1, 2, 3, 4);
          let seen: number[] = [];
          arr.findIndex((v: number, i: int, a: Int32Array): boolean => {
          seen.push(v);
          if (i === 0) {
          a.fill(0);
          }
          return false;
        });
          expect(seen[0]).assertEqual(1);
          expect(seen[1]).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FINDINDEX_PART04_2600
         * @tc.name int32ArrayFindIndexPart04Test026
         * @tc.desc Verify overwriting target element during earlier iteration causes findIndex to return -1
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart04Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = Int32Array.of(10, 20, 30, 40);
          let idx: int = arr.findIndex((v: number, i: int, a: Int32Array): boolean => {
          if (i === 0) {
          a.$_set(2, 99);
          }
          return v === 30;
        });
          expect(idx).assertEqual(-1);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FINDINDEX_PART04_2700
         * @tc.name int32ArrayFindIndexPart04Test027
         * @tc.desc Verify $_set via subarray in callback mutates the shared buffer visible to parent
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart04Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = Int32Array.of(1, 2, 3, 4);
          arr.findIndex((v: number, i: int, a: Int32Array): boolean => {
          a.subarray(2).$_set(0, 77);
          return false;
        });
          expect(arr.$_get(2)).assertEqual(77);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FINDINDEX_PART04_2800
         * @tc.name int32ArrayFindIndexPart04Test028
         * @tc.desc Verify Error thrown at second iteration propagates and pre-throw side effects (touch count) persist
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart04Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = Int32Array.of(1, 2, 3);
          let touched: int = 0;
          try {
            arr.findIndex((v: number, i: int, a: Int32Array): boolean => {
            touched = touched + 1;
            if (i === 1) {
            throw new Error('boom at index 1');
            }
            return false;
          });
            expect().assertFail();
          } catch (e) {
            expect(e.name).assertEqual('Error');
            expect(touched).assertEqual(2);
          }
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FINDINDEX_PART04_2900
         * @tc.name int32ArrayFindIndexPart04Test029
         * @tc.desc Verify custom Error subclass thrown in predicate propagates with custom name
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart04Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = Int32Array.of(5);
          try {
            arr.findIndex((v: number, i: int, a: Int32Array): boolean => {
            throw new MyFindIndexErr029('custom');
          });
            expect().assertFail();
          } catch (e) {
            expect(e.name).assertEqual('MyCustomError');
          }
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FINDINDEX_PART04_3000
         * @tc.name int32ArrayFindIndexPart04Test030
         * @tc.desc Verify predicate is never invoked on empty array even when it would throw
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart04Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array(0);
          let called: boolean = false;
          let r: int = arr.findIndex((v: number, i: int, a: Int32Array): boolean => {
          called = true;
          throw new Error('should not run');
        });
          expect(r).assertEqual(-1);
          expect(called).assertFalse();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FINDINDEX_PART04_3100
         * @tc.name int32ArrayFindIndexPart04Test031
         * @tc.desc Verify Error thrown on first invocation propagates and external counter is incremented once
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart04Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = Int32Array.of(10, 20, 30);
          let n: int = 0;
          try {
            arr.findIndex((v: number, i: int, a: Int32Array): boolean => {
            n = n + 1;
            throw new Error('first call fail');
          });
            expect().assertFail();
          } catch (e) {
            expect(e.name).assertEqual('Error');
            expect(n).assertEqual(1);
          }
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FINDINDEX_PART04_3200
         * @tc.name int32ArrayFindIndexPart04Test032
         * @tc.desc Verify RangeError thrown in predicate propagates with name RangeError
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart04Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = Int32Array.of(1);
          try {
            arr.findIndex((v: number, i: int, a: Int32Array): boolean => {
            throw new RangeError('out of range');
          });
            expect().assertFail();
          } catch (e) {
            expect(e.name).assertEqual('RangeError');
          }
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FINDINDEX_PART04_3300
         * @tc.name int32ArrayFindIndexPart04Test033
         * @tc.desc Verify TypeError thrown in predicate propagates with name TypeError
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart04Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = Int32Array.of(1, 2);
          try {
            arr.findIndex((v: number, i: int, a: Int32Array): boolean => {
            throw new TypeError('type bad');
          });
            expect().assertFail();
          } catch (e) {
            expect(e.name).assertEqual('TypeError');
          }
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FINDINDEX_PART04_3400
         * @tc.name int32ArrayFindIndexPart04Test034
         * @tc.desc Verify findIndex locates int32 maximum value 2147483647 at index 2
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart04Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = Int32Array.of(-1, 0, 2147483647, 1);
          let idx: int = arr.findIndex((v: number, i: int, a: Int32Array): boolean => v === 2147483647);
          expect(idx).assertEqual(2);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FINDINDEX_PART04_3500
         * @tc.name int32ArrayFindIndexPart04Test035
         * @tc.desc Verify findIndex locates int32 minimum value -2147483648 at index 1
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart04Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = Int32Array.of(0, -2147483648, 100);
          let idx: int = arr.findIndex((v: number, i: int, a: Int32Array): boolean => v === -2147483648);
          expect(idx).assertEqual(1);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FINDINDEX_PART04_3600
         * @tc.name int32ArrayFindIndexPart04Test036
         * @tc.desc Verify findIndex locates zero (0 and -0 both become 0 under ToInt32) at index 1
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart04Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = Int32Array.of(1, 0, 2);
          let idx: int = arr.findIndex((v: number, i: int, a: Int32Array): boolean => v === 0);
          expect(idx).assertEqual(1);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FINDINDEX_PART04_3700
         * @tc.name int32ArrayFindIndexPart04Test037
         * @tc.desc Verify findIndex locates value -1 at expected index
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart04Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = Int32Array.of(10, 20, -1, 30);
          let idx: int = arr.findIndex((v: number, i: int, a: Int32Array): boolean => v === -1);
          expect(idx).assertEqual(2);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FINDINDEX_PART04_3800
         * @tc.name int32ArrayFindIndexPart04Test038
         * @tc.desc Verify ToInt32 overflow: writing 2147483648 wraps to -2147483648 and findIndex finds it at 0
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart04Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array(2);
          arr.$_set(0, 2147483648.0);
          arr.$_set(1, 1);
          let idx: int = arr.findIndex((v: number, i: int, a: Int32Array): boolean => v === -2147483648);
          expect(idx).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FINDINDEX_PART04_3900
         * @tc.name int32ArrayFindIndexPart04Test039
         * @tc.desc Verify fractional 3.999 truncates toward zero to 3 under ToInt32 and findIndex locates it
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart04Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array(2);
          arr.$_set(0, 3.999);
          arr.$_set(1, 4);
          let idx: int = arr.findIndex((v: number, i: int, a: Int32Array): boolean => v === 3);
          expect(idx).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FINDINDEX_PART04_4000
         * @tc.name int32ArrayFindIndexPart04Test040
         * @tc.desc Verify negative fractional -3.5 truncates toward zero to -3 under ToInt32 and findIndex locates it
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart04Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array(2);
          arr.$_set(0, -3.5);
          arr.$_set(1, 10);
          let idx: int = arr.findIndex((v: number, i: int, a: Int32Array): boolean => v === -3);
          expect(idx).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FINDINDEX_PART04_4100
         * @tc.name int32ArrayFindIndexPart04Test041
         * @tc.desc Verify 4294967295 (0xFFFFFFFF) wraps to -1 under ToInt32 and findIndex locates it at 0
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart04Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array(2);
          arr.$_set(0, 4294967295.0);
          arr.$_set(1, 0);
          let idx: int = arr.findIndex((v: number, i: int, a: Int32Array): boolean => v === -1);
          expect(idx).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FINDINDEX_PART04_4200
         * @tc.name int32ArrayFindIndexPart04Test042
         * @tc.desc Verify findIndex on subarray returns index relative to the subarray view
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart04Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = Int32Array.of(10, 20, 30, 40, 50);
          let sub: Int32Array = arr.subarray(2, 5);
          let idx: int = sub.findIndex((v: number, i: int, a: Int32Array): boolean => v === 40);
          expect(idx).assertEqual(1);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FINDINDEX_PART04_4300
         * @tc.name int32ArrayFindIndexPart04Test043
         * @tc.desc Verify $_set via subarray callback mutates shared buffer visible to parent array
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart04Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = Int32Array.of(1, 2, 3, 4);
          let sub: Int32Array = arr.subarray(1, 3);
          sub.findIndex((v: number, i: int, a: Int32Array): boolean => {
          a.$_set(i, 99);
          return false;
        });
          expect(arr.$_get(1)).assertEqual(99);
          expect(arr.$_get(2)).assertEqual(99);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FINDINDEX_PART04_4400
         * @tc.name int32ArrayFindIndexPart04Test044
         * @tc.desc Verify $_set on parent during findIndex is visible through subarray view
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart04Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = Int32Array.of(1, 2, 3, 4);
          let sub: Int32Array = arr.subarray(1, 3);
          arr.findIndex((v: number, i: int, a: Int32Array): boolean => {
          if (i >= 1 && i < 3) {
          a.$_set(i, 77);
          }
          return false;
        });
          expect(sub.$_get(0)).assertEqual(77);
          expect(sub.$_get(1)).assertEqual(77);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FINDINDEX_PART04_4500
         * @tc.name int32ArrayFindIndexPart04Test045
         * @tc.desc Verify findIndex on non-zero byteOffset view returns correct relative index
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart04Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let buf: ArrayBuffer = new ArrayBuffer(16);
          let full: Int32Array = new Int32Array(buf);
          full.$_set(0, 100);
          full.$_set(1, 200);
          full.$_set(2, 300);
          full.$_set(3, 400);
          let offsetView: Int32Array = new Int32Array(buf, 8, 2);
          let idx: int = offsetView.findIndex((v: number, i: int, a: Int32Array): boolean => v === 400);
          expect(idx).assertEqual(1);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FINDINDEX_PART04_4600
         * @tc.name int32ArrayFindIndexPart04Test046
         * @tc.desc Verify two disjoint subarray views over same buffer have independent findIndex results
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart04Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = Int32Array.of(10, 20, 30, 40);
          let s1: Int32Array = arr.subarray(0, 2);
          let s2: Int32Array = arr.subarray(2, 4);
          let i1: int = s1.findIndex((v: number, i: int, a: Int32Array): boolean => v === 20);
          let i2: int = s2.findIndex((v: number, i: int, a: Int32Array): boolean => v === 40);
          expect(i1).assertEqual(1);
          expect(i2).assertEqual(1);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FINDINDEX_PART04_4700
         * @tc.name int32ArrayFindIndexPart04Test047
         * @tc.desc Verify subarray findIndex returns relative index 0 for element at parent index 2
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart04Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = Int32Array.of(0, 0, 5, 0);
          let sub: Int32Array = arr.subarray(2, 4);
          let idx: int = sub.findIndex((v: number, i: int, a: Int32Array): boolean => v === 5);
          expect(idx).assertEqual(0);
          expect(sub.$_get(idx)).assertEqual(5);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FINDINDEX_PART04_4800
         * @tc.name int32ArrayFindIndexPart04Test048
         * @tc.desc Verify findIndex on empty subarray (start===end) returns -1 and length remains 0
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart04Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = Int32Array.of(1, 2, 3);
          let sub: Int32Array = arr.subarray(2, 2);
          let idx: int = sub.findIndex((v: number, i: int, a: Int32Array): boolean => true);
          expect(idx).assertEqual(-1);
          expect(sub.length).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FINDINDEX_PART04_4900
         * @tc.name int32ArrayFindIndexPart04Test049
         * @tc.desc Verify callback array argument refers to the subarray view itself with subarray length
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart04Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = Int32Array.of(1, 2, 3, 4);
          let sub: Int32Array = arr.subarray(1, 3);
          let observedLen: int = 0;
          sub.findIndex((v: number, i: int, a: Int32Array): boolean => {
          observedLen = a.length;
          return false;
        });
          expect(observedLen).assertEqual(2);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FINDINDEX_PART04_5000
         * @tc.name int32ArrayFindIndexPart04Test050
         * @tc.desc Verify fill(7) then findIndex(7) returns index 0
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart04Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array(3);
          arr.fill(7);
          let idx: int = arr.findIndex((v: number, i: int, a: Int32Array): boolean => v === 7);
          expect(idx).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FINDINDEX_PART04_5100
         * @tc.name int32ArrayFindIndexPart04Test051
         * @tc.desc Verify reverse() then findIndex(1) returns index 3 in reversed array
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart04Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = Int32Array.of(1, 2, 3, 4);
          arr.reverse();
          let idx: int = arr.findIndex((v: number, i: int, a: Int32Array): boolean => v === 1);
          expect(idx).assertEqual(3);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FINDINDEX_PART04_5200
         * @tc.name int32ArrayFindIndexPart04Test052
         * @tc.desc Verify sort() then findIndex(10) returns index 0 (minimum at position 0)
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart04Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = Int32Array.of(30, 10, 40, 20);
          arr.sort();
          let idx: int = arr.findIndex((v: number, i: int, a: Int32Array): boolean => v === 10);
          expect(idx).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FINDINDEX_PART04_5300
         * @tc.name int32ArrayFindIndexPart04Test053
         * @tc.desc Verify set(src, 2) then findIndex(8) locates copied element at index 3
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart04Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array(5);
          let src: Int32Array = Int32Array.of(7, 8);
          arr.set(src, 2);
          let idx: int = arr.findIndex((v: number, i: int, a: Int32Array): boolean => v === 8);
          expect(idx).assertEqual(3);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FINDINDEX_PART04_5400
         * @tc.name int32ArrayFindIndexPart04Test054
         * @tc.desc Verify copyWithin(4,0,2) then findIndex with i>=4 constraint locates copied value 2 at index 5
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart04Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = Int32Array.of(1, 2, 3, 4, 0, 0);
          arr.copyWithin(4, 0, 2);
          let idx: int = arr.findIndex((v: number, i: int, a: Int32Array): boolean => v === 2 && i >= 4);
          expect(idx).assertEqual(5);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FINDINDEX_PART04_5500
         * @tc.name int32ArrayFindIndexPart04Test055
         * @tc.desc Verify $_get on findIndex result returns the target value
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart04Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = Int32Array.of(11, 22, 33, 44);
          let target: number = 33;
          let idx: int = arr.findIndex((v: number, i: int, a: Int32Array): boolean => v === target);
          expect(arr.$_get(idx)).assertEqual(target);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FINDINDEX_PART04_5600
         * @tc.name int32ArrayFindIndexPart04Test056
         * @tc.desc Verify findIndex on Int32Array.from with mapfn (simulated map) locates mapped value 20 at index 1
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart04Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let src: Int32Array = Int32Array.of(1, 2, 3);
          let dst: Int32Array = Int32Array.from(src, (v: number): number => v * 10);
          let idx: int = dst.findIndex((v: number, i: int, a: Int32Array): boolean => v === 20);
          expect(idx).assertEqual(1);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FINDINDEX_PART04_5700
         * @tc.name int32ArrayFindIndexPart04Test057
         * @tc.desc Verify findIndex on Int32Array.from with zeros and a 99 sentinel finds 99 at index 3
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart04Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = Int32Array.from([0, 0, 0, 99, 0] as number[], (v: number): number => v);
          let idx: int = arr.findIndex((v: number, i: int, a: Int32Array): boolean => v === 99);
          expect(idx).assertEqual(3);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FINDINDEX_PART04_5800
         * @tc.name int32ArrayFindIndexPart04Test058
         * @tc.desc Verify findIndex on mixed-sign array returns first positive value index 4
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart04Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = Int32Array.of(-5, -3, -1, 0, 2, 4);
          let idx: int = arr.findIndex((v: number, i: int, a: Int32Array): boolean => v > 0);
          expect(idx).assertEqual(4);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FINDINDEX_PART04_5900
         * @tc.name int32ArrayFindIndexPart04Test059
         * @tc.desc Verify two consecutive findIndex calls with same predicate return identical idempotent result
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart04Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = Int32Array.of(5, 15, 25, 35);
          let pred: (v: number, i: int, a: Int32Array) => boolean = (v: number, i: int, a: Int32Array): boolean => v === 25;
          let idx1: int = arr.findIndex(pred);
          let idx2: int = arr.findIndex(pred);
          expect(idx1).assertEqual(idx2);
          expect(idx1).assertEqual(2);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FINDINDEX_PART04_6000
         * @tc.name int32ArrayFindIndexPart04Test060
         * @tc.desc Verify callback third argument array is === to the outer caller instance
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart04Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = Int32Array.of(1, 2, 3);
          let same: boolean = false;
          arr.findIndex((v: number, i: int, a: Int32Array): boolean => {
          same = a === arr;
          return true;
        });
          expect(same).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FINDINDEX_PART04_6100
         * @tc.name int32ArrayFindIndexPart04Test061
         * @tc.desc Verify callback third argument length matches outer array length
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart04Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = Int32Array.of(10, 20, 30);
          let lenMatch: boolean = false;
          arr.findIndex((v: number, i: int, a: Int32Array): boolean => {
          lenMatch = a.length === arr.length;
          return true;
        });
          expect(lenMatch).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FINDINDEX_PART04_6200
         * @tc.name int32ArrayFindIndexPart04Test062
         * @tc.desc Verify value parameter equals array.$_get(index) on every iteration
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart04Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = Int32Array.of(7, 14, 21, 28);
          let allMatch: boolean = true;
          arr.findIndex((v: number, i: int, a: Int32Array): boolean => {
          if (a.$_get(i) !== v) {
          allMatch = false;
          }
          return false;
        });
          expect(allMatch).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FINDINDEX_PART04_6300
         * @tc.name int32ArrayFindIndexPart04Test063
         * @tc.desc Verify callback index increments strictly from 0 to length-1 when predicate always false
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart04Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = Int32Array.of(10, 20, 30, 40, 50);
          let expected: int = 0;
          let sequential: boolean = true;
          arr.findIndex((v: number, i: int, a: Int32Array): boolean => {
          if (i !== expected) {
          sequential = false;
          }
          expected = expected + 1;
          return false;
        });
          expect(sequential).assertTrue();
          expect(expected).assertEqual(5);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FINDINDEX_PART04_6400
         * @tc.name int32ArrayFindIndexPart04Test064
         * @tc.desc Verify findIndex with i%2===0 returns first even index position 0
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart04Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = Int32Array.of(11, 22, 33, 44);
          let idx: int = arr.findIndex((v: number, i: int, a: Int32Array): boolean => i % 2 === 0);
          expect(idx).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FINDINDEX_PART04_6500
         * @tc.name int32ArrayFindIndexPart04Test065
         * @tc.desc Verify findIndex with v===i returns index 1 (value 1 equals its index)
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart04Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = Int32Array.of(10, 1, 2, 30);
          let idx: int = arr.findIndex((v: number, i: int, a: Int32Array): boolean => v === i);
          expect(idx).assertEqual(1);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FINDINDEX_PART04_6600
         * @tc.name int32ArrayFindIndexPart04Test066
         * @tc.desc Verify findIndex with v < i*10 locates first local drop at index 4
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart04Test066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = Int32Array.of(5, 15, 25, 35, 30);
          let idx: int = arr.findIndex((v: number, i: int, a: Int32Array): boolean => v < i * 10);
          expect(idx).assertEqual(4);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FINDINDEX_PART04_6700
         * @tc.name int32ArrayFindIndexPart04Test067
         * @tc.desc Verify findIndex detecting first duplicate value returns index 3
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart04Test067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = Int32Array.of(1, 2, 3, 2, 4);
          let idx: int = arr.findIndex((v: number, i: int, a: Int32Array): boolean => {
          for (let j: int = 0; j < i; j++) {
          if (a.$_get(j) === v) {
          return true;
          }
          }
          return false;
        });
          expect(idx).assertEqual(3);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FINDINDEX_PART04_6800
         * @tc.name int32ArrayFindIndexPart04Test068
         * @tc.desc Verify findIndex on all-same-element array returns index 0 on first hit
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart04Test068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = Int32Array.of(7, 7, 7, 7);
          let idx: int = arr.findIndex((v: number, i: int, a: Int32Array): boolean => v === 7);
          expect(idx).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FINDINDEX_PART04_6900
         * @tc.name int32ArrayFindIndexPart04Test069
         * @tc.desc Verify findIndex returns -1 when all elements fail predicate on uniform array
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart04Test069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = Int32Array.of(7, 7, 7);
          let idx: int = arr.findIndex((v: number, i: int, a: Int32Array): boolean => v === 8);
          expect(idx).assertEqual(-1);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FINDINDEX_PART04_7000
         * @tc.name int32ArrayFindIndexPart04Test070
         * @tc.desc Verify single-element array findIndex returns 0 when value matches
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart04Test070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = Int32Array.of(42);
          let idx: int = arr.findIndex((v: number, i: int, a: Int32Array): boolean => v === 42);
          expect(idx).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FINDINDEX_PART04_7100
         * @tc.name int32ArrayFindIndexPart04Test071
         * @tc.desc Verify single-element array findIndex returns -1 when value does not match
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart04Test071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = Int32Array.of(42);
          let idx: int = arr.findIndex((v: number, i: int, a: Int32Array): boolean => v === 99);
          expect(idx).assertEqual(-1);
        });
  });
}
