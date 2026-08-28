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
import taskpool from '@ohos.taskpool';
import { BusinessError } from '@kit.BasicServicesKit';

@Concurrent
function testFlipBitsByRange(index: number, bit: collections.BitVector) {
  let tag = 'testFlipBitsByRange'
  try {
    bit.flipBitsByRange(0, 1)
  } catch (e) {
    console.info(`${tag} Task execution catch: ${e.message}, code: ${e.code}`);
  }
}

async function asyncSleep(time: number) {
  return await new Promise<number>((resolve) => {
    setTimeout(() => {
      resolve(1)
    }, time)
  })
}

export default function BitVectorFlipBitsByRangeTest() {
  describe('BitVectorFlipBitsByRangeTest', () => {
    beforeAll(() => {})
    beforeEach(() => {})
    afterEach(() => {})
    afterAll(() => {})

    /**
     * @tc.name   BitVector_flipBitsByRange_Func_001
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_1001
     * @tc.desc   Flips a range of bit values in a bit vector.(Flip 0 to 1, flip 1 to 0).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("BitVector_flipBitsByRange_Func_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        let bitVector = new collections.BitVector(0);
        bitVector.push(1);
        bitVector.push(1);
        bitVector.push(0);
        bitVector.push(1);
        bitVector.push(0);
        bitVector.flipBitsByRange(0, 4);
        expect(bitVector[0]).assertEqual(0);
        expect(bitVector[1]).assertEqual(0);
        expect(bitVector[2]).assertEqual(1);
        expect(bitVector[3]).assertEqual(0);
    });

    /**
     * @tc.name   BitVector_flipBitsByRange_Func_002
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_1002
     * @tc.desc   Flips a range of bit values in a bit vector.(Flip 0 to 1, flip 1 to 0).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("BitVector_flipBitsByRange_Func_002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
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
          bitVector.flipBitsByRange(8, -3);
          expect(true).assertEqual(false);
        } catch (err) {
          expect(err.name).assertEqual("BusinessError");
          expect(err.code).assertEqual(10200001);
          expect(err.message)
            .assertEqual(`The value of "toIndex" is out of range. It must be >= 0 && <= 8. Received value is: -3`);
        }
    });

    /**
     * @tc.name   BitVector_flipBitsByRange_Func_003
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_1003
     * @tc.desc   Flips a range of bit values in a bit vector.(Flip 0 to 1, flip 1 to 0).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("BitVector_flipBitsByRange_Func_003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
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
          bitVector.flipBitsByRange(-3, -3);
          expect(true).assertEqual(false);
        } catch (err) {
          expect(err.name).assertEqual("BusinessError");
          expect(err.code).assertEqual(10200001);
          expect(err.message)
            .assertEqual(`The value of "toIndex" is out of range. It must be >= 0 && <= 8. Received value is: -3`);
        }
    });

    /**
     * @tc.name   BitVector_flipBitsByRange_Func_004
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_1004
     * @tc.desc   Flips a range of bit values in a bit vector.(Flip 0 to 1, flip 1 to 0).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("BitVector_flipBitsByRange_Func_004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
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
          bitVector.flipBitsByRange(-3, 8);
          expect(true).assertEqual(false);
        } catch (err) {
          expect(err.name).assertEqual("BusinessError");
          expect(err.code).assertEqual(10200001);
          expect(err.message)
            .assertEqual(`The value of "fromIndex" is out of range. It must be >= 0 && <= 7. Received value is: -3`);
        }
    });

    /**
     * @tc.name   BitVector_flipBitsByRange_Func_005
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_1005
     * @tc.desc   Flips a range of bit values in a bit vector.(Flip 0 to 1, flip 1 to 0).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("BitVector_flipBitsByRange_Func_005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
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
          bitVector.flipBitsByRange(3.11, 8);
          expect(true).assertEqual(false);
        } catch (err) {
          expect(err.name).assertEqual("BusinessError");
          expect(err.code).assertEqual(401);
          expect(err.message).assertEqual(`The type of "fromIndex" must be integer. Received value is: 3.11`);
        }
    });

    /**
     * @tc.name   BitVector_flipBitsByRange_Func_006
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_1006
     * @tc.desc   Flips a range of bit values in a bit vector.(Flip 0 to 1, flip 1 to 0).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("BitVector_flipBitsByRange_Func_006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
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
        bitVector.flipBitsByRange(0, 32);
        for (let i = 0; i < bitVectorLength; i++) {
          expect(bitVector[i]).assertEqual(1);
        }
    });

    /**
     * @tc.name   BitVector_flipBitsByRange_Func_007
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_1007
     * @tc.desc   Flips a range of bit values in a bit vector.(Flip 0 to 1, flip 1 to 0).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("BitVector_flipBitsByRange_Func_007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
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
        bitVector.flipBitsByRange(10, 74);
        for (let i = 10; i < bitVectorLength + 10; i++) {
          if (i >= 42) {
            expect(bitVector[i]).assertEqual(0);
          } else {
            expect(bitVector[i]).assertEqual(1);
          }
        }
    });

    /**
     * @tc.name   BitVector_flipBitsByRange_Func_008
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_1008
     * @tc.desc   Flips a range of bit values in a bit vector.(Flip 0 to 1, flip 1 to 0).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("BitVector_flipBitsByRange_Func_008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        let bitVector = new collections.BitVector(0);
        let bitVectorLength = 64;
        for (let i = 0; i < bitVectorLength; i++) {
          let res0 = bitVector.push(1);
          expect(res0).assertEqual(true);
        }
        expect(bitVector.length).assertEqual(bitVectorLength);
        try {
          let tmp:string = "test";
          let a:number = JSON.parse(JSON.stringify(tmp)) as number;
          bitVector.flipBitsByRange(10, a);
          expect(true).assertEqual(false);
        } catch (err) {
          expect(err.name).assertEqual(`BusinessError`);
          expect(err.code).assertEqual(401);
          expect(err.message).assertEqual(`The type of "toIndex" must be integer. Received value is: test`);
        }
    });

    /**
     * @tc.name   BitVectorTest6100
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_1009
     * @tc.desc   Verify BitVector flipBitsByRange flips bits in specified range
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BitVectorTest6100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
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
     * @tc.name   BitVectorTest6200
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_1010
     * @tc.desc   Verify BitVector flipBitsByRange with invalid index throws error 10200001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BitVectorTest6200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let bv = new collections.BitVector(16)
      try {
        bv.flipBitsByRange(-1, 16)
        expect().assertFail()
      } catch (e) {
        expect(e.code).assertEqual(10200001)
      }
    })

    /**
     * @tc.name   BitVectorTest6300
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_1011
     * @tc.desc   Verify BitVector flipBitsByRange returns void undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BitVectorTest6300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let bv = new collections.BitVector(16)
      let result = bv.flipBitsByRange(0, 8)
      expect(result).assertUndefined()
    })

    /**
     * @tc.name   BitVectortest03800
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_1012
     * @tc.desc   BitVector flipBitsByRange 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BitVectortest03800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'BitVectortest03800';
        let flag: boolean = false;
        console.info(`${caseName} test start`);
        try {
          let bitVector = new collections.BitVector(0);
          bitVector.push(0);
          bitVector.push(1);
          bitVector.push(0);
          bitVector.push(1);
          bitVector.push(0);
          bitVector.flipBitsByRange(NaN, 4);
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
     * @tc.name   BitVectortest03900
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_1013
     * @tc.desc   BitVector flipBitsByRange 10200001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BitVectortest03900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'BitVectortest03900';
        let flag: boolean = false;
        console.info(`${caseName} test start`);
        try {
          let bitVector = new collections.BitVector(0);
          bitVector.push(0);
          bitVector.push(1);
          bitVector.push(0);
          bitVector.push(1);
          bitVector.push(0);
          bitVector.flipBitsByRange(-1, 4);
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
     * @tc.name   BitVectortest04000
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_1014
     * @tc.desc   BitVector flipBitsByRange 10200011
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BitVectortest04000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'BitVectortest04000';
        let flag: boolean = false;
        console.info(`${caseName} test start`);
        try {
          let bitVector = new collections.BitVector(0);
          bitVector.push(0);
          bitVector.push(1);
          bitVector.push(0);
          bitVector.push(1);
          bitVector.push(0);
          let flipBitsByRangeMethod = bitVector.flipBitsByRange;
          flipBitsByRangeMethod(1, 4)
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
     * @tc.name   BitVectortest05300
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_1015
     * @tc.desc   BitVector values 10200201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BitVectortest05300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'BitVectortest05300';
        console.info(`${caseName} test start`);
        let count = 0;
        let bitVector = new collections.BitVector(4);
        try {
          for (let i = 0; i < 100; i++) {
            taskpool.execute(testFlipBitsByRange, i, bitVector).then(() => {

              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            })
          }
          for (let i = 0; i < 10; i++) {
            bitVector.flipBitsByRange(0, 1)
          }
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect(e.code).assertEqual(10200201)
        }
        while (count < 100) {
          await asyncSleep(100)
        }
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   testBitVectorFlipBitsByRange0001
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_1016
     * @tc.desc   Testing the flipBitsByRange of bitVector, fromIndex=0,toIndex=6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorFlipBitsByRange0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        const TAG = "testBitVectorFlipBitsByRange0001";
        try {
          let bitVectorList: collections.BitVector = new collections.BitVector(0);
          for (let i = 0; i < 10; i++) {
            if (i < 5) {
              bitVectorList.push(0);
            } else {
              bitVectorList.push(1);
            }
          }
          bitVectorList.flipBitsByRange(0, 6);
          let arrayList = new collections.Array<string>("1", "1", "1", "1", "1", "0", "1", "1", "1", "1");
          for (let i = 0; i < 10; i++) {
            expect(bitVectorList[i].toString()).assertEqual(arrayList[i]);
          }
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
        done()
      });

    /**
     * @tc.name   testBitVectorFlipBitsByRange0002
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_1017
     * @tc.desc   Testing the flipBitsByRange of bitVector, fromIndex=4,toIndex=10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorFlipBitsByRange0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        const TAG = "testBitVectorFlipBitsByRange0002";
        try {
          let bitVectorList: collections.BitVector = new collections.BitVector(0);
          for (let i = 0; i < 10; i++) {
            if (i < 5) {
              bitVectorList.push(0);
            } else {
              bitVectorList.push(1);
            }
          }
          bitVectorList.flipBitsByRange(4, 10);
          let arrayList = new collections.Array<string>("0", "0", "0", "0", "1", "0", "0", "0", "0", "0");
          for (let i = 0; i < 10; i++) {
            expect(bitVectorList[i].toString()).assertEqual(arrayList[i]);
          }
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
        done()
      });

    /**
     * @tc.name   testBitVectorFlipBitsByRange0003
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_1018
     * @tc.desc   Testing the flipBitsByRange of bitVector, fromIndex=4,toIndex=11, return error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorFlipBitsByRange0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        const TAG = "testBitVectorFlipBitsByRange0003";
        try {
          let bitVectorList: collections.BitVector = new collections.BitVector(0);
          for (let i = 0; i < 10; i++) {
            if (i < 5) {
              bitVectorList.push(0);
            } else {
              bitVectorList.push(1);
            }
          }
          bitVectorList.flipBitsByRange(4, 11);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect(`${err.message}`)
            .assertEqual("The value of \"toIndex\" is out of range. It must be >= 0 && <= 10. Received value is: 11");
        }
        done()
      });

    /**
     * @tc.name   testBitVectorFlipBitsByRange0004
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_1019
     * @tc.desc   Testing the flipBitsByRange of bitVector, fromIndex=-1,toIndex=10, return error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorFlipBitsByRange0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        const TAG = "testBitVectorFlipBitsByRange0004";
        try {
          let bitVectorList: collections.BitVector = new collections.BitVector(0);
          for (let i = 0; i < 10; i++) {
            if (i < 5) {
              bitVectorList.push(0);
            } else {
              bitVectorList.push(1);
            }
          }
          bitVectorList.flipBitsByRange(-1, 10);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect(`${err.message}`)
            .assertEqual("The value of \"fromIndex\" is out of range. It must be >= 0 && <= 9. Received value is: -1");
        }
        done()
      });

    /**
     * @tc.name   testBitVectorFlipBitsByRange0005
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_1020
     * @tc.desc   Testing the flipBitsByRange of bitVector, fromIndex=5,toIndex=4, return error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorFlipBitsByRange0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        const TAG = "testBitVectorFlipBitsByRange0005";
        try {
          let bitVectorList: collections.BitVector = new collections.BitVector(0);
          for (let i = 0; i < 10; i++) {
            if (i < 5) {
              bitVectorList.push(0);
            } else {
              bitVectorList.push(1);
            }
          }
          bitVectorList.flipBitsByRange(5, 4);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect(`${err.message}`)
            .assertEqual("The value of \"fromIndex\" is out of range. It must be >= 0 && <= 3. Received value is: 5");
        }
        done()
      });

    /**
     * @tc.name   testBitVectorFlipBitsByRange0006
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_1021
     * @tc.desc   Testing the flipBitsByRange of bitVector, fromIndex=5,toIndex=5, return error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorFlipBitsByRange0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        const TAG = "testBitVectorFlipBitsByRange0006";
        try {
          let bitVectorList: collections.BitVector = new collections.BitVector(0);
          for (let i = 0; i < 10; i++) {
            if (i < 5) {
              bitVectorList.push(0);
            } else {
              bitVectorList.push(1);
            }
          }
          bitVectorList.flipBitsByRange(5, 5);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect(`${err.message}`)
            .assertEqual("The value of \"fromIndex\" is out of range. It must be >= 0 && <= 4. Received value is: 5");
        }
        done()
      });

    /**
     * @tc.name   testBitVectorFlipBitsByRange0011
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_1022
     * @tc.desc   BitVector flipBitsByRange fromIndex NaN error code 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorFlipBitsByRange0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        const TAG = "testBitVectorFlipBitsByRange0011";
        try {
          let bitVectorList: collections.BitVector = new collections.BitVector(5);
          bitVectorList.push(0);
          bitVectorList.push(1);
          bitVectorList.flipBitsByRange(NaN, 5);
          expect().assertFail();
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect(err.code).assertEqual(401);
        }
        done()
      });

    /**
     * @tc.name   testBitVectorFlipBitsByRange0012
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_1023
     * @tc.desc   BitVector flipBitsByRange full range flip test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorFlipBitsByRange0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        const TAG = "testBitVectorFlipBitsByRange0012";
        try {
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
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
        done()
      });

    /**
     * @tc.name   testBitVectorFlipBitsByRange0013
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_1024
     * @tc.desc   BitVector flipBitsByRange single element range test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorFlipBitsByRange0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        const TAG = "testBitVectorFlipBitsByRange0013";
        try {
          let bitVectorList: collections.BitVector = new collections.BitVector(0);
          bitVectorList.push(0);
          bitVectorList.push(1);
          bitVectorList.push(0);
          bitVectorList.push(1);
          bitVectorList.push(0);
          bitVectorList.flipBitsByRange(2, 3);
          expect(bitVectorList[2]).assertEqual(1);
          expect(bitVectorList[1]).assertEqual(1);
          expect(bitVectorList[3]).assertEqual(1);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
        done()
      });

    /**
     * @tc.name   testBitVectorFlipBitsByRange0014
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_1025
     * @tc.desc   BitVector flipBitsByRange range outside unchanged test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorFlipBitsByRange0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        const TAG = "testBitVectorFlipBitsByRange0014";
        try {
          let bitVectorList: collections.BitVector = new collections.BitVector(5);
          bitVectorList.push(0);
          bitVectorList.push(1);
          bitVectorList.push(0);
          bitVectorList.push(1);
          bitVectorList.push(0);
          bitVectorList.flipBitsByRange(1, 4);
          expect(bitVectorList[0]).assertEqual(0);
          expect(bitVectorList[4]).assertEqual(0);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
        done()
      });

    /**
     * @tc.name   testBitVectorFlipBitsByRange0015
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_1026
     * @tc.desc   BitVector flipBitsByRange double flip restore test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorFlipBitsByRange0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        const TAG = "testBitVectorFlipBitsByRange0015";
        try {
          let bitVectorList: collections.BitVector = new collections.BitVector(5);
          bitVectorList.push(0);
          bitVectorList.push(1);
          bitVectorList.push(0);
          bitVectorList.push(1);
          bitVectorList.push(0);
          let original0 = bitVectorList[0];
          let original1 = bitVectorList[1];
          bitVectorList.flipBitsByRange(0, 2);
          bitVectorList.flipBitsByRange(0, 2);
          expect(bitVectorList[0]).assertEqual(original0);
          expect(bitVectorList[1]).assertEqual(original1);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
        done()
      });

    /**
     * @tc.name   testBitVectorFlipBitsByRange0016
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_1027
     * @tc.desc   BitVector flipBitsByRange single element BitVector test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorFlipBitsByRange0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        const TAG = "testBitVectorFlipBitsByRange0016";
        try {
          let bitVectorList: collections.BitVector = new collections.BitVector(1);
          bitVectorList.push(0);
          bitVectorList.flipBitsByRange(0, 1);
          expect(bitVectorList[0]).assertEqual(1);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
        done()
      });

    /**
     * @tc.name   testBitVectorFlipBitsByRange0017
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_1028
     * @tc.desc   BitVector flipBitsByRange large BitVector test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorFlipBitsByRange0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        const TAG = "testBitVectorFlipBitsByRange0017";
        try {
          let bitVectorList: collections.BitVector = new collections.BitVector(0);
          for (let i = 0; i < 100; i++) {
            bitVectorList.push(i % 2);
          }
          bitVectorList.flipBitsByRange(0, 100);
          for (let i = 0; i < 100; i++) {
            expect(bitVectorList[i]).assertEqual((i + 1) % 2);
          }
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
        done()
      });

    /**
     * @tc.name   testBitVectorFlipBitsByRange0019
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_1029
     * @tc.desc   BitVector flipBitsByRange return undefined test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorFlipBitsByRange0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        const TAG = "testBitVectorFlipBitsByRange0019";
        try {
          let bitVectorList: collections.BitVector = new collections.BitVector(5);
          bitVectorList.push(0);
          bitVectorList.push(1);
          bitVectorList.push(0);
          bitVectorList.push(1);
          bitVectorList.push(0);
          let result = bitVectorList.flipBitsByRange(0, 5);
          expect(result).assertEqual(undefined);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
        done()
      });

    /**
     * @tc.name   testBitVectorFlipBitsByRange0020
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_1030
     * @tc.desc   BitVector flipBitsByRange length unchanged test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorFlipBitsByRange0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        const TAG = "testBitVectorFlipBitsByRange0020";
        try {
          let bitVectorList: collections.BitVector = new collections.BitVector(5);
          bitVectorList.push(0);
          bitVectorList.push(1);
          bitVectorList.push(0);
          bitVectorList.push(1);
          bitVectorList.push(0);
          let originalLength = bitVectorList.length;
          bitVectorList.flipBitsByRange(0, 5);
          expect(bitVectorList.length).assertEqual(originalLength);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
        done()
      });

    /**
     * @tc.name   testBitVectorFlipBitsByRange0021
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_1031
     * @tc.desc   BitVector flipBitsByRange fromIndex Infinity error code 10200001 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorFlipBitsByRange0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        const TAG = "testBitVectorFlipBitsByRange0021";
        try {
          let bitVectorList: collections.BitVector = new collections.BitVector(5);
          bitVectorList.push(0);
          bitVectorList.push(1);
          bitVectorList.push(0);
          bitVectorList.push(1);
          bitVectorList.push(0);
          bitVectorList.flipBitsByRange(Infinity, 5);
          expect().assertFail();
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect(err.code).assertEqual(401);
        }
        done()
      });

    /**
     * @tc.name   testBitVectorFlipBitsByRange0022
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_1032
     * @tc.desc   BitVector flipBitsByRange toIndex NaN error code 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorFlipBitsByRange0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        const TAG = "testBitVectorFlipBitsByRange0022";
        try {
          let bitVectorList: collections.BitVector = new collections.BitVector(5);
          bitVectorList.push(0);
          bitVectorList.push(1);
          bitVectorList.push(0);
          bitVectorList.push(1);
          bitVectorList.push(0);
          bitVectorList.flipBitsByRange(0, NaN);
          expect().assertFail();
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect(err.code).assertEqual(401);
        }
        done()
      });

    /**
     * @tc.name   testBitVectorFlipBitsByRange0023
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_1033
     * @tc.desc   BitVector flipBitsByRange hex fromIndex test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorFlipBitsByRange0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        const TAG = "testBitVectorFlipBitsByRange0023";
        try {
          let bitVectorList: collections.BitVector = new collections.BitVector(50);
          for (let i = 0; i < 50; i++) {
            bitVectorList.push(0);
          }
          bitVectorList.flipBitsByRange(0x1A, 0x1E);
          expect(bitVectorList[0x1A]).assertEqual(1);
          expect(bitVectorList[0x1D]).assertEqual(1);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
        done()
      });

    /**
     * @tc.name   testBitVectorFlipBitsByRange0024
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_1034
     * @tc.desc   BitVector flipBitsByRange octal fromIndex test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorFlipBitsByRange0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        const TAG = "testBitVectorFlipBitsByRange0024";
        try {
          let bitVectorList: collections.BitVector = new collections.BitVector(20);
          for (let i = 0; i < 20; i++) {
            bitVectorList.push(0);
          }
          bitVectorList.flipBitsByRange(0o12, 0o15);
          expect(bitVectorList[0o12]).assertEqual(1);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
        done()
      });

    /**
     * @tc.name   testBitVectorFlipBitsByRange0025
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_1035
     * @tc.desc   BitVector flipBitsByRange fromIndex included verification test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorFlipBitsByRange0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        const TAG = "testBitVectorFlipBitsByRange0025";
        try {
          let bitVectorList: collections.BitVector = new collections.BitVector(0);
          bitVectorList.push(0);
          bitVectorList.push(1);
          bitVectorList.push(0);
          bitVectorList.push(1);
          bitVectorList.push(0);
          bitVectorList.flipBitsByRange(1, 4);
          expect(bitVectorList[1]).assertEqual(0);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
        done()
      });

    /**
     * @tc.name   testBitVectorFlipBitsByRange0026
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_1036
     * @tc.desc   BitVector flipBitsByRange toIndex excluded verification test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorFlipBitsByRange0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        const TAG = "testBitVectorFlipBitsByRange0026";
        try {
          let bitVectorList: collections.BitVector = new collections.BitVector(5);
          bitVectorList.push(0);
          bitVectorList.push(1);
          bitVectorList.push(0);
          bitVectorList.push(1);
          bitVectorList.push(0);
          bitVectorList.flipBitsByRange(1, 4);
          expect(bitVectorList[4]).assertEqual(0);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
        done()
      });

    /**
     * @tc.name   testBitVectorFlipBitsByRange0027
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_1037
     * @tc.desc   BitVector flipBitsByRange multiple different ranges test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorFlipBitsByRange0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        const TAG = "testBitVectorFlipBitsByRange0027";
        try {
          let bitVectorList: collections.BitVector = new collections.BitVector(0);
          bitVectorList.push(0);
          bitVectorList.push(1);
          bitVectorList.push(0);
          bitVectorList.push(1);
          bitVectorList.push(0);
          bitVectorList.flipBitsByRange(0, 2);
          bitVectorList.flipBitsByRange(2, 4);
          bitVectorList.flipBitsByRange(4, 5);
          expect(bitVectorList[0]).assertEqual(1);
          expect(bitVectorList[1]).assertEqual(0);
          expect(bitVectorList[2]).assertEqual(1);
          expect(bitVectorList[3]).assertEqual(0);
          expect(bitVectorList[4]).assertEqual(1);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
        done()
      });

    /**
     * @tc.name   testBitVectorFlipBitsByRangeBoundary0001
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_1038
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
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_1039
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
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_1040
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
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_1041
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

    /**
     * @tc.name   testBitVectorEmptyBoundary0008
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_1042
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
     * @tc.name   testBitVectorRepeatCall0004
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_1043
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
     * @tc.name   testBitVector64Boundary0006
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_1044
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
     * @tc.name   testBitVector128Boundary0006
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_1045
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

  })
}
