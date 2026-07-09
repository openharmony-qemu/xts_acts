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
} from "@ohos/hypium-binary/src/main/indexStatic";
import Utils from '../../Util.test.ets'
import {
  EN1, ES1, I1, C1, c, array1, array2, a1, b1, foo1, foo2, A1, A2, B1, f1, f2, AI1, aa1, F1, fooo1,
  ff1, Color1, Size1, Color2, Size2, CC1, B2, C2, I2, A3, B3, g1, g2, g3, g4, g5, g6, I3, AA1, A4,
  A5, BB3, CC2, FF1,
  tof_func_0_foo1, tof_func_0_foo2, tof_func_1_foo1, tof_func_1_foo2, tof_func_2_foo1,
  tof_func_2_foo2, tof_func_2_foo3, tof_func_2_foo4, tof_func_3_foo1, tof_func_3_foo2,
  tof_func_3_foo3, tof_func_4_foo1, tof_func_4_foo2, tof_func_5_foo1, tof_func_5_foo2,
  tof_func_6_foo1, tof_func_7_foo1, tof_func_7_foo2, tof_func_8_foo1, tof_func_8_foo2,
  tof_func_8_foo3, tof_func_8_foo4, tof_func_8_foo5, tof_func_8_foo6, tof_func_8_foo7,
  tof_func_9_foo1, tof_func_9_foo2, tof_func_9_foo3, tof_func_10_foo1, tof_func_10_foo2,
  tof_func_10_foo3, tof_func_11_foo1, tof_func_11_foo2, tof_func_11_foo3, tof_func_11_foo4,
  tof_func_11_foo5, tof_func_12_foo1, tof_func_13_foo1, tof_func_14_foo1, tof_func_14_foo2,
  tof_func_14_foo3, tof_func_14_foo4, tof_func_14_foo5, tof_func_14_foo6, tof_func_14_foo7,
  tof_func_14_foo8, tof_func_15_foo1, tof_func_15_foo2, tof_func_16_foo1, tof_func_16_foo2,
  tof_func_17_foo1, tof_func_17_foo2, tof_func_17_foo3, tof_func_18_foo1, tof_func_18_foo2,
  tof_func_18_foo3, tof_func_19_foo1, tof_func_19_foo2, tof_func_20_foo1, tof_func_20_foo2,
  tof_func_20_foo3, tof_func_21_foo1,   tof_func_22_foo1, tof_func_22_foo2,
  tof_func_23_foo1, tof_func_23_foo2,
  tof_func_24_foo1, tof_func_24_foo2,
  tof_func_25_foo1, tof_func_25_foo2,
  tof_func_26_foo1, tof_func_26_foo2,
  tof_func_27_foo1, tof_func_27_foo2,
  tof_func_28_foo1, tof_func_29_foo1, tof_func_30_foo1,
  tof_func_31_foo1, tof_func_32_foo1, tof_func_33_foo1,
  tof_func_34_foo1, tof_func_35_foo1,
  tof_func_11_original_foo
} from '../SharedDefs.test.ets';


let tof_vars_0_g1:number = Number.MIN_VALUE
let tof_vars_0_g2:number = Number.MAX_VALUE

let tof_vars_1_g1:double = Double.MIN_VALUE
let tof_vars_1_g2:double = Double.MAX_VALUE

let tof_vars_2_a = 42
let tof_vars_2_g1:string = "ABC"
let tof_vars_2_g2:string = '' + '' + 'CDE'
let tof_vars_2_g3:string = `a = ${tof_vars_2_a}` + '' + "CDE"
let tof_vars_2_g4:Comparable<String> = "X"

let tof_vars_3_g1:boolean = true
let tof_vars_3_g2:boolean = false
let tof_vars_3_g3:Comparable<Boolean> = new Boolean()

let tof_vars_4_g1:bigint = 123456789012345678901234567890n
let tof_vars_4_g2:bigint = 999999999999999999999999999999n

interface tof_vars_5_I {}
class tof_vars_5_A implements tof_vars_5_I {}
let tof_vars_5_g1:tof_vars_5_A = {}
let tof_vars_5_g2:tof_vars_5_I = new tof_vars_5_A()

let tof_vars_6_g1:Numeric = 3.14

let tof_vars_7_g1:number[] = [Number.MIN_VALUE]
let tof_vars_7_g2:number[] = [Number.MAX_VALUE]

