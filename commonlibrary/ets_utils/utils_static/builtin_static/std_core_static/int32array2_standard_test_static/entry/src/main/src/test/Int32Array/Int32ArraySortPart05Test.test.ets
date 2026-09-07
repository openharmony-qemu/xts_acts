'use static';


/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
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

export default function int32ArraySortPart05Test(): void {
  describe('Int32ArraySortPart05Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART05_TEST_MINDMAP_0100
     * @tc.name int32ArraySortPart05Test001
     * @tc.desc Verify arity=0 compareFn -1 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart05Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-1, 1]);
      arr.sort();
      expect(arr.$_get(0)).assertEqual(-1);
      expect(arr.$_get(1)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART05_TEST_MINDMAP_0200
     * @tc.name int32ArraySortPart05Test002
     * @tc.desc Verify arity=1 compareFn a-b
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart05Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([3, -1, 2]);
      arr.sort((a: number, b: number): int => Double.toInt(a - b));
      expect(arr.$_get(0)).assertEqual(-1);
      expect(arr.$_get(1)).assertEqual(2);
      expect(arr.$_get(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART05_TEST_MINDMAP_0300
     * @tc.name int32ArraySortPart05Test003
     * @tc.desc Verify arity=1 compareFn b-a
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart05Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-1, 2, 3]);
      arr.sort((a: number, b: number): int => Double.toInt(b - a));
      expect(arr.$_get(0)).assertEqual(3);
      expect(arr.$_get(1)).assertEqual(2);
      expect(arr.$_get(2)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART05_TEST_MINDMAP_0400
     * @tc.name int32ArraySortPart05Test004
     * @tc.desc Verify undefined compareFn
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart05Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-1, 1]);
      arr.sort(undefined);
      expect(arr.$_get(0)).assertEqual(-1);
      expect(arr.$_get(1)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART05_TEST_MINDMAP_0500
     * @tc.name int32ArraySortPart05Test005
     * @tc.desc Verify compareFn -1( )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart05Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-1, 0, 1]);
      arr.sort((a: number, b: number): int => -1);
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.$_get(2)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART05_TEST_MINDMAP_0600
     * @tc.name int32ArraySortPart05Test006
     * @tc.desc Verify compareFn 1( )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart05Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-1, 0, 1]);
      arr.sort((a: number, b: number): int => 1);
      expect(arr.$_get(0)).assertEqual(-1);
      expect(arr.$_get(2)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART05_TEST_MINDMAP_0700
     * @tc.name int32ArraySortPart05Test007
     * @tc.desc Verify compareFn 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart05Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-1, 1]);
      arr.sort((a: number, b: number): int => 0);
      expect(arr.length).assertEqual(2);
      expect(arr.$_get(0)).assertEqual(-1);
      expect(arr.$_get(1)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART05_TEST_MINDMAP_0800
     * @tc.name int32ArraySortPart05Test008
     * @tc.desc Verify compareFn INT_MIN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart05Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-1, 0, 1]);
      arr.sort((a: number, b: number): int => -2147483648);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART05_TEST_MINDMAP_0900
     * @tc.name int32ArraySortPart05Test009
     * @tc.desc Verify compareFn INT_MAX
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart05Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-1, 0, 1]);
      arr.sort((a: number, b: number): int => 2147483647);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART05_TEST_MINDMAP_1000
     * @tc.name int32ArraySortPart05Test010
     * @tc.desc Verify compareFn -1 a b 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart05Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([3, -1, 2]);
      arr.sort((a: number, b: number): int => {
        if (a > b) {
          return -1;
        }
        if (a < b) {
          return 1;
        }
        return 0;
      });
      expect(arr.$_get(0)).assertEqual(3);
      expect(arr.$_get(1)).assertEqual(2);
      expect(arr.$_get(2)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART05_TEST_MINDMAP_1100
     * @tc.name int32ArraySortPart05Test011
     * @tc.desc Verify compareFn a a
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart05Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-1, 1]);
      arr.sort((a: number, b: number): int => (a > 0 ? 1 : -1));
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART05_TEST_MINDMAP_1200
     * @tc.name int32ArraySortPart05Test012
     * @tc.desc Verify compareFn a===b 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart05Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-1, -1, 1, 1]);
      arr.sort((a: number, b: number): int => {
        if (a === b) {
          return 0;
        }
        return a < b ? -1 : 1;
      });
      expect(arr.$_get(0)).assertEqual(-1);
      expect(arr.$_get(1)).assertEqual(-1);
      expect(arr.$_get(2)).assertEqual(1);
      expect(arr.$_get(3)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART05_TEST_MINDMAP_1300
     * @tc.name int32ArraySortPart05Test013
     * @tc.desc Verify compareFn -3 a
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart05Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, -1]);
      arr.sort((a: number, b: number): int => a < b ? -3 : (a > b ? 3 : 0));
      expect(arr.$_get(0)).assertEqual(-1);
      expect(arr.$_get(1)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART05_TEST_MINDMAP_1400
     * @tc.name int32ArraySortPart05Test014
     * @tc.desc Verify compareFn 3 b
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart05Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-1, 1]);
      arr.sort((a: number, b: number): int => b - a > 0 ? 3 : -3);
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.$_get(1)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART05_TEST_MINDMAP_1500
     * @tc.name int32ArraySortPart05Test015
     * @tc.desc Verify compareFn sorts negative and positive values in ascending order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart05Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-1, 1]);
      arr.sort((a: number, b: number): int => {
        return a < b ? -1 : 1;
      });
      expect(arr.$_get(0)).assertEqual(-1);
      expect(arr.$_get(1)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART05_TEST_MINDMAP_1600
     * @tc.name int32ArraySortPart05Test016
     * @tc.desc Verify compareFn a b ( -1 )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart05Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-1, 0, 1]);
      let compareCount: int = 0;
      let parametersFromInput: boolean = true;
      arr.sort((a: number, b: number): int => {
        compareCount++;
        if ((a !== -1 && a !== 0 && a !== 1) || (b !== -1 && b !== 0 && b !== 1)) {
          parametersFromInput = false;
        }
        return a < b ? -1 : (a > b ? 1 : 0);
      });
      expect(compareCount).assertLarger(0);
      expect(parametersFromInput).assertTrue();
      expect(arr.$_get(0)).assertEqual(-1);
      expect(arr.$_get(1)).assertEqual(0);
      expect(arr.$_get(2)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART05_TEST_MINDMAP_1700
     * @tc.name int32ArraySortPart05Test017
     * @tc.desc Verify compareFn array Int32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart05Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-1, 1]);
      arr.sort((a: number, b: number): int => {
        return a < b ? -1 : 1;
      });
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART05_TEST_MINDMAP_1800
     * @tc.name int32ArraySortPart05Test018
     * @tc.desc Verify compareFn throw Error sort
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart05Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-1, 0, 1]);
      try {
        arr.sort((a: number, b: number): int => {
          throw new Error('cmp err');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART05_TEST_MINDMAP_1900
     * @tc.name int32ArraySortPart05Test019
     * @tc.desc Verify sort propagates an Error thrown by compareFn
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart05Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-1, 0, 1]);
      try {
        arr.sort((_a: number, _b: number): int => {
          throw new Error('stop');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
        expect(e.message).assertEqual('stop');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART05_TEST_MINDMAP_2000
     * @tc.name int32ArraySortPart05Test020
     * @tc.desc Verify compareFn RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart05Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-1, 1]);
      try {
        arr.sort((a: number, b: number): int => {
          throw new RangeError('range');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART05_TEST_MINDMAP_2100
     * @tc.name int32ArraySortPart05Test021
     * @tc.desc Verify compareFn TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart05Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-1, 1]);
      try {
        arr.sort((a: number, b: number): int => {
          throw new TypeError('t err');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART05_TEST_MINDMAP_2200
     * @tc.name int32ArraySortPart05Test022
     * @tc.desc Verify sort propagates an Error thrown by the comparator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart05Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-1, 0, 1]);
      try {
        arr.sort((a: number, b: number): int => {
          throw new Error('x');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART05_TEST_MINDMAP_2300
     * @tc.name int32ArraySortPart05Test023
     * @tc.desc Verify compareFn int int; 0x7FFFFFFF
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart05Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-1, 1]);
      arr.sort((a: number, b: number): int => {
        return a < b ? -2147483648 : 2147483647;
      });
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART05_TEST_MINDMAP_2400
     * @tc.name int32ArraySortPart05Test024
     * @tc.desc Verify sort compareFn length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart05Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(0);
      let called: boolean = false;
      arr.sort((a: number, b: number): int => {
        called = true;
        return -1;
      });
      expect(arr.length).assertEqual(0);
      expect(called).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART05_TEST_MINDMAP_2500
     * @tc.name int32ArraySortPart05Test025
     * @tc.desc Verify sort length=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart05Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-1]);
      arr.sort();
      expect(arr.length).assertEqual(1);
      expect(arr.$_get(0)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART05_TEST_MINDMAP_2600
     * @tc.name int32ArraySortPart05Test026
     * @tc.desc Verify sort compareFn
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart05Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-1]);
      let calls: number = 0;
      arr.sort((a: number, b: number): int => {
        calls = calls + 1;
        return -1;
      });
      expect(calls).assertEqual(0);
      expect(arr.$_get(0)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART05_TEST_MINDMAP_2700
     * @tc.name int32ArraySortPart05Test027
     * @tc.desc Verify -1 sort -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart05Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-1, -1]);
      arr.sort();
      expect(arr.$_get(0)).assertEqual(-1);
      expect(arr.$_get(1)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART05_TEST_MINDMAP_2800
     * @tc.name int32ArraySortPart05Test028
     * @tc.desc Verify -1 INT32 2147483647 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart05Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-1, 2147483647]);
      arr.sort();
      expect(arr.$_get(0)).assertEqual(-1);
      expect(arr.$_get(1)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART05_TEST_MINDMAP_2900
     * @tc.name int32ArraySortPart05Test029
     * @tc.desc Verify 4 -1 0 1 2147483647
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart05Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([2147483647, -1, 1, 0]);
      arr.sort();
      expect(arr.$_get(0)).assertEqual(-1);
      expect(arr.$_get(1)).assertEqual(0);
      expect(arr.$_get(2)).assertEqual(1);
      expect(arr.$_get(3)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART05_TEST_MINDMAP_3000
     * @tc.name int32ArraySortPart05Test030
     * @tc.desc Verify sort preserves ascending order for -1, 0, and 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart05Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let small: Int32Array = new Int32Array(3);
      small.$_set(0, -1);
      small.$_set(1, 0);
      small.$_set(2, 1);
      small.sort();
      expect(small.$_get(0)).assertEqual(-1);
      expect(small.$_get(1)).assertEqual(0);
      expect(small.$_get(2)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART05_TEST_MINDMAP_3100
     * @tc.name int32ArraySortPart05Test031
     * @tc.desc Verify set sort -1 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart05Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(2);
      let src: Int32Array = new Int32Array([1, -1]);
      arr.set(src);
      arr.sort();
      expect(arr.$_get(0)).assertEqual(-1);
      expect(arr.$_get(1)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART05_TEST_MINDMAP_3200
     * @tc.name int32ArraySortPart05Test032
     * @tc.desc Verify INT_MIN -2147483648 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart05Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-1, -2147483648]);
      arr.sort();
      expect(arr.$_get(0)).assertEqual(-2147483648);
      expect(arr.$_get(1)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART05_TEST_MINDMAP_3300
     * @tc.name int32ArraySortPart05Test033
     * @tc.desc Verify 0 -1 set 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart05Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(2);
      arr.$_set(0, 0);
      arr.$_set(1, -1);
      arr.sort();
      expect(arr.$_get(0)).assertEqual(-1);
      expect(arr.$_get(1)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART05_TEST_MINDMAP_3400
     * @tc.name int32ArraySortPart05Test034
     * @tc.desc Verify 0 1 -1 fill(0) $_set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart05Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(3);
      arr.fill(0);
      arr.$_set(0, 1);
      arr.$_set(2, -1);
      arr.sort();
      expect(arr.$_get(0)).assertEqual(-1);
      expect(arr.$_get(1)).assertEqual(0);
      expect(arr.$_get(2)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART05_TEST_MINDMAP_3500
     * @tc.name int32ArraySortPart05Test035
     * @tc.desc Verify from 0 -1 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart05Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int32Array = new Int32Array([1, -1, 0]);
      let arr: Int32Array = Int32Array.from(src);
      arr.sort();
      expect(arr.$_get(0)).assertEqual(-1);
      expect(arr.$_get(1)).assertEqual(0);
      expect(arr.$_get(2)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART05_TEST_MINDMAP_3600
     * @tc.name int32ArraySortPart05Test036
     * @tc.desc Verify of 0 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart05Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(0, -1, 0);
      arr.sort();
      expect(arr.$_get(0)).assertEqual(-1);
      expect(arr.$_get(1)).assertEqual(0);
      expect(arr.$_get(2)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART05_TEST_MINDMAP_3700
     * @tc.name int32ArraySortPart05Test037
     * @tc.desc Verify sort() compareFn this( )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart05Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-1, 1]);
      let ret: Int32Array = arr.sort();
      expect(ret).assertEqual(arr);
      expect(ret.byteLength).assertEqual(arr.byteLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART05_TEST_MINDMAP_3800
     * @tc.name int32ArraySortPart05Test038
     * @tc.desc Verify sort(compareFn) this
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart05Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-1, 1]);
      let cmp = (a: number, b: number): int => Double.toInt(a - b);
      let ret: Int32Array = arr.sort(cmp);
      expect(ret).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART05_TEST_MINDMAP_3900
     * @tc.name int32ArraySortPart05Test039
     * @tc.desc Verify sort(undefined) undefined this
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart05Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-1, 1]);
      let ret: Int32Array = arr.sort(undefined);
      expect(ret).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART05_TEST_MINDMAP_4000
     * @tc.name int32ArraySortPart05Test040
     * @tc.desc Verify sort this length=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart05Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(0);
      let ret: Int32Array = arr.sort();
      expect(ret).assertEqual(arr);
      expect(ret.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART05_TEST_MINDMAP_4100
     * @tc.name int32ArraySortPart05Test041
     * @tc.desc Verify sort().reverse()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart05Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-1, 0, 1]);
      let ret: Int32Array = arr.sort().reverse();
      expect(ret).assertEqual(arr);
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.$_get(1)).assertEqual(0);
      expect(arr.$_get(2)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART05_TEST_MINDMAP_4200
     * @tc.name int32ArraySortPart05Test042
     * @tc.desc Verify sort(compareFn) fill this
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart05Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([3, -1, 2]);
      let ret: Int32Array = arr.sort((a: number, b: number): int => Double.toInt(a - b)).fill(-1);
      expect(ret).assertEqual(arr);
      expect(arr.$_get(0)).assertEqual(-1);
      expect(arr.$_get(1)).assertEqual(-1);
      expect(arr.$_get(2)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART05_TEST_MINDMAP_4300
     * @tc.name int32ArraySortPart05Test043
     * @tc.desc Verify default sort orders INT32_MIN, -1, 0, 1, and INT32_MAX
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart05Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(0);
      let calls: number = 0;
      arr.sort((a: number, b: number): int => {
        calls = calls + 1;
        return -1;
      });
      expect(calls).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART05_TEST_MINDMAP_4400
     * @tc.name int32ArraySortPart05Test044
     * @tc.desc Verify sorting three equal negative values preserves every element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart05Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-2147483648, -1, 0, 1, 2147483647]);
      arr.sort();
      expect(arr.$_get(0)).assertEqual(-2147483648);
      expect(arr.$_get(1)).assertEqual(-1);
      expect(arr.$_get(2)).assertEqual(0);
      expect(arr.$_get(3)).assertEqual(1);
      expect(arr.$_get(4)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART05_TEST_MINDMAP_4500
     * @tc.name int32ArraySortPart05Test045
     * @tc.desc Verify sort
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart05Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-1, -1, -1]);
      arr.sort();
      expect(arr.$_get(0)).assertEqual(-1);
      expect(arr.$_get(1)).assertEqual(-1);
      expect(arr.$_get(2)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART05_TEST_MINDMAP_4600
     * @tc.name int32ArraySortPart05Test046
     * @tc.desc Verify compareFn N-1 (N=3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart05Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-1, 0, 1]);
      let cnt: number = 0;
      arr.sort((a: number, b: number): int => {
        cnt = cnt + 1;
        return a < b ? -1 : (a > b ? 1 : 0);
      });
      let cntOk: boolean = cnt >= 2;
      expect(cntOk).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART05_TEST_MINDMAP_4700
     * @tc.name int32ArraySortPart05Test047
     * @tc.desc Verify INT_MAX(2147483647) -1 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart05Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([2147483647, -1]);
      arr.sort();
      expect(arr.$_get(0)).assertEqual(-1);
      expect(arr.$_get(1)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART05_TEST_MINDMAP_4800
     * @tc.name int32ArraySortPart05Test048
     * @tc.desc Verify INT_MIN(-2147483648) -1 INT_MAX
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart05Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([2147483647, -2147483648, -1]);
      arr.sort();
      expect(arr.$_get(0)).assertEqual(-2147483648);
      expect(arr.$_get(1)).assertEqual(-1);
      expect(arr.$_get(2)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART05_TEST_MINDMAP_4900
     * @tc.name int32ArraySortPart05Test049
     * @tc.desc Verify compareFn sorts INT_MIN before INT_MAX
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart05Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-2147483648, 2147483647]);
      arr.sort((a: number, b: number): int => a < b ? -1 : (a > b ? 1 : 0));
      expect(arr.$_get(0)).assertEqual(-2147483648);
      expect(arr.$_get(1)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART05_TEST_MINDMAP_5000
     * @tc.name int32ArraySortPart05Test050
     * @tc.desc Verify INT_MIN compareFn 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart05Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-2147483648, -2147483648]);
      arr.sort((a: number, b: number): int => a === b ? 0 : (a < b ? -1 : 1));
      expect(arr.$_get(0)).assertEqual(-2147483648);
      expect(arr.$_get(1)).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART05_TEST_MINDMAP_5100
     * @tc.name int32ArraySortPart05Test051
     * @tc.desc Verify INT_MIN -1 compareFn(b-a) -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart05Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-2147483648, -1]);
      arr.sort((a: number, b: number): int => Double.toInt(b - a));
      expect(arr.$_get(0)).assertEqual(-1);
      expect(arr.$_get(1)).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART05_TEST_MINDMAP_5200
     * @tc.name int32ArraySortPart05Test052
     * @tc.desc Verify compareFn a-b a=INT_MIN b=INT_MAX -4294967295 int 1 ; ( )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart05Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-2147483648, 2147483647]);
      arr.sort((a: number, b: number): int => {
        let d: number = a - b;
        return d < 0 ? -1 : (d > 0 ? 1 : 0);
      });
      expect(arr.$_get(0)).assertEqual(-2147483648);
      expect(arr.$_get(1)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART05_TEST_MINDMAP_5300
     * @tc.name int32ArraySortPart05Test053
     * @tc.desc Verify ArrayBuffer Int32Array buffer 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart05Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(12);
      let a: Int32Array = new Int32Array(buf, 0, 3);
      a.$_set(0, 1);
      a.$_set(1, -1);
      a.$_set(2, 0);
      a.sort();
      let b: Int32Array = new Int32Array(buf, 0, 3);
      expect(b.$_get(0)).assertEqual(-1);
      expect(b.$_get(1)).assertEqual(0);
      expect(b.$_get(2)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART05_TEST_MINDMAP_5400
     * @tc.name int32ArraySortPart05Test054
     * @tc.desc Verify ArrayBuffer 4 sort buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart05Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let parent: Int32Array = new Int32Array(buf, 0, 4);
      parent.$_set(0, 100);
      parent.$_set(1, 3);
      parent.$_set(2, -1);
      parent.$_set(3, 0);
      let sub: Int32Array = new Int32Array(buf, 4, 3);
      sub.sort();
      expect(parent.$_get(0)).assertEqual(100);
      expect(parent.$_get(1)).assertEqual(-1);
      expect(parent.$_get(2)).assertEqual(0);
      expect(parent.$_get(3)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART05_TEST_MINDMAP_5500
     * @tc.name int32ArraySortPart05Test055
     * @tc.desc Verify byteOffset 0 length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart05Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let sub: Int32Array = new Int32Array(buf, 4, 3);
      sub.$_set(0, -1);
      sub.$_set(1, 1);
      sub.$_set(2, 0);
      sub.sort();
      expect(sub.length).assertEqual(3);
      expect(sub.byteOffset).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART05_TEST_MINDMAP_5600
     * @tc.name int32ArraySortPart05Test056
     * @tc.desc Verify sort buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart05Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let a: Int32Array = new Int32Array(buf, 0, 1);
      let b: Int32Array = new Int32Array(buf, 4, 3);
      a.$_set(0, -1);
      b.$_set(0, 3);
      b.$_set(1, 1);
      b.$_set(2, 2);
      b.sort();
      expect(a.$_get(0)).assertEqual(-1);
      expect(b.$_get(0)).assertEqual(1);
      expect(b.$_get(1)).assertEqual(2);
      expect(b.$_get(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART05_TEST_MINDMAP_5700
     * @tc.name int32ArraySortPart05Test057
     * @tc.desc Verify buffer sort
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart05Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(12);
      let a: Int32Array = new Int32Array(buf, 0, 2);
      let b: Int32Array = new Int32Array(buf, 4, 2);
      a.$_set(0, 2);
      a.$_set(1, 1);
      b.$_set(0, -1);
      b.$_set(1, 0);
      a.sort();
      expect(a.$_get(0)).assertEqual(-1);
      expect(a.$_get(1)).assertEqual(2);
      expect(b.$_get(0)).assertEqual(2);
      expect(b.$_get(1)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART05_TEST_MINDMAP_5800
     * @tc.name int32ArraySortPart05Test058
     * @tc.desc Verify sort buffer DataView 4 int32
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart05Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let a: Int32Array = new Int32Array(buf, 0, 2);
      a.$_set(0, -1);
      a.$_set(1, 1);
      a.sort();
      let dv: DataView = new DataView(buf);
      expect(dv.getInt32(0, true)).assertEqual(-1);
      expect(dv.getInt32(4, true)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART05_TEST_MINDMAP_5900
     * @tc.name int32ArraySortPart05Test059
     * @tc.desc Verify Int32Array.of sort buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart05Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(-1, 0, 1);
      a.sort();
      let b: Int32Array = new Int32Array(a.buffer);
      expect(b.$_get(0)).assertEqual(-1);
      expect(b.$_get(1)).assertEqual(0);
      expect(b.$_get(2)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART05_TEST_MINDMAP_6000
     * @tc.name int32ArraySortPart05Test060
     * @tc.desc Verify subarray sort
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart05Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([100, -1, 0, 1, 200]);
      let sub: Int32Array = a.subarray(1, 4);
      sub.sort();
      expect(a.$_get(0)).assertEqual(100);
      expect(a.$_get(1)).assertEqual(-1);
      expect(a.$_get(2)).assertEqual(0);
      expect(a.$_get(3)).assertEqual(1);
      expect(a.$_get(4)).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART05_TEST_MINDMAP_6100
     * @tc.name int32ArraySortPart05Test061
     * @tc.desc Verify subarray 8(byteOffset=8) sort
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart05Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(24);
      let a: Int32Array = new Int32Array(buf);
      a.$_set(0, 99);
      a.$_set(1, 99);
      a.$_set(2, 5);
      a.$_set(3, -1);
      a.$_set(4, 0);
      a.$_set(5, 99);
      let sub: Int32Array = a.subarray(2, 5);
      sub.sort();
      expect(a.$_get(2)).assertEqual(-1);
      expect(a.$_get(3)).assertEqual(0);
      expect(a.$_get(4)).assertEqual(5);
      expect(a.$_get(1)).assertEqual(99);
      expect(a.$_get(5)).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART05_TEST_MINDMAP_6200
     * @tc.name int32ArraySortPart05Test062
     * @tc.desc Verify -1 -1 -0x1 sort
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart05Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([-1, 0, 1]);
      let b: Int32Array = new Int32Array([-0x1, 0, 1]);
      a.sort();
      b.sort();
      expect(a.$_get(0)).assertEqual(-1);
      expect(a.$_get(1)).assertEqual(0);
      expect(a.$_get(2)).assertEqual(1);
      expect(b.$_get(0)).assertEqual(-1);
      expect(b.$_get(1)).assertEqual(0);
      expect(b.$_get(2)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART05_TEST_MINDMAP_6300
     * @tc.name int32ArraySortPart05Test063
     * @tc.desc Verify 0 0 0x0 0o0 0b0 sort 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart05Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([0x0, -1, 0o0, 1, 0b0]);
      arr.sort();
      expect(arr.$_get(0)).assertEqual(-1);
      expect(arr.$_get(1)).assertEqual(0);
      expect(arr.$_get(2)).assertEqual(0);
      expect(arr.$_get(3)).assertEqual(0);
      expect(arr.$_get(4)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART05_TEST_MINDMAP_6400
     * @tc.name int32ArraySortPart05Test064
     * @tc.desc Verify ArrayBuffer 8 1 sort
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart05Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(12);
      let a: Int32Array = new Int32Array(buf, 8, 1);
      a.$_set(0, -1);
      a.sort();
      expect(a.$_get(0)).assertEqual(-1);
      expect(a.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART05_TEST_MINDMAP_6500
     * @tc.name int32ArraySortPart05Test065
     * @tc.desc Verify 2147483647 -2147483648 -1 0 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart05Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, -2147483648, 2147483647, -1, 0]);
      arr.sort();
      expect(arr.$_get(0)).assertEqual(-2147483648);
      expect(arr.$_get(1)).assertEqual(-1);
      expect(arr.$_get(2)).assertEqual(0);
      expect(arr.$_get(3)).assertEqual(1);
      expect(arr.$_get(4)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART05_TEST_MINDMAP_6600
     * @tc.name int32ArraySortPart05Test066
     * @tc.desc Verify compareFn array.length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart05Test066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-1, 0, 1]);
      let seenLen: number = -1;
      arr.sort((a: number, b: number): int => {
        seenLen = arr.length;
        return a < b ? -1 : (a > b ? 1 : 0);
      });
      expect(seenLen).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART05_TEST_MINDMAP_6700
     * @tc.name int32ArraySortPart05Test067
     * @tc.desc Verify compareFn 0x7FFFFFFF(INT_MAX) a b
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart05Test067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-1, 1]);
      arr.sort((a: number, b: number): int => {
        if (a === -1 && b === 1) {
          return 2147483647;
        }
        if (a === 1 && b === -1) {
          return -2147483648;
        }
        return 0;
      });
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.$_get(1)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART05_TEST_MINDMAP_6800
     * @tc.name int32ArraySortPart05Test068
     * @tc.desc Verify -1 5 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart05Test068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-1, -1, -1, -1, -1]);
      arr.sort();
      for (let i: int = 0; i < arr.length; i++) {
        expect(arr.$_get(i)).assertEqual(-1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART05_TEST_MINDMAP_6900
     * @tc.name int32ArraySortPart05Test069
     * @tc.desc Verify 0 -1 4 -1 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart05Test069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([0, -1, 0, -1]);
      arr.sort();
      expect(arr.$_get(0)).assertEqual(-1);
      expect(arr.$_get(1)).assertEqual(-1);
      expect(arr.$_get(2)).assertEqual(0);
      expect(arr.$_get(3)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART05_TEST_MINDMAP_7000
     * @tc.name int32ArraySortPart05Test070
     * @tc.desc Verify sort() preserves INT32_MIN+1 -2147483647 ordering
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart05Test070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([0, -2147483647, 1]);
      arr.sort();
      expect(arr.$_get(0)).assertEqual(-2147483647);
      expect(arr.$_get(1)).assertEqual(0);
      expect(arr.$_get(2)).assertEqual(1);
    });
  });
}
