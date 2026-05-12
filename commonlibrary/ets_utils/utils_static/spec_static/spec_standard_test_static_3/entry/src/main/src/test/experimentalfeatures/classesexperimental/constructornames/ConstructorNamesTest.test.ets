/**
 * ArkTS 1.2 语法兼容性修改说明：
 *
 * 本文件原始用例基于“命名构造函数（named constructor）/ 显式构造器调用”语法编写，
 * 例如：
 *   new A.fromString('abc')
 *   new A.noArgs()
 *   new A24.all_optional(...)
 *
 * 但在当前 ArkTS 1.2 / DevEco Studio 编译环境中，上述写法不会被识别为合法构造函数调用。
 * 编译器会将 fromString、noArgs、all_optional 等解析为普通成员名，而非命名构造函数或静态工厂方法，
 * 从而引发 “type does not exist”、“No matching call signature” 等编译错误。
 *
 * 因此本文件当前不适合直接参与主工程编译，先整体注释保留。
 * 后续如需恢复，需要将相关写法改造成当前 ArkTS 支持的形式，例如：
 *   1. 使用标准 constructor；
 *   2. 或改为 static fromXxx()/createXxx() 工厂方法。
 */
/*
* Copyright (c) 2021-2026 Huawei Device Co., Ltd.
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
*//*


import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it,
  Level, Size, TestType } from '../../../../hypium/index';

async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}

class A {
  fld: string
  constructor noArgs() {
  this.fromString('hello')
}
  constructor fromString(p: string) {
  this.fld = p
}
}

class A1 {
  fld: string
  constructor() {
    this.fromNumber(42.0)
  }
  constructor fromNumber(p: number) {
  this.fromString('' + p)
}
  constructor fromString(p: string) {
  this.fld = p
}
}

abstract class A2 {
  fld: string
  constructor(p: number) {
    this.fld = '' + p
  }
  constructor fromBoolean(p: boolean) {
  this(p ? 1.0 : 0.0)
}
}
class B extends A2 {
  constructor fromInt(p: int) {
  this.fromNumber(p + 1.0)
}
  constructor fromNumber(p?: number) {
  if (p == undefined) {
    super.fromBoolean(false)
  } else {
    super(p)
  }
}
}

abstract class A3 {
  fld: string
  constructor fromString(p: string) {
  this.fld = p
}
  constructor fromNumber(p: number) {
  this.fromString('' + p)
}
}
abstract class B1 extends A3 {
  constructor fromOptionalUnion(p?: string|number) {
  if (p == undefined) {
    super.fromString('')
    return
  } else if (p instanceof number) {
    super.fromNumber(++p)
    return
  }
  super.fromString(p)
}
}
class C extends B1 {
  constructor(p: Any) {
    if (p instanceof string) {
      super.fromOptionalUnion(p)
    } else if (p instanceof number) {
      super.fromOptionalUnion(p)
    } else {
      super.fromOptionalUnion()
    }
  }
}

class A4 {
  p: string|undefined
  constructor fromOptionalString(p?: string) {
  this.p = p
}
}
class B2 extends A4 {
  s: string[]
  constructor fromRest(...s: string[]) {
  super.fromOptionalString()
  this.s = s
}
}

class A5 {
  p: string|undefined
  constructor fromOptionalString(p?: string) {
  this.p = p
}
}
class B3 extends A5 {
  s: string[]
  constructor fromRest(...s: string[]) {
  super.fromOptionalString(undefined)
  this.s = s
}
}

class A6 {
  p: string|undefined
  constructor fromOptionalString(p?: string) {
  this.p = p
}
}
class B4 extends A6 {
  s: string[]
  constructor fromRest(...s: string[]) {
  super.fromOptionalString('super')
  this.s = s
}
}

class A7 {
  s: string[]
  constructor fromRest(...s: string[]) {
  this.s = s
}
}
class B5 extends A7 {
  constructor fromTwoStrings(p1: string, p2: string) {
  super.fromRest(p1, p2)
}
}

class A8 {
  s: string[]
  constructor fromRest(...s: string[]) {
  this.s = s
}
}
class B6 extends A8 {
  constructor fromOptionalStrings(p1: string, p2?: string) {
  super.fromRest(p1, p2 ?? 'b')
}
}

class A9 {
  s: string[]
  constructor fromRest(...s: string[]) {
  this.s = s
}
}
class B7 extends A9 {
  constructor fromOptionalStrings(p1?: string, p2: string = 'b') {
  super.fromRest(p1 ?? 'x', p2)
}
}

class A10 {
  s: string[]
  constructor fromRest(...s: string[]) {
  this.s = s
}
}
class B8 extends A10 {
  constructor fromTwoStrings(p1: string, p2: string) {
  super.fromRest(...[p1, p2])
}
}

class A11 {
  s: string[]
  constructor fromRest(...s: string[]) {
  this.s = s
}
}
class B9 extends A11 {
  constructor fromRest(...p: string[]) {
  super.fromRest(...p)
}
}

class A12 {
  p1: string[]
  p2: string[]
  constructor fromOptionalStringArrays(p1: string[] = [], p2: string[] = []) {
  this.p1 = p1
  this.p2 = p2
}
}
class B10 extends A12 {
  constructor fromRest(...p: string[]) {
  super.fromOptionalStringArrays(p)
}
}

class A13 {
  p1: string[]
  p2: string[]
  constructor fromOptionalStringArrays(p1: string[] = [], p2: string[] = []) {
  this.p1 = p1
  this.p2 = p2
}
}
class B11 extends A13 {
  constructor fromRest(...p: string[]) {
  super.fromOptionalStringArrays(p, undefined)
}
}

class A14 {
  p1: string[]
  p2: string[]
  constructor fromOptionalStringArrays(p1: string[] = [], p2: string[] = []) {
  this.p1 = p1
  this.p2 = p2
}
}
class B12 extends A14 {
  constructor fromRest(...p: string[]) {
  super.fromOptionalStringArrays(undefined, p)
}
}

class A15 {
  k1: string
  k2: string
  k3: string
  lambda1: (() => void)|undefined
  lambda2: (() => void)|undefined
  constructor main(k1: string, k2: string, k3: string, lambda1?: () => void, lambda2?: () => void) {
  this.k1 = k1
  this.k2 = k2
  this.k3 = k3
  this.lambda1 = lambda1
  this.lambda2 = lambda2
}
}

class A16 {
  k1: string
  k2: string
  k3: string
  lambda1: (() => void)|undefined
  lambda2: (() => void)|undefined
  constructor fromString(k1: string, k2: string, k3: string, lambda1?: () => void, lambda2?: () => void) {
  this.k1 = k1
  this.k2 = k2
  this.k3 = k3
  this.lambda1 = lambda1
  this.lambda2 = lambda2
}
  constructor fromInt(k1: int, k2: int, k3: int, lambda1?: () => void, lambda2?: () => void) {
  this.fromString('' + k1, '' + k2, '' + k3, lambda1, lambda2)
}
}

class A17 {
  k1: string
  k2: string
  k3: string
  lambda1: (() => void)|undefined
  lambda2: (() => void)|undefined
  constructor fromString(k1: string, k2: string, k3: string, lambda1?: () => void, lambda2?: () => void) {
  this.k1 = k1
  this.k2 = k2
  this.k3 = k3
  this.lambda1 = lambda1
  this.lambda2 = lambda2
}
}
class B13 extends A17 {
  k0: string
  constructor fromString(k0: string, k1: string, k2: string, k3: string, lambda1?: () => void, lambda2?: () => void) {
  super.fromString(k1, k2, k3, lambda1, lambda2)
  this.k0 = k0
}
}

class A18 {
  k1: string
  k2: string
  k3: string
  lambda1: () => void
  lambda2: (() => void)|undefined
  lambda3: (() => void)|undefined
  constructor main(k1: string, k2: string, k3: string, lambda1: () => void, lambda2?: () => void, lambda3?: () => void) {
  this.k1 = k1
  this.k2 = k2
  this.k3 = k3
  this.lambda1 = lambda1
  this.lambda2 = lambda2
  this.lambda3 = lambda3
}
}

class A19 {
  k1: string
  k2: string
  k3: string
  lambda1: () => void
  lambda2: (() => void)|undefined
  lambda3: (() => void)|undefined
  constructor cons1(k1: string, k2: string, k3: string, lambda1: () => void, lambda2?: () => void, lambda3?: () => void) {
  this.k1 = k1
  this.k2 = k2
  this.k3 = k3
  this.lambda1 = lambda1
  this.lambda2 = lambda2
  this.lambda3 = lambda3
}
  constructor cons2(k1: (p: string) => string, k2: (p: int) => string, k3: (p: boolean) => string, lambda1: () => void) {
  this.cons1(k1('1'), k2(2), k3(true), lambda1, undefined)
}
}

class A20 {
  k1: string
  k2: string
  k3: string
  lambda1: () => void
  lambda2: (() => void)|undefined
  lambda3: (() => void)|undefined
  constructor fromStrings(k1: string, k2: string, k3: string, lambda1: () => void, lambda2?: () => void, lambda3?: () => void) {
  this.k1 = k1
  this.k2 = k2
  this.k3 = k3
  this.lambda1 = lambda1
  this.lambda2 = lambda2
  this.lambda3 = lambda3
}
}
class B14 extends A20 {
  lambda0: (p: string) => string
  constructor fromLambdas(lambda0: (p: string) => string, k1: string, k2: string, k3: string, lambda1: () => void, lambda2?: () => void, lambda3?: () => void) {
  super.fromStrings(k1, k2, k3, lambda1, lambda2, lambda3)
  this.lambda0 = lambda0
}
}

enum Color { Red, Green, Blue }
class A21 {
  p1: () => number
  p2: string
  p3: (p1: int) => [int, boolean, string]
  p4: FixedArray<byte>
  p5: [string, string]
  p6: (p1: string) => string[]
  p7: undefined|(double[])
  p8: undefined|(() => void)
  p9: Record<string, int>
  p10: Color
  constructor main(
  p1: () => number,
  p2: string,
  p3: (p1: int) => [int, boolean, string],
  p4: FixedArray<byte>,
  p5: [string, string],
  p6: (p1: string) => string[],
  p7?: double[],
  p8?: () => void,
  p9: Record<string, int> = { '1': 10 },
  p10: Color = Color.Blue
) {
  this.p1 = p1
  this.p2 = p2
  this.p3 = p3
  this.p4 = p4
  this.p5 = p5
  this.p6 = p6
  this.p7 = p7
  this.p8 = p8
  this.p9 = p9
  this.p10 = p10
}
}

enum Color { Red, Green, Blue }
class A22 {
  p1: () => number
  p2: string
  p3: (p1: int) => [int, boolean, string]
  p4: FixedArray<byte>
  p5: [string, string]
  p6: (p1: string) => string[]
  p7: undefined|(double[])
  p8: undefined|(() => void)
  p9: Record<string, int>
  p10: Color

  constructor c1(
  p1: () => number,
  p2: string,
  p3: (p1: int) => [int, boolean, string],
  p4: FixedArray<byte>,
  p5: [string, string],
  p6: (p1: string) => string[],
  p7?: double[],
  p8?: () => void,
  p9: Record<string, int> = { '1': 10 },
  p10: Color = Color.Blue
) {
  this.p1 = p1
  this.p2 = p2
  this.p3 = p3
  this.p4 = p4
  this.p5 = p5
  this.p6 = p6
  this.p7 = p7
  this.p8 = p8
  this.p9 = p9
  this.p10 = p10
}

  constructor c2(
  p1: (p1: int) => [int, boolean, string],
  p2: FixedArray<byte>,
  p3: [string, string],
  p4: (p1: string) => string[],
  p5?: double[],
  p6?: () => void,
  p7?: () => number,
  p8?: string,
) {
  this.c1(
    p7 ?? () => 43.0,
    p8 ?? 'abcdef',
    p1,
    p2,
    p3,
    p4,
    p5,
    p6,
    { '2': 20 }
  )
}
}

enum Color { Red, Green, Blue }
class A23 {
  p1: () => number
  p2: string
  p3: (p1: int) => [int, boolean, string]
  p4: FixedArray<byte>
  p5: [string, string]
  p6: (p1: string) => string[]
  p7: undefined|(double[])
  p8: undefined|(() => void)
  p9: Record<string, int>
  p10: Color

  constructor main_A23(
  p1: () => number,
  p2: string,
  p3: (p1: int) => [int, boolean, string],
  p4: FixedArray<byte>,
  p5: [string, string],
  p6: (p1: string) => string[],
  p7?: double[],
  p8?: () => void,
  p9: Record<string, int> = { '1': 10 },
  p10: Color = Color.Blue
) {
  this.p1 = p1
  this.p2 = p2
  this.p3 = p3
  this.p4 = p4
  this.p5 = p5
  this.p6 = p6
  this.p7 = p7
  this.p8 = p8
  this.p9 = p9
  this.p10 = p10
}
}
class B15 extends A23 {
  constructor main_B(
  p1: () => number,
  p2: string,
  p3: (p1: int) => [int, boolean, string],
  p4: FixedArray<byte>,
  p5: [string, string],
  p6: (p1: string) => string[],
  p7?: double[],
  p8?: () => void,
  p9: Record<string, int> = { '1': 10 }
) {
  super.main_A23(p1, p2, p3, p4, p5, p6, p7, p8, p9)
}
}

class A24 {
  p1: Array<() => string>|undefined
  p2: FixedArray<() => number>
  p3: [string, number]|undefined
  p4: Record<string, number>
  p5: string[]|undefined

  constructor all_optional(
  p1?: Array<() => string>,
  p2: FixedArray<() => number> = [],
  p3?: [string, number],
  p4: Record<string, number> = { '': 0 },
  p5?: string[]
) {
  this.p1 = p1
  this.p2 = p2
  this.p3 = p3
  this.p4 = p4
  this.p5 = p5
}
}

class A25 {
  p1: Array<() => string>|undefined
  p2: FixedArray<() => number>
  p3: [string, number]|undefined
  p4: Record<string, number>
  p5: string[]|undefined

  constructor main(
  p1?: Array<() => string>,
  p2: FixedArray<() => number> = [],
  p3?: [string, number],
  p4: Record<string, number> = { '': 0 },
  p5?: string[]
) {
  this.p1 = p1
  this.p2 = p2
  this.p3 = p3
  this.p4 = p4
  this.p5 = p5
}

  constructor rest(...p5: string[]) {
  this.main(undefined, undefined, undefined, undefined, p5)
}
}

class A26 {
  p1: Array<() => string>|undefined
  p2: FixedArray<() => number>
  p3: [string, number]|undefined
  p4: Record<string, number>
  p5: string[]|undefined

  constructor opts(
  p1?: Array<() => string>,
  p2: FixedArray<() => number> = [],
  p3?: [string, number],
  p4: Record<string, number> = { '': 0 },
  p5?: string[]
) {
  this.p1 = p1
  this.p2 = p2
  this.p3 = p3
  this.p4 = p4
  this.p5 = p5
}
}

class B16 extends A26 {
  constructor rest(...p5: string[]) {
  super.opts(undefined, undefined, undefined, undefined, p5)
}
}

class A27 {
  s: string[]
  constructor in_A27(...s: string[]) {
  this.s = s
}
}
class B17 extends A27 {
  constructor in_B(p1: string, ...p2: string[]) {
  super.in_A27(p1 + p1, ...p2)
}
}


export default function FinalMethodsTest() {
  describe('FinalMethodsTest', () => {
    beforeAll(() => {})

    beforeEach(async () => {
      await sleep(30);
    })

    afterEach(() => {})

    afterAll(() => {})

    */
