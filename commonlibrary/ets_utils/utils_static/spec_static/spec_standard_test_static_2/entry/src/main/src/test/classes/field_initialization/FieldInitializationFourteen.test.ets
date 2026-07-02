'use static';
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

class A_F1404 {
  public x: int = 5;
}

class A_F1405 {
  public static readonly y: int = 5;

  public static x: int = A_F1405.y;
}

export default function FieldInitializationFourteenTest(): void {
  describe("FieldInitializationFourteenTest", () => {
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
     * @tc.number    SUB_FIELD_INIT_FOURTEEN_0100
     * @tc.name      testFieldInitFourteen0001
     * @tc.desc      Checking for initialization with function field.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitFourteen0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new ns.A_F1387()
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(4)
      a.foo()
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_FOURTEEN_0200
     * @tc.name      testFieldInitFourteen0002
     * @tc.desc      Checking for initialization with function field.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitFourteen0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new ns.A_F1388()
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(4)
      a.foo()
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_FOURTEEN_0300
     * @tc.name      testFieldInitFourteen0003
     * @tc.desc      Checking for initialization with function field.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitFourteen0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new ns.A_F1390()
      expect(a.field instanceof long).assertTrue()
      expect(a.field).assertEqual(4)
      a.foo()
      expect(a.field instanceof long).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_FOURTEEN_0400
     * @tc.name      testFieldInitFourteen0004
     * @tc.desc      Checking for initialization with function field.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitFourteen0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new ns.A_F1391()
      expect(a.field instanceof int).assertTrue()
      expect(a.field).assertEqual(4)
      a.foo()
      expect(a.field instanceof int).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_FOURTEEN_0500
     * @tc.name      testFieldInitFourteen0005
     * @tc.desc      Checking for initialization with function field.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitFourteen0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new ns.A_F1392()
      expect(a.field instanceof byte).assertTrue()
      expect(a.field).assertEqual(4)
      a.foo()
      expect(a.field instanceof byte).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_FOURTEEN_0600
     * @tc.name      testFieldInitFourteen0006
     * @tc.desc      Checking for initialization with function field.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitFourteen0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new ns.A_F1393()
      expect(a.field instanceof short).assertTrue()
      expect(a.field).assertEqual(4)
      a.foo()
      expect(a.field instanceof short).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_FOURTEEN_0700
     * @tc.name      testFieldInitFourteen0007
     * @tc.desc      Checking for initialization with function field.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitFourteen0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new ns.A_F1394()
      expect(a.field instanceof double).assertTrue()
      expect(a.field).assertEqual(4)
      a.foo()
      expect(a.field instanceof double).assertTrue()
      expect(a.field).assertEqual(7.3)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_FOURTEEN_0800
     * @tc.name      testFieldInitFourteen0008
     * @tc.desc      Checking for initialization with function field.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitFourteen0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new ns.A_F1395()
      expect(a.field instanceof number).assertTrue()
      expect(a.field).assertEqual(4)
      a.foo()
      expect(a.field instanceof number).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_FOURTEEN_0900
     * @tc.name      testFieldInitFourteen0009
     * @tc.desc      Checking for initialization with function field.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitFourteen0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new ns.A_F1396()
      expect(a.field instanceof float).assertTrue()
      expect(a.field).assertEqual(4.5f)
      a.foo()
      expect(a.field instanceof float).assertTrue()
      expect(a.field).assertEqual(7.3f)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_FOURTEEN_1000
     * @tc.name      testFieldInitFourteen0010
     * @tc.desc      Checking for initialization with function field.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitFourteen0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new ns.A_F1397()
      expect(a.field instanceof bigint).assertTrue()
      expect(a.field).assertEqual(4n)
      a.foo()
      expect(a.field instanceof bigint).assertTrue()
      expect(a.field).assertEqual(5n)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_FOURTEEN_1100
     * @tc.name      testFieldInitFourteen0011
     * @tc.desc      Checking for initialization with function field.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitFourteen0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new ns.A_F1398()
      expect(a.field instanceof string).assertTrue()
      expect(a.field).assertEqual("abc")
      a.foo()
      expect(a.field instanceof string).assertTrue()
      expect(a.field).assertEqual("efg")
    })

    /**
     * @tc.number    SUB_FIELD_INIT_FOURTEEN_1200
     * @tc.name      testFieldInitFourteen0012
     * @tc.desc      Checking for initialization with function field.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitFourteen0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new ns.A_F1399()
      expect(a.field instanceof char).assertTrue()
      expect(a.field).assertEqual(c'a')
      a.foo()
      expect(a.field instanceof char).assertTrue()
      expect(a.field).assertEqual(c'b')
    })

    /**
     * @tc.number    SUB_FIELD_INIT_FOURTEEN_1300
     * @tc.name      testFieldInitFourteen0013
     * @tc.desc      Checking for initialization with function field.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitFourteen0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new ns.A_F1400()
      expect(a.field instanceof boolean).assertTrue()
      expect(a.field).assertEqual(false)
      a.foo()
      expect(a.field instanceof boolean).assertTrue()
      expect(a.field).assertEqual(true)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_FOURTEEN_1400
     * @tc.name      testFieldInitFourteen0014
     * @tc.desc      Checking for initialization with function field.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitFourteen0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new ns.A_F1401()
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(4)
      a.foo()
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_FOURTEEN_1500
     * @tc.name      testFieldInitFourteen0015
     * @tc.desc      Checking for initialization with function field.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitFourteen0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new ns.A_F1402()
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(4)
      a.foo()
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(5)
    })


    /**
     * @tc.number    SUB_FIELD_INIT_FOURTEEN_1600
     * @tc.name      testFieldInitFourteen0016
     * @tc.desc      Non-static field initialization.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitFourteen0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let instance: A_F1404 = new A_F1404();

      expect(instance.x).assertEqual(5);
    })

    /**
     * @tc.number    SUB_FIELD_INIT_FOURTEEN_1700
     * @tc.name      testFieldInitFourteen0017
     * @tc.desc      Check that readonly static field initialized first.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitFourteen0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F1405.x).assertEqual(5);
    })
  })
}
