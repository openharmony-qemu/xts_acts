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
export default function int32ArrayEveryPart03Test(): void {
  describe('Int32ArrayEveryPart03Test', (): void => {
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
           * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_EVERY_PART03_0100
           * @tc.name int32ArrayEveryPart03Test001
           * @tc.desc Verify predicate throwing Error at first element propagates and stops iteration
           * @tc.size MediumTest
           * @tc.type Function
           * @tc.level LEVEL2
           */
          it('int32ArrayEveryPart03Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            let arr: Int32Array = new Int32Array([10, 20, 30, 40]);
            let calls: int = 0;
            try {
              arr.every((e: number, i: int, a: Int32Array): boolean => {
              calls++;
              throw new Error('boom at first');
            });
              expect().assertFail();
            } catch (e) {
              expect(e.name).assertEqual('Error');
              expect(e.message).assertEqual('boom at first');
              expect(calls).assertEqual(1);
            }
          });

          /**
           * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_EVERY_PART03_0200
           * @tc.name int32ArrayEveryPart03Test002
           * @tc.desc Verify predicate throwing Error at middle element propagates and skips later elements
           * @tc.size MediumTest
           * @tc.type Function
           * @tc.level LEVEL2
           */
          it('int32ArrayEveryPart03Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            let arr: Int32Array = new Int32Array([1, 2, 3, 4, 5]);
            let seenIdx: int[] = [];
            try {
              arr.every((e: number, i: int, a: Int32Array): boolean => {
              seenIdx.push(i);
              if (i === 2) {
              throw new Error('mid');
              }
              return true;
            });
              expect().assertFail();
            } catch (e) {
              expect(e.name).assertEqual('Error');
              expect(e.message).assertEqual('mid');
              expect(seenIdx.length).assertEqual(3);
              expect(seenIdx[2]).assertEqual(2);
            }
          });

          /**
           * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_EVERY_PART03_0300
           * @tc.name int32ArrayEveryPart03Test003
           * @tc.desc Verify predicate throwing Error at last element propagates
           * @tc.size MediumTest
           * @tc.type Function
           * @tc.level LEVEL2
           */
          it('int32ArrayEveryPart03Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            let arr: Int32Array = new Int32Array([10, 20, 30]);
            let lastVisited: boolean = false;
            try {
              arr.every((e: number, i: int, a: Int32Array): boolean => {
              if (i === a.length - 1) {
              lastVisited = true;
              throw new Error('last');
              }
              return true;
            });
              expect().assertFail();
            } catch (e) {
              expect(e.name).assertEqual('Error');
              expect(e.message).assertEqual('last');
              expect(lastVisited).assertTrue();
            }
          });

          /**
           * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_EVERY_PART03_0400
           * @tc.name int32ArrayEveryPart03Test004
           * @tc.desc Verify predicate throwing RangeError preserves error name
           * @tc.size MediumTest
           * @tc.type Function
           * @tc.level LEVEL2
           */
          it('int32ArrayEveryPart03Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            let arr: Int32Array = new Int32Array([1]);
            try {
              arr.every((e: number, i: int, a: Int32Array): boolean => {
              throw new RangeError('range bad');
            });
              expect().assertFail();
            } catch (e) {
              expect(e.name).assertEqual('RangeError');
              expect(e.message).assertEqual('range bad');
            }
          });

          /**
           * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_EVERY_PART03_0500
           * @tc.name int32ArrayEveryPart03Test005
           * @tc.desc Verify predicate throwing TypeError preserves error name
           * @tc.size MediumTest
           * @tc.type Function
           * @tc.level LEVEL2
           */
          it('int32ArrayEveryPart03Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            let arr: Int32Array = new Int32Array([1, 2]);
            try {
              arr.every((e: number, i: int, a: Int32Array): boolean => {
              throw new TypeError('type bad');
            });
              expect().assertFail();
            } catch (e) {
              expect(e.name).assertEqual('TypeError');
            }
          });

          /**
           * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_EVERY_PART03_0600
           * @tc.name int32ArrayEveryPart03Test006
           * @tc.desc Verify predicate throwing Error propagates non-null
           * @tc.size MediumTest
           * @tc.type Function
           * @tc.level LEVEL2
           */
          it('int32ArrayEveryPart03Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            let arr: Int32Array = new Int32Array([5]);
            try {
              arr.every((e: number, i: int, a: Int32Array): boolean => {
              throw new Error('stringErr');
            });
              expect().assertFail();
            } catch (e) {
              expect(e.name).assertEqual('Error');
              expect(e.message).assertEqual('stringErr');
            }
          });

          /**
           * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_EVERY_PART03_0700
           * @tc.name int32ArrayEveryPart03Test007
           * @tc.desc Verify original array content unchanged after predicate throws
           * @tc.size MediumTest
           * @tc.type Function
           * @tc.level LEVEL2
           */
          it('int32ArrayEveryPart03Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            let arr: Int32Array = new Int32Array([1, 2, 3]);
            try {
              arr.every((e: number, i: int, a: Int32Array): boolean => {
              throw new Error('x');
            });
              expect().assertFail();
            } catch (e) {
              expect(e.name).assertEqual('Error');
              expect(e.message).assertEqual('x');
              expect(arr.length).assertEqual(3);
              expect(arr[0]).assertEqual(1);
              expect(arr[1]).assertEqual(2);
              expect(arr[2]).assertEqual(3);
            }
          });

          /**
           * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_EVERY_PART03_0800
           * @tc.name int32ArrayEveryPart03Test008
           * @tc.desc Verify calling every again after a throw works correctly
           * @tc.size MediumTest
           * @tc.type Function
           * @tc.level LEVEL2
           */
          it('int32ArrayEveryPart03Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            let arr: Int32Array = new Int32Array([1, 2, 3]);
            try {
              arr.every((e: number, i: int, a: Int32Array): boolean => { throw new Error('x'); });
              expect().assertFail();
            } catch (e) {
              expect(e.name).assertEqual('Error');
              expect(e.message).assertEqual('x');
            }
            let r: boolean = arr.every((e: number, i: int, a: Int32Array): boolean => e > 0);
            expect(r).assertTrue();
          });

          /**
           * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_EVERY_PART03_0900
           * @tc.name int32ArrayEveryPart03Test009
           * @tc.desc Verify nested throw inside predicate propagates outermost error
           * @tc.size MediumTest
           * @tc.type Function
           * @tc.level LEVEL2
           */
          it('int32ArrayEveryPart03Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            let arr: Int32Array = new Int32Array([1, 2]);
            try {
              arr.every((e: number, i: int, a: Int32Array): boolean => {
              try {
              throw new Error('inner');
            } catch (inner) {
              expect(inner.name).assertEqual('Error');
              throw new Error('outer');
            }
          });
            } catch (e) {
              expect(e.name).assertEqual('Error');
              expect(e.message).assertEqual('outer');
            }
          });

          /**
           * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_EVERY_PART03_1000
           * @tc.name int32ArrayEveryPart03Test010
           * @tc.desc Verify predicate returning false on first element returns false without throwing
           * @tc.size MediumTest
           * @tc.type Function
           * @tc.level LEVEL2
           */
          it('int32ArrayEveryPart03Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            let arr: Int32Array = new Int32Array([1, 2, 3]);
            let r: boolean = arr.every((e: number, i: int, a: Int32Array): boolean => false);
            expect(r).assertFalse();
          });

          /**
           * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_EVERY_PART03_1100
           * @tc.name int32ArrayEveryPart03Test011
           * @tc.desc Verify predicate returning false on first element short-circuits
           * @tc.size MediumTest
           * @tc.type Function
           * @tc.level LEVEL2
           */
          it('int32ArrayEveryPart03Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            let arr: Int32Array = new Int32Array([1, 2, 3]);
            let calls: int = 0;
            let r: boolean = arr.every((e: number, i: int, a: Int32Array): boolean => {
            calls++;
            return false;
          });
            expect(r).assertFalse();
            expect(calls).assertEqual(1);
          });

          /**
           * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_EVERY_PART03_1200
           * @tc.name int32ArrayEveryPart03Test012
           * @tc.desc Verify predicate returning false on first element short-circuits (2)
           * @tc.size MediumTest
           * @tc.type Function
           * @tc.level LEVEL2
           */
          it('int32ArrayEveryPart03Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            let arr: Int32Array = new Int32Array([4, 5, 6]);
            let calls: int = 0;
            let r: boolean = arr.every((e: number, i: int, a: Int32Array): boolean => {
            calls++;
            return false;
          });
            expect(r).assertFalse();
            expect(calls).assertEqual(1);
          });

          /**
           * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_EVERY_PART03_1300
           * @tc.name int32ArrayEveryPart03Test013
           * @tc.desc Verify empty Int32Array every returns true (vacuous truth)
           * @tc.size MediumTest
           * @tc.type Function
           * @tc.level LEVEL2
           */
          it('int32ArrayEveryPart03Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            let arr: Int32Array = new Int32Array(0);
            let calls: int = 0;
            let r: boolean = arr.every((e: number, i: int, a: Int32Array): boolean => {
            calls++;
            return false;
          });
            expect(r).assertTrue();
            expect(calls).assertEqual(0);
          });

          /**
           * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_EVERY_PART03_1400
           * @tc.name int32ArrayEveryPart03Test014
           * @tc.desc Verify empty Int32Array from ArrayBuffer(0) every returns true
           * @tc.size MediumTest
           * @tc.type Function
           * @tc.level LEVEL2
           */
          it('int32ArrayEveryPart03Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            let buf: ArrayBuffer = new ArrayBuffer(0);
            let arr: Int32Array = new Int32Array(buf);
            let r: boolean = arr.every((e: number, i: int, a: Int32Array): boolean => e > 0);
            expect(r).assertTrue();
            expect(arr.length).assertEqual(0);
          });

          /**
           * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_EVERY_PART03_1500
           * @tc.name int32ArrayEveryPart03Test015
           * @tc.desc Verify subarray zero-length view every returns true
           * @tc.size MediumTest
           * @tc.type Function
           * @tc.level LEVEL2
           */
          it('int32ArrayEveryPart03Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            let arr: Int32Array = new Int32Array([1, 2, 3]);
            let sub: Int32Array = arr.subarray(2, 2);
            let r: boolean = sub.every((e: number, i: int, a: Int32Array): boolean => false);
            expect(r).assertTrue();
            expect(sub.length).assertEqual(0);
          });

          /**
           * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_EVERY_PART03_1600
           * @tc.name int32ArrayEveryPart03Test016
           * @tc.desc Verify slice zero-length array every returns true
           * @tc.size MediumTest
           * @tc.type Function
           * @tc.level LEVEL2
           */
          it('int32ArrayEveryPart03Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            let arr: Int32Array = new Int32Array([10, 20]);
            let s: Int32Array = arr.slice(0, 0);
            let r: boolean = s.every((e: number, i: int, a: Int32Array): boolean => e > 999);
            expect(r).assertTrue();
          });

          /**
           * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_EVERY_PART03_1700
           * @tc.name int32ArrayEveryPart03Test017
           * @tc.desc Verify single element predicate returns true yields true
           * @tc.size MediumTest
           * @tc.type Function
           * @tc.level LEVEL2
           */
          it('int32ArrayEveryPart03Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            let arr: Int32Array = new Int32Array([42]);
            let r: boolean = arr.every((e: number, i: int, a: Int32Array): boolean => e === 42);
            expect(r).assertTrue();
          });

          /**
           * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_EVERY_PART03_1800
           * @tc.name int32ArrayEveryPart03Test018
           * @tc.desc Verify single element predicate returns false yields false
           * @tc.size MediumTest
           * @tc.type Function
           * @tc.level LEVEL2
           */
          it('int32ArrayEveryPart03Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            let arr: Int32Array = new Int32Array([42]);
            let r: boolean = arr.every((e: number, i: int, a: Int32Array): boolean => e !== 42);
            expect(r).assertFalse();
          });

          /**
           * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_EVERY_PART03_1900
           * @tc.name int32ArrayEveryPart03Test019
           * @tc.desc Verify single element predicate index is 0
           * @tc.size MediumTest
           * @tc.type Function
           * @tc.level LEVEL2
           */
          it('int32ArrayEveryPart03Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            let arr: Int32Array = new Int32Array([99]);
            let seenIdx: int = -1;
            arr.every((e: number, i: int, a: Int32Array): boolean => {
            seenIdx = i;
            return true;
          });
            expect(seenIdx).assertEqual(0);
          });

          /**
           * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_EVERY_PART03_2000
           * @tc.name int32ArrayEveryPart03Test020
           * @tc.desc Verify single element predicate array reference is original
           * @tc.size MediumTest
           * @tc.type Function
           * @tc.level LEVEL2
           */
          it('int32ArrayEveryPart03Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            let arr: Int32Array = new Int32Array([7]);
            let same: boolean = false;
            arr.every((e: number, i: int, a: Int32Array): boolean => {
            same = (a === arr);
            return true;
          });
            expect(same).assertTrue();
          });

          /**
           * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_EVERY_PART03_2100
           * @tc.name int32ArrayEveryPart03Test021
           * @tc.desc Verify all zeros predicate e===0 returns true
           * @tc.size MediumTest
           * @tc.type Function
           * @tc.level LEVEL2
           */
          it('int32ArrayEveryPart03Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            let arr: Int32Array = new Int32Array([0, 0, 0, 0, 0]);
            let r: boolean = arr.every((e: number, i: int, a: Int32Array): boolean => e === 0);
            expect(r).assertTrue();
          });

          /**
           * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_EVERY_PART03_2200
           * @tc.name int32ArrayEveryPart03Test022
           * @tc.desc Verify all INT_MAX predicate e===INT_MAX returns true
           * @tc.size MediumTest
           * @tc.type Function
           * @tc.level LEVEL2
           */
          it('int32ArrayEveryPart03Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            let arr: Int32Array = new Int32Array([2147483647, 2147483647, 2147483647]);
            let r: boolean = arr.every((e: number, i: int, a: Int32Array): boolean => e === 2147483647);
            expect(r).assertTrue();
          });

          /**
           * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_EVERY_PART03_2300
           * @tc.name int32ArrayEveryPart03Test023
           * @tc.desc Verify all INT_MIN predicate e===INT_MIN returns true
           * @tc.size MediumTest
           * @tc.type Function
           * @tc.level LEVEL2
           */
          it('int32ArrayEveryPart03Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            let arr: Int32Array = new Int32Array([-2147483648, -2147483648]);
            let r: boolean = arr.every((e: number, i: int, a: Int32Array): boolean => e === -2147483648);
            expect(r).assertTrue();
          });

          /**
           * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_EVERY_PART03_2400
           * @tc.name int32ArrayEveryPart03Test024
           * @tc.desc Verify mixed value short-circuits at differing element and counts calls
           * @tc.size MediumTest
           * @tc.type Function
           * @tc.level LEVEL2
           */
          it('int32ArrayEveryPart03Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            let arr: Int32Array = new Int32Array([5, 5, 5, 7, 5]);
            let calls: int = 0;
            let r: boolean = arr.every((e: number, i: int, a: Int32Array): boolean => {
            calls++;
            return e === 5;
          });
            expect(r).assertFalse();
            expect(calls).assertEqual(4);
          });

          /**
           * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_EVERY_PART03_2500
           * @tc.name int32ArrayEveryPart03Test025
           * @tc.desc Verify all -1 predicate e<0 returns true
           * @tc.size MediumTest
           * @tc.type Function
           * @tc.level LEVEL2
           */
          it('int32ArrayEveryPart03Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            let arr: Int32Array = new Int32Array([-1, -1, -1]);
            let r: boolean = arr.every((e: number, i: int, a: Int32Array): boolean => e < 0);
            expect(r).assertTrue();
          });

          /**
           * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_EVERY_PART03_2600
           * @tc.name int32ArrayEveryPart03Test026
           * @tc.desc Verify all 1s predicate e>0 visits all elements
           * @tc.size MediumTest
           * @tc.type Function
           * @tc.level LEVEL2
           */
          it('int32ArrayEveryPart03Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            let arr: Int32Array = new Int32Array([1, 1, 1, 1]);
            let sum: int = 0;
            let r: boolean = arr.every((e: number, i: int, a: Int32Array): boolean => {
            sum += 1;
            return e > 0;
          });
            expect(r).assertTrue();
            expect(sum).assertEqual(4);
          });

          /**
           * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_EVERY_PART03_2700
           * @tc.name int32ArrayEveryPart03Test027
           * @tc.desc Verify predicate never receives negative index
           * @tc.size MediumTest
           * @tc.type Function
           * @tc.level LEVEL2
           */
          it('int32ArrayEveryPart03Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            let arr: Int32Array = new Int32Array([10, 20, 30]);
            let gotNeg: boolean = false;
            arr.every((e: number, i: int, a: Int32Array): boolean => {
            if (i < 0) { gotNeg = true; }
            return true;
          });
            expect(gotNeg).assertFalse();
          });

          /**
           * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_EVERY_PART03_2800
           * @tc.name int32ArrayEveryPart03Test028
           * @tc.desc Verify predicate never receives index equal to length
           * @tc.size MediumTest
           * @tc.type Function
           * @tc.level LEVEL2
           */
          it('int32ArrayEveryPart03Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            let arr: Int32Array = new Int32Array([1, 2]);
            let gotLen: boolean = false;
            arr.every((e: number, i: int, a: Int32Array): boolean => {
            if (i >= a.length) { gotLen = true; }
            return true;
          });
            expect(gotLen).assertFalse();
          });

          /**
           * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_EVERY_PART03_2900
           * @tc.name int32ArrayEveryPart03Test029
           * @tc.desc Verify predicate indices are strictly increasing
           * @tc.size MediumTest
           * @tc.type Function
           * @tc.level LEVEL2
           */
          it('int32ArrayEveryPart03Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            let arr: Int32Array = new Int32Array([10, 20, 30, 40]);
            let expected: int = 0;
            let ok: boolean = true;
            arr.every((e: number, i: int, a: Int32Array): boolean => {
            if (i !== expected) { ok = false; }
            expected++;
            return true;
          });
            expect(ok).assertTrue();
            expect(expected).assertEqual(4);
          });

          /**
           * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_EVERY_PART03_3000
           * @tc.name int32ArrayEveryPart03Test030
           * @tc.desc Verify first element failure visits only index 0
           * @tc.size MediumTest
           * @tc.type Function
           * @tc.level LEVEL2
           */
          it('int32ArrayEveryPart03Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            let arr: Int32Array = new Int32Array([10, 20, 30]);
            let seen: int[] = [];
            arr.every((e: number, i: int, a: Int32Array): boolean => {
            seen.push(i);
            return false;
          });
            expect(seen.length).assertEqual(1);
            expect(seen[0]).assertEqual(0);
          });

          /**
           * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_EVERY_PART03_3100
           * @tc.name int32ArrayEveryPart03Test031
           * @tc.desc Verify last element failure visits all indices 0..length-1
           * @tc.size MediumTest
           * @tc.type Function
           * @tc.level LEVEL2
           */
          it('int32ArrayEveryPart03Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            let arr: Int32Array = new Int32Array([1, 2, 3]);
            let seen: int[] = [];
            let r: boolean = arr.every((e: number, i: int, a: Int32Array): boolean => {
            seen.push(i);
            return i !== a.length - 1;
          });
            expect(r).assertFalse();
            expect(seen.length).assertEqual(3);
          });

          /**
           * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_EVERY_PART03_3200
           * @tc.name int32ArrayEveryPart03Test032
           * @tc.desc Verify predicate third argument length matches outer
           * @tc.size MediumTest
           * @tc.type Function
           * @tc.level LEVEL2
           */
          it('int32ArrayEveryPart03Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            let arr: Int32Array = new Int32Array([1, 2, 3, 4]);
            let innerLen: int = 0;
            arr.every((e: number, i: int, a: Int32Array): boolean => {
            innerLen = a.length;
            return true;
          });
            expect(innerLen).assertEqual(4);
          });

          /**
           * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_EVERY_PART03_3300
           * @tc.name int32ArrayEveryPart03Test033
           * @tc.desc Verify predicate receives three arguments element index array
           * @tc.size MediumTest
           * @tc.type Function
           * @tc.level LEVEL2
           */
          it('int32ArrayEveryPart03Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            let arr: Int32Array = new Int32Array([7]);
            let receivedElement: number = 0;
            let receivedIndex: int = -1;
            let receivedArray: Int32Array | undefined = undefined;
            let fn: (e: number, i: int, a: Int32Array) => boolean = (e: number, i: int, a: Int32Array): boolean => {
            receivedElement = e;
            receivedIndex = i;
            receivedArray = a;
            return true;
            };
            arr.every(fn);
            expect(receivedElement).assertEqual(7);
            expect(receivedIndex).assertEqual(0);
            expect(receivedArray).assertEqual(arr);
          });

          /**
           * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_EVERY_PART03_3400
           * @tc.name int32ArrayEveryPart03Test034
           * @tc.desc Verify modifying current element in predicate does not affect true result
           * @tc.size MediumTest
           * @tc.type Function
           * @tc.level LEVEL2
           */
          it('int32ArrayEveryPart03Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            let arr: Int32Array = new Int32Array([1, 2, 3]);
            let r: boolean = arr.every((e: number, i: int, a: Int32Array): boolean => {
            a.$_set(i, e + 10);
            return e > 0;
          });
            expect(r).assertTrue();
            expect(arr[0]).assertEqual(11);
            expect(arr[2]).assertEqual(13);
          });

          /**
           * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_EVERY_PART03_3500
           * @tc.name int32ArrayEveryPart03Test035
           * @tc.desc Verify modifying future unvisited element to non-matching short-circuits
           * @tc.size MediumTest
           * @tc.type Function
           * @tc.level LEVEL2
           */
          it('int32ArrayEveryPart03Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            let arr: Int32Array = new Int32Array([1, 2, 3, 4]);
            let r: boolean = arr.every((e: number, i: int, a: Int32Array): boolean => {
            if (i === 0) {
            a.$_set(2, -99);
            }
            return e > 0;
          });
            expect(r).assertFalse();
            expect(arr[2]).assertEqual(-99);
          });

          /**
           * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_EVERY_PART03_3600
           * @tc.name int32ArrayEveryPart03Test036
           * @tc.desc Verify reading other positions through array reference observes initial then modified values
           * @tc.size MediumTest
           * @tc.type Function
           * @tc.level LEVEL2
           */
          it('int32ArrayEveryPart03Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            let arr: Int32Array = new Int32Array([10, 20, 30]);
            let seenThirdAtFirst: number = 0;
            arr.every((e: number, i: int, a: Int32Array): boolean => {
            if (i === 0) {
            seenThirdAtFirst = a.$_get(2);
            a.$_set(2, 999);
            }
            return true;
          });
            expect(seenThirdAtFirst).assertEqual(30);
            expect(arr[2]).assertEqual(999);
          });

          /**
           * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_EVERY_PART03_3700
           * @tc.name int32ArrayEveryPart03Test037
           * @tc.desc Verify every on subarray view uses the view itself as array argument
           * @tc.size MediumTest
           * @tc.type Function
           * @tc.level LEVEL2
           */
          it('int32ArrayEveryPart03Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            let parent: Int32Array = new Int32Array([1, 2, 3, 4, 5]);
            let sub: Int32Array = parent.subarray(2, 4);
            let sameAsSub: boolean = false;
            sub.every((e: number, i: int, a: Int32Array): boolean => {
            sameAsSub = (a === sub);
            return true;
          });
            expect(sameAsSub).assertTrue();
            expect(sub.length).assertEqual(2);
          });

          /**
           * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_EVERY_PART03_3800
           * @tc.name int32ArrayEveryPart03Test038
           * @tc.desc Verify every iterates all elements on non-zero byteOffset view
           * @tc.size MediumTest
           * @tc.type Function
           * @tc.level LEVEL2
           */
          it('int32ArrayEveryPart03Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            let buf: ArrayBuffer = new ArrayBuffer(16);
            let view: Int32Array = new Int32Array(buf, 4, 2);
            view.$_set(0, 100);
            view.$_set(1, 200);
            let sum: int = 0;
            let r: boolean = view.every((e: number, i: int, a: Int32Array): boolean => {
            sum += e;
            return e > 0;
          });
            expect(r).assertTrue();
            expect(sum).assertEqual(300);
          });

          /**
           * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_EVERY_PART03_3900
           * @tc.name int32ArrayEveryPart03Test039
           * @tc.desc Verify two views sharing buffer observe modifications through every
           * @tc.size MediumTest
           * @tc.type Function
           * @tc.level LEVEL2
           */
          it('int32ArrayEveryPart03Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            let buf: ArrayBuffer = new ArrayBuffer(12);
            let a1: Int32Array = new Int32Array(buf, 0, 3);
            let a2: Int32Array = new Int32Array(buf, 0, 3);
            a1.$_set(0, 1);
            a1.$_set(1, 2);
            a1.$_set(2, 3);
            a1.every((e: number, i: int, a: Int32Array): boolean => {
            a.$_set(i, e * 10);
            return true;
          });
            expect(a2[0]).assertEqual(10);
            expect(a2[1]).assertEqual(20);
            expect(a2[2]).assertEqual(30);
          });

          /**
           * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_EVERY_PART03_4000
           * @tc.name int32ArrayEveryPart03Test040
           * @tc.desc Verify INT_MAX element matches predicate e===INT_MAX
           * @tc.size MediumTest
           * @tc.type Function
           * @tc.level LEVEL2
           */
          it('int32ArrayEveryPart03Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            let arr: Int32Array = new Int32Array([2147483647]);
            let r: boolean = arr.every((e: number, i: int, a: Int32Array): boolean => e === 2147483647);
            expect(r).assertTrue();
          });

          /**
           * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_EVERY_PART03_4100
           * @tc.name int32ArrayEveryPart03Test041
           * @tc.desc Verify INT_MIN element matches predicate e===INT_MIN
           * @tc.size MediumTest
           * @tc.type Function
           * @tc.level LEVEL2
           */
          it('int32ArrayEveryPart03Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            let arr: Int32Array = new Int32Array([-2147483648]);
            let r: boolean = arr.every((e: number, i: int, a: Int32Array): boolean => e === -2147483648);
            expect(r).assertTrue();
          });

          /**
           * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_EVERY_PART03_4200
           * @tc.name int32ArrayEveryPart03Test042
           * @tc.desc Verify Int32Array.of with INT_MIN yields element less than zero
           * @tc.size MediumTest
           * @tc.type Function
           * @tc.level LEVEL2
           */
          it('int32ArrayEveryPart03Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            let arr: Int32Array = Int32Array.of(-2147483648);
            let r: boolean = arr.every((e: number, i: int, a: Int32Array): boolean => e < 0);
            expect(r).assertTrue();
            expect(arr[0]).assertEqual(-2147483648);
          });

          /**
           * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_EVERY_PART03_4300
           * @tc.name int32ArrayEveryPart03Test043
           * @tc.desc Verify Int32Array containing Double.NaN coerced to int matches zero
           * @tc.size MediumTest
           * @tc.type Function
           * @tc.level LEVEL2
           */
          it('int32ArrayEveryPart03Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            let arr: Int32Array = Int32Array.of(Double.NaN);
            let r: boolean = arr.every((e: number, i: int, a: Int32Array): boolean => e === 0);
            expect(r).assertTrue();
          });

          /**
           * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_EVERY_PART03_4400
           * @tc.name int32ArrayEveryPart03Test044
           * @tc.desc Verify nested every on a separate Int32Array does not interfere
           * @tc.size MediumTest
           * @tc.type Function
           * @tc.level LEVEL2
           */
          it('int32ArrayEveryPart03Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            let a: Int32Array = new Int32Array([1, 2, 3]);
            let b: Int32Array = new Int32Array([-1, -2]);
            let innerResult: boolean = false;
            let outerResult: boolean = a.every((e: number, i: int, arr: Int32Array): boolean => {
            innerResult = b.every((x: number, j: int, br: Int32Array): boolean => x < 0);
            return e > 0;
          });
            expect(outerResult).assertTrue();
            expect(innerResult).assertTrue();
          });

          /**
           * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_EVERY_PART03_4500
           * @tc.name int32ArrayEveryPart03Test045
           * @tc.desc Verify reentrant every on the same array counts nested calls
           * @tc.size MediumTest
           * @tc.type Function
           * @tc.level LEVEL2
           */
          it('int32ArrayEveryPart03Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            let arr: Int32Array = new Int32Array([1, 2]);
            let nestedCalls: int = 0;
            let r: boolean = arr.every((e: number, i: int, a: Int32Array): boolean => {
            nestedCalls++;
            a.every((x: number, j: int, ar: Int32Array): boolean => {
            nestedCalls++;
            return x > 0;
          });
            return e > 0;
          });
            expect(r).assertTrue();
            expect(nestedCalls).assertEqual(6);
          });

          /**
           * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_EVERY_PART03_4600
           * @tc.name int32ArrayEveryPart03Test046
           * @tc.desc Verify every returning false leaves length and byteLength unchanged
           * @tc.size MediumTest
           * @tc.type Function
           * @tc.level LEVEL2
           */
          it('int32ArrayEveryPart03Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            let arr: Int32Array = new Int32Array([1, -2, 3]);
            let beforeLen: int = arr.length;
            let beforeByteLen: int = arr.byteLength;
            arr.every((e: number, i: int, a: Int32Array): boolean => e > 0);
            expect(arr.length).assertEqual(beforeLen);
            expect(arr.byteLength).assertEqual(beforeByteLen);
          });

          /**
           * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_EVERY_PART03_4700
           * @tc.name int32ArrayEveryPart03Test047
           * @tc.desc Verify accumulator in predicate reflects actual visits when all true
           * @tc.size MediumTest
           * @tc.type Function
           * @tc.level LEVEL2
           */
          it('int32ArrayEveryPart03Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            let arr: Int32Array = new Int32Array([10, 20, 30, 40, 50]);
            let acc: int = 0;
            let r: boolean = arr.every((e: number, i: int, a: Int32Array): boolean => {
            acc += e;
            return true;
          });
            expect(r).assertTrue();
            expect(acc).assertEqual(150);
          });

          /**
           * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_EVERY_PART03_4800
           * @tc.name int32ArrayEveryPart03Test048
           * @tc.desc Verify zero elements with true predicate e===0 returns true
           * @tc.size MediumTest
           * @tc.type Function
           * @tc.level LEVEL2
           */
          it('int32ArrayEveryPart03Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            let arr: Int32Array = new Int32Array([0, 0, 0]);
            let r: boolean = arr.every((e: number, i: int, a: Int32Array): boolean => e === 0);
            expect(r).assertTrue();
          });

          /**
           * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_EVERY_PART03_4900
           * @tc.name int32ArrayEveryPart03Test049
           * @tc.desc Verify Int32Array.from iterates all elements with predicate
           * @tc.size MediumTest
           * @tc.type Function
           * @tc.level LEVEL2
           */
          it('int32ArrayEveryPart03Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            let src: int[] = [1, 2, 3, 4];
            let arr: Int32Array = Int32Array.from(src);
            let cnt: int = 0;
            let r: boolean = arr.every((e: number, i: int, a: Int32Array): boolean => {
            cnt++;
            return e > 0;
          });
            expect(r).assertTrue();
            expect(cnt).assertEqual(4);
          });

          /**
           * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_EVERY_PART03_5000
           * @tc.name int32ArrayEveryPart03Test050
           * @tc.desc Verify Int32Array.of with INT_MAX INT_MIN and zero within bounds
           * @tc.size MediumTest
           * @tc.type Function
           * @tc.level LEVEL2
           */
          it('int32ArrayEveryPart03Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            let arr: Int32Array = Int32Array.of(2147483647, -2147483648, 0);
            let minMaxOk: boolean = arr.every((e: number, i: int, a: Int32Array): boolean => {
            return e >= -2147483648 && e <= 2147483647;
          });
            expect(minMaxOk).assertTrue();
          });

          /**
           * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_EVERY_PART03_5100
           * @tc.name int32ArrayEveryPart03Test051
           * @tc.desc Verify length 64 array first failing predicate called once
           * @tc.size MediumTest
           * @tc.type Function
           * @tc.level LEVEL2
           */
          it('int32ArrayEveryPart03Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            let arr: Int32Array = new Int32Array(64);
            arr.$_set(0, -1);
            let calls: int = 0;
            let r: boolean = arr.every((e: number, i: int, a: Int32Array): boolean => {
            calls++;
            return e >= 0;
          });
            expect(r).assertFalse();
            expect(calls).assertEqual(1);
          });

          /**
           * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_EVERY_PART03_5200
           * @tc.name int32ArrayEveryPart03Test052
           * @tc.desc Verify length 64 array all satisfying predicate called 64 times
           * @tc.size MediumTest
           * @tc.type Function
           * @tc.level LEVEL2
           */
          it('int32ArrayEveryPart03Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            let arr: Int32Array = new Int32Array(64);
            let i: int = 0;
            for (; i < 64; i++) {
            arr.$_set(i, 1);
            }
            let calls: int = 0;
            let r: boolean = arr.every((e: number, idx: int, a: Int32Array): boolean => {
            calls++;
            return e === 1;
          });
            expect(r).assertTrue();
            expect(calls).assertEqual(64);
          });

          /**
           * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_EVERY_PART03_5300
           * @tc.name int32ArrayEveryPart03Test053
           * @tc.desc Verify byteOffset and byteLength readable unchanged when predicate throws
           * @tc.size MediumTest
           * @tc.type Function
           * @tc.level LEVEL2
           */
          it('int32ArrayEveryPart03Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            let buf: ArrayBuffer = new ArrayBuffer(32);
            let arr: Int32Array = new Int32Array(buf, 8, 4);
            let bo: int = -1;
            let bl: int = -1;
            try {
              arr.every((e: number, i: int, a: Int32Array): boolean => {
              bo = a.byteOffset;
              bl = a.byteLength;
              throw new Error('stop');
            });
              expect().assertFail();
            } catch (e) {
              expect(e.name).assertEqual('Error');
              expect(e.message).assertEqual('stop');
            }
            expect(bo).assertEqual(8);
            expect(bl).assertEqual(16);
          });

          /**
           * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_EVERY_PART03_5400
           * @tc.name int32ArrayEveryPart03Test054
           * @tc.desc Verify calling join inside predicate does not affect every result
           * @tc.size MediumTest
           * @tc.type Function
           * @tc.level LEVEL2
           */
          it('int32ArrayEveryPart03Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            let arr: Int32Array = new Int32Array([1, 2, 3]);
            let joined: string = '';
            let r: boolean = arr.every((e: number, i: int, a: Int32Array): boolean => {
            if (i === 0) {
            joined = a.join();
            }
            return e > 0;
          });
            expect(r).assertTrue();
            expect(joined).assertEqual('1,2,3');
          });

          /**
           * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_EVERY_PART03_5500
           * @tc.name int32ArrayEveryPart03Test055
           * @tc.desc Verify length 1 array with -1 predicate e<0 returns true
           * @tc.size MediumTest
           * @tc.type Function
           * @tc.level LEVEL2
           */
          it('int32ArrayEveryPart03Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            let arr: Int32Array = new Int32Array([-1]);
            let r: boolean = arr.every((e: number, i: int, a: Int32Array): boolean => e < 0);
            expect(r).assertTrue();
          });

          /**
           * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_EVERY_PART03_5600
           * @tc.name int32ArrayEveryPart03Test056
           * @tc.desc Verify length 2 array first element not satisfying returns false without second visit
           * @tc.size MediumTest
           * @tc.type Function
           * @tc.level LEVEL2
           */
          it('int32ArrayEveryPart03Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            let arr: Int32Array = new Int32Array([-1, 100]);
            let calls: int = 0;
            let r: boolean = arr.every((e: number, i: int, a: Int32Array): boolean => {
            calls++;
            return e > 0;
          });
            expect(r).assertFalse();
            expect(calls).assertEqual(1);
          });
  });
}
