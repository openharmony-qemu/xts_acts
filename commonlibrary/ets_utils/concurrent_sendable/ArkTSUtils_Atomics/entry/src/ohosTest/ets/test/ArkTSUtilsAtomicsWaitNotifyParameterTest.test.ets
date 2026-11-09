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

import { ArkTSUtils, collections, taskpool } from '@kit.ArkTS';
import { BusinessError } from '@kit.BasicServicesKit';
import { describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import {
  ATOMIC_PARAMETER_ERROR, expectAtomicBusinessError, expectAtomicIndexError
} from './ArkTSUtilsAtomicsErrorAssert';

const WAIT_PARAMETER_TIMEOUT: number = 3000;
const WAIT_PARAMETER_POLL: number = 5;

function assertWaitParameterError(operation: () => void): void {
  const valid: collections.Int32Array = collections.Int32Array.of(1);
  expect(ArkTSUtils.Atomics.wait(valid, 0, 0, 0)).assertEqual('not-equal');
  expect(ArkTSUtils.Atomics.notify(valid, 0, 0)).assertEqual(0);
  expectAtomicBusinessError(operation, ATOMIC_PARAMETER_ERROR);
}

function assertWaitNotifyType(value: Object | null | undefined): void {
  const array: collections.Int32Array = value as collections.Int32Array;
  assertWaitParameterError((): void => { ArkTSUtils.Atomics.wait(array, 0, 0, 0); });
  assertWaitParameterError((): void => { ArkTSUtils.Atomics.notify(array, 0, 0); });
}

function assertWaitNotifyIndex(array: collections.Int32Array, index: number): void {
  expectAtomicIndexError((): void => { ArkTSUtils.Atomics.wait(array, index, 0, 0); }, index);
  expectAtomicIndexError((): void => { ArkTSUtils.Atomics.notify(array, index, 0); }, index);
}

function waitParameterDelay(): Promise<void> {
  return new Promise<void>((resolve: () => void): void => { setTimeout(resolve, WAIT_PARAMETER_POLL); });
}

@Concurrent
async function waitParameterTask(array: collections.Int32Array, state: collections.Int32Array,
  index: number): Promise<string> {
  const timeout: number = 3000;
  ArkTSUtils.Atomics.add(state, 0, 1);
  // Cleanup changes the selected element before notifying, closing the pre-wait race too.
  const result: string = ArkTSUtils.Atomics.wait(array, index, 0, timeout);
  ArkTSUtils.Atomics.add(state, 1, 1);
  return result;
}

async function awaitWaiterReadiness(state: collections.Int32Array, count: number): Promise<void> {
  const deadline: number = Date.now() + WAIT_PARAMETER_TIMEOUT;
  while (Date.now() < deadline && ArkTSUtils.Atomics.load(state, 0) !== count) {
    await waitParameterDelay();
  }
  expect(ArkTSUtils.Atomics.load(state, 0)).assertEqual(count);
}

async function notifyWaiters(array: collections.Int32Array, index: number, count: number | undefined,
  expected: number): Promise<number> {
  const deadline: number = Date.now() + WAIT_PARAMETER_TIMEOUT;
  let notified: number = 0;
  while (Date.now() < deadline && notified < expected) {
    // Retry notification because readiness is published immediately before entering wait.
    notified += ArkTSUtils.Atomics.notify(array, index, count);
    if (notified < expected) {
      await waitParameterDelay();
    }
  }
  return notified;
}

async function finishWaiters(array: collections.Int32Array, index: number, tasks: Promise<Object>[]): Promise<void> {
  ArkTSUtils.Atomics.store(array, index, 1);
  ArkTSUtils.Atomics.notify(array, index);
  await Promise.all(tasks);
}

async function verifyNotifyCounts(): Promise<void> {
  const array: collections.Int32Array = new collections.Int32Array(2);
  const state: collections.Int32Array = new collections.Int32Array(2);
  const tasks: Promise<Object>[] = [taskpool.execute(waitParameterTask, array, state, 0),
    taskpool.execute(waitParameterTask, array, state, 0)];
  try {
    await awaitWaiterReadiness(state, 2);
    const noWakeCounts: number[] = [0, -1, -0.9, -Infinity, NaN, 0.9];
    for (let count of noWakeCounts) {
      expect(ArkTSUtils.Atomics.notify(array, 0, count)).assertEqual(0);
    }
    expect(ArkTSUtils.Atomics.load(state, 1)).assertEqual(0);
    expect(await notifyWaiters(array, 0, 1.9, 1)).assertEqual(1);
    expect(await notifyWaiters(array, 0, undefined, 1)).assertEqual(1);
    const results: Object[] = await Promise.all(tasks);
    expect(results[0] as string).assertEqual('ok');
    expect(results[1] as string).assertEqual('ok');
    expect(ArkTSUtils.Atomics.notify(array, 0)).assertEqual(0);
  } finally {
    await finishWaiters(array, 0, tasks);
  }
}

async function verifyNotifyInfinity(): Promise<void> {
  const array: collections.Int32Array = new collections.Int32Array(1);
  const state: collections.Int32Array = new collections.Int32Array(2);
  const tasks: Promise<Object>[] = [taskpool.execute(waitParameterTask, array, state, 0),
    taskpool.execute(waitParameterTask, array, state, 0)];
  try {
    await awaitWaiterReadiness(state, 2);
    expect(await notifyWaiters(array, 0, Infinity, 2)).assertEqual(2);
    const results: Object[] = await Promise.all(tasks);
    expect(results[0] as string).assertEqual('ok');
    expect(results[1] as string).assertEqual('ok');
  } finally {
    await finishWaiters(array, 0, tasks);
  }
}

async function verifyNotifyAddress(): Promise<void> {
  const buffer: collections.ArrayBuffer = new collections.ArrayBuffer(16);
  const array: collections.Int32Array = new collections.Int32Array(buffer);
  const alias: collections.Int32Array = new collections.Int32Array(buffer, 4, 2);
  const other: collections.Int32Array = new collections.Int32Array(4);
  const state: collections.Int32Array = new collections.Int32Array(2);
  const tasks: Promise<Object>[] = [taskpool.execute(waitParameterTask, array, state, 1)];
  try {
    await awaitWaiterReadiness(state, 1);
    expect(ArkTSUtils.Atomics.notify(array, 0, 1)).assertEqual(0);
    expect(ArkTSUtils.Atomics.notify(other, 1, 1)).assertEqual(0);
    expect(ArkTSUtils.Atomics.notify(alias, 1, 1)).assertEqual(0);
    expect(await notifyWaiters(alias, 0, 1, 1)).assertEqual(1);
    const results: Object[] = await Promise.all(tasks);
    expect(results[0] as string).assertEqual('ok');
  } finally {
    await finishWaiters(array, 1, tasks);
  }
}

export default function arkTSUtilsAtomicsWaitNotifyParameterTest(): void {
  describe('ArkTSUtilsAtomicsWaitNotifyParameterTest', (): void => {
    /**
     * @tc.number    SUB_ARKTSUTILS_ATOMICS_WAIT_NOTIFY_SUPPORTED_TYPE0064_6400
     * @tc.name      testArkTSUtilsAtomicsWaitNotifySupportedType0064
     * @tc.desc      Verify Int32Array is accepted and prevent missing exports from masking negative tests.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testArkTSUtilsAtomicsWaitNotifySupportedType0064',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
        const array: collections.Int32Array = collections.Int32Array.of(1);
        expect(ArkTSUtils.Atomics.wait(array, 0, 0, 0)).assertEqual('not-equal');
        expect(ArkTSUtils.Atomics.notify(array, 0, 0)).assertEqual(0);
      });

    /**
     * @tc.number    SUB_ARKTSUTILS_ATOMICS_WAIT_NOTIFY_REJECT_SENDABLE_TYPES0065_6500
     * @tc.name      testArkTSUtilsAtomicsWaitNotifyRejectSendableTypes0065
     * @tc.desc      Other collections integer, floating-point and clamped arrays throw BusinessError with code 401.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testArkTSUtilsAtomicsWaitNotifyRejectSendableTypes0065',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
        const arrays: Object[] = [new collections.Int8Array(1), new collections.Uint8Array(1),
          new collections.Int16Array(1), new collections.Uint16Array(1), new collections.Uint32Array(1),
          new collections.Float32Array(1), new collections.Uint8ClampedArray(1)];
        arrays.forEach((array: Object): void => { assertWaitNotifyType(array); });
      });

    /**
     * @tc.number    SUB_ARKTSUTILS_ATOMICS_WAIT_NOTIFY_REJECT_NATIVE_TYPES0066_6600
     * @tc.name      testArkTSUtilsAtomicsWaitNotifyRejectNativeTypes0066
     * @tc.desc      All ordinary typed arrays throw BusinessError with code 401 for wait and notify.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testArkTSUtilsAtomicsWaitNotifyRejectNativeTypes0066',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
        const arrays: Object[] = [new Int8Array(1), new Uint8Array(1), new Int16Array(1), new Uint16Array(1),
          new Int32Array(1), new Uint32Array(1), new Float32Array(1), new Float64Array(1), new Uint8ClampedArray(1)];
        arrays.forEach((array: Object): void => { assertWaitNotifyType(array); });
      });

    /**
     * @tc.number    SUB_ARKTSUTILS_ATOMICS_WAIT_NOTIFY_REJECT_NON_ARRAYS0067_6700
     * @tc.name      testArkTSUtilsAtomicsWaitNotifyRejectNonArrays0067
     * @tc.desc      Null, undefined, numbers, strings, plain objects and buffers throw BusinessError with code 401.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testArkTSUtilsAtomicsWaitNotifyRejectNonArrays0067',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
        const values: (Object | null | undefined)[] = [null, undefined, 0, 'array', new Object(),
          new collections.ArrayBuffer(4)];
        values.forEach((value: Object | null | undefined): void => { assertWaitNotifyType(value); });

        // Explicit null/undefined calls keep the API name and argument positions visible.
        expectAtomicBusinessError((): void => {
          ArkTSUtils.Atomics.wait(
            null!,
            0,
            0,
            0
          );
        }, ATOMIC_PARAMETER_ERROR);
        expectAtomicBusinessError((): void => {
          ArkTSUtils.Atomics.notify(
            null!,
            0,
            0
          );
        }, ATOMIC_PARAMETER_ERROR);
        expectAtomicBusinessError((): void => {
          ArkTSUtils.Atomics.wait(
            undefined!,
            0,
            0,
            0
          );
        }, ATOMIC_PARAMETER_ERROR);
        expectAtomicBusinessError((): void => {
          ArkTSUtils.Atomics.notify(
            undefined!,
            0,
            0
          );
        }, ATOMIC_PARAMETER_ERROR);
      });

    /**
     * @tc.number    SUB_ARKTSUTILS_ATOMICS_WAIT_NOTIFY_INVALID_INDICES0068_6800
     * @tc.name      testArkTSUtilsAtomicsWaitNotifyInvalidIndices0068
     * @tc.desc      ToIndex failures throw RangeError; indices beyond the array length throw BusinessError 10200001.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testArkTSUtilsAtomicsWaitNotifyInvalidIndices0068',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
        const array: collections.Int32Array = new collections.Int32Array(2);
        const indices: number[] = [-1, 2, Infinity, -Infinity, Number.MAX_SAFE_INTEGER];
        indices.forEach((index: number): void => { assertWaitNotifyIndex(array, index); });
        assertWaitNotifyIndex(new collections.Int32Array(0), 0);
        let waitErrorThrown: boolean = false;
        try {
          ArkTSUtils.Atomics.wait(array, array.length, 0, 0);
        } catch (error) {
          waitErrorThrown = true;
          const businessError: BusinessError = error as BusinessError;
          expect(businessError.code).assertEqual(10200001);
        }
        expect(waitErrorThrown).assertTrue();
        let notifyErrorThrown: boolean = false;
        try {
          ArkTSUtils.Atomics.notify(array, array.length, 0);
        } catch (error) {
          notifyErrorThrown = true;
          const businessError: BusinessError = error as BusinessError;
          expect(businessError.code).assertEqual(10200001);
        }
        expect(notifyErrorThrown).assertTrue();
      });

    /**
     * @tc.number    SUB_ARKTSUTILS_ATOMICS_WAIT_NOTIFY_INDEX_CONVERSION0069_6900
     * @tc.name      testArkTSUtilsAtomicsWaitNotifyIndexConversion0069
     * @tc.desc      NaN and fractional indices convert through ToIndex, including the last element.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testArkTSUtilsAtomicsWaitNotifyIndexConversion0069',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
        const array: collections.Int32Array = collections.Int32Array.of(3, 7);
        const firstIndices: number[] = [0, -0, 0.9, -0.9, NaN];
        firstIndices.forEach((index: number): void => {
          expect(ArkTSUtils.Atomics.wait(array, index, 3, 0)).assertEqual('timed-out');
          expect(ArkTSUtils.Atomics.notify(array, index, 0)).assertEqual(0);
        });
        expect(ArkTSUtils.Atomics.wait(array, 1.9, 7, 0)).assertEqual('timed-out');
        expect(ArkTSUtils.Atomics.notify(array, 1.9)).assertEqual(0);

        // Explicit null/undefined calls keep the API name and argument positions visible.
        expectAtomicBusinessError((): void => {
          ArkTSUtils.Atomics.wait(
            array,
            (null as number | null) as number,
            3,
            0
          );
        }, ATOMIC_PARAMETER_ERROR);
        expectAtomicBusinessError((): void => {
          ArkTSUtils.Atomics.notify(
            array,
            (null as number | null) as number,
            0
          );
        }, ATOMIC_PARAMETER_ERROR);
        expectAtomicBusinessError((): void => {
          ArkTSUtils.Atomics.wait(
            array,
            (undefined as number | undefined) as number,
            3,
            0
          );
        }, ATOMIC_PARAMETER_ERROR);
        expectAtomicBusinessError((): void => {
          ArkTSUtils.Atomics.notify(
            array,
            (undefined as number | undefined) as number,
            0
          );
        }, ATOMIC_PARAMETER_ERROR);
      });

    /**
     * @tc.number    SUB_ARKTSUTILS_ATOMICS_WAIT_EXPECTED_CONVERSION0070_7000
     * @tc.name      testArkTSUtilsAtomicsWaitExpectedConversion0070
     * @tc.desc      Expected values truncate and wrap to signed Int32 before comparison.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testArkTSUtilsAtomicsWaitExpectedConversion0070',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
        const array: collections.Int32Array = collections.Int32Array.of(0, 1, -2147483648);
        const zeroValues: number[] = [0, 0.9, -0.9, 4294967296, -4294967296, NaN, Infinity, -Infinity];
        zeroValues.forEach((value: number): void => {
          expect(ArkTSUtils.Atomics.wait(array, 0, value, 0)).assertEqual('timed-out');
        });
        expect(ArkTSUtils.Atomics.wait(array, 1, 1.9, 0)).assertEqual('timed-out');
        expect(ArkTSUtils.Atomics.wait(array, 1, 4294967297, 0)).assertEqual('timed-out');
        expect(ArkTSUtils.Atomics.wait(array, 1, -4294967295, 0)).assertEqual('timed-out');
        expect(ArkTSUtils.Atomics.wait(array, 2, 2147483648, 0)).assertEqual('timed-out');
        expect(ArkTSUtils.Atomics.wait(array, 1, 0.9, 0)).assertEqual('not-equal');

        // Explicit null/undefined calls keep the API name and argument positions visible.
        expectAtomicBusinessError((): void => {
          ArkTSUtils.Atomics.wait(
            array,
            0,
            (null as number | null) as number,
            0
          );
        }, ATOMIC_PARAMETER_ERROR);
        expectAtomicBusinessError((): void => {
          ArkTSUtils.Atomics.wait(
            array,
            0,
            (undefined as number | undefined) as number,
            0
          );
        }, ATOMIC_PARAMETER_ERROR);
      });

    /**
     * @tc.number    SUB_ARKTSUTILS_ATOMICS_WAIT_ZERO_NEGATIVE_TIMEOUT0071_7100
     * @tc.name      testArkTSUtilsAtomicsWaitZeroNegativeTimeout0071
     * @tc.desc      Zero, negative and negative infinite timeouts expire immediately on a matching value.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testArkTSUtilsAtomicsWaitZeroNegativeTimeout0071',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
        const array: collections.Int32Array = new collections.Int32Array(1);
        const timeouts: number[] = [0, -0, -1, -0.5, -Infinity, 0.5, 1];
        timeouts.forEach((timeout: number): void => {
          expect(ArkTSUtils.Atomics.wait(array, 0, 0, timeout)).assertEqual('timed-out');
        });

        // Explicit null/undefined calls keep the API name and argument positions visible.
        expectAtomicBusinessError((): void => {
          ArkTSUtils.Atomics.wait(
            array,
            0,
            0,
            (null as number | null) as number
          );
        }, ATOMIC_PARAMETER_ERROR);
      });

    /**
     * @tc.number    SUB_ARKTSUTILS_ATOMICS_WAIT_UNBOUNDED_TIMEOUT_MISMATCH0072_7200
     * @tc.name      testArkTSUtilsAtomicsWaitUnboundedTimeoutMismatch0072
     * @tc.desc      Omitted, undefined, NaN and infinite timeouts still return immediately on a mismatch.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testArkTSUtilsAtomicsWaitUnboundedTimeoutMismatch0072',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
        const array: collections.Int32Array = collections.Int32Array.of(1);
        expect(ArkTSUtils.Atomics.wait(array, 0, 0)).assertEqual('not-equal');
        expect(ArkTSUtils.Atomics.wait(array, 0, 0, undefined)).assertEqual('not-equal');
        expect(ArkTSUtils.Atomics.wait(array, 0, 0, NaN)).assertEqual('not-equal');
        expect(ArkTSUtils.Atomics.wait(array, 0, 0, Infinity)).assertEqual('not-equal');
      });

    /**
     * @tc.number    SUB_ARKTSUTILS_ATOMICS_WAIT_NOTIFY_OFFSET_VIEW_BOUNDS0073_7300
     * @tc.name      testArkTSUtilsAtomicsWaitNotifyOffsetViewBounds0073
     * @tc.desc      Offset views use their own length and share the selected backing element.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testArkTSUtilsAtomicsWaitNotifyOffsetViewBounds0073',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
        const buffer: collections.ArrayBuffer = new collections.ArrayBuffer(16);
        const whole: collections.Int32Array = new collections.Int32Array(buffer);
        const view: collections.Int32Array = new collections.Int32Array(buffer, 4, 2);
        ArkTSUtils.Atomics.store(whole, 2, 9);
        expect(ArkTSUtils.Atomics.wait(view, 1, 9, 0)).assertEqual('timed-out');
        expect(ArkTSUtils.Atomics.notify(view, 1)).assertEqual(0);
        assertWaitNotifyIndex(view, 2);
      });

    /**
     * @tc.number    SUB_ARKTSUTILS_ATOMICS_NOTIFY_COUNT_CONVERSION0074_7400
     * @tc.name      testArkTSUtilsAtomicsNotifyCountConversion0074
     * @tc.desc      Nonpositive and NaN counts wake nobody; fractional count truncates and default wakes the rest.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testArkTSUtilsAtomicsNotifyCountConversion0074',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
        await verifyNotifyCounts();
      });

    /**
     * @tc.number    SUB_ARKTSUTILS_ATOMICS_NOTIFY_INFINITE_COUNT0075_7500
     * @tc.name      testArkTSUtilsAtomicsNotifyInfiniteCount0075
     * @tc.desc      Infinite counts eventually notify both waiters; retries handle the readiness-to-wait race.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testArkTSUtilsAtomicsNotifyInfiniteCount0075',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
        await verifyNotifyInfinity();
      });

    /**
     * @tc.number    SUB_ARKTSUTILS_ATOMICS_NOTIFY_ADDRESS_ISOLATION0076_7600
     * @tc.name      testArkTSUtilsAtomicsNotifyAddressIsolation0076
     * @tc.desc      Other indices and arrays cannot wake a waiter; an offset alias for its element can.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testArkTSUtilsAtomicsNotifyAddressIsolation0076',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
        await verifyNotifyAddress();
      });

    /**
     * @tc.number    SUB_ARKTSUTILS_ATOMICS_WAIT_NOTIFY_COERCIBLE_PARAMETERS0077_7700
     * @tc.name      testArkTSUtilsAtomicsWaitNotifyCoercibleParameters0077
     * @tc.desc      Reject non-number index, expected value, timeout and notify count with code 401.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testArkTSUtilsAtomicsWaitNotifyCoercibleParameters0077',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
        const array: collections.Int32Array = new collections.Int32Array(2);
        const indices: (Object | null | undefined)[] = [undefined, null, false, true, '0', '1'];
        indices.forEach((index: Object | null | undefined): void => {
          expectAtomicBusinessError((): void => {
            ArkTSUtils.Atomics.wait(array, index as number, 0, 0);
          }, ATOMIC_PARAMETER_ERROR);
          expectAtomicBusinessError((): void => {
            ArkTSUtils.Atomics.notify(array, index as number, 0);
          }, ATOMIC_PARAMETER_ERROR);
        });
        const zeroValues: (Object | null | undefined)[] = [undefined, null, false, '0', 'invalid'];
        zeroValues.forEach((value: Object | null | undefined): void => {
          expectAtomicBusinessError((): void => {
            ArkTSUtils.Atomics.wait(array, 0, value as number, 0);
          }, ATOMIC_PARAMETER_ERROR);
        });
        const zeroTimeouts: (Object | null)[] = [null, false, '0', '-1'];
        zeroTimeouts.forEach((timeout: Object | null): void => {
          expectAtomicBusinessError((): void => {
            ArkTSUtils.Atomics.wait(array, 0, 0, timeout as number);
          }, ATOMIC_PARAMETER_ERROR);
        });
        const zeroCounts: (Object | null)[] = [null, false, '0', 'invalid'];
        zeroCounts.forEach((count: Object | null): void => {
          expectAtomicBusinessError((): void => {
            ArkTSUtils.Atomics.notify(array, 0, count as number);
          }, ATOMIC_PARAMETER_ERROR);
        });

        // Explicit null/undefined calls keep the API name and argument positions visible.
        expectAtomicBusinessError((): void => {
          ArkTSUtils.Atomics.notify(
            array,
            0,
            (null as number | null) as number
          );
        }, ATOMIC_PARAMETER_ERROR);
        expect(ArkTSUtils.Atomics.notify(
          array,
          0,
          (undefined as number | undefined) as number
        )).assertEqual(0);
      });
  });
}