let tof_vars_8_g1:byte[] = [Byte.MIN_VALUE]
let tof_vars_8_g2:short[] = [Short.MIN_VALUE]
let tof_vars_8_g3:int[] = [Int.MAX_VALUE]
let tof_vars_8_g4:long[] = [Long.MIN_VALUE]
let tof_vars_8_g5:float[] = [Float.MIN_VALUE]
let tof_vars_8_g6:double[] = [Double.MIN_VALUE]
let tof_vars_8_g7:char[] = [Char.MIN_VALUE as char]

interface tof_vars_9_I {}
class tof_vars_9_A implements tof_vars_9_I {}
let tof_vars_9_g1:tof_vars_9_A[] = [new tof_vars_9_A]
let tof_vars_9_g2:tof_vars_9_I[] = [new tof_vars_9_A]
let tof_vars_9_g3:Comparable<Float>[] = [3.14f]

let tof_vars_10_g1:Floating[] = [3.14f]
let tof_vars_10_g2:Integral[] = [42]
let tof_vars_10_g3:Numeric[] = [3.14]

type tof_vars_11_F = (p: int) => int
function tof_vars_11_foo(p: int): int {
  return p + p
}
let tof_vars_11_f: tof_vars_11_F = (p: int): int => { return p * p }
let tof_vars_11_g1:tof_vars_11_F = tof_vars_11_foo
let tof_vars_11_g2:((p: int) => int) = tof_vars_11_foo
let tof_vars_11_g3:tof_vars_11_F = tof_vars_11_f
let tof_vars_11_g4:((p: int) => int) = tof_vars_11_f
let tof_vars_11_g5:(() => void) = () => { console.log(1) }

let tof_vars_12_g1:undefined = undefined

let tof_vars_13_g1:null = null

interface tof_vars_14_I {}
class tof_vars_14_A implements tof_vars_14_I {}
let tof_vars_14_g1:tof_vars_14_A|null = new tof_vars_14_A()
let tof_vars_14_g2:tof_vars_14_A|null = null
let tof_vars_14_g3:tof_vars_14_I|null = new tof_vars_14_A()
let tof_vars_14_g4:tof_vars_14_I|null = null
let tof_vars_14_g5:tof_vars_14_A[]|null = [new tof_vars_14_A()]
let tof_vars_14_g6:tof_vars_14_A[]|null = null
let tof_vars_14_g7:tof_vars_14_I[]|null = [new tof_vars_14_A()]
let tof_vars_14_g8:tof_vars_14_I[]|null = null

enum tof_vars_15_Color { Red, Green, Blue }
enum tof_vars_15_Size { S, M, L, XL }
let tof_vars_15_g1:tof_vars_15_Color = tof_vars_15_Color.Red
let tof_vars_15_g2:tof_vars_15_Size = tof_vars_15_Size.XL

enum tof_vars_16_Color { Red = "red", Green = "green", Blue = "blue" }
enum tof_vars_16_Size { S = "small", M = "mid", L = "large", XL = "extra-large" }
let tof_vars_16_g1:tof_vars_16_Color = tof_vars_16_Color.Blue
let tof_vars_16_g2:tof_vars_16_Size = tof_vars_16_Size.L

let tof_vars_17_g1:number|string|boolean = false
let tof_vars_17_g2:number|boolean = true
let tof_vars_17_g3:boolean|never|long = true

let tof_vars_18_g1:number|string|boolean = "false"
let tof_vars_18_g2:number|string = "3.14"
let tof_vars_18_g3:boolean|never|long|string = "1234567890"

class tof_vars_19_A {}
class tof_vars_19_B {}
class tof_vars_19_C {}
let tof_vars_19_g1:tof_vars_19_A|tof_vars_19_B|tof_vars_19_C = new tof_vars_19_A()
let tof_vars_19_g2:tof_vars_19_B|never|undefined|tof_vars_19_A = new tof_vars_19_A()

interface tof_vars_20_I {}
class tof_vars_20_A implements tof_vars_20_I {}
class tof_vars_20_B extends tof_vars_20_A {}
class tof_vars_20_C<T> {
  fld: T
  constructor(p: T) {
    this.fld = p
  }
}
let tof_vars_20_g1:tof_vars_20_C<tof_vars_20_A> = new tof_vars_20_C<tof_vars_20_A>(new tof_vars_20_A())
let tof_vars_20_g2:tof_vars_20_C<tof_vars_20_B> = new tof_vars_20_C<tof_vars_20_B>(new tof_vars_20_B())
let tof_vars_20_g3:tof_vars_20_C<tof_vars_20_I> = new tof_vars_20_C<tof_vars_20_I>(new tof_vars_20_B())

