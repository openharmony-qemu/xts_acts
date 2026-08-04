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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '../../../../../hypium/index';
import Utils from '../../Util.test'


class A<T> {
  foo(p: T): T {
    return p;
  }
}

class A1<T> {
  foo(p: T): NonNullable<T> {
    return p!;
  }
}

class A2 {
  value: string;
  constructor(value: string) {
    this.value = value;
  }
}

class B<T extends A2 | null> {
  foo(p: T): NonNullable<T> {
    return p!;
  }
}

class A3 {
  value: string;
  constructor(value: string) {
    this.value = value;
  }
}

class B1<T extends A3 | undefined> {
  foo(p: T): NonNullable<T> {
    return p!;
  }
}

class A4 {
  value: string;
  constructor(value: string) {
    this.value = value;
  }
}

class B2<T extends A4 | null> {
  foo(p: T): NonNullable<T> {
    return p!;
  }
}

class A5 {
  value: string;
  constructor(value: string) {
    this.value = value;
  }
}

class B3<T extends A5 | undefined> {
  foo(p: T): NonNullable<T> {
    return p!;
  }
}

class A6<T> {
  foo(p: T): T {
    return p;
  }
}

class A7<T> {
  foo(p: T): T {
    return p;
  }
}

class A8 {
  value: string;
  constructor(value: string) {
    this.value = value;
  }
}

class B4<T extends A8 | null> {
  foo(p: T): T {
    return p;
  }
}

class A9 {
  value: string;
  constructor(value: string) {
    this.value = value;
  }
}

class B5<T extends A9 | undefined> {
  foo(p: T): T {
    return p;
  }
}

class A10 {
  value: string;
  constructor(value: string) {
    this.value = value;
  }
}

class B6<T extends A10 | null> {
  foo(p: T): T {
    return p;
  }
}

class A11 {
  value: string;
  constructor(value: string) {
    this.value = value;
  }
}

class B7<T extends A11 | undefined> {
  foo(p: T): T {
    return p;
  }
}

export default function GenericsExperimentalTest(): void {
  describe('GenericsExperimentalTest', () => {
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
     * @tc.number    SUB_GENERICS_EXPERIMENTAL_XTSTEST_0100
     * @tc.name      testGenericsExperimental0001
     * @tc.desc      desc: Non-mandatory return of non-empty instance generic testing.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericsExperimental0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, ():void => {
      let a = new A<Object>();
      let result = a.foo(new Object());
      expect(result !== null && result !== undefined).assertEqual(true);
    });

    /**
     * @tc.number    SUB_GENERICS_EXPERIMENTAL_XTSTEST_0200
     * @tc.name      testGenericsExperimental0002
     * @tc.desc      desc: Force return of non-empty generic instance, using object as generic type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericsExperimental0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, ():void => {
      let a = new A1<Object>();
      let result = a.foo(new Object());
      expect(result!== null && result!== undefined).assertEqual(true);
    });

    /**
     * @tc.number    SUB_GENERICS_EXPERIMENTAL_XTSTEST_0300
     * @tc.name      testGenericsExperimental0003
     * @tc.desc      desc: Force return of a non-empty generic instance, Using an inherited union type
                     object | null. Using object as generic type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericsExperimental0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, ():void => {
      let b = new B<A2>();
      let result = b.foo(new A2("test"));
      expect(result!== null).assertEqual(true);
    });

    /**
     * @tc.number    SUB_GENERICS_EXPERIMENTAL_XTSTEST_0400
     * @tc.name      testGenericsExperimental0004
     * @tc.desc      desc: Force return of a non-empty generic instance, Using an inherited union type
                     object | undefined. Using object as generic type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericsExperimental0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, ():void => {
      let b = new B1<A3>();
      let result = b.foo(new A3("test"));
      expect(result!== undefined).assertEqual(true);
    });

    /**
     * @tc.number    SUB_GENERICS_EXPERIMENTAL_XTSTEST_0500
     * @tc.name      testGenericsExperimental0005
     * @tc.desc      desc: Force return of a non-empty generic instance, Using an inherited union type
                     object | null. Using null as generic type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericsExperimental0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, ():void => {
      let b = new B2<null>();
      let hasThrown = false;
      try {
        let result = b.foo(null);
      } catch (e) {
        if (e instanceof NullPointerError) {
          hasThrown = true;
        }
      }
      expect(hasThrown).assertEqual(true);
    });

    /**
     * @tc.number    SUB_GENERICS_EXPERIMENTAL_XTSTEST_0600
     * @tc.name      testGenericsExperimental0006
     * @tc.desc      desc: Force return of a non-empty generic instance, Using an inherited union type
                     object | undefined. Using undefined as generic type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericsExperimental0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, ():void => {
      let b = new B3<undefined>();
      let hasThrown = false;
      try {
        let result = b.foo(undefined);
      } catch (e) {
        if (e instanceof NullPointerError) {
          hasThrown = true;
        }
      }
      expect(hasThrown).assertEqual(true);
    });

    /**
     * @tc.number    SUB_GENERICS_EXPERIMENTAL_XTSTEST_0700
     * @tc.name      testGenericsExperimental0007
     * @tc.desc      desc: Non-mandatory return of non-empty instance generic test, using undefined as
                     type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericsExperimental0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, ():void => {
      let a = new A6<undefined>();
      let result = a.foo(undefined);
      expect(result === undefined).assertEqual(true);
    });

    /**
     * @tc.number    SUB_GENERICS_EXPERIMENTAL_XTSTEST_0800
     * @tc.name      testGenericsExperimental0008
     * @tc.desc      desc: Non-mandatory return of a non-empty instance generic test, using null as the
                     type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericsExperimental0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, ():void => {
      let a = new A7<null>();
      let result = a.foo(null);
      expect(result === null).assertEqual(true);
    });

    /**
     * @tc.number    SUB_GENERICS_EXPERIMENTAL_XTSTEST_0900
     * @tc.name      testGenericsExperimental0009
     * @tc.desc      desc: Non-mandatory return of a non-empty generic instance, Using an inherited union
                     type object | null. Using object as generic type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericsExperimental0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, ():void => {
      let b = new B4<A8>();
      let result = b.foo(new A8("test"));
      expect(result !== null).assertEqual(true);
    });

    /**
     * @tc.number    SUB_GENERICS_EXPERIMENTAL_XTSTEST_1000
     * @tc.name      testGenericsExperimental0010
     * @tc.desc      desc: Non-mandatory return of a non-empty generic instance, Using an inherited union
                     type object | undefined. Using object as generic type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericsExperimental0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, ():void => {
      let b = new B5<A9>();
      let result = b.foo(new A9("test"));
      expect(result !== null).assertEqual(true);
    });

    /**
     * @tc.number    SUB_GENERICS_EXPERIMENTAL_XTSTEST_1100
     * @tc.name      testGenericsExperimental0011
     * @tc.desc      desc: Non-mandatory  return of a non-empty generic instance, Using an inherited union
                     type object | null. Using null as generic type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericsExperimental0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, ():void => {
      let b = new B6<null>();
      let result = b.foo(null);
      expect(result === null).assertEqual(true);
    });

    /**
     * @tc.number    SUB_GENERICS_EXPERIMENTAL_XTSTEST_1200
     * @tc.name      testGenericsExperimental0012
     * @tc.desc      desc: Non-mandatoryreturn of a non-empty generic instance, Using an inherited union
                     type object | undefined. Using undefined as generic type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericsExperimental0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, ():void => {
      let b = new B7<undefined>();
      let result = b.foo(undefined);
      expect(result === undefined).assertEqual(true);
    });
  })
}