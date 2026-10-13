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

import {
  describe,
  it,
  expect,
  TestType,
  Size,
  Level, beforeEach
} from '@ohos/hypium';

import {
  collections,
  worker,
  MessageEvents
} from '@kit.ArkTS';

import {
  createNumberSet,
  createStringSet,
  createRangeNumberSet,
  SendableClass,
  sleep,
} from '../utils/TestUtils';

import { createCompletionFlag, waitForComplete } from '../SharedLock';

interface ErrorRecoverSizeResult {
  errorCode: number;
  sizeBefore: number;
  sizeAfter: number;
}

interface ErrorRecoverTraverseResult {
  errorCode: number;
  traverseCount: number;
  sum: number;
}

function isAcceptedConcurrentResult(code: number): boolean {
  return code === 0 || code === 10200201;
}

export default function collectionsSetWorkerTest() {

  describe('collectionsSetWorkerTest', () => {
    beforeEach(async () => {
      await sleep(50);
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_WORKER_0100
     * @tc.name testSetWorkerReceive0001
     * @tc.desc Verify Worker receives Set reference from main thread.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testSetWorkerReceive0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetWorkerReceive0001';
      console.info(`[${caseName}] start`);
      let set = createNumberSet(100);

      let result: number = 0;
      try {
        result = await new Promise<number>((resolve, reject) => {
          let settled = false;
          const workerInstance: worker.ThreadWorker = new worker.ThreadWorker(
            "./SetWorker"
          );

        workerInstance.onmessage = (event: MessageEvents): void => {
          if (settled) {
            return;
          }
          settled = true;
          resolve(event.data.result as number);
          workerInstance.terminate();
        };

        workerInstance.onerror = (): void => {
          if (settled) {
            return;
          }
          settled = true;
          reject(new Error('worker error'));
          workerInstance.terminate();
        };

        workerInstance.onexit = (): void => {
          if (settled) {
            return;
          }
          settled = true;
          reject(new Error('worker exited before result'));
        };

        workerInstance.postMessageWithSharedSendable({
          type: "size",
          set: set
        });
      });
      } catch (err) {
        console.error(`new Promise failed: ${JSON.stringify(err)}`);
      }
      expect(result).assertEqual(100);
      console.info(`[${caseName}] end`);
      done();
    });

    /**
     * @tc.number SUB_COLLECTIONS_SET_WORKER_0200
     * @tc.name testSetWorkerTraverse0002
     * @tc.desc Verify Worker traverses Set received from main thread.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testSetWorkerTraverse0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetWorkerTraverse0002';
      console.info(`[${caseName}] start`);
      let set = createStringSet(50);

      let result: number = 0;
      try {
        result = await new Promise<number>((resolve, reject) => {
        let settled = false;
        const workerInstance: worker.ThreadWorker = new worker.ThreadWorker(
          "./SetWorker"
        );
        workerInstance.onmessage = (event: MessageEvents): void => {
          if (settled) {
            return;
          }
          settled = true;
          resolve(event.data.result as number);
          workerInstance.terminate();
        };
        workerInstance.onerror = (): void => {
          if (settled) {
            return;
          }
          settled = true;
          reject(new Error('worker error'));
          workerInstance.terminate();
        };
        workerInstance.onexit = (): void => {
          if (settled) {
            return;
          }
          settled = true;
          reject(new Error('worker exited before result'));
        };
        workerInstance.postMessageWithSharedSendable({
          type: "forEachString",
          set: set
        });
      });
      } catch (err) {
        console.error(`new Promise failed: ${JSON.stringify(err)}`);
      }

      expect(result).assertEqual(50);
      console.info(`[${caseName}] end`);
      done();
    });

    /**
     * @tc.number SUB_COLLECTIONS_SET_WORKER_0300
     * @tc.name testSetWorkerModify0003
     * @tc.desc Verify Worker modifies Set and changes are visible to main thread.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testSetWorkerModify0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetWorkerModify0003';
      console.info(`[${caseName}] start`);
      let set = createNumberSet(100);
      let modifyFlag = createCompletionFlag();

      let result: number = 0;
      try {
        result = await new Promise<number>((resolve, reject) => {
        let settled = false;
        const workerInstance: worker.ThreadWorker = new worker.ThreadWorker(
          "./SetWorker"
        );

        workerInstance.onmessage = (event: MessageEvents): void => {
          if (settled) {
            return;
          }
          settled = true;
          resolve(event.data.result as number);
          workerInstance.terminate();
        };

        workerInstance.onerror = (): void => {
          if (settled) {
            return;
          }
          settled = true;
          reject(new Error('worker error'));
          workerInstance.terminate();
        };

        workerInstance.onexit = (): void => {
          if (settled) {
            return;
          }
          settled = true;
          reject(new Error('worker exited before result'));
        };

        workerInstance.postMessageWithSharedSendable({
          type: "add",
          set: set,
          value: 999,
          flag: modifyFlag
        });
      });
      } catch (err) {
        console.error(`new Promise failed: ${JSON.stringify(err)}`);
      }

      waitForComplete(modifyFlag);
      expect(result).assertEqual(101);
      expect(set.has(999)).assertTrue();
      expect(set.size).assertEqual(101);
      console.info(`[${caseName}] end`);
      done();
    });

    /**
     * @tc.number SUB_COLLECTIONS_SET_WORKER_0400
     * @tc.name testSetWorkerDelete0004
     * @tc.desc Verify Worker deletes element from Set.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testSetWorkerDelete0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetWorkerDelete0004';
      console.info(`[${caseName}] start`);
      let set = createNumberSet(100);
      let modifyFlag = createCompletionFlag();

      let result: boolean = false;
      try {
        result = await new Promise<boolean>((resolve, reject) => {
        let settled = false;
        const workerInstance: worker.ThreadWorker = new worker.ThreadWorker(
          "./SetWorker"
        );

        workerInstance.onmessage = (event: MessageEvents): void => {
          if (settled) {
            return;
          }
          settled = true;
          resolve(event.data.result as boolean);
          workerInstance.terminate();
        };

        workerInstance.onerror = (): void => {
          if (settled) {
            return;
          }
          settled = true;
          reject(new Error('worker error'));
          workerInstance.terminate();
        };

        workerInstance.onexit = (): void => {
          if (settled) {
            return;
          }
          settled = true;
          reject(new Error('worker exited before result'));
        };

        workerInstance.postMessageWithSharedSendable({
          type: "delete",
          set: set,
          value: 50,
          flag: modifyFlag
        });
      });
      } catch (err) {
        console.error(`new Promise failed: ${JSON.stringify(err)}`);
      }

      waitForComplete(modifyFlag);
      expect(result).assertTrue();
      expect(set.has(50)).assertFalse();
      expect(set.size).assertEqual(99);
      console.info(`[${caseName}] end`);
      done();
    });

    /**
     * @tc.number SUB_COLLECTIONS_SET_WORKER_0500
     * @tc.name testSetWorkerSendable0005
     * @tc.desc Verify Worker handles Sendable Class Set.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testSetWorkerSendable0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetWorkerSendable0005';
      console.info(`[${caseName}] start`);
      let createFlag = createCompletionFlag();

      let result: collections.Set<SendableClass> = new collections.Set<SendableClass>();
      try {
        result = await new Promise<collections.Set<SendableClass>>((resolve, reject) => {
        let settled = false;
        const workerInstance: worker.ThreadWorker = new worker.ThreadWorker(
          "./SetWorker"
        );

        workerInstance.onmessage = (event: MessageEvents): void => {
          if (settled) {
            return;
          }
          settled = true;
          resolve(event.data.set as collections.Set<SendableClass>);
          workerInstance.terminate();
        };

        workerInstance.onerror = (): void => {
          if (settled) {
            return;
          }
          settled = true;
          reject(new Error('worker error'));
          workerInstance.terminate();
        };

        workerInstance.onexit = (): void => {
          if (settled) {
            return;
          }
          settled = true;
          reject(new Error('worker exited before result'));
        };

        workerInstance.postMessageWithSharedSendable({
          type: "createSendableSet",
          size: 50,
          flag: createFlag
        });
      });
      } catch (err) {
        console.error(`new Promise failed: ${JSON.stringify(err)}`);
      }

      waitForComplete(createFlag);
      expect(result.size).assertEqual(50);
      // 验证所有元素可迭代，确保 SendableClass Set 数据完整
      let iter = result.values();
      let count = 0;
      let item = iter.next();
      while (!item.done) {
        count++;
        item = iter.next();
      }
      expect(count).assertEqual(50);
      console.info(`[${caseName}] end`);
      done();
    });

    /**
     * @tc.number SUB_COLLECTIONS_SET_WORKER_0600
     * @tc.name testSetWorkerCreate0006
     * @tc.desc Verify Worker creates Set and returns to main thread.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testSetWorkerCreate0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetWorkerCreate0006';
      console.info(`[${caseName}] start`);
      let createFlag = createCompletionFlag();
      let result: collections.Set<number> = new collections.Set<number>();
      try {
        result = await new Promise<collections.Set<number>>((resolve, reject) => {
        let settled = false;
        const workerInstance: worker.ThreadWorker = new worker.ThreadWorker(
          "./SetWorker"
        );
        workerInstance.onmessage = (event: MessageEvents): void => {
          if (settled) {
            return;
          }
          settled = true;
          resolve(event.data.set as collections.Set<number>);
          workerInstance.terminate();
        };
        workerInstance.onerror = (): void => {
          if (settled) {
            return;
          }
          settled = true;
          reject(new Error('worker error'));
          workerInstance.terminate();
        };
        workerInstance.onexit = (): void => {
          if (settled) {
            return;
          }
          settled = true;
          reject(new Error('worker exited before result'));
        };
        workerInstance.postMessageWithSharedSendable({
          type: "createSet",
          size: 100,
          flag: createFlag
        });
      });
      } catch (err) {
        console.error(`new Promise failed: ${JSON.stringify(err)}`);
      }
      waitForComplete(createFlag);
      expect(result.size).assertEqual(100);
      expect(result.has(0)).assertTrue();
      expect(result.has(50)).assertTrue();
      expect(result.has(99)).assertTrue();
      console.info(`[${caseName}] end`);
      done();
    });

    /**
     * @tc.number SUB_COLLECTIONS_SET_WORKER_0700
     * @tc.name testSetWorkerNestedContainer0007
     * @tc.desc Verify Worker handles nested Set<Map> container.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testSetWorkerNestedContainer0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetWorkerNestedContainer0007';
      console.info(`[${caseName}] start`);
      let nestedSet = new collections.Set<collections.Map<string, number>>();
      for (let i = 0; i < 10; i++) {
        let map = new collections.Map<string, number>();
        map.set("key_" + i, i);
        nestedSet.add(map);
      }

      let result: number = 0;
      try {
        result = await new Promise<number>((resolve, reject) => {
        let settled = false;
        const workerInstance: worker.ThreadWorker = new worker.ThreadWorker(
          "./SetWorker"
        );

        workerInstance.onmessage = (event: MessageEvents): void => {
          if (settled) {
            return;
          }
          settled = true;
          console.info('Worker nestedSize result: ' + event.data.result);
          resolve(event.data.result as number);
          workerInstance.terminate();
        };

        workerInstance.onerror = (): void => {
          if (settled) {
            return;
          }
          settled = true;
          reject(new Error('worker error'));
          workerInstance.terminate();
        };

        workerInstance.onexit = (): void => {
          if (settled) {
            return;
          }
          settled = true;
          reject(new Error('worker exited before result'));
        };

        workerInstance.postMessageWithSharedSendable({
          type: "nestedSize",
          set: nestedSet
        });
      });
      } catch (err) {
        console.error(`new Promise failed: ${JSON.stringify(err)}`);
      }

      expect(result).assertEqual(10);
      console.info(`[${caseName}] end`);
      done();
    });

    /**
     * @tc.number SUB_COLLECTIONS_SET_WORKER_0800
     * @tc.name testSetWorkerTaskPoolCombine0008
     * @tc.desc Verify Worker passes Set to TaskPool tasks.
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testSetWorkerTaskPoolCombine0008', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetWorkerTaskPoolCombine0008';
      console.info(`[${caseName}] start`);
      let set = createNumberSet(100);

      let result: number = 0;
      try {
        result = await new Promise<number>((resolve, reject) => {
        let settled = false;
        const workerInstance: worker.ThreadWorker = new worker.ThreadWorker(
          "./SetWorker"
        );

        workerInstance.onmessage = (event: MessageEvents): void => {
          if (settled) {
            return;
          }
          settled = true;
          console.info('Worker taskPoolCombine result: ' + event.data.result);
          resolve(event.data.result as number);
          workerInstance.terminate();
        };

        workerInstance.onerror = (): void => {
          if (settled) {
            return;
          }
          settled = true;
          reject(new Error('worker error'));
          workerInstance.terminate();
        };

        workerInstance.onexit = (): void => {
          if (settled) {
            return;
          }
          settled = true;
          reject(new Error('worker exited before result'));
        };

        workerInstance.postMessageWithSharedSendable({
          type: "taskPoolCombine",
          set: set
        });
      });
      } catch (err) {
        console.error(`new Promise failed: ${JSON.stringify(err)}`);
      }

      expect(result).assertEqual(100);
      console.info(`[${caseName}] end`);
      done();
    });

    /**
     * @tc.number SUB_COLLECTIONS_SET_WORKER_0900
     * @tc.name testSetWorkerTaskPoolNotify0009
     * @tc.desc Verify TaskPool modifies Set and notifies Worker.
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testSetWorkerTaskPoolNotify0009', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetWorkerTaskPoolNotify0009';
      console.info(`[${caseName}] start`);
      let set = createNumberSet(100);
      let notifyFlag = createCompletionFlag();

      let result: number = 0;
      try {
        result = await new Promise<number>((resolve, reject) => {
        let settled = false;
        const workerInstance: worker.ThreadWorker = new worker.ThreadWorker(
          "./SetWorker"
        );

        workerInstance.onmessage = (event: MessageEvents): void => {
          if (settled) {
            return;
          }
          settled = true;
          console.info('Worker notify result: ' + event.data.result);
          resolve(event.data.result as number);
          workerInstance.terminate();
        };

        workerInstance.onerror = (): void => {
          if (settled) {
            return;
          }
          settled = true;
          reject(new Error('worker error'));
          workerInstance.terminate();
        };

        workerInstance.onexit = (): void => {
          if (settled) {
            return;
          }
          settled = true;
          reject(new Error('worker exited before result'));
        };

        workerInstance.postMessageWithSharedSendable({
          type: "taskPoolNotify",
          set: set,
          value: 999,
          flag: notifyFlag
        });
      });
      } catch (err) {
        console.error(`new Promise failed: ${JSON.stringify(err)}`);
      }

      waitForComplete(notifyFlag);
      // Worker 内部启动 TaskPool 添加元素后返回新 size
      expect(result).assertEqual(101);
      // 验证主线程的 Set 也被修改了（引用传递）
      expect(set.has(999)).assertTrue();
      expect(set.size).assertEqual(101);
      console.info(`[${caseName}] end`);
      done();
    });

    /**
     * @tc.number SUB_COLLECTIONS_SET_WORKER_1000
     * @tc.name testSetWorkerLargeKeys0010
     * @tc.desc Verify large Set keys concurrent traversal via Worker.
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testSetWorkerLargeKeys0010', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetWorkerLargeKeys0010';
      console.info(`[${caseName}] start`);
      let set = createNumberSet(10000);

      let result: number = 0;
      try {
        result = await new Promise<number>((resolve, reject) => {
        let settled = false;
        const workerInstance: worker.ThreadWorker = new worker.ThreadWorker(
          "./SetWorker"
        );

        workerInstance.onmessage = (event: MessageEvents): void => {
          if (settled) {
            return;
          }
          settled = true;
          console.info('Worker largeKeys result: ' + event.data.result);
          resolve(event.data.result as number);
          workerInstance.terminate();
        };

        workerInstance.onerror = (): void => {
          if (settled) {
            return;
          }
          settled = true;
          reject(new Error('worker error'));
          workerInstance.terminate();
        };

        workerInstance.onexit = (): void => {
          if (settled) {
            return;
          }
          settled = true;
          reject(new Error('worker exited before result'));
        };

        workerInstance.postMessageWithSharedSendable({
          type: "largeKeys",
          set: set
        });
      });
      } catch (err) {
        console.error(`new Promise failed: ${JSON.stringify(err)}`);
      }

      expect(result).assertEqual(10000);
      console.info(`[${caseName}] end`);
      done();
    });

    /**
     * @tc.number SUB_COLLECTIONS_SET_WORKER_1100
     * @tc.name testSetWorkerValuesAdd0011
     * @tc.desc Verify add operation during values traversal triggers error code.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testSetWorkerValuesAdd0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetWorkerValuesAdd0011';
      console.info(`[${caseName}] start`);
      let set = createNumberSet(100);

      let result: number = 0;
      try {
        result = await new Promise<number>((resolve, reject) => {
        let settled = false;
        const workerInstance: worker.ThreadWorker = new worker.ThreadWorker(
          "./SetWorker"
        );

        workerInstance.onmessage = (event: MessageEvents): void => {
          if (settled) {
            return;
          }
          settled = true;
          resolve(event.data.result as number);
          workerInstance.terminate();
        };

        workerInstance.onerror = (): void => {
          if (settled) {
            return;
          }
          settled = true;
          reject(new Error('worker error'));
          workerInstance.terminate();
        };

        workerInstance.onexit = (): void => {
          if (settled) {
            return;
          }
          settled = true;
          reject(new Error('worker exited before result'));
        };

        workerInstance.postMessageWithSharedSendable({
          type: "valuesAddError",
          set: set
        });
      });
      } catch (err) {
        console.error(`new Promise failed: ${JSON.stringify(err)}`);
      }

      expect(isAcceptedConcurrentResult(result)).assertTrue();
      console.info(`[${caseName}] end`);
      done();
    });

    /**
     * @tc.number SUB_COLLECTIONS_SET_WORKER_1200
     * @tc.name testSetWorkerKeysDelete0012
     * @tc.desc Verify delete operation during keys traversal triggers error code.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testSetWorkerKeysDelete0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetWorkerKeysDelete0012';
      console.info(`[${caseName}] start`);
      let set = createNumberSet(100);

      let result: number = 0;
      try {
        result = await new Promise<number>((resolve, reject) => {
        let settled = false;
        const workerInstance: worker.ThreadWorker = new worker.ThreadWorker(
          "./SetWorker"
        );

        workerInstance.onmessage = (event: MessageEvents): void => {
          if (settled) {
            return;
          }
          settled = true;
          resolve(event.data.result as number);
          workerInstance.terminate();
        };

        workerInstance.onerror = (): void => {
          if (settled) {
            return;
          }
          settled = true;
          reject(new Error('worker error'));
          workerInstance.terminate();
        };

        workerInstance.onexit = (): void => {
          if (settled) {
            return;
          }
          settled = true;
          reject(new Error('worker exited before result'));
        };

        workerInstance.postMessageWithSharedSendable({
          type: "keysDeleteError",
          set: set
        });
      });
      } catch (err) {
        console.error(`new Promise failed: ${JSON.stringify(err)}`);
      }

      expect(isAcceptedConcurrentResult(result)).assertTrue();
      console.info(`[${caseName}] end`);
      done();
    });

    /**
     * @tc.number SUB_COLLECTIONS_SET_WORKER_1300
     * @tc.name testSetWorkerErrorRecoverSize0013
     * @tc.desc Verify Set size is correct after concurrent modification error.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testSetWorkerErrorRecoverSize0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetWorkerErrorRecoverSize0013';
      console.info(`[${caseName}] start`);
      let set = createNumberSet(100);

      let result: ErrorRecoverSizeResult = { errorCode: 0, sizeBefore: 0, sizeAfter: 0 };
      try {
        result = await new Promise<ErrorRecoverSizeResult>((resolve, reject) => {
        let settled = false;
        const workerInstance: worker.ThreadWorker = new worker.ThreadWorker(
          "./SetWorker"
        );

        workerInstance.onmessage = (event: MessageEvents): void => {
          if (settled) {
            return;
          }
          settled = true;
          let data = event.data as ErrorRecoverSizeResult;
          resolve(data);
          workerInstance.terminate();
        };

        workerInstance.onerror = (): void => {
          if (settled) {
            return;
          }
          settled = true;
          reject(new Error('worker error'));
          workerInstance.terminate();
        };

        workerInstance.onexit = (): void => {
          if (settled) {
            return;
          }
          settled = true;
          reject(new Error('worker exited before result'));
        };

        workerInstance.postMessageWithSharedSendable({
          type: "errorRecoverSize",
          set: set
        });
      });
      } catch (err) {
        console.error(`new Promise failed: ${JSON.stringify(err)}`);
      }

      expect(isAcceptedConcurrentResult(result.errorCode)).assertTrue();
      expect(result.sizeBefore).assertEqual(result.sizeAfter);
      expect(result.sizeAfter).assertEqual(100);
      expect(set.size).assertEqual(100);
      console.info(`[${caseName}] end`);
      done();
    });

    /**
     * @tc.number SUB_COLLECTIONS_SET_WORKER_1400
     * @tc.name testSetWorkerErrorRecoverTraverse0014
     * @tc.desc Verify Set can be traversed correctly after concurrent modification error.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testSetWorkerErrorRecoverTraverse0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetWorkerErrorRecoverTraverse0014';
      console.info(`[${caseName}] start`);
      let set = createRangeNumberSet(100);

      let result: ErrorRecoverTraverseResult = { errorCode: 0, traverseCount: 0, sum: 0 };
      try {
        result = await new Promise<ErrorRecoverTraverseResult>((resolve, reject) => {
        let settled = false;
        const workerInstance: worker.ThreadWorker = new worker.ThreadWorker(
          "./SetWorker"
        );

        workerInstance.onmessage = (event: MessageEvents): void => {
          if (settled) {
            return;
          }
          settled = true;
          let data = event.data as ErrorRecoverTraverseResult;
          resolve(data);
          workerInstance.terminate();
        };

        workerInstance.onerror = (): void => {
          if (settled) {
            return;
          }
          settled = true;
          reject(new Error('worker error'));
          workerInstance.terminate();
        };

        workerInstance.onexit = (): void => {
          if (settled) {
            return;
          }
          settled = true;
          reject(new Error('worker exited before result'));
        };

        workerInstance.postMessageWithSharedSendable({
          type: "errorRecoverTraverse",
          set: set
        });
      });
      } catch (err) {
        console.error(`new Promise failed: ${JSON.stringify(err)}`);
      }

      expect(isAcceptedConcurrentResult(result.errorCode)).assertTrue();
      expect(result.traverseCount).assertEqual(100);
      expect(result.sum).assertEqual(5050);
      expect(set.size).assertEqual(100);
      console.info(`[${caseName}] end`);
      done();
    });

  });
}
