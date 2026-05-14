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

class A_1 {
  a: string = 'a'
}
type MyAwaited = Awaited<Promise<A_1>>

class C_1 extends MyAwaited {}

class D_1 extends C_1 {
  d: string = "d"
}

class A_2 {
  a: string = 'a'
}
type X = A_2 | null | undefined
type NN = NonNullable<X>

class C_2 extends NN {}

class D_2 extends C_2 {
  d: string = "d"
}


class D_3 {
  value: number = 11
}
class F extends D_3 {}

class A_3<T> {
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

class B extends A_3<number> {
  constructor(value: number) {
    super(value);
  }
}

class D_4 {
  value: number = 11
}
class F_1 extends D_4 {}

class A_4<T> {
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

class B_1<T> extends A_4<T> {
  constructor(value: T) {
    super(value);
  }
}

class D_5 {
  value: number = 11
}
class F_2 extends D_5 {}

class A_5<T> {
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

class B_2<T extends number> extends A_5<T> {
  constructor(value: T) {
    super(value);
  }
}

class D_6 {
  value: number = 11
}
class F_3 extends D_6 {}

class A_6<T> {
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

class B_3<T extends D_6> extends A_6<T> {
  constructor(value: T) {
    super(value);
  }
}

class D_7 {
  value: number = 11
}
class F_4 extends D_7 {}

class A_7<T1,T2> {
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

class B_4<T extends D_7> extends A_7<T,number> {
  constructor(value: T) {
    super(value);
  }
}

class D_8 {
  value: number = 11
}
class F_5 extends D_8 {}

class A_8<T1,out T2 extends T1> {
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

class B_5<T extends D_8> extends A_8<D_8,F_5> {
  constructor(value: F_5) {
    super(value);
  }
}

class D_9 {
  value: number = 11
}
class F_6 extends D_9 {}

class A_9<in T1 extends T2,T2> {
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

class B_6<T extends D_9> extends A_9<T,D_9> {
  constructor(value: D_9) {
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
      const d: D_1 = new D_1
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
      const d: D_2 = new D_2
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
      let b: B_1<number> = new B_1<number>(10)
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
      let b: B_2<number> = new B_2<number>(10)
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
      let b: B_3<D_6> = new B_3<D_6>(new F_3())
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
      let b: B_4<D_7> = new B_4<D_7>(new F_4())
      expect(b.value.value).assertEqual(11)
    });

    /**
     * @tc.number    SUB_EXTENSION_CLAUSE_POSITIVE_0900
     * @tc.name      testExtensionClausePositive0009
     * @tc.desc      type arguments in classes with extends clause
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExtensionClausePositive0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testExtensionClausePositive0009';
      let b: B_5<D_8> = new B_5<D_8>(new F_5())
      expect(b.value.value).assertEqual(11)
    });

    /**
     * @tc.number    SUB_EXTENSION_CLAUSE_POSITIVE_1000
     * @tc.name      testExtensionClausePositive0010
     * @tc.desc      type arguments in classes with extends clause
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExtensionClausePositive0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testExtensionClausePositive0010';
      let b: B_6<D_9> = new B_6<D_9>(new F_6())
      expect(b.value.value).assertEqual(11)
    });
  })
}
