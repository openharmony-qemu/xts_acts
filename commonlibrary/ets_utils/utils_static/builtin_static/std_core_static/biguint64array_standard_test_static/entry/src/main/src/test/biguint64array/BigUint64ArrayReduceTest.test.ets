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

class ReduceSummary {
  sum: bigint;
  count: int;

  constructor(sum: bigint, count: int) {
    this.sum = sum;
    this.count = count;
  }
}

class ReduceLabelSummary {
  sum: bigint;
  count: int;
  label: string;

  constructor(sum: bigint, count: int, label: string) {
    this.sum = sum;
    this.count = count;
    this.label = label;
  }
}

class ReduceBoundarySummary {
  maxValue: bigint;
  minValue: bigint;

  constructor(maxValue: bigint, minValue: bigint) {
    this.maxValue = maxValue;
    this.minValue = minValue;
  }
}

function sumReducerForReduce(previousValue: bigint, currentValue: bigint,
  _currentIndex: int, _array: BigUint64Array): bigint {
  return previousValue + currentValue;
}

export default function biguint64arrayReduceTest(): void {

  describe('BigUint64ArrayReduceTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_REDUCE_0010
     * @tc.name testBigUint64ArrayReduce001
     * @tc.desc Verify reduce() with a bigint initial value sums all elements
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayReduce001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n]);
      let reducedValue = sourceArray.reduce<bigint>((previousValue: bigint, currentValue: bigint,
        _currentIndex: int, _array: BigUint64Array): bigint => {
        return previousValue + currentValue;
      }, 0n);
      expect(reducedValue).assertEqual(6n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_REDUCE_0020
     * @tc.name testBigUint64ArrayReduce002
     * @tc.desc Verify reduce() with a string initial value preserves source order
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayReduce002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n]);
      let reducedText = sourceArray.reduce<string>((previousValue: string, currentValue: bigint,
        _currentIndex: int, _array: BigUint64Array): string => {
        return previousValue + currentValue.toString();
      }, '');
      expect(reducedText).assertEqual('123');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_REDUCE_0030
     * @tc.name testBigUint64ArrayReduce003
     * @tc.desc Verify reduce() with a number initial value can count callback calls
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayReduce003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([10n, 20n, 30n]);
      let callbackCount = sourceArray.reduce<number>((previousValue: number, _currentValue: bigint,
        _currentIndex: int, _array: BigUint64Array): number => {
        return previousValue + 1;
      }, 0);
      expect(callbackCount).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_REDUCE_0040
     * @tc.name testBigUint64ArrayReduce004
     * @tc.desc Verify reduce() with a boolean initial value supports logical OR accumulation
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayReduce004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([0n, 0n, 1n]);
      let hasPositiveValue = sourceArray.reduce<boolean>((previousValue: boolean, currentValue: bigint,
        _currentIndex: int, _array: BigUint64Array): boolean => {
        return previousValue || currentValue > 0n;
      }, false);
      expect(hasPositiveValue).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_REDUCE_0050
     * @tc.name testBigUint64ArrayReduce005
     * @tc.desc Verify reduce() with a class accumulator updates sum and count fields
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayReduce005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n]);
      let initialSummary = new ReduceSummary(0n, 0);
      let reducedSummary = sourceArray.reduce<ReduceSummary>((previousValue: ReduceSummary, currentValue: bigint,
        _currentIndex: int, _array: BigUint64Array): ReduceSummary => {
        return new ReduceSummary(previousValue.sum + currentValue, previousValue.count + 1);
      }, initialSummary);
      expect(reducedSummary.sum).assertEqual(6n);
      expect(reducedSummary.count).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_REDUCE_0060
     * @tc.name testBigUint64ArrayReduce006
     * @tc.desc Verify reduce() on an empty array returns the bigint initial value unchanged
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayReduce006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array(0);
      let callCount: int = 0;
      let reducedValue = sourceArray.reduce<bigint>((previousValue: bigint, currentValue: bigint,
        _currentIndex: int, _array: BigUint64Array): bigint => {
        callCount = callCount + 1;
        return previousValue + currentValue;
      }, 42n);
      expect(reducedValue).assertEqual(42n);
      expect(callCount).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_REDUCE_0070
     * @tc.name testBigUint64ArrayReduce007
     * @tc.desc Verify reduce() on an empty array returns the string initial value unchanged
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayReduce007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array(0);
      let reducedText = sourceArray.reduce<string>((previousValue: string, currentValue: bigint,
        _currentIndex: int, _array: BigUint64Array): string => {
        return previousValue + currentValue.toString();
      }, 'seed');
      expect(reducedText).assertEqual('seed');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_REDUCE_0080
     * @tc.name testBigUint64ArrayReduce008
     * @tc.desc Verify reduce() with an initial value invokes the callback once for a single element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayReduce008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([5n]);
      let callCount: int = 0;
      let reducedValue = sourceArray.reduce<bigint>((previousValue: bigint, currentValue: bigint,
        _currentIndex: int, _array: BigUint64Array): bigint => {
        callCount = callCount + 1;
        return previousValue + currentValue;
      }, 10n);
      expect(reducedValue).assertEqual(15n);
      expect(callCount).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_REDUCE_0090
     * @tc.name testBigUint64ArrayReduce009
     * @tc.desc Verify reduce() first callback receives initialValue and index zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayReduce009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([1n, 2n]);
      let firstPreviousValue: bigint = 0n;
      let firstIndex: int = -1;
      let reducedValue = sourceArray.reduce<bigint>((previousValue: bigint, currentValue: bigint,
        currentIndex: int, _array: BigUint64Array): bigint => {
        if (firstIndex === -1) {
          firstPreviousValue = previousValue;
          firstIndex = currentIndex;
        }
        return previousValue + currentValue;
      }, 100n);
      expect(firstPreviousValue).assertEqual(100n);
      expect(firstIndex).assertEqual(0);
      expect(reducedValue).assertEqual(103n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_REDUCE_0100
     * @tc.name testBigUint64ArrayReduce010
     * @tc.desc Verify reduce() with an initial value calls the callback length times
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayReduce010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      let callCount: int = 0;
      let reducedValue = sourceArray.reduce<bigint>((previousValue: bigint, currentValue: bigint,
        _currentIndex: int, _array: BigUint64Array): bigint => {
        callCount = callCount + 1;
        return previousValue + currentValue;
      }, 0n);
      expect(callCount).assertEqual(sourceArray.length);
      expect(reducedValue).assertEqual(15n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_REDUCE_0110
     * @tc.name testBigUint64ArrayReduce011
     * @tc.desc Verify reduce() keeps precision when initial value is max uint64
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayReduce011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([1n]);
      let maxUint64Value: bigint = 18446744073709551615n;
      let reducedValue = sourceArray.reduce<bigint>((previousValue: bigint, currentValue: bigint,
        _currentIndex: int, _array: BigUint64Array): bigint => {
        return previousValue + currentValue;
      }, maxUint64Value);
      expect(reducedValue).assertEqual(18446744073709551616n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_REDUCE_0120
     * @tc.name testBigUint64ArrayReduce012
     * @tc.desc Verify reduce() supports a negative bigint initial accumulator
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayReduce012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([5n, 5n]);
      let reducedValue = sourceArray.reduce<bigint>((previousValue: bigint, currentValue: bigint,
        _currentIndex: int, _array: BigUint64Array): bigint => {
        return previousValue + currentValue;
      }, -1n);
      expect(reducedValue).assertEqual(9n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_REDUCE_0130
     * @tc.name testBigUint64ArrayReduce013
     * @tc.desc Verify reduce() keeps precision from signed int64 max initial value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayReduce013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([1n]);
      let signedInt64MaxValue: bigint = 9223372036854775807n;
      let reducedValue = sourceArray.reduce<bigint>((previousValue: bigint, currentValue: bigint,
        _currentIndex: int, _array: BigUint64Array): bigint => {
        return previousValue + currentValue;
      }, signedInt64MaxValue);
      expect(reducedValue).assertEqual(9223372036854775808n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_REDUCE_0140
     * @tc.name testBigUint64ArrayReduce014
     * @tc.desc Verify reduce() can accumulate boundary min and max fields in a class object
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayReduce014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([50n, 10n, 100n]);
      let initialSummary = new ReduceBoundarySummary(0n, 18446744073709551615n);
      let reducedSummary = sourceArray.reduce<ReduceBoundarySummary>((previousValue: ReduceBoundarySummary,
        currentValue: bigint, _currentIndex: int, _array: BigUint64Array): ReduceBoundarySummary => {
        let nextMaxValue: bigint = previousValue.maxValue;
        let nextMinValue: bigint = previousValue.minValue;
        if (currentValue > nextMaxValue) {
          nextMaxValue = currentValue;
        }
        if (currentValue < nextMinValue) {
          nextMinValue = currentValue;
        }
        return new ReduceBoundarySummary(nextMaxValue, nextMinValue);
      }, initialSummary);
      expect(reducedSummary.maxValue).assertEqual(100n);
      expect(reducedSummary.minValue).assertEqual(10n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_REDUCE_0150
     * @tc.name testBigUint64ArrayReduce015
     * @tc.desc Verify reduce() string accumulator can include array length in each callback
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayReduce015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n]);
      let reducedText = sourceArray.reduce<string>((previousValue: string, _currentValue: bigint,
        _currentIndex: int, array: BigUint64Array): string => {
        return previousValue + array.length.toString();
      }, 'len:');
      expect(reducedText).assertEqual('len:333');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_REDUCE_0160
     * @tc.name testBigUint64ArrayReduce016
     * @tc.desc Verify reduce() number accumulator preserves a decimal initial value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayReduce016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n]);
      let reducedNumber = sourceArray.reduce<number>((previousValue: number, _currentValue: bigint,
        _currentIndex: int, _array: BigUint64Array): number => {
        return previousValue + 1;
      }, 2.5);
      expect(reducedNumber).assertEqual(5.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_REDUCE_0170
     * @tc.name testBigUint64ArrayReduce017
     * @tc.desc Verify reduce() boolean accumulator supports logical AND failure
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayReduce017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([1n, 2n, 0n]);
      let allPositive = sourceArray.reduce<boolean>((previousValue: boolean, currentValue: bigint,
        _currentIndex: int, _array: BigUint64Array): boolean => {
        return previousValue && currentValue > 0n;
      }, true);
      expect(allPositive).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_REDUCE_0180
     * @tc.name testBigUint64ArrayReduce018
     * @tc.desc Verify reduce() class accumulator can keep an unchanged label field
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayReduce018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n]);
      let initialSummary = new ReduceLabelSummary(0n, 0, 'seed');
      let reducedSummary = sourceArray.reduce<ReduceLabelSummary>((previousValue: ReduceLabelSummary,
        currentValue: bigint, _currentIndex: int, _array: BigUint64Array): ReduceLabelSummary => {
        return new ReduceLabelSummary(previousValue.sum + currentValue, previousValue.count + 1, previousValue.label);
      }, initialSummary);
      expect(reducedSummary.sum).assertEqual(6n);
      expect(reducedSummary.count).assertEqual(3);
      expect(reducedSummary.label).assertEqual('seed');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_REDUCE_0190
     * @tc.name testBigUint64ArrayReduce019
     * @tc.desc Verify reduce() callback can keep returning the previous bigint accumulator
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayReduce019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n]);
      let reducedValue = sourceArray.reduce<bigint>((previousValue: bigint, _currentValue: bigint,
        _currentIndex: int, _array: BigUint64Array): bigint => {
        return previousValue;
      }, 100n);
      expect(reducedValue).assertEqual(100n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_REDUCE_0200
     * @tc.name testBigUint64ArrayReduce020
     * @tc.desc Verify reduce() callback can replace the accumulator with current value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayReduce020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([10n, 20n, 30n]);
      let reducedValue = sourceArray.reduce<bigint>((_previousValue: bigint, currentValue: bigint,
        _currentIndex: int, _array: BigUint64Array): bigint => {
        return currentValue;
      }, 0n);
      expect(reducedValue).assertEqual(30n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_REDUCE_0210
     * @tc.name testBigUint64ArrayReduce021
     * @tc.desc Verify reduce() callback can multiply bigint values with an initial one
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayReduce021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([2n, 3n, 4n]);
      let reducedValue = sourceArray.reduce<bigint>((previousValue: bigint, currentValue: bigint,
        _currentIndex: int, _array: BigUint64Array): bigint => {
        return previousValue * currentValue;
      }, 1n);
      expect(reducedValue).assertEqual(24n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_REDUCE_0220
     * @tc.name testBigUint64ArrayReduce022
     * @tc.desc Verify reduce() callback performs left-to-right subtraction with an initial value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayReduce022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n]);
      let reducedValue = sourceArray.reduce<bigint>((previousValue: bigint, currentValue: bigint,
        _currentIndex: int, _array: BigUint64Array): bigint => {
        return previousValue - currentValue;
      }, 10n);
      expect(reducedValue).assertEqual(4n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_REDUCE_0230
     * @tc.name testBigUint64ArrayReduce023
     * @tc.desc Verify reduce() callback can select the maximum bigint value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayReduce023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([5n, 100n, 50n]);
      let reducedValue = sourceArray.reduce<bigint>((previousValue: bigint, currentValue: bigint,
        _currentIndex: int, _array: BigUint64Array): bigint => {
        if (currentValue > previousValue) {
          return currentValue;
        }
        return previousValue;
      }, 0n);
      expect(reducedValue).assertEqual(100n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_REDUCE_0240
     * @tc.name testBigUint64ArrayReduce024
     * @tc.desc Verify reduce() callback can select the minimum bigint value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayReduce024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([100n, 5n, 50n]);
      let reducedValue = sourceArray.reduce<bigint>((previousValue: bigint, currentValue: bigint,
        _currentIndex: int, _array: BigUint64Array): bigint => {
        if (currentValue < previousValue) {
          return currentValue;
        }
        return previousValue;
      }, 18446744073709551615n);
      expect(reducedValue).assertEqual(5n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_REDUCE_0250
     * @tc.name testBigUint64ArrayReduce025
     * @tc.desc Verify reduce() callback can compute bitwise AND across values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayReduce025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([7n, 3n, 1n]);
      let reducedValue = sourceArray.reduce<bigint>((previousValue: bigint, currentValue: bigint,
        _currentIndex: int, _array: BigUint64Array): bigint => {
        return previousValue & currentValue;
      }, 7n);
      expect(reducedValue).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_REDUCE_0260
     * @tc.name testBigUint64ArrayReduce026
     * @tc.desc Verify reduce() callback can compute bitwise OR across values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayReduce026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([1n, 2n, 4n]);
      let reducedValue = sourceArray.reduce<bigint>((previousValue: bigint, currentValue: bigint,
        _currentIndex: int, _array: BigUint64Array): bigint => {
        return previousValue | currentValue;
      }, 0n);
      expect(reducedValue).assertEqual(7n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_REDUCE_0270
     * @tc.name testBigUint64ArrayReduce027
     * @tc.desc Verify reduce() callback can compute bitwise XOR across values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayReduce027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n]);
      let reducedValue = sourceArray.reduce<bigint>((previousValue: bigint, currentValue: bigint,
        _currentIndex: int, _array: BigUint64Array): bigint => {
        return previousValue ^ currentValue;
      }, 0n);
      expect(reducedValue).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_REDUCE_0280
     * @tc.name testBigUint64ArrayReduce028
     * @tc.desc Verify reduce() callback can left shift the bigint accumulator
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayReduce028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n]);
      let reducedValue = sourceArray.reduce<bigint>((previousValue: bigint, _currentValue: bigint,
        _currentIndex: int, _array: BigUint64Array): bigint => {
        return previousValue << 1n;
      }, 1n);
      expect(reducedValue).assertEqual(8n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_REDUCE_0290
     * @tc.name testBigUint64ArrayReduce029
     * @tc.desc Verify reduce() callback can move the accumulator into a negative bigint range
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayReduce029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([10n, 20n, 30n]);
      let reducedValue = sourceArray.reduce<bigint>((previousValue: bigint, currentValue: bigint,
        _currentIndex: int, _array: BigUint64Array): bigint => {
        return previousValue - currentValue * 2n;
      }, 0n);
      expect(reducedValue).assertEqual(-120n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_REDUCE_0300
     * @tc.name testBigUint64ArrayReduce030
     * @tc.desc Verify reduce() callback can use currentIndex to select even positions
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayReduce030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([10n, 20n, 30n, 40n]);
      let reducedValue = sourceArray.reduce<bigint>((previousValue: bigint, currentValue: bigint,
        currentIndex: int, _array: BigUint64Array): bigint => {
        if (currentIndex % 2 === 0) {
          return previousValue + currentValue;
        }
        return previousValue;
      }, 0n);
      expect(reducedValue).assertEqual(40n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_REDUCE_0310
     * @tc.name testBigUint64ArrayReduce031
     * @tc.desc Verify reduce() callback can use currentIndex to skip early positions
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayReduce031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([100n, 200n, 1n, 2n]);
      let reducedValue = sourceArray.reduce<bigint>((previousValue: bigint, currentValue: bigint,
        currentIndex: int, _array: BigUint64Array): bigint => {
        if (currentIndex >= 2) {
          return previousValue + currentValue;
        }
        return previousValue;
      }, 0n);
      expect(reducedValue).assertEqual(3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_REDUCE_0320
     * @tc.name testBigUint64ArrayReduce032
     * @tc.desc Verify reduce() callback can read array length from the array parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayReduce032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      let reducedValue = sourceArray.reduce<bigint>((previousValue: bigint, _currentValue: bigint,
        _currentIndex: int, array: BigUint64Array): bigint => {
        return previousValue + BigInt(array.length);
      }, 0n);
      expect(reducedValue).assertEqual(25n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_REDUCE_0330
     * @tc.name testBigUint64ArrayReduce033
     * @tc.desc Verify reduce() callback can read the current element through array index
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayReduce033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n]);
      let reducedValue = sourceArray.reduce<bigint>((previousValue: bigint, _currentValue: bigint,
        currentIndex: int, array: BigUint64Array): bigint => {
        return previousValue + array[currentIndex];
      }, 0n);
      expect(reducedValue).assertEqual(6n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_REDUCE_0340
     * @tc.name testBigUint64ArrayReduce034
     * @tc.desc Verify reduce() callback can combine element index and array parameters
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayReduce034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([10n, 20n, 30n]);
      let reducedValue = sourceArray.reduce<bigint>((previousValue: bigint, currentValue: bigint,
        currentIndex: int, array: BigUint64Array): bigint => {
        return previousValue + currentValue * BigInt(currentIndex + 1) + BigInt(array.length - 3);
      }, 0n);
      expect(reducedValue).assertEqual(140n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_REDUCE_0350
     * @tc.name testBigUint64ArrayReduce035
     * @tc.desc Verify reduce() callback can capture an external bigint multiplier
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayReduce035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n]);
      let multiplier: bigint = 10n;
      let reducedValue = sourceArray.reduce<bigint>((previousValue: bigint, currentValue: bigint,
        _currentIndex: int, _array: BigUint64Array): bigint => {
        return previousValue + currentValue * multiplier;
      }, 0n);
      expect(reducedValue).assertEqual(60n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_REDUCE_0360
     * @tc.name testBigUint64ArrayReduce036
     * @tc.desc Verify reduce() callback can call another reduce() operation
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayReduce036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let outerArray = new BigUint64Array([1n, 2n]);
      let innerArray = new BigUint64Array([10n, 20n]);
      let reducedValue = outerArray.reduce<bigint>((previousValue: bigint, currentValue: bigint,
        _currentIndex: int, _array: BigUint64Array): bigint => {
        let innerSum = innerArray.reduce<bigint>((innerPreviousValue: bigint, innerCurrentValue: bigint,
          _innerCurrentIndex: int, _innerArray: BigUint64Array): bigint => {
          return innerPreviousValue + innerCurrentValue;
        }, 0n);
        return previousValue + currentValue + innerSum;
      }, 0n);
      expect(reducedValue).assertEqual(63n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_REDUCE_0370
     * @tc.name testBigUint64ArrayReduce037
     * @tc.desc Verify reduce() callback can read another BigUint64Array as weights
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayReduce037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n]);
      let weightArray = new BigUint64Array([10n, 100n, 1000n]);
      let reducedValue = sourceArray.reduce<bigint>((previousValue: bigint, currentValue: bigint,
        currentIndex: int, _array: BigUint64Array): bigint => {
        return previousValue + currentValue * weightArray[currentIndex];
      }, 0n);
      expect(reducedValue).assertEqual(3210n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_REDUCE_0380
     * @tc.name testBigUint64ArrayReduce038
     * @tc.desc Verify reduce() callback can divide the bigint accumulator by each value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayReduce038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([2n, 3n, 4n]);
      let reducedValue = sourceArray.reduce<bigint>((previousValue: bigint, currentValue: bigint,
        _currentIndex: int, _array: BigUint64Array): bigint => {
        return previousValue / currentValue;
      }, 100n);
      expect(reducedValue).assertEqual(4n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_REDUCE_0390
     * @tc.name testBigUint64ArrayReduce039
     * @tc.desc Verify reduce() on zero elements keeps a nonzero initial value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayReduce039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([0n, 0n, 0n]);
      let reducedValue = sourceArray.reduce<bigint>((previousValue: bigint, currentValue: bigint,
        _currentIndex: int, _array: BigUint64Array): bigint => {
        return previousValue + currentValue;
      }, 100n);
      expect(reducedValue).assertEqual(100n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_REDUCE_0400
     * @tc.name testBigUint64ArrayReduce040
     * @tc.desc Verify reduce() can aggregate one hundred default zero elements
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayReduce040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array(100);
      let callCount: int = 0;
      let reducedValue = sourceArray.reduce<bigint>((previousValue: bigint, currentValue: bigint,
        _currentIndex: int, _array: BigUint64Array): bigint => {
        callCount = callCount + 1;
        return previousValue + currentValue;
      }, 0n);
      expect(reducedValue).assertEqual(0n);
      expect(callCount).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_REDUCE_0410
     * @tc.name testBigUint64ArrayReduce041
     * @tc.desc Verify reduce() callback receives current value before current index mutation
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayReduce041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n]);
      let reducedValue = sourceArray.reduce<bigint>((previousValue: bigint, currentValue: bigint,
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_REDUCE_0420
     * @tc.name testBigUint64ArrayReduce042
     * @tc.desc Verify reduce() does not change source length during a pure aggregation
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayReduce042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n]);
      let lengthBefore: int = sourceArray.length;
      let reducedValue = sourceArray.reduce<bigint>((previousValue: bigint, currentValue: bigint,
        _currentIndex: int, _array: BigUint64Array): bigint => {
        return previousValue + currentValue;
      }, 0n);
      expect(reducedValue).assertEqual(6n);
      expect(sourceArray.length).assertEqual(lengthBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_REDUCE_0430
     * @tc.name testBigUint64ArrayReduce043
     * @tc.desc Verify reduce() does not change source element values during a pure aggregation
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayReduce043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([10n, 20n, 30n]);
      let reducedValue = sourceArray.reduce<bigint>((previousValue: bigint, currentValue: bigint,
        _currentIndex: int, _array: BigUint64Array): bigint => {
        return previousValue + currentValue;
      }, 0n);
      expect(reducedValue).assertEqual(60n);
      expect(sourceArray[0]).assertEqual(10n);
      expect(sourceArray[1]).assertEqual(20n);
      expect(sourceArray[2]).assertEqual(30n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_REDUCE_0440
     * @tc.name testBigUint64ArrayReduce044
     * @tc.desc Verify reduce() returns stable results across repeated calls on the same array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayReduce044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n]);
      let firstValue = sourceArray.reduce<bigint>(sumReducerForReduce, 0n);
      let secondValue = sourceArray.reduce<bigint>(sumReducerForReduce, 0n);
      expect(firstValue).assertEqual(6n);
      expect(secondValue).assertEqual(6n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_REDUCE_0450
     * @tc.name testBigUint64ArrayReduce045
     * @tc.desc Verify reduce() without initial value sums multiple elements
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayReduce045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([10n, 20n, 30n]);
      let reducedValue = sourceArray.reduce((previousValue: bigint, currentValue: bigint,
        _currentIndex: int, _array: BigUint64Array): bigint => {
        return previousValue + currentValue;
      });
      expect(reducedValue).assertEqual(60n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_REDUCE_0460
     * @tc.name testBigUint64ArrayReduce046
     * @tc.desc Verify reduce() without initial value handles the two element minimum callback path
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayReduce046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([5n, 7n]);
      let reducedValue = sourceArray.reduce((previousValue: bigint, currentValue: bigint,
        _currentIndex: int, _array: BigUint64Array): bigint => {
        return previousValue + currentValue;
      });
      expect(reducedValue).assertEqual(12n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_REDUCE_0470
     * @tc.name testBigUint64ArrayReduce047
     * @tc.desc Verify reduce() without initial value returns a single element directly
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayReduce047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([42n]);
      let callCount: int = 0;
      let reducedValue = sourceArray.reduce((previousValue: bigint, currentValue: bigint,
        _currentIndex: int, _array: BigUint64Array): bigint => {
        callCount = callCount + 1;
        return previousValue + currentValue;
      });
      expect(reducedValue).assertEqual(42n);
      expect(callCount).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_REDUCE_0480
     * @tc.name testBigUint64ArrayReduce048
     * @tc.desc Verify reduce() without initial value starts with element zero and index one
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayReduce048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([100n, 200n, 300n]);
      let firstPreviousValue: bigint = 0n;
      let firstIndex: int = -1;
      let reducedValue = sourceArray.reduce((previousValue: bigint, currentValue: bigint,
        currentIndex: int, _array: BigUint64Array): bigint => {
        if (firstIndex === -1) {
          firstPreviousValue = previousValue;
          firstIndex = currentIndex;
        }
        return previousValue + currentValue;
      });
      expect(firstPreviousValue).assertEqual(100n);
      expect(firstIndex).assertEqual(1);
      expect(reducedValue).assertEqual(600n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_REDUCE_0490
     * @tc.name testBigUint64ArrayReduce049
     * @tc.desc Verify reduce() without initial value passes the second element as first currentValue
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayReduce049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([5n, 8n, 3n]);
      let firstCurrentValue: bigint = 0n;
      let reducedValue = sourceArray.reduce((previousValue: bigint, currentValue: bigint,
        _currentIndex: int, _array: BigUint64Array): bigint => {
        if (firstCurrentValue === 0n) {
          firstCurrentValue = currentValue;
        }
        return previousValue + currentValue;
      });
      expect(firstCurrentValue).assertEqual(8n);
      expect(reducedValue).assertEqual(16n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_REDUCE_0500
     * @tc.name testBigUint64ArrayReduce050
     * @tc.desc Verify reduce() without initial value calls callback length minus one times
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayReduce050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      let callCount: int = 0;
      let reducedValue = sourceArray.reduce((previousValue: bigint, currentValue: bigint,
        _currentIndex: int, _array: BigUint64Array): bigint => {
        callCount = callCount + 1;
        return previousValue + currentValue;
      });
      expect(callCount).assertEqual(sourceArray.length - 1);
      expect(reducedValue).assertEqual(15n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_REDUCE_0510
     * @tc.name testBigUint64ArrayReduce051
     * @tc.desc Verify reduce() without initial value visits currentIndex values in ascending order
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayReduce051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n, 4n]);
      let indexLog: int[] = [];
      let reducedValue = sourceArray.reduce((previousValue: bigint, currentValue: bigint,
        currentIndex: int, _array: BigUint64Array): bigint => {
        indexLog.push(currentIndex);
        return previousValue + currentValue;
      });
      expect(reducedValue).assertEqual(10n);
      expect(indexLog[0]).assertEqual(1);
      expect(indexLog[1]).assertEqual(2);
      expect(indexLog[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_REDUCE_0520
     * @tc.name testBigUint64ArrayReduce052
     * @tc.desc Verify reduce() without initial value passes accumulated previous values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayReduce052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([2n, 3n, 4n, 5n]);
      let previousValueAtIndexTwo: bigint = 0n;
      let previousValueAtIndexThree: bigint = 0n;
      let reducedValue = sourceArray.reduce((previousValue: bigint, currentValue: bigint,
        currentIndex: int, _array: BigUint64Array): bigint => {
        if (currentIndex === 2) {
          previousValueAtIndexTwo = previousValue;
        }
        if (currentIndex === 3) {
          previousValueAtIndexThree = previousValue;
        }
        return previousValue + currentValue;
      });
      expect(previousValueAtIndexTwo).assertEqual(5n);
      expect(previousValueAtIndexThree).assertEqual(9n);
      expect(reducedValue).assertEqual(14n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_REDUCE_0530
     * @tc.name testBigUint64ArrayReduce053
     * @tc.desc Verify reduce() callback receives the same array object through the array parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayReduce053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n]);
      let sameArrayReference: boolean = true;
      let reducedValue = sourceArray.reduce((previousValue: bigint, currentValue: bigint,
        _currentIndex: int, array: BigUint64Array): bigint => {
        if (array !== sourceArray) {
          sameArrayReference = false;
        }
        return previousValue + currentValue;
      });
      expect(sameArrayReference).assertTrue();
      expect(reducedValue).assertEqual(6n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_REDUCE_0540
     * @tc.name testBigUint64ArrayReduce054
     * @tc.desc Verify reduce() callback can read source length through the array parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayReduce054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      let observedLength: int = 0;
      let reducedValue = sourceArray.reduce((previousValue: bigint, currentValue: bigint,
        _currentIndex: int, array: BigUint64Array): bigint => {
        observedLength = array.length;
        return previousValue + currentValue;
      });
      expect(observedLength).assertEqual(5);
      expect(reducedValue).assertEqual(15n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_REDUCE_0550
     * @tc.name testBigUint64ArrayReduce055
     * @tc.desc Verify reduce() callback currentValue equals array[currentIndex]
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayReduce055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([5n, 10n, 15n]);
      let valuesMatch: boolean = true;
      let reducedValue = sourceArray.reduce((previousValue: bigint, currentValue: bigint,
        currentIndex: int, array: BigUint64Array): bigint => {
        if (array[currentIndex] !== currentValue) {
          valuesMatch = false;
        }
        return previousValue + currentValue;
      });
      expect(valuesMatch).assertTrue();
      expect(reducedValue).assertEqual(30n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_REDUCE_0560
     * @tc.name testBigUint64ArrayReduce056
     * @tc.desc Verify reduce() without initial value can collect current values in left-to-right order
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayReduce056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([10n, 20n, 30n]);
      let currentValues: bigint[] = [];
      let reducedValue = sourceArray.reduce((previousValue: bigint, currentValue: bigint,
        _currentIndex: int, _array: BigUint64Array): bigint => {
        currentValues.push(currentValue);
        return previousValue + currentValue;
      });
      expect(reducedValue).assertEqual(60n);
      expect(currentValues[0]).assertEqual(20n);
      expect(currentValues[1]).assertEqual(30n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_REDUCE_0570
     * @tc.name testBigUint64ArrayReduce057
     * @tc.desc Verify reduce() without initial value returns the first element when callback returns previous
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayReduce057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([42n, 10n, 20n]);
      let reducedValue = sourceArray.reduce((previousValue: bigint, _currentValue: bigint,
        _currentIndex: int, _array: BigUint64Array): bigint => {
        return previousValue;
      });
      expect(reducedValue).assertEqual(42n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_REDUCE_0580
     * @tc.name testBigUint64ArrayReduce058
     * @tc.desc Verify reduce() without initial value returns the last element when callback returns current
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayReduce058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([10n, 20n, 42n]);
      let reducedValue = sourceArray.reduce((_previousValue: bigint, currentValue: bigint,
        _currentIndex: int, _array: BigUint64Array): bigint => {
        return currentValue;
      });
      expect(reducedValue).assertEqual(42n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_REDUCE_0590
     * @tc.name testBigUint64ArrayReduce059
     * @tc.desc Verify reduce() without initial value multiplies all elements left to right
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayReduce059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([2n, 3n, 4n]);
      let reducedValue = sourceArray.reduce((previousValue: bigint, currentValue: bigint,
        _currentIndex: int, _array: BigUint64Array): bigint => {
        return previousValue * currentValue;
      });
      expect(reducedValue).assertEqual(24n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_REDUCE_0600
     * @tc.name testBigUint64ArrayReduce060
     * @tc.desc Verify reduce() without initial value subtracts values left to right
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayReduce060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([100n, 30n, 20n]);
      let reducedValue = sourceArray.reduce((previousValue: bigint, currentValue: bigint,
        _currentIndex: int, _array: BigUint64Array): bigint => {
        return previousValue - currentValue;
      });
      expect(reducedValue).assertEqual(50n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_REDUCE_0610
     * @tc.name testBigUint64ArrayReduce061
     * @tc.desc Verify reduce() without initial value can compute bitwise OR
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayReduce061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([1n, 2n, 4n, 8n]);
      let reducedValue = sourceArray.reduce((previousValue: bigint, currentValue: bigint,
        _currentIndex: int, _array: BigUint64Array): bigint => {
        return previousValue | currentValue;
      });
      expect(reducedValue).assertEqual(15n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_REDUCE_0620
     * @tc.name testBigUint64ArrayReduce062
     * @tc.desc Verify reduce() without initial value keeps precision for max uint64 plus one
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayReduce062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([18446744073709551615n, 1n]);
      let reducedValue = sourceArray.reduce((previousValue: bigint, currentValue: bigint,
        _currentIndex: int, _array: BigUint64Array): bigint => {
        return previousValue + currentValue;
      });
      expect(reducedValue).assertEqual(18446744073709551616n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_REDUCE_0630
     * @tc.name testBigUint64ArrayReduce063
     * @tc.desc Verify reduce() without initial value returns max uint64 for a single -1n input
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayReduce063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([-1n]);
      let callCount: int = 0;
      let reducedValue = sourceArray.reduce((previousValue: bigint, currentValue: bigint,
        _currentIndex: int, _array: BigUint64Array): bigint => {
        callCount = callCount + 1;
        return previousValue + currentValue;
      });
      expect(reducedValue).assertEqual(18446744073709551615n);
      expect(callCount).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_REDUCE_0640
     * @tc.name testBigUint64ArrayReduce064
     * @tc.desc Verify reduce() without initial value returns max uint64 minus one for a single -2n input
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayReduce064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([-2n]);
      let reducedValue = sourceArray.reduce((_previousValue: bigint, _currentValue: bigint,
        _currentIndex: int, _array: BigUint64Array): bigint => {
        return 0n;
      });
      expect(reducedValue).assertEqual(18446744073709551614n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_REDUCE_0650
     * @tc.name testBigUint64ArrayReduce065
     * @tc.desc Verify reduce() without initial value sums five sequential elements
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayReduce065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      let reducedValue = sourceArray.reduce(sumReducerForReduce);
      expect(reducedValue).assertEqual(15n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_REDUCE_0660
     * @tc.name testBigUint64ArrayReduce066
     * @tc.desc Verify reduce() without initial value handles ten elements in source order
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayReduce066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n, 4n, 5n, 6n, 7n, 8n, 9n, 10n]);
      let reducedValue = sourceArray.reduce(sumReducerForReduce);
      expect(reducedValue).assertEqual(55n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_REDUCE_0670
     * @tc.name testBigUint64ArrayReduce067
     * @tc.desc Verify reduce() without initial value observes 2^64 input wrapped to zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayReduce067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([1n, 18446744073709551616n]);
      let reducedValue = sourceArray.reduce(sumReducerForReduce);
      expect(reducedValue).assertEqual(1n);
      expect(sourceArray[1]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_REDUCE_0680
     * @tc.name testBigUint64ArrayReduce068
     * @tc.desc Verify reduce() result can be used in a later bigint addition
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayReduce068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([5n, 5n, 5n]);
      let reducedValue = sourceArray.reduce(sumReducerForReduce);
      let afterAddition = reducedValue + 10n;
      expect(afterAddition).assertEqual(25n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_REDUCE_0690
     * @tc.name testBigUint64ArrayReduce069
     * @tc.desc Verify multiple reduce() calls can return independent bigint results
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayReduce069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n]);
      let sumValue = sourceArray.reduce(sumReducerForReduce);
      let productValue = sourceArray.reduce((previousValue: bigint, currentValue: bigint,
        _currentIndex: int, _array: BigUint64Array): bigint => {
        return previousValue * currentValue;
      });
      expect(sumValue).assertEqual(6n);
      expect(productValue).assertEqual(6n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_REDUCE_0700
     * @tc.name testBigUint64ArrayReduce070
     * @tc.desc Verify reduce() callback can set an external boolean side effect
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayReduce070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([1n, 2n, 100n, 3n]);
      let foundLargeValue: boolean = false;
      let reducedValue = sourceArray.reduce((previousValue: bigint, currentValue: bigint,
        _currentIndex: int, _array: BigUint64Array): bigint => {
        if (currentValue > 50n) {
          foundLargeValue = true;
        }
        return previousValue + currentValue;
      });
      expect(foundLargeValue).assertTrue();
      expect(reducedValue).assertEqual(106n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_REDUCE_0710
     * @tc.name testBigUint64ArrayReduce071
     * @tc.desc Verify reduce() callback can use an external step counter in branches
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayReduce071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n, 4n]);
      let stepCount: int = 0;
      let reducedValue = sourceArray.reduce((previousValue: bigint, currentValue: bigint,
        _currentIndex: int, _array: BigUint64Array): bigint => {
        stepCount = stepCount + 1;
        if (stepCount >= 2) {
          return previousValue - currentValue;
        }
        return previousValue + currentValue;
      });
      expect(reducedValue).assertEqual(-4n);
      expect(stepCount).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_REDUCE_0720
     * @tc.name testBigUint64ArrayReduce072
     * @tc.desc Verify changing an external array reference does not affect reduce() iteration
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayReduce072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n]);
      let externalArray = new BigUint64Array([0n]);
      let reducedValue = sourceArray.reduce((previousValue: bigint, currentValue: bigint,
        _currentIndex: int, _array: BigUint64Array): bigint => {
        externalArray = new BigUint64Array([99n, 99n, 99n]);
        return previousValue + currentValue;
      });
      expect(reducedValue).assertEqual(6n);
      expect(externalArray[0]).assertEqual(99n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_REDUCE_0730
     * @tc.name testBigUint64ArrayReduce073
     * @tc.desc Verify reduce() with bigint initial value returns runtime typeof bigint
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayReduce073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([1n, 2n]);
      let reducedValue = sourceArray.reduce<bigint>(sumReducerForReduce, 0n);
      expect(typeof reducedValue).assertEqual('bigint');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_REDUCE_0740
     * @tc.name testBigUint64ArrayReduce074
     * @tc.desc Verify reduce() with string initial value returns runtime typeof string
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayReduce074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([1n]);
      let reducedText = sourceArray.reduce<string>((previousValue: string, currentValue: bigint,
        _currentIndex: int, _array: BigUint64Array): string => {
        return previousValue + currentValue.toString();
      }, '');
      expect(typeof reducedText).assertEqual('string');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_REDUCE_0750
     * @tc.name testBigUint64ArrayReduce075
     * @tc.desc Verify reduce() with number initial value returns runtime typeof number
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayReduce075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([1n]);
      let reducedNumber = sourceArray.reduce<number>((previousValue: number, _currentValue: bigint,
        _currentIndex: int, _array: BigUint64Array): number => {
        return previousValue + 1;
      }, 0);
      expect(typeof reducedNumber).assertEqual('number');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_REDUCE_0760
     * @tc.name testBigUint64ArrayReduce076
     * @tc.desc Verify reduce() with boolean initial value returns runtime typeof boolean
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayReduce076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([1n]);
      let reducedBoolean = sourceArray.reduce<boolean>((previousValue: boolean, currentValue: bigint,
        _currentIndex: int, _array: BigUint64Array): boolean => {
        return previousValue && currentValue > 0n;
      }, true);
      expect(typeof reducedBoolean).assertEqual('boolean');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_REDUCE_0770
     * @tc.name testBigUint64ArrayReduce077
     * @tc.desc Verify reduce() without initial value throws TypeError on a zero length array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayReduce077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array(0);
      try {
        sourceArray.reduce((previousValue: bigint, currentValue: bigint,
          _currentIndex: int, _array: BigUint64Array): bigint => {
          return previousValue + currentValue;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_REDUCE_0780
     * @tc.name testBigUint64ArrayReduce078
     * @tc.desc Verify reduce() without initial value throws TypeError on default empty array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayReduce078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array();
      try {
        sourceArray.reduce((previousValue: bigint, currentValue: bigint,
          _currentIndex: int, _array: BigUint64Array): bigint => {
          return previousValue + currentValue;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_REDUCE_0790
     * @tc.name testBigUint64ArrayReduce079
     * @tc.desc Verify reduce() without initial value throws TypeError on zero byte ArrayBuffer view
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayReduce079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array(new ArrayBuffer(0));
      try {
        sourceArray.reduce((previousValue: bigint, currentValue: bigint,
          _currentIndex: int, _array: BigUint64Array): bigint => {
          return previousValue + currentValue;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_REDUCE_0800
     * @tc.name testBigUint64ArrayReduce080
     * @tc.desc Verify reduce() empty array error is thrown before callback invocation
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayReduce080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array(0);
      let callCount: int = 0;
      try {
        sourceArray.reduce((previousValue: bigint, currentValue: bigint,
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_REDUCE_0810
     * @tc.name testBigUint64ArrayReduce081
     * @tc.desc Verify reduce() propagates an Error thrown inside the callback
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayReduce081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n]);
      try {
        sourceArray.reduce<bigint>((previousValue: bigint, currentValue: bigint,
          currentIndex: int, _array: BigUint64Array): bigint => {
          if (currentIndex === 1) {
            throw new Error('callback error');
          }
          return previousValue + currentValue;
        }, 0n);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      expect(sourceArray[0]).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_REDUCE_0820
     * @tc.name testBigUint64ArrayReduce082
     * @tc.desc Verify reduce() propagates a TypeError thrown inside the callback
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayReduce082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([1n, 2n]);
      try {
        sourceArray.reduce<bigint>((_previousValue: bigint, _currentValue: bigint,
          _currentIndex: int, _array: BigUint64Array): bigint => {
          throw new TypeError('callback type error');
        }, 0n);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_REDUCE_0830
     * @tc.name testBigUint64ArrayReduce083
     * @tc.desc Verify reduce() propagates a RangeError thrown inside the callback
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayReduce083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([1n, 2n]);
      try {
        sourceArray.reduce((previousValue: bigint, currentValue: bigint,
          _currentIndex: int, _array: BigUint64Array): bigint => {
          if (currentValue === 2n) {
            throw new RangeError('callback range error');
          }
          return previousValue + currentValue;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_REDUCE_0840
     * @tc.name testBigUint64ArrayReduce084
     * @tc.desc Verify reduce() stops immediately when the first callback throws Error
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayReduce084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n]);
      let callCount: int = 0;
      try {
        sourceArray.reduce<bigint>((previousValue: bigint, currentValue: bigint,
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_REDUCE_0850
     * @tc.name testBigUint64ArrayReduce085
     * @tc.desc Verify reduce() stops when a later callback throws Error
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayReduce085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n, 4n]);
      let callCount: int = 0;
      try {
        sourceArray.reduce<bigint>((previousValue: bigint, currentValue: bigint,
          _currentIndex: int, _array: BigUint64Array): bigint => {
          callCount = callCount + 1;
          if (callCount === 2) {
            throw new Error('second callback error');
          }
          return previousValue + currentValue;
        }, 0n);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      expect(callCount).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_REDUCE_0860
     * @tc.name testBigUint64ArrayReduce086
     * @tc.desc Verify reduce() propagates an Error thrown on the last callback
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayReduce086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n]);
      let lastIndex: int = -1;
      try {
        sourceArray.reduce<bigint>((previousValue: bigint, currentValue: bigint,
          currentIndex: int, _array: BigUint64Array): bigint => {
          lastIndex = currentIndex;
          if (currentIndex === 2) {
            throw new Error('last callback error');
          }
          return previousValue + currentValue;
        }, 0n);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      expect(lastIndex).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_REDUCE_0870
     * @tc.name testBigUint64ArrayReduce087
     * @tc.desc Verify reduce() preserves the message of an Error thrown by callback
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayReduce087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([1n]);
      let errorMessage: string = '';
      try {
        sourceArray.reduce<bigint>((_previousValue: bigint, _currentValue: bigint,
          _currentIndex: int, _array: BigUint64Array): bigint => {
          throw new Error('custom reduce message');
        }, 0n);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
        errorMessage = e.message;
      }
      expect(errorMessage).assertEqual('custom reduce message');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_REDUCE_0880
     * @tc.name testBigUint64ArrayReduce088
     * @tc.desc Verify reduce() without initial value does not call callback for a single element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayReduce088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([77n]);
      let reducedValue = sourceArray.reduce((_previousValue: bigint, _currentValue: bigint,
        _currentIndex: int, _array: BigUint64Array): bigint => {
        throw new Error('callback should not run');
      });
      expect(reducedValue).assertEqual(77n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_REDUCE_0890
     * @tc.name testBigUint64ArrayReduce089
     * @tc.desc Verify reduce() with initial value can append comma separated decimal strings
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayReduce089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([100n, 200n, 300n]);
      let reducedText = sourceArray.reduce<string>((previousValue: string, currentValue: bigint,
        currentIndex: int, _array: BigUint64Array): string => {
        if (currentIndex === 0) {
          return currentValue.toString();
        }
        return previousValue + ',' + currentValue.toString();
      }, '');
      expect(reducedText).assertEqual('100,200,300');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_REDUCE_0900
     * @tc.name testBigUint64ArrayReduce090
     * @tc.desc Verify reduce() with initial value can derive a number result from indexes
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayReduce090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([10n, 20n, 30n]);
      let reducedNumber = sourceArray.reduce<number>((previousValue: number, _currentValue: bigint,
        currentIndex: int, _array: BigUint64Array): number => {
        return previousValue + currentIndex + 1;
      }, 0);
      expect(reducedNumber).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_REDUCE_0910
     * @tc.name testBigUint64ArrayReduce091
     * @tc.desc Verify reduce() with initial value can reuse the same class accumulator instance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayReduce091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n]);
      let initialSummary = new ReduceSummary(100n, 50);
      let reducedSummary = sourceArray.reduce<ReduceSummary>((previousValue: ReduceSummary, _currentValue: bigint,
        _currentIndex: int, _array: BigUint64Array): ReduceSummary => {
        return previousValue;
      }, initialSummary);
      expect(reducedSummary.sum).assertEqual(100n);
      expect(reducedSummary.count).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_REDUCE_0920
     * @tc.name testBigUint64ArrayReduce092
     * @tc.desc Verify reduce() callback mutation of a later source element is observed by a later callback
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayReduce092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n]);
      let observedLaterValue: bigint = 0n;
      let reducedValue = sourceArray.reduce<bigint>((previousValue: bigint, currentValue: bigint,
        currentIndex: int, array: BigUint64Array): bigint => {
        if (currentIndex === 0) {
          array[1] = 9n;
        }
        if (currentIndex === 1) {
          observedLaterValue = currentValue;
        }
        return previousValue + currentValue;
      }, 0n);
      expect(observedLaterValue).assertEqual(9n);
      expect(reducedValue).assertEqual(13n);
      expect(sourceArray[1]).assertEqual(9n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_REDUCE_0930
     * @tc.name testBigUint64ArrayReduce093
     * @tc.desc Verify reduce() on a byteOffset view uses window values and local indices
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayReduce093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sharedBuffer: ArrayBuffer = new ArrayBuffer(32);
      let fullView = new BigUint64Array(sharedBuffer, 0, 4);
      fullView[0] = 10n;
      fullView[1] = 20n;
      fullView[2] = 30n;
      fullView[3] = 40n;
      let byteOffset: int = 8;
      let viewLength: int = 2;
      let sourceView = new BigUint64Array(sharedBuffer, byteOffset, viewLength);
      let reducedText = sourceView.reduce<string>((previousValue: string, currentValue: bigint,
        currentIndex: int, _array: BigUint64Array): string => {
        return previousValue + currentValue.toString() + ':' + currentIndex.toString() + '|';
      }, '');
      expect(reducedText).assertEqual('20:0|30:1|');
      expect(sourceView.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_REDUCE_0940
     * @tc.name testBigUint64ArrayReduce094
     * @tc.desc Verify reduce() on a subarray observes parent mutation before visiting later index
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayReduce094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parentArray = new BigUint64Array([10n, 20n, 30n, 40n]);
      let beginIndex: int = 1;
      let endIndex: int = 3;
      let sourceView = parentArray.subarray(beginIndex, endIndex);
      let observedLaterElement: bigint = 0n;
      let reducedValue = sourceView.reduce<bigint>((previousValue: bigint, currentValue: bigint,
        currentIndex: int, _array: BigUint64Array): bigint => {
        if (currentIndex === 0) {
          parentArray[2] = 99n;
        }
        if (currentIndex === 1) {
          observedLaterElement = currentValue;
        }
        return previousValue + currentValue;
      }, 0n);
      expect(observedLaterElement).assertEqual(99n);
      expect(reducedValue).assertEqual(119n);
      expect(parentArray[2]).assertEqual(99n);
      expect(sourceView[1]).assertEqual(99n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_REDUCE_0950
     * @tc.name testBigUint64ArrayReduce095
     * @tc.desc Verify reduce() without initial value on a byteOffset view starts from local index one
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayReduce095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sharedBuffer: ArrayBuffer = new ArrayBuffer(40);
      let fullView = new BigUint64Array(sharedBuffer, 0, 5);
      fullView[0] = 5n;
      fullView[1] = 10n;
      fullView[2] = 20n;
      fullView[3] = 30n;
      fullView[4] = 40n;
      let byteOffset: int = 16;
      let viewLength: int = 3;
      let sourceView = new BigUint64Array(sharedBuffer, byteOffset, viewLength);
      let firstIndex: int = -1;
      let firstPreviousValue: bigint = 0n;
      let firstCurrentValue: bigint = 0n;
      let reducedValue = sourceView.reduce((previousValue: bigint, currentValue: bigint,
        currentIndex: int, _array: BigUint64Array): bigint => {
        if (firstIndex === -1) {
          firstIndex = currentIndex;
          firstPreviousValue = previousValue;
          firstCurrentValue = currentValue;
        }
        return previousValue + currentValue;
      });
      expect(firstIndex).assertEqual(1);
      expect(firstPreviousValue).assertEqual(20n);
      expect(firstCurrentValue).assertEqual(30n);
      expect(reducedValue).assertEqual(90n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_REDUCE_0960
     * @tc.name testBigUint64ArrayReduce096
     * @tc.desc Verify reduce() on nested byteOffset subarray aggregates local window indices
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayReduce096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
      let reducedText = sourceView.reduce<string>((previousValue: string, currentValue: bigint,
        currentIndex: int, array: BigUint64Array): string => {
        observedIndexSum = observedIndexSum + currentIndex;
        observedByteOffset = array.byteOffset;
        return previousValue + currentValue.toString() + ':' + currentIndex.toString() + '|';
      }, '');
      expect(observedIndexSum).assertEqual(3);
      expect(observedByteOffset).assertEqual(16);
      expect(sourceView.byteOffset).assertEqual(16);
      expect(sourceView.length).assertEqual(3);
      expect(reducedText).assertEqual('30:0|40:1|50:2|');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_REDUCE_0970
     * @tc.name testBigUint64ArrayReduce097
     * @tc.desc Verify reduce() on a slice copy from byteOffset view ignores later source writes
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayReduce097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
      let reducedValue = sliceCopy.reduce<bigint>((previousValue: bigint, currentValue: bigint,
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_REDUCE_0980
     * @tc.name testBigUint64ArrayReduce098
     * @tc.desc Verify reduce() on zero-length byteOffset view returns initial value without callback
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayReduce098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sharedBuffer: ArrayBuffer = new ArrayBuffer(24);
      let byteOffset: int = 16;
      let viewLength: int = 0;
      let sourceView = new BigUint64Array(sharedBuffer, byteOffset, viewLength);
      let callCount: int = 0;
      let reducedValue = sourceView.reduce<bigint>((previousValue: bigint, currentValue: bigint,
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_REDUCE_0990
     * @tc.name testBigUint64ArrayReduce099
     * @tc.desc Verify reduce() on a Set source accumulates values after duplicate removal
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayReduce099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceSet = new Set<bigint>();
      sourceSet.add(7n);
      sourceSet.add(11n);
      sourceSet.add(7n);
      sourceSet.add(15n);
      let sourceArray = new BigUint64Array(sourceSet);
      let reducedText = sourceArray.reduce<string>((previousValue: string, currentValue: bigint,
        currentIndex: int, array: BigUint64Array): string => {
        return previousValue + currentValue.toString() + ':' + currentIndex.toString() + ':' +
          array.length.toString() + '|';
      }, '');
      expect(sourceArray.length).assertEqual(3);
      expect(reducedText).assertEqual('7:0:3|11:1:3|15:2:3|');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_REDUCE_1000
     * @tc.name testBigUint64ArrayReduce100
     * @tc.desc Verify reduce() without initial value on an advanced iterator source starts from the remaining window
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayReduce100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let baseArray = BigUint64Array.of(5n, 10n, 15n, 20n);
      let sourceIterator = baseArray.values();
      sourceIterator.next();
      let sourceArray = new BigUint64Array(sourceIterator);
      let firstIndex: int = -1;
      let firstPreviousValue: bigint = 0n;
      let firstCurrentValue: bigint = 0n;
      let reducedValue = sourceArray.reduce((previousValue: bigint, currentValue: bigint,
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
      expect(firstPreviousValue).assertEqual(10n);
      expect(firstCurrentValue).assertEqual(15n);
      expect(reducedValue).assertEqual(48n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_REDUCE_1010
     * @tc.name testBigUint64ArrayReduce101
     * @tc.desc Verify reduce() without initial value keeps captured previousValue after source mutation
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayReduce101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([5n, 10n, 15n]);
      let observedPreviousValue: bigint = 0n;
      let observedCurrentValue: bigint = 0n;
      let observedFirstIndex: int = -1;
      let reducedValue = sourceArray.reduce((previousValue: bigint, currentValue: bigint,
        currentIndex: int, array: BigUint64Array): bigint => {
        if (observedFirstIndex === -1) {
          observedFirstIndex = currentIndex;
          observedPreviousValue = previousValue;
          observedCurrentValue = currentValue;
          array[0] = 99n;
        }
        return previousValue + currentValue;
      });
      expect(observedFirstIndex).assertEqual(1);
      expect(observedPreviousValue).assertEqual(5n);
      expect(observedCurrentValue).assertEqual(10n);
      expect(sourceArray[0]).assertEqual(99n);
      expect(reducedValue).assertEqual(30n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_REDUCE_1020
     * @tc.name testBigUint64ArrayReduce102
     * @tc.desc Verify reduce() with an Array accumulator appends values in left to right order
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayReduce102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([4n, 5n, 6n]);
      let initialValues: Array<bigint> = [];
      let reducedValues = sourceArray.reduce<Array<bigint>>((previousValues: Array<bigint>, currentValue: bigint,
        _currentIndex: int, _array: BigUint64Array): Array<bigint> => {
        previousValues.push(currentValue);
        return previousValues;
      }, initialValues);
      let returnsInitialArray: boolean = reducedValues === initialValues;
      expect(returnsInitialArray).assertTrue();
      expect(reducedValues.length).assertEqual(3);
      expect(reducedValues[0]).assertEqual(4n);
      expect(reducedValues[1]).assertEqual(5n);
      expect(reducedValues[2]).assertEqual(6n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_REDUCE_1030
     * @tc.name testBigUint64ArrayReduce103
     * @tc.desc Verify reduce() treats explicit undefined as the generic initial value at index zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayReduce103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([9n]);
      let observedUndefinedInitial: boolean = false;
      let observedIndex: int = -1;
      let reducedValue = sourceArray.reduce<bigint | undefined>((previousValue: bigint | undefined,
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_REDUCE_1040
     * @tc.name testBigUint64ArrayReduce104
     * @tc.desc Verify reduce() without initial value throws TypeError on an empty subarray view
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayReduce104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parentArray = new BigUint64Array([1n, 2n, 3n]);
      let beginIndex: int = 1;
      let endIndex: int = 1;
      let sourceView = parentArray.subarray(beginIndex, endIndex);
      let callCount: int = 0;
      try {
        sourceView.reduce((previousValue: bigint, currentValue: bigint,
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_REDUCE_1050
     * @tc.name testBigUint64ArrayReduce105
     * @tc.desc Verify reduce() observes an unvisited source value written through an overlapping sibling view
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayReduce105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sharedBuffer: ArrayBuffer = new ArrayBuffer(32);
      let sourceView = new BigUint64Array(sharedBuffer, 0, 3);
      let siblingView = new BigUint64Array(sharedBuffer, 8, 2);
      sourceView[0] = 1n;
      sourceView[1] = 2n;
      sourceView[2] = 3n;
      let observedLaterValue: bigint = 0n;
      let initialValue: bigint = 0n;
      let reducedValue = sourceView.reduce<bigint>((previousValue: bigint, currentValue: bigint,
        currentIndex: int, _array: BigUint64Array): bigint => {
        if (currentIndex === 0) {
          siblingView[0] = 9n;
        }
        if (currentIndex === 1) {
          observedLaterValue = currentValue;
        }
        return previousValue + currentValue;
      }, initialValue);
      expect(observedLaterValue).assertEqual(9n);
      expect(reducedValue).assertEqual(13n);
      expect(sourceView[1]).assertEqual(9n);
      expect(siblingView[0]).assertEqual(9n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_REDUCE_1060
     * @tc.name testBigUint64ArrayReduce106
     * @tc.desc Verify reduce sums binary integer values converted through BigInt
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayReduce106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = BigUint64Array.of(BigInt(0b1), BigInt(0b10), BigInt(0b11));
      let reducedValue = sourceArray.reduce<bigint>((sum: bigint, value: bigint): bigint => sum + value,
        BigInt(0b0));
      expect(reducedValue).assertEqual(6n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_REDUCE_1070
     * @tc.name testBigUint64ArrayReduce107
     * @tc.desc Verify reduce sums octal integer values converted through BigInt
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayReduce107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = BigUint64Array.of(BigInt(0o1), BigInt(0o2), BigInt(0o3));
      let reducedValue = sourceArray.reduce<bigint>((sum: bigint, value: bigint): bigint => sum + value,
        BigInt(0o0));
      expect(reducedValue).assertEqual(6n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_REDUCE_1080
     * @tc.name testBigUint64ArrayReduce108
     * @tc.desc Verify reduce sums hexadecimal integer values converted through BigInt
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayReduce108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = BigUint64Array.of(BigInt(0x1), BigInt(0x2), BigInt(0x3));
      let reducedValue = sourceArray.reduce<bigint>((sum: bigint, value: bigint): bigint => sum + value,
        BigInt(0x0));
      expect(reducedValue).assertEqual(6n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_REDUCE_1090
     * @tc.name testBigUint64ArrayReduce109
     * @tc.desc Verify byte source converted by toInt supplies a number accumulator initial value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayReduce109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let byteInitialSource: byte = 1;
      let sourceArray = BigUint64Array.of(10n, 20n);
      let reducedValue = sourceArray.reduce<number>((count: number, _value: bigint): number => count + 1,
        byteInitialSource.toInt());
      expect(reducedValue).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_REDUCE_1100
     * @tc.name testBigUint64ArrayReduce110
     * @tc.desc Verify number source converted by toInt supplies a truncated accumulator initial value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayReduce110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let numberInitialSource: number = 1.9;
      let sourceArray = BigUint64Array.of(10n, 20n);
      let reducedValue = sourceArray.reduce<number>((count: number, _value: bigint): number => count + 1,
        numberInitialSource.toInt());
      expect(reducedValue).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_REDUCE_1110
     * @tc.name testBigUint64ArrayReduce111
     * @tc.desc Verify double source converted by toInt supplies a truncated accumulator initial value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayReduce111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let doubleInitialSource: double = 1.9;
      let sourceArray = BigUint64Array.of(10n, 20n);
      let reducedValue = sourceArray.reduce<number>((count: number, _value: bigint): number => count + 1,
        doubleInitialSource.toInt());
      expect(reducedValue).assertEqual(3);
    });

  });
}