/**
     * @tc.number    SUB_CONSTRUCTOR_NAMES_XTSTEST_0100
     * @tc.name      testConstructorNames0001
     * @tc.desc      'There are two kinds of explicit constructor calls: - Superclass constructor
                     calls (used to call a constructor from the direct superclass) that begin with the
                     keyword super. - Other constructor calls that begin with the keyword this (used
                     to call another same-class constructor).'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     *//*

    it("testConstructorNames0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      expect(new A.fromString('abc').fld).assertEqual('abc');
      expect(new A.noArgs().fld).assertEqual( 'hello');
    });

    */
/**
     * @tc.number    SUB_CONSTRUCTOR_NAMES_XTSTEST_0200
     * @tc.name      testConstructorNames0002
     * @tc.desc      'There are two kinds of explicit constructor calls: - Superclass constructor
                     calls (used to call a constructor from the direct superclass) that begin with the
                     keyword super. - Other constructor calls that begin with the keyword this (used
                     to call another same-class constructor).'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     *//*

    it("testConstructorNames0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      expect(new A1.fromString('abc').fld).assertEqual( 'abc');
      expect(new A().fld).assertEqual( '42');
      expect(new A1.fromNumber(3.14).fld).assertEqual( '3.14');
    });

    */
/**
     * @tc.number    SUB_CONSTRUCTOR_NAMES_XTSTEST_0300
     * @tc.name      testConstructorNames0003
     * @tc.desc      'There are two kinds of explicit constructor calls: - Superclass constructor
                     calls (used to call a constructor from the direct superclass) that begin with the
                     keyword super. - Other constructor calls that begin with the keyword this (used
                     to call another same-class constructor).'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     *//*

    it("testConstructorNames0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      expect(new B.fromNumber().fld).assertEqual( '0');
      expect(new B.fromNumber(42.0).fld).assertEqual( '42');
      expect(new B.fromInt(12345).fld).assertEqual('12346');
    });

    */
