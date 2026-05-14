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
} from '../../../../../hypium/index';

async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}

enum Color { Red, Green, Blue }

enum Country { cn = 'China', ru = 'Russia', us = 'USA', fr = 'France' }

class A {
  color: Color
  country: Country

  constructor(color: Color, country: Country) {
    this.color = color
    this.country = country
  }
}

class A1 {
  color: int
  country: string

  constructor(color: int, country: string) {
    this.color = color
    this.country = country
  }
}

class A2 {
  p: undefined | int | () => int
  q: string | () => string

  constructor(
    p?: int | () => int,
    q: string | () => string = () => 'Hello!'
  ) {
    this.p = p
    this.q = q
  }
}

class A3 {
  fld: Object[]

  constructor(...p: Object[]) {
    this.fld = p
  }
}

class A4 {
  fld: readonly string[][]

  constructor(...p: readonly string[][]) {
    this.fld = p
  }
}

class A5 {
  fld: (int | number | string | Array<boolean>)[]

  constructor(...p: Array<int | number | string | Array<boolean>>) {
    this.fld = p
  }
}

class A6 {
  fld: ReadonlyArray<ReadonlyArray<string>>

  constructor(...p: readonly Array<Array<string>>) {
    this.fld = p
  }
}

class A7 {
  fld: FixedArray<Object | null>

  constructor(...p: FixedArray<Object | null>) {
    this.fld = p
  }
}

class A8 {
  fld: FixedArray<FixedArray<string>>

  constructor(...p: FixedArray<FixedArray<string>>) {
    this.fld = p
  }
}

class A9 {
  fld: [string, (p: boolean) => string]

  constructor(...p: [string, (p: boolean) => string]) {
    this.fld = p
  }
}

class A10 {
  fld: readonly [String, boolean | null]

  constructor(...p: readonly [String, null | boolean]) {
    this.fld = p
  }
}

class A11 {
  p: int[]

  constructor(...any: int[]) {
    this.p = any
  }
}

let arr: int[] = [0, 1, 2]

class A12 {
  fld: ReadonlyArray<null | (p: number) => number>

  constructor(p: readonly (null | (p: number) => number)[]) {
    this.fld = p
  }
}

let arr1 = [(p: number) => p + 1.0, null, (p: number) => p + 2.0, (p: number) => p + 3.0]

class A13 {
  i: int
  p: Array<FixedArray<string | Country>>

  constructor(i: int, ...p: Array<FixedArray<string | Country>>) {
    this.i = i
    this.p = p
  }
}

let arr2: FixedArray<string | Country>[] = [[Country.us, Country.ru], ['br', Country.fr, 'de']]

class A14 {
  q: Array<string | number>

  constructor(p: string | number, ...q: Array<string | number>) {
    this.q = q
    this.q.push(p)
  }
}

class A15 {
  fld: FixedArray<int>

  constructor(...p: FixedArray<int>) {
    this.fld = p
  }
}

class A16 {
  p: FixedArray<Object>

  constructor(...arr3: FixedArray<Object>) {
    this.p = arr3
  }
}

let arr3: FixedArray<Object> = [0.0, 1.0, 2.0]

class A17 {
  tup: readonly [() => boolean, () => string, () => number]

  constructor(...tup: [() => boolean, () => string, () => number]) {
    this.tup = tup
  }
}

let tup: [() => boolean, () => string, () => number] = [
  () => true,
  () => 'abc',
  () => 42.0
]

class A18 {
  fld: FixedArray<number>

  constructor(...p: FixedArray<number>) {
    this.fld = p
  }
}

class A19 {
  fld: readonly [FixedArray<string>, (p: string) => Array<string>]

  constructor(p: readonly [FixedArray<string>, (p: string) => Array<string>]) {
    this.fld = p
  }
}

let tup1: [FixedArray<string>, (p: string) => Array<string>] =
  [['a', 'b', 'c'], (p: string) => [p]]

class A20 {
  p: boolean
  q: undefined | (p: boolean) => string

  constructor(p: undefined | boolean, q?: (p: boolean) => string) {
    this.p = p ?? false
    this.q = q
  }
}

class A21 {
  p: undefined | ReadonlyArray<string>

  constructor(p?: readonly string[]) {
    this.p = p
  }
}

class A22 {
  fld: Array<byte | short | int | undefined>

  constructor(b?: byte, s?: short, i?: int) {
    this.fld = [b, s, i]
  }
}

let b = (1).toByte()
let s = (2).toShort()

class A23 {
  fld?: number | string | Error

  constructor(p?: number | string | undefined | Error) {
    this.fld = p
  }
}

class A24 {
  p: (p: int) => string
  q: (p: number) => string

  constructor(p: (p: int) => string, q: (p: number) => string = (p: number) => 'X' + p) {
    this.p = p
    this.q = q
  }
}

class A25 {
  p: string
  q: number
  w: boolean | undefined

  constructor(p: string = 'A', q: number = 1.0, w?: boolean) {
    this.p = p
    this.q = q
    this.w = w
  }
}

class A26<T, U> {
  color: T
  country: U

  constructor(color: T, country: U) {
    this.color = color
    this.country = country
  }
}

class A27<T extends int, U extends string> {
  color: T
  country: U

  constructor(color: T, country: U) {
    this.color = color
    this.country = country
  }
}

class A28<T> {
  fld: readonly T[][]

  constructor(...p: readonly T[][]) {
    this.fld = p
  }
}

class A29<T> {
  fld: (T | number | string | Array<boolean>)[]

  constructor(...p: Array<T | number | string | Array<boolean>>) {
    this.fld = p
  }
}

class A30<T> {
  fld: ReadonlyArray<ReadonlyArray<T>>

  constructor(...p: readonly Array<Array<T>>) {
    this.fld = p
  }
}

class A31<T> {
  fld: FixedArray<T | null>

  constructor(...p: FixedArray<T | null>) {
    this.fld = p
  }
}

class A32<T> {
  fld: FixedArray<FixedArray<T>>

  constructor(...p: FixedArray<FixedArray<T>>) {
    this.fld = p
  }
}

class A33<T> {
  fld: [string, T]

  constructor(...p: [string, T]) {
    this.fld = p
  }
}

class A34<T, U, V> {
  fld: readonly [T, U | V]

  constructor(...p: readonly [T, U | V]) {
    this.fld = p
  }
}

class A35<T> {
  p: T[]

