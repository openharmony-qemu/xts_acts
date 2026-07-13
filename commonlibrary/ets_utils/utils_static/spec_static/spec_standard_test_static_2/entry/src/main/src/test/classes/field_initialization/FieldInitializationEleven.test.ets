'use static'
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
} from "@ohos/hypium-binary/src/main/indexStatic";
import Utils from '../../Util.test'


class A_F1090 {
    static field: int
    static {
      A_F1090.field = 4
    }
  }

class A_F1091 {
    static field: byte
    static {
      A_F1091.field = 4
    }
  }

class A_F1092 {
    static field: short
    static {
      A_F1092.field = 4
    }
  }

class A_F1093 {
    static field: double
    static {
      A_F1093.field = 4
    }
  }

class A_F1094 {
    static field: number
    static {
      A_F1094.field = 4
    }
  }

class A_F1095 {
    static field: float
    static {
      A_F1095.field = 4.5f
    }
  }

class A_F1096 {
    static field: char
    static {
      A_F1096.field = c'a'
    }
  }

class A_F1097 {
    static field: boolean
    static {
      A_F1097.field = false
    }
  }

class A_F1098 {
    static field: Object | undefined
    static {
      A_F1098.field = undefined
    }
  }

class A_F1099 {
    static field: Object | undefined | null
    static {
      A_F1099.field = 4
    }
  }

class A_F1101 {
    static field: long = 4
    static {
      A_F1101.field = 5
    }
  }

class A_F1102 {
    static field: int = 4
    static {
      A_F1102.field = 5
    }
  }

class A_F1103 {
    static field: byte = 4
    static {
      A_F1103.field = 5
    }
  }

class A_F1104 {
    static field: short = 4
    static {
      A_F1104.field = 5
    }
  }

class A_F1105 {
    static field: double = 4
    static {
      A_F1105.field = 7.3
    }
  }

class A_F1106 {
    static field: number = 4
    static {
      A_F1106.field = 5
    }
  }

class A_F1107 {
    static field: float = 4.5f
    static {
      A_F1107.field = 7.3f
    }
  }

class A_F1108 {
    static field: bigint = 4n
    static {
      A_F1108.field = 5n
    }
  }

class A_F1109 {
    static field: string = "abc"
    static {
      A_F1109.field = "efg"
    }
  }

class A_F1110 {
    static field: char = c'a'
    static {
      A_F1110.field = c'b'
    }
  }

class A_F1111 {
    static field: boolean = false
    static {
      A_F1111.field = true
    }
  }

class A_F1112 {
    static field: Object = 4
    static {
      A_F1112.field = 5
    }
  }

class A_F1113 {
    static field: Object | undefined = undefined
    static {
      A_F1113.field = 5
    }
  }

class A_F1114 {
    static field: Object | undefined | null = 4
    static {
      A_F1114.field = 5
    }
  }

namespace ns {
    export class A_F1116 {
      static field: long = 4
    }
  }

namespace ns {
    export class A_F1117 {
      static field: int = 4
    }
  }

namespace ns {
    export class A_F1118 {
      static field: byte = 4
    }
  }

namespace ns {
    export class A_F1119 {
      static field: short = 4
    }
  }

namespace ns {
    export class A_F1120 {
      static field: double = 4
    }
  }

namespace ns {
    export class A_F1121 {
      static field: number = 4
    }
  }

namespace ns {
    export class A_F1122 {
      static field: float = 4.5f
    }
  }

namespace ns {
    export class A_F1123 {
      static field: bigint = 4n
    }
  }

namespace ns {
    export class A_F1124 {
      static field: string = "abc"
    }
  }

namespace ns {
    export class A_F1125 {
      static field: char = c'a'
    }
  }

namespace ns {
    export class A_F1126 {
      static field: boolean = false
    }
  }

namespace ns {
    export class A_F1127 {
      static field: Object = 4
    }
  }

