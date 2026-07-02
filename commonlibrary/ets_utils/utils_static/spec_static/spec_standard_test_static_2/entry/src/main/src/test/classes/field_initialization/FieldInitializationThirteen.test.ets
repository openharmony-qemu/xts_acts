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

export default function FieldInitializationThirteenTest(): void {
  describe("FieldInitializationThirteenTest", () => {
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
     * @tc.number    SUB_FIELD_INIT_THIRTEEN_0100
     * @tc.name      testFieldInitThirteen0001
     * @tc.desc      Checking the implementation of interface field.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitThirteen0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F1288 = {field: 7.3}
      expect(a.field instanceof double).assertTrue()
      expect(a.field).assertEqual(7.3)
      a.field = 4
      expect(a.field instanceof double).assertTrue()
      expect(a.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_THIRTEEN_0200
     * @tc.name      testFieldInitThirteen0002
     * @tc.desc      Checking the implementation of interface field.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitThirteen0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F1289 = {field: 5}
      expect(a.field instanceof number).assertTrue()
      expect(a.field).assertEqual(5)
      a.field = 4
      expect(a.field instanceof number).assertTrue()
      expect(a.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_THIRTEEN_0300
     * @tc.name      testFieldInitThirteen0003
     * @tc.desc      Checking the implementation of interface field.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitThirteen0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F1290 = {field: 7.3f}
      expect(a.field instanceof float).assertTrue()
      expect(a.field).assertEqual(7.3f)
      a.field = 4.5f
      expect(a.field instanceof float).assertTrue()
      expect(a.field).assertEqual(4.5f)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_THIRTEEN_0400
     * @tc.name      testFieldInitThirteen0004
     * @tc.desc      Checking the implementation of interface field.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitThirteen0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F1291 = {field: 5n}
      expect(a.field instanceof bigint).assertTrue()
      expect(a.field).assertEqual(5n)
      a.field = 4n
      expect(a.field instanceof bigint).assertTrue()
      expect(a.field).assertEqual(4n)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_THIRTEEN_0500
     * @tc.name      testFieldInitThirteen0005
     * @tc.desc      Checking the implementation of interface field.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitThirteen0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F1292 = {field: "efg"}
      expect(a.field instanceof string).assertTrue()
      expect(a.field).assertEqual("efg")
      a.field = "abc"
      expect(a.field instanceof string).assertTrue()
      expect(a.field).assertEqual("abc")
    })

    /**
     * @tc.number    SUB_FIELD_INIT_THIRTEEN_0600
     * @tc.name      testFieldInitThirteen0006
     * @tc.desc      Checking the implementation of interface field.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitThirteen0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F1293 = {field: c'b'}
      expect(a.field instanceof char).assertTrue()
      expect(a.field).assertEqual(c'b')
      a.field = c'a'
      expect(a.field instanceof char).assertTrue()
      expect(a.field).assertEqual(c'a')
    })

    /**
     * @tc.number    SUB_FIELD_INIT_THIRTEEN_0700
     * @tc.name      testFieldInitThirteen0007
     * @tc.desc      Checking the implementation of interface field.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitThirteen0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F1294 = {field: true}
      expect(a.field instanceof boolean).assertTrue()
      expect(a.field).assertEqual(true)
      a.field = false
      expect(a.field instanceof boolean).assertTrue()
      expect(a.field).assertEqual(false)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_THIRTEEN_0800
     * @tc.name      testFieldInitThirteen0008
     * @tc.desc      Checking the implementation of interface field.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitThirteen0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F1295 = {field: 5}
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(5)
      a.field = 4
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_THIRTEEN_0900
     * @tc.name      testFieldInitThirteen0009
     * @tc.desc      Checking the implementation of interface field.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitThirteen0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F1296 = {field: 5}
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(5)
      a.field = 4
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_THIRTEEN_1000
     * @tc.name      testFieldInitThirteen0010
     * @tc.desc      Checking the implementation of interface field.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitThirteen0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_THIRTEEN_1100
     * @tc.name      testFieldInitThirteen0011
     * @tc.desc      Checking the implementation of interface field.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitThirteen0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_THIRTEEN_1200
     * @tc.name      testFieldInitThirteen0012
     * @tc.desc      Checking the implementation of interface field.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitThirteen0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_THIRTEEN_1300
     * @tc.name      testFieldInitThirteen0013
     * @tc.desc      Checking the implementation of interface field.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitThirteen0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_THIRTEEN_1400
     * @tc.name      testFieldInitThirteen0014
     * @tc.desc      Checking the implementation of interface readonly field.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitThirteen0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F1302 = new A_F1302()
      expect(a.field instanceof long).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof long).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_THIRTEEN_1500
     * @tc.name      testFieldInitThirteen0015
     * @tc.desc      Checking the implementation of interface readonly field.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitThirteen0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F1303 = new A_F1303()
      expect(a.field instanceof int).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof int).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_THIRTEEN_1600
     * @tc.name      testFieldInitThirteen0016
     * @tc.desc      Checking the implementation of interface readonly field.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitThirteen0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F1304 = new A_F1304()
      expect(a.field instanceof byte).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof byte).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_THIRTEEN_1700
     * @tc.name      testFieldInitThirteen0017
     * @tc.desc      Checking the implementation of interface readonly field.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitThirteen0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F1305 = new A_F1305()
      expect(a.field instanceof short).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof short).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_THIRTEEN_1800
     * @tc.name      testFieldInitThirteen0018
     * @tc.desc      Checking the implementation of interface readonly field.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitThirteen0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F1306 = new A_F1306()
      expect(a.field instanceof double).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 7.3
      expect(a.field instanceof double).assertTrue()
      expect(a.field).assertEqual(7.3)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_THIRTEEN_1900
     * @tc.name      testFieldInitThirteen0019
     * @tc.desc      Checking the implementation of interface readonly field.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitThirteen0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F1307 = new A_F1307()
      expect(a.field instanceof number).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof number).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_THIRTEEN_2000
     * @tc.name      testFieldInitThirteen0020
     * @tc.desc      Checking the implementation of interface readonly field.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitThirteen0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F1308 = new A_F1308()
      expect(a.field instanceof float).assertTrue()
      expect(a.field).assertEqual(4.5f)
      a.field = 7.3f
      expect(a.field instanceof float).assertTrue()
      expect(a.field).assertEqual(7.3f)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_THIRTEEN_2100
     * @tc.name      testFieldInitThirteen0021
     * @tc.desc      Checking the implementation of interface readonly field.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitThirteen0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F1309 = new A_F1309()
      expect(a.field instanceof bigint).assertTrue()
      expect(a.field).assertEqual(4n)
      a.field = 5n
      expect(a.field instanceof bigint).assertTrue()
      expect(a.field).assertEqual(5n)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_THIRTEEN_2200
     * @tc.name      testFieldInitThirteen0022
     * @tc.desc      Checking the implementation of interface readonly field.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitThirteen0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F1310 = new A_F1310()
      expect(a.field instanceof string).assertTrue()
      expect(a.field).assertEqual("abc")
      a.field = "efg"
      expect(a.field instanceof string).assertTrue()
      expect(a.field).assertEqual("efg")
    })

    /**
     * @tc.number    SUB_FIELD_INIT_THIRTEEN_2300
     * @tc.name      testFieldInitThirteen0023
     * @tc.desc      Checking the implementation of interface readonly field.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitThirteen0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F1311 = new A_F1311()
      expect(a.field instanceof char).assertTrue()
      expect(a.field).assertEqual(c'a')
      a.field = c'b'
      expect(a.field instanceof char).assertTrue()
      expect(a.field).assertEqual(c'b')
    })

    /**
     * @tc.number    SUB_FIELD_INIT_THIRTEEN_2400
     * @tc.name      testFieldInitThirteen0024
     * @tc.desc      Checking the implementation of interface readonly field.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitThirteen0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F1312 = new A_F1312()
      expect(a.field instanceof boolean).assertTrue()
      expect(a.field).assertEqual(false)
      a.field = true
      expect(a.field instanceof boolean).assertTrue()
      expect(a.field).assertEqual(true)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_THIRTEEN_2500
     * @tc.name      testFieldInitThirteen0025
     * @tc.desc      Checking the implementation of interface readonly field.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitThirteen0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F1313 = new A_F1313()
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_THIRTEEN_2600
     * @tc.name      testFieldInitThirteen0026
     * @tc.desc      Checking the implementation of interface readonly field.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitThirteen0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F1314 = new A_F1314()
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_THIRTEEN_2700
     * @tc.name      testFieldInitThirteen0027
     * @tc.desc      Checking the implementation of interface readonly field.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitThirteen0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F1316 = new A_F1316()
      expect(a.field instanceof long).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof long).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_THIRTEEN_2800
     * @tc.name      testFieldInitThirteen0028
     * @tc.desc      Checking the implementation of interface readonly field.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitThirteen0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F1317 = new A_F1317()
      expect(a.field instanceof int).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof int).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_THIRTEEN_2900
     * @tc.name      testFieldInitThirteen0029
     * @tc.desc      Checking the implementation of interface readonly field.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitThirteen0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F1318 = new A_F1318()
      expect(a.field instanceof byte).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof byte).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_THIRTEEN_3000
     * @tc.name      testFieldInitThirteen0030
     * @tc.desc      Checking the implementation of interface readonly field.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitThirteen0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F1319 = new A_F1319()
      expect(a.field instanceof short).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof short).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_THIRTEEN_3100
     * @tc.name      testFieldInitThirteen0031
     * @tc.desc      Checking the implementation of interface readonly field.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitThirteen0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F1320 = new A_F1320()
      expect(a.field instanceof double).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 7.3
      expect(a.field instanceof double).assertTrue()
      expect(a.field).assertEqual(7.3)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_THIRTEEN_3200
     * @tc.name      testFieldInitThirteen0032
     * @tc.desc      Checking the implementation of interface readonly field.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitThirteen0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F1321 = new A_F1321()
      expect(a.field instanceof number).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof number).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_THIRTEEN_3300
     * @tc.name      testFieldInitThirteen0033
     * @tc.desc      Checking the implementation of interface readonly field.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitThirteen0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F1322 = new A_F1322()
      expect(a.field instanceof float).assertTrue()
      expect(a.field).assertEqual(4.5f)
      a.field = 7.3f
      expect(a.field instanceof float).assertTrue()
      expect(a.field).assertEqual(7.3f)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_THIRTEEN_3400
     * @tc.name      testFieldInitThirteen0034
     * @tc.desc      Checking the implementation of interface readonly field.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitThirteen0034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F1323 = new A_F1323()
      expect(a.field instanceof bigint).assertTrue()
      expect(a.field).assertEqual(4n)
      a.field = 5n
      expect(a.field instanceof bigint).assertTrue()
      expect(a.field).assertEqual(5n)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_THIRTEEN_3500
     * @tc.name      testFieldInitThirteen0035
     * @tc.desc      Checking the implementation of interface readonly field.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitThirteen0035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F1324 = new A_F1324()
      expect(a.field instanceof string).assertTrue()
      expect(a.field).assertEqual("abc")
      a.field = "efg"
      expect(a.field instanceof string).assertTrue()
      expect(a.field).assertEqual("efg")
    })

    /**
     * @tc.number    SUB_FIELD_INIT_THIRTEEN_3600
     * @tc.name      testFieldInitThirteen0036
     * @tc.desc      Checking the implementation of interface readonly field.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitThirteen0036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F1325 = new A_F1325()
      expect(a.field instanceof char).assertTrue()
      expect(a.field).assertEqual(c'a')
      a.field = c'b'
      expect(a.field instanceof char).assertTrue()
      expect(a.field).assertEqual(c'b')
    })

    /**
     * @tc.number    SUB_FIELD_INIT_THIRTEEN_3700
     * @tc.name      testFieldInitThirteen0037
     * @tc.desc      Checking the implementation of interface readonly field.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitThirteen0037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F1326 = new A_F1326()
      expect(a.field instanceof boolean).assertTrue()
      expect(a.field).assertEqual(false)
      a.field = true
      expect(a.field instanceof boolean).assertTrue()
      expect(a.field).assertEqual(true)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_THIRTEEN_3800
     * @tc.name      testFieldInitThirteen0038
     * @tc.desc      Checking the implementation of interface readonly field.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitThirteen0038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F1327 = new A_F1327()
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_THIRTEEN_3900
     * @tc.name      testFieldInitThirteen0039
     * @tc.desc      Checking the implementation of interface readonly field.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitThirteen0039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F1328 = new A_F1328()
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_THIRTEEN_4000
     * @tc.name      testFieldInitThirteen0040
     * @tc.desc      Checking the implementation of interface readonly field.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitThirteen0040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F1330 = {field: 5}
      expect(a.field instanceof long).assertTrue()
      expect(a.field).assertEqual(5)
      a.field = 4
      expect(a.field instanceof long).assertTrue()
      expect(a.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_THIRTEEN_4100
     * @tc.name      testFieldInitThirteen0041
     * @tc.desc      Checking the implementation of interface readonly field.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitThirteen0041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F1331 = {field: 5}
      expect(a.field instanceof int).assertTrue()
      expect(a.field).assertEqual(5)
      a.field = 4
      expect(a.field instanceof int).assertTrue()
      expect(a.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_THIRTEEN_4200
     * @tc.name      testFieldInitThirteen0042
     * @tc.desc      Checking the implementation of interface readonly field.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitThirteen0042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F1332 = {field: 5}
      expect(a.field instanceof byte).assertTrue()
      expect(a.field).assertEqual(5)
      a.field = 4
      expect(a.field instanceof byte).assertTrue()
      expect(a.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_THIRTEEN_4300
     * @tc.name      testFieldInitThirteen0043
     * @tc.desc      Checking the implementation of interface readonly field.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitThirteen0043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F1333 = {field: 5}
      expect(a.field instanceof short).assertTrue()
      expect(a.field).assertEqual(5)
      a.field = 4
      expect(a.field instanceof short).assertTrue()
      expect(a.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_THIRTEEN_4400
     * @tc.name      testFieldInitThirteen0044
     * @tc.desc      Checking the implementation of interface readonly field.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitThirteen0044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F1334 = {field: 7.3}
      expect(a.field instanceof double).assertTrue()
      expect(a.field).assertEqual(7.3)
      a.field = 4
      expect(a.field instanceof double).assertTrue()
      expect(a.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_THIRTEEN_4500
     * @tc.name      testFieldInitThirteen0045
     * @tc.desc      Checking the implementation of interface readonly field.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitThirteen0045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F1335 = {field: 5}
      expect(a.field instanceof number).assertTrue()
      expect(a.field).assertEqual(5)
      a.field = 4
      expect(a.field instanceof number).assertTrue()
      expect(a.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_THIRTEEN_4600
     * @tc.name      testFieldInitThirteen0046
     * @tc.desc      Checking the implementation of interface readonly field.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitThirteen0046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F1336 = {field: 7.3f}
      expect(a.field instanceof float).assertTrue()
      expect(a.field).assertEqual(7.3f)
      a.field = 4.5f
      expect(a.field instanceof float).assertTrue()
      expect(a.field).assertEqual(4.5f)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_THIRTEEN_4700
     * @tc.name      testFieldInitThirteen0047
     * @tc.desc      Checking the implementation of interface readonly field.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitThirteen0047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F1337 = {field: 5n}
      expect(a.field instanceof bigint).assertTrue()
      expect(a.field).assertEqual(5n)
      a.field = 4n
      expect(a.field instanceof bigint).assertTrue()
      expect(a.field).assertEqual(4n)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_THIRTEEN_4800
     * @tc.name      testFieldInitThirteen0048
     * @tc.desc      Checking the implementation of interface readonly field.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitThirteen0048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F1338 = {field: "efg"}
      expect(a.field instanceof string).assertTrue()
      expect(a.field).assertEqual("efg")
      a.field = "abc"
      expect(a.field instanceof string).assertTrue()
      expect(a.field).assertEqual("abc")
    })

    /**
     * @tc.number    SUB_FIELD_INIT_THIRTEEN_4900
     * @tc.name      testFieldInitThirteen0049
     * @tc.desc      Checking the implementation of interface readonly field.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitThirteen0049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F1339 = {field: c'b'}
      expect(a.field instanceof char).assertTrue()
      expect(a.field).assertEqual(c'b')
      a.field = c'a'
      expect(a.field instanceof char).assertTrue()
      expect(a.field).assertEqual(c'a')
    })

    /**
     * @tc.number    SUB_FIELD_INIT_THIRTEEN_5000
     * @tc.name      testFieldInitThirteen0050
     * @tc.desc      Checking the implementation of interface readonly field.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitThirteen0050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F1340 = {field: true}
      expect(a.field instanceof boolean).assertTrue()
      expect(a.field).assertEqual(true)
      a.field = false
      expect(a.field instanceof boolean).assertTrue()
      expect(a.field).assertEqual(false)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_THIRTEEN_5100
     * @tc.name      testFieldInitThirteen0051
     * @tc.desc      Checking the implementation of interface readonly field.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitThirteen0051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F1341 = {field: 5}
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(5)
      a.field = 4
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_THIRTEEN_5200
     * @tc.name      testFieldInitThirteen0052
     * @tc.desc      Checking the implementation of interface readonly field.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitThirteen0052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F1342 = {field: 5}
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(5)
      a.field = 4
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_THIRTEEN_5300
     * @tc.name      testFieldInitThirteen0053
     * @tc.desc      Checking the implementation of interface readonly field.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitThirteen0053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F1344 = {field: 5}
      expect(a.field instanceof long).assertTrue()
      expect(a.field).assertEqual(5)
      a.field = 4
      expect(a.field instanceof long).assertTrue()
      expect(a.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_THIRTEEN_5400
     * @tc.name      testFieldInitThirteen0054
     * @tc.desc      Checking the implementation of interface readonly field.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitThirteen0054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F1345 = {field: 5}
      expect(a.field instanceof int).assertTrue()
      expect(a.field).assertEqual(5)
      a.field = 4
      expect(a.field instanceof int).assertTrue()
      expect(a.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_THIRTEEN_5500
     * @tc.name      testFieldInitThirteen0055
     * @tc.desc      Checking the implementation of interface readonly field.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitThirteen0055", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F1346 = {field: 5}
      expect(a.field instanceof byte).assertTrue()
      expect(a.field).assertEqual(5)
      a.field = 4
      expect(a.field instanceof byte).assertTrue()
      expect(a.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_THIRTEEN_5600
     * @tc.name      testFieldInitThirteen0056
     * @tc.desc      Checking the implementation of interface readonly field.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitThirteen0056", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F1347 = {field: 5}
      expect(a.field instanceof short).assertTrue()
      expect(a.field).assertEqual(5)
      a.field = 4
      expect(a.field instanceof short).assertTrue()
      expect(a.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_THIRTEEN_5700
     * @tc.name      testFieldInitThirteen0057
     * @tc.desc      Checking the implementation of interface readonly field.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitThirteen0057", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F1348 = {field: 7.3}
      expect(a.field instanceof double).assertTrue()
      expect(a.field).assertEqual(7.3)
      a.field = 4
      expect(a.field instanceof double).assertTrue()
      expect(a.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_THIRTEEN_5800
     * @tc.name      testFieldInitThirteen0058
     * @tc.desc      Checking the implementation of interface readonly field.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitThirteen0058", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F1349 = {field: 5}
      expect(a.field instanceof number).assertTrue()
      expect(a.field).assertEqual(5)
      a.field = 4
      expect(a.field instanceof number).assertTrue()
      expect(a.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_THIRTEEN_5900
     * @tc.name      testFieldInitThirteen0059
     * @tc.desc      Checking the implementation of interface readonly field.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitThirteen0059", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F1350 = {field: 7.3f}
      expect(a.field instanceof float).assertTrue()
      expect(a.field).assertEqual(7.3f)
      a.field = 4.5f
      expect(a.field instanceof float).assertTrue()
      expect(a.field).assertEqual(4.5f)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_THIRTEEN_6000
     * @tc.name      testFieldInitThirteen0060
     * @tc.desc      Checking the implementation of interface readonly field.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitThirteen0060", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F1351 = {field: 5n}
      expect(a.field instanceof bigint).assertTrue()
      expect(a.field).assertEqual(5n)
      a.field = 4n
      expect(a.field instanceof bigint).assertTrue()
      expect(a.field).assertEqual(4n)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_THIRTEEN_6100
     * @tc.name      testFieldInitThirteen0061
     * @tc.desc      Checking the implementation of interface readonly field.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitThirteen0061", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F1352 = {field: "efg"}
      expect(a.field instanceof string).assertTrue()
      expect(a.field).assertEqual("efg")
      a.field = "abc"
      expect(a.field instanceof string).assertTrue()
      expect(a.field).assertEqual("abc")
    })

    /**
     * @tc.number    SUB_FIELD_INIT_THIRTEEN_6200
     * @tc.name      testFieldInitThirteen0062
     * @tc.desc      Checking the implementation of interface readonly field.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitThirteen0062", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F1353 = {field: c'b'}
      expect(a.field instanceof char).assertTrue()
      expect(a.field).assertEqual(c'b')
      a.field = c'a'
      expect(a.field instanceof char).assertTrue()
      expect(a.field).assertEqual(c'a')
    })

    /**
     * @tc.number    SUB_FIELD_INIT_THIRTEEN_6300
     * @tc.name      testFieldInitThirteen0063
     * @tc.desc      Checking the implementation of interface readonly field.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitThirteen0063", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F1354 = {field: true}
      expect(a.field instanceof boolean).assertTrue()
      expect(a.field).assertEqual(true)
      a.field = false
      expect(a.field instanceof boolean).assertTrue()
      expect(a.field).assertEqual(false)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_THIRTEEN_6400
     * @tc.name      testFieldInitThirteen0064
     * @tc.desc      Checking the implementation of interface readonly field.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitThirteen0064", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F1355 = {field: 5}
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(5)
      a.field = 4
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_THIRTEEN_6500
     * @tc.name      testFieldInitThirteen0065
     * @tc.desc      Checking the implementation of interface readonly field.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitThirteen0065", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F1356 = {field: 5}
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(5)
      a.field = 4
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_THIRTEEN_6600
     * @tc.name      testFieldInitThirteen0066
     * @tc.desc      Checking the implementation of interface readonly field.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitThirteen0066", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F1358 = new A_F1358()
      expect(a.field instanceof C_F1358).assertTrue()
      expect(a.field.data instanceof int).assertTrue()
      expect(a.field.data).assertEqual(4)
      a.field = {data: 5}
      expect(a.field instanceof C_F1358).assertTrue()
      expect(a.field.data instanceof int).assertTrue()
      expect(a.field.data).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_THIRTEEN_6700
     * @tc.name      testFieldInitThirteen0067
     * @tc.desc      Checking the implementation of interface readonly field.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitThirteen0067", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F1359 = new A_F1359()
      expect(a.field instanceof C_F1359).assertTrue()
      expect(a.field.data instanceof int).assertTrue()
      expect(a.field.data).assertEqual(4)
      a.field = {data: 5}
      expect(a.field instanceof C_F1359).assertTrue()
      expect(a.field.data instanceof int).assertTrue()
      expect(a.field.data).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_THIRTEEN_6800
     * @tc.name      testFieldInitThirteen0068
     * @tc.desc      Checking the implementation of interface readonly field.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitThirteen0068", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F1360 = {field: {data: 4}}
      expect(a.field instanceof C_F1360).assertTrue()
      expect(a.field.data instanceof int).assertTrue()
      expect(a.field.data).assertEqual(4)
      a.field = {data: 5}
      expect(a.field instanceof C_F1360).assertTrue()
      expect(a.field.data instanceof int).assertTrue()
      expect(a.field.data).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_THIRTEEN_6900
     * @tc.name      testFieldInitThirteen0069
     * @tc.desc      Checking the implementation of interface readonly field.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitThirteen0069", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F1361 = {field: {data: 4}}
      expect(a.field instanceof C_F1361).assertTrue()
      expect(a.field.data instanceof int).assertTrue()
      expect(a.field.data).assertEqual(4)
      a.field = {data: 5}
      expect(a.field instanceof C_F1361).assertTrue()
      expect(a.field.data instanceof int).assertTrue()
      expect(a.field.data).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_THIRTEEN_7000
     * @tc.name      testFieldInitThirteen0070
     * @tc.desc      Checking creation interface object with field.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitThirteen0070", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: I_F1362 = {field: 4}
      expect(a.field instanceof long).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof long).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_THIRTEEN_7100
     * @tc.name      testFieldInitThirteen0071
     * @tc.desc      Checking creation interface object with field.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitThirteen0071", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: I_F1363 = {field: 4}
      expect(a.field instanceof int).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof int).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_THIRTEEN_7200
     * @tc.name      testFieldInitThirteen0072
     * @tc.desc      Checking creation interface object with field.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitThirteen0072", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: I_F1364 = {field: 4}
      expect(a.field instanceof byte).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof byte).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_THIRTEEN_7300
     * @tc.name      testFieldInitThirteen0073
     * @tc.desc      Checking creation interface object with field.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitThirteen0073", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: I_F1365 = {field: 4}
      expect(a.field instanceof short).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof short).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_THIRTEEN_7400
     * @tc.name      testFieldInitThirteen0074
     * @tc.desc      Checking creation interface object with field.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitThirteen0074", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: I_F1366 = {field: 4}
      expect(a.field instanceof double).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 7.3
      expect(a.field instanceof double).assertTrue()
      expect(a.field).assertEqual(7.3)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_THIRTEEN_7500
     * @tc.name      testFieldInitThirteen0075
     * @tc.desc      Checking creation interface object with field.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitThirteen0075", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: I_F1367 = {field: 4}
      expect(a.field instanceof number).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof number).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_THIRTEEN_7600
     * @tc.name      testFieldInitThirteen0076
     * @tc.desc      Checking creation interface object with field.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitThirteen0076", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: I_F1368 = {field: 4.5f}
      expect(a.field instanceof float).assertTrue()
      expect(a.field).assertEqual(4.5f)
      a.field = 7.3f
      expect(a.field instanceof float).assertTrue()
      expect(a.field).assertEqual(7.3f)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_THIRTEEN_7700
     * @tc.name      testFieldInitThirteen0077
     * @tc.desc      Checking creation interface object with field.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitThirteen0077", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: I_F1369 = {field: 4n}
      expect(a.field instanceof bigint).assertTrue()
      expect(a.field).assertEqual(4n)
      a.field = 5n
      expect(a.field instanceof bigint).assertTrue()
      expect(a.field).assertEqual(5n)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_THIRTEEN_7800
     * @tc.name      testFieldInitThirteen0078
     * @tc.desc      Checking creation interface object with field.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitThirteen0078", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: I_F1370 = {field: "abc"}
      expect(a.field instanceof string).assertTrue()
      expect(a.field).assertEqual("abc")
      a.field = "efg"
      expect(a.field instanceof string).assertTrue()
      expect(a.field).assertEqual("efg")
    })

    /**
     * @tc.number    SUB_FIELD_INIT_THIRTEEN_7900
     * @tc.name      testFieldInitThirteen0079
     * @tc.desc      Checking creation interface object with field.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitThirteen0079", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: I_F1371 = {field: c'a'}
      expect(a.field instanceof char).assertTrue()
      expect(a.field).assertEqual(c'a')
      a.field = c'b'
      expect(a.field instanceof char).assertTrue()
      expect(a.field).assertEqual(c'b')
    })

    /**
     * @tc.number    SUB_FIELD_INIT_THIRTEEN_8000
     * @tc.name      testFieldInitThirteen0080
     * @tc.desc      Checking creation interface object with field.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitThirteen0080", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: I_F1372 = {field: false}
      expect(a.field instanceof boolean).assertTrue()
      expect(a.field).assertEqual(false)
      a.field = true
      expect(a.field instanceof boolean).assertTrue()
      expect(a.field).assertEqual(true)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_THIRTEEN_8100
     * @tc.name      testFieldInitThirteen0081
     * @tc.desc      Checking creation interface object with field.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitThirteen0081", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: I_F1373 = {field: 4}
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_THIRTEEN_8200
     * @tc.name      testFieldInitThirteen0082
     * @tc.desc      Checking creation interface object with field.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitThirteen0082", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: I_F1374 = {field: 4}
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_THIRTEEN_8300
     * @tc.name      testFieldInitThirteen0083
     * @tc.desc      Checking the implementation of interface in namespace.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitThirteen0083", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: ns.A_F1376 = new ns.A_F1376()
      expect(a.field instanceof long).assertTrue()
      expect(a.field).assertEqual(4)
      a.foo()
      expect(a.field instanceof long).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_THIRTEEN_8400
     * @tc.name      testFieldInitThirteen0084
     * @tc.desc      Checking the implementation of interface in namespace.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitThirteen0084", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: ns.A_F1377 = new ns.A_F1377()
      expect(a.field instanceof int).assertTrue()
      expect(a.field).assertEqual(4)
      a.foo()
      expect(a.field instanceof int).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_THIRTEEN_8500
     * @tc.name      testFieldInitThirteen0085
     * @tc.desc      Checking the implementation of interface in namespace.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitThirteen0085", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: ns.A_F1378 = new ns.A_F1378()
      expect(a.field instanceof byte).assertTrue()
      expect(a.field).assertEqual(4)
      a.foo()
      expect(a.field instanceof byte).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_THIRTEEN_8600
     * @tc.name      testFieldInitThirteen0086
     * @tc.desc      Checking the implementation of interface in namespace.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitThirteen0086", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: ns.A_F1379 = new ns.A_F1379()
      expect(a.field instanceof short).assertTrue()
      expect(a.field).assertEqual(4)
      a.foo()
      expect(a.field instanceof short).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_THIRTEEN_8700
     * @tc.name      testFieldInitThirteen0087
     * @tc.desc      Checking the implementation of interface in namespace.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitThirteen0087", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: ns.A_F1380 = new ns.A_F1380()
      expect(a.field instanceof double).assertTrue()
      expect(a.field).assertEqual(4)
      a.foo()
      expect(a.field instanceof double).assertTrue()
      expect(a.field).assertEqual(7.3)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_THIRTEEN_8800
     * @tc.name      testFieldInitThirteen0088
     * @tc.desc      Checking the implementation of interface in namespace.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitThirteen0088", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: ns.A_F1381 = new ns.A_F1381()
      expect(a.field instanceof number).assertTrue()
      expect(a.field).assertEqual(4)
      a.foo()
      expect(a.field instanceof number).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_THIRTEEN_8900
     * @tc.name      testFieldInitThirteen0089
     * @tc.desc      Checking the implementation of interface in namespace.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitThirteen0089", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: ns.A_F1382 = new ns.A_F1382()
      expect(a.field instanceof float).assertTrue()
      expect(a.field).assertEqual(4.5f)
      a.foo()
      expect(a.field instanceof float).assertTrue()
      expect(a.field).assertEqual(7.3f)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_THIRTEEN_9000
     * @tc.name      testFieldInitThirteen0090
     * @tc.desc      Checking the implementation of interface in namespace.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitThirteen0090", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: ns.A_F1383 = new ns.A_F1383()
      expect(a.field instanceof bigint).assertTrue()
      expect(a.field).assertEqual(4n)
      a.foo()
      expect(a.field instanceof bigint).assertTrue()
      expect(a.field).assertEqual(5n)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_THIRTEEN_9100
     * @tc.name      testFieldInitThirteen0091
     * @tc.desc      Checking the implementation of interface in namespace.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitThirteen0091", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: ns.A_F1384 = new ns.A_F1384()
      expect(a.field instanceof string).assertTrue()
      expect(a.field).assertEqual("abc")
      a.foo()
      expect(a.field instanceof string).assertTrue()
      expect(a.field).assertEqual("efg")
    })

    /**
     * @tc.number    SUB_FIELD_INIT_THIRTEEN_9200
     * @tc.name      testFieldInitThirteen0092
     * @tc.desc      Checking the implementation of interface in namespace.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitThirteen0092", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: ns.A_F1385 = new ns.A_F1385()
      expect(a.field instanceof char).assertTrue()
      expect(a.field).assertEqual(c'a')
      a.foo()
      expect(a.field instanceof char).assertTrue()
      expect(a.field).assertEqual(c'b')
    })

    /**
     * @tc.number    SUB_FIELD_INIT_THIRTEEN_9300
     * @tc.name      testFieldInitThirteen0093
     * @tc.desc      Checking the implementation of interface in namespace.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitThirteen0093", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: ns.A_F1386 = new ns.A_F1386()
      expect(a.field instanceof boolean).assertTrue()
      expect(a.field).assertEqual(false)
      a.foo()
      expect(a.field instanceof boolean).assertTrue()
      expect(a.field).assertEqual(true)
    })
  })
}
