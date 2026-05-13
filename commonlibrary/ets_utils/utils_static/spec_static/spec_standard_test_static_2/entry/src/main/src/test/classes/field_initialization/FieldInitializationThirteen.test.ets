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

interface I_F1288 {
    field: double
  }
  class A_F1288 implements I_F1288 {
    field: double
    constructor () {
      this.field = 4
    }
  }

interface I_F1289 {
    field: number
  }
  class A_F1289 implements I_F1289 {
    field: number
    constructor () {
      this.field = 4
    }
  }

interface I_F1290 {
    field: float
  }
  class A_F1290 implements I_F1290 {
    field: float
    constructor () {
      this.field = 4.5f
    }
  }

interface I_F1291 {
    field: bigint
  }
  class A_F1291 implements I_F1291 {
    field: bigint
    constructor () {
      this.field = 4n
    }
  }

interface I_F1292 {
    field: string
  }
  class A_F1292 implements I_F1292 {
    field: string
    constructor () {
      this.field = "abc"
    }
  }

interface I_F1293 {
    field: char
  }
  class A_F1293 implements I_F1293 {
    field: char
    constructor () {
      this.field = c'a'
    }
  }

interface I_F1294 {
    field: boolean
  }
  class A_F1294 implements I_F1294 {
    field: boolean
    constructor () {
      this.field = false
    }
  }

interface I_F1295 {
    field: Object
  }
  class A_F1295 implements I_F1295 {
    field: Object
    constructor () {
      this.field = 4
    }
  }

interface I_F1296 {
    field: Object | undefined | null
  }
  class A_F1296 implements I_F1296 {
    field: Object | undefined | null
    constructor () {
      this.field = 4
    }
  }

interface I_F1297 {
    field: Any
  }
  class A_F1297 implements I_F1297 {
    field: Any
    constructor () {
      this.field = 4
    }
  }

class C_F1298 {data: int = 0}
  interface I_F1298 {
    field: C_F1298
  }
  class A_F1298 implements I_F1298 {
    field: C_F1298 = {data: 4}
  }

class C_F1299 {data: int = 0}
  interface I_F1299 {
    field: C_F1299
  }
  class A_F1299 implements I_F1299 {
    field: C_F1299
    constructor () {
      this.field = {data: 4}
    }
  }

class C_F1300 {data: int = 0}
  interface I_F1300 {
    field: C_F1300
  }
  class A_F1300 implements I_F1300 {
    field: C_F1300 = new C_F1300
  }

class C_F1301 {data: int = 0}
  interface I_F1301 {
    field: C_F1301
  }
  class A_F1301 implements I_F1301 {
    field: C_F1301
    constructor () {
      this.field = new C_F1301
    }
  }

interface I_F1302 {
    readonly field: long
  }
  class A_F1302 implements I_F1302 {
    field: long = 4
  }

interface I_F1303 {
    readonly field: int
  }
  class A_F1303 implements I_F1303 {
    field: int = 4
  }

interface I_F1304 {
    readonly field: byte
  }
  class A_F1304 implements I_F1304 {
    field: byte = 4
  }

interface I_F1305 {
    readonly field: short
  }
  class A_F1305 implements I_F1305 {
    field: short = 4
  }

interface I_F1306 {
    readonly field: double
  }
  class A_F1306 implements I_F1306 {
    field: double = 4
  }

interface I_F1307 {
    readonly field: number
  }
  class A_F1307 implements I_F1307 {
    field: number = 4
  }

interface I_F1308 {
    readonly field: float
  }
  class A_F1308 implements I_F1308 {
    field: float = 4.5f
  }

interface I_F1309 {
    readonly field: bigint
  }
  class A_F1309 implements I_F1309 {
    field: bigint = 4n
  }

interface I_F1310 {
    readonly field: string
  }
  class A_F1310 implements I_F1310 {
    field: string = "abc"
  }

interface I_F1311 {
    readonly field: char
  }
  class A_F1311 implements I_F1311 {
    field: char = c'a'
  }

interface I_F1312 {
    readonly field: boolean
  }
  class A_F1312 implements I_F1312 {
    field: boolean = false
  }

interface I_F1313 {
    readonly field: Object
  }
  class A_F1313 implements I_F1313 {
    field: Object = 4
  }

interface I_F1314 {
    readonly field: Object | undefined | null
  }
  class A_F1314 implements I_F1314 {
    field: Object | undefined | null = 4
  }

