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

const STRING_CONCAT_ARRAY_VALUES: Array<string> = [
  'a', 'text', '', ' ', 'hello world', 'AbC', '123', '0', 'true', 'null',
  'undefined', 'NaN', 'Infinity', '-1', '0.5', '#@!', 'a-b_c', '中文', '日本語', '한국어',
  '🎉', 'ü', 'é', '\t', '\n', '\'', '"', '\\', 'veryLongString'.repeat(3),
  'MiXeD CaSe', 'pad  spaces', 'line1\nline2',
  '​', '\u0000', 'a\r\nb', '<script>alert(1)</script>', 'https://test.com',
  '13800138000', 'test@example.com', '310101199001011234', '138****8000', '2026-03-05',
  '测试', '\u200B',
];

export default function concatArrayStringTest() {
  describe('ConcatArrayStringTest', () => {
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
     * @tc.name testConcatArrayStringTest0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONCAT_ARRAY_STRING_TEST_0100
     * @tc.desc Verify length property of ConcatArray with empty, single and multiple string elements
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConcatArrayStringTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const emptyArray: collections.ConcatArray<string> = new collections.Array<string>();
      expect(emptyArray.length).assertEqual(0);

      const singleArray: collections.ConcatArray<string> = new collections.Array<string>('only');
      expect(singleArray.length).assertEqual(1);

      const values: collections.ConcatArray<string> = new collections.Array<string>(...STRING_CONCAT_ARRAY_VALUES);
      expect(values.length).assertEqual(STRING_CONCAT_ARRAY_VALUES.length);
      expect(typeof values.length).assertEqual('number');
    });

    /**
     * @tc.name testConcatArrayStringTest0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONCAT_ARRAY_STRING_TEST_0200
     * @tc.desc Verify indexed access [index] of ConcatArray returns first, middle and last string elements
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConcatArrayStringTest0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: collections.ConcatArray<string> = new collections.Array<string>(...STRING_CONCAT_ARRAY_VALUES);
      expect(values[0]).assertEqual(STRING_CONCAT_ARRAY_VALUES[0]);
      expect(values[1]).assertEqual(STRING_CONCAT_ARRAY_VALUES[1]);
      expect(values[16]).assertEqual(STRING_CONCAT_ARRAY_VALUES[16]);
      expect(values[2]).assertEqual('');
    });

    /**
     * @tc.name testConcatArrayStringTest0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONCAT_ARRAY_STRING_TEST_0300
     * @tc.desc Verify indexed access [index] with -0, out-of-range, negative, fraction, NaN and Infinity indexes
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConcatArrayStringTest0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: collections.ConcatArray<string> = new collections.Array<string>('a', 'b', 'c');
      expect(values[-0]).assertEqual('a');
      expect(values[3]).assertUndefined();
      expect(values[-1]).assertUndefined();
      expect(values[0.5]).assertUndefined();
      expect(values[NaN]).assertUndefined();
      expect(values[Infinity]).assertUndefined();
      expect(values[2]).assertEqual('c');
    });

    /**
     * @tc.name testConcatArrayStringTest0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONCAT_ARRAY_STRING_TEST_0400
     * @tc.desc Verify join with default, custom, empty, unicode and newline separators on string ConcatArray
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConcatArrayStringTest0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: collections.ConcatArray<string> = new collections.Array<string>('a', 'b', 'c');
      expect(values.join()).assertEqual('a,b,c');
      expect(values.join('-')).assertEqual('a-b-c');
      expect(values.join('')).assertEqual('abc');
      expect(values.join('\n')).assertEqual('a\nb\nc');
      expect(values.join('—')).assertEqual('a—b—c');
      expect(values.join('中文')).assertEqual('a中文b中文c');

      const emptyStringArray: collections.ConcatArray<string> = new collections.Array<string>('', '');
      expect(emptyStringArray.join('-')).assertEqual('-');
    });

    /**
     * @tc.name testConcatArrayStringTest0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONCAT_ARRAY_STRING_TEST_0500
     * @tc.desc Verify join on empty and single element string ConcatArray
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConcatArrayStringTest0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const emptyArray: collections.ConcatArray<string> = new collections.Array<string>();
      expect(emptyArray.join()).assertEqual('');
      expect(emptyArray.join('-')).assertEqual('');

      const singleArray: collections.ConcatArray<string> = new collections.Array<string>('solo');
      expect(singleArray.join()).assertEqual('solo');
      expect(singleArray.join('|')).assertEqual('solo');
    });

    /**
     * @tc.name testConcatArrayStringTest0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONCAT_ARRAY_STRING_TEST_0600
     * @tc.desc Verify slice with normal range returns new ConcatArray and keeps source unchanged
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConcatArrayStringTest0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: collections.ConcatArray<string> = new collections.Array<string>('a', 'b', 'c', 'd', 'e');
      const slicedArray: collections.ConcatArray<string> = values.slice(1, 3);
      expect(slicedArray.length).assertEqual(2);
      expect(slicedArray[0]).assertEqual('b');
      expect(slicedArray[1]).assertEqual('c');
      expect(values[4]).assertEqual('e');
      expect(values[1]).assertEqual('b');
    });

    /**
     * @tc.name testConcatArrayStringTest0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONCAT_ARRAY_STRING_TEST_0700
     * @tc.desc Verify slice with omitted, negative, out-of-range and reversed ranges on string ConcatArray
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConcatArrayStringTest0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: collections.ConcatArray<string> = new collections.Array<string>('a', 'b', 'c', 'd', 'e');
      const fullCopy: collections.ConcatArray<string> = values.slice();
      expect(fullCopy.length).assertEqual(5);
      expect(fullCopy[4]).assertEqual('e');

      const tailSlice: collections.ConcatArray<string> = values.slice(2);
      expect(tailSlice.length).assertEqual(3);
      expect(tailSlice[0]).assertEqual('c');

      const negativeSlice: collections.ConcatArray<string> = values.slice(-2);
      expect(negativeSlice.length).assertEqual(2);
      expect(negativeSlice[0]).assertEqual('d');

      const mixedSlice: collections.ConcatArray<string> = values.slice(1, -1);
      expect(mixedSlice.length).assertEqual(3);
      expect(mixedSlice[0]).assertEqual('b');
      expect(mixedSlice[2]).assertEqual('d');

      const reversedSlice: collections.ConcatArray<string> = values.slice(3, 1);
      expect(reversedSlice.length).assertEqual(0);

      const overflowSlice: collections.ConcatArray<string> = values.slice(0, 100);
      expect(overflowSlice.length).assertEqual(5);

      const beyondSlice: collections.ConcatArray<string> = values.slice(10, 20);
      expect(beyondSlice.length).assertEqual(0);
    });

    /**
     * @tc.name testConcatArrayStringTest0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONCAT_ARRAY_STRING_TEST_0800
     * @tc.desc Verify slice with -0, fraction, NaN and Infinity start indexes are normalized on string ConcatArray
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConcatArrayStringTest0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: collections.ConcatArray<string> = new collections.Array<string>('a', 'b', 'c', 'd', 'e');
      const zeroNegSlice: collections.ConcatArray<string> = values.slice(-0, 2);
      expect(zeroNegSlice.length).assertEqual(2);
      expect(zeroNegSlice[0]).assertEqual('a');

      const fractionSlice: collections.ConcatArray<string> = values.slice(1.5, 3);
      expect(fractionSlice.length).assertEqual(2);
      expect(fractionSlice[0]).assertEqual('b');

      const nanSlice: collections.ConcatArray<string> = values.slice(NaN, 2);
      expect(nanSlice.length).assertEqual(2);
      expect(nanSlice[0]).assertEqual('a');

      const infEndSlice: collections.ConcatArray<string> = values.slice(1, Infinity);
      expect(infEndSlice.length).assertEqual(4);
      expect(infEndSlice[0]).assertEqual('b');
    });

    /**
     * @tc.name testConcatArrayStringTest0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONCAT_ARRAY_STRING_TEST_0900
     * @tc.desc Verify Array.concat consumes string ConcatArray source with order kept and source unchanged
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConcatArrayStringTest0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: collections.ConcatArray<string> = new collections.Array<string>('d', 'e');
      const base: Array<string> = new Array<string>('a', 'b', 'c');
      const sourceCopy: Array<string> = new Array<string>(source.length);
      for (let i = 0; i < source.length; i++) {
        sourceCopy[i] = source[i];
      }
      const concatResult: Array<string> = base.concat(sourceCopy);
      expect(concatResult.length).assertEqual(5);
      expect(concatResult[0]).assertEqual('a');
      expect(concatResult[3]).assertEqual('d');
      expect(concatResult[4]).assertEqual('e');
      expect(base[2]).assertEqual('c');
      expect(source[1]).assertEqual('e');
      expect(source[0]).assertEqual('d');
    });

    /**
     * @tc.name testConcatArrayStringTest0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONCAT_ARRAY_STRING_TEST_1000
     * @tc.desc Verify length, indexed access and join consistency on string ConcatArray after reuse
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConcatArrayStringTest0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: collections.ConcatArray<string> = new collections.Array<string>(...STRING_CONCAT_ARRAY_VALUES);
      const joinedString: string = values.join(',');
      expect(joinedString.endsWith('2026-03-05,测试,\u200B')).assertTrue();

      const slicedArray: collections.ConcatArray<string> = values.slice(0, 3);
      expect(slicedArray.length).assertEqual(3);
      expect(slicedArray.join('-')).assertEqual('a-text-');

      expect(values[31]).assertEqual(STRING_CONCAT_ARRAY_VALUES[31]);
      expect(values[17]).assertEqual('中文');
      expect(values[2]).assertEqual('');
    });

    /**
     * @tc.name testConcatArrayStringTest0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONCAT_ARRAY_STRING_TEST_1100
     * @tc.desc Verify indexed access and join with zero-width, NUL, CRLF, XSS and URL string elements
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConcatArrayStringTest0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const specialValues: collections.ConcatArray<string> =
        new collections.Array<string>(STRING_CONCAT_ARRAY_VALUES[32], STRING_CONCAT_ARRAY_VALUES[33],
          STRING_CONCAT_ARRAY_VALUES[34], STRING_CONCAT_ARRAY_VALUES[35], STRING_CONCAT_ARRAY_VALUES[36]);
      expect(specialValues[0]).assertEqual(STRING_CONCAT_ARRAY_VALUES[32]);
      expect(specialValues[1]).assertEqual(STRING_CONCAT_ARRAY_VALUES[33]);
      expect(specialValues[2]).assertEqual(STRING_CONCAT_ARRAY_VALUES[34]);
      expect(specialValues[3]).assertEqual('<script>alert(1)</script>');
      expect(specialValues[4]).assertEqual('https://test.com');

      const joinedXss: string = new collections.Array<string>(
        STRING_CONCAT_ARRAY_VALUES[35], STRING_CONCAT_ARRAY_VALUES[36]).join('|');
      expect(joinedXss).assertEqual('<script>alert(1)</script>|https://test.com');

      const joinedCrlf: string = new collections.Array<string>(STRING_CONCAT_ARRAY_VALUES[34]).join('-');
      expect(joinedCrlf).assertEqual('a\r\nb');
    });

    /**
     * @tc.name testConcatArrayStringTest0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONCAT_ARRAY_STRING_TEST_1200
     * @tc.desc Verify business special string elements are preserved and distinct after slice and join
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConcatArrayStringTest0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const businessValues: collections.ConcatArray<string> =
        new collections.Array<string>(STRING_CONCAT_ARRAY_VALUES[37], STRING_CONCAT_ARRAY_VALUES[38],
          STRING_CONCAT_ARRAY_VALUES[39], STRING_CONCAT_ARRAY_VALUES[40], STRING_CONCAT_ARRAY_VALUES[41]);
      expect(businessValues[0]).assertEqual('13800138000');
      expect(businessValues[1]).assertEqual('test@example.com');
      expect(businessValues[2]).assertEqual('310101199001011234');
      expect(businessValues[3]).assertEqual('138****8000');
      expect(businessValues[4]).assertEqual('2026-03-05');

      const slicedBusiness: collections.ConcatArray<string> = businessValues.slice(1, 3);
      expect(slicedBusiness.join(',')).assertEqual('test@example.com,310101199001011234');
      expect(slicedBusiness.length).assertEqual(2);

      expect(businessValues.join('#').endsWith('138****8000#2026-03-05')).assertTrue();
    });

  });
}
