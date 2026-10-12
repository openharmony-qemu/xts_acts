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

type ConcatFunc = (a: number, b: number) => number;

const addFunc: ConcatFunc = (a: number, b: number): number => a + b;

export default function concatArrayFunctionTest() {
  describe('ConcatArrayFunctionTest', () => {
    beforeAll(() => {});

    beforeEach(async () => {
      await sleep(30);
    });

    afterEach(() => {});

    afterAll(() => {});

    /**
     * @tc.name testConcatArrayFunctionTest0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONCAT_ARRAY_FUNCTION_TEST_0100
     * @tc.desc Verify constructing ConcatArray with non-Sendable function elements throws parameter error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConcatArrayFunctionTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let threw: boolean = false;
      try {
        const values: collections.ConcatArray<number> = new collections.Array<number>(
          nonSendableHelper.toNumber(addFunc) as number,
        );
      } catch (e) {
        threw = true;
      }
      expect(threw).assertTrue();

      let arrowThrew: boolean = false;
      try {
        const arrowFunc: number = nonSendableHelper.toNumber((a: number, b: number): number => a - b) as number;
        const arrowValues: collections.ConcatArray<number> = new collections.Array<number>(arrowFunc);
      } catch (e) {
        arrowThrew = true;
      }
      expect(arrowThrew).assertTrue();
    });

    /**
     * @tc.name testConcatArrayFunctionTest0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONCAT_ARRAY_FUNCTION_TEST_0200
     * @tc.desc Verify empty function-type ConcatArray is constructible and function stays usable outside
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConcatArrayFunctionTest0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const emptyArray: collections.ConcatArray<number> = new collections.Array<number>();
      expect(emptyArray.length).assertEqual(0);

      expect(addFunc(3, 4)).assertEqual(7);
    });
  });
}
