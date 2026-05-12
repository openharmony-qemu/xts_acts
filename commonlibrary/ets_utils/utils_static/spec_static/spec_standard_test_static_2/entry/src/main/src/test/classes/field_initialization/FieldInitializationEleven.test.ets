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

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_1108
     * @tc.name      testFieldInit1108
     * @tc.desc      Checking for changing the value from static block.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit1108", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_TEST_1109
     * @tc.name      testFieldInit1109
     * @tc.desc      Checking for changing the value from static block.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit1109", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_TEST_1110
     * @tc.name      testFieldInit1110
     * @tc.desc      Checking for changing the value from static block.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit1110", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_TEST_1111
     * @tc.name      testFieldInit1111
     * @tc.desc      Checking for changing the value from static block.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit1111", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_TEST_1112
     * @tc.name      testFieldInit1112
     * @tc.desc      Checking for changing the value from static block.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit1112", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_TEST_1113
     * @tc.name      testFieldInit1113
     * @tc.desc      Checking for changing the value from static block.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit1113", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F1113.field instanceof Object | undefined).assertTrue()
      expect(A_F1113.field).assertEqual(5)
          A_F1113.field = undefined
      expect(A_F1113.field instanceof Object | undefined).assertTrue()
      expect(A_F1113.field).assertEqual(undefined)
          A_F1113.field = 5
      expect(A_F1113.field instanceof Object | undefined).assertTrue()
      expect(A_F1113.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_1114
     * @tc.name      testFieldInit1114
     * @tc.desc      Checking for changing the value from static block.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit1114", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F1114.field instanceof Object | undefined | null).assertTrue()
      expect(A_F1114.field).assertEqual(5)
          A_F1114.field = 4
      expect(A_F1114.field instanceof Object | undefined | null).assertTrue()
      expect(A_F1114.field).assertEqual(4)
          A_F1114.field = 5
      expect(A_F1114.field instanceof Object | undefined | null).assertTrue()
      expect(A_F1114.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_1115
     * @tc.name      testFieldInit1115
     * @tc.desc      Checking for changing the value from static block.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit1115", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F1115.field instanceof Any).assertTrue()
      expect(A_F1115.field).assertEqual(5)
          A_F1115.field = 4
      expect(A_F1115.field instanceof Any).assertTrue()
      expect(A_F1115.field).assertEqual(4)
          A_F1115.field = 5
      expect(A_F1115.field instanceof Any).assertTrue()
      expect(A_F1115.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_1116
     * @tc.name      testFieldInit1116
     * @tc.desc      Checking for initialization with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit1116", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ns.A_F1116.field instanceof long).assertTrue()
      expect(ns.A_F1116.field).assertEqual(4)
          ns.A_F1116.field = 5
      expect(ns.A_F1116.field instanceof long).assertTrue()
      expect(ns.A_F1116.field).assertEqual(5)
          ns.A_F1116.field = 4
      expect(ns.A_F1116.field instanceof long).assertTrue()
      expect(ns.A_F1116.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_1117
     * @tc.name      testFieldInit1117
     * @tc.desc      Checking for initialization with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit1117", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ns.A_F1117.field instanceof int).assertTrue()
      expect(ns.A_F1117.field).assertEqual(4)
          ns.A_F1117.field = 5
      expect(ns.A_F1117.field instanceof int).assertTrue()
      expect(ns.A_F1117.field).assertEqual(5)
          ns.A_F1117.field = 4
      expect(ns.A_F1117.field instanceof int).assertTrue()
      expect(ns.A_F1117.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_1118
     * @tc.name      testFieldInit1118
     * @tc.desc      Checking for initialization with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit1118", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ns.A_F1118.field instanceof byte).assertTrue()
      expect(ns.A_F1118.field).assertEqual(4)
          ns.A_F1118.field = 5
      expect(ns.A_F1118.field instanceof byte).assertTrue()
      expect(ns.A_F1118.field).assertEqual(5)
          ns.A_F1118.field = 4
      expect(ns.A_F1118.field instanceof byte).assertTrue()
      expect(ns.A_F1118.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_1119
     * @tc.name      testFieldInit1119
     * @tc.desc      Checking for initialization with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit1119", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ns.A_F1119.field instanceof short).assertTrue()
      expect(ns.A_F1119.field).assertEqual(4)
          ns.A_F1119.field = 5
      expect(ns.A_F1119.field instanceof short).assertTrue()
      expect(ns.A_F1119.field).assertEqual(5)
          ns.A_F1119.field = 4
      expect(ns.A_F1119.field instanceof short).assertTrue()
      expect(ns.A_F1119.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_1120
     * @tc.name      testFieldInit1120
     * @tc.desc      Checking for initialization with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit1120", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ns.A_F1120.field instanceof double).assertTrue()
      expect(ns.A_F1120.field).assertEqual(4)
          ns.A_F1120.field = 7.3
      expect(ns.A_F1120.field instanceof double).assertTrue()
      expect(ns.A_F1120.field).assertEqual(7.3)
          ns.A_F1120.field = 4
      expect(ns.A_F1120.field instanceof double).assertTrue()
      expect(ns.A_F1120.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_1121
     * @tc.name      testFieldInit1121
     * @tc.desc      Checking for initialization with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit1121", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ns.A_F1121.field instanceof number).assertTrue()
      expect(ns.A_F1121.field).assertEqual(4)
          ns.A_F1121.field = 5
      expect(ns.A_F1121.field instanceof number).assertTrue()
      expect(ns.A_F1121.field).assertEqual(5)
          ns.A_F1121.field = 4
      expect(ns.A_F1121.field instanceof number).assertTrue()
      expect(ns.A_F1121.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_1122
     * @tc.name      testFieldInit1122
     * @tc.desc      Checking for initialization with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit1122", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ns.A_F1122.field instanceof float).assertTrue()
      expect(ns.A_F1122.field).assertEqual(4.5f)
          ns.A_F1122.field = 7.3f
      expect(ns.A_F1122.field instanceof float).assertTrue()
      expect(ns.A_F1122.field).assertEqual(7.3f)
          ns.A_F1122.field = 4.5f
      expect(ns.A_F1122.field instanceof float).assertTrue()
      expect(ns.A_F1122.field).assertEqual(4.5f)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_1123
     * @tc.name      testFieldInit1123
     * @tc.desc      Checking for initialization with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit1123", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ns.A_F1123.field instanceof bigint).assertTrue()
      expect(ns.A_F1123.field).assertEqual(4n)
          ns.A_F1123.field = 5n
      expect(ns.A_F1123.field instanceof bigint).assertTrue()
      expect(ns.A_F1123.field).assertEqual(5n)
          ns.A_F1123.field = 4n
      expect(ns.A_F1123.field instanceof bigint).assertTrue()
      expect(ns.A_F1123.field).assertEqual(4n)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_1124
     * @tc.name      testFieldInit1124
     * @tc.desc      Checking for initialization with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit1124", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ns.A_F1124.field instanceof string).assertTrue()
      expect(ns.A_F1124.field).assertEqual("abc")
          ns.A_F1124.field = "efg"
      expect(ns.A_F1124.field instanceof string).assertTrue()
      expect(ns.A_F1124.field).assertEqual("efg")
          ns.A_F1124.field = "abc"
      expect(ns.A_F1124.field instanceof string).assertTrue()
      expect(ns.A_F1124.field).assertEqual("abc")
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_1125
     * @tc.name      testFieldInit1125
     * @tc.desc      Checking for initialization with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit1125", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ns.A_F1125.field instanceof char).assertTrue()
      expect(ns.A_F1125.field).assertEqual(c'a')
          ns.A_F1125.field = c'b'
      expect(ns.A_F1125.field instanceof char).assertTrue()
      expect(ns.A_F1125.field).assertEqual(c'b')
          ns.A_F1125.field = c'a'
      expect(ns.A_F1125.field instanceof char).assertTrue()
      expect(ns.A_F1125.field).assertEqual(c'a')
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_1126
     * @tc.name      testFieldInit1126
     * @tc.desc      Checking for initialization with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit1126", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_TEST_1127
     * @tc.name      testFieldInit1127
     * @tc.desc      Checking for initialization with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit1127", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ns.A_F1127.field instanceof Object).assertTrue()
      expect(ns.A_F1127.field).assertEqual(4)
          ns.A_F1127.field = 5
      expect(ns.A_F1127.field instanceof Object).assertTrue()
      expect(ns.A_F1127.field).assertEqual(5)
          ns.A_F1127.field = 4
      expect(ns.A_F1127.field instanceof Object).assertTrue()
      expect(ns.A_F1127.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_1128
     * @tc.name      testFieldInit1128
     * @tc.desc      Checking for initialization with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit1128", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ns.A_F1128.field instanceof Object | undefined | null).assertTrue()
      expect(ns.A_F1128.field).assertEqual(4)
          ns.A_F1128.field = 5
      expect(ns.A_F1128.field instanceof Object | undefined | null).assertTrue()
      expect(ns.A_F1128.field).assertEqual(5)
          ns.A_F1128.field = 4
      expect(ns.A_F1128.field instanceof Object | undefined | null).assertTrue()
      expect(ns.A_F1128.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_1129
     * @tc.name      testFieldInit1129
     * @tc.desc      Checking for initialization with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit1129", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ns.A_F1129.field instanceof Any).assertTrue()
      expect(ns.A_F1129.field).assertEqual(4)
          ns.A_F1129.field = 5
      expect(ns.A_F1129.field instanceof Any).assertTrue()
      expect(ns.A_F1129.field).assertEqual(5)
          ns.A_F1129.field = 4
      expect(ns.A_F1129.field instanceof Any).assertTrue()
      expect(ns.A_F1129.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_1130
     * @tc.name      testFieldInit1130
     * @tc.desc      Checking for initialization with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit1130", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ns.A_F1130.field instanceof long).assertTrue()
      expect(ns.A_F1130.field).assertEqual(4)
          ns.A_F1130.field = 5
      expect(ns.A_F1130.field instanceof long).assertTrue()
      expect(ns.A_F1130.field).assertEqual(5)
          ns.A_F1130.field = 4
      expect(ns.A_F1130.field instanceof long).assertTrue()
      expect(ns.A_F1130.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_1131
     * @tc.name      testFieldInit1131
     * @tc.desc      Checking for initialization with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit1131", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ns.A_F1131.field instanceof int).assertTrue()
      expect(ns.A_F1131.field).assertEqual(4)
          ns.A_F1131.field = 5
      expect(ns.A_F1131.field instanceof int).assertTrue()
      expect(ns.A_F1131.field).assertEqual(5)
          ns.A_F1131.field = 4
      expect(ns.A_F1131.field instanceof int).assertTrue()
      expect(ns.A_F1131.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_1132
     * @tc.name      testFieldInit1132
     * @tc.desc      Checking for initialization with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit1132", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ns.A_F1132.field instanceof byte).assertTrue()
      expect(ns.A_F1132.field).assertEqual(4)
          ns.A_F1132.field = 5
      expect(ns.A_F1132.field instanceof byte).assertTrue()
      expect(ns.A_F1132.field).assertEqual(5)
          ns.A_F1132.field = 4
      expect(ns.A_F1132.field instanceof byte).assertTrue()
      expect(ns.A_F1132.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_1133
     * @tc.name      testFieldInit1133
     * @tc.desc      Checking for initialization with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit1133", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ns.A_F1133.field instanceof short).assertTrue()
      expect(ns.A_F1133.field).assertEqual(4)
          ns.A_F1133.field = 5
      expect(ns.A_F1133.field instanceof short).assertTrue()
      expect(ns.A_F1133.field).assertEqual(5)
          ns.A_F1133.field = 4
      expect(ns.A_F1133.field instanceof short).assertTrue()
      expect(ns.A_F1133.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_1134
     * @tc.name      testFieldInit1134
     * @tc.desc      Checking for initialization with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit1134", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ns.A_F1134.field instanceof double).assertTrue()
      expect(ns.A_F1134.field).assertEqual(4)
          ns.A_F1134.field = 7.3
      expect(ns.A_F1134.field instanceof double).assertTrue()
      expect(ns.A_F1134.field).assertEqual(7.3)
          ns.A_F1134.field = 4
      expect(ns.A_F1134.field instanceof double).assertTrue()
      expect(ns.A_F1134.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_1135
     * @tc.name      testFieldInit1135
     * @tc.desc      Checking for initialization with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit1135", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ns.A_F1135.field instanceof number).assertTrue()
      expect(ns.A_F1135.field).assertEqual(4)
          ns.A_F1135.field = 5
      expect(ns.A_F1135.field instanceof number).assertTrue()
      expect(ns.A_F1135.field).assertEqual(5)
          ns.A_F1135.field = 4
      expect(ns.A_F1135.field instanceof number).assertTrue()
      expect(ns.A_F1135.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_1136
     * @tc.name      testFieldInit1136
     * @tc.desc      Checking for initialization with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit1136", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ns.A_F1136.field instanceof float).assertTrue()
      expect(ns.A_F1136.field).assertEqual(4.5f)
          ns.A_F1136.field = 7.3f
      expect(ns.A_F1136.field instanceof float).assertTrue()
      expect(ns.A_F1136.field).assertEqual(7.3f)
          ns.A_F1136.field = 4.5f
      expect(ns.A_F1136.field instanceof float).assertTrue()
      expect(ns.A_F1136.field).assertEqual(4.5f)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_1137
     * @tc.name      testFieldInit1137
     * @tc.desc      Checking for initialization with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit1137", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ns.A_F1137.field instanceof bigint).assertTrue()
      expect(ns.A_F1137.field).assertEqual(4n)
          ns.A_F1137.field = 5n
      expect(ns.A_F1137.field instanceof bigint).assertTrue()
      expect(ns.A_F1137.field).assertEqual(5n)
          ns.A_F1137.field = 4n
      expect(ns.A_F1137.field instanceof bigint).assertTrue()
      expect(ns.A_F1137.field).assertEqual(4n)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_1138
     * @tc.name      testFieldInit1138
     * @tc.desc      Checking for initialization with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit1138", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ns.A_F1138.field instanceof string).assertTrue()
      expect(ns.A_F1138.field).assertEqual("abc")
          ns.A_F1138.field = "efg"
      expect(ns.A_F1138.field instanceof string).assertTrue()
      expect(ns.A_F1138.field).assertEqual("efg")
          ns.A_F1138.field = "abc"
      expect(ns.A_F1138.field instanceof string).assertTrue()
      expect(ns.A_F1138.field).assertEqual("abc")
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_1139
     * @tc.name      testFieldInit1139
     * @tc.desc      Checking for initialization with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit1139", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ns.A_F1139.field instanceof char).assertTrue()
      expect(ns.A_F1139.field).assertEqual(c'a')
          ns.A_F1139.field = c'b'
      expect(ns.A_F1139.field instanceof char).assertTrue()
      expect(ns.A_F1139.field).assertEqual(c'b')
          ns.A_F1139.field = c'a'
      expect(ns.A_F1139.field instanceof char).assertTrue()
      expect(ns.A_F1139.field).assertEqual(c'a')
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_1140
     * @tc.name      testFieldInit1140
     * @tc.desc      Checking for initialization with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit1140", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ns.A_F1140.field instanceof boolean).assertTrue()
      expect(ns.A_F1140.field).assertEqual(false)
          ns.A_F1140.field = true
      expect(ns.A_F1140.field instanceof boolean).assertTrue()
      expect(ns.A_F1140.field).assertEqual(true)
          ns.A_F1140.field = false
      expect(ns.A_F1140.field instanceof boolean).assertTrue()
      expect(ns.A_F1140.field).assertEqual(false)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_1141
     * @tc.name      testFieldInit1141
     * @tc.desc      Checking for initialization with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit1141", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ns.A_F1141.field instanceof Object).assertTrue()
      expect(ns.A_F1141.field).assertEqual(4)
          ns.A_F1141.field = 5
      expect(ns.A_F1141.field instanceof Object).assertTrue()
      expect(ns.A_F1141.field).assertEqual(5)
          ns.A_F1141.field = 4
      expect(ns.A_F1141.field instanceof Object).assertTrue()
      expect(ns.A_F1141.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_1142
     * @tc.name      testFieldInit1142
     * @tc.desc      Checking for initialization with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit1142", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ns.A_F1142.field instanceof Object | undefined | null).assertTrue()
      expect(ns.A_F1142.field).assertEqual(4)
          ns.A_F1142.field = 5
      expect(ns.A_F1142.field instanceof Object | undefined | null).assertTrue()
      expect(ns.A_F1142.field).assertEqual(5)
          ns.A_F1142.field = 4
      expect(ns.A_F1142.field instanceof Object | undefined | null).assertTrue()
      expect(ns.A_F1142.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_1143
     * @tc.name      testFieldInit1143
     * @tc.desc      Checking for initialization with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit1143", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ns.A_F1143.field instanceof Any).assertTrue()
      expect(ns.A_F1143.field).assertEqual(4)
          ns.A_F1143.field = 5
      expect(ns.A_F1143.field instanceof Any).assertTrue()
      expect(ns.A_F1143.field).assertEqual(5)
          ns.A_F1143.field = 4
      expect(ns.A_F1143.field instanceof Any).assertTrue()
      expect(ns.A_F1143.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_1144
     * @tc.name      testFieldInit1144
     * @tc.desc      Checking for initialization with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit1144", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ns.A_F1144.field instanceof long).assertTrue()
      expect(ns.A_F1144.field).assertEqual(4)
          ns.A_F1144.field = 5
      expect(ns.A_F1144.field instanceof long).assertTrue()
      expect(ns.A_F1144.field).assertEqual(5)
          ns.A_F1144.field = 4
      expect(ns.A_F1144.field instanceof long).assertTrue()
      expect(ns.A_F1144.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_1145
     * @tc.name      testFieldInit1145
     * @tc.desc      Checking for initialization with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit1145", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ns.A_F1145.field instanceof int).assertTrue()
      expect(ns.A_F1145.field).assertEqual(4)
          ns.A_F1145.field = 5
      expect(ns.A_F1145.field instanceof int).assertTrue()
      expect(ns.A_F1145.field).assertEqual(5)
          ns.A_F1145.field = 4
      expect(ns.A_F1145.field instanceof int).assertTrue()
      expect(ns.A_F1145.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_1146
     * @tc.name      testFieldInit1146
     * @tc.desc      Checking for initialization with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit1146", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ns.A_F1146.field instanceof byte).assertTrue()
      expect(ns.A_F1146.field).assertEqual(4)
          ns.A_F1146.field = 5
      expect(ns.A_F1146.field instanceof byte).assertTrue()
      expect(ns.A_F1146.field).assertEqual(5)
          ns.A_F1146.field = 4
      expect(ns.A_F1146.field instanceof byte).assertTrue()
      expect(ns.A_F1146.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_1147
     * @tc.name      testFieldInit1147
     * @tc.desc      Checking for initialization with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit1147", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ns.A_F1147.field instanceof short).assertTrue()
      expect(ns.A_F1147.field).assertEqual(4)
          ns.A_F1147.field = 5
      expect(ns.A_F1147.field instanceof short).assertTrue()
      expect(ns.A_F1147.field).assertEqual(5)
          ns.A_F1147.field = 4
      expect(ns.A_F1147.field instanceof short).assertTrue()
      expect(ns.A_F1147.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_1148
     * @tc.name      testFieldInit1148
     * @tc.desc      Checking for initialization with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit1148", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ns.A_F1148.field instanceof double).assertTrue()
      expect(ns.A_F1148.field).assertEqual(4)
          ns.A_F1148.field = 7.3
      expect(ns.A_F1148.field instanceof double).assertTrue()
      expect(ns.A_F1148.field).assertEqual(7.3)
          ns.A_F1148.field = 4
      expect(ns.A_F1148.field instanceof double).assertTrue()
      expect(ns.A_F1148.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_1149
     * @tc.name      testFieldInit1149
     * @tc.desc      Checking for initialization with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit1149", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ns.A_F1149.field instanceof number).assertTrue()
      expect(ns.A_F1149.field).assertEqual(4)
          ns.A_F1149.field = 5
      expect(ns.A_F1149.field instanceof number).assertTrue()
      expect(ns.A_F1149.field).assertEqual(5)
          ns.A_F1149.field = 4
      expect(ns.A_F1149.field instanceof number).assertTrue()
      expect(ns.A_F1149.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_1150
     * @tc.name      testFieldInit1150
     * @tc.desc      Checking for initialization with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit1150", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ns.A_F1150.field instanceof float).assertTrue()
      expect(ns.A_F1150.field).assertEqual(4.5f)
          ns.A_F1150.field = 7.3f
      expect(ns.A_F1150.field instanceof float).assertTrue()
      expect(ns.A_F1150.field).assertEqual(7.3f)
          ns.A_F1150.field = 4.5f
      expect(ns.A_F1150.field instanceof float).assertTrue()
      expect(ns.A_F1150.field).assertEqual(4.5f)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_1151
     * @tc.name      testFieldInit1151
     * @tc.desc      Checking for initialization with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit1151", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ns.A_F1151.field instanceof bigint).assertTrue()
      expect(ns.A_F1151.field).assertEqual(4n)
          ns.A_F1151.field = 5n
      expect(ns.A_F1151.field instanceof bigint).assertTrue()
      expect(ns.A_F1151.field).assertEqual(5n)
          ns.A_F1151.field = 4n
      expect(ns.A_F1151.field instanceof bigint).assertTrue()
      expect(ns.A_F1151.field).assertEqual(4n)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_1152
     * @tc.name      testFieldInit1152
     * @tc.desc      Checking for initialization with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit1152", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ns.A_F1152.field instanceof string).assertTrue()
      expect(ns.A_F1152.field).assertEqual("abc")
          ns.A_F1152.field = "efg"
      expect(ns.A_F1152.field instanceof string).assertTrue()
      expect(ns.A_F1152.field).assertEqual("efg")
          ns.A_F1152.field = "abc"
      expect(ns.A_F1152.field instanceof string).assertTrue()
      expect(ns.A_F1152.field).assertEqual("abc")
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_1153
     * @tc.name      testFieldInit1153
     * @tc.desc      Checking for initialization with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit1153", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ns.A_F1153.field instanceof char).assertTrue()
      expect(ns.A_F1153.field).assertEqual(c'a')
          ns.A_F1153.field = c'b'
      expect(ns.A_F1153.field instanceof char).assertTrue()
      expect(ns.A_F1153.field).assertEqual(c'b')
          ns.A_F1153.field = c'a'
      expect(ns.A_F1153.field instanceof char).assertTrue()
      expect(ns.A_F1153.field).assertEqual(c'a')
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_1154
     * @tc.name      testFieldInit1154
     * @tc.desc      Checking for initialization with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit1154", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ns.A_F1154.field instanceof boolean).assertTrue()
      expect(ns.A_F1154.field).assertEqual(false)
          ns.A_F1154.field = true
      expect(ns.A_F1154.field instanceof boolean).assertTrue()
      expect(ns.A_F1154.field).assertEqual(true)
          ns.A_F1154.field = false
      expect(ns.A_F1154.field instanceof boolean).assertTrue()
      expect(ns.A_F1154.field).assertEqual(false)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_1155
     * @tc.name      testFieldInit1155
     * @tc.desc      Checking for initialization with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit1155", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ns.A_F1155.field instanceof Object).assertTrue()
      expect(ns.A_F1155.field).assertEqual(4)
          ns.A_F1155.field = 5
      expect(ns.A_F1155.field instanceof Object).assertTrue()
      expect(ns.A_F1155.field).assertEqual(5)
          ns.A_F1155.field = 4
      expect(ns.A_F1155.field instanceof Object).assertTrue()
      expect(ns.A_F1155.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_1156
     * @tc.name      testFieldInit1156
     * @tc.desc      Checking for initialization with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit1156", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ns.A_F1156.field instanceof Object | undefined | null).assertTrue()
      expect(ns.A_F1156.field).assertEqual(4)
          ns.A_F1156.field = 5
      expect(ns.A_F1156.field instanceof Object | undefined | null).assertTrue()
      expect(ns.A_F1156.field).assertEqual(5)
          ns.A_F1156.field = 4
      expect(ns.A_F1156.field instanceof Object | undefined | null).assertTrue()
      expect(ns.A_F1156.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_1157
     * @tc.name      testFieldInit1157
     * @tc.desc      Checking for initialization with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit1157", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ns.A_F1157.field instanceof Any).assertTrue()
      expect(ns.A_F1157.field).assertEqual(4)
          ns.A_F1157.field = 5
      expect(ns.A_F1157.field instanceof Any).assertTrue()
      expect(ns.A_F1157.field).assertEqual(5)
          ns.A_F1157.field = 4
      expect(ns.A_F1157.field instanceof Any).assertTrue()
      expect(ns.A_F1157.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_1158
     * @tc.name      testFieldInit1158
     * @tc.desc      Checking for initialization with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit1158", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ns.A_F1158.field instanceof long).assertTrue()
      expect(ns.A_F1158.field).assertEqual(4)
          ns.A_F1158.field = 5
      expect(ns.A_F1158.field instanceof long).assertTrue()
      expect(ns.A_F1158.field).assertEqual(5)
          ns.A_F1158.field = 4
      expect(ns.A_F1158.field instanceof long).assertTrue()
      expect(ns.A_F1158.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_1159
     * @tc.name      testFieldInit1159
     * @tc.desc      Checking for initialization with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit1159", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ns.A_F1159.field instanceof int).assertTrue()
      expect(ns.A_F1159.field).assertEqual(4)
          ns.A_F1159.field = 5
      expect(ns.A_F1159.field instanceof int).assertTrue()
      expect(ns.A_F1159.field).assertEqual(5)
          ns.A_F1159.field = 4
      expect(ns.A_F1159.field instanceof int).assertTrue()
      expect(ns.A_F1159.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_1160
     * @tc.name      testFieldInit1160
     * @tc.desc      Checking for initialization with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit1160", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ns.A_F1160.field instanceof byte).assertTrue()
      expect(ns.A_F1160.field).assertEqual(4)
          ns.A_F1160.field = 5
      expect(ns.A_F1160.field instanceof byte).assertTrue()
      expect(ns.A_F1160.field).assertEqual(5)
          ns.A_F1160.field = 4
      expect(ns.A_F1160.field instanceof byte).assertTrue()
      expect(ns.A_F1160.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_1161
     * @tc.name      testFieldInit1161
     * @tc.desc      Checking for initialization with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit1161", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ns.A_F1161.field instanceof short).assertTrue()
      expect(ns.A_F1161.field).assertEqual(4)
          ns.A_F1161.field = 5
      expect(ns.A_F1161.field instanceof short).assertTrue()
      expect(ns.A_F1161.field).assertEqual(5)
          ns.A_F1161.field = 4
      expect(ns.A_F1161.field instanceof short).assertTrue()
      expect(ns.A_F1161.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_1162
     * @tc.name      testFieldInit1162
     * @tc.desc      Checking for initialization with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit1162", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ns.A_F1162.field instanceof double).assertTrue()
      expect(ns.A_F1162.field).assertEqual(4)
          ns.A_F1162.field = 7.3
      expect(ns.A_F1162.field instanceof double).assertTrue()
      expect(ns.A_F1162.field).assertEqual(7.3)
          ns.A_F1162.field = 4
      expect(ns.A_F1162.field instanceof double).assertTrue()
      expect(ns.A_F1162.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_1163
     * @tc.name      testFieldInit1163
     * @tc.desc      Checking for initialization with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit1163", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ns.A_F1163.field instanceof number).assertTrue()
      expect(ns.A_F1163.field).assertEqual(4)
          ns.A_F1163.field = 5
      expect(ns.A_F1163.field instanceof number).assertTrue()
      expect(ns.A_F1163.field).assertEqual(5)
          ns.A_F1163.field = 4
      expect(ns.A_F1163.field instanceof number).assertTrue()
      expect(ns.A_F1163.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_1164
     * @tc.name      testFieldInit1164
     * @tc.desc      Checking for initialization with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit1164", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ns.A_F1164.field instanceof float).assertTrue()
      expect(ns.A_F1164.field).assertEqual(4.5f)
          ns.A_F1164.field = 7.3f
      expect(ns.A_F1164.field instanceof float).assertTrue()
      expect(ns.A_F1164.field).assertEqual(7.3f)
          ns.A_F1164.field = 4.5f
      expect(ns.A_F1164.field instanceof float).assertTrue()
      expect(ns.A_F1164.field).assertEqual(4.5f)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_1165
     * @tc.name      testFieldInit1165
     * @tc.desc      Checking for initialization with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit1165", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ns.A_F1165.field instanceof bigint).assertTrue()
      expect(ns.A_F1165.field).assertEqual(4n)
          ns.A_F1165.field = 5n
      expect(ns.A_F1165.field instanceof bigint).assertTrue()
      expect(ns.A_F1165.field).assertEqual(5n)
          ns.A_F1165.field = 4n
      expect(ns.A_F1165.field instanceof bigint).assertTrue()
      expect(ns.A_F1165.field).assertEqual(4n)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_1166
     * @tc.name      testFieldInit1166
     * @tc.desc      Checking for initialization with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit1166", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ns.A_F1166.field instanceof string).assertTrue()
      expect(ns.A_F1166.field).assertEqual("abc")
          ns.A_F1166.field = "efg"
      expect(ns.A_F1166.field instanceof string).assertTrue()
      expect(ns.A_F1166.field).assertEqual("efg")
          ns.A_F1166.field = "abc"
      expect(ns.A_F1166.field instanceof string).assertTrue()
      expect(ns.A_F1166.field).assertEqual("abc")
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_1167
     * @tc.name      testFieldInit1167
     * @tc.desc      Checking for initialization with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit1167", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ns.A_F1167.field instanceof char).assertTrue()
      expect(ns.A_F1167.field).assertEqual(c'a')
          ns.A_F1167.field = c'b'
      expect(ns.A_F1167.field instanceof char).assertTrue()
      expect(ns.A_F1167.field).assertEqual(c'b')
          ns.A_F1167.field = c'a'
      expect(ns.A_F1167.field instanceof char).assertTrue()
      expect(ns.A_F1167.field).assertEqual(c'a')
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_1168
     * @tc.name      testFieldInit1168
     * @tc.desc      Checking for initialization with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit1168", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ns.A_F1168.field instanceof boolean).assertTrue()
      expect(ns.A_F1168.field).assertEqual(false)
          ns.A_F1168.field = true
      expect(ns.A_F1168.field instanceof boolean).assertTrue()
      expect(ns.A_F1168.field).assertEqual(true)
          ns.A_F1168.field = false
      expect(ns.A_F1168.field instanceof boolean).assertTrue()
      expect(ns.A_F1168.field).assertEqual(false)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_1169
     * @tc.name      testFieldInit1169
     * @tc.desc      Checking for initialization with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit1169", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ns.A_F1169.field instanceof Object).assertTrue()
      expect(ns.A_F1169.field).assertEqual(4)
          ns.A_F1169.field = 5
      expect(ns.A_F1169.field instanceof Object).assertTrue()
      expect(ns.A_F1169.field).assertEqual(5)
          ns.A_F1169.field = 4
      expect(ns.A_F1169.field instanceof Object).assertTrue()
      expect(ns.A_F1169.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_1170
     * @tc.name      testFieldInit1170
     * @tc.desc      Checking for initialization with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit1170", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ns.A_F1170.field instanceof Object | undefined | null).assertTrue()
      expect(ns.A_F1170.field).assertEqual(4)
          ns.A_F1170.field = 5
      expect(ns.A_F1170.field instanceof Object | undefined | null).assertTrue()
      expect(ns.A_F1170.field).assertEqual(5)
          ns.A_F1170.field = 4
      expect(ns.A_F1170.field instanceof Object | undefined | null).assertTrue()
      expect(ns.A_F1170.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_1171
     * @tc.name      testFieldInit1171
     * @tc.desc      Checking for initialization with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit1171", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ns.A_F1171.field instanceof Any).assertTrue()
      expect(ns.A_F1171.field).assertEqual(4)
          ns.A_F1171.field = 5
      expect(ns.A_F1171.field instanceof Any).assertTrue()
      expect(ns.A_F1171.field).assertEqual(5)
          ns.A_F1171.field = 4
      expect(ns.A_F1171.field instanceof Any).assertTrue()
      expect(ns.A_F1171.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_1172
     * @tc.name      testFieldInit1172
     * @tc.desc      Checking for initialization with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit1172", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ns.A_F1172.field instanceof long).assertTrue()
      expect(ns.A_F1172.field).assertEqual(4)
          ns.A_F1172.field = 5
      expect(ns.A_F1172.field instanceof long).assertTrue()
      expect(ns.A_F1172.field).assertEqual(5)
          ns.A_F1172.field = 4
      expect(ns.A_F1172.field instanceof long).assertTrue()
      expect(ns.A_F1172.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_1173
     * @tc.name      testFieldInit1173
     * @tc.desc      Checking for initialization with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit1173", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ns.A_F1173.field instanceof int).assertTrue()
      expect(ns.A_F1173.field).assertEqual(4)
          ns.A_F1173.field = 5
      expect(ns.A_F1173.field instanceof int).assertTrue()
      expect(ns.A_F1173.field).assertEqual(5)
          ns.A_F1173.field = 4
      expect(ns.A_F1173.field instanceof int).assertTrue()
      expect(ns.A_F1173.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_1174
     * @tc.name      testFieldInit1174
     * @tc.desc      Checking for initialization with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit1174", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ns.A_F1174.field instanceof byte).assertTrue()
      expect(ns.A_F1174.field).assertEqual(4)
          ns.A_F1174.field = 5
      expect(ns.A_F1174.field instanceof byte).assertTrue()
      expect(ns.A_F1174.field).assertEqual(5)
          ns.A_F1174.field = 4
      expect(ns.A_F1174.field instanceof byte).assertTrue()
      expect(ns.A_F1174.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_1175
     * @tc.name      testFieldInit1175
     * @tc.desc      Checking for initialization with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit1175", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ns.A_F1175.field instanceof short).assertTrue()
      expect(ns.A_F1175.field).assertEqual(4)
          ns.A_F1175.field = 5
      expect(ns.A_F1175.field instanceof short).assertTrue()
      expect(ns.A_F1175.field).assertEqual(5)
          ns.A_F1175.field = 4
      expect(ns.A_F1175.field instanceof short).assertTrue()
      expect(ns.A_F1175.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_1176
     * @tc.name      testFieldInit1176
     * @tc.desc      Checking for initialization with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit1176", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ns.A_F1176.field instanceof double).assertTrue()
      expect(ns.A_F1176.field).assertEqual(4)
          ns.A_F1176.field = 7.3
      expect(ns.A_F1176.field instanceof double).assertTrue()
      expect(ns.A_F1176.field).assertEqual(7.3)
          ns.A_F1176.field = 4
      expect(ns.A_F1176.field instanceof double).assertTrue()
      expect(ns.A_F1176.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_1177
     * @tc.name      testFieldInit1177
     * @tc.desc      Checking for initialization with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit1177", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ns.A_F1177.field instanceof number).assertTrue()
      expect(ns.A_F1177.field).assertEqual(4)
          ns.A_F1177.field = 5
      expect(ns.A_F1177.field instanceof number).assertTrue()
      expect(ns.A_F1177.field).assertEqual(5)
          ns.A_F1177.field = 4
      expect(ns.A_F1177.field instanceof number).assertTrue()
      expect(ns.A_F1177.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_1178
     * @tc.name      testFieldInit1178
     * @tc.desc      Checking for initialization with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit1178", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ns.A_F1178.field instanceof float).assertTrue()
      expect(ns.A_F1178.field).assertEqual(4.5f)
          ns.A_F1178.field = 7.3f
      expect(ns.A_F1178.field instanceof float).assertTrue()
      expect(ns.A_F1178.field).assertEqual(7.3f)
          ns.A_F1178.field = 4.5f
      expect(ns.A_F1178.field instanceof float).assertTrue()
      expect(ns.A_F1178.field).assertEqual(4.5f)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_1179
     * @tc.name      testFieldInit1179
     * @tc.desc      Checking for initialization with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit1179", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ns.A_F1179.field instanceof bigint).assertTrue()
      expect(ns.A_F1179.field).assertEqual(4n)
          ns.A_F1179.field = 5n
      expect(ns.A_F1179.field instanceof bigint).assertTrue()
      expect(ns.A_F1179.field).assertEqual(5n)
          ns.A_F1179.field = 4n
      expect(ns.A_F1179.field instanceof bigint).assertTrue()
      expect(ns.A_F1179.field).assertEqual(4n)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_1180
     * @tc.name      testFieldInit1180
     * @tc.desc      Checking for initialization with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit1180", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ns.A_F1180.field instanceof string).assertTrue()
      expect(ns.A_F1180.field).assertEqual("abc")
          ns.A_F1180.field = "efg"
      expect(ns.A_F1180.field instanceof string).assertTrue()
      expect(ns.A_F1180.field).assertEqual("efg")
          ns.A_F1180.field = "abc"
      expect(ns.A_F1180.field instanceof string).assertTrue()
      expect(ns.A_F1180.field).assertEqual("abc")
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_1181
     * @tc.name      testFieldInit1181
     * @tc.desc      Checking for initialization with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit1181", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ns.A_F1181.field instanceof char).assertTrue()
      expect(ns.A_F1181.field).assertEqual(c'a')
          ns.A_F1181.field = c'b'
      expect(ns.A_F1181.field instanceof char).assertTrue()
      expect(ns.A_F1181.field).assertEqual(c'b')
          ns.A_F1181.field = c'a'
      expect(ns.A_F1181.field instanceof char).assertTrue()
      expect(ns.A_F1181.field).assertEqual(c'a')
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_1182
     * @tc.name      testFieldInit1182
     * @tc.desc      Checking for initialization with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit1182", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ns.A_F1182.field instanceof boolean).assertTrue()
      expect(ns.A_F1182.field).assertEqual(false)
          ns.A_F1182.field = true
      expect(ns.A_F1182.field instanceof boolean).assertTrue()
      expect(ns.A_F1182.field).assertEqual(true)
          ns.A_F1182.field = false
      expect(ns.A_F1182.field instanceof boolean).assertTrue()
      expect(ns.A_F1182.field).assertEqual(false)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_1183
     * @tc.name      testFieldInit1183
     * @tc.desc      Checking for initialization with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit1183", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ns.A_F1183.field instanceof Object).assertTrue()
      expect(ns.A_F1183.field).assertEqual(4)
          ns.A_F1183.field = 5
      expect(ns.A_F1183.field instanceof Object).assertTrue()
      expect(ns.A_F1183.field).assertEqual(5)
          ns.A_F1183.field = 4
      expect(ns.A_F1183.field instanceof Object).assertTrue()
      expect(ns.A_F1183.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_1184
     * @tc.name      testFieldInit1184
     * @tc.desc      Checking for initialization with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit1184", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ns.A_F1184.field instanceof Object | undefined | null).assertTrue()
      expect(ns.A_F1184.field).assertEqual(4)
          ns.A_F1184.field = 5
      expect(ns.A_F1184.field instanceof Object | undefined | null).assertTrue()
      expect(ns.A_F1184.field).assertEqual(5)
          ns.A_F1184.field = 4
      expect(ns.A_F1184.field instanceof Object | undefined | null).assertTrue()
      expect(ns.A_F1184.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_1185
     * @tc.name      testFieldInit1185
     * @tc.desc      Checking for initialization with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit1185", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ns.A_F1185.field instanceof Any).assertTrue()
      expect(ns.A_F1185.field).assertEqual(4)
          ns.A_F1185.field = 5
      expect(ns.A_F1185.field instanceof Any).assertTrue()
      expect(ns.A_F1185.field).assertEqual(5)
          ns.A_F1185.field = 4
      expect(ns.A_F1185.field instanceof Any).assertTrue()
      expect(ns.A_F1185.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_1186
     * @tc.name      testFieldInit1186
     * @tc.desc      Checking for initialization with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit1186", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ns.A_F1186.field instanceof long).assertTrue()
      expect(ns.A_F1186.field).assertEqual(4)
          ns.A_F1186.field = 5
      expect(ns.A_F1186.field instanceof long).assertTrue()
      expect(ns.A_F1186.field).assertEqual(5)
          ns.A_F1186.field = 4
      expect(ns.A_F1186.field instanceof long).assertTrue()
      expect(ns.A_F1186.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_1187
     * @tc.name      testFieldInit1187
     * @tc.desc      Checking for initialization with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit1187", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ns.A_F1187.field instanceof int).assertTrue()
      expect(ns.A_F1187.field).assertEqual(4)
          ns.A_F1187.field = 5
      expect(ns.A_F1187.field instanceof int).assertTrue()
      expect(ns.A_F1187.field).assertEqual(5)
          ns.A_F1187.field = 4
      expect(ns.A_F1187.field instanceof int).assertTrue()
      expect(ns.A_F1187.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_1188
     * @tc.name      testFieldInit1188
     * @tc.desc      Checking for initialization with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit1188", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ns.A_F1188.field instanceof byte).assertTrue()
      expect(ns.A_F1188.field).assertEqual(4)
          ns.A_F1188.field = 5
      expect(ns.A_F1188.field instanceof byte).assertTrue()
      expect(ns.A_F1188.field).assertEqual(5)
          ns.A_F1188.field = 4
      expect(ns.A_F1188.field instanceof byte).assertTrue()
      expect(ns.A_F1188.field).assertEqual(4)
    })
  })
}
