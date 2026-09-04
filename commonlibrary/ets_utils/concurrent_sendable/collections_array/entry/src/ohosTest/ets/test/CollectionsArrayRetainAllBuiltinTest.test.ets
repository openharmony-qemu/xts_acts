/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import { collections, BuiltinArray, taskpool, worker, MessageEvents } from '@kit.ArkTS';
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';

function sleep(time: number): Promise<void> {
  return new Promise<void>((resolve) => setTimeout(resolve, time));
}

@Concurrent
function WriteRace(array: collections.Array<number>): number {
  let errorCode: number = 0;
  for (let index: number = 0; index < 200; index++) {
    try {
      array.push(666);
    } catch (error) {
      if (error.code === 10200201) {
        errorCode = 10200201;
      } else {
        errorCode = -1;
      }
      break;
    }
  }
  return errorCode;
}

@Concurrent
function builtinRetainAllTask(arr: collections.Array<number>): boolean {
  const elements: number[] = [1, 3];
  return arr.retainAll(elements);
}

class ArrayRetainAllBuiltinMessage {
  arr?: Object;
}

function executeArrayRetainAllBuiltinWorker(arr: collections.Array<number>): Promise<boolean> {
  return new Promise<boolean>((resolve: (value: boolean) => void,
    reject: (reason: Error) => void): void => {
    const workerInstance: worker.ThreadWorker =
      new worker.ThreadWorker("./workers/ArrayRetainAllBuiltinWorker");
    let settled: boolean = false;
    const msg: ArrayRetainAllBuiltinMessage = new ArrayRetainAllBuiltinMessage();
    msg.arr = arr;
    workerInstance.onmessage = (event: MessageEvents): void => {
      settled = true;
      resolve(event.data as boolean);
      workerInstance.terminate();
    };
    workerInstance.onerror = (): void => {
      if (!settled) {
        settled = true;
        reject(new Error("ArrayRetainAllBuiltinWorker error"));
      }
      workerInstance.terminate();
    };
    workerInstance.postMessage(msg);
  });
}

