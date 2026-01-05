/*
* Copyright (C) 2024 HiHope Open Source Organization.
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*   http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, TestType, Size } from "@ohos/hypium";
import { SpliceBoolean, SpliceNumber, SpliceObj, SpliceString } from "../../testability/pages/DataFlg";
import { toSplicedRes } from "../../testability/pages/JsMethodTest";
import { sleep } from "../../testability/pages/Utils";
import { collections } from '@kit.ArkTS'

export default function builtinsArrayToSplicedTest() {
  describe('BuiltinsArrayToSplicedTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      await sleep(100);
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
     * @tc.name   builtinsArrayToSplicedTest1001
     * @tc.number SUB_BUILTINS_ARRAY_TOSPLICED_TEST_0100
     * @tc.desc   Test basic splice with replacement
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('builtinsArrayToSplicedTest1001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(toSplicedRes([1, 2, 3, 4, 5], 2, 2, 'a', 'b'))
        .assertDeepEquals([1, 2, 'a', 'b', 5]);
      expect(toSplicedRes([1, 2, 3, 4, 5], 2, -1, 'a', 'b'))
        .assertDeepEquals([1, 2, "a", "b", 3, 4, 5]);
    });

    /**
     * @tc.name   builtinsArrayToSplicedTest1002
     * @tc.number SUB_BUILTINS_ARRAY_TOSPLICED_TEST_0200
     * @tc.desc   Test insertion at beginning
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayToSplicedTest1002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(toSplicedRes([2, 3, 4], 0, 0, 1))
        .assertDeepEquals([1, 2, 3, 4]);
    });

    /**
     * @tc.name   builtinsArrayToSplicedTest1003
     * @tc.number SUB_BUILTINS_ARRAY_TOSPLICED_TEST_0300
     * @tc.desc   Test insertion beyond array length
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayToSplicedTest1003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(toSplicedRes([1, 2], 2, 0, 3))
        .assertDeepEquals([1, 2, 3]);
    });

    /**
     * @tc.name   builtinsArrayToSplicedTest1004
     * @tc.number SUB_BUILTINS_ARRAY_TOSPLICED_TEST_0400
     * @tc.desc   Test empty array insertion
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayToSplicedTest1004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(toSplicedRes([], 0, 0, 1))
        .assertDeepEquals([1]);
    });

    /**
     * @tc.name   builtinsArrayToSplicedTest1005
     * @tc.number SUB_BUILTINS_ARRAY_TOSPLICED_TEST_0500
     * @tc.desc   Handle sparse arrays
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayToSplicedTest1005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(toSplicedRes([1, , 3], 1, 1, 2))
        .assertDeepEquals([1, 2, 3]);
    });

    /**
     * @tc.name   builtinsArrayToSplicedTest1006
     * @tc.number SUB_BUILTINS_ARRAY_TOSPLICED_TEST_0600
     * @tc.desc   Insert undefined/null values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayToSplicedTest1006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(toSplicedRes([1, 2, 3, 4, 5], -2, 1))
        .assertDeepEquals([1, 2, 3, 5]);
      expect(toSplicedRes([1, 2, 3, 4, 5], 1, 0, undefined))
        .assertDeepEquals([1, undefined, 2, 3, 4, 5]);
      expect(toSplicedRes([1, 2, 3, 4, 5], 1, 0, null))
        .assertDeepEquals([1, null, 2, 3, 4, 5]);
    });

    /**
     * @tc.name   builtinsArrayToSplicedTest1007
     * @tc.number SUB_BUILTINS_ARRAY_TOSPLICED_TEST_0700
     * @tc.desc   Insert number
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayToSplicedTest1007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(toSplicedRes([1, 2, 3], 0, 3))
        .assertDeepEquals([]);
      expect(toSplicedRes([1, 2, 3], 1, 0, 'a', 'b'))
        .assertDeepEquals([1, 'a', 'b', 2, 3]);
    });

    /**
     * @tc.name   builtinsArrayToSplicedTest1008
     * @tc.number SUB_BUILTINS_ARRAY_TOSPLICED_TEST_0800
     * @tc.desc   Insert string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayToSplicedTest1008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(toSplicedRes([1, 2, 3], 1, 0, 'a', 'b'))
        .assertDeepEquals([1, 'a', 'b', 2, 3]);
    });
  });
}