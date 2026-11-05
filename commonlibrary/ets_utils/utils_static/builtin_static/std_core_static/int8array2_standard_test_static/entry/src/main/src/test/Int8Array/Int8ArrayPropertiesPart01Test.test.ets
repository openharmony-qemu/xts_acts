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
} from '@ohos/hypium-static/src/main/indexStatic';
import Utils from '../Util.test';

export default function int8ArrayPropertiesPart01Test(): void {
  describe('Int8ArrayPropertiesPart01Test', (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll(async (): Promise<void> => {
      await Utils.releaseAfterEachTest();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_PROPERTIES_PART01_TEST_0100
     * @tc.name int8ArrayPropertiesPart01Test001
     * @tc.desc Verify the name property reads Int8Array with a length of nine, starting with a capital I and ending with a lowercase y
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayPropertiesPart01Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Int8Array = new Int8Array([1, 2, 3]);
      const actualName: string = arr.name;
      expect(actualName).assertEqual('Int8Array');
      expect(actualName.length).assertEqual(9);
      expect(actualName.charAt(0).toString()).assertEqual('I');
      expect(actualName.charAt(8).toString()).assertEqual('y');
      const empty: Int8Array = new Int8Array(0);
      expect(empty.name).assertEqual(actualName);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_PROPERTIES_PART01_TEST_0200
     * @tc.name int8ArrayPropertiesPart01Test002
     * @tc.desc Verify every construction path - new, of, from, a buffer view and a subarray - reports the same name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayPropertiesPart01Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fromNew: Int8Array = new Int8Array(2);
      const fromOf: Int8Array = Int8Array.of(1, 2);
      const fromFrom: Int8Array = Int8Array.from([1, 2]);
      const buf: ArrayBuffer = new ArrayBuffer(4);
      const fromBuffer: Int8Array = new Int8Array(buf, 1, 2);
      const host: Int8Array = new Int8Array([1, 2, 3]);
      const fromSubarray: Int8Array = host.subarray(0, 2);
      expect(fromNew.name).assertEqual('Int8Array');
      expect(fromOf.name).assertEqual('Int8Array');
      expect(fromFrom.name).assertEqual('Int8Array');
      expect(fromBuffer.name).assertEqual('Int8Array');
      expect(fromSubarray.name).assertEqual('Int8Array');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_PROPERTIES_PART01_TEST_0300
     * @tc.name int8ArrayPropertiesPart01Test003
     * @tc.desc Verify BYTES_PER_ELEMENT reads one for empty, populated, spanning and view arrays alike
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayPropertiesPart01Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const empty: Int8Array = new Int8Array(0);
      expect(empty.BYTES_PER_ELEMENT).assertEqual(1);
      const populated: Int8Array = new Int8Array([1, 2, 3]);
      expect(populated.BYTES_PER_ELEMENT).assertEqual(1);
      const buf: ArrayBuffer = new ArrayBuffer(8);
      const view: Int8Array = new Int8Array(buf, 2, 3);
      expect(view.BYTES_PER_ELEMENT).assertEqual(1);
      const boundary: Int8Array = new Int8Array([-128, 127]);
      expect(boundary.BYTES_PER_ELEMENT).assertEqual(1);
    });
  });
}
