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

export default function BitVectorHasTest() {
  describe('BitVectorHasTest', () => {
    beforeAll(() => {})
    beforeEach(() => {})
    afterEach(() => {})
    afterAll(() => {})

    /**
     * @tc.name   BitVector_has_Func_001
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0151
     * @tc.desc   Check if bit vector contains a particular bit element
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("BitVector_has_Func_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        let bitVector = new collections.BitVector(0);
        bitVector.push(0);
        bitVector.push(0);
        bitVector.push(0);
        bitVector.push(1);
        bitVector.push(1);
        bitVector.push(1);
        let res0 = bitVector.has(1, 3, 6);
        expect(res0).assertEqual(true);
        let res1 = bitVector.has(1, 0, 2);
        expect(res1).assertEqual(false);
        let res2 = bitVector.has(0, 3, 5);
        expect(res2).assertEqual(false);
        let res3 = bitVector.has(0, 0, 3);
        expect(res3).assertEqual(true);
    });

    /**
     * @tc.name   BitVector_has_Func_002
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0152
     * @tc.desc   Check if bit vector contains a particular bit element.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("BitVector_has_Func_002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
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
          let res = bitVector.has(0, 8, -3);
          expect(true).assertEqual(false);
        } catch (err) {
          expect(err.name).assertEqual(`BusinessError`);
          expect(err.code).assertEqual(10200001);
          expect(err.message)
            .assertEqual(`The value of "toIndex" is out of range. It must be >= 0 && <= 8. Received value is: -3`);
        }
    });

    /**
     * @tc.name   BitVector_has_Func_003
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0153
     * @tc.desc   Check if bit vector contains a particular bit element.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("BitVector_has_Func_003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
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
          let res = bitVector.has(0, 0.1, 6.1);
          expect(true).assertEqual(false);
        } catch (err) {
          expect(err.name).assertEqual(`BusinessError`);
          expect(err.code).assertEqual(401);
          expect(err.message).assertEqual(`The type of "fromIndex" must be integer. Received value is: 0.1`);
        }
    });

    /**
     * @tc.name   BitVector_has_Func_004
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0154
     * @tc.desc   Check if bit vector contains a particular bit element.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("BitVector_has_Func_004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
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
          let res = bitVector.has(0, -3, -3);
          expect(true).assertEqual(false);
        } catch (err) {
          expect(err.name).assertEqual(`BusinessError`);
          expect(err.code).assertEqual(10200001);
          expect(err.message)
            .assertEqual(`The value of "toIndex" is out of range. It must be >= 0 && <= 8. Received value is: -3`);
        }
    });

    /**
     * @tc.name   BitVector_has_Func_005
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0155
     * @tc.desc   Check if bit vector contains a particular bit element.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("BitVector_has_Func_005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
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
          let res = bitVector.has(0, -3, 8);
          expect(true).assertEqual(false);
        } catch (err) {
          expect(err.name).assertEqual(`BusinessError`);
          expect(err.code).assertEqual(10200001);
          expect(err.message)
            .assertEqual(`The value of "fromIndex" is out of range. It must be >= 0 && <= 7. Received value is: -3`);
        }
    });

    /**
     * @tc.name   BitVector_has_Func_006
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0156
     * @tc.desc   Check if bit vector contains a particular bit element.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("BitVector_has_Func_006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
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
        let res0 = bitVector.has(1, 0, 31);
        expect(res0).assertEqual(false);
        let res1 = bitVector.has(1, 32, 64);
        expect(res1).assertEqual(true);
        let res2 = bitVector.has(0, 0, 32);
        expect(res2).assertEqual(true);
        let res3 = bitVector.has(0, 32, 63);
        expect(res3).assertEqual(false);
    });

    /**
     * @tc.name   BitVector_has_Func_007
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0157
     * @tc.desc   Check if bit vector contains a particular bit element.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("BitVector_has_Func_007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
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
        let res0 = bitVector.has(1, 10, 41);
        expect(res0).assertEqual(false);
        let res1 = bitVector.has(1, 42, bitVectorLength + 10);
        expect(res1).assertEqual(true);
        let res2 = bitVector.has(0, 10, 42);
        expect(res2).assertEqual(true);
        let res3 = bitVector.has(0, 42, (bitVectorLength + 10) - 1);
        expect(res3).assertEqual(false);
    });

    /**
     * @tc.name   BitVector_has_Func_008
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0158
     * @tc.desc   Check if bit vector contains a particular bit element.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("BitVector_has_Func_008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        let bitVector = new collections.BitVector(0);
        let bitVectorLength = 20;
        for (let i = 0; i < bitVectorLength; i++) {
          if (i >= 10) {
            let res0 = bitVector.push(1);
            expect(res0).assertEqual(true);
          } else {
            let res0 = bitVector.push(0);
            expect(res0).assertEqual(true);
          }
        }
        expect(bitVector.length).assertEqual(20);
        let res0 = bitVector.has(1, 0, 10);
        expect(res0).assertEqual(true);
        let res1 = bitVector.has(1, 0, 9);
        expect(res1).assertEqual(false);
        let res2 = bitVector.has(0, 10, 19);
        expect(res2).assertEqual(false);
        let res3 = bitVector.has(0, 0, 19);
        expect(res3).assertEqual(true);
    });

    /**
     * @tc.name   BitVector_has_Func_009
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0159
     * @tc.desc   Check the situation where element is set to non-0 and non-1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("BitVector_has_Func_009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        let bitVector = new collections.BitVector(0);
        bitVector.push(0);
        bitVector.push(0);
        bitVector.push(0);
        bitVector.push(1);
        bitVector.push(1);
        bitVector.push(1);
        expect(bitVector.length).assertEqual(6);
        let res0 = bitVector.has(0, 0, 2);
        expect(res0).assertEqual(true);
        let res1 = bitVector.has(1, 0, 2);
        expect(res1).assertEqual(false);
        let res2 = bitVector.has(0, 3, 5);
        expect(res2).assertEqual(false);
        let res3 = bitVector.has(1, 3, 5);
        expect(res3).assertEqual(true);
        let res4 = bitVector.has(-3, 3, 5);
        expect(res4).assertEqual(true);
        let res5 = bitVector.has(7, 3, 5);
        expect(res5).assertEqual(true);
        let res6 = bitVector.has(NaN, 3, 5);
        expect(res6).assertEqual(true);
    });

    /**
     * @tc.name   BitVectorTest1900
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0160
     * @tc.desc   Verify BitVector has searches for 0 and non-zero element values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BitVectorTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
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
     * @tc.name   BitVectorTest2000
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0161
     * @tc.desc   Verify BitVector has with different index ranges returns correct results
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BitVectorTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
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
     * @tc.name   BitVectorTest2100
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0162
     * @tc.desc   Verify BitVector has with boundary index values at start and end
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BitVectorTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let bv = new collections.BitVector(16)
      bv[0] = 1
      bv[15] = 1
      let result1 = bv.has(1, 0, 1)
      expect(result1).assertTrue()
      let result2 = bv.has(1, 14, 15)
      expect(result2).assertTrue()
    })

    /**
     * @tc.name   BitVectorTest2200
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0163
     * @tc.desc   Verify BitVector has with fromIndex negative throws error 10200001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BitVectorTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let bv = new collections.BitVector(16)
      try {
        bv.has(1, -1, 15)
        expect().assertFail()
      } catch (e) {
        expect(e.code).assertEqual(10200001)
      }
    })

    /**
     * @tc.name   BitVectorTest2300
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0164
     * @tc.desc   Verify BitVector has with toIndex exceeding length throws error 10200001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BitVectorTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let bv = new collections.BitVector(16)
      try {
        bv.has(1, 0, 17)
        expect().assertFail()
      } catch (e) {
        expect(e.code).assertEqual(10200001)
      }
    })

    /**
     * @tc.name   BitVectorTest2400
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0165
     * @tc.desc   Verify BitVector has with fromIndex equal to toIndex throws error 10200001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BitVectorTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let bv = new collections.BitVector(16)
      try {
        bv.has(1, 8, 8)
        expect().assertFail()
      } catch (e) {
        expect(e.code).assertEqual(10200001)
      }
    })

    /**
     * @tc.name   BitVectorTest2500
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0166
     * @tc.desc   Verify BitVector has returns correct results for multiple value and range combinations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BitVectorTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
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
     * @tc.name   BitVectorTest2600
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0167
     * @tc.desc   Verify BitVector has throws error for fromIndex greater than toIndex
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BitVectorTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let bv = new collections.BitVector(16)
      try {
        bv.has(1, 10, 5)
        expect().assertFail()
      } catch (e) {
        expect(e.code).assertEqual(10200001)
      }
    })

    /**
     * @tc.name   BitVectortest0600
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0168
     * @tc.desc   BitVector has 10200001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BitVectortest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'BitVectortest0600';
        let flag: boolean = false;
        console.info(`${caseName} test start`);

        try {
          let bitVector: collections.BitVector = new collections.BitVector(0);
          bitVector.push(0);
          bitVector.push(1);
          bitVector.push(0);
          bitVector.push(1);
          bitVector.push(0);
          let res0: boolean = bitVector.has(0, -1, 2);
          console.info("bitVector has 0:", res0);
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
     * @tc.name   BitVectortest0700
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0169
     * @tc.desc   BitVector has 10200011
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BitVectortest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'BitVectortest0700';
        let flag: boolean = false;
        console.info(`${caseName} test start`);
        try {
          let bitVector: collections.BitVector = new collections.BitVector(0);
          bitVector.push(0);
          bitVector.push(1);
          bitVector.push(0);
          bitVector.push(1);
          bitVector.push(0);
          let hasMethod = bitVector.has;
          hasMethod(0, 0, 2);
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
     * @tc.name   BitVectortest0900
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0170
     * @tc.desc   BitVector has 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BitVectortest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'BitVectortest0900';
        let flag: boolean = false;
        console.info(`${caseName} test start`);
        try {
          let bitVector: collections.BitVector = new collections.BitVector(0);
          bitVector.push(0);
          bitVector.push(1);
          bitVector.push(0);
          bitVector.push(1);
          bitVector.push(0);
          bitVector.has(0, 1.5, 3.5);
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
     * @tc.name   testBitVectorHas0001
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0171
     * @tc.desc   Testing the has of bitVector, element=0 fromIndex=0 toIndex=10, return true.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorHas0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorHas0001";
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
        let rst = bitVectorList.has(0, 0, 10);
        expect(rst).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testBitVectorHas0002
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0172
     * @tc.desc   Testing the has of bitVector, element=0 fromIndex=0 toIndex=5, return true.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorHas0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorHas0002";
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
        let rst = bitVectorList.has(0, 0, 5);
        expect(rst).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testBitVectorHas0003
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0173
     * @tc.desc   Testing the has of bitVector, element=1 fromIndex=0 toIndex=5, return false.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorHas0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorHas0003";
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
        let rst = bitVectorList.has(1, 0, 4);
        expect(rst).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testBitVectorHas0004
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0174
     * @tc.desc   Testing the has of bitVector, element=1 fromIndex=0 toIndex=10, return true.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorHas0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorHas0004";
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
        let rst = bitVectorList.has(1, 0, 10);
        expect(rst).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testBitVectorHas0005
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0175
     * @tc.desc   Testing the has of bitVector, element=1 fromIndex=-1 toIndex=10, return error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorHas0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorHas0005";
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
     * @tc.name   testBitVectorHas0006
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0176
     * @tc.desc   Testing the has of bitVector, element=1 fromIndex=0 toIndex=11, return error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorHas0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorHas0006";
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
     * @tc.name   testBitVectorHas0007
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0177
     * @tc.desc   Testing the has of bitVector, element=1 fromIndex=5 toIndex=4, return error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorHas0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorHas0007";
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
     * @tc.name   testBitVectorHas0008
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0178
     * @tc.desc   Testing the has of bitVector, element=1 fromIndex=5 toIndex=5, return error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorHas0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorHas0008";
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
     * @tc.name   testBitVectorHas0010
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0179
     * @tc.desc   BitVector has with single parameter test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorHas0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorHas0010";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        bitVectorList.push(0);
        bitVectorList.push(1);
        bitVectorList.push(0);
        let rst = bitVectorList.has(1, 0, 3);
        expect(rst).assertEqual(true);
        expect(typeof rst).assertEqual("boolean");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testBitVectorHas0011
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0180
     * @tc.desc   BitVector has with two parameters test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorHas0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorHas0011";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        bitVectorList.push(0);
        bitVectorList.push(1);
        bitVectorList.push(0);
        bitVectorList.push(1);
        let rst = bitVectorList.has(1, 1, 4);
        expect(rst).assertEqual(true);
        expect(typeof rst).assertEqual("boolean");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testBitVectorHas0012
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0181
     * @tc.desc   BitVector has with extra parameters test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorHas0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorHas0012";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        bitVectorList.push(0);
        bitVectorList.push(1);
        bitVectorList.push(0);
        let rst = bitVectorList.has(1, 0, 3);
        expect(rst).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testBitVectorHas0018
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0182
     * @tc.desc   BitVector has with fromIndex=NaN test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorHas0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorHas0018";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(5);
        bitVectorList.has(0, NaN, 5);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.code).assertEqual(401);
      }
      done()
    });

    /**
     * @tc.name   testBitVectorHas0019
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0183
     * @tc.desc   BitVector has with fromIndex=float number test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorHas0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorHas0019";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(5);
        let rst = bitVectorList.has(0, 1.5, 5);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.code).assertEqual(401);
      }
      done()
    });

    /**
     * @tc.name   testBitVectorHas0020
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0184
     * @tc.desc   BitVector has on empty BitVector test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorHas0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorHas0020";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        let rst = bitVectorList.has(0, 0, 0);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.code).assertEqual(10200001);
      }
      done()
    });

    /**
     * @tc.name   testBitVectorHas0021
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0185
     * @tc.desc   BitVector has return value type verification test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorHas0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorHas0021";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        bitVectorList.push(0);
        bitVectorList.push(1);
        bitVectorList.push(0);
        let rst1 = bitVectorList.has(0, 0, 3);
        expect(typeof rst1).assertEqual("boolean");
        expect(rst1).assertEqual(true);
        let rst2 = bitVectorList.has(1, 0, 1);
        expect(typeof rst2).assertEqual("boolean");
        expect(rst2).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testBitVectorHas0022
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0186
     * @tc.desc   BitVector has with element=positive number test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorHas0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorHas0022";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        bitVectorList.push(0);
        bitVectorList.push(1);
        bitVectorList.push(0);
        let rst = bitVectorList.has(2, 0, 3);
        expect(rst).assertEqual(true);
        expect(typeof rst).assertEqual("boolean");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testBitVectorHas0023
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0187
     * @tc.desc   BitVector has with element=negative number test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorHas0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorHas0023";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        bitVectorList.push(0);
        bitVectorList.push(1);
        bitVectorList.push(0);
        let rst = bitVectorList.has(-1, 0, 3);
        expect(rst).assertEqual(true);
        expect(typeof rst).assertEqual("boolean");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testBitVectorHasBoundary0001
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0188
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
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0189
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
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0190
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
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0191
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
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0192
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
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0193
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
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0194
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
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0195
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
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0196
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

    /**
     * @tc.name   testBitVectorHasPatternBoundary0001
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0197
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
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0198
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
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0199
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
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0200
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
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0201
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

    /**
     * @tc.name   testBitVectorEmptyBoundary0001
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0202
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
     * @tc.name   testBitVector64Boundary0009
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0203
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

  })
}
