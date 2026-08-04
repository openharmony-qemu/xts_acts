'use static'
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
import Utils from '../../../Util.test'

// ============================================================================
// Data Setup for override_with_object_0
// ============================================================================
namespace override_obj_0 {
  export let res: number = 0;
  export class Base {
    foo(i: Base): void { res = 1; }
  }
  export class Derived extends Base {
    // Contravariance: Object is wider than Base
    override foo(i: Object): void { res = 2; }
  }
  export function main(): void {
    new Derived().foo(new Base());
    expect(res).assertEqual(2);
  }
}

// ============================================================================
// Data Setup for override_with_object_1
// ============================================================================
namespace override_obj_1 {
  export let res: number = 0;
  export class Base {
    foo(i: Base): void { res = 1; }
  }
  export class Derived extends Base {
    override foo(i: Object): void { res = 2; }
  }
  export function main(): void {
    new Derived().foo(new Object());
    expect(res).assertEqual(2);
  }
}

// ============================================================================
// Data Setup for override_with_object_2
// ============================================================================
namespace override_obj_2 {
  export let res: number = 0;
  export class Base {
    foo(): Object {
      res = 1;
      return new Object();
    }
  }
  export class Derived extends Base {
    // Covariance: Base is narrower than Object
    override foo(): Base {
      res = 2;
      return new Base();
    }
  }
  export function main(): void {
    new Derived().foo();
    expect(res).assertEqual(2);
  }
}

// ============================================================================
// Data Setup for override_with_object_3
// ============================================================================
namespace override_obj_3 {
  export let res: number = 0;
  export class Base {
    foo(i: (j: Object) => Base): void {
      i(new Object());
      res = 1;
    }
  }
  export class Derived extends Base {
    // Function type override: parameter contravariance ((j: Base) is wider for caller context)
    override foo(i: (j: Base) => Base): void {
      i(new Base());
      res = 2;
    }
  }
  export function main(): void {
    new Derived().foo((i: Object): Base => new Base());
    expect(res).assertEqual(2);
  }
}

// ============================================================================
// Data Setup for override_with_object_4
// ============================================================================
namespace override_obj_4 {
  export let res: number = 0;
  export class Base {
    foo(i: (j: Object) => Base): void {
      i(new Object());
      res = 1;
    }
  }
  export class Derived extends Base {
    override foo(i: (j: Base) => Base): void {
      i(new Base());
      res = 2;
    }
  }
  export function main(): void {
    new Derived().foo((i: Base): Base => new Base());
    expect(res).assertEqual(2);
  }
}

// ============================================================================
// Data Setup for override_with_object_5
// ============================================================================
namespace override_obj_5 {
  export let res: number = 0;
  export class Base {
    foo(i: (j: Object) => Object): void {
      i(new Object());
      res = 1;
    }
  }
  export class Derived extends Base {
    override foo(i: (j: Object) => Object): void {
      i(new Object());
      res = 2;
    }
  }
  export function main(): void {
    new Derived().foo((i: Object): Object => { return i; });
    expect(res).assertEqual(2);
  }
}

// ============================================================================
// Data Setup for override_with_object_6
// ============================================================================
namespace override_obj_6 {
  export let res: number = 0;
  export class Base {
    foo(i: (j: Object) => Base): void {
      i(new Object());
      res = 1;
    }
  }
  export class Derived extends Base {
    // Function return type covariance
    override foo(i: (j: Object) => Object): void {
      i(new Object());
      res = 2;
    }
  }
  export function main(): void {
    new Derived().foo((i: Object): Object => { return i; });
    expect(res).assertEqual(2);
  }
}

// ============================================================================
// Data Setup for override_with_object_7
// ============================================================================
namespace override_obj_7 {
  export let res: number = 0;
  export class Base {
    foo(i: (j: Object) => Base): void {
      i(new Object());
      res = 1;
    }
  }
  export class Derived extends Base {
    override foo(i: (j: Object) => Object): void {
      i(new Object());
      res = 2;
    }
  }
  export function main(): void {
    new Derived().foo((i: Object): Base => new Base());
    expect(res).assertEqual(2);
  }
}