namespace ns {
    export class A_F1128 {
      static field: Object | undefined | null = 4
    }
  }


namespace ns {
    export class A_F1186 {
      private static v: long = 4
      private static _field: long = A_F1186.v
      static get field(): long {
        return A_F1186._field
      }
      static set field(a: long) {
        A_F1186._field = a
      }
    }
  }

namespace ns {
    export class A_F1187 {
      private static v: int = 4
      private static _field: int = A_F1187.v
      static get field(): int {
        return A_F1187._field
      }
      static set field(a: int) {
        A_F1187._field = a
      }
    }
  }

namespace ns {
    export class A_F1188 {
      private static v: byte = 4
      private static _field: byte = A_F1188.v
      static get field(): byte {
        return A_F1188._field
      }
      static set field(a: byte) {
        A_F1188._field = a
      }
    }
  }

export default function FieldInitializationElevenTest(): void {
  describe("FieldInitializationElevenTest", () => {
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
     * @tc.number    SUB_FIELD_INIT_ELEVEN_0100
     * @tc.name      testFieldInitEleven0001
     * @tc.desc      Checking for changing the value from outside of class.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitEleven0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ns.A_F1116.field instanceof long).assertTrue()
      expect(ns.A_F1116.field).assertEqual(4)
          ns.A_F1116.field = 5
      expect(ns.A_F1116.field instanceof long).assertTrue()
      expect(ns.A_F1116.field).assertEqual(5)
          ns.A_F1116.field = 0
      expect(ns.A_F1116.field instanceof long).assertTrue()
      expect(ns.A_F1116.field).assertEqual(0)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_ELEVEN_0200
     * @tc.name      testFieldInitEleven0002
     * @tc.desc      Checking for changing the value from outside of class.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitEleven0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ns.A_F1117.field instanceof int).assertTrue()
      expect(ns.A_F1117.field).assertEqual(4)
          ns.A_F1117.field = 5
      expect(ns.A_F1117.field instanceof int).assertTrue()
      expect(ns.A_F1117.field).assertEqual(5)
          ns.A_F1117.field = 0
      expect(ns.A_F1117.field instanceof int).assertTrue()
      expect(ns.A_F1117.field).assertEqual(0)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_ELEVEN_0300
     * @tc.name      testFieldInitEleven0003
     * @tc.desc      Checking for changing the value from outside of class.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitEleven0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ns.A_F1118.field instanceof byte).assertTrue()
      expect(ns.A_F1118.field).assertEqual(4)
          ns.A_F1118.field = 5
      expect(ns.A_F1118.field instanceof byte).assertTrue()
      expect(ns.A_F1118.field).assertEqual(5)
          ns.A_F1118.field = 0
      expect(ns.A_F1118.field instanceof byte).assertTrue()
      expect(ns.A_F1118.field).assertEqual(0)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_ELEVEN_0400
     * @tc.name      testFieldInitEleven0004
     * @tc.desc      Checking for changing the value from outside of class.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitEleven0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ns.A_F1119.field instanceof short).assertTrue()
      expect(ns.A_F1119.field).assertEqual(4)
          ns.A_F1119.field = 5
      expect(ns.A_F1119.field instanceof short).assertTrue()
      expect(ns.A_F1119.field).assertEqual(5)
          ns.A_F1119.field = 0
      expect(ns.A_F1119.field instanceof short).assertTrue()
      expect(ns.A_F1119.field).assertEqual(0)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_ELEVEN_0500
     * @tc.name      testFieldInitEleven0005
     * @tc.desc      Checking for changing the value from outside of class.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitEleven0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ns.A_F1120.field instanceof double).assertTrue()
      expect(ns.A_F1120.field).assertEqual(4)
          ns.A_F1120.field = 7.3
      expect(ns.A_F1120.field instanceof double).assertTrue()
      expect(ns.A_F1120.field).assertEqual(7.3)
          ns.A_F1120.field = 0.0
      expect(ns.A_F1120.field instanceof double).assertTrue()
      expect(ns.A_F1120.field).assertEqual(0)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_ELEVEN_0600
     * @tc.name      testFieldInitEleven0006
     * @tc.desc      Checking for changing the value from outside of class.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitEleven0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ns.A_F1121.field instanceof number).assertTrue()
      expect(ns.A_F1121.field).assertEqual(4)
          ns.A_F1121.field = 5
      expect(ns.A_F1121.field instanceof number).assertTrue()
      expect(ns.A_F1121.field).assertEqual(5)
          ns.A_F1121.field = 0
      expect(ns.A_F1121.field instanceof number).assertTrue()
      expect(ns.A_F1121.field).assertEqual(0)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_ELEVEN_0700
     * @tc.name      testFieldInitEleven0007
     * @tc.desc      Checking for changing the value from outside of class.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitEleven0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ns.A_F1122.field instanceof float).assertTrue()
      expect(ns.A_F1122.field).assertEqual(4.5f)
          ns.A_F1122.field = 7.3f
      expect(ns.A_F1122.field instanceof float).assertTrue()
      expect(ns.A_F1122.field).assertEqual(7.3f)
          ns.A_F1122.field = 0.0f
      expect(ns.A_F1122.field instanceof float).assertTrue()
      expect(ns.A_F1122.field).assertEqual(0.0f)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_ELEVEN_0800
     * @tc.name      testFieldInitEleven0008
     * @tc.desc      Checking for changing the value from outside of class.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitEleven0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ns.A_F1123.field instanceof bigint).assertTrue()
      expect(ns.A_F1123.field).assertEqual(4n)
          ns.A_F1123.field = 5n
      expect(ns.A_F1123.field instanceof bigint).assertTrue()
      expect(ns.A_F1123.field).assertEqual(5n)
          ns.A_F1123.field = 0n
      expect(ns.A_F1123.field instanceof bigint).assertTrue()
      expect(ns.A_F1123.field).assertEqual(0n)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_ELEVEN_0900
     * @tc.name      testFieldInitEleven0009
     * @tc.desc      Checking for changing the value from outside of class.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitEleven0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ns.A_F1124.field instanceof string).assertTrue()
      expect(ns.A_F1124.field).assertEqual("abc")
          ns.A_F1124.field = "efg"
      expect(ns.A_F1124.field instanceof string).assertTrue()
      expect(ns.A_F1124.field).assertEqual("efg")
          ns.A_F1124.field = ""
      expect(ns.A_F1124.field instanceof string).assertTrue()
      expect(ns.A_F1124.field).assertEqual("")
    })

    /**
     * @tc.number    SUB_FIELD_INIT_ELEVEN_1000
     * @tc.name      testFieldInitEleven0010
     * @tc.desc      Checking for changing the value from outside of class.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitEleven0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ns.A_F1125.field instanceof char).assertTrue()
      expect(ns.A_F1125.field).assertEqual(c'a')
          ns.A_F1125.field = c'b'
      expect(ns.A_F1125.field instanceof char).assertTrue()
      expect(ns.A_F1125.field).assertEqual(c'b')
          ns.A_F1125.field = c'\u0000'
      expect(ns.A_F1125.field instanceof char).assertTrue()
      expect(ns.A_F1125.field).assertEqual(c'\u0000')
    })

    /**
     * @tc.number    SUB_FIELD_INIT_ELEVEN_1100
     * @tc.name      testFieldInitEleven0011
     * @tc.desc      Checking for changing the value from outside of class.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitEleven0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ns.A_F1126.field instanceof boolean).assertTrue()
      expect(ns.A_F1126.field).assertEqual(false)
          ns.A_F1126.field = true
      expect(ns.A_F1126.field instanceof boolean).assertTrue()
      expect(ns.A_F1126.field).assertEqual(true)
          ns.A_F1126.field = false
      expect(ns.A_F1126.field instanceof boolean).assertTrue()
      expect(ns.A_F1126.field).assertEqual(false)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_ELEVEN_1200
     * @tc.name      testFieldInitEleven0012
     * @tc.desc      Checking for changing the value from outside of class.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitEleven0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ns.A_F1127.field instanceof Object).assertTrue()
      expect(ns.A_F1127.field).assertEqual(4)
          ns.A_F1127.field = 5
      expect(ns.A_F1127.field instanceof Object).assertTrue()
      expect(ns.A_F1127.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_ELEVEN_1300
     * @tc.name      testFieldInitEleven0013
     * @tc.desc      Checking for changing the value from outside of class.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitEleven0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ns.A_F1128.field instanceof Object).assertTrue()
      expect(ns.A_F1128.field).assertEqual(4)
          ns.A_F1128.field = 5
      expect(ns.A_F1128.field instanceof Object).assertTrue()
      expect(ns.A_F1128.field).assertEqual(5)
          ns.A_F1128.field = null
      expect(ns.A_F1128.field instanceof Object).assertFalse()
      expect(ns.A_F1128.field).assertEqual(null)
    })


    /**
     * @tc.number    SUB_FIELD_INIT_ELEVEN_1400
     * @tc.name      testFieldInitEleven0014
     * @tc.desc      Checking for getter and setter with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitEleven0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ns.A_F1186.field instanceof long).assertTrue()
      expect(ns.A_F1186.field).assertEqual(4)
      ns.A_F1186.field = 5
      expect(ns.A_F1186.field instanceof long).assertTrue()
      expect(ns.A_F1186.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_ELEVEN_1500
     * @tc.name      testFieldInitEleven0015
     * @tc.desc      Checking for getter and setter with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitEleven0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ns.A_F1187.field instanceof int).assertTrue()
      expect(ns.A_F1187.field).assertEqual(4)
      ns.A_F1187.field = 5
      expect(ns.A_F1187.field instanceof int).assertTrue()
      expect(ns.A_F1187.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_ELEVEN_1600
     * @tc.name      testFieldInitEleven0016
     * @tc.desc      Checking for getter and setter with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitEleven0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ns.A_F1188.field instanceof byte).assertTrue()
      expect(ns.A_F1188.field).assertEqual(4)
      ns.A_F1188.field = 5
      expect(ns.A_F1188.field instanceof byte).assertTrue()
      expect(ns.A_F1188.field).assertEqual(5)
    })


    /**
     * @tc.number    SUB_FIELD_INIT_ELEVEN_1700
     * @tc.name      testFieldInitEleven0017
     * @tc.desc      Checking for changing the value from static block.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitEleven0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F1090.field instanceof int).assertTrue()
      expect(A_F1090.field).assertEqual(4)
          A_F1090.field = 5
      expect(A_F1090.field instanceof int).assertTrue()
      expect(A_F1090.field).assertEqual(5)
          A_F1090.field = 4
      expect(A_F1090.field instanceof int).assertTrue()
      expect(A_F1090.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_ELEVEN_1800
     * @tc.name      testFieldInitEleven0018
     * @tc.desc      Checking for changing the value from static block.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitEleven0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F1091.field instanceof byte).assertTrue()
      expect(A_F1091.field).assertEqual(4)
          A_F1091.field = 5
      expect(A_F1091.field instanceof byte).assertTrue()
      expect(A_F1091.field).assertEqual(5)
          A_F1091.field = 4
      expect(A_F1091.field instanceof byte).assertTrue()
      expect(A_F1091.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_ELEVEN_1900
     * @tc.name      testFieldInitEleven0019
     * @tc.desc      Checking for changing the value from static block.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitEleven0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F1092.field instanceof short).assertTrue()
      expect(A_F1092.field).assertEqual(4)
          A_F1092.field = 5
      expect(A_F1092.field instanceof short).assertTrue()
      expect(A_F1092.field).assertEqual(5)
          A_F1092.field = 4
      expect(A_F1092.field instanceof short).assertTrue()
      expect(A_F1092.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_ELEVEN_2000
     * @tc.name      testFieldInitEleven0020
     * @tc.desc      Checking for changing the value from static block.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitEleven0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F1093.field instanceof double).assertTrue()
      expect(A_F1093.field).assertEqual(4)
          A_F1093.field = 7.3
      expect(A_F1093.field instanceof double).assertTrue()
      expect(A_F1093.field).assertEqual(7.3)
          A_F1093.field = 4
      expect(A_F1093.field instanceof double).assertTrue()
      expect(A_F1093.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_ELEVEN_2100
     * @tc.name      testFieldInitEleven0021
     * @tc.desc      Checking for changing the value from static block.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitEleven0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F1094.field instanceof number).assertTrue()
      expect(A_F1094.field).assertEqual(4)
          A_F1094.field = 5
      expect(A_F1094.field instanceof number).assertTrue()
      expect(A_F1094.field).assertEqual(5)
          A_F1094.field = 4
      expect(A_F1094.field instanceof number).assertTrue()
      expect(A_F1094.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_ELEVEN_2200
     * @tc.name      testFieldInitEleven0022
     * @tc.desc      Checking for changing the value from static block.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitEleven0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F1095.field instanceof float).assertTrue()
      expect(A_F1095.field).assertEqual(4.5f)
          A_F1095.field = 7.3f
      expect(A_F1095.field instanceof float).assertTrue()
      expect(A_F1095.field).assertEqual(7.3f)
          A_F1095.field = 4.5f
      expect(A_F1095.field instanceof float).assertTrue()
      expect(A_F1095.field).assertEqual(4.5f)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_ELEVEN_2300
     * @tc.name      testFieldInitEleven0023
     * @tc.desc      Checking for changing the value from static block.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitEleven0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F1096.field instanceof char).assertTrue()
      expect(A_F1096.field).assertEqual(c'a')
          A_F1096.field = c'b'
      expect(A_F1096.field instanceof char).assertTrue()
      expect(A_F1096.field).assertEqual(c'b')
          A_F1096.field = c'a'
      expect(A_F1096.field instanceof char).assertTrue()
      expect(A_F1096.field).assertEqual(c'a')
    })

    /**
     * @tc.number    SUB_FIELD_INIT_ELEVEN_2400
     * @tc.name      testFieldInitEleven0024
     * @tc.desc      Checking for changing the value from static block.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitEleven0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F1097.field instanceof boolean).assertTrue()
      expect(A_F1097.field).assertEqual(false)
          A_F1097.field = true
      expect(A_F1097.field instanceof boolean).assertTrue()
      expect(A_F1097.field).assertEqual(true)
          A_F1097.field = false
      expect(A_F1097.field instanceof boolean).assertTrue()
      expect(A_F1097.field).assertEqual(false)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_ELEVEN_2500
     * @tc.name      testFieldInitEleven0025
     * @tc.desc      Checking for changing the value from static block.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitEleven0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F1098.field instanceof Object).assertFalse()
      expect(A_F1098.field).assertEqual(undefined)
          A_F1098.field = 5
      expect(A_F1098.field instanceof Object).assertTrue()
      expect(A_F1098.field).assertEqual(5)
          A_F1098.field = undefined
      expect(A_F1098.field instanceof Object).assertFalse()
      expect(A_F1098.field).assertEqual(undefined)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_ELEVEN_2600
     * @tc.name      testFieldInitEleven0026
     * @tc.desc      Checking for changing the value from static block.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitEleven0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F1099.field instanceof Object).assertTrue()
      expect(A_F1099.field).assertEqual(4)
          A_F1099.field = 5
      expect(A_F1099.field instanceof Object).assertTrue()
      expect(A_F1099.field).assertEqual(5)
          A_F1099.field = 4
      expect(A_F1099.field instanceof Object).assertTrue()
      expect(A_F1099.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_ELEVEN_2700
     * @tc.name      testFieldInitEleven0027
     * @tc.desc      Checking for changing the value from static block.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitEleven0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F1101.field instanceof long).assertTrue()
      expect(A_F1101.field).assertEqual(5)
          A_F1101.field = 4
      expect(A_F1101.field instanceof long).assertTrue()
      expect(A_F1101.field).assertEqual(4)
          A_F1101.field = 5
      expect(A_F1101.field instanceof long).assertTrue()
      expect(A_F1101.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_ELEVEN_2800
     * @tc.name      testFieldInitEleven0028
     * @tc.desc      Checking for changing the value from static block.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitEleven0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F1102.field instanceof int).assertTrue()
      expect(A_F1102.field).assertEqual(5)
          A_F1102.field = 4
      expect(A_F1102.field instanceof int).assertTrue()
      expect(A_F1102.field).assertEqual(4)
          A_F1102.field = 5
      expect(A_F1102.field instanceof int).assertTrue()
      expect(A_F1102.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_ELEVEN_2900
     * @tc.name      testFieldInitEleven0029
     * @tc.desc      Checking for changing the value from static block.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitEleven0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F1103.field instanceof byte).assertTrue()
      expect(A_F1103.field).assertEqual(5)
          A_F1103.field = 4
      expect(A_F1103.field instanceof byte).assertTrue()
      expect(A_F1103.field).assertEqual(4)
          A_F1103.field = 5
      expect(A_F1103.field instanceof byte).assertTrue()
      expect(A_F1103.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_ELEVEN_3000
     * @tc.name      testFieldInitEleven0030
     * @tc.desc      Checking for changing the value from static block.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitEleven0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F1104.field instanceof short).assertTrue()
      expect(A_F1104.field).assertEqual(5)
          A_F1104.field = 4
      expect(A_F1104.field instanceof short).assertTrue()
      expect(A_F1104.field).assertEqual(4)
          A_F1104.field = 5
      expect(A_F1104.field instanceof short).assertTrue()
      expect(A_F1104.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_ELEVEN_3100
     * @tc.name      testFieldInitEleven0031
     * @tc.desc      Checking for changing the value from static block.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitEleven0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F1105.field instanceof double).assertTrue()
      expect(A_F1105.field).assertEqual(7.3)
          A_F1105.field = 4
      expect(A_F1105.field instanceof double).assertTrue()
      expect(A_F1105.field).assertEqual(4)
          A_F1105.field = 7.3
      expect(A_F1105.field instanceof double).assertTrue()
      expect(A_F1105.field).assertEqual(7.3)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_ELEVEN_3200
     * @tc.name      testFieldInitEleven0032
     * @tc.desc      Checking for changing the value from static block.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitEleven0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F1106.field instanceof number).assertTrue()
      expect(A_F1106.field).assertEqual(5)
          A_F1106.field = 4
      expect(A_F1106.field instanceof number).assertTrue()
      expect(A_F1106.field).assertEqual(4)
          A_F1106.field = 5
      expect(A_F1106.field instanceof number).assertTrue()
      expect(A_F1106.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_ELEVEN_3300
     * @tc.name      testFieldInitEleven0033
     * @tc.desc      Checking for changing the value from static block.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitEleven0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F1107.field instanceof float).assertTrue()
      expect(A_F1107.field).assertEqual(7.3f)
          A_F1107.field = 4.5f
      expect(A_F1107.field instanceof float).assertTrue()
      expect(A_F1107.field).assertEqual(4.5f)
          A_F1107.field = 7.3f
      expect(A_F1107.field instanceof float).assertTrue()
      expect(A_F1107.field).assertEqual(7.3f)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_ELEVEN_3400
     * @tc.name      testFieldInitEleven0034
     * @tc.desc      Checking for changing the value from static block.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitEleven0034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F1108.field instanceof bigint).assertTrue()
      expect(A_F1108.field).assertEqual(5n)
          A_F1108.field = 4n
      expect(A_F1108.field instanceof bigint).assertTrue()
      expect(A_F1108.field).assertEqual(4n)
          A_F1108.field = 5n
      expect(A_F1108.field instanceof bigint).assertTrue()
      expect(A_F1108.field).assertEqual(5n)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_ELEVEN_3500
     * @tc.name      testFieldInitEleven0035
     * @tc.desc      Checking for changing the value from static block.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitEleven0035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F1109.field instanceof string).assertTrue()
      expect(A_F1109.field).assertEqual("efg")
          A_F1109.field = "abc"
      expect(A_F1109.field instanceof string).assertTrue()
      expect(A_F1109.field).assertEqual("abc")
          A_F1109.field = "efg"
      expect(A_F1109.field instanceof string).assertTrue()
      expect(A_F1109.field).assertEqual("efg")
    })

    /**
     * @tc.number    SUB_FIELD_INIT_ELEVEN_3600
     * @tc.name      testFieldInitEleven0036
     * @tc.desc      Checking for changing the value from static block.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitEleven0036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F1110.field instanceof char).assertTrue()
      expect(A_F1110.field).assertEqual(c'b')
          A_F1110.field = c'a'
      expect(A_F1110.field instanceof char).assertTrue()
      expect(A_F1110.field).assertEqual(c'a')
          A_F1110.field = c'b'
      expect(A_F1110.field instanceof char).assertTrue()
      expect(A_F1110.field).assertEqual(c'b')
    })

    /**
     * @tc.number    SUB_FIELD_INIT_ELEVEN_3700
     * @tc.name      testFieldInitEleven0037
     * @tc.desc      Checking for changing the value from static block.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitEleven0037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F1111.field instanceof boolean).assertTrue()
      expect(A_F1111.field).assertEqual(true)
          A_F1111.field = false
      expect(A_F1111.field instanceof boolean).assertTrue()
      expect(A_F1111.field).assertEqual(false)
          A_F1111.field = true
      expect(A_F1111.field instanceof boolean).assertTrue()
      expect(A_F1111.field).assertEqual(true)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_ELEVEN_3800
     * @tc.name      testFieldInitEleven0038
     * @tc.desc      Checking for changing the value from static block.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitEleven0038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F1112.field instanceof Object).assertTrue()
      expect(A_F1112.field).assertEqual(5)
          A_F1112.field = 4
      expect(A_F1112.field instanceof Object).assertTrue()
      expect(A_F1112.field).assertEqual(4)
          A_F1112.field = 5
      expect(A_F1112.field instanceof Object).assertTrue()
      expect(A_F1112.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_ELEVEN_3900
     * @tc.name      testFieldInitEleven0039
     * @tc.desc      Checking for changing the value from static block.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitEleven0039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F1113.field instanceof Object).assertTrue()
      expect(A_F1113.field).assertEqual(5)
          A_F1113.field = undefined
      expect(A_F1113.field instanceof Object).assertFalse()
      expect(A_F1113.field).assertEqual(undefined)
          A_F1113.field = 5
      expect(A_F1113.field instanceof Object).assertTrue()
      expect(A_F1113.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_ELEVEN_4000
     * @tc.name      testFieldInitEleven0040
     * @tc.desc      Checking for changing the value from static block.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitEleven0040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F1114.field instanceof Object).assertTrue()
      expect(A_F1114.field).assertEqual(5)
          A_F1114.field = 4
      expect(A_F1114.field instanceof Object).assertTrue()
      expect(A_F1114.field).assertEqual(4)
          A_F1114.field = 5
      expect(A_F1114.field instanceof Object).assertTrue()
      expect(A_F1114.field).assertEqual(5)
    })
  })
}