let tof_vars_21_g1:Comparable<Double> = new Double()

let tof_vars_22_g1:byte = Byte.MIN_VALUE
let tof_vars_22_g2:byte = Byte.MAX_VALUE

let tof_vars_23_g1:short = Short.MIN_VALUE
let tof_vars_23_g2:short = Short.MAX_VALUE

let tof_vars_24_g1:int = Int.MIN_VALUE
let tof_vars_24_g2:int = Int.MAX_VALUE

let tof_vars_25_g1:long = Long.MIN_VALUE
let tof_vars_25_g2:long = Long.MAX_VALUE

let tof_vars_26_g1:float = Float.MIN_VALUE
let tof_vars_26_g2:float = Float.MAX_VALUE

let tof_vars_27_g1:char = Char.MIN_VALUE as char
let tof_vars_27_g2:char = Char.MAX_VALUE as char

let tof_vars_28_g1:Comparable<Float> = new Float()

let tof_vars_29_g1:Comparable<Byte> = new Byte()

let tof_vars_30_g1:Comparable<Short> = new Short()

let tof_vars_31_g1:Comparable<Int> = new Int()

let tof_vars_32_g1:Comparable<Long> = new Long()

let tof_vars_33_g1:Comparable<Char> = new Char()

let tof_vars_34_g1:Floating = 3.14f

let tof_vars_35_g1:Integral = 42

