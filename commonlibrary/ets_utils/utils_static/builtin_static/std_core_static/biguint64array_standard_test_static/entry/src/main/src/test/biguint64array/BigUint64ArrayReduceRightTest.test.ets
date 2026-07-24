'use static'


/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import {
  beforeAll,
  afterEach,
  beforeEach,
  afterAll,
  describe,
  it,
  expect,
  TestType,
  Size,
  Level
} from '../../../../hypium/index';
import Utils from './../Util.test';

class ReduceRightSummary {
  sum: bigint;
  count: int;

  constructor(sum: bigint, count: int) {
    this.sum = sum;
    this.count = count;
  }
}

class ReduceRightBoundarySummary {
  maxValue: bigint;
  minValue: bigint;

  constructor(maxValue: bigint, minValue: bigint) {
    this.maxValue = maxValue;
    this.minValue = minValue;
  }
}

function sumReducerForReduceRight(previousValue: bigint, currentValue: bigint,
  _currentIndex: int, _array: BigUint64Array): bigint {
  return previousValue + currentValue;
}

export default function biguint64arrayReduceRightTest(): void {

  describe('BigUint64ArrayReduceRightTest', (): void => {
    beforeAll(() => {
    });

    beforeEach(async () => {
      await Utils.msSleep(30);
    });

    afterEach(() => {
    });

    afterAll(() => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_REDUCE_RIGHT_0100
     * @tc.name testBigUint64ArrayReduceRight001
     * @tc.desc Verify reduceRight() with a bigint initial value sums all elements from right to left
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayReduceRight001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n]);
      let reducedValue = sourceArray.reduceRight<bigint>((previousValue: bigint, currentValue: bigint,
        _currentIndex: int, _array: BigUint64Array): bigint => {
        return previousValue + currentValue;
      }, 0n);
      expect(reducedValue).assertEqual(6n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_REDUCE_RIGHT_0200
     * @tc.name testBigUint64ArrayReduceRight002
     * @tc.desc Verify reduceRight() with a string initial value preserves right-to-left order
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayReduceRight002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([10n, 20n, 30n]);
      let reducedText = sourceArray.reduceRight<string>((previousValue: string, currentValue: bigint,
        _currentIndex: int, _array: BigUint64Array): string => {
        return previousValue + currentValue.toString();
      }, '');
      expect(reducedText).assertEqual('302010');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_REDUCE_RIGHT_0300
     * @tc.name testBigUint64ArrayReduceRight003
     * @tc.desc Verify reduceRight() with a number initial value can count callback calls
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayReduceRight003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([10n, 20n, 30n]);
      let callbackCount = sourceArray.reduceRight<number>((previousValue: number, _currentValue: bigint,
        _currentIndex: int, _array: BigUint64Array): number => {
        return previousValue + 1;
      }, 0);
      expect(callbackCount).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_REDUCE_RIGHT_0400
     * @tc.name testBigUint64ArrayReduceRight004
     * @tc.desc Verify reduceRight() with a boolean initial value supports logical AND failure
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayReduceRight004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([10n, 0n, 20n]);
      let allPositive = sourceArray.reduceRight<boolean>((previousValue: boolean, currentValue: bigint,
        _currentIndex: int, _array: BigUint64Array): boolean => {
        return previousValue && currentValue > 0n;
      }, true);
      expect(allPositive).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_REDUCE_RIGHT_0500
     * @tc.name testBigUint64ArrayReduceRight005
     * @tc.desc Verify reduceRight() with a class accumulator updates sum and count fields
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayReduceRight005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n]);
      let initialSummary = new ReduceRightSummary(0n, 0);
      let reducedSummary = sourceArray.reduceRight<ReduceRightSummary>((previousValue: ReduceRightSummary,
        currentValue: bigint, _currentIndex: int, _array: BigUint64Array): ReduceRightSummary => {
        return new ReduceRightSummary(previousValue.sum + currentValue, previousValue.count + 1);
      }, initialSummary);
      expect(reducedSummary.sum).assertEqual(6n);
      expect(reducedSummary.count).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_REDUCE_RIGHT_0600
     * @tc.name testBigUint64ArrayReduceRight006
     * @tc.desc Verify reduceRight() on an empty array returns the bigint initial value unchanged
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayReduceRight006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array(0);
      let callCount: int = 0;
      let reducedValue = sourceArray.reduceRight<bigint>((previousValue: bigint, currentValue: bigint,
        _currentIndex: int, _array: BigUint64Array): bigint => {
        callCount = callCount + 1;
        return previousValue + currentValue;
      }, 42n);
      expect(reducedValue).assertEqual(42n);
      expect(callCount).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_REDUCE_RIGHT_0700
     * @tc.name testBigUint64ArrayReduceRight007
     * @tc.desc Verify reduceRight() on an empty array returns the string initial value unchanged
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayReduceRight007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array(0);
      let reducedText = sourceArray.reduceRight<string>((previousValue: string, currentValue: bigint,
        _currentIndex: int, _array: BigUint64Array): string => {
        return previousValue + currentValue.toString();
      }, 'seed');
      expect(reducedText).assertEqual('seed');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_REDUCE_RIGHT_0800
     * @tc.name testBigUint64ArrayReduceRight008
     * @tc.desc Verify reduceRight() on an empty array returns the number initial value unchanged
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayReduceRight008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array(0);
      let reducedNumber = sourceArray.reduceRight<number>((previousValue: number, _currentValue: bigint,
        _currentIndex: int, _array: BigUint64Array): number => {
        return previousValue + 1;
      }, 7);
      expect(reducedNumber).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_REDUCE_RIGHT_0900
     * @tc.name testBigUint64ArrayReduceRight009
     * @tc.desc Verify reduceRight() on an empty array returns the boolean initial value unchanged
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayReduceRight009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array(0);
      let reducedBoolean = sourceArray.reduceRight<boolean>((previousValue: boolean, _currentValue: bigint,
        _currentIndex: int, _array: BigUint64Array): boolean => {
        return previousValue;
      }, false);
      expect(reducedBoolean).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_REDUCE_RIGHT_1000
     * @tc.name testBigUint64ArrayReduceRight010
     * @tc.desc Verify reduceRight() with an initial value invokes the callback once for a single element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayReduceRight010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([5n]);
      let callCount: int = 0;
      let reducedValue = sourceArray.reduceRight<bigint>((previousValue: bigint, currentValue: bigint,
        _currentIndex: int, _array: BigUint64Array): bigint => {
        callCount = callCount + 1;
        return previousValue + currentValue;
      }, 10n);
      expect(reducedValue).assertEqual(15n);
      expect(callCount).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_REDUCE_RIGHT_1100
     * @tc.name testBigUint64ArrayReduceRight011
     * @tc.desc Verify reduceRight() first callback receives initialValue and the last element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayReduceRight011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([10n, 20n, 30n]);
      let firstPreviousValue: bigint = -1n;
      let firstCurrentValue: bigint = -1n;
      let reducedValue = sourceArray.reduceRight<bigint>((previousValue: bigint, currentValue: bigint,
        _currentIndex: int, _array: BigUint64Array): bigint => {
        if (firstPreviousValue === -1n) {
          firstPreviousValue = previousValue;
          firstCurrentValue = currentValue;
        }
        return previousValue + currentValue;
      }, 100n);
      expect(firstPreviousValue).assertEqual(100n);
      expect(firstCurrentValue).assertEqual(30n);
      expect(reducedValue).assertEqual(160n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_REDUCE_RIGHT_1200
     * @tc.name testBigUint64ArrayReduceRight012
     * @tc.desc Verify reduceRight() first callback index is length minus one when initialValue exists
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayReduceRight012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n, 4n]);
      let firstIndex: int = -1;
      let reducedValue = sourceArray.reduceRight<bigint>((previousValue: bigint, currentValue: bigint,
        currentIndex: int, _array: BigUint64Array): bigint => {
        if (firstIndex === -1) {
          firstIndex = currentIndex;
        }
        return previousValue + currentValue;
      }, 0n);
      expect(firstIndex).assertEqual(3);
      expect(reducedValue).assertEqual(10n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_REDUCE_RIGHT_1300
     * @tc.name testBigUint64ArrayReduceRight013
     * @tc.desc Verify reduceRight() second callback receives the previous callback return value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayReduceRight013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n]);
      let callCount: int = 0;
      let secondPreviousValue: bigint = -1n;
      let reducedValue = sourceArray.reduceRight<bigint>((previousValue: bigint, currentValue: bigint,
        _currentIndex: int, _array: BigUint64Array): bigint => {
        callCount = callCount + 1;
        if (callCount === 2) {
          secondPreviousValue = previousValue;
        }
        return previousValue + currentValue;
      }, 0n);
      expect(secondPreviousValue).assertEqual(3n);
      expect(reducedValue).assertEqual(6n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_REDUCE_RIGHT_1400
     * @tc.name testBigUint64ArrayReduceRight014
     * @tc.desc Verify reduceRight() last callback currentValue is the first element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayReduceRight014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([10n, 20n, 30n]);
      let lastCurrentValue: bigint = 0n;
      let reducedValue = sourceArray.reduceRight<bigint>((previousValue: bigint, currentValue: bigint,
        _currentIndex: int, _array: BigUint64Array): bigint => {
        lastCurrentValue = currentValue;
        return previousValue + currentValue;
      }, 0n);
      expect(lastCurrentValue).assertEqual(10n);
      expect(reducedValue).assertEqual(60n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_REDUCE_RIGHT_1500
     * @tc.name testBigUint64ArrayReduceRight015
     * @tc.desc Verify reduceRight() currentIndex values decrease by one with an initial value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayReduceRight015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      let previousIndex: int = sourceArray.length;
      let descending: boolean = true;
      let reducedValue = sourceArray.reduceRight<bigint>((previousValue: bigint, currentValue: bigint,
        currentIndex: int, _array: BigUint64Array): bigint => {
        if (currentIndex !== previousIndex - 1) {
          descending = false;
        }
        previousIndex = currentIndex;
        return previousValue + currentValue;
      }, 0n);
      expect(descending).assertTrue();
      expect(reducedValue).assertEqual(15n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_REDUCE_RIGHT_1600
     * @tc.name testBigUint64ArrayReduceRight016
     * @tc.desc Verify reduceRight() callback array parameter is the source array reference
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayReduceRight016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([5n, 10n, 15n]);
      let callbackArray = sourceArray;
      let reducedValue = sourceArray.reduceRight<bigint>((previousValue: bigint, currentValue: bigint,
        _currentIndex: int, array: BigUint64Array): bigint => {
        callbackArray = array;
        return previousValue + currentValue;
      }, 0n);
      expect(callbackArray).assertEqual(sourceArray);
      expect(reducedValue).assertEqual(30n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_REDUCE_RIGHT_1700
     * @tc.name testBigUint64ArrayReduceRight017
     * @tc.desc Verify reduceRight() callback can read array length from the array parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayReduceRight017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n, 4n]);
      let reducedValue = sourceArray.reduceRight<bigint>((previousValue: bigint, _currentValue: bigint,
        _currentIndex: int, array: BigUint64Array): bigint => {
        return previousValue + BigInt(array.length);
      }, 0n);
      expect(reducedValue).assertEqual(16n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_REDUCE_RIGHT_1800
     * @tc.name testBigUint64ArrayReduceRight018
     * @tc.desc Verify reduceRight() currentValue equals the array element at currentIndex
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayReduceRight018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([100n, 200n, 300n]);
      let allValuesMatch: boolean = true;
      let reducedValue = sourceArray.reduceRight<bigint>((previousValue: bigint, currentValue: bigint,
        currentIndex: int, array: BigUint64Array): bigint => {
        if (array[currentIndex] !== currentValue) {
          allValuesMatch = false;
        }
        return previousValue + currentValue;
      }, 0n);
      expect(allValuesMatch).assertTrue();
      expect(reducedValue).assertEqual(600n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_REDUCE_RIGHT_1900
     * @tc.name testBigUint64ArrayReduceRight019
     * @tc.desc Verify reduceRight() pure aggregation does not change source element values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayReduceRight019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([10n, 20n, 30n]);
      let reducedValue = sourceArray.reduceRight<bigint>((previousValue: bigint, currentValue: bigint,
        _currentIndex: int, _array: BigUint64Array): bigint => {
        return previousValue + currentValue;
      }, 0n);
      expect(reducedValue).assertEqual(60n);
      expect(sourceArray[0]).assertEqual(10n);
      expect(sourceArray[1]).assertEqual(20n);
      expect(sourceArray[2]).assertEqual(30n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_REDUCE_RIGHT_2000
     * @tc.name testBigUint64ArrayReduceRight020
     * @tc.desc Verify reduceRight() callback receives currentValue before current index mutation
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayReduceRight020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n]);
      let reducedValue = sourceArray.reduceRight<bigint>((previousValue: bigint, currentValue: bigint,
        currentIndex: int, array: BigUint64Array): bigint => {
        array[currentIndex] = 0n;
        return previousValue + currentValue;
      }, 0n);
      expect(reducedValue).assertEqual(6n);
      expect(sourceArray[0]).assertEqual(0n);
      expect(sourceArray[1]).assertEqual(0n);
      expect(sourceArray[2]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_REDUCE_RIGHT_2100
     * @tc.name testBigUint64ArrayReduceRight021
     * @tc.desc Verify reduceRight() observes writes to lower indexes before they are visited
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayReduceRight021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n]);
      let reducedValue = sourceArray.reduceRight<bigint>((previousValue: bigint, currentValue: bigint,
        currentIndex: int, array: BigUint64Array): bigint => {
        if (currentIndex > 0) {
          array[currentIndex - 1] = 9n;
        }
        return previousValue + currentValue;
      }, 0n);
      expect(reducedValue).assertEqual(21n);
      expect(sourceArray[0]).assertEqual(9n);
      expect(sourceArray[1]).assertEqual(9n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_REDUCE_RIGHT_2200
     * @tc.name testBigUint64ArrayReduceRight022
     * @tc.desc Verify reduceRight() keeps precision when initial value is max uint64
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayReduceRight022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([1n]);
      let maxUint64Value: bigint = 18446744073709551615n;
      let reducedValue = sourceArray.reduceRight<bigint>((previousValue: bigint, currentValue: bigint,
        _currentIndex: int, _array: BigUint64Array): bigint => {
        return previousValue + currentValue;
      }, maxUint64Value);
      expect(reducedValue).assertEqual(18446744073709551616n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_REDUCE_RIGHT_2300
     * @tc.name testBigUint64ArrayReduceRight023
     * @tc.desc Verify reduceRight() supports a negative bigint initial accumulator
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayReduceRight023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([5n, 5n]);
      let reducedValue = sourceArray.reduceRight<bigint>((previousValue: bigint, currentValue: bigint,
        _currentIndex: int, _array: BigUint64Array): bigint => {
        return previousValue + currentValue;
      }, -1n);
      expect(reducedValue).assertEqual(9n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_REDUCE_RIGHT_2400
     * @tc.name testBigUint64ArrayReduceRight024
     * @tc.desc Verify reduceRight() keeps precision from signed int64 max initial value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayReduceRight024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([1n]);
      let signedInt64MaxValue: bigint = 9223372036854775807n;
      let reducedValue = sourceArray.reduceRight<bigint>((previousValue: bigint, currentValue: bigint,
        _currentIndex: int, _array: BigUint64Array): bigint => {
        return previousValue + currentValue;
      }, signedInt64MaxValue);
      expect(reducedValue).assertEqual(9223372036854775808n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_REDUCE_RIGHT_2500
     * @tc.name testBigUint64ArrayReduceRight025
     * @tc.desc Verify reduceRight() string accumulator can prepend a stable prefix
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayReduceRight025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([10n, 20n]);
      let reducedText = sourceArray.reduceRight<string>((previousValue: string, currentValue: bigint,
        _currentIndex: int, _array: BigUint64Array): string => {
        return previousValue + currentValue.toString();
      }, 'prefix_');
      expect(reducedText).assertEqual('prefix_2010');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_REDUCE_RIGHT_2600
     * @tc.name testBigUint64ArrayReduceRight026
     * @tc.desc Verify reduceRight() number accumulator preserves a decimal initial value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayReduceRight026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n]);
      let reducedNumber = sourceArray.reduceRight<number>((previousValue: number, _currentValue: bigint,
        _currentIndex: int, _array: BigUint64Array): number => {
        return previousValue + 0.5;
      }, 1.5);
      expect(reducedNumber).assertEqual(3.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_REDUCE_RIGHT_2700
     * @tc.name testBigUint64ArrayReduceRight027
     * @tc.desc Verify reduceRight() boolean accumulator supports logical OR success
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayReduceRight027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([0n, 0n, 1n]);
      let hasPositiveValue = sourceArray.reduceRight<boolean>((previousValue: boolean, currentValue: bigint,
        _currentIndex: int, _array: BigUint64Array): boolean => {
        return previousValue || currentValue > 0n;
      }, false);
      expect(hasPositiveValue).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_REDUCE_RIGHT_2800
     * @tc.name testBigUint64ArrayReduceRight028
     * @tc.desc Verify reduceRight() callback can call another reduceRight() operation
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayReduceRight028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let outerArray = new BigUint64Array([1n, 2n]);
      let innerArray = new BigUint64Array([10n, 20n]);
      let reducedValue = outerArray.reduceRight<bigint>((previousValue: bigint, currentValue: bigint,
        _currentIndex: int, _array: BigUint64Array): bigint => {
        let innerSum = innerArray.reduceRight<bigint>((innerPreviousValue: bigint, innerCurrentValue: bigint,
          _innerCurrentIndex: int, _innerArray: BigUint64Array): bigint => {
          return innerPreviousValue + innerCurrentValue;
        }, 0n);
        return previousValue + currentValue + innerSum;
      }, 0n);
      expect(reducedValue).assertEqual(63n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_REDUCE_RIGHT_2900
     * @tc.name testBigUint64ArrayReduceRight029
     * @tc.desc Verify reduceRight() callback can read another BigUint64Array as weights
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayReduceRight029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n]);
      let weightArray = new BigUint64Array([10n, 100n, 1000n]);
      let reducedValue = sourceArray.reduceRight<bigint>((previousValue: bigint, currentValue: bigint,
        currentIndex: int, _array: BigUint64Array): bigint => {
        return previousValue + currentValue * weightArray[currentIndex];
      }, 0n);
      expect(reducedValue).assertEqual(3210n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_REDUCE_RIGHT_3000
     * @tc.name testBigUint64ArrayReduceRight030
     * @tc.desc Verify reduceRight() callback can compute bitwise AND across values with an initial value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayReduceRight030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([7n, 3n, 1n]);
      let reducedValue = sourceArray.reduceRight<bigint>((previousValue: bigint, currentValue: bigint,
        _currentIndex: int, _array: BigUint64Array): bigint => {
        return previousValue & currentValue;
      }, 7n);
      expect(reducedValue).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_REDUCE_RIGHT_3100
     * @tc.name testBigUint64ArrayReduceRight031
     * @tc.desc Verify reduceRight() callback can compute bitwise OR across values with an initial value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayReduceRight031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([1n, 2n, 4n]);
      let reducedValue = sourceArray.reduceRight<bigint>((previousValue: bigint, currentValue: bigint,
        _currentIndex: int, _array: BigUint64Array): bigint => {
        return previousValue | currentValue;
      }, 0n);
      expect(reducedValue).assertEqual(7n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_REDUCE_RIGHT_3200
     * @tc.name testBigUint64ArrayReduceRight032
     * @tc.desc Verify reduceRight() callback can compute bitwise XOR across values with an initial value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayReduceRight032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([5n, 9n, 12n]);
      let reducedValue = sourceArray.reduceRight<bigint>((previousValue: bigint, currentValue: bigint,
        _currentIndex: int, _array: BigUint64Array): bigint => {
        return previousValue ^ currentValue;
      }, 0n);
      expect(reducedValue).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_REDUCE_RIGHT_3300
     * @tc.name testBigUint64ArrayReduceRight033
     * @tc.desc Verify reduceRight() callback can left shift the bigint accumulator with an initial value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayReduceRight033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n]);
      let reducedValue = sourceArray.reduceRight<bigint>((previousValue: bigint, _currentValue: bigint,
        _currentIndex: int, _array: BigUint64Array): bigint => {
        return previousValue << 1n;
      }, 1n);
      expect(reducedValue).assertEqual(8n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_REDUCE_RIGHT_3400
     * @tc.name testBigUint64ArrayReduceRight034
     * @tc.desc Verify reduceRight() performs right-to-left subtraction with an initial value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayReduceRight034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([10n, 20n, 30n]);
      let reducedValue = sourceArray.reduceRight<bigint>((previousValue: bigint, currentValue: bigint,
        _currentIndex: int, _array: BigUint64Array): bigint => {
        return previousValue - currentValue;
      }, 0n);
      expect(reducedValue).assertEqual(-60n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_REDUCE_RIGHT_3500
     * @tc.name testBigUint64ArrayReduceRight035
     * @tc.desc Verify reduceRight() callback can keep returning the previous bigint accumulator
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayReduceRight035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n]);
      let reducedValue = sourceArray.reduceRight<bigint>((previousValue: bigint, _currentValue: bigint,
        _currentIndex: int, _array: BigUint64Array): bigint => {
        return previousValue;
      }, 100n);
      expect(reducedValue).assertEqual(100n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_REDUCE_RIGHT_3600
     * @tc.name testBigUint64ArrayReduceRight036
     * @tc.desc Verify reduceRight() callback can replace the accumulator with current value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayReduceRight036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([10n, 20n, 30n]);
      let reducedValue = sourceArray.reduceRight<bigint>((_previousValue: bigint, currentValue: bigint,
        _currentIndex: int, _array: BigUint64Array): bigint => {
        return currentValue;
      }, 0n);
      expect(reducedValue).assertEqual(10n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_REDUCE_RIGHT_3700
     * @tc.name testBigUint64ArrayReduceRight037
     * @tc.desc Verify reduceRight() callback can select the maximum bigint value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayReduceRight037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([5n, 100n, 50n]);
      let reducedValue = sourceArray.reduceRight<bigint>((previousValue: bigint, currentValue: bigint,
        _currentIndex: int, _array: BigUint64Array): bigint => {
        if (currentValue > previousValue) {
          return currentValue;
        }
        return previousValue;
      }, 0n);
      expect(reducedValue).assertEqual(100n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_REDUCE_RIGHT_3800
     * @tc.name testBigUint64ArrayReduceRight038
     * @tc.desc Verify reduceRight() callback can select the minimum bigint value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayReduceRight038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([100n, 5n, 50n]);
      let initialSummary = new ReduceRightBoundarySummary(0n, 18446744073709551615n);
      let reducedSummary =
        sourceArray.reduceRight<ReduceRightBoundarySummary>((previousValue: ReduceRightBoundarySummary,
          currentValue: bigint, _currentIndex: int, _array: BigUint64Array): ReduceRightBoundarySummary => {
          let nextMaxValue: bigint = previousValue.maxValue;
          let nextMinValue: bigint = previousValue.minValue;
          if (currentValue > nextMaxValue) {
            nextMaxValue = currentValue;
          }
          if (currentValue < nextMinValue) {
            nextMinValue = currentValue;
          }
          return new ReduceRightBoundarySummary(nextMaxValue, nextMinValue);
        }, initialSummary);
      expect(reducedSummary.maxValue).assertEqual(100n);
      expect(reducedSummary.minValue).assertEqual(5n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_REDUCE_RIGHT_3900
     * @tc.name testBigUint64ArrayReduceRight039
     * @tc.desc Verify reduceRight() can aggregate fifty default zero elements with an initial value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayReduceRight039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array(50);
      let callCount: int = 0;
      let reducedValue = sourceArray.reduceRight<bigint>((previousValue: bigint, currentValue: bigint,
        _currentIndex: int, _array: BigUint64Array): bigint => {
        callCount = callCount + 1;
        return previousValue + currentValue;
      }, 0n);
      expect(reducedValue).assertEqual(0n);
      expect(callCount).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_REDUCE_RIGHT_4000
     * @tc.name testBigUint64ArrayReduceRight040
     * @tc.desc Verify reduceRight() without initial value sums multiple elements
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayReduceRight040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([10n, 20n, 30n]);
      let reducedValue = sourceArray.reduceRight((previousValue: bigint, currentValue: bigint,
        _currentIndex: int, _array: BigUint64Array): bigint => {
        return previousValue + currentValue;
      });
      expect(reducedValue).assertEqual(60n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_REDUCE_RIGHT_4100
     * @tc.name testBigUint64ArrayReduceRight041
     * @tc.desc Verify reduceRight() without initial value can multiply bigint values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayReduceRight041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([2n, 3n, 4n]);
      let reducedValue = sourceArray.reduceRight((previousValue: bigint, currentValue: bigint,
        _currentIndex: int, _array: BigUint64Array): bigint => {
        return previousValue * currentValue;
      });
      expect(reducedValue).assertEqual(24n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_REDUCE_RIGHT_4200
     * @tc.name testBigUint64ArrayReduceRight042
     * @tc.desc Verify reduceRight() without initial value performs right-to-left subtraction
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayReduceRight042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([9n, 8n, 7n, 6n]);
      let reducedValue = sourceArray.reduceRight((previousValue: bigint, currentValue: bigint,
        _currentIndex: int, _array: BigUint64Array): bigint => {
        return previousValue - currentValue;
      });
      expect(reducedValue).assertEqual(-18n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_REDUCE_RIGHT_4300
     * @tc.name testBigUint64ArrayReduceRight043
     * @tc.desc Verify reduceRight() without initial value can divide the bigint accumulator by each value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayReduceRight043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([2n, 3n, 100n]);
      let reducedValue = sourceArray.reduceRight((previousValue: bigint, currentValue: bigint,
        _currentIndex: int, _array: BigUint64Array): bigint => {
        return previousValue / currentValue;
      });
      expect(reducedValue).assertEqual(16n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_REDUCE_RIGHT_4400
     * @tc.name testBigUint64ArrayReduceRight044
     * @tc.desc Verify reduceRight() without initial value can compute bigint remainder values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayReduceRight044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([3n, 5n, 17n]);
      let reducedValue = sourceArray.reduceRight((previousValue: bigint, currentValue: bigint,
        _currentIndex: int, _array: BigUint64Array): bigint => {
        return previousValue % currentValue;
      });
      expect(reducedValue).assertEqual(2n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_REDUCE_RIGHT_4500
     * @tc.name testBigUint64ArrayReduceRight045
     * @tc.desc Verify reduceRight() without initial value can compute bitwise AND across values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayReduceRight045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([1n, 3n, 7n]);
      let reducedValue = sourceArray.reduceRight((previousValue: bigint, currentValue: bigint,
        _currentIndex: int, _array: BigUint64Array): bigint => {
        return previousValue & currentValue;
      });
      expect(reducedValue).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_REDUCE_RIGHT_4600
     * @tc.name testBigUint64ArrayReduceRight046
     * @tc.desc Verify reduceRight() without initial value can compute bitwise OR across values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayReduceRight046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([1n, 2n, 4n]);
      let reducedValue = sourceArray.reduceRight((previousValue: bigint, currentValue: bigint,
        _currentIndex: int, _array: BigUint64Array): bigint => {
        return previousValue | currentValue;
      });
      expect(reducedValue).assertEqual(7n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_REDUCE_RIGHT_4700
     * @tc.name testBigUint64ArrayReduceRight047
     * @tc.desc Verify reduceRight() without initial value can compute bitwise XOR across values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayReduceRight047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([5n, 9n, 12n]);
      let reducedValue = sourceArray.reduceRight((previousValue: bigint, currentValue: bigint,
        _currentIndex: int, _array: BigUint64Array): bigint => {
        return previousValue ^ currentValue;
      });
      expect(reducedValue).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_REDUCE_RIGHT_4800
     * @tc.name testBigUint64ArrayReduceRight048
     * @tc.desc Verify reduceRight() without initial value can left shift through callback values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayReduceRight048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n]);
      let reducedValue = sourceArray.reduceRight((previousValue: bigint, currentValue: bigint,
        _currentIndex: int, _array: BigUint64Array): bigint => {
        return previousValue << currentValue;
      });
      expect(reducedValue).assertEqual(24n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_REDUCE_RIGHT_4900
     * @tc.name testBigUint64ArrayReduceRight049
     * @tc.desc Verify reduceRight() without initial value can right shift through callback values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayReduceRight049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([1n, 2n, 64n]);
      let reducedValue = sourceArray.reduceRight((previousValue: bigint, currentValue: bigint,
        _currentIndex: int, _array: BigUint64Array): bigint => {
        return previousValue >> currentValue;
      });
      expect(reducedValue).assertEqual(8n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_REDUCE_RIGHT_5000
     * @tc.name testBigUint64ArrayReduceRight050
     * @tc.desc Verify reduceRight() without initial value can keep returning previous accumulator
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayReduceRight050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n]);
      let reducedValue = sourceArray.reduceRight((previousValue: bigint, _currentValue: bigint,
        _currentIndex: int, _array: BigUint64Array): bigint => {
        return previousValue;
      });
      expect(reducedValue).assertEqual(3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_REDUCE_RIGHT_5100
     * @tc.name testBigUint64ArrayReduceRight051
     * @tc.desc Verify reduceRight() without initial value can return the current value at the left edge
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayReduceRight051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([10n, 20n, 30n]);
      let reducedValue = sourceArray.reduceRight((_previousValue: bigint, currentValue: bigint,
        _currentIndex: int, _array: BigUint64Array): bigint => {
        return currentValue;
      });
      expect(reducedValue).assertEqual(10n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_REDUCE_RIGHT_5200
     * @tc.name testBigUint64ArrayReduceRight052
     * @tc.desc Verify reduceRight() without initial value can select the maximum element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayReduceRight052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([5n, 100n, 50n]);
      let reducedValue = sourceArray.reduceRight((previousValue: bigint, currentValue: bigint,
        _currentIndex: int, _array: BigUint64Array): bigint => {
        if (currentValue > previousValue) {
          return currentValue;
        }
        return previousValue;
      });
      expect(reducedValue).assertEqual(100n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_REDUCE_RIGHT_5300
     * @tc.name testBigUint64ArrayReduceRight053
     * @tc.desc Verify reduceRight() without initial value can select the minimum element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayReduceRight053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([100n, 5n, 50n]);
      let reducedValue = sourceArray.reduceRight((previousValue: bigint, currentValue: bigint,
        _currentIndex: int, _array: BigUint64Array): bigint => {
        if (currentValue < previousValue) {
          return currentValue;
        }
        return previousValue;
      });
      expect(reducedValue).assertEqual(5n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_REDUCE_RIGHT_5400
     * @tc.name testBigUint64ArrayReduceRight054
     * @tc.desc Verify reduceRight() without initial value uses the last element as first previousValue
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayReduceRight054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([10n, 99n]);
      let firstPreviousValue: bigint = 0n;
      let firstCurrentValue: bigint = 0n;
      let firstIndex: int = -1;
      let reducedValue = sourceArray.reduceRight((previousValue: bigint, currentValue: bigint,
        currentIndex: int, _array: BigUint64Array): bigint => {
        firstPreviousValue = previousValue;
        firstCurrentValue = currentValue;
        firstIndex = currentIndex;
        return previousValue + currentValue;
      });
      expect(firstPreviousValue).assertEqual(99n);
      expect(firstCurrentValue).assertEqual(10n);
      expect(firstIndex).assertEqual(0);
      expect(reducedValue).assertEqual(109n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_REDUCE_RIGHT_5500
     * @tc.name testBigUint64ArrayReduceRight055
     * @tc.desc Verify reduceRight() without initial value calls the callback length minus one times
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayReduceRight055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      let callCount: int = 0;
      let reducedValue = sourceArray.reduceRight((previousValue: bigint, currentValue: bigint,
        _currentIndex: int, _array: BigUint64Array): bigint => {
        callCount = callCount + 1;
        return previousValue + currentValue;
      });
      expect(callCount).assertEqual(sourceArray.length - 1);
      expect(reducedValue).assertEqual(15n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_REDUCE_RIGHT_5600
     * @tc.name testBigUint64ArrayReduceRight056
     * @tc.desc Verify reduceRight() without initial value does not call callback for a single element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayReduceRight056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([42n]);
      let callCount: int = 0;
      let reducedValue = sourceArray.reduceRight((_previousValue: bigint, _currentValue: bigint,
        _currentIndex: int, _array: BigUint64Array): bigint => {
        callCount = callCount + 1;
        return 0n;
      });
      expect(reducedValue).assertEqual(42n);
      expect(callCount).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_REDUCE_RIGHT_5700
     * @tc.name testBigUint64ArrayReduceRight057
     * @tc.desc Verify reduceRight() without initial value returns a single zero element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayReduceRight057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([0n]);
      let reducedValue = sourceArray.reduceRight((_previousValue: bigint, _currentValue: bigint,
        _currentIndex: int, _array: BigUint64Array): bigint => {
        return 1n;
      });
      expect(reducedValue).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_REDUCE_RIGHT_5800
     * @tc.name testBigUint64ArrayReduceRight058
     * @tc.desc Verify reduceRight() without initial value returns a single max uint64 element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayReduceRight058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let maxUint64Value: bigint = 18446744073709551615n;
      let sourceArray = new BigUint64Array([maxUint64Value]);
      let reducedValue = sourceArray.reduceRight((_previousValue: bigint, _currentValue: bigint,
        _currentIndex: int, _array: BigUint64Array): bigint => {
        return 0n;
      });
      expect(reducedValue).assertEqual(maxUint64Value);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_REDUCE_RIGHT_5900
     * @tc.name testBigUint64ArrayReduceRight059
     * @tc.desc Verify reduceRight() without initial value returns single negative input stored as max uint64
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayReduceRight059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([-1n]);
      let reducedValue = sourceArray.reduceRight((_previousValue: bigint, _currentValue: bigint,
        _currentIndex: int, _array: BigUint64Array): bigint => {
        return 0n;
      });
      expect(reducedValue).assertEqual(18446744073709551615n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_REDUCE_RIGHT_6000
     * @tc.name testBigUint64ArrayReduceRight060
     * @tc.desc Verify reduceRight() without initial value returns single overflow input stored as zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayReduceRight060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([18446744073709551616n]);
      let reducedValue = sourceArray.reduceRight((_previousValue: bigint, _currentValue: bigint,
        _currentIndex: int, _array: BigUint64Array): bigint => {
        return 1n;
      });
      expect(reducedValue).assertEqual(0n);
      expect(sourceArray[0]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_REDUCE_RIGHT_6100
     * @tc.name testBigUint64ArrayReduceRight061
     * @tc.desc Verify reduceRight() without initial value callback array parameter stays the source reference
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayReduceRight061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n]);
      let callbackArray = sourceArray;
      let reducedValue = sourceArray.reduceRight((previousValue: bigint, currentValue: bigint,
        _currentIndex: int, array: BigUint64Array): bigint => {
        callbackArray = array;
        return previousValue + currentValue;
      });
      expect(callbackArray).assertEqual(sourceArray);
      expect(reducedValue).assertEqual(6n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_REDUCE_RIGHT_6200
     * @tc.name testBigUint64ArrayReduceRight062
     * @tc.desc Verify reduceRight() without initial value pure aggregation does not change source values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayReduceRight062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([10n, 20n, 30n]);
      let reducedValue = sourceArray.reduceRight(sumReducerForReduceRight);
      expect(reducedValue).assertEqual(60n);
      expect(sourceArray[0]).assertEqual(10n);
      expect(sourceArray[1]).assertEqual(20n);
      expect(sourceArray[2]).assertEqual(30n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_REDUCE_RIGHT_6300
     * @tc.name testBigUint64ArrayReduceRight063
     * @tc.desc Verify reduceRight() without initial value observes writes to lower indexes before visiting them
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayReduceRight063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n]);
      let reducedValue = sourceArray.reduceRight((previousValue: bigint, currentValue: bigint,
        currentIndex: int, array: BigUint64Array): bigint => {
        if (currentIndex > 0) {
          array[currentIndex - 1] = 9n;
        }
        return previousValue + currentValue;
      });
      expect(reducedValue).assertEqual(14n);
      expect(sourceArray[0]).assertEqual(9n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_REDUCE_RIGHT_6400
     * @tc.name testBigUint64ArrayReduceRight064
     * @tc.desc Verify reduceRight() without initial value ignores writes to already visited higher indexes
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayReduceRight064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n]);
      let reducedValue = sourceArray.reduceRight((previousValue: bigint, currentValue: bigint,
        currentIndex: int, array: BigUint64Array): bigint => {
        if (currentIndex + 1 < array.length) {
          array[currentIndex + 1] = 99n;
        }
        return previousValue + currentValue;
      });
      expect(reducedValue).assertEqual(6n);
      expect(sourceArray[1]).assertEqual(99n);
      expect(sourceArray[2]).assertEqual(99n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_REDUCE_RIGHT_6500
     * @tc.name testBigUint64ArrayReduceRight065
     * @tc.desc Verify repeated reduceRight() calls can return stable independent results
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayReduceRight065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n]);
      let firstValue = sourceArray.reduceRight(sumReducerForReduceRight);
      let secondValue = sourceArray.reduceRight(sumReducerForReduceRight);
      expect(firstValue).assertEqual(6n);
      expect(secondValue).assertEqual(6n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_REDUCE_RIGHT_6600
     * @tc.name testBigUint64ArrayReduceRight066
     * @tc.desc Verify reduceRight() result can be converted to a decimal string
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayReduceRight066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n]);
      let reducedValue = sourceArray.reduceRight(sumReducerForReduceRight);
      expect(reducedValue.toString()).assertEqual('6');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_REDUCE_RIGHT_6700
     * @tc.name testBigUint64ArrayReduceRight067
     * @tc.desc Verify reduceRight() result can exceed the safe integer boundary as bigint
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayReduceRight067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([9007199254740991n, 1n, 1n]);
      let reducedValue = sourceArray.reduceRight(sumReducerForReduceRight);
      expect(reducedValue > 9007199254740991n).assertTrue();
      expect(reducedValue).assertEqual(9007199254740993n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_REDUCE_RIGHT_6800
     * @tc.name testBigUint64ArrayReduceRight068
     * @tc.desc Verify reduceRight() without initial value throws TypeError on a zero length array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayReduceRight068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array(0);
      try {
        sourceArray.reduceRight((previousValue: bigint, currentValue: bigint,
          _currentIndex: int, _array: BigUint64Array): bigint => {
          return previousValue + currentValue;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_REDUCE_RIGHT_6900
     * @tc.name testBigUint64ArrayReduceRight069
     * @tc.desc Verify reduceRight() without initial value throws TypeError on a zero byte ArrayBuffer view
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayReduceRight069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array(new ArrayBuffer(0));
      try {
        sourceArray.reduceRight((previousValue: bigint, currentValue: bigint,
          _currentIndex: int, _array: BigUint64Array): bigint => {
          return previousValue + currentValue;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_REDUCE_RIGHT_7000
     * @tc.name testBigUint64ArrayReduceRight070
     * @tc.desc Verify reduceRight() empty array error is thrown before callback invocation
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayReduceRight070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array(0);
      let callCount: int = 0;
      try {
        sourceArray.reduceRight((previousValue: bigint, currentValue: bigint,
          _currentIndex: int, _array: BigUint64Array): bigint => {
          callCount = callCount + 1;
          return previousValue + currentValue;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
      expect(callCount).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_REDUCE_RIGHT_7100
     * @tc.name testBigUint64ArrayReduceRight071
     * @tc.desc Verify reduceRight() propagates an Error thrown on the first callback
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayReduceRight071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n]);
      let callCount: int = 0;
      try {
        sourceArray.reduceRight<bigint>((previousValue: bigint, _currentValue: bigint,
          _currentIndex: int, _array: BigUint64Array): bigint => {
          callCount = callCount + 1;
          throw new Error('first callback error');
        }, 0n);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      expect(callCount).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_REDUCE_RIGHT_7200
     * @tc.name testBigUint64ArrayReduceRight072
     * @tc.desc Verify reduceRight() propagates a TypeError thrown inside the callback
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayReduceRight072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([1n, 2n]);
      try {
        sourceArray.reduceRight<bigint>((previousValue: bigint, _currentValue: bigint,
          _currentIndex: int, _array: BigUint64Array): bigint => {
          throw new TypeError('callback type error');
        }, 0n);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_REDUCE_RIGHT_7300
     * @tc.name testBigUint64ArrayReduceRight073
     * @tc.desc Verify reduceRight() propagates a RangeError thrown inside the callback
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayReduceRight073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([1n, 2n]);
      try {
        sourceArray.reduceRight<bigint>((previousValue: bigint, _currentValue: bigint,
          _currentIndex: int, _array: BigUint64Array): bigint => {
          throw new RangeError('callback range error');
        }, 0n);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_REDUCE_RIGHT_7400
     * @tc.name testBigUint64ArrayReduceRight074
     * @tc.desc Verify reduceRight() stops when a middle callback throws Error
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayReduceRight074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n, 4n]);
      let callCount: int = 0;
      try {
        sourceArray.reduceRight((previousValue: bigint, currentValue: bigint,
          currentIndex: int, _array: BigUint64Array): bigint => {
          callCount = callCount + 1;
          if (currentIndex === 1) {
            throw new Error('middle callback error');
          }
          return previousValue + currentValue;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      expect(callCount).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_REDUCE_RIGHT_7500
     * @tc.name testBigUint64ArrayReduceRight075
     * @tc.desc Verify reduceRight() on a byteOffset view uses window values and local indices
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayReduceRight075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sharedBuffer: ArrayBuffer = new ArrayBuffer(32);
      let fullView = new BigUint64Array(sharedBuffer, 0, 4);
      fullView[0] = 10n;
      fullView[1] = 20n;
      fullView[2] = 30n;
      fullView[3] = 40n;
      let byteOffset: int = 8;
      let viewLength: int = 2;
      let sourceView = new BigUint64Array(sharedBuffer, byteOffset, viewLength);
      let reducedText = sourceView.reduceRight<string>((previousValue: string, currentValue: bigint,
        currentIndex: int, _array: BigUint64Array): string => {
        return previousValue + currentValue.toString() + ':' + currentIndex.toString() + '|';
      }, '');
      expect(reducedText).assertEqual('30:1|20:0|');
      expect(sourceView.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_REDUCE_RIGHT_7600
     * @tc.name testBigUint64ArrayReduceRight076
     * @tc.desc Verify reduceRight() on a subarray observes parent mutation before visiting lower index
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayReduceRight076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parentArray = new BigUint64Array([10n, 20n, 30n, 40n]);
      let beginIndex: int = 1;
      let endIndex: int = 3;
      let sourceView = parentArray.subarray(beginIndex, endIndex);
      let observedLowerElement: bigint = 0n;
      let reducedValue = sourceView.reduceRight<bigint>((previousValue: bigint, currentValue: bigint,
        currentIndex: int, _array: BigUint64Array): bigint => {
        if (currentIndex === 1) {
          parentArray[1] = 99n;
        }
        if (currentIndex === 0) {
          observedLowerElement = currentValue;
        }
        return previousValue + currentValue;
      }, 0n);
      expect(observedLowerElement).assertEqual(99n);
      expect(reducedValue).assertEqual(129n);
      expect(parentArray[1]).assertEqual(99n);
      expect(sourceView[0]).assertEqual(99n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_REDUCE_RIGHT_7700
     * @tc.name testBigUint64ArrayReduceRight077
     * @tc.desc Verify reduceRight() propagates an Error thrown on the last callback with initial value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayReduceRight077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([5n, 10n, 15n]);
      let callCount: int = 0;
      try {
        sourceArray.reduceRight<bigint>((previousValue: bigint, currentValue: bigint,
          currentIndex: int, _array: BigUint64Array): bigint => {
          callCount = callCount + 1;
          if (currentIndex === 0) {
            throw new Error('last callback error');
          }
          return previousValue + currentValue;
        }, 0n);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      expect(callCount).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_REDUCE_RIGHT_7800
     * @tc.name testBigUint64ArrayReduceRight078
     * @tc.desc Verify reduceRight() on nested byteOffset subarray aggregates local window indices
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayReduceRight078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sharedBuffer: ArrayBuffer = new ArrayBuffer(48);
      let fullView = new BigUint64Array(sharedBuffer, 0, 6);
      fullView[0] = 10n;
      fullView[1] = 20n;
      fullView[2] = 30n;
      fullView[3] = 40n;
      fullView[4] = 50n;
      fullView[5] = 60n;
      let byteOffset: int = 8;
      let viewLength: int = 4;
      let byteOffsetView = new BigUint64Array(sharedBuffer, byteOffset, viewLength);
      let beginIndex: int = 1;
      let endIndex: int = 4;
      let sourceView = byteOffsetView.subarray(beginIndex, endIndex);
      let observedIndexSum: int = 0;
      let observedByteOffset: int = 0;
      let reducedText = sourceView.reduceRight<string>((previousValue: string, currentValue: bigint,
        currentIndex: int, array: BigUint64Array): string => {
        observedIndexSum = observedIndexSum + currentIndex;
        observedByteOffset = array.byteOffset;
        return previousValue + currentValue.toString() + ':' + currentIndex.toString() + '|';
      }, '');
      expect(observedIndexSum).assertEqual(3);
      expect(observedByteOffset).assertEqual(16);
      expect(sourceView.byteOffset).assertEqual(16);
      expect(sourceView.length).assertEqual(3);
      expect(reducedText).assertEqual('50:2|40:1|30:0|');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_REDUCE_RIGHT_7900
     * @tc.name testBigUint64ArrayReduceRight079
     * @tc.desc Verify reduceRight() on a slice copy from byteOffset view ignores later source writes
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayReduceRight079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sharedBuffer: ArrayBuffer = new ArrayBuffer(40);
      let fullView = new BigUint64Array(sharedBuffer, 0, 5);
      fullView[0] = 10n;
      fullView[1] = 20n;
      fullView[2] = 30n;
      fullView[3] = 40n;
      fullView[4] = 50n;
      let sourceView = new BigUint64Array(sharedBuffer, 8, 3);
      let beginIndex: int = 1;
      let endIndex: int = 3;
      let sliceCopy = sourceView.slice(beginIndex, endIndex);
      sourceView[1] = 777n;
      let reducedValue = sliceCopy.reduceRight<bigint>((previousValue: bigint, currentValue: bigint,
        _currentIndex: int, _array: BigUint64Array): bigint => {
        return previousValue + currentValue;
      }, 0n);
      let sharesSliceBuffer: boolean = sliceCopy.buffer === sharedBuffer;
      expect(sharesSliceBuffer).assertFalse();
      expect(sliceCopy[0]).assertEqual(30n);
      expect(sliceCopy[1]).assertEqual(40n);
      expect(sourceView[1]).assertEqual(777n);
      expect(reducedValue).assertEqual(70n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_REDUCE_RIGHT_8000
     * @tc.name testBigUint64ArrayReduceRight080
     * @tc.desc Verify reduceRight() on zero-length byteOffset view returns initial value without callback
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayReduceRight080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sharedBuffer: ArrayBuffer = new ArrayBuffer(24);
      let byteOffset: int = 16;
      let viewLength: int = 0;
      let sourceView = new BigUint64Array(sharedBuffer, byteOffset, viewLength);
      let callCount: int = 0;
      let reducedValue = sourceView.reduceRight<bigint>((previousValue: bigint, currentValue: bigint,
        _currentIndex: int, _array: BigUint64Array): bigint => {
        callCount = callCount + 1;
        return previousValue + currentValue;
      }, 88n);
      expect(sourceView.byteOffset).assertEqual(16);
      expect(sourceView.length).assertEqual(0);
      expect(reducedValue).assertEqual(88n);
      expect(callCount).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_REDUCE_RIGHT_8100
     * @tc.name testBigUint64ArrayReduceRight081
     * @tc.desc Verify reduceRight() on a Set source accumulates values after duplicate removal
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayReduceRight081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceSet = new Set<BigInt>();
      sourceSet.add(7n);
      sourceSet.add(11n);
      sourceSet.add(7n);
      sourceSet.add(15n);
      let sourceArray = new BigUint64Array(sourceSet);
      let reducedText = sourceArray.reduceRight<string>((previousValue: string, currentValue: bigint,
        currentIndex: int, array: BigUint64Array): string => {
        return previousValue + currentValue.toString() + ':' + currentIndex.toString() + ':' +
          array.length.toString() + '|';
      }, '');
      expect(sourceArray.length).assertEqual(3);
      expect(reducedText).assertEqual('15:2:3|11:1:3|7:0:3|');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_REDUCE_RIGHT_8200
     * @tc.name testBigUint64ArrayReduceRight082
     * @tc.desc Verify reduceRight() without initial value on an advanced iterator source starts from the remaining window
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayReduceRight082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let baseArray = BigUint64Array.of(5n, 10n, 15n, 20n);
      let sourceIterator = baseArray.values();
      sourceIterator.next();
      let sourceArray = new BigUint64Array(sourceIterator);
      let firstIndex: int = -1;
      let firstPreviousValue: bigint = 0n;
      let firstCurrentValue: bigint = 0n;
      let reducedValue = sourceArray.reduceRight((previousValue: bigint, currentValue: bigint,
        currentIndex: int, _array: BigUint64Array): bigint => {
        if (firstIndex === -1) {
          firstIndex = currentIndex;
          firstPreviousValue = previousValue;
          firstCurrentValue = currentValue;
        }
        return previousValue + currentValue + BigInt(currentIndex);
      });
      expect(sourceArray.length).assertEqual(3);
      expect(firstIndex).assertEqual(1);
      expect(firstPreviousValue).assertEqual(20n);
      expect(firstCurrentValue).assertEqual(15n);
      expect(reducedValue).assertEqual(46n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_REDUCE_RIGHT_8300
     * @tc.name testBigUint64ArrayReduceRight083
     * @tc.desc Verify reduceRight() without initial value keeps captured previousValue after source mutation
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayReduceRight083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([5n, 10n, 15n]);
      let observedPreviousValue: bigint = 0n;
      let observedCurrentValue: bigint = 0n;
      let observedFirstIndex: int = -1;
      let reducedValue = sourceArray.reduceRight((previousValue: bigint, currentValue: bigint,
        currentIndex: int, array: BigUint64Array): bigint => {
        if (observedFirstIndex === -1) {
          observedFirstIndex = currentIndex;
          observedPreviousValue = previousValue;
          observedCurrentValue = currentValue;
          array[2] = 99n;
        }
        return previousValue + currentValue;
      });
      expect(observedFirstIndex).assertEqual(1);
      expect(observedPreviousValue).assertEqual(15n);
      expect(observedCurrentValue).assertEqual(10n);
      expect(sourceArray[2]).assertEqual(99n);
      expect(reducedValue).assertEqual(30n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_REDUCE_RIGHT_8400
     * @tc.name testBigUint64ArrayReduceRight084
     * @tc.desc Verify reduceRight() with an Array accumulator appends values in right to left order
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayReduceRight084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([4n, 5n, 6n]);
      let initialValues: Array<bigint> = [];
      let reducedValues = sourceArray.reduceRight<Array<bigint>>((previousValues: Array<bigint>, currentValue: bigint,
        _currentIndex: int, _array: BigUint64Array): Array<bigint> => {
        previousValues.push(currentValue);
        return previousValues;
      }, initialValues);
      let returnsInitialArray: boolean = reducedValues === initialValues;
      expect(returnsInitialArray).assertTrue();
      expect(reducedValues.length).assertEqual(3);
      expect(reducedValues[0]).assertEqual(6n);
      expect(reducedValues[1]).assertEqual(5n);
      expect(reducedValues[2]).assertEqual(4n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_REDUCE_RIGHT_8500
     * @tc.name testBigUint64ArrayReduceRight085
     * @tc.desc Verify reduceRight() treats explicit undefined as the generic initial value at the last index
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayReduceRight085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([9n]);
      let observedUndefinedInitial: boolean = false;
      let observedIndex: int = -1;
      let reducedValue = sourceArray.reduceRight<bigint | undefined>((previousValue: bigint | undefined,
        currentValue: bigint, currentIndex: int, _array: BigUint64Array): bigint | undefined => {
        observedUndefinedInitial = previousValue === undefined;
        observedIndex = currentIndex;
        return currentValue;
      }, undefined);
      expect(observedUndefinedInitial).assertTrue();
      expect(observedIndex).assertEqual(0);
      expect(reducedValue).assertEqual(9n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_REDUCE_RIGHT_8600
     * @tc.name testBigUint64ArrayReduceRight086
     * @tc.desc Verify reduceRight() without initial value throws TypeError on an empty subarray view
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayReduceRight086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parentArray = new BigUint64Array([1n, 2n, 3n]);
      let beginIndex: int = 1;
      let endIndex: int = 1;
      let sourceView = parentArray.subarray(beginIndex, endIndex);
      let callCount: int = 0;
      try {
        sourceView.reduceRight((previousValue: bigint, currentValue: bigint,
          _currentIndex: int, _array: BigUint64Array): bigint => {
          callCount = callCount + 1;
          return previousValue + currentValue;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
      expect(sourceView.length).assertEqual(0);
      expect(callCount).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_REDUCE_RIGHT_8700
     * @tc.name testBigUint64ArrayReduceRight087
     * @tc.desc Verify reduceRight() observes an unvisited lower value written through an overlapping sibling view
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayReduceRight087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sharedBuffer: ArrayBuffer = new ArrayBuffer(32);
      let sourceView = new BigUint64Array(sharedBuffer, 0, 3);
      let siblingView = new BigUint64Array(sharedBuffer, 8, 2);
      sourceView[0] = 1n;
      sourceView[1] = 2n;
      sourceView[2] = 3n;
      let observedLowerValue: bigint = 0n;
      let initialValue: bigint = 0n;
      let reducedValue = sourceView.reduceRight<bigint>((previousValue: bigint, currentValue: bigint,
        currentIndex: int, _array: BigUint64Array): bigint => {
        if (currentIndex === 2) {
          siblingView[0] = 9n;
        }
        if (currentIndex === 1) {
          observedLowerValue = currentValue;
        }
        return previousValue + currentValue;
      }, initialValue);
      expect(observedLowerValue).assertEqual(9n);
      expect(reducedValue).assertEqual(13n);
      expect(sourceView[1]).assertEqual(9n);
      expect(siblingView[0]).assertEqual(9n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_REDUCERIGHT_8800
     * @tc.name testBigUint64ArrayReduceRight088
     * @tc.desc Verify reduceRight preserves right to left order for binary integer values converted through BigInt
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayReduceRight088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = BigUint64Array.of(BigInt(0b1), BigInt(0b10), BigInt(0b11));
      let reducedValue = sourceArray.reduceRight<bigint>((result: bigint, value: bigint): bigint =>
      result * 10n + value, BigInt(0b0));
      expect(reducedValue).assertEqual(321n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_REDUCERIGHT_8900
     * @tc.name testBigUint64ArrayReduceRight089
     * @tc.desc Verify reduceRight preserves right to left order for octal integer values converted through BigInt
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayReduceRight089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = BigUint64Array.of(BigInt(0o1), BigInt(0o2), BigInt(0o3));
      let reducedValue = sourceArray.reduceRight<bigint>((result: bigint, value: bigint): bigint =>
      result * 10n + value, BigInt(0o0));
      expect(reducedValue).assertEqual(321n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_REDUCERIGHT_9000
     * @tc.name testBigUint64ArrayReduceRight090
     * @tc.desc Verify reduceRight preserves right to left order for hexadecimal integer values converted through BigInt
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayReduceRight090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = BigUint64Array.of(BigInt(0x1), BigInt(0x2), BigInt(0x3));
      let reducedValue = sourceArray.reduceRight<bigint>((result: bigint, value: bigint): bigint =>
      result * 10n + value, BigInt(0x0));
      expect(reducedValue).assertEqual(321n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_REDUCERIGHT_9100
     * @tc.name testBigUint64ArrayReduceRight091
     * @tc.desc Verify byte source converted by toInt supplies a right fold number initial value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayReduceRight091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let byteInitialSource: byte = 1;
      let sourceArray = BigUint64Array.of(10n, 20n);
      let reducedValue = sourceArray.reduceRight<number>((count: number, _value: bigint): number => count + 1,
        byteInitialSource.toInt());
      expect(reducedValue).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_REDUCERIGHT_9200
     * @tc.name testBigUint64ArrayReduceRight092
     * @tc.desc Verify number source converted by toInt supplies a truncated right fold initial value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayReduceRight092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let numberInitialSource: number = 1.9;
      let sourceArray = BigUint64Array.of(10n, 20n);
      let reducedValue = sourceArray.reduceRight<number>((count: number, _value: bigint): number => count + 1,
        numberInitialSource.toInt());
      expect(reducedValue).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_REDUCERIGHT_9300
     * @tc.name testBigUint64ArrayReduceRight093
     * @tc.desc Verify double source converted by toInt supplies a truncated right fold initial value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayReduceRight093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let doubleInitialSource: double = 1.9;
      let sourceArray = BigUint64Array.of(10n, 20n);
      let reducedValue = sourceArray.reduceRight<number>((count: number, _value: bigint): number => count + 1,
        doubleInitialSource.toInt());
      expect(reducedValue).assertEqual(3);
    });

  });
}
