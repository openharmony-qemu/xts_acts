'use static';
/*
 * Copyright (C) 2025-2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License')
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType }
  from '../../../../../hypium/index';

class B {}

class B2 {}

class A {}

class B3 extends A {
  private constructor() {
    super();
  }

  static create(): B3 {
    return new B3();
  }
}

export default function SubtypingAmongArrayTypesTest(): void {
  describe('SubtypingAmongArrayTypesTest', () => {
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })

    beforeEach(() => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })

    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })

    afterAll(() => {
      // Presets an action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: preset action function.
    })
    /**
     * @tc.number    SUB_SUBTYPING_AMONG_ARRAY_TYPESTEST_0200
     * @tc.name      testStaticAndInstanceFields0002
     * @tc.desc      Supertype relation among array types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStaticAndInstanceFields0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b1 = new B();
      let b2 = new B();
      let instance: Object = [b1, b2];
      expect((instance as B[])[0]).assertEqual(b1);
      expect((instance as B[])[1]).assertEqual(b2);
    });

    /**
     * @tc.number    SUB_SUBTYPING_AMONG_ARRAY_TYPESTEST_0300
     * @tc.name      testStaticAndInstanceFields0003
     * @tc.desc      Supertype relation among array types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStaticAndInstanceFields0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let b1 = new B2();
      let b2 = new B2();
      let instance: Object[] = [b1, b2];
      expect(instance[0] instanceof B2).assertTrue();
      expect(instance[1] instanceof B2).assertTrue();
    });

    /**
     * @tc.number    SUB_SUBTYPING_AMONG_ARRAY_TYPESTEST_0400
     * @tc.name      testStaticAndInstanceFields0004
     * @tc.desc      Supertype relation among array types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStaticAndInstanceFields0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let b1 = B3.create();
      let b2 = B3.create();
      let instance: A[] = [b1, b2];
      expect(instance[0] instanceof A).assertTrue();
      expect(instance[0] instanceof B3).assertTrue();
      expect(instance[1] instanceof A).assertTrue();
      expect(instance[1] instanceof B3).assertTrue();
    })

    /**
     * @tc.number    SUB_SUBTYPING_AMONG_ARRAY_TYPESTEST_0500
     * @tc.name      testStaticAndInstanceFields0005
     * @tc.desc      Supertype relation among array types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStaticAndInstanceFields0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let instance: Object[] = [1, 2];
      expect(typeof instance[0]).assertEqual('int');
      expect(typeof instance[1]).assertEqual('int');
    });
  })
}
