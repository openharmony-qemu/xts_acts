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

class Base_F001 {
  static field: Any
  static {
    Base_F001.field = null
  }
}

class A_F001 extends Base_F001 {
  static field: Any
  static {
    A_F001.field = 7
  }
}

class Base_F002 {
  static field: Object
  static {
    Base_F002.field = 5
  }
}

class A_F002 extends Base_F002 {
  static field: Object
  static {
    A_F002.field = "abc"
  }
}

class Base_F003 {
  static field: number
  static {
    Base_F003.field = 3
  }
}

class A_F003 extends Base_F003 {
  static field: number
  static {
    A_F003.field = 6.7
  }
}

class Base_F004 {
  static field: double
  static {
    Base_F004.field = 3.4
  }
}

class A_F004 extends Base_F004 {
  static field: double
  static {
    A_F004.field = 5.0
  }
}

class Base_F005 {
  static field: float
  static {
    Base_F005.field = 6.7f
  }
}

class A_F005 extends Base_F005 {
  static field: float
  static {
    A_F005.field = 7.3f
  }
}

class Base_F006 {
  static field: long
  static {
    Base_F006.field = 9223372036854775807
  }
}

class A_F006 extends Base_F006 {
  static field: long
  static {
    A_F006.field = 78945
  }
}

class Base_F007 {
  static field: int
  static {
    Base_F007.field = 123
  }
}

class A_F007 extends Base_F007 {
  static field: int
  static {
    A_F007.field = 321
  }
}

class Base_F008 {
  static field: short
  static {
    Base_F008.field = 325
  }
}

class A_F008 extends Base_F008 {
  static field: short
  static {
    A_F008.field = 253
  }
}

class Base_F009 {
  static field: byte
  static {
    Base_F009.field = 127
  }
}

class A_F009 extends Base_F009 {
  static field: byte
  static {
    A_F009.field = 78
  }
}

class Base_F010 {
  static field: string
  static {
    Base_F010.field = "abc"
  }
}

class A_F010 extends Base_F010 {
  static field: string
  static {
    A_F010.field = "defg"
  }
}

class Base_F011 {
  static field: bigint
  static {
    Base_F011.field = 12345678901234567890n
  }
}

class A_F011 extends Base_F011 {
  static field: bigint
  static {
    A_F011.field = 5556423623465n
  }
}

class Base_F012 {
  static field: char
  static {
    Base_F012.field = c'\u2028'
  }
}

class A_F012 extends Base_F012 {
  static field: char
  static {
    A_F012.field = c'z'
  }
}

class Base_F013 {
  static field: boolean
  static {
    Base_F013.field = false
  }
}

class A_F013 extends Base_F013 {
  static field: boolean
  static {
    A_F013.field = true
  }
}

class Base_F014 {
  static field: Any
  static {
    Base_F014.field = null
  }
}

class A_F014 extends Base_F014 {
  static field: Any = 7
}

class Base_F015 {
  static field: Object
  static {
    Base_F015.field = 5
  }
}

class A_F015 extends Base_F015 {
  static field: Object = "abc"
}

class Base_F016 {
  static field: number
  static {
    Base_F016.field = 3
  }
}

class A_F016 extends Base_F016 {
  static field: number = 6.7
}

class Base_F017 {
  static field: double
  static {
    Base_F017.field = 3.4
  }
}

class A_F017 extends Base_F017 {
  static field: double = 5.0
}

class Base_F018 {
  static field: float
  static {
    Base_F018.field = 6.7f
  }
}

class A_F018 extends Base_F018 {
  static field: float = 7.3f
}

class Base_F019 {
  static field: long
  static {
    Base_F019.field = 9223372036854775807
  }
}

class A_F019 extends Base_F019 {
  static field: long = 78945
}

class Base_F020 {
  static field: int
  static {
    Base_F020.field = 123
  }
}

class A_F020 extends Base_F020 {
  static field: int = 321
}

class Base_F021 {
  static field: short
  static {
    Base_F021.field = 325
  }
}

class A_F021 extends Base_F021 {
  static field: short = 253
}

class Base_F022 {
  static field: byte
  static {
    Base_F022.field = 127
  }
}

class A_F022 extends Base_F022 {
  static field: byte = 78
}

class Base_F023 {
  static field: string
  static {
    Base_F023.field = "abc"
  }
}

class A_F023 extends Base_F023 {
  static field: string = "defg"
}

class Base_F024 {
  static field: bigint
  static {
    Base_F024.field = 12345678901234567890n
  }
}

class A_F024 extends Base_F024 {
  static field: bigint = 5556423623465n
}

class Base_F025 {
  static field: char
  static {
    Base_F025.field = c'\u2028'
  }
}

