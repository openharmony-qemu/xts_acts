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
  beforeAll,
  beforeEach,
  afterEach,
  afterAll,
  it,
  expect,
  TestType,
  Size,
  Level
} from '@ohos/hypium';

import {
  collections,
  worker,
  MessageEvents
} from '@kit.ArkTS';

import {
  createNumberSet,
  createStringSet,
  createSendableSet,
  createRangeNumberSet,
} from '../utils/TestUtils';

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

interface NotifyMainResult {
  type: string;
  result: number;
  success: boolean;
  errorCode?: number;
}

interface LargeNestedResult {
  result: number;
  totalElements: number;
}

export default function collectionsSetWorkerTest() {

  describe('CollectionsSetWorkerTest', () => {

    beforeAll(() => {
      console.info('CollectionsSetWorkerTest beforeAll');
    });

    beforeEach(() => {
      console.info('CollectionsSetWorkerTest beforeEach');
    });

    afterEach(() => {
      console.info('CollectionsSetWorkerTest afterEach');
    });

    afterAll(() => {
      console.info('CollectionsSetWorkerTest afterAll');
    });

    /**
     * @tc.number SUB_COLLECTIONS_SET_WORKER_0100
     * @tc.name testSetWorkerReceive0001
     * @tc.desc Verify Worker receives Set reference from main thread.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testSetWorkerReceive0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const caseName = 'testSetWorkerReceive0001';
      console.info(`[${caseName}] start`);
      let set = createNumberSet(100);

      let result = await new Promise<number>((resolve) => {
        const workerInstance: worker.ThreadWorker = new worker.ThreadWorker(
          "./SetWorker"
        );

        workerInstance.onmessage = (event: MessageEvents): void => {
          resolve(event.data.result as number);
          workerInstance.terminate();
        };

        workerInstance.postMessageWithSharedSendable({
          type: "size",
          set: set
        });
      });
      expect(result).assertEqual(100);
      console.info(`[${caseName}] end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_SET_WORKER_0200
     * @tc.name testSetWorkerTraverse0002
     * @tc.desc Verify Worker traverses Set received from main thread.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testSetWorkerTraverse0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const caseName = 'testSetWorkerTraverse0002';
      console.info(`[${caseName}] start`);
      let set = createNumberSet(100);

      let result = await new Promise<number>((resolve) => {
        const workerInstance: worker.ThreadWorker = new worker.ThreadWorker(
          "./SetWorker"
        );
        workerInstance.onmessage = (event: MessageEvents): void => {
          resolve(event.data.result as number);
          workerInstance.terminate();
        };
        workerInstance.postMessageWithSharedSendable({
          type: "forEach",
          set: set
        });
      });

      expect(result).assertEqual(100);
      console.info(`[${caseName}] end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_SET_WORKER_0300
     * @tc.name testSetWorkerModify0003
     * @tc.desc Verify Worker modifies Set and changes are visible to main thread.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testSetWorkerModify0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const caseName = 'testSetWorkerModify0003';
      console.info(`[${caseName}] start`);
      let set = createNumberSet(100);

      let result = await new Promise<number>((resolve) => {
        const workerInstance: worker.ThreadWorker = new worker.ThreadWorker(
          "./SetWorker"
        );

        workerInstance.onmessage = (event: MessageEvents): void => {
          resolve(event.data.result as number);
          workerInstance.terminate();
        };

        workerInstance.postMessageWithSharedSendable({
          type: "add",
          set: set,
          value: 999
        });
      });

      expect(result).assertEqual(101);
      expect(set.has(999)).assertTrue();
      expect(set.size).assertEqual(101);
      console.info(`[${caseName}] end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_SET_WORKER_0400
     * @tc.name testSetWorkerDelete0004
     * @tc.desc Verify Worker deletes element from Set.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testSetWorkerDelete0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const caseName = 'testSetWorkerDelete0004';
      console.info(`[${caseName}] start`);
      let set = createNumberSet(100);

      let result = await new Promise<boolean>((resolve) => {
        const workerInstance: worker.ThreadWorker = new worker.ThreadWorker(
          "./SetWorker"
        );

        workerInstance.onmessage = (event: MessageEvents): void => {
          resolve(event.data.result as boolean);
          workerInstance.terminate();
        };

        workerInstance.postMessageWithSharedSendable({
          type: "delete",
          set: set,
          value: 50
        });
      });

      expect(result).assertTrue();
      expect(set.has(50)).assertFalse();
      expect(set.size).assertEqual(99);
      console.info(`[${caseName}] end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_SET_WORKER_0500
     * @tc.name testSetWorkerSendable0005
     * @tc.desc Verify Worker handles Sendable Class Set.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testSetWorkerSendable0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const caseName = 'testSetWorkerSendable0005';
      console.info(`[${caseName}] start`);
      let set = createSendableSet(50);

      let result = await new Promise<number>((resolve) => {
        const workerInstance: worker.ThreadWorker = new worker.ThreadWorker(
          "./SetWorker"
        );

        workerInstance.onmessage = (event: MessageEvents): void => {
          resolve(event.data.result as number);
          workerInstance.terminate();
        };

        workerInstance.postMessageWithSharedSendable({
          type: "forEachSendable",
          set: set
        });
      });

      expect(result).assertEqual(50);
      console.info(`[${caseName}] end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_SET_WORKER_0600
     * @tc.name testSetWorkerCreate0006
     * @tc.desc Verify Worker creates Set and returns to main thread.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testSetWorkerCreate0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const caseName = 'testSetWorkerCreate0006';
      console.info(`[${caseName}] start`);
      let result = await new Promise<collections.Set<number>>((resolve) => {
        const workerInstance: worker.ThreadWorker = new worker.ThreadWorker(
          "./SetWorker"
        );
        workerInstance.onmessage = (event: MessageEvents): void => {
          resolve(event.data.set as collections.Set<number>);
          workerInstance.terminate();
        };
        workerInstance.postMessageWithSharedSendable({
          type: "createSet",
          size: 100
        });
      });
      expect(result.size).assertEqual(100);
      expect(result.has(50)).assertTrue();
      console.info(`[${caseName}] end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_SET_WORKER_0700
     * @tc.name testSetWorkerNestedContainer0007
     * @tc.desc Verify Worker handles nested Set<Map> container.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testSetWorkerNestedContainer0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const caseName = 'testSetWorkerNestedContainer0007';
      console.info(`[${caseName}] start`);
      let nestedSet = new collections.Set<collections.Map<string, number>>();
      for (let i = 0; i < 10; i++) {
        let map = new collections.Map<string, number>();
        map.set("key_" + i, i);
        nestedSet.add(map);
      }

      let result = await new Promise<number>((resolve) => {
        const workerInstance: worker.ThreadWorker = new worker.ThreadWorker(
          "./SetWorker"
        );

        workerInstance.onmessage = (event: MessageEvents): void => {
          console.info('Worker nestedSize result: ' + event.data.result);
          resolve(event.data.result as number);
          workerInstance.terminate();
        };

        workerInstance.onerror = (error): void => {
          console.error('Worker error: ' + error.message);
          resolve(-1);
          workerInstance.terminate();
        };

        workerInstance.postMessageWithSharedSendable({
          type: "nestedSize",
          set: nestedSet
        });
      });

      expect(result).assertEqual(10);
      console.info(`[${caseName}] end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_SET_WORKER_0800
     * @tc.name testSetWorkerTaskPoolCombine0008
     * @tc.desc Verify Worker passes Set to TaskPool tasks.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testSetWorkerTaskPoolCombine0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const caseName = 'testSetWorkerTaskPoolCombine0008';
      console.info(`[${caseName}] start`);
      let set = createNumberSet(100);

      let result = await new Promise<number>((resolve) => {
        const workerInstance: worker.ThreadWorker = new worker.ThreadWorker(
          "./SetWorker"
        );

        workerInstance.onmessage = (event: MessageEvents): void => {
          console.info('Worker taskPoolCombine result: ' + event.data.result);
          resolve(event.data.result as number);
          workerInstance.terminate();
        };

        workerInstance.onerror = (error): void => {
          console.error('Worker error: ' + error.message);
          resolve(-1);
          workerInstance.terminate();
        };

        workerInstance.postMessageWithSharedSendable({
          type: "taskPoolCombine",
          set: set
        });
      });

      expect(result).assertEqual(100);
      console.info(`[${caseName}] end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_SET_WORKER_0900
     * @tc.name testSetWorkerTaskPoolNotify0009
     * @tc.desc Verify TaskPool modifies Set and notifies Worker.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testSetWorkerTaskPoolNotify0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const caseName = 'testSetWorkerTaskPoolNotify0009';
      console.info(`[${caseName}] start`);
      let set = createNumberSet(100);

      let result = await new Promise<number>((resolve) => {
        const workerInstance: worker.ThreadWorker = new worker.ThreadWorker(
          "./SetWorker"
        );

        workerInstance.onmessage = (event: MessageEvents): void => {
          console.info('Worker notify result: ' + event.data.result);
          resolve(event.data.result as number);
          workerInstance.terminate();
        };

        workerInstance.onerror = (error): void => {
          console.error('Worker error: ' + error.message);
          resolve(-1);
          workerInstance.terminate();
        };

        workerInstance.postMessageWithSharedSendable({
          type: "taskPoolNotify",
          set: set,
          value: 999
        });
      });

      // Worker 内部启动 TaskPool 添加元素后返回新 size
      expect(result).assertEqual(101);
      // 验证主线程的 Set 也被修改了（引用传递）
      expect(set.has(999)).assertTrue();
      expect(set.size).assertEqual(101);
      console.info(`[${caseName}] end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_SET_WORKER_1000
     * @tc.name testSetWorkerLargeKeys0010
     * @tc.desc Verify large Set keys concurrent traversal via Worker.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testSetWorkerLargeKeys0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const caseName = 'testSetWorkerLargeKeys0010';
      console.info(`[${caseName}] start`);
      let set = createNumberSet(10000);

      let result = await new Promise<number>((resolve) => {
        const workerInstance: worker.ThreadWorker = new worker.ThreadWorker(
          "./SetWorker"
        );

        workerInstance.onmessage = (event: MessageEvents): void => {
          console.info('Worker largeKeys result: ' + event.data.result);
          resolve(event.data.result as number);
          workerInstance.terminate();
        };

        workerInstance.onerror = (error): void => {
          console.error('Worker error: ' + error.message);
          resolve(-1);
          workerInstance.terminate();
        };

        workerInstance.postMessageWithSharedSendable({
          type: "largeKeys",
          set: set
        });
      });

      expect(result).assertEqual(10000);
      console.info(`[${caseName}] end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_SET_WORKER_1100
     * @tc.name testSetWorkerEntriesClear0011
     * @tc.desc Verify clear operation during entries traversal triggers error code.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testSetWorkerEntriesClear0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const caseName = 'testSetWorkerEntriesClear0011';
      console.info(`[${caseName}] start`);
      let set = createNumberSet(100);

      let result = await new Promise<number>((resolve) => {
        const workerInstance: worker.ThreadWorker = new worker.ThreadWorker(
          "./SetWorker"
        );

        workerInstance.onmessage = (event: MessageEvents): void => {
          resolve(event.data.result as number);
          workerInstance.terminate();
        };

        workerInstance.onerror = (error): void => {
          resolve(-1);
          workerInstance.terminate();
        };

        workerInstance.postMessageWithSharedSendable({
          type: "entriesClearError",
          set: set
        });
      });

      expect(result).assertEqual(10200201);
      console.info(`[${caseName}] end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_SET_WORKER_1200
     * @tc.name testSetWorkerValuesAdd0012
     * @tc.desc Verify add operation during values traversal triggers error code.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testSetWorkerValuesAdd0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const caseName = 'testSetWorkerValuesAdd0012';
      console.info(`[${caseName}] start`);
      let set = createNumberSet(100);

      let result = await new Promise<number>((resolve) => {
        const workerInstance: worker.ThreadWorker = new worker.ThreadWorker(
          "./SetWorker"
        );

        workerInstance.onmessage = (event: MessageEvents): void => {
          resolve(event.data.result as number);
          workerInstance.terminate();
        };

        workerInstance.onerror = (error): void => {
          resolve(-1);
          workerInstance.terminate();
        };

        workerInstance.postMessageWithSharedSendable({
          type: "valuesAddError",
          set: set
        });
      });

      expect(result).assertEqual(10200201);
      console.info(`[${caseName}] end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_SET_WORKER_1300
     * @tc.name testSetWorkerKeysDelete0013
     * @tc.desc Verify delete operation during keys traversal triggers error code.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testSetWorkerKeysDelete0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const caseName = 'testSetWorkerKeysDelete0013';
      console.info(`[${caseName}] start`);
      let set = createNumberSet(100);

      let result = await new Promise<number>((resolve) => {
        const workerInstance: worker.ThreadWorker = new worker.ThreadWorker(
          "./SetWorker"
        );

        workerInstance.onmessage = (event: MessageEvents): void => {
          resolve(event.data.result as number);
          workerInstance.terminate();
        };

        workerInstance.onerror = (error): void => {
          resolve(-1);
          workerInstance.terminate();
        };

        workerInstance.postMessageWithSharedSendable({
          type: "keysDeleteError",
          set: set
        });
      });

      expect(result).assertEqual(10200201);
      console.info(`[${caseName}] end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_SET_WORKER_1400
     * @tc.name testSetWorkerErrorRecoverSize0014
     * @tc.desc Verify Set size is correct after concurrent modification error.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testSetWorkerErrorRecoverSize0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const caseName = 'testSetWorkerErrorRecoverSize0014';
      console.info(`[${caseName}] start`);
      let set = createNumberSet(100);

      let result = await new Promise<ErrorRecoverSizeResult>((resolve) => {
        const workerInstance: worker.ThreadWorker = new worker.ThreadWorker(
          "./SetWorker"
        );

        workerInstance.onmessage = (event: MessageEvents): void => {
          let data = event.data as ErrorRecoverSizeResult;
          resolve(data);
          workerInstance.terminate();
        };

        workerInstance.onerror = (): void => {
          resolve({ errorCode: -1, sizeBefore: 0, sizeAfter: 0 });
          workerInstance.terminate();
        };

        workerInstance.postMessageWithSharedSendable({
          type: "errorRecoverSize",
          set: set
        });
      });

      expect(result.errorCode).assertEqual(10200201);
      expect(result.sizeBefore).assertEqual(result.sizeAfter);
      expect(result.sizeAfter).assertEqual(100);
      expect(set.size).assertEqual(100);
      console.info(`[${caseName}] end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_SET_WORKER_1500
     * @tc.name testSetWorkerErrorRecoverTraverse0015
     * @tc.desc Verify Set can be traversed correctly after concurrent modification error.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testSetWorkerErrorRecoverTraverse0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const caseName = 'testSetWorkerErrorRecoverTraverse0015';
      console.info(`[${caseName}] start`);
      let set = createRangeNumberSet(100);

      let result = await new Promise<ErrorRecoverTraverseResult>((resolve) => {
        const workerInstance: worker.ThreadWorker = new worker.ThreadWorker(
          "./SetWorker"
        );

        workerInstance.onmessage = (event: MessageEvents): void => {
          let data = event.data as ErrorRecoverTraverseResult;
          resolve(data);
          workerInstance.terminate();
        };

        workerInstance.onerror = (): void => {
          resolve({ errorCode: -1, traverseCount: 0, sum: 0 });
          workerInstance.terminate();
        };

        workerInstance.postMessageWithSharedSendable({
          type: "errorRecoverTraverse",
          set: set
        });
      });

      expect(result.errorCode).assertEqual(10200201);
      expect(result.traverseCount).assertEqual(100);
      expect(result.sum).assertEqual(5050);
      expect(set.size).assertEqual(100);
      console.info(`[${caseName}] end`);
    });

  });
}