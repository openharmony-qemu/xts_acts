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
import * as nonSendableHelper from './ConcatArrayNonSendableHelper';

function sleep(time: number): Promise<void> {
  return new Promise<void>((resolve) => setTimeout(resolve, time));
}

const sampleSet: Set<number> = new Set<number>([1, 2, 2, 1]);

export default function concatArraySetTest() {
  describe('ConcatArraySetTest', () => {
    beforeAll(() => {});

    beforeEach(async () => {
      await sleep(30);
    });

    afterEach(() => {});

    afterAll(() => {});

    /**
     * @tc.name testConcatArraySetTest0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONCAT_ARRAY_SET_TEST_0100
     * @tc.desc Verify constructing ConcatArray with non-Sendable Set elements throws parameter error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConcatArraySetTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let threw: boolean = false;
      try {
        const setObj: number = nonSendableHelper.toNumber(sampleSet) as number;
        const values: collections.ConcatArray<number> = new collections.Array<number>(setObj);
      } catch (e) {
        threw = true;
      }
      expect(threw).assertTrue();

      let specialSetThrew: boolean = false;
      try {
        const specialSet: number = nonSendableHelper.toNumber(new Set<number>([NaN, Infinity])) as number;
        const specialValues: collections.ConcatArray<number> = new collections.Array<number>(specialSet);
      } catch (e) {
        specialSetThrew = true;
      }
      expect(specialSetThrew).assertTrue();
    });

    /**
     * @tc.name testConcatArraySetTest0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONCAT_ARRAY_SET_TEST_0200
     * @tc.desc Verify empty Set-type ConcatArray is constructible and deduped Set stays usable outside
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConcatArraySetTest0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const emptyArray: collections.ConcatArray<number> = new collections.Array<number>();
      expect(emptyArray.length).assertEqual(0);

      expect(sampleSet.has(1)).assertTrue();
      expect(sampleSet.has(2)).assertTrue();
      expect(sampleSet.size).assertEqual(2);
    });
  });
}