class A_F025 extends Base_F025 {
  static field: char = c'z'
}

class Base_F026 {
  static field: boolean
  static {
    Base_F026.field = false
  }
}

class A_F026 extends Base_F026 {
  static field: boolean = true
}

class Base_F027 {
  static field: Any = null
}

class A_F027 extends Base_F027 {
  static field: Any
}

class Base_F028 {
  static field: Object|undefined = 5
}

class A_F028 extends Base_F028 {
  static field: Object|undefined
}

class Base_F029 {
  static field: number = 3
}

class A_F029 extends Base_F029 {
  static field: number
}

class Base_F030 {
  static field: double = 3.4
}

class A_F030 extends Base_F030 {
  static field: double
}

class Base_F031 {
  static field: float = 6.7f
}

class A_F031 extends Base_F031 {
  static field: float
}

class Base_F032 {
  static field: long = 9223372036854775807
}

class A_F032 extends Base_F032 {
  static field: long
}

class Base_F033 {
  static field: int = 123
}

class A_F033 extends Base_F033 {
  static field: int
}

class Base_F034 {
  static field: short = 325
}

class A_F034 extends Base_F034 {
  static field: short
}

class Base_F035 {
  static field: byte = 127
}

class A_F035 extends Base_F035 {
  static field: byte
}

class Base_F036 {
  static field: char = c'\u2028'
}

class A_F036 extends Base_F036 {
  static field: char
}

class Base_F037 {
  static field: boolean = true
}

class A_F037 extends Base_F037 {
  static field: boolean
}

class Base_F038 {
  static field: Any = null
}

class A_F038 extends Base_F038 {
  static field: Any = 7
}

class Base_F039 {
  static field: Object = 5
}

class A_F039 extends Base_F039 {
  static field: Object = "abc"
}

class Base_F040 {
  static field: number = 3
}

class A_F040 extends Base_F040 {
  static field: number = 6.7
}

class Base_F041 {
  static field: double = 3.4
}

class A_F041 extends Base_F041 {
  static field: double = 5.0
}

class Base_F042 {
  static field: float = 6.7f
}

class A_F042 extends Base_F042 {
  static field: float = 7.3f
}

class Base_F043 {
  static field: long = 9223372036854775807
}

class A_F043 extends Base_F043 {
  static field: long = 78945
}

class Base_F044 {
  static field: int = 123
}

class A_F044 extends Base_F044 {
  static field: int = 321
}

class Base_F045 {
  static field: short = 325
}

class A_F045 extends Base_F045 {
  static field: short = 253
}

class Base_F046 {
  static field: byte = 127
}

class A_F046 extends Base_F046 {
  static field: byte = 78
}

class Base_F047 {
  static field: string = "abc"
}

class A_F047 extends Base_F047 {
  static field: string = "defg"
}

class Base_F048 {
  static field: bigint = 12345678901234567890n
}

class A_F048 extends Base_F048 {
  static field: bigint = 5556423623465n
}

class Base_F049 {
  static field: char = c'\u2028'
}

class A_F049 extends Base_F049 {
  static field: char = c'z'
}

class Base_F050 {
  static field: boolean = false
}

class A_F050 extends Base_F050 {
  static field: boolean = true
}

interface I_F051 {
  get prop(): Any
  set prop(x: Any)
}

class A_F051 implements I_F051 {
  prop: Any = null
}

function get_prop(i: I_F051): Any {
  return i.prop
}

function set_prop(i: I_F051, value: Any) {
  i.prop = value
}

interface I_F052 {
  get prop(): Object
  set prop(x: Object)
}

class A_F052 implements I_F052 {
  prop: Object = 5
}

function get_prop(i: I_F052): Object {
  return i.prop
}

function set_prop(i: I_F052, value: Object) {
  i.prop = value
}

interface I_F053 {
  get prop(): number
  set prop(x: number)
}

class A_F053 implements I_F053 {
  prop: number = 3
}

function get_prop(i: I_F053): number {
  return i.prop
}

function set_prop(i: I_F053, value: number) {
  i.prop = value
}

interface I_F054 {
  get prop(): double
  set prop(x: double)
}

class A_F054 implements I_F054 {
  prop: double = 3.4
}

function get_prop(i: I_F054): double {
  return i.prop
}

function set_prop(i: I_F054, value: double) {
  i.prop = value
}

interface I_F055 {
  get prop(): float
  set prop(x: float)
}

class A_F055 implements I_F055 {
  prop: float = 6.7f
}

function get_prop(i: I_F055): float {
  return i.prop
}

function set_prop(i: I_F055, value: float) {
  i.prop = value
}

