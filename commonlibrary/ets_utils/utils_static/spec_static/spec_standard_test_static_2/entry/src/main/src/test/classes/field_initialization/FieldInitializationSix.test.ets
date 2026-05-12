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

class C_F595 {data: int = 0}
  class A_F595 {
    field: C_F595 = {data: 4}
    constructor () {
      this.field = {data: 4}
    }
  }

class Animal_F596 {
    name: string = ""
  }
  class Dog_F596 extends Animal_F596 {
    constructor () {
      super()
      this.name = "dog"
    }
  }
  class Cat_F596 extends Animal_F596 {
    constructor () {
      super()
      this.name = "cat"
    }
  }
  class C_F596 {
    field: Animal_F596 = new Animal_F596
  }

class Animal_F597 {
    name: string = ""
  }
  class Dog_F597 extends Animal_F597 {
    constructor () {
      super()
      this.name = "dog"
    }
  }
  class Cat_F597 extends Animal_F597 {
    constructor () {
      super()
      this.name = "cat"
    }
  }
  class C_F597 {
    field: Animal_F597 = new Dog_F597
  }

class Animal_F598 {
    name: string = ""
  }
  class Dog_F598 extends Animal_F598 {
    constructor () {
      super()
      this.name = "dog"
    }
  }
  class Cat_F598 extends Animal_F598 {
    constructor () {
      super()
      this.name = "cat"
    }
  }
  class C_F598 {
    field: Animal_F598 = new Cat_F598
  }

class Animal_F599 {
    name: string = ""
  }
  class Dog_F599 extends Animal_F599 {
    constructor () {
      super()
      this.name = "dog"
    }
  }
  class Cat_F599 extends Animal_F599 {
    constructor () {
      super()
      this.name = "cat"
    }
  }
  class C_F599 {
    field: Animal_F599
    constructor() {
       this.field = new Animal_F599
    }
  }

class Animal_F600 {
    name: string = ""
  }
  class Dog_F600 extends Animal_F600 {
    constructor () {
      super()
      this.name = "dog"
    }
  }
  class Cat_F600 extends Animal_F600 {
    constructor () {
      super()
      this.name = "cat"
    }
  }
  class C_F600 {
    field: Animal_F600
    constructor() {
       this.field = new Dog_F600
    }
  }

class Animal_F601 {
    name: string = ""
  }
  class Dog_F601 extends Animal_F601 {
    constructor () {
      super()
      this.name = "dog"
    }
  }
  class Cat_F601 extends Animal_F601 {
    constructor () {
      super()
      this.name = "cat"
    }
  }
  class C_F601 {
    field: Animal_F601
    constructor() {
       this.field = new Cat_F601
    }
  }

class A_F602 {
    v: int
    constructor(v: int = 0) {
      this.v = v
    }
  }
  class B_F602 extends A_F602 {
    constructor(v: int = 0) {
      super(-v)
    }
    field(): int {
      return 13
    }
  }
  type HandlerBInt_F602 = (a: B_F602, b: int) => A_F602
  type HandlerAInt_F602 = (a: A_F602, b: int) => B_F602
  const handlerAInt_F602: HandlerAInt_F602 = (a: A_F602, b: int): B_F602 => {
    if (a instanceof B_F602){
      return new B_F602(a.field() + b)
    } else {
      return new B_F602(b)
    }
  }
  type HandlerA_F602 = (a: A_F602) => A_F602
  const handlerA_F602: HandlerA_F602 = (a: A_F602): A_F602 => {
    if (a instanceof B_F602){
      return new A_F602(a.field())
    } else {
      return new A_F602
    }
  }
  type HandlerNothing_F602 = () => B_F602
  const handlerNothing_F602: HandlerNothing_F602 = (): B_F602 => {
    return new B_F602(567)
  }
  class C_F602 {
    field: HandlerBInt_F602 = handlerNothing_F602
  }

class A_F603 {
    v: int
    constructor(v: int = 0) {
      this.v = v
    }
  }
  class B_F603 extends A_F603 {
    constructor(v: int = 0) {
      super(-v)
    }
    field(): int {
      return 13
    }
  }
  type HandlerBInt_F603 = (a: B_F603, b: int) => A_F603
  type HandlerAInt_F603 = (a: A_F603, b: int) => B_F603
  const handlerAInt_F603: HandlerAInt_F603 = (a: A_F603, b: int): B_F603 => {
    if (a instanceof B_F603){
      return new B_F603(a.field() + b)
    } else {
      return new B_F603(b)
    }
  }
  type HandlerA_F603 = (a: A_F603) => A_F603
  const handlerA_F603: HandlerA_F603 = (a: A_F603): A_F603 => {
    if (a instanceof B_F603){
      return new A_F603(a.field())
    } else {
      return new A_F603
    }
  }
  type HandlerNothing_F603 = () => B_F603
  const handlerNothing_F603: HandlerNothing_F603 = (): B_F603 => {
    return new B_F603(567)
  }
  class C_F603 {
    field: HandlerBInt_F603 = handlerA_F603
  }

class A_F604 {
    v: int
    constructor(v: int = 0) {
      this.v = v
    }
  }
  class B_F604 extends A_F604 {
    constructor(v: int = 0) {
      super(-v)
    }
    field(): int {
      return 13
    }
  }
  type HandlerBInt_F604 = (a: B_F604, b: int) => A_F604
  type HandlerAInt_F604 = (a: A_F604, b: int) => B_F604
  const handlerAInt_F604: HandlerAInt_F604 = (a: A_F604, b: int): B_F604 => {
    if (a instanceof B_F604){
      return new B_F604(a.field() + b)
    } else {
      return new B_F604(b)
    }
  }
  type HandlerA_F604 = (a: A_F604) => A_F604
  const handlerA_F604: HandlerA_F604 = (a: A_F604): A_F604 => {
    if (a instanceof B_F604){
      return new A_F604(a.field())
    } else {
      return new A_F604
    }
  }
  type HandlerNothing_F604 = () => B_F604
  const handlerNothing_F604: HandlerNothing_F604 = (): B_F604 => {
    return new B_F604(567)
  }
  class C_F604 {
    field: HandlerBInt_F604 = handlerAInt_F604
  }

class A_F605 {
    v: int
    constructor(v: int = 0) {
      this.v = v
    }
  }
  class B_F605 extends A_F605 {
    constructor(v: int = 0) {
      super(-v)
    }
    field(): int {
      return 13
    }
  }
  type HandlerBInt_F605 = (a: B_F605, b: int) => A_F605
  type HandlerAInt_F605 = (a: A_F605, b: int) => B_F605
  const handlerAInt_F605: HandlerAInt_F605 = (a: A_F605, b: int): B_F605 => {
    if (a instanceof B_F605){
      return new B_F605(a.field() + b)
    } else {
      return new B_F605(b)
    }
  }
  type HandlerA_F605 = (a: A_F605) => A_F605
  const handlerA_F605: HandlerA_F605 = (a: A_F605): A_F605 => {
    if (a instanceof B_F605){
      return new A_F605(a.field())
    } else {
      return new A_F605
    }
  }
  type HandlerNothing_F605 = () => B_F605
  const handlerNothing_F605: HandlerNothing_F605 = (): B_F605 => {
    return new B_F605(567)
  }
  class C_F605 {
    field: HandlerBInt_F605
    constructor() {
       this.field = handlerNothing_F605
    }
  }

