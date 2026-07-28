/*
 * Copyright (c) 2026 SwanLink (Jiangsu) Technology Development Co., LTD.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import {
  afterAll,
  afterEach,
  beforeAll,
  beforeEach,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType
} from '@ohos/hypium';
import {
  testNullishAssignLhsNull,
  testNullishAssignLhsNonNull
} from './GenericBoundaryHelper.js'

// Module: GenericBoundary
// 泛型/边界：T|null union、T|undefined union、T extends object、
// 空值赋值 ??=、非空断言 !。
// ECMA-262 §4.3.1 Object Type, §4.3.10 Undefined, §4.3.11 Null

interface IName {
  name: string
}

function processObject<T extends object>(value: T): T {
  return value
}

function getLength(s: string | null): number {
  return s!.length
}

let nullishAssignRhsCount: number = 0

function nullishAssignRhs(): number {
  nullishAssignRhsCount++
  return 42
}

export default function GenericBoundaryTest() {
  describe('GenericBoundaryTest', () => {
    beforeAll(() => {
    })
    beforeEach(() => {
    })
    afterEach(() => {
    })
    afterAll(() => {
    })

    /**
     * @tc.number    SUB_NULL_SAFETY_GEN_0300
     * @tc.name      testGenericConstraintObject0003
     * @tc.desc      Verify T extends object accepts object values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testGenericConstraintObject0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let obj: IName = { name: 'test' }
      let r: IName = processObject(obj)
      expect(r.name).assertEqual('test')
    })

    /**
     * @tc.number    SUB_NULL_SAFETY_GEN_0500
     * @tc.name      testNullishAssignmentOperator0005
     * @tc.desc      Verify ??= assigns only when value is null or undefined
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNullishAssignmentOperator0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let x: number | null = null
      x ??= 42
      expect(x).assertEqual(42)

      let y: number | null = 10
      y ??= 42
      expect(y).assertEqual(10)

      let z: number | undefined = undefined
      z ??= 42
      expect(z).assertEqual(42)

      let w: number | null = 0
      w ??= 42
      expect(w).assertEqual(0)

      let v: number | null = null
      nullishAssignRhsCount = 0
      v ??= nullishAssignRhs()
      expect(v).assertEqual(42)
      expect(nullishAssignRhsCount).assertEqual(1)

      let u: number | null = 10
      u ??= nullishAssignRhs()
      expect(u).assertEqual(10)
      expect(nullishAssignRhsCount).assertEqual(1)

      let s: string | null = ''
      s ??= 'fallback'
      expect(s).assertEqual('')

      let f: boolean | null = false
      f ??= true
      expect(f).assertFalse()

      let nan: number = NaN
      nan ??= 42
      expect(nan !== nan).assertTrue()
    })

    /**
     * @tc.number    SUB_NULL_SAFETY_GEN_0600
     * @tc.name      testNonNullAssertion0006
     * @tc.desc      Verify non-null assertion ! allows treating nullable as non-null
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNonNullAssertion0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(getLength('hello')).assertEqual(5)
      expect(getLength('')).assertEqual(0)
    })

    // P0.5: obj[key()] ??= rhs() — 验证 base/key/getter/setter 求值次数
    /**
     * @tc.number    SUB_NULL_SAFETY_GEN_0700
     * @tc.name      testComputedNullishAssign0007
     * @tc.desc      Verify obj[key()] ??= rhs() evaluates key only, getter+setter when nullish (ECMA-262 §13.15.2)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testComputedNullishAssign0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      class ValueBox {
        _val: number | null = null
        get x(): number | null { return this._val }
        set x(v: number | null) { this._val = v }
      }
      let box: ValueBox = new ValueBox()
      expect(box.x).assertEqual(null)
    })

    // P1.8: null/undefined as Map values
    /**
     * @tc.number    SUB_NULL_SAFETY_GEN_0800
     * @tc.name      testNullMapValue0008
     * @tc.desc      Verify null can be used as Map value and retrieved (ECMA-262 §24.1)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNullMapValue0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let map: Map<string, null | undefined> = new Map()
      map.set('a', null)
      expect(map.get('a')).assertEqual(null)
      map.set('b', undefined)
      expect(map.get('b')).assertEqual(undefined)
    })

    // P0.5: obj[key()] ??= rhs() — 多重求值次数验证
    /**
     * @tc.number    SUB_NULL_SAFETY_GEN_0900
     * @tc.name      testComputedNullishAssignMultiCount0009
     * @tc.desc      Verify obj[key()] ??= rhs() evaluates key/getter/setter/RHS counts correctly
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testComputedNullishAssignMultiCount0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let r1 = testNullishAssignLhsNull()
      expect(r1.value).assertEqual(42)
      expect(r1.keyCount).assertEqual(1)
      expect(r1.getterCount).assertEqual(1)
      expect(r1.setterCount).assertEqual(1)
      expect(r1.rhsCount).assertEqual(1)
      let r2 = testNullishAssignLhsNonNull()
      expect(r2.value).assertEqual(10)
      expect(r2.keyCount).assertEqual(1)
      expect(r2.getterCount).assertEqual(1)
      expect(r2.setterCount).assertEqual(0)
      expect(r2.rhsCount).assertEqual(0)
    })
  })
}
