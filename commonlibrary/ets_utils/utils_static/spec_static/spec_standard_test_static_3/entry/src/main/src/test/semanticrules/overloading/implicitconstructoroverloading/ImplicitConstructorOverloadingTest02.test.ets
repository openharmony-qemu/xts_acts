
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
// Data Setup for constructor_overload_0
// ============================================================================
namespace constructor_overload_0 {
  export let res: number = 0;
  export type TPL = [boolean, number];
  export type BoolFun = () => boolean;
  export class Gen<T> {}

  export class Base<T> {
    constructor() { res = 1; }
    constructor(i: number) { res = 2; }
    constructor(i: string) { res = 3; }
    constructor(i: Uint8Array) { res = 5; } // byte[] mapped to Uint8Array
    constructor(i: TPL) { res = 6; }
    constructor(i: BoolFun) { res = 7; }
    constructor(i: Object | undefined | null) { res = 8; }
    constructor(i: Gen<T>) { res = 9; }
  }

  export class Derived<T> extends Base<T> {
    constructor() { super(); res = 21; } // explicitly calling super()
  }

  export function main(): void {
    new Derived<number>();
    expect(res).assertEqual(21);
  }
}

// ============================================================================
// Data Setup for constructor_overload_1
// ============================================================================
namespace constructor_overload_1 {
  export let res: number = 0;
  export type TPL = [boolean, number];
  export type BoolFun = () => boolean;
  export class Gen<T> {}

  export class Base<T> {
    constructor() { res = 1; }
    constructor(i: number) { res = 2; }
    constructor(i: string) { res = 3; }
    constructor(i: Uint8Array) { res = 5; }
    constructor(i: TPL) { res = 6; }
    constructor(i: BoolFun) { res = 7; }
    constructor(i: Object | undefined | null) { res = 8; }
    constructor(i: Gen<T>) { res = 9; }
  }

  export class Derived<T> extends Base<T> {
    constructor() { super(); res += 20; }
  }

  export function main(): void {
    res = 0;
    new Derived<number>();
    expect(res).assertEqual(21); // 1 + 20
  }
}

// ============================================================================
// Data Setup for constructor_overload_2
// ============================================================================
namespace constructor_overload_2 {
  export let res: number = 0;
  export type TPL = [boolean, number];
  export type BoolFun = () => boolean;
  export class Gen<T> {}

  export class Base<T> {
    constructor() { res = 1; }
    constructor(i: number) { res = 2; }
    constructor(i: string) { res = 3; }
  }

  export class Derived<T> extends Base<T> {
    constructor() { super(1.1); res += 20; }
  }

  export function main(): void {
    res = 0;
    new Derived<number>();
    expect(res).assertEqual(22); // 2 + 20
  }
}

// ============================================================================
// Data Setup for constructor_overload_3
// ============================================================================
namespace constructor_overload_3 {
  export let res: number = 0;
  export class Base<T> {
    constructor() { res = 1; }
    constructor(i: number) { res = 2; }
    constructor(i: string) { res = 3; }
  }

  export class Derived<T> extends Base<T> {
    constructor() { super("some string"); res += 20; }
  }

  export function main(): void {
    res = 0;
    new Derived<number>();
    expect(res).assertEqual(23); // 3 + 20
  }
}

// ============================================================================
// Data Setup for constructor_overload_4
// ============================================================================
namespace constructor_overload_4 {
  export let res: number = 0;
  export class Base<T> {
    constructor() { res = 1; }
    constructor(i: number) { res = 2; }
  }

  export class Derived<T> extends Base<T> {
    constructor(i: number) { super(i); res = 21; } // ArkTS requires super call
  }

  export function main(): void {
    new Derived<number>(1.1);
    expect(res).assertEqual(21);
  }
}

// ============================================================================
// Data Setup for constructor_overload_5
// ============================================================================
namespace constructor_overload_5 {
  export let res: number = 0;
  export class Base<T> {
    constructor() { res = 1; }
    constructor(i: number) { res = 2; }
  }

  export class Derived<T> extends Base<T> {
    constructor(i: number) { super(); } // Delegating to 0-args base constructor
  }

  export function main(): void {
    new Derived<number>(1.1);
    expect(res).assertEqual(1);
  }
}

