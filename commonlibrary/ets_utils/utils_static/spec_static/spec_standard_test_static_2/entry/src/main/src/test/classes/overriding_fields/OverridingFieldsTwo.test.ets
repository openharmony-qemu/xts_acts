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

class Base_F199 {
  field: long = Base_F199.init()
  private static init(): long {
    return 9223372036854775807
  }
}

class A_F199 extends Base_F199 {
  field: long = A_F199.init()
  private static init(): long {
    return 78945
  }
}

function get_field(a: Base_F199): long {
  return a.field
}

function set_field(a: Base_F199, value: long) {
  a.field = value
}

class Base_F200 {
  field: int = Base_F200.init()
  private static init(): int {
    return 123
  }
}

class A_F200 extends Base_F200 {
  field: int = A_F200.init()
  private static init(): int {
    return 321
  }
}

function get_field(a: Base_F200): int {
  return a.field
}

function set_field(a: Base_F200, value: int) {
  a.field = value
}

class Base_F201 {
  field: short = Base_F201.init()
  private static init(): short {
    return 325
  }
}

class A_F201 extends Base_F201 {
  field: short = A_F201.init()
  private static init(): short {
    return 253
  }
}

function get_field(a: Base_F201): short {
  return a.field
}

function set_field(a: Base_F201, value: short) {
  a.field = value
}

class Base_F202 {
  field: byte = Base_F202.init()
  private static init(): byte {
    return 127
  }
}

class A_F202 extends Base_F202 {
  field: byte = A_F202.init()
  private static init(): byte {
    return 78
  }
}

function get_field(a: Base_F202): byte {
  return a.field
}

function set_field(a: Base_F202, value: byte) {
  a.field = value
}

class Base_F203 {
  field: string = Base_F203.init()
  private static init(): string {
    return "abc"
  }
}

class A_F203 extends Base_F203 {
  field: string = A_F203.init()
  private static init(): string {
    return "defg"
  }
}

function get_field(a: Base_F203): string {
  return a.field
}

function set_field(a: Base_F203, value: string) {
  a.field = value
}

class Base_F204 {
  field: bigint = Base_F204.init()
  private static init(): bigint {
    return 12345678901234567890n
  }
}

class A_F204 extends Base_F204 {
  field: bigint = A_F204.init()
  private static init(): bigint {
    return 5556423623465n
  }
}

function get_field(a: Base_F204): bigint {
  return a.field
}

function set_field(a: Base_F204, value: bigint) {
  a.field = value
}

class Base_F205 {
  field: char = Base_F205.init()
  private static init(): char {
    return c'\u2028'
  }
}

class A_F205 extends Base_F205 {
  field: char = A_F205.init()
  private static init(): char {
    return c'z'
  }
}

function get_field(a: Base_F205): char {
  return a.field
}

function set_field(a: Base_F205, value: char) {
  a.field = value
}

class Base_F206 {
  field: boolean = Base_F206.init()
  private static init(): boolean {
    return false
  }
}

class A_F206 extends Base_F206 {
  field: boolean = A_F206.init()
  private static init(): boolean {
    return true
  }
}

function get_field(a: Base_F206): boolean {
  return a.field
}

function set_field(a: Base_F206, value: boolean) {
  a.field = value
}

class Base_F207 {
  field: Any
  constructor() {
    this.field = null
  }
}

class A_F207 extends Base_F207 {
  field: Any = 7
}

function get_field(a: Base_F207): Any {
  return a.field
}

function set_field(a: Base_F207, value: Any) {
  a.field = value
}

class Base_F208 {
  field: Object
  constructor() {
    this.field = 5
  }
}

class A_F208 extends Base_F208 {
  field: Object = "abc"
}

function get_field(a: Base_F208): Object {
  return a.field
}

function set_field(a: Base_F208, value: Object) {
  a.field = value
}

class Base_F209 {
  field: number
  constructor() {
    this.field = 3
  }
}

class A_F209 extends Base_F209 {
  field: number = 6.7
}

function get_field(a: Base_F209): number {
  return a.field
}

function set_field(a: Base_F209, value: number) {
  a.field = value
}

class Base_F210 {
  field: double
  constructor() {
    this.field = 3.4
  }
}

class A_F210 extends Base_F210 {
  field: double = 5.0
}

