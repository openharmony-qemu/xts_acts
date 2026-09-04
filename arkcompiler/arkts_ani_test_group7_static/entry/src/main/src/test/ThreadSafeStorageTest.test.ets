'use static';
/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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

import { describe, it, expect, TestType, Size, Level } from "../../../hypium/index.ets";
import {
  NativeResource,
  ThreadSafeResourceManager,
  ConcurrentResourceManager,
  TaskPoolResourceManager,
  LocalRefManager,
  GlobalRefLifecycleManager,
  LocalScopeManager
} from '../ets/Index.ets';

const THREAD_SAFE_EXPECT_VALUE: int = 42;
const LOCAL_REF_COUNT: int = 1000;
const SCOPE_WAIT_MS: int = 3000;
const SCOPE_MIN_PROCESSED: int = 1000;

export default function threadSafeStorageTest(): void {
  describe("ThreadSafeStorageTest", (): void => {

    /**
     * @tc.number    SUB_ANI_NATIVE_OBJ_THREAD_SAFE_GLOBALREF_0100
     * @tc.name      test_crossThreadNativeObject_0001
     * @tc.desc      Scenario 5.1: Cross-thread Native object passing via global reference
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_crossThreadNativeObject_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (done: () => void): void => {
        let manager = new ThreadSafeResourceManager();
        let resource = manager.createNativeResourceInMainThread();
        expect(resource != null).assertTrue();
        let workerResult = manager.useNativeResourceInWorkerThread(resource);
        expect(workerResult).assertEqual(THREAD_SAFE_EXPECT_VALUE);
        manager.cleanupGlobalReference();
        done();
      });

    /**
     * @tc.number    SUB_ANI_NATIVE_OBJ_THREAD_SAFE_EAWORKER_0200
     * @tc.name      test_eaWorkerConcurrentAccess_0002
     * @tc.desc      Scenario 5.2: EAWorker concurrent access to Native object
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_eaWorkerConcurrentAccess_0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (done: () => void): void => {
        let manager = new ConcurrentResourceManager();
        manager.initSharedNativeResource();
        let result = manager.incrementResourceValueInWorker();
        expect(result > 0).assertTrue();
        let finalValue = manager.getResourceValue();
        expect(finalValue > 0).assertTrue();
        done();
      });

    /**
     * @tc.number    SUB_ANI_NATIVE_OBJ_THREAD_SAFE_TASKPOOL_0300
     * @tc.name      test_taskPoolConcurrentAccess_0003
     * @tc.desc      Scenario 5.3: TaskPool concurrent access to Native object
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_taskPoolConcurrentAccess_0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let manager = new TaskPoolResourceManager();
        manager.initTaskPoolResource();
        const TASK_COUNT: int = 10;
        let tasks: Array<Promise<number>> = [];
        for (let i: int = 0; i < TASK_COUNT; i++) {
          let promise: Promise<number> = new Promise<number>((resolve) => {
            let r: int = manager.processResourceInTaskPool();
            resolve(r);
          });
          tasks.push(promise);
        }
        try {
          let allResults: Array<number> = await Promise.all(tasks);
          expect(allResults.every((r: number): boolean => r > 0)).assertTrue();
          done();
        } catch (e) {
          expect(false).assertTrue();
          done();
        }
      });

    /**
     * @tc.number    SUB_ANI_NATIVE_OBJ_LIFECYCLE_LOCALREF_0100
     * @tc.name      test_localRefAutoRelease_0004
     * @tc.desc      Scenario 6.1: Local reference auto-release verification
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_localRefAutoRelease_0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (done: () => void): void => {
        let manager = new LocalRefManager();
        manager.createManyLocalRefs(LOCAL_REF_COUNT);
        let noLeak = manager.verifyNoRefLeak();
        expect(noLeak).assertTrue();
        done();
      });

    /**
     * @tc.number    SUB_ANI_NATIVE_OBJ_LIFECYCLE_GLOBALREF_0200
     * @tc.name      test_globalRefManualRelease_0005
     * @tc.desc      Scenario 6.2: Global reference manual release verification
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_globalRefManualRelease_0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (done: () => void): void => {
        let manager = new GlobalRefLifecycleManager();
        let resource = manager.createAndCacheGlobalRef();
        expect(resource != null).assertTrue();
        let value = manager.useCachedGlobalRef();
        expect(value).assertEqual(THREAD_SAFE_EXPECT_VALUE);
        manager.deleteCachedGlobalRef();
        let deleted = manager.verifyGlobalRefDeleted();
        expect(deleted).assertTrue();
        done();
      });

    /**
     * @tc.number    SUB_ANI_NATIVE_OBJ_LIFECYCLE_LOCALSCOPE_0300
     * @tc.name      test_localScopeBatchRelease_0006
     * @tc.desc      Scenario 6.3: LocalScope batch release verification
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_localScopeBatchRelease_0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (done: () => void): void => {
        let manager = new LocalScopeManager();
        manager.startBackgroundThread();
        setTimeout(() => {
          manager.stopBackgroundThread();
          let count = manager.getProcessedCount();
          expect(count > SCOPE_MIN_PROCESSED).assertTrue();
          done();
        }, SCOPE_WAIT_MS);
      });
  })
}
