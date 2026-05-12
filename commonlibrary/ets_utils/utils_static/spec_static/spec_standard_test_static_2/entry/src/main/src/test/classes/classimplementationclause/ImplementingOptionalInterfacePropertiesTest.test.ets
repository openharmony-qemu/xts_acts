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

interface I {
  n?: number
}

class C implements I {}

interface I1 {
  n?: number
}

class C1 implements I1 {
  n?: number = 42
}

interface I2 {
  n?: number
}

class C2 implements I2 {}

interface I3 {
  n: number|undefined // Explicit form. See 10.4.2
}

class C3 implements I3 {
  n: number|undefined = 42
}

interface I4 {
  n: number|undefined // Explicit form. See 10.4.2
}

class C4 implements I4 {
  get n(): number|undefined {
    return 1
  }
  set n(i: number|undefined) {}
}

interface I5 {
  n?: number // Short form. See 10.4.2
}

class C5 implements I5 {
  n: number|undefined = 42
}

interface I6 {
  n?: number // Short form. See 10.4.2
}

class C6 implements I6 {
  get n(): number|undefined {
    return undefined
  }
}

interface I7 {
  n?: number // Short form. See 10.4.2
}

class C7 implements I7 {
  get n(): number|undefined {
    return 1
  }
  set n(i: number|undefined) {}
}


export default function ImplementingOptionalInterfacePropertiesTest():void {
  describe('ImplementingOptionalInterfacePropertiesTest', () => {
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
     * @tc.number    SUB_IMPLEMENTING_OPTIONAL_INTERFACE_PROPERTIESTEST_0100
     * @tc.name      testImplementingOptionalInterfaceProperties0001
     * @tc.desc      A class can implement Optional Interface Properties from superinterfaces or use implicitly defined
     * accessors from an interface
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplementingOptionalInterfaceProperties0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testImplementingOptionalInterfaceProperties0001';
      let c = new C()
      expect(c.n).assertEqual(undefined)
    });

    /**
     * @tc.number    SUB_IMPLEMENTING_OPTIONAL_INTERFACE_PROPERTIESTEST_0200
     * @tc.name      testImplementingOptionalInterfaceProperties0002
     * @tc.desc      A class can implement Optional Interface Properties from superinterfaces or use implicitly defined
     * accessors from an interface
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplementingOptionalInterfaceProperties0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testImplementingOptionalInterfaceProperties0002';
      let c = new C1()
      expect(c.n).assertEqual(42)
      c.n = 43
      expect(c.n).assertEqual(43)


    });

    /**
     * @tc.number    SUB_IMPLEMENTING_OPTIONAL_INTERFACE_PROPERTIESTEST_0300
     * @tc.name      testImplementingOptionalInterfaceProperties0003
     * @tc.desc      A class can implement Optional Interface Properties from superinterfaces or use implicitly defined
     * accessors from an interface
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplementingOptionalInterfaceProperties0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testImplementingOptionalInterfaceProperties0003';
      let c = new C2()
      try {
        c.n = 1
      } catch (e) {
        expect(e instanceof InvalidStoreAccessError).assertTrue();
      }


    });

    /**
     * @tc.number    SUB_IMPLEMENTING_OPTIONAL_INTERFACE_PROPERTIESTEST_0400
     * @tc.name      testImplementingOptionalInterfaceProperties0004
     * @tc.desc      A compile-time error occurs, if an optional property in an interface is implemented as non-optional
     * field optional property is implemented as union
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplementingOptionalInterfaceProperties0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testImplementingOptionalInterfaceProperties0004';
      expect(new C3().n).assertEqual(42)


    });

    /**
     * @tc.number    SUB_IMPLEMENTING_OPTIONAL_INTERFACE_PROPERTIESTEST_0500
     * @tc.name      testImplementingOptionalInterfaceProperties0005
     * @tc.desc      A compile-time error occurs, if an optional property in an interface is implemented as non-optional
     * field optional property is implemented as getter and setter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplementingOptionalInterfaceProperties0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testImplementingOptionalInterfaceProperties0005';
      let a: C4 = new C4()
      expect(a.n).assertEqual(1)
      a.n = 41
      expect(a.n).assertEqual(1)
    });

    /**
     * @tc.number    SUB_IMPLEMENTING_OPTIONAL_INTERFACE_PROPERTIESTEST_0600
     * @tc.name      testImplementingOptionalInterfaceProperties0006
     * @tc.desc      A compile-time error occurs, if an optional property in an interface is implemented as
     * non-optional field optional property is implemented as union
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplementingOptionalInterfaceProperties0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testImplementingOptionalInterfaceProperties0006';
      expect(new C5().n).assertEqual(42)


    });

    /**
     * @tc.number    SUB_IMPLEMENTING_OPTIONAL_INTERFACE_PROPERTIESTEST_0700
     * @tc.name      testImplementingOptionalInterfaceProperties0007
     * @tc.desc       A compile-time error occurs, if an optional property in an interface is implemented as
     * non-optional field optional property is implemented as getter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplementingOptionalInterfaceProperties0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testImplementingOptionalInterfaceProperties0007';
      let a: C6 = new C6()
      expect(a.n).assertEqual(undefined)
      try {
        a.n = 41
      } catch(e) {
        expect(e instanceof InvalidStoreAccessError).assertTrue();
      }

    });

    /**
     * @tc.number    SUB_IMPLEMENTING_OPTIONAL_INTERFACE_PROPERTIESTEST_0800
     * @tc.name      testImplementingOptionalInterfaceProperties0008
     * @tc.desc       A compile-time error occurs, if an optional property in an interface is implemented as
     * non-optional field optional property is implemented as getter and setter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplementingOptionalInterfaceProperties0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testImplementingOptionalInterfaceProperties0008';
      let a: C7 = new C7()
      expect(a.n).assertEqual(1)
      a.n = 41
      expect(a.n).assertEqual(1)


    });
  })
}
