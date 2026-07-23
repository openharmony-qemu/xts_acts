'use static'
/*
 * Copyright (C) 2025-2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License')
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '../../../../../../hypium/index';
import Utils from '../../../Util.test'

interface I1 {
  a: number;
}

interface I2 {
  b: string;
}

interface I3 extends I1, I2 {}

class Impl implements I3 {
  a: number = 42;
  b: string = "hello";
}

function getIntersectionValue(val: I3): string {
  return val.b + val.a.toString();
}

export default function IntersectionTypesTest():void {
  describe('IntersectionTypesTest', () => {
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
     * @tc.number    SUB_INTERSECTION_TYPES_TEST_0100
     * @tc.name      testExample0001
     * @tc.desc      The values of intersection type A & B are all values that belong to both A and
     * B. Example from the section. (Note: Implemented via interface inheritance in strict ArkTS)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExample0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: I3 = new Impl();
      expect(obj.a).assertEqual(42);
      expect(obj.b).assertEqual("hello");
    });

    /**
     * @tc.number    SUB_INTERSECTION_TYPES_TEST_0200
     * @tc.name      testExample0002
     * @tc.desc      Intersection type as a function parameter type. (Note: Implemented via inheritance)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExample0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: I3 = new Impl();
      let res = getIntersectionValue(obj);
      expect(res).assertEqual("hello42");
    });
  })
}