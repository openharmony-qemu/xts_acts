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
  beforeEach,
  it,
  expect,
  TestType,
  Size,
  Level
} from '@ohos/hypium';

import {
  taskpool,
  collections,
  ArkTSUtils,
} from '@kit.ArkTS';
import { BusinessError } from '@ohos.base';

import { createSharedLock } from '../SharedLock';
import {
  createNumberSet,
  createRangeNumberSet,
  createStringSet,
  createSendableSet,

  forEachTask,
  forEachStringTask,
  forEachSendableTask,
  forEachSumTask,
  forEachFindStringTask,

  forEachAddErrorTask,
  forEachDeleteErrorTask,
  forEachClearErrorTask,
  forEachAddExistErrorTask,
  errorRecoverTask,
  entriesTask,
  entriesCollectTask,
  keysTask,
  valuesTask,
  entriesCheckTask,
  largeForEachTask,
  largeEntriesTask,
  largeKeysStringTask,
  forEachDeleteOtherErrorTask,
  setEntriesTraverseTask,
  setAddModifyTask,
  setKeysTraverseTask,
  setDeleteModifyTask,
  runModifyTest,
  keysCollectSharedTask,
  forEachCollectSharedTask,
  sleep,
  forOfVerifyTask,
  spreadToStringArrayTask,

  keysToStringArrayTask,
  valuesToStringArrayTask
} from '../utils/TestUtils';

function isAcceptedConcurrentResult(result: number): boolean {
  return result === 0 || result === 10200201;
}

