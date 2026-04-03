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

export default function BuiltinsArrayReverseTest(): void {
  describe("BuiltinsArrayReverseTest", () => {
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
     * @tc.name    builtinsArrayReverseTest0100
     * @tc.number  SUB_BUILTINS_ARRAY_REVERSE_TEST_0100
     * @tc.desc    Verify reverse() - reverse array in place with multiple elements
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsArrayReverseTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr = new Array<number>(1, 2, 3, 4, 5);

      const result = arr.reverse();
      const expected = new Array<number>(5, 4, 3, 2, 1);

      expect(result.length).assertEqual(expected.length);
      for (let i = 0; i < result.length; i++) {
        expect(result.$_get(i)).assertEqual(expected.$_get(i));
      }
    });

    /**
     * @tc.name    builtinsArrayReverseTest0200
     * @tc.number  SUB_BUILTINS_ARRAY_REVERSE_TEST_0200
     * @tc.desc    Verify reverse() - returns the same array instance
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsArrayReverseTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr = new Array<number>(1, 2, 3);

      const result = arr.reverse();

      expect(result).assertEqual(arr);
    });

    /**
     * @tc.name    builtinsArrayReverseTest0300
     * @tc.number  SUB_BUILTINS_ARRAY_REVERSE_TEST_0300
     * @tc.desc    Verify reverse() - empty array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayReverseTest0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = new Array<number>();

      const result = arr.reverse();

      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.name    builtinsArrayReverseTest0400
     * @tc.number  SUB_BUILTINS_ARRAY_REVERSE_TEST_0400
     * @tc.desc    Verify reverse() - single element array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayReverseTest0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = Array.of<number>(42);

      const result = arr.reverse();

      expect(result.length).assertEqual(1);
      expect(result.$_get(0)).assertEqual(42);
    });

    /**
     * @tc.name    builtinsArrayReverseTest0500
     * @tc.number  SUB_BUILTINS_ARRAY_REVERSE_TEST_0500
     * @tc.desc    Verify reverse() - two elements array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayReverseTest0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = new Array<number>(1, 2);

      const result = arr.reverse();
      const expected = new Array<number>(2, 1);

      expect(result.length).assertEqual(expected.length);
      for (let i = 0; i < result.length; i++) {
        expect(result.$_get(i)).assertEqual(expected.$_get(i));
      }
    });

    /**
     * @tc.name    builtinsArrayReverseTest0600
     * @tc.number  SUB_BUILTINS_ARRAY_REVERSE_TEST_0600
     * @tc.desc    Verify reverse() - array with duplicate elements
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayReverseTest0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = new Array<number>(1, 2, 2, 3, 3, 3);

      const result = arr.reverse();
      const expected = new Array<number>(3, 3, 3, 2, 2, 1);

      expect(result.length).assertEqual(expected.length);
      for (let i = 0; i < result.length; i++) {
        expect(result.$_get(i)).assertEqual(expected.$_get(i));
      }
    });

    /**
     * @tc.name    builtinsArrayReverseTest0700
     * @tc.number  SUB_BUILTINS_ARRAY_REVERSE_TEST_0700
     * @tc.desc    Verify reverse() - string array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayReverseTest0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = new Array<string>("apple", "banana", "cherry");

      const result = arr.reverse();
      const expected = new Array<string>("cherry", "banana", "apple");

      expect(result.length).assertEqual(expected.length);
      for (let i = 0; i < result.length; i++) {
        expect(result.$_get(i)).assertEqual(expected.$_get(i));
      }
    });

    /**
     * @tc.name    builtinsArrayReverseTest0800
     * @tc.number  SUB_BUILTINS_ARRAY_REVERSE_TEST_0800
     * @tc.desc    Verify reverse() - array with negative numbers
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayReverseTest0800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = new Array<number>(-3, -2, -1, 0, 1, 2);

      const result = arr.reverse();
      const expected = new Array<number>(2, 1, 0, -1, -2, -3);

      expect(result.length).assertEqual(expected.length);
      for (let i = 0; i < result.length; i++) {
        expect(result.$_get(i)).assertEqual(expected.$_get(i));
      }
    });

    /**
     * @tc.name    builtinsArrayReverseTest0900
     * @tc.number  SUB_BUILTINS_ARRAY_REVERSE_TEST_0900
     * @tc.desc    Verify reverse() - reverse twice returns original order
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayReverseTest0900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = new Array<number>(1, 2, 3, 4, 5);
      const original = new Array<number>(1, 2, 3, 4, 5);

      arr.reverse();
      arr.reverse();

      expect(arr.length).assertEqual(original.length);
      for (let i = 0; i < arr.length; i++) {
        expect(arr.$_get(i)).assertEqual(original.$_get(i));
      }
    });

    /**
     * @tc.name    builtinsArrayReverseTest1000
     * @tc.number  SUB_BUILTINS_ARRAY_REVERSE_TEST_1000
     * @tc.desc    Verify toReversed() - returns new reversed array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsArrayReverseTest1000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr = new Array<number>(1, 2, 3, 4, 5);

      const result = arr.toReversed();
      const expected = new Array<number>(5, 4, 3, 2, 1);

      expect(result.length).assertEqual(expected.length);
      for (let i = 0; i < result.length; i++) {
        expect(result.$_get(i)).assertEqual(expected.$_get(i));
      }
    });

    /**
     * @tc.name    builtinsArrayReverseTest1100
     * @tc.number  SUB_BUILTINS_ARRAY_REVERSE_TEST_1100
     * @tc.desc    Verify toReversed() - original array remains unchanged
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsArrayReverseTest1100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr = new Array<number>(1, 2, 3, 4, 5);
      const original = new Array<number>(1, 2, 3, 4, 5);

      const result = arr.toReversed();

      expect(arr.length).assertEqual(original.length);
      for (let i = 0; i < arr.length; i++) {
        expect(arr.$_get(i)).assertEqual(original.$_get(i));
      }
    });

    /**
     * @tc.name    builtinsArrayReverseTest1200
     * @tc.number  SUB_BUILTINS_ARRAY_REVERSE_TEST_1200
     * @tc.desc    Verify toReversed() - returns new array instance
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsArrayReverseTest1200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr = new Array<number>(1, 2, 3);

      const result = arr.toReversed();

      expect(result).not().assertEqual(arr);
    });

    /**
     * @tc.name    builtinsArrayReverseTest1300
     * @tc.number  SUB_BUILTINS_ARRAY_REVERSE_TEST_1300
     * @tc.desc    Verify toReversed() - empty array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayReverseTest1300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = new Array<number>();

      const result = arr.toReversed();

      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.name    builtinsArrayReverseTest1400
     * @tc.number  SUB_BUILTINS_ARRAY_REVERSE_TEST_1400
     * @tc.desc    Verify toReversed() - single element array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayReverseTest1400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = Array.of<number>(42);

      const result = arr.toReversed();

      expect(result.length).assertEqual(1);
      expect(result.$_get(0)).assertEqual(42);
    });

    /**
     * @tc.name    builtinsArrayReverseTest1500
     * @tc.number  SUB_BUILTINS_ARRAY_REVERSE_TEST_1500
     * @tc.desc    Verify toReversed() - two elements array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayReverseTest1500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = new Array<number>(1, 2);

      const result = arr.toReversed();
      const expected = new Array<number>(2, 1);

      expect(result.length).assertEqual(expected.length);
      for (let i = 0; i < result.length; i++) {
        expect(result.$_get(i)).assertEqual(expected.$_get(i));
      }
    });

    /**
     * @tc.name    builtinsArrayReverseTest1600
     * @tc.number  SUB_BUILTINS_ARRAY_REVERSE_TEST_1600
     * @tc.desc    Verify toReversed() - string array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayReverseTest1600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = new Array<string>("apple", "banana", "cherry");

      const result = arr.toReversed();
      const expected = new Array<string>("cherry", "banana", "apple");

      expect(result.length).assertEqual(expected.length);
      for (let i = 0; i < result.length; i++) {
        expect(result.$_get(i)).assertEqual(expected.$_get(i));
      }
    });

    /**
     * @tc.name    builtinsArrayReverseTest1700
     * @tc.number  SUB_BUILTINS_ARRAY_REVERSE_TEST_1700
     * @tc.desc    Verify toReversed() - array with duplicate elements
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayReverseTest1700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = new Array<number>(1, 2, 2, 3);

      const result = arr.toReversed();
      const expected = new Array<number>(3, 2, 2, 1);

      expect(result.length).assertEqual(expected.length);
      for (let i = 0; i < result.length; i++) {
        expect(result.$_get(i)).assertEqual(expected.$_get(i));
      }
    });

    /**
     * @tc.name    builtinsArrayReverseTest1800
     * @tc.number  SUB_BUILTINS_ARRAY_REVERSE_TEST_1800
     * @tc.desc    Verify toReversed() called twice returns original order
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayReverseTest1800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = new Array<number>(1, 2, 3, 4, 5);
      const original = new Array<number>(1, 2, 3, 4, 5);

      const result = arr.toReversed().toReversed();

      expect(result.length).assertEqual(original.length);
      for (let i = 0; i < result.length; i++) {
        expect(result.$_get(i)).assertEqual(original.$_get(i));
      }
    });

    /**
     * @tc.name    builtinsArrayReverseTest1900
     * @tc.number  SUB_BUILTINS_ARRAY_REVERSE_TEST_1900
     * @tc.desc    Verify reverse() then toReversed() combination
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayReverseTest1900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = new Array<number>(1, 2, 3);
      const original = new Array<number>(1, 2, 3);

      arr.reverse();
      const result = arr.toReversed();
      const expected = new Array<number>(1, 2, 3);

      expect(result.length).assertEqual(expected.length);
      for (let i = 0; i < result.length; i++) {
        expect(result.$_get(i)).assertEqual(expected.$_get(i));
      }
      expect(arr.$_get(0)).assertEqual(3);
    });

    /**
     * @tc.name    builtinsArrayReverseTest2000
     * @tc.number  SUB_BUILTINS_ARRAY_REVERSE_TEST_2000
     * @tc.desc    Verify toReversed() then reverse() combination
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayReverseTest2000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = new Array<number>(1, 2, 3);

      const reversed = arr.toReversed();
      reversed.reverse();
      const expected = new Array<number>(1, 2, 3);

      expect(reversed.length).assertEqual(expected.length);
      for (let i = 0; i < reversed.length; i++) {
        expect(reversed.$_get(i)).assertEqual(expected.$_get(i));
      }
      expect(arr.$_get(0)).assertEqual(1);
    });
  });
}
