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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '../../../../hypium/index';
import Utils from '../Util.test';

class Person {
  name: string;
  age: number;
  constructor(name: string, age: number) {
    this.name = name;
    this.age = age;
  }
}

class Item {
  value: int;
  order: int;
  constructor(value: int, order: int) {
    this.value = value;
    this.order = order;
  }
}

export default function BuiltinsArrayToSortedTest(): void {
  describe("BuiltinsArrayToSortedTest", () => {
    beforeAll(() => {
    })
    beforeEach(async () => {
      await Utils.msSleep(100);
    })
    afterEach(() => {
    })
    afterAll(() => {
    })

    /**
     * @tc.name    builtinsArrayToSortedTest0100
     * @tc.number  SUB_BUILTINS_ARRAY_TO_SORTED_TEST_0100
     * @tc.desc    Verify toSorted without comparator - sort numbers in ascending order
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsArrayToSortedTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr = new Array<number>(3, 1, 4, 1, 5, 9, 2, 6);

      const result = arr.toSorted();
      const expected = new Array<number>(1, 1, 2, 3, 4, 5, 6, 9);

      expect(result.length).assertEqual(expected.length);
      for (let i = 0; i < result.length; i++) {
        expect(result.$_get(i)).assertEqual(expected.$_get(i));
      }
    });

    /**
     * @tc.name    builtinsArrayToSortedTest0200
     * @tc.number  SUB_BUILTINS_ARRAY_TO_SORTED_TEST_0200
     * @tc.desc    Verify toSorted without comparator - original array remains unchanged
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsArrayToSortedTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr = new Array<number>(3, 1, 4, 1, 5);
      const original = new Array<number>(3, 1, 4, 1, 5);

      const result = arr.toSorted();

      expect(arr.length).assertEqual(original.length);
      for (let i = 0; i < arr.length; i++) {
        expect(arr.$_get(i)).assertEqual(original.$_get(i));
      }
    });

    /**
     * @tc.name    builtinsArrayToSortedTest0300
     * @tc.number  SUB_BUILTINS_ARRAY_TO_SORTED_TEST_0300
     * @tc.desc    Verify toSorted without comparator - sort strings alphabetically
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayToSortedTest0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = new Array<string>("cherry", "apple", "banana", "date");

      const result = arr.toSorted();
      const expected = new Array<string>("apple", "banana", "cherry", "date");

      expect(result.length).assertEqual(expected.length);
      for (let i = 0; i < result.length; i++) {
        expect(result.$_get(i)).assertEqual(expected.$_get(i));
      }
    });

    /**
     * @tc.name    builtinsArrayToSortedTest0400
     * @tc.number  SUB_BUILTINS_ARRAY_TO_SORTED_TEST_0400
     * @tc.desc    Verify toSorted without comparator - empty array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayToSortedTest0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = new Array<number>();

      const result = arr.toSorted();

      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.name    builtinsArrayToSortedTest0500
     * @tc.number  SUB_BUILTINS_ARRAY_TO_SORTED_TEST_0500
     * @tc.desc    Verify toSorted without comparator - single element array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayToSortedTest0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = Array.of<number>(42);

      const result = arr.toSorted();

      expect(result.length).assertEqual(1);
      expect(result.$_get(0)).assertEqual(42);
    });

    /**
     * @tc.name    builtinsArrayToSortedTest0600
     * @tc.number  SUB_BUILTINS_ARRAY_TO_SORTED_TEST_0600
     * @tc.desc    Verify toSorted without comparator - already sorted array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayToSortedTest0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = new Array<number>(1, 2, 3, 4, 5);

      const result = arr.toSorted();
      const expected = new Array<number>(1, 2, 3, 4, 5);

      expect(result.length).assertEqual(expected.length);
      for (let i = 0; i < result.length; i++) {
        expect(result.$_get(i)).assertEqual(expected.$_get(i));
      }
    });

    /**
     * @tc.name    builtinsArrayToSortedTest0700
     * @tc.number  SUB_BUILTINS_ARRAY_TO_SORTED_TEST_0700
     * @tc.desc    Verify toSorted without comparator - reverse sorted array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayToSortedTest0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = new Array<number>(5, 4, 3, 2, 1);

      const result = arr.toSorted();
      const expected = new Array<number>(1, 2, 3, 4, 5);

      expect(result.length).assertEqual(expected.length);
      for (let i = 0; i < result.length; i++) {
        expect(result.$_get(i)).assertEqual(expected.$_get(i));
      }
    });

    /**
     * @tc.name    builtinsArrayToSortedTest0800
     * @tc.number  SUB_BUILTINS_ARRAY_TO_SORTED_TEST_0800
     * @tc.desc    Verify toSorted with comparator - sort numbers in descending order
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsArrayToSortedTest0800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr = new Array<number>(3, 1, 4, 1, 5, 9, 2, 6);

      const result = arr.toSorted((a: number, b: number) => {
        return (b - a).toInt();
      });
      const expected = new Array<number>(9, 6, 5, 4, 3, 2, 1, 1);

      expect(result.length).assertEqual(expected.length);
      for (let i = 0; i < result.length; i++) {
        expect(result.$_get(i)).assertEqual(expected.$_get(i));
      }
    });

    /**
     * @tc.name    builtinsArrayToSortedTest0900
     * @tc.number  SUB_BUILTINS_ARRAY_TO_SORTED_TEST_0900
     * @tc.desc    Verify toSorted with comparator - original array remains unchanged
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsArrayToSortedTest0900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr = new Array<number>(3, 1, 4, 1, 5);
      const original = new Array<number>(3, 1, 4, 1, 5);

      const result = arr.toSorted((a: number, b: number) => {
        return (a - b).toInt();
      });

      expect(arr.length).assertEqual(original.length);
      for (let i = 0; i < arr.length; i++) {
        expect(arr.$_get(i)).assertEqual(original.$_get(i));
      }
    });

    /**
     * @tc.name    builtinsArrayToSortedTest1000
     * @tc.number  SUB_BUILTINS_ARRAY_TO_SORTED_TEST_1000
     * @tc.desc    Verify toSorted with comparator - sort strings by length
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayToSortedTest1000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = new Array<string>("apple", "pie", "banana", "kiwi");

      const result = arr.toSorted((a: string, b: string) => {
        return (a.length - b.length).toInt();
      });
      const expected = new Array<string>("pie", "kiwi", "apple", "banana");

      expect(result.length).assertEqual(expected.length);
      for (let i = 0; i < result.length; i++) {
        expect(result.$_get(i)).assertEqual(expected.$_get(i));
      }
    });

    /**
     * @tc.name    builtinsArrayToSortedTest1100
     * @tc.number  SUB_BUILTINS_ARRAY_TO_SORTED_TEST_1100
     * @tc.desc    Verify toSorted with comparator - empty array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayToSortedTest1100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = new Array<number>();

      const result = arr.toSorted((a: number, b: number) => {
        return (a - b).toInt();
      });

      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.name    builtinsArrayToSortedTest1200
     * @tc.number  SUB_BUILTINS_ARRAY_TO_SORTED_TEST_1200
     * @tc.desc    Verify toSorted with comparator - single element array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayToSortedTest1200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = Array.of<number>(42);

      const result = arr.toSorted((a: number, b: number) => {
        return (a - b).toInt();
      });

      expect(result.length).assertEqual(1);
      expect(result.$_get(0)).assertEqual(42);
    });

    /**
     * @tc.name    builtinsArrayToSortedTest1300
     * @tc.number  SUB_BUILTINS_ARRAY_TO_SORTED_TEST_1300
     * @tc.desc    Verify toSorted with comparator - sort objects by property
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayToSortedTest1300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = new Array<Person>(
        new Person("Bob", 30),
        new Person("Alice", 25),
        new Person("Charlie", 35)
      );

      const result = arr.toSorted((a: Person, b: Person) => {
        return (a.age - b.age).toInt();
      });

      expect(result.length).assertEqual(3);
      expect(result.$_get(0).name).assertEqual("Alice");
      expect(result.$_get(1).name).assertEqual("Bob");
      expect(result.$_get(2).name).assertEqual("Charlie");
    });

    /**
     * @tc.name    builtinsArrayToSortedTest1400
     * @tc.number  SUB_BUILTINS_ARRAY_TO_SORTED_TEST_1400
     * @tc.desc    Verify toSorted with comparator - return value is a new array instance
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayToSortedTest1400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = new Array<number>(3, 1, 2);

      const result = arr.toSorted((a: number, b: number) => {
        return (a - b).toInt();
      });

      expect(result).not().assertEqual(arr);
    });

    /**
     * @tc.name    builtinsArrayToSortedTest1500
     * @tc.number  SUB_BUILTINS_ARRAY_TO_SORTED_TEST_1500
     * @tc.desc    Verify toSorted without comparator - return value is a new array instance
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayToSortedTest1500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = new Array<number>(3, 1, 2);

      const result = arr.toSorted();

      expect(result).not().assertEqual(arr);
    });

    /**
     * @tc.name    builtinsArrayToSortedTest1600
     * @tc.number  SUB_BUILTINS_ARRAY_TO_SORTED_TEST_1600
     * @tc.desc    Verify toSorted with comparator - array with duplicate elements
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayToSortedTest1600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = new Array<number>(5, 2, 5, 1, 2, 5);

      const result = arr.toSorted((a: number, b: number) => {
        return (a - b).toInt();
      });
      const expected = new Array<number>(1, 2, 2, 5, 5, 5);

      expect(result.length).assertEqual(expected.length);
      for (let i = 0; i < result.length; i++) {
        expect(result.$_get(i)).assertEqual(expected.$_get(i));
      }
    });

    /**
     * @tc.name    builtinsArrayToSortedTest1700
     * @tc.number  SUB_BUILTINS_ARRAY_TO_SORTED_TEST_1700
     * @tc.desc    Verify toSorted without comparator - array with negative numbers
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayToSortedTest1700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = new Array<number>(-5, 3, -10, 0, 8);

      const result = arr.toSorted();
      const expected = new Array<number>(-10, -5, 0, 3, 8);

      expect(result.length).assertEqual(expected.length);
      for (let i = 0; i < result.length; i++) {
        expect(result.$_get(i)).assertEqual(expected.$_get(i));
      }
    });

    /**
     * @tc.name    builtinsArrayToSortedTest1800
     * @tc.number  SUB_BUILTINS_ARRAY_TO_SORTED_TEST_1800
     * @tc.desc    Verify toSorted with comparator - stable sort verification
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayToSortedTest1800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = new Array<Item>(
        new Item(2, 1),
        new Item(1, 2),
        new Item(2, 3),
        new Item(1, 4)
      );

      const result = arr.toSorted((a: Item, b: Item) => {
        return (a.value - b.value).toInt();
      });

      expect(result.length).assertEqual(4);
      expect(result.$_get(0).order).assertEqual(2);
      expect(result.$_get(1).order).assertEqual(4);
      expect(result.$_get(2).order).assertEqual(1);
      expect(result.$_get(3).order).assertEqual(3);
    });
  });
}
