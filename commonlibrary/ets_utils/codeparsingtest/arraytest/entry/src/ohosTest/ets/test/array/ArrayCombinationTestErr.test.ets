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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size} from '@ohos/hypium';
function sleep(time: number) {
  return new Promise<void>((resolve) => setTimeout(resolve, time));
}

export default function ArrayConstructorTestErr() {
  describe('ArrayConstructorTestErr', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      await sleep(20);
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
     * @tc.number BUILTINS_ARRAY1_COMBINATION_TEST4900
     * @tc.name ArrayConstructor1Test049
     * @tc.desc Test Method Combination in Array/TypedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ArrayConstructor1Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const d1 = new Date('2020-01-01');
      const d2 = new Date('2021-01-01');
      const arr = [d1, d2];
      const r1 = arr.map(x => x).reverse();
      expect(r1[0]).assertDeepEquals("2021-01-01T00:00:00.000Z");
      expect(r1[1]).assertDeepEquals("2020-01-01T00:00:00.000Z");
      const typedArr = new Float64Array([d1.getTime(), d2.getTime()]);
      const r2 = Array.from(typedArr.map(x => x)).reverse();
      expect(r2).assertDeepEquals([d2.getTime(), d1.getTime()]);
    });

    /**
     * @tc.number BUILTINS_ARRAY1_COMBINATION_TEST14200
     * @tc.name ArrayConstructor1Test142
     * @tc.desc Test Method Combination in Array/TypedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ArrayConstructor1Test142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const d1 = new Date('2020-01-01');
      const d2 = new Date('2021-01-01');
      const arr = [d1, d2];
      const r = arr.map(x => x).reverse();
      expect(r[0]).assertDeepEquals("2021-01-01T00:00:00.000Z");
      expect(r[1]).assertDeepEquals("2020-01-01T00:00:00.000Z");
    });

  });
}