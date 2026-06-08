'use static'
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
// Data Setup for testOverrideWithObjectExampleReturn0001
// ============================================================================
namespace override_object_return_0 {
  export enum E1 { E1, E2 }

  export interface Base {
    kinds_of_return_type<T extends Derived, U extends Base>(): Object
  }

  export interface Derived extends Base {
    kinds_of_return_type<T extends Derived, U extends Base>(): Derived
  }

  export class A implements Derived {
    res: int = 0

    kinds_of_return_type<T extends Derived, U extends Base>(): Derived {
      this.res = 2
      return new A()
    }
  }

  export function main(): int {
    let a = new A()
    let v = a.kinds_of_return_type<Derived, Base>()
    return a.res
  }
}

// ============================================================================
// Data Setup for testOverrideWithObjectExampleReturn0002
// ============================================================================
namespace override_object_return_1 {
  export enum E1 { E1, E2 }

  export interface Base {
    kinds_of_return_type<T extends Derived, U extends Base>(): Object
  }

  export interface Derived extends Base {
    kinds_of_return_type<T extends Derived, U extends Base>(): (q: Derived) => Base
  }

  export class A implements Derived {
    res: int = 0

    kinds_of_return_type<T extends Derived, U extends Base>(): (q: Derived) => Base {
      this.res = 2
      return (p: Derived): Base => new A()
    }
  }

  export function main(): int {
    let a = new A()
    let v = a.kinds_of_return_type<Derived, Base>()
    return a.res
  }
}

// ============================================================================
// Data Setup for testOverrideWithObjectExampleReturn0003
// ============================================================================
namespace override_object_return_2 {
  export enum E1 { E1, E2 }

  export interface Base {
    kinds_of_return_type<T extends Derived, U extends Base>(): Object
  }

  export interface Derived extends Base {
    kinds_of_return_type<T extends Derived, U extends Base>(): number
  }

  export class A implements Derived {
    res: int = 0

    kinds_of_return_type<T extends Derived, U extends Base>(): number {
      this.res = 2
      return 42.0
    }
  }

  export function main(): int {
    let a = new A()
    let v = a.kinds_of_return_type<Derived, Base>()
    return a.res
  }
}

// ============================================================================
// Data Setup for testOverrideWithObjectExampleReturn0004
// ============================================================================
namespace override_object_return_3 {
  export enum E1 { E1, E2 }

  export interface Base {
    kinds_of_return_type<T extends Derived, U extends Base>(): Object
  }

  export interface Derived extends Base {
    kinds_of_return_type<T extends Derived, U extends Base>(): T | U
  }

  export class A implements Derived {
    res: int = 0

    kinds_of_return_type<T extends Derived, U extends Base>(): T | U {
      this.res = 2
      return new A() as T
    }
  }

  export function main(): int {
    let a = new A()
    let v = a.kinds_of_return_type<Derived, Base>()
    return a.res
  }
}

// ============================================================================
// Data Setup for testOverrideWithObjectExampleReturn0005
// ============================================================================
namespace override_object_return_4 {
  export enum E1 { E1, E2 }

  export interface Base {
    kinds_of_return_type<T extends Derived, U extends Base>(): Object
  }

  export interface Derived extends Base {
    kinds_of_return_type<T extends Derived, U extends Base>(): E1
  }

  export class A implements Derived {
    res: int = 0

    kinds_of_return_type<T extends Derived, U extends Base>(): E1 {
      this.res = 2
      return E1.E1
    }
  }

  export function main(): int {
    let a = new A()
    let v = a.kinds_of_return_type<Derived, Base>()
    return a.res
  }
}

// ============================================================================
// Data Setup for testOverrideWithObjectExampleReturn0006
// ============================================================================
namespace override_object_return_5 {
  export enum E1 { E1, E2 }

  export interface Base {
    kinds_of_return_type<T extends Derived, U extends Base>(): Object
  }

  export interface Derived extends Base {
    kinds_of_return_type<T extends Derived, U extends Base>(): Base[]
  }

  export class A implements Derived {
    res: int = 0

    kinds_of_return_type<T extends Derived, U extends Base>(): Base[] {
      this.res = 2
      return [new A()]
    }
  }