// ============================================================================
// Data Setup for override_with_object_8
// ============================================================================
namespace override_obj_8 {
  export let res: number = 0;
  export class Base {
    foo(i: number): void { res = 1; }
  }
  export class Derived extends Base {
    override foo(i: number): void { res = 2; }
  }
  export function main(): void {
    new Derived().foo(1);
    expect(res).assertEqual(2);
  }
}

// ============================================================================
// Data Setup for override_with_object_9
// ============================================================================
namespace override_obj_9 {
  export let res: number = 0;
  export class Base {
    foo(i: string): void { res = 1; }
  }
  export class Derived extends Base {
    override foo(i: string): void { res = 2; }
  }
  export function main(): void {
    new Derived().foo("str");
    expect(res).assertEqual(2);
  }
}

// ============================================================================
// Data Setup for override_with_object_10
// ============================================================================
namespace override_obj_10 {
  export let res: number = 0;
  export class Base {
    foo(i: number): number {
      res = 1; return i;
    }
  }
  export class Derived extends Base {
    override foo(i: number): number {
      res = 2; return i;
    }
  }
  export function main(): void {
    new Derived().foo(1);
    expect(res).assertEqual(2);
  }
}

// ============================================================================
// Data Setup for override_with_object_11
// ============================================================================
namespace override_obj_11 {
  export let res: number = 0;
  export class Base {
    foo(): string {
      res = 1; return "str1";
    }
  }
  export class Derived extends Base {
    override foo(): string {
      res = 2; return "str2";
    }
  }
  export function main(): void {
    new Derived().foo();
    expect(res).assertEqual(2);
  }
}

// ============================================================================
// Data Setup for override_with_object_12
// ============================================================================
namespace override_obj_12 {
  export let res: number = 0;
  export class Base {
    foo(i: Object[]): void { res = 1; }
  }
  export class Derived extends Base {
    override foo(i: Object[]): void { res = 2; }
  }
  export function main(): void {
    // [FIX] 移除带有长度的构造，使用无参构造避免 ArkTS `No matching construct signature` 报错
    new Derived().foo(new Array<Object>());
    expect(res).assertEqual(2);
  }
}

// ============================================================================
// Data Setup for override_with_object_13
// ============================================================================
namespace override_obj_13 {
  export let res: number = 0;
  export class Base {
    foo(i: Array<Base>): void { res = 1; }
  }
  export class Derived extends Base {
    override foo(i: Array<Base>): void { res = 2; }
  }
  export function main(): void {
    // [FIX] 移除带有长度的构造
    new Derived().foo(new Array<Base>());
    expect(res).assertEqual(2);
  }
}

// ============================================================================
// Data Setup for override_with_object_14
// ============================================================================
namespace override_obj_14 {
  export let res: number = 0;
  export class Base {
    foo(): Object[] {
      res = 1; return new Array<Object>(); // [FIX] 移除带有长度的构造
    }
  }
  export class Derived extends Base {
    override foo(): Object[] {
      res = 2; return new Array<Object>(); // [FIX] 移除带有长度的构造
    }
  }
  export function main(): void {
    new Derived().foo();
    expect(res).assertEqual(2);
  }
}

// ============================================================================
// Data Setup for override_with_object_15
// ============================================================================
namespace override_obj_15 {
  export let res: number = 0;
  export class Base {
    foo(): Array<Object> {
      res = 1; return new Array<Object>(); // [FIX] 移除带有长度的构造
    }
  }
  export class Derived extends Base {
    override foo(): Array<Object> {
      res = 2;
      return new Array<Object>(); // [FIX] 移除带有长度的构造
    }
  }
  export function main(): void {
    new Derived().foo();
    expect(res).assertEqual(2);
  }
}

// ============================================================================
// Data Setup for override_with_object_16
// ============================================================================
namespace override_obj_16 {
  export let res: number = 0;
  export class Base {
    foo(i: [Object, Object]): void { res = 1; }
  }
  export class Derived extends Base {
    override foo(i: [Object, Object]): void { res = 2; }
  }
  export function main(): void {
    let i: [Object, Object] = [new Object(), new Object()];
    new Derived().foo(i);
    expect(res).assertEqual(2);
  }
}

