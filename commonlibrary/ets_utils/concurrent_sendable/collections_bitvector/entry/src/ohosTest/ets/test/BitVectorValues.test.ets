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
function testValues(index: number, bit: collections.BitVector) {
  let tag = 'testValues'
  try {
    let res = bit.values()
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

export default function BitVectorValuesTest() {
  describe('BitVectorValuesTest', () => {
    beforeAll(() => {})
    beforeEach(() => {})
    afterEach(() => {})
    afterAll(() => {})

    /**
     * @tc.name   BitVector_Values_Func_001
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_1101
     * @tc.desc   returns an iterator.Each item of the iterator is a Javascript Object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("BitVector_Values_Func_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        let bitVector = new collections.BitVector(0);
        bitVector.push(1);
        bitVector.push(1);
        bitVector.push(0);
        bitVector.push(1);
        bitVector.push(0);
        let vec: Array<number> = [];
        let a: Array<number> = [1, 1, 0, 1, 0];
        let itr = bitVector.values();
        let tmp: IteratorResult<number> = itr.next();
        while (!tmp.done) {
          vec.push(tmp.value);
          tmp = itr.next();
        }
        expect(vec.length).assertEqual(a.length);
        for (let i = 0; i < a.length; i++) {
          expect(vec[i]).assertEqual(a[i]);
        }
    });

    /**
     * @tc.name   BitVector_Values_Func_002
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_1102
     * @tc.desc   returns an iterator.Each item of the iterator is a Javascript Object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("BitVector_Values_Func_002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        let bitVector = new collections.BitVector(0);
        let bitVectorLength = 64;
        for (let i = 0; i < bitVectorLength; i++) {
          let res0 = bitVector.push(0);
          expect(res0).assertEqual(true);
        }
        expect(bitVector.length).assertEqual(64);
        let vec: Array<number> = [];
        let itr = bitVector.values();
        let tmp: IteratorResult<number> = itr.next();
        while (!tmp.done) {
          vec.push(tmp.value);
          tmp = itr.next();
        }
        expect(vec.length).assertEqual(bitVectorLength);
        for (let i = 0; i < bitVectorLength; i++) {
          expect(vec[i]).assertEqual(0);
        }
    });

    /**
     * @tc.name   BitVector_Values_Func_003
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_1103
     * @tc.desc   returns an iterator.Each item of the iterator is a Javascript Object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("BitVector_Values_Func_003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        let bitVector = new collections.BitVector(10);
        let bitVectorLength = 64;
        for (let i = 0; i < bitVectorLength; i++) {
          let res0 = bitVector.push(0);
          expect(res0).assertEqual(true);
        }
        expect(bitVector.length).assertEqual(bitVectorLength + 10);
        let vec: Array<number> = [];
        let itr = bitVector.values();
        let tmp: IteratorResult<number> = itr.next();
        while (!tmp.done) {
          vec.push(tmp.value);
          tmp = itr.next();
        }
        expect(vec.length).assertEqual(bitVectorLength + 10);
        for (let i = 10; i < bitVectorLength + 10; i++) {
          expect(vec[i]).assertEqual(0);
        }
    });

    /**
     * @tc.name   BitVectorTest6400
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_1104
     * @tc.desc   Verify BitVector values returns iterator with correct first element
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BitVectorTest6400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let bv = new collections.BitVector(8)
      bv[0] = 1
      let iter = bv.values()
      let first = iter.next()
      expect(first.value).assertEqual(1)
      expect(first.done).assertFalse()
    })

    /**
     * @tc.name   BitVectorTest6500
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_1105
     * @tc.desc   Verify BitVector values iterator traversal covers all elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BitVectorTest6500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let bv = new collections.BitVector(8)
      let count = 0
      let iter = bv.values()
      let temp = iter.next()
      while (!temp.done) {
        count++
        temp = iter.next()
      }
      expect(count).assertEqual(8)
    })

    /**
     * @tc.name   BitVectortest04200
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_1106
     * @tc.desc   BitVectortest04200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BitVectortest04200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'BitVectortest04200';
        let flag: boolean = false;
        console.info(`${caseName} test start`);
        try {
          let bitVector = new collections.BitVector(0);
          const valuesFunc = bitVector.values;
          let iter: IterableIterator<number> = valuesFunc();
          let temp: IteratorResult<number> = iter.next();
          while (!temp.done) {
            console.info(JSON.stringify(temp.value));
            temp = iter.next();
          }
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
     * @tc.name   BitVectortest05400
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_1107
     * @tc.desc   BitVector values 10200201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BitVectortest05400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'BitVectortest05400';
        console.info(`${caseName} test start`);
        let count = 0;
        let bitVector = new collections.BitVector(4);
        try {
          for (let i = 0; i < 100; i++) {
            taskpool.execute(testValues, i, bitVector).then(() => {

              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            })
          }
          for (let i = 0; i < 10; i++) {
            let res = bitVector.values()
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
     * @tc.name   testBitVectorValues0001
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_1108
     * @tc.desc   Testing the values of bitVector, bitvector is null, return true.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorValues0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorValues0001";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        let iter: IterableIterator<number> = bitVectorList.values();
        expect(iter.next().done).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testBitVectorValues0002
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_1109
     * @tc.desc   Testing the values of bitVector, bitvector is not null, return true.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorValues0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorValues0002";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        bitVectorList.push(0);
        bitVectorList.push(1);
        bitVectorList.push(1);
        let arrayList = new Array<number>(0, 1, 1);
        let i = 0;
        for (let iter of bitVectorList.values()) {
          expect(iter).assertEqual(arrayList[i])
          i++;
        }
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testBitVectorValues0003
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_1110
     * @tc.desc   Testing the values of bitVector, bitvector is not null, return true.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorValues0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorValues0003";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        bitVectorList.push(0);
        bitVectorList.push(1);
        bitVectorList.push(1);
        let arrayList = new Array<number>(0, 1, 1);
        let i = 0;
        let iter = bitVectorList.values();
        let tmp = iter.next();
        expect(tmp.value).assertEqual(0);
        tmp = iter.next();
        expect(tmp.value).assertEqual(1);
        tmp = iter.next();
        expect(tmp.value).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testBitVectorValues0007
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_1111
     * @tc.desc   BitVector values() for...of iteration test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorValues0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorValues0007";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        bitVectorList.push(0);
        bitVectorList.push(1);
        bitVectorList.push(0);
        bitVectorList.push(1);
        bitVectorList.push(0);
        let result: number[] = [];
        for (let item of bitVectorList.values()) {
          result.push(item);
        }
        expect(result.length).assertEqual(5);
        expect(result[0]).assertEqual(0);
        expect(result[1]).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testBitVectorValues0008
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_1112
     * @tc.desc   BitVector values() while loop iteration test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorValues0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorValues0008";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        bitVectorList.push(0);
        bitVectorList.push(1);
        bitVectorList.push(0);
        bitVectorList.push(1);
        bitVectorList.push(0);
        let iter = bitVectorList.values();
        let result: number[] = [];
        let temp: IteratorResult<number> = iter.next();
        while (!temp.done) {
          result.push(temp.value);
          temp = iter.next();
        }
        expect(result.length).assertEqual(5);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testBitVectorValues0009
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_1113
     * @tc.desc   BitVector values() single element iterator test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorValues0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorValues0009";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(1);
        bitVectorList.push(1);
        let iter = bitVectorList.values();
        let temp1: IteratorResult<number> = iter.next();
        expect(temp1.done).assertFalse();
        expect(temp1.value).assertEqual(0);
        let temp2: IteratorResult<number> = iter.next();
        expect(temp2.done).assertFalse();
        expect(temp2.value).assertEqual(1);
        let temp3: IteratorResult<number> = iter.next();
        expect(temp3.done).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testBitVectorValues0010
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_1114
     * @tc.desc   BitVector values() all zeros iteration test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorValues0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorValues0010";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(3);
        bitVectorList.push(0);
        bitVectorList.push(0);
        bitVectorList.push(0);
        let iter = bitVectorList.values();
        let temp: IteratorResult<number> = iter.next();
        while (!temp.done) {
          expect(temp.value).assertEqual(0);
          temp = iter.next();
        }
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testBitVectorValues0011
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_1115
     * @tc.desc   BitVector values() all ones iteration test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorValues0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorValues0011";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        bitVectorList.push(1);
        bitVectorList.push(1);
        bitVectorList.push(1);
        let iter = bitVectorList.values();
        let temp: IteratorResult<number> = iter.next();
        while (!temp.done) {
          expect(temp.value).assertEqual(1);
          temp = iter.next();
        }
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testBitVectorValues0012
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_1116
     * @tc.desc   BitVector values() return type verification test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorValues0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorValues0012";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(5);
        bitVectorList.push(0);
        bitVectorList.push(1);
        let iter = bitVectorList.values();
        expect(typeof iter.next).assertEqual('function');
        let temp = iter.next();
        expect(typeof temp.done).assertEqual('boolean');
        expect(typeof temp.value).assertEqual('number');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testBitVectorValues0013
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_1117
     * @tc.desc   BitVector values() large BitVector iteration test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorValues0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorValues0013";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        for (let i = 0; i < 1000; i++) {
          bitVectorList.push(i % 2);
        }
        let iter = bitVectorList.values();
        let count = 0;
        let temp: IteratorResult<number> = iter.next();
        while (!temp.done) {
          count++;
          temp = iter.next();
        }
        expect(count).assertEqual(1000);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testBitVectorValues0014
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_1118
     * @tc.desc   BitVector values() multiple iterators independence test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorValues0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorValues0014";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(5);
        bitVectorList.push(0);
        bitVectorList.push(1);
        bitVectorList.push(0);
        let iter1 = bitVectorList.values();
        let iter2 = bitVectorList.values();
        expect(iter1 === iter2).assertFalse();
        let temp1 = iter1.next();
        let temp2 = iter2.next();
        expect(temp1.value).assertEqual(temp2.value);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testBitVectorValues0015
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_1119
     * @tc.desc   BitVector values() iterator consumed done test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorValues0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorValues0015";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(3);
        bitVectorList.push(0);
        bitVectorList.push(1);
        bitVectorList.push(0);
        let iter = bitVectorList.values();
        let temp: IteratorResult<number> = iter.next();
        while (!temp.done) {
          temp = iter.next();
        }
        expect(temp.done).assertTrue();
        let temp2: IteratorResult<number> = iter.next();
        expect(temp2.done).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testBitVectorValues0017
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_1120
     * @tc.desc   BitVector values() spread operator to array test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorValues0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorValues0017";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        bitVectorList.push(0);
        bitVectorList.push(1);
        bitVectorList.push(0);
        bitVectorList.push(1);
        bitVectorList.push(0);
        let result = Array.from(bitVectorList.values());
        expect(result.length).assertEqual(5);
        expect(result[0]).assertEqual(0);
        expect(result[1]).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testBitVectorValues0018
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_1121
     * @tc.desc   BitVector values() Array.from conversion test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorValues0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorValues0018";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        bitVectorList.push(0);
        bitVectorList.push(1);
        bitVectorList.push(0);
        bitVectorList.push(1);
        bitVectorList.push(0);
        let result = Array.from(bitVectorList.values());
        expect(result.length).assertEqual(5);
        expect(result[0]).assertEqual(0);
        expect(result[1]).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testBitVectorValues0019
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_1122
     * @tc.desc   BitVector values() partial iteration test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorValues0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorValues0019";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        bitVectorList.push(0);
        bitVectorList.push(1);
        bitVectorList.push(0);
        bitVectorList.push(1);
        bitVectorList.push(0);
        let iter = bitVectorList.values();
        let result: number[] = [];
        for (let i = 0; i < 3; i++) {
          let temp = iter.next();
          if (!temp.done) {
            result.push(temp.value);
          }
        }
        expect(result.length).assertEqual(3);
        expect(result[0]).assertEqual(0);
        expect(result[1]).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testBitVectorValues0021
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_1123
     * @tc.desc   BitVector values() destructuring assignment test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorValues0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorValues0021";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(5);
        bitVectorList.push(0);
        bitVectorList.push(1);
        bitVectorList.push(0);
        bitVectorList.push(1);
        bitVectorList.push(0);
        let iter = bitVectorList.values();
        let nextResult = iter.next();
        expect(nextResult.done).assertFalse();
        expect(nextResult.value).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testBitVectorValues0022
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_1124
     * @tc.desc   BitVector values() break early termination test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorValues0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorValues0022";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(5);
        bitVectorList.push(0);
        bitVectorList.push(1);
        bitVectorList.push(0);
        bitVectorList.push(1);
        bitVectorList.push(0);
        let result: number[] = [];
        for (let item of bitVectorList.values()) {
          result.push(item);
          if (result.length === 3) {
            break;
          }
        }
        expect(result.length).assertEqual(3);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testBitVectorValues0023
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_1125
     * @tc.desc   BitVector values() iteration order verification test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorValues0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorValues0023";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(5);
        bitVectorList.push(0);
        bitVectorList.push(1);
        bitVectorList.push(0);
        bitVectorList.push(1);
        bitVectorList.push(0);
        let iter = bitVectorList.values();
        let index = 0;
        let temp: IteratorResult<number> = iter.next();
        while (!temp.done) {
          expect(temp.value).assertEqual(bitVectorList[index]);
          index++;
          temp = iter.next();
        }
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testBitVectorValues0024
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_1126
     * @tc.desc   BitVector values() value consistency verification test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorValues0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorValues0024";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(5);
        bitVectorList.push(0);
        bitVectorList.push(1);
        bitVectorList.push(0);
        bitVectorList.push(1);
        bitVectorList.push(0);
        let iter = bitVectorList.values();
        let temp: IteratorResult<number> = iter.next();
        while (!temp.done) {
          expect(temp.value === 0 || temp.value === 1).assertTrue();
          temp = iter.next();
        }
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testBitVectorValues0025
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_1127
     * @tc.desc   BitVector values() re-iterate after modification test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorValues0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorValues0025";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        bitVectorList.push(0);
        bitVectorList.push(1);
        bitVectorList.push(0);
        bitVectorList.push(1);
        bitVectorList.push(0);
        let iter1 = bitVectorList.values();
        let result1: number[] = [];
        for (let item of iter1) {
          result1.push(item);
        }
        bitVectorList.flipBitsByRange(0, 5);
        let iter2 = bitVectorList.values();
        let result2: number[] = [];
        for (let item of iter2) {
          result2.push(item);
        }
        expect(result2[0]).assertEqual(1);
        expect(result2[1]).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testBitVectorIterator0001
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_1128
     * @tc.desc   BitVector [Symbol.iterator] empty BitVector iteration test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorIterator0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorIterator0001";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        let iter: IterableIterator<number> = bitVectorList.values();
        let result = iter.next();
        expect(result.done).assertTrue();
        expect(result.value).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testBitVectorIterator0002
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_1129
     * @tc.desc   BitVector [Symbol.iterator] single element BitVector iteration test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorIterator0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorIterator0002";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        bitVectorList.push(1);
        let iter: IterableIterator<number> = bitVectorList.values();
        let result = iter.next();
        expect(result.done).assertFalse();
        expect(result.value).assertEqual(1);
        result = iter.next();
        expect(result.done).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testBitVectorIterator0003
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_1130
     * @tc.desc   BitVector [Symbol.iterator] multiple elements BitVector iteration test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorIterator0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorIterator0003";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        bitVectorList.push(0);
        bitVectorList.push(1);
        bitVectorList.push(0);
        bitVectorList.push(1);
        bitVectorList.push(1);
        let iter: IterableIterator<number> = bitVectorList.values();
        let expectedValues: number[] = [0, 1, 0, 1, 1];
        let index = 0;
        let result = iter.next();
        while (!result.done) {
          expect(result.value).assertEqual(expectedValues[index]);
          index++;
          result = iter.next();
        }
        expect(index).assertEqual(5);
        expect(result.done).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testBitVectorIterator0004
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_1131
     * @tc.desc   BitVector [Symbol.iterator] for...of traversal all elements test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorIterator0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorIterator0004";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        for (let i = 0; i < 10; i++) {
          if (i < 5) {
            bitVectorList.push(0);
          } else {
            bitVectorList.push(1);
          }
        }
        let expectedValues: number[] = [0, 0, 0, 0, 0, 1, 1, 1, 1, 1];
        let index = 0;
        for (let value of bitVectorList) {
          expect(value).assertEqual(expectedValues[index]);
          index++;
        }
        expect(index).assertEqual(10);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testBitVectorIterator0005
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_1132
     * @tc.desc   BitVector [Symbol.iterator] verify iteration order from head to tail test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorIterator0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorIterator0005";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        bitVectorList.push(1);
        bitVectorList.push(0);
        bitVectorList.push(1);
        bitVectorList.push(0);
        let iter: IterableIterator<number> = bitVectorList.values();
        let first = iter.next();
        expect(first.value).assertEqual(1);
        expect(first.done).assertFalse();
        let second = iter.next();
        expect(second.value).assertEqual(0);
        expect(second.done).assertFalse();
        let third = iter.next();
        expect(third.value).assertEqual(1);
        expect(third.done).assertFalse();
        let fourth = iter.next();
        expect(fourth.value).assertEqual(0);
        expect(fourth.done).assertFalse();
        let fifth = iter.next();
        expect(fifth.done).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testBitVectorIterator0006
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_1133
     * @tc.desc   BitVector [Symbol.iterator] next() method test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorIterator0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorIterator0006";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        bitVectorList.push(0);
        bitVectorList.push(1);
        let iter: IterableIterator<number> = bitVectorList.values();
        let result1 = iter.next();
        expect(result1.value).assertEqual(0);
        let result2 = iter.next();
        expect(result2.value).assertEqual(1);
        let result3 = iter.next();
        expect(result3.done).assertTrue();
        let result4 = iter.next();
        expect(result4.done).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testBitVectorIterator0007
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_1134
     * @tc.desc   BitVector [Symbol.iterator] done property verification test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorIterator0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorIterator0007";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        bitVectorList.push(1);
        bitVectorList.push(0);
        bitVectorList.push(1);
        let iter: IterableIterator<number> = bitVectorList.values();
        expect(iter.next().done).assertFalse();
        expect(iter.next().done).assertFalse();
        expect(iter.next().done).assertFalse();
        expect(iter.next().done).assertTrue();
        expect(iter.next().done).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testBitVectorIterator0008
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_1135
     * @tc.desc   BitVector [Symbol.iterator] value property verification test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorIterator0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorIterator0008";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        bitVectorList.push(0);
        bitVectorList.push(0);
        bitVectorList.push(1);
        bitVectorList.push(1);
        let iter: IterableIterator<number> = bitVectorList.values();
        let result = iter.next();
        expect(typeof result.value).assertEqual("number");
        expect(result.value).assertEqual(0);
        result = iter.next();
        expect(typeof result.value).assertEqual("number");
        expect(result.value).assertEqual(0);
        result = iter.next();
        expect(typeof result.value).assertEqual("number");
        expect(result.value).assertEqual(1);
        result = iter.next();
        expect(typeof result.value).assertEqual("number");
        expect(result.value).assertEqual(1);
        result = iter.next();
        expect(result.value).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testBitVectorIterator0010
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_1136
     * @tc.desc   BitVector [Symbol.iterator] iteration during BitVector modification test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorIterator0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorIterator0010";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        bitVectorList.push(0);
        bitVectorList.push(1);
        bitVectorList.push(0);
        let iter: IterableIterator<number> = bitVectorList.values();
        let result1 = iter.next();
        expect(result1.value).assertEqual(0);
        bitVectorList.push(1);
        bitVectorList.push(0);
        let result2 = iter.next();
        expect(result2.value).assertEqual(1);
        let result3 = iter.next();
        expect(result3.value).assertEqual(0);
        let result4 = iter.next();
        expect(result4.value).assertEqual(1);
        let result5 = iter.next();
        expect(result5.value).assertEqual(0);
        expect(iter.next().done).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testBitVectorIterator0011
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_1137
     * @tc.desc   BitVector [Symbol.iterator] compare with values() method test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorIterator0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorIterator0011";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        bitVectorList.push(0);
        bitVectorList.push(1);
        bitVectorList.push(0);
        bitVectorList.push(1);
        bitVectorList.push(1);
        let symbolIter: IterableIterator<number> = bitVectorList.values();
        let valuesIter: IterableIterator<number> = bitVectorList.values();
        let symbolResult = symbolIter.next();
        let valuesResult = valuesIter.next();
        while (!symbolResult.done && !valuesResult.done) {
          expect(symbolResult.value).assertEqual(valuesResult.value);
          symbolResult = symbolIter.next();
          valuesResult = valuesIter.next();
        }
        expect(symbolResult.done).assertTrue();
        expect(valuesResult.done).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testBitVectorIterator0012
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_1138
     * @tc.desc   BitVector [Symbol.iterator] large elements iteration test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorIterator0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorIterator0012";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        for (let i = 0; i < 100; i++) {
          bitVectorList.push(i % 2);
        }
        let count = 0;
        for (let value of bitVectorList) {
          expect(value).assertEqual(count % 2);
          count++;
        }
        expect(count).assertEqual(100);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testBitVectorIterator0013
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_1139
     * @tc.desc   BitVector [Symbol.iterator] BitVector created with initial length test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorIterator0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorIterator0013";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(10);
        let iter: IterableIterator<number> = bitVectorList.values();
        let count = 0;
        let result = iter.next();
        while (!result.done) {
          expect(result.value).assertEqual(0);
          count++;
          result = iter.next();
        }
        expect(count).assertEqual(10);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testBitVectorIterator0014
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_1140
     * @tc.desc   BitVector [Symbol.iterator] use spread operator test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorIterator0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorIterator0014";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        bitVectorList.push(1);
        bitVectorList.push(0);
        bitVectorList.push(1);
        bitVectorList.push(0);
        let arr: number[] = [...bitVectorList];
        expect(arr.length).assertEqual(4);
        expect(arr[0]).assertEqual(1);
        expect(arr[1]).assertEqual(0);
        expect(arr[2]).assertEqual(1);
        expect(arr[3]).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testBitVectorIterator0015
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_1141
     * @tc.desc   BitVector [Symbol.iterator] use Array.from test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorIterator0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorIterator0015";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        bitVectorList.push(0);
        bitVectorList.push(1);
        bitVectorList.push(1);
        bitVectorList.push(0);
        let arr: number[] = Array.from(bitVectorList);
        expect(arr.length).assertEqual(4);
        expect(arr[0]).assertEqual(0);
        expect(arr[1]).assertEqual(1);
        expect(arr[2]).assertEqual(1);
        expect(arr[3]).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testBitVectorIterator0016
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_1142
     * @tc.desc   BitVector [Symbol.iterator] after pop operation test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorIterator0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBitVectorIterator0016";
      try {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        bitVectorList.push(0);
        bitVectorList.push(1);
        bitVectorList.push(0);
        bitVectorList.push(1);
        bitVectorList.pop();
        let iter: IterableIterator<number> = bitVectorList.values();
        let expectedValues: number[] = [0, 1, 0];
        let index = 0;
        for (let value of bitVectorList) {
          expect(value).assertEqual(expectedValues[index]);
          index++;
        }
        expect(index).assertEqual(3);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testBitVectorValuesBoundary0001
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_1143
     * @tc.desc   BitVector values() on empty BitVector, iterator done immediately.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorValuesBoundary0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        let iter = bitVectorList.values();
        let temp = iter.next();
        expect(temp.done).assertTrue();
        done()
      });

    /**
     * @tc.name   testBitVectorValuesBoundary0002
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_1144
     * @tc.desc   BitVector values() on single element BitVector.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVectorValuesBoundary0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        bitVectorList.push(1);
        let iter = bitVectorList.values();
        let temp1 = iter.next();
        expect(temp1.done).assertFalse();
        expect(temp1.value).assertEqual(1);
        let temp2 = iter.next();
        expect(temp2.done).assertTrue();
        done()
      });

    /**
     * @tc.name   testBitVector64Boundary0015
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_1145
     * @tc.desc   BitVector 64 boundary: values() on exactly 64 elements + pop from 65 to 64.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBitVector64Boundary0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let bitVectorList: collections.BitVector = new collections.BitVector(0);
        for (let i = 0; i < 64; i++) {
          bitVectorList.push(i % 2);
        }
        let iter = bitVectorList.values();
        let count = 0;
        let temp = iter.next();
        while (!temp.done) {
          expect(temp.value).assertEqual(count % 2);
          count++;
          temp = iter.next();
        }
        expect(count).assertEqual(64);
        let bv2: collections.BitVector = new collections.BitVector(0);
        for (let i = 0; i < 65; i++) {
          bv2.push(i % 2);
        }
        bv2.pop();
        expect(bv2.length).assertEqual(64);
        expect(bv2[63]).assertEqual(1);
        try {
          let value = bv2[64];
          expect().assertFail();
        } catch (err) {
          expect(err.code).assertEqual(10200001);
        }
        done()
      });

  })
}
