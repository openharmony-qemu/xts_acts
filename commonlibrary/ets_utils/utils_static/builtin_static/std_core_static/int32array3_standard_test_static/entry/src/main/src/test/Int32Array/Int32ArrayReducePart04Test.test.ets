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
import Utils from './../Util.test';

class AccR1 {
  sum: number = 0;
}

class Acc2R2 {
  total: number = 0;
}

class MaxAccR3 {
  max: number = -2147483648;
}

class MinAccR4 {
  min: number = 2147483647;
}

class CntR5 {
  n: number = 0;
}

class Acc3R6 {
  val: number = 42;
}

class Acc4R7 {
  v: number = 0;
}

export default function Int32ArrayReducePart04Test(): void {
  describe('Int32ArrayReducePart04Test', () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART04_0100
     * @tc.name int32ArrayReducePart04Test001
     * @tc.desc Verify single element with initialValue, callback invoked once
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart04Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(42);
      let calls: int = 0;
      let r: number = arr.reduce((prev: number, curr: number, _i: int, _a: Int32Array): number => {
        calls = calls + 1;
        return prev + curr;
      }, 100);
      expect(calls).assertEqual(1);
      expect(r).assertEqual(142);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART04_0200
     * @tc.name int32ArrayReducePart04Test002
     * @tc.desc Verify multi-element callback call count equals array length (with initialValue)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart04Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3, 4, 5);
      let calls: int = 0;
      arr.reduce((p: number, c: number, _i: int, _a: Int32Array): number => {
        calls = calls + 1;
        return p + c;
      }, 0);
      expect(calls).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART04_0300
     * @tc.name int32ArrayReducePart04Test003
     * @tc.desc Verify empty array with initialValue returns initialValue, callback not invoked
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart04Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(0);
      let called: boolean = false;
      let r: number = arr.reduce((p: number, c: number, _i: int, _a: Int32Array): number => {
        called = true;
        return p + c;
      }, 77);
      expect(called).assertFalse();
      expect(r).assertEqual(77);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART04_0400
     * @tc.name int32ArrayReducePart04Test004
     * @tc.desc Verify with initialValue first callback previousValue equals initialValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart04Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(10, 20);
      let firstPrev: number = 0;
      arr.reduce((p: number, c: number, i: int, _a: Int32Array): number => {
        if (i === 0) {
          firstPrev = p;
        }
        return p + c;
      }, 99);
      expect(firstPrev).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART04_0500
     * @tc.name int32ArrayReducePart04Test005
     * @tc.desc Verify with initialValue first callback currentValue equals first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart04Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(55, 66);
      let firstCurr: number = 0;
      arr.reduce((p: number, c: number, i: int, _a: Int32Array): number => {
        if (i === 0) {
          firstCurr = c;
        }
        return p + c;
      }, 0);
      expect(firstCurr).assertEqual(55);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART04_0600
     * @tc.name int32ArrayReducePart04Test006
     * @tc.desc Verify with initialValue first callback currentIndex is 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart04Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(7, 8);
      let firstIdx: int = -1;
      arr.reduce((p: number, c: number, i: int, _a: Int32Array): number => {
        if (firstIdx === -1) {
          firstIdx = i;
        }
        return p + c;
      }, 0);
      expect(firstIdx).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART04_0700
     * @tc.name int32ArrayReducePart04Test007
     * @tc.desc Verify with initialValue callback fourth param array is original reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart04Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2);
      let sameRef: boolean = false;
      arr.reduce((p: number, c: number, _i: int, a: Int32Array): number => {
        sameRef = a === arr;
        return p + c;
      }, 0);
      expect(sameRef).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART04_0800
     * @tc.name int32ArrayReducePart04Test008
     * @tc.desc Verify with initialValue callback currentIndex increments 0,1,2...
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart04Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(10, 20, 30, 40);
      let idxs: int[] = [];
      arr.reduce((p: number, c: number, i: int, _a: Int32Array): number => {
        idxs.push(i);
        return p + c;
      }, 0);
      expect(idxs.length).assertEqual(4);
      expect(idxs[0]).assertEqual(0);
      expect(idxs[1]).assertEqual(1);
      expect(idxs[2]).assertEqual(2);
      expect(idxs[3]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART04_0900
     * @tc.name int32ArrayReducePart04Test009
     * @tc.desc Verify with initialValue currentValue sequence starts from index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart04Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(3, 6, 9);
      let vals: number[] = [];
      arr.reduce((p: number, c: number, _i: int, _a: Int32Array): number => {
        vals.push(c);
        return p + c;
      }, 0);
      expect(vals.length).assertEqual(3);
      expect(vals[0]).assertEqual(3);
      expect(vals[1]).assertEqual(6);
      expect(vals[2]).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART04_1000
     * @tc.name int32ArrayReducePart04Test010
     * @tc.desc Verify previousValue chain: second callback prev equals first return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart04Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      let secondPrev: number = 0;
      arr.reduce((p: number, c: number, i: int, _a: Int32Array): number => {
        if (i === 1) {
          secondPrev = p;
        }
        return p * 10 + c;
      }, 0);
      expect(secondPrev).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART04_1100
     * @tc.name int32ArrayReducePart04Test011
     * @tc.desc Verify callback array param length matches original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart04Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3, 4);
      let reportedLen: int = 0;
      arr.reduce((p: number, c: number, _i: int, a: Int32Array): number => {
        reportedLen = a.length;
        return p + c;
      }, 0);
      expect(reportedLen).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART04_1200
     * @tc.name int32ArrayReducePart04Test012
     * @tc.desc Verify initialValue -0 (numerically equal to 0) sum
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart04Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(5);
      let r: number = arr.reduce((p: number, c: number, _i: int, _a: Int32Array): number => p + c, -0);
      expect(r).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART04_1300
     * @tc.name int32ArrayReducePart04Test013
     * @tc.desc Verify initialValue 1 (minimum positive) sum
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart04Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(2, 3);
      let r: number = arr.reduce((p: number, c: number, _i: int, _a: Int32Array): number => p + c, 1);
      expect(r).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART04_1400
     * @tc.name int32ArrayReducePart04Test014
     * @tc.desc Verify initialValue -1 sum
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart04Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(10, 20);
      let r: number = arr.reduce((p: number, c: number, _i: int, _a: Int32Array): number => p + c, -1);
      expect(r).assertEqual(29);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART04_1500
     * @tc.name int32ArrayReducePart04Test015
     * @tc.desc Verify initialValue INT_MAX + 1 returns JS number float (no overflow to negative)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart04Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1);
      let r: number = arr.reduce((p: number, c: number, _i: int, _a: Int32Array): number => p + c, 2147483647);
      expect(r).assertEqual(2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART04_1600
     * @tc.name int32ArrayReducePart04Test016
     * @tc.desc Verify initialValue INT_MIN + (-1) sum
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart04Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(-1);
      let r: number = arr.reduce((p: number, c: number, _i: int, _a: Int32Array): number => p + c, -2147483648);
      expect(r).assertEqual(-2147483649);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART04_1700
     * @tc.name int32ArrayReducePart04Test017
     * @tc.desc Verify initialValue 2 product
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart04Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(4, 6);
      let r: number = arr.reduce((p: number, c: number, _i: int, _a: Int32Array): number => p * c, 2);
      expect(r).assertEqual(48);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART04_1800
     * @tc.name int32ArrayReducePart04Test018
     * @tc.desc Verify initialValue NaN accumulates NaN result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart04Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2);
      let r: number = arr.reduce((p: number, c: number, _i: int, _a: Int32Array): number => p + c, Number.NaN);
      expect(isNaN(r)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART04_1900
     * @tc.name int32ArrayReducePart04Test019
     * @tc.desc Verify initialValue Infinity + positives stays Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart04Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      let r: number =
      arr.reduce((p: number, c: number, _i: int, _a: Int32Array): number => p + c, Number.POSITIVE_INFINITY);
      expect(isFinite(r)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART04_2000
     * @tc.name int32ArrayReducePart04Test020
     * @tc.desc Verify initialValue -Infinity sum
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart04Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(10, 20);
      let r: number =
      arr.reduce((p: number, c: number, _i: int, _a: Int32Array): number => p + c, Number.NEGATIVE_INFINITY);
      expect(isFinite(r)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART04_2100
     * @tc.name int32ArrayReducePart04Test021
     * @tc.desc Verify initialValue 3.5 decimal sum (float arithmetic, not ToInt32 truncated)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart04Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1);
      let r: number = arr.reduce((p: number, c: number, _i: int, _a: Int32Array): number => p + c, 3.5);
      expect(r).assertEqual(4.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART04_2200
     * @tc.name int32ArrayReducePart04Test022
     * @tc.desc Verify initialValue -2.7 decimal sum
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart04Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(3);
      let r: number = arr.reduce((p: number, c: number, _i: int, _a: Int32Array): number => p + c, -2.7);
      expect(r).assertEqual(0.2999999999999998);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART04_2300
     * @tc.name int32ArrayReducePart04Test023
     * @tc.desc Verify U=string, initialValue empty string, concatenate digits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart04Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      let r: string = arr.reduce((p: string, c: number, _i: int, _a: Int32Array): string => p + c.toString(), '');
      expect(r).assertEqual('123');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART04_2400
     * @tc.name int32ArrayReducePart04Test024
     * @tc.desc Verify U=string, initialValue non-empty prefix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart04Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(4, 5);
      let r: string =
      arr.reduce((p: string, c: number, _i: int, _a: Int32Array): string => p + '-' + c.toString(), 'prefix');
      expect(r).assertEqual('prefix-4-5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART04_2500
     * @tc.name int32ArrayReducePart04Test025
     * @tc.desc Verify empty array U=string returns initialValue string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart04Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(0);
      let r: string = arr.reduce((p: string, c: number, _i: int, _a: Int32Array): string => p + c.toString(), 'hello');
      expect(r).assertEqual('hello');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART04_2600
     * @tc.name int32ArrayReducePart04Test026
     * @tc.desc Verify U=string concatenate negatives (note - sign)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart04Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(-1, -2);
      let r: string = arr.reduce((p: string, c: number, _i: int, _a: Int32Array): string => p + c.toString(), '');
      expect(r).assertEqual('-1-2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART04_2700
     * @tc.name int32ArrayReducePart04Test027
     * @tc.desc Verify U=string concatenate int32 boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart04Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(2147483647, -2147483648);
      let r: string = arr.reduce((p: string, c: number, _i: int, _a: Int32Array): string => p + c.toString() + ',', '');
      expect(r).assertEqual('2147483647,-2147483648,');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART04_2800
     * @tc.name int32ArrayReducePart04Test028
     * @tc.desc Verify U=boolean, initialValue=true, every semantic (all positive); Also verify verify U=boolean, initialValue=false, some semantic (contains 0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart04Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      let r: boolean = arr.reduce((p: boolean, c: number, _i: int, _a: Int32Array): boolean => p && c > 0, true);
      expect(r).assertTrue();

      {
      let arr: Int32Array = Int32Array.of(1, 0, 3);
      let r: boolean = arr.reduce((p: boolean, c: number, _i: int, _a: Int32Array): boolean => p || c === 0, false);
      expect(r).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART04_2900
     * @tc.name int32ArrayReducePart04Test029
     * @tc.desc Verify U=boolean, initialValue=true, contains negative returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart04Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, -2, 3);
      let r: boolean = arr.reduce((p: boolean, c: number, _i: int, _a: Int32Array): boolean => p && c > 0, true);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART04_3000
     * @tc.name int32ArrayReducePart04Test030
     * @tc.desc Verify U=boolean, initialValue=false, no match stays false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart04Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      let r: boolean = arr.reduce((p: boolean, c: number, _i: int, _a: Int32Array): boolean => p || c === 99, false);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART04_3100
     * @tc.name int32ArrayReducePart04Test031
     * @tc.desc Verify empty array U=boolean returns initialValue true directly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart04Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(0);
      let r: boolean = arr.reduce((p: boolean, c: number, _i: int, _a: Int32Array): boolean => p && c > 0, true);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART04_3200
     * @tc.name int32ArrayReducePart04Test032
     * @tc.desc Verify U=boolean, initialValue=false short-circuit logic still iterates all (no early exit)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart04Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(-1, 2, 3);
      let count: int = 0;
      arr.reduce((p: boolean, c: number, _i: int, _a: Int32Array): boolean => {
        count = count + 1;
        return p && c > 0;
      }, false);
      expect(count).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART04_3300
     * @tc.name int32ArrayReducePart04Test033
     * @tc.desc Verify accumulator class instance sum
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart04Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(10, 20, 30);
      let init: AccR1 = new AccR1();
      let r: AccR1 = arr.reduce((p: AccR1, c: number, _i: int, _a: Int32Array): AccR1 => {
        p.sum = p.sum + c;
        return p;
      }, init);
      expect(r.sum).assertEqual(60);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART04_3400
     * @tc.name int32ArrayReducePart04Test034
     * @tc.desc Verify accumulator returns new instance (immutable style)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart04Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(5, 7);
      let init: Acc2R2 = new Acc2R2();
      let r: Acc2R2 = arr.reduce((p: Acc2R2, c: number, _i: int, _a: Int32Array): Acc2R2 => {
        let nxt: Acc2R2 = new Acc2R2();
        nxt.total = p.total + c;
        return nxt;
      }, init);
      expect(r.total).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART04_3500
     * @tc.name int32ArrayReducePart04Test035
     * @tc.desc Verify accumulator records maximum
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart04Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(3, 9, 2, 15, 7);
      let init: MaxAccR3 = new MaxAccR3();
      let r: MaxAccR3 = arr.reduce((p: MaxAccR3, c: number, _i: int, _a: Int32Array): MaxAccR3 => {
        if (c > p.max) {
          p.max = c;
        }
        return p;
      }, init);
      expect(r.max).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART04_3600
     * @tc.name int32ArrayReducePart04Test036
     * @tc.desc Verify accumulator records minimum
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart04Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(3, -9, 2, 15, 7);
      let init: MinAccR4 = new MinAccR4();
      let r: MinAccR4 = arr.reduce((p: MinAccR4, c: number, _i: int, _a: Int32Array): MinAccR4 => {
        if (c < p.min) {
          p.min = c;
        }
        return p;
      }, init);
      expect(r.min).assertEqual(-9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART04_3700
     * @tc.name int32ArrayReducePart04Test037
     * @tc.desc Verify accumulator records count of elements > 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart04Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(5, 12, 8, 20, 3, 15);
      let init: CntR5 = new CntR5();
      let r: CntR5 = arr.reduce((p: CntR5, c: number, _i: int, _a: Int32Array): CntR5 => {
        if (c > 10) {
          p.n = p.n + 1;
        }
        return p;
      }, init);
      expect(r.n).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART04_3800
     * @tc.name int32ArrayReducePart04Test038
     * @tc.desc Verify empty array returns initial accumulator object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart04Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(0);
      let init: Acc3R6 = new Acc3R6();
      let r: Acc3R6 = arr.reduce((p: Acc3R6, c: number, _i: int, _a: Int32Array): Acc3R6 => {
        p.val = p.val + c;
        return p;
      }, init);
      expect(r.val).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART04_3900
     * @tc.name int32ArrayReducePart04Test039
     * @tc.desc Verify accumulator returns same instance (reference equality)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart04Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2);
      let init: Acc4R7 = new Acc4R7();
      let r: Acc4R7 = arr.reduce((p: Acc4R7, c: number, _i: int, _a: Int32Array): Acc4R7 => {
        p.v = p.v + c;
        return p;
      }, init);
      expect(r).assertEqual(init);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART04_4000
     * @tc.name int32ArrayReducePart04Test040
     * @tc.desc Verify U=number product with 0 results in 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart04Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(5, 0, 7);
      let r: number = arr.reduce((p: number, c: number, _i: int, _a: Int32Array): number => p * c, 1);
      expect(r).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART04_4100
     * @tc.name int32ArrayReducePart04Test041
     * @tc.desc Verify U=number max (initialValue small outside array range); Also verify verify U=number min
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart04Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(3, 9, -2, 42, 7);
      let r: number = arr.reduce((p: number, c: number, _i: int, _a: Int32Array): number => c > p ? c : p, -2147483648);
      expect(r).assertEqual(42);

      {
      let arr: Int32Array = Int32Array.of(3, 9, -2, 42, 7);
      let r: number = arr.reduce((p: number, c: number, _i: int, _a: Int32Array): number => c < p ? c : p, 2147483647);
      expect(r).assertEqual(-2);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART04_4200
     * @tc.name int32ArrayReducePart04Test042
     * @tc.desc Verify U=number bitwise OR aggregation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart04Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 4, 8);
      let r: number = arr.reduce((p: number, c: number, _i: int, _a: Int32Array): number => p | c, 0);
      expect(r).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART04_4300
     * @tc.name int32ArrayReducePart04Test043
     * @tc.desc Verify U=number bitwise AND aggregation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart04Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(0xF, 0x7, 0x3);
      let r: number = arr.reduce((p: number, c: number, _i: int, _a: Int32Array): number => p & c, 0xF);
      expect(r).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART04_4400
     * @tc.name int32ArrayReducePart04Test044
     * @tc.desc Verify U=number sum of squares
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart04Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      let r: number = arr.reduce((p: number, c: number, _i: int, _a: Int32Array): number => p + c * c, 0);
      expect(r).assertEqual(14);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART04_4500
     * @tc.name int32ArrayReducePart04Test045
     * @tc.desc Verify U=number findIndex semantic (returns index of first negative, or -1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart04Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(3, 5, -2, 7);
      let r: number = arr.reduce((p: number, c: number, i: int, _a: Int32Array): number => {
        if (p === -1 && c < 0) {
          return i;
        }
        return p;
      }, -1);
      expect(r).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART04_4600
     * @tc.name int32ArrayReducePart04Test046
     * @tc.desc Verify array with INT_MAX + 1 sum exceeds int32 but returns as number (JS float)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart04Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(2147483647, 1);
      let r: number = arr.reduce((p: number, c: number, _i: int, _a: Int32Array): number => p + c, 0);
      expect(r).assertEqual(2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART04_4700
     * @tc.name int32ArrayReducePart04Test047
     * @tc.desc Verify array with INT_MIN + (-1) sum
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart04Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(-2147483648, -1);
      let r: number = arr.reduce((p: number, c: number, _i: int, _a: Int32Array): number => p + c, 0);
      expect(r).assertEqual(-2147483649);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART04_4800
     * @tc.name int32ArrayReducePart04Test048
     * @tc.desc Verify array with -1 (0xFFFFFFFF) accumulate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart04Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(-1, -1, -1);
      let r: number = arr.reduce((p: number, c: number, _i: int, _a: Int32Array): number => p + c, 10);
      expect(r).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART04_4900
     * @tc.name int32ArrayReducePart04Test049
     * @tc.desc Verify array with 0 does not change result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart04Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(0, 0, 5, 0);
      let r: number = arr.reduce((p: number, c: number, _i: int, _a: Int32Array): number => p + c, 0);
      expect(r).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART04_5000
     * @tc.name int32ArrayReducePart04Test050
     * @tc.desc Verify all-zero array accumulate still equals initialValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart04Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(0, 0, 0);
      let r: number = arr.reduce((p: number, c: number, _i: int, _a: Int32Array): number => p + c, 7);
      expect(r).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART04_5100
     * @tc.name int32ArrayReducePart04Test051
     * @tc.desc Verify positive-negative offset sum is 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart04Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(10, -5, -5);
      let r: number = arr.reduce((p: number, c: number, _i: int, _a: Int32Array): number => p + c, 0);
      expect(r).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART04_5200
     * @tc.name int32ArrayReducePart04Test052
     * @tc.desc Verify length=1, initialValue=0 returns element value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart04Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(99);
      let r: number = arr.reduce((p: number, c: number, _i: int, _a: Int32Array): number => p + c, 0);
      expect(r).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART04_5300
     * @tc.name int32ArrayReducePart04Test053
     * @tc.desc Verify length=2 basic sum
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart04Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(4, 6);
      let r: number = arr.reduce((p: number, c: number, _i: int, _a: Int32Array): number => p + c, 0);
      expect(r).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART04_5400
     * @tc.name int32ArrayReducePart04Test054
     * @tc.desc Verify longer array (16 elements) sum
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart04Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16);
      let r: number = arr.reduce((p: number, c: number, _i: int, _a: Int32Array): number => p + c, 0);
      expect(r).assertEqual(136);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART04_5500
     * @tc.name int32ArrayReducePart04Test055
     * @tc.desc Verify length=1 U=string concat initialValue and element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart04Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(42);
      let r: string = arr.reduce((p: string, c: number, _i: int, _a: Int32Array): string => p + c.toString(), 'v=');
      expect(r).assertEqual('v=42');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART04_5600
     * @tc.name int32ArrayReducePart04Test056
     * @tc.desc Verify callback first call throws, error transparently propagated
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart04Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      try {
        arr.reduce((p: number, c: number, _i: int, _a: Int32Array): number => {
          throw new Error('first throw');
        }, 0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART04_5700
     * @tc.name int32ArrayReducePart04Test057
     * @tc.desc Verify callback second call throws (first succeeds)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart04Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      let calls: int = 0;
      try {
        arr.reduce((p: number, c: number, _i: int, _a: Int32Array): number => {
          calls = calls + 1;
          if (calls === 2) {
            throw new Error('second');
          }
          return p + c;
        }, 0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART04_5800
     * @tc.name int32ArrayReducePart04Test058
     * @tc.desc Verify callback last call throws (partial accumulation already done)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart04Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3, 4, 5);
      let calls: int = 0;
      try {
        arr.reduce((p: number, c: number, _i: int, _a: Int32Array): number => {
          calls = calls + 1;
          if (calls === 5) {
            throw new Error('last');
          }
          return p + c;
        }, 0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART04_5900
     * @tc.name int32ArrayReducePart04Test059
     * @tc.desc Verify empty array with initialValue, callback that would throw never executes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart04Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(0);
      let called: boolean = false;
      let r: number = arr.reduce((p: number, c: number, _i: int, _a: Int32Array): number => {
        called = true;
        throw new Error('should not run');
      }, 0);
      expect(called).assertFalse();
      expect(r).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART04_6000
     * @tc.name int32ArrayReducePart04Test060
     * @tc.desc Verify return value type is number (U=number)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart04Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2);
      let r: number = arr.reduce((p: number, c: number, _i: int, _a: Int32Array): number => p + c, 0);
      expect(r).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART04_6100
     * @tc.name int32ArrayReducePart04Test061
     * @tc.desc Verify return value type is string (U=string)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart04Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1);
      let r: string = arr.reduce((p: string, c: number, _i: int, _a: Int32Array): string => p + c.toString(), '');
      expect(r).assertEqual('1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART04_6200
     * @tc.name int32ArrayReducePart04Test062
     * @tc.desc Verify return value type is boolean (U=boolean)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart04Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1);
      let r: boolean = arr.reduce((p: boolean, c: number, _i: int, _a: Int32Array): boolean => p && c > 0, true);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART04_6300
     * @tc.name int32ArrayReducePart04Test063
     * @tc.desc Verify original array not modified after reduce (pure aggregation no write)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart04Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      arr.reduce((p: number, c: number, _i: int, _a: Int32Array): number => p + c, 0);
      expect(arr.length).assertEqual(3);
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.$_get(1)).assertEqual(2);
      expect(arr.$_get(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART04_6400
     * @tc.name int32ArrayReducePart04Test064
     * @tc.desc Verify reduce no side effects, buffer underlying bytes unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart04Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(10, 20, 30);
      let buf: ArrayBuffer = arr.buffer;
      arr.reduce((p: number, c: number, _i: int, _a: Int32Array): number => p + c, 0);
      expect(arr.buffer).assertEqual(buf);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART04_6500
     * @tc.name int32ArrayReducePart04Test065
     * @tc.desc Verify chain call: reduce result as next reduce initialValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart04Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      let s1: number = arr.reduce((p: number, c: number, _i: int, _a: Int32Array): number => p + c, 0);
      let s2: number = arr.reduce((p: number, c: number, _i: int, _a: Int32Array): number => p + c, s1);
      expect(s2).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART04_6600
     * @tc.name int32ArrayReducePart04Test066
     * @tc.desc Verify subarray reduce correctly uses sub-view elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart04Test066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3, 4, 5);
      let sub: Int32Array = arr.subarray(1, 4);
      let r: number = sub.reduce((p: number, c: number, _i: int, _a: Int32Array): number => p + c, 0);
      expect(r).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART04_6700
     * @tc.name int32ArrayReducePart04Test067
     * @tc.desc Verify slice copy reduce correct (independent buffer)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart04Test067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(10, 20, 30);
      let cp: Int32Array = arr.slice();
      let r: number = cp.reduce((p: number, c: number, _i: int, _a: Int32Array): number => p + c, 0);
      expect(r).assertEqual(60);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART04_6800
     * @tc.name int32ArrayReducePart04Test068
     * @tc.desc Verify callback reads external let variable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart04Test068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      let factor: number = 10;
      let r: number = arr.reduce((p: number, c: number, _i: int, _a: Int32Array): number => p + c * factor, 0);
      expect(r).assertEqual(60);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART04_6900
     * @tc.name int32ArrayReducePart04Test069
     * @tc.desc Verify callback modifies external let variable side effect takes effect
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart04Test069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      let seen: int = 0;
      arr.reduce((p: number, c: number, _i: int, _a: Int32Array): number => {
        seen = seen + 1;
        return p + c;
      }, 0);
      expect(seen).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART04_7000
     * @tc.name int32ArrayReducePart04Test070
     * @tc.desc Verify callback $_set modifies visited element, subsequent currentValue not affected
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart04Test070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      let r: number = arr.reduce((p: number, c: number, i: int, a: Int32Array): number => {
        if (i === 0) {
          a.$_set(1, 99);
        }
        return p + c;
      }, 0);
      expect(r).assertEqual(103);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_PART04_7100
     * @tc.name int32ArrayReducePart04Test071
     * @tc.desc Verify callback $_set modifies unvisited element, subsequent currentValue reads new value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReducePart04Test071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      let seenVals: number[] = [];
      arr.reduce((p: number, c: number, i: int, a: Int32Array): number => {
        seenVals.push(c);
        if (i === 0) {
          a.$_set(2, 100);
        }
        return p + c;
      }, 0);
      expect(seenVals[0]).assertEqual(1);
      expect(seenVals[1]).assertEqual(2);
      expect(seenVals[2]).assertEqual(100);
    });
  });
}
