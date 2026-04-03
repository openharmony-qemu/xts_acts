/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

interface TestObj {
  name: string;
  value: number;
}

export default function BuiltinsArraySetTest() {
  describe("BuiltinsArraySetTest", () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      await Utils.msSleep(100);
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
     * @tc.name    builtinsArraySetTest0100
     * @tc.number  SUB_BUILTINS_ARRAY_SET_TEST_0100
     * @tc.desc    Verify $_set with index 0 (first element) and number value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsArraySetTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr = new Array<number>(10, 20, 30, 40, 50);
      const idx = 0;
      const val = 100;

      arr[idx] = val;

      expect(arr[idx]).assertEqual(val);
    });

    /**
     * @tc.name    builtinsArraySetTest0200
     * @tc.number  SUB_BUILTINS_ARRAY_SET_TEST_0200
     * @tc.desc    Verify $_set with index (length - 1) (last element)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArraySetTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = new Array<number>(10, 20, 30, 40, 50);
      const idx = arr.length - 1;
      const val = 500;

      arr[idx] = val;

      expect(arr[idx]).assertEqual(val);
    });

    /**
     * @tc.name    builtinsArraySetTest0300
     * @tc.number  SUB_BUILTINS_ARRAY_SET_TEST_0300
     * @tc.desc    Verify $_set with index 1
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArraySetTest0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = new Array<number>(10, 20, 30, 40, 50);
      const idx = 1;
      const val = 200;

      arr[idx] = val;

      expect(arr[idx]).assertEqual(val);
    });

    /**
     * @tc.name    builtinsArraySetTest0400
     * @tc.number  SUB_BUILTINS_ARRAY_SET_TEST_0400
     * @tc.desc    Verify $_set with index 2
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArraySetTest0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = new Array<number>(10, 20, 30, 40, 50);
      const idx = 2;
      const val = 300;

      arr[idx] = val;

      expect(arr[idx]).assertEqual(val);
    });

    /**
     * @tc.name    builtinsArraySetTest0500
     * @tc.number  SUB_BUILTINS_ARRAY_SET_TEST_0500
     * @tc.desc    Verify $_set with index 3
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArraySetTest0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = new Array<number>(10, 20, 30, 40, 50);
      const idx = 3;
      const val = 400;

      arr[idx] = val;

      expect(arr[idx]).assertEqual(val);
    });

    /**
     * @tc.name    builtinsArraySetTest0600
     * @tc.number  SUB_BUILTINS_ARRAY_SET_TEST_0600
     * @tc.desc    Verify $_set with index 4
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArraySetTest0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = new Array<number>(10, 20, 30, 40, 50);
      const idx = 4;
      const val = 500;

      arr[idx] = val;

      expect(arr[idx]).assertEqual(val);
    });

    /**
     * @tc.name    builtinsArraySetTest0700
     * @tc.number  SUB_BUILTINS_ARRAY_SET_TEST_0700
     * @tc.desc    Verify $_set with string type array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArraySetTest0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = new Array<string>("a", "b", "c", "d", "e");
      const idx = 2;
      const val = "xyz";

      arr[idx] = val;

      expect(arr[idx]).assertEqual(val);
    });

    /**
     * @tc.name    builtinsArraySetTest0800
     * @tc.number  SUB_BUILTINS_ARRAY_SET_TEST_0800
     * @tc.desc    Verify $_set with boolean type array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArraySetTest0800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = new Array<boolean>(true, false, true, false, true);
      const idx = 1;
      const val = true;

      arr[idx] = val;

      expect(arr[idx]).assertEqual(val);
    });

    /**
     * @tc.name    builtinsArraySetTest0900
     * @tc.number  SUB_BUILTINS_ARRAY_SET_TEST_0900
     * @tc.desc    Verify $_set with object type array using push
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArraySetTest0900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = new Array<TestObj>();
      const val: TestObj = { name: "test", value: 100 };

      arr.pushOne(val);

      expect(arr[0]).assertEqual(val);
    });

    /**
     * @tc.name    builtinsArraySetTest1000
     * @tc.number  SUB_BUILTINS_ARRAY_SET_TEST_1000
     * @tc.desc    Verify $_set with index after extendTo operation
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('builtinsArraySetTest1000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new Array<number>(1, 2, 3);
      const idx = arr.length;
      const val = 100;

      arr.extendTo(idx + 1, 0);
      arr[idx] = val;

      expect(arr.length).assertEqual(4);
      expect(arr[idx]).assertEqual(val);
    });

    /**
     * @tc.name    builtinsArraySetTest1100
     * @tc.number  SUB_BUILTINS_ARRAY_SET_TEST_1100
     * @tc.desc    Verify $_set with index after extendTo operation (large index)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('builtinsArraySetTest1100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new Array<number>(1, 2, 3);
      const idx = 10;
      const val = 100;

      arr.extendTo(idx + 1, 0);
      arr[idx] = val;

      expect(arr.length).assertEqual(11);
      expect(arr[idx]).assertEqual(val);
      expect(arr[5]).assertEqual(0);
    });

    /**
     * @tc.name    builtinsArraySetTest1200
     * @tc.number  SUB_BUILTINS_ARRAY_SET_TEST_1200
     * @tc.desc    Verify $_set with large array (10000 elements)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('builtinsArraySetTest1200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new Array<number>(10000);
      const idx = 5000;
      const val = 9999;

      arr[idx] = val;

      expect(arr[idx]).assertEqual(val);
    });

    /**
     * @tc.name    builtinsArraySetTest1300
     * @tc.number  SUB_BUILTINS_ARRAY_SET_TEST_1300
     * @tc.desc    Verify $_set with multiple values in sequence
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArraySetTest1300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = new Array<number>(5);

      for (let i = 0; i < 5; i++) {
        arr[i] = i * 10;
      }

      expect(arr[0]).assertEqual(0);
      expect(arr[1]).assertEqual(10);
      expect(arr[2]).assertEqual(20);
      expect(arr[3]).assertEqual(30);
      expect(arr[4]).assertEqual(40);
    });

    /**
     * @tc.name    builtinsArraySetTest1400
     * @tc.number  SUB_BUILTINS_ARRAY_SET_TEST_1400
     * @tc.desc    Verify $_set with negative values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArraySetTest1400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = new Array<number>(5);
      const idx = 2;
      const val = -100;

      arr[idx] = val;

      expect(arr[idx]).assertEqual(val);
    });

    /**
     * @tc.name    builtinsArraySetTest1500
     * @tc.number  SUB_BUILTINS_ARRAY_SET_TEST_1500
     * @tc.desc    Verify $_set with maximum int value 2147483647
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('builtinsArraySetTest1500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new Array<number>(5);
      const idx = 2;
      const val = 2147483647;

      arr[idx] = val;

      expect(arr[idx]).assertEqual(val);
    });

    /**
     * @tc.name    builtinsArraySetTest1600
     * @tc.number  SUB_BUILTINS_ARRAY_SET_TEST_1600
     * @tc.desc    Verify $_set with minimum int value -2147483648
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('builtinsArraySetTest1600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new Array<number>(5);
      const idx = 2;
      const val = -2147483648;

      arr[idx] = val;

      expect(arr[idx]).assertEqual(val);
    });

    /**
     * @tc.name    builtinsArraySetTest1700
     * @tc.number  SUB_BUILTINS_ARRAY_SET_TEST_1700
     * @tc.desc    Verify $_set with floating point values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArraySetTest1700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = new Array<number>(5);
      const idx = 2;
      const val = 3.14159;

      arr[idx] = val;

      expect(arr[idx]).assertEqual(val);
    });

    /**
     * @tc.name    builtinsArraySetTest1800
     * @tc.number  SUB_BUILTINS_ARRAY_SET_TEST_1800
     * @tc.desc    Verify $_set with index 2147483647 (int max boundary, should cause error)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('builtinsArraySetTest1800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new Array<number>(1, 2, 3);
      const idx = 2147483647;
      const val = 100;
      let errorThrown = false;

      try {
        arr[idx] = val;
      } catch (e) {
        errorThrown = true;
      }

      expect(errorThrown).assertTrue();
    });

    /**
     * @tc.name    builtinsArraySetTest1900
     * @tc.number  SUB_BUILTINS_ARRAY_SET_TEST_1900
     * @tc.desc    Verify $_set with index 0 on empty array using push
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArraySetTest1900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = new Array<number>();
      const val = 100;

      arr.pushOne(val);

      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(val);
    });
  })
}