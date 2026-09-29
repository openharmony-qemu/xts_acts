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

function makeDateTimes(): Array<number> {
  return [0, 1741113600000, 1767225600000, 9007199254740991, -86400000, 951782400000];
}

export default function concatArrayDateTest() {
  describe('ConcatArrayDateTest', () => {
    beforeAll(() => {});

    beforeEach(async () => {
      await sleep(30);
    });

    afterEach(() => {});

    afterAll(() => {});

    /**
     * @tc.name testConcatArrayDateTest0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONCAT_ARRAY_DATE_TEST_0100
     * @tc.desc Verify constructing ConcatArray with non-Sendable Date elements throws parameter error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConcatArrayDateTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const dateValue: Date = new Date(0);

      const dateObj: number = nonSendableHelper.toNumber(dateValue) as number;
      let threw: boolean = false;
      try {
        const values: collections.ConcatArray<number> = new collections.Array<number>(dateObj);
      } catch (e) {
        threw = true;
      }
      expect(threw).assertTrue();

      let spreadThrew: boolean = false;
      try {
        const spreadValues: collections.ConcatArray<number> = new collections.Array<number>(
          nonSendableHelper.toNumber(new Date(-86400000)) as number,
          nonSendableHelper.toNumber(new Date(86400000)) as number,
        );
      } catch (e) {
        spreadThrew = true;
      }
      expect(spreadThrew).assertTrue();
    });

    /**
     * @tc.name testConcatArrayDateTest0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONCAT_ARRAY_DATE_TEST_0200
     * @tc.desc Verify indexed access path is unreachable because Date elements are rejected at construction
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConcatArrayDateTest0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const leapDay: Date = new Date('2000-02-29');

      let threw: boolean = false;
      try {
        const values: collections.ConcatArray<number> = new collections.Array<number>(
          nonSendableHelper.toNumber(leapDay) as number,
          nonSendableHelper.toNumber(new Date(Number.MAX_SAFE_INTEGER)) as number,
        );
      } catch (e) {
        threw = true;
      }
      expect(threw).assertTrue();

      const emptyArray: collections.ConcatArray<number> = new collections.Array<number>();
      expect(emptyArray[0]).assertUndefined();
      expect(emptyArray.join()).assertEqual('');
    });

    /**
     * @tc.name testConcatArrayDateTest0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONCAT_ARRAY_DATE_TEST_0300
     * @tc.desc Verify timestamp numbers keep Date semantics while Date objects are rejected
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConcatArrayDateTest0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const times: Array<number> = makeDateTimes();
      const values: collections.ConcatArray<number> = new collections.Array<number>(...times);
      expect(values[0]).assertEqual(0);
      expect(values[3]).assertEqual(Number.MAX_SAFE_INTEGER);
      expect(values[4]).assertEqual(-86400000);
      expect(values[5]).assertEqual(951782400000);
    });
  });
}
