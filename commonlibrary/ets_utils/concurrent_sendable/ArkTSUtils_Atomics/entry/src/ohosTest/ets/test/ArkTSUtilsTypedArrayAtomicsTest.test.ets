/*
 * Copyright (c) 2026 RKH Corp.
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

import { ArkTSUtils, collections, taskpool } from '@kit.ArkTS';
import { BusinessError } from '@kit.BasicServicesKit';
import { describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { ATOMIC_INDEX_ERROR, ATOMIC_PARAMETER_ERROR, expectAtomicBusinessError } from './ArkTSUtilsAtomicsErrorAssert';

type AtomicArkTSUtilsArray = collections.Int8Array | collections.Uint8Array |
  collections.Int16Array | collections.Uint16Array | collections.Int32Array |
  collections.Uint32Array;

const ARRAY_LENGTH: number = 2;
const TEST_INDEX: number = 0;
const INITIAL_VALUE: number = 10;
const STORED_VALUE: number = 12;
const ADD_VALUE: number = 3;
const SUB_VALUE: number = 5;
const AND_VALUE: number = 6;
const OR_VALUE: number = 8;
const XOR_VALUE: number = 3;
const EXCHANGE_VALUE: number = 20;
const REPLACEMENT_VALUE: number = 30;
const MISMATCH_VALUE: number = 40;
const INT8_MAX: number = 127;
const INT8_MIN: number = -128;
const UINT8_MAX: number = 255;
const INT16_MAX: number = 32767;
const INT16_MIN: number = -32768;
const UINT16_MAX: number = 65535;
const UINT32_MAX: number = 4294967295;
const ONE: number = 1;
const ZERO: number = 0;
const TASK_COUNT: number = 4;
const ADD_ITERATIONS: number = 1000;
const CAS_ITERATIONS: number = 500;
const SHORT_TIMEOUT_MS: number = 10;
const READY_INDEX: number = 1;
const READY_POLL_INTERVAL_MS: number = 10;
const READY_POLL_LIMIT: number = 300;
const VALUE_AFTER_ADD: number = 15;
const VALUE_AFTER_AND: number = 2;
const VALUE_AFTER_OR: number = 10;
const VALUE_AFTER_XOR: number = 9;

function verifyAtomicOperations(array: AtomicArkTSUtilsArray): void {
  array[TEST_INDEX] = INITIAL_VALUE;
  expect(ArkTSUtils.Atomics.load(array, TEST_INDEX)).assertEqual(INITIAL_VALUE);
  expect(ArkTSUtils.Atomics.store(array, TEST_INDEX, STORED_VALUE)).assertEqual(STORED_VALUE);
  expect(ArkTSUtils.Atomics.add(array, TEST_INDEX, ADD_VALUE)).assertEqual(STORED_VALUE);
  expect(ArkTSUtils.Atomics.sub(array, TEST_INDEX, SUB_VALUE)).assertEqual(VALUE_AFTER_ADD);
  expect(ArkTSUtils.Atomics.and(array, TEST_INDEX, AND_VALUE)).assertEqual(INITIAL_VALUE);
  expect(ArkTSUtils.Atomics.or(array, TEST_INDEX, OR_VALUE)).assertEqual(VALUE_AFTER_AND);
  expect(ArkTSUtils.Atomics.xor(array, TEST_INDEX, XOR_VALUE)).assertEqual(VALUE_AFTER_OR);
  expect(ArkTSUtils.Atomics.exchange(array, TEST_INDEX, EXCHANGE_VALUE)).assertEqual(VALUE_AFTER_XOR);
  expect(ArkTSUtils.Atomics.compareExchange(array, TEST_INDEX, EXCHANGE_VALUE, REPLACEMENT_VALUE))
    .assertEqual(EXCHANGE_VALUE);
  expect(ArkTSUtils.Atomics.compareExchange(array, TEST_INDEX, MISMATCH_VALUE, STORED_VALUE))
    .assertEqual(REPLACEMENT_VALUE);
  expect(ArkTSUtils.Atomics.load(array, TEST_INDEX)).assertEqual(REPLACEMENT_VALUE);
}

@Concurrent
async function atomicAddTask(array: collections.Int32Array, iterations: number): Promise<void> {
  const index: number = 0;
  const increment: number = 1;
  for (let i: number = 0; i < iterations; i++) {
    ArkTSUtils.Atomics.add(array, index, increment);
  }
}

@Concurrent
async function atomicCompareExchangeTask(array: collections.Int32Array, iterations: number): Promise<void> {
  const index: number = 0;
  const increment: number = 1;
  for (let i: number = 0; i < iterations; i++) {
    let updated: boolean = false;
    while (!updated) {
      const current: number = ArkTSUtils.Atomics.load(array, index);
      updated = ArkTSUtils.Atomics.compareExchange(array, index, current, current + increment) === current;
    }
  }
}

@Concurrent
async function atomicWaitTask(array: collections.Int32Array): Promise<string> {
  const index: number = 0;
  const readyIndex: number = 1;
  const expectedValue: number = 0;
  const readyValue: number = 1;
  const timeout: number = 3000;
  ArkTSUtils.Atomics.store(array, readyIndex, readyValue);
  return ArkTSUtils.Atomics.wait(array, index, expectedValue, timeout);
}

function delay(timeout: number): Promise<void> {
  return new Promise<void>((resolve: () => void): void => {
    setTimeout(resolve, timeout);
  });
}

export default function arkTSUtilsTypedArrayAtomicsTest(): void {
  describe('ArkTSUtilsTypedArrayAtomicsTest', (): void => {
    /**
     * @tc.number    SUB_ARKTSUTILS_ATOMICS_INT8_ARRAY_ATOMICS0001_0100
     * @tc.name      testArkTSUtilsInt8ArrayAtomics0001
     * @tc.desc      Verify all read-modify-write ArkTSUtils.Atomics operations on collections.Int8Array.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testArkTSUtilsInt8ArrayAtomics0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      verifyAtomicOperations(new collections.Int8Array(ARRAY_LENGTH));
    });

    /**
     * @tc.number    SUB_ARKTSUTILS_ATOMICS_UINT8_ARRAY_ATOMICS0002_0200
     * @tc.name      testArkTSUtilsUint8ArrayAtomics0002
     * @tc.desc      Verify all read-modify-write ArkTSUtils.Atomics operations on collections.Uint8Array.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testArkTSUtilsUint8ArrayAtomics0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      verifyAtomicOperations(new collections.Uint8Array(ARRAY_LENGTH));
    });

    /**
     * @tc.number    SUB_ARKTSUTILS_ATOMICS_INT16_ARRAY_ATOMICS0003_0300
     * @tc.name      testArkTSUtilsInt16ArrayAtomics0003
     * @tc.desc      Verify all read-modify-write ArkTSUtils.Atomics operations on collections.Int16Array.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testArkTSUtilsInt16ArrayAtomics0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      verifyAtomicOperations(new collections.Int16Array(ARRAY_LENGTH));
    });

    /**
     * @tc.number    SUB_ARKTSUTILS_ATOMICS_UINT16_ARRAY_ATOMICS0004_0400
     * @tc.name      testArkTSUtilsUint16ArrayAtomics0004
     * @tc.desc      Verify all read-modify-write ArkTSUtils.Atomics operations on collections.Uint16Array.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testArkTSUtilsUint16ArrayAtomics0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      verifyAtomicOperations(new collections.Uint16Array(ARRAY_LENGTH));
    });

    /**
     * @tc.number    SUB_ARKTSUTILS_ATOMICS_INT32_ARRAY_ATOMICS0005_0500
     * @tc.name      testArkTSUtilsInt32ArrayAtomics0005
     * @tc.desc      Verify all read-modify-write ArkTSUtils.Atomics operations on collections.Int32Array.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testArkTSUtilsInt32ArrayAtomics0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      verifyAtomicOperations(new collections.Int32Array(ARRAY_LENGTH));
    });

    /**
     * @tc.number    SUB_ARKTSUTILS_ATOMICS_UINT32_ARRAY_ATOMICS0006_0600
     * @tc.name      testArkTSUtilsUint32ArrayAtomics0006
     * @tc.desc      Verify all read-modify-write ArkTSUtils.Atomics operations on collections.Uint32Array.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testArkTSUtilsUint32ArrayAtomics0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      verifyAtomicOperations(new collections.Uint32Array(ARRAY_LENGTH));
    });

    /**
     * @tc.number    SUB_ARKTSUTILS_ATOMICS_TYPED_ARRAY_OVERFLOW0007_0700
     * @tc.name      testArkTSUtilsTypedArrayOverflow0007
     * @tc.desc      Verify signed and unsigned integer wrapping for atomic addition.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testArkTSUtilsTypedArrayOverflow0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const int8Array: collections.Int8Array = collections.Int8Array.of(INT8_MAX);
      const uint8Array: collections.Uint8Array = collections.Uint8Array.of(UINT8_MAX);
      const int16Array: collections.Int16Array = collections.Int16Array.of(INT16_MAX);
      const uint16Array: collections.Uint16Array = collections.Uint16Array.of(UINT16_MAX);
      const uint32Array: collections.Uint32Array = collections.Uint32Array.of(UINT32_MAX);
      ArkTSUtils.Atomics.add(int8Array, TEST_INDEX, ONE);
      ArkTSUtils.Atomics.add(uint8Array, TEST_INDEX, ONE);
      ArkTSUtils.Atomics.add(int16Array, TEST_INDEX, ONE);
      ArkTSUtils.Atomics.add(uint16Array, TEST_INDEX, ONE);
      ArkTSUtils.Atomics.add(uint32Array, TEST_INDEX, ONE);
      expect(ArkTSUtils.Atomics.load(int8Array, TEST_INDEX)).assertEqual(INT8_MIN);
      expect(ArkTSUtils.Atomics.load(uint8Array, TEST_INDEX)).assertEqual(ZERO);
      expect(ArkTSUtils.Atomics.load(int16Array, TEST_INDEX)).assertEqual(INT16_MIN);
      expect(ArkTSUtils.Atomics.load(uint16Array, TEST_INDEX)).assertEqual(ZERO);
      expect(ArkTSUtils.Atomics.load(uint32Array, TEST_INDEX)).assertEqual(ZERO);
    });

    /**
     * @tc.number    SUB_ARKTSUTILS_ATOMICS_TYPED_ARRAY_INVALID_TYPE0008_0800
     * @tc.name      testArkTSUtilsTypedArrayInvalidType0008
     * @tc.desc      Verify unsupported collections typed arrays throw BusinessError with code 401.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testArkTSUtilsTypedArrayInvalidType0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const floatArray: collections.Int32Array = new collections.Float32Array(ARRAY_LENGTH) as Object as
        collections.Int32Array;
      const clampedArray: collections.Int32Array = new collections.Uint8ClampedArray(ARRAY_LENGTH) as Object as
        collections.Int32Array;
      let parameterErrorThrown: boolean = false;
      try {
        ArkTSUtils.Atomics.add(floatArray, TEST_INDEX, ONE);
      } catch (error) {
        parameterErrorThrown = true;
        const businessError: BusinessError = error as BusinessError;
        expect(businessError.code).assertEqual(ATOMIC_PARAMETER_ERROR);
      }
      expect(parameterErrorThrown).assertTrue();
      expectAtomicBusinessError((): void => {
        ArkTSUtils.Atomics.load(clampedArray, TEST_INDEX);
      }, ATOMIC_PARAMETER_ERROR);
    });

    /**
     * @tc.number    SUB_ARKTSUTILS_ATOMICS_TYPED_ARRAY_INVALID_INDEX0009_0900
     * @tc.name      testArkTSUtilsTypedArrayInvalidIndex0009
     * @tc.desc      Verify an out-of-range atomic index throws BusinessError with code 10200001.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testArkTSUtilsTypedArrayInvalidIndex0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const array: collections.Int32Array = new collections.Int32Array(ARRAY_LENGTH);
      let indexErrorThrown: boolean = false;
      try {
        ArkTSUtils.Atomics.load(array, ARRAY_LENGTH);
      } catch (error) {
        indexErrorThrown = true;
        const businessError: BusinessError = error as BusinessError;
        expect(businessError.code).assertEqual(ATOMIC_INDEX_ERROR);
      }
      expect(indexErrorThrown).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTSUTILS_ATOMICS_INT32_ARRAY_WAIT_RESULT0010_1000
     * @tc.name      testArkTSUtilsInt32ArrayWaitResult0010
     * @tc.desc      Verify not-equal and timed-out results of ArkTSUtils.Atomics.wait.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testArkTSUtilsInt32ArrayWaitResult0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const array: collections.Int32Array = collections.Int32Array.of(ONE);
      expect(ArkTSUtils.Atomics.wait(array, TEST_INDEX, ZERO, SHORT_TIMEOUT_MS)).assertEqual('not-equal');
      ArkTSUtils.Atomics.store(array, TEST_INDEX, ZERO);
      expect(ArkTSUtils.Atomics.wait(array, TEST_INDEX, ZERO, SHORT_TIMEOUT_MS)).assertEqual('timed-out');
    });

    /**
     * @tc.number    SUB_ARKTSUTILS_ATOMICS_INT32_ARRAY_TASKPOOL_ADD0011_1100
     * @tc.name      testArkTSUtilsInt32ArrayTaskpoolAdd0011
     * @tc.desc      Verify atomic addition is not lost across concurrent taskpool tasks.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testArkTSUtilsInt32ArrayTaskpoolAdd0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const array: collections.Int32Array = collections.Int32Array.of(ZERO);
        const tasks: Promise<Object>[] = [];
        for (let i: number = ZERO; i < TASK_COUNT; i++) {
          tasks.push(taskpool.execute(atomicAddTask, array, ADD_ITERATIONS));
        }
        await Promise.all(tasks);
        expect(ArkTSUtils.Atomics.load(array, TEST_INDEX)).assertEqual(TASK_COUNT * ADD_ITERATIONS);
        done();
      });

    /**
     * @tc.number    SUB_ARKTSUTILS_ATOMICS_INT32_ARRAY_TASKPOOL_CAS0012_1200
     * @tc.name      testArkTSUtilsInt32ArrayTaskpoolCas0012
     * @tc.desc      Verify compareExchange retry loops do not lose concurrent updates.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testArkTSUtilsInt32ArrayTaskpoolCas0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const array: collections.Int32Array = collections.Int32Array.of(ZERO);
        const tasks: Promise<Object>[] = [];
        for (let i: number = ZERO; i < TASK_COUNT; i++) {
          tasks.push(taskpool.execute(atomicCompareExchangeTask, array, CAS_ITERATIONS));
        }
        await Promise.all(tasks);
        expect(ArkTSUtils.Atomics.load(array, TEST_INDEX)).assertEqual(TASK_COUNT * CAS_ITERATIONS);
        done();
      });

    /**
     * @tc.number    SUB_ARKTSUTILS_ATOMICS_INT32_ARRAY_TASKPOOL_NOTIFY0013_1300
     * @tc.name      testArkTSUtilsInt32ArrayTaskpoolNotify0013
     * @tc.desc      Verify notify wakes a taskpool task waiting on collections.Int32Array.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testArkTSUtilsInt32ArrayTaskpoolNotify0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const array: collections.Int32Array = collections.Int32Array.of(ZERO, ZERO);
        const waitPromise: Promise<Object> = taskpool.execute(atomicWaitTask, array);
        for (let attempt: number = ZERO; attempt < READY_POLL_LIMIT; attempt++) {
          if (ArkTSUtils.Atomics.load(array, READY_INDEX) === ONE) {
            break;
          }
          await delay(READY_POLL_INTERVAL_MS);
        }
        expect(ArkTSUtils.Atomics.load(array, READY_INDEX)).assertEqual(ONE);
        let notified: number = ZERO;
        for (let attempt: number = ZERO; attempt < READY_POLL_LIMIT; attempt++) {
          notified = ArkTSUtils.Atomics.notify(array, TEST_INDEX, ONE);
          if (notified === ONE) {
            break;
          }
          await delay(READY_POLL_INTERVAL_MS);
        }
        expect(notified).assertEqual(ONE);
        expect(await waitPromise as string).assertEqual('ok');
        done();
      });
  });
}
