/*
 * Copyright (c) 2024-2026 Huawei Device Co., Ltd.
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
// Data Setup for override_compatibility_enum_0
// ============================================================================
namespace override_enum_0 {
  export enum SHIPYARD { None, Flippers, SwimRing, Boat }
  export enum HARBOUR { Boat, SwimRing, Flippers, None }
  export let res: int = 0;

  export class Base {
    foo(i: SHIPYARD): void {
      res = 1
    }
  }

  export class Derived extends Base {
    override foo(i: SHIPYARD): void {
      res = 2
    }
  }

  export function main(): void {
    res = 0
    new Base().foo(SHIPYARD.Flippers)
    expect(res).assertEqual(1)
    new Derived().foo(SHIPYARD.Flippers)
    expect(res).assertEqual(2)
  }
}

// ============================================================================
// Data Setup for override_compatibility_enum_1
// ============================================================================
namespace override_enum_1 {
  export enum SHIPYARD { None, Flippers, SwimRing, Boat }
  export enum HARBOUR { Boat, SwimRing, Flippers, None }
  export let res: int = 0;

  export class Base {
    foo(i: SHIPYARD): void {
      res = 1
    }
  }

  export class Derived extends Base {
    // 修复点：ArkTS 要求每一个重载方法都必须有独立的函数体 {}
    override foo(i: SHIPYARD): void {
      res = 2
    }

    // 这是重载 (Overload)
    foo(i: HARBOUR): void {
      res = 2
    }
  }

  export function main(): void {
    res = 0
    new Base().foo(SHIPYARD.Flippers)
    expect(res).assertEqual(1)

    res = 0
    new Derived().foo(SHIPYARD.Flippers)
    expect(res).assertEqual(2)

    res = 0
    new Derived().foo(HARBOUR.Flippers)
    expect(res).assertEqual(2)
  }
}

// ============================================================================
// Data Setup for override_compatibility_enum_2
// ============================================================================
namespace override_enum_2 {
  export enum SHIPYARD { None, Flippers, SwimRing, Boat }
  export enum HARBOUR { Boat, SwimRing, Flippers, None }

  export class Base {
    foo(): SHIPYARD {
      return SHIPYARD.Flippers
    }
  }

  export class Derived extends Base {
    override foo(): SHIPYARD {
      return SHIPYARD.SwimRing
    }
  }

  export function main(): void {
    expect(new Base().foo()).assertEqual(SHIPYARD.Flippers)
    expect(new Derived().foo()).assertEqual(SHIPYARD.SwimRing)
  }
}

// ============================================================================
// Data Setup for override_compatibility_union_0
// ============================================================================
namespace override_union_0 {
  export let res: number = 0;

  export interface IUnion {}
  export class UA implements IUnion {}
  export class UB implements IUnion {}
  export class UC extends UA {}
  export class UD extends UB {}

  export type UnionAB = UA | UB
  export type UnionCD = UC | UD

  export class Base {
    foo(i: UnionCD): void {
      res = 1
    }
  }

  export class Derived extends Base {
    // ArkTS strict mode requires exact or wider type for parameter (contravariance)
    override foo(i: UnionAB | UnionCD): void {
      res = 2
    }
  }

  export function main(): void {
    res = 0
    new Derived().foo(new UA())
    expect(res).assertEqual(2)
  }
}

// ============================================================================
// Data Setup for override_compatibility_union_1
// ============================================================================
namespace override_union_1 {
  export let res: number = 0;

  export interface IUnion {}
  export class UA implements IUnion {}
  export class UB implements IUnion {}
  export class UC extends UA {}
  export class UD extends UB {}

  export type UnionAB = UA | UB
  export type UnionCD = UC | UD

  export class Base {
    foo(): UnionAB {
      res = 1
      return new UA()
    }
  }

  export class Derived extends Base {
    // Return type Tm+1 is a subtype of Un+1 (covariance).
    override foo(): UnionCD {
      res = 2
      return new UD()
    }
  }

  export function main(): void {
    res = 0
    new Derived().foo()
    expect(res).assertEqual(2)
  }
}

// ============================================================================
// Data Setup for override_compatibility_tuple_0
// ============================================================================
namespace override_tuple_0 {
  export let res: number = 0;

  export class Base {
    foo(i: [Base, Base]): void { res = 1 }
    foo2(i: [Base, Derived]): void { res = 2 }
    foo3(i: [Derived, Derived]): void { res = 3 }
  }

  export class Derived extends Base {
    override foo(i: [Base, Base]): void { res = 4 }
    override foo2(i: [Base, Derived]): void { res = 5 }
    override foo3(i: [Derived, Derived]): void { res = 6 }
  }

  export const bb: [Base, Base] = [new Base(), new Base()]
  export const bd: [Base, Derived] = [new Base(), new Derived()]
  export const dd: [Derived, Derived] = [new Derived(), new Derived()]

  export function main(): void {
    res = 0
    new Derived().foo(bb)
    expect(res).assertEqual(4)
    res = 0
    new Derived().foo2(bd)
    expect(res).assertEqual(5)
    res = 0
    new Derived().foo3(dd)
    expect(res).assertEqual(6)
  }
}

// ============================================================================
// Data Setup for override_compatibility_tuple_1
// ============================================================================
namespace override_tuple_1 {
  export let res: number = 0;

  export class Base {
    foo(i: [Object, Base]): void { res = 1 }
  }

  export class Derived extends Base {
    // Parameter contravariance: accepting wider/same types.
    override foo(i: [Object, Base] | [Base, Derived]): void { res = 2 }
  }

  export const ob: [Object, Base] = [new Object(), new Base()]
  export const bd: [Base, Derived] = [new Base(), new Derived()]

  export function main(): void {
    res = 0
    new Base().foo(ob)
    expect(res).assertEqual(1)

    res = 0;
    new Derived().foo(ob)
    expect(res).assertEqual(2)

    res = 0;
    new Derived().foo(bd)
    expect(res).assertEqual(2)
  }
}

// ============================================================================
// Data Setup for override_compatibility_tuple_2
// ============================================================================
namespace override_tuple_2 {
  export let res: number = 0;

  export class Base {
    foo(i: [Derived, Object]): void { res = 1 }
  }

  export class Derived extends Base {
    // Parameter contravariance
    override foo(i: [Derived, Object] | [Derived, Derived]): void { res = 2 }
  }

  export const do_: [Derived, Object] = [new Derived(), new Object()]
  export const dd: [Derived, Derived] = [new Derived(), new Derived()]

  export function main(): void {
    res = 0
    new Base().foo(do_)
    expect(res).assertEqual(1)

    res = 0;
    new Derived().foo(do_)
    expect(res).assertEqual(2)

    res = 0;
    new Derived().foo(dd)
    expect(res).assertEqual(2)
  }
}

// ============================================================================
// Data Setup for override_compatibility_tuple_3
// ============================================================================
namespace override_tuple_3 {
  export let res: number = 0;

  export class Base {
    foo(): [Base, Base] {
      res = 1
      return [new Base(), new Base()]
    }
  }

  export class Derived extends Base {
    override foo(): [Base, Base] {
      res = 2
      return [new Base(), new Base()]
    }
  }

  export function main(): void {
    res = 0
    new Derived().foo()
    expect(res).assertEqual(2)
  }
}


export default function OverrideCompatibleSignaturesTest03():void {
  describe('OverrideCompatibleSignaturesTest03', () => {
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
     * @tc.number    SUB_OVERRIDE_COMPATIBLE_SIGNATURESTESTTHREE_0100
     * @tc.name      testOverrideCompatibilityEnum0001
     * @tc.desc      Checking override-compatibility with Enums: same parameter type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverrideCompatibilityEnum0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      override_enum_0.main();
    });

    /**
     * @tc.number    SUB_OVERRIDE_COMPATIBLE_SIGNATURESTESTTHREE_0200
     * @tc.name      testOverrideCompatibilityEnum0002
     * @tc.desc      Checking override-compatibility with Enums: parameter is unrelated (overloaded)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverrideCompatibilityEnum0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      override_enum_1.main();
    });

    /**
     * @tc.number    SUB_OVERRIDE_COMPATIBLE_SIGNATURESTESTTHREE_0300
     * @tc.name      testOverrideCompatibilityEnum0003
     * @tc.desc      Checking override-compatibility with Enums: same return type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverrideCompatibilityEnum0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      override_enum_2.main();
    });

    /**
     * @tc.number    SUB_OVERRIDE_COMPATIBLE_SIGNATURESTESTTHREE_0400
     * @tc.name      testOverrideCompatibilityUnion0004
     * @tc.desc      Checking override-compatibility with Unions: parameter contravariance
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverrideCompatibilityUnion0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      override_union_0.main();
    });

    /**
     * @tc.number    SUB_OVERRIDE_COMPATIBLE_SIGNATURESTESTTHREE_0500
     * @tc.name      testOverrideCompatibilityUnion0005
     * @tc.desc      Checking override-compatibility with Unions: return type covariance
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverrideCompatibilityUnion0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      override_union_1.main();
    });

    /**
     * @tc.number    SUB_OVERRIDE_COMPATIBLE_SIGNATURESTESTTHREE_0600
     * @tc.name      testOverrideCompatibilityTuple0006
     * @tc.desc      Checking override-compatibility with Tuples: same parameter type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverrideCompatibilityTuple0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      override_tuple_0.main();
    });

    /**
     * @tc.number    SUB_OVERRIDE_COMPATIBLE_SIGNATURESTESTTHREE_0700
     * @tc.name      testOverrideCompatibilityTuple0007
     * @tc.desc      Checking override-compatibility with Tuples: parameter contravariance
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverrideCompatibilityTuple0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      override_tuple_1.main();
    });

    /**
     * @tc.number    SUB_OVERRIDE_COMPATIBLE_SIGNATURESTESTTHREE_0800
     * @tc.name      testOverrideCompatibilityTuple0008
     * @tc.desc      Checking override-compatibility with Tuples: parameter contravariance 2
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverrideCompatibilityTuple0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      override_tuple_2.main();
    });

    /**
     * @tc.number    SUB_OVERRIDE_COMPATIBLE_SIGNATURESTESTTHREE_0900
     * @tc.name      testOverrideCompatibilityTuple0009
     * @tc.desc      Checking override-compatibility with Tuples: same return type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverrideCompatibilityTuple0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      override_tuple_3.main();
    });

  })
}