function get_field(a: Base_F210): double {
  return a.field
}

function set_field(a: Base_F210, value: double) {
  a.field = value
}

class Base_F211 {
  field: float
  constructor() {
    this.field = 6.7f
  }
}

class A_F211 extends Base_F211 {
  field: float = 7.3f
}

function get_field(a: Base_F211): float {
  return a.field
}

function set_field(a: Base_F211, value: float) {
  a.field = value
}

class Base_F212 {
  field: long
  constructor() {
    this.field = 9223372036854775807
  }
}

class A_F212 extends Base_F212 {
  field: long = 78945
}

function get_field(a: Base_F212): long {
  return a.field
}

function set_field(a: Base_F212, value: long) {
  a.field = value
}

class Base_F213 {
  field: int
  constructor() {
    this.field = 123
  }
}

class A_F213 extends Base_F213 {
  field: int = 321
}

function get_field(a: Base_F213): int {
  return a.field
}

function set_field(a: Base_F213, value: int) {
  a.field = value
}

class Base_F214 {
  field: short
  constructor() {
    this.field = 325
  }
}

class A_F214 extends Base_F214 {
  field: short = 253
}

function get_field(a: Base_F214): short {
  return a.field
}

function set_field(a: Base_F214, value: short) {
  a.field = value
}

class Base_F215 {
  field: byte
  constructor() {
    this.field = 127
  }
}

class A_F215 extends Base_F215 {
  field: byte = 78
}

function get_field(a: Base_F215): byte {
  return a.field
}

function set_field(a: Base_F215, value: byte) {
  a.field = value
}

class Base_F216 {
  field: string
  constructor() {
    this.field = "abc"
  }
}

class A_F216 extends Base_F216 {
  field: string = "defg"
}

function get_field(a: Base_F216): string {
  return a.field
}

function set_field(a: Base_F216, value: string) {
  a.field = value
}

class Base_F217 {
  field: bigint
  constructor() {
    this.field = 12345678901234567890n
  }
}

class A_F217 extends Base_F217 {
  field: bigint = 5556423623465n
}

function get_field(a: Base_F217): bigint {
  return a.field
}

function set_field(a: Base_F217, value: bigint) {
  a.field = value
}

class Base_F218 {
  field: char
  constructor() {
    this.field = c'\u2028'
  }
}

class A_F218 extends Base_F218 {
  field: char = c'z'
}

function get_field(a: Base_F218): char {
  return a.field
}

function set_field(a: Base_F218, value: char) {
  a.field = value
}

class Base_F219 {
  field: boolean
  constructor() {
    this.field = false
  }
}

class A_F219 extends Base_F219 {
  field: boolean = true
}

function get_field(a: Base_F219): boolean {
  return a.field
}

function set_field(a: Base_F219, value: boolean) {
  a.field = value
}

class Base_F220 {
  field: Any = Base_F220.init()
  private static init(): Any {
    return null
  }
}

class A_F220 extends Base_F220 {
  field: Any = 7
}

function get_field(a: Base_F220): Any {
  return a.field
}

function set_field(a: Base_F220, value: Any) {
  a.field = value
}

class Base_F221 {
  field: Object = Base_F221.init()
  private static init(): Object {
    return 5
  }
}

class A_F221 extends Base_F221 {
  field: Object = "abc"
}

function get_field(a: Base_F221): Object {
  return a.field
}

function set_field(a: Base_F221, value: Object) {
  a.field = value
}

class Base_F222 {
  field: number = Base_F222.init()
  private static init(): number {
    return 3
  }
}

class A_F222 extends Base_F222 {
  field: number = 6.7
}

function get_field(a: Base_F222): number {
  return a.field
}

function set_field(a: Base_F222, value: number) {
  a.field = value
}

class Base_F223 {
  field: double = Base_F223.init()
  private static init(): double {
    return 3.4
  }
}

class A_F223 extends Base_F223 {
  field: double = 5.0
}

function get_field(a: Base_F223): double {
  return a.field
}

function set_field(a: Base_F223, value: double) {
  a.field = value
}

class Base_F224 {
  field: float = Base_F224.init()
  private static init(): float {
    return 6.7f
  }
}

class A_F224 extends Base_F224 {
  field: float = 7.3f
}

function get_field(a: Base_F224): float {
  return a.field
}

