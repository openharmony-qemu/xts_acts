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


function waitForCompletion<T>(fn: () => T): T {
  return fn()
}

class A_F100 {
  field!: string
}

class A_F101 {
  field!: char
}

class A_F102 {
  field!: boolean
}

class A_F103 {
  field!: Object
}

class A_F104 {
  field!: long
}

class A_F105 {
  field!: int
}

class A_F106 {
  field!: byte
}

class A_F107 {
  field!: short
}

class A_F108 {
  field!: double
}

class A_F109 {
  field!: number
}

class A_F110 {
  field!: float
}

class A_F111 {
  field!: bigint
}

class A_F112 {
  field!: string
}

class A_F113 {
  field!: char
}

class A_F114 {
  field!: boolean
}

class A_F115 {
  field!: Object
}

class C_F116 {data!: int}
class A_F116 {
  field!: C_F116
}

class C_F117 {data!: int}
class A_F117 {
  field!: C_F117
}

class Animal_F118 {
  name: string = ""
}
class Dog_F118 extends Animal_F118 {
  constructor () {
    super()
    this.name = "dog"
  }
}
class Cat_F118 extends Animal_F118 {
  constructor () {
    super()
    this.name = "cat"
  }
}
class C_F118 {
  field!: Animal_F118
}

class A_F119 {
  v: int
  constructor(v: int = 0) {
    this.v = v
  }
}
class B_F119 extends A_F119 {
  constructor(v: int = 0) {
    super(-v)
  }
  field(): int {
    return 13
  }
}
type HandlerBInt_F119 = (a: B_F119, b: int) => A_F119
type HandlerAInt_F119 = (a: A_F119, b: int) => B_F119
const handlerAInt: HandlerAInt_F119 = (a: A_F119, b: int): B_F119 => {
  if (a instanceof B_F119){
    return new B_F119(a.field() + b)
  } else {
    return new B_F119(b)
  }
}
type HandlerA_F119 = (a: A_F119) => A_F119
const handlerA: HandlerA_F119 = (a: A_F119): A_F119 => {
  if (a instanceof B_F119){
    return new A_F119(a.field())
  } else {
    return new A_F119
  }
}
type HandlerNothing_F119 = () => B_F119
const handlerNothing: HandlerNothing_F119 = (): B_F119 => {
  return new B_F119(567)
}
class C_F119 {
  field!: HandlerBInt_F119
}

class A_F120 {
  field!: long
}
function foo_F120(a: A_F120): void {
  a.field = 5
}

class A_F121 {
  field!: int
}
function foo_F121(a: A_F121): void {
  a.field = 5
}

class A_F122 {
  field!: byte
}
function foo_F122(a: A_F122): void {
  a.field = 5
}

class A_F123 {
  field!: short
}
function foo_F123(a: A_F123): void {
  a.field = 5
}

class A_F124 {
  field!: double
}
function foo_F124(a: A_F124): void {
  a.field = 7.3
}

class A_F125 {
  field!: number
}
function foo_F125(a: A_F125): void {
  a.field = 5
}

class A_F126 {
  field!: float
}
function foo_F126(a: A_F126): void {
  a.field = 7.3f
}

class A_F127 {
  field!: bigint
}
function foo_F127(a: A_F127): void {
  a.field = 5n
}

class A_F128 {
  field!: string
}
function foo_F128(a: A_F128): void {
  a.field = "abc"
}

class A_F129 {
  field!: char
}
function foo_F129(a: A_F129): void {
  a.field = c'a'
}

class A_F130 {
  field!: boolean
}
function foo_F130(a: A_F130): void {
  a.field = false
}

class A_F131 {
  field!: Object
}
function foo_F131(a: A_F131): void {
  a.field = 5
}

class C_F132 {data!: int}
class A_F132 {
  field!: C_F132
}
function foo_F132(a: A_F132): void {
  a.field = {data: 5}
}

class A_F133 {
  field!: long
}
function foo_F133(fb: () => void): void {
  fb()
}

class A_F134 {
  field!: int
}
function foo_F134(fb: () => void): void {
  fb()
}

class A_F135 {
  field!: byte
}
function foo_F135(fb: () => void): void {
  fb()
}

class A_F136 {
  field!: short
}
function foo_F136(fb: () => void): void {
  fb()
}

class A_F137 {
  field!: double
}
function foo_F137(fb: () => void): void {
  fb()
}

class A_F138 {
  field!: number
}
function foo_F138(fb: () => void): void {
  fb()
}

class A_F139 {
  field!: float
}
function foo_F139(fb: () => void): void {
  fb()
}

class A_F140 {
  field!: bigint
}
function foo_F140(fb: () => void): void {
  fb()
}

class A_F141 {
  field!: string
}
function foo_F141(fb: () => void): void {
  fb()
}

class A_F142 {
  field!: char
}
function foo_F142(fb: () => void): void {
  fb()
}

class A_F143 {
  field!: boolean
}
function foo_F143(fb: () => void): void {
  fb()
}

class A_F144 {
  field!: Object
}
function foo_F144(fb: () => void): void {
  fb()
}

class C_F145 {data!: int}
class A_F145 {
  field!: C_F145
}
function foo_F145(fb: () => void): void {
  fb()
}

class A_F146 {
  field: Promise<long>
  async foo_F146(): Promise<long> {
    let v: long = 5
    return v
  }
  constructor() {
    this.field = this.foo_F146()
  }
}

class A_F147 {
  field: Promise<int>
  async foo_F147(): Promise<int> {
    let v: int = 5
    return v
  }
  constructor() {
    this.field = this.foo_F147()
  }
}

class A_F148 {
  field: Promise<byte>
  async foo_F148(): Promise<byte> {
    let v: byte = 5
    return v
  }
  constructor() {
    this.field = this.foo_F148()
  }
}

class A_F149 {
  field: Promise<short>
  async foo_F149(): Promise<short> {
    let v: short = 5
    return v
  }
  constructor() {
    this.field = this.foo_F149()
  }
}

