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
    export class A_F1189 {
      private static v: short = 4
      private static _field: short = A_F1189.v
      static get field(): short {
        return A_F1189._field
      }
      static set field(a: short) {
        A_F1189._field = a
      }
    }
  }

namespace ns {
    export class A_F1190 {
      private static v: double = 4
      private static _field: double = A_F1190.v
      static get field(): double {
        return A_F1190._field
      }
      static set field(a: double) {
        A_F1190._field = a
      }
    }
  }

namespace ns {
    export class A_F1191 {
      private static v: int = 4
      private static _field: number = A_F1191.v
      static get field(): number {
        return A_F1191._field
      }
      static set field(a: number) {
        A_F1191._field = a
      }
    }
  }

namespace ns {
    export class A_F1192 {
      private static v: float = 4.5f
      private static _field: float = A_F1192.v
      static get field(): float {
        return A_F1192._field
      }
      static set field(a: float) {
        A_F1192._field = a
      }
    }
  }

namespace ns {
    export class A_F1193 {
      private static v: bigint = 4n
      private static _field: bigint = A_F1193.v
      static get field(): bigint {
        return A_F1193._field
      }
      static set field(a: bigint) {
        A_F1193._field = a
      }
    }
  }

namespace ns {
    export class A_F1194 {
      private static v: string = "abc"
      private static _field: string = A_F1194.v
      static get field(): string {
        return A_F1194._field
      }
      static set field(a: string) {
        A_F1194._field = a
      }
    }
  }

namespace ns {
    export class A_F1195 {
      private static v: char = c'a'
      private static _field: char = A_F1195.v
      static get field(): char {
        return A_F1195._field
      }
      static set field(a: char) {
        A_F1195._field = a
      }
    }
  }

namespace ns {
    export class A_F1196 {
      private static v: boolean = false
      private static _field: boolean = A_F1196.v
      static get field(): boolean {
        return A_F1196._field
      }
      static set field(a: boolean) {
        A_F1196._field = a
      }
    }
  }

namespace ns {
    export class A_F1197 {
      private static v: Object = 4
      private static _field: Object = A_F1197.v
      static get field(): Object {
        return A_F1197._field
      }
      static set field(a: Object) {
        A_F1197._field = a
      }
    }
  }

namespace ns {
    export class A_F1198 {
      private static v: Object | undefined | null = 4
      private static _field: Object | undefined | null = A_F1198.v
      static get field(): Object | undefined | null {
        return A_F1198._field
      }
      static set field(a: Object | undefined | null) {
        A_F1198._field = a
      }
    }
  }

namespace ns {
    export class A_F1199 {
      private static v: Any = 4
      private static _field: Any = A_F1199.v
      static get field(): Any {
        return A_F1199._field
      }
      static set field(a: Any) {
        A_F1199._field = a
      }
    }
  }

namespace ns {
    export class Base_F1200 {
      protected static _v: long = 4
      static get v(): long {
        return Base_F1200._v
      }
    }
    export class A_F1200 extends Base_F1200 {
      protected static _field: long = Base_F1200.v
      static get field(): long {
        return A_F1200._field
      }
      static set field(a: long) {
        A_F1200._field = a
      }
    }
  }

namespace ns {
    export class Base_F1201 {
      protected static _v: int = 4
      static get v(): int {
        return Base_F1201._v
      }
    }
    export class A_F1201 extends Base_F1201 {
      protected static _field: int = Base_F1201.v
      static get field(): int {
        return A_F1201._field
      }
      static set field(a: int) {
        A_F1201._field = a
      }
    }
  }

namespace ns {
    export class Base_F1202 {
      protected static _v: byte = 4
      static get v(): byte {
        return Base_F1202._v
      }
    }
    export class A_F1202 extends Base_F1202 {
      protected static _field: byte = Base_F1202.v
      static get field(): byte {
        return A_F1202._field
      }
      static set field(a: byte) {
        A_F1202._field = a
      }
    }
  }

namespace ns {
    export class Base_F1203 {
      protected static _v: short = 4
      static get v(): short {
        return Base_F1203._v
      }
    }
    export class A_F1203 extends Base_F1203 {
      protected static _field: short = Base_F1203.v
      static get field(): short {
        return A_F1203._field
      }
      static set field(a: short) {
        A_F1203._field = a
      }
    }
  }

namespace ns {
    export class Base_F1204 {
      protected static _v: double = 4
      static get v(): double {
        return Base_F1204._v
      }
    }
    export class A_F1204 extends Base_F1204 {
      protected static _field: double = Base_F1204.v
      static get field(): double {
        return A_F1204._field
      }
      static set field(a: double) {
        A_F1204._field = a
      }
    }
  }

namespace ns {
    export class Base_F1205 {
      protected static _v: number = 4
      static get v(): number {
        return Base_F1205._v
      }
    }
    export class A_F1205 extends Base_F1205 {
      protected static _field: number = Base_F1205.v
      static get field(): number {
        return A_F1205._field
      }
      static set field(a: number) {
        A_F1205._field = a
      }
    }
  }

namespace ns {
    export class Base_F1206 {
      protected static _v: float = 4.5f
      static get v(): float {
        return Base_F1206._v
      }
    }
    export class A_F1206 extends Base_F1206 {
      protected static _field: float = Base_F1206.v
      static get field(): float {
        return A_F1206._field
      }
      static set field(a: float) {
        A_F1206._field = a
      }
    }
  }

