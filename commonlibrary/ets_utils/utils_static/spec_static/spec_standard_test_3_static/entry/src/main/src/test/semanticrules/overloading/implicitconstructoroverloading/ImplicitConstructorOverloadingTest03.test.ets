
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
// Data Setup for overload_constructor_0
// ============================================================================
namespace overload_constructor_0 {
  export class FuncTest {
    public str: string = '';

    constructor() { this.str = '100'; }
    constructor(x: number) { this.str = 'int: ' + x; }
    constructor(x: string) { this.str = 'string: ' + x; }
  }

  export function main(): void {
    let ft: FuncTest = new FuncTest();
    expect(ft.str).assertEqual('100');
  }
}

// ============================================================================
// Data Setup for overload_constructor_1
// ============================================================================
namespace overload_constructor_1 {
  export class FuncTest {
    public str: string = '';

    constructor() { this.str = '100'; }
    constructor(x: number) { this.str = 'int: ' + x; }
    constructor(x: boolean) { this.str = 'bool: ' + x; }
  }

  export function main(): void {
    let ft: FuncTest = new FuncTest();
    expect(ft.str).assertEqual('100');
  }
}

// ============================================================================
// Data Setup for overload_constructor_2
// ============================================================================
namespace overload_constructor_2 {
  export class FuncTest {
    public str: string = '';

    constructor() { this.str = '100'; }
    constructor(x: number) { this.str = 'number: ' + x; }
    constructor(x: number, y: number) { this.str = 'multi'; }
  }

  export function main(): void {
    let ft: FuncTest = new FuncTest();
    expect(ft.str).assertEqual('100');
  }
}

// ============================================================================
// Data Setup for overload_constructor_3
// ============================================================================
namespace overload_constructor_3 {
  export class FuncTest {
    public str: string = '';

    constructor() { this.str = '100'; }
    constructor(x: number) { this.str = 'int: ' + x; }
    constructor(x: Object) { this.str = 'obj'; }
  }

  export function main(): void {
    let ft: FuncTest = new FuncTest();
    expect(ft.str).assertEqual('100');
  }
}

// ============================================================================
// Data Setup for overload_constructor_4
// ============================================================================
namespace overload_constructor_4 {
  export class FuncTest {
    public str: string = '';

    constructor() { this.str = '100'; }
    constructor(x: number) { this.str = 'int: ' + x; }
    constructor(x: string) { this.str = 'string: ' + x; }
  }

  export function main(): void {
    let ft: FuncTest = new FuncTest(20);
    expect(ft.str).assertEqual('int: 20');
  }
}

// ============================================================================
// Data Setup for overload_constructor_5
// ============================================================================
namespace overload_constructor_5 {
  export class FuncTest {
    public str: string = '';

    constructor() { this.str = '100'; }
    constructor(x: number) { this.str = 'int: ' + x; }
    constructor(x: boolean) { this.str = 'bool: ' + x; }
  }

  export function main(): void {
    let ft: FuncTest = new FuncTest(10);
    expect(ft.str).assertEqual('int: 10');
  }
}

// ============================================================================
// Data Setup for overload_constructor_6
// ============================================================================
namespace overload_constructor_6 {
  export class FuncTest {
    public str: string = '';

    constructor() { this.str = '100'; }
    constructor(x: number) { this.str = 'number: ' + x; }
    constructor(x: number, y: number) { this.str = 'multi'; }
  }

  export function main(): void {
    let ft: FuncTest = new FuncTest(1.2);
    expect(ft.str).assertEqual('number: 1.2');
  }
}

// ============================================================================
// Data Setup for overload_constructor_7
// ============================================================================
namespace overload_constructor_7 {
  export class FuncTest {
    public str: string = '';

    constructor() { this.str = '100'; }
    constructor(x: number) { this.str = 'int: ' + x; }
    constructor(x: string) { this.str = 'string: ' + x; }
  }

  export function main(): void {
    let ft: FuncTest = new FuncTest("Hello!");
    expect(ft.str).assertEqual('string: Hello!');
  }
}

// ============================================================================
// Data Setup for overload_constructor_8
// ============================================================================
namespace overload_constructor_8 {
  export class FuncTest {
    public str: string = '';

    constructor() { this.str = '100'; }
    constructor(x: number) { this.str = 'int: ' + x; }
    constructor(x: string) { this.str = 'string: ' + x; }
  }

  export function main(): void {
    let ft: FuncTest = new FuncTest(5);
    expect(ft.str).assertEqual('int: 5');
  }
}

// ============================================================================
// Data Setup for overload_constructor_9
// ============================================================================
namespace overload_constructor_9 {
  export class FuncTest {
    public str: string = '';

