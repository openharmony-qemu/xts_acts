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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '../../../../../../hypium/index';
import Utils from '../../../Util.test'

class Class1 {
  f: number = 1;
}

class Class2 {
  f: number = 2;
}

class A {
  constructor() {}
}

export default function ImportTypeDirectiveTest(): void {
  describe('ImportTypeDirectiveTest', () => {
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
     * @tc.number    SUB_IMPORT_TYPE_DIRECTIVETEST_0100
     * @tc.name      testImprotTypeDirective0001
     * @tc.desc      Another form of type import is used when type is attached to a name binding.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImprotTypeDirective0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testImprotTypeDirective0001';
      console.log(TAG + ' start');

      let c1 = new Class1();
      let c2 = new Class2();
      expect(c1.f).assertEqual(1);
      expect(c2.f).assertEqual(2);
    });

    /**
     * @tc.number    SUB_IMPORT_TYPE_DIRECTIVETEST_0200
     * @tc.name      testImprotTypeDirective0002
     * @tc.desc      Import class type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImprotTypeDirective0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testImprotTypeDirective0002';
      console.log(TAG + ' start');
      let c: A = new A();
      expect(c instanceof A).assertTrue();
    });
  })
}