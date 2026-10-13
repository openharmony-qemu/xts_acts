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

export default function int8ArrayOverviewPart05Test(): void {
  describe('Int8ArrayOverviewPart05Test', (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll(async (): Promise<void> => {
      await Utils.releaseAfterEachTest();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_OVERVIEW_PART05_TEST_0100
     * @tc.name int8ArrayOverviewPart05Test001
     * @tc.desc Verify fill with no bounds writes every element, fill with start keeps the prefix, fill with start and end touches only that range, and all three return this
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayOverviewPart05Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const all: Int8Array = new Int8Array(3);
      const sameInstance: boolean = all.fill(5) === all;
      expect(sameInstance).assertTrue();
      expect(all.$_get(0)).assertEqual(5);
      expect(all.$_get(1)).assertEqual(5);
      expect(all.$_get(2)).assertEqual(5);
      const fromStart: Int8Array = new Int8Array(3);
      fromStart.fill(5, 1);
      expect(fromStart.$_get(0)).assertEqual(0);
      expect(fromStart.$_get(1)).assertEqual(5);
      expect(fromStart.$_get(2)).assertEqual(5);
      const bounded: Int8Array = new Int8Array([1, 2, 3]);
      bounded.fill(9, 1, 2);
      expect(bounded.$_get(0)).assertEqual(1);
      expect(bounded.$_get(1)).assertEqual(9);
      expect(bounded.$_get(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_OVERVIEW_PART05_TEST_0200
     * @tc.name int8ArrayOverviewPart05Test002
     * @tc.desc Verify fill applies int8 conversion, accepts a negative start, and does nothing when the range is empty or starts at the end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayOverviewPart05Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const wrapped: Int8Array = new Int8Array(2);
      wrapped.fill(128);
      expect(wrapped.$_get(0)).assertEqual(-128);
      wrapped.fill(300);
      expect(wrapped.$_get(1)).assertEqual(44);
      const negative: Int8Array = new Int8Array([1, 2, 3]);
      negative.fill(9, -1);
      expect(negative.$_get(0)).assertEqual(1);
      expect(negative.$_get(2)).assertEqual(9);
      const noopStart: Int8Array = new Int8Array([1, 2, 3]);
      noopStart.fill(9, 3);
      expect(noopStart.$_get(2)).assertEqual(3);
      const noopRange: Int8Array = new Int8Array([1, 2, 3]);
      noopRange.fill(9, 2, 1);
      expect(noopRange.$_get(0)).assertEqual(1);
      expect(noopRange.$_get(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_OVERVIEW_PART05_TEST_0300
     * @tc.name int8ArrayOverviewPart05Test003
     * @tc.desc Verify copyWithin shifts elements left with a start only and copies just the requested range with both start and end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayOverviewPart05Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const shift: Int8Array = new Int8Array([1, 2, 3, 4]);
      shift.copyWithin(0, 1);
      expect(shift.$_get(0)).assertEqual(2);
      expect(shift.$_get(1)).assertEqual(3);
      expect(shift.$_get(2)).assertEqual(4);
      expect(shift.$_get(3)).assertEqual(4);
      const bounded: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      bounded.copyWithin(0, 1, 3);
      expect(bounded.$_get(0)).assertEqual(2);
      expect(bounded.$_get(1)).assertEqual(3);
      expect(bounded.$_get(2)).assertEqual(3);
      expect(bounded.$_get(3)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_OVERVIEW_PART05_TEST_0400
     * @tc.name int8ArrayOverviewPart05Test004
     * @tc.desc Verify copyWithin resolves negative target and start from the end, is a no-op when the target sits at the end, and returns this
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayOverviewPart05Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negativeTarget: Int8Array = new Int8Array([1, 2, 3]);
      negativeTarget.copyWithin(-1, 0, 1);
      expect(negativeTarget.$_get(2)).assertEqual(1);
      const negativeStart: Int8Array = new Int8Array([1, 2, 3, 4]);
      negativeStart.copyWithin(0, -1);
      expect(negativeStart.$_get(0)).assertEqual(4);
      const sameInstance: boolean = negativeStart.copyWithin(0, 0, 0) === negativeStart;
      expect(sameInstance).assertTrue();
      const noop: Int8Array = new Int8Array([1, 2, 3]);
      noop.copyWithin(3, 0, 3);
      expect(noop.$_get(0)).assertEqual(1);
      expect(noop.$_get(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_OVERVIEW_PART05_TEST_0500
     * @tc.name int8ArrayOverviewPart05Test005
     * @tc.desc Verify entries yields index and value pairs starting at zero and reports done after exactly one pair per element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayOverviewPart05Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Int8Array = new Int8Array([10, 20, 30]);
      const first = arr.entries().next();
      expect(first.done).assertFalse();
      expect(first.value![0]).assertEqual(0);
      expect(first.value![1]).assertEqual(10);
      const counter: Int8Array = new Int8Array([10, 20, 30]);
      const iter = counter.entries();
      let pairs: int = 0;
      while (!iter.next().done) {
        pairs += 1;
      }
      expect(pairs).assertEqual(3);
      const probe = counter.entries();
      probe.next();
      probe.next();
      const third = probe.next();
      expect(third.done).assertFalse();
      expect(third.value![0]).assertEqual(2);
      expect(third.value![1]).assertEqual(30);
      expect(probe.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_OVERVIEW_PART05_TEST_0600
     * @tc.name int8ArrayOverviewPart05Test006
     * @tc.desc Verify an Int8Array is directly iterable and that iteration yields its element values in ascending index order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayOverviewPart05Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Int8Array = new Int8Array([1, 2, 3]);
      let total: number = 0;
      let count: int = 0;
      for (let value of arr) {
        total = total + value;
        count += 1;
      }
      expect(total).assertEqual(6);
      expect(count).assertEqual(3);
      const negative: Int8Array = new Int8Array([-1, 0, 1]);
      let negativeTotal: number = 0;
      for (let value of negative) {
        negativeTotal = negativeTotal + value;
      }
      expect(negativeTotal).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_OVERVIEW_PART05_TEST_0700
     * @tc.name int8ArrayOverviewPart05Test007
     * @tc.desc Verify the in-place writers change element values only, leaving length, byteLength, byteOffset and buffer identity untouched
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayOverviewPart05Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Int8Array = new Int8Array([1, 2, 3]);
      const bufferRef: ArrayBuffer = arr.buffer;
      arr.fill(9);
      arr.copyWithin(0, 1);
      expect(arr.length).assertEqual(3);
      expect(arr.byteLength).assertEqual(3);
      expect(arr.byteOffset).assertEqual(0);
      const sameBuffer: boolean = arr.buffer === bufferRef;
      expect(sameBuffer).assertTrue();
      const subarrayView: Int8Array = new Int8Array([1, 2, 3]).subarray(0, 2);
      const viewOffset: int = subarrayView.byteOffset;
      subarrayView.fill(7);
      expect(subarrayView.byteOffset).assertEqual(viewOffset);
      expect(subarrayView.length).assertEqual(2);
    });
  });
}