function set_field(a: Base_F224, value: float) {
  a.field = value
}

class Base_F225 {
  field: long = Base_F225.init()
  private static init(): long {
    return 9223372036854775807
  }
}

class A_F225 extends Base_F225 {
  field: long = 78945
}

function get_field(a: Base_F225): long {
  return a.field
}

function set_field(a: Base_F225, value: long) {
  a.field = value
}

class Base_F226 {
  field: int = Base_F226.init()
  private static init(): int {
    return 123
  }
}

class A_F226 extends Base_F226 {
  field: int = 321
}

function get_field(a: Base_F226): int {
  return a.field
}

function set_field(a: Base_F226, value: int) {
  a.field = value
}

class Base_F227 {
  field: short = Base_F227.init()
  private static init(): short {
    return 325
  }
}

class A_F227 extends Base_F227 {
  field: short = 253
}

function get_field(a: Base_F227): short {
  return a.field
}

function set_field(a: Base_F227, value: short) {
  a.field = value
}

class Base_F228 {
  field: byte = Base_F228.init()
  private static init(): byte {
    return 127
  }
}

class A_F228 extends Base_F228 {
  field: byte = 78
}

function get_field(a: Base_F228): byte {
  return a.field
}

function set_field(a: Base_F228, value: byte) {
  a.field = value
}

class Base_F229 {
  field: string = Base_F229.init()
  private static init(): string {
    return "abc"
  }
}

class A_F229 extends Base_F229 {
  field: string = "defg"
}

function get_field(a: Base_F229): string {
  return a.field
}

function set_field(a: Base_F229, value: string) {
  a.field = value
}

class Base_F230 {
  field: bigint = Base_F230.init()
  private static init(): bigint {
    return 12345678901234567890n
  }
}

class A_F230 extends Base_F230 {
  field: bigint = 5556423623465n
}

function get_field(a: Base_F230): bigint {
  return a.field
}

function set_field(a: Base_F230, value: bigint) {
  a.field = value
}

class Base_F231 {
  field: char = Base_F231.init()
  private static init(): char {
    return c'\u2028'
  }
}

class A_F231 extends Base_F231 {
  field: char = c'z'
}

function get_field(a: Base_F231): char {
  return a.field
}

function set_field(a: Base_F231, value: char) {
  a.field = value
}

class Base_F232 {
  field: boolean = Base_F232.init()
  private static init(): boolean {
    return false
  }
}

class A_F232 extends Base_F232 {
  field: boolean = true
}

function get_field(a: Base_F232): boolean {
  return a.field
}

function set_field(a: Base_F232, value: boolean) {
  a.field = value
}

class A_F233 {
  v: int
  constructor(v: int = 0) {
    this.v = v
  }
}

class B_F233 extends A_F233 {
  constructor(v: int = 0) {
    super(-v)
  }
  f(): int {
    return 13
  }
}

type HandlerBInt_F233 = (a: B_F233, b: int) => A_F233

type HandlerAInt_F233 = (a: A_F233, b: int) => B_F233

const handlerAInt: HandlerAInt_F233 = (a: A_F233, b: int): B_F233 => {
  if (a instanceof B_F233){
    return new B_F233(a.f() + b)
  } else {
    return new B_F233(b)
  }
}

type HandlerA_F233 = (a: A_F233) => A_F233

const handlerA: HandlerA_F233 = (a: A_F233): A_F233 => {
  if (a instanceof B_F233){
    return new A_F233(a.f())
  } else {
    return new A_F233
  }
}

type HandlerNothing_F233 = () => B_F233

const handlerNothing: HandlerNothing_F233 = (): B_F233 => {
  return new B_F233(567)
}

class Base_F233 {
  field: HandlerBInt_F233 = handlerAInt
}

class Derived1_F233 extends Base_F233 {
  override field: HandlerBInt_F233 = handlerA
}

class Derived2_F233 extends Derived1_F233 {
  override field: HandlerBInt_F233 = handlerNothing
}

function get_result(a: Base_F233, b: B_F233, c: int): A_F233 {
  return a.field(b, c)
}

class Animal_F234 {
  name: string = ""
}

class Dog_F234 extends Animal_F234 {
  override name: string = "dog"
}

class Cat_F234 extends Animal_F234 {
  override name: string = "cat"
}