interface I_F056 {
  get prop(): long
  set prop(x: long)
}

class A_F056 implements I_F056 {
  prop: long = 9223372036854775807
}

function get_prop(i: I_F056): long {
  return i.prop
}

function set_prop(i: I_F056, value: long) {
  i.prop = value
}

interface I_F057 {
  get prop(): int
  set prop(x: int)
}

class A_F057 implements I_F057 {
  prop: int = 123
}

function get_prop(i: I_F057): int {
  return i.prop
}

function set_prop(i: I_F057, value: int) {
  i.prop = value
}

interface I_F058 {
  get prop(): short
  set prop(x: short)
}

class A_F058 implements I_F058 {
  prop: short = 325
}

function get_prop(i: I_F058): short {
  return i.prop
}

function set_prop(i: I_F058, value: short) {
  i.prop = value
}

interface I_F059 {
  get prop(): byte
  set prop(x: byte)
}

class A_F059 implements I_F059 {
  prop: byte = 127
}

function get_prop(i: I_F059): byte {
  return i.prop
}

function set_prop(i: I_F059, value: byte) {
  i.prop = value
}

interface I_F060 {
  get prop(): string
  set prop(x: string)
}

class A_F060 implements I_F060 {
  prop: string = "abc"
}

function get_prop(i: I_F060): string {
  return i.prop
}

function set_prop(i: I_F060, value: string) {
  i.prop = value
}

interface I_F061 {
  get prop(): bigint
  set prop(x: bigint)
}

class A_F061 implements I_F061 {
  prop: bigint = 12345678901234567890n
}

function get_prop(i: I_F061): bigint {
  return i.prop
}

function set_prop(i: I_F061, value: bigint) {
  i.prop = value
}

interface I_F062 {
  get prop(): char
  set prop(x: char)
}

class A_F062 implements I_F062 {
  prop: char = c'\u2028'
}

function get_prop(i: I_F062): char {
  return i.prop
}

function set_prop(i: I_F062, value: char) {
  i.prop = value
}

interface I_F063 {
  get prop(): boolean
  set prop(x: boolean)
}

class A_F063 implements I_F063 {
  prop: boolean = false
}

function get_prop(i: I_F063): boolean {
  return i.prop
}

function set_prop(i: I_F063, value: boolean) {
  i.prop = value
}

interface I_F064 {
  get prop(): Any
}

class A_F064 implements I_F064 {
  prop: Any = null
}

function get_prop(i: I_F064): Any {
  return i.prop
}

interface I_F065 {
  get prop(): Object
}

class A_F065 implements I_F065 {
  prop: Object = 5
}

function get_prop(i: I_F065): Object {
  return i.prop
}

interface I_F066 {
  get prop(): number
}

class A_F066 implements I_F066 {
  prop: number = 3
}

function get_prop(i: I_F066): number {
  return i.prop
}

interface I_F067 {
  get prop(): double
}

class A_F067 implements I_F067 {
  prop: double = 3.4
}

function get_prop(i: I_F067): double {
  return i.prop
}

interface I_F068 {
  get prop(): float
}

class A_F068 implements I_F068 {
  prop: float = 6.7f
}

function get_prop(i: I_F068): float {
  return i.prop
}

interface I_F069 {
  get prop(): long
}

class A_F069 implements I_F069 {
  prop: long = 9223372036854775807
}

function get_prop(i: I_F069): long {
  return i.prop
}

interface I_F070 {
  get prop(): int
}

class A_F070 implements I_F070 {
  prop: int = 123
}

function get_prop(i: I_F070): int {
  return i.prop
}

interface I_F071 {
  get prop(): short
}

class A_F071 implements I_F071 {
  prop: short = 325
}

function get_prop(i: I_F071): short {
  return i.prop
}

interface I_F072 {
  get prop(): byte
}

class A_F072 implements I_F072 {
  prop: byte = 127
}

function get_prop(i: I_F072): byte {
  return i.prop
}

interface I_F073 {
  get prop(): string
}

class A_F073 implements I_F073 {
  prop: string = "abc"
}

function get_prop(i: I_F073): string {
  return i.prop
}

interface I_F074 {
  get prop(): bigint
}

class A_F074 implements I_F074 {
  prop: bigint = 12345678901234567890n
}

function get_prop(i: I_F074): bigint {
  return i.prop
}

interface I_F075 {
  get prop(): char
}

class A_F075 implements I_F075 {
  prop: char = c'\u2028'
}

function get_prop(i: I_F075): char {
  return i.prop
}

interface I_F076 {
  get prop(): boolean
}

class A_F076 implements I_F076 {
  prop: boolean = false
}

