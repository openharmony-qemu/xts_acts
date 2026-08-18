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
  afterAll,
  afterEach,
  beforeAll,
  beforeEach,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType,
} from '../../../../hypium/index';
import Utils from '../Util.test';

export default function uint32ArraySomeOneTest(): void {
  describe('Uint32ArraySomeOneTest', (): void => {
    beforeAll(() => {
    });

    beforeEach(async () => {
      await Utils.msSleep(30);
    });

    afterEach(() => {
    });

    afterAll(() => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SOME_0100
     * @tc.name testUint32ArraySomeOne001
     * @tc.desc Verify some() returns true when predicate matches element value greater than 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySomeOne001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(1, 2, 3);
      const result: boolean = arr.some((e: number, i: int, a: Uint32Array): boolean => e > 2);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SOME_0200
     * @tc.name testUint32ArraySomeOne002
     * @tc.desc Verify some() returns false and visits all elements when predicate always returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySomeOne002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(1, 2, 3);
      let callCount: int = 0;
      const result: boolean = arr.some(
        (e: number, i: int, a: Uint32Array): boolean => { callCount = callCount + 1; return false; }
      );
      expect(result).assertFalse();
      expect(callCount).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SOME_0300
     * @tc.name testUint32ArraySomeOne003
     * @tc.desc Verify some() returns true and stops after first callback returning true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySomeOne003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(5, 6, 7);
      let callCount: int = 0;
      const result: boolean = arr.some(
        (e: number, i: int, a: Uint32Array): boolean => { callCount = callCount + 1; return true; }
      );
      expect(result).assertTrue();
      expect(callCount).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SOME_0400
     * @tc.name testUint32ArraySomeOne004
     * @tc.desc Verify some() returns true when predicate matches element value 20
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySomeOne004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(10, 20, 30);
      const result: boolean = arr.some((e: number): boolean => e === 20);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SOME_0500
     * @tc.name testUint32ArraySomeOne005
     * @tc.desc Verify some() returns true when predicate matches by index 1 and element 20
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySomeOne005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(10, 20, 30);
      const result: boolean = arr.some((e: number, i: int): boolean => i === 1 && e === 20);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SOME_0600
     * @tc.name testUint32ArraySomeOne006
     * @tc.desc Verify some() returns true when predicate matches a non-zero element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySomeOne006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(0, 0, 1);
      const result: boolean = arr.some((e: number): boolean => e !== 0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SOME_0700
     * @tc.name testUint32ArraySomeOne007
     * @tc.desc Verify some() returns true when if-else predicate matches element > 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySomeOne007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(1, 5, 10);
      const result: boolean = arr.some((e: number, i: int, a: Uint32Array): boolean => {
        if (e > 4) { return true; }
        return false;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SOME_0800
     * @tc.name testUint32ArraySomeOne008
     * @tc.desc Verify some() returns true when predicate matches element value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySomeOne008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(1, 2, 3);
      const result: boolean = arr.some((e: number, i: int, a: Uint32Array): boolean => e === 1);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SOME_0900
     * @tc.name testUint32ArraySomeOne009
     * @tc.desc Verify some() returns true and count equals 3 when third element matches
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySomeOne009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(1, 2, 3, 4, 5);
      let count: int = 0;
      const result: boolean = arr.some((e: number, i: int, a: Uint32Array): boolean => {
        count = count + 1;
        return e === 3;
      });
      expect(result).assertTrue();
      expect(count).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SOME_1000
     * @tc.name testUint32ArraySomeOne010
     * @tc.desc Verify some() rethrows Error thrown by predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySomeOne010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(1, 2, 3);
      try {
        arr.some((e: number, i: int, a: Uint32Array): boolean => { throw new Error('boom'); });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SOME_1100
     * @tc.name testUint32ArraySomeOne011
     * @tc.desc Verify some() rethrows RangeError thrown by predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySomeOne011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(1, 2, 3);
      try {
        arr.some((e: number, i: int, a: Uint32Array): boolean => { throw new RangeError('range'); });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SOME_1200
     * @tc.name testUint32ArraySomeOne012
     * @tc.desc Verify some() returns true and stops at index 1 when element 2 matches
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySomeOne012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(1, 2, 3, 4, 5);
      let lastVisited: int = -1;
      let count: int = 0;
      const result: boolean = arr.some((e: number, i: int, a: Uint32Array): boolean => {
        lastVisited = i;
        count = count + 1;
        return e === 2;
      });
      expect(count).assertEqual(2);
      expect(lastVisited).assertEqual(1);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SOME_1300
     * @tc.name testUint32ArraySomeOne013
     * @tc.desc Verify some() returns false and accumulates sum across all elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySomeOne013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(1, 2, 3);
      let sum: number = 0;
      const result: boolean = arr.some((e: number, i: int, a: Uint32Array): boolean => {
        sum = sum + e;
        return false;
      });
      expect(result).assertFalse();
      expect(sum).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SOME_1400
     * @tc.name testUint32ArraySomeOne014
     * @tc.desc Verify some() returns true when element is between 4 and 12
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySomeOne014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(1, 5, 10, 15);
      const result: boolean = arr.some((e: number, i: int, a: Uint32Array): boolean => e > 4 && e < 12);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SOME_1500
     * @tc.name testUint32ArraySomeOne015
     * @tc.desc Verify some() returns false when no element exceeds 100
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySomeOne015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(1, 2, 3);
      const result: boolean = arr.some((e: number, i: int, a: Uint32Array): boolean => e > 100);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SOME_1600
     * @tc.name testUint32ArraySomeOne016
     * @tc.desc Verify some() returns true when element equals 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySomeOne016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(1, 2, 0);
      const result: boolean = arr.some((e: number, i: int, a: Uint32Array): boolean => e === 0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SOME_1700
     * @tc.name testUint32ArraySomeOne017
     * @tc.desc Verify some() returns false when all elements are 0 and predicate checks non-zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySomeOne017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(0, 0, 0);
      const result: boolean = arr.some((e: number, i: int, a: Uint32Array): boolean => e !== 0);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SOME_1800
     * @tc.name testUint32ArraySomeOne018
     * @tc.desc Verify some() returns true when element equals uint32 MAX 4294967295
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySomeOne018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(4294967295, 1, 2);
      const result: boolean = arr.some((e: number, i: int, a: Uint32Array): boolean => e === 4294967295);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SOME_1900
     * @tc.name testUint32ArraySomeOne019
     * @tc.desc Verify some() returns true when element equals 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySomeOne019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(0, 1, 2);
      const result: boolean = arr.some((e: number, i: int, a: Uint32Array): boolean => e === 1);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SOME_2000
     * @tc.name testUint32ArraySomeOne020
     * @tc.desc Verify some() returns true when element equals int32 MAX 2147483647
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySomeOne020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(2147483647, 1, 2);
      const result: boolean = arr.some((e: number, i: int, a: Uint32Array): boolean => e === 2147483647);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SOME_2100
     * @tc.name testUint32ArraySomeOne021
     * @tc.desc Verify some() returns true after $_set(0,-1) wraps to 4294967295
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySomeOne021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(3, 4, 5);
      arr.$_set(0, -1);
      const result: boolean = arr.some((e: number, i: int, a: Uint32Array): boolean => e === 4294967295);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SOME_2200
     * @tc.name testUint32ArraySomeOne022
     * @tc.desc Verify some() returns true after $_set(0,4294967296) wraps to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySomeOne022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(3, 4, 5);
      arr.$_set(0, 4294967296);
      const result: boolean = arr.some((e: number, i: int, a: Uint32Array): boolean => e === 0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SOME_2300
     * @tc.name testUint32ArraySomeOne023
     * @tc.desc Verify some() returns true after $_set(0,NaN) stores 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySomeOne023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(3, 4, 5);
      arr.$_set(0, Number.NaN);
      expect(arr.$_get(0)).assertEqual(0);
      const result: boolean = arr.some((e: number, i: int, a: Uint32Array): boolean => e === 0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SOME_2400
     * @tc.name testUint32ArraySomeOne024
     * @tc.desc Verify some() returns true after $_set(1,3.14) truncates to 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySomeOne024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(0, 0, 0);
      arr.$_set(1, 3.14);
      const result: boolean = arr.some((e: number, i: int, a: Uint32Array): boolean => e === 3);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SOME_2500
     * @tc.name testUint32ArraySomeOne025
     * @tc.desc Verify some() returns true after $_set(0,-2147483648) wraps to 2147483648
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySomeOne025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(0, 0, 0);
      arr.$_set(0, -2147483648);
      const result: boolean = arr.some((e: number, i: int, a: Uint32Array): boolean => e === 2147483648);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SOME_2600
     * @tc.name testUint32ArraySomeOne026
     * @tc.desc Verify some() returns true after $_set(0,9007199254740991) wraps to 4294967295
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySomeOne026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(0, 0, 0);
      arr.$_set(0, 9007199254740991);
      const result: boolean = arr.some((e: number, i: int, a: Uint32Array): boolean => e === 4294967295);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SOME_2700
     * @tc.name testUint32ArraySomeOne027
     * @tc.desc Verify some() returns true for single-element array [42] matching 42
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySomeOne027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(42);
      const result: boolean = arr.some((e: number, i: int, a: Uint32Array): boolean => e === 42);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SOME_2800
     * @tc.name testUint32ArraySomeOne028
     * @tc.desc Verify some() returns true when index 99 element 7 matches on length-100 array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySomeOne028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = new Uint32Array(100);
      arr.$_set(99, 7);
      const result: boolean = arr.some((e: number, i: int, a: Uint32Array): boolean => e === 7);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SOME_2900
     * @tc.name testUint32ArraySomeOne029
     * @tc.desc Verify some() returns true after $_set with byte value 10 matches 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySomeOne029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(0, 0, 0);
      const v: byte = 10;
      arr.$_set(1, v);
      const result: boolean = arr.some((e: number, i: int, a: Uint32Array): boolean => e === 10);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SOME_3000
     * @tc.name testUint32ArraySomeOne030
     * @tc.desc Verify some() returns true when element 300 matches and count equals 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySomeOne030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(100, 200, 300);
      let count: int = 0;
      const result: boolean = arr.some((e: number, i: int, a: Uint32Array): boolean => {
        count = count + 1;
        return e === 300;
      });
      expect(result).assertTrue();
      expect(count).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SOME_3100
     * @tc.name testUint32ArraySomeOne031
     * @tc.desc Verify some() returns true and stops at first element when all equal 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySomeOne031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(5, 5, 5, 5);
      let count: int = 0;
      const result: boolean = arr.some((e: number, i: int, a: Uint32Array): boolean => {
        count = count + 1;
        return e === 5;
      });
      expect(result).assertTrue();
      expect(count).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SOME_3200
     * @tc.name testUint32ArraySomeOne032
     * @tc.desc Verify some() returns true when element 0o777 equals 511
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySomeOne032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(0o777, 1, 2);
      const result: boolean = arr.some((e: number, i: int, a: Uint32Array): boolean => e === 511);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SOME_3300
     * @tc.name testUint32ArraySomeOne033
     * @tc.desc Verify some() returns true when element 0b1010 equals 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySomeOne033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(0b1010, 1, 2);
      const result: boolean = arr.some((e: number, i: int, a: Uint32Array): boolean => e === 10);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SOME_3400
     * @tc.name testUint32ArraySomeOne034
     * @tc.desc Verify some() returns true when element 1e6 equals 1000000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySomeOne034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(1e6, 1, 2);
      const result: boolean = arr.some((e: number, i: int, a: Uint32Array): boolean => e === 1000000);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SOME_3500
     * @tc.name testUint32ArraySomeOne035
     * @tc.desc Verify some() returns true after $_set(0,8589934591) wraps to 4294967295
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySomeOne035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(0, 0, 0);
      arr.$_set(0, 8589934591);
      const result: boolean = arr.some((e: number, i: int, a: Uint32Array): boolean => e === 4294967295);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SOME_3600
     * @tc.name testUint32ArraySomeOne036
     * @tc.desc Verify some() returns true after $_set(0,4294967297) wraps to 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySomeOne036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(0, 0, 0);
      arr.$_set(0, 4294967297);
      const result: boolean = arr.some((e: number, i: int, a: Uint32Array): boolean => e === 1);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SOME_3700
     * @tc.name testUint32ArraySomeOne037
     * @tc.desc Verify some() returns true after $_set(0,-2) wraps to 4294967294
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySomeOne037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(0, 0, 0);
      arr.$_set(0, -2);
      const result: boolean = arr.some((e: number, i: int, a: Uint32Array): boolean => e === 4294967294);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SOME_3800
     * @tc.name testUint32ArraySomeOne038
     * @tc.desc Verify some() returns true after $_set(0,-2147483647) wraps to 2147483649
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySomeOne038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(0, 0, 0);
      arr.$_set(0, -2147483647);
      const result: boolean = arr.some((e: number, i: int, a: Uint32Array): boolean => e === 2147483649);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SOME_3900
     * @tc.name testUint32ArraySomeOne039
     * @tc.desc Verify some() delivers index 0 as first callback argument
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySomeOne039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(10, 20, 30);
      let firstIndex: int = -1;
      arr.some((e: number, i: int, a: Uint32Array): boolean => { firstIndex = i; return true; });
      expect(firstIndex).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SOME_4000
     * @tc.name testUint32ArraySomeOne040
     * @tc.desc Verify some() passes indices sequentially during traversal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySomeOne040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(1, 2, 3);
      let prev: int = -1;
      let sequential: boolean = true;
      arr.some((e: number, i: int, a: Uint32Array): boolean => {
        if (prev !== -1 && i !== prev + 1) { sequential = false; }
        prev = i;
        return false;
      });
      expect(sequential).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SOME_4100
     * @tc.name testUint32ArraySomeOne041
     * @tc.desc Verify some() last visited index equals length-1 when predicate never matches
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySomeOne041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(1, 2, 3, 4, 5);
      let lastIndex: int = -1;
      const result: boolean = arr.some(
        (e: number, i: int, a: Uint32Array): boolean => { lastIndex = i; return false; }
      );
      expect(result).assertFalse();
      expect(lastIndex).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SOME_4200
     * @tc.name testUint32ArraySomeOne042
     * @tc.desc Verify some() passes index consistent with array element at same index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySomeOne042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(100, 200, 300);
      let consistent: boolean = true;
      arr.some((e: number, i: int, a: Uint32Array): boolean => {
        if (a.$_get(i) !== e) { consistent = false; }
        return false;
      });
      expect(consistent).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SOME_4300
     * @tc.name testUint32ArraySomeOne043
     * @tc.desc Verify some() passes index 0 for single-element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySomeOne043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(42);
      let receivedIndex: int = -1;
      arr.some((e: number, i: int, a: Uint32Array): boolean => { receivedIndex = i; return false; });
      expect(receivedIndex).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SOME_4400
     * @tc.name testUint32ArraySomeOne044
     * @tc.desc Verify some() returns true when index equals 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySomeOne044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(1, 2, 3);
      const result: boolean = arr.some((e: number, i: int, a: Uint32Array): boolean => i === 1);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SOME_4500
     * @tc.name testUint32ArraySomeOne045
     * @tc.desc Verify some() returns true immediately when index equals 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySomeOne045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(1, 2, 3);
      let count: int = 0;
      const result: boolean = arr.some((e: number, i: int, a: Uint32Array): boolean => {
        count = count + 1;
        return i === 0;
      });
      expect(result).assertTrue();
      expect(count).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SOME_4600
     * @tc.name testUint32ArraySomeOne046
     * @tc.desc Verify some() returns true when index equals 2 and count equals 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySomeOne046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(1, 2, 3, 4, 5);
      let count: int = 0;
      const result: boolean = arr.some((e: number, i: int, a: Uint32Array): boolean => {
        count = count + 1;
        return i === 2;
      });
      expect(result).assertTrue();
      expect(count).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SOME_4700
     * @tc.name testUint32ArraySomeOne047
     * @tc.desc Verify some() last visited index equals length-1 on length-50 array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySomeOne047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = new Uint32Array(50);
      arr.$_set(49, 1);
      let lastIndex: int = -1;
      arr.some((e: number, i: int, a: Uint32Array): boolean => { lastIndex = i; return false; });
      expect(lastIndex).assertEqual(49);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SOME_4800
     * @tc.name testUint32ArraySomeOne048
     * @tc.desc Verify some() index stays within 0..length-1 during traversal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySomeOne048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(1, 2, 3);
      let indexOutOfBounds: boolean = false;
      arr.some((e: number, i: int, a: Uint32Array): boolean => {
        if (i < 0 || i >= a.length) { indexOutOfBounds = true; }
        return false;
      });
      expect(indexOutOfBounds).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SOME_4900
     * @tc.name testUint32ArraySomeOne049
     * @tc.desc Verify some() returns true when predicate matches odd index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySomeOne049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(10, 20, 30, 40);
      const result: boolean = arr.some((e: number, i: int, a: Uint32Array): boolean => i % 2 === 1);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SOME_5000
     * @tc.name testUint32ArraySomeOne050
     * @tc.desc Verify some() returns false when predicate looks for index equal to length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySomeOne050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(1, 2, 3);
      const result: boolean = arr.some((e: number, i: int, a: Uint32Array): boolean => i === 3);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SOME_5100
     * @tc.name testUint32ArraySomeOne051
     * @tc.desc Verify some() index accumulates to sum 0+1+2+3 equal to 6
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySomeOne051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(1, 2, 3, 4);
      let indexSum: int = 0;
      arr.some((e: number, i: int, a: Uint32Array): boolean => { indexSum = indexSum + i; return false; });
      expect(indexSum).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SOME_5200
     * @tc.name testUint32ArraySomeOne052
     * @tc.desc Verify some() returns true when index 0 and element 100 both match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySomeOne052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(100, 200, 300);
      let matched: boolean = false;
      arr.some((e: number, i: int, a: Uint32Array): boolean => {
        if (i === 0 && e === 100) { matched = true; return true; }
        return false;
      });
      expect(matched).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SOME_5300
     * @tc.name testUint32ArraySomeOne053
     * @tc.desc Verify some() returns false and predicate not called on empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySomeOne053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = new Uint32Array(0);
      let called: boolean = false;
      const result: boolean = arr.some((e: number, i: int, a: Uint32Array): boolean => { called = true; return true; });
      expect(called).assertFalse();
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SOME_5400
     * @tc.name testUint32ArraySomeOne054
     * @tc.desc Verify some() passes the same Uint32Array reference as third argument
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySomeOne054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(1, 2, 3);
      let sameRef: boolean = false;
      arr.some((e: number, i: int, a: Uint32Array): boolean => {
        if (a === arr) { sameRef = true; }
        return false;
      });
      expect(sameRef).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SOME_5500
     * @tc.name testUint32ArraySomeOne055
     * @tc.desc Verify some() array parameter length equals 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySomeOne055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(1, 2, 3, 4);
      let lenMatch: boolean = false;
      arr.some((e: number, i: int, a: Uint32Array): boolean => {
        if (a.length === 4) { lenMatch = true; }
        return false;
      });
      expect(lenMatch).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SOME_5600
     * @tc.name testUint32ArraySomeOne056
     * @tc.desc Verify some() array parameter supports $_get to read element 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySomeOne056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(10, 20, 30);
      let readable: boolean = false;
      arr.some((e: number, i: int, a: Uint32Array): boolean => {
        if (a.$_get(0) === 10) { readable = true; }
        return false;
      });
      expect(readable).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SOME_5700
     * @tc.name testUint32ArraySomeOne057
     * @tc.desc Verify some() array parameter byteLength equals 16 for length 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySomeOne057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(1, 2, 3, 4);
      let byteLenOk: boolean = false;
      arr.some((e: number, i: int, a: Uint32Array): boolean => {
        if (a.byteLength === 16) { byteLenOk = true; }
        return false;
      });
      expect(byteLenOk).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SOME_5800
     * @tc.name testUint32ArraySomeOne058
     * @tc.desc Verify some() array parameter allows $_set mutation during traversal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySomeOne058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(1, 2, 3);
      let count: int = 0;
      arr.some((e: number, i: int, a: Uint32Array): boolean => {
        count = count + 1;
        a.$_set(i, 99);
        return false;
      });
      expect(count).assertEqual(3);
      expect(arr.$_get(0)).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SOME_5900
     * @tc.name testUint32ArraySomeOne059
     * @tc.desc Verify some() array parameter allows peek of neighbouring element via $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySomeOne059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(10, 20, 30, 40);
      let peekOk: boolean = false;
      const result: boolean = arr.some((e: number, i: int, a: Uint32Array): boolean => {
        if (i === 1 && a.$_get(2) === 30) { peekOk = true; return true; }
        return false;
      });
      expect(peekOk).assertTrue();
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SOME_6000
     * @tc.name testUint32ArraySomeOne060
     * @tc.desc Verify some() array parameter length equals 1 for single-element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySomeOne060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(42);
      let singleLen: boolean = false;
      arr.some((e: number, i: int, a: Uint32Array): boolean => {
        if (a.length === 1) { singleLen = true; }
        return false;
      });
      expect(singleLen).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SOME_6100
     * @tc.name testUint32ArraySomeOne061
     * @tc.desc Verify some() array parameter length equals 1000 for large array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySomeOne061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = new Uint32Array(1000);
      let bigLen: boolean = false;
      const result: boolean = arr.some((e: number, i: int, a: Uint32Array): boolean => {
        if (a.length === 1000) { bigLen = true; return true; }
        return false;
      });
      expect(bigLen).assertTrue();
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SOME_6200
     * @tc.name testUint32ArraySomeOne062
     * @tc.desc Verify some() array parameter byteOffset equals 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySomeOne062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(1, 2, 3);
      let offsetZero: boolean = false;
      arr.some((e: number, i: int, a: Uint32Array): boolean => {
        if (a.byteOffset === 0) { offsetZero = true; }
        return false;
      });
      expect(offsetZero).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SOME_6300
     * @tc.name testUint32ArraySomeOne063
     * @tc.desc Verify some() visits all length elements when predicate matches last index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySomeOne063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(1, 2, 3, 4, 5);
      let visitedCount: int = 0;
      arr.some((e: number, i: int, a: Uint32Array): boolean => {
        visitedCount = visitedCount + 1;
        return i === a.length - 1;
      });
      expect(visitedCount).assertEqual(5);
    });

  });
}
