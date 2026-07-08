'use static'

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
  afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level,
  Size, TestType
} from '../../../../hypium/index';
import Utils from '../Util.test';

const BIGINT64_MAX = 9223372036854775807n;
const BIGINT64_MIN = -9223372036854775808n;
const NUMBER_MIN_SAFE = -9007199254740991;
const NUMBER_MAX_SAFE = 9007199254740991;

function createNamedArray(caseName: string): BigInt64Array {
  if (caseName === 'empty') {
    return new BigInt64Array([]);
  }
  if (caseName === 'single_0') {
    return new BigInt64Array([0n]);
  }
  if (caseName === 'single_1') {
    return new BigInt64Array([1n]);
  }
  if (caseName === 'single_neg1') {
    return new BigInt64Array([-1n]);
  }
  if (caseName === 'single_max') {
    return new BigInt64Array([BIGINT64_MAX]);
  }
  if (caseName === 'single_min') {
    return new BigInt64Array([BIGINT64_MIN]);
  }
  if (caseName === 'two_1_2') {
    return new BigInt64Array([1n, 2n]);
  }
  if (caseName === 'five_mixed') {
    return new BigInt64Array([-2n, -1n, 0n, 1n, 2n]);
  }
  return new BigInt64Array([10n, 20n, 30n, 40n, 50n, 60n, 70n, 80n, 90n, 100n]);
}

function getBigIntInitial(caseName: string): BigInt {
  if (caseName === '0n') {
    return 0n;
  }
  if (caseName === '1n') {
    return 1n;
  }
  if (caseName === '-1n') {
    return -1n;
  }
  if (caseName === '100n') {
    return 100n;
  }
  if (caseName === 'max') {
    return BIGINT64_MAX;
  }
  if (caseName === 'min') {
    return BIGINT64_MIN;
  }
  if (caseName === 'hex') {
    return 250n;
  }
  if (caseName === 'octal') {
    return 63n;
  }
  return 10n;
}

function getStringInitial(caseName: string): string {
  if (caseName === 'empty') {
    return '';
  }
  if (caseName === 'prefix') {
    return 'prefix_';
  }
  if (caseName === 'num_str') {
    return '123';
  }
  if (caseName === 'special') {
    return '!@#';
  }
  return ' ';
}

function getNumberInitial(caseName: string): number {
  if (caseName === '0') {
    return 0;
  }
  if (caseName === '10') {
    return 10;
  }
  if (caseName === 'neg1') {
    return -1;
  }
  if (caseName === 'float') {
    return 1.5;
  }
  if (caseName === 'min_safe') {
    return NUMBER_MIN_SAFE;
  }
  return NUMBER_MAX_SAFE;
}

function getBooleanInitial(caseName: string): boolean {
  return caseName === 'true';
}

function runBigIntAdditionReduce(arrayCase: string, initialCase: string): BigInt {
  let arr = createNamedArray(arrayCase);
  return arr.reduce((acc: BigInt, curr: BigInt, idx: int, a: BigInt64Array): BigInt => {
    return acc + curr;
  }, getBigIntInitial(initialCase));
}

function expectedBigIntAddition(arrayCase: string, initialCase: string): BigInt {
  let arr = createNamedArray(arrayCase);
  let expected = getBigIntInitial(initialCase);
  for (let i = 0; i < arr.length; i++) {
    expected += arr[i];
  }
  return expected;
}

function runStringReduce(arrayCase: string, initialCase: string): string {
  let arr = createNamedArray(arrayCase);
  return arr.reduce((acc: string, curr: BigInt, idx: int, a: BigInt64Array): string => {
    return acc + curr.toString();
  }, getStringInitial(initialCase));
}

function expectedStringReduce(arrayCase: string, initialCase: string): string {
  let arr = createNamedArray(arrayCase);
  let expected = getStringInitial(initialCase);
  for (let i = 0; i < arr.length; i++) {
    expected += arr[i].toString();
  }
  return expected;
}

function runNumberReduce(arrayCase: string, initialCase: string): number {
  let arr = createNamedArray(arrayCase);
  return arr.reduce((acc: number, curr: BigInt, idx: int, a: BigInt64Array): number => {
    return acc + Number(curr);
  }, getNumberInitial(initialCase));
}

function expectedNumberReduce(arrayCase: string, initialCase: string): number {
  let arr = createNamedArray(arrayCase);
  let expected = getNumberInitial(initialCase);
  for (let i = 0; i < arr.length; i++) {
    expected += Number(arr[i]);
  }
  return expected;
}

function runBooleanReduce(arrayCase: string, initialCase: string): boolean {
  let arr = createNamedArray(arrayCase);
  return arr.reduce((acc: boolean, curr: BigInt, idx: int, a: BigInt64Array): boolean => {
    return acc || (curr === 0n);
  }, getBooleanInitial(initialCase));
}

function expectedBooleanReduce(arrayCase: string, initialCase: string): boolean {
  let arr = createNamedArray(arrayCase);
  let expected = getBooleanInitial(initialCase);
  for (let i = 0; i < arr.length; i++) {
    expected = expected || (arr[i] === 0n);
  }
  return expected;
}

