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

import Utils from "../../../Util.test";

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
} from "../../../../../../hypium/index"

type R1_0 = Record<string, Error>
function foo_0(p: R1_0): R1_0 {
    p["Null Pointer Error"] = new Error("NPE")
    return p
}

type R1_1<T> = Record<T, Error>
function foo_1(p: R1_1<string>): R1_1<string> {
    p["Null Pointer Error"] = new Error("NPE")
    return p
}

class A_0 {
    f1: Record<string, boolean> = {}
    f2: Record<number, boolean> = {}
}

let a_0 = 2, b_0 = 1;
function foo_2<T>(p: T): T {
    if (a_0 > b_0) {
        return p
    }
    throw new Error()
}

class A_1<T> {
    f: T
    constructor(p: T) {
        this.f = p
    }
    put(p: T) {
        this.f = p
    }
}
class B_0<T> extends A_1<T> {
    constructor(p: T) {
        super(p)
    }
    meth(): T {
        return this.f
    }
}

let a_1 = 2, b_1 = 1;
function to_obj_0(p: Object): Object {
    if (a_1 > b_1) {
        return p
    }
    return new Error()
}
function to_rec_0(p: Object|null): Record<number, number> {
    return p as Record<number, number>
}

class A_2<T extends Object> {
    private f: Record<number, T> = {}
    get(i: number): T|undefined { return this.f[i] }
    set(i: number, p: T) { this.f[i] = p }
}

class A_3<T extends Numeric> {
    private f: Record<T, string> = {}
    get(i: T): string|undefined { return this.f[i] }
    set(i: T, p: string) { this.f[i] = p }
}

