'use static'
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
  from '@ohos/hypium-binary/src/main/indexStatic';

interface I {}

class B implements I {
  private constructor() {}

  static create(): B {
    return new B();
  }
}

class A {}

class B2 extends A {
  private constructor() {
    super();
  }

  static create(): B2 {
    return new B2();
  }
}

export default function SupertypingAmongArrayTypesTest(): void {
  describe('SupertypingAmongArrayTypesTest', () => {
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
     * @tc.number    SUB_SUPERTYPING_AMONG_ARRAY_TYPESTEST_0100
     * @tc.name      testSupertypingAmongArrayTypes0001
     * @tc.desc      Supertype relation among array types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testSupertypingAmongArrayTypes0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: B =  B.create();
      let i: I = b;
      let instance: B[] = [b, i as B];

      expect(instance[0] instanceof B).assertEqual(true);
      expect(instance[1] instanceof B).assertEqual(true);
    });

    /**
     * @tc.number    SUB_SUPERTYPING_AMONG_ARRAY_TYPESTEST_0200
     * @tc.name      testSupertypingAmongArrayTypes0002
     * @tc.desc      Supertype relation among array types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testSupertypingAmongArrayTypes0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A =  B2.create();
      let b = a as B2;
      let instance: B2[] = [a as B2, b];

      expect(instance[0] instanceof B2).assertEqual(true);
      expect(instance[1] instanceof B2).assertEqual(true);

    });

    /**
     * @tc.number    SUB_SUPERTYPING_AMONG_ARRAY_TYPESTEST_0300
     * @tc.name      testSupertypingAmongArrayTypes0003
     * @tc.desc      Supertype relation among array types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testSupertypingAmongArrayTypes0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a1: Object = 1;
      let a2: Object = 2;
      let instance: number[] = [Number(a1), Number(a2)];

      expect(typeof instance[0]).assertEqual('number');
      expect(typeof instance[1]).assertEqual('number');
   });
  })
}
