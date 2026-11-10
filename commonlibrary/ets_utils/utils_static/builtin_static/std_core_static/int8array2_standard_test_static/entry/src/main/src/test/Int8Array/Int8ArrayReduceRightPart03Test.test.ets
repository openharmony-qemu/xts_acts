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
} from '@ohos/hypium-static/src/main/indexStatic';
import Utils from './../Util.test';

export default function int8ArrayReduceRightPart03Test(): void {
  describe('Int8ArrayReduceRightPart03Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART03_0100
     * @tc.name int8ArrayReduceRightPart03Test001
     * @tc.desc Verify reduceRight with arity 1 - only callback, no initialValue, accumulate from last element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart03Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4]);
      let result: number = arr.reduceRight((prev: number, curr: number, idx: int, a: Int8Array) => {
        return prev + curr;
      });
      expect(result).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART03_0200
     * @tc.name int8ArrayReduceRightPart03Test002
     * @tc.desc Verify reduceRight with arity 2 - callback + initialValue 100
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart03Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4]);
      let result: number = arr.reduceRight((prev: number, curr: number, idx: int, a: Int8Array) => {
        return prev + curr;
      }, 100);
      expect(result).assertEqual(110);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART03_0300
     * @tc.name int8ArrayReduceRightPart03Test003
     * @tc.desc Verify reduceRight no initial first previous equals last element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart03Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30, 40]);
      let firstPrev: number = 0;
      let called: boolean = false;
      let resultVal1: number = arr.reduceRight((prev: number, curr: number, idx: int, a: Int8Array) => {
        if (!called) {
          firstPrev = prev;
          called = true;
        }
        return prev + curr;
      });
      let expectedVal1: number = 100;
      expect(resultVal1).assertEqual(expectedVal1);
      expect(firstPrev).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART03_0400
     * @tc.name int8ArrayReduceRightPart03Test004
     * @tc.desc Verify reduceRight no initial first index length minus two
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart03Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30, 40]);
      let firstIdx: int = 0;
      let called: boolean = false;
      let resultVal1: number = arr.reduceRight((prev: number, curr: number, idx: int, a: Int8Array) => {
        if (!called) {
          firstIdx = idx;
          called = true;
        }
        return prev + curr;
      });
      let expectedVal1: number = 100;
      expect(resultVal1).assertEqual(expectedVal1);
      expect(firstIdx).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART03_0500
     * @tc.name int8ArrayReduceRightPart03Test005
     * @tc.desc Verify reduceRight with initial first previous equals nine ninety nine
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart03Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30, 40]);
      let firstPrev: number = 0;
      let called: boolean = false;
      let resultVal1: number = arr.reduceRight((prev: number, curr: number, idx: int, a: Int8Array) => {
        if (!called) {
          firstPrev = prev;
          called = true;
        }
        return prev + curr;
      }, 999);
      let expectedVal1: number = 1099;
      expect(resultVal1).assertEqual(expectedVal1);
      expect(firstPrev).assertEqual(999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART03_0600
     * @tc.name int8ArrayReduceRightPart03Test006
     * @tc.desc Verify reduceRight with initial first current equals last element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart03Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30, 40]);
      let firstCurr: number = 0;
      let called: boolean = false;
      let resultVal1: number = arr.reduceRight((prev: number, curr: number, idx: int, a: Int8Array) => {
        if (!called) {
          firstCurr = curr;
          called = true;
        }
        return prev + curr;
      }, 0);
      let expectedVal1: number = 100;
      expect(resultVal1).assertEqual(expectedVal1);
      expect(firstCurr).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART03_0700
     * @tc.name int8ArrayReduceRightPart03Test007
     * @tc.desc Verify reduceRight with initial first index length minus one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart03Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30, 40]);
      let firstIdx: int = 0;
      let called: boolean = false;
      let resultVal1: number = arr.reduceRight((prev: number, curr: number, idx: int, a: Int8Array) => {
        if (!called) {
          firstIdx = idx;
          called = true;
        }
        return prev + curr;
      }, 0);
      let expectedVal1: number = 100;
      expect(resultVal1).assertEqual(expectedVal1);
      expect(firstIdx).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART03_0800
     * @tc.name int8ArrayReduceRightPart03Test008
     * @tc.desc Verify reduceRight no initial last index zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart03Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30, 40]);
      let lastIdx: int = -1;
      let resultVal1: number = arr.reduceRight((prev: number, curr: number, idx: int, a: Int8Array) => {
        lastIdx = idx;
        return prev + curr;
      });
      let expectedVal1: number = 100;
      expect(resultVal1).assertEqual(expectedVal1);
      expect(lastIdx).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART03_0900
     * @tc.name int8ArrayReduceRightPart03Test009
     * @tc.desc Verify reduceRight with initial last index zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart03Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30, 40]);
      let lastIdx: int = -1;
      let resultVal1: number = arr.reduceRight((prev: number, curr: number, idx: int, a: Int8Array) => {
        lastIdx = idx;
        return prev + curr;
      }, 0);
      let expectedVal1: number = 100;
      expect(resultVal1).assertEqual(expectedVal1);
      expect(lastIdx).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART03_1000
     * @tc.name int8ArrayReduceRightPart03Test010
     * @tc.desc Verify reduceRight no initial call count length minus one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart03Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      let callCount: int = 0;
      let resultVal1: number = arr.reduceRight((prev: number, curr: number, idx: int, a: Int8Array) => {
        callCount = callCount + 1;
        return prev + curr;
      });
      let expectedVal1: number = 15;
      expect(resultVal1).assertEqual(expectedVal1);
      expect(callCount).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART03_1100
     * @tc.name int8ArrayReduceRightPart03Test011
     * @tc.desc Verify reduceRight with initial call count equals length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart03Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      let callCount: int = 0;
      let resultVal1: number = arr.reduceRight((prev: number, curr: number, idx: int, a: Int8Array) => {
        callCount = callCount + 1;
        return prev + curr;
      }, 0);
      let expectedVal1: number = 15;
      expect(resultVal1).assertEqual(expectedVal1);
      expect(callCount).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART03_1200
     * @tc.name int8ArrayReduceRightPart03Test012
     * @tc.desc Verify reduceRight with initial index sequence descends
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart03Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30, 40]);
      let indices: Array<int> = [];
      let resultVal1: number = arr.reduceRight((prev: number, curr: number, idx: int, a: Int8Array) => {
        indices.push(idx);
        return prev + curr;
      }, 0);
      let expectedVal1: number = 100;
      expect(resultVal1).assertEqual(expectedVal1);
      let actualLen: int = indices.length;
      let expectedLen: int = 4;
      expect(actualLen).assertEqual(expectedLen);
      let actualFirst: number = indices[0];
      let expectedFirst: int = 3;
      expect(actualFirst).assertEqual(expectedFirst);
      let actualLast: number = indices[3];
      let expectedLast: int = 0;
      expect(actualLast).assertEqual(expectedLast);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART03_1300
     * @tc.name int8ArrayReduceRightPart03Test013
     * @tc.desc Verify reduceRight no initial index sequence descends
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart03Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30, 40]);
      let indices: Array<int> = [];
      let resultVal1: number = arr.reduceRight((prev: number, curr: number, idx: int, a: Int8Array) => {
        indices.push(idx);
        return prev + curr;
      });
      let expectedVal1: number = 100;
      expect(resultVal1).assertEqual(expectedVal1);
      let actualLen: int = indices.length;
      let expectedLen: int = 3;
      expect(actualLen).assertEqual(expectedLen);
      let actualFirst: number = indices[0];
      let expectedFirst: int = 2;
      expect(actualFirst).assertEqual(expectedFirst);
      let actualLast: number = indices[2];
      let expectedLast: int = 0;
      expect(actualLast).assertEqual(expectedLast);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART03_1400
     * @tc.name int8ArrayReduceRightPart03Test014
     * @tc.desc Verify with initialValue, currentValue sequence right-to-left [40, 30, 20, 10]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart03Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30, 40]);
      let values: Array<number> = [];
      let resultVal1: number = arr.reduceRight((prev: number, curr: number, idx: int, a: Int8Array) => {
        values.push(curr);
        return prev + curr;
      }, 0);
      let expectedVal1: number = 100;
      expect(resultVal1).assertEqual(expectedVal1);
      let actualLen: int = values.length;
      let expectedLen: int = 4;
      expect(actualLen).assertEqual(expectedLen);
      let actualFirst: number = values[0];
      let expectedFirst: int = 40;
      expect(actualFirst).assertEqual(expectedFirst);
      let actualLast: number = values[3];
      let expectedLast: int = 10;
      expect(actualLast).assertEqual(expectedLast);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART03_1500
     * @tc.name int8ArrayReduceRightPart03Test015
     * @tc.desc Verify without initialValue, currentValue sequence right-to-left [30, 20, 10]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart03Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30, 40]);
      let values: Array<number> = [];
      let resultVal1: number = arr.reduceRight((prev: number, curr: number, idx: int, a: Int8Array) => {
        values.push(curr);
        return prev + curr;
      });
      let expectedVal1: number = 100;
      expect(resultVal1).assertEqual(expectedVal1);
      let actualLen: int = values.length;
      let expectedLen: int = 3;
      expect(actualLen).assertEqual(expectedLen);
      let actualFirst: number = values[0];
      let expectedFirst: int = 30;
      expect(actualFirst).assertEqual(expectedFirst);
      let actualLast: number = values[2];
      let expectedLast: int = 10;
      expect(actualLast).assertEqual(expectedLast);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART03_1600
     * @tc.name int8ArrayReduceRightPart03Test016
     * @tc.desc Verify reduceRight no initial array parameter same reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart03Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let sameRef: boolean = false;
      let resultVal1: number = arr.reduceRight((prev: number, curr: number, idx: int, a: Int8Array) => {
        if (a === arr) {
          sameRef = true;
        }
        return prev + curr;
      });
      let expectedVal1: number = 6;
      expect(resultVal1).assertEqual(expectedVal1);
      expect(sameRef).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART03_1700
     * @tc.name int8ArrayReduceRightPart03Test017
     * @tc.desc Verify reduceRight with initial array parameter same reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart03Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let sameRef: boolean = false;
      let resultVal1: number = arr.reduceRight((prev: number, curr: number, idx: int, a: Int8Array) => {
        if (a === arr) {
          sameRef = true;
        }
        return prev + curr;
      }, 0);
      let expectedVal1: number = 6;
      expect(resultVal1).assertEqual(expectedVal1);
      expect(sameRef).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART03_1800
     * @tc.name int8ArrayReduceRightPart03Test018
     * @tc.desc Verify reduceRight no initial previous chain three five
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart03Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let prevChain: Array<number> = [];
      let resultVal1: number = arr.reduceRight((prev: number, curr: number, idx: int, a: Int8Array) => {
        prevChain.push(prev);
        return prev + curr;
      });
      let expectedVal1: number = 6;
      expect(resultVal1).assertEqual(expectedVal1);
      let actualLen: int = prevChain.length;
      let expectedLen: int = 2;
      expect(actualLen).assertEqual(expectedLen);
      let actualFirst: number = prevChain[0];
      let expectedFirst: int = 3;
      expect(actualFirst).assertEqual(expectedFirst);
      let actualSecond: number = prevChain[1];
      let expectedSecond: int = 5;
      expect(actualSecond).assertEqual(expectedSecond);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART03_1900
     * @tc.name int8ArrayReduceRightPart03Test019
     * @tc.desc Verify reduceRight with initial previous chain one hundred
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart03Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let prevChain: Array<number> = [];
      let resultVal1: number = arr.reduceRight((prev: number, curr: number, idx: int, a: Int8Array) => {
        prevChain.push(prev);
        return prev + curr;
      }, 100);
      let expectedVal1: number = 106;
      expect(resultVal1).assertEqual(expectedVal1);
      let actualLen: int = prevChain.length;
      let expectedLen: int = 3;
      expect(actualLen).assertEqual(expectedLen);
      let actualFirst: number = prevChain[0];
      let expectedFirst: int = 100;
      expect(actualFirst).assertEqual(expectedFirst);
      let actualSecond: number = prevChain[1];
      let expectedSecond: int = 103;
      expect(actualSecond).assertEqual(expectedSecond);
      let actualThird: number = prevChain[2];
      let expectedThird: int = 105;
      expect(actualThird).assertEqual(expectedThird);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART03_2000
     * @tc.name int8ArrayReduceRightPart03Test020
     * @tc.desc Verify reduceRight no initial sum one two three four five
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart03Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      let result: number = arr.reduceRight((prev: number, curr: number, idx: int, a: Int8Array) => {
        return prev + curr;
      });
      expect(result).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART03_2100
     * @tc.name int8ArrayReduceRightPart03Test021
     * @tc.desc Verify reduceRight with initial one hundred sums one hundred fifteen
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart03Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      let result: number = arr.reduceRight((prev: number, curr: number, idx: int, a: Int8Array) => {
        return prev + curr;
      }, 100);
      expect(result).assertEqual(115);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART03_2200
     * @tc.name int8ArrayReduceRightPart03Test022
     * @tc.desc Verify reduceRight no initial max returns nine
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart03Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([3, 7, 2, 9, 4]);
      let result: number = arr.reduceRight((prev: number, curr: number, idx: int, a: Int8Array) => {
        return prev > curr ? prev : curr;
      });
      expect(result).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART03_2300
     * @tc.name int8ArrayReduceRightPart03Test023
     * @tc.desc Verify reduceRight no initial min returns two
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart03Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([3, 7, 2, 9, 4]);
      let result: number = arr.reduceRight((prev: number, curr: number, idx: int, a: Int8Array) => {
        return prev < curr ? prev : curr;
      });
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART03_2400
     * @tc.name int8ArrayReduceRightPart03Test024
     * @tc.desc Verify reduceRight constant zero return overrides initial
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart03Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4]);
      let result: number = arr.reduceRight((prev: number, curr: number, idx: int, a: Int8Array) => {
        return 0;
      }, 100);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART03_2500
     * @tc.name int8ArrayReduceRightPart03Test025
     * @tc.desc Verify reduceRight callback always returns int8 min value -128, result=-128
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart03Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let result: number = arr.reduceRight((prev: number, curr: number, idx: int, a: Int8Array) => {
        return -128;
      }, 0);
      expect(result).assertEqual(INT8_MIN);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART03_2600
     * @tc.name int8ArrayReduceRightPart03Test026
     * @tc.desc Verify reduceRight callback always returns int8 max value 127, result=127
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart03Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let result: number = arr.reduceRight((prev: number, curr: number, idx: int, a: Int8Array) => {
        return 127;
      }, 0);
      expect(result).assertEqual(INT8_MAX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART03_2700
     * @tc.name int8ArrayReduceRightPart03Test027
     * @tc.desc Verify reduceRight callback NaN propagates chain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart03Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let result: number = arr.reduceRight((prev: number, curr: number, idx: int, a: Int8Array) => {
        return Number.NaN;
      }, 0);
      let nanCheck: boolean = result !== result;
      expect(nanCheck).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART03_2800
     * @tc.name int8ArrayReduceRightPart03Test028
     * @tc.desc Verify reduceRight callback positive infinity propagates chain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart03Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let result: number = arr.reduceRight((prev: number, curr: number, idx: int, a: Int8Array) => {
        return Number.POSITIVE_INFINITY;
      }, 0);
      expect(result).assertEqual(Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART03_2900
     * @tc.name int8ArrayReduceRightPart03Test029
     * @tc.desc Verify reduceRight callback negative infinity propagates chain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart03Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let result: number = arr.reduceRight((prev: number, curr: number, idx: int, a: Int8Array) => {
        return Number.NEGATIVE_INFINITY;
      }, 0);
      expect(result).assertEqual(Number.NEGATIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART03_3000
     * @tc.name int8ArrayReduceRightPart03Test030
     * @tc.desc Verify reduceRight callback adds float half keeps precision
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart03Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1]);
      let result: number = arr.reduceRight((prev: number, curr: number, idx: int, a: Int8Array) => {
        return prev + 0.5;
      }, 0);
      expect(result).assertEqual(0.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART03_3100
     * @tc.name int8ArrayReduceRightPart03Test031
     * @tc.desc Verify reduceRight callback subtracts float half keeps precision
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart03Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1]);
      let result: number = arr.reduceRight((prev: number, curr: number, idx: int, a: Int8Array) => {
        return prev - 0.5;
      }, 0);
      expect(result).assertEqual(-0.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART03_3200
     * @tc.name int8ArrayReduceRightPart03Test032
     * @tc.desc Verify reduceRight callback uses all four parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart03Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30]);
      let result: number = arr.reduceRight((prev: number, curr: number, idx: int, a: Int8Array) => {
        return prev + curr + idx + a.length;
      }, 0);
      expect(result).assertEqual(72);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART03_3300
     * @tc.name int8ArrayReduceRightPart03Test033
     * @tc.desc Verify reduceRight subtraction with zero initial negative ten
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart03Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4]);
      let result: number = arr.reduceRight((prev: number, curr: number, idx: int, a: Int8Array) => {
        return prev - curr;
      }, 0);
      expect(result).assertEqual(-10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART03_3400
     * @tc.name int8ArrayReduceRightPart03Test034
     * @tc.desc Verify reduceRight callback reads external closure variable multiplier=10, result=60
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart03Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let multiplier: number = 10;
      let result: number = arr.reduceRight((prev: number, curr: number, idx: int, a: Int8Array) => {
        return prev + curr * multiplier;
      }, 0);
      expect(result).assertEqual(60);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART03_3500
     * @tc.name int8ArrayReduceRightPart03Test035
     * @tc.desc Verify reduceRight callback writes external sum
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart03Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4]);
      let externalSum: number = 0;
      let resultVal1: number = arr.reduceRight((prev: number, curr: number, idx: int, a: Int8Array) => {
        externalSum = externalSum + curr;
        return prev + curr;
      }, 0);
      let expectedVal1: number = 10;
      expect(resultVal1).assertEqual(expectedVal1);
      expect(externalSum).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART03_3600
     * @tc.name int8ArrayReduceRightPart03Test036
     * @tc.desc Verify nested reduceRight call, inner result as outer initialValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart03Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let outer: Int8Array = new Int8Array([1, 2]);
      let inner: Int8Array = new Int8Array([10, 20]);
      let innerSum: number = inner.reduceRight((p: number, c: number, i: int, ar: Int8Array) => {
        return p + c;
      }, 0);
      let result: number = outer.reduceRight((prev: number, curr: number, idx: int, a: Int8Array) => {
        return prev + curr;
      }, innerSum);
      expect(innerSum).assertEqual(30);
      expect(result).assertEqual(33);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART03_3700
     * @tc.name int8ArrayReduceRightPart03Test037
     * @tc.desc Verify reduceRight callback reads elements via array bracket access, array is original and readable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart03Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30, 40]);
      let result: number = arr.reduceRight((prev: number, curr: number, idx: int, a: Int8Array) => {
        return prev + a[idx];
      }, 0);
      expect(result).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART03_3800
     * @tc.name int8ArrayReduceRightPart03Test038
     * @tc.desc Verify reduceRight initialValue=0, result=30
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart03Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([5, 10, 15]);
      let result: number = arr.reduceRight((prev: number, curr: number, idx: int, a: Int8Array) => {
        return prev + curr;
      }, 0);
      expect(result).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART03_3900
     * @tc.name int8ArrayReduceRightPart03Test039
     * @tc.desc Verify reduceRight initialValue=-128 (int8 min), result=-122
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart03Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let result: number = arr.reduceRight((prev: number, curr: number, idx: int, a: Int8Array) => {
        return prev + curr;
      }, -128);
      expect(result).assertEqual(-122);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART03_4000
     * @tc.name int8ArrayReduceRightPart03Test040
     * @tc.desc Verify reduceRight initialValue=127 (int8 max), result=133
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart03Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let result: number = arr.reduceRight((prev: number, curr: number, idx: int, a: Int8Array) => {
        return prev + curr;
      }, 127);
      expect(result).assertEqual(133);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART03_4100
     * @tc.name int8ArrayReduceRightPart03Test041
     * @tc.desc Verify reduceRight initial 128 not truncated
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart03Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1]);
      let result: number = arr.reduceRight((prev: number, curr: number, idx: int, a: Int8Array) => {
        return prev + curr;
      }, 128);
      expect(result).assertEqual(129);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART03_4200
     * @tc.name int8ArrayReduceRightPart03Test042
     * @tc.desc Verify reduceRight initial -129 not truncated
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart03Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1]);
      let result: number = arr.reduceRight((prev: number, curr: number, idx: int, a: Int8Array) => {
        return prev + curr;
      }, -129);
      expect(result).assertEqual(INT8_MIN);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART03_4300
     * @tc.name int8ArrayReduceRightPart03Test043
     * @tc.desc Verify reduceRight initial 255 not truncated
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart03Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1]);
      let result: number = arr.reduceRight((prev: number, curr: number, idx: int, a: Int8Array) => {
        return prev + curr;
      }, 255);
      expect(result).assertEqual(256);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART03_4400
     * @tc.name int8ArrayReduceRightPart03Test044
     * @tc.desc Verify reduceRight NaN initial propagates chain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart03Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let result: number = arr.reduceRight((prev: number, curr: number, idx: int, a: Int8Array) => {
        return prev + curr;
      }, Number.NaN);
      let nanCheck: boolean = result !== result;
      expect(nanCheck).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART03_4500
     * @tc.name int8ArrayReduceRightPart03Test045
     * @tc.desc Verify reduceRight positive infinity initial propagates chain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart03Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let result: number = arr.reduceRight((prev: number, curr: number, idx: int, a: Int8Array) => {
        return prev + curr;
      }, Number.POSITIVE_INFINITY);
      expect(result).assertEqual(Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART03_4600
     * @tc.name int8ArrayReduceRightPart03Test046
     * @tc.desc Verify reduceRight negative infinity initial propagates chain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart03Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let result: number = arr.reduceRight((prev: number, curr: number, idx: int, a: Int8Array) => {
        return prev + curr;
      }, Number.NEGATIVE_INFINITY);
      expect(result).assertEqual(Number.NEGATIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART03_4700
     * @tc.name int8ArrayReduceRightPart03Test047
     * @tc.desc Verify reduceRight float initial 1.5 sums 2.5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart03Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1]);
      let result: number = arr.reduceRight((prev: number, curr: number, idx: int, a: Int8Array) => {
        return prev + curr;
      }, 1.5);
      expect(result).assertEqual(2.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART03_4800
     * @tc.name int8ArrayReduceRightPart03Test048
     * @tc.desc Verify reduceRight negative float initial keeps precision
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart03Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1]);
      let result: number = arr.reduceRight((prev: number, curr: number, idx: int, a: Int8Array) => {
        return prev + curr;
      }, -1.5);
      expect(result).assertEqual(-0.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART03_4900
     * @tc.name int8ArrayReduceRightPart03Test049
     * @tc.desc Verify reduceRight empty array returns initial forty two
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart03Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([]);
      let callCount: int = 0;
      let result: number = arr.reduceRight((prev: number, curr: number, idx: int, a: Int8Array) => {
        callCount = callCount + 1;
        return prev + curr;
      }, 42);
      expect(callCount).assertEqual(0);
      expect(result).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART03_5000
     * @tc.name int8ArrayReduceRightPart03Test050
     * @tc.desc Verify reduceRight single element with initial sums one hundred seven
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart03Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([7]);
      let callCount: int = 0;
      let result: number = arr.reduceRight((prev: number, curr: number, idx: int, a: Int8Array) => {
        callCount = callCount + 1;
        return prev + curr;
      }, 100);
      expect(callCount).assertEqual(1);
      expect(result).assertEqual(107);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART03_5100
     * @tc.name int8ArrayReduceRightPart03Test051
     * @tc.desc Verify reduceRight initial one hundred with negatives sums forty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart03Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([-10, -20, -30]);
      let result: number = arr.reduceRight((prev: number, curr: number, idx: int, a: Int8Array) => {
        return prev + curr;
      }, 100);
      expect(result).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART03_5200
     * @tc.name int8ArrayReduceRightPart03Test052
     * @tc.desc Verify reduceRight initial fifty mixed signs sums sixty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart03Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([-5, 10, -15, 20]);
      let result: number = arr.reduceRight((prev: number, curr: number, idx: int, a: Int8Array) => {
        return prev + curr;
      }, 50);
      expect(result).assertEqual(60);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART03_5300
     * @tc.name int8ArrayReduceRightPart03Test053
     * @tc.desc Verify reduceRight result adds to further math
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart03Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let result: number = arr.reduceRight((prev: number, curr: number, idx: int, a: Int8Array) => {
        return prev + curr;
      });
      let combined: number = result + 1;
      expect(combined).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART03_5400
     * @tc.name int8ArrayReduceRightPart03Test054
     * @tc.desc Verify reduceRight result multiplies in further math
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart03Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let result: number = arr.reduceRight((prev: number, curr: number, idx: int, a: Int8Array) => {
        return prev + curr;
      }, 10);
      let combined: number = result * 2;
      expect(combined).assertEqual(32);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART03_5500
     * @tc.name int8ArrayReduceRightPart03Test055
     * @tc.desc Verify reduceRight all negative sums negative six
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart03Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([-1, -2, -3]);
      let result: number = arr.reduceRight((prev: number, curr: number, idx: int, a: Int8Array) => {
        return prev + curr;
      });
      expect(result).assertEqual(-6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART03_5600
     * @tc.name int8ArrayReduceRightPart03Test056
     * @tc.desc Verify reduceRight no initial keeps elements unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart03Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4]);
      let snap0: number = arr[0];
      let snap1: number = arr[1];
      let snap2: number = arr[2];
      let snap3: number = arr[3];
      let resultVal1: number = arr.reduceRight((prev: number, curr: number, idx: int, a: Int8Array) => {
        return prev + curr;
      });
      let expectedVal1: number = 10;
      expect(resultVal1).assertEqual(expectedVal1);
      let actual0: number = arr[0];
      let expected0: number = snap0;
      expect(actual0).assertEqual(expected0);
      let actual1: number = arr[1];
      let expected1: number = snap1;
      expect(actual1).assertEqual(expected1);
      let actual2: number = arr[2];
      let expected2: number = snap2;
      expect(actual2).assertEqual(expected2);
      let actual3: number = arr[3];
      let expected3: number = snap3;
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART03_5700
     * @tc.name int8ArrayReduceRightPart03Test057
     * @tc.desc Verify reduceRight with initial keeps elements unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart03Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4]);
      let resultVal1: number = arr.reduceRight((prev: number, curr: number, idx: int, a: Int8Array) => {
        return prev + curr;
      }, 100);
      let expectedVal1: number = 110;
      expect(resultVal1).assertEqual(expectedVal1);
      let actualLen: int = arr.length;
      let expectedLen: int = 4;
      expect(actualLen).assertEqual(expectedLen);
      let actualFirst: number = arr[0];
      let expectedFirst: int = 1;
      expect(actualFirst).assertEqual(expectedFirst);
      let actualLast: number = arr[3];
      let expectedLast: int = 4;
      expect(actualLast).assertEqual(expectedLast);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART03_5800
     * @tc.name int8ArrayReduceRightPart03Test058
     * @tc.desc Verify reduceRight return value can be stored and reused multiple times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart03Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let result: number = arr.reduceRight((prev: number, curr: number, idx: int, a: Int8Array) => {
        return prev + curr;
      }, 0);
      let doubled: number = result * 2;
      let tripled: number = result * 3;
      expect(doubled).assertEqual(12);
      expect(tripled).assertEqual(18);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART03_5900
     * @tc.name int8ArrayReduceRightPart03Test059
     * @tc.desc Verify reduceRight initial one product same elements six twenty five
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart03Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([5, 5, 5, 5]);
      let result: number = arr.reduceRight((prev: number, curr: number, idx: int, a: Int8Array) => {
        return prev * curr;
      }, 1);
      expect(result).assertEqual(625);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART03_6000
     * @tc.name int8ArrayReduceRightPart03Test060
     * @tc.desc Verify reduceRight boundary elements sum negative one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart03Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([INT8_MIN, INT8_MAX]);
      let result: number = arr.reduceRight((prev: number, curr: number, idx: int, a: Int8Array) => {
        return prev + curr;
      });
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART03_6100
     * @tc.name int8ArrayReduceRightPart03Test061
     * @tc.desc Verify reduceRight initial one boundary elements sum zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart03Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([INT8_MIN, INT8_MAX]);
      let result: number = arr.reduceRight((prev: number, curr: number, idx: int, a: Int8Array) => {
        return prev + curr;
      }, 1);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART03_6200
     * @tc.name int8ArrayReduceRightPart03Test062
     * @tc.desc Verify reduceRight identity callback returns initial
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart03Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4]);
      let result: number = arr.reduceRight((prev: number, curr: number, idx: int, a: Int8Array) => {
        return prev;
      }, 42);
      expect(result).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART03_6300
     * @tc.name int8ArrayReduceRightPart03Test063
     * @tc.desc Verify reduceRight current callback with initial ends first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart03Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30, 40]);
      let result: number = arr.reduceRight((prev: number, curr: number, idx: int, a: Int8Array) => {
        return curr;
      }, 0);
      expect(result).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART03_6400
     * @tc.name int8ArrayReduceRightPart03Test064
     * @tc.desc Verify reduceRight current callback no initial ends first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart03Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30, 40]);
      let result: number = arr.reduceRight((prev: number, curr: number, idx: int, a: Int8Array) => {
        return curr;
      });
      expect(result).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART03_6500
     * @tc.name int8ArrayReduceRightPart03Test065
     * @tc.desc Verify reduceRight subtraction from last element leftwards
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart03Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4]);
      let result: number = arr.reduceRight((prev: number, curr: number, idx: int, a: Int8Array) => {
        return prev - curr;
      });
      expect(result).assertEqual(-2);
    });
  });
}
