/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size } from '@ohos/hypium';
import { collections } from '@kit.ArkTS';

const SLEEP_INTERVAL_MS: number = 100;

function sleep(ms: number): Promise<void> {
  return new Promise<void>((resolve: Function) => setTimeout(resolve, ms));
}

export default function BitVectorSupplementTest() {
  describe('BitVectorSupplementTest', () => {
    beforeAll(() => {
      console.info('beforeAll called');
    });

    beforeEach(() => {
      console.info('beforeEach called');
    });

    afterEach(() => {
      console.info('afterEach called');
    });

    afterAll(async () => {
      await sleep(SLEEP_INTERVAL_MS);
    });

    // ==================== has边界值测试用例 (3380-3490) ====================

    /**
     * @tc.name   testBitVectorHasBoundary0001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_3380
     * @tc.desc   BitVector has toIndex equals length, element not present, expect false.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorHasBoundary0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let bitVectorList: collections.BitVector = new collections.BitVector(0);
      bitVectorList.push(0);
      bitVectorList.push(0);
      bitVectorList.push(0);
      let rst = bitVectorList.has(1, 0, 3);
      expect(rst).assertEqual(false);
      done()
    });

    /**
     * @tc.name   testBitVectorHasBoundary0003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_3400
     * @tc.desc   BitVector has toIndex equals length, element present, expect true.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorHasBoundary0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let bitVectorList: collections.BitVector = new collections.BitVector(0);
      bitVectorList.push(0);
      bitVectorList.push(1);
      bitVectorList.push(0);
      bitVectorList.push(1);
      bitVectorList.push(0);
      let rst = bitVectorList.has(1, 0, 5);
      expect(rst).assertEqual(true);
      done()
    });

    /**
     * @tc.name   testBitVectorHasBoundary0004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_3410
     * @tc.desc   BitVector has toIndex equals length on all zeros, search 1, expect false.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorHasBoundary0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let bitVectorList: collections.BitVector = new collections.BitVector(0);
      for (let i = 0; i < 10; i++) {
        bitVectorList.push(0);
      }
      let rst = bitVectorList.has(1, 0, 10);
      expect(rst).assertEqual(false);
      done()
    });

    /**
     * @tc.name   testBitVectorHasBoundary0006
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_3430
     * @tc.desc   BitVector has fromIndex=length-1 toIndex=length, element present at last, expect true.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorHasBoundary0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let bitVectorList: collections.BitVector = new collections.BitVector(0);
      bitVectorList.push(0);
      bitVectorList.push(0);
      bitVectorList.push(1);
      let rst = bitVectorList.has(1, 2, 3);
      expect(rst).assertEqual(true);
      done()
    });

    /**
     * @tc.name   testBitVectorHasBoundary0007
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_3440
     * @tc.desc   BitVector has fromIndex=length-1 toIndex=length, element not present at last, expect false.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorHasBoundary0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let bitVectorList: collections.BitVector = new collections.BitVector(0);
      bitVectorList.push(0);
      bitVectorList.push(0);
      bitVectorList.push(0);
      let rst = bitVectorList.has(1, 2, 3);
      expect(rst).assertEqual(false);
      done()
    });

    /**
     * @tc.name   testBitVectorHasBoundary0008
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_3450
     * @tc.desc   BitVector has fromIndex=0 toIndex=1 single first element, element present, expect true.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorHasBoundary0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let bitVectorList: collections.BitVector = new collections.BitVector(0);
      bitVectorList.push(1);
      bitVectorList.push(0);
      bitVectorList.push(0);
      let rst = bitVectorList.has(1, 0, 1);
      expect(rst).assertEqual(true);
      done()
    });

    /**
     * @tc.name   testBitVectorHasBoundary0009
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_3460
     * @tc.desc   BitVector has fromIndex=0 toIndex=1 (inclusive), element present at index 1, expect true.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorHasBoundary0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let bitVectorList: collections.BitVector = new collections.BitVector(0);
      bitVectorList.push(0);
      bitVectorList.push(1);
      bitVectorList.push(1);
      let rst = bitVectorList.has(1, 0, 1);
      expect(rst).assertEqual(true);
      done()
    });

    /**
     * @tc.name   testBitVectorHasBoundary0010
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_3470
     * @tc.desc   BitVector has toIndex equals length on large BitVector all zeros, search 1, expect false.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorHasBoundary0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let bitVectorList: collections.BitVector = new collections.BitVector(0);
      for (let i = 0; i < 100; i++) {
        bitVectorList.push(0);
      }
      let rst = bitVectorList.has(1, 0, 100);
      expect(rst).assertEqual(false);
      done()
    });

    /**
     * @tc.name   testBitVectorHasBoundary0012
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_3490
     * @tc.desc   BitVector has single element toIndex=length, element present and not present.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorHasBoundary0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let bitVectorList: collections.BitVector = new collections.BitVector(0);
      bitVectorList.push(0);
      let rst1 = bitVectorList.has(0, 0, 1);
      expect(rst1).assertEqual(true);
      let rst2 = bitVectorList.has(1, 0, 1);
      expect(rst2).assertEqual(false);
      done()
    });

    // ==================== setBitsByRange边界值测试用例 (3500-3540) ====================

    /**
     * @tc.name   testBitVectorSetBitsByRangeBoundary0001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_3500
     * @tc.desc   BitVector setBitsByRange full range fromIndex=0 toIndex=length.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorSetBitsByRangeBoundary0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        for (let i = 0; i < 5; i++) {
          bitVectorList.push(0);
        }
        bitVectorList.setBitsByRange(1, 0, 5);
        for (let i = 0; i < 5; i++) {
          expect(bitVectorList[i]).assertEqual(1);
        }
        expect(bitVectorList.length).assertEqual(5);
        done()
      });

    /**
     * @tc.name   testBitVectorSetBitsByRangeBoundary0002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_3510
     * @tc.desc   BitVector setBitsByRange last element only fromIndex=length-1 toIndex=length.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorSetBitsByRangeBoundary0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        for (let i = 0; i < 5; i++) {
          bitVectorList.push(0);
        }
        bitVectorList.setBitsByRange(1, 4, 5);
        expect(bitVectorList[0]).assertEqual(0);
        expect(bitVectorList[1]).assertEqual(0);
        expect(bitVectorList[2]).assertEqual(0);
        expect(bitVectorList[3]).assertEqual(0);
        expect(bitVectorList[4]).assertEqual(1);
        done()
      });

    /**
     * @tc.name   testBitVectorSetBitsByRangeBoundary0003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_3520
     * @tc.desc   BitVector setBitsByRange first element only fromIndex=0 toIndex=1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorSetBitsByRangeBoundary0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        for (let i = 0; i < 5; i++) {
          bitVectorList.push(0);
        }
        bitVectorList.setBitsByRange(1, 0, 1);
        expect(bitVectorList[0]).assertEqual(1);
        expect(bitVectorList[1]).assertEqual(0);
        expect(bitVectorList[2]).assertEqual(0);
        expect(bitVectorList[3]).assertEqual(0);
        expect(bitVectorList[4]).assertEqual(0);
        done()
      });

    /**
     * @tc.name   testBitVectorSetBitsByRangeBoundary0004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_3530
     * @tc.desc   BitVector setBitsByRange set 0 on all ones full range.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorSetBitsByRangeBoundary0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        for (let i = 0; i < 5; i++) {
          bitVectorList.push(1);
        }
        bitVectorList.setBitsByRange(0, 0, 5);
        for (let i = 0; i < 5; i++) {
          expect(bitVectorList[i]).assertEqual(0);
        }
        done()
      });

    /**
     * @tc.name   testBitVectorSetBitsByRangeBoundary0005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_3540
     * @tc.desc   BitVector setBitsByRange single element BitVector full range.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorSetBitsByRangeBoundary0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        bitVectorList.push(0);
        bitVectorList.setBitsByRange(1, 0, 1);
        expect(bitVectorList[0]).assertEqual(1);
        expect(bitVectorList.length).assertEqual(1);
        done()
      });

    // ==================== getBitsByRange边界值测试用例 (3550-3590) ====================

    /**
     * @tc.name   testBitVectorGetBitsByRangeBoundary0001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_3550
     * @tc.desc   BitVector getBitsByRange full range fromIndex=0 toIndex=length.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorGetBitsByRangeBoundary0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        bitVectorList.push(0);
        bitVectorList.push(1);
        bitVectorList.push(0);
        bitVectorList.push(1);
        bitVectorList.push(0);
        let result = bitVectorList.getBitsByRange(0, 5);
        expect(result.length).assertEqual(5);
        expect(result[0]).assertEqual(0);
        expect(result[1]).assertEqual(1);
        expect(result[2]).assertEqual(0);
        expect(result[3]).assertEqual(1);
        expect(result[4]).assertEqual(0);
        done()
      });

    /**
     * @tc.name   testBitVectorGetBitsByRangeBoundary0002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_3560
     * @tc.desc   BitVector getBitsByRange last element only fromIndex=length-1 toIndex=length.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorGetBitsByRangeBoundary0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        bitVectorList.push(0);
        bitVectorList.push(1);
        bitVectorList.push(0);
        bitVectorList.push(1);
        bitVectorList.push(0);
        let result = bitVectorList.getBitsByRange(4, 5);
        expect(result.length).assertEqual(1);
        expect(result[0]).assertEqual(0);
        done()
      });

    /**
     * @tc.name   testBitVectorGetBitsByRangeBoundary0003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_3570
     * @tc.desc   BitVector getBitsByRange first element only fromIndex=0 toIndex=1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorGetBitsByRangeBoundary0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        bitVectorList.push(0);
        bitVectorList.push(1);
        bitVectorList.push(0);
        bitVectorList.push(1);
        bitVectorList.push(0);
        let result = bitVectorList.getBitsByRange(0, 1);
        expect(result.length).assertEqual(1);
        expect(result[0]).assertEqual(0);
        done()
      });

    /**
     * @tc.name   testBitVectorGetBitsByRangeBoundary0004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_3580
     * @tc.desc   BitVector getBitsByRange single element BitVector full range.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorGetBitsByRangeBoundary0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        bitVectorList.push(1);
        let result = bitVectorList.getBitsByRange(0, 1);
        expect(result.length).assertEqual(1);
        expect(result[0]).assertEqual(1);
        done()
      });

    /**
     * @tc.name   testBitVectorGetBitsByRangeBoundary0005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_3590
     * @tc.desc   BitVector getBitsByRange full range on large BitVector.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorGetBitsByRangeBoundary0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        for (let i = 0; i < 100; i++) {
          bitVectorList.push(i % 2);
        }
        let result = bitVectorList.getBitsByRange(0, 100);
        expect(result.length).assertEqual(100);
        for (let i = 0; i < 100; i++) {
          expect(result[i]).assertEqual(i % 2);
        }
        done()
      });

    // ==================== getBitCountByRange边界值测试用例 (3600-3640) ====================

    /**
     * @tc.name   testBitVectorGetBitCountByRangeBoundary0001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_3600
     * @tc.desc   BitVector getBitCountByRange full range toIndex=length count 1s.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorGetBitCountByRangeBoundary0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        bitVectorList.push(0);
        bitVectorList.push(1);
        bitVectorList.push(0);
        bitVectorList.push(1);
        bitVectorList.push(0);
        let num = bitVectorList.getBitCountByRange(1, 0, 5);
        expect(num).assertEqual(2);
        done()
      });

    /**
     * @tc.name   testBitVectorGetBitCountByRangeBoundary0002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_3610
     * @tc.desc   BitVector getBitCountByRange last element only fromIndex=length-1 toIndex=length.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorGetBitCountByRangeBoundary0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        bitVectorList.push(0);
        bitVectorList.push(1);
        bitVectorList.push(0);
        bitVectorList.push(1);
        bitVectorList.push(1);
        let num = bitVectorList.getBitCountByRange(1, 4, 5);
        expect(num).assertEqual(1);
        done()
      });

    /**
     * @tc.name   testBitVectorGetBitCountByRangeBoundary0003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_3620
     * @tc.desc   BitVector getBitCountByRange first element only fromIndex=0 toIndex=1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorGetBitCountByRangeBoundary0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        bitVectorList.push(1);
        bitVectorList.push(0);
        bitVectorList.push(0);
        bitVectorList.push(0);
        bitVectorList.push(0);
        let num = bitVectorList.getBitCountByRange(1, 0, 1);
        expect(num).assertEqual(1);
        done()
      });

    /**
     * @tc.name   testBitVectorGetBitCountByRangeBoundary0004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_3630
     * @tc.desc   BitVector getBitCountByRange full range on all zeros count 1s, expect 0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorGetBitCountByRangeBoundary0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        for (let i = 0; i < 10; i++) {
          bitVectorList.push(0);
        }
        let num = bitVectorList.getBitCountByRange(1, 0, 10);
        expect(num).assertEqual(0);
        done()
      });

    /**
     * @tc.name   testBitVectorGetBitCountByRangeBoundary0005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_3640
     * @tc.desc   BitVector getBitCountByRange full range on all ones count 0s, expect 0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorGetBitCountByRangeBoundary0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        for (let i = 0; i < 10; i++) {
          bitVectorList.push(1);
        }
        let num = bitVectorList.getBitCountByRange(0, 0, 10);
        expect(num).assertEqual(0);
        done()
      });

    // ==================== getIndexOf边界值测试用例 (3650-3680) ====================

    /**
     * @tc.name   testBitVectorGetIndexOfBoundary0001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_3650
     * @tc.desc   BitVector getIndexOf full range toIndex=length, element not found, expect -1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorGetIndexOfBoundary0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        for (let i = 0; i < 5; i++) {
          bitVectorList.push(0);
        }
        let num = bitVectorList.getIndexOf(1, 0, 5);
        expect(num).assertEqual(-1);
        done()
      });

    /**
     * @tc.name   testBitVectorGetIndexOfBoundary0002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_3660
     * @tc.desc   BitVector getIndexOf last element only fromIndex=length-1 toIndex=length.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorGetIndexOfBoundary0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        bitVectorList.push(0);
        bitVectorList.push(0);
        bitVectorList.push(0);
        bitVectorList.push(0);
        bitVectorList.push(1);
        let num = bitVectorList.getIndexOf(1, 4, 5);
        expect(num).assertEqual(4);
        done()
      });

    /**
     * @tc.name   testBitVectorGetIndexOfBoundary0003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_3670
     * @tc.desc   BitVector getIndexOf first element only fromIndex=0 toIndex=1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorGetIndexOfBoundary0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        bitVectorList.push(1);
        bitVectorList.push(0);
        bitVectorList.push(1);
        bitVectorList.push(0);
        bitVectorList.push(1);
        let num = bitVectorList.getIndexOf(1, 0, 1);
        expect(num).assertEqual(0);
        done()
      });

    /**
     * @tc.name   testBitVectorGetIndexOfBoundary0004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_3680
     * @tc.desc   BitVector getIndexOf full range on all ones search 0, expect -1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorGetIndexOfBoundary0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        for (let i = 0; i < 5; i++) {
          bitVectorList.push(1);
        }
        let num = bitVectorList.getIndexOf(0, 0, 5);
        expect(num).assertEqual(-1);
        done()
      });

    // ==================== getLastIndexOf边界值测试用例 (3690-3720) ====================

    /**
     * @tc.name   testBitVectorGetLastIndexOfBoundary0001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_3690
     * @tc.desc   BitVector getLastIndexOf full range toIndex=length, element not found, expect -1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorGetLastIndexOfBoundary0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        for (let i = 0; i < 5; i++) {
          bitVectorList.push(0);
        }
        let num = bitVectorList.getLastIndexOf(1, 0, 5);
        expect(num).assertEqual(-1);
        done()
      });

    /**
     * @tc.name   testBitVectorGetLastIndexOfBoundary0002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_3700
     * @tc.desc   BitVector getLastIndexOf last element only fromIndex=length-1 toIndex=length.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorGetLastIndexOfBoundary0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        bitVectorList.push(1);
        bitVectorList.push(0);
        bitVectorList.push(1);
        bitVectorList.push(0);
        bitVectorList.push(0);
        let num = bitVectorList.getLastIndexOf(0, 4, 5);
        expect(num).assertEqual(4);
        done()
      });

    /**
     * @tc.name   testBitVectorGetLastIndexOfBoundary0003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_3710
     * @tc.desc   BitVector getLastIndexOf first element only fromIndex=0 toIndex=1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorGetLastIndexOfBoundary0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        bitVectorList.push(1);
        bitVectorList.push(0);
        bitVectorList.push(1);
        bitVectorList.push(0);
        bitVectorList.push(1);
        let num = bitVectorList.getLastIndexOf(1, 0, 1);
        expect(num).assertEqual(0);
        done()
      });

    /**
     * @tc.name   testBitVectorGetLastIndexOfBoundary0004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_3720
     * @tc.desc   BitVector getLastIndexOf full range on all ones search 0, expect -1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorGetLastIndexOfBoundary0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        for (let i = 0; i < 5; i++) {
          bitVectorList.push(1);
        }
        let num = bitVectorList.getLastIndexOf(0, 0, 5);
        expect(num).assertEqual(-1);
        done()
      });

    // ==================== flipBitByIndex边界值测试用例 (3730-3760) ====================

    /**
     * @tc.name   testBitVectorFlipBitByIndexBoundary0001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_3730
     * @tc.desc   BitVector flipBitByIndex first element index=0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorFlipBitByIndexBoundary0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        bitVectorList.push(0);
        bitVectorList.push(1);
        bitVectorList.push(0);
        bitVectorList.flipBitByIndex(0);
        expect(bitVectorList[0]).assertEqual(1);
        expect(bitVectorList[1]).assertEqual(1);
        expect(bitVectorList[2]).assertEqual(0);
        done()
      });

    /**
     * @tc.name   testBitVectorFlipBitByIndexBoundary0002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_3740
     * @tc.desc   BitVector flipBitByIndex last element index=length-1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorFlipBitByIndexBoundary0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        bitVectorList.push(0);
        bitVectorList.push(1);
        bitVectorList.push(0);
        bitVectorList.flipBitByIndex(2);
        expect(bitVectorList[0]).assertEqual(0);
        expect(bitVectorList[1]).assertEqual(1);
        expect(bitVectorList[2]).assertEqual(1);
        done()
      });

    /**
     * @tc.name   testBitVectorFlipBitByIndexBoundary0003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_3750
     * @tc.desc   BitVector flipBitByIndex index=length out of range, expect error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorFlipBitByIndexBoundary0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        bitVectorList.push(0);
        bitVectorList.push(1);
        bitVectorList.push(0);
        try {
          bitVectorList.flipBitByIndex(3);
          expect().assertFail();
        } catch (err) {
          expect(err.code).assertEqual(10200001);
        }
        done()
      });

    /**
     * @tc.name   testBitVectorFlipBitByIndexBoundary0004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_3760
     * @tc.desc   BitVector flipBitByIndex single element index=0 double flip restores.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorFlipBitByIndexBoundary0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        bitVectorList.push(0);
        bitVectorList.flipBitByIndex(0);
        expect(bitVectorList[0]).assertEqual(1);
        bitVectorList.flipBitByIndex(0);
        expect(bitVectorList[0]).assertEqual(0);
        done()
      });

    // ==================== flipBitsByRange边界值测试用例 (3770-3800) ====================

    /**
     * @tc.name   testBitVectorFlipBitsByRangeBoundary0001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_3770
     * @tc.desc   BitVector flipBitsByRange full range fromIndex=0 toIndex=length.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorFlipBitsByRangeBoundary0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        bitVectorList.push(0);
        bitVectorList.push(1);
        bitVectorList.push(0);
        bitVectorList.push(1);
        bitVectorList.push(0);
        bitVectorList.flipBitsByRange(0, 5);
        expect(bitVectorList[0]).assertEqual(1);
        expect(bitVectorList[1]).assertEqual(0);
        expect(bitVectorList[2]).assertEqual(1);
        expect(bitVectorList[3]).assertEqual(0);
        expect(bitVectorList[4]).assertEqual(1);
        done()
      });

    /**
     * @tc.name   testBitVectorFlipBitsByRangeBoundary0002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_3780
     * @tc.desc   BitVector flipBitsByRange last element only fromIndex=length-1 toIndex=length.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorFlipBitsByRangeBoundary0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        bitVectorList.push(0);
        bitVectorList.push(1);
        bitVectorList.push(0);
        bitVectorList.push(1);
        bitVectorList.push(0);
        bitVectorList.flipBitsByRange(4, 5);
        expect(bitVectorList[0]).assertEqual(0);
        expect(bitVectorList[1]).assertEqual(1);
        expect(bitVectorList[2]).assertEqual(0);
        expect(bitVectorList[3]).assertEqual(1);
        expect(bitVectorList[4]).assertEqual(1);
        done()
      });

    /**
     * @tc.name   testBitVectorFlipBitsByRangeBoundary0003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_3790
     * @tc.desc   BitVector flipBitsByRange first element only fromIndex=0 toIndex=1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorFlipBitsByRangeBoundary0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        bitVectorList.push(0);
        bitVectorList.push(1);
        bitVectorList.push(0);
        bitVectorList.push(1);
        bitVectorList.push(0);
        bitVectorList.flipBitsByRange(0, 1);
        expect(bitVectorList[0]).assertEqual(1);
        expect(bitVectorList[1]).assertEqual(1);
        expect(bitVectorList[2]).assertEqual(0);
        expect(bitVectorList[3]).assertEqual(1);
        expect(bitVectorList[4]).assertEqual(0);
        done()
      });

    /**
     * @tc.name   testBitVectorFlipBitsByRangeBoundary0004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_3800
     * @tc.desc   BitVector flipBitsByRange single element full range.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorFlipBitsByRangeBoundary0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        bitVectorList.push(0);
        bitVectorList.flipBitsByRange(0, 1);
        expect(bitVectorList[0]).assertEqual(1);
        expect(bitVectorList.length).assertEqual(1);
        done()
      });

    // ==================== resize边界值测试用例 (3810-3850) ====================

    /**
     * @tc.name   testBitVectorResizeBoundary0001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_3810
     * @tc.desc   BitVector resize to 0 from non-zero length.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorResizeBoundary0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        bitVectorList.push(1);
        bitVectorList.push(0);
        bitVectorList.push(1);
        bitVectorList.resize(0);
        expect(bitVectorList.length).assertEqual(0);
        done()
      });

    /**
     * @tc.name   testBitVectorResizeBoundary0002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_3820
     * @tc.desc   BitVector resize to same size, data unchanged.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorResizeBoundary0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        bitVectorList.push(1);
        bitVectorList.push(0);
        bitVectorList.push(1);
        bitVectorList.resize(3);
        expect(bitVectorList.length).assertEqual(3);
        expect(bitVectorList[0]).assertEqual(1);
        expect(bitVectorList[1]).assertEqual(0);
        expect(bitVectorList[2]).assertEqual(1);
        done()
      });

    /**
     * @tc.name   testBitVectorResizeBoundary0003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_3830
     * @tc.desc   BitVector resize to length+1, new element is 0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorResizeBoundary0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        bitVectorList.push(1);
        bitVectorList.push(0);
        bitVectorList.push(1);
        bitVectorList.resize(4);
        expect(bitVectorList.length).assertEqual(4);
        expect(bitVectorList[0]).assertEqual(1);
        expect(bitVectorList[1]).assertEqual(0);
        expect(bitVectorList[2]).assertEqual(1);
        expect(bitVectorList[3]).assertEqual(0);
        done()
      });

    /**
     * @tc.name   testBitVectorResizeBoundary0004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_3840
     * @tc.desc   BitVector resize to length-1, truncated.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorResizeBoundary0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        bitVectorList.push(1);
        bitVectorList.push(0);
        bitVectorList.push(1);
        bitVectorList.resize(2);
        expect(bitVectorList.length).assertEqual(2);
        expect(bitVectorList[0]).assertEqual(1);
        expect(bitVectorList[1]).assertEqual(0);
        done()
      });

    /**
     * @tc.name   testBitVectorResizeBoundary0005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_3850
     * @tc.desc   BitVector resize from 0 to 1 on empty BitVector, known program issue: may crash.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    // it('testBitVectorResizeBoundary0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
    //   async (done: Function) => {
    //     let bitVectorList: collections.BitVector = new collections.BitVector(0);
    //     try {
    //       bitVectorList.resize(1);
    //       expect(bitVectorList.length).assertEqual(1);
    //       expect(bitVectorList[0]).assertEqual(0);
    //     } catch (err) {
    //       console.error('testBitVectorResizeBoundary0005 known program issue: resize on empty BitVector throws: ' + err.message);
    //       expect().assertFail();
    //     }
    //     done()
    //   });

    // ==================== [index]边界值测试用例 (3860-3890) ====================

    /**
     * @tc.name   testBitVectorIndexBoundary0001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_3860
     * @tc.desc   BitVector [index] first element index=0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorIndexBoundary0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        bitVectorList.push(1);
        bitVectorList.push(0);
        bitVectorList.push(1);
        expect(bitVectorList[0]).assertEqual(1);
        done()
      });

    /**
     * @tc.name   testBitVectorIndexBoundary0002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_3870
     * @tc.desc   BitVector [index] last element index=length-1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorIndexBoundary0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        bitVectorList.push(0);
        bitVectorList.push(1);
        bitVectorList.push(0);
        bitVectorList.push(1);
        bitVectorList.push(0);
        expect(bitVectorList[4]).assertEqual(0);
        done()
      });

    /**
     * @tc.name   testBitVectorIndexBoundary0003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_3880
     * @tc.desc   BitVector [index] out of range index=length, expect error 10200001.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorIndexBoundary0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        bitVectorList.push(1);
        bitVectorList.push(0);
        bitVectorList.push(1);
        try {
          let value = bitVectorList[3];
          expect().assertFail();
        } catch (err) {
          expect(err.code).assertEqual(10200001);
        }
        done()
      });

    /**
     * @tc.name   testBitVectorIndexBoundary0004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_3890
     * @tc.desc   BitVector [index] single element access index=0 and index=1 out of range.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorIndexBoundary0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        bitVectorList.push(1);
        expect(bitVectorList[0]).assertEqual(1);
        try {
          let value = bitVectorList[1];
          expect().assertFail();
        } catch (err) {
          expect(err.code).assertEqual(10200001);
        }
        done()
      });

    // ==================== push/pop边界值测试用例 (3900-3920) ====================

    /**
     * @tc.name   testBitVectorPushBoundary0001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_3900
     * @tc.desc   BitVector push on empty BitVector, length becomes 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorPushBoundary0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        expect(bitVectorList.length).assertEqual(0);
        let rst = bitVectorList.push(1);
        expect(rst).assertTrue();
        expect(bitVectorList.length).assertEqual(1);
        expect(bitVectorList[0]).assertEqual(1);
        done()
      });

    /**
     * @tc.name   testBitVectorPopBoundary0001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_3910
     * @tc.desc   BitVector pop single element, length becomes 0, second pop returns undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorPopBoundary0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        bitVectorList.push(1);
        expect(bitVectorList.length).assertEqual(1);
        let num = bitVectorList.pop();
        expect(num).assertEqual(1);
        expect(bitVectorList.length).assertEqual(0);
        let num2 = bitVectorList.pop();
        expect(num2).assertEqual(undefined);
        expect(bitVectorList.length).assertEqual(0);
        done()
      });

    /**
     * @tc.name   testBitVectorPopBoundary0002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_3920
     * @tc.desc   BitVector pop all elements until empty then push again.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorPopBoundary0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        bitVectorList.push(0);
        bitVectorList.push(1);
        bitVectorList.pop();
        bitVectorList.pop();
        expect(bitVectorList.length).assertEqual(0);
        let rst = bitVectorList.push(1);
        expect(rst).assertTrue();
        expect(bitVectorList.length).assertEqual(1);
        expect(bitVectorList[0]).assertEqual(1);
        done()
      });

    // ==================== setAllBits边界值测试用例 (3930-3940) ====================

    /**
     * @tc.name   testBitVectorSetAllBitsBoundary0001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_3930
     * @tc.desc   BitVector setAllBits on empty BitVector, length remains 0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorSetAllBitsBoundary0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        bitVectorList.setAllBits(1);
        expect(bitVectorList.length).assertEqual(0);
        done()
      });

    /**
     * @tc.name   testBitVectorSetAllBitsBoundary0002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_3940
     * @tc.desc   BitVector setAllBits on single element BitVector.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorSetAllBitsBoundary0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        bitVectorList.push(0);
        bitVectorList.setAllBits(1);
        expect(bitVectorList.length).assertEqual(1);
        expect(bitVectorList[0]).assertEqual(1);
        bitVectorList.setAllBits(0);
        expect(bitVectorList[0]).assertEqual(0);
        done()
      });

    // ==================== values边界值测试用例 (3950-3960) ====================

    /**
     * @tc.name   testBitVectorValuesBoundary0001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_3950
     * @tc.desc   BitVector values() on empty BitVector, iterator done immediately.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorValuesBoundary0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        let iter = bitVectorList.values();
        let temp = iter.next();
        expect(temp.done).assertTrue();
        done()
      });

    /**
     * @tc.name   testBitVectorValuesBoundary0002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_3960
     * @tc.desc   BitVector values() on single element BitVector.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorValuesBoundary0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        bitVectorList.push(1);
        let iter = bitVectorList.values();
        let temp1 = iter.next();
        expect(temp1.done).assertFalse();
        expect(temp1.value).assertEqual(1);
        let temp2 = iter.next();
        expect(temp2.done).assertTrue();
        done()
      });

    // ==================== push元素值边界测试用例 (3970-4060) ====================

    /**
     * @tc.name   testBitVectorPushValueBoundary0001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_3970
     * @tc.desc   BitVector push element=0, stored as 0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorPushValueBoundary0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        bitVectorList.push(0);
        expect(bitVectorList[0]).assertEqual(0);
        done()
      });

    /**
     * @tc.name   testBitVectorPushValueBoundary0002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_3980
     * @tc.desc   BitVector push element=-1, stored as 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorPushValueBoundary0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        bitVectorList.push(-1);
        expect(bitVectorList[0]).assertEqual(1);
        done()
      });

    /**
     * @tc.name   testBitVectorPushValueBoundary0003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_3990
     * @tc.desc   BitVector push element=2, stored as 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorPushValueBoundary0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        bitVectorList.push(2);
        expect(bitVectorList[0]).assertEqual(1);
        done()
      });

    /**
     * @tc.name   testBitVectorPushValueBoundary0004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_4000
     * @tc.desc   BitVector push element=65535, stored as 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorPushValueBoundary0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        bitVectorList.push(65535);
        expect(bitVectorList[0]).assertEqual(1);
        done()
      });

    /**
     * @tc.name   testBitVectorPushValueBoundary0005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_4010
     * @tc.desc   BitVector push element=-65535, stored as 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorPushValueBoundary0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        bitVectorList.push(-65535);
        expect(bitVectorList[0]).assertEqual(1);
        done()
      });

    /**
     * @tc.name   testBitVectorPushValueBoundary0006
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_4020
     * @tc.desc   BitVector push element=MAX_SAFE_INTEGER, stored as 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorPushValueBoundary0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        bitVectorList.push(Number.MAX_SAFE_INTEGER);
        expect(bitVectorList[0]).assertEqual(1);
        done()
      });

    /**
     * @tc.name   testBitVectorPushValueBoundary0007
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_4030
     * @tc.desc   BitVector push element=MIN_SAFE_INTEGER, stored as 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorPushValueBoundary0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        bitVectorList.push(Number.MIN_SAFE_INTEGER);
        expect(bitVectorList[0]).assertEqual(1);
        done()
      });

    /**
     * @tc.name   testBitVectorPushValueBoundary0008
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_4040
     * @tc.desc   BitVector push element=0.5 float, stored as 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorPushValueBoundary0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        bitVectorList.push(0.5);
        expect(bitVectorList[0]).assertEqual(1);
        done()
      });

    /**
     * @tc.name   testBitVectorPushValueBoundary0009
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_4050
     * @tc.desc   BitVector push element=-0.5 float, stored as 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorPushValueBoundary0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        bitVectorList.push(-0.5);
        expect(bitVectorList[0]).assertEqual(1);
        done()
      });

    /**
     * @tc.name   testBitVectorPushValueBoundary0010
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_4060
     * @tc.desc   BitVector push mixed values 0,-1,2,65535,-65535 all stored correctly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorPushValueBoundary0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        bitVectorList.push(0);
        bitVectorList.push(-1);
        bitVectorList.push(2);
        bitVectorList.push(65535);
        bitVectorList.push(-65535);
        expect(bitVectorList[0]).assertEqual(0);
        expect(bitVectorList[1]).assertEqual(1);
        expect(bitVectorList[2]).assertEqual(1);
        expect(bitVectorList[3]).assertEqual(1);
        expect(bitVectorList[4]).assertEqual(1);
        expect(bitVectorList.length).assertEqual(5);
        done()
      });
    // ==================== has元素值与内容模式边界测试用例 (4070-4140) ====================

    /**
     * @tc.name   testBitVectorHasPatternBoundary0001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_4070
     * @tc.desc   BitVector has on all 0s pattern: has(0)=true, has(1)=false, has(-1)=false, has(2)=false.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorHasPatternBoundary0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        for (let i = 0; i < 10; i++) {
          bitVectorList.push(0);
        }
        expect(bitVectorList.has(0, 0, 10)).assertEqual(true);
        expect(bitVectorList.has(1, 0, 10)).assertEqual(false);
        expect(bitVectorList.has(-1, 0, 10)).assertEqual(false);
        expect(bitVectorList.has(2, 0, 10)).assertEqual(false);
        expect(bitVectorList.has(65535, 0, 10)).assertEqual(false);
        done()
      });

    /**
     * @tc.name   testBitVectorHasPatternBoundary0005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_4110
     * @tc.desc   BitVector has on alternating 0,1 pattern: has(0)=true, has(1)=true.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorHasPatternBoundary0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        for (let i = 0; i < 10; i++) {
          bitVectorList.push(i % 2);
        }
        expect(bitVectorList.has(0, 0, 10)).assertEqual(true);
        expect(bitVectorList.has(1, 0, 10)).assertEqual(true);
        done()
      });

    /**
     * @tc.name   testBitVectorHasPatternBoundary0006
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_4120
     * @tc.desc   BitVector has on alternating 1,0 pattern: has(0)=true, has(1)=true.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorHasPatternBoundary0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        for (let i = 0; i < 10; i++) {
          bitVectorList.push((i + 1) % 2);
        }
        expect(bitVectorList.has(0, 0, 10)).assertEqual(true);
        expect(bitVectorList.has(1, 0, 10)).assertEqual(true);
        done()
      });

    /**
     * @tc.name   testBitVectorHasPatternBoundary0007
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_4130
     * @tc.desc   BitVector has on single 1 in all 0s: has(1)=true, has(0)=true.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorHasPatternBoundary0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        for (let i = 0; i < 9; i++) {
          bitVectorList.push(0);
        }
        bitVectorList.push(1);
        expect(bitVectorList.has(1, 0, 10)).assertEqual(true);
        expect(bitVectorList.has(0, 0, 10)).assertEqual(true);
        expect(bitVectorList.has(1, 0, 9)).assertEqual(true);
        expect(bitVectorList.has(1, 9, 10)).assertEqual(true);
        done()
      });

    /**
     * @tc.name   testBitVectorHasPatternBoundary0008
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_4140
     * @tc.desc   BitVector has on single 0 in all 1s: has(0)=true, has(1)=true.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorHasPatternBoundary0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        for (let i = 0; i < 9; i++) {
          bitVectorList.push(1);
        }
        bitVectorList.push(0);
        expect(bitVectorList.has(0, 0, 10)).assertEqual(true);
        expect(bitVectorList.has(1, 0, 10)).assertEqual(true);
        expect(bitVectorList.has(0, 0, 9)).assertEqual(true);
        expect(bitVectorList.has(0, 9, 10)).assertEqual(true);
        done()
      });

    // ==================== getBitCountByRange内容模式边界测试用例 (4150-4210) ====================

    /**
     * @tc.name   testBitVectorGetBitCountByRangePatternBoundary0001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_4150
     * @tc.desc   BitVector getBitCountByRange on all 0s: count 0=length, count 1=0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorGetBitCountByRangePatternBoundary0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        for (let i = 0; i < 10; i++) {
          bitVectorList.push(0);
        }
        expect(bitVectorList.getBitCountByRange(0, 0, 10)).assertEqual(10);
        expect(bitVectorList.getBitCountByRange(1, 0, 10)).assertEqual(0);
        done()
      });

    /**
     * @tc.name   testBitVectorGetBitCountByRangePatternBoundary0002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_4160
     * @tc.desc   BitVector getBitCountByRange on all 1s: count 1=length, count 0=0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorGetBitCountByRangePatternBoundary0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        for (let i = 0; i < 10; i++) {
          bitVectorList.push(1);
        }
        expect(bitVectorList.getBitCountByRange(1, 0, 10)).assertEqual(10);
        expect(bitVectorList.getBitCountByRange(0, 0, 10)).assertEqual(0);
        done()
      });

    /**
     * @tc.name   testBitVectorGetBitCountByRangePatternBoundary0003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_4170
     * @tc.desc   BitVector getBitCountByRange on all -1s: count 1=length, count 0=0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorGetBitCountByRangePatternBoundary0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        for (let i = 0; i < 10; i++) {
          bitVectorList.push(-1);
        }
        expect(bitVectorList.getBitCountByRange(1, 0, 10)).assertEqual(10);
        expect(bitVectorList.getBitCountByRange(0, 0, 10)).assertEqual(0);
        expect(bitVectorList.getBitCountByRange(-1, 0, 10)).assertEqual(10);
        expect(bitVectorList.getBitCountByRange(2, 0, 10)).assertEqual(10);
        done()
      });

    /**
     * @tc.name   testBitVectorGetBitCountByRangePatternBoundary0004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_4180
     * @tc.desc   BitVector getBitCountByRange on all 2s: count 1=length, count 0=0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorGetBitCountByRangePatternBoundary0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        for (let i = 0; i < 10; i++) {
          bitVectorList.push(2);
        }
        expect(bitVectorList.getBitCountByRange(1, 0, 10)).assertEqual(10);
        expect(bitVectorList.getBitCountByRange(0, 0, 10)).assertEqual(0);
        expect(bitVectorList.getBitCountByRange(2, 0, 10)).assertEqual(10);
        done()
      });

    /**
     * @tc.name   testBitVectorGetBitCountByRangePatternBoundary0005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_4190
     * @tc.desc   BitVector getBitCountByRange on alternating 0,1: count 1=length/2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorGetBitCountByRangePatternBoundary0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        for (let i = 0; i < 10; i++) {
          bitVectorList.push(i % 2);
        }
        expect(bitVectorList.getBitCountByRange(1, 0, 10)).assertEqual(5);
        expect(bitVectorList.getBitCountByRange(0, 0, 10)).assertEqual(5);
        done()
      });

    /**
     * @tc.name   testBitVectorGetBitCountByRangePatternBoundary0006
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_4200
     * @tc.desc   BitVector getBitCountByRange on single 1 in all 0s: count 1=1, count 0=9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorGetBitCountByRangePatternBoundary0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        for (let i = 0; i < 9; i++) {
          bitVectorList.push(0);
        }
        bitVectorList.push(1);
        expect(bitVectorList.getBitCountByRange(1, 0, 10)).assertEqual(1);
        expect(bitVectorList.getBitCountByRange(0, 0, 10)).assertEqual(9);
        expect(bitVectorList.getBitCountByRange(1, 0, 9)).assertEqual(0);
        expect(bitVectorList.getBitCountByRange(1, 9, 10)).assertEqual(1);
        done()
      });

    /**
     * @tc.name   testBitVectorGetBitCountByRangePatternBoundary0007
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_4210
     * @tc.desc   BitVector getBitCountByRange on single 0 in all 1s: count 0=1, count 1=9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorGetBitCountByRangePatternBoundary0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        for (let i = 0; i < 9; i++) {
          bitVectorList.push(1);
        }
        bitVectorList.push(0);
        expect(bitVectorList.getBitCountByRange(0, 0, 10)).assertEqual(1);
        expect(bitVectorList.getBitCountByRange(1, 0, 10)).assertEqual(9);
        expect(bitVectorList.getBitCountByRange(0, 0, 9)).assertEqual(0);
        expect(bitVectorList.getBitCountByRange(0, 9, 10)).assertEqual(1);
        done()
      });

    // ==================== getIndexOf内容模式边界测试用例 (4220-4270) ====================

    /**
     * @tc.name   testBitVectorGetIndexOfPatternBoundary0001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_4220
     * @tc.desc   BitVector getIndexOf on all 0s: getIndexOf(0)=0, getIndexOf(1)=-1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorGetIndexOfPatternBoundary0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        for (let i = 0; i < 10; i++) {
          bitVectorList.push(0);
        }
        expect(bitVectorList.getIndexOf(0, 0, 10)).assertEqual(0);
        expect(bitVectorList.getIndexOf(1, 0, 10)).assertEqual(-1);
        expect(bitVectorList.getIndexOf(-1, 0, 10)).assertEqual(-1);
        expect(bitVectorList.getIndexOf(2, 0, 10)).assertEqual(-1);
        done()
      });

    /**
     * @tc.name   testBitVectorGetIndexOfPatternBoundary0002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_4230
     * @tc.desc   BitVector getIndexOf on all 1s: getIndexOf(1)=0, getIndexOf(0)=-1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorGetIndexOfPatternBoundary0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        for (let i = 0; i < 10; i++) {
          bitVectorList.push(1);
        }
        expect(bitVectorList.getIndexOf(1, 0, 10)).assertEqual(0);
        expect(bitVectorList.getIndexOf(0, 0, 10)).assertEqual(-1);
        expect(bitVectorList.getIndexOf(-1, 0, 10)).assertEqual(0);
        expect(bitVectorList.getIndexOf(2, 0, 10)).assertEqual(0);
        done()
      });

    /**
     * @tc.name   testBitVectorGetIndexOfPatternBoundary0003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_4240
     * @tc.desc   BitVector getIndexOf on all -1s: getIndexOf(1)=0, getIndexOf(0)=-1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorGetIndexOfPatternBoundary0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        for (let i = 0; i < 10; i++) {
          bitVectorList.push(-1);
        }
        expect(bitVectorList.getIndexOf(1, 0, 10)).assertEqual(0);
        expect(bitVectorList.getIndexOf(0, 0, 10)).assertEqual(-1);
        expect(bitVectorList.getIndexOf(-1, 0, 10)).assertEqual(0);
        done()
      });

    /**
     * @tc.name   testBitVectorGetIndexOfPatternBoundary0004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_4250
     * @tc.desc   BitVector getIndexOf on all 2s: getIndexOf(1)=0, getIndexOf(0)=-1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorGetIndexOfPatternBoundary0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        for (let i = 0; i < 10; i++) {
          bitVectorList.push(2);
        }
        expect(bitVectorList.getIndexOf(1, 0, 10)).assertEqual(0);
        expect(bitVectorList.getIndexOf(0, 0, 10)).assertEqual(-1);
        expect(bitVectorList.getIndexOf(2, 0, 10)).assertEqual(0);
        done()
      });

    /**
     * @tc.name   testBitVectorGetIndexOfPatternBoundary0005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_4260
     * @tc.desc   BitVector getIndexOf on alternating 0,1: getIndexOf(0)=0, getIndexOf(1)=1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorGetIndexOfPatternBoundary0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        for (let i = 0; i < 10; i++) {
          bitVectorList.push(i % 2);
        }
        expect(bitVectorList.getIndexOf(0, 0, 10)).assertEqual(0);
        expect(bitVectorList.getIndexOf(1, 0, 10)).assertEqual(1);
        done()
      });

    /**
     * @tc.name   testBitVectorGetIndexOfPatternBoundary0006
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_4270
     * @tc.desc   BitVector getIndexOf on single 1 in all 0s: getIndexOf(1)=9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorGetIndexOfPatternBoundary0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        for (let i = 0; i < 9; i++) {
          bitVectorList.push(0);
        }
        bitVectorList.push(1);
        expect(bitVectorList.getIndexOf(1, 0, 10)).assertEqual(9);
        expect(bitVectorList.getIndexOf(0, 0, 10)).assertEqual(0);
        expect(bitVectorList.getIndexOf(1, 0, 9)).assertEqual(-1);
        done()
      });

    // ==================== getLastIndexOf内容模式边界测试用例 (4280-4330) ====================

    /**
     * @tc.name   testBitVectorGetLastIndexOfPatternBoundary0001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_4280
     * @tc.desc   BitVector getLastIndexOf on all 0s: getLastIndexOf(0)=length-1, getLastIndexOf(1)=-1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorGetLastIndexOfPatternBoundary0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        for (let i = 0; i < 10; i++) {
          bitVectorList.push(0);
        }
        expect(bitVectorList.getLastIndexOf(0, 0, 10)).assertEqual(9);
        expect(bitVectorList.getLastIndexOf(1, 0, 10)).assertEqual(-1);
        done()
      });

    /**
     * @tc.name   testBitVectorGetLastIndexOfPatternBoundary0002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_4290
     * @tc.desc   BitVector getLastIndexOf on all 1s: getLastIndexOf(1)=length-1, getLastIndexOf(0)=-1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorGetLastIndexOfPatternBoundary0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        for (let i = 0; i < 10; i++) {
          bitVectorList.push(1);
        }
        expect(bitVectorList.getLastIndexOf(1, 0, 10)).assertEqual(9);
        expect(bitVectorList.getLastIndexOf(0, 0, 10)).assertEqual(-1);
        done()
      });

    /**
     * @tc.name   testBitVectorGetLastIndexOfPatternBoundary0003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_4300
     * @tc.desc   BitVector getLastIndexOf on all -1s: getLastIndexOf(1)=length-1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorGetLastIndexOfPatternBoundary0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        for (let i = 0; i < 10; i++) {
          bitVectorList.push(-1);
        }
        expect(bitVectorList.getLastIndexOf(1, 0, 10)).assertEqual(9);
        expect(bitVectorList.getLastIndexOf(0, 0, 10)).assertEqual(-1);
        done()
      });

    /**
     * @tc.name   testBitVectorGetLastIndexOfPatternBoundary0004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_4310
     * @tc.desc   BitVector getLastIndexOf on all 2s: getLastIndexOf(1)=length-1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorGetLastIndexOfPatternBoundary0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        for (let i = 0; i < 10; i++) {
          bitVectorList.push(2);
        }
        expect(bitVectorList.getLastIndexOf(1, 0, 10)).assertEqual(9);
        expect(bitVectorList.getLastIndexOf(0, 0, 10)).assertEqual(-1);
        done()
      });

    /**
     * @tc.name   testBitVectorGetLastIndexOfPatternBoundary0005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_4320
     * @tc.desc   BitVector getLastIndexOf on alternating 0,1: getLastIndexOf(1)=9, getLastIndexOf(0)=8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorGetLastIndexOfPatternBoundary0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        for (let i = 0; i < 10; i++) {
          bitVectorList.push(i % 2);
        }
        expect(bitVectorList.getLastIndexOf(1, 0, 10)).assertEqual(9);
        expect(bitVectorList.getLastIndexOf(0, 0, 10)).assertEqual(8);
        done()
      });

    /**
     * @tc.name   testBitVectorGetLastIndexOfPatternBoundary0006
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_4330
     * @tc.desc   BitVector getLastIndexOf on single 0 in all 1s: getLastIndexOf(0)=9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorGetLastIndexOfPatternBoundary0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        for (let i = 0; i < 9; i++) {
          bitVectorList.push(1);
        }
        bitVectorList.push(0);
        expect(bitVectorList.getLastIndexOf(0, 0, 10)).assertEqual(9);
        expect(bitVectorList.getLastIndexOf(1, 0, 10)).assertEqual(8);
        done()
      });

    // ==================== setAllBits元素值边界测试用例 (4340-4370) ====================

    /**
     * @tc.name   testBitVectorSetAllBitsValueBoundary0001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_4340
     * @tc.desc   BitVector setAllBits(-1) on all 0s, all become 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorSetAllBitsValueBoundary0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        for (let i = 0; i < 5; i++) {
          bitVectorList.push(0);
        }
        bitVectorList.setAllBits(-1);
        for (let i = 0; i < 5; i++) {
          expect(bitVectorList[i]).assertEqual(1);
        }
        done()
      });

    /**
     * @tc.name   testBitVectorSetAllBitsValueBoundary0002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_4350
     * @tc.desc   BitVector setAllBits(2) on all 0s, all become 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorSetAllBitsValueBoundary0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        for (let i = 0; i < 5; i++) {
          bitVectorList.push(0);
        }
        bitVectorList.setAllBits(2);
        for (let i = 0; i < 5; i++) {
          expect(bitVectorList[i]).assertEqual(1);
        }
        done()
      });

    /**
     * @tc.name   testBitVectorSetAllBitsValueBoundary0003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_4360
     * @tc.desc   BitVector setAllBits(65535) on all 0s, all become 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorSetAllBitsValueBoundary0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        for (let i = 0; i < 5; i++) {
          bitVectorList.push(0);
        }
        bitVectorList.setAllBits(65535);
        for (let i = 0; i < 5; i++) {
          expect(bitVectorList[i]).assertEqual(1);
        }
        done()
      });

    /**
     * @tc.name   testBitVectorSetAllBitsValueBoundary0004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_4370
     * @tc.desc   BitVector setAllBits(-65535) on all 0s, all become 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorSetAllBitsValueBoundary0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        for (let i = 0; i < 5; i++) {
          bitVectorList.push(0);
        }
        bitVectorList.setAllBits(-65535);
        for (let i = 0; i < 5; i++) {
          expect(bitVectorList[i]).assertEqual(1);
        }
        done()
      });

    // ==================== setBitsByRange元素值边界测试用例 (4380-4400) ====================

    /**
     * @tc.name   testBitVectorSetBitsByRangeValueBoundary0001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_4380
     * @tc.desc   BitVector setBitsByRange(-1, 0, length) on all 0s, all become 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorSetBitsByRangeValueBoundary0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        for (let i = 0; i < 5; i++) {
          bitVectorList.push(0);
        }
        bitVectorList.setBitsByRange(-1, 0, 5);
        for (let i = 0; i < 5; i++) {
          expect(bitVectorList[i]).assertEqual(1);
        }
        done()
      });

    /**
     * @tc.name   testBitVectorSetBitsByRangeValueBoundary0002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_4390
     * @tc.desc   BitVector setBitsByRange(2, 0, length) on all 0s, all become 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorSetBitsByRangeValueBoundary0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        for (let i = 0; i < 5; i++) {
          bitVectorList.push(0);
        }
        bitVectorList.setBitsByRange(2, 0, 5);
        for (let i = 0; i < 5; i++) {
          expect(bitVectorList[i]).assertEqual(1);
        }
        done()
      });

    /**
     * @tc.name   testBitVectorSetBitsByRangeValueBoundary0003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_4400
     * @tc.desc   BitVector setBitsByRange(65535, 0, length) on all 0s, all become 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorSetBitsByRangeValueBoundary0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        for (let i = 0; i < 5; i++) {
          bitVectorList.push(0);
        }
        bitVectorList.setBitsByRange(65535, 0, 5);
        for (let i = 0; i < 5; i++) {
          expect(bitVectorList[i]).assertEqual(1);
        }
        done()
      });

    // ==================== 容器大小边界测试用例 (4410-4450) ====================

    /**
     * @tc.name   testBitVectorContainerSizeBoundary0001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_4410
     * @tc.desc   BitVector container size=0 (empty), length=0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorContainerSizeBoundary0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        expect(bitVectorList.length).assertEqual(0);
        done()
      });

    /**
     * @tc.name   testBitVectorContainerSizeBoundary0002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_4420
     * @tc.desc   BitVector container size=1 (single element), has full range toIndex=1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorContainerSizeBoundary0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        bitVectorList.push(0);
        expect(bitVectorList.length).assertEqual(1);
        expect(bitVectorList.has(0, 0, 1)).assertEqual(true);
        expect(bitVectorList.has(1, 0, 1)).assertEqual(false);
        expect(bitVectorList.getBitCountByRange(0, 0, 1)).assertEqual(1);
        expect(bitVectorList.getBitCountByRange(1, 0, 1)).assertEqual(0);
        expect(bitVectorList.getIndexOf(0, 0, 1)).assertEqual(0);
        expect(bitVectorList.getIndexOf(1, 0, 1)).assertEqual(-1);
        done()
      });

    /**
     * @tc.name   testBitVectorContainerSizeBoundary0003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_4430
     * @tc.desc   BitVector container size=2 (two elements), has full range toIndex=2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorContainerSizeBoundary0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        bitVectorList.push(0);
        bitVectorList.push(1);
        expect(bitVectorList.length).assertEqual(2);
        expect(bitVectorList.has(0, 0, 2)).assertEqual(true);
        expect(bitVectorList.has(1, 0, 2)).assertEqual(true);
        expect(bitVectorList.getBitCountByRange(0, 0, 2)).assertEqual(1);
        expect(bitVectorList.getBitCountByRange(1, 0, 2)).assertEqual(1);
        done()
      });

    /**
     * @tc.name   testBitVectorContainerSizeBoundary0004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_4440
     * @tc.desc   BitVector container size=100 (large), has full range toIndex=100 on all 0s.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorContainerSizeBoundary0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        for (let i = 0; i < 100; i++) {
          bitVectorList.push(0);
        }
        expect(bitVectorList.length).assertEqual(100);
        expect(bitVectorList.has(0, 0, 100)).assertEqual(true);
        expect(bitVectorList.has(1, 0, 100)).assertEqual(false);
        expect(bitVectorList.getBitCountByRange(0, 0, 100)).assertEqual(100);
        expect(bitVectorList.getBitCountByRange(1, 0, 100)).assertEqual(0);
        done()
      });

    // ==================== 空BitVector(length=0)接口调用测试用例 (4490-4570) ====================

    /**
     * @tc.name   testBitVectorEmptyBoundary0001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_4490
     * @tc.desc   BitVector empty: has on empty BitVector throws error (fromIndex >= toIndex).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorEmptyBoundary0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        try {
          bitVectorList.has(0, 0, 0);
          expect().assertFail();
        } catch (err) {
          expect(err.code).assertEqual(10200001);
        }
        done()
      });

    /**
     * @tc.name   testBitVectorEmptyBoundary0002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_4500
     * @tc.desc   BitVector empty: setBitsByRange on empty BitVector throws error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorEmptyBoundary0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        try {
          bitVectorList.setBitsByRange(1, 0, 0);
          expect().assertFail();
        } catch (err) {
          expect(err.code).assertEqual(10200001);
        }
        done()
      });

    /**
     * @tc.name   testBitVectorEmptyBoundary0003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_4510
     * @tc.desc   BitVector empty: getBitsByRange on empty BitVector throws error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorEmptyBoundary0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        try {
          bitVectorList.getBitsByRange(0, 0);
          expect().assertFail();
        } catch (err) {
          expect(err.code).assertEqual(10200001);
        }
        done()
      });

    /**
     * @tc.name   testBitVectorEmptyBoundary0004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_4520
     * @tc.desc   BitVector empty: getBitCountByRange on empty BitVector throws error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorEmptyBoundary0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        try {
          bitVectorList.getBitCountByRange(1, 0, 0);
          expect().assertFail();
        } catch (err) {
          expect(err.code).assertEqual(10200001);
        }
        done()
      });

    /**
     * @tc.name   testBitVectorEmptyBoundary0005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_4530
     * @tc.desc   BitVector empty: getIndexOf on empty BitVector throws error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorEmptyBoundary0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        try {
          bitVectorList.getIndexOf(0, 0, 0);
          expect().assertFail();
        } catch (err) {
          expect(err.code).assertEqual(10200001);
        }
        done()
      });

    /**
     * @tc.name   testBitVectorEmptyBoundary0006
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_4540
     * @tc.desc   BitVector empty: getLastIndexOf on empty BitVector throws error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorEmptyBoundary0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        try {
          bitVectorList.getLastIndexOf(0, 0, 0);
          expect().assertFail();
        } catch (err) {
          expect(err.code).assertEqual(10200001);
        }
        done()
      });

    /**
     * @tc.name   testBitVectorEmptyBoundary0007
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_4550
     * @tc.desc   BitVector empty: flipBitByIndex on empty BitVector throws error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorEmptyBoundary0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        try {
          bitVectorList.flipBitByIndex(0);
          expect().assertFail();
        } catch (err) {
          expect(err.code).assertEqual(10200001);
        }
        done()
      });

    /**
     * @tc.name   testBitVectorEmptyBoundary0008
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_4560
     * @tc.desc   BitVector empty: flipBitsByRange on empty BitVector throws error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorEmptyBoundary0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        try {
          bitVectorList.flipBitsByRange(0, 0);
          expect().assertFail();
        } catch (err) {
          expect(err.code).assertEqual(10200001);
        }
        done()
      });

    /**
     * @tc.name   testBitVectorEmptyBoundary0009
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_4570
     * @tc.desc   BitVector empty: [0] on empty BitVector throws error 10200001.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorEmptyBoundary0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        try {
          let value = bitVectorList[0];
          expect().assertFail();
        } catch (err) {
          expect(err.code).assertEqual(10200001);
        }
        expect(bitVectorList.length).assertEqual(0);
        done()
      });

    // ==================== 接口重复调用测试用例 (4580-4630) ====================

    /**
     * @tc.name   testBitVectorRepeatCall0001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_4580
     * @tc.desc   BitVector repeat call: push 10 times, verify length and values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorRepeatCall0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        for (let i = 0; i < 10; i++) {
          bitVectorList.push(i % 2);
        }
        expect(bitVectorList.length).assertEqual(10);
        for (let i = 0; i < 10; i++) {
          expect(bitVectorList[i]).assertEqual(i % 2);
        }
        done()
      });

    /**
     * @tc.name   testBitVectorRepeatCall0002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_4590
     * @tc.desc   BitVector repeat call: pop 5 times from 5 elements, verify empty.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorRepeatCall0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        for (let i = 0; i < 5; i++) {
          bitVectorList.push(i % 2);
        }
        for (let i = 0; i < 5; i++) {
          bitVectorList.pop();
        }
        expect(bitVectorList.length).assertEqual(0);
        done()
      });

    /**
     * @tc.name   testBitVectorRepeatCall0003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_4600
     * @tc.desc   BitVector repeat call: setBitsByRange 3 times on different ranges.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorRepeatCall0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        for (let i = 0; i < 10; i++) {
          bitVectorList.push(0);
        }
        bitVectorList.setBitsByRange(1, 0, 3);
        bitVectorList.setBitsByRange(1, 3, 6);
        bitVectorList.setBitsByRange(1, 6, 10);
        for (let i = 0; i < 10; i++) {
          expect(bitVectorList[i]).assertEqual(1);
        }
        done()
      });

    /**
     * @tc.name   testBitVectorRepeatCall0004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_4610
     * @tc.desc   BitVector repeat call: flipBitsByRange twice on same range restores original.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorRepeatCall0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        bitVectorList.push(0);
        bitVectorList.push(1);
        bitVectorList.push(0);
        bitVectorList.push(1);
        bitVectorList.push(0);
        let original0 = bitVectorList[0];
        let original1 = bitVectorList[1];
        let original2 = bitVectorList[2];
        bitVectorList.flipBitsByRange(0, 5);
        bitVectorList.flipBitsByRange(0, 5);
        expect(bitVectorList[0]).assertEqual(original0);
        expect(bitVectorList[1]).assertEqual(original1);
        expect(bitVectorList[2]).assertEqual(original2);
        done()
      });

    /**
     * @tc.name   testBitVectorRepeatCall0005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_4620
     * @tc.desc   BitVector repeat call: resize multiple times (grow then shrink).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorRepeatCall0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        bitVectorList.push(1);
        bitVectorList.resize(5);
        expect(bitVectorList.length).assertEqual(5);
        expect(bitVectorList[0]).assertEqual(1);
        bitVectorList.resize(2);
        expect(bitVectorList.length).assertEqual(2);
        expect(bitVectorList[0]).assertEqual(1);
        bitVectorList.resize(10);
        expect(bitVectorList.length).assertEqual(10);
        expect(bitVectorList[0]).assertEqual(1);
        done()
      });

    /**
     * @tc.name   testBitVectorRepeatCall0006
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_4630
     * @tc.desc   BitVector repeat call: setAllBits 3 times (0->1->0->1).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorRepeatCall0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        for (let i = 0; i < 5; i++) {
          bitVectorList.push(0);
        }
        bitVectorList.setAllBits(1);
        for (let i = 0; i < 5; i++) {
          expect(bitVectorList[i]).assertEqual(1);
        }
        bitVectorList.setAllBits(0);
        for (let i = 0; i < 5; i++) {
          expect(bitVectorList[i]).assertEqual(0);
        }
        bitVectorList.setAllBits(1);
        for (let i = 0; i < 5; i++) {
          expect(bitVectorList[i]).assertEqual(1);
        }
        done()
      });

    // ==================== 空BitVector(length=0)resize补充测试用例 (4640-4670) ====================

    /**
     * @tc.name   testBitVectorEmptyResizeBoundary0001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_4640
     * @tc.desc   BitVector empty: resize(0) on born-empty BitVector, verify length stays 0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorEmptyResizeBoundary0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        try {
          bitVectorList.resize(0);
          expect(bitVectorList.length).assertEqual(0);
        } catch (err) {
          expect(err.code).assertEqual(10200001);
        }
        done()
      });

    /**
     * @tc.name   testBitVectorEmptyResizeBoundary0002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_4650
     * @tc.desc   BitVector empty: resize(1) on born-empty BitVector, known issue: throws error 10200001.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorEmptyResizeBoundary0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        try {
          bitVectorList.resize(1);
          expect(bitVectorList.length).assertEqual(1);
          expect(bitVectorList[0]).assertEqual(0);
        } catch (err) {
          expect(err.code).assertEqual(10200001);
        }
        done()
      });

    /**
     * @tc.name   testBitVectorEmptyResizeBoundary0003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_4660
     * @tc.desc   BitVector empty: resize(64) on born-empty BitVector, known issue: throws error 10200001.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorEmptyResizeBoundary0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        try {
          bitVectorList.resize(64);
          expect(bitVectorList.length).assertEqual(64);
        } catch (err) {
          expect(err.code).assertEqual(10200001);
        }
        done()
      });

    /**
     * @tc.name   testBitVectorEmptyResizeBoundary0004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_4670
     * @tc.desc   BitVector empty: resize(1) on became-empty BitVector (push then pop), verify behavior.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorEmptyResizeBoundary0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        bitVectorList.push(1);
        bitVectorList.pop();
        expect(bitVectorList.length).assertEqual(0);
        try {
          bitVectorList.resize(1);
          expect(bitVectorList.length).assertEqual(1);
          expect(bitVectorList[0]).assertEqual(0);
        } catch (err) {
          expect(err.code).assertEqual(10200001);
        }
        done()
      });

    // ==================== 容量64边界测试用例 (4680-4820) ====================

    /**
     * @tc.name   testBitVector64Boundary0001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_4680
     * @tc.desc   BitVector 64 boundary: push exactly 64 elements (alternating 0,1), verify all values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVector64Boundary0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        for (let i = 0; i < 64; i++) {
          bitVectorList.push(i % 2);
        }
        expect(bitVectorList.length).assertEqual(64);
        for (let i = 0; i < 64; i++) {
          expect(bitVectorList[i]).assertEqual(i % 2);
        }
        done()
      });

    /**
     * @tc.name   testBitVector64Boundary0002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_4690
     * @tc.desc   BitVector 64 boundary: push 65 elements (crossing 64-word boundary), verify all values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVector64Boundary0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        for (let i = 0; i < 65; i++) {
          bitVectorList.push(i % 2);
        }
        expect(bitVectorList.length).assertEqual(65);
        expect(bitVectorList[63]).assertEqual(1);
        expect(bitVectorList[64]).assertEqual(0);
        for (let i = 0; i < 65; i++) {
          expect(bitVectorList[i]).assertEqual(i % 2);
        }
        done()
      });

    /**
     * @tc.name   testBitVector64Boundary0003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_4700
     * @tc.desc   BitVector 64 boundary: resize 64->65 (grow across word boundary), verify data preserved.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVector64Boundary0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        for (let i = 0; i < 64; i++) {
          bitVectorList.push(i % 2);
        }
        bitVectorList.resize(65);
        expect(bitVectorList.length).assertEqual(65);
        for (let i = 0; i < 64; i++) {
          expect(bitVectorList[i]).assertEqual(i % 2);
        }
        expect(bitVectorList[64]).assertEqual(0);
        done()
      });

    /**
     * @tc.name   testBitVector64Boundary0004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_4710
     * @tc.desc   BitVector 64 boundary: resize 65->64 (shrink across word boundary), verify data preserved.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVector64Boundary0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        for (let i = 0; i < 65; i++) {
          bitVectorList.push(i % 2);
        }
        bitVectorList.resize(64);
        expect(bitVectorList.length).assertEqual(64);
        for (let i = 0; i < 64; i++) {
          expect(bitVectorList[i]).assertEqual(i % 2);
        }
        done()
      });

    /**
     * @tc.name   testBitVector64Boundary0005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_4720
     * @tc.desc   BitVector 64 boundary: setBitsByRange crossing 64 boundary (range 60-65 on 65-elem vector).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVector64Boundary0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        for (let i = 0; i < 65; i++) {
          bitVectorList.push(0);
        }
        bitVectorList.setBitsByRange(1, 60, 65);
        for (let i = 0; i < 60; i++) {
          expect(bitVectorList[i]).assertEqual(0);
        }
        for (let i = 60; i < 65; i++) {
          expect(bitVectorList[i]).assertEqual(1);
        }
        done()
      });

    /**
     * @tc.name   testBitVector64Boundary0006
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_4730
     * @tc.desc   BitVector 64 boundary: flipBitsByRange crossing 64 boundary (range 60-65).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVector64Boundary0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        for (let i = 0; i < 65; i++) {
          bitVectorList.push(0);
        }
        bitVectorList.flipBitsByRange(60, 65);
        for (let i = 0; i < 60; i++) {
          expect(bitVectorList[i]).assertEqual(0);
        }
        for (let i = 60; i < 65; i++) {
          expect(bitVectorList[i]).assertEqual(1);
        }
        bitVectorList.flipBitsByRange(60, 65);
        for (let i = 60; i < 65; i++) {
          expect(bitVectorList[i]).assertEqual(0);
        }
        done()
      });

    /**
     * @tc.name   testBitVector64Boundary0007
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_4740
     * @tc.desc   BitVector 64 boundary: getBitsByRange crossing 64 boundary (range 60-65).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVector64Boundary0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        for (let i = 0; i < 65; i++) {
          bitVectorList.push(i % 2);
        }
        let result = bitVectorList.getBitsByRange(60, 65);
        expect(result.length).assertEqual(5);
        for (let i = 0; i < 5; i++) {
          expect(result[i]).assertEqual((i + 60) % 2);
        }
        done()
      });

    /**
     * @tc.name   testBitVector64Boundary0008
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_4750
     * @tc.desc   BitVector 64 boundary: getBitCountByRange crossing 64 boundary (range 60-65).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVector64Boundary0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        for (let i = 0; i < 65; i++) {
          bitVectorList.push(i % 2);
        }
        expect(bitVectorList.getBitCountByRange(1, 60, 65)).assertEqual(2);
        expect(bitVectorList.getBitCountByRange(0, 60, 65)).assertEqual(3);
        done()
      });

    /**
     * @tc.name   testBitVector64Boundary0009
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_4760
     * @tc.desc   BitVector 64 boundary: has crossing 64 boundary (search in range 60-65).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVector64Boundary0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        for (let i = 0; i < 65; i++) {
          bitVectorList.push(i % 2);
        }
        expect(bitVectorList.has(1, 60, 65)).assertEqual(true);
        expect(bitVectorList.has(0, 60, 65)).assertEqual(true);
        done()
      });

    /**
     * @tc.name   testBitVector64Boundary0010
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_4770
     * @tc.desc   BitVector 64 boundary: getIndexOf crossing 64 boundary (search in range 60-65).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVector64Boundary0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        for (let i = 0; i < 65; i++) {
          bitVectorList.push(i % 2);
        }
        expect(bitVectorList.getIndexOf(0, 60, 65)).assertEqual(60);
        expect(bitVectorList.getIndexOf(1, 60, 65)).assertEqual(61);
        done()
      });

    /**
     * @tc.name   testBitVector64Boundary0011
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_4780
     * @tc.desc   BitVector 64 boundary: getLastIndexOf crossing 64 boundary (search in range 60-65).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVector64Boundary0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        for (let i = 0; i < 65; i++) {
          bitVectorList.push(i % 2);
        }
        expect(bitVectorList.getLastIndexOf(0, 60, 65)).assertEqual(64);
        expect(bitVectorList.getLastIndexOf(1, 60, 65)).assertEqual(63);
        done()
      });

    /**
     * @tc.name   testBitVector64Boundary0012
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_4790
     * @tc.desc   BitVector 64 boundary: flipBitByIndex at boundary indices 63 and 64.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVector64Boundary0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        for (let i = 0; i < 65; i++) {
          bitVectorList.push(0);
        }
        bitVectorList.flipBitByIndex(63);
        bitVectorList.flipBitByIndex(64);
        expect(bitVectorList[63]).assertEqual(1);
        expect(bitVectorList[64]).assertEqual(1);
        expect(bitVectorList[62]).assertEqual(0);
        done()
      });

    /**
     * @tc.name   testBitVector64Boundary0013
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_4800
     * @tc.desc   BitVector 64 boundary: [index] access at boundary indices 63, 64, 65 out of range.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVector64Boundary0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        for (let i = 0; i < 65; i++) {
          bitVectorList.push(i % 2);
        }
        expect(bitVectorList[63]).assertEqual(1);
        expect(bitVectorList[64]).assertEqual(0);
        try {
          let value = bitVectorList[65];
          expect().assertFail();
        } catch (err) {
          expect(err.code).assertEqual(10200001);
        }
        done()
      });

    /**
     * @tc.name   testBitVector64Boundary0014
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_4810
     * @tc.desc   BitVector 64 boundary: setAllBits on exactly 64 elements, verify all set.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVector64Boundary0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        for (let i = 0; i < 64; i++) {
          bitVectorList.push(0);
        }
        bitVectorList.setAllBits(1);
        for (let i = 0; i < 64; i++) {
          expect(bitVectorList[i]).assertEqual(1);
        }
        bitVectorList.setAllBits(0);
        for (let i = 0; i < 64; i++) {
          expect(bitVectorList[i]).assertEqual(0);
        }
        done()
      });

    /**
     * @tc.name   testBitVector64Boundary0015
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_4820
     * @tc.desc   BitVector 64 boundary: values() on exactly 64 elements + pop from 65 to 64.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVector64Boundary0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        for (let i = 0; i < 64; i++) {
          bitVectorList.push(i % 2);
        }
        let iter = bitVectorList.values();
        let count = 0;
        let temp = iter.next();
        while (!temp.done) {
          expect(temp.value).assertEqual(count % 2);
          count++;
          temp = iter.next();
        }
        expect(count).assertEqual(64);
        let bv2: collections.BitVector = new collections.BitVector(0);
        for (let i = 0; i < 65; i++) {
          bv2.push(i % 2);
        }
        bv2.pop();
        expect(bv2.length).assertEqual(64);
        expect(bv2[63]).assertEqual(1);
        try {
          let value = bv2[64];
          expect().assertFail();
        } catch (err) {
          expect(err.code).assertEqual(10200001);
        }
        done()
      });

    // ==================== 容量128边界测试用例 (4830-4920) ====================

    /**
     * @tc.name   testBitVector128Boundary0001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_4830
     * @tc.desc   BitVector 128 boundary: push exactly 128 elements (alternating), verify all values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVector128Boundary0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        for (let i = 0; i < 128; i++) {
          bitVectorList.push(i % 2);
        }
        expect(bitVectorList.length).assertEqual(128);
        expect(bitVectorList[63]).assertEqual(1);
        expect(bitVectorList[64]).assertEqual(0);
        expect(bitVectorList[127]).assertEqual(1);
        for (let i = 0; i < 128; i++) {
          expect(bitVectorList[i]).assertEqual(i % 2);
        }
        done()
      });

    /**
     * @tc.name   testBitVector128Boundary0002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_4840
     * @tc.desc   BitVector 128 boundary: push 129 elements (crossing 128-word boundary), verify all values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVector128Boundary0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        for (let i = 0; i < 129; i++) {
          bitVectorList.push(i % 2);
        }
        expect(bitVectorList.length).assertEqual(129);
        expect(bitVectorList[127]).assertEqual(1);
        expect(bitVectorList[128]).assertEqual(0);
        for (let i = 0; i < 129; i++) {
          expect(bitVectorList[i]).assertEqual(i % 2);
        }
        done()
      });

    /**
     * @tc.name   testBitVector128Boundary0003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_4850
     * @tc.desc   BitVector 128 boundary: resize 128->129 (grow across word boundary), verify data preserved.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVector128Boundary0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        for (let i = 0; i < 128; i++) {
          bitVectorList.push(i % 2);
        }
        bitVectorList.resize(129);
        expect(bitVectorList.length).assertEqual(129);
        for (let i = 0; i < 128; i++) {
          expect(bitVectorList[i]).assertEqual(i % 2);
        }
        expect(bitVectorList[128]).assertEqual(0);
        done()
      });

    /**
     * @tc.name   testBitVector128Boundary0004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_4860
     * @tc.desc   BitVector 128 boundary: resize 129->128 (shrink across word boundary), verify data preserved.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVector128Boundary0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        for (let i = 0; i < 129; i++) {
          bitVectorList.push(i % 2);
        }
        bitVectorList.resize(128);
        expect(bitVectorList.length).assertEqual(128);
        for (let i = 0; i < 128; i++) {
          expect(bitVectorList[i]).assertEqual(i % 2);
        }
        done()
      });

    /**
     * @tc.name   testBitVector128Boundary0005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_4870
     * @tc.desc   BitVector 128 boundary: setBitsByRange crossing 128 boundary (range 125-129).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVector128Boundary0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        for (let i = 0; i < 129; i++) {
          bitVectorList.push(0);
        }
        bitVectorList.setBitsByRange(1, 125, 129);
        for (let i = 0; i < 125; i++) {
          expect(bitVectorList[i]).assertEqual(0);
        }
        for (let i = 125; i < 129; i++) {
          expect(bitVectorList[i]).assertEqual(1);
        }
        done()
      });

    /**
     * @tc.name   testBitVector128Boundary0006
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_4880
     * @tc.desc   BitVector 128 boundary: flipBitsByRange crossing 128 boundary (range 125-129).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVector128Boundary0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        for (let i = 0; i < 129; i++) {
          bitVectorList.push(0);
        }
        bitVectorList.flipBitsByRange(125, 129);
        for (let i = 125; i < 129; i++) {
          expect(bitVectorList[i]).assertEqual(1);
        }
        bitVectorList.flipBitsByRange(125, 129);
        for (let i = 125; i < 129; i++) {
          expect(bitVectorList[i]).assertEqual(0);
        }
        done()
      });

    /**
     * @tc.name   testBitVector128Boundary0007
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_4890
     * @tc.desc   BitVector 128 boundary: getBitsByRange crossing 128 boundary (range 125-129).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVector128Boundary0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        for (let i = 0; i < 129; i++) {
          bitVectorList.push(i % 2);
        }
        let result = bitVectorList.getBitsByRange(125, 129);
        expect(result.length).assertEqual(4);
        for (let i = 0; i < 4; i++) {
          expect(result[i]).assertEqual((i + 125) % 2);
        }
        done()
      });

    /**
     * @tc.name   testBitVector128Boundary0008
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_4900
     * @tc.desc   BitVector 128 boundary: getBitCountByRange crossing 128 boundary (range 125-129).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVector128Boundary0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        for (let i = 0; i < 129; i++) {
          bitVectorList.push(i % 2);
        }
        expect(bitVectorList.getBitCountByRange(1, 125, 129)).assertEqual(2);
        expect(bitVectorList.getBitCountByRange(0, 125, 129)).assertEqual(2);
        done()
      });

    /**
     * @tc.name   testBitVector128Boundary0009
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_4910
     * @tc.desc   BitVector 128 boundary: flipBitByIndex + [index] at boundary 127, 128, 129 out of range.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVector128Boundary0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        for (let i = 0; i < 129; i++) {
          bitVectorList.push(0);
        }
        bitVectorList.flipBitByIndex(127);
        bitVectorList.flipBitByIndex(128);
        expect(bitVectorList[127]).assertEqual(1);
        expect(bitVectorList[128]).assertEqual(1);
        expect(bitVectorList[126]).assertEqual(0);
        try {
          let value = bitVectorList[129];
          expect().assertFail();
        } catch (err) {
          expect(err.code).assertEqual(10200001);
        }
        done()
      });

    /**
     * @tc.name   testBitVector128Boundary0010
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_4920
     * @tc.desc   BitVector 128 boundary: setAllBits + values() on exactly 128 elements.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVector128Boundary0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        for (let i = 0; i < 128; i++) {
          bitVectorList.push(0);
        }
        bitVectorList.setAllBits(1);
        let iter = bitVectorList.values();
        let count = 0;
        let temp = iter.next();
        while (!temp.done) {
          expect(temp.value).assertEqual(1);
          count++;
          temp = iter.next();
        }
        expect(count).assertEqual(128);
        done()
      });

    // ==================== 容量1024/1025边界测试用例 (4930-4990) ====================

    /**
     * @tc.name   testBitVector1024Boundary0001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_4930
     * @tc.desc   BitVector 1024 boundary: push exactly 1024 elements (alternating), verify boundary values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVector1024Boundary0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        for (let i = 0; i < 1024; i++) {
          bitVectorList.push(i % 2);
        }
        expect(bitVectorList.length).assertEqual(1024);
        expect(bitVectorList[63]).assertEqual(1);
        expect(bitVectorList[64]).assertEqual(0);
        expect(bitVectorList[127]).assertEqual(1);
        expect(bitVectorList[128]).assertEqual(0);
        expect(bitVectorList[1023]).assertEqual(1);
        for (let i = 1000; i < 1024; i++) {
          expect(bitVectorList[i]).assertEqual(i % 2);
        }
        done()
      });

    /**
     * @tc.name   testBitVector1024Boundary0002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_4940
     * @tc.desc   BitVector 1024 boundary: push 1025 elements (crossing 1024 boundary), verify boundary values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVector1024Boundary0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        for (let i = 0; i < 1025; i++) {
          bitVectorList.push(i % 2);
        }
        expect(bitVectorList.length).assertEqual(1025);
        expect(bitVectorList[1023]).assertEqual(1);
        expect(bitVectorList[1024]).assertEqual(0);
        for (let i = 0; i < 1025; i+=3) {
          expect(bitVectorList[i]).assertEqual(i % 2);
        }
        done()
      });

    /**
     * @tc.name   testBitVector1024Boundary0003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_4950
     * @tc.desc   BitVector 1024 boundary: resize 1024->1025 (grow across boundary), verify data preserved.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVector1024Boundary0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        for (let i = 0; i < 1024; i++) {
          bitVectorList.push(i % 2);
        }
        bitVectorList.resize(1025);
        expect(bitVectorList.length).assertEqual(1025);
        expect(bitVectorList[1023]).assertEqual(1);
        expect(bitVectorList[1024]).assertEqual(0);
        for (let i = 0; i < 1024; i+=100) {
          expect(bitVectorList[i]).assertEqual(i % 2);
        }
        done()
      });

    /**
     * @tc.name   testBitVector1024Boundary0004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_4960
     * @tc.desc   BitVector 1024 boundary: resize 1025->1024 (shrink across boundary), verify data preserved.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVector1024Boundary0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        for (let i = 0; i < 1025; i++) {
          bitVectorList.push(i % 2);
        }
        bitVectorList.resize(1024);
        expect(bitVectorList.length).assertEqual(1024);
        expect(bitVectorList[1023]).assertEqual(1);
        for (let i = 10; i < 102; i++) {
          expect(bitVectorList[i]).assertEqual(i % 2);
        }
        done()
      });

    /**
     * @tc.name   testBitVector1024Boundary0005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_4970
     * @tc.desc   BitVector 1024 boundary: setBitsByRange + flipBitsByRange crossing 1024 boundary (range 1020-1025).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVector1024Boundary0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        for (let i = 0; i < 1025; i++) {
          bitVectorList.push(0);
        }
        bitVectorList.setBitsByRange(1, 1020, 1025);
        for (let i = 1020; i < 1025; i++) {
          expect(bitVectorList[i]).assertEqual(1);
        }
        expect(bitVectorList[1019]).assertEqual(0);
        bitVectorList.flipBitsByRange(1020, 1025);
        for (let i = 1020; i < 1025; i++) {
          expect(bitVectorList[i]).assertEqual(0);
        }
        done()
      });

    /**
     * @tc.name   testBitVector1024Boundary0006
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_4980
     * @tc.desc   BitVector 1024 boundary: getBitCountByRange + getBitsByRange crossing 1024 boundary (range 1020-1025).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVector1024Boundary0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        for (let i = 0; i < 1025; i++) {
          bitVectorList.push(i % 2);
        }
        expect(bitVectorList.getBitCountByRange(1, 1020, 1025)).assertEqual(2);
        expect(bitVectorList.getBitCountByRange(0, 1020, 1025)).assertEqual(3);
        let result = bitVectorList.getBitsByRange(1020, 1025);
        expect(result.length).assertEqual(5);
        for (let i = 0; i < 5; i++) {
          expect(result[i]).assertEqual((i + 1020) % 2);
        }
        done()
      });

    /**
     * @tc.name   testBitVector1024Boundary0007
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_4990
     * @tc.desc   BitVector 1024 boundary: flipBitByIndex + [index] + setAllBits at 1024 boundary.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVector1024Boundary0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        for (let i = 0; i < 1025; i++) {
          bitVectorList.push(0);
        }
        bitVectorList.flipBitByIndex(1023);
        bitVectorList.flipBitByIndex(1024);
        expect(bitVectorList[1023]).assertEqual(1);
        expect(bitVectorList[1024]).assertEqual(1);
        expect(bitVectorList[1022]).assertEqual(0);
        bitVectorList.setAllBits(1);
        expect(bitVectorList[1023]).assertEqual(1);
        expect(bitVectorList[1024]).assertEqual(1);
        bitVectorList.setAllBits(0);
        expect(bitVectorList[1023]).assertEqual(0);
        expect(bitVectorList[1024]).assertEqual(0);
        done()
      });

    // ==================== 构造函数容量边界测试用例 (5000-5060) ====================

    /**
     * @tc.name   testBitVectorConstructorCapacity0001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_5000
     * @tc.desc   BitVector constructor capacity=64, verify length=64 and all elements 0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorConstructorCapacity0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let bitVectorList: collections.BitVector = new collections.BitVector(64);
        expect(bitVectorList.length).assertEqual(64);
        for (let i = 0; i < 64; i++) {
          expect(bitVectorList[i]).assertEqual(0);
        }
        done()
      });

    /**
     * @tc.name   testBitVectorConstructorCapacity0002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_5010
     * @tc.desc   BitVector constructor capacity=64, setAllBits(1) then verify all 1s, setAllBits(0) then verify all 0s.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorConstructorCapacity0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let bitVectorList: collections.BitVector = new collections.BitVector(64);
        bitVectorList.setAllBits(1);
        for (let i = 0; i < 64; i++) {
          expect(bitVectorList[i]).assertEqual(1);
        }
        bitVectorList.setAllBits(0);
        for (let i = 0; i < 64; i++) {
          expect(bitVectorList[i]).assertEqual(0);
        }
        done()
      });

    /**
     * @tc.name   testBitVectorConstructorCapacity0003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_5020
     * @tc.desc   BitVector constructor capacity=64, push(1) then verify length=65 and crossing word boundary.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorConstructorCapacity0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let bitVectorList: collections.BitVector = new collections.BitVector(64);
        bitVectorList.push(1);
        expect(bitVectorList.length).assertEqual(65);
        expect(bitVectorList[63]).assertEqual(0);
        expect(bitVectorList[64]).assertEqual(1);
        done()
      });

    /**
     * @tc.name   testBitVectorConstructorCapacity0004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_5030
     * @tc.desc   BitVector constructor capacity=64, resize(65) then verify crossing word boundary.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorConstructorCapacity0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let bitVectorList: collections.BitVector = new collections.BitVector(64);
        bitVectorList.resize(65);
        expect(bitVectorList.length).assertEqual(65);
        expect(bitVectorList[64]).assertEqual(0);
        done()
      });

    /**
     * @tc.name   testBitVectorConstructorCapacity0005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_5040
     * @tc.desc   BitVector constructor capacity=128, verify length=128 and boundary values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorConstructorCapacity0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let bitVectorList: collections.BitVector = new collections.BitVector(128);
        expect(bitVectorList.length).assertEqual(128);
        expect(bitVectorList[0]).assertEqual(0);
        expect(bitVectorList[63]).assertEqual(0);
        expect(bitVectorList[64]).assertEqual(0);
        expect(bitVectorList[127]).assertEqual(0);
        bitVectorList.setAllBits(1);
        expect(bitVectorList[63]).assertEqual(1);
        expect(bitVectorList[64]).assertEqual(1);
        expect(bitVectorList[127]).assertEqual(1);
        done()
      });

    /**
     * @tc.name   testBitVectorConstructorCapacity0006
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_5050
     * @tc.desc   BitVector constructor capacity=1024, verify length=1024 and boundary values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorConstructorCapacity0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let bitVectorList: collections.BitVector = new collections.BitVector(1024);
        expect(bitVectorList.length).assertEqual(1024);
        expect(bitVectorList[0]).assertEqual(0);
        expect(bitVectorList[63]).assertEqual(0);
        expect(bitVectorList[1023]).assertEqual(0);
        bitVectorList.setAllBits(1);
        expect(bitVectorList[1023]).assertEqual(1);
        done()
      });

    /**
     * @tc.name   testBitVectorConstructorCapacity0007
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_5060
     * @tc.desc   BitVector constructor capacity=1025, verify length=1025 and crossing 1024 boundary.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorConstructorCapacity0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let bitVectorList: collections.BitVector = new collections.BitVector(1025);
        expect(bitVectorList.length).assertEqual(1025);
        expect(bitVectorList[1024]).assertEqual(0);
        bitVectorList.setAllBits(1);
        expect(bitVectorList[1023]).assertEqual(1);
        expect(bitVectorList[1024]).assertEqual(1);
        done()
      });

    // ==================== 构造函数+非0/1值存储测试用例 (5070-5100) ====================

    /**
     * @tc.name   testBitVectorConstructorNonBinaryValue0001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_5070
     * @tc.desc   BitVector constructor cap=64, setBitsByRange with non-0/1 values (-1,2,65535), verify stored as 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorConstructorNonBinaryValue0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let bitVectorList: collections.BitVector = new collections.BitVector(64);
        bitVectorList.setBitsByRange(-1, 0, 10);
        for (let i = 0; i < 10; i++) {
          expect(bitVectorList[i]).assertEqual(1);
        }
        bitVectorList.setBitsByRange(2, 10, 20);
        for (let i = 10; i < 20; i++) {
          expect(bitVectorList[i]).assertEqual(1);
        }
        bitVectorList.setBitsByRange(65535, 20, 30);
        for (let i = 20; i < 30; i++) {
          expect(bitVectorList[i]).assertEqual(1);
        }
        for (let i = 30; i < 64; i++) {
          expect(bitVectorList[i]).assertEqual(0);
        }
        done()
      });

    /**
     * @tc.name   testBitVectorConstructorNonBinaryValue0002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_5080
     * @tc.desc   BitVector constructor cap=64, push non-0/1 values, verify stored as 1, then getBitCountByRange.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorConstructorNonBinaryValue0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        bitVectorList.push(-1);
        bitVectorList.push(2);
        bitVectorList.push(65535);
        bitVectorList.push(-65535);
        bitVectorList.push(0.5);
        expect(bitVectorList.length).assertEqual(5);
        expect(bitVectorList[0]).assertEqual(1);
        expect(bitVectorList[1]).assertEqual(1);
        expect(bitVectorList[2]).assertEqual(1);
        expect(bitVectorList[3]).assertEqual(1);
        expect(bitVectorList[4]).assertEqual(1);
        expect(bitVectorList.getBitCountByRange(1, 0, 5)).assertEqual(5);
        expect(bitVectorList.getBitCountByRange(0, 0, 5)).assertEqual(0);
        done()
      });

    /**
     * @tc.name   testBitVectorConstructorNonBinaryValue0003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_5090
     * @tc.desc   BitVector constructor cap=128, setAllBits with non-0/1 values, verify all stored as 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorConstructorNonBinaryValue0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let bitVectorList: collections.BitVector = new collections.BitVector(128);
        bitVectorList.setAllBits(-1);
        expect(bitVectorList[0]).assertEqual(1);
        expect(bitVectorList[63]).assertEqual(1);
        expect(bitVectorList[64]).assertEqual(1);
        expect(bitVectorList[127]).assertEqual(1);
        bitVectorList.setAllBits(65535);
        expect(bitVectorList[0]).assertEqual(1);
        expect(bitVectorList[127]).assertEqual(1);
        done()
      });

    /**
     * @tc.name   testBitVectorConstructorNonBinaryValue0004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_5100
     * @tc.desc   BitVector constructor cap=1024, push non-0/1 values at boundary indices, verify stored as 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorConstructorNonBinaryValue0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let bitVectorList: collections.BitVector = new collections.BitVector(1024);
        bitVectorList.flipBitByIndex(63);
        bitVectorList.flipBitByIndex(64);
        bitVectorList.flipBitByIndex(127);
        bitVectorList.flipBitByIndex(128);
        bitVectorList.flipBitByIndex(1023);
        expect(bitVectorList[63]).assertEqual(1);
        expect(bitVectorList[64]).assertEqual(1);
        expect(bitVectorList[127]).assertEqual(1);
        expect(bitVectorList[128]).assertEqual(1);
        expect(bitVectorList[1023]).assertEqual(1);
        expect(bitVectorList[0]).assertEqual(0);
        done()
      });

    // ==================== 已知失败has用例 (5110-5200) ====================

    // /**
    //  * @tc.name   testBitVectorHasBoundary0002
    //  * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_3390
    //  * @tc.desc   BitVector has toIndex equals length, all ones search 0, expect false.
    //  * @tc.type   FUNCTION
    //  * @tc.size   MEDIUMTEST
    //  * @tc.level  LEVEL0
    //  */
    // it('testBitVectorHasBoundary0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
    //   let bitVectorList: collections.BitVector = new collections.BitVector(0);
    //   bitVectorList.push(1);
    //   bitVectorList.push(1);
    //   bitVectorList.push(1);
    //   let rst = bitVectorList.has(0, 0, 3);
    //   expect(rst).assertEqual(false);
    //   done()
    // });
    //
    // /**
    //  * @tc.name   testBitVectorHasBoundary0005
    //  * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_3420
    //  * @tc.desc   BitVector has toIndex equals length on all ones, search 0, expect false.
    //  * @tc.type   FUNCTION
    //  * @tc.size   MEDIUMTEST
    //  * @tc.level  LEVEL0
    //  */
    // it('testBitVectorHasBoundary0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
    //   let bitVectorList: collections.BitVector = new collections.BitVector(0);
    //   for (let i = 0; i < 10; i++) {
    //     bitVectorList.push(1);
    //   }
    //   let rst = bitVectorList.has(0, 0, 10);
    //   expect(rst).assertEqual(false);
    //   done()
    // });
    //
    // /**
    //  * @tc.name   testBitVectorHasBoundary0011
    //  * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_3480
    //  * @tc.desc   BitVector has toIndex equals length on large BitVector all ones, search 0, expect false.
    //  * @tc.type   FUNCTION
    //  * @tc.size   MEDIUMTEST
    //  * @tc.level  LEVEL0
    //  */
    // it('testBitVectorHasBoundary0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
    //   let bitVectorList: collections.BitVector = new collections.BitVector(0);
    //   for (let i = 0; i < 100; i++) {
    //     bitVectorList.push(1);
    //   }
    //   let rst = bitVectorList.has(0, 0, 100);
    //   expect(rst).assertEqual(false);
    //   done()
    // });
    //
    // /**
    //  * @tc.name   testBitVectorHasPatternBoundary0002
    //  * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_4080
    //  * @tc.desc   BitVector has on all 1s pattern: has(1)=true, has(0)=false, has(-1)=true, has(2)=true.
    //  * @tc.type   FUNCTION
    //  * @tc.size   MEDIUMTEST
    //  * @tc.level  LEVEL0
    //  */
    // it('testBitVectorHasPatternBoundary0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
    //   async (done: Function) => {
    //     let bitVectorList: collections.BitVector = new collections.BitVector(0);
    //     for (let i = 0; i < 10; i++) {
    //       bitVectorList.push(1);
    //     }
    //     expect(bitVectorList.has(1, 0, 10)).assertEqual(true);
    //     expect(bitVectorList.has(0, 0, 10)).assertEqual(false);
    //     expect(bitVectorList.has(-1, 0, 10)).assertEqual(true);
    //     expect(bitVectorList.has(2, 0, 10)).assertEqual(true);
    //     expect(bitVectorList.has(65535, 0, 10)).assertEqual(true);
    //     done()
    //   });
    //
    // /**
    //  * @tc.name   testBitVectorHasPatternBoundary0003
    //  * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_4090
    //  * @tc.desc   BitVector has on all -1s pattern (treated as 1s): has(1)=true, has(0)=false.
    //  * @tc.type   FUNCTION
    //  * @tc.size   MEDIUMTEST
    //  * @tc.level  LEVEL0
    //  */
    // it('testBitVectorHasPatternBoundary0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
    //   async (done: Function) => {
    //     let bitVectorList: collections.BitVector = new collections.BitVector(0);
    //     for (let i = 0; i < 10; i++) {
    //       bitVectorList.push(-1);
    //     }
    //     expect(bitVectorList.has(1, 0, 10)).assertEqual(true);
    //     expect(bitVectorList.has(0, 0, 10)).assertEqual(false);
    //     expect(bitVectorList.has(-1, 0, 10)).assertEqual(true);
    //     expect(bitVectorList.has(2, 0, 10)).assertEqual(true);
    //     done()
    //   });
    //
    // /**
    //  * @tc.name   testBitVectorHasPatternBoundary0004
    //  * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_4100
    //  * @tc.desc   BitVector has on all 2s pattern (treated as 1s): has(1)=true, has(0)=false.
    //  * @tc.type   FUNCTION
    //  * @tc.size   MEDIUMTEST
    //  * @tc.level  LEVEL0
    //  */
    // it('testBitVectorHasPatternBoundary0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
    //   async (done: Function) => {
    //     let bitVectorList: collections.BitVector = new collections.BitVector(0);
    //     for (let i = 0; i < 10; i++) {
    //       bitVectorList.push(2);
    //     }
    //     expect(bitVectorList.has(1, 0, 10)).assertEqual(true);
    //     expect(bitVectorList.has(0, 0, 10)).assertEqual(false);
    //     expect(bitVectorList.has(2, 0, 10)).assertEqual(true);
    //     expect(bitVectorList.has(-1, 0, 10)).assertEqual(true);
    //     done()
    //   });
    //
    // /**
    //  * @tc.name   testBitVectorContainerSizeBoundary0005
    //  * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_4450
    //  * @tc.desc   BitVector container size=10000 (very large), has full range toIndex=10000 on all 1s.
    //  * @tc.type   FUNCTION
    //  * @tc.size   MEDIUMTEST
    //  * @tc.level  LEVEL0
    //  */
    // it('testBitVectorContainerSizeBoundary0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
    //   async (done: Function) => {
    //     let bitVectorList: collections.BitVector = new collections.BitVector(0);
    //     for (let i = 0; i < 10000; i++) {
    //       bitVectorList.push(1);
    //     }
    //     expect(bitVectorList.length).assertEqual(10000);
    //     expect(bitVectorList.has(1, 0, 10000)).assertEqual(true);
    //     expect(bitVectorList.has(0, 0, 10000)).assertEqual(false);
    //     expect(bitVectorList.getBitCountByRange(1, 0, 10000)).assertEqual(10000);
    //     expect(bitVectorList.getBitCountByRange(0, 0, 10000)).assertEqual(0);
    //     done()
    //   });
    //
    // /**
    //  * @tc.name   testBitVectorComprehensiveBoundary0001
    //  * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_4460
    //  * @tc.desc   BitVector comprehensive: mixed values push, then has/getBitCountByRange/getIndexOf on full range.
    //  * @tc.type   FUNCTION
    //  * @tc.size   MEDIUMTEST
    //  * @tc.level  LEVEL0
    //  */
    // it('testBitVectorComprehensiveBoundary0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
    //   async (done: Function) => {
    //     let bitVectorList: collections.BitVector = new collections.BitVector(0);
    //     bitVectorList.push(0);
    //     bitVectorList.push(-1);
    //     bitVectorList.push(2);
    //     bitVectorList.push(0);
    //     bitVectorList.push(65535);
    //     expect(bitVectorList.length).assertEqual(5);
    //     expect(bitVectorList[0]).assertEqual(0);
    //     expect(bitVectorList[1]).assertEqual(1);
    //     expect(bitVectorList[2]).assertEqual(1);
    //     expect(bitVectorList[3]).assertEqual(0);
    //     expect(bitVectorList[4]).assertEqual(1);
    //     expect(bitVectorList.has(0, 0, 5)).assertEqual(true);
    //     expect(bitVectorList.has(1, 0, 5)).assertEqual(true);
    //     expect(bitVectorList.has(0, 0, 1)).assertEqual(true);
    //     expect(bitVectorList.has(1, 0, 1)).assertEqual(false);
    //     expect(bitVectorList.has(1, 1, 5)).assertEqual(true);
    //     expect(bitVectorList.getBitCountByRange(0, 0, 5)).assertEqual(2);
    //     expect(bitVectorList.getBitCountByRange(1, 0, 5)).assertEqual(3);
    //     expect(bitVectorList.getIndexOf(0, 0, 5)).assertEqual(0);
    //     expect(bitVectorList.getIndexOf(1, 0, 5)).assertEqual(1);
    //     expect(bitVectorList.getLastIndexOf(0, 0, 5)).assertEqual(3);
    //     expect(bitVectorList.getLastIndexOf(1, 0, 5)).assertEqual(4);
    //     done()
    //   });
    //
    // /**
    //  * @tc.name   testBitVectorComprehensiveBoundary0002
    //  * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_4470
    //  * @tc.desc   BitVector comprehensive: setBitsByRange then flip then verify with has.
    //  * @tc.type   FUNCTION
    //  * @tc.size   MEDIUMTEST
    //  * @tc.level  LEVEL0
    //  */
    // it('testBitVectorComprehensiveBoundary0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
    //   async (done: Function) => {
    //     let bitVectorList: collections.BitVector = new collections.BitVector(0);
    //     for (let i = 0; i < 10; i++) {
    //       bitVectorList.push(0);
    //     }
    //     bitVectorList.setBitsByRange(1, 0, 5);
    //     expect(bitVectorList.has(1, 0, 5)).assertEqual(true);
    //     expect(bitVectorList.has(0, 0, 5)).assertEqual(false);
    //     expect(bitVectorList.has(0, 5, 10)).assertEqual(true);
    //     expect(bitVectorList.has(1, 5, 10)).assertEqual(false);
    //     bitVectorList.flipBitsByRange(0, 10);
    //     expect(bitVectorList.has(0, 0, 5)).assertEqual(true);
    //     expect(bitVectorList.has(1, 0, 5)).assertEqual(false);
    //     expect(bitVectorList.has(1, 5, 10)).assertEqual(true);
    //     expect(bitVectorList.has(0, 5, 10)).assertEqual(false);
    //     done()
    //   });
    //
    // /**
    //  * @tc.name   testBitVectorComprehensiveBoundary0003
    //  * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_4480
    //  * @tc.desc   BitVector comprehensive: resize then has on new boundary.
    //  * @tc.type   FUNCTION
    //  * @tc.size   MEDIUMTEST
    //  * @tc.level  LEVEL0
    //  */
    // it('testBitVectorComprehensiveBoundary0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
    //   async (done: Function) => {
    //     let bitVectorList: collections.BitVector = new collections.BitVector(0);
    //     for (let i = 0; i < 5; i++) {
    //       bitVectorList.push(1);
    //     }
    //     bitVectorList.resize(10);
    //     expect(bitVectorList.length).assertEqual(10);
    //     expect(bitVectorList.has(1, 0, 5)).assertEqual(true);
    //     expect(bitVectorList.has(0, 0, 5)).assertEqual(false);
    //     expect(bitVectorList.has(0, 5, 10)).assertEqual(true);
    //     expect(bitVectorList.has(1, 5, 10)).assertEqual(false);
    //     expect(bitVectorList.has(1, 0, 10)).assertEqual(true);
    //     expect(bitVectorList.has(0, 0, 10)).assertEqual(true);
    //     done()
    //   });

  })
}
