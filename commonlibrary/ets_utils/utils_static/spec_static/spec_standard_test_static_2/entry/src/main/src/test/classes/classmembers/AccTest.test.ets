'use static'
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
  expect,
  describe,
  beforeAll,
  beforeEach,
  afterEach,
  afterAll,
  it,
  TestType,
  Size,
  Level
} from '@ohos/hypium-binary/src/main/indexStatic';
import Utils from '../../Util.test'
import { A } from './file_A.ets'
import { B } from './file_B2.ets'
import { B1 } from './file_B.ets'




export default function AccTest():void {
  describe('AccTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
      await Utils.msSleep(30);
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
     * @tc.number    SUB_ACC_ONE_TEST_0100
     * @tc.name      testAcc0001
     * @tc.desc      Class members declared internal are accessible within the package the current class resides in.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAcc0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      // separate module, positive case with public accessor
      let a = new A
      a.foo = 42
      expect(a.foo).assertEqual(42)
    });

    /**
     * @tc.number    SUB_ACC_ONE_TEST_0200
     * @tc.name      testAcc0002
     * @tc.desc      Class members declared internal are accessible within the package the current class resides in.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAcc0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b = new B
      b.foo = 42
      expect(b.foo).assertEqual(44)
    });

    /**
     * @tc.number    SUB_ACC_ONE_TEST_0300
     * @tc.name      testAcc0003
     * @tc.desc      Class members declared internal are accessible within the package the current class resides in.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAcc0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b = new B1
      b.foo = 42
      expect(b.foo).assertEqual(44)
    });
  })
}
