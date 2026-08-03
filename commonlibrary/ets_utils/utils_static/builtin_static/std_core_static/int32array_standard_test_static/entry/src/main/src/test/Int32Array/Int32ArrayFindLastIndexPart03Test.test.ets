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
export default function int32ArrayFindLastIndexPart03Test(): void {
  describe('Int32ArrayFindLastIndexPart03Test', (): void => {
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
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART03_0100
         * @tc.name int32ArrayFindLastIndexPart03Test001
         * @tc.desc Verify predicate null throws TypeError
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart03Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3]);
          try {
            arr.findLastIndex(null as Object as (v: number, i: int, a: Int32Array) => boolean);
            expect().assertFail();
          } catch (e) {
            expect(e.name).assertEqual('ClassCastError');
          }
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART03_0200
         * @tc.name int32ArrayFindLastIndexPart03Test002
         * @tc.desc Verify predicate undefined throws TypeError
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart03Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2]);
          try {
            arr.findLastIndex(undefined as Object as (v: number, i: int, a: Int32Array) => boolean);
            expect().assertFail();
          } catch (e) {
            expect(e.name).assertEqual('ClassCastError');
          }
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART03_0300
         * @tc.name int32ArrayFindLastIndexPart03Test003
         * @tc.desc Verify predicate number 0 throws TypeError
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart03Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2]);
          try {
            arr.findLastIndex(0 as Object as (v: number, i: int, a: Int32Array) => boolean);
            expect().assertFail();
          } catch (e) {
            expect(e.name).assertEqual('ClassCastError');
          }
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART03_0400
         * @tc.name int32ArrayFindLastIndexPart03Test004
         * @tc.desc Verify predicate number 1 throws TypeError
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart03Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2]);
          try {
            arr.findLastIndex(1 as Object as (v: number, i: int, a: Int32Array) => boolean);
            expect().assertFail();
          } catch (e) {
            expect(e.name).assertEqual('ClassCastError');
          }
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART03_0500
         * @tc.name int32ArrayFindLastIndexPart03Test005
         * @tc.desc Verify predicate Number.NaN throws TypeError
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart03Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2]);
          try {
            arr.findLastIndex(Double.NaN as Object as (v: number, i: int, a: Int32Array) => boolean);
            expect().assertFail();
          } catch (e) {
            expect(e.name).assertEqual('ClassCastError');
          }
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART03_0600
         * @tc.name int32ArrayFindLastIndexPart03Test006
         * @tc.desc Verify predicate boolean true throws TypeError
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart03Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1]);
          try {
            arr.findLastIndex(true as Object as (v: number, i: int, a: Int32Array) => boolean);
            expect().assertFail();
          } catch (e) {
            expect(e.name).assertEqual('ClassCastError');
          }
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART03_0700
         * @tc.name int32ArrayFindLastIndexPart03Test007
         * @tc.desc Verify predicate boolean false throws TypeError
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart03Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1]);
          try {
            arr.findLastIndex(false as Object as (v: number, i: int, a: Int32Array) => boolean);
            expect().assertFail();
          } catch (e) {
            expect(e.name).assertEqual('ClassCastError');
          }
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART03_0800
         * @tc.name int32ArrayFindLastIndexPart03Test008
         * @tc.desc Verify predicate empty string throws TypeError
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart03Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2]);
          try {
            arr.findLastIndex('' as Object as (v: number, i: int, a: Int32Array) => boolean);
            expect().assertFail();
          } catch (e) {
            expect(e.name).assertEqual('ClassCastError');
          }
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART03_0900
         * @tc.name int32ArrayFindLastIndexPart03Test009
         * @tc.desc Verify predicate non-empty string throws TypeError
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart03Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2]);
          try {
            arr.findLastIndex('hello' as Object as (v: number, i: int, a: Int32Array) => boolean);
            expect().assertFail();
          } catch (e) {
            expect(e.name).assertEqual('ClassCastError');
          }
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART03_1000
         * @tc.name int32ArrayFindLastIndexPart03Test010
         * @tc.desc Verify predicate plain Object throws TypeError
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart03Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2]);
          let obj: Object = new Object();
          try {
            arr.findLastIndex(obj as Object as (v: number, i: int, a: Int32Array) => boolean);
            expect().assertFail();
          } catch (e) {
            expect(e.name).assertEqual('ClassCastError');
          }
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART03_1100
         * @tc.name int32ArrayFindLastIndexPart03Test011
         * @tc.desc Verify predicate Array throws TypeError
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart03Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2]);
          let dummy: Object = new Array<number>();
          try {
            arr.findLastIndex(dummy as Object as (v: number, i: int, a: Int32Array) => boolean);
            expect().assertFail();
          } catch (e) {
            expect(e.name).assertEqual('ClassCastError');
          }
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART03_1200
         * @tc.name int32ArrayFindLastIndexPart03Test012
         * @tc.desc Verify predicate Int32Array itself throws TypeError
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart03Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3]);
          try {
            arr.findLastIndex(arr as Object as (v: number, i: int, a: Int32Array) => boolean);
            expect().assertFail();
          } catch (e) {
            expect(e.name).assertEqual('ClassCastError');
          }
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART03_1300
         * @tc.name int32ArrayFindLastIndexPart03Test013
         * @tc.desc Verify predicate ArrayBuffer throws TypeError
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart03Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2]);
          let buf: Object = new ArrayBuffer(8);
          try {
            arr.findLastIndex(buf as Object as (v: number, i: int, a: Int32Array) => boolean);
            expect().assertFail();
          } catch (e) {
            expect(e.name).assertEqual('ClassCastError');
          }
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART03_1400
         * @tc.name int32ArrayFindLastIndexPart03Test014
         * @tc.desc Verify predicate throws at tail element, visits 1 index
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart03Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([10, 20, 30, 40]);
          let visited: number[] = [];
          let pred = (v: number, i: int, a: Int32Array): boolean => {
          visited.push(i);
          throw new Error('boomTail');
          };
          try {
            arr.findLastIndex(pred);
            expect().assertFail();
          } catch (e) {
            expect(e.name).assertEqual('Error');
            expect(e.message).assertEqual('boomTail');
            expect(visited.length).assertEqual(1);
            expect(visited[0]).assertEqual(3);
          }
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART03_1500
         * @tc.name int32ArrayFindLastIndexPart03Test015
         * @tc.desc Verify predicate throws at middle index, visits right-to-left
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart03Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([10, 20, 30, 40, 50]);
          let visited: number[] = [];
          let pred = (v: number, i: int, a: Int32Array): boolean => {
          visited.push(i);
          if (i === 2) { throw new Error('midBoom'); }
          return false;
          };
          try {
            arr.findLastIndex(pred);
            expect().assertFail();
          } catch (e) {
            expect(e.name).assertEqual('Error');
            expect(e.message).assertEqual('midBoom');
            expect(visited.length).assertEqual(3);
            expect(visited[0]).assertEqual(4);
            expect(visited[1]).assertEqual(3);
            expect(visited[2]).assertEqual(2);
          }
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART03_1600
         * @tc.name int32ArrayFindLastIndexPart03Test016
         * @tc.desc Verify predicate throws at first element, visits all length
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart03Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3, 4]);
          let visited: number[] = [];
          let pred = (v: number, i: int, a: Int32Array): boolean => {
          visited.push(i);
          if (i === 0) { throw new Error('firstBoom'); }
          return false;
          };
          try {
            arr.findLastIndex(pred);
            expect().assertFail();
          } catch (e) {
            expect(e.name).assertEqual('Error');
            expect(e.message).assertEqual('firstBoom');
            expect(visited.length).assertEqual(4);
            expect(visited[3]).assertEqual(0);
          }
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART03_1700
         * @tc.name int32ArrayFindLastIndexPart03Test017
         * @tc.desc Verify predicate throws RangeError propagates
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart03Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([5, 6]);
          let pred = (v: number, i: int, a: Int32Array): boolean => {
          throw new RangeError('rangeBad');
          };
          try {
            arr.findLastIndex(pred);
            expect().assertFail();
          } catch (e) {
            expect(e.name).assertEqual('RangeError');
            expect(e.message).assertEqual('rangeBad');
          }
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART03_1800
         * @tc.name int32ArrayFindLastIndexPart03Test018
         * @tc.desc Verify predicate throws TypeError propagates
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart03Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([5]);
          let pred = (v: number, i: int, a: Int32Array): boolean => {
          throw new TypeError('typeBad');
          };
          try {
            arr.findLastIndex(pred);
            expect().assertFail();
          } catch (e) {
            expect(e.name).assertEqual('TypeError');
          }
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART03_1900
         * @tc.name int32ArrayFindLastIndexPart03Test019
         * @tc.desc Verify match short-circuits before later throw
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart03Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3, 4, 5]);
          let callCount: int = 0;
          let pred = (v: number, i: int, a: Int32Array): boolean => {
          callCount = callCount + 1;
          if (i === 1) { throw new Error('shouldNotReach'); }
          return i === 3;
          };
          let r: int = arr.findLastIndex(pred);
          expect(r).assertEqual(3);
          expect(callCount).assertEqual(2);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART03_2000
         * @tc.name int32ArrayFindLastIndexPart03Test020
         * @tc.desc Verify predicate throws Error instance propagates
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart03Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2]);
          let pred = (v: number, i: int, a: Int32Array): boolean => {
          throw new Error('strErr');
          };
          try {
            arr.findLastIndex(pred);
            expect().assertFail();
          } catch (e) {
            expect(e.name).assertEqual('Error');
            expect(e.message).assertEqual('strErr');
          }
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART03_2100
         * @tc.name int32ArrayFindLastIndexPart03Test021
         * @tc.desc Verify predicate returning undefined (falsy) returns -1
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart03Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3]);
          try {
            arr.findLastIndex((v: number, i: int, a: Int32Array): boolean => {
            return undefined as Object as boolean;
          });
            expect().assertFail();
          } catch (e) {
            expect(e.name).assertEqual('ClassCastError');
          }
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART03_2200
         * @tc.name int32ArrayFindLastIndexPart03Test022
         * @tc.desc Verify predicate returning 0/1 coercion hits matching index
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart03Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([10, 20, 30]);
          try {
            arr.findLastIndex((v: number, i: int, a: Int32Array): boolean => {
            if (v === 20) { return 1 as Object as boolean; }
            return 0 as Object as boolean;
          });
            expect().assertFail();
          } catch (e) {
            expect(e.name).assertEqual('ClassCastError');
          }
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART03_2300
         * @tc.name int32ArrayFindLastIndexPart03Test023
         * @tc.desc Verify predicate returning 1 (truthy) hits last element
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart03Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([10, 20, 30]);
          try {
            arr.findLastIndex((v: number, i: int, a: Int32Array): boolean => {
            return (v === 30 ? 1 : 0) as Object as boolean;
          });
            expect().assertFail();
          } catch (e) {
            expect(e.name).assertEqual('ClassCastError');
          }
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART03_2400
         * @tc.name int32ArrayFindLastIndexPart03Test024
         * @tc.desc Verify predicate returning empty string (falsy) returns -1
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart03Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([7, 8, 9]);
          try {
            arr.findLastIndex((v: number, i: int, a: Int32Array): boolean => {
            return '' as Object as boolean;
          });
            expect().assertFail();
          } catch (e) {
            expect(e.name).assertEqual('ClassCastError');
          }
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART03_2500
         * @tc.name int32ArrayFindLastIndexPart03Test025
         * @tc.desc Verify predicate returning non-empty string hits last element
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart03Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([7, 8, 9]);
          try {
            arr.findLastIndex((v: number, i: int, a: Int32Array): boolean => {
            return 'yes' as Object as boolean;
          });
            expect().assertFail();
          } catch (e) {
            expect(e.name).assertEqual('ClassCastError');
          }
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART03_2600
         * @tc.name int32ArrayFindLastIndexPart03Test026
         * @tc.desc Verify predicate returning Number.NaN (falsy) returns -1
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart03Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2]);
          try {
            arr.findLastIndex((v: number, i: int, a: Int32Array): boolean => {
            return (v - v) as Object as boolean;
          });
            expect().assertFail();
          } catch (e) {
            expect(e.name).assertEqual('ClassCastError');
          }
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART03_2700
         * @tc.name int32ArrayFindLastIndexPart03Test027
         * @tc.desc Verify predicate returning Object (truthy) hits index
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart03Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3]);
          let sentinel: Object = new Object();
          try {
            arr.findLastIndex((v: number, i: int, a: Int32Array): boolean => {
            if (i === 1) { return sentinel as Object as boolean; }
            return false;
          });
            expect().assertFail();
          } catch (e) {
            expect(e.name).assertEqual('ClassCastError');
          }
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART03_2800
         * @tc.name int32ArrayFindLastIndexPart03Test028
         * @tc.desc Verify predicate returning null (falsy) returns -1
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart03Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3]);
          try {
            arr.findLastIndex((v: number, i: int, a: Int32Array): boolean => {
            return null as Object as boolean;
          });
            expect().assertFail();
          } catch (e) {
            expect(e.name).assertEqual('ClassCastError');
          }
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART03_2900
         * @tc.name int32ArrayFindLastIndexPart03Test029
         * @tc.desc Verify predicate returning empty array (truthy) hits index
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart03Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3]);
          let emptyArr: Object = new Array<number>();
          try {
            arr.findLastIndex((v: number, i: int, a: Int32Array): boolean => {
            if (i === 2) { return emptyArr as Object as boolean; }
            return false;
          });
            expect().assertFail();
          } catch (e) {
            expect(e.name).assertEqual('ClassCastError');
          }
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART03_3000
         * @tc.name int32ArrayFindLastIndexPart03Test030
         * @tc.desc Verify length=0 array returns -1 without calling predicate
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart03Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array(0);
          let called: boolean = false;
          let pred = (v: number, i: int, a: Int32Array): boolean => { called = true; return true; };
          let r: int = arr.findLastIndex(pred);
          expect(r).assertEqual(-1);
          expect(called).assertFalse();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART03_3100
         * @tc.name int32ArrayFindLastIndexPart03Test031
         * @tc.desc Verify empty ArrayBuffer(0) Int32Array returns -1
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart03Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let buf: ArrayBuffer = new ArrayBuffer(0);
          let arr: Int32Array = new Int32Array(buf);
          let pred = (v: number, i: int, a: Int32Array): boolean => { return true; };
          let r: int = arr.findLastIndex(pred);
          expect(r).assertEqual(-1);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART03_3200
         * @tc.name int32ArrayFindLastIndexPart03Test032
         * @tc.desc Verify empty subarray (begin=end) returns -1
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart03Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let orig: Int32Array = new Int32Array([1, 2, 3]);
          let sub: Int32Array = orig.subarray(1, 1);
          let pred = (v: number, i: int, a: Int32Array): boolean => { return true; };
          let r: int = sub.findLastIndex(pred);
          expect(r).assertEqual(-1);
          expect(sub.length).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART03_3300
         * @tc.name int32ArrayFindLastIndexPart03Test033
         * @tc.desc Verify length=0 array length unchanged after findLastIndex
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart03Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array(0);
          let pred = (v: number, i: int, a: Int32Array): boolean => { return false; };
          let r: int = arr.findLastIndex(pred);
          expect(r).assertEqual(-1);
          expect(arr.length).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART03_3400
         * @tc.name int32ArrayFindLastIndexPart03Test034
         * @tc.desc Verify length=1 matching element returns 0
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart03Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([42]);
          let pred = (v: number, i: int, a: Int32Array): boolean => { return v === 42; };
          let r: int = arr.findLastIndex(pred);
          expect(r).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART03_3500
         * @tc.name int32ArrayFindLastIndexPart03Test035
         * @tc.desc Verify length=1 non-matching returns -1
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart03Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([42]);
          let pred = (v: number, i: int, a: Int32Array): boolean => { return v === 99; };
          let r: int = arr.findLastIndex(pred);
          expect(r).assertEqual(-1);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART03_3600
         * @tc.name int32ArrayFindLastIndexPart03Test036
         * @tc.desc Verify length=1 predicate called once with i=0
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart03Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([77]);
          let callCount: int = 0;
          let seenI: int = -999;
          let seenV: number = -1;
          let pred = (v: number, i: int, a: Int32Array): boolean => {
          callCount = callCount + 1;
          seenI = i;
          seenV = v;
          return true;
          };
          arr.findLastIndex(pred);
          expect(callCount).assertEqual(1);
          expect(seenI).assertEqual(0);
          expect(seenV).assertEqual(77);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART03_3700
         * @tc.name int32ArrayFindLastIndexPart03Test037
         * @tc.desc Verify length=1 zero element matches and returns 0
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart03Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([0]);
          let pred = (v: number, i: int, a: Int32Array): boolean => { return v === 0; };
          let r: int = arr.findLastIndex(pred);
          expect(r).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART03_3800
         * @tc.name int32ArrayFindLastIndexPart03Test038
         * @tc.desc Verify length=1 negative one matches returns 0
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart03Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([-1]);
          let pred = (v: number, i: int, a: Int32Array): boolean => { return v === -1; };
          let r: int = arr.findLastIndex(pred);
          expect(r).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART03_3900
         * @tc.name int32ArrayFindLastIndexPart03Test039
         * @tc.desc Verify all-zero array returns last index
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart03Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([0, 0, 0, 0, 0]);
          let pred = (v: number, i: int, a: Int32Array): boolean => { return v === 0; };
          let r: int = arr.findLastIndex(pred);
          expect(r).assertEqual(4);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART03_4000
         * @tc.name int32ArrayFindLastIndexPart03Test040
         * @tc.desc Verify all -1 array returns last index short-circuit 1 call
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart03Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([-1, -1, -1]);
          let cc: int = 0;
          let pred = (v: number, i: int, a: Int32Array): boolean => { cc = cc + 1; return v === -1; };
          let r: int = arr.findLastIndex(pred);
          expect(r).assertEqual(2);
          expect(cc).assertEqual(1);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART03_4100
         * @tc.name int32ArrayFindLastIndexPart03Test041
         * @tc.desc Verify all MAX_INT32 array returns last index
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart03Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([2147483647, 2147483647]);
          let pred = (v: number, i: int, a: Int32Array): boolean => { return v === 2147483647; };
          let r: int = arr.findLastIndex(pred);
          expect(r).assertEqual(1);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART03_4200
         * @tc.name int32ArrayFindLastIndexPart03Test042
         * @tc.desc Verify all MIN_INT32 array returns last index
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart03Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([-2147483648, -2147483648, -2147483648]);
          let pred = (v: number, i: int, a: Int32Array): boolean => { return v === -2147483648; };
          let r: int = arr.findLastIndex(pred);
          expect(r).assertEqual(2);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART03_4300
         * @tc.name int32ArrayFindLastIndexPart03Test043
         * @tc.desc Verify two same elements returns last index short-circuit 1 call
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart03Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([5, 5]);
          let cc: int = 0;
          let pred = (v: number, i: int, a: Int32Array): boolean => { cc = cc + 1; return v === 5; };
          let r: int = arr.findLastIndex(pred);
          expect(r).assertEqual(1);
          expect(cc).assertEqual(1);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART03_4400
         * @tc.name int32ArrayFindLastIndexPart03Test044
         * @tc.desc Verify always-false predicate returns -1 and calls length times
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart03Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 1, 1, 1]);
          let cc: int = 0;
          let pred = (v: number, i: int, a: Int32Array): boolean => { cc = cc + 1; return false; };
          let r: int = arr.findLastIndex(pred);
          expect(r).assertEqual(-1);
          expect(cc).assertEqual(4);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART03_4500
         * @tc.name int32ArrayFindLastIndexPart03Test045
         * @tc.desc Verify only first element matches returns 0 with length calls
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart03Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([77, 1, 2, 3, 4]);
          let cc: int = 0;
          let pred = (v: number, i: int, a: Int32Array): boolean => { cc = cc + 1; return v === 77; };
          let r: int = arr.findLastIndex(pred);
          expect(r).assertEqual(0);
          expect(cc).assertEqual(5);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART03_4600
         * @tc.name int32ArrayFindLastIndexPart03Test046
         * @tc.desc Verify no match returns -1 with length calls
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart03Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3, 4, 5]);
          let cc: int = 0;
          let pred = (v: number, i: int, a: Int32Array): boolean => { cc = cc + 1; return v === 999; };
          let r: int = arr.findLastIndex(pred);
          expect(r).assertEqual(-1);
          expect(cc).assertEqual(5);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART03_4700
         * @tc.name int32ArrayFindLastIndexPart03Test047
         * @tc.desc Verify only last element matches returns length-1 with 1 call
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart03Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3, 4, 88]);
          let cc: int = 0;
          let pred = (v: number, i: int, a: Int32Array): boolean => { cc = cc + 1; return v === 88; };
          let r: int = arr.findLastIndex(pred);
          expect(r).assertEqual(4);
          expect(cc).assertEqual(1);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART03_4800
         * @tc.name int32ArrayFindLastIndexPart03Test048
         * @tc.desc Verify four element reverse visit order 3,2,1,0
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart03Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([10, 20, 30, 40]);
          let idxs: number[] = [];
          let pred = (v: number, i: int, a: Int32Array): boolean => { idxs.push(i); return false; };
          arr.findLastIndex(pred);
          expect(idxs.length).assertEqual(4);
          expect(idxs[0]).assertEqual(3);
          expect(idxs[1]).assertEqual(2);
          expect(idxs[2]).assertEqual(1);
          expect(idxs[3]).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART03_4900
         * @tc.name int32ArrayFindLastIndexPart03Test049
         * @tc.desc Verify middle element matches visits last and middle only
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart03Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 7, 3]);
          let idxs: number[] = [];
          let pred = (v: number, i: int, a: Int32Array): boolean => { idxs.push(i); return v === 7; };
          let r: int = arr.findLastIndex(pred);
          expect(r).assertEqual(1);
          expect(idxs.length).assertEqual(2);
          expect(idxs[0]).assertEqual(2);
          expect(idxs[1]).assertEqual(1);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART03_5000
         * @tc.name int32ArrayFindLastIndexPart03Test050
         * @tc.desc Verify third callback arg references same Int32Array
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart03Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3]);
          let same: boolean = false;
          let pred = (v: number, i: int, a: Int32Array): boolean => { same = (a === arr); return true; };
          arr.findLastIndex(pred);
          expect(same).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART03_5100
         * @tc.name int32ArrayFindLastIndexPart03Test051
         * @tc.desc Verify callback third arg length stays constant during traversal
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart03Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3, 4]);
          let ok: boolean = true;
          let pred = (v: number, i: int, a: Int32Array): boolean => {
          if (a.length !== 4) { ok = false; }
          return i === 0;
          };
          arr.findLastIndex(pred);
          expect(ok).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART03_5200
         * @tc.name int32ArrayFindLastIndexPart03Test052
         * @tc.desc Verify value equals a[i] at each callback
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart03Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([10, 20, 30]);
          let ok: boolean = true;
          let pred = (v: number, i: int, a: Int32Array): boolean => {
          if (v !== a.$_get(i)) { ok = false; }
          return false;
          };
          arr.findLastIndex(pred);
          expect(ok).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART03_5300
         * @tc.name int32ArrayFindLastIndexPart03Test053
         * @tc.desc Verify typeof index is number
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart03Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2]);
          let t: string = '';
          let pred = (v: number, i: int, a: Int32Array): boolean => { t = typeof i; return true; };
          arr.findLastIndex(pred);
          expect(t).assertEqual('int');
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART03_5400
         * @tc.name int32ArrayFindLastIndexPart03Test054
         * @tc.desc Verify typeof value is number
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart03Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1]);
          let t: string = '';
          let pred = (v: number, i: int, a: Int32Array): boolean => { t = typeof v; return true; };
          arr.findLastIndex(pred);
          expect(t).assertEqual('number');
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART03_5500
         * @tc.name int32ArrayFindLastIndexPart03Test055
         * @tc.desc Verify subarray callback third arg is subarray itself
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart03Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([0, 1, 2, 3, 4]);
          let sub: Int32Array = arr.subarray(2, 5);
          let len: int = -1;
          let pred = (v: number, i: int, a: Int32Array): boolean => { len = a.length; return true; };
          sub.findLastIndex(pred);
          expect(len).assertEqual(3);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART03_5600
         * @tc.name int32ArrayFindLastIndexPart03Test056
         * @tc.desc Verify mutating matched element during callback still returns that index
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart03Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 7]);
          let pred = (v: number, i: int, a: Int32Array): boolean => {
          a.$_set(i, 0);
          return v === 7;
          };
          let r: int = arr.findLastIndex(pred);
          expect(r).assertEqual(2);
          expect(arr.$_get(2)).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART03_5700
         * @tc.name int32ArrayFindLastIndexPart03Test057
         * @tc.desc Verify mutating already-visited right-side elements does not change return
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart03Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([0, 0, 0, 0]);
          let pred = (v: number, i: int, a: Int32Array): boolean => {
          if (i < a.length - 1) { a.$_set(i + 1, 99); }
          return i === 0;
          };
          let r: int = arr.findLastIndex(pred);
          expect(r).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART03_5800
         * @tc.name int32ArrayFindLastIndexPart03Test058
         * @tc.desc Verify reverse visit order logs i:v pairs
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart03Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([10, 20, 30]);
          let log: string = '';
          let pred = (v: number, i: int, a: Int32Array): boolean => {
          log = log + i.toString() + ':' + v.toString() + ',';
          return false;
          };
          arr.findLastIndex(pred);
          expect(log).assertEqual('2:30,1:20,0:10,');
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART03_5900
         * @tc.name int32ArrayFindLastIndexPart03Test059
         * @tc.desc Verify mutating unvisited left element to match hits it later
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart03Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([0, 0, 0, 0]);
          let pred = (v: number, i: int, a: Int32Array): boolean => {
          if (i > 0) { a.$_set(i - 1, 1); }
          return v === 1;
          };
          let r: int = arr.findLastIndex(pred);
          expect(r).assertEqual(2);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART03_6000
         * @tc.name int32ArrayFindLastIndexPart03Test060
         * @tc.desc Verify Number.NaN converts to 0 via ToInt32, v!==v returns -1
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart03Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, Double.NaN, 3, Double.NaN] as FixedArray<number>);
          let pred = (v: number, i: int, a: Int32Array): boolean => { return v !== v; };
          let r: int = arr.findLastIndex(pred);
          expect(r).assertEqual(-1);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART03_6100
         * @tc.name int32ArrayFindLastIndexPart03Test061
         * @tc.desc Verify no Number.NaN with v!==v predicate returns -1
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart03Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3]);
          let pred = (v: number, i: int, a: Int32Array): boolean => { return v !== v; };
          let r: int = arr.findLastIndex(pred);
          expect(r).assertEqual(-1);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART03_6200
         * @tc.name int32ArrayFindLastIndexPart03Test062
         * @tc.desc Verify (v === 0 && 1 / v === Double.NEGATIVE_INFINITY) on Int32 zeros returns -1 (no -0 in int32)
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart03Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([0, 0, 0]);
          let pred = (v: number, i: int, a: Int32Array): boolean => { return (v === 0 && 1 / v === Double.NEGATIVE_INFINITY); };
          let r: int = arr.findLastIndex(pred);
          expect(r).assertEqual(-1);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART03_6300
         * @tc.name int32ArrayFindLastIndexPart03Test063
         * @tc.desc Verify Number.POSITIVE_INFINITY ToInt32 is 0, predicate matches 0
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart03Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([Double.POSITIVE_INFINITY, 7] as FixedArray<number>);
          let pred = (v: number, i: int, a: Int32Array): boolean => { return v === 0; };
          let r: int = arr.findLastIndex(pred);
          expect(r).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART03_6400
         * @tc.name int32ArrayFindLastIndexPart03Test064
         * @tc.desc Verify Double.NEGATIVE_INFINITY ToInt32 is 0, matches single element
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart03Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([Double.NEGATIVE_INFINITY] as FixedArray<number>);
          let pred = (v: number, i: int, a: Int32Array): boolean => { return v === 0; };
          let r: int = arr.findLastIndex(pred);
          expect(r).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART03_6500
         * @tc.name int32ArrayFindLastIndexPart03Test065
         * @tc.desc Verify MAX_INT32+1 overflows to MIN_INT32
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart03Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([2147483647, 2147483648, 5] as FixedArray<number>);
          let pred = (v: number, i: int, a: Int32Array): boolean => { return v === -2147483648; };
          let r: int = arr.findLastIndex(pred);
          expect(r).assertEqual(1);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART03_6600
         * @tc.name int32ArrayFindLastIndexPart03Test066
         * @tc.desc Verify 3.9 ToInt32 truncates to 3
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart03Test066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([3.9, 5] as FixedArray<number>);
          let pred = (v: number, i: int, a: Int32Array): boolean => { return v === 3; };
          let r: int = arr.findLastIndex(pred);
          expect(r).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART03_6700
         * @tc.name int32ArrayFindLastIndexPart03Test067
         * @tc.desc Verify -3.5 ToInt32 truncates to -3
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart03Test067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([-3.5, 10] as FixedArray<number>);
          let pred = (v: number, i: int, a: Int32Array): boolean => { return v === -3; };
          let r: int = arr.findLastIndex(pred);
          expect(r).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART03_6800
         * @tc.name int32ArrayFindLastIndexPart03Test068
         * @tc.desc Verify no match returns strictly -1
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart03Test068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2]);
          let pred = (v: number, i: int, a: Int32Array): boolean => { return false; };
          let r: int = arr.findLastIndex(pred);
          expect(r).assertEqual(-1);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART03_6900
         * @tc.name int32ArrayFindLastIndexPart03Test069
         * @tc.desc Verify matching first element returns 0
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart03Test069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([5, 6, 7]);
          let pred = (v: number, i: int, a: Int32Array): boolean => { return v === 5; };
          let r: int = arr.findLastIndex(pred);
          expect(r).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART03_7000
         * @tc.name int32ArrayFindLastIndexPart03Test070
         * @tc.desc Verify matching last element returns length-1
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart03Test070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([10, 20, 30, 40]);
          let pred = (v: number, i: int, a: Int32Array): boolean => { return v === 40; };
          let r: int = arr.findLastIndex(pred);
          expect(r).assertEqual(arr.length - 1);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART03_7100
         * @tc.name int32ArrayFindLastIndexPart03Test071
         * @tc.desc Verify read-only traversal preserves original elements
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart03Test071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([3, 1, 4, 1, 5]);
          let b0: number = arr.$_get(0);
          let b1: number = arr.$_get(1);
          let b2: number = arr.$_get(2);
          let b3: number = arr.$_get(3);
          let b4: number = arr.$_get(4);
          let pred = (v: number, i: int, a: Int32Array): boolean => { return v === 4; };
          arr.findLastIndex(pred);
          expect(arr.$_get(0)).assertEqual(b0);
          expect(arr.$_get(1)).assertEqual(b1);
          expect(arr.$_get(2)).assertEqual(b2);
          expect(arr.$_get(3)).assertEqual(b3);
          expect(arr.$_get(4)).assertEqual(b4);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART03_7200
         * @tc.name int32ArrayFindLastIndexPart03Test072
         * @tc.desc Verify length unchanged after findLastIndex
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart03Test072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3]);
          let lenBefore: int = arr.length;
          let pred = (v: number, i: int, a: Int32Array): boolean => { return v === 2; };
          arr.findLastIndex(pred);
          expect(arr.length).assertEqual(lenBefore);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART03_7300
         * @tc.name int32ArrayFindLastIndexPart03Test073
         * @tc.desc Verify overlapping shared buffer view mutation visible
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart03Test073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let buf: ArrayBuffer = new ArrayBuffer(16);
          let a1: Int32Array = new Int32Array(buf);
          a1.$_set(0, 1);
          a1.$_set(1, 2);
          a1.$_set(2, 3);
          a1.$_set(3, 4);
          let a2: Int32Array = new Int32Array(buf, 4, 3);
          let seen: number[] = [];
          let pred = (v: number, i: int, a: Int32Array): boolean => {
          seen.push(v);
          if (i === 1) { a2.$_set(0, 99); }
          return false;
          };
          a2.findLastIndex(pred);
          expect(seen.length).assertEqual(3);
          expect(seen[0]).assertEqual(4);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART03_7400
         * @tc.name int32ArrayFindLastIndexPart03Test074
         * @tc.desc Verify read-only traversal preserves underlying buffer
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart03Test074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let buf: ArrayBuffer = new ArrayBuffer(12);
          let a: Int32Array = new Int32Array(buf);
          a.$_set(0, 7);
          a.$_set(1, 8);
          a.$_set(2, 9);
          let pred = (v: number, i: int, arr: Int32Array): boolean => { return v === 8; };
          a.findLastIndex(pred);
          expect(a.$_get(0)).assertEqual(7);
          expect(a.$_get(1)).assertEqual(8);
          expect(a.$_get(2)).assertEqual(9);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART03_7500
         * @tc.name int32ArrayFindLastIndexPart03Test075
         * @tc.desc Verify length=100 match at 50 returns 50 with 50 calls
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart03Test075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let len: int = 100;
          let arr: Int32Array = new Int32Array(len);
          for (let k: int = 0; k < len; k = k + 1) { arr.$_set(k, k); }
          let calls: int = 0;
          let pred = (v: number, i: int, a: Int32Array): boolean => { calls = calls + 1; return v === 50; };
          let r: int = arr.findLastIndex(pred);
          expect(r).assertEqual(50);
          expect(calls).assertEqual(50);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART03_7600
         * @tc.name int32ArrayFindLastIndexPart03Test076
         * @tc.desc Verify length=100 match at 99 returns 99 with 1 call
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart03Test076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array(100);
          let calls: int = 0;
          let pred = (v: number, i: int, a: Int32Array): boolean => { calls = calls + 1; return i === 99; };
          let r: int = arr.findLastIndex(pred);
          expect(r).assertEqual(99);
          expect(calls).assertEqual(1);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART03_7700
         * @tc.name int32ArrayFindLastIndexPart03Test077
         * @tc.desc Verify length=100 match at 0 returns 0 with 100 calls
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart03Test077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array(100);
          let calls: int = 0;
          let pred = (v: number, i: int, a: Int32Array): boolean => { calls = calls + 1; return i === 0; };
          let r: int = arr.findLastIndex(pred);
          expect(r).assertEqual(0);
          expect(calls).assertEqual(100);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART03_7800
         * @tc.name int32ArrayFindLastIndexPart03Test078
         * @tc.desc Verify findLastIndex works on slice copy
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart03Test078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let orig: Int32Array = new Int32Array([1, 2, 3]);
          let cp: Int32Array = orig.slice();
          let pred = (v: number, i: int, a: Int32Array): boolean => { return v === 2; };
          let r: int = cp.findLastIndex(pred);
          expect(r).assertEqual(1);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART03_7900
         * @tc.name int32ArrayFindLastIndexPart03Test079
         * @tc.desc Verify ArrayBuffer(byteOffset=0,length) view works
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart03Test079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let buf: ArrayBuffer = new ArrayBuffer(12);
          let arr: Int32Array = new Int32Array(buf, 0, 3);
          arr.$_set(0, 5);
          arr.$_set(1, 6);
          arr.$_set(2, 7);
          let pred = (v: number, i: int, a: Int32Array): boolean => { return v === 6; };
          let r: int = arr.findLastIndex(pred);
          expect(r).assertEqual(1);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART03_8000
         * @tc.name int32ArrayFindLastIndexPart03Test080
         * @tc.desc Verify nested findLastIndex (reentrant) does not crash
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart03Test080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3]);
          let depth: int = 0;
          let pred = (v: number, i: int, a: Int32Array): boolean => {
          depth = depth + 1;
          if (depth === 1) {
          let inner = (x: number, j: int, b: Int32Array): boolean => { return x === 2; };
          let innerR: int = a.findLastIndex(inner);
          expect(innerR).assertEqual(1);
          }
          return i === 2;
          };
          let r: int = arr.findLastIndex(pred);
          expect(r).assertEqual(2);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART03_8100
         * @tc.name int32ArrayFindLastIndexPart03Test081
         * @tc.desc Verify always-true predicate returns length-1 in 1 call
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart03Test081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([10, 20, 30, 40]);
          let cc: int = 0;
          let pred = (v: number, i: int, a: Int32Array): boolean => { cc = cc + 1; return true; };
          let r: int = arr.findLastIndex(pred);
          expect(r).assertEqual(3);
          expect(cc).assertEqual(1);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART03_8200
         * @tc.name int32ArrayFindLastIndexPart03Test082
         * @tc.desc Verify always-false predicate returns -1 with length calls
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart03Test082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([10, 20]);
          let cc: int = 0;
          let pred = (v: number, i: int, a: Int32Array): boolean => { cc = cc + 1; return false; };
          let r: int = arr.findLastIndex(pred);
          expect(r).assertEqual(-1);
          expect(cc).assertEqual(2);
        });
  });
}
