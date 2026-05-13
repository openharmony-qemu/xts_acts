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
    function foo_F1171(): long {
      return 4
    }
    export class A_F1172 {
      static field: long = foo_F1171()
    }
  }

namespace ns {
    function foo_F1172(): int {
      return 4
    }
    export class A_F1173 {
      static field: int = foo_F1172()
    }
  }

namespace ns {
    function foo_F1173(): byte {
      return 4
    }
    export class A_F1174 {
      static field: byte = foo_F1173()
    }
  }

namespace ns {
    function foo_F1174(): short {
      return 4
    }
    export class A_F1175 {
      static field: short = foo_F1174()
    }
  }

namespace ns {
    function foo_F1175(): double {
      return 4
    }
    export class A_F1176 {
      static field: double = foo_F1175()
    }
  }

namespace ns {
    function foo_F1176(): number {
      return 4
    }
    export class A_F1177 {
      static field: number = foo_F1176()
    }
  }

namespace ns {
    function foo_F1177(): float {
      return 4.5f
    }
    export class A_F1178 {
      static field: float = foo_F1177()
    }
  }

namespace ns {
    function foo_F1178(): bigint {
      return 4n
    }
    export class A_F1179 {
      static field: bigint = foo_F1178()
    }
  }

namespace ns {
    function foo_F1179(): string {
      return "abc"
    }
    export class A_F1180 {
      static field: string = foo_F1179()
    }
  }

namespace ns {
    function foo_F1180(): char {
      return c'a'
    }
    export class A_F1181 {
      static field: char = foo_F1180()
    }
  }

namespace ns {
    function foo_F1181(): boolean {
      return false
    }
    export class A_F1182 {
      static field: boolean = foo_F1181()
    }
  }

namespace ns {
    function foo_F1182(): Object {
      return 4
    }
    export class A_F1183 {
      static field: Object = foo_F1182()
    }
  }

namespace ns {
    function foo_F1183(): Object | undefined | null {
      return 4
    }
    export class A_F1184 {
      static field: Object | undefined | null = foo_F1183()
    }
  }

