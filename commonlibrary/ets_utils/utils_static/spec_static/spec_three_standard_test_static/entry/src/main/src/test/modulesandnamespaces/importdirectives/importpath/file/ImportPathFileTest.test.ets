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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '../../../../../../../hypium/index';
import Utils from '../../../../Util.test'

export function importedFromFile(): string {
  return "module_a.ets";
}

export default function ImportPathFileTest(): void {
  describe('ImportPathFileTest', () => {
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
     * @tc.number    SUB_IMPORT_PATH_FILETEST_0100
     * @tc.name      testImportPathFile0001
     * @tc.desc      Verify import path without suffix .ets can be resolved correctly
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 4
     */
    it("testImportPathFile0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL4, (): void => {
      console.log('testImportPathFile0001 start');
      let result = importedFromFile();
      expect(result).assertEqual("module_a.ets");
    });
  })
}