  constructor(...any: T[]) {
    this.p = any
  }
}

let arr4: int[] = [0, 1, 2]

class A36<T> {
  i: int
  p: Array<T>

  constructor(i: int, ...p: Array<T>) {
    this.i = i
    this.p = p
  }
}

let arr5: FixedArray<string | Country>[] = [[Country.us, Country.ru], ['br', Country.fr, 'de']]

class A37<T, U> {
  q: Array<T | U>

  constructor(p: T | U, ...q: Array<T | U>) {
    this.q = q
    this.q.push(p)
  }
}

class A38<T> {
  fld: ReadonlyArray<T>

  constructor(p: readonly T[]) {
    this.fld = p
  }
}

let arr6 = [(p: number) => p + 1.0, null, (p: number) => p + 2.0, (p: number) => p + 3.0]

class A39<T> {
  fld: T[]

  constructor(...p: T[]) {
    this.fld = p
  }
}

class A40<T> {
  p: FixedArray<T>

  constructor(...arr7: FixedArray<T>) {
    this.p = arr7
  }
}

let arr7: FixedArray<Object> = [0.0, 1.0, 2.0]

class A41<T, U, V> {
  tup2: readonly [() => T, () => U, () => V]

  constructor(...tup2: [() => T, () => U, () => V]) {
    this.tup2 = tup2
  }
}

let tup2: [() => boolean, () => string, () => number] = [
  () => true,
  () => 'abc',
  () => 42.0
]

class A42<T> {
  fld: T[]

  constructor(...p: T[]) {
    this.fld = p
  }
}

class A43<T> {
  fld: readonly [FixedArray<T>, (p: T) => Array<T>]

  constructor(p: readonly [FixedArray<T>, (p: T) => Array<T>]) {
    this.fld = p
  }
}

let tup3: [FixedArray<string>, (p: string) => Array<string>] =
  [['a', 'b', 'c'], (p: string) => [p]]

class A44<T> {
  p: T | boolean
  q: undefined | (p: T) => string

  constructor(p: undefined | T, q?: (p: T) => string) {
    this.p = p ?? false
    this.q = q
  }
}

class A45<T> {
  p: undefined | ReadonlyArray<T>

  constructor(p?: readonly T[]) {
    this.p = p
  }
}

class A46<T, U = undefined, V = undefined> {
  fld: Array<T | U | V | undefined>;

  constructor(b?: T, s?: U, i?: V) {
    this.fld = [b, s, i];
  }
}

let b1 = (1).toByte();
let s1 = (2).toShort();
let i = 3;

class A47<T> {
  fld?: T
  constructor(p?: T | undefined) {
    this.fld = p
  }
}

class A48<T> {
  p: (p: int) => string
  q: (p: T) => string

  constructor(p: (p: int) => string, q: (p: T) => string = (p: T) => 'X' + p) {
    this.p = p
    this.q = q
  }
}

class A49<T> {
  fld: T[]

  constructor(...p: T[]) {
    this.fld = p
  }
}

abstract class A50 {
  public p1: int | string | boolean = 0;
  public q1: number | number[] | undefined;
  public w1: number[] | undefined;

  protected constructor(p: int | string | boolean, q?: number | number[], w?: number[]) {
    this.p1 = p;
    this.q1 = q;
    this.w1 = w;
  }
}

class B extends A50 {
  private constructor(p: int | string | boolean, q?: number | number[], w?: number[]) {
    super(p, q, w);
  }

  static fromInt(p: int): B {
    return new B(p);
  }

  static fromString(p: string): B {
    return new B(p);
  }

  static fromArray(p: int, q?: number, w?: number[]): B {
    return new B(p, q, w);
  }
}

class A51 {
  public p1: int | string | boolean = 0;
  public q1: number | number[] | undefined;
  public w1: number[] | undefined;

  constructor(
    param1?: int | string | boolean,
    param2?: number | number[],
    param3?: number[]
  ) {
    if (param1 !== undefined) this.p1 = param1;
    if (param2 !== undefined) this.q1 = param2;
    if (param3 !== undefined) this.w1 = param3;
  }
}

class B1 extends A51 {
  constructor(
    param1?: int | string | boolean,
    param2?: number | number[],
    param3?: number[]
  ) {
    const p1 = param1 === undefined ? false : param1;
    super(p1, param2, param3);
  }
}

class A52 {
  public x: int;

  private constructor(p: int) {
    this.x = p;
  }

  static create(): A52 {
    return new A52(5)
  }
}

class A53 {
  public x: int;

  private constructor(p: int) {
    this.x = p;
  }

  static create(): A53 {
    return new A53(5);
  }
}

class A54 {
  public fld: int;

  protected constructor(p: int) {
    this.fld = p;
  }
}

class B2 extends A54 {
  constructor(p: int) {
    super(p)
  }
}

class A55 {
  public fld: int;

  protected constructor(p: int) {
    this.fld = p;
  }
}

class B3 extends A55 {
  constructor(p: int) {
    super(p);
  }
}

class A56 {
  public static inst: A56 | undefined = undefined
  public tag: string

  private constructor(p: string) {
    this.tag = p
  }

  static getInstance(t: string): A56 {
    if (A56.inst == undefined) {
      A56.inst = new A56(t)
    }
    return A56.inst!
  }
}

class A57 {
  public static inst: A57 | undefined = undefined
  public tag: string

  protected constructor(p: string) {
    this.tag = p
  }

  static getInstance(t: string): A57 {
    if (A57.inst == undefined) {
      A57.inst = new A57(t)
    }
    return A57.inst!
  }
}

class A58 {
  static inst: A58 = new A58()

  static getInstance(): A58 {
    return A58.inst
  }

  private constructor() {
  }
}

class A59 {
  public static inst: A59 | undefined = undefined;
  public tag: string = "";

  private constructor(tag: string) {
    this.tag = tag;
  }

  static fromString(p: string): A59 {
    return new A59(p);
  }

  static getInstance(t: string): A59 {
    if (A59.inst == undefined) {
      A59.inst = A59.fromString(t);
    }
    return A59.inst!;
  }
}

class A60 {
  public static inst: A60 | undefined = undefined;
  public tag: string = "";

  private constructor(tag: string) {
    this.tag = tag;
  }

  static fromString(p: string): A60 {
    return new A60(p);
  }

