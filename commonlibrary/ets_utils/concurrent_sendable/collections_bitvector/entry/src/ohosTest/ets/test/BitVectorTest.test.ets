/*
 * Copyright (c) 2026 RKH Corp.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { collections, ArkTSUtils } from '@kit.ArkTS';
import taskpool from '@ohos.taskpool';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { sleep } from './Utils';

@Concurrent
function countBitsFunc(bv: collections.BitVector): number {
  return bv.getBitCountByRange(1, 0, bv.length)
}

@Concurrent
function modifyBitVectorFunc(bv: collections.BitVector): void {
  bv.flipBitByIndex(0)
  bv.push(1)
}

@Concurrent
async function concurrentPushFunc(bv: collections.BitVector, lock: ArkTSUtils.locks.AsyncLock): Promise<void> {
  await lock.lockAsync<void>(() => {
    bv.push(1)
  })
}

@Sendable
class MyBitVector extends collections.BitVector {
  constructor(length: number) {
    super(length)
  }
  countOnes(): number {
    return this.getBitCountByRange(1, 0, this.length)
  }
}

export default function BitVectorTest(): void {
  describe('BitVectorTest', (): void => {
    beforeAll(async (): Promise<void> => {
    await sleep(200);
  })
    beforeEach((): void => {})
    afterEach((): void => {})
    afterAll(async (): Promise<void> => {
      await sleep(100)
    })

    // ===== Constructor Tests =====

    // ===== Property Tests =====

    // ===== push Tests =====

    // ===== pop Tests =====

    // ===== has Tests =====

    // ===== setBitsByRange Tests =====

    // ===== setAllBits Tests =====

    // ===== getBitsByRange Tests =====

    // ===== resize Tests =====

    /**
     * @tc.name   BitVectorTest4300
     * @tc.number SUB_COLLECTIONS_BITVECTOR_TEST_ONE_4300
     * @tc.desc   Verify BitVector resize expand to larger size with zeros
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BitVectorTest4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let bv = new collections.BitVector(16)
      bv.resize(32)
      expect(bv.length).assertEqual(32)
      for (let i = 16; i < 32; i++) {
        expect(bv[i]).assertEqual(0)
      }
    })

    /**
     * @tc.name   BitVectorTest4400
     * @tc.number SUB_COLLECTIONS_BITVECTOR_TEST_ONE_4400
     * @tc.desc   Verify BitVector resize shrink to smaller size
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BitVectorTest4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let bv = new collections.BitVector(16)
      bv.resize(8)
      expect(bv.length).assertEqual(8)
    })

    /**
     * @tc.name   BitVectorTest4500
     * @tc.number SUB_COLLECTIONS_BITVECTOR_TEST_ONE_4500
     * @tc.desc   Verify BitVector resize to 0 results in empty BitVector
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BitVectorTest4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let bv = new collections.BitVector(16)
      bv.resize(0)
      expect(bv.length).assertEqual(0)
    })

    /**
     * @tc.name   BitVectorTest4600
     * @tc.number SUB_COLLECTIONS_BITVECTOR_TEST_ONE_4600
     * @tc.desc   Verify BitVector resize returns void and throws error for negative value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BitVectorTest4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let bv = new collections.BitVector(16)
      let result = bv.resize(32)
      expect(result).assertUndefined()
      try {
        bv.resize(-1)
        expect().assertFail()
      } catch (e) {
        expect(e.code).assertEqual(10200001)
      }
    })

    /**
     * @tc.name   BitVectorTest4700
     * @tc.number SUB_COLLECTIONS_BITVECTOR_TEST_ONE_4700
     * @tc.desc   Verify BitVector resize preserves existing data after expand and shrink
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BitVectorTest4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let bv = new collections.BitVector(8)
      bv[0] = 1
      bv[5] = 1
      bv.resize(16)
      expect(bv[0]).assertEqual(1)
      expect(bv[5]).assertEqual(1)
      bv.resize(4)
      expect(bv[0]).assertEqual(1)
    })

    // ===== getBitCountByRange Tests =====

    // ===== getIndexOf Tests =====

    // ===== getLastIndexOf Tests =====

    // ===== flipBitByIndex Tests =====

    // ===== flipBitsByRange Tests =====

    // ===== values Tests =====

    /**
     * @tc.name   BitVectorTest6400
     * @tc.number SUB_COLLECTIONS_BITVECTOR_TEST_ONE_6400
     * @tc.desc   Verify BitVector values returns iterator with correct first element
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BitVectorTest6400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let bv = new collections.BitVector(8)
      bv[0] = 1
      let iter = bv.values()
      let first = iter.next()
      expect(first.value).assertEqual(1)
      expect(first.done).assertFalse()
    })

    /**
     * @tc.name   BitVectorTest6500
     * @tc.number SUB_COLLECTIONS_BITVECTOR_TEST_ONE_6500
     * @tc.desc   Verify BitVector values iterator traversal covers all elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BitVectorTest6500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let bv = new collections.BitVector(8)
      let count = 0
      let iter = bv.values()
      let temp = iter.next()
      while (!temp.done) {
        count++
        temp = iter.next()
      }
      expect(count).assertEqual(8)
    })

    // ===== Index Accessor Tests =====

    // ===== Concurrent Tests =====

    /**
     * @tc.name   BitVectorTest6900
     * @tc.number SUB_COLLECTIONS_BITVECTOR_TEST_ONE_6900
     * @tc.desc   Verify BitVector as Sendable passed to TaskPool and processed correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('BitVectorTest6900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let bv = new collections.BitVector(16)
      bv.setBitsByRange(1, 0, 8)
      let task = new taskpool.Task(countBitsFunc, bv)
      let result = await taskpool.execute(task)
      expect(result as number).assertEqual(8)
    })

    /**
     * @tc.name   BitVectorTest7000
     * @tc.number SUB_COLLECTIONS_BITVECTOR_TEST_ONE_7000
     * @tc.desc   Verify BitVector modified in TaskPool task reflects changes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('BitVectorTest7000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let bv = new collections.BitVector(16)
      bv[0] = 0
      let task = new taskpool.Task(modifyBitVectorFunc, bv)
      await taskpool.execute(task)
      expect(bv[0]).assertEqual(1)
      expect(bv.length).assertEqual(17)
    })

    /**
     * @tc.name   BitVectorTest7100
     * @tc.number SUB_COLLECTIONS_BITVECTOR_TEST_ONE_7100
     * @tc.desc   Verify BitVector concurrent push by multiple TaskPool tasks completes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('BitVectorTest7100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let bv = new collections.BitVector(16)
      let lock = new ArkTSUtils.locks.AsyncLock()
      let task1 = new taskpool.Task(concurrentPushFunc, bv, lock)
      let task2 = new taskpool.Task(concurrentPushFunc, bv, lock)
      let p1 = taskpool.execute(task1)
      let p2 = taskpool.execute(task2)
      await Promise.all([p1, p2])
      expect(bv.length).assertEqual(18)
    })

    // ===== Inheritance Tests =====

    /**
     * @tc.name   BitVectorTest7200
     * @tc.number SUB_COLLECTIONS_BITVECTOR_TEST_ONE_7200
     * @tc.desc   Verify custom Sendable class extending BitVector works correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BitVectorTest7200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let bv = new MyBitVector(16)
      bv.setBitsByRange(1, 0, 8)
      expect(bv.countOnes()).assertEqual(8)
      expect(bv instanceof collections.BitVector).assertTrue()
    })

    /**
     * @tc.name   BitVectorTest7300
     * @tc.number SUB_COLLECTIONS_BITVECTOR_TEST_ONE_7300
     * @tc.desc   Verify BitVector instanceof and typeof type checks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BitVectorTest7300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let bv = new collections.BitVector(16)
      expect(bv instanceof collections.BitVector).assertTrue()
      expect(typeof bv).assertEqual("object")
    })

    /**
     * @tc.number  SUB_BITVECTOR_COMBO_ONE_0100
     * @tc.name    testBitVectorCombo0001
     * @tc.desc    Verify flipBitByIndex then getIndexOf
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 2
     */
    it('testBitVectorCombo0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let bv = new collections.BitVector(4);
      bv.flipBitByIndex(2);
      expect(bv.getIndexOf(1, 0, 4)).assertEqual(2);
    });

    /**
     * @tc.number  SUB_BITVECTOR_COMBO_ONE_0200
     * @tc.name    testBitVectorCombo0002
     * @tc.desc    Verify flipBitByIndex then has
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 2
     */
    it('testBitVectorCombo0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let bv = new collections.BitVector(4);
      bv.flipBitByIndex(1);
      expect(bv.has(1, 0, 4)).assertTrue();
      expect(bv.has(0, 0, 4)).assertTrue();
    });

    /**
     * @tc.number  SUB_BITVECTOR_COMBO_ONE_0300
     * @tc.name    testBitVectorCombo0003
     * @tc.desc    Verify multi-layer sub-vector independence
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 2
     */
    it('testBitVectorCombo0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let bv = new collections.BitVector(4);
      bv[1] = 1;
      bv[3] = 1;
      bv.setAllBits(1);
      let sub = bv.getBitsByRange(0, 4);
      sub.setAllBits(0);
      sub.flipBitsByRange(0, 2);
      expect(sub[0]).assertEqual(1);
      expect(sub[1]).assertEqual(1);
      expect(sub[2]).assertEqual(0);
      expect(bv.getBitCountByRange(1, 0, 4)).assertEqual(4);
    });

    /**
     * @tc.number  SUB_BITVECTOR_COMBO_ONE_0400
     * @tc.name    testBitVectorCombo0004
     * @tc.desc    Verify cross-word sub-vector operation
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 2
     */
    it('testBitVectorCombo0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let bv = new collections.BitVector(0);
      for (let i = 0; i < 129; i++) {
        bv.push(0);
      }
      let sub = bv.getBitsByRange(60, 70);
      sub.flipBitsByRange(0, 5);
      expect(sub.getBitCountByRange(1, 0, 5)).assertEqual(5);
      expect(bv.getBitCountByRange(1, 60, 70)).assertEqual(0);
    });

    /**
     * @tc.number  SUB_BITVECTOR_COMBO_ONE_0500
     * @tc.name    testBitVectorCombo0005
     * @tc.desc    Verify setAllBits then getBitsByRange then flipBitByIndex
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 2
     */
    it('testBitVectorCombo0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let bv = new collections.BitVector(6);
      bv.setAllBits(1);
      let sub = bv.getBitsByRange(1, 5);
      sub.flipBitByIndex(0);
      expect(sub[0]).assertEqual(0);
      expect(sub[1]).assertEqual(1);
      expect(bv.getBitCountByRange(1, 0, 6)).assertEqual(6);
    });
  })
}
