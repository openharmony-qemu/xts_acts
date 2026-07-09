'use static';
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
} from '@ohos/hypium-binary/src/main/indexStatic';
import Utils from '../../Util.test'

class A1 {
    fld: Object[]
    constructor(p: string, ...q: Object[]) {
        this.fld = [p, ...q]
    }
    constructor(p: int, ...q: (string|boolean)[]) {
        this.fld = [p, ...q]
    }
    constructor(...p: (boolean|float)[]) {
        this.fld = [...p]
    }
}

class B1 extends A1 {
    constructor(p: int) { super('a', 'b', 'c', 'd') }
    constructor(p: string) { super(1, ...['a', true, false, 'b']) }
    constructor(p: float) { super(p, p, true, false) }
    constructor(p: boolean) { super(...[true, false], ...[1f, 2f])}
}

class A2 {
    fld: [string, Object, int, boolean]
    constructor(...p: [string, Object, int, boolean]) {
        this.fld = [...p]
    }
}

class B2 extends A2 {
    constructor(p: int) { super('c', 'd', p, true) }
    constructor(q: string) { super(...[q, q, 1, false]) }
    constructor(q: int, p: [string, Object, int, boolean]) { super(...p) }
}

class A3 {
    fld: [Object, Object, int, int]
    constructor(...p: [Object, Object, int, int]) {
        this.fld = [...p]
    }
}

class B3 extends A3 {
    constructor(p: int) {
        const params: [Object, Object, int, int] = [new String('a'), new String('b'), p, p]
        super(...params)
    }
}

class A4 {
    fld: [Object, string, int, int]
    constructor(...p: [Object, string, int, int]) {
        this.fld = [...p]
    }
}

class B4 extends A4 {
    constructor(p: int) {
        super('a' as Object, 'b', 1, 11)
    }

}

class A5 {
    fld: string
    constructor() {
        this('hello')
    }
    constructor(p: string) {
        this.fld = p
    }
}

class A6 {
    fld: string
    constructor() {
        this(42.0)
    }
    constructor(p: number) {
        this('' + p)
    }
    constructor(p: string) {
        this.fld = p
    }
}


abstract class A7 {
    fld: string
    constructor(p: number | boolean) {
        this.fld = (typeof p === 'boolean' ? (p ? 1.0 : 0.0) : p).toString()
    }
}

class B5 extends A7 {
    constructor(p?: number) {
        super(p === undefined ? false : p)
    }

    static withInt(p: int): B5 {
        return new B5(p + 1.0)
    }
}

abstract class A8 {
    fld: string
    constructor(p: string | number) {
        this.fld = p.toString()
    }
}

abstract class B6 extends A8 {
    constructor(p?: string | number) {
        super(
            p === undefined ? '' :
                (typeof p === 'number' ? (Number(p) + 1) : String(p))
        )
    }
}

class A9 {
    p: string|undefined
    constructor(p?: string) {
        this.p = p
    }
}
class B7 extends A9 {
    s: string[]
    constructor(...s: string[]) {
        super()
        this.s = s
    }
}


class A10 {
    p: string|undefined
    constructor(p?: string) {
        this.p = p
    }
}
class B8 extends A10 {
    s: string[]
    constructor(...s: string[]) {
        super(undefined)
        this.s = s
    }
}



class A11 {
    p: string|undefined
    constructor(p?: string) {
        this.p = p
    }
}
class B9 extends A11 {
    s: string[]
    constructor(...s: string[]) {
        super('super')
        this.s = s
    }
}

class A12 {
    s: string[]
    constructor(...s: string[]) {
        this.s = s
    }
}
class B10 extends A12 {
    constructor(p1: string, p2: string) {
        super(p1, p2)
    }
}

class A13 {
    s: string[]
    constructor(...s: string[]) {
        this.s = s
    }
}
class B11 extends A13 {
    constructor(p1: string, p2?: string) {
        super(p1, p2 ?? 'b')
    }
}

class A14 {
    s: string[]
    constructor(...s: string[]) {
        this.s = s
    }
}
class B12 extends A14 {
    constructor(p1?: string, p2: string = 'b') {
        super(p1 ?? 'x', p2)
    }
}

class A15 {
    s: string[]
    constructor(...s: string[]) {
        this.s = s
    }
}
class B13 extends A15 {
    constructor(p1: string, p2: string) {
        super(...[p1, p2])
    }
}

class A16 {
    s: string[]
    constructor(...s: string[]) {
        this.s = s
    }
}
class B14 extends A16 {
    constructor(...p: string[]) {
        super(...p)
    }
}

class A17 {
    p1: string[]
    p2: string[]
    constructor(p1: string[] = [], p2: string[] = []) {
        this.p1 = p1
        this.p2 = p2
    }
}
class B15 extends A17 {
    constructor(...p: string[]) {
        super(p)
    }
}

class A18 {
    p1: string[]
    p2: string[]
    constructor(p1: string[] = [], p2: string[] = []) {
        this.p1 = p1
        this.p2 = p2
    }
}
class B16 extends A18 {
    constructor(...p: string[]) {
        super(p, undefined)
    }
}

class A19 {
    p1: string[]
    p2: string[]
    constructor(p1: string[] = [], p2: string[] = []) {
        this.p1 = p1
        this.p2 = p2
    }
}
class B17 extends A19 {
    constructor(...p: string[]) {
        super(undefined, p)
    }
}

class A20 {
    k1: string
    k2: string
    k3: string
    lambda1: (() => void)|undefined
    lambda2: (() => void)|undefined
    constructor(k1: string, k2: string, k3: string, lambda1?: () => void, lambda2?: () => void) {
        this.k1 = k1
        this.k2 = k2
        this.k3 = k3
        this.lambda1 = lambda1
        this.lambda2 = lambda2
    }
}