/**
     * @tc.number    SUB_CONSTRUCTOR_NAMES_XTSTEST_0400
     * @tc.name      testConstructorNames0004
     * @tc.desc      'There are two kinds of explicit constructor calls: - Superclass constructor
                     calls (used to call a constructor from the direct superclass) that begin with the
                     keyword super. - Other constructor calls that begin with the keyword this (used
                     to call another same-class constructor).'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     *//*

    it("testConstructorNames0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      expect(new C(null).fld).assertEqual(  '');
      expect(new C(undefined).fld).assertEqual(  '');
      expect(new C(true).fld).assertEqual( '');
      expect(new C('abc').fld).assertEqual( 'abc');
      expect(new C(42.0).fld).assertEqual( '43');
    });

    */
/**
     * @tc.number    SUB_CONSTRUCTOR_NAMES_XTSTEST_0500
     * @tc.name      testConstructorNames0005
     * @tc.desc      'There are two kinds of explicit constructor calls: - Superclass constructor
                     calls (used to call a constructor from the direct superclass) that begin with the
                     keyword super. - Other constructor calls that begin with the keyword this (used
                     to call another same-class constructor).'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     *//*

    it("testConstructorNames0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let b = new B2.fromRest()
      expect(b.p).assertEqual( undefined);
      expect(b.s.length).assertEqual(0);

      b = new B2.fromRest('a')
      expect((b.p).assertEqual( undefined);
      expect(b.s.length).assertEqual(1);
      expect(b.s[0]).assertEqual('a');

      b = new B2.fromRest('a', 'b', 'c')
      expect((b.p).assertEqual(undefined);
      expect(b.s.length).assertEqual( 3);
      expect(b.s[0]).assertEqual('a');
      expect(b.s[1]).assertEqual('b');
      expect(b.s[2]).assertEqual('c');
    });

    */
