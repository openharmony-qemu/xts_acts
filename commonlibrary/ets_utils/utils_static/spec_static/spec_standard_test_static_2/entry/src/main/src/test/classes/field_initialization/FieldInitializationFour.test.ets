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

class Base_F397 {
    protected v: short = 4
  }
  class A_F397 extends Base_F397 {
    field: short
    constructor () {
      super()
      this.field = this.v
    }
  }

class Base_F398 {
    protected v: double = 4
  }
  class A_F398 extends Base_F398 {
    field: double
    constructor () {
      super()
      this.field = this.v
    }
  }

class Base_F399 {
    protected v: number = 4
  }
  class A_F399 extends Base_F399 {
    field: number
    constructor () {
      super()
      this.field = this.v
    }
  }

class Base_F400 {
    protected v: float = 4.5f
  }
  class A_F400 extends Base_F400 {
    field: float
    constructor () {
      super()
      this.field = this.v
    }
  }

class Base_F401 {
    protected v: bigint = 4n
  }
  class A_F401 extends Base_F401 {
    field: bigint
    constructor () {
      super()
      this.field = this.v
    }
  }

class Base_F402 {
    protected v: string = "abc"
  }
  class A_F402 extends Base_F402 {
    field: string
    constructor () {
      super()
      this.field = this.v
    }
  }

class Base_F403 {
    protected v: char = c'a'
  }
  class A_F403 extends Base_F403 {
    field: char
    constructor () {
      super()
      this.field = this.v
    }
  }

class Base_F404 {
    protected v: boolean = false
  }
  class A_F404 extends Base_F404 {
    field: boolean
    constructor () {
      super()
      this.field = this.v
    }
  }

class Base_F405 {
    protected v: Object = 4
  }
  class A_F405 extends Base_F405 {
    field: Object
    constructor () {
      super()
      this.field = this.v
    }
  }

class Base_F406 {
    protected v: Object | undefined = undefined
  }
  class A_F406 extends Base_F406 {
    field: Object | undefined
    constructor () {
      super()
      this.field = this.v
    }
  }

class Base_F407 {
    protected v: Object | undefined | null = 4
  }
  class A_F407 extends Base_F407 {
    field: Object | undefined | null
    constructor () {
      super()
      this.field = this.v
    }
  }

class Base_F408 {
    protected v: Any = 4
  }
  class A_F408 extends Base_F408 {
    field: Any
    constructor () {
      super()
      this.field = this.v
    }
  }

class A_F409 {
    protected _field: long
    get field(): long {
      return this._field
    }
    set field(a: long) {
      this._field = a
    }
    constructor () {
      this._field = 4
    }
  }

class A_F410 {
    protected _field: int
    get field(): int {
      return this._field
    }
    set field(a: int) {
      this._field = a
    }
    constructor () {
      this._field = 4
    }
  }

class A_F411 {
    protected _field: byte
    get field(): byte {
      return this._field
    }
    set field(a: byte) {
      this._field = a
    }
    constructor () {
      this._field = 4
    }
  }

class A_F412 {
    protected _field: short
    get field(): short {
      return this._field
    }
    set field(a: short) {
      this._field = a
    }
    constructor () {
      this._field = 4
    }
  }

class A_F413 {
    protected _field: double
    get field(): double {
      return this._field
    }
    set field(a: double) {
      this._field = a
    }
    constructor () {
      this._field = 4
    }
  }

class A_F414 {
    protected _field: number
    get field(): number {
      return this._field
    }
    set field(a: number) {
      this._field = a
    }
    constructor () {
      this._field = 4
    }
  }

class A_F415 {
    protected _field: float
    get field(): float {
      return this._field
    }
    set field(a: float) {
      this._field = a
    }
    constructor () {
      this._field = 4.5f
    }
  }

class A_F416 {
    protected _field: bigint
    get field(): bigint {
      return this._field
    }
    set field(a: bigint) {
      this._field = a
    }
    constructor () {
      this._field = 4n
    }
  }

class A_F417 {
    protected _field: string
    get field(): string {
      return this._field
    }
    set field(a: string) {
      this._field = a
    }
    constructor () {
      this._field = "abc"
    }
  }

class A_F418 {
    protected _field: char
    get field(): char {
      return this._field
    }
    set field(a: char) {
      this._field = a
    }
    constructor () {
      this._field = c'a'
    }
  }

class A_F419 {
    protected _field: boolean
    get field(): boolean {
      return this._field
    }
    set field(a: boolean) {
      this._field = a
    }
    constructor () {
      this._field = false
    }
  }