namespace ns {
    export class Base_F1207 {
      protected static _v: bigint = 4n
      static get v(): bigint {
        return Base_F1207._v
      }
    }
    export class A_F1207 extends Base_F1207 {
      protected static _field: bigint = Base_F1207.v
      static get field(): bigint {
        return A_F1207._field
      }
      static set field(a: bigint) {
        A_F1207._field = a
      }
    }
  }

namespace ns {
    export class Base_F1208 {
      protected static _v: string = "abc"
      static get v(): string {
        return Base_F1208._v
      }
    }
    export class A_F1208 extends Base_F1208 {
      protected static _field: string = Base_F1208.v
      static get field(): string {
        return A_F1208._field
      }
      static set field(a: string) {
        A_F1208._field = a
      }
    }
  }

namespace ns {
    export class Base_F1209 {
      protected static _v: char = c'a'
      static get v(): char {
        return Base_F1209._v
      }
    }
    export class A_F1209 extends Base_F1209 {
      protected static _field: char = Base_F1209.v
      static get field(): char {
        return A_F1209._field
      }
      static set field(a: char) {
        A_F1209._field = a
      }
    }
  }

namespace ns {
    export class Base_F1210 {
      protected static _v: boolean = false
      static get v(): boolean {
        return Base_F1210._v
      }
    }
    export class A_F1210 extends Base_F1210 {
      protected static _field: boolean = Base_F1210.v
      static get field(): boolean {
        return A_F1210._field
      }
      static set field(a: boolean) {
        A_F1210._field = a
      }
    }
  }

namespace ns {
    export class Base_F1211 {
      protected static _v: Object = 4
      static get v(): Object {
        return Base_F1211._v
      }
    }
    export class A_F1211 extends Base_F1211 {
      protected static _field: Object = Base_F1211.v
      static get field(): Object {
        return A_F1211._field
      }
      static set field(a: Object) {
        A_F1211._field = a
      }
    }
  }

namespace ns {
    export class Base_F1212 {
      protected static _v: Object | undefined | null = 4
      static get v(): Object | undefined | null {
        return Base_F1212._v
      }
    }
    export class A_F1212 extends Base_F1212 {
      protected static _field: Object | undefined | null = Base_F1212.v
      static get field(): Object | undefined | null {
        return A_F1212._field
      }
      static set field(a: Object | undefined | null) {
        A_F1212._field = a
      }
    }
  }

namespace ns {
    export class Base_F1213 {
      protected static _v: Any = 4
      static get v(): Any {
        return Base_F1213._v
      }
    }
    export class A_F1213 extends Base_F1213 {
      protected static _field: Any = Base_F1213.v
      static get field(): Any {
        return A_F1213._field
      }
      static set field(a: Any) {
        A_F1213._field = a
      }
    }
  }

namespace ns {
    export class A_F1214 {
      static field: long
      static {
        A_F1214.field = 4
      }
    }
  }

namespace ns {
    export class A_F1215 {
      static field: int
      static {
        A_F1215.field = 4
      }
    }
  }

namespace ns {
    export class A_F1216 {
      static field: byte
      static {
        A_F1216.field = 4
      }
    }
  }

namespace ns {
    export class A_F1217 {
      static field: short
      static {
        A_F1217.field = 4
      }
    }
  }

namespace ns {
    export class A_F1218 {
      static field: double
      static {
        A_F1218.field = 4
      }
    }
  }

namespace ns {
    export class A_F1219 {
      static field: number
      static {
        A_F1219.field = 4
      }
    }
  }

namespace ns {
    export class A_F1220 {
      static field: float
      static {
        A_F1220.field = 4.5f
      }
    }
  }

namespace ns {
    export class A_F1221 {
      static field: bigint
      static {
        A_F1221.field = 4n
      }
    }
  }

namespace ns {
    export class A_F1222 {
      static field: string
      static {
        A_F1222.field = "abc"
      }
    }
  }

namespace ns {
    export class A_F1223 {
      static field: char
      static {
        A_F1223.field = c'a'
      }
    }
  }

namespace ns {
    export class A_F1224 {
      static field: boolean
      static {
        A_F1224.field = false
      }
    }
  }

namespace ns {
    export class A_F1225 {
      static field: Object
      static {
        A_F1225.field = 4
      }
    }
  }

namespace ns {
    export class A_F1226 {
      static field: Object | undefined | null
      static {
        A_F1226.field = 4
      }
    }
  }

namespace ns {
    export class A_F1227 {
      static field: Any
      static {
        A_F1227.field = 4
      }
    }
  }

namespace ns {
    export class A_F1228 {
      static field: long = 5
      static {
        A_F1228.field = 4
      }
    }
  }

namespace ns {
    export class A_F1229 {
      static field: int = 5
      static {
        A_F1229.field = 4
      }
    }
  }

namespace ns {
    export class A_F1230 {
      static field: byte = 5
      static {
        A_F1230.field = 4
      }
    }
  }

namespace ns {
    export class A_F1231 {
      static field: short = 5
      static {
        A_F1231.field = 4
      }
    }
  }

namespace ns {
    export class A_F1232 {
      static field: double = 7.3
      static {
        A_F1232.field = 4
      }
    }
  }

namespace ns {
    export class A_F1233 {
      static field: number = 5
      static {
        A_F1233.field = 4
      }
    }
  }

namespace ns {
    export class A_F1234 {
      static field: float = 7.3f
      static {
        A_F1234.field = 4.5f
      }
    }
  }

namespace ns {
    export class A_F1235 {
      static field: bigint = 5n
      static {
        A_F1235.field = 4n
      }
    }
  }

namespace ns {
    export class A_F1236 {
      static field: string = "efg"
      static {
        A_F1236.field = "abc"
      }
    }
  }

