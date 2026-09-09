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

import { collections } from '@kit.ArkTS';
import { beforeAll, beforeEach, afterEach, afterAll, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';

function sleep(time: number): Promise<void> {
  return new Promise<void>((resolve) => setTimeout(resolve, time));
}

const BIGINT_CONCAT_ARRAY_VALUES: Array<bigint> = [
  1n, -1n, 0n, 123n, -99999999999999999999n, 99999999999999999999n,
  9223372036854775807n, -9223372036854775808n, 0x10n, 0b101n,
  18446744073709551616n, -18446744073709551616n, 4294967296n, 65536n, 256n,
  9007199254740991n, -9007199254740991n, 123456789012345678901234567890n,
  BigInt('9007199254740991'), BigInt(Number.MAX_SAFE_INTEGER), BigInt('0'),
];

export default function concatArrayBigintTest() {
  describe('ConcatArrayBigintTest', () => {
    beforeAll(() => {
    });

    beforeEach(async () => {
      await sleep(30);
    });

    afterEach(() => {
    });

    afterAll(() => {
    });

    /**
     * @tc.name testConcatArrayBigintTest0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONCAT_ARRAY_BIGINT_TEST_0100
     * @tc.desc Verify length property of ConcatArray with empty, single and multiple bigint elements
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConcatArrayBigintTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const emptyArray: collections.ConcatArray<bigint> = new collections.Array<bigint>();
      expect(emptyArray.length).assertEqual(0);

      const singleArray: collections.ConcatArray<bigint> = new collections.Array<bigint>(42n);
      expect(singleArray.length).assertEqual(1);

      const values: collections.ConcatArray<bigint> = new collections.Array<bigint>(...BIGINT_CONCAT_ARRAY_VALUES);
      expect(values.length).assertEqual(BIGINT_CONCAT_ARRAY_VALUES.length);
      expect(typeof values.length).assertEqual('number');
    });

    /**
     * @tc.name testConcatArrayBigintTest0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONCAT_ARRAY_BIGINT_TEST_0200
     * @tc.desc Verify indexed access [index] of ConcatArray returns first, middle and last bigint elements
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConcatArrayBigintTest0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: collections.ConcatArray<bigint> = new collections.Array<bigint>(...BIGINT_CONCAT_ARRAY_VALUES);
      expect(values[0]).assertEqual(BIGINT_CONCAT_ARRAY_VALUES[0]);
      expect(values[1]).assertEqual(BIGINT_CONCAT_ARRAY_VALUES[1]);
      expect(values[14]).assertEqual(BIGINT_CONCAT_ARRAY_VALUES[14]);
      expect(typeof values[0]).assertEqual('bigint');
    });

    /**
     * @tc.name testConcatArrayBigintTest0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONCAT_ARRAY_BIGINT_TEST_0300
     * @tc.desc Verify indexed access [index] with -0, out-of-range, negative, fraction, NaN and Infinity indexes
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConcatArrayBigintTest0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: collections.ConcatArray<bigint> = new collections.Array<bigint>(1n, 2n, 4n);
      expect(values[-0]).assertEqual(1n);
      expect(values[3]).assertUndefined();
      expect(values[-1]).assertUndefined();
      expect(values[0.5]).assertUndefined();
      expect(values[NaN]).assertUndefined();
      expect(values[Infinity]).assertUndefined();
      expect(values[2]).assertEqual(4n);
    });

    /**
     * @tc.name testConcatArrayBigintTest0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONCAT_ARRAY_BIGINT_TEST_0400
     * @tc.desc Verify join with default, custom, empty, unicode and newline separators on bigint ConcatArray
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConcatArrayBigintTest0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: collections.ConcatArray<bigint> = new collections.Array<bigint>(1n, 2n, 3n);
      expect(values.join()).assertEqual('1,2,3');
      expect(values.join('-')).assertEqual('1-2-3');
      expect(values.join('')).assertEqual('123');
      expect(values.join('\n')).assertEqual('1\n2\n3');
      expect(values.join('—')).assertEqual('1—2—3');

      const extremeValues: collections.ConcatArray<bigint> = new collections.Array<bigint>(
        9223372036854775807n,
        -9223372036854775808n,
      );
      expect(extremeValues.join(',')).assertEqual('9223372036854775807,-9223372036854775808');
    });

    /**
     * @tc.name testConcatArrayBigintTest0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONCAT_ARRAY_BIGINT_TEST_0500
     * @tc.desc Verify join on empty and single element bigint ConcatArray
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConcatArrayBigintTest0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const emptyArray: collections.ConcatArray<bigint> = new collections.Array<bigint>();
      expect(emptyArray.join()).assertEqual('');
      expect(emptyArray.join('-')).assertEqual('');

      const singleArray: collections.ConcatArray<bigint> = new collections.Array<bigint>(7n);
      expect(singleArray.join()).assertEqual('7');
      expect(singleArray.join('|')).assertEqual('7');
    });

    /**
     * @tc.name testConcatArrayBigintTest0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONCAT_ARRAY_BIGINT_TEST_0600
     * @tc.desc Verify slice with normal range returns new ConcatArray and keeps source unchanged
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConcatArrayBigintTest0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: collections.ConcatArray<bigint> = new collections.Array<bigint>(1n, 2n, 3n, 4n, 5n);
      const slicedArray: collections.ConcatArray<bigint> = values.slice(1, 3);
      expect(slicedArray.length).assertEqual(2);
      expect(slicedArray[0]).assertEqual(2n);
      expect(slicedArray[1]).assertEqual(3n);
      expect(values[4]).assertEqual(5n);
      expect(values[1]).assertEqual(2n);
    });

    /**
     * @tc.name testConcatArrayBigintTest0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONCAT_ARRAY_BIGINT_TEST_0700
     * @tc.desc Verify slice with omitted, negative, out-of-range and reversed ranges on bigint ConcatArray
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConcatArrayBigintTest0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: collections.ConcatArray<bigint> = new collections.Array<bigint>(1n, 2n, 3n, 4n, 5n);
      const fullCopy: collections.ConcatArray<bigint> = values.slice();
      expect(fullCopy.length).assertEqual(5);
      expect(fullCopy[4]).assertEqual(5n);

      const tailSlice: collections.ConcatArray<bigint> = values.slice(2);
      expect(tailSlice.length).assertEqual(3);
      expect(tailSlice[0]).assertEqual(3n);

      const negativeSlice: collections.ConcatArray<bigint> = values.slice(-2);
      expect(negativeSlice.length).assertEqual(2);
      expect(negativeSlice[0]).assertEqual(4n);

      const mixedSlice: collections.ConcatArray<bigint> = values.slice(1, -1);
      expect(mixedSlice.length).assertEqual(3);
      expect(mixedSlice[0]).assertEqual(2n);
      expect(mixedSlice[2]).assertEqual(4n);

      const reversedSlice: collections.ConcatArray<bigint> = values.slice(3, 1);
      expect(reversedSlice.length).assertEqual(0);

      const overflowSlice: collections.ConcatArray<bigint> = values.slice(0, 100);
      expect(overflowSlice.length).assertEqual(5);

      const beyondSlice: collections.ConcatArray<bigint> = values.slice(10, 20);
      expect(beyondSlice.length).assertEqual(0);
    });

    /**
     * @tc.name testConcatArrayBigintTest0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONCAT_ARRAY_BIGINT_TEST_0800
     * @tc.desc Verify slice with -0, fraction, NaN and Infinity start indexes are normalized on bigint ConcatArray
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConcatArrayBigintTest0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: collections.ConcatArray<bigint> = new collections.Array<bigint>(1n, 2n, 3n, 4n, 5n);
      const zeroNegSlice: collections.ConcatArray<bigint> = values.slice(-0, 2);
      expect(zeroNegSlice.length).assertEqual(2);
      expect(zeroNegSlice[0]).assertEqual(1n);

      const fractionSlice: collections.ConcatArray<bigint> = values.slice(1.5, 3);
      expect(fractionSlice.length).assertEqual(2);
      expect(fractionSlice[0]).assertEqual(2n);

      const nanSlice: collections.ConcatArray<bigint> = values.slice(NaN, 2);
      expect(nanSlice.length).assertEqual(2);
      expect(nanSlice[0]).assertEqual(1n);

      const infEndSlice: collections.ConcatArray<bigint> = values.slice(1, Infinity);
      expect(infEndSlice.length).assertEqual(4);
      expect(infEndSlice[0]).assertEqual(2n);
    });

    /**
     * @tc.name testConcatArrayBigintTest0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONCAT_ARRAY_BIGINT_TEST_0900
     * @tc.desc Verify Array.concat consumes bigint ConcatArray source with order kept and source unchanged
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConcatArrayBigintTest0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: collections.ConcatArray<bigint> = new collections.Array<bigint>(4n, 5n);
      const base: Array<bigint> = new Array<bigint>(1n, 2n, 3n);
      const sourceCopy: Array<bigint> = new Array<bigint>(source.length);
      for (let i = 0; i < source.length; i++) {
        sourceCopy[i] = source[i];
      }
      const concatResult: Array<bigint> = base.concat(sourceCopy);
      expect(concatResult.length).assertEqual(5);
      expect(concatResult[0]).assertEqual(1n);
      expect(concatResult[3]).assertEqual(4n);
      expect(concatResult[4]).assertEqual(5n);
      expect(base[2]).assertEqual(3n);
      expect(source[1]).assertEqual(5n);
      expect(source[0]).assertEqual(4n);
    });

    /**
     * @tc.name testConcatArrayBigintTest0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONCAT_ARRAY_BIGINT_TEST_1000
     * @tc.desc Verify length, indexed access and join consistency on bigint ConcatArray after reuse
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConcatArrayBigintTest0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: collections.ConcatArray<bigint> = new collections.Array<bigint>(...BIGINT_CONCAT_ARRAY_VALUES);
      const joinedString: string = values.join(',');
      expect(joinedString.startsWith('1,-1,0,123,')).assertTrue();
      expect(joinedString.endsWith(',123456789012345678901234567890,9007199254740991,9007199254740991,0')).assertTrue();

      const slicedArray: collections.ConcatArray<bigint> = values.slice(0, 3);
      expect(slicedArray.length).assertEqual(3);
      expect(slicedArray.join('-')).assertEqual('1--1-0');

      expect(values[14]).assertEqual(256n);
      expect(values[2]).assertEqual(0n);
      expect(values[6]).assertEqual(9223372036854775807n);
      expect(values[15]).assertEqual(9007199254740991n);
      expect(values[16]).assertEqual(-9007199254740991n);
      expect(values[17]).assertEqual(123456789012345678901234567890n);
      expect(values.join().includes('123456789012345678901234567890')).assertTrue();
    });

  });
}
