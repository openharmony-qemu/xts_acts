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

export default function BitVectorPushTest() {
  describe('BitVectorPushTest', () => {
    beforeAll(() => {})
    beforeEach(() => {})
    afterEach(() => {})
    afterAll(() => {})

    /**
     * @tc.name   BitVector_push_Func_001
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0051
     * @tc.desc   Appends the bit element to the end of this bit vector.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("BitVector_push_Func_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
        let bitVector = new collections.BitVector(0);
        let res0 = bitVector.push(0);
        let res1 = bitVector.push(1);
        let res2 = bitVector.push(0);
        let res3 = bitVector.push(1);
        let res4 = bitVector.push(1);
        expect(res0).assertEqual(true);
        expect(res1).assertEqual(true);
        expect(res2).assertEqual(true);
        expect(res3).assertEqual(true);
        expect(res4).assertEqual(true);
        expect(bitVector.length).assertEqual(5);
    });

    /**
     * @tc.name   BitVector_push_Func_002
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0052
     * @tc.desc   Appends the bit element to the end of this bit vector.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("BitVector_push_Func_002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
        let bitVector = new collections.BitVector(0);
        let bitVectorLength = 64;
        for (let i = 0; i < bitVectorLength; i++) {
          let res0 = bitVector.push(0);
          expect(res0).assertEqual(true);
        }
        expect(bitVector.length).assertEqual(64);
    });

    /**
     * @tc.name   BitVector_push_Func_003
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0053
     * @tc.desc   Appends the bit element to the end of this bit vector.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("BitVector_push_Func_003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
        let bitVector = new collections.BitVector(10);
        let bitVectorLength = 64;
        for (let i = 0; i < bitVectorLength; i++) {
          let res0 = bitVector.push(0);
          expect(res0).assertEqual(true);
        }
        expect(bitVector.length).assertEqual(bitVectorLength + 10);
    });

    /**
     * @tc.name   BitVector_push_Func_004
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0054
     * @tc.desc   Check if the push is non-zero
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("BitVector_push_Func_004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        let bitVector = new collections.BitVector(0);
        bitVector.push(NaN);
        bitVector.push(Infinity);
        bitVector.push(-2);
        bitVector.push(-4);
        bitVector.push(5);
        bitVector.push(0);
        expect(bitVector[0]).assertEqual(1);
        expect(bitVector[1]).assertEqual(1);
        expect(bitVector[2]).assertEqual(1);
        expect(bitVector[3]).assertEqual(1);
        expect(bitVector[4]).assertEqual(1);
        expect(bitVector[5]).assertEqual(0);
    });

    /**
     * @tc.name   BitVectorTest1000
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0055
     * @tc.desc   Verify BitVector length changes after push pop and resize operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BitVectorTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let bv = new collections.BitVector(16)
      bv.push(1)
      expect(bv.length).assertEqual(17)
      bv.pop()
      expect(bv.length).assertEqual(16)
      bv.resize(32)
      expect(bv.length).assertEqual(32)
    })

    /**
     * @tc.name   BitVectorTest1100
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0056
     * @tc.desc   Verify BitVector push with element 0 and 1 sets correct bit values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BitVectorTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let bv = new collections.BitVector(8)
      bv.push(0)
      expect(bv[8]).assertEqual(0)
      bv.push(1)
      expect(bv[9]).assertEqual(1)
    })

    /**
     * @tc.name   BitVectorTest1200
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0057
     * @tc.desc   Verify BitVector push with non-zero values 2 and -1 sets bit value 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BitVectorTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let bv = new collections.BitVector(8)
      bv.push(2)
      expect(bv[8]).assertEqual(1)
      bv.push(-1)
      expect(bv[9]).assertEqual(1)
    })

    /**
     * @tc.name   BitVectorTest1300
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0058
     * @tc.desc   Verify BitVector push with NaN and Infinity special values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BitVectorTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let bv = new collections.BitVector(8)
      bv.push(NaN)
      bv.push(Infinity)
      expect(bv.length).assertEqual(10)
    })

    /**
     * @tc.name   BitVectorTest1400
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0059
     * @tc.desc   Verify BitVector push returns boolean type and true on success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BitVectorTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let bv = new collections.BitVector(8)
      let result1 = bv.push(0)
      expect(typeof result1).assertEqual("boolean")
      expect(result1).assertTrue()
      let result2 = bv.push(1)
      expect(result2).assertTrue()
    })

    /**
     * @tc.name   BitVectorTest1500
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0060
     * @tc.desc   Verify BitVector push to empty BitVector returns true with correct state
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BitVectorTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let bv = new collections.BitVector(0)
      let result = bv.push(1)
      expect(result).assertTrue()
      expect(bv.length).assertEqual(1)
      expect(bv[0]).assertEqual(1)
    })

    /**
     * @tc.name   BitVectortest0200
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0061
     * @tc.desc   BitVectortest0200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BitVectortest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'BitVectortest0200';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          const bitVector = new collections.BitVector(5);
          const unboundPush = bitVector.push;
          unboundPush(1);
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
     * @tc.name   testBitVectorPush0001
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0062
     * @tc.desc   Testing the Push of bitVector, push 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorPush0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorPush0001";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        let rst = bitVectorList.push(0);
        expect(rst).assertTrue();
        expect(bitVectorList[0]).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testBitVectorPush0002
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0063
     * @tc.desc   Testing the Push of bitVector, push 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorPush0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorPush0002";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        let rst = bitVectorList.push(1);
        expect(rst).assertTrue();
        expect(bitVectorList[0]).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testBitVectorPush0003
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0064
     * @tc.desc   Testing the Push of bitVector, push -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorPush0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorPush0003";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        let rst = bitVectorList.push(-1);
        expect(rst).assertTrue();
        expect(bitVectorList[0]).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testBitVectorPush0004
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0065
     * @tc.desc   Testing the Push of bitVector, push 65535
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorPush0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorPush0004";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        let rst = bitVectorList.push(65535);
        expect(rst).assertTrue();
        expect(bitVectorList[0]).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testBitVectorPush0005
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0066
     * @tc.desc   Testing the Push of bitVector, push -65535
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorPush0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorPush0005";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        let rst = bitVectorList.push(-65535);
        expect(rst).assertTrue();
        expect(bitVectorList[0]).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testBitVectorPush0006
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0067
     * @tc.desc   Testing the Push of bitVector, push 2.5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorPush0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorPush0006";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        let rst = bitVectorList.push(2.5);
        expect(rst).assertTrue();
        expect(bitVectorList[0]).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testBitVectorPush0007
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0068
     * @tc.desc   Testing the Push of bitVector, push 10 times 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorPush0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorPush0007";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        let rst = false;
        for (let i = 0; i < 10; i++) {
          rst = bitVectorList.push(1);
        }
        expect(rst).assertTrue();
        expect(bitVectorList.length).assertEqual(10);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testBitVectorPush0008
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0069
     * @tc.desc   Testing the Push of bitVector, push 100000 times 0 and 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorPush0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorPush0008";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        let rst = false;
        for (let i = 0; i < 1000; i++) {
          rst = bitVectorList.push(0);
          rst = bitVectorList.push(1);
        }
        expect(rst).assertTrue();
        expect(bitVectorList.length).assertEqual(2000);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testBitVectorPush0010
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0070
     * @tc.desc   BitVector push with extra parameter test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorPush0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorPush0010";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        let rst = bitVectorList.push(1);
        expect(rst).assertTrue();
        expect(bitVectorList.length).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testBitVectorPush0018
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0071
     * @tc.desc   BitVector push return value type validation test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorPush0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorPush0018";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        let rst = bitVectorList.push(1);
        expect(typeof rst).assertEqual("boolean");
        expect(rst).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testBitVectorPushBoundary0001
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0072
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
     * @tc.name   testBitVectorPushValueBoundary0001
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0073
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
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0074
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
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0075
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
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0076
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
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0077
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
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0078
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
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0079
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
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0080
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
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0081
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
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0082
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

    /**
     * @tc.name   testBitVectorRepeatCall0001
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0083
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
     * @tc.name   testBitVector64Boundary0001
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0084
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
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0085
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
     * @tc.name   testBitVector128Boundary0001
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0086
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
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0087
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
     * @tc.name   testBitVector1024Boundary0001
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0088
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
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0089
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
     * @tc.name   testBitVectorConstructorNonBinaryValue0002
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0090
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
  })
}