class A_F606 {
    v: int
    constructor(v: int = 0) {
      this.v = v
    }
  }
  class B_F606 extends A_F606 {
    constructor(v: int = 0) {
      super(-v)
    }
    field(): int {
      return 13
    }
  }
  type HandlerBInt_F606 = (a: B_F606, b: int) => A_F606
  type HandlerAInt_F606 = (a: A_F606, b: int) => B_F606
  const handlerAInt_F606: HandlerAInt_F606 = (a: A_F606, b: int): B_F606 => {
    if (a instanceof B_F606){
      return new B_F606(a.field() + b)
    } else {
      return new B_F606(b)
    }
  }
  type HandlerA_F606 = (a: A_F606) => A_F606
  const handlerA_F606: HandlerA_F606 = (a: A_F606): A_F606 => {
    if (a instanceof B_F606){
      return new A_F606(a.field())
    } else {
      return new A_F606
    }
  }
  type HandlerNothing_F606 = () => B_F606
  const handlerNothing_F606: HandlerNothing_F606 = (): B_F606 => {
    return new B_F606(567)
  }
  class C_F606 {
    field: HandlerBInt_F606
    constructor() {
       this.field = handlerA_F606
    }
  }

class A_F607 {
    v: int
    constructor(v: int = 0) {
      this.v = v
    }
  }
  class B_F607 extends A_F607 {
    constructor(v: int = 0) {
      super(-v)
    }
    field(): int {
      return 13
    }
  }
  type HandlerBInt_F607 = (a: B_F607, b: int) => A_F607
  type HandlerAInt_F607 = (a: A_F607, b: int) => B_F607
  const handlerAInt_F607: HandlerAInt_F607 = (a: A_F607, b: int): B_F607 => {
    if (a instanceof B_F607){
      return new B_F607(a.field() + b)
    } else {
      return new B_F607(b)
    }
  }
  type HandlerA_F607 = (a: A_F607) => A_F607
  const handlerA_F607: HandlerA_F607 = (a: A_F607): A_F607 => {
    if (a instanceof B_F607){
      return new A_F607(a.field())
    } else {
      return new A_F607
    }
  }
  type HandlerNothing_F607 = () => B_F607
  const handlerNothing_F607: HandlerNothing_F607 = (): B_F607 => {
    return new B_F607(567)
  }
  class C_F607 {
    field: HandlerBInt_F607
    constructor() {
       this.field = handlerAInt_F607
    }
  }

class A_F608<T> {
    field: T
    constructor(a: T) {
       this.field = a
    }
  }

class A_F609<T> {
    field: T
    constructor(a: T) {
       this.field = a
    }
  }

class A_F610<T> {
    field: T
    constructor(a: T) {
       this.field = a
    }
  }

class A_F611<T> {
    field: T
    constructor(a: T) {
       this.field = a
    }
  }

class A_F612<T> {
    field: T
    constructor(a: T) {
       this.field = a
    }
  }

class A_F613<T> {
    field: T
    constructor(a: T) {
       this.field = a
    }
  }

class A_F614<T> {
    field: T
    constructor(a: T) {
       this.field = a
    }
  }

class A_F615<T> {
    field: T
    constructor(a: T) {
       this.field = a
    }
  }

class A_F616<T> {
    field: T
    constructor(a: T) {
       this.field = a
    }
  }

class A_F617<T> {
    field: T
    constructor(a: T) {
       this.field = a
    }
  }

class A_F618<T> {
    field: T
    constructor(a: T) {
       this.field = a
    }
  }

class A_F619<T> {
    field: T
    constructor(a: T) {
       this.field = a
    }
  }

class A_F620<T> {
    field: T
    constructor(a: T) {
       this.field = a
    }
  }

class A_F621<T> {
    field: T
    constructor(a: T) {
       this.field = a
    }
  }

class A_F622<T> {
    field: T
    constructor(a: T) {
       this.field = a
    }
  }

let v_F622: long = 5
  function foo_F622(): long {
    let res = v_F622
    v_F622 += 1
    return res
  }
  class A_F623 {
    field: long = foo_F623()
  }

let v_F623: int = 5
  function foo_F623(): int {
    let res = v_F623
    v_F623 += 1
    return Int(res)
  }
  class A_F624 {
    field: int = int(foo_F624())
  }

let v_F624: byte = 5
  function foo_F624(): byte {
    let res = v_F624
    v_F624 += 1
    return Byte(res)
  }
  class A_F625 {
    field: byte = byte(foo_F625())
  }

let v_F625: short = 5
  function foo_F625(): short {
    let res = v_F625
    v_F625 += 1
    return Short(res)
  }
  class A_F626 {
    field: short = short(foo_F626())
  }

let v_F626: double = 5
  function foo_F626(): double {
    let res = v_F626
    v_F626 += 1
    return res
  }
  class A_F627 {
    field: double = foo_F627()
  }

let v_F627: int = 5
  function foo_F627(): number {
    let res = v_F627
    v_F627 += 1
    return res
  }
  class A_F628 {
    field: number = foo_F628()
  }

let v_F628: float = 5.0f
  function foo_F628(): float {
    let res = v_F628
    v_F628 += 1.0f
    return res
  }
  class A_F629 {
    field: float = foo_F629()
  }

let v_F629: bigint = 5n
  function foo_F629(): bigint {
    let res = v_F629
    v_F629 = v_F629 + BigInt(1)
    return BigInt(res)
  }
  class A_F630 {
    field: bigint = bigint(foo_F630())
  }

let v_F630: string = "v"
  function foo_F630(): string {
    let res = v_F630
    v_F630 += "n"
    return String(res)
  }
  class A_F631 {
    field: string = string(foo_F631())
  }

let v_F631: int = 5
  function foo_F631(): int {
    let res = v_F631
    v_F631 += 1
    return Int(res)
  }
  class A_F632 {
    field: Object = foo_F632()
  }

let v_F632: int = 5
  function foo_F632(): int {
    let res = v_F632
    v_F632 += 1
    return Int(res)
  }
  class A_F633 {
    field: Object | null = foo_F633()
  }

let v_F633: int = 5
  function foo_F633(): int {
    let res = v_F633
    v_F633 += 1
    return Int(res)
  }
  class A_F634 {
    field: Object | undefined = foo_F634()
  }

let v_F634: int = 5
  function foo_F634(): int {
    let res = v_F634
    v_F634 += 1
    return Int(res)
  }
  class A_F635 {
    field: Object | undefined | null = foo_F635()
  }

let v_F635: int = 5
  function foo_F635(): int {
    let res = v_F635
    v_F635 += 1
    return Int(res)
  }
  class A_F636 {
    field: Any = foo_F636()
  }

let v_F636: long = 5
  function foo_F636(): long {
    let res = v_F636
    v_F636 += 1
    return res
  }
  class A_F637 {
    field: long
    constructor () {
      this.field = foo_F637()
    }
  }

let v_F637: int = 5
  function foo_F637(): int {
    let res = v_F637
    v_F637 += 1
    return Int(res)
  }
  class A_F638 {
    field: int
    constructor () {
      this.field = foo_F638()
    }
  }

let v_F638: byte = 5
  function foo_F638(): byte {
    let res = v_F638
    v_F638 += 1
    return Byte(res)
  }
  class A_F639 {
    field: byte
    constructor () {
      this.field = foo_F639()
    }
  }