interface I_F1315 {
    readonly field: Any
  }
  class A_F1315 implements I_F1315 {
    field: Any = 4
  }

interface I_F1316 {
    readonly field: long
  }
  class A_F1316 implements I_F1316 {
    field: long
    constructor () {
      this.field = 4
    }
  }

interface I_F1317 {
    readonly field: int
  }
  class A_F1317 implements I_F1317 {
    field: int
    constructor () {
      this.field = 4
    }
  }

interface I_F1318 {
    readonly field: byte
  }
  class A_F1318 implements I_F1318 {
    field: byte
    constructor () {
      this.field = 4
    }
  }

interface I_F1319 {
    readonly field: short
  }
  class A_F1319 implements I_F1319 {
    field: short
    constructor () {
      this.field = 4
    }
  }

interface I_F1320 {
    readonly field: double
  }
  class A_F1320 implements I_F1320 {
    field: double
    constructor () {
      this.field = 4
    }
  }

interface I_F1321 {
    readonly field: number
  }
  class A_F1321 implements I_F1321 {
    field: number
    constructor () {
      this.field = 4
    }
  }

interface I_F1322 {
    readonly field: float
  }
  class A_F1322 implements I_F1322 {
    field: float
    constructor () {
      this.field = 4.5f
    }
  }

interface I_F1323 {
    readonly field: bigint
  }
  class A_F1323 implements I_F1323 {
    field: bigint
    constructor () {
      this.field = 4n
    }
  }

interface I_F1324 {
    readonly field: string
  }
  class A_F1324 implements I_F1324 {
    field: string
    constructor () {
      this.field = "abc"
    }
  }

interface I_F1325 {
    readonly field: char
  }
  class A_F1325 implements I_F1325 {
    field: char
    constructor () {
      this.field = c'a'
    }
  }

interface I_F1326 {
    readonly field: boolean
  }
  class A_F1326 implements I_F1326 {
    field: boolean
    constructor () {
      this.field = false
    }
  }

interface I_F1327 {
    readonly field: Object
  }
  class A_F1327 implements I_F1327 {
    field: Object
    constructor () {
      this.field = 4
    }
  }

interface I_F1328 {
    readonly field: Object | undefined | null
  }
  class A_F1328 implements I_F1328 {
    field: Object | undefined | null
    constructor () {
      this.field = 4
    }
  }

interface I_F1329 {
    readonly field: Any
  }
  class A_F1329 implements I_F1329 {
    field: Any
    constructor () {
      this.field = 4
    }
  }

interface I_F1330 {
    readonly field: long
  }
  class A_F1330 implements I_F1330 {
    field: long = 4
  }

interface I_F1331 {
    readonly field: int
  }
  class A_F1331 implements I_F1331 {
    field: int = 4
  }

interface I_F1332 {
    readonly field: byte
  }
  class A_F1332 implements I_F1332 {
    field: byte = 4
  }

interface I_F1333 {
    readonly field: short
  }
  class A_F1333 implements I_F1333 {
    field: short = 4
  }

interface I_F1334 {
    readonly field: double
  }
  class A_F1334 implements I_F1334 {
    field: double = 4
  }

interface I_F1335 {
    readonly field: number
  }
  class A_F1335 implements I_F1335 {
    field: number = 4
  }

interface I_F1336 {
    readonly field: float
  }
  class A_F1336 implements I_F1336 {
    field: float = 4.5f
  }

interface I_F1337 {
    readonly field: bigint
  }
  class A_F1337 implements I_F1337 {
    field: bigint = 4n
  }

interface I_F1338 {
    readonly field: string
  }
  class A_F1338 implements I_F1338 {
    field: string = "abc"
  }

interface I_F1339 {
    readonly field: char
  }
  class A_F1339 implements I_F1339 {
    field: char = c'a'
  }

interface I_F1340 {
    readonly field: boolean
  }
  class A_F1340 implements I_F1340 {
    field: boolean = false
  }

interface I_F1341 {
    readonly field: Object
  }
  class A_F1341 implements I_F1341 {
    field: Object = 4
  }

interface I_F1342 {
    readonly field: Object | undefined | null
  }
  class A_F1342 implements I_F1342 {
    field: Object | undefined | null = 4
  }

interface I_F1343 {
    readonly field: Any
  }
  class A_F1343 implements I_F1343 {
    field: Any = 4
  }