// ============================================================================
// Data Setup for constructor_overload_6
// ============================================================================
namespace constructor_overload_6 {
  export let res: number = 0;
  export class Base<T> {
    constructor() { res = 1; }
    constructor(i: number) { res = 2; }
  }

  export class Derived<T> extends Base<T> {
    constructor(i: number) { super(i); } // Delegating to matched arg constructor
  }

  export function main(): void {
    new Derived<number>(1.1);
    expect(res).assertEqual(2);
  }
}

// ============================================================================
// Data Setup for constructor_overload_7
// ============================================================================
namespace constructor_overload_7 {
  export let res: number = 0;
  export class Base<T> {
    constructor() { res = 1; }
    constructor(i: string) { res = 3; }
  }

  export class Derived<T> extends Base<T> {
    constructor(i: string) { super(i); res = 21; }
  }

  export function main(): void {
    new Derived<number>("some string");
    expect(res).assertEqual(21);
  }
}

// ============================================================================
// Data Setup for constructor_overload_8
// ============================================================================
namespace constructor_overload_8 {
  export let res: number = 0;
  export class Base<T> {
    constructor() { res = 1; }
    constructor(i: Object | undefined | null) { res = 8; }
  }

  export class Derived<T> extends Base<T> {
    constructor(i: Object) { super(i); res = 24; }
  }

  export function main(): void {
    new Derived<number>(new Object());
    expect(res).assertEqual(24);
  }
}

// ============================================================================
// Data Setup for constructor_overload_9
// ============================================================================
namespace constructor_overload_9 {
  export let res: number = 0;
  export class Base<T> {
    constructor() { res = 1; }
    constructor(i: Uint8Array) { res = 5; }
  }

  export class Derived<T> extends Base<T> {
    constructor(i: Uint8Array) { super(i); res = 25; }
  }

  export function main(): void {
    let a = new Uint8Array([1, 2]);
    new Derived<number>(a);
    expect(res).assertEqual(25);
  }
}

// ============================================================================
// Data Setup for constructor_overload_10
// ============================================================================
namespace constructor_overload_10 {
  export let res: number = 0;
  export type TPL = [boolean, number];
  export class Base<T> {
    constructor() { res = 1; }
    constructor(i: TPL) { res = 6; }
  }

  export class Derived<T> extends Base<T> {
    constructor(i: TPL) { super(i); res = 26; }
  }

  export function main(): void {
    let a: TPL = [false, 1.2];
    new Derived<number>(a);
    expect(res).assertEqual(26);
  }
}

// ============================================================================
// Data Setup for constructor_overload_11
// ============================================================================
namespace constructor_overload_11 {
  export let res: number = 0;
  export type BoolFun = () => boolean;
  export class Base<T> {
    constructor() { res = 1; }
    constructor(i: BoolFun) { res = 7; }
  }

  export class Derived<T> extends Base<T> {
    constructor(i: BoolFun) { super(i); res = 27; }
  }

  export function main(): void {
    new Derived<number>(() => { return true; });
    expect(res).assertEqual(27);
  }
}

// ============================================================================
// Data Setup for constructor_overload_12
// ============================================================================
namespace constructor_overload_12 {
  export let res: number = 0;
  export class Base<T> {
    constructor() { res = 1; }
    constructor(i: Object | undefined | null) { res = 8; }
  }

  export class Derived<T> extends Base<T> {
    constructor(i: Object | undefined | null) { super(i); res = 28; }
  }

  export function main(): void {
    new Derived<number>(undefined);
    expect(res).assertEqual(28);
  }
}

// ============================================================================
// Data Setup for constructor_overload_13
// ============================================================================
namespace constructor_overload_13 {
  export let res: number = 0;
  export class Base<T> {
    constructor() { res = 1; }
    constructor(i: Object | undefined | null) { res = 8; }
  }

  export class Derived<T> extends Base<T> {
    constructor(i: Object | undefined | null) { super(i); res = 28; }
  }

  export function main(): void {
    new Derived<number>(null);
    expect(res).assertEqual(28);
  }
}

// ============================================================================
// Data Setup for constructor_overload_14
// ============================================================================
namespace constructor_overload_14 {
  export let res: number = 0;
  export class Gen<T> {}
  export class Base<T> {
    constructor() { res = 1; }
    constructor(i: Gen<T>) { res = 9; }
  }

  export class Derived<T> extends Base<T> {
    constructor(i: Gen<T>) { super(i); res = 29; }
  }

