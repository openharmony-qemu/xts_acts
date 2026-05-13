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

export default function FieldInitializationTwelveTest(): void {
  describe("FieldInitializationTwelveTest", () => {
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
     * @tc.number    SUB_FIELD_INIT_TWELVE_0100
     * @tc.name      testFieldInitTwelve0001
     * @tc.desc      Checking for initialization with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitTwelve0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_TWELVE_0200
     * @tc.name      testFieldInitTwelve0002
     * @tc.desc      Checking for initialization with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitTwelve0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_TWELVE_0300
     * @tc.name      testFieldInitTwelve0003
     * @tc.desc      Checking for initialization with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitTwelve0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_TWELVE_0400
     * @tc.name      testFieldInitTwelve0004
     * @tc.desc      Checking for initialization with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitTwelve0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_TWELVE_0500
     * @tc.name      testFieldInitTwelve0005
     * @tc.desc      Checking for initialization with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitTwelve0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_TWELVE_0600
     * @tc.name      testFieldInitTwelve0006
     * @tc.desc      Checking for initialization with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitTwelve0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_TWELVE_0700
     * @tc.name      testFieldInitTwelve0007
     * @tc.desc      Checking for initialization with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitTwelve0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_TWELVE_0800
     * @tc.name      testFieldInitTwelve0008
     * @tc.desc      Checking for initialization with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitTwelve0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_TWELVE_0900
     * @tc.name      testFieldInitTwelve0009
     * @tc.desc      Checking for initialization with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitTwelve0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_TWELVE_1000
     * @tc.name      testFieldInitTwelve0010
     * @tc.desc      Checking for initialization with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitTwelve0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_TWELVE_1100
     * @tc.name      testFieldInitTwelve0011
     * @tc.desc      Checking for initialization with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitTwelve0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_TWELVE_1200
     * @tc.name      testFieldInitTwelve0012
     * @tc.desc      Checking for initialization with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitTwelve0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_TWELVE_1300
     * @tc.name      testFieldInitTwelve0013
     * @tc.desc      Checking for initialization with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitTwelve0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_TWELVE_1400
     * @tc.name      testFieldInitTwelve0014
     * @tc.desc      Checking for initialization with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitTwelve0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_TWELVE_1500
     * @tc.name      testFieldInitTwelve0015
     * @tc.desc      Checking for initialization with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitTwelve0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_TWELVE_1600
     * @tc.name      testFieldInitTwelve0016
     * @tc.desc      Checking for initialization with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitTwelve0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_TWELVE_1700
     * @tc.name      testFieldInitTwelve0017
     * @tc.desc      Checking for initialization with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitTwelve0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_TWELVE_1800
     * @tc.name      testFieldInitTwelve0018
     * @tc.desc      Checking for initialization with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitTwelve0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_TWELVE_1900
     * @tc.name      testFieldInitTwelve0019
     * @tc.desc      Checking for initialization with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitTwelve0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_TWELVE_2000
     * @tc.name      testFieldInitTwelve0020
     * @tc.desc      Checking for initialization with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitTwelve0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_TWELVE_2100
     * @tc.name      testFieldInitTwelve0021
     * @tc.desc      Checking for initialization with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitTwelve0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_TWELVE_2200
     * @tc.name      testFieldInitTwelve0022
     * @tc.desc      Checking for initialization with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitTwelve0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_TWELVE_2300
     * @tc.name      testFieldInitTwelve0023
     * @tc.desc      Checking for initialization with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitTwelve0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_TWELVE_2400
     * @tc.name      testFieldInitTwelve0024
     * @tc.desc      Checking for initialization with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitTwelve0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_TWELVE_2500
     * @tc.name      testFieldInitTwelve0025
     * @tc.desc      Checking for initialization with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitTwelve0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_TWELVE_2600
     * @tc.name      testFieldInitTwelve0026
     * @tc.desc      Checking for initialization with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitTwelve0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_TWELVE_2700
     * @tc.name      testFieldInitTwelve0027
     * @tc.desc      Checking for initialization with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitTwelve0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_TWELVE_2800
     * @tc.name      testFieldInitTwelve0028
     * @tc.desc      Checking for initialization with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitTwelve0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_TWELVE_2900
     * @tc.name      testFieldInitTwelve0029
     * @tc.desc      Checking for initialization with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitTwelve0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_TWELVE_3000
     * @tc.name      testFieldInitTwelve0030
     * @tc.desc      Checking for initialization with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitTwelve0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_TWELVE_3100
     * @tc.name      testFieldInitTwelve0031
     * @tc.desc      Checking for initialization with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitTwelve0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_TWELVE_3200
     * @tc.name      testFieldInitTwelve0032
     * @tc.desc      Checking for initialization with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitTwelve0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_TWELVE_3300
     * @tc.name      testFieldInitTwelve0033
     * @tc.desc      Checking for initialization with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitTwelve0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_TWELVE_3400
     * @tc.name      testFieldInitTwelve0034
     * @tc.desc      Checking for initialization with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitTwelve0034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_TWELVE_3500
     * @tc.name      testFieldInitTwelve0035
     * @tc.desc      Checking for initialization with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitTwelve0035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_TWELVE_3600
     * @tc.name      testFieldInitTwelve0036
     * @tc.desc      Checking for initialization with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitTwelve0036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_TWELVE_3700
     * @tc.name      testFieldInitTwelve0037
     * @tc.desc      Checking for initialization with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitTwelve0037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_TWELVE_3800
     * @tc.name      testFieldInitTwelve0038
     * @tc.desc      Checking for initialization with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitTwelve0038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_TWELVE_3900
     * @tc.name      testFieldInitTwelve0039
     * @tc.desc      Checking for initialization with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitTwelve0039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_TWELVE_4000
     * @tc.name      testFieldInitTwelve0040
     * @tc.desc      Checking for initialization with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitTwelve0040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_TWELVE_4100
     * @tc.name      testFieldInitTwelve0041
     * @tc.desc      Checking for initialization with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitTwelve0041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_TWELVE_4200
     * @tc.name      testFieldInitTwelve0042
     * @tc.desc      Checking for initialization with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitTwelve0042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_TWELVE_4300
     * @tc.name      testFieldInitTwelve0043
     * @tc.desc      Checking for initialization with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitTwelve0043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_TWELVE_4400
     * @tc.name      testFieldInitTwelve0044
     * @tc.desc      Checking for initialization with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitTwelve0044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_TWELVE_4500
     * @tc.name      testFieldInitTwelve0045
     * @tc.desc      Checking for initialization with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitTwelve0045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_TWELVE_4600
     * @tc.name      testFieldInitTwelve0046
     * @tc.desc      Checking for initialization with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitTwelve0046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_TWELVE_4700
     * @tc.name      testFieldInitTwelve0047
     * @tc.desc      Checking for initialization with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitTwelve0047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ns.A_F1235.field instanceof bigint).assertTrue()
      expect(ns.A_F1235.field).assertEqual(4n)
          ns.A_F1235.field = 5n
      expect(ns.A_F1235.field instanceof bigint).assertTrue()
      expect(ns.A_F1235.field).assertEqual(5n)
          ns.A_F1235.field = 4n
      expect(ns.A_F1235.field instanceof bigint).assertTrue()
      expect(ns.A_F1235.field).assertEqual(4n)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TWELVE_4800
     * @tc.name      testFieldInitTwelve0048
     * @tc.desc      Checking for initialization with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitTwelve0048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ns.A_F1236.field instanceof string).assertTrue()
      expect(ns.A_F1236.field).assertEqual("abc")
          ns.A_F1236.field = "efg"
      expect(ns.A_F1236.field instanceof string).assertTrue()
      expect(ns.A_F1236.field).assertEqual("efg")
          ns.A_F1236.field = "abc"
      expect(ns.A_F1236.field instanceof string).assertTrue()
      expect(ns.A_F1236.field).assertEqual("abc")
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TWELVE_4900
     * @tc.name      testFieldInitTwelve0049
     * @tc.desc      Checking for initialization with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitTwelve0049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ns.A_F1237.field instanceof char).assertTrue()
      expect(ns.A_F1237.field).assertEqual(c'a')
          ns.A_F1237.field = c'b'
      expect(ns.A_F1237.field instanceof char).assertTrue()
      expect(ns.A_F1237.field).assertEqual(c'b')
          ns.A_F1237.field = c'a'
      expect(ns.A_F1237.field instanceof char).assertTrue()
      expect(ns.A_F1237.field).assertEqual(c'a')
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TWELVE_5000
     * @tc.name      testFieldInitTwelve0050
     * @tc.desc      Checking for initialization with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitTwelve0050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ns.A_F1238.field instanceof boolean).assertTrue()
      expect(ns.A_F1238.field).assertEqual(false)
          ns.A_F1238.field = true
      expect(ns.A_F1238.field instanceof boolean).assertTrue()
      expect(ns.A_F1238.field).assertEqual(true)
          ns.A_F1238.field = false
      expect(ns.A_F1238.field instanceof boolean).assertTrue()
      expect(ns.A_F1238.field).assertEqual(false)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TWELVE_5100
     * @tc.name      testFieldInitTwelve0051
     * @tc.desc      Checking for initialization with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitTwelve0051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ns.A_F1239.field instanceof Object).assertTrue()
      expect(ns.A_F1239.field).assertEqual(4)
          ns.A_F1239.field = 5
      expect(ns.A_F1239.field instanceof Object).assertTrue()
      expect(ns.A_F1239.field).assertEqual(5)
          ns.A_F1239.field = 4
      expect(ns.A_F1239.field instanceof Object).assertTrue()
      expect(ns.A_F1239.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TWELVE_5200
     * @tc.name      testFieldInitTwelve0052
     * @tc.desc      Checking for initialization with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitTwelve0052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ns.A_F1240.field instanceof Object | undefined | null).assertTrue()
      expect(ns.A_F1240.field).assertEqual(4)
          ns.A_F1240.field = 5
      expect(ns.A_F1240.field instanceof Object | undefined | null).assertTrue()
      expect(ns.A_F1240.field).assertEqual(5)
          ns.A_F1240.field = 4
      expect(ns.A_F1240.field instanceof Object | undefined | null).assertTrue()
      expect(ns.A_F1240.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TWELVE_5300
     * @tc.name      testFieldInitTwelve0053
     * @tc.desc      Checking for initialization with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitTwelve0053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ns.A_F1241.field instanceof Any).assertTrue()
      expect(ns.A_F1241.field).assertEqual(4)
          ns.A_F1241.field = 5
      expect(ns.A_F1241.field instanceof Any).assertTrue()
      expect(ns.A_F1241.field).assertEqual(5)
          ns.A_F1241.field = 4
      expect(ns.A_F1241.field instanceof Any).assertTrue()
      expect(ns.A_F1241.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TWELVE_5400
     * @tc.name      testFieldInitTwelve0054
     * @tc.desc      Checking the implementation of interface field.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitTwelve0054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F1242 = new A_F1242()
      expect(a.field instanceof long).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof long).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TWELVE_5500
     * @tc.name      testFieldInitTwelve0055
     * @tc.desc      Checking the implementation of interface field.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitTwelve0055", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F1243 = new A_F1243()
      expect(a.field instanceof int).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof int).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TWELVE_5600
     * @tc.name      testFieldInitTwelve0056
     * @tc.desc      Checking the implementation of interface field.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitTwelve0056", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F1244 = new A_F1244()
      expect(a.field instanceof byte).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof byte).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TWELVE_5700
     * @tc.name      testFieldInitTwelve0057
     * @tc.desc      Checking the implementation of interface field.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitTwelve0057", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F1245 = new A_F1245()
      expect(a.field instanceof short).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof short).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TWELVE_5800
     * @tc.name      testFieldInitTwelve0058
     * @tc.desc      Checking the implementation of interface field.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitTwelve0058", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F1246 = new A_F1246()
      expect(a.field instanceof double).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 7.3
      expect(a.field instanceof double).assertTrue()
      expect(a.field).assertEqual(7.3)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TWELVE_5900
     * @tc.name      testFieldInitTwelve0059
     * @tc.desc      Checking the implementation of interface field.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitTwelve0059", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F1247 = new A_F1247()
      expect(a.field instanceof number).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof number).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TWELVE_6000
     * @tc.name      testFieldInitTwelve0060
     * @tc.desc      Checking the implementation of interface field.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitTwelve0060", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F1248 = new A_F1248()
      expect(a.field instanceof float).assertTrue()
      expect(a.field).assertEqual(4.5f)
      a.field = 7.3f
      expect(a.field instanceof float).assertTrue()
      expect(a.field).assertEqual(7.3f)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TWELVE_6100
     * @tc.name      testFieldInitTwelve0061
     * @tc.desc      Checking the implementation of interface field.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitTwelve0061", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F1249 = new A_F1249()
      expect(a.field instanceof bigint).assertTrue()
      expect(a.field).assertEqual(4n)
      a.field = 5n
      expect(a.field instanceof bigint).assertTrue()
      expect(a.field).assertEqual(5n)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TWELVE_6200
     * @tc.name      testFieldInitTwelve0062
     * @tc.desc      Checking the implementation of interface field.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitTwelve0062", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F1250 = new A_F1250()
      expect(a.field instanceof string).assertTrue()
      expect(a.field).assertEqual("abc")
      a.field = "efg"
      expect(a.field instanceof string).assertTrue()
      expect(a.field).assertEqual("efg")
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TWELVE_6300
     * @tc.name      testFieldInitTwelve0063
     * @tc.desc      Checking the implementation of interface field.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitTwelve0063", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F1251 = new A_F1251()
      expect(a.field instanceof char).assertTrue()
      expect(a.field).assertEqual(c'a')
      a.field = c'b'
      expect(a.field instanceof char).assertTrue()
      expect(a.field).assertEqual(c'b')
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TWELVE_6400
     * @tc.name      testFieldInitTwelve0064
     * @tc.desc      Checking the implementation of interface field.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitTwelve0064", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F1252 = new A_F1252()
      expect(a.field instanceof boolean).assertTrue()
      expect(a.field).assertEqual(false)
      a.field = true
      expect(a.field instanceof boolean).assertTrue()
      expect(a.field).assertEqual(true)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TWELVE_6500
     * @tc.name      testFieldInitTwelve0065
     * @tc.desc      Checking the implementation of interface field.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitTwelve0065", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F1253 = new A_F1253()
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TWELVE_6600
     * @tc.name      testFieldInitTwelve0066
     * @tc.desc      Checking the implementation of interface field.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitTwelve0066", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F1254 = new A_F1254()
      expect(a.field instanceof Object | undefined | null).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof Object | undefined | null).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TWELVE_6700
     * @tc.name      testFieldInitTwelve0067
     * @tc.desc      Checking the implementation of interface field.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitTwelve0067", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F1255 = new A_F1255()
      expect(a.field instanceof Any).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof Any).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TWELVE_6800
     * @tc.name      testFieldInitTwelve0068
     * @tc.desc      Checking the implementation of interface field.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitTwelve0068", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F1256 = new A_F1256()
      expect(a.field instanceof long).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof long).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TWELVE_6900
     * @tc.name      testFieldInitTwelve0069
     * @tc.desc      Checking the implementation of interface field.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitTwelve0069", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F1257 = new A_F1257()
      expect(a.field instanceof int).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof int).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TWELVE_7000
     * @tc.name      testFieldInitTwelve0070
     * @tc.desc      Checking the implementation of interface field.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitTwelve0070", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F1258 = new A_F1258()
      expect(a.field instanceof byte).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof byte).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TWELVE_7100
     * @tc.name      testFieldInitTwelve0071
     * @tc.desc      Checking the implementation of interface field.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitTwelve0071", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F1259 = new A_F1259()
      expect(a.field instanceof short).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof short).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TWELVE_7200
     * @tc.name      testFieldInitTwelve0072
     * @tc.desc      Checking the implementation of interface field.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitTwelve0072", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F1260 = new A_F1260()
      expect(a.field instanceof double).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 7.3
      expect(a.field instanceof double).assertTrue()
      expect(a.field).assertEqual(7.3)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TWELVE_7300
     * @tc.name      testFieldInitTwelve0073
     * @tc.desc      Checking the implementation of interface field.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitTwelve0073", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F1261 = new A_F1261()
      expect(a.field instanceof number).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof number).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TWELVE_7400
     * @tc.name      testFieldInitTwelve0074
     * @tc.desc      Checking the implementation of interface field.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitTwelve0074", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F1262 = new A_F1262()
      expect(a.field instanceof float).assertTrue()
      expect(a.field).assertEqual(4.5f)
      a.field = 7.3f
      expect(a.field instanceof float).assertTrue()
      expect(a.field).assertEqual(7.3f)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TWELVE_7500
     * @tc.name      testFieldInitTwelve0075
     * @tc.desc      Checking the implementation of interface field.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitTwelve0075", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F1263 = new A_F1263()
      expect(a.field instanceof bigint).assertTrue()
      expect(a.field).assertEqual(4n)
      a.field = 5n
      expect(a.field instanceof bigint).assertTrue()
      expect(a.field).assertEqual(5n)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TWELVE_7600
     * @tc.name      testFieldInitTwelve0076
     * @tc.desc      Checking the implementation of interface field.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitTwelve0076", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F1264 = new A_F1264()
      expect(a.field instanceof string).assertTrue()
      expect(a.field).assertEqual("abc")
      a.field = "efg"
      expect(a.field instanceof string).assertTrue()
      expect(a.field).assertEqual("efg")
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TWELVE_7700
     * @tc.name      testFieldInitTwelve0077
     * @tc.desc      Checking the implementation of interface field.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitTwelve0077", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F1265 = new A_F1265()
      expect(a.field instanceof char).assertTrue()
      expect(a.field).assertEqual(c'a')
      a.field = c'b'
      expect(a.field instanceof char).assertTrue()
      expect(a.field).assertEqual(c'b')
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TWELVE_7800
     * @tc.name      testFieldInitTwelve0078
     * @tc.desc      Checking the implementation of interface field.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitTwelve0078", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F1266 = new A_F1266()
      expect(a.field instanceof boolean).assertTrue()
      expect(a.field).assertEqual(false)
      a.field = true
      expect(a.field instanceof boolean).assertTrue()
      expect(a.field).assertEqual(true)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TWELVE_7900
     * @tc.name      testFieldInitTwelve0079
     * @tc.desc      Checking the implementation of interface field.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitTwelve0079", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F1267 = new A_F1267()
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TWELVE_8000
     * @tc.name      testFieldInitTwelve0080
     * @tc.desc      Checking the implementation of interface field.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitTwelve0080", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F1268 = new A_F1268()
      expect(a.field instanceof Object | undefined | null).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof Object | undefined | null).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TWELVE_8100
     * @tc.name      testFieldInitTwelve0081
     * @tc.desc      Checking the implementation of interface field.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitTwelve0081", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F1269 = new A_F1269()
      expect(a.field instanceof Any).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof Any).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TWELVE_8200
     * @tc.name      testFieldInitTwelve0082
     * @tc.desc      Checking the implementation of interface field.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitTwelve0082", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F1270 = {field: 5}
      expect(a.field instanceof long).assertTrue()
      expect(a.field).assertEqual(5)
      a.field = 4
      expect(a.field instanceof long).assertTrue()
      expect(a.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TWELVE_8300
     * @tc.name      testFieldInitTwelve0083
     * @tc.desc      Checking the implementation of interface field.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitTwelve0083", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F1271 = {field: 5}
      expect(a.field instanceof int).assertTrue()
      expect(a.field).assertEqual(5)
      a.field = 4
      expect(a.field instanceof int).assertTrue()
      expect(a.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TWELVE_8400
     * @tc.name      testFieldInitTwelve0084
     * @tc.desc      Checking the implementation of interface field.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitTwelve0084", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F1272 = {field: 5}
      expect(a.field instanceof byte).assertTrue()
      expect(a.field).assertEqual(5)
      a.field = 4
      expect(a.field instanceof byte).assertTrue()
      expect(a.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TWELVE_8500
     * @tc.name      testFieldInitTwelve0085
     * @tc.desc      Checking the implementation of interface field.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitTwelve0085", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F1273 = {field: 5}
      expect(a.field instanceof short).assertTrue()
      expect(a.field).assertEqual(5)
      a.field = 4
      expect(a.field instanceof short).assertTrue()
      expect(a.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TWELVE_8600
     * @tc.name      testFieldInitTwelve0086
     * @tc.desc      Checking the implementation of interface field.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitTwelve0086", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F1274 = {field: 7.3}
      expect(a.field instanceof double).assertTrue()
      expect(a.field).assertEqual(7.3)
      a.field = 4
      expect(a.field instanceof double).assertTrue()
      expect(a.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TWELVE_8700
     * @tc.name      testFieldInitTwelve0087
     * @tc.desc      Checking the implementation of interface field.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitTwelve0087", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F1275 = {field: 5}
      expect(a.field instanceof number).assertTrue()
      expect(a.field).assertEqual(5)
      a.field = 4
      expect(a.field instanceof number).assertTrue()
      expect(a.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TWELVE_8800
     * @tc.name      testFieldInitTwelve0088
     * @tc.desc      Checking the implementation of interface field.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitTwelve0088", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F1276 = {field: 7.3f}
      expect(a.field instanceof float).assertTrue()
      expect(a.field).assertEqual(7.3f)
      a.field = 4.5f
      expect(a.field instanceof float).assertTrue()
      expect(a.field).assertEqual(4.5f)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TWELVE_8900
     * @tc.name      testFieldInitTwelve0089
     * @tc.desc      Checking the implementation of interface field.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitTwelve0089", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F1277 = {field: 5n}
      expect(a.field instanceof bigint).assertTrue()
      expect(a.field).assertEqual(5n)
      a.field = 4n
      expect(a.field instanceof bigint).assertTrue()
      expect(a.field).assertEqual(4n)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TWELVE_9000
     * @tc.name      testFieldInitTwelve0090
     * @tc.desc      Checking the implementation of interface field.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitTwelve0090", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F1278 = {field: "efg"}
      expect(a.field instanceof string).assertTrue()
      expect(a.field).assertEqual("efg")
      a.field = "abc"
      expect(a.field instanceof string).assertTrue()
      expect(a.field).assertEqual("abc")
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TWELVE_9100
     * @tc.name      testFieldInitTwelve0091
     * @tc.desc      Checking the implementation of interface field.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitTwelve0091", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F1279 = {field: c'b'}
      expect(a.field instanceof char).assertTrue()
      expect(a.field).assertEqual(c'b')
      a.field = c'a'
      expect(a.field instanceof char).assertTrue()
      expect(a.field).assertEqual(c'a')
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TWELVE_9200
     * @tc.name      testFieldInitTwelve0092
     * @tc.desc      Checking the implementation of interface field.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitTwelve0092", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F1280 = {field: true}
      expect(a.field instanceof boolean).assertTrue()
      expect(a.field).assertEqual(true)
      a.field = false
      expect(a.field instanceof boolean).assertTrue()
      expect(a.field).assertEqual(false)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TWELVE_9300
     * @tc.name      testFieldInitTwelve0093
     * @tc.desc      Checking the implementation of interface field.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitTwelve0093", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F1281 = {field: 5}
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(5)
      a.field = 4
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TWELVE_9400
     * @tc.name      testFieldInitTwelve0094
     * @tc.desc      Checking the implementation of interface field.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitTwelve0094", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F1282 = {field: 5}
      expect(a.field instanceof Object | undefined | null).assertTrue()
      expect(a.field).assertEqual(5)
      a.field = 4
      expect(a.field instanceof Object | undefined | null).assertTrue()
      expect(a.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TWELVE_9500
     * @tc.name      testFieldInitTwelve0095
     * @tc.desc      Checking the implementation of interface field.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitTwelve0095", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F1283 = {field: 5}
      expect(a.field instanceof Any).assertTrue()
      expect(a.field).assertEqual(5)
      a.field = 4
      expect(a.field instanceof Any).assertTrue()
      expect(a.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TWELVE_9600
     * @tc.name      testFieldInitTwelve0096
     * @tc.desc      Checking the implementation of interface field.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitTwelve0096", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F1284 = {field: 5}
      expect(a.field instanceof long).assertTrue()
      expect(a.field).assertEqual(5)
      a.field = 4
      expect(a.field instanceof long).assertTrue()
      expect(a.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TWELVE_9700
     * @tc.name      testFieldInitTwelve0097
     * @tc.desc      Checking the implementation of interface field.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitTwelve0097", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F1285 = {field: 5}
      expect(a.field instanceof int).assertTrue()
      expect(a.field).assertEqual(5)
      a.field = 4
      expect(a.field instanceof int).assertTrue()
      expect(a.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TWELVE_9800
     * @tc.name      testFieldInitTwelve0098
     * @tc.desc      Checking the implementation of interface field.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitTwelve0098", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F1286 = {field: 5}
      expect(a.field instanceof byte).assertTrue()
      expect(a.field).assertEqual(5)
      a.field = 4
      expect(a.field instanceof byte).assertTrue()
      expect(a.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TWELVE_9900
     * @tc.name      testFieldInitTwelve0099
     * @tc.desc      Checking the implementation of interface field.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitTwelve0099", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F1287 = {field: 5}
      expect(a.field instanceof short).assertTrue()
      expect(a.field).assertEqual(5)
      a.field = 4
      expect(a.field instanceof short).assertTrue()
      expect(a.field).assertEqual(4)
    })
  })
}
