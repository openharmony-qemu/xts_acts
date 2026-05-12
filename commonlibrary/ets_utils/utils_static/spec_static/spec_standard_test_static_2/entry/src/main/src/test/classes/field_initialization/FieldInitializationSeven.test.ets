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

namespace ns {
    export class A_F778 {
      private _field: int
      get field(): int {
        return this._field
      }
      set field(a: int) {
        this._field = a
      }
      constructor (...args: Any[]) {
        this._field = 4
      }
    }
  }

namespace ns {
    export class A_F779 {
      private _field: byte
      get field(): byte {
        return this._field
      }
      set field(a: byte) {
        this._field = a
      }
      constructor (...args: Any[]) {
        this._field = 4
      }
    }
  }

namespace ns {
    export class A_F780 {
      private _field: short
      get field(): short {
        return this._field
      }
      set field(a: short) {
        this._field = a
      }
      constructor (...args: Any[]) {
        this._field = 4
      }
    }
  }

namespace ns {
    export class A_F781 {
      private _field: double
      get field(): double {
        return this._field
      }
      set field(a: double) {
        this._field = a
      }
      constructor (...args: Any[]) {
        this._field = 4
      }
    }
  }

namespace ns {
    export class A_F782 {
      private _field: number
      get field(): number {
        return this._field
      }
      set field(a: number) {
        this._field = a
      }
      constructor (...args: Any[]) {
        this._field = 4
      }
    }
  }

namespace ns {
    export class A_F783 {
      private _field: float
      get field(): float {
        return this._field
      }
      set field(a: float) {
        this._field = a
      }
      constructor (...args: Any[]) {
        this._field = 4.5f
      }
    }
  }

namespace ns {
    export class A_F784 {
      private _field: bigint
      get field(): bigint {
        return this._field
      }
      set field(a: bigint) {
        this._field = a
      }
      constructor (...args: Any[]) {
        this._field = 4n
      }
    }
  }

namespace ns {
    export class A_F785 {
      private _field: string
      get field(): string {
        return this._field
      }
      set field(a: string) {
        this._field = a
      }
      constructor (...args: Any[]) {
        this._field = "abc"
      }
    }
  }

namespace ns {
    export class A_F786 {
      private _field: char
      get field(): char {
        return this._field
      }
      set field(a: char) {
        this._field = a
      }
      constructor (...args: Any[]) {
        this._field = c'a'
      }
    }
  }

namespace ns {
    export class A_F787 {
      private _field: boolean
      get field(): boolean {
        return this._field
      }
      set field(a: boolean) {
        this._field = a
      }
      constructor (...args: Any[]) {
        this._field = false
      }
    }
  }

namespace ns {
    export class A_F788 {
      private _field: Object
      get field(): Object {
        return this._field
      }
      set field(a: Object) {
        this._field = a
      }
      constructor (...args: Any[]) {
        this._field = 4
      }
    }
  }

namespace ns {
    export class A_F789 {
      private _field: Object | undefined | null
      get field(): Object | undefined | null {
        return this._field
      }
      set field(a: Object | undefined | null) {
        this._field = a
      }
      constructor (...args: Any[]) {
        this._field = 4
      }
    }
  }

namespace ns {
    export class A_F790 {
      private _field: Any
      get field(): Any {
        return this._field
      }
      set field(a: Any) {
        this._field = a
      }
      constructor (...args: Any[]) {
        this._field = 4
      }
    }
  }

class A_F791 {
    static field: long
  }

class A_F792 {
    static field: int
  }