class A_F150 {
  field: Promise<double>
  async foo_F150(): Promise<double> {
    let v: double = 7.3
    return v
  }
  constructor() {
    this.field = this.foo_F150()
  }
}

class A_F151 {
  field: Promise<number>
  async foo_F151(): Promise<number> {
    let v: number = 5
    return v
  }
  constructor() {
    this.field = this.foo_F151()
  }
}

class A_F152 {
  field: Promise<float>
  async foo_F152(): Promise<float> {
    let v: float = 7.3f
    return v
  }
  constructor() {
    this.field = this.foo_F152()
  }
}

class A_F153 {
  field: Promise<bigint>
  async foo_F153(): Promise<bigint> {
    let v: bigint = 5n
    return v
  }
  constructor() {
    this.field = this.foo_F153()
  }
}

class A_F154 {
  field: Promise<string>
  async foo_F154(): Promise<string> {
    let v: string = "abc"
    return v
  }
  constructor() {
    this.field = this.foo_F154()
  }
}

class A_F155 {
  field: Promise<char>
  async foo_F155(): Promise<char> {
    let v: char = c'a'
    return v
  }
  constructor() {
    this.field = this.foo_F155()
  }
}

class A_F156 {
  field: Promise<boolean>
  async foo_F156(): Promise<boolean> {
    let v: boolean = false
    return v
  }
  constructor() {
    this.field = this.foo_F156()
  }
}

class A_F157 {
  field: Promise<Object>
  async foo_F157(): Promise<Object> {
    let v: Object = 5
    return v
  }
  constructor() {
    this.field = this.foo_F157()
  }
}

class C_F158 {data!: int}
class A_F158 {
  field!: Promise<C_F158>
  async foo_F158(): Promise<C_F158> {
    let v: C_F158 = {data: 5}
    return v
  }
  constructor() {
    this.field = this.foo_F158()
  }
}

class A_F159 {
  field!: Promise<long>
  async foo_F159(): Promise<long> {
    let v: long = 5
    return v
  }
}

class A_F160 {
  field!: Promise<int>
  async foo_F160(): Promise<int> {
    let v: int = 5
    return v
  }
}

class A_F161 {
  field!: Promise<byte>
  async foo_F161(): Promise<byte> {
    let v: byte = 5
    return v
  }
}

class A_F162 {
  field!: Promise<short>
  async foo_F162(): Promise<short> {
    let v: short = 5
    return v
  }
}

class A_F163 {
  field!: Promise<double>
  async foo_F163(): Promise<double> {
    let v: double = 7.3
    return v
  }
}

class A_F164 {
  field!: Promise<number>
  async foo_F164(): Promise<number> {
    let v: number = 5
    return v
  }
}

class A_F165 {
  field!: Promise<float>
  async foo_F165(): Promise<float> {
    let v: float = 7.3f
    return v
  }
}

class A_F166 {
  field!: Promise<bigint>
  async foo_F166(): Promise<bigint> {
    let v: bigint = 5n
    return v
  }
}

class A_F167 {
  field!: Promise<string>
  async foo_F167(): Promise<string> {
    let v: string = "abc"
    return v
  }
}

class A_F168 {
  field!: Promise<char>
  async foo_F168(): Promise<char> {
    let v: char = c'a'
    return v
  }
}

class A_F169 {
  field!: Promise<boolean>
  async foo_F169(): Promise<boolean> {
    let v: boolean = false
    return v
  }
}

class A_F170 {
  field!: Promise<Object>
  async foo_F170(): Promise<Object> {
    let v: Object = 5
    return v
  }
}

class C_F171 {data!: int}
class A_F171 {
  field!: Promise<C_F171>
  async foo_F171(): Promise<C_F171> {
    let v: C_F171 = {data: 5}
    return v
  }
}

class A_F172 {
  field!: long
  async foo_F172(): Promise<void> {
    this.field = 5
  }
}

class A_F173 {
  field!: int
  async foo_F173(): Promise<void> {
    this.field = 5
  }
}

class A_F174 {
  field!: byte
  async foo_F174(): Promise<void> {
    this.field = 5
  }
}

class A_F175 {
  field!: short
  async foo_F175(): Promise<void> {
    this.field = 5
  }
}

class A_F176 {
  field!: double
  async foo_F176(): Promise<void> {
    this.field = 7.3
  }
}

class A_F177 {
  field!: number
  async foo_F177(): Promise<void> {
    this.field = 5
  }
}

class A_F178 {
  field!: float
  async foo_F178(): Promise<void> {
    this.field = 7.3f
  }
}

class A_F179 {
  field!: bigint
  async foo_F179(): Promise<void> {
    this.field = 5n
  }
}

class A_F180 {
  field!: string
  async foo_F180(): Promise<void> {
    this.field = "abc"
  }
}

class A_F181 {
  field!: char
  async foo_F181(): Promise<void> {
    this.field = c'a'
  }
}

class A_F182 {
  field!: boolean
  async foo_F182(): Promise<void> {
    this.field = false
  }
}

class A_F183 {
  field!: Object
  async foo_F183(): Promise<void> {
    this.field = 5
  }
}

class A_F184 {
  field!: long
  async foo_F184(): Promise<void> {
    this.field = 5
  }
}

class A_F185 {
  field!: int
  async foo_F185(): Promise<void> {
    this.field = 5
  }
}

class A_F186 {
  field!: byte
  async foo_F186(): Promise<void> {
    this.field = 5
  }
}

class A_F187 {
  field!: short
  async foo_F187(): Promise<void> {
    this.field = 5
  }
}

class A_F188 {
  field!: double
  async foo_F188(): Promise<void> {
    this.field = 7.3
  }
}

class A_F189 {
  field!: number
  async foo_F189(): Promise<void> {
    this.field = 5
  }
}

class A_F190 {
  field!: float
  async foo_F190(): Promise<void> {
    this.field = 7.3f
  }
}

class A_F191 {
  field!: bigint
  async foo_F191(): Promise<void> {
    this.field = 5n
  }
}

class A_F192 {
  field!: string
  async foo_F192(): Promise<void> {
    this.field = "abc"
  }
}

