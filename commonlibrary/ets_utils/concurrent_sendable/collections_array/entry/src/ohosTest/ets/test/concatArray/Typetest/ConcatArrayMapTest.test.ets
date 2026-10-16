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
import { beforeAll, beforeEach, afterEach, afterAll, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import * as nonSendableHelper from './ConcatArrayNonSendableHelper';

function sleep(time: number): Promise<void> {
  return new Promise<void>((resolve) => setTimeout(resolve, time));
}

const sampleMap: Map<string, string> = new Map<string, string>([
  ['k1', 'v1'],
  ['k2', 'v2'],
]);

export default function concatArrayMapTest() {
  describe('ConcatArrayMapTest', () => {
    beforeAll(() => {});

    beforeEach(async () => {
      await sleep(30);
    });

    afterEach(() => {});

    afterAll(() => {});

    /**
     * @tc.name testConcatArrayMapTest0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONCAT_ARRAY_MAP_TEST_0100
     * @tc.desc Verify constructing ConcatArray with non-Sendable Map elements throws parameter error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConcatArrayMapTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let threw: boolean = false;
      try {
        const mapObj: number = nonSendableHelper.toNumber(sampleMap) as number;
        const values: collections.ConcatArray<number> = new collections.Array<number>(mapObj);
      } catch (e) {
        threw = true;
      }
      expect(threw).assertTrue();

      let emptyMapThrew: boolean = false;
      try {
        const emptyMapObj: number = nonSendableHelper.toNumber(new Map<string, string>()) as number;
        const emptyValues: collections.ConcatArray<number> = new collections.Array<number>(emptyMapObj);
      } catch (e) {
        emptyMapThrew = true;
      }
      expect(emptyMapThrew).assertTrue();
    });

    /**
     * @tc.name testConcatArrayMapTest0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONCAT_ARRAY_MAP_TEST_0200
     * @tc.desc Verify empty Map-type ConcatArray is constructible and Map stays usable outside
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConcatArrayMapTest0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const emptyArray: collections.ConcatArray<number> = new collections.Array<number>();
      expect(emptyArray[0]).assertUndefined();

      expect(sampleMap.get('k1')).assertEqual('v1');
      expect(sampleMap.get('k2')).assertEqual('v2');
    });
  });
}
