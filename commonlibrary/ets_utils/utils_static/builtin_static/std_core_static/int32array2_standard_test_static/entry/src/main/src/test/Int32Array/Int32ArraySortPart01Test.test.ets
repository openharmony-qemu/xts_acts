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

export default function int32ArraySortPart01Test(): void {
  describe('Int32ArraySortPart01Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART01_TEST_MINDMAP_0100
     * @tc.name int32ArraySortPart01TestMindmapTest001
     * @tc.desc Verify 0 sort() length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart01TestMindmapTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([7, 2, 5]);
      arr.sort();
      expect(arr.length).assertEqual(3);
      expect(arr.$_get(0)).assertEqual(2);
      expect(arr.$_get(1)).assertEqual(5);
      expect(arr.$_get(2)).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART01_TEST_MINDMAP_0200
     * @tc.name int32ArraySortPart01TestMindmapTest002
     * @tc.desc Verify 0 sort() (length=0) no-op
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart01TestMindmapTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(0);
      arr.sort();
      expect(arr.length).assertEqual(0);
      expect(arr.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART01_TEST_MINDMAP_0300
     * @tc.name int32ArraySortPart01TestMindmapTest003
     * @tc.desc Verify 0 sort() no-op
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart01TestMindmapTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([99]);
      arr.sort();
      expect(arr.$_get(0)).assertEqual(99);
      expect(arr.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART01_TEST_MINDMAP_0400
     * @tc.name int32ArraySortPart01TestMindmapTest004
     * @tc.desc Verify 1 compareFn
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart01TestMindmapTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([4, 1, 3]);
      arr.sort((a: number, b: number): int => (a - b).toInt());
      expect(arr.length).assertEqual(3);
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.$_get(1)).assertEqual(3);
      expect(arr.$_get(2)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART01_TEST_MINDMAP_0500
     * @tc.name int32ArraySortPart01TestMindmapTest005
     * @tc.desc Verify undefined compareFn 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart01TestMindmapTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([6, 2, 4, 1]);
      arr.sort(undefined);
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.$_get(1)).assertEqual(2);
      expect(arr.$_get(2)).assertEqual(4);
      expect(arr.$_get(3)).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART01_TEST_MINDMAP_0600
     * @tc.name int32ArraySortPart01TestMindmapTest006
     * @tc.desc Verify compareFn -1 [a,b] [b,a]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart01TestMindmapTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2]);
      arr.sort((_a: number, _b: number): int => -1);
      expect(arr.length).assertEqual(2);
      let c1: int = 0;
      let c2: int = 0;
      for (let i: int = 0; i < arr.length; i++) {
        let v: int = arr.$_get(i).toInt();
        if (v === 1) {
          c1 = c1 + 1;
        } else if (v === 2) {
          c2 = c2 + 1;
        }
      }
      expect(c1).assertEqual(1);
      expect(c2).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART01_TEST_MINDMAP_0700
     * @tc.name int32ArraySortPart01TestMindmapTest007
     * @tc.desc Verify compareFn -100( ) a<b
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart01TestMindmapTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([2, 1]);
      let first: boolean = true;
      arr.sort((_a: number, _b: number): int => {
        if (first) {
          first = false;
          return -100;
        }
        return 0;
      });
      expect(arr.length).assertEqual(2);
      let c1: int = 0;
      let c2: int = 0;
      for (let i: int = 0; i < arr.length; i++) {
        let v: int = arr.$_get(i).toInt();
        if (v === 1) {
          c1 = c1 + 1;
        } else if (v === 2) {
          c2 = c2 + 1;
        }
      }
      expect(c1).assertEqual(1);
      expect(c2).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART01_TEST_MINDMAP_0800
     * @tc.name int32ArraySortPart01TestMindmapTest008
     * @tc.desc Verify compareFn INT32_MIN(-2147483648)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart01TestMindmapTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([2, 1]);
      let first: boolean = true;
      arr.sort((_a: number, _b: number): int => {
        if (first) {
          first = false;
          return -2147483648;
        }
        return 0;
      });
      expect(arr.length).assertEqual(2);
      let c1: int = 0;
      let c2: int = 0;
      for (let i: int = 0; i < arr.length; i++) {
        let v: int = arr.$_get(i).toInt();
        if (v === 1) {
          c1 = c1 + 1;
        } else if (v === 2) {
          c2 = c2 + 1;
        }
      }
      expect(c1).assertEqual(1);
      expect(c2).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART01_TEST_MINDMAP_0900
     * @tc.name int32ArraySortPart01TestMindmapTest009
     * @tc.desc Verify compareFn b-a
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart01TestMindmapTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([3, 7, 1, 9, 4]);
      arr.sort((a: number, b: number): int => (b - a).toInt());
      expect(arr.$_get(0)).assertEqual(9);
      expect(arr.$_get(1)).assertEqual(7);
      expect(arr.$_get(2)).assertEqual(4);
      expect(arr.$_get(3)).assertEqual(3);
      expect(arr.$_get(4)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART01_TEST_MINDMAP_1000
     * @tc.name int32ArraySortPart01TestMindmapTest010
     * @tc.desc Verify compareFn 0 length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart01TestMindmapTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([5, 2, 8, 1]);
      arr.sort((_a: number, _b: number): int => 0);
      expect(arr.length).assertEqual(4);
      let c1: int = 0;
      let c2: int = 0;
      let c5: int = 0;
      let c8: int = 0;
      for (let i: int = 0; i < arr.length; i++) {
        let v: int = arr.$_get(i).toInt();
        if (v === 1) {
          c1 = c1 + 1;
        } else if (v === 2) {
          c2 = c2 + 1;
        } else if (v === 5) {
          c5 = c5 + 1;
        } else if (v === 8) {
          c8 = c8 + 1;
        }
      }
      expect(c1).assertEqual(1);
      expect(c2).assertEqual(1);
      expect(c5).assertEqual(1);
      expect(c8).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART01_TEST_MINDMAP_1100
     * @tc.name int32ArraySortPart01TestMindmapTest011
     * @tc.desc Verify compareFn ( ) 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart01TestMindmapTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([7, 7, 7]);
      arr.sort((a: number, b: number): int => (a - b).toInt());
      expect(arr.$_get(0)).assertEqual(7);
      expect(arr.$_get(1)).assertEqual(7);
      expect(arr.$_get(2)).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART01_TEST_MINDMAP_1200
     * @tc.name int32ArraySortPart01TestMindmapTest012
     * @tc.desc Verify a comparator that always returns zero preserves the original element order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart01TestMindmapTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([4, 1, 3]);
      arr.sort((_a: number, _b: number): int => 0);
      expect(arr.length).assertEqual(3);
      expect(arr.$_get(0)).assertEqual(4);
      expect(arr.$_get(1)).assertEqual(1);
      expect(arr.$_get(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART01_TEST_MINDMAP_1300
     * @tc.name int32ArraySortPart01TestMindmapTest013
     * @tc.desc Verify compareFn 1 [a,b] a>b b ( )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart01TestMindmapTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([2, 1]);
      arr.sort((_a: number, _b: number): int => 1);
      expect(arr.length).assertEqual(2);
      let c1: int = 0;
      let c2: int = 0;
      for (let i: int = 0; i < arr.length; i++) {
        let v: int = arr.$_get(i).toInt();
        if (v === 1) {
          c1 = c1 + 1;
        } else if (v === 2) {
          c2 = c2 + 1;
        }
      }
      expect(c1).assertEqual(1);
      expect(c2).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART01_TEST_MINDMAP_1400
     * @tc.name int32ArraySortPart01TestMindmapTest014
     * @tc.desc Verify compareFn 100( ) a>b
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart01TestMindmapTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2]);
      let first: boolean = true;
      arr.sort((_a: number, _b: number): int => {
        if (first) {
          first = false;
          return 100;
        }
        return 0;
      });
      expect(arr.length).assertEqual(2);
      let c1: int = 0;
      let c2: int = 0;
      for (let i: int = 0; i < arr.length; i++) {
        let v: int = arr.$_get(i).toInt();
        if (v === 1) {
          c1 = c1 + 1;
        } else if (v === 2) {
          c2 = c2 + 1;
        }
      }
      expect(c1).assertEqual(1);
      expect(c2).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART01_TEST_MINDMAP_1500
     * @tc.name int32ArraySortPart01TestMindmapTest015
     * @tc.desc Verify compareFn INT32_MAX(2147483647)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart01TestMindmapTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2]);
      let first: boolean = true;
      arr.sort((_a: number, _b: number): int => {
        if (first) {
          first = false;
          return 2147483647;
        }
        return 0;
      });
      expect(arr.length).assertEqual(2);
      let c1: int = 0;
      let c2: int = 0;
      for (let i: int = 0; i < arr.length; i++) {
        let v: int = arr.$_get(i).toInt();
        if (v === 1) {
          c1 = c1 + 1;
        } else if (v === 2) {
          c2 = c2 + 1;
        }
      }
      expect(c1).assertEqual(1);
      expect(c2).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART01_TEST_MINDMAP_1600
     * @tc.name int32ArraySortPart01TestMindmapTest016
     * @tc.desc Verify compareFn a-b
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart01TestMindmapTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-4, 7, -1, 0, 3]);
      arr.sort((a: number, b: number): int => (a - b).toInt());
      expect(arr.$_get(0)).assertEqual(-4);
      expect(arr.$_get(1)).assertEqual(-1);
      expect(arr.$_get(2)).assertEqual(0);
      expect(arr.$_get(3)).assertEqual(3);
      expect(arr.$_get(4)).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART01_TEST_MINDMAP_1700
     * @tc.name int32ArraySortPart01TestMindmapTest017
     * @tc.desc Verify compareFn (< -1,> 1,== 0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart01TestMindmapTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([9, -3, 0, 42, -7]);
      arr.sort((a: number, b: number): int => {
        if (a < b) {
          return -1;
        }
        if (a > b) {
          return 1;
        }
        return 0;
      });
      expect(arr.$_get(0)).assertEqual(-7);
      expect(arr.$_get(1)).assertEqual(-3);
      expect(arr.$_get(2)).assertEqual(0);
      expect(arr.$_get(3)).assertEqual(9);
      expect(arr.$_get(4)).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART01_TEST_MINDMAP_1800
     * @tc.name int32ArraySortPart01TestMindmapTest018
     * @tc.desc Verify compareFn 1.5 ToInt32 1( )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart01TestMindmapTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([2, 1]);
      let first: boolean = true;
      arr.sort((_a: number, _b: number): int => {
        if (first) {
          first = false;
          return 1;
        }
        return 0;
      });
      expect(arr.length).assertEqual(2);
      let c1: int = 0;
      let c2: int = 0;
      for (let i: int = 0; i < arr.length; i++) {
        let v: int = arr.$_get(i).toInt();
        if (v === 1) {
          c1 = c1 + 1;
        } else if (v === 2) {
          c2 = c2 + 1;
        }
      }
      expect(c1).assertEqual(1);
      expect(c2).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART01_TEST_MINDMAP_1900
     * @tc.name int32ArraySortPart01TestMindmapTest019
     * @tc.desc Verify compareFn -1.5 ToInt32 -1( )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart01TestMindmapTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2]);
      let first: boolean = true;
      arr.sort((_a: number, _b: number): int => {
        if (first) {
          first = false;
          return -1;
        }
        return 0;
      });
      expect(arr.length).assertEqual(2);
      let c1: int = 0;
      let c2: int = 0;
      for (let i: int = 0; i < arr.length; i++) {
        let v: int = arr.$_get(i).toInt();
        if (v === 1) {
          c1 = c1 + 1;
        } else if (v === 2) {
          c2 = c2 + 1;
        }
      }
      expect(c1).assertEqual(1);
      expect(c2).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART01_TEST_MINDMAP_2000
     * @tc.name int32ArraySortPart01TestMindmapTest020
     * @tc.desc Verify compareFn 0  ToInt32 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart01TestMindmapTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([2, 1]);
      let first: boolean = true;
      arr.sort((_a: number, _b: number): int => {
        if (first) {
          first = false;
          return 0;
        }
        return 0;
      });
      expect(arr.length).assertEqual(2);
      let c1: int = 0;
      let c2: int = 0;
      for (let i: int = 0; i < arr.length; i++) {
        let v: int = arr.$_get(i).toInt();
        if (v === 1) {
          c1 = c1 + 1;
        } else if (v === 2) {
          c2 = c2 + 1;
        }
      }
      expect(c1).assertEqual(1);
      expect(c2).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART01_TEST_MINDMAP_2100
     * @tc.name int32ArraySortPart01TestMindmapTest021
     * @tc.desc Verify compareFn receives source values and sorts ascending
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart01TestMindmapTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([42, 7]);
      let comparatorCalled: boolean = false;
      let parametersFromInput: boolean = true;
      arr.sort((a: number, b: number): int => {
        comparatorCalled = true;
        if ((a !== 42 && a !== 7) || (b !== 42 && b !== 7)) {
          parametersFromInput = false;
        }
        return (a - b).toInt();
      });
      expect(comparatorCalled).assertTrue();
      expect(parametersFromInput).assertTrue();
      expect(arr.$_get(0)).assertEqual(7);
      expect(arr.$_get(1)).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART01_TEST_MINDMAP_2200
     * @tc.name int32ArraySortPart01TestMindmapTest022
     * @tc.desc Verify compareFn returning zero preserves element order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart01TestMindmapTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([3, 1, 2]);
      let cnt: number = 0;
      arr.sort((_a: number, _b: number): int => {
        cnt = cnt + 1;
        return 0;
      });
      expect(cnt).assertLarger(0);
      expect(arr.$_get(0)).assertEqual(3);
      expect(arr.$_get(1)).assertEqual(1);
      expect(arr.$_get(2)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART01_TEST_MINDMAP_2300
     * @tc.name int32ArraySortPart01TestMindmapTest023
     * @tc.desc Verify a one-element sort does not invoke compareFn and preserves 77
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart01TestMindmapTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([77]);
      let called: boolean = false;
      arr.sort((_a: number, _b: number): int => {
        called = true;
        return 0;
      });
      expect(called).assertFalse();
      expect(arr.$_get(0)).assertEqual(77);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART01_TEST_MINDMAP_2400
     * @tc.name int32ArraySortPart01TestMindmapTest024
     * @tc.desc Verify compareFn with direction -1 sorts three elements descending
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart01TestMindmapTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dir: number = -1;
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      arr.sort((a: number, b: number): int => ((a - b) * dir).toInt());
      expect(arr.$_get(0)).assertEqual(3);
      expect(arr.$_get(1)).assertEqual(2);
      expect(arr.$_get(2)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART01_TEST_MINDMAP_2500
     * @tc.name int32ArraySortPart01TestMindmapTest025
     * @tc.desc Verify compareFn ( )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart01TestMindmapTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([5, 5, 5, 5]);
      let cnt: number = 0;
      arr.sort((_a: number, _b: number): int => {
        cnt = cnt + 1;
        return 0;
      });
      expect(arr.$_get(0)).assertEqual(5);
      expect(arr.$_get(3)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART01_TEST_MINDMAP_2600
     * @tc.name int32ArraySortPart01TestMindmapTest026
     * @tc.desc Verify compareFn returns consistent positive and negative values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart01TestMindmapTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([3, 1, 4, 2]);
      let compareCount: int = 0;
      arr.sort((a: number, b: number): int => {
        compareCount = compareCount + 1;
        return a < b ? -1 : (a > b ? 1 : 0);
      });
      expect(compareCount).assertLarger(0);
      expect(arr.length).assertEqual(4);
      let sum: int = 0;
      let sumSquares: int = 0;
      for (let i: int = 0; i < arr.length; i++) {
        let value: int = arr.$_get(i).toInt();
        expect(value).assertEqual(i + 1);
        sum = sum + value;
        sumSquares = sumSquares + value * value;
      }
      expect(sum).assertEqual(10);
      expect(sumSquares).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART01_TEST_MINDMAP_2700
     * @tc.name int32ArraySortPart01TestMindmapTest027
     * @tc.desc Verify 0 sort()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart01TestMindmapTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4, 5, 6]);
      arr.sort();
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.$_get(1)).assertEqual(2);
      expect(arr.$_get(2)).assertEqual(3);
      expect(arr.$_get(3)).assertEqual(4);
      expect(arr.$_get(4)).assertEqual(5);
      expect(arr.$_get(5)).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART01_TEST_MINDMAP_2800
     * @tc.name int32ArraySortPart01TestMindmapTest028
     * @tc.desc Verify 0 sort()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart01TestMindmapTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([6, 5, 4, 3, 2, 1]);
      arr.sort();
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.$_get(1)).assertEqual(2);
      expect(arr.$_get(2)).assertEqual(3);
      expect(arr.$_get(3)).assertEqual(4);
      expect(arr.$_get(4)).assertEqual(5);
      expect(arr.$_get(5)).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART01_TEST_MINDMAP_2900
     * @tc.name int32ArraySortPart01TestMindmapTest029
     * @tc.desc Verify 0 sort()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart01TestMindmapTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([12, -5, 0, 37, -99, 8]);
      arr.sort();
      expect(arr.$_get(0)).assertEqual(-99);
      expect(arr.$_get(1)).assertEqual(-5);
      expect(arr.$_get(2)).assertEqual(0);
      expect(arr.$_get(3)).assertEqual(8);
      expect(arr.$_get(4)).assertEqual(12);
      expect(arr.$_get(5)).assertEqual(37);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART01_TEST_MINDMAP_3000
     * @tc.name int32ArraySortPart01TestMindmapTest030
     * @tc.desc Verify 0 sort()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart01TestMindmapTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([8, 8, 8, 8, 8]);
      arr.sort();
      expect(arr.$_get(0)).assertEqual(8);
      expect(arr.$_get(1)).assertEqual(8);
      expect(arr.$_get(2)).assertEqual(8);
      expect(arr.$_get(3)).assertEqual(8);
      expect(arr.$_get(4)).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART01_TEST_MINDMAP_3100
     * @tc.name int32ArraySortPart01TestMindmapTest031
     * @tc.desc Verify 0 sort()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart01TestMindmapTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([2, 1]);
      arr.sort();
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.$_get(1)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART01_TEST_MINDMAP_3200
     * @tc.name int32ArraySortPart01TestMindmapTest032
     * @tc.desc Verify 0 sort()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart01TestMindmapTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([4, 1, 4, 2, 1, 2]);
      arr.sort();
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.$_get(1)).assertEqual(1);
      expect(arr.$_get(2)).assertEqual(2);
      expect(arr.$_get(3)).assertEqual(2);
      expect(arr.$_get(4)).assertEqual(4);
      expect(arr.$_get(5)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART01_TEST_MINDMAP_3300
     * @tc.name int32ArraySortPart01TestMindmapTest033
     * @tc.desc Verify 0 sort() -1 0 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart01TestMindmapTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([0, -1]);
      arr.sort();
      expect(arr.$_get(0)).assertEqual(-1);
      expect(arr.$_get(1)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART01_TEST_MINDMAP_3400
     * @tc.name int32ArraySortPart01TestMindmapTest034
     * @tc.desc Verify 0 sort() INT32_MAX(2147483647) MAX
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart01TestMindmapTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2147483647, 50]);
      arr.sort();
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.$_get(1)).assertEqual(50);
      expect(arr.$_get(2)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART01_TEST_MINDMAP_3500
     * @tc.name int32ArraySortPart01TestMindmapTest035
     * @tc.desc Verify 0 sort() INT32_MIN(-2147483648 ) MIN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart01TestMindmapTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-1, -2147483648, -50]);
      arr.sort();
      expect(arr.$_get(0)).assertEqual(-2147483648);
      expect(arr.$_get(1)).assertEqual(-50);
      expect(arr.$_get(2)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART01_TEST_MINDMAP_3600
     * @tc.name int32ArraySortPart01TestMindmapTest036
     * @tc.desc Verify 0 sort() INT32_MAX INT32_MIN 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart01TestMindmapTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([0, 2147483647, -2147483648]);
      arr.sort();
      expect(arr.$_get(0)).assertEqual(-2147483648);
      expect(arr.$_get(1)).assertEqual(0);
      expect(arr.$_get(2)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART01_TEST_MINDMAP_3700
     * @tc.name int32ArraySortPart01TestMindmapTest037
     * @tc.desc Verify 0 sort()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart01TestMindmapTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-7, 14, -14, 7, 0]);
      arr.sort();
      expect(arr.$_get(0)).assertEqual(-14);
      expect(arr.$_get(1)).assertEqual(-7);
      expect(arr.$_get(2)).assertEqual(0);
      expect(arr.$_get(3)).assertEqual(7);
      expect(arr.$_get(4)).assertEqual(14);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART01_TEST_MINDMAP_3800
     * @tc.name int32ArraySortPart01TestMindmapTest038
     * @tc.desc Verify 0 sort() (0x10=16 2 )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart01TestMindmapTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([0x10, 0x2, 0x1]);
      arr.sort();
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.$_get(1)).assertEqual(2);
      expect(arr.$_get(2)).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART01_TEST_MINDMAP_3900
     * @tc.name int32ArraySortPart01TestMindmapTest039
     * @tc.desc Verify 0 sort() (0o10=8)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart01TestMindmapTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([0o10, 0o2, 0o1]);
      arr.sort();
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.$_get(1)).assertEqual(2);
      expect(arr.$_get(2)).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART01_TEST_MINDMAP_4000
     * @tc.name int32ArraySortPart01TestMindmapTest040
     * @tc.desc Verify 0 sort() (0b100=4)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart01TestMindmapTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([0b100, 0b10, 0b1]);
      arr.sort();
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.$_get(1)).assertEqual(2);
      expect(arr.$_get(2)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART01_TEST_MINDMAP_4100
     * @tc.name int32ArraySortPart01TestMindmapTest041
     * @tc.desc Verify compareFn INT32_MAX INT32_MIN 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart01TestMindmapTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([2147483647, -2147483648, 0]);
      arr.sort((a: number, b: number): int => {
        if (a < b) {
          return -1;
        }
        if (a > b) {
          return 1;
        }
        return 0;
      });
      expect(arr.$_get(0)).assertEqual(-2147483648);
      expect(arr.$_get(1)).assertEqual(0);
      expect(arr.$_get(2)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART01_TEST_MINDMAP_4200
     * @tc.name int32ArraySortPart01TestMindmapTest042
     * @tc.desc Verify compareFn INT32_MAX INT32_MIN 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart01TestMindmapTest042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-2147483648, 0, 2147483647]);
      arr.sort((a: number, b: number): int => {
        if (a < b) {
          return 1;
        }
        if (a > b) {
          return -1;
        }
        return 0;
      });
      expect(arr.$_get(0)).assertEqual(2147483647);
      expect(arr.$_get(1)).assertEqual(0);
      expect(arr.$_get(2)).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART01_TEST_MINDMAP_4300
     * @tc.name int32ArraySortPart01TestMindmapTest043
     * @tc.desc Verify compareFn (-1,-5,-3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart01TestMindmapTest043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-1, -5, -3]);
      arr.sort((a: number, b: number): int => (a - b).toInt());
      expect(arr.$_get(0)).assertEqual(-5);
      expect(arr.$_get(1)).assertEqual(-3);
      expect(arr.$_get(2)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART01_TEST_MINDMAP_4400
     * @tc.name int32ArraySortPart01TestMindmapTest044
     * @tc.desc Verify compareFn 1 (a-b= 1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart01TestMindmapTest044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([3, 2]);
      arr.sort((a: number, b: number): int => (a - b).toInt());
      expect(arr.$_get(0)).assertEqual(2);
      expect(arr.$_get(1)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART01_TEST_MINDMAP_4500
     * @tc.name int32ArraySortPart01TestMindmapTest045
     * @tc.desc Verify compareFn 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart01TestMindmapTest045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([0, 0, 0, 0]);
      arr.sort((a: number, b: number): int => (a - b).toInt());
      expect(arr.$_get(0)).assertEqual(0);
      expect(arr.$_get(1)).assertEqual(0);
      expect(arr.$_get(2)).assertEqual(0);
      expect(arr.$_get(3)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART01_TEST_MINDMAP_4600
     * @tc.name int32ArraySortPart01TestMindmapTest046
     * @tc.desc Verify compareFn (0 )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart01TestMindmapTest046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-4, 1, -2, 0, 3]);
      arr.sort((a: number, b: number): int => {
        let aa: number = a < 0 ? -a : a;
        let bb: number = b < 0 ? -b : b;
        return (aa - bb).toInt();
      });
      expect(arr.$_get(0)).assertEqual(0);
      expect(arr.$_get(4)).assertEqual(-4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART01_TEST_MINDMAP_4700
     * @tc.name int32ArraySortPart01TestMindmapTest047
     * @tc.desc Verify compareFn ( )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart01TestMindmapTest047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([5, 2, 7, 4, 1, 6]);
      arr.sort((a: number, b: number): int => {
        let am: number = (a.toInt()) % 2;
        let bm: number = (b.toInt()) % 2;
        return (am - bm).toInt();
      });
      expect(arr.$_get(0) % 2).assertEqual(0);
      expect(arr.$_get(1) % 2).assertEqual(0);
      expect(arr.$_get(2) % 2).assertEqual(0);
      expect(arr.$_get(3) % 2).assertEqual(1);
      expect(arr.$_get(4) % 2).assertEqual(1);
      expect(arr.$_get(5) % 2).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART01_TEST_MINDMAP_4800
     * @tc.name int32ArraySortPart01TestMindmapTest048
     * @tc.desc Verify compareFn -1( a<b) 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart01TestMindmapTest048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([3, 1, 2]);
      arr.sort((_a: number, _b: number): int => -1);
      expect(arr.length).assertEqual(3);
      let c1: int = 0;
      let c2: int = 0;
      let c3: int = 0;
      for (let i: int = 0; i < arr.length; i++) {
        let v: int = arr.$_get(i).toInt();
        if (v === 1) {
          c1 = c1 + 1;
        } else if (v === 2) {
          c2 = c2 + 1;
        } else if (v === 3) {
          c3 = c3 + 1;
        }
      }
      expect(c1).assertEqual(1);
      expect(c2).assertEqual(1);
      expect(c3).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART01_TEST_MINDMAP_4900
     * @tc.name int32ArraySortPart01TestMindmapTest049
     * @tc.desc Verify compareFn 1( a>b) 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart01TestMindmapTest049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([3, 1, 2]);
      arr.sort((_a: number, _b: number): int => 1);
      expect(arr.length).assertEqual(3);
      let c1: int = 0;
      let c2: int = 0;
      let c3: int = 0;
      for (let i: int = 0; i < arr.length; i++) {
        let v: int = arr.$_get(i).toInt();
        if (v === 1) {
          c1 = c1 + 1;
        } else if (v === 2) {
          c2 = c2 + 1;
        } else if (v === 3) {
          c3 = c3 + 1;
        }
      }
      expect(c1).assertEqual(1);
      expect(c2).assertEqual(1);
      expect(c3).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART01_TEST_MINDMAP_5000
     * @tc.name int32ArraySortPart01TestMindmapTest050
     * @tc.desc Verify compareFn 0 0(-0 ) 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart01TestMindmapTest050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([0, 0]);
      arr.sort((a: number, b: number): int => (a - b).toInt());
      expect(arr.$_get(0)).assertEqual(0);
      expect(arr.$_get(1)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART01_TEST_MINDMAP_5100
     * @tc.name int32ArraySortPart01TestMindmapTest051
     * @tc.desc Verify compareFn+ sort compareFn length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart01TestMindmapTest051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(0);
      let called: boolean = false;
      arr.sort((_a: number, _b: number): int => {
        called = true;
        return 0;
      });
      expect(called).assertFalse();
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART01_TEST_MINDMAP_5200
     * @tc.name int32ArraySortPart01TestMindmapTest052
     * @tc.desc Verify 0 sort() INT32_MIN INT32_MIN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart01TestMindmapTest052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-2147483648]);
      arr.sort();
      expect(arr.$_get(0)).assertEqual(-2147483648);
      expect(arr.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART01_TEST_MINDMAP_5300
     * @tc.name int32ArraySortPart01TestMindmapTest053
     * @tc.desc Verify 0 sort() INT32_MAX INT32_MAX
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart01TestMindmapTest053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([2147483647]);
      arr.sort();
      expect(arr.$_get(0)).assertEqual(2147483647);
      expect(arr.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART01_TEST_MINDMAP_5400
     * @tc.name int32ArraySortPart01TestMindmapTest054
     * @tc.desc Verify 0 sort() 0 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart01TestMindmapTest054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([0]);
      arr.sort();
      expect(arr.$_get(0)).assertEqual(0);
      expect(arr.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART01_TEST_MINDMAP_5500
     * @tc.name int32ArraySortPart01TestMindmapTest055
     * @tc.desc Verify compareFn 1 (2^32+1) ToInt32 1( )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart01TestMindmapTest055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2]);
      let first: boolean = true;
      arr.sort((_a: number, _b: number): int => {
        if (first) {
          first = false;
          return 1 as int;
        }
        return 0;
      });
      expect(arr.length).assertEqual(2);
      let c1: int = 0;
      let c2: int = 0;
      for (let i: int = 0; i < arr.length; i++) {
        let v: int = arr.$_get(i).toInt();
        if (v === 1) {
          c1 = c1 + 1;
        } else if (v === 2) {
          c2 = c2 + 1;
        }
      }
      expect(c1).assertEqual(1);
      expect(c2).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART01_TEST_MINDMAP_5600
     * @tc.name int32ArraySortPart01TestMindmapTest056
     * @tc.desc Verify compareFn INT32_MIN INT32_MAX a-b
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart01TestMindmapTest056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-2147483648, 2147483647]);
      arr.sort((a: number, b: number): int => {
        if (a < b) {
          return -1;
        }
        if (a > b) {
          return 1;
        }
        return 0;
      });
      expect(arr.$_get(0)).assertEqual(-2147483648);
      expect(arr.$_get(1)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART01_TEST_MINDMAP_5700
     * @tc.name int32ArraySortPart01TestMindmapTest057
     * @tc.desc Verify compareFn INT32_MIN ( a-b )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart01TestMindmapTest057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([0, -2147483648, 1, -1]);
      arr.sort((a: number, b: number): int => {
        if (a < b) {
          return -1;
        }
        if (a > b) {
          return 1;
        }
        return 0;
      });
      expect(arr.$_get(0)).assertEqual(-2147483648);
      expect(arr.$_get(1)).assertEqual(-1);
      expect(arr.$_get(2)).assertEqual(0);
      expect(arr.$_get(3)).assertEqual(1);
    });


  });
}
