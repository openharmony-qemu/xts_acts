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

export default function BitVectorGetBitCountByRangeTest() {
  describe('BitVectorGetBitCountByRangeTest', () => {
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
     * @tc.name   BitVector_getBitCountByRange_Func_001
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0501
     * @tc.desc   Counts the number of times a certain bit element occurs within a range of bits in a bit vector.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("BitVector_getBitCountByRange_Func_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        let bitVector = new collections.BitVector(0);
        bitVector.push(0);
        bitVector.push(1);
        bitVector.push(0);
        bitVector.push(1);
        bitVector.push(0);
        let res1 = bitVector.getBitCountByRange(0, 0, 5);
        expect(res1).assertEqual(3);
        let res2 = bitVector.getBitCountByRange(1, 0, 5);
        expect(res2).assertEqual(2);
    });
    /**
     * @tc.name   BitVector_getBitCountByRange_Func_002
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0502
     * @tc.desc   Counts the number of times a certain bit element occurs within a range of bits in a bit vector.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("BitVector_getBitCountByRange_Func_002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
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
          let res = bitVector.getBitCountByRange(0, 8, -3);
          expect(true).assertEqual(false);
        } catch (err) {
          expect(err.name).assertEqual("BusinessError");
          expect(err.code).assertEqual(10200001);
          expect(err.message)
            .assertEqual(`The value of "toIndex" is out of range. It must be >= 0 && <= 8. Received value is: -3`);
        }
    });
    /**
     * @tc.name   BitVector_getBitCountByRange_Func_003
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0503
     * @tc.desc   Counts the number of times a certain bit element occurs within a range of bits in a bit vector.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("BitVector_getBitCountByRange_Func_003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
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
          let res = bitVector.getBitCountByRange(0, 0.1, 6.1);
          expect(true).assertEqual(false);
        } catch (err) {
          expect(err.name).assertEqual(`BusinessError`);
          expect(err.code).assertEqual(401);
          expect(err.message).assertEqual(`The type of "fromIndex" must be integer. Received value is: 0.1`);
        }
    });
    /**
     * @tc.name   BitVector_getBitCountByRange_Func_004
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0504
     * @tc.desc   Counts the number of times a certain bit element occurs within a range of bits in a bit vector.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("BitVector_getBitCountByRange_Func_004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
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
          let res = bitVector.getBitCountByRange(0, -3, -3);
          expect(true).assertEqual(false);
        } catch (err) {
          expect(err.name).assertEqual("BusinessError");
          expect(err.code).assertEqual(10200001);
          expect(err.message)
            .assertEqual(`The value of "toIndex" is out of range. It must be >= 0 && <= 8. Received value is: -3`);
        }
    });
    /**
     * @tc.name   BitVector_getBitCountByRange_Func_005
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0505
     * @tc.desc   Counts the number of times a certain bit element occurs within a range of bits in a bit vector.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("BitVector_getBitCountByRange_Func_005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
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
          let res = bitVector.getBitCountByRange(0, -3, 8);
          expect(true).assertEqual(false);
        } catch (err) {
          expect(err.name).assertEqual("BusinessError");
          expect(err.code).assertEqual(10200001);
          expect(err.message)
            .assertEqual(`The value of "fromIndex" is out of range. It must be >= 0 && <= 7. Received value is: -3`);
        }
    });
    /**
     * @tc.name   BitVector_getBitCountByRange_Func_006
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0506
     * @tc.desc   Counts the number of times a certain bit element occurs within a range of bits in a bit vector.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("BitVector_getBitCountByRange_Func_006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
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
        let res1 = bitVector.getBitCountByRange(0, 0, 64);
        expect(res1).assertEqual(32);
        let res2 = bitVector.getBitCountByRange(1, 0, 64);
        expect(res2).assertEqual(32);
    });
    /**
     * @tc.name   BitVector_getBitCountByRange_Func_007
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0507
     * @tc.desc   Counts the number of times a certain bit element occurs within a range of bits in a bit vector.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("BitVector_getBitCountByRange_Func_007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
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
        let res1 = bitVector.getBitCountByRange(0, 10, bitVectorLength + 10);
        expect(res1).assertEqual(32);
        let res2 = bitVector.getBitCountByRange(1, 10, bitVectorLength + 10);
        expect(res2).assertEqual(32);
    });
    /**
     * @tc.name   BitVector_getBitCountByRange_Func_008
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0508
     * @tc.desc   Counts the number of times a certain bit element occurs within a range of bits in a bit vector.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("BitVector_getBitCountByRange_Func_008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        let bitVector: collections.BitVector = new collections.BitVector(0);
        bitVector.push(0);
        bitVector.push(1);
        bitVector.push(0);
        bitVector.push(1);
        bitVector.push(0);
        let bitVectorLength:number = 5;
        expect(bitVector.length).assertEqual(bitVectorLength);
        try {
          let tmp:string = "test";
          let a:number = JSON.parse(JSON.stringify(tmp)) as number;
          let res: number = bitVector.getBitCountByRange(1, 1, a);
          expect(true).assertEqual(false);
        } catch (err) {
          expect(err.name).assertEqual(`BusinessError`);
          expect(err.code).assertEqual(401);
          expect(err.message)
            .assertEqual(`The type of "toIndex" must be integer. Received value is: test`);
        }
    });

    /**
     * @tc.name   BitVectorTest4800
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0509
     * @tc.desc   Verify BitVector getBitCountByRange counts bit value 1 in range
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BitVectorTest4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let bv = new collections.BitVector(16)
      bv[5] = 1
      bv[10] = 1
      bv[15] = 1
      let count = bv.getBitCountByRange(1, 0, 16)
      expect(count).assertEqual(3)
    })

    /**
     * @tc.name   BitVectorTest4900
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0510
     * @tc.desc   Verify BitVector getBitCountByRange counts bit value 0 and non-zero
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BitVectorTest4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
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
     * @tc.name   BitVectorTest5000
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0511
     * @tc.desc   Verify BitVector getBitCountByRange with different sub ranges
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BitVectorTest5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
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
     * @tc.name   BitVectorTest5100
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0512
     * @tc.desc   Verify BitVector getBitCountByRange returns number type with full range
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BitVectorTest5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let bv = new collections.BitVector(16)
      bv.setAllBits(1)
      let count = bv.getBitCountByRange(1, 0, 16)
      expect(typeof count).assertEqual("number")
      expect(count).assertEqual(16)
    })

    /**
     * @tc.name   BitVectortest02400
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0513
     * @tc.desc   BitVector getBitCountByRange 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BitVectortest02400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'BitVectortest02400';
        let flag: boolean = false;
        console.info(`${caseName} test start`);
        try {
          let bitVector: collections.BitVector = new collections.BitVector(0);
          bitVector.push(0);
          bitVector.push(1);
          bitVector.push(0);
          bitVector.push(1);
          bitVector.push(0);
          let res: number = bitVector.getBitCountByRange(1, 1, NaN);
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
     * @tc.name   BitVectortest02500
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0514
     * @tc.desc   BitVector getBitCountByRange 10200001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BitVectortest02500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'BitVectortest02500';
        let flag: boolean = false;
        console.info(`${caseName} test start`);
        try {
          let bitVector: collections.BitVector = new collections.BitVector(0);
          bitVector.push(0);
          bitVector.push(1);
          bitVector.push(0);
          bitVector.push(1);
          bitVector.push(0);
          let res: number = bitVector.getBitCountByRange(1, -1, 4);
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
     * @tc.name   BitVectortest02600
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0515
     * @tc.desc   BitVector getBitCountByRange 10200011
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BitVectortest02600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'BitVectortest02600';
        let flag: boolean = false;
        console.info(`${caseName} test start`);
        try {
          let bitVector: collections.BitVector = new collections.BitVector(0);
          bitVector.push(0);
          bitVector.push(1);
          bitVector.push(0);
          bitVector.push(1);
          bitVector.push(0);
          let getBitCountByRangeMethod = bitVector.getBitCountByRange;
          getBitCountByRangeMethod(1, -1, 4)
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
     * @tc.name   testBitVectorGetBitCountByRange0001
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0516
     * @tc.desc   Testing the getBitCountByRange of bitVector, range is 0~6, return 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorGetBitCountByRange0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        const TAG = "testBitVectorGetBitCountByRange0001";
        try {
          let bitVectorList: collections.BitVector = new collections.BitVector(0);
          for (let i = 0; i < 10; i++) {
            if (i < 5) {
              bitVectorList.push(0);
            } else {
              bitVectorList.push(1);
            }
          }
          let num = bitVectorList.getBitCountByRange(1, 0, 6);
          expect(num).assertEqual(1);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
        done()
      });
    /**
     * @tc.name   testBitVectorGetBitCountByRange0002
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0517
     * @tc.desc   Testing the getBitCountByRange of bitVector, range is 4~10, return 5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorGetBitCountByRange0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        const TAG = "testBitVectorGetBitCountByRange0002";
        try {
          let bitVectorList: collections.BitVector = new collections.BitVector(0);
          for (let i = 0; i < 10; i++) {
            if (i < 5) {
              bitVectorList.push(0);
            } else {
              bitVectorList.push(1);
            }
          }
          let num = bitVectorList.getBitCountByRange(1, 4, 10);
          expect(num).assertEqual(5);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
        done()
      });
    /**
     * @tc.name   testBitVectorGetBitCountByRange0003
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0518
     * @tc.desc   Testing the getBitCountByRange of bitVector, range is 4~11, return error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorGetBitCountByRange0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        const TAG = "testBitVectorGetBitCountByRange0003";
        try {
          let bitVectorList: collections.BitVector = new collections.BitVector(0);
          for (let i = 0; i < 10; i++) {
            if (i < 5) {
              bitVectorList.push(0);
            } else {
              bitVectorList.push(1);
            }
          }
          let num = bitVectorList.getBitCountByRange(1, 4, 11);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect(`${err.message}`)
            .assertEqual("The value of \"toIndex\" is out of range. It must be >= 0 && <= 10. Received value is: 11");
        }
        done()
      });
    /**
     * @tc.name   testBitVectorGetBitCountByRange0004
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0519
     * @tc.desc   Testing the getBitCountByRange of bitVector, range is -1~10, return error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorGetBitCountByRange0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        const TAG = "testBitVectorGetBitCountByRange0004";
        try {
          let bitVectorList: collections.BitVector = new collections.BitVector(0);
          for (let i = 0; i < 10; i++) {
            if (i < 5) {
              bitVectorList.push(0);
            } else {
              bitVectorList.push(1);
            }
          }
          let num = bitVectorList.getBitCountByRange(1, -1, 10);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect(`${err.message}`)
            .assertEqual("The value of \"fromIndex\" is out of range. It must be >= 0 && <= 9. Received value is: -1");
        }
        done()
      });
    /**
     * @tc.name   testBitVectorGetBitCountByRange0005
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0520
     * @tc.desc   Testing the getBitCountByRange of bitVector, range is 5~4, return error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorGetBitCountByRange0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        const TAG = "testBitVectorGetBitCountByRange0005";
        try {
          let bitVectorList: collections.BitVector = new collections.BitVector(0);
          for (let i = 0; i < 10; i++) {
            if (i < 5) {
              bitVectorList.push(0);
            } else {
              bitVectorList.push(1);
            }
          }
          let num = bitVectorList.getBitCountByRange(1, 5, 4);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect(`${err.message}`)
            .assertEqual("The value of \"fromIndex\" is out of range. It must be >= 0 && <= 3. Received value is: 5");
        }
        done()
      });
    /**
     * @tc.name   testBitVectorGetBitCountByRange0006
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0521
     * @tc.desc   Testing the getBitCountByRange of bitVector, range is 5~5, return error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorGetBitCountByRange0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        const TAG = "testBitVectorGetBitCountByRange0006";
        try {
          let bitVectorList: collections.BitVector = new collections.BitVector(0);
          for (let i = 0; i < 10; i++) {
            if (i < 5) {
              bitVectorList.push(0);
            } else {
              bitVectorList.push(1);
            }
          }
          let num = bitVectorList.getBitCountByRange(1, 5, 5);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect(`${err.message}`)
            .assertEqual("The value of \"fromIndex\" is out of range. It must be >= 0 && <= 4. Received value is: 5");
        }
        done()
      });
    /**
     * @tc.name   testBitVectorGetBitCountByRange0007
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0522
     * @tc.desc   BitVector getBitCountByRange element non-zero value test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorGetBitCountByRange0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        const TAG = "testBitVectorGetBitCountByRange0007";
        try {
          let bitVectorList: collections.BitVector = new collections.BitVector(0);
          for (let i = 0; i < 10; i++) {
            if (i < 5) {
              bitVectorList.push(0);
            } else {
              bitVectorList.push(1);
            }
          }
          let num = bitVectorList.getBitCountByRange(2, 0, 10);
          expect(num).assertEqual(5);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
        done()
      });
    /**
     * @tc.name   testBitVectorGetBitCountByRange0008
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0523
     * @tc.desc   BitVector getBitCountByRange element negative value test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorGetBitCountByRange0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        const TAG = "testBitVectorGetBitCountByRange0008";
        try {
          let bitVectorList: collections.BitVector = new collections.BitVector(0);
          for (let i = 0; i < 10; i++) {
            if (i < 5) {
              bitVectorList.push(0);
            } else {
              bitVectorList.push(1);
            }
          }
          let num = bitVectorList.getBitCountByRange(-1, 0, 10);
          expect(num).assertEqual(5);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
        done()
      });
    /**
     * @tc.name   testBitVectorGetBitCountByRange0010
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0524
     * @tc.desc   BitVector getBitCountByRange fromIndex NaN error code 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorGetBitCountByRange0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        const TAG = "testBitVectorGetBitCountByRange0010";
        try {
          let bitVectorList: collections.BitVector = new collections.BitVector(0);
          for (let i = 0; i < 10; i++) {
            if (i < 5) {
              bitVectorList.push(0);
            } else {
              bitVectorList.push(1);
            }
          }
          bitVectorList.getBitCountByRange(1, NaN, 10);
          expect().assertFail();
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect(err.code).assertEqual(401);
        }
        done()
      });
    /**
     * @tc.name   testBitVectorGetBitCountByRange0011
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0525
     * @tc.desc   BitVector getBitCountByRange toIndex NaN error code 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorGetBitCountByRange0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        const TAG = "testBitVectorGetBitCountByRange0011";
        try {
          let bitVectorList: collections.BitVector = new collections.BitVector(0);
          for (let i = 0; i < 10; i++) {
            if (i < 5) {
              bitVectorList.push(0);
            } else {
              bitVectorList.push(1);
            }
          }
          bitVectorList.getBitCountByRange(1, 0, NaN);
          expect().assertFail();
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect(err.code).assertEqual(401);
        }
        done()
      });
    /**
     * @tc.name   testBitVectorGetBitCountByRange0012
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0526
     * @tc.desc   BitVector getBitCountByRange all zeros return 0 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorGetBitCountByRange0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        const TAG = "testBitVectorGetBitCountByRange0012";
        try {
          let bitVectorList: collections.BitVector = new collections.BitVector(5);
          bitVectorList.push(0);
          bitVectorList.push(0);
          bitVectorList.push(0);
          bitVectorList.push(0);
          bitVectorList.push(0);
          let num = bitVectorList.getBitCountByRange(1, 0, 5);
          expect(num).assertEqual(0);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
        done()
      });
    /**
     * @tc.name   testBitVectorGetBitCountByRange0013
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0527
     * @tc.desc   BitVector getBitCountByRange all ones return 5 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorGetBitCountByRange0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        const TAG = "testBitVectorGetBitCountByRange0013";
        try {
          let bitVectorList: collections.BitVector = new collections.BitVector(0);
          bitVectorList.push(1);
          bitVectorList.push(1);
          bitVectorList.push(1);
          bitVectorList.push(1);
          bitVectorList.push(1);
          let num = bitVectorList.getBitCountByRange(1, 0, 5);
          expect(num).assertEqual(5);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
        done()
      });
    /**
     * @tc.name   testBitVectorGetBitCountByRange0014
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0528
     * @tc.desc   BitVector getBitCountByRange large BitVector test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorGetBitCountByRange0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        const TAG = "testBitVectorGetBitCountByRange0014";
        try {
          let bitVectorList: collections.BitVector = new collections.BitVector(0);
          for (let i = 0; i < 100; i++) {
            bitVectorList.push(i % 2);
          }
          let num = bitVectorList.getBitCountByRange(1, 0, 100);
          expect(num).assertEqual(50);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
        done()
      });
    /**
     * @tc.name   testBitVectorGetBitCountByRange0015
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0529
     * @tc.desc   BitVector getBitCountByRange single element BitVector test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorGetBitCountByRange0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        const TAG = "testBitVectorGetBitCountByRange0015";
        try {
          let bitVectorList: collections.BitVector = new collections.BitVector(0);
          bitVectorList.push(1);
          let num = bitVectorList.getBitCountByRange(1, 0, 1);
          expect(num).assertEqual(1);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
        done()
      });
    /**
     * @tc.name   testBitVectorGetBitCountByRange0017
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0530
     * @tc.desc   BitVector getBitCountByRange return type verification test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorGetBitCountByRange0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        const TAG = "testBitVectorGetBitCountByRange0017";
        try {
          let bitVectorList: collections.BitVector = new collections.BitVector(0);
          for (let i = 0; i < 10; i++) {
            if (i < 5) {
              bitVectorList.push(0);
            } else {
              bitVectorList.push(1);
            }
          }
          let num = bitVectorList.getBitCountByRange(1, 0, 10);
          expect(typeof num).assertEqual('number');
          expect(num >= 0).assertTrue();
          expect(num <= 10).assertTrue();
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
        done()
      });
    /**
     * @tc.name   testBitVectorGetBitCountByRange0018
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0531
     * @tc.desc   BitVector getBitCountByRange fromIndex Infinity error code 10200001 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorGetBitCountByRange0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        const TAG = "testBitVectorGetBitCountByRange0018";
        try {
          let bitVectorList: collections.BitVector = new collections.BitVector(0);
          for (let i = 0; i < 10; i++) {
            if (i < 5) {
              bitVectorList.push(0);
            } else {
              bitVectorList.push(1);
            }
          }
          bitVectorList.getBitCountByRange(1, Infinity, 10);
          expect().assertFail();
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect(err.code).assertEqual(401);
        }
        done()
      });
    /**
     * @tc.name   testBitVectorGetBitCountByRange0019
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0532
     * @tc.desc   BitVector getBitCountByRange toIndex Infinity error code 10200001 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorGetBitCountByRange0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        const TAG = "testBitVectorGetBitCountByRange0019";
        try {
          let bitVectorList: collections.BitVector = new collections.BitVector(0);
          for (let i = 0; i < 10; i++) {
            if (i < 5) {
              bitVectorList.push(0);
            } else {
              bitVectorList.push(1);
            }
          }
          bitVectorList.getBitCountByRange(1, 0, Infinity);
          expect().assertFail();
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect(err.code).assertEqual(401);
        }
        done()
      });
    /**
     * @tc.name   testBitVectorGetBitCountByRange0020
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0533
     * @tc.desc   BitVector getBitCountByRange alternating bits test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorGetBitCountByRange0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        const TAG = "testBitVectorGetBitCountByRange0020";
        try {
          let bitVectorList: collections.BitVector = new collections.BitVector(0);
          for (let i = 0; i < 10; i++) {
            bitVectorList.push(i % 2);
          }
          let num = bitVectorList.getBitCountByRange(1, 0, 10);
          expect(num).assertEqual(5);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
        done()
      });
    /**
     * @tc.name   testBitVectorGetBitCountByRange0027
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0534
     * @tc.desc   BitVector getBitCountByRange fromIndex length-1 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorGetBitCountByRange0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        const TAG = "testBitVectorGetBitCountByRange0027";
        try {
          let bitVectorList: collections.BitVector = new collections.BitVector(5);
          bitVectorList.push(0);
          bitVectorList.push(1);
          bitVectorList.push(0);
          bitVectorList.push(1);
          bitVectorList.push(0);
          let num = bitVectorList.getBitCountByRange(0, 4, 5);
          expect(num).assertEqual(1);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
        done()
      });
    /**
     * @tc.name   testBitVectorGetBitCountByRange0028
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0535
     * @tc.desc   BitVector getBitCountByRange toIndex fromIndex+1 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorGetBitCountByRange0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        const TAG = "testBitVectorGetBitCountByRange0028";
        try {
          let bitVectorList: collections.BitVector = new collections.BitVector(0);
          bitVectorList.push(0);
          bitVectorList.push(1);
          bitVectorList.push(0);
          bitVectorList.push(1);
          bitVectorList.push(0);
          let num = bitVectorList.getBitCountByRange(1, 1, 2);
          expect(num).assertEqual(1);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
        done()
      });
    /**
     * @tc.name   testBitVectorGetBitCountByRange0029
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0536
     * @tc.desc   BitVector getBitCountByRange toIndex fromIndex+2 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorGetBitCountByRange0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        const TAG = "testBitVectorGetBitCountByRange0029";
        try {
          let bitVectorList: collections.BitVector = new collections.BitVector(0);
          bitVectorList.push(0);
          bitVectorList.push(1);
          bitVectorList.push(0);
          bitVectorList.push(1);
          bitVectorList.push(0);
          let num = bitVectorList.getBitCountByRange(1, 1, 3);
          expect(num).assertEqual(1);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
        done()
      });
    /**
     * @tc.name   testBitVectorGetBitCountByRange0030
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0537
     * @tc.desc   BitVector getBitCountByRange single element match return 1 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorGetBitCountByRange0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        const TAG = "testBitVectorGetBitCountByRange0030";
        try {
          let bitVectorList: collections.BitVector = new collections.BitVector(0);
          bitVectorList.push(1);
          bitVectorList.push(1);
          bitVectorList.push(0);
          bitVectorList.push(1);
          bitVectorList.push(1);
          let num = bitVectorList.getBitCountByRange(0, 0, 5);
          expect(num).assertEqual(1);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
        done()
      });

    /**
     * @tc.name   testBitVectorGetBitCountByRangeBoundary0001
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0538
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
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0539
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
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0540
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
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0541
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
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0542
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

    /**
     * @tc.name   testBitVectorGetBitCountByRangePatternBoundary0001
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0543
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
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0544
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
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0545
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
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0546
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
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0547
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
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0548
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
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0549
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

    /**
     * @tc.name   testBitVectorEmptyBoundary0004
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0550
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
     * @tc.name   testBitVectorContainerSizeBoundary0002
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0551
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
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0552
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
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0553
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

    /**
     * @tc.name   testBitVector64Boundary0008
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0554
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
     * @tc.name   testBitVector128Boundary0008
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0555
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
     * @tc.name   testBitVector1024Boundary0006
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0556
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

  });
}