  static getInstance(t: string): A60 {
    if (A60.inst == undefined) {
      A60.inst = A60.fromString(t);
    }
    return A60.inst!;
  }
}

class A61<T extends Object, U> {
  public x: T;
  public y: U;

  constructor(a: T, b: U) {
    this.x = a;
    this.y = b;
  }
}

class A62<T extends Object, U> {
  public x: T;
  public y: U;

  constructor(a: T, b: U) {
    this.x = a;
    this.y = b;
  }
}

export default function ConstructorDeclarationTest():void {
  describe('ConstructorDeclarationTest', () => {
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
     * @tc.number    SUB_CONSTRUCTOR_DECLARATION_TEST_0100
     * @tc.name      testConstructorDeclaration0001
     * @tc.desc      The syntax and semantics of a constructor's formal parameters are identical to
     *               those of a method.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstructorDeclaration0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new A(Color.Blue, Country.fr)
      expect(a.color).assertEqual(Color.Blue)
      expect(a.country).assertEqual(Country.fr)
    });

    /**
     * @tc.number    SUB_CONSTRUCTOR_DECLARATION_TEST_0200
     * @tc.name      testConstructorDeclaration0002
     * @tc.desc      The syntax and semantics of a constructor's formal parameters are identical to
     *               those of a method.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstructorDeclaration0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new A1(Color.Blue, Country.fr) // implicit conversion
      expect(a.color).assertEqual(2)
      expect(a.country).assertEqual('France')
    });

    /**
     * @tc.number    SUB_CONSTRUCTOR_DECLARATION_TEST_0300
     * @tc.name      testConstructorDeclaration0003
     * @tc.desc      The syntax and semantics of a constructor's formal parameters are identical to
     *               those of a method.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstructorDeclaration0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new A2()
      expect(a.p).assertEqual(undefined)
      let aq = a.q
      expect(aq instanceof string ? '' : aq()).assertEqual('Hello!')
      a = new A2(12)
      expect(a.p).assertEqual(12)
      aq = a.q
      expect(aq instanceof string ? '' : aq()).assertEqual('Hello!')
      a = new A2(12, 'Bye!')
      expect(a.p).assertEqual(12)
      aq = a.q
      expect(aq instanceof string ? aq : '').assertEqual('Bye!')
      a = new A2((): int => 42, (): string => 'Hi!')
      let ap = a.p
      expect(ap instanceof int ? 0 : ap!()).assertEqual(42)
      aq = a.q
      expect(aq instanceof string ? '' : aq()).assertEqual('Hi!')
    });

    /**
     * @tc.number    SUB_CONSTRUCTOR_DECLARATION_TEST_0400
     * @tc.name      testConstructorDeclaration0004
     * @tc.desc      The syntax and semantics of a constructor's formal parameters are identical to
     *               those of a method.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstructorDeclaration0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new A3()
      expect(a.fld.length).assertEqual(0)
      a = new A3(1, 2.0, '3', [false])
      expect(a.fld[0]).assertEqual(1)
      expect(a.fld[1]).assertEqual(2.0)
      expect(a.fld[2]).assertEqual('3')
      expect((a.fld[3] as Object[])[0]).assertEqual(false)
    });

    /**
     * @tc.number    SUB_CONSTRUCTOR_DECLARATION_TEST_0500
     * @tc.name      testConstructorDeclaration0005
     * @tc.desc      The syntax and semantics of a constructor's formal parameters are identical to
     *               those of a method.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstructorDeclaration0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new A4()
      expect(a.fld.length).assertEqual(0)
      a = new A4(['abc', 'def'])
      expect(a.fld.length).assertEqual(1)
      expect(a.fld[0][0]).assertEqual('abc')
    });

    /**
     * @tc.number    SUB_CONSTRUCTOR_DECLARATION_TEST_0600
     * @tc.name      testConstructorDeclaration0006
     * @tc.desc      The syntax and semantics of a constructor's formal parameters are identical to
     *               those of a method.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstructorDeclaration0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new A5()
      expect(a.fld.length).assertEqual(0)
      a = new A5(1, 2.0, '3', [false])
      expect(a.fld[0]).assertEqual(1)
      expect(a.fld[1]).assertEqual(2.0)
      expect(a.fld[2]).assertEqual('3')
      expect((a.fld[3] as Array<boolean>)[0]).assertEqual(false)
    });

    /**
     * @tc.number    SUB_CONSTRUCTOR_DECLARATION_TEST_0700
     * @tc.name      testConstructorDeclaration0007
     * @tc.desc      The syntax and semantics of a constructor's formal parameters are identical to
     *               those of a method.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstructorDeclaration0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new A6()
      expect(a.fld.length).assertEqual(0)
      a = new A6(['abc', 'def'])
      expect(a.fld.length).assertEqual(1)
      expect(a.fld[0][0]).assertEqual('abc')
    });

    /**
     * @tc.number    SUB_CONSTRUCTOR_DECLARATION_TEST_0800
     * @tc.name      testConstructorDeclaration0008
     * @tc.desc      The syntax and semantics of a constructor's formal parameters are identical to
     *               those of a method.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstructorDeclaration0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new A7()
      expect(a.fld.length).assertEqual(0)
      a = new A7(1, 2.0, '3', null)
      expect(a.fld[0]).assertEqual(1)
      expect(a.fld[1]).assertEqual(2.0)
      expect(a.fld[2]).assertEqual('3')
      expect(a.fld[3]).assertEqual(null)
    });

    /**
     * @tc.number    SUB_CONSTRUCTOR_DECLARATION_TEST_0900
     * @tc.name      testConstructorDeclaration0009
     * @tc.desc      The syntax and semantics of a constructor's formal parameters are identical to
     *               those of a method.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstructorDeclaration0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new A8()
      expect(a.fld.length).assertEqual(0)
      a = new A8(['abc', 'def'])
      expect(a.fld.length).assertEqual(1)
      expect(a.fld[0][0]).assertEqual('abc')
    });

    /**
     * @tc.number    SUB_CONSTRUCTOR_DECLARATION_TEST_1000
     * @tc.name      testConstructorDeclaration0010
     * @tc.desc      The syntax and semantics of a constructor's formal parameters are identical to
     *               those of a method.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstructorDeclaration0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new A9('abc', (p: boolean): string => 'result = ' + p)
      expect(a.fld[0]).assertEqual('abc')
      expect(a.fld[1](true)).assertEqual('result = true')
    });

    /**
     * @tc.number    SUB_CONSTRUCTOR_DECLARATION_TEST_1100
     * @tc.name      testConstructorDeclaration0011
     * @tc.desc      The syntax and semantics of a constructor's formal parameters are identical to
     *               those of a method.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstructorDeclaration0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new A10('abc', null)
      expect(a.fld[0]).assertEqual('abc')
      expect(a.fld[1]).assertEqual(null)
    });

    /**
     * @tc.number    SUB_CONSTRUCTOR_DECLARATION_TEST_1200
     * @tc.name      testConstructorDeclaration0012
     * @tc.desc      The syntax and semantics of a constructor's formal parameters are identical to
     *               those of a method.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstructorDeclaration0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new A11(...arr)
      expect(a.p[0]).assertEqual(0)
      expect(a.p[1]).assertEqual(1)
      expect(a.p[2]).assertEqual(2)
    });

    /**
     * @tc.number    SUB_CONSTRUCTOR_DECLARATION_TEST_1300
     * @tc.name      testConstructorDeclaration0013
     * @tc.desc      The syntax and semantics of a constructor's formal parameters are identical to
     *               those of a method.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstructorDeclaration0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new A12(arr1)
      expect(a.fld[0]!(42.0)).assertEqual(43.0)
      expect(a.fld[1]).assertEqual(null)
    });

    /**
     * @tc.number    SUB_CONSTRUCTOR_DECLARATION_TEST_1400
     * @tc.name      testConstructorDeclaration0014
     * @tc.desc      The syntax and semantics of a constructor's formal parameters are identical to
     *               those of a method.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstructorDeclaration0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new A13(1, ...arr2)
      expect(a.p[0][0]).assertEqual(Country.us)
      expect(a.p[0][1]).assertEqual(Country.ru)
      expect(a.p[1][0]).assertEqual('br')
      expect(a.p[1][1]).assertEqual(Country.fr)
      expect(a.p[1][2]).assertEqual('de')
    });

    /**
     * @tc.number    SUB_CONSTRUCTOR_DECLARATION_TEST_1500
     * @tc.name      testConstructorDeclaration0015
     * @tc.desc      The syntax and semantics of a constructor's formal parameters are identical to
     *               those of a method.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstructorDeclaration0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new A14('d', ...((): Array<string | number> => ['a', 'b', 'c'])())
      expect(a.q[0]).assertEqual('a')
      expect(a.q[1]).assertEqual('b')
      expect(a.q[2]).assertEqual('c')
      expect(a.q[3]).assertEqual('d')
    });

    /**
     * @tc.number    SUB_CONSTRUCTOR_DECLARATION_TEST_1600
     * @tc.name      testConstructorDeclaration0016
     * @tc.desc      The syntax and semantics of a constructor's formal parameters are identical to
     *               those of a method.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstructorDeclaration0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new A15(...((p: int): FixedArray<int> => [p, p, p])(5))
      expect(a.fld.length).assertEqual(3)
      expect(a.fld[0]).assertEqual(5)
      expect(a.fld[1]).assertEqual(5)
      expect(a.fld[2]).assertEqual(5)
    });

    /**
     * @tc.number    SUB_CONSTRUCTOR_DECLARATION_TEST_1700
     * @tc.name      testConstructorDeclaration0017
     * @tc.desc      The syntax and semantics of a constructor's formal parameters are identical to
     *               those of a method.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstructorDeclaration0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new A16(...arr3)
      expect(a.p[0]).assertEqual(0.0)
      expect(a.p[1]).assertEqual(1.0)
      expect(a.p[2]).assertEqual(2.0)
    });

    /**
     * @tc.number    SUB_CONSTRUCTOR_DECLARATION_TEST_1800
     * @tc.name      testConstructorDeclaration0018
     * @tc.desc      The syntax and semantics of a constructor's formal parameters are identical to
     *               those of a method.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstructorDeclaration0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new A17(...tup)
      expect(a.tup[0]()).assertEqual(true)
      expect(a.tup[1]()).assertEqual('abc')
      expect(a.tup[2]()).assertEqual(42.0)
    });

    /**
     * @tc.number    SUB_CONSTRUCTOR_DECLARATION_TEST_1900
     * @tc.name      testConstructorDeclaration0019
     * @tc.desc      The syntax and semantics of a constructor's formal parameters are identical to
     *               those of a method.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstructorDeclaration0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new A18(12.0, ...([13.0, 14.0] as FixedArray<number>))
      expect(a.fld.length).assertEqual(3)
      expect(a.fld[0]).assertEqual(12.0)
      expect(a.fld[1]).assertEqual(13.0)
      expect(a.fld[2]).assertEqual(14.0)
    });

    /**
     * @tc.number    SUB_CONSTRUCTOR_DECLARATION_TEST_2000
     * @tc.name      testConstructorDeclaration0020
     * @tc.desc      The syntax and semantics of a constructor's formal parameters are identical to
     *               those of a method.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstructorDeclaration0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new A19(tup1)
      expect(a.fld[1]('hello')[0]).assertEqual('hello')
      expect(a.fld).assertEqual(tup1)
    });

    /**
     * @tc.number    SUB_CONSTRUCTOR_DECLARATION_TEST_2100
     * @tc.name      testConstructorDeclaration0021
     * @tc.desc      The syntax and semantics of a constructor's formal parameters are identical to
     *               those of a method.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstructorDeclaration0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new A20(true, (p: boolean) => p ? 'T' : 'F')
      expect(a.p).assertEqual(true)
      expect(a.q!(true)).assertEqual('T')
      a = new A20(undefined)
      expect(a.p).assertEqual(false)
      expect(a.q).assertEqual(undefined)
      a = new A20(undefined, undefined)
      expect(a.p).assertEqual(false)
      expect(a.q).assertEqual(undefined)
      a = new A20(false, undefined)
      expect(a.p).assertEqual(false)
      expect(a.q).assertEqual(undefined)
    });

    /**
     * @tc.number    SUB_CONSTRUCTOR_DECLARATION_TEST_2200
     * @tc.name      testConstructorDeclaration0022
     * @tc.desc      The syntax and semantics of a constructor's formal parameters are identical to
     *               those of a method.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstructorDeclaration0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new A21(['a', 'b', 'c'])
      expect(a.p![0]).assertEqual('a')
      expect(a.p![2]).assertEqual('c')
      a = new A21()
      expect(a.p).assertEqual(undefined)
      a = new A21(undefined)
      expect(a.p).assertEqual(undefined)
    });

    /**
     * @tc.number    SUB_CONSTRUCTOR_DECLARATION_TEST_2300
     * @tc.name      testConstructorDeclaration0023
     * @tc.desc      The syntax and semantics of a constructor's formal parameters are identical to
     *               those of a method.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstructorDeclaration0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new A22(b, b, b) // with implicit widening conversion
      expect(a.fld[0]).assertEqual(1)
      expect(a.fld[1]).assertEqual(1)
      expect(a.fld[2]).assertEqual(1)
      a = new A22()
      expect(a.fld[0]).assertEqual(undefined)
      expect(a.fld[1]).assertEqual(undefined)
      expect(a.fld[2]).assertEqual(undefined)
      a = new A22(b)
      expect(a.fld[0]).assertEqual(1)
      expect(a.fld[1]).assertEqual(undefined)
      expect(a.fld[2]).assertEqual(undefined)
      a = new A22(b, s)
      expect(a.fld[0]).assertEqual(1)
      expect(a.fld[1]).assertEqual(2)
      expect(a.fld[2]).assertEqual(undefined)
      a = new A22(b, s, 42)
      expect(a.fld[0]).assertEqual(1)
      expect(a.fld[1]).assertEqual(2)
      expect(a.fld[2]).assertEqual(42)
      a = new A22(undefined)
      expect(a.fld[0]).assertEqual(undefined)
      expect(a.fld[1]).assertEqual(undefined)
      expect(a.fld[2]).assertEqual(undefined)
    });

    /**
     * @tc.number    SUB_CONSTRUCTOR_DECLARATION_TEST_2400
     * @tc.name      testConstructorDeclaration0024
     * @tc.desc      The syntax and semantics of a constructor's formal parameters are identical to
     *               those of a method.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstructorDeclaration0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      expect(new A23().fld).assertEqual(undefined)
      expect(new A23(undefined).fld).assertEqual(undefined)
      expect(new A23(42.0).fld).assertEqual(42.0)
    });

    /**
     * @tc.number    SUB_CONSTRUCTOR_DECLARATION_TEST_2500
     * @tc.name      testConstructorDeclaration0025
     * @tc.desc      The syntax and semantics of a constructor's formal parameters are identical to
     *               those of a method.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstructorDeclaration0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new A24(
        (p: int) => 'Z' + p,
        (p: number) => 'A' + p
      )
      expect(a.p(42)).assertEqual('Z42')
      expect(a.q(42.0)).assertEqual('A42')
      a = new A24(
        (p: int) => 'Z' + p
      )
      expect(a.p(42)).assertEqual('Z42')
      expect(a.q(42.0)).assertEqual('X42')
    });

    /**
     * @tc.number    SUB_CONSTRUCTOR_DECLARATION_TEST_2600
     * @tc.name      testConstructorDeclaration0026
     * @tc.desc      The syntax and semantics of a constructor's formal parameters are identical to
     *               those of a method.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstructorDeclaration0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new A25()
      expect(a.p).assertEqual('A')
      expect(a.q).assertEqual(1.0)
      expect(a.w).assertEqual(undefined)
      a = new A25('B')
      expect(a.p).assertEqual('B')
      expect(a.q).assertEqual(1.0)
      expect(a.w).assertEqual(undefined)
      a = new A25('B', 2.0)
      expect(a.p).assertEqual('B')
      expect(a.q).assertEqual(2.0)
      expect(a.w).assertEqual(undefined)
      a = new A25('B', 2.0, true)
      expect(a.p).assertEqual('B')
      expect(a.q).assertEqual(2.0)
      expect(a.w).assertEqual(true)
    });

    /**
     * @tc.number    SUB_CONSTRUCTOR_DECLARATION_TEST_2700
     * @tc.name      testConstructorDeclaration0027
     * @tc.desc      The syntax and semantics of a constructor's formal parameters are identical to
     *               those of a method.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstructorDeclaration0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new A26<Color, Country>(Color.Blue, Country.fr)
      expect(a.color).assertEqual(Color.Blue)
      expect(a.country).assertEqual(Country.fr)
    });

    /**
     * @tc.number    SUB_CONSTRUCTOR_DECLARATION_TEST_2800
     * @tc.name      testConstructorDeclaration0028
     * @tc.desc      The syntax and semantics of a constructor's formal parameters are identical to
     *               those of a method.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstructorDeclaration0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new A27<int, string>(Color.Blue, Country.fr) // implicit conversion
      expect(a.color).assertEqual(2)
      expect(a.country).assertEqual('France')
    });

    /**
     * @tc.number    SUB_CONSTRUCTOR_DECLARATION_TEST_2900
     * @tc.name      testConstructorDeclaration0029
     * @tc.desc      The syntax and semantics of a constructor's formal parameters are identical to
     *               those of a method.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstructorDeclaration0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      expect(new A28<Object>().fld.length).assertEqual(0)
      let a = new A28<string>(['abc', 'def'])
      expect(a.fld.length).assertEqual(1)
      expect(a.fld[0][0]).assertEqual('abc')
    });

    /**
     * @tc.number    SUB_CONSTRUCTOR_DECLARATION_TEST_3000
     * @tc.name      testConstructorDeclaration0030
     * @tc.desc      The syntax and semantics of a constructor's formal parameters are identical to
     *               those of a method.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstructorDeclaration0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      expect(new A29<int>().fld.length).assertEqual(0)
      let a = new A29<int>(1, 2.0, '3', [false])
      expect(a.fld[0]).assertEqual(1)
      expect(a.fld[1]).assertEqual(2.0)
      expect(a.fld[2]).assertEqual('3')
      expect((a.fld[3] as Array<boolean>)[0]).assertEqual(false)
    });

    /**
     * @tc.number    SUB_CONSTRUCTOR_DECLARATION_TEST_3100
     * @tc.name      testConstructorDeclaration0031
     * @tc.desc      The syntax and semantics of a constructor's formal parameters are identical to
     *               those of a method.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstructorDeclaration0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      expect(new A30<int>().fld.length).assertEqual(0)
      let a = new A30<string>(['abc', 'def'])
      expect(a.fld.length).assertEqual(1)
      expect(a.fld[0][0]).assertEqual('abc')
    });

    /**
     * @tc.number    SUB_CONSTRUCTOR_DECLARATION_TEST_3200
     * @tc.name      testConstructorDeclaration0032
     * @tc.desc      The syntax and semantics of a constructor's formal parameters are identical to
     *               those of a method.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstructorDeclaration0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      expect(new A31<string>().fld.length).assertEqual(0)
      let a = new A31<Object>(1, 2.0, '3', null)
      expect(a.fld[0]).assertEqual(1)
      expect(a.fld[1]).assertEqual(2.0)
      expect(a.fld[2]).assertEqual('3')
      expect(a.fld[3]).assertEqual(null)
    });

    /**
     * @tc.number    SUB_CONSTRUCTOR_DECLARATION_TEST_3300
     * @tc.name      testConstructorDeclaration0033
     * @tc.desc      The syntax and semantics of a constructor's formal parameters are identical to
     *               those of a method.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstructorDeclaration0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new A32<string>(['abc', 'def'] as FixedArray<string>)
      expect(a.fld.length).assertEqual(1)
      expect(a.fld[0][0]).assertEqual('abc')
    });

    /**
     * @tc.number    SUB_CONSTRUCTOR_DECLARATION_TEST_3400
     * @tc.name      testConstructorDeclaration0034
     * @tc.desc      The syntax and semantics of a constructor's formal parameters are identical to
     *               those of a method.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstructorDeclaration0034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new A33<(p: boolean) => string>('abc', (p: boolean): string => 'result = ' + p)
      expect(a.fld[0]).assertEqual('abc')
      expect(a.fld[1](true)).assertEqual('result = true')
    });

    /**
     * @tc.number    SUB_CONSTRUCTOR_DECLARATION_TEST_3500
     * @tc.name      testConstructorDeclaration0035
     * @tc.desc      The syntax and semantics of a constructor's formal parameters are identical to
     *               those of a method.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstructorDeclaration0035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new A34<string, null, boolean>('abc', null);
      expect(a.fld[0]).assertEqual('abc');
      expect(a.fld[1]).assertEqual(null);
    });

    /**
     * @tc.number    SUB_CONSTRUCTOR_DECLARATION_TEST_3600
     * @tc.name      testConstructorDeclaration0036
     * @tc.desc      The syntax and semantics of a constructor's formal parameters are identical to
     *               those of a method.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstructorDeclaration0036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new A35<int>(...arr4);
      expect(a.p[0]).assertEqual(0);
      expect(a.p[1]).assertEqual(1);
      expect(a.p[2]).assertEqual(2)
    });

    /**
     * @tc.number    SUB_CONSTRUCTOR_DECLARATION_TEST_3700
     * @tc.name      testConstructorDeclaration0037
     * @tc.desc      The syntax and semantics of a constructor's formal parameters are identical to
     *               those of a method.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstructorDeclaration0037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new A36<FixedArray<string | Country>>(1, ...arr5)
      expect(a.p[0][0]).assertEqual(Country.us)
      expect(a.p[0][1]).assertEqual(Country.ru)
      expect(a.p[1][0]).assertEqual('br')
      expect(a.p[1][1]).assertEqual(Country.fr)
      expect(a.p[1][2]).assertEqual('de')
    });

    /**
     * @tc.number    SUB_CONSTRUCTOR_DECLARATION_TEST_3800
     * @tc.name      testConstructorDeclaration0038
     * @tc.desc      The syntax and semantics of a constructor's formal parameters are identical to
     *               those of a method.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstructorDeclaration0038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new A37<string, number>('d', ...((): Array<string | number> => ['a', 'b', 'c'])())
      expect(a.q[0]).assertEqual('a')
      expect(a.q[1]).assertEqual('b')
      expect(a.q[2]).assertEqual('c')
      expect(a.q[3]).assertEqual('d')
    });

    /**
     * @tc.number    SUB_CONSTRUCTOR_DECLARATION_TEST_3900
     * @tc.name      testConstructorDeclaration0039
     * @tc.desc      The syntax and semantics of a constructor's formal parameters are identical to
     *               those of a method.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstructorDeclaration0039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new A38<null | (p: number) => number>(arr6)
      expect(a.fld[0]!(42.0)).assertEqual(43.0)
      expect(a.fld[1]).assertEqual(null)
    });

    /**
     * @tc.number    SUB_CONSTRUCTOR_DECLARATION_TEST_4000
     * @tc.name      testConstructorDeclaration0040
     * @tc.desc      The syntax and semantics of a constructor's formal parameters are identical to
     *               those of a method.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstructorDeclaration0040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new A39<int>(...((p: int): FixedArray<int> => [p, p, p])(5))
      expect(a.fld.length).assertEqual(3)
      expect(a.fld[0]).assertEqual(5)
      expect(a.fld[1]).assertEqual(5)
      expect(a.fld[2]).assertEqual(5)
    });

    /**
     * @tc.number    SUB_CONSTRUCTOR_DECLARATION_TEST_4100
     * @tc.name      testConstructorDeclaration0041
     * @tc.desc      The syntax and semantics of a constructor's formal parameters are identical to
     *               those of a method.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstructorDeclaration0041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new A40<Object>(...arr7)
      expect(a.p[0]).assertEqual(0.0)
      expect(a.p[1]).assertEqual(1.0)
      expect(a.p[2]).assertEqual(2.0)
    });

    /**
     * @tc.number    SUB_CONSTRUCTOR_DECLARATION_TEST_4200
     * @tc.name      testConstructorDeclaration0042
     * @tc.desc      The syntax and semantics of a constructor's formal parameters are identical to
     *               those of a method.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstructorDeclaration0042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new A41<boolean, string, number>(...tup2)
      expect(a.tup2[0]()).assertEqual(true)
      expect(a.tup2[1]()).assertEqual('abc')
      expect(a.tup2[2]()).assertEqual(42.0)
    });

    /**
     * @tc.number    SUB_CONSTRUCTOR_DECLARATION_TEST_4300
     * @tc.name      testConstructorDeclaration0043
     * @tc.desc      The syntax and semantics of a constructor's formal parameters are identical to
     *               those of a method.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstructorDeclaration0043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new A42<string>('a', ...(['b', 'c'] as FixedArray<string>))
      expect(a.fld.length).assertEqual(3)
      expect(a.fld[0]).assertEqual('a')
      expect(a.fld[1]).assertEqual('b')
      expect(a.fld[2]).assertEqual('c')
    });

    /**
     * @tc.number    SUB_CONSTRUCTOR_DECLARATION_TEST_4400
     * @tc.name      testConstructorDeclaration0044
     * @tc.desc      The syntax and semantics of a constructor's formal parameters are identical to
     *               those of a method.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstructorDeclaration0044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new A43<string>(tup3)
      expect(a.fld[1]('hello')[0]).assertEqual('hello')
      expect(a.fld).assertEqual(tup3)
    });

    /**
     * @tc.number    SUB_CONSTRUCTOR_DECLARATION_TEST_4500
     * @tc.name      testConstructorDeclaration0045
     * @tc.desc      The syntax and semantics of a constructor's formal parameters are identical to
     *               those of a method.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstructorDeclaration0045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new A44<boolean>(true, (p: boolean) => p ? 'T' : 'F')
      expect(a.p).assertEqual(true)
      expect(a.q!(true)).assertEqual('T')
      a = new A44<boolean>(undefined)
      expect(a.p).assertEqual(false)
      expect(a.q).assertEqual(undefined)
      a = new A44<boolean>(undefined, undefined)
      expect(a.p).assertEqual(false)
      expect(a.q).assertEqual(undefined)
      a = new A44<boolean>(false, undefined)
      expect(a.p).assertEqual(false)
      expect(a.q).assertEqual(undefined)
    });

    /**
     * @tc.number    SUB_CONSTRUCTOR_DECLARATION_TEST_4600
     * @tc.name      testConstructorDeclaration0046
     * @tc.desc      The syntax and semantics of a constructor's formal parameters are identical to
     *               those of a method.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstructorDeclaration0046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new A45<string>(['a', 'b', 'c'])
      expect(a.p![0]).assertEqual('a')
      expect(a.p![2]).assertEqual('c')
      expect(new A45<number>().p).assertEqual(undefined)
      expect(new A45<undefined>(undefined).p).assertEqual(undefined)
    });

    /**
     * @tc.number    SUB_CONSTRUCTOR_DECLARATION_TEST_4700
     * @tc.name      testConstructorDeclaration0047
     * @tc.desc      The syntax and semantics of a constructor's formal parameters are identical to
     *               those of a method.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstructorDeclaration0047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a1 = new A46<byte, short, int>(b1, b1, b1) // with implicit widening conversion
      expect(a1.fld[0]).assertEqual(1)
      expect(a1.fld[1]).assertEqual(1)
      expect(a1.fld[2]).assertEqual(1)
      let a2 = new A46<undefined>()
      expect(a2.fld[0]).assertEqual(undefined)
      expect(a2.fld[1]).assertEqual(undefined)
      expect(a2.fld[2]).assertEqual(undefined)
      let a3 = new A46<byte>(b1)
      expect(a3.fld[0]).assertEqual(1)
      expect(a3.fld[1]).assertEqual(undefined)
      expect(a3.fld[2]).assertEqual(undefined)
      let a4 = new A46<byte, short>(b1, s1)
      expect(a4.fld[0]).assertEqual(1)
      expect(a4.fld[1]).assertEqual(2)
      expect(a4.fld[2]).assertEqual(undefined)
      let a5 = new A46<byte, short, int>(b1, s1, 42)
      expect(a5.fld[0]).assertEqual(1)
      expect(a5.fld[1]).assertEqual(2)
      expect(a5.fld[2]).assertEqual(42)
      let a6 = new A46<undefined>(undefined)
      expect(a6.fld[0]).assertEqual(undefined)
      expect(a6.fld[1]).assertEqual(undefined)
      expect(a6.fld[2]).assertEqual(undefined)
    });

    /**
     * @tc.number    SUB_CONSTRUCTOR_DECLARATION_TEST_4800
     * @tc.name      testConstructorDeclaration0048
     * @tc.desc      The syntax and semantics of a constructor's formal parameters are identical to
     *               those of a method.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstructorDeclaration0048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      expect(new A47<number | string | Error>().fld).assertEqual(undefined)
      expect(new A47<number | string | Error>(undefined).fld).assertEqual(undefined)
      expect(new A47<number | string | Error>(42.0).fld).assertEqual(42.0)
    });

    /**
     * @tc.number    SUB_CONSTRUCTOR_DECLARATION_TEST_4900
     * @tc.name      testConstructorDeclaration0049
     * @tc.desc      The syntax and semantics of a constructor's formal parameters are identical to
     *               those of a method.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstructorDeclaration0049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a1 = new A48<number>(
        (p: int) => 'Z' + p,
        (p: number) => 'A' + p
      )
      expect(a1.p(42)).assertEqual('Z42')
      expect(a1.q(42.0)).assertEqual('A42')
      let a2 = new A48<string>(
        (p: int) => 'Z' + p
      )
      expect(a2.p(42)).assertEqual('Z42')
      expect(a2.q('YZ')).assertEqual('XYZ')
    });

    /**
     * @tc.number    SUB_CONSTRUCTOR_DECLARATION_TEST_5000
     * @tc.name      testConstructorDeclaration0050
     * @tc.desc      The syntax and semantics of a constructor's formal parameters are identical to
     *               those of a method.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstructorDeclaration0050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      expect(new A49<byte>().fld.length).assertEqual(0)
      let a = new A49<Object>(1, 2.0, '3', [false])
      expect(a.fld[0]).assertEqual(1)
      expect(a.fld[1]).assertEqual(2.0)
      expect(a.fld[2]).assertEqual('3')
      expect((a.fld[3] as Object[])[0]).assertEqual(false)
    });

    /**
     * @tc.number    SUB_CONSTRUCTOR_DECLARATION_TEST_5100
     * @tc.name      testConstructorDeclaration0051
     * @tc.desc      A constructor is used in the creation of an object that is an instance of a
     *               class.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstructorDeclaration0051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v = B.fromInt(42);
      expect(v.p1).assertEqual(42);
      expect(v.q1).assertEqual(undefined);
      expect(v.w1).assertEqual(undefined);
      let x = B.fromString("hello");
      expect(x.p1).assertEqual("hello");
      expect(x.q1).assertEqual(undefined);
      expect(x.w1).assertEqual(undefined);
      let y = B.fromArray(33, 3.14, [1.0, 2.0, 3.0]);
      expect(y.p1).assertEqual(33);
      expect(y.q1).assertEqual(3.14);
      let arr = y.w1 as number[];
      expect(arr[0]).assertEqual(1.0);
      expect(arr[1]).assertEqual(2.0);
      expect(arr[2]).assertEqual(3.0);
    });

    /**
     * @tc.number    SUB_CONSTRUCTOR_DECLARATION_TEST_5200
     * @tc.name      testConstructorDeclaration0052
     * @tc.desc      A constructor is used in the creation of an object that is an instance of a
     *               class.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstructorDeclaration0052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v = new B1()
      expect(v.p1).assertEqual(false)
      expect(v.q1).assertEqual(undefined)
      expect(v.w1).assertEqual(undefined)
      v = new B1("hello")
      expect(v.p1).assertEqual("hello")
      expect(v.q1).assertEqual(undefined)
      expect(v.w1).assertEqual(undefined)
      v = new B1(true)
      expect(v.p1).assertEqual(true)
      expect(v.q1).assertEqual(undefined)
      expect(v.w1).assertEqual(undefined)
      v = new B1(42)
      expect(v.p1).assertEqual(42)
      expect(v.q1).assertEqual(undefined)
      expect(v.w1).assertEqual(undefined)
      v = new B1(true, [1.0, 2.0, 3.0])
      expect(v.p1).assertEqual(true)
      let arr = v.q1 as number[]
      expect(arr[0]).assertEqual(1.0)
      expect(arr[1]).assertEqual(2.0)
      expect(arr[2]).assertEqual(3.0)
      v = new B1("hello", 3.14, [1.0, 2.0, 3.0])
      expect(v.p1).assertEqual("hello")
      expect(v.q1).assertEqual(3.14)
      arr = v.w1 as number[]
      expect(arr.at(0)).assertEqual(1.0);
      expect(arr.at(1)).assertEqual(2.0);
      expect(arr.at(2)).assertEqual(3.0);
    });

    /**
     * @tc.number    SUB_CONSTRUCTOR_DECLARATION_TEST_5300
     * @tc.name      testConstructorDeclaration0053
     * @tc.desc      A constructor is used in the creation of an object that is an instance of a
     *               class. Private constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstructorDeclaration0053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      expect(A52.create().x).assertEqual(5)
    });

    /**
     * @tc.number    SUB_CONSTRUCTOR_DECLARATION_TEST_5400
     * @tc.name      testConstructorDeclaration0054
     * @tc.desc      A constructor is used in the creation of an object that is an instance of a
     *               class. Private constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstructorDeclaration0054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      expect(A53.create().x).assertEqual(5)
    });

    /**
     * @tc.number    SUB_CONSTRUCTOR_DECLARATION_TEST_5500
     * @tc.name      testConstructorDeclaration0055
     * @tc.desc      Class constructor declaration
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstructorDeclaration0055", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b = new B2(42)
      expect(b.fld).assertEqual(42)
    });

    /**
     * @tc.number    SUB_CONSTRUCTOR_DECLARATION_TEST_5600
     * @tc.name      testConstructorDeclaration0056
     * @tc.desc      Class constructor declaration
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstructorDeclaration0056", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b = new B3(42)
      expect(b.fld).assertEqual(42)
    });

    /**
     * @tc.number    SUB_CONSTRUCTOR_DECLARATION_TEST_5700
     * @tc.name      testConstructorDeclaration0057
     * @tc.desc      A constructor is used in the creation of an object that is an instance of a
     *               class. Private constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstructorDeclaration0057", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = A56.getInstance("Hello!")
      expect(a instanceof A56).assertTrue()
      expect(a.tag).assertEqual("Hello!")
      let b = A56.getInstance("Bye!")
      expect(b).assertEqual(a)
      expect(b.tag).assertEqual("Hello!")
    });

    /**
     * @tc.number    SUB_CONSTRUCTOR_DECLARATION_TEST_5800
     * @tc.name      testConstructorDeclaration0058
     * @tc.desc      A constructor is used in the creation of an object that is an instance of a
     *               class. Protected constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstructorDeclaration0058", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = A57.getInstance("Hello!")
      expect(a instanceof A57).assertTrue()
      expect(a.tag).assertEqual("Hello!")
      let b = A57.getInstance("Bye!")
      expect(b).assertEqual(a)
      expect(b.tag).assertEqual("Hello!")
    });

    /**
     * @tc.number    SUB_CONSTRUCTOR_DECLARATION_TEST_5900
     * @tc.name      testConstructorDeclaration0059
     * @tc.desc      A constructor is used in the creation of an object that is an instance of a
     *               class. Private constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstructorDeclaration0059", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = A58.getInstance()
      expect(a instanceof A58).assertTrue()
      let b = A58.getInstance()
      expect(b).assertEqual(a)
    });

    /**
     * @tc.number    SUB_CONSTRUCTOR_DECLARATION_TEST_6000
     * @tc.name      testConstructorDeclaration0060
     * @tc.desc      A constructor is used in the creation of an object that is an instance of a
     *               class. Private constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstructorDeclaration0060", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = A59.getInstance("Hello!")
      expect(a instanceof A59).assertTrue()
      expect(a.tag).assertEqual("Hello!")
      let b = A59.getInstance("Bye!")
      expect(b).assertEqual(a)
      expect(b.tag).assertEqual("Hello!")
    });

    /**
     * @tc.number    SUB_CONSTRUCTOR_DECLARATION_TEST_6100
     * @tc.name      testConstructorDeclaration0061
     * @tc.desc      A constructor is used in the creation of an object that is an instance of a
     *               class. Protected constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstructorDeclaration0061", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = A60.getInstance("Hello!")
      expect(a instanceof A60).assertTrue()
      expect(a.tag).assertEqual("Hello!")
      let b = A60.getInstance("Bye!")
      expect(b).assertEqual(a)
      expect(b.tag).assertEqual("Hello!")
    });

    /**
     * @tc.number    SUB_CONSTRUCTOR_DECLARATION_TEST_6200
     * @tc.name      testConstructorDeclaration0062
     * @tc.desc      Class constructor declaration
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstructorDeclaration0062", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new A61<string, boolean>("hello", true)
      expect(a.x).assertEqual("hello")
      expect(a.y).assertEqual(true)
    });

    /**
     * @tc.number    SUB_CONSTRUCTOR_DECLARATION_TEST_6300
     * @tc.name      testConstructorDeclaration0063
     * @tc.desc      Class constructor declaration
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstructorDeclaration0063", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new A62<string, boolean>("hello", true);
      expect(a.x).assertEqual("hello");
      expect(a.y).assertEqual(true);
    });
  })
}
