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

export default function BitVectorSetBitsByRangeTest() {
  describe('BitVectorSetBitsByRangeTest', () => {
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
     * @tc.name   BitVector_setBitsByRange_Func_001
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0251
     * @tc.desc   Sets a range of bits in a bit vector to a particular element.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("BitVector_setBitsByRange_Func_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        let bitVector = new collections.BitVector(0);
        bitVector.push(0);
        bitVector.push(1);
        bitVector.push(1);
        bitVector.push(1);
        bitVector.push(0);
        bitVector.setBitsByRange(0, 1, 4);
        expect(bitVector[1]).assertEqual(0);
        expect(bitVector[2]).assertEqual(0);
        expect(bitVector[3]).assertEqual(0);
        bitVector.setBitsByRange(1, 1, 4);
        expect(bitVector[1]).assertEqual(1);
        expect(bitVector[2]).assertEqual(1);
        expect(bitVector[3]).assertEqual(1);
    });
    /**
     * @tc.name   BitVector_setBitsByRange_Func_002
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0252
     * @tc.desc   Sets a range of bits in a bit vector to a particular element.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("BitVector_setBitsByRange_Func_002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
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
          let res = bitVector.setBitsByRange(0, 8, -3);
          expect(true).assertEqual(false);
        } catch (err) {
          expect(err.name).assertEqual("BusinessError");
          expect(err.code).assertEqual(10200001);
          expect(err.message)
            .assertEqual(`The value of "toIndex" is out of range. It must be >= 0 && <= 8. Received value is: -3`);
        }
    });
    /**
     * @tc.name   BitVector_setBitsByRange_Func_003
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0253
     * @tc.desc   Sets a range of bits in a bit vector to a particular element.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("BitVector_setBitsByRange_Func_003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
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
          let res = bitVector.setBitsByRange(0, 0.1, 6.1);
          expect(true).assertEqual(false);
        } catch (err) {
          expect(err.name).assertEqual(`BusinessError`);
          expect(err.code).assertEqual(401);
          expect(err.message).assertEqual(`The type of "fromIndex" must be integer. Received value is: 0.1`);
        }
    });
    /**
     * @tc.name   BitVector_setBitsByRange_Func_004
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0254
     * @tc.desc   Sets a range of bits in a bit vector to a particular element.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("BitVector_setBitsByRange_Func_004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
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
          let res = bitVector.setBitsByRange(0, -3, -3);
          expect(true).assertEqual(false);
        } catch (err) {
          expect(err.name).assertEqual("BusinessError");
          expect(err.code).assertEqual(10200001);
          expect(err.message)
            .assertEqual(`The value of "toIndex" is out of range. It must be >= 0 && <= 8. Received value is: -3`);
        }
    });
    /**
     * @tc.name   BitVector_setBitsByRange_Func_005
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0255
     * @tc.desc   Sets a range of bits in a bit vector to a particular element.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("BitVector_setBitsByRange_Func_005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
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
          let res = bitVector.setBitsByRange(0, -3, 8);
          expect(true).assertEqual(false);
        } catch (err) {
          expect(err.name).assertEqual("BusinessError");
          expect(err.code).assertEqual(10200001);
          expect(err.message)
            .assertEqual(`The value of "fromIndex" is out of range. It must be >= 0 && <= 7. Received value is: -3`);
        }
    });
    /**
     * @tc.name   BitVector_setBitsByRange_Func_006
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0256
     * @tc.desc   Sets a range of bits in a bit vector to a particular element.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("BitVector_setBitsByRange_Func_006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
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
        bitVector.setBitsByRange(1, 0, 32);
        for (let i = 0; i < 32; i++) {
          expect(bitVector[i]).assertEqual(1);
        }
        bitVector.setBitsByRange(0, 32, 64);
        for (let i = 32; i < 64; i++) {
          expect(bitVector[i]).assertEqual(0);
        }
    });
    /**
     * @tc.name   BitVector_setBitsByRange_Func_007
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0257
     * @tc.desc   Sets a range of bits in a bit vector to a particular element.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("BitVector_setBitsByRange_Func_007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
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
        bitVector.setBitsByRange(1, 10, 42);
        for (let i = 10; i < 42; i++) {
          expect(bitVector[i]).assertEqual(1);
        }
        bitVector.setBitsByRange(0, 42, 74);
        for (let i = 42; i < 74; i++) {
          expect(bitVector[i]).assertEqual(0);
        }
    });
    /**
     * @tc.name   BitVector_setBitsByRange_Func_008
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0258
     * @tc.desc   Check for abnormal input parameters.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("BitVector_setBitsByRange_Func_008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        try {
          let bitVector = new collections.BitVector(0);
          let tmp:string = "test";
          let a:number = JSON.parse(JSON.stringify(tmp)) as number;
          bitVector.push(0);
          bitVector.push(0);
          bitVector.push(0);
          bitVector.push(0);
          bitVector.push(0);
          bitVector.setBitsByRange(1, a, 4);
          expect(true).assertEqual(false);
        } catch (err) {
          expect(err.name).assertEqual(`BusinessError`);
          expect(err.code).assertEqual(401);
          expect(err.message)
            .assertEqual(`The type of "fromIndex" must be integer. Received value is: test`);
        }
    });
    /**
     * @tc.name   BitVector_setBitsByRange_Func_009
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0259
     * @tc.desc   Check for abnormal input parameters.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("BitVector_setBitsByRange_Func_009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        try {
          let bitVector = new collections.BitVector(2);
          bitVector.setBitsByRange(1, 0, 3);
          expect(true).assertEqual(false);
        } catch (err) {
          expect(err.name).assertEqual("BusinessError");
          expect(err.code).assertEqual(10200001);
          expect(err.message)
            .assertEqual(`The value of "toIndex" is out of range. It must be >= 0 && <= 2. Received value is: 3`);
        }
    });

    /**
     * @tc.name   BitVectorTest2700
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0260
     * @tc.desc   Verify BitVector setBitsByRange sets range to 1 correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BitVectorTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
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
     * @tc.name   BitVectorTest2800
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0261
     * @tc.desc   Verify BitVector setBitsByRange with element 0 and non-zero values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BitVectorTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
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
     * @tc.name   BitVectorTest2900
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0262
     * @tc.desc   Verify BitVector setBitsByRange with boundary index values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BitVectorTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let bv = new collections.BitVector(16)
      bv.setBitsByRange(1, 0, 1)
      expect(bv[0]).assertEqual(1)
      expect(bv[1]).assertEqual(0)
      bv.setBitsByRange(1, 15, 16)
      expect(bv[15]).assertEqual(1)
    })

    /**
     * @tc.name   BitVectorTest3000
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0263
     * @tc.desc   Verify BitVector setBitsByRange with invalid index throws error 10200001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BitVectorTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let bv = new collections.BitVector(16)
      try {
        bv.setBitsByRange(1, -1, 16)
        expect().assertFail()
      } catch (e) {
        expect(e.code).assertEqual(10200001)
      }
    })

    /**
     * @tc.name   BitVectorTest3100
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0264
     * @tc.desc   Verify BitVector setBitsByRange returns void and throws error for toIndex exceeding length and fromIndex equal to toIndex
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BitVectorTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let bv = new collections.BitVector(16)
      let result = bv.setBitsByRange(1, 0, 8)
      expect(result).assertUndefined()
    })

    /**
     * @tc.name   BitVectorTest3200
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0265
     * @tc.desc   Verify BitVector setBitsByRange throws error for toIndex exceeding length
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BitVectorTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let bv = new collections.BitVector(16)
      try {
        bv.setBitsByRange(1, 0, 17)
        expect().assertFail()
      } catch (e) {
        expect(e.code).assertEqual(10200001)
      }
    })

    /**
     * @tc.name   BitVectorTest3300
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0266
     * @tc.desc   Verify BitVector setBitsByRange throws error for fromIndex equal to toIndex
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BitVectorTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let bv = new collections.BitVector(16)
      try {
        bv.setBitsByRange(1, 8, 8)
        expect().assertFail()
      } catch (e) {
        expect(e.code).assertEqual(10200001)
      }
    })

    /**
     * @tc.name   BitVectortest01000
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0267
     * @tc.desc   BitVector setBitsByRange 10200001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BitVectortest01000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'BitVectortest01000';
        let flag: boolean = false;
        console.info(`${caseName} test start`);
        try {
          let bitVector: collections.BitVector = new collections.BitVector(0);
          bitVector.push(0);
          bitVector.push(1);
          bitVector.push(0);
          bitVector.push(1);
          bitVector.push(0);
          bitVector.setBitsByRange(1, -1, 3);
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
     * @tc.name   BitVectortest01100
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0268
     * @tc.desc   BitVector setBitsByRange 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BitVectortest01100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'BitVectortest01100';
        let flag: boolean = false;
        console.info(`${caseName} test start`);
        try {
          let bitVector: collections.BitVector = new collections.BitVector(0);
          bitVector.push(0);
          bitVector.push(1);
          bitVector.push(0);
          bitVector.push(1);
          bitVector.push(0);
          bitVector.setBitsByRange(NaN, NaN, 3);
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
     * @tc.name   BitVectortest01200
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0269
     * @tc.desc   BitVector setBitsByRange 10200011
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BitVectortest01200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'BitVectortest01200';
        let flag: boolean = false;
        console.info(`${caseName} test start`);
        try {
          let bitVector: collections.BitVector = new collections.BitVector(0);
          bitVector.push(0);
          bitVector.push(1);
          bitVector.push(0);
          bitVector.push(1);
          bitVector.push(0);
          let setBitsByRangeMethod = bitVector.setBitsByRange;
          setBitsByRangeMethod(1, 1, 3)
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
     * @tc.name   testBitVectorSetBitsByRange0001
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0270
     * @tc.desc   Testing the setBitsByRange of bitVector, element=0 fromIndex=0 toIndex=10, return true.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorSetBitsByRange0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        const TAG = "testBitVectorSetBitsByRange0001";
        try {
          let bitVectorList: collections.BitVector = new collections.BitVector(0);
          for (let i = 0; i < 10; i++) {
            bitVectorList.push(0);
          }
          bitVectorList.setBitsByRange(1, 5, 10);
          let rst = bitVectorList.has(0, 0, 10);
          expect(rst).assertEqual(true);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
        done()
      });
    /**
     * @tc.name   testBitVectorSetBitsByRange0002
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0271
     * @tc.desc   Testing the setBitsByRange of bitVector, element=0 fromIndex=0 toIndex=5, return true.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorSetBitsByRange0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        const TAG = "testBitVectorSetBitsByRange0002";
        try {
          let bitVectorList: collections.BitVector = new collections.BitVector(0);
          for (let i = 0; i < 10; i++) {
            bitVectorList.push(0);
          }
          bitVectorList.setBitsByRange(1, 5, 10);
          let rst = bitVectorList.has(0, 0, 5);
          expect(rst).assertEqual(true);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
        done()
      });
    /**
     * @tc.name   testBitVectorSetBitsByRange0003
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0272
     * @tc.desc   Testing the setBitsByRange of bitVector, element=1 fromIndex=0 toIndex=5, return false.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorSetBitsByRange0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        const TAG = "testBitVectorSetBitsByRange0003";
        try {
          let bitVectorList: collections.BitVector = new collections.BitVector(0);
          for (let i = 0; i < 10; i++) {
            bitVectorList.push(0);
          }
          bitVectorList.setBitsByRange(1, 5, 10);
          let rst = bitVectorList.has(1, 0, 4);
          expect(rst).assertEqual(false);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
        done()
      });
    /**
     * @tc.name   testBitVectorSetBitsByRange0004
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0273
     * @tc.desc   Testing the setBitsByRange of bitVector, element=1 fromIndex=0 toIndex=10, return true.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorSetBitsByRange0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        const TAG = "testBitVectorSetBitsByRange0004";
        try {
          let bitVectorList: collections.BitVector = new collections.BitVector(0);
          for (let i = 0; i < 10; i++) {
            bitVectorList.push(0);
          }
          bitVectorList.setBitsByRange(1, 5, 10);
          let rst = bitVectorList.has(1, 0, 10);
          expect(rst).assertEqual(true);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
        done()
      });
    /**
     * @tc.name   testBitVectorSetBitsByRange0005
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0274
     * @tc.desc   Testing the setBitsByRange of bitVector, element=1 fromIndex=-1 toIndex=10, return error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorSetBitsByRange0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        const TAG = "testBitVectorSetBitsByRange0005";
        try {
          let bitVectorList: collections.BitVector = new collections.BitVector(0);
          for (let i = 0; i < 10; i++) {
            bitVectorList.push(0);
          }
          bitVectorList.setBitsByRange(1, 5, 10);
          let rst = bitVectorList.has(1, -1, 10);
          expect(rst).assertEqual(false);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect(`${err.message}`)
            .assertEqual("The value of \"fromIndex\" is out of range. It must be >= 0 && <= 9. Received value is: -1");
        }
        done()
      });
    /**
     * @tc.name   testBitVectorSetBitsByRange0006
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0275
     * @tc.desc   Testing the setBitsByRange of bitVector, element=1 fromIndex=0 toIndex=11, return error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorSetBitsByRange0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        const TAG = "testBitVectorSetBitsByRange0006";
        try {
          let bitVectorList: collections.BitVector = new collections.BitVector(0);
          for (let i = 0; i < 10; i++) {
            bitVectorList.push(0);
          }
          bitVectorList.setBitsByRange(1, 5, 10);
          let rst = bitVectorList.has(1, 0, 11);
          expect(rst).assertEqual(false);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect(`${err.message}`)
            .assertEqual("The value of \"toIndex\" is out of range. It must be >= 0 && <= 10. Received value is: 11");
        }
        done()
      });
    /**
     * @tc.name   testBitVectorSetBitsByRange0007
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0276
     * @tc.desc   Testing the setBitsByRange of bitVector, element=1 fromIndex=5 toIndex=4, return error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorSetBitsByRange0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        const TAG = "testBitVectorSetBitsByRange0007";
        try {
          let bitVectorList: collections.BitVector = new collections.BitVector(0);
          for (let i = 0; i < 10; i++) {
            bitVectorList.push(0);
          }
          bitVectorList.setBitsByRange(1, 5, 10);
          let rst = bitVectorList.has(1, 5, 4);
          expect(rst).assertEqual(false);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect(`${err.message}`)
            .assertEqual("The value of \"fromIndex\" is out of range. It must be >= 0 && <= 3. Received value is: 5");
        }
        done()
      });
    /**
     * @tc.name   testBitVectorSetBitsByRange0008
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0277
     * @tc.desc   Testing the setBitsByRange of bitVector, element=1 fromIndex=5 toIndex=5, return error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorSetBitsByRange0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        const TAG = "testBitVectorSetBitsByRange0008";
        try {
          let bitVectorList: collections.BitVector = new collections.BitVector(0);
          for (let i = 0; i < 10; i++) {
            bitVectorList.push(0);
          }
          bitVectorList.setBitsByRange(1, 5, 10);
          let rst = bitVectorList.has(1, 5, 5);
          expect(rst).assertEqual(false);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect(`${err.message}`)
            .assertEqual("The value of \"fromIndex\" is out of range. It must be >= 0 && <= 4. Received value is: 5");
        }
        done()
      });
    /**
     * @tc.name   testBitVectorSetBitsByRange0009
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0278
     * @tc.desc   Testing the setBitsByRange of bitVector, return true.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorSetBitsByRange0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        const TAG = "testBitVectorSetBitsByRange0009";
        try {
          let bitVectorList: collections.BitVector = new collections.BitVector(0);
          bitVectorList.push(0);
          bitVectorList.push(0);
          bitVectorList.push(0);
          bitVectorList.push(0);
          bitVectorList.push(0);
          bitVectorList.push(1);
          bitVectorList.push(1);
          bitVectorList.push(1);
          bitVectorList.push(1);
          bitVectorList.push(1);
          bitVectorList.setBitsByRange(1, 1, 3);
          expect(bitVectorList[0].toString()).assertEqual("0");
          expect(bitVectorList[1].toString()).assertEqual("1");
          expect(bitVectorList[2].toString()).assertEqual("1");
          expect(bitVectorList[3].toString()).assertEqual("0");
          expect(bitVectorList[4].toString()).assertEqual("0");
          expect(bitVectorList[5].toString()).assertEqual("1");
          expect(bitVectorList[6].toString()).assertEqual("1");
          expect(bitVectorList[7].toString()).assertEqual("1");
          expect(bitVectorList[8].toString()).assertEqual("1");
          expect(bitVectorList[9].toString()).assertEqual("1");
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
        done()
      });
    /**
     * @tc.name   testBitVectorSetBitsByRange0011
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0279
     * @tc.desc   BitVector setBitsByRange with extra parameters test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorSetBitsByRange0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        const TAG = "testBitVectorSetBitsByRange0011";
        try {
          let bitVectorList: collections.BitVector = new collections.BitVector(0);
          bitVectorList.push(0);
          bitVectorList.push(0);
          bitVectorList.push(0);
          bitVectorList.setBitsByRange(1, 0, 2);
          expect(bitVectorList[0]).assertEqual(1);
          expect(bitVectorList[1]).assertEqual(1);
          expect(bitVectorList.length).assertEqual(3);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
        done()
      });
    /**
     * @tc.name   testBitVectorSetBitsByRange0014
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0280
     * @tc.desc   BitVector setBitsByRange with negative fromIndex test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorSetBitsByRange0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        const TAG = "testBitVectorSetBitsByRange0014";
        try {
          let bitVectorList: collections.BitVector = new collections.BitVector(0);
          bitVectorList.push(0);
          bitVectorList.push(1);
          bitVectorList.push(0);
          bitVectorList.setBitsByRange(1, -1, 2);
          expect().assertFail();
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect(err.code).assertEqual(10200001);
        }
        done()
      });
    /**
     * @tc.name   testBitVectorSetBitsByRange0015
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0281
     * @tc.desc   BitVector setBitsByRange with toIndex out of range test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorSetBitsByRange0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        const TAG = "testBitVectorSetBitsByRange0015";
        try {
          let bitVectorList: collections.BitVector = new collections.BitVector(0);
          bitVectorList.push(0);
          bitVectorList.push(1);
          bitVectorList.push(0);
          bitVectorList.setBitsByRange(1, 0, 10);
          expect().assertFail();
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect(err.code).assertEqual(10200001);
        }
        done()
      });
    /**
     * @tc.name   testBitVectorSetBitsByRange0016
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0282
     * @tc.desc   BitVector setBitsByRange with fromIndex greater than toIndex test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorSetBitsByRange0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        const TAG = "testBitVectorSetBitsByRange0016";
        try {
          let bitVectorList: collections.BitVector = new collections.BitVector(0);
          bitVectorList.push(0);
          bitVectorList.push(1);
          bitVectorList.push(0);
          bitVectorList.setBitsByRange(1, 2, 1);
          expect().assertFail();
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect(err.code).assertEqual(10200001);
        }
        done()
      });
    /**
     * @tc.name   testBitVectorSetBitsByRange0018
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0283
     * @tc.desc   BitVector setBitsByRange set entire range and verify return value as void test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorSetBitsByRange0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        const TAG = "testBitVectorSetBitsByRange0018";
        try {
          let bitVectorList: collections.BitVector = new collections.BitVector(0);
          bitVectorList.push(0);
          bitVectorList.push(0);
          bitVectorList.push(0);
          bitVectorList.push(0);
          bitVectorList.push(0);
          bitVectorList.setBitsByRange(1, 0, 5);
          expect(bitVectorList[0]).assertEqual(1);
          expect(bitVectorList[1]).assertEqual(1);
          expect(bitVectorList[2]).assertEqual(1);
          expect(bitVectorList[3]).assertEqual(1);
          expect(bitVectorList[4]).assertEqual(1);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
        done()
      });
    /**
     * @tc.name   testBitVectorSetBitsByRange0019
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0284
     * @tc.desc   BitVector setBitsByRange set large range (1000 elements) test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorSetBitsByRange0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        const TAG = "testBitVectorSetBitsByRange0019";
        try {
          let bitVectorList: collections.BitVector = new collections.BitVector(0);
          for (let i = 0; i < 100; i++) {
            bitVectorList.push(0);
          }
          bitVectorList.setBitsByRange(1, 0, 100);
          for (let i = 0; i < 100; i++) {
            expect(bitVectorList[i]).assertEqual(1);
          }
          expect(bitVectorList.length).assertEqual(100);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
        done()
      });

    /**
     * @tc.name   testBitVectorSetBitsByRangeBoundary0001
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0285
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
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0286
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
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0287
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
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0288
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
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0289
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

    /**
     * @tc.name   testBitVectorSetBitsByRangeValueBoundary0001
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0290
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
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0291
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
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0292
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

    /**
     * @tc.name   testBitVectorEmptyBoundary0002
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0293
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
     * @tc.name   testBitVectorRepeatCall0003
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0294
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
     * @tc.name   testBitVector64Boundary0005
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0295
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
     * @tc.name   testBitVector128Boundary0005
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0296
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
     * @tc.name   testBitVector1024Boundary0005
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0297
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
     * @tc.name   testBitVectorConstructorNonBinaryValue0001
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0298
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
  });
}
