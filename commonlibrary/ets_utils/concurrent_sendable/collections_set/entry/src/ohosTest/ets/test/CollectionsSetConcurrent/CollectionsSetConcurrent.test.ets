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
  taskpool,
  collections,

} from '@kit.ArkTS';


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

  keysDeleteErrorTask,
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
  forEachDeleteOtherErrorTask,
  entriesAddErrorTask,
  valuesClearErrorTask,
  entriesClearErrorTask,
  keysCollectSharedTask,
  forEachCollectSharedTask
} from '../utils/TestUtils';


export default function collectionsSetConcurrentTest() {


  describe('CollectionsSetConcurrentTest', () => {


    beforeAll(() => {

    });


    beforeEach(() => {

    });


    afterEach(() => {

    });


    afterAll(() => {

    });

    /**
     * @tc.number SUB_COLLECTIONS_SET_CONCURRENT_0100
     * @tc.name testSetConcurrentForEach0001
     * @tc.desc Verify concurrent forEach traversal of collections.Set.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testSetConcurrentForEach0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const caseName = 'testSetConcurrentForEach0001';
      console.info(`[${caseName}] start`);
      let set = createNumberSet(100);
      let result = await Promise.all([
        taskpool.execute(
          forEachTask,
          set
        ),
        taskpool.execute(
          forEachTask,
          set
        )
      ]);
      expect(result[0] as number)
        .assertEqual(100);

      expect(result[1] as number)
        .assertEqual(100);

      let total: number =
        (result[0] as number) +
          (result[1] as number);

      expect(total).assertEqual(200);
      console.info(`[${caseName}] end`);
    });


    /**
     * @tc.number SUB_COLLECTIONS_SET_CONCURRENT_0200
     * @tc.name testSetConcurrentForEach0002
     * @tc.desc Verify concurrent forEach traversal of String collections.Set.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testSetConcurrentForEach0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const caseName = 'testSetConcurrentForEach0002';
      console.info(`[${caseName}] start`);
      let set = createStringSet(200);
      let result = await Promise.all([
        taskpool.execute(
          forEachStringTask,
          set
        ),
        taskpool.execute(
          forEachStringTask,
          set
        ),
        taskpool.execute(
          forEachStringTask,
          set
        ),
        taskpool.execute(
          forEachStringTask,
          set
        ),
        taskpool.execute(
          forEachStringTask,
          set
        )
      ]);

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
    });

    /**
     * @tc.number SUB_COLLECTIONS_SET_CONCURRENT_0300
     * @tc.name testSetConcurrentForEach0003
     * @tc.desc Verify concurrent forEach traversal of Sendable collections.Set.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testSetConcurrentForEach0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const caseName = 'testSetConcurrentForEach0003';
      console.info(`[${caseName}] start`);
      let set = createSendableSet(50);

      let result = await Promise.all([
        taskpool.execute(forEachSendableTask, set),
        taskpool.execute(forEachSendableTask, set),
        taskpool.execute(forEachSendableTask, set),
        taskpool.execute(forEachSendableTask, set),
        taskpool.execute(forEachSendableTask, set),
        taskpool.execute(forEachSendableTask, set),
        taskpool.execute(forEachSendableTask, set),
        taskpool.execute(forEachSendableTask, set),
        taskpool.execute(forEachSendableTask, set),
        taskpool.execute(forEachSendableTask, set)
      ]);

      for (let i: number = 0; i < result.length; i++) {
        expect(result[i] as number).assertEqual(50);
      }

      let total: number = 0;
      for (let i: number = 0; i < result.length; i++) {
        total += result[i] as number;
      }
      expect(total).assertEqual(500);
      console.info(`[${caseName}] end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_SET_CONCURRENT_0400
     * @tc.name testSetConcurrentForEach0004
     * @tc.desc Verify concurrent forEach calculation of collections.Set.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testSetConcurrentForEach0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const caseName = 'testSetConcurrentForEach0004';
      console.info(`[${caseName}] start`);
      let set = createRangeNumberSet(100);

      let result = await Promise.all([
        taskpool.execute(
          forEachSumTask,
          set
        ),
        taskpool.execute(
          forEachSumTask,
          set
        )
      ]);

      expect(result[0] as number)
        .assertEqual(5050);

      expect(result[1] as number)
        .assertEqual(5050);
      console.info(`[${caseName}] end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_SET_CONCURRENT_0500
     * @tc.name testSetConcurrentForEach0005
     * @tc.desc Verify concurrent forEach search of collections.Set.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testSetConcurrentForEach0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const caseName = 'testSetConcurrentForEach0005';
      console.info(`[${caseName}] start`);
      let set = createStringSet(100);

      let result = await Promise.all([
        taskpool.execute(forEachFindStringTask, set, 'value_50'),
        taskpool.execute(forEachFindStringTask, set, 'value_50'),
        taskpool.execute(forEachFindStringTask, set, 'value_50'),
        taskpool.execute(forEachFindStringTask, set, 'value_50'),
        taskpool.execute(forEachFindStringTask, set, 'value_50')
      ]);

      for (let i: number = 0; i < result.length; i++) {
        expect(result[i] as boolean).assertTrue();
      }
      console.info(`[${caseName}] end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_SET_CONCURRENT_0600
     * @tc.name testSetConcurrentForEachSharedCollection0006
     * @tc.desc Verify concurrent forEach result collection to shared Array with lock protection.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testSetConcurrentForEachSharedCollection0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const caseName = 'testSetConcurrentForEachSharedCollection0006';
      console.info(`[${caseName}] start`);
      let set = createNumberSet(50);
      let sharedArray = new collections.Array<number>();
      let lockBuffer: SharedArrayBuffer = createSharedLock();

      let result = await Promise.all([
        taskpool.execute(forEachCollectSharedTask, set, sharedArray, lockBuffer),
        taskpool.execute(forEachCollectSharedTask, set, sharedArray, lockBuffer)
      ]);

      expect(result[0] as number).assertEqual(50);
      expect(result[1] as number).assertEqual(50);
      expect(sharedArray.length).assertEqual(100);
      console.info(`[${caseName}] end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_SET_CONCURRENT_0700
     * @tc.name testSetConcurrentModify0001
     * @tc.desc Verify add operation during collections.Set forEach traversal.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testSetConcurrentModify0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const caseName = 'testSetConcurrentModify0001';
      console.info(`[${caseName}] start`);
      let set = createNumberSet(100);
      let result =
        await taskpool.execute(
          forEachAddErrorTask,
          set
        );
      expect(result as number)
        .assertEqual(10200201);
      console.info(`[${caseName}] end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_SET_CONCURRENT_0800
     * @tc.name testSetConcurrentModify0002
     * @tc.desc Verify add existing element during Set forEach traversal.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testSetConcurrentModify0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const caseName = 'testSetConcurrentModify0002';
      console.info(`[${caseName}] start`);
      let set = createNumberSet(100);
      let result =
        await taskpool.execute(
          forEachAddExistErrorTask,
          set
        );
      expect(result as number)
        .assertEqual(10200201);
      console.info(`[${caseName}] end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_SET_CONCURRENT_0900
     * @tc.name testSetConcurrentModify0003
     * @tc.desc Verify delete operation during Set forEach traversal.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testSetConcurrentModify0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const caseName = 'testSetConcurrentModify0003';
      console.info(`[${caseName}] start`);
      let set = createNumberSet(100);
      let result =
        await taskpool.execute(
          forEachDeleteErrorTask,
          set
        );
      expect(result as number)
        .assertEqual(10200201);
      console.info(`[${caseName}] end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_SET_CONCURRENT_1000
     * @tc.name testSetConcurrentModify0004
     * @tc.desc Verify delete other element during Set forEach traversal.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testSetConcurrentModify0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const caseName = 'testSetConcurrentModify0004';
      console.info(`[${caseName}] start`);
      let set = createNumberSet(100);
      let result = await taskpool.execute(forEachDeleteOtherErrorTask, set);
      expect(result as number).assertEqual(10200201);
      console.info(`[${caseName}] end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_SET_CONCURRENT_1100
     * @tc.name testSetConcurrentModify0005
     * @tc.desc Verify clear operation during Set forEach traversal.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testSetConcurrentModify0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const caseName = 'testSetConcurrentModify0005';
      console.info(`[${caseName}] start`);
      let set = createNumberSet(100);
      let result =
        await taskpool.execute(
          forEachClearErrorTask,
          set
        );
      expect(result as number)
        .assertEqual(10200201);
      console.info(`[${caseName}] end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_SET_CONCURRENT_1200
     * @tc.name testSetConcurrentErrorRecover0001
     * @tc.desc Verify Set recovery after concurrent modification error.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testSetConcurrentErrorRecover0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const caseName = 'testSetConcurrentErrorRecover0001';
      console.info(`[${caseName}] start`);
      let set = createNumberSet(100);
      let result =
        await taskpool.execute(
          errorRecoverTask,
          set
        );
      expect(result as boolean)
        .assertTrue();
      console.info(`[${caseName}] end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_SET_CONCURRENT_1300
     * @tc.name testSetConcurrentEntries0001
     * @tc.desc Verify concurrent entries traversal of collections.Set.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testSetConcurrentEntries0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const caseName = 'testSetConcurrentEntries0001';
      console.info(`[${caseName}] start`);
      let set = createNumberSet(100);
      let result = await Promise.all([
        taskpool.execute(entriesTask, set),
        taskpool.execute(entriesTask, set)
      ]);
      expect(result[0] as number)
        .assertEqual(100);
      expect(result[1] as number)
        .assertEqual(100);
      console.info(`[${caseName}] end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_SET_CONCURRENT_1400
     * @tc.name testSetConcurrentEntries0002
     * @tc.desc Verify concurrent entries collection result.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testSetConcurrentEntries0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const caseName = 'testSetConcurrentEntries0002';
      console.info(`[${caseName}] start`);
      let set = createStringSet(50);
      let result = await Promise.all([
        taskpool.execute(entriesCollectTask, set),
        taskpool.execute(entriesCollectTask, set)
      ]);
      let array1 = result[0] as Array<string>;
      let array2 = result[1] as Array<string>;
      expect(array1.length)
        .assertEqual(50);
      expect(array2.length)
        .assertEqual(50);
      console.info(`[${caseName}] end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_SET_CONCURRENT_1500
     * @tc.name testSetConcurrentEntries0003
     * @tc.desc Verify entries key and value consistency.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testSetConcurrentEntries0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const caseName = 'testSetConcurrentEntries0003';
      console.info(`[${caseName}] start`);
      let set = createNumberSet(100);
      let result = await Promise.all([
        taskpool.execute(entriesCheckTask, set),
        taskpool.execute(entriesCheckTask, set)
      ]);
      expect(result[0] as boolean).assertTrue();
      expect(result[1] as boolean).assertTrue();
      console.info(`[${caseName}] end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_SET_CONCURRENT_1600
     * @tc.name testSetConcurrentKeys0001
     * @tc.desc Verify concurrent keys traversal of collections.Set.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testSetConcurrentKeys0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const caseName = 'testSetConcurrentKeys0001';
      console.info(`[${caseName}] start`);
      let set = createNumberSet(100);
      let result = await Promise.all([
        taskpool.execute(keysTask, set),
        taskpool.execute(keysTask, set)
      ]);
      expect(result[0] as number)
        .assertEqual(100);
      expect(result[1] as number)
        .assertEqual(100);
      console.info(`[${caseName}] end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_SET_CONCURRENT_1700
     * @tc.name testSetConcurrentValues0001
     * @tc.desc Verify concurrent values traversal of collections.Set.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testSetConcurrentValues0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const caseName = 'testSetConcurrentValues0001';
      console.info(`[${caseName}] start`);
      let set = createNumberSet(100);
      let result = await Promise.all([
        taskpool.execute(valuesTask, set),
        taskpool.execute(valuesTask, set)
      ]);
      expect(result[0] as number)
        .assertEqual(100);
      expect(result[1] as number)
        .assertEqual(100);
      console.info(`[${caseName}] end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_SET_CONCURRENT_1800
     * @tc.name testSetConcurrentKeysSharedCollection0001
     * @tc.desc Verify concurrent keys collection to shared Array with lock protection.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testSetConcurrentKeysSharedCollection0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const caseName = 'testSetConcurrentKeysSharedCollection0001';
      console.info(`[${caseName}] start`);
      let set = createStringSet(50);
      let sharedArray = new collections.Array<string>();
      let lockBuffer: SharedArrayBuffer = createSharedLock();

      let result = await Promise.all([
        taskpool.execute(keysCollectSharedTask, set, sharedArray, lockBuffer),
        taskpool.execute(keysCollectSharedTask, set, sharedArray, lockBuffer)
      ]);

      expect(result[0] as number).assertEqual(50);
      expect(result[1] as number).assertEqual(50);
      expect(sharedArray.length).assertEqual(100);
      console.info(`[${caseName}] end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_SET_CONCURRENT_1900
     * @tc.name testSetConcurrentLarge0001
     * @tc.desc Verify large Set concurrent traversal.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testSetConcurrentLarge0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const caseName = 'testSetConcurrentLarge0001';
      console.info(`[${caseName}] start`);
      let set = createNumberSet(10000);
      let result = await Promise.all([
        taskpool.execute(largeForEachTask, set),
        taskpool.execute(largeForEachTask, set)
      ]);
      expect(result[0] as number)
        .assertEqual(10000);
      expect(result[1] as number)
        .assertEqual(10000);
      console.info(`[${caseName}] end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_SET_CONCURRENT_2000
     * @tc.name testSetConcurrentLarge0002
     * @tc.desc Verify large String Set traversal.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testSetConcurrentLarge0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const caseName = 'testSetConcurrentLarge0002';
      console.info(`[${caseName}] start`);
      let set = createStringSet(50000);

      let result = await Promise.all([
        taskpool.execute(forEachStringTask, set),
        taskpool.execute(forEachStringTask, set)
      ]);
      expect(result[0] as number)
        .assertEqual(50000);
      expect(result[1] as number)
        .assertEqual(50000);
      console.info(`[${caseName}] end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_SET_CONCURRENT_2100
     * @tc.name testSetConcurrentLarge0003
     * @tc.desc Verify large Set entries traversal.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testSetConcurrentLarge0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const caseName = 'testSetConcurrentLarge0003';
      console.info(`[${caseName}] start`);
      let set = createNumberSet(10000);

      let result = await Promise.all([
        taskpool.execute(largeEntriesTask, set),
        taskpool.execute(largeEntriesTask, set)
      ]);

      expect(result[0] as number)
        .assertEqual(10000);

      expect(result[1] as number)
        .assertEqual(10000);
      console.info(`[${caseName}] end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_SET_CONCURRENT_2200
     * @tc.name testSetConcurrentEntriesAddError0001
     * @tc.desc Verify add operation during entries traversal triggers error code.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testSetConcurrentEntriesAddError0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const caseName = 'testSetConcurrentEntriesAddError0001';
      console.info(`[${caseName}] start`);
      let set = createNumberSet(100);
      let result = await taskpool.execute(entriesAddErrorTask, set);
      expect(result as number).assertEqual(10200201);
      console.info(`[${caseName}] end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_SET_CONCURRENT_2300
     * @tc.name testSetConcurrentEntriesClearError0001
     * @tc.desc Verify clear operation during entries traversal triggers error code.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testSetConcurrentEntriesClearError0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const caseName = 'testSetConcurrentEntriesClearError0001';
      console.info(`[${caseName}] start`);
      let set = createNumberSet(100);
      let result = await taskpool.execute(entriesClearErrorTask, set);
      expect(result as number).assertEqual(10200201);
      console.info(`[${caseName}] end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_SET_CONCURRENT_2400
     * @tc.name testSetConcurrentValuesClearError0001
     * @tc.desc Verify clear operation during values traversal triggers error code.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testSetConcurrentValuesClearError0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const caseName = 'testSetConcurrentValuesClearError0001';
      console.info(`[${caseName}] start`);
      let set = createNumberSet(100);
      let result = await taskpool.execute(valuesClearErrorTask, set);
      expect(result as number).assertEqual(10200201);
      console.info(`[${caseName}] end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_SET_CONCURRENT_2500
     * @tc.name testSetConcurrentKeysDeleteError0001
     * @tc.desc Verify delete operation during keys traversal triggers error code.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testSetConcurrentKeysDeleteError0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const caseName = 'testSetConcurrentKeysDeleteError0001';
      console.info(`[${caseName}] start`);
      let set = createNumberSet(100);
      let result = await taskpool.execute(keysDeleteErrorTask, set);
      expect(result as number).assertEqual(10200201);
      console.info(`[${caseName}] end`);
    });

  });
}