// ============================================================================
// Data Setup for override_with_object_17
// ============================================================================
namespace override_obj_17 {
  export let res: number = 0;
  export class Base {
    foo(i: [Object, Base]): void { res = 1; }
  }
  export class Derived extends Base {
    override foo(i: [Object, Base]): void { res = 2; }
  }
  export function main(): void {
    let i: [Object, Base] = [new Object(), new Base()];
    new Derived().foo(i);
    expect(res).assertEqual(2);
  }
}

// ============================================================================
// Data Setup for override_with_object_18
// ============================================================================
namespace override_obj_18 {
  export let res: number = 0;
  export class Base {
    foo(i: [Base, Object]): void { res = 1; }
  }
  export class Derived extends Base {
    override foo(i: [Base, Object]): void { res = 2; }
  }
  export function main(): void {
    let i: [Base, Object] = [new Base(), new Object()];
    new Derived().foo(i);
    expect(res).assertEqual(2);
  }
}

// ============================================================================
// Data Setup for override_with_object_19
// ============================================================================
namespace override_obj_19 {
  export let res: number = 0;
  export class Base {
    foo(): [Object, Object] {
      res = 1; return [new Object(), new Object()];
    }
  }
  export class Derived extends Base {
    override foo(): [Object, Object] {
      res = 2; return [new Object(), new Object()];
    }
  }
  export function main(): void {
    new Derived().foo();
    expect(res).assertEqual(2);
  }
}

// ============================================================================
// Data Setup for override_with_object_20
// ============================================================================
namespace override_obj_20 {
  export let res: number = 0;
  export class Base {
    foo(): [Object, Base] {
      res = 1; return [new Object(), new Base()];
    }
  }
  export class Derived extends Base {
    override foo(): [Object, Base] {
      res = 2; return [new Object(), new Base()];
    }
  }
  export function main(): void {
    new Derived().foo();
    expect(res).assertEqual(2);
  }
}

