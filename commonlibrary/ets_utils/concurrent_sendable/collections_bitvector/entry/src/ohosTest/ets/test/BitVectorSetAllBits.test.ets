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

export default function BitVectorSetAllBitsTest() {
  describe('BitVectorSetAllBitsTest', () => {
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
     * @tc.name   BitVector_setAllBits_Func_001
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0351
     * @tc.desc   Sets all of bits in a bit vector to a particular element.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("BitVector_setAllBits_Func_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        let bitVector = new collections.BitVector(0);
        bitVector.push(1);
        bitVector.push(1);
        bitVector.push(1);
        bitVector.push(1);
        bitVector.push(1);
        bitVector.setAllBits(0);
        expect(bitVector[0]).assertEqual(0);
        expect(bitVector[1]).assertEqual(0);
        expect(bitVector[2]).assertEqual(0);
        expect(bitVector[3]).assertEqual(0);
        expect(bitVector[4]).assertEqual(0);
        bitVector.setAllBits(1);
        expect(bitVector[0]).assertEqual(1);
        expect(bitVector[1]).assertEqual(1);
        expect(bitVector[2]).assertEqual(1);
        expect(bitVector[3]).assertEqual(1);
        expect(bitVector[4]).assertEqual(1);
    });
    /**
     * @tc.name   BitVector_setAllBits_Func_002
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0352
     * @tc.desc   Sets all of bits in a bit vector to a particular element.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("BitVector_setAllBits_Func_002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        let bitVector = new collections.BitVector(0);
        let bitVectorLength = 64;
        for (let i = 0; i < bitVectorLength; i++) {
          let res0 = bitVector.push(0);
          expect(res0).assertEqual(true);
        }
        expect(bitVector.length).assertEqual(64);
        bitVector.setAllBits(1);
        for (let i = 0; i < bitVectorLength; i++) {
          expect(bitVector[i]).assertEqual(1);
        }
        bitVector.setAllBits(0);
        for (let i = 0; i < bitVectorLength; i++) {
          expect(bitVector[i]).assertEqual(0);
        }
    });
    /**
     * @tc.name   BitVector_setAllBits_Func_003
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0353
     * @tc.desc   Sets all of bits in a bit vector to a particular element.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("BitVector_setAllBits_Func_003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        let bitVector = new collections.BitVector(10);
        let bitVectorLength = 64;
        for (let i = 0; i < bitVectorLength; i++) {
          let res0 = bitVector.push(0);
          expect(res0).assertEqual(true);
        }
        expect(bitVector.length).assertEqual(bitVectorLength + 10);
        bitVector.setAllBits(1);
        for (let i = 10; i < bitVectorLength + 10; i++) {
          expect(bitVector[i]).assertEqual(1);
        }
        bitVector.setAllBits(0);
        for (let i = 10; i < bitVectorLength + 10; i++) {
          expect(bitVector[i]).assertEqual(0);
        }
    });

    /**
     * @tc.name   BitVectorTest3400
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0354
     * @tc.desc   Verify BitVector setAllBits sets all bits to 0 1 and non-zero value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BitVectorTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let bv = new collections.BitVector(16)
      bv.setAllBits(0)
      for (let i = 0; i < 16; i++) {
        expect(bv[i]).assertEqual(0)
      }
      bv.setAllBits(1)
      for (let i = 0; i < 16; i++) {
        expect(bv[i]).assertEqual(1)
      }
      bv.setAllBits(2)
      for (let i = 0; i < 16; i++) {
        expect(bv[i]).assertEqual(1)
      }
    })

    /**
     * @tc.name   BitVectorTest3500
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0355
     * @tc.desc   Verify BitVector setAllBits with negative non-zero value sets all bits to 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BitVectorTest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let bv = new collections.BitVector(16)
      bv.setAllBits(-1)
      for (let i = 0; i < 16; i++) {
        expect(bv[i]).assertEqual(1)
      }
    })

    /**
     * @tc.name   BitVectorTest3600
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0356
     * @tc.desc   Verify BitVector setAllBits returns void undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BitVectorTest3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let bv = new collections.BitVector(16)
      let result = bv.setAllBits(1)
      expect(result).assertUndefined()
    })

    /**
     * @tc.name   BitVectortest01400
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0357
     * @tc.desc   BitVector setAllBits 10200011
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BitVectortest01400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'BitVectortest01400';
        let flag: boolean = false;
        console.info(`${caseName} test start`);
        try {
          let bitVector: collections.BitVector = new collections.BitVector(0);
          bitVector.push(0);
          bitVector.push(1);
          bitVector.push(0);
          bitVector.push(1);
          bitVector.push(0);
          let setAllBitsMethod = bitVector.setAllBits;
          setAllBitsMethod(1)
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
     * @tc.name   testBitVectorSetAllBits0001
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0358
     * @tc.desc   Testing the SetAllBits of bitVector, set 0, return 0(all).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorSetAllBits0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorSetAllBits0001";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        for (let i = 0; i < 10; i++) {
          if (i < 5) {
            bitVectorList.push(0);
          } else {
            bitVectorList.push(1);
          }
        }
        bitVectorList.setAllBits(0);
        for (let i = 0; i < 10; i++) {
          expect(bitVectorList[i].toString()).assertEqual("0");
        }
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testBitVectorSetAllBits0002
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0359
     * @tc.desc   Testing the SetAllBits of bitVector, set 1, return 1(all).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorSetAllBits0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorSetAllBits0002";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        for (let i = 0; i < 10; i++) {
          if (i < 5) {
            bitVectorList.push(0);
          } else {
            bitVectorList.push(1);
          }
        }
        bitVectorList.setAllBits(1);
        for (let i = 0; i < 10; i++) {
          expect(bitVectorList[i].toString()).assertEqual("1");
        }
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testBitVectorSetAllBits0003
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0360
     * @tc.desc   Testing the SetAllBits of bitVector, set -1, return 1(all).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorSetAllBits0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorSetAllBits0003";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        for (let i = 0; i < 10; i++) {
          if (i < 5) {
            bitVectorList.push(0);
          } else {
            bitVectorList.push(1);
          }
        }
        bitVectorList.setAllBits(-1);
        for (let i = 0; i < 10; i++) {
          expect(bitVectorList[i].toString()).assertEqual("1");
        }
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testBitVectorSetAllBits0004
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0361
     * @tc.desc   Testing the SetAllBits of bitVector, set 65535, return 1(all).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorSetAllBits0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorSetAllBits0004";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        for (let i = 0; i < 10; i++) {
          if (i < 5) {
            bitVectorList.push(0);
          } else {
            bitVectorList.push(1);
          }
        }
        bitVectorList.setAllBits(65535);
        for (let i = 0; i < 10; i++) {
          expect(bitVectorList[i].toString()).assertEqual("1");
        }
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testBitVectorSetAllBits0005
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0362
     * @tc.desc   Testing the SetAllBits of bitVector, set 2.5, return 1(all).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorSetAllBits0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorSetAllBits0005";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        for (let i = 0; i < 10; i++) {
          if (i < 5) {
            bitVectorList.push(0);
          } else {
            bitVectorList.push(1);
          }
        }
        bitVectorList.setAllBits(2.5);
        for (let i = 0; i < 10; i++) {
          expect(bitVectorList[i].toString()).assertEqual("1");
        }
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testBitVectorSetAllBits0007
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0363
     * @tc.desc   BitVector setAllBits with extra parameters test, extra params should be ignored.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorSetAllBits0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorSetAllBits0007";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        bitVectorList.push(0);
        bitVectorList.push(0);
        bitVectorList.push(0);
        bitVectorList.setAllBits(1);
        expect(bitVectorList[0]).assertEqual(1);
        expect(bitVectorList[1]).assertEqual(1);
        expect(bitVectorList[2]).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testBitVectorSetAllBits0015
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0364
     * @tc.desc   BitVector setAllBits return value void verification and large BitVector test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorSetAllBits0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorSetAllBits0015";
      try {
        let emptyBitVector: collections.BitVector = new collections.BitVector(0);
        emptyBitVector.setAllBits(0);
        expect(emptyBitVector.length).assertEqual(0);
        let largeBitVector: collections.BitVector = new collections.BitVector(0);
        for (let i = 0; i < 1000; i++) {
          largeBitVector.push(i % 2);
        }
        largeBitVector.setAllBits(1);
        expect(largeBitVector.length).assertEqual(1000);
        for (let i = 0; i < 10; i++) {
          expect(largeBitVector[i]).assertEqual(1);
          expect(largeBitVector[999 - i]).assertEqual(1);
        }
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testBitVectorSetAllBitsBoundary0001
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0365
     * @tc.desc   BitVector setAllBits on empty BitVector, length remains 0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorSetAllBitsBoundary0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        bitVectorList.setAllBits(1);
        expect(bitVectorList.length).assertEqual(0);
        done()
      });

    /**
     * @tc.name   testBitVectorSetAllBitsBoundary0002
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0366
     * @tc.desc   BitVector setAllBits on single element BitVector.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorSetAllBitsBoundary0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        bitVectorList.push(0);
        bitVectorList.setAllBits(1);
        expect(bitVectorList.length).assertEqual(1);
        expect(bitVectorList[0]).assertEqual(1);
        bitVectorList.setAllBits(0);
        expect(bitVectorList[0]).assertEqual(0);
        done()
      });

    /**
     * @tc.name   testBitVectorSetAllBitsValueBoundary0001
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0367
     * @tc.desc   BitVector setAllBits(-1) on all 0s, all become 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorSetAllBitsValueBoundary0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        for (let i = 0; i < 5; i++) {
          bitVectorList.push(0);
        }
        bitVectorList.setAllBits(-1);
        for (let i = 0; i < 5; i++) {
          expect(bitVectorList[i]).assertEqual(1);
        }
        done()
      });

    /**
     * @tc.name   testBitVectorSetAllBitsValueBoundary0002
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0368
     * @tc.desc   BitVector setAllBits(2) on all 0s, all become 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorSetAllBitsValueBoundary0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        for (let i = 0; i < 5; i++) {
          bitVectorList.push(0);
        }
        bitVectorList.setAllBits(2);
        for (let i = 0; i < 5; i++) {
          expect(bitVectorList[i]).assertEqual(1);
        }
        done()
      });

    /**
     * @tc.name   testBitVectorSetAllBitsValueBoundary0003
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0369
     * @tc.desc   BitVector setAllBits(65535) on all 0s, all become 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorSetAllBitsValueBoundary0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        for (let i = 0; i < 5; i++) {
          bitVectorList.push(0);
        }
        bitVectorList.setAllBits(65535);
        for (let i = 0; i < 5; i++) {
          expect(bitVectorList[i]).assertEqual(1);
        }
        done()
      });

    /**
     * @tc.name   testBitVectorSetAllBitsValueBoundary0004
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0370
     * @tc.desc   BitVector setAllBits(-65535) on all 0s, all become 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorSetAllBitsValueBoundary0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        for (let i = 0; i < 5; i++) {
          bitVectorList.push(0);
        }
        bitVectorList.setAllBits(-65535);
        for (let i = 0; i < 5; i++) {
          expect(bitVectorList[i]).assertEqual(1);
        }
        done()
      });

    /**
     * @tc.name   testBitVectorRepeatCall0006
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0371
     * @tc.desc   BitVector repeat call: setAllBits 3 times (0->1->0->1).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorRepeatCall0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        for (let i = 0; i < 5; i++) {
          bitVectorList.push(0);
        }
        bitVectorList.setAllBits(1);
        for (let i = 0; i < 5; i++) {
          expect(bitVectorList[i]).assertEqual(1);
        }
        bitVectorList.setAllBits(0);
        for (let i = 0; i < 5; i++) {
          expect(bitVectorList[i]).assertEqual(0);
        }
        bitVectorList.setAllBits(1);
        for (let i = 0; i < 5; i++) {
          expect(bitVectorList[i]).assertEqual(1);
        }
        done()
      });

    /**
     * @tc.name   testBitVector64Boundary0014
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0372
     * @tc.desc   BitVector 64 boundary: setAllBits on exactly 64 elements, verify all set.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVector64Boundary0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        for (let i = 0; i < 64; i++) {
          bitVectorList.push(0);
        }
        bitVectorList.setAllBits(1);
        for (let i = 0; i < 64; i++) {
          expect(bitVectorList[i]).assertEqual(1);
        }
        bitVectorList.setAllBits(0);
        for (let i = 0; i < 64; i++) {
          expect(bitVectorList[i]).assertEqual(0);
        }
        done()
      });

    /**
     * @tc.name   testBitVector128Boundary0010
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0373
     * @tc.desc   BitVector 128 boundary: setAllBits + values() on exactly 128 elements.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVector128Boundary0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        for (let i = 0; i < 128; i++) {
          bitVectorList.push(0);
        }
        bitVectorList.setAllBits(1);
        let iter = bitVectorList.values();
        let count = 0;
        let temp = iter.next();
        while (!temp.done) {
          expect(temp.value).assertEqual(1);
          count++;
          temp = iter.next();
        }
        expect(count).assertEqual(128);
        done()
      });

    /**
     * @tc.name   testBitVector1024Boundary0007
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0374
     * @tc.desc   BitVector 1024 boundary: flipBitByIndex + [index] + setAllBits at 1024 boundary.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVector1024Boundary0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        for (let i = 0; i < 1025; i++) {
          bitVectorList.push(0);
        }
        bitVectorList.flipBitByIndex(1023);
        bitVectorList.flipBitByIndex(1024);
        expect(bitVectorList[1023]).assertEqual(1);
        expect(bitVectorList[1024]).assertEqual(1);
        expect(bitVectorList[1022]).assertEqual(0);
        bitVectorList.setAllBits(1);
        expect(bitVectorList[1023]).assertEqual(1);
        expect(bitVectorList[1024]).assertEqual(1);
        bitVectorList.setAllBits(0);
        expect(bitVectorList[1023]).assertEqual(0);
        expect(bitVectorList[1024]).assertEqual(0);
        done()
      });

    /**
     * @tc.name   testBitVectorConstructorNonBinaryValue0003
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0375
     * @tc.desc   BitVector constructor cap=128, setAllBits with non-0/1 values, verify all stored as 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorConstructorNonBinaryValue0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let bitVectorList: collections.BitVector = new collections.BitVector(128);
        bitVectorList.setAllBits(-1);
        expect(bitVectorList[0]).assertEqual(1);
        expect(bitVectorList[63]).assertEqual(1);
        expect(bitVectorList[64]).assertEqual(1);
        expect(bitVectorList[127]).assertEqual(1);
        bitVectorList.setAllBits(65535);
        expect(bitVectorList[0]).assertEqual(1);
        expect(bitVectorList[127]).assertEqual(1);
        done()
      });
  });
}