function get_prop(i: I_F076): boolean {
  return i.prop
}

interface I_F077 {
  set prop(x: Any)
}

class A_F077 implements I_F077 {
  prop: Any = null
}

function set_prop(i: I_F077, value: Any) {
  i.prop = value
}

interface I_F078 {
  set prop(x: Object)
}

class A_F078 implements I_F078 {
  prop: Object = 5
}

function set_prop(i: I_F078, value: Object) {
  i.prop = value
}

interface I_F079 {
  set prop(x: number)
}

class A_F079 implements I_F079 {
  prop: number = 3
}

function set_prop(i: I_F079, value: number) {
  i.prop = value
}

interface I_F080 {
  set prop(x: double)
}

class A_F080 implements I_F080 {
  prop: double = 3.4
}

function set_prop(i: I_F080, value: double) {
  i.prop = value
}

interface I_F081 {
  set prop(x: float)
}

class A_F081 implements I_F081 {
  prop: float = 6.7f
}

function set_prop(i: I_F081, value: float) {
  i.prop = value
}

interface I_F082 {
  set prop(x: long)
}

class A_F082 implements I_F082 {
  prop: long = 9223372036854775807
}

function set_prop(i: I_F082, value: long) {
  i.prop = value
}

interface I_F083 {
  set prop(x: int)
}

class A_F083 implements I_F083 {
  prop: int = 123
}

function set_prop(i: I_F083, value: int) {
  i.prop = value
}

interface I_F084 {
  set prop(x: short)
}

class A_F084 implements I_F084 {
  prop: short = 325
}

function set_prop(i: I_F084, value: short) {
  i.prop = value
}

interface I_F085 {
  set prop(x: byte)
}

class A_F085 implements I_F085 {
  prop: byte = 127
}

function set_prop(i: I_F085, value: byte) {
  i.prop = value
}

interface I_F086 {
  set prop(x: string)
}

class A_F086 implements I_F086 {
  prop: string = "abc"
}

function set_prop(i: I_F086, value: string) {
  i.prop = value
}

interface I_F087 {
  set prop(x: bigint)
}

class A_F087 implements I_F087 {
  prop: bigint = 12345678901234567890n
}

function set_prop(i: I_F087, value: bigint) {
  i.prop = value
}

interface I_F088 {
  set prop(x: char)
}

class A_F088 implements I_F088 {
  prop: char = c'\u2028'
}

function set_prop(i: I_F088, value: char) {
  i.prop = value
}

interface I_F089 {
  set prop(x: boolean)
}

class A_F089 implements I_F089 {
  prop: boolean = false
}

function set_prop(i: I_F089, value: boolean) {
  i.prop = value
}

interface I_F090 {
  f: Any
}

class Base_F090 implements I_F090 {
  f: Any = null
}

class Derived_F090 extends Base_F090 {
  override f: Any = 7
}

function get_prop(i: I_F090): Any {
  return i.f
}

function set_prop(i: I_F090, value: Any) {
  i.f = value
}

function get_field(a: Base_F090): Any {
  return a.f
}

function set_field(a: Base_F090, value: Any) {
  a.f = value
}

interface I_F091 {
  f: Object
}

class Base_F091 implements I_F091 {
  f: Object = 5
}

class Derived_F091 extends Base_F091 {
  override f: Object = "abc"
}

function get_prop(i: I_F091): Object {
  return i.f
}

function set_prop(i: I_F091, value: Object) {
  i.f = value
}

function get_field(a: Base_F091): Object {
  return a.f
}

function set_field(a: Base_F091, value: Object) {
  a.f = value
}

interface I_F092 {
  f: number
}

class Base_F092 implements I_F092 {
  f: number = 3
}

class Derived_F092 extends Base_F092 {
  override f: number = 6.7
}

function get_prop(i: I_F092): number {
  return i.f
}

function set_prop(i: I_F092, value: number) {
  i.f = value
}

function get_field(a: Base_F092): number {
  return a.f
}

function set_field(a: Base_F092, value: number) {
  a.f = value
}

interface I_F093 {
  f: double
}

class Base_F093 implements I_F093 {
  f: double = 3.4
}

class Derived_F093 extends Base_F093 {
  override f: double = 5.0
}

function get_prop(i: I_F093): double {
  return i.f
}

function set_prop(i: I_F093, value: double) {
  i.f = value
}

function get_field(a: Base_F093): double {
  return a.f
}

function set_field(a: Base_F093, value: double) {
  a.f = value
}

interface I_F094 {
  f: float
}

class Base_F094 implements I_F094 {
  f: float = 6.7f
}

class Derived_F094 extends Base_F094 {
  override f: float = 7.3f
}