/**
     * @tc.number    SUB_CONSTRUCTOR_NAMES_XTSTEST_0600
     * @tc.name      testConstructorNames0006
     * @tc.desc      'There are two kinds of explicit constructor calls: - Superclass constructor
                     calls (used to call a constructor from the direct superclass) that begin with the
                     keyword super. - Other constructor calls that begin with the keyword this (used
                     to call another same-class constructor).'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     *//*

    it("testConstructorNames0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let b = new B3.fromRest()
      expect(b.p).assertEqual( undefined);
      expect(b.s.length).assertEqual(0);

      b = new B3.fromRest('a')
      expect((b.p).assertEqual( undefined);
      expect(b.s.length).assertEqual(1);
      expect(b.s[0]).assertEqual('a');

      b = new B3.fromRest('a', 'b', 'c')
      expect((b.p).assertEqual(undefined);
      expect(b.s.length).assertEqual( 3);
      expect(b.s[0]).assertEqual('a');
      expect(b.s[1]).assertEqual('b');
      expect(b.s[2]).assertEqual('c');
    });

    */
/**
     * @tc.number    SUB_CONSTRUCTOR_NAMES_XTSTEST_0700
     * @tc.name      testConstructorNames0007
     * @tc.desc      'There are two kinds of explicit constructor calls: - Superclass constructor
                     calls (used to call a constructor from the direct superclass) that begin with the
                     keyword super. - Other constructor calls that begin with the keyword this (used
                     to call another same-class constructor).'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     *//*

    it("testConstructorNames0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let b = new B4.fromRest()
      expect(b.p).assertEqual( 'super');
      expect(b.s.length).assertEqual(0);

      b = new B4.fromRest('a')
      expect((b.p).assertEqual( 'super');
      expect(b.s.length).assertEqual(1);
      expect(b.s[0]).assertEqual('a');

      b = new B4.fromRest('a', 'b', 'c')
      expect((b.p).assertEqual( 'super');
      expect(b.s.length).assertEqual( 3);
      expect(b.s[0]).assertEqual('a');
      expect(b.s[1]).assertEqual('b');
      expect(b.s[2]).assertEqual('c');
    });

    */