namespace ns {
    function foo_F1184(): Any {
      return 4
    }
    export class A_F1185 {
      static field: Any = foo_F1184()
    }
function foo_F1185(): Any {
      return 5
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
     * @tc.number    SUB_FIELD_INIT_ELEVEN_0100
     * @tc.name      testFieldInitEleven0001
     * @tc.desc      Checking for changing the value from static block.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitEleven0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_ELEVEN_0200
     * @tc.name      testFieldInitEleven0002
     * @tc.desc      Checking for changing the value from static block.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitEleven0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_ELEVEN_0300
     * @tc.name      testFieldInitEleven0003
     * @tc.desc      Checking for changing the value from static block.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitEleven0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_ELEVEN_0400
     * @tc.name      testFieldInitEleven0004
     * @tc.desc      Checking for changing the value from static block.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitEleven0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_ELEVEN_0500
     * @tc.name      testFieldInitEleven0005
     * @tc.desc      Checking for changing the value from static block.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitEleven0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_ELEVEN_0600
     * @tc.name      testFieldInitEleven0006
     * @tc.desc      Checking for changing the value from static block.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitEleven0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_ELEVEN_0700
     * @tc.name      testFieldInitEleven0007
     * @tc.desc      Checking for changing the value from static block.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitEleven0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_ELEVEN_0800
     * @tc.name      testFieldInitEleven0008
     * @tc.desc      Checking for changing the value from static block.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitEleven0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_ELEVEN_0900
     * @tc.name      testFieldInitEleven0009
     * @tc.desc      Checking for changing the value from static block.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitEleven0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_ELEVEN_1000
     * @tc.name      testFieldInitEleven0010
     * @tc.desc      Checking for changing the value from static block.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitEleven0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_ELEVEN_1100
     * @tc.name      testFieldInitEleven0011
     * @tc.desc      Checking for changing the value from static block.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitEleven0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_ELEVEN_1200
     * @tc.name      testFieldInitEleven0012
     * @tc.desc      Checking for changing the value from static block.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitEleven0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_ELEVEN_1300
     * @tc.name      testFieldInitEleven0013
     * @tc.desc      Checking for changing the value from static block.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitEleven0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_ELEVEN_1400
     * @tc.name      testFieldInitEleven0014
     * @tc.desc      Checking for changing the value from static block.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitEleven0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_ELEVEN_1500
     * @tc.name      testFieldInitEleven0015
     * @tc.desc      Checking for changing the value from static block.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitEleven0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_ELEVEN_1600
     * @tc.name      testFieldInitEleven0016
     * @tc.desc      Checking for changing the value from static block.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitEleven0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_ELEVEN_1700
     * @tc.name      testFieldInitEleven0017
     * @tc.desc      Checking for changing the value from static block.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitEleven0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_ELEVEN_1800
     * @tc.name      testFieldInitEleven0018
     * @tc.desc      Checking for changing the value from static block.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitEleven0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_ELEVEN_1900
     * @tc.name      testFieldInitEleven0019
     * @tc.desc      Checking for changing the value from static block.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitEleven0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_ELEVEN_2000
     * @tc.name      testFieldInitEleven0020
     * @tc.desc      Checking for changing the value from static block.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitEleven0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_ELEVEN_2100
     * @tc.name      testFieldInitEleven0021
     * @tc.desc      Checking for changing the value from static block.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitEleven0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_ELEVEN_2200
     * @tc.name      testFieldInitEleven0022
     * @tc.desc      Checking for changing the value from static block.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitEleven0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_ELEVEN_2300
     * @tc.name      testFieldInitEleven0023
     * @tc.desc      Checking for changing the value from static block.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitEleven0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_ELEVEN_2400
     * @tc.name      testFieldInitEleven0024
     * @tc.desc      Checking for changing the value from static block.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitEleven0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_ELEVEN_2500
     * @tc.name      testFieldInitEleven0025
     * @tc.desc      Checking for changing the value from static block.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitEleven0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_ELEVEN_2600
     * @tc.name      testFieldInitEleven0026
     * @tc.desc      Checking for changing the value from static block.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitEleven0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_ELEVEN_2700
     * @tc.name      testFieldInitEleven0027
     * @tc.desc      Checking for initialization with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitEleven0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_ELEVEN_2800
     * @tc.name      testFieldInitEleven0028
     * @tc.desc      Checking for initialization with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitEleven0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_ELEVEN_2900
     * @tc.name      testFieldInitEleven0029
     * @tc.desc      Checking for initialization with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitEleven0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_ELEVEN_3000
     * @tc.name      testFieldInitEleven0030
     * @tc.desc      Checking for initialization with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitEleven0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_ELEVEN_3100
     * @tc.name      testFieldInitEleven0031
     * @tc.desc      Checking for initialization with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitEleven0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_ELEVEN_3200
     * @tc.name      testFieldInitEleven0032
     * @tc.desc      Checking for initialization with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitEleven0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_ELEVEN_3300
     * @tc.name      testFieldInitEleven0033
     * @tc.desc      Checking for initialization with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitEleven0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_ELEVEN_3400
     * @tc.name      testFieldInitEleven0034
     * @tc.desc      Checking for initialization with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitEleven0034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_ELEVEN_3500
     * @tc.name      testFieldInitEleven0035
     * @tc.desc      Checking for initialization with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitEleven0035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_ELEVEN_3600
     * @tc.name      testFieldInitEleven0036
     * @tc.desc      Checking for initialization with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitEleven0036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_ELEVEN_3700
     * @tc.name      testFieldInitEleven0037
     * @tc.desc      Checking for initialization with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitEleven0037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_ELEVEN_3800
     * @tc.name      testFieldInitEleven0038
     * @tc.desc      Checking for initialization with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitEleven0038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_ELEVEN_3900
     * @tc.name      testFieldInitEleven0039
     * @tc.desc      Checking for initialization with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitEleven0039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_ELEVEN_4000
     * @tc.name      testFieldInitEleven0040
     * @tc.desc      Checking for initialization with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitEleven0040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_ELEVEN_4100
     * @tc.name      testFieldInitEleven0041
     * @tc.desc      Checking for initialization with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitEleven0041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_ELEVEN_4200
     * @tc.name      testFieldInitEleven0042
     * @tc.desc      Checking for initialization with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitEleven0042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_ELEVEN_4300
     * @tc.name      testFieldInitEleven0043
     * @tc.desc      Checking for initialization with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitEleven0043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_ELEVEN_4400
     * @tc.name      testFieldInitEleven0044
     * @tc.desc      Checking for initialization with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitEleven0044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_ELEVEN_4500
     * @tc.name      testFieldInitEleven0045
     * @tc.desc      Checking for initialization with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitEleven0045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_ELEVEN_4600
     * @tc.name      testFieldInitEleven0046
     * @tc.desc      Checking for initialization with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitEleven0046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_ELEVEN_4700
     * @tc.name      testFieldInitEleven0047
     * @tc.desc      Checking for initialization with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitEleven0047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_ELEVEN_4800
     * @tc.name      testFieldInitEleven0048
     * @tc.desc      Checking for initialization with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitEleven0048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_ELEVEN_4900
     * @tc.name      testFieldInitEleven0049
     * @tc.desc      Checking for initialization with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitEleven0049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_ELEVEN_5000
     * @tc.name      testFieldInitEleven0050
     * @tc.desc      Checking for initialization with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitEleven0050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_ELEVEN_5100
     * @tc.name      testFieldInitEleven0051
     * @tc.desc      Checking for initialization with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitEleven0051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_ELEVEN_5200
     * @tc.name      testFieldInitEleven0052
     * @tc.desc      Checking for initialization with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitEleven0052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_ELEVEN_5300
     * @tc.name      testFieldInitEleven0053
     * @tc.desc      Checking for initialization with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitEleven0053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_ELEVEN_5400
     * @tc.name      testFieldInitEleven0054
     * @tc.desc      Checking for initialization with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitEleven0054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_ELEVEN_5500
     * @tc.name      testFieldInitEleven0055
     * @tc.desc      Checking for initialization with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitEleven0055", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_ELEVEN_5600
     * @tc.name      testFieldInitEleven0056
     * @tc.desc      Checking for initialization with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitEleven0056", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_ELEVEN_5700
     * @tc.name      testFieldInitEleven0057
     * @tc.desc      Checking for initialization with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitEleven0057", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_ELEVEN_5800
     * @tc.name      testFieldInitEleven0058
     * @tc.desc      Checking for initialization with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitEleven0058", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_ELEVEN_5900
     * @tc.name      testFieldInitEleven0059
     * @tc.desc      Checking for initialization with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitEleven0059", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_ELEVEN_6000
     * @tc.name      testFieldInitEleven0060
     * @tc.desc      Checking for initialization with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitEleven0060", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_ELEVEN_6100
     * @tc.name      testFieldInitEleven0061
     * @tc.desc      Checking for initialization with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitEleven0061", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_ELEVEN_6200
     * @tc.name      testFieldInitEleven0062
     * @tc.desc      Checking for initialization with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitEleven0062", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_ELEVEN_6300
     * @tc.name      testFieldInitEleven0063
     * @tc.desc      Checking for initialization with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitEleven0063", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_ELEVEN_6400
     * @tc.name      testFieldInitEleven0064
     * @tc.desc      Checking for initialization with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitEleven0064", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_ELEVEN_6500
     * @tc.name      testFieldInitEleven0065
     * @tc.desc      Checking for initialization with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitEleven0065", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_ELEVEN_6600
     * @tc.name      testFieldInitEleven0066
     * @tc.desc      Checking for initialization with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitEleven0066", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_ELEVEN_6700
     * @tc.name      testFieldInitEleven0067
     * @tc.desc      Checking for initialization with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitEleven0067", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_ELEVEN_6800
     * @tc.name      testFieldInitEleven0068
     * @tc.desc      Checking for initialization with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitEleven0068", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_ELEVEN_6900
     * @tc.name      testFieldInitEleven0069
     * @tc.desc      Checking for initialization with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitEleven0069", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_ELEVEN_7000
     * @tc.name      testFieldInitEleven0070
     * @tc.desc      Checking for initialization with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitEleven0070", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_ELEVEN_7100
     * @tc.name      testFieldInitEleven0071
     * @tc.desc      Checking for initialization with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitEleven0071", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_ELEVEN_7200
     * @tc.name      testFieldInitEleven0072
     * @tc.desc      Checking for initialization with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitEleven0072", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_ELEVEN_7300
     * @tc.name      testFieldInitEleven0073
     * @tc.desc      Checking for initialization with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitEleven0073", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_ELEVEN_7400
     * @tc.name      testFieldInitEleven0074
     * @tc.desc      Checking for initialization with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitEleven0074", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_ELEVEN_7500
     * @tc.name      testFieldInitEleven0075
     * @tc.desc      Checking for initialization with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitEleven0075", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_ELEVEN_7600
     * @tc.name      testFieldInitEleven0076
     * @tc.desc      Checking for initialization with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitEleven0076", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_ELEVEN_7700
     * @tc.name      testFieldInitEleven0077
     * @tc.desc      Checking for initialization with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitEleven0077", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_ELEVEN_7800
     * @tc.name      testFieldInitEleven0078
     * @tc.desc      Checking for initialization with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitEleven0078", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_ELEVEN_7900
     * @tc.name      testFieldInitEleven0079
     * @tc.desc      Checking for initialization with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitEleven0079", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_ELEVEN_8000
     * @tc.name      testFieldInitEleven0080
     * @tc.desc      Checking for initialization with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitEleven0080", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_ELEVEN_8100
     * @tc.name      testFieldInitEleven0081
     * @tc.desc      Checking for initialization with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitEleven0081", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_ELEVEN_8200
     * @tc.name      testFieldInitEleven0082
     * @tc.desc      Checking for initialization with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitEleven0082", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_ELEVEN_8300
     * @tc.name      testFieldInitEleven0083
     * @tc.desc      Checking for initialization with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitEleven0083", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_ELEVEN_8400
     * @tc.name      testFieldInitEleven0084
     * @tc.desc      Checking for initialization with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitEleven0084", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_ELEVEN_8500
     * @tc.name      testFieldInitEleven0085
     * @tc.desc      Checking for initialization with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitEleven0085", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_ELEVEN_8600
     * @tc.name      testFieldInitEleven0086
     * @tc.desc      Checking for initialization with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitEleven0086", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_ELEVEN_8700
     * @tc.name      testFieldInitEleven0087
     * @tc.desc      Checking for initialization with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitEleven0087", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_ELEVEN_8800
     * @tc.name      testFieldInitEleven0088
     * @tc.desc      Checking for initialization with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitEleven0088", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_ELEVEN_8900
     * @tc.name      testFieldInitEleven0089
     * @tc.desc      Checking for initialization with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitEleven0089", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_ELEVEN_9000
     * @tc.name      testFieldInitEleven0090
     * @tc.desc      Checking for initialization with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitEleven0090", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_ELEVEN_9100
     * @tc.name      testFieldInitEleven0091
     * @tc.desc      Checking for initialization with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitEleven0091", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_ELEVEN_9200
     * @tc.name      testFieldInitEleven0092
     * @tc.desc      Checking for initialization with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitEleven0092", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_ELEVEN_9300
     * @tc.name      testFieldInitEleven0093
     * @tc.desc      Checking for initialization with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitEleven0093", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_ELEVEN_9400
     * @tc.name      testFieldInitEleven0094
     * @tc.desc      Checking for initialization with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitEleven0094", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_ELEVEN_9500
     * @tc.name      testFieldInitEleven0095
     * @tc.desc      Checking for initialization with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitEleven0095", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_ELEVEN_9600
     * @tc.name      testFieldInitEleven0096
     * @tc.desc      Checking for initialization with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitEleven0096", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_ELEVEN_9700
     * @tc.name      testFieldInitEleven0097
     * @tc.desc      Checking for initialization with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitEleven0097", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_ELEVEN_9800
     * @tc.name      testFieldInitEleven0098
     * @tc.desc      Checking for initialization with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitEleven0098", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_ELEVEN_9900
     * @tc.name      testFieldInitEleven0099
     * @tc.desc      Checking for initialization with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitEleven0099", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
