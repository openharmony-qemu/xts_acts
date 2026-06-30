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

class Counter003 {
  count: number = 0;

  add(value: number): void {
    this.count += value;
  }
}

class Person009 {
  name: string = '';
}

class StringIndex016 {
  a: number = -1;
  b: number = -1;
  c: number = -1;
}

class Database027 {
  insertedValues: Array<number> = new Array<number>();

  insert(value: number): void {
    this.insertedValues.push(value);
  }
}

class ForEachItemA {
  value: number = 0;
}

function sumAnyNumberArrayByForEach(value: Any): number {
  const arr = value as Array<number>;
  let total = 0;
  arr.forEach((item: number): void => {
    total += item;
  });
  return total;
}

type arrStr = Array<string | arrStr>;

function collectText<T>(arr: Array<T>, mapper: (value: T) => string): string {
  let text = '';
  arr.forEach((value: T): void => {
    text += mapper(value);
  });
  return text;
}

function compareNumberAsc(left: number, right: number): int {
  if (left < right) {
    return -1;
  }
  if (left > right) {
    return 1;
  }
  return 0;
}

function createLargeNumberArray(size: int): Array<number> {
  let values: Array<number> = new Array<number>();
  for (let i: int = 0; i < size; i++) {
    values.push(i);
  }
  return values;
}