    constructor() { this.str = '100'; }
    constructor(x: number) { this.str = 'int: ' + x; }
    constructor(x: boolean) { this.str = 'bool: ' + x; }
  }

  export function main(): void {
    let ft: FuncTest = new FuncTest(5);
    expect(ft.str).assertEqual('int: 5');
  }
}

// ============================================================================
// Data Setup for overload_constructor_10
// ============================================================================
namespace overload_constructor_10 {
  export class FuncTest {
    public str: string = '';

    constructor() { this.str = '100'; }
    constructor(x: number) { this.str = 'int: ' + x; }
    constructor(x: number, y: number) { this.str = 'multi'; }
  }

  export function main(): void {
    let ft: FuncTest = new FuncTest(5);
    expect(ft.str).assertEqual('int: 5');
  }
}

// ============================================================================
// Data Setup for overload_constructor_11
// ============================================================================
namespace overload_constructor_11 {
  export class FuncTest {
    public str: string = '';

    constructor() { this.str = '100'; }
    constructor(x: number) { this.str = 'int: ' + x; }
    constructor(x: Object) { this.str = 'obj'; }
  }

  export function main(): void {
    let ft: FuncTest = new FuncTest(5);
    expect(ft.str).assertEqual('int: 5');
  }
}


export default function ImplicitConstructorOverloadingTest03():void {
  describe('ImplicitConstructorOverloadingTest03', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
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
      // This API supports only one parameter: clear action function.
    })

    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
     * @tc.number    SUB_IMPLICIT_CONSTRUCTOR_OVERLOADINGTESTTHREE_0100
     * @tc.name      testOverloadConstructor0001
     * @tc.desc      Check class constructor overload: zero-argument resolution against string.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadConstructor0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      overload_constructor_0.main();
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONSTRUCTOR_OVERLOADINGTESTTHREE_0200
     * @tc.name      testOverloadConstructor0002
     * @tc.desc      Check class constructor overload: zero-argument resolution against boolean.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadConstructor0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      overload_constructor_1.main();
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONSTRUCTOR_OVERLOADINGTESTTHREE_0300
     * @tc.name      testOverloadConstructor0003
     * @tc.desc      Check class constructor overload: zero-argument resolution against multi-arg.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadConstructor0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      overload_constructor_2.main();
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONSTRUCTOR_OVERLOADINGTESTTHREE_0400
     * @tc.name      testOverloadConstructor0004
     * @tc.desc      Check class constructor overload: zero-argument resolution against Object.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadConstructor0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      overload_constructor_3.main();
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONSTRUCTOR_OVERLOADINGTESTTHREE_0500
     * @tc.name      testOverloadConstructor0005
     * @tc.desc      Check class constructor overload: exact number parameter match vs string.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadConstructor0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      overload_constructor_4.main();
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONSTRUCTOR_OVERLOADINGTESTTHREE_0600
     * @tc.name      testOverloadConstructor0006
     * @tc.desc      Check class constructor overload: exact number parameter match vs boolean.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadConstructor0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      overload_constructor_5.main();
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONSTRUCTOR_OVERLOADINGTESTTHREE_0700
     * @tc.name      testOverloadConstructor0007
     * @tc.desc      Check class constructor overload: float number parameter match.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadConstructor0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      overload_constructor_6.main();
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONSTRUCTOR_OVERLOADINGTESTTHREE_0800
     * @tc.name      testOverloadConstructor0008
     * @tc.desc      Check class constructor overload: exact string parameter match.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadConstructor0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      overload_constructor_7.main();
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONSTRUCTOR_OVERLOADINGTESTTHREE_0900
     * @tc.name      testOverloadConstructor0009
     * @tc.desc      Check class constructor overload: literal integer resolution vs string.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadConstructor0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      overload_constructor_8.main();
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONSTRUCTOR_OVERLOADINGTESTTHREE_1000
     * @tc.name      testOverloadConstructor0010
     * @tc.desc      Check class constructor overload: literal integer resolution vs boolean.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadConstructor0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      overload_constructor_9.main();
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONSTRUCTOR_OVERLOADINGTESTTHREE_1100
     * @tc.name      testOverloadConstructor0011
     * @tc.desc      Check class constructor overload: literal integer resolution vs multi-arg.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadConstructor0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      overload_constructor_10.main();
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONSTRUCTOR_OVERLOADINGTESTTHREE_1200
     * @tc.name      testOverloadConstructor0012
     * @tc.desc      Check class constructor overload: literal integer resolution vs Object.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadConstructor0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      overload_constructor_11.main();
    });

  })
}