'use static'
/*
* Copyright (c) 2021-2026 Huawei Device Co., Ltd.
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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium-binary/src/main/indexStatic';
import Utils from '../../../Util.test'

function sin(x: number): number {
  return Math.sin(x);
}
function cos(x: number): number {
  return Math.cos(x);
}
const PI = Math.PI;

const Sine = sin;
const PNumber = Math.PI;

export default function SelectiveBindingTest(): void {
  describe('SelectiveBindingTest', () => {
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
     * @tc.number    SUB_SELECTIVE_ONE_BINDINGTEST_0100
     * @tc.name      testSelectiveBinding0001
     * @tc.desc      Import simple name
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testSelectiveBinding0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testSelectiveBinding0001';
      console.log(TAG + ' start');
      let x = sin(1.0);
      expect(x).assertEqual(0.8414709848078965);
    });

    /**
     * @tc.number    SUB_SELECTIVE_ONE_BINDINGTEST_0200
     * @tc.name      testSelectiveBinding0002
     * @tc.desc      import simple name as Name
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testSelectiveBinding0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testSelectiveBinding0002';
      let x = Sine(1.0);
      expect(x).assertEqual(0.8414709848078965);
    });

    /**
     * @tc.number    SUB_SELECTIVE_ONE_BINDINGTEST_0300
     * @tc.name      testSelectiveBinding0003
     * @tc.desc      import multiple simple names
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testSelectiveBinding0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testSelectiveBinding0003';
      console.log(TAG + ' start');
      let x = sin(PI);
      expect(x).assertEqual(1.2246467991473532e-16);
    });

    /**
     * @tc.number    SUB_SELECTIVE_ONE_BINDINGTEST_0400
     * @tc.name      testSelectiveBinding0004
     * @tc.desc      import multiple simple names
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testSelectiveBinding0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testSelectiveBinding0004';
      console.log(TAG + ' start');
      let x = sin(PI);
      expect(x).assertEqual(1.2246467991473532e-16);
    });

    /**
     * @tc.number    SUB_SELECTIVE_ONE_BINDINGTEST_0500
     * @tc.name      testSelectiveBinding0005
     * @tc.desc      import multiple simple names with as
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testSelectiveBinding0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testSelectiveBinding0005';
      console.log(TAG + ' start');
      let x = Sine(PNumber);
      expect(x).assertEqual(1.2246467991473532e-16);
    });
  })
}