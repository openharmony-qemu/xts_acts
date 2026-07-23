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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '../../../../hypium/index';
import Utils from '../Util.test';

export default function uint16ArrayFilter01Test(): void {
  describe('Uint16ArrayFilter01Test', () => {
    beforeAll(() => {
    });

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach(() => {
    });

    afterAll(() => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILTER_ONE_0100
     * @tc.name testUint16ArrayFilterOne001
     * @tc.desc Verify filter 1 fn
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFilterOne001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([10, 20, 30]);
      let result: Uint16Array = arr.filter((v: number): boolean => v > 5);
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILTER_ONE_0200
     * @tc.name testUint16ArrayFilterOne002
     * @tc.desc Verify filter calls predicate for every element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFilterOne002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([1, 2, 3, 4]);
      let callCount: int = 0;
      let result: Uint16Array = arr.filter((v: number): boolean => {
        callCount = callCount + 1;
        return v > 2;
      });
      expect(callCount).assertEqual(4);
      expect(result.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILTER_ONE_0300
     * @tc.name testUint16ArrayFilterOne003
     * @tc.desc Verify filter ClassCastError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFilterOne003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([1, 2, 3]);
      let hasError: boolean = false;
      try {
        let r: Uint16Array = arr.filter(undefined as ((val: number, index: int, array: Uint16Array) => boolean));
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
        hasError = true;
      }
      expect(hasError).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILTER_ONE_0400
     * @tc.name testUint16ArrayFilterOne004
     * @tc.desc Verify fn val
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFilterOne004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([42, 99, 7]);
      let captured: number = 0;
      arr.filter((v: number, i: int, a: Uint16Array): boolean => {
        if (i === 0) {
          captured = v;
        }
        return true;
      });
      expect(captured).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILTER_ONE_0500
     * @tc.name testUint16ArrayFilterOne005
     * @tc.desc Verify fn val
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFilterOne005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([100, 200, 300]);
      let captured: number = 0;
      arr.filter((v: number, i: int, a: Uint16Array): boolean => {
        if (i === 1) {
          captured = v;
        }
        return false;
      });
      expect(captured).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILTER_ONE_0600
     * @tc.name testUint16ArrayFilterOne006
     * @tc.desc Verify fn val
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFilterOne006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([1, 2, 65535]);
      let captured: number = 0;
      arr.filter((v: number, i: int, a: Uint16Array): boolean => {
        if (i === 2) {
          captured = v;
        }
        return false;
      });
      expect(captured).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILTER_ONE_0700
     * @tc.name testUint16ArrayFilterOne007
     * @tc.desc Verify fn index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFilterOne007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([10, 20, 30]);
      let firstIndex: int = -1;
      arr.filter((v: number, i: int, a: Uint16Array): boolean => {
        if (firstIndex === -1) {
          firstIndex = i;
        }
        return true;
      });
      expect(firstIndex).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILTER_ONE_0800
     * @tc.name testUint16ArrayFilterOne008
     * @tc.desc Verify fn index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFilterOne008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([10, 20, 30]);
      let indices: int[] = [];
      arr.filter((v: number, i: int, a: Uint16Array): boolean => {
        indices.push(i);
        return true;
      });
      expect(indices.at(0)).assertEqual(0);
      expect(indices.at(1)).assertEqual(1);
      expect(indices.at(2)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILTER_ONE_0900
     * @tc.name testUint16ArrayFilterOne009
     * @tc.desc Verify fn index length-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFilterOne009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([1, 2, 3, 4, 5]);
      let lastIndex: int = -1;
      arr.filter((v: number, i: int, a: Uint16Array): boolean => {
        lastIndex = i;
        return true;
      });
      expect(lastIndex).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILTER_ONE_1000
     * @tc.name testUint16ArrayFilterOne010
     * @tc.desc Verify fn array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFilterOne010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([10, 20, 30]);
      let capturedArray: Uint16Array | null = null;
      arr.filter((v: number, i: int, a: Uint16Array): boolean => {
        capturedArray = a;
        return false;
      });
      expect(capturedArray).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILTER_ONE_1100
     * @tc.name testUint16ArrayFilterOne011
     * @tc.desc Verify fn array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFilterOne011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([5, 10, 15, 20]);
      let capturedLen: int = 0;
      arr.filter((v: number, i: int, a: Uint16Array): boolean => {
        capturedLen = a.length;
        return false;
      });
      expect(capturedLen).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILTER_ONE_1200
     * @tc.name testUint16ArrayFilterOne012
     * @tc.desc Verify fn array Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFilterOne012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([1, 2, 3]);
      let isUint16: boolean = false;
      arr.filter((v: number, i: int, a: Uint16Array): boolean => {
        isUint16 = a instanceof Uint16Array;
        return true;
      });
      expect(isUint16).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILTER_ONE_1300
     * @tc.name testUint16ArrayFilterOne013
     * @tc.desc Verify fn
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFilterOne013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([7]);
      let hasAllParams: boolean = false;
      arr.filter((v: number, i: int, a: Uint16Array): boolean => {
        if (v === 7 && i === 0 && a.length === 1) {
          hasAllParams = true;
        }
        return true;
      });
      expect(hasAllParams).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILTER_ONE_1400
     * @tc.name testUint16ArrayFilterOne014
     * @tc.desc Verify filter returns the two elements greater than an external threshold of 25
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFilterOne014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([10, 20, 30, 40]);
      let threshold: number = 25;
      let result: Uint16Array = arr.filter((v: number): boolean => v > threshold);
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual(30);
      expect(result[1]).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILTER_ONE_1500
     * @tc.name testUint16ArrayFilterOne015
     * @tc.desc Verify fn true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFilterOne015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([1, 2, 3, 4, 5]);
      let result: Uint16Array = arr.filter((v: number): boolean => true);
      expect(result.length).assertEqual(5);
      expect(result.at(0)).assertEqual(1);
      expect(result.at(4)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILTER_ONE_1600
     * @tc.name testUint16ArrayFilterOne016
     * @tc.desc Verify filter result instanceof Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFilterOne016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([1, 2, 3]);
      let result: Uint16Array = arr.filter((v: number): boolean => v > 0);
      expect(result instanceof Uint16Array).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILTER_ONE_1700
     * @tc.name testUint16ArrayFilterOne017
     * @tc.desc Verify filter on empty array doesn't call predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFilterOne017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array();
      let called: boolean = false;
      arr.filter((v: number): boolean => {
        called = true;
        return true;
      });
      expect(called).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILTER_ONE_1800
     * @tc.name testUint16ArrayFilterOne018
     * @tc.desc Verify fn false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFilterOne018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([1, 2, 3, 4, 5]);
      let result: Uint16Array = arr.filter((v: number): boolean => false);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILTER_ONE_1900
     * @tc.name testUint16ArrayFilterOne019
     * @tc.desc Verify filter preserves all four elements greater than 2 in source order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFilterOne019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([1, 2, 3, 4, 5, 6]);
      let result: Uint16Array = arr.filter((v: number): boolean => v > 2);
      expect(result.length).assertEqual(4);
      expect(result.at(0)).assertEqual(3);
      expect(result.at(1)).assertEqual(4);
      expect(result.at(2)).assertEqual(5);
      expect(result.at(3)).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILTER_ONE_2000
     * @tc.name testUint16ArrayFilterOne020
     * @tc.desc Verify filter returns the three even elements in source order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFilterOne020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([1, 2, 3, 4, 5, 6]);
      let result: Uint16Array = arr.filter((v: number): boolean => v % 2 === 0);
      expect(result.length).assertEqual(3);
      expect(result.at(0)).assertEqual(2);
      expect(result.at(1)).assertEqual(4);
      expect(result.at(2)).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILTER_ONE_2100
     * @tc.name testUint16ArrayFilterOne021
     * @tc.desc Verify filter returns the three odd elements in source order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFilterOne021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([1, 2, 3, 4, 5, 6]);
      let result: Uint16Array = arr.filter((v: number): boolean => v % 2 === 1);
      expect(result.length).assertEqual(3);
      expect(result.at(0)).assertEqual(1);
      expect(result.at(1)).assertEqual(3);
      expect(result.at(2)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILTER_ONE_2200
     * @tc.name testUint16ArrayFilterOne022
     * @tc.desc Verify filter returns all three occurrences equal to 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFilterOne022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([5, 10, 5, 20, 5]);
      let result: Uint16Array = arr.filter((v: number): boolean => v === 5);
      expect(result.length).assertEqual(3);
      expect(result.at(0)).assertEqual(5);
      expect(result.at(1)).assertEqual(5);
      expect(result.at(2)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILTER_ONE_2300
     * @tc.name testUint16ArrayFilterOne023
     * @tc.desc Verify filter returns the two elements not equal to 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFilterOne023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([5, 10, 5, 20, 5]);
      let result: Uint16Array = arr.filter((v: number): boolean => v !== 5);
      expect(result.length).assertEqual(2);
      expect(result.at(0)).assertEqual(10);
      expect(result.at(1)).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILTER_ONE_2400
     * @tc.name testUint16ArrayFilterOne024
     * @tc.desc Verify filter returns elements greater than or equal to 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFilterOne024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([1, 2, 3, 4, 5]);
      let result: Uint16Array = arr.filter((v: number): boolean => v >= 3);
      expect(result.length).assertEqual(3);
      expect(result.at(0)).assertEqual(3);
      expect(result.at(1)).assertEqual(4);
      expect(result.at(2)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILTER_ONE_2500
     * @tc.name testUint16ArrayFilterOne025
     * @tc.desc Verify filter returns elements less than or equal to 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFilterOne025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([1, 2, 3, 4, 5]);
      let result: Uint16Array = arr.filter((v: number): boolean => v <= 3);
      expect(result.length).assertEqual(3);
      expect(result.at(0)).assertEqual(1);
      expect(result.at(1)).assertEqual(2);
      expect(result.at(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILTER_ONE_2600
     * @tc.name testUint16ArrayFilterOne026
     * @tc.desc Verify 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFilterOne026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([3, 6, 9, 10, 12, 15]);
      let result: Uint16Array = arr.filter((v: number): boolean => v % 3 === 0);
      expect(result.length).assertEqual(5);
      expect(result.at(0)).assertEqual(3);
      expect(result.at(1)).assertEqual(6);
      expect(result.at(2)).assertEqual(9);
      expect(result.at(3)).assertEqual(12);
      expect(result.at(4)).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILTER_ONE_2700
     * @tc.name testUint16ArrayFilterOne027
     * @tc.desc Verify 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFilterOne027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([1, 2, 3, 4, 5]);
      let result: Uint16Array = arr.filter((v: number): boolean => v === 3);
      expect(result.length).assertEqual(1);
      expect(result.at(0)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILTER_ONE_2800
     * @tc.name testUint16ArrayFilterOne028
     * @tc.desc Verify filter returns only value 5 for predicate value greater than 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFilterOne028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([1, 2, 3, 4, 5]);
      let result: Uint16Array = arr.filter((v: number): boolean => v > 4);
      expect(result.length).assertEqual(1);
      expect(result.at(0)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILTER_ONE_2900
     * @tc.name testUint16ArrayFilterOne029
     * @tc.desc Verify filter preserves both occurrences equal to 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFilterOne029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([10, 2, 3, 4, 10]);
      let result: Uint16Array = arr.filter((v: number): boolean => v === 10);
      expect(result.length).assertEqual(2);
      expect(result.at(0)).assertEqual(10);
      expect(result.at(1)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILTER_ONE_3000
     * @tc.name testUint16ArrayFilterOne030
     * @tc.desc Verify > 0 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFilterOne030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([0, 1, 0, 2, 0, 3]);
      let result: Uint16Array = arr.filter((v: number): boolean => v > 0);
      expect(result.length).assertEqual(3);
      expect(result.at(0)).assertEqual(1);
      expect(result.at(1)).assertEqual(2);
      expect(result.at(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILTER_ONE_3100
     * @tc.name testUint16ArrayFilterOne031
     * @tc.desc Verify === 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFilterOne031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([0, 1, 0, 2, 0, 3]);
      let result: Uint16Array = arr.filter((v: number): boolean => v === 0);
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(0);
      expect(result[1]).assertEqual(0);
      expect(result[2]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILTER_ONE_3200
     * @tc.name testUint16ArrayFilterOne032
     * @tc.desc Verify === 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFilterOne032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([1, 65535, 2, 65535, 3]);
      let result: Uint16Array = arr.filter((v: number): boolean => v === 65535);
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual(65535);
      expect(result[1]).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILTER_ONE_3300
     * @tc.name testUint16ArrayFilterOne033
     * @tc.desc Verify > 32768
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFilterOne033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([10000, 32768, 50000, 65535]);
      let result: Uint16Array = arr.filter((v: number): boolean => v > 32768);
      expect(result.length).assertEqual(2);
      expect(result.at(0)).assertEqual(50000);
      expect(result.at(1)).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILTER_ONE_3400
     * @tc.name testUint16ArrayFilterOne034
     * @tc.desc Verify < 32768
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFilterOne034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([10000, 32768, 50000, 65535]);
      let result: Uint16Array = arr.filter((v: number): boolean => v < 32768);
      expect(result.length).assertEqual(1);
      expect(result.at(0)).assertEqual(10000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILTER_ONE_3500
     * @tc.name testUint16ArrayFilterOne035
     * @tc.desc Verify >= 0x8000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFilterOne035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([100, 0x8000, 50000, 0xFFFF]);
      let result: Uint16Array = arr.filter((v: number): boolean => v >= 0x8000);
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(0x8000);
      expect(result[1]).assertEqual(50000);
      expect(result[2]).assertEqual(0xFFFF);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILTER_ONE_3600
     * @tc.name testUint16ArrayFilterOne036
     * @tc.desc Verify === 0xFFFF
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFilterOne036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([0, 0xFFFF, 32768, 0xFFFF]);
      let result: Uint16Array = arr.filter((v: number): boolean => v === 0xFFFF);
      expect(result.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILTER_ONE_3700
     * @tc.name testUint16ArrayFilterOne037
     * @tc.desc Verify 0b1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFilterOne037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([0b1, 0b10, 0b1, 0b100]);
      let result: Uint16Array = arr.filter((v: number): boolean => v === 0b1);
      expect(result.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILTER_ONE_3800
     * @tc.name testUint16ArrayFilterOne038
     * @tc.desc Verify 0o10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFilterOne038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([0o10, 0o20, 0o10]);
      let result: Uint16Array = arr.filter((v: number): boolean => v === 0o10);
      expect(result.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILTER_ONE_3900
     * @tc.name testUint16ArrayFilterOne039
     * @tc.desc Verify 100 1000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFilterOne039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([50, 200, 500, 2000, 800]);
      let result: Uint16Array = arr.filter((v: number): boolean => v >= 100 && v <= 1000);
      expect(result.length).assertEqual(3);
      expect(result.at(0)).assertEqual(200);
      expect(result.at(1)).assertEqual(500);
      expect(result.at(2)).assertEqual(800);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILTER_ONE_4000
     * @tc.name testUint16ArrayFilterOne040
     * @tc.desc Verify filter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFilterOne040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array();
      let result: Uint16Array = arr.filter((v: number): boolean => true);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILTER_ONE_4100
     * @tc.name testUint16ArrayFilterOne041
     * @tc.desc Verify filter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFilterOne041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([1, 2, 3]);
      let result: Uint16Array = arr.filter((v: number): boolean => v > 0);
      expect(result.buffer.byteLength).assertEqual(arr.buffer.byteLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILTER_ONE_4200
     * @tc.name testUint16ArrayFilterOne042
     * @tc.desc Verify filter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFilterOne042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([10, 20, 30, 40, 50]);
      let result: Uint16Array = arr.filter((v: number): boolean => v > 25);
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILTER_ONE_4300
     * @tc.name testUint16ArrayFilterOne043
     * @tc.desc Verify filter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFilterOne043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([50, 10, 40, 20, 30]);
      let result: Uint16Array = arr.filter((v: number): boolean => v > 15);
      expect(result.at(0)).assertEqual(50);
      expect(result.at(1)).assertEqual(40);
      expect(result.at(2)).assertEqual(20);
      expect(result.at(3)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILTER_ONE_4400
     * @tc.name testUint16ArrayFilterOne044
     * @tc.desc Verify filter byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFilterOne044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([1, 2, 3, 4, 5]);
      let result: Uint16Array = arr.filter((v: number): boolean => v % 2 === 0);
      expect(result.byteLength).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILTER_ONE_4500
     * @tc.name testUint16ArrayFilterOne045
     * @tc.desc Verify filter BYTES_PER_ELEMENT
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFilterOne045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([1, 2, 3]);
      let result: Uint16Array = arr.filter((v: number): boolean => v > 0);
      expect(result.BYTES_PER_ELEMENT).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILTER_ONE_4600
     * @tc.name testUint16ArrayFilterOne046
     * @tc.desc Verify filter buffer buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFilterOne046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([1, 2, 3]);
      let result: Uint16Array = arr.filter((v: number): boolean => v > 0);
      expect(result.buffer.byteLength).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILTER_ONE_4700
     * @tc.name testUint16ArrayFilterOne047
     * @tc.desc Verify filter filter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFilterOne047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([1, 2, 3, 4, 5, 6]);
      let result: Uint16Array = arr.filter((v: number): boolean => v > 2).filter((v: number): boolean => v < 6);
      expect(result.length).assertEqual(3);
      expect(result.at(0)).assertEqual(3);
      expect(result.at(1)).assertEqual(4);
      expect(result.at(2)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILTER_ONE_4800
     * @tc.name testUint16ArrayFilterOne048
     * @tc.desc Verify filter for...of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFilterOne048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([1, 2, 3, 4]);
      let result: Uint16Array = arr.filter((v: number): boolean => v > 2);
      let sum: number = 0;
      for (let v of result) {
        sum += v;
      }
      expect(sum).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILTER_ONE_4900
     * @tc.name testUint16ArrayFilterOne049
     * @tc.desc Verify filter byteOffset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFilterOne049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([1, 2, 3]);
      let result: Uint16Array = arr.filter((v: number): boolean => v > 0);
      expect(result.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILTER_ONE_5000
     * @tc.name testUint16ArrayFilterOne050
     * @tc.desc Verify filter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFilterOne050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([1, 2, 3, 4, 5]);
      let origLen: int = arr.length;
      arr.filter((v: number): boolean => v > 2);
      expect(arr.length).assertEqual(origLen);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILTER_ONE_5100
     * @tc.name testUint16ArrayFilterOne051
     * @tc.desc Verify filter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFilterOne051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([10, 20, 30]);
      arr.filter((v: number): boolean => v > 15);
      expect(arr.at(0)).assertEqual(10);
      expect(arr.at(1)).assertEqual(20);
      expect(arr.at(2)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILTER_ONE_5200
     * @tc.name testUint16ArrayFilterOne052
     * @tc.desc Verify filter null ClassCastError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFilterOne052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([1, 2, 3]);
      let hasError: boolean = false;
      try {
        let r: Uint16Array = arr.filter(null as ((val: number, index: int, array: Uint16Array) => boolean));
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
        hasError = true;
      }
      expect(hasError).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILTER_ONE_5300
     * @tc.name testUint16ArrayFilterOne053
     * @tc.desc Verify filter Error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFilterOne053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([1, 2, 3]);
      let hasError: boolean = false;
      try {
        arr.filter((v: number): boolean => {
          if (v === 2) {
            throw new Error("filter error");
          }
          return true;
        });
      } catch (e) {
        expect(e.name).assertEqual('Error');
        hasError = true;
      }
      expect(hasError).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILTER_ONE_5400
     * @tc.name testUint16ArrayFilterOne054
     * @tc.desc Verify filter callback throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFilterOne054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([1, 2, 3]);
      let hasError: boolean = false;
      try {
        arr.filter((v: number): boolean => {
          if (v === 2) {
            throw new RangeError("range error in filter");
          }
          return true;
        });
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
        hasError = true;
      }
      expect(hasError).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILTER_ONE_5500
     * @tc.name testUint16ArrayFilterOne055
     * @tc.desc Verify filter callback throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFilterOne055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([1, 2, 3]);
      let hasError: boolean = false;
      try {
        arr.filter((v: number): boolean => {
          throw new TypeError("type error in filter");
        });
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
        hasError = true;
      }
      expect(hasError).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILTER_ONE_5600
     * @tc.name testUint16ArrayFilterOne056
     * @tc.desc Verify filter map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFilterOne056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([1, 2, 3, 4, 5]);
      let filtered: Uint16Array = arr.filter((v: number): boolean => v > 2);
      let mapped: Uint16Array = filtered.map((v: number): number => v * 10);
      expect(mapped.length).assertEqual(3);
      expect(mapped.at(0)).assertEqual(30);
      expect(mapped.at(1)).assertEqual(40);
      expect(mapped.at(2)).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILTER_ONE_5700
     * @tc.name testUint16ArrayFilterOne057
     * @tc.desc Verify summing filtered values with indexed iteration returns 12
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFilterOne057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([1, 2, 3, 4, 5]);
      let filtered: Uint16Array = arr.filter((v: number): boolean => v > 2);
      let sum: number = 0;
      for (let i: int = 0; i < filtered.length; i++) {
        sum += filtered[i];
      }
      expect(sum).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILTER_ONE_5800
     * @tc.name testUint16ArrayFilterOne058
     * @tc.desc Verify filter forEach
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFilterOne058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([1, 2, 3, 4, 5]);
      let filtered: Uint16Array = arr.filter((v: number): boolean => v % 2 === 0);
      let sum: number = 0;
      filtered.forEach((v: number) => {
        sum += v;

      });
      expect(sum).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILTER_ONE_5900
     * @tc.name testUint16ArrayFilterOne059
     * @tc.desc Verify filter every
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFilterOne059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([1, 2, 3, 4, 5]);
      let filtered: Uint16Array = arr.filter((v: number): boolean => v > 0);
      let allPositive: boolean = filtered.every((v: number): boolean => v > 0);
      expect(allPositive).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILTER_ONE_6000
     * @tc.name testUint16ArrayFilterOne060
     * @tc.desc Verify findIndex detects a value greater than 4 in the filtered result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFilterOne060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([1, 2, 3, 4, 5]);
      let filtered: Uint16Array = arr.filter((v: number): boolean => v > 3);
      let hasLarge: boolean = filtered.findIndex((v: number): boolean => v > 4) !== -1;
      expect(hasLarge).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILTER_ONE_6100
     * @tc.name testUint16ArrayFilterOne061
     * @tc.desc Verify filter find
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFilterOne061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([10, 20, 30, 40, 50]);
      let filtered: Uint16Array = arr.filter((v: number): boolean => v > 20);
      let found: number | undefined = filtered.find((v: number): boolean => v === 40);
      expect(found).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILTER_ONE_6200
     * @tc.name testUint16ArrayFilterOne062
     * @tc.desc Verify filter findIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFilterOne062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([10, 20, 30, 40, 50]);
      let filtered: Uint16Array = arr.filter((v: number): boolean => v > 20);
      let idx: int = filtered.findIndex((v: number): boolean => v === 50);
      expect(idx).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILTER_ONE_6300
     * @tc.name testUint16ArrayFilterOne063
     * @tc.desc Verify filter includes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFilterOne063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([5, 10, 15, 20, 25]);
      let filtered: Uint16Array = arr.filter((v: number): boolean => v > 10);
      let hasFifteen: boolean = filtered.includes(15);
      expect(hasFifteen).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILTER_ONE_6400
     * @tc.name testUint16ArrayFilterOne064
     * @tc.desc Verify filter indexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFilterOne064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([1, 2, 3, 4, 5]);
      let filtered: Uint16Array = arr.filter((v: number): boolean => v > 2);
      let idx: int = filtered.indexOf(4);
      expect(idx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILTER_ONE_6500
     * @tc.name testUint16ArrayFilterOne065
     * @tc.desc Verify filter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFilterOne065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([1, 2, 3, 4, 5]);
      let side: int[] = [];
      arr.filter((v: number, i: int, a: Uint16Array): boolean => {
        side.push(Double.toInt(v * 2));
        return v > 2;
      });
      expect(side.length).assertEqual(5);
      expect(side.at(0)).assertEqual(2);
      expect(side.at(1)).assertEqual(4);
      expect(side.at(2)).assertEqual(6);
      expect(side.at(3)).assertEqual(8);
      expect(side.at(4)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILTER_ONE_6600
     * @tc.name testUint16ArrayFilterOne066
     * @tc.desc Verify filter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFilterOne066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([1, 2, 3, 4, 5]);
      let result: Uint16Array = arr.filter((v: number, i: int, a: Uint16Array): boolean => {
        if (i === 0) {
          a[1] = 99;
        }
        return v > 2;
      });
      expect(result.length).assertEqual(4);
      expect(result.at(0)).assertEqual(99);
      expect(result.at(1)).assertEqual(3);
      expect(result.at(2)).assertEqual(4);
      expect(result.at(3)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILTER_ONE_6700
     * @tc.name testUint16ArrayFilterOne067
     * @tc.desc Verify filter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFilterOne067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([1, 2, 3, 4, 5]);
      let multiplier: number = 3;
      let filtered: Uint16Array = arr.filter((v: number): boolean => v * multiplier > 10);
      expect(filtered.length).assertEqual(2);
      expect(filtered.at(0)).assertEqual(4);
      expect(filtered.at(1)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILTER_ONE_6800
     * @tc.name testUint16ArrayFilterOne068
     * @tc.desc Verify filter index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFilterOne068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([10, 20, 30, 40, 50]);
      let result: Uint16Array = arr.filter((v: number, i: int, a: Uint16Array): boolean => i % 2 === 0);
      expect(result.length).assertEqual(3);
      expect(result.at(0)).assertEqual(10);
      expect(result.at(1)).assertEqual(30);
      expect(result.at(2)).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILTER_ONE_6900
     * @tc.name testUint16ArrayFilterOne069
     * @tc.desc Verify filter array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFilterOne069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([10, 20, 30, 40, 50]);
      let result: Uint16Array = arr.filter((v: number, i: int, a: Uint16Array): boolean => v === a[i]);
      expect(result.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILTER_ONE_7000
     * @tc.name testUint16ArrayFilterOne070
     * @tc.desc Verify filter 100
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFilterOne070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(100);
      for (let i: int = 0; i < 100; i++) {
        arr[i] = i;
      }
      let result: Uint16Array = arr.filter((v: number): boolean => v % 10 === 0);
      expect(result.length).assertEqual(10);
      expect(result.at(0)).assertEqual(0);
      expect(result.at(1)).assertEqual(10);
      expect(result.at(9)).assertEqual(90);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILTER_ONE_7100
     * @tc.name testUint16ArrayFilterOne071
     * @tc.desc Verify filter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFilterOne071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(100);
      for (let i: int = 0; i < 100; i++) {
        arr[i] = 1;
      }
      let result: Uint16Array = arr.filter((v: number): boolean => v === 1);
      expect(result.length).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILTER_ONE_7200
     * @tc.name testUint16ArrayFilterOne072
     * @tc.desc Verify filter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFilterOne072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(100);
      for (let i: int = 0; i < 100; i++) {
        arr[i] = 1;
      }
      let result: Uint16Array = arr.filter((v: number): boolean => v === 0);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILTER_ONE_7300
     * @tc.name testUint16ArrayFilterOne073
     * @tc.desc Verify subarray filter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFilterOne073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([10, 20, 30, 40, 50]);
      let sub: Uint16Array = arr.subarray(1, 4);
      let result: Uint16Array = sub.filter((v: number): boolean => v > 25);
      expect(result.length).assertEqual(2);
      expect(result.at(0)).assertEqual(30);
      expect(result.at(1)).assertEqual(40);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILTER_ONE_7400
     * @tc.name testUint16ArrayFilterOne074
     * @tc.desc Verify filter on Uint16Array created from existing buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFilterOne074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buffer: ArrayBuffer = new ArrayBuffer(8);
      let view: Uint16Array = new Uint16Array(buffer);
      view[0] = 100;
      view[1] = 200;
      view[2] = 300;
      view[3] = 400;
      let result: Uint16Array = view.filter((v: number): boolean => v > 200);
      expect(result.length).assertEqual(2);
    });

  });
}
