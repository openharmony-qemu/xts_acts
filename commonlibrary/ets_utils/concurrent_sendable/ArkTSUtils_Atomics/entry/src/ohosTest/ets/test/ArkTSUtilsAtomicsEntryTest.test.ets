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

import { ArkTSUtils, collections } from '@kit.ArkTS';
import { describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { ATOMIC_INDEX_ERROR, ATOMIC_PARAMETER_ERROR, expectAtomicBusinessError } from './ArkTSUtilsAtomicsErrorAssert';

type AtomicEntryOperation = (array: collections.Int32Array) => void;

function expectEntryParameterError(operation: AtomicEntryOperation, value: Object): void {
  expectAtomicBusinessError((): void => {
    operation(value as collections.Int32Array);
  }, ATOMIC_PARAMETER_ERROR);
}

function getArrayOperations(): AtomicEntryOperation[] {
  return [
    (array: collections.Int32Array): void => { ArkTSUtils.Atomics.add(array, 0, 1); },
    (array: collections.Int32Array): void => { ArkTSUtils.Atomics.and(array, 0, 1); },
    (array: collections.Int32Array): void => { ArkTSUtils.Atomics.compareExchange(array, 0, 0, 1); },
    (array: collections.Int32Array): void => { ArkTSUtils.Atomics.exchange(array, 0, 1); },
    (array: collections.Int32Array): void => { ArkTSUtils.Atomics.load(array, 0); },
    (array: collections.Int32Array): void => { ArkTSUtils.Atomics.or(array, 0, 1); },
    (array: collections.Int32Array): void => { ArkTSUtils.Atomics.store(array, 0, 1); },
    (array: collections.Int32Array): void => { ArkTSUtils.Atomics.sub(array, 0, 1); },
    (array: collections.Int32Array): void => { ArkTSUtils.Atomics.wait(array, 0, 1, 0); },
    (array: collections.Int32Array): void => { ArkTSUtils.Atomics.notify(array, 0, 1); },
    (array: collections.Int32Array): void => { ArkTSUtils.Atomics.xor(array, 0, 1); }
  ];
}

function registerOrdinaryArrayTests(): void {
  /**
   * @tc.number    SUB_ARKTSUTILS_ATOMICS_REJECT_ORDINARY_TYPED_ARRAYS_1600
   * @tc.name      testArkTSUtilsAtomicsRejectOrdinaryTypedArrays
   * @tc.desc      ArkTSUtils.Atomics rejects ordinary typed arrays for every array operation.
   * @tc.size      MediumTest
   * @tc.type      Function
   * @tc.level     Level 1
   */
  it('testArkTSUtilsAtomicsRejectOrdinaryTypedArrays',
    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      expect(typeof ArkTSUtils.Atomics.load).assertEqual('function');
      expect(typeof ArkTSUtils.Atomics.store).assertEqual('function');
      const values: Object[] = [new Int8Array(1), new Uint8Array(1), new Int16Array(1),
        new Uint16Array(1), new Int32Array(1), new Uint32Array(1), new Float32Array(1),
        new Float64Array(1), new Uint8ClampedArray(1)];
      getArrayOperations().forEach((operation: AtomicEntryOperation): void => {
        values.forEach((value: Object): void => { expectEntryParameterError(operation, value); });
      });
    });
}

function registerSendableTests(): void {
  /**
   * @tc.number    SUB_ARKTSUTILS_ATOMICS_FORWARD_SENDABLE_OPERATIONS_1700
   * @tc.name      testArkTSUtilsAtomicsForwardSendableOperations
   * @tc.desc      ArkTSUtils exports Atomics with working sendable operations and runtime checks.
   * @tc.size      MediumTest
   * @tc.type      Function
   * @tc.level     Level 1
   */
  it('testArkTSUtilsAtomicsForwardSendableOperations',
    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const array: collections.Int32Array = collections.Int32Array.of(6);
      expect(ArkTSUtils.Atomics.add(array, 0, 2)).assertEqual(6);
      expect(ArkTSUtils.Atomics.sub(array, 0, 3)).assertEqual(8);
      expect(ArkTSUtils.Atomics.and(array, 0, 3)).assertEqual(5);
      expect(ArkTSUtils.Atomics.or(array, 0, 4)).assertEqual(1);
      expect(ArkTSUtils.Atomics.xor(array, 0, 1)).assertEqual(5);
      expect(ArkTSUtils.Atomics.exchange(array, 0, 9)).assertEqual(4);
      expect(ArkTSUtils.Atomics.compareExchange(array, 0, 8, 7)).assertEqual(9);
      expect(ArkTSUtils.Atomics.compareExchange(array, 0, 9, 7)).assertEqual(9);
      expect(ArkTSUtils.Atomics.load(array, 0)).assertEqual(7);
      expect(ArkTSUtils.Atomics.store(array, 0, 0)).assertEqual(0);
      expect(ArkTSUtils.Atomics.wait(array, 0, 1, 0)).assertEqual('not-equal');
      expect(ArkTSUtils.Atomics.wait(array, 0, 0, 0)).assertEqual('timed-out');
      expect(ArkTSUtils.Atomics.notify(array, 0, 1)).assertEqual(0);
      expectAtomicBusinessError((): void => {
        ArkTSUtils.Atomics.load(array, 1);
      }, ATOMIC_INDEX_ERROR);
      expectEntryParameterError((value: collections.Int32Array): void => {
        ArkTSUtils.Atomics.load(value, 0);
      }, new collections.Float32Array(1));
    });

}

function registerGlobalTests(): void {
  /**
   * @tc.number    SUB_ARKTSUTILS_ATOMICS_KEEPS_GLOBAL_ATOMICS_1800
   * @tc.name      testArkTSUtilsAtomicsKeepsGlobalAtomics
   * @tc.desc      Global Atomics still accepts ordinary arrays and isLockFree keeps its result.
   * @tc.size      MediumTest
   * @tc.type      Function
   * @tc.level     Level 1
   */
  it('testArkTSUtilsAtomicsKeepsGlobalAtomics',
    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const array: Int32Array = new Int32Array([3]);
      expect(Atomics.add(array, 0, 1)).assertEqual(3);
      expect(array[0]).assertEqual(4);
      expect(ArkTSUtils.Atomics.isLockFree(4)).assertEqual(Atomics.isLockFree(4));
    });
}

export default function arkTSUtilsAtomicsEntryTest(): void {
  describe('ArkTSUtilsAtomicsEntryTest', (): void => {
    registerOrdinaryArrayTests();
    registerSendableTests();
    registerGlobalTests();
  });
}
