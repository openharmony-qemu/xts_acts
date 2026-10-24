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

export default function int8ArrayPropertiesPart02Test(): void {
  describe('Int8ArrayPropertiesPart02Test', (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll(async (): Promise<void> => {
      await Utils.releaseAfterEachTest();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_PROPERTIES_PART02_TEST_0100
     * @tc.name int8ArrayPropertiesPart02Test001
     * @tc.desc Verify a numeric constructor argument sets the length, with no argument and zero both yielding an empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayPropertiesPart02Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const noArg: Int8Array = new Int8Array();
      expect(noArg.length).assertEqual(0);
      const zero: Int8Array = new Int8Array(0);
      expect(zero.length).assertEqual(0);
      const one: Int8Array = new Int8Array(1);
      expect(one.length).assertEqual(1);
      const three: Int8Array = new Int8Array(3);
      expect(three.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_PROPERTIES_PART02_TEST_0200
     * @tc.name int8ArrayPropertiesPart02Test002
     * @tc.desc Verify an array source sets the length to the number of elements it carries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayPropertiesPart02Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const emptySrc: Array<int> = [];
      const fromEmpty: Int8Array = new Int8Array(emptySrc);
      expect(fromEmpty.length).assertEqual(0);
      const singleSrc: Array<int> = [7];
      const fromSingle: Int8Array = new Int8Array(singleSrc);
      expect(fromSingle.length).assertEqual(1);
      const multiSrc: Array<int> = [1, 2, 3, 4, 5];
      const fromMulti: Int8Array = new Int8Array(multiSrc);
      expect(fromMulti.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_PROPERTIES_PART02_TEST_0300
     * @tc.name int8ArrayPropertiesPart02Test003
     * @tc.desc Verify of, from over an array, from over a Set and from over another Int8Array all yield the source element count
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayPropertiesPart02Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fromOf: Int8Array = Int8Array.of(1, 2, 3);
      expect(fromOf.length).assertEqual(3);
      const emptyOf: Int8Array = Int8Array.of();
      expect(emptyOf.length).assertEqual(0);
      const fromArray: Int8Array = Int8Array.from([1, 2]);
      expect(fromArray.length).assertEqual(2);
      const setSource: Set<int> = new Set<int>();
      setSource.add(1);
      setSource.add(2);
      setSource.add(3);
      const fromSet: Int8Array = Int8Array.from(setSource);
      expect(fromSet.length).assertEqual(3);
      const typedSource: Int8Array = new Int8Array([1, 2, 3, 4]);
      const fromTyped: Int8Array = Int8Array.from(typedSource);
      expect(fromTyped.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_PROPERTIES_PART02_TEST_0400
     * @tc.name int8ArrayPropertiesPart02Test004
     * @tc.desc Verify a buffer view reports the view length rather than the underlying buffer length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayPropertiesPart02Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(8);
      const whole: Int8Array = new Int8Array(buf);
      expect(whole.length).assertEqual(8);
      const fromOffset: Int8Array = new Int8Array(buf, 3);
      expect(fromOffset.length).assertEqual(5);
      const bounded: Int8Array = new Int8Array(buf, 2, 3);
      expect(bounded.length).assertEqual(3);
      const emptyView: Int8Array = new Int8Array(buf, 4, 0);
      expect(emptyView.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_PROPERTIES_PART02_TEST_0500
     * @tc.name int8ArrayPropertiesPart02Test005
     * @tc.desc Verify a numeric argument means that many slots while a single-element source means one element, and that of and from mirror their sources
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayPropertiesPart02Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const sized: Int8Array = new Int8Array(4);
      expect(sized.length).assertEqual(4);
      expect(sized.$_get(0)).assertEqual(0);
      const fromSingle: Int8Array = new Int8Array([4]);
      expect(fromSingle.length).assertEqual(1);
      expect(fromSingle.$_get(0)).assertEqual(4);
      const ofOne: Int8Array = Int8Array.of(4);
      expect(ofOne.length).assertEqual(1);
      expect(ofOne.$_get(0)).assertEqual(4);
      const fromArray: Int8Array = Int8Array.from([1, 2]);
      expect(fromArray.length).assertEqual(2);
      expect(fromArray.$_get(1)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_PROPERTIES_PART02_TEST_0600
     * @tc.name int8ArrayPropertiesPart02Test006
     * @tc.desc Verify the length reflects the slot count independently of the values stored, including out-of-range inputs
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayPropertiesPart02Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const large: Int8Array = new Int8Array(1000);
      expect(large.length).assertEqual(1000);
      const boundaries: Int8Array = new Int8Array([-128, 127, 0, -1]);
      expect(boundaries.length).assertEqual(4);
      const repeated: Int8Array = new Int8Array([5, 5, 5, 5, 5, 5]);
      expect(repeated.length).assertEqual(6);
      const wrapped: Int8Array = new Int8Array([128, 256, -129, 1.9]);
      expect(wrapped.length).assertEqual(4);
      const single: Int8Array = new Int8Array([42]);
      expect(single.length).assertEqual(1);
    });
  });
}
