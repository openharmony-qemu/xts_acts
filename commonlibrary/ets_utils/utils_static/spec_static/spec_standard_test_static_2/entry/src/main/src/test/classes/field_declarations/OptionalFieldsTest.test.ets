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

enum Color { Red, Green, Blue }

class A {
  a?: byte
}

class A1 {
  a?: short
}

class A2 {
  a?: int
}

class A3 {
  a?: long
}

class A4 {
  a?: bigint
}

class A5 {
  a?: BigInt
}

class A6 {
  a?: float
}

class A7 {
  a?: double
}

class A8 {
  a?: char
}

class A9 {
  a?: boolean
}

class A10 {
  a?: Object
}

class A11 {
  a?: String
}

class A12 {
  a?: number[]
}

class A13 {
  a?: number | string
}

class A14 {
  a?: Function
}

class A16 {
  a?: null
}

class A17 {
  a?: undefined
}

class A18 {
  a?: never
}

class A19 {
  a?: (n: number) => string
}

class A20 {
  a?: (n: number, ...ns: number[]) => string
}

class A21 {
  a?: "a" | "b"
}

class A22 {
  a?: [number, string]
}

class A23 {
  a?: Color
}

export default function OptionalFieldsTest(): void {
  describe('OptionalFieldsTest', () => {
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
     * @tc.number    SUB_OPTIONAL_FIELDS_TEST_0100
     * @tc.name      testOptionalFields0001
     * @tc.desc      Optional class fields should be undefined
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOptionalFields0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testOptionalFields0001'
      let a = new A()
      expect(a.a).assertEqual(undefined)
    });

    /**
     * @tc.number    SUB_OPTIONAL_FIELDS_TEST_0200
     * @tc.name      testOptionalFields0002
     * @tc.desc      Optional class fields should be undefined
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOptionalFields0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testOptionalFields0002'
      let a1 = new A1()
      expect(a1.a).assertEqual(undefined)
    });

    /**
     * @tc.number    SUB_OPTIONAL_FIELDS_TEST_0300
     * @tc.name      testOptionalFields0003
     * @tc.desc      Optional class fields should be undefined
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOptionalFields0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testOptionalFields0003'
      let a2 = new A2()
      expect(a2.a).assertEqual(undefined)
    });

    /**
     * @tc.number    SUB_OPTIONAL_FIELDS_TEST_0400
     * @tc.name      testOptionalFields0004
     * @tc.desc      Optional class fields should be undefined
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOptionalFields0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testOptionalFields0004'
      let a3 = new A3()
      expect(a3.a).assertEqual(undefined)
    });

    /**
     * @tc.number    SUB_OPTIONAL_FIELDS_TEST_0500
     * @tc.name      testOptionalFields0005
     * @tc.desc      Optional class fields should be undefined
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOptionalFields0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testOptionalFields0005'
      let a4 = new A4()
      expect(a4.a).assertEqual(undefined)
    });

    /**
     * @tc.number    SUB_OPTIONAL_FIELDS_TEST_0600
     * @tc.name      testOptionalFields0006
     * @tc.desc      Optional class fields should be undefined
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOptionalFields0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testOptionalFields0006'
      let a5 = new A5()
      expect(a5.a).assertEqual(undefined)
    });

    /**
     * @tc.number    SUB_OPTIONAL_FIELDS_TEST_0700
     * @tc.name      testOptionalFields0007
     * @tc.desc      Optional class fields should be undefined
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOptionalFields0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testOptionalFields0007'
      let a6 = new A6()
      expect(a6.a).assertEqual(undefined)
    });

    /**
     * @tc.number    SUB_OPTIONAL_FIELDS_TEST_0800
     * @tc.name      testOptionalFields0008
     * @tc.desc      Optional class fields should be undefined
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOptionalFields0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testOptionalFields0008'
      let a7 = new A7()
      expect(a7.a).assertEqual(undefined)
    });

    /**
     * @tc.number    SUB_OPTIONAL_FIELDS_TEST_0900
     * @tc.name      testOptionalFields0009
     * @tc.desc      Optional class fields should be undefined
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOptionalFields0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testOptionalFields0009'
      let a8 = new A8()
      expect(a8.a).assertEqual(undefined)
    });

    /**
     * @tc.number    SUB_OPTIONAL_FIELDS_TEST_1000
     * @tc.name      testOptionalFields0010
     * @tc.desc      Optional class fields should be undefined
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOptionalFields0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testOptionalFields0010'
      let a9 = new A9()
      expect(a9.a).assertEqual(undefined)
    });

    /**
     * @tc.number    SUB_OPTIONAL_FIELDS_TEST_1100
     * @tc.name      testOptionalFields0011
     * @tc.desc      Optional class fields should be undefined
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOptionalFields0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testOptionalFields0011'
      let a10 = new A10()
      expect(a10.a).assertEqual(undefined)
    });

    /**
     * @tc.number    SUB_OPTIONAL_FIELDS_TEST_1200
     * @tc.name      testOptionalFields0012
     * @tc.desc      Optional class fields should be undefined
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOptionalFields0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testOptionalFields0012'
      let a11 = new A11()
      expect(a11.a).assertEqual(undefined)
    });

    /**
     * @tc.number    SUB_OPTIONAL_FIELDS_TEST_1300
     * @tc.name      testOptionalFields0013
     * @tc.desc      Optional class fields should be undefined
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOptionalFields0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testOptionalFields0013'
      let a12 = new A12()
      expect(a12.a).assertEqual(undefined)
    });

    /**
     * @tc.number    SUB_OPTIONAL_FIELDS_TEST_1400
     * @tc.name      testOptionalFields0014
     * @tc.desc      Optional class fields should be undefined
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOptionalFields0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testOptionalFields0014'
      let a13 = new A13()
      expect(a13.a).assertEqual(undefined)
    });

    /**
     * @tc.number    SUB_OPTIONAL_FIELDS_TEST_1500
     * @tc.name      testOptionalFields0015
     * @tc.desc      Optional class fields should be undefined
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOptionalFields0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testOptionalFields0015'
      let a14 = new A14()
      expect(a14.a).assertEqual(undefined)
    });

    /**
     * @tc.number    SUB_OPTIONAL_FIELDS_TEST_1600
     * @tc.name      testOptionalFields0016
     * @tc.desc      Optional class fields should be undefined
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOptionalFields0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testOptionalFields0017'
      let a16 = new A16()
      expect(a16.a).assertEqual(undefined)
    });

    /**
     * @tc.number    SUB_OPTIONAL_FIELDS_TEST_1700
     * @tc.name      testOptionalFields0017
     * @tc.desc      Optional class fields should be undefined
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOptionalFields0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testOptionalFields0018'
      let a17 = new A17()
      expect(a17.a).assertEqual(undefined)
    });

    /**
     * @tc.number    SUB_OPTIONAL_FIELDS_TEST_1800
     * @tc.name      testOptionalFields0018
     * @tc.desc      Optional class fields should be undefined
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOptionalFields0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testOptionalFields0019'
      let a18 = new A18()
      expect(a18.a).assertEqual(undefined)
    });

    /**
     * @tc.number    SUB_OPTIONAL_FIELDS_TEST_1900
     * @tc.name      testOptionalFields0019
     * @tc.desc      Optional class fields should be undefined
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOptionalFields0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testOptionalFields0020'
      let a19 = new A19()
      expect(a19.a).assertEqual(undefined)
    });

    /**
     * @tc.number    SUB_OPTIONAL_FIELDS_TEST_2000
     * @tc.name      testOptionalFields0020
     * @tc.desc      Optional class fields should be undefined
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOptionalFields0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testOptionalFields0021'
      let a20 = new A20()
      expect(a20.a).assertEqual(undefined)
    });

    /**
     * @tc.number    SUB_OPTIONAL_FIELDS_TEST_2100
     * @tc.name      testOptionalFields0021
     * @tc.desc      Optional class fields should be undefined
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOptionalFields0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testOptionalFields0022'
      let a21 = new A21()
      expect(a21.a).assertEqual(undefined)
    });

    /**
     * @tc.number    SUB_OPTIONAL_FIELDS_TEST_2200
     * @tc.name      testOptionalFields0022
     * @tc.desc      Optional class fields should be undefined
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOptionalFields0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testOptionalFields0023'
      let a22 = new A22()
      expect(a22.a).assertEqual(undefined)
    });

    /**
     * @tc.number    SUB_OPTIONAL_FIELDS_TEST_2300
     * @tc.name      testOptionalFields0023
     * @tc.desc      Optional class fields should be undefined
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOptionalFields0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testOptionalFields0024'
      let a23 = new A23()
      expect(a23.a).assertEqual(undefined)
    });
  })
}
