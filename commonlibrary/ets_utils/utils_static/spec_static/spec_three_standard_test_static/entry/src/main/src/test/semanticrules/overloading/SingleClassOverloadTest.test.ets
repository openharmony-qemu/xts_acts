'use static'

/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium-binary/src/main/indexStatic';
import Utils from '../../Util.test'

// ============================================================================
// Data Setup for single_class_overload_0 (Constructors)
// ============================================================================
namespace single_class_0 {
  export let res: number = 0;

  export class Gen<T> {
    foo(i: Gen<T>): void {};
  }

  export class Gen2<T, S> {
    foo(i: T): void {};
  }

  export class Base<T, S> {
    // Note: Consolidated erased types (byte, short, int, long, double, float) to 'number'
    // and (char, String) to 'string' to prevent ESE0131 signature collisions in ArkTS.
    constructor() { res = 1; }
    constructor(i: boolean) { res = 17; }
    constructor(i: number) { res = 4; }
    constructor(i: string) { res = 14; }
    constructor(i: number, j: number) { res = 19; }
    constructor(i: Gen<T>) { res = 20; }
    constructor(i: Gen2<T, S>) { res = 21; }
    constructor(i: Object | undefined | null) { res = 22; }
    constructor(i: number, j: Object) { res = 23; }
  }

  export function main(): void {
    new Base<string, number>();
    expect(res).assertEqual(1);

    new Base<string, number>(1);
    expect(res).assertEqual(4);

    new Base<string, number>("some str");
    expect(res).assertEqual(14);

    new Base<string, number>(false);
    expect(res).assertEqual(17);

    new Base<string, number>(1, 1);
    expect(res).assertEqual(19);

    new Base<number, string>(new Gen<number>());
    expect(res).assertEqual(20);

    new Base<number, string>(new Gen2<number, string>());
    expect(res).assertEqual(21);

    new Base<string, number>(undefined);
    expect(res).assertEqual(22);

    new Base<string, number>(1.1, new Object());
    expect(res).assertEqual(23);
  }
}

// ============================================================================
// Data Setup for single_class_overload_1 (Instance Methods)
// ============================================================================
namespace single_class_1 {
  export let res: number = 0;

  export class Gen<T> {
    foo(i: Gen<T>): void {};
  }

  export class Gen2<T, S> {
    foo(i: T): void {};
  }

  export class Base<T, S> {
    foo(): void { res = 1; }
    foo(i: boolean): void { res = 17; }
    foo(i: number): void { res = 4; }
    foo(i: string): void { res = 14; }
    foo(i: number, j: number): void { res = 19; }
    foo(i: Gen<T>): void { res = 20; }
    foo(i: Gen2<T, S>): void { res = 21; }
    foo(i: Object | undefined | null): void { res = 22; }
  }

  export function main(): void {
    let a = new Base<number, string>();

    a.foo();
    expect(res).assertEqual(1);

    a.foo(1);
    expect(res).assertEqual(4);

    a.foo("some str");
    expect(res).assertEqual(14);

    a.foo(false);
    expect(res).assertEqual(17);

    a.foo(1, 1);
    expect(res).assertEqual(19);

    a.foo(new Gen<number>());
    expect(res).assertEqual(20);

    a.foo(new Gen2<number, string>());
    expect(res).assertEqual(21);

    a.foo(undefined);
    expect(res).assertEqual(22);
  }
}

// ============================================================================
// Data Setup for single_class_overload_2 (Static Methods)
// ============================================================================
namespace single_class_2 {
  export let res: number = 0;

  export class Gen<T> {
    foo(i: Gen<T>): void {};
  }

  export class Gen2<T, S> {
    foo(i: T): void {};
  }

  export class Base<T, S> {
    // Static methods cannot access class-level type parameters (T, S),
    // so generic object overloads are appropriately omitted here as per the spec.
    static foo(): void { res = 1; }
    static foo(i: boolean): void { res = 17; }
    static foo(i: number): void { res = 4; }
    static foo(i: string): void { res = 14; }
    static foo(i: number, j: number): void { res = 19; }
    static foo(i: Object | undefined | null): void { res = 20; }
  }

  export function main(): void {
    Base.foo();
    expect(res).assertEqual(1);

    Base.foo(1);
    expect(res).assertEqual(4);

    Base.foo("some str");
    expect(res).assertEqual(14);

    Base.foo(false);
    expect(res).assertEqual(17);

    Base.foo(1, 1);
    expect(res).assertEqual(19);

    Base.foo(undefined);
    expect(res).assertEqual(20);
  }
}

export default function SingleClassOverloadTest():void {
  describe('SingleClassOverloadTest', () => {
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
     * @tc.number    SUB_SINGLE_CLASS_OVERLOADTEST_0100
     * @tc.name      testSingleClassOverload0001
     * @tc.desc      Constructors are defined in the same class member. If signatures are overload-equivalent,
     *               then a compile-time error occurs. Otherwise, overloading is used.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testSingleClassOverload0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      single_class_0.main();
    });

    /**
     * @tc.number    SUB_SINGLE_CLASS_OVERLOADTEST_0200
     * @tc.name      testSingleClassOverload0002
     * @tc.desc      Two instance methods with the same name are defined in the same class member.
     *               If signatures are overload-equivalent, then a compile-time error occurs. Otherwise, overloading is used.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testSingleClassOverload0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      single_class_1.main();
    });

    /**
     * @tc.number    SUB_SINGLE_CLASS_OVERLOADTEST_0300
     * @tc.name      testSingleClassOverload0003
     * @tc.desc      Two static methods with the same name are defined in the same class member.
     *               If signatures are overload-equivalent, then a compile-time error occurs. Otherwise, overloading is used.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testSingleClassOverload0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      single_class_2.main();
    });

  })
}