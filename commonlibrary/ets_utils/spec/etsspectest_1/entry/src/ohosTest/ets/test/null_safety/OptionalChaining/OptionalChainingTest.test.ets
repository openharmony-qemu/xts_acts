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
  getNullBoxValue,
  getNullGreeterGreet,
  getNullArrayFirst,
  getNullComputedProp,
  getNullOptionalCall,
  getNullPropWithCoalescing,
  getShortCircuitResult,
  getNonShortCircuitResult,
  getNullComputedPropWithCounter,
  getNonNullComputedPropWithCounter,
  getNullOptionalCallWithCounter,
  getNonNullOptionalCallWithCounter,
  getKeyedValueOnNull,
  getKeyedValueOnNonNull,
  getMidNullValue,
  getGetterNullValue
} from './OptionalChainingHelper.js'

interface Box {
  value: number
}

class Greeter {
  greet(): string {
    return 'hello'
  }
}

export default function OptionalChainingTest() {
  describe('OptionalChainingTest', () => {
    beforeAll(() => {
    })
    beforeEach(() => {
    })
    afterEach(() => {
    })
    afterAll(() => {
    })

    /**
     * @tc.number    SUB_NULL_SAFETY_OPT_CHAIN_0100
     * @tc.name      testOptionalChainingPropertyNonNull0001
     * @tc.desc      Verify obj?.prop returns property value when obj is non-null
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testOptionalChainingPropertyNonNull0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let obj: Box | null = { value: 42 }
      expect(obj?.value).assertEqual(42)
    })

    /**
     * @tc.number    SUB_NULL_SAFETY_OPT_CHAIN_0200
     * @tc.name      testOptionalChainingPropertyNull0002
     * @tc.desc      Verify obj?.prop returns undefined when obj is null [ArkTS-COMPILE-LIMIT: null narrowing]
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testOptionalChainingPropertyNull0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(getNullBoxValue()).assertEqual(undefined)
    })

    /**
     * @tc.number    SUB_NULL_SAFETY_OPT_CHAIN_0300
     * @tc.name      testOptionalChainingMethodCall0003
     * @tc.desc      Verify obj?.method() calls method when non-null, returns undefined when null
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testOptionalChainingMethodCall0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let g: Greeter | null = new Greeter()
      expect(g?.greet()).assertEqual('hello')

      expect(getNullGreeterGreet()).assertEqual(undefined)
    })

    /**
     * @tc.number    SUB_NULL_SAFETY_OPT_CHAIN_0400
     * @tc.name      testOptionalChainingElementAccess0004
     * @tc.desc      Verify arr?.[index] returns element or undefined when arr is null [ArkTS-COMPILE-LIMIT: indexed access]
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testOptionalChainingElementAccess0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let arr: number[] | null = [10, 20, 30]
      expect(arr?.[0]).assertEqual(10)
      expect(arr?.[2]).assertEqual(30)
      expect(getNullArrayFirst()).assertEqual(undefined)
    })

    /**
     * @tc.number    SUB_NULL_SAFETY_OPT_CHAIN_0500
     * @tc.name      testOptionalChainingShortCircuit0005
     * @tc.desc      Verify null short-circuits subsequent chain members [ArkTS-COMPILE-LIMIT: nested func + narrowing]
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testOptionalChainingShortCircuit0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let r = getShortCircuitResult()
      expect(r.result).assertEqual(undefined)
      expect(r.count).assertEqual(0)
    })

    /**
     * @tc.number    SUB_NULL_SAFETY_OPT_CHAIN_0600
     * @tc.name      testOptionalChainingNoShortCircuitOnNonNull0006
     * @tc.desc      Verify chain evaluates when base is non-null (counter increments)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testOptionalChainingNoShortCircuitOnNonNull0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let r = getNonShortCircuitResult()
      expect(r.result).assertEqual(99)
      expect(r.count).assertEqual(1)
    })

    /**
     * @tc.number    SUB_NULL_SAFETY_OPT_CHAIN_0700
     * @tc.name      testOptionalChainingComputedProperty0007
     * @tc.desc      Verify obj?.['prop'] returns undefined when obj is null (ECMA-262 OptionalChain §13.3.9)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testOptionalChainingComputedProperty0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(getNullComputedProp()).assertEqual(undefined)
    })

    /**
     * @tc.number    SUB_NULL_SAFETY_OPT_CHAIN_0800
     * @tc.name      testOptionalFunctionCall0008
     * @tc.desc      Verify obj?.() returns undefined when obj is null (ECMA-262 OptionalChain §13.3.9)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testOptionalFunctionCall0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(getNullOptionalCall()).assertEqual(undefined)
    })

    /**
     * @tc.number    SUB_NULL_SAFETY_OPT_CHAIN_0900
     * @tc.name      testOptionalChainWithNullishCoalescing0009
     * @tc.desc      Verify obj?.prop ?? 'default' returns default when obj is null (ECMA-262 OptionalChain §13.3.9, NullishCoalescing §13.13.1)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testOptionalChainWithNullishCoalescing0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(getNullPropWithCoalescing()).assertEqual(42)
    })

    /**
     * @tc.number    SUB_NULL_SAFETY_OPT_CHAIN_1000
     * @tc.name      testOptionalComputedKeySideEffect0010
     * @tc.desc      Verify computed key expression skipped when null, evaluated when non-null (ECMA-262 §13.3.9)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testOptionalComputedKeySideEffect0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let r1 = getNullComputedPropWithCounter()
      expect(r1.result).assertEqual(undefined)
      expect(r1.count).assertEqual(0)
      let r2 = getNonNullComputedPropWithCounter()
      expect(r2.result).assertEqual(42)
      expect(r2.count).assertEqual(1)
    })

    /**
     * @tc.number    SUB_NULL_SAFETY_OPT_CHAIN_1100
     * @tc.name      testOptionalCallArgSideEffect0011
     * @tc.desc      Verify optional call argument expression skipped when null (ECMA-262 §13.3.9)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testOptionalCallArgSideEffect0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let r1 = getNullOptionalCallWithCounter()
      expect(r1.result).assertEqual(undefined)
      expect(r1.count).assertEqual(0)
      let r2 = getNonNullOptionalCallWithCounter()
      expect(r2.result).assertEqual(0)
      expect(r2.count).assertEqual(1)
    })

    /**
     * @tc.number    SUB_NULL_SAFETY_OPT_CHAIN_1200
     * @tc.name      testOptionalChainKeyFunction0012
     * @tc.desc      Verify obj?.[key()] evaluates key only when base is non-null (ECMA-262 OptionalChain §13.3.9)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testOptionalChainKeyFunction0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let r1 = getKeyedValueOnNonNull()
      expect(r1.result).assertEqual(42)
      expect(r1.count).assertEqual(1)
      let r2 = getKeyedValueOnNull()
      expect(r2.result).assertEqual(undefined)
      expect(r2.count).assertEqual(0)
    })

    /**
     * @tc.number    SUB_NULL_SAFETY_OPT_CHAIN_1300
     * @tc.name      testOptionalChainMiddleNullUndefined0013
     * @tc.desc      Verify short-circuit when middle node is null or undefined (ECMA-262 OptionalChain §13.3.9)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testOptionalChainMiddleNullUndefined0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(getMidNullValue()).assertEqual(undefined)
    })

    /**
     * @tc.number    SUB_NULL_SAFETY_OPT_CHAIN_1400
     * @tc.name      testOptionalChainGetterNull0014
     * @tc.desc      Verify optional chain after getter returns null (ECMA-262 OptionalChain §13.3.9)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testOptionalChainGetterNull0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(getGetterNullValue()).assertEqual(undefined)
    })
  })
}