export default function ExpressionsTypeTwoTest(): void {
  describe("ExpressionsTypeTwoTest", () => {
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
     * @tc.number    SUB_EXPRESSIONS_TYPE_TWO_0100
     * @tc.name      testExpressionsTypeTwo0001
     * @tc.desc      Chapter 3.0 states table of Aliases for predefined types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsTypeTwo0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let data1:tof_vars_14_A|null = new tof_vars_14_A()
      expect(typeof data1).assertEqual("object")
      expect(typeof tof_vars_14_g1).assertEqual("object")
      let data2:tof_vars_14_A|null = null
      expect(typeof data2).assertEqual("object")
      expect(typeof tof_vars_14_g2).assertEqual("object")
      let data3:tof_vars_14_I|null = new tof_vars_14_A()
      expect(typeof data3).assertEqual("object")
      expect(typeof tof_vars_14_g3).assertEqual("object")
      let data4:tof_vars_14_I|null = null
      expect(typeof data4).assertEqual("object")
      expect(typeof tof_vars_14_g4).assertEqual("object")
      let data5:tof_vars_14_A[]|null = [new tof_vars_14_A()]
      expect(typeof data5).assertEqual("object")
      expect(typeof tof_vars_14_g5).assertEqual("object")
      let data6:tof_vars_14_A[]|null = null
      expect(typeof data6).assertEqual("object")
      expect(typeof tof_vars_14_g6).assertEqual("object")
      let data7:tof_vars_14_I[]|null = [new tof_vars_14_A()]
      expect(typeof data7).assertEqual("object")
      expect(typeof tof_vars_14_g7).assertEqual("object")
      let data8:tof_vars_14_I[]|null = null
      expect(typeof data8).assertEqual("object")
      expect(typeof tof_vars_14_g8).assertEqual("object")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_TWO_0200
     * @tc.name      testExpressionsTypeTwo0002
     * @tc.desc      Chapter 3.0 states table of Aliases for predefined types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsTypeTwo0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let data1:tof_vars_15_Color = tof_vars_15_Color.Red
      expect(typeof data1).assertEqual("int")
      expect(typeof tof_vars_15_g1).assertEqual("int")
      let data2:tof_vars_15_Size = tof_vars_15_Size.XL
      expect(typeof data2).assertEqual("int")
      expect(typeof tof_vars_15_g2).assertEqual("int")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_TWO_0300
     * @tc.name      testExpressionsTypeTwo0003
     * @tc.desc      Chapter 3.0 states table of Aliases for predefined types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsTypeTwo0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let data1:tof_vars_16_Color = tof_vars_16_Color.Blue
      expect(typeof data1).assertEqual("string")
      expect(typeof tof_vars_16_g1).assertEqual("string")
      let data2:tof_vars_16_Size = tof_vars_16_Size.L
      expect(typeof data2).assertEqual("string")
      expect(typeof tof_vars_16_g2).assertEqual("string")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_TWO_0400
     * @tc.name      testExpressionsTypeTwo0004
     * @tc.desc      Chapter 3.0 states table of Aliases for predefined types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsTypeTwo0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let data1:number|string|boolean = false
      expect(typeof data1).assertEqual("boolean")
      expect(typeof tof_vars_17_g1).assertEqual("boolean")
      let data2:number|boolean = true
      expect(typeof data2).assertEqual("boolean")
      expect(typeof tof_vars_17_g2).assertEqual("boolean")
      let data3:boolean|never|long = true
      expect(typeof data3).assertEqual("boolean")
      expect(typeof tof_vars_17_g3).assertEqual("boolean")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_TWO_0500
     * @tc.name      testExpressionsTypeTwo0005
     * @tc.desc      Chapter 3.0 states table of Aliases for predefined types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsTypeTwo0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let data1:number|string|boolean = "false"
      expect(typeof data1).assertEqual("string")
      expect(typeof tof_vars_18_g1).assertEqual("string")
      let data2:number|string = "3.14"
      expect(typeof data2).assertEqual("string")
      expect(typeof tof_vars_18_g2).assertEqual("string")
      let data3:boolean|never|long|string = "1234567890"
      expect(typeof data3).assertEqual("string")
      expect(typeof tof_vars_18_g3).assertEqual("string")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_TWO_0600
     * @tc.name      testExpressionsTypeTwo0006
     * @tc.desc      Chapter 3.0 states table of Aliases for predefined types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsTypeTwo0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let data1:tof_vars_19_A|tof_vars_19_B|tof_vars_19_C = new tof_vars_19_A()
      expect(typeof data1).assertEqual("object")
      expect(typeof tof_vars_19_g1).assertEqual("object")
      let data2:tof_vars_19_B|never|undefined|tof_vars_19_A = new tof_vars_19_A()
      expect(typeof data2).assertEqual("object")
      expect(typeof tof_vars_19_g2).assertEqual("object")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_TWO_0700
     * @tc.name      testExpressionsTypeTwo0007
     * @tc.desc      Chapter 3.0 states table of Aliases for predefined types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsTypeTwo0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let data1:tof_vars_20_C<tof_vars_20_A> = new tof_vars_20_C<tof_vars_20_A>(new tof_vars_20_A())
      expect(typeof data1).assertEqual("object")
      expect(typeof tof_vars_20_g1).assertEqual("object")
      let data2:tof_vars_20_C<tof_vars_20_B> = new tof_vars_20_C<tof_vars_20_B>(new tof_vars_20_B())
      expect(typeof data2).assertEqual("object")
      expect(typeof tof_vars_20_g2).assertEqual("object")
      let data3:tof_vars_20_C<tof_vars_20_I> = new tof_vars_20_C<tof_vars_20_I>(new tof_vars_20_B())
      expect(typeof data3).assertEqual("object")
      expect(typeof tof_vars_20_g3).assertEqual("object")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_TWO_0800
     * @tc.name      testExpressionsTypeTwo0008
     * @tc.desc      Chapter 3.0 states table of Aliases for predefined types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsTypeTwo0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let data1:Comparable<Double> = new Double()
      expect(typeof data1).assertEqual("number")
      expect(typeof tof_vars_21_g1).assertEqual("number")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_TWO_0900
     * @tc.name      testExpressionsTypeTwo0009
     * @tc.desc      Chapter 3.0 states table of Aliases for predefined types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsTypeTwo0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let data1:byte = Byte.MIN_VALUE
      expect(typeof data1).assertEqual("byte")
      expect(typeof tof_vars_22_g1).assertEqual("byte")
      let data2:byte = Byte.MAX_VALUE
      expect(typeof data2).assertEqual("byte")
      expect(typeof tof_vars_22_g2).assertEqual("byte")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_TWO_1000
     * @tc.name      testExpressionsTypeTwo0010
     * @tc.desc      Chapter 3.0 states table of Aliases for predefined types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsTypeTwo0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let data1:short = Short.MIN_VALUE
      expect(typeof data1).assertEqual("short")
      expect(typeof tof_vars_23_g1).assertEqual("short")
      let data2:short = Short.MAX_VALUE
      expect(typeof data2).assertEqual("short")
      expect(typeof tof_vars_23_g2).assertEqual("short")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_TWO_1100
     * @tc.name      testExpressionsTypeTwo0011
     * @tc.desc      Chapter 3.0 states table of Aliases for predefined types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsTypeTwo0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let data1:int = Int.MIN_VALUE
      expect(typeof data1).assertEqual("int")
      expect(typeof tof_vars_24_g1).assertEqual("int")
      let data2:int = Int.MAX_VALUE
      expect(typeof data2).assertEqual("int")
      expect(typeof tof_vars_24_g2).assertEqual("int")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_TWO_1200
     * @tc.name      testExpressionsTypeTwo0012
     * @tc.desc      Chapter 3.0 states table of Aliases for predefined types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsTypeTwo0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let data1:long = Long.MIN_VALUE
      expect(typeof data1).assertEqual("long")
      expect(typeof tof_vars_25_g1).assertEqual("long")
      let data2:long = Long.MAX_VALUE
      expect(typeof data2).assertEqual("long")
      expect(typeof tof_vars_25_g2).assertEqual("long")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_TWO_1300
     * @tc.name      testExpressionsTypeTwo0013
     * @tc.desc      Chapter 3.0 states table of Aliases for predefined types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsTypeTwo0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let data1:float = Float.MIN_VALUE
      expect(typeof data1).assertEqual("float")
      expect(typeof tof_vars_26_g1).assertEqual("float")
      let data2:float = Float.MAX_VALUE
      expect(typeof data2).assertEqual("float")
      expect(typeof tof_vars_26_g2).assertEqual("float")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_TWO_1400
     * @tc.name      testExpressionsTypeTwo0014
     * @tc.desc      Chapter 3.0 states table of Aliases for predefined types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsTypeTwo0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let data1:char = Char.MIN_VALUE as char
      expect(typeof data1).assertEqual("char")
      expect(typeof tof_vars_27_g1).assertEqual("char")
      let data2:char = Char.MAX_VALUE as char
      expect(typeof data2).assertEqual("char")
      expect(typeof tof_vars_27_g2).assertEqual("char")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_TWO_1500
     * @tc.name      testExpressionsTypeTwo0015
     * @tc.desc      Chapter 3.0 states table of Aliases for predefined types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsTypeTwo0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let data1:Comparable<Float> = new Float()
      expect(typeof data1).assertEqual("float")
      expect(typeof tof_vars_28_g1).assertEqual("float")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_TWO_1600
     * @tc.name      testExpressionsTypeTwo0016
     * @tc.desc      Chapter 3.0 states table of Aliases for predefined types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsTypeTwo0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let data1:Comparable<Byte> = new Byte()
      expect(typeof data1).assertEqual("byte")
      expect(typeof tof_vars_29_g1).assertEqual("byte")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_TWO_1700
     * @tc.name      testExpressionsTypeTwo0017
     * @tc.desc      Chapter 3.0 states table of Aliases for predefined types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsTypeTwo0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let data1:Comparable<Short> = new Short()
      expect(typeof data1).assertEqual("short")
      expect(typeof tof_vars_30_g1).assertEqual("short")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_TWO_1800
     * @tc.name      testExpressionsTypeTwo0018
     * @tc.desc      Chapter 3.0 states table of Aliases for predefined types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsTypeTwo0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let data1:Comparable<Int> = new Int()
      expect(typeof data1).assertEqual("int")
      expect(typeof tof_vars_31_g1).assertEqual("int")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_TWO_1900
     * @tc.name      testExpressionsTypeTwo0019
     * @tc.desc      Chapter 3.0 states table of Aliases for predefined types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsTypeTwo0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let data1:Comparable<Long> = new Long()
      expect(typeof data1).assertEqual("long")
      expect(typeof tof_vars_32_g1).assertEqual("long")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_TWO_2000
     * @tc.name      testExpressionsTypeTwo0020
     * @tc.desc      Chapter 3.0 states table of Aliases for predefined types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsTypeTwo0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let data1:Comparable<Char> = new Char()
      expect(typeof data1).assertEqual("char")
      expect(typeof tof_vars_33_g1).assertEqual("char")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_TWO_2100
     * @tc.name      testExpressionsTypeTwo0021
     * @tc.desc      Chapter 3.0 states table of Aliases for predefined types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsTypeTwo0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let data1:Floating = 3.14f
      expect(typeof data1).assertEqual("float")
      expect(typeof tof_vars_34_g1).assertEqual("float")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_TWO_2200
     * @tc.name      testExpressionsTypeTwo0022
     * @tc.desc      Chapter 3.0 states table of Aliases for predefined types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsTypeTwo0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let data1:Integral = 42
      expect(typeof data1).assertEqual("int")
      expect(typeof tof_vars_35_g1).assertEqual("int")
    });
  });
}