interface I_F1344 {
    readonly field: long
  }
  class A_F1344 implements I_F1344 {
    field: long
    constructor () {
      this.field = 4
    }
  }

interface I_F1345 {
    readonly field: int
  }
  class A_F1345 implements I_F1345 {
    field: int
    constructor () {
      this.field = 4
    }
  }

interface I_F1346 {
    readonly field: byte
  }
  class A_F1346 implements I_F1346 {
    field: byte
    constructor () {
      this.field = 4
    }
  }

interface I_F1347 {
    readonly field: short
  }
  class A_F1347 implements I_F1347 {
    field: short
    constructor () {
      this.field = 4
    }
  }

interface I_F1348 {
    readonly field: double
  }
  class A_F1348 implements I_F1348 {
    field: double
    constructor () {
      this.field = 4
    }
  }

interface I_F1349 {
    readonly field: number
  }
  class A_F1349 implements I_F1349 {
    field: number
    constructor () {
      this.field = 4
    }
  }

interface I_F1350 {
    readonly field: float
  }
  class A_F1350 implements I_F1350 {
    field: float
    constructor () {
      this.field = 4.5f
    }
  }

interface I_F1351 {
    readonly field: bigint
  }
  class A_F1351 implements I_F1351 {
    field: bigint
    constructor () {
      this.field = 4n
    }
  }

interface I_F1352 {
    readonly field: string
  }
  class A_F1352 implements I_F1352 {
    field: string
    constructor () {
      this.field = "abc"
    }
  }

interface I_F1353 {
    readonly field: char
  }
  class A_F1353 implements I_F1353 {
    field: char
    constructor () {
      this.field = c'a'
    }
  }

interface I_F1354 {
    readonly field: boolean
  }
  class A_F1354 implements I_F1354 {
    field: boolean
    constructor () {
      this.field = false
    }
  }

interface I_F1355 {
    readonly field: Object
  }
  class A_F1355 implements I_F1355 {
    field: Object
    constructor () {
      this.field = 4
    }
  }

interface I_F1356 {
    readonly field: Object | undefined | null
  }
  class A_F1356 implements I_F1356 {
    field: Object | undefined | null
    constructor () {
      this.field = 4
    }
  }

interface I_F1357 {
    readonly field: Any
  }
  class A_F1357 implements I_F1357 {
    field: Any
    constructor () {
      this.field = 4
    }
  }

class C_F1358 {data: int = 0}
  interface I_F1358 {
    readonly field: C_F1358
  }
  class A_F1358 implements I_F1358 {
    field: C_F1358 = {data: 4}
  }

class C_F1359 {data: int = 0}
  interface I_F1359 {
    readonly field: C_F1359
  }
  class A_F1359 implements I_F1359 {
    field: C_F1359
    constructor () {
      this.field = {data: 4}
    }
  }

class C_F1360 {data: int = 0}
  interface I_F1360 {
    readonly field: C_F1360
  }
  class A_F1360 implements I_F1360 {
    field: C_F1360 = new C_F1360
  }

class C_F1361 {data: int = 0}
  interface I_F1361 {
    readonly field: C_F1361
  }
  class A_F1361 implements I_F1361 {
    field: C_F1361
    constructor () {
      this.field = new C_F1361
    }
  }

interface I_F1362 {
    field: long
  }

interface I_F1363 {
    field: int
  }

interface I_F1364 {
    field: byte
  }

interface I_F1365 {
    field: short
  }

interface I_F1366 {
    field: double
  }

interface I_F1367 {
    field: number
  }

interface I_F1368 {
    field: float
  }

interface I_F1369 {
    field: bigint
  }

interface I_F1370 {
    field: string
  }

interface I_F1371 {
    field: char
  }

interface I_F1372 {
    field: boolean
  }

interface I_F1373 {
    field: Object
  }

interface I_F1374 {
    field: Object | undefined | null
  }

interface I_F1375 {
    field: Any
  }

namespace ns {
    export interface I_F1376 {
      field: long
      foo: () => void
    }
    export class A_F1376 implements I_F1376 {
      field: long = 4
      foo: () => void = (): void => {
        this.field = 5
      }
    }
  }

namespace ns {
    export interface I_F1377 {
      field: int
      foo: () => void
    }
    export class A_F1377 implements I_F1377 {
      field: int = 4
      foo: () => void = (): void => {
        this.field = 5
      }
    }
  }

