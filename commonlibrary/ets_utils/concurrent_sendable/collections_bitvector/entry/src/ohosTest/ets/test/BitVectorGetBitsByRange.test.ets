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

export default function BitVectorGetBitsByRangeTest() {
  describe('BitVectorGetBitsByRangeTest', () => {
    beforeAll(() => {
      console.log('beforeAll: Prerequisites at the test suite level.');
    });
    beforeEach(() => {
      console.log('beforeEach: Prerequisites at the test case level.');
    });
    afterEach(() => {
      console.log('afterEach: Test case-level clearance conditions.');
    });
    afterAll(() => {
      console.log('afterAll: Test suite-level cleanup condition.');
    });

    /**
     * @tc.name   BitVector_getBitsByRange_Func_001
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0401
     * @tc.desc   Returns the bit values in a range of indices in a bit vector.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("BitVector_getBitsByRange_Func_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        let bitVector = new collections.BitVector(0);
        bitVector.push(1);
        bitVector.push(1);
        bitVector.push(0);
        bitVector.push(1);
        bitVector.push(1);
        bitVector.getBitsByRange(0, 3);
        expect(bitVector[0]).assertEqual(1);
        expect(bitVector[1]).assertEqual(1);
        expect(bitVector[2]).assertEqual(0);
    });
    /**
     * @tc.name   BitVector_getBitsByRange_Func_002
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0402
     * @tc.desc   Returns the bit values in a range of indices in a bit vector.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("BitVector_getBitsByRange_Func_002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
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
          let res = bitVector.getBitsByRange(8, -3);
          expect(true).assertEqual(false);
        } catch (err) {
          expect(err.name).assertEqual("BusinessError");
          expect(err.code).assertEqual(10200001);
          expect(err.message)
            .assertEqual(`The value of "toIndex" is out of range. It must be >= 0 && <= 8. Received value is: -3`);
        }
    });
    /**
     * @tc.name   BitVector_getBitsByRange_Func_003
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0403
     * @tc.desc   Returns the bit values in a range of indices in a bit vector.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("BitVector_getBitsByRange_Func_003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
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
          let res = bitVector.getBitsByRange(0.1, 6.1);
          expect(true).assertEqual(false);
        } catch (err) {
          expect(err.name).assertEqual(`BusinessError`);
          expect(err.code).assertEqual(401);
          expect(err.message).assertEqual(`The type of "fromIndex" must be integer. Received value is: 0.1`);
        }
    });
    /**
     * @tc.name   BitVector_getBitsByRange_Func_004
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0404
     * @tc.desc   Returns the bit values in a range of indices in a bit vector.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("BitVector_getBitsByRange_Func_004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
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
          let res = bitVector.getBitsByRange(-3, -3);
          expect(true).assertEqual(false);
        } catch (err) {
          expect(err.name).assertEqual("BusinessError");
          expect(err.code).assertEqual(10200001);
          expect(err.message)
            .assertEqual(`The value of "toIndex" is out of range. It must be >= 0 && <= 8. Received value is: -3`);
        }
    });
    /**
     * @tc.name   BitVector_getBitsByRange_Func_005
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0405
     * @tc.desc   Returns the bit values in a range of indices in a bit vector.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("BitVector_getBitsByRange_Func_005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
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
          let res = bitVector.getBitsByRange(-3, 8);
          expect(true).assertEqual(false);
        } catch (err) {
          expect(err.name).assertEqual("BusinessError");
          expect(err.code).assertEqual(10200001);
          expect(err.message)
            .assertEqual(`The value of "fromIndex" is out of range. It must be >= 0 && <= 7. Received value is: -3`);
        }
    });
    /**
     * @tc.name   BitVector_getBitsByRange_Func_006
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0406
     * @tc.desc   Returns the bit values in a range of indices in a bit vector.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("BitVector_getBitsByRange_Func_006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        let bitVector_old = new collections.BitVector(0);
        let bitVectorLength = 64;
        for (let i = 0; i < bitVectorLength; i++) {
          let res0 = bitVector_old.push(0);
          expect(res0).assertEqual(true);
        }
        expect(bitVector_old.length).assertEqual(64);
        let bitVector_new: collections.BitVector = bitVector_old.getBitsByRange(0, 64);
        for (let i = 0; i < bitVectorLength; i++) {
          expect(bitVector_new[i]).assertEqual(0);
        }
    });
    /**
     * @tc.name   BitVector_getBitsByRange_Func_007
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0407
     * @tc.desc   Returns the bit values in a range of indices in a bit vector.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("BitVector_getBitsByRange_Func_007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        let bitVector_old = new collections.BitVector(10);
        let bitVectorLength = 64;
        for (let i = 0; i < bitVectorLength; i++) {
          let res0 = bitVector_old.push(0);
          expect(res0).assertEqual(true);
        }
        expect(bitVector_old.length).assertEqual(bitVectorLength + 10);
        let bitVector_new: collections.BitVector = bitVector_old.getBitsByRange(0, bitVectorLength + 10);
        for (let i = 10; i < bitVectorLength + 10; i++) {
          expect(bitVector_new[i]).assertEqual(0);
        }
    });
    /**
     * @tc.name   BitVector_getBitsByRange_Func_008
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0408
     * @tc.desc   Returns the bit values in a range of indices in a bit vector.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("BitVector_getBitsByRange_Func_008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        let old_bitVector = new collections.BitVector(0);
        let bitVectorLength = 64;
        for (let i = 0; i < bitVectorLength; i++) {
          let res0 = old_bitVector.push(0);
          expect(res0).assertEqual(true);
        }
        expect(old_bitVector.length).assertEqual(bitVectorLength);
        try {
          let tmp:string = "test";
          let a:number = JSON.parse(JSON.stringify(tmp)) as number;
          let new_bitVector: collections.BitVector = old_bitVector.getBitsByRange(0, a);
          expect(true).assertEqual(false);
        } catch (err) {
          expect(err.name).assertEqual(`BusinessError`);
          expect(err.code).assertEqual(401);
          expect(err.message)
            .assertEqual(`The type of "toIndex" must be integer. Received value is: test`);
        }
    });

    /**
     * @tc.name   BitVectorTest3700
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0409
     * @tc.desc   Verify BitVector getBitsByRange with normal range returns correct sub vector
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BitVectorTest3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let bv = new collections.BitVector(16)
      bv.setAllBits(1)
      let result = bv.getBitsByRange(4, 12)
      expect(result.length).assertEqual(8)
      for (let i = 0; i < 8; i++) {
        expect(result[i]).assertEqual(1)
      }
    })

    /**
     * @tc.name   BitVectorTest3800
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0410
     * @tc.desc   Verify BitVector getBitsByRange with boundary index values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BitVectorTest3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let bv = new collections.BitVector(16)
      let result1 = bv.getBitsByRange(0, 1)
      expect(result1.length).assertEqual(1)
      let result2 = bv.getBitsByRange(15, 16)
      expect(result2.length).assertEqual(1)
    })

    /**
     * @tc.name   BitVectorTest3900
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0411
     * @tc.desc   Verify BitVector getBitsByRange with invalid index throws error 10200001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BitVectorTest3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let bv = new collections.BitVector(16)
      try {
        bv.getBitsByRange(-1, 16)
        expect().assertFail()
      } catch (e) {
        expect(e.code).assertEqual(10200001)
      }
    })

    /**
     * @tc.name   BitVectorTest4000
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0412
     * @tc.desc   Verify BitVector getBitsByRange returns different instance and throws error for toIndex exceeding length and fromIndex equal to toIndex
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BitVectorTest4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let bv = new collections.BitVector(16)
      let result = bv.getBitsByRange(0, 8)
      expect(result instanceof collections.BitVector).assertTrue()
      expect(result !== bv).assertTrue()
    })

    /**
     * @tc.name   BitVectorTest4100
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0413
     * @tc.desc   Verify BitVector getBitsByRange throws error for toIndex exceeding length
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BitVectorTest4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let bv = new collections.BitVector(16)
      try {
        bv.getBitsByRange(0, 17)
        expect().assertFail()
      } catch (e) {
        expect(e.code).assertEqual(10200001)
      }
    })

    /**
     * @tc.name   BitVectorTest4200
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0414
     * @tc.desc   Verify BitVector getBitsByRange throws error for fromIndex equal to toIndex
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BitVectorTest4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let bv = new collections.BitVector(16)
      try {
        bv.getBitsByRange(8, 8)
        expect().assertFail()
      } catch (e) {
        expect(e.code).assertEqual(10200001)
      }
    })

    /**
     * @tc.name   BitVectortest01600
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0415
     * @tc.desc   BitVector getBitsByRange 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BitVectortest01600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'BitVectortest01600';
        let flag: boolean = false;
        console.info(`${caseName} test start`);
        try {
          let bitVector: collections.BitVector = new collections.BitVector(0);
          bitVector.push(0);
          bitVector.push(1);
          bitVector.push(0);
          bitVector.push(1);
          bitVector.push(0);
          let bitVector2 = bitVector.getBitsByRange(NaN, NaN);
          console.info("bitVector2 length:", bitVector2.length);
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect(e.code).assertEqual(401)
          flag = true
        }
        expect(flag).assertTrue()
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   BitVectortest01700
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0416
     * @tc.desc   BitVector getBitsByRange 10200001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BitVectortest01700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'BitVectortest01700';
        let flag: boolean = false;
        console.info(`${caseName} test start`);
        try {
          let bitVector: collections.BitVector = new collections.BitVector(0);
          bitVector.push(0);
          bitVector.push(1);
          bitVector.push(0);
          bitVector.push(1);
          bitVector.push(0);
          let bitVector2 = bitVector.getBitsByRange(-1, 1);
          console.info("bitVector2 length:", bitVector2.length);
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
     * @tc.name   BitVectortest01800
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0417
     * @tc.desc   BitVector getBitsByRange 10200011
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BitVectortest01800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'BitVectortest01800';
        let flag: boolean = false;
        console.info(`${caseName} test start`);
        try {
          let bitVector: collections.BitVector = new collections.BitVector(0);
          bitVector.push(0);
          bitVector.push(1);
          bitVector.push(0);
          bitVector.push(1);
          bitVector.push(0);
          let getBitsByRangeMethod = bitVector.getBitsByRange;
          getBitsByRangeMethod(1, 3)
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
     * @tc.name   testBitVectorGetBitsByRange0001
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0418
     * @tc.desc   Testing the getBitsByRange of bitVector, fromIndex=0,toIndex=6, return 000001.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorGetBitsByRange0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        const TAG = "testBitVectorGetBitsByRange0001";
        try {
          let bitVectorList: collections.BitVector = new collections.BitVector(0);
          for (let i = 0; i < 10; i++) {
            if (i < 5) {
              bitVectorList.push(0);
            } else {
              bitVectorList.push(1);
            }
          }
          let bitVectorList2 = bitVectorList.getBitsByRange(0, 6);
          for (let i = 0; i < 6; i++) {
            if (i < 5) {
              expect(bitVectorList2[i].toString()).assertEqual("0");
            } else {
              expect(bitVectorList2[i].toString()).assertEqual("1");
            }
          }
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
        done()
      });
    /**
     * @tc.name   testBitVectorGetBitsByRange0002
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0419
     * @tc.desc   Testing the getBitsByRange of bitVector, fromIndex=4,toIndex=10, return 011111.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorGetBitsByRange0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        const TAG = "testBitVectorGetBitsByRange0002";
        try {
          let bitVectorList: collections.BitVector = new collections.BitVector(0);
          for (let i = 0; i < 10; i++) {
            if (i < 5) {
              bitVectorList.push(0);
            } else {
              bitVectorList.push(1);
            }
          }
          let bitVectorList2 = bitVectorList.getBitsByRange(4, 10);
          for (let i = 0; i < 6; i++) {
            if (i < 1) {
              expect(bitVectorList2[i].toString()).assertEqual("0");
            } else {
              expect(bitVectorList2[i].toString()).assertEqual("1");
            }
          }
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
        done()
      });
    /**
     * @tc.name   testBitVectorGetBitsByRange0003
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0420
     * @tc.desc   Testing the getBitsByRange of bitVector, fromIndex=4,toIndex=11, return error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorGetBitsByRange0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        const TAG = "testBitVectorGetBitsByRange0003";
        try {
          let bitVectorList: collections.BitVector = new collections.BitVector(0);
          for (let i = 0; i < 10; i++) {
            if (i < 5) {
              bitVectorList.push(0);
            } else {
              bitVectorList.push(1);
            }
          }
          let bitVectorList2 = bitVectorList.getBitsByRange(4, 11);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect(`${err.message}`)
            .assertEqual("The value of \"toIndex\" is out of range. It must be >= 0 && <= 10. Received value is: 11");
        }
        done()
      });
    /**
     * @tc.name   testBitVectorGetBitsByRange0004
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0421
     * @tc.desc   Testing the getBitsByRange of bitVector, fromIndex=-1,toIndex=10, return error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorGetBitsByRange0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        const TAG = "testBitVectorGetBitsByRange0004";
        try {
          let bitVectorList: collections.BitVector = new collections.BitVector(0);
          for (let i = 0; i < 10; i++) {
            if (i < 5) {
              bitVectorList.push(0);
            } else {
              bitVectorList.push(1);
            }
          }
          let bitVectorList2 = bitVectorList.getBitsByRange(-1, 10);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect(`${err.message}`)
            .assertEqual("The value of \"fromIndex\" is out of range. It must be >= 0 && <= 9. Received value is: -1");
        }
        done()
      });
    /**
     * @tc.name   testBitVectorGetBitsByRange0005
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0422
     * @tc.desc   Testing the getBitsByRange of bitVector, fromIndex=5,toIndex=4, return error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorGetBitsByRange0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        const TAG = "testBitVectorGetBitsByRange0005";
        try {
          let bitVectorList: collections.BitVector = new collections.BitVector(0);
          for (let i = 0; i < 10; i++) {
            if (i < 5) {
              bitVectorList.push(0);
            } else {
              bitVectorList.push(1);
            }
          }
          let bitVectorList2 = bitVectorList.getBitsByRange(5, 4);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect(`${err.message}`)
            .assertEqual("The value of \"fromIndex\" is out of range. It must be >= 0 && <= 3. Received value is: 5");
        }
        done()
      });
    /**
     * @tc.name   testBitVectorGetBitsByRange0006
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0423
     * @tc.desc   Testing the getBitsByRange of bitVector, fromIndex=5,toIndex=5, return error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorGetBitsByRange0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        const TAG = "testBitVectorGetBitsByRange0006";
        try {
          let bitVectorList: collections.BitVector = new collections.BitVector(0);
          for (let i = 0; i < 10; i++) {
            if (i < 5) {
              bitVectorList.push(0);
            } else {
              bitVectorList.push(1);
            }
          }
          let bitVectorList2 = bitVectorList.getBitsByRange(5, 5);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect(`${err.message}`)
            .assertEqual("The value of \"fromIndex\" is out of range. It must be >= 0 && <= 4. Received value is: 5");
        }
        done()
      });
    /**
     * @tc.name   testBitVectorGetBitsByRange0011
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0424
     * @tc.desc   BitVector getBitsByRange with NaN fromIndex parameter test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorGetBitsByRange0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        const TAG = "testBitVectorGetBitsByRange0011";
        try {
          let bitVectorList: collections.BitVector = new collections.BitVector(0);
          bitVectorList.push(1);
          bitVectorList.push(0);
          bitVectorList.push(1);
          bitVectorList.getBitsByRange(NaN, 2);
          expect().assertFail();
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect(err.code).assertEqual(401);
        }
        done()
      });
    /**
     * @tc.name   testBitVectorGetBitsByRange0012
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0425
     * @tc.desc   BitVector getBitsByRange with NaN toIndex parameter test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorGetBitsByRange0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        const TAG = "testBitVectorGetBitsByRange0012";
        try {
          let bitVectorList: collections.BitVector = new collections.BitVector(0);
          bitVectorList.push(1);
          bitVectorList.push(0);
          bitVectorList.push(1);
          bitVectorList.getBitsByRange(0, NaN);
          expect().assertFail();
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect(err.code).assertEqual(401);
        }
        done()
      });
    /**
     * @tc.name   testBitVectorGetBitsByRange0013
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0426
     * @tc.desc   BitVector getBitsByRange with negative fromIndex parameter test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorGetBitsByRange0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        const TAG = "testBitVectorGetBitsByRange0013";
        try {
          let bitVectorList: collections.BitVector = new collections.BitVector(0);
          bitVectorList.push(1);
          bitVectorList.push(0);
          bitVectorList.push(1);
          bitVectorList.getBitsByRange(-1, 2);
          expect().assertFail();
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect(err.code).assertEqual(10200001);
        }
        done()
      });
    /**
     * @tc.name   testBitVectorGetBitsByRange0014
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0427
     * @tc.desc   BitVector getBitsByRange with toIndex out of range test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorGetBitsByRange0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        const TAG = "testBitVectorGetBitsByRange0014";
        try {
          let bitVectorList: collections.BitVector = new collections.BitVector(0);
          bitVectorList.push(1);
          bitVectorList.push(0);
          bitVectorList.push(1);
          bitVectorList.getBitsByRange(0, 10);
          expect().assertFail();
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect(err.code).assertEqual(10200001);
        }
        done()
      });
    /**
     * @tc.name   testBitVectorGetBitsByRange0016
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0428
     * @tc.desc   BitVector getBitsByRange with large range 1000 elements test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorGetBitsByRange0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        const TAG = "testBitVectorGetBitsByRange0016";
        try {
          let bitVectorList: collections.BitVector = new collections.BitVector(0);
          for (let i = 0; i < 100; i++) {
            bitVectorList.push(i % 2);
          }
          let result = bitVectorList.getBitsByRange(50, 100);
          expect(result.length).assertEqual(50);
          expect(result instanceof collections.BitVector).assertTrue();
          for (let i = 0; i < 50; i++) {
            expect(result[i]).assertEqual((50 + i) % 2);
          }
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
        done()
      });

    /**
     * @tc.name   testBitVectorGetBitsByRangeBoundary0001
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0429
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
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0430
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
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0431
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
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0432
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
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0433
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

    /**
     * @tc.name   testBitVectorEmptyBoundary0003
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0434
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
     * @tc.name   testBitVector64Boundary0007
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0435
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
     * @tc.name   testBitVector128Boundary0007
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0436
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
  });
}
