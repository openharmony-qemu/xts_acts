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
  afterAll,
  afterEach,
  beforeAll,
  beforeEach,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType
} from '../../../../hypium/index';


class A {
  f: number;
  constructor(p: number) { this.f = p; }
}

class A1 {
  f: bigint;
  constructor(p: bigint) { this.f = p; }
}

class A2 {
  f: int
  constructor(p: int) { this.f = p }
}

class A3 {
  f: long
  constructor(p: long) { this.f = p }
}

class A4 {
  f: float
  constructor(p: float) { this.f = p }
}

class A5 {
  f: double
  constructor(p: double) { this.f = p }
}

class A6 { public d: byte = 0 as byte }
class A7 { public d: byte = Byte.MIN_VALUE }
class A8 { public d: byte = Byte.MAX_VALUE }
class A9 { public d: byte = -128 as byte }
class A10 { public d: byte = 127 as byte }
class A11 { public d: short = 0 }
class A12 { public d: short = Short.MIN_VALUE }
class A13 { public d: short = Short.MAX_VALUE }
class A14 { public d: short = -32768 }
class A15 { public d: short = 32767 }
class A16 { public d: int = 0 }
class A17 { public d: int = Int.MIN_VALUE }
class A18 { public d: int = Int.MAX_VALUE }
class A19 { public d: int = -2147483648 }
class A20 { public d: int = 2147483647 }
class A21 { public d: long = 0 }
class A22 { public d: long = Long.MIN_VALUE }
class A23 { public d: long = Long.MAX_VALUE }
class A24 { public d: long = -9223372036854775808 }
class A25 { public d: long = 9223372036854775807 }
class A26 { public d: float = +0.0f }
class A27 { public d: float = -0.0f }
class A28 { public d: float = 3.4028234663852886e38f }
class A29 { public d: float = 1.401298464324817e-45f }
class A30 { public d: float = -3.4028234663852886e38f }
class A31 { public d: float = -1.401298464324817e-45f }
class A32 { public d: double = 0.0 }
class A33 { public d: double = -0.0 }
class A34 { public d: double = 3.4028234663852886e38 }
class A35 { public d: double = 1.401298464324817e-45 }
class A36 { public d: double = -3.4028234663852886e38 }
class A37 { public d: double = -1.401298464324817e-45 }
class A38 { public d: string = '\u0000'; }
class A39 { public d: string = '\u0FFF'; }
class A40 { public d: string = '\uFFFF'; }
class A41 {
  private s: float = Float.NaN
  public d: double = this.s
}
class A42 {
  private s: byte = 0b0 as byte
  public d: short = this.s
}
class A43 {
  private s: byte = Byte.MIN_VALUE
  public d: short = this.s
}
class A44 {
  private s: byte = Byte.MAX_VALUE
  public d: short = this.s
}
class A45 {
  private s: byte = 0b0 as byte
  public d: int = this.s
}
class A46 {
  private s: byte = Byte.MIN_VALUE
  public d: int = this.s
}
class A47 {
  private s: byte = Byte.MAX_VALUE
  public d: int = this.s
}
class A48 {
  private s: short = 0
  public d: number = this.s
}
class A49 {
  private s: short = Short.MIN_VALUE
  public d: number = this.s
}
class A50 {
  private s: short = Short.MAX_VALUE
  public d: number = this.s
}
class A51 {
  private s: int = 0
  public d: long = this.s
}
class A52 {
  private s: int = Int.MIN_VALUE
  public d: long = this.s
}
class A53 {
  private s: int = Int.MAX_VALUE
  public d: long = this.s
}
class A54 {
  private s: int = 0
  public d: float = this.s
}
class A55 {
  private s: int = Int.MIN_VALUE
  public d: float = this.s
}
class A56 {
  private s: int = Int.MAX_VALUE
  public d: float = this.s
}
class A57 {
  private s: int = 0
  public d: double = this.s
}
class A58 {
  private s: int = Int.MIN_VALUE
  public d: double = this.s
}
class A59 {
  private s: int = Int.MAX_VALUE
  public d: double = this.s
}
class A60 {
  private s: int = 0
  public d: number = this.s
}
class A61 {
  private s: int = Int.MIN_VALUE
  public d: number = this.s
}
class A62 {
  private s: int = Int.MAX_VALUE
  public d: number = this.s
}
class A63 {
  private s: long = 0
  public d: float = this.s
}
class A64 {
  private s: long = Long.MIN_VALUE
  public d: float = this.s
}
class A65 {
  private s: long = Long.MAX_VALUE
  public d: float = this.s
}
class A66 {
  private s: long = 0
  public d: double = this.s
}
class A67 {
  private s: long = Long.MIN_VALUE
  public d: double = this.s
}
class A68 {
  private s: long = Long.MAX_VALUE
  public d: double = this.s
}
class A69 {
  private s: long = 0
  public d: number = this.s
}
class A70 {
  private s: long = Long.MIN_VALUE
  public d: number = this.s
}
class A71 {
  private s: long = Long.MAX_VALUE
  public d: number = this.s
}
class A72 {
  private s: float = +0.0f
  public d: double = this.s
}
class A73 {
  private s: float = -0.0f
  public d: double = this.s
}
class A74 {
  private s: float = 3.4028234663852886e38f
  public d: double = this.s
}
class A75 {
  private s: float = 1.401298464324817e-45f
  public d: double = this.s
}
class A76 {
  private s: float = -3.4028234663852886e38f
  public d: double = this.s
}
class A77 {
  private s: float = -1.401298464324817e-45f
  public d: double = this.s
}
class A78 {
  private s: Color = Color.Red
  public d: int = this.s
}
class A79 {
  private s: Color = Color.Green
  public d: int = this.s
}
class A80 {
  private s: Color = Color.Blue
  public d: int = this.s
}
class A81 {
  private s: byte = 0b0 as byte
  public d: long = this.s
}
class A82 {
  private s: byte = Byte.MIN_VALUE
  public d: long = this.s
}
class A83 {
  private s: byte = Byte.MAX_VALUE
  public d: long = this.s
}
class A84 {
  private s: Color1 = Color1.Red
  public d: long = this.s
}
class A85 {
  private s: Color1 = Color1.Green
  public d: long = this.s
}
class A86 {
  private s: Color1 = Color1.Blue
  public d: long = this.s
}
class A87 {
  private s: Color2 = Color2.Red
  public d: float = this.s
}
class A88 {
  private s: Color2 = Color2.Green
  public d: float = this.s
}
class A89 {
  private s: Color2 = Color2.Blue
  public d: float = this.s
}
class A90 {
  private s: Color3 = Color3.Red
  public d: double = this.s
}
class A91 {
  private s: Color3 = Color3.Green
  public d: double = this.s
}
class A92 {
  private s: Color3 = Color3.Blue
  public d: double = this.s
}
class A93 {
  private s: Color4 = Color4.Red
  public d: number = this.s
}
class A94 {
  private s: Color4 = Color4.Green
  public d: number = this.s
}
class A95 {
  private s: Color4 = Color4.Blue
  public d: number = this.s
}
class A96 {
  private s: Color5 = Color5.Red
  public d: double = this.s
}
class A97 {
  private s: Color5 = Color5.Green
  public d: double = this.s
}
class A98 {
  private s: Color5 = Color5.Blue
  public d: double = this.s
}
class A99 {
  private s: Color5 = Color5.Red
  public d: number = this.s
}
class A100 {
  private s: Color5 = Color5.Green
  public d: number = this.s
}
class A101 {
  private s: Color5 = Color5.Blue
  public d: number = this.s
}
class A102 {
  private s: byte = 0b0 as byte
  public d: float = this.s
}
class A103 {
  private s: byte = Byte.MIN_VALUE
  public d: float = this.s
}
class A104 {
  private s: byte = Byte.MAX_VALUE
  public d: float = this.s
}
class A105 {
  private s: byte = 0b0 as byte
  public d: double = this.s
}
class A106 {
  private s: byte = Byte.MIN_VALUE
  public d: double = this.s
}
class A107 {
  private s: byte = Byte.MAX_VALUE
  public d: double = this.s
}
class A108 {
  private s: byte = 0b0 as byte
  public d: number = this.s
}
class A109 {
  private s: byte = Byte.MIN_VALUE
  public d: number = this.s
}
class A110 {
  private s: byte = Byte.MAX_VALUE
  public d: number = this.s
}
class A111 {
  private s: short = 0
  public d: int = this.s
}
class A112 {
  private s: short = Short.MIN_VALUE
  public d: int = this.s
}
class A113 {
  private s: short = Short.MAX_VALUE
  public d: int = this.s
}
class A114 {
  private s: short = 0
  public d: long = this.s
}
class A115 {
  private s: short = Short.MIN_VALUE
  public d: long = this.s
}
class A116 {
  private s: short = Short.MAX_VALUE
  public d: long = this.s
}
class A117 {
  private s: short = 0
  public d: float = this.s
}
class A118 {
  private s: short = Short.MIN_VALUE
  public d: float = this.s
}
class A119 {
  private s: short = Short.MAX_VALUE
  public d: float = this.s
}
class A120 {
  private s: short = 0
  public d: double = this.s
}
class A121 {
  private s: short = Short.MIN_VALUE
  public d: double = this.s
}
class A122 {
  private s: short = Short.MAX_VALUE
  public d: double = this.s
}
class A123 {
  private static s: float = Float.NaN
  public static d: double = A123.s
}
class A124 {
  private static s: byte = 0b0 as byte
  public static d: short = A124.s
}
class A125 {
  private static s: byte = Byte.MIN_VALUE
  public static d: short = A125.s
}
class A126 {
  private static s: byte = Byte.MAX_VALUE
  public static d: short = A126.s
}
class A127 {
  private static s: byte = 0b0 as byte
  public static d: int = A127.s
}
class A128 {
  private static s: byte = Byte.MIN_VALUE
  public static d: int = A128.s
}
class A129 {
  private static s: byte = Byte.MAX_VALUE
  public static d: int = A129.s
}
class A130 {
  private static s: short = 0
  public static d: number = A130.s
}
class A131 {
  private static s: short = Short.MIN_VALUE
  public static d: number = A131.s
}
class A132 {
  private static s: short = Short.MAX_VALUE
  public static d: number = A132.s
}
class A133 {
  private static s: int = 0
  public static d: long = A133.s
}
class A134 {
  private static s: int = Int.MIN_VALUE
  public static d: long = A134.s
}
class A135 {
  private static s: int = Int.MAX_VALUE
  public static d: long = A135.s
}
class A136 {
  private static s: int = 0
  public static d: float = A136.s
}
class A137 {
  private static s: int = Int.MIN_VALUE
  public static d: float = A137.s
}
class A138 {
  private static s: int = Int.MAX_VALUE
  public static d: float = A138.s
}
class A139 {
  private static s: int = 0
  public static d: double = A139.s
}
class A140 {
  private static s: int = Int.MIN_VALUE
  public static d: double = A140.s
}
class A141 {
  private static s: int = Int.MAX_VALUE
  public static d: double = A141.s
}
class A142 {
  private static s: int = 0
  public static d: number = A142.s
}
class A143 {
  private static s: int = Int.MIN_VALUE
  public static d: number = A143.s
}
class A144 {
  private static s: int = Int.MAX_VALUE
  public static d: number = A144.s
}
class A145 {
  private static s: long = 0
  public static d: float = A145.s
}
class A146 {
  private static s: long = Long.MIN_VALUE
  public static d: float = A146.s
}
class A147 {
  private static s: long = Long.MAX_VALUE
  public static d: float = A147.s
}
class A148 {
  private static s: long = 0
  public static d: double = A148.s
}
class A149 {
  private static s: long = Long.MIN_VALUE
  public static d: double = A149.s
}
class A150 {
  private static s: long = Long.MAX_VALUE
  public static d: double = A150.s
}
class A151 {
  private static s: long = 0
  public static d: number = A151.s
}
class A152 {
  private static s: long = Long.MIN_VALUE
  public static d: number = A152.s
}
class A153 {
  private static s: long = Long.MAX_VALUE
  public static d: number = A153.s
}
class A154 {
  private static s: float = +0.0f
  public static d: double = A154.s
}
class A155 {
  private static s: float = -0.0f
  public static d: double = A155.s
}
class A156 {
  private static s: float = 3.4028234663852886e38f
  public static d: double = A156.s
}
class A157 {
  private static s: float = 1.401298464324817e-45f
  public static d: double = A157.s
}
class A158 {
  private static s: float = -3.4028234663852886e38f
  public static d: double = A158.s
}
class A159 {
  private static s: float = -1.401298464324817e-45f
  public static d: double = A159.s
}
class A160 {
  private static s: Color = Color.Red
  public static d: int = A160.s
}
class A161 {
  private static s: Color = Color.Green
  public static d: int = A161.s
}
class A162 {
  private static s: Color = Color.Blue
  public static d: int = A162.s
}
class A163 {
  private static s: byte = 0b0 as byte
  public static d: long = A163.s
}
class A164 {
  private static s: byte = Byte.MIN_VALUE
  public static d: long = A164.s
}
class A165 {
  private static s: byte = Byte.MAX_VALUE
  public static d: long = A165.s
}
class A166 {
  private static s: Color1 = Color1.Red
  public static d: long = A166.s
}
class A167 {
  private static s: Color1 = Color1.Green
  public static d: long = A167.s
}
class A168 {
  private static s: Color1 = Color1.Blue
  public static d: long = A168.s
}
class A169 {
  private static s: Color2 = Color2.Red
  public static d: float = A169.s
}
class A170 {
  private static s: Color2 = Color2.Green
  public static d: float = A170.s
}
class A171 {
  private static s: Color2 = Color2.Blue
  public static d: float = A171.s
}
class A172 {
  private static s: Color3 = Color3.Red
  public static d: double = A172.s
}
class A173 {
  private static s: Color3 = Color3.Green
  public static d: double = A173.s
}
class A174 {
  private static s: Color3 = Color3.Blue
  public static d: double = A174.s
}
class A175 {
  private static s: Color4 = Color4.Red
  public static d: number = A175.s
}
class A176 {
  private static s: Color4 = Color4.Green
  public static d: number = A176.s
}
class A177 {
  private static s: Color4 = Color4.Blue
  public static d: number = A177.s
}
class A178 {
  private static s: Color5 = Color5.Red
  public static d: double = A178.s
}
class A179 {
  private static s: Color5 = Color5.Green
  public static d: double = A179.s
}
class A180 {
  private static s: Color5 = Color5.Blue
  public static d: double = A180.s
}
class A181 {
  private static s: byte = 0b0 as byte
  public static d: float = A181.s
}
class A182 {
  private static s: byte = Byte.MIN_VALUE
  public static d: float = A182.s
}
class A183 {
  private static s: byte = Byte.MAX_VALUE
  public static d: float = A183.s
}
class A184 {
  private static s: byte = 0b0 as byte
  public static d: double = A184.s
}
class A185 {
  private static s: byte = Byte.MIN_VALUE
  public static d: double = A185.s
}
class A186 {
  private static s: byte = Byte.MAX_VALUE
  public static d: double = A186.s
}
class A187 {
  private static s: byte = 0b0 as byte
  public static d: number = A187.s
}
class A188 {
  private static s: byte = Byte.MIN_VALUE
  public static d: number = A188.s
}
class A189 {
  private static s: byte = Byte.MAX_VALUE
  public static d: number = A189.s
}
class A190 {
  private static s: short = 0
  public static d: int = A190.s
}
class A191 {
  private static s: short = Short.MIN_VALUE
  public static d: int = A191.s
}
class A192 {
  private static s: short = Short.MAX_VALUE
  public static d: int = A192.s
}
class A193 {
  private static s: short = 0
  public static d: long = A193.s
}
class A194 {
  private static s: short = Short.MIN_VALUE
  public static d: long = A194.s
}
class A195 {
  private static s: short = Short.MAX_VALUE
  public static d: long = A195.s
}
class A196 {
  private static s: short = 0
  public static d: float = A196.s
}
class A197 {
  private static s: short = Short.MIN_VALUE
  public static d: float = A197.s
}
class A198 {
  private static s: short = Short.MAX_VALUE
  public static d: float = A198.s
}
class A199 {
  private static s: short = 0
  public static d: double = A199.s
}
class A200 {
  private static s: short = Short.MIN_VALUE
  public static d: double = A200.s
}
class A201 {
  private static s: short = Short.MAX_VALUE
  public static d: double = A201.s
}
class A202 {
  meth(p: number): number {
    return p + 2.0;
  }
}
class A203 {
  fld: number;
}
let s: int = 42;
class A204 {
  fld1: int = Color7.Red;
  fld2: number = Color7.Blue + Color7.Green;
  fld3: int = s + Color7.Green - 42;
}
class A205 {
  fld1: int;
  fld2: int;
  fld3: number;
}
class A206 {
  meth(p: number): number {
    return p + 2.0;
  }
}
class A207 {
  fld: int;
  constructor(p: int) {
    this.fld = p;
  }
}
class A208 {
  fld: number;
}
class A209 {
  fld2: number = Color8.Blue + Color8.Green;
  fld3: long = s + Color8.Green - 42;
}
class A210 {
  fld1: long;
  fld2: long;
  fld3: long;
}
class A211 {
  meth(p: number): number {
    return p + 2.0;
  }
}
class A212 {
  fld: number;
  constructor(p: number) {
    this.fld = p;
  }
}
class A213 {
  fld: number;
}
class A214 {
  fld1: string = Color9.Red;
  fld2: string = Color9.Blue + Color9.Green;
  fld3: string = "Z" + Color9.Green + "X";
}
class A215 {
  fld1: string = "";
  fld2: string = "";
  fld3: string = "";
}
class A216 {
  meth(p: string): string {
    return p + "!";
  }
}
class A217 {
  fld: string = "";
  constructor(p: string) {
    this.fld = p;
  }
}
class A218 {
  fld: string = "";
}