export default function FieldInitializationTestSeven(): void {
  describe("FieldInitializationTestSeven", () => {
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
     * @tc.number    SUB_FIELD_INIT_TEST_0694
     * @tc.name      testFieldInit0694
     * @tc.desc      Checking for initialization from constructor with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0694", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: ns.A_F694 = new ns.A_F694()
      expect(a.field instanceof int).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof int).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0695
     * @tc.name      testFieldInit0695
     * @tc.desc      Checking for initialization from constructor with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0695", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: ns.A_F695 = new ns.A_F695()
      expect(a.field instanceof byte).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof byte).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0696
     * @tc.name      testFieldInit0696
     * @tc.desc      Checking for initialization from constructor with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0696", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: ns.A_F696 = new ns.A_F696()
      expect(a.field instanceof short).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof short).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0697
     * @tc.name      testFieldInit0697
     * @tc.desc      Checking for initialization from constructor with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0697", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: ns.A_F697 = new ns.A_F697()
      expect(a.field instanceof double).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 7.3
      expect(a.field instanceof double).assertTrue()
      expect(a.field).assertEqual(7.3)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0698
     * @tc.name      testFieldInit0698
     * @tc.desc      Checking for initialization from constructor with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0698", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: ns.A_F698 = new ns.A_F698()
      expect(a.field instanceof number).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof number).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0699
     * @tc.name      testFieldInit0699
     * @tc.desc      Checking for initialization from constructor with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0699", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: ns.A_F699 = new ns.A_F699()
      expect(a.field instanceof float).assertTrue()
      expect(a.field).assertEqual(4.5f)
      a.field = 7.3f
      expect(a.field instanceof float).assertTrue()
      expect(a.field).assertEqual(7.3f)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0700
     * @tc.name      testFieldInit0700
     * @tc.desc      Checking for initialization from constructor with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: ns.A_F700 = new ns.A_F700()
      expect(a.field instanceof bigint).assertTrue()
      expect(a.field).assertEqual(4n)
      a.field = 5n
      expect(a.field instanceof bigint).assertTrue()
      expect(a.field).assertEqual(5n)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0701
     * @tc.name      testFieldInit0701
     * @tc.desc      Checking for initialization from constructor with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0701", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: ns.A_F701 = new ns.A_F701()
      expect(a.field instanceof string).assertTrue()
      expect(a.field).assertEqual("abc")
      a.field = "efg"
      expect(a.field instanceof string).assertTrue()
      expect(a.field).assertEqual("efg")
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0702
     * @tc.name      testFieldInit0702
     * @tc.desc      Checking for initialization from constructor with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0702", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: ns.A_F702 = new ns.A_F702()
      expect(a.field instanceof char).assertTrue()
      expect(a.field).assertEqual(c'a')
      a.field = c'b'
      expect(a.field instanceof char).assertTrue()
      expect(a.field).assertEqual(c'b')
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0703
     * @tc.name      testFieldInit0703
     * @tc.desc      Checking for initialization from constructor with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0703", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: ns.A_F703 = new ns.A_F703()
      expect(a.field instanceof boolean).assertTrue()
      expect(a.field).assertEqual(false)
      a.field = true
      expect(a.field instanceof boolean).assertTrue()
      expect(a.field).assertEqual(true)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0704
     * @tc.name      testFieldInit0704
     * @tc.desc      Checking for initialization from constructor with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0704", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: ns.A_F704 = new ns.A_F704()
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0705
     * @tc.name      testFieldInit0705
     * @tc.desc      Checking for initialization from constructor with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0705", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: ns.A_F705 = new ns.A_F705()
      expect(a.field instanceof Object | undefined | null).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof Object | undefined | null).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0706
     * @tc.name      testFieldInit0706
     * @tc.desc      Checking for initialization from constructor with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0706", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: ns.A_F706 = new ns.A_F706()
      expect(a.field instanceof Any).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof Any).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0707
     * @tc.name      testFieldInit0707
     * @tc.desc      Checking for initialization from constructor with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0707", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: ns.A_F707 = new ns.A_F707()
      expect(a.field instanceof long).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof long).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0708
     * @tc.name      testFieldInit0708
     * @tc.desc      Checking for initialization from constructor with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0708", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: ns.A_F708 = new ns.A_F708()
      expect(a.field instanceof int).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof int).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0709
     * @tc.name      testFieldInit0709
     * @tc.desc      Checking for initialization from constructor with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0709", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: ns.A_F709 = new ns.A_F709()
      expect(a.field instanceof byte).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof byte).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0710
     * @tc.name      testFieldInit0710
     * @tc.desc      Checking for initialization from constructor with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0710", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: ns.A_F710 = new ns.A_F710()
      expect(a.field instanceof short).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof short).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0711
     * @tc.name      testFieldInit0711
     * @tc.desc      Checking for initialization from constructor with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0711", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: ns.A_F711 = new ns.A_F711()
      expect(a.field instanceof double).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 7.3
      expect(a.field instanceof double).assertTrue()
      expect(a.field).assertEqual(7.3)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0712
     * @tc.name      testFieldInit0712
     * @tc.desc      Checking for initialization from constructor with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0712", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: ns.A_F712 = new ns.A_F712()
      expect(a.field instanceof number).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof number).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0713
     * @tc.name      testFieldInit0713
     * @tc.desc      Checking for initialization from constructor with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0713", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: ns.A_F713 = new ns.A_F713()
      expect(a.field instanceof float).assertTrue()
      expect(a.field).assertEqual(4.5f)
      a.field = 7.3f
      expect(a.field instanceof float).assertTrue()
      expect(a.field).assertEqual(7.3f)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0714
     * @tc.name      testFieldInit0714
     * @tc.desc      Checking for initialization from constructor with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0714", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: ns.A_F714 = new ns.A_F714()
      expect(a.field instanceof bigint).assertTrue()
      expect(a.field).assertEqual(4n)
      a.field = 5n
      expect(a.field instanceof bigint).assertTrue()
      expect(a.field).assertEqual(5n)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0715
     * @tc.name      testFieldInit0715
     * @tc.desc      Checking for initialization from constructor with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0715", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: ns.A_F715 = new ns.A_F715()
      expect(a.field instanceof string).assertTrue()
      expect(a.field).assertEqual("abc")
      a.field = "efg"
      expect(a.field instanceof string).assertTrue()
      expect(a.field).assertEqual("efg")
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0716
     * @tc.name      testFieldInit0716
     * @tc.desc      Checking for initialization from constructor with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0716", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: ns.A_F716 = new ns.A_F716()
      expect(a.field instanceof char).assertTrue()
      expect(a.field).assertEqual(c'a')
      a.field = c'b'
      expect(a.field instanceof char).assertTrue()
      expect(a.field).assertEqual(c'b')
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0717
     * @tc.name      testFieldInit0717
     * @tc.desc      Checking for initialization from constructor with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0717", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: ns.A_F717 = new ns.A_F717()
      expect(a.field instanceof boolean).assertTrue()
      expect(a.field).assertEqual(false)
      a.field = true
      expect(a.field instanceof boolean).assertTrue()
      expect(a.field).assertEqual(true)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0718
     * @tc.name      testFieldInit0718
     * @tc.desc      Checking for initialization from constructor with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0718", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: ns.A_F718 = new ns.A_F718()
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0719
     * @tc.name      testFieldInit0719
     * @tc.desc      Checking for initialization from constructor with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0719", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: ns.A_F719 = new ns.A_F719()
      expect(a.field instanceof Object | undefined | null).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof Object | undefined | null).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0720
     * @tc.name      testFieldInit0720
     * @tc.desc      Checking for initialization from constructor with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0720", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: ns.A_F720 = new ns.A_F720()
      expect(a.field instanceof Any).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof Any).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0721
     * @tc.name      testFieldInit0721
     * @tc.desc      Checking for initialization from constructor with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0721", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: ns.A_F721 = new ns.A_F721()
      expect(a.field instanceof long).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof long).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0722
     * @tc.name      testFieldInit0722
     * @tc.desc      Checking for initialization from constructor with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0722", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: ns.A_F722 = new ns.A_F722()
      expect(a.field instanceof int).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof int).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0723
     * @tc.name      testFieldInit0723
     * @tc.desc      Checking for initialization from constructor with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0723", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: ns.A_F723 = new ns.A_F723()
      expect(a.field instanceof byte).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof byte).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0724
     * @tc.name      testFieldInit0724
     * @tc.desc      Checking for initialization from constructor with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0724", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: ns.A_F724 = new ns.A_F724()
      expect(a.field instanceof short).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof short).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0725
     * @tc.name      testFieldInit0725
     * @tc.desc      Checking for initialization from constructor with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0725", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: ns.A_F725 = new ns.A_F725()
      expect(a.field instanceof double).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 7.3
      expect(a.field instanceof double).assertTrue()
      expect(a.field).assertEqual(7.3)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0726
     * @tc.name      testFieldInit0726
     * @tc.desc      Checking for initialization from constructor with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0726", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: ns.A_F726 = new ns.A_F726()
      expect(a.field instanceof number).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof number).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0727
     * @tc.name      testFieldInit0727
     * @tc.desc      Checking for initialization from constructor with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0727", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: ns.A_F727 = new ns.A_F727()
      expect(a.field instanceof float).assertTrue()
      expect(a.field).assertEqual(4.5f)
      a.field = 7.3f
      expect(a.field instanceof float).assertTrue()
      expect(a.field).assertEqual(7.3f)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0728
     * @tc.name      testFieldInit0728
     * @tc.desc      Checking for initialization from constructor with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0728", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: ns.A_F728 = new ns.A_F728()
      expect(a.field instanceof bigint).assertTrue()
      expect(a.field).assertEqual(4n)
      a.field = 5n
      expect(a.field instanceof bigint).assertTrue()
      expect(a.field).assertEqual(5n)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0729
     * @tc.name      testFieldInit0729
     * @tc.desc      Checking for initialization from constructor with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0729", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: ns.A_F729 = new ns.A_F729()
      expect(a.field instanceof string).assertTrue()
      expect(a.field).assertEqual("abc")
      a.field = "efg"
      expect(a.field instanceof string).assertTrue()
      expect(a.field).assertEqual("efg")
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0730
     * @tc.name      testFieldInit0730
     * @tc.desc      Checking for initialization from constructor with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0730", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: ns.A_F730 = new ns.A_F730()
      expect(a.field instanceof char).assertTrue()
      expect(a.field).assertEqual(c'a')
      a.field = c'b'
      expect(a.field instanceof char).assertTrue()
      expect(a.field).assertEqual(c'b')
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0731
     * @tc.name      testFieldInit0731
     * @tc.desc      Checking for initialization from constructor with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0731", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: ns.A_F731 = new ns.A_F731()
      expect(a.field instanceof boolean).assertTrue()
      expect(a.field).assertEqual(false)
      a.field = true
      expect(a.field instanceof boolean).assertTrue()
      expect(a.field).assertEqual(true)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0732
     * @tc.name      testFieldInit0732
     * @tc.desc      Checking for initialization from constructor with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0732", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: ns.A_F732 = new ns.A_F732()
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0733
     * @tc.name      testFieldInit0733
     * @tc.desc      Checking for initialization from constructor with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0733", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: ns.A_F733 = new ns.A_F733()
      expect(a.field instanceof Object | undefined | null).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof Object | undefined | null).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0734
     * @tc.name      testFieldInit0734
     * @tc.desc      Checking for initialization from constructor with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0734", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: ns.A_F734 = new ns.A_F734()
      expect(a.field instanceof Any).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof Any).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0735
     * @tc.name      testFieldInit0735
     * @tc.desc      Checking for initialization from constructor with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0735", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: ns.A_F735 = new ns.A_F735()
      expect(a.field instanceof long).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof long).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0736
     * @tc.name      testFieldInit0736
     * @tc.desc      Checking for initialization from constructor with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0736", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: ns.A_F736 = new ns.A_F736()
      expect(a.field instanceof int).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof int).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0737
     * @tc.name      testFieldInit0737
     * @tc.desc      Checking for initialization from constructor with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0737", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: ns.A_F737 = new ns.A_F737()
      expect(a.field instanceof byte).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof byte).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0738
     * @tc.name      testFieldInit0738
     * @tc.desc      Checking for initialization from constructor with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0738", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: ns.A_F738 = new ns.A_F738()
      expect(a.field instanceof short).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof short).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0739
     * @tc.name      testFieldInit0739
     * @tc.desc      Checking for initialization from constructor with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0739", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: ns.A_F739 = new ns.A_F739()
      expect(a.field instanceof double).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 7.3
      expect(a.field instanceof double).assertTrue()
      expect(a.field).assertEqual(7.3)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0740
     * @tc.name      testFieldInit0740
     * @tc.desc      Checking for initialization from constructor with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0740", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: ns.A_F740 = new ns.A_F740()
      expect(a.field instanceof number).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof number).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0741
     * @tc.name      testFieldInit0741
     * @tc.desc      Checking for initialization from constructor with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0741", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: ns.A_F741 = new ns.A_F741()
      expect(a.field instanceof float).assertTrue()
      expect(a.field).assertEqual(4.5f)
      a.field = 7.3f
      expect(a.field instanceof float).assertTrue()
      expect(a.field).assertEqual(7.3f)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0742
     * @tc.name      testFieldInit0742
     * @tc.desc      Checking for initialization from constructor with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0742", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: ns.A_F742 = new ns.A_F742()
      expect(a.field instanceof bigint).assertTrue()
      expect(a.field).assertEqual(4n)
      a.field = 5n
      expect(a.field instanceof bigint).assertTrue()
      expect(a.field).assertEqual(5n)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0743
     * @tc.name      testFieldInit0743
     * @tc.desc      Checking for initialization from constructor with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0743", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: ns.A_F743 = new ns.A_F743()
      expect(a.field instanceof string).assertTrue()
      expect(a.field).assertEqual("abc")
      a.field = "efg"
      expect(a.field instanceof string).assertTrue()
      expect(a.field).assertEqual("efg")
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0744
     * @tc.name      testFieldInit0744
     * @tc.desc      Checking for initialization from constructor with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0744", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: ns.A_F744 = new ns.A_F744()
      expect(a.field instanceof char).assertTrue()
      expect(a.field).assertEqual(c'a')
      a.field = c'b'
      expect(a.field instanceof char).assertTrue()
      expect(a.field).assertEqual(c'b')
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0745
     * @tc.name      testFieldInit0745
     * @tc.desc      Checking for initialization from constructor with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0745", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: ns.A_F745 = new ns.A_F745()
      expect(a.field instanceof boolean).assertTrue()
      expect(a.field).assertEqual(false)
      a.field = true
      expect(a.field instanceof boolean).assertTrue()
      expect(a.field).assertEqual(true)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0746
     * @tc.name      testFieldInit0746
     * @tc.desc      Checking for initialization from constructor with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0746", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: ns.A_F746 = new ns.A_F746()
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0747
     * @tc.name      testFieldInit0747
     * @tc.desc      Checking for initialization from constructor with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0747", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: ns.A_F747 = new ns.A_F747()
      expect(a.field instanceof Object | undefined | null).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof Object | undefined | null).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0748
     * @tc.name      testFieldInit0748
     * @tc.desc      Checking for initialization from constructor with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0748", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: ns.A_F748 = new ns.A_F748()
      expect(a.field instanceof Any).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof Any).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0749
     * @tc.name      testFieldInit0749
     * @tc.desc      Checking for initialization from constructor with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0749", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: ns.A_F749 = new ns.A_F749()
      expect(a.field instanceof long).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof long).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0750
     * @tc.name      testFieldInit0750
     * @tc.desc      Checking for initialization from constructor with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0750", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: ns.A_F750 = new ns.A_F750()
      expect(a.field instanceof int).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof int).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0751
     * @tc.name      testFieldInit0751
     * @tc.desc      Checking for initialization from constructor with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0751", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: ns.A_F751 = new ns.A_F751()
      expect(a.field instanceof byte).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof byte).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0752
     * @tc.name      testFieldInit0752
     * @tc.desc      Checking for initialization from constructor with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0752", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: ns.A_F752 = new ns.A_F752()
      expect(a.field instanceof short).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof short).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0753
     * @tc.name      testFieldInit0753
     * @tc.desc      Checking for initialization from constructor with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0753", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: ns.A_F753 = new ns.A_F753()
      expect(a.field instanceof double).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 7.3
      expect(a.field instanceof double).assertTrue()
      expect(a.field).assertEqual(7.3)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0754
     * @tc.name      testFieldInit0754
     * @tc.desc      Checking for initialization from constructor with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0754", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: ns.A_F754 = new ns.A_F754()
      expect(a.field instanceof number).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof number).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0755
     * @tc.name      testFieldInit0755
     * @tc.desc      Checking for initialization from constructor with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0755", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: ns.A_F755 = new ns.A_F755()
      expect(a.field instanceof float).assertTrue()
      expect(a.field).assertEqual(4.5f)
      a.field = 7.3f
      expect(a.field instanceof float).assertTrue()
      expect(a.field).assertEqual(7.3f)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0756
     * @tc.name      testFieldInit0756
     * @tc.desc      Checking for initialization from constructor with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0756", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: ns.A_F756 = new ns.A_F756()
      expect(a.field instanceof bigint).assertTrue()
      expect(a.field).assertEqual(4n)
      a.field = 5n
      expect(a.field instanceof bigint).assertTrue()
      expect(a.field).assertEqual(5n)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0757
     * @tc.name      testFieldInit0757
     * @tc.desc      Checking for initialization from constructor with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0757", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: ns.A_F757 = new ns.A_F757()
      expect(a.field instanceof string).assertTrue()
      expect(a.field).assertEqual("abc")
      a.field = "efg"
      expect(a.field instanceof string).assertTrue()
      expect(a.field).assertEqual("efg")
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0758
     * @tc.name      testFieldInit0758
     * @tc.desc      Checking for initialization from constructor with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0758", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: ns.A_F758 = new ns.A_F758()
      expect(a.field instanceof char).assertTrue()
      expect(a.field).assertEqual(c'a')
      a.field = c'b'
      expect(a.field instanceof char).assertTrue()
      expect(a.field).assertEqual(c'b')
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0759
     * @tc.name      testFieldInit0759
     * @tc.desc      Checking for initialization from constructor with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0759", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: ns.A_F759 = new ns.A_F759()
      expect(a.field instanceof boolean).assertTrue()
      expect(a.field).assertEqual(false)
      a.field = true
      expect(a.field instanceof boolean).assertTrue()
      expect(a.field).assertEqual(true)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0760
     * @tc.name      testFieldInit0760
     * @tc.desc      Checking for initialization from constructor with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0760", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: ns.A_F760 = new ns.A_F760()
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0761
     * @tc.name      testFieldInit0761
     * @tc.desc      Checking for initialization from constructor with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0761", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: ns.A_F761 = new ns.A_F761()
      expect(a.field instanceof Object | undefined | null).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof Object | undefined | null).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0762
     * @tc.name      testFieldInit0762
     * @tc.desc      Checking for initialization from constructor with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0762", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: ns.A_F762 = new ns.A_F762()
      expect(a.field instanceof Any).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof Any).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0763
     * @tc.name      testFieldInit0763
     * @tc.desc      Checking for initialization from constructor with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0763", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: ns.A_F763 = new ns.A_F763()
      expect(a.field instanceof long).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof long).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0764
     * @tc.name      testFieldInit0764
     * @tc.desc      Checking for initialization from constructor with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0764", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: ns.A_F764 = new ns.A_F764()
      expect(a.field instanceof int).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof int).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0765
     * @tc.name      testFieldInit0765
     * @tc.desc      Checking for initialization from constructor with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0765", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: ns.A_F765 = new ns.A_F765()
      expect(a.field instanceof byte).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof byte).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0766
     * @tc.name      testFieldInit0766
     * @tc.desc      Checking for initialization from constructor with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0766", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: ns.A_F766 = new ns.A_F766()
      expect(a.field instanceof short).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof short).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0767
     * @tc.name      testFieldInit0767
     * @tc.desc      Checking for initialization from constructor with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0767", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: ns.A_F767 = new ns.A_F767()
      expect(a.field instanceof double).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 7.3
      expect(a.field instanceof double).assertTrue()
      expect(a.field).assertEqual(7.3)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0768
     * @tc.name      testFieldInit0768
     * @tc.desc      Checking for initialization from constructor with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0768", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: ns.A_F768 = new ns.A_F768()
      expect(a.field instanceof number).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof number).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0769
     * @tc.name      testFieldInit0769
     * @tc.desc      Checking for initialization from constructor with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0769", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: ns.A_F769 = new ns.A_F769()
      expect(a.field instanceof float).assertTrue()
      expect(a.field).assertEqual(4.5f)
      a.field = 7.3f
      expect(a.field instanceof float).assertTrue()
      expect(a.field).assertEqual(7.3f)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0770
     * @tc.name      testFieldInit0770
     * @tc.desc      Checking for initialization from constructor with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0770", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: ns.A_F770 = new ns.A_F770()
      expect(a.field instanceof bigint).assertTrue()
      expect(a.field).assertEqual(4n)
      a.field = 5n
      expect(a.field instanceof bigint).assertTrue()
      expect(a.field).assertEqual(5n)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0771
     * @tc.name      testFieldInit0771
     * @tc.desc      Checking for initialization from constructor with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0771", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: ns.A_F771 = new ns.A_F771()
      expect(a.field instanceof string).assertTrue()
      expect(a.field).assertEqual("abc")
      a.field = "efg"
      expect(a.field instanceof string).assertTrue()
      expect(a.field).assertEqual("efg")
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0772
     * @tc.name      testFieldInit0772
     * @tc.desc      Checking for initialization from constructor with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0772", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: ns.A_F772 = new ns.A_F772()
      expect(a.field instanceof char).assertTrue()
      expect(a.field).assertEqual(c'a')
      a.field = c'b'
      expect(a.field instanceof char).assertTrue()
      expect(a.field).assertEqual(c'b')
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0773
     * @tc.name      testFieldInit0773
     * @tc.desc      Checking for initialization from constructor with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0773", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: ns.A_F773 = new ns.A_F773()
      expect(a.field instanceof boolean).assertTrue()
      expect(a.field).assertEqual(false)
      a.field = true
      expect(a.field instanceof boolean).assertTrue()
      expect(a.field).assertEqual(true)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0774
     * @tc.name      testFieldInit0774
     * @tc.desc      Checking for initialization from constructor with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0774", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: ns.A_F774 = new ns.A_F774()
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0775
     * @tc.name      testFieldInit0775
     * @tc.desc      Checking for initialization from constructor with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0775", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: ns.A_F775 = new ns.A_F775()
      expect(a.field instanceof Object | undefined | null).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof Object | undefined | null).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0776
     * @tc.name      testFieldInit0776
     * @tc.desc      Checking for initialization from constructor with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0776", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: ns.A_F776 = new ns.A_F776()
      expect(a.field instanceof Any).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof Any).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0777
     * @tc.name      testFieldInit0777
     * @tc.desc      Checking for initialization from constructor with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0777", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: ns.A_F777 = new ns.A_F777()
      expect(a.field instanceof long).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof long).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0778
     * @tc.name      testFieldInit0778
     * @tc.desc      Checking for initialization from constructor with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0778", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: ns.A_F778 = new ns.A_F778()
      expect(a.field instanceof int).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof int).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0779
     * @tc.name      testFieldInit0779
     * @tc.desc      Checking for initialization from constructor with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0779", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: ns.A_F779 = new ns.A_F779()
      expect(a.field instanceof byte).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof byte).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0780
     * @tc.name      testFieldInit0780
     * @tc.desc      Checking for initialization from constructor with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0780", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: ns.A_F780 = new ns.A_F780()
      expect(a.field instanceof short).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof short).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0781
     * @tc.name      testFieldInit0781
     * @tc.desc      Checking for initialization from constructor with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0781", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: ns.A_F781 = new ns.A_F781()
      expect(a.field instanceof double).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 7.3
      expect(a.field instanceof double).assertTrue()
      expect(a.field).assertEqual(7.3)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0782
     * @tc.name      testFieldInit0782
     * @tc.desc      Checking for initialization from constructor with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0782", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: ns.A_F782 = new ns.A_F782()
      expect(a.field instanceof number).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof number).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0783
     * @tc.name      testFieldInit0783
     * @tc.desc      Checking for initialization from constructor with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0783", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: ns.A_F783 = new ns.A_F783()
      expect(a.field instanceof float).assertTrue()
      expect(a.field).assertEqual(4.5f)
      a.field = 7.3f
      expect(a.field instanceof float).assertTrue()
      expect(a.field).assertEqual(7.3f)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0784
     * @tc.name      testFieldInit0784
     * @tc.desc      Checking for initialization from constructor with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0784", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: ns.A_F784 = new ns.A_F784()
      expect(a.field instanceof bigint).assertTrue()
      expect(a.field).assertEqual(4n)
      a.field = 5n
      expect(a.field instanceof bigint).assertTrue()
      expect(a.field).assertEqual(5n)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0785
     * @tc.name      testFieldInit0785
     * @tc.desc      Checking for initialization from constructor with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0785", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: ns.A_F785 = new ns.A_F785()
      expect(a.field instanceof string).assertTrue()
      expect(a.field).assertEqual("abc")
      a.field = "efg"
      expect(a.field instanceof string).assertTrue()
      expect(a.field).assertEqual("efg")
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0786
     * @tc.name      testFieldInit0786
     * @tc.desc      Checking for initialization from constructor with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0786", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: ns.A_F786 = new ns.A_F786()
      expect(a.field instanceof char).assertTrue()
      expect(a.field).assertEqual(c'a')
      a.field = c'b'
      expect(a.field instanceof char).assertTrue()
      expect(a.field).assertEqual(c'b')
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0787
     * @tc.name      testFieldInit0787
     * @tc.desc      Checking for initialization from constructor with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0787", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: ns.A_F787 = new ns.A_F787()
      expect(a.field instanceof boolean).assertTrue()
      expect(a.field).assertEqual(false)
      a.field = true
      expect(a.field instanceof boolean).assertTrue()
      expect(a.field).assertEqual(true)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0788
     * @tc.name      testFieldInit0788
     * @tc.desc      Checking for initialization from constructor with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0788", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: ns.A_F788 = new ns.A_F788()
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0789
     * @tc.name      testFieldInit0789
     * @tc.desc      Checking for initialization from constructor with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0789", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: ns.A_F789 = new ns.A_F789()
      expect(a.field instanceof Object | undefined | null).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof Object | undefined | null).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0790
     * @tc.name      testFieldInit0790
     * @tc.desc      Checking for initialization from constructor with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0790", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: ns.A_F790 = new ns.A_F790()
      expect(a.field instanceof Any).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof Any).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0791
     * @tc.name      testFieldInit0791
     * @tc.desc      Checking for changing the value from outside of class.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0791", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F791.field instanceof long).assertTrue()
      expect(A_F791.field).assertEqual(0)
          A_F791.field = 5
      expect(A_F791.field instanceof long).assertTrue()
      expect(A_F791.field).assertEqual(5)
          A_F791.field = 0
      expect(A_F791.field instanceof long).assertTrue()
      expect(A_F791.field).assertEqual(0)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0792
     * @tc.name      testFieldInit0792
     * @tc.desc      Checking for changing the value from outside of class.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0792", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F792.field instanceof int).assertTrue()
      expect(A_F792.field).assertEqual(0)
          A_F792.field = 5
      expect(A_F792.field instanceof int).assertTrue()
      expect(A_F792.field).assertEqual(5)
          A_F792.field = 0
      expect(A_F792.field instanceof int).assertTrue()
      expect(A_F792.field).assertEqual(0)
    })
  })
}
