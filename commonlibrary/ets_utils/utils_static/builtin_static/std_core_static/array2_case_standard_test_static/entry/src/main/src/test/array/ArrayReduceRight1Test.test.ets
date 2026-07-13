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
} from '@ohos/hypium-binary/src/main/indexStatic';
import Utils from '../Util.test';

class ReduceRightOneStats {
  sum: number = 0;
  count: int = 0;
}

class ReduceRightOneEntry {
  label: string = '';
  score: number = 0;
}

class ReduceRightOneIndexMap {
  a: number = -1;
  b: number = -1;
  c: number = -1;
}

function createReduceRightOneEntry(label: string, score: number): ReduceRightOneEntry {
  const item = new ReduceRightOneEntry();
  item.label = label;
  item.score = score;
  return item;
}

export default function ArrayReduceRight1Test(): void {
  describe('ArrayReduceRight1Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_RIGHT_ONE_0100
     * @tc.name testArrayReduceRightOne001
     * @tc.desc Verify reduceRight accepts callback and initial value parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceRightOne001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('a', 'b', 'c');
      const result = arr.reduceRight((acc: string, v: string): string => acc + v, '');
      expect(result).assertEqual('cba');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_RIGHT_ONE_0200
     * @tc.name testArrayReduceRightOne002
     * @tc.desc Verify the callback receives accumulator current index and source array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceRightOne002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const result = arr.reduceRight(
        (acc: number, v: number, i: int, a: Array<number>): number => {
          expect(a.length).assertEqual(3);
          expect(a === arr).assertTrue();
          expect(i >= 0).assertTrue();
          return acc + v;
        },
        0
      );
      expect(result).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_RIGHT_ONE_0300
     * @tc.name testArrayReduceRightOne003
     * @tc.desc Verify reduceRight returns the accumulated result type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceRightOne003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const sum = arr.reduceRight((acc: number, v: number): number => acc + v, 0);
      expect(sum).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_RIGHT_ONE_0400
     * @tc.name testArrayReduceRightOne004
     * @tc.desc Verify an empty array returns the initial value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceRightOne004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>();
      const result = arr.reduceRight((acc: string, v: string): string => acc + v, 'init');
      expect(result).assertEqual('init');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_RIGHT_ONE_0500
     * @tc.name testArrayReduceRightOne005
     * @tc.desc Verify a single-element array combines with the initial value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceRightOne005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.of<number>(100);
      const result = arr.reduceRight((acc: number, v: number): number => acc + v, 0);
      expect(result).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_RIGHT_ONE_0600
     * @tc.name testArrayReduceRightOne006
     * @tc.desc Verify reduceRight can reverse-concatenate string values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceRightOne006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('a', 'b', 'c', 'd');
      const result = arr.reduceRight((acc: string, v: string): string => acc + v, '');
      expect(result).assertEqual('dcba');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_RIGHT_ONE_0700
     * @tc.name testArrayReduceRightOne007
     * @tc.desc Verify reduceRight can perform right-to-left positional accumulation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceRightOne007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4);
      const result = arr.reduceRight((acc: number, v: number): number => acc * 10 + v, 0);
      expect(result).assertEqual(4321);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_RIGHT_ONE_0800
     * @tc.name testArrayReduceRightOne008
     * @tc.desc Verify reduceRight can compose functions from right to left
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceRightOne008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const functions = new Array<(x: number) => number>(
        (x: number): number => x + 1,
        (x: number): number => x * 2,
        (x: number): number => x - 1
      );
      const composed = (value: number): number => {
        return functions.reduceRight(
          (acc: number, fn: (x: number) => number): number => fn(acc),
          value
        );
      };
      const result = composed(5);
      expect(result).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_RIGHT_ONE_0900
     * @tc.name testArrayReduceRightOne009
     * @tc.desc Verify reduce and reduceRight differ only by traversal direction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceRightOne009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('a', 'b', 'c');
      const result1 = arr.reduce((acc: string, v: string): string => acc + v, '');
      const result2 = arr.reduceRight((acc: string, v: string): string => acc + v, '');
      expect(result1).assertEqual('abc');
      expect(result2).assertEqual('cba');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_RIGHT_ONE_1000
     * @tc.name testArrayReduceRightOne010
     * @tc.desc Verify addition gives the same result for reduce and reduceRight
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceRightOne010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4);
      const sum1 = arr.reduce((acc: number, v: number): number => acc + v, 0);
      const sum2 = arr.reduceRight((acc: number, v: number): number => acc + v, 0);
      expect(sum1).assertEqual(sum2);
      expect(sum2).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_RIGHT_ONE_1100
     * @tc.name testArrayReduceRightOne011
     * @tc.desc Verify the initial value type determines the inferred result type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceRightOne011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const result1 = arr.reduceRight((acc: string, v: number): string => acc + v.toString(), '');
      const result2 = arr.reduceRight((acc: number, v: number): number => acc + v, 0);
      expect(typeof result1).assertEqual('string');
      expect(typeof result2).assertEqual('number');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_RIGHT_ONE_1200
     * @tc.name testArrayReduceRightOne012
     * @tc.desc Verify reduceRight visits the rightmost index first
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceRightOne012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5);
      let firstVisitedIndex = -1;
      const result = arr.reduceRight((acc: number, v: number, i: int): number => {
        if (firstVisitedIndex < 0) {
          firstVisitedIndex = i;
        }
        return acc + v;
      }, 0);
      expect(firstVisitedIndex).assertEqual(4);
      expect(result).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_RIGHT_ONE_1300
     * @tc.name testArrayReduceRightOne013
     * @tc.desc Verify reduceRight can find the last matching index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceRightOne013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 2, 1);
      const lastEvenIndex = arr.reduceRight((acc: int, v: number, i: int): int => {
        return acc >= 0 ? acc : (v % 2 === 0 ? i : acc);
      }, -1);
      expect(lastEvenIndex >= 0).assertTrue();
      expect(lastEvenIndex).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_RIGHT_ONE_1400
     * @tc.name testArrayReduceRightOne014
     * @tc.desc Verify reduceRight and reduce produce equal sums on large arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceRightOne014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>();
      for (let i: int = 0; i < 1000; i++) {
        arr.pushOne(i);
      }
      const start1 = Date.now();
      const sum1 = arr.reduce((acc: number, v: number): number => acc + v, 0);
      const end1 = Date.now();
      const start2 = Date.now();
      const sum2 = arr.reduceRight((acc: number, v: number): number => acc + v, 0);
      const end2 = Date.now();
      expect(sum1).assertEqual(sum2);
      expect(end1 >= start1).assertTrue();
      expect(end2 >= start2).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_RIGHT_ONE_1500
     * @tc.name testArrayReduceRightOne015
     * @tc.desc Verify reduceRight invokes the callback once for each element when an initial value exists
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceRightOne015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4);
      let callbackCount = 0;
      const result = arr.reduceRight((acc: number, v: number): number => {
        callbackCount++;
        return acc + v;
      }, 0);
      expect(callbackCount).assertEqual(4);
      expect(result).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_RIGHT_ONE_1600
     * @tc.name testArrayReduceRightOne016
     * @tc.desc Verify reduceRight visits indexes in descending order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceRightOne016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(10, 20, 30, 40);
      const visitedIndexes = new Array<number>();
      const result = arr.reduceRight((acc: number, v: number, i: int): number => {
        visitedIndexes.pushOne(i);
        return acc + v;
      }, 0);
      expect(visitedIndexes.join(',')).assertEqual('3,2,1,0');
      expect(result).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_RIGHT_ONE_1700
     * @tc.name testArrayReduceRightOne017
     * @tc.desc Verify reduceRight visits values from the rightmost element to the leftmost element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceRightOne017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(10, 20, 30, 40);
      const visitedValues = new Array<number>();
      const result = arr.reduceRight((acc: number, v: number): number => {
        visitedValues.pushOne(v);
        return acc + v;
      }, 0);
      expect(visitedValues.join(',')).assertEqual('40,30,20,10');
      expect(result).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_RIGHT_ONE_1800
     * @tc.name testArrayReduceRightOne018
     * @tc.desc Verify the last callback invocation reaches index zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceRightOne018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(5, 6, 7, 8);
      let lastVisitedIndex = -1;
      const result = arr.reduceRight((acc: number, v: number, i: int): number => {
        lastVisitedIndex = i;
        return acc + v;
      }, 0);
      expect(lastVisitedIndex).assertEqual(0);
      expect(result).assertEqual(26);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_RIGHT_ONE_1900
     * @tc.name testArrayReduceRightOne019
     * @tc.desc Verify the source array reference stays stable for every callback invocation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceRightOne019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(7, 8, 9);
      let sameReferenceCount = 0;
      const result = arr.reduceRight(
        (acc: number, v: number, _i: int, source: Array<number>): number => {
          if (source === arr) {
            sameReferenceCount++;
          }
          return acc + v;
        },
        0
      );
      expect(sameReferenceCount).assertEqual(3);
      expect(result).assertEqual(24);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_RIGHT_ONE_2000
     * @tc.name testArrayReduceRightOne020
     * @tc.desc Verify a pure reduceRight callback does not mutate the original array content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceRightOne020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(2, 4, 6);
      const snapshot = arr.join(',');
      const result = arr.reduceRight((acc: number, v: number): number => acc + v, 0);
      expect(arr.join(',')).assertEqual(snapshot);
      expect(result).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_RIGHT_ONE_2100
     * @tc.name testArrayReduceRightOne021
     * @tc.desc Verify an empty array with an initial value does not invoke the callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceRightOne021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>();
      let callbackCount = 0;
      const result = arr.reduceRight((acc: number, v: number): number => {
        callbackCount++;
        return acc + v;
      }, 123);
      expect(callbackCount).assertEqual(0);
      expect(result).assertEqual(123);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_RIGHT_ONE_2200
     * @tc.name testArrayReduceRightOne022
     * @tc.desc Verify appending elements during reduceRight does not add new visits beyond the initial length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceRightOne022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const visitedValues = new Array<number>();
      const result = arr.reduceRight((acc: number, v: number, i: int): number => {
        if (i === 2) {
          arr.pushOne(99);
        }
        visitedValues.pushOne(v);
        return acc + v;
      }, 0);
      expect(visitedValues.join(',')).assertEqual('3,2,1');
      expect(arr.length).assertEqual(4);
      expect(result).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_RIGHT_ONE_2300
     * @tc.name testArrayReduceRightOne023
     * @tc.desc Verify mutating an unvisited element affects the value observed when that index is reached
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceRightOne023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const visitedValues = new Array<number>();
      const result = arr.reduceRight((acc: number, v: number, i: int): number => {
        if (i === 2) {
          arr[0] = 100;
        }
        visitedValues.pushOne(v);
        return acc + v;
      }, 0);
      expect(visitedValues.join(',')).assertEqual('3,2,100');
      expect(result).assertEqual(105);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_RIGHT_ONE_2400
     * @tc.name testArrayReduceRightOne024
     * @tc.desc Verify shrinking the array length removes later unvisited indexes from traversal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceRightOne024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4);
      const visitedIndexes = new Array<number>();
      const result = arr.reduceRight((acc: number, v: number, i: int): number => {
        if (i === 3) {
          arr.length = 2;
        }
        visitedIndexes.pushOne(i);
        return acc + v;
      }, 0);
      expect(visitedIndexes.join(',')).assertEqual('3,1,0');
      expect(arr.length).assertEqual(2);
      expect(result).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_RIGHT_ONE_2500
     * @tc.name testArrayReduceRightOne025
     * @tc.desc Verify the current callback value remains stable even if the same slot is overwritten
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceRightOne025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(5, 6, 7);
      const visitedValues = new Array<number>();
      const result = arr.reduceRight((acc: number, v: number, i: int): number => {
        if (i === 2) {
          arr[2] = 70;
        }
        visitedValues.pushOne(v);
        return acc + v;
      }, 0);
      expect(visitedValues.join(',')).assertEqual('7,6,5');
      expect(arr[2]).assertEqual(70);
      expect(result).assertEqual(18);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_RIGHT_ONE_2600
     * @tc.name testArrayReduceRightOne026
     * @tc.desc Verify an empty array returns the initial value without callback execution
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceRightOne026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>();
      let callbackCount = 0;
      const result = arr.reduceRight((acc: number, v: number): number => {
        callbackCount++;
        return acc + v;
      }, 11);
      expect(callbackCount).assertEqual(0);
      expect(result).assertEqual(11);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_RIGHT_ONE_2700
     * @tc.name testArrayReduceRightOne027
     * @tc.desc Verify reduceRight can flatten nested arrays while preserving each segment order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceRightOne027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const segments = new Array<Array<number>>(
        Array.of<number>(1, 2),
        Array.of<number>(3),
        Array.of<number>(4, 5)
      );
      const result = segments.reduceRight((acc: Array<number>, segment: Array<number>): Array<number> => {
        for (let i: int = 0; i < segment.length; i++) {
          acc.pushOne(segment[i]);
        }
        return acc;
      }, new Array<number>());
      expect(result.length).assertEqual(5);
      expect(result.join(',')).assertEqual('4,5,3,1,2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_RIGHT_ONE_2800
     * @tc.name testArrayReduceRightOne028
     * @tc.desc Verify reduceRight can encode both indexes and values into a single trace string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceRightOne028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(5, 7, 9);
      const result = arr.reduceRight((acc: string, v: number, i: int): string => {
        return acc + '[' + i.toString() + ':' + v.toString() + ']';
      }, '');
      expect(result).assertEqual('[2:9][1:7][0:5]');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_RIGHT_ONE_2900
     * @tc.name testArrayReduceRightOne029
     * @tc.desc Verify a boolean accumulator can confirm that every element is positive
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceRightOne029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4);
      const result = arr.reduceRight((acc: boolean, v: number): boolean => {
        return acc && v > 0;
      }, true);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_RIGHT_ONE_3000
     * @tc.name testArrayReduceRightOne030
     * @tc.desc Verify a boolean accumulator can detect whether at least one element satisfies a predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceRightOne030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 7, 12, 14, 20);
      const result = arr.reduceRight((acc: boolean, v: number): boolean => {
        return acc || v % 5 === 0;
      }, false);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_RIGHT_ONE_3100
     * @tc.name testArrayReduceRightOne031
     * @tc.desc Verify reduceRight can compute a weighted sum using the current index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceRightOne031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(2, 4, 6);
      const result = arr.reduceRight((acc: number, v: number, i: int): number => {
        return acc + v * (i + 1);
      }, 0);
      expect(result).assertEqual(28);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_RIGHT_ONE_3200
     * @tc.name testArrayReduceRightOne032
     * @tc.desc Verify reduceRight can build a reverse path string from ordered path segments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceRightOne032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const segments = new Array<string>('root', 'feature', 'file.ts');
      const result = segments.reduceRight((acc: string, v: string): string => {
        return acc.length === 0 ? v : acc + '/' + v;
      }, '');
      expect(result).assertEqual('file.ts/feature/root');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_RIGHT_ONE_3300
     * @tc.name testArrayReduceRightOne033
     * @tc.desc Verify reduceRight can select the last matching element using an explicit fallback initial value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceRightOne033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(3, 8, 5, 12, 7);
      const result = arr.reduceRight((acc: number, v: number): number => {
        if (acc >= 0) {
          return acc;
        }
        return v % 4 === 0 ? v : -1;
      }, -1);
      expect(result).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_RIGHT_ONE_3400
     * @tc.name testArrayReduceRightOne034
     * @tc.desc Verify reduceRight can accumulate into a class instance while preserving accumulator identity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceRightOne034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(2, 4, 6, 8);
      const seed = new ReduceRightOneStats();
      const result = arr.reduceRight((acc: ReduceRightOneStats, v: number): ReduceRightOneStats => {
        acc.sum += v;
        acc.count += 1;
        return acc;
      }, seed);
      expect(result === seed).assertTrue();
      expect(result.sum).assertEqual(20);
      expect(result.count).assertEqual(4);
      expect(result.sum / result.count).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_RIGHT_ONE_3500
     * @tc.name testArrayReduceRightOne035
     * @tc.desc Verify reduceRight can keep the rightmost highest-scoring entry when equal scores occur
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceRightOne035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const entries = new Array<ReduceRightOneEntry>(
        createReduceRightOneEntry('alpha', 90),
        createReduceRightOneEntry('beta', 95),
        createReduceRightOneEntry('gamma', 95),
        createReduceRightOneEntry('delta', 88)
      );
      const seed = createReduceRightOneEntry('seed', -1);
      const result = entries.reduceRight(
        (acc: ReduceRightOneEntry, v: ReduceRightOneEntry): ReduceRightOneEntry => {
          return acc.score >= v.score ? acc : v;
        },
        seed
      );
      expect(result.label).assertEqual('gamma');
      expect(result.score).assertEqual(95);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_RIGHT_ONE_3600
     * @tc.name testArrayReduceRightOne036
     * @tc.desc Verify reduceRight matches reduce on a toReversed copy when the reducer is the same
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceRightOne036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('x', 'y', 'z');
      const reduceRightResult = arr.reduceRight((acc: string, v: string): string => acc + v, '');
      const reversedReduceResult = arr.toReversed().reduce(
        (acc: string, v: string): string => acc + v,
        ''
      );
      expect(reduceRightResult).assertEqual(reversedReduceResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_RIGHT_ONE_3700
     * @tc.name testArrayReduceRightOne037
     * @tc.desc Verify reduceRight matches reduce on a reversed slice copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceRightOne037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('a', 'b', 'c', 'd');
      const copy = arr.slice(0);
      copy.reverse();
      const reduceRightResult = arr.reduceRight((acc: string, v: string): string => acc + v, '');
      const reversedCopyResult = copy.reduce((acc: string, v: string): string => acc + v, '');
      expect(reduceRightResult).assertEqual(reversedCopyResult);
      expect(arr.join(',')).assertEqual('a,b,c,d');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_RIGHT_ONE_3800
     * @tc.name testArrayReduceRightOne038
     * @tc.desc Verify reduceRight works correctly after filtering the source array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceRightOne038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5, 6);
      const result = arr.filter((v: number): boolean => v % 2 === 0).reduceRight(
        (acc: string, v: number): string => acc + v.toString(),
        ''
      );
      expect(result).assertEqual('642');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_RIGHT_ONE_3900
     * @tc.name testArrayReduceRightOne039
     * @tc.desc Verify reduceRight works correctly on the result of map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceRightOne039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const result = arr.map((v: number): number => v * 2).reduceRight(
        (acc: number, v: number): number => acc + v,
        0
      );
      expect(result).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_RIGHT_ONE_4000
     * @tc.name testArrayReduceRightOne040
     * @tc.desc Verify reduceRight can be chained after map and filter for transformed data
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceRightOne040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const words = new Array<string>('go', 'array', 'reduce', 'xts');
      const result = words.map((v: string): number => v.length).filter((v: number): boolean => v > 3).reduceRight(
        (acc: string, v: number): string => acc + v.toString(),
        ''
      );
      expect(result).assertEqual('65');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_RIGHT_ONE_4100
     * @tc.name testArrayReduceRightOne041
     * @tc.desc Verify a single-element array can still participate in a nontrivial calculation with an initial value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceRightOne041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.of<number>(8);
      const result = arr.reduceRight((acc: number, v: number): number => acc - v, 50);
      expect(result).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_RIGHT_ONE_4200
     * @tc.name testArrayReduceRightOne042
     * @tc.desc Verify a non-zero initial value offsets the final sum result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceRightOne042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const result = arr.reduceRight((acc: number, v: number): number => acc + v, 10);
      expect(result).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_RIGHT_ONE_4300
     * @tc.name testArrayReduceRightOne043
     * @tc.desc Verify reduceRight can accumulate absolute values from mixed-sign numbers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceRightOne043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(-1, 2, -3, 4);
      const result = arr.reduceRight((acc: number, v: number): number => {
        return acc + (v < 0 ? -v : v);
      }, 0);
      expect(result).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_RIGHT_ONE_4400
     * @tc.name testArrayReduceRightOne044
     * @tc.desc Verify reduceRight can build a right-associated expression string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceRightOne044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('a', 'b', 'c');
      const result = arr.reduceRight((acc: string, v: string): string => {
        return '(' + v + '>' + acc + ')';
      }, 'end');
      expect(result).assertEqual('(a>(b>(c>end)))');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_RIGHT_ONE_4500
     * @tc.name testArrayReduceRightOne045
     * @tc.desc Verify reduceRight can produce running suffix sums inside an array accumulator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceRightOne045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4);
      const result = arr.reduceRight((acc: Array<number>, v: number): Array<number> => {
        let next = v;
        if (acc.length > 0) {
          next += acc[acc.length - 1];
        }
        acc.pushOne(next);
        return acc;
      }, new Array<number>());
      expect(result.length).assertEqual(4);
      expect(result.join(',')).assertEqual('4,7,9,10');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_RIGHT_ONE_4600
     * @tc.name testArrayReduceRightOne046
     * @tc.desc Verify reduceRight can aggregate row totals from a matrix starting with the last row
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceRightOne046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const matrix = new Array<Array<number>>(
        Array.of<number>(1, 2),
        Array.of<number>(3, 4),
        Array.of<number>(5, 6)
      );
      const visitedRowSums = new Array<number>();
      const result = matrix.reduceRight((acc: number, row: Array<number>): number => {
        const rowSum = row.reduce((rowAcc: number, v: number): number => rowAcc + v, 0);
        visitedRowSums.pushOne(rowSum);
        return acc + rowSum;
      }, 0);
      expect(visitedRowSums.join(',')).assertEqual('11,7,3');
      expect(result).assertEqual(21);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_RIGHT_ONE_4700
     * @tc.name testArrayReduceRightOne047
     * @tc.desc Verify reduceRight can append into a prefilled accumulator array without discarding the seed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceRightOne047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const seed = Array.of<number>(999);
      const result = arr.reduceRight((acc: Array<number>, v: number): Array<number> => {
        acc.pushOne(v);
        return acc;
      }, seed);
      expect(result.length).assertEqual(4);
      expect(result.join(',')).assertEqual('999,3,2,1');
      expect(result === seed).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_RIGHT_ONE_4800
     * @tc.name testArrayReduceRightOne048
     * @tc.desc Verify reduceRight can process a sliced subrange independently from the original array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceRightOne048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5);
      const result = arr.slice(1, 4).reduceRight((acc: number, v: number): number => {
        return acc * 2 + v;
      }, 0);
      expect(result).assertEqual(24);
      expect(arr.join(',')).assertEqual('1,2,3,4,5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_RIGHT_ONE_4900
     * @tc.name testArrayReduceRightOne049
     * @tc.desc Verify reduceRight can accumulate index-based information on a larger ordered array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceRightOne049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>();
      for (let i: int = 1; i <= 6; i++) {
        arr.pushOne(i);
      }
      const result = arr.reduceRight((acc: number, v: number, i: int): number => {
        return v % 2 === 1 ? acc + i : acc;
      }, 0);
      expect(result).assertEqual(6);
      expect(arr.length).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_RIGHT_ONE_5000
     * @tc.name testArrayReduceRightOne050
     * @tc.desc Verify reduceRight with an initial value matches a manual right-to-left loop
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceRightOne050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(3, 1, 4, 1, 5);
      let manual = 10;
      for (let i: int = arr.length - 1; i >= 0; i--) {
        manual += arr[i];
      }
      const reduced = arr.reduceRight((acc: number, v: number): number => acc + v, 10);
      expect(reduced).assertEqual(manual);
      expect(reduced).assertEqual(24);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_RIGHT_ONE_5100
     * @tc.name testArrayReduceRightOne051
     * @tc.desc Verify reduceRight can count truthy boolean values into a numeric accumulator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceRightOne051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<boolean>(true, false, true, true);
      const result = arr.reduceRight((acc: number, v: boolean): number => {
        return v ? acc + 1 : acc;
      }, 0);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_RIGHT_ONE_5200
     * @tc.name testArrayReduceRightOne052
     * @tc.desc Verify reduceRight can combine grouped word segments from the last group to the first group
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceRightOne052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const groups = new Array<Array<string>>(
        Array.of<string>('oh'),
        Array.of<string>('xts', 'ark'),
        Array.of<string>('ts')
      );
      const result = groups.reduceRight((acc: string, group: Array<string>): string => {
        const current = group.join('-');
        return acc.length === 0 ? current : acc + '|' + current;
      }, '');
      expect(result).assertEqual('ts|xts-ark|oh');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_RIGHT_ONE_5300
     * @tc.name testArrayReduceRightOne053
     * @tc.desc Verify reduceRight can concatenate numeric triple 2, 3, 4 from right to left
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceRightOne053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(2, 3, 4);
      const result = arr.reduceRight((acc: string, value: number): string => acc + value.toString(), '');
      expect(result.toString()).assertEqual('432');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_RIGHT_ONE_5400
     * @tc.name testArrayReduceRightOne054
     * @tc.desc Verify reduceRight can concatenate numeric triple 8, 9, 10 from right to left
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceRightOne054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(8, 9, 10);
      const result = arr.reduceRight((acc: string, value: number): string => acc + value.toString(), '');
      expect(result.toString()).assertEqual('1098');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_RIGHT_ONE_5500
     * @tc.name testArrayReduceRightOne055
     * @tc.desc Verify reduceRight callback indexes are visited from right to left with an initial value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceRightOne055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(2, 3, 4);
      let indexes = '';
      const result = arr.reduceRight((acc: number, value: number, index: int): number => {
        indexes += index.toString();
        return acc + value * (index + 1);
      }, 0);
      expect(indexes).assertEqual('210');
      expect(result).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_RIGHT_ONE_5600
     * @tc.name testArrayReduceRightOne056
     * @tc.desc Verify reduceRight sums a number array with an initial zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceRightOne056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4);
      const result = arr.reduceRight((acc: number, cur: number): number => acc + cur, 0);
      expect(result).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_RIGHT_ONE_5700
     * @tc.name testArrayReduceRightOne057
     * @tc.desc Verify reduceRight concatenates string values in right-to-left order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceRightOne057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('a', 'b', 'c');
      const result = arr.reduceRight((acc: string, cur: string): string => acc + cur, '');
      expect(result).assertEqual("cba");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_RIGHT_ONE_5800
     * @tc.name testArrayReduceRightOne058
     * @tc.desc Verify reduceRight exposes the source array to the callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceRightOne058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(5, 6, 7);
      let same = false;
      arr.reduceRight((acc: number, cur: number, index: int, source: Array<number>): number => { same = source === arr; return acc + cur; }, 0);
      expect(same).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_RIGHT_ONE_5900
     * @tc.name testArrayReduceRightOne059
     * @tc.desc Verify reduceRight records traversal indexes in callback order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceRightOne059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(10, 20, 30);
      let text = '';
      arr.reduceRight((acc: number, cur: number, index: int): number => { text += index.toString(); return acc + cur; }, 0);
      expect(text).assertEqual("210");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_RIGHT_ONE_6000
     * @tc.name testArrayReduceRightOne060
     * @tc.desc Verify reduceRight multiplies numeric values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceRightOne060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(2, 3, 4);
      const result = arr.reduceRight((acc: number, cur: number): number => acc * cur, 1);
      expect(result).assertEqual(24);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_RIGHT_ONE_6100
     * @tc.name testArrayReduceRightOne061
     * @tc.desc Verify reduceRight can accumulate into an object map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceRightOne061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('a', 'b', 'c');
      const result = arr.reduceRight((acc: ReduceRightOneIndexMap, cur: string, index: int): ReduceRightOneIndexMap => { if (cur === 'a') { acc.a = index; } else if (cur === 'b') { acc.b = index; } else { acc.c = index; } return acc; }, new ReduceRightOneIndexMap());
      expect(result.a).assertEqual(0);
      expect(result.c).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_RIGHT_ONE_6200
     * @tc.name testArrayReduceRightOne062
     * @tc.desc Verify reduceRight can flatten nested arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceRightOne062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<Array<number>>(new Array<number>(1, 2), new Array<number>(3, 4));
      const result = arr.reduceRight((acc: Array<number>, cur: Array<number>): Array<number> => acc.concat(cur), new Array<number>());
      expect(result.toString()).assertEqual("3,4,1,2");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_RIGHT_ONE_6300
     * @tc.name testArrayReduceRightOne063
     * @tc.desc Verify reduceRight works on a single-element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceRightOne063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<number>(1, 9);
      let calls = 0;
      const result = arr.reduceRight((acc: number, cur: number): number => { calls++; return acc + cur; }, 1);
      expect(result).assertEqual(10);
      expect(calls).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_RIGHT_ONE_6400
     * @tc.name testArrayReduceRightOne064
     * @tc.desc Verify reduceRight handles duplicate numbers without collapsing iterations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceRightOne064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(2, 2, 2);
      const result = arr.reduceRight((acc: number, cur: number): number => acc + cur, 0);
      expect(result).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_RIGHT_ONE_6500
     * @tc.name testArrayReduceRightOne065
     * @tc.desc Verify reduceRight handles negative values and zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceRightOne065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(-2, 0, 5);
      const result = arr.reduceRight((acc: number, cur: number): number => acc + cur, 0);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_RIGHT_ONE_6600
     * @tc.name testArrayReduceRightOne066
     * @tc.desc Verify reduceRight can count true booleans
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceRightOne066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<boolean>(true, false, true, true);
      const result = arr.reduceRight((acc: number, cur: boolean): number => cur ? acc + 1 : acc, 0);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_RIGHT_ONE_6700
     * @tc.name testArrayReduceRightOne067
     * @tc.desc Verify reduceRight can convert numbers into a hyphen-separated string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceRightOne067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const result = arr.reduceRight((acc: string, cur: number): string => acc.length === 0 ? cur.toString() : cur.toString() + '-' + acc, '');
      expect(result).assertEqual("1-2-3");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_RIGHT_ONE_6800
     * @tc.name testArrayReduceRightOne068
     * @tc.desc Verify reduceRight can read arrays produced by slice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceRightOne068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4).slice(1, 4);
      const result = arr.reduceRight((acc: number, cur: number): number => acc + cur, 0);
      expect(result).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_RIGHT_ONE_6900
     * @tc.name testArrayReduceRightOne069
     * @tc.desc Verify reduceRight can read arrays produced by filter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceRightOne069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5).filter((value: number): boolean => value >= 3);
      const result = arr.reduceRight((acc: number, cur: number): number => acc + cur, 0);
      expect(result).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_RIGHT_ONE_7000
     * @tc.name testArrayReduceRightOne070
     * @tc.desc Verify reduceRight can read arrays produced by concat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceRightOne070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2).concat(new Array<number>(3, 4));
      const result = arr.reduceRight((acc: number, cur: number): number => acc + cur, 0);
      expect(result).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_RIGHT_ONE_7100
     * @tc.name testArrayReduceRightOne071
     * @tc.desc Verify reduceRight can read arrays produced by toReversed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceRightOne071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3).toReversed();
      const result = arr.reduceRight((acc: string, cur: number): string => acc + cur.toString(), '');
      expect(result).assertEqual("123");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_RIGHT_ONE_7200
     * @tc.name testArrayReduceRightOne072
     * @tc.desc Verify reduceRight can read arrays produced by with
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceRightOne072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3).with(1, 9);
      const result = arr.reduceRight((acc: number, cur: number): number => acc + cur, 0);
      expect(result).assertEqual(13);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_RIGHT_ONE_7300
     * @tc.name testArrayReduceRightOne073
     * @tc.desc Verify reduceRight can read arrays produced by toSpliced
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceRightOne073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3).toSpliced(1, 1, 7, 8);
      const result = arr.reduceRight((acc: number, cur: number): number => acc + cur, 0);
      expect(result).assertEqual(19);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_RIGHT_ONE_7400
     * @tc.name testArrayReduceRightOne074
     * @tc.desc Verify reduceRight can read arrays mutated by reverse before reduction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceRightOne074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      arr.reverse();
      const result = arr.reduceRight((acc: string, cur: number): string => acc + cur.toString(), '');
      expect(result).assertEqual("123");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_RIGHT_ONE_7500
     * @tc.name testArrayReduceRightOne075
     * @tc.desc Verify reduceRight can read arrays mutated by sort before reduction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceRightOne075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(3, 1, 2);
      arr.sort((left: number, right: number): int => {
        if (left < right) {
          return -1;
        }
        if (left > right) {
          return 1;
        }
        return 0;
      });
      const result = arr.reduceRight((acc: string, cur: number): string => acc + cur.toString(), '');
      expect(result).assertEqual("321");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_RIGHT_ONE_7600
     * @tc.name testArrayReduceRightOne076
     * @tc.desc Verify reduceRight can read arrays after shift changes the head
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceRightOne076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4);
      arr.shift();
      const result = arr.reduceRight((acc: number, cur: number): number => acc + cur, 0);
      expect(result).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_RIGHT_ONE_7700
     * @tc.name testArrayReduceRightOne077
     * @tc.desc Verify reduceRight can read arrays after pop changes the tail
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceRightOne077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4);
      arr.pop();
      const result = arr.reduceRight((acc: number, cur: number): number => acc + cur, 0);
      expect(result).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_RIGHT_ONE_7800
     * @tc.name testArrayReduceRightOne078
     * @tc.desc Verify reduceRight can read arrays after unshift prepends values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceRightOne078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(3, 4);
      arr.unshift(1, 2);
      const result = arr.reduceRight((acc: number, cur: number): number => acc + cur, 0);
      expect(result).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_RIGHT_ONE_7900
     * @tc.name testArrayReduceRightOne079
     * @tc.desc Verify reduceRight can read arrays after push appends values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceRightOne079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2);
      arr.push(3, 4);
      const result = arr.reduceRight((acc: number, cur: number): number => acc + cur, 0);
      expect(result).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_RIGHT_ONE_8000
     * @tc.name testArrayReduceRightOne080
     * @tc.desc Verify reduceRight can read arrays after splice replacement
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceRightOne080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      arr.splice(1, 1, 8, 9);
      const result = arr.reduceRight((acc: number, cur: number): number => acc + cur, 0);
      expect(result).assertEqual(21);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_RIGHT_ONE_8100
     * @tc.name testArrayReduceRightOne081
     * @tc.desc Verify reduceRight can read arrays after shrinkTo truncates the tail
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceRightOne081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4);
      arr.shrinkTo(2);
      const result = arr.reduceRight((acc: number, cur: number): number => acc + cur, 0);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_RIGHT_ONE_8200
     * @tc.name testArrayReduceRightOne082
     * @tc.desc Verify reduceRight can read arrays rebuilt after clearing length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceRightOne082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      arr.length = 0;
      arr.pushOne(7);
      arr.pushOne(8);
      const result = arr.reduceRight((acc: number, cur: number): number => acc + cur, 0);
      expect(result).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_RIGHT_ONE_8300
     * @tc.name testArrayReduceRightOne083
     * @tc.desc Verify reduceRight can read arrays created by Array.of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceRightOne083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.of<number>(4, 5, 6);
      const result = arr.reduceRight((acc: number, cur: number): number => acc + cur, 0);
      expect(result).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_RIGHT_ONE_8400
     * @tc.name testArrayReduceRightOne084
     * @tc.desc Verify reduceRight can read arrays created by Array.from
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceRightOne084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.from<number>(new Array<number>(2, 4, 6));
      const result = arr.reduceRight((acc: number, cur: number): number => acc + cur, 0);
      expect(result).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_RIGHT_ONE_8500
     * @tc.name testArrayReduceRightOne085
     * @tc.desc Verify reduceRight can count callback calls on a large generated array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceRightOne085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>();
      for (let i: int = 0; i < 15; i++) {
        arr.pushOne(i);
      }
      let calls = 0;
      arr.reduceRight((acc: number, cur: number): number => { calls++; return acc + cur; }, 0);
      expect(calls).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_RIGHT_ONE_8600
     * @tc.name testArrayReduceRightOne086
     * @tc.desc Verify reduceRight preserves the source array text after accumulation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceRightOne086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(4, 5, 6);
      const before = arr.toString();
      arr.reduceRight((acc: number, cur: number): number => acc + cur, 0);
      expect(arr.toString()).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_RIGHT_ONE_8700
     * @tc.name testArrayReduceRightOne087
     * @tc.desc Verify reduceRight can compute a checksum from value and index pairs
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceRightOne087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(2, 4, 6);
      const result = arr.reduceRight((acc: number, cur: number, index: int): number => acc + cur * (index + 1), 0);
      expect(result).assertEqual(28);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_RIGHT_ONE_8800
     * @tc.name testArrayReduceRightOne088
     * @tc.desc Verify reduceRight can count elements with a predicate accumulator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceRightOne088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5);
      const result = arr.reduceRight((acc: number, cur: number): number => cur % 2 === 0 ? acc + 1 : acc, 0);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_RIGHT_ONE_8900
     * @tc.name testArrayReduceRightOne089
     * @tc.desc Verify reduceRight can accumulate absolute values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceRightOne089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(-2, -3, 4);
      const result = arr.reduceRight((acc: number, cur: number): number => acc + Math.abs(cur), 0);
      expect(result).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_RIGHT_ONE_9000
     * @tc.name testArrayReduceRightOne090
     * @tc.desc Verify reduceRight can operate on a toSorted copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceRightOne090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(4, 1, 3, 2).toSorted((left: number, right: number): int => {
        if (left < right) {
          return -1;
        }
        if (left > right) {
          return 1;
        }
        return 0;
      });
      const result = arr.reduceRight((acc: string, cur: number): string => acc + cur.toString(), '');
      expect(result).assertEqual("4321");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_RIGHT_ONE_9100
     * @tc.name testArrayReduceRightOne091
     * @tc.desc Verify reduceRight can operate on a copied tail from slice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceRightOne091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(9, 8, 7, 6).slice(1);
      const result = arr.reduceRight((acc: number, cur: number): number => acc + cur, 0);
      expect(result).assertEqual(21);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_RIGHT_ONE_9200
     * @tc.name testArrayReduceRightOne092
     * @tc.desc Verify reduceRight can accumulate a string array built by Array.from
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceRightOne092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.from<string>('ark');
      const result = arr.reduceRight((acc: string, cur: string): string => acc + cur, '');
      expect(result).assertEqual("kra");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_RIGHT_ONE_9300
     * @tc.name testArrayReduceRightOne093
     * @tc.desc Verify reduceRight can accumulate over a concat plus with pipeline
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceRightOne093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2).concat(new Array<number>(3, 4)).with(1, 9);
      const result = arr.reduceRight((acc: number, cur: number): number => acc + cur, 0);
      expect(result).assertEqual(17);
    });

  });
}