class Base_F234 {
  field: Animal_F234 = new Dog_F234
}

class A_F234 extends Base_F234 {
  override field: Animal_F234 = new Cat_F234
}

class Base_F235 {
  field: Any = null
}

class A_F235 extends Base_F235 {
  field: Any = null
}

function get_field(a: Base_F235): Any {
  return a.field
}

function set_field(a: Base_F235, value: Any) {
  a.field = value
}

class Base_F236 {
  field: Object|undefined = 5
}

class A_F236 extends Base_F236 {
  field: Object|undefined = undefined
}

function get_field(a: Base_F236): Object|undefined {
  return a.field
}

function set_field(a: Base_F236, value: Object|undefined) {
  a.field = value
}

class Base_F237 {
  field: number = 3
}

class A_F237 extends Base_F237 {
  field: number = 0
}

function get_field(a: Base_F237): number {
  return a.field
}

function set_field(a: Base_F237, value: number) {
  a.field = value
}

class Base_F238 {
  field: double = 3.4
}

class A_F238 extends Base_F238 {
  field: double = 0.0
}

function get_field(a: Base_F238): double {
  return a.field
}

function set_field(a: Base_F238, value: double) {
  a.field = value
}

class Base_F239 {
  field: float = 6.7f
}

class A_F239 extends Base_F239 {
  field: float = 0.0f
}

function get_field(a: Base_F239): float {
  return a.field
}

function set_field(a: Base_F239, value: float) {
  a.field = value
}

class Base_F240 {
  field: long = 9223372036854775807
}

class A_F240 extends Base_F240 {
  field: long = 0
}

function get_field(a: Base_F240): long {
  return a.field
}

function set_field(a: Base_F240, value: long) {
  a.field = value
}

class Base_F241 {
  field: int = 123
}

class A_F241 extends Base_F241 {
  field: int = 0
}

function get_field(a: Base_F241): int {
  return a.field
}

function set_field(a: Base_F241, value: int) {
  a.field = value
}

class Base_F242 {
  field: short = 325
}

class A_F242 extends Base_F242 {
  field: short = 0
}

function get_field(a: Base_F242): short {
  return a.field
}

function set_field(a: Base_F242, value: short) {
  a.field = value
}

class Base_F243 {
  field: byte = 127
}

class A_F243 extends Base_F243 {
  field: byte = 0
}

function get_field(a: Base_F243): byte {
  return a.field
}

function set_field(a: Base_F243, value: byte) {
  a.field = value
}

class Base_F244 {
  field: char = c'\u2028'
}

class A_F244 extends Base_F244 {
  field: char = c'\0'
}

function get_field(a: Base_F244): char {
  return a.field
}

function set_field(a: Base_F244, value: char) {
  a.field = value
}

class Base_F245 {
  field: boolean = true
}

class A_F245 extends Base_F245 {
  field: boolean = false
}

function get_field(a: Base_F245): boolean {
  return a.field
}

function set_field(a: Base_F245, value: boolean) {
  a.field = value
}

class Base_F246 {
  field: Any = null
}

class A_F246 extends Base_F246 {
  field: Any = 7
}

function get_field(a: Base_F246): Any {
  return a.field
}

function set_field(a: Base_F246, value: Any) {
  a.field = value
}

class Base_F247 {
  field: Object = 5
}

class A_F247 extends Base_F247 {
  field: Object = "abc"
}

function get_field(a: Base_F247): Object {
  return a.field
}

function set_field(a: Base_F247, value: Object) {
  a.field = value
}

class Base_F248 {
  field: number = 3
}

class A_F248 extends Base_F248 {
  field: number = 6.7
}

function get_field(a: Base_F248): number {
  return a.field
}

function set_field(a: Base_F248, value: number) {
  a.field = value
}

class Base_F249 {
  field: double = 3.4
}

class A_F249 extends Base_F249 {
  field: double = 5.0
}

function get_field(a: Base_F249): double {
  return a.field
}

function set_field(a: Base_F249, value: double) {
  a.field = value
}

class Base_F250 {
  field: float = 6.7f
}

class A_F250 extends Base_F250 {
  field: float = 7.3f
}

function get_field(a: Base_F250): float {
  return a.field
}

function set_field(a: Base_F250, value: float) {
  a.field = value
}

