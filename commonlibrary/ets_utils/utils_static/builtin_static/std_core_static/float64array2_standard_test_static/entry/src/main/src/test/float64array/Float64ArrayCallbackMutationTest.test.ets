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
  TestType
} from '../../../../hypium/index';
import Utils from './../Util.test';

export default function Float64ArrayCallbackMutationTest(): void {
  describe('Float64ArrayCallbackMutationTest', (): void => {
    beforeAll((): void => {
    })

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    })

    afterEach((): void => {
    })

    afterAll((): void => {
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CALLBACK_MUTATION_0100
     * @tc.name testFloat64ArrayCallbackMutation001
     * @tc.desc Verify map callback mutation is observed by a later callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCallbackMutation001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(Number.MIN_VALUE, -0.0, Number.MAX_VALUE);
      const mapped: Float64Array = arr.map((v: number, index: int): number => {
        if (index === 0) {
          arr.$_set(1, 20.0);
        }
        return v;
      });
      const actualElement1 = mapped.$_get(1);
      const expectedElement1: number = 20.0;
      expect(actualElement1).assertEqual(expectedElement1);
      const actualElement1Second = arr.$_get(1);
      const expectedElement1Second: number = 20.0;
      expect(actualElement1Second).assertEqual(expectedElement1Second);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CALLBACK_MUTATION_0200
     * @tc.name testFloat64ArrayCallbackMutation002
     * @tc.desc Verify map keeps a processed result while the source is later mutated
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCallbackMutation002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(Number.MIN_VALUE, -Infinity, Number.MAX_VALUE);
      const mapped: Float64Array = arr.map((v: number, index: int): number => {
        if (index === 1) {
          arr.$_set(0, 99.0);
        }
        return v;
      });
      const actualElement0 = mapped.$_get(0);
      const expectedElement0: number = Number.MIN_VALUE;
      expect(actualElement0).assertEqual(expectedElement0);
      const actualElement0Second = arr.$_get(0);
      const expectedElement0Second: number = 99.0;
      expect(actualElement0Second).assertEqual(expectedElement0Second);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CALLBACK_MUTATION_0300
     * @tc.name testFloat64ArrayCallbackMutation003
     * @tc.desc Verify filter predicate reads a value written to an unread slot
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCallbackMutation003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(NaN, -Infinity, Number.MIN_VALUE, -0.0);
      const filtered: Float64Array = arr.filter((v: number, index: int): boolean => {
        if (index === 0) {
          arr.$_set(3, 10.0);
        }
        return v > 5.0;
      });
      const actualLength = filtered.length;
      const expectedLength: int = 1;
      expect(actualLength).assertEqual(expectedLength);
      const actualElement0 = filtered.$_get(0);
      const expectedElement0: number = 10.0;
      expect(actualElement0).assertEqual(expectedElement0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CALLBACK_MUTATION_0400
     * @tc.name testFloat64ArrayCallbackMutation004
     * @tc.desc Verify filter result mutation does not change its source array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCallbackMutation004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(-8.0, 16.0, 32.0);
      const filtered: Float64Array = arr.filter((v: number): boolean => v > 0.0);
      filtered.$_set(0, 99.0);
      const actualElement0 = filtered.$_get(0);
      const expectedElement0: number = 99.0;
      expect(actualElement0).assertEqual(expectedElement0);
      const actualElement1 = arr.$_get(1);
      const expectedElement1: number = 16.0;
      expect(actualElement1).assertEqual(expectedElement1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CALLBACK_MUTATION_0500
     * @tc.name testFloat64ArrayCallbackMutation005
     * @tc.desc Verify forEach observes a future value written during iteration
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCallbackMutation005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(Number.MIN_VALUE, 2.5, 30.0);
      let sum: number = 0.0;
      arr.forEach((v: number, index: int): void => {
        sum += v;
        if (index === 0) {
          arr.$_set(2, 30.0);
        }
      });
      const actualResult = sum;
      const expectedResult: number = 32.5;
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CALLBACK_MUTATION_0600
     * @tc.name testFloat64ArrayCallbackMutation006
     * @tc.desc Verify forEach final source state keeps a write to a visited slot
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCallbackMutation006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(Number.MIN_VALUE, -0.0, Number.MAX_VALUE);
      let sum: number = 0.0;
      arr.forEach((v: number, index: int): void => {
        sum += v;
        if (index === 1) {
          arr.$_set(0, 100.0);
        }
      });
      const actualResult = sum;
      const expectedResult: number = Number.MAX_VALUE;
      expect(actualResult).assertEqual(expectedResult);
      const actualElement0 = arr.$_get(0);
      const expectedElement0: number = 100.0;
      expect(actualElement0).assertEqual(expectedElement0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CALLBACK_MUTATION_0700
     * @tc.name testFloat64ArrayCallbackMutation007
     * @tc.desc Verify find returns a value written to an unread slot
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCallbackMutation007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(NaN, -Infinity, Number.MIN_VALUE, -0.0);
      const found: number | undefined = arr.find((v: number, index: int): boolean => {
        if (index === 0) {
          arr.$_set(3, 30.0);
        }
        return v === 30.0;
      });
      const actualResult = found;
      const expectedResult: number = 30.0;
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CALLBACK_MUTATION_0800
     * @tc.name testFloat64ArrayCallbackMutation008
     * @tc.desc Verify findIndex returns the index of a callback-written value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCallbackMutation008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(NaN, -Infinity, Number.MIN_VALUE, -0.0);
      const foundIndex: int = arr.findIndex((v: number, index: int): boolean => {
        if (index === 0) {
          arr.$_set(3, 30.0);
        }
        return v === 30.0;
      });
      const actualResult = foundIndex;
      const expectedResult: number = 3;
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CALLBACK_MUTATION_0900
     * @tc.name testFloat64ArrayCallbackMutation009
     * @tc.desc Verify findLast reads a value written to an earlier unread slot
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCallbackMutation009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(Number.MIN_VALUE, NaN, Infinity, -0.0);
      const found: number | undefined = arr.findLast((v: number, index: int): boolean => {
        if (index === 3) {
          arr.$_set(0, 30.0);
        }
        return v === 30.0;
      });
      const actualResult = found;
      const expectedResult: number = 30.0;
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CALLBACK_MUTATION_1000
     * @tc.name testFloat64ArrayCallbackMutation010
     * @tc.desc Verify findLastIndex returns the index of a callback-written value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCallbackMutation010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(Number.MIN_VALUE, NaN, Infinity, -0.0);
      const foundIndex: int = arr.findLastIndex((v: number, index: int): boolean => {
        if (index === 3) {
          arr.$_set(0, 30.0);
        }
        return v === 30.0;
      });
      const actualResult = foundIndex;
      const expectedResult: number = 0;
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CALLBACK_MUTATION_1100
     * @tc.name testFloat64ArrayCallbackMutation011
     * @tc.desc Verify some stops after a callback mutation creates a match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCallbackMutation011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(NaN, -Infinity, Number.MIN_VALUE, -0.0);
      let calls: int = 0;
      const result: boolean = arr.some((v: number, index: int): boolean => {
        calls++;
        if (index === 0) {
          arr.$_set(3, 9.0);
        }
        return v > 8.0;
      });
      expect(result).assertTrue();
      const actualResult = calls;
      const expectedResult: number = 4;
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CALLBACK_MUTATION_1200
     * @tc.name testFloat64ArrayCallbackMutation012
     * @tc.desc Verify every stops after a callback mutation creates a miss
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCallbackMutation012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(Number.MIN_VALUE, Number.MAX_VALUE, Number.MIN_VALUE, -0.0);
      let calls: int = 0;
      const result: boolean = arr.every((v: number, index: int): boolean => {
        calls++;
        if (index === 0) {
          arr.$_set(3, 0.0);
        }
        return v > 0.0;
      });
      expect(result).assertFalse();
      const actualResult = calls;
      const expectedResult: number = 4;
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CALLBACK_MUTATION_1300
     * @tc.name testFloat64ArrayCallbackMutation013
     * @tc.desc Verify reduce includes a mutation of a future accumulator value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCallbackMutation013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(12.0, 24.0, 36.0);
      const total: number = arr.reduce((acc: number, v: number, index: int): number => {
        if (index === 0) {
          arr.$_set(2, 10.0);
        }
        return acc + v;
      }, 0.0);
      const actualResult = total;
      const expectedResult: number = 46.0;
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CALLBACK_MUTATION_1400
     * @tc.name testFloat64ArrayCallbackMutation014
     * @tc.desc Verify reduceRight includes a mutation of a future right-to-left value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCallbackMutation014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(12.0, 24.0, 36.0);
      const total: number = arr.reduceRight((acc: number, v: number, index: int): number => {
        if (index === 2) {
          arr.$_set(0, 10.0);
        }
        return acc + v;
      }, 0.0);
      const actualResult = total;
      const expectedResult: number = 70.0;
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CALLBACK_MUTATION_1500
     * @tc.name testFloat64ArrayCallbackMutation015
     * @tc.desc Verify map observes a future write through valueOf alias
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCallbackMutation015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(5.0, 6.0, 7.0);
      const alias: Float64Array = arr.valueOf();
      const mapped: Float64Array = arr.map((v: number, index: int): number => {
        if (index === 0) {
          alias.$_set(2, 8.0);
        }
        return v;
      });
      const actualElement2 = mapped.$_get(2);
      const expectedElement2: number = 8.0;
      expect(actualElement2).assertEqual(expectedElement2);
      const actualElement2Second = alias.$_get(2);
      const expectedElement2Second: number = 8.0;
      expect(actualElement2Second).assertEqual(expectedElement2Second);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CALLBACK_MUTATION_1600
     * @tc.name testFloat64ArrayCallbackMutation016
     * @tc.desc Verify filter observes a future write through a subarray view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCallbackMutation016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(5.0, 6.0, 7.0);
      const view: Float64Array = arr.subarray(1, 3);
      const filtered: Float64Array = arr.filter((v: number, index: int): boolean => {
        if (index === 0) {
          view.$_set(1, 9.0);
        }
        return v > 8.0;
      });
      const actualLength = filtered.length;
      const expectedLength: int = 1;
      expect(actualLength).assertEqual(expectedLength);
      const actualElement0 = filtered.$_get(0);
      const expectedElement0: number = 9.0;
      expect(actualElement0).assertEqual(expectedElement0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CALLBACK_MUTATION_1700
     * @tc.name testFloat64ArrayCallbackMutation017
     * @tc.desc Verify find detects NaN written through an alias view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCallbackMutation017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(5.0, 6.0, 7.0);
      const alias: Float64Array = arr.valueOf();
      const found: number | undefined = arr.find((v: number, index: int): boolean => {
        if (index === 0) {
          alias.$_set(2, NaN);
        }
        return isNaN(v);
      });
      expect(found).assertNaN();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CALLBACK_MUTATION_1800
     * @tc.name testFloat64ArrayCallbackMutation018
     * @tc.desc Verify findLastIndex detects Infinity written through a view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCallbackMutation018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(5.0, 6.0, 7.0);
      const view: Float64Array = arr.subarray(0, 2);
      const foundIndex: int = arr.findLastIndex((v: number, index: int): boolean => {
        if (index === 2) {
          view.$_set(0, Infinity);
        }
        return v === Infinity;
      });
      const actualResult = foundIndex;
      const expectedResult: number = 0;
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CALLBACK_MUTATION_1900
     * @tc.name testFloat64ArrayCallbackMutation019
     * @tc.desc Verify forEach observes a future write through a shared view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCallbackMutation019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(12.0, 24.0, 36.0);
      const view: Float64Array = arr.subarray(1, 3);
      let sum: number = 0.0;
      arr.forEach((v: number, index: int): void => {
        sum += v;
        if (index === 0) {
          view.$_set(1, 30.0);
        }
      });
      const actualResult = sum;
      const expectedResult: number = 66.0;
      expect(actualResult).assertEqual(expectedResult);
      const actualElement2 = arr.$_get(2);
      const expectedElement2: number = 30.0;
      expect(actualElement2).assertEqual(expectedElement2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CALLBACK_MUTATION_2000
     * @tc.name testFloat64ArrayCallbackMutation020
     * @tc.desc Verify every observes a future write through valueOf alias
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCallbackMutation020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(5.0, 6.0, 7.0);
      const alias: Float64Array = arr.valueOf();
      const result: boolean = arr.every((v: number, index: int): boolean => {
        if (index === 0) {
          alias.$_set(2, -1.0);
        }
        return v > 0.0;
      });
      expect(result).assertFalse();
      const actualElement2 = alias.$_get(2);
      const expectedElement2: number = -1.0;
      expect(actualElement2).assertEqual(expectedElement2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CALLBACK_MUTATION_2100
     * @tc.name testFloat64ArrayCallbackMutation021
     * @tc.desc Verify map uses the callback array parameter for a future write
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCallbackMutation021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(5.0, 6.0, 7.0);
      const mapped: Float64Array = arr.map((v: number, index: int, source: Float64Array): number => {
        if (index === 0) {
          source.$_set(2, 12.0);
        }
        return v;
      });
      const actualElement2 = mapped.$_get(2);
      const expectedElement2: number = 12.0;
      expect(actualElement2).assertEqual(expectedElement2);
      const actualElement2Second = arr.$_get(2);
      const expectedElement2Second: number = 12.0;
      expect(actualElement2Second).assertEqual(expectedElement2Second);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CALLBACK_MUTATION_2200
     * @tc.name testFloat64ArrayCallbackMutation022
     * @tc.desc Verify filter callback array parameter mutation affects later predicate input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCallbackMutation022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(5.0, 6.0, 7.0);
      const filtered: Float64Array = arr.filter((v: number, index: int, source: Float64Array): boolean => {
        if (index === 0) {
          source.$_set(1, 20.0);
        }
        return v === 20.0;
      });
      const actualLength = filtered.length;
      const expectedLength: int = 1;
      expect(actualLength).assertEqual(expectedLength);
      const actualElement0 = filtered.$_get(0);
      const expectedElement0: number = 20.0;
      expect(actualElement0).assertEqual(expectedElement0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CALLBACK_MUTATION_2300
     * @tc.name testFloat64ArrayCallbackMutation023
     * @tc.desc Verify forEach callback array parameter writes an unread element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCallbackMutation023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(12.0, 24.0, 36.0);
      let sum: number = 0.0;
      arr.forEach((v: number, index: int, source: Float64Array): void => {
        sum += v;
        if (index === 0) {
          source.$_set(1, 20.0);
        }
      });
      const actualResult = sum;
      const expectedResult: number = 68.0;
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CALLBACK_MUTATION_2400
     * @tc.name testFloat64ArrayCallbackMutation024
     * @tc.desc Verify find returns the captured value after rewriting its current slot
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCallbackMutation024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(5.0, 6.0, 7.0);
      const found: number | undefined = arr.find((v: number, index: int): boolean => {
        if (index === 0) {
          arr.$_set(0, 99.0);
        }
        return v === 5.0;
      });
      const actualResult = found;
      const expectedResult: number = 5.0;
      expect(actualResult).assertEqual(expectedResult);
      const actualElement0 = arr.$_get(0);
      const expectedElement0: number = 99.0;
      expect(actualElement0).assertEqual(expectedElement0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CALLBACK_MUTATION_2500
     * @tc.name testFloat64ArrayCallbackMutation025
     * @tc.desc Verify findIndex does not revisit a slot rewritten after it was read
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCallbackMutation025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(5.0, 6.0, 7.0);
      const foundIndex: int = arr.findIndex((v: number, index: int): boolean => {
        if (index === 1) {
          arr.$_set(0, 99.0);
        }
        return v === 99.0;
      });
      const actualResult = foundIndex;
      const expectedResult: number = -1;
      expect(actualResult).assertEqual(expectedResult);
      const actualElement0 = arr.$_get(0);
      const expectedElement0: number = 99.0;
      expect(actualElement0).assertEqual(expectedElement0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CALLBACK_MUTATION_2600
     * @tc.name testFloat64ArrayCallbackMutation026
     * @tc.desc Verify findLast returns the captured value after rewriting its current slot
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCallbackMutation026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(5.0, 6.0, 7.0);
      const found: number | undefined = arr.findLast((v: number, index: int): boolean => {
        if (index === 2) {
          arr.$_set(2, 99.0);
        }
        return v === 7.0;
      });
      const actualResult = found;
      const expectedResult: number = 7.0;
      expect(actualResult).assertEqual(expectedResult);
      const actualElement2 = arr.$_get(2);
      const expectedElement2: number = 99.0;
      expect(actualElement2).assertEqual(expectedElement2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CALLBACK_MUTATION_2700
     * @tc.name testFloat64ArrayCallbackMutation027
     * @tc.desc Verify findLastIndex does not revisit a slot rewritten after it was read
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCallbackMutation027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(5.0, 6.0, 7.0);
      const foundIndex: int = arr.findLastIndex((v: number, index: int): boolean => {
        if (index === 2) {
          arr.$_set(2, 99.0);
        }
        return v === 99.0;
      });
      const actualResult = foundIndex;
      const expectedResult: number = -1;
      expect(actualResult).assertEqual(expectedResult);
      const actualElement2 = arr.$_get(2);
      const expectedElement2: number = 99.0;
      expect(actualElement2).assertEqual(expectedElement2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CALLBACK_MUTATION_2800
     * @tc.name testFloat64ArrayCallbackMutation028
     * @tc.desc Verify some evaluates the captured current value only once
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCallbackMutation028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(5.0, 6.0, 7.0);
      let calls: int = 0;
      const result: boolean = arr.some((v: number, index: int): boolean => {
        calls++;
        if (index === 0) {
          arr.$_set(0, 99.0);
        }
        return v === 5.0;
      });
      expect(result).assertTrue();
      const actualResult = calls;
      const expectedResult: number = 1;
      expect(actualResult).assertEqual(expectedResult);
      const actualElement0 = arr.$_get(0);
      const expectedElement0: number = 99.0;
      expect(actualElement0).assertEqual(expectedElement0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CALLBACK_MUTATION_2900
     * @tc.name testFloat64ArrayCallbackMutation029
     * @tc.desc Verify every evaluates the captured current value only once
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCallbackMutation029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 1.0, 1.0);
      let calls: int = 0;
      const result: boolean = arr.every((v: number, index: int): boolean => {
        calls++;
        if (index === 0) {
          arr.$_set(0, -1.0);
        }
        return v === 1.0;
      });
      expect(result).assertTrue();
      const actualResult = calls;
      const expectedResult: number = 3;
      expect(actualResult).assertEqual(expectedResult);
      const actualElement0 = arr.$_get(0);
      const expectedElement0: number = -1.0;
      expect(actualElement0).assertEqual(expectedElement0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CALLBACK_MUTATION_3000
     * @tc.name testFloat64ArrayCallbackMutation030
     * @tc.desc Verify reduce without initial value reads its seed before callback mutation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCallbackMutation030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(12.0, 24.0, 36.0);
      const total: number = arr.reduce((acc: number, v: number, index: int): number => {
        if (index === 1) {
          arr.$_set(0, 10.0);
        }
        return acc + v;
      });
      const actualResult = total;
      const expectedResult: number = 72.0;
      expect(actualResult).assertEqual(expectedResult);
      const actualElement0 = arr.$_get(0);
      const expectedElement0: number = 10.0;
      expect(actualElement0).assertEqual(expectedElement0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CALLBACK_MUTATION_3100
     * @tc.name testFloat64ArrayCallbackMutation031
     * @tc.desc Verify reduceRight without initial value reads its seed before callback mutation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCallbackMutation031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(12.0, 24.0, 36.0);
      const total: number = arr.reduceRight((acc: number, v: number, index: int): number => {
        if (index === 1) {
          arr.$_set(2, 10.0);
        }
        return acc + v;
      });
      const actualResult = total;
      const expectedResult: number = 72.0;
      expect(actualResult).assertEqual(expectedResult);
      const actualElement2 = arr.$_get(2);
      const expectedElement2: number = 10.0;
      expect(actualElement2).assertEqual(expectedElement2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CALLBACK_MUTATION_3200
     * @tc.name testFloat64ArrayCallbackMutation032
     * @tc.desc Verify reduce on one element executes no callback and returns the element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCallbackMutation032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(7.0);
      let calls: int = 0;
      const total: number = arr.reduce((acc: number, v: number): number => {
        calls++;
        return acc + v;
      });
      const actualResult = total;
      const expectedResult: number = 7.0;
      expect(actualResult).assertEqual(expectedResult);
      const actualResultSecond = calls;
      const expectedResultSecond: number = 0;
      expect(actualResultSecond).assertEqual(expectedResultSecond);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CALLBACK_MUTATION_3300
     * @tc.name testFloat64ArrayCallbackMutation033
     * @tc.desc Verify reduceRight on one element executes no callback and returns the element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCallbackMutation033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(7.0);
      let calls: int = 0;
      const total: number = arr.reduceRight((acc: number, v: number): number => {
        calls++;
        return acc + v;
      });
      const actualResult = total;
      const expectedResult: number = 7.0;
      expect(actualResult).assertEqual(expectedResult);
      const actualResultSecond = calls;
      const expectedResultSecond: number = 0;
      expect(actualResultSecond).assertEqual(expectedResultSecond);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CALLBACK_MUTATION_3400
     * @tc.name testFloat64ArrayCallbackMutation034
     * @tc.desc Verify empty map executes no callback and returns an empty typed array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCallbackMutation034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array(0);
      let calls: int = 0;
      const mapped: Float64Array = arr.map((v: number): number => {
        calls++;
        return v;
      });
      const actualLength = mapped.length;
      const expectedLength: int = 0;
      expect(actualLength).assertEqual(expectedLength);
      const actualResult = calls;
      const expectedResult: number = 0;
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CALLBACK_MUTATION_3500
     * @tc.name testFloat64ArrayCallbackMutation035
     * @tc.desc Verify empty filter executes no callback and returns an empty typed array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCallbackMutation035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array(0);
      let calls: int = 0;
      const filtered: Float64Array = arr.filter((v: number): boolean => {
        calls++;
        return true;
      });
      const actualLength = filtered.length;
      const expectedLength: int = 0;
      expect(actualLength).assertEqual(expectedLength);
      const actualResult = calls;
      const expectedResult: number = 0;
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CALLBACK_MUTATION_3600
     * @tc.name testFloat64ArrayCallbackMutation036
     * @tc.desc Verify empty find executes no callback and returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCallbackMutation036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array(0);
      let calls: int = 0;
      const found: number | undefined = arr.find((v: number): boolean => {
        calls++;
        return true;
      });
      expect(found).assertEqual(undefined);
      const actualResult = calls;
      const expectedResult: number = 0;
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CALLBACK_MUTATION_3700
     * @tc.name testFloat64ArrayCallbackMutation037
     * @tc.desc Verify empty forEach executes no callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCallbackMutation037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array(0);
      let calls: int = 0;
      arr.forEach((v: number): void => {
        calls++;
      });
      const actualResult = calls;
      const expectedResult: number = 0;
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CALLBACK_MUTATION_3800
     * @tc.name testFloat64ArrayCallbackMutation038
     * @tc.desc Verify empty findLastIndex returns negative one without callback execution
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCallbackMutation038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array(0);
      let calls: int = 0;
      const foundIndex: int = arr.findLastIndex((v: number): boolean => {
        calls++;
        return true;
      });
      const actualResult = foundIndex;
      const expectedResult: number = -1;
      expect(actualResult).assertEqual(expectedResult);
      const actualResultSecond = calls;
      const expectedResultSecond: number = 0;
      expect(actualResultSecond).assertEqual(expectedResultSecond);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CALLBACK_MUTATION_3900
     * @tc.name testFloat64ArrayCallbackMutation039
     * @tc.desc Verify empty filter returns an independent empty result without callback execution
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCallbackMutation039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array(0);
      let calls: int = 0;
      const filtered: Float64Array = arr.filter((v: number): boolean => {
        calls++;
        return true;
      });
      const actualLength = filtered.length;
      const expectedLength: int = 0;
      expect(actualLength).assertEqual(expectedLength);
      expect(filtered).not().assertEqual(arr);
      const actualResult = calls;
      const expectedResult: number = 0;
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CALLBACK_MUTATION_4000
     * @tc.name testFloat64ArrayCallbackMutation040
     * @tc.desc Verify empty findIndex returns negative one without callback execution
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCallbackMutation040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array(0);
      let calls: int = 0;
      const foundIndex: int = arr.findIndex((v: number): boolean => {
        calls++;
        return true;
      });
      const actualResult = foundIndex;
      const expectedResult: number = -1;
      expect(actualResult).assertEqual(expectedResult);
      const actualResultSecond = calls;
      const expectedResultSecond: number = 0;
      expect(actualResultSecond).assertEqual(expectedResultSecond);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CALLBACK_MUTATION_4100
     * @tc.name testFloat64ArrayCallbackMutation041
     * @tc.desc Verify map callback error preserves an alias write
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCallbackMutation041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(11.0, 12.0, 13.0);
      const alias: Float64Array = arr.valueOf();
      try {
        arr.map((v: number, index: int): number => {
          if (index === 0) {
            alias.$_set(2, 9.0);
            throw new Error('map alias stop');
          }
          return v;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
        const actualMessage = e.message;
        const expectedMessage: string = 'map alias stop';
        expect(actualMessage).assertEqual(expectedMessage);
      }
      const actualElement2 = arr.$_get(2);
      const expectedElement2: number = 9.0;
      expect(actualElement2).assertEqual(expectedElement2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CALLBACK_MUTATION_4200
     * @tc.name testFloat64ArrayCallbackMutation042
     * @tc.desc Verify filter callback error preserves a subarray write
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCallbackMutation042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(11.0, 12.0, 13.0);
      const view: Float64Array = arr.subarray(0, 2);
      try {
        arr.filter((v: number, index: int): boolean => {
          if (index === 1) {
            view.$_set(0, 8.0);
            throw new Error('filter view stop');
          }
          return true;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
        const actualMessage = e.message;
        const expectedMessage: string = 'filter view stop';
        expect(actualMessage).assertEqual(expectedMessage);
      }
      const actualElement0 = arr.$_get(0);
      const expectedElement0: number = 8.0;
      expect(actualElement0).assertEqual(expectedElement0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CALLBACK_MUTATION_4300
     * @tc.name testFloat64ArrayCallbackMutation043
     * @tc.desc Verify forEach callback error stops after preserving array-parameter write
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCallbackMutation043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(11.0, 12.0, 13.0);
      let calls: int = 0;
      try {
        arr.forEach((v: number, index: int, source: Float64Array): void => {
          calls++;
          if (index === 1) {
            source.$_set(2, 30.0);
            throw new Error('forEach source stop');
          }
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
        const actualMessage = e.message;
        const expectedMessage: string = 'forEach source stop';
        expect(actualMessage).assertEqual(expectedMessage);
      }
      const actualResult = calls;
      const expectedResult: number = 2;
      expect(actualResult).assertEqual(expectedResult);
      const actualElement2 = arr.$_get(2);
      const expectedElement2: number = 30.0;
      expect(actualElement2).assertEqual(expectedElement2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CALLBACK_MUTATION_4400
     * @tc.name testFloat64ArrayCallbackMutation044
     * @tc.desc Verify some callback error preserves an alias write and stops immediately
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCallbackMutation044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(11.0, 12.0, 13.0);
      const alias: Float64Array = arr.valueOf();
      let calls: int = 0;
      try {
        arr.some((v: number, index: int): boolean => {
          calls++;
          if (index === 0) {
            alias.$_set(1, 20.0);
            throw new Error('some alias stop');
          }
          return false;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
        const actualMessage = e.message;
        const expectedMessage: string = 'some alias stop';
        expect(actualMessage).assertEqual(expectedMessage);
      }
      const actualResult = calls;
      const expectedResult: number = 1;
      expect(actualResult).assertEqual(expectedResult);
      const actualElement1 = arr.$_get(1);
      const expectedElement1: number = 20.0;
      expect(actualElement1).assertEqual(expectedElement1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CALLBACK_MUTATION_4500
     * @tc.name testFloat64ArrayCallbackMutation045
     * @tc.desc Verify reduce callback error preserves a future alias write
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCallbackMutation045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(11.0, 12.0, 13.0);
      const alias: Float64Array = arr.valueOf();
      let calls: int = 0;
      try {
        arr.reduce((acc: number, v: number, index: int): number => {
          calls++;
          if (index === 1) {
            alias.$_set(2, 30.0);
            throw new Error('reduce alias stop');
          }
          return acc + v;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
        const actualMessage = e.message;
        const expectedMessage: string = 'reduce alias stop';
        expect(actualMessage).assertEqual(expectedMessage);
      }
      const actualResult = calls;
      const expectedResult: number = 1;
      expect(actualResult).assertEqual(expectedResult);
      const actualElement2 = arr.$_get(2);
      const expectedElement2: number = 30.0;
      expect(actualElement2).assertEqual(expectedElement2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CALLBACK_MUTATION_4600
     * @tc.name testFloat64ArrayCallbackMutation046
     * @tc.desc Verify reduceRight callback error preserves a previous view write
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCallbackMutation046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(11.0, 12.0, 13.0);
      const view: Float64Array = arr.subarray(0, 2);
      let calls: int = 0;
      try {
        arr.reduceRight((acc: number, v: number, index: int): number => {
          calls++;
          if (index === 1) {
            view.$_set(0, 10.0);
            throw new Error('reduceRight view stop');
          }
          return acc + v;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
        const actualMessage = e.message;
        const expectedMessage: string = 'reduceRight view stop';
        expect(actualMessage).assertEqual(expectedMessage);
      }
      const actualResult = calls;
      const expectedResult: number = 1;
      expect(actualResult).assertEqual(expectedResult);
      const actualElement0 = arr.$_get(0);
      const expectedElement0: number = 10.0;
      expect(actualElement0).assertEqual(expectedElement0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CALLBACK_MUTATION_4700
     * @tc.name testFloat64ArrayCallbackMutation047
     * @tc.desc Verify map callback can re-enter filter without changing outer traversal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCallbackMutation047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(101.0, 202.0, 303.0);
      let nestedLength: int = 0;
      const mapped: Float64Array = arr.map((v: number, index: int): number => {
        if (index === 0) {
          const nested: Float64Array = arr.filter((item: number): boolean => item > 101.0);
          nestedLength = nested.length;
        }
        return v * 2.0;
      });
      const actualResult = nestedLength;
      const expectedResult: number = 2;
      expect(actualResult).assertEqual(expectedResult);
      const actualElement2 = mapped.$_get(2);
      const expectedElement2: number = 606.0;
      expect(actualElement2).assertEqual(expectedElement2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CALLBACK_MUTATION_4800
     * @tc.name testFloat64ArrayCallbackMutation048
     * @tc.desc Verify filter callback can re-enter findIndex and preserve source order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCallbackMutation048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(101.0, 202.0, 303.0);
      let nestedIndex: int = -1;
      const filtered: Float64Array = arr.filter((v: number, index: int): boolean => {
        if (index === 1) {
          nestedIndex = arr.findIndex((item: number): boolean => item === 303.0);
        }
        return v > 101.0;
      });
      const actualResult = nestedIndex;
      const expectedResult: number = 2;
      expect(actualResult).assertEqual(expectedResult);
      const actualLength = filtered.length;
      const expectedLength: int = 2;
      expect(actualLength).assertEqual(expectedLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CALLBACK_MUTATION_4900
     * @tc.name testFloat64ArrayCallbackMutation049
     * @tc.desc Verify find callback can re-enter map and still returns the outer match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCallbackMutation049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(101.0, 202.0, 303.0);
      let nestedLast: number = 0.0;
      const found: number | undefined = arr.find((v: number, index: int): boolean => {
        if (index === 1) {
          const nested: Float64Array = arr.map((item: number): number => item + 10.0);
          nestedLast = nested.$_get(2);
        }
        return v === 202.0;
      });
      const actualResult = nestedLast;
      const expectedResult: number = 313.0;
      expect(actualResult).assertEqual(expectedResult);
      const actualResultSecond = found;
      const expectedResultSecond: number = 202.0;
      expect(actualResultSecond).assertEqual(expectedResultSecond);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CALLBACK_MUTATION_5000
     * @tc.name testFloat64ArrayCallbackMutation050
     * @tc.desc Verify forEach callback can re-enter reduce and preserve outer sum
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCallbackMutation050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(12.0, 24.0, 36.0);
      let outerSum: number = 0.0;
      let nestedSum: number = 0.0;
      arr.forEach((v: number, index: int): void => {
        outerSum += v;
        if (index === 1) {
          nestedSum = arr.reduce((acc: number, item: number): number => acc + item, 0.0);
        }
      });
      const actualResult = outerSum;
      const expectedResult: number = 72.0;
      expect(actualResult).assertEqual(expectedResult);
      const actualResultSecond = nestedSum;
      const expectedResultSecond: number = 72.0;
      expect(actualResultSecond).assertEqual(expectedResultSecond);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CALLBACK_MUTATION_5100
     * @tc.name testFloat64ArrayCallbackMutation051
     * @tc.desc Verify map callback array length remains fixed after element writes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCallbackMutation051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(11.0, 12.0, 13.0);
      let observedLength: int = 0;
      const mapped: Float64Array = arr.map((v: number, index: int, source: Float64Array): number => {
        observedLength = source.length;
        if (index === 0) {
          source.$_set(2, 30.0);
        }
        return v;
      });
      const actualResult = observedLength;
      const expectedResult: number = 3;
      expect(actualResult).assertEqual(expectedResult);
      const actualLength = mapped.length;
      const expectedLength: int = 3;
      expect(actualLength).assertEqual(expectedLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CALLBACK_MUTATION_5200
     * @tc.name testFloat64ArrayCallbackMutation052
     * @tc.desc Verify filter callback sees offset view byteOffset and buffer identity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCallbackMutation052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(32);
      const arr: Float64Array = new Float64Array(buffer, 8, 3);
      let observedOffset: int = 0;
      let sameBuffer: boolean = false;
      const filtered: Float64Array = arr.filter((v: number, index: int, source: Float64Array): boolean => {
        observedOffset = source.byteOffset;
        sameBuffer = source.buffer === buffer;
        return index > 0;
      });
      const actualResult = observedOffset;
      const expectedResult: number = 8;
      expect(actualResult).assertEqual(expectedResult);
      expect(sameBuffer).assertTrue();
      const actualLength = filtered.length;
      const expectedLength: int = 2;
      expect(actualLength).assertEqual(expectedLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CALLBACK_MUTATION_5300
     * @tc.name testFloat64ArrayCallbackMutation053
     * @tc.desc Verify map callback source shares valueOf alias buffer and offset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCallbackMutation053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(11.0, 12.0, 13.0);
      const alias: Float64Array = arr.valueOf();
      let sameBuffer: boolean = false;
      let sameOffset: boolean = false;
      const mapped: Float64Array = arr.map((v: number, index: int, source: Float64Array): number => {
        sameBuffer = source.buffer === alias.buffer;
        sameOffset = source.byteOffset === alias.byteOffset;
        return v;
      });
      expect(sameBuffer).assertTrue();
      expect(sameOffset).assertTrue();
      const actualLength = mapped.length;
      const expectedLength: int = 3;
      expect(actualLength).assertEqual(expectedLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CALLBACK_MUTATION_5400
     * @tc.name testFloat64ArrayCallbackMutation054
     * @tc.desc Verify forEach callback source retains offset after shared-view mutation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCallbackMutation054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(32);
      const arr: Float64Array = new Float64Array(buffer, 8, 3);
      const sibling: Float64Array = new Float64Array(buffer, 16, 2);
      let observedOffset: int = 0;
      arr.forEach((v: number, index: int, source: Float64Array): void => {
        observedOffset = source.byteOffset;
        if (index === 0) {
          sibling.$_set(0, 40.0);
        }
      });
      const actualResult = observedOffset;
      const expectedResult: number = 8;
      expect(actualResult).assertEqual(expectedResult);
      const actualElement1 = arr.$_get(1);
      const expectedElement1: number = 40.0;
      expect(actualElement1).assertEqual(expectedElement1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CALLBACK_MUTATION_5500
     * @tc.name testFloat64ArrayCallbackMutation055
     * @tc.desc Verify findLast observes a mutation through an overlapping view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCallbackMutation055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(11.0, 12.0, 13.0, 14.0);
      const view: Float64Array = arr.subarray(1, 4);
      const found: number | undefined = arr.findLast((v: number, index: int): boolean => {
        if (index === 3) {
          view.$_set(0, 20.0);
        }
        return v === 20.0;
      });
      const actualResult = found;
      const expectedResult: number = 20.0;
      expect(actualResult).assertEqual(expectedResult);
      const actualElement1 = arr.$_get(1);
      const expectedElement1: number = 20.0;
      expect(actualElement1).assertEqual(expectedElement1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CALLBACK_MUTATION_5600
     * @tc.name testFloat64ArrayCallbackMutation056
     * @tc.desc Verify reduce sees overlap-view mutation in a later element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCallbackMutation056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(12.0, 24.0, 36.0, 48.0);
      const view: Float64Array = arr.subarray(1, 4);
      const total: number = arr.reduce((acc: number, v: number, index: int): number => {
        if (index === 0) {
          view.$_set(1, 30.0);
        }
        return acc + v;
      }, 0.0);
      const actualResult = total;
      const expectedResult: number = 114.0;
      expect(actualResult).assertEqual(expectedResult);
      const actualElement2 = arr.$_get(2);
      const expectedElement2: number = 30.0;
      expect(actualElement2).assertEqual(expectedElement2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CALLBACK_MUTATION_5700
     * @tc.name testFloat64ArrayCallbackMutation057
     * @tc.desc Verify filter callback records forward index order around a mutation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCallbackMutation057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(11.0, 12.0, 13.0);
      let order: int = 0;
      const filtered: Float64Array = arr.filter((v: number, index: int): boolean => {
        order = order * 10 + index;
        if (index === 0) {
          arr.$_set(2, 30.0);
        }
        return v > 11.0;
      });
      const actualResult = order;
      const expectedResult: number = 12;
      expect(actualResult).assertEqual(expectedResult);
      const actualLength = filtered.length;
      const expectedLength: int = 2;
      expect(actualLength).assertEqual(expectedLength);
      const actualElement1 = filtered.$_get(1);
      const expectedElement1: number = 30.0;
      expect(actualElement1).assertEqual(expectedElement1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CALLBACK_MUTATION_5800
     * @tc.name testFloat64ArrayCallbackMutation058
     * @tc.desc Verify findIndex records forward order and stops at a mutated match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCallbackMutation058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(11.0, 12.0, 13.0, 14.0);
      let order: int = 0;
      const foundIndex: int = arr.findIndex((v: number, index: int): boolean => {
        order = order * 10 + index;
        if (index === 0) {
          arr.$_set(2, 30.0);
        }
        return v === 30.0;
      });
      const actualResult = order;
      const expectedResult: number = 12;
      expect(actualResult).assertEqual(expectedResult);
      const actualResultSecond = foundIndex;
      const expectedResultSecond: number = 2;
      expect(actualResultSecond).assertEqual(expectedResultSecond);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CALLBACK_MUTATION_5900
     * @tc.name testFloat64ArrayCallbackMutation059
     * @tc.desc Verify reduceRight records reverse callback order after a mutation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCallbackMutation059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(12.0, 24.0, 36.0, 48.0);
      let order: int = 0;
      const total: number = arr.reduceRight((acc: number, v: number, index: int): number => {
        order = order * 10 + index;
        if (index === 3) {
          arr.$_set(0, 10.0);
        }
        return acc + v;
      }, 0.0);
      const actualResult = order;
      const expectedResult: number = 3210;
      expect(actualResult).assertEqual(expectedResult);
      const actualResultSecond = total;
      const expectedResultSecond: number = 118.0;
      expect(actualResultSecond).assertEqual(expectedResultSecond);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CALLBACK_MUTATION_6000
     * @tc.name testFloat64ArrayCallbackMutation060
     * @tc.desc Verify telemetry sum includes one calibration write made during forEach
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCallbackMutation060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const readings: Float64Array = Float64Array.of(10.0, 20.0, 30.0);
      const calibration: Float64Array = readings.valueOf();
      let total: number = 0.0;
      readings.forEach((v: number, index: int): void => {
        total += v;
        if (index === 0) {
          calibration.$_set(2, 35.0);
        }
      });
      const actualResult = total;
      const expectedResult: number = 65.0;
      expect(actualResult).assertEqual(expectedResult);
      const actualElement2 = readings.$_get(2);
      const expectedElement2: number = 35.0;
      expect(actualElement2).assertEqual(expectedElement2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CALLBACK_MUTATION_6100
     * @tc.name testFloat64ArrayCallbackMutation061
     * @tc.desc Verify some short-circuits after a callback mutation creates a match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCallbackMutation061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(5.0, 6.0, 7.0);
      let calls: int = 0;
      const result: boolean = arr.some((v: number, index: int): boolean => {
        calls++;
        if (index === 0) {
          arr.$_set(2, 20.0);
          return false;
        } else if (index === 1) {
          return v === 6.0;
        }
        arr.$_set(2, 99.0);
        return false;
      });
      expect(result).assertTrue();
      const actualResult = calls;
      const expectedResult: number = 2;
      expect(actualResult).assertEqual(expectedResult);
      const actualElement2 = arr.$_get(2);
      const expectedElement2: number = 20.0;
      expect(actualElement2).assertEqual(expectedElement2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CALLBACK_MUTATION_6200
     * @tc.name testFloat64ArrayCallbackMutation062
     * @tc.desc Verify every short-circuits after a legal predicate miss and preserves a skipped write
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCallbackMutation062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(5.0, 6.0, 7.0);
      let calls: int = 0;
      const result: boolean = arr.every((v: number, index: int): boolean => {
        calls++;
        if (index === 0) {
          arr.$_set(2, -1.0);
          return true;
        } else if (index === 1) {
          return v > 100.0;
        }
        arr.$_set(2, 99.0);
        return true;
      });
      expect(result).assertFalse();
      const actualResult = calls;
      const expectedResult: number = 2;
      expect(actualResult).assertEqual(expectedResult);
      const actualElement2 = arr.$_get(2);
      const expectedElement2: number = -1.0;
      expect(actualElement2).assertEqual(expectedElement2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CALLBACK_MUTATION_6300
     * @tc.name testFloat64ArrayCallbackMutation063
     * @tc.desc Verify find stops after a mutation creates the first forward match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCallbackMutation063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(5.0, 6.0, 7.0);
      const alias: Float64Array = arr.valueOf();
      let calls: int = 0;
      const found: number | undefined = arr.find((v: number, index: int): boolean => {
        calls++;
        if (index === 0) {
          alias.$_set(1, 50.0);
        }
        if (index === 1) {
          alias.$_set(2, 70.0);
          return v === 50.0;
        }
        return false;
      });
      const actualResult = found;
      const expectedResult: number = 50.0;
      expect(actualResult).assertEqual(expectedResult);
      const actualResultSecond = calls;
      const expectedResultSecond: number = 2;
      expect(actualResultSecond).assertEqual(expectedResultSecond);
      const actualElement2 = arr.$_get(2);
      const expectedElement2: number = 70.0;
      expect(actualElement2).assertEqual(expectedElement2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CALLBACK_MUTATION_6400
     * @tc.name testFloat64ArrayCallbackMutation064
     * @tc.desc Verify findLast stops after a mutation creates the first reverse match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCallbackMutation064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(5.0, 6.0, 7.0);
      const view: Float64Array = arr.subarray(0, 2);
      let calls: int = 0;
      const found: number | undefined = arr.findLast((v: number, index: int): boolean => {
        calls++;
        if (index === 2) {
          view.$_set(1, 60.0);
        }
        if (index === 1) {
          view.$_set(0, 50.0);
          return v === 60.0;
        }
        return false;
      });
      const actualResult = found;
      const expectedResult: number = 60.0;
      expect(actualResult).assertEqual(expectedResult);
      const actualResultSecond = calls;
      const expectedResultSecond: number = 2;
      expect(actualResultSecond).assertEqual(expectedResultSecond);
      const actualElement0 = arr.$_get(0);
      const expectedElement0: number = 50.0;
      expect(actualElement0).assertEqual(expectedElement0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CALLBACK_MUTATION_6500
     * @tc.name testFloat64ArrayCallbackMutation065
     * @tc.desc Verify findIndex visits every slot for a legal not-found mutation path
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCallbackMutation065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(11.0, 12.0, 13.0);
      let order: int = 0;
      const foundIndex: int = arr.findIndex((v: number, index: int): boolean => {
        order = order * 10 + index;
        if (index === 0) {
          arr.$_set(1, 20.0);
        } else if (index === 1) {
          arr.$_set(2, 30.0);
        }
        return v > 100.0;
      });
      const actualResult = foundIndex;
      const expectedResult: number = -1;
      expect(actualResult).assertEqual(expectedResult);
      const actualResultSecond = order;
      const expectedResultSecond: number = 12;
      expect(actualResultSecond).assertEqual(expectedResultSecond);
      const actualElement1 = arr.$_get(1);
      const expectedElement1: number = 20.0;
      expect(actualElement1).assertEqual(expectedElement1);
      const actualElement2 = arr.$_get(2);
      const expectedElement2: number = 30.0;
      expect(actualElement2).assertEqual(expectedElement2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CALLBACK_MUTATION_6600
     * @tc.name testFloat64ArrayCallbackMutation066
     * @tc.desc Verify findLastIndex preserves reverse order on a legal not-found view mutation path
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCallbackMutation066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(11.0, 12.0, 13.0, 14.0);
      const view: Float64Array = arr.subarray(1, 4);
      let order: int = 0;
      const foundIndex: int = arr.findLastIndex((v: number, index: int): boolean => {
        order = order * 10 + index;
        if (index === 3) {
          view.$_set(0, 20.0);
        } else if (index === 1) {
          view.$_set(1, 30.0);
        }
        return v > 100.0;
      });
      const actualResult = foundIndex;
      const expectedResult: number = -1;
      expect(actualResult).assertEqual(expectedResult);
      const actualResultSecond = order;
      const expectedResultSecond: number = 3210;
      expect(actualResultSecond).assertEqual(expectedResultSecond);
      const actualElement1 = arr.$_get(1);
      const expectedElement1: number = 20.0;
      expect(actualElement1).assertEqual(expectedElement1);
      const actualElement2 = arr.$_get(2);
      const expectedElement2: number = 30.0;
      expect(actualElement2).assertEqual(expectedElement2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CALLBACK_MUTATION_6700
     * @tc.name testFloat64ArrayCallbackMutation067
     * @tc.desc Verify map returns the captured current value after rewriting that source slot
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCallbackMutation067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(5.0, 6.0, 7.0);
      const mapped: Float64Array = arr.map((v: number, index: int, source: Float64Array): number => {
        if (index === 1) {
          source.$_set(index, 99.0);
        }
        return v * 10.0;
      });
      const actualElement1 = mapped.$_get(1);
      const expectedElement1: number = 60.0;
      expect(actualElement1).assertEqual(expectedElement1);
      const actualElement1Second = arr.$_get(1);
      const expectedElement1Second: number = 99.0;
      expect(actualElement1Second).assertEqual(expectedElement1Second);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CALLBACK_MUTATION_6800
     * @tc.name testFloat64ArrayCallbackMutation068
     * @tc.desc Verify filter keeps the selected value after rewriting a visited source slot
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCallbackMutation068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(5.0, 6.0, 7.0);
      const filtered: Float64Array = arr.filter((v: number, index: int, source: Float64Array): boolean => {
        if (index === 1) {
          source.$_set(0, 99.0);
        }
        return v === 6.0;
      });
      const actualLength = filtered.length;
      const expectedLength: int = 1;
      expect(actualLength).assertEqual(expectedLength);
      const actualElement0 = filtered.$_get(0);
      const expectedElement0: number = 6.0;
      expect(actualElement0).assertEqual(expectedElement0);
      const actualElement0Second = arr.$_get(0);
      const expectedElement0Second: number = 99.0;
      expect(actualElement0Second).assertEqual(expectedElement0Second);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CALLBACK_MUTATION_6900
     * @tc.name testFloat64ArrayCallbackMutation069
     * @tc.desc Verify reduce keeps a consumed value in the accumulator after source mutation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCallbackMutation069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(12.0, 24.0, 36.0);
      const alias: Float64Array = arr.valueOf();
      let calls: int = 0;
      const total: number = arr.reduce((acc: number, v: number, index: int): number => {
        calls++;
        if (index === 1) {
          alias.$_set(0, 100.0);
        }
        return acc + v;
      });
      const actualResult = total;
      const expectedResult: number = 72.0;
      expect(actualResult).assertEqual(expectedResult);
      const actualResultSecond = calls;
      const expectedResultSecond: number = 2;
      expect(actualResultSecond).assertEqual(expectedResultSecond);
      const actualElement0 = arr.$_get(0);
      const expectedElement0: number = 100.0;
      expect(actualElement0).assertEqual(expectedElement0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CALLBACK_MUTATION_7000
     * @tc.name testFloat64ArrayCallbackMutation070
     * @tc.desc Verify reduceRight keeps a consumed value in the accumulator after source mutation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCallbackMutation070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(11.0, 12.0, 13.0, 14.0);
      const view: Float64Array = arr.subarray(2, 4);
      let calls: int = 0;
      const total: number = arr.reduceRight((acc: number, v: number, index: int): number => {
        calls++;
        if (index === 2) {
          view.$_set(1, 100.0);
        }
        return acc + v;
      });
      const actualResult = total;
      const expectedResult: number = 50.0;
      expect(actualResult).assertEqual(expectedResult);
      const actualResultSecond = calls;
      const expectedResultSecond: number = 3;
      expect(actualResultSecond).assertEqual(expectedResultSecond);
      const actualElement3 = arr.$_get(3);
      const expectedElement3: number = 100.0;
      expect(actualElement3).assertEqual(expectedElement3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CALLBACK_MUTATION_7100
     * @tc.name testFloat64ArrayCallbackMutation071
     * @tc.desc Verify forEach uses the captured current value before rewriting its slot
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCallbackMutation071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(12.0, 24.0, 36.0);
      let sum: number = 0.0;
      arr.forEach((v: number, index: int, source: Float64Array): void => {
        sum += v;
        if (index === 1) {
          source.$_set(index, 99.0);
        }
      });
      const actualResult = sum;
      const expectedResult: number = 72.0;
      expect(actualResult).assertEqual(expectedResult);
      const actualElement1 = arr.$_get(1);
      const expectedElement1: number = 99.0;
      expect(actualElement1).assertEqual(expectedElement1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CALLBACK_MUTATION_7200
     * @tc.name testFloat64ArrayCallbackMutation072
     * @tc.desc Verify callback array identity and offset remain stable during mutation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCallbackMutation072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(32);
      const arr: Float64Array = new Float64Array(buffer, 8, 2);
      arr.$_set(0, 1.0);
      arr.$_set(1, 2.0);
      let sameSource: boolean = false;
      let sameBuffer: boolean = false;
      let observedOffset: int = 0;
      const mapped: Float64Array = arr.map((v: number, index: int, source: Float64Array): number => {
        sameSource = source === arr;
        sameBuffer = source.buffer === buffer;
        observedOffset = source.byteOffset;
        if (index === 0) {
          source.$_set(1, 40.0);
        }
        return v;
      });
      expect(sameSource).assertTrue();
      expect(sameBuffer).assertTrue();
      const actualResult = observedOffset;
      const expectedResult: number = 8;
      expect(actualResult).assertEqual(expectedResult);
      const actualElement1 = mapped.$_get(1);
      const expectedElement1: number = 40.0;
      expect(actualElement1).assertEqual(expectedElement1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CALLBACK_MUTATION_7300
     * @tc.name testFloat64ArrayCallbackMutation073
     * @tc.desc Verify map result mutation remains isolated from the callback source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCallbackMutation073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(5.0, 6.0, 7.0);
      const mapped: Float64Array = arr.map((v: number, index: int, source: Float64Array): number => {
        if (index === 0) {
          source.$_set(1, 20.0);
        }
        return v;
      });
      mapped.$_set(0, 99.0);
      const actualElement0 = mapped.$_get(0);
      const expectedElement0: number = 99.0;
      expect(actualElement0).assertEqual(expectedElement0);
      const actualElement0Second = arr.$_get(0);
      const expectedElement0Second: number = 5.0;
      expect(actualElement0Second).assertEqual(expectedElement0Second);
      const actualElement1 = arr.$_get(1);
      const expectedElement1: number = 20.0;
      expect(actualElement1).assertEqual(expectedElement1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CALLBACK_MUTATION_7400
     * @tc.name testFloat64ArrayCallbackMutation074
     * @tc.desc Verify filter result remains independent after a callback source mutation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCallbackMutation074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(5.0, 6.0, 7.0);
      const filtered: Float64Array = arr.filter((v: number, index: int, source: Float64Array): boolean => {
        if (index === 0) {
          source.$_set(2, 30.0);
        }
        return true;
      });
      filtered.$_set(0, 99.0);
      const actualElement0 = filtered.$_get(0);
      const expectedElement0: number = 99.0;
      expect(actualElement0).assertEqual(expectedElement0);
      const actualElement0Second = arr.$_get(0);
      const expectedElement0Second: number = 5.0;
      expect(actualElement0Second).assertEqual(expectedElement0Second);
      const actualElement2 = arr.$_get(2);
      const expectedElement2: number = 30.0;
      expect(actualElement2).assertEqual(expectedElement2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CALLBACK_MUTATION_7500
     * @tc.name testFloat64ArrayCallbackMutation075
     * @tc.desc Verify map-filter chain propagates callback mutations only within each stage
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCallbackMutation075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(5.0, 6.0, 7.0);
      const mapped: Float64Array = arr.map((v: number, index: int, source: Float64Array): number => {
        if (index === 0) {
          source.$_set(2, 10.0);
        }
        return v * 2.0;
      });
      const filtered: Float64Array = mapped.filter((v: number, index: int, source: Float64Array): boolean => {
        if (index === 0) {
          source.$_set(1, 40.0);
        }
        return v >= 2.0;
      });
      const actualLength = filtered.length;
      const expectedLength: int = 3;
      expect(actualLength).assertEqual(expectedLength);
      const actualElement1 = filtered.$_get(1);
      const expectedElement1: number = 40.0;
      expect(actualElement1).assertEqual(expectedElement1);
      const actualElement1Second = mapped.$_get(1);
      const expectedElement1Second: number = 40.0;
      expect(actualElement1Second).assertEqual(expectedElement1Second);
      const actualElement2 = arr.$_get(2);
      const expectedElement2: number = 10.0;
      expect(actualElement2).assertEqual(expectedElement2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CALLBACK_MUTATION_7600
     * @tc.name testFloat64ArrayCallbackMutation076
     * @tc.desc Verify filter-map chain keeps view source mutation separate from the original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCallbackMutation076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(11.0, 12.0, 13.0, 14.0);
      const filtered: Float64Array = arr.filter((v: number, index: int, source: Float64Array): boolean => {
        if (index === 0) {
          source.$_set(3, 40.0);
        }
        return v > 11.0;
      });
      const mapped: Float64Array = filtered.map((v: number, index: int, source: Float64Array): number => {
        if (index === 0) {
          source.$_set(2, 30.0);
        }
        return v * 10.0;
      });
      const actualElement2 = mapped.$_get(2);
      const expectedElement2: number = 300.0;
      expect(actualElement2).assertEqual(expectedElement2);
      const actualElement2Second = filtered.$_get(2);
      const expectedElement2Second: number = 30.0;
      expect(actualElement2Second).assertEqual(expectedElement2Second);
      const actualElement3 = arr.$_get(3);
      const expectedElement3: number = 40.0;
      expect(actualElement3).assertEqual(expectedElement3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CALLBACK_MUTATION_7700
     * @tc.name testFloat64ArrayCallbackMutation077
     * @tc.desc Verify map-reduce chain consumes a callback-updated mapped value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCallbackMutation077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(12.0, 24.0, 36.0);
      const mapped: Float64Array = arr.map((v: number, index: int, source: Float64Array): number => {
        if (index === 0) {
          source.$_set(2, 10.0);
        }
        return v + 1.0;
      });
      const total: number = mapped.reduce((acc: number, v: number, index: int, source: Float64Array): number => {
        if (index === 0) {
          source.$_set(1, 30.0);
        }
        return acc + v;
      }, 0.0);
      const actualResult = total;
      const expectedResult: number = 54.0;
      expect(actualResult).assertEqual(expectedResult);
      const actualElement1 = mapped.$_get(1);
      const expectedElement1: number = 30.0;
      expect(actualElement1).assertEqual(expectedElement1);
      const actualElement2 = arr.$_get(2);
      const expectedElement2: number = 10.0;
      expect(actualElement2).assertEqual(expectedElement2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CALLBACK_MUTATION_7800
     * @tc.name testFloat64ArrayCallbackMutation078
     * @tc.desc Verify filter-reduceRight chain preserves reverse callback mutation order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCallbackMutation078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(-5.0, 10.0, 15.0, 20.0);
      const filtered: Float64Array = arr.filter((v: number, index: int, source: Float64Array): boolean => {
        if (index === 0) {
          source.$_set(2, 30.0);
        }
        return v % 2.0 === 0.0;
      });
      const total: number = filtered.reduceRight((acc: number, v: number, index: int, source: Float64Array): number => {
        if (index === 1) {
          source.$_set(0, 20.0);
        }
        return acc + v;
      }, 0.0);
      const actualResult = total;
      const expectedResult: number = 70.0;
      expect(actualResult).assertEqual(expectedResult);
      const actualElement0 = filtered.$_get(0);
      const expectedElement0: number = 20.0;
      expect(actualElement0).assertEqual(expectedElement0);
      const actualElement2 = arr.$_get(2);
      const expectedElement2: number = 30.0;
      expect(actualElement2).assertEqual(expectedElement2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CALLBACK_MUTATION_7900
     * @tc.name testFloat64ArrayCallbackMutation079
     * @tc.desc Verify map callback mutation reaches the last element of a critical-size array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCallbackMutation079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const size: int = 1024;
      const arr: Float64Array = new Float64Array(size);
      for (let i: int = 0; i < size; i++) {
        arr.$_set(i, i + 1);
      }
      let calls: int = 0;
      const mapped: Float64Array = arr.map((v: number, index: int, source: Float64Array): number => {
        calls++;
        if (index === 0) {
          source.$_set(size - 1, Number.MAX_VALUE);
        }
        return v;
      });
      expect(calls).assertEqual(size);
      const actualElementAtsize1 = mapped.$_get(size - 1);
      const expectedElementAtsize1: number = Number.MAX_VALUE;
      expect(actualElementAtsize1).assertEqual(expectedElementAtsize1);
      const actualElementAtsize1Second = arr.$_get(size - 1);
      const expectedElementAtsize1Second: number = Number.MAX_VALUE;
      expect(actualElementAtsize1Second).assertEqual(expectedElementAtsize1Second);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CALLBACK_MUTATION_8000
     * @tc.name testFloat64ArrayCallbackMutation080
     * @tc.desc Verify callback mutation preserves static radix and scientific literal values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCallbackMutation080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array(0x4);
      arr.$_set(0, 0b1);
      arr.$_set(0o1, 2e0);
      arr.$_set(0x2, 3.0e0);
      arr.$_set(3, 4.0e0);
      const mapped: Float64Array = arr.map((v: number, index: int, source: Float64Array): number => {
        if (index === 0) {
          source.$_set(0o3, 0x20 + 0b10);
        }
        return v;
      });
      const actualElement3 = mapped.$_get(3);
      const expectedElement3: number = 34.0;
      expect(actualElement3).assertEqual(expectedElement3);
      const actualElement3Second = arr.$_get(3);
      const expectedElement3Second: number = 34.0;
      expect(actualElement3Second).assertEqual(expectedElement3Second);
      const actualLength = mapped.length;
      const expectedLength: int = 0x4;
      expect(actualLength).assertEqual(expectedLength);
    });
  })
}
