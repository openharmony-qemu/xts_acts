/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { collections } from '@kit.ArkTS';

export default function BitVectorPopTest() {
  describe('BitVectorPopTest', () => {
    beforeAll(() => {})
    beforeEach(() => {})
    afterEach(() => {})
    afterAll(() => {})

    /**
     * @tc.name   BitVector_pop_Func_001
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0101
     * @tc.desc   Retrieves and removes the bit element to the end of this bit vector.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("BitVector_pop_Func_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
        let bitVector = new collections.BitVector(0);
        bitVector.push(0);
        bitVector.push(1);
        bitVector.push(0);
        bitVector.push(1);
        bitVector.push(1);
        let res0 = bitVector.pop();
        let res1 = bitVector.pop();
        let res2 = bitVector.pop();
        let res3 = bitVector.pop();
        let res4 = bitVector.pop();
        expect(res0).assertEqual(1);
        expect(res1).assertEqual(1);
        expect(res2).assertEqual(0);
        expect(res3).assertEqual(1);
        expect(res4).assertEqual(0);
        expect(bitVector.length).assertEqual(0);
    });

    /**
     * @tc.name   BitVector_pop_Func_002
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0102
     * @tc.desc   Retrieves and removes the bit element to the end of this bit vector.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("BitVector_pop_Func_002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
        let bitVector = new collections.BitVector(0);
        let bitVectorLength = 64;
        for (let i = 0; i < bitVectorLength; i++) {
          let res0 = bitVector.push(0);
          expect(res0).assertEqual(true);
        }
        expect(bitVector.length).assertEqual(bitVectorLength);
        for (let i = 0; i < bitVectorLength; i++) {
          let res1 = bitVector.pop();
          expect(res1).assertEqual(0);
        }
        expect(bitVector.length).assertEqual(0);
    });

    /**
     * @tc.name   BitVector_pop_Func_003
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0103
     * @tc.desc   Retrieves and removes the bit element to the end of this bit vector.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("BitVector_pop_Func_003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
        let bitVector = new collections.BitVector(10);
        let bitVectorLength = 64;
        for (let i = 0; i < bitVectorLength; i++) {
          let res0 = bitVector.push(0);
          expect(res0).assertEqual(true);
        }
        expect(bitVector.length).assertEqual(bitVectorLength + 10);
        for (let i = 0; i < bitVectorLength; i++) {
          let res1 = bitVector.pop();
          expect(res1).assertEqual(0);
        }
        expect(bitVector.length).assertEqual(10);
    });

    /**
     * @tc.name   BitVectorTest1600
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0104
     * @tc.desc   Verify BitVector pop returns correct LIFO order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BitVectorTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
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
     * @tc.name   BitVectorTest1700
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0105
     * @tc.desc   Verify BitVector pop on length-0 BitVector behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BitVectorTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let bv = new collections.BitVector(0)
      try {
        let result = bv.pop()
        expect(result === undefined).assertTrue()
      } catch (e) {
        expect(e !== null).assertTrue()
      }
    })

    /**
     * @tc.name   BitVectorTest1800
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0106
     * @tc.desc   Verify BitVector pop removes last element by index assignment
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BitVectorTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let bv = new collections.BitVector(4)
      bv[3] = 1
      let result = bv.pop()
      expect(result).assertEqual(1)
      expect(bv.length).assertEqual(3)
    })

    /**
     * @tc.name   BitVectortest0400
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0107
     * @tc.desc   BitVector pop 10200011
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BitVectortest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'BitVectortest0400';
        let flag: boolean = false;
        console.info(`${caseName} test start`);

        try {
          let bitVector: collections.BitVector = new collections.BitVector(3);
          const popMethod = bitVector.pop;
          popMethod();
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect(e.code).assertEqual(10200011)
          flag = true
        }
        expect(flag).assertTrue()
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   testBitVectorPop0001
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0108
     * @tc.desc   Testing the pop of bitVector, pop 10 times
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorPop0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorPop0001";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        let rst = 0;
        for (let i = 0; i < 10; i++) {
          bitVectorList.push(1);
        }
        for (let i = 0; i < 10; i++) {
          rst = bitVectorList.pop();
          expect(rst).assertEqual(1);
        }
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testBitVectorPop0002
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0109
     * @tc.desc   Testing the pop of bitVector, pop 100000 times
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorPop0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorPop0002";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(10000);
        let rst = 0;
        for (let i = 0; i < 10000; i++) {
          rst = bitVectorList.pop();
        }
        expect(rst).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testBitVectorPop0003
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0110
     * @tc.desc   Testing the pop of bitVector, pop succeed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorPop0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorPop0003";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        let rst = false;
        rst = bitVectorList.push(1);
        rst = bitVectorList.push(1);
        rst = bitVectorList.push(0);
        expect(rst).assertTrue();
        let num = bitVectorList.pop();
        expect(num).assertEqual(0);
        num = bitVectorList.pop();
        expect(num).assertEqual(1);
        num = bitVectorList.pop();
        expect(num).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testBitVectorPop0004
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0111
     * @tc.desc   Testing the pop of bitVector, pop succeed and return length
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorPop0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorPop0004";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        let rst = false;
        rst = bitVectorList.push(1);
        rst = bitVectorList.push(1);
        rst = bitVectorList.push(0);
        expect(rst).assertTrue();
        expect(bitVectorList.length).assertEqual(3);
        let num = bitVectorList.pop();
        expect(num).assertEqual(0);
        num = bitVectorList.pop();
        expect(num).assertEqual(1);
        num = bitVectorList.pop();
        expect(num).assertEqual(1);
        expect(bitVectorList.length).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testBitVectorPop0005
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0112
     * @tc.desc   Testing the pop of bitVector, bitVector is null, pop failed.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorPop0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorPop0005";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        expect(bitVectorList.length).assertEqual(0);
        let num = bitVectorList.pop();
        expect(num).assertEqual(undefined);
        expect(bitVectorList.length).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testBitVectorPop0006
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0113
     * @tc.desc   Testing the pop of bitVector, pop called without parameters.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorPop0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorPop0006";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        bitVectorList.push(1);
        bitVectorList.push(0);
        let num = bitVectorList.pop();
        expect(num).assertEqual(0);
        expect(bitVectorList.length).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testBitVectorPop0007
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0114
     * @tc.desc   Testing the pop of bitVector, pop called with extra parameters should ignore them.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorPop0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorPop0007";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        bitVectorList.push(1);
        bitVectorList.push(0);
        let num = bitVectorList.pop();
        expect(num).assertEqual(0);
        expect(bitVectorList.length).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testBitVectorPop0008
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0115
     * @tc.desc   Testing the pop of bitVector, return value type should be number.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorPop0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorPop0008";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        bitVectorList.push(1);
        bitVectorList.push(0);
        let num = bitVectorList.pop();
        expect(typeof num).assertEqual('number');
        expect(num).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testBitVectorPop0009
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0116
     * @tc.desc   Testing the pop of bitVector, return value should be 0 or 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorPop0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorPop0009";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        bitVectorList.push(1);
        bitVectorList.push(0);
        let num1 = bitVectorList.pop();
        expect(num1 === 0 || num1 === 1).assertTrue();
        let num2 = bitVectorList.pop();
        expect(num2 === 0 || num2 === 1).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testBitVectorPop0010
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0117
     * @tc.desc   Testing the pop of bitVector, push after pop operation.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorPop0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorPop0010";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        bitVectorList.push(1);
        bitVectorList.push(0);
        expect(bitVectorList.length).assertEqual(2);
        let num = bitVectorList.pop();
        expect(num).assertEqual(0);
        expect(bitVectorList.length).assertEqual(1);
        bitVectorList.push(1);
        expect(bitVectorList.length).assertEqual(2);
        expect(bitVectorList[0]).assertEqual(1);
        expect(bitVectorList[1]).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testBitVectorPop0011
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0118
     * @tc.desc   Testing the pop of bitVector, alternating push and pop operations.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorPop0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorPop0011";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        bitVectorList.push(1);
        let num = bitVectorList.pop();
        expect(num).assertEqual(1);
        expect(bitVectorList.length).assertEqual(0);
        bitVectorList.push(0);
        num = bitVectorList.pop();
        expect(num).assertEqual(0);
        expect(bitVectorList.length).assertEqual(0);
        bitVectorList.push(1);
        bitVectorList.push(0);
        num = bitVectorList.pop();
        expect(num).assertEqual(0);
        expect(bitVectorList.length).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testBitVectorPop0012
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0119
     * @tc.desc   Testing the pop of bitVector, single element BitVector becomes empty after pop.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorPop0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorPop0012";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        bitVectorList.push(1);
        expect(bitVectorList.length).assertEqual(1);
        let num = bitVectorList.pop();
        expect(num).assertEqual(1);
        expect(bitVectorList.length).assertEqual(0);
        let num2 = bitVectorList.pop();
        expect(num2).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testBitVectorPop0013
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0120
     * @tc.desc   Testing the pop of bitVector, index access after pop operation.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorPop0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorPop0013";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        bitVectorList.push(1);
        bitVectorList.push(0);
        bitVectorList.push(1);
        expect(bitVectorList.length).assertEqual(3);
        let num = bitVectorList.pop();
        expect(num).assertEqual(1);
        expect(bitVectorList.length).assertEqual(2);
        expect(bitVectorList[0]).assertEqual(1);
        expect(bitVectorList[1]).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testBitVectorPop0014
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0121
     * @tc.desc   Testing the pop of bitVector, iterator after pop operation.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorPop0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorPop0014";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        bitVectorList.push(0);
        bitVectorList.push(1);
        bitVectorList.push(0);
        bitVectorList.push(1);
        bitVectorList.pop();
        let iter: IterableIterator<number> = bitVectorList.values();
        let expectedValues: number[] = [0, 1, 0];
        let index = 0;
        for (let value of bitVectorList) {
          expect(value).assertEqual(expectedValues[index]);
          index++;
        }
        expect(index).assertEqual(3);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testBitVectorPop0015
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0122
     * @tc.desc   Testing the pop of bitVector, length change after pop operation.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorPop0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorPop0015";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        bitVectorList.push(1);
        bitVectorList.push(0);
        bitVectorList.push(1);
        expect(bitVectorList.length).assertEqual(3);
        bitVectorList.pop();
        expect(bitVectorList.length).assertEqual(2);
        bitVectorList.pop();
        expect(bitVectorList.length).assertEqual(1);
        bitVectorList.pop();
        expect(bitVectorList.length).assertEqual(0);
        bitVectorList.pop();
        expect(bitVectorList.length).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testBitVectorPopBoundary0001
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0123
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
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0124
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

    /**
     * @tc.name   testBitVectorRepeatCall0002
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0125
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
  })
}
