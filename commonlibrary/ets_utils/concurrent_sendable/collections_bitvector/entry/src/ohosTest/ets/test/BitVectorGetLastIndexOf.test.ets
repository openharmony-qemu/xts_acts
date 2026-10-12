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

export default function BitVectorGetLastIndexOfTest() {
  describe('BitVectorGetLastIndexOfTest', () => {
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
     * @tc.name   BitVector_getLastIndexOf_Func_001
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0801
     * @tc.desc   Locates the last occurrence of a certain bit value within a range of bits in a bit vector.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("BitVector_getLastIndexOf_Func_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        let bitVector = new collections.BitVector(0);
        bitVector.push(1);
        bitVector.push(1);
        bitVector.push(0);
        bitVector.push(1);
        bitVector.push(0);
        let res1 = bitVector.getLastIndexOf(0, 0, 5);
        expect(res1).assertEqual(4);
        let res2 = bitVector.getLastIndexOf(1, 0, 5);
        expect(res2).assertEqual(3);
    });
    /**
     * @tc.name   BitVector_getLastIndexOf_Func_002
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0802
     * @tc.desc   Locates the last occurrence of a certain bit value within a range of bits in a bit vector.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("BitVector_getLastIndexOf_Func_002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
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
          let res = bitVector.getLastIndexOf(0, 8, -3);
          expect(true).assertEqual(false);
        } catch (err) {
          expect(err.name).assertEqual("BusinessError");
          expect(err.code).assertEqual(10200001);
          expect(err.message)
            .assertEqual(`The value of "toIndex" is out of range. It must be >= 0 && <= 8. Received value is: -3`);
        }
    });
    /**
     * @tc.name   BitVector_getLastIndexOf_Func_003
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0803
     * @tc.desc   Locates the last occurrence of a certain bit value within a range of bits in a bit vector.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("BitVector_getLastIndexOf_Func_003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
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
          let res = bitVector.getLastIndexOf(0, -3, -3);
          expect(true).assertEqual(false);
        } catch (err) {
          expect(err.name).assertEqual("BusinessError");
          expect(err.code).assertEqual(10200001);
          expect(err.message)
            .assertEqual(`The value of "toIndex" is out of range. It must be >= 0 && <= 8. Received value is: -3`);
        }
    });
    /**
     * @tc.name   BitVector_getLastIndexOf_Func_004
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0804
     * @tc.desc   Locates the last occurrence of a certain bit value within a range of bits in a bit vector.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("BitVector_getLastIndexOf_Func_004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
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
          let res = bitVector.getLastIndexOf(0, -3, 8);
          expect(true).assertEqual(false);
        } catch (err) {
          expect(err.name).assertEqual("BusinessError");
          expect(err.code).assertEqual(10200001);
          expect(err.message)
            .assertEqual(`The value of "fromIndex" is out of range. It must be >= 0 && <= 7. Received value is: -3`);
        }
    });
    /**
     * @tc.name   BitVector_getLastIndexOf_Func_005
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0805
     * @tc.desc   Locates the last occurrence of a certain bit value within a range of bits in a bit vector.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("BitVector_getLastIndexOf_Func_005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
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
          let res = bitVector.getLastIndexOf(0, 0.1, 6.1);
          expect(true).assertEqual(false);
        } catch (err) {
          expect(err.name).assertEqual(`BusinessError`);
          expect(err.code).assertEqual(401);
          expect(err.message).assertEqual(`The type of "fromIndex" must be integer. Received value is: 0.1`);
        }
    });
    /**
     * @tc.name   BitVector_getLastIndexOf_Func_006
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0806
     * @tc.desc   Locates the last occurrence of a certain bit value within a range of bits in a bit vector.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("BitVector_getLastIndexOf_Func_006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
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
        let res1 = bitVector.getLastIndexOf(0, 0, 64);
        expect(res1).assertEqual(31);
        let res2 = bitVector.getLastIndexOf(1, 0, 64);
        expect(res2).assertEqual(63);
    });
    /**
     * @tc.name   BitVector_getLastIndexOf_Func_007
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0807
     * @tc.desc   Locates the last occurrence of a certain bit value within a range of bits in a bit vector.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("BitVector_getLastIndexOf_Func_007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
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
        let res1 = bitVector.getLastIndexOf(0, 10, bitVectorLength + 10);
        expect(res1).assertEqual(41);
        let res2 = bitVector.getLastIndexOf(1, 10, bitVectorLength + 10);
        expect(res2).assertEqual(73);
    });

    // ===== Cases from BitVectorSendableCollections.test.ets =====

    /**
     * @tc.name   BitVectorTest5400
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0808
     * @tc.desc   Verify BitVector getLastIndexOf returns last occurrence and -1 when not found
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BitVectorTest5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
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

    // ===== Cases from BitVectorArktsCollections.test.ets =====

    /**
     * @tc.name   BitVectortest03100
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0809
     * @tc.desc   BitVector getLastIndexOf 10200001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BitVectortest03100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'BitVectortest03100';
        let flag: boolean = false;
        console.info(`${caseName} test start`);
        try {
          let bitVector: collections.BitVector = new collections.BitVector(0);
          bitVector.push(0);
          bitVector.push(1);
          bitVector.push(0);
          bitVector.push(1);
          bitVector.push(0);
          let res: number = bitVector.getLastIndexOf(0, -1, 4);
          console.info("bitVector getLastIndexOf:", res);
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
     * @tc.name   BitVectortest03200
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0810
     * @tc.desc   BitVector getLastIndexOf 10200011
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BitVectortest03200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'BitVectortest03200';
        let flag: boolean = false;
        console.info(`${caseName} test start`);
        try {
          let bitVector: collections.BitVector = new collections.BitVector(0);
          bitVector.push(0);
          bitVector.push(1);
          bitVector.push(0);
          bitVector.push(1);
          bitVector.push(0);
          let getLastIndexOfMethod = bitVector.getLastIndexOf;
          getLastIndexOfMethod(0, -1, 4);

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
     * @tc.name   testBitVectorGetLastIndexOf0001
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0811
     * @tc.desc   Testing the getLastIndexOf of bitVector, element=0 fromIndex=0 toIndex=10, return 4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorGetLastIndexOf0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        const TAG = "testBitVectorGetLastIndexOf0001";
        try {
          let bitVectorList: collections.BitVector = new collections.BitVector(0);
          for (let i = 0; i < 10; i++) {
            if (i < 5) {
              bitVectorList.push(0);
            } else {
              bitVectorList.push(1);
            }
          }
          let num = bitVectorList.getLastIndexOf(0, 0, 10);
          expect(num).assertEqual(4);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
        done()
      });
    /**
     * @tc.name   testBitVectorGetLastIndexOf0002
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0812
     * @tc.desc   Testing the getLastIndexOf of bitVector, element=0 fromIndex=0 toIndex=5, return 4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorGetLastIndexOf0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        const TAG = "testBitVectorGetLastIndexOf0002";
        try {
          let bitVectorList: collections.BitVector = new collections.BitVector(0);
          for (let i = 0; i < 10; i++) {
            if (i < 5) {
              bitVectorList.push(0);
            } else {
              bitVectorList.push(1);
            }
          }
          let num = bitVectorList.getLastIndexOf(0, 0, 5);
          expect(num).assertEqual(4);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
        done()
      });
    /**
     * @tc.name   testBitVectorGetLastIndexOf0003
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0813
     * @tc.desc   Testing the getLastIndexOf of bitVector, element=1 fromIndex=0 toIndex=5, return -1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorGetLastIndexOf0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        const TAG = "testBitVectorGetLastIndexOf0003";
        try {
          let bitVectorList: collections.BitVector = new collections.BitVector(0);
          for (let i = 0; i < 10; i++) {
            if (i < 5) {
              bitVectorList.push(0);
            } else {
              bitVectorList.push(1);
            }
          }
          let num = bitVectorList.getLastIndexOf(1, 0, 5);
          expect(num).assertEqual(-1);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
        done()
      });
    /**
     * @tc.name   testBitVectorGetLastIndexOf0004
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0814
     * @tc.desc   Testing the getLastIndexOf of bitVector, element=1 fromIndex=0 toIndex=10, return 9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorGetLastIndexOf0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        const TAG = "testBitVectorGetLastIndexOf0004";
        try {
          let bitVectorList: collections.BitVector = new collections.BitVector(0);
          for (let i = 0; i < 10; i++) {
            if (i < 5) {
              bitVectorList.push(0);
            } else {
              bitVectorList.push(1);
            }
          }
          let num = bitVectorList.getLastIndexOf(1, 0, 10);
          expect(num).assertEqual(9);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
        done()
      });
    /**
     * @tc.name   testBitVectorGetLastIndexOf0005
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0815
     * @tc.desc   Testing the getLastIndexOf of bitVector, element=1 fromIndex=-1 toIndex=10, return error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorGetLastIndexOf0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        const TAG = "testBitVectorGetLastIndexOf0005";
        try {
          let bitVectorList: collections.BitVector = new collections.BitVector(0);
          for (let i = 0; i < 10; i++) {
            if (i < 5) {
              bitVectorList.push(0);
            } else {
              bitVectorList.push(1);
            }
          }
          let num = bitVectorList.getLastIndexOf(1, -1, 10);
          expect(num).assertEqual(-1);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect(`${err.message}`)
            .assertEqual("The value of \"fromIndex\" is out of range. It must be >= 0 && <= 9. Received value is: -1");
        }
        done()
      });
    /**
     * @tc.name   testBitVectorGetLastIndexOf0006
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0816
     * @tc.desc   Testing the getLastIndexOf of bitVector, element=1 fromIndex=0 toIndex=11, return error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorGetLastIndexOf0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        const TAG = "testBitVectorGetLastIndexOf0006";
        try {
          let bitVectorList: collections.BitVector = new collections.BitVector(0);
          for (let i = 0; i < 10; i++) {
            if (i < 5) {
              bitVectorList.push(0);
            } else {
              bitVectorList.push(1);
            }
          }
          let num = bitVectorList.getLastIndexOf(1, 0, 11);
          expect(num).assertEqual(-1);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect(`${err.message}`)
            .assertEqual("The value of \"toIndex\" is out of range. It must be >= 0 && <= 10. Received value is: 11");
        }
        done()
      });
    /**
     * @tc.name   testBitVectorGetLastIndexOf0007
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0817
     * @tc.desc   Testing the getLastIndexOf of bitVector, element=1 fromIndex=5 toIndex=4, return error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorGetLastIndexOf0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        const TAG = "testBitVectorGetLastIndexOf0007";
        try {
          let bitVectorList: collections.BitVector = new collections.BitVector(0);
          for (let i = 0; i < 10; i++) {
            if (i < 5) {
              bitVectorList.push(0);
            } else {
              bitVectorList.push(1);
            }
          }
          let num = bitVectorList.getLastIndexOf(1, 5, 4);
          expect(num).assertEqual(-1);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect(`${err.message}`)
            .assertEqual("The value of \"fromIndex\" is out of range. It must be >= 0 && <= 3. Received value is: 5");
        }
        done()
      });
    /**
     * @tc.name   testBitVectorGetLastIndexOf0008
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0818
     * @tc.desc   Testing the getLastIndexOf of bitVector, element=1 fromIndex=5 toIndex=5, return error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorGetLastIndexOf0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        const TAG = "testBitVectorGetLastIndexOf0008";
        try {
          let bitVectorList: collections.BitVector = new collections.BitVector(0);
          for (let i = 0; i < 10; i++) {
            if (i < 5) {
              bitVectorList.push(0);
            } else {
              bitVectorList.push(1);
            }
          }
          let num = bitVectorList.getLastIndexOf(1, 5, 5);
          expect(num).assertEqual(-1);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect(`${err.message}`)
            .assertEqual("The value of \"fromIndex\" is out of range. It must be >= 0 && <= 4. Received value is: 5");
        }
        done()
      });
    /**
     * @tc.name   testBitVectorGetLastIndexOf0009
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0819
     * @tc.desc   BitVector getLastIndexOf element non-zero value test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorGetLastIndexOf0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        const TAG = "testBitVectorGetLastIndexOf0009";
        try {
          let bitVectorList: collections.BitVector = new collections.BitVector(0);
          for (let i = 0; i < 5; i++) {
            if (i < 5) {
              bitVectorList.push(i % 2);
            }
          }
          let num = bitVectorList.getLastIndexOf(2, 0, 5);
          expect(num).assertEqual(3);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
        done()
      });
    /**
     * @tc.name   testBitVectorGetLastIndexOf0010
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0820
     * @tc.desc   BitVector getLastIndexOf element negative value test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorGetLastIndexOf0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        const TAG = "testBitVectorGetLastIndexOf0010";
        try {
          let bitVectorList: collections.BitVector = new collections.BitVector(0);
          for (let i = 0; i < 5; i++) {
            if (i < 5) {
              bitVectorList.push(i % 2);
            }
          }
          let num = bitVectorList.getLastIndexOf(-1, 0, 5);
          expect(num).assertEqual(3);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
        done()
      });
    /**
     * @tc.name   testBitVectorGetLastIndexOf0012
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0821
     * @tc.desc   BitVector getLastIndexOf fromIndex NaN error code 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorGetLastIndexOf0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        const TAG = "testBitVectorGetLastIndexOf0012";
        try {
          let bitVectorList: collections.BitVector = new collections.BitVector(5);
          for (let i = 0; i < 5; i++) {
            if (i < 5) {
              bitVectorList.push(i % 2);
            }
          }
          bitVectorList.getLastIndexOf(1, NaN, 5);
          expect().assertFail();
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect(err.code).assertEqual(401);
        }
        done()
      });
    /**
     * @tc.name   testBitVectorGetLastIndexOf0013
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0822
     * @tc.desc   BitVector getLastIndexOf fromIndex Infinity error code 10200001 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorGetLastIndexOf0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        const TAG = "testBitVectorGetLastIndexOf0013";
        try {
          let bitVectorList: collections.BitVector = new collections.BitVector(5);
          for (let i = 0; i < 5; i++) {
            if (i < 5) {
              bitVectorList.push(i % 2);
            }
          }
          bitVectorList.getLastIndexOf(1, Infinity, 5);
          expect().assertFail();
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect(err.code).assertEqual(401);
        }
        done()
      });
    /**
     * @tc.name   testBitVectorGetLastIndexOf0014
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0823
     * @tc.desc   BitVector getLastIndexOf toIndex NaN error code 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorGetLastIndexOf0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        const TAG = "testBitVectorGetLastIndexOf0014";
        try {
          let bitVectorList: collections.BitVector = new collections.BitVector(5);
          for (let i = 0; i < 5; i++) {
            if (i < 5) {
              bitVectorList.push(i % 2);
            }
          }
          bitVectorList.getLastIndexOf(1, 0, NaN);
          expect().assertFail();
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect(err.code).assertEqual(401);
        }
        done()
      });
    /**
     * @tc.name   testBitVectorGetLastIndexOf0015
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0824
     * @tc.desc   BitVector getLastIndexOf all zeros return -1 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorGetLastIndexOf0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        const TAG = "testBitVectorGetLastIndexOf0015";
        try {
          let bitVectorList: collections.BitVector = new collections.BitVector(5);
          bitVectorList.push(0);
          bitVectorList.push(0);
          bitVectorList.push(0);
          bitVectorList.push(0);
          bitVectorList.push(0);
          let num = bitVectorList.getLastIndexOf(1, 0, 5);
          expect(num).assertEqual(-1);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
        done()
      });
    /**
     * @tc.name   testBitVectorGetLastIndexOf0016
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0825
     * @tc.desc   BitVector getLastIndexOf all ones return -1 for 0 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorGetLastIndexOf0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        const TAG = "testBitVectorGetLastIndexOf0016";
        try {
          let bitVectorList: collections.BitVector = new collections.BitVector(0);
          bitVectorList.push(1);
          bitVectorList.push(1);
          bitVectorList.push(1);
          bitVectorList.push(1);
          bitVectorList.push(1);
          let num = bitVectorList.getLastIndexOf(0, 0, 5);
          expect(num).assertEqual(-1);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
        done()
      });
    /**
     * @tc.name   testBitVectorGetLastIndexOf0017
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0826
     * @tc.desc   BitVector getLastIndexOf large BitVector test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorGetLastIndexOf0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        const TAG = "testBitVectorGetLastIndexOf0017";
        try {
          let bitVectorList: collections.BitVector = new collections.BitVector(0);
          for (let i = 0; i < 100; i++) {
            bitVectorList.push(i % 2);
          }
          let num = bitVectorList.getLastIndexOf(0, 0, 100);
          expect(num).assertEqual(98);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
        done()
      });
    /**
     * @tc.name   testBitVectorGetLastIndexOf0018
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0827
     * @tc.desc   BitVector getLastIndexOf single element BitVector test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorGetLastIndexOf0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        const TAG = "testBitVectorGetLastIndexOf0018";
        try {
          let bitVectorList: collections.BitVector = new collections.BitVector(1);
          bitVectorList.push(0);
          let num = bitVectorList.getLastIndexOf(0, 0, 1);
          expect(num).assertEqual(0);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
        done()
      });
    /**
     * @tc.name   testBitVectorGetLastIndexOf0020
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0828
     * @tc.desc   BitVector getLastIndexOf return type verification test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorGetLastIndexOf0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        const TAG = "testBitVectorGetLastIndexOf0020";
        try {
          let bitVectorList: collections.BitVector = new collections.BitVector(5);
          for (let i = 0; i < 5; i++) {
            if (i < 5) {
              bitVectorList.push(i % 2);
            }
          }
          let num = bitVectorList.getLastIndexOf(0, 0, 5);
          expect(typeof num).assertEqual('number');
          expect(num >= -1 && num < 5).assertTrue();
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
        done()
      });
    /**
     * @tc.name   testBitVectorGetLastIndexOf0024
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0829
     * @tc.desc   BitVector getLastIndexOf fromIndex length-1 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorGetLastIndexOf0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        const TAG = "testBitVectorGetLastIndexOf0024";
        try {
          let bitVectorList: collections.BitVector = new collections.BitVector(5);
          bitVectorList.push(0);
          bitVectorList.push(1);
          bitVectorList.push(0);
          bitVectorList.push(1);
          bitVectorList.push(0);
          let num = bitVectorList.getLastIndexOf(0, 4, 5);
          expect(num).assertEqual(4);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
        done()
      });
    /**
     * @tc.name   testBitVectorGetLastIndexOf0025
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0830
     * @tc.desc   BitVector getLastIndexOf toIndex fromIndex+1 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorGetLastIndexOf0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        const TAG = "testBitVectorGetLastIndexOf0025";
        try {
          let bitVectorList: collections.BitVector = new collections.BitVector(5);
          bitVectorList.push(0);
          bitVectorList.push(1);
          bitVectorList.push(0);
          bitVectorList.push(1);
          bitVectorList.push(0);
          let num = bitVectorList.getLastIndexOf(0, 2, 3);
          expect(num).assertEqual(2);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
        done()
      });
    /**
     * @tc.name   testBitVectorGetLastIndexOf0026
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0831
     * @tc.desc   BitVector getLastIndexOf multiple matches return last test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorGetLastIndexOf0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        const TAG = "testBitVectorGetLastIndexOf0026";
        try {
          let bitVectorList: collections.BitVector = new collections.BitVector(6);
          bitVectorList.push(0);
          bitVectorList.push(1);
          bitVectorList.push(0);
          bitVectorList.push(0);
          bitVectorList.push(1);
          bitVectorList.push(0);
          let num = bitVectorList.getLastIndexOf(0, 0, 6);
          expect(num).assertEqual(5);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
        done()
      });

    // ===== Cases from BitVectorCollectionsTest2.test.ets =====

    /**
     * @tc.name   testBitVectorGetLastIndexOfBoundary0001
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0832
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
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0833
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
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0834
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
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0835
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

    /**
     * @tc.name   testBitVectorGetLastIndexOfPatternBoundary0001
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0836
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
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0837
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
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0838
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
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0839
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
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0840
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
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0841
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

    /**
     * @tc.name   testBitVectorEmptyBoundary0006
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0842
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
  })
}