type TT_0 = [number, number, string, boolean, Object]
enum Color_0 { Red, Green, Blue }
enum Commands_0 { Open = "fopen", Close = "fclose" }
type CC_0 = Color_0 | Commands_0
export default function RecordUtilityTypeTest(): void {
  describe("RecordUtilityTypeTest", () => {
    beforeAll(() => {
    })
    beforeEach(async () => {
      await Utils.msSleep(30);
    })
    afterEach(() => {
    })
    afterAll(() => {
    })

    /**
     * @tc.number    SUB_RECORD_UTILITY_TYPE_0100
     * @tc.name      testRecordUtilityType0001
     * @tc.desc      Basic Record<string, Error>
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRecordUtilityType0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: R1_0 = {}
      r = foo_0(r)
      expect(r["Null Pointer Error"] instanceof Error).assertTrue()
      expect(r["NPE"] == undefined).assertTrue()
    })

    /**
     * @tc.number    SUB_RECORD_UTILITY_TYPE_0200
     * @tc.name      testRecordUtilityType0002
     * @tc.desc      Generic Record<string, Error> via R1_1<T>
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRecordUtilityType0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: R1_1<string> = {}
      r = foo_1(r)
      expect(r["Null Pointer Error"] instanceof Error).assertTrue()
      expect(r["NPE"] == undefined).assertTrue()
    })

    /**
     * @tc.number    SUB_RECORD_UTILITY_TYPE_0400
     * @tc.name      testRecordUtilityType0004
     * @tc.desc      Array of Record<string, number>
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRecordUtilityType0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = new Array<Record<string, number>>()
      r.push({ "A": 1 })
      r.push({ "B": 2 })
      let v = r.pop()
      expect(v!["B"] == 2 && v!["A"] == undefined).assertTrue()
      v = r.pop()
      expect(v!["A"] == 1 && v!["B"] == undefined).assertTrue()
    })

    /**
     * @tc.number    SUB_RECORD_UTILITY_TYPE_0500
     * @tc.name      testRecordUtilityType0005
     * @tc.desc      Tuple of Record types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRecordUtilityType0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: [Record<number, string>, Record<string, (p: number) => string>] = [
        { 1: "1", 2: "2", 3: "3" },
        { "A": (p: number): string => "A" + p, "B": (p: number): string => "B" + p }
      ]
      expect(r[0][1] == "1").assertTrue()
      expect(r[0][2] == "2").assertTrue()
      expect(r[0][3] == "3").assertTrue()
      expect(r[0][4] == undefined).assertTrue()
      expect(r[1]["A"]!(42) == "A42").assertTrue()
      expect(r[1]["B"]!(33) == "B33").assertTrue()
      expect(r[1]["C"] == undefined).assertTrue()
    })

    /**
     * @tc.number    SUB_RECORD_UTILITY_TYPE_0600
     * @tc.name      testRecordUtilityType0006
     * @tc.desc      Class with Record fields (string and number keys)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRecordUtilityType0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new A_0
      a.f1["1"] = true
      a.f1["0"] = false
      a.f2[1] = false
      a.f2[0] = true
      expect(a.f1["1"]! && !(a.f1["0"]!) && !(a.f2[1]!) && a.f2[0]!).assertTrue()
      expect(a.f1[""] == undefined && a.f2[42] == undefined).assertTrue()
    })

    /**
     * @tc.number    SUB_RECORD_UTILITY_TYPE_0700
     * @tc.name      testRecordUtilityType0007
     * @tc.desc      Record with union string literal keys
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRecordUtilityType0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Record<"a"|"b"|"c", number> = {
        "a": 1,
        "b": 2,
        "c": 3,
      }
      let q = foo_2<Record<"a"|"b"|"c", number>>(r)
      expect(q["a"] == 1 && q["b"] == 2 && q["c"] == 3).assertTrue()
    })

    /**
     * @tc.number    SUB_RECORD_UTILITY_TYPE_0800
     * @tc.name      testRecordUtilityType0008
     * @tc.desc      Record with generic class inheritance
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRecordUtilityType0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: B_0<Record<Numeric, string>> = new B_0<Record<Numeric, string>>({
        12345.0: "1 2 3 4 5",
        67890.0: "6 7 8 9 0",
      });
      expect(b.meth()[new Short(12345)] == "1 2 3 4 5").assertTrue()
      expect(b.meth()[67890] == "6 7 8 9 0").assertTrue()
      expect(b.meth()[11111] == undefined).assertTrue()
      b.put({ 1.0: "A", 2.0: "B" })
      expect(b.meth()[1] == "A").assertTrue()
      expect(b.meth()[2] == "B").assertTrue()
    })

    /**
     * @tc.number    SUB_RECORD_UTILITY_TYPE_0900
     * @tc.name      testRecordUtilityType0009
     * @tc.desc      Record cast through Object
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRecordUtilityType0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Record<number, number> = {
        1: 101,
        2: 202,
        3: 303,
      }
      let obj: Object|null = to_obj_0(r)
      let q = to_rec_0(obj)
      expect(q[1] == 101 && q[2] == 202 && q[3] == 303).assertTrue()
    })

    /**
     * @tc.number    SUB_RECORD_UTILITY_TYPE_1000
     * @tc.name      testRecordUtilityType0010
     * @tc.desc      Record with string|number keys and bigint values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRecordUtilityType0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Record<string|number, bigint> = {
        "A": 1n,
        "B": 2n,
        1: 100n,
        2: 200n,
      }
      expect(r["A"] == 1n && r["B"] == 2n).assertTrue()
      expect(r[1] == 100n && r[2] == 200n).assertTrue()
      r["C"] = 3n
      r[3] = 300n
      expect(r["C"] == 3n && r[3] == 300n).assertTrue()
      expect(r["D"] == undefined && r[4] == undefined).assertTrue()
    })

    /**
     * @tc.number    SUB_RECORD_UTILITY_TYPE_1100
     * @tc.name      testRecordUtilityType0011
     * @tc.desc      Record with mixed value types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRecordUtilityType0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Record<string|number, double|char|boolean|string|bigint> = {
        "1": 42.0
      }
      r[6] = 6.01
      r["7"] = c'\u0007'
      r[8] = true
      r[9] = "abc"
      r[0] = 111111111111111111111111111111111111111111111111111111111111111111111111111111111111n
      expect(r[0] == 111111111111111111111111111111111111111111111111111111111111111111111111111111111111n).assertTrue()
      expect(r[9] == "abc").assertTrue()
      expect(r[8] == true).assertTrue()
      expect(r["7"] == c'\u0007').assertTrue()
      expect(r[6] == 6.01).assertTrue()
      expect(r["1"] == 42.0).assertTrue()
    })

    /**
     * @tc.number    SUB_RECORD_UTILITY_TYPE_1200
     * @tc.name      testRecordUtilityType0012
     * @tc.desc      A_2 generic container with Record values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRecordUtilityType0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_2<Record<string, number>> = new A_2<Record<string, number>>;
      a.set(1, { "A": 100 })
      a.set(2, { "B": 200 })
      expect(a.get(1)!["A"] == 100).assertTrue()
      expect(a.get(2)!["B"] == 200).assertTrue()
      expect(a.get(3) == undefined).assertTrue()
    })

    /**
     * @tc.number    SUB_RECORD_UTILITY_TYPE_1300
     * @tc.name      testRecordUtilityType0013
     * @tc.desc      A_3 generic container with Numeric keys
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRecordUtilityType0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_3<Int> = new A_3<Int>;
      a.set(42, "42")
      a.set(33, "33")
      expect(a.get(42) == "42").assertTrue()
      expect(a.get(33) == "33").assertTrue()
      expect(a.get(34) == undefined).assertTrue()
      a.set(42, "0")
      expect(a.get(42) == "0").assertTrue()
    })

    /**
     * @tc.number    SUB_RECORD_UTILITY_TYPE_1400
     * @tc.name      testRecordUtilityType0014
     * @tc.desc      Record<Int, tuple>
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRecordUtilityType0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ti: TT_0 = [ 6, 7, "abc", true, 42]
      let r: Record<Int, TT_0> = {0: ti}
      expect(r[0]?.[4]).assertEqual(42)
    })

    /**
     * @tc.number    SUB_RECORD_UTILITY_TYPE_1500
     * @tc.name      testRecordUtilityType0015
     * @tc.desc      Record<Int, FixedArray>
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRecordUtilityType0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Record<Int, FixedArray<string>> = {0: ['a', 'b', 'c']}
      expect(r[0]?.length).assertEqual(3)
    })

    /**
     * @tc.number    SUB_RECORD_UTILITY_TYPE_1600
     * @tc.name      testRecordUtilityType0016
     * @tc.desc      Nullable Record types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRecordUtilityType0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Record<string, int>|null = {
        'a': 1,
        'b': 2,
      } as Record<string, int>
      expect(r!['a']).assertEqual(1)
      expect(r!['b']).assertEqual(2)

      let s: Record<string, int>|undefined = {
        'a': 1,
        'b': 2,
      } as Record<string, int>
      expect(s!['a']).assertEqual(1)
      expect(s!['b']).assertEqual(2)

      let t: Record<string, int|null>|null = {
        'a': 1,
        'b': null,
      } as Record<string, int|null>
      expect(t!['a']).assertEqual(1)
      expect(t!['b']).assertEqual(null)

      let u: Record<string, int|undefined>|undefined = {
        'a': 1,
        'b': undefined,
      } as Record<string, int|undefined>
      expect(u!['a']).assertEqual(1)
      expect(u!['b']).assertEqual(undefined)

      let v: Record<string, Record<string, int|null>|null>|null = {
        'a': null,
        'b': { 'bb1': null, 'bb2': 42 } as Record<string, int|null>,
      } as Record<string, Record<string, int|null>|null>
      expect(v!['a']).assertEqual(null)
      expect(v!['b']!['bb1']).assertEqual(null)
      expect(v!['b']!['bb2']).assertEqual(42)

      let w: Record<string, Record<string, int|undefined>|undefined>|undefined = {
        'a': undefined,
        'b': { 'bb1': undefined, 'bb2': 42 } as Record<string, int|undefined>,
      } as Record<string, Record<string, int|undefined>|undefined>
      expect(w!['a']).assertEqual(undefined)
      expect(w!['b']!['bb1']).assertEqual(undefined)
      expect(w!['b']!['bb2']).assertEqual(42)
    })

    /**
     * @tc.number    SUB_RECORD_UTILITY_TYPE_2200
     * @tc.name      testRecordUtilityType0022
     * @tc.desc      Record<numeric, numeric> with various numeric key types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRecordUtilityType0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r_byte: Record<byte, byte> = {}
      r_byte[0] = 0; expect(r_byte[0] == 0).assertTrue()
      r_byte[0] = 55; expect(r_byte[0] == 55).assertTrue()
      r_byte[Byte.MIN_VALUE] = Byte.MIN_VALUE; expect(r_byte[Byte.MIN_VALUE] == Byte.MIN_VALUE).assertTrue()
      r_byte[Byte.MAX_VALUE] = Byte.MAX_VALUE; expect(r_byte[Byte.MAX_VALUE] == Byte.MAX_VALUE).assertTrue()

      let r_short: Record<short, short> = {}
      r_short[0] = 0; expect(r_short[0] == 0).assertTrue()
      r_short[0] = 55; expect(r_short[0] == 55).assertTrue()
      r_short[Short.MIN_VALUE] = Short.MIN_VALUE; expect(r_short[Short.MIN_VALUE] == Short.MIN_VALUE).assertTrue()
      r_short[Short.MAX_VALUE] = Short.MAX_VALUE; expect(r_short[Short.MAX_VALUE] == Short.MAX_VALUE).assertTrue()

      let r_int: Record<int, int> = {}
      r_int[0] = 0; expect(r_int[0] == 0).assertTrue()
      r_int[0] = 55; expect(r_int[0] == 55).assertTrue()
      r_int[Int.MIN_VALUE] = Int.MIN_VALUE; expect(r_int[Int.MIN_VALUE] == Int.MIN_VALUE).assertTrue()
      r_int[Int.MAX_VALUE] = Int.MAX_VALUE; expect(r_int[Int.MAX_VALUE] == Int.MAX_VALUE).assertTrue()

      let r_long: Record<long, long> = {}
      r_long[0] = 0; expect(r_long[0] == 0).assertTrue()
      r_long[0] = 55; expect(r_long[0] == 55).assertTrue()
      r_long[Long.MIN_VALUE] = Long.MIN_VALUE; expect(r_long[Long.MIN_VALUE] == Long.MIN_VALUE).assertTrue()
      r_long[Long.MAX_VALUE] = Long.MAX_VALUE; expect(r_long[Long.MAX_VALUE] == Long.MAX_VALUE).assertTrue()

      let r_float: Record<float, float> = {}
      r_float[0.0f] = 0.0f; expect(r_float[0.0f] == 0.0f).assertTrue()
      r_float[0.0f] = 55.0f; expect(r_float[0.0f] == 55.0f).assertTrue()
      r_float[Float.MIN_VALUE] = Float.MIN_VALUE; expect(r_float[Float.MIN_VALUE] == Float.MIN_VALUE).assertTrue()
      r_float[Float.MAX_VALUE] = Float.MAX_VALUE; expect(r_float[Float.MAX_VALUE] == Float.MAX_VALUE).assertTrue()
      r_float[Float.NEGATIVE_INFINITY] = Float.NEGATIVE_INFINITY; expect(r_float[Float.NEGATIVE_INFINITY] == Float.NEGATIVE_INFINITY).assertTrue()
      r_float[Float.POSITIVE_INFINITY] = Float.POSITIVE_INFINITY; expect(r_float[Float.POSITIVE_INFINITY] == Float.POSITIVE_INFINITY).assertTrue()
      r_float[Float.NaN] = 42.0f; expect(r_float[Float.NaN] == 42.0f).assertTrue()

      let r_double: Record<double, double> = {}
      r_double[0.0] = 0.0; expect(r_double[0.0] == 0.0).assertTrue()
      r_double[0.0] = 55.0; expect(r_double[0.0] == 55.0).assertTrue()
      r_double[Double.MIN_VALUE] = Double.MIN_VALUE; expect(r_double[Double.MIN_VALUE] == Double.MIN_VALUE).assertTrue()
      r_double[Double.MAX_VALUE] = Double.MAX_VALUE; expect(r_double[Double.MAX_VALUE] == Double.MAX_VALUE).assertTrue()
      r_double[Double.NEGATIVE_INFINITY] = Double.NEGATIVE_INFINITY; expect(r_double[Double.NEGATIVE_INFINITY] == Double.NEGATIVE_INFINITY).assertTrue()
      r_double[Double.POSITIVE_INFINITY] = Double.POSITIVE_INFINITY; expect(r_double[Double.POSITIVE_INFINITY] == Double.POSITIVE_INFINITY).assertTrue()
      r_double[Double.NaN] = 42.0; expect(r_double[Double.NaN] == 42.0).assertTrue()
    })

    /**
     * @tc.number    SUB_RECORD_UTILITY_TYPE_2800
     * @tc.name      testRecordUtilityType0028
     * @tc.desc      Record<string, string> with various string values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRecordUtilityType0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Record<string, string> = {}
      r["a"] = ""; expect(r["a"] == "").assertTrue()
      r["a"] = "\u0000"; expect(r["a"] == "\u0000").assertTrue()
      r["\u0000"] = ""; expect(r["\u0000"] == "").assertTrue()
      r["\u0000"] = "a"; expect(r["\u0000"] == "a").assertTrue()
      r[" "] = " "; expect(r[" "] == " ").assertTrue()
      r[" "] = "  "; expect(r[" "] == "  ").assertTrue()
    })

    /**
     * @tc.number    SUB_RECORD_UTILITY_TYPE_2900
     * @tc.name      testRecordUtilityType0029
     * @tc.desc      Record<numeric|string, numeric|string> with various union key types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRecordUtilityType0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r_byte: Record<byte|string, byte|string> = {}
      r_byte[0] = 0; expect(r_byte[0] == 0).assertTrue()
      r_byte[0] = 55; expect(r_byte[0] == 55).assertTrue()
      r_byte[Byte.MIN_VALUE] = Byte.MIN_VALUE; expect(r_byte[Byte.MIN_VALUE] == Byte.MIN_VALUE).assertTrue()
      r_byte[Byte.MAX_VALUE] = Byte.MAX_VALUE; expect(r_byte[Byte.MAX_VALUE] == Byte.MAX_VALUE).assertTrue()
      r_byte["a"] = ""; expect(r_byte["a"] == "").assertTrue()
      r_byte["\u0000"] = "a"; expect(r_byte["\u0000"] == "a").assertTrue()

      let r_short: Record<short|string, short|string> = {}
      r_short[0] = 0; expect(r_short[0] == 0).assertTrue()
      r_short[0] = 55; expect(r_short[0] == 55).assertTrue()
      r_short[Short.MIN_VALUE] = Short.MIN_VALUE; expect(r_short[Short.MIN_VALUE] == Short.MIN_VALUE).assertTrue()
      r_short["a"] = "\u0000"; expect(r_short["a"] == "\u0000").assertTrue()

      let r_int: Record<int|string, int|string> = {}
      r_int[0] = 0; expect(r_int[0] == 0).assertTrue()
      r_int[Int.MIN_VALUE] = Int.MIN_VALUE; expect(r_int[Int.MIN_VALUE] == Int.MIN_VALUE).assertTrue()
      r_int["a"] = ""; expect(r_int["a"] == "").assertTrue()

      let r_long: Record<long|string, long|string> = {}
      r_long[0] = 0; expect(r_long[0] == 0).assertTrue()
      r_long[Long.MAX_VALUE] = Long.MAX_VALUE; expect(r_long[Long.MAX_VALUE] == Long.MAX_VALUE).assertTrue()

      let r_float: Record<float|string, float|string> = {}
      r_float[0.0f] = 0.0f; expect(r_float[0.0f] == 0.0f).assertTrue()
      r_float[Float.NaN] = 42.0f; expect(r_float[Float.NaN] == 42.0f).assertTrue()

      let r_double: Record<double|string, double|string> = {}
      r_double[0.0] = 0.0; expect(r_double[0.0] == 0.0).assertTrue()
      r_double[Double.NaN] = 42.0; expect(r_double[Double.NaN] == 42.0).assertTrue()
    })

    /**
     * @tc.number    SUB_RECORD_UTILITY_TYPE_3500
     * @tc.name      testRecordUtilityType0035
     * @tc.desc      Record with enum key types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRecordUtilityType0035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r_c: Record<Color_0, Color_0> = {}
      r_c[Color_0.Red] = Color_0.Red; expect(r_c[Color_0.Red] == Color_0.Red).assertTrue()
      r_c[Color_0.Green] = Color_0.Green; expect(r_c[Color_0.Green] == Color_0.Green).assertTrue()
      r_c[Color_0.Blue] = Color_0.Blue; expect(r_c[Color_0.Blue] == Color_0.Blue).assertTrue()

      let r_cmd: Record<Commands_0, Commands_0> = {}
      r_cmd[Commands_0.Open] = Commands_0.Open; expect(r_cmd[Commands_0.Open] == Commands_0.Open).assertTrue()
      r_cmd[Commands_0.Close] = Commands_0.Close; expect(r_cmd[Commands_0.Close] == Commands_0.Close).assertTrue()

      let r_cc: Record<CC_0, CC_0> = {}
      r_cc[Commands_0.Open] = Commands_0.Open; expect(r_cc[Commands_0.Open] == Commands_0.Open).assertTrue()
      r_cc[Color_0.Red] = Color_0.Red; expect(r_cc[Color_0.Red] == Color_0.Red).assertTrue()
      r_cc[Color_0.Blue] = Color_0.Blue; expect(r_cc[Color_0.Blue] == Color_0.Blue).assertTrue()
    })

    /**
     * @tc.number    SUB_RECORD_UTILITY_TYPE_3800
     * @tc.name      testRecordUtilityType0038
     * @tc.desc      Record with string literal key types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRecordUtilityType0038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Record<"a"|"b"|"c", "a"|"b"|"c"> = {
        "a": "a",
        "b": "b",
        "c": "c",
      }
      expect(r["a"] == "a").assertTrue()
      expect(r["b"] == "b").assertTrue()
      expect(r["c"] == "c").assertTrue()
      r["a"] = "b"
      expect(r["a"] == "b").assertTrue()
      r["b"] = "c"
      expect(r["b"] == "c").assertTrue()
      r["c"] = "a"
      expect(r["c"] == "a").assertTrue()

      let s: Record<""|" "|"  ", ""|" "|"  "> = {
        "": "",
        " ": " ",
        "  ": "  ",
      }
      expect(s[""] == "").assertTrue()
      expect(s[" "] == " ").assertTrue()
      expect(s["  "] == "  ").assertTrue()
      s[""] = " "
      expect(s[""] == " ").assertTrue()
      s[" "] = "  "
      expect(s[" "] == "  ").assertTrue()
      s["  "] = ""
      expect(s["  "] == "").assertTrue()
    })
  });
}