class Base_F251 {
  field: long = 9223372036854775807
}

class A_F251 extends Base_F251 {
  field: long = 78945
}

function get_field(a: Base_F251): long {
  return a.field
}

function set_field(a: Base_F251, value: long) {
  a.field = value
}

class Base_F252 {
  field: int = 123
}

class A_F252 extends Base_F252 {
  field: int = 321
}

function get_field(a: Base_F252): int {
  return a.field
}

function set_field(a: Base_F252, value: int) {
  a.field = value
}

class Base_F253 {
  field: short = 325
}

class A_F253 extends Base_F253 {
  field: short = 253
}

function get_field(a: Base_F253): short {
  return a.field
}

function set_field(a: Base_F253, value: short) {
  a.field = value
}

class Base_F254 {
  field: byte = 127
}

class A_F254 extends Base_F254 {
  field: byte = 78
}

function get_field(a: Base_F254): byte {
  return a.field
}

function set_field(a: Base_F254, value: byte) {
  a.field = value
}

class Base_F255 {
  field: string = "abc"
}

class A_F255 extends Base_F255 {
  field: string = "defg"
}

function get_field(a: Base_F255): string {
  return a.field
}

function set_field(a: Base_F255, value: string) {
  a.field = value
}

class Base_F256 {
  field: bigint = 12345678901234567890n
}

class A_F256 extends Base_F256 {
  field: bigint = 5556423623465n
}

function get_field(a: Base_F256): bigint {
  return a.field
}

function set_field(a: Base_F256, value: bigint) {
  a.field = value
}

class Base_F257 {
  field: char = c'\u2028'
}

class A_F257 extends Base_F257 {
  field: char = c'z'
}

function get_field(a: Base_F257): char {
  return a.field
}

function set_field(a: Base_F257, value: char) {
  a.field = value
}

class Base_F258 {
  field: boolean = false
}

class A_F258 extends Base_F258 {
  field: boolean = true
}

function get_field(a: Base_F258): boolean {
  return a.field
}

function set_field(a: Base_F258, value: boolean) {
  a.field = value
}

class Base_F259 {
  field: Any = null
  get_field() {
    return this.field
  }
}

class A_F259 extends Base_F259 {
  field: Any = 7
}

function get_field(a: Base_F259): Any {
  return a.get_field()
}

class Base_F260 {
  field: Object = 5
  get_field() {
    return this.field
  }
}

class A_F260 extends Base_F260 {
  field: Object = "abc"
}

function get_field(a: Base_F260): Object {
  return a.get_field()
}

class Base_F261 {
  field: number = 3
  get_field() {
    return this.field
  }
}

class A_F261 extends Base_F261 {
  field: number = 6.7
}

function get_field(a: Base_F261): number {
  return a.get_field()
}

class Base_F262 {
  field: double = 3.4
  get_field() {
    return this.field
  }
}

class A_F262 extends Base_F262 {
  field: double = 5.0
}

function get_field(a: Base_F262): double {
  return a.get_field()
}

class Base_F263 {
  field: float = 6.7f
  get_field() {
    return this.field
  }
}

class A_F263 extends Base_F263 {
  field: float = 7.3f
}

function get_field(a: Base_F263): float {
  return a.get_field()
}

class Base_F264 {
  field: long = 9223372036854775807
  get_field() {
    return this.field
  }
}

class A_F264 extends Base_F264 {
  field: long = 78945
}

function get_field(a: Base_F264): long {
  return a.get_field()
}

class Base_F265 {
  field: int = 123
  get_field() {
    return this.field
  }
}

class A_F265 extends Base_F265 {
  field: int = 321
}

function get_field(a: Base_F265): int {
  return a.get_field()
}

class Base_F266 {
  field: short = 325
  get_field() {
    return this.field
  }
}

class A_F266 extends Base_F266 {
  field: short = 253
}

function get_field(a: Base_F266): short {
  return a.get_field()
}

class Base_F267 {
  field: byte = 127
  get_field() {
    return this.field
  }
}

class A_F267 extends Base_F267 {
  field: byte = 78
}

function get_field(a: Base_F267): byte {
  return a.get_field()
}

class Base_F268 {
  field: string = "abc"
  get_field() {
    return this.field
  }
}

class A_F268 extends Base_F268 {
  field: string = "defg"
}