namespace ns {
    export class A_F1237 {
      static field: char = c'b'
      static {
        A_F1237.field = c'a'
      }
    }
  }

namespace ns {
    export class A_F1238 {
      static field: boolean = true
      static {
        A_F1238.field = false
      }
    }
  }

namespace ns {
    export class A_F1239 {
      static field: Object = 5
      static {
        A_F1239.field = 4
      }
    }
  }

namespace ns {
    export class A_F1240 {
      static field: Object | undefined | null = 5
      static {
        A_F1240.field = 4
      }
    }
  }

namespace ns {
    export class A_F1241 {
      static field: Any = 5
      static {
        A_F1241.field = 4
      }
    }
  }

interface I_F1242 {
    field: long
  }
  class A_F1242 implements I_F1242 {
    field: long = 4
  }

interface I_F1243 {
    field: int
  }
  class A_F1243 implements I_F1243 {
    field: int = 4
  }

interface I_F1244 {
    field: byte
  }
  class A_F1244 implements I_F1244 {
    field: byte = 4
  }

interface I_F1245 {
    field: short
  }
  class A_F1245 implements I_F1245 {
    field: short = 4
  }

interface I_F1246 {
    field: double
  }
  class A_F1246 implements I_F1246 {
    field: double = 4
  }

interface I_F1247 {
    field: number
  }
  class A_F1247 implements I_F1247 {
    field: number = 4
  }

interface I_F1248 {
    field: float
  }
  class A_F1248 implements I_F1248 {
    field: float = 4.5f
  }

interface I_F1249 {
    field: bigint
  }
  class A_F1249 implements I_F1249 {
    field: bigint = 4n
  }

interface I_F1250 {
    field: string
  }
  class A_F1250 implements I_F1250 {
    field: string = "abc"
  }

interface I_F1251 {
    field: char
  }
  class A_F1251 implements I_F1251 {
    field: char = c'a'
  }

interface I_F1252 {
    field: boolean
  }
  class A_F1252 implements I_F1252 {
    field: boolean = false
  }

interface I_F1253 {
    field: Object
  }
  class A_F1253 implements I_F1253 {
    field: Object = 4
  }

interface I_F1254 {
    field: Object | undefined | null
  }
  class A_F1254 implements I_F1254 {
    field: Object | undefined | null = 4
  }

interface I_F1255 {
    field: Any
  }
  class A_F1255 implements I_F1255 {
    field: Any = 4
  }

interface I_F1256 {
    field: long
  }
  class A_F1256 implements I_F1256 {
    field: long
    constructor () {
      this.field = 4
    }
  }

interface I_F1257 {
    field: int
  }
  class A_F1257 implements I_F1257 {
    field: int
    constructor () {
      this.field = 4
    }
  }

interface I_F1258 {
    field: byte
  }
  class A_F1258 implements I_F1258 {
    field: byte
    constructor () {
      this.field = 4
    }
  }

interface I_F1259 {
    field: short
  }
  class A_F1259 implements I_F1259 {
    field: short
    constructor () {
      this.field = 4
    }
  }

interface I_F1260 {
    field: double
  }
  class A_F1260 implements I_F1260 {
    field: double
    constructor () {
      this.field = 4
    }
  }

interface I_F1261 {
    field: number
  }
  class A_F1261 implements I_F1261 {
    field: number
    constructor () {
      this.field = 4
    }
  }

interface I_F1262 {
    field: float
  }
  class A_F1262 implements I_F1262 {
    field: float
    constructor () {
      this.field = 4.5f
    }
  }

interface I_F1263 {
    field: bigint
  }
  class A_F1263 implements I_F1263 {
    field: bigint
    constructor () {
      this.field = 4n
    }
  }

interface I_F1264 {
    field: string
  }
  class A_F1264 implements I_F1264 {
    field: string
    constructor () {
      this.field = "abc"
    }
  }

interface I_F1265 {
    field: char
  }
  class A_F1265 implements I_F1265 {
    field: char
    constructor () {
      this.field = c'a'
    }
  }

interface I_F1266 {
    field: boolean
  }
  class A_F1266 implements I_F1266 {
    field: boolean
    constructor () {
      this.field = false
    }
  }

interface I_F1267 {
    field: Object
  }
  class A_F1267 implements I_F1267 {
    field: Object
    constructor () {
      this.field = 4
    }
  }

interface I_F1268 {
    field: Object | undefined | null
  }
  class A_F1268 implements I_F1268 {
    field: Object | undefined | null
    constructor () {
      this.field = 4
    }
  }

interface I_F1269 {
    field: Any
  }
  class A_F1269 implements I_F1269 {
    field: Any
    constructor () {
      this.field = 4
    }
  }

interface I_F1270 {
    field: long
  }
  class A_F1270 implements I_F1270 {
    field: long = 4
  }

interface I_F1271 {
    field: int
  }
  class A_F1271 implements I_F1271 {
    field: int = 4
  }

interface I_F1272 {
    field: byte
  }
  class A_F1272 implements I_F1272 {
    field: byte = 4
  }

interface I_F1273 {
    field: short
  }
  class A_F1273 implements I_F1273 {
    field: short = 4
  }

interface I_F1274 {
    field: double
  }
  class A_F1274 implements I_F1274 {
    field: double = 4
  }

interface I_F1275 {
    field: number
  }
  class A_F1275 implements I_F1275 {
    field: number = 4
  }

interface I_F1276 {
    field: float
  }
  class A_F1276 implements I_F1276 {
    field: float = 4.5f
  }