class A21 {
    k1: string
    k2: string
    k3: string
    lambda1: (() => void)|undefined
    lambda2: (() => void)|undefined
    constructor(k1: string, k2: string, k3: string, lambda1?: () => void, lambda2?: () => void) {
        this.k1 = k1
        this.k2 = k2
        this.k3 = k3
        this.lambda1 = lambda1
        this.lambda2 = lambda2
    }
    constructor(k1: int, k2: int, k3: int, lambda1?: () => void, lambda2?: () => void) {
        this('' + k1, '' + k2, '' + k3, lambda1, lambda2)
    }
}

class A22 {
    k1: string
    k2: string
    k3: string
    lambda1: (() => void)|undefined
    lambda2: (() => void)|undefined
    constructor(k1: string, k2: string, k3: string, lambda1?: () => void, lambda2?: () => void) {
        this.k1 = k1
        this.k2 = k2
        this.k3 = k3
        this.lambda1 = lambda1
        this.lambda2 = lambda2
    }
}
class B18 extends A22 {
    k0: string
    constructor(k0: string, k1: string, k2: string, k3: string, lambda1?: () => void, lambda2?: () => void) {
        super(k1, k2, k3, lambda1, lambda2)
        this.k0 = k0
    }
}

class A23 {
    k1: string
    k2: string
    k3: string
    lambda1: () => void
    lambda2: (() => void)|undefined
    lambda3: (() => void)|undefined
    constructor(k1: string, k2: string, k3: string, lambda1: () => void, lambda2?: () => void, lambda3?: () => void) {
        this.k1 = k1
        this.k2 = k2
        this.k3 = k3
        this.lambda1 = lambda1
        this.lambda2 = lambda2
        this.lambda3 = lambda3
    }
}

class A24 {
    k1: string
    k2: string
    k3: string
    lambda1: () => void
    lambda2: (() => void)|undefined
    lambda3: (() => void)|undefined
    constructor(k1: string, k2: string, k3: string, lambda1: () => void, lambda2?: () => void, lambda3?: () => void) {
        this.k1 = k1
        this.k2 = k2
        this.k3 = k3
        this.lambda1 = lambda1
        this.lambda2 = lambda2
        this.lambda3 = lambda3
    }
    constructor(k1: (p: string) => string, k2: (p: int) => string, k3: (p: boolean) => string, lambda1: () => void) {
        this(k1('1'), k2(2), k3(true), lambda1, undefined)
    }
}

class A25 {
    k1: string
    k2: string
    k3: string
    lambda1: () => void
    lambda2: (() => void)|undefined
    lambda3: (() => void)|undefined
    constructor(k1: string, k2: string, k3: string, lambda1: () => void, lambda2?: () => void, lambda3?: () => void) {
        this.k1 = k1
        this.k2 = k2
        this.k3 = k3
        this.lambda1 = lambda1
        this.lambda2 = lambda2
        this.lambda3 = lambda3
    }
}
class B19 extends A25 {
    lambda0: (p: string) => string
    constructor(lambda0: (p: string) => string, k1: string, k2: string, k3: string, lambda1: () => void, lambda2?: () => void, lambda3?: () => void) {
        super(k1, k2, k3, lambda1, lambda2, lambda3)
        this.lambda0 = lambda0
    }
}

enum Color { Red, Green, Blue }
class A26 {
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