function bytesToFloat(bytes: Uint8Array): number {
  if (bytes.length !== 4) {
    throw new Error("Byte array must be exactly 4 bytes long");
  }
  const buffer = new ArrayBuffer(4);
  const dataView = new DataView(buffer);
  for (let i = 0; i < bytes.length; i++) {
    dataView.setUint8(i, bytes[i]);
  }
  return dataView.getFloat32(0, true);
}
function byteToShort(byteValue: number): number {
  byteValue = Math.max(-128, Math.min(127, byteValue));
  return byteValue;
}
enum Status {
  Active = 10,
  Inactive = 20,
  Pending = 30
}
enum Status1 {
  Active = 3_000_001,
  Inactive = 3_000_002,
  Pending = 3_000_003
}
enum Status2 {
  Active = 3_000_000_001,
  Inactive = 3_000_000_002,
  Pending = 3_000_000_003
}
enum Color {
  Red,
  Green,
  Blue
}

function isInt(value: number): boolean {
  return value >= -2147483648 && value <= 2147483647;
}
function isLong(value: bigint): boolean {
  return value >= BigInt("-9223372036854775808") && value <= BigInt("9223372036854775807");
}
function intToLong(intValue: number): bigint {
  if (!isInt(intValue)) {
    throw new Error("no int type");
  }
  return BigInt(intValue);
}
function longToDouble(longValue: bigint): number {
  if (!isLong(longValue)) {
    throw new Error("no long type");
  }
  return Number(longValue);
}
function longToFloat(longValue: bigint): number {
  if (!isLong(longValue)) {
    throw new Error("no long type");
  }
  return Number(longValue);
}


enum Color1 { Red=100, Green=200, Blue=300 }
enum Color2 { Red=10, Green=20, Blue=30 }
enum Color3 { Red=10001, Green=10002, Blue=10003 }
enum Color4 { Red=20001, Green=20002, Blue=20003 }
enum Color5 { Red=3_000_000_001, Green=3_000_000_002, Blue=3_000_000_003 }
enum Color6: double { Red = 0.0, Green = 100.0, Blue = 101.0 }
enum Color7 { Red, Green = 100, Blue }
enum Color8 { Red, Green = 0x3434343456565656, Blue }
enum Color9 { Red = "r", Green = "g", Blue = "b" }


function foo(p: number): number { return p; }
function foo1(p: bigint): bigint { return p; }
function foo3(p: byte): byte { return p }
function foo4(p: short): short { return p }
function foo5(p: int): int { return p }
function foo6(p: long): long { return p }
function foo7(p: float): float { return p }
function foo8(p: double): double { return p }
function foo9(p: int): number {
  return p + 1;
}
function foo10(p: number): number {
  return p + 1;
}
function foo11(p: string): string {
  return p + "!";
}



interface J1 { fld: double }
interface J2 { fld: double }
interface J3 { fld: double }
interface J4 { fld: number }
interface J5 { fld: number }
interface J6 { fld: number }
interface J7 { fld: float }
interface J8 { fld: float }
interface J9 { fld: float }
interface J10 { fld: char }
interface J11 { fld: char }
interface J12 { fld: char }
interface J13 { fld: int }
interface J14 { fld: int }
interface J15 { fld: int }
interface J16 { fld: long }
interface J17 { fld: long }
interface J18 { fld: long }

async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}