class A_F193 {
  field!: char
  async foo_F193(): Promise<void> {
    this.field = c'a'
  }
}

class A_F194 {
  field!: boolean
  async foo_F194(): Promise<void> {
    this.field = false
  }
}

class A_F195 {
  field!: Object
  async foo_F195(): Promise<void> {
    this.field = 5
  }
}

class C_F196 {data!: int}
class A_F196 {
  field!: C_F196
  async foo_F196(): Promise<void> {
    this.field = {data: 5}
  }
}

class C_F197 {data!: int}
class A_F197 {
  field!: C_F197
  async foo_F197(): Promise<void> {
    this.field = {data: 5}
  }
}

class A_F198 {
  field!: long
  async foo_F198(): Promise<void> {
    return new Promise<void> (
      (resolve) => {
        setTimeout(() => {
          this.field = 5
          resolve(undefined)
        }, 1)
      }
    )
  }
}

export default function FieldsLateInitOneTest(): void {
  describe("FieldsLateInitOneTest", () => {
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
     * @tc.number    SUB_FIELDS_LATE_INIT_ONE_0100
     * @tc.name      testFieldsLateInitOne0001
     * @tc.desc      Checking for initialization from outside of constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitOne0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F100 = new A_F100()
        a.field = "abc"
        expect(a.field instanceof string).assertTrue()
        expect(a.field).assertEqual("abc")
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_ONE_0200
     * @tc.name      testFieldsLateInitOne0002
     * @tc.desc      Checking for initialization from outside of constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitOne0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F101 = new A_F101()
        a.field = c'a'
        expect(a.field instanceof char).assertTrue()
        expect(a.field).assertEqual(c'a')
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_ONE_0300
     * @tc.name      testFieldsLateInitOne0003
     * @tc.desc      Checking for initialization from outside of constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitOne0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F102 = new A_F102()
        a.field = false
        expect(a.field instanceof boolean).assertTrue()
        expect(a.field).assertEqual(false)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_ONE_0400
     * @tc.name      testFieldsLateInitOne0004
     * @tc.desc      Checking for initialization from outside of constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitOne0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F103 = new A_F103()
        a.field = 5
        expect(a.field instanceof Object).assertTrue()
        expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_ONE_0500
     * @tc.name      testFieldsLateInitOne0005
     * @tc.desc      Checking for initialization from outside of constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitOne0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F104 = new A_F104()
        const lambda = () => {
      a.field = 5
        }
        lambda()
        expect(a.field instanceof long).assertTrue()
        expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_ONE_0600
     * @tc.name      testFieldsLateInitOne0006
     * @tc.desc      Checking for initialization from outside of constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitOne0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F105 = new A_F105()
        const lambda = () => {
      a.field = 5
        }
        lambda()
        expect(a.field instanceof int).assertTrue()
        expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_ONE_0700
     * @tc.name      testFieldsLateInitOne0007
     * @tc.desc      Checking for initialization from outside of constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitOne0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F106 = new A_F106()
        const lambda = () => {
      a.field = 5
        }
        lambda()
        expect(a.field instanceof byte).assertTrue()
        expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_ONE_0800
     * @tc.name      testFieldsLateInitOne0008
     * @tc.desc      Checking for initialization from outside of constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitOne0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F107 = new A_F107()
        const lambda = () => {
      a.field = 5
        }
        lambda()
        expect(a.field instanceof short).assertTrue()
        expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_ONE_0900
     * @tc.name      testFieldsLateInitOne0009
     * @tc.desc      Checking for initialization from outside of constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitOne0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F108 = new A_F108()
        const lambda = () => {
      a.field = 7.3
        }
        lambda()
        expect(a.field instanceof double).assertTrue()
        expect(a.field).assertEqual(7.3)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_ONE_1000
     * @tc.name      testFieldsLateInitOne0010
     * @tc.desc      Checking for initialization from outside of constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitOne0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F109 = new A_F109()
        const lambda = () => {
      a.field = 5
        }
        lambda()
        expect(a.field instanceof number).assertTrue()
        expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_ONE_1100
     * @tc.name      testFieldsLateInitOne0011
     * @tc.desc      Checking for initialization from outside of constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitOne0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F110 = new A_F110()
        const lambda = () => {
      a.field = 7.3f
        }
        lambda()
        expect(a.field instanceof float).assertTrue()
        expect(a.field).assertEqual(7.3f)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_ONE_1200
     * @tc.name      testFieldsLateInitOne0012
     * @tc.desc      Checking for initialization from outside of constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitOne0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F111 = new A_F111()
        const lambda = () => {
      a.field = 5n
        }
        lambda()
        expect(a.field instanceof bigint).assertTrue()
        expect(a.field).assertEqual(5n)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_ONE_1300
     * @tc.name      testFieldsLateInitOne0013
     * @tc.desc      Checking for initialization from outside of constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitOne0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F112 = new A_F112()
        const lambda = () => {
      a.field = "abc"
        }
        lambda()
        expect(a.field instanceof string).assertTrue()
        expect(a.field).assertEqual("abc")
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_ONE_1400
     * @tc.name      testFieldsLateInitOne0014
     * @tc.desc      Checking for initialization from outside of constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitOne0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F113 = new A_F113()
        const lambda = () => {
      a.field = c'a'
        }
        lambda()
        expect(a.field instanceof char).assertTrue()
        expect(a.field).assertEqual(c'a')
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_ONE_1500
     * @tc.name      testFieldsLateInitOne0015
     * @tc.desc      Checking for initialization from outside of constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitOne0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F114 = new A_F114()
        const lambda = () => {
      a.field = false
        }
        lambda()
        expect(a.field instanceof boolean).assertTrue()
        expect(a.field).assertEqual(false)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_ONE_1600
     * @tc.name      testFieldsLateInitOne0016
     * @tc.desc      Checking for initialization from outside of constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitOne0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F115 = new A_F115()
        const lambda = () => {
      a.field = 5
        }
        lambda()
        expect(a.field instanceof Object).assertTrue()
        expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_ONE_1700
     * @tc.name      testFieldsLateInitOne0017
     * @tc.desc      Checking for initialization from outside of constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitOne0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F116 = new A_F116()
        a.field = {data: 5}
        expect(a.field instanceof C_F116).assertTrue()
        expect(a.field.data instanceof int).assertTrue()
        expect(a.field.data).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_ONE_1800
     * @tc.name      testFieldsLateInitOne0018
     * @tc.desc      Checking for initialization from outside of constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitOne0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F117 = new A_F117()
        const lambda = () => {
      a.field = {data: 5}
        }
        lambda()
        expect(a.field instanceof C_F117).assertTrue()
        expect(a.field.data instanceof int).assertTrue()
        expect(a.field.data).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_ONE_1900
     * @tc.name      testFieldsLateInitOne0019
     * @tc.desc      Checking for initialization from outside of constructor with different covariant
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitOne0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: C_F118 = new C_F118()
        let d: C_F118 = new C_F118()
        let c: C_F118 = new C_F118()
        a.field = new Animal_F118()
        d.field = new Dog_F118()
        c.field = new Cat_F118()
        expect(a.field instanceof Animal_F118).assertTrue()
        expect(a.field.name).assertEqual("")
        expect(d.field instanceof Dog_F118).assertTrue()
        expect(d.field.name).assertEqual("dog")
        expect(c.field instanceof Cat_F118).assertTrue()
        expect(c.field.name).assertEqual("cat")
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_ONE_2000
     * @tc.name      testFieldsLateInitOne0020
     * @tc.desc      Checking for initialization from outside of constructor with different covariant
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitOne0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: C_F119 = new C_F119()
        let b: C_F119 = new C_F119()
        let c: C_F119 = new C_F119()
        a.field = handlerNothing
        b.field = handlerA
        c.field = handlerAInt
        expect(a.field instanceof HandlerNothing_F119).assertTrue()
        expect(a.field(new B_F119, 7).v).assertEqual(-567)
        expect(b.field instanceof HandlerA_F119).assertTrue()
        expect(b.field(new B_F119, 7).v).assertEqual(13)
        expect(c.field instanceof HandlerAInt_F119).assertTrue()
        expect(c.field(new B_F119, 7).v).assertEqual(-20)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_ONE_2100
     * @tc.name      testFieldsLateInitOne0021
     * @tc.desc      Checking for initialization from function call.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitOne0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F120 = new A_F120()
        foo_F120(a)
        expect(a.field instanceof long).assertTrue()
        expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_ONE_2200
     * @tc.name      testFieldsLateInitOne0022
     * @tc.desc      Checking for initialization from function call.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitOne0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F121 = new A_F121()
        foo_F121(a)
        expect(a.field instanceof int).assertTrue()
        expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_ONE_2300
     * @tc.name      testFieldsLateInitOne0023
     * @tc.desc      Checking for initialization from function call.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitOne0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F122 = new A_F122()
        foo_F122(a)
        expect(a.field instanceof byte).assertTrue()
        expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_ONE_2400
     * @tc.name      testFieldsLateInitOne0024
     * @tc.desc      Checking for initialization from function call.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitOne0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F123 = new A_F123()
        foo_F123(a)
        expect(a.field instanceof short).assertTrue()
        expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_ONE_2500
     * @tc.name      testFieldsLateInitOne0025
     * @tc.desc      Checking for initialization from function call.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitOne0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F124 = new A_F124()
        foo_F124(a)
        expect(a.field instanceof double).assertTrue()
        expect(a.field).assertEqual(7.3)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_ONE_2600
     * @tc.name      testFieldsLateInitOne0026
     * @tc.desc      Checking for initialization from function call.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitOne0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F125 = new A_F125()
        foo_F125(a)
        expect(a.field instanceof number).assertTrue()
        expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_ONE_2700
     * @tc.name      testFieldsLateInitOne0027
     * @tc.desc      Checking for initialization from function call.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitOne0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F126 = new A_F126()
        foo_F126(a)
        expect(a.field instanceof float).assertTrue()
        expect(a.field).assertEqual(7.3f)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_ONE_2800
     * @tc.name      testFieldsLateInitOne0028
     * @tc.desc      Checking for initialization from function call.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitOne0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F127 = new A_F127()
        foo_F127(a)
        expect(a.field instanceof bigint).assertTrue()
        expect(a.field).assertEqual(5n)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_ONE_2900
     * @tc.name      testFieldsLateInitOne0029
     * @tc.desc      Checking for initialization from function call.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitOne0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F128 = new A_F128()
        foo_F128(a)
        expect(a.field instanceof string).assertTrue()
        expect(a.field).assertEqual("abc")
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_ONE_3000
     * @tc.name      testFieldsLateInitOne0030
     * @tc.desc      Checking for initialization from function call.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitOne0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F129 = new A_F129()
        foo_F129(a)
        expect(a.field instanceof char).assertTrue()
        expect(a.field).assertEqual(c'a')
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_ONE_3100
     * @tc.name      testFieldsLateInitOne0031
     * @tc.desc      Checking for initialization from function call.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitOne0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F130 = new A_F130()
        foo_F130(a)
        expect(a.field instanceof boolean).assertTrue()
        expect(a.field).assertEqual(false)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_ONE_3200
     * @tc.name      testFieldsLateInitOne0032
     * @tc.desc      Checking for initialization from function call.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitOne0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F131 = new A_F131()
        foo_F131(a)
        expect(a.field instanceof Object).assertTrue()
        expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_ONE_3300
     * @tc.name      testFieldsLateInitOne0033
     * @tc.desc      Checking for initialization from function call.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitOne0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F132 = new A_F132()
        foo_F132(a)
        expect(a.field instanceof C_F132).assertTrue()
        expect(a.field.data instanceof int).assertTrue()
        expect(a.field.data).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_ONE_3400
     * @tc.name      testFieldsLateInitOne0034
     * @tc.desc      Checking for initialization from function call with object captured by lambda.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitOne0034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F133 = new A_F133()
        const lambda = () => {
      a.field = 5
        }
        foo_F133(lambda)
        expect(a.field instanceof long).assertTrue()
        expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_ONE_3500
     * @tc.name      testFieldsLateInitOne0035
     * @tc.desc      Checking for initialization from function call with object captured by lambda.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitOne0035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F134 = new A_F134()
        const lambda = () => {
      a.field = 5
        }
        foo_F134(lambda)
        expect(a.field instanceof int).assertTrue()
        expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_ONE_3600
     * @tc.name      testFieldsLateInitOne0036
     * @tc.desc      Checking for initialization from function call with object captured by lambda.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitOne0036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F135 = new A_F135()
        const lambda = () => {
      a.field = 5
        }
        foo_F135(lambda)
        expect(a.field instanceof byte).assertTrue()
        expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_ONE_3700
     * @tc.name      testFieldsLateInitOne0037
     * @tc.desc      Checking for initialization from function call with object captured by lambda.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitOne0037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F136 = new A_F136()
        const lambda = () => {
      a.field = 5
        }
        foo_F136(lambda)
        expect(a.field instanceof short).assertTrue()
        expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_ONE_3800
     * @tc.name      testFieldsLateInitOne0038
     * @tc.desc      Checking for initialization from function call with object captured by lambda.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitOne0038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F137 = new A_F137()
        const lambda = () => {
      a.field = 7.3
        }
        foo_F137(lambda)
        expect(a.field instanceof double).assertTrue()
        expect(a.field).assertEqual(7.3)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_ONE_3900
     * @tc.name      testFieldsLateInitOne0039
     * @tc.desc      Checking for initialization from function call with object captured by lambda.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitOne0039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F138 = new A_F138()
        const lambda = () => {
      a.field = 5
        }
        foo_F138(lambda)
        expect(a.field instanceof number).assertTrue()
        expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_ONE_4000
     * @tc.name      testFieldsLateInitOne0040
     * @tc.desc      Checking for initialization from function call with object captured by lambda.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitOne0040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F139 = new A_F139()
        const lambda = () => {
      a.field = 7.3f
        }
        foo_F139(lambda)
        expect(a.field instanceof float).assertTrue()
        expect(a.field).assertEqual(7.3f)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_ONE_4100
     * @tc.name      testFieldsLateInitOne0041
     * @tc.desc      Checking for initialization from function call with object captured by lambda.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitOne0041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F140 = new A_F140()
        const lambda = () => {
      a.field = 5n
        }
        foo_F140(lambda)
        expect(a.field instanceof bigint).assertTrue()
        expect(a.field).assertEqual(5n)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_ONE_4200
     * @tc.name      testFieldsLateInitOne0042
     * @tc.desc      Checking for initialization from function call with object captured by lambda.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitOne0042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F141 = new A_F141()
        const lambda = () => {
      a.field = "abc"
        }
        foo_F141(lambda)
        expect(a.field instanceof string).assertTrue()
        expect(a.field).assertEqual("abc")
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_ONE_4300
     * @tc.name      testFieldsLateInitOne0043
     * @tc.desc      Checking for initialization from function call with object captured by lambda.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitOne0043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F142 = new A_F142()
        const lambda = () => {
      a.field = c'a'
        }
        foo_F142(lambda)
        expect(a.field instanceof char).assertTrue()
        expect(a.field).assertEqual(c'a')
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_ONE_4400
     * @tc.name      testFieldsLateInitOne0044
     * @tc.desc      Checking for initialization from function call with object captured by lambda.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitOne0044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F143 = new A_F143()
        const lambda = () => {
      a.field = false
        }
        foo_F143(lambda)
        expect(a.field instanceof boolean).assertTrue()
        expect(a.field).assertEqual(false)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_ONE_4500
     * @tc.name      testFieldsLateInitOne0045
     * @tc.desc      Checking for initialization from function call with object captured by lambda.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitOne0045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F144 = new A_F144()
        const lambda = () => {
      a.field = 5
        }
        foo_F144(lambda)
        expect(a.field instanceof Object).assertTrue()
        expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_ONE_4600
     * @tc.name      testFieldsLateInitOne0046
     * @tc.desc      Checking for initialization from function call with object captured by lambda.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitOne0046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F145 = new A_F145()
        const lambda = () => {
      a.field = {data: 5}
        }
        foo_F145(lambda)
        expect(a.field instanceof C_F145).assertTrue()
        expect(a.field.data instanceof int).assertTrue()
        expect(a.field.data).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_ONE_4700
     * @tc.name      testFieldsLateInitOne0047
     * @tc.desc      Checking for initialization with asynchronous API usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitOne0047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F146 = new A_F146()
        expect(a.field instanceof Promise).assertTrue()
        let res = waitForCompletion(() => a.field)
        expect(res instanceof long).assertTrue()
        expect(res).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_ONE_4800
     * @tc.name      testFieldsLateInitOne0048
     * @tc.desc      Checking for initialization with asynchronous API usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitOne0048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F147 = new A_F147()
        expect(a.field instanceof Promise).assertTrue()
        let res = waitForCompletion(() => a.field)
        expect(res instanceof int).assertTrue()
        expect(res).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_ONE_4900
     * @tc.name      testFieldsLateInitOne0049
     * @tc.desc      Checking for initialization with asynchronous API usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitOne0049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F148 = new A_F148()
        expect(a.field instanceof Promise).assertTrue()
        let res = waitForCompletion(() => a.field)
        expect(res instanceof byte).assertTrue()
        expect(res).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_ONE_5000
     * @tc.name      testFieldsLateInitOne0050
     * @tc.desc      Checking for initialization with asynchronous API usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitOne0050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F149 = new A_F149()
        expect(a.field instanceof Promise).assertTrue()
        let res = waitForCompletion(() => a.field)
        expect(res instanceof short).assertTrue()
        expect(res).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_ONE_5100
     * @tc.name      testFieldsLateInitOne0051
     * @tc.desc      Checking for initialization with asynchronous API usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitOne0051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F150 = new A_F150()
        expect(a.field instanceof Promise).assertTrue()
        let res = waitForCompletion(() => a.field)
        expect(res instanceof double).assertTrue()
        expect(res).assertEqual(7.3)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_ONE_5200
     * @tc.name      testFieldsLateInitOne0052
     * @tc.desc      Checking for initialization with asynchronous API usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitOne0052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F151 = new A_F151()
        expect(a.field instanceof Promise).assertTrue()
        let res = waitForCompletion(() => a.field)
        expect(res instanceof number).assertTrue()
        expect(res).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_ONE_5300
     * @tc.name      testFieldsLateInitOne0053
     * @tc.desc      Checking for initialization with asynchronous API usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitOne0053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F152 = new A_F152()
        expect(a.field instanceof Promise).assertTrue()
        let res = waitForCompletion(() => a.field)
        expect(res instanceof float).assertTrue()
        expect(res).assertEqual(7.3f)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_ONE_5400
     * @tc.name      testFieldsLateInitOne0054
     * @tc.desc      Checking for initialization with asynchronous API usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitOne0054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F153 = new A_F153()
        expect(a.field instanceof Promise).assertTrue()
        let res = waitForCompletion(() => a.field)
        expect(res instanceof bigint).assertTrue()
        expect(res).assertEqual(5n)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_ONE_5500
     * @tc.name      testFieldsLateInitOne0055
     * @tc.desc      Checking for initialization with asynchronous API usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitOne0055", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F154 = new A_F154()
        expect(a.field instanceof Promise).assertTrue()
        let res = waitForCompletion(() => a.field)
        expect(res instanceof string).assertTrue()
        expect(res).assertEqual("abc")
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_ONE_5600
     * @tc.name      testFieldsLateInitOne0056
     * @tc.desc      Checking for initialization with asynchronous API usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitOne0056", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F155 = new A_F155()
        expect(a.field instanceof Promise).assertTrue()
        let res = waitForCompletion(() => a.field)
        expect(res instanceof char).assertTrue()
        expect(res).assertEqual(c'a')
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_ONE_5700
     * @tc.name      testFieldsLateInitOne0057
     * @tc.desc      Checking for initialization with asynchronous API usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitOne0057", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F156 = new A_F156()
        expect(a.field instanceof Promise).assertTrue()
        let res = waitForCompletion(() => a.field)
        expect(res instanceof boolean).assertTrue()
        expect(res).assertEqual(false)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_ONE_5800
     * @tc.name      testFieldsLateInitOne0058
     * @tc.desc      Checking for initialization with asynchronous API usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitOne0058", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F157 = new A_F157()
        expect(a.field instanceof Promise).assertTrue()
        let res = waitForCompletion(() => a.field)
        expect(res instanceof Object).assertTrue()
        expect(res).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_ONE_5900
     * @tc.name      testFieldsLateInitOne0059
     * @tc.desc      Checking for initialization with asynchronous API usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitOne0059", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let a: A_F158 = new A_F158()
        expect(a.field instanceof Promise).assertTrue()
        let res: C_F158 = await a.field
        expect(res instanceof C_F158).assertTrue()
        expect(res.data instanceof int).assertTrue()
        expect(res.data).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_ONE_6000
     * @tc.name      testFieldsLateInitOne0060
     * @tc.desc      Checking for initialization with asynchronous API usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitOne0060", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F159 = new A_F159()
        a.field = a.foo_F159()
        expect(a.field instanceof Promise).assertTrue()
        let res = waitForCompletion(() => a.field)
        expect(res instanceof long).assertTrue()
        expect(res).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_ONE_6100
     * @tc.name      testFieldsLateInitOne0061
     * @tc.desc      Checking for initialization with asynchronous API usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitOne0061", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F160 = new A_F160()
        a.field = a.foo_F160()
        expect(a.field instanceof Promise).assertTrue()
        let res = waitForCompletion(() => a.field)
        expect(res instanceof int).assertTrue()
        expect(res).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_ONE_6200
     * @tc.name      testFieldsLateInitOne0062
     * @tc.desc      Checking for initialization with asynchronous API usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitOne0062", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F161 = new A_F161()
        a.field = a.foo_F161()
        expect(a.field instanceof Promise).assertTrue()
        let res = waitForCompletion(() => a.field)
        expect(res instanceof byte).assertTrue()
        expect(res).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_ONE_6300
     * @tc.name      testFieldsLateInitOne0063
     * @tc.desc      Checking for initialization with asynchronous API usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitOne0063", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F162 = new A_F162()
        a.field = a.foo_F162()
        expect(a.field instanceof Promise).assertTrue()
        let res = waitForCompletion(() => a.field)
        expect(res instanceof short).assertTrue()
        expect(res).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_ONE_6400
     * @tc.name      testFieldsLateInitOne0064
     * @tc.desc      Checking for initialization with asynchronous API usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitOne0064", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F163 = new A_F163()
        a.field = a.foo_F163()
        expect(a.field instanceof Promise).assertTrue()
        let res = waitForCompletion(() => a.field)
        expect(res instanceof double).assertTrue()
        expect(res).assertEqual(7.3)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_ONE_6500
     * @tc.name      testFieldsLateInitOne0065
     * @tc.desc      Checking for initialization with asynchronous API usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitOne0065", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F164 = new A_F164()
        a.field = a.foo_F164()
        expect(a.field instanceof Promise).assertTrue()
        let res = waitForCompletion(() => a.field)
        expect(res instanceof number).assertTrue()
        expect(res).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_ONE_6600
     * @tc.name      testFieldsLateInitOne0066
     * @tc.desc      Checking for initialization with asynchronous API usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitOne0066", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F165 = new A_F165()
        a.field = a.foo_F165()
        expect(a.field instanceof Promise).assertTrue()
        let res = waitForCompletion(() => a.field)
        expect(res instanceof float).assertTrue()
        expect(res).assertEqual(7.3f)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_ONE_6700
     * @tc.name      testFieldsLateInitOne0067
     * @tc.desc      Checking for initialization with asynchronous API usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitOne0067", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F166 = new A_F166()
        a.field = a.foo_F166()
        expect(a.field instanceof Promise).assertTrue()
        let res = waitForCompletion(() => a.field)
        expect(res instanceof bigint).assertTrue()
        expect(res).assertEqual(5n)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_ONE_6800
     * @tc.name      testFieldsLateInitOne0068
     * @tc.desc      Checking for initialization with asynchronous API usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitOne0068", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F167 = new A_F167()
        a.field = a.foo_F167()
        expect(a.field instanceof Promise).assertTrue()
        let res = waitForCompletion(() => a.field)
        expect(res instanceof string).assertTrue()
        expect(res).assertEqual("abc")
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_ONE_6900
     * @tc.name      testFieldsLateInitOne0069
     * @tc.desc      Checking for initialization with asynchronous API usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitOne0069", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F168 = new A_F168()
        a.field = a.foo_F168()
        expect(a.field instanceof Promise).assertTrue()
        let res = waitForCompletion(() => a.field)
        expect(res instanceof char).assertTrue()
        expect(res).assertEqual(c'a')
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_ONE_7000
     * @tc.name      testFieldsLateInitOne0070
     * @tc.desc      Checking for initialization with asynchronous API usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitOne0070", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F169 = new A_F169()
        a.field = a.foo_F169()
        expect(a.field instanceof Promise).assertTrue()
        let res = waitForCompletion(() => a.field)
        expect(res instanceof boolean).assertTrue()
        expect(res).assertEqual(false)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_ONE_7100
     * @tc.name      testFieldsLateInitOne0071
     * @tc.desc      Checking for initialization with asynchronous API usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitOne0071", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F170 = new A_F170()
        a.field = a.foo_F170()
        expect(a.field instanceof Promise).assertTrue()
        let res = waitForCompletion(() => a.field)
        expect(res instanceof Object).assertTrue()
        expect(res).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_ONE_7200
     * @tc.name      testFieldsLateInitOne0072
     * @tc.desc      Checking for initialization with asynchronous API usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitOne0072", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let a: A_F171 = new A_F171()
        a.field = a.foo_F171()
        expect(a.field instanceof Promise).assertTrue()
        let res: C_F171 = await a.field
        expect(res instanceof C_F171).assertTrue()
        expect(res.data instanceof int).assertTrue()
        expect(res.data).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_ONE_7300
     * @tc.name      testFieldsLateInitOne0073
     * @tc.desc      Checking for initialization with asynchronous API usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitOne0073", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F172 = new A_F172()
        waitForCompletion(a.foo_F172)
        expect(a.field instanceof long).assertTrue()
        expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_ONE_7400
     * @tc.name      testFieldsLateInitOne0074
     * @tc.desc      Checking for initialization with asynchronous API usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitOne0074", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F173 = new A_F173()
        waitForCompletion(a.foo_F173)
        expect(a.field instanceof int).assertTrue()
        expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_ONE_7500
     * @tc.name      testFieldsLateInitOne0075
     * @tc.desc      Checking for initialization with asynchronous API usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitOne0075", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F174 = new A_F174()
        waitForCompletion(a.foo_F174)
        expect(a.field instanceof byte).assertTrue()
        expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_ONE_7600
     * @tc.name      testFieldsLateInitOne0076
     * @tc.desc      Checking for initialization with asynchronous API usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitOne0076", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F175 = new A_F175()
        waitForCompletion(a.foo_F175)
        expect(a.field instanceof short).assertTrue()
        expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_ONE_7700
     * @tc.name      testFieldsLateInitOne0077
     * @tc.desc      Checking for initialization with asynchronous API usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitOne0077", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F176 = new A_F176()
        waitForCompletion(a.foo_F176)
        expect(a.field instanceof double).assertTrue()
        expect(a.field).assertEqual(7.3)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_ONE_7800
     * @tc.name      testFieldsLateInitOne0078
     * @tc.desc      Checking for initialization with asynchronous API usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitOne0078", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F177 = new A_F177()
        waitForCompletion(a.foo_F177)
        expect(a.field instanceof number).assertTrue()
        expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_ONE_7900
     * @tc.name      testFieldsLateInitOne0079
     * @tc.desc      Checking for initialization with asynchronous API usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitOne0079", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F178 = new A_F178()
        waitForCompletion(a.foo_F178)
        expect(a.field instanceof float).assertTrue()
        expect(a.field).assertEqual(7.3f)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_ONE_8000
     * @tc.name      testFieldsLateInitOne0080
     * @tc.desc      Checking for initialization with asynchronous API usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitOne0080", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F179 = new A_F179()
        waitForCompletion(a.foo_F179)
        expect(a.field instanceof bigint).assertTrue()
        expect(a.field).assertEqual(5n)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_ONE_8100
     * @tc.name      testFieldsLateInitOne0081
     * @tc.desc      Checking for initialization with asynchronous API usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitOne0081", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F180 = new A_F180()
        waitForCompletion(a.foo_F180)
        expect(a.field instanceof string).assertTrue()
        expect(a.field).assertEqual("abc")
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_ONE_8200
     * @tc.name      testFieldsLateInitOne0082
     * @tc.desc      Checking for initialization with asynchronous API usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitOne0082", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F181 = new A_F181()
        waitForCompletion(a.foo_F181)
        expect(a.field instanceof char).assertTrue()
        expect(a.field).assertEqual(c'a')
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_ONE_8300
     * @tc.name      testFieldsLateInitOne0083
     * @tc.desc      Checking for initialization with asynchronous API usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitOne0083", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F182 = new A_F182()
        waitForCompletion(a.foo_F182)
        expect(a.field instanceof boolean).assertTrue()
        expect(a.field).assertEqual(false)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_ONE_8400
     * @tc.name      testFieldsLateInitOne0084
     * @tc.desc      Checking for initialization with asynchronous API usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitOne0084", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F183 = new A_F183()
        waitForCompletion(a.foo_F183)
        expect(a.field instanceof Object).assertTrue()
        expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_ONE_8500
     * @tc.name      testFieldsLateInitOne0085
     * @tc.desc      Checking for initialization with asynchronous API usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitOne0085", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F184 = new A_F184()
        let res = waitForCompletion(() => a.foo_F184().then((): long => a.field))
        expect(res instanceof long).assertTrue()
        expect(res).assertEqual(5)
        expect(a.field instanceof long).assertTrue()
        expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_ONE_8600
     * @tc.name      testFieldsLateInitOne0086
     * @tc.desc      Checking for initialization with asynchronous API usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitOne0086", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F185 = new A_F185()
        let res = waitForCompletion(() => a.foo_F185().then((): int => a.field))
        expect(res instanceof int).assertTrue()
        expect(res).assertEqual(5)
        expect(a.field instanceof int).assertTrue()
        expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_ONE_8700
     * @tc.name      testFieldsLateInitOne0087
     * @tc.desc      Checking for initialization with asynchronous API usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitOne0087", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F186 = new A_F186()
        let res = waitForCompletion(() => a.foo_F186().then((): byte => a.field))
        expect(res instanceof byte).assertTrue()
        expect(res).assertEqual(5)
        expect(a.field instanceof byte).assertTrue()
        expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_ONE_8800
     * @tc.name      testFieldsLateInitOne0088
     * @tc.desc      Checking for initialization with asynchronous API usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitOne0088", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F187 = new A_F187()
        let res = waitForCompletion(() => a.foo_F187().then((): short => a.field))
        expect(res instanceof short).assertTrue()
        expect(res).assertEqual(5)
        expect(a.field instanceof short).assertTrue()
        expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_ONE_8900
     * @tc.name      testFieldsLateInitOne0089
     * @tc.desc      Checking for initialization with asynchronous API usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitOne0089", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F188 = new A_F188()
        let res = waitForCompletion(() => a.foo_F188().then((): double => a.field))
        expect(res instanceof double).assertTrue()
        expect(res).assertEqual(7.3)
        expect(a.field instanceof double).assertTrue()
        expect(a.field).assertEqual(7.3)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_ONE_9000
     * @tc.name      testFieldsLateInitOne0090
     * @tc.desc      Checking for initialization with asynchronous API usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitOne0090", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F189 = new A_F189()
        let res = waitForCompletion(() => a.foo_F189().then((): number => a.field))
        expect(res instanceof number).assertTrue()
        expect(res).assertEqual(5)
        expect(a.field instanceof number).assertTrue()
        expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_ONE_9100
     * @tc.name      testFieldsLateInitOne0091
     * @tc.desc      Checking for initialization with asynchronous API usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitOne0091", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F190 = new A_F190()
        let res = waitForCompletion(() => a.foo_F190().then((): float => a.field))
        expect(res instanceof float).assertTrue()
        expect(res).assertEqual(7.3f)
        expect(a.field instanceof float).assertTrue()
        expect(a.field).assertEqual(7.3f)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_ONE_9200
     * @tc.name      testFieldsLateInitOne0092
     * @tc.desc      Checking for initialization with asynchronous API usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitOne0092", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F191 = new A_F191()
        let res = waitForCompletion(() => a.foo_F191().then((): bigint => a.field))
        expect(res instanceof bigint).assertTrue()
        expect(res).assertEqual(5n)
        expect(a.field instanceof bigint).assertTrue()
        expect(a.field).assertEqual(5n)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_ONE_9300
     * @tc.name      testFieldsLateInitOne0093
     * @tc.desc      Checking for initialization with asynchronous API usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitOne0093", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F192 = new A_F192()
        let res = waitForCompletion(() => a.foo_F192().then((): string => a.field))
        expect(res instanceof string).assertTrue()
        expect(res).assertEqual("abc")
        expect(a.field instanceof string).assertTrue()
        expect(a.field).assertEqual("abc")
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_ONE_9400
     * @tc.name      testFieldsLateInitOne0094
     * @tc.desc      Checking for initialization with asynchronous API usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitOne0094", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F193 = new A_F193()
        let res = waitForCompletion(() => a.foo_F193().then((): char => a.field))
        expect(res instanceof char).assertTrue()
        expect(res).assertEqual(c'a')
        expect(a.field instanceof char).assertTrue()
        expect(a.field).assertEqual(c'a')
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_ONE_9500
     * @tc.name      testFieldsLateInitOne0095
     * @tc.desc      Checking for initialization with asynchronous API usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitOne0095", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F194 = new A_F194()
        let res = waitForCompletion(() => a.foo_F194().then((): boolean => a.field))
        expect(res instanceof boolean).assertTrue()
        expect(res).assertEqual(false)
        expect(a.field instanceof boolean).assertTrue()
        expect(a.field).assertEqual(false)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_ONE_9600
     * @tc.name      testFieldsLateInitOne0096
     * @tc.desc      Checking for initialization with asynchronous API usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitOne0096", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F195 = new A_F195()
        let res = waitForCompletion(() => a.foo_F195().then((): Object => a.field))
        expect(res instanceof Object).assertTrue()
        expect(res).assertEqual(5)
        expect(a.field instanceof Object).assertTrue()
        expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_ONE_9700
     * @tc.name      testFieldsLateInitOne0097
     * @tc.desc      Checking for initialization with asynchronous API usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitOne0097", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F196 = new A_F196()
        waitForCompletion(a.foo_F196)
        expect(a.field instanceof C_F196).assertTrue()
        expect(a.field.data instanceof int).assertTrue()
        expect(a.field.data).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_ONE_9800
     * @tc.name      testFieldsLateInitOne0098
     * @tc.desc      Checking for initialization with asynchronous API usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitOne0098", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let a: A_F197 = new A_F197()
        await a.foo_F197()
        expect(a.field instanceof C_F197).assertTrue()
        expect(a.field.data instanceof int).assertTrue()
        expect(a.field.data).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_ONE_9900
     * @tc.name      testFieldsLateInitOne0099
     * @tc.desc      Checking for initialization with asynchronous API usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitOne0099", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F198 = new A_F198()
        waitForCompletion(a.foo_F198)
        expect(a.field instanceof long).assertTrue()
        expect(a.field).assertEqual(5)
    })
  })
}