let v_F639: short = 5
  function foo_F639(): short {
    let res = v_F639
    v_F639 += 1
    return Short(res)
  }
  class A_F640 {
    field: short
    constructor () {
      this.field = foo_F640()
    }
  }

let v_F640: double = 5
  function foo_F640(): double {
    let res = v_F640
    v_F640 += 1
    return res
  }
  class A_F641 {
    field: double
    constructor () {
      this.field = foo_F641()
    }
  }

let v_F641: int = 5
  function foo_F641(): number {
    let res = v_F641
    v_F641 += 1
    return res
  }
  class A_F642 {
    field: number
    constructor () {
      this.field = foo_F642()
    }
  }

let v_F642: float = 5.0f
  function foo_F642(): float {
    let res = v_F642
    v_F642 += 1.0f
    return res
  }
  class A_F643 {
    field: float
    constructor () {
      this.field = foo_F643()
    }
  }

let v_F643: bigint = 5n
  function foo_F643(): bigint {
    let res = v_F643
    v_F643 = v_F643 + BigInt(1)
    return BigInt(res)
  }
  class A_F644 {
    field: bigint
    constructor () {
      this.field = foo_F644()
    }
  }

let v_F644: string = "v"
  function foo_F644(): string {
    let res = v_F644
    v_F644 += "n"
    return String(res)
  }
  class A_F645 {
    field: string
    constructor () {
      this.field = foo_F645()
    }
  }

let v_F645: int = 5
  function foo_F645(): int {
    let res = v_F645
    v_F645 += 1
    return Int(res)
  }
  class A_F646 {
    field: Object
    constructor () {
      this.field = foo_F646()
    }
  }

let v_F646: int = 5
  function foo_F646(): int {
    let res = v_F646
    v_F646 += 1
    return Int(res)
  }
  class A_F647 {
    field: Object | null
    constructor () {
      this.field = foo_F647()
    }
  }

let v_F647: int = 5
  function foo_F647(): int {
    let res = v_F647
    v_F647 += 1
    return Int(res)
  }
  class A_F648 {
    field: Object | undefined
    constructor () {
      this.field = foo_F648()
    }
  }

let v_F648: int = 5
  function foo_F648(): int {
    let res = v_F648
    v_F648 += 1
    return Int(res)
  }
  class A_F649 {
    field: Object | undefined | null
    constructor () {
      this.field = foo_F649()
    }
  }

let v_F649: int = 5
  function foo_F649(): int {
    let res = v_F649
    v_F649 += 1
    return Int(res)
  }
  class A_F650 {
    field: Any
    constructor () {
      this.field = foo_F650()
    }
  }

let v_F650: long = 5
  function foo_F650(): long {
    let res = v_F650
    v_F650 += 1
    return res
  }
  class A_F651 {
    field: long = 5
    constructor () {
      this.field = foo_F651()
    }
  }

let v_F651: int = 5
  function foo_F651(): int {
    let res = v_F651
    v_F651 += 1
    return Int(res)
  }
  class A_F652 {
    field: int = 5
    constructor () {
      this.field = foo_F652()
    }
  }

let v_F652: byte = 5
  function foo_F652(): byte {
    let res = v_F652
    v_F652 += 1
    return Byte(res)
  }
  class A_F653 {
    field: byte = 5
    constructor () {
      this.field = foo_F653()
    }
  }

let v_F653: short = 5
  function foo_F653(): short {
    let res = v_F653
    v_F653 += 1
    return Short(res)
  }
  class A_F654 {
    field: short = 5
    constructor () {
      this.field = foo_F654()
    }
  }

let v_F654: double = 5
  function foo_F654(): double {
    let res = v_F654
    v_F654 += 1
    return res
  }
  class A_F655 {
    field: double = 5
    constructor () {
      this.field = foo_F655()
    }
  }

let v_F655: int = 5
  function foo_F655(): number {
    let res = v_F655
    v_F655 += 1
    return res
  }
  class A_F656 {
    field: number = 5
    constructor () {
      this.field = foo_F656()
    }
  }

let v_F656: float = 5.0f
  function foo_F656(): float {
    let res = v_F656
    v_F656 += 1.0f
    return res
  }
  class A_F657 {
    field: float = 5.0f
    constructor () {
      this.field = foo_F657()
    }
  }

let v_F657: bigint = 5n
  function foo_F657(): bigint {
    let res = v_F657
    v_F657 = v_F657 + BigInt(1)
    return BigInt(res)
  }
  class A_F658 {
    field: bigint = 5n
    constructor () {
      this.field = foo_F658()
    }
  }

let v_F658: string = "v"
  function foo_F658(): string {
    let res = v_F658
    v_F658 += "n"
    return String(res)
  }
  class A_F659 {
    field: string = "v"
    constructor () {
      this.field = foo_F659()
    }
  }

let v_F659: int = 5
  function foo_F659(): int {
    let res = v_F659
    v_F659 += 1
    return Int(res)
  }
  class A_F660 {
    field: Object = 5
    constructor () {
      this.field = foo_F660()
    }
  }

let v_F660: int = 5
  function foo_F660(): int {
    let res = v_F660
    v_F660 += 1
    return Int(res)
  }
  class A_F661 {
    field: Object | null = 5
    constructor () {
      this.field = foo_F661()
    }
  }

let v_F661: int = 5
  function foo_F661(): int {
    let res = v_F661
    v_F661 += 1
    return Int(res)
  }
  class A_F662 {
    field: Object | undefined = 5
    constructor () {
      this.field = foo_F662()
    }
  }

let v_F662: int = 5
  function foo_F662(): int {
    let res = v_F662
    v_F662 += 1
    return Int(res)
  }
  class A_F663 {
    field: Object | undefined | null = 5
    constructor () {
      this.field = foo_F663()
    }
  }

let v_F663: int = 5
  function foo_F663(): int {
    let res = v_F663
    v_F663 += 1
    return Int(res)
  }
  class A_F664 {
    field: Any = 5
    constructor () {
      this.field = foo_F664()
    }
  }

namespace ns {
    export class A_F665 {
      field: long
      constructor () {
        this.field = 4
      }
    }
  }

namespace ns {
    export class A_F666 {
      field: int
      constructor () {
        this.field = 4
      }
    }
  }

namespace ns {
    export class A_F667 {
      field: byte
      constructor () {
        this.field = 4
      }
    }
  }

namespace ns {
    export class A_F668 {
      field: short
      constructor () {
        this.field = 4
      }
    }
  }

namespace ns {
    export class A_F669 {
      field: double
      constructor () {
        this.field = 4
      }
    }
  }

namespace ns {
    export class A_F670 {
      field: number
      constructor () {
        this.field = 4
      }
    }
  }

namespace ns {
    export class A_F671 {
      field: float
      constructor () {
        this.field = 4.5f
      }
    }
  }

namespace ns {
    export class A_F672 {
      field: bigint
      constructor () {
        this.field = 4n
      }
    }
  }

namespace ns {
    export class A_F673 {
      field: string
      constructor () {
        this.field = "abc"
      }
    }
  }

namespace ns {
    export class A_F674 {
      field: char
      constructor () {
        this.field = c'a'
      }
    }
  }

namespace ns {
    export class A_F675 {
      field: boolean
      constructor () {
        this.field = false
      }
    }
  }

namespace ns {
    export class A_F676 {
      field: Object
      constructor () {
        this.field = 4
      }
    }
  }

