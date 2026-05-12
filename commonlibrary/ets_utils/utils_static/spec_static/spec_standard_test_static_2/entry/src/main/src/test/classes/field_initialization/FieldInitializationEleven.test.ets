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

class A_F1100 {
    static field: Any
    static {
      A_F1100.field = 4
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

class A_F1115 {
    static field: Any = 4
    static {
      A_F1115.field = 5
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
    export class A_F1129 {
      static field: Any = 4
    }
  }

namespace ns {
    export class A_F1130 {
      static v: long = 4
      static field: long = A_F1130.v
    }
  }

namespace ns {
    export class A_F1131 {
      static v: int = 4
      static field: int = A_F1131.v
    }
  }

namespace ns {
    export class A_F1132 {
      static v: byte = 4
      static field: byte = A_F1132.v
    }
  }

namespace ns {
    export class A_F1133 {
      static v: short = 4
      static field: short = A_F1133.v
    }
  }

namespace ns {
    export class A_F1134 {
      static v: double = 4
      static field: double = A_F1134.v
    }
  }

namespace ns {
    export class A_F1135 {
      static v: number = 4
      static field: number = A_F1135.v
    }
  }

namespace ns {
    export class A_F1136 {
      static v: float = 4.5f
      static field: float = A_F1136.v
    }
  }

namespace ns {
    export class A_F1137 {
      static v: bigint = 4n
      static field: bigint = A_F1137.v
    }
  }

namespace ns {
    export class A_F1138 {
      static v: string = "abc"
      static field: string = A_F1138.v
    }
  }

namespace ns {
    export class A_F1139 {
      static v: char = c'a'
      static field: char = A_F1139.v
    }
  }

namespace ns {
    export class A_F1140 {
      static v: boolean = false
      static field: boolean = A_F1140.v
    }
  }

namespace ns {
    export class A_F1141 {
      static v: Object = 4
      static field: Object = A_F1141.v
    }
  }

namespace ns {
    export class A_F1142 {
      static v: Object | undefined | null = 4
      static field: Object | undefined | null = A_F1142.v
    }
  }

namespace ns {
    export class A_F1143 {
      static v: Any = 4
      static field: Any = A_F1143.v
    }
  }

namespace ns {
    export class A_F1144 {
      private static _v: long = 4
      static get v(): long {
        return A_F1144._v
      }
      static field: long = A_F1144.v
    }
  }

namespace ns {
    export class A_F1145 {
      private static _v: int = 4
      static get v(): int {
        return A_F1145._v
      }
      static field: int = A_F1145.v
    }
  }

namespace ns {
    export class A_F1146 {
      private static _v: byte = 4
      static get v(): byte {
        return A_F1146._v
      }
      static field: byte = A_F1146.v
    }
  }

namespace ns {
    export class A_F1147 {
      private static _v: short = 4
      static get v(): short {
        return A_F1147._v
      }
      static field: short = A_F1147.v
    }
  }

namespace ns {
    export class A_F1148 {
      private static _v: double = 4
      static get v(): double {
        return A_F1148._v
      }
      static field: double = A_F1148.v
    }
  }

namespace ns {
    export class A_F1149 {
      private static _v: int = 4
      static get v(): number {
        return A_F1149._v
      }
      static field: number = A_F1149.v
    }
  }

namespace ns {
    export class A_F1150 {
      private static _v: float = 4.5f
      static get v(): float {
        return A_F1150._v
      }
      static field: float = A_F1150.v
    }
  }

namespace ns {
    export class A_F1151 {
      private static _v: bigint = 4n
      static get v(): bigint {
        return A_F1151._v
      }
      static field: bigint = A_F1151.v
    }
  }

namespace ns {
    export class A_F1152 {
      private static _v: string = "abc"
      static get v(): string {
        return A_F1152._v
      }
      static field: string = A_F1152.v
    }
  }

namespace ns {
    export class A_F1153 {
      private static _v: char = c'a'
      static get v(): char {
        return A_F1153._v
      }
      static field: char = A_F1153.v
    }
  }

namespace ns {
    export class A_F1154 {
      private static _v: boolean = false
      static get v(): boolean {
        return A_F1154._v
      }
      static field: boolean = A_F1154.v
    }
  }

namespace ns {
    export class A_F1155 {
      private static _v: Object = 4
      static get v(): Object {
        return A_F1155._v
      }
      static field: Object = A_F1155.v
    }
  }

namespace ns {
    export class A_F1156 {
      private static _v: Object | undefined | null = 4
      static get v(): Object | undefined | null {
        return A_F1156._v
      }
      static field: Object | undefined | null = A_F1156.v
    }
  }

namespace ns {
    export class A_F1157 {
      private static _v: Any = 4
      static get v(): Any {
        return A_F1157._v
      }
      static field: Any = A_F1157.v
    }
  }

namespace ns {
    export class Base_F1158 {
      private static _v: long = 4
      static get v(): long {
        return Base_F1158._v
      }
    }
    export class A_F1158 extends Base_F1158 {
      static field: long = Base_F1158.v
    }
  }

namespace ns {
    export class Base_F1159 {
      private static _v: int = 4
      static get v(): int {
        return Base_F1159._v
      }
    }
    export class A_F1159 extends Base_F1159 {
      static field: int = Base_F1159.v
    }
  }

namespace ns {
    export class Base_F1160 {
      private static _v: byte = 4
      static get v(): byte {
        return Base_F1160._v
      }
    }
    export class A_F1160 extends Base_F1160 {
      static field: byte = Base_F1160.v
    }
  }

namespace ns {
    export class Base_F1161 {
      private static _v: short = 4
      static get v(): short {
        return Base_F1161._v
      }
    }
    export class A_F1161 extends Base_F1161 {
      static field: short = Base_F1161.v
    }
  }

namespace ns {
    export class Base_F1162 {
      private static _v: double = 4
      static get v(): double {
        return Base_F1162._v
      }
    }
    export class A_F1162 extends Base_F1162 {
      static field: double = Base_F1162.v
    }
  }

namespace ns {
    export class Base_F1163 {
      private static _v: int = 4
      static get v(): number {
        return Base_F1163._v
      }
    }
    export class A_F1163 extends Base_F1163 {
      static field: number = Base_F1163.v
    }
  }

namespace ns {
    export class Base_F1164 {
      private static _v: float = 4.5f
      static get v(): float {
        return Base_F1164._v
      }
    }
    export class A_F1164 extends Base_F1164 {
      static field: float = Base_F1164.v
    }
  }

namespace ns {
    export class Base_F1165 {
      private static _v: bigint = 4n
      static get v(): bigint {
        return Base_F1165._v
      }
    }
    export class A_F1165 extends Base_F1165 {
      static field: bigint = Base_F1165.v
    }
  }

namespace ns {
    export class Base_F1166 {
      private static _v: string = "abc"
      static get v(): string {
        return Base_F1166._v
      }
    }
    export class A_F1166 extends Base_F1166 {
      static field: string = Base_F1166.v
    }
  }

namespace ns {
    export class Base_F1167 {
      private static _v: char = c'a'
      static get v(): char {
        return Base_F1167._v
      }
    }
    export class A_F1167 extends Base_F1167 {
      static field: char = Base_F1167.v
    }
  }

namespace ns {
    export class Base_F1168 {
      private static _v: boolean = false
      static get v(): boolean {
        return Base_F1168._v
      }
    }
    export class A_F1168 extends Base_F1168 {
      static field: boolean = Base_F1168.v
    }
  }

namespace ns {
    export class Base_F1169 {
      private static _v: Object = 4
      static get v(): Object {
        return Base_F1169._v
      }
    }
    export class A_F1169 extends Base_F1169 {
      static field: Object = Base_F1169.v
    }
  }

namespace ns {
    export class Base_F1170 {
      private static _v: Object | undefined | null = 4
      static get v(): Object | undefined | null {
        return Base_F1170._v
      }
    }
    export class A_F1170 extends Base_F1170 {
      static field: Object | undefined | null = Base_F1170.v
    }
  }

namespace ns {
    export class Base_F1171 {
      private static _v: Any = 4
      static get v(): Any {
        return Base_F1171._v
      }
    }
    export class A_F1171 extends Base_F1171 {
      static field: Any = Base_F1171.v
    }
  }

namespace ns {
    function foo(): long {
      return 4
    }
    export class A_F1172 {
      static field: long = foo()
    }
  }

namespace ns {
    function foo(): int {
      return 4
    }
    export class A_F1173 {
      static field: int = foo()
    }
  }

namespace ns {
    function foo(): byte {
      return 4
    }
    export class A_F1174 {
      static field: byte = foo()
    }
  }

namespace ns {
    function foo(): short {
      return 4
    }
    export class A_F1175 {
      static field: short = foo()
    }
  }

namespace ns {
    function foo(): double {
      return 4
    }
    export class A_F1176 {
      static field: double = foo()
    }
  }

namespace ns {
    function foo(): number {
      return 4
    }
    export class A_F1177 {
      static field: number = foo()
    }
  }

namespace ns {
    function foo(): float {
      return 4.5f
    }
    export class A_F1178 {
      static field: float = foo()
    }
  }

namespace ns {
    function foo(): bigint {
      return 4n
    }
    export class A_F1179 {
      static field: bigint = foo()
    }
  }

namespace ns {
    function foo(): string {
      return "abc"
    }
    export class A_F1180 {
      static field: string = foo()
    }
  }

namespace ns {
    function foo(): char {
      return c'a'
    }
    export class A_F1181 {
      static field: char = foo()
    }
  }

namespace ns {
    function foo(): boolean {
      return false
    }
    export class A_F1182 {
      static field: boolean = foo()
    }
  }

namespace ns {
    function foo(): Object {
      return 4
    }
    export class A_F1183 {
      static field: Object = foo()
    }
  }

namespace ns {
    function foo(): Object | undefined | null {
      return 4
    }
    export class A_F1184 {
      static field: Object | undefined | null = foo()
    }
  }

namespace ns {
    function foo(): Any {
      return 4
    }
    export class A_F1185 {
      static field: Any = foo()
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

export default function FieldInitializationTestEleven(): void {
  describe("FieldInitializationTestEleven", () => {
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
     * @tc.number    SUB_FIELD_INIT_TEST_1090
     * @tc.name      testFieldInit1090
     * @tc.desc      Checking for changing the value from static block.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit1090", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_TEST_1091
     * @tc.name      testFieldInit1091
     * @tc.desc      Checking for changing the value from static block.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit1091", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_TEST_1092
     * @tc.name      testFieldInit1092
     * @tc.desc      Checking for changing the value from static block.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit1092", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_TEST_1093
     * @tc.name      testFieldInit1093
     * @tc.desc      Checking for changing the value from static block.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit1093", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_TEST_1094
     * @tc.name      testFieldInit1094
     * @tc.desc      Checking for changing the value from static block.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit1094", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_TEST_1095
     * @tc.name      testFieldInit1095
     * @tc.desc      Checking for changing the value from static block.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit1095", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_TEST_1096
     * @tc.name      testFieldInit1096
     * @tc.desc      Checking for changing the value from static block.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit1096", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_TEST_1097
     * @tc.name      testFieldInit1097
     * @tc.desc      Checking for changing the value from static block.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit1097", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_TEST_1098
     * @tc.name      testFieldInit1098
     * @tc.desc      Checking for changing the value from static block.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit1098", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F1098.field instanceof Object | undefined).assertTrue()
      expect(A_F1098.field).assertEqual(undefined)
          A_F1098.field = 5
      expect(A_F1098.field instanceof Object | undefined).assertTrue()
      expect(A_F1098.field).assertEqual(5)
          A_F1098.field = undefined
      expect(A_F1098.field instanceof Object | undefined).assertTrue()
      expect(A_F1098.field).assertEqual(undefined)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_1099
     * @tc.name      testFieldInit1099
     * @tc.desc      Checking for changing the value from static block.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit1099", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F1099.field instanceof Object | undefined | null).assertTrue()
      expect(A_F1099.field).assertEqual(4)
          A_F1099.field = 5
      expect(A_F1099.field instanceof Object | undefined | null).assertTrue()
      expect(A_F1099.field).assertEqual(5)
          A_F1099.field = 4
      expect(A_F1099.field instanceof Object | undefined | null).assertTrue()
      expect(A_F1099.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_1100
     * @tc.name      testFieldInit1100
     * @tc.desc      Checking for changing the value from static block.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit1100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F1100.field instanceof Any).assertTrue()
      expect(A_F1100.field).assertEqual(4)
          A_F1100.field = 5
      expect(A_F1100.field instanceof Any).assertTrue()
      expect(A_F1100.field).assertEqual(5)
          A_F1100.field = 4
      expect(A_F1100.field instanceof Any).assertTrue()
      expect(A_F1100.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_1101
     * @tc.name      testFieldInit1101
     * @tc.desc      Checking for changing the value from static block.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit1101", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_TEST_1102
     * @tc.name      testFieldInit1102
     * @tc.desc      Checking for changing the value from static block.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit1102", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_TEST_1103
     * @tc.name      testFieldInit1103
     * @tc.desc      Checking for changing the value from static block.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit1103", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_TEST_1104
     * @tc.name      testFieldInit1104
     * @tc.desc      Checking for changing the value from static block.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit1104", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_TEST_1105
     * @tc.name      testFieldInit1105
     * @tc.desc      Checking for changing the value from static block.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit1105", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_TEST_1106
     * @tc.name      testFieldInit1106
     * @tc.desc      Checking for changing the value from static block.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit1106", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_TEST_1107
     * @tc.name      testFieldInit1107
     * @tc.desc      Checking for changing the value from static block.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit1107", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F1107.field instanceof float).assertTrue()
      expect(A_F1107.field).assertEqual(7.3f)
          A_F1107.field = 4.5f
      expect(A_F1107.field instanceof float).assertTrue()
      expect(A_F1107.field).assertEqual(4.5f)
          A_F1107.field = 7.3f
      expect(A_F1107.field instanceof float).assertTrue()
      expect(A_F1107.field).assertEqual(7.3f)
    })
