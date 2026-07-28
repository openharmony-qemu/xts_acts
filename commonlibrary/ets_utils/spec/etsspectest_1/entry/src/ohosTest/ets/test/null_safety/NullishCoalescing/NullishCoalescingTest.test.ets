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

// Module: NullishCoalescing
// 空值合并 ?? 运算符：仅对 null/undefined 回退，对 falsy 值（0/""/false）保留原值。
// ECMA-262 NullishCoalescing §13.13.1 Nullish Coalescing Expression

function returnNull(): string | null {
  return null
}

function returnUndefined(): string | undefined {
  return undefined
}

let rhsCallCount: number = 0

function rhsFn(): number {
  rhsCallCount++
  return 99
}

class Obj {
}

export default function NullishCoalescingTest() {
  describe('NullishCoalescingTest', () => {
    beforeAll(() => {
    })
    beforeEach(() => {
    })
    afterEach(() => {
    })
    afterAll(() => {
    })

    /**
     * @tc.number    SUB_NULL_SAFETY_NULLISH_0100
     * @tc.name      testNullCoalescingNull0001
     * @tc.desc      Verify null ?? fallback returns fallback
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNullCoalescingNull0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(null ?? 'default').assertEqual('default')
    })

    /**
     * @tc.number    SUB_NULL_SAFETY_NULLISH_0200
     * @tc.name      testNullCoalescingUndefined0002
     * @tc.desc      Verify undefined ?? fallback returns fallback
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNullCoalescingUndefined0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(undefined ?? 42).assertEqual(42)
    })

    /**
     * @tc.number    SUB_NULL_SAFETY_NULLISH_0300
     * @tc.name      testNullCoalescingZeroPreserved0003
     * @tc.desc      Verify 0 ?? fallback preserves 0 (not nullish)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNullCoalescingZeroPreserved0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(0 ?? 'fallback').assertEqual(0)
    })

    /**
     * @tc.number    SUB_NULL_SAFETY_NULLISH_0400
     * @tc.name      testNullCoalescingEmptyStringPreserved0004
     * @tc.desc      Verify "" ?? fallback preserves empty string (not nullish)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNullCoalescingEmptyStringPreserved0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect('' ?? 'fallback').assertEqual('')
    })

    /**
     * @tc.number    SUB_NULL_SAFETY_NULLISH_0500
     * @tc.name      testNullCoalescingFalsePreserved0005
     * @tc.desc      Verify false ?? fallback preserves false (not nullish)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNullCoalescingFalsePreserved0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(false ?? 'fallback').assertEqual(false)
    })

    /**
     * @tc.number    SUB_NULL_SAFETY_NULLISH_0600
     * @tc.name      testNullishVsOrDifference0006
     * @tc.desc      Verify ?? differs from ||: ?? preserves falsy, || replaces them
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNullishVsOrDifference0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(0 ?? 'fallback').assertEqual(0)
      expect(0 || 'fallback').assertEqual('fallback')
      expect('' ?? 'fallback').assertEqual('')
      expect('' || 'fallback').assertEqual('fallback')
    })

    /**
     * @tc.number    SUB_NULL_SAFETY_NULLISH_0700
     * @tc.name      testNullCoalescingChained0007
     * @tc.desc      Verify null ?? undefined ?? 'default' chains through nullish values (ECMA-262 NullishCoalescing §13.13.1)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNullCoalescingChained0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(null ?? undefined ?? 'default').assertEqual('default')
    })

    /**
     * @tc.number    SUB_NULL_SAFETY_NULLISH_0800
     * @tc.name      testNullCoalescingNullNull0008
     * @tc.desc      Verify null ?? null results in null (ECMA-262 NullishCoalescing §13.13.1)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNullCoalescingNullNull0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(null ?? null).assertEqual(null)
    })

    /**
     * @tc.number    SUB_NULL_SAFETY_NULLISH_0900
     * @tc.name      testNullCoalescingFunctionChain0009
     * @tc.desc      Verify f() ?? g() ?? 'fallback' chains function calls (ECMA-262 NullishCoalescing §13.13.1)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNullCoalescingFunctionChain0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(returnNull() ?? returnUndefined() ?? 'fallback').assertEqual('fallback')
    })

    /**
     * @tc.number    SUB_NULL_SAFETY_NULLISH_1000
     * @tc.name      testNullCoalescingSideEffectRhs0010
     * @tc.desc      Verify ?? evaluates RHS only when LHS is nullish (ECMA-262 NullishCoalescing §13.13.1)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNullCoalescingSideEffectRhs0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      rhsCallCount = 0
      expect(null ?? rhsFn()).assertEqual(99)
      expect(rhsCallCount).assertEqual(1)
      rhsCallCount = 0
      expect(undefined ?? rhsFn()).assertEqual(99)
      expect(rhsCallCount).assertEqual(1)
      rhsCallCount = 0
      expect(0 ?? rhsFn()).assertEqual(0)
      expect(rhsCallCount).assertEqual(0)
      rhsCallCount = 0
      expect('' ?? rhsFn()).assertEqual('')
      expect(rhsCallCount).assertEqual(0)
      rhsCallCount = 0
      let nan: number = NaN
      let lhsVal: number = nan ?? rhsFn()
      let rhsVal: number = nan ?? rhsFn()
      expect(lhsVal !== rhsVal).assertTrue()
      expect(rhsCallCount).assertEqual(0)
      rhsCallCount = 0
      expect(false ?? rhsFn()).assertEqual(false)
      expect(rhsCallCount).assertEqual(0)
      rhsCallCount = 0
      let o: Obj | null = new Obj()
      expect((o ?? rhsFn()) === o).assertTrue()
      expect(rhsCallCount).assertEqual(0)
    })

    /**
     * @tc.number    SUB_NULL_SAFETY_NULLISH_1100
     * @tc.name      testNullCoalescingNaNPreserved0011
     * @tc.desc      Verify NaN ?? fallback preserves NaN (NaN is not nullish, ECMA-262 NullishCoalescing §13.13.1)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNullCoalescingNaNPreserved0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let nan: number = NaN
      let result: number = nan ?? 42
      expect(result !== result).assertTrue()
    })

    /**
     * @tc.number    SUB_NULL_SAFETY_NULLISH_1200
     * @tc.name      testNullCoalescingOrPriority0012
     * @tc.desc      Verify null || (undefined ?? 'ok') returns 'ok' (??优先级高于||, ECMA-262 §13.12.3)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNullCoalescingOrPriority0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(null || (undefined ?? 'ok')).assertEqual('ok')
    })

    /**
     * @tc.number    SUB_NULL_SAFETY_NULLISH_1300
     * @tc.name      testNullCoalescingParenGroup0013
     * @tc.desc      Verify (null ?? 1) || 2 returns 1 (括号改变??与||的优先级, ECMA-262 §13.12.3)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNullCoalescingParenGroup0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect((null ?? 1) || 2).assertEqual(1)
    })
  })
}
