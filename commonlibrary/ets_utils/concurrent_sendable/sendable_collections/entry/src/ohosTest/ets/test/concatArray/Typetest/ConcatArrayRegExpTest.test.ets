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

const sampleRegex: RegExp = /abc/gi;

export default function concatArrayRegExpTest() {
  describe('ConcatArrayRegExpTest', () => {
    beforeAll(() => {});

    beforeEach(async () => {
      await sleep(30);
    });

    afterEach(() => {});

    afterAll(() => {});

    /**
     * @tc.name testConcatArrayRegExpTest0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONCAT_ARRAY_REGEXP_TEST_0100
     * @tc.desc Verify constructing ConcatArray with non-Sendable RegExp elements throws parameter error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConcatArrayRegExpTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let threw: boolean = false;
      try {
        const regexObj: number = nonSendableHelper.toNumber(sampleRegex) as number;
        const values: collections.ConcatArray<number> = new collections.Array<number>(regexObj);
      } catch (e) {
        threw = true;
      }
      expect(threw).assertTrue();

      let unicodeThrew: boolean = false;
      try {
        const unicodeRegex: number = nonSendableHelper.toNumber(new RegExp('特殊', 'u')) as number;
        const unicodeValues: collections.ConcatArray<number> = new collections.Array<number>(unicodeRegex);
      } catch (e) {
        unicodeThrew = true;
      }
      expect(unicodeThrew).assertTrue();
    });

    /**
     * @tc.name testConcatArrayRegExpTest0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONCAT_ARRAY_REGEXP_TEST_0200
     * @tc.desc Verify empty RegExp-type ConcatArray is constructible and RegExp stays usable outside
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConcatArrayRegExpTest0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const emptyArray: collections.ConcatArray<number> = new collections.Array<number>();
      expect(emptyArray.join()).assertEqual('');

      expect(sampleRegex.test('ABC')).assertTrue();
      expect(sampleRegex.test('xyz')).assertFalse();
    });
  });
}
