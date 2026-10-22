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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size } from '@ohos/hypium';
import { collections } from '@kit.ArkTS';

export default function Int8ArrayFromTest() {
  describe('Int8ArrayFromTest', () => {
    beforeAll(() => {
    })
    beforeEach(() => {
    })
    afterEach(() => {
    })
    afterAll(() => {
    })

    /**
     * @tc.number  SUB_TYPEDARRAY_FROM_ONE_0100
     * @tc.name    testTypedArrayFrom0001
     * @tc.desc    Verify from(ArrayLike) constructs with correct elements and length
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 2
     */
    it('testTypedArrayFrom0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let from001 = collections.Int8Array.from([1, 2, 3]);
      expect(from001.length).assertEqual(3);
      expect(from001[0]).assertEqual(1);
      expect(from001[1]).assertEqual(2);
      expect(from001[2]).assertEqual(3);
    });

    /**
     * @tc.number  SUB_TYPEDARRAY_FROM_ONE_0200
     * @tc.name    testTypedArrayFrom0002
     * @tc.desc    Verify from(ArrayLike, mapFn) applies mapping to each element
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 2
     */
    it('testTypedArrayFrom0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let from002 = collections.Int32Array.from([1, 2, 3], (v: number): number => v * 2);
      expect(from002.length).assertEqual(3);
      expect(from002[0]).assertEqual(2);
      expect(from002[1]).assertEqual(4);
      expect(from002[2]).assertEqual(6);
    });

    /**
     * @tc.number  SUB_TYPEDARRAY_FROM_ONE_0300
     * @tc.name    testTypedArrayFrom0003
     * @tc.desc    Verify from(Iterable) constructs from a TypedArray source
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 2
     */
    it('testTypedArrayFrom0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src003 = new collections.Int8Array([1, 2]);
      let from003 = collections.Float32Array.from(src003 as Iterable<number>);
      expect(from003.length).assertEqual(2);
      expect(from003[0]).assertEqual(1);
      expect(from003[1]).assertEqual(2);
    });
  })
}
