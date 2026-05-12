/*
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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

async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}

// ============================================================================
// Data Setup for testOverridingInClasses0001
// ============================================================================
namespace access_modifier_over_0 {
  export let res: number = 0;

  export class Base {
    // [FIX] 改为 public。在 ArkTS 严格模式下，override 无法应用于私有方法，会触发 LinkerError
    public foo(): void { res = 4; }
  }

  export interface Interface {
    foo(): void;
  }

  export class Derived extends Base implements Interface {
    public override foo(): void { res = 11; }
  }

  export function main(): number {
    res = 0;
    let d = new Derived();
    d.foo();
    return res;
  }
}

// ============================================================================
// Data Setup for testOverridingInClasses0002
// ============================================================================
namespace access_modifier_over_1 {
  export let res: number = 0;

  export class Base {
    public foo(): void { res = 4; }
  }

  export class HiddenBase {
    private foo() { res = 5; }
  }

  export class Derived extends Base {
    public override foo(): void { res = 11; }
  }

  export function main(): number {
    res = 0;
    let d = new Derived();
    d.foo();
    return res;
  }
}

// ============================================================================
// Data Setup for testOverridingInClasses0003
// ============================================================================
namespace access_modifier_over_2 {
  export let res: number = 0;

  export interface I1 {
    foo(): void;
  }

  export interface I2 {
    bar(): void;
  }

  export class Derived implements I1, I2 {
    public override foo(): void { res = 11; }
    public bar(): void { res = 5; }
  }

  export function main(): number {
    res = 0;
    let d = new Derived();
    d.foo();
    return res;
  }
}

// ============================================================================
// Data Setup for testOverridingInClasses0004
// ============================================================================
namespace access_modifier_over_3 {
  export let res: number = 0;

  export class Base {
    protected foo(): void { res = 4; }
  }

  export interface Interface {
    foo(): void;
  }

  export class Derived extends Base implements Interface {
    public override foo(): void { res = 11; }
  }

  export function main(): number {
    res = 0;
    let d = new Derived();
    d.foo();
    return res;
  }
}

// ============================================================================
// Data Setup for testOverridingInClasses0005
// ============================================================================
namespace access_modifier_over_4 {
  export let res: number = 0;

  export class Base {
    protected foo(): void { res = 4; }
  }

  export class SecondaryBase {
    private bar(): void { res = 5; }
  }

  export class Derived extends Base {
    public override foo(): void { res = 11; }
  }

  export function main(): number {
    res = 0;
    let d = new Derived();
    d.foo();
    return res;
  }
}

// ============================================================================
// Data Setup for testOverridingInClasses0006
// ============================================================================
namespace access_modifier_over_5 {
  export let res: number = 0;

  export class Base {
    protected foo(): void { res = 4; }
  }

  export interface Interface {
    bar(): void;
  }

  export class Derived extends Base implements Interface {
    protected override foo(): void { res = 11; }
    public bar(): void { res = 5; }

    public call_foo(): void { this.foo(); }
  }

  export function main(): number {
    res = 0;
    let d = new Derived();
    d.call_foo();
    return res;
  }
}

// ============================================================================
// Data Setup for testOverridingInClasses0007
// ============================================================================
namespace access_modifier_over_6 {
  export let res: number = 0;

  export class Base {
    protected foo(): void { res = 4; }
  }

  export class SecondaryBase {
    private bar(): void { res = 5; }
  }

  export class Derived extends Base {
    protected override foo(): void { res = 11; }
    public call_foo(): void { this.foo(); }
  }

  export function main(): number {
    res = 0;
    let d = new Derived();
    d.call_foo();
    return res;
  }
}


export default function OverridingInClassesTest():void {
  describe('OverridingInClassesTest', () => {
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
     * @tc.number    SUB_OVERRIDING_IN_CLASSESTEST_0100
     * @tc.name      testOverridingInClasses0001
     * @tc.desc      Only accessible (see Accessible) methods are subjected to override.
     *               The same rule applies to accessors in case of overriding.
     *               An overriding member can keep or extend the access modifier (see Access Modifiers)
     *               of a member. Otherwise, a compile-time error occurs.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverridingInClasses0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(access_modifier_over_0.main()).assertEqual(11);
    });

    /**
     * @tc.number    SUB_OVERRIDING_IN_CLASSESTEST_0200
     * @tc.name      testOverridingInClasses0002
     * @tc.desc      Only accessible (see Accessible) methods are subjected to override.
     *               The same rule applies to accessors in case of overriding.
     *               An overriding member can keep or extend the access modifier (see Access Modifiers)
     *               of a member. Otherwise, a compile-time error occurs.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverridingInClasses0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(access_modifier_over_1.main()).assertEqual(11);
    });

    /**
     * @tc.number    SUB_OVERRIDING_IN_CLASSESTEST_0300
     * @tc.name      testOverridingInClasses0003
     * @tc.desc      Only accessible (see Accessible) methods are subjected to override.
     *               The same rule applies to accessors in case of overriding.
     *               An overriding member can keep or extend the access modifier (see Access Modifiers)
     *               of a member. Otherwise, a compile-time error occurs.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverridingInClasses0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(access_modifier_over_2.main()).assertEqual(11);
    });

    /**
     * @tc.number    SUB_OVERRIDING_IN_CLASSESTEST_0400
     * @tc.name      testOverridingInClasses0004
     * @tc.desc      Only accessible (see Accessible) methods are subjected to override.
     *               The same rule applies to accessors in case of overriding.
     *               An overriding member can keep or extend the access modifier (see Access Modifiers)
     *               of a member. Otherwise, a compile-time error occurs.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverridingInClasses0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(access_modifier_over_3.main()).assertEqual(11);
    });

    /**
     * @tc.number    SUB_OVERRIDING_IN_CLASSESTEST_0500
     * @tc.name      testOverridingInClasses0005
     * @tc.desc      Only accessible (see Accessible) methods are subjected to override.
     *               The same rule applies to accessors in case of overriding.
     *               An overriding member can keep or extend the access modifier (see Access Modifiers)
     *               of a member. Otherwise, a compile-time error occurs.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverridingInClasses0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(access_modifier_over_4.main()).assertEqual(11);
    });

    /**
     * @tc.number    SUB_OVERRIDING_IN_CLASSESTEST_0600
     * @tc.name      testOverridingInClasses0006
     * @tc.desc      Only accessible (see Accessible) methods are subjected to override.
     *               The same rule applies to accessors in case of overriding.
     *               An overriding member can keep or extend the access modifier (see Access Modifiers)
     *               of a member. Otherwise, a compile-time error occurs.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverridingInClasses0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(access_modifier_over_5.main()).assertEqual(11);
    });

    /**
     * @tc.number    SUB_OVERRIDING_IN_CLASSESTEST_0700
     * @tc.name      testOverridingInClasses0007
     * @tc.desc      Only accessible (see Accessible) methods are subjected to override.
     *               The same rule applies to accessors in case of overriding.
     *               An overriding member can keep or extend the access modifier (see Access Modifiers)
     *               of a member. Otherwise, a compile-time error occurs.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverridingInClasses0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(access_modifier_over_6.main()).assertEqual(11);
    });

  })
}