export default function ImplicitConversionsTest() {

  describe("ImplicitConversionsTest", () => {
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
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_0100
     * @tc.name      testImplicitConversions0001
     * @tc.desc      Casting conversions byte to double
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let byteArray: number[] = [0x40, 0x09, 0x21, 0xFB, 0x54, 0x44, 0x2D, 0x18];
      let buffer: ArrayBuffer = new ArrayBuffer(8);
      let dataView: DataView = new DataView(buffer);
      for (let i = 0; i < byteArray.length; i++) {
        dataView.setUint8(i, byteArray[i]);
      }
      let doubleValue: number = dataView.getFloat64(0, true);
      let expectedValue: number = 3.14159;
      expect(Math.abs(doubleValue - expectedValue) < 0.00001).assertEqual(false);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_0200
     * @tc.name      testImplicitConversions0002
     * @tc.desc      Casting conversions byte to float (Test Case 1)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const bytes1 = new Uint8Array([0x40, 0x49, 0x0F, 0xDB]);
      const result1 = bytesToFloat(bytes1);
      expect(result1).assertEqual(-40331460896358400);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_0300
     * @tc.name      testImplicitConversions0003
     * @tc.desc      Casting conversions byte to float (Test Case 2)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const bytes2 = new Uint8Array([0x3F, 0x80, 0x00, 0x00]);
      const result2 = bytesToFloat(bytes2);
      expect(result2).assertEqual(4.600602988224807e-41);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_0400
     * @tc.name      testImplicitConversions0004
     * @tc.desc      Casting conversions byte to float (Test Case 3)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const bytes3 = new Uint8Array([0xBF, 0x80, 0x00, 0x00]);
      const result3 = bytesToFloat(bytes3);
      expect(result3).assertEqual(4.618539608568165e-41);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_0500
     * @tc.name      testImplicitConversions0005
     * @tc.desc      Casting conversions byte to float (Test Case 4)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const bytes4 = new Uint8Array([0x00, 0x00, 0x00, 0x00]);
      const result4 = bytesToFloat(bytes4);
      expect(result4).assertEqual(0.0);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_0600
     * @tc.name      testImplicitConversions0006
     * @tc.desc      Casting conversions byte to int
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let byteArray: Uint8Array = new Uint8Array([0x12, 0x34, 0x56, 0x78]);
      let dataView = new DataView(byteArray.buffer);
      let intValue = dataView.getInt32(0, false);
      expect(intValue).assertEqual(0x12345678);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_0700
     * @tc.name      testImplicitConversions0007
     * @tc.desc      Casting conversions byte to short
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(byteToShort(10)).assertEqual(10);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_0800
     * @tc.name      testImplicitConversions0008
     * @tc.desc      Casting conversions enum to double (Status: 10/20/30)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let activeDoubleValue: number = Status.Active;
      let inactiveDoubleValue: number = Status.Inactive;
      let pendingDoubleValue: number = Status.Pending;
      let expectedActiveValue: number = 10.0;
      let expectedInactiveValue: number = 20.0;
      let expectedPendingValue: number = 30.0;
      expect(activeDoubleValue).assertEqual(expectedActiveValue);
      expect(inactiveDoubleValue).assertEqual(expectedInactiveValue);
      expect(pendingDoubleValue).assertEqual(expectedPendingValue);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_0900
     * @tc.name      testImplicitConversions0009
     * @tc.desc      Casting conversions enum to float (Status: 3000001/3000002/3000003)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let activeFloatValue: number = Status1.Active;
      let inactiveFloatValue: number = Status1.Inactive;
      let pendingFloatValue: number = Status1.Pending;
      let expectedActiveValue: number = 3000001.0;
      let expectedInactiveValue: number = 3000002.0;
      let expectedPendingValue: number = 3000003.0;
      expect(activeFloatValue).assertEqual(expectedActiveValue);
      expect(inactiveFloatValue).assertEqual(expectedInactiveValue);
      expect(pendingFloatValue).assertEqual(expectedPendingValue);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_1000
     * @tc.name      testImplicitConversions0010
     * @tc.desc      Casting conversions enum to double (Status: 3000000001/3000000002/3000000003)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let activeDoubleValue: number = Status2.Active;
      let inactiveDoubleValue: number = Status2.Inactive;
      let pendingDoubleValue: number = Status2.Pending;
      let expectedActiveValue: number = 3000000001.0;
      let expectedInactiveValue: number = 3000000002.0;
      let expectedPendingValue: number = 3000000003.0;
      expect(activeDoubleValue).assertEqual(expectedActiveValue);
      expect(inactiveDoubleValue).assertEqual(expectedInactiveValue);
      expect(pendingDoubleValue).assertEqual(expectedPendingValue);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_1100
     * @tc.name      testImplicitConversions0011
     * @tc.desc      Casting conversions enum to float (Status: 10/20/30)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let activeFloatValue: number = Status.Active;
      let inactiveFloatValue: number = Status.Inactive;
      let pendingFloatValue: number = Status.Pending;
      let expectedActiveValue: number = 10.0;
      let expectedInactiveValue: number = 20.0;
      let expectedPendingValue: number = 30.0;
      expect(activeFloatValue).assertEqual(expectedActiveValue);
      expect(inactiveFloatValue).assertEqual(expectedInactiveValue);
      expect(pendingFloatValue).assertEqual(expectedPendingValue);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_1200
     * @tc.name      testImplicitConversions0012
     * @tc.desc      Casting conversions enum to int (Color: Red/Green/Blue)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let redIntValue: number = Color.Red;
      let greenIntValue: number = Color.Green;
      let blueIntValue: number = Color.Blue;
      let expectedRedValue: number = 0;
      let expectedGreenValue: number = 1;
      let expectedBlueValue: number = 2;
      expect(redIntValue).assertEqual(expectedRedValue);
      expect(greenIntValue).assertEqual(expectedGreenValue);
      expect(blueIntValue).assertEqual(expectedBlueValue);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_1300
     * @tc.name      testImplicitConversions0013
     * @tc.desc      Casting conversions enum to long (Color: Red/Green/Blue)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let redLongValue: bigint = BigInt(Color.Red);
      let greenLongValue: bigint = BigInt(Color.Green);
      let blueLongValue: bigint = BigInt(Color.Blue);
      let expectedRedValue: bigint = 0n;
      let expectedGreenValue: bigint = 1n;
      let expectedBlueValue: bigint = 2n;
      expect(redLongValue).assertEqual(expectedRedValue);
      expect(greenLongValue).assertEqual(expectedGreenValue);
      expect(blueLongValue).assertEqual(expectedBlueValue);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_1400
     * @tc.name      testImplicitConversions0014
     * @tc.desc      Casting conversions int to long
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let intValue: number = 2147483647;
      let longValue: bigint = intToLong(intValue);
      expect(isLong(longValue)).assertEqual(true);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_1500
     * @tc.name      testImplicitConversions0015
     * @tc.desc      Casting conversions long to double
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let longValue: bigint = BigInt("9223372036854775807");
      let doubleValue: number = longToDouble(longValue);
      expect(typeof doubleValue).assertEqual("number");
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_1600
     * @tc.name      testImplicitConversions0016
     * @tc.desc      Casting conversions long to float
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let longValue: bigint = BigInt("9223372036854775807");
      let floatValue: number = longToFloat(longValue);
      expect(typeof floatValue).assertEqual("number");
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_1700
     * @tc.name      testImplicitConversions0017
     * @tc.desc      Casting conversions boolean to number (true/false)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let boolTrue: boolean = true;
      let numTrue: number = boolTrue ? 1 : 0;
      expect(numTrue).assertEqual(1);

      let boolFalse: boolean = false;
      let numFalse: number = boolFalse ? 1 : 0;
      expect(numFalse).assertEqual(0);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_1800
     * @tc.name      testImplicitConversions0018
     * @tc.desc      Assignment context, variable, widening primitive conversion, implicit (from Color to int)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: number;
      let s1: Color = Color.Red;
      d = s1;
      expect(d).assertEqual(0);
      let s2: Color = Color.Green;
      d = s2;
      expect(d).assertEqual(1);
      let s3: Color = Color.Blue;
      d = s3;
      expect(d).assertEqual(2);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_1900
     * @tc.name      testImplicitConversions0019
     * @tc.desc      Assignment context, variable, widening primitive conversion, implicit (from byte to long)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: bigint;
      let s1: number = 0;
      d = BigInt(s1);
      expect(d).assertEqual(0n);
      let s2: number = -128;
      d = BigInt(s2);
      expect(d).assertEqual(-128n);
      let s3: number = 127;
      d = BigInt(s3);
      expect(d).assertEqual(127n);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_2000
     * @tc.name      testImplicitConversions0020
     * @tc.desc      Assignment context, variable, widening primitive conversion, implicit (from Color to long)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: bigint;
      let s1: Color1 = Color1.Red;
      d = BigInt(s1);
      expect(d).assertEqual(100n);
      let s2: Color1 = Color1.Green;
      d = BigInt(s2);
      expect(d).assertEqual(200n);
      let s3: Color1 = Color1.Blue;
      d = BigInt(s3);
      expect(d).assertEqual(300n);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_2100
     * @tc.name      testImplicitConversions0021
     * @tc.desc      Assignment context, variable, widening primitive conversion, implicit (from Color to float)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: number;
      let s1: Color2 = Color2.Red;
      d = s1;
      expect(d).assertEqual(10.0);
      let s2: Color2 = Color2.Green;
      d = s2;
      expect(d).assertEqual(20.0);
      let s3: Color2 = Color2.Blue;
      d = s3;
      expect(d).assertEqual(30.0);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_2200
     * @tc.name      testImplicitConversions0022
     * @tc.desc      Assignment context, variable, widening primitive conversion, implicit (from Color to double)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: number;
      let s1: Color3 = Color3.Red;
      d = s1;
      expect(d).assertEqual(10001.0);
      let s2: Color3 = Color3.Green;
      d = s2;
      expect(d).assertEqual(10002.0);
      let s3: Color3 = Color3.Blue;
      d = s3;
      expect(d).assertEqual(10003.0);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_2300
     * @tc.name      testImplicitConversions0023
     * @tc.desc      Assignment context, variable, widening primitive conversion, implicit (from Color to number)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: number;
      let s1: Color4 = Color4.Red;
      d = s1;
      expect(d).assertEqual(20001.0);
      let s2: Color4 = Color4.Green;
      d = s2;
      expect(d).assertEqual(20002.0);
      let s3: Color4 = Color4.Blue;
      d = s3;
      expect(d).assertEqual(20003.0);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_2400
     * @tc.name      testImplicitConversions0024
     * @tc.desc      Assignment context, variable, widening primitive conversion, implicit (from Color to double)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: number;
      let s1: Color5 = Color5.Red;
      d = s1;
      expect(d).assertEqual(3000000001.0);
      let s2: Color5 = Color5.Green;
      d = s2;
      expect(d).assertEqual(3000000002.0);
      let s3: Color5 = Color5.Blue;
      d = s3;
      expect(d).assertEqual(3000000003.0);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_2500
     * @tc.name      testImplicitConversions0025
     * @tc.desc      Assignment context, variable, widening primitive conversion, implicit (from byte to float)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: number;
      let s1: number = 0;
      d = s1;
      expect(d).assertEqual(0.0);
      let s2: number = -128;
      d = s2;
      expect(d).assertEqual(-128.0);
      let s3: number = 127;
      d = s3;
      expect(d).assertEqual(127.0);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_2600
     * @tc.name      testImplicitConversions0026
     * @tc.desc      Assignment context, variable, widening primitive conversion, implicit (from short to long)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: bigint;
      let s1: number = 0;
      d = BigInt(s1);
      expect(d).assertEqual(0n);
      let s2: number = -32768;
      d = BigInt(s2);
      expect(d).assertEqual(-32768n);
      let s3: number = 32767;
      d = BigInt(s3);
      expect(d).assertEqual(32767n);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_2700
     * @tc.name      testImplicitConversions0027
     * @tc.desc      Call context, constructor, widening primitive conversion, implicit (from byte to int)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: number = 0;
      expect(new A(s1).f).assertEqual(0);
      let s2: number = -128;
      expect(new A(s2).f).assertEqual(-128);
      let s3: number = 127;
      expect(new A(s3).f).assertEqual(127);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_2800
     * @tc.name      testImplicitConversions0028
     * @tc.desc      Call context, constructor, widening primitive conversion, implicit (from short to number)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: number = 0;
      expect(new A(s1).f).assertEqual(0.0);
      let s2: number = -32768;
      expect(new A(s2).f).assertEqual(-32768.0);
      let s3: number = 32767;
      expect(new A(s3).f).assertEqual(32767.0);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_2900
     * @tc.name      testImplicitConversions0029
     * @tc.desc      Call context, constructor, widening primitive conversion, implicit (from int to long)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: number = 0;
      expect(new A1(BigInt(s1)).f).assertEqual(0n);
      let s2: number = -2147483648;
      expect(new A1(BigInt(s2)).f).assertEqual(BigInt("-2147483648"));
      let s3: number = 2147483647;
      expect(new A1(BigInt(s3)).f).assertEqual(BigInt("2147483647"));
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_3000
     * @tc.name      testImplicitConversions0030
     * @tc.desc      Call context, constructor, widening primitive conversion, implicit (from int to double)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: number = 0;
      expect(new A(s1).f).assertEqual(0.0);
      let s2: number = -2147483648;
      expect(new A(s2).f).assertEqual(-2147483648.0);
      let s3: number = 2147483647;
      expect(new A(s3).f).assertEqual(2147483647.0);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_3100
     * @tc.name      testImplicitConversions0031
     * @tc.desc      Call context, constructor, widening primitive conversion, implicit (from long to float)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: bigint = 0n;
      expect(new A(Number(s1)).f).assertEqual(0.0);
      let s2: bigint = BigInt("-9223372036854775808");
      expect(new A(Number(s2)).f).assertEqual(-9223372036854776000.0);
      let s3: bigint = BigInt("9223372036854775807");
      expect(new A(Number(s3)).f).assertEqual(9223372036854776000.0);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_3200
     * @tc.name      testImplicitConversions0032
     * @tc.desc      Call context, constructor, widening primitive conversion, implicit (from long to double)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: bigint = 0n;
      expect(new A(Number(s1)).f).assertEqual(0.0);
      let s2: bigint = BigInt("-9223372036854775808");
      expect(new A(Number(s2)).f).assertEqual(-9.223372036854776e+18);
      let s3: bigint = BigInt("9223372036854775807");
      expect(new A(Number(s3)).f).assertEqual(9.223372036854776e+18);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_3300
     * @tc.name      testImplicitConversions0033
     * @tc.desc      Call context, constructor, widening primitive conversion, implicit (from float to double)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: number = +0.0;
      expect(new A(s1).f).assertEqual(0.0);
      let s2: number = -0.0;
      expect(new A(s2).f).assertEqual(-0.0);
      let s3: number = 3.4028234663852886e38;
      expect(new A(s3).f).assertEqual(3.4028234663852886e38);
      let s4: number = 1.401298464324817e-45;
      expect(new A(s4).f).assertEqual(1.401298464324817e-45);
      let s5: number = -3.4028234663852886e38;
      expect(new A(s5).f).assertEqual(-3.4028234663852886e38);
      let s6: number = -1.401298464324817e-45;
      expect(new A(s6).f).assertEqual(-1.401298464324817e-45);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_3400
     * @tc.name      testImplicitConversions0034
     * @tc.desc      Call context, constructor, widening primitive conversion, implicit (from Color to int)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: Color = Color.Red;
      expect(new A(s1).f).assertEqual(0);
      let s2: Color = Color.Green;
      expect(new A(s2).f).assertEqual(1);
      let s3: Color = Color.Blue;
      expect(new A(s3).f).assertEqual(2);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_3500
     * @tc.name      testImplicitConversions0035
     * @tc.desc      Call context, constructor, widening primitive conversion, implicit (from byte to long)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: number = 0;
      expect(new A1(BigInt(s1)).f).assertEqual(0n);
      let s2: number = -128;
      expect(new A1(BigInt(s2)).f).assertEqual(-128n);
      let s3: number = 127;
      expect(new A1(BigInt(s3)).f).assertEqual(127n);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_3600
     * @tc.name      testImplicitConversions0036
     * @tc.desc      Call context, constructor, widening primitive conversion, implicit (from Color to long)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: Color1 = Color1.Red;
      expect(new A1(BigInt(s1)).f).assertEqual(100n);
      let s2: Color1 = Color1.Green;
      expect(new A1(BigInt(s2)).f).assertEqual(200n);
      let s3: Color1 = Color1.Blue;
      expect(new A1(BigInt(s3)).f).assertEqual(300n);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_3700
     * @tc.name      testImplicitConversions0037
     * @tc.desc      Call context, constructor, widening primitive conversion, implicit (from Color to float)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: Color2 = Color2.Red;
      expect(new A(s1).f).assertEqual(10.0);
      let s2: Color2 = Color2.Green;
      expect(new A(s2).f).assertEqual(20.0);
      let s3: Color2 = Color2.Blue;
      expect(new A(s3).f).assertEqual(30.0);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_3800
     * @tc.name      testImplicitConversions0038
     * @tc.desc      Call context, constructor, widening primitive conversion, implicit (from Color to double)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: Color3 = Color3.Red;
      expect(new A(s1).f).assertEqual(10001.0);
      let s2: Color3 = Color3.Green;
      expect(new A(s2).f).assertEqual(10002.0);
      let s3: Color3 = Color3.Blue;
      expect(new A(s3).f).assertEqual(10003.0);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_3900
     * @tc.name      testImplicitConversions0039
     * @tc.desc      Call context, constructor, widening primitive conversion, implicit (from Color to number)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: Color4 = Color4.Red;
      expect(new A(s1).f).assertEqual(20001.0);
      let s2: Color4 = Color4.Green;
      expect(new A(s2).f).assertEqual(20002.0);
      let s3: Color4 = Color4.Blue;
      expect(new A(s3).f).assertEqual(20003.0);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_4000
     * @tc.name      testImplicitConversions0040
     * @tc.desc      Call context, constructor, widening primitive conversion, implicit (from Color to double)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: Color5 = Color5.Red;
      expect(new A(s1).f).assertEqual(3000000001.0);
      let s2: Color5 = Color5.Green;
      expect(new A(s2).f).assertEqual(3000000002.0);
      let s3: Color5 = Color5.Blue;
      expect(new A(s3).f).assertEqual(3000000003.0);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_4100
     * @tc.name      testImplicitConversions0041
     * @tc.desc      Call context, constructor, widening primitive conversion, implicit (from byte to float)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: number = 0;
      expect(new A(s1).f).assertEqual(0.0);
      let s2: number = -128;
      expect(new A(s2).f).assertEqual(-128.0);
      let s3: number = 127;
      expect(new A(s3).f).assertEqual(127.0);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_4200
     * @tc.name      testImplicitConversions0042
     * @tc.desc      Call context, constructor, widening primitive conversion, implicit (from byte to double)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: number = 0;
      expect(new A(s1).f).assertEqual(0.0);
      let s2: number = -128;
      expect(new A(s2).f).assertEqual(-128.0);
      let s3: number = 127;
      expect(new A(s3).f).assertEqual(127.0);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_4300
     * @tc.name      testImplicitConversions0043
     * @tc.desc      Call context, constructor, widening primitive conversion, implicit (from byte to number)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: number = 0;
      expect(new A(s1).f).assertEqual(0.0);
      let s2: number = -128;
      expect(new A(s2).f).assertEqual(-128.0);
      let s3: number = 127;
      expect(new A(s3).f).assertEqual(127.0);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_4400
     * @tc.name      testImplicitConversions0044
     * @tc.desc      Call context, constructor, widening primitive conversion, implicit (from short to int)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: number = 0;
      expect(new A(s1).f).assertEqual(0);
      let s2: number = -32768;
      expect(new A(s2).f).assertEqual(-32768);
      let s3: number = 32767;
      expect(new A(s3).f).assertEqual(32767);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_4500
     * @tc.name      testImplicitConversions0045
     * @tc.desc      Call context, constructor, widening primitive conversion, implicit (from short to long)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: number = 0;
      expect(new A1(BigInt(s1)).f).assertEqual(0n);
      let s2: number = -32768;
      expect(new A1(BigInt(s2)).f).assertEqual(-32768n);
      let s3: number = 32767;
      expect(new A1(BigInt(s3)).f).assertEqual(32767n);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_4600
     * @tc.name      testImplicitConversions0046
     * @tc.desc      Call context, constructor, widening primitive conversion, implicit (from short to float)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: number = 0;
      expect(new A(s1).f).assertEqual(0.0);
      let s2: number = -32768;
      expect(new A(s2).f).assertEqual(-32768.0);
      let s3: number = 32767;
      expect(new A(s3).f).assertEqual(32767.0);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_4700
     * @tc.name      testImplicitConversions0047
     * @tc.desc      Call context, constructor, widening primitive conversion, implicit (from short to double)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: number = 0;
      expect(new A(s1).f).assertEqual(0.0);
      let s2: number = -32768;
      expect(new A(s2).f).assertEqual(-32768.0);
      let s3: number = 32767;
      expect(new A(s3).f).assertEqual(32767.0);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_4800
     * @tc.name      testImplicitConversions0048
     * @tc.desc      Call context, function, widening primitive conversion, implicit (from byte to byte)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => { // 模拟 byte 类型入参和返回值
      expect(foo(0)).assertEqual(0);
      expect(foo(-128)).assertEqual(-128);
      expect(foo(127)).assertEqual(127);
      expect(foo(-128)).assertEqual(-128);
      expect(foo(127)).assertEqual(127);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_4900
     * @tc.name      testImplicitConversions0049
     * @tc.desc      Call context, function, widening primitive conversion, implicit (from short to short)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => { // 模拟 short 类型入参和返回值
      expect(foo(0)).assertEqual(0);
      expect(foo(-32768)).assertEqual(-32768);
      expect(foo(32767)).assertEqual(32767);
      expect(foo(-32768)).assertEqual(-32768);
      expect(foo(32767)).assertEqual(32767);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_5000
     * @tc.name      testImplicitConversions0050
     * @tc.desc      Call context, function, widening primitive conversion, implicit (from int to int)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(foo(0)).assertEqual(0);
      expect(foo(-2147483648)).assertEqual(-2147483648);
      expect(foo(2147483647)).assertEqual(2147483647);
      expect(foo(-2147483648)).assertEqual(-2147483648);
      expect(foo(2147483647)).assertEqual(2147483647);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_5100
     * @tc.name      testImplicitConversions0051
     * @tc.desc      Call context, function, widening primitive conversion, implicit (from long to long)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(foo1(0n)).assertEqual(0n);
      expect(foo1(BigInt("-9223372036854775808"))).assertEqual(BigInt("-9223372036854775808"));
      expect(foo1(BigInt("9223372036854775807"))).assertEqual(BigInt("9223372036854775807"));
      expect(foo1(BigInt("-9223372036854775808"))).assertEqual(BigInt("-9223372036854775808"));
      expect(foo1(BigInt("9223372036854775807"))).assertEqual(BigInt("9223372036854775807"));
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_5200
     * @tc.name      testImplicitConversions0052
     * @tc.desc      Call context, function, widening primitive conversion, implicit (from float to float)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => { // 模拟 float 类型入参和返回值
      expect(foo(+0.0)).assertEqual(+0.0);
      expect(foo(-0.0)).assertEqual(-0.0);
      expect(foo(3.4028234663852886e38)).assertEqual(3.4028234663852886e38);
      expect(foo(1.401298464324817e-45)).assertEqual(1.401298464324817e-45);
      expect(foo(-3.4028234663852886e38)).assertEqual(-3.4028234663852886e38);
      expect(foo(-1.401298464324817e-45)).assertEqual(-1.401298464324817e-45);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_5300
     * @tc.name      testImplicitConversions0053
     * @tc.desc      Call context, function, widening primitive conversion, implicit (from double to double)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => { // 模拟 double 类型入参和返回值
      expect(foo(0.0)).assertEqual(0.0);
      expect(foo(-0.0)).assertEqual(-0.0);
      expect(foo(3.4028234663852886e38)).assertEqual(3.4028234663852886e38);
      expect(foo(1.401298464324817e-45)).assertEqual(1.401298464324817e-45);
      expect(foo(-3.4028234663852886e38)).assertEqual(-3.4028234663852886e38);
      expect(foo(-1.401298464324817e-45)).assertEqual(-1.401298464324817e-45);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_5400
     * @tc.name      testImplicitConversions0054
     * @tc.desc      Call context, function, widening primitive conversion, implicit (from char to char)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => { // 模拟 char 类型（Unicode 编码值）入参和返回值
      expect(foo(0)).assertEqual(0); // c'\u0000'
      expect(foo(4095)).assertEqual(4095); // c'\u0FFF'
      expect(foo(65535)).assertEqual(65535); // c'\uFFFF'
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_5500
     * @tc.name      testImplicitConversions0055
     * @tc.desc      Call context, function, widening primitive conversion, implicit (from float to double)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0055", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: number = NaN; // 模拟 Float.NaN
      expect(isNaN(foo(s))).assertEqual(true);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_5600
     * @tc.name      testImplicitConversions0056
     * @tc.desc      Call context, function, widening primitive conversion, implicit (from byte to short)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0056", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => { // 目标类型为 short
      let s1: number = 0;
      expect(foo(s1)).assertEqual(0);
      let s2: number = -128;
      expect(foo(s2)).assertEqual(-128);
      let s3: number = 127;
      expect(foo(s3)).assertEqual(127);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_5700
     * @tc.name      testImplicitConversions0057
     * @tc.desc      Call context, function, widening primitive conversion, implicit (from byte to int)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0057", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: number = 0;
      expect(foo(s1)).assertEqual(0);
      let s2: number = -128;
      expect(foo(s2)).assertEqual(-128);
      let s3: number = 127;
      expect(foo(s3)).assertEqual(127);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_5800
     * @tc.name      testImplicitConversions0058
     * @tc.desc      Call context, function, widening primitive conversion, implicit (from short to number)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0058", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: number = 0;
      expect(foo(s1)).assertEqual(0.0);
      let s2: number = -32768;
      expect(foo(s2)).assertEqual(-32768.0);
      let s3: number = 32767;
      expect(foo(s3)).assertEqual(32767.0);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_5900
     * @tc.name      testImplicitConversions0059
     * @tc.desc      Call context, function, widening primitive conversion, implicit (from int to long)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0059", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: number = 0;
      expect(foo1(BigInt(s1))).assertEqual(0n);
      let s2: number = -2147483648;
      expect(foo1(BigInt(s2))).assertEqual(BigInt("-2147483648"));
      let s3: number = 2147483647;
      expect(foo1(BigInt(s3))).assertEqual(BigInt("2147483647"));
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_6000
     * @tc.name      testImplicitConversions0060
     * @tc.desc      Call context, function, widening primitive conversion, implicit (from int to double)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0060", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: number = 0;
      expect(foo(s1)).assertEqual(0.0);
      let s2: number = -2147483648;
      expect(foo(s2)).assertEqual(-2147483648.0);
      let s3: number = 2147483647;
      expect(foo(s3)).assertEqual(2147483647.0);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_6100
     * @tc.name      testImplicitConversions0061
     * @tc.desc      Call context, function, widening primitive conversion, implicit (from long to double)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0061", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: bigint = 0n;
      expect(foo(Number(s1))).assertEqual(0.0);
      let s2: bigint = BigInt("-9223372036854775808");
      expect(foo(Number(s2))).assertEqual(-9.223372036854776e+18);
      let s3: bigint = BigInt("9223372036854775807");
      expect(foo(Number(s3))).assertEqual(9.223372036854776e+18);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_6200
     * @tc.name      testImplicitConversions0062
     * @tc.desc      Call context, function, widening primitive conversion, implicit (from float to double)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0062", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: number = +0.0;
      expect(foo(s1)).assertEqual(0.0);
      let s2: number = -0.0;
      expect(foo(s2)).assertEqual(-0.0);
      let s3: number = 3.4028234663852886e38;
      expect(foo(s3)).assertEqual(3.4028234663852886e38);
      let s4: number = 1.401298464324817e-45;
      expect(foo(s4)).assertEqual(1.401298464324817e-45);
      let s5: number = -3.4028234663852886e38;
      expect(foo(s5)).assertEqual(-3.4028234663852886e38);
      let s6: number = -1.401298464324817e-45;
      expect(foo(s6)).assertEqual(-1.401298464324817e-45);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_6300
     * @tc.name      testImplicitConversions0063
     * @tc.desc      Call context, function, widening primitive conversion, implicit (from Color to int)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0063", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: Color = Color.Red;
      expect(foo(s1)).assertEqual(0);
      let s2: Color = Color.Green;
      expect(foo(s2)).assertEqual(1);
      let s3: Color = Color.Blue;
      expect(foo(s3)).assertEqual(2);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_6400
     * @tc.name      testImplicitConversions0064
     * @tc.desc      Call context, function, widening primitive conversion, implicit (from byte to long)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0064", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: number = 0;
      expect(foo1(BigInt(s1))).assertEqual(0n);
      let s2: number = -128;
      expect(foo1(BigInt(s2))).assertEqual(-128n);
      let s3: number = 127;
      expect(foo1(BigInt(s3))).assertEqual(127n);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_6500
     * @tc.name      testImplicitConversions0065
     * @tc.desc      Call context, function, widening primitive conversion, implicit (from Color to long)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0065", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: Color1 = Color1.Red;
      expect(foo1(BigInt(s1))).assertEqual(100n);
      let s2: Color1 = Color1.Green;
      expect(foo1(BigInt(s2))).assertEqual(200n);
      let s3: Color1 = Color1.Blue;
      expect(foo1(BigInt(s3))).assertEqual(300n);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_6600
     * @tc.name      testImplicitConversions0066
     * @tc.desc      Call context, function, widening primitive conversion, implicit (from Color to float)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0066", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: Color2 = Color2.Red;
      expect(foo(s1)).assertEqual(10.0);
      let s2: Color2 = Color2.Green;
      expect(foo(s2)).assertEqual(20.0);
      let s3: Color2 = Color2.Blue;
      expect(foo(s3)).assertEqual(30.0);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_6700
     * @tc.name      testImplicitConversions0067
     * @tc.desc      Call context, function, widening primitive conversion, implicit (from Color to double)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0067", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: Color3 = Color3.Red;
      expect(foo(s1)).assertEqual(10001.0);
      let s2: Color3 = Color3.Green;
      expect(foo(s2)).assertEqual(10002.0);
      let s3: Color3 = Color3.Blue;
      expect(foo(s3)).assertEqual(10003.0);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_6800
     * @tc.name      testImplicitConversions0068
     * @tc.desc      Call context, function, widening primitive conversion, implicit (from Color to number)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0068", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: Color4 = Color4.Red;
      expect(foo(s1)).assertEqual(20001.0);
      let s2: Color4 = Color4.Green;
      expect(foo(s2)).assertEqual(20002.0);
      let s3: Color4 = Color4.Blue;
      expect(foo(s3)).assertEqual(20003.0);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_6900
     * @tc.name      testImplicitConversions0069
     * @tc.desc      Call context, function, widening primitive conversion, implicit (from Color to double)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0069", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: Color5 = Color5.Red;
      expect(foo(s1)).assertEqual(3000000001.0);
      let s2: Color5 = Color5.Green;
      expect(foo(s2)).assertEqual(3000000002.0);
      let s3: Color5 = Color5.Blue;
      expect(foo(s3)).assertEqual(3000000003.0);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_7000
     * @tc.name      testImplicitConversions0070
     * @tc.desc      Call context, constructor, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0070", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: byte = 0b0 as byte;
      expect(new A2(s1).f).assertEqual(0);
      let s2: byte = Byte.MIN_VALUE;
      expect(new A2(s2).f).assertEqual(-128);
      let s3: byte = Byte.MAX_VALUE;
      expect(new A2(s3).f).assertEqual(127);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_7100
     * @tc.name      testImplicitConversions0071
     * @tc.desc      Call context, constructor, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0071", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: short = 0;
      expect(new A(s1).f).assertEqual(0.0);
      let s2: short = Short.MIN_VALUE;
      expect(new A(s2).f).assertEqual(-32768.0);
      let s3: short = Short.MAX_VALUE;
      expect(new A(s3).f).assertEqual(32767.0);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_7200
     * @tc.name      testImplicitConversions0072
     * @tc.desc      Call context, constructor, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0072", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: int = 0;
      expect(new A3(s1).f).assertEqual(0);
      let s2: int = Int.MIN_VALUE;
      expect(new A3(s2).f).assertEqual(-2147483648);
      let s3: int = Int.MAX_VALUE;
      expect(new A3(s3).f).assertEqual(2147483647);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_7300
     * @tc.name      testImplicitConversions0073
     * @tc.desc      Call context, constructor, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0073", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: byte = 0b0 as byte;
      expect(new A2(s1).f).assertEqual(0);
      let s2: byte = Byte.MIN_VALUE;
      expect(new A2(s2).f).assertEqual(-128);
      let s3: byte = Byte.MAX_VALUE;
      expect(new A2(s3).f).assertEqual(127);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_7400
     * @tc.name      testImplicitConversions0074
     * @tc.desc      Call context, constructor, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0074", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: short = 0;
      expect(new A(s1).f).assertEqual(0.0);
      let s2: short = Short.MIN_VALUE;
      expect(new A(s2).f).assertEqual(-32768.0);
      let s3: short = Short.MAX_VALUE;
      expect(new A(s3).f).assertEqual(32767.0);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_7500
     * @tc.name      testImplicitConversions0075
     * @tc.desc      Call context, constructor, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0075", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: int = 0;
      expect(new A3(s1).f).assertEqual(0);
      let s2: int = Int.MIN_VALUE;
      expect(new A3(s2).f).assertEqual(-2147483648);
      let s3: int = Int.MAX_VALUE;
      expect(new A3(s3).f).assertEqual(2147483647);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_7600
     * @tc.name      testImplicitConversions0076
     * @tc.desc      Call context, constructor, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0076", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: int = 0;
      expect(new A4(s1).f).assertEqual(0.0f);
      let s2: int = Int.MIN_VALUE;
      expect(new A4(s2).f).assertEqual(-2147483600.0f);
      let s3: int = Int.MAX_VALUE;
      expect(new A4(s3).f).assertEqual(2147483600.0f);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_7700
     * @tc.name      testImplicitConversions0077
     * @tc.desc      Call context, constructor, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0077", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: int = 0;
      expect(new A5(s1).f).assertEqual(0.0);
      let s2: int = Int.MIN_VALUE;
      expect(new A5(s2).f).assertEqual(-2147483648.0);
      let s3: int = Int.MAX_VALUE;
      expect(new A5(s3).f).assertEqual(2147483647.0);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_7800
     * @tc.name      testImplicitConversions0078
     * @tc.desc      Call context, constructor, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0078", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: int = 0;
      expect(new A(s1).f).assertEqual(0.0);
      let s2: int = Int.MIN_VALUE;
      expect(new A(s2).f).assertEqual(-2147483648.0);
      let s3: int = Int.MAX_VALUE;
      expect(new A(s3).f).assertEqual(2147483647.0);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_7900
     * @tc.name      testImplicitConversions0079
     * @tc.desc      Call context, constructor, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0079", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: long = 0;
      expect(new A4(s1).f).assertEqual(0.0f);
      let s2: long = Long.MIN_VALUE;
      expect(new A4(s2).f).assertEqual(-9223372000000000000.0f);
      let s3: long = Long.MAX_VALUE;
      expect(new A4(s3).f).assertEqual(9223372000000000000.0f);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_8000
     * @tc.name      testImplicitConversions0080
     * @tc.desc      Call context, constructor, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0080", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: long = 0;
      expect(new A5(s1).f).assertEqual(0.0);
      let s2: long = Long.MIN_VALUE;
      expect(new A5(s2).f).assertEqual(-9.223372036854776e+18);
      let s3: long = Long.MAX_VALUE;
      expect(new A5(s3).f).assertEqual(9.223372036854776e+18);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_8100
     * @tc.name      testImplicitConversions0081
     * @tc.desc      Call context, constructor, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0081", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: long = 0;
      expect(new A(s1).f).assertEqual(0.0);
      let s2: long = Long.MIN_VALUE;
      expect(new A(s2).f).assertEqual(-9.223372036854776e+18);
      let s3: long = Long.MAX_VALUE;
      expect(new A(s3).f).assertEqual(9.223372036854776e+18);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_8200
     * @tc.name      testImplicitConversions0082
     * @tc.desc      Call context, constructor, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0082", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: float = +0.0f;
      expect(new A5(s1).f).assertEqual(0.0);
      let s2: float = -0.0f;
      expect(new A5(s2).f).assertEqual(-0.0);
      let s3: float = 3.4028234663852886e38f;
      expect(new A5(s3).f).assertEqual(3.4028234663852886e38);
      let s4: float = 1.401298464324817e-45f;
      expect(new A5(s4).f).assertEqual(1.401298464324817e-45);
      let s5: float = -3.4028234663852886e38f;
      expect(new A5(s5).f).assertEqual(-3.4028234663852886e38);
      let s6: float = -1.401298464324817e-45f;
      expect(new A5(s6).f).assertEqual(-1.401298464324817e-45);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_8300
     * @tc.name      testImplicitConversions0083
     * @tc.desc      Call context, constructor, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0083", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: Color = Color.Red;
      expect(new A2(s1).f).assertEqual(0);
      let s2: Color = Color.Green;
      expect(new A2(s2).f).assertEqual(1);
      let s3: Color = Color.Blue;
      expect(new A2(s3).f).assertEqual(2);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_8400
     * @tc.name      testImplicitConversions0084
     * @tc.desc      Call context, constructor, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0084", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: byte = 0b0 as byte;
      expect(new A3(s1).f).assertEqual(0);
      let s2: byte = Byte.MIN_VALUE;
      expect(new A3(s2).f).assertEqual(-128);
      let s3: byte = Byte.MAX_VALUE;
      expect(new A3(s3).f).assertEqual(127);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_8500
     * @tc.name      testImplicitConversions0085
     * @tc.desc      Call context, constructor, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0085", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: Color1 = Color1.Red;
      expect(new A3(s1).f).assertEqual(100);
      let s2: Color1 = Color1.Green;
      expect(new A3(s2).f).assertEqual(200);
      let s3: Color1 = Color1.Blue;
      expect(new A3(s3).f).assertEqual(300);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_8600
     * @tc.name      testImplicitConversions0086
     * @tc.desc      Call context, constructor, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0086", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: Color2 = Color2.Red;
      expect(new A4(s1).f).assertEqual(10.0f);
      let s2: Color2 = Color2.Green;
      expect(new A4(s2).f).assertEqual(20.0f);
      let s3: Color2 = Color2.Blue;
      expect(new A4(s3).f).assertEqual(30.0f);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_8700
     * @tc.name      testImplicitConversions0087
     * @tc.desc      Call context, constructor, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0087", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: Color3 = Color3.Red;
      expect(new A5(s1).f).assertEqual(10001.0);
      let s2: Color3 = Color3.Green;
      expect(new A5(s2).f).assertEqual(10002.0);
      let s3: Color3 = Color3.Blue;
      expect(new A5(s3).f).assertEqual(10003.0);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_8800
     * @tc.name      testImplicitConversions0088
     * @tc.desc      Call context, constructor, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0088", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: Color5 = Color5.Red;
      expect(new A5(s1).f).assertEqual(3000000001.0);
      let s2: Color5 = Color5.Green;
      expect(new A5(s2).f).assertEqual(3000000002.0);
      let s3: Color5 = Color5.Blue;
      expect(new A5(s3).f).assertEqual(3000000003.0);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_8900
     * @tc.name      testImplicitConversions0089
     * @tc.desc      Call context, constructor, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0089", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: byte = 0b0 as byte;
      expect(new A4(s1).f).assertEqual(0.0f);
      let s2: byte = Byte.MIN_VALUE;
      expect(new A4(s2).f).assertEqual(-128.0f);
      let s3: byte = Byte.MAX_VALUE;
      expect(new A4(s3).f).assertEqual(127.0f);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_9000
     * @tc.name      testImplicitConversions0090
     * @tc.desc      Call context, constructor, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0090", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: byte = 0b0 as byte;
      expect(new A5(s1).f).assertEqual(0.0);
      let s2: byte = Byte.MIN_VALUE;
      expect(new A5(s2).f).assertEqual(-128.0);
      let s3: byte = Byte.MAX_VALUE;
      expect(new A5(s3).f).assertEqual(127.0);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_9100
     * @tc.name      testImplicitConversions0091
     * @tc.desc      Call context, constructor, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0091", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: byte = 0b0 as byte;
      expect(new A(s1).f).assertEqual(0.0);
      let s2: byte = Byte.MIN_VALUE;
      expect(new A(s2).f).assertEqual(-128.0);
      let s3: byte = Byte.MAX_VALUE;
      expect(new A(s3).f).assertEqual(127.0);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_9200
     * @tc.name      testImplicitConversions0092
     * @tc.desc      Call context, constructor, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0092", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: short = 0;
      expect(new A2(s1).f).assertEqual(0);
      let s2: short = Short.MIN_VALUE;
      expect(new A2(s2).f).assertEqual(-32768);
      let s3: short = Short.MAX_VALUE;
      expect(new A2(s3).f).assertEqual(32767);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_9300
     * @tc.name      testImplicitConversions0093
     * @tc.desc      Call context, constructor, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0093", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: short = 0;
      expect(new A3(s1).f).assertEqual(0);
      let s2: short = Short.MIN_VALUE;
      expect(new A3(s2).f).assertEqual(-32768);
      let s3: short = Short.MAX_VALUE;
      expect(new A3(s3).f).assertEqual(32767);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_9400
     * @tc.name      testImplicitConversions0094
     * @tc.desc      Call context, constructor, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0094", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: short = 0;
      expect(new A4(s1).f).assertEqual(0.0f);
      let s2: short = Short.MIN_VALUE;
      expect(new A4(s2).f).assertEqual(-32_768.0f);
      let s3: short = Short.MAX_VALUE;
      expect(new A4(s3).f).assertEqual(32_767.0f);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_9500
     * @tc.name      testImplicitConversions0095
     * @tc.desc      Call context, constructor, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0095", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: short = 0;
      expect(new A5(s1).f).assertEqual(0.0);
      let s2: short = Short.MIN_VALUE;
      expect(new A5(s2).f).assertEqual(-32768.0);
      let s3: short = Short.MAX_VALUE;
      expect(new A5(s3).f).assertEqual(32767.0);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_9600
     * @tc.name      testImplicitConversions0096
     * @tc.desc      Call context, function, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0096", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(foo3(0 as byte)).assertEqual(0);
      expect(foo3(Byte.MIN_VALUE)).assertEqual(-128);
      expect(foo3(Byte.MAX_VALUE)).assertEqual(127);
      expect(foo3(-128 as byte)).assertEqual(-128);
      expect(foo3(127 as byte)).assertEqual(127);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_9700
     * @tc.name      testImplicitConversions0097
     * @tc.desc      Call context, function, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0097", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(foo4(0)).assertEqual(0);
      expect(foo4(Short.MIN_VALUE)).assertEqual(-32768);
      expect(foo4(Short.MAX_VALUE)).assertEqual(32767);
      expect(foo4(-32768)).assertEqual(-32768);
      expect(foo4(32767)).assertEqual(32767);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_9800
     * @tc.name      testImplicitConversions0098
     * @tc.desc      Call context, function, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0098", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(foo5(0)).assertEqual(0);
      expect(foo5(Int.MIN_VALUE)).assertEqual(-2147483648);
      expect(foo5(Int.MAX_VALUE)).assertEqual(2147483647);
      expect(foo5(-2147483648)).assertEqual(-2147483648);
      expect(foo5(2147483647)).assertEqual(2147483647);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_9900
     * @tc.name      testImplicitConversions0099
     * @tc.desc      Call context, function, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0099", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(foo6(0)).assertEqual(0);
      expect(foo6(Long.MIN_VALUE)).assertEqual(-9223372036854775808);
      expect(foo6(Long.MAX_VALUE)).assertEqual(9223372036854775807);
      expect(foo6(-9223372036854775808)).assertEqual(-9223372036854775808);
      expect(foo6(9223372036854775807)).assertEqual(9223372036854775807);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_10000
     * @tc.name      testImplicitConversions0100
     * @tc.desc      Call context, function, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(foo7(+0.0f)).assertEqual(+0.0f);
      expect(foo7(-0.0f)).assertEqual(-0.0f);
      expect(foo7(3.4028234663852886e38f)).assertEqual(3.4028234663852886e38f);
      expect(foo7(1.401298464324817e-45f)).assertEqual(1.401298464324817e-45f);
      expect(foo7(-3.4028234663852886e38f)).assertEqual(-3.4028234663852886e38f);
      expect(foo7(-1.401298464324817e-45f)).assertEqual(-1.401298464324817e-45f);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_10100
     * @tc.name      testImplicitConversions0101
     * @tc.desc      Call context, function, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0101", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: short = 0;
      expect(foo7(s1)).assertEqual(0.0f);
      let s2: short = Short.MIN_VALUE;
      expect(foo7(s2)).assertEqual(-32_768.0f);
      let s3: short = Short.MAX_VALUE;
      expect(foo7(s3)).assertEqual(32_767.0f);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_10200
     * @tc.name      testImplicitConversions0102
     * @tc.desc      Call context, function, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0102", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: short = 0;
      expect(foo8(s1)).assertEqual(0.0);
      let s2: short = Short.MIN_VALUE;
      expect(foo8(s2)).assertEqual(-32768.0);
      let s3: short = Short.MAX_VALUE;
      expect(foo8(s3)).assertEqual(32767.0);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_10300
     * @tc.name      testImplicitConversions0103
     * @tc.desc      Call context, function, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0103", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: short = 0;
      expect(foo(s1)).assertEqual(0.0);
      let s2: short = Short.MIN_VALUE;
      expect(foo(s2)).assertEqual(-32768.0);
      let s3: short = Short.MAX_VALUE;
      expect(foo(s3)).assertEqual(32767.0);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_10400
     * @tc.name      testImplicitConversions0104
     * @tc.desc      Call context, function, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0104", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: int = 0;
      expect(foo7(s1)).assertEqual(0.0f);
      let s2: int = Int.MIN_VALUE;
      expect(foo7(s2)).assertEqual(-2147483600.0f);
      let s3: int = Int.MAX_VALUE;
      expect(foo7(s3)).assertEqual(2147483600.0f);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_10500
     * @tc.name      testImplicitConversions0105
     * @tc.desc      Call context, function, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0105", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: int = 0;
      expect(foo8(s1)).assertEqual(0.0);
      let s2: int = Int.MIN_VALUE;
      expect(foo8(s2)).assertEqual(-2147483648.0);
      let s3: int = Int.MAX_VALUE;
      expect(foo8(s3)).assertEqual(2147483647.0);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_10600
     * @tc.name      testImplicitConversions0106
     * @tc.desc      Call context, function, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0106", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: int = 0;
      expect(foo(s1)).assertEqual(0.0);
      let s2: int = Int.MIN_VALUE;
      expect(foo(s2)).assertEqual(-2147483648.0);
      let s3: int = Int.MAX_VALUE;
      expect(foo(s3)).assertEqual(2147483647.0);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_10700
     * @tc.name      testImplicitConversions0107
     * @tc.desc      Call context, function, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0107", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: long = 0;
      expect(foo7(s1)).assertEqual(0.0f);
      let s2: long = Long.MIN_VALUE;
      expect(foo7(s2)).assertEqual(-9223372000000000000.0f);
      let s3: long = Long.MAX_VALUE;
      expect(foo7(s3)).assertEqual(9223372000000000000.0f);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_10800
     * @tc.name      testImplicitConversions0108
     * @tc.desc      Call context, function, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0108", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: long = 0;
      expect(foo8(s1)).assertEqual(0.0);
      let s2: long = Long.MIN_VALUE;
      expect(foo8(s2)).assertEqual(-9.223372036854776e+18);
      let s3: long = Long.MAX_VALUE;
      expect(foo8(s3)).assertEqual(9.223372036854776e+18);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_10900
     * @tc.name      testImplicitConversions0109
     * @tc.desc      Call context, function, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0109", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: long = 0;
      expect(foo(s1)).assertEqual(0.0);
      let s2: long = Long.MIN_VALUE;
      expect(foo(s2)).assertEqual(-9.223372036854776e+18);
      let s3: long = Long.MAX_VALUE;
      expect(foo(s3)).assertEqual(9.223372036854776e+18);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_11000
     * @tc.name      testImplicitConversions0110
     * @tc.desc      Composite context, interface field, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0110", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: Color5 = Color5.Red;
      let s2: Color5 = Color5.Green;
      let s3: Color5 = Color5.Blue;
      let d1: J1 = { fld: s1 };
      expect(d1.fld).assertEqual(3000000001.0);
      let d2: J2 = { fld: s2 };
      expect(d2.fld).assertEqual(3000000002.0);
      let d3: J3 = { fld: s3 };
      expect(d3.fld).assertEqual(3000000003.0);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_11100
     * @tc.name      testImplicitConversions0111
     * @tc.desc      Composite context, interface field, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0111", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: Color5 = Color5.Red;
      let s2: Color5 = Color5.Green;
      let s3: Color5 = Color5.Blue;
      let d1: J4 = { fld: s1 };
      expect(d1.fld).assertEqual(3000000001.0);
      let d2: J5 = { fld: s2 };
      expect(d2.fld).assertEqual(3000000002.0);
      let d3: J6 = { fld: s3 };
      expect(d3.fld).assertEqual(3000000003.0);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_11200
     * @tc.name      testImplicitConversions0112
     * @tc.desc      Composite context, interface field, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0112", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: byte = 0b0 as byte;
      let s2: byte = Byte.MIN_VALUE;
      let s3: byte = Byte.MAX_VALUE;
      let d1: J7 = { fld: s1 };
      expect(d1.fld).assertEqual(0.0f);
      let d2: J8 = { fld: s2 };
      expect(d2.fld).assertEqual(-128.0f);
      let d3: J9 = { fld: s3 };
      expect(d3.fld).assertEqual(127.0f);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_11300
     * @tc.name      testImplicitConversions0113
     * @tc.desc      Composite context, interface field, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0113", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: byte = 0b0 as byte;
      let s2: byte = Byte.MIN_VALUE;
      let s3: byte = Byte.MAX_VALUE;
      let d1: J1 = { fld: s1 };
      expect(d1.fld).assertEqual(0.0);
      let d2: J2 = { fld: s2 };
      expect(d2.fld).assertEqual(-128.0);
      let d3: J3 = { fld: s3 };
      expect(d3.fld).assertEqual(127.0);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_11400
     * @tc.name      testImplicitConversions0114
     * @tc.desc      Composite context, interface field, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0114", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: byte = 0b0 as byte;
      let s2: byte = Byte.MIN_VALUE;
      let s3: byte = Byte.MAX_VALUE;
      let d1: J4 = { fld: s1 };
      expect(d1.fld).assertEqual(0.0);
      let d2: J5 = { fld: s2 };
      expect(d2.fld).assertEqual(-128.0);
      let d3: J6 = { fld: s3 };
      expect(d3.fld).assertEqual(127.0);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_11500
     * @tc.name      testImplicitConversions0115
     * @tc.desc      Composite context, interface field, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0115", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: byte = 0b0 as byte;
      let s2: byte = Byte.MIN_VALUE;
      let s3: byte = Byte.MAX_VALUE;
      let d1: J10 = { fld: Byte.toChar(s1) };
      expect(d1.fld).assertEqual(c'\u0000');
      let d2: J11 = { fld: Byte.toChar(s2) };
      expect(d2.fld).assertEqual(c'\uFF80');
      let d3: J12 = { fld: Byte.toChar(s3) };
      expect(d3.fld).assertEqual(c'\u007F');
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_11600
     * @tc.name      testImplicitConversions0116
     * @tc.desc      Composite context, interface field, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0116", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: short = 0;
      let s2: short = Short.MIN_VALUE;
      let s3: short = Short.MAX_VALUE;
      let d1: J13 = { fld: s1 };
      expect(d1.fld).assertEqual(0);
      let d2: J14 = { fld: s2 };
      expect(d2.fld).assertEqual(-32768);
      let d3: J15 = { fld: s3 };
      expect(d3.fld).assertEqual(32767);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_11700
     * @tc.name      testImplicitConversions0117
     * @tc.desc      Composite context, interface field, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0117", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: short = 0;
      let s2: short = Short.MIN_VALUE;
      let s3: short = Short.MAX_VALUE;
      let d1: J16 = { fld: s1 };
      expect(d1.fld).assertEqual(0);
      let d2: J17 = { fld: s2 };
      expect(d2.fld).assertEqual(-32768);
      let d3: J18 = { fld: s3 };
      expect(d3.fld).assertEqual(32767);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_11800
     * @tc.name      testImplicitConversions0118
     * @tc.desc      Composite context, interface field, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0118", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: short = 0;
      let s2: short = Short.MIN_VALUE;
      let s3: short = Short.MAX_VALUE;
      let d1: J7 = { fld: s1 };
      expect(d1.fld).assertEqual(0.0f);
      let d2: J8 = { fld: s2 };
      expect(d2.fld).assertEqual(-32_768.0f);
      let d3: J9 = { fld: s3 };
      expect(d3.fld).assertEqual(32_767.0f);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_11900
     * @tc.name      testImplicitConversions0119
     * @tc.desc      Composite context, interface field, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0119", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: short = 0;
      let s2: short = Short.MIN_VALUE;
      let s3: short = Short.MAX_VALUE;
      let d1: J1 = { fld: s1 };
      expect(d1.fld).assertEqual(0.0);
      let d2: J2 = { fld: s2 };
      expect(d2.fld).assertEqual(-32768.0);
      let d3: J3 = { fld: s3 };
      expect(d3.fld).assertEqual(32767.0);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_12000
     * @tc.name      testImplicitConversions0120
     * @tc.desc      Declaration context, constant declaration, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0120", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d1: byte = 0 as byte;
      expect(d1).assertEqual(0);
      const d2: byte = Byte.MIN_VALUE;
      expect(d2).assertEqual(-128);
      const d3: byte = Byte.MAX_VALUE;
      expect(d3).assertEqual(127);
      const d4: byte = -128 as byte;
      expect(d4).assertEqual(-128);
      const d5: byte = 127 as byte;
      expect(d5).assertEqual(127);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_12100
     * @tc.name      testImplicitConversions0121
     * @tc.desc      Declaration context, constant declaration, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0121", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d1: short = 0;
      expect(d1).assertEqual(0);
      const d2: short = Short.MIN_VALUE;
      expect(d2).assertEqual(-32768);
      const d3: short = Short.MAX_VALUE;
      expect(d3).assertEqual(32767);
      const d4: short = -32768;
      expect(d4).assertEqual(-32768);
      const d5: short = 32767;
      expect(d5).assertEqual(32767);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_12200
     * @tc.name      testImplicitConversions0122
     * @tc.desc      Declaration context, constant declaration, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0122", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d1: int = 0;
      expect(d1).assertEqual(0);
      const d2: int = Int.MIN_VALUE;
      expect(d2).assertEqual(-2147483648);
      const d3: int = Int.MAX_VALUE;
      expect(d3).assertEqual(2147483647);
      const d4: int = -2147483648;
      expect(d4).assertEqual(-2147483648);
      const d5: int = 2147483647;
      expect(d5).assertEqual(2147483647);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_12300
     * @tc.name      testImplicitConversions0123
     * @tc.desc      Declaration context, constant declaration, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0123", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d1: long = 0;
      expect(d1).assertEqual(0);
      const d2: long = Long.MIN_VALUE;
      expect(d2).assertEqual(-9223372036854775808);
      const d3: long = Long.MAX_VALUE;
      expect(d3).assertEqual(9223372036854775807);
      const d4: long = -9223372036854775808;
      expect(d4).assertEqual(-9223372036854775808);
      const d5: long = 9223372036854775807;
      expect(d5).assertEqual(9223372036854775807);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_12400
     * @tc.name      testImplicitConversions0124
     * @tc.desc      Declaration context, constant declaration, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0124", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d1: float = +0.0f;
      expect(d1).assertEqual(+0.0f);
      const d2: float = -0.0f;
      expect(d2).assertEqual(-0.0f);
      const d3: float = 3.4028234663852886e38f;
      expect(d3).assertEqual(3.4028234663852886e38f);
      const d4: float = 1.401298464324817e-45f;
      expect(d4).assertEqual(1.401298464324817e-45f);
      const d5: float = -3.4028234663852886e38f;
      expect(d5).assertEqual(-3.4028234663852886e38f);
      const d6: float = -1.401298464324817e-45f;
      expect(d6).assertEqual(-1.401298464324817e-45f);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_12500
     * @tc.name      testImplicitConversions0125
     * @tc.desc      Declaration context, constant declaration, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0125", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d1: double = 0.0;
      expect(d1).assertEqual(0.0);
      const d2: double = -0.0;
      expect(d2).assertEqual(-0.0);
      const d3: double = 3.4028234663852886e38;
      expect(d3).assertEqual(3.4028234663852886e38);
      const d4: double = 1.401298464324817e-45;
      expect(d4).assertEqual(1.401298464324817e-45);
      const d5: double = -3.4028234663852886e38;
      expect(d5).assertEqual(-3.4028234663852886e38);
      const d6: double = -1.401298464324817e-45;
      expect(d6).assertEqual(-1.401298464324817e-45);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_12600
     * @tc.name      testImplicitConversions0126
     * @tc.desc      Declaration context, constant declaration, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0126", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d1: string = '\u0000';
      expect(d1.charCodeAt(0)).assertEqual(0);
      const d2: string = '\u0FFF';
      expect(d2.charCodeAt(0)).assertEqual(4095);
      const d3: string = '\uFFFF';
      expect(d3.charCodeAt(0)).assertEqual(65535);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_12700
     * @tc.name      testImplicitConversions0127
     * @tc.desc      Declaration context, constant declaration, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0127", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d1: short = 0 as byte;
      expect(d1).assertEqual(0);
      const d2: short = Byte.MIN_VALUE;
      expect(d2).assertEqual(-128);
      const d3: short = Byte.MAX_VALUE;
      expect(d3).assertEqual(127);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_12800
     * @tc.name      testImplicitConversions0128
     * @tc.desc      Declaration context, constant declaration, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0128", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d1: int = 0 as byte;
      expect(d1).assertEqual(0);
      const d2: int = Byte.MIN_VALUE;
      expect(d2).assertEqual(-128);
      const d3: int = Byte.MAX_VALUE;
      expect(d3).assertEqual(127);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_12900
     * @tc.name      testImplicitConversions0129
     * @tc.desc      Declaration context, constant declaration, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0129", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d1: long = 0 as byte;
      expect(d1).assertEqual(0);
      const d2: long = Byte.MIN_VALUE;
      expect(d2).assertEqual(-128);
      const d3: long = Byte.MAX_VALUE;
      expect(d3).assertEqual(127);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_13000
     * @tc.name      testImplicitConversions0130
     * @tc.desc      Declaration context, constant declaration, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0130", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d1: float = 0 as byte;
      expect(d1).assertEqual(0.0f);
      const d2: float = Byte.MIN_VALUE;
      expect(d2).assertEqual(-128.0f);
      const d3: float = Byte.MAX_VALUE;
      expect(d3).assertEqual(127.0f);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_13100
     * @tc.name      testImplicitConversions0131
     * @tc.desc      Declaration context, constant declaration, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0131", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d1: double = 0 as byte;
      expect(d1).assertEqual(0.0);
      const d2: double = Byte.MIN_VALUE;
      expect(d2).assertEqual(-128.0);
      const d3: double = Byte.MAX_VALUE;
      expect(d3).assertEqual(127.0);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_13200
     * @tc.name      testImplicitConversions0132
     * @tc.desc      Declaration context, constant declaration, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0132", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d1: number = 0 as byte;
      expect(d1).assertEqual(0.0);
      const d2: number = Byte.MIN_VALUE;
      expect(d2).assertEqual(-128.0);
      const d3: number = Byte.MAX_VALUE;
      expect(d3).assertEqual(127.0);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_13300
     * @tc.name      testImplicitConversions0133
     * @tc.desc      Declaration context, constant declaration, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0133", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d1: int = 0 as short;
      expect(d1).assertEqual(0);
      const d2: int = Short.MIN_VALUE;
      expect(d2).assertEqual(-32768);
      const d3: int = Short.MAX_VALUE;
      expect(d3).assertEqual(32767);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_13400
     * @tc.name      testImplicitConversions0134
     * @tc.desc      Declaration context, constant declaration, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0134", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d1: long = 0 as short;
      expect(d1).assertEqual(0);
      const d2: long = Short.MIN_VALUE;
      expect(d2).assertEqual(-32768);
      const d3: long = Short.MAX_VALUE;
      expect(d3).assertEqual(32767);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_13500
     * @tc.name      testImplicitConversions0135
     * @tc.desc      Declaration context, constant declaration, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0135", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d1: float = 0 as short;
      expect(d1).assertEqual(0.0f);
      const d2: float = Short.MIN_VALUE;
      expect(d2).assertEqual(-32_768.0f);
      const d3: float = Short.MAX_VALUE;
      expect(d3).assertEqual(32_767.0f);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_13600
     * @tc.name      testImplicitConversions0136
     * @tc.desc      Declaration context, constant declaration, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0136", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d1: double = 0 as short;
      expect(d1).assertEqual(0.0);
      const d2: double = Short.MIN_VALUE;
      expect(d2).assertEqual(-32768.0);
      const d3: double = Short.MAX_VALUE;
      expect(d3).assertEqual(32767.0);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_13700
     * @tc.name      testImplicitConversions0137
     * @tc.desc      Declaration context, constant declaration, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0137", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d1: number = 0 as short;
      expect(d1).assertEqual(0.0);
      const d2: number = Short.MIN_VALUE;
      expect(d2).assertEqual(-32768.0);
      const d3: number = Short.MAX_VALUE;
      expect(d3).assertEqual(32767.0);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_13800
     * @tc.name      testImplicitConversions0138
     * @tc.desc      Declaration context, constant declaration, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0138", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d1: long = 0 as int;
      expect(d1).assertEqual(0);
      const d2: long = Int.MIN_VALUE;
      expect(d2).assertEqual(-2147483648);
      const d3: long = Int.MAX_VALUE;
      expect(d3).assertEqual(2147483647);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_13900
     * @tc.name      testImplicitConversions0139
     * @tc.desc      Declaration context, constant declaration, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0139", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d1: float = 0 as int;
      expect(d1).assertEqual(0.0f);
      const d2: float = Int.MIN_VALUE;
      expect(d2).assertEqual(-2147483600.0f);
      const d3: float = Int.MAX_VALUE;
      expect(d3).assertEqual(2147483600.0f);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_14000
     * @tc.name      testImplicitConversions0140
     * @tc.desc      Declaration context, constant declaration, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0140", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d1: double = 0 as int;
      expect(d1).assertEqual(0.0);
      const d2: double = Int.MIN_VALUE;
      expect(d2).assertEqual(-2147483648.0);
      const d3: double = Int.MAX_VALUE;
      expect(d3).assertEqual(2147483647.0);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_14100
     * @tc.name      testImplicitConversions0141
     * @tc.desc      Declaration context, constant declaration, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0141", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d1: number = 0 as int;
      expect(d1).assertEqual(0.0);
      const d2: number = Int.MIN_VALUE;
      expect(d2).assertEqual(-2147483648.0);
      const d3: number = Int.MAX_VALUE;
      expect(d3).assertEqual(2147483647.0);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_14200
     * @tc.name      testImplicitConversions0142
     * @tc.desc      Declaration context, constant declaration, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0142", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d1: float = 0 as long;
      expect(d1).assertEqual(0.0f);
      const d2: float = Long.MIN_VALUE;
      expect(d2).assertEqual(-9223372000000000000.0f);
      const d3: float = Long.MAX_VALUE;
      expect(d3).assertEqual(9223372000000000000.0f);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_14300
     * @tc.name      testImplicitConversions0143
     * @tc.desc      Declaration context, constant declaration, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0143", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d1: double = 0 as long;
      expect(d1).assertEqual(0.0);
      const d2: double = Long.MIN_VALUE;
      expect(d2).assertEqual(-9.223372036854776e+18);
      const d3: double = Long.MAX_VALUE;
      expect(d3).assertEqual(9.223372036854776e+18);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_14400
     * @tc.name      testImplicitConversions0144
     * @tc.desc      Declaration context, constant declaration, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0144", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d1: number = 0 as long;
      expect(d1).assertEqual(0.0);
      const d2: number = Long.MIN_VALUE;
      expect(d2).assertEqual(-9.223372036854776e+18);
      const d3: number = Long.MAX_VALUE;
      expect(d3).assertEqual(9.223372036854776e+18);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_14500
     * @tc.name      testImplicitConversions0145
     * @tc.desc      Declaration context, constant declaration, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0145", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d1: double = +0.0f;
      expect(d1).assertEqual(0.0);
      const d2: double = -0.0f;
      expect(d2).assertEqual(-0.0);
      const d3: double = 3.4028234663852886e38f;
      expect(d3).assertEqual(3.4028234663852886e38);
      const d4: double = 1.401298464324817e-45f;
      expect(d4).assertEqual(1.401298464324817e-45);
      const d5: double = -3.4028234663852886e38f;
      expect(d5).assertEqual(-3.4028234663852886e38);
      const d6: double = -1.401298464324817e-45f;
      expect(d6).assertEqual(-1.401298464324817e-45);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_14600
     * @tc.name      testImplicitConversions0146
     * @tc.desc      Declaration context, constant declaration, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0146", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d1: int = Color.Red;
      expect(d1).assertEqual(0);
      const d2: int = Color.Green;
      expect(d2).assertEqual(1);
      const d3: int = Color.Blue;
      expect(d3).assertEqual(2);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_14700
     * @tc.name      testImplicitConversions0147
     * @tc.desc      Declaration context, constant declaration, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0147", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d1: long = Color1.Red;
      expect(d1).assertEqual(100);
      const d2: long = Color1.Green;
      expect(d2).assertEqual(200);
      const d3: long = Color1.Blue;
      expect(d3).assertEqual(300);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_14800
     * @tc.name      testImplicitConversions0148
     * @tc.desc      Declaration context, constant declaration, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0148", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d1: float = Color2.Red;
      expect(d1).assertEqual(10.0f);
      const d2: float = Color2.Green;
      expect(d2).assertEqual(20.0f);
      const d3: float = Color2.Blue;
      expect(d3).assertEqual(30.0f);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_14900
     * @tc.name      testImplicitConversions0149
     * @tc.desc      Declaration context, constant declaration, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0149", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d1: double = Color3.Red;
      expect(d1).assertEqual(10001.0);
      const d2: double = Color3.Green;
      expect(d2).assertEqual(10002.0);
      const d3: double = Color3.Blue;
      expect(d3).assertEqual(10003.0);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_15000
     * @tc.name      testImplicitConversions0150
     * @tc.desc      Declaration context, constant declaration, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0150", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d1: number = Color4.Red;
      expect(d1).assertEqual(20001.0);
      const d2: number = Color4.Green;
      expect(d2).assertEqual(20002.0);
      const d3: number = Color4.Blue;
      expect(d3).assertEqual(20003.0);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_15100
     * @tc.name      testImplicitConversions0151
     * @tc.desc      Declaration context, instance field declaration, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0151", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a1: A6 = new A6();
      expect(a1.d).assertEqual(0);
      let a2: A7 = new A7();
      expect(a2.d).assertEqual(-128);
      let a3: A8 = new A8();
      expect(a3.d).assertEqual(127);
      let a4: A9 = new A9();
      expect(a4.d).assertEqual(-128);
      let a5: A10 = new A10();
      expect(a5.d).assertEqual(127);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_15200
     * @tc.name      testImplicitConversions0152
     * @tc.desc      Declaration context, instance field declaration, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0152", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a1: A11 = new A11();
      expect(a1.d).assertEqual(0);
      let a2: A12 = new A12();
      expect(a2.d).assertEqual(-32768);
      let a3: A13 = new A13();
      expect(a3.d).assertEqual(32767);
      let a4: A14 = new A14();
      expect(a4.d).assertEqual(-32768);
      let a5: A15 = new A15();
      expect(a5.d).assertEqual(32767);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_15300
     * @tc.name      testImplicitConversions0153
     * @tc.desc      Declaration context, instance field declaration, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0153", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a1: A16 = new A16();
      expect(a1.d).assertEqual(0);
      let a2: A17 = new A17();
      expect(a2.d).assertEqual(-2147483648);
      let a3: A18 = new A18();
      expect(a3.d).assertEqual(2147483647);
      let a4: A19 = new A19();
      expect(a4.d).assertEqual(-2147483648);
      let a5: A20 = new A20();
      expect(a5.d).assertEqual(2147483647);
    });

  })
}