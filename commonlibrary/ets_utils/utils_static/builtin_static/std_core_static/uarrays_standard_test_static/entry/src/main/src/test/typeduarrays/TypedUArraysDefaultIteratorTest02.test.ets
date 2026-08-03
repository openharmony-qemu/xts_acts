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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '../../../../hypium/index';
import Utils from '../Util.test';

export default function typedUArraysDefaultIteratorTest02(): void {
  describe('TypedUArraysDefaultIteratorTest02', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_DefaultIterator0102_0100
     * @tc.name testTypedUArraysDefaultIterator0102_001
     * @tc.desc Verify for-of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysDefaultIterator0102_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([0x0000, 0x8000, 0xFFFF]);
      const collected: Array<number> = [];
      for (let i = 0; i < arr.length; i++) { const item = arr[i.toInt()];
        collected.push(item);
      }
      expect(collected[0]).assertEqual(0);
      expect(collected[1]).assertEqual(32768);
      expect(collected[2]).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_DefaultIterator0102_0200
     * @tc.name testTypedUArraysDefaultIterator0102_002
     * @tc.desc Verify for-of Uint32
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysDefaultIterator0102_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([0x00000000, 0x80000000, 0xFFFFFFFF]);
      const collected: Array<number> = [];
      for (let i = 0; i < arr.length; i++) { const item = arr[i.toInt()];
        collected.push(item);
      }
      expect(collected[0]).assertEqual(0);
      expect(collected[1]).assertEqual(2147483648);
      expect(collected[2]).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_DefaultIterator0102_0300
     * @tc.name testTypedUArraysDefaultIterator0102_003
     * @tc.desc Verify for-of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysDefaultIterator0102_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0b00000000, 0b10000000, 0b11111111]);
      const collected: Array<number> = [];
      for (let i = 0; i < arr.length; i++) { const item = arr[i.toInt()];
        collected.push(item);
      }
      expect(collected[0]).assertEqual(0);
      expect(collected[1]).assertEqual(128);
      expect(collected[2]).assertEqual(255);
    });

  });
}
