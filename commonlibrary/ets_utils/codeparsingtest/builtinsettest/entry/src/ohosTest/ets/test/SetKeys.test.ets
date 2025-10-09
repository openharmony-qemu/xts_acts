import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import {
  testSetKeysJs0014,
  testSetKeysJs0037,
  testSetKeysJs0043,
  testSetKeysJs0044,
  testSetKeysJs0045,
  testSetKeysJs0046,
  testSetKeysJs0055,
  testSetKeysJs0061,
  testSetSizeJs010,
  testSetSizeJs019,
  testSetSizeJs025,
  testSetSizeJs034,
  testSetSizeJs036,
  testSetSizeJs038,
  testSetSizeJs039,
  testSetSizeJs073,
  testSetSizeJs077,
  testSetSizeJs082,
  testSetSizeJs088,
  testSetSizeJs092,
  testSetValuesJs014,
  testSetValuesJs044,
  testSetValuesJs046,
  testSetValuesJs052,
  testSetValuesJs059
} from './SetKeys';

export interface GeneratedObjectLiteralInterface_1 {
  id: number;
}

export interface GeneratedObjectLiteralInterface_3 {
  name: string;
}

interface GeneratedObjectLiteralInterface_4 {
  prop: string;
}

interface ValueOfInterface {
  valueOf: () => number;
}

interface toStringInterface {
  toString: () => 'same';
}

interface GeneratedObjectLiteralInterface_5 {
  a: number;
  b: number;
}

interface TestObject {
  id: number;
  data: string;
}

class TestClass {
  public name: string;
  public version: number;

  constructor(name: string, version: number) {
    this.name = name;
    this.version = version;
  }
}

enum TestEnum {
  Option1,
  Option2,
  Option3
}

interface TestEntity {
  id: number;
  name: string;
}

class TestModel {
  public code: string;
  public value: number;

  constructor(code: string, value: number) {
    this.code = code;
    this.value = value;
  }
}

enum TestStatus {
  New,
  Processing,
  Completed,
  Failed
}

class ImmutableData {
  public readonly key: string;
  public readonly value: number;

  constructor(key: string, value: number) {
    this.key = key;
    this.value = value;
  }
}

type SpecialTypes = null | undefined | bigint | RegExp;

class ImmutableItem {
  public key: string;
  public value: string;

  constructor(key: string, value: string) {
    this.key = key;
    this.value = value;
  }
}

interface GeneratedTypeLiteralInterface_2 {
  type: 'add' | 'delete';
  value: number;
}

interface EmptyObject {}

interface DataObject {
  id: number;
  content: string;
}

class CustomItem {
  public code: string;
  public value: number;

  constructor(code: string, value: number) {
    this.code = code;
    this.value = value;
  }
}

enum Status {
  PENDING,
  PROCESSING,
  COMPLETED
}

