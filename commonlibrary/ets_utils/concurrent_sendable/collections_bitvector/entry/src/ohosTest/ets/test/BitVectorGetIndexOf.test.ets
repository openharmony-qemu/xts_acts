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

export default function BitVectorGetIndexOfTest() {
  describe('BitVectorGetIndexOfTest', () => {
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

    // ===== Cases from BitVectorLibStandard.test.ets =====

    /**
     * @tc.name   BitVector_getIndexOf_Func_001
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0701
     * @tc.desc   Locates the first occurrence of a certain bit value within a range of bits in a bit vector.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("BitVector_getIndexOf_Func_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        let bitVector = new collections.BitVector(0);
        bitVector.push(1);
        bitVector.push(1);
        bitVector.push(0);
        bitVector.push(1);
        bitVector.push(0);
        let res1 = bitVector.getIndexOf(0, 0, 5);
        expect(res1).assertEqual(2);
        let res2 = bitVector.getIndexOf(1, 0, 5);
        expect(res2).assertEqual(0);
    });
    /**
     * @tc.name   BitVector_getIndexOf_Func_002
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0702
     * @tc.desc   Locates the first occurrence of a certain bit value within a range of bits in a bit vector.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("BitVector_getIndexOf_Func_002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        let bitVector = new collections.BitVector(0);
        bitVector.push(1);
        bitVector.push(1);
        bitVector.push(0);
        bitVector.push(1);
        bitVector.push(0);
        bitVector.push(0);
        bitVector.push(1);
        bitVector.push(0);
        try {
          let res = bitVector.getIndexOf(0, 8, -3);
          expect(true).assertEqual(false);
        } catch (err) {
          expect(err.name).assertEqual("BusinessError");
          expect(err.code).assertEqual(10200001);
          expect(err.message)
            .assertEqual(`The value of "toIndex" is out of range. It must be >= 0 && <= 8. Received value is: -3`);
        }
    });
    /**
     * @tc.name   BitVector_getIndexOf_Func_003
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0703
     * @tc.desc   Locates the first occurrence of a certain bit value within a range of bits in a bit vector.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("BitVector_getIndexOf_Func_003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        let bitVector = new collections.BitVector(0);
        bitVector.push(1);
        bitVector.push(1);
        bitVector.push(0);
        bitVector.push(1);
        bitVector.push(0);
        bitVector.push(0);
        bitVector.push(1);
        bitVector.push(0);
        try {
          let res = bitVector.getIndexOf(0, -3, -3);
          expect(true).assertEqual(false);
        } catch (err) {
          expect(err.name).assertEqual("BusinessError");
          expect(err.code).assertEqual(10200001);
          expect(err.message)
            .assertEqual(`The value of "toIndex" is out of range. It must be >= 0 && <= 8. Received value is: -3`);
        }
    });
    /**
     * @tc.name   BitVector_getIndexOf_Func_004
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0704
     * @tc.desc   Locates the first occurrence of a certain bit value within a range of bits in a bit vector.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("BitVector_getIndexOf_Func_004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        let bitVector = new collections.BitVector(0);
        bitVector.push(1);
        bitVector.push(1);
        bitVector.push(0);
        bitVector.push(1);
        bitVector.push(0);
        bitVector.push(0);
        bitVector.push(1);
        bitVector.push(0);
        try {
          let res = bitVector.getIndexOf(0, -3, 8);
          expect(true).assertEqual(false);
        } catch (err) {
          expect(err.name).assertEqual("BusinessError");
          expect(err.code).assertEqual(10200001);
          expect(err.message)
            .assertEqual(`The value of "fromIndex" is out of range. It must be >= 0 && <= 7. Received value is: -3`);
        }
    });
    /**
     * @tc.name   BitVector_getIndexOf_Func_005
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0705
     * @tc.desc   Locates the first occurrence of a certain bit value within a range of bits in a bit vector.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("BitVector_getIndexOf_Func_005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        let bitVector = new collections.BitVector(0);
        bitVector.push(1);
        bitVector.push(1);
        bitVector.push(0);
        bitVector.push(1);
        bitVector.push(0);
        bitVector.push(0);
        bitVector.push(1);
        bitVector.push(0);
        try {
          let res = bitVector.getIndexOf(0, 0.1, 6.1);
          expect(true).assertEqual(false);
        } catch (err) {
          expect(err.name).assertEqual(`BusinessError`);
          expect(err.code).assertEqual(401);
          expect(err.message).assertEqual(`The type of "fromIndex" must be integer. Received value is: 0.1`);
        }
    });
    /**
     * @tc.name   BitVector_getIndexOf_Func_006
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0706
     * @tc.desc   Locates the first occurrence of a certain bit value within a range of bits in a bit vector.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("BitVector_getIndexOf_Func_006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        let bitVector = new collections.BitVector(0);
        let bitVectorLength = 64;
        for (let i = 0; i < bitVectorLength; i++) {
          if (i >= 32) {
            let res0 = bitVector.push(1);
            expect(res0).assertEqual(true);
          } else {
            let res0 = bitVector.push(0);
            expect(res0).assertEqual(true);
          }
        }
        expect(bitVector.length).assertEqual(64);
        let res1 = bitVector.getIndexOf(0, 0, 64);
        expect(res1).assertEqual(0);
        let res2 = bitVector.getIndexOf(1, 0, 64);
        expect(res2).assertEqual(32);
    });
    /**
     * @tc.name   BitVector_getIndexOf_Func_007
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0707
     * @tc.desc   Locates the first occurrence of a certain bit value within a range of bits in a bit vector.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("BitVector_getIndexOf_Func_007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        let bitVector = new collections.BitVector(10);
        let bitVectorLength = 64;
        for (let i = 0; i < bitVectorLength; i++) {
          if (i >= 32) {
            let res0 = bitVector.push(1);
            expect(res0).assertEqual(true);
          } else {
            let res0 = bitVector.push(0);
            expect(res0).assertEqual(true);
          }
        }
        expect(bitVector.length).assertEqual(bitVectorLength + 10);
        let res1 = bitVector.getIndexOf(0, 10, bitVectorLength + 10);
        expect(res1).assertEqual(10);
        let res2 = bitVector.getIndexOf(1, 10, bitVectorLength + 10);
        expect(res2).assertEqual(42);
    });

    // ===== Cases from BitVectorSendableCollections.test.ets =====

    /**
     * @tc.name   BitVectorTest5200
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0708
     * @tc.desc   Verify BitVector getIndexOf returns first occurrence index of bit value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BitVectorTest5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
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
     * @tc.name   BitVectorTest5300
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0709
     * @tc.desc   Verify BitVector getIndexOf from specified range and returns -1 when not found
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BitVectorTest5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let bv = new collections.BitVector(16)
      bv[5] = 1
      bv[10] = 1
      let index1 = bv.getIndexOf(1, 6, 16)
      expect(index1).assertEqual(10)
      let index2 = bv.getIndexOf(1, 11, 16)
      expect(index2).assertEqual(-1)
    })

    // ===== Cases from BitVectorArktsCollections.test.ets =====

    /**
     * @tc.name   BitVectortest02800
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0710
     * @tc.desc   BitVector getIndexOf 10200001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BitVectortest02800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'BitVectortest02800';
        let flag: boolean = false;
        console.info(`${caseName} test start`);
        try {
          let bitVector: collections.BitVector = new collections.BitVector(0);
          bitVector.push(0);
          bitVector.push(1);
          bitVector.push(0);
          bitVector.push(1);
          bitVector.push(0);
          let res: number = bitVector.getIndexOf(0, -1, 4);
          console.info("bitVector getIndexOf:", res);
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect(e.code).assertEqual(10200001)
          flag = true
        }
        expect(flag).assertTrue()
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   BitVectortest02900
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0711
     * @tc.desc   BitVector getIndexOf 10200011
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BitVectortest02900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'BitVectortest02900';
        let flag: boolean = false;
        console.info(`${caseName} test start`);
        try {
          let bitVector: collections.BitVector = new collections.BitVector(0);
          bitVector.push(0);
          bitVector.push(1);
          bitVector.push(0);
          bitVector.push(1);
          bitVector.push(0);
          let getIndexOfMethod = bitVector.getIndexOf;
          getIndexOfMethod(0, -1, 4);
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect(e.code).assertEqual(10200011)
          flag = true
        }
        expect(flag).assertTrue()
        console.info(`${caseName} test end`);
        done()
      })

    // ===== Cases from BitVectorCollectionsTest.test.ets =====

    /**
     * @tc.name   testBitVectorGetIndexOf0026
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0712
     * @tc.desc   BitVector getIndexOf multiple matches return first test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorGetIndexOf0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorGetIndexOf0026";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(5);
        bitVectorList.push(0);
        bitVectorList.push(0);
        bitVectorList.push(0);
        bitVectorList.push(0);
        bitVectorList.push(0);
        let num = bitVectorList.getIndexOf(0, 1, 5);
        expect(num).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testBitVectorGetIndexOf0027
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0713
     * @tc.desc   BitVector getIndexOf last element match test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorGetIndexOf0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorGetIndexOf0027";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        bitVectorList.push(0);
        bitVectorList.push(1);
        bitVectorList.push(0);
        bitVectorList.push(1);
        bitVectorList.push(0);
        let num = bitVectorList.getIndexOf(0, 2, 5);
        expect(num).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testBitVectorGetIndexOf0028
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0714
     * @tc.desc   BitVector getIndexOf fromIndex length-1 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorGetIndexOf0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorGetIndexOf0028";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(5);
        bitVectorList.push(0);
        bitVectorList.push(1);
        bitVectorList.push(0);
        bitVectorList.push(1);
        bitVectorList.push(0);
        let num = bitVectorList.getIndexOf(0, 4, 5);
        expect(num).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testBitVectorGetIndexOf0001
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0715
     * @tc.desc   Testing the getIndexOf of bitVector, element=0 fromIndex=0 toIndex=10, return 0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorGetIndexOf0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorGetIndexOf0001";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        for (let i = 0; i < 10; i++) {
          if (i < 5) {
            bitVectorList.push(0);
          } else {
            bitVectorList.push(1);
          }
        }
        let num = bitVectorList.getIndexOf(0, 0, 10);
        expect(num).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testBitVectorGetIndexOf0002
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0716
     * @tc.desc   Testing the getIndexOf of bitVector, element=0 fromIndex=0 toIndex=5, return 0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorGetIndexOf0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorGetIndexOf0002";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        for (let i = 0; i < 10; i++) {
          if (i < 5) {
            bitVectorList.push(0);
          } else {
            bitVectorList.push(1);
          }
        }
        let num = bitVectorList.getIndexOf(0, 0, 5);
        expect(num).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testBitVectorGetIndexOf0003
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0717
     * @tc.desc   Testing the getIndexOf of bitVector, element=1 fromIndex=0 toIndex=5, return -1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorGetIndexOf0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorGetIndexOf0003";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        for (let i = 0; i < 10; i++) {
          if (i < 5) {
            bitVectorList.push(0);
          } else {
            bitVectorList.push(1);
          }
        }
        let num = bitVectorList.getIndexOf(1, 0, 5);
        expect(num).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testBitVectorGetIndexOf0004
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0718
     * @tc.desc   Testing the getIndexOf of bitVector, element=1 fromIndex=0 toIndex=10, return 5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorGetIndexOf0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorGetIndexOf0004";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        for (let i = 0; i < 10; i++) {
          if (i < 5) {
            bitVectorList.push(0);
          } else {
            bitVectorList.push(1);
          }
        }
        let num = bitVectorList.getIndexOf(1, 0, 10);
        expect(num).assertEqual(5);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testBitVectorGetIndexOf0005
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0719
     * @tc.desc   Testing the getIndexOf of bitVector, element=1 fromIndex=-1 toIndex=10, return error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorGetIndexOf0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorGetIndexOf0005";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        for (let i = 0; i < 10; i++) {
          if (i < 5) {
            bitVectorList.push(0);
          } else {
            bitVectorList.push(1);
          }
        }
        let num = bitVectorList.getIndexOf(1, -1, 10);
        expect(num).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(`${err.message}`)
          .assertEqual("The value of \"fromIndex\" is out of range. It must be >= 0 && <= 9. Received value is: -1");
      }
      done()
    });
    /**
     * @tc.name   testBitVectorGetIndexOf0006
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0720
     * @tc.desc   Testing the getIndexOf of bitVector, element=1 fromIndex=0 toIndex=11, return error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorGetIndexOf0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorGetIndexOf0006";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        for (let i = 0; i < 10; i++) {
          if (i < 5) {
            bitVectorList.push(0);
          } else {
            bitVectorList.push(1);
          }
        }
        let num = bitVectorList.getIndexOf(1, 0, 11);
        expect(num).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(`${err.message}`)
          .assertEqual("The value of \"toIndex\" is out of range. It must be >= 0 && <= 10. Received value is: 11");
      }
      done()
    });
    /**
     * @tc.name   testBitVectorGetIndexOf0007
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0721
     * @tc.desc   Testing the getIndexOf of bitVector, element=1 fromIndex=5 toIndex=4, return error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorGetIndexOf0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorGetIndexOf0007";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        for (let i = 0; i < 10; i++) {
          if (i < 5) {
            bitVectorList.push(0);
          } else {
            bitVectorList.push(1);
          }
        }
        let num = bitVectorList.getIndexOf(1, 5, 4);
        expect(num).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(`${err.message}`)
          .assertEqual("The value of \"fromIndex\" is out of range. It must be >= 0 && <= 3. Received value is: 5");
      }
      done()
    });
    /**
     * @tc.name   testBitVectorGetIndexOf0008
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0722
     * @tc.desc   Testing the getIndexOf of bitVector, element=1 fromIndex=5 toIndex=5, return error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorGetIndexOf0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorGetIndexOf0008";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        for (let i = 0; i < 10; i++) {
          if (i < 5) {
            bitVectorList.push(0);
          } else {
            bitVectorList.push(1);
          }
        }
        let num = bitVectorList.getIndexOf(1, 5, 5);
        expect(num).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(`${err.message}`)
          .assertEqual("The value of \"fromIndex\" is out of range. It must be >= 0 && <= 4. Received value is: 5");
      }
      done()
    });
    /**
     * @tc.name   testBitVectorGetIndexOf0009
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0723
     * @tc.desc   BitVector getIndexOf element non-zero value test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorGetIndexOf0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorGetIndexOf0009";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        for (let i = 0; i < 10; i++) {
          if (i < 5) {
            bitVectorList.push(0);
          } else {
            bitVectorList.push(1);
          }
        }
        let num = bitVectorList.getIndexOf(2, 0, 10);
        expect(num).assertEqual(5);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testBitVectorGetIndexOf0010
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0724
     * @tc.desc   BitVector getIndexOf element negative value test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorGetIndexOf0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorGetIndexOf0010";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        for (let i = 0; i < 10; i++) {
          if (i < 5) {
            bitVectorList.push(0);
          } else {
            bitVectorList.push(1);
          }
        }
        let num = bitVectorList.getIndexOf(-1, 0, 10);
        expect(num).assertEqual(5);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testBitVectorGetIndexOf0012
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0725
     * @tc.desc   BitVector getIndexOf fromIndex NaN error code 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorGetIndexOf0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorGetIndexOf0012";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        for (let i = 0; i < 10; i++) {
          if (i < 5) {
            bitVectorList.push(0);
          } else {
            bitVectorList.push(1);
          }
        }
        bitVectorList.getIndexOf(1, NaN, 10);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.code).assertEqual(401);
      }
      done()
    });
    /**
     * @tc.name   testBitVectorGetIndexOf0013
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0726
     * @tc.desc   BitVector getIndexOf toIndex NaN error code 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorGetIndexOf0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorGetIndexOf0013";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        for (let i = 0; i < 10; i++) {
          if (i < 5) {
            bitVectorList.push(0);
          } else {
            bitVectorList.push(1);
          }
        }
        bitVectorList.getIndexOf(1, 0, NaN);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.code).assertEqual(401);
      }
      done()
    });
    /**
     * @tc.name   testBitVectorGetIndexOf0014
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0727
     * @tc.desc   BitVector getIndexOf all zeros return -1 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorGetIndexOf0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorGetIndexOf0014";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(3);
        bitVectorList.push(0);
        bitVectorList.push(0);
        bitVectorList.push(0);
        let num = bitVectorList.getIndexOf(1, 0, 3);
        expect(num).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testBitVectorGetIndexOf0015
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0728
     * @tc.desc   BitVector getIndexOf all ones return -1 for 0 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorGetIndexOf0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorGetIndexOf0015";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        bitVectorList.push(1);
        bitVectorList.push(1);
        bitVectorList.push(1);
        let num = bitVectorList.getIndexOf(0, 0, 3);
        expect(num).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testBitVectorGetIndexOf0016
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0729
     * @tc.desc   BitVector getIndexOf large BitVector test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorGetIndexOf0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorGetIndexOf0016";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(100);
        for (let i = 0; i < 100; i++) {
          bitVectorList.push(0);
        }
        bitVectorList.setBitsByRange(1, 50, 51);
        let num = bitVectorList.getIndexOf(1, 0, 100);
        expect(num).assertEqual(50);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testBitVectorGetIndexOf0017
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0730
     * @tc.desc   BitVector getIndexOf single element BitVector test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorGetIndexOf0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorGetIndexOf0017";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(1);
        bitVectorList.push(0);
        let num = bitVectorList.getIndexOf(0, 0, 1);
        expect(num).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testBitVectorGetIndexOf0019
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0731
     * @tc.desc   BitVector getIndexOf return type verification test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorGetIndexOf0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorGetIndexOf0019";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        for (let i = 0; i < 10; i++) {
          if (i < 5) {
            bitVectorList.push(0);
          } else {
            bitVectorList.push(1);
          }
        }
        let num = bitVectorList.getIndexOf(0, 0, 10);
        expect(typeof num).assertEqual('number');
        expect(num >= -1 && num < 10).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testBitVectorGetIndexOf0020
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0732
     * @tc.desc   BitVector getIndexOf first element match test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorGetIndexOf0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorGetIndexOf0020";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(5);
        bitVectorList.push(0);
        bitVectorList.push(1);
        bitVectorList.push(0);
        bitVectorList.push(1);
        bitVectorList.push(0);
        let num = bitVectorList.getIndexOf(0, 0, 5);
        expect(num).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });

    // ===== Cases from BitVectorCollectionsTest2.test.ets =====

    /**
     * @tc.name   testBitVectorGetIndexOfBoundary0001
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0733
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
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0734
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
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0735
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
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0736
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

    /**
     * @tc.name   testBitVectorGetIndexOfPatternBoundary0001
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0737
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
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0738
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
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0739
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
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0740
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
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0741
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
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0742
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

    /**
     * @tc.name   testBitVectorEmptyBoundary0005
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0743
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
  })
}
