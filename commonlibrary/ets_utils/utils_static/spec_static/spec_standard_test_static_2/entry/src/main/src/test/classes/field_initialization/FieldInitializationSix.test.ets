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
    field: long = foo_F622()
  }

let v_F623: int = 5
  function foo_F623(): int {
    let res = v_F623
    v_F623 += 1
    return res
  }
  class A_F624 {
    field: int = foo_F623()
  }

let v_F624: byte = 5
  function foo_F624(): byte {
    let res = v_F624
    v_F624 += 1
    return res
  }
  class A_F625 {
    field: byte = foo_F624()
  }

let v_F625: short = 5
  function foo_F625(): short {
    let res = v_F625
    v_F625 += 1
    return res
  }
  class A_F626 {
    field: short = foo_F625()
  }

let v_F626: double = 5
  function foo_F626(): double {
    let res = v_F626
    v_F626 += 1
    return res
  }
  class A_F627 {
    field: double = foo_F626()
  }

let v_F627: int = 5
  function foo_F627(): number {
    let res = v_F627
    v_F627 += 1
    return res
  }
  class A_F628 {
    field: number = foo_F627()
  }

let v_F628: float = 5.0f
  function foo_F628(): float {
    let res = v_F628
    v_F628 += 1.0f
    return res
  }
  class A_F629 {
    field: float = foo_F628()
  }

let v_F629: bigint = 5n
  function foo_F629(): bigint {
    let res = v_F629
    v_F629 = v_F629 + BigInt(1)
    return res
  }
  class A_F630 {
    field: bigint = foo_F629()
  }

let v_F630: string = "v"
  function foo_F630(): string {
    let res = v_F630
    v_F630 += "n"
    return res
  }
  class A_F631 {
    field: string = foo_F630()
  }

let v_F631: int = 5
  function foo_F631(): int {
    let res = v_F631
    v_F631 += 1
    return res
  }
  class A_F632 {
    field: Object = foo_F631()
  }

let v_F632: int = 5
  function foo_F632(): int {
    let res = v_F632
    v_F632 += 1
    return res
  }
  class A_F633 {
    field: Object | null = foo_F632()
  }

let v_F633: int = 5
  function foo_F633(): int {
    let res = v_F633
    v_F633 += 1
    return res
  }
  class A_F634 {
    field: Object | undefined = foo_F633()
  }

let v_F634: int = 5
  function foo_F634(): int {
    let res = v_F634
    v_F634 += 1
    return res
  }
  class A_F635 {
    field: Object | undefined | null = foo_F634()
  }

let v_F635: int = 5
  function foo_F635(): int {
    let res = v_F635
    v_F635 += 1
    return res
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
      this.field = foo_F636()
    }
  }

let v_F637: int = 5
  function foo_F637(): int {
    let res = v_F637
    v_F637 += 1
    return res
  }
  class A_F638 {
    field: int
    constructor () {
      this.field = foo_F637()
    }
  }

let v_F638: byte = 5
  function foo_F638(): byte {
    let res = v_F638
    v_F638 += 1
    return res
  }
  class A_F639 {
    field: byte
    constructor () {
      this.field = foo_F638()
    }
  }

let v_F639: short = 5
  function foo_F639(): short {
    let res = v_F639
    v_F639 += 1
    return res
  }
  class A_F640 {
    field: short
    constructor () {
      this.field = foo_F639()
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
      this.field = foo_F640()
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
      this.field = foo_F641()
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
      this.field = foo_F642()
    }
  }

let v_F643: bigint = 5n
  function foo_F643(): bigint {
    let res = v_F643
    v_F643 = v_F643 + BigInt(1)
    return res
  }
  class A_F644 {
    field: bigint
    constructor () {
      this.field = foo_F643()
    }
  }

let v_F644: string = "v"
  function foo_F644(): string {
    let res = v_F644
    v_F644 += "n"
    return res
  }
  class A_F645 {
    field: string
    constructor () {
      this.field = foo_F644()
    }
  }

let v_F645: int = 5
  function foo_F645(): int {
    let res = v_F645
    v_F645 += 1
    return res
  }
  class A_F646 {
    field: Object
    constructor () {
      this.field = foo_F645()
    }
  }

let v_F646: int = 5
  function foo_F646(): int {
    let res = v_F646
    v_F646 += 1
    return res
  }
  class A_F647 {
    field: Object | null
    constructor () {
      this.field = foo_F646()
    }
  }

let v_F647: int = 5
  function foo_F647(): int {
    let res = v_F647
    v_F647 += 1
    return res
  }
  class A_F648 {
    field: Object | undefined
    constructor () {
      this.field = foo_F647()
    }
  }

let v_F648: int = 5
  function foo_F648(): int {
    let res = v_F648
    v_F648 += 1
    return res
  }
  class A_F649 {
    field: Object | undefined | null
    constructor () {
      this.field = foo_F648()
    }
  }

let v_F649: int = 5
  function foo_F649(): int {
    let res = v_F649
    v_F649 += 1
    return res
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
      this.field = foo_F650()
    }
  }

let v_F651: int = 5
  function foo_F651(): int {
    let res = v_F651
    v_F651 += 1
    return res
  }
  class A_F652 {
    field: int = 5
    constructor () {
      this.field = foo_F651()
    }
  }

let v_F652: byte = 5
  function foo_F652(): byte {
    let res = v_F652
    v_F652 += 1
    return res
  }
  class A_F653 {
    field: byte = 5
    constructor () {
      this.field = foo_F652()
    }
  }

