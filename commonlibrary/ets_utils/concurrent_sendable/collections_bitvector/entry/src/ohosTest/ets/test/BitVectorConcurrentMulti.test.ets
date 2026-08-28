/*
 * Copyright (C) 2024 HiHope Open Source Organization.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size } from '@ohos/hypium';
import { ArkTSUtils, collections, taskpool } from '@kit.ArkTS';
import { BusinessError } from '@kit.BasicServicesKit';
import {
  test_bitvector_001,
  test_bitvector_004,
  test_bitvector_005,
  test_bitvector_007,
  test_bitvector_012,
} from '../testability/pages/taskpool';

let concurrentNum = 100

function getInitBitVector1(): collections.BitVector {
  let bitVector = new collections.BitVector(0);
  bitVector.push(0);
  bitVector.push(1);
  bitVector.push(0);
  bitVector.push(1);
  bitVector.push(0);
  return bitVector;
}

function getInitBitVector2(): collections.BitVector {
  let bitVector = new collections.BitVector(0);
  bitVector.push(1);
  bitVector.push(1);
  bitVector.push(0);
  bitVector.push(0);
  bitVector.push(1);
  return bitVector;
}

function getInitBitVector3(): collections.BitVector {
  let bitVector = new collections.BitVector(0);
  for (let i = 0; i < 1000; i++) {
    bitVector.push(i % 2);
  }
  return bitVector;
}

export function sleep(time: number): Promise<void> {
  return new Promise((re, je) => {
    setTimeout(() => {
      re()
    }, time)
  })
}

@Sendable
class Test {
  length_: number = 0;
  arr_: collections.BitVector = new collections.BitVector(0);
  lock_: ArkTSUtils.locks.AsyncLock = new ArkTSUtils.locks.AsyncLock();
  async Has(element: number, fromIndex: number, toIndex: number): Promise<boolean> {
    return this.lock_.lockAsync((): boolean => {
      return this.arr_.has(element, fromIndex, toIndex);
    })
  }
  async Push(i: number): Promise<void> {
    await this.lock_.lockAsync((): void => {
      this.arr_.push(i);
      this.length_ += 1;
    })
  }
}

@Sendable
class SendableClass{
  value:collections.BitVector | ArkTSUtils.locks.AsyncLock;
  constructor(value:collections.BitVector | ArkTSUtils.locks.AsyncLock) {
    this.value = value;
  }
};

@Concurrent
async function test001(t: Test) {
  await t.Push(1);
}

@Concurrent
function taskpoolExecte(data:SendableClass) {
  return data.value;
}

function promiseCase():Promise<void | object> {
  let tmp:Promise<void | object> = new Promise((resolve:Function, reject:Function) => {
    setTimeout(() => {
      resolve(1);
    }, 100);
  });
  return tmp;
}

export default function BitVectorConcurrentMultiTest() {
  describe('BitVectorConcurrentMultiTest', () => {
    beforeAll(() => {
    })
    beforeEach(async () => {
      await sleep(50);
    })
    afterEach(() => {
    })
    afterAll(() => {
    })

    /**
     * @tc.name   test_concurrent_collections_bitvector_001
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_1501
     * @tc.desc   test_concurrent_collections_bitvector_001 - test BitVector push method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_concurrent_collections_bitvector_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_collections_bitvector_001';
        console.info(`${caseName} test start`);
        let bitVector = getInitBitVector1()
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(test_bitvector_001, bitVector, caseName, i)
          }
          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
          }).catch((e: BusinessError) => {
            console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            expect().assertFail()
          })
          console.info(`${caseName} Task result: ${bitVector.length}`);
          expect(bitVector.length).assertEqual(5 + concurrentNum)
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   test_concurrent_collections_bitvector_004
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_1502
     * @tc.desc   test_concurrent_collections_bitvector_004 - test BitVector setBitsByRange method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_concurrent_collections_bitvector_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_collections_bitvector_004';
        console.info(`${caseName} test start`);
        let bitVector = getInitBitVector1()
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(test_bitvector_004, bitVector, caseName, i)
          }
          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
          }).catch((e: BusinessError) => {
            console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            expect().assertFail()
          })
          console.info(`${caseName} Task result completed`);
          expect(bitVector.length).assertEqual(5)
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   test_concurrent_collections_bitvector_005
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_1503
     * @tc.desc   test_concurrent_collections_bitvector_005 - test BitVector setAllBits method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_concurrent_collections_bitvector_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_collections_bitvector_005';
        console.info(`${caseName} test start`);
        let bitVector = getInitBitVector2()
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(test_bitvector_005, bitVector, caseName, i)
          }
          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
          }).catch((e: BusinessError) => {
            console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            expect().assertFail()
          })
          console.info(`${caseName} Task result completed`);
          expect(bitVector.length).assertEqual(5)
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   test_concurrent_collections_bitvector_007
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_1504
     * @tc.desc   test_concurrent_collections_bitvector_007 - test BitVector resize method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_concurrent_collections_bitvector_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_collections_bitvector_007';
        console.info(`${caseName} test start`);
        let bitVector = getInitBitVector2()
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(test_bitvector_007, bitVector, caseName, i)
          }
          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
          }).catch((e: BusinessError) => {
            console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            expect().assertFail()
          })
          console.info(`${caseName} Task result: ${bitVector.length}`);
          expect(bitVector.length).assertEqual(6)
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   test_concurrent_collections_bitvector_012
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_1505
     * @tc.desc   test_concurrent_collections_bitvector_012 - test BitVector flipBitByIndex method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_concurrent_collections_bitvector_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_collections_bitvector_012';
        console.info(`${caseName} test start`);
        let bitVector = getInitBitVector1()
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(test_bitvector_012, bitVector, caseName, i)
          }
          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
          }).catch((e: BusinessError) => {
            console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            expect().assertFail()
          })
          console.info(`${caseName} Task result completed`);
          expect(bitVector.length).assertEqual(5)
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   CollectionsTestClass001
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_1506
     * @tc.desc   ArkTS Collections bitvector
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsTestClass001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let flag:boolean = false;
      try {
        let bitvector:collections.BitVector = new collections.BitVector(0);
        let tmp = new SendableClass(bitvector);
        let task = new taskpool.Task(taskpoolExecte, tmp);

        await taskpool.execute(task).then((res)=> {
          flag = true;
          console.log("Transfer bitvector success");
        })
        while(!flag){
          await promiseCase();
        }
      } catch(err) {
          console.log("Transfer bitvector fail:" + err);
      }
      expect(flag).assertEqual(true);
      done();
    });

    /**
     * @tc.name   CollectionsTestClass002
     * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_1507
     * @tc.desc   ArkTS Collections bitvector
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('CollectionsTestClass002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let t = new Test();
      await taskpool.execute(test001, t).catch((err: Error) => {
        console.log("taskpool execute fail" + err);
      })
      expect(await t.Has(0, 0, 1)).assertEqual(true);
      done();
    });

  })
}