    constructor(
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

class A27 {
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

    constructor(
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

    constructor(
        p1: (p1: int) => [int, boolean, string],
        p2: FixedArray<byte>,
        p3: [string, string],
        p4: (p1: string) => string[],
        p5?: double[],
        p6?: () => void,
        p7?: () => number,
        p8?: string,
    ) {
        this(
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

class A28 {
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

    constructor(
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
class B20 extends A28 {
    constructor(
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
        super(p1, p2, p3, p4, p5, p6, p7, p8, p9)
    }
}

class A29 {
    p1: Array<() => string>|undefined
    p2: Array<() => number>
    p3: [string, number]|undefined
    p4: Record<string, number>
    p5: string[]|undefined

    constructor(
        p1?: Array<() => string>,
        p2: Array<() => number> = [],
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

class A30 {
    p1: Array<() => string>|undefined
    p2: Array<() => number>
    p3: [string, number]|undefined
    p4: Record<string, number>
    p5: string[]|undefined

    constructor(
        p1?: Array<() => string>,
        p2: Array<() => number> = [],
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

    constructor(...p5: string[]) {
        this(undefined, undefined, undefined, undefined, p5)
    }
}

class A31 {
    p1: Array<() => string>|undefined
    p2: Array<() => number>
    p3: [string, number]|undefined
    p4: Record<string, number>
    p5: string[]|undefined

    constructor(
        p1?: Array<() => string>,
        p2: Array<() => number> = [],
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

class B21 extends A31 {
    constructor(...p5: string[]) {
        super(undefined, undefined, undefined, undefined, p5)
    }
}

class A32 {
    s: string[]
    constructor(...s: string[]) {
        this.s = s
    }
}
class B22 extends A32 {
    constructor(p1: string, ...p2: string[]) {
        super(p1 + p1, ...p2)
    }
}


class A33 {
    x: int = 0;

    constructor() {
        this(5)
        this.x++
    }
    constructor(a: int) {
        this(true)
        this.x++
    }
    constructor(a: boolean) {
        this('abc')
        this.x++
    }
    constructor(a: string) {
        this(1.0f)
        this.x++
    }
    constructor(a: float) {
        this(new Error)
        this.x++
    }
    constructor(a: Error) {
        this([1, 2, 3])
        this.x++
    }
    constructor(a: Array<int>) {
        this(() => {})
        this.x++
    }
    constructor(a: () => void) {
        this.x++
    }
}

class B23 extends A33 {
    constructor() {
        super(5)
        this.x++
    }
    constructor(a: int) {
        super(true)
        this.x++
    }
    constructor(a: boolean) {
        super('abc')
        this.x++
    }
    constructor(a: string) {
        super(1.0f)
        this.x++
    }
    constructor(a: float) {
        super(new Error)
        this.x++
    }
    constructor(a: Error) {
        super([1, 2, 3])
        this.x++
    }
    constructor(a: Array<int>) {
        super(() => {})
        this.x++
    }
    constructor(a: () => void) {
        this.x++
    }
}

class A34 {
    x: int = 0;

    constructor() {
        this(5)
        this.x++
    }
    constructor(a: int) {
        this(true)
        this.x++
    }
    constructor(a: boolean) {
        this('abc')
        this.x++
    }
    constructor(a: string) {
        this(1.0f)
        this.x++
    }
    constructor(a: float) {
        this(new Error)
        this.x++
    }
    constructor(a: Error) {
        this([1, 2, 3])
        this.x++
    }
    constructor(a: Array<int>) {
        this(() => {})
        this.x++
    }
    constructor(a: () => void) {
        this.x++
    }
}

export default function ExplicitConstructorCallTest():void {
    describe('ExplicitConstructorCallTest', () => {
        // Defines a test suite. Two parameters are supported: test suite name and test suite function.
        beforeAll(() => {
            // Presets an action, which is performed only once before all test cases of the test suite start.
            // This API supports only one parameter: preset action function.
        })

        beforeEach(async () => {
            // Presets an action, which is performed before each unit test case starts.
            // The number of execution times is the same as the number of test cases defined by **it**.
            // This API supports only one parameter: preset action function.
            await Utils.msSleep(30);
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
         * @tc.number    SUB_EXPLICIT_CONSTRUCTOR_CALLTEST_0100
         * @tc.name      testExplicitConstructorCall0001
         * @tc.desc      Semantic check for a super call is performed in accordance with "Compatibility of Call Arguments".
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 2
         */
        it("testExplicitConstructorCall0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

            let b = new B1(1)
        expect(b.fld.length).assertEqual(4)
        expect(b.fld[0]).assertEqual('a')
        expect(b.fld[3]).assertEqual('d')

            b = new B1('')
        expect(b.fld.length).assertEqual(5)
        expect(b.fld[0]).assertEqual(1)
        expect(b.fld[1]).assertEqual('a')
        expect(b.fld[2]).assertEqual(true)
        expect(b.fld[3]).assertEqual(false)
        expect(b.fld[4]).assertEqual('b')

            b = new B1(1f)
        expect(b.fld.length).assertEqual(4)
        expect(b.fld[0]).assertEqual(1f)
        expect(b.fld[1]).assertEqual(1f)
        expect(b.fld[2]).assertEqual(true)
        expect(b.fld[3]).assertEqual(false)

            b = new B1(true)
        expect(b.fld.length).assertEqual(4)
        expect(b.fld[0]).assertEqual(true)
        expect(b.fld[1]).assertEqual(false)
        expect(b.fld[2]).assertEqual(1f)
        expect(b.fld[3]).assertEqual(2f)
        });
        /**
         * @tc.number    SUB_EXPLICIT_CONSTRUCTOR_CALLTEST_0200
         * @tc.name      testExplicitConstructorCall0002
         * @tc.desc      Semantic check for a super call is performed in accordance with "Compatibility of Call Arguments".
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 2
         */
        it("testExplicitConstructorCall0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

            let t: [string, Object, int, boolean] = ['a', 'b', 1, true]
            let b = new B2(1, t)
        expect(b.fld[0]).assertEqual('a')
        expect(b.fld[1]).assertEqual('b')
        expect(b.fld[2]).assertEqual(1)
        expect(b.fld[3]).assertEqual(true)

            b = new B2('b')
        expect(b.fld[0]).assertEqual('b')
        expect(b.fld[1]).assertEqual('b')
        expect(b.fld[2]).assertEqual(1)
        expect(b.fld[3]).assertEqual(false)

            b = new B2(2)
        expect(b.fld[0]).assertEqual('c')
        expect(b.fld[1]).assertEqual('d')
        expect(b.fld[2]).assertEqual(2)
        expect(b.fld[3]).assertEqual(true)
        });
        /**
         * @tc.number    SUB_EXPLICIT_CONSTRUCTOR_CALLTEST_0300
         * @tc.name      testExplicitConstructorCall0003
         * @tc.desc      Semantic check for a super call is performed in accordance with "Compatibility of Call Arguments".
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 2
         */
        it("testExplicitConstructorCall0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

            let b = new B3(1)
        expect(b.fld[0]).assertEqual('a')
        expect(b.fld[1]).assertEqual('b')
        expect(b.fld[2]).assertEqual(1)
        expect(b.fld[3]).assertEqual(1)
        });
        /**
         * @tc.number    SUB_EXPLICIT_CONSTRUCTOR_CALLTEST_0400
         * @tc.name      testExplicitConstructorCall0004
         * @tc.desc      Semantic check for a super call is performed in accordance with "Compatibility of Call Arguments".
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 2
         */
        it("testExplicitConstructorCall0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

            let b = new B4(1)
        expect(b.fld[0]).assertEqual('a')
        expect(b.fld[1]).assertEqual('b')
        expect(b.fld[2]).assertEqual(1)
        expect(b.fld[3]).assertEqual(11)

        });
        /**
         * @tc.number    SUB_EXPLICIT_CONSTRUCTOR_CALLTEST_0500
         * @tc.name      testExplicitConstructorCall0005
         * @tc.desc      'There are two kinds of explicit constructor calls: - Superclass constructor
         *               calls (used to call a constructor from the direct superclass) that begin with the
         *               keyword super. - Other constructor calls that begin with the keyword this (used
         *               to call another same-class constructor).'
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 2
         */
        it("testExplicitConstructorCall0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

        expect(new A5('abc').fld).assertEqual('abc')
        expect(new A5().fld).assertEqual('hello')

        });
        /**
         * @tc.number    SUB_EXPLICIT_CONSTRUCTOR_CALLTEST_0600
         * @tc.name      testExplicitConstructorCall0006
         * @tc.desc      'There are two kinds of explicit constructor calls: - Superclass constructor
         *               calls (used to call a constructor from the direct superclass) that begin with the
         *               keyword super. - Other constructor calls that begin with the keyword this (used
         *               to call another same-class constructor).'
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 2
         */
        it("testExplicitConstructorCall0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

        expect(new A6('abc').fld).assertEqual('abc')
        expect(new A6().fld).assertEqual('42')
        expect(new A6(3.14).fld).assertEqual('3.14')
        });
        /**
         * @tc.number    SUB_EXPLICIT_CONSTRUCTOR_CALLTEST_0700
         * @tc.name      testExplicitConstructorCall0007
         * @tc.desc      'There are two kinds of explicit constructor calls: - Superclass constructor
         *               calls (used to call a constructor from the direct superclass) that begin with the
         *               keyword super. - Other constructor calls that begin with the keyword this (used
         *               to call another same-class constructor).'
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 2
         */
        it("testExplicitConstructorCall0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

        expect(new B5().fld).assertEqual('0')
        expect(new B5(42.0).fld).assertEqual('42')
        expect(B5.withInt(12345).fld).assertEqual('12346')
        });

        /**
         * @tc.number    SUB_EXPLICIT_CONSTRUCTOR_CALLTEST_0800
         * @tc.name      testExplicitConstructorCall0008
         * @tc.desc      'There are two kinds of explicit constructor calls: - Superclass constructor
         *               calls (used to call a constructor from the direct superclass) that begin with the
         *               keyword super. - Other constructor calls that begin with the keyword this (used
         *               to call another same-class constructor).'
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 2
         */
        it("testExplicitConstructorCall0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

            let b = new B7()
        expect(b.p).assertEqual(undefined)
        expect(b.s.length).assertEqual(0)

            b = new B7('a')
        expect(b.p).assertEqual(undefined)
        expect(b.s.length).assertEqual(1)
        expect(b.s[0]).assertEqual('a')

            b = new B7('a', 'b', 'c')
        expect(b.p).assertEqual(undefined)
        expect(b.s.length).assertEqual(3)
        expect(b.s[0]).assertEqual('a')
        expect(b.s[1]).assertEqual('b')
        expect(b.s[2]).assertEqual('c')

        });
        /**
         * @tc.number    SUB_EXPLICIT_CONSTRUCTOR_CALLTEST_0900
         * @tc.name      testExplicitConstructorCall0009
         * @tc.desc      'There are two kinds of explicit constructor calls: - Superclass constructor
         *               calls (used to call a constructor from the direct superclass) that begin with the
         *               keyword super. - Other constructor calls that begin with the keyword this (used
         *               to call another same-class constructor).'
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 2
         */
        it("testExplicitConstructorCall0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

            let b = new B8()
        expect(b.p).assertEqual(undefined)
        expect(b.s.length).assertEqual(0)

            b = new B8('a')
        expect(b.p).assertEqual(undefined)
        expect(b.s.length).assertEqual(1)
        expect(b.s[0]).assertEqual('a')

            b = new B8('a', 'b', 'c')
        expect(b.p).assertEqual(undefined)
        expect(b.s.length).assertEqual(3)
        expect(b.s[0]).assertEqual('a')
        expect(b.s[1]).assertEqual('b')
        expect(b.s[2]).assertEqual('c')

        });
        /**
         * @tc.number    SUB_EXPLICIT_CONSTRUCTOR_CALLTEST_1000
         * @tc.name      testExplicitConstructorCall0010
         * @tc.desc      'There are two kinds of explicit constructor calls: - Superclass constructor
         *               calls (used to call a constructor from the direct superclass) that begin with the
         *               keyword super. - Other constructor calls that begin with the keyword this (used
         *               to call another same-class constructor).'
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 2
         */
        it("testExplicitConstructorCall0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

            let b = new B9()
        expect(b.p).assertEqual('super')
        expect(b.s.length).assertEqual(0)

            b = new B9('a')
        expect(b.p).assertEqual('super')
        expect(b.s.length).assertEqual(1)
        expect(b.s[0]).assertEqual('a')

            b = new B9('a', 'b', 'c')
        expect(b.p).assertEqual('super')
        expect(b.s.length).assertEqual(3)
        expect(b.s[0]).assertEqual('a')
        expect(b.s[1]).assertEqual('b')
        expect(b.s[2]).assertEqual('c')
        });
        /**
         * @tc.number    SUB_EXPLICIT_CONSTRUCTOR_CALLTEST_1100
         * @tc.name      testExplicitConstructorCall0011
         * @tc.desc      'There are two kinds of explicit constructor calls: - Superclass constructor
         *               calls (used to call a constructor from the direct superclass) that begin with the
         *               keyword super. - Other constructor calls that begin with the keyword this (used
         *               to call another same-class constructor).'
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 2
         */
        it("testExplicitConstructorCall0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

            let b = new B10('a', 'b')
        expect(b.s.length).assertEqual(2)
        expect(b.s[0]).assertEqual('a')
        expect(b.s[1]).assertEqual('b')

        });
        /**
         * @tc.number    SUB_EXPLICIT_CONSTRUCTOR_CALLTEST_1200
         * @tc.name      testExplicitConstructorCall0012
         * @tc.desc      'There are two kinds of explicit constructor calls: - Superclass constructor
         *               calls (used to call a constructor from the direct superclass) that begin with the
         *               keyword super. - Other constructor calls that begin with the keyword this (used
         *               to call another same-class constructor).'
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 2
         */
        it("testExplicitConstructorCall0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

            let b = new B11('a')
        expect(b.s.length).assertEqual(2)
        expect(b.s[0]).assertEqual('a')
        expect(b.s[1]).assertEqual('b')

            b = new B11('a', undefined)
        expect(b.s.length).assertEqual(2)
        expect(b.s[0]).assertEqual('a')
        expect(b.s[1]).assertEqual('b')

            b = new B11('a', 'c')
        expect(b.s.length).assertEqual(2)
        expect(b.s[0]).assertEqual('a')
        expect(b.s[1]).assertEqual('c')

        });
        /**
         * @tc.number    SUB_EXPLICIT_CONSTRUCTOR_CALLTEST_1300
         * @tc.name      testExplicitConstructorCall0013
         * @tc.desc      'There are two kinds of explicit constructor calls: - Superclass constructor
         *               calls (used to call a constructor from the direct superclass) that begin with the
         *               keyword super. - Other constructor calls that begin with the keyword this (used
         *               to call another same-class constructor).'
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 2
         */
        it("testExplicitConstructorCall0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

            let b = new B12()
        expect(b.s.length).assertEqual(2)
        expect(b.s[0]).assertEqual('x')
        expect(b.s[1]).assertEqual('b')

            b = new B12('y')
        expect(b.s.length).assertEqual(2)
        expect(b.s[0]).assertEqual('y')
        expect(b.s[1]).assertEqual('b')

            b = new B12('y', 'z')
        expect(b.s.length).assertEqual(2)
        expect(b.s[0]).assertEqual('y')
        expect(b.s[1]).assertEqual('z')
        });
        /**
         * @tc.number    SUB_EXPLICIT_CONSTRUCTOR_CALLTEST_1400
         * @tc.name      testExplicitConstructorCall0014
         * @tc.desc      'There are two kinds of explicit constructor calls: - Superclass constructor
         *               calls (used to call a constructor from the direct superclass) that begin with the
         *               keyword super. - Other constructor calls that begin with the keyword this (used
         *               to call another same-class constructor).'
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 2
         */
        it("testExplicitConstructorCall0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

            let b = new B13('a', 'b')
        expect(b.s.length).assertEqual(2)
        expect(b.s[0]).assertEqual('a')
        expect(b.s[1]).assertEqual('b')

        });
        /**
         * @tc.number    SUB_EXPLICIT_CONSTRUCTOR_CALLTEST_1500
         * @tc.name      testExplicitConstructorCall0015
         * @tc.desc      'There are two kinds of explicit constructor calls: - Superclass constructor
         *               calls (used to call a constructor from the direct superclass) that begin with the
         *               keyword super. - Other constructor calls that begin with the keyword this (used
         *               to call another same-class constructor).'
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 2
         */
        it("testExplicitConstructorCall0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

            let b = new B14()
        expect(b.s.length).assertEqual(0)

            b = new B14('a', 'b', 'c')
        expect(b.s[0]).assertEqual('a')
        expect(b.s[1]).assertEqual('b')
        expect(b.s[2]).assertEqual('c')
        });
        /**
         * @tc.number    SUB_EXPLICIT_CONSTRUCTOR_CALLTEST_1600
         * @tc.name      testExplicitConstructorCall0016
         * @tc.desc      'There are two kinds of explicit constructor calls: - Superclass constructor
         *               calls (used to call a constructor from the direct superclass) that begin with the
         *               keyword super. - Other constructor calls that begin with the keyword this (used
         *               to call another same-class constructor).'
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 2
         */
        it("testExplicitConstructorCall0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

            let b = new B15('a', 'b', 'c')
        expect(b.p1.length).assertEqual(3)
        expect(b.p2.length).assertEqual(0)
            b = new B15()
        expect(b.p1.length).assertEqual(0)
        expect(b.p2.length).assertEqual(0)
        });
        /**
         * @tc.number    SUB_EXPLICIT_CONSTRUCTOR_CALLTEST_1700
         * @tc.name      testExplicitConstructorCall0017
         * @tc.desc      'There are two kinds of explicit constructor calls: - Superclass constructor
         *               calls (used to call a constructor from the direct superclass) that begin with the
         *               keyword super. - Other constructor calls that begin with the keyword this (used
         *               to call another same-class constructor).'
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 2
         */
        it("testExplicitConstructorCall0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

            let b = new B16('a', 'b', 'c')
        expect(b.p1.length).assertEqual(3)
        expect(b.p2.length).assertEqual(0)
            b = new B16()

        expect(b.p1.length).assertEqual(0)
        expect(b.p2.length).assertEqual(0)
        });