let v_F653: short = 5
  function foo_F653(): short {
    let res = v_F653
    v_F653 += 1
    return res
  }
  class A_F654 {
    field: short = 5
    constructor () {
      this.field = foo_F653()
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
      this.field = foo_F654()
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
      this.field = foo_F655()
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
      this.field = foo_F656()
    }
  }

let v_F657: bigint = 5n
  function foo_F657(): bigint {
    let res = v_F657
    v_F657 = v_F657 + BigInt(1)
    return res
  }
  class A_F658 {
    field: bigint = 5n
    constructor () {
      this.field = foo_F657()
    }
  }

let v_F658: string = "v"
  function foo_F658(): string {
    let res = v_F658
    v_F658 += "n"
    return res
  }
  class A_F659 {
    field: string = "v"
    constructor () {
      this.field = foo_F658()
    }
  }

let v_F659: int = 5
  function foo_F659(): int {
    let res = v_F659
    v_F659 += 1
    return res
  }
  class A_F660 {
    field: Object = 5
    constructor () {
      this.field = foo_F659()
    }
  }

let v_F660: int = 5
  function foo_F660(): int {
    let res = v_F660
    v_F660 += 1
    return res
  }
  class A_F661 {
    field: Object | null = 5
    constructor () {
      this.field = foo_F660()
    }
  }

let v_F661: int = 5
  function foo_F661(): int {
    let res = v_F661
    v_F661 += 1
    return res
  }
  class A_F662 {
    field: Object | undefined = 5
    constructor () {
      this.field = foo_F661()
    }
  }

let v_F662: int = 5
  function foo_F662(): int {
    let res = v_F662
    v_F662 += 1
    return res
  }
  class A_F663 {
    field: Object | undefined | null = 5
    constructor () {
      this.field = foo_F662()
    }
  }