function get_field(a: Base_F268): string {
  return a.get_field()
}

class Base_F269 {
  field: bigint = 12345678901234567890n
  get_field() {
    return this.field
  }
}

class A_F269 extends Base_F269 {
  field: bigint = 5556423623465n
}

function get_field(a: Base_F269): bigint {
  return a.get_field()
}

class Base_F270 {
  field: char = c'\u2028'
  get_field() {
    return this.field
  }
}

class A_F270 extends Base_F270 {
  field: char = c'z'
}

function get_field(a: Base_F270): char {
  return a.get_field()
}

class Base_F271 {
  field: boolean = false
  get_field() {
    return this.field
  }
}

class A_F271 extends Base_F271 {
  field: boolean = true
}

function get_field(a: Base_F271): boolean {
  return a.get_field()
}

class Base_F272 {
  field: number = 5
}

class A_F272 extends Base_F272{
  field: number = 7
}

class Base_F273 {
  field: number = 5
}

class A_F273 extends Base_F273 {
  field: number = 7
}

function f(v: Base_F273) {
  arktest.assertTrue(v.field instanceof number)
  arktest.assertEQ(v.field, 7)
}

class Base_F274 {
  field: Any = null
  get_field() {
    return this.field
  }
}

class A_F274 extends Base_F274 {
  field: Any = 7
}

function get_field(a: Base_F274): Any {
  return a.get_field()
}

class Base_F275 {
  field: Object = 5
  get_field() {
    return this.field
  }
}

class A_F275 extends Base_F275 {
  field: Object = "abc"
}

function get_field(a: Base_F275): Object {
  return a.get_field()
}

class Base_F276 {
  field: number = 3
  get_field() {
    return this.field
  }
}

class A_F276 extends Base_F276 {
  field: number = 6.7
}

function get_field(a: Base_F276): number {
  return a.get_field()
}

class Base_F277 {
  field: double = 3.4
  get_field() {
    return this.field
  }
}

class A_F277 extends Base_F277 {
  field: double = 5.0
}

function get_field(a: Base_F277): double {
  return a.get_field()
}

class Base_F278 {
  field: float = 6.7f
  get_field() {
    return this.field
  }
}

class A_F278 extends Base_F278 {
  field: float = 7.3f
}

function get_field(a: Base_F278): float {
  return a.get_field()
}

class Base_F279 {
  field: long = 9223372036854775807
  get_field() {
    return this.field
  }
}

class A_F279 extends Base_F279 {
  field: long = 78945
}

function get_field(a: Base_F279): long {
  return a.get_field()
}

class Base_F280 {
  field: int = 123
  get_field() {
    return this.field
  }
}

class A_F280 extends Base_F280 {
  field: int = 321
}

function get_field(a: Base_F280): int {
  return a.get_field()
}

class Base_F281 {
  field: short = 325
  get_field() {
    return this.field
  }
}

class A_F281 extends Base_F281 {
  field: short = 253
}

function get_field(a: Base_F281): short {
  return a.get_field()
}

class Base_F282 {
  field: byte = 127
  get_field() {
    return this.field
  }
}

class A_F282 extends Base_F282 {
  field: byte = 78
}

function get_field(a: Base_F282): byte {
  return a.get_field()
}

class Base_F283 {
  field: string = "abc"
  get_field() {
    return this.field
  }
}

class A_F283 extends Base_F283 {
  field: string = "defg"
}

function get_field(a: Base_F283): string {
  return a.get_field()
}

class Base_F284 {
  field: bigint = 12345678901234567890n
  get_field() {
    return this.field
  }
}

class A_F284 extends Base_F284 {
  field: bigint = 5556423623465n
}

function get_field(a: Base_F284): bigint {
  return a.get_field()
}

class Base_F285 {
  field: char = c'\u2028'
  get_field() {
    return this.field
  }
}

class A_F285 extends Base_F285 {
  field: char = c'z'
}

function get_field(a: Base_F285): char {
  return a.get_field()
}

class Base_F286 {
  field: boolean = false
  get_field() {
    return this.field
  }
}

class A_F286 extends Base_F286 {
  field: boolean = true
}

function get_field(a: Base_F286): boolean {
  return a.get_field()
}

class C_F287 {
  field: Any
  constructor() {
    this.field = null
  }
}

