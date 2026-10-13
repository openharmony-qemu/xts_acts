'use static';

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
  beforeEach,
  afterEach,
  afterAll,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType,
} from '../../../../hypium/index';
import Utils from './../Util.test';

function namedCmpTest008(a: number, b: number): int {
  return a < b ? -1 : a > b ? 1 : 0;
}

export default function int8ArraySortPart01Test(): void {
  describe('Int8ArraySortPart01Test', (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll(async (): Promise<void> => {
      await Utils.releaseAfterEachTest();
    });

    const INT8_MAX = 127;
    const INT8_MIN = -128;

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SORT_PART01_TEST_0100
     * @tc.name int8ArraySortPart01Test001
     * @tc.desc Verify sort() [3, 1, 2] [1, 2, 3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySortPart01Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([3, 1, 2]);
      arr.sort();
      let r1: number = arr.$_get(0);
      let e1: int = 1;
      expect(r1).assertEqual(e1);
      let r2: number = arr.$_get(1);
      let e2: int = 2;
      expect(r2).assertEqual(e2);
      let r3: number = arr.$_get(2);
      let e3: int = 3;
      expect(r3).assertEqual(e3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SORT_PART01_TEST_0200
     * @tc.name int8ArraySortPart01Test002
     * @tc.desc Verify sort() [1, 2, 3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySortPart01Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3]);
      arr.sort();
      let r1: number = arr.$_get(0);
      let e1: int = 1;
      expect(r1).assertEqual(e1);
      let r2: number = arr.$_get(2);
      let e2: int = 3;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SORT_PART01_TEST_0300
     * @tc.name int8ArraySortPart01Test003
     * @tc.desc Verify sort() [3, 2, 1] [1, 2, 3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySortPart01Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([3, 2, 1]);
      arr.sort();
      let r1: number = arr.$_get(0);
      let e1: int = 1;
      expect(r1).assertEqual(e1);
      let r2: number = arr.$_get(2);
      let e2: int = 3;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SORT_PART01_TEST_0400
     * @tc.name int8ArraySortPart01Test004
     * @tc.desc Verify sort(compareFn) [1, 2, 3] [3, 2, 1]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySortPart01Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3]);
      arr.sort((a: number, b: number): int => {
        return a > b ? -1 : a < b ? 1 : 0;
      });
      let r1: number = arr.$_get(0);
      let e1: int = 3;
      expect(r1).assertEqual(e1);
      let r2: number = arr.$_get(2);
      let e2: int = 1;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SORT_PART01_TEST_0500
     * @tc.name int8ArraySortPart01Test005
     * @tc.desc Verify sort compareFn [2, 1] [1, 2] with inline comparator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySortPart01Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([2, 1]);
      let cmp = (a: number, b: number): int => {
        return a < b ? -1 : a > b ? 1 : 0;
      };
      arr.sort(cmp);
      let r1: number = arr.$_get(0);
      let e1: int = 1;
      expect(r1).assertEqual(e1);
      let r2: number = arr.$_get(1);
      let e2: int = 2;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SORT_PART01_TEST_0600
     * @tc.name int8ArraySortPart01Test006
     * @tc.desc Verify sort compareFn [2, 1] [1, 2] with named comparator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySortPart01Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([2, 1]);
      arr.sort(namedCmpTest008);
      let r1: number = arr.$_get(0);
      let e1: int = 1;
      expect(r1).assertEqual(e1);
      let r2: number = arr.$_get(1);
      let e2: int = 2;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SORT_PART01_TEST_0700
     * @tc.name int8ArraySortPart01Test007
     * @tc.desc Verify sort compareFn -1 [2, 1] [1, 2]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySortPart01Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([2, 1]);

      arr.sort((a: number, b: number): int => {
        return -1;
      });

      let r1: int = arr.length;
      let e1: int = 2;
      expect(r1).assertEqual(e1);
      let r2: number = arr.$_get(0);
      let e2: int = 1;
      expect(r2).assertEqual(e2);
      let r3: number = arr.$_get(1);
      let e3: int = 2;
      expect(r3).assertEqual(e3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SORT_PART01_TEST_0800
     * @tc.name int8ArraySortPart01Test008
     * @tc.desc Verify sort compareFn 0 [2, 1] [2, 1]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySortPart01Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([2, 1]);
      arr.sort((a: number, b: number): int => {
        return 0;
      });
      let r1: number = arr.$_get(0);
      let e1: int = 2;
      expect(r1).assertEqual(e1);
      let r2: number = arr.$_get(1);
      let e2: int = 1;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SORT_PART01_TEST_0900
     * @tc.name int8ArraySortPart01Test009
     * @tc.desc Verify sort compareFn 1 [1, 2] [1, 2]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySortPart01Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2]);

      arr.sort((a: number, b: number): int => {
        return 1;
      });

      let r1: int = arr.length;
      let e1: int = 2;
      expect(r1).assertEqual(e1);
      let r2: number = arr.$_get(0);
      let e2: int = 1;
      expect(r2).assertEqual(e2);
      let r3: number = arr.$_get(1);
      let e3: int = 2;
      expect(r3).assertEqual(e3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SORT_PART01_TEST_1000
     * @tc.name int8ArraySortPart01Test010
     * @tc.desc Verify sort compareFn direction=1 [2, 1] [1, 2]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySortPart01Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([2, 1]);
      arr.sort((a: number, b: number): int => {
        return a < b ? -1 : a > b ? 1 : 0;
      });
      let r1: number = arr.$_get(0);
      let e1: int = 1;
      expect(r1).assertEqual(e1);
      let r2: number = arr.$_get(1);
      let e2: int = 2;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SORT_PART01_TEST_1100
     * @tc.name int8ArraySortPart01Test011
     * @tc.desc Verify sort compareFn direction=-1 [1, 2] [2, 1]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySortPart01Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2]);
      arr.sort((a: number, b: number): int => {
        return a > b ? -1 : a < b ? 1 : 0;
      });
      let r1: number = arr.$_get(0);
      let e1: int = 2;
      expect(r1).assertEqual(e1);
      let r2: number = arr.$_get(1);
      let e2: int = 1;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SORT_PART01_TEST_1200
     * @tc.name int8ArraySortPart01Test012
     * @tc.desc Verify sort compareFn [2, 1] callCount=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySortPart01Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let callCount: number = 0;
      let arr = new Int8Array([2, 1]);
      arr.sort((a: number, b: number): int => {
        callCount = callCount + 1;
        return a < b ? -1 : a > b ? 1 : 0;
      });
      expect(callCount).assertEqual(1);
      let r1: number = arr.$_get(0);
      let e1: int = 1;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SORT_PART01_TEST_1300
     * @tc.name int8ArraySortPart01Test013
     * @tc.desc Verify sort compareFn int -2147483648 [1, 2] [2, 1]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySortPart01Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2]);
      arr.sort((a: number, b: number): int => {
        return -2147483648;
      });
      let r1: int = arr.length;
      let e1: int = 2;
      expect(r1).assertEqual(e1);
      let r2: number = arr.$_get(0);
      let e2: int = 2;
      expect(r2).assertEqual(e2);
      let r3: number = arr.$_get(1);
      let e3: int = 1;
      expect(r3).assertEqual(e3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SORT_PART01_TEST_1400
     * @tc.name int8ArraySortPart01Test014
     * @tc.desc Verify sort compareFn int 2147483647 [1, 2] [1, 2]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySortPart01Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2]);
      arr.sort((a: number, b: number): int => {
        return 2147483647;
      });
      let r1: int = arr.length;
      let e1: int = 2;
      expect(r1).assertEqual(e1);
      let r2: number = arr.$_get(0);
      let e2: int = 1;
      expect(r2).assertEqual(e2);
      let r3: number = arr.$_get(1);
      let e3: int = 2;
      expect(r3).assertEqual(e3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SORT_PART01_TEST_1500
     * @tc.name int8ArraySortPart01Test015
     * @tc.desc Verify sort compareFn a-b 255 int8 127-(-128) [127, -128]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySortPart01Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([INT8_MAX, INT8_MIN]);
      arr.sort((a: number, b: number): int => {
        return a < b ? -1 : a > b ? 1 : 0;
      });
      let r1: number = arr.$_get(0);
      let e1: number = INT8_MIN;
      expect(r1).assertEqual(e1);
      let r2: number = arr.$_get(1);
      let e2: number = INT8_MAX;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SORT_PART01_TEST_1600
     * @tc.name int8ArraySortPart01Test016
     * @tc.desc Verify sort compareFn -1.9 -1 [1, 2] [2, 1]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySortPart01Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2]);
      arr.sort((a: number, b: number): int => {
        return -1;
      });
      let r1: int = arr.length;
      let e1: int = 2;
      expect(r1).assertEqual(e1);
      let r2: number = arr.$_get(0);
      let e2: int = 2;
      expect(r2).assertEqual(e2);
      let r3: number = arr.$_get(1);
      let e3: int = 1;
      expect(r3).assertEqual(e3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SORT_PART01_TEST_1700
     * @tc.name int8ArraySortPart01Test017
     * @tc.desc Verify sort compareFn RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySortPart01Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([2, 1]);
      try {
        arr.sort((a: number, b: number) => {
          throw new RangeError('range');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SORT_PART01_TEST_1800
     * @tc.name int8ArraySortPart01Test018
     * @tc.desc Verify sort compareFn is invoked and sorts [2, 1] ascending to [1, 2]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySortPart01Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let callCount: int = 0;
      let arr = new Int8Array([2, 1]);
      arr.sort((a: number, b: number): int => {
        callCount = callCount + 1;
        return a < b ? -1 : a > b ? 1 : 0;
      });
      let r1: int = arr.length;
      let e1: int = 2;
      expect(r1).assertEqual(e1);
      let invoked: boolean = callCount > 0;
      expect(invoked).assertTrue();
      let r2: number = arr.$_get(0);
      let e2: int = 1;
      expect(r2).assertEqual(e2);
      let r3: number = arr.$_get(1);
      let e3: int = 2;
      expect(r3).assertEqual(e3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SORT_PART01_TEST_1900
     * @tc.name int8ArraySortPart01Test019
     * @tc.desc Verify sort compareFn not invoked for empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySortPart01Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let callCount: number = 0;
      let arr = new Int8Array(0);
      arr.sort((a: number, b: number): int => {
        callCount = callCount + 1;
        return a < b ? -1 : a > b ? 1 : 0;
      });
      expect(callCount).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SORT_PART01_TEST_2000
     * @tc.name int8ArraySortPart01Test020
     * @tc.desc Verify sort compareFn not invoked for single-element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySortPart01Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let callCount: number = 0;
      let arr = new Int8Array([42]);
      arr.sort((a: number, b: number): int => {
        callCount = callCount + 1;
        return a < b ? -1 : a > b ? 1 : 0;
      });
      expect(callCount).assertEqual(0);
      let r1: number = arr.$_get(0);
      let e1: int = 42;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SORT_PART01_TEST_2100
     * @tc.name int8ArraySortPart01Test021
     * @tc.desc Verify sort [3, 1, 2] [1,2,3] [3,2,1]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySortPart01Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([3, 1, 2]);
      arr.sort();
      let r1: number = arr.$_get(0);
      let e1: int = 1;
      expect(r1).assertEqual(e1);
      arr.sort((a: number, b: number): int => {
        return a > b ? -1 : a < b ? 1 : 0;
      });
      let r2: number = arr.$_get(0);
      let e2: int = 3;
      expect(r2).assertEqual(e2);
      let r3: number = arr.$_get(2);
      let e3: int = 1;
      expect(r3).assertEqual(e3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SORT_PART01_TEST_2200
     * @tc.name int8ArraySortPart01Test022
     * @tc.desc Verify sort compareFn inner sort [3, 1, 2] [2, 1, 3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySortPart01Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([3, 1, 2]);
      arr.sort((a: number, b: number): int => {
        let inner = new Int8Array([a, b]);
        inner.sort();
        return inner.$_get(0) < inner.$_get(1) ? -1 : inner.$_get(0) > inner.$_get(1) ? 1 : 0;
      });
      let r1: int = arr.length;
      let e1: int = 3;
      expect(r1).assertEqual(e1);
      let r2: number = arr.$_get(0);
      let e2: int = 2;
      expect(r2).assertEqual(e2);
      let r3: number = arr.$_get(1);
      let e3: int = 1;
      expect(r3).assertEqual(e3);
      let r4: number = arr.$_get(2);
      let e4: int = 3;
      expect(r4).assertEqual(e4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SORT_PART01_TEST_2300
     * @tc.name int8ArraySortPart01Test023
     * @tc.desc Verify sort() [42] [42]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySortPart01Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([42]);
      arr.sort();
      let r1: number = arr.$_get(0);
      let e1: int = 42;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SORT_PART01_TEST_2400
     * @tc.name int8ArraySortPart01Test024
     * @tc.desc Verify sort(cmp) [42] [42]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySortPart01Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([42]);
      arr.sort((a: number, b: number): int => {
        return a < b ? -1 : a > b ? 1 : 0;
      });
      let r1: number = arr.$_get(0);
      let e1: int = 42;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SORT_PART01_TEST_2500
     * @tc.name int8ArraySortPart01Test025
     * @tc.desc Verify [2, 1] sort() [1, 2]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySortPart01Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([2, 1]);
      arr.sort();
      let r1: number = arr.$_get(0);
      let e1: int = 1;
      expect(r1).assertEqual(e1);
      let r2: number = arr.$_get(1);
      let e2: int = 2;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SORT_PART01_TEST_2600
     * @tc.name int8ArraySortPart01Test026
     * @tc.desc Verify [5, 5, 5] sort()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySortPart01Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([5, 5, 5]);
      arr.sort();
      let r1: number = arr.$_get(0);
      let e1: int = 5;
      expect(r1).assertEqual(e1);
      let r2: number = arr.$_get(2);
      let e2: int = 5;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SORT_PART01_TEST_2700
     * @tc.name int8ArraySortPart01Test027
     * @tc.desc Verify [1, 2, 3, 4] sort()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySortPart01Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3, 4]);
      arr.sort();
      let r1: number = arr.$_get(0);
      let e1: int = 1;
      expect(r1).assertEqual(e1);
      let r2: number = arr.$_get(3);
      let e2: int = 4;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SORT_PART01_TEST_2800
     * @tc.name int8ArraySortPart01Test028
     * @tc.desc Verify [4, 3, 2, 1] sort() [1, 2, 3, 4]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySortPart01Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([4, 3, 2, 1]);
      arr.sort();
      let r1: number = arr.$_get(0);
      let e1: int = 1;
      expect(r1).assertEqual(e1);
      let r2: number = arr.$_get(3);
      let e2: int = 4;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SORT_PART01_TEST_2900
     * @tc.name int8ArraySortPart01Test029
     * @tc.desc Verify [-3, -1, -2] sort() [-3, -2, -1]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySortPart01Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([-3, -1, -2]);
      arr.sort();
      let r1: number = arr.$_get(0);
      let e1: int = -3;
      expect(r1).assertEqual(e1);
      let r2: number = arr.$_get(2);
      let e2: int = -1;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SORT_PART01_TEST_3000
     * @tc.name int8ArraySortPart01Test030
     * @tc.desc Verify MIN/MAX int8 [-128, 127, 0] sort() [-128, 0, 127]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySortPart01Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([INT8_MIN, INT8_MAX, 0]);
      arr.sort();
      let r1: number = arr.$_get(0);
      let e1: number = INT8_MIN;
      expect(r1).assertEqual(e1);
      let r2: number = arr.$_get(1);
      let e2: int = 0;
      expect(r2).assertEqual(e2);
      let r3: number = arr.$_get(2);
      let e3: number = INT8_MAX;
      expect(r3).assertEqual(e3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SORT_PART01_TEST_3100
     * @tc.name int8ArraySortPart01Test031
     * @tc.desc Verify [0, 0, 0] sort()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySortPart01Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([0, 0, 0]);
      arr.sort();
      let r1: number = arr.$_get(0);
      let e1: int = 0;
      expect(r1).assertEqual(e1);
      let r2: number = arr.$_get(2);
      let e2: int = 0;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SORT_PART01_TEST_3200
     * @tc.name int8ArraySortPart01Test032
     * @tc.desc Verify [1, 0, -1] sort() [-1, 0, 1]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySortPart01Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 0, -1]);
      arr.sort();
      let r1: number = arr.$_get(0);
      let e1: int = -1;
      expect(r1).assertEqual(e1);
      let r2: number = arr.$_get(1);
      let e2: int = 0;
      expect(r2).assertEqual(e2);
      let r3: number = arr.$_get(2);
      let e3: int = 1;
      expect(r3).assertEqual(e3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SORT_PART01_TEST_3300
     * @tc.name int8ArraySortPart01Test033
     * @tc.desc Verify [127, -128, 0, 64, -64] sort() [-128, -64, 0, 64, 127]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySortPart01Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([INT8_MAX, INT8_MIN, 0, 64, -64]);
      arr.sort();
      let r1: number = arr.$_get(0);
      let e1: number = INT8_MIN;
      expect(r1).assertEqual(e1);
      let r2: number = arr.$_get(4);
      let e2: number = INT8_MAX;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SORT_PART01_TEST_3400
     * @tc.name int8ArraySortPart01Test034
     * @tc.desc Verify [2, 2, 1] sort() [1, 2, 2]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySortPart01Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([2, 2, 1]);
      arr.sort();
      let r1: number = arr.$_get(0);
      let e1: int = 1;
      expect(r1).assertEqual(e1);
      let r2: number = arr.$_get(1);
      let e2: int = 2;
      expect(r2).assertEqual(e2);
      let r3: number = arr.$_get(2);
      let e3: int = 2;
      expect(r3).assertEqual(e3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SORT_PART01_TEST_3500
     * @tc.name int8ArraySortPart01Test035
     * @tc.desc Verify [3, 3, 3, 1, 1, 1] sort() [1, 1, 1, 3, 3, 3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySortPart01Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([3, 3, 3, 1, 1, 1]);
      arr.sort();
      let r1: number = arr.$_get(0);
      let e1: int = 1;
      expect(r1).assertEqual(e1);
      let r2: number = arr.$_get(2);
      let e2: int = 1;
      expect(r2).assertEqual(e2);
      let r3: number = arr.$_get(3);
      let e3: int = 3;
      expect(r3).assertEqual(e3);
      let r4: number = arr.$_get(5);
      let e4: int = 3;
      expect(r4).assertEqual(e4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SORT_PART01_TEST_3600
     * @tc.name int8ArraySortPart01Test036
     * @tc.desc Verify [10, 9, 8, 7, 6, 5, 4, 3, 2, 1] sort() [1..10]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySortPart01Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([10, 9, 8, 7, 6, 5, 4, 3, 2, 1]);
      arr.sort();
      let r1: number = arr.$_get(0);
      let e1: int = 1;
      expect(r1).assertEqual(e1);
      let r2: number = arr.$_get(9);
      let e2: int = 10;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SORT_PART01_TEST_3700
     * @tc.name int8ArraySortPart01Test037
     * @tc.desc Verify sort compareFn [-3, -1, -2] [-1, -2, -3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySortPart01Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([-3, -1, -2]);
      arr.sort((a: number, b: number): int => {
        return a > b ? -1 : a < b ? 1 : 0;
      });
      let r1: number = arr.$_get(0);
      let e1: int = -1;
      expect(r1).assertEqual(e1);
      let r2: number = arr.$_get(2);
      let e2: int = -3;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SORT_PART01_TEST_3800
     * @tc.name int8ArraySortPart01Test038
     * @tc.desc Verify sort compareFn [-128, 127] [127, -128]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySortPart01Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([INT8_MIN, INT8_MAX]);
      arr.sort((a: number, b: number): int => {
        return a > b ? -1 : a < b ? 1 : 0;
      });
      let r1: number = arr.$_get(0);
      let e1: number = INT8_MAX;
      expect(r1).assertEqual(e1);
      let r2: number = arr.$_get(1);
      let e2: number = INT8_MIN;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SORT_PART01_TEST_3900
     * @tc.name int8ArraySortPart01Test039
     * @tc.desc Verify sort compareFn 0 [3, 1, 2]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySortPart01Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([3, 1, 2]);
      arr.sort((a: number, b: number): int => {
        return 0;
      });
      let r1: number = arr.$_get(0);
      let e1: int = 3;
      expect(r1).assertEqual(e1);
      let r2: number = arr.$_get(1);
      let e2: int = 1;
      expect(r2).assertEqual(e2);
      let r3: number = arr.$_get(2);
      let e3: int = 2;
      expect(r3).assertEqual(e3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SORT_PART01_TEST_4000
     * @tc.name int8ArraySortPart01Test040
     * @tc.desc Verify sort compareFn -1 [5, 3] [3, 5]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySortPart01Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([5, 3]);

      arr.sort((a: number, b: number): int => {
        return -1;
      });

      let r1: int = arr.length;
      let e1: int = 2;
      expect(r1).assertEqual(e1);
      let r2: number = arr.$_get(0);
      let e2: int = 3;
      expect(r2).assertEqual(e2);
      let r3: number = arr.$_get(1);
      let e3: int = 5;
      expect(r3).assertEqual(e3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SORT_PART01_TEST_4100
     * @tc.name int8ArraySortPart01Test041
     * @tc.desc Verify sort compareFn [3, 2, 1] [1, 2, 3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySortPart01Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([3, 2, 1]);
      arr.sort((a: number, b: number): int => {
        return a < b ? -1 : a > b ? 1 : 0;
      });
      let r1: number = arr.$_get(0);
      let e1: int = 1;
      expect(r1).assertEqual(e1);
      let r2: number = arr.$_get(2);
      let e2: int = 3;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SORT_PART01_TEST_4200
     * @tc.name int8ArraySortPart01Test042
     * @tc.desc Verify sort compareFn [-3, 1, -2] [1, -2, -3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySortPart01Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([-3, 1, -2]);
      arr.sort((a: number, b: number): int => {
        let absA: number = a < 0 ? -a : a;
        let absB: number = b < 0 ? -b : b;
        return absA < absB ? -1 : absA > absB ? 1 : 0;
      });
      let r1: number = arr.$_get(0);
      let e1: int = 1;
      expect(r1).assertEqual(e1);
      let r2: number = arr.$_get(1);
      let e2: int = -2;
      expect(r2).assertEqual(e2);
      let r3: number = arr.$_get(2);
      let e3: int = -3;
      expect(r3).assertEqual(e3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SORT_PART01_TEST_4300
     * @tc.name int8ArraySortPart01Test043
     * @tc.desc Verify sort compareFn [127, -128, 0, -1, 1] [-128, -1, 0, 1, 127]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySortPart01Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([INT8_MAX, INT8_MIN, 0, -1, 1]);
      arr.sort((a: number, b: number): int => {
        return a < b ? -1 : a > b ? 1 : 0;
      });
      let r1: number = arr.$_get(0);
      let e1: number = INT8_MIN;
      expect(r1).assertEqual(e1);
      let r2: number = arr.$_get(4);
      let e2: number = INT8_MAX;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SORT_PART01_TEST_4400
     * @tc.name int8ArraySortPart01Test044
     * @tc.desc Verify sort compareFn [1, 0, -1] [1, 0, -1]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySortPart01Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 0, -1]);
      arr.sort((a: number, b: number): int => {
        return a > b ? -1 : a < b ? 1 : 0;
      });
      let r1: number = arr.$_get(0);
      let e1: int = 1;
      expect(r1).assertEqual(e1);
      let r2: number = arr.$_get(2);
      let e2: int = -1;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SORT_PART01_TEST_4500
     * @tc.name int8ArraySortPart01Test045
     * @tc.desc Verify [127, -128] sort() [-128, 127] MAX MIN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySortPart01Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([INT8_MAX, INT8_MIN]);
      arr.sort();
      let r1: number = arr.$_get(0);
      let e1: number = INT8_MIN;
      expect(r1).assertEqual(e1);
      let r2: number = arr.$_get(1);
      let e2: number = INT8_MAX;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SORT_PART01_TEST_4600
     * @tc.name int8ArraySortPart01Test046
     * @tc.desc Verify [127, -128, 127, -128] sort() [-128, -128, 127, 127]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySortPart01Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([INT8_MAX, INT8_MIN, INT8_MAX, INT8_MIN]);
      arr.sort();
      let r1: number = arr.$_get(0);
      let e1: number = INT8_MIN;
      expect(r1).assertEqual(e1);
      let r2: number = arr.$_get(1);
      let e2: number = INT8_MIN;
      expect(r2).assertEqual(e2);
      let r3: number = arr.$_get(2);
      let e3: number = INT8_MAX;
      expect(r3).assertEqual(e3);
      let r4: number = arr.$_get(3);
      let e4: number = INT8_MAX;
      expect(r4).assertEqual(e4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SORT_PART01_TEST_4700
     * @tc.name int8ArraySortPart01Test047
     * @tc.desc Verify [0, -128] sort() [-128, 0] MIN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySortPart01Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([0, INT8_MIN]);
      arr.sort();
      let r1: number = arr.$_get(0);
      let e1: number = INT8_MIN;
      expect(r1).assertEqual(e1);
      let r2: number = arr.$_get(1);
      let e2: int = 0;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SORT_PART01_TEST_4800
     * @tc.name int8ArraySortPart01Test048
     * @tc.desc Verify [127, 0] sort() [0, 127] MAX
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySortPart01Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([INT8_MAX, 0]);
      arr.sort();
      let r1: number = arr.$_get(0);
      let e1: int = 0;
      expect(r1).assertEqual(e1);
      let r2: number = arr.$_get(1);
      let e2: number = INT8_MAX;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SORT_PART01_TEST_4900
     * @tc.name int8ArraySortPart01Test049
     * @tc.desc Verify [0, 0, -128, 127] sort() [-128, 0, 0, 127]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySortPart01Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([0, 0, INT8_MIN, INT8_MAX]);
      arr.sort();
      let r1: number = arr.$_get(0);
      let e1: number = INT8_MIN;
      expect(r1).assertEqual(e1);
      let r2: number = arr.$_get(1);
      let e2: int = 0;
      expect(r2).assertEqual(e2);
      let r3: number = arr.$_get(2);
      let e3: int = 0;
      expect(r3).assertEqual(e3);
      let r4: number = arr.$_get(3);
      let e4: number = INT8_MAX;
      expect(r4).assertEqual(e4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SORT_PART01_TEST_5000
     * @tc.name int8ArraySortPart01Test050
     * @tc.desc Verify [128, -129, 255] [-128, 127, -1] sort() [-128, -1, 127]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySortPart01Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([128, -129, 255]);
      let r1: number = arr.$_get(0);
      let e1: number = INT8_MIN;
      expect(r1).assertEqual(e1);
      let r2: number = arr.$_get(1);
      let e2: number = INT8_MAX;
      expect(r2).assertEqual(e2);
      let r3: number = arr.$_get(2);
      let e3: int = -1;
      expect(r3).assertEqual(e3);
      arr.sort();
      let r4: number = arr.$_get(0);
      let e4: number = INT8_MIN;
      expect(r4).assertEqual(e4);
      let r5: number = arr.$_get(1);
      let e5: int = -1;
      expect(r5).assertEqual(e5);
      let r6: number = arr.$_get(2);
      let e6: number = INT8_MAX;
      expect(r6).assertEqual(e6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SORT_PART01_TEST_5100
     * @tc.name int8ArraySortPart01Test051
     * @tc.desc Verify [-1, 1] sort() [-1, 1]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySortPart01Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([-1, 1]);
      arr.sort();
      let r1: number = arr.$_get(0);
      let e1: int = -1;
      expect(r1).assertEqual(e1);
      let r2: number = arr.$_get(1);
      let e2: int = 1;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SORT_PART01_TEST_5200
     * @tc.name int8ArraySortPart01Test052
     * @tc.desc Verify sort() this result === arr
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySortPart01Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([3, 1, 2]);
      let result = arr.sort();
      expect(result).assertEqual(arr);
    });

  });
}
