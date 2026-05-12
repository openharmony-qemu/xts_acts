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
} from '../../../../../../hypium/index';


async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}

class A {
  public m(): int {
    return 1;
  }
}

final class C extends A {
  public m(): int {
    return 5;
  }
  public test(): int {
    return this.m()
  }
}

class A1 {
  protected m(): int {
    return 1;
  }
}

final class C1 extends A1 {
  protected m(): int {
    return 5;
  }
  public test(): int {
    return this.m()
  }
}

class A2 {
  protected m(): int {
    return 1;
  }
}

final class C2 extends A2 {
  public m(): int {
    return 5;
  }
  public test(): int {
    return this.m()
  }
}

class A3 {
  m(): int {
    return 1;
  }
}

final class C3 extends A3 {
  m(): int {
    return 5;
  }
  public test(): int {
    return this.m()
  }
}


export default function RequirementsInOverridingAndHidingTest():void {
  describe('RequirementsInOverridingAndHidingTest', () => {
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
     * @tc.number    SUB_REQUIREMENTS_IN_OVERRIDING_AND_HIDINGTEST_0100
     * @tc.name      testRequirementsInOverridingAndHiding0001
     * @tc.desc      Hiding method with different access method
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRequirementsInOverridingAndHiding0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testRequirementsInOverridingAndHiding0001';
      let c = new C()
      expect(c.test()).assertEqual(5)
    });

    /**
     * @tc.number    SUB_REQUIREMENTS_IN_OVERRIDING_AND_HIDINGTEST_0200
     * @tc.name      testRequirementsInOverridingAndHiding0002
     * @tc.desc      Hiding method with different access method
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRequirementsInOverridingAndHiding0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testRequirementsInOverridingAndHiding0002';
      let c = new C1()
      expect(c.test()).assertEqual(5)
    });

    /**
     * @tc.number    SUB_REQUIREMENTS_IN_OVERRIDING_AND_HIDINGTEST_0300
     * @tc.name      testRequirementsInOverridingAndHiding0003
     * @tc.desc      Hiding method with different access method
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRequirementsInOverridingAndHiding0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testRequirementsInOverridingAndHiding0003';
      let c = new C2()
      expect(c.test()).assertEqual(5)
    });

    /**
     * @tc.number    SUB_REQUIREMENTS_IN_OVERRIDING_AND_HIDINGTEST_0400
     * @tc.name      testRequirementsInOverridingAndHiding0004
     * @tc.desc      Hiding method with different access method
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRequirementsInOverridingAndHiding0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testRequirementsInOverridingAndHiding0004';
      let c = new C3()
      expect(c.test()).assertEqual(5)
    });
  })
}