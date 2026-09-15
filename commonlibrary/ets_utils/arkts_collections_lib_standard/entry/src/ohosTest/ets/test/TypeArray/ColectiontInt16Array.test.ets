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
export function testTypeArray(index: number, arr: collections.Int16Array) {
  let tag = 'testTypeArray'
  try {
    for (let i = 0; i < 10; i++) {
      arr.copyWithin(2, 1, 2)
      arr.join('')
      arr.slice(1)
      arr.sort()
      arr.fill(10)
    }
  } catch (e) {
    console.info(`${tag} Task execution catch: ${e.message}, code: ${e.code}`);
  }
}

@Concurrent
export function testTypeArray2(index: number, arr: collections.Uint8Array) {
  let tag = 'testTypeArray2'
  try {
    for (let i = 0; i < 10; i++) {
      arr.copyWithin(2, 1, 2)
      arr.join('')
      arr.slice(1)
      arr.sort()
      arr.fill(10)
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

export default function ColectiontInt16Array() {
  describe('ColectiontInt16Array', () => {
    beforeEach(async () => {
      await sleep(100);
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.

    /**
     * @tc.name   CollectionsInt16ArrayTest0100
     * @tc.number SUB_COLLECTION_INT16ARRAY_TEST_0100
     * @tc.desc   TypeArray join 10200201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsInt16ArrayTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsInt16ArrayTest0100';
        console.info(`${caseName} test start`);
        let count = 0;
        let arr: collections.Int16Array = new collections.Int16Array(12);
        try {
          for (let i = 0; i < 100; i++) {
            taskpool.execute(testTypeArray, i, arr).then(() => {
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            })
          }
          for (let i = 0; i < 100; i++) {
            arr.copyWithin(3, 1, 3)
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
     * @tc.name   CollectionsInt16ArrayTest0200
     * @tc.number SUB_COLLECTION_INT16ARRAY_TEST_0200
     * @tc.desc   TypeArray every 10200201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsInt16ArrayTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsInt16ArrayTest0200';
        console.info(`${caseName} test start`);
        let count = 0;
        let arr: collections.Int16Array = new collections.Int16Array(12);
        try {
          for (let i = 0; i < 100; i++) {
            taskpool.execute(testTypeArray, i, arr).then(() => {
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            })
          }
          for (let i = 0; i < 100; i++) {
            arr.every((element: number) => element > 0);
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
     * @tc.name   CollectionsInt16ArrayTest0300
     * @tc.number SUB_COLLECTION_INT16ARRAY_TEST_0300
     * @tc.desc   TypeArray filter 10200201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsInt16ArrayTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsInt16ArrayTest0300';
        console.info(`${caseName} test start`);
        let count = 0;
        let arr: collections.Int16Array = new collections.Int16Array(12);
        try {
          for (let i = 0; i < 100; i++) {
            taskpool.execute(testTypeArray, i, arr).then(() => {
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            })
          }
          for (let i = 0; i < 100; i++) {
            arr.filter((element: number) => element > 0);
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
     * @tc.name   CollectionsInt16ArrayTest0400
     * @tc.number SUB_COLLECTION_INT16ARRAY_TEST_0400
     * @tc.desc   TypeArray filter 10200201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsInt16ArrayTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsInt16ArrayTest0400';
        console.info(`${caseName} test start`);
        let count = 0;
        let arr: collections.Int16Array = new collections.Int16Array(12);
        try {
          for (let i = 0; i < 100; i++) {
            taskpool.execute(testTypeArray, i, arr).then(() => {
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            })
          }
          for (let i = 0; i < 100; i++) {
            arr.find((element: number) => element > 0);
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
     * @tc.name   CollectionsInt16ArrayTest0500
     * @tc.number SUB_COLLECTION_INT16ARRAY_TEST_0500
     * @tc.desc   TypeArray findIndex 10200201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsInt16ArrayTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsInt16ArrayTest0500';
        console.info(`${caseName} test start`);
        let count = 0;
        let arr: collections.Int16Array = new collections.Int16Array(12);
        try {
          for (let i = 0; i < 100; i++) {
            taskpool.execute(testTypeArray, i, arr).then(() => {
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            })
          }
          for (let i = 0; i < 100; i++) {
            arr.findIndex((element: number) => element > 0);
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
     * @tc.name   CollectionsInt16ArrayTest0600
     * @tc.number SUB_COLLECTION_INT16ARRAY_TEST_0600
     * @tc.desc   TypeArray indexOf 10200201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsInt16ArrayTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsInt16ArrayTest0600';
        console.info(`${caseName} test start`);
        let count = 0;
        let arr: collections.Int16Array = new collections.Int16Array(12);
        try {
          for (let i = 0; i < 100; i++) {
            taskpool.execute(testTypeArray, i, arr).then(() => {
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            })
          }
          for (let i = 0; i < 100; i++) {
            arr.indexOf(1);
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
     * @tc.name   CollectionsInt16ArrayTest0700
     * @tc.number SUB_COLLECTION_INT16ARRAY_TEST_0700
     * @tc.desc   TypeArray join 10200201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsInt16ArrayTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsInt16ArrayTest0700';
        console.info(`${caseName} test start`);
        let count = 0;
        let arr: collections.Int16Array = new collections.Int16Array(12);
        try {
          for (let i = 0; i < 100; i++) {
            taskpool.execute(testTypeArray, i, arr).then(() => {
              count++
            }).catch((e: BusinessError) => {
              console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            })
          }
          for (let i = 0; i < 100; i++) {
            arr.join('1');
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
     * @tc.name   CollectionsInt16ArrayTest0800
     * @tc.number SUB_COLLECTION_INT16ARRAY_TEST_0800
     * @tc.desc   TypeArray map 10200201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsInt16ArrayTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsInt16ArrayTest0800';