namespace ns {
    export interface I_F1378 {
      field: byte
      foo: () => void
    }
    export class A_F1378 implements I_F1378 {
      field: byte = 4
      foo: () => void = (): void => {
        this.field = 5
      }
    }
  }

namespace ns {
    export interface I_F1379 {
      field: short
      foo: () => void
    }
    export class A_F1379 implements I_F1379 {
      field: short = 4
      foo: () => void = (): void => {
        this.field = 5
      }
    }
  }

namespace ns {
    export interface I_F1380 {
      field: double
      foo: () => void
    }
    export class A_F1380 implements I_F1380 {
      field: double = 4
      foo: () => void = (): void => {
        this.field = 7.3
      }
    }
  }

namespace ns {
    export interface I_F1381 {
      field: number
      foo: () => void
    }
    export class A_F1381 implements I_F1381 {
      field: number = 4
      foo: () => void = (): void => {
        this.field = 5
      }
    }
  }

namespace ns {
    export interface I_F1382 {
      field: float
      foo: () => void
    }
    export class A_F1382 implements I_F1382 {
      field: float = 4.5f
      foo: () => void = (): void => {
        this.field = 7.3f
      }
    }
  }

namespace ns {
    export interface I_F1383 {
      field: bigint
      foo: () => void
    }
    export class A_F1383 implements I_F1383 {
      field: bigint = 4n
      foo: () => void = (): void => {
        this.field = 5n
      }
    }
  }

namespace ns {
    export interface I_F1384 {
      field: string
      foo: () => void
    }
    export class A_F1384 implements I_F1384 {
      field: string = "abc"
      foo: () => void = (): void => {
        this.field = "efg"
      }
    }
  }

namespace ns {
    export interface I_F1385 {
      field: char
      foo: () => void
    }
    export class A_F1385 implements I_F1385 {
      field: char = c'a'
      foo: () => void = (): void => {
        this.field = c'b'
      }
    }
  }

namespace ns {
    export interface I_F1386 {
      field: boolean
      foo: () => void
    }
    export class A_F1386 implements I_F1386 {
      field: boolean = false
      foo: () => void = (): void => {
        this.field = true
      }
    }
  }

