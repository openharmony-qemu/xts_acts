'use static'


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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '../../../../hypium/index';
import Utils from '../Util.test';

export default function typedUArraysPropertyTest02(): void {
  describe('TypedUArraysPropertyTest02', (): void => {
    beforeAll((): void => {
    });

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {
    });

    afterAll((): void => {
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Property0201_0100
     * @tc.name testTypedUArraysPropertyTestFileB001
     * @tc.desc Verify Uint16Array.BYTES_PER_ELEMENT typeof Double
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysPropertyTestFileB001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Uint16Array.BYTES_PER_ELEMENT).assertEqual(2);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Property0201_0200
     * @tc.name testTypedUArraysPropertyTestFileB002
     * @tc.desc Verify BYTES_PER_ELEMENT
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysPropertyTestFileB002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint16Array(2);
      const b = new Uint16Array(4);
      expect(Uint16Array.BYTES_PER_ELEMENT).assertEqual(Uint16Array.BYTES_PER_ELEMENT);
      expect(Uint16Array.BYTES_PER_ELEMENT).assertEqual(Uint16Array.BYTES_PER_ELEMENT);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Property0201_0300
     * @tc.name testTypedUArraysPropertyTestFileB003
     * @tc.desc Verify BYTES_PER_ELEMENT
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysPropertyTestFileB003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array(1);
      expect(Uint32Array.BYTES_PER_ELEMENT).assertEqual(Uint32Array.BYTES_PER_ELEMENT);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Property0201_0400
     * @tc.name testTypedUArraysPropertyTestFileB004
     * @tc.desc Verify BYTES_PER_ELEMENT
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysPropertyTestFileB004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint8Array(3);
      const b = new Uint8Array([1, 2, 3]);
      const c = new Uint8Array(new ArrayBuffer(3));
      expect(Uint8Array.BYTES_PER_ELEMENT).assertEqual(Uint8Array.BYTES_PER_ELEMENT);
      expect(Uint8Array.BYTES_PER_ELEMENT).assertEqual(Uint8Array.BYTES_PER_ELEMENT);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Property0201_0500
     * @tc.name testTypedUArraysPropertyTestFileB005
     * @tc.desc Verify buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysPropertyTestFileB005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(4);
      const buf1 = arr.buffer;
      const buf2 = arr.buffer;
      expect(buf1).assertEqual(buf2);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Property0201_0600
     * @tc.name testTypedUArraysPropertyTestFileB006
     * @tc.desc Verify ArrayBuffer byteOffset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysPropertyTestFileB006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const arr = new Uint8Array(buf);
      expect(arr.byteOffset).assertEqual(0);
    });


  });
}