        /**
         * @tc.number    SUB_EXPLICIT_CONSTRUCTOR_CALLTEST_1800
         * @tc.name      testExplicitConstructorCall0018
         * @tc.desc      'There are two kinds of explicit constructor calls: - Superclass constructor
         *               calls (used to call a constructor from the direct superclass) that begin with the
         *               keyword super. - Other constructor calls that begin with the keyword this (used
         *               to call another same-class constructor).'
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 2
         */
        it("testExplicitConstructorCall0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

            let b = new B17('a', 'b', 'c')
        expect(b.p1.length).assertEqual(0)
        expect(b.p2.length).assertEqual(3)

            b = new B17()
        expect(b.p1.length).assertEqual(0)
        expect(b.p2.length).assertEqual(0)
        });
        /**
         * @tc.number    SUB_EXPLICIT_CONSTRUCTOR_CALLTEST_1900
         * @tc.name      testExplicitConstructorCall0019
         * @tc.desc      'There are two kinds of explicit constructor calls: - Superclass constructor
         *               calls (used to call a constructor from the direct superclass) that begin with the
         *               keyword super. - Other constructor calls that begin with the keyword this (used
         *               to call another same-class constructor).'
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 2
         */
        it("testExplicitConstructorCall0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

            let a1 = new A20('1', '2', '3')
        expect(a1.k1).assertEqual('1')
        expect(a1.k2).assertEqual('2')
        expect(a1.k3).assertEqual('3')
        expect(a1.lambda1).assertEqual(undefined)
        expect(a1.lambda2).assertEqual(undefined);
        });
        /**
         * @tc.number    SUB_EXPLICIT_CONSTRUCTOR_CALLTEST_2000
         * @tc.name      testExplicitConstructorCall0020
         * @tc.desc      'There are two kinds of explicit constructor calls: - Superclass constructor
         *               calls (used to call a constructor from the direct superclass) that begin with the
         *               keyword super. - Other constructor calls that begin with the keyword this (used
         *               to call another same-class constructor).'
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 2
         */
        it("testExplicitConstructorCall0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

            let x = ''
            let a1 = new A21(1, 2, 3, undefined, () => { x = 'x' })
        expect(a1.k1).assertEqual('1')
        expect(a1.k2).assertEqual('2')
        expect(a1.k3).assertEqual('3')
        expect(a1.lambda1).assertEqual(undefined)
            a1.lambda2!()
        expect(x).assertEqual('x');
        });
        /**
         * @tc.number    SUB_EXPLICIT_CONSTRUCTOR_CALLTEST_2100
         * @tc.name      testExplicitConstructorCall0021
         * @tc.desc      'There are two kinds of explicit constructor calls: - Superclass constructor
         *               calls (used to call a constructor from the direct superclass) that begin with the
         *               keyword super. - Other constructor calls that begin with the keyword this (used
         *               to call another same-class constructor).'
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 2
         */
        it("testExplicitConstructorCall0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

            let x: string = ''
            let b1 = new B18('0', '1', '2', '3', () => { x = 'x' })
        expect(b1.k0).assertEqual('0')
        expect(b1.k1).assertEqual('1')
        expect(b1.k2).assertEqual('2')
        expect(b1.k3).assertEqual('3')
            b1.lambda1!()
        expect(x).assertEqual('x')
        expect(b1.lambda2).assertEqual(undefined)
        });
        /**
         * @tc.number    SUB_EXPLICIT_CONSTRUCTOR_CALLTEST_2200
         * @tc.name      testExplicitConstructorCall0022
         * @tc.desc      'There are two kinds of explicit constructor calls: - Superclass constructor
         *               calls (used to call a constructor from the direct superclass) that begin with the
         *               keyword super. - Other constructor calls that begin with the keyword this (used
         *               to call another same-class constructor).'
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 2
         */
        it("testExplicitConstructorCall0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

            let a1: A23|undefined;
            let v1: string = ''
            let a2 = new A23(
                '1',
                '2',
                '3',
                () => { a1 = new A23('5', '6', '7', () => { v1 += 'lambda1' }) },
                () => { v1 += 'lambda2' },
                () => { v1 += 'lambda3' }
            )
        expect(a2.k1).assertEqual('1')
        expect(a2.k2).assertEqual('2')
        expect(a2.k3).assertEqual('3')
            a2.lambda1()
            a2.lambda2!()
            a2.lambda3!()
        expect(a1!.k1).assertEqual('5')
        expect(a1!.k2).assertEqual('6')
        expect(a1!.k3).assertEqual('7')
            a1!.lambda1()
        expect(v1).assertEqual('lambda2lambda3lambda1')
        });
        /**
         * @tc.number    SUB_EXPLICIT_CONSTRUCTOR_CALLTEST_2300
         * @tc.name      testExplicitConstructorCall0023
         * @tc.desc      'There are two kinds of explicit constructor calls: - Superclass constructor
         *               calls (used to call a constructor from the direct superclass) that begin with the
         *               keyword super. - Other constructor calls that begin with the keyword this (used
         *               to call another same-class constructor).'
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 2
         */
        it("testExplicitConstructorCall0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

            let a1: A24|undefined;

            let v1: string = ''
            let a2 = new A24(
                (p: string) => '' + p,
                (p: int) => '' + p,
                (p: boolean) => '' + p,
                () => { a1 = new A24('5', '6', '7', () => { v1 += 'lambda1' }) },
            )
        expect(a2.k1).assertEqual('1')
        expect(a2.k2).assertEqual('2')
        expect(a2.k3).assertEqual('true')
            a2.lambda1()
        expect(a1!.k1).assertEqual('5')
        expect(a1!.k2).assertEqual('6')
        expect(a1!.k3).assertEqual('7')
            a1!.lambda1()
        expect(v1).assertEqual('lambda1')
        });
        /**
         * @tc.number    SUB_EXPLICIT_CONSTRUCTOR_CALLTEST_2400
         * @tc.name      testExplicitConstructorCall0024
         * @tc.desc      'There are two kinds of explicit constructor calls: - Superclass constructor
         *               calls (used to call a constructor from the direct superclass) that begin with the
         *               keyword super. - Other constructor calls that begin with the keyword this (used
         *               to call another same-class constructor).'
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 2
         */
        it("testExplicitConstructorCall0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

            let a1: A25|undefined;

            let v1: string = ''
            let b2 = new B19(
                (p: string) => '@' + p,
                '1',
                '2',
                '3',
                () => { a1 = new A25('5', '6', '7', () => { v1 += 'lambda1' }) },
                () => { v1 += 'lambda2' },
                () => { v1 += 'lambda3' }
            )
        expect(b2.lambda0('abc')).assertEqual('@abc')
        expect(b2.k1).assertEqual('1')
        expect(b2.k2).assertEqual('2')
        expect(b2.k3).assertEqual('3')
            b2.lambda1()
            b2.lambda2!()
            b2.lambda3!()
        expect(a1!.k1).assertEqual('5')
        expect(a1!.k2).assertEqual('6')
        expect(a1!.k3).assertEqual('7')
            a1!.lambda1()
        expect(v1).assertEqual('lambda2lambda3lambda1')
        });

        /**
         * @tc.number    SUB_EXPLICIT_CONSTRUCTOR_CALLTEST_2500
         * @tc.name      testExplicitConstructorCall0025
         * @tc.desc      'There are two kinds of explicit constructor calls: - Superclass constructor
         *               calls (used to call a constructor from the direct superclass) that begin with the
         *               keyword super. - Other constructor calls that begin with the keyword this (used
         *               to call another same-class constructor).'
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 2
         */
        it("testExplicitConstructorCall0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

            let s: string = ''
            let a = new A26(
                () => 42.0,
                'abc',
                (p: int) => [p, p > 0, '' + p],
                [127 as byte, -128 as byte],
                ['A', 'B'],
                (p: string) => [p, p, p],
                [1.0, 2.0, 3.0],
                () => { s = 'called' }
            )
        expect(a.p1()).assertEqual(42.0)
        expect(a.p2).assertEqual('abc')
            let tuple = a.p3(144)
        expect(tuple[0]).assertEqual(144)
        expect(tuple[1]).assertEqual(true)
        expect(tuple[2]).assertEqual('144')
        expect(a.p4[0]).assertEqual(127)
        expect(a.p4[1]).assertEqual(-128)
            let tuple2 = a.p5;
        expect(tuple2[0]).assertEqual('A')
        expect(tuple2[1]).assertEqual('B')
            let stringArray = a.p6('hello')
        expect(stringArray.every((e: string, i: int, a: Array<string>) => e == 'hello')).assertTrue();
            let doubleArray = a.p7!
        expect(doubleArray.every((e: double, i: int, a: Array<double>) => i + 1 == e)).assertTrue();
        a.p8!()
        expect(s).assertEqual('called')
        expect(a.p9!['1']).assertEqual(10)
        expect(a.p10).assertEqual(Color.Blue)
        });
        /**
         * @tc.number    SUB_EXPLICIT_CONSTRUCTOR_CALLTEST_2600
         * @tc.name      testExplicitConstructorCall0026
         * @tc.desc      'There are two kinds of explicit constructor calls: - Superclass constructor
         *               calls (used to call a constructor from the direct superclass) that begin with the
         *               keyword super. - Other constructor calls that begin with the keyword this (used
         *               to call another same-class constructor).'
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 2
         */
        it("testExplicitConstructorCall0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

            let s: string = ''
            let a = new A27(
                (p: int) => [p, p > 0, '' + p],
                [127 as byte, -128 as byte],
                ['A', 'B'],
                (p: string) => [p, p, p],
                [1.0, 2.0, 3.0],
                () => { s = 'called' }
            )
        expect(a.p1()).assertEqual(43.0)
        expect(a.p2).assertEqual('abcdef')
            let tuple = a.p3(12)
        expect(tuple[0]).assertEqual(12)
        expect(tuple[1]).assertEqual(true)
        expect(tuple[2]).assertEqual('12')
        expect(a.p4[0]).assertEqual(127)
        expect(a.p4[1]).assertEqual(-128)
            let tuple2 = a.p5;
        expect(tuple2[0]).assertEqual('A')
        expect(tuple2[1]).assertEqual('B')
            let stringArray = a.p6('hello')
        expect(stringArray.every((e: string, i: int, a: Array<string>) => e == 'hello')).assertTrue();
            let doubleArray = a.p7!
        expect(doubleArray.every((e: double, i: int, a: Array<double>) => i + 1 == e)).assertTrue();
        a.p8!()
        expect(s).assertEqual('called')
        expect(a.p9!['2']).assertEqual(20)
        expect(a.p10).assertEqual(Color.Blue);
        });
        /**
         * @tc.number    SUB_EXPLICIT_CONSTRUCTOR_CALLTEST_2700
         * @tc.name      testExplicitConstructorCall0027
         * @tc.desc      There are two kinds of explicit constructor calls: - Superclass constructor
         *               calls (used to call a constructor from the direct superclass) that begin with the
         *               keyword super. - Other constructor calls that begin with the keyword this (used
         *               to call another same-class constructor).
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 2
         */
        it("testExplicitConstructorCall0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

            let s: string = ''
            let b = new B20(
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
        expect(b.p1()).assertEqual(42.0)
        expect(b.p2).assertEqual('abc')
            let tuple = b.p3(144)
        expect(tuple[0]).assertEqual(144)
        expect(tuple[1]).assertEqual(true)
        expect(tuple[2]).assertEqual('144')
        expect(b.p4[0]).assertEqual(127)
        expect(b.p4[1]).assertEqual(-128)
            let tuple2 = b.p5;
        expect(tuple2[0]).assertEqual('A')
        expect(tuple2[1]).assertEqual('B')
            let stringArray = b.p6('hello')
        expect(stringArray.every((e: string, i: int, a: Array<string>) => e == 'hello')).assertTrue();
            let doubleArray = b.p7!
        expect(doubleArray.every((e: double, i: int, a: Array<double>) => i + 1 == e)).assertTrue();
            b.p8!()
        expect(s).assertEqual('called')
            let rec: Record<string, int> = b.p9!
        expect(rec['2']).assertEqual(2)
        expect(b.p10!).assertEqual(Color.Blue);
        });
        /**
         * @tc.number    SUB_EXPLICIT_CONSTRUCTOR_CALLTEST_2800
         * @tc.name      testExplicitConstructorCall0028
         * @tc.desc      There are two kinds of explicit constructor calls: - Superclass constructor
         *               calls (used to call a constructor from the direct superclass) that begin with the
         *               keyword super. - Other constructor calls that begin with the keyword this (used
         *               to call another same-class constructor).
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 2
         */
        it("testExplicitConstructorCall0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

            let a = new A29(
                [() => 'abc']
            )
        expect(a.p1![0]()).assertEqual('abc')
        expect(a.p2.length).assertEqual(0)
        expect(a.p3).assertEqual(undefined)
        expect(a.p4['']).assertEqual(0)
        expect(a.p5).assertEqual(undefined)

            a = new A29(
                [() => 'abc'],
                [() => 1.0, () => 2.0, () => 3.0],
                ['abc', 3.5]
            )
        expect(a.p1![0]()).assertEqual('abc')
        expect(a.p2[0]()).assertEqual(1.0)
        expect(a.p2[1]()).assertEqual(2.0)
        expect(a.p2[2]()).assertEqual(3.0)
        expect(a.p3![0]).assertEqual('abc')
        expect(a.p3![1]).assertEqual(3.5)
        expect(a.p4['']).assertEqual(0)
        expect(a.p5).assertEqual(undefined)

            a = new A29(
                undefined,
                [],
                undefined,
                { '1': 1, '2': 2 },
                ['a', 'b', 'c']
            )
        expect(a.p1).assertEqual(undefined)
        expect(a.p2.length).assertEqual(0)
        expect(a.p3).assertEqual(undefined)
        expect(a.p4['1']).assertEqual(1)
        expect(a.p4['2']).assertEqual(2)
        expect(a.p5!.reduce((acc: string, curr: string) => acc + curr, '')).assertEqual('abc');
        });
        /**
         * @tc.number    SUB_EXPLICIT_CONSTRUCTOR_CALLTEST_2900
         * @tc.name      testExplicitConstructorCall0029
         * @tc.desc      There are two kinds of explicit constructor calls: - Superclass constructor
         *               calls (used to call a constructor from the direct superclass) that begin with the
         *               keyword super. - Other constructor calls that begin with the keyword this (used
         *               to call another same-class constructor).
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 2
         */
        it("testExplicitConstructorCall0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

            let a = new A30('a', 'b', 'c', 'd')
        expect(a.p1).assertEqual(undefined)
        expect(a.p2.length).assertEqual(0)
        expect(a.p3).assertEqual(undefined)
        expect(a.p4['']).assertEqual(0)
        expect(a.p5!.reduce((acc: string, curr: string) => acc + curr, '')).assertEqual('abcd');

        });
        /**
         * @tc.number    SUB_EXPLICIT_CONSTRUCTOR_CALLTEST_3000
         * @tc.name      testExplicitConstructorCall0030
         * @tc.desc      There are two kinds of explicit constructor calls: - Superclass constructor
         *               calls (used to call a constructor from the direct superclass) that begin with the
         *               keyword super. - Other constructor calls that begin with the keyword this (used
         *               to call another same-class constructor).
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 2
         */
        it("testExplicitConstructorCall0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

            let b = new B21('a', 'b', 'c', 'd')
        expect(b.p1).assertEqual(undefined)
        expect(b.p2.length).assertEqual(0)
        expect(b.p3).assertEqual(undefined)
        expect(b.p4['']).assertEqual(0)
        expect(b.p5!.reduce((acc: string, curr: string) => acc + curr, '')).assertEqual('abcd');
        });
        /**
         * @tc.number    SUB_EXPLICIT_CONSTRUCTOR_CALLTEST_3100
         * @tc.name      testExplicitConstructorCall0031
         * @tc.desc      There are two kinds of explicit constructor calls: - Superclass constructor
         *               calls (used to call a constructor from the direct superclass) that begin with the
         *               keyword super. - Other constructor calls that begin with the keyword this (used
         *               to call another same-class constructor).
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 2
         */
        it("testExplicitConstructorCall0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

            let b = new B22('a', 'b', 'c', 'd')
        expect(b.s[0]).assertEqual('aa')
        expect(b.s[1]).assertEqual('b')
        expect(b.s[2]).assertEqual('c')
        expect(b.s[3]).assertEqual('d')
        expect(b.s.length).assertEqual(4);
        });

        /**
         * @tc.number    SUB_EXPLICIT_CONSTRUCTOR_CALLTEST_3200
         * @tc.name      testExplicitConstructorCall0032
         * @tc.desc      Superclass constructor calls (used to call a direct superclass constructor),called Unqualified
         *               superclass constructor calls that start with the keyword super
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 2
         */
        it("testExplicitConstructorCall0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

            let i1: B23 = new B23();
        expect(i1.x).assertEqual(8)

            i1 = new B23(1.0f);
        expect(i1.x).assertEqual(4)
        });

        /**
         * @tc.number    SUB_EXPLICIT_CONSTRUCTOR_CALLTEST_3300
         * @tc.name      testExplicitConstructorCall0033
         * @tc.desc      Alternate constructor calls that begin with the keyword this
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 2
         */
        it("testExplicitConstructorCall0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

            let i1: A34 = new A34();
        expect(i1.x).assertEqual(8)

            i1 = new A34(new Error);
        expect(i1.x).assertEqual(3)
        });

    })
}