export default function FieldInitializationTestThirteen(): void {
  describe("FieldInitializationTestThirteen", () => {
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
     * @tc.number    SUB_FIELD_INIT_TEST_1288
     * @tc.name      testFieldInit1288
     * @tc.desc      Checking the implementation of interface field.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit1288", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F1288 = {field: 7.3}
      expect(a.field instanceof double).assertTrue()
      expect(a.field).assertEqual(7.3)
      a.field = 4
      expect(a.field instanceof double).assertTrue()
      expect(a.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_1289
     * @tc.name      testFieldInit1289
     * @tc.desc      Checking the implementation of interface field.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit1289", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F1289 = {field: 5}
      expect(a.field instanceof number).assertTrue()
      expect(a.field).assertEqual(5)
      a.field = 4
      expect(a.field instanceof number).assertTrue()
      expect(a.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_1290
     * @tc.name      testFieldInit1290
     * @tc.desc      Checking the implementation of interface field.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit1290", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F1290 = {field: 7.3f}
      expect(a.field instanceof float).assertTrue()
      expect(a.field).assertEqual(7.3f)
      a.field = 4.5f
      expect(a.field instanceof float).assertTrue()
      expect(a.field).assertEqual(4.5f)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_1291
     * @tc.name      testFieldInit1291
     * @tc.desc      Checking the implementation of interface field.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit1291", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F1291 = {field: 5n}
      expect(a.field instanceof bigint).assertTrue()
      expect(a.field).assertEqual(5n)
      a.field = 4n
      expect(a.field instanceof bigint).assertTrue()
      expect(a.field).assertEqual(4n)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_1292
     * @tc.name      testFieldInit1292
     * @tc.desc      Checking the implementation of interface field.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit1292", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F1292 = {field: "efg"}
      expect(a.field instanceof string).assertTrue()
      expect(a.field).assertEqual("efg")
      a.field = "abc"
      expect(a.field instanceof string).assertTrue()
      expect(a.field).assertEqual("abc")
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_1293
     * @tc.name      testFieldInit1293
     * @tc.desc      Checking the implementation of interface field.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit1293", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F1293 = {field: c'b'}
      expect(a.field instanceof char).assertTrue()
      expect(a.field).assertEqual(c'b')
      a.field = c'a'
      expect(a.field instanceof char).assertTrue()
      expect(a.field).assertEqual(c'a')
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_1294
     * @tc.name      testFieldInit1294
     * @tc.desc      Checking the implementation of interface field.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit1294", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F1294 = {field: true}
      expect(a.field instanceof boolean).assertTrue()
      expect(a.field).assertEqual(true)
      a.field = false
      expect(a.field instanceof boolean).assertTrue()
      expect(a.field).assertEqual(false)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_1295
     * @tc.name      testFieldInit1295
     * @tc.desc      Checking the implementation of interface field.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit1295", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F1295 = {field: 5}
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(5)
      a.field = 4
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_1296
     * @tc.name      testFieldInit1296
     * @tc.desc      Checking the implementation of interface field.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit1296", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F1296 = {field: 5}
      expect(a.field instanceof Object | undefined | null).assertTrue()
      expect(a.field).assertEqual(5)
      a.field = 4
      expect(a.field instanceof Object | undefined | null).assertTrue()
      expect(a.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_1297
     * @tc.name      testFieldInit1297
     * @tc.desc      Checking the implementation of interface field.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit1297", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F1297 = {field: 5}
      expect(a.field instanceof Any).assertTrue()
      expect(a.field).assertEqual(5)
      a.field = 4
      expect(a.field instanceof Any).assertTrue()
      expect(a.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_1298
     * @tc.name      testFieldInit1298
     * @tc.desc      Checking the implementation of interface field.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit1298", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F1298 = new A_F1298()
      expect(a.field instanceof C_F1298).assertTrue()
      expect(a.field.data instanceof int).assertTrue()
      expect(a.field.data).assertEqual(4)
      a.field = {data: 5}
      expect(a.field instanceof C_F1298).assertTrue()
      expect(a.field.data instanceof int).assertTrue()
      expect(a.field.data).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_1299
     * @tc.name      testFieldInit1299
     * @tc.desc      Checking the implementation of interface field.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit1299", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F1299 = new A_F1299()
      expect(a.field instanceof C_F1299).assertTrue()
      expect(a.field.data instanceof int).assertTrue()
      expect(a.field.data).assertEqual(4)
      a.field = {data: 5}
      expect(a.field instanceof C_F1299).assertTrue()
      expect(a.field.data instanceof int).assertTrue()
      expect(a.field.data).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_1300
     * @tc.name      testFieldInit1300
     * @tc.desc      Checking the implementation of interface field.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit1300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F1300 = {field: {data: 4}}
      expect(a.field instanceof C_F1300).assertTrue()
      expect(a.field.data instanceof int).assertTrue()
      expect(a.field.data).assertEqual(4)
      a.field = {data: 5}
      expect(a.field instanceof C_F1300).assertTrue()
      expect(a.field.data instanceof int).assertTrue()
      expect(a.field.data).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_1301
     * @tc.name      testFieldInit1301
     * @tc.desc      Checking the implementation of interface field.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit1301", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F1301 = {field: {data: 4}}
      expect(a.field instanceof C_F1301).assertTrue()
      expect(a.field.data instanceof int).assertTrue()
      expect(a.field.data).assertEqual(4)
      a.field = {data: 5}
      expect(a.field instanceof C_F1301).assertTrue()
      expect(a.field.data instanceof int).assertTrue()
      expect(a.field.data).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_1302
     * @tc.name      testFieldInit1302
     * @tc.desc      Checking the implementation of interface readonly field.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit1302", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F1302 = new A_F1302()
      expect(a.field instanceof long).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof long).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_1303
     * @tc.name      testFieldInit1303
     * @tc.desc      Checking the implementation of interface readonly field.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit1303", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F1303 = new A_F1303()
      expect(a.field instanceof int).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof int).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_1304
     * @tc.name      testFieldInit1304
     * @tc.desc      Checking the implementation of interface readonly field.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit1304", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F1304 = new A_F1304()
      expect(a.field instanceof byte).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof byte).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_1305
     * @tc.name      testFieldInit1305
     * @tc.desc      Checking the implementation of interface readonly field.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit1305", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F1305 = new A_F1305()
      expect(a.field instanceof short).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof short).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_1306
     * @tc.name      testFieldInit1306
     * @tc.desc      Checking the implementation of interface readonly field.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit1306", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F1306 = new A_F1306()
      expect(a.field instanceof double).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 7.3
      expect(a.field instanceof double).assertTrue()
      expect(a.field).assertEqual(7.3)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_1307
     * @tc.name      testFieldInit1307
     * @tc.desc      Checking the implementation of interface readonly field.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit1307", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F1307 = new A_F1307()
      expect(a.field instanceof number).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof number).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_1308
     * @tc.name      testFieldInit1308
     * @tc.desc      Checking the implementation of interface readonly field.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit1308", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F1308 = new A_F1308()
      expect(a.field instanceof float).assertTrue()
      expect(a.field).assertEqual(4.5f)
      a.field = 7.3f
      expect(a.field instanceof float).assertTrue()
      expect(a.field).assertEqual(7.3f)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_1309
     * @tc.name      testFieldInit1309
     * @tc.desc      Checking the implementation of interface readonly field.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit1309", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F1309 = new A_F1309()
      expect(a.field instanceof bigint).assertTrue()
      expect(a.field).assertEqual(4n)
      a.field = 5n
      expect(a.field instanceof bigint).assertTrue()
      expect(a.field).assertEqual(5n)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_1310
     * @tc.name      testFieldInit1310
     * @tc.desc      Checking the implementation of interface readonly field.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit1310", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F1310 = new A_F1310()
      expect(a.field instanceof string).assertTrue()
      expect(a.field).assertEqual("abc")
      a.field = "efg"
      expect(a.field instanceof string).assertTrue()
      expect(a.field).assertEqual("efg")
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_1311
     * @tc.name      testFieldInit1311
     * @tc.desc      Checking the implementation of interface readonly field.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit1311", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F1311 = new A_F1311()
      expect(a.field instanceof char).assertTrue()
      expect(a.field).assertEqual(c'a')
      a.field = c'b'
      expect(a.field instanceof char).assertTrue()
      expect(a.field).assertEqual(c'b')
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_1312
     * @tc.name      testFieldInit1312
     * @tc.desc      Checking the implementation of interface readonly field.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit1312", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F1312 = new A_F1312()
      expect(a.field instanceof boolean).assertTrue()
      expect(a.field).assertEqual(false)
      a.field = true
      expect(a.field instanceof boolean).assertTrue()
      expect(a.field).assertEqual(true)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_1313
     * @tc.name      testFieldInit1313
     * @tc.desc      Checking the implementation of interface readonly field.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit1313", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F1313 = new A_F1313()
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_1314
     * @tc.name      testFieldInit1314
     * @tc.desc      Checking the implementation of interface readonly field.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit1314", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F1314 = new A_F1314()
      expect(a.field instanceof Object | undefined | null).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof Object | undefined | null).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_1315
     * @tc.name      testFieldInit1315
     * @tc.desc      Checking the implementation of interface readonly field.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit1315", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F1315 = new A_F1315()
      expect(a.field instanceof Any).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof Any).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_1316
     * @tc.name      testFieldInit1316
     * @tc.desc      Checking the implementation of interface readonly field.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit1316", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F1316 = new A_F1316()
      expect(a.field instanceof long).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof long).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_1317
     * @tc.name      testFieldInit1317
     * @tc.desc      Checking the implementation of interface readonly field.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit1317", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F1317 = new A_F1317()
      expect(a.field instanceof int).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof int).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_1318
     * @tc.name      testFieldInit1318
     * @tc.desc      Checking the implementation of interface readonly field.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit1318", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F1318 = new A_F1318()
      expect(a.field instanceof byte).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof byte).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_1319
     * @tc.name      testFieldInit1319
     * @tc.desc      Checking the implementation of interface readonly field.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit1319", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F1319 = new A_F1319()
      expect(a.field instanceof short).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof short).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_1320
     * @tc.name      testFieldInit1320
     * @tc.desc      Checking the implementation of interface readonly field.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit1320", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F1320 = new A_F1320()
      expect(a.field instanceof double).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 7.3
      expect(a.field instanceof double).assertTrue()
      expect(a.field).assertEqual(7.3)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_1321
     * @tc.name      testFieldInit1321
     * @tc.desc      Checking the implementation of interface readonly field.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit1321", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F1321 = new A_F1321()
      expect(a.field instanceof number).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof number).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_1322
     * @tc.name      testFieldInit1322
     * @tc.desc      Checking the implementation of interface readonly field.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit1322", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F1322 = new A_F1322()
      expect(a.field instanceof float).assertTrue()
      expect(a.field).assertEqual(4.5f)
      a.field = 7.3f
      expect(a.field instanceof float).assertTrue()
      expect(a.field).assertEqual(7.3f)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_1323
     * @tc.name      testFieldInit1323
     * @tc.desc      Checking the implementation of interface readonly field.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit1323", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F1323 = new A_F1323()
      expect(a.field instanceof bigint).assertTrue()
      expect(a.field).assertEqual(4n)
      a.field = 5n
      expect(a.field instanceof bigint).assertTrue()
      expect(a.field).assertEqual(5n)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_1324
     * @tc.name      testFieldInit1324
     * @tc.desc      Checking the implementation of interface readonly field.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit1324", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F1324 = new A_F1324()
      expect(a.field instanceof string).assertTrue()
      expect(a.field).assertEqual("abc")
      a.field = "efg"
      expect(a.field instanceof string).assertTrue()
      expect(a.field).assertEqual("efg")
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_1325
     * @tc.name      testFieldInit1325
     * @tc.desc      Checking the implementation of interface readonly field.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit1325", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F1325 = new A_F1325()
      expect(a.field instanceof char).assertTrue()
      expect(a.field).assertEqual(c'a')
      a.field = c'b'
      expect(a.field instanceof char).assertTrue()
      expect(a.field).assertEqual(c'b')
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_1326
     * @tc.name      testFieldInit1326
     * @tc.desc      Checking the implementation of interface readonly field.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit1326", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F1326 = new A_F1326()
      expect(a.field instanceof boolean).assertTrue()
      expect(a.field).assertEqual(false)
      a.field = true
      expect(a.field instanceof boolean).assertTrue()
      expect(a.field).assertEqual(true)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_1327
     * @tc.name      testFieldInit1327
     * @tc.desc      Checking the implementation of interface readonly field.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit1327", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F1327 = new A_F1327()
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_1328
     * @tc.name      testFieldInit1328
     * @tc.desc      Checking the implementation of interface readonly field.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit1328", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F1328 = new A_F1328()
      expect(a.field instanceof Object | undefined | null).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof Object | undefined | null).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_1329
     * @tc.name      testFieldInit1329
     * @tc.desc      Checking the implementation of interface readonly field.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit1329", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F1329 = new A_F1329()
      expect(a.field instanceof Any).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof Any).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_1330
     * @tc.name      testFieldInit1330
     * @tc.desc      Checking the implementation of interface readonly field.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit1330", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F1330 = {field: 5}
      expect(a.field instanceof long).assertTrue()
      expect(a.field).assertEqual(5)
      a.field = 4
      expect(a.field instanceof long).assertTrue()
      expect(a.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_1331
     * @tc.name      testFieldInit1331
     * @tc.desc      Checking the implementation of interface readonly field.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit1331", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F1331 = {field: 5}
      expect(a.field instanceof int).assertTrue()
      expect(a.field).assertEqual(5)
      a.field = 4
      expect(a.field instanceof int).assertTrue()
      expect(a.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_1332
     * @tc.name      testFieldInit1332
     * @tc.desc      Checking the implementation of interface readonly field.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit1332", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F1332 = {field: 5}
      expect(a.field instanceof byte).assertTrue()
      expect(a.field).assertEqual(5)
      a.field = 4
      expect(a.field instanceof byte).assertTrue()
      expect(a.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_1333
     * @tc.name      testFieldInit1333
     * @tc.desc      Checking the implementation of interface readonly field.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit1333", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F1333 = {field: 5}
      expect(a.field instanceof short).assertTrue()
      expect(a.field).assertEqual(5)
      a.field = 4
      expect(a.field instanceof short).assertTrue()
      expect(a.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_1334
     * @tc.name      testFieldInit1334
     * @tc.desc      Checking the implementation of interface readonly field.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit1334", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F1334 = {field: 7.3}
      expect(a.field instanceof double).assertTrue()
      expect(a.field).assertEqual(7.3)
      a.field = 4
      expect(a.field instanceof double).assertTrue()
      expect(a.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_1335
     * @tc.name      testFieldInit1335
     * @tc.desc      Checking the implementation of interface readonly field.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit1335", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F1335 = {field: 5}
      expect(a.field instanceof number).assertTrue()
      expect(a.field).assertEqual(5)
      a.field = 4
      expect(a.field instanceof number).assertTrue()
      expect(a.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_1336
     * @tc.name      testFieldInit1336
     * @tc.desc      Checking the implementation of interface readonly field.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit1336", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F1336 = {field: 7.3f}
      expect(a.field instanceof float).assertTrue()
      expect(a.field).assertEqual(7.3f)
      a.field = 4.5f
      expect(a.field instanceof float).assertTrue()
      expect(a.field).assertEqual(4.5f)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_1337
     * @tc.name      testFieldInit1337
     * @tc.desc      Checking the implementation of interface readonly field.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit1337", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F1337 = {field: 5n}
      expect(a.field instanceof bigint).assertTrue()
      expect(a.field).assertEqual(5n)
      a.field = 4n
      expect(a.field instanceof bigint).assertTrue()
      expect(a.field).assertEqual(4n)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_1338
     * @tc.name      testFieldInit1338
     * @tc.desc      Checking the implementation of interface readonly field.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit1338", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F1338 = {field: "efg"}
      expect(a.field instanceof string).assertTrue()
      expect(a.field).assertEqual("efg")
      a.field = "abc"
      expect(a.field instanceof string).assertTrue()
      expect(a.field).assertEqual("abc")
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_1339
     * @tc.name      testFieldInit1339
     * @tc.desc      Checking the implementation of interface readonly field.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit1339", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F1339 = {field: c'b'}
      expect(a.field instanceof char).assertTrue()
      expect(a.field).assertEqual(c'b')
      a.field = c'a'
      expect(a.field instanceof char).assertTrue()
      expect(a.field).assertEqual(c'a')
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_1340
     * @tc.name      testFieldInit1340
     * @tc.desc      Checking the implementation of interface readonly field.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit1340", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F1340 = {field: true}
      expect(a.field instanceof boolean).assertTrue()
      expect(a.field).assertEqual(true)
      a.field = false
      expect(a.field instanceof boolean).assertTrue()
      expect(a.field).assertEqual(false)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_1341
     * @tc.name      testFieldInit1341
     * @tc.desc      Checking the implementation of interface readonly field.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit1341", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F1341 = {field: 5}
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(5)
      a.field = 4
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_1342
     * @tc.name      testFieldInit1342
     * @tc.desc      Checking the implementation of interface readonly field.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit1342", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F1342 = {field: 5}
      expect(a.field instanceof Object | undefined | null).assertTrue()
      expect(a.field).assertEqual(5)
      a.field = 4
      expect(a.field instanceof Object | undefined | null).assertTrue()
      expect(a.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_1343
     * @tc.name      testFieldInit1343
     * @tc.desc      Checking the implementation of interface readonly field.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit1343", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F1343 = {field: 5}
      expect(a.field instanceof Any).assertTrue()
      expect(a.field).assertEqual(5)
      a.field = 4
      expect(a.field instanceof Any).assertTrue()
      expect(a.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_1344
     * @tc.name      testFieldInit1344
     * @tc.desc      Checking the implementation of interface readonly field.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit1344", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F1344 = {field: 5}
      expect(a.field instanceof long).assertTrue()
      expect(a.field).assertEqual(5)
      a.field = 4
      expect(a.field instanceof long).assertTrue()
      expect(a.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_1345
     * @tc.name      testFieldInit1345
     * @tc.desc      Checking the implementation of interface readonly field.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit1345", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F1345 = {field: 5}
      expect(a.field instanceof int).assertTrue()
      expect(a.field).assertEqual(5)
      a.field = 4
      expect(a.field instanceof int).assertTrue()
      expect(a.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_1346
     * @tc.name      testFieldInit1346
     * @tc.desc      Checking the implementation of interface readonly field.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit1346", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F1346 = {field: 5}
      expect(a.field instanceof byte).assertTrue()
      expect(a.field).assertEqual(5)
      a.field = 4
      expect(a.field instanceof byte).assertTrue()
      expect(a.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_1347
     * @tc.name      testFieldInit1347
     * @tc.desc      Checking the implementation of interface readonly field.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit1347", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F1347 = {field: 5}
      expect(a.field instanceof short).assertTrue()
      expect(a.field).assertEqual(5)
      a.field = 4
      expect(a.field instanceof short).assertTrue()
      expect(a.field).assertEqual(4)
    })