/**
     * @tc.number    SUB_CONSTRUCTOR_NAMES_XTSTEST_0800
     * @tc.name      testConstructorNames0008
     * @tc.desc      'There are two kinds of explicit constructor calls: - Superclass constructor
                     calls (used to call a constructor from the direct superclass) that begin with the
                     keyword super. - Other constructor calls that begin with the keyword this (used
                     to call another same-class constructor).'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     *//*

    it("testConstructorNames0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let b = new B5.fromTwoStrings('a', 'b')
      expect(b.s.length).assertEqual(2);
      expect(b.s[0]).assertEqual('a');
      expect(b.s[1]).assertEqual('b');
    });

    */
/**
     * @tc.number    SUB_CONSTRUCTOR_NAMES_XTSTEST_0900
     * @tc.name      testConstructorNames0009
     * @tc.desc      'There are two kinds of explicit constructor calls: - Superclass constructor
                     calls (used to call a constructor from the direct superclass) that begin with the
                     keyword super. - Other constructor calls that begin with the keyword this (used
                     to call another same-class constructor).'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     *//*

    it("testConstructorNames0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let b = new B6.fromOptionalStrings('a')
      expect(b.s.length).assertEqual(2);
      expect(b.s[0]).assertEqual('a');
      expect(b.s[1]).assertEqual('b');

      b = new B6.fromOptionalStrings('a', undefined)
      expect(b.s.length).assertEqual(2);
      expect(b.s[0]).assertEqual('a');
      expect(b.s[1]).assertEqual('b');

      b = new B6.fromOptionalStrings('a', 'c')
      expect(b.s.length).assertEqual(2);
      expect(b.s[0]).assertEqual('a');
      expect(b.s[1]).assertEqual( 'c');
    });

    */
/**
     * @tc.number    SUB_CONSTRUCTOR_NAMES_XTSTEST_1000
     * @tc.name      testConstructorNames0010
     * @tc.desc      'There are two kinds of explicit constructor calls: - Superclass constructor
                     calls (used to call a constructor from the direct superclass) that begin with the
                     keyword super. - Other constructor calls that begin with the keyword this (used
                     to call another same-class constructor).'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     *//*

    it("testConstructorNames0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let b = new B7.fromOptionalStrings()
      expect(b.s.length).assertEqual(2);
      expect(b.s[0]).assertEqual( 'x');
      expect(b.s[1]).assertEqual('b');

      b = new B7.fromOptionalStrings('y')
      expect(b.s.length).assertEqual(2);
      expect(b.s[0]).assertEqual('y');
      expect(b.s[1]).assertEqual('b');

      b = new B7.fromOptionalStrings('y', 'z')
      expect(b.s.length).assertEqual(2);
      expect(b.s[0]).assertEqual('y');
      expect(b.s[1]).assertEqual('z');
    });

    */
/**
     * @tc.number    SUB_CONSTRUCTOR_NAMES_XTSTEST_1100
     * @tc.name      testConstructorNames0011
     * @tc.desc      'There are two kinds of explicit constructor calls: - Superclass constructor
                     calls (used to call a constructor from the direct superclass) that begin with the
                     keyword super. - Other constructor calls that begin with the keyword this (used
                     to call another same-class constructor).'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     *//*

    it("testConstructorNames0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let b = new B8.fromTwoStrings('a', 'b')
      expect(b.s.length).assertEqual(2);
      expect(b.s[0]).assertEqual('a');
      expect(b.s[1]).assertEqual('b');
    });

    */
/**
     * @tc.number    SUB_CONSTRUCTOR_NAMES_XTSTEST_1200
     * @tc.name      testConstructorNames0012
     * @tc.desc      'There are two kinds of explicit constructor calls: - Superclass constructor
                     calls (used to call a constructor from the direct superclass) that begin with the
                     keyword super. - Other constructor calls that begin with the keyword this (used
                     to call another same-class constructor).'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     *//*

    it("testConstructorNames0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let b = new B9.fromRest()
      expect(b.s.length).assertEqual(0);

      b = new B9.fromRest('a', 'b', 'c')
      expect(b.s[0]).assertEqual('a');
      expect(b.s[1]).assertEqual('b');
      expect(b.s[2]).assertEqual('c');
    });

    */
/**
     * @tc.number    SUB_CONSTRUCTOR_NAMES_XTSTEST_1300
     * @tc.name      testConstructorNames0013
     * @tc.desc      'There are two kinds of explicit constructor calls: - Superclass constructor
                     calls (used to call a constructor from the direct superclass) that begin with the
                     keyword super. - Other constructor calls that begin with the keyword this (used
                     to call another same-class constructor).'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     *//*

    it("testConstructorNames0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let b = new B10.fromRest('a', 'b', 'c')
      expect(b.p1.length).assertEqual(3);
      expect(b.p2.length).assertEqual(0);

      b = new B10.fromRest()
      expect(b.p1.length).assertEqual(0);
      expect(b.p2.length).assertEqual(0);
    });

    */
/**
     * @tc.number    SUB_CONSTRUCTOR_NAMES_XTSTEST_1400
     * @tc.name      testConstructorNames0014
     * @tc.desc      'There are two kinds of explicit constructor calls: - Superclass constructor
                     calls (used to call a constructor from the direct superclass) that begin with the
                     keyword super. - Other constructor calls that begin with the keyword this (used
                     to call another same-class constructor).'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     *//*

    it("testConstructorNames0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let b = new B11.fromRest('a', 'b', 'c')
      expect(b.p1.length).assertEqual(3);
      expect(b.p2.length).assertEqual(0);

      b = new B11.fromRest()
      expect(b.p1.length).assertEqual(0);
      expect(b.p2.length).assertEqual(0);
    });

    */
