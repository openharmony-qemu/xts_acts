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

export default function concatArrayNestedTest() {
  describe('ConcatArrayNestedTest', () => {
    beforeAll(() => {
    });

    beforeEach(async () => {
      await sleep(30);
    });

    afterEach(() => {
    });

    afterAll(() => {
    });

    /**
     * @tc.name testConcatArrayNestedTest0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONCAT_ARRAY_NESTED_TEST_0100
     * @tc.desc Verify constructing ConcatArray with non-Sendable nested plain array throws parameter error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConcatArrayNestedTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nested: Array<Array<number>> = [[1, 2], [3, 4]];

      let threw: boolean = false;
      try {
        const nestedObj: number = nonSendableHelper.toNumber(nested) as number;
        const values: collections.ConcatArray<number> =
          new collections.Array<number>(nestedObj);
      } catch (e) {
        threw = true;
      }
      expect(threw).assertTrue();

      let innerThrew: boolean = false;
      try {
        const innerObj: number = nonSendableHelper.toNumber([0]) as number;
        const innerValues: collections.ConcatArray<number> =
          new collections.Array<number>(innerObj, nonSendableHelper.toNumber([1, 2]) as number);
      } catch (e) {
        innerThrew = true;
      }
      expect(innerThrew).assertTrue();
    });

    /**
     * @tc.name testConcatArrayNestedTest0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONCAT_ARRAY_NESTED_TEST_0200
     * @tc.desc Verify nesting via Sendable collections.Array works as element values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConcatArrayNestedTest0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner: collections.ConcatArray<number> =
        new collections.Array<number>(1, 2, 3);

      const outer: collections.ConcatArray<collections.ConcatArray<number>> =
        new collections.Array<collections.ConcatArray<number>>(inner);
      expect(outer.length).assertEqual(1);
      expect(outer[0][0]).assertEqual(1);
      expect(outer[0][2]).assertEqual(3);

      const slicedInner: collections.ConcatArray<number> = outer[0].slice(1, 3);
      expect(slicedInner.join('-')).assertEqual('2-3');

      expect(inner[0]).assertEqual(1);
      expect(inner[2]).assertEqual(3);
      expect(inner.join('-')).assertEqual('1-2-3');
    });

    /**
     * @tc.name testConcatArrayNestedTest0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONCAT_ARRAY_NESTED_TEST_0300
     * @tc.desc Verify flat Sendable array carries nested-shape data sliced by inner ranges
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConcatArrayNestedTest0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const flat: collections.ConcatArray<number> =
        new collections.Array<number>(1, 2, 3, 4, 5, 6);
      const firstRow: collections.ConcatArray<number> = flat.slice(0, 3);
      const secondRow: collections.ConcatArray<number> = flat.slice(3, 6);

      expect(firstRow.join(',')).assertEqual('1,2,3');
      expect(secondRow.join(',')).assertEqual('4,5,6');
      expect(firstRow[2]).assertEqual(3);
      expect(secondRow[0]).assertEqual(4);
    });
  });
}
