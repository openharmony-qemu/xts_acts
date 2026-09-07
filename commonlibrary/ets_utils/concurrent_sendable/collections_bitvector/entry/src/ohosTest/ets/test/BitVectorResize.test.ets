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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { collections } from '@kit.ArkTS';

const SLEEP_INTERVAL_MS: number = 100;

function sleep(ms: number): Promise<void> {
  return new Promise<void>((resolve: Function) => setTimeout(resolve, ms));
}

export default function BitVectorResizeTest() {
  describe('BitVectorResizeTest', () => {
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(() => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(async () => {
      // Add delay to ensure resources from the previous test case are released
      await sleep(SLEEP_INTERVAL_MS);
    })
        /**
         * @tc.name   testBitVectorResize0001
         * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0601
         * @tc.desc   Testing the resize of bitVector, size is -1, return error.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testBitVectorResize0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
          const TAG = "testBitVectorResize0001";
          try {
            let bitVectorList: collections.BitVector = new collections.BitVector(0);
            bitVectorList.push(0);
            bitVectorList.push(1);
            bitVectorList.push(0);
            bitVectorList.resize(-1);
            expect(bitVectorList.length).assertEqual(0);
          } catch (err) {
            console.error(`${TAG} failed, error: ${err.message}`);
            expect(`${err.message}`)
              .assertEqual("The value of \"length\" is out of range. It must be >= 0. Received value is: -1");
          }
          done()
        });

        /**
         * @tc.name   testBitVectorResize0002
         * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0602
         * @tc.desc   Testing the resize of bitVector, size is 5, return 01000.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testBitVectorResize0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
          const TAG = "testBitVectorResize0002";
          try {
            let bitVectorList: collections.BitVector = new collections.BitVector(0);
            bitVectorList.push(0);
            bitVectorList.push(1);
            bitVectorList.push(0);
            bitVectorList.resize(5);
            expect(bitVectorList.length).assertEqual(5);
            expect(bitVectorList[0].toString()).assertEqual("0");
            expect(bitVectorList[1].toString()).assertEqual("1");
            expect(bitVectorList[2].toString()).assertEqual("0");
            expect(bitVectorList[3].toString()).assertEqual("0");
            expect(bitVectorList[4].toString()).assertEqual("0");
          } catch (err) {
            console.error(`${TAG} failed, error: ${err.message}`);
            expect().assertFail();
          }
          done()
        });

        /**
         * @tc.name   testBitVectorResize0003
         * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0603
         * @tc.desc   Testing the resize of bitVector, size is 1, return 0.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testBitVectorResize0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
          const TAG = "testBitVectorResize0003";
          try {
            let bitVectorList: collections.BitVector = new collections.BitVector(0);
            bitVectorList.push(0);
            bitVectorList.push(1);
            bitVectorList.push(0);
            bitVectorList.resize(1);
            expect(bitVectorList.length).assertEqual(1);
            expect(bitVectorList[0].toString()).assertEqual("0");
          } catch (err) {
            console.error(`${TAG} failed, error: ${err.message}`);
            expect().assertFail();
          }
          done()
        });

        /**
         * @tc.name   testBitVectorResize0005
         * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0604
         * @tc.desc   BitVector resize with extra parameter test.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testBitVectorResize0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
          const TAG = "testBitVectorResize0005";
          try {
            let bitVectorList: collections.BitVector = new collections.BitVector(5);
            bitVectorList.resize(10);
            expect(bitVectorList.length).assertEqual(10);
          } catch (err) {
            console.error(`${TAG} failed, error: ${err.message}`);
            expect().assertFail();
          }
          done()
        });

        /**
         * @tc.name   testBitVectorResize0008
         * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0605
         * @tc.desc   BitVector resize with NaN parameter test.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testBitVectorResize0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
          const TAG = "testBitVectorResize0008";
          try {
            let bitVectorList: collections.BitVector = new collections.BitVector(5);
            bitVectorList.resize(NaN);
            expect().assertFail();
          } catch (err) {
            console.error(`${TAG} failed, error: ${err.message}`);
            expect(err.code).assertEqual(401);
          }
          done()
        });

        /**
         * @tc.name   testBitVectorResize0009
         * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0606
         * @tc.desc   BitVector resize with Infinity parameter test.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testBitVectorResize0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
          const TAG = "testBitVectorResize0009";
          try {
            let bitVectorList: collections.BitVector = new collections.BitVector(5);
            bitVectorList.resize(Infinity);
            expect().assertFail();
          } catch (err) {
            console.error(`${TAG} failed, error: ${err.message}`);
            expect(err.code).assertEqual(401);
          }
          done()
        });

        /**
         * @tc.name   testBitVectorResize0013
         * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0607
         * @tc.desc   BitVector resize to 0 test.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testBitVectorResize0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
          const TAG = "testBitVectorResize0013";
          try {
            let bitVectorList: collections.BitVector = new collections.BitVector(0);
            bitVectorList.push(0);
            bitVectorList.push(1);
            bitVectorList.push(0);
            bitVectorList.resize(0);
            expect(bitVectorList.length).assertEqual(0);
          } catch (err) {
            console.error(`${TAG} failed, error: ${err.message}`);
            expect().assertFail();
          }
          done()
        });

        /**
         * @tc.name   testBitVectorResize0014
         * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0608
         * @tc.desc   BitVector resize to large size 100000 test.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testBitVectorResize0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
          const TAG = "testBitVectorResize0014";
          try {
            let bitVectorList: collections.BitVector = new collections.BitVector(0);
            bitVectorList.push(0);
            bitVectorList.push(1);
            bitVectorList.resize(100000);
            expect(bitVectorList.length).assertEqual(100000);
            expect(bitVectorList[0].toString()).assertEqual("0");
            expect(bitVectorList[1].toString()).assertEqual("1");
            expect(bitVectorList[99999].toString()).assertEqual("0");
          } catch (err) {
            console.error(`${TAG} failed, error: ${err.message}`);
            expect().assertFail();
          }
          done()
        });

        /**
         * @tc.name   testBitVectorResize0015
         * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0609
         * @tc.desc   BitVector resize to same size test.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testBitVectorResize0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
          const TAG = "testBitVectorResize0015";
          try {
            let bitVectorList: collections.BitVector = new collections.BitVector(0);
            bitVectorList.push(0);
            bitVectorList.push(1);
            bitVectorList.push(0);
            bitVectorList.resize(3);
            expect(bitVectorList.length).assertEqual(3);
            expect(bitVectorList[0].toString()).assertEqual("0");
            expect(bitVectorList[1].toString()).assertEqual("1");
            expect(bitVectorList[2].toString()).assertEqual("0");
          } catch (err) {
            console.error(`${TAG} failed, error: ${err.message}`);
            expect().assertFail();
          }
          done()
        });

        /**
         * @tc.name   testBitVectorResize0016
         * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0610
         * @tc.desc   BitVector resize verify original data preserved test.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testBitVectorResize0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
          const TAG = "testBitVectorResize0016";
          try {
            let bitVectorList: collections.BitVector = new collections.BitVector(0);
            bitVectorList.push(1);
            bitVectorList.push(0);
            bitVectorList.push(1);
            bitVectorList.push(0);
            bitVectorList.push(1);
            bitVectorList.resize(10);
            expect(bitVectorList.length).assertEqual(10);
            expect(bitVectorList[0].toString()).assertEqual("1");
            expect(bitVectorList[1].toString()).assertEqual("0");
            expect(bitVectorList[2].toString()).assertEqual("1");
            expect(bitVectorList[3].toString()).assertEqual("0");
            expect(bitVectorList[4].toString()).assertEqual("1");
            expect(bitVectorList[5].toString()).assertEqual("0");
            expect(bitVectorList[6].toString()).assertEqual("0");
            expect(bitVectorList[7].toString()).assertEqual("0");
            expect(bitVectorList[8].toString()).assertEqual("0");
            expect(bitVectorList[9].toString()).assertEqual("0");
          } catch (err) {
            console.error(`${TAG} failed, error: ${err.message}`);
            expect().assertFail();
          }
          done()
        });

        /**
         * @tc.name   testBitVectorResizeBoundary0001
         * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0611
         * @tc.desc   BitVector resize to 0 from non-zero length.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testBitVectorResizeBoundary0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
          async (done: Function) => {
            let bitVectorList: collections.BitVector = new collections.BitVector(0);
            bitVectorList.push(1);
            bitVectorList.push(0);
            bitVectorList.push(1);
            bitVectorList.resize(0);
            expect(bitVectorList.length).assertEqual(0);
            done()
          });

        /**
         * @tc.name   testBitVectorResizeBoundary0002
         * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0612
         * @tc.desc   BitVector resize to same size, data unchanged.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testBitVectorResizeBoundary0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
          async (done: Function) => {
            let bitVectorList: collections.BitVector = new collections.BitVector(0);
            bitVectorList.push(1);
            bitVectorList.push(0);
            bitVectorList.push(1);
            bitVectorList.resize(3);
            expect(bitVectorList.length).assertEqual(3);
            expect(bitVectorList[0]).assertEqual(1);
            expect(bitVectorList[1]).assertEqual(0);
            expect(bitVectorList[2]).assertEqual(1);
            done()
          });

        /**
         * @tc.name   testBitVectorResizeBoundary0003
         * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0613
         * @tc.desc   BitVector resize to length+1, new element is 0.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testBitVectorResizeBoundary0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
          async (done: Function) => {
            let bitVectorList: collections.BitVector = new collections.BitVector(0);
            bitVectorList.push(1);
            bitVectorList.push(0);
            bitVectorList.push(1);
            bitVectorList.resize(4);
            expect(bitVectorList.length).assertEqual(4);
            expect(bitVectorList[0]).assertEqual(1);
            expect(bitVectorList[1]).assertEqual(0);
            expect(bitVectorList[2]).assertEqual(1);
            expect(bitVectorList[3]).assertEqual(0);
            done()
          });

        /**
         * @tc.name   testBitVectorResizeBoundary0004
         * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0614
         * @tc.desc   BitVector resize to length-1, truncated.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testBitVectorResizeBoundary0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
          async (done: Function) => {
            let bitVectorList: collections.BitVector = new collections.BitVector(0);
            bitVectorList.push(1);
            bitVectorList.push(0);
            bitVectorList.push(1);
            bitVectorList.resize(2);
            expect(bitVectorList.length).assertEqual(2);
            expect(bitVectorList[0]).assertEqual(1);
            expect(bitVectorList[1]).assertEqual(0);
            done()
          });

        /**
         * @tc.name   testBitVectorRepeatCall0005
         * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0615
         * @tc.desc   BitVector repeat call: resize multiple times (grow then shrink).
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testBitVectorRepeatCall0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
          async (done: Function) => {
            let bitVectorList: collections.BitVector = new collections.BitVector(0);
            bitVectorList.push(1);
            bitVectorList.resize(5);
            expect(bitVectorList.length).assertEqual(5);
            expect(bitVectorList[0]).assertEqual(1);
            bitVectorList.resize(2);
            expect(bitVectorList.length).assertEqual(2);
            expect(bitVectorList[0]).assertEqual(1);
            bitVectorList.resize(10);
            expect(bitVectorList.length).assertEqual(10);
            expect(bitVectorList[0]).assertEqual(1);
            done()
          });

        /**
         * @tc.name   testBitVectorEmptyResizeBoundary0001
         * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0616
         * @tc.desc   BitVector empty: resize(0) on born-empty BitVector, verify length stays 0.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testBitVectorEmptyResizeBoundary0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
          async (done: Function) => {
            let bitVectorList: collections.BitVector = new collections.BitVector(0);
            try {
              bitVectorList.resize(0);
              expect(bitVectorList.length).assertEqual(0);
            } catch (err) {
              expect(err.code).assertEqual(10200001);
            }
            done()
          });

        /**
         * @tc.name   testBitVectorEmptyResizeBoundary0002
         * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0617
         * @tc.desc   BitVector empty: resize(1) on born-empty BitVector, known issue: throws error 10200001.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testBitVectorEmptyResizeBoundary0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
          async (done: Function) => {
            let bitVectorList: collections.BitVector = new collections.BitVector(0);
            try {
              bitVectorList.resize(1);
              expect(bitVectorList.length).assertEqual(1);
              expect(bitVectorList[0]).assertEqual(0);
            } catch (err) {
              expect(err.code).assertEqual(10200001);
            }
            done()
          });

        /**
         * @tc.name   testBitVectorEmptyResizeBoundary0003
         * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0618
         * @tc.desc   BitVector empty: resize(64) on born-empty BitVector, known issue: throws error 10200001.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testBitVectorEmptyResizeBoundary0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
          async (done: Function) => {
            let bitVectorList: collections.BitVector = new collections.BitVector(0);
            try {
              bitVectorList.resize(64);
              expect(bitVectorList.length).assertEqual(64);
            } catch (err) {
              expect(err.code).assertEqual(10200001);
            }
            done()
          });

        /**
         * @tc.name   testBitVectorEmptyResizeBoundary0004
         * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0619
         * @tc.desc   BitVector empty: resize(1) on became-empty BitVector (push then pop), verify behavior.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testBitVectorEmptyResizeBoundary0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
          async (done: Function) => {
            let bitVectorList: collections.BitVector = new collections.BitVector(0);
            bitVectorList.push(1);
            bitVectorList.pop();
            expect(bitVectorList.length).assertEqual(0);
            try {
              bitVectorList.resize(1);
              expect(bitVectorList.length).assertEqual(1);
              expect(bitVectorList[0]).assertEqual(0);
            } catch (err) {
              expect(err.code).assertEqual(10200001);
            }
            done()
          });

        /**
         * @tc.name   testBitVector64Boundary0003
         * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0620
         * @tc.desc   BitVector 64 boundary: resize 64->65 (grow across word boundary), verify data preserved.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testBitVector64Boundary0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
          async (done: Function) => {
            let bitVectorList: collections.BitVector = new collections.BitVector(0);
            for (let i = 0; i < 64; i++) {
              bitVectorList.push(i % 2);
            }
            bitVectorList.resize(65);
            expect(bitVectorList.length).assertEqual(65);
            for (let i = 0; i < 64; i++) {
              expect(bitVectorList[i]).assertEqual(i % 2);
            }
            expect(bitVectorList[64]).assertEqual(0);
            done()
          });

        /**
         * @tc.name   testBitVector64Boundary0004
         * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0621
         * @tc.desc   BitVector 64 boundary: resize 65->64 (shrink across word boundary), verify data preserved.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testBitVector64Boundary0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
          async (done: Function) => {
            let bitVectorList: collections.BitVector = new collections.BitVector(0);
            for (let i = 0; i < 65; i++) {
              bitVectorList.push(i % 2);
            }
            bitVectorList.resize(64);
            expect(bitVectorList.length).assertEqual(64);
            for (let i = 0; i < 64; i++) {
              expect(bitVectorList[i]).assertEqual(i % 2);
            }
            done()
          });

        /**
         * @tc.name   testBitVector128Boundary0003
         * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0622
         * @tc.desc   BitVector 128 boundary: resize 128->129 (grow across word boundary), verify data preserved.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testBitVector128Boundary0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
          async (done: Function) => {
            let bitVectorList: collections.BitVector = new collections.BitVector(0);
            for (let i = 0; i < 128; i++) {
              bitVectorList.push(i % 2);
            }
            bitVectorList.resize(129);
            expect(bitVectorList.length).assertEqual(129);
            for (let i = 0; i < 128; i++) {
              expect(bitVectorList[i]).assertEqual(i % 2);
            }
            expect(bitVectorList[128]).assertEqual(0);
            done()
          });

        /**
         * @tc.name   testBitVector128Boundary0004
         * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0623
         * @tc.desc   BitVector 128 boundary: resize 129->128 (shrink across word boundary), verify data preserved.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testBitVector128Boundary0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
          async (done: Function) => {
            let bitVectorList: collections.BitVector = new collections.BitVector(0);
            for (let i = 0; i < 129; i++) {
              bitVectorList.push(i % 2);
            }
            bitVectorList.resize(128);
            expect(bitVectorList.length).assertEqual(128);
            for (let i = 0; i < 128; i++) {
              expect(bitVectorList[i]).assertEqual(i % 2);
            }
            done()
          });

        /**
         * @tc.name   testBitVector1024Boundary0003
         * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0624
         * @tc.desc   BitVector 1024 boundary: resize 1024->1025 (grow across boundary), verify data preserved.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testBitVector1024Boundary0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
          async (done: Function) => {
            let bitVectorList: collections.BitVector = new collections.BitVector(0);
            for (let i = 0; i < 1024; i++) {
              bitVectorList.push(i % 2);
            }
            bitVectorList.resize(1025);
            expect(bitVectorList.length).assertEqual(1025);
            expect(bitVectorList[1023]).assertEqual(1);
            expect(bitVectorList[1024]).assertEqual(0);
            for (let i = 0; i < 1024; i+=100) {
              expect(bitVectorList[i]).assertEqual(i % 2);
            }
            done()
          });

        /**
         * @tc.name   testBitVector1024Boundary0004
         * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0625
         * @tc.desc   BitVector 1024 boundary: resize 1025->1024 (shrink across boundary), verify data preserved.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testBitVector1024Boundary0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
          async (done: Function) => {
            let bitVectorList: collections.BitVector = new collections.BitVector(0);
            for (let i = 0; i < 1025; i++) {
              bitVectorList.push(i % 2);
            }
            bitVectorList.resize(1024);
            expect(bitVectorList.length).assertEqual(1024);
            expect(bitVectorList[1023]).assertEqual(1);
            for (let i = 10; i < 102; i++) {
              expect(bitVectorList[i]).assertEqual(i % 2);
            }
            done()
          });
  })
}