/**
     * @tc.number    SUB_CONSTRUCTOR_NAMES_XTSTEST_1500
     * @tc.name      testConstructorNames0015
     * @tc.desc      'There are two kinds of explicit constructor calls: - Superclass constructor
                     calls (used to call a constructor from the direct superclass) that begin with the
                     keyword super. - Other constructor calls that begin with the keyword this (used
                     to call another same-class constructor).'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     *//*

    it("testConstructorNames0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let b = new B12.fromRest('a', 'b', 'c')
      expect(b.p1.length).assertEqual(0);
      expect(b.p2.length).assertEqual(3);

      b = new B12.fromRest()
      expect(b.p1.length).assertEqual(0);
      expect(b.p2.length).assertEqual(0);
    });

    */
/**
     * @tc.number    SUB_CONSTRUCTOR_NAMES_XTSTEST_1600
     * @tc.name      testConstructorNames0016
     * @tc.desc      'There are two kinds of explicit constructor calls: - Superclass constructor
                     calls (used to call a constructor from the direct superclass) that begin with the
                     keyword super. - Other constructor calls that begin with the keyword this (used
                     to call another same-class constructor).'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     *//*

    it("testConstructorNames0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let a1 = new A15.main('1', '2', '3')
      expect(a1.k1).assertEqual('1');
      expect(a1.k2).assertEqual('2');
      expect(a1.k3).assertEqual('3');
      expect(a1.lambda1).assertEqual(undefined);
      expect(a1.lambda2).assertEqual(undefined);
    });

    */
/**
     * @tc.number    SUB_CONSTRUCTOR_NAMES_XTSTEST_1700
     * @tc.name      testConstructorNames0017
     * @tc.desc      'There are two kinds of explicit constructor calls: - Superclass constructor
                     calls (used to call a constructor from the direct superclass) that begin with the
                     keyword super. - Other constructor calls that begin with the keyword this (used
                     to call another same-class constructor).'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     *//*

    it("testConstructorNames0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let x = ''
      let a1 = new A16.fromInt(1, 2, 3, undefined, () => { x = 'x' })
      expect(a1.k1).assertEqual('1');
      expect(a1.k2).assertEqual('2');
      expect(a1.k3).assertEqual('3');
      expect(a1.lambda1).assertEqual(undefined);
      a1.lambda2!()
      expect(x).assertEqual('x');
    });

    */
/**
     * @tc.number    SUB_CONSTRUCTOR_NAMES_XTSTEST_1800
     * @tc.name      testConstructorNames0018
     * @tc.desc      'There are two kinds of explicit constructor calls: - Superclass constructor
                     calls (used to call a constructor from the direct superclass) that begin with the
                     keyword super. - Other constructor calls that begin with the keyword this (used
                     to call another same-class constructor).'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     *//*

    it("testConstructorNames0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let x: string = ''
      let b1 = new B13.fromString('0', '1', '2', '3', () => { x = 'x' })
      expect(a1.k0).assertEqual('0');
      expect(a1.k1).assertEqual('1');
      expect(a1.k2).assertEqual('2');
      expect(a1.k3).assertEqual('3');
      b1.lambda1!()
      expect(x).assertEqual('x');
      expect(b1.lambda2).assertEqual( undefined);
    });

    */
/**
     * @tc.number    SUB_CONSTRUCTOR_NAMES_XTSTEST_1900
     * @tc.name      testConstructorNames0019
     * @tc.desc      'There are two kinds of explicit constructor calls: - Superclass constructor
                     calls (used to call a constructor from the direct superclass) that begin with the
                     keyword super. - Other constructor calls that begin with the keyword this (used
                     to call another same-class constructor).'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     *//*

    it("testConstructorNames0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let a1: A|undefined
      let v1: string = ''
      let a2 = new A18.main(
        '1',
        '2',
        '3',
        () => { a1 = new A('5', '6', '7', () => { v1 += 'lambda1' }) },
        () => { v1 += 'lambda2' },
        () => { v1 += 'lambda3' }
      )
      expect(a2.k1).assertEqual('1');
      expect(a2.k2).assertEqual('2');
      expect(a2.k3).assertEqual('3');
      a2.lambda1()
      a2.lambda2!()
      a2.lambda3!()
      expect(a1!.k1).assertEqual('5');
      expect(a1!.k2).assertEqual('6');
      expect(a1!.k3).assertEqual('7');
      a1!.lambda1()
      expect(v1).assertEqual('lambda2lambda3lambda1');
    });

    */
/**
     * @tc.number    SUB_CONSTRUCTOR_NAMES_XTSTEST_2000
     * @tc.name      testConstructorNames0020
     * @tc.desc      'There are two kinds of explicit constructor calls: - Superclass constructor
                     calls (used to call a constructor from the direct superclass) that begin with the
                     keyword super. - Other constructor calls that begin with the keyword this (used
                     to call another same-class constructor).'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     *//*

    it("testConstructorNames0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let a1: A|undefined
      let v1: string = ''
      let a2 = new A19.cons2(
        (p: string) => '' + p,
        (p: int) => '' + p,
        (p: boolean) => '' + p,
        () => { a1 = new A('5', '6', '7', () => { v1 += 'lambda1' }) },
      )
      expect(a2.k1).assertEqual('1');
      expect(a2.k2).assertEqual('2');
      expect(a2.k3).assertEqual('true');
      a2.lambda1()
      expect(a1!.k1).assertEqual('5');
      expect(a1!.k2).assertEqual('6');
      expect(a1!.k3).assertEqual('7');
      a1!.lambda1()
      expect(v1).assertEqual('lambda1');
    });

    */
