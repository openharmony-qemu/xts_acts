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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size} from '@ohos/hypium';
import { collections } from '@kit.ArkTS';
import Utils from './Util.test';

@Sendable
class DataModel {
  public code: number;
  public label: string;

  constructor(code: number, label: string) {
    this.code = code;
    this.label = label;
  }
}

@Sendable
class TestClass {
  public id: number;

  constructor(id: number) {
    this.id = id;
  }
}

export default function SetFromCollectionsTest() {
  describe('SetFromCollectionsTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      await Utils.msSleep(30);
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_0100
     * @tc.name builtinsAsyncLockConstructorTest0100
     * @tc.desc Verify keys() and values() return same elements for primitive values
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsAsyncLockConstructorTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const caseName = 'testSetKeysValuesCollections001';
      console.info(`${caseName}, test start`);
      const set: collections.Set<string> = new collections.Set<string>(['a', 'b', 'c']);

      const keys: string[] = Array.from(set.keys());
      const values: string[] = Array.from(set.values());

      expect(keys.length).assertEqual(values.length);
      expect(keys.length).assertEqual(3);
      expect(keys.includes('a')).assertEqual(true);
      expect(keys.includes('b')).assertEqual(true);
      expect(keys.includes('c')).assertEqual(true);
      expect(keys).assertDeepEquals(values);
      expect(keys).assertDeepEquals(['a', 'b', 'c']);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_0200
     * @tc.name builtinsAsyncLockConstructorTest0200
     * @tc.desc Verify keys() and values() consistency after add operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsAsyncLockConstructorTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'testSetKeysValuesCollections002';
      console.info(`${caseName}, test start`);
      const set: collections.Set<number> = new collections.Set<number>([1, 2]);
      set.add(3);
      set.add(4);
      set.add(2);

      const keys: number[] = Array.from(set.keys());
      const values: number[] = Array.from(set.values());

      expect(keys.length).assertEqual(4);
      expect(keys.length).assertEqual(values.length);
      expect(keys.includes(1)).assertEqual(true);
      expect(keys.includes(2)).assertEqual(true);
      expect(keys.includes(3)).assertEqual(true);
      expect(keys.includes(4)).assertEqual(true);
      expect(keys).assertDeepEquals(values);
      expect(JSON.stringify(keys)).assertDeepEquals(JSON.stringify([1, 2, 3, 4]));
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_0300
     * @tc.name builtinsAsyncLockConstructorTest0300
     * @tc.desc Verify keys() and values() after delete operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsAsyncLockConstructorTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'testSetKeysValuesCollections003';
      console.info(`${caseName}, test start`);
      const set: collections.Set<boolean> = new collections.Set<boolean>([true, false, true]);
      set.delete(true);

      const keys: boolean[] = Array.from(set.keys());
      const values: boolean[] = Array.from(set.values());

      expect(keys.length).assertEqual(1);
      expect(keys[0]).assertEqual(false);
      expect(keys.length).assertEqual(values.length);
      expect(JSON.stringify(keys)).assertDeepEquals(JSON.stringify([false]));
      expect(keys).assertDeepEquals(values);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_0400
     * @tc.name builtinsAsyncLockConstructorTest0400
     * @tc.desc Verify keys() and values() for empty Set
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsAsyncLockConstructorTest0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const caseName = 'testSetKeysValuesCollections004';
      console.info(`${caseName}, test start`);
      const set: collections.Set<number> = new collections.Set<number>();

      const keys: number[] = Array.from(set.keys());
      const values: number[] = Array.from(set.values());

      expect(keys.length).assertEqual(0);
      expect(values.length).assertEqual(0);
      expect(keys.length).assertEqual(values.length);
      expect(keys).assertDeepEquals([] as number[]);
      expect(values).assertDeepEquals([] as number[]);
      expect(keys).assertDeepEquals(values);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_0500
     * @tc.name builtinsAsyncLockConstructorTest0500
     * @tc.desc Verify keys() and values() with mixed primitive types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsAsyncLockConstructorTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'testSetKeysValuesCollections006';
      console.info(`${caseName}, test start`);
      const set: collections.Set<string | number | boolean> = new collections.Set<string | number | boolean>([
        'text', 42, true, 'text', 42
      ]);

      const keys: (string | number | boolean)[] = Array.from(set.keys());
      const values: (string | number | boolean)[] = Array.from(set.values());

      expect(keys.length).assertEqual(3);
      expect(keys.length).assertEqual(values.length);
      expect(keys.includes('text')).assertEqual(true);
      expect(keys.includes(42)).assertEqual(true);
      expect(keys.includes(true)).assertEqual(true);
      expect(JSON.stringify(keys)).assertDeepEquals(JSON.stringify(['text', 42, true]));
      expect(keys).assertDeepEquals(values);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_0600
     * @tc.name builtinsAsyncLockConstructorTest0600
     * @tc.desc Verify keys() and values() after clear() operation
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsAsyncLockConstructorTest0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const caseName = 'testSetKeysValuesCollections007';
      console.info(`${caseName}, test start`);
      const set: collections.Set<number> = new collections.Set<number>([10, 20, 30]);
      set.clear();

      const keys: number[] = Array.from(set.keys());
      const values: number[] = Array.from(set.values());

      expect(keys.length).assertEqual(0);
      expect(values.length).assertEqual(0);
      expect(keys).assertDeepEquals([] as number[]);
      expect(values).assertDeepEquals([] as number[]);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_0700
     * @tc.name builtinsAsyncLockConstructorTest0700
     * @tc.desc Verify simultaneous iteration with keys() and values()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsAsyncLockConstructorTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'testSetKeysValuesCollections008';
      console.info(`${caseName}, test start`);
      const set: collections.Set<string> = new collections.Set<string>(['apple', 'banana', 'cherry']);

      const keyIter = set.keys();
      const valueIter = set.values();

      let result: boolean = true;
      let keyResult: IteratorResult<string>, valueResult: IteratorResult<string>;

      while (!(keyResult = keyIter.next()).done && !(valueResult = valueIter.next()).done) {
        if (keyResult.value !== valueResult.value) {
          result = false;
          break;
        }
      }

      expect(result).assertTrue();
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_0800
     * @tc.name builtinsAsyncLockConstructorTest0800
     * @tc.desc Verify keys() and values() with BigInt elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsAsyncLockConstructorTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'testSetKeysValuesCollections010';
      console.info(`${caseName}, test start`);
      const big1: bigint = 1234567890123456789n;
      const big2: bigint = 1234567890123456789n;
      const big3: bigint = 9876543210987654321n;

      const set: collections.Set<bigint> = new collections.Set<bigint>([big1, big2, big3]);

      const keys: bigint[] = Array.from(set.keys());
      const values: bigint[] = Array.from(set.values());

      expect(set.size).assertEqual(2);
      expect(keys.length).assertEqual(values.length);
      expect(keys[0]).assertEqual(big1);
      expect(keys[1]).assertEqual(big3);
      expect(keys.map((x) => x.toString())).assertDeepEquals([big1, big3].map((x) => x.toString()));
      expect(values.map((x) => x.toString())).assertDeepEquals([big1, big3].map((x) => x.toString()));
      expect(keys.map((x) => x.toString())).assertDeepEquals(values.map((x) => x.toString()));
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_0900
     * @tc.name builtinsAsyncLockConstructorTest0900
     * @tc.desc Verify keys() and values() with class instances
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsAsyncLockConstructorTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'testSetKeysValuesCollections012';
      console.info(`${caseName}, test start`);
      const item1: DataModel = new DataModel(1, 'First');
      const item2: DataModel = new DataModel(2, 'Second');
      const item3: DataModel = new DataModel(1, 'First');
      const set: collections.Set<DataModel> = new collections.Set<DataModel>([item1, item2, item3]);

      const keys: DataModel[] = Array.from(set.keys());
      const values: DataModel[] = Array.from(set.values());

      expect(keys.length).assertEqual(3);
      expect(keys[0].code).assertEqual(1);
      expect(keys[1].code).assertEqual(2);
      expect(keys[2].code).assertEqual(1);
      expect(keys).assertDeepEquals(values);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_1000
     * @tc.name builtinsAsyncLockConstructorTest1000
     * @tc.desc Verify keys() and values() with NaN and special numbers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsAsyncLockConstructorTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'testSetKeysValuesCollections016';
      console.info(`${caseName}, test start`);
      const set: collections.Set<number> = new collections.Set<number>([
        0, -0,
        Infinity, -Infinity
      ]);

      const keys: number[] = Array.from(set.keys());
      const values: number[] = Array.from(set.values());

      expect(keys.length).assertEqual(3);
      expect(keys.length).assertEqual(values.length);
      expect(keys[0]).assertEqual(0);
      expect(keys[1]).assertEqual(Infinity);
      expect(keys[2]).assertEqual(-Infinity);
      expect(keys).assertDeepEquals(values);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_1100
     * @tc.name builtinsAsyncLockConstructorTest1100
     * @tc.desc Verify keys() and values() during concurrent modification
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsAsyncLockConstructorTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'testSetKeysValuesCollections018';
      console.info(`${caseName}, test start`);
      const set: collections.Set<number> = new collections.Set<number>([1, 2, 3, 4]);
      const keyIter = set.keys();
      const valueIter = set.values();

      expect(keyIter.next().value).assertEqual(1);
      expect(valueIter.next().value).assertEqual(1);

      set.delete(2);
      set.add(5);

      expect(keyIter.next().value).assertEqual(3);
      expect(valueIter.next().value).assertEqual(3);
      expect(keyIter.next().value).assertEqual(4);
      expect(valueIter.next().value).assertEqual(4);
      expect(keyIter.next().value).assertEqual(5);
      expect(valueIter.next().value).assertEqual(5);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_1200
     * @tc.name builtinsAsyncLockConstructorTest1200
     * @tc.desc Verify keys() and values() with null, undefined and related strings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsAsyncLockConstructorTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'testSetKeysValuesCollections030';
      console.info(`${caseName}, test start`);
      const set: collections.Set<null | undefined | string> = new collections.Set<null | undefined | string>([
        null,
        undefined,
        'null',
        'undefined',
        null,
        undefined
      ]);

      const keys: (null | undefined | string)[] = Array.from(set.keys());
      const values: (null | undefined | string)[] = Array.from(set.values());

      expect(keys.length).assertEqual(4);
      expect(keys.length).assertEqual(values.length);
      expect(keys.includes(null)).assertEqual(true);
      expect(keys.includes(undefined)).assertEqual(true);
      expect(keys.includes('null')).assertEqual(true);
      expect(keys.includes('undefined')).assertEqual(true);
      expect(keys).assertDeepEquals([null, undefined, 'null', 'undefined']);
      expect(keys).assertDeepEquals(values);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_1300
     * @tc.name builtinsAsyncLockConstructorTest1300
     * @tc.desc Verify For-of in Set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsAsyncLockConstructorTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'testSetForOfCollections001';
      console.info(`${caseName}, test start`);
      const mySet: collections.Set<number | string> = new collections.Set<number | string>();
      mySet.add("0");
      mySet.add(1);
      const result: (number | string)[] = [];

      for (const v of mySet) {
        result.push(v);
      }

      expect(result.length).assertEqual(2);
      expect(result.includes("0")).assertEqual(true);
      expect(result.includes(1)).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_1400
     * @tc.name builtinsAsyncLockConstructorTest1400
     * @tc.desc Verify iteration behavior when adding elements during for-of loop
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsAsyncLockConstructorTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'testSetForOfCollections002';
      console.info(`${caseName}, test start`);
      const mySet: collections.Set<number> = new collections.Set<number>([1, 2]);
      const result: number[] = [];

      for (const v of mySet) {
        result.push(v);
        if (v === 1) {
          mySet.add(3);
        }
      }

      expect(result.length).assertEqual(3);
      expect(result.includes(1)).assertEqual(true);
      expect(result.includes(2)).assertEqual(true);
      expect(result.includes(3)).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_1500
     * @tc.name builtinsAsyncLockConstructorTest1500
     * @tc.desc Verify iteration behavior when deleting elements during for-of loop
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsAsyncLockConstructorTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'testSetForOfCollections003';
      console.info(`${caseName}, test start`);
      const mySet: collections.Set<number> = new collections.Set<number>([1, 2, 3]);
      const result: number[] = [];

      for (const v of mySet) {
        result.push(v);
        if (v === 2) {
          mySet.delete(3);
        }
      }

      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_1600
     * @tc.name builtinsAsyncLockConstructorTest1600
     * @tc.desc Verify for-of loop on empty Set after clear()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsAsyncLockConstructorTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'testSetForOfCollections004';
      console.info(`${caseName}, test start`);
      const mySet: collections.Set<string> = new collections.Set<string>(['a', 'b', 'c']);
      const result: string[] = [];

      mySet.clear();

      for (const v of mySet) {
        result.push(v);
      }

      expect(result.length).assertEqual(0);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_1700
     * @tc.name builtinsAsyncLockConstructorTest1700
     * @tc.desc Verify for-of loop with has() method check
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsAsyncLockConstructorTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'testSetForOfCollections005';
      console.info(`${caseName}, test start`);
      const mySet: collections.Set<boolean> = new collections.Set<boolean>([true, false]);
      const result: boolean[] = [];

      for (const v of mySet) {
        result.push(mySet.has(v));
      }

      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual(true);
      expect(result[1]).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_1800
     * @tc.name builtinsAsyncLockConstructorTest1800
     * @tc.desc Verify for-of loop after multiple add and delete operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsAsyncLockConstructorTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'testSetForOfCollections007';
      console.info(`${caseName}, test start`);
      const mySet: collections.Set<string> = new collections.Set<string>();
      mySet.add('x');
      mySet.add('y');
      mySet.delete('x');
      mySet.add('z');
      mySet.add('y');

      const result: string[] = [];
      for (const v of mySet) {
        result.push(v);
      }

      expect(result.length).assertEqual(2);
      expect(result.includes('y')).assertEqual(true);
      expect(result.includes('z')).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_1900
     * @tc.name builtinsAsyncLockConstructorTest1900
     * @tc.desc Verify for-of loop with mixed data types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsAsyncLockConstructorTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'testSetForOfCollections008';
      console.info(`${caseName}, test start`);
      const mySet: collections.Set<number | string | boolean> = new collections.Set<number | string | boolean>([10, 'hello', true]);
      const result: (number | string | boolean)[] = [];

      for (const v of mySet) {
        result.push(v);
      }

      expect(result.length).assertEqual(3);
      expect(result.includes(10)).assertEqual(true);
      expect(result.includes('hello')).assertEqual(true);
      expect(result.includes(true)).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_2000
     * @tc.name builtinsAsyncLockConstructorTest2000
     * @tc.desc Verify for-of loop with large Set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsAsyncLockConstructorTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'testSetForOfCollections009';
      console.info(`${caseName}, test start`);
      const mySet: collections.Set<number> = new collections.Set<number>();
      const size: number = 100;

      for (let i = 0; i < size; i++) {
        mySet.add(i);
      }

      const result: number[] = [];
      for (const v of mySet) {
        result.push(v);
      }

      expect(result.length).assertEqual(size);
      expect(result.length).assertEqual(100);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_2100
     * @tc.name builtinsAsyncLockConstructorTest2100
     * @tc.desc Verify for-of loop with same-value-zero comparison elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsAsyncLockConstructorTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'testSetForOfCollections010';
      console.info(`${caseName}, test start`);
      const mySet: collections.Set<number> = new collections.Set<number>([0, -0, 1]);
      const result: number[] = [];

      for (const v of mySet) {
        result.push(v);
      }

      expect(result.length).assertEqual(2);
      expect(result.includes(0)).assertEqual(true);
      expect(result.includes(1)).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_2200
     * @tc.name builtinsAsyncLockConstructorTest2200
     * @tc.desc Verify for-of loop with undefined and null elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsAsyncLockConstructorTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'testSetForOfCollections013';
      console.info(`${caseName}, test start`);
      const mySet: collections.Set<null | undefined> = new collections.Set<null | undefined>([undefined, null]);
      const result: (null | undefined)[] = [];

      for (const v of mySet) {
        result.push(v);
      }

      expect(result.length).assertEqual(2);
      expect(result.includes(null)).assertEqual(true);
      expect(result.includes(undefined)).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_2300
     * @tc.name builtinsAsyncLockConstructorTest2300
     * @tc.desc Verify for-of loop with numbers and their string equivalents
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsAsyncLockConstructorTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'testSetForOfCollections016';
      console.info(`${caseName}, test start`);
      const mySet: collections.Set<number | string> = new collections.Set<number | string>([1, '1', 2, '2']);
      const result: (number | string)[] = [];

      for (const v of mySet) {
        result.push(v);
      }

      expect(result.length).assertEqual(4);
      expect(result.includes(1)).assertEqual(true);
      expect(result.includes('1')).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_2400
     * @tc.name builtinsAsyncLockConstructorTest2400
     * @tc.desc Verify breaking for-of loop early
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsAsyncLockConstructorTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'testSetForOfCollections017';
      console.info(`${caseName}, test start`);
      const mySet: collections.Set<number> = new collections.Set<number>([1, 2, 3, 4, 5]);
      const result: number[] = [];

      for (const v of mySet) {
        if (v > 3) break;
        result.push(v);
      }

      expect(result.length).assertEqual(3);
      expect(result.includes(1)).assertEqual(true);
      expect(result.includes(2)).assertEqual(true);
      expect(result.includes(3)).assertEqual(true);
      expect(JSON.stringify(result)).assertDeepEquals(JSON.stringify([1, 2, 3]));
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_2500
     * @tc.name builtinsAsyncLockConstructorTest2500
     * @tc.desc Verify continuing in for-of loop
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsAsyncLockConstructorTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'testSetForOfCollections018';
      console.info(`${caseName}, test start`);
      const mySet: collections.Set<number> = new collections.Set<number>([1, 2, 3, 4, 5]);
      const result: number[] = [];

      for (const v of mySet) {
        if (v % 2 === 0) continue;
        result.push(v);
      }

      expect(result.length).assertEqual(3);
      expect(result.includes(1)).assertEqual(true);
      expect(result.includes(3)).assertEqual(true);
      expect(result.includes(5)).assertEqual(true);
      expect(JSON.stringify(result)).assertDeepEquals(JSON.stringify([1, 3, 5]));
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_2600
     * @tc.name builtinsAsyncLockConstructorTest2600
     * @tc.desc Verify for-of loop with Set created from array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsAsyncLockConstructorTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'testSetForOfCollections020';
      console.info(`${caseName}, test start`);
      const arr: number[] = [10, 20, 30, 20, 40];
      const mySet: collections.Set<number> = new collections.Set<number>(arr);
      const result: number[] = [];

      for (const v of mySet) {
        result.push(v);
      }

      expect(result.length).assertEqual(4);
      expect(result.includes(10)).assertEqual(true);
      expect(result.includes(20)).assertEqual(true);
      expect(result.includes(30)).assertEqual(true);
      expect(result.includes(40)).assertEqual(true);
      expect(JSON.stringify(result)).assertDeepEquals(JSON.stringify([10, 20, 30, 40]));
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_2700
     * @tc.name builtinsAsyncLockConstructorTest2700
     * @tc.desc Verify for-of loop with NaN elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsAsyncLockConstructorTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'testSetForOfCollections023';
      console.info(`${caseName}, test start`);
      const mySet: collections.Set<number> = new collections.Set<number>([NaN, NaN, 1, NaN]);
      const result: number[] = [];

      for (const v of mySet) {
        result.push(v);
      }

      expect(result.length).assertEqual(2);
      expect(Number.isNaN(result[0])).assertEqual(true);
      expect(result[1]).assertEqual(1);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_2800
     * @tc.name builtinsAsyncLockConstructorTest2800
     * @tc.desc Verify for-of loop with multiple delete operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsAsyncLockConstructorTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'testSetForOfCollections024';
      console.info(`${caseName}, test start`);
      const mySet: collections.Set<number> = new collections.Set<number>([1, 2, 3, 4, 5]);
      mySet.delete(2);
      mySet.delete(4);

      const result: number[] = [];
      for (const v of mySet) {
        result.push(v);
      }

      expect(result.length).assertEqual(3);
      expect(result.includes(1)).assertEqual(true);
      expect(result.includes(3)).assertEqual(true);
      expect(result.includes(5)).assertEqual(true);
      expect(JSON.stringify(result)).assertDeepEquals(JSON.stringify([1, 3, 5]));
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_2900
     * @tc.name builtinsAsyncLockConstructorTest2900
     * @tc.desc Verify for-of loop with empty Set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsAsyncLockConstructorTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'testSetForOfCollections026';
      console.info(`${caseName}, test start`);
      const mySet: collections.Set<number> = new collections.Set<number>();
      const result: number[] = [];

      for (const v of mySet) {
        result.push(v);
      }

      expect(result.length).assertEqual(0);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_3000
     * @tc.name builtinsAsyncLockConstructorTest3000
     * @tc.desc Verify for-of loop with Set and has() for non-existent element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsAsyncLockConstructorTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'testSetForOfCollections027';
      console.info(`${caseName}, test start`);
      const mySet: collections.Set<string> = new collections.Set<string>(['apple', 'banana']);
      const result: boolean[] = [];

      for (const v of mySet) {
        result.push(mySet.has(v + 'x'));
      }

      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual(false);
      expect(result[1]).assertEqual(false);
      expect(result).assertDeepEquals([false, false]);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_3100
     * @tc.name builtinsAsyncLockConstructorTest3100
     * @tc.desc Verify for-of loop with Set size check during iteration
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsAsyncLockConstructorTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'testSetForOfCollections029';
      console.info(`${caseName}, test start`);
      const mySet: collections.Set<number> = new collections.Set<number>([1, 2, 3]);
      const sizes: number[] = [];

      for (const v of mySet) {
        sizes.push(mySet.size);
        if (v === 2) {
          mySet.delete(3);
        }
      }

      expect(sizes.length).assertEqual(2);
      expect(sizes[0]).assertEqual(3);
      expect(sizes[1]).assertEqual(3);
      expect(JSON.stringify(sizes)).assertDeepEquals(JSON.stringify([3, 3]));
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_BUILTINS_ASYNCLOCK_CONSTRUCTOR_TEST_3200
     * @tc.name builtinsAsyncLockConstructorTest3200
     * @tc.desc Verify for-of loop with elements that are class instances
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsAsyncLockConstructorTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'testSetForOfCollections046';
      console.info(`${caseName}, test start`);
      const instance1 = new TestClass(1);
      const instance2 = new TestClass(2);
      const mySet: collections.Set<TestClass> = new collections.Set<TestClass>([instance1, instance2]);
      const result: number[] = [];

      for (const v of mySet) {
        result.push(v.id);
      }

      expect(JSON.stringify(result)).assertDeepEquals(JSON.stringify([1, 2]));
      console.info(`${caseName}, test end`);
    });
  });
}