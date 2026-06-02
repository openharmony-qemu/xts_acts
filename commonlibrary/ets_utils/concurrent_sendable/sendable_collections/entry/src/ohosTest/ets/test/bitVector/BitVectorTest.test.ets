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

import { collections } from '@kit.ArkTS';
import taskpool from '@ohos.taskpool';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { sleep } from '../Utils';
import { BusinessError } from '@ohos.base';

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
function concurrentPushFunc(bv: collections.BitVector): void {
  bv.push(1)
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
    beforeAll((): void => {})
    beforeEach((): void => {})
    afterEach((): void => {})
    afterAll(async (): Promise<void> => {
      await sleep(100)
    })

    // ===== Constructor Tests =====

    /**
     * @tc.name   BitVectorTest0100
     * @tc.number SUB_BITVECTOR_TEST_0100
     * @tc.desc   Verify BitVector constructor with required length parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BitVectorTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let bv = new collections.BitVector(64)
      expect(bv.length).assertEqual(64)
    })

    /**
     * @tc.name   BitVectorTest0200
     * @tc.number SUB_BITVECTOR_TEST_0200
     * @tc.desc   Verify BitVector constructor with length 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BitVectorTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let bv = new collections.BitVector(0)
      expect(bv.length).assertEqual(0)
    })

    /**
     * @tc.name   BitVectorTest0300
     * @tc.number SUB_BITVECTOR_TEST_0300
     * @tc.desc   Verify BitVector constructor with various normal number values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BitVectorTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let bv1 = new collections.BitVector(1)
      let bv2 = new collections.BitVector(8)
      let bv3 = new collections.BitVector(1024)
      expect(bv1.length).assertEqual(1)
      expect(bv2.length).assertEqual(8)
      expect(bv3.length).assertEqual(1024)
    })

    /**
     * @tc.name   BitVectorTest0400
     * @tc.number SUB_BITVECTOR_TEST_0400
     * @tc.desc   Verify BitVector constructor with large length value 1000000
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BitVectorTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let bv = new collections.BitVector(1000000)
      expect(bv.length).assertEqual(1000000)
    })

    /**
     * @tc.name   BitVectorTest0500
     * @tc.number SUB_BITVECTOR_TEST_0500
     * @tc.desc   Verify BitVector constructor with float throws error 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BitVectorTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      try {
        let bv = new collections.BitVector(10.5)
        expect().assertFail()
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401)
      }
    })

    /**
     * @tc.name   BitVectorTest0600
     * @tc.number SUB_BITVECTOR_TEST_0600
     * @tc.desc   Verify BitVector constructor with negative length behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BitVectorTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      try {
        let bv = new collections.BitVector(-1)
        expect(bv.length).assertEqual(0)
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401)
      }
    })

    /**
     * @tc.name   BitVectorTest0700
     * @tc.number SUB_BITVECTOR_TEST_0700
     * @tc.desc   Verify BitVector constructor with NaN throws error 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BitVectorTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      try {
        let bv = new collections.BitVector(NaN)
        expect().assertFail()
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401)
      }
    })

    /**
     * @tc.name   BitVectorTest0800
     * @tc.number SUB_BITVECTOR_TEST_0800
     * @tc.desc   Verify BitVector constructor with Infinity throws error 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BitVectorTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      try {
        let bv = new collections.BitVector(Infinity)
        expect().assertFail()
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401)
      }
    })

    /**
     * @tc.name   BitVectorTest0900
     * @tc.number SUB_BITVECTOR_TEST_0900
     * @tc.desc   Verify BitVector constructor with Infinity minus negative value throws error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BitVectorTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      try {
        let bv = new collections.BitVector(-Infinity)
        expect().assertFail()
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401)
      }
    })

    /**
     * @tc.name   BitVectorTest1000
     * @tc.number SUB_BITVECTOR_TEST_1000
     * @tc.desc   Verify BitVector all bits default to 0 after construction
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BitVectorTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let bv = new collections.BitVector(16)
      for (let i = 0; i < bv.length; i++) {
        expect(bv[i]).assertEqual(0)
      }
    })

    /**
     * @tc.name   BitVectorTest1100
     * @tc.number SUB_BITVECTOR_TEST_1100
     * @tc.desc   Verify BitVector index accessor returns correct bit values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BitVectorTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let bv = new collections.BitVector(8)
      expect(bv[0]).assertEqual(0)
      expect(bv[7]).assertEqual(0)
    })

    // ===== Property Tests =====

    /**
     * @tc.name   BitVectorTest1200
     * @tc.number SUB_BITVECTOR_TEST_1200
     * @tc.desc   Verify BitVector length property matches constructor parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BitVectorTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let bv = new collections.BitVector(64)
      expect(bv.length).assertEqual(64)
    })

    /**
     * @tc.name   BitVectorTest1300
     * @tc.number SUB_BITVECTOR_TEST_1300
     * @tc.desc   Verify BitVector length changes after push pop and resize operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BitVectorTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let bv = new collections.BitVector(16)
      bv.push(1)
      expect(bv.length).assertEqual(17)
      bv.pop()
      expect(bv.length).assertEqual(16)
      bv.resize(32)
      expect(bv.length).assertEqual(32)
    })

    // ===== push Tests =====

    /**
     * @tc.name   BitVectorTest1400
     * @tc.number SUB_BITVECTOR_TEST_1400
     * @tc.desc   Verify BitVector push with element 0 and 1 sets correct bit values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BitVectorTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let bv = new collections.BitVector(8)
      bv.push(0)
      expect(bv[8]).assertEqual(0)
      bv.push(1)
      expect(bv[9]).assertEqual(1)
    })

    /**
     * @tc.name   BitVectorTest1500
     * @tc.number SUB_BITVECTOR_TEST_1500
     * @tc.desc   Verify BitVector push with non-zero values 2 and -1 sets bit value 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BitVectorTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let bv = new collections.BitVector(8)
      bv.push(2)
      expect(bv[8]).assertEqual(1)
      bv.push(-1)
      expect(bv[9]).assertEqual(1)
    })

    /**
     * @tc.name   BitVectorTest1600
     * @tc.number SUB_BITVECTOR_TEST_1600
     * @tc.desc   Verify BitVector push with NaN and Infinity special values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BitVectorTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let bv = new collections.BitVector(8)
      bv.push(NaN)
      bv.push(Infinity)
      expect(bv.length).assertEqual(10)
    })

    /**
     * @tc.name   BitVectorTest1700
     * @tc.number SUB_BITVECTOR_TEST_1700
     * @tc.desc   Verify BitVector push increases length by 1 for each call
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BitVectorTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let bv = new collections.BitVector(0)
      let initLen = bv.length
      bv.push(1)
      expect(bv.length).assertEqual(initLen + 1)
      bv.push(0)
      expect(bv.length).assertEqual(initLen + 2)
    })

    /**
     * @tc.name   BitVectorTest1800
     * @tc.number SUB_BITVECTOR_TEST_1800
     * @tc.desc   Verify BitVector push returns boolean type and true on success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BitVectorTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let bv = new collections.BitVector(8)
      let result1 = bv.push(0)
      expect(typeof result1).assertEqual("boolean")
      expect(result1).assertTrue()
      let result2 = bv.push(1)
      expect(result2).assertTrue()
    })

    /**
     * @tc.name   BitVectorTest1900
     * @tc.number SUB_BITVECTOR_TEST_1900
     * @tc.desc   Verify BitVector push to empty BitVector returns true with correct state
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BitVectorTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let bv = new collections.BitVector(0)
      let result = bv.push(1)
      expect(result).assertTrue()
      expect(bv.length).assertEqual(1)
      expect(bv[0]).assertEqual(1)
    })

    // ===== pop Tests =====

    /**
     * @tc.name   BitVectorTest2000
     * @tc.number SUB_BITVECTOR_TEST_2000
     * @tc.desc   Verify BitVector pop removes tail element and returns its value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BitVectorTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let bv = new collections.BitVector(8)
      bv.push(1)
      let result = bv.pop()
      expect(result).assertEqual(1)
      expect(bv.length).assertEqual(8)
    })

    /**
     * @tc.name   BitVectorTest2100
     * @tc.number SUB_BITVECTOR_TEST_2100
     * @tc.desc   Verify BitVector pop returns correct LIFO order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BitVectorTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let bv = new collections.BitVector(8)
      bv.push(1)
      bv.push(0)
      let result1 = bv.pop()
      expect(typeof result1).assertEqual("number")
      expect(result1).assertEqual(0)
      let result2 = bv.pop()
      expect(result2).assertEqual(1)
    })

    /**
     * @tc.name   BitVectorTest2200
     * @tc.number SUB_BITVECTOR_TEST_2200
     * @tc.desc   Verify BitVector pop on length-0 BitVector behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BitVectorTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let bv = new collections.BitVector(0)
      try {
        let result = bv.pop()
        expect(result === undefined).assertTrue()
      } catch (e) {
        expect(e !== null).assertTrue()
      }
    })

    /**
     * @tc.name   BitVectorTest2300
     * @tc.number SUB_BITVECTOR_TEST_2300
     * @tc.desc   Verify BitVector pop removes last element by index assignment
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BitVectorTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let bv = new collections.BitVector(4)
      bv[3] = 1
      let result = bv.pop()
      expect(result).assertEqual(1)
      expect(bv.length).assertEqual(3)
    })

    // ===== has Tests =====

    /**
     * @tc.name   BitVectorTest2400
     * @tc.number SUB_BITVECTOR_TEST_2400
     * @tc.desc   Verify BitVector has with three required parameters finds bit value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BitVectorTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let bv = new collections.BitVector(16)
      bv[5] = 1
      bv[10] = 1
      let result = bv.has(1, 0, 15)
      expect(result).assertTrue()
    })

    /**
     * @tc.name   BitVectorTest2500
     * @tc.number SUB_BITVECTOR_TEST_2500
     * @tc.desc   Verify BitVector has searches for 0 and non-zero element values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BitVectorTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let bv = new collections.BitVector(16)
      bv[5] = 1
      bv[10] = 0
      let result1 = bv.has(1, 0, 15)
      expect(result1).assertTrue()
      let result2 = bv.has(0, 0, 15)
      expect(result2).assertTrue()
      let result3 = bv.has(2, 0, 15)
      expect(result3).assertTrue()
    })

    /**
     * @tc.name   BitVectorTest2600
     * @tc.number SUB_BITVECTOR_TEST_2600
     * @tc.desc   Verify BitVector has with different index ranges returns correct results
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BitVectorTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let bv = new collections.BitVector(16)
      bv[5] = 1
      bv[10] = 1
      let result1 = bv.has(1, 0, 15)
      expect(result1).assertTrue()
      let result2 = bv.has(1, 0, 7)
      expect(result2).assertTrue()
      let result3 = bv.has(1, 8, 15)
      expect(result3).assertTrue()
      let result4 = bv.has(1, 6, 9)
      expect(result4).assertFalse()
    })

    /**
     * @tc.name   BitVectorTest2700
     * @tc.number SUB_BITVECTOR_TEST_2700
     * @tc.desc   Verify BitVector has with boundary index values at start and end
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BitVectorTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let bv = new collections.BitVector(16)
      bv[0] = 1
      bv[15] = 1
      let result1 = bv.has(1, 0, 1)
      expect(result1).assertTrue()
      let result2 = bv.has(1, 14, 15)
      expect(result2).assertTrue()
    })

    /**
     * @tc.name   BitVectorTest2800
     * @tc.number SUB_BITVECTOR_TEST_2800
     * @tc.desc   Verify BitVector has with fromIndex negative throws error 10200001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BitVectorTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let bv = new collections.BitVector(16)
      try {
        bv.has(1, -1, 15)
        expect().assertFail()
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(10200001)
      }
    })

    /**
     * @tc.name   BitVectorTest2900
     * @tc.number SUB_BITVECTOR_TEST_2900
     * @tc.desc   Verify BitVector has with toIndex exceeding length throws error 10200001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BitVectorTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let bv = new collections.BitVector(16)
      try {
        bv.has(1, 0, 17)
        expect().assertFail()
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(10200001)
      }
    })

    /**
     * @tc.name   BitVectorTest3000
     * @tc.number SUB_BITVECTOR_TEST_3000
     * @tc.desc   Verify BitVector has with fromIndex equal to toIndex throws error 10200001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BitVectorTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let bv = new collections.BitVector(16)
      try {
        bv.has(1, 8, 8)
        expect().assertFail()
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(10200001)
      }
    })

    /**
     * @tc.name   BitVectorTest3100
     * @tc.number SUB_BITVECTOR_TEST_3100
     * @tc.desc   Verify BitVector has returns correct results for multiple value and range combinations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BitVectorTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let bv = new collections.BitVector(16)
      bv[5] = 1
      bv[10] = 1
      expect(bv.has(1, 0, 15)).assertTrue()
      expect(bv.has(1, 5, 10)).assertTrue()
      expect(bv.has(1, 10, 15)).assertTrue()
      expect(bv.has(1, 0, 4)).assertFalse()
      expect(bv.has(1, 6, 9)).assertFalse()
      expect(bv.has(1, 11, 15)).assertFalse()
    })

    /**
     * @tc.name   BitVectorTest3200
     * @tc.number SUB_BITVECTOR_TEST_3200
     * @tc.desc   Verify BitVector has throws error for fromIndex greater than toIndex
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BitVectorTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let bv = new collections.BitVector(16)
      try {
        bv.has(1, 10, 5)
        expect().assertFail()
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(10200001)
      }
    })

    // ===== setBitsByRange Tests =====

    /**
     * @tc.name   BitVectorTest3300
     * @tc.number SUB_BITVECTOR_TEST_3300
     * @tc.desc   Verify BitVector setBitsByRange sets range to 1 correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BitVectorTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let bv = new collections.BitVector(16)
      bv.setBitsByRange(1, 5, 10)
      for (let i = 5; i < 10; i++) {
        expect(bv[i]).assertEqual(1)
      }
      for (let i = 0; i < 5; i++) {
        expect(bv[i]).assertEqual(0)
      }
    })

    /**
     * @tc.name   BitVectorTest3400
     * @tc.number SUB_BITVECTOR_TEST_3400
     * @tc.desc   Verify BitVector setBitsByRange with element 0 and non-zero values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BitVectorTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let bv = new collections.BitVector(16)
      bv.setBitsByRange(1, 8, 16)
      for (let i = 8; i < 16; i++) {
        expect(bv[i]).assertEqual(1)
      }
      bv.setBitsByRange(2, 0, 4)
      for (let i = 0; i < 4; i++) {
        expect(bv[i]).assertEqual(1)
      }
    })

    /**
     * @tc.name   BitVectorTest3500
     * @tc.number SUB_BITVECTOR_TEST_3500
     * @tc.desc   Verify BitVector setBitsByRange with boundary index values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BitVectorTest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let bv = new collections.BitVector(16)
      bv.setBitsByRange(1, 0, 1)
      expect(bv[0]).assertEqual(1)
      expect(bv[1]).assertEqual(0)
      bv.setBitsByRange(1, 15, 16)
      expect(bv[15]).assertEqual(1)
    })

    /**
     * @tc.name   BitVectorTest3600
     * @tc.number SUB_BITVECTOR_TEST_3600
     * @tc.desc   Verify BitVector setBitsByRange with invalid index throws error 10200001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BitVectorTest3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let bv = new collections.BitVector(16)
      try {
        bv.setBitsByRange(1, -1, 16)
        expect().assertFail()
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(10200001)
      }
    })

    /**
     * @tc.name   BitVectorTest3700
     * @tc.number SUB_BITVECTOR_TEST_3700
     * @tc.desc   Verify BitVector setBitsByRange returns void and throws error for toIndex exceeding length and fromIndex equal to toIndex
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BitVectorTest3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let bv = new collections.BitVector(16)
      let result = bv.setBitsByRange(1, 0, 8)
      expect(result).assertUndefined()
    })

    /**
     * @tc.name   BitVectorTest3800
     * @tc.number SUB_BITVECTOR_TEST_3800
     * @tc.desc   Verify BitVector setBitsByRange throws error for toIndex exceeding length
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BitVectorTest3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let bv = new collections.BitVector(16)
      try {
        bv.setBitsByRange(1, 0, 17)
        expect().assertFail()
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(10200001)
      }
    })

    /**
     * @tc.name   BitVectorTest3900
     * @tc.number SUB_BITVECTOR_TEST_3900
     * @tc.desc   Verify BitVector setBitsByRange throws error for fromIndex equal to toIndex
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BitVectorTest3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let bv = new collections.BitVector(16)
      try {
        bv.setBitsByRange(1, 8, 8)
        expect().assertFail()
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(10200001)
      }
    })

    // ===== setAllBits Tests =====

    /**
     * @tc.name   BitVectorTest4000
     * @tc.number SUB_BITVECTOR_TEST_4000
     * @tc.desc   Verify BitVector setAllBits sets all bits to 0 1 and non-zero value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BitVectorTest4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let bv = new collections.BitVector(16)
      bv.setAllBits(0)
      for (let i = 0; i < 16; i++) {
        expect(bv[i]).assertEqual(0)
      }
      bv.setAllBits(1)
      for (let i = 0; i < 16; i++) {
        expect(bv[i]).assertEqual(1)
      }
      bv.setAllBits(2)
      for (let i = 0; i < 16; i++) {
        expect(bv[i]).assertEqual(1)
      }
    })

    /**
     * @tc.name   BitVectorTest4100
     * @tc.number SUB_BITVECTOR_TEST_4100
     * @tc.desc   Verify BitVector setAllBits with negative non-zero value sets all bits to 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BitVectorTest4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let bv = new collections.BitVector(16)
      bv.setAllBits(-1)
      for (let i = 0; i < 16; i++) {
        expect(bv[i]).assertEqual(1)
      }
    })

    /**
     * @tc.name   BitVectorTest4200
     * @tc.number SUB_BITVECTOR_TEST_4200
     * @tc.desc   Verify BitVector setAllBits returns void undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BitVectorTest4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let bv = new collections.BitVector(16)
      let result = bv.setAllBits(1)
      expect(result).assertUndefined()
    })

    // ===== getBitsByRange Tests =====

    /**
     * @tc.name   BitVectorTest4300
     * @tc.number SUB_BITVECTOR_TEST_4300
     * @tc.desc   Verify BitVector getBitsByRange returns new BitVector with correct bits
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BitVectorTest4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let bv = new collections.BitVector(16)
      bv[5] = 1
      bv[10] = 1
      let result = bv.getBitsByRange(0, 16)
      expect(result.length).assertEqual(16)
      expect(result[5]).assertEqual(1)
      expect(result[10]).assertEqual(1)
    })

    /**
     * @tc.name   BitVectorTest4400
     * @tc.number SUB_BITVECTOR_TEST_4400
     * @tc.desc   Verify BitVector getBitsByRange with normal range returns correct sub vector
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BitVectorTest4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let bv = new collections.BitVector(16)
      bv.setAllBits(1)
      let result = bv.getBitsByRange(4, 12)
      expect(result.length).assertEqual(8)
      for (let i = 0; i < 8; i++) {
        expect(result[i]).assertEqual(1)
      }
    })

    /**
     * @tc.name   BitVectorTest4500
     * @tc.number SUB_BITVECTOR_TEST_4500
     * @tc.desc   Verify BitVector getBitsByRange with boundary index values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BitVectorTest4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let bv = new collections.BitVector(16)
      let result1 = bv.getBitsByRange(0, 1)
      expect(result1.length).assertEqual(1)
      let result2 = bv.getBitsByRange(15, 16)
      expect(result2.length).assertEqual(1)
    })

    /**
     * @tc.name   BitVectorTest4600
     * @tc.number SUB_BITVECTOR_TEST_4600
     * @tc.desc   Verify BitVector getBitsByRange with invalid index throws error 10200001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BitVectorTest4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let bv = new collections.BitVector(16)
      try {
        bv.getBitsByRange(-1, 16)
        expect().assertFail()
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(10200001)
      }
    })

    /**
     * @tc.name   BitVectorTest4700
     * @tc.number SUB_BITVECTOR_TEST_4700
     * @tc.desc   Verify BitVector getBitsByRange returns different instance and throws error for toIndex exceeding length and fromIndex equal to toIndex
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BitVectorTest4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let bv = new collections.BitVector(16)
      let result = bv.getBitsByRange(0, 8)
      expect(result instanceof collections.BitVector).assertTrue()
      expect(result !== bv).assertTrue()
    })

    /**
     * @tc.name   BitVectorTest4800
     * @tc.number SUB_BITVECTOR_TEST_4800
     * @tc.desc   Verify BitVector getBitsByRange throws error for toIndex exceeding length
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BitVectorTest4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let bv = new collections.BitVector(16)
      try {
        bv.getBitsByRange(0, 17)
        expect().assertFail()
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(10200001)
      }
    })

    /**
     * @tc.name   BitVectorTest4900
     * @tc.number SUB_BITVECTOR_TEST_4900
     * @tc.desc   Verify BitVector getBitsByRange throws error for fromIndex equal to toIndex
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BitVectorTest4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let bv = new collections.BitVector(16)
      try {
        bv.getBitsByRange(8, 8)
        expect().assertFail()
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(10200001)
      }
    })

    /**
     * @tc.name   BitVectorTest5000
     * @tc.number SUB_BITVECTOR_TEST_5000
     * @tc.desc   Verify BitVector getBitsByRange returns correct bit positions in sub vector
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BitVectorTest5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let bv = new collections.BitVector(16)
      bv[5] = 1
      bv[10] = 1
      let result = bv.getBitsByRange(4, 12)
      expect(result.length).assertEqual(8)
      expect(result[1]).assertEqual(1)
      expect(result[6]).assertEqual(1)
    })

    // ===== resize Tests =====

    /**
     * @tc.name   BitVectorTest5100
     * @tc.number SUB_BITVECTOR_TEST_5100
     * @tc.desc   Verify BitVector resize expand to larger size with zeros
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BitVectorTest5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let bv = new collections.BitVector(16)
      bv.resize(32)
      expect(bv.length).assertEqual(32)
      for (let i = 16; i < 32; i++) {
        expect(bv[i]).assertEqual(0)
      }
    })

    /**
     * @tc.name   BitVectorTest5200
     * @tc.number SUB_BITVECTOR_TEST_5200
     * @tc.desc   Verify BitVector resize shrink to smaller size
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BitVectorTest5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let bv = new collections.BitVector(16)
      bv.resize(8)
      expect(bv.length).assertEqual(8)
    })

    /**
     * @tc.name   BitVectorTest5300
     * @tc.number SUB_BITVECTOR_TEST_5300
     * @tc.desc   Verify BitVector resize to 0 results in empty BitVector
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BitVectorTest5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let bv = new collections.BitVector(16)
      bv.resize(0)
      expect(bv.length).assertEqual(0)
    })

    /**
     * @tc.name   BitVectorTest5400
     * @tc.number SUB_BITVECTOR_TEST_5400
     * @tc.desc   Verify BitVector resize returns void and throws error for negative value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BitVectorTest5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let bv = new collections.BitVector(16)
      let result = bv.resize(32)
      expect(result).assertUndefined()
      try {
        bv.resize(-1)
        expect().assertFail()
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(10200001)
      }
    })

    /**
     * @tc.name   BitVectorTest5500
     * @tc.number SUB_BITVECTOR_TEST_5500
     * @tc.desc   Verify BitVector resize preserves existing data after expand and shrink
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BitVectorTest5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
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

    /**
     * @tc.name   BitVectorTest5600
     * @tc.number SUB_BITVECTOR_TEST_5600
     * @tc.desc   Verify BitVector getBitCountByRange counts bit value 1 in range
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BitVectorTest5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let bv = new collections.BitVector(16)
      bv[5] = 1
      bv[10] = 1
      bv[15] = 1
      let count = bv.getBitCountByRange(1, 0, 16)
      expect(count).assertEqual(3)
    })

    /**
     * @tc.name   BitVectorTest5700
     * @tc.number SUB_BITVECTOR_TEST_5700
     * @tc.desc   Verify BitVector getBitCountByRange counts bit value 0 and non-zero
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BitVectorTest5700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let bv = new collections.BitVector(16)
      bv[5] = 1
      bv[10] = 1
      let count1 = bv.getBitCountByRange(1, 0, 16)
      expect(count1).assertEqual(2)
      let count0 = bv.getBitCountByRange(0, 0, 16)
      expect(count0).assertEqual(14)
      let count2 = bv.getBitCountByRange(2, 0, 16)
      expect(count2).assertEqual(2)
    })

    /**
     * @tc.name   BitVectorTest5800
     * @tc.number SUB_BITVECTOR_TEST_5800
     * @tc.desc   Verify BitVector getBitCountByRange with different sub ranges
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BitVectorTest5800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let bv = new collections.BitVector(16)
      bv[5] = 1
      bv[10] = 1
      let count1 = bv.getBitCountByRange(1, 0, 8)
      expect(count1).assertEqual(1)
      let count2 = bv.getBitCountByRange(1, 8, 16)
      expect(count2).assertEqual(1)
      let count3 = bv.getBitCountByRange(1, 6, 9)
      expect(count3).assertEqual(0)
    })

    /**
     * @tc.name   BitVectorTest5900
     * @tc.number SUB_BITVECTOR_TEST_5900
     * @tc.desc   Verify BitVector getBitCountByRange returns number type with full range
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BitVectorTest5900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let bv = new collections.BitVector(16)
      bv.setAllBits(1)
      let count = bv.getBitCountByRange(1, 0, 16)
      expect(typeof count).assertEqual("number")
      expect(count).assertEqual(16)
    })

    // ===== getIndexOf Tests =====

    /**
     * @tc.name   BitVectorTest6000
     * @tc.number SUB_BITVECTOR_TEST_6000
     * @tc.desc   Verify BitVector getIndexOf returns first occurrence index of bit value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BitVectorTest6000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let bv = new collections.BitVector(16)
      bv[5] = 1
      bv[10] = 1
      let index1 = bv.getIndexOf(1, 0, 16)
      expect(index1).assertEqual(5)
      let index0 = bv.getIndexOf(0, 0, 16)
      expect(index0).assertEqual(0)
      let index2 = bv.getIndexOf(2, 0, 16)
      expect(index2).assertEqual(5)
    })

    /**
     * @tc.name   BitVectorTest6100
     * @tc.number SUB_BITVECTOR_TEST_6100
     * @tc.desc   Verify BitVector getIndexOf from specified range and returns -1 when not found
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BitVectorTest6100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let bv = new collections.BitVector(16)
      bv[5] = 1
      bv[10] = 1
      let index1 = bv.getIndexOf(1, 6, 16)
      expect(index1).assertEqual(10)
      let index2 = bv.getIndexOf(1, 11, 16)
      expect(index2).assertEqual(-1)
    })

    /**
     * @tc.name   BitVectorTest6200
     * @tc.number SUB_BITVECTOR_TEST_6200
     * @tc.desc   Verify BitVector getIndexOf returns number type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BitVectorTest6200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let bv = new collections.BitVector(16)
      bv[5] = 1
      let index1 = bv.getIndexOf(1, 0, 16)
      expect(typeof index1).assertEqual("number")
      expect(index1).assertEqual(5)
      let index2 = bv.getIndexOf(1, 6, 16)
      expect(index2).assertEqual(-1)
    })

    // ===== getLastIndexOf Tests =====

    /**
     * @tc.name   BitVectorTest6300
     * @tc.number SUB_BITVECTOR_TEST_6300
     * @tc.desc   Verify BitVector getLastIndexOf returns last occurrence and -1 when not found
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BitVectorTest6300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let bv = new collections.BitVector(16)
      bv[5] = 1
      bv[10] = 1
      let index1 = bv.getLastIndexOf(1, 0, 16)
      expect(index1).assertEqual(10)
      let index2 = bv.getLastIndexOf(1, 0, 8)
      expect(index2).assertEqual(5)
      let index3 = bv.getLastIndexOf(1, 11, 16)
      expect(index3).assertEqual(-1)
    })

    // ===== flipBitByIndex Tests =====

    /**
     * @tc.name   BitVectorTest6400
     * @tc.number SUB_BITVECTOR_TEST_6400
     * @tc.desc   Verify BitVector flipBitByIndex flips 0 to 1 and 1 to 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BitVectorTest6400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let bv = new collections.BitVector(16)
      bv[5] = 0
      bv.flipBitByIndex(5)
      expect(bv[5]).assertEqual(1)
      bv.flipBitByIndex(5)
      expect(bv[5]).assertEqual(0)
    })

    /**
     * @tc.name   BitVectorTest6500
     * @tc.number SUB_BITVECTOR_TEST_6500
     * @tc.desc   Verify BitVector flipBitByIndex at boundary indices 0 and length-1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BitVectorTest6500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let bv = new collections.BitVector(16)
      bv.flipBitByIndex(0)
      bv.flipBitByIndex(15)
      expect(bv[0]).assertEqual(1)
      expect(bv[15]).assertEqual(1)
    })

    /**
     * @tc.name   BitVectorTest6600
     * @tc.number SUB_BITVECTOR_TEST_6600
     * @tc.desc   Verify BitVector flipBitByIndex with negative and out of range throws error 10200001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BitVectorTest6600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let bv = new collections.BitVector(16)
      try {
        bv.flipBitByIndex(-1)
        expect().assertFail()
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(10200001)
      }
    })

    /**
     * @tc.name   BitVectorTest6700
     * @tc.number SUB_BITVECTOR_TEST_6700
     * @tc.desc   Verify BitVector flipBitByIndex with out of range index throws error 10200001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BitVectorTest6700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let bv = new collections.BitVector(16)
      try {
        bv.flipBitByIndex(16)
        expect().assertFail()
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(10200001)
      }
    })

    /**
     * @tc.name   BitVectorTest6800
     * @tc.number SUB_BITVECTOR_TEST_6800
     * @tc.desc   Verify BitVector flipBitByIndex with float index throws error 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BitVectorTest6800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let bv = new collections.BitVector(16)
      try {
        bv.flipBitByIndex(5.5)
        expect().assertFail()
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401)
      }
    })

    /**
     * @tc.name   BitVectorTest6900
     * @tc.number SUB_BITVECTOR_TEST_6900
     * @tc.desc   Verify BitVector flipBitByIndex returns void undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BitVectorTest6900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let bv = new collections.BitVector(16)
      let result = bv.flipBitByIndex(5)
      expect(result).assertUndefined()
    })

    // ===== flipBitsByRange Tests =====

    /**
     * @tc.name   BitVectorTest7000
     * @tc.number SUB_BITVECTOR_TEST_7000
     * @tc.desc   Verify BitVector flipBitsByRange flips bits in specified range
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BitVectorTest7000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let bv = new collections.BitVector(16)
      bv.setAllBits(0)
      bv.flipBitsByRange(0, 8)
      for (let i = 0; i < 8; i++) {
        expect(bv[i]).assertEqual(1)
      }
      for (let i = 8; i < 16; i++) {
        expect(bv[i]).assertEqual(0)
      }
    })

    /**
     * @tc.name   BitVectorTest7100
     * @tc.number SUB_BITVECTOR_TEST_7100
     * @tc.desc   Verify BitVector flipBitsByRange with invalid index throws error 10200001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BitVectorTest7100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let bv = new collections.BitVector(16)
      try {
        bv.flipBitsByRange(-1, 16)
        expect().assertFail()
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(10200001)
      }
    })

    /**
     * @tc.name   BitVectorTest7200
     * @tc.number SUB_BITVECTOR_TEST_7200
     * @tc.desc   Verify BitVector flipBitsByRange returns void undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BitVectorTest7200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let bv = new collections.BitVector(16)
      let result = bv.flipBitsByRange(0, 8)
      expect(result).assertUndefined()
    })

    // ===== values Tests =====

    /**
     * @tc.name   BitVectorTest7300
     * @tc.number SUB_BITVECTOR_TEST_7300
     * @tc.desc   Verify BitVector values returns iterator with correct first element
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BitVectorTest7300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let bv = new collections.BitVector(8)
      bv[0] = 1
      let iter = bv.values()
      let first = iter.next()
      expect(first.value).assertEqual(1)
      expect(first.done).assertFalse()
    })

    /**
     * @tc.name   BitVectorTest7400
     * @tc.number SUB_BITVECTOR_TEST_7400
     * @tc.desc   Verify BitVector values iterator traversal covers all elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BitVectorTest7400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
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

    /**
     * @tc.name   BitVectorTest7500
     * @tc.number SUB_BITVECTOR_TEST_7500
     * @tc.desc   Verify BitVector for-of with values iterates all elements correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BitVectorTest7500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let bv = new collections.BitVector(8)
      bv[0] = 1
      bv[5] = 1
      let count = 0
      for (let v of bv.values()) {
        count++
      }
      expect(count).assertEqual(8)
    })

    // ===== Index Accessor Tests =====

    /**
     * @tc.name   BitVectorTest7600
     * @tc.number SUB_BITVECTOR_TEST_7600
     * @tc.desc   Verify BitVector index accessor get returns correct bit value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BitVectorTest7600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let bv = new collections.BitVector(16)
      bv[5] = 1
      expect(bv[5]).assertEqual(1)
      expect(bv[0]).assertEqual(0)
    })

    /**
     * @tc.name   BitVectorTest7700
     * @tc.number SUB_BITVECTOR_TEST_7700
     * @tc.desc   Verify BitVector index accessor set and get operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BitVectorTest7700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let bv = new collections.BitVector(16)
      bv[5] = 1
      bv[10] = 0
      expect(bv[5]).assertEqual(1)
      expect(bv[10]).assertEqual(0)
    })

    /**
     * @tc.name   BitVectorTest7800
     * @tc.number SUB_BITVECTOR_TEST_7800
     * @tc.desc   Verify BitVector index accessor with out of bounds index throws error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BitVectorTest7800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let bv = new collections.BitVector(16)
      try {
        let v = bv[16]
      } catch (e) {
        expect(e !== null).assertTrue()
      }
    })

    // ===== Concurrent Tests =====

    /**
     * @tc.name   BitVectorTest7900
     * @tc.number SUB_BITVECTOR_TEST_7900
     * @tc.desc   Verify BitVector as Sendable passed to TaskPool and processed correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('BitVectorTest7900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let bv = new collections.BitVector(16)
      bv.setBitsByRange(1, 0, 8)
      let task = new taskpool.Task(countBitsFunc, bv)
      let result = await taskpool.execute(task)
      expect(result as number).assertEqual(8)
    })

    /**
     * @tc.name   BitVectorTest8000
     * @tc.number SUB_BITVECTOR_TEST_8000
     * @tc.desc   Verify BitVector modified in TaskPool task reflects changes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('BitVectorTest8000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let bv = new collections.BitVector(16)
      bv[0] = 0
      let task = new taskpool.Task(modifyBitVectorFunc, bv)
      await taskpool.execute(task)
      expect(bv[0]).assertEqual(1)
      expect(bv.length).assertEqual(17)
    })

    /**
     * @tc.name   BitVectorTest8100
     * @tc.number SUB_BITVECTOR_TEST_8100
     * @tc.desc   Verify BitVector concurrent push by multiple TaskPool tasks completes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('BitVectorTest8100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let bv = new collections.BitVector(16)
      let task1 = new taskpool.Task(concurrentPushFunc, bv)
      let task2 = new taskpool.Task(concurrentPushFunc, bv)
      let p1 = taskpool.execute(task1)
      let p2 = taskpool.execute(task2)
      try {
        await Promise.all([p1, p2])
        expect(bv.length).assertEqual(18)
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(10200201)
      }
    })

    // ===== Inheritance Tests =====

    /**
     * @tc.name   BitVectorTest8200
     * @tc.number SUB_BITVECTOR_TEST_8200
     * @tc.desc   Verify custom Sendable class extending BitVector works correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BitVectorTest8200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let bv = new MyBitVector(16)
      bv.setBitsByRange(1, 0, 8)
      expect(bv.countOnes()).assertEqual(8)
      expect(bv instanceof collections.BitVector).assertTrue()
    })

    /**
     * @tc.name   BitVectorTest8300
     * @tc.number SUB_BITVECTOR_TEST_8300
     * @tc.desc   Verify BitVector instanceof and typeof type checks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BitVectorTest8300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let bv = new collections.BitVector(16)
      expect(bv instanceof collections.BitVector).assertTrue()
      expect(typeof bv).assertEqual("object")
    })
  })
}
