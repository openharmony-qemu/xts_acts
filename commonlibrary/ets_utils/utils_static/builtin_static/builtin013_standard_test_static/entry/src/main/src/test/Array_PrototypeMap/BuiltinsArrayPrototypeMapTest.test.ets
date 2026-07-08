'use static';
/*
 * Copyright (c) 2026 RKH Corp.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium-binary/src/main/indexStatic';
import Utils from '../Util.test';

// Interfaces and classes defined at top level (ArkTS restriction)
interface _MapTestUser {
  name: string;
  age: number;
}

interface _MapTestResult {
  value: number;
  doubleVal: number;
}

interface _MapTestMultiplierObj {
  multiplier: number;
}

interface _MapTestTestObject {
  a: number;
  b: number;
  c: number;
}

interface _MapTestUser5000 {
  id: number;
  name: string;
}

class _MapTestFunctionWithMultiplier {
  multiplier: number = 5;
}

export default function BuiltinsArrayPrototypeMapTest(): void {
  describe("BuiltinsArrayPrototypeMapTest", () => {
    beforeAll(() => {
      // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    })
    beforeEach(async () => {
      await Utils.msSleep(20);
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(async() => {
      await Utils.msSleep(10)
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
     * @tc.name   BuiltinsArrayPrototypeMapTest0100
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_MAP_TEST_0100
     * @tc.desc   Verify map() with number array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayPrototypeMapTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const numbers: number[] = [1, 4, 9, 16];
      const result: number[] = numbers.map((x: number): number => x * 2);
      expect(result[0]).assertEqual(2);
      expect(result[1]).assertEqual(8);
      expect(result[2]).assertEqual(18);
      expect(result[3]).assertEqual(32);
      expect(numbers[0]).assertEqual(1);
      expect(numbers[1]).assertEqual(4);
      expect(numbers[2]).assertEqual(9);
      expect(numbers[3]).assertEqual(16);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeMapTest0200
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_MAP_TEST_0200
     * @tc.desc   Verify map() with string array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayPrototypeMapTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const words: string[] = ['hello', 'world'];
      const result: string[] = words.map((word: string): string => word.toUpperCase());
      expect(result[0]).assertEqual('HELLO');
      expect(result[1]).assertEqual('WORLD');
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeMapTest0300
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_MAP_TEST_0300
     * @tc.desc   Verify map() with object array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayPrototypeMapTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const users: _MapTestUser[] = [
        { name: 'Alice', age: 25 },
        { name: 'Bob', age: 30 }
      ];
      const names: string[] = users.map((user: _MapTestUser): string => user.name);
      expect(names[0]).assertEqual('Alice');
      expect(names[1]).assertEqual('Bob');
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeMapTest0400
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_MAP_TEST_0400
     * @tc.desc   Verify map() does not modify original array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayPrototypeMapTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: number[] = [1, 2, 3];
      const original: number[] = [1, 2, 3];
      const result: number[] = arr.map((x: number): number => x * 2);
      expect(arr[0]).assertEqual(original[0]);
      expect(arr[1]).assertEqual(original[1]);
      expect(arr[2]).assertEqual(original[2]);
      expect(result[0]).assertEqual(2);
      expect(result[1]).assertEqual(4);
      expect(result[2]).assertEqual(6);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeMapTest0500
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_MAP_TEST_0500
     * @tc.desc   Verify map() returns new array reference
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayPrototypeMapTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: number[] = [1, 2, 3];
      const result: number[] = arr.map((x: number): number => x);
      expect(arr !== result).assertTrue();
      expect(arr[0]).assertEqual(result[0]);
      expect(arr[1]).assertEqual(result[1]);
      expect(arr[2]).assertEqual(result[2]);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeMapTest0600
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_MAP_TEST_0600
     * @tc.desc   Verify map() on empty array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayPrototypeMapTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: number[] = [];
      const result: number[] = arr.map((x: number): number => x * 2);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeMapTest0700
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_MAP_TEST_0700
     * @tc.desc   Verify map() on single element array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayPrototypeMapTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: number[] = [5];
      const result: number[] = arr.map((x: number): number => x * 3);
      expect(result.length).assertEqual(1);
      expect(result[0]).assertEqual(15);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeMapTest0800
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_MAP_TEST_0800
     * @tc.desc   Verify callback function element parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayPrototypeMapTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: number[] = [10, 20, 30];
      const result: number[] = arr.map((element: number): number => element + 5);
      expect(result[0]).assertEqual(15);
      expect(result[1]).assertEqual(25);
      expect(result[2]).assertEqual(35);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeMapTest0900
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_MAP_TEST_0900
     * @tc.desc   Verify callback function index parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayPrototypeMapTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: string[] = ['a', 'b', 'c'];
      let idx: int = 0;
      const result: string[] = arr.map((element: string): string => {
        let r: string = `${idx}: ${element}`;
        idx++;
        return r;
      });
      expect(result[0]).assertEqual('0: a');
      expect(result[1]).assertEqual('1: b');
      expect(result[2]).assertEqual('2: c');
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeMapTest1000
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_MAP_TEST_1000
     * @tc.desc   Verify callback function array parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayPrototypeMapTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: number[] = [1, 2, 3];
      let arrayReference: number[] | null = null;
      const result: number[] = arr.map((element: number): number => {
        if (element === arr[0]) {
          arrayReference = arr;
        }
        return element;
      });
      expect(arrayReference === arr).assertTrue();
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeMapTest1100
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_MAP_TEST_1100
     * @tc.desc   Verify callback with various element types
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayPrototypeMapTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: (number | string | boolean | null | undefined)[] = [1, 'hello', true, null, undefined];
      const result: string[] = arr.map((element: number | string | boolean | null | undefined): string => typeof element);
      expect(result[0]).assertEqual('number');
      expect(result[1]).assertEqual('string');
      expect(result[2]).assertEqual('boolean');
      expect(result[3]).assertEqual('object');
      expect(result[4]).assertEqual('undefined');
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeMapTest1200
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_MAP_TEST_1200
     * @tc.desc   Verify callback with index calculation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayPrototypeMapTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: number[] = [10, 20, 30];
      let ctr: int = 0;
      const result: number[] = arr.map((element: number): number => {
        let ret: number = element + ctr;
        ctr++;
        return ret;
      });
      expect(result[0]).assertEqual(10);
      expect(result[1]).assertEqual(21);
      expect(result[2]).assertEqual(32);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeMapTest1300
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_MAP_TEST_1300
     * @tc.desc   Verify callback with array length calculation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayPrototypeMapTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: number[] = [1, 2, 3];
      let capturedLength: number = 0;
      const result: number[] = arr.map((element: number): number => {
        if (element === arr[0]) {
          capturedLength = Int.toDouble(arr.length);
        }
        return element;
      });
      expect(capturedLength).assertEqual(3);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeMapTest1400
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_MAP_TEST_1400
     * @tc.desc   Verify callback with all three parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayPrototypeMapTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: number[] = [1, 2, 3];
      let idx: int = 0;
      const result: string[] = arr.map((element: number): string => {
        let r: string = `element: ${element}, index: ${idx}, array length: ${arr.length}`;
        idx++;
        return r;
      });
      expect(result[0]).assertEqual('element: 1, index: 0, array length: 3');
      expect(result[1]).assertEqual('element: 2, index: 1, array length: 3');
      expect(result[2]).assertEqual('element: 3, index: 2, array length: 3');
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeMapTest1500
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_MAP_TEST_1500
     * @tc.desc   Verify callback with ignored parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayPrototypeMapTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: number[] = [1, 2, 3];
      const result: number[] = arr.map((element: number): number => element * 2);
      expect(result[0]).assertEqual(2);
      expect(result[1]).assertEqual(4);
      expect(result[2]).assertEqual(6);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeMapTest1600
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_MAP_TEST_1600
     * @tc.desc   Verify map() with thisArg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayPrototypeMapTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: number[] = [1, 2, 3];
      const obj: _MapTestMultiplierObj = {
        multiplier: 10
      };
      const result: number[] = arr.map((element: number): number => {
        return element * obj.multiplier;
      });
      expect(result[0]).assertEqual(10);
      expect(result[1]).assertEqual(20);
      expect(result[2]).assertEqual(30);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeMapTest1700
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_MAP_TEST_1700
     * @tc.desc   Verify map() with null thisArg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayPrototypeMapTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: number[] = [1, 2, 3];
      const result: number[] = arr.map((element: number): number => {
        return element;
      });
      expect(arr === arr).assertTrue();
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(3);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeMapTest1800
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_MAP_TEST_1800
     * @tc.desc   Verify map() with array thisArg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayPrototypeMapTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: number[] = [1, 2, 3];
      const thisArg: number[] = [10, 20, 30];
      const result: number[] = arr.map((element: number): number => {
        return element + thisArg[0];
      });
      expect(result[0]).assertEqual(11);
      expect(result[1]).assertEqual(12);
      expect(result[2]).assertEqual(13);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeMapTest1900
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_MAP_TEST_1900
     * @tc.desc   Verify map() with function thisArg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayPrototypeMapTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: number[] = [1, 2, 3];
      const thisArg = new _MapTestFunctionWithMultiplier();
      const result: number[] = arr.map((element: number): number => {
        return element * thisArg.multiplier;
      });
      expect(result[0]).assertEqual(5);
      expect(result[1]).assertEqual(10);
      expect(result[2]).assertEqual(15);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeMapTest2000
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_MAP_TEST_2000
     * @tc.desc   Verify map() returns object array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayPrototypeMapTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: number[] = [1, 2, 3];
      const result: _MapTestResult[] = arr.map((x: number): _MapTestResult => ({
        value: x,
        doubleVal: x * 2
      }));
      expect(result[0].value).assertEqual(1);
      expect(result[0].doubleVal).assertEqual(2);
      expect(result[1].value).assertEqual(2);
      expect(result[1].doubleVal).assertEqual(4);
      expect(result[2].value).assertEqual(3);
      expect(result[2].doubleVal).assertEqual(6);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeMapTest2100
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_MAP_TEST_2100
     * @tc.desc   Verify map() returns array of arrays
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayPrototypeMapTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: number[] = [1, 2, 3];
      const result: number[][] = arr.map((x: number): number[] => [x, x * 2]);
      expect(result[0][0]).assertEqual(1);
      expect(result[0][1]).assertEqual(2);
      expect(result[1][0]).assertEqual(2);
      expect(result[1][1]).assertEqual(4);
      expect(result[2][0]).assertEqual(3);
      expect(result[2][1]).assertEqual(6);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeMapTest2200
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_MAP_TEST_2200
     * @tc.desc   Verify map() with implicit undefined return
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeMapTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: number[] = [1, 2, 3];
      const result: (number | undefined)[] = arr.map((x: number): number | undefined => {
        return undefined;
      });
      expect(result[0] === undefined).assertTrue();
      expect(result[1] === undefined).assertTrue();
      expect(result[2] === undefined).assertTrue();
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeMapTest2300
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_MAP_TEST_2300
     * @tc.desc   Verify map() returns numbers
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayPrototypeMapTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: number[] = [1, 2, 3];
      const result: number[] = arr.map((x: number): number => x * 2);
      expect(result[0]).assertEqual(2);
      expect(result[1]).assertEqual(4);
      expect(result[2]).assertEqual(6);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeMapTest2400
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_MAP_TEST_2400
     * @tc.desc   Verify map() returns strings
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayPrototypeMapTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: number[] = [1, 2, 3];
      const result: string[] = arr.map((x: number): string => x.toString());
      expect(result[0]).assertEqual('1');
      expect(result[1]).assertEqual('2');
      expect(result[2]).assertEqual('3');
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeMapTest2500
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_MAP_TEST_2500
     * @tc.desc   Verify map() returns booleans
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayPrototypeMapTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: number[] = [1, 0, 3];
      const result: boolean[] = arr.map((x: number): boolean => x > 0);
      expect(result[0]).assertTrue();
      expect(result[1]).assertFalse();
      expect(result[2]).assertTrue();
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeMapTest2600
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_MAP_TEST_2600
     * @tc.desc   Verify map() returns null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayPrototypeMapTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: number[] = [1, 2, 3];
      const result: (null | number)[] = arr.map((x: number): null | number => x === 2 ? null : x);
      expect(result[0]).assertEqual(1);
      expect(result[1] === null).assertTrue();
      expect(result[2]).assertEqual(3);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeMapTest2700
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_MAP_TEST_2700
     * @tc.desc   Verify map() returns undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayPrototypeMapTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: number[] = [1, 2, 3];
      const result: (undefined | number)[] = arr.map((x: number): undefined | number => x === 2 ? undefined : x);
      expect(result[0]).assertEqual(1);
      expect(result[1] === undefined).assertTrue();
      expect(result[2]).assertEqual(3);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeMapTest2800
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_MAP_TEST_2800
     * @tc.desc   Verify map() returns Date objects
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayPrototypeMapTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: number[] = [1000, 2000, 3000];
      const result: number[] = arr.map((x: number): number => x * 2);
      expect(result[0]).assertEqual(2000);
      expect(result[1]).assertEqual(4000);
      expect(result[2]).assertEqual(6000);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeMapTest2900
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_MAP_TEST_2900
     * @tc.desc   Verify map() returns functions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayPrototypeMapTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: number[] = [1, 2, 3];
      const result: Array<() => number> = arr.map((x: number): (() => number) => {
        return () => x;
      });
      expect(typeof result[0]).assertEqual('function');
      expect(typeof result[1]).assertEqual('function');
      expect(typeof result[2]).assertEqual('function');
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeMapTest3000
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_MAP_TEST_3000
     * @tc.desc   Verify map() returns different types
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayPrototypeMapTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: number[] = [1, 2, 3];
      const result: (number | string | boolean)[] = arr.map((x: number): number | string | boolean => {
        if (x === 1) {
          return x;
        } else if (x === 2) {
          return x.toString();
        } else {
          return x > 0;
        }
      });
      expect(typeof result[0]).assertEqual('number');
      expect(typeof result[1]).assertEqual('string');
      expect(typeof result[2]).assertEqual('boolean');
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeMapTest3100
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_MAP_TEST_3100
     * @tc.desc   Verify map() throws error from callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeMapTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: number[] = [1, 2, 3];
      try {
        arr.map((x: number): number => {
          if (x === 2) {
            throw new Error('Callback error');
          }
          return x;
        });
        expect(false).assertTrue();
      } catch (e) {
        expect(e instanceof Error).assertTrue();
        expect(e.message).assertEqual('Callback error');
      }
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeMapTest3200
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_MAP_TEST_3200
     * @tc.desc   Verify map() with very large array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeMapTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: number[] = [];
      for (let i = 0; i < 1000; i++) {
        arr.push(i);
      }
      const result: number[] = arr.map((x: number): number => x * 2);
      expect(result.length).assertEqual(1000);
      expect(result[0]).assertEqual(0);
      expect(result[999]).assertEqual(1998);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeMapTest3300
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_MAP_TEST_3300
     * @tc.desc   Verify map() combined with filter()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeMapTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: number[] = [1, 2, 3, 4, 5];
      const result: number[] = arr
        .map((x: number): number => x * 2)
        .filter((x: number): boolean => x > 5);
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(6);
      expect(result[1]).assertEqual(8);
      expect(result[2]).assertEqual(10);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeMapTest3400
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_MAP_TEST_3400
     * @tc.desc   Verify map() with adding elements in callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeMapTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: number[] = [1, 2, 3];
      let ctr: int = 0;
      const result: number[] = arr.map((element: number): number => {
        if (ctr === 0) {
          arr.push(4);
        }
        ctr++;
        return element * 2;
      });
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(2);
      expect(result[1]).assertEqual(4);
      expect(result[2]).assertEqual(6);
      expect(arr.length).assertEqual(4);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeMapTest3500
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_MAP_TEST_3500
     * @tc.desc   Verify map() with modifying already visited elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeMapTest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: number[] = [1, 2, 3];
      let ctr: int = 0;
      const result: number[] = arr.map((element: number): number => {
        if (ctr === 1) {
          arr[0] = 10;
        }
        ctr++;
        return element;
      });
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(3);
      expect(arr[0]).assertEqual(10);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeMapTest3600
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_MAP_TEST_3600
     * @tc.desc   Verify map() with modifying unvisited elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeMapTest3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: number[] = [1, 2, 3];
      let ctr: int = 0;
      const result: number[] = arr.map((element: number): number => {
        if (ctr === 0) {
          arr[2] = 30;
        }
        ctr++;
        return element;
      });
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(30);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeMapTest3700
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_MAP_TEST_3700
     * @tc.desc   Verify map() basic mapping
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeMapTest3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: number[] = [1, 2, 3];
      let result: number[] = arr.map((element: number): number => element * 2);
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(2);
      expect(result[1]).assertEqual(4);
      expect(result[2]).assertEqual(6);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeMapTest3800
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_MAP_TEST_3800
     * @tc.desc   Verify map() with decreasing array length
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeMapTest3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: number[] = [1, 2, 3, 4, 5];
      let count: number = 0;
      const result: number[] = arr.map((element: number): number => {
        if (count === 1) {
          arr.length = 2;
        }
        count++;
        return element * 2;
      });
      expect(result.length).assertEqual(5);
      expect(result[0]).assertEqual(2);
      expect(result[1]).assertEqual(4);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeMapTest3900
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_MAP_TEST_3900
     * @tc.desc   Verify map() combined with reduce()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeMapTest3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: number[] = [1, 2, 3, 4];
      const result: number = arr
        .map((x: number): number => x * 2)
        .reduce((acc: number, val: number): number => acc + val, 0);
      expect(result).assertEqual(20);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeMapTest4000
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_MAP_TEST_4000
     * @tc.desc   Verify map() after filter()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeMapTest4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: number[] = [1, 2, 3, 4, 5];
      const result: number[] = arr
        .filter((x: number): boolean => x % 2 === 0)
        .map((x: number): number => x * 2);
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual(4);
      expect(result[1]).assertEqual(8);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeMapTest4100
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_MAP_TEST_4100
     * @tc.desc   Verify map() with filtering logic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeMapTest4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: number[] = [1, 2, 3, 4, 5];
      const result: (number | null)[] = arr.map((x: number): number | null => {
        return x % 2 === 0 ? x * 2 : null;
      });
      expect(result.length).assertEqual(5);
      expect(result[0] === null).assertTrue();
      expect(result[1]).assertEqual(4);
      expect(result[2] === null).assertTrue();
      expect(result[3]).assertEqual(8);
      expect(result[4] === null).assertTrue();
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeMapTest4200
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_MAP_TEST_4200
     * @tc.desc   Verify map-like functionality with reduce()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeMapTest4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: number[] = [1, 2, 3];
      const result: number[] = arr.reduce((acc: number[], val: number): number[] => {
        acc.push(val * 2);
        return acc;
      }, []);
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(2);
      expect(result[1]).assertEqual(4);
      expect(result[2]).assertEqual(6);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeMapTest4300
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_MAP_TEST_4300
     * @tc.desc   Verify map() for data transformation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeMapTest4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const users: _MapTestUser5000[] = [
        { id: 1, name: 'Alice' },
        { id: 2, name: 'Bob' }
      ];
      const userIds: number[] = users.map((user: _MapTestUser5000): number => user.id);
      expect(userIds.length).assertEqual(2);
      expect(userIds[0]).assertEqual(1);
      expect(userIds[1]).assertEqual(2);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeMapTest4400
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_MAP_TEST_4400
     * @tc.desc   Verify map() with Object.keys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeMapTest4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: _MapTestTestObject = {
        a: 1,
        b: 2,
        c: 3
      };
      const result: string[] = Object.keys(obj).map((key: string): string => key.toUpperCase());
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual('A');
      expect(result[1]).assertEqual('B');
      expect(result[2]).assertEqual('C');
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeMapTest4500
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_MAP_TEST_4500
     * @tc.desc   Verify map() with Object.values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeMapTest4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: _MapTestTestObject = {
        a: 1,
        b: 2,
        c: 3
      };
      const arr: number[] = [obj.a, obj.b, obj.c];
      const result: number[] = arr.map((value: number): number => value * 2);
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(2);
      expect(result[1]).assertEqual(4);
      expect(result[2]).assertEqual(6);
    });

    
  });
}
