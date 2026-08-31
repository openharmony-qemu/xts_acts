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

import { collections, taskpool, worker, MessageEvents } from '@kit.ArkTS';
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';

function sleep(time: number): Promise<void> {
  return new Promise<void>((resolve) => setTimeout(resolve, time));
}

@Concurrent
function builtinContainsAllTask(arr: collections.Array<number>): boolean {
  const elements: number[] = [1, 3, 5];
  return arr.containsAll(elements);
}

class ArrayContainsAllBuiltinMessage {
  arr?: Object;
}

function executeArrayContainsAllBuiltinWorker(arr: collections.Array<number>): Promise<boolean> {
  return new Promise<boolean>((resolve: (value: boolean) => void,
    reject: (reason: Error) => void): void => {
    const workerInstance: worker.ThreadWorker =
      new worker.ThreadWorker("./workers/ArrayContainsAllBuiltinWorker");
    let settled: boolean = false;
    const msg: ArrayContainsAllBuiltinMessage = new ArrayContainsAllBuiltinMessage();
    msg.arr = arr;
    workerInstance.onmessage = (event: MessageEvents): void => {
      settled = true;
      resolve(event.data as boolean);
      workerInstance.terminate();
    };
    workerInstance.onerror = (): void => {
      if (!settled) {
        settled = true;
        reject(new Error("ArrayContainsAllBuiltinWorker error"));
      }
      workerInstance.terminate();
    };
    workerInstance.postMessage(msg);
  });
}

