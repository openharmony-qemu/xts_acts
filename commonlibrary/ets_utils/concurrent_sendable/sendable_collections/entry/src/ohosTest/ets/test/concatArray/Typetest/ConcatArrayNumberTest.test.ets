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

const NUMBER_CONCAT_ARRAY_VALUES: Array<number> = [
  1, 100.5, -99.9, 0, Math.floor(1.5), 123.456, 0xcafebabe, 2 ** 3, 1.2e3, 1e3,
  2.5e-2, 0x12, 0x0102, 0x01020304, 0x3, 0o12, 0b1010, NaN, Infinity, -Infinity,
  -0, Number.MAX_VALUE, Number.MIN_VALUE, Number.EPSILON, Number.MAX_SAFE_INTEGER, Number.MIN_SAFE_INTEGER,
  -128, 127, -32768, 32767, -2147483648, 2147483647, 65535, -1, 999999.99, 13800138000, 123456, -100.5,
];

export default function concatArrayNumberTest() {
  describe('ConcatArrayNumberTest', () => {
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
     * @tc.name testConcatArrayNumberTest0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONCAT_ARRAY_NUMBER_TEST_0100
     * @tc.desc Verify length property of ConcatArray with empty, single and multiple number elements
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConcatArrayNumberTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const emptyArray: collections.ConcatArray<number> = new collections.Array<number>();
      expect(emptyArray.length).assertEqual(0);

      const singleArray: collections.ConcatArray<number> = new collections.Array<number>(42);
      expect(singleArray.length).assertEqual(1);

      const values: collections.ConcatArray<number> = new collections.Array<number>(...NUMBER_CONCAT_ARRAY_VALUES);
      expect(values.length).assertEqual(NUMBER_CONCAT_ARRAY_VALUES.length);
      expect(typeof values.length).assertEqual('number');
    });

    /**
     * @tc.name testConcatArrayNumberTest0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONCAT_ARRAY_NUMBER_TEST_0200
     * @tc.desc Verify indexed access [index] of ConcatArray returns first, middle and last number elements
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConcatArrayNumberTest0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: collections.ConcatArray<number> = new collections.Array<number>(...NUMBER_CONCAT_ARRAY_VALUES);
      expect(values[0]).assertEqual(NUMBER_CONCAT_ARRAY_VALUES[0]);
      expect(values[1]).assertEqual(NUMBER_CONCAT_ARRAY_VALUES[1]);
      expect(values[18]).assertEqual(Infinity);
      expect(values[19]).assertEqual(-Infinity);
    });

    /**
     * @tc.name testConcatArrayNumberTest0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONCAT_ARRAY_NUMBER_TEST_0300
     * @tc.desc Verify indexed access [index] with -0, out-of-range, negative, fraction, NaN and Infinity indexes
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConcatArrayNumberTest0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: collections.ConcatArray<number> = new collections.Array<number>(1, 2, 4);
      expect(values[-0]).assertEqual(1);
      expect(values[3]).assertUndefined();
      expect(values[-1]).assertUndefined();
      expect(values[0.5]).assertUndefined();
      expect(values[NaN]).assertUndefined();
      expect(values[Infinity]).assertUndefined();
      expect(values[2]).assertEqual(4);
    });

    /**
     * @tc.name testConcatArrayNumberTest0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONCAT_ARRAY_NUMBER_TEST_0400
     * @tc.desc Verify join with default, custom, empty and unicode separators on number ConcatArray
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConcatArrayNumberTest0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: collections.ConcatArray<number> = new collections.Array<number>(1, 2, 3);
      expect(values.join()).assertEqual('1,2,3');
      expect(values.join('-')).assertEqual('1-2-3');
      expect(values.join('')).assertEqual('123');
      expect(values.join('\n')).assertEqual('1\n2\n3');
      expect(values.join('—')).assertEqual('1—2—3');

      const specialValues: collections.ConcatArray<number> = new collections.Array<number>(NaN, -0, Infinity);
      expect(specialValues.join(',')).assertEqual('NaN,0,Infinity');
    });

    /**
     * @tc.name testConcatArrayNumberTest0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONCAT_ARRAY_NUMBER_TEST_0500
     * @tc.desc Verify join on empty and single element number ConcatArray
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConcatArrayNumberTest0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const emptyArray: collections.ConcatArray<number> = new collections.Array<number>();
      expect(emptyArray.join()).assertEqual('');
      expect(emptyArray.join('-')).assertEqual('');

      const singleArray: collections.ConcatArray<number> = new collections.Array<number>(7);
      expect(singleArray.join()).assertEqual('7');
      expect(singleArray.join('|')).assertEqual('7');
    });

    /**
     * @tc.name testConcatArrayNumberTest0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONCAT_ARRAY_NUMBER_TEST_0600
     * @tc.desc Verify slice with normal range returns new ConcatArray and keeps source unchanged
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConcatArrayNumberTest0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: collections.ConcatArray<number> = new collections.Array<number>(1, 2, 3, 4, 5);
      const slicedArray: collections.ConcatArray<number> = values.slice(1, 3);
      expect(slicedArray.length).assertEqual(2);
      expect(slicedArray[0]).assertEqual(2);
      expect(slicedArray[1]).assertEqual(3);
      expect(values[4]).assertEqual(5);
      expect(values[1]).assertEqual(2);
    });

    /**
     * @tc.name testConcatArrayNumberTest0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONCAT_ARRAY_NUMBER_TEST_0700
     * @tc.desc Verify slice with omitted, negative, out-of-range and reversed ranges on number ConcatArray
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConcatArrayNumberTest0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: collections.ConcatArray<number> = new collections.Array<number>(1, 2, 3, 4, 5);
      const fullCopy: collections.ConcatArray<number> = values.slice();
      expect(fullCopy.length).assertEqual(5);
      expect(fullCopy[4]).assertEqual(5);

      const tailSlice: collections.ConcatArray<number> = values.slice(2);
      expect(tailSlice.length).assertEqual(3);
      expect(tailSlice[0]).assertEqual(3);

      const negativeSlice: collections.ConcatArray<number> = values.slice(-2);
      expect(negativeSlice.length).assertEqual(2);
      expect(negativeSlice[0]).assertEqual(4);

      const mixedSlice: collections.ConcatArray<number> = values.slice(1, -1);
      expect(mixedSlice.length).assertEqual(3);
      expect(mixedSlice[0]).assertEqual(2);
      expect(mixedSlice[2]).assertEqual(4);

      const reversedSlice: collections.ConcatArray<number> = values.slice(3, 1);
      expect(reversedSlice.length).assertEqual(0);

      const overflowSlice: collections.ConcatArray<number> = values.slice(0, 100);
      expect(overflowSlice.length).assertEqual(5);

      const beyondSlice: collections.ConcatArray<number> = values.slice(10, 20);
      expect(beyondSlice.length).assertEqual(0);
    });

    /**
     * @tc.name testConcatArrayNumberTest0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONCAT_ARRAY_NUMBER_TEST_0800
     * @tc.desc Verify slice with -0, fraction, NaN and Infinity start indexes are normalized on number ConcatArray
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConcatArrayNumberTest0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: collections.ConcatArray<number> = new collections.Array<number>(1, 2, 3, 4, 5);
      const zeroNegSlice: collections.ConcatArray<number> = values.slice(-0, 2);
      expect(zeroNegSlice.length).assertEqual(2);
      expect(zeroNegSlice[0]).assertEqual(1);

      const fractionSlice: collections.ConcatArray<number> = values.slice(1.5, 3);
      expect(fractionSlice.length).assertEqual(2);
      expect(fractionSlice[0]).assertEqual(2);

      const nanSlice: collections.ConcatArray<number> = values.slice(NaN, 2);
      expect(nanSlice.length).assertEqual(2);
      expect(nanSlice[0]).assertEqual(1);

      const infEndSlice: collections.ConcatArray<number> = values.slice(1, Infinity);
      expect(infEndSlice.length).assertEqual(4);
      expect(infEndSlice[0]).assertEqual(2);
    });

    /**
     * @tc.name testConcatArrayNumberTest0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONCAT_ARRAY_NUMBER_TEST_0900
     * @tc.desc Verify Array.concat consumes number ConcatArray source with order kept and source unchanged
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConcatArrayNumberTest0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: collections.ConcatArray<number> = new collections.Array<number>(4, 5);
      const base: Array<number> = new Array<number>(1, 2, 3);
      const sourceCopy: Array<number> = new Array<number>(source.length);
      for (let i = 0; i < source.length; i++) {
        sourceCopy[i] = source[i];
      }
      const concatResult: Array<number> = base.concat(sourceCopy);
      expect(concatResult.length).assertEqual(5);
      expect(concatResult[0]).assertEqual(1);
      expect(concatResult[3]).assertEqual(4);
      expect(concatResult[4]).assertEqual(5);
      expect(base[2]).assertEqual(3);
      expect(source[1]).assertEqual(5);
      expect(source[0]).assertEqual(4);
    });

    /**
     * @tc.name testConcatArrayNumberTest0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONCAT_ARRAY_NUMBER_TEST_1000
     * @tc.desc Verify length, indexed access and join consistency on number ConcatArray after reuse
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConcatArrayNumberTest0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: collections.ConcatArray<number> = new collections.Array<number>(...NUMBER_CONCAT_ARRAY_VALUES);
      const joinedString: string = values.join(',');
      expect(joinedString.startsWith('1,100.5,-99.9,0,1,123.456,')).assertTrue();
      expect(joinedString.endsWith(',123456,-100.5')).assertTrue();

      const slicedArray: collections.ConcatArray<number> = values.slice(0, 3);
      expect(slicedArray.length).assertEqual(3);
      expect(slicedArray.join('-')).assertEqual('1-100.5--99.9');

      expect(Number.isNaN(values[17])).assertTrue();
      expect(values[18]).assertEqual(Infinity);
      expect(values[37]).assertEqual(-100.5);
      expect(values[20] === 0).assertTrue();
      expect(Number.isNaN(values[34])).assertFalse();
      expect(values[34]).assertEqual(999999.99);
      expect(values[35]).assertEqual(13800138000);
    });

  });
}
