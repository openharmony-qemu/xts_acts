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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '../../../../hypium/index';
import Utils from '../Util.test';

export default function BuiltinsArrayValuesTest(): void {
  describe("BuiltinsArrayValuesTest", () => {
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
     * @tc.name    builtinsArrayValuesTest0100
     * @tc.number  SUB_BUILTINS_ARRAY_VALUES_TEST_0100
     * @tc.desc    Verify values() - iterate over number array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsArrayValuesTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr = new Array<number>(1, 2, 3, 4, 5);

      const iterator = arr.values();
      const values: number[] = [];

      let result = iterator.next();
      while (!result.done) {
        values.push(result.value as number);
        result = iterator.next();
      }

      const expected = new Array<number>(1, 2, 3, 4, 5);
      expect(values.length).assertEqual(expected.length);
      for (let i = 0; i < values.length; i++) {
        expect(values[i]).assertEqual(expected.$_get(i));
      }
    });

    /**
     * @tc.name    builtinsArrayValuesTest0200
     * @tc.number  SUB_BUILTINS_ARRAY_VALUES_TEST_0200
     * @tc.desc    Verify values() - empty array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayValuesTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = new Array<number>();

      const iterator = arr.values();
      const result = iterator.next();

      expect(result.done).assertEqual(true);
    });

    /**
     * @tc.name    builtinsArrayValuesTest0300
     * @tc.number  SUB_BUILTINS_ARRAY_VALUES_TEST_0300
     * @tc.desc    Verify values() - single element array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayValuesTest0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = Array.of<number>(42);

      const iterator = arr.values();

      let result = iterator.next();
      expect(result.done).assertEqual(false);
      expect(result.value).assertEqual(42);

      result = iterator.next();
      expect(result.done).assertEqual(true);
    });

    /**
     * @tc.name    builtinsArrayValuesTest0400
     * @tc.number  SUB_BUILTINS_ARRAY_VALUES_TEST_0400
     * @tc.desc    Verify values() - string array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayValuesTest0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = new Array<string>("apple", "banana", "cherry");

      const iterator = arr.values();
      const values: string[] = [];

      let result = iterator.next();
      while (!result.done) {
        values.push(result.value as string);
        result = iterator.next();
      }

      const expected = new Array<string>("apple", "banana", "cherry");
      expect(values.length).assertEqual(expected.length);
      for (let i = 0; i < values.length; i++) {
        expect(values[i]).assertEqual(expected.$_get(i));
      }
    });

    /**
     * @tc.name    builtinsArrayValuesTest0500
     * @tc.number  SUB_BUILTINS_ARRAY_VALUES_TEST_0500
     * @tc.desc    Verify values() - boolean array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayValuesTest0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = new Array<boolean>(true, false, true);

      const iterator = arr.values();
      const values: boolean[] = [];

      let result = iterator.next();
      while (!result.done) {
        values.push(result.value as boolean);
        result = iterator.next();
      }

      const expected = new Array<boolean>(true, false, true);
      expect(values.length).assertEqual(expected.length);
      for (let i = 0; i < values.length; i++) {
        expect(values[i]).assertEqual(expected.$_get(i));
      }
    });

    /**
     * @tc.name    builtinsArrayValuesTest0600
     * @tc.number  SUB_BUILTINS_ARRAY_VALUES_TEST_0600
     * @tc.desc    Verify values() - using for...of loop
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayValuesTest0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = new Array<number>(10, 20, 30, 40, 50);

      const values: number[] = [];
      for (const value of arr.values()) {
        values.push(value);
      }

      const expected = new Array<number>(10, 20, 30, 40, 50);
      expect(values.length).assertEqual(expected.length);
      for (let i = 0; i < values.length; i++) {
        expect(values[i]).assertEqual(expected.$_get(i));
      }
    });

    /**
     * @tc.name    builtinsArrayValuesTest0700
     * @tc.number  SUB_BUILTINS_ARRAY_VALUES_TEST_0700
     * @tc.desc    Verify values() - multiple iterators
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayValuesTest0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = new Array<number>(1, 2, 3);

      const iterator1 = arr.values();
      const iterator2 = arr.values();

      expect(iterator1.next().value).assertEqual(1);
      expect(iterator2.next().value).assertEqual(1);
      expect(iterator1.next().value).assertEqual(2);
      expect(iterator2.next().value).assertEqual(2);
      expect(iterator1.next().value).assertEqual(3);
      expect(iterator2.next().value).assertEqual(3);
    });

    /**
     * @tc.name    builtinsArrayValuesTest0800
     * @tc.number  SUB_BUILTINS_ARRAY_VALUES_TEST_0800
     * @tc.desc    Verify values() - array with undefined elements
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayValuesTest0800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = new Array<number | undefined>(1, undefined, 3);

      const iterator = arr.values();

      expect(iterator.next().value).assertEqual(1);
      expect(iterator.next().value).assertEqual(undefined);
      expect(iterator.next().value).assertEqual(3);
      expect(iterator.next().done).assertEqual(true);
    });

    /**
     * @tc.name    builtinsArrayValuesTest0900
     * @tc.number  SUB_BUILTINS_ARRAY_VALUES_TEST_0900
     * @tc.desc    Verify values() - array with null elements
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayValuesTest0900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = new Array<number | null>(1, null, 3);

      const iterator = arr.values();

      expect(iterator.next().value).assertEqual(1);
      expect(iterator.next().value).assertEqual(null);
      expect(iterator.next().value).assertEqual(3);
      expect(iterator.next().done).assertEqual(true);
    });

    /**
     * @tc.name    builtinsArrayValuesTest1000
     * @tc.number  SUB_BUILTINS_ARRAY_VALUES_TEST_1000
     * @tc.desc    Verify values() - large array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayValuesTest1000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = new Array<number>();
      const expected: number[] = [];

      for (let i = 0; i < 100; i++) {
        arr.push(i);
        expected.push(i);
      }

      const iterator = arr.values();
      const values: number[] = [];

      let result = iterator.next();
      while (!result.done) {
        values.push(result.value as number);
        result = iterator.next();
      }

      expect(values.length).assertEqual(expected.length);
      for (let i = 0; i < values.length; i++) {
        expect(values[i]).assertEqual(expected[i]);
      }
    });
  });
}