export default function CollectionsArrayContainsAllBuiltinTest(): void {
  describe('CollectionsArrayContainsAllBuiltinTest', (): void => {
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
     * @tc.name   collectionsArrayContainsAllTest2500
     * @tc.number SUB_COLLECTIONS_ARRAY_CONTAINS_ALL_2500
     * @tc.desc   Verify containsAll does not check prototype chain of built-in Array input.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsArrayContainsAllTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (): void => {
        const caseName: string = 'collectionsArrayContainsAllTest2500';
        console.info(`${caseName}, test start`);
        const arr: collections.Array<number> = new collections.Array<number>(1, 2, 3);
        const elements: number[] = [1, 2];
        expect(arr.containsAll(elements)).assertEqual(true);
        console.info(`${caseName}, test end`);
      });

    /**
     * @tc.name   collectionsArrayContainsAllTest2800
     * @tc.number SUB_COLLECTIONS_ARRAY_CONTAINS_ALL_2800
     * @tc.desc   Verify bind error code 10200011 and message for containsAll.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsArrayContainsAllTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (): void => {
        const caseName: string = 'collectionsArrayContainsAllTest2800';
        console.info(`${caseName}, test start`);
        const receiver: collections.Array<number> = new collections.Array<number>(1, 2, 3);
        const containsAllMethod: (elements: number[]) => boolean = receiver.containsAll;
        let thrown: boolean = false;
        try {
          const numberArr: number[] = [1];
          containsAllMethod(numberArr);
          expect(true).assertFail();
        } catch (error) {
          thrown = true;
          expect(error.code).assertEqual(10200011);
        }
        expect(thrown).assertEqual(true);
        console.info(`${caseName}, test end`);
      });

    /**
     * @tc.name   collectionsArrayContainsAllTest5600
     * @tc.number SUB_COLLECTIONS_ARRAY_CONTAINS_ALL_5600
     * @tc.desc   Verify containsAll returns false when some elements are not contained (TC-DT-002).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsArrayContainsAllTest5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (): void => {
        const caseName: string = 'collectionsArrayContainsAllTest5600';
        console.info(`${caseName}, test start`);
        const receiver: collections.Array<number> = new collections.Array<number>(1, 2, 3, 3);
        expect(receiver.containsAll([4])).assertEqual(false);
        console.info(`${caseName}, test end`);
      });

    /**
     * @tc.name   collectionsArrayContainsAllTest3200
     * @tc.number SUB_COLLECTIONS_ARRAY_CONTAINS_ALL_3200
     * @tc.desc   Verify containsAll treats new Array(n) with no own properties as empty input (TC-DT-006).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsArrayContainsAllTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (): void => {
        const caseName: string = 'collectionsArrayContainsAllTest3200';
        console.info(`${caseName}, test start`);
        const receiver: collections.Array<number> = new collections.Array<number>(1, 2, 3);
        expect(receiver.containsAll(new Array<number>(0))).assertEqual(true);
        expect(receiver.containsAll(new Array<number>(3))).assertEqual(true);
        console.info(`${caseName}, test end`);
      });

    /**
     * @tc.name   collectionsArrayContainsAllTest5700
     * @tc.number SUB_COLLECTIONS_ARRAY_CONTAINS_ALL_5700
     * @tc.desc   Verify containsAll returns true with different order (Kotlin semantics: check each element exists).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsArrayContainsAllTest5700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (): void => {
        const caseName: string = 'collectionsArrayContainsAllTest5700';
        console.info(`${caseName}, test start`);
        const receiver: collections.Array<number> = new collections.Array<number>(1, 2, 3);
        expect(receiver.containsAll([3, 1, 2])).assertEqual(true);
        expect(receiver.containsAll([2, 3, 1])).assertEqual(true);
        console.info(`${caseName}, test end`);
      });

    /**
     * @tc.name   collectionsArrayContainsAllTest5800
     * @tc.number SUB_COLLECTIONS_ARRAY_CONTAINS_ALL_5800
     * @tc.desc   Verify containsAll returns true when elements has duplicates all in receiver.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsArrayContainsAllTest5800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (): void => {
        const caseName: string = 'collectionsArrayContainsAllTest5800';
        console.info(`${caseName}, test start`);
        const receiver: collections.Array<number> = new collections.Array<number>(1, 2, 3);
        expect(receiver.containsAll([1, 1, 1, 2, 2, 3])).assertEqual(true);
        console.info(`${caseName}, test end`);
      });

    /**
     * @tc.name   collectionsArrayContainsAllTest5900
     * @tc.number SUB_COLLECTIONS_ARRAY_CONTAINS_ALL_5900
     * @tc.desc   Verify containsAll returns false when elements has duplicates but some not in receiver.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsArrayContainsAllTest5900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (): void => {
        const caseName: string = 'collectionsArrayContainsAllTest5900';
        console.info(`${caseName}, test start`);
        const receiver: collections.Array<number> = new collections.Array<number>(1, 2);
        expect(receiver.containsAll([1, 1, 2, 3])).assertEqual(false);
        console.info(`${caseName}, test end`);
      });

    /**
     * @tc.name   collectionsArrayContainsAllTest6000
     * @tc.number SUB_COLLECTIONS_ARRAY_CONTAINS_ALL_6000
     * @tc.desc   Verify containsAll returns true when elements longer than receiver but all contained.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsArrayContainsAllTest6000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (): void => {
        const caseName: string = 'collectionsArrayContainsAllTest6000';
        console.info(`${caseName}, test start`);
        const receiver: collections.Array<number> = new collections.Array<number>(1);
        expect(receiver.containsAll([1, 1, 1])).assertEqual(true);
        const receiver2: collections.Array<number> = new collections.Array<number>(1, 2);
        expect(receiver2.containsAll([1, 2, 2, 1, 1])).assertEqual(true);
        console.info(`${caseName}, test end`);
      });

    /**
     * @tc.name   collectionsArrayContainsAllTest6100
     * @tc.number SUB_COLLECTIONS_ARRAY_CONTAINS_ALL_6100
     * @tc.desc   Verify containsAll returns true when receiver has duplicate elements.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsArrayContainsAllTest6100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (): void => {
        const caseName: string = 'collectionsArrayContainsAllTest6100';
        console.info(`${caseName}, test start`);
        const receiver: collections.Array<number> = new collections.Array<number>(1, 1, 2, 2);
        expect(receiver.containsAll([1, 1, 2])).assertEqual(true);
        console.info(`${caseName}, test end`);
      });

    /**
     * @tc.name   collectionsArrayContainsAllTest3900
     * @tc.number SUB_COLLECTIONS_ARRAY_CONTAINS_ALL_3900
     * @tc.desc   Verify containsAll with consecutive duplicate elements in BuiltinArray input.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsArrayContainsAllTest3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (): void => {
        const caseName: string = 'collectionsArrayContainsAllTest3900';
        console.info(`${caseName}, test start`);
        const receiver: collections.Array<number> = new collections.Array<number>(1, 1, 1, 1, 2, 2, 2, 2);
        expect(receiver.containsAll([1, 1, 1, 1, 1])).assertEqual(true);
        expect(receiver.containsAll([2, 2, 2, 2, 2, 2])).assertEqual(true);
        expect(receiver.containsAll([1, 2, 1, 2, 1, 2])).assertEqual(true);
        console.info(`${caseName}, test end`);
      });

    /**
     * @tc.name   collectionsArrayContainsAllTest4100
     * @tc.number SUB_COLLECTIONS_ARRAY_CONTAINS_ALL_4100
     * @tc.desc   Verify containsAll with 10250 elements, BuiltinArray input, all contained.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsArrayContainsAllTest4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (): void => {
        const caseName: string = 'collectionsArrayContainsAllTest4100';
        console.info(`${caseName}, test start`);
        const receiver: collections.Array<number> = new collections.Array<number>();
        for (let i: number = 0; i < 10250; i++) {
          receiver.push(i);
        }
        expect(receiver.containsAll([0, 5125, 10249])).assertEqual(true);
        expect(receiver.containsAll([1, 2, 3, 65534, 10249])).assertEqual(true);
        console.info(`${caseName}, test end`);
      });

    /**
     * @tc.name   collectionsArrayContainsAllTest4300
     * @tc.number SUB_COLLECTIONS_ARRAY_CONTAINS_ALL_4300
     * @tc.desc   Verify containsAll with 10250 elements, BuiltinArray input, some not contained.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsArrayContainsAllTest4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (): void => {
        const caseName: string = 'collectionsArrayContainsAllTest4300';
        console.info(`${caseName}, test start`);
        const receiver: collections.Array<number> = new collections.Array<number>();
        for (let i: number = 0; i < 10250; i++) {
          receiver.push(i);
        }
        expect(receiver.containsAll([0, 10250])).assertEqual(false);
        expect(receiver.containsAll([10249, 10250, 10251])).assertEqual(false);
        console.info(`${caseName}, test end`);
      });

    /**
     * @tc.name   collectionsArrayContainsAllTest4400
     * @tc.number SUB_COLLECTIONS_ARRAY_CONTAINS_ALL_4400
     * @tc.desc   Verify collections.Array instanceof and method availability with BuiltinArray input.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsArrayContainsAllTest4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (): void => {
        const caseName: string = 'collectionsArrayContainsAllTest4400';
        console.info(`${caseName}, test start`);
        const arr: collections.Array<number> = new collections.Array<number>(1, 2, 3);
        expect(arr instanceof collections.Array).assertEqual(true);
        expect(arr.containsAll !== undefined).assertEqual(true);
        expect(arr.retainAll !== undefined).assertEqual(true);
        expect(arr.length).assertEqual(3);
        const elements: number[] = [1, 2];
        expect(arr.containsAll(elements)).assertEqual(true);
        arr.retainAll(elements);
        expect(arr.length).assertEqual(2);
        console.info(`${caseName}, test end`);
      });

    /**
     * @tc.name   collectionsArrayContainsAllTest4500
     * @tc.number SUB_COLLECTIONS_ARRAY_CONTAINS_ALL_4500
     * @tc.desc   Verify containsAll at 1023/1024/1025 element boundaries with BuiltinArray input.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsArrayContainsAllTest4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (): void => {
        const caseName: string = 'collectionsArrayContainsAllTest4500';
        console.info(`${caseName}, test start`);
        for (let n: number = 1023; n <= 1025; n++) {
          const arr: collections.Array<number> = new collections.Array<number>();
          for (let i: number = 0; i < n; i++) {
            arr.push(i);
          }
          const mid: number = Math.floor(n / 2);
          expect(arr.containsAll([0, mid, n - 1])).assertEqual(true);
          expect(arr.length).assertEqual(n);
          expect(arr.containsAll([n])).assertEqual(false);
          expect(arr.containsAll([])).assertEqual(true);
        }
        console.info(`${caseName}, test end`);
      });

    /**
     * @tc.name   collectionsArrayContainsAllTest4600
     * @tc.number SUB_COLLECTIONS_ARRAY_CONTAINS_ALL_4600
     * @tc.desc   Verify containsAll on empty container with various BuiltinArray inputs.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsArrayContainsAllTest4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (): void => {
        const caseName: string = 'collectionsArrayContainsAllTest4600';
        console.info(`${caseName}, test start`);
        const emptyArr: collections.Array<number> = new collections.Array<number>();
        expect(emptyArr.containsAll([])).assertEqual(true);
        expect(emptyArr.length).assertEqual(0);
        expect(emptyArr.containsAll([1, 2, 3])).assertEqual(false);
        const nonEmptyArr: collections.Array<number> = new collections.Array<number>(1, 2, 3);
        expect(nonEmptyArr.containsAll([])).assertEqual(true);
        expect(emptyArr.at(0)).assertEqual(undefined);
        expect(emptyArr.indexOf(0)).assertEqual(-1);
        console.info(`${caseName}, test end`);
      });

    /**
     * @tc.name   collectionsArrayContainsAllTest4700
     * @tc.number SUB_COLLECTIONS_ARRAY_CONTAINS_ALL_4700
     * @tc.desc   Verify containsAll SameValueZero NaN equality with BuiltinArray input.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsArrayContainsAllTest4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (): void => {
        const caseName: string = 'collectionsArrayContainsAllTest4700';
        console.info(`${caseName}, test start`);
        const arr: collections.Array<number> = new collections.Array<number>(NaN, 1, 2);
        expect(arr.containsAll([NaN])).assertEqual(true);
        console.info(`${caseName}, test end`);
      });

    /**
     * @tc.name   collectionsArrayContainsAllTest4800
     * @tc.number SUB_COLLECTIONS_ARRAY_CONTAINS_ALL_4800
     * @tc.desc   Verify containsAll SameValueZero positive/negative zero equality with BuiltinArray input.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsArrayContainsAllTest4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (): void => {
        const caseName: string = 'collectionsArrayContainsAllTest4800';
        console.info(`${caseName}, test start`);
        const arr: collections.Array<number> = new collections.Array<number>(+0, 1, 2);
        expect(arr.containsAll([-0])).assertEqual(true);
        console.info(`${caseName}, test end`);
      });

    /**
     * @tc.name   collectionsArrayContainsAllTest4900
     * @tc.number SUB_COLLECTIONS_ARRAY_CONTAINS_ALL_4900
     * @tc.desc   Verify containsAll does not convert types with BuiltinArray input.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsArrayContainsAllTest4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (): void => {
        const caseName: string = 'collectionsArrayContainsAllTest4900';
        console.info(`${caseName}, test start`);
        const arr: collections.Array<number | string> = new collections.Array<number | string>(1, '2');
        const elements: Array<number | string> = ['1'];
        expect(arr.containsAll(elements)).assertEqual(false);
        console.info(`${caseName}, test end`);
      });

    /**
     * @tc.name   collectionsArrayContainsAllTest5000
     * @tc.number SUB_COLLECTIONS_ARRAY_CONTAINS_ALL_5000
     * @tc.desc   Verify containsAll reference equality with BuiltinArray input.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsArrayContainsAllTest5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (): void => {
        const caseName: string = 'collectionsArrayContainsAllTest5000';
        console.info(`${caseName}, test start`);
        const ref: collections.Array<number> = new collections.Array<number>(1, 2, 3);
        const arr: collections.Array<collections.Array<number>> =
          new collections.Array<collections.Array<number>>(ref);
        const elements: collections.Array<number>[] = [ref];
        expect(arr.containsAll(elements)).assertEqual(true);
        console.info(`${caseName}, test end`);
      });

    /**
     * @tc.name   collectionsArrayContainsAllTest5100
     * @tc.number SUB_COLLECTIONS_ARRAY_CONTAINS_ALL_5100
     * @tc.desc   Verify containsAll does not compare structurally with BuiltinArray input.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsArrayContainsAllTest5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (): void => {
        const caseName: string = 'collectionsArrayContainsAllTest5100';
        console.info(`${caseName}, test start`);
        const ref1: collections.Array<number> = new collections.Array<number>(1, 2, 3);
        const ref2: collections.Array<number> = new collections.Array<number>(1, 2, 3);
        const arr: collections.Array<collections.Array<number>> =
          new collections.Array<collections.Array<number>>(ref1);
        const elements: collections.Array<number>[] = [ref2];
        expect(arr.containsAll(elements)).assertEqual(false);
        console.info(`${caseName}, test end`);
      });

    /**
     * @tc.name   collectionsArrayContainsAllTest5200
     * @tc.number SUB_COLLECTIONS_ARRAY_CONTAINS_ALL_5200
     * @tc.desc   Verify containsAll null equality with BuiltinArray input.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsArrayContainsAllTest5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (): void => {
        const caseName: string = 'collectionsArrayContainsAllTest5200';
        console.info(`${caseName}, test start`);
        const arr: collections.Array<number | null> = new collections.Array<number | null>(null, 1);
        const elements: Array<number | null> = [null];
        expect(arr.containsAll(elements)).assertEqual(true);
        console.info(`${caseName}, test end`);
      });

    /**
     * @tc.name   collectionsArrayContainsAllTest5300
     * @tc.number SUB_COLLECTIONS_ARRAY_CONTAINS_ALL_5300
     * @tc.desc   Verify containsAll boolean equality with BuiltinArray input.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsArrayContainsAllTest5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (): void => {
        const caseName: string = 'collectionsArrayContainsAllTest5300';
        console.info(`${caseName}, test start`);
        const arr: collections.Array<boolean> = new collections.Array<boolean>(true, false);
        expect(arr.containsAll([true])).assertEqual(true);
        console.info(`${caseName}, test end`);
      });

    /**
     * @tc.name   collectionsArrayContainsAllTest5400
     * @tc.number SUB_COLLECTIONS_ARRAY_CONTAINS_ALL_5400
     * @tc.desc   Verify containsAll string equality with BuiltinArray input.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsArrayContainsAllTest5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (): void => {
        const caseName: string = 'collectionsArrayContainsAllTest5400';
        console.info(`${caseName}, test start`);
        const arr: collections.Array<string> = new collections.Array<string>('hello', 'world');
        expect(arr.containsAll(['hello'])).assertEqual(true);
        console.info(`${caseName}, test end`);
      });

    /**
     * @tc.name   collectionsArrayContainsAllTest5500
     * @tc.number SUB_COLLECTIONS_ARRAY_CONTAINS_ALL_5500
     * @tc.desc   Verify containsAll returns true when all elements are contained (TC-DT-001) with BuiltinArray input.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsArrayContainsAllTest5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (): void => {
        const caseName: string = 'collectionsArrayContainsAllTest5500';
        console.info(`${caseName}, test start`);
        const receiver: collections.Array<number> = new collections.Array<number>(1, 2, 3, 3);
        expect(receiver.containsAll([1, 3])).assertEqual(true);
        expect(receiver.containsAll([1, 2, 3])).assertEqual(true);
        expect(receiver.containsAll([3, 2, 2, 1])).assertEqual(true);
        expect(receiver.length).assertEqual(4);
        expect(receiver.at(0)).assertEqual(1);
        expect(receiver.at(1)).assertEqual(2);
        expect(receiver.at(2)).assertEqual(3);
        expect(receiver.at(3)).assertEqual(3);
        console.info(`${caseName}, test end`);
      });

    /**
     * @tc.name   collectionsArrayContainsAllTest6200
     * @tc.number SUB_COLLECTIONS_ARRAY_CONTAINS_ALL_6200
     * @tc.desc   Verify containsAll with BuiltinArray input created in TaskPool sub-thread.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsArrayContainsAllTest6200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function): Promise<void> => {
        const caseName: string = 'collectionsArrayContainsAllTest6200';
        console.info(`${caseName}, test start`);
        try {
          const arr: collections.Array<number> = new collections.Array<number>();
          for (let i: number = 1; i <= 10; i++) {
            arr.push(i);
          }
          const result: boolean = await taskpool.execute(builtinContainsAllTask, arr) as boolean;
          expect(result).assertEqual(true);
          expect(arr.length).assertEqual(10);
        } catch (error) {
          console.info(`${caseName}, test error: ${JSON.stringify(error)}`);
          expect(true).assertFail();
        }
        console.info(`${caseName}, test end`);
        done();
      });

    /**
     * @tc.name   collectionsArrayContainsAllTest6300
     * @tc.number SUB_COLLECTIONS_ARRAY_CONTAINS_ALL_6300
     * @tc.desc   Verify containsAll with BuiltinArray input created in Worker sub-thread.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsArrayContainsAllTest6300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function): Promise<void> => {
        const caseName: string = 'collectionsArrayContainsAllTest6300';
        console.info(`${caseName}, test start`);
        try {
          const arr: collections.Array<number> = new collections.Array<number>();
          for (let i: number = 1; i <= 10; i++) {
            arr.push(i);
          }
          const result: boolean = await executeArrayContainsAllBuiltinWorker(arr);
          expect(result).assertEqual(true);
          expect(arr.length).assertEqual(10);
        } catch (error) {
          console.info(`${caseName}, test error: ${JSON.stringify(error)}`);
          expect(true).assertFail();
        }
        console.info(`${caseName}, test end`);
        done();
      });
  });
}
