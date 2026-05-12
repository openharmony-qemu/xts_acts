/*---
 * Copyright (c) 2026 SwanLink (Jiangsu) Technology Development Co., LTD.
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

import {
  expect,
  describe,
  beforeAll,
  beforeEach,
  afterEach,
  afterAll,
  it,
  TestType,
  Size,
  Level
} from '../../../../../hypium/index';

async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}

class A {
  a: string = 'a'
}
type MyRecord = Record<string,A>

class C extends MyRecord {}

class D extends C {
  d: string = "d"
}

class A1 {
  a: string = 'a'
}
type MyAwaited = Awaited<Promise<A1>>

class C1 extends MyAwaited {}

class D1 extends C1 {
  d: string = "d"
}

class A2 {
  a: string = 'a'
}
type X = A2 | null | undefined
type NN = NonNullable<X>

class C2 extends NN {}

class D2 extends C2 {
  d: string = "d"
}


class D3 {
  value: number = 11
}
class F extends D3 {}

class A3<T> {
  value: T;

  constructor(value: T) {
    this.value = value;
  }

  getValue(): T {
    return this.value;
  }

  setValue(value: T): void {
    this.value = value;
  }
}

class B extends A3<number> {
  constructor(value: number) {
    super(value);
  }
}

class D4 {
  value: number = 11
}
class F1 extends D4 {}

class A4<T> {
  value: T;

  constructor(value: T) {
    this.value = value;
  }

  getValue(): T {
    return this.value;
  }

  setValue(value: T): void {
    this.value = value;
  }
}

class B1<T> extends A4<T> {
  constructor(value: T) {
    super(value);
  }
}

class D5 {
  value: number = 11
}
class F2 extends D5 {}

class A5<T> {
  value: T;

  constructor(value: T) {
    this.value = value;
  }

  getValue(): T {
    return this.value;
  }

  setValue(value: T): void {
    this.value = value;
  }
}

class B2<T extends number> extends A5<T> {
  constructor(value: T) {
    super(value);
  }
}

class D6 {
  value: number = 11
}
class F3 extends D6 {}

class A6<T> {
  value: T;

  constructor(value: T) {
    this.value = value;
  }

  getValue(): T {
    return this.value;
  }

  setValue(value: T): void {
    this.value = value;
  }
}

class B3<T extends D6> extends A6<T> {
  constructor(value: T) {
    super(value);
  }
}

class D7 {
  value: number = 11
}
class F4 extends D7 {}

class A7<T1,T2> {
  value: T1;

  constructor(value: T1) {
    this.value = value;
  }

  getValue(): T1 {
    return this.value;
  }

  setValue(value: T1): void {
    this.value = value;
  }
}

class B4<T extends D7> extends A7<T,number> {
  constructor(value: T) {
    super(value);
  }
}

class D8 {
  value: number = 11
}
class F5 extends D8 {}

class A8<T1,out T2 extends T1> {
  value: T1;

  constructor(value: T2) {
    this.value = value;
  }

  getValue(): T1 {
    return this.value;
  }

  setValue(value: T1): void {
    this.value = value;
  }
}

class B5<T extends D8> extends A8<D8,F5> {
  constructor(value: F5) {
    super(value);
  }
}

class D9 {
  value: number = 11
}
class F6 extends D9 {}

class A9<in T1 extends T2,T2> {
  value: T2;

  constructor(value: T2) {
    this.value = value;
  }

  getValue(): T2 {
    return this.value;
  }

  setValue(value: T1): void {
    this.value = value;
  }
}

class B6<T extends D9> extends A9<T,D9> {
  constructor(value: D9) {
    super(value);
  }
}


export default function ExtensionClausePositiveTest():void {
  describe('ExtensionClausePositiveTest', () => {
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
     * @tc.number    SUB_EXTENSION_CLAUSE_POSITIVE_0100
     * @tc.name      testExtensionClausePositive0001
     * @tc.desc      positive extension clause cases
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExtensionClausePositive0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testExtensionClausePositive0001';
      const d: D = new D
      d['a1'] = {a: "1"}
      d['a2'] = {a: "2"}
      expect(d['a1']?.a).assertEqual("1")
      expect(d['a2']?.a).assertEqual("2")
      expect(d.d).assertEqual('d')
    });

    /**
     * @tc.number    SUB_EXTENSION_CLAUSE_POSITIVE_0200
     * @tc.name      testExtensionClausePositive0002
     * @tc.desc      positive extension clause cases
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExtensionClausePositive0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testExtensionClausePositive0002';
      const d: D1 = new D1
      expect(d.a).assertEqual('a')
      expect(d.d).assertEqual('d')
    });

    /**
     * @tc.number    SUB_EXTENSION_CLAUSE_POSITIVE_0300
     * @tc.name      testExtensionClausePositive0003
     * @tc.desc      positive extension clause cases
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExtensionClausePositive0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testExtensionClausePositive0003';
      const d: D2 = new D2
      expect(d.a).assertEqual('a')
      expect(d.d).assertEqual('d')
    });

    /**
     * @tc.number    SUB_EXTENSION_CLAUSE_POSITIVE_0400
     * @tc.name      testExtensionClausePositive0004
     * @tc.desc      type arguments in classes with extends clause
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExtensionClausePositive0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testExtensionClausePositive0004';
      let b: B = new B(10)
      expect(b.value).assertEqual(10)
    });

    /**
     * @tc.number    SUB_EXTENSION_CLAUSE_POSITIVE_0500
     * @tc.name      testExtensionClausePositive0005
     * @tc.desc      type arguments in classes with extends clause
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExtensionClausePositive0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testExtensionClausePositive0005';
      let b: B1<number> = new B1<number>(10)
      expect(b.value).assertEqual(10)
    });

    /**
     * @tc.number    SUB_EXTENSION_CLAUSE_POSITIVE_0600
     * @tc.name      testExtensionClausePositive0006
     * @tc.desc      type arguments in classes with extends clause
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExtensionClausePositive0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testExtensionClausePositive0006';
      let b: B2<number> = new B2<number>(10)
      expect(b.value).assertEqual(10)
    });

    /**
     * @tc.number    SUB_EXTENSION_CLAUSE_POSITIVE_0700
     * @tc.name      testExtensionClausePositive0007
     * @tc.desc      type arguments in classes with extends clause
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExtensionClausePositive0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testExtensionClausePositive0007';
      let b: B3<D6> = new B3<D6>(new F3())
      expect(b.value.value).assertEqual(11)
    });

    /**
     * @tc.number    SUB_EXTENSION_CLAUSE_POSITIVE_0800
     * @tc.name      testExtensionClausePositive0008
     * @tc.desc      type arguments in classes with extends clause
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExtensionClausePositive0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testExtensionClausePositive0008';
      let b: B4<D7> = new B4<D7>(new F4())
      expect(b.value.value).assertEqual(11)
    });

    /**
     * @tc.number    SUB_EXTENSION_CLAUSE_POSITIVE_0800
     * @tc.name      testExtensionClausePositive0008
     * @tc.desc      type arguments in classes with extends clause
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExtensionClausePositive0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testExtensionClausePositive0008';
      let b: B5<D8> = new B5<D8>(new F5())
      expect(b.value.value).assertEqual(11)
    });

    /**
     * @tc.number    SUB_EXTENSION_CLAUSE_POSITIVE_0800
     * @tc.name      testExtensionClausePositive0008
     * @tc.desc      type arguments in classes with extends clause
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExtensionClausePositive0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testExtensionClausePositive0008';
      let b: B6<D9> = new B6<D9>(new F6())
      expect(b.value.value).assertEqual(11)
    });
  })
}
