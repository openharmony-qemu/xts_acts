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

class PresenceMap008 {
  a: boolean = false;
  b: boolean = false;
  c: boolean = false;
}

class IndexedValueMap010 {
  key0: number = 0;
  key1: number = 0;
  key2: number = 0;
}

class CountMap011 {
  a: number = 0;
  b: number = 0;
  c: number = 0;
}

class GroupMap012 {
  even: Array<number> = new Array<number>();
  odd: Array<number> = new Array<number>();
}

class ReduceStats017 {
  count: number = 0;
  sum: number = 0;
}

class StatsCase {
  count: number = 0;
  sum: number = 0;
}

class ReduceMap018 {
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

function reduceAnyNumberArrayTwo(value: Any): number {
  const arr = value as Array<number>;
  return arr.reduce((acc: number, cur: number): number => acc + cur, 0);
}

export default function ArrayReduce2Test(): void {
  describe('ArrayReduce2Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_TWO_0010
     * @tc.name testArrayReduceTwo001
     * @tc.desc Verify reduce accepts callback and initial value parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceTwo001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3);
      let sum = arr.reduce((acc: number, current: number): number => acc + current, 10);
      expect(sum).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_TWO_0020
     * @tc.name testArrayReduceTwo002
     * @tc.desc Verify the callback receives previous current index and array parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceTwo002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3);
      let indexes = new Array<int>();
      let values = new Array<number>();
      let result = arr.reduce((acc: number, cur: number, i: int, a: Array<number>): number => {
        indexes.pushOne(i);
        values.pushOne(cur);
        expect(a === arr).assertTrue();
        return acc + cur;
      }, 0);
      expect(indexes.toString()).assertEqual('0,1,2');
      expect(values.toString()).assertEqual('1,2,3');
      expect(result).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_TWO_0030
     * @tc.name testArrayReduceTwo003
     * @tc.desc Verify reduce returns a value using the accumulator type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceTwo003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3);
      let sum = arr.reduce((acc: number, v: number): number => acc + v, 0);
      expect(sum).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_TWO_0040
     * @tc.name testArrayReduceTwo004
     * @tc.desc Verify the initial value type can differ from the element type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceTwo004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3);
      let result = arr.reduce((acc: string, v: number): string => acc + v.toString(), '');
      expect(result).assertEqual('123');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_TWO_0050
     * @tc.name testArrayReduceTwo005
     * @tc.desc Verify the first iteration uses the initial value and the first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceTwo005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(10, 20, 30);
      let firstIndex = -1;
      let firstAccumulator = -1.0;
      let firstValue = -1.0;
      arr.reduce<number>((acc: number, v: number, i: int, _a: Array<number>): number => {
        if (firstIndex < 0) {
          firstIndex = i;
          firstAccumulator = acc;
          firstValue = v;
        }
        return acc + v;
      }, 0);
      expect(firstIndex).assertEqual(0);
      expect(firstAccumulator).assertEqual(0);
      expect(firstValue).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_TWO_0060
     * @tc.name testArrayReduceTwo006
     * @tc.desc Verify an empty array returns the initial value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceTwo006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>();
      let result = arr.reduce((acc: number, v: number): number => acc + v, 100);
      expect(result).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_TWO_0070
     * @tc.name testArrayReduceTwo007
     * @tc.desc Verify a single-element array still combines with the initial value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceTwo007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Array.create<number>(1, 100);
      let result = arr.reduce((acc: number, v: number): number => acc + v, 0);
      expect(result).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_TWO_0080
     * @tc.name testArrayReduceTwo008
     * @tc.desc Verify an empty object accumulator can collect presence flags
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceTwo008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<string>('a', 'b', 'c');
      let result = arr.reduce((acc: PresenceMap008, v: string): PresenceMap008 => {
        if (v === 'a') {
          acc.a = true;
        } else if (v === 'b') {
          acc.b = true;
        } else if (v === 'c') {
          acc.c = true;
        }
        return acc;
      }, new PresenceMap008());
      expect(result.a).assertTrue();
      expect(result.b).assertTrue();
      expect(result.c).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_TWO_0090
     * @tc.name testArrayReduceTwo009
     * @tc.desc Verify reduce can sum values with an explicit initial value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceTwo009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(10, 20, 30);
      let sum = arr.reduce((acc: number, v: number): number => acc + v, 0);
      expect(sum).assertEqual(60);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_TWO_0100
     * @tc.name testArrayReduceTwo010
     * @tc.desc Verify reduce can transform values into an object map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceTwo010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3);
      let result = arr.reduce((acc: IndexedValueMap010, v: number, i: int): IndexedValueMap010 => {
        if (i === 0) {
          acc.key0 = v;
        } else if (i === 1) {
          acc.key1 = v;
        } else if (i === 2) {
          acc.key2 = v;
        }
        return acc;
      }, new IndexedValueMap010());
      expect(result.key0).assertEqual(1);
      expect(result.key2).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_TWO_0110
     * @tc.name testArrayReduceTwo011
     * @tc.desc Verify an object accumulator can be used as a counter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceTwo011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<string>('a', 'b', 'a', 'c', 'b');
      let counts = arr.reduce((acc: CountMap011, v: string): CountMap011 => {
        if (v === 'a') {
          acc.a++;
        } else if (v === 'b') {
          acc.b++;
        } else if (v === 'c') {
          acc.c++;
        }
        return acc;
      }, new CountMap011());
      expect(counts.a).assertEqual(2);
      expect(counts.b).assertEqual(2);
      expect(counts.c).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_TWO_0120
     * @tc.name testArrayReduceTwo012
     * @tc.desc Verify reduce can group values by a condition
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceTwo012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3, 4, 5, 6);
      let grouped = arr.reduce((acc: GroupMap012, v: number): GroupMap012 => {
        if (v % 2 === 0) {
          acc.even.push(v);
        } else {
          acc.odd.push(v);
        }
        return acc;
      }, new GroupMap012());
      expect(grouped.even.length).assertEqual(3);
      expect(grouped.odd.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_TWO_0130
     * @tc.name testArrayReduceTwo013
     * @tc.desc Verify explicit type annotations keep the result strongly typed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceTwo013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3);
      let result = arr.reduce((acc: number, v: number): number => acc + v, 0);
      expect(typeof result).assertEqual('number');
      expect(result).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_TWO_0140
     * @tc.name testArrayReduceTwo014
     * @tc.desc Verify the accumulator type can differ and collect values into an array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceTwo014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3);
      let result = arr.reduce((acc: Array<number>, v: number): Array<number> => {
        acc.push(v);
        return acc;
      }, new Array<number>());
      expect(result.length).assertEqual(3);
      expect(result[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_TWO_0150
     * @tc.name testArrayReduceTwo015
     * @tc.desc Verify the initial-value overload is safe for empty arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceTwo015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>();
      let thrown = false;
      try {
        arr.reduce((acc: number, v: number): number => acc + v);
      } catch (_e) {
        thrown = true;
      }
      let result = arr.reduce((acc: number, v: number): number => acc + v, 0);
      expect(thrown).assertTrue();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_TWO_0160
     * @tc.name testArrayReduceTwo016
     * @tc.desc Verify suitable initial values support different reduction goals
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceTwo016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3, 4, 5);
      let sum = arr.reduce((acc: number, v: number): number => acc + v, 0);
      let product = arr.reduce((acc: number, v: number): number => acc * v, 1);
      expect(sum).assertEqual(15);
      expect(product).assertEqual(120);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_TWO_0170
     * @tc.name testArrayReduceTwo017
     * @tc.desc Verify an object can be used as the initial value for statistics
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceTwo017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3);
      let stats = arr.reduce((acc: ReduceStats017, v: number): ReduceStats017 => {
        acc.count++;
        acc.sum += v;
        return acc;
      }, new ReduceStats017());
      expect(stats.count).assertEqual(3);
      expect(stats.sum).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_TWO_0180
     * @tc.name testArrayReduceTwo018
     * @tc.desc Verify reduce can offset sums with a non-zero initial value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceTwo018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const result = arr.reduce((acc: number, value: number): number => acc + value, 10);
      expect(result).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_TWO_0190
     * @tc.name testArrayReduceTwo019
     * @tc.desc Verify reduce can multiply numbers with a numeric seed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceTwo019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(2, 3, 4);
      const result = arr.reduce((acc: number, value: number): number => acc * value, 1);
      expect(result).assertEqual(24);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_TWO_0200
     * @tc.name testArrayReduceTwo020
     * @tc.desc Verify reduce can divide left to right from an initial seed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceTwo020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(8, 4, 2);
      const result = arr.reduce((acc: number, value: number): number => acc / value, 64);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_TWO_0210
     * @tc.name testArrayReduceTwo021
     * @tc.desc Verify reduce can accumulate strings from number values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceTwo021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(5, 6, 7);
      const result = arr.reduce((acc: string, value: number): string => acc + value.toString(), '');
      expect(result).assertEqual('567');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_TWO_0220
     * @tc.name testArrayReduceTwo022
     * @tc.desc Verify reduce can evaluate boolean AND reductions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceTwo022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<boolean>(true, false, true);
      const result = arr.reduce((acc: boolean, value: boolean): boolean => acc && value, true);
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_TWO_0230
     * @tc.name testArrayReduceTwo023
     * @tc.desc Verify an empty array returns the numeric seed without callback calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceTwo023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>();
      let calls = 0;
      const result = arr.reduce((acc: number, value: number): number => {
        calls++;
        return acc + value;
      }, 7);
      expect(result).assertEqual(7);
      expect(calls).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_TWO_0240
     * @tc.name testArrayReduceTwo024
     * @tc.desc Verify reduce with a string seed visits indexes 0 and 1 of a two-element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceTwo024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(2, 5);
      const result = arr.reduce((acc: string, value: number, index: int): string => {
        return acc + '[' + index.toString() + '=' + value.toString() + ']';
      }, 'seed');
      expect(result).assertEqual('seed[0=2][1=5]');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_TWO_0250
     * @tc.name testArrayReduceTwo025
     * @tc.desc Verify reduce with a seed can visit a future sparse index filled during traversal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceTwo025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | undefined>(3, (_index) => undefined);
      arr[0] = 1;
      arr[2] = 3;
      let indexes = new Array<int>();
      const result =
        arr.reduce((acc: number, value: number | undefined, index: int, source: Array<number | undefined>): number => {
          indexes.pushOne(index);
          if (index === 0) {
            source[1] = 2;
          }
          return acc + (value === undefined ? 0 : value);
        }, 10);
      expect(result).assertEqual(16);
      expect(indexes.toString()).assertEqual('0,1,2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_TWO_0260
     * @tc.name testArrayReduceTwo026
     * @tc.desc Verify reduce with a seed skips a pending element removed by splice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceTwo026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4);
      let visited = new Array<number>();
      const result = arr.reduce((acc: number, value: number, index: int, source: Array<number>): number => {
        visited.pushOne(value);
        if (index === 0) {
          source.splice(1, 1);
        }
        return acc + value;
      }, 5);
      expect(result).assertEqual(13);
      expect(visited.toString()).assertEqual('1,3,4');
      expect(arr.toString()).assertEqual('1,3,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_TWO_0270
     * @tc.name testArrayReduceTwo027
     * @tc.desc Verify reduce with a seed skips a tail element popped before it is reached
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceTwo027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      let visited = new Array<number>();
      const result = arr.reduce((acc: number, value: number, index: int, source: Array<number>): number => {
        visited.pushOne(value);
        if (index === 0) {
          source.pop();
        }
        return acc + value;
      }, 5);
      expect(result).assertEqual(8);
      expect(visited.toString()).assertEqual('1,2');
      expect(arr.toString()).assertEqual('1,2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_TWO_0280
     * @tc.name testArrayReduceTwo028
     * @tc.desc Verify reduce with a seed reindexes future visits after shift removes the head
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceTwo028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4);
      let visited = new Array<number>();
      const result = arr.reduce((acc: string, value: number, index: int, source: Array<number>): string => {
        visited.pushOne(value);
        if (index === 0) {
          source.shift();
        }
        return acc + value.toString();
      }, 's');
      expect(result).assertEqual('s134');
      expect(visited.toString()).assertEqual('1,3,4');
      expect(arr.toString()).assertEqual('2,3,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_TWO_0290
     * @tc.name testArrayReduceTwo029
     * @tc.desc Verify reduce with a seed does not visit values prepended before the current position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceTwo029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(2, 3);
      let visited = new Array<number>();
      const result = arr.reduce((acc: string, value: number, index: int, source: Array<number>): string => {
        visited.pushOne(value);
        if (index === 0) {
          source.unshift(1);
        }
        return acc + value.toString();
      }, '');
      expect(result).assertEqual('22');
      expect(visited.toString()).assertEqual('2,2');
      expect(arr.toString()).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_TWO_0300
     * @tc.name testArrayReduceTwo030
     * @tc.desc Verify reduce with a seed can visit an inserted element created inside the original length window
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceTwo030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 3);
      let visited = new Array<number>();
      const result = arr.reduce((acc: number, value: number, index: int, source: Array<number>): number => {
        visited.pushOne(value);
        if (index === 0) {
          source.splice(1, 0, 2);
        }
        return acc + value;
      }, 5);
      expect(result).assertEqual(8);
      expect(visited.toString()).assertEqual('1,2');
      expect(arr.toString()).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_TWO_0310
     * @tc.name testArrayReduceTwo031
     * @tc.desc Verify reduce with a seed reads future indexes from the reversed array state after mutation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceTwo031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4);
      let visited = new Array<number>();
      const result = arr.reduce((acc: string, value: number, index: int, source: Array<number>): string => {
        visited.pushOne(value);
        if (index === 0) {
          source.reverse();
        }
        return acc + value.toString();
      }, '');
      expect(result).assertEqual('1321');
      expect(visited.toString()).assertEqual('1,3,2,1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_TWO_0320
     * @tc.name testArrayReduceTwo032
     * @tc.desc Verify reduce with a seed observes sorted future values after the callback reorders the array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceTwo032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
      }, 'k');
      expect(result).assertEqual('k223');
      expect(visited.toString()).assertEqual('2,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_TWO_0330
     * @tc.name testArrayReduceTwo033
     * @tc.desc Verify reduce with a seed reads future values overwritten by copyWithin
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceTwo033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4);
      const result = arr.reduce((acc: string, value: number, index: int, source: Array<number>): string => {
        if (index === 0) {
          source.copyWithin(2, 0, 2);
        }
        return acc + value.toString();
      }, '');
      expect(result).assertEqual('1212');
      expect(arr.toString()).assertEqual('1,2,1,2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_TWO_0340
     * @tc.name testArrayReduceTwo034
     * @tc.desc Verify reduce with a seed reads future values overwritten by fill
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceTwo034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4);
      const result = arr.reduce((acc: number, value: number, index: int, source: Array<number>): number => {
        if (index === 0) {
          source.fill(9, 2, 4);
        }
        return acc + value;
      }, 0);
      expect(result).assertEqual(21);
      expect(arr.toString()).assertEqual('1,2,9,9');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_TWO_0350
     * @tc.name testArrayReduceTwo035
     * @tc.desc Verify reduce with a numeric seed propagates NaN once a NaN element participates
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceTwo035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, NaN, 3);
      const result = arr.reduce((acc: number, value: number): number => acc + value, 10);
      expect(Number.isNaN(result)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_TWO_0360
     * @tc.name testArrayReduceTwo036
     * @tc.desc Verify reduce with a string seed can distinguish Infinity, negative Infinity and zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceTwo036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(Double.POSITIVE_INFINITY, -Double.POSITIVE_INFINITY, 0);
      const result = arr.reduce((acc: string, value: number): string => {
        if (value === Double.POSITIVE_INFINITY) {
          return acc + 'P';
        }
        if (value === -Double.POSITIVE_INFINITY) {
          return acc + 'N';
        }
        return acc + 'Z';
      }, 'seed');
      expect(result).assertEqual('seedPNZ');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_TWO_0370
     * @tc.name testArrayReduceTwo037
     * @tc.desc Verify reduce with a string seed can preserve the sign information of negative zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceTwo037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(-0, 0);
      const result = arr.reduce((acc: string, value: number): string => {
        return acc + (1.0 / value === -Infinity ? 'neg' : 'pos');
      }, '');
      expect(result).assertEqual('negpos');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_TWO_0380
     * @tc.name testArrayReduceTwo038
     * @tc.desc Verify reduce with a class seed can skip null values while counting and summing numbers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceTwo038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | null>(1, null, 3, null);
      const result = arr.reduce((acc: StatsCase, value: number | null): StatsCase => {
        if (value !== null) {
          acc.count++;
          acc.sum += value;
        }
        return acc;
      }, new StatsCase());
      expect(result.count).assertEqual(2);
      expect(result.sum).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_TWO_0390
     * @tc.name testArrayReduceTwo039
     * @tc.desc Verify reduce with a seed can keep the object reference that has the largest sum field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceTwo039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const seed = new StatsCase();
      seed.sum = -1;
      const first = new StatsCase();
      first.sum = 4;
      const second = new StatsCase();
      second.sum = 9;
      const third = new StatsCase();
      third.sum = 7;
      const arr = new Array<StatsCase>(first, second, third);
      const result = arr.reduce((best: StatsCase, value: StatsCase): StatsCase => {
        return value.sum > best.sum ? value : best;
      }, seed);
      expect(result === second).assertTrue();
      expect(result.sum).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_TWO_0400
     * @tc.name testArrayReduceTwo040
     * @tc.desc Verify reduce with an array seed can keep the longest nested array reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceTwo040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const shortArray = Array.create<number>(1, 1);
      const longArray = new Array<number>(1, 2, 3);
      const medium = new Array<number>(1, 2);
      const arr = new Array<Array<number>>(shortArray, longArray, medium);
      const result = arr.reduce((best: Array<number>, value: Array<number>): Array<number> => {
        return value.length > best.length ? value : best;
      }, new Array<number>());
      expect(result === longArray).assertTrue();
      expect(result.toString()).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_TWO_0410
     * @tc.name testArrayReduceTwo041
     * @tc.desc Verify a tail defined element can update an object seed at its actual index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceTwo041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | undefined>(4, (_index) => undefined);
      arr[3] = 8;
      const seed = new ReduceStats017();
      seed.count = 10;
      seed.sum = 1;
      let seenIndex = -1;
      const result = arr.reduce((acc: ReduceStats017, value: number | undefined, index: int): ReduceStats017 => {
        seenIndex = index;
        if (value !== undefined) {
          acc.count++;
          acc.sum += value;
        }
        return acc;
      }, seed);
      expect(result === seed).assertTrue();
      expect(result.count).assertEqual(11);
      expect(result.sum).assertEqual(9);
      expect(seenIndex).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_TWO_0420
     * @tc.name testArrayReduceTwo042
     * @tc.desc Verify reduce with a string seed can normalize spacing and case from string elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceTwo042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('  alpha', 'Beta  ', ' gamma ');
      const result = arr.reduce((acc: string, value: string): string => {
        return acc + value.trim().toUpperCase();
      }, 'start:');
      expect(result).assertEqual('start:ALPHABETAGAMMA');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_TWO_0430
     * @tc.name testArrayReduceTwo043
     * @tc.desc Verify reduce on an empty array returns the initial value without calling the callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceTwo043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>();
      let count = 0;
      const result = arr.reduce((acc: number, value: number): number => {
        count++;
        return acc + value;
      }, 5);
      expect(result).assertEqual(5);
      expect(count).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_TWO_0440
     * @tc.name testArrayReduceTwo044
     * @tc.desc Verify reduce starts callback indexes at zero when an initial value is provided
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceTwo044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(10, 20, 30);
      let indexes = new Array<int>();
      arr.reduce((acc: number, value: number, index: int): number => {
        indexes.pushOne(index);
        return acc + value;
      }, 0);
      expect(indexes.toString()).assertEqual('0,1,2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_TWO_0450
     * @tc.name testArrayReduceTwo045
     * @tc.desc Verify reduce passes the original array into callbacks when an initial value is provided
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceTwo045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(2, 4, 6);
      let sameArray = false;
      arr.reduce((acc: number, value: number, index: int, source: Array<number>): number => {
        sameArray = source === arr;
        return acc + value;
      }, 0);
      expect(sameArray).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_TWO_0460
     * @tc.name testArrayReduceTwo046
     * @tc.desc Verify reduce can collect numbers into a new array accumulator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceTwo046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4);
      const result = arr.reduce((acc: Array<number>, value: number): Array<number> => {
        acc.pushOne(value * 2);
        return acc;
      }, new Array<number>());
      expect(result.toString()).assertEqual('2,4,6,8');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_TWO_0470
     * @tc.name testArrayReduceTwo047
     * @tc.desc Verify reduce can collect statistics into a plain object-like class instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceTwo047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(3, 6, 9);
      const result = arr.reduce((acc: StatsCase, value: number): StatsCase => {
        acc.count++;
        acc.sum += value;
        return acc;
      }, new StatsCase());
      expect(result.count).assertEqual(3);
      expect(result.sum).assertEqual(18);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_TWO_0480
     * @tc.name testArrayReduceTwo048
     * @tc.desc Verify reduce can seed a string accumulator with a prefix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceTwo048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const result = arr.reduce((acc: string, value: number): string => acc + ':' + value.toString(), 'start');
      expect(result).assertEqual('start:1:2:3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_TWO_0490
     * @tc.name testArrayReduceTwo049
     * @tc.desc Verify reduce can work on arrays created by filter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceTwo049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = createRangeArray(8).filter((value: number): boolean => value % 2 === 0);
      const result = arr.reduce((acc: number, value: number): number => acc + value, 0);
      expect(result).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_TWO_0500
     * @tc.name testArrayReduceTwo050
     * @tc.desc Verify reduce can work on bigint arrays with an explicit bigint seed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceTwo050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<bigint>(1n, 2n, 3n);
      const result = arr.reduce((acc: bigint, value: bigint): bigint => acc + value, 10n);
      expect(result).assertEqual(16n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_TWO_0510
     * @tc.name testArrayReduceTwo051
     * @tc.desc Verify reduce does not mutate the source array when the callback is pure
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceTwo051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(4, 8, 12);
      const before = arr.toString();
      const result = arr.reduce((acc: number, value: number): number => acc + value, 0);
      expect(result).assertEqual(24);
      expect(arr.toString()).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_TWO_0520
     * @tc.name testArrayReduceTwo052
     * @tc.desc Verify reduce can seed a string accumulator and expose source length on the first callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceTwo052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(2, 4, 6);
      let firstState = '';
      let firstIndex: int = -1;
      const result = arr.reduce((acc: string, value: number, index: int, source: Array<number>): string => {
        if (index === 0) {
          firstState = acc + ':' + source.length.toString();
          firstIndex = index;
        }
        return acc + '-' + value.toString();
      }, 'seed');
      expect(result).assertEqual('seed-2-4-6');
      expect(firstState).assertEqual('seed:3');
      expect(firstIndex).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_TWO_0530
     * @tc.name testArrayReduceTwo053
     * @tc.desc Verify reduce can collect selected values into an array accumulator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceTwo053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(2, 4, 6, 8);
      const result = arr.reduce((acc: Array<number>, value: number, index: int): Array<number> => {
        if (index % 2 === 0) {
          acc.pushOne(value * 10);
        }
        return acc;
      }, new Array<number>());
      expect(result.toString()).assertEqual('20,60');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_TWO_0540
     * @tc.name testArrayReduceTwo054
     * @tc.desc Verify an empty array returns the same object accumulator instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceTwo054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>();
      const seed = new ReduceStats017();
      seed.sum = 99;
      let calls = 0;
      const result = arr.reduce((acc: ReduceStats017, value: number): ReduceStats017 => {
        calls++;
        acc.sum += value;
        return acc;
      }, seed);
      expect(result === seed).assertTrue();
      expect(result.sum).assertEqual(99);
      expect(calls).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_TWO_0550
     * @tc.name testArrayReduceTwo055
     * @tc.desc Verify a single element is combined with the initial string value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceTwo055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<string>(1, 'x');
      let seenIndex = -1;
      let sameArray = false;
      const result = arr.reduce((acc: string, value: string, index: int, source: Array<string>): string => {
        seenIndex = index;
        sameArray = source === arr;
        return acc + value;
      }, 'pre-');
      expect(result).assertEqual('pre-x');
      expect(seenIndex).assertEqual(0);
      expect(sameArray).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_TWO_0560
     * @tc.name testArrayReduceTwo056
     * @tc.desc Verify reduce without initial value still throws on an empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceTwo056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>();
      let thrown = false;
      try {
        arr.reduce((acc: string, value: string): string => acc + value);
      } catch (_e) {
        thrown = true;
      }
      const fallback = arr.reduce((acc: string, value: string): string => acc + value, 'fallback');
      expect(thrown).assertTrue();
      expect(fallback).assertEqual('fallback');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_TWO_0570
     * @tc.name testArrayReduceTwo057
     * @tc.desc Verify reduce visits explicit undefined elements with an initial value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceTwo057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | undefined>(undefined, 2, undefined);
      let seen = '';
      const result = arr.reduce((acc: number, value: number | undefined, index: int): number => {
        seen += index.toString() + (value === undefined ? 'u' : 'n');
        return acc + (value === undefined ? index : value);
      }, 0);
      expect(result).assertEqual(4);
      expect(seen).assertEqual('0u1n2u');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_TWO_0580
     * @tc.name testArrayReduceTwo058
     * @tc.desc Verify reduce with an initial value visits explicit undefined elements while accumulating present values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceTwo058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | undefined>(4, (_index) => undefined);
      arr[1] = 2;
      arr[3] = 4;
      let seen = '';
      const result = arr.reduce((acc: number, value: number | undefined, index: int): number => {
        seen += index.toString() + (value === undefined ? 'u' : 'n');
        return acc + (value === undefined ? 0 : value);
      }, 1);
      expect(result).assertEqual(7);
      expect(seen).assertEqual('0u1n2u3n');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_TWO_0590
     * @tc.name testArrayReduceTwo059
     * @tc.desc Verify reduce skips tail elements removed by length shrink
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceTwo059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4);
      let indexes = new Array<int>();
      const result = arr.reduce((acc: number, value: number, index: int, source: Array<number>): number => {
        indexes.pushOne(index);
        if (index === 0) {
          source.length = 2;
        }
        return acc + value;
      }, 0);
      expect(result).assertEqual(3);
      expect(indexes.toString()).assertEqual('0,1');
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_TWO_0600
     * @tc.name testArrayReduceTwo060
     * @tc.desc Verify reduce does not visit values appended after traversal starts
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceTwo060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2);
      let visited = new Array<number>();
      const result = arr.reduce((acc: number, value: number, index: int, source: Array<number>): number => {
        visited.pushOne(value);
        if (index === 0) {
          source.pushOne(9);
        }
        return acc + value;
      }, 0);
      expect(result).assertEqual(3);
      expect(visited.toString()).assertEqual('1,2');
      expect(arr.toString()).assertEqual('1,2,9');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_TWO_0610
     * @tc.name testArrayReduceTwo061
     * @tc.desc Verify reduce reads a later element after it is changed by an earlier callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceTwo061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const result = arr.reduce((acc: number, value: number, index: int, source: Array<number>): number => {
        if (index === 0) {
          source[2] = 30;
        }
        return acc + value;
      }, 0);
      expect(result).assertEqual(33);
      expect(arr[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_TWO_0620
     * @tc.name testArrayReduceTwo062
     * @tc.desc Verify reduce can read object array fields into a numeric accumulator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceTwo062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const first = new StatsCase();
      first.count = 1;
      first.sum = 3;
      const second = new StatsCase();
      second.count = 2;
      second.sum = 4;
      const arr = new Array<StatsCase>(first, second);
      const result = arr.reduce((acc: number, value: StatsCase): number => {
        return acc + value.count * value.sum;
      }, 0);
      expect(result).assertEqual(11);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_TWO_0630
     * @tc.name testArrayReduceTwo063
     * @tc.desc Verify reduce can build a string from each value and index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceTwo063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('a', 'b', 'c');
      const result = arr.reduce((acc: string, value: string, index: int): string => {
        return acc + index.toString() + value;
      }, '');
      expect(result).assertEqual('0a1b2c');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_TWO_0640
     * @tc.name testArrayReduceTwo064
     * @tc.desc Verify reduce keeps using the original source array after outer variable reassignment
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceTwo064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3);
      const original = arr;
      let sameSource = true;
      const result = arr.reduce((acc: number, value: number, index: int, source: Array<number>): number => {
        if (index === 0) {
          arr = Array.create<number>(1, 9);
        }
        sameSource = sameSource && source === original;
        return acc + value;
      }, 0);
      expect(result).assertEqual(6);
      expect(sameSource).assertTrue();
      expect(arr.toString()).assertEqual('9');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_TWO_0650
     * @tc.name testArrayReduceTwo065
     * @tc.desc Verify reduce does not skip false boolean elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceTwo065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<boolean>(false, false);
      let calls = 0;
      const result = arr.reduce((acc: string, value: boolean, index: int): string => {
        calls++;
        return acc + (value ? 'T' : 'F') + index.toString();
      }, 'b');
      expect(result).assertEqual('bF0F1');
      expect(calls).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_TWO_0660
     * @tc.name testArrayReduceTwo066
     * @tc.desc Verify reducing after clearing length only visits the first callback before removal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceTwo066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(5, 6, 7);
      let visited = new Array<number>();
      const result = arr.reduce((acc: number, value: number, index: int, source: Array<number>): number => {
        visited.pushOne(value);
        if (index === 0) {
          source.length = 0;
        }
        return acc + value;
      }, 10);
      expect(result).assertEqual(15);
      expect(visited.toString()).assertEqual('5');
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_TWO_0670
     * @tc.name testArrayReduceTwo067
     * @tc.desc Verify reduce can convert bigint elements into a string accumulator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceTwo067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<bigint>(2n, 4n);
      const result = arr.reduce((acc: string, value: bigint, index: int): string => {
        return acc + index.toString() + ':' + value.toString() + ';';
      }, 'big:');
      expect(result).assertEqual('big:0:2;1:4;');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_TWO_0680
     * @tc.name testArrayReduceTwo068
     * @tc.desc Verify reduce can accumulate string counts into a class instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceTwo068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('a', 'c', 'a');
      const result = arr.reduce((acc: CountMap011, value: string, index: int,
        source: Array<string>): CountMap011 => {
        if (value === 'a') {
          acc.a += index + source.length;
        } else if (value === 'c') {
          acc.c += index + source.length;
        }
        return acc;
      }, new CountMap011());
      expect(result.a).assertEqual(8);
      expect(result.c).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_TWO_0690
     * @tc.name testArrayReduceTwo069
     * @tc.desc Verify reduce can collect running totals in an array accumulator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceTwo069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(2, 5, 1);
      const result = arr.reduce((acc: Array<number>, value: number): Array<number> => {
        const prior = acc.length === 0 ? 0 : acc[acc.length - 1];
        acc.pushOne(prior + value);
        return acc;
      }, new Array<number>());
      expect(result.toString()).assertEqual('2,7,8');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_TWO_0700
     * @tc.name testArrayReduceTwo070
     * @tc.desc Verify reduce with initial value can sum numeric triple 2, 3, 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceTwo070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(2, 3, 4);
      const result = arr.reduce((acc: number, value: number): number => acc + value, 0);
      expect(result).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_TWO_0710
     * @tc.name testArrayReduceTwo071
     * @tc.desc Verify reduce with initial value can sum numeric triple 3, 4, 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceTwo071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(3, 4, 5);
      const result = arr.reduce((acc: number, value: number): number => acc + value, 0);
      expect(result).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_TWO_0720
     * @tc.name testArrayReduceTwo072
     * @tc.desc Verify reduce sums a number array with an initial zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceTwo072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4);
      const result = arr.reduce((acc: number, cur: number): number => acc + cur, 0);
      expect(result).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_TWO_0730
     * @tc.name testArrayReduceTwo073
     * @tc.desc Verify reduce concatenates string values in left-to-right order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceTwo073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('a', 'b', 'c');
      const result = arr.reduce((acc: string, cur: string): string => acc + cur, '');
      expect(result).assertEqual("abc");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_TWO_0740
     * @tc.name testArrayReduceTwo074
     * @tc.desc Verify reduce exposes the source array to the callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceTwo074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(5, 6, 7);
      let same = false;
      arr.reduce((acc: number, cur: number, index: int, source: Array<number>): number => {
        same = source === arr;
        return acc + cur;
      }, 0);
      expect(same).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_TWO_0750
     * @tc.name testArrayReduceTwo075
     * @tc.desc Verify reduce records traversal indexes in callback order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceTwo075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(10, 20, 30);
      let text = '';
      arr.reduce((acc: number, cur: number, index: int): number => {
        text += index.toString();
        return acc + cur;
      }, 0);
      expect(text).assertEqual("012");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_TWO_0760
     * @tc.name testArrayReduceTwo076
     * @tc.desc Verify reduce multiplies numeric values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceTwo076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(2, 3, 4);
      const result = arr.reduce((acc: number, cur: number): number => acc * cur, 1);
      expect(result).assertEqual(24);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_TWO_0770
     * @tc.name testArrayReduceTwo077
     * @tc.desc Verify reduce can accumulate into an object map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceTwo077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('a', 'b', 'c');
      const result = arr.reduce((acc: ReduceMap018, cur: string, index: int): ReduceMap018 => {
        if (cur === 'a') {
          acc.a = index;
        } else if (cur === 'b') {
          acc.b = index;
        } else {
          acc.c = index;
        }
        return acc;
      }, new ReduceMap018());
      expect(result.a).assertEqual(0);
      expect(result.c).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_TWO_0780
     * @tc.name testArrayReduceTwo078
     * @tc.desc Verify reduce can flatten nested arrays while tracking nested lengths
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceTwo078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<Array<number>>(new Array<number>(1, 2), new Array<number>(), Array.create<number>(1, 3));
      let lengthMarks = new Array<number>();
      const result = arr.reduce((acc: Array<number>, cur: Array<number>, index: int): Array<number> => {
        lengthMarks.pushOne(cur.length + index);
        return acc.concat(cur);
      }, Array.create<number>(1, 0));
      expect(result.toString()).assertEqual('0,1,2,3');
      expect(lengthMarks.toString()).assertEqual('2,1,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_TWO_0790
     * @tc.name testArrayReduceTwo079
     * @tc.desc Verify reduce works on a single-element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceTwo079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<number>(1, 9);
      let calls = 0;
      const result = arr.reduce((acc: number, cur: number): number => {
        calls++;
        return acc + cur;
      }, 1);
      expect(result).assertEqual(10);
      expect(calls).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_TWO_0800
     * @tc.name testArrayReduceTwo080
     * @tc.desc Verify reduce handles duplicate numbers without collapsing iterations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceTwo080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(2, 2, 2);
      const result = arr.reduce((acc: number, cur: number): number => acc + cur, 0);
      expect(result).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_TWO_0810
     * @tc.name testArrayReduceTwo081
     * @tc.desc Verify reduce handles negative values and zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceTwo081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(-2, 0, 5);
      const result = arr.reduce((acc: number, cur: number): number => acc + cur, 0);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_TWO_0820
     * @tc.name testArrayReduceTwo082
     * @tc.desc Verify reduce can count false boolean indexes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceTwo082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<boolean>(true, false, true, false);
      let calls = 0;
      const result = arr.reduce((acc: number, cur: boolean, index: int): number => {
        calls++;
        return cur ? acc : acc + index;
      }, 0);
      expect(result).assertEqual(4);
      expect(calls).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_TWO_0830
     * @tc.name testArrayReduceTwo083
     * @tc.desc Verify reduce can format number indexes and values into a string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceTwo083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(10, 20, 30);
      const result = arr.reduce((acc: string, cur: number, index: int): string => {
        const prefix = index === 0 ? '' : '|';
        return acc + prefix + index.toString() + '=' + cur.toString();
      }, '');
      expect(result).assertEqual('0=10|1=20|2=30');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_TWO_0840
     * @tc.name testArrayReduceTwo084
     * @tc.desc Verify reduce can read arrays produced by slice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceTwo084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4).slice(1, 4);
      const result = arr.reduce((acc: number, cur: number): number => acc + cur, 0);
      expect(result).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_TWO_0850
     * @tc.name testArrayReduceTwo085
     * @tc.desc Verify reduce can read arrays produced by filter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceTwo085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5).filter((value: number): boolean => value >= 3);
      const result = arr.reduce((acc: number, cur: number): number => acc + cur, 0);
      expect(result).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_TWO_0860
     * @tc.name testArrayReduceTwo086
     * @tc.desc Verify reduce can read arrays produced by concat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceTwo086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2).concat(new Array<number>(3, 4));
      const result = arr.reduce((acc: number, cur: number): number => acc + cur, 0);
      expect(result).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_TWO_0870
     * @tc.name testArrayReduceTwo087
     * @tc.desc Verify reduce can read a toReversed copy without mutating the source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceTwo087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new Array<number>(1, 2, 3);
      const arr = source.toReversed();
      let indexes = new Array<int>();
      const result = arr.reduce((acc: number, cur: number, index: int): number => {
        indexes.pushOne(index);
        return acc * 10 + cur;
      }, 0);
      expect(result).assertEqual(321);
      expect(indexes.toString()).assertEqual('0,1,2');
      expect(source.toString()).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_TWO_0880
     * @tc.name testArrayReduceTwo088
     * @tc.desc Verify reduce can read arrays produced by with
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceTwo088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3).with(1, 9);
      const result = arr.reduce((acc: number, cur: number): number => acc + cur, 0);
      expect(result).assertEqual(13);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_TWO_0890
     * @tc.name testArrayReduceTwo089
     * @tc.desc Verify reduce can read arrays produced by toSpliced
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceTwo089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3).toSpliced(1, 1, 7, 8);
      const result = arr.reduce((acc: number, cur: number): number => acc + cur, 0);
      expect(result).assertEqual(19);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_TWO_0900
     * @tc.name testArrayReduceTwo090
     * @tc.desc Verify reduce can weight values after reverse mutates the source order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceTwo090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4);
      arr.reverse();
      const result = arr.reduce((acc: number, cur: number, index: int): number => {
        return acc + cur * (index + 1);
      }, 0);
      expect(result).assertEqual(20);
      expect(arr.toString()).assertEqual('4,3,2,1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_TWO_0910
     * @tc.name testArrayReduceTwo091
     * @tc.desc Verify reduce can build a number after sort mutates the source order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceTwo091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
      let seen = '';
      const result = arr.reduce((acc: number, cur: number, index: int, source: Array<number>): number => {
        seen += source[index].toString();
        return acc * 10 + cur;
      }, 0);
      expect(result).assertEqual(123);
      expect(seen).assertEqual('123');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_TWO_0920
     * @tc.name testArrayReduceTwo092
     * @tc.desc Verify reduce can read arrays after shift changes the head
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceTwo092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4);
      arr.shift();
      const result = arr.reduce((acc: number, cur: number): number => acc + cur, 0);
      expect(result).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_TWO_0930
     * @tc.name testArrayReduceTwo093
     * @tc.desc Verify reduce can read arrays after pop changes the tail
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceTwo093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4);
      arr.pop();
      const result = arr.reduce((acc: number, cur: number): number => acc + cur, 0);
      expect(result).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_TWO_0940
     * @tc.name testArrayReduceTwo094
     * @tc.desc Verify reduce can read arrays after unshift prepends values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceTwo094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(3, 4);
      arr.unshift(1, 2);
      const result = arr.reduce((acc: number, cur: number): number => acc + cur, 0);
      expect(result).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_TWO_0950
     * @tc.name testArrayReduceTwo095
     * @tc.desc Verify reduce can read arrays after push appends values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceTwo095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2);
      arr.push(3, 4);
      const result = arr.reduce((acc: number, cur: number): number => acc + cur, 0);
      expect(result).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_TWO_0960
     * @tc.name testArrayReduceTwo096
     * @tc.desc Verify reduce can read arrays after splice replacement
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceTwo096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      arr.splice(1, 1, 8, 9);
      const result = arr.reduce((acc: number, cur: number): number => acc + cur, 0);
      expect(result).assertEqual(21);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_TWO_0970
     * @tc.name testArrayReduceTwo097
     * @tc.desc Verify reduce can read arrays after shrinkTo truncates the tail
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceTwo097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4);
      arr.shrinkTo(2);
      const result = arr.reduce((acc: number, cur: number): number => acc + cur, 0);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_TWO_0980
     * @tc.name testArrayReduceTwo098
     * @tc.desc Verify reduce can read arrays rebuilt after clearing length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceTwo098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      arr.length = 0;
      arr.pushOne(7);
      arr.pushOne(8);
      const result = arr.reduce((acc: number, cur: number): number => acc + cur, 0);
      expect(result).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_TWO_0990
     * @tc.name testArrayReduceTwo099
     * @tc.desc Verify reduce with initial value works after narrowing an Any value back to Array<number>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceTwo099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const anyValue: Any = new Array<number>(1, 2, 3);
      expect(reduceAnyNumberArrayTwo(anyValue)).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REDUCE_TWO_1000
     * @tc.name testArrayReduceTwo100
     * @tc.desc Verify reduce with initial value supports arrays whose element type is Any
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReduceTwo100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const anyArr = new Array<Any>(1, 'two', true);
      const result = anyArr.reduce((acc: int, _cur: Any): int => acc + 1, 0);
      expect(result).assertEqual(3);
    });

  });
}