  export function main(): void {
    new Derived<number>(new Gen<number>()); // mapped Byte to number generic
    expect(res).assertEqual(29);
  }
}


export default function ImplicitConstructorOverloadingTest02():void {
  describe('ImplicitConstructorOverloadingTest02', () => {
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
     * @tc.number    SUB_IMPLICIT_CONSTRUCTOR_OVERLOADINGTESTTWO_0100
     * @tc.name      testConstructorOverload0001
     * @tc.desc      Constructor is defined in a subclass (0-argument overriding without super increment).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstructorOverload0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      constructor_overload_0.main();
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONSTRUCTOR_OVERLOADINGTESTTWO_0200
     * @tc.name      testConstructorOverload0002
     * @tc.desc      Constructor is defined in a subclass. Testing super() delegation increment.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstructorOverload0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      constructor_overload_1.main();
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONSTRUCTOR_OVERLOADINGTESTTWO_0300
     * @tc.name      testConstructorOverload0003
     * @tc.desc      Constructor is defined in a subclass. Testing super(number) delegation.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstructorOverload0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      constructor_overload_2.main();
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONSTRUCTOR_OVERLOADINGTESTTWO_0400
     * @tc.name      testConstructorOverload0004
     * @tc.desc      Constructor is defined in a subclass. Testing super(string) delegation.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstructorOverload0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      constructor_overload_3.main();
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONSTRUCTOR_OVERLOADINGTESTTWO_0500
     * @tc.name      testConstructorOverload0005
     * @tc.desc      Constructor is defined in a subclass. Derived constructor matches arg but overrides behavior.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstructorOverload0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      constructor_overload_4.main();
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONSTRUCTOR_OVERLOADINGTESTTWO_0600
     * @tc.name      testConstructorOverload0006
     * @tc.desc      Constructor is defined in a subclass. Derived delegates explicitly to 0-arg base.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstructorOverload0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      constructor_overload_5.main();
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONSTRUCTOR_OVERLOADINGTESTTWO_0700
     * @tc.name      testConstructorOverload0007
     * @tc.desc      Constructor is defined in a subclass. Derived delegates directly to matching base constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstructorOverload0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      constructor_overload_6.main();
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONSTRUCTOR_OVERLOADINGTESTTWO_0800
     * @tc.name      testConstructorOverload0008
     * @tc.desc      Constructor is defined in a subclass. Derived overrides string constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstructorOverload0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      constructor_overload_7.main();
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONSTRUCTOR_OVERLOADINGTESTTWO_0900
     * @tc.name      testConstructorOverload0009
     * @tc.desc      Constructor is defined in a subclass. Derived overrides Object constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstructorOverload0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      constructor_overload_8.main();
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONSTRUCTOR_OVERLOADINGTESTTWO_1000
     * @tc.name      testConstructorOverload0010
     * @tc.desc      Constructor is defined in a subclass. Derived overrides Uint8Array constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstructorOverload0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      constructor_overload_9.main();
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONSTRUCTOR_OVERLOADINGTESTTWO_1100
     * @tc.name      testConstructorOverload0011
     * @tc.desc      Constructor is defined in a subclass. Derived overrides Tuple constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstructorOverload0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      constructor_overload_10.main();
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONSTRUCTOR_OVERLOADINGTESTTWO_1200
     * @tc.name      testConstructorOverload0012
     * @tc.desc      Constructor is defined in a subclass. Derived overrides Function parameter constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstructorOverload0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      constructor_overload_11.main();
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONSTRUCTOR_OVERLOADINGTESTTWO_1300
     * @tc.name      testConstructorOverload0013
     * @tc.desc      Constructor is defined in a subclass. Derived handles undefined explicitly.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstructorOverload0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      constructor_overload_12.main();
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONSTRUCTOR_OVERLOADINGTESTTWO_1400
     * @tc.name      testConstructorOverload0014
     * @tc.desc      Constructor is defined in a subclass. Derived handles null explicitly.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstructorOverload0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      constructor_overload_13.main();
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONSTRUCTOR_OVERLOADINGTESTTWO_1500
     * @tc.name      testConstructorOverload0015
     * @tc.desc      Constructor is defined in a subclass. Derived overrides Generic constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstructorOverload0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      constructor_overload_14.main();
    });

  })
}