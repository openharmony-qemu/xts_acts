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

export default function BitVectorConstructorTest() {
  describe('BitVectorConstructorTest', () => {
    beforeAll(() => {})
    beforeEach(() => {})
    afterEach(() => {})
    afterAll(() => {})

    /**
     * @tc.name   BitVector_constructor_Func_001
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0001
     * @tc.desc   A constructor used to create a BitVector object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("BitVector_constructor_Func_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
        let bitVector = new collections.BitVector(10);
        expect(bitVector.length).assertEqual(10);
    });

    /**
     * @tc.name   BitVector_constructor_Func_002
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0002
     * @tc.desc   A constructor used to create a BitVector object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("BitVector_constructor_Func_002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        let tmp:string = "a";
        let a:number = JSON.parse(JSON.stringify(tmp)) as number;
        try {
          let bitVector = new collections.BitVector(a);
          expect(true).assertEqual(false);
        } catch (err) {
          expect(err.name).assertEqual(`BusinessError`);
          expect(err.code).assertEqual(401);
          expect(err.message)
            .assertEqual(`The type of "length" must be integer. Received value is: a`);
        }
    });

    /**
     * @tc.name   BitVectorTest0100
     * @tc.number SUB_COLLECTIONS_BITVECTOR_TEST_0100
     * @tc.desc   Verify BitVector constructor with length 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BitVectorTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let bv = new collections.BitVector(0)
      expect(bv.length).assertEqual(0)
    })

    /**
     * @tc.name   BitVectorTest0200
     * @tc.number SUB_COLLECTIONS_BITVECTOR_TEST_0200
     * @tc.desc   Verify BitVector constructor with various normal number values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BitVectorTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let bv1 = new collections.BitVector(1)
      let bv2 = new collections.BitVector(8)
      let bv3 = new collections.BitVector(1024)
      expect(bv1.length).assertEqual(1)
      expect(bv2.length).assertEqual(8)
      expect(bv3.length).assertEqual(1024)
    })

    /**
     * @tc.name   BitVectorTest0300
     * @tc.number SUB_COLLECTIONS_BITVECTOR_TEST_0300
     * @tc.desc   Verify BitVector constructor with large length value 1000000
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BitVectorTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let bv = new collections.BitVector(1000000)
      expect(bv.length).assertEqual(1000000)
    })

    /**
     * @tc.name   BitVectorTest0400
     * @tc.number SUB_COLLECTIONS_BITVECTOR_TEST_0400
     * @tc.desc   Verify BitVector constructor with float throws error 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BitVectorTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      try {
        let bv = new collections.BitVector(10.5)
        expect().assertFail()
      } catch (e) {
        expect(e.code).assertEqual(401)
      }
    })

    /**
     * @tc.name   BitVectorTest0500
     * @tc.number SUB_COLLECTIONS_BITVECTOR_TEST_0500
     * @tc.desc   Verify BitVector constructor with negative length behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BitVectorTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      try {
        let bv = new collections.BitVector(-1)
        expect(bv.length).assertEqual(0)
      } catch (e) {
        expect(e.code).assertEqual(401)
      }
    })

    /**
     * @tc.name   BitVectorTest0600
     * @tc.number SUB_COLLECTIONS_BITVECTOR_TEST_0600
     * @tc.desc   Verify BitVector constructor with NaN throws error 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BitVectorTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      try {
        let bv = new collections.BitVector(NaN)
        expect().assertFail()
      } catch (e) {
        expect(e.code).assertEqual(401)
      }
    })

    /**
     * @tc.name   BitVectorTest0700
     * @tc.number SUB_COLLECTIONS_BITVECTOR_TEST_0700
     * @tc.desc   Verify BitVector constructor with Infinity throws error 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BitVectorTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      try {
        let bv = new collections.BitVector(Infinity)
        expect().assertFail()
      } catch (e) {
        expect(e.code).assertEqual(401)
      }
    })

    /**
     * @tc.name   BitVectorTest0800
     * @tc.number SUB_COLLECTIONS_BITVECTOR_TEST_0800
     * @tc.desc   Verify BitVector constructor with Infinity minus negative value throws error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BitVectorTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      try {
        let bv = new collections.BitVector(-Infinity)
        expect().assertFail()
      } catch (e) {
        expect(e.code).assertEqual(401)
      }
    })

    /**
     * @tc.name   BitVectorTest0900
     * @tc.number SUB_COLLECTIONS_BITVECTOR_TEST_0900
     * @tc.desc   Verify BitVector all bits default to 0 after construction
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BitVectorTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let bv = new collections.BitVector(16)
      for (let i = 0; i < bv.length; i++) {
        expect(bv[i]).assertEqual(0)
      }
    })

    /**
     * @tc.name   BitVectortest0100
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_0100
     * @tc.desc   BitVector constructor 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BitVectortest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'BitVectortest0100';
        console.info(`${caseName} test start`);
        let flag: boolean = false;

        try {
          const bitVector = new collections.BitVector(NaN);
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
     * @tc.name   testBitVectorConstructor0001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_1000
     * @tc.desc   Testing the constructor of bitVector, length is -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorConstructor0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorConstructor0001";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(-1);
        expect(bitVectorList.length).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testBitVectorConstructor0002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_1010
     * @tc.desc   Testing the constructor of bitVector, length is 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorConstructor0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorConstructor0002";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        expect(bitVectorList.length).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testBitVectorConstructor0003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_1020
     * @tc.desc   Testing the constructor of bitVector, length is 10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorConstructor0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorConstructor0003";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(10);
        expect(bitVectorList.length).assertEqual(10);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testBitVectorConstructor0004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_1030
     * @tc.desc   Testing the constructor of bitVector, length is 100000
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorConstructor0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorConstructor0004";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(100000);
        expect(bitVectorList.length).assertEqual(100000);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testBitVectorConstructor0008
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_1040
     * @tc.desc   Testing the constructor of bitVector, NaN parameter test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorConstructor0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorConstructor0008";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(NaN);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.code).assertEqual(401);
      }
      done()
    });

    /**
     * @tc.name   testBitVectorConstructor0009
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_1050
     * @tc.desc   Testing the constructor of bitVector, Infinity parameter test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorConstructor0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorConstructor0009";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(Infinity);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.code).assertEqual(401);
      }
      done()
    });

    /**
     * @tc.name   testBitVectorConstructor0010
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_1060
     * @tc.desc   Testing the constructor of bitVector, -Infinity parameter test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorConstructor0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorConstructor0010";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(-Infinity);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.code).assertEqual(401);
      }
      done()
    });

    /**
     * @tc.name   testBitVectorConstructor0012
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_1070
     * @tc.desc   Testing the constructor of bitVector, float 0.5 parameter test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorConstructor0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorConstructor0012";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(0.5);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.code).assertEqual(401);
      }
      done()
    });

    /**
     * @tc.name   testBitVectorConstructor0013
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_1080
     * @tc.desc   Testing the constructor of bitVector, instance type validation test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorConstructor0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorConstructor0013";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(10);
        expect(bitVectorList instanceof collections.BitVector).assertTrue();
        expect(typeof bitVectorList.length).assertEqual("number");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testBitVectorContainerSizeBoundary0001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_4410
     * @tc.desc   BitVector container size=0 (empty), length=0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorContainerSizeBoundary0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        expect(bitVectorList.length).assertEqual(0);
        done()
      });

    /**
     * @tc.name   testBitVectorConstructorCapacity0001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_5000
     * @tc.desc   BitVector constructor capacity=64, verify length=64 and all elements 0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorConstructorCapacity0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let bitVectorList: collections.BitVector = new collections.BitVector(64);
        expect(bitVectorList.length).assertEqual(64);
        for (let i = 0; i < 64; i++) {
          expect(bitVectorList[i]).assertEqual(0);
        }
        done()
      });

    /**
     * @tc.name   testBitVectorConstructorCapacity0002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_5010
     * @tc.desc   BitVector constructor capacity=64, setAllBits(1) then verify all 1s, setAllBits(0) then verify all 0s.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorConstructorCapacity0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let bitVectorList: collections.BitVector = new collections.BitVector(64);
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
     * @tc.name   testBitVectorConstructorCapacity0003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_5020
     * @tc.desc   BitVector constructor capacity=64, push(1) then verify length=65 and crossing word boundary.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorConstructorCapacity0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let bitVectorList: collections.BitVector = new collections.BitVector(64);
        bitVectorList.push(1);
        expect(bitVectorList.length).assertEqual(65);
        expect(bitVectorList[63]).assertEqual(0);
        expect(bitVectorList[64]).assertEqual(1);
        done()
      });

    /**
     * @tc.name   testBitVectorConstructorCapacity0004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_5030
     * @tc.desc   BitVector constructor capacity=64, resize(65) then verify crossing word boundary.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorConstructorCapacity0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let bitVectorList: collections.BitVector = new collections.BitVector(64);
        bitVectorList.resize(65);
        expect(bitVectorList.length).assertEqual(65);
        expect(bitVectorList[64]).assertEqual(0);
        done()
      });

    /**
     * @tc.name   testBitVectorConstructorCapacity0005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_5040
     * @tc.desc   BitVector constructor capacity=128, verify length=128 and boundary values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorConstructorCapacity0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let bitVectorList: collections.BitVector = new collections.BitVector(128);
        expect(bitVectorList.length).assertEqual(128);
        expect(bitVectorList[0]).assertEqual(0);
        expect(bitVectorList[63]).assertEqual(0);
        expect(bitVectorList[64]).assertEqual(0);
        expect(bitVectorList[127]).assertEqual(0);
        bitVectorList.setAllBits(1);
        expect(bitVectorList[63]).assertEqual(1);
        expect(bitVectorList[64]).assertEqual(1);
        expect(bitVectorList[127]).assertEqual(1);
        done()
      });

    /**
     * @tc.name   testBitVectorConstructorCapacity0006
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_5050
     * @tc.desc   BitVector constructor capacity=1024, verify length=1024 and boundary values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorConstructorCapacity0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let bitVectorList: collections.BitVector = new collections.BitVector(1024);
        expect(bitVectorList.length).assertEqual(1024);
        expect(bitVectorList[0]).assertEqual(0);
        expect(bitVectorList[63]).assertEqual(0);
        expect(bitVectorList[1023]).assertEqual(0);
        bitVectorList.setAllBits(1);
        expect(bitVectorList[1023]).assertEqual(1);
        done()
      });

    /**
     * @tc.name   testBitVectorConstructorCapacity0007
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_5060
     * @tc.desc   BitVector constructor capacity=1025, verify length=1025 and crossing 1024 boundary.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorConstructorCapacity0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let bitVectorList: collections.BitVector = new collections.BitVector(1025);
        expect(bitVectorList.length).assertEqual(1025);
        expect(bitVectorList[1024]).assertEqual(0);
        bitVectorList.setAllBits(1);
        expect(bitVectorList[1023]).assertEqual(1);
        expect(bitVectorList[1024]).assertEqual(1);
        done()
      });
  })
}
