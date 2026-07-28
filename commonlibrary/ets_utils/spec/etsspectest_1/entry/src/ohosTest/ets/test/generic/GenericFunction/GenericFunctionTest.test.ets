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

class Box<T> {
  value: T

  constructor(value: T) {
    this.value = value
  }
}

class Pair<A, B> {
  first: A
  second: B

  constructor(first: A, second: B) {
    this.first = first
    this.second = second
  }
}

function myIdentity<T>(value: T): T {
  return value
}

function makePair<K, V>(k: K, v: V): Pair<K, V> {
  return new Pair<K, V>(k, v)
}

type IdentityFn<T> = (x: T) => T

function polyIdentity<T>(x: T): T {
  return x
}

const arrowIdentity = <T>(x: T): T => {
  return x
}

function apply<T, R>(value: T, fn: (x: T) => R): R {
  return fn(value)
}

function collect<T>(...items: T[]): T[] {
  return items
}

class Wraps<T> {
  val: T
  label: string

  constructor(val: T, label: string) {
    this.val = val
    this.label = label
  }
}

function wrap<T>(value: T, label: string = 'default'): Wraps<T> {
  return new Wraps<T>(value, label)
}

async function fetchVal<T>(v: T): Promise<T> {
  return v
}

function square(x: number): number {
  return x * x
}

export default function GenericFunctionTest() {
  describe('GenericFunctionTest', () => {
    beforeAll(() => {
    })
    beforeEach(async () => {
    })
    afterEach(() => {
    })
    afterAll(() => {
    })

    /**
     * @tc.number    SUB_GENERIC_GF_FUNCTION_0100
     * @tc.name      testgeneric0001
     * @tc.desc      Verify identity generic function preserves parameter and value types (GTP-GF-001)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testIdentityPreservesType0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(myIdentity<number>(42)).assertEqual(42)
    })

    /**
     * @tc.number    SUB_GENERIC_GF_FUNCTION_0200
     * @tc.name      testgeneric0002
     * @tc.desc      Verify explicit type argument invocation (GTP-GF-002)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testExplicitTypeArg0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(myIdentity<string>('hello')).assertEqual('hello')
    })

    /**
     * @tc.number    SUB_GENERIC_GF_FUNCTION_0300
     * @tc.name      testgeneric0003
     * @tc.desc      Verify type argument inferred from single value parameter (GTP-GF-003)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testInferredTypeArg0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(myIdentity(42)).assertEqual(42)
    })

    /**
     * @tc.number    SUB_GENERIC_GF_FUNCTION_0400
     * @tc.name      testgeneric0004
     * @tc.desc      Verify generic function with multiple type parameters (GTP-GF-004)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testMultiTypeParam0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const p = makePair<number, string>(1, 'a')
      expect(p.first).assertEqual(1)
      expect(p.second).assertEqual('a')
    })

    /**
     * @tc.number    SUB_GENERIC_GF_FUNCTION_0500
     * @tc.name      testgeneric0005
     * @tc.desc      Verify generic function assigned to generic function type alias (GTP-GF-005). Named type alias IdentityFn<T> supported in .ets.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testFunctionTypeAlias0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const fn: IdentityFn<number> = myIdentity
      expect(fn(42)).assertEqual(42)
    })

    /**
     * @tc.number    SUB_GENERIC_GF_FUNCTION_0600
     * @tc.name      testgeneric0006
     * @tc.desc      Verify named generic function invocation with inferred type argument (GTP-GF-005). polyIdentity declared in .ets compiles and runs.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNamedGenericFnInferred0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(polyIdentity(42)).assertEqual(42)
    })

    /**
     * @tc.number    SUB_GENERIC_GF_FUNCTION_0700
     * @tc.name      testgeneric0007
     * @tc.desc      Verify higher-order generic function receives and invokes callback (GTP-GF-006)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testHigherOrderGenericFn0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(apply<number, number>(6, square)).assertEqual(36)
    })

    /**
     * @tc.number    SUB_GENERIC_GF_FUNCTION_0800
     * @tc.name      testgeneric0008
     * @tc.desc      Verify rest parameter with type parameter (GTP-GF-007)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testRestParamTypeParam0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = collect<number>(1, 2, 3)
      expect(arr.length).assertEqual(3)
      expect(arr[0]).assertEqual(1)
      expect(arr[2]).assertEqual(3)
    })

    /**
     * @tc.number    SUB_GENERIC_GF_FUNCTION_0900
     * @tc.name      testgeneric0009
     * @tc.desc      Verify optional/default value parameter combined with generic (GTP-GF-008)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testOptionalDefaultParam0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const w1 = wrap<number>(42)
      expect(w1.label).assertEqual('default')
    })

    /**
     * @tc.number    SUB_GENERIC_GF_FUNCTION_1000
     * @tc.name      testgeneric0010
     * @tc.desc      Verify optional parameter with explicit value combined with generic (GTP-GF-008)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testExplicitOptionalParam0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const w2 = wrap<string>('x', 'tag')
      expect(w2.label).assertEqual('tag')
    })

    /**
     * @tc.number    SUB_GENERIC_GF_FUNCTION_1100
     * @tc.name      testgeneric0011
     * @tc.desc      Verify async generic function returning Promise<T> (GTP-GF-009).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testAsyncGenericFn0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const r = await fetchVal<number>(42)
      expect(r).assertEqual(42)
    })


    /**
     * @tc.number    SUB_GENERIC_GF_FUNCTION_1200
     * @tc.name      testgeneric0012
     * @tc.desc      Verify generic arrow function support (GTP-GF-011). Verified: ArkTS 1.1 (DevEco 6.1.1) supports generic arrow `<T>(x:T)=>x`; GF-011 reclassified from fail_compile to boundary (passed).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrowGenericFn0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(arrowIdentity<number>(42)).assertEqual(42)
    })

  })
}