class A_F420 {
    protected _field: Object
    get field(): Object {
      return this._field
    }
    set field(a: Object) {
      this._field = a
    }
    constructor () {
      this._field = 4
    }
  }

class A_F421 {
    protected _field: Object | undefined
    get field(): Object | undefined {
      return this._field
    }
    set field(a: Object | undefined) {
      this._field = a
    }
    constructor () {
      this._field = undefined
    }
  }

class A_F422 {
    protected _field: Object | undefined | null
    get field(): Object | undefined | null {
      return this._field
    }
    set field(a: Object | undefined | null) {
      this._field = a
    }
    constructor () {
      this._field = 4
    }
  }

class A_F423 {
    protected _field: Any
    get field(): Any {
      return this._field
    }
    set field(a: Any) {
      this._field = a
    }
    constructor () {
      this._field = 4
    }
  }

class Base_F424 {
    private _v: long = 4
    get v(): long {
      return this._v
    }
  }
  class A_F424 extends Base_F424 {
    field: long
    constructor () {
      super()
      this.field = super.v
    }
  }

class Base_F425 {
    private _v: int = 4
    get v(): int {
      return this._v
    }
  }
  class A_F425 extends Base_F425 {
    field: int
    constructor () {
      super()
      this.field = super.v
    }
  }

class Base_F426 {
    private _v: byte = 4
    get v(): byte {
      return this._v
    }
  }
  class A_F426 extends Base_F426 {
    field: byte
    constructor () {
      super()
      this.field = super.v
    }
  }

class Base_F427 {
    private _v: short = 4
    get v(): short {
      return this._v
    }
  }
  class A_F427 extends Base_F427 {
    field: short
    constructor () {
      super()
      this.field = super.v
    }
  }

class Base_F428 {
    private _v: double = 4
    get v(): double {
      return this._v
    }
  }
  class A_F428 extends Base_F428 {
    field: double
    constructor () {
      super()
      this.field = super.v
    }
  }

class Base_F429 {
    private _v: number = 4
    get v(): number {
      return this._v
    }
  }
  class A_F429 extends Base_F429 {
    field: number
    constructor () {
      super()
      this.field = super.v
    }
  }

class Base_F430 {
    private _v: float = 4.5f
    get v(): float {
      return this._v
    }
  }
  class A_F430 extends Base_F430 {
    field: float
    constructor () {
      super()
      this.field = super.v
    }
  }

class Base_F431 {
    private _v: bigint = 4n
    get v(): bigint {
      return this._v
    }
  }
  class A_F431 extends Base_F431 {
    field: bigint
    constructor () {
      super()
      this.field = super.v
    }
  }

class Base_F432 {
    private _v: string = "abc"
    get v(): string {
      return this._v
    }
  }
  class A_F432 extends Base_F432 {
    field: string
    constructor () {
      super()
      this.field = super.v
    }
  }

class Base_F433 {
    private _v: char = c'a'
    get v(): char {
      return this._v
    }
  }
  class A_F433 extends Base_F433 {
    field: char
    constructor () {
      super()
      this.field = super.v
    }
  }

class Base_F434 {
    private _v: boolean = false
    get v(): boolean {
      return this._v
    }
  }
  class A_F434 extends Base_F434 {
    field: boolean
    constructor () {
      super()
      this.field = super.v
    }
  }

class Base_F435 {
    private _v: Object = 4
    get v(): Object {
      return this._v
    }
  }
  class A_F435 extends Base_F435 {
    field: Object
    constructor () {
      super()
      this.field = super.v
    }
  }

class Base_F436 {
    private _v: Object | undefined = undefined
    get v(): Object | undefined {
      return this._v
    }
  }
  class A_F436 extends Base_F436 {
    field: Object | undefined
    constructor () {
      super()
      this.field = super.v
    }
  }

class Base_F437 {
    private _v: Object | undefined | null = 4
    get v(): Object | undefined | null {
      return this._v
    }
  }
  class A_F437 extends Base_F437 {
    field: Object | undefined | null
    constructor () {
      super()
      this.field = super.v
    }
  }

class Base_F438 {
    private _v: Any = 4
    get v(): Any {
      return this._v
    }
  }
  class A_F438 extends Base_F438 {
    field: Any
    constructor () {
      super()
      this.field = super.v
    }
  }

class A_F439 {
    private _field: long
    get field(): long {
      return this._field
    }
    set field(a: long) {
      this._field = a
    }
    constructor () {
      this._field = 4
    }
  }

class A_F440 {
    private _field: int
    get field(): int {
      return this._field
    }
    set field(a: int) {
      this._field = a
    }
    constructor () {
      this._field = 4
    }
  }