  export function main(): int {
    let a = new A()
    let v = a.kinds_of_return_type<Derived, Base>()
    return a.res
  }
}

// ============================================================================
// Data Setup for testOverrideWithObjectExampleReturn0007
// ============================================================================
namespace override_object_return_6 {
  export enum E1 { E1, E2 }

  export interface Base {
    kinds_of_return_type<T extends Derived, U extends Base>(): Object
  }

  export interface Derived extends Base {
    kinds_of_return_type<T extends Derived, U extends Base>(): [Base, Base]
  }

  export class A implements Derived {
    res: int = 0

    kinds_of_return_type<T extends Derived, U extends Base>(): [Base, Base] {
      this.res = 2
      return [new A(), new A()]
    }
  }

  export function main(): int {
    let a = new A()
    let v = a.kinds_of_return_type<Derived, Base>()
    return a.res
  }
}

// ============================================================================
export default function OverrideCompatibleSignaturesTest02():void {
  describe('OverrideCompatibleSignaturesTest02', () => {
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
     * @tc.number    SUB_OVERRIDE_COMPATIBLE_SIGNATURESTESTTWO_0100
     * @tc.name      testOverrideWithObjectExampleReturn0001
     * @tc.desc      The example below illustrates override-compatibility with Object. If signatures
     *               are override-compatible, then overriding is used. Otherwise, a compile-time error
     *               occurs.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverrideWithObjectExampleReturn0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(override_object_return_0.main()).assertEqual(2);
    });

    /**
     * @tc.number    SUB_OVERRIDE_COMPATIBLE_SIGNATURESTESTTWO_0200
     * @tc.name      testOverrideWithObjectExampleReturn0002
     * @tc.desc      The example below illustrates override-compatibility with Object. If signatures
     *               are override-compatible, then overriding is used. Otherwise, a compile-time error
     *               occurs.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverrideWithObjectExampleReturn0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(override_object_return_1.main()).assertEqual(2);
    });

    /**
     * @tc.number    SUB_OVERRIDE_COMPATIBLE_SIGNATURESTESTTWO_0300
     * @tc.name      testOverrideWithObjectExampleReturn0003
     * @tc.desc      The example below illustrates override-compatibility with Object. If signatures
     *               are override-compatible, then overriding is used. Otherwise, a compile-time error
     *               occurs.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverrideWithObjectExampleReturn0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(override_object_return_2.main()).assertEqual(2);
    });

    /**
     * @tc.number    SUB_OVERRIDE_COMPATIBLE_SIGNATURESTESTTWO_0400
     * @tc.name      testOverrideWithObjectExampleReturn0004
     * @tc.desc      The example below illustrates override-compatibility with Object. If signatures
     *               are override-compatible, then overriding is used. Otherwise, a compile-time error
     *               occurs.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverrideWithObjectExampleReturn0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(override_object_return_3.main()).assertEqual(2);
    });

    /**
     * @tc.number    SUB_OVERRIDE_COMPATIBLE_SIGNATURESTESTTWO_0500
     * @tc.name      testOverrideWithObjectExampleReturn0005
     * @tc.desc      The example below illustrates override-compatibility with Object. If signatures
     *               are override-compatible, then overriding is used. Otherwise, a compile-time error
     *               occurs.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverrideWithObjectExampleReturn0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(override_object_return_4.main()).assertEqual(2);
    });

    /**
     * @tc.number    SUB_OVERRIDE_COMPATIBLE_SIGNATURESTESTTWO_0600
     * @tc.name      testOverrideWithObjectExampleReturn0006
     * @tc.desc      The example below illustrates override-compatibility with Object. If signatures
     *               are override-compatible, then overriding is used. Otherwise, a compile-time error
     *               occurs.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverrideWithObjectExampleReturn0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(override_object_return_5.main()).assertEqual(2);
    });

    /**
     * @tc.number    SUB_OVERRIDE_COMPATIBLE_SIGNATURESTESTTWO_0700
     * @tc.name      testOverrideWithObjectExampleReturn0007
     * @tc.desc      The example below illustrates override-compatibility with Object. If signatures
     *               are override-compatible, then overriding is used. Otherwise, a compile-time error
     *               occurs.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverrideWithObjectExampleReturn0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(override_object_return_6.main()).assertEqual(2);
    });

  })
}