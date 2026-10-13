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

export default function int8ArrayKeysPart01Test(): void {
  describe('Int8ArrayKeysPart01Test', (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll(async (): Promise<void> => {
      await Utils.releaseAfterEachTest();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_KEYS_PART01_0100
     * @tc.name int8ArrayKeysPart01Test001
     * @tc.desc Verify keys() yields 0-based indexes in ascending order, value and done are both reported by the same next() result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayKeysPart01Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(3);
      let iter = arr.keys();
      let first = iter.next();
      expect(first.value).assertEqual(0);
      expect(first.done).assertFalse();
      let second = iter.next();
      expect(second.value).assertEqual(1);
      expect(second.done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_KEYS_PART01_0200
     * @tc.name int8ArrayKeysPart01Test002
     * @tc.desc Verify keys() on empty arrays, empty buffers and zero-length views yields done with undefined value on every next()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayKeysPart01Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(0);
      let iter = arr.keys();
      let first = iter.next();
      expect(first.done).assertTrue();
      expect(first.value).assertUndefined();
      let second = iter.next();
      expect(second.done).assertTrue();
      expect(second.value).assertUndefined();
      let buf: ArrayBuffer = new ArrayBuffer(0);
      let emptyView: Int8Array = new Int8Array(buf);
      let bufferFirst = emptyView.keys().next();
      expect(bufferFirst.done).assertTrue();
      expect(bufferFirst.value).assertUndefined();
      let offsetBuf: ArrayBuffer = new ArrayBuffer(4);
      let tailView: Int8Array = new Int8Array(offsetBuf, 4, 0);
      expect(tailView.keys().next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_KEYS_PART01_0300
     * @tc.name int8ArrayKeysPart01Test003
     * @tc.desc Verify full keys() traversal yields exactly 0..length-1 with one index per element and no gaps
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayKeysPart01Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(5);
      let expectedIndex: int = 0;
      let allMatch: boolean = true;
      let lastIndex: int = -1;
      for (let k of arr.keys()) {
        if (k !== expectedIndex) {
          allMatch = false;
        }
        lastIndex = k;
        expectedIndex += 1;
      }
      expect(allMatch).assertTrue();
      expect(expectedIndex).assertEqual(5);
      expect(lastIndex).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_KEYS_PART01_0400
     * @tc.name int8ArrayKeysPart01Test004
     * @tc.desc Verify iterators obtained from separate keys() calls on the same array advance independently
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayKeysPart01Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(3);
      let a = arr.keys();
      let b = arr.keys();
      a.next();
      a.next();
      let bFirst = b.next();
      expect(bFirst.value).assertEqual(0);
      expect(bFirst.done).assertFalse();
      let c = arr.keys();
      c.next();
      let cSecond = c.next();
      expect(cSecond.value).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_KEYS_PART01_0500
     * @tc.name int8ArrayKeysPart01Test005
     * @tc.desc Verify exhausted iterator keeps reporting done with undefined value and keys() traversal leaves array properties unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayKeysPart01Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(3);
      let iter = arr.keys();
      iter.next();
      iter.next();
      iter.next();
      let exhausted = iter.next();
      expect(exhausted.done).assertTrue();
      expect(exhausted.value).assertUndefined();
      let stillExhausted = iter.next();
      expect(stillExhausted.done).assertTrue();
      expect(stillExhausted.value).assertUndefined();
      let actualLen: int = arr.length;
      let expectedLen: int = 3;
      expect(actualLen).assertEqual(expectedLen);
      let actualByteLen: int = arr.byteLength;
      let expectedByteLen: int = 3;
      expect(actualByteLen).assertEqual(expectedByteLen);
      let actualByteOffset: int = arr.byteOffset;
      let expectedByteOffset: int = 0;
      expect(actualByteOffset).assertEqual(expectedByteOffset);
    });
  });
}
