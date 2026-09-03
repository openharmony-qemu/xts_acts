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

export default function BitVectorIndexAccessTest() {
  describe('BitVectorIndexAccessTest', () => {
    beforeAll(() => {})
    beforeEach(() => {})
    afterEach(() => {})
    afterAll(() => {})

    /**
     * @tc.name   BitVector_index_Func_001
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_1201
     * @tc.desc   Subscript access abnormal scenarios
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("BitVector_index_Func_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        let bitVector = new collections.BitVector(0);
        bitVector.push(1);
        bitVector.push(1);
        bitVector.push(0);
        bitVector.push(1);
        bitVector.push(0);
        bitVector.push(0);
        let tmp:string = "test";
        let a:number = JSON.parse(JSON.stringify(tmp)) as number;
        let value:number = bitVector[a];
        expect(value).assertEqual(undefined);
    });

    /**
     * @tc.name   BitVectorTest6600
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_1202
     * @tc.desc   Verify BitVector index accessor get returns correct bit value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BitVectorTest6600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let bv = new collections.BitVector(16)
      bv[5] = 1
      expect(bv[5]).assertEqual(1)
      expect(bv[0]).assertEqual(0)
    })

    /**
     * @tc.name   BitVectorTest6700
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_1203
     * @tc.desc   Verify BitVector index accessor set and get operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BitVectorTest6700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let bv = new collections.BitVector(16)
      bv[5] = 1
      bv[10] = 0
      expect(bv[5]).assertEqual(1)
      expect(bv[10]).assertEqual(0)
    })

    /**
     * @tc.name   BitVectorTest6800
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_1204
     * @tc.desc   Verify BitVector index accessor with out of bounds index throws error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BitVectorTest6800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let bv = new collections.BitVector(16)
      try {
        let v = bv[16]
      } catch (e) {
        expect(e !== null).assertTrue()
      }
    })

    /**
     * @tc.name   testBitVectorIndex0001
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_1205
     * @tc.desc   BitVector [index] access first element (index=0) test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorIndex0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorIndex0001";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        bitVectorList.push(1);
        bitVectorList.push(0);
        bitVectorList.push(1);
        expect(bitVectorList[0]).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testBitVectorIndex0002
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_1206
     * @tc.desc   BitVector [index] access last element (index=length-1) test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorIndex0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorIndex0002";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        bitVectorList.push(0);
        bitVectorList.push(1);
        bitVectorList.push(0);
        expect(bitVectorList[bitVectorList.length - 1]).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testBitVectorIndex0003
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_1207
     * @tc.desc   BitVector [index] return value type validation (number) test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorIndex0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorIndex0003";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        bitVectorList.push(0);
        bitVectorList.push(1);
        let value0 = bitVectorList[0];
        let value1 = bitVectorList[1];
        expect(typeof value0).assertEqual("number");
        expect(typeof value1).assertEqual("number");
        expect(value0 === 0 || value0 === 1).assertTrue();
        expect(value1 === 0 || value1 === 1).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testBitVectorIndex0004
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_1208
     * @tc.desc   BitVector [index] empty BitVector index access test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorIndex0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorIndex0004";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        let value = bitVectorList[0];
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.code).assertEqual(10200001);
      }
      done()
    });

    /**
     * @tc.name   testBitVectorIndex0005
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_1209
     * @tc.desc   BitVector [index] index equals length (out of bounds) test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorIndex0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorIndex0005";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        bitVectorList.push(0);
        bitVectorList.push(1);
        let value = bitVectorList[bitVectorList.length];
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.code).assertEqual(10200001);
      }
      done()
    });

    /**
     * @tc.name   testBitVectorIndex0006
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_1210
     * @tc.desc   BitVector [index] large index value (out of bounds) test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorIndex0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorIndex0006";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        bitVectorList.push(0);
        bitVectorList.push(1);
        let value = bitVectorList[100000];
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.code).assertEqual(10200001);
      }
      done()
    });

    /**
     * @tc.name   testBitVectorIndex0007
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_1211
     * @tc.desc   BitVector [index] negative index (-1) test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorIndex0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorIndex0007";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        bitVectorList.push(0);
        bitVectorList.push(1);
        let value = bitVectorList[-1];
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.code).assertEqual(10200001);
      }
      done()
    });

    /**
     * @tc.name   testBitVectorIndex0008
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_1212
     * @tc.desc   BitVector [index] NaN as index test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorIndex0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorIndex0008";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        bitVectorList.push(0);
        bitVectorList.push(1);
        let value = bitVectorList[NaN];
        expect(value).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testBitVectorIndex0009
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_1213
     * @tc.desc   BitVector [index] Infinity as index test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorIndex0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorIndex0009";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        bitVectorList.push(0);
        bitVectorList.push(1);
        let value = bitVectorList[Infinity];
        expect(value).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testBitVectorIndex0010
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_1214
     * @tc.desc   BitVector [index] float number (1.5) as index test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorIndex0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorIndex0010";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        bitVectorList.push(0);
        bitVectorList.push(1);
        bitVectorList.push(0);
        let value = bitVectorList[1.5];
        expect(value).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testBitVectorIndex0014
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_1215
     * @tc.desc   BitVector [index] multiple indices access test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorIndex0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorIndex0014";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        for (let i = 0; i < 10; i++) {
          if (i % 2 === 0) {
            bitVectorList.push(0);
          } else {
            bitVectorList.push(1);
          }
        }
        for (let i = 0; i < 10; i++) {
          expect(bitVectorList[i]).assertEqual(i % 2);
        }
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testBitVectorIndex0015
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_1216
     * @tc.desc   BitVector [index] with constructor initial length test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorIndex0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorIndex0015";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(10);
        for (let i = 0; i < 10; i++) {
          expect(bitVectorList[i]).assertEqual(0);
        }
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testBitVectorIndexBoundary0001
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_1217
     * @tc.desc   BitVector [index] first element index=0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorIndexBoundary0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        bitVectorList.push(1);
        bitVectorList.push(0);
        bitVectorList.push(1);
        expect(bitVectorList[0]).assertEqual(1);
        done()
      });

    /**
     * @tc.name   testBitVectorIndexBoundary0002
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_1218
     * @tc.desc   BitVector [index] last element index=length-1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorIndexBoundary0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        bitVectorList.push(0);
        bitVectorList.push(1);
        bitVectorList.push(0);
        bitVectorList.push(1);
        bitVectorList.push(0);
        expect(bitVectorList[4]).assertEqual(0);
        done()
      });

    /**
     * @tc.name   testBitVectorIndexBoundary0003
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_1219
     * @tc.desc   BitVector [index] out of range index=length, expect error 10200001.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorIndexBoundary0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        bitVectorList.push(1);
        bitVectorList.push(0);
        bitVectorList.push(1);
        try {
          let value = bitVectorList[3];
          expect().assertFail();
        } catch (err) {
          expect(err.code).assertEqual(10200001);
        }
        done()
      });

    /**
     * @tc.name   testBitVectorIndexBoundary0004
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_1220
     * @tc.desc   BitVector [index] single element access index=0 and index=1 out of range.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorIndexBoundary0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        bitVectorList.push(1);
        expect(bitVectorList[0]).assertEqual(1);
        try {
          let value = bitVectorList[1];
          expect().assertFail();
        } catch (err) {
          expect(err.code).assertEqual(10200001);
        }
        done()
      });

    /**
     * @tc.name   testBitVectorEmptyBoundary0009
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_1221
     * @tc.desc   BitVector empty: [0] on empty BitVector throws error 10200001.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorEmptyBoundary0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        try {
          let value = bitVectorList[0];
          expect().assertFail();
        } catch (err) {
          expect(err.code).assertEqual(10200001);
        }
        expect(bitVectorList.length).assertEqual(0);
        done()
      });

    /**
     * @tc.name   testBitVector64Boundary0013
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_1222
     * @tc.desc   BitVector 64 boundary: [index] access at boundary indices 63, 64, 65 out of range.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVector64Boundary0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        for (let i = 0; i < 65; i++) {
          bitVectorList.push(i % 2);
        }
        expect(bitVectorList[63]).assertEqual(1);
        expect(bitVectorList[64]).assertEqual(0);
        try {
          let value = bitVectorList[65];
          expect().assertFail();
        } catch (err) {
          expect(err.code).assertEqual(10200001);
        }
        done()
      });

  })
}
