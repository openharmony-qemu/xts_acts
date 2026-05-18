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
// Data Setup for testOverrideWithObjectExample0001
// ============================================================================
namespace override_object_0 {
  export enum E1 { E1, E2 }

  export interface Base {
    foo<T extends Derived, U extends Base>(i: Derived): void
  }

  export interface Derived extends Base {
    foo<T extends Derived, U extends Base>(i: Object): void
  }

  export class A implements Derived {
    res: int = 0

    foo<T extends Derived, U extends Base>(i: Object): void {
      this.res = 2
    }
  }

  export function main(): int {
    let a = new A()
    a.foo<Derived, Base>(new Object())
    return a.res
  }
}

// ============================================================================
// Data Setup for testOverrideWithObjectExample0002
// ============================================================================
namespace override_object_1 {
  export enum E1 { E1, E2 }

  export interface Base {
    foo<T extends Derived, U extends Base>(i: (q: Base) => Derived): void
  }

  export interface Derived extends Base {
    foo<T extends Derived, U extends Base>(i: Object): void
  }

  export class A implements Derived {
    res: int = 0

    foo<T extends Derived, U extends Base>(i: Object): void {
      this.res = 2
    }
  }

  export function main(): int {
    let a = new A()
    a.foo<Derived, Base>(new Object())
    return a.res
  }
}

// ============================================================================
// Data Setup for testOverrideWithObjectExample0003
// ============================================================================
namespace override_object_2 {
  export enum E1 { E1, E2 }

  export interface Base {
    foo<T extends Derived, U extends Base>(i: Number): void
  }

  export interface Derived extends Base {
    foo<T extends Derived, U extends Base>(i: Object): void
  }

  export class A implements Derived {
    res: int = 0

    foo<T extends Derived, U extends Base>(i: Object): void {
      this.res = 2
    }
  }

  export function main(): int {
    let a = new A()
    a.foo<Derived, Base>(new Object())
    return a.res
  }
}

// ============================================================================
// Data Setup for testOverrideWithObjectExample0004
// ============================================================================
namespace override_object_3 {
  export enum E1 { E1, E2 }

  export interface Base {
    foo<T extends Derived, U extends Base>(i: T | U): void
  }

  export interface Derived extends Base {
    foo<T extends Derived, U extends Base>(i: Object): void
  }

  export class A implements Derived {
    res: int = 0

    foo<T extends Derived, U extends Base>(i: Object): void {
      this.res = 2
    }
  }

  export function main(): int {
    let a = new A()
    a.foo<Derived, Base>(new Object())
    return a.res
  }
}

// ============================================================================
// Data Setup for testOverrideWithObjectExample0005
// ============================================================================
namespace override_object_4 {
  export enum E1 { E1, E2 }

  export interface Base {
    foo<T extends Derived, U extends Base>(i: E1): void
  }

  export interface Derived extends Base {
    foo<T extends Derived, U extends Base>(i: Object): void
  }

  export class A implements Derived {
    res: int = 0

    foo<T extends Derived, U extends Base>(i: Object): void {
      this.res = 2
    }
  }

  export function main(): int {
    let a = new A()
    a.foo<Derived, Base>(new Object())
    return a.res
  }
}

// ============================================================================
// Data Setup for testOverrideWithObjectExample0006
// ============================================================================
namespace override_object_5 {
  export enum E1 { E1, E2 }

  export interface Base {
    foo<T extends Derived, U extends Base>(i: Base[]): void
  }

  export interface Derived extends Base {
    foo<T extends Derived, U extends Base>(i: Object): void
  }

  export class A implements Derived {
    res: int = 0

    foo<T extends Derived, U extends Base>(i: Object): void {
      this.res = 2
    }
  }

  export function main(): int {
    let a = new A()
    a.foo<Derived, Base>(new Object())
    return a.res
  }
}

// ============================================================================
// Data Setup for testOverrideWithObjectExample0007
// ============================================================================
namespace override_object_6 {
  export enum E1 { E1, E2 }

  export interface Base {
    foo<T extends Derived, U extends Base>(i: [Base, Base]): void
  }

  export interface Derived extends Base {
    foo<T extends Derived, U extends Base>(i: Object): void
  }

  export class A implements Derived {
    res: int = 0

    foo<T extends Derived, U extends Base>(i: Object): void {
      this.res = 2
    }
  }

  export function main(): int {
    let a = new A()
    a.foo<Derived, Base>(new Object())
    return a.res
  }
}

export default function OverrideCompatibleSignaturesTestOne():void {
  describe('OverrideCompatibleSignaturesTestOne', () => {
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
     * @tc.number    SUB_OVERRIDE_COMPATIBLE_SIGNATURESTESTONE_0100
     * @tc.name      testOverrideWithObjectExample0001
     * @tc.desc      The example below illustrates override-compatibility with Object. If signatures
     *               are override-compatible, then overriding is used. Otherwise, a compile-time error
     *               occurs.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverrideWithObjectExample0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(override_object_0.main()).assertEqual(2);
    });

    /**
     * @tc.number    SUB_OVERRIDE_COMPATIBLE_SIGNATURESTESTONE_0200
     * @tc.name      testOverrideWithObjectExample0002
     * @tc.desc      The example below illustrates override-compatibility with Object. If signatures
     *               are override-compatible, then overriding is used. Otherwise, a compile-time error
     *               occurs.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverrideWithObjectExample0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(override_object_1.main()).assertEqual(2);
    });

    /**
     * @tc.number    SUB_OVERRIDE_COMPATIBLE_SIGNATURESTESTONE_0300
     * @tc.name      testOverrideWithObjectExample0003
     * @tc.desc      The example below illustrates override-compatibility with Object. If signatures
     *               are override-compatible, then overriding is used. Otherwise, a compile-time error
     *               occurs.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverrideWithObjectExample0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(override_object_2.main()).assertEqual(2);
    });

    /**
     * @tc.number    SUB_OVERRIDE_COMPATIBLE_SIGNATURESTESTONE_0400
     * @tc.name      testOverrideWithObjectExample0004
     * @tc.desc      The example below illustrates override-compatibility with Object. If signatures
     *               are override-compatible, then overriding is used. Otherwise, a compile-time error
     *               occurs.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverrideWithObjectExample0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(override_object_3.main()).assertEqual(2);
    });

    /**
     * @tc.number    SUB_OVERRIDE_COMPATIBLE_SIGNATURESTESTONE_0500
     * @tc.name      testOverrideWithObjectExample0005
     * @tc.desc      The example below illustrates override-compatibility with Object. If signatures
     *               are override-compatible, then overriding is used. Otherwise, a compile-time error
     *               occurs.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverrideWithObjectExample0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(override_object_4.main()).assertEqual(2);
    });

    /**
     * @tc.number    SUB_OVERRIDE_COMPATIBLE_SIGNATURESTESTONE_0600
     * @tc.name      testOverrideWithObjectExample0006
     * @tc.desc      The example below illustrates override-compatibility with Object. If signatures
     *               are override-compatible, then overriding is used. Otherwise, a compile-time error
     *               occurs.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverrideWithObjectExample0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(override_object_5.main()).assertEqual(2);
    });

    /**
     * @tc.number    SUB_OVERRIDE_COMPATIBLE_SIGNATURESTESTONE_0700
     * @tc.name      testOverrideWithObjectExample0007
     * @tc.desc      The example below illustrates override-compatibility with Object. If signatures
     *               are override-compatible, then overriding is used. Otherwise, a compile-time error
     *               occurs.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverrideWithObjectExample0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(override_object_6.main()).assertEqual(2);
    });

  })
}