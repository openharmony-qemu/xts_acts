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
import Utils from '../Util.test';

class IndexMap009 {
  a: number = -1;
  b: number = -1;
  c: number = -1;
}

function createRangeArray(size: int): Array<number> {
  const arr = new Array<number>();
  for (let i: int = 0; i < size; i++) {
    arr.pushOne(i);
  }
  return arr;
}

export default function ArrayReduce1Test(): void {
  describe('ArrayReduce1Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_ONE_0100
     * @tc.name testArrayReduceOne001
     * @tc.desc Verify reduce accepts a callback function
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceOne001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3);
      let sum = arr.reduce((acc: number, current: number): number => acc + current);
      expect(sum).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_ONE_0200
     * @tc.name testArrayReduceOne002
     * @tc.desc Verify the callback receives previous current index and array parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceOne002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3);
      let result = arr.reduce((acc: number, cur: number, i: int, a: Array<number>): number => {
        expect(a.length).assertEqual(3);
        expect(a === arr).assertTrue();
        expect(i >= 1).assertTrue();
        return acc + cur;
      });
      expect(result).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_ONE_0300
     * @tc.name testArrayReduceOne003
     * @tc.desc Verify reduce returns the accumulated result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceOne003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3, 4, 5);
      let sum = arr.reduce((acc: number, v: number): number => acc + v);
      expect(sum).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_ONE_0400
     * @tc.name testArrayReduceOne004
     * @tc.desc Verify the first iteration starts from the second element without an initial value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceOne004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(10, 20, 30);
      let firstIndex: int = 0;
      let firstAccumulator = 0.0;
      let firstValue = 0.0;
      arr.reduce((acc: number, v: number, i: int, _a: Array<number>): number => {
        if (firstIndex === 0) {
          firstIndex = i;
          firstAccumulator = acc;
          firstValue = v;
        }
        return acc + v;
      });
      expect(firstIndex).assertEqual(1);
      expect(firstAccumulator).assertEqual(10);
      expect(firstValue).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_ONE_0500
     * @tc.name testArrayReduceOne005
     * @tc.desc Verify reduce throws on an empty array without an initial value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceOne005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>();
      let thrown = false;
      try {
        arr.reduce((acc: number, v: number): number => acc + v);
      } catch (_e) {
        thrown = true;
      }
      expect(thrown).assertTrue();
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_ONE_0600
     * @tc.name testArrayReduceOne006
     * @tc.desc Verify a single-element array returns that element directly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceOne006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(100);
      let callbackCount = 0;
      let result = arr.reduce((acc: number, v: number): number => {
        callbackCount++;
        return acc + v;
      });
      expect(result).assertEqual(100);
      expect(callbackCount).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_ONE_0700
     * @tc.name testArrayReduceOne007
     * @tc.desc Verify a two-element array reduces to the combined value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceOne007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(10, 20);
      let result = arr.reduce((acc: number, v: number): number => acc + v);
      expect(result).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_ONE_0800
     * @tc.name testArrayReduceOne008
     * @tc.desc Verify reduce can multiply array elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceOne008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3, 4);
      let product = arr.reduce((acc: number, v: number): number => acc * v);
      expect(product).assertEqual(24);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_ONE_0900
     * @tc.name testArrayReduceOne009
     * @tc.desc Verify reduce can transform an array into an object with an explicit initial object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceOne009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<string>('a', 'b', 'c');
      let result = arr.reduce((acc: IndexMap009, v: string, i: int): IndexMap009 => {
        if (v === 'a') {
          acc.a = i;
        } else if (v === 'b') {
          acc.b = i;
        } else if (v === 'c') {
          acc.c = i;
        }
        return acc;
      }, new IndexMap009());
      expect(result.a).assertEqual(0);
      expect(result.c).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_ONE_1000
     * @tc.name testArrayReduceOne010
     * @tc.desc Verify reduce can flatten a two-dimensional array with an explicit accumulator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceOne010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nested = new Array<Array<number>>(new Array<number>(1, 2), new Array<number>(3, 4));
      let flattened = nested.reduce(
        (acc: Array<number>, v: Array<number>): Array<number> => acc.concat(v),
        new Array<number>()
      );
      expect(flattened.length).assertEqual(4);
      expect(flattened.toString()).assertEqual('1,2,3,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_ONE_1100
     * @tc.name testArrayReduceOne011
     * @tc.desc Verify the overload with an initial value produces the same sum more safely
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceOne011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3);
      let result1 = arr.reduce((acc: number, v: number): number => acc + v);
      let result2 = arr.reduce((acc: number, v: number): number => acc + v, 0);
      expect(result1).assertEqual(result2);
      expect(result2).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_ONE_1200
     * @tc.name testArrayReduceOne012
     * @tc.desc Verify reduce infers the result as a number for number arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceOne012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3);
      let result = arr.reduce((acc: number, v: number): number => acc + v);
      expect(typeof result).assertEqual('number');
      expect(result).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_ONE_1300
     * @tc.name testArrayReduceOne013
     * @tc.desc Verify reduce can sum negative numbers without an initial value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceOne013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(-2, -4, -6);
      const result = arr.reduce((acc: number, value: number): number => acc + value);
      expect(result).assertEqual(-12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_ONE_1400
     * @tc.name testArrayReduceOne014
     * @tc.desc Verify reduce can sum mixed-sign numbers without an initial value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceOne014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(10, -5, 2);
      const result = arr.reduce((acc: number, value: number): number => acc + value);
      expect(result).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_ONE_1500
     * @tc.name testArrayReduceOne015
     * @tc.desc Verify reduce can subtract values from left to right without an initial value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceOne015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(5, 1, 2);
      const result = arr.reduce((acc: number, value: number): number => acc - value);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_ONE_1600
     * @tc.name testArrayReduceOne016
     * @tc.desc Verify reduce can multiply numeric values without an initial value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceOne016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(2, 3, 4);
      const result = arr.reduce((acc: number, value: number): number => acc * value);
      expect(result).assertEqual(24);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_ONE_1700
     * @tc.name testArrayReduceOne017
     * @tc.desc Verify reduce can compute a maximum value without an initial value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceOne017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(5, 9, 1, 7);
      const result = arr.reduce((acc: number, value: number): number => acc > value ? acc : value);
      expect(result).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_ONE_1800
     * @tc.name testArrayReduceOne018
     * @tc.desc Verify reduce can compute a minimum value without an initial value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceOne018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(5, 9, 1, 7);
      const result = arr.reduce((acc: number, value: number): number => acc < value ? acc : value);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_ONE_1900
     * @tc.name testArrayReduceOne019
     * @tc.desc Verify reduce can apply division from left to right without an initial value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceOne019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(8, 4, 2);
      const result = arr.reduce((acc: number, value: number): number => acc / value);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_ONE_2000
     * @tc.name testArrayReduceOne020
     * @tc.desc Verify reduce can include zero values in sums without an initial value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceOne020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 0, 2, 0);
      const result = arr.reduce((acc: number, value: number): number => acc + value);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_ONE_2100
     * @tc.name testArrayReduceOne021
     * @tc.desc Verify reduce can work with two-element arrays without an initial value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceOne021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(9, 3);
      const result = arr.reduce((acc: number, value: number): number => acc - value);
      expect(result).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_ONE_2200
     * @tc.name testArrayReduceOne022
     * @tc.desc Verify reduce without an initial value starts callback iteration at index 1 for a two-element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceOne022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(10, 30);
      let indexes = new Array<int>();
      const result = arr.reduce((acc: number, value: number, index: int): number => {
        indexes.pushOne(index);
        return acc + value;
      });
      expect(result).assertEqual(40);
      expect(indexes.toString()).assertEqual('1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_ONE_2300
     * @tc.name testArrayReduceOne023
     * @tc.desc Verify sparse arrays with a single present element return that element without callback calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceOne023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(99);
      let calls = 0;
      const result = arr.reduce((acc: number, value: number): number => {
        calls++;
        return acc + value;
      });
      expect(result).assertEqual(99);
      expect(calls).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_ONE_2400
     * @tc.name testArrayReduceOne024
     * @tc.desc Verify reduce with an initial value visits indexes 0 and 1 of a two-element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceOne024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 4);
      let visited = new Array<int>();
      const result = arr.reduce((acc: number, value: number, index: int): number => {
        visited.pushOne(index);
        return acc + value;
      }, 10);
      expect(result).assertEqual(15);
      expect(visited.toString()).assertEqual('0,1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_ONE_2500
     * @tc.name testArrayReduceOne025
     * @tc.desc Verify reduce can visit a future sparse index filled during traversal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceOne025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | undefined>(3, (_index) => undefined);
      arr[0] = 1;
      arr[2] = 3;
      let visited = new Array<string>();
      const result =
        arr.reduce((acc: number, value: number | undefined, index: int, source: Array<number | undefined>): number => {
          visited.pushOne(index.toString() + ':' + (value === undefined ? 'u' : value.toString()));
          if (index === 0) {
            source[1] = 2;
          }
          return acc + (value === undefined ? 0 : value);
        }, 0);
      expect(result).assertEqual(6);
      expect(visited.toString()).assertEqual('0:1,1:2,2:3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_ONE_2600
     * @tc.name testArrayReduceOne026
     * @tc.desc Verify reduce does not revisit an index that was already processed before mutation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceOne026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      let visited = new Array<string>();
      const result = arr.reduce((acc: number, value: number, index: int, source: Array<number>): number => {
        visited.pushOne(index.toString() + ':' + value.toString());
        if (index === 1) {
          source[0] = 100;
        }
        return acc + value;
      }, 0);
      expect(result).assertEqual(6);
      expect(visited.toString()).assertEqual('0:1,1:2,2:3');
      expect(arr[0]).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_ONE_2700
     * @tc.name testArrayReduceOne027
     * @tc.desc Verify reduce can observe future values after splice removes a pending element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceOne027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4);
      let visited = new Array<number>();
      const result = arr.reduce((acc: number, value: number, index: int, source: Array<number>): number => {
        visited.pushOne(value);
        if (index === 0) {
          source.splice(1, 1);
        }
        return acc + value;
      }, 0);
      expect(result).assertEqual(8);
      expect(visited.toString()).assertEqual('1,3,4');
      expect(arr.toString()).assertEqual('1,3,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_ONE_2800
     * @tc.name testArrayReduceOne028
     * @tc.desc Verify reduce skips a tail element popped before that index is reached
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceOne028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      let visited = new Array<number>();
      const result = arr.reduce((acc: number, value: number, index: int, source: Array<number>): number => {
        visited.pushOne(value);
        if (index === 0) {
          source.pop();
        }
        return acc + value;
      }, 0);
      expect(result).assertEqual(3);
      expect(visited.toString()).assertEqual('1,2');
      expect(arr.toString()).assertEqual('1,2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_ONE_2900
     * @tc.name testArrayReduceOne029
     * @tc.desc Verify reduce reindexes future visits after shift removes the first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceOne029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4);
      let visited = new Array<number>();
      const result = arr.reduce((acc: number, value: number, index: int, source: Array<number>): number => {
        visited.pushOne(value);
        if (index === 0) {
          source.shift();
        }
        return acc + value;
      }, 0);
      expect(result).assertEqual(8);
      expect(visited.toString()).assertEqual('1,3,4');
      expect(arr.toString()).assertEqual('2,3,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_ONE_3000
     * @tc.name testArrayReduceOne030
     * @tc.desc Verify reduce can visit an inserted element created within the original length window
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceOne030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 3);
      let visited = new Array<number>();
      const result = arr.reduce((acc: number, value: number, index: int, source: Array<number>): number => {
        visited.pushOne(value);
        if (index === 0) {
          source.splice(1, 0, 2);
        }
        return acc + value;
      }, 0);
      expect(result).assertEqual(3);
      expect(visited.toString()).assertEqual('1,2');
      expect(arr.toString()).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_ONE_3100
     * @tc.name testArrayReduceOne031
     * @tc.desc Verify reduce does not visit values prepended ahead of the current traversal position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceOne031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(2, 3);
      let visited = new Array<number>();
      const result = arr.reduce((acc: number, value: number, index: int, source: Array<number>): number => {
        visited.pushOne(value);
        if (index === 0) {
          source.unshift(1);
        }
        return acc + value;
      }, 0);
      expect(result).assertEqual(4);
      expect(visited.toString()).assertEqual('2,2');
      expect(arr.toString()).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_ONE_3200
     * @tc.name testArrayReduceOne032
     * @tc.desc Verify reduce reads future indexes from the reversed array state after mutation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceOne032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4);
      let visited = new Array<number>();
      const result = arr.reduce((acc: number, value: number, index: int, source: Array<number>): number => {
        visited.pushOne(value);
        if (index === 0) {
          source.reverse();
        }
        return acc * 10 + value;
      }, 0);
      expect(result).assertEqual(1321);
      expect(visited.toString()).assertEqual('1,3,2,1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_ONE_3300
     * @tc.name testArrayReduceOne033
     * @tc.desc Verify reduce observes sorted future values after the callback reorders the array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceOne033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(2, 3, 1);
      let visited = new Array<number>();
      const result = arr.reduce((acc: string, value: number, index: int, source: Array<number>): string => {
        visited.pushOne(value);
        if (index === 0) {
          source.sort((left: number, right: number): int => {
            if (left < right) {
              return -1;
            }
            if (left > right) {
              return 1;
            }
            return 0;
          });
        }
        return acc + value.toString();
      }, '');
      expect(result).assertEqual('223');
      expect(visited.toString()).assertEqual('2,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_ONE_3400
     * @tc.name testArrayReduceOne034
     * @tc.desc Verify reduce propagates NaN once a NaN element participates in accumulation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceOne034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, Double.NaN, 3);
      const result = arr.reduce((acc: number, value: number): number => acc + value);
      expect(Number.isNaN(result)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_ONE_3500
     * @tc.name testArrayReduceOne035
     * @tc.desc Verify reduce preserves Infinity when the first element is positive Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceOne035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(Double.POSITIVE_INFINITY, -5, 10);
      const result = arr.reduce((acc: number, value: number): number => acc + value);
      expect(result).assertEqual(Double.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_ONE_3600
     * @tc.name testArrayReduceOne036
     * @tc.desc Verify reduce returns a lone negative zero element without changing its sign
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceOne036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>();
      arr.pushOne(-0);
      let calls = 0;
      const result = arr.reduce((acc: number, value: number): number => {
        calls++;
        return acc + value;
      });
      expect(calls).assertEqual(0);
      expect(1.0 / result).assertEqual(-Double.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_ONE_3700
     * @tc.name testArrayReduceOne037
     * @tc.desc Verify reduce can skip null elements while summing a union-typed array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceOne037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | null>(1, null, 3, null);
      const result = arr.reduce((acc: number, value: number | null): number => {
        return value === null ? acc : acc + value;
      }, 0);
      expect(result).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_ONE_3800
     * @tc.name testArrayReduceOne038
     * @tc.desc Verify reduce can sum numeric fields from object elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceOne038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const first = new IndexMap009();
      first.a = 1;
      const second = new IndexMap009();
      second.a = 2;
      const third = new IndexMap009();
      third.a = 3;
      const arr = new Array<IndexMap009>(first, second, third);
      const result = arr.reduce((acc: number, value: IndexMap009): number => acc + value.a, 0);
      expect(result).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_ONE_3900
     * @tc.name testArrayReduceOne039
     * @tc.desc Verify reduce can keep the object reference with the highest score
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceOne039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<IndexMap009>();
      const low = new IndexMap009();
      low.b = 4;
      const high = new IndexMap009();
      high.b = 9;
      const mid = new IndexMap009();
      mid.b = 7;
      arr.pushOne(low);
      arr.pushOne(high);
      arr.pushOne(mid);
      const result = arr.reduce((best: IndexMap009, value: IndexMap009): IndexMap009 => {
        return value.b > best.b ? value : best;
      });
      expect(result === high).assertTrue();
      expect(result.b).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_ONE_4000
     * @tc.name testArrayReduceOne040
     * @tc.desc Verify reduce can keep the longest nested array reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceOne040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const shortArray = new Array<number>(1);
      const longArray = new Array<number>(1, 2, 3);
      const medium = new Array<number>(1, 2);
      const arr = new Array<Array<number>>(shortArray, longArray, medium);
      const result = arr.reduce((best: Array<number>, value: Array<number>): Array<number> => {
        return value.length > best.length ? value : best;
      });
      expect(result === longArray).assertTrue();
      expect(result.toString()).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_ONE_4100
     * @tc.name testArrayReduceOne041
     * @tc.desc Verify reduce invokes the callback exactly length minus one times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceOne041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(4, 5, 6, 7, 8);
      let count = 0;
      const result = arr.reduce((acc: number, value: number): number => {
        count++;
        return acc + value;
      });
      expect(result).assertEqual(30);
      expect(count).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_ONE_4200
     * @tc.name testArrayReduceOne042
     * @tc.desc Verify reduce passes ascending indexes beginning at one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceOne042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(10, 20, 30, 40);
      let indexes = new Array<int>();
      arr.reduce((acc: number, value: number, index: int): number => {
        indexes.pushOne(index);
        return acc + value;
      });
      expect(indexes.toString()).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_ONE_4300
     * @tc.name testArrayReduceOne043
     * @tc.desc Verify reduce passes the source array into the callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceOne043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      let sameArray = false;
      arr.reduce((acc: number, value: number, index: int, source: Array<number>): number => {
        sameArray = source === arr;
        return acc + value;
      });
      expect(sameArray).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_ONE_4400
     * @tc.name testArrayReduceOne044
     * @tc.desc Verify reduce supports string concatenation when the accumulator starts as the first string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceOne044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('A', 'B', 'C');
      const result = arr.reduce((acc: string, value: string): string => acc + '-' + value);
      expect(result).assertEqual('A-B-C');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_ONE_4500
     * @tc.name testArrayReduceOne045
     * @tc.desc Verify reduce supports boolean AND reductions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceOne045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<boolean>(true, true, false);
      const result = arr.reduce((acc: boolean, value: boolean): boolean => acc && value);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_ONE_4600
     * @tc.name testArrayReduceOne046
     * @tc.desc Verify reduce supports boolean OR reductions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceOne046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<boolean>(false, false, true);
      const result = arr.reduce((acc: boolean, value: boolean): boolean => acc || value);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_ONE_4700
     * @tc.name testArrayReduceOne047
     * @tc.desc Verify reduce supports bigint addition
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceOne047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<bigint>(1n, 2n, 3n, 4n);
      const result = arr.reduce((acc: bigint, value: bigint): bigint => acc + value);
      expect(result).assertEqual(10n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_ONE_4800
     * @tc.name testArrayReduceOne048
     * @tc.desc Verify reduce can build a delimited string from numbers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceOne048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(7, 8, 9);
      const result = arr.reduce((acc: string, value: number): string => {
        return acc.length === 0 ? value.toString() : acc + ':' + value.toString();
      }, '');
      expect(result).assertEqual('7:8:9');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_ONE_4900
     * @tc.name testArrayReduceOne049
     * @tc.desc Verify reduce works on arrays produced by slice without mutating the source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceOne049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new Array<number>(0, 1, 2, 3, 4);
      const arr = source.slice(1, 4);
      const result = arr.reduce((acc: number, value: number): number => acc + value);
      expect(result).assertEqual(6);
      expect(source.toString()).assertEqual('0,1,2,3,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_ONE_5000
     * @tc.name testArrayReduceOne050
     * @tc.desc Verify reduce can consume reversed copies
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceOne050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4).toReversed();
      const result = arr.reduce((acc: number, value: number): number => acc * 10 + value);
      expect(result).assertEqual(4321);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_ONE_5100
     * @tc.name testArrayReduceOne051
     * @tc.desc Verify reduce throws for a cleared array without an initial value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceOne051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      arr.length = 0;
      let thrown = false;
      try {
        arr.reduce((acc: number, value: number): number => acc + value);
      } catch (_e) {
        thrown = true;
      }
      expect(thrown).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_ONE_5200
     * @tc.name testArrayReduceOne052
     * @tc.desc Verify reduce returns the lone bigint element without calling the callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceOne052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<bigint>(9n);
      let count = 0;
      const result = arr.reduce((acc: bigint, value: bigint): bigint => {
        count++;
        return acc + value;
      });
      expect(result).assertEqual(9n);
      expect(count).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_ONE_5300
     * @tc.name testArrayReduceOne053
     * @tc.desc Verify reduce concatenates string values with callback indexes when no initial value is provided
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceOne053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('red', 'green', 'blue');
      let callbackCount: int = 0;
      let firstIndex: int = -1;
      const result = arr.reduce((acc: string, value: string, index: int): string => {
        callbackCount += 1;
        if (callbackCount === 1) {
          firstIndex = index;
        }
        return acc + ':' + index.toString() + ':' + value;
      });
      expect(result).assertEqual('red:1:green:2:blue');
      expect(callbackCount).assertEqual(2);
      expect(firstIndex).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_ONE_5400
     * @tc.name testArrayReduceOne054
     * @tc.desc Verify reduce can use a string initial value for number elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceOne054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(4, 5, 6);
      const result = arr.reduce((acc: string, value: number, index: int): string => {
        return acc + '[' + index.toString() + '=' + value.toString() + ']';
      }, 'seed');
      expect(result).assertEqual('seed[0=4][1=5][2=6]');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_ONE_5500
     * @tc.name testArrayReduceOne055
     * @tc.desc Verify reduce visits explicit undefined elements when an initial value is provided
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceOne055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | undefined>(1, undefined, 3);
      let visited = new Array<string>();
      const result = arr.reduce((acc: number, value: number | undefined, index: int): number => {
        visited.pushOne(index.toString() + ':' + (value === undefined ? 'u' : value.toString()));
        return value === undefined ? acc : acc + value;
      }, 0);
      expect(result).assertEqual(4);
      expect(visited.toString()).assertEqual('0:1,1:u,2:3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_ONE_5600
     * @tc.name testArrayReduceOne056
     * @tc.desc Verify reduce with an initial value visits explicit undefined elements while accumulating defined values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceOne056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | undefined>(3, (_index) => undefined);
      arr[0] = 1;
      arr[2] = 3;
      let visited = new Array<string>();
      const result = arr.reduce((acc: number, value: number | undefined, index: int): number => {
        visited.pushOne(index.toString() + ':' + (value === undefined ? 'u' : value.toString()));
        return value === undefined ? acc : acc + value;
      }, 0);
      expect(result).assertEqual(4);
      expect(visited.toString()).assertEqual('0:1,1:u,2:3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_ONE_5700
     * @tc.name testArrayReduceOne057
     * @tc.desc Verify reduce returns the initial value for an empty string array without callback calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceOne057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>();
      let calls = 0;
      const result = arr.reduce((acc: string, value: string): string => {
        calls++;
        return acc + value;
      }, 'empty');
      expect(result).assertEqual('empty');
      expect(calls).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_ONE_5800
     * @tc.name testArrayReduceOne058
     * @tc.desc Verify reduce returns a single string element without calling the callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceOne058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('solo');
      let calls = 0;
      const result = arr.reduce((acc: string, value: string): string => {
        calls++;
        return acc + value;
      });
      expect(result).assertEqual('solo');
      expect(calls).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_ONE_5900
     * @tc.name testArrayReduceOne059
     * @tc.desc Verify reduce invokes the callback once for a single element with an initial value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceOne059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(7);
      let indexes = new Array<int>();
      const result = arr.reduce((acc: number, value: number, index: int): number => {
        indexes.pushOne(index);
        return acc + value;
      }, 5);
      expect(result).assertEqual(12);
      expect(indexes.toString()).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_ONE_6000
     * @tc.name testArrayReduceOne060
     * @tc.desc Verify reduce reads a later element after the callback mutates it
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceOne060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const result = arr.reduce((acc: number, value: number, index: int, source: Array<number>): number => {
        if (index === 1) {
          source[2] = 10;
        }
        return acc + value;
      });
      expect(result).assertEqual(13);
      expect(arr[2]).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_ONE_6100
     * @tc.name testArrayReduceOne061
     * @tc.desc Verify reduce skips elements removed by shrinking length during traversal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceOne061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4);
      let indexes = new Array<int>();
      const result = arr.reduce((acc: number, value: number, index: int, source: Array<number>): number => {
        indexes.pushOne(index);
        if (index === 1) {
          source.length = 2;
        }
        return acc + value;
      });
      expect(result).assertEqual(3);
      expect(indexes.toString()).assertEqual('1');
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_ONE_6200
     * @tc.name testArrayReduceOne062
     * @tc.desc Verify reduce does not visit values appended after traversal begins
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceOne062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(2, 3);
      let visited = new Array<number>();
      const result = arr.reduce((acc: number, value: number, index: int, source: Array<number>): number => {
        visited.pushOne(value);
        if (index === 1) {
          source.pushOne(100);
        }
        return acc + value;
      });
      expect(result).assertEqual(5);
      expect(visited.toString()).assertEqual('3');
      expect(arr.toString()).assertEqual('2,3,100');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_ONE_6300
     * @tc.name testArrayReduceOne063
     * @tc.desc Verify reduce observes a later element changed to undefined during traversal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceOne063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | undefined>(1, 2, 3);
      let states = new Array<string>();
      const result = arr.reduce((acc: string, value: number | undefined, index: int,
        source: Array<number | undefined>): string => {
        if (index === 0) {
          source[1] = undefined;
        }
        states.pushOne(value === undefined ? 'u' : value.toString());
        return acc + (value === undefined ? 'U' : value.toString());
      }, '');
      expect(result).assertEqual('1U3');
      expect(states.toString()).assertEqual('1,u,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_ONE_6400
     * @tc.name testArrayReduceOne064
     * @tc.desc Verify reduce propagates exceptions thrown by the callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceOne064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      let thrown = false;
      try {
        arr.reduce((acc: number, value: number): number => {
          if (value === 2) {
            throw new Error('reduce stop');
          }
          return acc + value;
        });
        expect().assertFail();
      } catch (e) {
        thrown = e.name === 'Error' && e.message === 'reduce stop';
      }
      expect(thrown).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_ONE_6500
     * @tc.name testArrayReduceOne065
     * @tc.desc Verify reduce returns the same object accumulator instance supplied as initial value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceOne065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('a', 'b');
      const seed = new IndexMap009();
      const result = arr.reduce((acc: IndexMap009, value: string, index: int): IndexMap009 => {
        if (value === 'a') {
          acc.a = index + 10;
        } else {
          acc.b = index + 10;
        }
        return acc;
      }, seed);
      expect(result === seed).assertTrue();
      expect(seed.a).assertEqual(10);
      expect(seed.b).assertEqual(11);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_ONE_6600
     * @tc.name testArrayReduceOne066
     * @tc.desc Verify reduce can sum the lengths of nested arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceOne066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<Array<number>>(new Array<number>(1), new Array<number>(2, 3), new Array<number>());
      const result = arr.reduce((acc: number, value: Array<number>): number => {
        return acc + value.length;
      }, 0);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_ONE_6700
     * @tc.name testArrayReduceOne067
     * @tc.desc Verify reduce can convert booleans and indexes into a compact string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceOne067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<boolean>(false, true, false);
      const result = arr.reduce((acc: string, value: boolean, index: int): string => {
        return acc + (value ? 'T' : 'F') + index.toString();
      }, '');
      expect(result).assertEqual('F0T1F2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_ONE_6800
     * @tc.name testArrayReduceOne068
     * @tc.desc Verify reduce callback sees the source length on every visit
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceOne068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(3, 4, 5);
      let lengths = new Array<number>();
      const result = arr.reduce((acc: number, value: number, index: int, source: Array<number>): number => {
        lengths.pushOne(source.length);
        return acc + value * index;
      }, 0);
      expect(result).assertEqual(14);
      expect(lengths.toString()).assertEqual('3,3,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_ONE_6900
     * @tc.name testArrayReduceOne069
     * @tc.desc Verify reduce can sum numeric triple 2, 3, 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceOne069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(2, 3, 4);
      const result = arr.reduce((acc: number, value: number): number => acc + value);
      expect(result).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_ONE_7000
     * @tc.name testArrayReduceOne070
     * @tc.desc Verify reduce can sum numeric triple 3, 4, 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceOne070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(3, 4, 5);
      const result = arr.reduce((acc: number, value: number): number => acc + value);
      expect(result).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_ONE_7100
     * @tc.name testArrayReduceOne071
     * @tc.desc Verify reduce sums a number array without an initial value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceOne071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4);
      const result = arr.reduce((acc: number, cur: number): number => acc + cur);
      expect(result).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_ONE_7200
     * @tc.name testArrayReduceOne072
     * @tc.desc Verify reduce concatenates string values in left-to-right order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceOne072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('a', 'b', 'c');
      const result = arr.reduce((acc: string, cur: string): string => acc + cur);
      expect(result).assertEqual("abc");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_ONE_7300
     * @tc.name testArrayReduceOne073
     * @tc.desc Verify reduce exposes the source array to the callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceOne073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(5, 6, 7);
      let same = false;
      arr.reduce((acc: number, cur: number, index: int, source: Array<number>): number => {
        same = source === arr;
        return acc + cur;
      });
      expect(same).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_ONE_7400
     * @tc.name testArrayReduceOne074
     * @tc.desc Verify reduce records traversal indexes in callback order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceOne074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(10, 20, 30);
      let text = '';
      arr.reduce((acc: number, cur: number, index: int): number => {
        text += index.toString();
        return acc + cur;
      });
      expect(text).assertEqual("12");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_ONE_7500
     * @tc.name testArrayReduceOne075
     * @tc.desc Verify reduce multiplies numeric values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceOne075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(2, 3, 4);
      const result = arr.reduce((acc: number, cur: number): number => acc * cur);
      expect(result).assertEqual(24);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_ONE_7600
     * @tc.name testArrayReduceOne076
     * @tc.desc Verify reduce can accumulate into an object map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceOne076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('a', 'b', 'c');
      const result = arr.reduce((acc: IndexMap009, cur: string, index: int): IndexMap009 => {
        if (cur === 'a') {
          acc.a = index;
        } else if (cur === 'b') {
          acc.b = index;
        } else {
          acc.c = index;
        }
        return acc;
      }, new IndexMap009());
      expect(result.a).assertEqual(0);
      expect(result.c).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_ONE_7700
     * @tc.name testArrayReduceOne077
     * @tc.desc Verify reduce can flatten nested arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceOne077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<Array<number>>(new Array<number>(1, 2), new Array<number>(3, 4));
      const result =
        arr.reduce((acc: Array<number>, cur: Array<number>): Array<number> => false ? cur.concat(acc) : acc.concat(cur),
          new Array<number>());
      expect(result.toString()).assertEqual("1,2,3,4");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_ONE_7800
     * @tc.name testArrayReduceOne078
     * @tc.desc Verify reduce works on a single-element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceOne078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(9);
      let calls = 0;
      const result = arr.reduce((acc: number, cur: number): number => {
        calls++;
        return acc + cur;
      });
      expect(result).assertEqual(9);
      expect(calls).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_ONE_7900
     * @tc.name testArrayReduceOne079
     * @tc.desc Verify reduce handles duplicate numbers without collapsing iterations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceOne079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(2, 2, 2);
      const result = arr.reduce((acc: number, cur: number): number => acc + cur);
      expect(result).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_ONE_8000
     * @tc.name testArrayReduceOne080
     * @tc.desc Verify reduce handles negative values and zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceOne080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(-2, 0, 5);
      const result = arr.reduce((acc: number, cur: number): number => acc + cur);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_ONE_8100
     * @tc.name testArrayReduceOne081
     * @tc.desc Verify reduce can count true booleans
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceOne081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<boolean>(true, false, true, true);
      const result = arr.reduce((acc: number, cur: boolean): number => cur ? acc + 1 : acc, 0);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_ONE_8200
     * @tc.name testArrayReduceOne082
     * @tc.desc Verify reduce can convert numbers into a hyphen-separated string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceOne082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const result =
        arr.reduce((acc: string, cur: number): string => acc.length === 0 ? cur.toString() : acc + '-' + cur.toString(),
          '');
      expect(result).assertEqual("1-2-3");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_ONE_8300
     * @tc.name testArrayReduceOne083
     * @tc.desc Verify reduce can read arrays produced by slice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceOne083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4).slice(1, 4);
      const result = arr.reduce((acc: number, cur: number): number => acc + cur);
      expect(result).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_ONE_8400
     * @tc.name testArrayReduceOne084
     * @tc.desc Verify reduce can read arrays produced by filter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceOne084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5).filter((value: number): boolean => value >= 3);
      const result = arr.reduce((acc: number, cur: number): number => acc + cur);
      expect(result).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_ONE_8500
     * @tc.name testArrayReduceOne085
     * @tc.desc Verify reduce can read arrays produced by concat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceOne085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2).concat(new Array<number>(3, 4));
      const result = arr.reduce((acc: number, cur: number): number => acc + cur);
      expect(result).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_ONE_8600
     * @tc.name testArrayReduceOne086
     * @tc.desc Verify reduce can read arrays produced by toReversed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceOne086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3).toReversed();
      const result = arr.reduce((acc: string, cur: number): string => acc + cur.toString(), '');
      expect(result).assertEqual("321");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_ONE_8700
     * @tc.name testArrayReduceOne087
     * @tc.desc Verify reduce can read arrays produced by with
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceOne087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3).with(1, 9);
      const result = arr.reduce((acc: number, cur: number): number => acc + cur);
      expect(result).assertEqual(13);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_ONE_8800
     * @tc.name testArrayReduceOne088
     * @tc.desc Verify reduce can read arrays produced by toSpliced
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceOne088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3).toSpliced(1, 1, 7, 8);
      const result = arr.reduce((acc: number, cur: number): number => acc + cur);
      expect(result).assertEqual(19);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_ONE_8900
     * @tc.name testArrayReduceOne089
     * @tc.desc Verify reduce can read arrays mutated by reverse before reduction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceOne089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      arr.reverse();
      const result = arr.reduce((acc: string, cur: number): string => acc + cur.toString(), '');
      expect(result).assertEqual("321");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_ONE_9000
     * @tc.name testArrayReduceOne090
     * @tc.desc Verify reduce can read arrays mutated by sort before reduction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceOne090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
      const result = arr.reduce((acc: string, cur: number): string => acc + cur.toString(), '');
      expect(result).assertEqual("123");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_ONE_9100
     * @tc.name testArrayReduceOne091
     * @tc.desc Verify reduce can read arrays after shift changes the head
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceOne091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4);
      arr.shift();
      const result = arr.reduce((acc: number, cur: number): number => acc + cur);
      expect(result).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_ONE_9200
     * @tc.name testArrayReduceOne092
     * @tc.desc Verify reduce can read arrays after pop changes the tail
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceOne092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4);
      arr.pop();
      const result = arr.reduce((acc: number, cur: number): number => acc + cur);
      expect(result).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_ONE_9300
     * @tc.name testArrayReduceOne093
     * @tc.desc Verify reduce can read arrays after unshift prepends values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceOne093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(3, 4);
      arr.unshift(1, 2);
      const result = arr.reduce((acc: number, cur: number): number => acc + cur);
      expect(result).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_ONE_9400
     * @tc.name testArrayReduceOne094
     * @tc.desc Verify reduce can read arrays after push appends values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceOne094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2);
      arr.push(3, 4);
      const result = arr.reduce((acc: number, cur: number): number => acc + cur);
      expect(result).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_ONE_9500
     * @tc.name testArrayReduceOne095
     * @tc.desc Verify reduce can read arrays after splice replacement
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceOne095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      arr.splice(1, 1, 8, 9);
      const result = arr.reduce((acc: number, cur: number): number => acc + cur);
      expect(result).assertEqual(21);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_ONE_9600
     * @tc.name testArrayReduceOne096
     * @tc.desc Verify reduce can read arrays after shrinkTo truncates the tail
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceOne096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4);
      arr.shrinkTo(2);
      const result = arr.reduce((acc: number, cur: number): number => acc + cur);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_ONE_9700
     * @tc.name testArrayReduceOne097
     * @tc.desc Verify reduce can read arrays rebuilt after clearing length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceOne097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      arr.length = 0;
      arr.pushOne(7);
      arr.pushOne(8);
      const result = arr.reduce((acc: number, cur: number): number => acc + cur);
      expect(result).assertEqual(15);
    });

  });
}
