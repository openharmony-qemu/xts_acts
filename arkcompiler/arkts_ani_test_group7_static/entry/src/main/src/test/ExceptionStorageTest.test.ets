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
import { ExceptionTestManager, NativeResource } from '../ets/Index.ets';

export default function exceptionStorageTest(): void {
  describe("ExceptionStorageTest", (): void => {

    /**
     * @tc.number    SUB_ANI_EXCEPTION_EMPTY_MAP_GET_0100
     * @tc.name      test_emptyMapGetException_0001
     * @tc.desc      Scenario 10.1: Empty Map.get returns null
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_emptyMapGetException_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (done: () => void): void => {
        let manager = new ExceptionTestManager();
        let probe = new NativeResource();
        expect(manager.emptyMap.get(probe) == null).assertTrue();
        expect(manager.testEmptyMapGetExceptionNative()).assertTrue();
        done();
      });

    /**
     * @tc.number    SUB_ANI_EXCEPTION_MAP_NULL_KEY_0200
     * @tc.name      test_mapPutNullKeyException_0002
     * @tc.desc      Scenario 10.2: Map.put with null key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_mapPutNullKeyException_0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (done: () => void): void => {
        let manager = new ExceptionTestManager();
        expect(manager.testMapPutNullKeyNative()).assertTrue();
        done();
      });

    /**
     * @tc.number    SUB_ANI_EXCEPTION_MAP_NULL_VALUE_0300
     * @tc.name      test_mapPutNullValueException_0003
     * @tc.desc      Scenario 10.3: Map.put with null value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_mapPutNullValueException_0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (done: () => void): void => {
        let manager = new ExceptionTestManager();
        expect(manager.testMapPutNullValueNative()).assertTrue();
        done();
      });

    /**
     * @tc.number    SUB_ANI_EXCEPTION_EMPTY_QUEUE_POLL_0400
     * @tc.name      test_emptyQueuePollException_0004
     * @tc.desc      Scenario 10.4: Empty Queue.poll returns null
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_emptyQueuePollException_0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (done: () => void): void => {
        let manager = new ExceptionTestManager();
        expect(manager.emptyQueue.poll() == null).assertTrue();
        expect(manager.testEmptyQueuePollExceptionNative()).assertTrue();
        done();
      });

    /**
     * @tc.number    SUB_ANI_EXCEPTION_SET_CONTAINS_NULL_0500
     * @tc.name      test_setContainsNullException_0005
     * @tc.desc      Scenario 10.5: Set.contains with null returns false
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_setContainsNullException_0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (done: () => void): void => {
        let manager = new ExceptionTestManager();
        expect(manager.testSetContainsNullNative()).assertTrue();
        done();
      });

    /**
     * @tc.number    SUB_ANI_EXCEPTION_ARRAY_INDEX_OUT_OF_BOUNDS_0600
     * @tc.name      test_arrayOutOfBoundsException_0006
     * @tc.desc      Scenario 10.6: Array out-of-bounds access
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_arrayOutOfBoundsException_0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (done: () => void): void => {
        let manager = new ExceptionTestManager();
        let handled: boolean = false;
        try {
          let result = manager.outOfBoundsArray[10];
          handled = (result == undefined);
        } catch (e) {
          handled = true;
        }
        expect(handled).assertTrue();
        expect(manager.testArrayIndexOutOfBoundsNative()).assertTrue();
        done();
      });

    /**
     * @tc.number    SUB_ANI_EXCEPTION_FIXEDARRAY_INDEX_OUT_OF_BOUNDS_0700
     * @tc.name      test_fixedArrayOutOfBoundsException_0007
     * @tc.desc      Scenario 10.7: FixedArray out-of-bounds access
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_fixedArrayOutOfBoundsException_0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (done: () => void): void => {
        let manager = new ExceptionTestManager();
        expect(manager.testFixedArrayIndexOutOfBoundsNative()).assertTrue();
        done();
      });

    /**
     * @tc.number    SUB_ANI_EXCEPTION_MUTEX_DOUBLE_LOCK_0800
     * @tc.name      test_mutexDoubleLockException_0008
     * @tc.desc      Scenario 10.8: Mutex double lock
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_mutexDoubleLockException_0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (done: () => void): void => {
        let manager = new ExceptionTestManager();
        expect(manager.testMutexDoubleLockExceptionNative()).assertTrue();
        done();
      });

    /**
     * @tc.number    SUB_ANI_EXCEPTION_RWLOCK_CONFLICT_0900
     * @tc.name      test_rwLockConflictException_0009
     * @tc.desc      Scenario 10.9: RWLock read/write conflict
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_rwLockConflictException_0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (done: () => void): void => {
        let manager = new ExceptionTestManager();
        expect(manager.testRWLockConflictNative()).assertTrue();
        done();
      });

    /**
     * @tc.number    SUB_ANI_EXCEPTION_WORKERLOCAL_NOT_SET_1000
     * @tc.name      test_workerLocalNotSetException_0010
     * @tc.desc      Scenario 10.10: WorkerLocal.get without set returns null
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_workerLocalNotSetException_0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (done: () => void): void => {
        let manager = new ExceptionTestManager();
        expect(manager.testWorkerLocalNotSetNative()).assertTrue();
        done();
      });

    /**
     * @tc.number    SUB_ANI_EXCEPTION_GLOBALREF_DELETE_NULL_1100
     * @tc.name      test_globalRefDeleteNullException_0011
     * @tc.desc      Scenario 10.11: GlobalReference.delete with null returns error code
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_globalRefDeleteNullException_0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (done: () => void): void => {
        let manager = new ExceptionTestManager();
        expect(manager.testGlobalRefDeleteNullExceptionNative()).assertTrue();
        done();
      });

    /**
     * @tc.number    SUB_ANI_EXCEPTION_NULL_OBJECT_PROPERTY_1200
     * @tc.name      test_nullObjectPropertyException_0012
     * @tc.desc      Scenario 10.12: Property access on null object
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_nullObjectPropertyException_0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (done: () => void): void => {
        let manager = new ExceptionTestManager();
        expect(manager.testNullObjectPropertyNative()).assertTrue();
        done();
      });

    /**
     * @tc.number    SUB_ANI_EXCEPTION_NULL_ARRAY_OPERATION_1300
     * @tc.name      test_nullArrayOperationException_0013
     * @tc.desc      Scenario 10.13: Operation on null array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_nullArrayOperationException_0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (done: () => void): void => {
        let manager = new ExceptionTestManager();
        expect(manager.testNullArrayOperationNative()).assertTrue();
        done();
      });

    /**
     * @tc.number    SUB_ANI_EXCEPTION_NULL_STRING_OPERATION_1400
     * @tc.name      test_nullStringOperationException_0014
     * @tc.desc      Scenario 10.14: Operation on null string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_nullStringOperationException_0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (done: () => void): void => {
        let manager = new ExceptionTestManager();
        expect(manager.testNullStringOperationNative()).assertTrue();
        done();
      });

    /**
     * @tc.number    SUB_ANI_EXCEPTION_UNBOX_TYPE_MISMATCH_1500
     * @tc.name      test_unboxTypeMismatchException_0015
     * @tc.desc      Scenario 10.15: Unbox type mismatch
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_unboxTypeMismatchException_0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (done: () => void): void => {
        let manager = new ExceptionTestManager();
        expect(manager.testUnboxTypeMismatchNative()).assertTrue();
        done();
      });
  })
}
