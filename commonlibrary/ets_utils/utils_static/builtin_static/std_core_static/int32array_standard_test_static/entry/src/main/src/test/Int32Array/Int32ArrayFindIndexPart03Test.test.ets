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
class MyFindIndexPart03CustomErr extends Error {
  constructor(message: string) {
    super(message);
    this.name = 'MyCustomError';
  }
}
export default function int32ArrayFindIndexPart03TestMindmapTestTest(): void {
  describe('Int32ArrayFindIndexPart03TestMindmapTestTest', (): void => {
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
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_INDEX_PART03_TEST_MINDMAP_0010
         * @tc.name int32ArrayFindIndexPart03TestMindmapTest001
         * @tc.desc Verify null predicate TypeError
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart03TestMindmapTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3]);
          try {
            arr.findIndex(null as Object as (v: number, i: int, a: Int32Array) => boolean);
            expect().assertFail();
          } catch (e) {
            expect(e.name).assertEqual('ClassCastError');
          }
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_INDEX_PART03_TEST_MINDMAP_0020
         * @tc.name int32ArrayFindIndexPart03TestMindmapTest002
         * @tc.desc Verify undefined predicate throws ClassCastError
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart03TestMindmapTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3]);
          try {
            arr.findIndex(undefined as Object as (v: number, i: int, a: Int32Array) => boolean);
            expect().assertFail();
          } catch (e) {
            expect(e.name).assertEqual('ClassCastError');
          }
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_INDEX_PART03_TEST_MINDMAP_0030
         * @tc.name int32ArrayFindIndexPart03TestMindmapTest003
         * @tc.desc Verify 0 predicate TypeError
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart03TestMindmapTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1]);
          try {
            arr.findIndex(0 as Object as (v: number, i: int, a: Int32Array) => boolean);
            expect().assertFail();
          } catch (e) {
            expect(e.name).assertEqual('ClassCastError');
          }
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_INDEX_PART03_TEST_MINDMAP_0040
         * @tc.name int32ArrayFindIndexPart03TestMindmapTest004
         * @tc.desc Verify Number.NaN predicate TypeError
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart03TestMindmapTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1]);
          try {
            arr.findIndex(Double.NaN as Object as (v: number, i: int, a: Int32Array) => boolean);
            expect().assertFail();
          } catch (e) {
            expect(e.name).assertEqual('ClassCastError');
          }
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_INDEX_PART03_TEST_MINDMAP_0050
         * @tc.name int32ArrayFindIndexPart03TestMindmapTest005
         * @tc.desc Verify true predicate TypeError
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart03TestMindmapTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2]);
          try {
            arr.findIndex(true as Object as (v: number, i: int, a: Int32Array) => boolean);
            expect().assertFail();
          } catch (e) {
            expect(e.name).assertEqual('ClassCastError');
          }
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_INDEX_PART03_TEST_MINDMAP_0060
         * @tc.name int32ArrayFindIndexPart03TestMindmapTest006
         * @tc.desc Verify "predicate" predicate TypeError
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart03TestMindmapTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2]);
          try {
            arr.findIndex('predicate' as Object as (v: number, i: int, a: Int32Array) => boolean);
            expect().assertFail();
          } catch (e) {
            expect(e.name).assertEqual('ClassCastError');
          }
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_INDEX_PART03_TEST_MINDMAP_0070
         * @tc.name int32ArrayFindIndexPart03TestMindmapTest007
         * @tc.desc Verify predicate TypeError
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart03TestMindmapTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1]);
          try {
            arr.findIndex('' as Object as (v: number, i: int, a: Int32Array) => boolean);
            expect().assertFail();
          } catch (e) {
            expect(e.name).assertEqual('ClassCastError');
          }
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_INDEX_PART03_TEST_MINDMAP_0080
         * @tc.name int32ArrayFindIndexPart03TestMindmapTest008
         * @tc.desc Verify Object predicate TypeError
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart03TestMindmapTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1]);
          try {
            let obj: Object = new Object();
            arr.findIndex(obj as Object as (v: number, i: int, a: Int32Array) => boolean);
            expect().assertFail();
          } catch (e) {
            expect(e.name).assertEqual('ClassCastError');
          }
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_INDEX_PART03_TEST_MINDMAP_0090
         * @tc.name int32ArrayFindIndexPart03TestMindmapTest009
         * @tc.desc Verify Array predicate TypeError
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart03TestMindmapTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1]);
          try {
            let fake: Object = new Array<number>();
            arr.findIndex(fake as Object as (v: number, i: int, a: Int32Array) => boolean);
            expect().assertFail();
          } catch (e) {
            expect(e.name).assertEqual('ClassCastError');
          }
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_INDEX_PART03_TEST_MINDMAP_0100
         * @tc.name int32ArrayFindIndexPart03TestMindmapTest010
         * @tc.desc Verify Int32Array predicate TypeError
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart03TestMindmapTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2]);
          try {
            let other: Int32Array = new Int32Array([3, 4]);
            arr.findIndex(other as Object as (v: number, i: int, a: Int32Array) => boolean);
            expect().assertFail();
          } catch (e) {
            expect(e.name).assertEqual('ClassCastError');
          }
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_INDEX_PART03_TEST_MINDMAP_0110
         * @tc.name int32ArrayFindIndexPart03TestMindmapTest011
         * @tc.desc Verify ArrayBuffer predicate TypeError
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart03TestMindmapTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1]);
          try {
            let buf: Object = new ArrayBuffer(4);
            arr.findIndex(buf as Object as (v: number, i: int, a: Int32Array) => boolean);
            expect().assertFail();
          } catch (e) {
            expect(e.name).assertEqual('ClassCastError');
          }
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_INDEX_PART03_TEST_MINDMAP_0120
         * @tc.name int32ArrayFindIndexPart03TestMindmapTest012
         * @tc.desc Verify predicate throw new Error
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart03TestMindmapTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([10, 20, 30]);
          try {
            arr.findIndex((v: number, i: int): boolean => {
            throw new Error('first-element');
          });
            expect().assertFail();
          } catch (e) {
            expect(e.name).assertEqual('Error');
          }
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_INDEX_PART03_TEST_MINDMAP_0130
         * @tc.name int32ArrayFindIndexPart03TestMindmapTest013
         * @tc.desc Verify predicate
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart03TestMindmapTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3]);
          let visitedFirst: boolean = false;
          try {
            arr.findIndex((v: number, i: int): boolean => {
            if (i === 0) {
            visitedFirst = true;
            return false;
            }
            throw new Error('second');
          });
            expect().assertFail();
          } catch (e) {
            expect(e.name).assertEqual('Error');
          }
          expect(visitedFirst).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_INDEX_PART03_TEST_MINDMAP_0140
         * @tc.name int32ArrayFindIndexPart03TestMindmapTest014
         * @tc.desc Verify predicate index=2 index+1
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart03TestMindmapTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([10, 20, 30, 40, 50]);
          let count: int = 0;
          try {
            arr.findIndex((v: number, i: int): boolean => {
            count = count + 1;
            if (i === 2) {
            throw new Error('mid');
            }
            return false;
          });
            expect().assertFail();
          } catch (e) {
            expect(e.name).assertEqual('Error');
          }
          expect(count).assertEqual(3);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_INDEX_PART03_TEST_MINDMAP_0150
         * @tc.name int32ArrayFindIndexPart03TestMindmapTest015
         * @tc.desc Verify predicate callCount===length
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart03TestMindmapTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3, 4]);
          let count: int = 0;
          try {
            arr.findIndex((v: number, i: int, a: Int32Array): boolean => {
            count = count + 1;
            if (i === a.length - 1) {
            throw new Error('last');
            }
            return false;
          });
            expect().assertFail();
          } catch (e) {
            expect(e.name).assertEqual('Error');
          }
          expect(count).assertEqual(arr.length);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_INDEX_PART03_TEST_MINDMAP_0160
         * @tc.name int32ArrayFindIndexPart03TestMindmapTest016
         * @tc.desc Verify predicate RangeError name RangeError
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart03TestMindmapTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1]);
          try {
            arr.findIndex((v: number, i: int): boolean => {
            throw new RangeError('out of range');
          });
            expect().assertFail();
          } catch (e) {
            expect(e.name).assertEqual('RangeError');
          }
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_INDEX_PART03_TEST_MINDMAP_0170
         * @tc.name int32ArrayFindIndexPart03TestMindmapTest017
         * @tc.desc Verify predicate TypeError name TypeError
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart03TestMindmapTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1]);
          try {
            arr.findIndex((v: number, i: int): boolean => {
            throw new TypeError('type bad');
          });
            expect().assertFail();
          } catch (e) {
            expect(e.name).assertEqual('TypeError');
          }
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_INDEX_PART03_TEST_MINDMAP_0180
         * @tc.name int32ArrayFindIndexPart03TestMindmapTest018
         * @tc.desc Verify predicate SyntaxError
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart03TestMindmapTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1]);
          try {
            arr.findIndex((v: number, i: int): boolean => {
            throw new SyntaxError('syntax');
          });
            expect().assertFail();
          } catch (e) {
            expect(e.name).assertEqual('SyntaxError');
          }
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_INDEX_PART03_TEST_MINDMAP_0190
         * @tc.name int32ArrayFindIndexPart03TestMindmapTest019
         * @tc.desc Verify predicate ReferenceError
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart03TestMindmapTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1]);
          try {
            arr.findIndex((v: number, i: int): boolean => {
            throw new ReferenceError('ref');
          });
            expect().assertFail();
          } catch (e) {
            expect(e.name).assertEqual('ReferenceError');
          }
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_INDEX_PART03_TEST_MINDMAP_0200
         * @tc.name int32ArrayFindIndexPart03TestMindmapTest020
         * @tc.desc Verify predicate Error
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart03TestMindmapTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1]);
          try {
            arr.findIndex((v: number, i: int): boolean => {
            throw new MyFindIndexPart03CustomErr('custom');
          });
            expect().assertFail();
          } catch (e) {
            expect(e.name).assertEqual('MyCustomError');
          }
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_INDEX_PART03_TEST_MINDMAP_0210
         * @tc.name int32ArrayFindIndexPart03TestMindmapTest021
         * @tc.desc Verify predicate length
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart03TestMindmapTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([10, 20, 30]);
          let lenBefore: int = arr.length;
          try {
            arr.findIndex((v: number, i: int): boolean => {
            throw new Error('oops');
          });
            expect().assertFail();
          } catch (e) {
            expect(e.name).assertEqual('Error');
          }
          expect(arr.length).assertEqual(lenBefore);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_INDEX_PART03_TEST_MINDMAP_0220
         * @tc.name int32ArrayFindIndexPart03TestMindmapTest022
         * @tc.desc Verify predicate
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart03TestMindmapTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([7, 8, 9]);
          try {
            arr.findIndex((v: number, i: int): boolean => {
            throw new Error('x');
          });
            expect().assertFail();
          } catch (e) {
            expect(e.name).assertEqual('Error');
          }
          expect(arr.$_get(0)).assertEqual(7);
          expect(arr.$_get(1)).assertEqual(8);
          expect(arr.$_get(2)).assertEqual(9);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_INDEX_PART03_TEST_MINDMAP_0230
         * @tc.name int32ArrayFindIndexPart03TestMindmapTest023
         * @tc.desc Verify predicate -1
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart03TestMindmapTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array(0);
          let called: boolean = false;
          let result: int = arr.findIndex((v: number, i: int): boolean => {
            called = true;
            return false;
          });
          expect(called).assertFalse();
          expect(result).assertEqual(-1);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_INDEX_PART03_TEST_MINDMAP_0240
         * @tc.name int32ArrayFindIndexPart03TestMindmapTest024
         * @tc.desc Verify predicate
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart03TestMindmapTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([77]);
          try {
            arr.findIndex((v: number, i: int): boolean => {
            throw new Error('single');
          });
            expect().assertFail();
          } catch (e) {
            expect(e.name).assertEqual('Error');
          }
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_INDEX_PART03_TEST_MINDMAP_0250
         * @tc.name int32ArrayFindIndexPart03TestMindmapTest025
         * @tc.desc Verify predicate false -1
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart03TestMindmapTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3, 4]);
          let result: int = -999;
          try {
            result = arr.findIndex((v: number, i: int): boolean => {
            if (v === 3) {
            throw new Error('stop');
            }
            return false;
          });
            expect().assertFail();
          } catch (e) {
            expect(e.name).assertEqual('Error');
          }
          expect(result).assertEqual(-999);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_INDEX_PART03_TEST_MINDMAP_0260
         * @tc.name int32ArrayFindIndexPart03TestMindmapTest026
         * @tc.desc Verify returning non-boolean via cast throws ClassCastError
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart03TestMindmapTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3]);
          try {
            arr.findIndex((v: number, i: int): boolean => {
            return undefined as Object as boolean;
          });
            expect().assertFail();
          } catch (e) {
            expect(e.name).assertEqual('ClassCastError');
          }
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_INDEX_PART03_TEST_MINDMAP_0270
         * @tc.name int32ArrayFindIndexPart03TestMindmapTest027
         * @tc.desc Verify returning undefined via cast throws ClassCastError (non-last element)
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart03TestMindmapTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([10, 20, 30]);
          try {
            arr.findIndex((v: number, i: int, a: Int32Array): boolean => {
            if (i === a.length - 1) {
            return true;
            }
            return undefined as Object as boolean;
          });
            expect().assertFail();
          } catch (e) {
            expect(e.name).assertEqual('ClassCastError');
          }
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_INDEX_PART03_TEST_MINDMAP_0280
         * @tc.name int32ArrayFindIndexPart03TestMindmapTest028
         * @tc.desc Verify returning undefined via cast at first element throws ClassCastError (multi-element)
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart03TestMindmapTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3, 4]);
          let firstVisited: boolean = false;
          try {
            arr.findIndex((v: number, i: int): boolean => {
            if (i === 0) {
            firstVisited = true;
            return undefined as Object as boolean;
            }
            return v === 3;
          });
            expect().assertFail();
          } catch (e) {
            expect(e.name).assertEqual('ClassCastError');
          }
          expect(firstVisited).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_INDEX_PART03_TEST_MINDMAP_0290
         * @tc.name int32ArrayFindIndexPart03TestMindmapTest029
         * @tc.desc Verify 0 falsy -1
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart03TestMindmapTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3]);
          try {
            arr.findIndex((v: number, i: int): boolean => {
            return 0 as Object as boolean;
          });
            expect().assertFail();
          } catch (e) {
            expect(e.name).assertEqual('ClassCastError');
          }
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_INDEX_PART03_TEST_MINDMAP_0300
         * @tc.name int32ArrayFindIndexPart03TestMindmapTest030
         * @tc.desc Verify 1 truthy 0
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart03TestMindmapTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([10, 20, 30]);
          try {
            arr.findIndex((v: number, i: int): boolean => {
            return 1 as Object as boolean;
          });
            expect().assertFail();
          } catch (e) {
            expect(e.name).assertEqual('ClassCastError');
          }
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_INDEX_PART03_TEST_MINDMAP_0310
         * @tc.name int32ArrayFindIndexPart03TestMindmapTest031
         * @tc.desc Verify -1 truthy 0
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart03TestMindmapTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([5, 6, 7]);
          try {
            arr.findIndex((v: number, i: int): boolean => {
            return -1 as Object as boolean;
          });
            expect().assertFail();
          } catch (e) {
            expect(e.name).assertEqual('ClassCastError');
          }
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_INDEX_PART03_TEST_MINDMAP_0320
         * @tc.name int32ArrayFindIndexPart03TestMindmapTest032
         * @tc.desc Verify '' falsy -1
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart03TestMindmapTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3]);
          try {
            arr.findIndex((v: number, i: int): boolean => {
            return '' as Object as boolean;
          });
            expect().assertFail();
          } catch (e) {
            expect(e.name).assertEqual('ClassCastError');
          }
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_INDEX_PART03_TEST_MINDMAP_0330
         * @tc.name int32ArrayFindIndexPart03TestMindmapTest033
         * @tc.desc Verify 'yes' truthy 0
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart03TestMindmapTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2]);
          try {
            arr.findIndex((v: number, i: int): boolean => {
            return 'yes' as Object as boolean;
          });
            expect().assertFail();
          } catch (e) {
            expect(e.name).assertEqual('ClassCastError');
          }
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_INDEX_PART03_TEST_MINDMAP_0340
         * @tc.name int32ArrayFindIndexPart03TestMindmapTest034
         * @tc.desc Verify Number.NaN falsy -1
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart03TestMindmapTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([10, 20]);
          try {
            arr.findIndex((v: number, i: int): boolean => {
            return Double.NaN as Object as boolean;
          });
            expect().assertFail();
          } catch (e) {
            expect(e.name).assertEqual('ClassCastError');
          }
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_INDEX_PART03_TEST_MINDMAP_0350
         * @tc.name int32ArrayFindIndexPart03TestMindmapTest035
         * @tc.desc Verify null falsy -1
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart03TestMindmapTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3]);
          try {
            arr.findIndex((v: number, i: int): boolean => {
            return null as Object as boolean;
          });
            expect().assertFail();
          } catch (e) {
            expect(e.name).assertEqual('ClassCastError');
          }
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_INDEX_PART03_TEST_MINDMAP_0360
         * @tc.name int32ArrayFindIndexPart03TestMindmapTest036
         * @tc.desc Verify Number.MAX_SAFE_INTEGER truthy
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart03TestMindmapTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([0, 0, 0, 0]);
          try {
            arr.findIndex((v: number, i: int): boolean => {
            if (i === 2) {
            return 9007199254740991 as Object as boolean;
            }
            return false;
          });
            expect().assertFail();
          } catch (e) {
            expect(e.name).assertEqual('ClassCastError');
          }
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_INDEX_PART03_TEST_MINDMAP_0370
         * @tc.name int32ArrayFindIndexPart03TestMindmapTest037
         * @tc.desc Verify new Boolean(false) truthy 0
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart03TestMindmapTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2]);
          let result: int = arr.findIndex((v: number, i: int): boolean => {
          return new Boolean(false) as Object as boolean;
        });
          expect(result).assertEqual(-1);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_INDEX_PART03_TEST_MINDMAP_0380
         * @tc.name int32ArrayFindIndexPart03TestMindmapTest038
         * @tc.desc Verify length=0 predicate true -1
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart03TestMindmapTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array(0);
          let result: int = arr.findIndex((v: number, i: int): boolean => true);
          expect(result).assertEqual(-1);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_INDEX_PART03_TEST_MINDMAP_0390
         * @tc.name int32ArrayFindIndexPart03TestMindmapTest039
         * @tc.desc Verify length=0 predicate false -1
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart03TestMindmapTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array(0);
          let result: int = arr.findIndex((v: number, i: int): boolean => false);
          expect(result).assertEqual(-1);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_INDEX_PART03_TEST_MINDMAP_0400
         * @tc.name int32ArrayFindIndexPart03TestMindmapTest040
         * @tc.desc Verify length=0
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart03TestMindmapTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array(0);
          let callCount: int = 0;
          arr.findIndex((v: number, i: int): boolean => {
          callCount = callCount + 1;
          return true;
        });
          expect(callCount).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_INDEX_PART03_TEST_MINDMAP_0410
         * @tc.name int32ArrayFindIndexPart03TestMindmapTest041
         * @tc.desc Verify length=0 length 0
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart03TestMindmapTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array(0);
          arr.findIndex((v: number, i: int): boolean => true);
          expect(arr.length).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_INDEX_PART03_TEST_MINDMAP_0420
         * @tc.name int32ArrayFindIndexPart03TestMindmapTest042
         * @tc.desc Verify Int32Array.of() findIndex -1
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart03TestMindmapTest042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = Int32Array.of();
          let result: int = arr.findIndex((v: number, i: int): boolean => true);
          expect(result).assertEqual(-1);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_INDEX_PART03_TEST_MINDMAP_0430
         * @tc.name int32ArrayFindIndexPart03TestMindmapTest043
         * @tc.desc Verify ArrayBuffer(0) findIndex -1
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart03TestMindmapTest043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let buf: ArrayBuffer = new ArrayBuffer(0);
          let arr: Int32Array = new Int32Array(buf, 0, 0);
          let result: int = arr.findIndex((v: number, i: int): boolean => true);
          expect(result).assertEqual(-1);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_INDEX_PART03_TEST_MINDMAP_0440
         * @tc.name int32ArrayFindIndexPart03TestMindmapTest044
         * @tc.desc Verify subarray(begin===end) findIndex -1
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart03TestMindmapTest044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let parent: Int32Array = new Int32Array([1, 2, 3]);
          let empty: Int32Array = parent.subarray(1, 1);
          let called: boolean = false;
          let result: int = empty.findIndex((v: number, i: int): boolean => {
          called = true;
          return true;
        });
          expect(result).assertEqual(-1);
          expect(called).assertFalse();
          expect(empty.length).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_INDEX_PART03_TEST_MINDMAP_0450
         * @tc.name int32ArrayFindIndexPart03TestMindmapTest045
         * @tc.desc Verify slice(begin===end) findIndex -1
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart03TestMindmapTest045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3]);
          let empty: Int32Array = arr.slice(3, 3);
          let result: int = empty.findIndex((v: number, i: int): boolean => true);
          expect(result).assertEqual(-1);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_INDEX_PART03_TEST_MINDMAP_0460
         * @tc.name int32ArrayFindIndexPart03TestMindmapTest046
         * @tc.desc Verify predicate -1
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart03TestMindmapTest046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([42]);
          let result: int = arr.findIndex((v: number): boolean => v === 99);
          expect(result).assertEqual(-1);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_INDEX_PART03_TEST_MINDMAP_0470
         * @tc.name int32ArrayFindIndexPart03TestMindmapTest047
         * @tc.desc Verify 0 predicate 0
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart03TestMindmapTest047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([0]);
          let result: int = arr.findIndex((v: number): boolean => v === 0);
          expect(result).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_INDEX_PART03_TEST_MINDMAP_0480
         * @tc.name int32ArrayFindIndexPart03TestMindmapTest048
         * @tc.desc Verify -1 predicate 0
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart03TestMindmapTest048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([-1]);
          let result: int = arr.findIndex((v: number): boolean => v === -1);
          expect(result).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_INDEX_PART03_TEST_MINDMAP_0490
         * @tc.name int32ArrayFindIndexPart03TestMindmapTest049
         * @tc.desc Verify 1 predicate 0
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart03TestMindmapTest049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1]);
          let result: int = arr.findIndex((v: number): boolean => v === 1);
          expect(result).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_INDEX_PART03_TEST_MINDMAP_0500
         * @tc.name int32ArrayFindIndexPart03TestMindmapTest050
         * @tc.desc Verify int32 2147483647 predicate 0
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart03TestMindmapTest050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([2147483647]);
          let result: int = arr.findIndex((v: number): boolean => v === 2147483647);
          expect(result).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_INDEX_PART03_TEST_MINDMAP_0510
         * @tc.name int32ArrayFindIndexPart03TestMindmapTest051
         * @tc.desc Verify int32 -2147483648 predicate 0
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart03TestMindmapTest051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([-2147483648]);
          let result: int = arr.findIndex((v: number): boolean => v === -2147483648);
          expect(result).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_INDEX_PART03_TEST_MINDMAP_0520
         * @tc.name int32ArrayFindIndexPart03TestMindmapTest052
         * @tc.desc Verify predicate true 1
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart03TestMindmapTest052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([7]);
          let count: int = 0;
          arr.findIndex((v: number, i: int): boolean => {
          count = count + 1;
          return true;
        });
          expect(count).assertEqual(1);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_INDEX_PART03_TEST_MINDMAP_0530
         * @tc.name int32ArrayFindIndexPart03TestMindmapTest053
         * @tc.desc Verify ArrayBuffer predicate -1
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart03TestMindmapTest053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let buf: ArrayBuffer = new ArrayBuffer(4);
          let arr: Int32Array = new Int32Array(buf);
          arr.$_set(0, 55);
          let result: int = arr.findIndex((v: number): boolean => v === 77);
          expect(result).assertEqual(-1);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_INDEX_PART03_TEST_MINDMAP_0540
         * @tc.name int32ArrayFindIndexPart03TestMindmapTest054
         * @tc.desc Verify 5 predicate 0
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart03TestMindmapTest054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([5, 5, 5, 5, 5]);
          let result: int = arr.findIndex((v: number): boolean => v === 5);
          expect(result).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_INDEX_PART03_TEST_MINDMAP_0550
         * @tc.name int32ArrayFindIndexPart03TestMindmapTest055
         * @tc.desc Verify predicate -1
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart03TestMindmapTest055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([5, 5, 5, 5]);
          let result: int = arr.findIndex((v: number): boolean => v === 7);
          expect(result).assertEqual(-1);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_INDEX_PART03_TEST_MINDMAP_0560
         * @tc.name int32ArrayFindIndexPart03TestMindmapTest056
         * @tc.desc Verify 0 predicate 0 0
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart03TestMindmapTest056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([0, 0, 0, 0]);
          let result: int = arr.findIndex((v: number): boolean => v === 0);
          expect(result).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_INDEX_PART03_TEST_MINDMAP_0570
         * @tc.name int32ArrayFindIndexPart03TestMindmapTest057
         * @tc.desc Verify -1 predicate -1 0
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart03TestMindmapTest057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([-1, -1, -1]);
          let result: int = arr.findIndex((v: number): boolean => v === -1);
          expect(result).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_INDEX_PART03_TEST_MINDMAP_0580
         * @tc.name int32ArrayFindIndexPart03TestMindmapTest058
         * @tc.desc Verify MAX predicate MAX 0
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart03TestMindmapTest058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([2147483647, 2147483647]);
          let result: int = arr.findIndex((v: number): boolean => v === 2147483647);
          expect(result).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_INDEX_PART03_TEST_MINDMAP_0590
         * @tc.name int32ArrayFindIndexPart03TestMindmapTest059
         * @tc.desc Verify MIN predicate MIN 0
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart03TestMindmapTest059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([-2147483648, -2147483648, -2147483648]);
          let result: int = arr.findIndex((v: number): boolean => v === -2147483648);
          expect(result).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_INDEX_PART03_TEST_MINDMAP_0600
         * @tc.name int32ArrayFindIndexPart03TestMindmapTest060
         * @tc.desc Verify length 0 predicate index===length-1
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart03TestMindmapTest060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array(5);
          let result: int = arr.findIndex((v: number, i: int, a: Int32Array): boolean => i === a.length - 1);
          expect(result).assertEqual(4);
          expect(arr.$_get(4)).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_INDEX_PART03_TEST_MINDMAP_0610
         * @tc.name int32ArrayFindIndexPart03TestMindmapTest061
         * @tc.desc Verify fill predicate callCount=1
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart03TestMindmapTest061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array(64);
          arr.fill(3);
          let count: int = 0;
          let result: int = arr.findIndex((v: number, i: int): boolean => {
          count = count + 1;
          return v === 3;
        });
          expect(result).assertEqual(0);
          expect(count).assertEqual(1);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_INDEX_PART03_TEST_MINDMAP_0620
         * @tc.name int32ArrayFindIndexPart03TestMindmapTest062
         * @tc.desc Verify index -1
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart03TestMindmapTest062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3]);
          let sawNegOne: boolean = false;
          arr.findIndex((v: number, i: int): boolean => {
          if (i === -1) {
          sawNegOne = true;
          }
          return false;
        });
          expect(sawNegOne).assertFalse();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_INDEX_PART03_TEST_MINDMAP_0630
         * @tc.name int32ArrayFindIndexPart03TestMindmapTest063
         * @tc.desc Verify index -length -length===-n===0
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart03TestMindmapTest063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([10, 20, 30]);
          let sawNegLen: boolean = false;
          let negLen: int = -arr.length;
          arr.findIndex((v: number, i: int): boolean => {
          if (i === negLen) {
          sawNegLen = true;
          }
          return false;
        });
          expect(sawNegLen).assertFalse();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_INDEX_PART03_TEST_MINDMAP_0640
         * @tc.name int32ArrayFindIndexPart03TestMindmapTest064
         * @tc.desc Verify index -length-1 -1
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart03TestMindmapTest064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3]);
          let sawNegLen1: boolean = false;
          let bad: int = -(arr.length + 1);
          arr.findIndex((v: number, i: int): boolean => {
          if (i === bad) {
          sawNegLen1 = true;
          }
          return false;
        });
          expect(sawNegLen1).assertFalse();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_INDEX_PART03_TEST_MINDMAP_0650
         * @tc.name int32ArrayFindIndexPart03TestMindmapTest065
         * @tc.desc Verify index length +1
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart03TestMindmapTest065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([10, 20, 30]);
          let sawLen: boolean = false;
          let n: int = arr.length;
          arr.findIndex((v: number, i: int): boolean => {
          if (i === n) {
          sawLen = true;
          }
          return false;
        });
          expect(sawLen).assertFalse();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_INDEX_PART03_TEST_MINDMAP_0660
         * @tc.name int32ArrayFindIndexPart03TestMindmapTest066
         * @tc.desc Verify index length+1 +2
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart03TestMindmapTest066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2]);
          let sawLen1: boolean = false;
          let n2: int = arr.length + 1;
          arr.findIndex((v: number, i: int): boolean => {
          if (i === n2) {
          sawLen1 = true;
          }
          return false;
        });
          expect(sawLen1).assertFalse();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_INDEX_PART03_TEST_MINDMAP_0670
         * @tc.name int32ArrayFindIndexPart03TestMindmapTest067
         * @tc.desc Verify index
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart03TestMindmapTest067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3, 4, 5]);
          let allInt: boolean = true;
          arr.findIndex((v: number, i: int): boolean => {
          if (i !== (i | 0)) {
          allInt = false;
          }
          return false;
        });
          expect(allInt).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_INDEX_PART03_TEST_MINDMAP_0680
         * @tc.name int32ArrayFindIndexPart03TestMindmapTest068
         * @tc.desc Verify 100 index 99 int32
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart03TestMindmapTest068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let data: int[] = [];
          for (let i: int = 0; i < 100; i = i + 1) {
          data.push(i);
          }
          let arr: Int32Array = new Int32Array(data);
          let maxIdx: number = -1;
          arr.findIndex((v: number, i: int): boolean => {
          if (i > maxIdx) {
          maxIdx = i;
          }
          return false;
        });
          expect(maxIdx).assertEqual(99);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_INDEX_PART03_TEST_MINDMAP_0690
         * @tc.name int32ArrayFindIndexPart03TestMindmapTest069
         * @tc.desc Verify index 0 length-1
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart03TestMindmapTest069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([10, 20, 30, 40]);
          let expected: int = 0;
          let sequential: boolean = true;
          arr.findIndex((v: number, i: int): boolean => {
          if (i !== expected) {
          sequential = false;
          }
          expected = expected + 1;
          return false;
        });
          expect(sequential).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_INDEX_PART03_TEST_MINDMAP_0700
         * @tc.name int32ArrayFindIndexPart03TestMindmapTest070
         * @tc.desc Verify $_get(-1) throws RangeError
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart03TestMindmapTest070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3]);
          let threwRangeError: boolean = false;
          arr.findIndex((v: number, i: int, a: Int32Array): boolean => {
          try {
            a.$_get(-1);
            expect().assertFail();
          } catch (e) {
            threwRangeError = true;
            expect(e.name).assertEqual('RangeError');
          }
          return true;
        });
          expect(threwRangeError).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_INDEX_PART03_TEST_MINDMAP_0710
         * @tc.name int32ArrayFindIndexPart03TestMindmapTest071
         * @tc.desc Verify $_get(length) throws RangeError
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart03TestMindmapTest071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([10, 20, 30]);
          let threwRangeError: boolean = false;
          arr.findIndex((v: number, i: int, a: Int32Array): boolean => {
          try {
            a.$_get(a.length);
            expect().assertFail();
          } catch (e) {
            threwRangeError = true;
            expect(e.name).assertEqual('RangeError');
          }
          return true;
        });
          expect(threwRangeError).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_INDEX_PART03_TEST_MINDMAP_0720
         * @tc.name int32ArrayFindIndexPart03TestMindmapTest072
         * @tc.desc Verify $_get(length+1) throws RangeError
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart03TestMindmapTest072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2]);
          let threwRangeError: boolean = false;
          arr.findIndex((v: number, i: int, a: Int32Array): boolean => {
          try {
            a.$_get(a.length + 1);
            expect().assertFail();
          } catch (e) {
            threwRangeError = true;
            expect(e.name).assertEqual('RangeError');
          }
          return true;
        });
          expect(threwRangeError).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_INDEX_PART03_TEST_MINDMAP_0730
         * @tc.name int32ArrayFindIndexPart03TestMindmapTest073
         * @tc.desc Verify $_set(length, val) throws RangeError and length remains unchanged
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart03TestMindmapTest073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3]);
          let len0: int = arr.length;
          let threwRangeError: boolean = false;
          arr.findIndex((v: number, i: int, a: Int32Array): boolean => {
          try {
            a.$_set(a.length, 0);
            expect().assertFail();
          } catch (e) {
            threwRangeError = true;
            expect(e.name).assertEqual('RangeError');
          }
          return true;
        });
          expect(arr.length).assertEqual(len0);
          expect(threwRangeError).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_INDEX_PART03_TEST_MINDMAP_0740
         * @tc.name int32ArrayFindIndexPart03TestMindmapTest074
         * @tc.desc Verify $_set(-1, val) throws RangeError
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart03TestMindmapTest074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3]);
          try {
            arr.findIndex((v: number, i: int, a: Int32Array): boolean => {
            a.$_set(-1, 0);
            return true;
          });
            expect().assertFail();
          } catch (e) {
            expect(e.name).assertEqual('RangeError');
          }
          expect(arr.$_get(0)).assertEqual(1);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_INDEX_PART03_TEST_MINDMAP_0750
         * @tc.name int32ArrayFindIndexPart03TestMindmapTest075
         * @tc.desc Verify $_get(i - 1) throws RangeError when i is 0
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart03TestMindmapTest075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([10, 20]);
          let threwRangeError: boolean = false;
          arr.findIndex((v: number, i: int, a: Int32Array): boolean => {
          try {
            a.$_get(i - 1);
            expect().assertFail();
          } catch (e) {
            threwRangeError = true;
            expect(e.name).assertEqual('RangeError');
          }
          return true;
        });
          expect(threwRangeError).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_INDEX_PART03_TEST_MINDMAP_0760
         * @tc.name int32ArrayFindIndexPart03TestMindmapTest076
         * @tc.desc Verify $_get(i + 1) throws RangeError at last index
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart03TestMindmapTest076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([10, 20, 30]);
          let threwRangeError: boolean = false;
          arr.findIndex((v: number, i: int, a: Int32Array): boolean => {
          try {
            if (i === a.length - 1) {
            a.$_get(i + 1);
            expect().assertFail();
            }
          } catch (e) {
            threwRangeError = true;
            expect(e.name).assertEqual('RangeError');
          }
          return i === a.length - 1;
        });
          expect(threwRangeError).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_INDEX_PART03_TEST_MINDMAP_0770
         * @tc.name int32ArrayFindIndexPart03TestMindmapTest077
         * @tc.desc Verify i=0 i=3
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart03TestMindmapTest077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3, 4]);
          let result: int = arr.findIndex((v: number, i: int, a: Int32Array): boolean => {
          if (i === 0) {
          a.$_set(3, 999);
          return false;
          }
          return v === 999;
        });
          expect(result).assertEqual(3);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_INDEX_PART03_TEST_MINDMAP_0780
         * @tc.name int32ArrayFindIndexPart03TestMindmapTest078
         * @tc.desc Verify i=0 i=1
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart03TestMindmapTest078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3]);
          let result: int = arr.findIndex((v: number, i: int, a: Int32Array): boolean => {
          if (i === 0) {
          a.$_set(1, 777);
          return false;
          }
          return v === 777;
        });
          expect(result).assertEqual(1);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_INDEX_PART03_TEST_MINDMAP_0790
         * @tc.name int32ArrayFindIndexPart03TestMindmapTest079
         * @tc.desc Verify i=1 i=0
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart03TestMindmapTest079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3]);
          let result: int = arr.findIndex((v: number, i: int, a: Int32Array): boolean => {
          if (i === 1) {
          a.$_set(0, 99);
          return true;
          }
          return false;
        });
          expect(result).assertEqual(1);
          expect(arr.$_get(0)).assertEqual(99);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_INDEX_PART03_TEST_MINDMAP_0800
         * @tc.name int32ArrayFindIndexPart03TestMindmapTest080
         * @tc.desc Verify -1
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart03TestMindmapTest080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 50, 50, 50]);
          let result: int = arr.findIndex((v: number, i: int, a: Int32Array): boolean => {
          if (i === 0) {
          a.$_set(1, 0);
          a.$_set(2, 0);
          a.$_set(3, 0);
          return false;
          }
          return v === 50;
        });
          expect(result).assertEqual(-1);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_INDEX_PART03_TEST_MINDMAP_0810
         * @tc.name int32ArrayFindIndexPart03TestMindmapTest081
         * @tc.desc Verify i value v
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart03TestMindmapTest081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3]);
          let capturedV: number = -1;
          arr.findIndex((v: number, i: int, a: Int32Array): boolean => {
          a.$_set(i, 999);
          capturedV = v;
          return true;
        });
          expect(capturedV).assertEqual(1);
          expect(arr.$_get(0)).assertEqual(999);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_INDEX_PART03_TEST_MINDMAP_0820
         * @tc.name int32ArrayFindIndexPart03TestMindmapTest082
         * @tc.desc Verify i=0
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart03TestMindmapTest082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([0, 0, 0, 0]);
          let callCount: int = 0;
          let result: int = arr.findIndex((v: number, i: int, a: Int32Array): boolean => {
          callCount = callCount + 1;
          if (i === 0) {
          a.$_set(1, 1);
          return false;
          }
          return v === 1;
        });
          expect(result).assertEqual(1);
          expect(callCount).assertEqual(2);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_INDEX_PART03_TEST_MINDMAP_0830
         * @tc.name int32ArrayFindIndexPart03TestMindmapTest083
         * @tc.desc Verify subarray findIndex 0
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart03TestMindmapTest083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let parent: Int32Array = new Int32Array([10, 20, 30, 40]);
          let child: Int32Array = parent.subarray(2, 3);
          let result: int = child.findIndex((v: number): boolean => v === 30);
          expect(result).assertEqual(0);
          expect(child.length).assertEqual(1);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_INDEX_PART03_TEST_MINDMAP_0840
         * @tc.name int32ArrayFindIndexPart03TestMindmapTest084
         * @tc.desc Verify subarray predicate buffer
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart03TestMindmapTest084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let buf: ArrayBuffer = new ArrayBuffer(16);
          let parent: Int32Array = new Int32Array(buf);
          parent.$_set(0, 1);
          parent.$_set(1, 2);
          parent.$_set(2, 3);
          parent.$_set(3, 4);
          let child: Int32Array = parent.subarray(1, 3);
          child.findIndex((v: number, i: int, a: Int32Array): boolean => {
          a.$_set(i, 99);
          return i === 1;
        });
          expect(parent.$_get(2)).assertEqual(99);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_INDEX_PART03_TEST_MINDMAP_0850
         * @tc.name int32ArrayFindIndexPart03TestMindmapTest085
         * @tc.desc Verify slice findIndex
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart03TestMindmapTest085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let orig: Int32Array = new Int32Array([10, 20, 30]);
          let cp: Int32Array = orig.slice();
          cp.findIndex((v: number, i: int, a: Int32Array): boolean => {
          a.$_set(0, 888);
          return true;
        });
          expect(cp.$_get(0)).assertEqual(888);
          expect(orig.$_get(0)).assertEqual(10);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_INDEX_PART03_TEST_MINDMAP_0860
         * @tc.name int32ArrayFindIndexPart03TestMindmapTest086
         * @tc.desc Verify findIndex on subarray uses subarray indices starting from 0
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart03TestMindmapTest086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let parent: Int32Array = new Int32Array([10, 20, 30, 40, 50]);
          let child: Int32Array = parent.subarray(2, 5);
          let result: int = child.findIndex((v: number, _i: int, _a: Int32Array): boolean => {
            return v === 40;
          });
          expect(result).assertEqual(1);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_INDEX_PART03_TEST_MINDMAP_0870
         * @tc.name int32ArrayFindIndexPart03TestMindmapTest087
         * @tc.desc Verify MAX MIN predicate MIN MIN
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart03TestMindmapTest087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([2147483647, -2147483648, 0]);
          let result: int = arr.findIndex((v: number): boolean => v === -2147483648);
          expect(result).assertEqual(1);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_INDEX_PART03_TEST_MINDMAP_0880
         * @tc.name int32ArrayFindIndexPart03TestMindmapTest088
         * @tc.desc Verify Number.NaN 0 predicate v!==v Number.NaN -1
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart03TestMindmapTest088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([Double.NaN, 1, 2] as FixedArray<number>);
          let result: int = arr.findIndex((v: number): boolean => v !== v);
          expect(result).assertEqual(-1);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_INDEX_PART03_TEST_MINDMAP_0890
         * @tc.name int32ArrayFindIndexPart03TestMindmapTest089
         * @tc.desc Verify +Number.POSITIVE_INFINITY ToInt32 0 predicate 0 Number.POSITIVE_INFINITY
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart03TestMindmapTest089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, Double.POSITIVE_INFINITY, 2] as FixedArray<number>);
          let result: int = arr.findIndex((v: number): boolean => v === 0);
          expect(result).assertEqual(1);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_INDEX_PART03_TEST_MINDMAP_0900
         * @tc.name int32ArrayFindIndexPart03TestMindmapTest090
         * @tc.desc Verify Double.NEGATIVE_INFINITY ToInt32 0 predicate 0 Double.NEGATIVE_INFINITY
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart03TestMindmapTest090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, Double.NEGATIVE_INFINITY] as FixedArray<number>);
          let result: int = arr.findIndex((v: number): boolean => v === 0);
          expect(result).assertEqual(2);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_INDEX_PART03_TEST_MINDMAP_0910
         * @tc.name int32ArrayFindIndexPart03TestMindmapTest091
         * @tc.desc Verify 4294967296 2^32 0 predicate 0 0
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart03TestMindmapTest091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([4294967296, 1, 2]);
          let result: int = arr.findIndex((v: number): boolean => v === 0);
          expect(result).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_INDEX_PART03_TEST_MINDMAP_0920
         * @tc.name int32ArrayFindIndexPart03TestMindmapTest092
         * @tc.desc Verify 4294967295 0xFFFFFFFF -1 predicate -1 0
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart03TestMindmapTest092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([4294967295, 1, 2]);
          let result: int = arr.findIndex((v: number): boolean => v === -1);
          expect(result).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_INDEX_PART03_TEST_MINDMAP_0930
         * @tc.name int32ArrayFindIndexPart03TestMindmapTest093
         * @tc.desc Verify 3.9 3 predicate 3
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart03TestMindmapTest093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([3.9, 1, 2]);
          let result: int = arr.findIndex((v: number): boolean => v === 3);
          expect(result).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_INDEX_PART03_TEST_MINDMAP_0940
         * @tc.name int32ArrayFindIndexPart03TestMindmapTest094
         * @tc.desc Verify -3.9 -3 predicate -3
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart03TestMindmapTest094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, -3.9, 2]);
          let result: int = arr.findIndex((v: number): boolean => v === -3);
          expect(result).assertEqual(1);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_INDEX_PART03_TEST_MINDMAP_0950
         * @tc.name int32ArrayFindIndexPart03TestMindmapTest095
         * @tc.desc Verify predicate -1
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart03TestMindmapTest095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3]);
          let result: int = arr.findIndex((v: number): boolean => v < 0);
          expect(result).assertEqual(-1);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_INDEX_PART03_TEST_MINDMAP_0960
         * @tc.name int32ArrayFindIndexPart03TestMindmapTest096
         * @tc.desc Verify predicate -1
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart03TestMindmapTest096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([-1, -2, -3]);
          let result: int = arr.findIndex((v: number): boolean => v > 0);
          expect(result).assertEqual(-1);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_INDEX_PART03_TEST_MINDMAP_0970
         * @tc.name int32ArrayFindIndexPart03TestMindmapTest097
         * @tc.desc Verify predicate findIndex
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart03TestMindmapTest097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([5, 10, 15, 20]);
          let pred = (v: number): boolean => v === 15;
          let r1: int = arr.findIndex(pred);
          let r2: int = arr.findIndex(pred);
          expect(r1).assertEqual(r2);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_INDEX_PART03_TEST_MINDMAP_0980
         * @tc.name int32ArrayFindIndexPart03TestMindmapTest098
         * @tc.desc Verify findIndex
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart03TestMindmapTest098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3]);
          arr.findIndex((v: number, i: int, a: Int32Array): boolean => {
          a.$_set(2, 99);
          return true;
        });
          let result: int = arr.findIndex((v: number): boolean => v === 99);
          expect(result).assertEqual(2);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_INDEX_PART03_TEST_MINDMAP_0990
         * @tc.name int32ArrayFindIndexPart03TestMindmapTest099
         * @tc.desc Verify predicate Int32Array findIndex
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart03TestMindmapTest099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let a: Int32Array = new Int32Array([1, 2, 3]);
          let b: Int32Array = new Int32Array([100, 200]);
          let innerR: int = -1;
          let result: int = a.findIndex((v: number, i: int): boolean => {
          innerR = b.findIndex((bv: number): boolean => bv === 200);
          return i === 2;
        });
          expect(innerR).assertEqual(1);
          expect(result).assertEqual(2);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_INDEX_PART03_TEST_MINDMAP_1000
         * @tc.name int32ArrayFindIndexPart03TestMindmapTest100
         * @tc.desc Verify predicate array findIndex predicate
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart03TestMindmapTest100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([10, 20, 30]);
          let innerR: int = -1;
          let outerR: int = arr.findIndex((v: number, i: int, a: Int32Array): boolean => {
          if (i === 0) {
          innerR = a.findIndex((iv: number): boolean => iv === 30);
          return false;
          }
          return v === 20;
        });
          expect(innerR).assertEqual(2);
          expect(outerR).assertEqual(1);
        });
  });
}
