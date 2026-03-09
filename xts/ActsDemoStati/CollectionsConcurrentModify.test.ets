/*
 * Copyright (C) 2022 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { collections, taskpool } from '@kit.ArkTS';
import { BusinessError } from '@kit.BasicServicesKit';

export function sleep(time: number): Promise<void> {
  return new Promise((re, je) => {
    setTimeout(() => {
      re()
    }, time)
  })
}


@Concurrent
export function testModifyArray(index: number, arr: collections.Array<number>) {
  let tag = 'testModifyArray'
  try {
    for (let i = 0; i < 10; i++) {
      arr.push(1)
      arr.join('')
      arr.shift()
      arr.unshift(2)
      arr.slice(1)
      arr.sort()
      arr.fill(10)
    }
  } catch (e) {
    console.info(`${tag} Task execution catch: ${e.message}, code: ${e.code}`);
  }
}

@Concurrent
export function testModifyArrayBuffer(index: number, arr: collections.ArrayBuffer) {
  let tag = 'testModifyArray'
  try {
    for (let i = 0; i < 10; i++) {
      arr.slice(1)
      arr.slice(1)
    }
  } catch (e) {
    console.info(`${tag} Task execution catch: ${e.message}, code: ${e.code}`);
  }
}

@Concurrent
export function testModifyInt8Array(index: number, arr: collections.Int8Array) {
  let tag = 'testModifyArray'
  try {
    for (let i = 0; i < 10; i++) {
      arr.copyWithin(3, 1, 3)
    }
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

export default function collectionsConcurrentModifyTest1() {
  describe('collectionsConcurrentModifyTest1', () => {
    beforeEach(async () => {
      await sleep(100);
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.

    /**
     * @tc.name   CollectionsConcurrentModifyTest0100
     * @tc.number SUB_COLLECTION_CONCURRENT_MODIFY_0100
     * @tc.desc   ConcatArray pop 10200201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsConcurrentModifyTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsConcurrentModifyTest0100';
        console.info(`${caseName} test start`);
        let count = 0;
        let arr = new collections.Array(1, 2, 3, 4, 5, 6, 7, 8);
        try {
          for (let i = 0; i < 100; i++) {
            taskpool.execute(testModifyArray, i, arr).then(() => {
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            })
          }
          for (let i = 0; i < 100; i++) {
            arr.pop()
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
     * @tc.name   CollectionsConcurrentModifyTest0200
     * @tc.number SUB_COLLECTION_CONCURRENT_MODIFY_0200
     * @tc.desc   ConcatArray push 10200201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsConcurrentModifyTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsConcurrentModifyTest0100';
        console.info(`${caseName} test start`);
        let count = 0;
        let arr = new collections.Array(1, 2, 3, 4, 5, 6, 7, 8);
        try {
          for (let i = 0; i < 100; i++) {
            taskpool.execute(testModifyArray, i, arr).then(() => {
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            })
          }
          for (let i = 0; i < 100; i++) {
            arr.push(1)
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
     * @tc.name   CollectionsConcurrentModifyTest0300
     * @tc.number SUB_COLLECTION_CONCURRENT_MODIFY_0300
     * @tc.desc   ConcatArray join 10200201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsConcurrentModifyTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsConcurrentModifyTest0300';
        console.info(`${caseName} test start`);
        let count = 0;
        let arr = new collections.Array(1, 2, 3, 4, 5, 6, 7, 8);
        try {
          for (let i = 0; i < 100; i++) {
            taskpool.execute(testModifyArray, i, arr).then(() => {
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            })
          }
          for (let i = 0; i < 100; i++) {
            arr.join('-')
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
     * @tc.name   CollectionsConcurrentModifyTest0400
     * @tc.number SUB_COLLECTION_CONCURRENT_MODIFY_0400
     * @tc.desc   ConcatArray shift 10200201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsConcurrentModifyTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsConcurrentModifyTest0400';
        console.info(`${caseName} test start`);
        let count = 0;
        let arr = new collections.Array(1, 2, 3, 4, 5, 6, 7, 8);
        try {
          for (let i = 0; i < 100; i++) {
            taskpool.execute(testModifyArray, i, arr).then(() => {
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            })
          }
          for (let i = 0; i < 100; i++) {
            arr.shift()
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
     * @tc.name   CollectionsConcurrentModifyTest0500
     * @tc.number SUB_COLLECTION_CONCURRENT_MODIFY_0500
     * @tc.desc   ConcatArray unshift 10200201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsConcurrentModifyTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsConcurrentModifyTest0500';
        console.info(`${caseName} test start`);
        let count = 0;
        let arr = new collections.Array(1, 2, 3, 4, 5, 6, 7, 8);
        try {
          for (let i = 0; i < 100; i++) {
            taskpool.execute(testModifyArray, i, arr).then(() => {
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            })
          }
          for (let i = 0; i < 100; i++) {
            arr.unshift(1)
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
     * @tc.name   CollectionsConcurrentModifyTest0600
     * @tc.number SUB_COLLECTION_CONCURRENT_MODIFY_0600
     * @tc.desc   ConcatArray slice 10200201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsConcurrentModifyTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsConcurrentModifyTest0600';
        console.info(`${caseName} test start`);
        let count = 0;
        let arr = new collections.Array(1, 2, 3, 4, 5, 6, 7, 8);
        try {
          for (let i = 0; i < 100; i++) {
            taskpool.execute(testModifyArray, i, arr).then(() => {
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            })
          }
          for (let i = 0; i < 100; i++) {
            arr.slice(0, 4)
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
     * @tc.name   CollectionsConcurrentModifyTest0700
     * @tc.number SUB_COLLECTION_CONCURRENT_MODIFY_0700
     * @tc.desc   ConcatArray sort 10200201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsConcurrentModifyTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsConcurrentModifyTest0700';
        console.info(`${caseName} test start`);
        let count = 0;
        let arr = new collections.Array(1, 2, 3, 4, 5, 6, 7, 8);
        try {
          for (let i = 0; i < 100; i++) {
            taskpool.execute(testModifyArray, i, arr).then(() => {
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            })
          }
          for (let i = 0; i < 100; i++) {
            arr.sort((a: number, b: number) => a - b)
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
     * @tc.name   CollectionsConcurrentModifyTest0800
     * @tc.number SUB_COLLECTION_CONCURRENT_MODIFY_0800
     * @tc.desc   ConcatArray indexOf 10200201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsConcurrentModifyTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsConcurrentModifyTest0800';
        console.info(`${caseName} test start`);
        let count = 0;
        let arr = new collections.Array(1, 2, 3, 4, 5, 6, 7, 8);
        try {
          for (let i = 0; i < 100; i++) {
            taskpool.execute(testModifyArray, i, arr).then(() => {
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            })
          }
          for (let i = 0; i < 100; i++) {
            arr.indexOf(1)
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
     * @tc.name   CollectionsConcurrentModifyTest0900
     * @tc.number SUB_COLLECTION_CONCURRENT_MODIFY_0900
     * @tc.desc   ConcatArray forEach 10200201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsConcurrentModifyTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsConcurrentModifyTest0900';
        console.info(`${caseName} test start`);
        let count = 0;
        let arr = new collections.Array(1, 2, 3, 4, 5, 6, 7, 8);
        try {
          for (let i = 0; i < 100; i++) {
            taskpool.execute(testModifyArray, i, arr).then(() => {
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            })
          }
          for (let i = 0; i < 100; i++) {
            arr.forEach((value) => {
              const sum = value + Math.random(); // 无害操作
            })
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
     * @tc.name   CollectionsConcurrentModifyTest1000
     * @tc.number SUB_COLLECTION_CONCURRENT_MODIFY_1000
     * @tc.desc   ConcatArray map 10200201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsConcurrentModifyTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsConcurrentModifyTest1000';
        console.info(`${caseName} test start`);
        let count = 0;
        let arr = new collections.Array(1, 2, 3, 4, 5, 6, 7, 8);
        try {
          for (let i = 0; i < 100; i++) {
            taskpool.execute(testModifyArray, i, arr).then(() => {
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            })
          }
          for (let i = 0; i < 100; i++) {
            arr.map(value => value)
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
     * @tc.name   CollectionsConcurrentModifyTest1100
     * @tc.number SUB_COLLECTION_CONCURRENT_MODIFY_1100
     * @tc.desc   ConcatArray filter 10200201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsConcurrentModifyTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsConcurrentModifyTest1100';
        console.info(`${caseName} test start`);
        let count = 0;
        let arr = new collections.Array(1, 2, 3, 4, 5, 6, 7, 8);
        try {
          for (let i = 0; i < 100; i++) {
            taskpool.execute(testModifyArray, i, arr).then(() => {
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            })
          }
          for (let i = 0; i < 100; i++) {
            arr.filter((value: number) => value % 2 === 0)
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
     * @tc.name   CollectionsConcurrentModifyTest1200
     * @tc.number SUB_COLLECTION_CONCURRENT_MODIFY_1200
     * @tc.desc   ConcatArray reduce1 10200201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsConcurrentModifyTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsConcurrentModifyTest1200';
        console.info(`${caseName} test start`);
        let count = 0;
        let arr = new collections.Array(1, 2, 3, 4, 5, 6, 7, 8);
        try {
          for (let i = 0; i < 100; i++) {
            taskpool.execute(testModifyArray, i, arr).then(() => {
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            })
          }
          for (let i = 0; i < 100; i++) {
            arr.reduce((accumulator, value) => accumulator + value)
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
     * @tc.name   CollectionsConcurrentModifyTest1300
     * @tc.number SUB_COLLECTION_CONCURRENT_MODIFY_1300
     * @tc.desc   ConcatArray reduce2 10200201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsConcurrentModifyTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsConcurrentModifyTest1300';
        console.info(`${caseName} test start`);
        let count = 0;
        let arr = new collections.Array(1, 2, 3, 4, 5, 6, 7, 8);
        try {
          for (let i = 0; i < 100; i++) {
            taskpool.execute(testModifyArray, i, arr).then(() => {
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            })
          }
          for (let i = 0; i < 100; i++) {
            arr.reduce<number>((accumulator: number, value: number) => accumulator + value, 0)
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
     * @tc.name   CollectionsConcurrentModifyTest1400
     * @tc.number SUB_COLLECTION_CONCURRENT_MODIFY_1400
     * @tc.desc   ConcatArray at 10200201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsConcurrentModifyTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsConcurrentModifyTest1400';
        console.info(`${caseName} test start`);
        let count = 0;
        let arr = new collections.Array(1, 2, 3, 4, 5, 6, 7, 8);
        try {
          for (let i = 0; i < 100; i++) {
            taskpool.execute(testModifyArray, i, arr).then(() => {
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            })
          }
          for (let i = 0; i < 100; i++) {
            arr.at(2)
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
     * @tc.name   CollectionsConcurrentModifyTest1500
     * @tc.number SUB_COLLECTION_CONCURRENT_MODIFY_1500
     * @tc.desc   ConcatArray entries 10200201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsConcurrentModifyTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsConcurrentModifyTest1500';
        console.info(`${caseName} test start`);
        let count = 0;
        let arr = new collections.Array(1, 2, 3, 4, 5, 6, 7, 8);
        try {
          for (let i = 0; i < 100; i++) {
            taskpool.execute(testModifyArray, i, arr).then(() => {
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            })
          }
          for (let i = 0; i < 100; i++) {
            arr.entries()
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
     * @tc.name   CollectionsConcurrentModifyTest1600
     * @tc.number SUB_COLLECTION_CONCURRENT_MODIFY_1600
     * @tc.desc   ConcatArray keys 10200201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsConcurrentModifyTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsConcurrentModifyTest1600';
        console.info(`${caseName} test start`);
        let count = 0;
        let arr = new collections.Array(1, 2, 3, 4, 5, 6, 7, 8);
        try {
          for (let i = 0; i < 100; i++) {
            taskpool.execute(testModifyArray, i, arr).then(() => {
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            })
          }
          for (let i = 0; i < 100; i++) {
            arr.keys()
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
     * @tc.name   CollectionsConcurrentModifyTest1700
     * @tc.number SUB_COLLECTION_CONCURRENT_MODIFY_1700
     * @tc.desc   ConcatArray values 10200201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsConcurrentModifyTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsConcurrentModifyTest1700';
        console.info(`${caseName} test start`);
        let count = 0;
        let arr = new collections.Array(1, 2, 3, 4, 5, 6, 7, 8);
        try {
          for (let i = 0; i < 100; i++) {
            taskpool.execute(testModifyArray, i, arr).then(() => {
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            })
          }
          for (let i = 0; i < 100; i++) {
            arr.values()
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
     * @tc.name   CollectionsConcurrentModifyTest1800
     * @tc.number SUB_COLLECTION_CONCURRENT_MODIFY_1800
     * @tc.desc   ConcatArray find 10200201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsConcurrentModifyTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsConcurrentModifyTest1800';
        console.info(`${caseName} test start`);
        let count = 0;
        let arr = new collections.Array(1, 2, 3, 4, 5, 6, 7, 8);
        try {
          for (let i = 0; i < 100; i++) {
            taskpool.execute(testModifyArray, i, arr).then(() => {
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            })
          }
          for (let i = 0; i < 100; i++) {
            arr.find((value: number) => value % 2 === 0)
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
     * @tc.name   CollectionsConcurrentModifyTest1900
     * @tc.number SUB_COLLECTION_CONCURRENT_MODIFY_1900
     * @tc.desc   ConcatArray includes 10200201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsConcurrentModifyTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsConcurrentModifyTest1900';
        console.info(`${caseName} test start`);
        let count = 0;
        let arr = new collections.Array(1, 2, 3, 4, 5, 6, 7, 8);
        try {
          for (let i = 0; i < 100; i++) {
            taskpool.execute(testModifyArray, i, arr).then(() => {
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            })
          }
          for (let i = 0; i < 100; i++) {
            arr.includes(2)
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
     * @tc.name   CollectionsConcurrentModifyTest2000
     * @tc.number SUB_COLLECTION_CONCURRENT_MODIFY_2000
     * @tc.desc   ConcatArray findIndex 10200201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsConcurrentModifyTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsConcurrentModifyTest2000';
        console.info(`${caseName} test start`);
        let count = 0;
        let arr = new collections.Array(1, 2, 3, 4, 5, 6, 7, 8);
        try {
          for (let i = 0; i < 100; i++) {
            taskpool.execute(testModifyArray, i, arr).then(() => {
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            })
          }
          for (let i = 0; i < 100; i++) {
            arr.findIndex((value: number) => value % 2 === 0)
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
     * @tc.name   CollectionsConcurrentModifyTest2100
     * @tc.number SUB_COLLECTION_CONCURRENT_MODIFY_2100
     * @tc.desc   ConcatArray fill 10200201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsConcurrentModifyTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsConcurrentModifyTest2100';
        console.info(`${caseName} test start`);
        let count = 0;
        let arr = new collections.Array(1, 2, 3, 4, 5, 6, 7, 8);
        try {
          for (let i = 0; i < 100; i++) {
            taskpool.execute(testModifyArray, i, arr).then(() => {
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            })
          }
          for (let i = 0; i < 100; i++) {
            arr.fill(1)
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
     * @tc.name   CollectionsConcurrentModifyTest2200
     * @tc.number SUB_COLLECTION_CONCURRENT_MODIFY_2200
     * @tc.desc   ConcatArray shrinkTo 10200201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsConcurrentModifyTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsConcurrentModifyTest2200';
        console.info(`${caseName} test start`);
        let count = 0;
        let arr = new collections.Array(1, 2, 3, 4, 5, 6, 7, 8);
        try {
          for (let i = 0; i < 100; i++) {
            taskpool.execute(testModifyArray, i, arr).then(() => {
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            })
          }
          for (let i = 0; i < 100; i++) {
            arr.shrinkTo(2)
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
     * @tc.name   CollectionsConcurrentModifyTest2300
     * @tc.number SUB_COLLECTION_CONCURRENT_MODIFY_2300
     * @tc.desc   ConcatArray extendTo 10200201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsConcurrentModifyTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsConcurrentModifyTest2300';
        console.info(`${caseName} test start`);
        let count = 0;
        let arr = new collections.Array(1, 2, 3, 4, 5, 6, 7, 8);
        try {
          for (let i = 0; i < 100; i++) {
            taskpool.execute(testModifyArray, i, arr).then(() => {
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            })
          }
          for (let i = 0; i < 100; i++) {
            arr.extendTo(1, 10)
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
     * @tc.name   CollectionsConcurrentModifyTest2400
     * @tc.number SUB_COLLECTION_CONCURRENT_MODIFY_2400
     * @tc.desc   ConcatArray fill 10200201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsConcurrentModifyTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsConcurrentModifyTest2400';
        console.info(`${caseName} test start`);
        let count = 0;
        let arr = new collections.Array(1, 2, 3, 4, 5, 6, 7, 8);
        try {
          for (let i = 0; i < 100; i++) {
            taskpool.execute(testModifyArray, i, arr).then(() => {
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            })
          }
          for (let i = 0; i < 100; i++) {
            arr.fill(1)
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
     * @tc.name   CollectionsConcurrentModifyTest2500
     * @tc.number SUB_COLLECTION_CONCURRENT_MODIFY_2500
     * @tc.desc   ConcatArray shrinkTo 10200201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsConcurrentModifyTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsConcurrentModifyTest2500';
        console.info(`${caseName} test start`);
        let count = 0;
        let arr = new collections.Array(1, 2, 3, 4, 5, 6, 7, 8);
        try {
          for (let i = 0; i < 100; i++) {
            taskpool.execute(testModifyArray, i, arr).then(() => {
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            })
          }
          for (let i = 0; i < 100; i++) {
            arr.shrinkTo(2)
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
     * @tc.name   CollectionsConcurrentModifyTest2600
     * @tc.number SUB_COLLECTION_CONCURRENT_MODIFY_2600
     * @tc.desc   ConcatArray extendTo 10200201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsConcurrentModifyTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsConcurrentModifyTest2600';
        console.info(`${caseName} test start`);
        let count = 0;
        let arr = new collections.Array(1, 2, 3, 4, 5, 6, 7, 8);
        try {
          for (let i = 0; i < 100; i++) {
            taskpool.execute(testModifyArray, i, arr).then(() => {
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            })
          }
          for (let i = 0; i < 100; i++) {
            arr.extendTo(1, 10)
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
     * @tc.name   CollectionsConcurrentModifyTest2700
     * @tc.number SUB_COLLECTION_CONCURRENT_MODIFY_2700
     * @tc.desc   ConcatArray concat 10200201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsConcurrentModifyTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsConcurrentModifyTest2700';
        console.info(`${caseName} test start`);
        let count = 0;
        let arr = new collections.Array(1, 2, 3, 4, 5, 6, 7, 8);
        try {
          for (let i = 0; i < 100; i++) {
            taskpool.execute(testModifyArray, i, arr).then(() => {
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            })
          }
          for (let i = 0; i < 100; i++) {
            arr.concat()
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
     * @tc.name   CollectionsConcurrentModifyTest2800
     * @tc.number SUB_COLLECTION_CONCURRENT_MODIFY_2800
     * @tc.desc   ConcatArray splice1 10200201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsConcurrentModifyTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsConcurrentModifyTest2800';
        console.info(`${caseName} test start`);
        let count = 0;
        let arr = new collections.Array(1, 2, 3, 4, 5, 6, 7, 8);
        try {
          for (let i = 0; i < 100; i++) {
            taskpool.execute(testModifyArray, i, arr).then(() => {
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            })
          }
          for (let i = 0; i < 100; i++) {
            arr.splice(2)
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
     * @tc.name   CollectionsConcurrentModifyTest2900
     * @tc.number SUB_COLLECTION_CONCURRENT_MODIFY_2900
     * @tc.desc   ConcatArray splice2 10200201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsConcurrentModifyTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsConcurrentModifyTest2900';
        console.info(`${caseName} test start`);
        let count = 0;
        let arr = new collections.Array(1, 2, 3, 4, 5, 6, 7, 8);
        try {
          for (let i = 0; i < 100; i++) {
            taskpool.execute(testModifyArray, i, arr).then(() => {
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            })
          }
          for (let i = 0; i < 100; i++) {
            arr.splice(-2, 1)
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
     * @tc.name   CollectionsConcurrentModifyTest29001
     * @tc.number SUB_COLLECTION_CONCURRENT_MODIFY_29001
     * @tc.desc   ConcatArray splice2 10200201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsConcurrentModifyTest29001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsConcurrentModifyTest29001';
        console.info(`${caseName} test start`);
        let count = 0;
        let arr = new collections.Array(1, 2, 3, 4, 5, 6, 7, 8);
        try {
          for (let i = 0; i < 100; i++) {
            taskpool.execute(testModifyArray, i, arr).then(() => {
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            })
          }
          for (let i = 0; i < 100; i++) {
            arr.splice(0, 1, 2)
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
     * @tc.name   CollectionsConcurrentModifyTest3000
     * @tc.number SUB_COLLECTION_CONCURRENT_MODIFY_3000
     * @tc.desc   ConcatArray copyWithin 10200201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsConcurrentModifyTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsConcurrentModifyTest3000';
        console.info(`${caseName} test start`);
        let count = 0;
        let arr = new collections.Array(1, 2, 3, 4, 5, 6, 7, 8);
        try {
          for (let i = 0; i < 100; i++) {
            taskpool.execute(testModifyArray, i, arr).then(() => {
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            })
          }
          for (let i = 0; i < 100; i++) {
            arr.copyWithin(1, 2, 3)
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
     * @tc.name   CollectionsConcurrentModifyTest3100
     * @tc.number SUB_COLLECTION_CONCURRENT_MODIFY_3100
     * @tc.desc   ConcatArray reverse 10200201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsConcurrentModifyTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsConcurrentModifyTest3100';
        console.info(`${caseName} test start`);
        let count = 0;
        let arr = new collections.Array(1, 2, 3, 4, 5, 6, 7, 8);
        try {
          for (let i = 0; i < 100; i++) {
            taskpool.execute(testModifyArray, i, arr).then(() => {
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            })
          }
          for (let i = 0; i < 100; i++) {
            arr.reverse()
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
     * @tc.name   CollectionsConcurrentModifyTest3200
     * @tc.number SUB_COLLECTION_CONCURRENT_MODIFY_3200
     * @tc.desc   ConcatArray lastIndexOf 10200201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsConcurrentModifyTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsConcurrentModifyTest3200';
        console.info(`${caseName} test start`);
        let count = 0;
        let arr = new collections.Array(1, 2, 3, 4, 5, 6, 7, 8);
        try {
          for (let i = 0; i < 100; i++) {
            taskpool.execute(testModifyArray, i, arr).then(() => {
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            })
          }
          for (let i = 0; i < 100; i++) {
            arr.lastIndexOf(2)
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
     * @tc.name   CollectionsConcurrentModifyTest3300
     * @tc.number SUB_COLLECTION_CONCURRENT_MODIFY_3300
     * @tc.desc   ConcatArray every 10200201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsConcurrentModifyTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsConcurrentModifyTest3300';
        console.info(`${caseName} test start`);
        let count = 0;
        let arr = new collections.Array(1, 2, 3, 4, 5, 6, 7, 8);
        try {
          for (let i = 0; i < 100; i++) {
            taskpool.execute(testModifyArray, i, arr).then(() => {
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            })
          }
          for (let i = 0; i < 100; i++) {
            arr.every((element: number) => element > 0)
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
     * @tc.name   CollectionsConcurrentModifyTest3400
     * @tc.number SUB_COLLECTION_CONCURRENT_MODIFY_3400
     * @tc.desc   ConcatArray some 10200201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsConcurrentModifyTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsConcurrentModifyTest3400';
        console.info(`${caseName} test start`);
        let count = 0;
        let arr = new collections.Array(1, 2, 3, 4, 5, 6, 7, 8);
        try {
          for (let i = 0; i < 100; i++) {
            taskpool.execute(testModifyArray, i, arr).then(() => {
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            })
          }
          for (let i = 0; i < 100; i++) {
            arr.some((element: number) => element < 0)
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
     * @tc.name   CollectionsConcurrentModifyTest3500
     * @tc.number SUB_COLLECTION_CONCURRENT_MODIFY_3500
     * @tc.desc   ConcatArray toString 10200201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsConcurrentModifyTest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsConcurrentModifyTest3500';
        console.info(`${caseName} test start`);
        let count = 0;
        let arr = new collections.Array(1, 2, 3, 4, 5, 6, 7, 8);
        try {
          for (let i = 0; i < 100; i++) {
            taskpool.execute(testModifyArray, i, arr).then(() => {
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            })
          }
          for (let i = 0; i < 100; i++) {
            arr.toString()
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
     * @tc.name   CollectionsConcurrentModifyTest3600
     * @tc.number SUB_COLLECTION_CONCURRENT_MODIFY_3600
     * @tc.desc   ConcatArray toLocaleString 10200201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsConcurrentModifyTest3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsConcurrentModifyTest3600';
        console.info(`${caseName} test start`);
        let count = 0;
        let arr = new collections.Array(1, 2, 3, 4, 5, 6, 7, 8);
        try {
          for (let i = 0; i < 100; i++) {
            taskpool.execute(testModifyArray, i, arr).then(() => {
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            })
          }
          for (let i = 0; i < 100; i++) {
            arr.toLocaleString()
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
     * @tc.name   CollectionsConcurrentModifyTest3700
     * @tc.number SUB_COLLECTION_CONCURRENT_MODIFY_3700
     * @tc.desc   ConcatArray reduceRight1 10200201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsConcurrentModifyTest3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsConcurrentModifyTest3700';
        console.info(`${caseName} test start`);
        let count = 0;
        let arr = new collections.Array(1, 2, 3, 4, 5, 6, 7, 8);
        try {
          for (let i = 0; i < 100; i++) {
            taskpool.execute(testModifyArray, i, arr).then(() => {
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            })
          }
          for (let i = 0; i < 100; i++) {
            arr.reduceRight<number>((accumulator: number, value: number) => accumulator + value, 0)
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
     * @tc.name   CollectionsConcurrentModifyTest3800
     * @tc.number SUB_COLLECTION_CONCURRENT_MODIFY_3800
     * @tc.desc   ConcatArray reduceRight2 10200201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsConcurrentModifyTest3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsConcurrentModifyTest3800';
        console.info(`${caseName} test start`);
        let count = 0;
        let arr = new collections.Array(1, 2, 3, 4, 5, 6, 7, 8);
        try {
          for (let i = 0; i < 100; i++) {
            taskpool.execute(testModifyArray, i, arr).then(() => {
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            })
          }
          for (let i = 0; i < 100; i++) {
            arr.reduceRight((accumulator, value) => accumulator + value);
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
     * @tc.name   CollectionsConcurrentModifyTest3900
     * @tc.number SUB_COLLECTION_CONCURRENT_MODIFY_3900
     * @tc.desc   ConcatArray slice 10200201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsConcurrentModifyTest3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsConcurrentModifyTest3900';
        console.info(`${caseName} test start`);
        let count = 0;
        let arrayBuffer: collections.ArrayBuffer = new collections.ArrayBuffer(10);
        try {
          for (let i = 0; i < 100; i++) {
            taskpool.execute(testModifyArrayBuffer, i, arrayBuffer).then(() => {
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            })
          }
          for (let i = 0; i < 100; i++) {
            arrayBuffer.slice(0, 4)
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
       * @tc.number SUB_BUILTINS_Ason1_TEST_0100
       * @tc.name Ason1Test001
       * @tc.desc test Ason parse
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level Level 1
       */
      it('Ason1Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        type ISendable = lang.ISendable;
        const jsonStr: string = "{}";
        const result: object = ArkTSUtils.ASON.parse(jsonStr) as ISendable;
        expect(ArkTSUtils.ASON.stringify(result)).assertEqual('{}');
      });
      /**
       * @tc.number SUB_BUILTINS_Ason1_TEST_0200
       * @tc.name Ason1Test002
       * @tc.desc test Ason parse
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level Level 1
       */
      it('Ason1Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        type ISendable = lang.ISendable;
        const jsonStr: string = "true";
        const result: object = ArkTSUtils.ASON.parse(jsonStr) as ISendable;
        expect(result).assertEqual(true);
      });
      /**
       * @tc.number SUB_BUILTINS_Ason1_TEST_0300
       * @tc.name Ason1Test003
       * @tc.desc test Ason parse
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level Level 1
       */
      it('Ason1Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        type ISendable = lang.ISendable;
        const jsonStr: string = '"typescript"';
        const result: object = ArkTSUtils.ASON.parse(jsonStr) as ISendable ;
        expect(result).assertEqual("typescript");
      });
  
      /**
       * @tc.number SUB_BUILTINS_Ason1_TEST_0400
       * @tc.name Ason1Test004
       * @tc.desc test Ason parse
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level Level 1
       */
      it('Ason1Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        type ISendable = lang.ISendable;
        const jsonStr: string = "[10, 20, 30.5]";
        const result: object = ArkTSUtils.ASON.parse(jsonStr) as ISendable ;
        expect(ArkTSUtils.ASON.stringify(result)).assertEqual(ArkTSUtils.ASON.stringify([10, 20, 30.5]));
      });
  
      /**
       * @tc.number SUB_BUILTINS_Ason1_TEST_0500
       * @tc.name Ason1Test005
       * @tc.desc test Ason parse
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level Level 1
       */
      it('Ason1Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        type ISendable = lang.ISendable;
        const jsonStr: string = "null";
        const result: object = ArkTSUtils.ASON.parse(jsonStr) as ISendable ;
        expect(result).assertEqual(null);
      });
  
      /**
       * @tc.number SUB_BUILTINS_Ason1_TEST_0600
       * @tc.name Ason1Test006
       * @tc.desc test Ason parse
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level Level 1
       */
      it('Ason1Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        type ISendable = lang.ISendable;
        interface Info {
          name: string;
          age: number
        }
  
        interface NestedData {
          id: number;
          info: Info
        }
  
        const jsonStr: string = '{"id": 1, "info": {"name": "Alice", "age": 25}}';
        const obj = ArkTSUtils.ASON.parse(jsonStr) as ISendable ;
        expect(ArkTSUtils.ASON.stringify(obj)).assertEqual('{"id":1,"info":{"name":"Alice","age":25}}');
      });
  
      /**
       * @tc.number SUB_BUILTINS_Ason1_TEST_0700
       * @tc.name Ason1Test007
       * @tc.desc test Ason parse
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level Level 1
       */
      it('Ason1Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        type ISendable = lang.ISendable;
        interface NegNumData {
          negInt: number;
          negFloat: number;
        }
  
        const jsonStr: string = '{"negInt": -100, "negFloat": -15.7}';
        const obj = ArkTSUtils.ASON.parse(jsonStr) as ISendable ;
        expect((obj as object)?.["negInt"]).assertEqual(-100);
      });
  
      /**
       * @tc.number SUB_BUILTINS_Ason1_TEST_0800
       * @tc.name Ason1Test008
       * @tc.desc test Ason parse
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level Level 1
       */
      it('Ason1Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        type ISendable = lang.ISendable;
        const jsonStr: string = '{"a":1, "b":{"c":2, "d":{"e":3}}}';
        const parsed: ISendable = ArkTSUtils.ASON.parse(jsonStr) as ISendable;
        const keys: string[] = [];
        const parsedObj = parsed as Record<string, Object>;
  
        keys.push("a");
        const b = parsedObj["b"] as Record<string, Object>;
  
        keys.push("c");
        const d = b["d"] as Record<string, Object>;
  
        keys.push("e");
  
        keys.push("d");
  
        keys.push("b");
  
        keys.push("");
  
        expect(ArkTSUtils.ASON.stringify(keys)).assertEqual(ArkTSUtils.ASON.stringify(["a", "c", "e", "d", "b", ""]));
      });
      /**
       * @tc.number SUB_BUILTINS_Ason1_TEST_0900
       * @tc.name Ason1Test009
       * @tc.desc test Ason parse
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level Level 1
       */
      it('Ason1Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        type ISendable = lang.ISendable;
        const jsonStr: string = "[1, 2, 3, ]";
        let isSyntaxError: boolean = false;
        try {
          ArkTSUtils.ASON.parse(jsonStr) as ISendable ;
        } catch (error) {
          isSyntaxError = error instanceof SyntaxError;
        }
        expect(isSyntaxError).assertEqual(true);
      });
  
      /**
       * @tc.number SUB_BUILTINS_Ason1_TEST_1000
       * @tc.name Ason1Test010
       * @tc.desc test Ason parse
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level Level 1
       */
      it('Ason1Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        type ISendable = lang.ISendable;
        const jsonStr: string = '{"key": "value", }';
        let isSyntaxError: boolean = false;
        try {
          ArkTSUtils.ASON.parse(jsonStr) as ISendable ;
        } catch (error) {
          isSyntaxError = error instanceof SyntaxError;
        }
        expect(isSyntaxError).assertEqual(true);
      });
  
      /**
       * @tc.number SUB_BUILTINS_Ason1_TEST_1100
       * @tc.name Ason1Test011
       * @tc.desc test Ason parse
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level Level 1
       */
      it('Ason1Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        type ISendable = lang.ISendable;
        const jsonStr: string = '"line1\\nline2"';
        const result: object = ArkTSUtils.ASON.parse(jsonStr) as ISendable ;
        expect(result).assertEqual("line1\nline2");
      });
  
      /**
       * @tc.number SUB_BUILTINS_Ason1_TEST_1200
       * @tc.name Ason1Test012
       * @tc.desc test Ason parse
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level Level 1
       */
      it('Ason1Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        type ISendable = lang.ISendable;
        const jsonStr: string = "[]";
        const result: object = ArkTSUtils.ASON.parse(jsonStr) as ISendable ;
        expect(ArkTSUtils.ASON.stringify(result)).assertEqual(ArkTSUtils.ASON.stringify([]));
      });
  
      /**
       * @tc.number SUB_BUILTINS_Ason1_TEST_1300
       * @tc.name Ason1Test013
       * @tc.desc test Ason parse
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level Level 1
       */
      it('Ason1Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        type ISendable = lang.ISendable;
        const jsonStr: string = "false";
        const result: object = ArkTSUtils.ASON.parse(jsonStr) as ISendable ;
        expect(result).assertEqual(false);
      });
  
      /**
       * @tc.number SUB_BUILTINS_Ason1_TEST_1400
       * @tc.name Ason1Test014
       * @tc.desc test Ason parse
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level Level 1
       */
      it('Ason1Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        type ISendable = lang.ISendable;
        interface ChineseData {
          title: string;
          content: string;
        }
  
        const jsonStr: string = '{"title": "测试"}';
        const obj = ArkTSUtils.ASON.parse(jsonStr) as ISendable ;
        expect(ArkTSUtils.ASON.stringify(obj)).assertEqual('{"title":"测试"}');
      });
  
      /**
       * @tc.number SUB_BUILTINS_Ason1_TEST_1500
       * @tc.name Ason1Test015
       * @tc.desc test Ason parse
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level Level 1
       */
      it('Ason1Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        type ISendable = lang.ISendable;
        const jsonStr: string = "123";
        const result: object = ArkTSUtils.ASON.parse(jsonStr) as ISendable ;
        expect(result).assertEqual(123);
      });
  
      /**
       * @tc.number SUB_BUILTINS_Ason1_TEST_1600
       * @tc.name Ason1Test016
       * @tc.desc test Ason parse
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level Level 1
       */
      it('Ason1Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        type ISendable = lang.ISendable;
        interface FloatData {
          price: number;
        }
  
        const jsonStr: string = '{"price": 99.99}';
        const result: object = ArkTSUtils.ASON.parse(jsonStr) as ISendable ;
        expect(result?.["price"]).assertEqual(99.99);
      });
  
      /**
       * @tc.number SUB_BUILTINS_Ason1_TEST_1700
       * @tc.name Ason1Test017
       * @tc.desc test Ason parse
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level Level 1
       */
      it('Ason1Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        type ISendable = lang.ISendable;
        const jsonStr: string = "[1, 2, 3, ]";
        let isSyntaxError: boolean = false;
        try {
          ArkTSUtils.ASON.parse(jsonStr) as ISendable ;
        } catch (e) {
          isSyntaxError = e instanceof SyntaxError;
        }
        expect(isSyntaxError).assertEqual(true);
      });
  
      /**
       * @tc.number SUB_BUILTINS_Ason1_TEST_1800
       * @tc.name Ason1Test018
       * @tc.desc test Ason parse
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level Level 1
       */
      it('Ason1Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        type ISendable = lang.ISendable;
        const jsonStr: string = "false";
        const result: object = ArkTSUtils.ASON.parse(jsonStr) as ISendable ;
        expect(result).assertEqual(false);
      });
  
      /**
       * @tc.number SUB_BUILTINS_Ason1_TEST_1900
       * @tc.name Ason1Test019
       * @tc.desc test Ason parse
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level Level 1
       */
      it('Ason1Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        type ISendable = lang.ISendable;
        interface SciData {
          value: number;
        }
  
        const jsonStr: string = '{"value": 1.8e4}';
        const result: object = ArkTSUtils.ASON.parse(jsonStr) as ISendable ;
        expect(result?.["value"]).assertEqual(18000);
      });
  
      /**
       * @tc.number SUB_BUILTINS_Ason1_TEST_2000
       * @tc.name Ason1Test020
       * @tc.desc test Ason parse
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level Level 1
       */
      it('Ason1Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        type ISendable = lang.ISendable;
        const jsonStr: string = '[null, "a", "b"]';
        const result: object = ArkTSUtils.ASON.parse(jsonStr) as ISendable ;
        expect(result[0]).assertEqual(null);
      });
  
      /**
       * @tc.number SUB_BUILTINS_Ason1_TEST_2100
       * @tc.name Ason1Test021
       * @tc.desc test Ason parse
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level Level 1
       */
      it('Ason1Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        type ISendable = lang.ISendable;
        const jsonStr: string = '[-1, -3, -5]';
        const result: object = ArkTSUtils.ASON.parse(jsonStr) as ISendable ;
        expect(result[2]).assertEqual(-5);
      });
  
      /**
       * @tc.number SUB_BUILTINS_Ason1_TEST_2200
       * @tc.name Ason1Test022
       * @tc.desc test Ason parse
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level Level 1
       */
      it('Ason1Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        type ISendable = lang.ISendable;
        const jsonStr: string = '{key: "value"}';
        let isSyntaxError: boolean = false;
        try {
          ArkTSUtils.ASON.parse(jsonStr) as ISendable ;
        } catch (e) {
          isSyntaxError = e instanceof SyntaxError;
        }
        expect(isSyntaxError).assertEqual(true);
      });
      /**
       * @tc.number SUB_BUILTINS_Ason1_TEST_2300
       * @tc.name Ason1Test023
       * @tc.desc test Ason parse
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level Level 1
       */
      it('Ason1Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        type ISendable = lang.ISendable;
        const jsonStr: string = '"He said \\"JSON\\""';
        const result: object = ArkTSUtils.ASON.parse(jsonStr) as ISendable ;
        expect(result).assertEqual('He said "JSON"');
      });
  
      /**
       * @tc.number SUB_BUILTINS_Ason1_TEST_2400
       * @tc.name Ason1Test024
       * @tc.desc test Ason parse
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level Level 1
       */
      it('Ason1Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        type ISendable = lang.ISendable;
        const jsonStr: string = '[Infinity]';
        let isSyntaxError: boolean = false;
        try {
          ArkTSUtils.ASON.parse(jsonStr) as ISendable ;
        } catch (e) {
          isSyntaxError = e instanceof SyntaxError;
        }
        expect(isSyntaxError).assertEqual(true);
      });
  
      /**
       * @tc.number SUB_BUILTINS_Ason1_TEST_2500
       * @tc.name Ason1Test025
       * @tc.desc test Ason parse
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level Level 1
       */
      it('Ason1Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        type ISendable = lang.ISendable;
        interface LongNum {
          num: number;
        }
  
        const jsonStr: string = '{"num": 9007199254740991}';
        const result: object = ArkTSUtils.ASON.parse(jsonStr) as ISendable ;
        expect(result?.["num"]).assertEqual(9007199254740991);
      });
  
      /**
       * @tc.number SUB_BUILTINS_Ason1_TEST_2600
       * @tc.name Ason1Test026
       * @tc.desc test Ason parse
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level Level 1
       */
      it('Ason1Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        type ISendable = lang.ISendable;
        const jsonStr: string = '{"a": 1 "b": 2}';
        let isSyntaxError: boolean = false;
        try {
          ArkTSUtils.ASON.parse(jsonStr) as ISendable ;
        } catch (e) {
          isSyntaxError = e instanceof SyntaxError;
        }
        expect(isSyntaxError).assertEqual(true);
      });
  
      /**
       * @tc.number SUB_BUILTINS_Ason1_TEST_2700
       * @tc.name Ason1Test027
       * @tc.desc test Ason parse
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level Level 1
       */
      it('Ason1Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        type ISendable = lang.ISendable;
        interface NoReturn {
          x?: number;
          y: number;
        }
  
        const jsonStr: string = '{"x": 10, "y": 20}';
        const parsed: ISendable = ArkTSUtils.ASON.parse(jsonStr) as ISendable;
  
        const parsedObj = parsed as Record<string, number>;
        const result: NoReturn = {
          y: parsedObj["y"]
        };
  
        expect(result.x).assertEqual(undefined);
      });
  
      /**
       * @tc.number SUB_BUILTINS_Ason1_TEST_2800
       * @tc.name Ason1Test028
       * @tc.desc test Ason parse
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level Level 1
       */
      it('Ason1Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        type ISendable = lang.ISendable;
        interface Key {
          key: String
        }
  
        const jsonStr: string = '[{}, {"key": "val"}]';
        const result: object = ArkTSUtils.ASON.parse(jsonStr) as ISendable ;
        expect(Object.keys(result[0]).length).assertEqual(0);
      });
  
      /**
       * @tc.number SUB_BUILTINS_Ason1_TEST_2900
       * @tc.name Ason1Test029
       * @tc.desc test Ason parse
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level Level 1
       */
      it('Ason1Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        type ISendable = lang.ISendable;
        const jsonStr: string = "123";
        const parsed: ISendable = ArkTSUtils.ASON.parse(jsonStr) as ISendable;
  
        const result: number = (parsed as number) + 77;
  
        expect(result).assertEqual(200);
      });
  
      /**
       * @tc.number SUB_BUILTINS_Ason1_TEST_3000
       * @tc.name Ason1Test030
       * @tc.desc test Ason parse
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level Level 1
       */
      it('Ason1Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        type ISendable = lang.ISendable;
        interface ArrWithObj {
          id: number;
          name: string;
        }
  
        const jsonStr: string = '[{"id": 1, "name": "A"}, {"id": 2, "name": "B"}]';
        const result: object = ArkTSUtils.ASON.parse(jsonStr) as ISendable ;
        expect(result[1].name).assertEqual("B");
      });
  
      /**
       * @tc.number SUB_BUILTINS_Ason1_TEST_3100
       * @tc.name Ason1Test031
       * @tc.desc test Ason parse
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level Level 1
       */
      it('Ason1Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        type ISendable = lang.ISendable;
        const jsonStr: string = '[5, 10]';
        let isStrKey: boolean = true;
  
        const parsed: ISendable = ArkTSUtils.ASON.parse(jsonStr) as ISendable;
  
        const arr = parsed as number[];
        for (let i = 0; i < arr.length; i++) {
          const key = i.toString();
          if (key !== "" && typeof key !== "string") {
            isStrKey = false;
          }
        }
  
        expect(isStrKey).assertEqual(true);
      });
  
      /**
       * @tc.number SUB_BUILTINS_Ason1_TEST_3200
       * @tc.name Ason1Test032
       * @tc.desc test Ason parse
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level Level 1
       */
      it('Ason1Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        type ISendable = lang.ISendable;
        const jsonStr: string = "{'key': 'value'}";
        let isSyntaxError: boolean = false;
        try {
          ArkTSUtils.ASON.parse(jsonStr) as ISendable ;
        } catch (e) {
          isSyntaxError = e instanceof SyntaxError;
        }
        expect(isSyntaxError).assertEqual(true);
      });
  
      /**
       * @tc.number SUB_BUILTINS_Ason1_TEST_3300
       * @tc.name Ason1Test033
       * @tc.desc test Ason parse
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level Level 1
       */
      it('Ason1Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        type ISendable = lang.ISendable;
        interface ObjToArr {
          data: (number | string)[];
        }
  
        interface VObj {
          id: number | string,
          name: number | string
        }
  
        const jsonStr: string = '{"data": {"id": 1, "name": "test"}}';
        const parsed: ISendable = ArkTSUtils.ASON.parse(jsonStr) as ISendable;
  
        const parsedObj = parsed as Record<string, Object>;
        const data = parsedObj["data"] as Record<string, number | string>;
        const dataArray: (number | string)[] = [data["id"], data["name"]];
  
        const result: ObjToArr = {
          data: dataArray
        };
  
        expect(result.data[0]).assertEqual(1);
      });
  
  
      /**
       * @tc.number SUB_BUILTINS_Ason1_TEST_3400
       * @tc.name Ason1Test034
       * @tc.desc test Ason parse
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level Level 1
       */
      it('Ason1Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        type ISendable = lang.ISendable;
        const jsonStr: string = '"C:\\\\Program Files"';
        const result: object = ArkTSUtils.ASON.parse(jsonStr) as ISendable ;
        expect(result).assertEqual("C:\\Program Files");
      });
  
      /**
       * @tc.number SUB_BUILTINS_Ason1_TEST_3500
       * @tc.name Ason1Test035
       * @tc.desc test Ason parse
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level Level 1
       */
      it('Ason1Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        type ISendable = lang.ISendable;
        interface ZeroVal {
          zero: number;
          negZero: number;
        }
  
        const jsonStr: string = '{"zero": 0, "negZero": -0}';
        const result: object = ArkTSUtils.ASON.parse(jsonStr) as ISendable ;
        expect(result?.["zero"]).assertEqual(0);
      });
  
      /**
       * @tc.number SUB_BUILTINS_Ason1_TEST_3600
       * @tc.name Ason1Test036
       * @tc.desc test Ason parse
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level Level 1
       */
      it('Ason1Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        type ISendable = lang.ISendable;
        const jsonStr: string = '"col1\\tcol2\\tcol3"';
        const result: object = ArkTSUtils.ASON.parse(jsonStr) as ISendable ;
        expect(result).assertEqual("col1\tcol2\tcol3");
      });
  
      /**
       * @tc.number SUB_BUILTINS_Ason1_TEST_3700
       * @tc.name Ason1Test037
       * @tc.desc test Ason parse
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level Level 1
       */
      it('Ason1Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        type ISendable = lang.ISendable;
        const jsonStr: string = '{"a": {"b": 1}}';
        let lastKey: string = "";
  
        const parsed: ISendable = ArkTSUtils.ASON.parse(jsonStr) as ISendable;
  
        const parsedObj = parsed as Record<string, Object>;
        const a = parsedObj["a"] as Record<string, Object>;
        const keys = Object.keys(a);
  
        if (keys.length > 0) {
          lastKey = keys[keys.length - 1];
        }
  
        expect(lastKey).assertEqual("b");
      });
  
      /**
       * @tc.number SUB_BUILTINS_Ason1_TEST_3800
       * @tc.name Ason1Test038
       * @tc.desc test Ason parse
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level Level 1
       */
      it('Ason1Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        type ISendable = lang.ISendable;
        const jsonStr: string = '[-1.5, -2.5, -3.5]';
        const result: object = ArkTSUtils.ASON.parse(jsonStr) as ISendable ;
        expect(result[2]).assertEqual(-3.5);
      });
  
      /**
       * @tc.number SUB_BUILTINS_Ason1_TEST_3900
       * @tc.name Ason1Test039
       * @tc.desc test Ason parse
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level Level 1
       */
      it('Ason1Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        type ISendable = lang.ISendable;
        interface BoolToNum {
          success: number;
        }
  
        const jsonStr: string = '{"success": true}';
        const parsed: ISendable = ArkTSUtils.ASON.parse(jsonStr) as ISendable;
  
        const parsedObj = parsed as Record<string, Object>;
        const success = parsedObj["success"] as boolean;
        const successNum = success ? 1 : 0;
  
        const result: BoolToNum = {
          success: successNum
        };
  
        expect(result.success).assertEqual(1);
      });
  
      /**
       * @tc.number SUB_BUILTINS_Ason1_TEST_4000
       * @tc.name Ason1Test040
       * @tc.desc test Ason parse
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level Level 1
       */
      it('Ason1Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        type ISendable = lang.ISendable;
        interface EmptyStr {
          str: string;
        }
  
        const jsonStr: string = '{"str": ""}';
        const result: object = ArkTSUtils.ASON.parse(jsonStr) as ISendable ;
        expect(result?.["str"]).assertEqual("");
      });
  
      /**
       * @tc.number SUB_BUILTINS_Ason1_TEST_4100
       * @tc.name Ason1Test041
       * @tc.desc test Ason parse
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level Level 1
       */
      it('Ason1Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        type ISendable = lang.ISendable;
        const jsonStr: string = "true";
        const result: object = ArkTSUtils.ASON.parse(jsonStr) as ISendable ;
        expect(result).assertEqual(true);
      });
  
      /**
       * @tc.number SUB_BUILTINS_Ason1_TEST_4200
       * @tc.name Ason1Test042
       * @tc.desc test Ason parse
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level Level 1
       */
      it('Ason1Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        type ISendable = lang.ISendable;
        interface Level1 {
          level2: Level2
        }
  
        interface Level2 {
          level3: number,
        }
  
        interface DeepNested {
          level1: Level1
        }
  
        const jsonStr: string = '{"level1": {"level2": {"level3": 5}}}';
        const parsed: ISendable = ArkTSUtils.ASON.parse(jsonStr) as ISendable;
  
        const parsedObj = parsed as Record<string, Object>;
        const level1 = parsedObj["level1"] as Record<string, Object>;
        const level2 = level1["level2"] as Record<string, number>;
        const level3Value = level2["level3"] * 4;
  
        const result: DeepNested = {
          level1: {
            level2: {
              level3: level3Value
            }
          }
        };
  
        expect(result.level1.level2.level3).assertEqual(20);
      });
  
      /**
       * @tc.number SUB_BUILTINS_Ason1_TEST_4300
       * @tc.name Ason1Test043
       * @tc.desc test Ason parse
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level Level 1
       */
      it('Ason1Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        type ISendable = lang.ISendable;
        const jsonStr: string = '"\\u4F60\\u597D"';
        const result: object = ArkTSUtils.ASON.parse(jsonStr) as ISendable ;
        expect(result).assertEqual("你好");
      });
  
      /**
       * @tc.number SUB_BUILTINS_Ason1_TEST_4400
       * @tc.name Ason1Test044
       * @tc.desc test Ason parse
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level Level 1
       */
      it('Ason1Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        type ISendable = lang.ISendable;
        interface InfStr {
          str: string;
        }
  
        const jsonStr: string = '{"str": "Infinity"}';
        const result: object = ArkTSUtils.ASON.parse(jsonStr) as ISendable ;
        expect(result?.["str"]).assertEqual("Infinity");
      });
  
      /**
       * @tc.number SUB_BUILTINS_Ason1_TEST_4500
       * @tc.name Ason1Test045
       * @tc.desc test Ason parse
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level Level 1
       */
      it('Ason1Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        type ISendable = lang.ISendable;
        const jsonStr: string = '{"key": "value"';
        let isSyntaxError: boolean = false;
        try {
          ArkTSUtils.ASON.parse(jsonStr) as ISendable ;
        } catch (e) {
          isSyntaxError = e instanceof SyntaxError;
        }
        expect(isSyntaxError).assertEqual(true);
      });
  
      /**
       * @tc.number SUB_BUILTINS_Ason1_TEST_4600
       * @tc.name Ason1Test046
       * @tc.desc test Ason parse
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level Level 1
       */
      it('Ason1Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        type ISendable = lang.ISendable;
        const jsonStr: string = '[0, 0, 0]';
        const result: object = ArkTSUtils.ASON.parse(jsonStr) as ISendable ;
        expect(result[2]).assertEqual(0);
      });
  
      /**
       * @tc.number SUB_BUILTINS_Ason1_TEST_4700
       * @tc.name Ason1Test047
       * @tc.desc test Ason parse
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level Level 1
       */
      it('Ason1Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        type ISendable = lang.ISendable;
        const jsonStr: string = '"line1\\nline2\\nline3"';
        const result: object = ArkTSUtils.ASON.parse(jsonStr) as ISendable ;
        expect(result).assertEqual("line1\nline2\nline3");
      });
  
      /**
       * @tc.number SUB_BUILTINS_Ason1_TEST_4800
       * @tc.name Ason1Test048
       * @tc.desc test Ason parse
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level Level 1
       */
      it('Ason1Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        type ISendable = lang.ISendable;
        interface FuncStr {
          code: string;
        }
  
        const jsonStr: string = '{"code": "function() {}"}';
        const result: object = ArkTSUtils.ASON.parse(jsonStr) as ISendable ;
        expect(result?.["code"]).assertEqual("function() {}");
      });
  
      /**
       * @tc.number SUB_BUILTINS_Ason1_TEST_4900
       * @tc.name Ason1Test049
       * @tc.desc test Ason parse
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level Level 1
       */
      it('Ason1Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        type ISendable = lang.ISendable;
        interface ObjWithEmptyArr {
          list: never[];
        }
  
        const jsonStr: string = '{"list": []}';
        const result: object = ArkTSUtils.ASON.parse(jsonStr) as ISendable ;
        expect(result?.["list"].length).assertEqual(0);
      });
  
      /**
       * @tc.number SUB_BUILTINS_Ason1_TEST_5000
       * @tc.name Ason1Test050
       * @tc.desc test Ason parse
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level Level 1
       */
      it('Ason1Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        type ISendable = lang.ISendable;
        interface NullVal {
          data: null;
        }
  
        const jsonStr: string = '{"data": null}';
        const result: object = ArkTSUtils.ASON.parse(jsonStr) as ISendable ;
        expect(result?.["data"]).assertEqual(null);
      });
  })
}