export default function BigInt64ArrayReduce01Test(): void {
  describe('BigInt64ArrayReduce01Test', (): void => {
    beforeAll((): void => {
    });
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });
    afterEach((): void => {
    });
    afterAll((): void => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_ONE_0010
     * @tc.name testBigInt64ArrayReduceOne001
     * @tc.desc Verify reduce with two arguments returns the initial value for an empty array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceOne001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = createNamedArray('empty');
      let init = 100n;
      let res = arr.reduce((acc: BigInt, curr: BigInt, idx: int, a: BigInt64Array): BigInt => {
        return acc + curr;
      }, init);
      expect(res).assertEqual(init);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_ONE_0020
     * @tc.name testBigInt64ArrayReduceOne002
     * @tc.desc Verify reduce adds bigint array case empty with bigint initial value 0n.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceOne002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let actual = runBigIntAdditionReduce('empty', '0n');
      let expected = expectedBigIntAddition('empty', '0n');
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_ONE_0030
     * @tc.name testBigInt64ArrayReduceOne003
     * @tc.desc Verify reduce adds bigint array case single_0 with bigint initial value 0n.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceOne003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let actual = runBigIntAdditionReduce('single_0', '0n');
      let expected = expectedBigIntAddition('single_0', '0n');
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_ONE_0040
     * @tc.name testBigInt64ArrayReduceOne004
     * @tc.desc Verify reduce adds bigint array case single_0 with bigint initial value 1n.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceOne004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let actual = runBigIntAdditionReduce('single_0', '1n');
      let expected = expectedBigIntAddition('single_0', '1n');
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_ONE_0050
     * @tc.name testBigInt64ArrayReduceOne005
     * @tc.desc Verify reduce adds bigint array case single_0 with bigint initial value -1n.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceOne005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let actual = runBigIntAdditionReduce('single_0', '-1n');
      let expected = expectedBigIntAddition('single_0', '-1n');
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_ONE_0060
     * @tc.name testBigInt64ArrayReduceOne006
     * @tc.desc Verify reduce adds bigint array case single_0 with bigint initial value 100n.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceOne006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let actual = runBigIntAdditionReduce('single_0', '100n');
      let expected = expectedBigIntAddition('single_0', '100n');
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_ONE_0070
     * @tc.name testBigInt64ArrayReduceOne007
     * @tc.desc Verify reduce adds bigint array case single_0 with bigint initial value max.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceOne007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let actual = runBigIntAdditionReduce('single_0', 'max');
      let expected = expectedBigIntAddition('single_0', 'max');
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_ONE_0080
     * @tc.name testBigInt64ArrayReduceOne008
     * @tc.desc Verify reduce adds bigint array case single_0 with bigint initial value min.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceOne008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let actual = runBigIntAdditionReduce('single_0', 'min');
      let expected = expectedBigIntAddition('single_0', 'min');
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_ONE_0090
     * @tc.name testBigInt64ArrayReduceOne009
     * @tc.desc Verify reduce adds bigint array case single_0 with bigint initial value hex.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceOne009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let actual = runBigIntAdditionReduce('single_0', 'hex');
      let expected = expectedBigIntAddition('single_0', 'hex');
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_ONE_0100
     * @tc.name testBigInt64ArrayReduceOne010
     * @tc.desc Verify reduce adds bigint array case single_0 with bigint initial value octal.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceOne010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let actual = runBigIntAdditionReduce('single_0', 'octal');
      let expected = expectedBigIntAddition('single_0', 'octal');
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_ONE_0110
     * @tc.name testBigInt64ArrayReduceOne011
     * @tc.desc Verify reduce adds bigint array case single_0 with bigint initial value binary.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceOne011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let actual = runBigIntAdditionReduce('single_0', 'binary');
      let expected = expectedBigIntAddition('single_0', 'binary');
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_ONE_0120
     * @tc.name testBigInt64ArrayReduceOne012
     * @tc.desc Verify reduce adds bigint array case single_1 with bigint initial value 0n.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceOne012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let actual = runBigIntAdditionReduce('single_1', '0n');
      let expected = expectedBigIntAddition('single_1', '0n');
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_ONE_0130
     * @tc.name testBigInt64ArrayReduceOne013
     * @tc.desc Verify reduce adds bigint array case single_1 with bigint initial value 1n.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceOne013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let actual = runBigIntAdditionReduce('single_1', '1n');
      let expected = expectedBigIntAddition('single_1', '1n');
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_ONE_0140
     * @tc.name testBigInt64ArrayReduceOne014
     * @tc.desc Verify reduce adds bigint array case single_1 with bigint initial value -1n.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceOne014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let actual = runBigIntAdditionReduce('single_1', '-1n');
      let expected = expectedBigIntAddition('single_1', '-1n');
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_ONE_0150
     * @tc.name testBigInt64ArrayReduceOne015
     * @tc.desc Verify reduce adds bigint array case single_1 with bigint initial value 100n.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceOne015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let actual = runBigIntAdditionReduce('single_1', '100n');
      let expected = expectedBigIntAddition('single_1', '100n');
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_ONE_0160
     * @tc.name testBigInt64ArrayReduceOne016
     * @tc.desc Verify reduce adds bigint array case single_1 with bigint initial value max.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceOne016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let actual = runBigIntAdditionReduce('single_1', 'max');
      let expected = expectedBigIntAddition('single_1', 'max');
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_ONE_0170
     * @tc.name testBigInt64ArrayReduceOne017
     * @tc.desc Verify reduce adds bigint array case single_1 with bigint initial value min.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceOne017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let actual = runBigIntAdditionReduce('single_1', 'min');
      let expected = expectedBigIntAddition('single_1', 'min');
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_ONE_0180
     * @tc.name testBigInt64ArrayReduceOne018
     * @tc.desc Verify reduce adds bigint array case single_1 with bigint initial value hex.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceOne018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let actual = runBigIntAdditionReduce('single_1', 'hex');
      let expected = expectedBigIntAddition('single_1', 'hex');
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_ONE_0190
     * @tc.name testBigInt64ArrayReduceOne019
     * @tc.desc Verify reduce adds bigint array case single_1 with bigint initial value octal.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceOne019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let actual = runBigIntAdditionReduce('single_1', 'octal');
      let expected = expectedBigIntAddition('single_1', 'octal');
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_ONE_0200
     * @tc.name testBigInt64ArrayReduceOne020
     * @tc.desc Verify reduce adds bigint array case single_1 with bigint initial value binary.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceOne020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let actual = runBigIntAdditionReduce('single_1', 'binary');
      let expected = expectedBigIntAddition('single_1', 'binary');
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_ONE_0210
     * @tc.name testBigInt64ArrayReduceOne021
     * @tc.desc Verify reduce adds bigint array case single_neg1 with bigint initial value 0n.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceOne021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let actual = runBigIntAdditionReduce('single_neg1', '0n');
      let expected = expectedBigIntAddition('single_neg1', '0n');
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_ONE_0220
     * @tc.name testBigInt64ArrayReduceOne022
     * @tc.desc Verify reduce adds bigint array case single_neg1 with bigint initial value 1n.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceOne022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let actual = runBigIntAdditionReduce('single_neg1', '1n');
      let expected = expectedBigIntAddition('single_neg1', '1n');
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_ONE_0230
     * @tc.name testBigInt64ArrayReduceOne023
     * @tc.desc Verify reduce adds bigint array case single_neg1 with bigint initial value -1n.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceOne023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let actual = runBigIntAdditionReduce('single_neg1', '-1n');
      let expected = expectedBigIntAddition('single_neg1', '-1n');
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_ONE_0240
     * @tc.name testBigInt64ArrayReduceOne024
     * @tc.desc Verify reduce adds bigint array case single_neg1 with bigint initial value 100n.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceOne024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let actual = runBigIntAdditionReduce('single_neg1', '100n');
      let expected = expectedBigIntAddition('single_neg1', '100n');
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_ONE_0250
     * @tc.name testBigInt64ArrayReduceOne025
     * @tc.desc Verify reduce adds bigint array case single_neg1 with bigint initial value max.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceOne025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let actual = runBigIntAdditionReduce('single_neg1', 'max');
      let expected = expectedBigIntAddition('single_neg1', 'max');
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_ONE_0260
     * @tc.name testBigInt64ArrayReduceOne026
     * @tc.desc Verify reduce adds bigint array case single_neg1 with bigint initial value min.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceOne026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let actual = runBigIntAdditionReduce('single_neg1', 'min');
      let expected = expectedBigIntAddition('single_neg1', 'min');
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_ONE_0270
     * @tc.name testBigInt64ArrayReduceOne027
     * @tc.desc Verify reduce adds bigint array case single_neg1 with bigint initial value hex.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceOne027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let actual = runBigIntAdditionReduce('single_neg1', 'hex');
      let expected = expectedBigIntAddition('single_neg1', 'hex');
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_ONE_0280
     * @tc.name testBigInt64ArrayReduceOne028
     * @tc.desc Verify reduce adds bigint array case single_neg1 with bigint initial value octal.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceOne028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let actual = runBigIntAdditionReduce('single_neg1', 'octal');
      let expected = expectedBigIntAddition('single_neg1', 'octal');
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_ONE_0290
     * @tc.name testBigInt64ArrayReduceOne029
     * @tc.desc Verify reduce adds bigint array case single_neg1 with bigint initial value binary.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceOne029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let actual = runBigIntAdditionReduce('single_neg1', 'binary');
      let expected = expectedBigIntAddition('single_neg1', 'binary');
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_ONE_0300
     * @tc.name testBigInt64ArrayReduceOne030
     * @tc.desc Verify reduce adds bigint array case single_max with bigint initial value 0n.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceOne030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let actual = runBigIntAdditionReduce('single_max', '0n');
      let expected = expectedBigIntAddition('single_max', '0n');
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_ONE_0310
     * @tc.name testBigInt64ArrayReduceOne031
     * @tc.desc Verify reduce adds bigint array case single_max with bigint initial value 1n.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceOne031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let actual = runBigIntAdditionReduce('single_max', '1n');
      let expected = expectedBigIntAddition('single_max', '1n');
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_ONE_0320
     * @tc.name testBigInt64ArrayReduceOne032
     * @tc.desc Verify reduce adds bigint array case single_max with bigint initial value -1n.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceOne032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let actual = runBigIntAdditionReduce('single_max', '-1n');
      let expected = expectedBigIntAddition('single_max', '-1n');
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_ONE_0330
     * @tc.name testBigInt64ArrayReduceOne033
     * @tc.desc Verify reduce adds bigint array case single_max with bigint initial value 100n.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceOne033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let actual = runBigIntAdditionReduce('single_max', '100n');
      let expected = expectedBigIntAddition('single_max', '100n');
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_ONE_0340
     * @tc.name testBigInt64ArrayReduceOne034
     * @tc.desc Verify reduce adds bigint array case single_max with bigint initial value max.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceOne034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let actual = runBigIntAdditionReduce('single_max', 'max');
      let expected = expectedBigIntAddition('single_max', 'max');
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_ONE_0350
     * @tc.name testBigInt64ArrayReduceOne035
     * @tc.desc Verify reduce adds bigint array case single_max with bigint initial value min.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceOne035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let actual = runBigIntAdditionReduce('single_max', 'min');
      let expected = expectedBigIntAddition('single_max', 'min');
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_ONE_0360
     * @tc.name testBigInt64ArrayReduceOne036
     * @tc.desc Verify reduce adds bigint array case single_max with bigint initial value hex.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceOne036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let actual = runBigIntAdditionReduce('single_max', 'hex');
      let expected = expectedBigIntAddition('single_max', 'hex');
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_ONE_0370
     * @tc.name testBigInt64ArrayReduceOne037
     * @tc.desc Verify reduce adds bigint array case single_max with bigint initial value octal.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceOne037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let actual = runBigIntAdditionReduce('single_max', 'octal');
      let expected = expectedBigIntAddition('single_max', 'octal');
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_ONE_0380
     * @tc.name testBigInt64ArrayReduceOne038
     * @tc.desc Verify reduce adds bigint array case single_max with bigint initial value binary.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceOne038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let actual = runBigIntAdditionReduce('single_max', 'binary');
      let expected = expectedBigIntAddition('single_max', 'binary');
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_ONE_0390
     * @tc.name testBigInt64ArrayReduceOne039
     * @tc.desc Verify reduce adds bigint array case single_min with bigint initial value 0n.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceOne039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let actual = runBigIntAdditionReduce('single_min', '0n');
      let expected = expectedBigIntAddition('single_min', '0n');
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_ONE_0400
     * @tc.name testBigInt64ArrayReduceOne040
     * @tc.desc Verify reduce adds bigint array case single_min with bigint initial value 1n.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceOne040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let actual = runBigIntAdditionReduce('single_min', '1n');
      let expected = expectedBigIntAddition('single_min', '1n');
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_ONE_0410
     * @tc.name testBigInt64ArrayReduceOne041
     * @tc.desc Verify reduce adds bigint array case single_min with bigint initial value -1n.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceOne041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let actual = runBigIntAdditionReduce('single_min', '-1n');
      let expected = expectedBigIntAddition('single_min', '-1n');
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_ONE_0420
     * @tc.name testBigInt64ArrayReduceOne042
     * @tc.desc Verify reduce adds bigint array case single_min with bigint initial value 100n.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceOne042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let actual = runBigIntAdditionReduce('single_min', '100n');
      let expected = expectedBigIntAddition('single_min', '100n');
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_ONE_0430
     * @tc.name testBigInt64ArrayReduceOne043
     * @tc.desc Verify reduce adds bigint array case single_min with bigint initial value max.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceOne043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let actual = runBigIntAdditionReduce('single_min', 'max');
      let expected = expectedBigIntAddition('single_min', 'max');
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_ONE_0440
     * @tc.name testBigInt64ArrayReduceOne044
     * @tc.desc Verify reduce adds bigint array case single_min with bigint initial value min.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceOne044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let actual = runBigIntAdditionReduce('single_min', 'min');
      let expected = expectedBigIntAddition('single_min', 'min');
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_ONE_0450
     * @tc.name testBigInt64ArrayReduceOne045
     * @tc.desc Verify reduce adds bigint array case single_min with bigint initial value hex.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceOne045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let actual = runBigIntAdditionReduce('single_min', 'hex');
      let expected = expectedBigIntAddition('single_min', 'hex');
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_ONE_0460
     * @tc.name testBigInt64ArrayReduceOne046
     * @tc.desc Verify reduce adds bigint array case single_min with bigint initial value octal.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceOne046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let actual = runBigIntAdditionReduce('single_min', 'octal');
      let expected = expectedBigIntAddition('single_min', 'octal');
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_ONE_0470
     * @tc.name testBigInt64ArrayReduceOne047
     * @tc.desc Verify reduce adds bigint array case single_min with bigint initial value binary.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceOne047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let actual = runBigIntAdditionReduce('single_min', 'binary');
      let expected = expectedBigIntAddition('single_min', 'binary');
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_ONE_0480
     * @tc.name testBigInt64ArrayReduceOne048
     * @tc.desc Verify reduce adds bigint array case two_1_2 with bigint initial value 0n.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceOne048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let actual = runBigIntAdditionReduce('two_1_2', '0n');
      let expected = expectedBigIntAddition('two_1_2', '0n');
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_ONE_0490
     * @tc.name testBigInt64ArrayReduceOne049
     * @tc.desc Verify reduce adds bigint array case two_1_2 with bigint initial value 1n.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceOne049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let actual = runBigIntAdditionReduce('two_1_2', '1n');
      let expected = expectedBigIntAddition('two_1_2', '1n');
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_ONE_0500
     * @tc.name testBigInt64ArrayReduceOne050
     * @tc.desc Verify reduce adds bigint array case two_1_2 with bigint initial value -1n.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceOne050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let actual = runBigIntAdditionReduce('two_1_2', '-1n');
      let expected = expectedBigIntAddition('two_1_2', '-1n');
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_ONE_0510
     * @tc.name testBigInt64ArrayReduceOne051
     * @tc.desc Verify reduce adds bigint array case two_1_2 with bigint initial value 100n.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceOne051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let actual = runBigIntAdditionReduce('two_1_2', '100n');
      let expected = expectedBigIntAddition('two_1_2', '100n');
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_ONE_0520
     * @tc.name testBigInt64ArrayReduceOne052
     * @tc.desc Verify reduce adds bigint array case two_1_2 with bigint initial value max.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceOne052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let actual = runBigIntAdditionReduce('two_1_2', 'max');
      let expected = expectedBigIntAddition('two_1_2', 'max');
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_ONE_0530
     * @tc.name testBigInt64ArrayReduceOne053
     * @tc.desc Verify reduce adds bigint array case two_1_2 with bigint initial value min.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceOne053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let actual = runBigIntAdditionReduce('two_1_2', 'min');
      let expected = expectedBigIntAddition('two_1_2', 'min');
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_ONE_0540
     * @tc.name testBigInt64ArrayReduceOne054
     * @tc.desc Verify reduce adds bigint array case two_1_2 with bigint initial value hex.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceOne054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let actual = runBigIntAdditionReduce('two_1_2', 'hex');
      let expected = expectedBigIntAddition('two_1_2', 'hex');
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_ONE_0550
     * @tc.name testBigInt64ArrayReduceOne055
     * @tc.desc Verify reduce adds bigint array case two_1_2 with bigint initial value octal.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceOne055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let actual = runBigIntAdditionReduce('two_1_2', 'octal');
      let expected = expectedBigIntAddition('two_1_2', 'octal');
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_ONE_0560
     * @tc.name testBigInt64ArrayReduceOne056
     * @tc.desc Verify reduce adds bigint array case two_1_2 with bigint initial value binary.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceOne056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let actual = runBigIntAdditionReduce('two_1_2', 'binary');
      let expected = expectedBigIntAddition('two_1_2', 'binary');
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_ONE_0570
     * @tc.name testBigInt64ArrayReduceOne057
     * @tc.desc Verify reduce adds bigint array case five_mixed with bigint initial value 0n.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceOne057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let actual = runBigIntAdditionReduce('five_mixed', '0n');
      let expected = expectedBigIntAddition('five_mixed', '0n');
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_ONE_0580
     * @tc.name testBigInt64ArrayReduceOne058
     * @tc.desc Verify reduce adds bigint array case five_mixed with bigint initial value 1n.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceOne058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let actual = runBigIntAdditionReduce('five_mixed', '1n');
      let expected = expectedBigIntAddition('five_mixed', '1n');
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_ONE_0590
     * @tc.name testBigInt64ArrayReduceOne059
     * @tc.desc Verify reduce adds bigint array case five_mixed with bigint initial value -1n.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceOne059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let actual = runBigIntAdditionReduce('five_mixed', '-1n');
      let expected = expectedBigIntAddition('five_mixed', '-1n');
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_ONE_0600
     * @tc.name testBigInt64ArrayReduceOne060
     * @tc.desc Verify reduce adds bigint array case five_mixed with bigint initial value 100n.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceOne060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let actual = runBigIntAdditionReduce('five_mixed', '100n');
      let expected = expectedBigIntAddition('five_mixed', '100n');
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_ONE_0610
     * @tc.name testBigInt64ArrayReduceOne061
     * @tc.desc Verify reduce adds bigint array case five_mixed with bigint initial value max.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceOne061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let actual = runBigIntAdditionReduce('five_mixed', 'max');
      let expected = expectedBigIntAddition('five_mixed', 'max');
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_ONE_0620
     * @tc.name testBigInt64ArrayReduceOne062
     * @tc.desc Verify reduce adds bigint array case five_mixed with bigint initial value min.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceOne062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let actual = runBigIntAdditionReduce('five_mixed', 'min');
      let expected = expectedBigIntAddition('five_mixed', 'min');
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_ONE_0630
     * @tc.name testBigInt64ArrayReduceOne063
     * @tc.desc Verify reduce adds bigint array case five_mixed with bigint initial value hex.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceOne063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let actual = runBigIntAdditionReduce('five_mixed', 'hex');
      let expected = expectedBigIntAddition('five_mixed', 'hex');
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_ONE_0640
     * @tc.name testBigInt64ArrayReduceOne064
     * @tc.desc Verify reduce adds bigint array case five_mixed with bigint initial value octal.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceOne064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let actual = runBigIntAdditionReduce('five_mixed', 'octal');
      let expected = expectedBigIntAddition('five_mixed', 'octal');
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_ONE_0650
     * @tc.name testBigInt64ArrayReduceOne065
     * @tc.desc Verify reduce adds bigint array case five_mixed with bigint initial value binary.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceOne065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let actual = runBigIntAdditionReduce('five_mixed', 'binary');
      let expected = expectedBigIntAddition('five_mixed', 'binary');
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_ONE_0660
     * @tc.name testBigInt64ArrayReduceOne066
     * @tc.desc Verify reduce adds bigint array case large with bigint initial value 0n.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceOne066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let actual = runBigIntAdditionReduce('large', '0n');
      let expected = expectedBigIntAddition('large', '0n');
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_ONE_0670
     * @tc.name testBigInt64ArrayReduceOne067
     * @tc.desc Verify reduce adds bigint array case large with bigint initial value 1n.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceOne067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let actual = runBigIntAdditionReduce('large', '1n');
      let expected = expectedBigIntAddition('large', '1n');
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_ONE_0680
     * @tc.name testBigInt64ArrayReduceOne068
     * @tc.desc Verify reduce adds bigint array case large with bigint initial value -1n.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceOne068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let actual = runBigIntAdditionReduce('large', '-1n');
      let expected = expectedBigIntAddition('large', '-1n');
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_ONE_0690
     * @tc.name testBigInt64ArrayReduceOne069
     * @tc.desc Verify reduce adds bigint array case large with bigint initial value 100n.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceOne069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let actual = runBigIntAdditionReduce('large', '100n');
      let expected = expectedBigIntAddition('large', '100n');
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_ONE_0700
     * @tc.name testBigInt64ArrayReduceOne070
     * @tc.desc Verify reduce adds bigint array case large with bigint initial value max.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceOne070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let actual = runBigIntAdditionReduce('large', 'max');
      let expected = expectedBigIntAddition('large', 'max');
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_ONE_0710
     * @tc.name testBigInt64ArrayReduceOne071
     * @tc.desc Verify reduce adds bigint array case large with bigint initial value min.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceOne071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let actual = runBigIntAdditionReduce('large', 'min');
      let expected = expectedBigIntAddition('large', 'min');
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_ONE_0720
     * @tc.name testBigInt64ArrayReduceOne072
     * @tc.desc Verify reduce adds bigint array case large with bigint initial value hex.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceOne072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let actual = runBigIntAdditionReduce('large', 'hex');
      let expected = expectedBigIntAddition('large', 'hex');
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_ONE_0730
     * @tc.name testBigInt64ArrayReduceOne073
     * @tc.desc Verify reduce adds bigint array case large with bigint initial value octal.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceOne073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let actual = runBigIntAdditionReduce('large', 'octal');
      let expected = expectedBigIntAddition('large', 'octal');
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_ONE_0740
     * @tc.name testBigInt64ArrayReduceOne074
     * @tc.desc Verify reduce adds bigint array case large with bigint initial value binary.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceOne074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let actual = runBigIntAdditionReduce('large', 'binary');
      let expected = expectedBigIntAddition('large', 'binary');
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_ONE_0750
     * @tc.name testBigInt64ArrayReduceOne075
     * @tc.desc Verify reduce concatenates array case empty with string initial value empty.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceOne075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let actual = runStringReduce('empty', 'empty');
      let expected = expectedStringReduce('empty', 'empty');
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_ONE_0760
     * @tc.name testBigInt64ArrayReduceOne076
     * @tc.desc Verify reduce concatenates array case empty with string initial value prefix.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceOne076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let actual = runStringReduce('empty', 'prefix');
      let expected = expectedStringReduce('empty', 'prefix');
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_ONE_0770
     * @tc.name testBigInt64ArrayReduceOne077
     * @tc.desc Verify reduce concatenates array case empty with string initial value num_str.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceOne077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let actual = runStringReduce('empty', 'num_str');
      let expected = expectedStringReduce('empty', 'num_str');
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_ONE_0780
     * @tc.name testBigInt64ArrayReduceOne078
     * @tc.desc Verify reduce concatenates array case empty with string initial value special.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceOne078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let actual = runStringReduce('empty', 'special');
      let expected = expectedStringReduce('empty', 'special');
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_ONE_0790
     * @tc.name testBigInt64ArrayReduceOne079
     * @tc.desc Verify reduce concatenates array case empty with string initial value space.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceOne079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let actual = runStringReduce('empty', 'space');
      let expected = expectedStringReduce('empty', 'space');
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_ONE_0800
     * @tc.name testBigInt64ArrayReduceOne080
     * @tc.desc Verify reduce concatenates array case single_0 with string initial value empty.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceOne080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let actual = runStringReduce('single_0', 'empty');
      let expected = expectedStringReduce('single_0', 'empty');
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_ONE_0810
     * @tc.name testBigInt64ArrayReduceOne081
     * @tc.desc Verify reduce concatenates array case single_0 with string initial value prefix.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceOne081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let actual = runStringReduce('single_0', 'prefix');
      let expected = expectedStringReduce('single_0', 'prefix');
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_ONE_0820
     * @tc.name testBigInt64ArrayReduceOne082
     * @tc.desc Verify reduce concatenates array case single_0 with string initial value num_str.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceOne082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let actual = runStringReduce('single_0', 'num_str');
      let expected = expectedStringReduce('single_0', 'num_str');
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_ONE_0830
     * @tc.name testBigInt64ArrayReduceOne083
     * @tc.desc Verify reduce concatenates array case single_0 with string initial value special.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceOne083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let actual = runStringReduce('single_0', 'special');
      let expected = expectedStringReduce('single_0', 'special');
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_ONE_0840
     * @tc.name testBigInt64ArrayReduceOne084
     * @tc.desc Verify reduce concatenates array case single_0 with string initial value space.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceOne084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let actual = runStringReduce('single_0', 'space');
      let expected = expectedStringReduce('single_0', 'space');
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_ONE_0850
     * @tc.name testBigInt64ArrayReduceOne085
     * @tc.desc Verify reduce concatenates array case single_1 with string initial value empty.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceOne085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let actual = runStringReduce('single_1', 'empty');
      let expected = expectedStringReduce('single_1', 'empty');
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_ONE_0860
     * @tc.name testBigInt64ArrayReduceOne086
     * @tc.desc Verify reduce concatenates array case single_1 with string initial value prefix.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceOne086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let actual = runStringReduce('single_1', 'prefix');
      let expected = expectedStringReduce('single_1', 'prefix');
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_ONE_0870
     * @tc.name testBigInt64ArrayReduceOne087
     * @tc.desc Verify reduce concatenates array case single_1 with string initial value num_str.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceOne087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let actual = runStringReduce('single_1', 'num_str');
      let expected = expectedStringReduce('single_1', 'num_str');
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_ONE_0880
     * @tc.name testBigInt64ArrayReduceOne088
     * @tc.desc Verify reduce concatenates array case single_1 with string initial value special.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceOne088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let actual = runStringReduce('single_1', 'special');
      let expected = expectedStringReduce('single_1', 'special');
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_ONE_0890
     * @tc.name testBigInt64ArrayReduceOne089
     * @tc.desc Verify reduce concatenates array case single_1 with string initial value space.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceOne089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let actual = runStringReduce('single_1', 'space');
      let expected = expectedStringReduce('single_1', 'space');
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_ONE_0900
     * @tc.name testBigInt64ArrayReduceOne090
     * @tc.desc Verify reduce concatenates array case single_neg1 with string initial value empty.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceOne090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let actual = runStringReduce('single_neg1', 'empty');
      let expected = expectedStringReduce('single_neg1', 'empty');
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_ONE_0910
     * @tc.name testBigInt64ArrayReduceOne091
     * @tc.desc Verify reduce concatenates array case single_neg1 with string initial value prefix.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceOne091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let actual = runStringReduce('single_neg1', 'prefix');
      let expected = expectedStringReduce('single_neg1', 'prefix');
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_ONE_0920
     * @tc.name testBigInt64ArrayReduceOne092
     * @tc.desc Verify reduce concatenates array case single_neg1 with string initial value num_str.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceOne092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let actual = runStringReduce('single_neg1', 'num_str');
      let expected = expectedStringReduce('single_neg1', 'num_str');
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_ONE_0930
     * @tc.name testBigInt64ArrayReduceOne093
     * @tc.desc Verify reduce concatenates array case single_neg1 with string initial value special.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceOne093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let actual = runStringReduce('single_neg1', 'special');
      let expected = expectedStringReduce('single_neg1', 'special');
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_ONE_0940
     * @tc.name testBigInt64ArrayReduceOne094
     * @tc.desc Verify reduce concatenates array case single_neg1 with string initial value space.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceOne094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let actual = runStringReduce('single_neg1', 'space');
      let expected = expectedStringReduce('single_neg1', 'space');
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_ONE_0950
     * @tc.name testBigInt64ArrayReduceOne095
     * @tc.desc Verify reduce concatenates array case single_max with string initial value empty.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceOne095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let actual = runStringReduce('single_max', 'empty');
      let expected = expectedStringReduce('single_max', 'empty');
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_ONE_0960
     * @tc.name testBigInt64ArrayReduceOne096
     * @tc.desc Verify reduce concatenates array case single_max with string initial value prefix.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceOne096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let actual = runStringReduce('single_max', 'prefix');
      let expected = expectedStringReduce('single_max', 'prefix');
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_ONE_0970
     * @tc.name testBigInt64ArrayReduceOne097
     * @tc.desc Verify reduce concatenates array case single_max with string initial value num_str.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceOne097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let actual = runStringReduce('single_max', 'num_str');
      let expected = expectedStringReduce('single_max', 'num_str');
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_ONE_0980
     * @tc.name testBigInt64ArrayReduceOne098
     * @tc.desc Verify reduce concatenates array case single_max with string initial value special.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceOne098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let actual = runStringReduce('single_max', 'special');
      let expected = expectedStringReduce('single_max', 'special');
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_ONE_0990
     * @tc.name testBigInt64ArrayReduceOne099
     * @tc.desc Verify reduce concatenates array case single_max with string initial value space.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceOne099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let actual = runStringReduce('single_max', 'space');
      let expected = expectedStringReduce('single_max', 'space');
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_ONE_1000
     * @tc.name testBigInt64ArrayReduceOne100
     * @tc.desc Verify reduce concatenates array case single_min with string initial value empty.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceOne100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let actual = runStringReduce('single_min', 'empty');
      let expected = expectedStringReduce('single_min', 'empty');
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_ONE_1010
     * @tc.name testBigInt64ArrayReduceOne101
     * @tc.desc Verify reduce concatenates array case single_min with string initial value prefix.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceOne101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let actual = runStringReduce('single_min', 'prefix');
      let expected = expectedStringReduce('single_min', 'prefix');
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_ONE_1020
     * @tc.name testBigInt64ArrayReduceOne102
     * @tc.desc Verify reduce concatenates array case single_min with string initial value num_str.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceOne102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let actual = runStringReduce('single_min', 'num_str');
      let expected = expectedStringReduce('single_min', 'num_str');
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_ONE_1030
     * @tc.name testBigInt64ArrayReduceOne103
     * @tc.desc Verify reduce concatenates array case single_min with string initial value special.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceOne103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let actual = runStringReduce('single_min', 'special');
      let expected = expectedStringReduce('single_min', 'special');
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_ONE_1040
     * @tc.name testBigInt64ArrayReduceOne104
     * @tc.desc Verify reduce concatenates array case single_min with string initial value space.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceOne104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let actual = runStringReduce('single_min', 'space');
      let expected = expectedStringReduce('single_min', 'space');
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_ONE_1050
     * @tc.name testBigInt64ArrayReduceOne105
     * @tc.desc Verify reduce concatenates array case two_1_2 with string initial value empty.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceOne105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let actual = runStringReduce('two_1_2', 'empty');
      let expected = expectedStringReduce('two_1_2', 'empty');
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_ONE_1060
     * @tc.name testBigInt64ArrayReduceOne106
     * @tc.desc Verify reduce concatenates array case two_1_2 with string initial value prefix.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceOne106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let actual = runStringReduce('two_1_2', 'prefix');
      let expected = expectedStringReduce('two_1_2', 'prefix');
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_ONE_1070
     * @tc.name testBigInt64ArrayReduceOne107
     * @tc.desc Verify reduce concatenates array case two_1_2 with string initial value num_str.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceOne107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let actual = runStringReduce('two_1_2', 'num_str');
      let expected = expectedStringReduce('two_1_2', 'num_str');
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_ONE_1080
     * @tc.name testBigInt64ArrayReduceOne108
     * @tc.desc Verify reduce concatenates array case two_1_2 with string initial value special.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceOne108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let actual = runStringReduce('two_1_2', 'special');
      let expected = expectedStringReduce('two_1_2', 'special');
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_ONE_1090
     * @tc.name testBigInt64ArrayReduceOne109
     * @tc.desc Verify reduce concatenates array case two_1_2 with string initial value space.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceOne109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let actual = runStringReduce('two_1_2', 'space');
      let expected = expectedStringReduce('two_1_2', 'space');
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_ONE_1100
     * @tc.name testBigInt64ArrayReduceOne110
     * @tc.desc Verify reduce concatenates array case five_mixed with string initial value empty.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceOne110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let actual = runStringReduce('five_mixed', 'empty');
      let expected = expectedStringReduce('five_mixed', 'empty');
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_ONE_1110
     * @tc.name testBigInt64ArrayReduceOne111
     * @tc.desc Verify reduce concatenates array case five_mixed with string initial value prefix.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceOne111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let actual = runStringReduce('five_mixed', 'prefix');
      let expected = expectedStringReduce('five_mixed', 'prefix');
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_ONE_1120
     * @tc.name testBigInt64ArrayReduceOne112
     * @tc.desc Verify reduce concatenates array case five_mixed with string initial value num_str.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceOne112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let actual = runStringReduce('five_mixed', 'num_str');
      let expected = expectedStringReduce('five_mixed', 'num_str');
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_ONE_1130
     * @tc.name testBigInt64ArrayReduceOne113
     * @tc.desc Verify reduce concatenates array case five_mixed with string initial value special.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceOne113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let actual = runStringReduce('five_mixed', 'special');
      let expected = expectedStringReduce('five_mixed', 'special');
      expect(actual).assertEqual(expected);
    });


  });
}
