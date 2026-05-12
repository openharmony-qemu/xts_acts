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

namespace ns {
    export class A_F694 {
      field: int
      constructor (...args: Any[]) {
        this.field = 4
      }
    }
  }

namespace ns {
    export class A_F695 {
      field: byte
      constructor (...args: Any[]) {
        this.field = 4
      }
    }
  }

namespace ns {
    export class A_F696 {
      field: short
      constructor (...args: Any[]) {
        this.field = 4
      }
    }
  }

namespace ns {
    export class A_F697 {
      field: double
      constructor (...args: Any[]) {
        this.field = 4
      }
    }
  }

namespace ns {
    export class A_F698 {
      field: number
      constructor (...args: Any[]) {
        this.field = 4
      }
    }
  }

namespace ns {
    export class A_F699 {
      field: float
      constructor (...args: Any[]) {
        this.field = 4.5f
      }
    }
  }

namespace ns {
    export class A_F700 {
      field: bigint
      constructor (...args: Any[]) {
        this.field = 4n
      }
    }
  }

namespace ns {
    export class A_F701 {
      field: string
      constructor (...args: Any[]) {
        this.field = "abc"
      }
    }
  }

namespace ns {
    export class A_F702 {
      field: char
      constructor (...args: Any[]) {
        this.field = c'a'
      }
    }
  }

namespace ns {
    export class A_F703 {
      field: boolean
      constructor (...args: Any[]) {
        this.field = false
      }
    }
  }

namespace ns {
    export class A_F704 {
      field: Object
      constructor (...args: Any[]) {
        this.field = 4
      }
    }
  }

namespace ns {
    export class A_F705 {
      field: Object | undefined | null
      constructor (...args: Any[]) {
        this.field = 4
      }
    }
  }

namespace ns {
    export class A_F706 {
      field: Any
      constructor (...args: Any[]) {
        this.field = 4
      }
    }
  }

namespace ns {
    export class Base_F707 {
      protected v: long = 4
    }
    export class A_F707 extends Base_F707 {
      field: long
      constructor () {
        super()
        this.field = this.v
      }
    }
  }

namespace ns {
    export class Base_F708 {
      protected v: int = 4
    }
    export class A_F708 extends Base_F708 {
      field: int
      constructor () {
        super()
        this.field = this.v
      }
    }
  }

namespace ns {
    export class Base_F709 {
      protected v: byte = 4
    }
    export class A_F709 extends Base_F709 {
      field: byte
      constructor () {
        super()
        this.field = this.v
      }
    }
  }

namespace ns {
    export class Base_F710 {
      protected v: short = 4
    }
    export class A_F710 extends Base_F710 {
      field: short
      constructor () {
        super()
        this.field = this.v
      }
    }
  }

namespace ns {
    export class Base_F711 {
      protected v: double = 4
    }
    export class A_F711 extends Base_F711 {
      field: double
      constructor () {
        super()
        this.field = this.v
      }
    }
  }

namespace ns {
    export class Base_F712 {
      protected v: number = 4
    }
    export class A_F712 extends Base_F712 {
      field: number
      constructor () {
        super()
        this.field = this.v
      }
    }
  }

namespace ns {
    export class Base_F713 {
      protected v: float = 4.5f
    }
    export class A_F713 extends Base_F713 {
      field: float
      constructor () {
        super()
        this.field = this.v
      }
    }
  }

namespace ns {
    export class Base_F714 {
      protected v: bigint = 4n
    }
    export class A_F714 extends Base_F714 {
      field: bigint
      constructor () {
        super()
        this.field = this.v
      }
    }
  }

namespace ns {
    export class Base_F715 {
      protected v: string = "abc"
    }
    export class A_F715 extends Base_F715 {
      field: string
      constructor () {
        super()
        this.field = this.v
      }
    }
  }

namespace ns {
    export class Base_F716 {
      protected v: char = c'a'
    }
    export class A_F716 extends Base_F716 {
      field: char
      constructor () {
        super()
        this.field = this.v
      }
    }
  }