/**
     * @tc.number    SUB_CONSTRUCTOR_NAMES_XTSTEST_2100
     * @tc.name      testConstructorNames0021
     * @tc.desc      'There are two kinds of explicit constructor calls: - Superclass constructor
                     calls (used to call a constructor from the direct superclass) that begin with the
                     keyword super. - Other constructor calls that begin with the keyword this (used
                     to call another same-class constructor).'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     *//*

    it("testConstructorNames0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let a1: A|undefined
      let v1: string = ''
      let b2 = new B14.fromLambdas(
        (p: string) => '@' + p,
        '1',
        '2',
        '3',
        () => { a1 = new A('5', '6', '7', () => { v1 += 'lambda1' }) },
        () => { v1 += 'lambda2' },
        () => { v1 += 'lambda3' }
      )
      expect(b2.lambda0('abc')).assertEqual('@abc');
      expect(b2.k1).assertEqual('1');
      expect(b2.k2).assertEqual('2');
      expect(b2.k3).assertEqual('3');
      b2.lambda1()
      b2.lambda2!()
      b2.lambda3!()
      expect(a1!.k1).assertEqual('5');
      expect(a1!.k2).assertEqual('6');
      expect(a1!.k3).assertEqual('7');
      a1!.lambda1()
      expect(v1).assertEqual('lambda2lambda3lambda1');
    });

    */
/**
     * @tc.number    SUB_CONSTRUCTOR_NAMES_XTSTEST_2200
     * @tc.name      testConstructorNames0022
     * @tc.desc      'There are two kinds of explicit constructor calls: - Superclass constructor
                     calls (used to call a constructor from the direct superclass) that begin with the
                     keyword super. - Other constructor calls that begin with the keyword this (used
                     to call another same-class constructor).'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     *//*

    it("testConstructorNames0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let s: string = ''
      let a = new A21.main(
        () => 42.0,
        'abc',
        (p: int) => [p, p > 0, '' + p],
        [127 as byte, -128 as byte],
        ['A', 'B'],
        (p: string) => [p, p, p],
        [1.0, 2.0, 3.0],
        () => { s = 'called' }
      )
      expect(a.p1()).assertEqual(42.0);
      expect(a.p2).assertEqual('abc');
      let tuple = a.p3(144)
      expect(tuple[0]).assertEqual(144);
      expect(tuple[1]).assertEqual(true);
      expect(tuple[2]).assertEqual('144');
      expect(a.p4[0]).assertEqual(127);
      expect(a.p4[1]).assertEqual(-128);
      let tuple2 = a.p5
      expect(tuple2[0]).assertEqual('A');
      expect(tuple2[1]).assertEqual('B');
      let stringArray = a.p6('hello')
      expect(stringArray.every((e: string, i: int, a: Array<string>) => e).assertEqual('hello'));
      let doubleArray = a.p7!
      expect(doubleArray.every((e: double, i: int, a: Array<double>) => i + 1).assertEqual(e));
      a.p8!()
      expect(s).assertEqual('called');
      expect(a.p9!['1']).assertEqual(10);
      expect(a.p10).assertEqual( Color.Blue);
    });

    */
/**
     * @tc.number    SUB_CONSTRUCTOR_NAMES_XTSTEST_2300
     * @tc.name      testConstructorNames0023
     * @tc.desc      'There are two kinds of explicit constructor calls: - Superclass constructor
                     calls (used to call a constructor from the direct superclass) that begin with the
                     keyword super. - Other constructor calls that begin with the keyword this (used
                     to call another same-class constructor).'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     *//*

    it("testConstructorNames0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let s: string = ''
      let a = new A22.c2(
        (p: int) => [p, p > 0, '' + p],
        [127 as byte, -128 as byte],
        ['A', 'B'],
        (p: string) => [p, p, p],
        [1.0, 2.0, 3.0],
        () => { s = 'called' }
      )
      expect(a.p1()).assertEqual(43.0);
      expect(a.p2).assertEqual('abcdef');
      let tuple = a.p3(12)
      expect(tuple[0]).assertEqual(12);
      expect(tuple[1]).assertEqual(true);
      expect(tuple[2]).assertEqual('12');
      expect(a.p4[0]).assertEqual(127);
      expect(a.p4[1]).assertEqual(-128);
      let tuple2 = a.p5
      expect(tuple2[0]).assertEqual('A');
      expect(tuple2[1]).assertEqual('B');
      let stringArray = a.p6('hello')
      expect(stringArray.every((e: string, i: int, a: Array<string>) => e).assertEqual('hello'));
      let doubleArray = a.p7!
      expect(doubleArray.every((e: double, i: int, a: Array<double>) => i + 1).assertEqual(e));
      a.p8!()
      expect(s).assertEqual('called');
      expect(a.p9!['2']).assertEqual(20);
      expect(a.p10).assertEqual( Color.Blue);
    });

    */
