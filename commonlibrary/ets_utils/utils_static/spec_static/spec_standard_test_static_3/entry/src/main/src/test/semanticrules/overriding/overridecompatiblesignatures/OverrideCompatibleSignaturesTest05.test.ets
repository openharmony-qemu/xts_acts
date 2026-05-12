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
// Data Setup for spec_example_0a
// ============================================================================
namespace spec_example_0a {
  export class Base {}
  export class Derived extends Base {}

  export class A1<CovariantTypeParameter extends Base> {}
  export class B1<CovariantTypeParameter extends Derived> extends A1<CovariantTypeParameter> {}

  export let a1: A1<Base> = new A1<Base>();
  export let b1: B1<Derived> = new B1<Derived>();

  export function main(): void {
    expect(a1 instanceof A1).assertTrue();
    expect(b1 instanceof B1).assertTrue();
  }
}

// ============================================================================
// Data Setup for spec_example_1
// ============================================================================
namespace spec_example_1 {
  export interface Base {
    param(p: Derived): void
    ret(): Base
  }

  export interface Derived extends Base {
    param(p: Base): void // Contravariant parameter
    ret(): Derived       // Covariant return type
  }

  export let res: number = 0;

  export class B implements Base {
    param(p: Derived): void {
      res = 1
    }
    ret(): Base {
      return this
    }
  }

  export class D implements Derived {
    param(p: Base): void {
      res = 2
    }
    ret(): Derived {
      return this
    }
  }

  export let b: B = new B();
  export let d: D = new D();

  export function main(): void {
    res = 0;
    b.param(d);
    expect(res).assertEqual(1);
    expect(b.ret()).assertEqual(b);

    d.param(b);
    expect(res).assertEqual(2);
    expect(d.ret()).assertEqual(d);
  }
}

// ============================================================================
// Data Setup for spec_example_2
// ============================================================================
namespace spec_example_2 {
  export interface Base {
    param(p: (q: Base) => Derived): void
    ret(): (q: Derived) => Base
  }

  export interface Derived extends Base {
    param(p: (q: Derived) => Base): void // Covariant parameter type, contravariant return type
    ret(): (q: Base) => Derived          // Contravariant parameter type, covariant return type
  }

  export let res: number = 0;

  export class B implements Base {
    param(p: (q: Base) => Derived): void {
      res = 1
    }
    ret(): (q: Derived) => Base {
      return (q: Derived): Base => this
    }
  }

  export class D implements Derived {
    param(p: (q: Derived) => Base): void {
      res = 2
    }
    ret(): (q: Base) => Derived {
      return (q: Base): Derived => this
    }
  }

  export let b: B = new B();
  export let d: D = new D();

  export function main(): void {
    res = 0;
    b.param((q: Base): Derived => d);
    expect(res).assertEqual(1);
    expect(b.ret()(d)).assertEqual(b);

    d.param((q: Derived): Base => b);
    expect(res).assertEqual(2);
    expect(d.ret()(b)).assertEqual(d);
  }
}

// ============================================================================
// Data Setup for spec_example_3
// ============================================================================
namespace spec_example_3 {
  export interface BaseSuperType {}

  export interface Base extends BaseSuperType {
    // Overriding for parameters
    param<T extends Derived, U extends Base>(p: T | U): void
    // Overriding for return type
    ret<T extends Derived, U extends Base>(): T | U
  }

  export interface Derived extends Base {
    // Overriding kinds for parameters, Derived <: Base
    // contravariant parameter type: Derived | Base <: Base | BaseSuperType
    param<T extends Base, U extends Object>(p: Base | BaseSuperType): void
    // Overriding kinds for return type
    ret<T extends Base, U extends BaseSuperType>(): T | U
  }

  export let res: number = 0;

  export class B implements Base {
    param<T extends Derived, U extends Base>(p: T | U): void {
      res = 1
    }
    ret<T extends Derived, U extends Base>(): T | U {
      return b as Object as U // Cast bridging through Object to satisfy strict generic constraint limits
    }
  }

  export class D implements Derived {
    param<T extends Base, U extends Object>(p: Base | BaseSuperType): void {
      res = 2
    }
    ret<T extends Base, U extends BaseSuperType>(): T | U {
      return b as Object as T
    }
  }

  export let b: B = new B();
  export let d: D = new D();

  export function main(): void {
    res = 0;
    b.param<D, B>(d);
    expect(res).assertEqual(1);
    expect(b.ret<D, B>()).assertEqual(b);

    b.param<D, B>(b);
    expect(res).assertEqual(1);

    d.param<B, Object>(b);
    expect(res).assertEqual(2);
    expect(d.ret<B, BaseSuperType>()).assertEqual(b);
  }
}

// ============================================================================
// Data Setup for spec_example_4
// ============================================================================
namespace spec_example_4 {
  export interface Base {
    param<T extends Derived>(p: T): void
    ret<T extends Derived>(): T
  }

  export interface Derived extends Base {
    // Contravariance for constraints of type parameters
    param<T extends Base>(p: T): void
    // Contravariance for constraints of the return type
    ret<T extends Base>(): T
  }

  export let res: number = 0;

  export class B implements Base {
    param<T extends Derived>(p: T): void {
      res = 1
    }
    ret<T extends Derived>(): T {
      return d as Object as T // Cast bridging to satisfy generic assignments
    }
  }

  export class D implements Derived {
    param<T extends Base>(p: T): void {
      res = 2
    }
    ret<T extends Base>(): T {
      return b as Object as T
    }
  }

  export let b: B = new B();
  export let d: D = new D();

  export function main(): void {
    res = 0;
    b.param<D>(d);
    expect(res).assertEqual(1);
    expect(b.ret<D>()).assertEqual(d);

    d.param<B>(b);
    expect(res).assertEqual(2);
    expect(d.ret<B>()).assertEqual(b);
  }
}

export default function OverrideCompatibleSignaturesTest05():void {
  describe('OverrideCompatibleSignaturesTest05', () => {
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
     * @tc.number    SUB_OVERRIDE_COMPATIBLE_SIGNATURESTESTFIVE_0100
     * @tc.name      testSpecExample0001
     * @tc.desc      Checking that Derived class may have type compatible constraint of type parameters.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testSpecExample0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      spec_example_0a.main();
    });

    /**
     * @tc.number    SUB_OVERRIDE_COMPATIBLE_SIGNATURESTESTFIVE_0200
     * @tc.name      testSpecExample0002
     * @tc.desc      Checking Class/Interface override compatibility (Contravariant parameter, Covariant return).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testSpecExample0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      spec_example_1.main();
    });

    /**
     * @tc.number    SUB_OVERRIDE_COMPATIBLE_SIGNATURESTESTFIVE_0300
     * @tc.name      testSpecExample0003
     * @tc.desc      Checking Function Types override compatibility and covariance/contravariance.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testSpecExample0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      spec_example_2.main();
    });

    /**
     * @tc.number    SUB_OVERRIDE_COMPATIBLE_SIGNATURESTESTFIVE_0400
     * @tc.name      testSpecExample0004
     * @tc.desc      Checking Union Types override compatibility for parameters and returns.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testSpecExample0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      spec_example_3.main();
    });

    /**
     * @tc.number    SUB_OVERRIDE_COMPATIBLE_SIGNATURESTESTFIVE_0500
     * @tc.name      testSpecExample0005
     * @tc.desc      Checking Contravariance for constraints of type parameters and return types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testSpecExample0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      spec_example_4.main();
    });

  })
}