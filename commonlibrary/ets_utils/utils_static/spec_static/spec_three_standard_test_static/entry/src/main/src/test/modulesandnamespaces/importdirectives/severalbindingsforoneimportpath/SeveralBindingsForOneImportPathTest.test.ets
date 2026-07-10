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

export default function SeveralBindingsForOneImportPathTest(): void {
  describe('SeveralBindingsForOneImportPathTest', () => {
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
     * @tc.number    SUB_SEVERAL_BINDINGS_FOR_ONE_IMPORT_PATHTEST_0100
     * @tc.name      testSeveralBindingsForOneImportPath0001
     * @tc.desc      A name is explicitly used without alias and implicitly with alias.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testSeveralBindingsForOneImportPath0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testSeveralBindingsForOneImportPath0001';
      console.log(TAG + ' start');

      let x = sin(1.0);
      expect(x).assertEqual(0.8414709848078965);
    });

    /**
     * @tc.number    SUB_SEVERAL_BINDINGS_FOR_ONE_IMPORT_PATHTEST_0800
     * @tc.name      testSeveralBindingsForOneImportPath0008
     * @tc.desc      Several imports from one path
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testSeveralBindingsForOneImportPath0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testSeveralBindingsForOneImportPath0008';
      console.log(TAG + ' start');

      let x7 = sin(1.0);
      let y = cos(1.0);
      expect(x7).assertEqual(0.8414709848078965);
      expect(y).assertEqual(0.5403023058681398);
    });
  })
}