function get_prop(i: I_F094): float {
  return i.f
}

function set_prop(i: I_F094, value: float) {
  i.f = value
}

function get_field(a: Base_F094): float {
  return a.f
}

function set_field(a: Base_F094, value: float) {
  a.f = value
}

interface I_F095 {
  f: long
}

class Base_F095 implements I_F095 {
  f: long = 9223372036854775807
}

class Derived_F095 extends Base_F095 {
  override f: long = 78945
}

function get_prop(i: I_F095): long {
  return i.f
}

function set_prop(i: I_F095, value: long) {
  i.f = value
}

function get_field(a: Base_F095): long {
  return a.f
}

function set_field(a: Base_F095, value: long) {
  a.f = value
}

interface I_F096 {
  f: int
}

class Base_F096 implements I_F096 {
  f: int = 123
}

class Derived_F096 extends Base_F096 {
  override f: int = 321
}

function get_prop(i: I_F096): int {
  return i.f
}

function set_prop(i: I_F096, value: int) {
  i.f = value
}

function get_field(a: Base_F096): int {
  return a.f
}

function set_field(a: Base_F096, value: int) {
  a.f = value
}

interface I_F097 {
  f: short
}

class Base_F097 implements I_F097 {
  f: short = 325
}

class Derived_F097 extends Base_F097 {
  override f: short = 253
}

function get_prop(i: I_F097): short {
  return i.f
}

function set_prop(i: I_F097, value: short) {
  i.f = value
}

function get_field(a: Base_F097): short {
  return a.f
}

function set_field(a: Base_F097, value: short) {
  a.f = value
}

interface I_F098 {
  f: byte
}

class Base_F098 implements I_F098 {
  f: byte = 127
}

class Derived_F098 extends Base_F098 {
  override f: byte = 78
}

function get_prop(i: I_F098): byte {
  return i.f
}

function set_prop(i: I_F098, value: byte) {
  i.f = value
}

function get_field(a: Base_F098): byte {
  return a.f
}

function set_field(a: Base_F098, value: byte) {
  a.f = value
}

interface I_F099 {
  f: string
}

class Base_F099 implements I_F099 {
  f: string = "abc"
}

class Derived_F099 extends Base_F099 {
  override f: string = "defg"
}

function get_prop(i: I_F099): string {
  return i.f
}

function set_prop(i: I_F099, value: string) {
  i.f = value
}

function get_field(a: Base_F099): string {
  return a.f
}

function set_field(a: Base_F099, value: string) {
  a.f = value
}