class A_F441 {
    private _field: byte
    get field(): byte {
      return this._field
    }
    set field(a: byte) {
      this._field = a
    }
    constructor () {
      this._field = 4
    }
  }

class A_F442 {
    private _field: short
    get field(): short {
      return this._field
    }
    set field(a: short) {
      this._field = a
    }
    constructor () {
      this._field = 4
    }
  }

class A_F443 {
    private _field: double
    get field(): double {
      return this._field
    }
    set field(a: double) {
      this._field = a
    }
    constructor () {
      this._field = 4
    }
  }

class A_F444 {
    private _field: number
    get field(): number {
      return this._field
    }
    set field(a: number) {
      this._field = a
    }
    constructor () {
      this._field = 4
    }
  }

class A_F445 {
    private _field: float
    get field(): float {
      return this._field
    }
    set field(a: float) {
      this._field = a
    }
    constructor () {
      this._field = 4.5f
    }
  }

class A_F446 {
    private _field: bigint
    get field(): bigint {
      return this._field
    }
    set field(a: bigint) {
      this._field = a
    }
    constructor () {
      this._field = 4n
    }
  }

class A_F447 {
    private _field: string
    get field(): string {
      return this._field
    }
    set field(a: string) {
      this._field = a
    }
    constructor () {
      this._field = "abc"
    }
  }

class A_F448 {
    private _field: char
    get field(): char {
      return this._field
    }
    set field(a: char) {
      this._field = a
    }
    constructor () {
      this._field = c'a'
    }
  }

class A_F449 {
    private _field: boolean
    get field(): boolean {
      return this._field
    }
    set field(a: boolean) {
      this._field = a
    }
    constructor () {
      this._field = false
    }
  }

class A_F450 {
    private _field: Object
    get field(): Object {
      return this._field
    }
    set field(a: Object) {
      this._field = a
    }
    constructor () {
      this._field = 4
    }
  }

class A_F451 {
    private _field: Object | undefined
    get field(): Object | undefined {
      return this._field
    }
    set field(a: Object | undefined) {
      this._field = a
    }
    constructor () {
      this._field = undefined
    }
  }

class A_F452 {
    private _field: Object | undefined | null
    get field(): Object | undefined | null {
      return this._field
    }
    set field(a: Object | undefined | null) {
      this._field = a
    }
    constructor () {
      this._field = 4
    }
  }

class A_F453 {
    private _field: Any
    get field(): Any {
      return this._field
    }
    set field(a: Any) {
      this._field = a
    }
    constructor () {
      this._field = 4
    }
  }

class A_F454 {
    private _field: long
    get field(): long {
      return this._field
    }
    set field(a: long) {
      this._field = a
    }
    constructor (arg: long = 4) {
      this._field = arg
    }
  }

class A_F455 {
    private _field: int
    get field(): int {
      return this._field
    }
    set field(a: int) {
      this._field = a
    }
    constructor (arg: int = 4) {
      this._field = arg
    }
  }

class A_F456 {
    private _field: byte
    get field(): byte {
      return this._field
    }
    set field(a: byte) {
      this._field = a
    }
    constructor (arg: byte = 4) {
      this._field = arg
    }
  }

class A_F457 {
    private _field: short
    get field(): short {
      return this._field
    }
    set field(a: short) {
      this._field = a
    }
    constructor (arg: short = 4) {
      this._field = arg
    }
  }

class A_F458 {
    private _field: double
    get field(): double {
      return this._field
    }
    set field(a: double) {
      this._field = a
    }
    constructor (arg: double = 4) {
      this._field = arg
    }
  }

class A_F459 {
    private _field: number
    get field(): number {
      return this._field
    }
    set field(a: number) {
      this._field = a
    }
    constructor (arg: int = 4) {
      this._field = arg
    }
  }

class A_F460 {
    private _field: float
    get field(): float {
      return this._field
    }
    set field(a: float) {
      this._field = a
    }
    constructor (arg: float = 4.5f) {
      this._field = arg
    }
  }

class A_F461 {
    private _field: bigint
    get field(): bigint {
      return this._field
    }
    set field(a: bigint) {
      this._field = a
    }
    constructor (arg: bigint = 4n) {
      this._field = arg
    }
  }

class A_F462 {
    private _field: string
    get field(): string {
      return this._field
    }
    set field(a: string) {
      this._field = a
    }
    constructor (arg: string = "abc") {
      this._field = arg
    }
  }

class A_F463 {
    private _field: char
    get field(): char {
      return this._field
    }
    set field(a: char) {
      this._field = a
    }
    constructor (arg: char = c'a') {
      this._field = arg
    }
  }