namespace ns {
    export class A_F677 {
      field: Object | undefined | null
      constructor () {
        this.field = 4
      }
    }
  }

namespace ns {
    export class A_F678 {
      field: Any
      constructor () {
        this.field = 4
      }
    }
  }

namespace ns {
    export class A_F679 {
      field: long
      constructor (arg: long = 4) {
        this.field = arg
      }
    }
  }

namespace ns {
    export class A_F680 {
      field: int
      constructor (arg: int = 4) {
        this.field = arg
      }
    }
  }

namespace ns {
    export class A_F681 {
      field: byte
      constructor (arg: byte = 4) {
        this.field = arg
      }
    }
  }

namespace ns {
    export class A_F682 {
      field: short
      constructor (arg: short = 4) {
        this.field = arg
      }
    }
  }

namespace ns {
    export class A_F683 {
      field: double
      constructor (arg: double = 4) {
        this.field = arg
      }
    }
  }

namespace ns {
    export class A_F684 {
      field: number
      constructor (arg: int = 4) {
        this.field = arg
      }
    }
  }

namespace ns {
    export class A_F685 {
      field: float
      constructor (arg: float = 4.5f) {
        this.field = arg
      }
    }
  }

namespace ns {
    export class A_F686 {
      field: bigint
      constructor (arg: bigint = 4n) {
        this.field = arg
      }
    }
  }

namespace ns {
    export class A_F687 {
      field: string
      constructor (arg: string = "abc") {
        this.field = arg
      }
    }
  }

namespace ns {
    export class A_F688 {
      field: char
      constructor (arg: char = c'a') {
        this.field = arg
      }
    }
  }

namespace ns {
    export class A_F689 {
      field: boolean
      constructor (arg: boolean = false) {
        this.field = arg
      }
    }
  }

namespace ns {
    export class A_F690 {
      field: Object
      constructor (arg: Object = 4) {
        this.field = arg
      }
    }
  }

namespace ns {
    export class A_F691 {
      field: Object | undefined | null
      constructor (arg: Object | undefined | null = 4) {
        this.field = arg
      }
    }
  }

namespace ns {
    export class A_F692 {
      field: Any
      constructor (arg: Any = 4) {
        this.field = arg
      }
    }
  }

namespace ns {
    export class A_F693 {
      field: long
      constructor (...args: Any[]) {
        this.field = 4
      }
    }
  }

