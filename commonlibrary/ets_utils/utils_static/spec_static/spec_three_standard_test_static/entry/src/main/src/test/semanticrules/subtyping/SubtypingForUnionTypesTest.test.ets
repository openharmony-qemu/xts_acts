'use static';
/*
 * Copyright (C) 2025-2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License')
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '../../../../../hypium/index';

let a1: string | number | boolean = 'abc'
let b1: string | number = 42

class Base2 {}
class Derived2 extends Base2 {}
let x2: Base2 | string = new Base2
const y2: Derived2 | string = 'just a test'

let u3: number | string = 1

let a4: '1' | '2' = '1'

let u5: 'abc' | 'cde' | string

let ab6: Array<'a'>|Array<'b'> = ['a', 'a', 'a']
const a6: Array<'a'> = ['a', 'a']

class A7 {}
class B7 extends A7 {}
class C7 {}
let ac7: Array<A7>|Array<C7> = [new A7, new B7]
let b7: Array<B7> = [new B7, new B7]

enum Color9 { Red, Green, Blue }
type WithEnum9 = Color9|String|Number
let v9: WithEnum9 = Color9.Green

class A10 {}
class B10 {}
class C10 extends A10 {}
class D10 extends B10 {}
class E10 {}
let cd10: C10|D10 = new C10

class A11 {}
class B11 {}
class E11 {}
class C11 extends A11 {}
class D11 extends B11 {}
class F11 extends E11 {}
let cdf11: C11|D11|F11 = new F11

class A12 {}
class B12 {}
class C12 extends A12 {}
class D12 extends B12 {}
class F12 extends D12 {}
let cdf12: C12|D12|F12 = new F12

export default function SubtypingForUnionTypesTest(): void {
  describe('SubtypingForUnionTypesTest', () => {
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })

    beforeEach(() => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })

    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })

    afterAll(() => {
      // Presets an action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: preset action function.
    })

    /**
     * @tc.number    SUB_SUBTYPING_FOR_UNION_TYPES_0100
     * @tc.name      testPositive0001
     * @tc.desc      Union type U (U1 | ... | Un) is a subtype of union type V (V1 | ... | Vm) if
     *               there is at least one type Vj (i in 1..m) for every type Ui (i in 1..n), i.e.,
     *               Ui is a subtype of Vj (see Subtyping).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPositive0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      a1 = 'abc'
      b1 = 42
      expect(a1 instanceof String).assertTrue()
      a1 = b1
      expect(a1 instanceof Number).assertTrue()
    });

    /**
     * @tc.number    SUB_SUBTYPING_FOR_UNION_TYPES_0200
     * @tc.name      testPositive0002
     * @tc.desc      Union type U (U1 | ... | Un) is a subtype of union type V (V1 | ... | Vm) if
     *               there is at least one type Vj (i in 1..m) for every type Ui (i in 1..n), i.e.,
     *               Ui is a subtype of Vj (see Subtyping).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPositive0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      x2 = new Base2
      expect(x2 instanceof Base2).assertTrue()
      x2 = y2
      expect(x2 instanceof String).assertTrue()
    });

    /**
     * @tc.number    SUB_SUBTYPING_FOR_UNION_TYPES_0300
     * @tc.name      testPositive0003
     * @tc.desc      Non-union type T is a subtype of union type U (U1 | ... | Un) if T is assignable to a type of Ui
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPositive0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      u3 = 'aa'
      expect(u3 instanceof String).assertTrue()
      u3 = 1
      expect(u3 instanceof Number).assertTrue()
    });

    /**
     * @tc.number    SUB_SUBTYPING_FOR_UNION_TYPES_0400
     * @tc.name      testPositive0004
     * @tc.desc      Non-union type T is a subtype of union type U (U1 | ... | Un) if T is assignable to a type of Ui
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPositive0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      expect(a4 instanceof String).assertTrue()
      let b4: string = a4
      expect(b4 instanceof String).assertTrue()
    });

    /**
     * @tc.number    SUB_SUBTYPING_FOR_UNION_TYPES_0500
     * @tc.name      testPositive0005
     * @tc.desc      If union type normalization produces a single type, then this
     *               type is used instead of the initial set of union types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPositive0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      u5 = 'xyz'
      expect(u5 instanceof String).assertTrue()
    });

    /**
     * @tc.number    SUB_SUBTYPING_FOR_UNION_TYPES_0600
     * @tc.name      testPositive0006
     * @tc.desc      unions of fixed arrays subtyping
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPositive0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      ab6 = a6
      expect(ab6 instanceof Array).assertTrue()
    });

    /**
     * @tc.number    SUB_SUBTYPING_FOR_UNION_TYPES_0700
     * @tc.name      testPositive0007
     * @tc.desc      unions of fixed arrays subtyping
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPositive0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      expect(b7 instanceof Array).assertTrue()
      ac7 = b7 as Array<A7> | Array<C7>
      expect(ac7 instanceof Array).assertTrue()
    });

    /**
     * @tc.number    SUB_SUBTYPING_FOR_UNION_TYPES_0900
     * @tc.name      testPositive0009
     * @tc.desc      unions of fixed arrays subtyping
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPositive0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      v9 = Color9.Green
      expect(v9 instanceof Color9).assertTrue()
      v9 = 'a'
      expect(v9 instanceof String).assertTrue()
      v9 = 1.0
      expect(v9 instanceof Number).assertTrue()

    });

    /**
     * @tc.number    SUB_SUBTYPING_FOR_UNION_TYPES_1000
     * @tc.name      testPositive0010
     * @tc.desc      unions of fixed arrays subtyping
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPositive0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let abe10: A10|B10|E10 =  new E10
      expect(abe10 instanceof E10).assertTrue()
      abe10 = cd10
      expect(abe10 instanceof C10).assertTrue()
    });

    /**
     * @tc.number    SUB_SUBTYPING_FOR_UNION_TYPES_1100
     * @tc.name      testPositive0011
     * @tc.desc      subtyping between unions
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPositive0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let abe11: A11|B11|E11 =  new E11
      expect(abe11 instanceof E11).assertTrue()
      abe11 = cdf11
      expect(abe11 instanceof F11).assertTrue()
    });

    /**
     * @tc.number    SUB_SUBTYPING_FOR_UNION_TYPES_1200
     * @tc.name      testPositive0012
     * @tc.desc      subtyping between unions
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPositive0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let ab12: A12|B12 =  new B12
      expect(ab12 instanceof B12).assertTrue()
      ab12 = cdf12
      expect(ab12 instanceof F12).assertTrue()
    });
  })
}
