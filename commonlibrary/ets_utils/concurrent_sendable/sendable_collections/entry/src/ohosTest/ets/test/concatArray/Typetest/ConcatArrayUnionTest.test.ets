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
import { beforeAll, beforeEach, afterEach, afterAll, describe, expect, it, Level, Size, TestType } from '@ohos/hypium-dynamic';

function sleep(time: number): Promise<void> {
  return new Promise<void>((resolve) => setTimeout(resolve, time));
}

type ConcatArrayUnionValue = number | string | null | undefined | boolean | bigint;

const UNION_CONCAT_ARRAY_VALUES: Array<ConcatArrayUnionValue> = [
  1,
  'text',
  null,
  undefined,
  true,
  0,
  '',
  false,
  -99.5,
  '中文',
  9999999999n,
  'line\nbreak',
  0.5,
  'emoji😀',
  Number.MAX_SAFE_INTEGER,
];

export default function concatArrayUnionTest() {
  describe('ConcatArrayUnionTest', () => {
    beforeAll(() => {});

    beforeEach(async () => {
      await sleep(30);
    });

    afterEach(() => {});

    afterAll(() => {});

    /**
     * @tc.name testConcatArrayUnionTest0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONCAT_ARRAY_UNION_TEST_0100
     * @tc.desc Verify length property of ConcatArray with empty, single and multiple union type elements
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConcatArrayUnionTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const emptyArray: collections.ConcatArray<ConcatArrayUnionValue> = new collections.Array<ConcatArrayUnionValue>();
      expect(emptyArray.length).assertEqual(0);

      const singleArray: collections.ConcatArray<ConcatArrayUnionValue> = new collections.Array<ConcatArrayUnionValue>(
        'only',
      );
      expect(singleArray.length).assertEqual(1);

      const values: collections.ConcatArray<ConcatArrayUnionValue> = new collections.Array<ConcatArrayUnionValue>(
        ...UNION_CONCAT_ARRAY_VALUES,
      );
      expect(values[9]).assertEqual(UNION_CONCAT_ARRAY_VALUES[9]);
      expect(typeof values[0]).assertEqual('number');
    });

    /**
     * @tc.name testConcatArrayUnionTest0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONCAT_ARRAY_UNION_TEST_0200
     * @tc.desc Verify indexed access [index] of ConcatArray returns union elements at first, middle and last
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConcatArrayUnionTest0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: collections.ConcatArray<ConcatArrayUnionValue> = new collections.Array<ConcatArrayUnionValue>(
        ...UNION_CONCAT_ARRAY_VALUES,
      );
      expect(values[0]).assertEqual(UNION_CONCAT_ARRAY_VALUES[0]);
      expect(values[1]).assertEqual(UNION_CONCAT_ARRAY_VALUES[1]);
      expect(values[4]).assertEqual(UNION_CONCAT_ARRAY_VALUES[4]);
      expect(values[9]).assertEqual(UNION_CONCAT_ARRAY_VALUES[9]);
      expect(values[2]).assertNull();
      expect(values[3]).assertUndefined();
    });

    /**
     * @tc.name testConcatArrayUnionTest0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONCAT_ARRAY_UNION_TEST_0300
     * @tc.desc Verify indexed access [index] with -0, out-of-range, negative, fraction, NaN and Infinity indexes
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConcatArrayUnionTest0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: collections.ConcatArray<ConcatArrayUnionValue> = new collections.Array<ConcatArrayUnionValue>(
        1,
        'a',
        true,
      );
      expect(values[-0]).assertEqual(1);
      expect(values[3]).assertUndefined();
      expect(values[-1]).assertUndefined();
      expect(values[0.5]).assertUndefined();
      expect(values[NaN]).assertUndefined();
      expect(values[Infinity]).assertUndefined();
      expect(values[2]).assertEqual(true);
    });

    /**
     * @tc.name testConcatArrayUnionTest0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONCAT_ARRAY_UNION_TEST_0400
     * @tc.desc Verify join converts both null and undefined to empty string with various separators
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConcatArrayUnionTest0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: collections.ConcatArray<ConcatArrayUnionValue> = new collections.Array<ConcatArrayUnionValue>(
        1,
        null,
        undefined,
        true,
        'a',
      );
      expect(values.join()).assertEqual('1,,,true,a');
      expect(values.join('-')).assertEqual('1---true-a');
      expect(values.join('')).assertEqual('1truea');
      expect(values.join('\n')).assertEqual('1\n\n\ntrue\na');
      expect(values.join('—')).assertEqual('1———true—a');
    });

    /**
     * @tc.name testConcatArrayUnionTest0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONCAT_ARRAY_UNION_TEST_0500
     * @tc.desc Verify join on empty and single union element ConcatArray
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConcatArrayUnionTest0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const emptyArray: collections.ConcatArray<ConcatArrayUnionValue> = new collections.Array<ConcatArrayUnionValue>();
      expect(emptyArray.join()).assertEqual('');
      expect(emptyArray.join('-')).assertEqual('');

      const singleArray: collections.ConcatArray<ConcatArrayUnionValue> = new collections.Array<ConcatArrayUnionValue>(
        undefined,
      );
      expect(singleArray.join()).assertEqual('');
      expect(singleArray.join('|')).assertEqual('');
    });

    /**
     * @tc.name testConcatArrayUnionTest0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONCAT_ARRAY_UNION_TEST_0600
     * @tc.desc Verify slice with normal range returns new ConcatArray and keeps source unchanged
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConcatArrayUnionTest0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: collections.ConcatArray<ConcatArrayUnionValue> = new collections.Array<ConcatArrayUnionValue>(
        ...UNION_CONCAT_ARRAY_VALUES,
      );
      const slicedArray: collections.ConcatArray<ConcatArrayUnionValue> = values.slice(1, 4);
      expect(slicedArray.length).assertEqual(3);
      expect(slicedArray[0]).assertEqual('text');
      expect(slicedArray[1]).assertNull();
      expect(slicedArray[2]).assertUndefined();
      expect(values[9]).assertEqual(UNION_CONCAT_ARRAY_VALUES[9]);
      expect(values[1]).assertEqual('text');
    });

    /**
     * @tc.name testConcatArrayUnionTest0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONCAT_ARRAY_UNION_TEST_0700
     * @tc.desc Verify slice with omitted, negative, out-of-range and reversed ranges on union ConcatArray
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConcatArrayUnionTest0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: collections.ConcatArray<ConcatArrayUnionValue> = new collections.Array<ConcatArrayUnionValue>(
        1,
        'a',
        null,
        'b',
        5,
      );
      const fullCopy: collections.ConcatArray<ConcatArrayUnionValue> = values.slice();
      expect(fullCopy.length).assertEqual(5);
      expect(fullCopy[4]).assertEqual(5);

      const tailSlice: collections.ConcatArray<ConcatArrayUnionValue> = values.slice(2);
      expect(tailSlice.length).assertEqual(3);
      expect(tailSlice[0]).assertNull();

      const negativeSlice: collections.ConcatArray<ConcatArrayUnionValue> = values.slice(-2);
      expect(negativeSlice.length).assertEqual(2);
      expect(negativeSlice[0]).assertEqual('b');

      const mixedSlice: collections.ConcatArray<ConcatArrayUnionValue> = values.slice(1, -1);
      expect(mixedSlice.length).assertEqual(3);
      expect(mixedSlice[0]).assertEqual('a');
      expect(mixedSlice[2]).assertEqual('b');

      const reversedSlice: collections.ConcatArray<ConcatArrayUnionValue> = values.slice(3, 1);
      expect(reversedSlice.length).assertEqual(0);

      const overflowSlice: collections.ConcatArray<ConcatArrayUnionValue> = values.slice(0, 100);
      expect(overflowSlice.length).assertEqual(5);

      const beyondSlice: collections.ConcatArray<ConcatArrayUnionValue> = values.slice(10, 20);
      expect(beyondSlice.length).assertEqual(0);
    });

    /**
     * @tc.name testConcatArrayUnionTest0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONCAT_ARRAY_UNION_TEST_0800
     * @tc.desc Verify slice with -0, fraction, NaN and Infinity start indexes are normalized on union ConcatArray
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConcatArrayUnionTest0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: collections.ConcatArray<ConcatArrayUnionValue> = new collections.Array<ConcatArrayUnionValue>(
        1,
        'a',
        null,
        'b',
        5,
      );
      const zeroNegSlice: collections.ConcatArray<ConcatArrayUnionValue> = values.slice(-0, 2);
      expect(zeroNegSlice.length).assertEqual(2);
      expect(zeroNegSlice[0]).assertEqual(1);

      const fractionSlice: collections.ConcatArray<ConcatArrayUnionValue> = values.slice(1.5, 3);
      expect(fractionSlice.length).assertEqual(2);
      expect(fractionSlice[0]).assertEqual('a');

      const nanSlice: collections.ConcatArray<ConcatArrayUnionValue> = values.slice(NaN, 2);
      expect(nanSlice.length).assertEqual(2);
      expect(nanSlice[0]).assertEqual(1);

      const infEndSlice: collections.ConcatArray<ConcatArrayUnionValue> = values.slice(1, Infinity);
      expect(infEndSlice.length).assertEqual(4);
      expect(infEndSlice[0]).assertEqual('a');
    });

    /**
     * @tc.name testConcatArrayUnionTest0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONCAT_ARRAY_UNION_TEST_0900
     * @tc.desc Verify Array.concat consumes union ConcatArray source with order kept and source unchanged
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConcatArrayUnionTest0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: collections.ConcatArray<ConcatArrayUnionValue> = new collections.Array<ConcatArrayUnionValue>(
        null,
        'tail',
      );
      const base: Array<ConcatArrayUnionValue> = new Array<ConcatArrayUnionValue>(1, 'a', true);
      const sourceCopy: Array<ConcatArrayUnionValue> = new Array<ConcatArrayUnionValue>(source.length);
      for (let i = 0; i < source.length; i++) {
        sourceCopy[i] = source[i];
      }
      const concatResult: Array<ConcatArrayUnionValue> = base.concat(sourceCopy);
      expect(concatResult.length).assertEqual(5);
      expect(concatResult[0]).assertEqual(1);
      expect(concatResult[3]).assertNull();
      expect(concatResult[4]).assertEqual('tail');
      expect(base[2]).assertEqual(true);
      expect(source[1]).assertEqual('tail');
      expect(source[0]).assertNull();
    });

    /**
     * @tc.name testConcatArrayUnionTest0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONCAT_ARRAY_UNION_TEST_1000
     * @tc.desc Verify duplicate values and mixed type consistency on union ConcatArray after slice and join
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConcatArrayUnionTest0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const duplicate: ConcatArrayUnionValue = 'dup';
      const values: collections.ConcatArray<ConcatArrayUnionValue> = new collections.Array<ConcatArrayUnionValue>(
        duplicate,
        duplicate,
        0,
        0,
        null,
        null,
      );
      expect(values[5]).assertNull();
      expect(values[0] === values[1]).assertTrue();
      expect(values[2]).assertEqual(values[3]);
      expect(values[4]).assertNull();

      const slicedArray: collections.ConcatArray<ConcatArrayUnionValue> = values.slice(0, 2);
      expect(slicedArray.join(',')).assertEqual('dup,dup');

      const joinedString: string = values.join('|');
      expect(typeof joinedString).assertEqual('string');
      expect(joinedString.includes('dup|dup')).assertTrue();
    });

    /**
     * @tc.name testConcatArrayUnionTest0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONCAT_ARRAY_UNION_TEST_1100
     * @tc.desc Verify extended union elements with bigint, emoji and MAX_SAFE_INTEGER after indexed access and join
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConcatArrayUnionTest0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: collections.ConcatArray<ConcatArrayUnionValue> = new collections.Array<ConcatArrayUnionValue>(
        ...UNION_CONCAT_ARRAY_VALUES,
      );
      expect(values[10]).assertEqual(9999999999n);
      expect(values[11]).assertEqual('line\nbreak');
      expect(values[12]).assertEqual(0.5);
      expect(values[13]).assertEqual('emoji😀');
      expect(values[14]).assertEqual(Number.MAX_SAFE_INTEGER);

      const joinedString: string = values.join(',');
      expect(joinedString.includes('9999999999')).assertTrue();
      expect(joinedString.endsWith(String(Number.MAX_SAFE_INTEGER))).assertTrue();

      const slicedArray: collections.ConcatArray<ConcatArrayUnionValue> = values.slice(10, 13);
      expect(slicedArray.length).assertEqual(3);
      expect(slicedArray.join('|')).assertEqual('9999999999|line\nbreak|0.5');
    });
  });
}
