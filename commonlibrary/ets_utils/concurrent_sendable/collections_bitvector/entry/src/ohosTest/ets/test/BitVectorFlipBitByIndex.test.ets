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
function testFlipBitByIndex(index: number, bit: collections.BitVector) {
  let tag = 'testFlipBitByIndex'
  try {
    bit.flipBitByIndex(0)
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

export default function BitVectorFlipBitByIndexTest() {
  describe('BitVectorFlipBitByIndexTest', () => {
    beforeAll(() => {})
    beforeEach(() => {})
    afterEach(() => {})
    afterAll(() => {})

    /**
     * @tc.name   BitVector_flipBitByIndex_Func_001
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0901
     * @tc.desc   Flips the bit value by index in a bit vector.(Flip 0 to 1, flip 1 to 0).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("BitVector_flipBitByIndex_Func_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        let bitVector = new collections.BitVector(0);
        bitVector.push(1);
        bitVector.push(1);
        bitVector.push(1);
        bitVector.push(1);
        bitVector.push(0);
        bitVector.flipBitByIndex(0);
        bitVector.flipBitByIndex(1);
        bitVector.flipBitByIndex(2);
        bitVector.flipBitByIndex(3);
        bitVector.flipBitByIndex(4);
        expect(bitVector[0]).assertEqual(0);
        expect(bitVector[1]).assertEqual(0);
        expect(bitVector[2]).assertEqual(0);
        expect(bitVector[3]).assertEqual(0);
        expect(bitVector[4]).assertEqual(1);
    });

    /**
     * @tc.name   BitVector_flipBitByIndex_Func_002
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0902
     * @tc.desc   Flips the bit value by index in a bit vector.(Flip 0 to 1, flip 1 to 0).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("BitVector_flipBitByIndex_Func_002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
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
          let res = bitVector.flipBitByIndex(20);
          expect(true).assertEqual(false);
        } catch (err) {
          expect(err.name).assertEqual("BusinessError");
          expect(err.code).assertEqual(10200001);
          expect(err.message)
            .assertEqual(`The value of "index" is out of range. It must be >= 0 && <= 7. Received value is: 20`);
        }
    });

    /**
     * @tc.name   BitVector_flipBitByIndex_Func_003
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0903
     * @tc.desc   Flips the bit value by index in a bit vector.(Flip 0 to 1, flip 1 to 0).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("BitVector_flipBitByIndex_Func_003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
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
          bitVector.flipBitByIndex(6.1);
          expect(true).assertEqual(false);
        } catch (err) {
          expect(err.name).assertEqual(`BusinessError`);
          expect(err.code).assertEqual(401);
          expect(err.message).assertEqual(`The type of "index" must be integer. Received value is: 6.1`);
        }
    });

    /**
     * @tc.name   BitVector_flipBitByIndex_Func_004
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0904
     * @tc.desc   Flips the bit value by index in a bit vector.(Flip 0 to 1, flip 1 to 0).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("BitVector_flipBitByIndex_Func_004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
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
        for (let i = 0; i < bitVectorLength; i++) {
          bitVector.flipBitByIndex(i);
        }
        for (let i = 0; i < bitVectorLength; i++) {
          if (i >= 32) {
            expect(bitVector[i]).assertEqual(0);
          } else {
            expect(bitVector[i]).assertEqual(1);
          }
        }
    });

    /**
     * @tc.name   BitVector_flipBitByIndex_Func_005
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0905
     * @tc.desc   Flips the bit value by index in a bit vector.(Flip 0 to 1, flip 1 to 0).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("BitVector_flipBitByIndex_Func_005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
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
        for (let i = 10; i < bitVectorLength + 10; i++) {
          bitVector.flipBitByIndex(i);
        }
        for (let i = 10; i < bitVectorLength + 10; i++) {
          if (i >= 42) {
            expect(bitVector[i]).assertEqual(0);
          } else {
            expect(bitVector[i]).assertEqual(1);
          }
        }
    });

    /**
     * @tc.name   BitVector_flipBitByIndex_Func_006
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0906
     * @tc.desc   Flips the bit value by index in a bit vector.(Flip 0 to 1, flip 1 to 0).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("BitVector_flipBitByIndex_Func_006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        let bitVector = new collections.BitVector(0);
        bitVector.push(1);
        bitVector.push(1);
        bitVector.push(0);
        bitVector.push(1);
        bitVector.push(0);
        bitVector.push(0);
        bitVector.push(1);
        try {
          let res = bitVector.flipBitByIndex(-2);
          expect(true).assertEqual(false);
        } catch (err) {
          expect(err.name).assertEqual("BusinessError");
          expect(err.code).assertEqual(10200001);
          expect(err.message)
            .assertEqual(`The value of "index" is out of range. It must be >= 0 && <= 6. Received value is: -2`);
        }
    });

    /**
     * @tc.name   BitVector_flipBitByIndex_Func_007
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0907
     * @tc.desc   Flips the bit value by index in a bit vector.(Flip 0 to 1, flip 1 to 0).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("BitVector_flipBitByIndex_Func_007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        let bitVector = new collections.BitVector(0);
        bitVector.push(1);
        bitVector.push(1);
        bitVector.push(0);
        bitVector.push(1);
        bitVector.push(0);
        bitVector.push(0);
        bitVector.push(1);
        try {
          let tmp:string = "test";
          let a:number = JSON.parse(JSON.stringify(tmp)) as number;
          let res = bitVector.flipBitByIndex(a);
          expect(true).assertEqual(false);
        } catch (err) {
          expect(err.name).assertEqual(`BusinessError`);
          expect(err.code).assertEqual(401);
          expect(err.message).assertEqual(`The type of "index" must be integer. Received value is: test`);
        }
    });

    /**
     * @tc.name   BitVectorTest5500
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0908
     * @tc.desc   Verify BitVector flipBitByIndex flips 0 to 1 and 1 to 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BitVectorTest5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let bv = new collections.BitVector(16)
      bv[5] = 0
      bv.flipBitByIndex(5)
      expect(bv[5]).assertEqual(1)
      bv.flipBitByIndex(5)
      expect(bv[5]).assertEqual(0)
    })

    /**
     * @tc.name   BitVectorTest5600
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0909
     * @tc.desc   Verify BitVector flipBitByIndex at boundary indices 0 and length-1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BitVectorTest5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let bv = new collections.BitVector(16)
      bv.flipBitByIndex(0)
      bv.flipBitByIndex(15)
      expect(bv[0]).assertEqual(1)
      expect(bv[15]).assertEqual(1)
    })

    /**
     * @tc.name   BitVectorTest5700
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0910
     * @tc.desc   Verify BitVector flipBitByIndex with negative and out of range throws error 10200001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BitVectorTest5700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let bv = new collections.BitVector(16)
      try {
        bv.flipBitByIndex(-1)
        expect().assertFail()
      } catch (e) {
        expect(e.code).assertEqual(10200001)
      }
    })

    /**
     * @tc.name   BitVectorTest5800
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0911
     * @tc.desc   Verify BitVector flipBitByIndex with out of range index throws error 10200001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BitVectorTest5800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let bv = new collections.BitVector(16)
      try {
        bv.flipBitByIndex(16)
        expect().assertFail()
      } catch (e) {
        expect(e.code).assertEqual(10200001)
      }
    })

    /**
     * @tc.name   BitVectorTest5900
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0912
     * @tc.desc   Verify BitVector flipBitByIndex with float index throws error 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BitVectorTest5900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let bv = new collections.BitVector(16)
      try {
        bv.flipBitByIndex(5.5)
        expect().assertFail()
      } catch (e) {
        expect(e.code).assertEqual(401)
      }
    })

    /**
     * @tc.name   BitVectorTest6000
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0913
     * @tc.desc   Verify BitVector flipBitByIndex returns void undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BitVectorTest6000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let bv = new collections.BitVector(16)
      let result = bv.flipBitByIndex(5)
      expect(result).assertUndefined()
    })

    /**
     * @tc.name   BitVectortest03400
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0914
     * @tc.desc   BitVector flipBitByIndex 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BitVectortest03400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'BitVectortest03400';
        let flag: boolean = false;
        console.info(`${caseName} test start`);
        try {
          let bitVector = new collections.BitVector(0);
          bitVector.push(0);
          bitVector.push(1);
          bitVector.push(0);
          bitVector.push(1);
          bitVector.push(0);
          bitVector.flipBitByIndex(NaN);
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
     * @tc.name   BitVectortest03500
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0915
     * @tc.desc   BitVector flipBitByIndex 10200001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BitVectortest03500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'BitVectortest03500';
        let flag: boolean = false;
        console.info(`${caseName} test start`);
        try {
          let bitVector = new collections.BitVector(0);
          bitVector.push(0);
          bitVector.push(1);
          bitVector.push(0);
          bitVector.push(1);
          bitVector.push(0);
          bitVector.flipBitByIndex(-1);
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
     * @tc.name   BitVectortest03600
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0916
     * @tc.desc   BitVector flipBitByIndex 10200011
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BitVectortest03600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'BitVectortest03600';
        let flag: boolean = false;
        console.info(`${caseName} test start`);
        try {
          let bitVector = new collections.BitVector(0);
          bitVector.push(0);
          bitVector.push(1);
          bitVector.push(0);
          bitVector.push(1);
          bitVector.push(0);
          let flipBitByIndexMethod = bitVector.flipBitByIndex;
          flipBitByIndexMethod(3)
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
     * @tc.name   BitVectortest05200
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0917
     * @tc.desc   BitVector values 10200201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BitVectortest05200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'BitVectortest05200';
        console.info(`${caseName} test start`);
        let count = 0;
        let bitVector = new collections.BitVector(4);
        try {
          for (let i = 0; i < 100; i++) {
            taskpool.execute(testFlipBitByIndex, i, bitVector).then(() => {

              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            })
          }
          for (let i = 0; i < 10; i++) {
            bitVector.flipBitByIndex(1)
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
     * @tc.name   testBitVectorFlipBitByIndex0001
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0918
     * @tc.desc   Testing the flipBitByIndex of bitVector, index is 0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorFlipBitByIndex0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        const TAG = "testBitVectorFlipBitByIndex0001";
        try {
          let bitVectorList: collections.BitVector = new collections.BitVector(0);
          bitVectorList.push(0);
          bitVectorList.push(1);
          bitVectorList.push(0);
          bitVectorList.flipBitByIndex(0);
          expect(bitVectorList[0].toString()).assertEqual("1");
          expect(bitVectorList[1].toString()).assertEqual("1");
          expect(bitVectorList[2].toString()).assertEqual("0");
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
        done()
      });

    /**
     * @tc.name   testBitVectorFlipBitByIndex0002
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0919
     * @tc.desc   Testing the flipBitByIndex of bitVector, index is 5, return error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorFlipBitByIndex0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        const TAG = "testBitVectorFlipBitByIndex0002";
        try {
          let bitVectorList: collections.BitVector = new collections.BitVector(0);
          bitVectorList.push(0);
          bitVectorList.push(1);
          bitVectorList.push(0);
          bitVectorList.flipBitByIndex(5);
          expect(bitVectorList[0].toString()).assertEqual("0");
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect(`${err.message}`)
            .assertEqual("The value of \"index\" is out of range. It must be >= 0 && <= 2. Received value is: 5");
        }
        done()
      });

    /**
     * @tc.name   testBitVectorFlipBitByIndex0003
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0920
     * @tc.desc   Testing the flipBitByIndex of bitVector, index is -1, return error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorFlipBitByIndex0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        const TAG = "testBitVectorFlipBitByIndex0003";
        try {
          let bitVectorList: collections.BitVector = new collections.BitVector(0);
          bitVectorList.push(0);
          bitVectorList.push(1);
          bitVectorList.push(0);
          bitVectorList.flipBitByIndex(-1);
          expect(bitVectorList[0].toString()).assertEqual("0");
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect(`${err.message}`)
            .assertEqual("The value of \"index\" is out of range. It must be >= 0 && <= 2. Received value is: -1");
        }
        done()
      });

    /**
     * @tc.name   testBitVectorFlipBitByIndex0005
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0921
     * @tc.desc   BitVector flipBitByIndex with extra parameter test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorFlipBitByIndex0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        const TAG = "testBitVectorFlipBitByIndex0005";
        try {
          let bitVectorList: collections.BitVector = new collections.BitVector(5);
          bitVectorList.push(0);
          bitVectorList.push(1);
          bitVectorList.push(0);
          bitVectorList.flipBitByIndex(2);
          expect(bitVectorList[2]).assertEqual(1);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
        done()
      });

    /**
     * @tc.name   testBitVectorFlipBitByIndex0008
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0922
     * @tc.desc   BitVector flipBitByIndex with NaN parameter test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorFlipBitByIndex0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        const TAG = "testBitVectorFlipBitByIndex0008";
        try {
          let bitVectorList: collections.BitVector = new collections.BitVector(5);
          bitVectorList.push(0);
          bitVectorList.push(1);
          bitVectorList.push(0);
          bitVectorList.flipBitByIndex(NaN);
          expect().assertFail();
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect(err.code).assertEqual(401);
        }
        done()
      });

    /**
     * @tc.name   testBitVectorFlipBitByIndex0009
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0923
     * @tc.desc   BitVector flipBitByIndex with Infinity parameter test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorFlipBitByIndex0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        const TAG = "testBitVectorFlipBitByIndex0009";
        try {
          let bitVectorList: collections.BitVector = new collections.BitVector(5);
          bitVectorList.push(0);
          bitVectorList.push(1);
          bitVectorList.push(0);
          bitVectorList.flipBitByIndex(Infinity);
          expect().assertFail();
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect(err.code).assertEqual(401);
        }
        done()
      });

    /**
     * @tc.name   testBitVectorFlipBitByIndex0010
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0924
     * @tc.desc   BitVector flipBitByIndex with negative index test, throws error 10200001.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorFlipBitByIndex0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        const TAG = "testBitVectorFlipBitByIndex0010";
        try {
          let bitVectorList: collections.BitVector = new collections.BitVector(5);
          bitVectorList.push(0);
          bitVectorList.push(1);
          bitVectorList.push(0);
          bitVectorList.flipBitByIndex(-1);
          expect().assertFail();
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect(err.code).assertEqual(10200001);
        }
        done()
      });

    /**
     * @tc.name   testBitVectorFlipBitByIndex0012
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0925
     * @tc.desc   BitVector flipBitByIndex flips bit from 0 to 1 and verifies return value is void.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorFlipBitByIndex0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        const TAG = "testBitVectorFlipBitByIndex0012";
        try {
          let bitVectorList: collections.BitVector = new collections.BitVector(5);
          bitVectorList.push(0);
          bitVectorList.push(1);
          bitVectorList.push(0);
          bitVectorList.push(1);
          bitVectorList.push(0);
          let result = bitVectorList.flipBitByIndex(0);
          expect(result).assertEqual(undefined);
          expect(bitVectorList[0]).assertEqual(1);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
        done()
      });

    /**
     * @tc.name   testBitVectorFlipBitByIndex0013
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0926
     * @tc.desc   BitVector flipBitByIndex flips bit from 1 to 0 and double flip returns original value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorFlipBitByIndex0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        const TAG = "testBitVectorFlipBitByIndex0013";
        try {
          let bitVectorList: collections.BitVector = new collections.BitVector(0);
          bitVectorList.push(0);
          bitVectorList.push(1);
          bitVectorList.push(0);
          bitVectorList.push(1);
          bitVectorList.push(0);
          let originalValue = bitVectorList[1];
          expect(originalValue).assertEqual(1);
          bitVectorList.flipBitByIndex(1);
          expect(bitVectorList[1]).assertEqual(0);
          bitVectorList.flipBitByIndex(1);
          expect(bitVectorList[1]).assertEqual(originalValue);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
        done()
      });

    /**
     * @tc.name   testBitVectorFlipBitByIndexBoundary0001
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0927
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
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0928
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
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0929
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
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0930
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

    /**
     * @tc.name   testBitVectorEmptyBoundary0007
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0931
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
     * @tc.name   testBitVector64Boundary0012
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0932
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
     * @tc.name   testBitVector128Boundary0009
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0933
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
     * @tc.name   testBitVectorConstructorNonBinaryValue0004
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0934
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

  })
}
