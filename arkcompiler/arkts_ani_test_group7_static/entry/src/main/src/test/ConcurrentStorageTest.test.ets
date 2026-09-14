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
  ConcurrentMapManager,
  ConcurrentSetManager,
  ConcurrentQueueManager,
  MutexManager,
  RWLockManager,
  WorkerLocalManager,
  EAWorkerMessageManager,
  MultiThreadManager,
  AsyncPromiseManager,
  MultiInteractionManager,
  RecursiveInteractionManager,
  AsyncCallbackChainManager,
  WorkerAsyncRoundtripManager,
  TaskPoolAsyncExecuteManager
} from '../ets/Index.ets';

const CONCURRENT_MAP_SIZE: int = 50;
const CONCURRENT_MAP_VALUE: int = 50;
const CONCURRENT_SET_SIZE: int = 10;
const CONCURRENT_QUEUE_SIZE: int = 100;
const ASYNC_PROMISE_FINAL: int = 150;
const ASYNC_CHAIN_FINAL_VALUE: int = 30;
const TASKPOOL_EXPECTED_RESULT: int = 100;

export default function concurrentStorageTest(): void {
  describe("ConcurrentStorageTest", (): void => {

    /**
     * @tc.number    SUB_ANI_CONCURRENT_HASHMAP_0100
     * @tc.name      test_concurrentHashMapStorage_0001
     * @tc.desc      Scenario 8.1: Native object stored in ConcurrentHashMap
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_concurrentHashMapStorage_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (done: () => void): void => {
        let manager = new ConcurrentMapManager();
        expect(manager.testNativeObjectInConcurrentHashMapNative()).assertTrue();
        expect(manager.concurrentMap.size()).assertEqual(CONCURRENT_MAP_SIZE);
        let resource = manager.concurrentMap.get(5);
        expect(resource != null).assertTrue();
        expect(resource!.value).assertEqual(CONCURRENT_MAP_VALUE);
        done();
      });

    /**
     * @tc.number    SUB_ANI_CONCURRENT_SET_0200
     * @tc.name      test_concurrentSetStorage_0002
     * @tc.desc      Scenario 8.2: Native object stored in ConcurrentSet
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_concurrentSetStorage_0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (done: () => void): void => {
        let manager = new ConcurrentSetManager();
        expect(manager.testNativeObjectInConcurrentSetNative()).assertTrue();
        expect(manager.concurrentSet.size()).assertEqual(CONCURRENT_SET_SIZE);
        done();
      });

    /**
     * @tc.number    SUB_ANI_CONCURRENT_QUEUE_0300
     * @tc.name      test_concurrentQueueStorage_0003
     * @tc.desc      Scenario 8.3: Native object stored in ConcurrentQueue
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_concurrentQueueStorage_0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (done: () => void): void => {
        let manager = new ConcurrentQueueManager();
        expect(manager.testNativeObjectInConcurrentQueueNative()).assertTrue();
        expect(manager.concurrentQueue.size()).assertEqual(CONCURRENT_QUEUE_SIZE);
        let polled = manager.concurrentQueue.poll();
        expect(polled != null).assertTrue();
        expect(polled!.value).assertEqual(0);
        done();
      });

    /**
     * @tc.number    SUB_ANI_CONCURRENT_MUTEX_0400
     * @tc.name      test_mutexProtectedNativeObject_0004
     * @tc.desc      Scenario 8.4: Native object protected by Mutex
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_mutexProtectedNativeObject_0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (done: () => void): void => {
        let manager = new MutexManager();
        expect(manager.testNativeObjectWithMutexNative()).assertTrue();
        done();
      });

    /**
     * @tc.number    SUB_ANI_CONCURRENT_RWLOCK_0500
     * @tc.name      test_rwLockProtectedNativeObject_0005
     * @tc.desc      Scenario 8.5: Native object protected by RWLock
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_rwLockProtectedNativeObject_0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (done: () => void): void => {
        let manager = new RWLockManager();
        expect(manager.testNativeObjectWithRWLockNative()).assertTrue();
        done();
      });

    /**
     * @tc.number    SUB_ANI_CONCURRENT_WORKERLOCAL_0600
     * @tc.name      test_workerLocalStorage_0006
     * @tc.desc      Scenario 8.6: Native object stored in WorkerLocal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_workerLocalStorage_0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (done: () => void): void => {
        let manager = new WorkerLocalManager();
        expect(manager.testNativeObjectInWorkerLocalNative()).assertTrue();
        done();
      });

    /**
     * @tc.number    SUB_ANI_CONCURRENT_EAWORKER_MESSAGE_0700
     * @tc.name      test_eaWorkerMessagePassing_0007
     * @tc.desc      Scenario 8.7: Native object passed across EAWorker messages
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_eaWorkerMessagePassing_0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (done: () => void): void => {
        let manager = new EAWorkerMessageManager();
        manager.eaMessageResource = new NativeResource();
        manager.eaMessageResource!.value = 300;
        expect(manager.testNativeObjectCrossEAWorkerMessageNative()).assertTrue();
        expect(manager.eaMessageResource!.value).assertEqual(350);
        done();
      });

    /**
     * @tc.number    SUB_ANI_CONCURRENT_MULTI_THREAD_0800
     * @tc.name      test_multiThreadConcurrentAccess_0008
     * @tc.desc      Scenario 8.8: Multi-thread concurrent access to Native object
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_multiThreadConcurrentAccess_0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (done: () => void): void => {
        let manager = new MultiThreadManager();
        expect(manager.testMultiThreadConcurrentAccessNative()).assertTrue();
        done();
      });

    /**
     * @tc.number    SUB_ANI_ASYNC_PROMISE_0100
     * @tc.name      test_asyncPromiseWithNativeObject_0009
     * @tc.desc      Scenario 8.9: Native object combined with async/Promise
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_asyncPromiseWithNativeObject_0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let manager = new AsyncPromiseManager();
        try {
          await manager.testNativeObjectAsyncPromiseCreateNative();
          await manager.testNativeObjectAsyncPromiseResolveNative();
          expect(manager.asyncPromise!.value).assertEqual(ASYNC_PROMISE_FINAL);
          done();
        } catch (e) {
          expect(false).assertTrue();
          done();
        }
      });

    /**
     * @tc.number    SUB_ANI_NATIVE_ETS_INTERACTION_0200
     * @tc.name      test_nativeETSMultiInteraction_0010
     * @tc.desc      Scenario 8.10: Native and ETS multiple round-trip interaction
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_nativeETSMultiInteraction_0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (done: () => void): void => {
        let manager = new MultiInteractionManager();
        expect(manager.testNativeETSMultiInteractionNative()).assertTrue();
        done();
      });

    /**
     * @tc.number    SUB_ANI_NATIVE_ETS_RECURSIVE_0300
     * @tc.name      test_nativeETSRecursiveInteraction_0011
     * @tc.desc      Scenario 8.11: Native and ETS recursive interaction
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_nativeETSRecursiveInteraction_0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (done: () => void): void => {
        let manager = new RecursiveInteractionManager();
        expect(manager.testNativeETSRecursiveInteractionNative()).assertTrue();
        done();
      });

    /**
     * @tc.number    SUB_ANI_ASYNC_CALLBACK_CHAIN_0400
     * @tc.name      test_nativeObjectAsyncCallbackChain_0012
     * @tc.desc      Scenario 8.12: Native object async callback chain
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_nativeObjectAsyncCallbackChain_0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let manager = new AsyncCallbackChainManager();
        expect(manager.testNativeObjectAsyncCallbackChainNative()).assertTrue();
        let resource = manager.chainResource;
        expect(resource != null).assertTrue();
        try {
          resource = await manager.etsAsyncStep1(resource!);
          resource = await manager.etsAsyncStep2(resource);
          resource = await manager.etsAsyncStep3(resource);
          expect(resource.value).assertEqual(ASYNC_CHAIN_FINAL_VALUE);
          done();
        } catch (e) {
          expect(false).assertTrue();
          done();
        }
      });

    /**
     * @tc.number    SUB_ANI_WORKER_ASYNC_ROUNDTRIP_0500
     * @tc.name      test_nativeObjectWorkerAsyncRoundtrip_0013
     * @tc.desc      Scenario 8.13: Native object Worker async round-trip
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_nativeObjectWorkerAsyncRoundtrip_0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let manager = new WorkerAsyncRoundtripManager();
        expect(manager.testNativeObjectWorkerAsyncRoundtripNative()).assertTrue();
        let resource = manager.workerResource;
        expect(resource != null).assertTrue();
        let originValue = resource!.value;
        manager.etsSendToWorker(resource!);
        try {
          let back = await manager.etsGetFromWorker();
          expect(back != null).assertTrue();
          expect(back!.value).assertEqual(originValue + 1);
          done();
        } catch (e) {
          expect(false).assertTrue();
          done();
        }
      });

    /**
     * @tc.number    SUB_ANI_TASKPOOL_ASYNC_EXECUTE_0600
     * @tc.name      test_nativeObjectTaskPoolAsyncExecute_0014
     * @tc.desc      Scenario 8.14: Native object TaskPool async execution
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_nativeObjectTaskPoolAsyncExecute_0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let manager = new TaskPoolAsyncExecuteManager();
        expect(manager.testNativeObjectTaskPoolAsyncExecuteNative()).assertTrue();
        let resource = manager.taskResource;
        expect(resource != null).assertTrue();
        let task = manager.etsCreateTaskPoolTask(resource!);
        try {
          let result = await manager.etsExecuteTaskPoolTask(task);
          expect(result != null).assertTrue();
          expect(result.value).assertEqual(TASKPOOL_EXPECTED_RESULT);
          done();
        } catch (e) {
          expect(false).assertTrue();
          done();
        }
      });
  })
}
