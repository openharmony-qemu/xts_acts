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
class Counter {
  count: int = 0;
}
export default function int32ArrayEveryPart04Test(): void {
  describe('Int32ArrayEveryPart04Test', (): void => {
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
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_EVERY_PART04_0100
         * @tc.name int32ArrayEveryPart04Test001
         * @tc.desc Verify every keeps length unchanged after call on positive array
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEveryPart04Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3, 4]);
          let before: int = arr.length;
          let r: boolean = arr.every((e: number, _i: int, _a: Int32Array): boolean => e > 0);
          expect(r).assertTrue();
          expect(arr.length).assertEqual(before);
          expect(before).assertEqual(4);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_EVERY_PART04_0200
         * @tc.name int32ArrayEveryPart04Test002
         * @tc.desc Verify every keeps byteLength and byteOffset when returns true
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEveryPart04Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let buf: ArrayBuffer = new ArrayBuffer(32);
          let arr: Int32Array = new Int32Array(buf, 8, 4);
          let beforeBO: int = arr.byteOffset;
          let beforeBL: int = arr.byteLength;
          let r: boolean = arr.every((e: number, _i: int, _a: Int32Array): boolean => e === 0);
          expect(r).assertTrue();
          expect(arr.byteOffset).assertEqual(beforeBO);
          expect(arr.byteLength).assertEqual(beforeBL);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_EVERY_PART04_0300
         * @tc.name int32ArrayEveryPart04Test003
         * @tc.desc Verify elements not changed after every returns false with read-only predicate
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEveryPart04Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, -2, 3, 4]);
          let snapshot: int[] = [1, -2, 3, 4];
          let r: boolean = arr.every((e: number, _i: int, _a: Int32Array): boolean => e > 0);
          expect(r).assertFalse();
          expect(arr[0]).assertEqual(snapshot[0]);
          expect(arr[1]).assertEqual(snapshot[1]);
          expect(arr[2]).assertEqual(snapshot[2]);
          expect(arr[3]).assertEqual(snapshot[3]);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_EVERY_PART04_0400
         * @tc.name int32ArrayEveryPart04Test004
         * @tc.desc Verify after calling every on empty array the underlying buffer is still usable by other view
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEveryPart04Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let buf: ArrayBuffer = new ArrayBuffer(16);
          let empty: Int32Array = new Int32Array(buf, 0, 0);
          let r: boolean = empty.every((e: number, _i: int, _a: Int32Array): boolean => false);
          expect(r).assertTrue();
          let other: Int32Array = new Int32Array(buf, 0, 4);
          other.$_set(0, 77);
          expect(other[0]).assertEqual(77);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_EVERY_PART04_0500
         * @tc.name int32ArrayEveryPart04Test005
         * @tc.desc Verify every can be called multiple times returning consistent true result
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEveryPart04Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([2, 4, 6, 8]);
          let callCount1: int = 0;
          let r1: boolean = arr.every((e: number, _i: int, _a: Int32Array): boolean => { callCount1++; return e % 2 === 0; });
          let callCount2: int = 0;
          let r2: boolean = arr.every((e: number, _i: int, _a: Int32Array): boolean => { callCount2++; return e % 2 === 0; });
          expect(r1).assertTrue();
          expect(r2).assertTrue();
          expect(callCount1).assertEqual(4);
          expect(callCount2).assertEqual(4);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_EVERY_PART04_0600
         * @tc.name int32ArrayEveryPart04Test006
         * @tc.desc Verify after false result second every with different predicate can return true without state leak
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEveryPart04Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([-1, 2, 3]);
          let callCount1: int = 0;
          let first: boolean = arr.every((e: number, _i: int, _a: Int32Array): boolean => { callCount1++; return e > 0; });
          let callCount2: int = 0;
          let second: boolean = arr.every((e: number, _i: int, _a: Int32Array): boolean => { callCount2++; return e > -10; });
          expect(first).assertFalse();
          expect(second).assertTrue();
          expect(callCount1).assertEqual(1);
          expect(callCount2).assertEqual(3);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_EVERY_PART04_0700
         * @tc.name int32ArrayEveryPart04Test007
         * @tc.desc Verify buffer content unchanged when predicate throws and is caught
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEveryPart04Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let buf: ArrayBuffer = new ArrayBuffer(12);
          let arr: Int32Array = new Int32Array(buf, 0, 3);
          arr.$_set(0, 11);
          arr.$_set(1, 22);
          arr.$_set(2, 33);
          try {
            arr.every((e: number, _i: int, _a: Int32Array): boolean => { throw new Error('x'); });
            expect().assertFail();
          } catch (e) {
            expect(e.name).assertEqual('Error');
            expect(e.message).assertEqual('x');
          }
          expect(arr[0]).assertEqual(11);
          expect(arr[1]).assertEqual(22);
          expect(arr[2]).assertEqual(33);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_EVERY_PART04_0800
         * @tc.name int32ArrayEveryPart04Test008
         * @tc.desc Verify every on large (64-element) array returning true keeps first and last elements readable
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEveryPart04Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array(64);
          for (let k: int = 0; k < 64; k++) {
          arr.$_set(k, k);
          }
          let r: boolean = arr.every((e: number, _i: int, _a: Int32Array): boolean => e >= 0);
          expect(r).assertTrue();
          expect(arr[0]).assertEqual(0);
          expect(arr[63]).assertEqual(63);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_EVERY_PART04_0900
         * @tc.name int32ArrayEveryPart04Test009
         * @tc.desc Verify predicate reading outer const constant returns true
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEveryPart04Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([5, 6, 7]);
          const LIMIT: int = 10;
          let callCount: int = 0;
          let r: boolean = arr.every((e: number, _i: int, _a: Int32Array): boolean => { callCount++; return e < LIMIT; });
          expect(r).assertTrue();
          expect(callCount).assertEqual(3);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_EVERY_PART04_1000
         * @tc.name int32ArrayEveryPart04Test010
         * @tc.desc Verify predicate call count equals length when all true
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEveryPart04Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([10, 20, 30, 40]);
          let cnt: int = 0;
          let r: boolean = arr.every((e: number, _i: int, _a: Int32Array): boolean => { cnt++; return true; });
          expect(r).assertTrue();
          expect(cnt).assertEqual(4);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_EVERY_PART04_1100
         * @tc.name int32ArrayEveryPart04Test011
         * @tc.desc Verify last visited index is the short-circuit position when predicate returns false
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEveryPart04Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, -3, 4]);
          let lastSeen: int = -1;
          let r: boolean = arr.every((e: number, i: int, _a: Int32Array): boolean => { lastSeen = i; return e > 0; });
          expect(r).assertFalse();
          expect(lastSeen).assertEqual(2);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_EVERY_PART04_1200
         * @tc.name int32ArrayEveryPart04Test012
         * @tc.desc Verify predicate collecting visited elements into external array sees all elements
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEveryPart04Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([7, 8, 9]);
          let seen: Array<number> = new Array<number>();
          let r: boolean = arr.every((e: number, _i: int, _a: Int32Array): boolean => { seen.push(e); return true; });
          expect(r).assertTrue();
          expect(seen.length).assertEqual(3);
          expect(seen[0]).assertEqual(7);
          expect(seen[2]).assertEqual(9);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_EVERY_PART04_1300
         * @tc.name int32ArrayEveryPart04Test013
         * @tc.desc Verify predicate mutating outer class instance property reflects call count up to short circuit
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEveryPart04Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let c: Counter = new Counter();
          let arr: Int32Array = new Int32Array([1, -2, 3]);
          arr.every((e: number, _i: int, _a: Int32Array): boolean => { c.count++; return e > 0; });
          expect(c.count).assertEqual(2);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_EVERY_PART04_1400
         * @tc.name int32ArrayEveryPart04Test014
         * @tc.desc Verify outer boolean flag set in first callback is visible to later callbacks
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEveryPart04Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3, 4]);
          let flag: boolean = false;
          let sawFlagTrue: boolean = false;
          let callCount: int = 0;
          let r: boolean = arr.every((e: number, i: int, _a: Int32Array): boolean => {
          callCount++;
          if (i === 0) { flag = true; }
          if (i > 0 && flag) { sawFlagTrue = true; }
          return true;
        });
          expect(r).assertTrue();
          expect(sawFlagTrue).assertTrue();
          expect(callCount).assertEqual(4);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_EVERY_PART04_1500
         * @tc.name int32ArrayEveryPart04Test015
         * @tc.desc Verify summing elements via external accumulator when all true equals array sum
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEveryPart04Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3, 4]);
          let sum: number = 0;
          let r: boolean = arr.every((e: number, _i: int, _a: Int32Array): boolean => { sum += e; return true; });
          expect(r).assertTrue();
          expect(sum).assertEqual(10);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_EVERY_PART04_1600
         * @tc.name int32ArrayEveryPart04Test016
         * @tc.desc Verify short-circuit at first element sums only the failing element
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEveryPart04Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([-10, 20, 30]);
          let sum: number = 0;
          let r: boolean = arr.every((e: number, _i: int, _a: Int32Array): boolean => { sum += e; return e > 0; });
          expect(r).assertFalse();
          expect(sum).assertEqual(-10);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_EVERY_PART04_1700
         * @tc.name int32ArrayEveryPart04Test017
         * @tc.desc Verify a.$_get(i) in predicate matches the passed element parameter
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEveryPart04Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([11, 22, 33]);
          let allMatch: boolean = true;
          let r: boolean = arr.every((e: number, i: int, a: Int32Array): boolean => {
          if (a.$_get(i) !== e) { allMatch = false; }
          return true;
        });
          expect(r).assertTrue();
          expect(allMatch).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_EVERY_PART04_1800
         * @tc.name int32ArrayEveryPart04Test018
         * @tc.desc Verify a[i] subscript access in predicate matches the passed element parameter
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEveryPart04Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([5, 6, 7]);
          let ok: boolean = true;
          let r: boolean = arr.every((e: number, i: int, a: Int32Array): boolean => {
          if (a[i] !== e) { ok = false; }
          return true;
        });
          expect(r).assertTrue();
          expect(ok).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_EVERY_PART04_1900
         * @tc.name int32ArrayEveryPart04Test019
         * @tc.desc Verify look-ahead read via a.$_get(i+1) at i=0 sees the next element
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEveryPart04Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3]);
          let nextAtFirst: number = -1;
          let callCount: int = 0;
          let r: boolean = arr.every((e: number, i: int, a: Int32Array): boolean => {
          callCount++;
          if (i === 0) { nextAtFirst = a.$_get(i + 1); }
          return e > 0;
        });
          expect(r).assertTrue();
          expect(nextAtFirst).assertEqual(2);
          expect(callCount).assertEqual(3);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_EVERY_PART04_2000
         * @tc.name int32ArrayEveryPart04Test020
         * @tc.desc Verify look-behind via a.$_get(i-1) for strictly increasing predicate returns true
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEveryPart04Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3, 4]);
          let callCount: int = 0;
          let r: boolean = arr.every((e: number, i: int, a: Int32Array): boolean => {
          callCount++;
          if (i === 0) { return true; }
          return e > a.$_get(i - 1);
        });
          expect(r).assertTrue();
          expect(callCount).assertEqual(4);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_EVERY_PART04_2100
         * @tc.name int32ArrayEveryPart04Test021
         * @tc.desc Verify $_set at current i is observed as changed previous on next callback
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEveryPart04Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3, 4]);
          let sawChangedPrev: boolean = false;
          let callCount: int = 0;
          let r: boolean = arr.every((e: number, i: int, a: Int32Array): boolean => {
          callCount++;
          if (i > 0 && a.$_get(i - 1) === 100) { sawChangedPrev = true; }
          a.$_set(i, 100);
          return true;
        });
          expect(r).assertTrue();
          expect(sawChangedPrev).assertTrue();
          expect(callCount).assertEqual(4);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_EVERY_PART04_2200
         * @tc.name int32ArrayEveryPart04Test022
         * @tc.desc Verify negating elements via $_set while returning true visits all elements
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEveryPart04Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3]);
          let calls: int = 0;
          let r: boolean = arr.every((e: number, i: int, a: Int32Array): boolean => {
          calls++;
          a.$_set(i, -e);
          return true;
        });
          expect(r).assertTrue();
          expect(calls).assertEqual(3);
          expect(arr[0]).assertEqual(-1);
          expect(arr[2]).assertEqual(-3);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_EVERY_PART04_2300
         * @tc.name int32ArrayEveryPart04Test023
         * @tc.desc Verify modifying upcoming elements at i=0 makes later predicates pass and return true
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEveryPart04Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, -2, -3]);
          let callCount: int = 0;
          let r: boolean = arr.every((e: number, i: int, a: Int32Array): boolean => {
          callCount++;
          if (i === 0) {
          a.$_set(1, 20);
          a.$_set(2, 30);
          }
          return e > 0 || a.$_get(i) > 0;
        });
          expect(r).assertTrue();
          expect(callCount).assertEqual(3);
          expect(arr[1]).assertEqual(20);
          expect(arr[2]).assertEqual(30);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_EVERY_PART04_2400
         * @tc.name int32ArrayEveryPart04Test024
         * @tc.desc Verify writing INT_MAX via $_set reads back as INT_MAX
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEveryPart04Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([0, 0, 0]);
          let readBackMax: boolean = false;
          let r: boolean = arr.every((e: number, i: int, a: Int32Array): boolean => {
          a.$_set(i, 2147483647);
          if (a.$_get(i) === 2147483647) { readBackMax = true; }
          return true;
        });
          expect(r).assertTrue();
          expect(readBackMax).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_EVERY_PART04_2500
         * @tc.name int32ArrayEveryPart04Test025
         * @tc.desc Verify writing INT_MIN via $_set reads back as INT_MIN
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEveryPart04Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([0, 0]);
          let readBackMin: boolean = false;
          let r: boolean = arr.every((e: number, i: int, a: Int32Array): boolean => {
          a.$_set(i, -2147483648);
          if (a.$_get(i) === -2147483648) { readBackMin = true; }
          return true;
        });
          expect(r).assertTrue();
          expect(readBackMin).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_EVERY_PART04_2600
         * @tc.name int32ArrayEveryPart04Test026
         * @tc.desc Verify every propagates and catches RangeError from positive out-of-range $_set
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEveryPart04Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3]);
          let calls: int = 0;
          let r: boolean = arr.every((e: number, i: int, a: Int32Array): boolean => {
          calls++;
          try {
            a.$_set(i + 100, 999);
            expect().assertFail();
          } catch (e) {
            expect(e.name).assertEqual('RangeError');
          }
          return true;
        });
          expect(r).assertTrue();
          expect(calls).assertEqual(3);
          expect(arr.length).assertEqual(3);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_EVERY_PART04_2700
         * @tc.name int32ArrayEveryPart04Test027
         * @tc.desc Verify $_set with negative index throws RangeError
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEveryPart04Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2]);
          try {
            arr.every((e: number, i: int, a: Int32Array): boolean => {
            a.$_set(-1, 77);
            return true;
          });
            expect().assertFail();
          } catch (e) {
            expect(e.name).assertEqual('RangeError');
          }
          expect(arr[0]).assertEqual(1);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_EVERY_PART04_2800
         * @tc.name int32ArrayEveryPart04Test028
         * @tc.desc Verify writes via shared-buffer subview inside predicate are visible through array reference
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEveryPart04Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let buf: ArrayBuffer = new ArrayBuffer(16);
          let arr: Int32Array = new Int32Array(buf, 0, 4);
          arr.$_set(0, 1);
          arr.$_set(1, 2);
          arr.$_set(2, 3);
          arr.$_set(3, 4);
          let sawFive: boolean = false;
          let r: boolean = arr.every((e: number, i: int, a: Int32Array): boolean => {
          if (i === 0) {
          let sub: Int32Array = new Int32Array(buf, 4, 1);
          sub.$_set(0, 5);
          }
          if (i === 1 && a.$_get(1) === 5) { sawFive = true; }
          return true;
        });
          expect(r).assertTrue();
          expect(sawFive).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_EVERY_PART04_2900
         * @tc.name int32ArrayEveryPart04Test029
         * @tc.desc Verify creating independent new Int32Array inside predicate does not affect traversal
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEveryPart04Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([10, 20, 30]);
          let calls: int = 0;
          let r: boolean = arr.every((e: number, _i: int, _a: Int32Array): boolean => {
          calls++;
          let tmp: Int32Array = new Int32Array([999]);
          return e > 0 && tmp[0] === 999;
        });
          expect(r).assertTrue();
          expect(calls).assertEqual(3);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_EVERY_PART04_3000
         * @tc.name int32ArrayEveryPart04Test030
         * @tc.desc Verify writing 2^31 via $_set wraps to INT_MIN after ToInt32
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEveryPart04Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array(1);
          let overflowVal: number = 2147483648;
          arr.every((e: number, i: int, a: Int32Array): boolean => {
          a.$_set(i, overflowVal);
          return true;
        });
          expect(arr[0]).assertEqual(-2147483648);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_EVERY_PART04_3100
         * @tc.name int32ArrayEveryPart04Test031
         * @tc.desc Verify writing -2^31-1 via $_set wraps to INT_MAX after ToInt32
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEveryPart04Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array(1);
          let underflowVal: number = -2147483649;
          arr.every((e: number, i: int, a: Int32Array): boolean => {
          a.$_set(i, underflowVal);
          return true;
        });
          expect(arr[0]).assertEqual(2147483647);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_EVERY_PART04_3200
         * @tc.name int32ArrayEveryPart04Test032
         * @tc.desc Verify writing 2^32 via $_set wraps to 0 after ToInt32
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEveryPart04Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array(1);
          arr.$_set(0, 7);
          let wrapVal: number = 4294967296;
          arr.every((e: number, i: int, a: Int32Array): boolean => {
          a.$_set(i, wrapVal);
          return true;
        });
          expect(arr[0]).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_EVERY_PART04_3300
         * @tc.name int32ArrayEveryPart04Test033
         * @tc.desc Verify writing -0 via $_set truncates toward zero to 0
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEveryPart04Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array(1);
          arr.$_set(0, 5);
          arr.every((e: number, i: int, a: Int32Array): boolean => {
          a.$_set(i, -0);
          return true;
        });
          expect(arr[0]).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_EVERY_PART04_3400
         * @tc.name int32ArrayEveryPart04Test034
         * @tc.desc Verify writing 2147483647.9 via $_set truncates toward zero to INT_MAX
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEveryPart04Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array(1);
          arr.$_set(0, 0);
          arr.every((e: number, i: int, a: Int32Array): boolean => {
          a.$_set(i, 2147483647.9);
          return true;
        });
          expect(arr[0]).assertEqual(2147483647);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_EVERY_PART04_3500
         * @tc.name int32ArrayEveryPart04Test035
         * @tc.desc Verify writing 2^32+1 via $_set wraps to 1 after ToInt32
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEveryPart04Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array(1);
          let wrapVal: number = 4294967297;
          arr.every((e: number, i: int, a: Int32Array): boolean => {
          a.$_set(i, wrapVal);
          return true;
        });
          expect(arr[0]).assertEqual(1);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_EVERY_PART04_3600
         * @tc.name int32ArrayEveryPart04Test036
         * @tc.desc Verify writing 0 via $_set reads back as 0 (-0 equals 0 after ToInt32)
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEveryPart04Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array(1);
          arr.$_set(0, 5);
          let readBack: number = 1;
          arr.every((e: number, i: int, a: Int32Array): boolean => {
          a.$_set(i, 0);
          readBack = a.$_get(i);
          return true;
        });
          expect(readBack).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_EVERY_PART04_3700
         * @tc.name int32ArrayEveryPart04Test037
         * @tc.desc Verify parent writes during every are observed through subarray child view
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEveryPart04Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let parent: Int32Array = new Int32Array([1, 2, 3, 4]);
          let child: Int32Array = parent.subarray(1, 3);
          let sawChildChange: boolean = false;
          let r: boolean = parent.every((e: number, i: int, a: Int32Array): boolean => {
          if (i === 1) { a.$_set(i, 99); }
          if (i === 2 && child[0] === 99) { sawChildChange = true; }
          return true;
        });
          expect(r).assertTrue();
          expect(sawChildChange).assertTrue();
          expect(child[0]).assertEqual(99);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_EVERY_PART04_3800
         * @tc.name int32ArrayEveryPart04Test038
         * @tc.desc Verify child subarray writes during every are observed on parent view
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEveryPart04Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let parent: Int32Array = new Int32Array([1, 2, 3, 4]);
          let child: Int32Array = parent.subarray(1, 3);
          child.every((e: number, i: int, a: Int32Array): boolean => {
          a.$_set(i, 77);
          return true;
        });
          expect(parent[1]).assertEqual(77);
          expect(parent[2]).assertEqual(77);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_EVERY_PART04_3900
         * @tc.name int32ArrayEveryPart04Test039
         * @tc.desc Verify writes to sibling Int32Array view on same ArrayBuffer are visible to a view
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEveryPart04Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let buf: ArrayBuffer = new ArrayBuffer(12);
          let a: Int32Array = new Int32Array(buf, 0, 3);
          let b: Int32Array = new Int32Array(buf, 0, 3);
          a.$_set(0, 1);
          a.$_set(1, 2);
          a.$_set(2, 3);
          let r: boolean = a.every((e: number, _i: int, _ar: Int32Array): boolean => { return true; });
          expect(r).assertTrue();
          b.$_set(1, 55);
          expect(a[1]).assertEqual(55);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_EVERY_PART04_4000
         * @tc.name int32ArrayEveryPart04Test040
         * @tc.desc Verify writes via offset views do not leak into slots of other offset views
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEveryPart04Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let buf: ArrayBuffer = new ArrayBuffer(16);
          let lowView: Int32Array = new Int32Array(buf, 0, 2);
          let highView: Int32Array = new Int32Array(buf, 8, 2);
          lowView.$_set(0, 0);
          lowView.$_set(1, 0);
          highView.$_set(0, 0);
          highView.$_set(1, 0);
          lowView.every((e: number, i: int, a: Int32Array): boolean => {
          a.$_set(i, i + 10);
          return true;
        });
          highView.every((e: number, i: int, a: Int32Array): boolean => {
          a.$_set(i, i + 20);
          return true;
        });
          expect(lowView[0]).assertEqual(10);
          expect(lowView[1]).assertEqual(11);
          expect(highView[0]).assertEqual(20);
          expect(highView[1]).assertEqual(21);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_EVERY_PART04_4100
         * @tc.name int32ArrayEveryPart04Test041
         * @tc.desc Verify subarray created after parent every returning true has correct length and elements
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEveryPart04Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let parent: Int32Array = new Int32Array([1, 2, 3, 4, 5]);
          parent.every((e: number, _i: int, _a: Int32Array): boolean => e > 0);
          let sub: Int32Array = parent.subarray(1, 4);
          expect(sub.length).assertEqual(3);
          expect(sub[0]).assertEqual(2);
          expect(sub[2]).assertEqual(4);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_EVERY_PART04_4200
         * @tc.name int32ArrayEveryPart04Test042
         * @tc.desc Verify only positions visited by short-circuited child every are modified on parent
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEveryPart04Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let parent: Int32Array = new Int32Array([0, 0, 0, 0, 0]);
          let child: Int32Array = parent.subarray(1, 4);
          child.every((e: number, i: int, a: Int32Array): boolean => {
          a.$_set(i, 1);
          return i < 1;
        });
          expect(parent[0]).assertEqual(0);
          expect(parent[1]).assertEqual(1);
          expect(parent[2]).assertEqual(1);
          expect(parent[3]).assertEqual(0);
          expect(parent[4]).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_EVERY_PART04_4300
         * @tc.name int32ArrayEveryPart04Test043
         * @tc.desc Verify writes on one Int32Array view do not affect slots of interleaved other view on large buffer
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEveryPart04Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let buf: ArrayBuffer = new ArrayBuffer(32);
          let headView: Int32Array = new Int32Array(buf, 0, 2);
          let tailView: Int32Array = new Int32Array(buf, 16, 2);
          headView.$_set(0, 11);
          headView.$_set(1, 22);
          tailView.$_set(0, 88);
          tailView.$_set(1, 99);
          headView.every((e: number, i: int, a: Int32Array): boolean => {
          a.$_set(i, e + 1);
          return true;
        });
          expect(tailView[0]).assertEqual(88);
          expect(tailView[1]).assertEqual(99);
          expect(headView[0]).assertEqual(12);
          expect(headView[1]).assertEqual(23);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_EVERY_PART04_4400
         * @tc.name int32ArrayEveryPart04Test044
         * @tc.desc Verify writes via view at byteOffset=4 do not affect first 4-byte slot
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEveryPart04Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let buf: ArrayBuffer = new ArrayBuffer(16);
          let first: Int32Array = new Int32Array(buf, 0, 1);
          let rest: Int32Array = new Int32Array(buf, 4, 3);
          first.$_set(0, 100);
          rest.$_set(0, 1);
          rest.$_set(1, 2);
          rest.$_set(2, 3);
          rest.every((e: number, i: int, a: Int32Array): boolean => {
          a.$_set(i, e * 2);
          return true;
        });
          expect(first[0]).assertEqual(100);
          expect(rest[0]).assertEqual(2);
          expect(rest[2]).assertEqual(6);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_EVERY_PART04_4500
         * @tc.name int32ArrayEveryPart04Test045
         * @tc.desc Verify single-element tail view at buffer end traverses normally with correct call count
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEveryPart04Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let buf: ArrayBuffer = new ArrayBuffer(16);
          let tail: Int32Array = new Int32Array(buf, 12, 1);
          tail.$_set(0, 42);
          let calls: int = 0;
          let r: boolean = tail.every((e: number, _i: int, _a: Int32Array): boolean => { calls++; return e === 42; });
          expect(r).assertTrue();
          expect(calls).assertEqual(1);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_EVERY_PART04_4600
         * @tc.name int32ArrayEveryPart04Test046
         * @tc.desc Verify nested every on independent array returns outer true with correct call counts
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEveryPart04Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let outer: Int32Array = new Int32Array([1, 2, 3]);
          let inner: Int32Array = new Int32Array([10, 20]);
          let outerCalls: int = 0;
          let innerCalls: int = 0;
          let r: boolean = outer.every((e: number, _i: int, _a: Int32Array): boolean => {
          outerCalls++;
          return inner.every((x: number, _j: int, _b: Int32Array): boolean => {
          innerCalls++;
          return x > 0;
        });
        });
          expect(r).assertTrue();
          expect(outerCalls).assertEqual(3);
          expect(innerCalls).assertEqual(6);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_EVERY_PART04_4700
         * @tc.name int32ArrayEveryPart04Test047
         * @tc.desc Verify recursive every on same array re-enters safely with independent inner traversal
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEveryPart04Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3]);
          let depth: int = 0;
          let maxDepth: int = 0;
          let r: boolean = arr.every((e: number, _i: int, a: Int32Array): boolean => {
          depth++;
          if (depth > maxDepth) { maxDepth = depth; }
          if (depth < 2) {
          a.every((x: number, _j: int, _b: Int32Array): boolean => { return x > 0; });
          }
          depth--;
          return e > 0;
        });
          expect(r).assertTrue();
          expect(maxDepth).assertEqual(1);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_EVERY_PART04_4800
         * @tc.name int32ArrayEveryPart04Test048
         * @tc.desc Verify inner every returning false short-circuits outer after first outer call
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEveryPart04Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let outer: Int32Array = new Int32Array([1, 2, 3, 4]);
          let inner: Int32Array = new Int32Array([10, -20]);
          let outerCalls: int = 0;
          let r: boolean = outer.every((_e: number, _i: int, _a: Int32Array): boolean => {
          outerCalls++;
          return inner.every((x: number, _j: int, _b: Int32Array): boolean => x > 0);
        });
          expect(r).assertFalse();
          expect(outerCalls).assertEqual(1);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_EVERY_PART04_4900
         * @tc.name int32ArrayEveryPart04Test049
         * @tc.desc Verify three-level nested every returning true produces correct total invocation count
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEveryPart04Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let outer: Int32Array = new Int32Array([1]);
          let middle: Int32Array = new Int32Array([2, 3]);
          let inner: Int32Array = new Int32Array([4]);
          let total: int = 0;
          let r: boolean = outer.every((_e: number, _i: int, _a: Int32Array): boolean => {
          total++;
          return middle.every((_m: number, _j: int, _b: Int32Array): boolean => {
          total++;
          return inner.every((_n: number, _k: int, _c: Int32Array): boolean => {
          total++;
          return true;
        });
        });
        });
          expect(r).assertTrue();
          expect(total).assertEqual(5);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_EVERY_PART04_5000
         * @tc.name int32ArrayEveryPart04Test050
         * @tc.desc Verify error thrown in nested every propagates to outer catch
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEveryPart04Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let outer: Int32Array = new Int32Array([1, 2]);
          let inner: Int32Array = new Int32Array([3]);
          try {
            outer.every((_e: number, _i: int, _a: Int32Array): boolean => {
            return inner.every((_x: number, _j: int, _b: Int32Array): boolean => {
            throw new Error('nested boom');
          });
          });
            expect().assertFail();
          } catch (e) {
            expect(e.name).assertEqual('Error');
            expect(e.message).assertEqual('nested boom');
          }
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_EVERY_PART04_5100
         * @tc.name int32ArrayEveryPart04Test051
         * @tc.desc Verify writes to independent inner array inside nested every do not affect outer elements
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEveryPart04Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let outer: Int32Array = new Int32Array([10, 20]);
          let inner: Int32Array = new Int32Array([0]);
          let outerBefore: number = outer[0];
          outer.every((_e: number, _i: int, _a: Int32Array): boolean => {
          inner.every((x: number, j: int, b: Int32Array): boolean => {
          b.$_set(j, x + 100);
          return true;
        });
          return true;
        });
          expect(outer[0]).assertEqual(outerBefore);
          expect(inner[0]).assertEqual(200);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_EVERY_PART04_5200
         * @tc.name int32ArrayEveryPart04Test052
         * @tc.desc Verify every over subarray view sums the correct element range
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEveryPart04Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([10, 20, 30, 40, 50]);
          let sub: Int32Array = arr.subarray(1, 4);
          let sum: number = 0;
          let r: boolean = sub.every((e: number, _i: int, _a: Int32Array): boolean => { sum += e; return e > 0; });
          expect(r).assertTrue();
          expect(sum).assertEqual(90);
          expect(sub.length).assertEqual(3);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_EVERY_PART04_5300
         * @tc.name int32ArrayEveryPart04Test053
         * @tc.desc Verify every after Int32Array.from returns true for all-positive source
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEveryPart04Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let src: int[] = [1, 2, 3, 4, 5];
          let arr: Int32Array = Int32Array.from(src);
          let callCount: int = 0;
          let r: boolean = arr.every((e: number, _i: int, _a: Int32Array): boolean => { callCount++; return e > 0; });
          expect(r).assertTrue();
          expect(arr.length).assertEqual(5);
          expect(callCount).assertEqual(5);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_EVERY_PART04_5400
         * @tc.name int32ArrayEveryPart04Test054
         * @tc.desc Verify every after Int32Array.of with boundary values returns true for int32 range check
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEveryPart04Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = Int32Array.of(-2147483648, 0, 2147483647);
          let callCount: int = 0;
          let r: boolean = arr.every((e: number, _i: int, _a: Int32Array): boolean => { callCount++; return e >= -2147483648 && e <= 2147483647; });
          expect(r).assertTrue();
          expect(callCount).assertEqual(3);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_EVERY_PART04_5500
         * @tc.name int32ArrayEveryPart04Test055
         * @tc.desc Verify writes on slice copy during every do not affect original array
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEveryPart04Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let orig: Int32Array = new Int32Array([1, 2, 3]);
          let cp: Int32Array = orig.slice(0);
          cp.every((e: number, i: int, a: Int32Array): boolean => {
          a.$_set(i, e + 100);
          return true;
        });
          expect(orig[0]).assertEqual(1);
          expect(cp[0]).assertEqual(101);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_EVERY_PART04_5600
         * @tc.name int32ArrayEveryPart04Test056
         * @tc.desc Verify every traverses elements in index order after reverse (3,2,1)
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEveryPart04Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3]);
          arr.reverse();
          let seen: Array<number> = new Array<number>();
          let r: boolean = arr.every((e: number, _i: int, _a: Int32Array): boolean => { seen.push(e); return true; });
          expect(r).assertTrue();
          expect(seen[0]).assertEqual(3);
          expect(seen[1]).assertEqual(2);
          expect(seen[2]).assertEqual(1);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_EVERY_PART04_5700
         * @tc.name int32ArrayEveryPart04Test057
         * @tc.desc Verify every after fill(7) returns true for equality with fill value
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEveryPart04Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array(4);
          arr.fill(7);
          let callCount: int = 0;
          let r: boolean = arr.every((e: number, _i: int, _a: Int32Array): boolean => { callCount++; return e === 7; });
          expect(r).assertTrue();
          expect(callCount).assertEqual(4);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_EVERY_PART04_5800
         * @tc.name int32ArrayEveryPart04Test058
         * @tc.desc Verify every after sort returns true for non-decreasing check
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEveryPart04Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([3, 1, 4, 1, 5]);
          arr.sort();
          let callCount: int = 0;
          let r: boolean = arr.every((e: number, i: int, a: Int32Array): boolean => {
          callCount++;
          if (i === 0) { return true; }
          return e >= a.$_get(i - 1);
        });
          expect(r).assertTrue();
          expect(callCount).assertEqual(5);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_EVERY_PART04_5900
         * @tc.name int32ArrayEveryPart04Test059
         * @tc.desc Verify every on filter result of positives returns true for positive check
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEveryPart04Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, -2, 3, -4, 5]);
          let positives: Int32Array = arr.filter((e: number, _i: int, _a: Int32Array): boolean => e > 0);
          let callCount: int = 0;
          let r: boolean = positives.every((e: number, _i: int, _b: Int32Array): boolean => { callCount++; return e > 0; });
          expect(r).assertTrue();
          expect(positives.length).assertEqual(3);
          expect(callCount).assertEqual(3);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_EVERY_PART04_6000
         * @tc.name int32ArrayEveryPart04Test060
         * @tc.desc Verify every on map(doubled) result returns true for even check
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEveryPart04Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3]);
          let doubled: Int32Array = arr.map((e: number, _i: int, _a: Int32Array): number => e * 2);
          let callCount: int = 0;
          let r: boolean = doubled.every((e: number, _i: int, _b: Int32Array): boolean => { callCount++; return e % 2 === 0; });
          expect(r).assertTrue();
          expect(callCount).assertEqual(3);
          expect(doubled[0]).assertEqual(2);
          expect(doubled[2]).assertEqual(6);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_EVERY_PART04_6100
         * @tc.name int32ArrayEveryPart04Test061
         * @tc.desc Verify predicate returning false after evaluating falsy number 0 short-circuits at first element
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEveryPart04Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3]);
          let calls: int = 0;
          let falsyVal: number = 0;
          let r: boolean = arr.every((e: number, _i: int, _a: Int32Array): boolean => {
          calls++;
          return falsyVal !== 0;
        });
          expect(r).assertFalse();
          expect(calls).assertEqual(1);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_EVERY_PART04_6200
         * @tc.name int32ArrayEveryPart04Test062
         * @tc.desc Verify predicate returning false when dependent value is empty string short-circuits
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEveryPart04Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1]);
          let falsyStr: string = '';
          let callCount: int = 0;
          let r: boolean = arr.every((e: number, _i: int, _a: Int32Array): boolean => {
          callCount++;
          return falsyStr.length > 0;
        });
          expect(r).assertFalse();
          expect(callCount).assertEqual(1);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_EVERY_PART04_6300
         * @tc.name int32ArrayEveryPart04Test063
         * @tc.desc Verify predicate returning true when dependent value is non-empty string visits all elements
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEveryPart04Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3]);
          let calls: int = 0;
          let truthyStr: string = 'x';
          let r: boolean = arr.every((e: number, _i: int, _a: Int32Array): boolean => {
          calls++;
          return truthyStr.length > 0;
        });
          expect(r).assertTrue();
          expect(calls).assertEqual(3);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_EVERY_PART04_6400
         * @tc.name int32ArrayEveryPart04Test064
         * @tc.desc Verify predicate returning true when dependent value is non-zero number 1 visits all elements
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEveryPart04Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2]);
          let calls: int = 0;
          let truthyVal: number = 1;
          let r: boolean = arr.every((e: number, _i: int, _a: Int32Array): boolean => {
          calls++;
          return truthyVal !== 0;
        });
          expect(r).assertTrue();
          expect(calls).assertEqual(2);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_EVERY_PART04_6500
         * @tc.name int32ArrayEveryPart04Test065
         * @tc.desc Verify predicate returning true when dependent value is non-zero -1
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEveryPart04Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([5]);
          let truthyNeg: number = -1;
          let callCount: int = 0;
          let r: boolean = arr.every((e: number, _i: int, _a: Int32Array): boolean => {
          callCount++;
          return truthyNeg !== 0;
        });
          expect(r).assertTrue();
          expect(callCount).assertEqual(1);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_EVERY_PART04_6600
         * @tc.name int32ArrayEveryPart04Test066
         * @tc.desc Verify predicate returning false when dependent value is Number.NaN short-circuits
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayEveryPart04Test066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2]);
          let falsyNaN: number = Number.NaN;
          let callCount: int = 0;
          let r: boolean = arr.every((e: number, _i: int, _a: Int32Array): boolean => {
          callCount++;
          return !isNaN(falsyNaN) ? true : false;
        });
          expect(r).assertFalse();
          expect(callCount).assertEqual(1);
        });
  });
}