interface I_F1277 {
    field: bigint
  }
  class A_F1277 implements I_F1277 {
    field: bigint = 4n
  }

interface I_F1278 {
    field: string
  }
  class A_F1278 implements I_F1278 {
    field: string = "abc"
  }

interface I_F1279 {
    field: char
  }
  class A_F1279 implements I_F1279 {
    field: char = c'a'
  }

interface I_F1280 {
    field: boolean
  }
  class A_F1280 implements I_F1280 {
    field: boolean = false
  }

interface I_F1281 {
    field: Object
  }
  class A_F1281 implements I_F1281 {
    field: Object = 4
  }

interface I_F1282 {
    field: Object | undefined | null
  }
  class A_F1282 implements I_F1282 {
    field: Object | undefined | null = 4
  }

interface I_F1283 {
    field: Any
  }
  class A_F1283 implements I_F1283 {
    field: Any = 4
  }

interface I_F1284 {
    field: long
  }
  class A_F1284 implements I_F1284 {
    field: long
    constructor () {
      this.field = 4
    }
  }

interface I_F1285 {
    field: int
  }
  class A_F1285 implements I_F1285 {
    field: int
    constructor () {
      this.field = 4
    }
  }

interface I_F1286 {
    field: byte
  }
  class A_F1286 implements I_F1286 {
    field: byte
    constructor () {
      this.field = 4
    }
  }

interface I_F1287 {
    field: short
  }
  class A_F1287 implements I_F1287 {
    field: short
    constructor () {
      this.field = 4
    }
  }

