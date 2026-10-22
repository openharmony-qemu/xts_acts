'use static';

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
  beforeAll,
  beforeEach,
  afterEach,
  afterAll,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType,
} from '../../../../hypium/index';
import Utils from '../Util.test';

export default function int8ArrayOverviewPart06Test(): void {
  describe('Int8ArrayOverviewPart06Test', (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll(async (): Promise<void> => {
      await Utils.releaseAfterEachTest();
    });

    const INT8_MAX = 127;
    const INT8_MIN = -128;

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_OVERVIEW_PART06_TEST_0100
     * @tc.name int8ArrayOverviewPart06Test001
     * @tc.desc Verify from over an array copies the length and values, and an empty array yields an empty result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayOverviewPart06Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [1, 2, 3];
      const arr: Int8Array = Int8Array.from(src);
      expect(arr.length).assertEqual(3);
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.$_get(2)).assertEqual(3);
      const emptySrc: Array<number> = [];
      const empty: Int8Array = Int8Array.from(emptySrc);
      expect(empty.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_OVERVIEW_PART06_TEST_0200
     * @tc.name int8ArrayOverviewPart06Test002
     * @tc.desc Verify from accepts a Set and an Int8Array, copying two elements and an independent buffer respectively
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayOverviewPart06Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Set<int> = new Set<int>();
      source.add(1);
      source.add(2);
      const fromSet: Int8Array = Int8Array.from(source);
      expect(fromSet.length).assertEqual(2);
      expect(fromSet.$_get(1)).assertEqual(2);
      const typedSrc: Int8Array = new Int8Array([5, 6, 7]);
      const fromTyped: Int8Array = Int8Array.from(typedSrc);
      expect(fromTyped.length).assertEqual(3);
      fromTyped.$_set(0, 99);
      expect(fromTyped.$_get(0)).assertEqual(99);
      expect(typedSrc.$_get(0)).assertEqual(5);
      const distinctBuffer: boolean = fromTyped.buffer !== typedSrc.buffer;
      expect(distinctBuffer).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_OVERVIEW_PART06_TEST_0300
     * @tc.name int8ArrayOverviewPart06Test003
     * @tc.desc Verify from applies the mapping function to every element before storing it
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayOverviewPart06Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [1, 2, 3];
      const doubled: Int8Array = Int8Array.from(src, (value: number, index: number): number => {
        return value * 2;
      });
      expect(doubled.length).assertEqual(3);
      expect(doubled.$_get(0)).assertEqual(2);
      expect(doubled.$_get(2)).assertEqual(6);
      const negated: Int8Array = Int8Array.from(src, (value: number, index: number): number => {
        return 0 - value;
      });
      expect(negated.$_get(0)).assertEqual(-1);
      expect(negated.$_get(2)).assertEqual(-3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_OVERVIEW_PART06_TEST_0400
     * @tc.name int8ArrayOverviewPart06Test004
     * @tc.desc Verify from applies int8 conversion to its source values, wrapping 128, 256 and truncating 1.9
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayOverviewPart06Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const wrapSrc: Array<number> = [128, 128.0];
      const wrapped: Int8Array = Int8Array.from(wrapSrc);
      expect(wrapped.$_get(0)).assertEqual(INT8_MIN);
      expect(wrapped.$_get(1)).assertEqual(INT8_MIN);
      const overflowSrc: Array<number> = [256, 255, -129];
      const overflow: Int8Array = Int8Array.from(overflowSrc);
      expect(overflow.$_get(0)).assertEqual(0);
      expect(overflow.$_get(1)).assertEqual(-1);
      expect(overflow.$_get(2)).assertEqual(INT8_MAX);
      const fractionalSrc: Array<number> = [1.9, -1.9];
      const fractional: Int8Array = Int8Array.from(fractionalSrc);
      expect(fractional.$_get(0)).assertEqual(1);
      expect(fractional.$_get(1)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_OVERVIEW_PART06_TEST_0500
     * @tc.name int8ArrayOverviewPart06Test005
     * @tc.desc Verify constructors reject a negative size, an offset past the buffer and a length that overruns the buffer with RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayOverviewPart06Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let negativeSizeThrew: boolean = false;
      try {
        const badSize: Int8Array = new Int8Array(-1);
      } catch (e) {
        negativeSizeThrew = true;
        expect(e.name).assertEqual('RangeError');
      }
      expect(negativeSizeThrew).assertTrue();
      let badOffsetThrew: boolean = false;
      try {
        const buf: ArrayBuffer = new ArrayBuffer(4);
        const badOffset: Int8Array = new Int8Array(buf, 5);
      } catch (e) {
        badOffsetThrew = true;
        expect(e.name).assertEqual('RangeError');
      }
      expect(badOffsetThrew).assertTrue();
      let badLengthThrew: boolean = false;
      try {
        const buf: ArrayBuffer = new ArrayBuffer(4);
        const badLength: Int8Array = new Int8Array(buf, 0, 5);
      } catch (e) {
        badLengthThrew = true;
        expect(e.name).assertEqual('RangeError');
      }
      expect(badLengthThrew).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_OVERVIEW_PART06_TEST_0600
     * @tc.name int8ArrayOverviewPart06Test006
     * @tc.desc Verify set rejects an offset past the target, a source that does not fit and a negative offset with RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayOverviewPart06Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let badOffsetThrew: boolean = false;
      try {
        const target: Int8Array = new Int8Array([10, 20, 30]);
        const source: Int8Array = new Int8Array([1, 2]);
        target.set(source, 3);
      } catch (e) {
        badOffsetThrew = true;
        expect(e.name).assertEqual('RangeError');
      }
      expect(badOffsetThrew).assertTrue();
      let oversizedThrew: boolean = false;
      try {
        const target: Int8Array = new Int8Array(3);
        const source: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
        target.set(source, 0);
      } catch (e) {
        oversizedThrew = true;
        expect(e.name).assertEqual('RangeError');
      }
      expect(oversizedThrew).assertTrue();
      let negativeOffsetThrew: boolean = false;
      try {
        const target: Int8Array = new Int8Array([10, 20, 30]);
        const source: Int8Array = new Int8Array([1]);
        target.set(source, -1);
      } catch (e) {
        negativeOffsetThrew = true;
        expect(e.name).assertEqual('RangeError');
      }
      expect(negativeOffsetThrew).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_OVERVIEW_PART06_TEST_0700
     * @tc.name int8ArrayOverviewPart06Test007
     * @tc.desc Verify reduce over an empty array throws TypeError without an initial value and returns the initial value when one is supplied
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayOverviewPart06Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const empty: Int8Array = new Int8Array(0);
      let threw: boolean = false;
      try {
        empty.reduce((prev: number, cur: number, idx: int, arr: Int8Array) => {
          return prev + cur;
        });
      } catch (e) {
        threw = true;
        expect(e.name).assertEqual('TypeError');
      }
      expect(threw).assertTrue();
      const withInitial: number = empty.reduce<number>((prev: number, cur: number, idx: int,
        arr: Int8Array) => {
        return prev + cur;
      }, 42);
      expect(withInitial).assertEqual(42);
      const single: Int8Array = new Int8Array([42]);
      const singleResult: number = single.reduce((prev: number, cur: number, idx: int,
        arr: Int8Array) => {
        return prev + cur;
      });
      expect(singleResult).assertEqual(42);
    });
  });
}