namespace ns {
    export class Base_F717 {
      protected v: boolean = false
    }
    export class A_F717 extends Base_F717 {
      field: boolean
      constructor () {
        super()
        this.field = this.v
      }
    }
  }

namespace ns {
    export class Base_F718 {
      protected v: Object = 4
    }
    export class A_F718 extends Base_F718 {
      field: Object
      constructor () {
        super()
        this.field = this.v
      }
    }
  }

namespace ns {
    export class Base_F719 {
      protected v: Object | undefined | null = 4
    }
    export class A_F719 extends Base_F719 {
      field: Object | undefined | null
      constructor () {
        super()
        this.field = this.v
      }
    }
  }

namespace ns {
    export class Base_F720 {
      protected v: Any = 4
    }
    export class A_F720 extends Base_F720 {
      field: Any
      constructor () {
        super()
        this.field = this.v
      }
    }
  }

namespace ns {
    export class A_F721 {
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
  }

namespace ns {
    export class A_F722 {
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
  }

namespace ns {
    export class A_F723 {
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
  }

namespace ns {
    export class A_F724 {
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
  }

namespace ns {
    export class A_F725 {
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
  }

namespace ns {
    export class A_F726 {
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
  }

namespace ns {
    export class A_F727 {
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
  }

namespace ns {
    export class A_F728 {
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
  }

namespace ns {
    export class A_F729 {
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
  }

namespace ns {
    export class A_F730 {
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
  }

namespace ns {
    export class A_F731 {
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
  }

namespace ns {
    export class A_F732 {
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
  }

namespace ns {
    export class A_F733 {
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
  }

namespace ns {
    export class A_F734 {
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
  }

namespace ns {
    export class Base_F735 {
      private _v: long = 4
      get v(): long {
        return this._v
      }
    }
    export class A_F735 extends Base_F735 {
      field: long
      constructor () {
        super()
        this.field = super.v
      }
    }
  }

namespace ns {
    export class Base_F736 {
      private _v: int = 4
      get v(): int {
        return this._v
      }
    }
    export class A_F736 extends Base_F736 {
      field: int
      constructor () {
        super()
        this.field = super.v
      }
    }
  }

namespace ns {
    export class Base_F737 {
      private _v: byte = 4
      get v(): byte {
        return this._v
      }
    }
    export class A_F737 extends Base_F737 {
      field: byte
      constructor () {
        super()
        this.field = super.v
      }
    }
  }

namespace ns {
    export class Base_F738 {
      private _v: short = 4
      get v(): short {
        return this._v
      }
    }
    export class A_F738 extends Base_F738 {
      field: short
      constructor () {
        super()
        this.field = super.v
      }
    }
  }

namespace ns {
    export class Base_F739 {
      private _v: double = 4
      get v(): double {
        return this._v
      }
    }
    export class A_F739 extends Base_F739 {
      field: double
      constructor () {
        super()
        this.field = super.v
      }
    }
  }

namespace ns {
    export class Base_F740 {
      private _v: number = 4
      get v(): number {
        return this._v
      }
    }
    export class A_F740 extends Base_F740 {
      field: number
      constructor () {
        super()
        this.field = super.v
      }
    }
  }

namespace ns {
    export class Base_F741 {
      private _v: float = 4.5f
      get v(): float {
        return this._v
      }
    }
    export class A_F741 extends Base_F741 {
      field: float
      constructor () {
        super()
        this.field = super.v
      }
    }
  }

namespace ns {
    export class Base_F742 {
      private _v: bigint = 4n
      get v(): bigint {
        return this._v
      }
    }
    export class A_F742 extends Base_F742 {
      field: bigint
      constructor () {
        super()
        this.field = super.v
      }
    }
  }

namespace ns {
    export class Base_F743 {
      private _v: string = "abc"
      get v(): string {
        return this._v
      }
    }
    export class A_F743 extends Base_F743 {
      field: string
      constructor () {
        super()
        this.field = super.v
      }
    }
  }

namespace ns {
    export class Base_F744 {
      private _v: char = c'a'
      get v(): char {
        return this._v
      }
    }
    export class A_F744 extends Base_F744 {
      field: char
      constructor () {
        super()
        this.field = super.v
      }
    }
  }

namespace ns {
    export class Base_F745 {
      private _v: boolean = false
      get v(): boolean {
        return this._v
      }
    }
    export class A_F745 extends Base_F745 {
      field: boolean
      constructor () {
        super()
        this.field = super.v
      }
    }
  }

namespace ns {
    export class Base_F746 {
      private _v: Object = 4
      get v(): Object {
        return this._v
      }
    }
    export class A_F746 extends Base_F746 {
      field: Object
      constructor () {
        super()
        this.field = super.v
      }
    }
  }

namespace ns {
    export class Base_F747 {
      private _v: Object | undefined | null = 4
      get v(): Object | undefined | null {
        return this._v
      }
    }
    export class A_F747 extends Base_F747 {
      field: Object | undefined | null
      constructor () {
        super()
        this.field = super.v
      }
    }
  }

namespace ns {
    export class Base_F748 {
      private _v: Any = 4
      get v(): Any {
        return this._v
      }
    }
    export class A_F748 extends Base_F748 {
      field: Any
      constructor () {
        super()
        this.field = super.v
      }
    }
  }

namespace ns {
    export class A_F749 {
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
  }

namespace ns {
    export class A_F750 {
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
  }

namespace ns {
    export class A_F751 {
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
  }

namespace ns {
    export class A_F752 {
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
  }

namespace ns {
    export class A_F753 {
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
  }

namespace ns {
    export class A_F754 {
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
  }

namespace ns {
    export class A_F755 {
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
  }

namespace ns {
    export class A_F756 {
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
  }

namespace ns {
    export class A_F757 {
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
  }

namespace ns {
    export class A_F758 {
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
  }

namespace ns {
    export class A_F759 {
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
  }

namespace ns {
    export class A_F760 {
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
  }

namespace ns {
    export class A_F761 {
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
  }

namespace ns {
    export class A_F762 {
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
  }

namespace ns {
    export class A_F763 {
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
  }

namespace ns {
    export class A_F764 {
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
  }

namespace ns {
    export class A_F765 {
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
  }

namespace ns {
    export class A_F766 {
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
  }

namespace ns {
    export class A_F767 {
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
  }

namespace ns {
    export class A_F768 {
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
  }

namespace ns {
    export class A_F769 {
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
  }

namespace ns {
    export class A_F770 {
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
  }

namespace ns {
    export class A_F771 {
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
  }

namespace ns {
    export class A_F772 {
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
  }

namespace ns {
    export class A_F773 {
      private _field: boolean
      get field(): boolean {
        return this._field
      }
      set field(a: boolean) {
        this._field = a
      }
      constructor (arg: boolean = false) {
        this._field = arg
      }
    }
  }

namespace ns {
    export class A_F774 {
      private _field: Object
      get field(): Object {
        return this._field
      }
      set field(a: Object) {
        this._field = a
      }
      constructor (arg: Object = 4) {
        this._field = arg
      }
    }
  }

namespace ns {
    export class A_F775 {
      private _field: Object | undefined | null
      get field(): Object | undefined | null {
        return this._field
      }
      set field(a: Object | undefined | null) {
        this._field = a
      }
      constructor (arg: Object | undefined | null = 4) {
        this._field = arg
      }
    }
  }

namespace ns {
    export class A_F776 {
      private _field: Any
      get field(): Any {
        return this._field
      }
      set field(a: Any) {
        this._field = a
      }
      constructor (arg: Any = 4) {
        this._field = arg
      }
    }
  }

namespace ns {
    export class A_F777 {
      private _field: long
      get field(): long {
        return this._field
      }
      set field(a: long) {
        this._field = a
      }
      constructor (...args: Any[]) {
        this._field = 4
      }
    }
  }
