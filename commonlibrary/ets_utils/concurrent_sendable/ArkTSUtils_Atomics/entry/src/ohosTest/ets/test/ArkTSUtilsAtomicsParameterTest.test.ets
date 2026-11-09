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
import { BusinessError } from '@kit.BasicServicesKit';
import { describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import {
  ATOMIC_INDEX_ERROR, ATOMIC_PARAMETER_ERROR, expectAtomicBusinessError, expectAtomicIndexError
} from './ArkTSUtilsAtomicsErrorAssert';

type ParameterArray = collections.Int8Array | collections.Uint8Array | collections.Int16Array |
  collections.Uint16Array | collections.Int32Array | collections.Uint32Array;
type ParameterOperation = (array: ParameterArray, index: number, value: number) => number;

function verifyIndexParameters(operation: ParameterOperation, returned: number, stored: number): void {
  const array: collections.Int32Array = collections.Int32Array.of(7, 7);
  const valid: (number | string | boolean | null | undefined)[] =
    [0, 1, -0, NaN, 0.9, 1.9, -0.9];
  const indices: number[] = [0, 1, 0, 0, 0, 1, 0];
  for (let position: number = 0; position < valid.length; position++) {
    array.fill(7);
    const index: number = indices[position];
    expect(operation(array, valid[position] as number, 3)).assertEqual(returned);
    expect(array[index]).assertEqual(stored);
    expect(array[1 - index]).assertEqual(7);
  }
  const rejected: (number | string | boolean | null | undefined)[] = [null, undefined, '1', true, false];
  for (let value of rejected) {
    array.fill(7);
    expectAtomicBusinessError((): void => { operation(array, value as number, 3); }, ATOMIC_PARAMETER_ERROR);
    expect(array[0]).assertEqual(7);
    expect(array[1]).assertEqual(7);
  }
  const invalid: number[] = [-1, -1.9, 2, 3, Infinity, -Infinity, 9007199254740992];
  for (let position: number = 0; position < invalid.length; position++) {
    array.fill(7);
    expectAtomicIndexError((): void => { operation(array, invalid[position], 3); }, invalid[position]);
    expect(array[0]).assertEqual(7);
    expect(array[1]).assertEqual(7);
  }
  const empty: collections.Int32Array = new collections.Int32Array(0);
  expectAtomicBusinessError((): void => { operation(empty, 0, 3); }, ATOMIC_INDEX_ERROR);
}

function verifyRejectedArrays(operation: ParameterOperation): void {
  // Probe a valid call first: an absent Atomics export must not satisfy the BusinessError checks.
  operation(collections.Int32Array.of(7), 0, 3);
  const invalid: (Object | null | undefined)[] = [null, undefined, new Object(), new Array<number>(),
    new collections.ArrayBuffer(4),
    new Int8Array(1), new Uint8Array(1), new Int16Array(1), new Uint16Array(1), new Int32Array(1),
    new Uint32Array(1), new Float32Array(1), new Float64Array(1), new Uint8ClampedArray(1),
    new collections.Float32Array(1), new collections.Uint8ClampedArray(1),
    new Int32Array(new SharedArrayBuffer(4))];
  for (let index: number = 0; index < invalid.length; index++) {
    expectAtomicBusinessError((): void => {
      operation(invalid[index] as ParameterArray, 0, 3);
    }, ATOMIC_PARAMETER_ERROR);
  }
}

function verifyNumberParameters(operation: ParameterOperation, states: number[], storeResult: boolean): void {
  const values: (number | string | boolean | null | undefined)[] =
    [3, -3, 3.9, -3.9, NaN, Infinity, -Infinity, 4294967299];
  const converted: number[] = [3, -3, 3, -3, 0, Infinity, -Infinity, 4294967299];
  const array: collections.Int32Array = new collections.Int32Array(1);
  for (let index: number = 0; index < values.length; index++) {
    array[0] = 7;
    expect(operation(array, 0, values[index] as number)).assertEqual(storeResult ? converted[index] : 7);
    expect(array[0]).assertEqual(states[index]);
  }
  const rejected: (number | string | boolean | null | undefined)[] = [null, undefined, '3', true, false];
  for (let value of rejected) {
    array[0] = 7;
    expectAtomicBusinessError((): void => { operation(array, 0, value as number); }, ATOMIC_PARAMETER_ERROR);
    expect(array[0]).assertEqual(7);
  }
}

function verifyOffsetView(operation: ParameterOperation, returned: number, stored: number): collections.Int32Array {
  const parent: collections.Int32Array = collections.Int32Array.of(101, 7, 7, 103);
  const view: collections.Int32Array = new collections.Int32Array(parent.buffer, 4, 2);
  const alias: collections.Int32Array = new collections.Int32Array(parent.buffer, 4, 2);
  expect(operation(view, 0, 3)).assertEqual(returned);
  expect(parent[1]).assertEqual(stored);
  expect(ArkTSUtils.Atomics.load(alias, 0)).assertEqual(stored);
  expect(operation(view, 1, 3)).assertEqual(returned);
  expect(parent[2]).assertEqual(stored);
  expect(ArkTSUtils.Atomics.load(alias, 1)).assertEqual(stored);
  expectAtomicBusinessError((): void => { operation(view, 2, 3); }, ATOMIC_INDEX_ERROR);
  expect(parent[0]).assertEqual(101);
  expect(parent[3]).assertEqual(103);
  expect(parent[1]).assertEqual(stored);
  expect(parent[2]).assertEqual(stored);
  return parent;
}

function verifyIntegerWidth(array: ParameterArray, maximum: number, wrapped: number, modulus: number): void {
  array[0] = maximum;
  expect(ArkTSUtils.Atomics.add(array, 0, 1)).assertEqual(maximum);
  expect(ArkTSUtils.Atomics.load(array, 0)).assertEqual(wrapped);
  expect(ArkTSUtils.Atomics.sub(array, 0, 1)).assertEqual(wrapped);
  expect(array[0]).assertEqual(maximum);
  expect(ArkTSUtils.Atomics.and(array, 0, 0)).assertEqual(maximum);
  expect(array[0]).assertEqual(0);
  const highBit: number = modulus / 2;
  const highValue: number = wrapped < 0 ? wrapped : highBit;
  expect(ArkTSUtils.Atomics.or(array, 0, highBit)).assertEqual(0);
  expect(array[0]).assertEqual(highValue);
  expect(ArkTSUtils.Atomics.xor(array, 0, highBit)).assertEqual(highValue);
  expect(array[0]).assertEqual(0);
  expect(ArkTSUtils.Atomics.store(array, 0, modulus + 1)).assertEqual(modulus + 1);
  expect(array[0]).assertEqual(1);
  expect(ArkTSUtils.Atomics.exchange(array, 0, -1)).assertEqual(1);
  const negativeOne: number = wrapped < 0 ? -1 : maximum;
  expect(array[0]).assertEqual(negativeOne);
  expect(ArkTSUtils.Atomics.compareExchange(array, 0, modulus - 1, modulus + 2)).assertEqual(negativeOne);
  expect(array[0]).assertEqual(2);
  expect(ArkTSUtils.Atomics.compareExchange(array, 0, 3, 4)).assertEqual(2);
  expect(array[0]).assertEqual(2);
}

export default function arkTSUtilsAtomicsParameterTest(): void {
  describe('ArkTSUtilsAtomicsParameterTest', (): void => {
    /**
     * @tc.number    SUB_ARKTSUTILS_ATOMICS_ADD_INDEX_PARAMETERS_1900
     * @tc.name      testArkTSUtilsAtomicsAddIndexParameters
     * @tc.desc      add: first/last, ToIndex conversion, empty and invalid indices preserve other elements.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testArkTSUtilsAtomicsAddIndexParameters', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      verifyIndexParameters((array: ParameterArray, index: number, value: number): number => {
        return ArkTSUtils.Atomics.add(array, index, value);
      }, 7, 10);

      // Explicit null/undefined calls keep the API name and argument positions visible.
      const explicitArray: collections.Int32Array = collections.Int32Array.of(7);
      explicitArray[0] = 7;
      expectAtomicBusinessError((): void => {
        ArkTSUtils.Atomics.add(
          explicitArray,
          (null as number | null) as number,
          3
        );
      }, ATOMIC_PARAMETER_ERROR);
      expect(explicitArray[0]).assertEqual(7);
      explicitArray[0] = 7;
      expectAtomicBusinessError((): void => {
        ArkTSUtils.Atomics.add(
          explicitArray,
          (undefined as number | undefined) as number,
          3
        );
      }, ATOMIC_PARAMETER_ERROR);
      expect(explicitArray[0]).assertEqual(7);
      let rangeErrorThrown: boolean = false;
      try {
        ArkTSUtils.Atomics.add(
          explicitArray,
          explicitArray.length,
          1
        );
      } catch (error) {
        rangeErrorThrown = true;
        const businessError: BusinessError = error as BusinessError;
        expect(businessError.code).assertEqual(10200001);
      }
      expect(rangeErrorThrown).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTSUTILS_ATOMICS_ADD_REJECTED_ARRAYS_2000
     * @tc.name      testArkTSUtilsAtomicsAddRejectedArrays
     * @tc.desc      add: reject null, undefined, buffers, ordinary, floating and clamped arrays.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testArkTSUtilsAtomicsAddRejectedArrays', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      verifyRejectedArrays((array: ParameterArray, index: number, value: number): number => {
        return ArkTSUtils.Atomics.add(array, index, value);
      });

      // Explicit null/undefined calls keep the API name and argument positions visible.
      let parameterErrorThrown: boolean = false;
      try {
        ArkTSUtils.Atomics.add(
          null!,
          0,
          0
        );
      } catch (error) {
        parameterErrorThrown = true;
        const businessError: BusinessError = error as BusinessError;
        expect(businessError.code).assertEqual(401);
      }
      expect(parameterErrorThrown).assertTrue();
      expectAtomicBusinessError((): void => {
        ArkTSUtils.Atomics.add(
          undefined!,
          0,
          0
        );
      }, ATOMIC_PARAMETER_ERROR);
    });

    /**
     * @tc.number    SUB_ARKTSUTILS_ATOMICS_ADD_NUMBER_PARAMETERS_2100
     * @tc.name      testArkTSUtilsAtomicsAddNumberParameters
     * @tc.desc      add: verify finite, fractional, NaN, infinite and overflow number conversion.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testArkTSUtilsAtomicsAddNumberParameters', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      verifyNumberParameters((array: ParameterArray, index: number, value: number): number => {
        return ArkTSUtils.Atomics.add(array, index, value);
      }, [10, 4, 10, 4, 7, 7, 7, 10, 7, 7, 10, 8], false);

      // Explicit null/undefined calls keep the API name and argument positions visible.
      const explicitArray: collections.Int32Array = collections.Int32Array.of(7);
      explicitArray[0] = 7;
      expectAtomicBusinessError((): void => {
        ArkTSUtils.Atomics.add(
          explicitArray,
          0,
          (null as number | null) as number
        );
      }, ATOMIC_PARAMETER_ERROR);
      expect(explicitArray[0]).assertEqual(7);
      explicitArray[0] = 7;
      expectAtomicBusinessError((): void => {
        ArkTSUtils.Atomics.add(
          explicitArray,
          0,
          (undefined as number | undefined) as number
        );
      }, ATOMIC_PARAMETER_ERROR);
      expect(explicitArray[0]).assertEqual(7);
    });

    /**
     * @tc.number    SUB_ARKTSUTILS_ATOMICS_ADD_OFFSET_VIEW_2200
     * @tc.name      testArkTSUtilsAtomicsAddOffsetView
     * @tc.desc      add: honor byte offset, share aliased views and preserve prefix/suffix sentinels.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testArkTSUtilsAtomicsAddOffsetView', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const parent: collections.Int32Array = verifyOffsetView(
        (array: ParameterArray, index: number, value: number): number => {
          return ArkTSUtils.Atomics.add(array, index, value);
        }, 7, 10);
      expect(parent[1]).assertEqual(10);
      expect(parent[2]).assertEqual(10);
    });

    /**
     * @tc.number    SUB_ARKTSUTILS_ATOMICS_AND_INDEX_PARAMETERS_2300
     * @tc.name      testArkTSUtilsAtomicsAndIndexParameters
     * @tc.desc      and: first/last, ToIndex conversion, empty and invalid indices preserve other elements.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testArkTSUtilsAtomicsAndIndexParameters', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      verifyIndexParameters((array: ParameterArray, index: number, value: number): number => {
        return ArkTSUtils.Atomics.and(array, index, value);
      }, 7, 3);

      // Explicit null/undefined calls keep the API name and argument positions visible.
      const explicitArray: collections.Int32Array = collections.Int32Array.of(7);
      explicitArray[0] = 7;
      expectAtomicBusinessError((): void => {
        ArkTSUtils.Atomics.and(
          explicitArray,
          (null as number | null) as number,
          3
        );
      }, ATOMIC_PARAMETER_ERROR);
      expect(explicitArray[0]).assertEqual(7);
      explicitArray[0] = 7;
      expectAtomicBusinessError((): void => {
        ArkTSUtils.Atomics.and(
          explicitArray,
          (undefined as number | undefined) as number,
          3
        );
      }, ATOMIC_PARAMETER_ERROR);
      expect(explicitArray[0]).assertEqual(7);
    });

    /**
     * @tc.number    SUB_ARKTSUTILS_ATOMICS_AND_REJECTED_ARRAYS_2400
     * @tc.name      testArkTSUtilsAtomicsAndRejectedArrays
     * @tc.desc      and: reject null, undefined, buffers, ordinary, floating and clamped arrays.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testArkTSUtilsAtomicsAndRejectedArrays', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      verifyRejectedArrays((array: ParameterArray, index: number, value: number): number => {
        return ArkTSUtils.Atomics.and(array, index, value);
      });

      // Explicit null/undefined calls keep the API name and argument positions visible.
      let parameterErrorThrown: boolean = false;
      try {
        ArkTSUtils.Atomics.and(
          null!,
          0,
          0
        );
      } catch (error) {
        parameterErrorThrown = true;
        const businessError: BusinessError = error as BusinessError;
        expect(businessError.code).assertEqual(401);
      }
      expect(parameterErrorThrown).assertTrue();
      expectAtomicBusinessError((): void => {
        ArkTSUtils.Atomics.and(
          undefined!,
          0,
          0
        );
      }, ATOMIC_PARAMETER_ERROR);
    });

    /**
     * @tc.number    SUB_ARKTSUTILS_ATOMICS_AND_NUMBER_PARAMETERS_2500
     * @tc.name      testArkTSUtilsAtomicsAndNumberParameters
     * @tc.desc      and: verify finite, fractional, NaN, infinite and overflow number conversion.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testArkTSUtilsAtomicsAndNumberParameters', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      verifyNumberParameters((array: ParameterArray, index: number, value: number): number => {
        return ArkTSUtils.Atomics.and(array, index, value);
      }, [3, 5, 3, 5, 0, 0, 0, 3, 0, 0, 3, 1], false);

      // Explicit null/undefined calls keep the API name and argument positions visible.
      const explicitArray: collections.Int32Array = collections.Int32Array.of(7);
      explicitArray[0] = 7;
      expectAtomicBusinessError((): void => {
        ArkTSUtils.Atomics.and(
          explicitArray,
          0,
          (null as number | null) as number
        );
      }, ATOMIC_PARAMETER_ERROR);
      expect(explicitArray[0]).assertEqual(7);
      explicitArray[0] = 7;
      expectAtomicBusinessError((): void => {
        ArkTSUtils.Atomics.and(
          explicitArray,
          0,
          (undefined as number | undefined) as number
        );
      }, ATOMIC_PARAMETER_ERROR);
      expect(explicitArray[0]).assertEqual(7);
    });

    /**
     * @tc.number    SUB_ARKTSUTILS_ATOMICS_AND_OFFSET_VIEW_2600
     * @tc.name      testArkTSUtilsAtomicsAndOffsetView
     * @tc.desc      and: honor byte offset, share aliased views and preserve prefix/suffix sentinels.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testArkTSUtilsAtomicsAndOffsetView', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const parent: collections.Int32Array = verifyOffsetView(
        (array: ParameterArray, index: number, value: number): number => {
          return ArkTSUtils.Atomics.and(array, index, value);
        }, 7, 3);
      expect(parent[1]).assertEqual(3);
      expect(parent[2]).assertEqual(3);
    });

    /**
     * @tc.number    SUB_ARKTSUTILS_ATOMICS_COMPARE_EXCHANGE_INDEX_PARAMETERS_2700
     * @tc.name      testArkTSUtilsAtomicsCompareExchangeIndexParameters
     * @tc.desc      compareExchange: first/last, ToIndex conversion, empty and invalid indices preserve other elements.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testArkTSUtilsAtomicsCompareExchangeIndexParameters',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
        verifyIndexParameters((array: ParameterArray, index: number, value: number): number => {
          return ArkTSUtils.Atomics.compareExchange(array, index, 7, value);
        }, 7, 3);

        // Explicit null/undefined calls keep the API name and argument positions visible.
        const explicitArray: collections.Int32Array = collections.Int32Array.of(7);
        explicitArray[0] = 7;
        expectAtomicBusinessError((): void => {
          ArkTSUtils.Atomics.compareExchange(
            explicitArray,
            (null as number | null) as number,
            7,
            3
          );
        }, ATOMIC_PARAMETER_ERROR);
        expect(explicitArray[0]).assertEqual(7);
        explicitArray[0] = 7;
        expectAtomicBusinessError((): void => {
          ArkTSUtils.Atomics.compareExchange(
            explicitArray,
            (undefined as number | undefined) as number,
            7,
            3
          );
        }, ATOMIC_PARAMETER_ERROR);
        expect(explicitArray[0]).assertEqual(7);
      });

    /**
     * @tc.number    SUB_ARKTSUTILS_ATOMICS_COMPARE_EXCHANGE_REJECTED_ARRAYS_2800
     * @tc.name      testArkTSUtilsAtomicsCompareExchangeRejectedArrays
     * @tc.desc      compareExchange: reject null, undefined, buffers, ordinary, floating and clamped arrays.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testArkTSUtilsAtomicsCompareExchangeRejectedArrays',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
        verifyRejectedArrays((array: ParameterArray, index: number, value: number): number => {
          return ArkTSUtils.Atomics.compareExchange(array, index, 7, value);
        });

        // Explicit null/undefined calls keep the API name and argument positions visible.
        let parameterErrorThrown: boolean = false;
        try {
          ArkTSUtils.Atomics.compareExchange(
            null!,
            0,
            0,
            0
          );
        } catch (error) {
          parameterErrorThrown = true;
          const businessError: BusinessError = error as BusinessError;
          expect(businessError.code).assertEqual(401);
        }
        expect(parameterErrorThrown).assertTrue();
        expectAtomicBusinessError((): void => {
          ArkTSUtils.Atomics.compareExchange(
            undefined!,
            0,
            0,
            0
          );
        }, ATOMIC_PARAMETER_ERROR);
      });

    /**
     * @tc.number    SUB_ARKTSUTILS_ATOMICS_COMPARE_EXCHANGE_NUMBER_PARAMETERS_2900
     * @tc.name      testArkTSUtilsAtomicsCompareExchangeNumberParameters
     * @tc.desc      compareExchange: verify finite, fractional, NaN, infinite and overflow number conversion.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testArkTSUtilsAtomicsCompareExchangeNumberParameters',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
        verifyNumberParameters((array: ParameterArray, index: number, value: number): number => {
          return ArkTSUtils.Atomics.compareExchange(array, index, 7, value);
        }, [3, -3, 3, -3, 0, 0, 0, 3, 0, 0, 3, 1], false);

        // Explicit null/undefined calls keep the API name and argument positions visible.
        const explicitArray: collections.Int32Array = collections.Int32Array.of(7);
        explicitArray[0] = 7;
        expectAtomicBusinessError((): void => {
          ArkTSUtils.Atomics.compareExchange(
            explicitArray,
            0,
            7,
            (null as number | null) as number
          );
        }, ATOMIC_PARAMETER_ERROR);
        expect(explicitArray[0]).assertEqual(7);
        explicitArray[0] = 7;
        expectAtomicBusinessError((): void => {
          ArkTSUtils.Atomics.compareExchange(
            explicitArray,
            0,
            7,
            (undefined as number | undefined) as number
          );
        }, ATOMIC_PARAMETER_ERROR);
        expect(explicitArray[0]).assertEqual(7);
      });

    /**
     * @tc.number    SUB_ARKTSUTILS_ATOMICS_COMPARE_EXCHANGE_OFFSET_VIEW_3000
     * @tc.name      testArkTSUtilsAtomicsCompareExchangeOffsetView
     * @tc.desc      compareExchange: honor byte offset, share aliased views and preserve prefix/suffix sentinels.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testArkTSUtilsAtomicsCompareExchangeOffsetView',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
        const parent: collections.Int32Array = verifyOffsetView(
          (array: ParameterArray, index: number, value: number): number => {
            return ArkTSUtils.Atomics.compareExchange(array, index, 7, value);
          }, 7, 3);
        expect(parent[1]).assertEqual(3);
        expect(parent[2]).assertEqual(3);
      });

    /**
     * @tc.number    SUB_ARKTSUTILS_ATOMICS_EXCHANGE_INDEX_PARAMETERS_3100
     * @tc.name      testArkTSUtilsAtomicsExchangeIndexParameters
     * @tc.desc      exchange: first/last, ToIndex conversion, empty and invalid indices preserve other elements.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testArkTSUtilsAtomicsExchangeIndexParameters', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      verifyIndexParameters((array: ParameterArray, index: number, value: number): number => {
        return ArkTSUtils.Atomics.exchange(array, index, value);
      }, 7, 3);

      // Explicit null/undefined calls keep the API name and argument positions visible.
      const explicitArray: collections.Int32Array = collections.Int32Array.of(7);
      explicitArray[0] = 7;
      expectAtomicBusinessError((): void => {
        ArkTSUtils.Atomics.exchange(
          explicitArray,
          (null as number | null) as number,
          3
        );
      }, ATOMIC_PARAMETER_ERROR);
      expect(explicitArray[0]).assertEqual(7);
      explicitArray[0] = 7;
      expectAtomicBusinessError((): void => {
        ArkTSUtils.Atomics.exchange(
          explicitArray,
          (undefined as number | undefined) as number,
          3
        );
      }, ATOMIC_PARAMETER_ERROR);
      expect(explicitArray[0]).assertEqual(7);
    });

    /**
     * @tc.number    SUB_ARKTSUTILS_ATOMICS_EXCHANGE_REJECTED_ARRAYS_3200
     * @tc.name      testArkTSUtilsAtomicsExchangeRejectedArrays
     * @tc.desc      exchange: reject null, undefined, buffers, ordinary, floating and clamped arrays.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testArkTSUtilsAtomicsExchangeRejectedArrays', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      verifyRejectedArrays((array: ParameterArray, index: number, value: number): number => {
        return ArkTSUtils.Atomics.exchange(array, index, value);
      });

      // Explicit null/undefined calls keep the API name and argument positions visible.
      let parameterErrorThrown: boolean = false;
      try {
        ArkTSUtils.Atomics.exchange(
          null!,
          0,
          0
        );
      } catch (error) {
        parameterErrorThrown = true;
        const businessError: BusinessError = error as BusinessError;
        expect(businessError.code).assertEqual(401);
      }
      expect(parameterErrorThrown).assertTrue();
      expectAtomicBusinessError((): void => {
        ArkTSUtils.Atomics.exchange(
          undefined!,
          0,
          0
        );
      }, ATOMIC_PARAMETER_ERROR);
    });

    /**
     * @tc.number    SUB_ARKTSUTILS_ATOMICS_EXCHANGE_NUMBER_PARAMETERS_3300
     * @tc.name      testArkTSUtilsAtomicsExchangeNumberParameters
     * @tc.desc      exchange: verify finite, fractional, NaN, infinite and overflow number conversion.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testArkTSUtilsAtomicsExchangeNumberParameters',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
        verifyNumberParameters((array: ParameterArray, index: number, value: number): number => {
          return ArkTSUtils.Atomics.exchange(array, index, value);
        }, [3, -3, 3, -3, 0, 0, 0, 3, 0, 0, 3, 1], false);

        // Explicit null/undefined calls keep the API name and argument positions visible.
        const explicitArray: collections.Int32Array = collections.Int32Array.of(7);
        explicitArray[0] = 7;
        expectAtomicBusinessError((): void => {
          ArkTSUtils.Atomics.exchange(
            explicitArray,
            0,
            (null as number | null) as number
          );
        }, ATOMIC_PARAMETER_ERROR);
        expect(explicitArray[0]).assertEqual(7);
        explicitArray[0] = 7;
        expectAtomicBusinessError((): void => {
          ArkTSUtils.Atomics.exchange(
            explicitArray,
            0,
            (undefined as number | undefined) as number
          );
        }, ATOMIC_PARAMETER_ERROR);
        expect(explicitArray[0]).assertEqual(7);
      });

    /**
     * @tc.number    SUB_ARKTSUTILS_ATOMICS_EXCHANGE_OFFSET_VIEW_3400
     * @tc.name      testArkTSUtilsAtomicsExchangeOffsetView
     * @tc.desc      exchange: honor byte offset, share aliased views and preserve prefix/suffix sentinels.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testArkTSUtilsAtomicsExchangeOffsetView', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const parent: collections.Int32Array = verifyOffsetView(
        (array: ParameterArray, index: number, value: number): number => {
          return ArkTSUtils.Atomics.exchange(array, index, value);
        }, 7, 3);
      expect(parent[1]).assertEqual(3);
      expect(parent[2]).assertEqual(3);
    });

    /**
     * @tc.number    SUB_ARKTSUTILS_ATOMICS_LOAD_INDEX_PARAMETERS_3500
     * @tc.name      testArkTSUtilsAtomicsLoadIndexParameters
     * @tc.desc      load: first/last, ToIndex conversion, empty and invalid indices preserve other elements.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testArkTSUtilsAtomicsLoadIndexParameters', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      verifyIndexParameters((array: ParameterArray, index: number, value: number): number => {
        return ArkTSUtils.Atomics.load(array, index);
      }, 7, 7);

      // Explicit null/undefined calls keep the API name and argument positions visible.
      const explicitArray: collections.Int32Array = collections.Int32Array.of(7);
      explicitArray[0] = 7;
      expectAtomicBusinessError((): void => {
        ArkTSUtils.Atomics.load(
          explicitArray,
          (null as number | null) as number
        );
      }, ATOMIC_PARAMETER_ERROR);
      expect(explicitArray[0]).assertEqual(7);
      explicitArray[0] = 7;
      expectAtomicBusinessError((): void => {
        ArkTSUtils.Atomics.load(
          explicitArray,
          (undefined as number | undefined) as number
        );
      }, ATOMIC_PARAMETER_ERROR);
      expect(explicitArray[0]).assertEqual(7);
    });

    /**
     * @tc.number    SUB_ARKTSUTILS_ATOMICS_LOAD_REJECTED_ARRAYS_3600
     * @tc.name      testArkTSUtilsAtomicsLoadRejectedArrays
     * @tc.desc      load: reject null, undefined, buffers, ordinary, floating and clamped arrays.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testArkTSUtilsAtomicsLoadRejectedArrays', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      verifyRejectedArrays((array: ParameterArray, index: number, value: number): number => {
        return ArkTSUtils.Atomics.load(array, index);
      });

      // Explicit null/undefined calls keep the API name and argument positions visible.
      let parameterErrorThrown: boolean = false;
      try {
        ArkTSUtils.Atomics.load(
          null!,
          0
        );
      } catch (error) {
        parameterErrorThrown = true;
        const businessError: BusinessError = error as BusinessError;
        expect(businessError.code).assertEqual(401);
      }
      expect(parameterErrorThrown).assertTrue();
      expectAtomicBusinessError((): void => {
        ArkTSUtils.Atomics.load(
          undefined!,
          0
        );
      }, ATOMIC_PARAMETER_ERROR);
    });

    /**
     * @tc.number    SUB_ARKTSUTILS_ATOMICS_LOAD_NUMBER_PARAMETERS_3700
     * @tc.name      testArkTSUtilsAtomicsLoadNumberParameters
     * @tc.desc      load: convert numeric indices and reject non-number indices with code 401.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testArkTSUtilsAtomicsLoadNumberParameters', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      verifyIndexParameters((array: ParameterArray, index: number, value: number): number => {
        return ArkTSUtils.Atomics.load(array, index);
      }, 7, 7);
      const array: collections.Int32Array = collections.Int32Array.of(7);
      expectAtomicBusinessError((): void => {
        ArkTSUtils.Atomics.load(array, (null as number | null) as number);
      }, ATOMIC_PARAMETER_ERROR);
      expectAtomicBusinessError((): void => {
        ArkTSUtils.Atomics.load(array, (undefined as number | undefined) as number);
      }, ATOMIC_PARAMETER_ERROR);
      expect(ArkTSUtils.Atomics.load(array, 0)).assertEqual(7);
    });

    /**
     * @tc.number    SUB_ARKTSUTILS_ATOMICS_LOAD_OFFSET_VIEW_3800
     * @tc.name      testArkTSUtilsAtomicsLoadOffsetView
     * @tc.desc      load: honor byte offset, share aliased views and preserve prefix/suffix sentinels.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testArkTSUtilsAtomicsLoadOffsetView', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const parent: collections.Int32Array = verifyOffsetView(
        (array: ParameterArray, index: number, value: number): number => {
          return ArkTSUtils.Atomics.load(array, index);
        }, 7, 7);
      expect(parent[1]).assertEqual(7);
      expect(parent[2]).assertEqual(7);
    });

    /**
     * @tc.number    SUB_ARKTSUTILS_ATOMICS_OR_INDEX_PARAMETERS_3900
     * @tc.name      testArkTSUtilsAtomicsOrIndexParameters
     * @tc.desc      or: first/last, ToIndex conversion, empty and invalid indices preserve other elements.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testArkTSUtilsAtomicsOrIndexParameters', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      verifyIndexParameters((array: ParameterArray, index: number, value: number): number => {
        return ArkTSUtils.Atomics.or(array, index, value);
      }, 7, 7);

      // Explicit null/undefined calls keep the API name and argument positions visible.
      const explicitArray: collections.Int32Array = collections.Int32Array.of(7);
      explicitArray[0] = 7;
      expectAtomicBusinessError((): void => {
        ArkTSUtils.Atomics.or(
          explicitArray,
          (null as number | null) as number,
          3
        );
      }, ATOMIC_PARAMETER_ERROR);
      expect(explicitArray[0]).assertEqual(7);
      explicitArray[0] = 7;
      expectAtomicBusinessError((): void => {
        ArkTSUtils.Atomics.or(
          explicitArray,
          (undefined as number | undefined) as number,
          3
        );
      }, ATOMIC_PARAMETER_ERROR);
      expect(explicitArray[0]).assertEqual(7);
    });

    /**
     * @tc.number    SUB_ARKTSUTILS_ATOMICS_OR_REJECTED_ARRAYS_4000
     * @tc.name      testArkTSUtilsAtomicsOrRejectedArrays
     * @tc.desc      or: reject null, undefined, buffers, ordinary, floating and clamped arrays.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testArkTSUtilsAtomicsOrRejectedArrays', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      verifyRejectedArrays((array: ParameterArray, index: number, value: number): number => {
        return ArkTSUtils.Atomics.or(array, index, value);
      });

      // Explicit null/undefined calls keep the API name and argument positions visible.
      let parameterErrorThrown: boolean = false;
      try {
        ArkTSUtils.Atomics.or(
          null!,
          0,
          0
        );
      } catch (error) {
        parameterErrorThrown = true;
        const businessError: BusinessError = error as BusinessError;
        expect(businessError.code).assertEqual(401);
      }
      expect(parameterErrorThrown).assertTrue();
      expectAtomicBusinessError((): void => {
        ArkTSUtils.Atomics.or(
          undefined!,
          0,
          0
        );
      }, ATOMIC_PARAMETER_ERROR);
    });

    /**
     * @tc.number    SUB_ARKTSUTILS_ATOMICS_OR_NUMBER_PARAMETERS_4100
     * @tc.name      testArkTSUtilsAtomicsOrNumberParameters
     * @tc.desc      or: verify finite, fractional, NaN, infinite and overflow number conversion.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testArkTSUtilsAtomicsOrNumberParameters', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      verifyNumberParameters((array: ParameterArray, index: number, value: number): number => {
        return ArkTSUtils.Atomics.or(array, index, value);
      }, [7, -1, 7, -1, 7, 7, 7, 7, 7, 7, 7, 7], false);

      // Explicit null/undefined calls keep the API name and argument positions visible.
      const explicitArray: collections.Int32Array = collections.Int32Array.of(7);
      explicitArray[0] = 7;
      expectAtomicBusinessError((): void => {
        ArkTSUtils.Atomics.or(
          explicitArray,
          0,
          (null as number | null) as number
        );
      }, ATOMIC_PARAMETER_ERROR);
      expect(explicitArray[0]).assertEqual(7);
      explicitArray[0] = 7;
      expectAtomicBusinessError((): void => {
        ArkTSUtils.Atomics.or(
          explicitArray,
          0,
          (undefined as number | undefined) as number
        );
      }, ATOMIC_PARAMETER_ERROR);
      expect(explicitArray[0]).assertEqual(7);
    });

    /**
     * @tc.number    SUB_ARKTSUTILS_ATOMICS_OR_OFFSET_VIEW_4200
     * @tc.name      testArkTSUtilsAtomicsOrOffsetView
     * @tc.desc      or: honor byte offset, share aliased views and preserve prefix/suffix sentinels.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testArkTSUtilsAtomicsOrOffsetView', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const parent: collections.Int32Array = verifyOffsetView(
        (array: ParameterArray, index: number, value: number): number => {
          return ArkTSUtils.Atomics.or(array, index, value);
        }, 7, 7);
      expect(parent[1]).assertEqual(7);
      expect(parent[2]).assertEqual(7);
    });

    /**
     * @tc.number    SUB_ARKTSUTILS_ATOMICS_STORE_INDEX_PARAMETERS_4300
     * @tc.name      testArkTSUtilsAtomicsStoreIndexParameters
     * @tc.desc      store: first/last, ToIndex conversion, empty and invalid indices preserve other elements.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testArkTSUtilsAtomicsStoreIndexParameters', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      verifyIndexParameters((array: ParameterArray, index: number, value: number): number => {
        return ArkTSUtils.Atomics.store(array, index, value);
      }, 3, 3);

      // Explicit null/undefined calls keep the API name and argument positions visible.
      const explicitArray: collections.Int32Array = collections.Int32Array.of(7);
      explicitArray[0] = 7;
      expectAtomicBusinessError((): void => {
        ArkTSUtils.Atomics.store(
          explicitArray,
          (null as number | null) as number,
          3
        );
      }, ATOMIC_PARAMETER_ERROR);
      expect(explicitArray[0]).assertEqual(7);
      explicitArray[0] = 7;
      expectAtomicBusinessError((): void => {
        ArkTSUtils.Atomics.store(
          explicitArray,
          (undefined as number | undefined) as number,
          3
        );
      }, ATOMIC_PARAMETER_ERROR);
      expect(explicitArray[0]).assertEqual(7);
    });

    /**
     * @tc.number    SUB_ARKTSUTILS_ATOMICS_STORE_REJECTED_ARRAYS_4400
     * @tc.name      testArkTSUtilsAtomicsStoreRejectedArrays
     * @tc.desc      store: reject null, undefined, buffers, ordinary, floating and clamped arrays.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testArkTSUtilsAtomicsStoreRejectedArrays', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      verifyRejectedArrays((array: ParameterArray, index: number, value: number): number => {
        return ArkTSUtils.Atomics.store(array, index, value);
      });

      // Explicit null/undefined calls keep the API name and argument positions visible.
      let parameterErrorThrown: boolean = false;
      try {
        ArkTSUtils.Atomics.store(
          null!,
          0,
          0
        );
      } catch (error) {
        parameterErrorThrown = true;
        const businessError: BusinessError = error as BusinessError;
        expect(businessError.code).assertEqual(401);
      }
      expect(parameterErrorThrown).assertTrue();
      expectAtomicBusinessError((): void => {
        ArkTSUtils.Atomics.store(
          undefined!,
          0,
          0
        );
      }, ATOMIC_PARAMETER_ERROR);
    });

    /**
     * @tc.number    SUB_ARKTSUTILS_ATOMICS_STORE_NUMBER_PARAMETERS_4500
     * @tc.name      testArkTSUtilsAtomicsStoreNumberParameters
     * @tc.desc      store: verify finite, fractional, NaN, infinite and overflow number conversion.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testArkTSUtilsAtomicsStoreNumberParameters', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      verifyNumberParameters((array: ParameterArray, index: number, value: number): number => {
        return ArkTSUtils.Atomics.store(array, index, value);
      }, [3, -3, 3, -3, 0, 0, 0, 3, 0, 0, 3, 1], true);

      // Explicit null/undefined calls keep the API name and argument positions visible.
      const explicitArray: collections.Int32Array = collections.Int32Array.of(7);
      explicitArray[0] = 7;
      expectAtomicBusinessError((): void => {
        ArkTSUtils.Atomics.store(
          explicitArray,
          0,
          (null as number | null) as number
        );
      }, ATOMIC_PARAMETER_ERROR);
      expect(explicitArray[0]).assertEqual(7);
      explicitArray[0] = 7;
      expectAtomicBusinessError((): void => {
        ArkTSUtils.Atomics.store(
          explicitArray,
          0,
          (undefined as number | undefined) as number
        );
      }, ATOMIC_PARAMETER_ERROR);
      expect(explicitArray[0]).assertEqual(7);
    });

    /**
     * @tc.number    SUB_ARKTSUTILS_ATOMICS_STORE_OFFSET_VIEW_4600
     * @tc.name      testArkTSUtilsAtomicsStoreOffsetView
     * @tc.desc      store: honor byte offset, share aliased views and preserve prefix/suffix sentinels.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testArkTSUtilsAtomicsStoreOffsetView', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const parent: collections.Int32Array = verifyOffsetView(
        (array: ParameterArray, index: number, value: number): number => {
          return ArkTSUtils.Atomics.store(array, index, value);
        }, 3, 3);
      expect(parent[1]).assertEqual(3);
      expect(parent[2]).assertEqual(3);
    });

    /**
     * @tc.number    SUB_ARKTSUTILS_ATOMICS_SUB_INDEX_PARAMETERS_4700
     * @tc.name      testArkTSUtilsAtomicsSubIndexParameters
     * @tc.desc      sub: first/last, ToIndex conversion, empty and invalid indices preserve other elements.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testArkTSUtilsAtomicsSubIndexParameters', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      verifyIndexParameters((array: ParameterArray, index: number, value: number): number => {
        return ArkTSUtils.Atomics.sub(array, index, value);
      }, 7, 4);

      // Explicit null/undefined calls keep the API name and argument positions visible.
      const explicitArray: collections.Int32Array = collections.Int32Array.of(7);
      explicitArray[0] = 7;
      expectAtomicBusinessError((): void => {
        ArkTSUtils.Atomics.sub(
          explicitArray,
          (null as number | null) as number,
          3
        );
      }, ATOMIC_PARAMETER_ERROR);
      expect(explicitArray[0]).assertEqual(7);
      explicitArray[0] = 7;
      expectAtomicBusinessError((): void => {
        ArkTSUtils.Atomics.sub(
          explicitArray,
          (undefined as number | undefined) as number,
          3
        );
      }, ATOMIC_PARAMETER_ERROR);
      expect(explicitArray[0]).assertEqual(7);
    });

    /**
     * @tc.number    SUB_ARKTSUTILS_ATOMICS_SUB_REJECTED_ARRAYS_4800
     * @tc.name      testArkTSUtilsAtomicsSubRejectedArrays
     * @tc.desc      sub: reject null, undefined, buffers, ordinary, floating and clamped arrays.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testArkTSUtilsAtomicsSubRejectedArrays', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      verifyRejectedArrays((array: ParameterArray, index: number, value: number): number => {
        return ArkTSUtils.Atomics.sub(array, index, value);
      });

      // Explicit null/undefined calls keep the API name and argument positions visible.
      let parameterErrorThrown: boolean = false;
      try {
        ArkTSUtils.Atomics.sub(
          null!,
          0,
          0
        );
      } catch (error) {
        parameterErrorThrown = true;
        const businessError: BusinessError = error as BusinessError;
        expect(businessError.code).assertEqual(401);
      }
      expect(parameterErrorThrown).assertTrue();
      expectAtomicBusinessError((): void => {
        ArkTSUtils.Atomics.sub(
          undefined!,
          0,
          0
        );
      }, ATOMIC_PARAMETER_ERROR);
    });

    /**
     * @tc.number    SUB_ARKTSUTILS_ATOMICS_SUB_NUMBER_PARAMETERS_4900
     * @tc.name      testArkTSUtilsAtomicsSubNumberParameters
     * @tc.desc      sub: verify finite, fractional, NaN, infinite and overflow number conversion.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testArkTSUtilsAtomicsSubNumberParameters', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      verifyNumberParameters((array: ParameterArray, index: number, value: number): number => {
        return ArkTSUtils.Atomics.sub(array, index, value);
      }, [4, 10, 4, 10, 7, 7, 7, 4, 7, 7, 4, 6], false);

      // Explicit null/undefined calls keep the API name and argument positions visible.
      const explicitArray: collections.Int32Array = collections.Int32Array.of(7);
      explicitArray[0] = 7;
      expectAtomicBusinessError((): void => {
        ArkTSUtils.Atomics.sub(
          explicitArray,
          0,
          (null as number | null) as number
        );
      }, ATOMIC_PARAMETER_ERROR);
      expect(explicitArray[0]).assertEqual(7);
      explicitArray[0] = 7;
      expectAtomicBusinessError((): void => {
        ArkTSUtils.Atomics.sub(
          explicitArray,
          0,
          (undefined as number | undefined) as number
        );
      }, ATOMIC_PARAMETER_ERROR);
      expect(explicitArray[0]).assertEqual(7);
    });

    /**
     * @tc.number    SUB_ARKTSUTILS_ATOMICS_SUB_OFFSET_VIEW_5000
     * @tc.name      testArkTSUtilsAtomicsSubOffsetView
     * @tc.desc      sub: honor byte offset, share aliased views and preserve prefix/suffix sentinels.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testArkTSUtilsAtomicsSubOffsetView', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const parent: collections.Int32Array = verifyOffsetView(
        (array: ParameterArray, index: number, value: number): number => {
          return ArkTSUtils.Atomics.sub(array, index, value);
        }, 7, 4);
      expect(parent[1]).assertEqual(4);
      expect(parent[2]).assertEqual(4);
    });

    /**
     * @tc.number    SUB_ARKTSUTILS_ATOMICS_XOR_INDEX_PARAMETERS_5100
     * @tc.name      testArkTSUtilsAtomicsXorIndexParameters
     * @tc.desc      xor: first/last, ToIndex conversion, empty and invalid indices preserve other elements.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testArkTSUtilsAtomicsXorIndexParameters', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      verifyIndexParameters((array: ParameterArray, index: number, value: number): number => {
        return ArkTSUtils.Atomics.xor(array, index, value);
      }, 7, 4);

      // Explicit null/undefined calls keep the API name and argument positions visible.
      const explicitArray: collections.Int32Array = collections.Int32Array.of(7);
      explicitArray[0] = 7;
      expectAtomicBusinessError((): void => {
        ArkTSUtils.Atomics.xor(
          explicitArray,
          (null as number | null) as number,
          3
        );
      }, ATOMIC_PARAMETER_ERROR);
      expect(explicitArray[0]).assertEqual(7);
      explicitArray[0] = 7;
      expectAtomicBusinessError((): void => {
        ArkTSUtils.Atomics.xor(
          explicitArray,
          (undefined as number | undefined) as number,
          3
        );
      }, ATOMIC_PARAMETER_ERROR);
      expect(explicitArray[0]).assertEqual(7);
    });

    /**
     * @tc.number    SUB_ARKTSUTILS_ATOMICS_XOR_REJECTED_ARRAYS_5200
     * @tc.name      testArkTSUtilsAtomicsXorRejectedArrays
     * @tc.desc      xor: reject null, undefined, buffers, ordinary, floating and clamped arrays.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testArkTSUtilsAtomicsXorRejectedArrays', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      verifyRejectedArrays((array: ParameterArray, index: number, value: number): number => {
        return ArkTSUtils.Atomics.xor(array, index, value);
      });

      // Explicit null/undefined calls keep the API name and argument positions visible.
      let parameterErrorThrown: boolean = false;
      try {
        ArkTSUtils.Atomics.xor(
          null!,
          0,
          0
        );
      } catch (error) {
        parameterErrorThrown = true;
        const businessError: BusinessError = error as BusinessError;
        expect(businessError.code).assertEqual(401);
      }
      expect(parameterErrorThrown).assertTrue();
      expectAtomicBusinessError((): void => {
        ArkTSUtils.Atomics.xor(
          undefined!,
          0,
          0
        );
      }, ATOMIC_PARAMETER_ERROR);
    });

    /**
     * @tc.number    SUB_ARKTSUTILS_ATOMICS_XOR_NUMBER_PARAMETERS_5300
     * @tc.name      testArkTSUtilsAtomicsXorNumberParameters
     * @tc.desc      xor: verify finite, fractional, NaN, infinite and overflow number conversion.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testArkTSUtilsAtomicsXorNumberParameters', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      verifyNumberParameters((array: ParameterArray, index: number, value: number): number => {
        return ArkTSUtils.Atomics.xor(array, index, value);
      }, [4, -6, 4, -6, 7, 7, 7, 4, 7, 7, 4, 6], false);

      // Explicit null/undefined calls keep the API name and argument positions visible.
      const explicitArray: collections.Int32Array = collections.Int32Array.of(7);
      explicitArray[0] = 7;
      expectAtomicBusinessError((): void => {
        ArkTSUtils.Atomics.xor(
          explicitArray,
          0,
          (null as number | null) as number
        );
      }, ATOMIC_PARAMETER_ERROR);
      expect(explicitArray[0]).assertEqual(7);
      explicitArray[0] = 7;
      expectAtomicBusinessError((): void => {
        ArkTSUtils.Atomics.xor(
          explicitArray,
          0,
          (undefined as number | undefined) as number
        );
      }, ATOMIC_PARAMETER_ERROR);
      expect(explicitArray[0]).assertEqual(7);
    });

    /**
     * @tc.number    SUB_ARKTSUTILS_ATOMICS_XOR_OFFSET_VIEW_5400
     * @tc.name      testArkTSUtilsAtomicsXorOffsetView
     * @tc.desc      xor: honor byte offset, share aliased views and preserve prefix/suffix sentinels.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testArkTSUtilsAtomicsXorOffsetView', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const parent: collections.Int32Array = verifyOffsetView(
        (array: ParameterArray, index: number, value: number): number => {
          return ArkTSUtils.Atomics.xor(array, index, value);
        }, 7, 4);
      expect(parent[1]).assertEqual(4);
      expect(parent[2]).assertEqual(4);
    });

    /**
     * @tc.number    SUB_ARKTSUTILS_ATOMICS_INT8_ARRAY_WIDTH_PARAMETERS_5500
     * @tc.name      testArkTSUtilsAtomicsInt8ArrayWidthParameters
     * @tc.desc      All numeric operations honor Int8Array signedness, width and modulo conversion.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testArkTSUtilsAtomicsInt8ArrayWidthParameters',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
        const array: collections.Int8Array = new collections.Int8Array(1);
        verifyIntegerWidth(array, 127, -128, 256);
        expect(ArkTSUtils.Atomics.load(array, 0)).assertEqual(2);
      });

    /**
     * @tc.number    SUB_ARKTSUTILS_ATOMICS_UINT8_ARRAY_WIDTH_PARAMETERS_5600
     * @tc.name      testArkTSUtilsAtomicsUint8ArrayWidthParameters
     * @tc.desc      All numeric operations honor Uint8Array signedness, width and modulo conversion.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testArkTSUtilsAtomicsUint8ArrayWidthParameters',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
        const array: collections.Uint8Array = new collections.Uint8Array(1);
        verifyIntegerWidth(array, 255, 0, 256);
        expect(ArkTSUtils.Atomics.load(array, 0)).assertEqual(2);
      });

    /**
     * @tc.number    SUB_ARKTSUTILS_ATOMICS_INT16_ARRAY_WIDTH_PARAMETERS_5700
     * @tc.name      testArkTSUtilsAtomicsInt16ArrayWidthParameters
     * @tc.desc      All numeric operations honor Int16Array signedness, width and modulo conversion.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testArkTSUtilsAtomicsInt16ArrayWidthParameters',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
        const array: collections.Int16Array = new collections.Int16Array(1);
        verifyIntegerWidth(array, 32767, -32768, 65536);
        expect(ArkTSUtils.Atomics.load(array, 0)).assertEqual(2);
      });

    /**
     * @tc.number    SUB_ARKTSUTILS_ATOMICS_UINT16_ARRAY_WIDTH_PARAMETERS_5800
     * @tc.name      testArkTSUtilsAtomicsUint16ArrayWidthParameters
     * @tc.desc      All numeric operations honor Uint16Array signedness, width and modulo conversion.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testArkTSUtilsAtomicsUint16ArrayWidthParameters',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
        const array: collections.Uint16Array = new collections.Uint16Array(1);
        verifyIntegerWidth(array, 65535, 0, 65536);
        expect(ArkTSUtils.Atomics.load(array, 0)).assertEqual(2);
      });

    /**
     * @tc.number    SUB_ARKTSUTILS_ATOMICS_INT32_ARRAY_WIDTH_PARAMETERS_5900
     * @tc.name      testArkTSUtilsAtomicsInt32ArrayWidthParameters
     * @tc.desc      All numeric operations honor Int32Array signedness, width and modulo conversion.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testArkTSUtilsAtomicsInt32ArrayWidthParameters',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
        const array: collections.Int32Array = new collections.Int32Array(1);
        verifyIntegerWidth(array, 2147483647, -2147483648, 4294967296);
        expect(ArkTSUtils.Atomics.load(array, 0)).assertEqual(2);
      });

    /**
     * @tc.number    SUB_ARKTSUTILS_ATOMICS_UINT32_ARRAY_WIDTH_PARAMETERS_6000
     * @tc.name      testArkTSUtilsAtomicsUint32ArrayWidthParameters
     * @tc.desc      All numeric operations honor Uint32Array signedness, width and modulo conversion.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testArkTSUtilsAtomicsUint32ArrayWidthParameters',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
        const array: collections.Uint32Array = new collections.Uint32Array(1);
        verifyIntegerWidth(array, 4294967295, 0, 4294967296);
        expect(ArkTSUtils.Atomics.load(array, 0)).assertEqual(2);
      });

    /**
     * @tc.number    SUB_ARKTSUTILS_ATOMICS_COMPARE_EXCHANGE_EXPECTED_CONVERSION_6100
     * @tc.name      testArkTSUtilsAtomicsCompareExchangeExpectedConversion
     * @tc.desc      Convert expected and replacement independently; mismatch must preserve the element.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testArkTSUtilsAtomicsCompareExchangeExpectedConversion',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
        const array: collections.Int32Array = collections.Int32Array.of(3);
        expect(ArkTSUtils.Atomics.compareExchange(array, 0, 3.9, -4.9)).assertEqual(3);
        expect(array[0]).assertEqual(-4);
        expect(ArkTSUtils.Atomics.compareExchange(array, 0, -4.9, 4294967298)).assertEqual(-4);
        expect(array[0]).assertEqual(2);
        expect(ArkTSUtils.Atomics.compareExchange(array, 0, NaN, 99)).assertEqual(2);
        expect(array[0]).assertEqual(2);
        const zeroExpected: number[] = [NaN, Infinity, -Infinity, 4294967296];
        for (let index: number = 0; index < zeroExpected.length; index++) {
          array[0] = 0;
          expect(ArkTSUtils.Atomics.compareExchange(array, 0, zeroExpected[index], 5)).assertEqual(0);
          expect(array[0]).assertEqual(5);
          expect(ArkTSUtils.Atomics.compareExchange(array, 0, zeroExpected[index], 9)).assertEqual(5);
          expect(array[0]).assertEqual(5);
        }

        // Explicit null/undefined calls keep the API name and argument positions visible.
        const explicitArray: collections.Int32Array = collections.Int32Array.of(0);
        explicitArray[0] = 0;
        expectAtomicBusinessError((): void => {
          ArkTSUtils.Atomics.compareExchange(
            explicitArray,
            0,
            (null as number | null) as number,
            5
          );
        }, ATOMIC_PARAMETER_ERROR);
        expect(explicitArray[0]).assertEqual(0);
        expectAtomicBusinessError((): void => {
          ArkTSUtils.Atomics.compareExchange(
            explicitArray,
            0,
            (null as number | null) as number,
            9
          );
        }, ATOMIC_PARAMETER_ERROR);
        expect(explicitArray[0]).assertEqual(0);
        explicitArray[0] = 0;
        expectAtomicBusinessError((): void => {
          ArkTSUtils.Atomics.compareExchange(
            explicitArray,
            0,
            (undefined as number | undefined) as number,
            5
          );
        }, ATOMIC_PARAMETER_ERROR);
        expect(explicitArray[0]).assertEqual(0);
        expectAtomicBusinessError((): void => {
          ArkTSUtils.Atomics.compareExchange(
            explicitArray,
            0,
            (undefined as number | undefined) as number,
            9
          );
        }, ATOMIC_PARAMETER_ERROR);
        expect(explicitArray[0]).assertEqual(0);
      });

    /**
     * @tc.number    SUB_ARKTSUTILS_ATOMICS_IS_LOCK_FREE_BYTE_SIZES_6200
     * @tc.name      testArkTSUtilsAtomicsIsLockFreeByteSizes
     * @tc.desc      Sizes 1, 2, 4 and 8 succeed; unsupported byte widths return false.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testArkTSUtilsAtomicsIsLockFreeByteSizes', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const supported: number[] = [1, 2, 4, 8];
      for (let index: number = 0; index < supported.length; index++) {
        expect(ArkTSUtils.Atomics.isLockFree(supported[index])).assertTrue();
      }
      const unsupported: number[] = [-8, -1, 0, 3, 5, 7, 9, 16];
      for (let index: number = 0; index < unsupported.length; index++) {
        expect(ArkTSUtils.Atomics.isLockFree(unsupported[index])).assertFalse();
      }
    });

    /**
     * @tc.number    SUB_ARKTSUTILS_ATOMICS_IS_LOCK_FREE_NUMBER_CONVERSION_6300
     * @tc.name      testArkTSUtilsAtomicsIsLockFreeNumberConversion
     * @tc.desc      Size accepts fractional and non-finite numbers and rejects non-number arguments with code 401.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testArkTSUtilsAtomicsIsLockFreeNumberConversion',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
        expect(ArkTSUtils.Atomics.isLockFree(1.9)).assertTrue();
        expect(ArkTSUtils.Atomics.isLockFree(4.9)).assertTrue();
        expect(ArkTSUtils.Atomics.isLockFree(4294967300)).assertTrue();
        expect(ArkTSUtils.Atomics.isLockFree(NaN)).assertFalse();
        expect(ArkTSUtils.Atomics.isLockFree(Infinity)).assertFalse();
        expect(ArkTSUtils.Atomics.isLockFree(-Infinity)).assertFalse();
        const values: (number | string | boolean | null | undefined)[] = ['4', true, false, null, undefined];
        for (let index: number = 0; index < values.length; index++) {
          expectAtomicBusinessError((): void => {
            ArkTSUtils.Atomics.isLockFree(values[index] as number);
          }, ATOMIC_PARAMETER_ERROR);
        }

        // Explicit null/undefined calls keep the API name and argument positions visible.
        expectAtomicBusinessError((): void => {
          ArkTSUtils.Atomics.isLockFree(
            (null as number | null) as number
          );
        }, ATOMIC_PARAMETER_ERROR);
        expectAtomicBusinessError((): void => {
          ArkTSUtils.Atomics.isLockFree(
            (undefined as number | undefined) as number
          );
        }, ATOMIC_PARAMETER_ERROR);
      });

  });
}
