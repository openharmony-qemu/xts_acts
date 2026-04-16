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

export default function BuiltinsArrayEntriesTest(): void {
  describe("BuiltinsArrayEntriesTest", () => {
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
     * @tc.name    builtinsArrayEntriesTest0100
     * @tc.number  SUB_BUILTINS_ARRAY_ENTRIES_TEST_0100
     * @tc.desc    Verify entries() - basic functionality with number array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsArrayEntriesTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr = new Array<number>(1, 2, 3, 4, 5);
      const iterator = arr.entries();

      const expected = [[0, 1], [1, 2], [2, 3], [3, 4], [4, 5]];
      let result: [number, number][] = [];

      let next = iterator.next();
      while (!next.done) {
        result.push(next.value as [number, number]);
        next = iterator.next();
      }

      expect(result.length).assertEqual(expected.length);
      for (let i = 0; i < result.length; i++) {
        expect(result[i][0]).assertEqual(expected[i][0]);
        expect(result[i][1]).assertEqual(expected[i][1]);
      }
    });

    /**
     * @tc.name    builtinsArrayEntriesTest0200
     * @tc.number  SUB_BUILTINS_ARRAY_ENTRIES_TEST_0200
     * @tc.desc    Verify entries() - empty array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsArrayEntriesTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr = new Array<number>();
      const iterator = arr.entries();

      const next = iterator.next();
      expect(next.done).assertEqual(true);
      expect(next.value).assertEqual(undefined);
    });

    /**
     * @tc.name    builtinsArrayEntriesTest0300
     * @tc.number  SUB_BUILTINS_ARRAY_ENTRIES_TEST_0300
     * @tc.desc    Verify entries() - single element array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsArrayEntriesTest0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr = Array.of<number>(42);
      const iterator = arr.entries();

      const first = iterator.next();
      expect(first.done).assertEqual(false);
      expect((first.value as [number, number])[0]).assertEqual(0);
      expect((first.value as [number, number])[1]).assertEqual(42);

      const second = iterator.next();
      expect(second.done).assertEqual(true);
    });

    /**
     * @tc.name    builtinsArrayEntriesTest0400
     * @tc.number  SUB_BUILTINS_ARRAY_ENTRIES_TEST_0400
     * @tc.desc    Verify entries() - using for...of loop
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayEntriesTest0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = new Array<string>("apple", "banana", "cherry");
      const iterator = arr.entries();

      const expected = [[0, "apple"], [1, "banana"], [2, "cherry"]];
      let result: [number, string][] = [];

      for (let entry of iterator) {
        result.push(entry);
      }

      expect(result.length).assertEqual(expected.length);
      for (let i = 0; i < result.length; i++) {
        expect(result[i][0]).assertEqual(expected[i][0]);
        expect(result[i][1]).assertEqual(expected[i][1]);
      }
    });

    /**
     * @tc.name    builtinsArrayEntriesTest0500
     * @tc.number  SUB_BUILTINS_ARRAY_ENTRIES_TEST_0500
     * @tc.desc    Verify entries() - boolean array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayEntriesTest0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = new Array<boolean>(true, false, true);
      const iterator = arr.entries();

      const expected = [[0, true], [1, false], [2, true]];
      let result: [number, boolean][] = [];

      let next = iterator.next();
      while (!next.done) {
        result.push(next.value as [number, boolean]);
        next = iterator.next();
      }

      expect(result.length).assertEqual(expected.length);
      for (let i = 0; i < result.length; i++) {
        expect(result[i][0]).assertEqual(expected[i][0]);
        expect(result[i][1]).assertEqual(expected[i][1]);
      }
    });

    /**
     * @tc.name    builtinsArrayEntriesTest0600
     * @tc.number  SUB_BUILTINS_ARRAY_ENTRIES_TEST_0600
     * @tc.desc    Verify entries() - iterator's $_iterator method
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayEntriesTest0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = new Array<number>(1, 2, 3);
      const iterator = arr.entries();
      const selfIterator = iterator.$_iterator();

      expect(selfIterator).assertEqual(iterator);

      const first = selfIterator.next();
      expect(first.done).assertEqual(false);
      expect((first.value as [number, number])[0]).assertEqual(0);
      expect((first.value as [number, number])[1]).assertEqual(1);
    });

    /**
     * @tc.name    builtinsArrayEntriesTest0700
     * @tc.number  SUB_BUILTINS_ARRAY_ENTRIES_TEST_0700
     * @tc.desc    Verify entries() - multiple calls to next() beyond array length
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayEntriesTest0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = new Array<number>(1, 2);
      const iterator = arr.entries();

      // First element
      const first = iterator.next();
      expect(first.done).assertEqual(false);
      expect((first.value as [number, number])[0]).assertEqual(0);
      expect((first.value as [number, number])[1]).assertEqual(1);

      // Second element
      const second = iterator.next();
      expect(second.done).assertEqual(false);
      expect((second.value as [number, number])[0]).assertEqual(1);
      expect((second.value as [number, number])[1]).assertEqual(2);

      // Beyond array length
      const third = iterator.next();
      expect(third.done).assertEqual(true);

      // Subsequent calls should still return done: true
      const fourth = iterator.next();
      expect(fourth.done).assertEqual(true);
    });
  });
}