class D_F287 extends C_F287 {
  override field: Any = 7
}

class Derived_F287 extends D_F287 {
  field: Any
  constructor() {
    super()
    this.field = "abc"
  }
}

function get_field(a: C_F287): Any {
  return a.field
}

function set_field(a: C_F287, value: Any) {
  a.field = value
}

class C_F288 {
  field: Object
  constructor() {
    this.field = 5
  }
}

class D_F288 extends C_F288 {
  override field: Object = "abc"
}

class Derived_F288 extends D_F288 {
  field: Object
  constructor() {
    super()
    this.field = 7
  }
}

function get_field(a: C_F288): Object {
  return a.field
}

function set_field(a: C_F288, value: Object) {
  a.field = value
}

class C_F289 {
  field: number
  constructor() {
    this.field = 3
  }
}

class D_F289 extends C_F289 {
  override field: number = 6.7
}

class Derived_F289 extends D_F289 {
  field: number
  constructor() {
    super()
    this.field = 13
  }
}

function get_field(a: C_F289): number {
  return a.field
}

function set_field(a: C_F289, value: number) {
  a.field = value
}

class C_F290 {
  field: double
  constructor() {
    this.field = 3.4
  }
}

class D_F290 extends C_F290 {
  override field: double = 5.0
}

class Derived_F290 extends D_F290 {
  field: double
  constructor() {
    super()
    this.field = 15
  }
}

function get_field(a: C_F290): double {
  return a.field
}

function set_field(a: C_F290, value: double) {
  a.field = value
}

class C_F291 {
  field: float
  constructor() {
    this.field = 6.7f
  }
}

class D_F291 extends C_F291 {
  override field: float = 7.3f
}

class Derived_F291 extends D_F291 {
  field: float
  constructor() {
    super()
    this.field = 9.8f
  }
}

function get_field(a: C_F291): float {
  return a.field
}

function set_field(a: C_F291, value: float) {
  a.field = value
}

class C_F292 {
  field: long
  constructor() {
    this.field = 9223372036854775807
  }
}

class D_F292 extends C_F292 {
  override field: long = 78945
}

class Derived_F292 extends D_F292 {
  field: long
  constructor() {
    super()
    this.field = 357
  }
}

function get_field(a: C_F292): long {
  return a.field
}

function set_field(a: C_F292, value: long) {
  a.field = value
}

class C_F293 {
  field: int
  constructor() {
    this.field = 123
  }
}

class D_F293 extends C_F293 {
  override field: int = 321
}

class Derived_F293 extends D_F293 {
  field: int
  constructor() {
    super()
    this.field = 321321
  }
}

function get_field(a: C_F293): int {
  return a.field
}

function set_field(a: C_F293, value: int) {
  a.field = value
}

class C_F294 {
  field: short
  constructor() {
    this.field = 325
  }
}

class D_F294 extends C_F294 {
  override field: short = 253
}

class Derived_F294 extends D_F294 {
  field: short
  constructor() {
    super()
    this.field = 536
  }
}

function get_field(a: C_F294): short {
  return a.field
}

function set_field(a: C_F294, value: short) {
  a.field = value
}

class C_F295 {
  field: byte
  constructor() {
    this.field = 127
  }
}

class D_F295 extends C_F295 {
  override field: byte = 78
}

class Derived_F295 extends D_F295 {
  field: byte
  constructor() {
    super()
    this.field = 15
  }
}

function get_field(a: C_F295): byte {
  return a.field
}

function set_field(a: C_F295, value: byte) {
  a.field = value
}

class C_F296 {
  field: string
  constructor() {
    this.field = "abc"
  }
}

class D_F296 extends C_F296 {
  override field: string = "efg"
}

class Derived_F296 extends D_F296 {
  field: string
  constructor() {
    super()
    this.field = "ijk"
  }
}

function get_field(a: C_F296): string {
  return a.field
}

function set_field(a: C_F296, value: string) {
  a.field = value
}

class C_F297 {
  field: bigint
  constructor() {
    this.field = 12345678901234567890n
  }
}

class D_F297 extends C_F297 {
  override field: bigint = 555642n
}

class Derived_F297 extends D_F297 {
  field: bigint
  constructor() {
    super()
    this.field = 123n
  }
}