export default function OverridingFieldsTest(): void {
  describe("OverridingFieldsTest", () => {
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
     * @tc.number    SUB_OVERRIDING_FIELDS_TEST_0001
     * @tc.name      testOverridingFields0001
     * @tc.desc      Checking static field declaration in derived class with same name and same type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverridingFields0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F001.field instanceof Any).assertTrue()
        expect(A_F001.field).assertEqual(7)
        expect(Base_F001.field instanceof Any).assertTrue()
        expect(Base_F001.field).assertEqual(null)
    })

    /**
     * @tc.number    SUB_OVERRIDING_FIELDS_TEST_0002
     * @tc.name      testOverridingFields0002
     * @tc.desc      Checking static field declaration in derived class with same name and same type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverridingFields0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F002.field instanceof Object).assertTrue()
        expect(A_F002.field).assertEqual("abc")
        expect(Base_F002.field instanceof Object).assertTrue()
        expect(Base_F002.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_OVERRIDING_FIELDS_TEST_0003
     * @tc.name      testOverridingFields0003
     * @tc.desc      Checking static field declaration in derived class with same name and same type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverridingFields0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F003.field instanceof number).assertTrue()
        expect(A_F003.field).assertEqual(6.7)
        expect(Base_F003.field instanceof number).assertTrue()
        expect(Base_F003.field).assertEqual(3)
    })

    /**
     * @tc.number    SUB_OVERRIDING_FIELDS_TEST_0004
     * @tc.name      testOverridingFields0004
     * @tc.desc      Checking static field declaration in derived class with same name and same type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverridingFields0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F004.field instanceof double).assertTrue()
        expect(A_F004.field).assertEqual(5.0)
        expect(Base_F004.field instanceof double).assertTrue()
        expect(Base_F004.field).assertEqual(3.4)
    })

    /**
     * @tc.number    SUB_OVERRIDING_FIELDS_TEST_0005
     * @tc.name      testOverridingFields0005
     * @tc.desc      Checking static field declaration in derived class with same name and same type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverridingFields0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F005.field instanceof float).assertTrue()
        expect(A_F005.field).assertEqual(7.3f)
        expect(Base_F005.field instanceof float).assertTrue()
        expect(Base_F005.field).assertEqual(6.7f)
    })

    /**
     * @tc.number    SUB_OVERRIDING_FIELDS_TEST_0006
     * @tc.name      testOverridingFields0006
     * @tc.desc      Checking static field declaration in derived class with same name and same type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverridingFields0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F006.field instanceof long).assertTrue()
        expect(A_F006.field).assertEqual(78945)
        expect(Base_F006.field instanceof long).assertTrue()
        expect(Base_F006.field).assertEqual(9223372036854775807)
    })

    /**
     * @tc.number    SUB_OVERRIDING_FIELDS_TEST_0007
     * @tc.name      testOverridingFields0007
     * @tc.desc      Checking static field declaration in derived class with same name and same type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverridingFields0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F007.field instanceof int).assertTrue()
        expect(A_F007.field).assertEqual(321)
        expect(Base_F007.field instanceof int).assertTrue()
        expect(Base_F007.field).assertEqual(123)
    })

    /**
     * @tc.number    SUB_OVERRIDING_FIELDS_TEST_0008
     * @tc.name      testOverridingFields0008
     * @tc.desc      Checking static field declaration in derived class with same name and same type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverridingFields0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F008.field instanceof short).assertTrue()
        expect(A_F008.field).assertEqual(253)
        expect(Base_F008.field instanceof short).assertTrue()
        expect(Base_F008.field).assertEqual(325)
    })

    /**
     * @tc.number    SUB_OVERRIDING_FIELDS_TEST_0009
     * @tc.name      testOverridingFields0009
     * @tc.desc      Checking static field declaration in derived class with same name and same type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverridingFields0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F009.field instanceof byte).assertTrue()
        expect(A_F009.field).assertEqual(78)
        expect(Base_F009.field instanceof byte).assertTrue()
        expect(Base_F009.field).assertEqual(127)
    })

    /**
     * @tc.number    SUB_OVERRIDING_FIELDS_TEST_0010
     * @tc.name      testOverridingFields0010
     * @tc.desc      Checking static field declaration in derived class with same name and same type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverridingFields0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F010.field instanceof string).assertTrue()
        expect(A_F010.field).assertEqual("defg")
        expect(Base_F010.field instanceof string).assertTrue()
        expect(Base_F010.field).assertEqual("abc")
    })

    /**
     * @tc.number    SUB_OVERRIDING_FIELDS_TEST_0011
     * @tc.name      testOverridingFields0011
     * @tc.desc      Checking static field declaration in derived class with same name and same type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverridingFields0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F011.field instanceof bigint).assertTrue()
        expect(A_F011.field).assertEqual(5556423623465n)
        expect(Base_F011.field instanceof bigint).assertTrue()
        expect(Base_F011.field).assertEqual(12345678901234567890n)
    })

    /**
     * @tc.number    SUB_OVERRIDING_FIELDS_TEST_0012
     * @tc.name      testOverridingFields0012
     * @tc.desc      Checking static field declaration in derived class with same name and same type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverridingFields0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F012.field instanceof char).assertTrue()
        expect(A_F012.field).assertEqual(c'z')
        expect(Base_F012.field instanceof char).assertTrue()
        expect(Base_F012.field).assertEqual(c'\u2028')
    })

    /**
     * @tc.number    SUB_OVERRIDING_FIELDS_TEST_0013
     * @tc.name      testOverridingFields0013
     * @tc.desc      Checking static field declaration in derived class with same name and same type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverridingFields0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F013.field instanceof boolean).assertTrue()
        expect(A_F013.field).assertEqual(true)
        expect(Base_F013.field instanceof boolean).assertTrue()
        expect(Base_F013.field).assertEqual(false)
    })

    /**
     * @tc.number    SUB_OVERRIDING_FIELDS_TEST_0014
     * @tc.name      testOverridingFields0014
     * @tc.desc      Checking static field declaration in derived class with same name and same type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverridingFields0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F014.field instanceof Any).assertTrue()
        expect(A_F014.field).assertEqual(7)
        expect(Base_F014.field instanceof Any).assertTrue()
        expect(Base_F014.field).assertEqual(null)
    })

    /**
     * @tc.number    SUB_OVERRIDING_FIELDS_TEST_0015
     * @tc.name      testOverridingFields0015
     * @tc.desc      Checking static field declaration in derived class with same name and same type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverridingFields0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F015.field instanceof Object).assertTrue()
        expect(A_F015.field).assertEqual("abc")
        expect(Base_F015.field instanceof Object).assertTrue()
        expect(Base_F015.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_OVERRIDING_FIELDS_TEST_0016
     * @tc.name      testOverridingFields0016
     * @tc.desc      Checking static field declaration in derived class with same name and same type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverridingFields0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F016.field instanceof number).assertTrue()
        expect(A_F016.field).assertEqual(6.7)
        expect(Base_F016.field instanceof number).assertTrue()
        expect(Base_F016.field).assertEqual(3)
    })

    /**
     * @tc.number    SUB_OVERRIDING_FIELDS_TEST_0017
     * @tc.name      testOverridingFields0017
     * @tc.desc      Checking static field declaration in derived class with same name and same type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverridingFields0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F017.field instanceof double).assertTrue()
        expect(A_F017.field).assertEqual(5.0)
        expect(Base_F017.field instanceof double).assertTrue()
        expect(Base_F017.field).assertEqual(3.4)
    })

    /**
     * @tc.number    SUB_OVERRIDING_FIELDS_TEST_0018
     * @tc.name      testOverridingFields0018
     * @tc.desc      Checking static field declaration in derived class with same name and same type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverridingFields0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F018.field instanceof float).assertTrue()
        expect(A_F018.field).assertEqual(7.3f)
        expect(Base_F018.field instanceof float).assertTrue()
        expect(Base_F018.field).assertEqual(6.7f)
    })

    /**
     * @tc.number    SUB_OVERRIDING_FIELDS_TEST_0019
     * @tc.name      testOverridingFields0019
     * @tc.desc      Checking static field declaration in derived class with same name and same type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverridingFields0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F019.field instanceof long).assertTrue()
        expect(A_F019.field).assertEqual(78945)
        expect(Base_F019.field instanceof long).assertTrue()
        expect(Base_F019.field).assertEqual(9223372036854775807)
    })

    /**
     * @tc.number    SUB_OVERRIDING_FIELDS_TEST_0020
     * @tc.name      testOverridingFields0020
     * @tc.desc      Checking static field declaration in derived class with same name and same type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverridingFields0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F020.field instanceof int).assertTrue()
        expect(A_F020.field).assertEqual(321)
        expect(Base_F020.field instanceof int).assertTrue()
        expect(Base_F020.field).assertEqual(123)
    })

    /**
     * @tc.number    SUB_OVERRIDING_FIELDS_TEST_0021
     * @tc.name      testOverridingFields0021
     * @tc.desc      Checking static field declaration in derived class with same name and same type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverridingFields0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F021.field instanceof short).assertTrue()
        expect(A_F021.field).assertEqual(253)
        expect(Base_F021.field instanceof short).assertTrue()
        expect(Base_F021.field).assertEqual(325)
    })

    /**
     * @tc.number    SUB_OVERRIDING_FIELDS_TEST_0022
     * @tc.name      testOverridingFields0022
     * @tc.desc      Checking static field declaration in derived class with same name and same type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverridingFields0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F022.field instanceof byte).assertTrue()
        expect(A_F022.field).assertEqual(78)
        expect(Base_F022.field instanceof byte).assertTrue()
        expect(Base_F022.field).assertEqual(127)
    })

    /**
     * @tc.number    SUB_OVERRIDING_FIELDS_TEST_0023
     * @tc.name      testOverridingFields0023
     * @tc.desc      Checking static field declaration in derived class with same name and same type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverridingFields0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F023.field instanceof string).assertTrue()
        expect(A_F023.field).assertEqual("defg")
        expect(Base_F023.field instanceof string).assertTrue()
        expect(Base_F023.field).assertEqual("abc")
    })

    /**
     * @tc.number    SUB_OVERRIDING_FIELDS_TEST_0024
     * @tc.name      testOverridingFields0024
     * @tc.desc      Checking static field declaration in derived class with same name and same type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverridingFields0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F024.field instanceof bigint).assertTrue()
        expect(A_F024.field).assertEqual(5556423623465n)
        expect(Base_F024.field instanceof bigint).assertTrue()
        expect(Base_F024.field).assertEqual(12345678901234567890n)
    })

    /**
     * @tc.number    SUB_OVERRIDING_FIELDS_TEST_0025
     * @tc.name      testOverridingFields0025
     * @tc.desc      Checking static field declaration in derived class with same name and same type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverridingFields0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F025.field instanceof char).assertTrue()
        expect(A_F025.field).assertEqual(c'z')
        expect(Base_F025.field instanceof char).assertTrue()
        expect(Base_F025.field).assertEqual(c'\u2028')
    })

    /**
     * @tc.number    SUB_OVERRIDING_FIELDS_TEST_0026
     * @tc.name      testOverridingFields0026
     * @tc.desc      Checking static field declaration in derived class with same name and same type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverridingFields0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F026.field instanceof boolean).assertTrue()
        expect(A_F026.field).assertEqual(true)
        expect(Base_F026.field instanceof boolean).assertTrue()
        expect(Base_F026.field).assertEqual(false)
    })

    /**
     * @tc.number    SUB_OVERRIDING_FIELDS_TEST_0027
     * @tc.name      testOverridingFields0027
     * @tc.desc      Checking static field declaration in derived class with same name and same type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverridingFields0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F027.field instanceof Any).assertTrue()
        expect(A_F027.field).assertEqual(undefined)
        expect(Base_F027.field instanceof Any).assertTrue()
        expect(Base_F027.field).assertEqual(null)
    })

    /**
     * @tc.number    SUB_OVERRIDING_FIELDS_TEST_0028
     * @tc.name      testOverridingFields0028
     * @tc.desc      Checking static field declaration in derived class with same name and same type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverridingFields0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F028.field instanceof Object|undefined).assertTrue()
        expect(A_F028.field).assertEqual(undefined)
        expect(Base_F028.field instanceof Object|undefined).assertTrue()
        expect(Base_F028.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_OVERRIDING_FIELDS_TEST_0029
     * @tc.name      testOverridingFields0029
     * @tc.desc      Checking static field declaration in derived class with same name and same type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverridingFields0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F029.field instanceof number).assertTrue()
        expect(A_F029.field).assertEqual(0.0)
        expect(Base_F029.field instanceof number).assertTrue()
        expect(Base_F029.field).assertEqual(3)
    })

    /**
     * @tc.number    SUB_OVERRIDING_FIELDS_TEST_0030
     * @tc.name      testOverridingFields0030
     * @tc.desc      Checking static field declaration in derived class with same name and same type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverridingFields0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F030.field instanceof double).assertTrue()
        expect(A_F030.field).assertEqual(0.0)
        expect(Base_F030.field instanceof double).assertTrue()
        expect(Base_F030.field).assertEqual(3.4)
    })

    /**
     * @tc.number    SUB_OVERRIDING_FIELDS_TEST_0031
     * @tc.name      testOverridingFields0031
     * @tc.desc      Checking static field declaration in derived class with same name and same type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverridingFields0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F031.field instanceof float).assertTrue()
        expect(A_F031.field).assertEqual(0.0f)
        expect(Base_F031.field instanceof float).assertTrue()
        expect(Base_F031.field).assertEqual(6.7f)
    })

    /**
     * @tc.number    SUB_OVERRIDING_FIELDS_TEST_0032
     * @tc.name      testOverridingFields0032
     * @tc.desc      Checking static field declaration in derived class with same name and same type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverridingFields0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F032.field instanceof long).assertTrue()
        expect(A_F032.field).assertEqual(0)
        expect(Base_F032.field instanceof long).assertTrue()
        expect(Base_F032.field).assertEqual(9223372036854775807)
    })

    /**
     * @tc.number    SUB_OVERRIDING_FIELDS_TEST_0033
     * @tc.name      testOverridingFields0033
     * @tc.desc      Checking static field declaration in derived class with same name and same type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverridingFields0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F033.field instanceof int).assertTrue()
        expect(A_F033.field).assertEqual(0)
        expect(Base_F033.field instanceof int).assertTrue()
        expect(Base_F033.field).assertEqual(123)
    })

    /**
     * @tc.number    SUB_OVERRIDING_FIELDS_TEST_0034
     * @tc.name      testOverridingFields0034
     * @tc.desc      Checking static field declaration in derived class with same name and same type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverridingFields0034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F034.field instanceof short).assertTrue()
        expect(A_F034.field).assertEqual(0)
        expect(Base_F034.field instanceof short).assertTrue()
        expect(Base_F034.field).assertEqual(325)
    })

    /**
     * @tc.number    SUB_OVERRIDING_FIELDS_TEST_0035
     * @tc.name      testOverridingFields0035
     * @tc.desc      Checking static field declaration in derived class with same name and same type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverridingFields0035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F035.field instanceof byte).assertTrue()
        expect(A_F035.field).assertEqual(0)
        expect(Base_F035.field instanceof byte).assertTrue()
        expect(Base_F035.field).assertEqual(127)
    })

    /**
     * @tc.number    SUB_OVERRIDING_FIELDS_TEST_0036
     * @tc.name      testOverridingFields0036
     * @tc.desc      Checking static field declaration in derived class with same name and same type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverridingFields0036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F036.field instanceof char).assertTrue()
        expect(A_F036.field).assertEqual(c'\u0000')
        expect(Base_F036.field instanceof char).assertTrue()
        expect(Base_F036.field).assertEqual(c'\u2028')
    })