export default function SetKeysTest() {
  describe('SetKeysTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    });
    beforeEach(() => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    });
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    });
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_001
     * @tc.name testSetKeys0001
     * @tc.desc Test basic functionality of Set.keys() with string elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSetKeys0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const set = new Set(['a', 'b', 'c']);
      const keys = set.keys();
      expect(keys.next().value).assertEqual('a');
      expect(keys.next().value).assertEqual('b');
      expect(keys.next().value).assertEqual('c');
      expect(keys.next().done).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_002
     * @tc.name testSetKeys0002
     * @tc.desc Test Set.keys() with number elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSetKeys0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const set = new Set([1, 2, 3, 4]);
      const keys = set.keys();
      expect(keys.next().value).assertEqual(1);
      expect(keys.next().value).assertEqual(2);
      expect(keys.next().value).assertEqual(3);
      expect(keys.next().value).assertEqual(4);
      expect(keys.next().done).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_003
     * @tc.name testSetKeys0003
     * @tc.desc Test Set.keys() on empty Set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSetKeys0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const set = new Set<number>();
      const keys = set.keys();
      expect(keys.next().done).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_004
     * @tc.name testSetKeys0004
     * @tc.desc Test that Set.keys() preserves insertion order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSetKeys0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const set = new Set<string>();
      set.add('first');
      set.add('second');
      set.add('third');

      const keys = set.keys();
      expect(keys.next().value).assertEqual('first');
      expect(keys.next().value).assertEqual('second');
      expect(keys.next().value).assertEqual('third');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_005
     * @tc.name testSetKeys0005
     * @tc.desc Test Set.keys() with duplicate elements (which get ignored)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSetKeys0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const set = new Set([1, 2, 2, 3, 3, 3]);
      const keys = set.keys();
      expect(keys.next().value).assertEqual(1);
      expect(keys.next().value).assertEqual(2);
      expect(keys.next().value).assertEqual(3);
      expect(keys.next().done).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_006
     * @tc.name testSetKeys0006
     * @tc.desc Test Set.keys() with mixed data types (number, string, boolean, null, undefined)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSetKeys0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const set = new Set([1, 'a', true, null, undefined]);
      const keys = set.keys();
      expect(keys.next().value).assertEqual(1);
      expect(keys.next().value).assertEqual('a');
      expect(keys.next().value).assertEqual(true);
      expect(keys.next().value).assertEqual(null);
      expect(keys.next().value).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_007
     * @tc.name testSetKeys0007
     * @tc.desc Test Set.keys() with object elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSetKeys0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const obj1: GeneratedObjectLiteralInterface_1 = { id: 1 };
      const obj2: GeneratedObjectLiteralInterface_1 = { id: 2 };
      const set = new Set([obj1, obj2]);

      const keys = set.keys();
      expect(keys.next().value).assertEqual(obj1);
      expect(keys.next().value).assertEqual(obj2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_008
     * @tc.name testSetKeys0008
     * @tc.desc Test Set.keys() with NaN elements (which are considered equal)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSetKeys0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const set = new Set([NaN, NaN, 10]);
      const keys = set.keys();
      expect(Number.isNaN(keys.next().value)).assertEqual(true);
      expect(keys.next().value).assertEqual(10);
      expect(keys.next().done).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_009
     * @tc.name testSetKeys0009
     * @tc.desc Test Set.keys() with 0 and -0 (treated as equal)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSetKeys0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const set = new Set([0, -0, 1]);
      const keys = set.keys();
      expect(keys.next().value).assertEqual(0);
      expect(keys.next().value).assertEqual(1);
      expect(keys.next().done).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_010
     * @tc.name testSetKeys0010
     * @tc.desc Test that each call to keys() returns a new iterator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSetKeys0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const set = new Set([1, 2, 3]);
      const keys1 = set.keys();
      expect(keys1.next().value).assertEqual(1);

      const keys2 = set.keys();
      expect(keys2.next().value).assertEqual(1);
      expect(keys1.next().value).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_011
     * @tc.name testSetKeys0011
     * @tc.desc Test Set.keys() after adding new elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSetKeys0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const set = new Set([1, 2]);
      set.add(3);
      const keys = set.keys();
      expect(keys.next().value).assertEqual(1);
      expect(keys.next().value).assertEqual(2);
      expect(keys.next().value).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_012
     * @tc.name testSetKeys0012
     * @tc.desc Test Set.keys() after deleting an element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSetKeys0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const set = new Set([1, 2, 3]);
      set.delete(2);
      const keys = set.keys();
      expect(keys.next().value).assertEqual(1);
      expect(keys.next().value).assertEqual(3);
      expect(keys.next().done).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_013
     * @tc.name testSetKeys0013
     * @tc.desc Test Set.keys() with BigInt elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSetKeys0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const set = new Set([1n, 2n, 3n]);
      const keys = set.keys();
      expect(keys.next().value).assertEqual(1n);
      expect(keys.next().value).assertEqual(2n);
      expect(keys.next().value).assertEqual(3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_014
     * @tc.name testSetKeys0014
     * @tc.desc Test Set.keys() with Symbol elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSetKeys0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      expect(testSetKeysJs0014()).assertDeepEquals([true, true]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_015
     * @tc.name testSetKeys0015
     * @tc.desc Test iterator state after complete iteration
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSetKeys0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const set = new Set([1, 2]);
      const keys = set.keys();
      keys.next();
      keys.next();
      expect(keys.next().done).assertEqual(true);
      expect(keys.next().value).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_016
     * @tc.name testSetKeys0016
     * @tc.desc Test Set.keys() with Date objects
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSetKeys0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const date1 = new Date('2023-01-01');
      const date2 = new Date('2023-01-02');
      const set = new Set([date1, date2]);
      const keys = set.keys();
      expect(keys.next().value).assertEqual(date1);
      expect(keys.next().value).assertEqual(date2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_017
     * @tc.name testSetKeys0017
     * @tc.desc Test Set.keys() with RegExp objects
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSetKeys0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex1 = /a/;
      const regex2 = /b/;
      const set = new Set([regex1, regex2]);
      const keys = set.keys();
      expect(keys.next().value).assertEqual(regex1);
      expect(keys.next().value).assertEqual(regex2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_018
     * @tc.name testSetKeys0018
     * @tc.desc Test converting Set.keys() iterator to array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSetKeys0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const set = new Set(['x', 'y', 'z']);
      const keysArray = Array.from(set.keys());
      expect(keysArray.length).assertEqual(3);
      expect(keysArray[0]).assertEqual('x');
      expect(keysArray[1]).assertEqual('y');
      expect(keysArray[2]).assertEqual('z');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_019
     * @tc.name testSetKeys0019
     * @tc.desc Test iterating over Set.keys() with for...of loop
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSetKeys0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const set = new Set([10, 20, 30]);
      const result: number[] = [];
      for (const key of set.keys()) {
        result.push(key);
      }
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(10);
      expect(result[1]).assertEqual(20);
      expect(result[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_020
     * @tc.name testSetKeys0020
     * @tc.desc Test Set.keys() with SameValueZero comparison (0, -0, false)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSetKeys0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const set = new Set([0, -0, false]);
      const keys = set.keys();
      expect(keys.next().value).assertEqual(0);
      expect(keys.next().value).assertEqual(false);
      expect(keys.next().done).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_021
     * @tc.name testSetKeys0021
     * @tc.desc Test Set.keys() with large number of elements (1000 elements)
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSetKeys0021', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL1, (): void => {
      const set = new Set<number>();
      const size = 1000;
      for (let i = 0; i < size; i++) {
        set.add(i);
      }

      const keys = set.keys();
      for (let i = 0; i < size; i++) {
        expect(keys.next().value).assertEqual(i);
      }
      expect(keys.next().done).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_022
     * @tc.name testSetKeys0022
     * @tc.desc Test Set.keys() after calling clear()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSetKeys0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const set = new Set([1, 2, 3]);
      set.clear();
      const keys = set.keys();
      expect(keys.next().done).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_023
     * @tc.name testSetKeys0023
     * @tc.desc Test that keys() and values() return same iterator for Set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSetKeys0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const set = new Set(['a', 'b']);
      const keys = set.keys();
      const values = set.values();
      expect(keys.next().value).assertEqual(values.next().value);
      expect(keys.next().value).assertEqual(values.next().value);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_024
     * @tc.name testSetKeys0024
     * @tc.desc Test that keys() returns an iterator object with next() method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSetKeys0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const set = new Set([1, 2]);
      const keys = set.keys();
      expect(typeof keys.next).assertEqual('function');
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_026
     * @tc.name testSetKeys0026
     * @tc.desc Test Set.keys() with function elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSetKeys0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const func1 = () => 'hello';
      const func2 = () => 'world';
      const set = new Set([func1, func2]);
      const keys = set.keys();
      expect(keys.next().value).assertEqual(func1);
      expect(keys.next().value).assertEqual(func2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_027
     * @tc.name testSetKeys0027
     * @tc.desc Test partial iteration with Set.keys()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSetKeys0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const set = new Set([1, 2, 3, 4, 5]);
      const keys = set.keys();
      expect(keys.next().value).assertEqual(1);
      expect(keys.next().value).assertEqual(2);
      // Stop iteration early
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_028
     * @tc.name testSetKeys0028
     * @tc.desc Test Set.keys() with null and undefined elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSetKeys0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const set = new Set([null, undefined, null, undefined]);
      const keys = set.keys();
      expect(keys.next().value).assertEqual(null);
      expect(keys.next().value).assertEqual(undefined);
      expect(keys.next().done).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_029
     * @tc.name testSetKeys0029
     * @tc.desc Test chained iteration with Set.keys()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSetKeys0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const set = new Set(['p', 'q', 'r']);
      const keys = set.keys();

      const first = keys.next();
      expect(first.value).assertEqual('p');
      expect(first.done).assertEqual(false);

      const second = keys.next();
      expect(second.value).assertEqual('q');
      expect(second.done).assertEqual(false);

      const third = keys.next();
      expect(third.value).assertEqual('r');
      expect(third.done).assertEqual(false);

      const done = keys.next();
      expect(done.value).assertEqual(undefined);
      expect(done.done).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_030
     * @tc.name testSetKeys0030
     * @tc.desc Test Set.keys() with mixed objects and primitives
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSetKeys0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const obj: GeneratedObjectLiteralInterface_3 = { name: 'test' };
      const set = new Set([obj, 42, 'string']);
      const keys = set.keys();

      expect(keys.next().value).assertEqual(obj);
      expect(keys.next().value).assertEqual(42);
      expect(keys.next().value).assertEqual('string');
      expect(keys.next().done).assertEqual(true);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_031
     * @tc.name testSetKeys0031
     * @tc.desc Test Set.keys() with elements added in reverse order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSetKeys0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const set = new Set<number>();
      [5, 4, 3, 2, 1].forEach(num => set.add(num));
      const keys = set.keys();
      expect(keys.next().value).assertEqual(5);
      expect(keys.next().value).assertEqual(4);
      expect(keys.next().value).assertEqual(3);
      expect(keys.next().value).assertEqual(2);
      expect(keys.next().value).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_032
     * @tc.name testSetKeys0032
     * @tc.desc Test Set.keys() with elements added and removed multiple times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSetKeys0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const set = new Set<number>();
      set.add(1);
      set.add(2);
      set.delete(1);
      set.add(3);
      set.add(1);
      set.delete(2);

      const keys = set.keys();
      expect(keys.next().value).assertEqual(3);
      expect(keys.next().value).assertEqual(1);
      expect(keys.next().done).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_033
     * @tc.name testSetKeys0033
     * @tc.desc Test Set.keys() with Symbol.iterator call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSetKeys0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const set = new Set(['a', 'b']);
      const keys: Iterator<string> = set.keys();

      expect(keys.next().value).assertEqual('a');
      expect(keys.next().value).assertEqual('b');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_034
     * @tc.name testSetKeys0034
     * @tc.desc Test Set.keys() with very large integers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSetKeys0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const largeNum1 = 9007199254740991n; // Maximum safe integer as BigInt
      const largeNum2 = 9007199254740992n;
      const set = new Set([largeNum1, largeNum2]);

      const keys = set.keys();
      expect(keys.next().value).assertEqual(largeNum1);
      expect(keys.next().value).assertEqual(largeNum2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_035
     * @tc.name testSetKeys0035
     * @tc.desc Test Set.keys() with empty strings and whitespace
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSetKeys0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const set = new Set(['', ' ', '  ']);
      const keys = set.keys();
      expect(keys.next().value).assertEqual('');
      expect(keys.next().value).assertEqual(' ');
      expect(keys.next().value).assertEqual('  ');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_036
     * @tc.name testSetKeys0036
     * @tc.desc Test Set.keys() with objects modified after insertion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSetKeys0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const obj: GeneratedObjectLiteralInterface_4 = { prop: 'initial' };
      const set = new Set([obj]);
      obj.prop = 'modified'; // Modify the object after insertion

      const keys: Iterator<GeneratedObjectLiteralInterface_4> = set.keys();
      const firstValue: GeneratedObjectLiteralInterface_4 | undefined = keys.next().value;
      expect(firstValue).assertEqual(obj);
      expect(firstValue?.prop).assertEqual('modified');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_037
     * @tc.name testSetKeys0037
     * @tc.desc Test Set.keys() with iterating over frozen objects
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSetKeys0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      expect(testSetKeysJs0037()).assertDeepEquals([true, true]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_038
     * @tc.name testSetKeys0038
     * @tc.desc Test Set.keys() with iterating during concurrent modification
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSetKeys0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const set = new Set([1, 2, 3]);
      const keys = set.keys();

      expect(keys.next().value).assertEqual(1);
      set.add(4); // Modify set during iteration
      expect(keys.next().value).assertEqual(2);
      expect(keys.next().value).assertEqual(3);
      expect(keys.next().value).assertEqual(4); // New element should be included
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_039
     * @tc.name testSetKeys0039
     * @tc.desc Test Set.keys() with iterating over weak references
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSetKeys0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let obj1: GeneratedObjectLiteralInterface_3 | null = { name: 'obj1' };
      let obj2: GeneratedObjectLiteralInterface_3 | null = { name: 'obj2' };
      const set = new Set([obj1, obj2]);
      // Create weak references
      const weakRef1 = new WeakRef(obj1);
      const weakRef2 = new WeakRef(obj2);
      obj1 = null;
      obj2 = null;

      // Force garbage collection (if possible in test environment)
      if (typeof globalThis.gc === 'function') {
        globalThis.gc();
      }

      const keys = set.keys();
      // Since we're using Set (strong references), objects should still exist
      expect(keys.next().value).assertEqual(weakRef1.deref());
      expect(keys.next().value).assertEqual(weakRef2.deref());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_040
     * @tc.name testSetKeys0040
     * @tc.desc Test Set.keys() with Unicode characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSetKeys0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const set = new Set(['ä', 'ö', 'ü', 'ñ', 'ç']);
      const keys = set.keys();
      expect(keys.next().value).assertEqual('ä');
      expect(keys.next().value).assertEqual('ö');
      expect(keys.next().value).assertEqual('ü');
      expect(keys.next().value).assertEqual('ñ');
      expect(keys.next().value).assertEqual('ç');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_041
     * @tc.name testSetKeys0041
     * @tc.desc Test Set.keys() with surrogate pair characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSetKeys0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const emoji1 = '😊'; // U+1F60A
      const emoji2 = '🎉'; // U+1F389
      const set = new Set([emoji1, emoji2]);

      const keys = set.keys();
      expect(keys.next().value).assertEqual(emoji1);
      expect(keys.next().value).assertEqual(emoji2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_042
     * @tc.name testSetKeys0042
     * @tc.desc Test Set.keys() with very long strings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSetKeys0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const longStr1 = 'a'.repeat(1000);
      const longStr2 = 'b'.repeat(1000);
      const set = new Set([longStr1, longStr2]);

      const keys = set.keys();
      expect(keys.next().value).assertEqual(longStr1);
      expect(keys.next().value).assertEqual(longStr2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_043
     * @tc.name testSetKeys0043
     * @tc.desc Test Set.keys() with inherited properties
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSetKeys0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      expect(testSetKeysJs0043()).assertDeepEquals([true, true, true])
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_044
     * @tc.name testSetKeys0044
     * @tc.desc Test Set.keys() with non-enumerable properties in objects
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSetKeys0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      expect(testSetKeysJs0044()).assertDeepEquals([true, 'secret']);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_045
     * @tc.name testSetKeys0045
     * @tc.desc Test Set.keys() with symbol properties in objects
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSetKeys0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      expect(testSetKeysJs0045()).assertDeepEquals([true, 'private']);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_046
     * @tc.name testSetKeys0046
     * @tc.desc Test Set.keys() with circular references
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSetKeys0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      expect(testSetKeysJs0046()).assertDeepEquals([true, true]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_047
     * @tc.name testSetKeys0047
     * @tc.desc Test Set.keys() with Date objects of same time
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSetKeys0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const date1 = new Date('2023-01-01');
      const date2 = new Date('2023-01-01'); // Same time, different object

      const set = new Set([date1, date2]);
      const keys = set.keys();

      expect(keys.next().value).assertEqual(date1);
      expect(keys.next().value).assertEqual(date2);
      // They are different objects, so both should appear
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_048
     * @tc.name testSetKeys0048
     * @tc.desc Test Set.keys() with large dataset after many modifications
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSetKeys0048', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL1, (): void => {
      const set = new Set<number>();
      const initialSize = 1000;

      // Add initial elements
      for (let i = 0; i < initialSize; i++) {
        set.add(i);
      }

      // Modify the set - remove half, add new ones
      for (let i = 0; i < initialSize / 2; i++) {
        set.delete(i);
        set.add(initialSize + i);
      }

      // Collect all keys and verify count
      const keysArray = Array.from(set.keys());
      expect(keysArray.length).assertEqual(initialSize);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_049
     * @tc.name testSetKeys0049
     * @tc.desc Test Set.keys() with typed arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSetKeys0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr1 = new Uint8Array([1, 2, 3]);
      const arr2 = new Uint16Array([4, 5, 6]);
      const set = new Set([arr1, arr2]);

      const keys = set.keys();
      expect(keys.next().value).assertEqual(arr1);
      expect(keys.next().value).assertEqual(arr2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_050
     * @tc.name testSetKeys0050
     * @tc.desc Test Set.keys() with Map objects
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSetKeys0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map1 = new Map([['a', 1]]);
      const map2 = new Map([['b', 2]]);
      const set = new Set([map1, map2]);

      const keys = set.keys();
      expect(keys.next().value).assertEqual(map1);
      expect(keys.next().value).assertEqual(map2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_051
     * @tc.name testSetKeys0051
     * @tc.desc Test Set.keys() with Set objects
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSetKeys0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const innerSet1 = new Set([1, 2]);
      const innerSet2 = new Set([3, 4]);
      const outerSet = new Set([innerSet1, innerSet2]);

      const keys = outerSet.keys();
      expect(keys.next().value).assertEqual(innerSet1);
      expect(keys.next().value).assertEqual(innerSet2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_052
     * @tc.name testSetKeys0052
     * @tc.desc Test Set.keys() with WeakMap objects
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSetKeys0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const wm1: WeakMap<object, string> = new WeakMap();
      const wm2: WeakMap<object, string> = new WeakMap();
      const set = new Set([wm1, wm2]);

      const keys = set.keys();
      expect(keys.next().value).assertEqual(wm1);
      expect(keys.next().value).assertEqual(wm2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_053
     * @tc.name testSetKeys0053
     * @tc.desc Test Set.keys() with WeakSet objects
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSetKeys0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const ws1 = new WeakSet();
      const ws2 = new WeakSet();
      const set = new Set([ws1, ws2]);

      const keys = set.keys();
      expect(keys.next().value).assertEqual(ws1);
      expect(keys.next().value).assertEqual(ws2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_054
     * @tc.name testSetKeys0054
     * @tc.desc Test Set.keys() with promises
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSetKeys0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const promise1 = Promise.resolve(1);
      const promise2 = Promise.reject(new Error('test'));
      const set = new Set([promise1, promise2]);

      const keys = set.keys();
      expect(keys.next().value).assertEqual(promise1);
      expect(keys.next().value).assertEqual(promise2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_055
     * @tc.name testSetKeys0055
     * @tc.desc Test Set.keys() with generators
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSetKeys0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      expect(testSetKeysJs0055()).assertDeepEquals([false, false]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_056
     * @tc.name testSetKeys0056
     * @tc.desc Test Set.keys() with iterators from other collections
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSetKeys0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr = [1, 2, 3];
      const map = new Map([['a', 1]]);

      const set = new Set([arr.values(), map.keys()]);
      const keys = set.keys();

      expect(keys.next().value).assertDeepEquals(arr.values());
      expect(keys.next().value).assertDeepEquals(map.keys());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_057
     * @tc.name testSetKeys0057
     * @tc.desc Test Set.keys() with Error objects
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSetKeys0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const error1 = new Error('Error 1');
      const error2 = new TypeError('Type Error');
      const set = new Set([error1, error2]);

      const keys = set.keys();
      expect(keys.next().value).assertEqual(error1);
      expect(keys.next().value).assertEqual(error2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_059
     * @tc.name testSetKeys0059
     * @tc.desc Test Set.keys() with objects implementing valueOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSetKeys0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const obj1: ValueOfInterface = {
        valueOf: () => 100
      };
      const obj2: ValueOfInterface = {
        valueOf: () => 100
      }; // Same valueOf result, different object
      const set = new Set([obj1, obj2]);

      const keys = set.keys();
      expect(keys.next().value).assertEqual(obj1);
      expect(keys.next().value).assertEqual(obj2);
      // valueOf doesn't affect Set equality checks
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_060
     * @tc.name testSetKeys0060
     * @tc.desc Test Set.keys() with objects implementing toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSetKeys0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const obj1: toStringInterface = { toString: () => 'same' };
      const obj2: toStringInterface = { toString: () => 'same' }; // Same toString result, different object
      const set = new Set([obj1, obj2]);

      const keys = set.keys();
      expect(keys.next().value).assertEqual(obj1);
      expect(keys.next().value).assertEqual(obj2);
      // toString doesn't affect Set equality checks
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_061
     * @tc.name testSetKeys0061
     * @tc.desc Test Set.keys() with null prototype objects
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSetKeys0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      expect(testSetKeysJs0061()).assertDeepEquals([true, true]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_062
     * @tc.name testSetKeys0062
     * @tc.desc Test Set.keys() with boxed primitives
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSetKeys0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const numObj = new Number(123);
      const strObj = new String('test');
      const boolObj = new Boolean(true);

      const set = new Set([numObj, strObj, boolObj]);
      const keys = set.keys();

      expect(keys.next().value).assertEqual(numObj);
      expect(keys.next().value).assertEqual(strObj);
      expect(keys.next().value).assertEqual(boolObj);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_063
     * @tc.name testSetKeys0063
     * @tc.desc Test Set.keys() with boxed vs unboxed primitives
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSetKeys0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const numObj = new Number(123);
      const numPrimitive = 123;

      const set = new Set([numObj, numPrimitive]);
      const keys = set.keys();

      expect(keys.next().value).assertEqual(numObj);
      expect(keys.next().value).assertEqual(numPrimitive);
      // Boxed and unboxed are considered different
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_064
     * @tc.name testSetKeys0064
     * @tc.desc Test Set.keys() with multiple NaN values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSetKeys0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const set = new Set([NaN, NaN, NaN, 1, NaN]);
      const keys = set.keys();
      let a: Number = keys.next().value;
      expect(keys.next().value).assertEqual(1);
      expect(keys.next().done).assertEqual(true);
      // All NaNs are considered equal
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_065
     * @tc.name testSetKeys0065
     * @tc.desc Test Set.keys() with Infinity and -Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSetKeys0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const set = new Set([Infinity, -Infinity, Infinity]);
      const keys = set.keys();

      expect(keys.next().value).assertEqual(Infinity);
      expect(keys.next().value).assertEqual(-Infinity);
      expect(keys.next().done).assertEqual(true);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_067
     * @tc.name testSetKeys0067
     * @tc.desc Test Set.keys() with objects having same JSON representation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSetKeys0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const obj1: GeneratedObjectLiteralInterface_5 = { a: 1, b: 2 };
      const obj2: GeneratedObjectLiteralInterface_5 = { a: 1, b: 2 }; // Same JSON, different reference
      const set = new Set([obj1, obj2]);

      const keys = set.keys();
      expect(keys.next().value).assertEqual(obj1);
      expect(keys.next().value).assertEqual(obj2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_068
     * @tc.name testSetKeys0068
     * @tc.desc Test Set.keys() with iterating over a set of sets
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSetKeys0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      type NumberSet = Set<number>;

      const innerSetA: NumberSet = new Set([1, 2]);
      const innerSetB: NumberSet = new Set([3, 4]);

      const outerSet: Set<NumberSet> = new Set([innerSetA, innerSetB]);

      const keys: Iterator<NumberSet> = outerSet.keys();
      const firstKey: NumberSet | undefined = keys.next().value;
      const secondKey: NumberSet | undefined = keys.next().value;

      expect(firstKey).assertEqual(innerSetA);
      expect(secondKey).assertEqual(innerSetB);
      // expect(Array.from(firstKey)).assertEqual([1, 2]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_069
     * @tc.name testSetKeys0069
     * @tc.desc Test Set.keys() with date objects after modification
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSetKeys0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const date = new Date('2023-01-01');
      const set = new Set([date]);

      date.setFullYear(2024); // Modify the date after insertion
      const keys = set.keys();
      const firstValue: Date = keys.next().value;

      expect(firstValue).assertEqual(date);
      expect(firstValue.getFullYear()).assertEqual(2024);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_070
     * @tc.name testSetKeys0070
     * @tc.desc Test Set.keys() with multiple references to the same object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSetKeys0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const sharedObj: GeneratedObjectLiteralInterface_3 = { name: 'shared' };
      const set = new Set([sharedObj, sharedObj, sharedObj]);

      const keys = set.keys();
      expect(keys.next().value).assertEqual(sharedObj);
      expect(keys.next().done).assertEqual(true);
      // Duplicate references are stored only once
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_071
     * @tc.name testSetKeys0071
     * @tc.desc Test Set.keys() with objects having read-only properties
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSetKeys0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      interface ReadonlyObj {
        readonly id: number;
        name: string;
      }

      const obj1: ReadonlyObj = { id: 1, name: 'test1' };
      const obj2: ReadonlyObj = { id: 2, name: 'test2' };
      const set: Set<ReadonlyObj> = new Set([obj1, obj2]);

      const keys: Iterator<ReadonlyObj> = set.keys();
      const firstVal: ReadonlyObj = keys.next().value;
      const secondVal: ReadonlyObj = keys.next().value;

      expect(firstVal).assertEqual(obj1);
      expect(secondVal).assertEqual(obj2);
      expect(firstVal?.id).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_072
     * @tc.name testSetKeys0072
     * @tc.desc Test Set.keys() with union type elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSetKeys0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      type UnionType = string | number | boolean;
      const set: Set<UnionType> = new Set(['a', 123, true]);

      const keys: Iterator<UnionType> = set.keys();
      expect(keys.next().value).assertEqual('a');
      expect(keys.next().value).assertEqual(123);
      expect(keys.next().value).assertEqual(true);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_074
     * @tc.name testSetKeys0074
     * @tc.desc Test Set.keys() with optional properties objects
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSetKeys0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      interface OptionalPropObj {
        name: string;
        age?: number;
      }

      const obj1: OptionalPropObj = { name: 'Alice' };
      const obj2: OptionalPropObj = { name: 'Bob', age: 20 };
      const set: Set<OptionalPropObj> = new Set([obj1, obj2]);

      const keys: Iterator<OptionalPropObj> = set.keys();
      const firstObj: OptionalPropObj = keys.next().value;
      const secondObj: OptionalPropObj = keys.next().value;

      expect(firstObj).assertEqual(obj1);
      expect(secondObj).assertEqual(obj2);
      expect(firstObj?.age).assertEqual(undefined);
      expect(secondObj?.age).assertEqual(20);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_077
     * @tc.name testSetKeys0077
     * @tc.desc Test Set.keys() with intersection type elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSetKeys0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      interface Base {
        id: number;
      }

      interface Name extends Base { // 继承Base接口
        name: string;
      }

      const obj1: Name = { id: 1, name: 'X' };
      const obj2: Name = { id: 2, name: 'Y' };
      const set: Set<Name> = new Set([obj1, obj2]);

      const keys: Iterator<Name> = set.keys();
      const firstObj: Name | undefined = keys.next().value;
      expect(firstObj?.id).assertEqual(1);
      expect(firstObj?.name).assertEqual('X');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_078
     * @tc.name testSetKeys0078
     * @tc.desc Test Set.keys() with enum type elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSetKeys0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      enum Color { Red, Green, Blue }

      const set: Set<Color> = new Set([Color.Red, Color.Green]);

      const keys: Iterator<Color> = set.keys();
      expect(keys.next().value).assertEqual(Color.Red);
      expect(keys.next().value).assertEqual(Color.Green);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_079
     * @tc.name testSetKeys0079
     * @tc.desc Test Set.keys() with class instances
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSetKeys0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      class Person {
        public name: string;
        public age: number;

        constructor(name: string, age: number) {
          this.name = name;
          this.age = age;
        }
      }

      const person1: Person = new Person('Alice', 25);
      const person2: Person = new Person('Bob', 30);
      const set: Set<Person> = new Set([person1, person2]);

      const keys: Iterator<Person> = set.keys();
      const firstPerson: Person | undefined = keys.next().value;
      expect(firstPerson?.name).assertEqual('Alice');
      expect(keys.next().value?.name).assertEqual('Bob');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_080
     * @tc.name testSetKeys0080
     * @tc.desc Test Set.keys() with abstract class implementations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSetKeys0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      abstract class Shape {
        abstract getArea(): number;
      }

      class Circle extends Shape {
        private radius: number;

        constructor(radius: number) {
          super();
          this.radius = radius;
        }

        getArea(): number {
          return Math.PI * this.radius**2;
        }
      }

      class Square extends Shape {
        private side: number;

        constructor(side: number) {
          super();
          this.side = side;
        }

        getArea(): number {
          return this.side**2;
        }
      }

      const circle: Shape = new Circle(5);
      const square: Shape = new Square(4);
      const set: Set<Shape> = new Set([circle, square]);

      const keys: Iterator<Shape> = set.keys();
      const firstShape: Shape | undefined = keys.next().value;
      expect(firstShape?.getArea()).assertEqual(Math.PI * 25);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_081
     * @tc.name testSetKeys0081
     * @tc.desc Test Set.keys() with generic class instances
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSetKeys0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      class Box<T> {
        public content: T;

        constructor(content: T) {
          this.content = content;
        }
      }

      const box1: Box<string> = new Box('apple');
      const box2: Box<number> = new Box(100);
      const set: Set<Box<string> | Box<number>> = new Set([box1, box2]);

      const keys: Iterator<Box<string> | Box<number>> = set.keys();
      const firstBox: Box<string> | Box<number> | undefined = keys.next().value;
      const secondBox: Box<string> | Box<number> | undefined = keys.next().value;

      expect(firstBox?.content).assertEqual('apple');
      expect(secondBox?.content).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_083
     * @tc.name testSetKeys0083
     * @tc.desc Test Set.keys() with nullable type elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSetKeys0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      type NullableString = string | null;
      const set: Set<NullableString> = new Set(['a', null, 'b']);

      const keys: Iterator<NullableString> = set.keys();
      expect(keys.next().value).assertEqual('a');
      expect(keys.next().value).assertEqual(null);
      expect(keys.next().value).assertEqual('b');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_084
     * @tc.name testSetKeys0084
     * @tc.desc Test Set.keys() with non-null assertion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSetKeys0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      type MaybeNumber = number | undefined;
      const num1: MaybeNumber = 10;
      const num2: MaybeNumber = 20;
      const set: Set<MaybeNumber> = new Set([num1, num2]);

      const keys: Iterator<MaybeNumber> = set.keys();
      const firstNum: MaybeNumber = keys.next().value!;
      const secondNum: MaybeNumber = keys.next().value!;

      expect(firstNum).assertEqual(10);
      expect(secondNum).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_085
     * @tc.name testSetKeys0085
     * @tc.desc Test Set.keys() with type assertion elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSetKeys0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      interface Animal { type: string; }

      interface Dog extends Animal { bark: () => void; }

      const animal1: Animal = { type: 'dog' };
      const animal2: Animal = { type: 'cat' };
      const dog1 = animal1 as Dog;
      dog1.bark = () => console.log('woof');

      const set: Set<Dog> = new Set([dog1]);
      const keys: Iterator<Dog> = set.keys();
      const firstDog: Dog = keys.next().value!;
      expect(firstDog.type).assertEqual('dog');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_086
     * @tc.name testSetKeys0086
     * @tc.desc Test Set.keys() with never type in union
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSetKeys0086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      type NeverUnion = string | never;
      const set: Set<NeverUnion> = new Set(['a', 'b']);

      const keys: Iterator<NeverUnion> = set.keys();
      expect(keys.next().value).assertEqual('a');
      expect(keys.next().value).assertEqual('b');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_087
     * @tc.name testSetKeys0087
     * @tc.desc Test Set.keys() with void type elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSetKeys0087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      type VoidType = void;
      const set: Set<VoidType> = new Set([undefined, undefined]);

      const keys: Iterator<VoidType> = set.keys();
      expect(keys.next().value).assertEqual(undefined);
      expect(keys.next().done).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_088
     * @tc.name testSetKeys0088
     * @tc.desc Test Set.keys() with bigint literals
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSetKeys0088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const set: Set<bigint> = new Set([100n, 200n, 300n]);

      const keys: Iterator<bigint> = set.keys();
      expect(keys.next().value).assertEqual(100n);
      expect(keys.next().value).assertEqual(200n);
      expect(keys.next().value).assertEqual(300n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_089
     * @tc.name testSetKeys0089
     * @tc.desc Test Set.keys() with template literal types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSetKeys0089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      type Greeting = `Hello, ${string}`;
      const greeting1: Greeting = 'Hello, World' as Greeting;
      const greeting2: Greeting = 'Hello, TypeScript' as Greeting;
      const set: Set<Greeting> = new Set([greeting1, greeting2]);

      const keys: Iterator<Greeting> = set.keys();
      expect(keys.next().value).assertEqual('Hello, World');
      expect(keys.next().value).assertEqual('Hello, TypeScript');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_092
     * @tc.name testSetKeys0092
     * @tc.desc Test Set.keys() with recursive type elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSetKeys0092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      interface RecursiveType {
        value: number;
        nested?: RecursiveType;
      };
      const item1: RecursiveType = { value: 1 };
      const item2: RecursiveType = { value: 2, nested: { value: 3 } };
      const set: Set<RecursiveType> = new Set([item1, item2]);

      const keys: Iterator<RecursiveType> = set.keys();
      const firstItem: RecursiveType = keys.next().value;
      const secondItem: RecursiveType = keys.next().value;

      expect(firstItem?.value).assertEqual(1);
      expect(secondItem?.nested?.value).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_093
     * @tc.name testSetKeys0093
     * @tc.desc Test Set.keys() with function types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSetKeys0093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      type StringProcessor = (input: string) => string;
      const func1: StringProcessor = (s) => s.toUpperCase();
      const func2: StringProcessor = (s) => s.toLowerCase();
      const set: Set<StringProcessor> = new Set([func1, func2]);

      const keys: Iterator<StringProcessor> = set.keys();
      const firstFunc: StringProcessor = keys.next().value!;
      const secondFunc: StringProcessor = keys.next().value!;

      expect(firstFunc('test')).assertEqual('TEST');
      expect(secondFunc('TEST')).assertEqual('test');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_094
     * @tc.name testSetKeys0094
     * @tc.desc Test Set.keys() with parameter properties
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSetKeys0094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      class Car {
        public brand: string;
        private year: number;

        constructor(
          brand: string,
          year: number
        ) {
          this.brand = brand;
          this.year = year;
        }

        getYear(): number {
          return this.year;
        }
      }

      const car1: Car = new Car('Toyota', 2020);
      const car2: Car = new Car('Honda', 2022);
      const set: Set<Car> = new Set([car1, car2]);

      const keys: Iterator<Car> = set.keys();
      const firstCar: Car = keys.next().value;
      expect(firstCar?.brand).assertEqual('Toyota');
      expect(firstCar?.getYear()).assertEqual(2020);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_095
     * @tc.name testSetKeys0095
     * @tc.desc Test Set.keys() with static class properties
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSetKeys0095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      class Configuration {
        static version: string = '1.0.0';
        public name: string;

        constructor(name: string) {
          this.name = name;
        }
      }

      const config1: Configuration = new Configuration('dev');
      const config2: Configuration = new Configuration('prod');
      const set: Set<Configuration> = new Set([config1, config2]);

      const keys: Iterator<Configuration> = set.keys();
      const firstConfig: Configuration | undefined = keys.next().value;
      expect(firstConfig?.name).assertEqual('dev');
      expect(Configuration.version).assertEqual('1.0.0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_096
     * @tc.name testSetKeys0096
     * @tc.desc Test Set.keys() with private class methods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSetKeys0096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      class Counter {
        private count: number = 0;

        increment(): void {
          this.count++;
        }

        getCount(): number {
          return this.count;
        }
      }

      const counter1: Counter = new Counter();
      const counter2: Counter = new Counter();
      counter1.increment();
      const set: Set<Counter> = new Set([counter1, counter2]);

      const keys: Iterator<Counter> = set.keys();
      const firstCounter: Counter | undefined = keys.next().value;
      expect(firstCounter?.getCount()).assertEqual(1);
      expect(keys.next().value?.getCount()).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_097
     * @tc.name testSetKeys0097
     * @tc.desc Test Set.keys() with protected class members
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSetKeys0097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      class Parent {
        protected value: number;

        constructor(val: number) {
          this.value = val;
        }
      }

      class Child extends Parent {
        getValue(): number {
          return this.value;
        }
      }

      const child1: Child = new Child(10);
      const child2: Child = new Child(20);
      const set: Set<Child> = new Set([child1, child2]);

      const keys: Iterator<Child> = set.keys();
      const firstChild: Child | undefined = keys.next().value;
      expect(firstChild?.getValue()).assertEqual(10);
      expect(keys.next().value?.getValue()).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_098
     * @tc.name testSetKeys0098
     * @tc.desc Test Set.keys() with static methods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSetKeys0098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      class MathOperations {
        static multiply(a: number, b: number): number {
          return a * b;
        }
      }

      const obj1: MathOperations = new MathOperations();
      const obj2: MathOperations = new MathOperations();
      const set: Set<MathOperations> = new Set([obj1, obj2]);

      const keys: Iterator<MathOperations> = set.keys();
      expect(keys.next().value).assertEqual(obj1);
      expect(keys.next().value).assertEqual(obj2);
      expect(MathOperations.multiply(3, 4)).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_099
     * @tc.name testSetKeys0099
     * @tc.desc Test Set.keys() with abstract methods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSetKeys0099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      abstract class Device {
        abstract powerOn(): void;
      }

      class Phone extends Device {
        powerOn(): void {
          console.log('Phone powered on');
        }
      }

      class Laptop extends Device {
        powerOn(): void {
          console.log('Laptop powered on');
        }
      }

      const phone: Device = new Phone();
      const laptop: Device = new Laptop();
      const set: Set<Device> = new Set([phone, laptop]);

      const keys: Iterator<Device> = set.keys();
      expect(keys.next().value).assertEqual(phone);
      expect(keys.next().value).assertEqual(laptop);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_100
     * @tc.name testSetKeys0100
     * @tc.desc Test Set.keys() with generic functions as elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSetKeys0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      type GenericFunc<T> = (input: T) => T;
      const func1: GenericFunc<number> = (x) => x * 2;
      const func2: GenericFunc<string> = (s) => s.repeat(2);
      const set: Set<GenericFunc<number> | GenericFunc<string>> = new Set([func1, func2]);

      const keys: Iterator<GenericFunc<number> | GenericFunc<string>> = set.keys();
      const firstFunc: GenericFunc<number> = keys.next().value!;
      const secondFunc: GenericFunc<string> = keys.next().value!;

      expect(firstFunc(5)).assertEqual(10);
      expect(secondFunc('ab')).assertEqual('abab');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_SET_VALUES_001
     * @tc.name testSetValues001
     * @tc.desc Test Set.values() iteration with basic string elements
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSetValues001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const set: Set<string> = new Set(['alpha', 'beta', 'gamma']);
      const values: Iterator<string> = set.values();

      expect(values.next().value).assertEqual('alpha');
      expect(values.next().value).assertEqual('beta');
      expect(values.next().value).assertEqual('gamma');
      expect(values.next().done).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_SET_VALUES_002
     * @tc.name testSetValues002
     * @tc.desc Test Set.values() iteration with basic number elements
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSetValues002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const set: Set<number> = new Set([5, 10, 15, 20]);
      const values: Iterator<number> = set.values();

      expect(values.next().value).assertEqual(5);
      expect(values.next().value).assertEqual(10);
      expect(values.next().value).assertEqual(15);
      expect(values.next().value).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_SET_VALUES_003
     * @tc.name testSetValues003
     * @tc.desc Test Set.values() with empty Set
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSetValues003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const set: Set<boolean> = new Set();
      const values: Iterator<boolean> = set.values();

      expect(values.next().done).assertEqual(true);
      expect(values.next().value).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_SET_VALUES_004
     * @tc.name testSetValues004
     * @tc.desc Test that Set.values() maintains insertion order
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSetValues004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const set: Set<string> = new Set(['first', 'second', 'third']);
      const values: Iterator<string> = set.values();
      const result: string[] = [];

      let current = values.next();
      while (!current.done) {
        result.push(current.value);
        current = values.next();
      }

      expect(result[0]).assertEqual('first');
      expect(result[1]).assertEqual('second');
      expect(result[2]).assertEqual('third');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_SET_VALUES_005
     * @tc.name testSetValues005
     * @tc.desc Test that Set.values() filters duplicate elements
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSetValues005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const set: Set<number> = new Set([3, 3, 6, 6, 9]);
      const values: Iterator<number> = set.values();

      expect(values.next().value).assertEqual(3);
      expect(values.next().value).assertEqual(6);
      expect(values.next().value).assertEqual(9);
      expect(values.next().done).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_SET_VALUES_006
     * @tc.name testSetValues006
     * @tc.desc Test Set.values() with boolean elements
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSetValues006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const set: Set<boolean> = new Set([true, false, true]);
      const values: Iterator<boolean> = set.values();

      expect(values.next().value).assertEqual(true);
      expect(values.next().value).assertEqual(false);
      expect(values.next().done).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_SET_VALUES_007
     * @tc.name testSetValues007
     * @tc.desc Test Set.values() with plain object elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSetValues007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const obj1: TestObject = { id: 1, data: 'test1' };
      const obj2: TestObject = { id: 2, data: 'test2' };
      const set: Set<TestObject> = new Set([obj1, obj2]);
      const values: Iterator<TestObject> = set.values();

      const firstVal: TestObject = values.next().value;
      const secondVal: TestObject = values.next().value;

      expect(firstVal).assertEqual(obj1);
      expect(secondVal).assertEqual(obj2);
      expect(firstVal?.data).assertEqual('test1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_SET_VALUES_008
     * @tc.name testSetValues008
     * @tc.desc Test Set.values() with NaN elements
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSetValues008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const set: Set<number> = new Set([NaN, NaN, 7]);
      const values: Iterator<number> = set.values();

      const firstVal: number = values.next().value;
      expect(isNaN(firstVal)).assertEqual(true);
      expect(values.next().value).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_SET_VALUES_009
     * @tc.name testSetValues009
     * @tc.desc Test Set.values() with 0 and -0 elements
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSetValues009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const set: Set<number> = new Set([0, -0, 4]);
      const values: Iterator<number> = set.values();

      expect(values.next().value).assertEqual(0);
      expect(values.next().value).assertEqual(4);
      expect(values.next().done).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_SET_VALUES_010
     * @tc.name testSetValues010
     * @tc.desc Test independence of multiple iterators from Set.values()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSetValues010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const set: Set<string> = new Set(['a', 'b', 'c']);
      const values1: Iterator<string> = set.values();
      const values2: Iterator<string> = set.values();

      expect(values1.next().value).assertEqual('a');
      expect(values1.next().value).assertEqual('b');
      expect(values2.next().value).assertEqual('a');
      expect(values1.next().value).assertEqual('c');
      expect(values2.next().value).assertEqual('b');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_SET_VALUES_011
     * @tc.name testSetValues011
     * @tc.desc Test Set.values() after adding elements dynamically
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSetValues011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const set: Set<number> = new Set([1, 2]);
      set.add(3);
      set.add(4);
      const values: Iterator<number> = set.values();

      expect(values.next().value).assertEqual(1);
      expect(values.next().value).assertEqual(2);
      expect(values.next().value).assertEqual(3);
      expect(values.next().value).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_SET_VALUES_012
     * @tc.name testSetValues012
     * @tc.desc Test Set.values() after deleting elements dynamically
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSetValues012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const set: Set<string> = new Set(['x', 'y', 'z']);
      set.delete('y');
      const values: Iterator<string> = set.values();

      expect(values.next().value).assertEqual('x');
      expect(values.next().value).assertEqual('z');
      expect(values.next().done).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_SET_VALUES_013
     * @tc.name testSetValues013
     * @tc.desc Test Set.values() with BigInt elements
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSetValues013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const set: Set<bigint> = new Set([100n, 200n, 300n]);
      const values: Iterator<bigint> = set.values();

      expect(values.next().value).assertEqual(100n);
      expect(values.next().value).assertEqual(200n);
      expect(values.next().value).assertEqual(300n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_SET_VALUES_014
     * @tc.name testSetValues014
     * @tc.desc Test Set.values() with Symbol elements
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSetValues014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      expect(testSetValuesJs014()).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_SET_VALUES_015
     * @tc.name testSetValues015
     * @tc.desc Test Set.values() state after full iteration
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSetValues015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const set: Set<number> = new Set([1, 2, 3]);
      const values: Iterator<number> = set.values();

      while (!values.next().done) {
      }
      expect(values.next().done).assertEqual(true);
      expect(values.next().value).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_SET_VALUES_016
     * @tc.name testSetValues016
     * @tc.desc Test Set.values() with Date object elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSetValues016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const date1: Date = new Date('2024-01-01');
      const date2: Date = new Date('2024-01-02');
      const set: Set<Date> = new Set([date1, date2]);
      const values: Iterator<Date> = set.values();

      const firstDate: Date = values.next().value;
      const secondDate: Date = values.next().value;

      expect(firstDate).assertEqual(date1);
      expect(secondDate).assertEqual(date2);
      expect(firstDate?.toISOString()).assertEqual('2024-01-01T00:00:00.000Z');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_SET_VALUES_017
     * @tc.name testSetValues017
     * @tc.desc Test Set.values() with RegExp object elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSetValues017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const reg1: RegExp = /abc/;
      const reg2: RegExp = /def/g;
      const set: Set<RegExp> = new Set([reg1, reg2]);
      const values: Iterator<RegExp> = set.values();

      const firstReg: RegExp = values.next().value;
      const secondReg: RegExp = values.next().value;

      expect(firstReg).assertEqual(reg1);
      expect(secondReg).assertEqual(reg2);
      expect(firstReg?.test('abc')).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_SET_VALUES_018
     * @tc.name testSetValues018
     * @tc.desc Test converting Set.values() iterator to array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSetValues018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const set: Set<string> = new Set(['a', 'b', 'c']);
      const values: Iterator<string> = set.values();
      const result: string[] = [];

      let current = values.next();
      while (!current.done) {
        result.push(current.value);
        current = values.next();
      }

      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual('a');
      expect(result[1]).assertEqual('b');
      expect(result[2]).assertEqual('c');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_SET_VALUES_019
     * @tc.name testSetValues019
     * @tc.desc Test iterating Set.values() with for...of loop
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSetValues019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const set: Set<number> = new Set([10, 20, 30]);
      const values: Iterator<number> = set.values();
      const result: number[] = [];

      let current: IteratorResult<number> = values.next();
      while (!current.done) {
        const val: number = current.value!;
        result.push(val);
        current = values.next();
      }

      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(10);
      expect(result[1]).assertEqual(20);
      expect(result[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_SET_VALUES_020
     * @tc.name testSetValues020
     * @tc.desc Test SameValueZero comparison via Set.values()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSetValues020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const obj1: TestObject = { id: 1, data: 'same' };
      const obj2: TestObject = { id: 1, data: 'same' };
      const set: Set<TestObject> = new Set([obj1, obj2]);
      const values: Iterator<TestObject> = set.values();

      expect(values.next().value).assertEqual(obj1);
      expect(values.next().value).assertEqual(obj2);
      expect(values.next().done).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_SET_VALUES_021
     * @tc.name testSetValues021
     * @tc.desc Test Set.values() with large dataset (1000+ elements)
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSetValues021', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL1, (): void => {
      const set: Set<number> = new Set();
      for (let i = 0; i < 1000; i++) {
        set.add(i);
      }

      const values: Iterator<number> = set.values();
      let count = 0;
      let current = values.next();

      while (!current.done) {
        count++;
        current = values.next();
      }

      expect(count).assertEqual(1000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_SET_VALUES_022
     * @tc.name testSetValues022
     * @tc.desc Test Set.values() after clear() operation
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSetValues022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const set: Set<string> = new Set(['a', 'b', 'c']);
      set.clear();
      const values: Iterator<string> = set.values();

      expect(values.next().done).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_SET_VALUES_023
     * @tc.desc Test equivalence of Set.values() and Set.keys()
     * @tc.name testSetValues023
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSetValues023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const set: Set<number> = new Set([1, 2, 3]);
      const values: Iterator<number> = set.values();
      const keys: Iterator<number> = set.keys();

      expect(values.next().value).assertEqual(keys.next().value);
      expect(values.next().value).assertEqual(keys.next().value);
      expect(values.next().value).assertEqual(keys.next().value);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_SET_VALUES_024
     * @tc.name testSetValues024
     * @tc.desc Test explicit type annotation for Set.values() iterator
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSetValues024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const set: Set<string> = new Set(['test']);
      const values: Iterator<string> = set.values();
      const value: string | undefined = values.next().value;

      expect(value).assertEqual('test');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_SET_VALUES_026
     * @tc.name testSetValues026
     * @tc.desc Test Set.values() with function elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSetValues026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const func1 = () => 'function1';
      const func2 = () => 'function2';
      const set: Set<() => string> = new Set([func1, func2]);
      const values: Iterator<() => string> = set.values();

      const firstFunc: () => string = values.next().value;
      const secondFunc: () => string = values.next().value;

      expect(firstFunc).assertEqual(func1);
      expect(secondFunc).assertEqual(func2);
      expect(firstFunc?.()).assertEqual('function1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_SET_VALUES_027
     * @tc.name testSetValues027
     * @tc.desc Test partial iteration with Set.values()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSetValues027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const set: Set<string> = new Set(['one', 'two', 'three', 'four']);
      const values: Iterator<string> = set.values();

      expect(values.next().value).assertEqual('one');
      expect(values.next().value).assertEqual('two');
      // Stop iteration halfway
      expect(values.next().done).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_SET_VALUES_028
     * @tc.name testSetValues028
     * @tc.desc Test Set.values() with null and undefined elements
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSetValues028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const set: Set<null | undefined> = new Set([null, undefined, null]);
      const values: Iterator<null | undefined> = set.values();

      expect(values.next().value).assertEqual(null);
      expect(values.next().value).assertEqual(undefined);
      expect(values.next().done).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_SET_VALUES_029
     * @tc.name testSetValues029
     * @tc.desc Test chained iteration with Set.values()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSetValues029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const set: Set<number> = new Set([1, 2, 3]);
      const values: Iterator<number> = set.values();

      const first = values.next();
      expect(first.value).assertEqual(1);
      expect(first.done).assertEqual(false);

      const second = values.next();
      expect(second.value).assertEqual(2);
      expect(second.done).assertEqual(false);

      const third = values.next();
      expect(third.value).assertEqual(3);
      expect(third.done).assertEqual(false);

      const done = values.next();
      expect(done.value).assertEqual(undefined);
      expect(done.done).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_SET_VALUES_030
     * @tc.name testSetValues030
     * @tc.desc Test Set.values() with mixed type elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSetValues030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const mixedSet: Set<string | number | boolean> = new Set(['text', 42, true]);
      const values: Iterator<string | number | boolean> = mixedSet.values();

      expect(values.next().value).assertEqual('text');
      expect(values.next().value).assertEqual(42);
      expect(values.next().value).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_SET_VALUES_031
     * @tc.name testSetValues031
     * @tc.desc Test Set.values() with elements added after iterator creation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSetValues031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const set: Set<number> = new Set([1, 2]);
      const values: Iterator<number> = set.values();

      // Add elements after iterator creation
      set.add(3);
      set.add(4);

      const firstVal: number = values.next().value!;
      const secondVal: number = values.next().value!;
      const thirdVal: number = values.next().value!;

      expect(firstVal).assertEqual(1);
      expect(secondVal).assertEqual(2);
      expect(thirdVal).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_SET_VALUES_032
     * @tc.name testSetValues032
     * @tc.desc Test Set.values() with elements deleted after iterator creation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSetValues032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const set: Set<string> = new Set(['a', 'b', 'c']);
      const values: Iterator<string> = set.values();

      // Delete element after iterator creation
      set.delete('b');

      const firstVal: string = values.next().value!;
      const secondVal: string | undefined = values.next().value;

      expect(firstVal).assertEqual('a');
      expect(secondVal).assertEqual('c');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_SET_VALUES_033
     * @tc.name testSetValues033
     * @tc.desc Test Set.values() with iterator reusability
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSetValues033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const set: Set<number> = new Set([10, 20]);
      const values1: Iterator<number> = set.values();
      const values2: Iterator<number> = set.values();

      // Traverse first iterator
      const val1: number = values1.next().value!;
      const val2: number = values1.next().value!;

      // Second iterator should start from beginning
      const val3: number = values2.next().value!;

      expect(val1).assertEqual(10);
      expect(val2).assertEqual(20);
      expect(val3).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_SET_VALUES_034
     * @tc.name testSetValues034
     * @tc.desc Test Set.values() with deeply nested objects
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSetValues034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      expect(testSetSizeJs034()).assertDeepEquals([1, 2, 3]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_SET_VALUES_035
     * @tc.name testSetValues035
     * @tc.desc Test Set.values() with class instances
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSetValues035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const instance1: TestClass = new TestClass('test1', 1);
      const instance2: TestClass = new TestClass('test2', 2);
      const set: Set<TestClass> = new Set([instance1, instance2]);
      const values: Iterator<TestClass> = set.values();

      const firstVal: TestClass = values.next().value!;
      const secondVal: TestClass = values.next().value!;

      expect(firstVal.name).assertEqual('test1');
      expect(secondVal.version).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_SET_VALUES_036
     * @tc.name testSetValues036
     * @tc.desc Test Set.values() with enum values
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSetValues036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const set: Set<TestEnum> = new Set([TestEnum.Option1, TestEnum.Option2]);
      const values: Iterator<TestEnum> = set.values();

      const firstVal: TestEnum = values.next().value!;
      const secondVal: TestEnum = values.next().value!;

      expect(firstVal).assertEqual(TestEnum.Option1);
      expect(secondVal).assertEqual(TestEnum.Option2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_SET_VALUES_037
     * @tc.name testSetValues037
     * @tc.desc Test Set.values() with mixed primitive types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSetValues037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const set: Set<string | number | boolean> = new Set(['text', 100, true]);
      const values: Iterator<string | number | boolean> = set.values();

      const firstVal: string | number | boolean = values.next().value!;
      const secondVal: string | number | boolean = values.next().value!;
      const thirdVal: string | number | boolean = values.next().value!;

      expect(firstVal).assertEqual('text');
      expect(secondVal).assertEqual(100);
      expect(thirdVal).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_SET_VALUES_038
     * @tc.name testSetValues038
     * @tc.desc Test Set.values() with very large numbers
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSetValues038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const set: Set<number> = new Set([Number.MAX_SAFE_INTEGER, Number.MAX_VALUE]);
      const values: Iterator<number> = set.values();

      const firstVal: number = values.next().value!;
      const secondVal: number = values.next().value!;

      expect(firstVal).assertEqual(Number.MAX_SAFE_INTEGER);
      expect(secondVal).assertEqual(Number.MAX_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_SET_VALUES_039
     * @tc.name testSetValues039
     * @tc.desc Test Set.values() with negative numbers
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSetValues039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const set: Set<number> = new Set([-1, -5, -10]);
      const values: Iterator<number> = set.values();

      const firstVal: number = values.next().value!;
      const secondVal: number = values.next().value!;
      const thirdVal: number = values.next().value!;

      expect(firstVal).assertEqual(-1);
      expect(secondVal).assertEqual(-5);
      expect(thirdVal).assertEqual(-10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_SET_VALUES_040
     * @tc.name testSetValues040
     * @tc.desc Test Set.values() with empty strings and whitespace
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSetValues040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const set: Set<string> = new Set(['', ' ', '  ']);
      const values: Iterator<string> = set.values();

      const firstVal: string = values.next().value!;
      const secondVal: string = values.next().value!;
      const thirdVal: string = values.next().value!;

      expect(firstVal).assertEqual('');
      expect(secondVal).assertEqual(' ');
      expect(thirdVal).assertEqual('  ');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_SET_VALUES_041
     * @tc.name testSetValues041
     * @tc.desc Test Set.values() after multiple add/delete operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSetValues041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const set: Set<number> = new Set([1, 2, 3]);
      set.delete(2);
      set.add(4);
      set.add(5);
      set.delete(3);
      const values: Iterator<number> = set.values();

      const firstVal: number = values.next().value!;
      const secondVal: number = values.next().value!;
      const thirdVal: number = values.next().value!;

      expect(firstVal).assertEqual(1);
      expect(secondVal).assertEqual(4);
      expect(thirdVal).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_SET_VALUES_042
     * @tc.name testSetValues042
     * @tc.desc Test Set.values() with Symbol.iterator polyfill
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSetValues042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const set: Set<string> = new Set(['a', 'b', 'c']);
      const values: Iterator<string> = set.values();
      const result: string[] = [];

      let current: IteratorResult<string> = values.next();
      while (!current.done) {
        const currentVal: string = current.value!;
        result.push(currentVal);
        current = values.next();
      }

      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual('a');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_SET_VALUES_043
     * @tc.name testSetValues043
     * @tc.desc Test Set.values() with sparse array elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSetValues043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      // Create sparse array
      const sparseArray: number[] = [];
      sparseArray[0] = 10;
      sparseArray[5] = 20;
      sparseArray[10] = 30;

      const set: Set<number> = new Set(sparseArray);
      const values: Iterator<number> = set.values();

      const firstVal: number = values.next().value!;
      const secondVal: number = values.next().value!;
      const thirdVal: number = values.next().value!;
      const forthVal: number = values.next().value!;

      expect(firstVal).assertEqual(10);
      expect(secondVal).assertEqual(undefined);
      expect(thirdVal).assertEqual(20);
      expect(forthVal).assertEqual(30);

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_SET_VALUES_044
     * @tc.name testSetValues044
     * @tc.desc Test Set.values() with frozen objects
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSetValues044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      expect(testSetValuesJs044()).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_SET_VALUES_045
     * @tc.name testSetValues045
     * @tc.desc Test Set.values() with very large dataset iteration performance
     * @tc.size LargeTest
     * @tc.type Performance
     * @tc.level Level 1
     */
    it('testSetValues045', TestType.PERFORMANCE | Size.LARGETEST | Level.LEVEL1, (): void => {
      const set: Set<number> = new Set();
      const size: number = 10000;

      // Populate set
      for (let i = 0; i < size; i++) {
        set.add(i);
      }

      const values: Iterator<number> = set.values();
      const startTime: number = Date.now();
      let count: number = 0;

      // Iterate through all values
      let current: IteratorResult<number> = values.next();
      while (!current.done) {
        count++;
        current = values.next();
      }

      const endTime: number = Date.now();
      const duration: number = endTime - startTime;

      expect(count).assertEqual(size);
      // Performance assertion: Should complete in under 100ms
      expect(duration).assertLess(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_SET_VALUES_046
     * @tc.name testSetValues046
     * @tc.desc Test Set.values() with null prototype objects
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSetValues046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      expect(testSetValuesJs046()).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_SET_VALUES_047
     * @tc.name testSetValues047
     * @tc.desc Test Set.values() with regex pattern objects
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSetValues047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex1: RegExp = /test/i;
      const regex2: RegExp = /pattern/g;
      const set: Set<RegExp> = new Set([regex1, regex2]);
      const values: Iterator<RegExp> = set.values();

      const firstVal: RegExp = values.next().value!;
      const secondVal: RegExp = values.next().value!;

      expect(firstVal.test('TEST')).assertEqual(true);
      expect(secondVal.flags).assertEqual('g');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_SET_VALUES_048
     * @tc.name testSetValues048
     * @tc.desc Test Set.values() with Date objects representing same time
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSetValues048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const date1: Date = new Date('2024-01-01');
      const date2: Date = new Date('2024-01-01'); // Same time but different instance
      const set: Set<Date> = new Set([date1, date2]);
      const values: Iterator<Date> = set.values();

      const firstVal: Date = values.next().value!;
      const secondVal: Date = values.next().value!;

      expect(firstVal).assertEqual(date1);
      expect(secondVal).assertEqual(date2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_SET_VALUES_049
     * @tc.name testSetValues049
     * @tc.desc Test Set.values() with Map objects
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSetValues049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map1: Map<number, string> = new Map([[1, 'one']]);
      const map2: Map<number, string> = new Map([[2, 'two']]);
      const set: Set<Map<number, string>> = new Set([map1, map2]);
      const values: Iterator<Map<number, string>> = set.values();

      const firstVal: Map<number, string> = values.next().value!;
      const secondVal: Map<number, string> = values.next().value!;

      expect(firstVal.get(1)).assertEqual('one');
      expect(secondVal.get(2)).assertEqual('two');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_SET_VALUES_050
     * @tc.name testSetValues050
     * @tc.desc Test Set.values() with Set objects
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSetValues050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const innerSet1: Set<number> = new Set([1, 2]);
      const innerSet2: Set<number> = new Set([3, 4]);
      const set: Set<Set<number>> = new Set([innerSet1, innerSet2]);
      const values: Iterator<Set<number>> = set.values();

      const firstVal: Set<number> = values.next().value!;
      const secondVal: Set<number> = values.next().value!;

      expect(firstVal.has(1)).assertEqual(true);
      expect(secondVal.size).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_SET_VALUES_051
     * @tc.name testSetValues051
     * @tc.desc Test Set.values() with function objects
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSetValues051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const func1: () => string = () => 'function 1';
      const func2: () => string = () => 'function 2';
      const set: Set<() => string> = new Set([func1, func2]);
      const values: Iterator<() => string> = set.values();

      const firstVal: () => string = values.next().value!;
      const secondVal: () => string = values.next().value!;

      expect(firstVal()).assertEqual('function 1');
      expect(secondVal()).assertEqual('function 2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_SET_VALUES_052
     * @tc.name testSetValues052
     * @tc.desc Test Set.values() with generator functions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSetValues052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      expect(testSetValuesJs052()).assertDeepEquals([1, 3]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_SET_VALUES_053
     * @tc.name testSetValues053
     * @tc.desc Test Set.values() with Uint8Array elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSetValues053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr1: Uint8Array = new Uint8Array([1, 2, 3]);
      const arr2: Uint8Array = new Uint8Array([4, 5, 6]);
      const set: Set<Uint8Array> = new Set([arr1, arr2]);
      const values: Iterator<Uint8Array> = set.values();

      const firstVal: Uint8Array = values.next().value!;
      const secondVal: Uint8Array = values.next().value!;

      expect(firstVal[0]).assertEqual(1);
      expect(secondVal.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_SET_VALUES_054
     * @tc.name testSetValues054
     * @tc.desc Test Set.values() with null and undefined
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSetValues054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const set: Set<null | undefined> = new Set([null, undefined, null]);
      const values: Iterator<null | undefined> = set.values();

      const firstVal: null | undefined = values.next().value!;
      const secondVal: null | undefined = values.next().value!;

      expect(firstVal).assertEqual(null);
      expect(secondVal).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_SET_VALUES_055
     * @tc.name testSetValues055
     * @tc.desc Test Set.values() with unique string objects
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSetValues055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const strObj1: String = new String('test1');
      const strObj2: String = new String('test1'); // Same value, different object
      const set: Set<String> = new Set([strObj1, strObj2]);
      const values: Iterator<String> = set.values();

      const firstVal: String = values.next().value!;
      const secondVal: String = values.next().value!;

      expect(firstVal).assertEqual(strObj1);
      expect(secondVal).assertEqual(strObj2);
      expect(firstVal.toString()).assertEqual('test1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_SET_VALUES_056
     * @tc.name testSetValues056
     * @tc.desc Test Set.values() with number objects
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSetValues056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const numObj1: Number = new Number(10);
      const numObj2: Number = new Number(20);
      const set: Set<Number> = new Set([numObj1, numObj2]);
      const values: Iterator<Number> = set.values();

      const firstVal: Number = values.next().value!;
      const secondVal: Number = values.next().value!;

      expect(firstVal.valueOf()).assertEqual(10);
      expect(secondVal.valueOf()).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_SET_VALUES_057
     * @tc.name testSetValues057
     * @tc.desc Test Set.values() with boolean objects
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSetValues057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const boolObj1: Boolean = new Boolean(true);
      const boolObj2: Boolean = new Boolean(false);
      const set: Set<Boolean> = new Set([boolObj1, boolObj2]);
      const values: Iterator<Boolean> = set.values();

      const firstVal: Boolean = values.next().value!;
      const secondVal: Boolean = values.next().value!;

      expect(firstVal.valueOf()).assertEqual(true);
      expect(secondVal.valueOf()).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_SET_VALUES_058
     * @tc.name testSetValues058
     * @tc.desc Test Set.values() with iterating and modifying simultaneously
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSetValues058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const set: Set<number> = new Set([1, 2, 3]);
      const values: Iterator<number> = set.values();
      const result: number[] = [];

      let current: IteratorResult<number> = values.next();
      while (!current.done) {
        const val: number = current.value!;
        result.push(val);

        // Modify set during iteration
        if (val === 2) {
          set.add(4);
          set.delete(3);
        }

        current = values.next();
      }

      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_SET_VALUES_059
     * @tc.name testSetValues059
     * @tc.desc Test Set.values() with objects containing Symbols as properties
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSetValues059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      expect(testSetValuesJs059()).assertDeepEquals(['value1', 'value2']);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_SET_VALUES_060
     * @tc.name testSetValues060
     * @tc.desc Test Set.values() with maximum capacity elements
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSetValues060', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL1, (): void => {
      const set: Set<number> = new Set();
      const maxElements: number = 100000;

      // Add maximum elements
      for (let i = 0; i < maxElements; i++) {
        set.add(i);
      }

      const values: Iterator<number> = set.values();
      let count: number = 0;

      // Verify we can iterate through all elements
      let current: IteratorResult<number> = values.next();
      while (!current.done && count < maxElements) {
        count++;
        current = values.next();
      }
      expect(count).assertEqual(maxElements);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_SET_VALUES_061
     * @tc.name testSetValues061
     * @tc.desc Test Set.values() with elements added through constructor and add()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSetValues061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      // Initialize with constructor and add more elements
      const set: Set<string> = new Set(['init1', 'init2']);
      set.add('added1');
      set.add('added2');
      set.add('init1'); // Duplicate

      const values: Iterator<string> = set.values();
      const result: string[] = [];
      let next: IteratorResult<string>;

      while (!(next = values.next()).done) {
        result.push(next.value);
      }

      // Verify all unique elements in insertion order
      expect(result.length).assertEqual(4);
      expect(result).assertContain('init1');
      expect(result).assertContain('init2');
      expect(result).assertContain('added1');
      expect(result).assertContain('added2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_SET_VALUES_062
     * @tc.name testSetValues062
     * @tc.desc Test Set.values() after clear() operation
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSetValues062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const set: Set<number> = new Set([1, 2, 3, 4]);
      set.clear(); // Clear all elements

      const values: Iterator<number> = set.values();
      const firstResult: IteratorResult<number> = values.next();

      // Verify iterator has no values after clear
      expect(firstResult.done).assertEqual(true);
      expect(firstResult.value).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_SET_VALUES_063
     * @tc.name testSetValues063
     * @tc.desc Test Set.values() with elements modified after insertion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSetValues063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const obj1: DataObject = { id: 1, content: 'original' };
      const obj2: DataObject = { id: 2, content: 'original' };
      const set: Set<DataObject> = new Set([obj1, obj2]);

      // Modify objects after insertion
      obj1.content = 'modified1';
      obj2.content = 'modified2';

      const values: Iterator<DataObject> = set.values();
      const result: DataObject[] = [];
      let next: IteratorResult<DataObject>;

      while (!(next = values.next()).done) {
        result.push(next.value);
      }

      // Verify values reflect object modifications
      expect(result.length).assertEqual(2);
      expect(result[0].content).assertEqual('modified1');
      expect(result[1].content).assertEqual('modified2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_SET_VALUES_065
     * @tc.name testSetValues065
     * @tc.desc Test Set.values() with String objects and primitive strings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSetValues065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const strObj: String = new String('object');
      const strPrim: string = 'primitive';
      const set: Set<String | string> = new Set([strObj, strPrim]);

      const values: Iterator<String | string> = set.values();
      const firstVal: String | string = values.next().value!;
      const secondVal: String | string = values.next().value!;

      // Verify different string types are treated as distinct
      expect(firstVal).assertDeepEquals(strObj);
      expect(secondVal).assertDeepEquals(strPrim);
      expect(firstVal.valueOf()).assertEqual('object');
      expect(secondVal.valueOf()).assertEqual('primitive');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_SET_VALUES_066
     * @tc.name testSetValues066
     * @tc.desc Test Set.values() with elements removed during iteration
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSetValues066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const set: Set<number> = new Set([10, 20, 30, 40, 50]);
      const values: Iterator<number> = set.values();
      const result: number[] = [];
      let next: IteratorResult<number>;

      // Iterate and remove elements that meet condition
      while (!(next = values.next()).done) {
        result.push(next.value);
        if (next.value === 30) {
          set.delete(40); // Remove upcoming element
          set.delete(20); // Remove already iterated element
        }
      }

      // Verify iterator behavior during concurrent modification
      expect(result).assertDeepEquals([10, 20, 30, 50]);
      expect(set.size).assertEqual(3); // 10,30,50 remain
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_SET_VALUES_067
     * @tc.name testSetValues067
     * @tc.desc Test Set.values() with custom class instances
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSetValues067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const item1: CustomItem = new CustomItem('A', 100);
      const item2: CustomItem = new CustomItem('B', 200);
      const item3: CustomItem = new CustomItem('A', 100); // Same values, different instance
      const set: Set<CustomItem> = new Set([item1, item2, item3]);

      // Collect values using forEach
      const valuesFromForEach: CustomItem[] = [];
      set.forEach(item => valuesFromForEach.push(item));

      // Collect values using values() iterator
      const valuesFromIterator: CustomItem[] = Array.from(set.values());

      // Verify both methods return same elements in same order
      expect(valuesFromIterator.length).assertEqual(3);
      expect(valuesFromIterator).assertDeepEquals(valuesFromForEach);
      expect(valuesFromIterator[0]).assertDeepEquals(item1);
      expect(valuesFromIterator[1]).assertDeepEquals(item2);
      expect(valuesFromIterator[2]).assertDeepEquals(item3);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_SET_VALUES_069
     * @tc.name testSetValues069
     * @tc.desc Test Set.values() with large dataset and conversion to Array
     * @tc.size LargeTest
     * @tc.type Performance
     * @tc.level Level 1
     */
    it('testSetValues069', TestType.PERFORMANCE | Size.LARGETEST | Level.LEVEL1, (): void => {
      const set: Set<number> = new Set();
      const targetSize: number = 100000;

      // Populate set with unique numbers
      for (let i = 0; i < targetSize; i++) {
        set.add(i);
      }

      // Measure time to convert values iterator to array
      const startTime: number = Date.now();
      const valuesArray: number[] = Array.from(set.values());
      const conversionTime: number = Date.now() - startTime;

      // Verify array content matches set
      expect(valuesArray.length).assertEqual(targetSize);
      expect(valuesArray[0]).assertEqual(0);
      expect(valuesArray[targetSize - 1]).assertEqual(targetSize - 1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_SET_VALUES_070
     * @tc.name testSetValues070
     * @tc.desc Test Set.values() with nested Set objects as elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSetValues070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const innerSet1: Set<string> = new Set(['a', 'b']);
      const innerSet2: Set<string> = new Set(['c', 'd']);
      const outerSet: Set<Set<string>> = new Set([innerSet1, innerSet2]);

      const values: Iterator<Set<string>> = outerSet.values();
      const firstInnerSet: Set<string> = values.next().value!;
      const secondInnerSet: Set<string> = values.next().value!;

      // Verify inner sets are returned correctly
      expect(firstInnerSet).assertDeepEquals(innerSet1);
      expect(secondInnerSet).assertDeepEquals(innerSet2);
      expect(Array.from(firstInnerSet)).assertDeepEquals(['a', 'b']);
      expect(Array.from(secondInnerSet)).assertDeepEquals(['c', 'd']);

      // Modify inner set and verify changes are reflected
      innerSet1.add('e');
      expect(Array.from(firstInnerSet)).assertDeepEquals(['a', 'b', 'e']);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_SET_VALUES_071
     * @tc.name testSetValues071
     * @tc.desc Test Set.values() with elements added/removed before and during iteration
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSetValues071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const set: Set<number> = new Set([1, 2, 3]);
      const values: Iterator<number> = set.values();

      // Initial state
      expect(values.next().value).assertEqual(1);

      // Modify during iteration
      set.delete(2);
      set.add(4);
      set.add(5);

      // Continue iteration
      expect(values.next().value).assertEqual(3); // Original element remains
      expect(values.next().value).assertEqual(4); // New element added
      expect(values.next().done).assertEqual(false);
      expect(values.next().done).assertEqual(true);

      // Verify final state
      expect(Array.from(set.values())).assertDeepEquals([1, 3, 4, 5]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_SET_VALUES_072
     * @tc.name testSetValues072
     * @tc.desc Test Set.values() with ArrayBuffer and TypedArray elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSetValues072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const buffer1: ArrayBuffer = new ArrayBuffer(8);
      const buffer2: ArrayBuffer = new ArrayBuffer(8);
      const view1: Uint32Array = new Uint32Array(buffer1);
      const view2: Uint32Array = new Uint32Array(buffer2);

      view1.set([0x12345678, 0x87654321]);
      view2.set([0x12345678, 0x87654321]);

      const set: Set<ArrayBuffer | Uint32Array> = new Set([buffer1, view1, buffer2, view2]);
      const values: Iterator<ArrayBuffer | Uint32Array> = set.values();

      const result: (ArrayBuffer | Uint32Array)[] = [];
      let next: IteratorResult<ArrayBuffer | Uint32Array>;
      while (!(next = values.next()).done) {
        result.push(next.value);
      }

      expect(result.length).assertEqual(4);
      expect(result[0]).assertDeepEquals(buffer1);
      expect(result[1]).assertDeepEquals(view1);
      expect(result[2]).assertDeepEquals(buffer2);
      expect(result[3]).assertDeepEquals(view2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_SET_VALUES_073
     * @tc.name testSetValues073
     * @tc.desc Test Set.values() with objects containing Symbols as properties
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSetValues073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      expect(testSetSizeJs073()).assertDeepEquals([2, 'value1', 'value2']);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_SET_VALUES_074
     * @tc.name testSetValues074
     * @tc.desc Test Set.values() with mixed Date objects and timestamps
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSetValues074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const date1: Date = new Date('2024-01-01');
      const date2: Date = new Date('2024-01-01'); // Same time, different instance
      const timestamp: number = date1.getTime();

      const set: Set<Date | number> = new Set([date1, date2, timestamp]);
      const values: Iterator<Date | number> = set.values();

      expect(values.next().value).assertDeepEquals(date1);
      expect(values.next().value).assertDeepEquals(date2);
      expect(values.next().value).assertEqual(timestamp);
      expect(values.next().done).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_SET_VALUES_075
     * @tc.name testSetValues075
     * @tc.desc Test Set.values() after multiple add/delete cycles
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSetValues075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const set: Set<string> = new Set();

      // Complex modification sequence
      set.add('a');
      set.add('b');
