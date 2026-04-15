/*---
 * Copyright (c) 2026 SwanLink (Jiangsu) Technology Development Co., LTD.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import {
  afterAll,
  afterEach,
  beforeAll,
  beforeEach,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType
} from '../../../../../../hypium';

async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}

export default function ExpressionsAdditiveOperatorsOneTest() {
  describe("ExpressionsAdditiveOperatorsOneTest", () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
      await sleep(30);
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
     * @tc.number    SUB_EXPRESSIONS_ADDITIVE_OPERATORS_ONE_0100
     * @tc.name      testExpressionsAdditiveOperatorsOne0001
     * @tc.desc      Additive operators for numeric types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsAdditiveOperatorsOne0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: double = Double.NaN;
      let y: double = 1.0;
      expect(Double.isNaN(x + y)).assertTrue()
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_ADDITIVE_OPERATORS_ONE_0200
     * @tc.name      testExpressionsAdditiveOperatorsOne0002
     * @tc.desc      Additive operators for numeric types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsAdditiveOperatorsOne0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: double = Double.NEGATIVE_INFINITY;
      let y: double = Double.POSITIVE_INFINITY;
      expect(Double.isNaN(x + y)).assertTrue()
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_ADDITIVE_OPERATORS_ONE_0300
     * @tc.name      testExpressionsAdditiveOperatorsOne0003
     * @tc.desc      Additive operators for numeric types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsAdditiveOperatorsOne0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: double = Double.POSITIVE_INFINITY;
      let y: double = Double.NEGATIVE_INFINITY;
      expect(Double.isNaN(x + y)).assertTrue()
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_ADDITIVE_OPERATORS_ONE_0400
     * @tc.name      testExpressionsAdditiveOperatorsOne0004
     * @tc.desc      Additive operators for numeric types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsAdditiveOperatorsOne0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: double = Double.NaN;
      let y: double = Double.NEGATIVE_INFINITY;
      expect(Double.isNaN(x + y)).assertTrue()
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_ADDITIVE_OPERATORS_ONE_0500
     * @tc.name      testExpressionsAdditiveOperatorsOne0005
     * @tc.desc      Additive operators for numeric types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsAdditiveOperatorsOne0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: double = Double.NEGATIVE_INFINITY;
      let y: double = Double.NaN;
      expect(Double.isNaN(x + y)).assertTrue()
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_ADDITIVE_OPERATORS_ONE_0600
     * @tc.name      testExpressionsAdditiveOperatorsOne0006
     * @tc.desc      Additive operators for numeric types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsAdditiveOperatorsOne0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: double = Double.NaN;
      let y: double = Double.POSITIVE_INFINITY;
      expect(Double.isNaN(x + y)).assertTrue()
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_ADDITIVE_OPERATORS_ONE_0700
     * @tc.name      testExpressionsAdditiveOperatorsOne0007
     * @tc.desc      Additive operators for numeric types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsAdditiveOperatorsOne0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: double = Double.POSITIVE_INFINITY;
      let y: double = Double.NaN;
      expect(Double.isNaN(x + y)).assertTrue()
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_ADDITIVE_OPERATORS_ONE_0800
     * @tc.name      testExpressionsAdditiveOperatorsOne0008
     * @tc.desc      Additive operators for numeric types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsAdditiveOperatorsOne0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: double = Double.NEGATIVE_INFINITY;
      let y: double = Double.POSITIVE_INFINITY;
      expect(Double.isNaN(x + y)).assertTrue()
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_ADDITIVE_OPERATORS_ONE_0900
     * @tc.name      testExpressionsAdditiveOperatorsOne0009
     * @tc.desc      Additive operators for numeric types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsAdditiveOperatorsOne0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: double = Double.POSITIVE_INFINITY;
      let y: double = Double.NEGATIVE_INFINITY;
      expect(Double.isNaN(x + y)).assertTrue()
    })

  })
}