export default function FieldInitializationTestTwelve(): void {
  describe("FieldInitializationTestTwelve", () => {
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
     * @tc.number    SUB_FIELD_INIT_TEST_1189
     * @tc.name      testFieldInit1189
     * @tc.desc      Checking for initialization with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit1189", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ns.A_F1189.field instanceof short).assertTrue()
      expect(ns.A_F1189.field).assertEqual(4)
          ns.A_F1189.field = 5
      expect(ns.A_F1189.field instanceof short).assertTrue()
      expect(ns.A_F1189.field).assertEqual(5)
          ns.A_F1189.field = 4
      expect(ns.A_F1189.field instanceof short).assertTrue()
      expect(ns.A_F1189.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_1190
     * @tc.name      testFieldInit1190
     * @tc.desc      Checking for initialization with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit1190", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ns.A_F1190.field instanceof double).assertTrue()
      expect(ns.A_F1190.field).assertEqual(4)
          ns.A_F1190.field = 7.3
      expect(ns.A_F1190.field instanceof double).assertTrue()
      expect(ns.A_F1190.field).assertEqual(7.3)
          ns.A_F1190.field = 4
      expect(ns.A_F1190.field instanceof double).assertTrue()
      expect(ns.A_F1190.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_1191
     * @tc.name      testFieldInit1191
     * @tc.desc      Checking for initialization with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit1191", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ns.A_F1191.field instanceof number).assertTrue()
      expect(ns.A_F1191.field).assertEqual(4)
          ns.A_F1191.field = 5
      expect(ns.A_F1191.field instanceof number).assertTrue()
      expect(ns.A_F1191.field).assertEqual(5)
          ns.A_F1191.field = 4
      expect(ns.A_F1191.field instanceof number).assertTrue()
      expect(ns.A_F1191.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_1192
     * @tc.name      testFieldInit1192
     * @tc.desc      Checking for initialization with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit1192", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ns.A_F1192.field instanceof float).assertTrue()
      expect(ns.A_F1192.field).assertEqual(4.5f)
          ns.A_F1192.field = 7.3f
      expect(ns.A_F1192.field instanceof float).assertTrue()
      expect(ns.A_F1192.field).assertEqual(7.3f)
          ns.A_F1192.field = 4.5f
      expect(ns.A_F1192.field instanceof float).assertTrue()
      expect(ns.A_F1192.field).assertEqual(4.5f)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_1193
     * @tc.name      testFieldInit1193
     * @tc.desc      Checking for initialization with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit1193", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ns.A_F1193.field instanceof bigint).assertTrue()
      expect(ns.A_F1193.field).assertEqual(4n)
          ns.A_F1193.field = 5n
      expect(ns.A_F1193.field instanceof bigint).assertTrue()
      expect(ns.A_F1193.field).assertEqual(5n)
          ns.A_F1193.field = 4n
      expect(ns.A_F1193.field instanceof bigint).assertTrue()
      expect(ns.A_F1193.field).assertEqual(4n)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_1194
     * @tc.name      testFieldInit1194
     * @tc.desc      Checking for initialization with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit1194", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ns.A_F1194.field instanceof string).assertTrue()
      expect(ns.A_F1194.field).assertEqual("abc")
          ns.A_F1194.field = "efg"
      expect(ns.A_F1194.field instanceof string).assertTrue()
      expect(ns.A_F1194.field).assertEqual("efg")
          ns.A_F1194.field = "abc"
      expect(ns.A_F1194.field instanceof string).assertTrue()
      expect(ns.A_F1194.field).assertEqual("abc")
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_1195
     * @tc.name      testFieldInit1195
     * @tc.desc      Checking for initialization with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit1195", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ns.A_F1195.field instanceof char).assertTrue()
      expect(ns.A_F1195.field).assertEqual(c'a')
          ns.A_F1195.field = c'b'
      expect(ns.A_F1195.field instanceof char).assertTrue()
      expect(ns.A_F1195.field).assertEqual(c'b')
          ns.A_F1195.field = c'a'
      expect(ns.A_F1195.field instanceof char).assertTrue()
      expect(ns.A_F1195.field).assertEqual(c'a')
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_1196
     * @tc.name      testFieldInit1196
     * @tc.desc      Checking for initialization with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit1196", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ns.A_F1196.field instanceof boolean).assertTrue()
      expect(ns.A_F1196.field).assertEqual(false)
          ns.A_F1196.field = true
      expect(ns.A_F1196.field instanceof boolean).assertTrue()
      expect(ns.A_F1196.field).assertEqual(true)
          ns.A_F1196.field = false
      expect(ns.A_F1196.field instanceof boolean).assertTrue()
      expect(ns.A_F1196.field).assertEqual(false)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_1197
     * @tc.name      testFieldInit1197
     * @tc.desc      Checking for initialization with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit1197", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ns.A_F1197.field instanceof Object).assertTrue()
      expect(ns.A_F1197.field).assertEqual(4)
          ns.A_F1197.field = 5
      expect(ns.A_F1197.field instanceof Object).assertTrue()
      expect(ns.A_F1197.field).assertEqual(5)
          ns.A_F1197.field = 4
      expect(ns.A_F1197.field instanceof Object).assertTrue()
      expect(ns.A_F1197.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_1198
     * @tc.name      testFieldInit1198
     * @tc.desc      Checking for initialization with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit1198", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ns.A_F1198.field instanceof Object | undefined | null).assertTrue()
      expect(ns.A_F1198.field).assertEqual(4)
          ns.A_F1198.field = 5
      expect(ns.A_F1198.field instanceof Object | undefined | null).assertTrue()
      expect(ns.A_F1198.field).assertEqual(5)
          ns.A_F1198.field = 4
      expect(ns.A_F1198.field instanceof Object | undefined | null).assertTrue()
      expect(ns.A_F1198.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_1199
     * @tc.name      testFieldInit1199
     * @tc.desc      Checking for initialization with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit1199", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ns.A_F1199.field instanceof Any).assertTrue()
      expect(ns.A_F1199.field).assertEqual(4)
          ns.A_F1199.field = 5
      expect(ns.A_F1199.field instanceof Any).assertTrue()
      expect(ns.A_F1199.field).assertEqual(5)
          ns.A_F1199.field = 4
      expect(ns.A_F1199.field instanceof Any).assertTrue()
      expect(ns.A_F1199.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_1200
     * @tc.name      testFieldInit1200
     * @tc.desc      Checking for initialization with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit1200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ns.A_F1200.field instanceof long).assertTrue()
      expect(ns.A_F1200.field).assertEqual(4)
          ns.A_F1200.field = 5
      expect(ns.A_F1200.field instanceof long).assertTrue()
      expect(ns.A_F1200.field).assertEqual(5)
          ns.A_F1200.field = 4
      expect(ns.A_F1200.field instanceof long).assertTrue()
      expect(ns.A_F1200.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_1201
     * @tc.name      testFieldInit1201
     * @tc.desc      Checking for initialization with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit1201", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ns.A_F1201.field instanceof int).assertTrue()
      expect(ns.A_F1201.field).assertEqual(4)
          ns.A_F1201.field = 5
      expect(ns.A_F1201.field instanceof int).assertTrue()
      expect(ns.A_F1201.field).assertEqual(5)
          ns.A_F1201.field = 4
      expect(ns.A_F1201.field instanceof int).assertTrue()
      expect(ns.A_F1201.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_1202
     * @tc.name      testFieldInit1202
     * @tc.desc      Checking for initialization with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit1202", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ns.A_F1202.field instanceof byte).assertTrue()
      expect(ns.A_F1202.field).assertEqual(4)
          ns.A_F1202.field = 5
      expect(ns.A_F1202.field instanceof byte).assertTrue()
      expect(ns.A_F1202.field).assertEqual(5)
          ns.A_F1202.field = 4
      expect(ns.A_F1202.field instanceof byte).assertTrue()
      expect(ns.A_F1202.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_1203
     * @tc.name      testFieldInit1203
     * @tc.desc      Checking for initialization with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit1203", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ns.A_F1203.field instanceof short).assertTrue()
      expect(ns.A_F1203.field).assertEqual(4)
          ns.A_F1203.field = 5
      expect(ns.A_F1203.field instanceof short).assertTrue()
      expect(ns.A_F1203.field).assertEqual(5)
          ns.A_F1203.field = 4
      expect(ns.A_F1203.field instanceof short).assertTrue()
      expect(ns.A_F1203.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_1204
     * @tc.name      testFieldInit1204
     * @tc.desc      Checking for initialization with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit1204", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ns.A_F1204.field instanceof double).assertTrue()
      expect(ns.A_F1204.field).assertEqual(4)
          ns.A_F1204.field = 7.3
      expect(ns.A_F1204.field instanceof double).assertTrue()
      expect(ns.A_F1204.field).assertEqual(7.3)
          ns.A_F1204.field = 4
      expect(ns.A_F1204.field instanceof double).assertTrue()
      expect(ns.A_F1204.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_1205
     * @tc.name      testFieldInit1205
     * @tc.desc      Checking for initialization with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit1205", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ns.A_F1205.field instanceof number).assertTrue()
      expect(ns.A_F1205.field).assertEqual(4)
          ns.A_F1205.field = 5
      expect(ns.A_F1205.field instanceof number).assertTrue()
      expect(ns.A_F1205.field).assertEqual(5)
          ns.A_F1205.field = 4
      expect(ns.A_F1205.field instanceof number).assertTrue()
      expect(ns.A_F1205.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_1206
     * @tc.name      testFieldInit1206
     * @tc.desc      Checking for initialization with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit1206", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ns.A_F1206.field instanceof float).assertTrue()
      expect(ns.A_F1206.field).assertEqual(4.5f)
          ns.A_F1206.field = 7.3f
      expect(ns.A_F1206.field instanceof float).assertTrue()
      expect(ns.A_F1206.field).assertEqual(7.3f)
          ns.A_F1206.field = 4.5f
      expect(ns.A_F1206.field instanceof float).assertTrue()
      expect(ns.A_F1206.field).assertEqual(4.5f)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_1207
     * @tc.name      testFieldInit1207
     * @tc.desc      Checking for initialization with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit1207", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ns.A_F1207.field instanceof bigint).assertTrue()
      expect(ns.A_F1207.field).assertEqual(4n)
          ns.A_F1207.field = 5n
      expect(ns.A_F1207.field instanceof bigint).assertTrue()
      expect(ns.A_F1207.field).assertEqual(5n)
          ns.A_F1207.field = 4n
      expect(ns.A_F1207.field instanceof bigint).assertTrue()
      expect(ns.A_F1207.field).assertEqual(4n)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_1208
     * @tc.name      testFieldInit1208
     * @tc.desc      Checking for initialization with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit1208", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ns.A_F1208.field instanceof string).assertTrue()
      expect(ns.A_F1208.field).assertEqual("abc")
          ns.A_F1208.field = "efg"
      expect(ns.A_F1208.field instanceof string).assertTrue()
      expect(ns.A_F1208.field).assertEqual("efg")
          ns.A_F1208.field = "abc"
      expect(ns.A_F1208.field instanceof string).assertTrue()
      expect(ns.A_F1208.field).assertEqual("abc")
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_1209
     * @tc.name      testFieldInit1209
     * @tc.desc      Checking for initialization with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit1209", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ns.A_F1209.field instanceof char).assertTrue()
      expect(ns.A_F1209.field).assertEqual(c'a')
          ns.A_F1209.field = c'b'
      expect(ns.A_F1209.field instanceof char).assertTrue()
      expect(ns.A_F1209.field).assertEqual(c'b')
          ns.A_F1209.field = c'a'
      expect(ns.A_F1209.field instanceof char).assertTrue()
      expect(ns.A_F1209.field).assertEqual(c'a')
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_1210
     * @tc.name      testFieldInit1210
     * @tc.desc      Checking for initialization with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit1210", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ns.A_F1210.field instanceof boolean).assertTrue()
      expect(ns.A_F1210.field).assertEqual(false)
          ns.A_F1210.field = true
      expect(ns.A_F1210.field instanceof boolean).assertTrue()
      expect(ns.A_F1210.field).assertEqual(true)
          ns.A_F1210.field = false
      expect(ns.A_F1210.field instanceof boolean).assertTrue()
      expect(ns.A_F1210.field).assertEqual(false)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_1211
     * @tc.name      testFieldInit1211
     * @tc.desc      Checking for initialization with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit1211", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ns.A_F1211.field instanceof Object).assertTrue()
      expect(ns.A_F1211.field).assertEqual(4)
          ns.A_F1211.field = 5
      expect(ns.A_F1211.field instanceof Object).assertTrue()
      expect(ns.A_F1211.field).assertEqual(5)
          ns.A_F1211.field = 4
      expect(ns.A_F1211.field instanceof Object).assertTrue()
      expect(ns.A_F1211.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_1212
     * @tc.name      testFieldInit1212
     * @tc.desc      Checking for initialization with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit1212", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ns.A_F1212.field instanceof Object | undefined | null).assertTrue()
      expect(ns.A_F1212.field).assertEqual(4)
          ns.A_F1212.field = 5
      expect(ns.A_F1212.field instanceof Object | undefined | null).assertTrue()
      expect(ns.A_F1212.field).assertEqual(5)
          ns.A_F1212.field = 4
      expect(ns.A_F1212.field instanceof Object | undefined | null).assertTrue()
      expect(ns.A_F1212.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_1213
     * @tc.name      testFieldInit1213
     * @tc.desc      Checking for initialization with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit1213", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ns.A_F1213.field instanceof Any).assertTrue()
      expect(ns.A_F1213.field).assertEqual(4)
          ns.A_F1213.field = 5
      expect(ns.A_F1213.field instanceof Any).assertTrue()
      expect(ns.A_F1213.field).assertEqual(5)
          ns.A_F1213.field = 4
      expect(ns.A_F1213.field instanceof Any).assertTrue()
      expect(ns.A_F1213.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_1214
     * @tc.name      testFieldInit1214
     * @tc.desc      Checking for initialization with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit1214", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ns.A_F1214.field instanceof long).assertTrue()
      expect(ns.A_F1214.field).assertEqual(4)
          ns.A_F1214.field = 5
      expect(ns.A_F1214.field instanceof long).assertTrue()
      expect(ns.A_F1214.field).assertEqual(5)
          ns.A_F1214.field = 4
      expect(ns.A_F1214.field instanceof long).assertTrue()
      expect(ns.A_F1214.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_1215
     * @tc.name      testFieldInit1215
     * @tc.desc      Checking for initialization with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit1215", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ns.A_F1215.field instanceof int).assertTrue()
      expect(ns.A_F1215.field).assertEqual(4)
          ns.A_F1215.field = 5
      expect(ns.A_F1215.field instanceof int).assertTrue()
      expect(ns.A_F1215.field).assertEqual(5)
          ns.A_F1215.field = 4
      expect(ns.A_F1215.field instanceof int).assertTrue()
      expect(ns.A_F1215.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_1216
     * @tc.name      testFieldInit1216
     * @tc.desc      Checking for initialization with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit1216", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ns.A_F1216.field instanceof byte).assertTrue()
      expect(ns.A_F1216.field).assertEqual(4)
          ns.A_F1216.field = 5
      expect(ns.A_F1216.field instanceof byte).assertTrue()
      expect(ns.A_F1216.field).assertEqual(5)
          ns.A_F1216.field = 4
      expect(ns.A_F1216.field instanceof byte).assertTrue()
      expect(ns.A_F1216.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_1217
     * @tc.name      testFieldInit1217
     * @tc.desc      Checking for initialization with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit1217", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ns.A_F1217.field instanceof short).assertTrue()
      expect(ns.A_F1217.field).assertEqual(4)
          ns.A_F1217.field = 5
      expect(ns.A_F1217.field instanceof short).assertTrue()
      expect(ns.A_F1217.field).assertEqual(5)
          ns.A_F1217.field = 4
      expect(ns.A_F1217.field instanceof short).assertTrue()
      expect(ns.A_F1217.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_1218
     * @tc.name      testFieldInit1218
     * @tc.desc      Checking for initialization with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit1218", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ns.A_F1218.field instanceof double).assertTrue()
      expect(ns.A_F1218.field).assertEqual(4)
          ns.A_F1218.field = 7.3
      expect(ns.A_F1218.field instanceof double).assertTrue()
      expect(ns.A_F1218.field).assertEqual(7.3)
          ns.A_F1218.field = 4
      expect(ns.A_F1218.field instanceof double).assertTrue()
      expect(ns.A_F1218.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_1219
     * @tc.name      testFieldInit1219
     * @tc.desc      Checking for initialization with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit1219", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ns.A_F1219.field instanceof number).assertTrue()
      expect(ns.A_F1219.field).assertEqual(4)
          ns.A_F1219.field = 5
      expect(ns.A_F1219.field instanceof number).assertTrue()
      expect(ns.A_F1219.field).assertEqual(5)
          ns.A_F1219.field = 4
      expect(ns.A_F1219.field instanceof number).assertTrue()
      expect(ns.A_F1219.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_1220
     * @tc.name      testFieldInit1220
     * @tc.desc      Checking for initialization with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit1220", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ns.A_F1220.field instanceof float).assertTrue()
      expect(ns.A_F1220.field).assertEqual(4.5f)
          ns.A_F1220.field = 7.3f
      expect(ns.A_F1220.field instanceof float).assertTrue()
      expect(ns.A_F1220.field).assertEqual(7.3f)
          ns.A_F1220.field = 4.5f
      expect(ns.A_F1220.field instanceof float).assertTrue()
      expect(ns.A_F1220.field).assertEqual(4.5f)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_1221
     * @tc.name      testFieldInit1221
     * @tc.desc      Checking for initialization with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit1221", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ns.A_F1221.field instanceof bigint).assertTrue()
      expect(ns.A_F1221.field).assertEqual(4n)
          ns.A_F1221.field = 5n
      expect(ns.A_F1221.field instanceof bigint).assertTrue()
      expect(ns.A_F1221.field).assertEqual(5n)
          ns.A_F1221.field = 4n
      expect(ns.A_F1221.field instanceof bigint).assertTrue()
      expect(ns.A_F1221.field).assertEqual(4n)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_1222
     * @tc.name      testFieldInit1222
     * @tc.desc      Checking for initialization with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit1222", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ns.A_F1222.field instanceof string).assertTrue()
      expect(ns.A_F1222.field).assertEqual("abc")
          ns.A_F1222.field = "efg"
      expect(ns.A_F1222.field instanceof string).assertTrue()
      expect(ns.A_F1222.field).assertEqual("efg")
          ns.A_F1222.field = "abc"
      expect(ns.A_F1222.field instanceof string).assertTrue()
      expect(ns.A_F1222.field).assertEqual("abc")
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_1223
     * @tc.name      testFieldInit1223
     * @tc.desc      Checking for initialization with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit1223", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ns.A_F1223.field instanceof char).assertTrue()
      expect(ns.A_F1223.field).assertEqual(c'a')
          ns.A_F1223.field = c'b'
      expect(ns.A_F1223.field instanceof char).assertTrue()
      expect(ns.A_F1223.field).assertEqual(c'b')
          ns.A_F1223.field = c'a'
      expect(ns.A_F1223.field instanceof char).assertTrue()
      expect(ns.A_F1223.field).assertEqual(c'a')
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_1224
     * @tc.name      testFieldInit1224
     * @tc.desc      Checking for initialization with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit1224", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ns.A_F1224.field instanceof boolean).assertTrue()
      expect(ns.A_F1224.field).assertEqual(false)
          ns.A_F1224.field = true
      expect(ns.A_F1224.field instanceof boolean).assertTrue()
      expect(ns.A_F1224.field).assertEqual(true)
          ns.A_F1224.field = false
      expect(ns.A_F1224.field instanceof boolean).assertTrue()
      expect(ns.A_F1224.field).assertEqual(false)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_1225
     * @tc.name      testFieldInit1225
     * @tc.desc      Checking for initialization with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit1225", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ns.A_F1225.field instanceof Object).assertTrue()
      expect(ns.A_F1225.field).assertEqual(4)
          ns.A_F1225.field = 5
      expect(ns.A_F1225.field instanceof Object).assertTrue()
      expect(ns.A_F1225.field).assertEqual(5)
          ns.A_F1225.field = 4
      expect(ns.A_F1225.field instanceof Object).assertTrue()
      expect(ns.A_F1225.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_1226
     * @tc.name      testFieldInit1226
     * @tc.desc      Checking for initialization with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit1226", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ns.A_F1226.field instanceof Object | undefined | null).assertTrue()
      expect(ns.A_F1226.field).assertEqual(4)
          ns.A_F1226.field = 5
      expect(ns.A_F1226.field instanceof Object | undefined | null).assertTrue()
      expect(ns.A_F1226.field).assertEqual(5)
          ns.A_F1226.field = 4
      expect(ns.A_F1226.field instanceof Object | undefined | null).assertTrue()
      expect(ns.A_F1226.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_1227
     * @tc.name      testFieldInit1227
     * @tc.desc      Checking for initialization with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit1227", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ns.A_F1227.field instanceof Any).assertTrue()
      expect(ns.A_F1227.field).assertEqual(4)
          ns.A_F1227.field = 5
      expect(ns.A_F1227.field instanceof Any).assertTrue()
      expect(ns.A_F1227.field).assertEqual(5)
          ns.A_F1227.field = 4
      expect(ns.A_F1227.field instanceof Any).assertTrue()
      expect(ns.A_F1227.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_1228
     * @tc.name      testFieldInit1228
     * @tc.desc      Checking for initialization with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit1228", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ns.A_F1228.field instanceof long).assertTrue()
      expect(ns.A_F1228.field).assertEqual(4)
          ns.A_F1228.field = 5
      expect(ns.A_F1228.field instanceof long).assertTrue()
      expect(ns.A_F1228.field).assertEqual(5)
          ns.A_F1228.field = 4
      expect(ns.A_F1228.field instanceof long).assertTrue()
      expect(ns.A_F1228.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_1229
     * @tc.name      testFieldInit1229
     * @tc.desc      Checking for initialization with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit1229", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ns.A_F1229.field instanceof int).assertTrue()
      expect(ns.A_F1229.field).assertEqual(4)
          ns.A_F1229.field = 5
      expect(ns.A_F1229.field instanceof int).assertTrue()
      expect(ns.A_F1229.field).assertEqual(5)
          ns.A_F1229.field = 4
      expect(ns.A_F1229.field instanceof int).assertTrue()
      expect(ns.A_F1229.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_1230
     * @tc.name      testFieldInit1230
     * @tc.desc      Checking for initialization with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit1230", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ns.A_F1230.field instanceof byte).assertTrue()
      expect(ns.A_F1230.field).assertEqual(4)
          ns.A_F1230.field = 5
      expect(ns.A_F1230.field instanceof byte).assertTrue()
      expect(ns.A_F1230.field).assertEqual(5)
          ns.A_F1230.field = 4
      expect(ns.A_F1230.field instanceof byte).assertTrue()
      expect(ns.A_F1230.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_1231
     * @tc.name      testFieldInit1231
     * @tc.desc      Checking for initialization with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit1231", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ns.A_F1231.field instanceof short).assertTrue()
      expect(ns.A_F1231.field).assertEqual(4)
          ns.A_F1231.field = 5
      expect(ns.A_F1231.field instanceof short).assertTrue()
      expect(ns.A_F1231.field).assertEqual(5)
          ns.A_F1231.field = 4
      expect(ns.A_F1231.field instanceof short).assertTrue()
      expect(ns.A_F1231.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_1232
     * @tc.name      testFieldInit1232
     * @tc.desc      Checking for initialization with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit1232", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ns.A_F1232.field instanceof double).assertTrue()
      expect(ns.A_F1232.field).assertEqual(4)
          ns.A_F1232.field = 7.3
      expect(ns.A_F1232.field instanceof double).assertTrue()
      expect(ns.A_F1232.field).assertEqual(7.3)
          ns.A_F1232.field = 4
      expect(ns.A_F1232.field instanceof double).assertTrue()
      expect(ns.A_F1232.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_1233
     * @tc.name      testFieldInit1233
     * @tc.desc      Checking for initialization with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit1233", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ns.A_F1233.field instanceof number).assertTrue()
      expect(ns.A_F1233.field).assertEqual(4)
          ns.A_F1233.field = 5
      expect(ns.A_F1233.field instanceof number).assertTrue()
      expect(ns.A_F1233.field).assertEqual(5)
          ns.A_F1233.field = 4
      expect(ns.A_F1233.field instanceof number).assertTrue()
      expect(ns.A_F1233.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_1234
     * @tc.name      testFieldInit1234
     * @tc.desc      Checking for initialization with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit1234", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ns.A_F1234.field instanceof float).assertTrue()
      expect(ns.A_F1234.field).assertEqual(4.5f)
          ns.A_F1234.field = 7.3f
      expect(ns.A_F1234.field instanceof float).assertTrue()
      expect(ns.A_F1234.field).assertEqual(7.3f)
          ns.A_F1234.field = 4.5f
      expect(ns.A_F1234.field instanceof float).assertTrue()
      expect(ns.A_F1234.field).assertEqual(4.5f)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_1235
     * @tc.name      testFieldInit1235
     * @tc.desc      Checking for initialization with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit1235", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ns.A_F1235.field instanceof bigint).assertTrue()
      expect(ns.A_F1235.field).assertEqual(4n)
          ns.A_F1235.field = 5n
      expect(ns.A_F1235.field instanceof bigint).assertTrue()
      expect(ns.A_F1235.field).assertEqual(5n)
          ns.A_F1235.field = 4n
      expect(ns.A_F1235.field instanceof bigint).assertTrue()
      expect(ns.A_F1235.field).assertEqual(4n)
    })