export default function CollectionsArrayRetainAllBuiltinTest(): void {
  describe('CollectionsArrayRetainAllBuiltinTest', (): void => {
    beforeAll((done: Function): void => {
      done();
    });
    beforeEach((done: Function): void => {
      done();
    });
    afterEach((done: Function): void => {
      done();
    });
    afterAll(async (done: Function): Promise<void> => {
      await sleep(20);
      done();
    });

    /**
     * @tc.name   collectionsArrayRetainAllTest1500
     * @tc.number SUB_COLLECTIONS_ARRAY_RETAIN_ALL_1500
     * @tc.desc   Verify retainAll with builtin Array elements throws 10200201 on concurrent write conflict.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsArrayRetainAllTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function): Promise<void> => {
        const caseName: string = 'collectionsArrayRetainAllTest1500';
        console.info(`${caseName}, test start`);
        try {
          const sharedArray: collections.Array<number> = new collections.Array<number>();
          for (let i: number = 0; i < 256; i++) {
            sharedArray.push(i);
          }
          const builtinElements: number[] = [0, 64, 128, 192];
          const writePromises: Array<Promise<Object>> = new Array<Promise<Object>>();
          for (let i: number = 0; i < 100; i++) {
            writePromises.push(taskpool.execute(WriteRace, sharedArray));
          }
          let allowedCode: boolean = true;
          for (let i: number = 0; i < 200; i++) {
            try {
              sharedArray.retainAll(builtinElements);
            } catch (error) {
              if (error.code !== 10200201) {
                allowedCode = false;
                break;
              }
            }
          }
          for (let i: number = 0; i < writePromises.length; i++) {
            const code: number = await writePromises[i] as number;
            expect(code === 0 || code === 10200201).assertEqual(true);
          }
          expect(allowedCode).assertEqual(true);
          expect(sharedArray.length >= 0).assertEqual(true);
        } catch (error) {
          console.info(`${caseName}, test error: ${JSON.stringify(error)}`);
          expect(true).assertFail();
        }
        console.info(`${caseName}, test end`);
        done();
      });

    /**
     * @tc.name   collectionsArrayRetainAllTest3100
     * @tc.number SUB_COLLECTIONS_ARRAY_RETAIN_ALL_3100
     * @tc.desc   Verify retainAll with built-in Array full retain returns false (TC-DT-020).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsArrayRetainAllTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (): void => {
        const caseName: string = 'collectionsArrayRetainAllTest3100';
        console.info(`${caseName}, test start`);
        const receiver: collections.Array<number> = new collections.Array<number>(1, 2, 3, 4);
        expect(receiver.retainAll([1, 2, 3, 4])).assertEqual(false);
        expect(receiver.length).assertEqual(4);
        expect(receiver.at(0)).assertEqual(1);
        expect(receiver.at(1)).assertEqual(2);
        expect(receiver.at(2)).assertEqual(3);
        expect(receiver.at(3)).assertEqual(4);
        console.info(`${caseName}, test end`);
      });

    /**
     * @tc.name   collectionsArrayRetainAllTest3200
     * @tc.number SUB_COLLECTIONS_ARRAY_RETAIN_ALL_3200
     * @tc.desc   Verify retainAll with new Array(n) no own index clears receiver returns true (TC-DT-024).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsArrayRetainAllTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (): void => {
        const caseName: string = 'collectionsArrayRetainAllTest3200';
        console.info(`${caseName}, test start`);
        const receiver: collections.Array<number> = new collections.Array<number>(1, 2, 3);
        const sparseElements: number[] = new Array<number>(3);
        sparseElements[2] = 3;
        expect(receiver.retainAll(sparseElements)).assertEqual(true);
        expect(receiver.length).assertEqual(1);
        expect(receiver.at(0)).assertEqual(3);
        const receiver2: collections.Array<number> = new collections.Array<number>(1, 2, 3);
        expect(receiver2.retainAll(new Array<number>(5))).assertEqual(true);
        expect(receiver2.length).assertEqual(0);
        console.info(`${caseName}, test end`);
      });

    /**
     * @tc.name   collectionsArrayRetainAllTest3300
     * @tc.number SUB_COLLECTIONS_ARRAY_RETAIN_ALL_3300
     * @tc.desc   Verify retainAll with sparse array holes skips holes and compares valid elements (TC-DT-023).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsArrayRetainAllTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (): void => {
        const caseName: string = 'collectionsArrayRetainAllTest3300';
        console.info(`${caseName}, test start`);
        const receiver: collections.Array<number| undefined> = new collections.Array<number| undefined>(1, 2, 3);
        const sparseArr: Array<number| undefined> = [3, , 1, , , 2];
        expect(receiver.retainAll(sparseArr)).assertEqual(false);
        expect(receiver.length).assertEqual(3);
        expect(receiver.at(0)).assertEqual(1);
        expect(receiver.at(1)).assertEqual(2);
        expect(receiver.at(2)).assertEqual(3);
        const receiver2: collections.Array<number| undefined> = new collections.Array<number| undefined>(1, 2, 3);
        const sparseArr2: Array<number| undefined> = [, , , , 2, 2, 1, 100, , , 1, , 200, 6];
        expect(receiver2.retainAll(sparseArr2)).assertEqual(true);
        expect(receiver2.length).assertEqual(2);
        expect(receiver2.at(0)).assertEqual(1);
        expect(receiver2.at(1)).assertEqual(2);
        console.info(`${caseName}, test end`);
      });

    /**
     * @tc.name   collectionsArrayRetainAllTest4700
     * @tc.number SUB_COLLECTIONS_ARRAY_RETAIN_ALL_4700
     * @tc.desc   Verify retainAll preserves receiver order when elements has different order.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsArrayRetainAllTest4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (): void => {
        const caseName: string = 'collectionsArrayRetainAllTest4700';
        console.info(`${caseName}, test start`);
        const receiver2: collections.Array<number> = new collections.Array<number>(5, 6, 7, 8);
        expect(receiver2.retainAll([8, 6])).assertEqual(true);
        expect(receiver2.length).assertEqual(2);
        expect(receiver2.at(0)).assertEqual(6);
        expect(receiver2.at(1)).assertEqual(8);
        console.info(`${caseName}, test end`);
      });

    /**
     * @tc.name   collectionsArrayRetainAllTest4800
     * @tc.number SUB_COLLECTIONS_ARRAY_RETAIN_ALL_4800
     * @tc.desc   Verify retainAll with duplicate elements in input does not affect result.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsArrayRetainAllTest4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (): void => {
        const caseName: string = 'collectionsArrayRetainAllTest4800';
        console.info(`${caseName}, test start`);
        const receiver2: collections.Array<number> = new collections.Array<number>(1, 2, 3);
        expect(receiver2.retainAll([1, 1, 1, 3, 3])).assertEqual(true);
        expect(receiver2.length).assertEqual(2);
        expect(receiver2.at(0)).assertEqual(1);
        expect(receiver2.at(1)).assertEqual(3);
        console.info(`${caseName}, test end`);
      });

    /**
     * @tc.name   collectionsArrayRetainAllTest4900
     * @tc.number SUB_COLLECTIONS_ARRAY_RETAIN_ALL_4900
     * @tc.desc   Verify retainAll keeps all matching duplicates in receiver.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsArrayRetainAllTest4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (): void => {
        const caseName: string = 'collectionsArrayRetainAllTest4900';
        console.info(`${caseName}, test start`);
        const receiver2: collections.Array<number> = new collections.Array<number>(1, 1, 1, 2, 2);
        expect(receiver2.retainAll([1])).assertEqual(true);
        expect(receiver2.length).assertEqual(3);
        expect(receiver2.at(0)).assertEqual(1);
        expect(receiver2.at(1)).assertEqual(1);
        expect(receiver2.at(2)).assertEqual(1);
        console.info(`${caseName}, test end`);
      });

    /**
     * @tc.name   collectionsArrayRetainAllTest5000
     * @tc.number SUB_COLLECTIONS_ARRAY_RETAIN_ALL_5000
     * @tc.desc   Verify retainAll with elements containing items not in receiver only keeps existing ones.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsArrayRetainAllTest5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (): void => {
        const caseName: string = 'collectionsArrayRetainAllTest5000';
        console.info(`${caseName}, test start`);
        const receiver2: collections.Array<number> = new collections.Array<number>(1, 2, 3);
        expect(receiver2.retainAll([1, 2, 6, 7, 3, 8])).assertEqual(false);
        expect(receiver2.length).assertEqual(3);
        expect(receiver2.at(0)).assertEqual(1);
        expect(receiver2.at(1)).assertEqual(2);
        expect(receiver2.at(2)).assertEqual(3);
        console.info(`${caseName}, test end`);
      });

    /**
     * @tc.name   collectionsArrayRetainAllTest3900
     * @tc.number SUB_COLLECTIONS_ARRAY_RETAIN_ALL_3900
     * @tc.desc   Verify retainAll with consecutive duplicates, BuiltinArray input.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsArrayRetainAllTest3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (): void => {
        const caseName: string = 'collectionsArrayRetainAllTest3900';
        console.info(`${caseName}, test start`);
        const receiver: collections.Array<number> = new collections.Array<number>(1, 1, 1, 1, 2, 2, 2, 2);
        expect(receiver.retainAll([1, 1, 1])).assertEqual(true);
        expect(receiver.length).assertEqual(4);
        expect(receiver.at(0)).assertEqual(1);
        expect(receiver.at(1)).assertEqual(1);
        expect(receiver.at(2)).assertEqual(1);
        expect(receiver.at(3)).assertEqual(1);
        const receiver2: collections.Array<number> = new collections.Array<number>(3, 3, 3, 4, 4, 4, 4, 4);
        expect(receiver2.retainAll([3])).assertEqual(true);
        expect(receiver2.length).assertEqual(3);
        expect(receiver2.at(0)).assertEqual(3);
        expect(receiver2.at(1)).assertEqual(3);
        expect(receiver2.at(2)).assertEqual(3);
        console.info(`${caseName}, test end`);
      });

    /**
     * @tc.name   collectionsArrayRetainAllTest4100
     * @tc.number SUB_COLLECTIONS_ARRAY_RETAIN_ALL_4100
     * @tc.desc   Verify retainAll with 10250 elements, BuiltinArray input, retain first 100.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsArrayRetainAllTest4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (): void => {
        const caseName: string = 'collectionsArrayRetainAllTest4100';
        console.info(`${caseName}, test start`);
        const receiver: collections.Array<number> = new collections.Array<number>();
        for (let i: number = 0; i < 10250; i++) {
          receiver.push(i);
        }
        const elements: number[] = new Array<number>(100);
        for (let i: number = 0; i < 100; i++) {
          elements[i] = i;
        }
        expect(receiver.retainAll(elements)).assertEqual(true);
        expect(receiver.length).assertEqual(100);
        expect(receiver.at(0)).assertEqual(0);
        expect(receiver.at(99)).assertEqual(99);
        console.info(`${caseName}, test end`);
      });

    /**
     * @tc.name   collectionsArrayRetainAllTest4300
     * @tc.number SUB_COLLECTIONS_ARRAY_RETAIN_ALL_4300
     * @tc.desc   Verify retainAll with 10250 elements, empty BuiltinArray input clears receiver.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsArrayRetainAllTest4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (): void => {
        const caseName: string = 'collectionsArrayRetainAllTest4300';
        console.info(`${caseName}, test start`);
        const receiver: collections.Array<number> = new collections.Array<number>();
        for (let i: number = 0; i < 10250; i++) {
          receiver.push(i);
        }
        expect(receiver.retainAll([])).assertEqual(true);
        expect(receiver.length).assertEqual(0);
        console.info(`${caseName}, test end`);
      });

    /**
     * @tc.name   collectionsArrayRetainAllTest4400
     * @tc.number SUB_COLLECTIONS_ARRAY_RETAIN_ALL_4400
     * @tc.desc   Verify retainAll(elements) at 1023/1024/1025 element boundaries with BuiltinArray input.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsArrayRetainAllTest4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (): void => {
        const caseName: string = 'collectionsArrayRetainAllTest4400';
        console.info(`${caseName}, test start`);
        for (let n: number = 1023; n <= 1025; n++) {
          const arr: collections.Array<number> = new collections.Array<number>();
          for (let i: number = 0; i < n; i++) {
            arr.push(i);
          }
          const retainElements: number[] = [];
          for (let i: number = 0; i < 100; i++) {
            retainElements.push(i);
          }
          const result: boolean = arr.retainAll(retainElements);
          expect(result).assertEqual(true);
          expect(arr.length).assertEqual(100);
          expect(arr.at(0)).assertEqual(0);
          expect(arr.at(99)).assertEqual(99);
        }
        for (let n: number = 1023; n <= 1025; n++) {
          const arr2: collections.Array<number> = new collections.Array<number>();
          for (let i: number = 0; i < n; i++) {
            arr2.push(i);
          }
          const result2: boolean = arr2.retainAll([]);
          expect(result2).assertEqual(true);
          expect(arr2.length).assertEqual(0);
        }
        console.info(`${caseName}, test end`);
      });

    /**
     * @tc.name   collectionsArrayRetainAllTest4500
     * @tc.number SUB_COLLECTIONS_ARRAY_RETAIN_ALL_4500
     * @tc.desc   Verify retainAll(elements) on empty container with BuiltinArray input.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsArrayRetainAllTest4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (): void => {
        const caseName: string = 'collectionsArrayRetainAllTest4500';
        console.info(`${caseName}, test start`);
        const emptyArr: collections.Array<number> = new collections.Array<number>();
        expect(emptyArr.retainAll([])).assertEqual(false);
        expect(emptyArr.length).assertEqual(0);
        expect(emptyArr.retainAll([1, 2, 3])).assertEqual(false);
        expect(emptyArr.length).assertEqual(0);
        const nonEmptyArr: collections.Array<number> = new collections.Array<number>(1, 2, 3);
        expect(nonEmptyArr.retainAll([])).assertEqual(true);
        expect(nonEmptyArr.length).assertEqual(0);
        nonEmptyArr.push(99);
        expect(nonEmptyArr.length).assertEqual(1);
        expect(nonEmptyArr.at(0)).assertEqual(99);
        console.info(`${caseName}, test end`);
      });

    /**
     * @tc.name   collectionsArrayRetainAllTest4600
     * @tc.number SUB_COLLECTIONS_ARRAY_RETAIN_ALL_4600
     * @tc.desc   Verify retainAll with BuiltinArray partial retain returns true (TC-DT-019).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsArrayRetainAllTest4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (): void => {
        const caseName: string = 'collectionsArrayRetainAllTest4600';
        console.info(`${caseName}, test start`);
        const receiver: collections.Array<number> = new collections.Array<number>(1, 2, 3, 4);
        expect(receiver.retainAll([2, 4])).assertEqual(true);
        expect(receiver.length).assertEqual(2);
        expect(receiver.at(0)).assertEqual(2);
        expect(receiver.at(1)).assertEqual(4);
        console.info(`${caseName}, test end`);
      });

    /**
     * @tc.name   collectionsArrayRetainAllTest5100
     * @tc.number SUB_COLLECTIONS_ARRAY_RETAIN_ALL_5100
     * @tc.desc   Verify retainAll with BuiltinArray input created in TaskPool sub-thread.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsArrayRetainAllTest5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function): Promise<void> => {
        const caseName: string = 'collectionsArrayRetainAllTest5100';
        console.info(`${caseName}, test start`);
        try {
          const arr: collections.Array<number> = new collections.Array<number>(1, 2, 3, 4, 5);
          const result: boolean = await taskpool.execute(builtinRetainAllTask, arr) as boolean;
          expect(result).assertEqual(true);
          expect(arr.length).assertEqual(2);
          expect(arr.at(0)).assertEqual(1);
          expect(arr.at(1)).assertEqual(3);
        } catch (error) {
          console.info(`${caseName}, test error: ${JSON.stringify(error)}`);
          expect(true).assertFail();
        }
        console.info(`${caseName}, test end`);
        done();
      });

    /**
     * @tc.name   collectionsArrayRetainAllTest5200
     * @tc.number SUB_COLLECTIONS_ARRAY_RETAIN_ALL_5200
     * @tc.desc   Verify retainAll with BuiltinArray input created in Worker sub-thread.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsArrayRetainAllTest5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function): Promise<void> => {
        const caseName: string = 'collectionsArrayRetainAllTest5200';
        console.info(`${caseName}, test start`);
        try {
          const arr: collections.Array<number> = new collections.Array<number>(1, 2, 3, 4, 5);
          const result: boolean = await executeArrayRetainAllBuiltinWorker(arr);
          expect(result).assertEqual(true);
          expect(arr.length).assertEqual(5);
        } catch (error) {
          console.info(`${caseName}, test error: ${JSON.stringify(error)}`);
          expect(true).assertFail();
        }
        console.info(`${caseName}, test end`);
        done();
      });

    /**
     * @tc.name   collectionsArrayRetainAllTest5300
     * @tc.number SUB_COLLECTIONS_ARRAY_RETAIN_ALL_5300
     * @tc.desc   Verify retainAll(BuiltinArray) reports bind error 10200011 when method is detached.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsArrayRetainAllTest5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (): void => {
        const caseName: string = 'collectionsArrayRetainAllTest5300';
        console.info(`${caseName}, test start`);
        const receiver: collections.Array<number> = new collections.Array<number>(1, 2, 3);
        const retainAllMethod: (elements: number[]) => boolean = receiver.retainAll;
        let thrown: boolean = false;
        try {
          retainAllMethod([1]);
          expect(true).assertFail();
        } catch (error) {
          thrown = true;
          expect(error.code).assertEqual(10200011);
        }
        expect(thrown).assertEqual(true);
        console.info(`${caseName}, test end`);
      });

    /**
     * @tc.name   collectionsArrayRetainAllTest5400
     * @tc.number SUB_COLLECTIONS_ARRAY_RETAIN_ALL_5400
     * @tc.desc   Verify retainAll with explicitly declared BuiltinArray type input.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsArrayRetainAllTest5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (): void => {
        const caseName: string = 'collectionsArrayRetainAllTest5400';
        console.info(`${caseName}, test start`);
        const receiver: collections.Array<number> = new collections.Array<number>(1, 2, 3, 4, 5);
        const elements: BuiltinArray<number> = [2, 4];
        expect(receiver.retainAll(elements)).assertEqual(true);
        expect(receiver.length).assertEqual(2);
        expect(receiver.at(0)).assertEqual(2);
        expect(receiver.at(1)).assertEqual(4);
        console.info(`${caseName}, test end`);
      });
  });
}
