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

const BOOLEAN_CONCAT_ARRAY_VALUES: Array<boolean> = [
  true, false, true, false, true, false, true, true, false, true,
];

export default function concatArrayBooleanTest() {
  describe('ConcatArrayBooleanTest', () => {
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
     * @tc.name testConcatArrayBooleanTest0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONCAT_ARRAY_BOOLEAN_TEST_0100
     * @tc.desc Verify length property of ConcatArray with empty, single and multiple boolean elements
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConcatArrayBooleanTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const emptyArray: collections.ConcatArray<boolean> = new collections.Array<boolean>();
      expect(emptyArray.length).assertEqual(0);

      const singleArray: collections.ConcatArray<boolean> = new collections.Array<boolean>(true);
      expect(singleArray.length).assertEqual(1);

      const values: collections.ConcatArray<boolean> = new collections.Array<boolean>(...BOOLEAN_CONCAT_ARRAY_VALUES);
      expect(values.length).assertEqual(BOOLEAN_CONCAT_ARRAY_VALUES.length);
      expect(typeof values.length).assertEqual('number');
    });

    /**
     * @tc.name testConcatArrayBooleanTest0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONCAT_ARRAY_BOOLEAN_TEST_0200
     * @tc.desc Verify indexed access [index] of ConcatArray returns first, middle and last boolean elements
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConcatArrayBooleanTest0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: collections.ConcatArray<boolean> = new collections.Array<boolean>(...BOOLEAN_CONCAT_ARRAY_VALUES);
      expect(values[0]).assertEqual(BOOLEAN_CONCAT_ARRAY_VALUES[0]);
      expect(values[1]).assertEqual(BOOLEAN_CONCAT_ARRAY_VALUES[1]);
      expect(values[9]).assertEqual(BOOLEAN_CONCAT_ARRAY_VALUES[9]);
      expect(values[2]).assertTrue();
      expect(values[3]).assertFalse();
    });

    /**
     * @tc.name testConcatArrayBooleanTest0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONCAT_ARRAY_BOOLEAN_TEST_0300
     * @tc.desc Verify indexed access [index] with -0, out-of-range, negative, fraction, NaN and Infinity indexes
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConcatArrayBooleanTest0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: collections.ConcatArray<boolean> = new collections.Array<boolean>(true, false, true);
      expect(values[-0]).assertEqual(true);
      expect(values[3]).assertUndefined();
      expect(values[-1]).assertUndefined();
      expect(values[0.5]).assertUndefined();
      expect(values[NaN]).assertUndefined();
      expect(values[Infinity]).assertUndefined();
      expect(values[2]).assertTrue();
    });

    /**
     * @tc.name testConcatArrayBooleanTest0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONCAT_ARRAY_BOOLEAN_TEST_0400
     * @tc.desc Verify join with default, custom, empty, unicode and newline separators on boolean ConcatArray
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConcatArrayBooleanTest0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: collections.ConcatArray<boolean> = new collections.Array<boolean>(true, false, true);
      expect(values.join()).assertEqual('true,false,true');
      expect(values.join('-')).assertEqual('true-false-true');
      expect(values.join('')).assertEqual('truefalsetrue');
      expect(values.join('\n')).assertEqual('true\nfalse\ntrue');
      expect(values.join('—')).assertEqual('true—false—true');

      const duplicateValues: collections.ConcatArray<boolean> = new collections.Array<boolean>(false, false);
      expect(duplicateValues.join(',')).assertEqual('false,false');
    });

    /**
     * @tc.name testConcatArrayBooleanTest0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONCAT_ARRAY_BOOLEAN_TEST_0500
     * @tc.desc Verify join on empty and single element boolean ConcatArray
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConcatArrayBooleanTest0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const emptyArray: collections.ConcatArray<boolean> = new collections.Array<boolean>();
      expect(emptyArray.join()).assertEqual('');
      expect(emptyArray.join('-')).assertEqual('');

      const singleArray: collections.ConcatArray<boolean> = new collections.Array<boolean>(false);
      expect(singleArray.join()).assertEqual('false');
      expect(singleArray.join('|')).assertEqual('false');
    });

    /**
     * @tc.name testConcatArrayBooleanTest0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONCAT_ARRAY_BOOLEAN_TEST_0600
     * @tc.desc Verify slice with normal range returns new ConcatArray and keeps source unchanged
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConcatArrayBooleanTest0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: collections.ConcatArray<boolean> = new collections.Array<boolean>(true, false, true, false, true);
      const slicedArray: collections.ConcatArray<boolean> = values.slice(1, 3);
      expect(slicedArray.length).assertEqual(2);
      expect(slicedArray[0]).assertEqual(false);
      expect(slicedArray[1]).assertEqual(true);
      expect(values[4]).assertEqual(true);
      expect(values[1]).assertEqual(false);
    });

    /**
     * @tc.name testConcatArrayBooleanTest0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONCAT_ARRAY_BOOLEAN_TEST_0700
     * @tc.desc Verify slice with omitted, negative, out-of-range and reversed ranges on boolean ConcatArray
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConcatArrayBooleanTest0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: collections.ConcatArray<boolean> = new collections.Array<boolean>(true, false, true, false, true);
      const fullCopy: collections.ConcatArray<boolean> = values.slice();
      expect(fullCopy.length).assertEqual(5);
      expect(fullCopy[4]).assertEqual(true);

      const tailSlice: collections.ConcatArray<boolean> = values.slice(2);
      expect(tailSlice.length).assertEqual(3);
      expect(tailSlice[0]).assertEqual(true);

      const negativeSlice: collections.ConcatArray<boolean> = values.slice(-2);
      expect(negativeSlice.length).assertEqual(2);
      expect(negativeSlice[0]).assertEqual(false);

      const mixedSlice: collections.ConcatArray<boolean> = values.slice(1, -1);
      expect(mixedSlice.length).assertEqual(3);
      expect(mixedSlice[0]).assertEqual(false);
      expect(mixedSlice[2]).assertEqual(false);

      const reversedSlice: collections.ConcatArray<boolean> = values.slice(3, 1);
      expect(reversedSlice.length).assertEqual(0);

      const overflowSlice: collections.ConcatArray<boolean> = values.slice(0, 100);
      expect(overflowSlice.length).assertEqual(5);

      const beyondSlice: collections.ConcatArray<boolean> = values.slice(10, 20);
      expect(beyondSlice.length).assertEqual(0);
    });

    /**
     * @tc.name testConcatArrayBooleanTest0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONCAT_ARRAY_BOOLEAN_TEST_0800
     * @tc.desc Verify slice with -0, fraction, NaN and Infinity start indexes are normalized on boolean ConcatArray
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConcatArrayBooleanTest0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: collections.ConcatArray<boolean> = new collections.Array<boolean>(true, false, true, false, true);
      const zeroNegSlice: collections.ConcatArray<boolean> = values.slice(-0, 2);
      expect(zeroNegSlice.length).assertEqual(2);
      expect(zeroNegSlice[0]).assertEqual(true);

      const fractionSlice: collections.ConcatArray<boolean> = values.slice(1.5, 3);
      expect(fractionSlice.length).assertEqual(2);
      expect(fractionSlice[0]).assertEqual(false);

      const nanSlice: collections.ConcatArray<boolean> = values.slice(NaN, 2);
      expect(nanSlice.length).assertEqual(2);
      expect(nanSlice[0]).assertEqual(true);

      const infEndSlice: collections.ConcatArray<boolean> = values.slice(1, Infinity);
      expect(infEndSlice.length).assertEqual(4);
      expect(infEndSlice[0]).assertEqual(false);
    });

    /**
     * @tc.name testConcatArrayBooleanTest0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONCAT_ARRAY_BOOLEAN_TEST_0900
     * @tc.desc Verify Array.concat consumes boolean ConcatArray source with order kept and source unchanged
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConcatArrayBooleanTest0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: collections.ConcatArray<boolean> = new collections.Array<boolean>(false, true);
      const base: Array<boolean> = new Array<boolean>(true, false, true);
      const sourceCopy: Array<boolean> = new Array<boolean>(source.length);
      for (let i = 0; i < source.length; i++) {
        sourceCopy[i] = source[i];
      }
      const concatResult: Array<boolean> = base.concat(sourceCopy);
      expect(concatResult.length).assertEqual(5);
      expect(concatResult[0]).assertEqual(true);
      expect(concatResult[3]).assertEqual(false);
      expect(concatResult[4]).assertEqual(true);
      expect(base[2]).assertEqual(true);
      expect(source[1]).assertEqual(true);
      expect(source[0]).assertEqual(false);
    });

    /**
     * @tc.name testConcatArrayBooleanTest0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONCAT_ARRAY_BOOLEAN_TEST_1000
     * @tc.desc Verify length, indexed access and join consistency on boolean ConcatArray after reuse
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConcatArrayBooleanTest0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: collections.ConcatArray<boolean> = new collections.Array<boolean>(...BOOLEAN_CONCAT_ARRAY_VALUES);
      const joinedString: string = values.join(',');
      expect(joinedString).assertEqual('true,false,true,false,true,false,true,true,false,true');

      const slicedArray: collections.ConcatArray<boolean> = values.slice(0, 3);
      expect(slicedArray.length).assertEqual(3);
      expect(slicedArray.join('-')).assertEqual('true-false-true');

      expect(values[9]).assertTrue();
      expect(values[8]).assertFalse();
    });

  });
}
