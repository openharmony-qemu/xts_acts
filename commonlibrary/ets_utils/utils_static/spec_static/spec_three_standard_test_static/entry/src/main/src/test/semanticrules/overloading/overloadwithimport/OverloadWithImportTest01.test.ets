'use static';
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
// Data Setup for extended_class_methods_overload_0
// ============================================================================
namespace ext_overload_0 {
  export class A {
    a: string = "a";
    foo(x: A): string { return this.a; }
  }
  export class B extends A {
    a: string = "b";
    foo(x: A): string { return this.a; }
  }
  export class C extends B {
    a: string = "c";
    foo(x: A): string { return this.a; }
  }

  export function testCompileTime(a: A): string {
    return a.foo(a);
  }
}

// ============================================================================
// Data Setup for extended_class_methods_overload_1
// ============================================================================
namespace ext_overload_1 {
  export class A {
    a: string = "a";
    foo(x: A): string { return this.a; }
  }
  export class B extends A {
    a: string = "b";
    foo(x: A): string { return this.a; }
  }
  export class C extends B {
    a: string = "c";
    foo(x: A): string { return this.a; }
  }

  export function testCompileTime(a: A): string {
    return a.foo(a);
  }
}

// ============================================================================
// Data Setup for extended_class_methods_overload_2
// ============================================================================
namespace ext_overload_2 {
  export class A {
    a: string = "a";
    foo(x: A): string { return this.a; }
  }
  export class B extends A {
    a: string = "b";
    foo(x: A): string { return this.a; }
  }
  export class C extends B {
    a: string = "c";
    foo(x: A): string { return this.a; }
  }

  export function testCompileTime(a: A): string {
    return a.foo(a);
  }
}

// ============================================================================
// Data Setup for extended_class_methods_overload_3
// ============================================================================
namespace ext_overload_3 {
  export class A {
    a: string = "a";
    foo(x: A): string { return this.a; }
  }
  export class B extends A {
    a: string = "b";
    foo(x: A): string { return this.a; }
  }
  export class C extends B {
    a: string = "c";
    foo(x: A): string { return this.a; }
  }

  export function testSmartType(a: A): string {
    if (a instanceof C) {
      return a.foo(a);
    }
    if (a instanceof B) {
      return a.foo(a);
    }
    if (a instanceof A) {
      return a.foo(a);
    }
    return "";
  }
}

// ============================================================================
// Data Setup for extended_class_methods_overload_4
// ============================================================================
namespace ext_overload_4 {
  export class A {
    a: string = "a";
    foo(x: A): string { return this.a; }
  }
  export class B extends A {
    a: string = "b";
    foo(x: A): string { return this.a; }
  }
  export class C extends B {
    a: string = "c";
    foo(x: A): string { return this.a; }
  }

  export function testSmartType(a: A): string {
    if (a instanceof C) {
      return a.foo(a);
    }
    if (a instanceof B) {
      return a.foo(a);
    }
    if (a instanceof A) {
      return a.foo(a);
    }
    return "";
  }
}

// ============================================================================
// Data Setup for extended_class_methods_overload_5
// ============================================================================
namespace ext_overload_5 {
  export class A {
    a: string = "a";
    foo(x: A): string { return this.a; }
  }
  export class B extends A {
    a: string = "b";
    foo(x: A): string { return this.a; }
  }
  export class C extends B {
    a: string = "c";
    foo(x: A): string { return this.a; }
  }

  export function testSmartType(a: A): string {
    if (a instanceof C) {
      return a.foo(a);
    }
    if (a instanceof B) {
      return a.foo(a);
    }
    if (a instanceof A) {
      return a.foo(a);
    }
    return "";
  }
}

export default function OverloadWithImportTestOne():void {
  describe('OverloadWithImportTestOne', () => {
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
     * @tc.number    SUB_OVERLOAD_WITH_IMPORTTESTONE_0100
     * @tc.name      testExtendedClassMethodsOverload0001
     * @tc.desc      Overload resolution for instance method overload using compile-time type `A`.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExtendedClassMethodsOverload0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ext_overload_0.testCompileTime(new ext_overload_0.A())).assertEqual('a');
    });

    /**
     * @tc.number    SUB_OVERLOAD_WITH_IMPORTTESTONE_0200
     * @tc.name      testExtendedClassMethodsOverload0002
     * @tc.desc      Overload resolution for instance method overload using compile-time type `A` instantiated with `B`.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExtendedClassMethodsOverload0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // Dynamic dispatch ensures the subclass `foo` is called which returns its localized `a` property
      expect(ext_overload_1.testCompileTime(new ext_overload_1.B())).assertEqual('b');
    });

    /**
     * @tc.number    SUB_OVERLOAD_WITH_IMPORTTESTONE_0300
     * @tc.name      testExtendedClassMethodsOverload0003
     * @tc.desc      Overload resolution for instance method overload using compile-time type `A` instantiated with `C`.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExtendedClassMethodsOverload0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ext_overload_2.testCompileTime(new ext_overload_2.C())).assertEqual('c');
    });

    /**
     * @tc.number    SUB_OVERLOAD_WITH_IMPORTTESTONE_0400
     * @tc.name      testExtendedClassMethodsOverload0004
     * @tc.desc      Overload resolution for instance method overload using smart type checking for `A`.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExtendedClassMethodsOverload0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ext_overload_3.testSmartType(new ext_overload_3.A())).assertEqual('a');
    });

    /**
     * @tc.number    SUB_OVERLOAD_WITH_IMPORTTESTONE_0500
     * @tc.name      testExtendedClassMethodsOverload0005
     * @tc.desc      Overload resolution for instance method overload using smart type checking for `B`.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExtendedClassMethodsOverload0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ext_overload_4.testSmartType(new ext_overload_4.B())).assertEqual('b');
    });

    /**
     * @tc.number    SUB_OVERLOAD_WITH_IMPORTTESTONE_0600
     * @tc.name      testExtendedClassMethodsOverload0006
     * @tc.desc      Overload resolution for instance method overload using smart type checking for `C`.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExtendedClassMethodsOverload0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ext_overload_5.testSmartType(new ext_overload_5.C())).assertEqual('c');
    });

  })
}