export default function ArrayForEachTest(): void {
  describe('ArrayForEachTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FOR_EACH_0010
     * @tc.name testArrayForEach001
     * @tc.desc Verify forEach accepts a callback function
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayForEach001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3);
      let sum = 0;
      arr.forEach((v: number): void => {
        sum += v;
      });
      expect(sum).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FOR_EACH_0020
     * @tc.name testArrayForEach002
     * @tc.desc Verify callback receives value index and array parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayForEach002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(10, 20, 30);
      let totalIndex = 0;
      arr.forEach((v: number, i: int, a: Array<number>): void => {
        expect(a.length).assertEqual(3);
        expect(typeof v).assertEqual('number');
        totalIndex += i;
      });
      expect(totalIndex).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FOR_EACH_0030
     * @tc.name testArrayForEach003
     * @tc.desc Verify forEach callbacks can produce side effects by closing over external state
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayForEach003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let counter = new Counter003();
      let arr = new Array<number>(1, 2, 3);
      arr.forEach((v: number): void => {
        counter.add(v);
      });
      expect(counter.count).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FOR_EACH_0040
     * @tc.name testArrayForEach004
     * @tc.desc Verify forEach returns void after iteration
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayForEach004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3);
      let result = arr.forEach((v: number): void => {
        expect(v > 0).assertTrue();
      });
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FOR_EACH_0050
     * @tc.name testArrayForEach005
     * @tc.desc Verify forEach does not change the original array length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayForEach005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3);
      let originalLength = arr.length;
      arr.forEach((v: number): void => {
        expect(v > 0).assertTrue();
      });
      expect(arr.length).assertEqual(originalLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FOR_EACH_0060
     * @tc.name testArrayForEach006
     * @tc.desc Verify callback can update array elements in place
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayForEach006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3);
      arr.forEach((v: number, i: int, a: Array<number>): void => {
        a[i] = v * 2;
      });
      expect(arr[0]).assertEqual(2);
      expect(arr[1]).assertEqual(4);
      expect(arr[2]).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FOR_EACH_0070
     * @tc.name testArrayForEach007
     * @tc.desc Verify forEach skips execution for an empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayForEach007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>();
      let executed = false;
      arr.forEach((): void => {
        executed = true;
      });
      expect(executed).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FOR_EACH_0080
     * @tc.name testArrayForEach008
     * @tc.desc Verify forEach visits every element in the source array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayForEach008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3, 4, 5);
      let results: Array<number> = new Array<number>();
      arr.forEach((v: number): void => {
        results.push(v);
      });
      expect(results.length).assertEqual(5);
      expect(results[4]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FOR_EACH_0090
     * @tc.name testArrayForEach009
     * @tc.desc Verify forEach iterates over object array elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayForEach009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<Person009>();
      let p1 = new Person009();
      p1.name = 'Alice';
      let p2 = new Person009();
      p2.name = 'Bob';
      arr.push(p1);
      arr.push(p2);

      let names: Array<string> = new Array<string>();
      arr.forEach((person: Person009): void => {
        names.push(person.name);
      });
      expect(names.length).assertEqual(2);
      expect(names[0]).assertEqual('Alice');
      expect(names[1]).assertEqual('Bob');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FOR_EACH_0100
     * @tc.name testArrayForEach010
     * @tc.desc Verify forEach handles arrays containing nullish values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayForEach010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number | null | undefined>(1, null, 3, undefined);
      let nullishCount = 0;
      arr.forEach((v: number | null | undefined): void => {
        if (v === null || v === undefined) {
          nullishCount++;
        }
      });
      expect(nullishCount).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FOR_EACH_0110
     * @tc.name testArrayForEach011
     * @tc.desc Verify forEach and for loops can produce the same result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayForEach011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3, 4, 5);
      let forEachValues: Array<number> = new Array<number>();
      arr.forEach((v: number): void => {
        expect(v > 0).assertTrue();
        forEachValues.push(v);
      });

      let forValues: Array<number> = new Array<number>();
      for (let i: int = 0; i < arr.length; i++) {
        expect(arr[i] > 0).assertTrue();
        forValues.push(arr[i]);
      }
      expect(forEachValues.toString()).assertEqual(forValues.toString());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FOR_EACH_0120
     * @tc.name testArrayForEach012
     * @tc.desc Verify forEach cannot break early from the callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayForEach012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3, 4, 5);
      let count = 0;
      let seen: Array<number> = new Array<number>();
      arr.forEach((v: number): void => {
        count++;
        if (v > 3) {
          return;
        }
        seen.push(v);
      });
      expect(count).assertEqual(5);
      expect(seen.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FOR_EACH_0130
     * @tc.name testArrayForEach013
     * @tc.desc Verify forEach and for loops can both process large arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayForEach013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = createLargeNumberArray(10000);
      let forEachCount = 0;
      arr.forEach((v: number): void => {
        if (v >= 0) {
          forEachCount++;
        }
      });

      let forCount = 0;
      for (let i: int = 0; i < arr.length; i++) {
        let value = arr[i];
        if (value >= 0) {
          forCount++;
        }
      }
      expect(forEachCount).assertEqual(10000);
      expect(forCount).assertEqual(10000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FOR_EACH_0140
     * @tc.name testArrayForEach014
     * @tc.desc Verify forEach can process each element for side effects
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayForEach014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3, 4, 5);
      let doubled: Array<number> = new Array<number>();
      arr.forEach((v: number): void => {
        doubled.push(v * 2);
      });
      expect(doubled[0]).assertEqual(2);
      expect(doubled[4]).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FOR_EACH_0150
     * @tc.name testArrayForEach015
     * @tc.desc Verify forEach can accumulate state in an outer variable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayForEach015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3, 4);
      let sum = 0;
      arr.forEach((v: number): void => {
        sum += v;
      });
      expect(sum).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FOR_EACH_0160
     * @tc.name testArrayForEach016
     * @tc.desc Verify forEach can build object style index mappings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayForEach016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<string>('a', 'b', 'c');
      let indexMap = new StringIndex016();
      arr.forEach((v: string, i: int): void => {
        if (v === 'a') {
          indexMap.a = i;
        } else if (v === 'b') {
          indexMap.b = i;
        } else if (v === 'c') {
          indexMap.c = i;
        }
      });
      expect(indexMap.a).assertEqual(0);
      expect(indexMap.c).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FOR_EACH_0170
     * @tc.name testArrayForEach017
     * @tc.desc Verify forEach does not return a new transformed array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayForEach017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3);
      let result1 = arr.forEach((v: number): void => {
        let current = v;
        expect(current > 0).assertTrue();
      });
      let result2 = arr.map((v: number): number => v * 2);
      expect(result1).assertUndefined();
      expect(result2.length).assertEqual(3);
      expect(result2[0]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FOR_EACH_0180
     * @tc.name testArrayForEach018
     * @tc.desc Verify callback can use the current index parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayForEach018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(10, 20, 30);
      let checked = false;
      arr.forEach((v: number, i: int): void => {
        if (i === 1) {
          checked = true;
          expect(v).assertEqual(20);
        }
      });
      expect(checked).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FOR_EACH_0190
     * @tc.name testArrayForEach019
     * @tc.desc Verify callback can access the original array parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayForEach019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3);
      let count = 0;
      arr.forEach((v: number, i: int, a: Array<number>): void => {
        expect(a === arr).assertTrue();
        expect(a.length).assertEqual(3);
        count += v + i;
      });
      expect(count).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FOR_EACH_0200
     * @tc.name testArrayForEach020
     * @tc.desc Verify forEach supports concise arrow callbacks
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayForEach020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3);
      let sum = 0;
      arr.forEach((v: number): void => sum += v);
      expect(sum).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FOR_EACH_0210
     * @tc.name testArrayForEach021
     * @tc.desc Verify forEach accepts arrow callbacks that capture visited values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayForEach021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3);
      let seen: Array<number> = new Array<number>();
      arr.forEach((v: number): void => {
        expect(v > 0).assertTrue();
        seen.push(v);
      });
      expect(seen.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FOR_EACH_0220
     * @tc.name testArrayForEach022
     * @tc.desc Verify forEach executes callbacks synchronously in order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayForEach022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3);
      let order = 0;
      arr.forEach((v: number): void => {
        order++;
        expect(order).assertEqual(v);
      });
      expect(order).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FOR_EACH_0230
     * @tc.name testArrayForEach023
     * @tc.desc Verify added elements are not visited during current forEach
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayForEach023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3);
      let count = 0;
      arr.forEach((v: number, i: int, a: Array<number>): void => {
        count++;
        if (i === 0) {
          a.push(4);
        }
        expect(v > 0).assertTrue();
      });
      expect(count).assertEqual(3);
      expect(arr.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FOR_EACH_0240
     * @tc.name testArrayForEach024
     * @tc.desc Verify removing elements can change later callback visits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayForEach024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3, 4, 5);
      let visited: Array<number> = new Array<number>();
      arr.forEach((v: number, i: int, a: Array<number>): void => {
        visited.push(v);
        if (i === 2) {
          a.splice(0, 1);
        }
      });
      expect(visited.length).assertEqual(4);
      expect(visited.toString()).assertEqual('1,2,3,5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FOR_EACH_0250
     * @tc.name testArrayForEach025
     * @tc.desc Verify ReadonlyArray values can be iterated with forEach
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayForEach025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: ReadonlyArray<number> = [1, 2, 3];
      let sum = 0;
      arr.forEach((v: number): void => {
        sum += v;
      });
      expect(sum).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FOR_EACH_0260
     * @tc.name testArrayForEach026
     * @tc.desc Verify forEach returns undefined after visiting transformed values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayForEach026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3);
      let visited: Array<number> = new Array<number>();
      let result = arr.map((v: number): number => v * 2).forEach((v: number): void => {
        visited.push(v);
      });
      expect(result).assertUndefined();
      expect(visited.toString()).assertEqual('2,4,6');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FOR_EACH_0270
     * @tc.name testArrayForEach027
     * @tc.desc Verify forEach is suitable for side effect operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayForEach027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let db = new Database027();
      let arr = new Array<number>(1, 2, 3);
      arr.forEach((v: number): void => {
        db.insert(v);
      });
      expect(db.insertedValues.length).assertEqual(3);
      expect(db.insertedValues[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FOR_EACH_0280
     * @tc.name testArrayForEach028
     * @tc.desc Verify forEach can drive repeated logging style work
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayForEach028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(10, 20, 30);
      let logged: Array<string> = new Array<string>();
      arr.forEach((v: number): void => {
        let line = 'Value: ' + v.toString();
        console.info(line);
        logged.push(line);
      });
      expect(logged.length).assertEqual(3);
      expect(logged[0]).assertEqual('Value: 10');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FOR_EACH_0290
     * @tc.name testArrayForEach029
     * @tc.desc Verify forEach side effects can match map transformation results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayForEach029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3, 4);
      let results: Array<number> = new Array<number>();
      arr.forEach((v: number): void => {
        results.push(v * 2);
      });
      let mapped = arr.map((v: number): number => v * 2);
      expect(results.toString()).assertEqual(mapped.toString());
      expect(mapped.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FOR_EACH_0300
     * @tc.name testArrayForEach030
     * @tc.desc Verify forEach can sum the numeric triple 1, 2, 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayForEach030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      let sum = 0;
      arr.forEach((value: number): void => {
        sum += value;
      });
      expect(sum).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FOR_EACH_0310
     * @tc.name testArrayForEach031
     * @tc.desc Verify forEach visits indexes in ascending order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayForEach031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(9, 8, 7);
      let indexes = new Array<int>();
      arr.forEach((value: number, index: int): void => {
        indexes.pushOne(index);
      });
      expect(indexes.toString()).assertEqual('0,1,2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FOR_EACH_0320
     * @tc.name testArrayForEach032
     * @tc.desc Verify forEach accumulates a numeric sum from a direct array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayForEach032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4);
      let sum = 0;
      arr.forEach((value: number): void => {
        sum += value;
      });
      expect(sum).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FOR_EACH_0330
     * @tc.name testArrayForEach033
     * @tc.desc Verify forEach can read values from a reversed copy while preserving ascending callback indexes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayForEach033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(10, 20, 30).toReversed();
      let trace = new Array<string>();
      arr.forEach((value: number, index: int): void => {
        trace.pushOne(index.toString() + ':' + value.toString());
      });
      expect(trace.toString()).assertEqual('0:30,1:20,2:10');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FOR_EACH_0340
     * @tc.name testArrayForEach034
     * @tc.desc Verify forEach exposes the same source array instance to the callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayForEach034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(5, 6, 7);
      let sameArray = false;
      arr.forEach((value: number, index: int, source: Array<number>): void => {
        if (index === 1) {
          sameArray = source === arr;
        }
      });
      expect(sameArray).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FOR_EACH_0350
     * @tc.name testArrayForEach035
     * @tc.desc Verify forEach can gather string lengths
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayForEach035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('red', 'blue', 'gold');
      let lengths = new Array<number>();
      arr.forEach((value: string): void => {
        lengths.pushOne(value.length);
      });
      expect(lengths.toString()).assertEqual('3,4,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FOR_EACH_0360
     * @tc.name testArrayForEach036
     * @tc.desc Verify forEach can count true booleans
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayForEach036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<boolean>(true, false, true, true);
      let count = 0;
      arr.forEach((value: boolean): void => {
        if (value) {
          count++;
        }
      });
      expect(count).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FOR_EACH_0370
     * @tc.name testArrayForEach037
     * @tc.desc Verify forEach can concatenate bigint text in visit order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayForEach037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<bigint>(1n, 3n, 5n);
      let text = '';
      arr.forEach((value: bigint): void => {
        text += value.toString();
      });
      expect(text).assertEqual('135');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FOR_EACH_0380
     * @tc.name testArrayForEach038
     * @tc.desc Verify forEach can iterate over a slice result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayForEach038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(0, 1, 2, 3, 4).slice(1, 4);
      let text = '';
      arr.forEach((value: number): void => {
        text += value.toString();
      });
      expect(text).assertEqual('123');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FOR_EACH_0390
     * @tc.name testArrayForEach039
     * @tc.desc Verify forEach can iterate over a filter result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayForEach039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5, 6).filter((value: number): boolean => value % 2 === 0);
      let total = 0;
      arr.forEach((value: number): void => {
        total += value;
      });
      expect(total).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FOR_EACH_0400
     * @tc.name testArrayForEach040
     * @tc.desc Verify forEach can iterate over a concatenated array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayForEach040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2).concat(new Array<number>(3, 4));
      let log = '';
      arr.forEach((value: number): void => {
        log += value.toString();
      });
      expect(log).assertEqual('1234');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FOR_EACH_0410
     * @tc.name testArrayForEach041
     * @tc.desc Verify forEach can update object fields by reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayForEach041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const first = new ForEachItemA();
      const second = new ForEachItemA();
      const arr = new Array<ForEachItemA>(first, second);
      let seed = 10;
      arr.forEach((item: ForEachItemA): void => {
        item.value = seed;
        seed += 10;
      });
      expect(first.value).assertEqual(10);
      expect(second.value).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FOR_EACH_0420
     * @tc.name testArrayForEach042
     * @tc.desc Verify forEach leaves the source array text unchanged when the callback is pure
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayForEach042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(3, 4, 5);
      const before = arr.toString();
      arr.forEach((value: number): void => {
        value.toString();
      });
      expect(arr.toString()).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FOR_EACH_0430
     * @tc.name testArrayForEach043
     * @tc.desc Verify forEach skips the callback for an empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayForEach043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>();
      let calls = 0;
      arr.forEach((value: number): void => {
        calls++;
      });
      expect(calls).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FOR_EACH_0440
     * @tc.name testArrayForEach044
     * @tc.desc Verify forEach calls the callback once for a single-element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayForEach044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<number>(1, 9);
      let calls = 0;
      arr.forEach((value: number): void => {
        calls++;
      });
      expect(calls).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FOR_EACH_0450
     * @tc.name testArrayForEach045
     * @tc.desc Verify forEach can iterate over a toReversed copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayForEach045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3).toReversed();
      let first: number = 0;
      arr.forEach((value: number, index: int): void => {
        if (index === 0) {
          first = value;
        }
      });
      expect(first).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FOR_EACH_0460
     * @tc.name testArrayForEach046
     * @tc.desc Verify forEach can iterate over a with replacement copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayForEach046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3).with(1, 9);
      let collected = new Array<number>();
      arr.forEach((value: number): void => {
        collected.pushOne(value);
      });
      expect(collected.toString()).assertEqual('1,9,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FOR_EACH_0470
     * @tc.name testArrayForEach047
     * @tc.desc Verify updates to unvisited elements are observed by later callbacks
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayForEach047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      let visited = new Array<number>();
      arr.forEach((value: number, index: int, source: Array<number>): void => {
        if (index === 0) {
          source[2] = 99;
        }
        visited.pushOne(value);
      });
      expect(visited.toString()).assertEqual('1,2,99');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FOR_EACH_0480
     * @tc.name testArrayForEach048
     * @tc.desc Verify shrinking the array length during traversal skips removed later indexes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayForEach048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4);
      let visited = new Array<number>();
      arr.forEach((value: number, index: int, source: Array<number>): void => {
        visited.pushOne(value);
        if (index === 0) {
          source.length = 1;
        }
      });
      expect(visited.toString()).assertEqual('1');
      expect(arr.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FOR_EACH_0490
     * @tc.name testArrayForEach049
     * @tc.desc Verify removing the tail during traversal prevents the removed value from being visited
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayForEach049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      let visited = new Array<number>();
      arr.forEach((value: number, index: int, source: Array<number>): void => {
        visited.pushOne(value);
        if (index === 0) {
          source.pop();
        }
      });
      expect(visited.toString()).assertEqual('1,2');
      expect(arr.toString()).assertEqual('1,2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FOR_EACH_0500
     * @tc.name testArrayForEach050
     * @tc.desc Verify an exception thrown from the callback stops later visits and propagates
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayForEach050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      let calls = 0;
      let thrown = false;
      try {
        arr.forEach((value: number): void => {
          calls++;
          if (value === 2) {
            throw new Error('ForEachStop');
          }
        });
        expect().assertFail();
      } catch (e) {
        thrown = e.name === 'Error' && e.message === 'ForEachStop';
      }
      expect(thrown).assertTrue();
      expect(calls).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FOR_EACH_0510
     * @tc.name testArrayForEach051
     * @tc.desc Verify nested forEach calls preserve outer then inner visit order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayForEach051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<Array<number>>(new Array<number>(1, 2), new Array<number>(3, 4));
      let trace = new Array<string>();
      arr.forEach((inner: Array<number>, outerIndex: int): void => {
        trace.pushOne('outer' + outerIndex.toString());
        inner.forEach((value: number): void => {
          trace.pushOne('inner' + value.toString());
        });
      });
      expect(trace.toString()).assertEqual('outer0,inner1,inner2,outer1,inner3,inner4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FOR_EACH_0520
     * @tc.name testArrayForEach052
     * @tc.desc Verify forEach preserves visit order for a mixed-value union array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayForEach052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | string | boolean>(1, 'a', true);
      let text = '';
      arr.forEach((value: number | string | boolean): void => {
        text += value.toString() + '|';
      });
      expect(text).assertEqual('1|a|true|');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FOR_EACH_0530
     * @tc.name testArrayForEach053
     * @tc.desc Verify forEach can iterate a tuple-typed value collection
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayForEach053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const tuple: [string, number] = ['age', 18];
      const arr = new Array<string | number>(tuple[0], tuple[1]);
      let values = new Array<string>();
      arr.forEach((value: string | number): void => {
        values.pushOne(value.toString());
      });
      expect(values.toString()).assertEqual('age,18');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FOR_EACH_0540
     * @tc.name testArrayForEach054
     * @tc.desc Verify forEach can be used inside a generic helper for string arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayForEach054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(collectText<string>(new Array<string>('x', 'y', 'z'), (value: string): string => value))
        .assertEqual('xyz');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FOR_EACH_0550
     * @tc.name testArrayForEach055
     * @tc.desc Verify forEach visits undefined elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayForEach055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | undefined>(undefined, 1);
      let states = new Array<string>();
      arr.forEach((value: number | undefined): void => {
        states.pushOne(value === undefined ? 'undefined' : value.toString());
      });
      expect(states.toString()).assertEqual('undefined,1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FOR_EACH_0560
     * @tc.name testArrayForEach056
     * @tc.desc Verify forEach visits null elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayForEach056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | null>(null, 2);
      let states = new Array<string>();
      arr.forEach((value: number | null): void => {
        states.pushOne(value === null ? 'null' : value.toString());
      });
      expect(states.toString()).assertEqual('null,2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FOR_EACH_0570
     * @tc.name testArrayForEach057
     * @tc.desc Verify forEach visits NaN values without filtering them out
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayForEach057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(Double.NaN, 2);
      let sawNaN = false;
      let count = 0;
      arr.forEach((value: number): void => {
        if (Number.isNaN(value)) {
          sawNaN = true;
        }
        count++;
      });
      expect(sawNaN).assertTrue();
      expect(count).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FOR_EACH_0580
     * @tc.name testArrayForEach058
     * @tc.desc Verify forEach visits empty string elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayForEach058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('', 'b');
      let lengths = new Array<number>();
      arr.forEach((value: string): void => {
        lengths.pushOne(value.length);
      });
      expect(lengths.toString()).assertEqual('0,1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FOR_EACH_0590
     * @tc.name testArrayForEach059
     * @tc.desc Verify forEach can visit function references as values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayForEach059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Array<() => int> = [(): int => 1, (): int => 2];
      let total = 0;
      arr.forEach((value: () => int): void => {
        total += value();
      });
      expect(total).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FOR_EACH_0600
     * @tc.name testArrayForEach060
     * @tc.desc Verify forEach visits promise references without awaiting them
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayForEach060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Array<Promise<int>> = [Promise.resolve(1), Promise.resolve(2)];
      let count = 0;
      arr.forEach((value: Promise<int>): void => {
        expect(value).assertInstanceOf('Promise');
        count++;
      });
      expect(count).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FOR_EACH_0610
     * @tc.name testArrayForEach061
     * @tc.desc Verify callback return values are ignored by forEach
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayForEach061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2);
      let count = 0;
      let result = arr.forEach((value: number): void => {
        count += value;
        return;
      });
      expect(count).assertEqual(3);
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FOR_EACH_0620
     * @tc.name testArrayForEach062
     * @tc.desc Verify returning early only exits the current callback body
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayForEach062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      let seen = new Array<number>();
      arr.forEach((value: number): void => {
        if (value === 2) {
          return;
        }
        seen.pushOne(value);
      });
      expect(seen.toString()).assertEqual('1,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FOR_EACH_0630
     * @tc.name testArrayForEach063
     * @tc.desc Verify modifying an already visited element does not rewrite recorded visits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayForEach063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      let seen = new Array<number>();
      arr.forEach((value: number, index: int, source: Array<number>): void => {
        seen.pushOne(value);
        if (index === 1) {
          source[0] = 99;
        }
      });
      expect(seen.toString()).assertEqual('1,2,3');
      expect(arr[0]).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FOR_EACH_0640
     * @tc.name testArrayForEach064
     * @tc.desc Verify shrinking array length during traversal stops visits beyond the new tail
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayForEach064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(7, 8, 9);
      let count = 0;
      arr.forEach((value: number, _index: int, source: Array<number>): void => {
        expect(value).assertEqual(7);
        source.length = 1;
        count++;
      });
      expect(count).assertEqual(1);
      expect(arr.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FOR_EACH_0650
     * @tc.name testArrayForEach065
     * @tc.desc Verify replacing a later element with undefined changes the later callback value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayForEach065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | undefined>(1, 2);
      let states = new Array<string>();
      arr.forEach((value: number | undefined, index: int, source: Array<number | undefined>): void => {
        if (index === 0) {
          source[1] = undefined;
        }
        states.pushOne(value === undefined ? 'undefined' : value.toString());
      });
      expect(states.toString()).assertEqual('1,undefined');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FOR_EACH_0660
     * @tc.name testArrayForEach066
     * @tc.desc Verify rebinding the outer array variable does not affect the active traversal source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayForEach066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2);
      const original = arr;
      let seen = new Array<number>();
      let callbackStayedBound = true;
      arr.forEach((value: number, _index: int, source: Array<number>): void => {
        seen.pushOne(value);
        if (source !== original) {
          callbackStayedBound = false;
        }
        arr = new Array<number>(9, 9, 9);
      });
      expect(seen.toString()).assertEqual('1,2');
      expect(callbackStayedBound).assertTrue();
      expect(original.toString()).assertEqual('1,2');
      expect(arr.toString()).assertEqual('9,9,9');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FOR_EACH_0670
     * @tc.name testArrayForEach067
     * @tc.desc Verify multiple forEach calls on the same array are independent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayForEach067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(2, 4);
      let first = 0;
      let second = '';
      arr.forEach((value: number): void => {
        first += value;
      });
      arr.forEach((value: number): void => {
        second += value.toString();
      });
      expect(first).assertEqual(6);
      expect(second).assertEqual('24');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FOR_EACH_0680
     * @tc.name testArrayForEach068
     * @tc.desc Verify an exception from a nested inner forEach stops the outer traversal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayForEach068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<Array<number>>(new Array<number>(1, 2), new Array<number>(3, 4));
      let outerCount = 0;
      let innerCount = 0;
      let thrown = false;
      try {
        arr.forEach((inner: Array<number>): void => {
          outerCount++;
          inner.forEach((value: number): void => {
            innerCount++;
            if (value === 2) {
              throw new Error('NestedStop');
            }
          });
        });
        expect().assertFail();
      } catch (e) {
        thrown = e.name === 'Error' && e.message === 'NestedStop';
      }
      expect(thrown).assertTrue();
      expect(outerCount).assertEqual(1);
      expect(innerCount).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FOR_EACH_0690
     * @tc.name testArrayForEach069
     * @tc.desc Verify a pure callback leaves the original array identical to a saved snapshot
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayForEach069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(5, 6, 7);
      const before = arr.toString();
      arr.forEach((value: number): void => {
        let copy = value.toString();
        expect(copy.length > 0).assertTrue();
      });
      expect(arr.toString()).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FOR_EACH_0700
     * @tc.name testArrayForEach070
     * @tc.desc Verify forEach works on an Array.of result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayForEach070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.of<number>(4, 5, 6);
      let sum = 0;
      arr.forEach((value: number): void => {
        sum += value;
      });
      expect(sum).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FOR_EACH_0710
     * @tc.name testArrayForEach071
     * @tc.desc Verify forEach works on an Array.from result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayForEach071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.from<number>(new Array<number>(4, 5, 6));
      let text = '';
      arr.forEach((value: number): void => {
        text += value.toString();
      });
      expect(text).assertEqual('456');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FOR_EACH_0720
     * @tc.name testArrayForEach072
     * @tc.desc Verify forEach visits the new order after reverse mutates the array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayForEach072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      arr.reverse();
      let text = '';
      arr.forEach((value: number): void => {
        text += value.toString();
      });
      expect(text).assertEqual('321');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FOR_EACH_0730
     * @tc.name testArrayForEach073
     * @tc.desc Verify forEach visits values in sorted order after sort mutates the array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayForEach073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(3, 1, 2);
      arr.sort(compareNumberAsc);
      let text = '';
      arr.forEach((value: number): void => {
        text += value.toString();
      });
      expect(text).assertEqual('123');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FOR_EACH_0740
     * @tc.name testArrayForEach074
     * @tc.desc Verify forEach reports the expected value and index for a single-element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayForEach074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<number>(1, 99);
      let captured = '';
      arr.forEach((value: number, index: int): void => {
        captured = value.toString() + ':' + index.toString();
      });
      expect(captured).assertEqual('99:0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FOR_EACH_0750
     * @tc.name testArrayForEach075
     * @tc.desc Verify forEach reports both values and indexes for a two-element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayForEach075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(4, 8);
      let trace = new Array<string>();
      arr.forEach((value: number, index: int): void => {
        trace.pushOne(index.toString() + ':' + value.toString());
      });
      expect(trace.toString()).assertEqual('0:4,1:8');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FOR_EACH_0760
     * @tc.name testArrayForEach076
     * @tc.desc Verify forEach preserves duplicate values and visits each occurrence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayForEach076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(2, 2, 3, 2);
      let countTwo = 0;
      arr.forEach((value: number): void => {
        if (value === 2) {
          countTwo++;
        }
      });
      expect(countTwo).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FOR_EACH_0770
     * @tc.name testArrayForEach077
     * @tc.desc Verify forEach preserves order for negative zero and positive values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayForEach077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(-3, 0, 5);
      let text = '';
      arr.forEach((value: number): void => {
        text += value.toString() + ',';
      });
      expect(text).assertEqual('-3,0,5,');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FOR_EACH_0780
     * @tc.name testArrayForEach078
     * @tc.desc Verify forEach receives the original object references from the source array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayForEach078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const first = new ForEachItemA();
      const second = new ForEachItemA();
      const arr = new Array<ForEachItemA>(first, second);
      let sameRefs = false;
      arr.forEach((value: ForEachItemA, index: int): void => {
        if (index === 0) {
          expect(value === first).assertTrue();
        } else {
          expect(value === second).assertTrue();
        }
      });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FOR_EACH_0790
     * @tc.name testArrayForEach079
     * @tc.desc Verify forEach can build index-value text output in visit order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayForEach079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('a', 'b', 'c');
      let text = '';
      arr.forEach((value: string, index: int): void => {
        text += index.toString() + '=' + value + ';';
      });
      expect(text).assertEqual('0=a;1=b;2=c;');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FOR_EACH_0800
     * @tc.name testArrayForEach080
     * @tc.desc Verify forEach can collect even-number flags in a side-effect array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayForEach080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4);
      let flags = new Array<boolean>();
      arr.forEach((value: number): void => {
        flags.pushOne(value % 2 === 0);
      });
      expect(flags.toString()).assertEqual('false,true,false,true');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FOR_EACH_0810
     * @tc.name testArrayForEach081
     * @tc.desc Verify shift during traversal changes later observed values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayForEach081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      let visited = new Array<number>();
      arr.forEach((value: number, index: int, source: Array<number>): void => {
        visited.pushOne(value);
        if (index === 0) {
          source.shift();
        }
      });
      expect(visited.toString()).assertEqual('1,3');
      expect(arr.toString()).assertEqual('2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FOR_EACH_0820
     * @tc.name testArrayForEach082
     * @tc.desc Verify unshift during traversal can cause a moved value to be visited again
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayForEach082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      let visited = new Array<number>();
      arr.forEach((value: number, index: int, source: Array<number>): void => {
        visited.pushOne(value);
        if (index === 0) {
          source.unshift(0);
        }
      });
      expect(visited.toString()).assertEqual('1,1,2');
      expect(arr.toString()).assertEqual('0,1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FOR_EACH_0830
     * @tc.name testArrayForEach083
     * @tc.desc Verify splice can remove a later element before its callback executes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayForEach083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4);
      let visited = new Array<number>();
      arr.forEach((value: number, index: int, source: Array<number>): void => {
        visited.pushOne(value);
        if (index === 0) {
          source.splice(2, 1);
        }
      });
      expect(visited.toString()).assertEqual('1,2,4');
      expect(arr.toString()).assertEqual('1,2,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FOR_EACH_0840
     * @tc.name testArrayForEach084
     * @tc.desc Verify splice can insert a new element that is later visited within the initial length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayForEach084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      let visited = new Array<number>();
      arr.forEach((value: number, index: int, source: Array<number>): void => {
        visited.pushOne(value);
        if (index === 0) {
          source.splice(1, 0, 9);
        }
      });
      expect(visited.toString()).assertEqual('1,9,2');
      expect(arr.toString()).assertEqual('1,9,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FOR_EACH_0850
     * @tc.name testArrayForEach085
     * @tc.desc Verify changing the current element does not alter the already received callback value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayForEach085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2);
      let seen = new Array<number>();
      arr.forEach((value: number, index: int, source: Array<number>): void => {
        seen.pushOne(value);
        if (index === 0) {
          source[0] = 99;
        }
      });
      expect(seen.toString()).assertEqual('1,2');
      expect(arr.toString()).assertEqual('99,2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FOR_EACH_0860
     * @tc.name testArrayForEach086
     * @tc.desc Verify setting length to zero stops all remaining callbacks
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayForEach086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      let visited = new Array<number>();
      arr.forEach((value: number, index: int, source: Array<number>): void => {
        visited.pushOne(value);
        if (index === 0) {
          source.length = 0;
        }
      });
      expect(visited.toString()).assertEqual('1');
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FOR_EACH_0870
     * @tc.name testArrayForEach087
     * @tc.desc Verify pushOne during traversal does not extend the current traversal count
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayForEach087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2);
      let visited = new Array<number>();
      arr.forEach((value: number, index: int, source: Array<number>): void => {
        visited.pushOne(value);
        if (index === 0) {
          source.pushOne(9);
          source.pushOne(10);
        }
      });
      expect(visited.toString()).assertEqual('1,2');
      expect(arr.toString()).assertEqual('1,2,9,10');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FOR_EACH_0880
     * @tc.name testArrayForEach088
     * @tc.desc Verify forEach can iterate over a toSorted result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayForEach088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(4, 1, 3).toSorted(compareNumberAsc);
      let text = '';
      arr.forEach((value: number): void => {
        text += value.toString();
      });
      expect(text).assertEqual('134');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FOR_EACH_0890
     * @tc.name testArrayForEach089
     * @tc.desc Verify forEach can iterate over a toSpliced result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayForEach089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3).toSpliced(1, 1, 9, 8);
      let text = '';
      arr.forEach((value: number): void => {
        text += value.toString();
      });
      expect(text).assertEqual('1983');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FOR_EACH_0900
     * @tc.name testArrayForEach090
     * @tc.desc Verify forEach can iterate over a copyWithin-mutated array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayForEach090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4);
      arr.copyWithin(1, 0, 2);
      let text = '';
      arr.forEach((value: number): void => {
        text += value.toString();
      });
      expect(text).assertEqual('1124');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FOR_EACH_0910
     * @tc.name testArrayForEach091
     * @tc.desc Verify forEach visits repeated references for every array position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayForEach091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const item = new ForEachItemA();
      const arr = new Array<ForEachItemA>(item, item, item);
      let visits = 0;
      arr.forEach((value: ForEachItemA): void => {
        value.value += 1;
        visits++;
      });
      expect(visits).assertEqual(3);
      expect(item.value).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FOR_EACH_0920
     * @tc.name testArrayForEach092
     * @tc.desc Verify arrays built with T plus [] syntax can call forEach normally
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayForEach092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: string[] = ['a', 'b', 'c'];
      let text = '';
      arr.forEach((value: string, index: int, source: Array<string>): void => {
        expect(source.length).assertEqual(3);
        text += index.toString() + value;
      });
      expect(text).assertEqual('0a1b2c');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FOR_EACH_0930
     * @tc.name testArrayForEach093
     * @tc.desc Verify arrays built with Array type plus [] literal syntax can call forEach normally
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayForEach093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Array<number> = [2, 4, 6];
      let total = 0;
      arr.forEach((value: number, index: int): void => {
        total += value + index;
      });
      expect(total).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FOR_EACH_0940
     * @tc.name testArrayForEach094
     * @tc.desc Verify forEach can visit Array collection objects as element values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayForEach094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const first: Array<number> = [1, 2];
      const second: Array<number> = [3, 4, 5];
      const arr: Array<Array<number>> = [first, second];
      let lengths = new Array<number>();
      let total = 0;
      arr.forEach((value: Array<number>): void => {
        lengths.pushOne(value.length);
        value.forEach((item: number): void => {
          total += item;
        });
      });
      expect(lengths.toString()).assertEqual('2,3');
      expect(total).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FOR_EACH_0950
     * @tc.name testArrayForEach095
     * @tc.desc Verify forEach can visit Set collection objects as element values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayForEach095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const first = new Set<number>(new Array<number>(1, 2, 2));
      const second = new Set<number>(new Array<number>(3, 4));
      const arr: Array<Set<number>> = [first, second];
      let sizes = new Array<number>();
      let total = 0;
      arr.forEach((value: Set<number>): void => {
        const values = Array.from<number>(value);
        sizes.pushOne(values.length);
        values.forEach((item: number): void => {
          total += item;
        });
      });
      expect(sizes.toString()).assertEqual('2,2');
      expect(total).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FOR_EACH_0960
     * @tc.name testArrayForEach096
     * @tc.desc Verify forEach can visit Map collection objects as element values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayForEach096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const first = new Map<string, number>();
      first.set('a', 1);
      first.set('b', 2);
      const second = new Map<string, number>();
      second.set('c', 3);
      const arr: Array<Map<string, number>> = [first, second];
      let sizes = new Array<number>();
      let total = 0;
      arr.forEach((value: Map<string, number>): void => {
        const values = Array.from<number>(value.values());
        sizes.pushOne(values.length);
        values.forEach((item: number): void => {
          total += item;
        });
      });
      expect(sizes.toString()).assertEqual('2,1');
      expect(total).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FOR_EACH_0970
     * @tc.name testArrayForEach097
     * @tc.desc Verify forEach can visit Function and arrow-void function object values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayForEach097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arrowExecuted = false;
      const named: Function = compareNumberAsc;
      const arrow: () => void = (): void => {
        arrowExecuted = true;
      };
      const arr: Array<Function | (() => void)> = [named, arrow];
      let count = 0;
      arr.forEach((value: Function | (() => void), index: int): void => {
        expect(value instanceof Function).assertTrue();
        if (index === 1) {
          (value as () => void)();
        }
        count++;
      });
      expect(count).assertEqual(2);
      expect(arrowExecuted).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FOR_EACH_0980
     * @tc.name testArrayForEach098
     * @tc.desc Verify recursive array type aliases can call forEach on nested array values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayForEach098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const child: arrStr = ['b', ['c']];
      const arr: arrStr = ['a', child];
      let text = '';
      let nestedCount = 0;
      arr.forEach((value: string | arrStr): void => {
        if (typeof value === 'string') {
          text += value;
        } else {
          nestedCount++;
          let nested = value as arrStr;
          nested.forEach((inner: string | arrStr): void => {
            if (typeof inner === 'string') {
              text += inner;
            } else {
              let deeper = inner as arrStr;
              expect(deeper.length).assertEqual(1);
              nestedCount++;
            }
          });
        }
      });
      expect(text).assertEqual('ab');
      expect(nestedCount).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FOR_EACH_0990
     * @tc.name testArrayForEach099
     * @tc.desc Verify forEach works after narrowing an Any value back to Array<number>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayForEach099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const anyValue: Any = new Array<number>(1, 2, 3);
      expect(sumAnyNumberArrayByForEach(anyValue)).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FOR_EACH_1000
     * @tc.name testArrayForEach100
     * @tc.desc Verify forEach supports arrays whose element type is Any
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayForEach100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const anyArr = new Array<Any>(1, 'two', true);
      let trace = '';
      anyArr.forEach((_value: Any, index: int): void => {
        trace += index.toString();
      });
      expect(trace).assertEqual('012');
      expect(anyArr.toString()).assertEqual('1,two,true');
    });
  });
}