/**
     * @tc.number    SUB_CONSTRUCTOR_NAMES_XTSTEST_2400
     * @tc.name      testConstructorNames0024
     * @tc.desc      'There are two kinds of explicit constructor calls: - Superclass constructor
                     calls (used to call a constructor from the direct superclass) that begin with the
                     keyword super. - Other constructor calls that begin with the keyword this (used
                     to call another same-class constructor).'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     *//*

    it("testConstructorNames0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let s: string = ''
      let b = new B15.main_B15(
        () => 42.0,
        'abc',
        (p: int) => [p, p > 0, '' + p],
        [127 as byte, -128 as byte],
        ['A', 'B'],
        (p: string) => [p, p, p],
        [1.0, 2.0, 3.0],
        () => { s = 'called' },
        { '2': 2 }
      )
      expect(b.p1()).assertEqual(42.0);
      expect(b.p2).assertEqual('abc');
      let tuple = a.p3(144)
      expect(tuple[0]).assertEqual(144);
      expect(tuple[1]).assertEqual(true);
      expect(tuple[2]).assertEqual('144');
      expect(a.p4[0]).assertEqual(127);
      expect(a.p4[1]).assertEqual(-128);
      let tuple2 = b.p5
      expect(tuple2[0]).assertEqual('A');
      expect(tuple2[1]).assertEqual('B');
      let stringArray = b.p6('hello')
      expect(stringArray.every((e: string, i: int, a: Array<string>) => e).assertEqual('hello'));
      let doubleArray = b.p7!
      expect(doubleArray.every((e: double, i: int, a: Array<double>) => i + 1).assertEqual(e));
      b.p8!()
      expect(s).assertEqual('called');
      let rec: Record<string, int> = b.p9!
      expect(rec['2']).assertEqual(2);
      expect(b.p10).assertEqual( Color.Blue);
    });

    */
/**
     * @tc.number    SUB_CONSTRUCTOR_NAMES_XTSTEST_2500
     * @tc.name      testConstructorNames0025
     * @tc.desc      'There are two kinds of explicit constructor calls: - Superclass constructor
                     calls (used to call a constructor from the direct superclass) that begin with the
                     keyword super. - Other constructor calls that begin with the keyword this (used
                     to call another same-class constructor).'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     *//*

    it("testConstructorNames0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let a = new A24.all_optional(
        [() => 'abc']
      )
      expect(a.p1![0]()).assertEqual('abc');
      expect(a.p2.length).assertEqual(0);
      expect(a.p3).assertEqual(undefined);
      expect(a.p4['']).assertEqual(0);
      expect(a.p5).assertEqual(undefined);

      a = new A24.all_optional(
        [() => 'abc'],
        [() => 1.0, () => 2.0, () => 3.0],
        ['abc', 3.5]
      )
      expect(a.p1![0]()).assertEqual('abc');
      expect(a.p2[0]()).assertEqual(1.0);
      expect(a.p2[1]()).assertEqual(2.0);
      expect(a.p2[2]()).assertEqual(3.0);
      expect(a.p3![0]).assertEqual('abc');
      expect(a.p3![1]).assertEqual(3.5);
      expect(a.p4['']).assertEqual(0);
      expect(a.p5).assertEqual( undefined);

      a = new A24.all_optional(
        undefined,
        [],
        undefined,
        { '1': 1, '2': 2 },
        ['a', 'b', 'c']
      )
      expect(a.p1).assertEqual(undefined);
      expect(a.p2.length).assertEqual(0);
      expect(a.p3).assertEqual(undefined);
      expect(a.p4['1']).assertEqual(1);
      expect(a.p4['2']).assertEqual(2);
      expect(a.p5!.reduce((acc: string, curr: string) => acc + curr, '')).assertEqual('abc');
    });

    */
/**
     * @tc.number    SUB_CONSTRUCTOR_NAMES_XTSTEST_2600
     * @tc.name      testConstructorNames0026
     * @tc.desc      'There are two kinds of explicit constructor calls: - Superclass constructor
                     calls (used to call a constructor from the direct superclass) that begin with the
                     keyword super. - Other constructor calls that begin with the keyword this (used
                     to call another same-class constructor).'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     *//*

    it("testConstructorNames0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let a = new A25.rest('a', 'b', 'c', 'd')
      expect(a.p1).assertEqual(undefined);
      expect(a.p2.length).assertEqual(0);
      expect(a.p3).assertEqual(undefined);
      expect(a.p4[' ']).assertEqual(0);
      expect(a.p5!.reduce((acc: string, curr: string) => acc + curr, '')).assertEqual('abcd');
    });

    */
/**
     * @tc.number    SUB_CONSTRUCTOR_NAMES_XTSTEST_2700
     * @tc.name      testConstructorNames0027
     * @tc.desc      'There are two kinds of explicit constructor calls: - Superclass constructor
                     calls (used to call a constructor from the direct superclass) that begin with the
                     keyword super. - Other constructor calls that begin with the keyword this (used
                     to call another same-class constructor).'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     *//*

    it("testConstructorNames0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let b = new B16.rest('a', 'b', 'c', 'd')
      expect(b.p1).assertEqual(undefined);
      expect(b.p2.length).assertEqual(0);
      expect(b.p3).assertEqual(undefined);
      expect(b.p4[' ']).assertEqual(0);
      expect(b.p5!.reduce((acc: string, curr: string) => acc + curr, '')).assertEqual('abcd');
    });

    */
/**
     * @tc.number    SUB_CONSTRUCTOR_NAMES_XTSTEST_2800
     * @tc.name      testConstructorNames0028
     * @tc.desc      'There are two kinds of explicit constructor calls: - Superclass constructor
                     calls (used to call a constructor from the direct superclass) that begin with the
                     keyword super. - Other constructor calls that begin with the keyword this (used
                     to call another same-class constructor).'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     *//*

    it("testConstructorNames0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let b = new B17.in_B17('a', 'b', 'c', 'd')
      expect(b.s[0]).assertEqual('aa');
      expect(b.s[1]).assertEqual('b');
      expect(b.s[2]).assertEqual('c');
      expect(b.s[3]).assertEqual('d');
      expect(b.s.length).assertEqual(4);
    });






*/
