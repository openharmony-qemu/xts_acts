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

export default function int8ArrayFilterPart01Test(): void {
  describe('Int8ArrayFilterPart01Test', (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll((): void => {
      Utils.releaseAfterEachTest();
    });
    const INT8_MAX: byte = 127;
    const INT8_MIN: byte = -128;

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILTER_PART01_0100
     * @tc.name int8ArrayFilterPart01Test001
     * @tc.desc Verify filter with full three-param arrow function (baseline arity)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFilterPart01Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, -2, 3, -4, 5);
      let result: Int8Array = arr.filter((val: number): boolean => {
        return val > 0;
      });
      expect(result.length).assertEqual(3);
      expect(result.$_get(0)).assertEqual(1);
      expect(result.$_get(1)).assertEqual(3);
      expect(result.$_get(2)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILTER_PART01_0200
     * @tc.name int8ArrayFilterPart01Test002
     * @tc.desc Verify filter with zero-param callback returning constant true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFilterPart01Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(10, 20, 30);
      let result: Int8Array = arr.filter((): boolean => {
        return true;
      });
      expect(result.length).assertEqual(3);
      expect(result.$_get(0)).assertEqual(10);
      expect(result.$_get(2)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILTER_PART01_0300
     * @tc.name int8ArrayFilterPart01Test003
     * @tc.desc Verify filter with val-only single-param callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFilterPart01Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, -2, 3, -4);
      let result: Int8Array = arr.filter((val: number): boolean => {
        return val < 0;
      });
      expect(result.length).assertEqual(2);
      expect(result.$_get(0)).assertEqual(-2);
      expect(result.$_get(1)).assertEqual(-4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILTER_PART01_0400
     * @tc.name int8ArrayFilterPart01Test004
     * @tc.desc Verify filter with val+index two-param callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFilterPart01Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(10, 20, 30, 40);
      let result: Int8Array = arr.filter((_val: number, index: int): boolean => {
        if (_val < INT8_MIN || _val > INT8_MAX) {
          return false;
        }
        return index < 2;
      });
      expect(result.length).assertEqual(2);
      expect(result.$_get(0)).assertEqual(10);
      expect(result.$_get(1)).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILTER_PART01_0500
     * @tc.name int8ArrayFilterPart01Test005
     * @tc.desc Verify val = -128 (int8 min), filter val === -128
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFilterPart01Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(-128, 0, INT8_MAX);
      let result: Int8Array = arr.filter((val: number): boolean => {
        return val === -128;
      });
      expect(result.length).assertEqual(1);
      expect(result.$_get(0)).assertEqual(-128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILTER_PART01_0600
     * @tc.name int8ArrayFilterPart01Test006
     * @tc.desc Verify val = 127 (int8 max), filter val === 127
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFilterPart01Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(-128, 0, INT8_MAX);
      let result: Int8Array = arr.filter((val: number): boolean => {
        return val === INT8_MAX;
      });
      expect(result.length).assertEqual(1);
      expect(result.$_get(0)).assertEqual(INT8_MAX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILTER_PART01_0700
     * @tc.name int8ArrayFilterPart01Test007
     * @tc.desc Verify val = 0 (zero), filter val === 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFilterPart01Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(0, -1, 0, 1);
      let result: Int8Array = arr.filter((val: number): boolean => {
        return val === 0;
      });
      expect(result.length).assertEqual(2);
      expect(result.$_get(0)).assertEqual(0);
      expect(result.$_get(1)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILTER_PART01_0800
     * @tc.name int8ArrayFilterPart01Test008
     * @tc.desc Verify val = -1 (negative one), filter val === -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFilterPart01Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(-1, 0, -1, 1);
      let result: Int8Array = arr.filter((val: number): boolean => {
        return val === -1;
      });
      expect(result.length).assertEqual(2);
      expect(result.$_get(0)).assertEqual(-1);
      expect(result.$_get(1)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILTER_PART01_0900
     * @tc.name int8ArrayFilterPart01Test009
     * @tc.desc Verify val = 1 (min positive), filter val > 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFilterPart01Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, -1, 1, 0);
      let result: Int8Array = arr.filter((val: number): boolean => {
        return val > 0;
      });
      expect(result.length).assertEqual(2);
      expect(result.$_get(0)).assertEqual(1);
      expect(result.$_get(1)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILTER_PART01_1000
     * @tc.name int8ArrayFilterPart01Test010
     * @tc.desc Verify val = -128 boundary, filter val < 0 captures negative boundary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFilterPart01Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(-128, 0, INT8_MAX);
      let result: Int8Array = arr.filter((val: number): boolean => {
        return val < 0;
      });
      expect(result.length).assertEqual(1);
      expect(result.$_get(0)).assertEqual(-128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILTER_PART01_1100
     * @tc.name int8ArrayFilterPart01Test011
     * @tc.desc Verify val = 127 boundary, filter val > 0 captures positive boundary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFilterPart01Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(-1, 0, INT8_MAX);
      let result: Int8Array = arr.filter((val: number): boolean => {
        return val > 0;
      });
      expect(result.length).assertEqual(1);
      expect(result.$_get(0)).assertEqual(INT8_MAX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILTER_PART01_1200
     * @tc.name int8ArrayFilterPart01Test012
     * @tc.desc Verify Int8Array.of(128) truncates to -128, filter val === -128 keeps it
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFilterPart01Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(128);
      let result: Int8Array = arr.filter((val: number): boolean => {
        return val === -128;
      });
      expect(result.length).assertEqual(1);
      expect(result.$_get(0)).assertEqual(-128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILTER_PART01_1300
     * @tc.name int8ArrayFilterPart01Test013
     * @tc.desc Verify Int8Array.of(-129) truncates to INT8_MAX, filter val === INT8_MAX keeps it
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFilterPart01Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(-129);
      let result: Int8Array = arr.filter((val: number): boolean => {
        return val === INT8_MAX;
      });
      expect(result.length).assertEqual(1);
      expect(result.$_get(0)).assertEqual(INT8_MAX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILTER_PART01_1400
     * @tc.name int8ArrayFilterPart01Test014
     * @tc.desc Verify Int8Array.of(255) truncates to -1, filter val === -1 keeps it
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFilterPart01Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(255);
      let result: Int8Array = arr.filter((val: number): boolean => {
        return val === -1;
      });
      expect(result.length).assertEqual(1);
      expect(result.$_get(0)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILTER_PART01_1500
     * @tc.name int8ArrayFilterPart01Test015
     * @tc.desc Verify Int8Array.of(256) truncates to 0, filter val === 0 keeps it
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFilterPart01Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(256);
      let result: Int8Array = arr.filter((val: number): boolean => {
        return val === 0;
      });
      expect(result.length).assertEqual(1);
      expect(result.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILTER_PART01_1600
     * @tc.name int8ArrayFilterPart01Test016
     * @tc.desc Verify Int8Array.of(Number.NaN) stores 0, filter val === 0 keeps it
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFilterPart01Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(Number.NaN);
      let result: Int8Array = arr.filter((val: number): boolean => {
        return val === 0;
      });
      expect(result.length).assertEqual(1);
      expect(result.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILTER_PART01_1700
     * @tc.name int8ArrayFilterPart01Test017
     * @tc.desc Verify Int8Array.of(1.9) truncates to 1, filter val === 1 keeps it
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFilterPart01Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1.9);
      let result: Int8Array = arr.filter((val: number): boolean => {
        return val === 1;
      });
      expect(result.length).assertEqual(1);
      expect(result.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILTER_PART01_1800
     * @tc.name int8ArrayFilterPart01Test018
     * @tc.desc Verify Int8Array.of(-1.9) truncates to -1, filter val === -1 keeps it
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFilterPart01Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(-1.9);
      let result: Int8Array = arr.filter((val: number): boolean => {
        return val === -1;
      });
      expect(result.length).assertEqual(1);
      expect(result.$_get(0)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILTER_PART01_1900
     * @tc.name int8ArrayFilterPart01Test019
     * @tc.desc Verify Int8Array.of(-0.0) stores 0, filter val === 0 keeps it
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFilterPart01Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(-0.0);
      let result: Int8Array = arr.filter((val: number): boolean => {
        return val === 0;
      });
      expect(result.length).assertEqual(1);
      expect(result.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILTER_PART01_2000
     * @tc.name int8ArrayFilterPart01Test020
     * @tc.desc Verify all-zero array, filter val !== 0 returns empty result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFilterPart01Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(0, 0, 0);
      let result: Int8Array = arr.filter((val: number): boolean => {
        return val !== 0;
      });
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILTER_PART01_2100
     * @tc.name int8ArrayFilterPart01Test021
     * @tc.desc Verify index = 0 (first element), filter index === 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFilterPart01Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(10, 20, 30);
      let result: Int8Array = arr.filter((_val: number, index: int): boolean => {
        if (_val < INT8_MIN || _val > INT8_MAX) {
          return false;
        }
        return index === 0;
      });
      expect(result.length).assertEqual(1);
      expect(result.$_get(0)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILTER_PART01_2200
     * @tc.name int8ArrayFilterPart01Test022
     * @tc.desc Verify filter index === array.length - 1 keeps last element 30, on Int8Array.of(10, 20, 30)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFilterPart01Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(10, 20, 30);
      let result: Int8Array = arr.filter((_val: number, index: int, array: Int8Array): boolean => {
        if (_val < INT8_MIN || _val > INT8_MAX) {
          return false;
        }
        return index === array.length - 1;
      });
      expect(result.length).assertEqual(1);
      expect(result.$_get(0)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILTER_PART01_2300
     * @tc.name int8ArrayFilterPart01Test023
     * @tc.desc Verify filter callback receives indices 0 to 3, maxIndex ends at 3, on Int8Array.of(10, 20, 30, 40)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFilterPart01Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(10, 20, 30, 40);
      let maxIndex: int = -1;
      const result: Int8Array = arr.filter((_val: number, index: int): boolean => {
        if (_val < INT8_MIN || _val > INT8_MAX) {
          return false;
        }
        if (index > maxIndex) {
          maxIndex = index;
        }
        return true;
      });
      let r1: int = result.length;
      let e1: int = 4;
      expect(r1).assertEqual(e1);
      expect(maxIndex).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILTER_PART01_2400
     * @tc.name int8ArrayFilterPart01Test024
     * @tc.desc Verify single-element array, index is 0, filter returns all elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFilterPart01Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(42);
      let seenIndex: int = -1;
      let result: Int8Array = arr.filter((_val: number, index: int): boolean => {
        if (_val < INT8_MIN || _val > INT8_MAX) {
          return false;
        }
        seenIndex = index;
        return true;
      });
      expect(seenIndex).assertEqual(0);
      expect(result.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILTER_PART01_2500
     * @tc.name int8ArrayFilterPart01Test025
     * @tc.desc Verify filter even indices (index % 2 === 0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFilterPart01Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(10, 20, 30, 40, 50);
      let result: Int8Array = arr.filter((_val: number, index: int): boolean => {
        if (_val < INT8_MIN || _val > INT8_MAX) {
          return false;
        }
        return index % 2 === 0;
      });
      expect(result.length).assertEqual(3);
      expect(result.$_get(0)).assertEqual(10);
      expect(result.$_get(1)).assertEqual(30);
      expect(result.$_get(2)).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILTER_PART01_2600
     * @tc.name int8ArrayFilterPart01Test026
     * @tc.desc Verify filter index > 0 (skip first element)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFilterPart01Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(10, 20, 30);
      let result: Int8Array = arr.filter((_val: number, index: int): boolean => {
        if (_val < INT8_MIN || _val > INT8_MAX) {
          return false;
        }
        return index > 0;
      });
      expect(result.length).assertEqual(2);
      expect(result.$_get(0)).assertEqual(20);
      expect(result.$_get(1)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILTER_PART01_2700
     * @tc.name int8ArrayFilterPart01Test027
     * @tc.desc Verify filter callback array parameter equals source array on each of 3 calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFilterPart01Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, 2, 3);
      let seenLength: int = 0;
      const result: Int8Array = arr.filter((_val: number, _index: int, array: Int8Array): boolean => {
        if (_val < INT8_MIN || _val > INT8_MAX) {
          return false;
        }
        seenLength = array.length;
        return true;
      });
      let r1: int = result.length;
      let e1: int = 3;
      expect(r1).assertEqual(e1);
      expect(seenLength).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILTER_PART01_2800
     * @tc.name int8ArrayFilterPart01Test028
     * @tc.desc Verify filter callback sees array.length 5 on each call, on Int8Array.of(1, 2, 3, 4, 5)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFilterPart01Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, 2, 3, 4, 5);
      let lenMatch: int = 0;
      const result: Int8Array = arr.filter((_val: number, _index: int, array: Int8Array): boolean => {
        if (_val < INT8_MIN || _val > INT8_MAX) {
          return false;
        }
        if (array.length === 5) {
          lenMatch = lenMatch + 1;
        }
        return true;
      });
      let r1: int = result.length;
      let e1: int = 5;
      expect(r1).assertEqual(e1);
      expect(lenMatch).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILTER_PART01_2900
     * @tc.name int8ArrayFilterPart01Test029
     * @tc.desc Verify filter callback array.$_get(index) equals val on each of 3 calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFilterPart01Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(10, 20, 30);
      let consistent: int = 0;
      const result: Int8Array = arr.filter((val: number, index: int, array: Int8Array): boolean => {
        if (array.$_get(index) === val) {
          consistent = consistent + 1;
        }
        return true;
      });
      let r1: int = result.length;
      let e1: int = 3;
      expect(r1).assertEqual(e1);
      expect(consistent).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILTER_PART01_3000
     * @tc.name int8ArrayFilterPart01Test030
     * @tc.desc Verify filter callback sums array values 5, 10, 15 to 30
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFilterPart01Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(5, 10, 15);
      let sumFromCallback: number = 0;
      const result: Int8Array = arr.filter((_val: number, index: int, array: Int8Array): boolean => {
        if (_val < INT8_MIN || _val > INT8_MAX) {
          return false;
        }
        sumFromCallback = sumFromCallback + array.$_get(index);
        return true;
      });
      let r1: int = result.length;
      let e1: int = 3;
      expect(r1).assertEqual(e1);
      expect(sumFromCallback).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILTER_PART01_3100
     * @tc.name int8ArrayFilterPart01Test031
     * @tc.desc Verify filter with always true predicate keeps all 4 elements of Int8Array.of(1, -2, 3, -4)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFilterPart01Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, -2, 3, -4);
      let result: Int8Array = arr.filter((_val: number): boolean => {
        if (_val < INT8_MIN || _val > INT8_MAX) {
          return false;
        }
        return true;
      });
      expect(result.length).assertEqual(4);
      expect(result.$_get(0)).assertEqual(1);
      expect(result.$_get(3)).assertEqual(-4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILTER_PART01_3200
     * @tc.name int8ArrayFilterPart01Test032
     * @tc.desc Verify filter with always false predicate returns empty result, on Int8Array.of(1, -2, 3, -4)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFilterPart01Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, -2, 3, -4);
      let result: Int8Array = arr.filter((_val: number): boolean => {
        if (_val < INT8_MIN || _val > INT8_MAX) {
          return false;
        }
        return false;
      });
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILTER_PART01_3300
     * @tc.name int8ArrayFilterPart01Test033
     * @tc.desc Verify filter val > 64 keeps 65, 100, INT8_MAX, on Int8Array.of(65, 0, 100, -1, INT8_MAX)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFilterPart01Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(65, 0, 100, -1, INT8_MAX);
      let result: Int8Array = arr.filter((val: number): boolean => {
        return val > 64;
      });
      expect(result.length).assertEqual(3);
      expect(result.$_get(0)).assertEqual(65);
      expect(result.$_get(1)).assertEqual(100);
      expect(result.$_get(2)).assertEqual(INT8_MAX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILTER_PART01_3400
     * @tc.name int8ArrayFilterPart01Test034
     * @tc.desc Verify filter val < -64 keeps -65, -100, -128, on Int8Array.of(-65, 0, -100, 1, -128)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFilterPart01Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(-65, 0, -100, 1, -128);
      let result: Int8Array = arr.filter((val: number): boolean => {
        return val < -64;
      });
      expect(result.length).assertEqual(3);
      expect(result.$_get(0)).assertEqual(-65);
      expect(result.$_get(1)).assertEqual(-100);
      expect(result.$_get(2)).assertEqual(-128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILTER_PART01_3500
     * @tc.name int8ArrayFilterPart01Test035
     * @tc.desc Verify filter val !== 0 keeps 1 and -1, on Int8Array.of(0, 1, 0, -1, 0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFilterPart01Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(0, 1, 0, -1, 0);
      let result: Int8Array = arr.filter((val: number): boolean => {
        return val !== 0;
      });
      expect(result.length).assertEqual(2);
      expect(result.$_get(0)).assertEqual(1);
      expect(result.$_get(1)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILTER_PART01_3600
     * @tc.name int8ArrayFilterPart01Test036
     * @tc.desc Verify filter val >= 0 keeps 0, 1, 2, on Int8Array.of(-1, 0, 1, -2, 2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFilterPart01Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(-1, 0, 1, -2, 2);
      let result: Int8Array = arr.filter((val: number): boolean => {
        return val >= 0;
      });
      expect(result.length).assertEqual(3);
      expect(result.$_get(0)).assertEqual(0);
      expect(result.$_get(1)).assertEqual(1);
      expect(result.$_get(2)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILTER_PART01_3700
     * @tc.name int8ArrayFilterPart01Test037
     * @tc.desc Verify filter throws Error from predicate on first call, callCount stays 1, on Int8Array.of(1, 2, 3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFilterPart01Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, 2, 3);
      let callCount: int = 0;
      try {
        const result: Int8Array = arr.filter((_val: number): boolean => {
          if (_val < INT8_MIN || _val > INT8_MAX) {
            return false;
          }
          callCount = callCount + 1;
          throw new Error('first');
        });
        let r1: int = result.length;
        let e1: int = 3;
        expect(r1).assertEqual(e1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      expect(callCount).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILTER_PART01_3800
     * @tc.name int8ArrayFilterPart01Test038
     * @tc.desc Verify filter throws RangeError when predicate meets val 0, on Int8Array.of(1, 0, 3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFilterPart01Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, 0, 3);
      try {
        const result: Int8Array = arr.filter((val: number): boolean => {
          if (val === 0) {
            throw new RangeError('zero');
          }
          return true;
        });
        let r1: int = result.length;
        let e1: int = 3;
        expect(r1).assertEqual(e1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILTER_PART01_3900
     * @tc.name int8ArrayFilterPart01Test039
     * @tc.desc Verify filter throws TypeError when predicate meets index 2, on Int8Array.of(10, 20, 30)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFilterPart01Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(10, 20, 30);
      try {
        const result: Int8Array = arr.filter((_val: number, index: int): boolean => {
          if (_val < INT8_MIN || _val > INT8_MAX) {
            return false;
          }
          if (index === 2) {
            throw new TypeError('idx2');
          }
          return true;
        });
        let r1: int = result.length;
        let e1: int = 3;
        expect(r1).assertEqual(e1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILTER_PART01_4000
     * @tc.name int8ArrayFilterPart01Test040
     * @tc.desc Verify filter throws Error at last element after 3 calls, on Int8Array.of(1, 2, 3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFilterPart01Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, 2, 3);
      let callCount: int = 0;
      try {
        const result: Int8Array = arr.filter((_val: number, index: int, array: Int8Array): boolean => {
          if (_val < INT8_MIN || _val > INT8_MAX) {
            return false;
          }
          callCount = callCount + 1;
          if (index === array.length - 1) {
            throw new Error('last');
          }
          return true;
        });
        let r1: int = result.length;
        let e1: int = 3;
        expect(r1).assertEqual(e1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      expect(callCount).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILTER_PART01_4100
     * @tc.name int8ArrayFilterPart01Test041
     * @tc.desc Verify filter throws Error at index 2 after 3 calls, on Int8Array.of(1, 2, 3, 4, 5)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFilterPart01Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, 2, 3, 4, 5);
      let callCount: int = 0;
      try {
        const result: Int8Array = arr.filter((_val: number, index: int): boolean => {
          if (_val < INT8_MIN || _val > INT8_MAX) {
            return false;
          }
          callCount = callCount + 1;
          if (index === 2) {
            throw new Error('mid');
          }
          return true;
        });
        let r1: int = result.length;
        let e1: int = 5;
        expect(r1).assertEqual(e1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      expect(callCount).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILTER_PART01_4200
     * @tc.name int8ArrayFilterPart01Test042
     * @tc.desc Verify filter throws Error when predicate meets val -128, on Int8Array.of(1, -128, 3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFilterPart01Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, -128, 3);
      try {
        const result: Int8Array = arr.filter((val: number): boolean => {
          if (val === -128) {
            throw new Error('min');
          }
          return true;
        });
        let r1: int = result.length;
        let e1: int = 3;
        expect(r1).assertEqual(e1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILTER_PART01_4300
     * @tc.name int8ArrayFilterPart01Test043
     * @tc.desc Verify filter throws Error when predicate meets val INT8_MAX, on Int8Array.of(INT8_MAX, 1, 3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFilterPart01Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(INT8_MAX, 1, 3);
      try {
        const result: Int8Array = arr.filter((val: number): boolean => {
          if (val === INT8_MAX) {
            throw new Error('max');
          }
          return true;
        });
        let r1: int = result.length;
        let e1: int = 3;
        expect(r1).assertEqual(e1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILTER_PART01_4400
     * @tc.name int8ArrayFilterPart01Test044
     * @tc.desc Verify filter throws Error when array.length > 2, on Int8Array.of(1, 2, 3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFilterPart01Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, 2, 3);
      try {
        const result: Int8Array = arr.filter((_val: number, _index: int, array: Int8Array): boolean => {
          if (_val < INT8_MIN || _val > INT8_MAX) {
            return false;
          }
          if (array.length > 2) {
            throw new Error('too long');
          }
          return true;
        });
        let r1: int = result.length;
        let e1: int = 3;
        expect(r1).assertEqual(e1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILTER_PART01_4500
     * @tc.name int8ArrayFilterPart01Test045
     * @tc.desc Verify empty array filter, callback not executed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFilterPart01Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(0);
      let callCount: int = 0;
      const result: Int8Array = arr.filter((_val: number): boolean => {
        if (_val < INT8_MIN || _val > INT8_MAX) {
          return false;
        }
        callCount = callCount + 1;
        return true;
      });
      let r1: int = result.length;
      let e1: int = 0;
      expect(r1).assertEqual(e1);
      expect(callCount).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILTER_PART01_4600
     * @tc.name int8ArrayFilterPart01Test046
     * @tc.desc Verify empty array filter, result length is 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFilterPart01Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(0);
      let result: Int8Array = arr.filter((_val: number): boolean => {
        if (_val < INT8_MIN || _val > INT8_MAX) {
          return false;
        }
        return true;
      });
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILTER_PART01_4700
     * @tc.name int8ArrayFilterPart01Test047
     * @tc.desc Verify empty array filter, result BYTES_PER_ELEMENT is still 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFilterPart01Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(0);
      let result: Int8Array = arr.filter((_val: number): boolean => {
        if (_val < INT8_MIN || _val > INT8_MAX) {
          return false;
        }
        return true;
      });
      expect(result.BYTES_PER_ELEMENT).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILTER_PART01_4800
     * @tc.name int8ArrayFilterPart01Test048
     * @tc.desc Verify filter val > INT8_MAX returns empty result, on Int8Array.of(1, 2, 3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFilterPart01Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, 2, 3);
      let result: Int8Array = arr.filter((val: number): boolean => {
        return val > INT8_MAX;
      });
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILTER_PART01_4900
     * @tc.name int8ArrayFilterPart01Test049
     * @tc.desc Verify filter returns empty result, callback executed for all 3 elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFilterPart01Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, 2, 3);
      let callCount: int = 0;
      let result: Int8Array = arr.filter((val: number): boolean => {
        callCount = callCount + 1;
        return val < -128;
      });
      expect(callCount).assertEqual(3);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILTER_PART01_5000
     * @tc.name int8ArrayFilterPart01Test050
     * @tc.desc Verify filter val < -128 returns empty result, BYTES_PER_ELEMENT still 1, on Int8Array.of(1, 2, 3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFilterPart01Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, 2, 3);
      let result: Int8Array = arr.filter((val: number): boolean => {
        return val < -128;
      });
      expect(result.BYTES_PER_ELEMENT).assertEqual(1);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILTER_PART01_5100
     * @tc.name int8ArrayFilterPart01Test051
     * @tc.desc Verify filter val > 8 keeps 10 and 15, on Int8Array.of(1, 5, 10, 15)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFilterPart01Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, 5, 10, 15);
      let threshold: int = 8;
      let result: Int8Array = arr.filter((val: number): boolean => {
        return val > threshold;
      });
      expect(result.length).assertEqual(2);
      expect(result.$_get(0)).assertEqual(10);
      expect(result.$_get(1)).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILTER_PART01_5200
     * @tc.name int8ArrayFilterPart01Test052
     * @tc.desc Verify filter visits all 4 elements and keeps even values, on Int8Array.of(1, 2, 3, 4)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFilterPart01Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, 2, 3, 4);
      let processed: int = 0;
      let result: Int8Array = arr.filter((val: number): boolean => {
        processed = processed + 1;
        return val % 2 === 0;
      });
      expect(processed).assertEqual(4);
      expect(result.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILTER_PART01_5300
     * @tc.name int8ArrayFilterPart01Test053
     * @tc.desc Verify filter val > 15 && index < 3 keeps 20 and 30, on Int8Array.of(10, 20, 30, 40)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFilterPart01Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(10, 20, 30, 40);
      let result: Int8Array = arr.filter((val: number, index: int): boolean => {
        return val > 15 && index < 3;
      });
      expect(result.length).assertEqual(2);
      expect(result.$_get(0)).assertEqual(20);
      expect(result.$_get(1)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILTER_PART01_5400
     * @tc.name int8ArrayFilterPart01Test054
     * @tc.desc Verify filter val > array.$_get(0) keeps 20 and 30, on Int8Array.of(10, 20, 30)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFilterPart01Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(10, 20, 30);
      let result: Int8Array = arr.filter((val: number, _index: int, array: Int8Array): boolean => {
        return val > array.$_get(0);
      });
      expect(result.length).assertEqual(2);
      expect(result.$_get(0)).assertEqual(20);
      expect(result.$_get(1)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILTER_PART01_5500
     * @tc.name int8ArrayFilterPart01Test055
     * @tc.desc Verify filter val > first element && index > 0 keeps 10, 15, 20, on Int8Array.of(5, 10, 15, 20)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFilterPart01Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(5, 10, 15, 20);
      let result: Int8Array = arr.filter((val: number, index: int, array: Int8Array): boolean => {
        return val > array.$_get(0) && index > 0 && array.length === 4;
      });
      expect(result.length).assertEqual(3);
      expect(result.$_get(0)).assertEqual(10);
      let r1: number = result.$_get(1);
      let e1: int = 15;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(2);
      let e2: int = 20;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILTER_PART01_5600
     * @tc.name int8ArrayFilterPart01Test056
     * @tc.desc Verify single-element array, filter always true returns single result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFilterPart01Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(42);
      let result: Int8Array = arr.filter((_val: number): boolean => {
        if (_val < INT8_MIN || _val > INT8_MAX) {
          return false;
        }
        return true;
      });
      expect(result.length).assertEqual(1);
      expect(result.$_get(0)).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILTER_PART01_5700
     * @tc.name int8ArrayFilterPart01Test057
     * @tc.desc Verify all -128 array, filter val === -128 keeps all
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFilterPart01Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(-128, -128, -128);
      let result: Int8Array = arr.filter((val: number): boolean => {
        return val === -128;
      });
      expect(result.length).assertEqual(3);
      expect(result.$_get(0)).assertEqual(-128);
      let r1: number = result.$_get(1);
      let e1: int = -128;
      expect(r1).assertEqual(e1);
      expect(result.$_get(2)).assertEqual(-128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILTER_PART01_5800
     * @tc.name int8ArrayFilterPart01Test058
     * @tc.desc Verify all 0 array, filter val === 0 keeps all
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFilterPart01Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(0, 0, 0);
      let result: Int8Array = arr.filter((val: number): boolean => {
        return val === 0;
      });
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILTER_PART01_5900
     * @tc.name int8ArrayFilterPart01Test059
     * @tc.desc Verify ascending [-128, -1, 0, 1, 127], filter val >= 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFilterPart01Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(-128, -1, 0, 1, INT8_MAX);
      let result: Int8Array = arr.filter((val: number): boolean => {
        return val >= 0;
      });
      expect(result.length).assertEqual(3);
      expect(result.$_get(0)).assertEqual(0);
      expect(result.$_get(1)).assertEqual(1);
      expect(result.$_get(2)).assertEqual(INT8_MAX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILTER_PART01_6000
     * @tc.name int8ArrayFilterPart01Test060
     * @tc.desc Verify descending [127, 1, 0, -1, -128], filter val < 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFilterPart01Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(INT8_MAX, 1, 0, -1, -128);
      let result: Int8Array = arr.filter((val: number): boolean => {
        return val < 0;
      });
      expect(result.length).assertEqual(2);
      expect(result.$_get(0)).assertEqual(-1);
      expect(result.$_get(1)).assertEqual(-128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILTER_PART01_6100
     * @tc.name int8ArrayFilterPart01Test061
     * @tc.desc Verify filter result preserves source element order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFilterPart01Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(3, 1, 4, 1, 5);
      let result: Int8Array = arr.filter((val: number): boolean => {
        return val > 2;
      });
      let r1: int = result.length;
      let e1: int = 3;
      expect(r1).assertEqual(e1);
      expect(result.$_get(0)).assertEqual(3);
      expect(result.$_get(1)).assertEqual(4);
      expect(result.$_get(2)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILTER_PART01_6200
     * @tc.name int8ArrayFilterPart01Test062
     * @tc.desc Verify filter by index keeps elements 20 and 40 at positions 1 and 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFilterPart01Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(10, 20, 30, 40, 50);
      let result: Int8Array = arr.filter((_val: number, index: int): boolean => {
        if (_val < INT8_MIN || _val > INT8_MAX) {
          return false;
        }
        return index === 1 || index === 3;
      });
      let r1: int = result.length;
      let e1: int = 2;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(0);
      let e2: int = 20;
      expect(r2).assertEqual(e2);
      let r3: number = result.$_get(1);
      let e3: int = 40;
      expect(r3).assertEqual(e3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILTER_PART01_6300
     * @tc.name int8ArrayFilterPart01Test063
     * @tc.desc Verify chained filter calls (positive then > 2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFilterPart01Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, -2, 3, -4, 5, -6);
      let result: Int8Array = arr
        .filter((val: number): boolean => {
          return val > 0;
        })
        .filter((val: number): boolean => {
          return val > 2;
        });
      expect(result.length).assertEqual(2);
      expect(result.$_get(0)).assertEqual(3);
      expect(result.$_get(1)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILTER_PART01_6400
     * @tc.name int8ArrayFilterPart01Test064
     * @tc.desc Verify filter returns new instance (result !== arr reference independence)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFilterPart01Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, 2, 3);
      let result: Int8Array = arr.filter((_val: number): boolean => {
        if (_val < INT8_MIN || _val > INT8_MAX) {
          return false;
        }
        return true;
      });
      let sameRef: int = 0;
      if (result === arr) {
        sameRef = 1;
      }
      expect(sameRef).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILTER_PART01_6500
     * @tc.name int8ArrayFilterPart01Test065
     * @tc.desc Verify filter callback receives array.length 5, on Int8Array.of(1, 2, 3, 4, 5)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFilterPart01Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, 2, 3, 4, 5);
      let lenInCallback: int = 0;
      const result: Int8Array = arr.filter((_val: number, _index: int, array: Int8Array): boolean => {
        if (_val < INT8_MIN || _val > INT8_MAX) {
          return false;
        }
        lenInCallback = array.length;
        return true;
      });
      let r1: int = result.length;
      let e1: int = 5;
      expect(r1).assertEqual(e1);
      expect(lenInCallback).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILTER_PART01_6600
     * @tc.name int8ArrayFilterPart01Test066
     * @tc.desc Verify filter val > 0 || index === 0 keeps -1 and 3, on Int8Array.of(-1, -2, 3, -4)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFilterPart01Test066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(-1, -2, 3, -4);
      let result: Int8Array = arr.filter((val: number, index: int): boolean => {
        return val > 0 || index === 0;
      });
      expect(result.length).assertEqual(2);
      expect(result.$_get(0)).assertEqual(-1);
      expect(result.$_get(1)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILTER_PART01_6700
     * @tc.name int8ArrayFilterPart01Test067
     * @tc.desc Verify filter invokes callback 3 times with always false predicate, on Int8Array.of(7, 8, 9)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFilterPart01Test067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(7, 8, 9);
      let callCount: int = 0;
      const result: Int8Array = arr.filter((_val: number): boolean => {
        if (_val < INT8_MIN || _val > INT8_MAX) {
          return false;
        }
        callCount = callCount + 1;
        return false;
      });
      let r1: int = result.length;
      let e1: int = 0;
      expect(r1).assertEqual(e1);
      expect(callCount).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILTER_PART01_6800
     * @tc.name int8ArrayFilterPart01Test068
     * @tc.desc Verify mixed overflow array [128, -129, 255], filter val < 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFilterPart01Test068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(128, -129, 255);
      let result: Int8Array = arr.filter((val: number): boolean => {
        return val < 0;
      });
      expect(result.length).assertEqual(2);
      expect(result.$_get(0)).assertEqual(-128);
      expect(result.$_get(1)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILTER_PART01_6900
     * @tc.name int8ArrayFilterPart01Test069
     * @tc.desc Verify filter result is independent copy (modifying result does not affect source)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFilterPart01Test069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, 2, 3, 4);
      let result: Int8Array = arr.filter((val: number): boolean => {
        return val > 2;
      });
      result.$_set(0, -128);
      expect(arr.$_get(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILTER_PART01_7000
     * @tc.name int8ArrayFilterPart01Test070
     * @tc.desc Verify single 0 element array, filter val === 0 keeps it
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFilterPart01Test070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(0);
      let result: Int8Array = arr.filter((val: number): boolean => {
        return val === 0;
      });
      expect(result.length).assertEqual(1);
      expect(result.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILTER_PART01_7100
     * @tc.name int8ArrayFilterPart01Test071
     * @tc.desc Verify single -128 element array, filter val < 0 keeps it
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFilterPart01Test071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(-128);
      let result: Int8Array = arr.filter((val: number): boolean => {
        return val < 0;
      });
      expect(result.length).assertEqual(1);
      expect(result.$_get(0)).assertEqual(-128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILTER_PART01_7200
     * @tc.name int8ArrayFilterPart01Test072
     * @tc.desc Verify filter odd indices (index % 2 === 1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFilterPart01Test072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(10, 20, 30, 40, 50, 60);
      let result: Int8Array = arr.filter((_val: number, index: int): boolean => {
        if (_val < INT8_MIN || _val > INT8_MAX) {
          return false;
        }
        return index % 2 === 1;
      });
      expect(result.length).assertEqual(3);
      expect(result.$_get(0)).assertEqual(20);
      expect(result.$_get(1)).assertEqual(40);
      expect(result.$_get(2)).assertEqual(60);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILTER_PART01_7300
     * @tc.name int8ArrayFilterPart01Test073
     * @tc.desc Verify fn uses Math.abs(val) for absolute value filtering
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFilterPart01Test073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, -2, 3, -4);
      let result: Int8Array = arr.filter((val: number): boolean => {
        return Math.abs(val) > 2;
      });
      expect(result.length).assertEqual(2);
      expect(result.$_get(0)).assertEqual(3);
      expect(result.$_get(1)).assertEqual(-4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILTER_PART01_7400
     * @tc.name int8ArrayFilterPart01Test074
     * @tc.desc Verify two-element array, filter index === 0 keeps first only
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFilterPart01Test074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(100, -100);
      let result: Int8Array = arr.filter((_val: number, index: int): boolean => {
        if (_val < INT8_MIN || _val > INT8_MAX) {
          return false;
        }
        return index === 0;
      });
      expect(result.length).assertEqual(1);
      expect(result.$_get(0)).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILTER_PART01_7500
     * @tc.name int8ArrayFilterPart01Test075
     * @tc.desc Verify two-element array, filter index === 1 keeps last only
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFilterPart01Test075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(100, -100);
      let result: Int8Array = arr.filter((_val: number, index: int): boolean => {
        if (_val < INT8_MIN || _val > INT8_MAX) {
          return false;
        }
        return index === 1;
      });
      expect(result.length).assertEqual(1);
      expect(result.$_get(0)).assertEqual(-100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILTER_PART01_7600
     * @tc.name int8ArrayFilterPart01Test076
     * @tc.desc Verify filter val > first element 50 keeps 60 and 70, on Int8Array.of(50, 60, 40, 70, 30)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFilterPart01Test076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(50, 60, 40, 70, 30);
      let firstVal: number = arr.$_get(0);
      let result: Int8Array = arr.filter((val: number): boolean => {
        return val > firstVal;
      });
      expect(result.length).assertEqual(2);
      expect(result.$_get(0)).assertEqual(60);
      expect(result.$_get(1)).assertEqual(70);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILTER_PART01_7700
     * @tc.name int8ArrayFilterPart01Test077
     * @tc.desc Verify alternating pos/neg array, filter val > 0 keeps positive sequence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFilterPart01Test077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, -1, 2, -2, 3, -3);
      let result: Int8Array = arr.filter((val: number): boolean => {
        return val > 0;
      });
      expect(result.length).assertEqual(3);
      expect(result.$_get(0)).assertEqual(1);
      expect(result.$_get(1)).assertEqual(2);
      expect(result.$_get(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILTER_PART01_7800
     * @tc.name int8ArrayFilterPart01Test078
     * @tc.desc Verify all positive array, filter val < 0 returns empty result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFilterPart01Test078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, 2, 3, INT8_MAX);
      let result: Int8Array = arr.filter((val: number): boolean => {
        return val < 0;
      });
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILTER_PART01_7900
     * @tc.name int8ArrayFilterPart01Test079
     * @tc.desc Verify source array with Number.POSITIVE_INFINITY, filter val===127 returns empty because ToInt8 yields 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFilterPart01Test079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(Number.POSITIVE_INFINITY);
      let result: Int8Array = arr.filter((val: number): boolean => {
        return val === 127;
      });
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILTER_PART01_8000
     * @tc.name int8ArrayFilterPart01Test080
     * @tc.desc Verify source array with Number.NEGATIVE_INFINITY, filter val===-128 returns empty because ToInt8 yields 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFilterPart01Test080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(-Number.POSITIVE_INFINITY);
      let result: Int8Array = arr.filter((val: number): boolean => {
        return val === -128;
      });
      expect(result.length).assertEqual(0);
    });
  });
}