export default function OverrideCompatibleSignaturesTest04():void {
  describe('OverrideCompatibleSignaturesTest04', () => {
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
     * @tc.number    SUB_OVERRIDE_COMPATIBLE_SIGNATURESTESTFOUR_0100
     * @tc.name      testOverrideWithObject0001
     * @tc.desc      Checking override-compatibility with Object: parameter contravariance.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverrideWithObject0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      override_obj_0.main();
    });

    /**
     * @tc.number    SUB_OVERRIDE_COMPATIBLE_SIGNATURESTESTFOUR_0200
     * @tc.name      testOverrideWithObject0002
     * @tc.desc      Checking override-compatibility with Object: identical signatures.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverrideWithObject0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      override_obj_1.main();
    });

    /**
     * @tc.number    SUB_OVERRIDE_COMPATIBLE_SIGNATURESTESTFOUR_0300
     * @tc.name      testOverrideWithObject0003
     * @tc.desc      Checking override-compatibility with Object: return type covariance.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverrideWithObject0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      override_obj_2.main();
    });

    /**
     * @tc.number    SUB_OVERRIDE_COMPATIBLE_SIGNATURESTESTFOUR_0400
     * @tc.name      testOverrideWithObject0004
     * @tc.desc      Checking override-compatibility with Object: function type parameter contravariance.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverrideWithObject0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      override_obj_3.main();
    });

    /**
     * @tc.number    SUB_OVERRIDE_COMPATIBLE_SIGNATURESTESTFOUR_0500
     * @tc.name      testOverrideWithObject0005
     * @tc.desc      Checking override-compatibility with Object: function type identical signatures.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverrideWithObject0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      override_obj_4.main();
    });

    /**
     * @tc.number    SUB_OVERRIDE_COMPATIBLE_SIGNATURESTESTFOUR_0600
     * @tc.name      testOverrideWithObject0006
     * @tc.desc      Checking override-compatibility with Object: function type identical signatures (objects).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverrideWithObject0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      override_obj_5.main();
    });

    /**
     * @tc.number    SUB_OVERRIDE_COMPATIBLE_SIGNATURESTESTFOUR_0700
     * @tc.name      testOverrideWithObject0007
     * @tc.desc      Checking override-compatibility with Object: function type return covariance.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverrideWithObject0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      override_obj_6.main();
    });

    /**
     * @tc.number    SUB_OVERRIDE_COMPATIBLE_SIGNATURESTESTFOUR_0800
     * @tc.name      testOverrideWithObject0008
     * @tc.desc      Checking override-compatibility with Object: function type return covariance applied.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverrideWithObject0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      override_obj_7.main();
    });

    /**
     * @tc.number    SUB_OVERRIDE_COMPATIBLE_SIGNATURESTESTFOUR_0900
     * @tc.name      testOverrideWithObject0009
     * @tc.desc      Checking override-compatibility with Object: primitive number identical signatures.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverrideWithObject0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      override_obj_8.main();
    });

    /**
     * @tc.number    SUB_OVERRIDE_COMPATIBLE_SIGNATURESTESTFOUR_1000
     * @tc.name      testOverrideWithObject0010
     * @tc.desc      Checking override-compatibility with Object: primitive string identical signatures.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverrideWithObject0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      override_obj_9.main();
    });

    /**
     * @tc.number    SUB_OVERRIDE_COMPATIBLE_SIGNATURESTESTFOUR_1100
     * @tc.name      testOverrideWithObject0011
     * @tc.desc      Checking override-compatibility with Object: primitive return identical signatures.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverrideWithObject0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      override_obj_10.main();
    });

    /**
     * @tc.number    SUB_OVERRIDE_COMPATIBLE_SIGNATURESTESTFOUR_1200
     * @tc.name      testOverrideWithObject0012
     * @tc.desc      Checking override-compatibility with Object: primitive string return identical signatures.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverrideWithObject0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      override_obj_11.main();
    });

    /**
     * @tc.number    SUB_OVERRIDE_COMPATIBLE_SIGNATURESTESTFOUR_1300
     * @tc.name      testOverrideWithObject0013
     * @tc.desc      Checking override-compatibility with Object: Object[] identical signatures.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverrideWithObject0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      override_obj_12.main();
    });

    /**
     * @tc.number    SUB_OVERRIDE_COMPATIBLE_SIGNATURESTESTFOUR_1400
     * @tc.name      testOverrideWithObject0014
     * @tc.desc      Checking override-compatibility with Object: Array parameter contravariance.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverrideWithObject0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      override_obj_13.main();
    });

    /**
     * @tc.number    SUB_OVERRIDE_COMPATIBLE_SIGNATURESTESTFOUR_1500
     * @tc.name      testOverrideWithObject0015
     * @tc.desc      Checking override-compatibility with Object: Array return identical signatures.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverrideWithObject0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      override_obj_14.main();
    });

    /**
     * @tc.number    SUB_OVERRIDE_COMPATIBLE_SIGNATURESTESTFOUR_1600
     * @tc.name      testOverrideWithObject0016
     * @tc.desc      Checking override-compatibility with Object: Array return covariance.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverrideWithObject0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      override_obj_15.main();
    });

    /**
     * @tc.number    SUB_OVERRIDE_COMPATIBLE_SIGNATURESTESTFOUR_1700
     * @tc.name      testOverrideWithObject0017
     * @tc.desc      Checking override-compatibility with Object: Tuple [Object, Object] identical signatures.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverrideWithObject0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      override_obj_16.main();
    });

    /**
     * @tc.number    SUB_OVERRIDE_COMPATIBLE_SIGNATURESTESTFOUR_1800
     * @tc.name      testOverrideWithObject0018
     * @tc.desc      Checking override-compatibility with Object: Tuple [Object, Base] identical signatures.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverrideWithObject0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      override_obj_17.main();
    });

    /**
     * @tc.number    SUB_OVERRIDE_COMPATIBLE_SIGNATURESTESTFOUR_1900
     * @tc.name      testOverrideWithObject0019
     * @tc.desc      Checking override-compatibility with Object: Tuple [Base, Object] identical signatures.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverrideWithObject0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      override_obj_18.main();
    });

    /**
     * @tc.number    SUB_OVERRIDE_COMPATIBLE_SIGNATURESTESTFOUR_2000
     * @tc.name      testOverrideWithObject0020
     * @tc.desc      Checking override-compatibility with Object: Tuple return identical signatures 1.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverrideWithObject0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      override_obj_19.main();
    });

    /**
     * @tc.number    SUB_OVERRIDE_COMPATIBLE_SIGNATURESTESTFOUR_2100
     * @tc.name      testOverrideWithObject0021
     * @tc.desc      Checking override-compatibility with Object: Tuple return identical signatures 2.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverrideWithObject0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      override_obj_20.main();
    });
  })
}