let v_F663: int = 5
  function foo_F663(): int {
    let res = v_F663
    v_F663 += 1
    return res
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


export default function FieldInitializationSixTest(): void {
  describe("FieldInitializationSixTest", () => {
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
     * @tc.number    SUB_FIELD_INIT_SIX_0100
     * @tc.name      testFieldInitSix0001
     * @tc.desc      Checking for initialization from object literal.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitSix0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_SIX_0200
     * @tc.name      testFieldInitSix0002
     * @tc.desc      Checking for initialization with different covariant subtype values usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitSix0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: C_F596 = new C_F596()
      expect(a.field instanceof Animal_F596).assertTrue()
      expect(a.field.name).assertEqual("")
    })

    /**
     * @tc.number    SUB_FIELD_INIT_SIX_0300
     * @tc.name      testFieldInitSix0003
     * @tc.desc      Checking for initialization with different covariant subtype values usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitSix0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: C_F597 = new C_F597()
      expect(a.field instanceof Dog_F597).assertTrue()
      expect(a.field.name).assertEqual("dog")
    })

    /**
     * @tc.number    SUB_FIELD_INIT_SIX_0400
     * @tc.name      testFieldInitSix0004
     * @tc.desc      Checking for initialization with different covariant subtype values usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitSix0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: C_F598 = new C_F598()
      expect(a.field instanceof Cat_F598).assertTrue()
      expect(a.field.name).assertEqual("cat")
    })

    /**
     * @tc.number    SUB_FIELD_INIT_SIX_0500
     * @tc.name      testFieldInitSix0005
     * @tc.desc      Checking for initialization with different covariant subtype values usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitSix0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: C_F599 = new C_F599()
      expect(a.field instanceof Animal_F599).assertTrue()
      expect(a.field.name).assertEqual("")
    })

    /**
     * @tc.number    SUB_FIELD_INIT_SIX_0600
     * @tc.name      testFieldInitSix0006
     * @tc.desc      Checking for initialization with different covariant subtype values usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitSix0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: C_F600 = new C_F600()
      expect(a.field instanceof Dog_F600).assertTrue()
      expect(a.field.name).assertEqual("dog")
    })

    /**
     * @tc.number    SUB_FIELD_INIT_SIX_0700
     * @tc.name      testFieldInitSix0007
     * @tc.desc      Checking for initialization with different covariant subtype values usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitSix0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: C_F601 = new C_F601()
      expect(a.field instanceof Cat_F601).assertTrue()
      expect(a.field.name).assertEqual("cat")
    })

    /**
     * @tc.number    SUB_FIELD_INIT_SIX_0800
     * @tc.name      testFieldInitSix0008
     * @tc.desc      Checking for initialization with different covariant function subtype values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitSix0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: C_F602 = new C_F602()
      expect(a.field instanceof HandlerNothing_F602).assertTrue()
      expect(a.field(new B_F602, 7).v).assertEqual(-567)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_SIX_0900
     * @tc.name      testFieldInitSix0009
     * @tc.desc      Checking for initialization with different covariant function subtype values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitSix0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: C_F603 = new C_F603()
      expect(a.field instanceof HandlerA_F603).assertTrue()
      expect(a.field(new B_F603, 7).v).assertEqual(13)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_SIX_1000
     * @tc.name      testFieldInitSix0010
     * @tc.desc      Checking for initialization with different covariant function subtype values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitSix0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: C_F604 = new C_F604()
      expect(a.field instanceof HandlerAInt_F604).assertTrue()
      expect(a.field(new B_F604, 7).v).assertEqual(-20)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_SIX_1100
     * @tc.name      testFieldInitSix0011
     * @tc.desc      Checking for initialization with different covariant function subtype values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitSix0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: C_F605 = new C_F605()
      expect(a.field instanceof HandlerNothing_F605).assertTrue()
      expect(a.field(new B_F605, 7).v).assertEqual(-567)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_SIX_1200
     * @tc.name      testFieldInitSix0012
     * @tc.desc      Checking for initialization with different covariant function subtype values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitSix0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: C_F606 = new C_F606()
      expect(a.field instanceof HandlerA_F606).assertTrue()
      expect(a.field(new B_F606, 7).v).assertEqual(13)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_SIX_1300
     * @tc.name      testFieldInitSix0013
     * @tc.desc      Checking for initialization with different covariant function subtype values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitSix0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: C_F607 = new C_F607()
      expect(a.field instanceof HandlerAInt_F607).assertTrue()
      expect(a.field(new B_F607, 7).v).assertEqual(-20)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_SIX_1400
     * @tc.name      testFieldInitSix0014
     * @tc.desc      Checking for initialization field in generic class.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitSix0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F608<long> = new A_F608<long>(4)
      expect(a.field instanceof long).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof long).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_SIX_1500
     * @tc.name      testFieldInitSix0015
     * @tc.desc      Checking for initialization field in generic class.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitSix0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F609<int> = new A_F609<int>(4)
      expect(a.field instanceof int).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof int).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_SIX_1600
     * @tc.name      testFieldInitSix0016
     * @tc.desc      Checking for initialization field in generic class.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitSix0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F610<byte> = new A_F610<byte>(4)
      expect(a.field instanceof byte).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof byte).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_SIX_1700
     * @tc.name      testFieldInitSix0017
     * @tc.desc      Checking for initialization field in generic class.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitSix0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F611<short> = new A_F611<short>(4)
      expect(a.field instanceof short).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof short).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_SIX_1800
     * @tc.name      testFieldInitSix0018
     * @tc.desc      Checking for initialization field in generic class.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitSix0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F612<double> = new A_F612<double>(4)
      expect(a.field instanceof double).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 7.3
      expect(a.field instanceof double).assertTrue()
      expect(a.field).assertEqual(7.3)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_SIX_1900
     * @tc.name      testFieldInitSix0019
     * @tc.desc      Checking for initialization field in generic class.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitSix0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F613<number> = new A_F613<number>(4)
      expect(a.field instanceof number).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof number).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_SIX_2000
     * @tc.name      testFieldInitSix0020
     * @tc.desc      Checking for initialization field in generic class.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitSix0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F614<float> = new A_F614<float>(4.5f)
      expect(a.field instanceof float).assertTrue()
      expect(a.field).assertEqual(4.5f)
      a.field = 7.3f
      expect(a.field instanceof float).assertTrue()
      expect(a.field).assertEqual(7.3f)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_SIX_2100
     * @tc.name      testFieldInitSix0021
     * @tc.desc      Checking for initialization field in generic class.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitSix0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F615<bigint> = new A_F615<bigint>(4n)
      expect(a.field instanceof bigint).assertTrue()
      expect(a.field).assertEqual(4n)
      a.field = 5n
      expect(a.field instanceof bigint).assertTrue()
      expect(a.field).assertEqual(5n)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_SIX_2200
     * @tc.name      testFieldInitSix0022
     * @tc.desc      Checking for initialization field in generic class.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitSix0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F616<string> = new A_F616<string>("abc")
      expect(a.field instanceof string).assertTrue()
      expect(a.field).assertEqual("abc")
      a.field = "efg"
      expect(a.field instanceof string).assertTrue()
      expect(a.field).assertEqual("efg")
    })

    /**
     * @tc.number    SUB_FIELD_INIT_SIX_2300
     * @tc.name      testFieldInitSix0023
     * @tc.desc      Checking for initialization field in generic class.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitSix0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F617<char> = new A_F617<char>(c'a')
      expect(a.field instanceof char).assertTrue()
      expect(a.field).assertEqual(c'a')
      a.field = c'b'
      expect(a.field instanceof char).assertTrue()
      expect(a.field).assertEqual(c'b')
    })

    /**
     * @tc.number    SUB_FIELD_INIT_SIX_2400
     * @tc.name      testFieldInitSix0024
     * @tc.desc      Checking for initialization field in generic class.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitSix0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F618<boolean> = new A_F618<boolean>(false)
      expect(a.field instanceof boolean).assertTrue()
      expect(a.field).assertEqual(false)
      a.field = true
      expect(a.field instanceof boolean).assertTrue()
      expect(a.field).assertEqual(true)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_SIX_2500
     * @tc.name      testFieldInitSix0025
     * @tc.desc      Checking for initialization field in generic class.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitSix0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F619<Object> = new A_F619<Object>(4)
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_SIX_2600
     * @tc.name      testFieldInitSix0026
     * @tc.desc      Checking for initialization field in generic class.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitSix0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F620<Object | undefined> = new A_F620<Object | undefined>(undefined)
      expect(a.field instanceof Object).assertFalse()
      expect(a.field).assertEqual(undefined)
      a.field = 5
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_SIX_2700
     * @tc.name      testFieldInitSix0027
     * @tc.desc      Checking for initialization field in generic class.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitSix0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F621<Object | undefined | null> = new A_F621<Object | undefined | null>(4)
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(5)
    })



    /**
     * @tc.number    SUB_FIELD_INIT_SIX_2800
     * @tc.name      testFieldInitSix0028
     * @tc.desc      The assignment is performed each time an instance of the class is created.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitSix0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: long = 5
          for (let i: int = 0; i < 5; i++) {
            let a: A_F623 = new A_F623()
        expect(a.field instanceof long).assertTrue()
        expect(a.field).assertEqual(val)
            val += 1
          }
          v_F622 = 5
    })

    /**
     * @tc.number    SUB_FIELD_INIT_SIX_2900
     * @tc.name      testFieldInitSix0029
     * @tc.desc      The assignment is performed each time an instance of the class is created.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitSix0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: int = 5
          for (let i: int = 0; i < 5; i++) {
            let a: A_F624 = new A_F624()
        expect(a.field instanceof int).assertTrue()
        expect(a.field).assertEqual(val)
            val += 1
          }
          v_F623 = 5
    })

    /**
     * @tc.number    SUB_FIELD_INIT_SIX_3000
     * @tc.name      testFieldInitSix0030
     * @tc.desc      The assignment is performed each time an instance of the class is created.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitSix0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: byte = 5
          for (let i: int = 0; i < 5; i++) {
            let a: A_F625 = new A_F625()
        expect(a.field instanceof byte).assertTrue()
        expect(a.field).assertEqual(val)
            val += 1
          }
          v_F624 = 5
    })

    /**
     * @tc.number    SUB_FIELD_INIT_SIX_3100
     * @tc.name      testFieldInitSix0031
     * @tc.desc      The assignment is performed each time an instance of the class is created.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitSix0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: short = 5
          for (let i: int = 0; i < 5; i++) {
            let a: A_F626 = new A_F626()
        expect(a.field instanceof short).assertTrue()
        expect(a.field).assertEqual(val)
            val += 1
          }
          v_F625 = 5
    })

    /**
     * @tc.number    SUB_FIELD_INIT_SIX_3200
     * @tc.name      testFieldInitSix0032
     * @tc.desc      The assignment is performed each time an instance of the class is created.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitSix0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: double = 5
          for (let i: int = 0; i < 5; i++) {
            let a: A_F627 = new A_F627()
        expect(a.field instanceof double).assertTrue()
        expect(a.field).assertEqual(val)
            val += 1
          }
          v_F626 = 5
    })

    /**
     * @tc.number    SUB_FIELD_INIT_SIX_3300
     * @tc.name      testFieldInitSix0033
     * @tc.desc      The assignment is performed each time an instance of the class is created.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitSix0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: int = 5
          for (let i: int = 0; i < 5; i++) {
            let a: A_F628 = new A_F628()
        expect(a.field instanceof number).assertTrue()
        expect(a.field).assertEqual(val)
            val += 1
          }
          v_F627 = 5
    })

    /**
     * @tc.number    SUB_FIELD_INIT_SIX_3400
     * @tc.name      testFieldInitSix0034
     * @tc.desc      The assignment is performed each time an instance of the class is created.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitSix0034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: float = 5.0f
          for (let i: int = 0; i < 5; i++) {
            let a: A_F629 = new A_F629()
        expect(a.field instanceof float).assertTrue()
        expect(a.field).assertEqual(val)
            val += 1.0f
          }
          v_F628 = 5.0f
    })

    /**
     * @tc.number    SUB_FIELD_INIT_SIX_3500
     * @tc.name      testFieldInitSix0035
     * @tc.desc      The assignment is performed each time an instance of the class is created.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitSix0035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: bigint = 5n
          for (let i: int = 0; i < 5; i++) {
            let a: A_F630 = new A_F630()
        expect(a.field instanceof bigint).assertTrue()
        expect(a.field).assertEqual(val)
            val += 1n
          }
          v_F629 = 5n
    })

    /**
     * @tc.number    SUB_FIELD_INIT_SIX_3600
     * @tc.name      testFieldInitSix0036
     * @tc.desc      The assignment is performed each time an instance of the class is created.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitSix0036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: string = "v"
          for (let i: int = 0; i < 5; i++) {
            let a: A_F631 = new A_F631()
        expect(a.field instanceof string).assertTrue()
        expect(a.field).assertEqual(val)
            val += "n"
          }
          v_F630 = "v"
    })

    /**
     * @tc.number    SUB_FIELD_INIT_SIX_3700
     * @tc.name      testFieldInitSix0037
     * @tc.desc      The assignment is performed each time an instance of the class is created.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitSix0037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: int = 5
          for (let i: int = 0; i < 5; i++) {
            let a: A_F632 = new A_F632()
        expect(a.field instanceof Object).assertTrue()
        expect(a.field instanceof int).assertTrue()
        expect(a.field).assertEqual(val)
            val += 1
          }
          v_F631 = 5
    })

    /**
     * @tc.number    SUB_FIELD_INIT_SIX_3800
     * @tc.name      testFieldInitSix0038
     * @tc.desc      The assignment is performed each time an instance of the class is created.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitSix0038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: int = 5
          for (let i: int = 0; i < 5; i++) {
            let a: A_F633 = new A_F633()
        expect(a.field instanceof Object | null).assertTrue()
        expect(a.field instanceof int).assertTrue()
        expect(a.field).assertEqual(val)
            val += 1
          }
          v_F632 = 5
    })

    /**
     * @tc.number    SUB_FIELD_INIT_SIX_3900
     * @tc.name      testFieldInitSix0039
     * @tc.desc      The assignment is performed each time an instance of the class is created.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitSix0039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: int = 5
          for (let i: int = 0; i < 5; i++) {
            let a: A_F634 = new A_F634()
        expect(a.field instanceof Object).assertTrue()
        expect(a.field instanceof int).assertTrue()
        expect(a.field).assertEqual(val)
            val += 1
          }
          v_F633 = 5
    })

    /**
     * @tc.number    SUB_FIELD_INIT_SIX_4000
     * @tc.name      testFieldInitSix0040
     * @tc.desc      The assignment is performed each time an instance of the class is created.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitSix0040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: int = 5
          for (let i: int = 0; i < 5; i++) {
            let a: A_F635 = new A_F635()
        expect(a.field instanceof Object).assertTrue()
        expect(a.field instanceof int).assertTrue()
        expect(a.field).assertEqual(val)
            val += 1
          }
          v_F634 = 5
    })

    /**
     * @tc.number    SUB_FIELD_INIT_SIX_4100
     * @tc.name      testFieldInitSix0041
     * @tc.desc      The assignment is performed each time an instance of the class is created.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitSix0041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: long = 5
          for (let i: int = 0; i < 5; i++) {
            let a: A_F637 = new A_F637()
        expect(a.field instanceof long).assertTrue()
        expect(a.field).assertEqual(val)
            val += 1
          }
          v_F636 = 5
    })

    /**
     * @tc.number    SUB_FIELD_INIT_SIX_4200
     * @tc.name      testFieldInitSix0042
     * @tc.desc      The assignment is performed each time an instance of the class is created.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitSix0042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: int = 5
          for (let i: int = 0; i < 5; i++) {
            let a: A_F638 = new A_F638()
        expect(a.field instanceof int).assertTrue()
        expect(a.field).assertEqual(val)
            val += 1
          }
          v_F637 = 5
    })

    /**
     * @tc.number    SUB_FIELD_INIT_SIX_4300
     * @tc.name      testFieldInitSix0043
     * @tc.desc      The assignment is performed each time an instance of the class is created.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitSix0043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: byte = 5
          for (let i: int = 0; i < 5; i++) {
            let a: A_F639 = new A_F639()
        expect(a.field instanceof byte).assertTrue()
        expect(a.field).assertEqual(val)
            val += 1
          }
          v_F638 = 5
    })

    /**
     * @tc.number    SUB_FIELD_INIT_SIX_4400
     * @tc.name      testFieldInitSix0044
     * @tc.desc      The assignment is performed each time an instance of the class is created.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitSix0044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: short = 5
          for (let i: int = 0; i < 5; i++) {
            let a: A_F640 = new A_F640()
        expect(a.field instanceof short).assertTrue()
        expect(a.field).assertEqual(val)
            val += 1
          }
          v_F639 = 5
    })

    /**
     * @tc.number    SUB_FIELD_INIT_SIX_4500
     * @tc.name      testFieldInitSix0045
     * @tc.desc      The assignment is performed each time an instance of the class is created.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitSix0045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: double = 5
          for (let i: int = 0; i < 5; i++) {
            let a: A_F641 = new A_F641()
        expect(a.field instanceof double).assertTrue()
        expect(a.field).assertEqual(val)
            val += 1
          }
          v_F640 = 5
    })

    /**
     * @tc.number    SUB_FIELD_INIT_SIX_4600
     * @tc.name      testFieldInitSix0046
     * @tc.desc      The assignment is performed each time an instance of the class is created.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitSix0046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: int = 5
          for (let i: int = 0; i < 5; i++) {
            let a: A_F642 = new A_F642()
        expect(a.field instanceof number).assertTrue()
        expect(a.field).assertEqual(val)
            val += 1
          }
          v_F641 = 5
    })

    /**
     * @tc.number    SUB_FIELD_INIT_SIX_4700
     * @tc.name      testFieldInitSix0047
     * @tc.desc      The assignment is performed each time an instance of the class is created.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitSix0047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: float = 5.0f
          for (let i: int = 0; i < 5; i++) {
            let a: A_F643 = new A_F643()
        expect(a.field instanceof float).assertTrue()
        expect(a.field).assertEqual(val)
            val += 1.0f
          }
          v_F642 = 5.0f
    })

    /**
     * @tc.number    SUB_FIELD_INIT_SIX_4800
     * @tc.name      testFieldInitSix0048
     * @tc.desc      The assignment is performed each time an instance of the class is created.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitSix0048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: bigint = 5n
          for (let i: int = 0; i < 5; i++) {
            let a: A_F644 = new A_F644()
        expect(a.field instanceof bigint).assertTrue()
        expect(a.field).assertEqual(val)
            val += 1n
          }
          v_F643 = 5n
    })

    /**
     * @tc.number    SUB_FIELD_INIT_SIX_4900
     * @tc.name      testFieldInitSix0049
     * @tc.desc      The assignment is performed each time an instance of the class is created.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitSix0049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: string = "v"
          for (let i: int = 0; i < 5; i++) {
            let a: A_F645 = new A_F645()
        expect(a.field instanceof string).assertTrue()
        expect(a.field).assertEqual(val)
            val += "n"
          }
          v_F644 = "v"
    })

    /**
     * @tc.number    SUB_FIELD_INIT_SIX_5000
     * @tc.name      testFieldInitSix0050
     * @tc.desc      The assignment is performed each time an instance of the class is created.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitSix0050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: int = 5
          for (let i: int = 0; i < 5; i++) {
            let a: A_F646 = new A_F646()
        expect(a.field instanceof Object).assertTrue()
        expect(a.field instanceof int).assertTrue()
        expect(a.field).assertEqual(val)
            val += 1
          }
          v_F645 = 5
    })

    /**
     * @tc.number    SUB_FIELD_INIT_SIX_5100
     * @tc.name      testFieldInitSix0051
     * @tc.desc      The assignment is performed each time an instance of the class is created.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitSix0051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: int = 5
          for (let i: int = 0; i < 5; i++) {
            let a: A_F647 = new A_F647()
        expect(a.field instanceof Object | null).assertTrue()
        expect(a.field instanceof int).assertTrue()
        expect(a.field).assertEqual(val)
            val += 1
          }
          v_F646 = 5
    })

    /**
     * @tc.number    SUB_FIELD_INIT_SIX_5200
     * @tc.name      testFieldInitSix0052
     * @tc.desc      The assignment is performed each time an instance of the class is created.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitSix0052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: int = 5
          for (let i: int = 0; i < 5; i++) {
            let a: A_F648 = new A_F648()
        expect(a.field instanceof Object).assertTrue()
        expect(a.field instanceof int).assertTrue()
        expect(a.field).assertEqual(val)
            val += 1
          }
          v_F647 = 5
    })

    /**
     * @tc.number    SUB_FIELD_INIT_SIX_5300
     * @tc.name      testFieldInitSix0053
     * @tc.desc      The assignment is performed each time an instance of the class is created.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitSix0053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: int = 5
          for (let i: int = 0; i < 5; i++) {
            let a: A_F649 = new A_F649()
        expect(a.field instanceof Object).assertTrue()
        expect(a.field instanceof int).assertTrue()
        expect(a.field).assertEqual(val)
            val += 1
          }
          v_F648 = 5
    })

    /**
     * @tc.number    SUB_FIELD_INIT_SIX_5400
     * @tc.name      testFieldInitSix0054
     * @tc.desc      The assignment is performed each time an instance of the class is created.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitSix0054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: long = 5
          for (let i: int = 0; i < 5; i++) {
            let a: A_F651 = new A_F651()
        expect(a.field instanceof long).assertTrue()
        expect(a.field).assertEqual(val)
            val += 1
          }
          v_F650 = 5
    })

    /**
     * @tc.number    SUB_FIELD_INIT_SIX_5500
     * @tc.name      testFieldInitSix0055
     * @tc.desc      The assignment is performed each time an instance of the class is created.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitSix0055", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: int = 5
          for (let i: int = 0; i < 5; i++) {
            let a: A_F652 = new A_F652()
        expect(a.field instanceof int).assertTrue()
        expect(a.field).assertEqual(val)
            val += 1
          }
          v_F651 = 5
    })

    /**
     * @tc.number    SUB_FIELD_INIT_SIX_5600
     * @tc.name      testFieldInitSix0056
     * @tc.desc      The assignment is performed each time an instance of the class is created.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitSix0056", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: byte = 5
          for (let i: int = 0; i < 5; i++) {
            let a: A_F653 = new A_F653()
        expect(a.field instanceof byte).assertTrue()
        expect(a.field).assertEqual(val)
            val += 1
          }
          v_F652 = 5
    })

    /**
     * @tc.number    SUB_FIELD_INIT_SIX_5700
     * @tc.name      testFieldInitSix0057
     * @tc.desc      The assignment is performed each time an instance of the class is created.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitSix0057", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: short = 5
          for (let i: int = 0; i < 5; i++) {
            let a: A_F654 = new A_F654()
        expect(a.field instanceof short).assertTrue()
        expect(a.field).assertEqual(val)
            val += 1
          }
          v_F653 = 5
    })

    /**
     * @tc.number    SUB_FIELD_INIT_SIX_5800
     * @tc.name      testFieldInitSix0058
     * @tc.desc      The assignment is performed each time an instance of the class is created.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitSix0058", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: double = 5
          for (let i: int = 0; i < 5; i++) {
            let a: A_F655 = new A_F655()
        expect(a.field instanceof double).assertTrue()
        expect(a.field).assertEqual(val)
            val += 1
          }
          v_F654 = 5
    })

    /**
     * @tc.number    SUB_FIELD_INIT_SIX_5900
     * @tc.name      testFieldInitSix0059
     * @tc.desc      The assignment is performed each time an instance of the class is created.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitSix0059", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: int = 5
          for (let i: int = 0; i < 5; i++) {
            let a: A_F656 = new A_F656()
        expect(a.field instanceof number).assertTrue()
        expect(a.field).assertEqual(val)
            val += 1
          }
          v_F655 = 5
    })

    /**
     * @tc.number    SUB_FIELD_INIT_SIX_6000
     * @tc.name      testFieldInitSix0060
     * @tc.desc      The assignment is performed each time an instance of the class is created.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitSix0060", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: float = 5.0f
          for (let i: int = 0; i < 5; i++) {
            let a: A_F657 = new A_F657()
        expect(a.field instanceof float).assertTrue()
        expect(a.field).assertEqual(val)
            val += 1.0f
          }
          v_F656 = 5.0f
    })

    /**
     * @tc.number    SUB_FIELD_INIT_SIX_6100
     * @tc.name      testFieldInitSix0061
     * @tc.desc      The assignment is performed each time an instance of the class is created.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitSix0061", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: bigint = 5n
          for (let i: int = 0; i < 5; i++) {
            let a: A_F658 = new A_F658()
        expect(a.field instanceof bigint).assertTrue()
        expect(a.field).assertEqual(val)
            val += 1n
          }
          v_F657 = 5n
    })

    /**
     * @tc.number    SUB_FIELD_INIT_SIX_6200
     * @tc.name      testFieldInitSix0062
     * @tc.desc      The assignment is performed each time an instance of the class is created.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitSix0062", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: string = "v"
          for (let i: int = 0; i < 5; i++) {
            let a: A_F659 = new A_F659()
        expect(a.field instanceof string).assertTrue()
        expect(a.field).assertEqual(val)
            val += "n"
          }
          v_F658 = "v"
    })

    /**
     * @tc.number    SUB_FIELD_INIT_SIX_6300
     * @tc.name      testFieldInitSix0063
     * @tc.desc      The assignment is performed each time an instance of the class is created.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitSix0063", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: int = 5
          for (let i: int = 0; i < 5; i++) {
            let a: A_F660 = new A_F660()
        expect(a.field instanceof Object).assertTrue()
        expect(a.field instanceof int).assertTrue()
        expect(a.field).assertEqual(val)
            val += 1
          }
          v_F659 = 5
    })

    /**
     * @tc.number    SUB_FIELD_INIT_SIX_6400
     * @tc.name      testFieldInitSix0064
     * @tc.desc      The assignment is performed each time an instance of the class is created.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitSix0064", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: int = 5
          for (let i: int = 0; i < 5; i++) {
            let a: A_F661 = new A_F661()
        expect(a.field instanceof Object | null).assertTrue()
        expect(a.field instanceof int).assertTrue()
        expect(a.field).assertEqual(val)
            val += 1
          }
          v_F660 = 5
    })

    /**
     * @tc.number    SUB_FIELD_INIT_SIX_6500
     * @tc.name      testFieldInitSix0065
     * @tc.desc      The assignment is performed each time an instance of the class is created.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitSix0065", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: int = 5
          for (let i: int = 0; i < 5; i++) {
            let a: A_F662 = new A_F662()
        expect(a.field instanceof Object).assertTrue()
        expect(a.field instanceof int).assertTrue()
        expect(a.field).assertEqual(val)
            val += 1
          }
          v_F661 = 5
    })

    /**
     * @tc.number    SUB_FIELD_INIT_SIX_6600
     * @tc.name      testFieldInitSix0066
     * @tc.desc      The assignment is performed each time an instance of the class is created.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitSix0066", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: int = 5
          for (let i: int = 0; i < 5; i++) {
            let a: A_F663 = new A_F663()
        expect(a.field instanceof Object).assertTrue()
        expect(a.field instanceof int).assertTrue()
        expect(a.field).assertEqual(val)
            val += 1
          }
          v_F662 = 5
    })

    /**
     * @tc.number    SUB_FIELD_INIT_SIX_6700
     * @tc.name      testFieldInitSix0067
     * @tc.desc      Checking for initialization from constructor with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitSix0067", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: ns.A_F665 = new ns.A_F665()
      expect(a.field instanceof long).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof long).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_SIX_6800
     * @tc.name      testFieldInitSix0068
     * @tc.desc      Checking for initialization from constructor with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitSix0068", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: ns.A_F666 = new ns.A_F666()
      expect(a.field instanceof int).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof int).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_SIX_6900
     * @tc.name      testFieldInitSix0069
     * @tc.desc      Checking for initialization from constructor with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitSix0069", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: ns.A_F667 = new ns.A_F667()
      expect(a.field instanceof byte).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof byte).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_SIX_7000
     * @tc.name      testFieldInitSix0070
     * @tc.desc      Checking for initialization from constructor with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitSix0070", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: ns.A_F668 = new ns.A_F668()
      expect(a.field instanceof short).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof short).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_SIX_7100
     * @tc.name      testFieldInitSix0071
     * @tc.desc      Checking for initialization from constructor with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitSix0071", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: ns.A_F669 = new ns.A_F669()
      expect(a.field instanceof double).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 7.3
      expect(a.field instanceof double).assertTrue()
      expect(a.field).assertEqual(7.3)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_SIX_7200
     * @tc.name      testFieldInitSix0072
     * @tc.desc      Checking for initialization from constructor with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitSix0072", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: ns.A_F670 = new ns.A_F670()
      expect(a.field instanceof number).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof number).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_SIX_7300
     * @tc.name      testFieldInitSix0073
     * @tc.desc      Checking for initialization from constructor with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitSix0073", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: ns.A_F671 = new ns.A_F671()
      expect(a.field instanceof float).assertTrue()
      expect(a.field).assertEqual(4.5f)
      a.field = 7.3f
      expect(a.field instanceof float).assertTrue()
      expect(a.field).assertEqual(7.3f)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_SIX_7400
     * @tc.name      testFieldInitSix0074
     * @tc.desc      Checking for initialization from constructor with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitSix0074", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: ns.A_F672 = new ns.A_F672()
      expect(a.field instanceof bigint).assertTrue()
      expect(a.field).assertEqual(4n)
      a.field = 5n
      expect(a.field instanceof bigint).assertTrue()
      expect(a.field).assertEqual(5n)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_SIX_7500
     * @tc.name      testFieldInitSix0075
     * @tc.desc      Checking for initialization from constructor with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitSix0075", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: ns.A_F673 = new ns.A_F673()
      expect(a.field instanceof string).assertTrue()
      expect(a.field).assertEqual("abc")
      a.field = "efg"
      expect(a.field instanceof string).assertTrue()
      expect(a.field).assertEqual("efg")
    })

    /**
     * @tc.number    SUB_FIELD_INIT_SIX_7600
     * @tc.name      testFieldInitSix0076
     * @tc.desc      Checking for initialization from constructor with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitSix0076", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: ns.A_F674 = new ns.A_F674()
      expect(a.field instanceof char).assertTrue()
      expect(a.field).assertEqual(c'a')
      a.field = c'b'
      expect(a.field instanceof char).assertTrue()
      expect(a.field).assertEqual(c'b')
    })

    /**
     * @tc.number    SUB_FIELD_INIT_SIX_7700
     * @tc.name      testFieldInitSix0077
     * @tc.desc      Checking for initialization from constructor with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitSix0077", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: ns.A_F675 = new ns.A_F675()
      expect(a.field instanceof boolean).assertTrue()
      expect(a.field).assertEqual(false)
      a.field = true
      expect(a.field instanceof boolean).assertTrue()
      expect(a.field).assertEqual(true)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_SIX_7800
     * @tc.name      testFieldInitSix0078
     * @tc.desc      Checking for initialization from constructor with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitSix0078", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: ns.A_F676 = new ns.A_F676()
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_SIX_7900
     * @tc.name      testFieldInitSix0079
     * @tc.desc      Checking for initialization from constructor with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitSix0079", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: ns.A_F677 = new ns.A_F677()
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(5)
    })


    /**
     * @tc.number    SUB_FIELD_INIT_SIX_8000
     * @tc.name      testFieldInitSix0080
     * @tc.desc      Checking for initialization from constructor with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitSix0080", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: ns.A_F679 = new ns.A_F679()
      expect(a.field instanceof long).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof long).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_SIX_8100
     * @tc.name      testFieldInitSix0081
     * @tc.desc      Checking for initialization from constructor with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitSix0081", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: ns.A_F680 = new ns.A_F680()
      expect(a.field instanceof int).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof int).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_SIX_8200
     * @tc.name      testFieldInitSix0082
     * @tc.desc      Checking for initialization from constructor with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitSix0082", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: ns.A_F681 = new ns.A_F681()
      expect(a.field instanceof byte).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof byte).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_SIX_8300
     * @tc.name      testFieldInitSix0083
     * @tc.desc      Checking for initialization from constructor with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitSix0083", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: ns.A_F682 = new ns.A_F682()
      expect(a.field instanceof short).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof short).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_SIX_8400
     * @tc.name      testFieldInitSix0084
     * @tc.desc      Checking for initialization from constructor with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitSix0084", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: ns.A_F683 = new ns.A_F683()
      expect(a.field instanceof double).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 7.3
      expect(a.field instanceof double).assertTrue()
      expect(a.field).assertEqual(7.3)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_SIX_8500
     * @tc.name      testFieldInitSix0085
     * @tc.desc      Checking for initialization from constructor with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitSix0085", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: ns.A_F684 = new ns.A_F684()
      expect(a.field instanceof number).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof number).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_SIX_8600
     * @tc.name      testFieldInitSix0086
     * @tc.desc      Checking for initialization from constructor with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitSix0086", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: ns.A_F685 = new ns.A_F685()
      expect(a.field instanceof float).assertTrue()
      expect(a.field).assertEqual(4.5f)
      a.field = 7.3f
      expect(a.field instanceof float).assertTrue()
      expect(a.field).assertEqual(7.3f)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_SIX_8700
     * @tc.name      testFieldInitSix0087
     * @tc.desc      Checking for initialization from constructor with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitSix0087", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: ns.A_F686 = new ns.A_F686()
      expect(a.field instanceof bigint).assertTrue()
      expect(a.field).assertEqual(4n)
      a.field = 5n
      expect(a.field instanceof bigint).assertTrue()
      expect(a.field).assertEqual(5n)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_SIX_8800
     * @tc.name      testFieldInitSix0088
     * @tc.desc      Checking for initialization from constructor with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitSix0088", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: ns.A_F687 = new ns.A_F687()
      expect(a.field instanceof string).assertTrue()
      expect(a.field).assertEqual("abc")
      a.field = "efg"
      expect(a.field instanceof string).assertTrue()
      expect(a.field).assertEqual("efg")
    })

    /**
     * @tc.number    SUB_FIELD_INIT_SIX_8900
     * @tc.name      testFieldInitSix0089
     * @tc.desc      Checking for initialization from constructor with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitSix0089", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: ns.A_F688 = new ns.A_F688()
      expect(a.field instanceof char).assertTrue()
      expect(a.field).assertEqual(c'a')
      a.field = c'b'
      expect(a.field instanceof char).assertTrue()
      expect(a.field).assertEqual(c'b')
    })

    /**
     * @tc.number    SUB_FIELD_INIT_SIX_9000
     * @tc.name      testFieldInitSix0090
     * @tc.desc      Checking for initialization from constructor with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitSix0090", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: ns.A_F689 = new ns.A_F689()
      expect(a.field instanceof boolean).assertTrue()
      expect(a.field).assertEqual(false)
      a.field = true
      expect(a.field instanceof boolean).assertTrue()
      expect(a.field).assertEqual(true)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_SIX_9100
     * @tc.name      testFieldInitSix0091
     * @tc.desc      Checking for initialization from constructor with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitSix0091", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: ns.A_F690 = new ns.A_F690()
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_SIX_9200
     * @tc.name      testFieldInitSix0092
     * @tc.desc      Checking for initialization from constructor with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitSix0092", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: ns.A_F691 = new ns.A_F691()
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(5)
    })
  })
}