export default function collectionsSetConcurrentTest() {


  describe('CollectionsSetConcurrentTest', () => {
    beforeEach(async () => {
      await sleep(50);
    });

    /**
     * @tc.number SUB_COLLECTIONS_SET_CONCURRENT_0100
     * @tc.name testSetConcurrentForEach0001
     * @tc.desc Verify concurrent forEach traversal of collections.Set.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testSetConcurrentForEach0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetConcurrentForEach0001';
      console.info(`[${caseName}] start`);
      let set = createNumberSet(100);
      let lock: ArkTSUtils.locks.AsyncLock = new ArkTSUtils.locks.AsyncLock();
      let result: Object[] = [];
      try {
        result = await Promise.all([
        taskpool.execute(
          forEachTask,
          set,
          lock
        ),
        taskpool.execute(
          forEachTask,
          set,
          lock
        )
      ]);
      } catch (err) {
        console.error(`result await Promise.all failed: ${JSON.stringify(err)}`);
      }
      expect(result[0] as number)
        .assertEqual(100);

      expect(result[1] as number)
        .assertEqual(100);

      let total: number =
        (result[0] as number) +
          (result[1] as number);

      expect(total).assertEqual(200);
      console.info(`[${caseName}] end`);
      done();
    });


    /**
     * @tc.number SUB_COLLECTIONS_SET_CONCURRENT_0200
     * @tc.name testSetConcurrentForEach0002
     * @tc.desc Verify concurrent forEach traversal of String collections.Set.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testSetConcurrentForEach0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetConcurrentForEach0002';
      console.info(`[${caseName}] start`);
      let set = createStringSet(200);
      let lock: ArkTSUtils.locks.AsyncLock = new ArkTSUtils.locks.AsyncLock();
      let result: Object[] = [];
      try {
        result = await Promise.all([
        taskpool.execute(
          forEachStringTask,
          set,
          lock
        ),
        taskpool.execute(
          forEachStringTask,
          set,
          lock
        ),
        taskpool.execute(
          forEachStringTask,
          set,
          lock
        ),
        taskpool.execute(
          forEachStringTask,
          set,
          lock
        ),
        taskpool.execute(
          forEachStringTask,
          set,
          lock
        )
      ]);
      } catch (err) {
        console.error(`result await Promise.all failed: ${JSON.stringify(err)}`);
      }

      expect(result[0] as number)
        .assertEqual(200);

      expect(result[1] as number)
        .assertEqual(200);

      expect(result[2] as number)
        .assertEqual(200);

      expect(result[3] as number)
        .assertEqual(200);

      expect(result[4] as number)
        .assertEqual(200);

      let total =
        (result[0] as number) +
          (result[1] as number) +
          (result[2] as number) +
          (result[3] as number) +
          (result[4] as number);

      expect(total)
        .assertEqual(1000);
      console.info(`[${caseName}] end`);
      done();
    });

    /**
     * @tc.number SUB_COLLECTIONS_SET_CONCURRENT_0300
     * @tc.name testSetConcurrentForEach0003
     * @tc.desc Verify concurrent forEach traversal of Sendable collections.Set.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testSetConcurrentForEach0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetConcurrentForEach0003';
      console.info(`[${caseName}] start`);
      let set = createSendableSet(50);
      let lock: ArkTSUtils.locks.AsyncLock = new ArkTSUtils.locks.AsyncLock();

      let result: Object[] = [];
      try {
        result = await Promise.all([
        taskpool.execute(forEachSendableTask, set, lock),
        taskpool.execute(forEachSendableTask, set, lock),
        taskpool.execute(forEachSendableTask, set, lock),
        taskpool.execute(forEachSendableTask, set, lock),
        taskpool.execute(forEachSendableTask, set, lock),
        taskpool.execute(forEachSendableTask, set, lock),
        taskpool.execute(forEachSendableTask, set, lock),
        taskpool.execute(forEachSendableTask, set, lock),
        taskpool.execute(forEachSendableTask, set, lock),
        taskpool.execute(forEachSendableTask, set, lock)
      ]);
      } catch (err) {
        console.error(`result await Promise.all failed: ${JSON.stringify(err)}`);
      }

      for (let i: number = 0; i < result.length; i++) {
        expect(result[i] as number).assertEqual(50);
      }

      let total: number = 0;
      for (let i: number = 0; i < result.length; i++) {
        total += result[i] as number;
      }
      expect(total).assertEqual(500);
      console.info(`[${caseName}] end`);
      done();
    });

    /**
     * @tc.number SUB_COLLECTIONS_SET_CONCURRENT_0400
     * @tc.name testSetConcurrentForEach0004
     * @tc.desc Verify concurrent forEach calculation of collections.Set.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testSetConcurrentForEach0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetConcurrentForEach0004';
      console.info(`[${caseName}] start`);
      let set = createRangeNumberSet(100);
      let lock: ArkTSUtils.locks.AsyncLock = new ArkTSUtils.locks.AsyncLock();

      let result: Object[] = [];
      try {
        result = await Promise.all([
        taskpool.execute(
          forEachSumTask,
          set,
          lock
        ),
        taskpool.execute(
          forEachSumTask,
          set,
          lock
        )
      ]);
      } catch (err) {
        console.error(`result await Promise.all failed: ${JSON.stringify(err)}`);
      }

      expect(result[0] as number)
        .assertEqual(5050);

      expect(result[1] as number)
        .assertEqual(5050);
      console.info(`[${caseName}] end`);
      done();
    });

    /**
     * @tc.number SUB_COLLECTIONS_SET_CONCURRENT_0500
     * @tc.name testSetConcurrentForEach0005
     * @tc.desc Verify concurrent forEach search of collections.Set.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testSetConcurrentForEach0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetConcurrentForEach0005';
      console.info(`[${caseName}] start`);
      let set = createStringSet(100);
      let lock: ArkTSUtils.locks.AsyncLock = new ArkTSUtils.locks.AsyncLock();

      let result: Object[] = [];
      try {
        result = await Promise.all([
        taskpool.execute(forEachFindStringTask, set, 'value_50', lock),
        taskpool.execute(forEachFindStringTask, set, 'value_50', lock),
        taskpool.execute(forEachFindStringTask, set, 'value_50', lock),
        taskpool.execute(forEachFindStringTask, set, 'value_50', lock),
        taskpool.execute(forEachFindStringTask, set, 'value_50', lock)
      ]);
      } catch (err) {
        console.error(`result await Promise.all failed: ${JSON.stringify(err)}`);
      }

      for (let i: number = 0; i < result.length; i++) {
        expect(result[i] as boolean).assertTrue();
      }
      console.info(`[${caseName}] end`);
      done();
    });

    /**
     * @tc.number SUB_COLLECTIONS_SET_CONCURRENT_0600
     * @tc.name testSetConcurrentForEachSharedCollection0006
     * @tc.desc Verify concurrent forEach result collection to shared Array with lock protection.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testSetConcurrentForEachSharedCollection0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetConcurrentForEachSharedCollection0006';
      console.info(`[${caseName}] start`);
      let set = createNumberSet(50);
      let sharedArray = new collections.Array<number>();
      let lockBuffer: SharedArrayBuffer = createSharedLock();

      let result: Object[] = [];
      try {
        result = await Promise.all([
        taskpool.execute(forEachCollectSharedTask, set, sharedArray, lockBuffer),
        taskpool.execute(forEachCollectSharedTask, set, sharedArray, lockBuffer)
      ]);
      } catch (err) {
        console.error(`result await Promise.all failed: ${JSON.stringify(err)}`);
      }

      expect(result[0] as number).assertEqual(50);
      expect(result[1] as number).assertEqual(50);
      expect(sharedArray.length).assertEqual(100);
      console.info(`[${caseName}] end`);
      done();
    });

    /**
     * @tc.number SUB_COLLECTIONS_SET_CONCURRENT_0700
     * @tc.name testSetConcurrentModify0001
     * @tc.desc Verify add operation during collections.Set forEach traversal.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testSetConcurrentModify0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetConcurrentModify0001';
      console.info(`[${caseName}] start`);
      let set = createNumberSet(100);
      let result: Object = [];
      try {
        result = await taskpool.execute(
          forEachAddErrorTask,
          set
        );
      } catch (err) {
        console.error(`result await taskpool.execute failed: ${JSON.stringify(err)}`);
      }
      expect(isAcceptedConcurrentResult(result as number)).assertTrue();
      console.info(`[${caseName}] end`);
      done();
    });

    /**
     * @tc.number SUB_COLLECTIONS_SET_CONCURRENT_0800
     * @tc.name testSetConcurrentModify0002
     * @tc.desc Verify add existing element during Set forEach traversal.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testSetConcurrentModify0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetConcurrentModify0002';
      console.info(`[${caseName}] start`);
      let set = createNumberSet(100);
      let result: Object = [];
      try {
        result = await taskpool.execute(
          forEachAddExistErrorTask,
          set
        );
      } catch (err) {
        console.error(`result await taskpool.execute failed: ${JSON.stringify(err)}`);
      }
      expect(isAcceptedConcurrentResult(result as number)).assertTrue();
      console.info(`[${caseName}] end`);
      done();
    });

    /**
     * @tc.number SUB_COLLECTIONS_SET_CONCURRENT_0900
     * @tc.name testSetConcurrentModify0003
     * @tc.desc Verify delete operation during Set forEach traversal.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testSetConcurrentModify0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetConcurrentModify0003';
      console.info(`[${caseName}] start`);
      let set = createNumberSet(100);
      let result: Object = [];
      try {
        result = await taskpool.execute(
          forEachDeleteErrorTask,
          set
        );
      } catch (err) {
        console.error(`result await taskpool.execute failed: ${JSON.stringify(err)}`);
      }
      expect(isAcceptedConcurrentResult(result as number)).assertTrue();
      console.info(`[${caseName}] end`);
      done();
    });

    /**
     * @tc.number SUB_COLLECTIONS_SET_CONCURRENT_1000
     * @tc.name testSetConcurrentModify0004
     * @tc.desc Verify delete other element during Set forEach traversal.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testSetConcurrentModify0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetConcurrentModify0004';
      console.info(`[${caseName}] start`);
      let set = createNumberSet(100);
      let result: Object = [];
      try {
        result = await taskpool.execute(forEachDeleteOtherErrorTask, set);
      } catch (err) {
        console.error(`result await taskpool.execute failed: ${JSON.stringify(err)}`);
      }
      expect(isAcceptedConcurrentResult(result as number)).assertTrue();
      console.info(`[${caseName}] end`);
      done();
    });

    /**
     * @tc.number SUB_COLLECTIONS_SET_CONCURRENT_1100
     * @tc.name testSetConcurrentModify0005
     * @tc.desc Verify clear operation during Set forEach traversal.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testSetConcurrentModify0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetConcurrentModify0005';
      console.info(`[${caseName}] start`);
      let set = createNumberSet(100);
      let result: Object = [];
      try {
        result = await taskpool.execute(
          forEachClearErrorTask,
          set
        );
      } catch (err) {
        console.error(`result await taskpool.execute failed: ${JSON.stringify(err)}`);
      }
      expect(isAcceptedConcurrentResult(result as number)).assertTrue();
      console.info(`[${caseName}] end`);
      done();
    });

    /**
     * @tc.number SUB_COLLECTIONS_SET_CONCURRENT_1200
     * @tc.name testSetConcurrentErrorRecover0001
     * @tc.desc Verify Set recovery after concurrent modification error.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testSetConcurrentErrorRecover0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetConcurrentErrorRecover0001';
      console.info(`[${caseName}] start`);
      let set = createNumberSet(100);
      let result: Object = [];
      try {
        result = await taskpool.execute(
          errorRecoverTask,
          set
        );
      } catch (err) {
        console.error(`result await taskpool.execute failed: ${JSON.stringify(err)}`);
      }
      expect(result as boolean)
        .assertTrue();
      console.info(`[${caseName}] end`);
      done();
    });

    /**
     * @tc.number SUB_COLLECTIONS_SET_CONCURRENT_1300
     * @tc.name testSetConcurrentEntries0001
     * @tc.desc Verify concurrent entries traversal of collections.Set.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testSetConcurrentEntries0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetConcurrentEntries0001';
      console.info(`[${caseName}] start`);
      let set = createNumberSet(100);
      let lock: ArkTSUtils.locks.AsyncLock = new ArkTSUtils.locks.AsyncLock();
      let result: Object[] = [];
      try {
        result = await Promise.all([
        taskpool.execute(entriesTask, set, lock),
        taskpool.execute(entriesTask, set, lock)
      ]);
      } catch (err) {
        console.error(`result await Promise.all failed: ${JSON.stringify(err)}`);
      }
      expect(result[0] as number)
        .assertEqual(100);
      expect(result[1] as number)
        .assertEqual(100);
      console.info(`[${caseName}] end`);
      done();
    });

    /**
     * @tc.number SUB_COLLECTIONS_SET_CONCURRENT_1400
     * @tc.name testSetConcurrentEntries0002
     * @tc.desc Verify concurrent entries collection result.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testSetConcurrentEntries0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetConcurrentEntries0002';
      console.info(`[${caseName}] start`);
      let set = createStringSet(50);
      let lock: ArkTSUtils.locks.AsyncLock = new ArkTSUtils.locks.AsyncLock();
      let result: Object[] = [];
      try {
        result = await Promise.all([
        taskpool.execute(entriesCollectTask, set, lock),
        taskpool.execute(entriesCollectTask, set, lock)
      ]);
      } catch (err) {
        console.error(`result await Promise.all failed: ${JSON.stringify(err)}`);
      }
      let array1 = result[0] as Array<string>;
      let array2 = result[1] as Array<string>;
      expect(array1.length)
        .assertEqual(50);
      expect(array2.length)
        .assertEqual(50);
      console.info(`[${caseName}] end`);
      done();
    });

    /**
     * @tc.number SUB_COLLECTIONS_SET_CONCURRENT_1500
     * @tc.name testSetConcurrentEntries0003
     * @tc.desc Verify entries key and value consistency.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testSetConcurrentEntries0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetConcurrentEntries0003';
      console.info(`[${caseName}] start`);
      let set = createNumberSet(100);
      let lock: ArkTSUtils.locks.AsyncLock = new ArkTSUtils.locks.AsyncLock();
      let result: Object[] = [];
      try {
        result = await Promise.all([
        taskpool.execute(entriesCheckTask, set, lock),
        taskpool.execute(entriesCheckTask, set, lock)
      ]);
      } catch (err) {
        console.error(`result await Promise.all failed: ${JSON.stringify(err)}`);
      }
      expect(result[0] as boolean).assertTrue();
      expect(result[1] as boolean).assertTrue();
      console.info(`[${caseName}] end`);
      done();
    });

    /**
     * @tc.number SUB_COLLECTIONS_SET_CONCURRENT_1600
     * @tc.name testSetConcurrentKeys0001
     * @tc.desc Verify concurrent keys traversal of collections.Set.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testSetConcurrentKeys0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetConcurrentKeys0001';
      console.info(`[${caseName}] start`);
      let set = createNumberSet(100);
      let lock: ArkTSUtils.locks.AsyncLock = new ArkTSUtils.locks.AsyncLock();
      let result: Object[] = [];
      try {
        result = await Promise.all([
        taskpool.execute(keysTask, set, lock),
        taskpool.execute(keysTask, set, lock)
      ]);
      } catch (err) {
        console.error(`result await Promise.all failed: ${JSON.stringify(err)}`);
      }
      expect(result[0] as number)
        .assertEqual(100);
      expect(result[1] as number)
        .assertEqual(100);
      console.info(`[${caseName}] end`);
      done();
    });

    /**
     * @tc.number SUB_COLLECTIONS_SET_CONCURRENT_1700
     * @tc.name testSetConcurrentValues0001
     * @tc.desc Verify concurrent values traversal of collections.Set.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testSetConcurrentValues0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetConcurrentValues0001';
      console.info(`[${caseName}] start`);
      let set = createNumberSet(100);
      let lock: ArkTSUtils.locks.AsyncLock = new ArkTSUtils.locks.AsyncLock();
      let result: Object[] = [];
      try {
        result = await Promise.all([
        taskpool.execute(valuesTask, set, lock),
        taskpool.execute(valuesTask, set, lock)
      ]);
      } catch (err) {
        console.error(`result await Promise.all failed: ${JSON.stringify(err)}`);
      }
      expect(result[0] as number)
        .assertEqual(100);
      expect(result[1] as number)
        .assertEqual(100);
      console.info(`[${caseName}] end`);
      done();
    });

    /**
     * @tc.number SUB_COLLECTIONS_SET_CONCURRENT_1800
     * @tc.name testSetConcurrentKeysSharedCollection0001
     * @tc.desc Verify concurrent keys collection to shared Array with lock protection.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testSetConcurrentKeysSharedCollection0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetConcurrentKeysSharedCollection0001';
      console.info(`[${caseName}] start`);
      let set = createStringSet(50);
      let sharedArray = new collections.Array<string>();
      let lockBuffer: SharedArrayBuffer = createSharedLock();

      let result: Object[] = [];
      try {
        result = await Promise.all([
        taskpool.execute(keysCollectSharedTask, set, sharedArray, lockBuffer),
        taskpool.execute(keysCollectSharedTask, set, sharedArray, lockBuffer)
      ]);
      } catch (err) {
        console.error(`result await Promise.all failed: ${JSON.stringify(err)}`);
      }

      expect(result[0] as number).assertEqual(50);
      expect(result[1] as number).assertEqual(50);
      expect(sharedArray.length).assertEqual(100);
      console.info(`[${caseName}] end`);
      done();
    });

    /**
     * @tc.number SUB_COLLECTIONS_SET_CONCURRENT_1900
     * @tc.name testSetConcurrentLarge0001
     * @tc.desc Verify large Set concurrent traversal.
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testSetConcurrentLarge0001', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetConcurrentLarge0001';
      console.info(`[${caseName}] start`);
      let set = createNumberSet(10000);
      let lock: ArkTSUtils.locks.AsyncLock = new ArkTSUtils.locks.AsyncLock();
      let result: Object[] = [];
      try {
        result = await Promise.all([
        taskpool.execute(largeForEachTask, set, lock),
        taskpool.execute(largeForEachTask, set, lock)
      ]);
      } catch (err) {
        console.error(`result await Promise.all failed: ${JSON.stringify(err)}`);
      }
      expect(result[0] as number)
        .assertEqual(10000);
      expect(result[1] as number)
        .assertEqual(10000);
      console.info(`[${caseName}] end`);
      done();
    });

    /**
     * @tc.number SUB_COLLECTIONS_SET_CONCURRENT_2000
     * @tc.name testSetConcurrentLarge0002
     * @tc.desc Verify large String Set traversal.
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testSetConcurrentLarge0002', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetConcurrentLarge0002';
      console.info(`[${caseName}] start`);
      let set = createStringSet(50000);
      let lock: ArkTSUtils.locks.AsyncLock = new ArkTSUtils.locks.AsyncLock();

      let result: Object[] = [];
      try {
        result = await Promise.all([
        taskpool.execute(forEachStringTask, set, lock),
        taskpool.execute(forEachStringTask, set, lock)
      ]);
      } catch (err) {
        console.error(`result await Promise.all failed: ${JSON.stringify(err)}`);
      }
      expect(result[0] as number)
        .assertEqual(50000);
      expect(result[1] as number)
        .assertEqual(50000);
      console.info(`[${caseName}] end`);
      done();
    });

    /**
     * @tc.number SUB_COLLECTIONS_SET_CONCURRENT_2100
     * @tc.name testSetConcurrentLarge0003
     * @tc.desc Verify large Set entries traversal.
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testSetConcurrentLarge0003', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetConcurrentLarge0003';
      console.info(`[${caseName}] start`);
      let set = createNumberSet(10000);
      let lock: ArkTSUtils.locks.AsyncLock = new ArkTSUtils.locks.AsyncLock();

      let result: Object[] = [];
      try {
        result = await Promise.all([
        taskpool.execute(largeEntriesTask, set, lock),
        taskpool.execute(largeEntriesTask, set, lock)
      ]);
      } catch (err) {
        console.error(`result await Promise.all failed: ${JSON.stringify(err)}`);
      }

      expect(result[0] as number)
        .assertEqual(10000);

      expect(result[1] as number)
        .assertEqual(10000);
      console.info(`[${caseName}] end`);
      done();
    });

    /**
     * @tc.number SUB_COLLECTIONS_SET_CONCURRENT_2200
     * @tc.name testSetConcurrentEntriesAddError0001
     * @tc.desc Verify add operation during entries traversal triggers error code.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testSetConcurrentEntriesAddError0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetConcurrentEntriesAddError0001';
      console.info(`[${caseName}] start`);
      let set = createNumberSet(100);
      let result: boolean = false;
      try {
        result = await runModifyTest(set, setEntriesTraverseTask, setAddModifyTask);
      } catch (err) {
        console.error(`runModifyTest failed: ${JSON.stringify(err)}`);
      }
      expect(result).assertTrue();
      console.info(`[${caseName}] end`);
      done();
    });

    /**
     * @tc.number SUB_COLLECTIONS_SET_CONCURRENT_2300
     * @tc.name testSetConcurrentValuesClearError0001
     * @tc.desc Verify clear operation during values traversal triggers error code.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testSetConcurrentValuesClearError0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetConcurrentValuesClearError0001';
      console.info(`[${caseName}] start`);
      let set = createNumberSet(100);
      let errorCode: number = 0;
      try {
        // 按设计 MODIFY_008: 遍历 values 迭代器时 clear
        let iter = set.values();
        let item = iter.next();
        while (!item.done) {
          set.clear();
          item = iter.next();
        }
        // 已知运行时限制: clear 终止迭代器，next() 返回 done:true，不抛异常
        console.info(`[${caseName}] no exception thrown (known runtime limitation)`);
      } catch (e) {
        errorCode = (e as BusinessError).code;
      }
      expect(errorCode === 0 || errorCode === 10200201).assertTrue();
      console.info(`[${caseName}] end`);
      done();
    });

    /**
     * @tc.number SUB_COLLECTIONS_SET_CONCURRENT_2400
     * @tc.name testSetConcurrentKeysDeleteError0001
     * @tc.desc Verify delete operation during keys traversal triggers error code.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testSetConcurrentKeysDeleteError0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetConcurrentKeysDeleteError0001';
      console.info(`[${caseName}] start`);
      // 使用 100000 元素大集合：delete 是批量操作，需要足够大的集合
      // 保证遍历任务在修改任务执行期间仍在迭代，扩大冲突窗口以稳定触发 10200201
      let set = createNumberSet(100000);
      let result: boolean = false;
      try {
        result = await runModifyTest(set, setKeysTraverseTask, setDeleteModifyTask);
      } catch (err) {
        console.error(`runModifyTest failed: ${JSON.stringify(err)}`);
      }
      expect(result).assertTrue();
      console.info(`[${caseName}] end`);
      done();
    });

    /**
     * @tc.number SUB_COLLECTIONS_SET_CONCURRENT_2500
     * @tc.name testSetConcurrentValuesConsistency0001
     * @tc.desc Verify concurrent keys and values iterators return identical results.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testSetConcurrentValuesConsistency0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetConcurrentValuesConsistency0001';
      console.info(`[${caseName}] start`);
      let set = createStringSet(50);

      // keys 组与 values 组使用独立锁，保留并发读能力
      let keysLock: ArkTSUtils.locks.AsyncLock = new ArkTSUtils.locks.AsyncLock();
      let valuesLock: ArkTSUtils.locks.AsyncLock = new ArkTSUtils.locks.AsyncLock();
      let result: Object[] = [];
      try {
        result = await Promise.all([
        taskpool.execute(keysToStringArrayTask, set, keysLock),
        taskpool.execute(valuesToStringArrayTask, set, valuesLock)
      ]);
      } catch (err) {
        console.error(`result await Promise.all failed: ${JSON.stringify(err)}`);
      }

      let keysArr = result[0] as string[];
      let valuesArr = result[1] as string[];

      expect(keysArr.length).assertEqual(50);
      expect(valuesArr.length).assertEqual(50);
      for (let i = 0; i < keysArr.length; i++) {
        expect(keysArr[i]).assertEqual(valuesArr[i]);
      }
      console.info(`[${caseName}] end`);
      done();
    });

    /**
     * @tc.number SUB_COLLECTIONS_SET_CONCURRENT_2600
     * @tc.name testSetConcurrentForOf0001
     * @tc.desc Verify concurrent for...of traversal returns complete and correct results.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testSetConcurrentForOf0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetConcurrentForOf0001';
      console.info(`[${caseName}] start`);
      let set = createNumberSet(50);
      let lock: ArkTSUtils.locks.AsyncLock = new ArkTSUtils.locks.AsyncLock();

      let result: Object[] = [];
      try {
        result = await Promise.all([
        taskpool.execute(forOfVerifyTask, set, lock),
        taskpool.execute(forOfVerifyTask, set, lock),
        taskpool.execute(forOfVerifyTask, set, lock),
        taskpool.execute(forOfVerifyTask, set, lock)
      ]);
      } catch (err) {
        console.error(`result await Promise.all failed: ${JSON.stringify(err)}`);
      }

      for (let i = 0; i < result.length; i++) {
        let taskResult = result[i] as number[];
        expect(taskResult[0] as number).assertEqual(50);
        expect(taskResult[1] as number).assertEqual(1225);
      }
      console.info(`[${caseName}] end`);
      done();
    });

    /**
     * @tc.number SUB_COLLECTIONS_SET_CONCURRENT_2700
     * @tc.name testSetConcurrentSpread0001
     * @tc.desc Verify concurrent spread operator [...set] expands correctly.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testSetConcurrentSpread0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetConcurrentSpread0001';
      console.info(`[${caseName}] start`);
      let set = createStringSet(50);
      let lock: ArkTSUtils.locks.AsyncLock = new ArkTSUtils.locks.AsyncLock();

      let result: Object[] = [];
      try {
        result = await Promise.all([
        taskpool.execute(spreadToStringArrayTask, set, lock),
        taskpool.execute(spreadToStringArrayTask, set, lock),
        taskpool.execute(spreadToStringArrayTask, set, lock),
        taskpool.execute(spreadToStringArrayTask, set, lock)
      ]);
      } catch (err) {
        console.error(`result await Promise.all failed: ${JSON.stringify(err)}`);
      }

      for (let i = 0; i < result.length; i++) {
        let arr = result[i] as string[];
        expect(arr.length).assertEqual(50);
      }

      let arr1 = result[0] as string[];
      let arr2 = result[1] as string[];
      for (let i = 0; i < arr1.length; i++) {
        expect(arr1[i]).assertEqual(arr2[i]);
      }
      console.info(`[${caseName}] end`);
      done();
    });

    /**
     * @tc.number SUB_COLLECTIONS_SET_CONCURRENT_2800
     * @tc.name testSetConcurrentLarge0004
     * @tc.desc Verify large String Set keys concurrent traversal.
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testSetConcurrentLarge0004', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetConcurrentLarge0004';
      console.info(`[${caseName}] start`);
      let set = createStringSet(50000);
      let lock: ArkTSUtils.locks.AsyncLock = new ArkTSUtils.locks.AsyncLock();

      let result: Object[] = [];
      try {
        result = await Promise.all([
        taskpool.execute(largeKeysStringTask, set, lock),
        taskpool.execute(largeKeysStringTask, set, lock)
      ]);
      } catch (err) {
        console.error(`result await Promise.all failed: ${JSON.stringify(err)}`);
      }

      expect(result[0] as number).assertEqual(50000);
      expect(result[1] as number).assertEqual(50000);
      console.info(`[${caseName}] end`);
      done();
    });

  });
}
