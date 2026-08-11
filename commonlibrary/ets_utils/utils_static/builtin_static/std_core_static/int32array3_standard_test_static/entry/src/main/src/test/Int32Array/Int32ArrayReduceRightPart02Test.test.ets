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
import Utils from '../Util.test';

export default function int32ArrayReduceRightPart02Test(): void {
  describe('Int32ArrayReduceRightPart02Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART02_TEST_MINDMAP_0100
     * @tc.name int32ArrayReduceRightPart02Test001
     * @tc.desc Verify callbackfn
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart02Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(10, 20);
      let sum: number = arr.reduceRight((prev: number, curr: number, idx: int, a: Int32Array): number => prev + curr);
      expect(sum).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART02_TEST_MINDMAP_0200
     * @tc.name int32ArrayReduceRightPart02Test002
     * @tc.desc Verify callbackfn length-1=2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart02Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      let calls: int = 0;
      arr.reduceRight((prev: number, curr: number, idx: int, a: Int32Array): number => {
        calls = calls + 1;
        return prev + curr;
      });
      expect(calls).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART02_TEST_MINDMAP_0300
     * @tc.name int32ArrayReduceRightPart02Test003
     * @tc.desc Verify callbackfn length-1=3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart02Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(10, 20, 30, 40);
      let calls: int = 0;
      arr.reduceRight((prev: number, curr: number, idx: int, a: Int32Array): number => {
        calls = calls + 1;
        return prev + curr;
      });
      expect(calls).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART02_TEST_MINDMAP_0400
     * @tc.name int32ArrayReduceRightPart02Test004
     * @tc.desc Verify reduceRight
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart02Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(42);
      let called: boolean = false;
      let r: number = arr.reduceRight((prev: number, curr: number, idx: int, a: Int32Array): number => {
        called = true;
        return prev + curr;
      });
      expect(called).assertFalse();
      expect(r).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART02_TEST_MINDMAP_0500
     * @tc.name int32ArrayReduceRightPart02Test005
     * @tc.desc Verify (identity)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart02Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(-7);
      let r: number = arr.reduceRight((prev: number, curr: number, idx: int, a: Int32Array): number => prev + curr);
      expect(r).assertEqual(-7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART02_TEST_MINDMAP_0600
     * @tc.name int32ArrayReduceRightPart02Test006
     * @tc.desc Verify previousValue 20; Also verify verify currentValue 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart02Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(10, 20);
      let firstPrev: number = 0;
      let seen: boolean = false;
      arr.reduceRight((prev: number, curr: number, idx: int, a: Int32Array): number => {
        if (!seen) {
          firstPrev = prev;
          seen = true;
        }
        return prev + curr;
      });
      expect(firstPrev).assertEqual(20);

      {
      let arr: Int32Array = Int32Array.of(10, 20);
      let firstCurr: number = 0;
      let seen: boolean = false;
      arr.reduceRight((prev: number, curr: number, idx: int, a: Int32Array): number => {
        if (!seen) {
          firstCurr = curr;
          seen = true;
        }
        return prev + curr;
      });
      expect(firstCurr).assertEqual(10);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART02_TEST_MINDMAP_0700
     * @tc.name int32ArrayReduceRightPart02Test007
     * @tc.desc Verify currentIndex length-2=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart02Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(10, 20);
      let firstIdx: int = -99;
      let seen: boolean = false;
      arr.reduceRight((prev: number, curr: number, idx: int, a: Int32Array): number => {
        if (!seen) {
          firstIdx = idx;
          seen = true;
        }
        return prev + curr;
      });
      expect(firstIdx).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART02_TEST_MINDMAP_0800
     * @tc.name int32ArrayReduceRightPart02Test008
     * @tc.desc Verify currentIndex length-2=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart02Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(10, 20, 30);
      let firstIdx: int = -99;
      let seen: boolean = false;
      arr.reduceRight((prev: number, curr: number, idx: int, a: Int32Array): number => {
        if (!seen) {
          firstIdx = idx;
          seen = true;
        }
        return prev + curr;
      });
      expect(firstIdx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART02_TEST_MINDMAP_0900
     * @tc.name int32ArrayReduceRightPart02Test009
     * @tc.desc Verify currentIndex 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart02Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(10, 20, 30);
      let lastIdx: int = -99;
      arr.reduceRight((prev: number, curr: number, idx: int, a: Int32Array): number => {
        lastIdx = idx;
        return prev + curr;
      });
      expect(lastIdx).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART02_TEST_MINDMAP_1000
     * @tc.name int32ArrayReduceRightPart02Test010
     * @tc.desc Verify prev/curr/idx
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart02Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(10, 20, 30);
      let log: string = '';
      arr.reduceRight((prev: number, curr: number, idx: int, a: Int32Array): number => {
        log = log + prev + ',' + curr + ',' + idx + ';';
        return prev + curr;
      });
      expect(log).assertEqual('30,20,1;50,10,0;');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART02_TEST_MINDMAP_1100
     * @tc.name int32ArrayReduceRightPart02Test011
     * @tc.desc Verify currentIndex 2,1,0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart02Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(10, 20, 30, 40);
      let idxs: string = '';
      arr.reduceRight((prev: number, curr: number, idx: int, a: Int32Array): number => {
        idxs = idxs + idx + ',';
        return prev + curr;
      });
      expect(idxs).assertEqual('2,1,0,');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART02_TEST_MINDMAP_1200
     * @tc.name int32ArrayReduceRightPart02Test012
     * @tc.desc Verify array Int32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart02Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      let same: boolean = false;
      arr.reduceRight((prev: number, curr: number, idx: int, a: Int32Array): number => {
        same = (a === arr);
        return prev + curr;
      });
      expect(same).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART02_TEST_MINDMAP_1300
     * @tc.name int32ArrayReduceRightPart02Test013
     * @tc.desc Verify array.length length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart02Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3, 4);
      let ok: boolean = true;
      arr.reduceRight((prev: number, curr: number, idx: int, a: Int32Array): number => {
        if (a.length !== 4) {
          ok = false;
        }
        return prev + curr;
      });
      expect(ok).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART02_TEST_MINDMAP_1400
     * @tc.name int32ArrayReduceRightPart02Test014
     * @tc.desc Verify array.$_get(idx) currentValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart02Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(5, 6, 7, 8);
      let match: boolean = true;
      arr.reduceRight((prev: number, curr: number, idx: int, a: Int32Array): number => {
        if (a.$_get(idx) !== curr) {
          match = false;
        }
        return prev + curr;
      });
      expect(match).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART02_TEST_MINDMAP_1500
     * @tc.name int32ArrayReduceRightPart02Test015
     * @tc.desc Verify 0 previousValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart02Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(5, 6, 7);
      let callN: int = 0;
      let secondPrev: number = -1;
      arr.reduceRight((prev: number, curr: number, idx: int, a: Int32Array): number => {
        callN = callN + 1;
        if (callN === 2) {
          secondPrev = prev;
        }
        return 0;
      });
      expect(secondPrev).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART02_TEST_MINDMAP_1600
     * @tc.name int32ArrayReduceRightPart02Test016
     * @tc.desc Verify -100 previousValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart02Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      let callN: int = 0;
      let secondPrev: number = 0;
      arr.reduceRight((prev: number, curr: number, idx: int, a: Int32Array): number => {
        callN = callN + 1;
        if (callN === 2) {
          secondPrev = prev;
        }
        return -100;
      });
      expect(secondPrev).assertEqual(-100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART02_TEST_MINDMAP_1700
     * @tc.name int32ArrayReduceRightPart02Test017
     * @tc.desc Verify INT_MAX, previousValue INT_MAX
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart02Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      let callN: int = 0;
      let secondPrev: number = 0;
      arr.reduceRight((prev: number, curr: number, idx: int, a: Int32Array): number => {
        callN = callN + 1;
        if (callN === 2) {
          secondPrev = prev;
        }
        return 2147483647;
      });
      expect(secondPrev).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART02_TEST_MINDMAP_1800
     * @tc.name int32ArrayReduceRightPart02Test018
     * @tc.desc Verify INT_MIN, previousValue INT_MIN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart02Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      let callN: int = 0;
      let secondPrev: number = 0;
      arr.reduceRight((prev: number, curr: number, idx: int, a: Int32Array): number => {
        callN = callN + 1;
        if (callN === 2) {
          secondPrev = prev;
        }
        return -2147483648;
      });
      expect(secondPrev).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART02_TEST_MINDMAP_1900
     * @tc.name int32ArrayReduceRightPart02Test019
     * @tc.desc Verify callback return 3.9 is passed to the next accumulator without truncation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart02Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      let callN: int = 0;
      let secondPrev: number = 99;
      arr.reduceRight((prev: number, curr: number, idx: int, a: Int32Array): number => {
        callN = callN + 1;
        if (callN === 2) {
          secondPrev = prev;
        }
        return 3.9 as number;
      });
      expect(secondPrev).assertEqual(3.9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART02_TEST_MINDMAP_2000
     * @tc.name int32ArrayReduceRightPart02Test020
     * @tc.desc Verify -0.9 ToInt32 0 next prev
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart02Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(0, 1);
      let r: number = arr.reduceRight((p: number, c: number): number => c / p, 1);
      expect(r).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART02_TEST_MINDMAP_2100
     * @tc.name int32ArrayReduceRightPart02Test021
     * @tc.desc Verify callback return NaN is passed to the next accumulator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart02Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      let callN: int = 0;
      let secondPrev: number = 99;
      arr.reduceRight((prev: number, curr: number, idx: int, a: Int32Array): number => {
        callN = callN + 1;
        if (callN === 2) {
          secondPrev = prev;
        }
        return Number.NaN;
      });
      expect(isNaN(secondPrev)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART02_TEST_MINDMAP_2200
     * @tc.name int32ArrayReduceRightPart02Test022
     * @tc.desc Verify callback return positive Infinity is passed to the next accumulator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart02Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      let callN: int = 0;
      let secondPrev: number = 99;
      arr.reduceRight((prev: number, curr: number, idx: int, a: Int32Array): number => {
        callN = callN + 1;
        if (callN === 2) {
          secondPrev = prev;
        }
        return Number.POSITIVE_INFINITY;
      });
      expect(secondPrev).assertEqual(Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART02_TEST_MINDMAP_2300
     * @tc.name int32ArrayReduceRightPart02Test023
     * @tc.desc Verify callback return negative Infinity is passed to the next accumulator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart02Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      let callN: int = 0;
      let secondPrev: number = 99;
      arr.reduceRight((prev: number, curr: number, idx: int, a: Int32Array): number => {
        callN = callN + 1;
        if (callN === 2) {
          secondPrev = prev;
        }
        return -Number.POSITIVE_INFINITY;
      });
      expect(secondPrev).assertEqual(Number.NEGATIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART02_TEST_MINDMAP_2400
     * @tc.name int32ArrayReduceRightPart02Test024
     * @tc.desc Verify callback return INT_MAX plus one is not converted to Int32
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart02Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      let callN: int = 0;
      let secondPrev: number = 0;
      arr.reduceRight((prev: number, curr: number, idx: int, a: Int32Array): number => {
        callN = callN + 1;
        if (callN === 2) {
          secondPrev = prev;
        }
        return 2147483648 as number;
      });
      expect(secondPrev).assertEqual(2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART02_TEST_MINDMAP_2500
     * @tc.name int32ArrayReduceRightPart02Test025
     * @tc.desc Verify callback return INT_MIN minus one is not converted to Int32
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart02Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      let callN: int = 0;
      let secondPrev: number = 0;
      arr.reduceRight((prev: number, curr: number, idx: int, a: Int32Array): number => {
        callN = callN + 1;
        if (callN === 2) {
          secondPrev = prev;
        }
        return -2147483649 as number;
      });
      expect(secondPrev).assertEqual(-2147483649);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART02_TEST_MINDMAP_2600
     * @tc.name int32ArrayReduceRightPart02Test026
     * @tc.desc Verify callback return 2 to the power of 32 is not converted to Int32
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart02Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      let callN: int = 0;
      let secondPrev: number = 99;
      arr.reduceRight((prev: number, curr: number, idx: int, a: Int32Array): number => {
        callN = callN + 1;
        if (callN === 2) {
          secondPrev = prev;
        }
        return 4294967296 as number;
      });
      expect(secondPrev).assertEqual(4294967296);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART02_TEST_MINDMAP_2700
     * @tc.name int32ArrayReduceRightPart02Test027
     * @tc.desc Verify callback return 2 to the power of 32 plus one is not converted to Int32
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart02Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      let callN: int = 0;
      let secondPrev: number = 0;
      arr.reduceRight((prev: number, curr: number, idx: int, a: Int32Array): number => {
        callN = callN + 1;
        if (callN === 2) {
          secondPrev = prev;
        }
        return 4294967297 as number;
      });
      expect(secondPrev).assertEqual(4294967297);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART02_TEST_MINDMAP_2800
     * @tc.name int32ArrayReduceRightPart02Test028
     * @tc.desc Verify callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart02Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(4, 5, 6);
      let r: number = arr.reduceRight((p, c, i, a) => p - c);
      expect(r).assertEqual(-3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART02_TEST_MINDMAP_2900
     * @tc.name int32ArrayReduceRightPart02Test029
     * @tc.desc Verify prev ( ); Also verify verify [0,0,0] 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart02Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(100, 200, 300);
      let r: number = arr.reduceRight((prev: number, curr: number, idx: int, a: Int32Array): number => prev);
      expect(r).assertEqual(300);

      {
      let arr: Int32Array = Int32Array.of(0, 0, 0);
      let r: number = arr.reduceRight((p: number, c: number, i: int, a: Int32Array): number => p + c);
      expect(r).assertEqual(0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART02_TEST_MINDMAP_3000
     * @tc.name int32ArrayReduceRightPart02Test030
     * @tc.desc Verify 7 7
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart02Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3, 4);
      let r: number = arr.reduceRight((prev: number, curr: number, idx: int, a: Int32Array): number => 7);
      expect(r).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART02_TEST_MINDMAP_3100
     * @tc.name int32ArrayReduceRightPart02Test031
     * @tc.desc Verify [7,7,7] 21
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart02Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(7, 7, 7);
      let r: number = arr.reduceRight((p: number, c: number, i: int, a: Int32Array): number => p + c);
      expect(r).assertEqual(21);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART02_TEST_MINDMAP_3200
     * @tc.name int32ArrayReduceRightPart02Test032
     * @tc.desc Verify [-5,-5,-5] -15
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart02Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(-5, -5, -5);
      let r: number = arr.reduceRight((p: number, c: number, i: int, a: Int32Array): number => p + c);
      expect(r).assertEqual(-15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART02_TEST_MINDMAP_3300
     * @tc.name int32ArrayReduceRightPart02Test033
     * @tc.desc Verify [1,-2,3,-4] (-4+3)+(-2)+1 = -2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart02Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, -2, 3, -4);
      let r: number = arr.reduceRight((p: number, c: number, i: int, a: Int32Array): number => p + c);
      expect(r).assertEqual(-2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART02_TEST_MINDMAP_3400
     * @tc.name int32ArrayReduceRightPart02Test034
     * @tc.desc Verify adding 1 and INT_MAX returns 2147483648 without Int32 overflow
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart02Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2147483647);
      let r: number = arr.reduceRight((p: number, c: number, i: int, a: Int32Array): number => p + c);
      expect(r).assertEqual(2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART02_TEST_MINDMAP_3500
     * @tc.name int32ArrayReduceRightPart02Test035
     * @tc.desc Verify adding negative 1 and INT_MIN returns -2147483649 without Int32 overflow
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart02Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(-1, -2147483648);
      let r: number = arr.reduceRight((p: number, c: number, i: int, a: Int32Array): number => p + c);
      expect(r).assertEqual(-2147483649);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART02_TEST_MINDMAP_3600
     * @tc.name int32ArrayReduceRightPart02Test036
     * @tc.desc Verify [1,-1] 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart02Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, -1);
      let r: number = arr.reduceRight((p: number, c: number, i: int, a: Int32Array): number => p + c);
      expect(r).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART02_TEST_MINDMAP_3700
     * @tc.name int32ArrayReduceRightPart02Test037
     * @tc.desc Verify 16 15
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart02Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16);
      let cnt: int = 0;
      arr.reduceRight((p: number, c: number, i: int, a: Int32Array): number => {
        cnt = cnt + 1;
        return p + c;
      });
      expect(cnt).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART02_TEST_MINDMAP_3800
     * @tc.name int32ArrayReduceRightPart02Test038
     * @tc.desc Verify 0 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart02Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(0);
      let r: number = arr.reduceRight((p: number, c: number, i: int, a: Int32Array): number => p + c);
      expect(r).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART02_TEST_MINDMAP_3900
     * @tc.name int32ArrayReduceRightPart02Test039
     * @tc.desc Verify INT_MIN INT_MIN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart02Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(-2147483648);
      let r: number = arr.reduceRight((p: number, c: number, i: int, a: Int32Array): number => p + c);
      expect(r).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART02_TEST_MINDMAP_4000
     * @tc.name int32ArrayReduceRightPart02Test040
     * @tc.desc Verify INT_MAX INT_MAX
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart02Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(2147483647);
      let r: number = arr.reduceRight((p: number, c: number, i: int, a: Int32Array): number => p + c);
      expect(r).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART02_TEST_MINDMAP_4100
     * @tc.name int32ArrayReduceRightPart02Test041
     * @tc.desc Verify [0,1,0,2] 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart02Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(0, 1, 0, 2);
      let r: number = arr.reduceRight((p: number, c: number, i: int, a: Int32Array): number => p + c);
      expect(r).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART02_TEST_MINDMAP_4200
     * @tc.name int32ArrayReduceRightPart02Test042
     * @tc.desc Verify subarray reduceRight
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart02Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(10, 20, 30, 40, 50);
      let sub: Int32Array = arr.subarray(1, 4);
      let r: number = sub.reduceRight((p: number, c: number, i: int, a: Int32Array): number => p + c);
      expect(r).assertEqual(90);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART02_TEST_MINDMAP_4300
     * @tc.name int32ArrayReduceRightPart02Test043
     * @tc.desc Verify ArrayBuffer reduceRight
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart02Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let arr: Int32Array = new Int32Array(buf);
      arr.$_set(0, 1);
      arr.$_set(1, 2);
      arr.$_set(2, 3);
      arr.$_set(3, 4);
      let r: number = arr.reduceRight((p: number, c: number, i: int, a: Int32Array): number => p + c);
      expect(r).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART02_TEST_MINDMAP_4400
     * @tc.name int32ArrayReduceRightPart02Test044
     * @tc.desc Verify byteOffset=4 reduceRight
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart02Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(20);
      let full: Int32Array = new Int32Array(buf);
      full.$_set(0, 99);
      full.$_set(1, 10);
      full.$_set(2, 20);
      full.$_set(3, 30);
      full.$_set(4, 88);
      let mid: Int32Array = new Int32Array(buf, 4, 3);
      let r: number = mid.reduceRight((p: number, c: number, i: int, a: Int32Array): number => p + c);
      expect(r).assertEqual(60);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART02_TEST_MINDMAP_4500
     * @tc.name int32ArrayReduceRightPart02Test045
     * @tc.desc Verify subarray length=2 index 0 ( )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart02Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(10, 20, 30, 40, 50);
      let sub: Int32Array = arr.subarray(2, 4);
      let idxs: string = '';
      sub.reduceRight((p: number, c: number, i: int, a: Int32Array): number => {
        idxs = idxs + i + ',';
        return p + c;
      });
      expect(idxs).assertEqual('0,');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART02_TEST_MINDMAP_4600
     * @tc.name int32ArrayReduceRightPart02Test046
     * @tc.desc Verify array.$_set , curr
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart02Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      let seen: number = 0;
      let callN: int = 0;
      arr.reduceRight((prev: number, curr: number, idx: int, a: Int32Array): number => {
        callN = callN + 1;
        if (callN === 1) {
          a.$_set(0, 99);
        } else {
          seen = curr;
        }
        return prev + curr;
      });
      expect(seen).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART02_TEST_MINDMAP_4700
     * @tc.name int32ArrayReduceRightPart02Test047
     * @tc.desc Verify [2,3,4] = 4*3*2 = 24; Also verify verify [5,1,3] max=5; Also verify verify [5,1,3] min=1; Also verify verify [100,10,1] = (1-10)-100 = -109
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart02Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(2, 3, 4);
      let r: number = arr.reduceRight((p: number, c: number, i: int, a: Int32Array): number => p * c);
      expect(r).assertEqual(24);

      {
      let arr: Int32Array = Int32Array.of(5, 1, 3);
      let r: number = arr.reduceRight((p: number, c: number, i: int, a: Int32Array): number => p > c ? p : c);
      expect(r).assertEqual(5);
      }

      {
      let arr: Int32Array = Int32Array.of(5, 1, 3);
      let r: number = arr.reduceRight((p: number, c: number, i: int, a: Int32Array): number => p < c ? p : c);
      expect(r).assertEqual(1);
      }

      {
      let arr: Int32Array = Int32Array.of(100, 10, 1);
      let r: number = arr.reduceRight((p: number, c: number, i: int, a: Int32Array): number => p - c);
      expect(r).assertEqual(-109);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART02_TEST_MINDMAP_4800
     * @tc.name int32ArrayReduceRightPart02Test048
     * @tc.desc Verify reduceRight sum returns 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart02Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2);
      let r: number = arr.reduceRight((p: number, c: number, i: int, a: Int32Array): number => p + c);
      expect(r).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART02_TEST_MINDMAP_4900
     * @tc.name int32ArrayReduceRightPart02Test049
     * @tc.desc Verify reduceRight
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart02Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      arr.reduceRight((p: number, c: number, i: int, a: Int32Array): number => p + c);
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.$_get(1)).assertEqual(2);
      expect(arr.$_get(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART02_TEST_MINDMAP_5000
     * @tc.name int32ArrayReduceRightPart02Test050
     * @tc.desc Verify reduceRight length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart02Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3, 4);
      arr.reduceRight((p: number, c: number, i: int, a: Int32Array): number => p + c);
      expect(arr.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART02_TEST_MINDMAP_5100
     * @tc.name int32ArrayReduceRightPart02Test051
     * @tc.desc Verify [1000,100,10,1] = ((1-10)-100)-1000 = -1109
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart02Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1000, 100, 10, 1);
      let r: number = arr.reduceRight((p: number, c: number, i: int, a: Int32Array): number => p - c);
      expect(r).assertEqual(-1109);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART02_TEST_MINDMAP_5200
     * @tc.name int32ArrayReduceRightPart02Test052
     * @tc.desc Verify 1 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart02Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 1, 1, 1);
      let r: number = arr.reduceRight((p: number, c: number, i: int, a: Int32Array): number => p + c);
      expect(r).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART02_TEST_MINDMAP_5300
     * @tc.name int32ArrayReduceRightPart02Test053
     * @tc.desc Verify (length=0) initialValue reduceRight TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart02Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(0);
      try {
        arr.reduceRight((p: number, c: number, i: int, a: Int32Array): number => p + c);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART02_TEST_MINDMAP_5400
     * @tc.name int32ArrayReduceRightPart02Test054
     * @tc.desc Verify subarray(begin>=end) reduceRight TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart02Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2);
      try {
        arr.reduceRight((p: number, c: number, i: int, a: Int32Array): number => {
          throw new TypeError('t');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART02_TEST_MINDMAP_5500
     * @tc.name int32ArrayReduceRightPart02Test055
     * @tc.desc Verify callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart02Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2);
      try {
        arr.reduceRight((p: number, c: number, i: int, a: Int32Array): number => {
          throw new Error('e');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART02_TEST_MINDMAP_5600
     * @tc.name int32ArrayReduceRightPart02Test056
     * @tc.desc Verify subarray (length=1)reduceRight
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart02Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(10, 20, 30);
      let sub: Int32Array = arr.subarray(1, 2);
      let called: boolean = false;
      let r: number = sub.reduceRight((p: number, c: number, i: int, a: Int32Array): number => {
        called = true;
        return p + c;
      });
      expect(called).assertFalse();
      expect(r).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART02_TEST_MINDMAP_5700
     * @tc.name int32ArrayReduceRightPart02Test057
     * @tc.desc Verify new Int32Array(length) reduceRight 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart02Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(3);
      let r: number = arr.reduceRight((p: number, c: number, i: int, a: Int32Array): number => p + c);
      expect(r).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART02_TEST_MINDMAP_5800
     * @tc.name int32ArrayReduceRightPart02Test058
     * @tc.desc Verify ( ) throw Error,
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart02Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2);
      try {
        arr.reduceRight((p: number, c: number, i: int, a: Int32Array): number => {
          throw new Error('first boom');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART02_TEST_MINDMAP_5900
     * @tc.name int32ArrayReduceRightPart02Test059
     * @tc.desc Verify ( ) , callCount=2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart02Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      let callCount: int = 0;
      try {
        arr.reduceRight((p: number, c: number, i: int, a: Int32Array): number => {
          callCount = callCount + 1;
          if (callCount === 2) {
            throw new Error('second boom');
          }
          return p + c;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      expect(callCount).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART02_TEST_MINDMAP_6000
     * @tc.name int32ArrayReduceRightPart02Test060
     * @tc.desc Verify ( ) , callCount=3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart02Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3, 4);
      let callCount: int = 0;
      try {
        arr.reduceRight((p: number, c: number, i: int, a: Int32Array): number => {
          callCount = callCount + 1;
          if (callCount === 3) {
            throw new Error('last boom');
          }
          return p + c;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      expect(callCount).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART02_TEST_MINDMAP_6100
     * @tc.name int32ArrayReduceRightPart02Test061
     * @tc.desc Verify RangeError e.name RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart02Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2);
      try {
        arr.reduceRight((p: number, c: number, i: int, a: Int32Array): number => {
          throw new RangeError('r');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART02_TEST_MINDMAP_6200
     * @tc.name int32ArrayReduceRightPart02Test062
     * @tc.desc Verify reduceRight ( return)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart02Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      let got: boolean = false;
      try {
        arr.reduceRight((p: number, c: number, i: int, a: Int32Array): number => {
          if (c === 1) {
            throw new Error('x');
          }
          return p + c;
        });
        got = true;
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      expect(got).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART02_TEST_MINDMAP_6300
     * @tc.name int32ArrayReduceRightPart02Test063
     * @tc.desc Verify 2147483647.9 ToInt32 2147483647 prev
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart02Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      let callN: int = 0;
      let secondPrev: number = 0;
      arr.reduceRight((prev: number, curr: number, idx: int, a: Int32Array): number => {
        callN = callN + 1;
        if (callN === 2) {
          secondPrev = prev;
        }
        return 2147483647.9 as number;
      });
      expect(secondPrev).assertEqual(2147483647.9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART02_TEST_MINDMAP_6400
     * @tc.name int32ArrayReduceRightPart02Test064
     * @tc.desc Verify [0, INT_MAX, 1] reduces right to the untruncated number 2147483648
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart02Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(0, 2147483647, 1);
      let r: number = arr.reduceRight((p: number, c: number, i: int, a: Int32Array): number => p + c);
      expect(r).assertEqual(2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART02_TEST_MINDMAP_6500
     * @tc.name int32ArrayReduceRightPart02Test065
     * @tc.desc Verify OR [1,2,4] OR = 7; Also verify verify XOR [1,2,3] XOR = 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart02Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 4);
      let r: number = arr.reduceRight((p: number, c: number, i: int, a: Int32Array): number => p | c);
      expect(r).assertEqual(7);

      {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      let r: number = arr.reduceRight((p: number, c: number, i: int, a: Int32Array): number => p ^ c);
      expect(r).assertEqual(0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART02_TEST_MINDMAP_6600
     * @tc.name int32ArrayReduceRightPart02Test066
     * @tc.desc Verify AND [0x7FFFFFFF, -16777216] AND = 0x7F000000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart02Test066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(0x7FFFFFFF as number, -16777216);
      let r: number = arr.reduceRight((p: number, c: number, i: int, a: Int32Array): number => p & c);
      expect(r).assertEqual(0x7F000000 as number);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART02_TEST_MINDMAP_6700
     * @tc.name int32ArrayReduceRightPart02Test067
     * @tc.desc Verify buffer , array[idx]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart02Test067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(12);
      let arr: Int32Array = new Int32Array(buf);
      arr.$_set(0, 11);
      arr.$_set(1, 22);
      arr.$_set(2, 33);
      let mirror: Int32Array = new Int32Array(buf);
      let ok: boolean = true;
      arr.reduceRight((p: number, c: number, i: int, a: Int32Array): number => {
        if (mirror.$_get(i) !== c) {
          ok = false;
        }
        return p + c;
      });
      expect(ok).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART02_TEST_MINDMAP_6800
     * @tc.name int32ArrayReduceRightPart02Test068
     * @tc.desc Verify buffer , curr
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart02Test068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(12);
      let arr: Int32Array = new Int32Array(buf);
      arr.$_set(0, 1);
      arr.$_set(1, 2);
      arr.$_set(2, 3);
      let writer: Int32Array = new Int32Array(buf);
      let observed: number = 0;
      let callN: int = 0;
      arr.reduceRight((p: number, c: number, i: int, a: Int32Array): number => {
        callN = callN + 1;
        if (callN === 1) {
          writer.$_set(0, 777);
        } else {
          observed = c;
        }
        return p + c;
      });
      expect(observed).assertEqual(777);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART02_TEST_MINDMAP_6900
     * @tc.name int32ArrayReduceRightPart02Test069
     * @tc.desc Verify reduceRight subarray , length a.length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart02Test069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3, 4);
      let ok: boolean = true;
      arr.reduceRight((p: number, c: number, i: int, a: Int32Array): number => {
        let s: Int32Array = a.subarray(0, a.length);
        if (s.length !== a.length) {
          ok = false;
        }
        return p + c;
      });
      expect(ok).assertTrue();
    });
  });
}
