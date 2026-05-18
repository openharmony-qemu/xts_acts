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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '../../../../../../hypium/index';

function sin(x: number): number {
  return Math.sin(x);
}
function cos(x: number): number {
  return Math.cos(x);
}

async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
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
     * @tc.number    SUB_SEVERAL_BINDINGS_FOR_ONE_IMPORT_PATHTEST_0200
     * @tc.name      testSeveralBindingsForOneImportPath0002
     * @tc.desc      A name is explicitly used with alias and implicitly without alias. Sine is accessible
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testSeveralBindingsForOneImportPath0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testSeveralBindingsForOneImportPath0002';
      console.log(TAG + ' start');

      let x1 = sin(1.0);
      expect(x1).assertEqual(0.8414709848078965);
    });

    /**
     * @tc.number    SUB_SEVERAL_BINDINGS_FOR_ONE_IMPORT_PATHTEST_0300
     * @tc.name      testSeveralBindingsForOneImportPath0003
     * @tc.desc      A name is explicitly used with alias and implicitly without alias. sin is not accessible
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testSeveralBindingsForOneImportPath0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testSeveralBindingsForOneImportPath0003';
      console.log(TAG + ' start');
      let x2 = sin(1.0);
      expect(x2).assertEqual(0.8414709848078965);
    });

    /**
     * @tc.number    SUB_SEVERAL_BINDINGS_FOR_ONE_IMPORT_PATHTEST_0400
     * @tc.name      testSeveralBindingsForOneImportPath0004
     * @tc.desc      A name is explicitly used with alias and implicitly with alias.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testSeveralBindingsForOneImportPath0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testSeveralBindingsForOneImportPath0004';
      console.log(TAG + ' start');

      let x3 = sin(1.0);
      expect(x3).assertEqual(0.8414709848078965);
    });

    /**
     * @tc.number    SUB_SEVERAL_BINDINGS_FOR_ONE_IMPORT_PATHTEST_0500
     * @tc.name      testSeveralBindingsForOneImportPath0005
     * @tc.desc      A name is explicitly used with alias several times.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testSeveralBindingsForOneImportPath0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testSeveralBindingsForOneImportPath0005';
      console.log(TAG + ' start');

      let x4 = sin(1.0);
      expect(x4).assertEqual(0.8414709848078965);
    });

    /**
     * @tc.number    SUB_SEVERAL_BINDINGS_FOR_ONE_IMPORT_PATHTEST_0600
     * @tc.name      testSeveralBindingsForOneImportPath0006
     * @tc.desc      A name is explicitly used with alias and implicitly without alias. Sine is accessible
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testSeveralBindingsForOneImportPath0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testSeveralBindingsForOneImportPath0006';
      console.log(TAG + ' start');

      let x5 = sin(1.0);
      expect(x5).assertEqual(0.8414709848078965);
    });

    /**
     * @tc.number    SUB_SEVERAL_BINDINGS_FOR_ONE_IMPORT_PATHTEST_0700
     * @tc.name      testSeveralBindingsForOneImportPath0007
     * @tc.desc      A name is explicitly used without an alias in several bindings.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testSeveralBindingsForOneImportPath0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testSeveralBindingsForOneImportPath0007';
      console.log(TAG + ' start');

      let x6 = sin(1.0);
      expect(x6).assertEqual(0.8414709848078965);
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

    /**
     * @tc.number    SUB_SEVERAL_BINDINGS_FOR_ONE_IMPORT_PATHTEST_0900
     * @tc.name      testSeveralBindingsForOneImportPath0009
     * @tc.desc      Several imports from one path in one line
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testSeveralBindingsForOneImportPath0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testSeveralBindingsForOneImportPath0009';
      console.log(TAG + ' start');

      let x8 = sin(1.0);
      let y1 = cos(1.0);
      expect(x8).assertEqual(0.8414709848078965);
      expect(y1).assertEqual(0.5403023058681398);
    });

  })
}