/*
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
} from "../../../../../hypium";


async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}

namespace ns {
    export interface I_F1387 {
      field: Object
      foo: () => void
    }
    export class A_F1387 implements I_F1387 {
      field: Object = 4
      foo: () => void = (): void => {
        this.field = 5
      }
    }
  }

namespace ns {
    export interface I_F1388 {
      field: Object | undefined | null
      foo: () => void
    }
    export class A_F1388 implements I_F1388 {
      field: Object | undefined | null = 4
      foo: () => void = (): void => {
        this.field = 5
      }
    }
  }

namespace ns {
    export interface I_F1389 {
      field: Any
      foo: () => void
    }
    export class A_F1389 implements I_F1389 {
      field: Any = 4
      foo: () => void = (): void => {
        this.field = 5
      }
    }
  }

namespace ns {
    export interface I_F1390 {
      field: long
      foo: () => void
    }
    export class A_F1390 implements I_F1390 {
      field: long = 4
      foo: () => void = (): void => {
        this.field = 5
      }
    }
  }

namespace ns {
    export interface I_F1391 {
      field: int
      foo: () => void
    }
    export class A_F1391 implements I_F1391 {
      field: int = 4
      foo: () => void = (): void => {
        this.field = 5
      }
    }
  }

namespace ns {
    export interface I_F1392 {
      field: byte
      foo: () => void
    }
    export class A_F1392 implements I_F1392 {
      field: byte = 4
      foo: () => void = (): void => {
        this.field = 5
      }
    }
  }

namespace ns {
    export interface I_F1393 {
      field: short
      foo: () => void
    }
    export class A_F1393 implements I_F1393 {
      field: short = 4
      foo: () => void = (): void => {
        this.field = 5
      }
    }
  }

namespace ns {
    export interface I_F1394 {
      field: double
      foo: () => void
    }
    export class A_F1394 implements I_F1394 {
      field: double = 4
      foo: () => void = (): void => {
        this.field = 7.3
      }
    }
  }

namespace ns {
    export interface I_F1395 {
      field: number
      foo: () => void
    }
    export class A_F1395 implements I_F1395 {
      field: number = 4
      foo: () => void = (): void => {
        this.field = 5
      }
    }
  }

namespace ns {
    export interface I_F1396 {
      field: float
      foo: () => void
    }
    export class A_F1396 implements I_F1396 {
      field: float = 4.5f
      foo: () => void = (): void => {
        this.field = 7.3f
      }
    }
  }

namespace ns {
    export interface I_F1397 {
      field: bigint
      foo: () => void
    }
    export class A_F1397 implements I_F1397 {
      field: bigint = 4n
      foo: () => void = (): void => {
        this.field = 5n
      }
    }
  }

namespace ns {
    export interface I_F1398 {
      field: string
      foo: () => void
    }
    export class A_F1398 implements I_F1398 {
      field: string = "abc"
      foo: () => void = (): void => {
        this.field = "efg"
      }
    }
  }

namespace ns {
    export interface I_F1399 {
      field: char
      foo: () => void
    }
    export class A_F1399 implements I_F1399 {
      field: char = c'a'
      foo: () => void = (): void => {
        this.field = c'b'
      }
    }
  }

namespace ns {
    export interface I_F1400 {
      field: boolean
      foo: () => void
    }
    export class A_F1400 implements I_F1400 {
      field: boolean = false
      foo: () => void = (): void => {
        this.field = true
      }
    }
  }

namespace ns {
    export interface I_F1401 {
      field: Object
      foo: () => void
    }
    export class A_F1401 implements I_F1401 {
      field: Object = 4
      foo: () => void = (): void => {
        this.field = 5
      }
    }
  }

namespace ns {
    export interface I_F1402 {
      field: Object | undefined | null
      foo: () => void
    }
    export class A_F1402 implements I_F1402 {
      field: Object | undefined | null = 4
      foo: () => void = (): void => {
        this.field = 5
      }
    }
  }

namespace ns {
    export interface I_F1403 {
      field: Any
      foo: () => void
    }
    export class A_F1403 implements I_F1403 {
      field: Any = 4
      foo: () => void = (): void => {
        this.field = 5
      }
    }
  }

class A_F1404 {
  public x: int = 5;
}

class A_F1405 {
  public static readonly y: int = 5;

  public static x: int = A_F1405.y;
}

export default function FieldInitializationTestFourteen(): void {
  describe("FieldInitializationTestFourteen", () => {
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
     * @tc.number    SUB_FIELD_INIT_TEST_1387
     * @tc.name      testFieldInit1387
     * @tc.desc      Checking the implementation of interface in namespace.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit1387", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: ns.A_F1387 = new ns.A_F1387()
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(4)
      a.foo()
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_1388
     * @tc.name      testFieldInit1388
     * @tc.desc      Checking the implementation of interface in namespace.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit1388", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: ns.A_F1388 = new ns.A_F1388()
      expect(a.field instanceof Object | undefined | null).assertTrue()
      expect(a.field).assertEqual(4)
      a.foo()
      expect(a.field instanceof Object | undefined | null).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_1389
     * @tc.name      testFieldInit1389
     * @tc.desc      Checking the implementation of interface in namespace.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit1389", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: ns.A_F1389 = new ns.A_F1389()
      expect(a.field instanceof Any).assertTrue()
      expect(a.field).assertEqual(4)
      a.foo()
      expect(a.field instanceof Any).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_1390
     * @tc.name      testFieldInit1390
     * @tc.desc      Checking the implementation of interface in namespace.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit1390", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: ns.A_F1390 = {field: 5}
      expect(a.field instanceof long).assertTrue()
      expect(a.field).assertEqual(5)
      a.field = 4
      expect(a.field instanceof long).assertTrue()
      expect(a.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_1391
     * @tc.name      testFieldInit1391
     * @tc.desc      Checking the implementation of interface in namespace.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit1391", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: ns.A_F1391 = {field: 5}
      expect(a.field instanceof int).assertTrue()
      expect(a.field).assertEqual(5)
      a.field = 4
      expect(a.field instanceof int).assertTrue()
      expect(a.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_1392
     * @tc.name      testFieldInit1392
     * @tc.desc      Checking the implementation of interface in namespace.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit1392", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: ns.A_F1392 = {field: 5}
      expect(a.field instanceof byte).assertTrue()
      expect(a.field).assertEqual(5)
      a.field = 4
      expect(a.field instanceof byte).assertTrue()
      expect(a.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_1393
     * @tc.name      testFieldInit1393
     * @tc.desc      Checking the implementation of interface in namespace.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit1393", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: ns.A_F1393 = {field: 5}
      expect(a.field instanceof short).assertTrue()
      expect(a.field).assertEqual(5)
      a.field = 4
      expect(a.field instanceof short).assertTrue()
      expect(a.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_1394
     * @tc.name      testFieldInit1394
     * @tc.desc      Checking the implementation of interface in namespace.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit1394", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: ns.A_F1394 = {field: 7.3}
      expect(a.field instanceof double).assertTrue()
      expect(a.field).assertEqual(7.3)
      a.field = 4
      expect(a.field instanceof double).assertTrue()
      expect(a.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_1395
     * @tc.name      testFieldInit1395
     * @tc.desc      Checking the implementation of interface in namespace.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit1395", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: ns.A_F1395 = {field: 5}
      expect(a.field instanceof number).assertTrue()
      expect(a.field).assertEqual(5)
      a.field = 4
      expect(a.field instanceof number).assertTrue()
      expect(a.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_1396
     * @tc.name      testFieldInit1396
     * @tc.desc      Checking the implementation of interface in namespace.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit1396", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: ns.A_F1396 = {field: 7.3f}
      expect(a.field instanceof float).assertTrue()
      expect(a.field).assertEqual(7.3f)
      a.field = 4.5f
      expect(a.field instanceof float).assertTrue()
      expect(a.field).assertEqual(4.5f)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_1397
     * @tc.name      testFieldInit1397
     * @tc.desc      Checking the implementation of interface in namespace.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit1397", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: ns.A_F1397 = {field: 5n}
      expect(a.field instanceof bigint).assertTrue()
      expect(a.field).assertEqual(5n)
      a.field = 4n
      expect(a.field instanceof bigint).assertTrue()
      expect(a.field).assertEqual(4n)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_1398
     * @tc.name      testFieldInit1398
     * @tc.desc      Checking the implementation of interface in namespace.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit1398", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: ns.A_F1398 = {field: "efg"}
      expect(a.field instanceof string).assertTrue()
      expect(a.field).assertEqual("efg")
      a.field = "abc"
      expect(a.field instanceof string).assertTrue()
      expect(a.field).assertEqual("abc")
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_1399
     * @tc.name      testFieldInit1399
     * @tc.desc      Checking the implementation of interface in namespace.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit1399", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: ns.A_F1399 = {field: c'b'}
      expect(a.field instanceof char).assertTrue()
      expect(a.field).assertEqual(c'b')
      a.field = c'a'
      expect(a.field instanceof char).assertTrue()
      expect(a.field).assertEqual(c'a')
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_1400
     * @tc.name      testFieldInit1400
     * @tc.desc      Checking the implementation of interface in namespace.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit1400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: ns.A_F1400 = {field: true}
      expect(a.field instanceof boolean).assertTrue()
      expect(a.field).assertEqual(true)
      a.field = false
      expect(a.field instanceof boolean).assertTrue()
      expect(a.field).assertEqual(false)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_1401
     * @tc.name      testFieldInit1401
     * @tc.desc      Checking the implementation of interface in namespace.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit1401", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: ns.A_F1401 = {field: 5}
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(5)
      a.field = 4
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_1402
     * @tc.name      testFieldInit1402
     * @tc.desc      Checking the implementation of interface in namespace.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit1402", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: ns.A_F1402 = {field: 5}
      expect(a.field instanceof Object | undefined | null).assertTrue()
      expect(a.field).assertEqual(5)
      a.field = 4
      expect(a.field instanceof Object | undefined | null).assertTrue()
      expect(a.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_1403
     * @tc.name      testFieldInit1403
     * @tc.desc      Checking the implementation of interface in namespace.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit1403", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: ns.A_F1403 = {field: 5}
      expect(a.field instanceof Any).assertTrue()
      expect(a.field).assertEqual(5)
      a.field = 4
      expect(a.field instanceof Any).assertTrue()
      expect(a.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_1404
     * @tc.name      testFieldInit1404
     * @tc.desc      Non-static field initialization.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit1404", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let instance: A_F1404 = new A_F1404();

      expect(instance.x).assertEqual(5);
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_1405
     * @tc.name      testFieldInit1405
     * @tc.desc      Check that readonly static field initialized first.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit1405", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F1405.x).assertEqual(5);
    })
  })
}
