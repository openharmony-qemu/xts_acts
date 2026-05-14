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

function f(v: Base_F273) {
  expect(v.field instanceof number).assertTrue()
  expect(v.field).assertEqual(7)
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

function get_field(a: C_F297): bigint {
  return a.field
}

function set_field(a: C_F297, value: bigint) {
  a.field = value
}

export default function OverridingFieldsTwoTest(): void {
  describe("OverridingFieldsTwoTest", () => {
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
     * @tc.number    SUB_OVERRIDING_FIELDS_TWO_0100
     * @tc.name      testOverridingFieldsTwo0001
     * @tc.desc      When extending a class, an instance field declared in a superclass can be overridden
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverridingFieldsTwo0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F199 = new A_F199()
      expect(a.field instanceof long).assertTrue()
      expect(a.field).assertEqual(78945)
      expect(get_field(a)).assertEqual(78945)
      set_field(a, 9223372036854775000)
      expect(a.field).assertEqual(9223372036854775000)
      expect(get_field(a)).assertEqual(9223372036854775000)
    })

    /**
     * @tc.number    SUB_OVERRIDING_FIELDS_TWO_0200
     * @tc.name      testOverridingFieldsTwo0002
     * @tc.desc      When extending a class, an instance field declared in a superclass can be overridden
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverridingFieldsTwo0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F200 = new A_F200()
      expect(a.field instanceof int).assertTrue()
      expect(a.field).assertEqual(321)
      expect(get_field(a)).assertEqual(321)
      set_field(a, 321321)
      expect(a.field).assertEqual(321321)
      expect(get_field(a)).assertEqual(321321)
    })

    /**
     * @tc.number    SUB_OVERRIDING_FIELDS_TWO_0300
     * @tc.name      testOverridingFieldsTwo0003
     * @tc.desc      When extending a class, an instance field declared in a superclass can be overridden
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverridingFieldsTwo0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F201 = new A_F201()
      expect(a.field instanceof short).assertTrue()
      expect(a.field).assertEqual(253)
      expect(get_field(a)).assertEqual(253)
      set_field(a, 536)
      expect(a.field).assertEqual(536)
      expect(get_field(a)).assertEqual(536)
    })

    /**
     * @tc.number    SUB_OVERRIDING_FIELDS_TWO_0400
     * @tc.name      testOverridingFieldsTwo0004
     * @tc.desc      When extending a class, an instance field declared in a superclass can be overridden
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverridingFieldsTwo0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F202 = new A_F202()
      expect(a.field instanceof byte).assertTrue()
      expect(a.field).assertEqual(78)
      expect(get_field(a)).assertEqual(78)
      set_field(a, 15)
      expect(a.field).assertEqual(15)
      expect(get_field(a)).assertEqual(15)
    })

    /**
     * @tc.number    SUB_OVERRIDING_FIELDS_TWO_0500
     * @tc.name      testOverridingFieldsTwo0005
     * @tc.desc      When extending a class, an instance field declared in a superclass can be overridden
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverridingFieldsTwo0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F203 = new A_F203()
      expect(a.field instanceof string).assertTrue()
      expect(a.field).assertEqual("defg")
      expect(get_field(a)).assertEqual("defg")
      set_field(a, "hijk")
      expect(a.field).assertEqual("hijk")
      expect(get_field(a)).assertEqual("hijk")
    })

    /**
     * @tc.number    SUB_OVERRIDING_FIELDS_TWO_0600
     * @tc.name      testOverridingFieldsTwo0006
     * @tc.desc      When extending a class, an instance field declared in a superclass can be overridden
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverridingFieldsTwo0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F204 = new A_F204()
      expect(a.field instanceof bigint).assertTrue()
      expect(a.field).assertEqual(5556423623465n)
      expect(get_field(a)).assertEqual(5556423623465n)
      set_field(a, 123123n)
      expect(a.field).assertEqual(123123n)
      expect(get_field(a)).assertEqual(123123n)
    })

    /**
     * @tc.number    SUB_OVERRIDING_FIELDS_TWO_0700
     * @tc.name      testOverridingFieldsTwo0007
     * @tc.desc      When extending a class, an instance field declared in a superclass can be overridden
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverridingFieldsTwo0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F205 = new A_F205()
      expect(a.field instanceof char).assertTrue()
      expect(a.field).assertEqual(c'z')
      expect(get_field(a)).assertEqual(c'z')
      set_field(a, c'x')
      expect(a.field).assertEqual(c'x')
      expect(get_field(a)).assertEqual(c'x')
    })

    /**
     * @tc.number    SUB_OVERRIDING_FIELDS_TWO_0800
     * @tc.name      testOverridingFieldsTwo0008
     * @tc.desc      When extending a class, an instance field declared in a superclass can be overridden
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverridingFieldsTwo0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F206 = new A_F206()
      expect(a.field instanceof boolean).assertTrue()
      expect(a.field).assertEqual(true)
      expect(get_field(a)).assertEqual(true)
      set_field(a, false)
      expect(a.field).assertEqual(false)
      expect(get_field(a)).assertEqual(false)
    })

    /**
     * @tc.number    SUB_OVERRIDING_FIELDS_TWO_0900
     * @tc.name      testOverridingFieldsTwo0009
     * @tc.desc      When extending a class, an instance field declared in a superclass can be overridden
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverridingFieldsTwo0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F208 = new A_F208()
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual("abc")
      expect(get_field(a)).assertEqual("abc")
      set_field(a, 7)
      expect(a.field).assertEqual(7)
      expect(get_field(a)).assertEqual(7)
    })

    /**
     * @tc.number    SUB_OVERRIDING_FIELDS_TWO_1000
     * @tc.name      testOverridingFieldsTwo0010
     * @tc.desc      When extending a class, an instance field declared in a superclass can be overridden
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverridingFieldsTwo0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F209 = new A_F209()
      expect(a.field instanceof number).assertTrue()
      expect(a.field).assertEqual(6.7)
      expect(get_field(a)).assertEqual(6.7)
      set_field(a, 13)
      expect(a.field).assertEqual(13)
      expect(get_field(a)).assertEqual(13)
    })

    /**
     * @tc.number    SUB_OVERRIDING_FIELDS_TWO_1100
     * @tc.name      testOverridingFieldsTwo0011
     * @tc.desc      When extending a class, an instance field declared in a superclass can be overridden
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverridingFieldsTwo0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F210 = new A_F210()
      expect(a.field instanceof double).assertTrue()
      expect(a.field).assertEqual(5.0)
      expect(get_field(a)).assertEqual(5.0)
      set_field(a, 15)
      expect(a.field).assertEqual(15)
      expect(get_field(a)).assertEqual(15)
    })

    /**
     * @tc.number    SUB_OVERRIDING_FIELDS_TWO_1200
     * @tc.name      testOverridingFieldsTwo0012
     * @tc.desc      When extending a class, an instance field declared in a superclass can be overridden
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverridingFieldsTwo0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F211 = new A_F211()
      expect(a.field instanceof float).assertTrue()
      expect(a.field).assertEqual(7.3f)
      expect(get_field(a)).assertEqual(7.3f)
      set_field(a, 9.8f)
      expect(a.field).assertEqual(9.8f)
      expect(get_field(a)).assertEqual(9.8f)
    })

    /**
     * @tc.number    SUB_OVERRIDING_FIELDS_TWO_1300
     * @tc.name      testOverridingFieldsTwo0013
     * @tc.desc      When extending a class, an instance field declared in a superclass can be overridden
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverridingFieldsTwo0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F212 = new A_F212()
      expect(a.field instanceof long).assertTrue()
      expect(a.field).assertEqual(78945)
      expect(get_field(a)).assertEqual(78945)
      set_field(a, 9223372036854775000)
      expect(a.field).assertEqual(9223372036854775000)
      expect(get_field(a)).assertEqual(9223372036854775000)
    })

    /**
     * @tc.number    SUB_OVERRIDING_FIELDS_TWO_1400
     * @tc.name      testOverridingFieldsTwo0014
     * @tc.desc      When extending a class, an instance field declared in a superclass can be overridden
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverridingFieldsTwo0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F213 = new A_F213()
      expect(a.field instanceof int).assertTrue()
      expect(a.field).assertEqual(321)
      expect(get_field(a)).assertEqual(321)
      set_field(a, 321321)
      expect(a.field).assertEqual(321321)
      expect(get_field(a)).assertEqual(321321)
    })

    /**
     * @tc.number    SUB_OVERRIDING_FIELDS_TWO_1500
     * @tc.name      testOverridingFieldsTwo0015
     * @tc.desc      When extending a class, an instance field declared in a superclass can be overridden
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverridingFieldsTwo0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F214 = new A_F214()
      expect(a.field instanceof short).assertTrue()
      expect(a.field).assertEqual(253)
      expect(get_field(a)).assertEqual(253)
      set_field(a, 536)
      expect(a.field).assertEqual(536)
      expect(get_field(a)).assertEqual(536)
    })

    /**
     * @tc.number    SUB_OVERRIDING_FIELDS_TWO_1600
     * @tc.name      testOverridingFieldsTwo0016
     * @tc.desc      When extending a class, an instance field declared in a superclass can be overridden
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverridingFieldsTwo0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F215 = new A_F215()
      expect(a.field instanceof byte).assertTrue()
      expect(a.field).assertEqual(78)
      expect(get_field(a)).assertEqual(78)
      set_field(a, 15)
      expect(a.field).assertEqual(15)
      expect(get_field(a)).assertEqual(15)
    })

    /**
     * @tc.number    SUB_OVERRIDING_FIELDS_TWO_1700
     * @tc.name      testOverridingFieldsTwo0017
     * @tc.desc      When extending a class, an instance field declared in a superclass can be overridden
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverridingFieldsTwo0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F216 = new A_F216()
      expect(a.field instanceof string).assertTrue()
      expect(a.field).assertEqual("defg")
      expect(get_field(a)).assertEqual("defg")
      set_field(a, "hijk")
      expect(a.field).assertEqual("hijk")
      expect(get_field(a)).assertEqual("hijk")
    })

    /**
     * @tc.number    SUB_OVERRIDING_FIELDS_TWO_1800
     * @tc.name      testOverridingFieldsTwo0018
     * @tc.desc      When extending a class, an instance field declared in a superclass can be overridden
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverridingFieldsTwo0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F217 = new A_F217()
      expect(a.field instanceof bigint).assertTrue()
      expect(a.field).assertEqual(5556423623465n)
      expect(get_field(a)).assertEqual(5556423623465n)
      set_field(a, 123123n)
      expect(a.field).assertEqual(123123n)
      expect(get_field(a)).assertEqual(123123n)
    })

    /**
     * @tc.number    SUB_OVERRIDING_FIELDS_TWO_1900
     * @tc.name      testOverridingFieldsTwo0019
     * @tc.desc      When extending a class, an instance field declared in a superclass can be overridden
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverridingFieldsTwo0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F218 = new A_F218()
      expect(a.field instanceof char).assertTrue()
      expect(a.field).assertEqual(c'z')
      expect(get_field(a)).assertEqual(c'z')
      set_field(a, c'x')
      expect(a.field).assertEqual(c'x')
      expect(get_field(a)).assertEqual(c'x')
    })

    /**
     * @tc.number    SUB_OVERRIDING_FIELDS_TWO_2000
     * @tc.name      testOverridingFieldsTwo0020
     * @tc.desc      When extending a class, an instance field declared in a superclass can be overridden
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverridingFieldsTwo0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F219 = new A_F219()
      expect(a.field instanceof boolean).assertTrue()
      expect(a.field).assertEqual(true)
      expect(get_field(a)).assertEqual(true)
      set_field(a, false)
      expect(a.field).assertEqual(false)
      expect(get_field(a)).assertEqual(false)
    })

    /**
     * @tc.number    SUB_OVERRIDING_FIELDS_TWO_2100
     * @tc.name      testOverridingFieldsTwo0021
     * @tc.desc      When extending a class, an instance field declared in a superclass can be overridden
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverridingFieldsTwo0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F221 = new A_F221()
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual("abc")
      expect(get_field(a)).assertEqual("abc")
      set_field(a, 7)
      expect(a.field).assertEqual(7)
      expect(get_field(a)).assertEqual(7)
    })

    /**
     * @tc.number    SUB_OVERRIDING_FIELDS_TWO_2200
     * @tc.name      testOverridingFieldsTwo0022
     * @tc.desc      When extending a class, an instance field declared in a superclass can be overridden
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverridingFieldsTwo0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F222 = new A_F222()
      expect(a.field instanceof number).assertTrue()
      expect(a.field).assertEqual(6.7)
      expect(get_field(a)).assertEqual(6.7)
      set_field(a, 13)
      expect(a.field).assertEqual(13)
      expect(get_field(a)).assertEqual(13)
    })

    /**
     * @tc.number    SUB_OVERRIDING_FIELDS_TWO_2300
     * @tc.name      testOverridingFieldsTwo0023
     * @tc.desc      When extending a class, an instance field declared in a superclass can be overridden
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverridingFieldsTwo0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F223 = new A_F223()
      expect(a.field instanceof double).assertTrue()
      expect(a.field).assertEqual(5.0)
      expect(get_field(a)).assertEqual(5.0)
      set_field(a, 15)
      expect(a.field).assertEqual(15)
      expect(get_field(a)).assertEqual(15)
    })

    /**
     * @tc.number    SUB_OVERRIDING_FIELDS_TWO_2400
     * @tc.name      testOverridingFieldsTwo0024
     * @tc.desc      When extending a class, an instance field declared in a superclass can be overridden
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverridingFieldsTwo0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F224 = new A_F224()
      expect(a.field instanceof float).assertTrue()
      expect(a.field).assertEqual(7.3f)
      expect(get_field(a)).assertEqual(7.3f)
      set_field(a, 9.8f)
      expect(a.field).assertEqual(9.8f)
      expect(get_field(a)).assertEqual(9.8f)
    })

    /**
     * @tc.number    SUB_OVERRIDING_FIELDS_TWO_2500
     * @tc.name      testOverridingFieldsTwo0025
     * @tc.desc      When extending a class, an instance field declared in a superclass can be overridden
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverridingFieldsTwo0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F225 = new A_F225()
      expect(a.field instanceof long).assertTrue()
      expect(a.field).assertEqual(78945)
      expect(get_field(a)).assertEqual(78945)
      set_field(a, 9223372036854775000)
      expect(a.field).assertEqual(9223372036854775000)
      expect(get_field(a)).assertEqual(9223372036854775000)
    })

    /**
     * @tc.number    SUB_OVERRIDING_FIELDS_TWO_2600
     * @tc.name      testOverridingFieldsTwo0026
     * @tc.desc      When extending a class, an instance field declared in a superclass can be overridden
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverridingFieldsTwo0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F226 = new A_F226()
      expect(a.field instanceof int).assertTrue()
      expect(a.field).assertEqual(321)
      expect(get_field(a)).assertEqual(321)
      set_field(a, 321321)
      expect(a.field).assertEqual(321321)
      expect(get_field(a)).assertEqual(321321)
    })

    /**
     * @tc.number    SUB_OVERRIDING_FIELDS_TWO_2700
     * @tc.name      testOverridingFieldsTwo0027
     * @tc.desc      When extending a class, an instance field declared in a superclass can be overridden
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverridingFieldsTwo0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F227 = new A_F227()
      expect(a.field instanceof short).assertTrue()
      expect(a.field).assertEqual(253)
      expect(get_field(a)).assertEqual(253)
      set_field(a, 536)
      expect(a.field).assertEqual(536)
      expect(get_field(a)).assertEqual(536)
    })

    /**
     * @tc.number    SUB_OVERRIDING_FIELDS_TWO_2800
     * @tc.name      testOverridingFieldsTwo0028
     * @tc.desc      When extending a class, an instance field declared in a superclass can be overridden
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverridingFieldsTwo0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F228 = new A_F228()
      expect(a.field instanceof byte).assertTrue()
      expect(a.field).assertEqual(78)
      expect(get_field(a)).assertEqual(78)
      set_field(a, 15)
      expect(a.field).assertEqual(15)
      expect(get_field(a)).assertEqual(15)
    })

    /**
     * @tc.number    SUB_OVERRIDING_FIELDS_TWO_2900
     * @tc.name      testOverridingFieldsTwo0029
     * @tc.desc      When extending a class, an instance field declared in a superclass can be overridden
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverridingFieldsTwo0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F229 = new A_F229()
      expect(a.field instanceof string).assertTrue()
      expect(a.field).assertEqual("defg")
      expect(get_field(a)).assertEqual("defg")
      set_field(a, "hijk")
      expect(a.field).assertEqual("hijk")
      expect(get_field(a)).assertEqual("hijk")
    })

    /**
     * @tc.number    SUB_OVERRIDING_FIELDS_TWO_3000
     * @tc.name      testOverridingFieldsTwo0030
     * @tc.desc      When extending a class, an instance field declared in a superclass can be overridden
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverridingFieldsTwo0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F230 = new A_F230()
      expect(a.field instanceof bigint).assertTrue()
      expect(a.field).assertEqual(5556423623465n)
      expect(get_field(a)).assertEqual(5556423623465n)
      set_field(a, 123123n)
      expect(a.field).assertEqual(123123n)
      expect(get_field(a)).assertEqual(123123n)
    })

    /**
     * @tc.number    SUB_OVERRIDING_FIELDS_TWO_3100
     * @tc.name      testOverridingFieldsTwo0031
     * @tc.desc      When extending a class, an instance field declared in a superclass can be overridden
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverridingFieldsTwo0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F231 = new A_F231()
      expect(a.field instanceof char).assertTrue()
      expect(a.field).assertEqual(c'z')
      expect(get_field(a)).assertEqual(c'z')
      set_field(a, c'x')
      expect(a.field).assertEqual(c'x')
      expect(get_field(a)).assertEqual(c'x')
    })

    /**
     * @tc.number    SUB_OVERRIDING_FIELDS_TWO_3200
     * @tc.name      testOverridingFieldsTwo0032
     * @tc.desc      When extending a class, an instance field declared in a superclass can be overridden
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverridingFieldsTwo0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F232 = new A_F232()
      expect(a.field instanceof boolean).assertTrue()
      expect(a.field).assertEqual(true)
      expect(get_field(a)).assertEqual(true)
      set_field(a, false)
      expect(a.field).assertEqual(false)
      expect(get_field(a)).assertEqual(false)
    })

    /**
     * @tc.number    SUB_OVERRIDING_FIELDS_TWO_3300
     * @tc.name      testOverridingFieldsTwo0033
     * @tc.desc      When extending a class, an instance field declared in a superclass can be overridden
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverridingFieldsTwo0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Derived2_F233 = new Derived2_F233()
      let b: Derived1_F233 = new Derived1_F233()
        let c: Base_F233 = new Base_F233()
      expect(a.field instanceof HandlerNothing_F233).assertTrue()
      expect(a.field(new B_F233, 7).v).assertEqual(-567)
      expect((get_result(a, new B_F233, 7)).v).assertEqual(-567)
      expect(b.field instanceof HandlerA_F233).assertTrue()
      expect(b.field(new B_F233, 7).v).assertEqual(13)
      expect((get_result(b, new B_F233, 7)).v).assertEqual(13)
      expect(c.field instanceof HandlerAInt_F233).assertTrue()
      expect(c.field(new B_F233, 7).v).assertEqual(-20)
      expect((get_result(c, new B_F233, 7)).v).assertEqual(-20)
    })

    /**
     * @tc.number    SUB_OVERRIDING_FIELDS_TWO_3400
     * @tc.name      testOverridingFieldsTwo0034
     * @tc.desc      When extending a class, an instance field declared in a superclass can be overridden
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverridingFieldsTwo0034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F234 = new A_F234()
      let b: Base_F234 = new Base_F234()
      expect(a.field instanceof Cat_F234).assertTrue()
      expect(a.field.name).assertEqual("cat")
      expect(b.field instanceof Dog_F234).assertTrue()
      expect(b.field.name).assertEqual("dog")
    })

    /**
     * @tc.number    SUB_OVERRIDING_FIELDS_TWO_3500
     * @tc.name      testOverridingFieldsTwo0035
     * @tc.desc      When extending a class, an instance field declared in a superclass can be overridden
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverridingFieldsTwo0035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F236 = new A_F236()
      expect(a.field instanceof Object).assertFalse()
      expect(a.field).assertEqual(undefined)
      expect(get_field(a)).assertEqual(undefined)
      set_field(a, 7)
      expect(a.field).assertEqual(7)
      expect(get_field(a)).assertEqual(7)
    })

    /**
     * @tc.number    SUB_OVERRIDING_FIELDS_TWO_3600
     * @tc.name      testOverridingFieldsTwo0036
     * @tc.desc      When extending a class, an instance field declared in a superclass can be overridden
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverridingFieldsTwo0036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F237 = new A_F237()
      expect(a.field instanceof number).assertTrue()
      expect(a.field).assertEqual(0.0)
      expect(get_field(a)).assertEqual(0.0)
      set_field(a, 13)
      expect(a.field).assertEqual(13)
      expect(get_field(a)).assertEqual(13)
    })

    /**
     * @tc.number    SUB_OVERRIDING_FIELDS_TWO_3700
     * @tc.name      testOverridingFieldsTwo0037
     * @tc.desc      When extending a class, an instance field declared in a superclass can be overridden
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverridingFieldsTwo0037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F238 = new A_F238()
      expect(a.field instanceof double).assertTrue()
      expect(a.field).assertEqual(0.0)
      expect(get_field(a)).assertEqual(0.0)
      set_field(a, 15)
      expect(a.field).assertEqual(15)
      expect(get_field(a)).assertEqual(15)
    })

    /**
     * @tc.number    SUB_OVERRIDING_FIELDS_TWO_3800
     * @tc.name      testOverridingFieldsTwo0038
     * @tc.desc      When extending a class, an instance field declared in a superclass can be overridden
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverridingFieldsTwo0038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F239 = new A_F239()
      expect(a.field instanceof float).assertTrue()
      expect(a.field).assertEqual(0.0f)
      expect(get_field(a)).assertEqual(0.0f)
      set_field(a, 9.8f)
      expect(a.field).assertEqual(9.8f)
      expect(get_field(a)).assertEqual(9.8f)
    })

    /**
     * @tc.number    SUB_OVERRIDING_FIELDS_TWO_3900
     * @tc.name      testOverridingFieldsTwo0039
     * @tc.desc      When extending a class, an instance field declared in a superclass can be overridden
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverridingFieldsTwo0039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F240 = new A_F240()
      expect(a.field instanceof long).assertTrue()
      expect(a.field).assertEqual(0)
      expect(get_field(a)).assertEqual(0)
      set_field(a, 9223372036854775000)
      expect(a.field).assertEqual(9223372036854775000)
      expect(get_field(a)).assertEqual(9223372036854775000)
    })

    /**
     * @tc.number    SUB_OVERRIDING_FIELDS_TWO_4000
     * @tc.name      testOverridingFieldsTwo0040
     * @tc.desc      When extending a class, an instance field declared in a superclass can be overridden
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverridingFieldsTwo0040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F241 = new A_F241()
      expect(a.field instanceof int).assertTrue()
      expect(a.field).assertEqual(0)
      expect(get_field(a)).assertEqual(0)
      set_field(a, 321321)
      expect(a.field).assertEqual(321321)
      expect(get_field(a)).assertEqual(321321)
    })

    /**
     * @tc.number    SUB_OVERRIDING_FIELDS_TWO_4100
     * @tc.name      testOverridingFieldsTwo0041
     * @tc.desc      When extending a class, an instance field declared in a superclass can be overridden
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverridingFieldsTwo0041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F242 = new A_F242()
      expect(a.field instanceof short).assertTrue()
      expect(a.field).assertEqual(0)
      expect(get_field(a)).assertEqual(0)
      set_field(a, 536)
      expect(a.field).assertEqual(536)
      expect(get_field(a)).assertEqual(536)
    })

    /**
     * @tc.number    SUB_OVERRIDING_FIELDS_TWO_4200
     * @tc.name      testOverridingFieldsTwo0042
     * @tc.desc      When extending a class, an instance field declared in a superclass can be overridden
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverridingFieldsTwo0042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F243 = new A_F243()
      expect(a.field instanceof byte).assertTrue()
      expect(a.field).assertEqual(0)
      expect(get_field(a)).assertEqual(0)
      set_field(a, 15)
      expect(a.field).assertEqual(15)
      expect(get_field(a)).assertEqual(15)
    })

    /**
     * @tc.number    SUB_OVERRIDING_FIELDS_TWO_4300
     * @tc.name      testOverridingFieldsTwo0043
     * @tc.desc      When extending a class, an instance field declared in a superclass can be overridden
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverridingFieldsTwo0043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F244 = new A_F244()
      expect(a.field instanceof char).assertTrue()
      expect(a.field).assertEqual(c'\u0000')
      expect(get_field(a)).assertEqual(c'\u0000')
      set_field(a, c'x')
      expect(a.field).assertEqual(c'x')
      expect(get_field(a)).assertEqual(c'x')
    })

    /**
     * @tc.number    SUB_OVERRIDING_FIELDS_TWO_4400
     * @tc.name      testOverridingFieldsTwo0044
     * @tc.desc      When extending a class, an instance field declared in a superclass can be overridden
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverridingFieldsTwo0044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F245 = new A_F245()
      expect(a.field instanceof boolean).assertTrue()
      expect(a.field).assertEqual(false)
      expect(get_field(a)).assertEqual(false)
      set_field(a, true)
      expect(a.field).assertEqual(true)
      expect(get_field(a)).assertEqual(true)
    })

    /**
     * @tc.number    SUB_OVERRIDING_FIELDS_TWO_4500
     * @tc.name      testOverridingFieldsTwo0045
     * @tc.desc      When extending a class, an instance field declared in a superclass can be overridden
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverridingFieldsTwo0045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F247 = new A_F247()
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual("abc")
      expect(get_field(a)).assertEqual("abc")
      set_field(a, 7)
      expect(a.field).assertEqual(7)
      expect(get_field(a)).assertEqual(7)
    })

    /**
     * @tc.number    SUB_OVERRIDING_FIELDS_TWO_4600
     * @tc.name      testOverridingFieldsTwo0046
     * @tc.desc      When extending a class, an instance field declared in a superclass can be overridden
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverridingFieldsTwo0046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F248 = new A_F248()
      expect(a.field instanceof number).assertTrue()
      expect(a.field).assertEqual(6.7)
      expect(get_field(a)).assertEqual(6.7)
      set_field(a, 13)
      expect(a.field).assertEqual(13)
      expect(get_field(a)).assertEqual(13)
    })

    /**
     * @tc.number    SUB_OVERRIDING_FIELDS_TWO_4700
     * @tc.name      testOverridingFieldsTwo0047
     * @tc.desc      When extending a class, an instance field declared in a superclass can be overridden
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverridingFieldsTwo0047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F249 = new A_F249()
      expect(a.field instanceof double).assertTrue()
      expect(a.field).assertEqual(5.0)
      expect(get_field(a)).assertEqual(5.0)
      set_field(a, 15)
      expect(a.field).assertEqual(15)
      expect(get_field(a)).assertEqual(15)
    })

    /**
     * @tc.number    SUB_OVERRIDING_FIELDS_TWO_4800
     * @tc.name      testOverridingFieldsTwo0048
     * @tc.desc      When extending a class, an instance field declared in a superclass can be overridden
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverridingFieldsTwo0048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F250 = new A_F250()
      expect(a.field instanceof float).assertTrue()
      expect(a.field).assertEqual(7.3f)
      expect(get_field(a)).assertEqual(7.3f)
      set_field(a, 9.8f)
      expect(a.field).assertEqual(9.8f)
      expect(get_field(a)).assertEqual(9.8f)
    })

    /**
     * @tc.number    SUB_OVERRIDING_FIELDS_TWO_4900
     * @tc.name      testOverridingFieldsTwo0049
     * @tc.desc      When extending a class, an instance field declared in a superclass can be overridden
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverridingFieldsTwo0049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F251 = new A_F251()
      expect(a.field instanceof long).assertTrue()
      expect(a.field).assertEqual(78945)
      expect(get_field(a)).assertEqual(78945)
      set_field(a, 9223372036854775000)
      expect(a.field).assertEqual(9223372036854775000)
      expect(get_field(a)).assertEqual(9223372036854775000)
    })

    /**
     * @tc.number    SUB_OVERRIDING_FIELDS_TWO_5000
     * @tc.name      testOverridingFieldsTwo0050
     * @tc.desc      When extending a class, an instance field declared in a superclass can be overridden
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverridingFieldsTwo0050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F252 = new A_F252()
      expect(a.field instanceof int).assertTrue()
      expect(a.field).assertEqual(321)
      expect(get_field(a)).assertEqual(321)
      set_field(a, 321321)
      expect(a.field).assertEqual(321321)
      expect(get_field(a)).assertEqual(321321)
    })

    /**
     * @tc.number    SUB_OVERRIDING_FIELDS_TWO_5100
     * @tc.name      testOverridingFieldsTwo0051
     * @tc.desc      When extending a class, an instance field declared in a superclass can be overridden
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverridingFieldsTwo0051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F253 = new A_F253()
      expect(a.field instanceof short).assertTrue()
      expect(a.field).assertEqual(253)
      expect(get_field(a)).assertEqual(253)
      set_field(a, 536)
      expect(a.field).assertEqual(536)
      expect(get_field(a)).assertEqual(536)
    })

    /**
     * @tc.number    SUB_OVERRIDING_FIELDS_TWO_5200
     * @tc.name      testOverridingFieldsTwo0052
     * @tc.desc      When extending a class, an instance field declared in a superclass can be overridden
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverridingFieldsTwo0052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F254 = new A_F254()
      expect(a.field instanceof byte).assertTrue()
      expect(a.field).assertEqual(78)
      expect(get_field(a)).assertEqual(78)
      set_field(a, 15)
      expect(a.field).assertEqual(15)
      expect(get_field(a)).assertEqual(15)
    })

    /**
     * @tc.number    SUB_OVERRIDING_FIELDS_TWO_5300
     * @tc.name      testOverridingFieldsTwo0053
     * @tc.desc      When extending a class, an instance field declared in a superclass can be overridden
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverridingFieldsTwo0053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F255 = new A_F255()
      expect(a.field instanceof string).assertTrue()
      expect(a.field).assertEqual("defg")
      expect(get_field(a)).assertEqual("defg")
      set_field(a, "hijk")
      expect(a.field).assertEqual("hijk")
      expect(get_field(a)).assertEqual("hijk")
    })

    /**
     * @tc.number    SUB_OVERRIDING_FIELDS_TWO_5400
     * @tc.name      testOverridingFieldsTwo0054
     * @tc.desc      When extending a class, an instance field declared in a superclass can be overridden
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverridingFieldsTwo0054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F256 = new A_F256()
      expect(a.field instanceof bigint).assertTrue()
      expect(a.field).assertEqual(5556423623465n)
      expect(get_field(a)).assertEqual(5556423623465n)
      set_field(a, 123123n)
      expect(a.field).assertEqual(123123n)
      expect(get_field(a)).assertEqual(123123n)
    })

    /**
     * @tc.number    SUB_OVERRIDING_FIELDS_TWO_5500
     * @tc.name      testOverridingFieldsTwo0055
     * @tc.desc      When extending a class, an instance field declared in a superclass can be overridden
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverridingFieldsTwo0055", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F257 = new A_F257()
      expect(a.field instanceof char).assertTrue()
      expect(a.field).assertEqual(c'z')
      expect(get_field(a)).assertEqual(c'z')
      set_field(a, c'x')
      expect(a.field).assertEqual(c'x')
      expect(get_field(a)).assertEqual(c'x')
    })

    /**
     * @tc.number    SUB_OVERRIDING_FIELDS_TWO_5600
     * @tc.name      testOverridingFieldsTwo0056
     * @tc.desc      When extending a class, an instance field declared in a superclass can be overridden
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverridingFieldsTwo0056", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F258 = new A_F258()
      expect(a.field instanceof boolean).assertTrue()
      expect(a.field).assertEqual(true)
      expect(get_field(a)).assertEqual(true)
      set_field(a, false)
      expect(a.field).assertEqual(false)
      expect(get_field(a)).assertEqual(false)
    })

    /**
     * @tc.number    SUB_OVERRIDING_FIELDS_TWO_5700
     * @tc.name      testOverridingFieldsTwo0057
     * @tc.desc      An overriding member can keep or extend an access modifier of a member that
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverridingFieldsTwo0057", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F260 = new A_F260()
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual("abc")
      expect(a.get_field()).assertEqual("abc")
      expect(get_field(a)).assertEqual("abc")
    })

    /**
     * @tc.number    SUB_OVERRIDING_FIELDS_TWO_5800
     * @tc.name      testOverridingFieldsTwo0058
     * @tc.desc      An overriding member can keep or extend an access modifier of a member that
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverridingFieldsTwo0058", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F261 = new A_F261()
      expect(a.field instanceof number).assertTrue()
      expect(a.field).assertEqual(6.7)
      expect(a.get_field()).assertEqual(6.7)
      expect(get_field(a)).assertEqual(6.7)
    })

    /**
     * @tc.number    SUB_OVERRIDING_FIELDS_TWO_5900
     * @tc.name      testOverridingFieldsTwo0059
     * @tc.desc      An overriding member can keep or extend an access modifier of a member that
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverridingFieldsTwo0059", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F262 = new A_F262()
      expect(a.field instanceof double).assertTrue()
      expect(a.field).assertEqual(5.0)
      expect(a.get_field()).assertEqual(5.0)
      expect(get_field(a)).assertEqual(5.0)
    })

    /**
     * @tc.number    SUB_OVERRIDING_FIELDS_TWO_6000
     * @tc.name      testOverridingFieldsTwo0060
     * @tc.desc      An overriding member can keep or extend an access modifier of a member that
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverridingFieldsTwo0060", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F263 = new A_F263()
      expect(a.field instanceof float).assertTrue()
      expect(a.field).assertEqual(7.3f)
      expect(a.get_field()).assertEqual(7.3f)
      expect(get_field(a)).assertEqual(7.3f)
    })

    /**
     * @tc.number    SUB_OVERRIDING_FIELDS_TWO_6100
     * @tc.name      testOverridingFieldsTwo0061
     * @tc.desc      An overriding member can keep or extend an access modifier of a member that
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverridingFieldsTwo0061", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F264 = new A_F264()
      expect(a.field instanceof long).assertTrue()
      expect(a.field).assertEqual(78945)
      expect(a.get_field()).assertEqual(78945)
      expect(get_field(a)).assertEqual(78945)
    })

    /**
     * @tc.number    SUB_OVERRIDING_FIELDS_TWO_6200
     * @tc.name      testOverridingFieldsTwo0062
     * @tc.desc      An overriding member can keep or extend an access modifier of a member that
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverridingFieldsTwo0062", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F265 = new A_F265()
      expect(a.field instanceof int).assertTrue()
      expect(a.field).assertEqual(321)
      expect(a.get_field()).assertEqual(321)
      expect(get_field(a)).assertEqual(321)
    })

    /**
     * @tc.number    SUB_OVERRIDING_FIELDS_TWO_6300
     * @tc.name      testOverridingFieldsTwo0063
     * @tc.desc      An overriding member can keep or extend an access modifier of a member that
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverridingFieldsTwo0063", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F266 = new A_F266()
      expect(a.field instanceof short).assertTrue()
      expect(a.field).assertEqual(253)
      expect(a.get_field()).assertEqual(253)
      expect(get_field(a)).assertEqual(253)
    })

    /**
     * @tc.number    SUB_OVERRIDING_FIELDS_TWO_6400
     * @tc.name      testOverridingFieldsTwo0064
     * @tc.desc      An overriding member can keep or extend an access modifier of a member that
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverridingFieldsTwo0064", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F267 = new A_F267()
      expect(a.field instanceof byte).assertTrue()
      expect(a.field).assertEqual(78)
      expect(a.get_field()).assertEqual(78)
      expect(get_field(a)).assertEqual(78)
    })

    /**
     * @tc.number    SUB_OVERRIDING_FIELDS_TWO_6500
     * @tc.name      testOverridingFieldsTwo0065
     * @tc.desc      An overriding member can keep or extend an access modifier of a member that
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverridingFieldsTwo0065", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F268 = new A_F268()
      expect(a.field instanceof string).assertTrue()
      expect(a.field).assertEqual("defg")
      expect(a.get_field()).assertEqual("defg")
      expect(get_field(a)).assertEqual("defg")
    })

    /**
     * @tc.number    SUB_OVERRIDING_FIELDS_TWO_6600
     * @tc.name      testOverridingFieldsTwo0066
     * @tc.desc      An overriding member can keep or extend an access modifier of a member that
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverridingFieldsTwo0066", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F269 = new A_F269()
      expect(a.field instanceof bigint).assertTrue()
      expect(a.field).assertEqual(5556423623465n)
      expect(a.get_field()).assertEqual(5556423623465n)
      expect(get_field(a)).assertEqual(5556423623465n)
    })

    /**
     * @tc.number    SUB_OVERRIDING_FIELDS_TWO_6700
     * @tc.name      testOverridingFieldsTwo0067
     * @tc.desc      An overriding member can keep or extend an access modifier of a member that
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverridingFieldsTwo0067", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F270 = new A_F270()
      expect(a.field instanceof char).assertTrue()
      expect(a.field).assertEqual(c'z')
      expect(a.get_field()).assertEqual(c'z')
      expect(get_field(a)).assertEqual(c'z')
    })

    /**
     * @tc.number    SUB_OVERRIDING_FIELDS_TWO_6800
     * @tc.name      testOverridingFieldsTwo0068
     * @tc.desc      An overriding member can keep or extend an access modifier of a member that
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverridingFieldsTwo0068", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F271 = new A_F271()
      expect(typeof a.get_field() === 'boolean').assertTrue();
      expect(a.get_field()).assertEqual(true);
    })

    /**
     * @tc.number    SUB_OVERRIDING_FIELDS_TWO_6900
     * @tc.name      testOverridingFieldsTwo0069
     * @tc.desc      Getting overridden field through array element
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverridingFieldsTwo0069", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Base_F272[] = [new A_F272()]
      expect(a[0].field instanceof number).assertTrue()
      expect(a[0].field).assertEqual(7)
    })

    /**
     * @tc.number    SUB_OVERRIDING_FIELDS_TWO_7000
     * @tc.name      testOverridingFieldsTwo0070
     * @tc.desc      An overriding member can keep or extend an access modifier of a member that
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverridingFieldsTwo0070", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F275 = new A_F275()
      expect(a.get_field() instanceof Object).assertTrue()
      expect(a.get_field()).assertEqual("abc")
      expect(get_field(a)).assertEqual("abc")
    })

    /**
     * @tc.number    SUB_OVERRIDING_FIELDS_TWO_7100
     * @tc.name      testOverridingFieldsTwo0071
     * @tc.desc      An overriding member can keep or extend an access modifier of a member that
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverridingFieldsTwo0071", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F276 = new A_F276()
      expect(a.get_field() instanceof number).assertTrue()
      expect(a.get_field()).assertEqual(6.7)
      expect(get_field(a)).assertEqual(6.7)
    })

    /**
     * @tc.number    SUB_OVERRIDING_FIELDS_TWO_7200
     * @tc.name      testOverridingFieldsTwo0072
     * @tc.desc      An overriding member can keep or extend an access modifier of a member that
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverridingFieldsTwo0072", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F277 = new A_F277()
      expect(a.get_field() instanceof double).assertTrue()
      expect(a.get_field()).assertEqual(5.0)
      expect(get_field(a)).assertEqual(5.0)
    })

    /**
     * @tc.number    SUB_OVERRIDING_FIELDS_TWO_7300
     * @tc.name      testOverridingFieldsTwo0073
     * @tc.desc      An overriding member can keep or extend an access modifier of a member that
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverridingFieldsTwo0073", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F278 = new A_F278()
      expect(a.get_field() instanceof float).assertTrue()
      expect(a.get_field()).assertEqual(7.3f)
      expect(get_field(a)).assertEqual(7.3f)
    })

    /**
     * @tc.number    SUB_OVERRIDING_FIELDS_TWO_7400
     * @tc.name      testOverridingFieldsTwo0074
     * @tc.desc      An overriding member can keep or extend an access modifier of a member that
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverridingFieldsTwo0074", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F279 = new A_F279()
      expect(a.get_field() instanceof long).assertTrue()
      expect(a.get_field()).assertEqual(78945)
      expect(get_field(a)).assertEqual(78945)
    })

    /**
     * @tc.number    SUB_OVERRIDING_FIELDS_TWO_7500
     * @tc.name      testOverridingFieldsTwo0075
     * @tc.desc      An overriding member can keep or extend an access modifier of a member that
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverridingFieldsTwo0075", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F280 = new A_F280()
      expect(a.get_field() instanceof int).assertTrue()
      expect(a.get_field()).assertEqual(321)
      expect(get_field(a)).assertEqual(321)
    })

    /**
     * @tc.number    SUB_OVERRIDING_FIELDS_TWO_7600
     * @tc.name      testOverridingFieldsTwo0076
     * @tc.desc      An overriding member can keep or extend an access modifier of a member that
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverridingFieldsTwo0076", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F281 = new A_F281()
      expect(a.get_field() instanceof short).assertTrue()
      expect(a.get_field()).assertEqual(253)
      expect(get_field(a)).assertEqual(253)
    })

    /**
     * @tc.number    SUB_OVERRIDING_FIELDS_TWO_7700
     * @tc.name      testOverridingFieldsTwo0077
     * @tc.desc      An overriding member can keep or extend an access modifier of a member that
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverridingFieldsTwo0077", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F282 = new A_F282()
      expect(a.get_field() instanceof byte).assertTrue()
      expect(a.get_field()).assertEqual(78)
      expect(get_field(a)).assertEqual(78)
    })

    /**
     * @tc.number    SUB_OVERRIDING_FIELDS_TWO_7800
     * @tc.name      testOverridingFieldsTwo0078
     * @tc.desc      An overriding member can keep or extend an access modifier of a member that
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverridingFieldsTwo0078", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F283 = new A_F283()
      expect(a.get_field() instanceof string).assertTrue()
      expect(a.get_field()).assertEqual("defg")
      expect(get_field(a)).assertEqual("defg")
    })

    /**
     * @tc.number    SUB_OVERRIDING_FIELDS_TWO_7900
     * @tc.name      testOverridingFieldsTwo0079
     * @tc.desc      An overriding member can keep or extend an access modifier of a member that
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverridingFieldsTwo0079", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F284 = new A_F284()
      expect(a.get_field() instanceof bigint).assertTrue()
      expect(a.get_field()).assertEqual(5556423623465n)
      expect(get_field(a)).assertEqual(5556423623465n)
    })

    /**
     * @tc.number    SUB_OVERRIDING_FIELDS_TWO_8000
     * @tc.name      testOverridingFieldsTwo0080
     * @tc.desc      An overriding member can keep or extend an access modifier of a member that
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverridingFieldsTwo0080", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F285 = new A_F285()
      expect(a.get_field() instanceof char).assertTrue()
      expect(a.get_field()).assertEqual(c'z')
      expect(get_field(a)).assertEqual(c'z')
    })

    /**
     * @tc.number    SUB_OVERRIDING_FIELDS_TWO_8100
     * @tc.name      testOverridingFieldsTwo0081
     * @tc.desc      An overriding member can keep or extend an access modifier of a member that
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverridingFieldsTwo0081", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F286 = new A_F286()
      expect(a.get_field() instanceof boolean).assertTrue()
      expect(a.get_field()).assertEqual(true)
      expect(get_field(a)).assertEqual(true)
    })

    /**
     * @tc.number    SUB_OVERRIDING_FIELDS_TWO_8200
     * @tc.name      testOverridingFieldsTwo0082
     * @tc.desc      Overriding in first and second derived class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverridingFieldsTwo0082", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Derived_F288 = new Derived_F288()
      let b: D_F288 = new D_F288()
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(7)
      expect(get_field(a)).assertEqual(7)
      set_field(a, 7.8)
      expect(a.field).assertEqual(7.8)
      expect(get_field(a)).assertEqual(7.8)
      expect(b.field instanceof Object).assertTrue()
      expect(b.field).assertEqual("abc")
      expect(get_field(b)).assertEqual("abc")
      set_field(b, 7.8)
      expect(b.field).assertEqual(7.8)
      expect(get_field(b)).assertEqual(7.8)
    })

    /**
     * @tc.number    SUB_OVERRIDING_FIELDS_TWO_8300
     * @tc.name      testOverridingFieldsTwo0083
     * @tc.desc      Overriding in first and second derived class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverridingFieldsTwo0083", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Derived_F289 = new Derived_F289()
      let b: D_F289 = new D_F289()
      expect(a.field instanceof number).assertTrue()
      expect(a.field).assertEqual(13)
      expect(get_field(a)).assertEqual(13)
      set_field(a, 15.6)
      expect(a.field).assertEqual(15.6)
      expect(get_field(a)).assertEqual(15.6)
      expect(b.field instanceof number).assertTrue()
      expect(b.field).assertEqual(6.7)
      expect(get_field(b)).assertEqual(6.7)
      set_field(b, 15.6)
      expect(b.field).assertEqual(15.6)
      expect(get_field(b)).assertEqual(15.6)
    })

    /**
     * @tc.number    SUB_OVERRIDING_FIELDS_TWO_8400
     * @tc.name      testOverridingFieldsTwo0084
     * @tc.desc      Overriding in first and second derived class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverridingFieldsTwo0084", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Derived_F290 = new Derived_F290()
      let b: D_F290 = new D_F290()
      expect(a.field instanceof double).assertTrue()
      expect(a.field).assertEqual(15)
      expect(get_field(a)).assertEqual(15)
      set_field(a, 17.3)
      expect(a.field).assertEqual(17.3)
      expect(get_field(a)).assertEqual(17.3)
      expect(b.field instanceof double).assertTrue()
      expect(b.field).assertEqual(5.0)
      expect(get_field(b)).assertEqual(5.0)
      set_field(b, 17.3)
      expect(b.field).assertEqual(17.3)
      expect(get_field(b)).assertEqual(17.3)
    })

    /**
     * @tc.number    SUB_OVERRIDING_FIELDS_TWO_8500
     * @tc.name      testOverridingFieldsTwo0085
     * @tc.desc      Overriding in first and second derived class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverridingFieldsTwo0085", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Derived_F291 = new Derived_F291()
      let b: D_F291 = new D_F291()
      expect(a.field instanceof float).assertTrue()
      expect(a.field).assertEqual(9.8f)
      expect(get_field(a)).assertEqual(9.8f)
      set_field(a, 3.4f)
      expect(a.field).assertEqual(3.4f)
      expect(get_field(a)).assertEqual(3.4f)
      expect(b.field instanceof float).assertTrue()
      expect(b.field).assertEqual(7.3f)
      expect(get_field(b)).assertEqual(7.3f)
      set_field(b, 3.4f)
      expect(b.field).assertEqual(3.4f)
      expect(get_field(b)).assertEqual(3.4f)
    })

    /**
     * @tc.number    SUB_OVERRIDING_FIELDS_TWO_8600
     * @tc.name      testOverridingFieldsTwo0086
     * @tc.desc      Overriding in first and second derived class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverridingFieldsTwo0086", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Derived_F292 = new Derived_F292()
      let b: D_F292 = new D_F292()
      expect(a.field instanceof long).assertTrue()
      expect(a.field).assertEqual(357)
      expect(get_field(a)).assertEqual(357)
      set_field(a, 127)
      expect(a.field).assertEqual(127)
      expect(get_field(a)).assertEqual(127)
      expect(b.field instanceof long).assertTrue()
      expect(b.field).assertEqual(78945)
      expect(get_field(b)).assertEqual(78945)
      set_field(b, 127)
      expect(b.field).assertEqual(127)
      expect(get_field(b)).assertEqual(127)
    })

    /**
     * @tc.number    SUB_OVERRIDING_FIELDS_TWO_8700
     * @tc.name      testOverridingFieldsTwo0087
     * @tc.desc      Overriding in first and second derived class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverridingFieldsTwo0087", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Derived_F293 = new Derived_F293()
      let b: D_F293 = new D_F293()
      expect(a.field instanceof int).assertTrue()
      expect(a.field).assertEqual(321321)
      expect(get_field(a)).assertEqual(321321)
      set_field(a, 753)
      expect(a.field).assertEqual(753)
      expect(get_field(a)).assertEqual(753)
      expect(b.field instanceof int).assertTrue()
      expect(b.field).assertEqual(321)
      expect(get_field(b)).assertEqual(321)
      set_field(b, 753)
      expect(b.field).assertEqual(753)
      expect(get_field(b)).assertEqual(753)
    })

    /**
     * @tc.number    SUB_OVERRIDING_FIELDS_TWO_8800
     * @tc.name      testOverridingFieldsTwo0088
     * @tc.desc      Overriding in first and second derived class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverridingFieldsTwo0088", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Derived_F294 = new Derived_F294()
      let b: D_F294 = new D_F294()
      expect(a.field instanceof short).assertTrue()
      expect(a.field).assertEqual(536)
      expect(get_field(a)).assertEqual(536)
      set_field(a, 537)
      expect(a.field).assertEqual(537)
      expect(get_field(a)).assertEqual(537)
      expect(b.field instanceof short).assertTrue()
      expect(b.field).assertEqual(253)
      expect(get_field(b)).assertEqual(253)
      set_field(b, 537)
      expect(b.field).assertEqual(537)
      expect(get_field(b)).assertEqual(537)
    })

    /**
     * @tc.number    SUB_OVERRIDING_FIELDS_TWO_8900
     * @tc.name      testOverridingFieldsTwo0089
     * @tc.desc      Overriding in first and second derived class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverridingFieldsTwo0089", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Derived_F295 = new Derived_F295()
      let b: D_F295 = new D_F295()
      expect(a.field instanceof byte).assertTrue()
      expect(a.field).assertEqual(15)
      expect(get_field(a)).assertEqual(15)
      set_field(a, 117)
      expect(a.field).assertEqual(117)
      expect(get_field(a)).assertEqual(117)
      expect(b.field instanceof byte).assertTrue()
      expect(b.field).assertEqual(78)
      expect(get_field(b)).assertEqual(78)
      set_field(b, 117)
      expect(b.field).assertEqual(117)
      expect(get_field(b)).assertEqual(117)
    })

    /**
     * @tc.number    SUB_OVERRIDING_FIELDS_TWO_9000
     * @tc.name      testOverridingFieldsTwo0090
     * @tc.desc      Overriding in first and second derived class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverridingFieldsTwo0090", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Derived_F296 = new Derived_F296()
      let b: D_F296 = new D_F296()
      expect(a.field instanceof string).assertTrue()
      expect(a.field).assertEqual("ijk")
      expect(get_field(a)).assertEqual("ijk")
      set_field(a, "lmn")
      expect(a.field).assertEqual("lmn")
      expect(get_field(a)).assertEqual("lmn")
      expect(b.field instanceof string).assertTrue()
      expect(b.field).assertEqual("efg")
      expect(get_field(b)).assertEqual("efg")
      set_field(b, "lmn")
      expect(b.field).assertEqual("lmn")
      expect(get_field(b)).assertEqual("lmn")
    })

    /**
     * @tc.number    SUB_OVERRIDING_FIELDS_TWO_9100
     * @tc.name      testOverridingFieldsTwo0091
     * @tc.desc      Overriding in first and second derived class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverridingFieldsTwo0091", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Derived_F297 = new Derived_F297()
      let b: D_F297 = new D_F297()
      expect(a.field instanceof bigint).assertTrue()
      expect(a.field).assertEqual(123n)
      expect(get_field(a)).assertEqual(123n)
      set_field(a, 321n)
      expect(a.field).assertEqual(321n)
      expect(get_field(a)).assertEqual(321n)
      expect(b.field instanceof bigint).assertTrue()
      expect(b.field).assertEqual(555642n)
      expect(get_field(b)).assertEqual(555642n)
      set_field(b, 321n)
      expect(b.field).assertEqual(321n)
      expect(get_field(b)).assertEqual(321n)
    })
  })
}