export default function FieldInitializationTestSix(): void {
  describe("FieldInitializationTestSix", () => {
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
     * @tc.number    SUB_FIELD_INIT_TEST_0595
     * @tc.name      testFieldInit0595
     * @tc.desc      Checking for initialization from object literal.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0595", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F595 = {field: {data: 5}}
      expect(a.field instanceof C_F595).assertTrue()
      expect(a.field.data instanceof int).assertTrue()
      expect(a.field.data).assertEqual(5)
      a.field = {data: 4}
      expect(a.field instanceof C_F595).assertTrue()
      expect(a.field.data instanceof int).assertTrue()
      expect(a.field.data).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0596
     * @tc.name      testFieldInit0596
     * @tc.desc      Checking for initialization with different covariant subtype values usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0596", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: C_F596 = new C_F596()
      expect(a.field instanceof Animal_F596).assertTrue()
      expect(a.field.name).assertEqual("")
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0597
     * @tc.name      testFieldInit0597
     * @tc.desc      Checking for initialization with different covariant subtype values usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0597", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: C_F597 = new C_F597()
      expect(a.field instanceof Dog_F597).assertTrue()
      expect(a.field.name).assertEqual("dog")
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0598
     * @tc.name      testFieldInit0598
     * @tc.desc      Checking for initialization with different covariant subtype values usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0598", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: C_F598 = new C_F598()
      expect(a.field instanceof Cat_F598).assertTrue()
      expect(a.field.name).assertEqual("cat")
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0599
     * @tc.name      testFieldInit0599
     * @tc.desc      Checking for initialization with different covariant subtype values usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0599", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: C_F599 = new C_F599()
      expect(a.field instanceof Animal_F599).assertTrue()
      expect(a.field.name).assertEqual("")
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0600
     * @tc.name      testFieldInit0600
     * @tc.desc      Checking for initialization with different covariant subtype values usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: C_F600 = new C_F600()
      expect(a.field instanceof Dog_F600).assertTrue()
      expect(a.field.name).assertEqual("dog")
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0601
     * @tc.name      testFieldInit0601
     * @tc.desc      Checking for initialization with different covariant subtype values usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0601", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: C_F601 = new C_F601()
      expect(a.field instanceof Cat_F601).assertTrue()
      expect(a.field.name).assertEqual("cat")
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0602
     * @tc.name      testFieldInit0602
     * @tc.desc      Checking for initialization with different covariant function subtype values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0602", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: C_F602 = new C_F602()
      expect(a.field instanceof HandlerNothing_F602).assertTrue()
      expect(a.field(new B_F602, 7).v).assertEqual(-567)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0603
     * @tc.name      testFieldInit0603
     * @tc.desc      Checking for initialization with different covariant function subtype values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0603", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: C_F603 = new C_F603()
      expect(a.field instanceof HandlerA_F603).assertTrue()
      expect(a.field(new B_F603, 7).v).assertEqual(13)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0604
     * @tc.name      testFieldInit0604
     * @tc.desc      Checking for initialization with different covariant function subtype values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0604", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: C_F604 = new C_F604()
      expect(a.field instanceof HandlerAInt_F604).assertTrue()
      expect(a.field(new B_F604, 7).v).assertEqual(-20)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0605
     * @tc.name      testFieldInit0605
     * @tc.desc      Checking for initialization with different covariant function subtype values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0605", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: C_F605 = new C_F605()
      expect(a.field instanceof HandlerNothing_F605).assertTrue()
      expect(a.field(new B_F605, 7).v).assertEqual(-567)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0606
     * @tc.name      testFieldInit0606
     * @tc.desc      Checking for initialization with different covariant function subtype values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0606", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: C_F606 = new C_F606()
      expect(a.field instanceof HandlerA_F606).assertTrue()
      expect(a.field(new B_F606, 7).v).assertEqual(13)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0607
     * @tc.name      testFieldInit0607
     * @tc.desc      Checking for initialization with different covariant function subtype values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0607", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: C_F607 = new C_F607()
      expect(a.field instanceof HandlerAInt_F607).assertTrue()
      expect(a.field(new B_F607, 7).v).assertEqual(-20)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0608
     * @tc.name      testFieldInit0608
     * @tc.desc      Checking for initialization field in generic class.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0608", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F608<long> = new A_F608<long>(4)
      expect(a.field instanceof long).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof long).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0609
     * @tc.name      testFieldInit0609
     * @tc.desc      Checking for initialization field in generic class.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0609", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F609<int> = new A_F609<int>(4)
      expect(a.field instanceof int).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof int).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0610
     * @tc.name      testFieldInit0610
     * @tc.desc      Checking for initialization field in generic class.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0610", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F610<byte> = new A_F610<byte>(4)
      expect(a.field instanceof byte).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof byte).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0611
     * @tc.name      testFieldInit0611
     * @tc.desc      Checking for initialization field in generic class.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0611", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F611<short> = new A_F611<short>(4)
      expect(a.field instanceof short).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof short).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0612
     * @tc.name      testFieldInit0612
     * @tc.desc      Checking for initialization field in generic class.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0612", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F612<double> = new A_F612<double>(4)
      expect(a.field instanceof double).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 7.3
      expect(a.field instanceof double).assertTrue()
      expect(a.field).assertEqual(7.3)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0613
     * @tc.name      testFieldInit0613
     * @tc.desc      Checking for initialization field in generic class.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0613", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F613<number> = new A_F613<number>(4)
      expect(a.field instanceof number).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof number).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0614
     * @tc.name      testFieldInit0614
     * @tc.desc      Checking for initialization field in generic class.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0614", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F614<float> = new A_F614<float>(4.5f)
      expect(a.field instanceof float).assertTrue()
      expect(a.field).assertEqual(4.5f)
      a.field = 7.3f
      expect(a.field instanceof float).assertTrue()
      expect(a.field).assertEqual(7.3f)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0615
     * @tc.name      testFieldInit0615
     * @tc.desc      Checking for initialization field in generic class.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0615", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F615<bigint> = new A_F615<bigint>(4n)
      expect(a.field instanceof bigint).assertTrue()
      expect(a.field).assertEqual(4n)
      a.field = 5n
      expect(a.field instanceof bigint).assertTrue()
      expect(a.field).assertEqual(5n)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0616
     * @tc.name      testFieldInit0616
     * @tc.desc      Checking for initialization field in generic class.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0616", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F616<string> = new A_F616<string>("abc")
      expect(a.field instanceof string).assertTrue()
      expect(a.field).assertEqual("abc")
      a.field = "efg"
      expect(a.field instanceof string).assertTrue()
      expect(a.field).assertEqual("efg")
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0617
     * @tc.name      testFieldInit0617
     * @tc.desc      Checking for initialization field in generic class.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0617", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F617<char> = new A_F617<char>(c'a')
      expect(a.field instanceof char).assertTrue()
      expect(a.field).assertEqual(c'a')
      a.field = c'b'
      expect(a.field instanceof char).assertTrue()
      expect(a.field).assertEqual(c'b')
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0618
     * @tc.name      testFieldInit0618
     * @tc.desc      Checking for initialization field in generic class.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0618", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F618<boolean> = new A_F618<boolean>(false)
      expect(a.field instanceof boolean).assertTrue()
      expect(a.field).assertEqual(false)
      a.field = true
      expect(a.field instanceof boolean).assertTrue()
      expect(a.field).assertEqual(true)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0619
     * @tc.name      testFieldInit0619
     * @tc.desc      Checking for initialization field in generic class.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0619", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F619<Object> = new A_F619<Object>(4)
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0620
     * @tc.name      testFieldInit0620
     * @tc.desc      Checking for initialization field in generic class.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0620", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F620<Object | undefined> = new A_F620<Object | undefined>(undefined)
      expect(a.field instanceof Object | undefined).assertTrue()
      expect(a.field).assertEqual(undefined)
      a.field = 5
      expect(a.field instanceof Object | undefined).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0621
     * @tc.name      testFieldInit0621
     * @tc.desc      Checking for initialization field in generic class.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0621", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F621<Object | undefined | null> = new A_F621<Object | undefined | null>(4)
      expect(a.field instanceof Object | undefined | null).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof Object | undefined | null).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0622
     * @tc.name      testFieldInit0622
     * @tc.desc      Checking for initialization field in generic class.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0622", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F622<Any> = new A_F622<Any>(4)
      expect(a.field instanceof Any).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof Any).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0623
     * @tc.name      testFieldInit0623
     * @tc.desc      The assignment is performed each time an instance of the class is created.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0623", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: long = 5
          for (let i: int = 0; i < 5; i++) {
            let a: A_F623 = new A_F623()
        expect(a.field instanceof long).assertTrue()
        expect(a.field instanceof long).assertTrue()
        expect(a.field).assertEqual(val)
            val += 1
          }
          v = 5
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0624
     * @tc.name      testFieldInit0624
     * @tc.desc      The assignment is performed each time an instance of the class is created.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0624", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: int = 5
          for (let i: int = 0; i < 5; i++) {
            let a: A_F624 = new A_F624()
        expect(a.field instanceof int).assertTrue()
        expect(a.field instanceof int).assertTrue()
        expect(a.field).assertEqual(val)
            val += 1
          }
          v = 5
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0625
     * @tc.name      testFieldInit0625
     * @tc.desc      The assignment is performed each time an instance of the class is created.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0625", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: byte = 5
          for (let i: int = 0; i < 5; i++) {
            let a: A_F625 = new A_F625()
        expect(a.field instanceof byte).assertTrue()
        expect(a.field instanceof byte).assertTrue()
        expect(a.field).assertEqual(val)
            val += 1
          }
          v = 5
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0626
     * @tc.name      testFieldInit0626
     * @tc.desc      The assignment is performed each time an instance of the class is created.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0626", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: short = 5
          for (let i: int = 0; i < 5; i++) {
            let a: A_F626 = new A_F626()
        expect(a.field instanceof short).assertTrue()
        expect(a.field instanceof short).assertTrue()
        expect(a.field).assertEqual(val)
            val += 1
          }
          v = 5
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0627
     * @tc.name      testFieldInit0627
     * @tc.desc      The assignment is performed each time an instance of the class is created.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0627", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: double = 5
          for (let i: int = 0; i < 5; i++) {
            let a: A_F627 = new A_F627()
        expect(a.field instanceof double).assertTrue()
        expect(a.field instanceof double).assertTrue()
        expect(a.field).assertEqual(val)
            val += 1
          }
          v = 5
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0628
     * @tc.name      testFieldInit0628
     * @tc.desc      The assignment is performed each time an instance of the class is created.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0628", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: int = 5
          for (let i: int = 0; i < 5; i++) {
            let a: A_F628 = new A_F628()
        expect(a.field instanceof number).assertTrue()
        expect(a.field instanceof number).assertTrue()
        expect(a.field).assertEqual(val)
            val += 1
          }
          v = 5
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0629
     * @tc.name      testFieldInit0629
     * @tc.desc      The assignment is performed each time an instance of the class is created.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0629", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: float = 5.0f
          for (let i: int = 0; i < 5; i++) {
            let a: A_F629 = new A_F629()
        expect(a.field instanceof float).assertTrue()
        expect(a.field instanceof float).assertTrue()
        expect(a.field).assertEqual(val)
            val += 1.0f
          }
          v = 5.0f
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0630
     * @tc.name      testFieldInit0630
     * @tc.desc      The assignment is performed each time an instance of the class is created.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0630", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: bigint = 5n
          for (let i: int = 0; i < 5; i++) {
            let a: A_F630 = new A_F630()
        expect(a.field instanceof bigint).assertTrue()
        expect(a.field instanceof bigint).assertTrue()
        expect(a.field).assertEqual(val)
            val += 1n
          }
          v = 5n
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0631
     * @tc.name      testFieldInit0631
     * @tc.desc      The assignment is performed each time an instance of the class is created.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0631", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: string = "v"
          for (let i: int = 0; i < 5; i++) {
            let a: A_F631 = new A_F631()
        expect(a.field instanceof string).assertTrue()
        expect(a.field instanceof string).assertTrue()
        expect(a.field).assertEqual(val)
            val += "n"
          }
          v = "v"
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0632
     * @tc.name      testFieldInit0632
     * @tc.desc      The assignment is performed each time an instance of the class is created.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0632", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: int = 5
          for (let i: int = 0; i < 5; i++) {
            let a: A_F632 = new A_F632()
        expect(a.field instanceof Object).assertTrue()
        expect(a.field instanceof int).assertTrue()
        expect(a.field).assertEqual(val)
            val += 1
          }
          v = 5
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0633
     * @tc.name      testFieldInit0633
     * @tc.desc      The assignment is performed each time an instance of the class is created.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0633", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: int = 5
          for (let i: int = 0; i < 5; i++) {
            let a: A_F633 = new A_F633()
        expect(a.field instanceof Object | null).assertTrue()
        expect(a.field instanceof int).assertTrue()
        expect(a.field).assertEqual(val)
            val += 1
          }
          v = 5
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0634
     * @tc.name      testFieldInit0634
     * @tc.desc      The assignment is performed each time an instance of the class is created.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0634", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: int = 5
          for (let i: int = 0; i < 5; i++) {
            let a: A_F634 = new A_F634()
        expect(a.field instanceof Object | undefined).assertTrue()
        expect(a.field instanceof int).assertTrue()
        expect(a.field).assertEqual(val)
            val += 1
          }
          v = 5
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0635
     * @tc.name      testFieldInit0635
     * @tc.desc      The assignment is performed each time an instance of the class is created.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0635", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: int = 5
          for (let i: int = 0; i < 5; i++) {
            let a: A_F635 = new A_F635()
        expect(a.field instanceof Object | undefined | null).assertTrue()
        expect(a.field instanceof int).assertTrue()
        expect(a.field).assertEqual(val)
            val += 1
          }
          v = 5
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0636
     * @tc.name      testFieldInit0636
     * @tc.desc      The assignment is performed each time an instance of the class is created.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0636", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: int = 5
          for (let i: int = 0; i < 5; i++) {
            let a: A_F636 = new A_F636()
        expect(a.field instanceof Any).assertTrue()
        expect(a.field instanceof int).assertTrue()
        expect(a.field).assertEqual(val)
            val += 1
          }
          v = 5
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0637
     * @tc.name      testFieldInit0637
     * @tc.desc      The assignment is performed each time an instance of the class is created.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0637", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: long = 5
          for (let i: int = 0; i < 5; i++) {
            let a: A_F637 = new A_F637()
        expect(a.field instanceof long).assertTrue()
        expect(a.field instanceof long).assertTrue()
        expect(a.field).assertEqual(val)
            val += 1
          }
          v = 5
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0638
     * @tc.name      testFieldInit0638
     * @tc.desc      The assignment is performed each time an instance of the class is created.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0638", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: int = 5
          for (let i: int = 0; i < 5; i++) {
            let a: A_F638 = new A_F638()
        expect(a.field instanceof int).assertTrue()
        expect(a.field instanceof int).assertTrue()
        expect(a.field).assertEqual(val)
            val += 1
          }
          v = 5
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0639
     * @tc.name      testFieldInit0639
     * @tc.desc      The assignment is performed each time an instance of the class is created.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0639", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: byte = 5
          for (let i: int = 0; i < 5; i++) {
            let a: A_F639 = new A_F639()
        expect(a.field instanceof byte).assertTrue()
        expect(a.field instanceof byte).assertTrue()
        expect(a.field).assertEqual(val)
            val += 1
          }
          v = 5
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0640
     * @tc.name      testFieldInit0640
     * @tc.desc      The assignment is performed each time an instance of the class is created.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0640", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: short = 5
          for (let i: int = 0; i < 5; i++) {
            let a: A_F640 = new A_F640()
        expect(a.field instanceof short).assertTrue()
        expect(a.field instanceof short).assertTrue()
        expect(a.field).assertEqual(val)
            val += 1
          }
          v = 5
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0641
     * @tc.name      testFieldInit0641
     * @tc.desc      The assignment is performed each time an instance of the class is created.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0641", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: double = 5
          for (let i: int = 0; i < 5; i++) {
            let a: A_F641 = new A_F641()
        expect(a.field instanceof double).assertTrue()
        expect(a.field instanceof double).assertTrue()
        expect(a.field).assertEqual(val)
            val += 1
          }
          v = 5
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0642
     * @tc.name      testFieldInit0642
     * @tc.desc      The assignment is performed each time an instance of the class is created.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0642", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: int = 5
          for (let i: int = 0; i < 5; i++) {
            let a: A_F642 = new A_F642()
        expect(a.field instanceof number).assertTrue()
        expect(a.field instanceof number).assertTrue()
        expect(a.field).assertEqual(val)
            val += 1
          }
          v = 5
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0643
     * @tc.name      testFieldInit0643
     * @tc.desc      The assignment is performed each time an instance of the class is created.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0643", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: float = 5.0f
          for (let i: int = 0; i < 5; i++) {
            let a: A_F643 = new A_F643()
        expect(a.field instanceof float).assertTrue()
        expect(a.field instanceof float).assertTrue()
        expect(a.field).assertEqual(val)
            val += 1.0f
          }
          v = 5.0f
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0644
     * @tc.name      testFieldInit0644
     * @tc.desc      The assignment is performed each time an instance of the class is created.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0644", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: bigint = 5n
          for (let i: int = 0; i < 5; i++) {
            let a: A_F644 = new A_F644()
        expect(a.field instanceof bigint).assertTrue()
        expect(a.field instanceof bigint).assertTrue()
        expect(a.field).assertEqual(val)
            val += 1n
          }
          v = 5n
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0645
     * @tc.name      testFieldInit0645
     * @tc.desc      The assignment is performed each time an instance of the class is created.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0645", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: string = "v"
          for (let i: int = 0; i < 5; i++) {
            let a: A_F645 = new A_F645()
        expect(a.field instanceof string).assertTrue()
        expect(a.field instanceof string).assertTrue()
        expect(a.field).assertEqual(val)
            val += "n"
          }
          v = "v"
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0646
     * @tc.name      testFieldInit0646
     * @tc.desc      The assignment is performed each time an instance of the class is created.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0646", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: int = 5
          for (let i: int = 0; i < 5; i++) {
            let a: A_F646 = new A_F646()
        expect(a.field instanceof Object).assertTrue()
        expect(a.field instanceof int).assertTrue()
        expect(a.field).assertEqual(val)
            val += 1
          }
          v = 5
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0647
     * @tc.name      testFieldInit0647
     * @tc.desc      The assignment is performed each time an instance of the class is created.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0647", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: int = 5
          for (let i: int = 0; i < 5; i++) {
            let a: A_F647 = new A_F647()
        expect(a.field instanceof Object | null).assertTrue()
        expect(a.field instanceof int).assertTrue()
        expect(a.field).assertEqual(val)
            val += 1
          }
          v = 5
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0648
     * @tc.name      testFieldInit0648
     * @tc.desc      The assignment is performed each time an instance of the class is created.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0648", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: int = 5
          for (let i: int = 0; i < 5; i++) {
            let a: A_F648 = new A_F648()
        expect(a.field instanceof Object | undefined).assertTrue()
        expect(a.field instanceof int).assertTrue()
        expect(a.field).assertEqual(val)
            val += 1
          }
          v = 5
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0649
     * @tc.name      testFieldInit0649
     * @tc.desc      The assignment is performed each time an instance of the class is created.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0649", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: int = 5
          for (let i: int = 0; i < 5; i++) {
            let a: A_F649 = new A_F649()
        expect(a.field instanceof Object | undefined | null).assertTrue()
        expect(a.field instanceof int).assertTrue()
        expect(a.field).assertEqual(val)
            val += 1
          }
          v = 5
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0650
     * @tc.name      testFieldInit0650
     * @tc.desc      The assignment is performed each time an instance of the class is created.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0650", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: int = 5
          for (let i: int = 0; i < 5; i++) {
            let a: A_F650 = new A_F650()
        expect(a.field instanceof Any).assertTrue()
        expect(a.field instanceof int).assertTrue()
        expect(a.field).assertEqual(val)
            val += 1
          }
          v = 5
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0651
     * @tc.name      testFieldInit0651
     * @tc.desc      The assignment is performed each time an instance of the class is created.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0651", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: long = 5
          for (let i: int = 0; i < 5; i++) {
            let a: A_F651 = new A_F651()
        expect(a.field instanceof long).assertTrue()
        expect(a.field instanceof long).assertTrue()
        expect(a.field).assertEqual(val)
            val += 1
          }
          v = 5
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0652
     * @tc.name      testFieldInit0652
     * @tc.desc      The assignment is performed each time an instance of the class is created.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0652", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: int = 5
          for (let i: int = 0; i < 5; i++) {
            let a: A_F652 = new A_F652()
        expect(a.field instanceof int).assertTrue()
        expect(a.field instanceof int).assertTrue()
        expect(a.field).assertEqual(val)
            val += 1
          }
          v = 5
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0653
     * @tc.name      testFieldInit0653
     * @tc.desc      The assignment is performed each time an instance of the class is created.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0653", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: byte = 5
          for (let i: int = 0; i < 5; i++) {
            let a: A_F653 = new A_F653()
        expect(a.field instanceof byte).assertTrue()
        expect(a.field instanceof byte).assertTrue()
        expect(a.field).assertEqual(val)
            val += 1
          }
          v = 5
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0654
     * @tc.name      testFieldInit0654
     * @tc.desc      The assignment is performed each time an instance of the class is created.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0654", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: short = 5
          for (let i: int = 0; i < 5; i++) {
            let a: A_F654 = new A_F654()
        expect(a.field instanceof short).assertTrue()
        expect(a.field instanceof short).assertTrue()
        expect(a.field).assertEqual(val)
            val += 1
          }
          v = 5
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0655
     * @tc.name      testFieldInit0655
     * @tc.desc      The assignment is performed each time an instance of the class is created.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0655", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: double = 5
          for (let i: int = 0; i < 5; i++) {
            let a: A_F655 = new A_F655()
        expect(a.field instanceof double).assertTrue()
        expect(a.field instanceof double).assertTrue()
        expect(a.field).assertEqual(val)
            val += 1
          }
          v = 5
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0656
     * @tc.name      testFieldInit0656
     * @tc.desc      The assignment is performed each time an instance of the class is created.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0656", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: int = 5
          for (let i: int = 0; i < 5; i++) {
            let a: A_F656 = new A_F656()
        expect(a.field instanceof number).assertTrue()
        expect(a.field instanceof number).assertTrue()
        expect(a.field).assertEqual(val)
            val += 1
          }
          v = 5
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0657
     * @tc.name      testFieldInit0657
     * @tc.desc      The assignment is performed each time an instance of the class is created.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0657", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: float = 5.0f
          for (let i: int = 0; i < 5; i++) {
            let a: A_F657 = new A_F657()
        expect(a.field instanceof float).assertTrue()
        expect(a.field instanceof float).assertTrue()
        expect(a.field).assertEqual(val)
            val += 1.0f
          }
          v = 5.0f
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0658
     * @tc.name      testFieldInit0658
     * @tc.desc      The assignment is performed each time an instance of the class is created.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0658", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: bigint = 5n
          for (let i: int = 0; i < 5; i++) {
            let a: A_F658 = new A_F658()
        expect(a.field instanceof bigint).assertTrue()
        expect(a.field instanceof bigint).assertTrue()
        expect(a.field).assertEqual(val)
            val += 1n
          }
          v = 5n
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0659
     * @tc.name      testFieldInit0659
     * @tc.desc      The assignment is performed each time an instance of the class is created.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0659", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: string = "v"
          for (let i: int = 0; i < 5; i++) {
            let a: A_F659 = new A_F659()
        expect(a.field instanceof string).assertTrue()
        expect(a.field instanceof string).assertTrue()
        expect(a.field).assertEqual(val)
            val += "n"
          }
          v = "v"
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0660
     * @tc.name      testFieldInit0660
     * @tc.desc      The assignment is performed each time an instance of the class is created.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0660", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: int = 5
          for (let i: int = 0; i < 5; i++) {
            let a: A_F660 = new A_F660()
        expect(a.field instanceof Object).assertTrue()
        expect(a.field instanceof int).assertTrue()
        expect(a.field).assertEqual(val)
            val += 1
          }
          v = 5
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0661
     * @tc.name      testFieldInit0661
     * @tc.desc      The assignment is performed each time an instance of the class is created.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0661", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: int = 5
          for (let i: int = 0; i < 5; i++) {
            let a: A_F661 = new A_F661()
        expect(a.field instanceof Object | null).assertTrue()
        expect(a.field instanceof int).assertTrue()
        expect(a.field).assertEqual(val)
            val += 1
          }
          v = 5
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0662
     * @tc.name      testFieldInit0662
     * @tc.desc      The assignment is performed each time an instance of the class is created.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0662", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: int = 5
          for (let i: int = 0; i < 5; i++) {
            let a: A_F662 = new A_F662()
        expect(a.field instanceof Object | undefined).assertTrue()
        expect(a.field instanceof int).assertTrue()
        expect(a.field).assertEqual(val)
            val += 1
          }
          v = 5
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0663
     * @tc.name      testFieldInit0663
     * @tc.desc      The assignment is performed each time an instance of the class is created.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0663", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: int = 5
          for (let i: int = 0; i < 5; i++) {
            let a: A_F663 = new A_F663()
        expect(a.field instanceof Object | undefined | null).assertTrue()
        expect(a.field instanceof int).assertTrue()
        expect(a.field).assertEqual(val)
            val += 1
          }
          v = 5
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0664
     * @tc.name      testFieldInit0664
     * @tc.desc      The assignment is performed each time an instance of the class is created.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0664", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: int = 5
          for (let i: int = 0; i < 5; i++) {
            let a: A_F664 = new A_F664()
        expect(a.field instanceof Any).assertTrue()
        expect(a.field instanceof int).assertTrue()
        expect(a.field).assertEqual(val)
            val += 1
          }
          v = 5
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0665
     * @tc.name      testFieldInit0665
     * @tc.desc      Checking for initialization from constructor with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0665", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: ns.A_F665 = new ns.A_F665()
      expect(a.field instanceof long).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof long).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0666
     * @tc.name      testFieldInit0666
     * @tc.desc      Checking for initialization from constructor with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0666", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: ns.A_F666 = new ns.A_F666()
      expect(a.field instanceof int).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof int).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0667
     * @tc.name      testFieldInit0667
     * @tc.desc      Checking for initialization from constructor with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0667", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: ns.A_F667 = new ns.A_F667()
      expect(a.field instanceof byte).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof byte).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0668
     * @tc.name      testFieldInit0668
     * @tc.desc      Checking for initialization from constructor with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0668", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: ns.A_F668 = new ns.A_F668()
      expect(a.field instanceof short).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof short).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0669
     * @tc.name      testFieldInit0669
     * @tc.desc      Checking for initialization from constructor with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0669", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: ns.A_F669 = new ns.A_F669()
      expect(a.field instanceof double).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 7.3
      expect(a.field instanceof double).assertTrue()
      expect(a.field).assertEqual(7.3)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0670
     * @tc.name      testFieldInit0670
     * @tc.desc      Checking for initialization from constructor with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0670", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: ns.A_F670 = new ns.A_F670()
      expect(a.field instanceof number).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof number).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0671
     * @tc.name      testFieldInit0671
     * @tc.desc      Checking for initialization from constructor with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0671", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: ns.A_F671 = new ns.A_F671()
      expect(a.field instanceof float).assertTrue()
      expect(a.field).assertEqual(4.5f)
      a.field = 7.3f
      expect(a.field instanceof float).assertTrue()
      expect(a.field).assertEqual(7.3f)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0672
     * @tc.name      testFieldInit0672
     * @tc.desc      Checking for initialization from constructor with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0672", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: ns.A_F672 = new ns.A_F672()
      expect(a.field instanceof bigint).assertTrue()
      expect(a.field).assertEqual(4n)
      a.field = 5n
      expect(a.field instanceof bigint).assertTrue()
      expect(a.field).assertEqual(5n)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0673
     * @tc.name      testFieldInit0673
     * @tc.desc      Checking for initialization from constructor with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0673", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: ns.A_F673 = new ns.A_F673()
      expect(a.field instanceof string).assertTrue()
      expect(a.field).assertEqual("abc")
      a.field = "efg"
      expect(a.field instanceof string).assertTrue()
      expect(a.field).assertEqual("efg")
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0674
     * @tc.name      testFieldInit0674
     * @tc.desc      Checking for initialization from constructor with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0674", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: ns.A_F674 = new ns.A_F674()
      expect(a.field instanceof char).assertTrue()
      expect(a.field).assertEqual(c'a')
      a.field = c'b'
      expect(a.field instanceof char).assertTrue()
      expect(a.field).assertEqual(c'b')
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0675
     * @tc.name      testFieldInit0675
     * @tc.desc      Checking for initialization from constructor with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0675", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: ns.A_F675 = new ns.A_F675()
      expect(a.field instanceof boolean).assertTrue()
      expect(a.field).assertEqual(false)
      a.field = true
      expect(a.field instanceof boolean).assertTrue()
      expect(a.field).assertEqual(true)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0676
     * @tc.name      testFieldInit0676
     * @tc.desc      Checking for initialization from constructor with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0676", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: ns.A_F676 = new ns.A_F676()
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0677
     * @tc.name      testFieldInit0677
     * @tc.desc      Checking for initialization from constructor with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0677", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: ns.A_F677 = new ns.A_F677()
      expect(a.field instanceof Object | undefined | null).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof Object | undefined | null).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0678
     * @tc.name      testFieldInit0678
     * @tc.desc      Checking for initialization from constructor with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0678", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: ns.A_F678 = new ns.A_F678()
      expect(a.field instanceof Any).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof Any).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0679
     * @tc.name      testFieldInit0679
     * @tc.desc      Checking for initialization from constructor with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0679", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: ns.A_F679 = new ns.A_F679()
      expect(a.field instanceof long).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof long).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0680
     * @tc.name      testFieldInit0680
     * @tc.desc      Checking for initialization from constructor with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0680", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: ns.A_F680 = new ns.A_F680()
      expect(a.field instanceof int).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof int).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0681
     * @tc.name      testFieldInit0681
     * @tc.desc      Checking for initialization from constructor with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0681", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: ns.A_F681 = new ns.A_F681()
      expect(a.field instanceof byte).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof byte).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0682
     * @tc.name      testFieldInit0682
     * @tc.desc      Checking for initialization from constructor with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0682", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: ns.A_F682 = new ns.A_F682()
      expect(a.field instanceof short).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof short).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0683
     * @tc.name      testFieldInit0683
     * @tc.desc      Checking for initialization from constructor with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0683", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: ns.A_F683 = new ns.A_F683()
      expect(a.field instanceof double).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 7.3
      expect(a.field instanceof double).assertTrue()
      expect(a.field).assertEqual(7.3)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0684
     * @tc.name      testFieldInit0684
     * @tc.desc      Checking for initialization from constructor with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0684", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: ns.A_F684 = new ns.A_F684()
      expect(a.field instanceof number).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof number).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0685
     * @tc.name      testFieldInit0685
     * @tc.desc      Checking for initialization from constructor with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0685", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: ns.A_F685 = new ns.A_F685()
      expect(a.field instanceof float).assertTrue()
      expect(a.field).assertEqual(4.5f)
      a.field = 7.3f
      expect(a.field instanceof float).assertTrue()
      expect(a.field).assertEqual(7.3f)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0686
     * @tc.name      testFieldInit0686
     * @tc.desc      Checking for initialization from constructor with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0686", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: ns.A_F686 = new ns.A_F686()
      expect(a.field instanceof bigint).assertTrue()
      expect(a.field).assertEqual(4n)
      a.field = 5n
      expect(a.field instanceof bigint).assertTrue()
      expect(a.field).assertEqual(5n)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0687
     * @tc.name      testFieldInit0687
     * @tc.desc      Checking for initialization from constructor with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0687", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: ns.A_F687 = new ns.A_F687()
      expect(a.field instanceof string).assertTrue()
      expect(a.field).assertEqual("abc")
      a.field = "efg"
      expect(a.field instanceof string).assertTrue()
      expect(a.field).assertEqual("efg")
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0688
     * @tc.name      testFieldInit0688
     * @tc.desc      Checking for initialization from constructor with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0688", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: ns.A_F688 = new ns.A_F688()
      expect(a.field instanceof char).assertTrue()
      expect(a.field).assertEqual(c'a')
      a.field = c'b'
      expect(a.field instanceof char).assertTrue()
      expect(a.field).assertEqual(c'b')
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0689
     * @tc.name      testFieldInit0689
     * @tc.desc      Checking for initialization from constructor with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0689", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: ns.A_F689 = new ns.A_F689()
      expect(a.field instanceof boolean).assertTrue()
      expect(a.field).assertEqual(false)
      a.field = true
      expect(a.field instanceof boolean).assertTrue()
      expect(a.field).assertEqual(true)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0690
     * @tc.name      testFieldInit0690
     * @tc.desc      Checking for initialization from constructor with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0690", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: ns.A_F690 = new ns.A_F690()
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0691
     * @tc.name      testFieldInit0691
     * @tc.desc      Checking for initialization from constructor with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0691", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: ns.A_F691 = new ns.A_F691()
      expect(a.field instanceof Object | undefined | null).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof Object | undefined | null).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0692
     * @tc.name      testFieldInit0692
     * @tc.desc      Checking for initialization from constructor with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0692", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: ns.A_F692 = new ns.A_F692()
      expect(a.field instanceof Any).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof Any).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0693
     * @tc.name      testFieldInit0693
     * @tc.desc      Checking for initialization from constructor with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0693", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: ns.A_F693 = new ns.A_F693()
      expect(a.field instanceof long).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof long).assertTrue()
      expect(a.field).assertEqual(5)
    })
  })
}
